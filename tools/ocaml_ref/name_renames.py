"""Renames of HOL constants and type constants the term syntax cannot name.

The port names them differently from upstream (issue #140):

- Jordan's local definitions (Jordan/lib_ext.ml's local_definition) are
  constants named package'name (euclid'dot, jordan'top2). They become
  package_name (euclid_dot, jordan_top2): local_definition joins with `_`.
- Geometric algebra's pseudo-finite types (define_pseudo_finite_type n) are
  named '0 .. '4, with constants mk_/dest_auto_define_finite_type_'n. They
  become Zero .. Four, and a larger n keeps its name (the term syntax
  writes a type constant capitalised; zero, one, ... would collide with
  type variables such as Multivariate's `one`).

- Constants named like MoonBit keywords (move, while, assert, break,
  abstract, typeof) become keyword_ (move_). Unlike the names above these
  are renamed only in the files KEYWORD_CONSTANTS lists, which define or
  use the constant: elsewhere the same word can be something else (core
  wf.ml binds a variable `while`). OCaml code naming the constant's
  theorem (let move = new_definition ...) stays.

Each listed upstream file is loaded from a copy (forall_reference.py,
unless HOL_REF_ORIGINAL_NAMES is set) built by its checked patches (each
text must occur once) and by renaming the old names in its quotations;
any old name left outside comments, or a new name already used in the
file, fails the copy. check_name_renames.py checks that OCaml's output
changes by exactly these names, which are global: every whole HOL name.
"""
import re

from term_renames import decode_escaped, encode_escaped, hol_spans

PSEUDO_TYPES = {"'0": 'Zero', "'1": 'One', "'2": 'Two', "'3": 'Three', "'4": 'Four'}
LOCAL_DEFINITION = re.compile(r"(euclid|trig|jordan)'([A-Za-z0-9_]+'*)")
PSEUDO_CONSTANT = re.compile(r"(mk|dest)_auto_define_finite_type_('[0-4])")

NAME_PATCHES = {
    'Jordan/lib_ext.ml': [
        # a package name has no _, so package_name splits one way only
        ('let cname\' = package_name^"\'"^cname in',
         'let cname\' = if String.contains package_name \'_\' then failwith "local_definition: a package name with _" '
         'else package_name^"_"^cname in'),
        # each constant's upstream name, for tactics_fix's hash_of_term
        ('let local_definition package_name tm =',
         'let local_upstream_names = Hashtbl.create 300;;\n\nlet local_definition package_name tm ='),
        ("  let _ = (local_defs := (package_name,(cname,lv'))::(!local_defs)) in",
         "  let _ = (local_defs := (package_name,(cname,lv'))::(!local_defs)) in\n"
         "  let _ = Hashtbl.replace local_upstream_names cname' (package_name^\"'\"^cname) in"),
    ],
    # Jordan's proofs pick hypotheses by hash numbers (UNDH 3313), which
    # hash_of_term computes from constants' names: it hashes a local
    # definition under its upstream name, as the port's does
    'Jordan/tactics_fix.ml': [
        ('(prime220*(memhash_of_string s) + hash_of_type t) mod prime1220',
         '(prime220*(memhash_of_string (try Hashtbl.find local_upstream_names s with Not_found -> s))'
         ' + hash_of_type t) mod prime1220'),
    ],
    'Jordan/misc_defs_and_lemmas.ml': [],
    'Geometric_Algebra/geometricalgebra.ml': [
        # upstream defines 0 .. 4; a larger n keeps upstream's name
        ('let ns = "\'"^string_of_int n in',
         'let ns = if 0 <= n && n <= 4 then List.nth ["Zero";"One";"Two";"Three";"Four"] n '
         'else "\'"^string_of_int n in'),
    ],
    'Geometric_Algebra/quaternions.ml': [],
}

# upstream file -> {old constant: new}, in the files that define or use it
KEYWORD_CONSTANTS = {
    'Examples/inverse_bug_puzzle_tac.ml': {'move': 'move_'},
    'Tutorial/Inductive_definitions.ml': {'move': 'move_'},
    'Tutorial/Semantics_of_programming_languages_shallow.ml': {'while': 'while_', 'assert': 'assert_'},
    'Logic/given.ml': {'break': 'break_'},
    'Model/modelset.ml': {'abstract': 'abstract_'},
    'Model/syntax.ml': {'typeof': 'typeof_'},
    'Model/semantics.ml': {'abstract': 'abstract_', 'typeof': 'typeof_'},
}
for _path in KEYWORD_CONSTANTS:
    NAME_PATCHES.setdefault(_path, [])
# callees whose string names assumptions or cases, not HOL names
KEYWORD_LABEL_CALLEES = ('cases',)
# a constant is global: every keyword constant, under its one new name
ALL_KEYWORD_CONSTANTS = {}
for _renames in KEYWORD_CONSTANTS.values():
    for _old, _new in _renames.items():
        assert ALL_KEYWORD_CONSTANTS.setdefault(_old, _new) == _new, f'{_old} renamed two ways'
assert len(set(ALL_KEYWORD_CONSTANTS.values())) == len(ALL_KEYWORD_CONSTANTS), 'keyword renames not injective'


def trace_file(header):
    """The upstream file (in KEYWORD_CONSTANTS) whose quotation trace a
    header line opens ('Model/syntax quotations (3):'), or None."""
    m = re.match(r'(.*) quotations \(\d+\):$', header)
    return next((p for p in KEYWORD_CONSTANTS if m and p.rsplit('.', 1)[0] == m[1]), None)


HOL_TOKEN = re.compile(r"[A-Za-z0-9_']+")


def renamed_name(name, keywords=None):
    """The new name of the constant or type constant `name`, or None; with
    `keywords` (a file's KEYWORD_CONSTANTS), keyword constants too."""
    if keywords and name in keywords:
        return keywords[name]
    if name in PSEUDO_TYPES:
        return PSEUDO_TYPES[name]
    if m := LOCAL_DEFINITION.fullmatch(name):
        return m[1] + '_' + m[2]
    if m := PSEUDO_CONSTANT.fullmatch(name):
        return f'{m[1]}_auto_define_finite_type_{PSEUDO_TYPES[m[2]]}'
    return None


def rename_tokens(text, keywords=None):
    """`text` with every whole HOL name that is renamed replaced."""
    return HOL_TOKEN.sub(lambda m: renamed_name(m[0], keywords) or m[0], text)


def rename_hol(q, op=False, keywords=None):
    """The HOL (or, with `op`, term-syntax) quotation text q with its renamed
    names replaced: names only, not string literals or comments (a string
    "euclid'dot" is data). With `op`, an op_ spelling of a renamed name too."""
    out, last = [], 0
    for start, end, kind in hol_spans(q):
        if kind != 'name':
            continue
        name = q[start:end]
        new = renamed_name(op_unescaped(name), keywords) if op and OP_NAME.fullmatch(name) else None
        out.append(q[last:start])
        out.append(new or renamed_name(name, keywords) or name)
        last = end
    out.append(q[last:])
    return ''.join(out)


def hol_names(q):
    """The names in HOL quotation text (not its strings or comments)."""
    return [q[s:e] for s, e, kind in hol_spans(q) if kind == 'name']


def old_names(text, keywords=None):
    return {t for t in HOL_TOKEN.findall(text) if renamed_name(t, keywords)}


def rename_names(text, patches, path=None):
    """An upstream file's renamed copy: `patches` applied, then the renamed
    names (and `path`'s KEYWORD_CONSTANTS) replaced in its quotations. Fails
    on an old name left outside comments (a keyword constant: in a quotation
    or string; OCaml code naming its theorem is not a HOL name), and on a new
    name the file already uses."""
    from forall_reference import checked_segments
    keywords = KEYWORD_CONSTANTS.get(path, {})
    segments = checked_segments(text)
    used = {t for kind, piece in segments if kind != 'comment' for t in HOL_TOKEN.findall(piece)}
    for t in old_names(' '.join(piece for kind, piece in segments if kind == 'quotation'), keywords):
        assert renamed_name(t, keywords) not in used, f'{renamed_name(t, keywords)} is already used'
    for old, new in patches:
        assert text.count(old) == 1, f'patch target changed: {old}'
        text = text.replace(old, new)
    out = []
    for kind, piece in checked_segments(text):
        piece = piece.split('\0')[0] if kind == 'string' else piece
        out.append(rename_hol(piece, keywords=keywords) if kind == 'quotation' else piece)
    text = ''.join(out)
    segments = checked_segments(text)
    left = old_names(' '.join(p for k, p in segments if k != 'comment'))
    # a keyword constant's name in a quotation, or in a string that is no
    # assumption label (cases "Ncol | move | col_Nmove" names cases)
    from term_renames import LABEL_CALLEES, callee_before
    at, texts = 0, []
    for k, p in segments:
        piece = p.split('\0')[0] if k == 'string' else p
        if k == 'quotation' or (k == 'string' and callee_before(text, at) not in LABEL_CALLEES + KEYWORD_LABEL_CALLEES):
            texts.append(p)
        at += len(piece)
    left |= {t for t in old_names(' '.join(texts), keywords) if t in keywords}
    assert not left, f'old names left outside quotations: {sorted(left)[:5]}'
    return text


# The names of constants and type constants in output check_name_renames.py
# makes (HOL_REF_QUOTED_NAMES, prelude.ml): the results of the script's
# probes (NAME = ...) write them #"name" (escaped), a variable "name" and a
# type variable '"name"; and its constants and types lines list them (name,
# name/arity). A variable or type variable is no such name, nor is text in
# any other line (a failure's message, NAME ! ...): renaming one is a
# difference. Quotation traces are text, renamed as the sources are.
MARKED_NAME = re.compile(r'#"((?:[^"\\]|\\.)*)"')
LISTING = re.compile(r'(constants|types) = ')
RESULT = re.compile(r'\S+ = ')


def listed(kind, item):
    """A listing's item: a constant's name, or a type's name/arity."""
    if kind == 'types':
        name, sep, arity = item.rpartition('/')
        return name, sep + arity
    return item, ''


def constant_names(line):
    """The constants' and type constants' names in a line of output."""
    if m := LISTING.match(line):
        return [listed(m[1], item)[0] for item in line[m.end():].split()]
    if RESULT.match(line):
        return [decode_escaped(n) for n in MARKED_NAME.findall(line)]
    return []


def rename_structural(line):
    keywords = ALL_KEYWORD_CONSTANTS
    if m := LISTING.match(line):
        def item(it):
            name, rest = listed(m[1], it)
            return (renamed_name(name, keywords) or name) + rest
        return line[:m.end()] + ' '.join(item(it) for it in line[m.end():].rstrip('\n').split(' ')) + \
            ('\n' if line.endswith('\n') else '')
    if not RESULT.match(line):
        return line
    def one(m):
        new = renamed_name(decode_escaped(m[1]), keywords)
        return '#"' + encode_escaped(new) + '"' if new else m[0]
    return MARKED_NAME.sub(one, line)


def renamed_output(output, target=None):
    """Reference output (made with HOL_REF_QUOTED_NAMES) with the names
    renamed: trace lines (OCaml-escaped quotation text) decoded first and
    renamed as the sources are; every other line in its constants' and type
    constants' names only. A quotation's text does not say which of its names
    are constants: a free variable spelt like a renamed constant would be
    renamed in the copies and here alike, and differ only in a theorem the
    script prints (in the files renamed, every such name is the constant)."""
    # a keyword constant's own file can bind a variable of its name (an
    # inductive definition's rules bind the predicate `while` before it is
    # the constant): from that file's trace on, its theorems' variables of
    # those names are renamed too
    own = KEYWORD_CONSTANTS.get(target, {}) if target else {}
    stems = '|'.join(map(re.escape, own))
    variable = re.compile(r'(?<=[(\\ ])"(' + stems + r')(\'*)"(?=:)') if own else None
    header = target.rsplit('.', 1)[0] + ' quotations (' if target else None
    out, trace, keywords, scope = [], False, None, False
    for line in output.splitlines(keepends=True):
        if header and line.startswith(header):
            scope = True
        if variable and scope and RESULT.match(line) and not re.match(r'.* quotations \(\d+\):$', line.rstrip('\n')):
            line = variable.sub(lambda m: '"' + own[m[1]] + m[2] + '"', line)
        if re.match(r'.* quotations \(\d+\):$', line.rstrip('\n')):
            trace = True
            file = trace_file(line.rstrip('\n'))
            keywords = KEYWORD_CONSTANTS[file] if file else None
        elif trace and line.startswith('  '):
            out.append('  ' + encode_escaped(rename_hol(decode_escaped(line[2:].rstrip('\n')), keywords=keywords))
                       + '\n')
            continue
        else:
            trace = False
        out.append(rename_structural(line))
    return ''.join(out)


# The port: the term syntax spells a renamed constant op_<package>_prime_...
# (names.mbt's escape), which becomes the plain new name.
CHAR_NAMES = {'dollar': '$', 'dot': '.', 'eq': '=', 'lt': '<', 'gt': '>', 'at': '@', 'q': '?',
              'bang': '!', 'pct': '%', 'amp': '&', 'bar': '|', 'tilde': '~', 'star': '*',
              'plus': '+', 'minus': '-', 'slash': '/', 'bslash': '\\', 'caret': '^', 'hash': '#',
              'prime': "'", 'colon': ':', 'comma': ',', 'us': '_'}
OP_NAME = re.compile(r'(?<![A-Za-z0-9_])op_[A-Za-z0-9_]+')


def op_unescaped(ident):
    return ''.join(CHAR_NAMES.get(p, p) for p in ident[3:].split('_'))


def rename_term_syntax(q):
    """A term-syntax quotation with renamed constants' op_ spellings, and
    any old name, replaced by the new name (not in its strings)."""
    return rename_hol(q, op=True)


MBT_CALL = re.compile(r'(@(parser|term_syntax)\.parse_(term|type)\(")((?:[^"\\\n]|\\.)*)("\))')


def rename_moonbit(text, patches=(), keywords=None):
    """A port source with the names renamed in its quotations (old syntax:
    HOL names; term syntax: op_ spellings too), with `keywords` (its
    upstream file's KEYWORD_CONSTANTS) too, and `patches` applied. Fails on
    an old name left in any string but an assumption label."""
    from term_renames import LABEL_CALLEES, callee_before, mbt_escape, mbt_unescape
    for old, new in patches:
        assert text.count(old) == 1, f'patch target changed: {old}'
        text = text.replace(old, new)
    def call(m):
        body = mbt_unescape(m[4])
        body = rename_hol(body, op=m[2] == 'term_syntax', keywords=keywords)
        return m[1] + mbt_escape(body) + m[5]
    text = MBT_CALL.sub(call, text)
    for m in re.finditer(r'"((?:[^"\\\n]|\\.)*)"', text):
        body = mbt_unescape(m[1])
        assert not old_names(body), f'old name left in a string: {sorted(old_names(body))[:3]}'
        assert not [o for o in OP_NAME.findall(body) if renamed_name(op_unescaped(o), keywords)], \
            f'op_ spelling of an old name left: {m[1][:80]}'
        # a theorem's cell is named after its OCaml value (let move = ...)
        cell = text[:m.start()].endswith('Cell::new(')
        if keywords and not cell and callee_before(text, m.start()) not in LABEL_CALLEES + KEYWORD_LABEL_CALLEES:
            left = {t for t in old_names(body, keywords) if t in keywords}
            assert not left, f'keyword constant left in a string: {sorted(left)} in {m[1][:80]}'
    return text
