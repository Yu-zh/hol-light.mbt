#!/usr/bin/env python3
"""Check a global term-variable rename on one reference script.

usage: check_global_renames.py [--save DIR] [--from-saved DIR] <name>_ref.ml ...

GLOBAL_TERM_RENAMES (term_renames.py) names variables that core theories put
in theorems every theory uses: define_type's and num_RECURSION's fn. Unlike
TERM_RENAMES' file-scoped renames, which check_term_renames.py checks, such a
rename shows in the output of every script. This runs a script with
run.sh twice, with HOL_REF_ORIGINAL_TERM_NAMES set and unset, and requires the
renamed run's output to be exactly the original's with:

- every structural variable of a renamed family, in the theorems the script
  prints, renamed (fn, fn', ... become fn_, fn_', ...), as is the script's
  own file's TERM_RENAMES from its quotation trace on;
- every quotation trace renamed as its file's sources are: TERM_RENAMES of
  that file, and the global renames but in GLOBAL_EXCEPT's files.

No new name may occur in the original's output (two variables would merge),
and no old name in the renamed one's. Nothing else is normalized: any other
difference, such as an order that follows names (fn sorts before fn0, fn_
after it), is a failure, reported with its first differing line.
"""
import gzip
import os
import re
import subprocess
import sys

from term_renames import (GLOBAL_EXCEPT, GLOBAL_TERM_RENAMES, TERM_RENAMES, decode_escaped, encode_escaped,
                          hol_names, rename_in_hol, structural_variable, uses)

REF = os.path.dirname(os.path.abspath(__file__))
HEADER = re.compile(r'(.*) quotations \(\d+\):$')
THEOREM = re.compile(r'(\S+) = ')


def run(script, original):
    env = {k: v for k, v in os.environ.items() if not k.startswith('HOL_REF_ORIGINAL_')}
    if original:
        env['HOL_REF_ORIGINAL_TERM_NAMES'] = '1'
    res = subprocess.run(['./run.sh', script], cwd=REF, env=env, capture_output=True, text=True)
    if res.returncode != 0:
        tail = (res.stdout + res.stderr)[-1500:]
        raise RuntimeError(f'run.sh failed (exit {res.returncode}, {"original" if original else "renamed"} run)\n{tail}')
    return re.sub(r'(?m)^CPU time \(user\): .*$', 'CPU time (user): <t>', res.stdout)


def file_renames(stem):
    """TERM_RENAMES of the upstream file `stem` (no extension), or {}."""
    return next((r for p, r in TERM_RENAMES.items() if p.rsplit('.', 1)[0] == stem), {})


def trace_renames(stem):
    """What a quotation in `stem`'s trace is renamed by."""
    return {**({} if stem in GLOBAL_EXCEPT else GLOBAL_TERM_RENAMES), **file_renames(stem)}


def renamed_output(output, target, theorems):
    """`output` as the rename should leave it."""
    own = {**GLOBAL_TERM_RENAMES, **file_renames(target)} if target else GLOBAL_TERM_RENAMES
    everywhere = structural_variable(GLOBAL_TERM_RENAMES)
    in_scope = structural_variable(own)
    out, trace, stem, scope = [], False, None, False
    for line in output.splitlines(keepends=True):
        m = HEADER.match(line.rstrip('\n'))
        if m:
            trace, stem = True, m[1]
            scope = scope or stem == target
            out.append(line)
            continue
        if trace and line.startswith('  '):
            renames = trace_renames(stem)
            body = line[2:].rstrip('\n')
            out.append('  ' + encode_escaped(rename_in_hol(decode_escaped(body), renames)) + '\n' if renames else line)
            continue
        trace = False
        t = THEOREM.match(line)
        if t and t[1] in theorems:
            var, names = (in_scope, own) if scope else (everywhere, GLOBAL_TERM_RENAMES)
            line = var.sub(lambda v: names[v[1]] + v[2], line)
        out.append(line)
    return ''.join(out)


def inventory(output, renames, theorems, new):
    """Names of the renamed (with `new`, new) families in the output's
    theorems and quotation traces (but GLOBAL_EXCEPT's)."""
    stems = {n: n for n in renames.values()} if new else {o: o for o in renames}
    var = structural_variable(stems)
    found, trace, stem = set(), False, None
    for line in output.splitlines():
        m = HEADER.match(line)
        if m:
            trace, stem = True, m[1]
            continue
        if trace and line.startswith('  '):
            if stem not in GLOBAL_EXCEPT:
                found |= set(uses(hol_names(decode_escaped(line[2:])), renames, new))
            continue
        trace = False
        t = THEOREM.match(line)
        if t and t[1] in theorems:
            found |= {v[1] + v[2] for v in var.finditer(line)}
    return found


def first_difference(a, b):
    x, y = a.splitlines(), b.splitlines()
    i = next((i for i, (p, q) in enumerate(zip(x, y)) if p != q), min(len(x), len(y)))
    p, q = (x[i] if i < len(x) else '<end>'), (y[i] if i < len(y) else '<end>')
    j = next((j for j, (c, d) in enumerate(zip(p, q)) if c != d), min(len(p), len(q)))
    return (f'output differs at line {i + 1} ({len(x)} expected, {len(y)} actual), column {j}:\n'
            f'    expected ...{p[max(0, j - 120):j + 160]!r}\n    got      ...{q[max(0, j - 120):j + 160]!r}')


def check_outputs(script, original, renamed):
    """The problems of a pair of outputs of `script`."""
    text = open(os.path.join(REF, script)).read()
    traces = re.findall(r'(?m)^show_trace "([^"]+)";;$', text)
    target = traces[-1] if traces else None
    theorems = set(re.findall(r'(?m)^attempt "([^"]+)"', text))
    all_renames = {**GLOBAL_TERM_RENAMES, **(file_renames(target) if target else {})}
    problems = []
    if clash := inventory(original, all_renames, theorems, new=True):
        problems.append(f'new names already in the original output: {sorted(clash)[:8]}')
    if left := inventory(renamed, all_renames, theorems, new=False):
        problems.append(f'old names left in the renamed output: {sorted(left)[:8]}')
    expected = renamed_output(original, target, theorems)
    if expected != renamed:
        problems.append(first_difference(expected, renamed))
    return problems


def saved(directory, script, kind):
    return os.path.join(directory, f'{script[:-3]}.{kind}.gz')


def check(script, save, load):
    if load:
        original = gzip.open(saved(load, script, 'original'), 'rt', encoding='utf-8', errors='surrogateescape').read()
        renamed = gzip.open(saved(load, script, 'renamed'), 'rt', encoding='utf-8', errors='surrogateescape').read()
    else:
        original = run(script, True)
        renamed = run(script, False)
        if save:
            os.makedirs(save, exist_ok=True)
            for kind, text in (('original', original), ('renamed', renamed)):
                with gzip.open(saved(save, script, kind), 'wt', encoding='utf-8', errors='surrogateescape',
                               compresslevel=6) as f:
                    f.write(text)
    problems = check_outputs(script, original, renamed)
    n = len(re.findall(r"(?<=[(\\ ])fn_'*(?=:)", renamed))
    for p in problems:
        print(f'{script}: {p}')
    if not problems:
        print(f'{script}: ok ({n} renamed occurrences in theorems)')
    return not problems


def main():
    args, save, load = sys.argv[1:], None, None
    if args[:1] == ['--save']:
        save, args = args[1], args[2:]
    if args[:1] == ['--from-saved']:
        load, args = args[1], args[2:]
    ok = True
    for s in args:
        try:
            ok = check(os.path.basename(s), save, load) and ok
        except RuntimeError as e:
            print(f'{s}: {e}')
            ok = False
    sys.exit(0 if ok else 1)


if __name__ == '__main__':
    main()
