#!/usr/bin/env python3
"""Tests for term_renames.py: python3 tools/ocaml_ref/test_term_renames.py"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from term_renames import rename_ocaml, rename_moonbit, renamed_output

R = {'fn': 'fn_'}


def refused(f, *args):
    try:
        f(*args)
    except AssertionError:
        return True
    return False


# quotation variables and their primed family; longer tokens stay
assert rename_ocaml("let x = `!fn fn'. fn = fn' /\\ fn0 = fnx /\\ fn_x`;;", R) == \
    "let x = `!fn_ fn_'. fn_ = fn_' /\\ fn0 = fnx /\\ fn_x`;;"
# HOL strings, comments and OCaml host names stay
assert rename_ocaml('let fn = `"fn" = s`;; (* fn *)', R) == 'let fn = `"fn" = s`;; (* fn *)'
# a variable-name string is renamed, an assumption label is not
assert rename_ocaml('EXPAND_TAC "fn" THEN LABEL_TAC "fn" th THEN USE_THEN "fn" MP_TAC', R) == \
    'EXPAND_TAC "fn_" THEN LABEL_TAC "fn" th THEN USE_THEN "fn" MP_TAC'
# any other string naming an old variable needs a patch
assert refused(rename_ocaml, 'let v = mk_var("fn", bool_ty);;', R)
assert rename_ocaml('let v = mk_var("fn", bool_ty);;', R,
                    [('mk_var("fn"', 'mk_var("fn_"')]) == 'let v = mk_var("fn_", bool_ty);;'
# a new name already in use would merge or capture: \fn. fn_
assert refused(rename_ocaml, "let x = `\\fn. fn_`;;", R)
assert refused(rename_ocaml, "let x = `\\fn. fn_'`;;", R)
assert refused(rename_ocaml, 'let x = `fn = x`;; EXPAND_TAC "fn_"', R)
# an old name in a type annotation is a type, not a variable
assert refused(rename_ocaml, "let x = `x:fn`;;", R)
# the renaming must be injective and map stems to fresh stems
assert refused(rename_ocaml, "`fn = as`", {'fn': 'x_', 'as': 'x_'})
assert refused(rename_ocaml, "`fn = x`", {'fn': "fn_'"})

# MoonBit: old-syntax quotations (escapes decoded), name strings, labels
src = ('let a = @parser.parse_term("!fn. fn = \\"fn\\" /\\\\ fn\\n= x")\n'
       '@simp.expand_tac("fn") @tactics.label_tac("fn", th)\n')
assert rename_moonbit(src, R) == ('let a = @parser.parse_term("!fn_. fn_ = \\"fn\\" /\\\\ fn_\\n= x")\n'
                                  '@simp.expand_tac("fn_") @tactics.label_tac("fn", th)\n')
assert refused(rename_moonbit, '@term_syntax.parse_term("fn_ + 1")', R)
assert refused(rename_moonbit, 'foo("fn")', R)
# the term syntax's own fn { ... } is no variable
assert rename_moonbit('@term_syntax.parse_term("IMAGE(fn { (x, y) => x }, s)")', R) == \
    '@term_syntax.parse_term("IMAGE(fn { (x, y) => x }, s)")'

# output: the target's trace and structural variables, not constants or
# type variables, nor lines before the target's trace
out = ("A quotations (1):\n  fn = 1\nTH =  |- (fn:num)\n"
       "B quotations (2):\n  !fn. fn = 0\n  fn\\n= x\n"
       "TH =  |- (#forall:fun(fun(num,bool),bool) (\\fn:num. ((#=:fun(num,fun(num,bool)) fn:num) fn':'fn)))\n"
       "C = #fn:num\n")
assert renamed_output(out, 'B', R) == (
    "A quotations (1):\n  fn = 1\nTH =  |- (fn:num)\n"
    "B quotations (2):\n  !fn_. fn_ = 0\n  fn_\\n= x\n"
    "TH =  |- (#forall:fun(fun(num,bool),bool) (\\fn_:num. ((#=:fun(num,fun(num,bool)) fn_:num) fn_':'fn)))\n"
    "C = #fn:num\n")
# found by review: a typed new name, a newline in a type annotation, an
# escaped name string, a changed failure message
assert refused(rename_ocaml, "let x = `\\fn:bool. fn_:bool`;;", R)
assert refused(rename_ocaml, "let x = `x:\nfn`;;", R)
assert refused(rename_ocaml, 'EXPAND_TAC "\\102n" THEN REWRITE_TAC[]', R)
assert refused(rename_ocaml, 'let v = mk_var("\\102n_", bool_ty);;', R)
assert renamed_output("B quotations (0):\nTH ! bad constant fn:num\n", 'B', R) == \
    "B quotations (0):\nTH ! bad constant fn:num\n"
# found by the second review
assert refused(rename_ocaml, 'mk_abs (`fn :bool`, mk_var ("\\u{66}n_", bool_ty))', R)
assert refused(rename_ocaml, "let x = `x : A list -> fn`;;", R)
assert rename_ocaml("let x = `!p:A prob_space fn f. fn = f`;;", R) == "let x = `!p:A prob_space fn_ f. fn_ = f`;;"
assert renamed_output("B quotations (0):\nTH ! bad\nDETAIL = fn:num\nTH2 = |- fn:num\n", 'B', R, {'TH', 'TH2'}) == \
    "B quotations (0):\nTH ! bad\nDETAIL = fn:num\nTH2 = |- fn_:num\n"
# _ (the review of #964): move ["_"] discards, EXPAND_TAC "_" names a variable
U = {'_': '_any'}
assert rename_ocaml('e (move ["x"; "_"] THEN DISCH_TAC);;', U) == 'e (move ["x"; "_"] THEN DISCH_TAC);;'
assert rename_ocaml('e (ASSUME_TAC `0 = _` THEN EXPAND_TAC "_");;', U) == 'e (ASSUME_TAC `0 = _any` THEN EXPAND_TAC "_any");;'
assert refused(rename_ocaml, 'let s = mk_var ("_", bool_ty);;', U)
assert rename_moonbit('@ssreflect.move_(@list.List(["_"]))', U) == '@ssreflect.move_(@list.List(["_"]))'
assert rename_moonbit('@simp.expand_tac("_")', U) == '@simp.expand_tac("_any")'
assert rename_moonbit('@term_syntax.parse_term("(x : _)")', U) == '@term_syntax.parse_term("(x : _)")'
assert rename_ocaml('e (INTRO_TAC "_" THEN EXPAND_TAC "_");;', U) == 'e (INTRO_TAC "_" THEN EXPAND_TAC "_any");;'
assert rename_moonbit('@theorems.intro_tac("_")', U) == '@theorems.intro_tac("_")'
# the second review of #964
assert rename_ocaml('e ((* move [ *) EXPAND_TAC "_");;', U) == 'e ((* move [ *) EXPAND_TAC "_any");;'
assert rename_moonbit('let s = "move ["; @simp.expand_tac("_")', U) == 'let s = "move ["; @simp.expand_tac("_any")'
assert rename_ocaml('e (move [\n  "x";\n  "_"\n]);;', U) == 'e (move [\n  "x";\n  "_"\n]);;'
assert rename_moonbit('@ssreflect.move_(@list.List([\n  "_",\n]))', U) == '@ssreflect.move_(@list.List([\n  "_",\n]))'
# a string passed to a TEXT_CALLEES callee is HOL text, only in a call
C, I = ('full_inner_space_prove',), {'is': 'is_'}
assert rename_moonbit('f(full_inner_space_prove("p is q"))', I, C) == 'f(full_inner_space_prove("p is_ q"))'
assert rename_moonbit('let d =\n // full_inner_space_prove\n "this is a note"', I, C).count('is_') == 0
assert rename_moonbit("debug'full_inner_space_prove(\"this is it\")", I, C).count('is_') == 0
assert rename_moonbit('// full_inner_space_prove("this is it")', I, C).count('is_') == 0
assert rename_ocaml("let t = full_inner_space_prove (`p is q:`, ALL_TAC);;", I, (), C) == \
    "let t = full_inner_space_prove (`p is_ q:`, ALL_TAC);;"
assert refused(rename_ocaml, "let t = debug'full_inner_space_prove (`p is q:`, ALL_TAC);;", I, (), C)
print('ok')

