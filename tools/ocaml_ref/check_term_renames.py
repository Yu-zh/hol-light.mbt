#!/usr/bin/env python3
"""Check that the term-variable renames change only names.

usage: check_term_renames.py [<name>_ref.ml ...]

Runs each reference script (by default, every one that loads a file
TERM_RENAMES lists, term_renames.py) twice with run.sh, with
HOL_REF_ORIGINAL_TERM_NAMES set and unset (type renames apply to both). For
the script of a renamed file, the renamed run's output must be exactly the
original's with that file's variables renamed, less the lines
TERM_RENAME_DROPS declares by count (term_renames.renamed_output:
its quotation trace and the variables of its theorems), none of the new
names may occur in the original's and none of the old in the renamed one's.
A script that only loads a renamed file must print exactly what it did: its
theorems are its own, and a variable they take from the renamed file would
show the rename. Any other difference, such as a proof search that orders
terms by name (fn sorts before fn0, fn_ after it), fails.
"""
import glob
import os
import re
import subprocess
import sys

from term_renames import TERM_RENAMES, TERM_RENAME_DROPS, renamed_output, structural_variable, uses, hol_names, decode_escaped

REF = os.path.dirname(os.path.abspath(__file__))


def run(script, original):
    env = {k: v for k, v in os.environ.items() if not k.startswith('HOL_REF_ORIGINAL_')}
    if original:
        env['HOL_REF_ORIGINAL_TERM_NAMES'] = '1'
    res = subprocess.run(['./run.sh', script], cwd=REF, env=env, capture_output=True, text=True)
    if res.returncode != 0:
        sys.exit(f'run.sh {script} failed (exit {res.returncode})')
    return re.sub(r'(?m)^CPU time \(user\): .*$', 'CPU time (user): <t>', res.stdout)


def in_scope(output, target):
    lines = output.splitlines()
    for i, line in enumerate(lines):
        if line.startswith(target + ' quotations ('):
            return lines[i:]
    sys.exit(f'no quotation trace for {target}')


def names_in(lines, renames, new):
    """Old (or new) names used in these output lines: as structural
    variables, or as names in quotation-trace lines."""
    found, trace = set(), False
    stems = {n.rstrip("'") for n in renames.values()} if new else set(renames)
    var = structural_variable({s: s for s in stems})
    for line in lines:
        if re.match(r'.* quotations \(\d+\):$', line):
            trace = True
            continue
        if trace and line.startswith('  '):
            found |= set(uses(hol_names(decode_escaped(line[2:])), renames, new))
            continue
        trace = False
        found |= {m[1] + m[2] for m in var.finditer(line)}
    return found


def check(script):
    text = open(os.path.join(REF, script)).read()
    loaded = [p for p in TERM_RENAMES if f'#use "{p}"' in text]
    traces = re.findall(r'(?m)^show_trace "([^"]+)";;$', text)
    target = traces[-1] if traces else None
    own = next((p for p in loaded if p[:-3] == target), None)
    original, renamed = run(script, True), run(script, False)
    problems = []
    if own:
        renames = TERM_RENAMES[own]
        if names_in(in_scope(original, target), renames, new=True):
            problems.append(f'new names already in the original output: {sorted(names_in(in_scope(original, target), renames, True))}')
        if names_in(in_scope(renamed, target), renames, new=False):
            problems.append(f'old names left in the renamed output: {sorted(names_in(in_scope(renamed, target), renames, False))}')
        # the theorems the script prints (attempt "NAME" ...); a constant
        # renamed by mistake shows in its constants line, which stays
        theorems = set(re.findall(r'(?m)^attempt "([^"]+)"', text))
        expected = renamed_output(original, target, renames, theorems)
        # the lines the rename is declared to remove, by exact count
        for line, n in TERM_RENAME_DROPS.get(own, {}).items():
            had, has = expected.splitlines().count(line), renamed.splitlines().count(line)
            if had - has != n:
                problems.append(f'{line!r}: {had} lines before, {has} after; {n} should go')
            drop = lambda out: ''.join(l for l in out.splitlines(keepends=True) if l.rstrip('\n') != line)
            expected, renamed = drop(expected), drop(renamed)
    else:
        expected = original
    if expected != renamed:
        a, b = expected.splitlines(), renamed.splitlines()
        i = next((i for i, (x, y) in enumerate(zip(a, b)) if x != y), min(len(a), len(b)))
        problems.append(f'output differs at line {i + 1}:\n    expected {a[i][:200] if i < len(a) else "<end>"!r}\n'
                        f'    got      {b[i][:200] if i < len(b) else "<end>"!r}')
    for p in problems:
        print(f'{script}: {p}')
    if not problems:
        what = ', '.join(f'{o} -> {n}' for o, n in TERM_RENAMES[own].items()) if own else 'unchanged'
        print(f'{script}: ok ({what})')
    return not problems


def main():
    scripts = [os.path.basename(s) for s in sys.argv[1:]] or sorted(
        os.path.basename(s) for s in glob.glob(os.path.join(REF, '*_ref.ml'))
        if any(f'#use "{p}"' in open(s).read() for p in TERM_RENAMES))
    if not all([check(s) for s in scripts]):
        sys.exit(1)


if __name__ == '__main__':
    main()
