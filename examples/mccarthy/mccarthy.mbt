// Translated from upstream Examples/mccarthy.ml; edit this file directly.

///|
let string_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("string_INDUCT")

///|
/// `string_INDUCT`
pub fn string_induct() -> @kernel.Thm {
  string_induct_c.get()
}

///|
let string_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("string_RECURSION")

///|
/// `string_RECURSION`
pub fn string_recursion() -> @kernel.Thm {
  string_recursion_c.get()
}

///|
/// string_INDUCT, string_RECURSION
fn step_1() -> Unit raise {
  let (string_induct, string_recursion) = @ind_types.define_type("enum String { String(List[Int]) }")
  string_induct_c.set(string_induct)
  string_recursion_c.set(string_recursion)
}

///|
let exp_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("exp_INDUCT")

///|
/// `exp_INDUCT`
pub fn exp_induct() -> @kernel.Thm {
  exp_induct_c.get()
}

///|
let exp_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("exp_RECURSION")

///|
/// `exp_RECURSION`
pub fn exp_recursion() -> @kernel.Thm {
  exp_recursion_c.get()
}

///|
/// exp_INDUCT, exp_RECURSION
fn step_2() -> Unit raise {
  let (exp_induct, exp_recursion) = @ind_types.define_type("enum Exp { Lit(Num); Var(String); Plus(Exp, Exp) }")
  exp_induct_c.set(exp_induct)
  exp_recursion_c.set(exp_recursion)
}

///|
/// E_DEF
fn step_3() -> Unit raise {
  let t1 = @term_syntax.parse_term("(E : (Exp, (List[Char]) -> Num) -> Num)(Lit((n : Num)), (s : (List[Char]) -> Num)) == n && E(Var((v : List[Char])), s) == s(v) && E(Plus((e1 : Exp), (e2 : Exp)), s) == E(e1, s) + E(e2, s)")
  e_def_c.set(@recursion.new_recursive_definition(exp_recursion())(t1))
}

///|
let e_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("E_DEF")

///|
/// `E_DEF`
pub fn e_def() -> @kernel.Thm {
  e_def_c.get()
}

///|
let cell_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cell_INDUCT")

///|
/// `cell_INDUCT`
pub fn cell_induct() -> @kernel.Thm {
  cell_induct_c.get()
}

///|
let cell_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cell_RECURSION")

///|
/// `cell_RECURSION`
pub fn cell_recursion() -> @kernel.Thm {
  cell_recursion_c.get()
}

///|
/// cell_INDUCT, cell_RECURSION
fn step_4() -> Unit raise {
  let (cell_induct, cell_recursion) = @ind_types.define_type("enum Cell { Acc; Reg(Num) }")
  cell_induct_c.set(cell_induct)
  cell_recursion_c.set(cell_recursion)
}

///|
let inst_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inst_INDUCT")

///|
/// `inst_INDUCT`
pub fn inst_induct() -> @kernel.Thm {
  inst_induct_c.get()
}

///|
let inst_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inst_RECURSION")

///|
/// `inst_RECURSION`
pub fn inst_recursion() -> @kernel.Thm {
  inst_recursion_c.get()
}

///|
/// inst_INDUCT, inst_RECURSION
fn step_5() -> Unit raise {
  let (inst_induct, inst_recursion) = @ind_types.define_type("enum Inst { LI(Num); LOAD(Num); STO(Num); ADD(Num) }")
  inst_induct_c.set(inst_induct)
  inst_recursion_c.set(inst_recursion)
}

///|
/// update_def
fn step_6() -> Unit raise {
  update_def_c.set(@pair.new_definition(@term_syntax.parse_term("(update : (_, _, (_) -> _, _) -> _)((x : _), (z : _), (s : (_) -> _), (y : _)) == (if y == x { z } else { s(y) })")))
}

///|
let update_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("update_def")

///|
/// `update_def`
pub fn update_def() -> @kernel.Thm {
  update_def_c.get()
}

///|
/// S_DEF
fn step_7() -> Unit raise {
  let t2 = @term_syntax.parse_term("(S : (Inst, (Cell) -> Num, Cell) -> Num)(LI((n : Num)), (s : (Cell) -> Num)) == update(Acc, n, s) && S(LOAD((r : Num)), s) == update(Acc, s(Reg(r)), s) && S(STO(r), s) == update(Reg(r), s(Acc), s) && S(ADD(r), s) == update(Acc, s(Reg(r)) + s(Acc), s)")
  s_def_c.set(@recursion.new_recursive_definition(inst_recursion())(t2))
}

///|
let s_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("S_DEF")

///|
/// `S_DEF`
pub fn s_def() -> @kernel.Thm {
  s_def_c.get()
}

///|
/// S'_DEF
fn step_8() -> Unit raise {
  let t3 = @term_syntax.parse_term("(S' : (List[Inst], (Cell) -> Num, Cell) -> Num)(NIL, (s : (Cell) -> Num)) == s && S'(CONS((inst : Inst), (rest : List[Inst])), s) == S'(rest, S(inst, s))")
  s_p_def_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(t3))
}

///|
let s_p_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("S'_DEF")

///|
/// `S'_DEF`
pub fn s_p_def() -> @kernel.Thm {
  s_p_def_c.get()
}

///|
/// C_DEF
fn step_9() -> Unit raise {
  let t4 = @term_syntax.parse_term("(C : (Exp, (List[Char]) -> Num, Num) -> List[Inst])(Lit((n : Num)), (map : (List[Char]) -> Num), (r : Num)) == [LI(n)] && C(Var((v : List[Char])), map, r) == [LOAD(map(v))] && C(Plus((e1 : Exp), (e2 : Exp)), map, r) == APPEND(APPEND(C(e1, map, r), [STO(r)]), APPEND(C(e2, map, r + 1), [ADD(r)]))")
  c_def_c.set(@recursion.new_recursive_definition(exp_recursion())(t4))
}

///|
let c_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("C_DEF")

///|
/// `C_DEF`
pub fn c_def() -> @kernel.Thm {
  c_def_c.get()
}

///|
/// cellth
fn step_10() -> Unit raise {
  let t5 = @ind_types.injectivity("cell")
  cellth_c.set(@bool.conj(@ind_types.distinctness("cell"), t5))
}

///|
let cellth_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cellth")

///|
/// `cellth`
pub fn cellth() -> @kernel.Thm {
  cellth_c.get()
}

///|
/// S'_APPEND
fn step_11() -> Unit raise {
  let t6 = @tactics.then_tac(@lists.list_induct_tac, @simp.asm_simp_tac(@list.List([s_p_def(), @lists.append()])))
  s_p_append_c.set(@tactics.prove(@term_syntax.parse_term("∀ p1 : List[Inst], ∀ p2 : List[Inst], ∀ s : (Cell) -> Num, S'(APPEND(p1, p2), s) == S'(p2, S'(p1, s))"), t6))
}

///|
let s_p_append_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("S'_APPEND")

///|
/// `S'_APPEND`
pub fn s_p_append() -> @kernel.Thm {
  s_p_append_c.get()
}

///|
/// UPDATE_DIFFERENT
fn step_12() -> Unit raise {
  let t7 = @simp.simp_tac(@list.List([update_def()]))
  update_different_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ y : _, ∀ z : _, ∀ s : (_) -> _, !(x == y) → update(x, z, s, y) == s(y)"), t7))
}

///|
let update_different_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UPDATE_DIFFERENT")

///|
/// `UPDATE_DIFFERENT`
pub fn update_different() -> @kernel.Thm {
  update_different_c.get()
}

///|
/// UPDATE_SAME
fn step_13() -> Unit raise {
  let t8 = @simp.simp_tac(@list.List([update_def()]))
  update_same_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ z : _, ∀ s : (_) -> _, update(x, z, s, x) == z"), t8))
}

///|
let update_same_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UPDATE_SAME")

///|
/// `UPDATE_SAME`
pub fn update_same() -> @kernel.Thm {
  update_same_c.get()
}

///|
/// CORRECTNESS_THEOREM
fn step_14() -> Unit raise {
  let t10 = @equal.gsym(@class.skolem_thm())
  let t11 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((x : Num) < (y : Num) → x < y + 1 && !(x == y)) && x < x + 1")), cellth(), update_same(), update_different(), t10, @theorems.exists_refl()]))
  let t9 = @simp.rewrite_tac(@list.List([e_def(), s_def(), s_p_def(), update_def(), c_def(), s_p_append()]))
  let t12 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(exp_induct()), t9), t11)
  correctness_theorem_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Exp, ∀ map : (List[Char]) -> Num, ∀ s : (List[Char]) -> Num, ∀ s' : (Cell) -> Num, ∀ r : Num, (∀ v : List[Char], map(v) < r) → (∀ v : List[Char], s(v) == s'(Reg(map(v)))) → S'(C(e, map, r), s', Acc) == E(e, s) && (∀ x : Num, x < r → S'(C(e, map, r), s', Reg(x)) == s'(Reg(x)))"), t12))
}

///|
let correctness_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECTNESS_THEOREM")

///|
/// `CORRECTNESS_THEOREM`
pub fn correctness_theorem() -> @kernel.Thm {
  correctness_theorem_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
  step_7()
  step_8()
  step_9()
  step_10()
  step_11()
  step_12()
  step_13()
  step_14()
}
