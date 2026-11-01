"""Rename term variables the term syntax cannot write (issue #140).

Some upstream theories name variables like MoonBit keywords (fn, enum, as,
...), or _, which the term syntax reads as a type hole. The port renames
them, keyword to keyword_ (fn -> fn_) and _ to _any, in its sources
and in a copy of the upstream file the OCaml reference loads (as
TYPE_RENAMES does for type variables, forall_reference.py), and
check_term_renames.py checks that the reference output changes only by
those names.

A rename maps a stem and its primed variants: fn, fn', fn'' become fn_,
fn_', fn_'' (HOL's variant() adds primes to avoid capture, so a family is
renamed whole). Only term-variable occurrences are renamed: names in HOL
quotations outside type annotations and HOL strings, and the variable-name
string of the callees in NAME_CALLEES. An assumption label (LABEL_TAC
"fn") is another namespace and stays. Anything else naming an old variable
fails, as does a new name already in use anywhere: those need a look.
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from hol_notation import IDENT

# upstream file -> {old stem: new stem}
TERM_RENAMES = {
    'Logic/linear.ml': {'final': 'final_'},
    '100/fourier.ml': {'is': 'is_'},
    'Autoformalization/carleson.ml': {'enum': 'enum_', 'fn': 'fn_'},
    'Autoformalization/fourier_transform.ml': {'fn': 'fn_'},
    'Examples/solovay.ml': {'as': 'as_'},
    'Logic/canon.ml': {'as': 'as_', 'is': 'is_'},
    'Logic/lpo.ml': {'fn': 'fn_'},
    'Logic/positive.ml': {'fn': 'fn_'},
    'Multivariate/gamma.ml': {'is': 'is_'},
    'Multivariate/integration.ml': {'extend': 'extend_', '_': '_any'},
    'Multivariate/metric.ml': {'fn': 'fn_'},
    'Multivariate/paracompact.ml': {'fn': 'fn_'},
    'Multivariate/polytope.ml': {'as': 'as_', 'fn': 'fn_'},
    'Multivariate/realanalysis.ml': {'fn': 'fn_', "f'x": 'f_x', "f'y": 'f_y'},
    'Multivariate/transcendentals.ml': {'is': 'is_'},
    'Probability/characteristic_functions.ml': {'fn': 'fn_'},
    'Probability/ergodic.ml': {'fn': 'fn_', 'is': 'is_'},
    'Probability/expectation.ml': {'fn': 'fn_'},
    'Probability/martingale_convergence.ml': {'enum': 'enum_'},
    # a prime inside a name: the term syntax allows primes only at the end
    '100/transcendence.ml': {"qp'd": 'qp_d', "p'd": 'p_d'},
    'Multivariate/derivatives.ml': {"f'x": 'f_x', "f'y": 'f_y'},
    'Unity/mk_unless.ml': {"p's": 'p_s', "q's": 'q_s'},
    # Cu'v' is the prime family of the stem Cu'v
    'Jordan/jordan_curve_theorem.ml': {"Cu'v": 'Cu_v'},
    'Logic/birkhoff.ml': {'fn': 'fn_'},
    # _ is a wildcard to formal_ineqs' ssreflect patterns, as is any name
    # that starts with _ (wild_frees), so it becomes _any, not u_; each of
    # these patterns has one _, so none loses a distinct wildcard
    'Formal_ineqs/lib/ssrnat.hl': {'_': '_any'},
    'Formal_ineqs/taylor/m_taylor_arith.hl': {'_': '_any'},
    'Formal_ineqs/taylor/theory/multivariate_taylor-compiled.hl': {'_': '_any'},
    'Formal_ineqs/taylor/theory/taylor_interval-compiled.hl': {'_': '_any'},
    'GL/completeness.ml': {'_': '_any'},
    # an identifier starting with a digit is no MoonBit name
    'Examples/pell.ml': {'2kn': 'two_kn'},
}
# Output lines a rename removes, with how many: HOL warns when it reads a
# name that begins with a digit (2kn), so the rename drops the warning, and
# nothing else (check_term_renames.py).
TERM_RENAME_DROPS = {
    'Examples/pell.ml': {'Warning: Non-numeral begins with a digit': 1},
}
# _ in ssreflect's move ["_"] and in INTRO_TAC "_" names no variable: it
# discards (GEN_TAC, or drops the assumption). Elsewhere a string "_" names
# one, as any other.
WILDCARD = '_'
# move [ (or move_(@list.List([ ), then only whole string items before
# this one, on any lines; or INTRO_TAC (
DISCARD = re.compile(r'(?:(?:\bmove|@ssreflect\.move_)\s*\(?\s*(?:@list\.List\(\s*)?\[\s*'
                     r'(?:"(?:[^"\\\n]|\\.)*"\s*[;,]\s*)*'
                     r'|(?:\bINTRO_TAC|@theorems\.intro_tac)\s*\(?\s*)$')


def discards(text, i):
    """Whether the string at text[i] is the "_" of a move [...] list or of
    INTRO_TAC."""
    return bool(DISCARD.search(text[max(0, i - 2000):i]))
# upstream file -> [(text, replacement)], each text occurring once, applied
# before the rename (for a name built in code)
TERM_PATCHES = {
}
# callees whose string argument names a term variable, upstream and port
NAME_CALLEES = ('EXPAND_TAC', '@simp.expand_tac')
# callees whose string argument is an assumption label
LABEL_CALLEES = ('LABEL_TAC', 'USE_THEN', 'REMOVE_THEN', 'ASSUME_TAC', 'FIND_ASSUM',
                 '@tactics.label_tac', '@tactics.use_then', '@tactics.remove_then')


def renamed(name, renames):
    """`name` under `renames`, by stem (fn' -> fn_'), or None."""
    stem = name.rstrip("'")
    return renames[stem] + name[len(stem):] if stem in renames else None


def check_renames(renames):
    news = list(renames.values())
    assert len(set(news)) == len(news), 'the renaming is not injective'
    for new in news:
        stem = new.rstrip("'")
        assert stem not in renames and new == stem, f'{new}: a new name must be a fresh stem'


def hol_spans(q):
    """(start, end, kind) for the HOL quotation text q: 'name' tokens (HOL's
    maximal tokens), 'string' literals and 'comment's (// to the end of
    the line)."""
    i = 0
    while i < len(q):
        if q[i] == '"':
            j = i + 1
            while j < len(q) and q[j] != '"':
                j += 2 if q[j] == '\\' else 1
            yield i, j + 1, 'string'
            i = j + 1
            continue
        if q.startswith('//', i):
            j = q.find('\n', i)
            j = len(q) if j < 0 else j
            yield i, j, 'comment'
            i = j
            continue
        m = IDENT.match(q, i)
        if m:
            yield i, m.end(), 'name'
            i = m.end()
        else:
            i += 1


def annotation_ranges(q, renames):
    """The type annotations in q, as HOL reads them (the strict scan: an
    old name the generous one reaches, as in p:A prob_space fn, is a term;
    one in a type position would not parse once renamed)."""
    from forall_reference import annotation_colons, type_annotation_end
    # newlines and tabs separate the parts of a type as spaces do
    flat = re.sub(r'[\n\t\r]', ' ', q)
    return [(k + 1, type_annotation_end(flat, k + 1, renames)) for k in annotation_colons(flat)]


def rename_in_hol(q, renames):
    """Quotation text q with its term variables renamed. A name to rename
    inside a type annotation fails."""
    out, last = [], 0
    ranges = None
    for start, end, kind in hol_spans(q):
        if kind != 'name':
            continue
        new = renamed(q[start:end], renames)
        if new is None:
            continue
        if ranges is None:
            # the scan does not read HOL comments, whose brackets mislead it
            assert '//' not in q, f'a HOL comment in a quotation naming a renamed variable: {q[:60]!r}'
            ranges = annotation_ranges(q, renames)
            from forall_reference import annotation_colons, annotation_extent
            flat = re.sub(r'[\n\t\r]', ' ', q)
            wide = [(k + 1, annotation_extent(flat, k + 1)) for k in annotation_colons(flat)]
        assert not any(a <= start < b for a, b in ranges), \
            f'{q[start:end]} in a type annotation: {q[:60]!r}'
        # past the strict scan (A list -> fn), a name after a type operator
        # is still a type
        assert not any(a <= start < b and re.search(r'(->|[#+^(,:])\s*$', q[a:start]) for a, b in wide), \
            f'{q[start:end]} in a type annotation: {q[:60]!r}'
        out.append(q[last:start])
        out.append(new)
        last = end
    out.append(q[last:])
    return ''.join(out)


def hol_names(q):
    """The names in q, both as HOL's maximal tokens and as runs of
    alphanumerics (fn_:bool is fn_, :, bool; the scan errs on the side of
    seeing a name), outside HOL strings and comments."""
    names = []
    for s, e, kind in hol_spans(q):
        if kind == 'name':
            names.append(q[s:e])
            # a symbolic name with an underscore head (_$) is one name, and
            # no alphanumeric one hides in it
            if re.search(r'[A-Za-z0-9]', q[s:e]):
                names += re.findall(r"[A-Za-z0-9_']+", q[s:e])
    return names


def uses(names, renames, new=False):
    """The names among `names` in an old family (or, with new, a new one)."""
    if new:
        stems = {n.rstrip("'") for n in renames.values()}
        return [n for n in names if n.rstrip("'") in stems]
    return [n for n in names if renamed(n, renames) is not None]


def string_value(piece):
    """An OCaml string, quoted string or character literal's value."""
    from forall_reference import ocaml_unescaped
    if piece.startswith('{'):
        return piece[piece.index('|') + 1:piece.rindex('|')]
    v = re.sub(r'\\\n[ \t]*', '', piece[1:-1])  # a line continuation
    v = re.sub(r'\\u\{([0-9a-fA-F]+)\}', lambda m: chr(int(m[1], 16)), v)
    v = ocaml_unescaped(v)
    return re.sub(r'\\(.)', lambda m: {'n': '\n', 't': '\t', 'r': '\r', 'b': '\b'}.get(m[1], m[1]), v)


def callee_before(text, i):
    m = re.search(r'([@A-Za-z_][\w.@]*)\s*\(?\s*$', text[max(0, i - 80):i])
    return m[1] if m else ''


def rename_ocaml(text, renames, patches=()):
    """Upstream OCaml source with its term variables renamed."""
    from forall_reference import ocaml_segments
    check_renames(renames)
    for kind, piece in ocaml_segments(text):
        if kind == 'quotation':
            names = hol_names(piece[1:-1])
        elif kind == 'string':
            names = [string_value(piece)]
        elif kind == 'code':
            names = []
        else:
            continue
        assert not uses(names, renames, new=True), f'a new name is already used: {piece[:60]!r}'
    # patches go in after that check, which they would fail
    for old, new in patches:
        assert text.count(old) == 1, f'patch target changed: {old}'
        text = text.replace(old, new)
    segments = ocaml_segments(text)
    out, at = [], 0
    for kind, piece in segments:
        start, at = at, at + len(piece)
        if kind == 'quotation' and not piece.endswith(':`'):
            piece = '`' + rename_in_hol(piece[1:-1], renames) + '`'
        elif kind == 'string' and renamed(string_value(piece), renames) is not None and \
                not (string_value(piece) == WILDCARD and discards(text, start)):
            assert string_value(piece) == piece[1:-1], f'an escaped string names a renamed variable: {piece}'
            callee = callee_before(text, start)
            if callee in NAME_CALLEES:
                piece = '"' + renamed(piece[1:-1], renames) + '"'
            else:
                assert callee in LABEL_CALLEES, f'string {piece} after {callee!r}: rename by a patch'
        elif kind == 'quotation':
            assert not uses(hol_names(piece[1:-2]), renames), f'old name in a type quotation {piece[:60]!r}'
        out.append(piece)
    return ''.join(out)


MBT_STRING = re.compile(r'"((?:[^"\\\n]|\\.)*)"')


def mbt_unescape(s):
    return re.sub(r'\\(u\{[0-9a-fA-F]+\}|.)', lambda m: chr(int(m[1][2:-1], 16)) if m[1].startswith('u{')
                  else {'n': '\n', 't': '\t', 'r': '\r', 'b': '\b', '\\': '\\', '"': '"', "'": "'"}[m[1]], s)


def mbt_escape(s):
    return ''.join({'\n': '\\n', '\t': '\\t', '\r': '\\r', '\b': '\\b', '\\': '\\\\', '"': '\\"'}.get(c, c) for c in s)


def rename_moonbit(text, renames):
    """A MoonBit source with its term variables renamed: in old-syntax
    quotations, and in the name strings of NAME_CALLEES. A term-syntax
    quotation naming an old or new variable fails (the term syntax cannot
    spell the old names; a new one would merge)."""
    check_renames(renames)
    out, last = [], 0
    for m in MBT_STRING.finditer(text):
        body = mbt_unescape(m[1])
        callee = callee_before(text, m.start())
        if callee == '@parser.parse_term':
            names = hol_names(body)
            assert not uses(names, renames, new=True), f'a new name is already used: {body[:60]!r}'
            new = mbt_escape(rename_in_hol(body, renames))
        elif callee == '@term_syntax.parse_term':
            # fn { pattern => ... } is the term syntax's own keyword
            names = re.findall(r"[A-Za-z_][A-Za-z0-9_]*'*", re.sub(r'\bfn(?=\s*\{)', ' ', body))
            # a bare _ is a hole there, never a variable
            names = [n for n in names if n.rstrip("'") != WILDCARD]
            assert not uses(names, renames) and not uses(names, renames, new=True), \
                f'a term-syntax quotation names a renamed variable: {body[:60]!r}'
            continue
        elif renamed(body, renames) is not None and not (body == WILDCARD and discards(text, m.start())):
            if callee in NAME_CALLEES:
                new = renamed(body, renames)
            else:
                assert callee in LABEL_CALLEES, f'string "{body}" after {callee!r}: rename by hand'
                continue
        else:
            assert not uses([body], renames, new=True), f'string "{body}" is a new name'
            continue
        out.append(text[last:m.start(1)])
        out.append(new)
        last = m.end(1)
    out.append(text[last:])
    return ''.join(out)


def decode_escaped(s):
    """OCaml's String.escaped, undone (trace lines are printed so)."""
    def one(m):
        c = m[0][1:]
        return chr(int(c)) if c.isdigit() else {'n': '\n', 'r': '\r', 't': '\t', 'b': '\b',
                                                 '\\': '\\', '"': '"', "'": "'"}.get(c, c)
    return re.sub(r'\\(?:[0-9]{3}|.)', one, s).encode('latin1').decode('utf-8', errors='surrogateescape')


def encode_escaped(s):
    return ''.join({10: '\\n', 13: '\\r', 9: '\\t', 8: '\\b', 92: '\\\\', 34: '\\"'}.get(
        c, chr(c) if 32 <= c <= 126 else '\\%03d' % c) for c in s.encode('utf-8', errors='surrogateescape'))


# a variable in structural output (prelude.ml's stm): name and primes, then
# its type; a constant has a # before its name, a type variable a quote
def structural_variable(renames):
    stems = '|'.join(map(re.escape, sorted(renames, key=len, reverse=True)))
    return re.compile(r"(?<=[(\\ ])(" + stems + r")('*)(?=:)")


def renamed_output(output, target, renames, theorems=None):
    """Reference output with the term variables of `target`'s quotations
    and theorems renamed: from the line that opens its quotation trace on,
    trace lines as the sources are renamed, and variables in structural
    output. Lines before it come from other files and stay. With `theorems`,
    only the lines of those theorems (NAME = ...) are theorem lines; a
    failure's message, however many lines it takes, is not."""
    header = target + ' quotations ('
    var = structural_variable(renames)
    out, scope, trace = [], False, False
    for line in output.splitlines(keepends=True):
        if line.startswith(header):
            scope = trace = True
            out.append(line)
            continue
        if not scope:
            out.append(line)
            continue
        if trace and line.startswith('  '):
            body = line[2:].rstrip('\n')
            out.append('  ' + encode_escaped(rename_in_hol(decode_escaped(body), renames)) + '\n')
            continue
        trace = False
        # a theorem the script prints (NAME = ...); failures and other
        # lines must not change
        m = re.match(r'(\S+) = ', line)
        theorem = m and (theorems is None or m[1] in theorems)
        out.append(var.sub(lambda m: renames[m[1]] + m[2], line) if theorem else line)
    return ''.join(out)
