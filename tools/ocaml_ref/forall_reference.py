"""Adapt upstream notation and the universal constant's name for comparison.

The upstream kernel still runs on its original source. Temporary parser and
printer copies normalize the spelling at their boundaries. The Boolean theory
copy omits the now-redundant forall alias. Serialized terms
are compared modulo the explicit constant rename; all other structure is kept.
"""
import os
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from hol_notation import forall_notation, upstream_notation


def escaped_notation(text):
    def unescape(match):
        c = match[0][1:]
        return chr(int(c)) if c.isdigit() else {
            'n': '\n', 'r': '\r', 't': '\t', 'b': '\b', '\\': '\\', '"': '"',
        }.get(c, c)
    # String.escaped encodes UTF-8 bytes as decimal escapes. Decode them before
    # scanning so existing readable-proof symbols such as ∃! stay intact.
    decoded = re.sub(r'\\(?:[0-9]{3}|.)', unescape, text).encode('latin1').decode(
        'utf-8', errors='surrogateescape')
    converted = forall_notation(decoded)
    if converted == decoded:
        return text
    return ''.join({
        10: '\\n', 13: '\\r', 9: '\\t', 8: '\\b', 92: '\\\\', 34: '\\"',
    }.get(c, chr(c) if 32 <= c <= 126 else '\\%03d' % c)
        for c in converted.encode('utf-8', errors='surrogateescape'))


def adapt_output(lines):
    trace = False
    cases = (Path(__file__).parent / 'parse_cases.txt').read_text().splitlines()
    labels = [(upstream_notation(s), s) for s in cases if s.startswith(('T: ', 'Y: '))]
    labels.sort(key=lambda pair: -len(pair[0]))
    for line in lines:
        if re.match(r'.* quotations \(\d+\):$', line.rstrip('\n')):
            trace = True
        elif trace and line.startswith('  '):
            line = '  ' + escaped_notation(line[2:].rstrip('\n')) + '\n'
        else:
            trace = False
        if line.startswith('binders = '):
            words = line[10:].split()
            # forall now occupies the original canonical binder's position.
            if '!' in words:
                words = ['forall' if w == '!' else w for w in words if w != 'forall']
            line = 'binders = ' + ' '.join(words) + '\n'
        elif line.startswith('constants = '):
            line = 'constants = ' + ' '.join(
                'forall' if w == '!' else w for w in line[12:].split()) + '\n'
        elif line.startswith(('T: ', 'Y: ')):
            # Only the input label changes. Never rewrite serialized terms or
            # exception separators in the oracle result after the label.
            for old, new in labels:
                if line.startswith(old + ' '):
                    line = new + line[len(old):]
                    break
        yield line


# Type variables the port names differently from upstream: type variables are
# capitalized, as MoonBit's type parameters are (issue #140). Each file listed
# is loaded from a copy with these names replaced in its quotations' type
# annotations (rename_type_variables).
TYPE_RENAMES = {
    '100/friendship.ml': {'person': 'Person'},
    'Unity/mk_state_logic.ml': {"'a": 'A', "'b": 'B', "'c": 'C'},
    'Unity/mk_unless.ml': {"'a": 'A'},
    'Unity/mk_ensures.ml': {"'a": 'A'},
    'Unity/mk_leadsto.ml': {"'a": 'A'},
    'Unity/mk_comp_unity.ml': {"'a": 'A'},
    'Unity/mk_unity_prog.ml': {"'a": 'A', "'b": 'B', "'i": 'I', "'loc": 'Loc', "'sta": 'Sta',
                               "'state": 'State', "'t": 'T', "'val": 'Val'},
    # lowercase type variables: one (a singleton domain) and 'a
    'Multivariate/topology.ml': {'one': 'X'},
    'Multivariate/canal.ml': {'one': 'X'},
    'Quaternions/qanal.hl': {'one': 'X'},
    'Boyer_Moore/terms_and_clauses.ml': {"'a": 'X'},
}
# Type variables a file builds in code, adapted by hand before the rename.
TYPE_PATCHES = {
    'Unity/mk_unity_prog.ml': [
        ('let VAR_TP  = (fun s -> mk_vartype("\'"^s));;', 'let VAR_TP  = mk_vartype;;'),
        ('let LOC = VAR_TP"loc";;', 'let LOC = VAR_TP"Loc";;'),
        ('let VAL = VAR_TP"val";;', 'let VAL = VAR_TP"Val";;'),
        ('let t   = mk_vartype"\'t";;', 'let t   = mk_vartype"T";;'),
    ],
}


# Quotations the port writes or builds differently from upstream, because it
# removed the parser extensions they use (issue #140: Library/bitmatch.ml's
# bitmatch syntax, Examples/prog.ml's program syntax). Each file listed is
# loaded from a copy patched the same way, so that the reference reproduces
# the port's goldens; each upstream text must occur once.
PORT_PATCHES = {
    'Library/bitmatch.ml': [
        # binders named as library/bitmatch/terms.mbt's mk_bitmatch names them
        ('    let x = pgenvar() and y = pgenvar() in\n',
         '    let x = Varp("bm_input",dpty) and y = Varp("bm_result",dpty) in\n'),
        # bm_check_disjointness's unit tests, which the port builds rather than parses
        ('`bitmatch (x:(2)word) with | [0b00:2] -> T | [0b10:2] -> T`',
         '(untraced_parse_term "bitmatch (x:(2)word) with | [0b00:2] -> T | [0b10:2] -> T")'),
        ('`bitmatch (x:(2)word) with | [T; x] -> T | [F; y] -> T`',
         '(untraced_parse_term "bitmatch (x:(2)word) with | [T; x] -> T | [F; y] -> T")'),
        ('`bitmatch (x:(2)word) with | [0b00:2] -> T | [0b00:2] -> T`',
         '(untraced_parse_term "bitmatch (x:(2)word) with | [0b00:2] -> T | [0b00:2] -> T")'),
        ('`bitmatch (x:(2)word) with | [T; x] -> T | [y; T] -> T`',
         '(untraced_parse_term "bitmatch (x:(2)word) with | [T; x] -> T | [y; T] -> T")'),
        ('`bitmatch (x:(2)word) with | [0b11:2] -> T | [0b00:2] -> T | [0b00:2] -> T`',
         '(untraced_parse_term "bitmatch (x:(2)word) with | [0b11:2] -> T | [0b00:2] -> T | [0b00:2] -> T")'),
    ],
    'Examples/prog.ml': [
        # EXAMPLE_FACTORIAL's goal in plain HOL, as examples/prog/prog.mbt writes it
        ('(`correct\n   T\n     var x,y,n;\n       x := 0;\n       y := 1;\n       while x < n do [invariant x <= n /\\ (y = FACT x); measure n - x]\n        (x := x + 1;\n         y := y * x)\n     end\n   y = FACT n`',
         '(`correct\n  (\\(x,y,n). T)\n  (Assign (\\(x,y,n). (0,y,n)) Seq\n   Assign (\\(x,y,n). (x,1,n)) Seq\n   AWHILE (\\(x,y,n). x <= n /\\ (y = FACT x))\n          (MEASURE (\\(x,y,n). n - x))\n          (\\(x,y,n). x < n)\n          (Assign (\\(x,y,n). (x + 1,y,n)) Seq\n           Assign (\\(x,y,n). (x,y * x,n))))\n  (\\(x,y,n). y = FACT n)`'),
    ],
}


def renamed_copy(path):
    return '_build/renamed/' + path


def renamed_files():
    """The upstream files loaded from renamed copies: those TYPE_RENAMES
    lists, unless HOL_REF_ORIGINAL_TYPE_NAMES is set, and those
    TERM_RENAMES (term_renames.py) lists, unless HOL_REF_ORIGINAL_TERM_NAMES
    is, and those NAME_PATCHES (name_renames.py) lists, unless
    HOL_REF_ORIGINAL_NAMES is (check_type_renames.py, check_term_renames.py
    and check_name_renames.py compare the runs)."""
    from term_renames import TERM_RENAMES
    from name_renames import NAME_PATCHES
    types = {} if os.environ.get('HOL_REF_ORIGINAL_TYPE_NAMES') else TYPE_RENAMES
    terms = {} if os.environ.get('HOL_REF_ORIGINAL_TERM_NAMES') else TERM_RENAMES
    names = {} if os.environ.get('HOL_REF_ORIGINAL_NAMES') else NAME_PATCHES
    return {path: (types.get(path), terms.get(path), path in names)
            for path in {*types, *terms, *names, *PORT_PATCHES}}


def reference_source(source):
    """Route core loads to the temporary copies without editing upstream."""
    for path in renamed_files():
        source = source.replace(f'#use "{path}"', f'#use "{renamed_copy(path)}"')
    return source.replace('#use "printer.ml"', '#use "_build/printer_forall.ml"').replace(
        '#use "bool.ml"', '#use "_build/bool_forall.ml"').replace(
        '#use "parser.ml"', '#use "_build/parser_forall.ml"')


HOL_NAME = re.compile(r"[A-Za-z0-9_']+")


def type_annotation_end(q, i, variables=()):
    """End of the type annotation starting at q[i] (just after a `:`): atoms,
    parenthesized lists and postfix constructors, joined by `->`, `#`, `+`
    or `^`. It may stop early, never late, so a name it misses fails the
    copy rather than being renamed in a term."""
    while True:
        while i < len(q) and q[i] == ' ':
            i += 1
        if q.startswith('(', i):
            depth = 0
            for j in range(i, len(q)):
                depth += {'(': 1, ')': -1}.get(q[j], 0)
                if depth == 0:
                    break
            else:
                return i
            i = j + 1
        else:
            m = HOL_NAME.match(q, i)
            if not m:
                return i
            i = m.end()
        # postfix constructors, (A)list; a type variable is none, so one of
        # `variables` there is a term (\x:(bool)'a. x binds 'a)
        while (m := HOL_NAME.match(q, i)) and m[0] not in variables:
            i = m.end()
        j = i
        while j < len(q) and q[j] == ' ':
            j += 1
        for op in ('->', '#', '+', '^'):
            if q.startswith(op, j):
                i = j + len(op)
                break
        else:
            return i


HOL_SYMBOL = "\\!@#$%^&*-+|<=>/?~.:"


def annotation_colons(q):
    """Positions of the colons in quotation q that start a type annotation:
    not inside a HOL string, nor part of a longer symbol such as `::` or of
    an identifier with an underscore tail (`_:`)."""
    i = 0
    while i < len(q):
        if q[i] == '"':
            i += 1
            while i < len(q) and q[i] != '"':
                i += 2 if q[i] == '\\' else 1
        elif q[i] == ':' and q[i - 1] not in HOL_SYMBOL + '_' and q[i + 1:i + 2] not in tuple(HOL_SYMBOL):
            yield i
        i += 1


def rename_in_quotation(q, renames):
    out, i = [], 0
    for k in annotation_colons(q):
        if k < i:
            continue
        end = type_annotation_end(q, k + 1, renames)
        out.append(q[i:k + 1])
        out.append(HOL_NAME.sub(lambda m: renames.get(m[0], m[0]), q[k + 1:end]))
        i = end
    out.append(q[i:])
    return ''.join(out)


def annotation_extent(q, i):
    """A generous end for the type annotation at q[i]: up to the first
    character that ends one, outside parentheses and HOL comments (`//` to
    the end of the line). Symbols such as `<` can name type variables, so
    they do not end it. It may stop late, never early, so the already-used
    check sees every type name."""
    depth, j = 0, i
    while j < len(q):
        if q.startswith('//', j):
            j = q.find('\n', j)
            if j < 0:
                return len(q)
        elif q[j] == '(':
            depth += 1
        elif q[j] == ')':
            if depth == 0:
                return j
            depth -= 1
        elif depth == 0 and q[j] in '.|=;,]}:`':
            return j
        j += 1
    return len(q)


def literal_end(text, i):
    """End of the OCaml string, quoted string (`{id|...|id}`) or character
    literal starting at text[i], or None. The lexer reads these inside
    comments too, so a `(*` or `*)` in one neither opens nor closes one."""
    if text[i] == '"':
        i += 1
        while i < len(text) and text[i] != '"':
            i += 2 if text[i] == '\\' else 1
        return i + 1
    if text[i] == '{' and (m := re.match(r'\{([a-z_]*)\|', text[i:])):
        end = text.find('|' + m[1] + '}', i + m.end())
        return len(text) if end < 0 else end + len(m[1]) + 2
    if text[i] == "'":
        if (m := re.match(r"'(?:[^\\']|\\(?:[\\'\"ntbr ]|[0-9]{3}|x[0-9a-fA-F]{2}|o[0-3][0-7]{2}))'", text[i:])):
            return i + m.end()
    return None


def ocaml_segments(text):
    """`text` cut into (kind, piece): 'comment' (nested `(* *)`), 'string'
    (string, quoted string or character literals), 'quotation' (backquoted)
    and 'code'."""
    out, i, start = [], 0, 0
    def emit(kind, j):
        nonlocal start
        if j > start:
            out.append((kind, text[start:j]))
        start = j
    while i < len(text):
        if text.startswith('(*', i):
            emit('code', i)
            depth = 0
            while i < len(text):
                if text.startswith('(*', i):
                    depth, i = depth + 1, i + 2
                elif text.startswith('*)', i):
                    depth, i = depth - 1, i + 2
                    if depth == 0:
                        break
                else:
                    i = literal_end(text, i) or i + 1
            emit('comment', i)
        elif text[i] == '`':
            emit('code', i)
            end = text.find('`', i + 1)
            i = len(text) if end < 0 else end + 1
            emit('quotation', i)
        elif (end := literal_end(text, i)) is not None:
            emit('code', i)
            i = end
            emit('string', i)
        else:
            i += 1
    emit('code', len(text))
    return out


def checked_segments(text):
    # a quotation ending in a colon is a string (pa_j), and string escapes
    # are read as OCaml reads them ("\039a" is 'a)
    segments = [('string', piece) if kind == 'quotation' and piece.endswith(':`') else (kind, piece)
                for kind, piece in ocaml_segments(text)]
    return [(kind, piece + '\0' + ocaml_unescaped(piece)) if kind == 'string' else (kind, piece)
            for kind, piece in segments]


def rename_type_variables(text, renames, patches=()):
    """`text` (OCaml) with the type variables `renames` maps renamed in the
    type annotations of its quotations. Any other occurrence of an old name
    outside comments, in a quotation's term or in OCaml code or strings
    (`mk_vartype "'a"`), fails: those need adapting by hand, in `patches`
    (pairs of an upstream text, which must occur once, and its replacement),
    applied after checking that the new names are unused."""
    assert len(set(renames.values())) == len(renames) and not set(renames.values()) & set(renames), \
        'the renaming is not injective'
    def occurs(name, pieces):
        return any(re.search(r"(?<![A-Za-z0-9_'])" + re.escape(name) + r"(?![A-Za-z0-9_'])", piece)
                   for kind, piece in pieces if kind != 'comment')
    segments = checked_segments(text)
    types = [(kind, piece) for kind, piece in segments if kind in ('code', 'string')] + [
        ('annotation', piece[k + 1:annotation_extent(piece, k + 1)])
        for kind, piece in segments if kind == 'quotation' for k in annotation_colons(piece)]
    for new in renames.values():
        # a new name already used for a type would merge two type variables
        # (terms have names of their own: T, truth, is no type)
        assert not occurs(new, types), f'{new} is already used'
    for old, new in patches:
        assert text.count(old) == 1, f'patch target changed: {old}'
        text = text.replace(old, new)
    segments = checked_segments(text)
    for kind, piece in segments:
        # the scan does not read HOL comments, whose brackets would mislead it
        assert not (kind == 'quotation' and '//' in piece and any(occurs(old, [(kind, piece)]) for old in renames)), \
            f'a HOL comment in a quotation naming a renamed type variable: {piece[:60]}'
    segments = [(kind, rename_in_quotation(piece, renames) if kind == 'quotation' else piece)
                for kind, piece in segments]
    for old in renames:
        assert not occurs(old, segments), f'{old} occurs outside a type annotation'
    return ''.join(piece.split('\0')[0] if kind == 'string' else piece for kind, piece in segments)


def ocaml_unescaped(s):
    return re.sub(r'\\(?:([0-9]{3})|x([0-9a-fA-F]{2})|o([0-3][0-7]{2}))',
                  lambda m: chr(int(m[1]) if m[1] else int(m[2], 16) if m[2] else int(m[3], 8)), s)


def prepare():
    root = Path(__file__).resolve().parents[2]
    ref = root / 'tools/ocaml_ref'
    (ref / '_build').mkdir(exist_ok=True)
    printer = (root / '.repos/hol-light/printer.ml').read_text()
    patches = [
        ('let reverse_interface (s0,ty0) =\n',
         'let reverse_interface (s0,ty0) =\n    let spelling = if s0 = "!" then "forall" else s0 in\n'),
        ('if not(!reverse_interface_mapping) then s0 else',
         'if not(!reverse_interface_mapping) then spelling else'),
        ('with Failure _ -> s0 in', 'with Failure _ -> spelling in'),
        ('(fun n  -> mem n (!binder_list)),',
         '(fun n  -> mem n (!binder_list) || n = "forall" && mem "!" (!binder_list)),'),
    ]
    for old, new in patches:
        assert printer.count(old) == 1, 'upstream printer changed: ' + old
        printer = printer.replace(old, new)
    (ref / '_build/printer_forall.ml').write_text(printer)
    # Upstream theories sometimes already spell the binder `forall`. Resolve it
    # directly to the upstream canonical constant, just as the port now does,
    # rather than retaining the alias and its extra type-inference allocations.
    parser = (root / '.repos/hol-light/parser.ml').read_text()
    entry = '  (fun inp ->\n    match inp with\n'
    assert parser.count(entry) == 1, 'upstream term parser changed'
    parser = parser.replace(entry, '  (fun inp ->\n'
        '    let inp = map (function Ident "forall" -> Ident "!" | tok -> tok) inp in\n'
        '    match inp with\n')
    (ref / '_build/parser_forall.ml').write_text(parser)
    boolean = (root / '.repos/hol-light/bool.ml').read_text()
    alias = '  override_interface("forall",`(!):(A->bool)->bool`);\n'
    assert boolean.count(alias) == 1, 'upstream forall alias changed'
    (ref / '_build/bool_forall.ml').write_text(boolean.replace(alias, ''))
    from term_renames import TERM_PATCHES, rename_ocaml
    from name_renames import NAME_PATCHES, rename_names
    for path, (types, terms, names) in renamed_files().items():
        copy = ref / renamed_copy(path)
        copy.parent.mkdir(parents=True, exist_ok=True)
        text = (root / '.repos/hol-light' / path).read_text()
        for old, new in PORT_PATCHES.get(path, ()):
            assert text.count(old) == 1, f'upstream {path} changed: {old[:60]}'
            text = text.replace(old, new)
        if types:
            text = rename_type_variables(text, types, TYPE_PATCHES.get(path, ()))
        if terms:
            text = rename_ocaml(text, terms, TERM_PATCHES.get(path, ()))
        if names:
            text = rename_names(text, NAME_PATCHES[path], path)
        copy.write_text(text)
    (ref / '_build/parse_cases_legacy.txt').write_text(
        ''.join(upstream_notation(line) for line in
                (ref / 'parse_cases.txt').read_text().splitlines(keepends=True)))


if __name__ == '__main__':
    if sys.argv[1:] == ['--prepare']:
        prepare()
    elif sys.argv[1:2] == ['--source']:
        sys.stdout.write(reference_source(''.join(Path(p).read_text() for p in sys.argv[2:])))
    else:
        sys.stdout.writelines(adapt_output(sys.stdin))
