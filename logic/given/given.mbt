// Translated from upstream Logic/given.ml; edit this file directly.

///|
/// FIRSTN
fn step_1() -> Unit raise {
  let t1 = @term_syntax.parse_term("(FIRSTN : (Num, List[_]) -> List[_])(0, (l : List[_])) == NIL && FIRSTN(SUC((n : Num)), l) == (if l == NIL { NIL } else { CONS(HD(l), FIRSTN(n, TL(l))) })")
  firstn_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t1))
}

///|
let firstn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FIRSTN")

///|
/// `FIRSTN`
pub fn firstn() -> @kernel.Thm {
  firstn_c.get()
}

///|
/// FIRSTN_TRIVIAL
fn step_2() -> Unit raise {
  let t4 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("SUC((x : Num)) <= (y : Num) → x <= y")), @arith.le_refl()]))
  let t3 = @simp.rewrite_tac(@list.List([@lists.hd(), @lists.tl(), @lists.length(), @lists.cons_11(), @nums.suc_inj()]))
  let t2 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil()]))
  let t5 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.simp_tac(@list.List([@arith.le(), firstn(), @lists.length_eq_nil()]))), @lists.list_induct_tac), t2), t3), t4)
  firstn_trivial_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ l : List[_], LENGTH(l) <= n → FIRSTN(n, l) == l"), t5))
}

///|
let firstn_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FIRSTN_TRIVIAL")

///|
/// `FIRSTN_TRIVIAL`
pub fn firstn_trivial() -> @kernel.Thm {
  firstn_trivial_c.get()
}

///|
/// FIRSTN_EMPTY
fn step_3() -> Unit raise {
  let t6 = @meson.meson_tac(@list.List([firstn_trivial(), @lists.length(), @arith.le_0()]))
  firstn_empty_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, (FIRSTN : (Num, List[_]) -> List[_])(n, (NIL : List[_])) == (NIL : List[_])"), t6))
}

///|
let firstn_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FIRSTN_EMPTY")

///|
/// `FIRSTN_EMPTY`
pub fn firstn_empty() -> @kernel.Thm {
  firstn_empty_c.get()
}

///|
/// FIRSTN_SUBLIST
fn step_4() -> Unit raise {
  let t9 = @meson.asm_meson_tac(@list.List([]))
  let t8 = @simp.asm_rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.hd(), @lists.tl(), @lists.mem()]))
  let t7 = @simp.rewrite_tac(@list.List([firstn(), @lists.mem()]))
  let t10 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t7), @lists.list_induct_tac), t8), t9)
  firstn_sublist_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ n : Num, ∀ l : List[_], MEM(x, FIRSTN(n, l)) → MEM(x, l)"), t10))
}

///|
let firstn_sublist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FIRSTN_SUBLIST")

///|
/// `FIRSTN_SUBLIST`
pub fn firstn_sublist() -> @kernel.Thm {
  firstn_sublist_c.get()
}

///|
/// FIRSTN_SUC
fn step_5() -> Unit raise {
  let t16 = @meson.asm_meson_tac(@list.List([]))
  let t15 = @simp.rewrite_tac(@list.List([@lists.hd(), @lists.tl(), @lists.el(), @lists.mem(), @lists.append()]))
  let t14 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.mem()]))
  let t13 = @simp.once_rewrite_tac(@list.List([firstn()]))
  let t11 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @lists.append(), @lists.el()]))
  let t12 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([firstn()])), @tactics.gen_tac), @class.cond_cases_tac), t11), @tactics.all_tac])
  let t17 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t12), @lists.list_induct_tac), t13), t14), t15), t16)
  firstn_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ n : Num, ∀ l : List[_], MEM(x, FIRSTN(SUC(n), l)) → MEM(x, APPEND(FIRSTN(n, l), [EL(n, l)]))"), t17))
}

///|
let firstn_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FIRSTN_SUC")

///|
/// `FIRSTN_SUC`
pub fn firstn_suc() -> @kernel.Thm {
  firstn_suc_c.get()
}

///|
/// FIRSTN_SHORT
fn step_6() -> Unit raise {
  let t18 = @meson.meson_tac(@list.List([firstn_trivial(), @int.arith_rule(@term_syntax.parse_term("(x : Num) <= (n : Num) → x <= SUC(n)"))]))
  firstn_short_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ l : List[_], LENGTH(l) <= n → FIRSTN(SUC(n), l) == FIRSTN(n, l)"), t18))
}

///|
let firstn_short_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FIRSTN_SHORT")

///|
/// `FIRSTN_SHORT`
pub fn firstn_short() -> @kernel.Thm {
  firstn_short_c.get()
}

///|
/// tautologous
fn step_7() -> Unit raise {
  tautologous_c.set(@pair.new_definition(@term_syntax.parse_term("(tautologous : ((Form) -> Bool) -> Bool)((cl : (Form) -> Bool)) == (∃ p : Form, IN(p, cl) && IN(op_tilde_tilde(p), cl))")))
}

///|
let tautologous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("tautologous")

///|
/// `tautologous`
pub fn tautologous() -> @kernel.Thm {
  tautologous_c.get()
}

///|
/// Logic/given.ml:52
fn step_8() -> Unit raise {
  @printer.parse_as_infix("subsumes", (12L, "right"))
}

///|
/// subsumes
fn step_9() -> Unit raise {
  subsumes_c.set(@pair.new_definition(@term_syntax.parse_term("(subsumes : ((Form) -> Bool, (Form) -> Bool) -> Bool)((cl : (Form) -> Bool), (cl' : (Form) -> Bool)) == (∃ i : (Num) -> Term, SUBSET(IMAGE(formsubst(i), cl), cl'))")))
}

///|
let subsumes_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subsumes")

///|
/// `subsumes`
pub fn subsumes() -> @kernel.Thm {
  subsumes_c.get()
}

///|
/// subsumes_REFL
fn step_10() -> Unit raise {
  let t21 = @meson.meson_tac(@list.List([]))
  let t20 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image(), @fol.formsubst_triv()]))
  let t19 = @tactics.exists_tac(@term_syntax.parse_term("V"))
  let t22 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([subsumes()]))), t19), t20), t21)
  subsumes_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl : (Form) -> Bool, subsumes(cl, cl)"), t22))
}

///|
let subsumes_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subsumes_REFL")

///|
/// `subsumes_REFL`
pub fn subsumes_refl() -> @kernel.Thm {
  subsumes_refl_c.get()
}

///|
/// subsumes_TRANS
fn step_11() -> Unit raise {
  let t51 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @fol.termsubst_termsubst(), @trivia.o_thm()]))
  let t50 = @tactics.repeat_tac(@tactics.gen_tac)
  let t49 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.map_o())]))
  let t48 = @simp.simp_tac(@list.List([@prenex.qfree(), @fol.formsubst(), @trivia.o_thm(), @equal.gsym(@fol.termsubst_termsubst())]))
  let t47 = @tactics.match_mp_tac(@fol.form_induction())
  let t46 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, qfree(p) → formsubst(o(termsubst((j : (Num) -> Term)), (i : (Num) -> Term)), p) == formsubst(j, formsubst(i, p))"), fn(x44 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x44
    @meson.asm_meson_tac(@list.List([th_1, @resolution.qfree_literal()]))
  })
  let t43 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, IN(p, (cl1 : (Form) -> Bool)) → formsubst(o(termsubst((j : (Num) -> Term)), (i : (Num) -> Term)), p) == formsubst(j, formsubst(i, p))"), fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x41
    @meson.meson_tac(@list.List([th]))
  })
  let t40 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image()]))
  let t39 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(IMAGE(formsubst((j : (Num) -> Term)), (cl2 : (Form) -> Bool)), (cl3 : (Form) -> Bool))"))
  let t38 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(IMAGE(formsubst((i : (Num) -> Term)), (cl1 : (Form) -> Bool)), (cl2 : (Form) -> Bool))"))
  let t37 = @tactics.exists_tac(@term_syntax.parse_term("o(termsubst((j : (Num) -> Term)), (i : (Num) -> Term))"))
  let t34 = @term_syntax.parse_term("(j : (Num) -> Term)")
  let t36 = @tactics.disch_then((x35 : @kernel.Thm) => @tactics.x_choose_tac(t34, x35))
  let t28 = @term_syntax.parse_term("(i : (Num) -> Term)")
  let t33 = @tactics.disch_then(@tactics.conjuncts_then2((x29 : @kernel.Thm) => @tactics.x_choose_tac(t28, x29), fn(x30 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s31 = @tactics.mp_tac(x30)
    fn(x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s31(x32)
    }
  }))
  let t27 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x24 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s25 = @tactics.mp_tac(x24)
    fn(x26 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s25(x26)
    }
  }))
  let t23 = @simp.rewrite_tac(@list.List([subsumes(), @resolution.clause()]))
  let t52 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t23), t27), t33), t36), t37), t38), t39), t40), t43), t46), t47), t48), t49), t50), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t51)
  subsumes_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl1 : (Form) -> Bool, ∀ cl2 : (Form) -> Bool, ∀ cl3 : (Form) -> Bool, clause(cl1) && subsumes(cl1, cl2) && subsumes(cl2, cl3) → subsumes(cl1, cl3)"), t52))
}

///|
let subsumes_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subsumes_TRANS")

///|
/// `subsumes_TRANS`
pub fn subsumes_trans() -> @kernel.Thm {
  subsumes_trans_c.get()
}

///|
/// Logic/given.ml:92
fn step_12() -> Unit raise {
  @printer.parse_as_infix("SUBSUMES", (12L, "right"))
}

///|
/// SUBSUMES
fn step_13() -> Unit raise {
  subsumes_v1_c.set(@pair.new_definition(@term_syntax.parse_term("(SUBSUMES : (((Form) -> Bool) -> Bool, ((Form) -> Bool) -> Bool) -> Bool)((s : ((Form) -> Bool) -> Bool), (s' : ((Form) -> Bool) -> Bool)) == (∀ cl' : (Form) -> Bool, IN(cl', s') → (∃ cl : (Form) -> Bool, IN(cl, s) && subsumes(cl, cl')))")))
}

///|
let subsumes_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSUMES")

///|
/// `SUBSUMES`
pub fn subsumes_v1() -> @kernel.Thm {
  subsumes_v1_c.get()
}

///|
/// SUBSUMES_REFL
fn step_14() -> Unit raise {
  let t53 = @meson.meson_tac(@list.List([subsumes_refl()]))
  let t54 = @tactics.then_tac(@simp.rewrite_tac(@list.List([subsumes_v1()])), t53)
  subsumes_refl_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((Form) -> Bool) -> Bool, SUBSUMES(s, s)"), t54))
}

///|
let subsumes_refl_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSUMES_REFL")

///|
/// `SUBSUMES_REFL`
pub fn subsumes_refl_v1() -> @kernel.Thm {
  subsumes_refl_v1_c.get()
}

///|
/// SUBSUMES_UNION
fn step_15() -> Unit raise {
  let t55 = @meson.meson_tac(@list.List([]))
  let t56 = @tactics.then_tac(@simp.rewrite_tac(@list.List([subsumes_v1(), @sets.in_union()])), t55)
  subsumes_union_c.set(@tactics.prove(@term_syntax.parse_term("SUBSUMES((s : ((Form) -> Bool) -> Bool), (s' : ((Form) -> Bool) -> Bool)) && SUBSUMES((t : ((Form) -> Bool) -> Bool), (t' : ((Form) -> Bool) -> Bool)) → SUBSUMES(UNION(s, t), UNION(s', t'))"), t56))
}

///|
let subsumes_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSUMES_UNION")

///|
/// `SUBSUMES_UNION`
pub fn subsumes_union() -> @kernel.Thm {
  subsumes_union_c.get()
}

///|
/// SUBSUMES_TRANS
fn step_16() -> Unit raise {
  let t57 = @meson.meson_tac(@list.List([subsumes_trans()]))
  let t58 = @tactics.then_tac(@simp.rewrite_tac(@list.List([subsumes_v1()])), t57)
  subsumes_trans_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((Form) -> Bool) -> Bool, ∀ t : ((Form) -> Bool) -> Bool, ∀ u : ((Form) -> Bool) -> Bool, (∀ c : (Form) -> Bool, IN(c, s) → clause(c)) && SUBSUMES(s, t) && SUBSUMES(t, u) → SUBSUMES(s, u)"), t58))
}

///|
let subsumes_trans_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSUMES_TRANS")

///|
/// `SUBSUMES_TRANS`
pub fn subsumes_trans_v1() -> @kernel.Thm {
  subsumes_trans_v1_c.get()
}

///|
/// SUBSUMES_SUBSET
fn step_17() -> Unit raise {
  let t59 = @meson.meson_tac(@list.List([]))
  let t60 = @tactics.then_tac(@simp.rewrite_tac(@list.List([subsumes_v1(), @sets.subset()])), t59)
  subsumes_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((Form) -> Bool) -> Bool, ∀ t : ((Form) -> Bool) -> Bool, ∀ u : ((Form) -> Bool) -> Bool, SUBSUMES(s, t) && SUBSET(s, u) → SUBSUMES(u, t)"), t60))
}

///|
let subsumes_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSUMES_SUBSET")

///|
/// `SUBSUMES_SUBSET`
pub fn subsumes_subset() -> @kernel.Thm {
  subsumes_subset_c.get()
}

///|
/// SUBSUMES_CLAUSES
fn step_18() -> Unit raise {
  let t61 = @meson.meson_tac(@list.List([]))
  let t62 = @tactics.then_tac(@simp.rewrite_tac(@list.List([subsumes_v1(), @sets.in_insert(), @sets.not_in_empty()])), t61)
  subsumes_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : ((Form) -> Bool) -> Bool, SUBSUMES(s, {})) && (∀ s : ((Form) -> Bool) -> Bool, SUBSUMES(s, INSERT((x : (Form) -> Bool), (t : ((Form) -> Bool) -> Bool))) == (SUBSUMES(s, {x}) && SUBSUMES(s, t)))"), t62))
}

///|
let subsumes_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSUMES_CLAUSES")

///|
/// `SUBSUMES_CLAUSES`
pub fn subsumes_clauses() -> @kernel.Thm {
  subsumes_clauses_c.get()
}

///|
/// SUBSUMES_SUBSET_REFL
fn step_19() -> Unit raise {
  let t63 = @meson.meson_tac(@list.List([subsumes_subset(), subsumes_refl_v1()]))
  subsumes_subset_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((Form) -> Bool) -> Bool, ∀ t : ((Form) -> Bool) -> Bool, SUBSET(s, t) → SUBSUMES(t, s)"), t63))
}

///|
let subsumes_subset_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSUMES_SUBSET_REFL")

///|
/// `SUBSUMES_SUBSET_REFL`
pub fn subsumes_subset_refl() -> @kernel.Thm {
  subsumes_subset_refl_c.get()
}

///|
/// allresolvents
fn step_20() -> Unit raise {
  allresolvents_c.set(@pair.new_definition(@term_syntax.parse_term("(allresolvents : (((Form) -> Bool) -> Bool, ((Form) -> Bool) -> Bool, (Form) -> Bool) -> Bool)((s1 : ((Form) -> Bool) -> Bool), (s2 : ((Form) -> Bool) -> Bool)) == {(c : (Form) -> Bool) | ∃ c1 : (Form) -> Bool, ∃ c2 : (Form) -> Bool, IN(c1, s1) && IN(c2, s2) && isaresolvent(c, (c1, c2))}")))
}

///|
let allresolvents_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("allresolvents")

///|
/// `allresolvents`
pub fn allresolvents() -> @kernel.Thm {
  allresolvents_c.get()
}

///|
/// allntresolvents
fn step_21() -> Unit raise {
  allntresolvents_c.set(@pair.new_definition(@term_syntax.parse_term("(allntresolvents : (((Form) -> Bool) -> Bool, ((Form) -> Bool) -> Bool, (Form) -> Bool) -> Bool)((s1 : ((Form) -> Bool) -> Bool), (s2 : ((Form) -> Bool) -> Bool)) == {(r : (Form) -> Bool) | IN(r, allresolvents(s1, s2)) && !tautologous(r)}")))
}

///|
let allntresolvents_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("allntresolvents")

///|
/// `allntresolvents`
pub fn allntresolvents() -> @kernel.Thm {
  allntresolvents_c.get()
}

///|
/// TERMSUBST_TERMSUBST_o
fn step_22() -> Unit raise {
  let t64 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @fol.termsubst_termsubst()]))
  termsubst_termsubst_o_c.set(@tactics.prove(@term_syntax.parse_term("termsubst(o(termsubst((j : (Num) -> Term)), (i : (Num) -> Term))) == o(termsubst(j), termsubst(i))"), t64))
}

///|
let termsubst_termsubst_o_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERMSUBST_TERMSUBST_o")

///|
/// `TERMSUBST_TERMSUBST_o`
pub fn termsubst_termsubst_o() -> @kernel.Thm {
  termsubst_termsubst_o_c.get()
}

///|
/// FORMSUBST_FORMSUBST
fn step_23() -> Unit raise {
  let t69 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.map_o()), termsubst_termsubst_o()]))
  let t68 = @simp.simp_tac(@list.List([@fol.formsubst(), @prenex.qfree()]))
  let t67 = @tactics.match_mp_tac(@fol.form_induction())
  let t65 = @term_syntax.parse_term("(p : Form)")
  let t66 = @tactics.spec_tac(@term_syntax.parse_term("(p : Form)"), t65)
  let t70 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t66), t67), t68), t69)
  formsubst_formsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ i : (Num) -> Term, ∀ j : (Num) -> Term, qfree(p) → formsubst(j, formsubst(i, p)) == formsubst(o(termsubst(j), i), p)"), t70))
}

///|
let formsubst_formsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_FORMSUBST")

///|
/// `FORMSUBST_FORMSUBST`
pub fn formsubst_formsubst() -> @kernel.Thm {
  formsubst_formsubst_c.get()
}

///|
/// ISARESOLVENT_SYM
fn step_24() -> Unit raise {
  let t735 = @simp.asm_rewrite_tac(@list.List([@class.fun_eq_thm(), @fol.termsubst_triv(), @trivia.i_def()]))
  let t734 = @simp.rewrite_tac(@list.List([@unif.formsubst_termsubst_lemma()]))
  let t733 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t731 = @term_syntax.parse_term("(q : Form)")
  let t732 = @tactics.spec_tac(@term_syntax.parse_term("(q : Form)"), t731)
  let t730 = @list.List([@meson.asm_meson_tac(@list.List([@prenex.qfree_formsubst(), @sets.subset(), @resolution.clause(), @resolution.qfree_literal()])), @tactics.all_tac])
  let t729 = @tactics.subgoal_then(@term_syntax.parse_term("qfree((q : Form))"), fn(x726 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s727 = @tactics.mp_tac(x726)
    fn(x728 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s727(x728)
    }
  })
  let t725 = @simp.gen_rewrite_tac(fn(x722 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s723 = @equal.rand_conv(x722)
    fn(x724 : @kernel.Term) -> @kernel.Thm raise {
      s723(x724)
    }
  }, @list.List([@equal.gsym(@fol.formsubst_triv())]))
  let t721 = @tactics.conv_tac(@equal.sym_conv)
  let t720 = @simp.asm_rewrite_tac(@list.List([]))
  let t719 = @tactics.exists_tac(@term_syntax.parse_term("formsubst((s2 : (Num) -> Term), (q : Form))"))
  let t718 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) → !(b : Bool)) == (b → a)"))]))
  let t716 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @fol.termsubst_triv(), @trivia.i_def()]))
  let t715 = @simp.asm_rewrite_tac(@list.List([]))
  let t714 = @simp.rewrite_tac(@list.List([@unif.formsubst_termsubst_lemma()]))
  let t713 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t712 = @simp.gen_rewrite_tac(fn(x711 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x707 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x701 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s702 = @equal.binder_conv(x701)
        fn(x703 : @kernel.Term) -> @kernel.Thm raise {
          s702(x703)
        }
      })((fn(x704 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s705 = @equal.rand_conv(x704)
        fn(x706 : @kernel.Term) -> @kernel.Thm raise {
          s705(x706)
        }
      })(x707))
    })((fn(x708 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s709 = @equal.rand_conv(x708)
      fn(x710 : @kernel.Term) -> @kernel.Thm raise {
        s709(x710)
      }
    })(x711))
  }, @list.List([@equal.gsym(@fol.formsubst_triv())]))
  let t699 = @term_syntax.parse_term("(r : Form)")
  let t700 = @tactics.spec_tac(@term_syntax.parse_term("(r : Form)"), t699)
  let t698 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.clause(), @resolution.qfree_literal()])), @tactics.all_tac])
  let t697 = @tactics.subgoal_then(@term_syntax.parse_term("qfree((r : Form))"), fn(x694 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s695 = @tactics.mp_tac(x694)
    fn(x696 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s695(x696)
    }
  })
  let t693 = @tactics.subgoal_then(@term_syntax.parse_term("formsubst((s2 : (Num) -> Term), formsubst((r2 : (Num) -> Term), (r : Form))) == r"), fn(x691 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_15 = x691
    @meson.asm_meson_tac(@list.List([th_15]))
  })
  let t690 = @simp.asm_rewrite_tac(@list.List([]))
  let t717 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Form)"))(@tactics.strip_assume_tac)), t690), t693), t697), t698), t700), t712), t713), t714), t715), t716), @tactics.all_tac])
  let t689 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (a' : Bool)) && ((b : Bool) → (b' : Bool)) → a && b → a' && b'")))
  let t688 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_image()]))
  let t687 = @fol.expand_tac("c2'")
  let t686 = @tactics.undisch_tac(@term_syntax.parse_term("IN((q : Form), DIFF((c2' : (Form) -> Bool), IMAGE(formsubst((r2 : (Num) -> Term)), (ps2 : (Form) -> Bool))))"))
  let t684 = @meson.asm_meson_tac(@list.List([@sets.in_diff()]))
  let t683 = @simp.rewrite_tac(@list.List([@resolution.fvs(), @sets.in_unions(), @sets.in_elim_thm()]))
  let t682 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) → !(a && (b : Bool)) → !b")))
  let t678 = @term_syntax.parse_term("(x : Num)")
  let t681 = @tactics.disch_then(fn(x680 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x675 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s676 = @tactics.mp_tac(x675)
      fn(x677 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s676(x677)
      }
    })(((x679 : @kernel.Thm) => @bool.spec(t678, x679))(x680))
  })
  let t674 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty()]))
  let t673 = @tactics.undisch_tac(@term_syntax.parse_term("INTER(FVS((c2' : (Form) -> Bool)), FVS((c1 : (Form) -> Bool))) == {}"))
  let t672 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((x : Num), FVS((c1 : (Form) -> Bool)))"), fn(x670 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_14 = x670
    @simp.rewrite_tac(@list.List([th_14, @trivia.o_thm()]))
  })
  let t669 = @fol.expand_tac("k")
  let t668 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t667 = @tactics.match_mp_tac(@fol.formsubst_valuation())
  let t666 = @simp.simp_tac(@list.List([formsubst_formsubst()]))
  let t664 = @meson.asm_meson_tac(@list.List([@resolution.clause(), @resolution.qfree_literal(), @prenex.qfree_formsubst()]))
  let t663 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t662 = @tactics.disch_then(fn(x661 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x658 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s659 = @tactics.mp_tac(x658)
      fn(x660 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s659(x660)
      }
    })(@bool.conjunct1(x661))
  })
  let t657 = @simp.rewrite_tac(@list.List([@sets.in_diff()]))
  let t656 = @fol.expand_tac("c2'")
  let t665 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("IN((q : Form), DIFF((c2' : (Form) -> Bool), IMAGE(formsubst((r2 : (Num) -> Term)), (ps2 : (Form) -> Bool))))")), t656), t657), t662), t663), t664), @tactics.all_tac])
  let t685 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("qfree((q : Form))"), fn(x653 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s654 = @tactics.mp_tac(x653)
    fn(x655 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s654(x655)
    }
  }), t665), t666), @tactics.disch_tac), t667), t668), @tactics.disch_tac), t669), t672), t673), t674), t681), t682), t683), t684), @tactics.all_tac])
  let t652 = @tactics.exists_tac(@term_syntax.parse_term("formsubst((s2 : (Num) -> Term), (q : Form))"))
  let t650 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @fol.termsubst_triv(), @trivia.i_def()]))
  let t649 = @simp.asm_rewrite_tac(@list.List([]))
  let t648 = @simp.rewrite_tac(@list.List([@unif.formsubst_termsubst_lemma()]))
  let t647 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t646 = @simp.gen_rewrite_tac(fn(x645 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x641 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x635 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s636 = @equal.binder_conv(x635)
        fn(x637 : @kernel.Term) -> @kernel.Thm raise {
          s636(x637)
        }
      })((fn(x638 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s639 = @equal.rand_conv(x638)
        fn(x640 : @kernel.Term) -> @kernel.Thm raise {
          s639(x640)
        }
      })(x641))
    })((fn(x642 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s643 = @equal.rand_conv(x642)
      fn(x644 : @kernel.Term) -> @kernel.Thm raise {
        s643(x644)
      }
    })(x645))
  }, @list.List([@equal.gsym(@fol.formsubst_triv())]))
  let t634 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, qfree(p) → formsubst((s1 : (Num) -> Term), formsubst((r1 : (Num) -> Term), p)) == p"), fn(x632 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_13 = x632
    @meson.asm_meson_tac(@list.List([th_13, @sets.subset(), @resolution.clause(), @resolution.qfree_literal()]))
  })
  let t631 = @tactics.subgoal_then(@term_syntax.parse_term("formsubst((s1 : (Num) -> Term), formsubst((r1 : (Num) -> Term), (q : Form))) == q && formsubst(s1, formsubst(r1, (r : Form))) == r"), fn(x629 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_12 = x629
    @meson.asm_meson_tac(@list.List([th_12]))
  })
  let t625 = @term_syntax.parse_term("formsubst((s1 : (Num) -> Term))")
  let t628 = @tactics.disch_then(fn(x627 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x622 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s623 = @tactics.mp_tac(x622)
      fn(x624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s623(x624)
      }
    })(((x626 : @kernel.Thm) => @equal.ap_term(t625, x626))(x627))
  })
  let t621 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x615 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s616 = @tactics.mp_tac(x615)
    fn(x617 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s616(x617)
    }
  }, fn(x618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s619 = @tactics.assume_tac(x618)
    fn(x620 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s619(x620)
    }
  }))
  let t614 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Form)"))(fn(x611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s612 = @tactics.mp_tac(x611)
    fn(x613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s612(x613)
    }
  }))
  let t610 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t609 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_image()]))
  let t608 = @tactics.undisch_tac(@term_syntax.parse_term("IN((q : Form), DIFF((c1 : (Form) -> Bool), (ps0 : (Form) -> Bool)))"))
  let t607 = @fol.expand_tac("c1'")
  let t605 = @meson.asm_meson_tac(@list.List([@sets.in_diff()]))
  let t604 = @simp.rewrite_tac(@list.List([@resolution.fvs(), @sets.in_unions(), @sets.in_elim_thm()]))
  let t603 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Num), FVS((c1 : (Form) -> Bool)))"), fn(x601 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_11 = x601
    @simp.rewrite_tac(@list.List([th_11, @trivia.o_thm()]))
  })
  let t600 = @fol.expand_tac("k")
  let t599 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t598 = @tactics.match_mp_tac(@fol.formsubst_valuation())
  let t597 = @simp.simp_tac(@list.List([formsubst_formsubst()]))
  let t596 = @list.List([@meson.asm_meson_tac(@list.List([@sets.in_diff(), @resolution.clause(), @resolution.qfree_literal()])), @tactics.all_tac])
  let t606 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("qfree((q : Form))"), fn(x593 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s594 = @tactics.mp_tac(x593)
    fn(x595 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s594(x595)
    }
  }), t596), t597), @tactics.disch_tac), t598), t599), @tactics.disch_tac), t600), t603), t604), t605), @tactics.all_tac])
  let t651 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("formsubst((r1 : (Num) -> Term), (q : Form))")), @tactics.conj_tac), t606), @tactics.disj2_tac), t607), t608), t609), @tactics.strip_tac), @tactics.conj_tac), t610), t614), t621), t628), t631), t634), t646), t647), t648), t649), t650), @tactics.all_tac])
  let t592 = @simp.rewrite_tac(@list.List([@sets.in_union()]))
  let t591 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s586 = @tactics.subst_all_tac(x585)
    fn(x587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s586(x587)
    }
  }, fn(x588 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s589 = @tactics.mp_tac(x588)
    fn(x590 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s589(x590)
    }
  }))
  let t584 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : Form)"))(fn(x581 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s582 = @tactics.mp_tac(x581)
    fn(x583 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s582(x583)
    }
  }))
  let t580 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)"))
  let t579 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.subset(), @sets.in_elim_thm()]))
  let t577 = @meson.asm_meson_tac(@list.List([@resolution.qfree_literal(), @resolution.clause()]))
  let t576 = @simp.simp_tac(@list.List([@sets.in_image(), @theorems.left_imp_exists_thm(), @prenex.qfree_formsubst()]))
  let t575 = @fol.expand_tac("c2'")
  let t574 = @tactics.undisch_tac(@term_syntax.parse_term("IN((p : Form), (c2' : (Form) -> Bool))"))
  let t573 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.qfree_literal(), @resolution.clause()])), @tactics.all_tac])
  let t572 = @simp.asm_rewrite_tac(@list.List([]))
  let t571 = @tactics.repeat_tac(@tactics.strip_tac)
  let t570 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_image(), @sets.in_diff()]))
  let t569 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, IN(p, UNION(DIFF((c1 : (Form) -> Bool), (ps0 : (Form) -> Bool)), DIFF((c2' : (Form) -> Bool), IMAGE(formsubst((r2 : (Num) -> Term)), (ps2 : (Form) -> Bool))))) → qfree(p)"), fn(x567 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_10 = x567
    @meson.asm_meson_tac(@list.List([@trivia.o_thm(), th_10]))
  })
  let t578 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image()])), t569), t570), t571), t572), t573), t574), t575), t576), t577), @tactics.all_tac])
  let t566 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE(o(formsubst((k : (Num) -> Term)), formsubst((i : (Num) -> Term))), UNION(DIFF((c1 : (Form) -> Bool), (ps0 : (Form) -> Bool)), DIFF((c2' : (Form) -> Bool), IMAGE(formsubst((r2 : (Num) -> Term)), (ps2 : (Form) -> Bool))))) == IMAGE(formsubst(k), UNION(DIFF(c1, ps0), DIFF(c2', IMAGE(formsubst(r2), ps2))))"), fn(x563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s564 = @tactics.subst1_tac(x563)
    fn(x565 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s564(x565)
    }
  })
  let t562 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o())]))
  let t561 = @tactics.exists_tac(@term_syntax.parse_term("(k : (Num) -> Term)"))
  let t560 = @simp.rewrite_tac(@list.List([subsumes()]))
  let t559 = @simp.abbrev_tac(@term_syntax.parse_term("(k : (Num) -> Term) == ((x : Num) => if IN(x, FVS((c1 : (Form) -> Bool))) { termsubst((j : (Num) -> Term), (r1 : (Num) -> Term)(x)) } else { termsubst(j, (s2 : (Num) -> Term)(x)) })"))
  let t557 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @trivia.i_def(), @lists.all_t()]))
  let t556 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@trivia.o_assoc())]))
  let t555 = @simp.rewrite_tac(@list.List([termsubst_termsubst_o()]))
  let t554 = @tactics.match_mp_tac(@lists.map_eq())
  let t553 = @tactics.repeat_tac(@tactics.gen_tac)
  let t552 = @simp.simp_tac(@list.List([@prenex.qfree(), @fol.formsubst()]))
  let t551 = @tactics.match_mp_tac(@fol.form_induction())
  let t549 = @term_syntax.parse_term("(q : Form)")
  let t550 = @tactics.spec_tac(@term_syntax.parse_term("(q : Form)"), t549)
  let t548 = @simp.simp_tac(@list.List([formsubst_formsubst()]))
  let t547 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset(), @resolution.clause(), @resolution.qfree_literal()])), @tactics.all_tac])
  let t546 = @tactics.subgoal_then(@term_syntax.parse_term("qfree((q : Form))"), fn(x543 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s544 = @tactics.mp_tac(x543)
    fn(x545 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s544(x545)
    }
  })
  let t541 = @meson.meson_tac(@list.List([]))
  let t540 = @simp.rewrite_tac(@list.List([@sets.subset(), @resolution.fvs(), @sets.in_unions(), @sets.in_image(), @sets.in_elim_thm()]))
  let t539 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((ps2 : (Form) -> Bool), (c2 : (Form) -> Bool))"))
  let t538 = @tactics.undisch_tac(@term_syntax.parse_term("IN((q : Form), (ps2 : (Form) -> Bool))"))
  let t537 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : Num), FV(formsubst((r2 : (Num) -> Term), (q : Form))))"))
  let t536 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) → !(a && (b : Bool)) → !b")))
  let t532 = @term_syntax.parse_term("(x : Num)")
  let t535 = @tactics.disch_then(fn(x534 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s530 = @tactics.mp_tac(x529)
      fn(x531 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s530(x531)
      }
    })(((x533 : @kernel.Thm) => @bool.spec(t532, x533))(x534))
  })
  let t528 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @sets.in_inter()]))
  let t527 = @fol.expand_tac("c2'")
  let t526 = @tactics.undisch_tac(@term_syntax.parse_term("INTER(FVS((c2' : (Form) -> Bool)), FVS((c1 : (Form) -> Bool))) == {}"))
  let t525 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((x : Num), FVS((c1 : (Form) -> Bool)))"), fn(x523 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_9 = x523
    @simp.rewrite_tac(@list.List([@trivia.o_thm(), th_9]))
  })
  let t522 = @simp.rewrite_tac(@list.List([]))
  let t521 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t542 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.formsubst_valuation()), t521), @tactics.disch_tac), t522), t525), t526), t527), t528), t535), t536), t537), t538), t539), t540), t541), @tactics.all_tac])
  let t520 = @tactics.exists_tac(@term_syntax.parse_term("formsubst(o(termsubst((j : (Num) -> Term)), (s2 : (Num) -> Term)), formsubst((r2 : (Num) -> Term), (q : Form)))"))
  let t519 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t518 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t517 = @tactics.subgoal_then(@term_syntax.parse_term("formsubst((j : (Num) -> Term), (q : Form)) == (P : Form)"), fn(x516 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x513 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s514 = @tactics.subst1_tac(x513)
      fn(x515 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s514(x515)
      }
    })(@equal.sym(x516))
  })
  let t512 = @simp.asm_rewrite_tac(@list.List([]))
  let t511 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Form)"))
  let t510 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t509 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)"))
  let t508 = @tactics.x_gen_tac(@term_syntax.parse_term("(rrr : Form)"))
  let t506 = @meson.asm_meson_tac(@list.List([@sets.subset(), @resolution.clause(), @resolution.qfree_literal()]))
  let t505 = @tactics.match_mp_tac(@equal.gsym(formsubst_formsubst()))
  let t503 = @meson.asm_meson_tac(@list.List([@sets.subset(), @resolution.clause()]))
  let t502 = @simp.rewrite_tac(@list.List([@resolution.formsubst_literal()]))
  let t504 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@resolution.negate_negate()), t502), t503), @tactics.all_tac])
  let t501 = @tactics.subgoal_then(@term_syntax.parse_term("op_tilde_tilde(op_tilde_tilde(formsubst((j : (Num) -> Term), formsubst((r1 : (Num) -> Term), (p : Form))))) == formsubst(j, formsubst(r1, p))"), fn(x498 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s499 = @tactics.subst1_tac(x498)
    fn(x500 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s499(x500)
    }
  })
  let t497 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t496 = @tactics.subgoal_then(@term_syntax.parse_term("(P : Form) == op_tilde_tilde(formsubst((j : (Num) -> Term), formsubst((r1 : (Num) -> Term), (p : Form))))"), fn(x493 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s494 = @tactics.subst1_tac(x493)
    fn(x495 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s494(x495)
    }
  })
  let t491 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t490 = @simp.asm_rewrite_tac(@list.List([@resolution.fvs(), @sets.in_unions(), @sets.in_elim_thm()]))
  let t489 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Num), FVS((c1 : (Form) -> Bool)))"), fn(x487 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_8 = x487
    @simp.rewrite_tac(@list.List([th_8]))
  })
  let t486 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t485 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t492 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.formsubst_valuation()), t485), @tactics.disch_tac), t486), t489), t490), t491), @tactics.all_tac])
  let t484 = @tactics.exists_tac(@term_syntax.parse_term("formsubst(o(termsubst((j : (Num) -> Term)), (r1 : (Num) -> Term)), (p : Form))"))
  let t483 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t507 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)")), @tactics.disch_tac), t483), t484), @tactics.conj_tac), t492), t496), t497), t501), t504), t505), t506), @tactics.all_tac])
  let t482 = @tactics.exists_tac(@term_syntax.parse_term("op_tilde_tilde((P : Form))"))
  let t481 = @simp.asm_rewrite_tac(@list.List([@resolution.formsubst_negate()]))
  let t476 = @term_syntax.parse_term("(p : Form)")
  let t477 = @list.List([@term_syntax.parse_term("formsubst((r1 : (Num) -> Term), (p : Form))"), t476])
  let t473 = @term_syntax.parse_term("(p : Form)")
  let t480 = @tactics.disch_then(fn(x479 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x475 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x470 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s471 = @tactics.mp_tac(x470)
        fn(x472 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s471(x472)
        }
      })(((x474 : @kernel.Thm) => @bool.gen(t473, x474))(x475))
    })(((x478 : @kernel.Thm) => @bool.specl(t477, x478))(x479))
  })
  let t469 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t468 = @simp.rewrite_tac(@list.List([]))
  let t463 = @term_syntax.parse_term("(p : Form)")
  let t464 = @list.List([@term_syntax.parse_term("op_tilde_tilde((p : Form))"), t463])
  let t460 = @term_syntax.parse_term("(p : Form)")
  let t467 = @tactics.disch_then(fn(x466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x462 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s458 = @tactics.mp_tac(x457)
        fn(x459 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s458(x459)
        }
      })(((x461 : @kernel.Thm) => @bool.gen(t460, x461))(x462))
    })(((x465 : @kernel.Thm) => @bool.specl(t464, x465))(x466))
  })
  let t456 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x450 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s451 = @tactics.assume_tac(x450)
    fn(x452 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s451(x452)
    }
  }, fn(x453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s454 = @tactics.mp_tac(x453)
    fn(x455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s454(x455)
    }
  }))
  let t449 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t448 = @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t447 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t446 = @simp.rewrite_tac(@list.List([@unif.unifies_v1(), @sets.in_union(), @sets.in_image(), @sets.in_elim_thm()]))
  let t445 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(P : Form)"))(fn(x442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s443 = @tactics.mp_tac(x442)
    fn(x444 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s443(x444)
    }
  }))
  let t441 = @simp.rewrite_tac(@list.List([@unif.unifies_v1()]))
  let t558 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("Unifies((j : (Num) -> Term), UNION((ps2 : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, IMAGE(formsubst((r1 : (Num) -> Term)), (ps0 : (Form) -> Bool)))}))")), t441), t445), t446), t447), t448), t449), t456), t467), t468), t469), t480), t481), @tactics.disch_tac), t482), @tactics.conj_tac), t507), t508), t509), t510), t511), @tactics.strip_tac), t512), @tactics.ap_term_tac), t517), t518), t519), t520), @tactics.conj_tac), t542), t546), t547), t548), t550), t551), t552), t553), @tactics.ap_term_tac), t554), t555), t556), t557), @tactics.all_tac])
  let t437 = @term_syntax.parse_term("(x : Num) => if IN(x, FVS((c1 : (Form) -> Bool))) { termsubst((j : (Num) -> Term), (r1 : (Num) -> Term)(x)) } else { termsubst(j, (s2 : (Num) -> Term)(x)) }")
  let t440 = @tactics.disch_then(fn(x439 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s435 = @tactics.mp_tac(x434)
      fn(x436 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s435(x436)
      }
    })(((x438 : @kernel.Thm) => @bool.spec(t437, x438))(x439))
  })
  let t433 = @tactics.undisch_tac(@term_syntax.parse_term("∀ i' : (Num) -> Term, Unifies(i', UNION((ps0 : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, IMAGE(formsubst((r2 : (Num) -> Term)), (ps2 : (Form) -> Bool)))})) → (∀ p : Form, qfree(p) → formsubst(i', p) == formsubst(i', formsubst((i : (Num) -> Term), p)))"))
  let t431 = @meson.asm_meson_tac(@list.List([@sets.subset(), @resolution.clause(), @resolution.qfree_literal()]))
  let t430 = @simp.asm_rewrite_tac(@list.List([@resolution.qfree_negate(), @prenex.qfree_formsubst()]))
  let t429 = @tactics.repeat_tac(@tactics.strip_tac)
  let t428 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_elim_thm(), @sets.in_image()]))
  let t427 = @meson.asm_meson_tac(@list.List([@sets.finite_subset(), @resolution.clause()]))
  let t426 = @tactics.repeat_tac(@tactics.match_mp_tac(@sets.finite_image()))
  let t425 = @simp.rewrite_tac(@list.List([@sets.finite_union()]))
  let t423 = @meson.meson_tac(@list.List([]))
  let t424 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_image()])), t423), @tactics.all_tac])
  let t432 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("{op_tilde_tilde((p : Form)) | IN(p, IMAGE(formsubst((r1 : (Num) -> Term)), (ps0 : (Form) -> Bool)))} == IMAGE(op_tilde_tilde, IMAGE(formsubst(r1), ps0))"), fn(x420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s421 = @tactics.subst1_tac(x420)
    fn(x422 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s421(x422)
    }
  }), t424), t425), @tactics.conj_tac), t426), t427), @tactics.all_tac])), t428), t429), t430), t431), @tactics.all_tac])
  let t419 = @simp.asm_rewrite_tac(@list.List([]))
  let t418 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("UNION((ps2 : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, IMAGE(formsubst((r1 : (Num) -> Term)), (ps0 : (Form) -> Bool)))})"), @unif.mgu_v1()))
  let t416 = @meson.asm_meson_tac(@list.List([@sets.subset(), @resolution.clause(), @resolution.qfree_literal()]))
  let t415 = @simp.asm_rewrite_tac(@list.List([@resolution.qfree_negate(), @prenex.qfree_formsubst()]))
  let t414 = @tactics.repeat_tac(@tactics.strip_tac)
  let t413 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_elim_thm(), @sets.in_image()]))
  let t412 = @meson.asm_meson_tac(@list.List([@sets.finite_subset(), @resolution.clause()]))
  let t411 = @tactics.repeat_tac(@tactics.match_mp_tac(@sets.finite_image()))
  let t410 = @simp.rewrite_tac(@list.List([@sets.finite_union()]))
  let t408 = @meson.meson_tac(@list.List([]))
  let t409 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_image()])), t408), @tactics.all_tac])
  let t417 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("{op_tilde_tilde((p : Form)) | IN(p, IMAGE(formsubst((r2 : (Num) -> Term)), (ps2 : (Form) -> Bool)))} == IMAGE(op_tilde_tilde, IMAGE(formsubst(r2), ps2))"), fn(x405 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s406 = @tactics.subst1_tac(x405)
    fn(x407 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s406(x407)
    }
  }), t409), t410), @tactics.conj_tac), t411), t412), @tactics.all_tac])), t413), t414), t415), t416), @tactics.all_tac])
  let t404 = @simp.asm_rewrite_tac(@list.List([]))
  let t403 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("UNION((ps0 : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, IMAGE(formsubst((r2 : (Num) -> Term)), (ps2 : (Form) -> Bool)))})"), @unif.mgu_v1()))
  let t402 = @fol.expand_tac("c1'")
  let t401 = @simp.abbrev_tac(@term_syntax.parse_term("(j : (Num) -> Term) == mgu(UNION((ps2 : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, IMAGE(formsubst((r1 : (Num) -> Term)), (ps0 : (Form) -> Bool)))}))"))
  let t400 = @simp.abbrev_tac(@term_syntax.parse_term("(i : (Num) -> Term) == mgu(UNION((ps0 : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, IMAGE(formsubst((r2 : (Num) -> Term)), (ps2 : (Form) -> Bool)))}))"))
  let t398 = @simp.simp_tac(@list.List([@lists.map_eq_degen(), @trivia.i_def(), @lists.all_t()]))
  let t397 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@lists.map_o())]))
  let t396 = @simp.simp_tac(@list.List([@fol.formsubst(), @prenex.qfree()]))
  let t395 = @tactics.match_mp_tac(@fol.form_induction())
  let t394 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, qfree(p) → formsubst((s1 : (Num) -> Term), formsubst((r1 : (Num) -> Term), p)) == p"), fn(x392 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_7 = x392
    @meson.asm_meson_tac(@list.List([@resolution.clause(), @sets.subset(), @resolution.qfree_literal(), th_7]))
  })
  let t391 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, IN(p, (ps0 : (Form) -> Bool)) → formsubst((s1 : (Num) -> Term), formsubst((r1 : (Num) -> Term), p)) == p"), fn(x389 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_6 = x389
    @meson.meson_tac(@list.List([th_6]))
  })
  let t388 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)"))
  let t399 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @trivia.o_thm()])), t388), t391), t394), t395), t396), t397), t398), @tactics.all_tac])
  let t387 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE(o(formsubst((s1 : (Num) -> Term)), formsubst((r1 : (Num) -> Term))), (ps0 : (Form) -> Bool)) == ps0"), fn(x384 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s385 = @tactics.subst1_tac(x384)
    fn(x386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s385(x386)
    }
  })
  let t383 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o())]))
  let t382 = @fol.expand_tac("c2'")
  let t381 = @tactics.disch_then(fn(x378 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s379 = @tactics.subst_all_tac(x378)
    fn(x380 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s379(x380)
    }
  })
  let t377 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s372 = @tactics.assume_tac(x371)
    fn(x373 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s372(x373)
    }
  }, fn(x374 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s375 = @tactics.mp_tac(x374)
    fn(x376 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s375(x376)
    }
  }))
  let t370 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s365 = @tactics.assume_tac(x364)
    fn(x366 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s365(x366)
    }
  }, fn(x367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s368 = @tactics.mp_tac(x367)
    fn(x369 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s368(x369)
    }
  }))
  let t363 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(ps0 : (Form) -> Bool)"))(fn(x360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s361 = @tactics.mp_tac(x360)
    fn(x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s361(x362)
    }
  }))
  let t358 = @meson.meson_tac(@list.List([]))
  let t357 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.subset(), @sets.in_elim_thm(), @sets.not_in_empty(), @sets.in_image()]))
  let t356 = @fol.expand_tac("c1'")
  let t355 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((ps1 : (Form) -> Bool), (c1' : (Form) -> Bool))"))
  let t354 = @tactics.undisch_tac(@term_syntax.parse_term("!((ps1 : (Form) -> Bool) == {})"))
  let t359 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("{(p : Form) | IN(p, (c1 : (Form) -> Bool)) && IN(formsubst((r1 : (Num) -> Term), p), (ps1 : (Form) -> Bool))}")), t354), t355), t356), t357), t358), @tactics.all_tac])
  let t353 = @tactics.subgoal_then(@term_syntax.parse_term("∃ ps0 : (Form) -> Bool, SUBSET(ps0, (c1 : (Form) -> Bool)) && !(ps0 == {}) && (ps1 : (Form) -> Bool) == IMAGE(formsubst((r1 : (Num) -> Term)), ps0)"), fn(x350 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s351 = @tactics.mp_tac(x350)
    fn(x352 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s351(x352)
    }
  })
  let t343 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t342 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @trivia.i_def()]))
  let t341 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@trivia.o_assoc())]))
  let t340 = @simp.rewrite_tac(@list.List([termsubst_termsubst_o()]))
  let t339 = @tactics.repeat_tac(@tactics.gen_tac)
  let t338 = @simp.simp_tac(@list.List([@fol.formsubst(), @prenex.qfree()]))
  let t337 = @tactics.match_mp_tac(@fol.form_induction())
  let t335 = @term_syntax.parse_term("(q : Form)")
  let t336 = @tactics.spec_tac(@term_syntax.parse_term("(q : Form)"), t335)
  let t334 = @simp.rewrite_tac(@list.List([@equal.gsym(@trivia.o_def())]))
  let t333 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t332 = @tactics.subgoal_then(@term_syntax.parse_term("formsubst((i : (Num) -> Term), (q : Form)) == (P : Form)"), fn(x331 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s329 = @tactics.subst1_tac(x328)
      fn(x330 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s329(x330)
      }
    })(@equal.sym(x331))
  })
  let t327 = @simp.simp_tac(@list.List([formsubst_formsubst()]))
  let t326 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset(), @resolution.clause(), @resolution.qfree_literal()])), @tactics.all_tac])
  let t325 = @tactics.subgoal_then(@term_syntax.parse_term("qfree((q : Form))"), fn(x322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s323 = @tactics.mp_tac(x322)
    fn(x324 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s323(x324)
    }
  })
  let t320 = @simp.rewrite_tac(@list.List([@trivia.i_thm(), @lists.all_t()]))
  let t319 = @simp.asm_rewrite_tac(@list.List([termsubst_termsubst_o()]))
  let t318 = @tactics.match_mp_tac(@lists.map_eq_degen())
  let t317 = @tactics.repeat_tac(@tactics.gen_tac)
  let t316 = @simp.simp_tac(@list.List([@fol.formsubst(), @prenex.qfree()]))
  let t315 = @tactics.match_mp_tac(@fol.form_induction())
  let t314 = @simp.simp_tac(@list.List([formsubst_formsubst()]))
  let t313 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, qfree(p) → formsubst((s1 : (Num) -> Term), formsubst((r1 : (Num) -> Term), p)) == p"), fn(x311 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x311
    @meson.asm_meson_tac(@list.List([th_5, @resolution.clause(), @resolution.qfree_literal()]))
  })
  let t310 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, IN(p, (c1 : (Form) -> Bool)) → formsubst((s1 : (Num) -> Term), formsubst((r1 : (Num) -> Term), p)) == p"), fn(x308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x308
    @meson.meson_tac(@list.List([th_4]))
  })
  let t307 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t306 = @fol.expand_tac("c1'")
  let t305 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t304 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((ps1 : (Form) -> Bool), (c1' : (Form) -> Bool))"))
  let t303 = @simp.rewrite_tac(@list.List([@resolution.fvs(), @sets.in_unions(), @sets.in_image(), @sets.in_elim_thm()]))
  let t301 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t302 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@resolution.fvs(), @sets.in_unions(), @sets.in_image(), @sets.in_elim_thm()])), t301), @tactics.all_tac])
  let t300 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (a' : Bool)) && ((b : Bool) → (b' : Bool)) → a → !(a' && b') → !b")))
  let t299 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : Num), FV(formsubst((r2 : (Num) -> Term), (q : Form))))"))
  let t295 = @term_syntax.parse_term("(x : Num)")
  let t298 = @tactics.disch_then(fn(x297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s293 = @tactics.mp_tac(x292)
      fn(x294 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s293(x294)
      }
    })(((x296 : @kernel.Thm) => @bool.spec(t295, x296))(x297))
  })
  let t291 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @sets.in_inter()]))
  let t290 = @fol.expand_tac("c2'")
  let t289 = @tactics.undisch_tac(@term_syntax.parse_term("INTER(FVS((c2' : (Form) -> Bool)), FVS((c1 : (Form) -> Bool))) == {}"))
  let t288 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((x : Num), FVS(IMAGE(formsubst((s1 : (Num) -> Term)), (ps1 : (Form) -> Bool))))"), fn(x286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x286
    @simp.rewrite_tac(@list.List([th_3]))
  })
  let t285 = @simp.rewrite_tac(@list.List([]))
  let t284 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t321 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.formsubst_valuation()), t284), @tactics.disch_tac), t285), t288), t289), t290), t291), t298), t299), t300), @tactics.conj_tac), t302), t303), t304), t305), t306), t307), t310), t313), t314), t315), t316), t317), @tactics.ap_term_tac), t318), t319), t320), @tactics.all_tac])
  let t283 = @tactics.exists_tac(@term_syntax.parse_term("formsubst((x : Num) => termsubst((i : (Num) -> Term), (s2 : (Num) -> Term)(x)), formsubst((r2 : (Num) -> Term), (q : Form)))"))
  let t282 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t281 = @simp.rewrite_tac(@list.List([@resolution.formsubst_negate()]))
  let t279 = @tactics.conjuncts_then2(fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s274 = @tactics.subst_all_tac(x273)
    fn(x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s274(x275)
    }
  }, fn(x276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s277 = @tactics.assume_tac(x276)
    fn(x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s277(x278)
    }
  })
  let t280 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : Form)"))(t279))
  let t272 = @tactics.disch_then(fn(x271 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x268 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s269 = @tactics.mp_tac(x268)
      fn(x270 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s269(x270)
      }
    })(@bool.conjunct1(x271))
  })
  let t267 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)"))
  let t266 = @tactics.x_gen_tac(@term_syntax.parse_term("(rrr : Form)"))
  let t264 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @trivia.i_def()]))
  let t263 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@trivia.o_assoc())]))
  let t262 = @simp.rewrite_tac(@list.List([termsubst_termsubst_o()]))
  let t261 = @tactics.repeat_tac(@tactics.gen_tac)
  let t260 = @simp.simp_tac(@list.List([@fol.formsubst(), @prenex.qfree()]))
  let t259 = @tactics.match_mp_tac(@fol.form_induction())
  let t257 = @term_syntax.parse_term("(q : Form)")
  let t258 = @tactics.spec_tac(@term_syntax.parse_term("(q : Form)"), t257)
  let t256 = @simp.simp_tac(@list.List([@prenex.qfree_formsubst(), formsubst_formsubst()]))
  let t254 = @tactics.conjuncts_then2(fn(x248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s249 = @tactics.subst_all_tac(x248)
    fn(x250 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s249(x250)
    }
  }, fn(x251 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s252 = @tactics.assume_tac(x251)
    fn(x253 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s252(x253)
    }
  })
  let t255 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : Form)"))(t254))
  let t247 = @simp.asm_rewrite_tac(@list.List([]))
  let t243 = @term_syntax.parse_term("(p : Form)")
  let t246 = @tactics.disch_then(fn(x245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s241 = @tactics.mp_tac(x240)
      fn(x242 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s241(x242)
      }
    })(((x244 : @kernel.Thm) => @bool.spec(t243, x244))(x245))
  })
  let t239 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image()]))
  let t238 = @fol.expand_tac("c1'")
  let t237 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((ps1 : (Form) -> Bool), (c1' : (Form) -> Bool))"))
  let t236 = @simp.simp_tac(@list.List([formsubst_formsubst(), @equal.gsym(@trivia.o_def())]))
  let t233 = @drule.match_mp(@resolution.qfree_literal())
  let t235 = @tactics.disch_then(fn(x234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s231 = @tactics.mp_tac(x230)
      fn(x232 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s231(x232)
      }
    })(t233(x234))
  })
  let t229 = @simp.simp_tac(@list.List([@equal.gsym(@resolution.formsubst_negate()), @resolution.negate_negate()]))
  let t227 = @meson.asm_meson_tac(@list.List([@resolution.clause()]))
  let t226 = @simp.asm_simp_tac(@list.List([@theorems.left_imp_exists_thm(), @resolution.formsubst_literal()]))
  let t222 = @term_syntax.parse_term("(p : Form)")
  let t225 = @tactics.disch_then(fn(x224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s220 = @tactics.mp_tac(x219)
      fn(x221 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s220(x221)
      }
    })(((x223 : @kernel.Thm) => @bool.spec(t222, x223))(x224))
  })
  let t218 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.subset()]))
  let t217 = @fol.expand_tac("c1'")
  let t228 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET((ps1 : (Form) -> Bool), (c1' : (Form) -> Bool))")), t217), t218), t225), t226), t227), @tactics.all_tac])
  let t216 = @tactics.subgoal_then(@term_syntax.parse_term("literal((p : Form))"), fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s214 = @tactics.mp_tac(x213)
    fn(x215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s214(x215)
    }
  })
  let t212 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t211 = @tactics.subgoal_then(@term_syntax.parse_term("(P : Form) == formsubst((i : (Num) -> Term), op_tilde_tilde((p : Form)))"), fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s209 = @tactics.subst1_tac(x208)
    fn(x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s209(x210)
    }
  })
  let t206 = @meson.asm_meson_tac(@list.List([]))
  let t205 = @simp.rewrite_tac(@list.List([@sets.in_unions(), @resolution.fvs(), @sets.in_elim_thm(), @sets.in_image()]))
  let t204 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Num), FVS(IMAGE(formsubst((s1 : (Num) -> Term)), (ps1 : (Form) -> Bool))))"), fn(x202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x202
    @simp.rewrite_tac(@list.List([th_2]))
  })
  let t201 = @simp.rewrite_tac(@list.List([]))
  let t200 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t207 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.formsubst_valuation()), t200), @tactics.disch_tac), t201), t204), t205), t206), @tactics.all_tac])
  let t199 = @tactics.exists_tac(@term_syntax.parse_term("formsubst((x : Num) => termsubst((i : (Num) -> Term), (r1 : (Num) -> Term)(x)), formsubst((s1 : (Num) -> Term), (p : Form)))"))
  let t198 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t197 = @tactics.disch_then(fn(x196 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x193 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s194 = @tactics.assume_tac(x193)
      fn(x195 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s194(x195)
      }
    })(@bool.conjunct2(x196))
  })
  let t192 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)"))
  let t265 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(rrr : Form)")), t192), t197), t198), t199), @tactics.conj_tac), t207), t211), t212), t216), t228), t229), t235), t236), t237), t238), t239), t246), t247), t255), t256), t258), t259), t260), t261), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t262), t263), t264), @tactics.all_tac])
  let t191 = @tactics.exists_tac(@term_syntax.parse_term("op_tilde_tilde((P : Form))"))
  let t190 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num) => if IN(x, FVS(IMAGE(formsubst((s1 : (Num) -> Term)), (ps1 : (Form) -> Bool)))) { termsubst((i : (Num) -> Term), (r1 : (Num) -> Term)(x)) } else { termsubst(i, (s2 : (Num) -> Term)(x)) }"))
  let t189 = @simp.rewrite_tac(@list.List([]))
  let t184 = @term_syntax.parse_term("(p : Form)")
  let t185 = @list.List([@term_syntax.parse_term("op_tilde_tilde((p : Form))"), t184])
  let t181 = @term_syntax.parse_term("(p : Form)")
  let t188 = @tactics.disch_then(fn(x187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s179 = @tactics.mp_tac(x178)
        fn(x180 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s179(x180)
        }
      })(((x182 : @kernel.Thm) => @bool.gen(t181, x182))(x183))
    })(((x186 : @kernel.Thm) => @bool.specl(t185, x186))(x187))
  })
  let t177 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s172 = @tactics.assume_tac(x171)
    fn(x173 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s172(x173)
    }
  }, fn(x174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s175 = @tactics.mp_tac(x174)
    fn(x176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s175(x176)
    }
  }))
  let t170 = @tactics.x_gen_tac(@term_syntax.parse_term("(P : Form)"))
  let t169 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t168 = @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t167 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t166 = @simp.rewrite_tac(@list.List([@unif.unifies_v1(), @sets.in_union(), @sets.in_image(), @sets.in_elim_thm()]))
  let t344 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(i : (Num) -> Term)"))(fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s164 = @tactics.mp_tac(x163)
    fn(x165 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s164(x165)
    }
  })), t166), t167), t168), t169), t170), t177), t188), t189), @tactics.disch_tac), t190), t191), @tactics.conj_tac), t265), t266), t267), t272), t280), t281), @tactics.ap_term_tac), t282), t283), @tactics.conj_tac), t321), t325), t326), t327), t332), t333), t334), t336), t337), t338), t339), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t340), t341), t342), t343), @tactics.refl_tac)
  let t162 = @meson.meson_tac(@list.List([]))
  let t161 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @sets.in_image()]))
  let t345 = @tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((ps2 : (Form) -> Bool) == {})")), t161), t162)
  let t160 = @meson.meson_tac(@list.List([]))
  let t159 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @sets.in_image()]))
  let t346 = @tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((ps1 : (Form) -> Bool) == {})")), t159), t160)
  let t158 = @meson.meson_tac(@list.List([]))
  let t157 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @sets.in_image()]))
  let t156 = @fol.expand_tac("c2'")
  let t347 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET((ps2 : (Form) -> Bool), (c2 : (Form) -> Bool))")), t156), t157), t158)
  let t155 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @fol.termsubst_triv(), @trivia.i_def()]))
  let t154 = @simp.asm_rewrite_tac(@list.List([@unif.formsubst_termsubst_lemma()]))
  let t153 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, qfree(p) → formsubst(V, p) == formsubst((s1 : (Num) -> Term), formsubst((r1 : (Num) -> Term), p))"), fn(x151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x151
    @meson.asm_meson_tac(@list.List([th_1, @fol.formsubst_triv(), @resolution.clause(), @resolution.qfree_literal()]))
  })
  let t150 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, IN(p, (c1 : (Form) -> Bool)) → formsubst((s1 : (Num) -> Term), formsubst((r1 : (Num) -> Term), p)) == p"), fn(x148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x148
    @meson.meson_tac(@list.List([th]))
  })
  let t147 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image()]))
  let t146 = @fol.expand_tac("c1'")
  let t348 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUBSET((ps1 : (Form) -> Bool), (c1' : (Form) -> Bool))")), t146), t147), t150), t153), t154), t155), t347, t346, t345, t344])
  let t349 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t348), @tactics.all_tac])
  let t145 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool) && (e : Bool)) && (e → (f : Bool)) → (a && b && c && d && e) && f")))
  let t144 = @simp.rewrite_tac(@list.List([]))
  let t131 = @simp.rewrite_tac(@list.List([@theorems.left_exists_and_thm()]))
  let t130 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE(formsubst((r2 : (Num) -> Term)), (ps2 : (Form) -> Bool))"))
  let t129 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t128 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE(formsubst((s1 : (Num) -> Term)), (ps1 : (Form) -> Bool))"))
  let t127 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t126 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t125 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t124 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s2 : (Num) -> Term)"))(@tactics.strip_assume_tac))
  let t123 = @simp.gen_rewrite_tac(fn(x120 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s121 = @equal.land_conv(x120)
    fn(x122 : @kernel.Term) -> @kernel.Thm raise {
      s121(x122)
    }
  }, @list.List([@unif.renaming()]))
  let t119 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s114 = @tactics.mp_tac(x113)
    fn(x115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s114(x115)
    }
  }, fn(x116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s117 = @tactics.assume_tac(x116)
    fn(x118 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s117(x118)
    }
  }))
  let t112 = @simp.asm_simp_tac(@list.List([@resolution.fvs_clause_finite()]))
  let t110 = @term_syntax.parse_term("FVS((c1 : (Form) -> Bool))")
  let t111 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(c2 : (Form) -> Bool)"), t110]), @resolution.rename()))
  let t109 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s1 : (Num) -> Term)"))(@tactics.strip_assume_tac))
  let t108 = @simp.gen_rewrite_tac(fn(x105 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s106 = @equal.land_conv(x105)
    fn(x107 : @kernel.Term) -> @kernel.Thm raise {
      s106(x107)
    }
  }, @list.List([@unif.renaming()]))
  let t104 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x98 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s99 = @tactics.mp_tac(x98)
    fn(x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s99(x100)
    }
  }, fn(x101 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s102 = @tactics.assume_tac(x101)
    fn(x103 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s102(x103)
    }
  }))
  let t97 = @simp.asm_simp_tac(@list.List([@resolution.fvs_clause_finite()]))
  let t95 = @term_syntax.parse_term("FVS((c2 : (Form) -> Bool))")
  let t96 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(c1 : (Form) -> Bool)"), t95]), @resolution.rename()))
  let t94 = @simp.abbrev_tac(@term_syntax.parse_term("(c2' : (Form) -> Bool) == IMAGE(formsubst((r2 : (Num) -> Term)), (c2 : (Form) -> Bool))"))
  let t93 = @simp.abbrev_tac(@term_syntax.parse_term("(r2 : (Num) -> Term) == rename((c2 : (Form) -> Bool), FVS((c1 : (Form) -> Bool)))"))
  let t92 = @tactics.disch_then(fn(x89 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s90 = @tactics.subst_all_tac(x89)
    fn(x91 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s90(x91)
    }
  })
  let t88 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x82 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s83 = @tactics.assume_tac(x82)
    fn(x84 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s83(x84)
    }
  }, fn(x85 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s86 = @tactics.mp_tac(x85)
    fn(x87 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s86(x87)
    }
  })))
  let t81 = @tactics.conv_tac(@equal.land_conv(@equal.once_depth_conv(@pair.let_conv)))
  let t79 = @tactics.x_choose_then(@term_syntax.parse_term("(ps1 : (Form) -> Bool)"))(fn(x76 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s77 = @tactics.mp_tac(x76)
    fn(x78 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s77(x78)
    }
  })
  let t80 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(ps2 : (Form) -> Bool)"))(t79))
  let t75 = @tactics.conv_tac(@equal.land_conv(@equal.once_depth_conv(@pair.let_conv)))
  let t74 = @simp.abbrev_tac(@term_syntax.parse_term("(c1' : (Form) -> Bool) == IMAGE(formsubst((r1 : (Num) -> Term)), (c1 : (Form) -> Bool))"))
  let t73 = @simp.abbrev_tac(@term_syntax.parse_term("(r1 : (Num) -> Term) == rename((c1 : (Form) -> Bool), FVS((c2 : (Form) -> Bool)))"))
  let t72 = @simp.rewrite_tac(@list.List([@resolution.isaresolvent()]))
  let t71 = @tactics.undisch_tac(@term_syntax.parse_term("isaresolvent((cl : (Form) -> Bool), ((c2 : (Form) -> Bool), (c1 : (Form) -> Bool)))"))
  let t736 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t71), t72), t73), t74), t75), t80), t81), t88), t92), t93), t94), t96), t97), t104), t108), t109), t111), t112), t119), t123), t124), t125), t126), t127), t128), t129), t130), t131), fn(x143 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x142 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x140 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x139 : (@kernel.Term, @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x137 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x136 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              (fn(x132 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
                let s133 = @tactics.exists_tac(x132)
                fn(x134 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                  s133(x134)
                }
              })(((x135 : @kernel.Term) => @lib.funpow(6, @kernel.rand, x135))(x136))
            })(@equal.lhand(x137))
          })((fn(x138 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x138.1
          })(x139))
        })(@basics.dest_exists(x140))
      })((fn(x141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x141.1
      })(x142))
    })(x143)(x143)
  }), t144), t145), @tactics.conj_tac), t349), t353), t359), t363), t370), t377), t381), t382), t383), t387), t399), @tactics.disch_tac), t400), t401), t402), t403), t404), @tactics.ants_tac), t417), @tactics.strip_tac), t418), t419), @tactics.ants_tac), t432), @tactics.strip_tac), t433), t440), @tactics.ants_tac), t558), t559), @tactics.disch_tac), t560), t561), t562), t566), t578), t579), t580), t584), t591), t592), @tactics.strip_tac), t651), t652), @tactics.conj_tac), t685), @tactics.disj1_tac), t686), t687), t688), t689), @tactics.conj_tac), t717), t718), @tactics.disch_tac), t719), t720), t721), t725), t729), t730), t732), t733), t734), t735)
  isaresolvent_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, ∀ cl : (Form) -> Bool, clause(c1) && clause(c2) && isaresolvent(cl, (c2, c1)) → (∃ cl' : (Form) -> Bool, isaresolvent(cl', (c1, c2)) && subsumes(cl', cl))"), t736))
}

///|
let isaresolvent_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISARESOLVENT_SYM")

///|
/// `ISARESOLVENT_SYM`
pub fn isaresolvent_sym() -> @kernel.Thm {
  isaresolvent_sym_c.get()
}

///|
/// ALLRESOLVENTS_SYM
fn step_25() -> Unit raise {
  let t747 = @simp.asm_simp_tac(@list.List([isaresolvent_sym()]))
  let t746 = @tactics.exists_tac(@term_syntax.parse_term("(c2 : (Form) -> Bool)"))
  let t745 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t744 = @simp.asm_rewrite_tac(@list.List([]))
  let t743 = @tactics.exists_tac(@term_syntax.parse_term("(c1 : (Form) -> Bool)"))
  let t742 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t741 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t739 = @tactics.x_choose_then(@term_syntax.parse_term("(c1 : (Form) -> Bool)"))(@tactics.strip_assume_tac)
  let t740 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c2 : (Form) -> Bool)"))(t739))
  let t738 = @tactics.x_gen_tac(@term_syntax.parse_term("(cl : (Form) -> Bool)"))
  let t737 = @simp.rewrite_tac(@list.List([subsumes_v1(), allresolvents(), @sets.in_elim_thm()]))
  let t748 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t737), t738), t740), t741), t742), t743), t744), t745), t746), t747)
  allresolvents_sym_c.set(@tactics.prove(@term_syntax.parse_term("(∀ c : (Form) -> Bool, IN(c, (A : ((Form) -> Bool) -> Bool)) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, (B : ((Form) -> Bool) -> Bool)) → clause(c)) → SUBSUMES(allresolvents(A, B), allresolvents(B, A))"), t748))
}

///|
let allresolvents_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLRESOLVENTS_SYM")

///|
/// `ALLRESOLVENTS_SYM`
pub fn allresolvents_sym() -> @kernel.Thm {
  allresolvents_sym_c.get()
}

///|
/// ALLRESOLVENTS_UNION
fn step_26() -> Unit raise {
  let t749 = @meson.meson_tac(@list.List([]))
  let t750 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), allresolvents(), @sets.in_elim_thm(), @sets.in_union()])), t749)
  allresolvents_union_c.set(@tactics.prove(@term_syntax.parse_term("allresolvents(UNION((A : ((Form) -> Bool) -> Bool), (B : ((Form) -> Bool) -> Bool)), (C : ((Form) -> Bool) -> Bool)) == UNION(allresolvents(A, C), allresolvents(B, C)) && allresolvents(A, UNION(B, C)) == UNION(allresolvents(A, B), allresolvents(A, C))"), t750))
}

///|
let allresolvents_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLRESOLVENTS_UNION")

///|
/// `ALLRESOLVENTS_UNION`
pub fn allresolvents_union() -> @kernel.Thm {
  allresolvents_union_c.get()
}

///|
/// ALLRESOLVENTS_STEP
fn step_27() -> Unit raise {
  let t766 = @simp.asm_simp_tac(@list.List([allresolvents_sym()]))
  let t764 = @simp.asm_rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t765 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(subsumes_union()), t764))
  let t762 = @term_syntax.parse_term("UNION((A : (_) -> Bool), (B : (_) -> Bool)) == UNION(UNION(A, A), B)")
  let t763 = @simp.gen_rewrite_tac(fn(x761 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x754 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s755 = @equal.land_conv(x754)
      fn(x756 : @kernel.Term) -> @kernel.Thm raise {
        s755(x756)
      }
    })(((x760 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(3, fn(x757 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s758 = @equal.rand_conv(x757)
      fn(x759 : @kernel.Term) -> @kernel.Thm raise {
        s758(x759)
      }
    }, x760))(x761))
  }, @list.List([@theorems.ac(@sets.union_aci())(t762)]))
  let t752 = @term_syntax.parse_term("UNION((a : (_) -> Bool), UNION((b : (_) -> Bool), UNION((c : (_) -> Bool), UNION((d : (_) -> Bool), UNION((e : (_) -> Bool), (f : (_) -> Bool)))))) == UNION(a, UNION(b, UNION(d, UNION(UNION(c, e), f))))")
  let t753 = @simp.once_rewrite_tac(@list.List([@theorems.ac(@sets.union_aci())(t752)]))
  let t751 = @simp.rewrite_tac(@list.List([allresolvents_union(), @sets.union_assoc()]))
  let t767 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t751), t753), t763), t765), t766)
  allresolvents_step_c.set(@tactics.prove(@term_syntax.parse_term("(∀ c : (Form) -> Bool, IN(c, (B : ((Form) -> Bool) -> Bool)) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, (C : ((Form) -> Bool) -> Bool)) → clause(c)) → SUBSUMES(UNION(allresolvents(B, UNION((A : ((Form) -> Bool) -> Bool), B)), allresolvents(C, UNION(A, UNION(B, C)))), allresolvents(UNION(B, C), UNION(A, UNION(B, C))))"), t767))
}

///|
let allresolvents_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLRESOLVENTS_STEP")

///|
/// `ALLRESOLVENTS_STEP`
pub fn allresolvents_step() -> @kernel.Thm {
  allresolvents_step_c.get()
}

///|
/// resolvents
fn step_28() -> Unit raise {
  resolvents_c.set(@pair.new_definition(@term_syntax.parse_term("(resolvents : ((Form) -> Bool, List[(Form) -> Bool]) -> List[(Form) -> Bool])((cl : (Form) -> Bool), (cls : List[(Form) -> Bool])) == list_of_set(allresolvents({cl}, set_of_list(cls)))")))
}

///|
let resolvents_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("resolvents")

///|
/// `resolvents`
pub fn resolvents() -> @kernel.Thm {
  resolvents_c.get()
}

///|
/// CLAUSE_UNION
fn step_29() -> Unit raise {
  let t768 = @meson.meson_tac(@list.List([]))
  let t769 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@resolution.clause(), @sets.finite_union(), @sets.in_union()])), t768)
  clause_union_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, clause(UNION(c1, c2)) == (clause(c1) && clause(c2))"), t769))
}

///|
let clause_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLAUSE_UNION")

///|
/// `CLAUSE_UNION`
pub fn clause_union() -> @kernel.Thm {
  clause_union_c.get()
}

///|
/// CLAUSE_SUBSET
fn step_30() -> Unit raise {
  let t770 = @meson.meson_tac(@list.List([@sets.subset(), @sets.finite_subset()]))
  let t771 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@resolution.clause()])), t770)
  clause_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, clause(c2) && SUBSET(c1, c2) → clause(c1)"), t771))
}

///|
let clause_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLAUSE_SUBSET")

///|
/// `CLAUSE_SUBSET`
pub fn clause_subset() -> @kernel.Thm {
  clause_subset_c.get()
}

///|
/// CLAUSE_DIFF
fn step_31() -> Unit raise {
  let t772 = @meson.meson_tac(@list.List([clause_subset(), @sets.in_diff(), @sets.subset()]))
  clause_diff_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, clause(c1) → clause(DIFF(c1, c2))"), t772))
}

///|
let clause_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLAUSE_DIFF")

///|
/// `CLAUSE_DIFF`
pub fn clause_diff() -> @kernel.Thm {
  clause_diff_c.get()
}

///|
/// ISARESOLVENT_CLAUSE
fn step_32() -> Unit raise {
  let t777 = @simp.asm_simp_tac(@list.List([@resolution.image_formsubst_clause(), clause_union(), clause_diff()]))
  let t776 = @tactics.match_mp_tac(@resolution.image_formsubst_clause())
  let t775 = @simp.asm_rewrite_tac(@list.List([]))
  let t774 = @tactics.repeat_tac(@tactics.strip_tac)
  let t773 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t778 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@resolution.isaresolvent()])), t773), t774), t775), t776), t777)
  isaresolvent_clause_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Form) -> Bool, ∀ q : (Form) -> Bool, ∀ r : (Form) -> Bool, clause(p) && clause(q) && isaresolvent(r, (p, q)) → clause(r)"), t778))
}

///|
let isaresolvent_clause_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISARESOLVENT_CLAUSE")

///|
/// `ISARESOLVENT_CLAUSE`
pub fn isaresolvent_clause() -> @kernel.Thm {
  isaresolvent_clause_c.get()
}

///|
/// ALLRESOLVENTS_CLAUSE
fn step_33() -> Unit raise {
  let t783 = @simp.asm_simp_tac(@list.List([@resolution.image_formsubst_clause(), clause_union(), clause_diff()]))
  let t782 = @tactics.match_mp_tac(@resolution.image_formsubst_clause())
  let t781 = @simp.asm_rewrite_tac(@list.List([]))
  let t780 = @tactics.repeat_tac(@tactics.strip_tac)
  let t779 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t784 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([allresolvents(), @sets.in_elim_thm(), @resolution.isaresolvent()])), t779), t780), t781), t782), t783)
  allresolvents_clause_c.set(@tactics.prove(@term_syntax.parse_term("(∀ c : (Form) -> Bool, IN(c, (s : ((Form) -> Bool) -> Bool)) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, (t : ((Form) -> Bool) -> Bool)) → clause(c)) → (∀ c : (Form) -> Bool, IN(c, allresolvents(s, t)) → clause(c))"), t784))
}

///|
let allresolvents_clause_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLRESOLVENTS_CLAUSE")

///|
/// `ALLRESOLVENTS_CLAUSE`
pub fn allresolvents_clause() -> @kernel.Thm {
  allresolvents_clause_c.get()
}

///|
/// ISARESOLVENT_FINITE
fn step_34() -> Unit raise {
  let t806 = @simp.asm_simp_tac(@list.List([@sets.finite_powerset()]))
  let t805 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@resolution.clause()])))
  let t804 = @tactics.match_mp_tac(@sets.finite_product())
  let t803 = @tactics.match_mp_tac(@sets.finite_image())
  let t801 = @meson.asm_meson_tac(@list.List([]))
  let t800 = @simp.asm_rewrite_tac(@list.List([]))
  let t799 = @tactics.exists_tac(@term_syntax.parse_term("((ps1 : (Form) -> Bool), (ps2 : (Form) -> Bool))"))
  let t798 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t796 = @term_syntax.parse_term("(ps2 : (Form) -> Bool)")
  let t797 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(ps1 : (Form) -> Bool)"), t796]))
  let t795 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t794 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Form) -> Bool)"))
  let t802 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image(), @sets.in_elim_thm()])), t794), t795), t797), t798), @tactics.strip_tac), t799), t800), t801)])
  let t793 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((pss : ((Form) -> Bool, (Form) -> Bool)) => LET((i : (Num) -> Term) => LET_END(IMAGE(formsubst(i), UNION(DIFF((c1 : (Form) -> Bool), FST(pss)), DIFF((cl2' : (Form) -> Bool), SND(pss))))), mgu(UNION(FST(pss), {op_tilde_tilde((p : Form)) | IN(p, SND(pss))}))), {((ps1 : (Form) -> Bool), (ps2 : (Form) -> Bool)) | IN(ps1, {(ps1 : (Form) -> Bool) | SUBSET(ps1, c1)}) && IN(ps2, {(ps2 : (Form) -> Bool) | SUBSET(ps2, cl2')})})"))
  let t792 = @tactics.match_mp_tac(@sets.finite_subset())
  let t790 = @simp.asm_simp_tac(@list.List([@resolution.image_formsubst_clause()]))
  let t791 = @list.List([@tactics.then_tac(@fol.expand_tac("cl2'"), t790), @tactics.all_tac])
  let t789 = @tactics.subgoal_then(@term_syntax.parse_term("clause((cl2' : (Form) -> Bool))"), fn(x786 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s787 = @tactics.assume_tac(x786)
    fn(x788 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s787(x788)
    }
  })
  let t785 = @simp.rewrite_tac(@list.List([@resolution.isaresolvent()]))
  let t807 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t785), @pair.let_tac), t789), t791), t792), t793), @tactics.conj_tac), t802), t803), t804), t805), t806)
  isaresolvent_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (Form) -> Bool, ∀ c2 : (Form) -> Bool, clause(c1) && clause(c2) → FINITE({(c : (Form) -> Bool) | isaresolvent(c, (c1, c2))})"), t807))
}

///|
let isaresolvent_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISARESOLVENT_FINITE")

///|
/// `ISARESOLVENT_FINITE`
pub fn isaresolvent_finite() -> @kernel.Thm {
  isaresolvent_finite_c.get()
}

///|
/// ALLRESOLVENTS_FINITE
fn step_35() -> Unit raise {
  let t836 = @simp.asm_simp_tac(@list.List([isaresolvent_finite()]))
  let t835 = @simp.gen_rewrite_tac(fn(x834 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x828 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s829 = @equal.land_conv(x828)
      fn(x830 : @kernel.Term) -> @kernel.Thm raise {
        s829(x830)
      }
    })((fn(x831 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s832 = @equal.top_depth_conv(x831)
      fn(x833 : @kernel.Term) -> @kernel.Thm raise {
        s832(x833)
      }
    })(x834))
  }, @list.List([@sets.in_elim_thm(), @theorems.beta_thm()]))
  let t827 = @tactics.disch_then(@tactics.choose_then(@tactics.conjuncts_then2(fn(x821 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s822 = @tactics.subst1_tac(x821)
    fn(x823 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s822(x823)
    }
  }, fn(x824 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s825 = @tactics.mp_tac(x824)
    fn(x826 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s825(x826)
    }
  })))
  let t820 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : ((Form) -> Bool) -> Bool)"))
  let t819 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t818 = @simp.asm_simp_tac(@list.List([@sets.finite_unions(), @sets.finite_image(), @sets.finite_product()]))
  let t816 = @meson.asm_meson_tac(@list.List([]))
  let t815 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t814 = @tactics.exists_tac(@term_syntax.parse_term("{(c : (Form) -> Bool) | isaresolvent(c, ((c1 : (Form) -> Bool), (c2 : (Form) -> Bool)))}"))
  let t813 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t812 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Form) -> Bool)"))
  let t817 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), allresolvents(), @sets.in_unions(), @sets.in_image(), @sets.in_elim_thm()])), t812), @tactics.eq_tac), t813), @tactics.strip_tac), t814), t815), t816), @tactics.all_tac])
  let t811 = @tactics.subgoal_then(@term_syntax.parse_term("allresolvents((s : ((Form) -> Bool) -> Bool), (t : ((Form) -> Bool) -> Bool)) == UNIONS(IMAGE((cs : ((Form) -> Bool, (Form) -> Bool)) => {(c : (Form) -> Bool) | isaresolvent(c, cs)}, {((c1 : (Form) -> Bool), (c2 : (Form) -> Bool)) | IN(c1, s) && IN(c2, t)}))"), fn(x808 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s809 = @tactics.subst1_tac(x808)
    fn(x810 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s809(x810)
    }
  })
  let t837 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t811), t817), t818), t819), t820), t827), t835), @tactics.strip_tac), t836)
  allresolvents_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((Form) -> Bool) -> Bool, ∀ t : ((Form) -> Bool) -> Bool, FINITE(s) && FINITE(t) && (∀ c : (Form) -> Bool, IN(c, s) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, t) → clause(c)) → FINITE(allresolvents(s, t))"), t837))
}

///|
let allresolvents_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLRESOLVENTS_FINITE")

///|
/// `ALLRESOLVENTS_FINITE`
pub fn allresolvents_finite() -> @kernel.Thm {
  allresolvents_finite_c.get()
}

///|
/// replace
fn step_36() -> Unit raise {
  let t838 = @term_syntax.parse_term("(replace : ((Form) -> Bool, List[(Form) -> Bool]) -> List[(Form) -> Bool])((cl : (Form) -> Bool), NIL) == [cl] && replace(cl, CONS((c : (Form) -> Bool), (cls : List[(Form) -> Bool]))) == (if subsumes(cl, c) { CONS(cl, cls) } else { CONS(c, replace(cl, cls)) })")
  replace_c.set(@recursion.new_recursive_definition(@ind_types.list_recursion())(t838))
}

///|
let replace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("replace")

///|
/// `replace`
pub fn replace() -> @kernel.Thm {
  replace_c.get()
}

///|
/// REPLACE
fn step_37() -> Unit raise {
  let t857 = @meson.asm_meson_tac(@list.List([subsumes_refl()]))
  let t856 = @simp.rewrite_tac(@list.List([@sets.in_set_of_list()]))
  let t855 = @simp.rewrite_tac(@list.List([subsumes_v1(), @sets.in_insert(), @sets.set_of_list()]))
  let t853 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSUMES(set_of_list(replace((cl : (Form) -> Bool), (t : List[(Form) -> Bool]))), set_of_list(CONS(cl, t)))"))
  let t854 = @list.List([@tactics.undisch_tac(@term_syntax.parse_term("SUBSUMES(set_of_list(replace((cl : (Form) -> Bool), (t : List[(Form) -> Bool]))), set_of_list(CONS(cl, t)))")), t853])
  let t852 = @simp.rewrite_tac(@list.List([@lists.mem(), @sets.set_of_list()]))
  let t851 = @simp.asm_rewrite_tac(@list.List([]))
  let t850 = @tactics.first_assum(fn(x849 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x847 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x842 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s843 = @tactics.undisch_tac(x842)
        fn(x844 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s843(x844)
        }
      })(((x846 : @kernel.Term) => @lib.check(fn(x845 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x845)
      }, x846))(x847))
    })((fn(x848 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x848)
    })(x849))
  })
  let t841 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t840 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t839 = @simp.simp_tac(@list.List([replace(), subsumes_refl_v1(), @lists.mem()]))
  let t858 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t839), t840), t841), @tactics.strip_tac), t850), t851), @tactics.strip_tac), @class.cond_cases_tac), t852), t854), t855), t856), t857)
  replace_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], (∀ c : (Form) -> Bool, MEM(c, lis) → clause(c)) && clause(cl) → (∀ c : (Form) -> Bool, MEM(c, replace(cl, lis)) → clause(c)) && SUBSUMES(set_of_list(replace(cl, lis)), set_of_list(CONS(cl, lis)))"), t858))
}

///|
let replace_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REPLACE")

///|
/// `REPLACE`
pub fn replace_v1() -> @kernel.Thm {
  replace_v1_c.get()
}

///|
/// incorporate
fn step_38() -> Unit raise {
  incorporate_c.set(@pair.new_definition(@term_syntax.parse_term("(incorporate : ((Form) -> Bool, (Form) -> Bool, List[(Form) -> Bool]) -> List[(Form) -> Bool])((gcl : (Form) -> Bool), (cl : (Form) -> Bool), (current : List[(Form) -> Bool])) == (if tautologous(cl) || EX((c : (Form) -> Bool) => subsumes(c, cl), CONS(gcl, current)) { current } else { replace(cl, current) })")))
}

///|
let incorporate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("incorporate")

///|
/// `incorporate`
pub fn incorporate() -> @kernel.Thm {
  incorporate_c.get()
}

///|
/// INCORPORATE
fn step_39() -> Unit raise {
  let t888 = @meson.meson_tac(@list.List([]))
  let t887 = @simp.rewrite_tac(@list.List([subsumes_v1(), @sets.set_of_list(), @sets.in_insert(), @sets.not_in_empty()]))
  let t886 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSUMES(set_of_list(replace((cl : (Form) -> Bool), (current : List[(Form) -> Bool]))), set_of_list(CONS(cl, current)))"))
  let t885 = @simp.asm_rewrite_tac(@list.List([]))
  let t884 = @simp.asm_rewrite_tac(@list.List([]))
  let t882 = @term_syntax.parse_term("(current : List[(Form) -> Bool])")
  let t883 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(cl : (Form) -> Bool)"), t882]), replace_v1()))
  let t880 = @meson.asm_meson_tac(@list.List([]))
  let t879 = @simp.rewrite_tac(@list.List([subsumes_v1(), @sets.in_insert(), @sets.not_in_empty()]))
  let t878 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_insert(), @sets.not_in_empty()]))
  let t876 = @tactics.exists_tac(@term_syntax.parse_term("set_of_list((t : List[(Form) -> Bool]))"))
  let t877 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("{(h : (Form) -> Bool)}")), t876])
  let t875 = @tactics.match_mp_tac(subsumes_subset())
  let t874 = @simp.asm_rewrite_tac(@list.List([@sets.set_of_list()]))
  let t873 = @simp.rewrite_tac(@list.List([@lists.ex()]))
  let t871 = @term_syntax.parse_term("(l : List[(Form) -> Bool])")
  let t872 = @tactics.spec_tac(@term_syntax.parse_term("CONS((gcl : (Form) -> Bool), (current : List[(Form) -> Bool]))"), t871)
  let t870 = @tactics.undisch_tac(@term_syntax.parse_term("EX((c : (Form) -> Bool) => subsumes(c, (cl : (Form) -> Bool)), CONS((gcl : (Form) -> Bool), (current : List[(Form) -> Bool])))"))
  let t868 = @simp.simp_tac(@list.List([@sets.subset(), @sets.set_of_list(), @sets.in_insert()]))
  let t867 = @simp.rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t866 = @tactics.exists_tac(@term_syntax.parse_term("set_of_list((current : List[(Form) -> Bool]))"))
  let t869 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(subsumes_subset()), t866), t867), t868)])
  let t865 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(@sets.set_of_list()))]))
  let t864 = @simp.once_rewrite_tac(@list.List([subsumes_clauses()]))
  let t881 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_of_list()])), t864), t865), @tactics.conj_tac), t869), t870), t872), @lists.list_induct_tac), t873), t874), @tactics.strip_tac), t875), t877), t878), t879), t880), @tactics.all_tac])
  let t863 = @simp.asm_rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t862 = @class.asm_cases_tac(@term_syntax.parse_term("EX((c : (Form) -> Bool) => subsumes(c, (cl : (Form) -> Bool)), CONS((gcl : (Form) -> Bool), (current : List[(Form) -> Bool])))"))
  let t861 = @simp.asm_rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t860 = @class.asm_cases_tac(@term_syntax.parse_term("tautologous((cl : (Form) -> Bool))"))
  let t859 = @simp.rewrite_tac(@list.List([incorporate()]))
  let t889 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t859), t860), t861), t862), t863), t881), t883), t884), @tactics.strip_tac), t885), t886), t887), t888)
  incorporate_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ gcl : (Form) -> Bool, ∀ cl : (Form) -> Bool, ∀ current : List[(Form) -> Bool], (∀ c : (Form) -> Bool, MEM(c, current) → clause(c)) && clause(gcl) && clause(cl) → (∀ c : (Form) -> Bool, MEM(c, incorporate(gcl, cl, current)) → clause(c)) && SUBSUMES(set_of_list(incorporate(gcl, cl, current)), set_of_list(current)) && (tautologous(cl) || SUBSUMES(INSERT(gcl, set_of_list(incorporate(gcl, cl, current))), set_of_list(CONS(cl, current))))"), t889))
}

///|
let incorporate_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCORPORATE")

///|
/// `INCORPORATE`
pub fn incorporate_v1() -> @kernel.Thm {
  incorporate_v1_c.get()
}

///|
/// insert_def
fn step_40() -> Unit raise {
  insert_def_c.set(@pair.new_definition(@term_syntax.parse_term("(insert : (_, List[_]) -> List[_])((x : _), (l : List[_])) == (if MEM(x, l) { l } else { CONS(x, l) })")))
}

///|
let insert_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("insert_def")

///|
/// `insert_def`
pub fn insert_def() -> @kernel.Thm {
  insert_def_c.get()
}

///|
/// step
fn step_41() -> Unit raise {
  step_c.set(@pair.new_definition(@term_syntax.parse_term("(step : ((List[(Form) -> Bool], List[(Form) -> Bool])) -> (List[(Form) -> Bool], List[(Form) -> Bool]))(((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))) == (if unused == NIL { (used, unused) } else { LET((new : List[(Form) -> Bool]) => LET_END((insert(HD(unused), used), ITLIST(incorporate(HD(unused)), new, TL(unused)))), resolvents(HD(unused), CONS(HD(unused), used))) })")))
}

///|
let step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("step")

///|
/// `step`
pub fn step() -> @kernel.Thm {
  step_c.get()
}

///|
/// STEP
fn step_42() -> Unit raise {
  let t894 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.hd(), @lists.tl()]))
  let t893 = @simp.gen_rewrite_tac(fn(x890 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s891 = @equal.land_conv(x890)
    fn(x892 : @kernel.Term) -> @kernel.Thm raise {
      s891(x892)
    }
  }, @list.List([step()]))
  let t895 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t893), t894)
  step_v1_c.set(@tactics.prove(@term_syntax.parse_term("step(((used : List[(Form) -> Bool]), NIL)) == (used, NIL) && step((used, CONS((cl : (Form) -> Bool), (cls : List[(Form) -> Bool])))) == LET((new : List[(Form) -> Bool]) => LET_END((insert(cl, used), ITLIST(incorporate(cl), new, cls))), resolvents(cl, CONS(cl, used)))"), t895))
}

///|
let step_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP")

///|
/// `STEP`
pub fn step_v1() -> @kernel.Thm {
  step_v1_c.get()
}

///|
/// given
fn step_43() -> Unit raise {
  let t896 = @term_syntax.parse_term("(given : (Num, (List[(Form) -> Bool], List[(Form) -> Bool])) -> (List[(Form) -> Bool], List[(Form) -> Bool]))(0, (p : (List[(Form) -> Bool], List[(Form) -> Bool]))) == p && given(SUC((n : Num)), p) == step(given(n, p))")
  given_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t896))
}

///|
let given_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("given")

///|
/// `given`
pub fn given() -> @kernel.Thm {
  given_c.get()
}

///|
/// Used_DEF
fn step_44() -> Unit raise {
  used_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Used : ((List[(Form) -> Bool], List[(Form) -> Bool]), Num, (Form) -> Bool) -> Bool)((init : (List[(Form) -> Bool], List[(Form) -> Bool])), (n : Num)) == set_of_list(FST(given(n, init)))")))
}

///|
let used_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Used_DEF")

///|
/// `Used_DEF`
pub fn used_def() -> @kernel.Thm {
  used_def_c.get()
}

///|
/// Unused_DEF
fn step_45() -> Unit raise {
  unused_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Unused : ((List[(Form) -> Bool], List[(Form) -> Bool]), Num, (Form) -> Bool) -> Bool)((init : (List[(Form) -> Bool], List[(Form) -> Bool])), (n : Num)) == set_of_list(SND(given(n, init)))")))
}

///|
let unused_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Unused_DEF")

///|
/// `Unused_DEF`
pub fn unused_def() -> @kernel.Thm {
  unused_def_c.get()
}

///|
/// Sub_DEF
fn step_46() -> Unit raise {
  let t897 = @term_syntax.parse_term("(Sub : ((List[(Form) -> Bool], List[(Form) -> Bool]), Num, (Form) -> Bool) -> Bool)((init : (List[(Form) -> Bool], List[(Form) -> Bool])), 0) == {} && Sub(init, SUC((n : Num))) == (if SND(given(n, init)) == NIL { Sub(init, n) } else { INSERT(HD(SND(given(n, init))), Sub(init, n)) })")
  sub_def_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t897))
}

///|
let sub_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Sub_DEF")

///|
/// `Sub_DEF`
pub fn sub_def() -> @kernel.Thm {
  sub_def_c.get()
}

///|
/// TAUTOLOGOUS_INSTANCE
fn step_47() -> Unit raise {
  let t898 = @meson.meson_tac(@list.List([@resolution.formsubst_negate()]))
  let t899 = @tactics.then_tac(@simp.rewrite_tac(@list.List([tautologous(), @sets.in_image()])), t898)
  tautologous_instance_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : (Num) -> Term, ∀ cl : (Form) -> Bool, tautologous(cl) → tautologous(IMAGE(formsubst(i), cl))"), t899))
}

///|
let tautologous_instance_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAUTOLOGOUS_INSTANCE")

///|
/// `TAUTOLOGOUS_INSTANCE`
pub fn tautologous_instance() -> @kernel.Thm {
  tautologous_instance_c.get()
}

///|
/// NONTAUTOLOGOUS_SUBSUMES
fn step_48() -> Unit raise {
  let t900 = @meson.meson_tac(@list.List([@resolution.formsubst_negate()]))
  let t901 = @tactics.then_tac(@simp.rewrite_tac(@list.List([subsumes(), @sets.subset(), tautologous(), @sets.in_image()])), t900)
  nontautologous_subsumes_c.set(@tactics.prove(@term_syntax.parse_term("subsumes((cl : (Form) -> Bool), (cl' : (Form) -> Bool)) && !tautologous(cl') → !tautologous(cl)"), t901))
}

///|
let nontautologous_subsumes_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NONTAUTOLOGOUS_SUBSUMES")

///|
/// `NONTAUTOLOGOUS_SUBSUMES`
pub fn nontautologous_subsumes() -> @kernel.Thm {
  nontautologous_subsumes_c.get()
}

///|
/// ALLNTRESOLVENTS_STEP
fn step_49() -> Unit raise {
  let t904 = @meson.meson_tac(@list.List([nontautologous_subsumes()]))
  let t903 = @simp.rewrite_tac(@list.List([subsumes_v1(), allntresolvents(), @sets.in_elim_thm(), @sets.in_union()]))
  let t902 = @simp.asm_rewrite_tac(@list.List([]))
  let t905 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(allresolvents_step())), t902), t903), t904)
  allntresolvents_step_c.set(@tactics.prove(@term_syntax.parse_term("(∀ c : (Form) -> Bool, IN(c, (B : ((Form) -> Bool) -> Bool)) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, (C : ((Form) -> Bool) -> Bool)) → clause(c)) → SUBSUMES(UNION(allntresolvents(B, UNION((A : ((Form) -> Bool) -> Bool), B)), allntresolvents(C, UNION(A, UNION(B, C)))), allntresolvents(UNION(B, C), UNION(A, UNION(B, C))))"), t905))
}

///|
let allntresolvents_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLNTRESOLVENTS_STEP")

///|
/// `ALLNTRESOLVENTS_STEP`
pub fn allntresolvents_step() -> @kernel.Thm {
  allntresolvents_step_c.get()
}

///|
/// ALLNTRESOLVENTS_UNION
fn step_50() -> Unit raise {
  let t906 = @meson.meson_tac(@list.List([]))
  let t907 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), allntresolvents(), allresolvents(), @sets.in_elim_thm(), @sets.in_union()])), t906)
  allntresolvents_union_c.set(@tactics.prove(@term_syntax.parse_term("allntresolvents(UNION((A : ((Form) -> Bool) -> Bool), (B : ((Form) -> Bool) -> Bool)), (C : ((Form) -> Bool) -> Bool)) == UNION(allntresolvents(A, C), allntresolvents(B, C)) && allntresolvents(A, UNION(B, C)) == UNION(allntresolvents(A, B), allntresolvents(A, C))"), t907))
}

///|
let allntresolvents_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLNTRESOLVENTS_UNION")

///|
/// `ALLNTRESOLVENTS_UNION`
pub fn allntresolvents_union() -> @kernel.Thm {
  allntresolvents_union_c.get()
}

///|
/// SET_OF_LIST_INSERT
fn step_51() -> Unit raise {
  let t915 = @sets.set_tac(@list.List([]))
  let t914 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.in_set_of_list())]))
  let t913 = @tactics.pop_assum(fn(x910 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s911 = @tactics.mp_tac(x910)
    fn(x912 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s911(x912)
    }
  })
  let t909 = @simp.asm_rewrite_tac(@list.List([@sets.set_of_list()]))
  let t908 = @simp.rewrite_tac(@list.List([insert_def()]))
  let t916 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t908), @class.cond_cases_tac), t909), t913), t914), t915)
  set_of_list_insert_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ s : List[_], set_of_list(insert(x, s)) == INSERT(x, set_of_list(s))"), t916))
}

///|
let set_of_list_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SET_OF_LIST_INSERT")

///|
/// `SET_OF_LIST_INSERT`
pub fn set_of_list_insert() -> @kernel.Thm {
  set_of_list_insert_c.get()
}

///|
/// SET_OF_LIST_FILTER
fn step_52() -> Unit raise {
  let t921 = @meson.asm_meson_tac(@list.List([]))
  let t920 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty(), @sets.in_insert()]))
  let t919 = @simp.asm_rewrite_tac(@list.List([@sets.set_of_list()]))
  let t918 = @list.List([@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty()])), @tactics.all_tac])
  let t917 = @simp.asm_rewrite_tac(@list.List([@lists.filter(), @sets.set_of_list()]))
  let t922 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t917), t918), @class.cond_cases_tac), t919), t920), t921)
  set_of_list_filter_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (_) -> Bool, ∀ l : List[_], set_of_list(FILTER(P, l)) == {(x : _) | IN(x, set_of_list(l)) && P(x)}"), t922))
}

///|
let set_of_list_filter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SET_OF_LIST_FILTER")

///|
/// `SET_OF_LIST_FILTER`
pub fn set_of_list_filter() -> @kernel.Thm {
  set_of_list_filter_c.get()
}

///|
/// USED_SUB
fn step_53() -> Unit raise {
  let t933 = @sets.set_tac(@list.List([]))
  let t932 = @simp.asm_rewrite_tac(@list.List([]))
  let t931 = @simp.rewrite_tac(@list.List([@pair.fst(), set_of_list_insert()]))
  let t930 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t929 = @simp.asm_rewrite_tac(@list.List([]))
  let t928 = @simp.asm_rewrite_tac(@list.List([]))
  let t927 = @simp.pure_rewrite_tac(@list.List([step()]))
  let t926 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(ppp : (List[(Form) -> Bool], List[(Form) -> Bool]))"), @pair.pair())))
  let t925 = @simp.abbrev_tac(@term_syntax.parse_term("(ppp : (List[(Form) -> Bool], List[(Form) -> Bool])) == given((n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))"))
  let t924 = @simp.rewrite_tac(@list.List([sub_def(), given(), @sets.union_empty()]))
  let t923 = @simp.rewrite_tac(@list.List([used_def(), unused_def()]))
  let t934 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t923), @nums.induct_tac), t924), t925), t926), t927), t928), @class.cond_cases_tac), t929), t930), t931), t932), t933)
  used_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], ∀ n : Num, Used((used, unused), n) == UNION(set_of_list(used), Sub((used, unused), n))"), t934))
}

///|
let used_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("USED_SUB")

///|
/// `USED_SUB`
pub fn used_sub() -> @kernel.Thm {
  used_sub_c.get()
}

///|
/// GIVEN_INVARIANT
fn step_54() -> Unit raise {
  let t935 = @sets.set_tac(@list.List([]))
  let lemma1 = @tactics.prove(@term_syntax.parse_term("INSERT((x : _), (s : (_) -> Bool)) == UNION(s, {x})"), t935)
  let t936 = @sets.set_tac(@list.List([]))
  let lemma2 = @tactics.prove(@term_syntax.parse_term("UNION(INSERT((x : _), (s : (_) -> Bool)), (t : (_) -> Bool)) == UNION(UNION(s, UNION(t, {x})), UNION(t, {x}))"), t936)
  let t937 = @sets.set_tac(@list.List([]))
  let lemma3 = @tactics.prove(@term_syntax.parse_term("UNION((s : (_) -> Bool), (t : (_) -> Bool)) == UNION(UNION(s, t), t)"), t937)
  let t938 = @sets.set_tac(@list.List([]))
  let lemma4 = @tactics.prove(@term_syntax.parse_term("UNION((s : (_) -> Bool), {(x : _)}) == UNION(INSERT(x, s), {x})"), t938)
  let t939 = @sets.set_tac(@list.List([]))
  let lemma5 = @tactics.prove(@term_syntax.parse_term("UNION(INSERT((h : _), (s : (_) -> Bool)), (t : (_) -> Bool)) == UNION(UNION(s, t), {h})"), t939)
  let t1164 = @simp.asm_simp_tac(@list.List([]))
  let t1163 = @simp.rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t1162 = @tactics.match_mp_tac(subsumes_union())
  let t1161 = @simp.gen_rewrite_tac(fn(x1158 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1159 = @equal.rand_conv(x1158)
    fn(x1160 : @kernel.Term) -> @kernel.Thm raise {
      s1159(x1160)
    }
  }, @list.List([lemma1]))
  let t1157 = @simp.once_rewrite_tac(@list.List([lemma5]))
  let t1165 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_of_list()])), t1157), t1161), t1162), t1163), t1164)
  let t1156 = @simp.asm_simp_tac(@list.List([subsumes_union(), subsumes_refl_v1()]))
  let t1166 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x1153 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1154 = @equal.land_conv(x1153)
    fn(x1155 : @kernel.Term) -> @kernel.Thm raise {
      s1154(x1155)
    }
  }, @list.List([lemma4])), t1156)
  let t1152 = @meson.asm_meson_tac(@list.List([@sets.in_set_of_list()]))
  let t1151 = @simp.asm_simp_tac(@list.List([]))
  let t1150 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1167 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @sets.in_union()])), t1150), t1151), t1152), t1166, t1165])
  let t1149 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1148 = @tactics.exists_tac(@term_syntax.parse_term("UNION(set_of_list(CONS((h : (Form) -> Bool), ITLIST(incorporate((cl : (Form) -> Bool)), (t : List[(Form) -> Bool]), (cls : List[(Form) -> Bool])))), {cl})"))
  let t1147 = @tactics.match_mp_tac(subsumes_trans_v1())
  let t1146 = @simp.asm_rewrite_tac(@list.List([@sets.in_set_of_list()]))
  let t1145 = @simp.asm_rewrite_tac(@list.List([]))
  let t1144 = @list.List([@simp.asm_simp_tac(@list.List([@equal.gsym(@sets.in_set_of_list())])), @tactics.all_tac])
  let t1141 = @term_syntax.parse_term("ITLIST(incorporate((cl : (Form) -> Bool)), (t : List[(Form) -> Bool]), (cls : List[(Form) -> Bool]))")
  let t1142 = @term_syntax.parse_term("(h : (Form) -> Bool)")
  let t1143 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(cl : (Form) -> Bool)"), t1142, t1141]), incorporate_v1()))
  let t1139 = @meson.asm_meson_tac(@list.List([]))
  let t1138 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.not_in_empty(), @sets.in_insert(), @sets.in_elim_thm(), @sets.in_set_of_list()]))
  let t1137 = @simp.asm_simp_tac(@list.List([subsumes_union(), subsumes_refl_v1()]))
  let t1136 = @tactics.exists_tac(@term_syntax.parse_term("UNION(set_of_list(ITLIST(incorporate((cl : (Form) -> Bool)), (t : List[(Form) -> Bool]), (cls : List[(Form) -> Bool]))), {cl})"))
  let t1135 = @tactics.match_mp_tac(subsumes_trans_v1())
  let t1134 = @simp.asm_rewrite_tac(@list.List([@sets.in_set_of_list()]))
  let t1133 = @simp.asm_rewrite_tac(@list.List([]))
  let t1132 = @list.List([@simp.asm_simp_tac(@list.List([@equal.gsym(@sets.in_set_of_list())])), @tactics.all_tac])
  let t1130 = @term_syntax.parse_term("ITLIST(incorporate((cl : (Form) -> Bool)), (t : List[(Form) -> Bool]), (cls : List[(Form) -> Bool]))")
  let t1131 = @term_syntax.parse_term("(h : (Form) -> Bool)")
  let t1140 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(cl : (Form) -> Bool)"), t1131, t1130]), incorporate_v1())), @tactics.ants_tac), t1132), t1133), @tactics.strip_tac), t1134), t1135), t1136), t1137), t1138), t1139), @tactics.all_tac])
  let t1129 = @simp.asm_simp_tac(@list.List([]))
  let t1128 = @class.asm_cases_tac(@term_syntax.parse_term("tautologous((h : (Form) -> Bool))"))
  let t1126 = @meson.asm_meson_tac(@list.List([]))
  let t1125 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), @sets.in_insert()]))
  let t1124 = @tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, IN(c, set_of_list(CONS((cl : (Form) -> Bool), (cls : List[(Form) -> Bool])))) → clause(c)"))
  let t1127 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_of_list(), subsumes_v1(), @sets.not_in_empty()])), t1124), t1125), t1126), @tactics.all_tac])
  let t1123 = @simp.rewrite_tac(@list.List([@lists.itlist(), @lists.mem(), @lists.filter()]))
  let t1121 = @term_syntax.parse_term("(added : List[(Form) -> Bool])")
  let t1122 = @tactics.spec_tac(@term_syntax.parse_term("(new : List[(Form) -> Bool])"), t1121)
  let t1120 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → (a : Bool) && (c : Bool)) → a → b → c")))
  let t1119 = @tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, IN(c, set_of_list(ITLIST(incorporate((cl : (Form) -> Bool)), (new : List[(Form) -> Bool]), (cls : List[(Form) -> Bool])))) → clause(c)"))
  let t1118 = @tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, MEM(c, (new : List[(Form) -> Bool])) → clause(c)"))
  let t1116 = @simp.rewrite_tac(@list.List([@equal.gsym(lemma1)]))
  let t1115 = @simp.rewrite_tac(@list.List([@sets.extension(), allntresolvents(), @sets.in_elim_thm(), @sets.set_of_list()]))
  let t1113 = @meson.asm_meson_tac(@list.List([]))
  let t1112 = @simp.asm_simp_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t1111 = @simp.simp_tac(@list.List([@sets.finite_rules(), @sets.finite_set_of_list()]))
  let t1110 = @tactics.match_mp_tac(allresolvents_finite())
  let t1109 = @tactics.match_mp_tac(@sets.set_of_list_of_set())
  let t1114 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_of_list()])), t1109), t1110), t1111), t1112), t1113), @tactics.all_tac])
  let t1108 = @tactics.subgoal_then(@term_syntax.parse_term("set_of_list(list_of_set(allresolvents({(cl : (Form) -> Bool)}, set_of_list(CONS(cl, (used0 : List[(Form) -> Bool])))))) == allresolvents({cl}, set_of_list(CONS(cl, used0)))"), fn(x1105 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1106 = @tactics.subst1_tac(x1105)
    fn(x1107 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1106(x1107)
    }
  })
  let t1104 = @simp.rewrite_tac(@list.List([resolvents()]))
  let t1103 = @fol.expand_tac("new")
  let t1117 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([set_of_list_filter()])), t1103), t1104), t1108), t1114), t1115), t1116), @tactics.all_tac])
  let t1102 = @tactics.subgoal_then(@term_syntax.parse_term("allntresolvents({(cl : (Form) -> Bool)}, UNION(set_of_list((used0 : List[(Form) -> Bool])), {cl})) == set_of_list(FILTER((c : (Form) -> Bool) => !tautologous(c), (new : List[(Form) -> Bool])))"), fn(x1099 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1100 = @tactics.subst1_tac(x1099)
    fn(x1101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1100(x1101)
    }
  })
  let t1097 = @simp.rewrite_tac(@list.List([used_sub()]))
  let t1096 = @simp.rewrite_tac(@list.List([@equal.gsym(used_def())]))
  let t1098 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@fol.expand_tac, @list.List(["sub0", "used0", "ppp"])), t1096), t1097), @tactics.all_tac])
  let t1095 = @tactics.subgoal_then(@term_syntax.parse_term("UNION(set_of_list((used : List[(Form) -> Bool])), (sub0 : ((Form) -> Bool) -> Bool)) == set_of_list((used0 : List[(Form) -> Bool]))"), fn(x1092 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1093 = @tactics.subst1_tac(x1092)
    fn(x1094 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1093(x1094)
    }
  })
  let t1091 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.union_assoc())]))
  let t1089 = @simp.asm_rewrite_tac(@list.List([@sets.in_set_of_list()]))
  let t1088 = @simp.asm_simp_tac(@list.List([]))
  let t1087 = @tactics.exists_tac(@term_syntax.parse_term("set_of_list(ITLIST(incorporate((cl : (Form) -> Bool)), (t : List[(Form) -> Bool]), (cls : List[(Form) -> Bool])))"))
  let t1086 = @tactics.match_mp_tac(subsumes_trans_v1())
  let t1085 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1081 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1082 = @tactics.assume_tac(x1081)
    fn(x1083 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1082(x1083)
    }
  }, fn(x1084 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t1080 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1074 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1075 = @tactics.assume_tac(x1074)
    fn(x1076 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1075(x1076)
    }
  }, fn(x1077 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1078 = @tactics.mp_tac(x1077)
    fn(x1079 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1078(x1079)
    }
  }))
  let t1073 = @simp.simp_tac(@list.List([@sets.in_set_of_list()]))
  let t1072 = @list.List([@simp.asm_simp_tac(@list.List([@equal.gsym(@sets.in_set_of_list())])), @tactics.all_tac])
  let t1069 = @term_syntax.parse_term("ITLIST(incorporate((cl : (Form) -> Bool)), (t : List[(Form) -> Bool]), (cls : List[(Form) -> Bool]))")
  let t1070 = @term_syntax.parse_term("(h : (Form) -> Bool)")
  let t1071 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(cl : (Form) -> Bool)"), t1070, t1069]), incorporate_v1()))
  let t1067 = @meson.asm_meson_tac(@list.List([]))
  let t1066 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), @sets.in_insert()]))
  let t1068 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, IN(c, set_of_list(CONS((cl : (Form) -> Bool), (cls : List[(Form) -> Bool])))) → clause(c)")), t1066), t1067), @tactics.all_tac])
  let t1065 = @simp.rewrite_tac(@list.List([@lists.itlist(), @lists.mem(), subsumes_refl_v1()]))
  let t1063 = @term_syntax.parse_term("(added : List[(Form) -> Bool])")
  let t1064 = @tactics.spec_tac(@term_syntax.parse_term("(new : List[(Form) -> Bool])"), t1063)
  let t1062 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → (a : Bool) && (c : Bool)) → a → b → c")))
  let t1061 = @tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, IN(c, set_of_list(ITLIST(incorporate((cl : (Form) -> Bool)), (new : List[(Form) -> Bool]), (cls : List[(Form) -> Bool])))) → clause(c)"))
  let t1060 = @tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, MEM(c, (new : List[(Form) -> Bool])) → clause(c)"))
  let t1059 = @simp.rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t1058 = @tactics.match_mp_tac(subsumes_union())
  let t1057 = @simp.once_rewrite_tac(@list.List([lemma1]))
  let t1056 = @simp.rewrite_tac(@list.List([@sets.set_of_list()]))
  let t1055 = @simp.rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t1054 = @tactics.match_mp_tac(subsumes_union())
  let t1052 = @meson.asm_meson_tac(@list.List([]))
  let t1053 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_insert()])), t1052), @tactics.all_tac])
  let t1051 = @simp.asm_rewrite_tac(@list.List([]))
  let t1050 = @tactics.exists_tac(@term_syntax.parse_term("UNION((sub0 : ((Form) -> Bool) -> Bool), set_of_list(CONS((cl : (Form) -> Bool), (cls : List[(Form) -> Bool]))))"))
  let t1049 = @tactics.match_mp_tac(subsumes_trans_v1())
  let t1090 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(lemma1)])), t1049), t1050), t1051), @tactics.conj_tac), t1053), t1054), t1055), t1056), t1057), t1058), t1059), t1060), t1061), t1062), t1064), @lists.list_induct_tac), t1065), t1068), @tactics.disch_tac), t1071), @tactics.ants_tac), t1072), t1073), t1080), t1085), t1086), t1087), t1088), t1089), @tactics.all_tac])
  let t1048 = @tactics.match_mp_tac(subsumes_union())
  let t1047 = @simp.gen_rewrite_tac(fn(x1044 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1045 = @equal.land_conv(x1044)
    fn(x1046 : @kernel.Term) -> @kernel.Thm raise {
      s1045(x1046)
    }
  }, @list.List([lemma2]))
  let t1041 = @simp.asm_simp_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t1040 = @tactics.match_mp_tac(allntresolvents_step())
  let t1042 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1039 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1033 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1034 = @equal.rand_conv(x1033)
      fn(x1035 : @kernel.Term) -> @kernel.Thm raise {
        s1034(x1035)
      }
    })((fn(x1036 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1037 = @equal.once_depth_conv(x1036)
      fn(x1038 : @kernel.Term) -> @kernel.Thm raise {
        s1037(x1038)
      }
    })(x1039))
  }, @list.List([lemma1])), t1040), t1041)
  let t1032 = @meson.asm_meson_tac(@list.List([]))
  let t1043 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_insert(), @sets.not_in_empty()])), t1032), @tactics.all_tac, t1042])
  let t1031 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1030 = @tactics.exists_tac(@term_syntax.parse_term("UNION(allntresolvents((sub0 : ((Form) -> Bool) -> Bool), UNION(set_of_list((used : List[(Form) -> Bool])), sub0)), allntresolvents({(cl : (Form) -> Bool)}, UNION(set_of_list(used), UNION(sub0, {cl}))))"))
  let t1029 = @tactics.match_mp_tac(subsumes_trans_v1())
  let t1027 = @meson.asm_meson_tac(@list.List([incorporate_v1()]))
  let t1025 = @meson.meson_tac(@list.List([]))
  let t1024 = @simp.rewrite_tac(@list.List([@sets.in_set_of_list(), @lists.mem()]))
  let t1026 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, IN(c, set_of_list(CONS((cl : (Form) -> Bool), (cls : List[(Form) -> Bool])))) → clause(c)")), t1024), t1025), @tactics.all_tac])
  let t1023 = @simp.rewrite_tac(@list.List([@lists.itlist(), @lists.mem()]))
  let t1021 = @term_syntax.parse_term("(more : List[(Form) -> Bool])")
  let t1022 = @tactics.spec_tac(@term_syntax.parse_term("(new : List[(Form) -> Bool])"), t1021)
  let t1020 = @tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, MEM(c, (new : List[(Form) -> Bool])) → clause(c)"))
  let t1028 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_set_of_list()])), t1020), t1022), @lists.list_induct_tac), t1023), t1026), t1027), @tactics.all_tac])
  let t1019 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t1017 = @meson.asm_meson_tac(@list.List([]))
  let t1016 = @simp.asm_simp_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t1014 = @tactics.match_mp_tac(allresolvents_clause())
  let t1013 = @simp.simp_tac(@list.List([@sets.finite_rules(), @sets.finite_set_of_list()]))
  let t1012 = @tactics.match_mp_tac(allresolvents_finite())
  let t1015 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.mem_list_of_set()), t1012), t1013), t1014])
  let t1011 = @tactics.subgoal_then(@term_syntax.parse_term("∀ c : (Form) -> Bool, MEM(c, list_of_set(allresolvents({(cl : (Form) -> Bool)}, INSERT(cl, set_of_list((used0 : List[(Form) -> Bool])))))) == IN(c, allresolvents({cl}, INSERT(cl, set_of_list(used0))))"), fn(x1009 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1009
    @simp.rewrite_tac(@list.List([th]))
  })
  let t1008 = @simp.rewrite_tac(@list.List([resolvents(), @sets.set_of_list()]))
  let t1018 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@fol.expand_tac("new"), t1008), t1011), t1015), t1016), t1017), @tactics.all_tac])
  let t1007 = @tactics.subgoal_then(@term_syntax.parse_term("∀ c : (Form) -> Bool, MEM(c, (new : List[(Form) -> Bool])) → clause(c)"), fn(x1004 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1005 = @tactics.assume_tac(x1004)
    fn(x1006 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1005(x1006)
    }
  })
  let t1002 = @meson.asm_meson_tac(@list.List([]))
  let t1003 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_of_list(), @sets.in_insert()])), t1002), @tactics.all_tac])
  let t1001 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) && (a : Bool) && (c : Bool) → a && b && c")))
  let t999 = @meson.asm_meson_tac(@list.List([]))
  let t998 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), @sets.in_insert()]))
  let t997 = @simp.asm_rewrite_tac(@list.List([]))
  let t1000 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([insert_def()]))), @class.cond_cases_tac), t997), t998), t999), @tactics.all_tac])
  let t995 = @meson.meson_tac(@list.List([]))
  let t994 = @simp.rewrite_tac(@list.List([@sets.set_of_list(), @sets.in_insert()]))
  let t996 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, IN(c, set_of_list(CONS((cl : (Form) -> Bool), (cls : List[(Form) -> Bool])))) → clause(c)")), t994), t995), @tactics.all_tac])
  let t993 = @tactics.subgoal_then(@term_syntax.parse_term("clause((cl : (Form) -> Bool))"), fn(x990 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s991 = @tactics.assume_tac(x990)
    fn(x992 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s991(x992)
    }
  })
  let t989 = @simp.rewrite_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t988 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t987 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.hd(), @lists.tl()]))
  let t985 = @tactics.x_choose_then(@term_syntax.parse_term("(cls : List[(Form) -> Bool])"))(fn(x982 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s983 = @tactics.subst_all_tac(x982)
    fn(x984 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s983(x984)
    }
  })
  let t986 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(cl : (Form) -> Bool)"))(t985))
  let t980 = @simp.asm_rewrite_tac(@list.List([@sets.set_of_list(), @sets.not_in_empty()]))
  let t981 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([])), t980), @tactics.all_tac])
  let t978 = @bool.ispec(@term_syntax.parse_term("(unused0 : List[(Form) -> Bool])"), @lists.list_cases())
  let t979 = @tactics.disj_cases_then2(fn(x972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s973 = @tactics.subst_all_tac(x972)
    fn(x974 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s973(x974)
    }
  }, fn(x975 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s976 = @tactics.mp_tac(x975)
    fn(x977 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s976(x977)
    }
  })(t978)
  let t971 = @simp.rewrite_tac(@list.List([step()]))
  let t970 = @simp.abbrev_tac(@term_syntax.parse_term("(sub0 : ((Form) -> Bool) -> Bool) == Sub(((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])), (n : Num))"))
  let t969 = @simp.rewrite_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t968 = @simp.abbrev_tac(@term_syntax.parse_term("(unused0 : List[(Form) -> Bool]) == SND((ppp : (List[(Form) -> Bool], List[(Form) -> Bool])))"))
  let t967 = @simp.abbrev_tac(@term_syntax.parse_term("(used0 : List[(Form) -> Bool]) == FST((ppp : (List[(Form) -> Bool], List[(Form) -> Bool])))"))
  let t966 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(ppp : (List[(Form) -> Bool], List[(Form) -> Bool]))"), @pair.pair())))
  let t965 = @simp.abbrev_tac(@term_syntax.parse_term("(ppp : (List[(Form) -> Bool], List[(Form) -> Bool])) == given((n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))"))
  let t964 = @simp.rewrite_tac(@list.List([sub_def(), unused_def(), used_def(), given()]))
  let t963 = @tactics.first_assum(fn(x962 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x960 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x955 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s956 = @tactics.undisch_tac(x955)
        fn(x957 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s956(x957)
        }
      })(((x959 : @kernel.Term) => @lib.check(fn(x958 : @kernel.Term) -> Bool raise {
        @basics.is_conj(x958)
      }, x959))(x960))
    })((fn(x961 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x961)
    })(x962))
  })
  let t951 = @simp.simp_tac(@list.List([@sets.subset(), allntresolvents(), @sets.in_elim_thm()]))
  let t950 = @simp.rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t949 = @tactics.exists_tac(@term_syntax.parse_term("allntresolvents({}, set_of_list((used : List[(Form) -> Bool])))"))
  let t952 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(subsumes_subset()), t949), t950), t951)
  let t947 = @simp.rewrite_tac(@list.List([subsumes_v1(), @sets.not_in_empty()]))
  let t948 = @list.List([@simp.rewrite_tac(@list.List([allresolvents(), @sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty()])), t947])
  let t953 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("allresolvents({}, set_of_list((used : List[(Form) -> Bool]))) == {}"), fn(x944 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s945 = @tactics.subst1_tac(x944)
    fn(x946 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s945(x946)
    }
  }), t948), t952])
  let t943 = @simp.asm_rewrite_tac(@list.List([unused_def(), given(), used_def(), @sets.in_set_of_list()]))
  let t942 = @tactics.exists_tac(@term_syntax.parse_term("allresolvents({}, Used(((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])), 0))"))
  let t941 = @tactics.match_mp_tac(subsumes_trans_v1())
  let t940 = @simp.asm_rewrite_tac(@list.List([unused_def(), given(), used_def(), @sets.in_set_of_list(), @sets.not_in_empty()]))
  let t954 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([sub_def(), @sets.union_empty()])), t940), t941), t942), t943), @tactics.conj_tac), t953), @tactics.all_tac])
  let t1168 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @nums.induct_tac), t954), t963), t964), t965), t966), t967), t968), t969), t970), @tactics.strip_tac), t971), t979), t981), t986), t987), @pair.let_tac), t988), t989), t993), t996), @tactics.conj_tac), t1000), t1001), @tactics.conj_tac), t1003), t1007), t1018), t1019), @tactics.conj_tac), t1028), @tactics.disch_tac), t1029), t1030), t1031), t1043), t1047), t1048), @tactics.conj_tac), t1090), t1091), t1095), t1098), t1102), t1117), t1118), t1119), t1120), t1122), @lists.list_induct_tac), t1123), t1127), @tactics.disch_tac), t1128), t1129), t1140), t1143), @tactics.ants_tac), t1144), t1145), @tactics.strip_tac), t1146), t1147), t1148), t1149), t1167)
  given_invariant_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], (∀ c : (Form) -> Bool, MEM(c, used) → clause(c)) && (∀ c : (Form) -> Bool, MEM(c, unused) → clause(c)) → (∀ n : Num, (∀ c : (Form) -> Bool, IN(c, Used((used, unused), n)) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, Unused((used, unused), n)) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, Sub((used, unused), n)) → clause(c)) && SUBSUMES(UNION(Sub((used, unused), n), Unused((used, unused), n)), allntresolvents(Sub((used, unused), n), UNION(set_of_list(used), Sub((used, unused), n)))))"), t1168))
}

///|
let given_invariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GIVEN_INVARIANT")

///|
/// `GIVEN_INVARIANT`
pub fn given_invariant() -> @kernel.Thm {
  given_invariant_c.get()
}

///|
/// SUB_MONO_SUBSET
fn step_55() -> Unit raise {
  let t1178 = @meson.asm_meson_tac(@list.List([@sets.subset_trans(), @sets.subset(), @sets.in_insert()]))
  let t1177 = @simp.asm_rewrite_tac(@list.List([]))
  let t1176 = @simp.rewrite_tac(@list.List([sub_def()]))
  let t1175 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @sets.subset_refl()]))
  let t1173 = @term_syntax.parse_term("(d : Num)")
  let t1174 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t1173)
  let t1172 = @tactics.disch_then(fn(x1171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1170 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t1169 = @simp.simp_tac(@list.List([@arith.le_exists(), @theorems.left_imp_exists_thm()]))
  let t1179 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1169), t1170), t1172), t1174), @nums.induct_tac), t1175), t1176), @class.cond_cases_tac), t1177), t1178)
  sub_mono_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ init : (List[(Form) -> Bool], List[(Form) -> Bool]), ∀ m : Num, ∀ n : Num, m <= n → SUBSET(Sub(init, m), Sub(init, n))"), t1179))
}

///|
let sub_mono_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_MONO_SUBSET")

///|
/// `SUB_MONO_SUBSET`
pub fn sub_mono_subset() -> @kernel.Thm {
  sub_mono_subset_c.get()
}

///|
/// SUB_MONO
fn step_56() -> Unit raise {
  let t1180 = @meson.meson_tac(@list.List([subsumes_subset_refl(), sub_mono_subset()]))
  sub_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ init : (List[(Form) -> Bool], List[(Form) -> Bool]), ∀ m : Num, ∀ n : Num, m <= n → SUBSUMES(Sub(init, n), Sub(init, m))"), t1180))
}

///|
let sub_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_MONO")

///|
/// `SUB_MONO`
pub fn sub_mono() -> @kernel.Thm {
  sub_mono_c.get()
}

///|
/// LENGTH_REPLACE
fn step_57() -> Unit raise {
  let t1183 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @arith.le_suc(), @arith.le_refl()]))
  let t1182 = @simp.rewrite_tac(@list.List([@lists.length(), @arith.le_0()]))
  let t1181 = @simp.rewrite_tac(@list.List([replace()]))
  let t1184 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t1181), t1182), @class.cond_cases_tac), t1183)
  length_replace_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl : (Form) -> Bool, ∀ current : List[(Form) -> Bool], LENGTH(current) <= LENGTH(replace(cl, current))"), t1184))
}

///|
let length_replace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_REPLACE")

///|
/// `LENGTH_REPLACE`
pub fn length_replace() -> @kernel.Thm {
  length_replace_c.get()
}

///|
/// LENGTH_INCORPORATE
fn step_58() -> Unit raise {
  let t1186 = @simp.rewrite_tac(@list.List([@arith.le_refl(), length_replace()]))
  let t1185 = @simp.rewrite_tac(@list.List([incorporate()]))
  let t1187 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1185), @class.cond_cases_tac), t1186)
  length_incorporate_c.set(@tactics.prove(@term_syntax.parse_term("∀ gcl : (Form) -> Bool, ∀ cl : (Form) -> Bool, ∀ current : List[(Form) -> Bool], LENGTH(current) <= LENGTH(incorporate(gcl, cl, current))"), t1187))
}

///|
let length_incorporate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_INCORPORATE")

///|
/// `LENGTH_INCORPORATE`
pub fn length_incorporate() -> @kernel.Thm {
  length_incorporate_c.get()
}

///|
/// LENGTH_UNUSED_CHANGE
fn step_59() -> Unit raise {
  let t1210 = @meson.asm_meson_tac(@list.List([length_incorporate(), @arith.le_trans()]))
  let t1209 = @simp.rewrite_tac(@list.List([@lists.itlist(), @arith.le_refl()]))
  let t1208 = @simp.rewrite_tac(@list.List([@lists.hd()]))
  let t1206 = @term_syntax.parse_term("(k : List[(Form) -> Bool])")
  let t1207 = @tactics.spec_tac(@term_syntax.parse_term("resolvents(HD(CONS((h : (Form) -> Bool), (t : List[(Form) -> Bool]))), CONS(HD(CONS(h, t)), FST(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))))"), t1206)
  let t1205 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) <= (y : Num) → SUC(x) + (n : Num) <= SUC(y + n)")))
  let t1204 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.tl(), @lists.length()]))
  let t1202 = @term_syntax.parse_term("(l : List[(Form) -> Bool])")
  let t1203 = @tactics.spec_tac(@term_syntax.parse_term("SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))"), t1202)
  let t1201 = @tactics.undisch_tac(@term_syntax.parse_term("!(SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))) == NIL)"))
  let t1200 = @simp.asm_rewrite_tac(@list.List([]))
  let t1199 = @tactics.exists_tac(@term_syntax.parse_term("LENGTH(SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))) + n"))
  let t1198 = @tactics.match_mp_tac(@arith.le_trans())
  let t1197 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) <= (n : Num) → m <= SUC(n)"))]))
  let t1196 = @simp.rewrite_tac(@list.List([@pair.snd()]))
  let t1195 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t1194 = @simp.pure_rewrite_tac(@list.List([step()]))
  let t1193 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))"), @pair.pair())))
  let t1192 = @simp.rewrite_tac(@list.List([given()]))
  let t1191 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.le_refl()]))
  let t1189 = @term_syntax.parse_term("(unused : List[(Form) -> Bool])")
  let t1190 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(used : List[(Form) -> Bool])"), t1189]))
  let t1211 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1188 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1188
  }, @list.List([@pair.forall_pair_thm()])), t1190), @tactics.gen_tac), @nums.induct_tac), t1191), t1192), t1193), t1194), t1195), @class.cond_cases_tac), t1196), t1197), t1198), t1199), t1200), t1201), t1203), @lists.list_induct_tac), t1204), t1205), t1207), t1208), @lists.list_induct_tac), t1209), t1210)
  length_unused_change_c.set(@tactics.prove(@term_syntax.parse_term("∀ init : (List[(Form) -> Bool], List[(Form) -> Bool]), ∀ m : Num, ∀ n : Num, LENGTH(SND(given(m, init))) <= LENGTH(SND(given(m + n, init))) + n"), t1211))
}

///|
let length_unused_change_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_UNUSED_CHANGE")

///|
/// `LENGTH_UNUSED_CHANGE`
pub fn length_unused_change() -> @kernel.Thm {
  length_unused_change_c.get()
}

///|
/// LENGTH_UNUSED_ZERO
fn step_60() -> Unit raise {
  let t1216 = @simp.asm_simp_tac(@list.List([]))
  let t1215 = @simp.pure_rewrite_tac(@list.List([step()]))
  let t1214 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))"), @pair.pair())))
  let t1213 = @simp.rewrite_tac(@list.List([given()]))
  let t1212 = @simp.simp_tac(@list.List([@arith.add_clauses()]))
  let t1217 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @nums.induct_tac), t1212), t1213), t1214), t1215), t1216)
  length_unused_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], ∀ m : Num, ∀ n : Num, SND(given(m, (used, unused))) == NIL → SND(given(m + n, (used, unused))) == NIL"), t1217))
}

///|
let length_unused_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LENGTH_UNUSED_ZERO")

///|
/// `LENGTH_UNUSED_ZERO`
pub fn length_unused_zero() -> @kernel.Thm {
  length_unused_zero_c.get()
}

///|
/// REPLACE_SUBSUMES_SELF
fn step_61() -> Unit raise {
  let t1220 = @simp.asm_rewrite_tac(@list.List([@lists.hd(), @lists.tl(), @lists.el(), subsumes_refl(), @arith.lt_suc()]))
  let t1219 = @simp.rewrite_tac(@list.List([@lists.el()]))
  let t1218 = @simp.rewrite_tac(@list.List([replace(), @lists.length(), @bool.conjunct1(@arith.lt())]))
  let t1221 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t1218), @nums.induct_tac), t1219), @class.cond_cases_tac), t1220)
  replace_subsumes_self_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl : (Form) -> Bool, ∀ current : List[(Form) -> Bool], ∀ n : Num, n < LENGTH(current) → subsumes(EL(n, replace(cl, current)), EL(n, current))"), t1221))
}

///|
let replace_subsumes_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REPLACE_SUBSUMES_SELF")

///|
/// `REPLACE_SUBSUMES_SELF`
pub fn replace_subsumes_self() -> @kernel.Thm {
  replace_subsumes_self_c.get()
}

///|
/// INCORPORATE_SUBSUMES_SELF
fn step_62() -> Unit raise {
  let t1223 = @simp.rewrite_tac(@list.List([subsumes_refl(), replace_subsumes_self()]))
  let t1222 = @simp.rewrite_tac(@list.List([incorporate()]))
  let t1224 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1222), @class.cond_cases_tac), t1223)
  incorporate_subsumes_self_c.set(@tactics.prove(@term_syntax.parse_term("∀ gcl : (Form) -> Bool, ∀ cl : (Form) -> Bool, ∀ current : List[(Form) -> Bool], ∀ n : Num, n < LENGTH(current) → subsumes(EL(n, incorporate(gcl, cl, current)), EL(n, current))"), t1224))
}

///|
let incorporate_subsumes_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCORPORATE_SUBSUMES_SELF")

///|
/// `INCORPORATE_SUBSUMES_SELF`
pub fn incorporate_subsumes_self() -> @kernel.Thm {
  incorporate_subsumes_self_c.get()
}

///|
/// REPLACE_CLAUSE
fn step_63() -> Unit raise {
  let t1227 = @meson.asm_meson_tac(@list.List([]))
  let t1226 = @simp.rewrite_tac(@list.List([@lists.mem()]))
  let t1225 = @simp.simp_tac(@list.List([replace(), @lists.mem()]))
  let t1228 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t1225), @tactics.strip_tac), @tactics.gen_tac), @class.cond_cases_tac), t1226), t1227)
  replace_clause_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl : (Form) -> Bool, ∀ current : List[(Form) -> Bool], (∀ c : (Form) -> Bool, MEM(c, current) → clause(c)) && clause(cl) → (∀ c : (Form) -> Bool, MEM(c, replace(cl, current)) → clause(c))"), t1228))
}

///|
let replace_clause_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REPLACE_CLAUSE")

///|
/// `REPLACE_CLAUSE`
pub fn replace_clause() -> @kernel.Thm {
  replace_clause_c.get()
}

///|
/// INCORPORATE_CLAUSE
fn step_64() -> Unit raise {
  let t1231 = @meson.asm_meson_tac(@list.List([replace_clause()]))
  let t1230 = @simp.asm_rewrite_tac(@list.List([]))
  let t1229 = @simp.rewrite_tac(@list.List([incorporate()]))
  let t1232 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @tactics.gen_tac), t1229), @class.cond_cases_tac), t1230), t1231)
  incorporate_clause_c.set(@tactics.prove(@term_syntax.parse_term("(∀ c : (Form) -> Bool, MEM(c, (current : List[(Form) -> Bool])) → clause(c)) && clause((cl : (Form) -> Bool)) → (∀ c : (Form) -> Bool, MEM(c, incorporate((gcl : (Form) -> Bool), cl, current)) → clause(c))"), t1232))
}

///|
let incorporate_clause_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCORPORATE_CLAUSE")

///|
/// `INCORPORATE_CLAUSE`
pub fn incorporate_clause() -> @kernel.Thm {
  incorporate_clause_c.get()
}

///|
/// INCORPORATE_CLAUSE_EL
fn step_65() -> Unit raise {
  let t1233 = @meson.meson_tac(@list.List([@lists.mem_el(), incorporate_clause(), length_incorporate(), @arith.lte_trans()]))
  incorporate_clause_el_c.set(@tactics.prove(@term_syntax.parse_term("(∀ c : (Form) -> Bool, MEM(c, (current : List[(Form) -> Bool])) → clause(c)) && clause((cl : (Form) -> Bool)) && (p : Num) < LENGTH(current) → clause(EL(p, incorporate((gcl : (Form) -> Bool), cl, current)))"), t1233))
}

///|
let incorporate_clause_el_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCORPORATE_CLAUSE_EL")

///|
/// `INCORPORATE_CLAUSE_EL`
pub fn incorporate_clause_el() -> @kernel.Thm {
  incorporate_clause_el_c.get()
}

///|
/// UNUSED_SUBSUMES_SELF
fn step_66() -> Unit raise {
  let t1351 = @meson.asm_meson_tac(@list.List([incorporate_clause()]))
  let t1350 = @simp.asm_rewrite_tac(@list.List([]))
  let t1349 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1348 = @simp.rewrite_tac(@list.List([@lists.itlist(), @lists.mem()]))
  let t1347 = @tactics.pop_assum_list(fn(x1346 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1345 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@lists.mem()]))])
  let t1344 = @tactics.subgoal_then(@term_syntax.parse_term("∀ current : List[(Form) -> Bool], ∀ gcl : (Form) -> Bool, ∀ new : List[(Form) -> Bool], (∀ c : (Form) -> Bool, MEM(c, current) → clause(c)) && (∀ c : (Form) -> Bool, MEM(c, new) → clause(c)) → (∀ c : (Form) -> Bool, MEM(c, ITLIST(incorporate(gcl), new, current)) → clause(c))"), @tactics.match_mp_tac)
  let t1342 = @meson.asm_meson_tac(@list.List([@arith.le_trans(), length_incorporate()]))
  let t1341 = @simp.rewrite_tac(@list.List([@lists.itlist(), @arith.le_refl()]))
  let t1340 = @tactics.subgoal_then(@term_syntax.parse_term("∀ gcl : (Form) -> Bool, ∀ current : List[(Form) -> Bool], ∀ lis : List[(Form) -> Bool], LENGTH(current) <= LENGTH(ITLIST(incorporate(gcl), lis, current))"), fn(x1338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x1338
    @meson.asm_meson_tac(@list.List([@arith.lte_trans(), th_4]))
  })
  let t1343 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([@lists.mem()])), @tactics.all_tac])), t1340), @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t1341), t1342)])
  let t1337 = @tactics.match_mp_tac(incorporate_clause_el())
  let t1335 = @meson.asm_meson_tac(@list.List([length_incorporate(), @arith.lte_trans()]))
  let t1334 = @simp.rewrite_tac(@list.List([@lists.itlist()]))
  let t1332 = @term_syntax.parse_term("(k : List[(Form) -> Bool])")
  let t1333 = @tactics.spec_tac(@term_syntax.parse_term("(t' : List[(Form) -> Bool])"), t1332)
  let t1331 = @tactics.undisch_tac(@term_syntax.parse_term("(p : Num) < LENGTH((t : List[(Form) -> Bool]))"))
  let t1336 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(incorporate_subsumes_self()), t1331), t1333), @lists.list_induct_tac), t1334), t1335)])
  let t1330 = @tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) → (d : Bool)) == (a && b → c → d)"))]))(subsumes_trans()))
  let t1329 = @list.List([@meson.asm_meson_tac(@list.List([@lists.mem()])), @tactics.all_tac])
  let t1328 = @simp.asm_rewrite_tac(@list.List([]))
  let t1324 = @term_syntax.parse_term("(p : Num)")
  let t1327 = @tactics.first_x_assum(fn(x1326 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1321 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1322 = @tactics.mp_tac(x1321)
      fn(x1323 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1322(x1323)
      }
    })(((x1325 : @kernel.Thm) => @bool.spec(t1324, x1325))(x1326))
  })
  let t1320 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1319 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1318 = @simp.rewrite_tac(@list.List([@lists.itlist(), subsumes_refl()]))
  let t1316 = @term_syntax.parse_term("(new : List[(Form) -> Bool])")
  let t1317 = @tactics.spec_tac(@term_syntax.parse_term("(new : List[(Form) -> Bool])"), t1316)
  let t1314 = @term_syntax.parse_term("(p : Num)")
  let t1315 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num) + (k : Num)"), t1314)
  let t1313 = @tactics.undisch_tac(@term_syntax.parse_term("∀ c : (Form) -> Bool, MEM(c, (new : List[(Form) -> Bool])) → clause(c)"))
  let t1312 = @simp.rewrite_tac(@list.List([@lists.length(), @arith.lt_suc()]))
  let t1311 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.el(), @lists.hd(), @lists.tl()]))
  let t1309 = @term_syntax.parse_term("(l : List[(Form) -> Bool])")
  let t1310 = @tactics.spec_tac(@term_syntax.parse_term("SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))"), t1309)
  let t1308 = @tactics.undisch_tac(@term_syntax.parse_term("!(SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))) == NIL)"))
  let t1306 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.hd()]))
  let t1304 = @term_syntax.parse_term("(l : List[(Form) -> Bool])")
  let t1305 = @tactics.spec_tac(@term_syntax.parse_term("SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))"), t1304)
  let t1303 = @tactics.undisch_tac(@term_syntax.parse_term("!(SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))) == NIL)"))
  let t1302 = @fol.expand_tac("gcl")
  let t1301 = @simp.rewrite_tac(@list.List([unused_def(), @sets.in_set_of_list()]))
  let t1300 = @tactics.subgoal_then(@term_syntax.parse_term("IN((gcl : (Form) -> Bool), Unused(((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])), (m : Num)))"), fn(x1298 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x1298
    @meson.asm_meson_tac(@list.List([th_3, given_invariant()]))
  })
  let t1297 = @tactics.subgoal_then(@term_syntax.parse_term("clause((gcl : (Form) -> Bool))"), fn(x1295 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1295
    @meson.asm_meson_tac(@list.List([th_2, given_invariant()]))
  })
  let t1292 = @simp.asm_simp_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t1293 = @tactics.then_tac(@tactics.match_mp_tac(allresolvents_clause()), t1292)
  let t1291 = @simp.rewrite_tac(@list.List([@equal.gsym(used_def())]))
  let t1290 = @simp.rewrite_tac(@list.List([used_def(), @sets.finite_set_of_list()]))
  let t1289 = @simp.rewrite_tac(@list.List([@sets.finite_insert()]))
  let t1288 = @simp.asm_simp_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t1287 = @simp.simp_tac(@list.List([@sets.finite_rules(), @sets.finite_set_of_list()]))
  let t1286 = @tactics.match_mp_tac(allresolvents_finite())
  let t1294 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.mem_list_of_set()), t1286), t1287), t1288), t1289), t1290), t1291), t1293])
  let t1285 = @tactics.subgoal_then(@term_syntax.parse_term("∀ c : (Form) -> Bool, MEM(c, list_of_set(allresolvents({(gcl : (Form) -> Bool)}, INSERT(gcl, Used(((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])), (m : Num)))))) == IN(c, allresolvents({gcl}, INSERT(gcl, Used((used, unused), m))))"), fn(x1283 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1283
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t1282 = @simp.rewrite_tac(@list.List([@equal.gsym(used_def())]))
  let t1281 = @simp.abbrev_tac(@term_syntax.parse_term("(gcl : (Form) -> Bool) == HD(SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))))"))
  let t1280 = @simp.rewrite_tac(@list.List([resolvents(), @sets.set_of_list()]))
  let t1307 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@fol.expand_tac("new"), t1280), t1281), t1282), t1285), t1294), t1297), t1300), t1301), t1302), t1303), t1305), @lists.list_induct_tac), t1306), @tactics.all_tac])
  let t1279 = @tactics.subgoal_then(@term_syntax.parse_term("∀ c : (Form) -> Bool, MEM(c, (new : List[(Form) -> Bool])) → clause(c)"), fn(x1276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1277 = @tactics.mp_tac(x1276)
    fn(x1278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1277(x1278)
    }
  })
  let t1274 = @meson.asm_meson_tac(@list.List([given_invariant()]))
  let t1273 = @equal.gsym(unused_def())
  let t1275 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.in_set_of_list()), t1273])), t1274), @tactics.all_tac])
  let t1272 = @tactics.subgoal_then(@term_syntax.parse_term("∀ c : (Form) -> Bool, MEM(c, SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))) → clause(c)"), fn(x1269 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1270 = @tactics.mp_tac(x1269)
    fn(x1271 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1270(x1271)
    }
  })
  let t1268 = @tactics.undisch_tac(@term_syntax.parse_term("SUC((n : Num) + (k : Num)) < LENGTH(SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))))"))
  let t1266 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @arith.lt()]))
  let t1267 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("SUC((n : Num) + (k : Num)) < LENGTH(SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))))")), t1266), @tactics.all_tac])
  let t1265 = @simp.rewrite_tac(@list.List([@pair.snd()]))
  let t1264 = @simp.pure_rewrite_tac(@list.List([step()]))
  let t1263 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))"), @pair.pair())))
  let t1262 = @simp.rewrite_tac(@list.List([given()]))
  let t1260 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1259 = @tactics.undisch_tac(@term_syntax.parse_term("SUC((n : Num) + (k : Num)) < LENGTH(SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))))"))
  let t1256 = @term_syntax.parse_term("SUC((k : Num))")
  let t1257 = @term_syntax.parse_term("(m : Num)")
  let t1258 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))"), t1257, t1256]), length_unused_change()))
  let t1255 = @tactics.match_mp_tac(@lists.mem_el())
  let t1254 = @simp.rewrite_tac(@list.List([unused_def(), @sets.in_set_of_list()]))
  let t1261 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("IN(EL((n : Num), SND(given(SUC((m : Num) + (k : Num)), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))), Unused((used, unused), SUC(m + k)))"), fn(x1252 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1252
    @meson.asm_meson_tac(@list.List([th, given_invariant()]))
  }), t1254), t1255), t1258), t1259), t1260), @int.arith_tac), @tactics.all_tac])
  let t1251 = @tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) → (d : Bool)) == (a && c → b → d)"))]))(subsumes_trans()))
  let t1249 = @simp.asm_rewrite_tac(@list.List([]))
  let t1248 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("SUC((x : Num)) < (lm : Num) → lm <= (lm1 : Num) + 1 → x < lm1")))
  let t1247 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t1245 = @term_syntax.parse_term("1")
  let t1246 = @term_syntax.parse_term("(m : Num)")
  let t1250 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))"), t1246, t1245]), length_unused_change())), t1247), t1248), t1249), @tactics.all_tac])
  let t1244 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1239 = @term_syntax.parse_term("(n : Num)")
  let t1240 = @list.List([@term_syntax.parse_term("SUC((m : Num))"), t1239])
  let t1243 = @tactics.first_x_assum(fn(x1242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1237 = @tactics.mp_tac(x1236)
      fn(x1238 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1237(x1238)
      }
    })(((x1241 : @kernel.Thm) => @bool.specl(t1240, x1241))(x1242))
  })
  let t1235 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1234 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), subsumes_refl()]))
  let t1352 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @nums.induct_tac), t1234), t1235), t1243), t1244), @tactics.ants_tac), t1250), t1251), @tactics.conj_tac), t1261), t1262), t1263), t1264), @pair.let_tac), @class.cond_cases_tac), t1265), t1267), t1268), t1272), t1275), t1279), t1307), @tactics.disch_tac), t1308), t1310), @lists.list_induct_tac), t1311), t1312), t1313), t1315), t1317), @lists.list_induct_tac), t1318), t1319), t1320), t1327), t1328), @tactics.ants_tac), t1329), t1330), @tactics.conj_tac), t1336), t1337), @tactics.conj_tac), t1343), t1344), t1345), t1347), @tactics.gen_tac), @tactics.gen_tac), @lists.list_induct_tac), t1348), t1349), t1350), t1351)
  unused_subsumes_self_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], (∀ c : (Form) -> Bool, MEM(c, used) → clause(c)) && (∀ c : (Form) -> Bool, MEM(c, unused) → clause(c)) → (∀ k : Num, ∀ m : Num, ∀ n : Num, n + k < LENGTH(SND(given(m, (used, unused)))) → subsumes(EL(n, SND(given(m + k, (used, unused)))), EL(n + k, SND(given(m, (used, unused))))))"), t1352))
}

///|
let unused_subsumes_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNUSED_SUBSUMES_SELF")

///|
/// `UNUSED_SUBSUMES_SELF`
pub fn unused_subsumes_self() -> @kernel.Thm {
  unused_subsumes_self_c.get()
}

///|
/// SUB_SUBSUMES_UNUSED
fn step_67() -> Unit raise {
  let t1353 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(@term_syntax.parse_term("INSERT((x : _), (s : (_) -> Bool)) == UNION({x}, s)"), t1353)
  let t1474 = @tactics.undisch_tac(@term_syntax.parse_term("!(LENGTH(SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))) <= (n : Num))"))
  let t1473 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1472 = @simp.asm_rewrite_tac(@list.List([]))
  let t1470 = @term_syntax.parse_term("(unused : List[(Form) -> Bool])")
  let t1471 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(used : List[(Form) -> Bool])"), t1470]), unused_subsumes_self()))
  let t1469 = @simp.gen_rewrite_tac(fn(x1468 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1462 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1463 = @equal.rand_conv(x1462)
      fn(x1464 : @kernel.Term) -> @kernel.Thm raise {
        s1463(x1464)
      }
    })((fn(x1465 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1466 = @equal.land_conv(x1465)
      fn(x1467 : @kernel.Term) -> @kernel.Thm raise {
        s1466(x1467)
      }
    })(x1468))
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) == 0 + n"))]))
  let t1461 = @simp.gen_rewrite_tac(fn(x1458 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1459 = @equal.land_conv(x1458)
    fn(x1460 : @kernel.Term) -> @kernel.Thm raise {
      s1459(x1460)
    }
  }, @list.List([@equal.gsym(@bool.conjunct1(@lists.el()))]))
  let t1457 = @tactics.subgoal_then(@term_syntax.parse_term("subsumes(HD(SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))), EL(n, SND(given(m, (used, unused)))))"), fn(x1455 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x1455
    @meson.meson_tac(@list.List([th_3]))
  })
  let t1454 = @simp.rewrite_tac(@list.List([subsumes_v1(), @sets.in_insert(), @sets.not_in_empty()]))
  let t1453 = @simp.rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t1452 = @tactics.match_mp_tac(subsumes_union())
  let t1450 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union(), @sets.in_insert(), @sets.not_in_empty()]))
  let t1449 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.in_set_of_list()), @sets.set_of_list_append(), @sets.set_of_list()]))
  let t1445 = @term_syntax.parse_term("SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))")
  let t1446 = @term_syntax.parse_term("(n : Num)")
  let t1447 = @bool.ispecl(@list.List([@term_syntax.parse_term("(x : (Form) -> Bool)"), t1446, t1445]), firstn_suc())
  let t1448 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(x : (Form) -> Bool)"), t1447))
  let t1444 = @simp.rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t1443 = @tactics.exists_tac(@term_syntax.parse_term("set_of_list(FIRSTN(SUC((n : Num)), SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))))"))
  let t1451 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(subsumes_subset()), t1443), t1444), t1448), t1449), t1450)])
  let t1441 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.hd()]))
  let t1439 = @term_syntax.parse_term("(l : List[(Form) -> Bool])")
  let t1440 = @tactics.spec_tac(@term_syntax.parse_term("SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))"), t1439)
  let t1438 = @tactics.undisch_tac(@term_syntax.parse_term("!(SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))) == NIL)"))
  let t1437 = @simp.rewrite_tac(@list.List([unused_def(), @sets.in_set_of_list()]))
  let t1436 = @tactics.subgoal_then(@term_syntax.parse_term("IN(HD(SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))), Unused((used, unused), m + n))"), fn(x1434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1434
    @meson.asm_meson_tac(@list.List([th_2, given_invariant()]))
  })
  let t1433 = @tactics.disch_then(fn(x1430 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1431 = @tactics.subst1_tac(x1430)
    fn(x1432 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1431(x1432)
    }
  })
  let t1428 = @meson.asm_meson_tac(@list.List([given_invariant()]))
  let t1426 = @equal.gsym(unused_def())
  let t1427 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.in_set_of_list()), t1426]))
  let t1424 = @drule.match_mp(firstn_sublist())
  let t1429 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1421 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1422 = @tactics.mp_tac(x1421)
      fn(x1423 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1422(x1423)
      }
    })(t1424(x1425))
  }), t1427), t1428), @tactics.all_tac])
  let t1420 = @tactics.disch_then(@tactics.disj_cases_then(fn(x1417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1418 = @tactics.mp_tac(x1417)
    fn(x1419 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1418(x1419)
    }
  }))
  let t1416 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Form) -> Bool)"))
  let t1415 = @simp.rewrite_tac(@list.List([@sets.in_set_of_list()]))
  let t1414 = @simp.rewrite_tac(@list.List([@equal.gsym(unused_def())]))
  let t1442 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_insert(), @sets.not_in_empty()])), t1414), t1415), t1416), t1420), t1429), t1433), t1436), t1437), t1438), t1440), @lists.list_induct_tac), t1441), @tactics.all_tac])
  let t1413 = @tactics.exists_tac(@term_syntax.parse_term("UNION(set_of_list(FIRSTN((n : Num), SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))))), {EL(n, SND(given(m, (used, unused))))})"))
  let t1412 = @tactics.match_mp_tac(subsumes_trans_v1())
  let t1410 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_union()]))
  let t1409 = @simp.rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t1408 = @tactics.exists_tac(@term_syntax.parse_term("set_of_list(FIRSTN((n : Num), SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))))"))
  let t1407 = @tactics.match_mp_tac(subsumes_subset())
  let t1411 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([firstn_short()])), t1407), t1408), t1409), t1410), @tactics.all_tac])
  let t1406 = @class.asm_cases_tac(@term_syntax.parse_term("LENGTH(SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))) <= (n : Num)"))
  let t1404 = @sets.set_tac(@list.List([]))
  let t1403 = @simp.rewrite_tac(@list.List([@sets.set_of_list()]))
  let t1402 = @tactics.undisch_tac(@term_syntax.parse_term("!(SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))) == NIL)"))
  let t1405 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([firstn()])), t1402), t1403), t1404), @tactics.all_tac])
  let t1401 = @tactics.subgoal_then(@term_syntax.parse_term("UNION({HD(SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))))}, set_of_list(FIRSTN((n : Num), TL(SND(given(m, (used, unused))))))) == set_of_list(FIRSTN(SUC(n), SND(given(m, (used, unused)))))"), fn(x1398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1399 = @tactics.subst1_tac(x1398)
    fn(x1400 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1399(x1400)
    }
  })
  let t1397 = @simp.asm_rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t1396 = @tactics.match_mp_tac(subsumes_union())
  let t1394 = @term_syntax.parse_term("UNION((s : (_) -> Bool), UNION((t : (_) -> Bool), (u : (_) -> Bool))) == UNION(t, UNION(u, s))")
  let t1395 = @simp.gen_rewrite_tac(fn(x1391 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1392 = @equal.land_conv(x1391)
    fn(x1393 : @kernel.Term) -> @kernel.Thm raise {
      s1392(x1393)
    }
  }, @list.List([@theorems.ac(@sets.union_aci())(t1394)]))
  let t1390 = @simp.once_rewrite_tac(@list.List([lemma]))
  let t1389 = @simp.rewrite_tac(@list.List([@sets.set_of_list()]))
  let t1387 = @simp.asm_rewrite_tac(@list.List([subsumes_refl_v1()]))
  let t1386 = @tactics.match_mp_tac(subsumes_union())
  let t1388 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([lemma])), t1386), t1387), @tactics.all_tac])
  let t1384 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.hd()]))
  let t1382 = @term_syntax.parse_term("(l : List[(Form) -> Bool])")
  let t1383 = @tactics.spec_tac(@term_syntax.parse_term("SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))"), t1382)
  let t1381 = @simp.rewrite_tac(@list.List([unused_def(), @sets.in_set_of_list()]))
  let t1380 = @tactics.undisch_tac(@term_syntax.parse_term("!(SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))) == NIL)"))
  let t1379 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([given_invariant()]))])
  let t1378 = @tactics.subgoal_then(@term_syntax.parse_term("IN(HD(SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))), Unused((used, unused), m + n))"), fn(x1375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1376 = @tactics.mp_tac(x1375)
    fn(x1377 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1376(x1377)
    }
  })
  let t1385 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_insert()])), t1378), t1379), t1380), t1381), t1383), @lists.list_induct_tac), t1384), @tactics.all_tac])
  let t1374 = @tactics.exists_tac(@term_syntax.parse_term("INSERT(HD(SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))), UNION(Sub((used, unused), m), set_of_list(FIRSTN(n, SND(given(m, (used, unused)))))))"))
  let t1373 = @tactics.match_mp_tac(subsumes_trans_v1())
  let t1372 = @list.List([@meson.asm_meson_tac(@list.List([length_unused_zero()])), @tactics.all_tac])
  let t1371 = @simp.rewrite_tac(@list.List([firstn()]))
  let t1369 = @simp.asm_rewrite_tac(@list.List([length_unused_change(), @lists.length(), @arith.add_clauses(), @arith.le_refl()]))
  let t1368 = @tactics.exists_tac(@term_syntax.parse_term("LENGTH(SND(given((m : Num) + (n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))) + n"))
  let t1367 = @tactics.match_mp_tac(@arith.le_trans())
  let t1366 = @tactics.subgoal_then(@term_syntax.parse_term("LENGTH(SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))) <= (n : Num)"), fn(x1364 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1364
    @meson.meson_tac(@list.List([th_1, firstn_trivial(), @arith.le_refl(), @int.arith_rule(@term_syntax.parse_term("(x : Num) <= (n : Num) → x <= SUC(n)"))]))
  })
  let t1370 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("FIRSTN(SUC((n : Num)), SND(given((m : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))) == FIRSTN(n, SND(given(m, (used, unused))))"), fn(x1362 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1362
    @simp.asm_rewrite_tac(@list.List([th]))
  }), t1366), t1367), t1368), t1369), @tactics.all_tac])
  let t1361 = @simp.rewrite_tac(@list.List([sub_def()]))
  let t1360 = @list.List([@simp.rewrite_tac(@list.List([firstn(), @sets.set_of_list(), @sets.union_empty(), subsumes_refl_v1()])), @tactics.all_tac])
  let t1359 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1358 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@arith.le_refl(), firstn_trivial(), unused_def()]))])
  let t1357 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, SUBSUMES(Sub(((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])), m + n), UNION(Sub((used, unused), m), set_of_list(FIRSTN(n, SND(given(m, (used, unused)))))))"), fn(x1354 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1355 = @tactics.mp_tac(x1354)
    fn(x1356 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1355(x1356)
    }
  })
  let t1475 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1357), t1358), @tactics.gen_tac), @nums.induct_tac), t1359), t1360), t1361), @class.cond_cases_tac), t1370), t1371), @class.cond_cases_tac), t1372), t1373), t1374), @tactics.conj_tac), t1385), @tactics.conj_tac), t1388), t1389), t1390), t1395), t1396), t1397), t1401), t1405), t1406), t1411), t1412), t1413), @tactics.conj_tac), t1442), @tactics.conj_tac), t1451), t1452), t1453), t1454), t1457), t1461), t1469), t1471), t1472), t1473), t1474), @int.arith_tac)
  sub_subsumes_unused_c.set(@tactics.prove(@term_syntax.parse_term("(∀ c : (Form) -> Bool, MEM(c, (used : List[(Form) -> Bool])) → clause(c)) && (∀ c : (Form) -> Bool, MEM(c, (unused : List[(Form) -> Bool])) → clause(c)) → (∀ n : Num, SUBSUMES(Sub((used, unused), n + LENGTH(SND(given(n, (used, unused))))), UNION(Sub((used, unused), n), Unused((used, unused), n))))"), t1475))
}

///|
let sub_subsumes_unused_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_SUBSUMES_UNUSED")

///|
/// `SUB_SUBSUMES_UNUSED`
pub fn sub_subsumes_unused() -> @kernel.Thm {
  sub_subsumes_unused_c.get()
}

///|
/// break
fn step_68() -> Unit raise {
  let t1476 = @parser.parse_term("(break_ init 0 = LENGTH(SND(given 0 init))) /\\\n   (break_ init (SUC n) =\n        break_ init n + LENGTH(SND(given (break_ init n) init)))")
  break__c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t1476))
}

///|
let break__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("break")

///|
/// `break`
pub fn break_() -> @kernel.Thm {
  break__c.get()
}

///|
/// level
fn step_69() -> Unit raise {
  level_c.set(@pair.new_definition(@term_syntax.parse_term("(level : ((List[(Form) -> Bool], List[(Form) -> Bool]), Num, (Form) -> Bool) -> Bool)((init : (List[(Form) -> Bool], List[(Form) -> Bool])), (n : Num)) == Sub(init, break_(init, n))")))
}

///|
let level_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("level")

///|
/// `level`
pub fn level() -> @kernel.Thm {
  level_c.get()
}

///|
/// LEVEL_0
fn step_70() -> Unit raise {
  let t1491 = @simp.rewrite_tac(@list.List([unused_def(), given(), level(), sub_def(), break_()]))
  let t1490 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), sub_def(), @sets.union_empty()]))
  let t1486 = @term_syntax.parse_term("0")
  let t1489 = @tactics.disch_then(fn(x1488 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1483 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1484 = @tactics.mp_tac(x1483)
      fn(x1485 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1484(x1485)
      }
    })(((x1487 : @kernel.Thm) => @bool.spec(t1486, x1487))(x1488))
  })
  let t1480 = @drule.match_mp(sub_subsumes_unused())
  let t1482 = @tactics.first_assum(fn(x1481 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1477 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1478 = @tactics.mp_tac(x1477)
      fn(x1479 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1478(x1479)
      }
    })(t1480(x1481))
  })
  let t1492 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1482), t1489), t1490), t1491)
  level_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], (∀ c : (Form) -> Bool, MEM(c, used) → clause(c)) && (∀ c : (Form) -> Bool, MEM(c, unused) → clause(c)) → SUBSUMES(level((used, unused), 0), set_of_list(unused))"), t1492))
}

///|
let level_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEVEL_0")

///|
/// `LEVEL_0`
pub fn level_0() -> @kernel.Thm {
  level_0_c.get()
}

///|
/// LEVEL_STEP
fn step_71() -> Unit raise {
  let t1500 = @simp.asm_simp_tac(@list.List([sub_subsumes_unused()]))
  let t1499 = @simp.rewrite_tac(@list.List([break_()]))
  let t1497 = @meson.asm_meson_tac(@list.List([given_invariant()]))
  let t1498 = @list.List([@meson.asm_meson_tac(@list.List([given_invariant()])), @tactics.all_tac, t1497])
  let t1496 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1495 = @simp.rewrite_tac(@list.List([level()]))
  let t1494 = @tactics.exists_tac(@term_syntax.parse_term("UNION(Sub(((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])), break_((used, unused), (n : Num))), Unused((used, unused), break_((used, unused), n)))"))
  let t1493 = @tactics.match_mp_tac(subsumes_trans_v1())
  let t1501 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1493), t1494), t1495), t1496), t1498), t1499), t1500)
  level_step_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], (∀ c : (Form) -> Bool, MEM(c, used) → clause(c)) && (∀ c : (Form) -> Bool, MEM(c, unused) → clause(c)) → (∀ n : Num, SUBSUMES(level((used, unused), SUC(n)), allntresolvents(level((used, unused), n), UNION(set_of_list(used), level((used, unused), n)))))"), t1501))
}

///|
let level_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEVEL_STEP")

///|
/// `LEVEL_STEP`
pub fn level_step() -> @kernel.Thm {
  level_step_c.get()
}

///|
/// level_CLAUSE
fn step_72() -> Unit raise {
  let t1502 = @meson.meson_tac(@list.List([given_invariant()]))
  let t1503 = @tactics.then_tac(@simp.rewrite_tac(@list.List([level()])), t1502)
  level_clause_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], (∀ c : (Form) -> Bool, MEM(c, used) → clause(c)) && (∀ c : (Form) -> Bool, MEM(c, unused) → clause(c)) → (∀ n : Num, ∀ c : (Form) -> Bool, IN(c, level((used, unused), n)) → clause(c))"), t1503))
}

///|
let level_clause_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("level_CLAUSE")

///|
/// `level_CLAUSE`
pub fn level_clause() -> @kernel.Thm {
  level_clause_c.get()
}

///|
/// BREAK_MONO
fn step_73() -> Unit raise {
  let t1507 = @meson.asm_meson_tac(@list.List([@arith.le_trans(), @arith.le_add()]))
  let t1506 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), break_(), @arith.le_refl()]))
  let t1508 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ init : (List[(Form) -> Bool], List[(Form) -> Bool]), ∀ m : Num, ∀ d : Num, break_(init, m) <= break_(init, m + d)"), fn(x1504 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1504
    @meson.meson_tac(@list.List([th, @arith.le_exists()]))
  }), @tactics.gen_tac), @tactics.gen_tac), @nums.induct_tac), t1506), t1507)
  break_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ init : (List[(Form) -> Bool], List[(Form) -> Bool]), ∀ m : Num, ∀ n : Num, m <= n → break_(init, m) <= break_(init, n)"), t1508))
}

///|
let break_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BREAK_MONO")

///|
/// `BREAK_MONO`
pub fn break_mono() -> @kernel.Thm {
  break_mono_c.get()
}

///|
/// level_MONO_SUBSET
fn step_74() -> Unit raise {
  let t1509 = @meson.meson_tac(@list.List([sub_mono_subset(), break_mono()]))
  let t1510 = @tactics.then_tac(@simp.rewrite_tac(@list.List([level()])), t1509)
  level_mono_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], (∀ c : (Form) -> Bool, MEM(c, used) → clause(c)) && (∀ c : (Form) -> Bool, MEM(c, unused) → clause(c)) → (∀ m : Num, ∀ n : Num, m <= n → SUBSET(level((used, unused), m), level((used, unused), n)))"), t1510))
}

///|
let level_mono_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("level_MONO_SUBSET")

///|
/// `level_MONO_SUBSET`
pub fn level_mono_subset() -> @kernel.Thm {
  level_mono_subset_c.get()
}

///|
/// level_MONO
fn step_75() -> Unit raise {
  let t1511 = @meson.meson_tac(@list.List([sub_mono(), break_mono()]))
  let t1512 = @tactics.then_tac(@simp.rewrite_tac(@list.List([level()])), t1511)
  level_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], (∀ c : (Form) -> Bool, MEM(c, used) → clause(c)) && (∀ c : (Form) -> Bool, MEM(c, unused) → clause(c)) → (∀ m : Num, ∀ n : Num, m <= n → SUBSUMES(level((used, unused), n), level((used, unused), m)))"), t1512))
}

///|
let level_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("level_MONO")

///|
/// `level_MONO`
pub fn level_mono() -> @kernel.Thm {
  level_mono_c.get()
}

///|
/// IMAGE_CLAUSE_EQ
fn step_76() -> Unit raise {
  let t1513 = @meson.meson_tac(@list.List([@resolution.qfree_literal()]))
  let t1514 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@resolution.clause(), @sets.extension(), @sets.in_image()])), t1513)
  image_clause_eq_c.set(@tactics.prove(@term_syntax.parse_term("clause((p : (Form) -> Bool)) && (∀ q : Form, qfree(q) → (f : (Form) -> _)(q) == (g : (Form) -> _)(q)) → IMAGE(f, p) == IMAGE(g, p)"), t1514))
}

///|
let image_clause_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMAGE_CLAUSE_EQ")

///|
/// `IMAGE_CLAUSE_EQ`
pub fn image_clause_eq() -> @kernel.Thm {
  image_clause_eq_c.get()
}

///|
/// FORMSUBST_TERMSUBST_EQ
fn step_77() -> Unit raise {
  let t1527 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm(), @lists.all_t()]))
  let t1526 = @tactics.match_mp_tac(@lists.map_eq())
  let t1525 = @simp.rewrite_tac(@list.List([@fol.form_inj(), @equal.gsym(@lists.map_o())]))
  let t1524 = @simp.simp_tac(@list.List([@fol.formsubst()]))
  let t1523 = @simp.rewrite_tac(@list.List([@prenex.qfree()]))
  let t1528 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.form_induction()), t1523), t1524), t1525), @tactics.gen_tac), t1526), t1527)
  let t1522 = @simp.rewrite_tac(@list.List([@prenex.qfree(), @fol.formsubst(), @lists.map(), @fol.form_inj(), @lists.cons_11()]))
  let t1518 = @term_syntax.parse_term("Atom((p : Num), [(t : Term)])")
  let t1521 = @tactics.first_x_assum(fn(x1520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1515 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1516 = @tactics.mp_tac(x1515)
      fn(x1517 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1516(x1517)
      }
    })(((x1519 : @kernel.Thm) => @bool.spec(t1518, x1519))(x1520))
  })
  let t1529 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t : Term)")), t1521), t1522), t1528])
  let t1530 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm()])), @tactics.eq_tac), @tactics.disch_tac), t1529)
  formsubst_termsubst_eq_c.set(@tactics.prove(@term_syntax.parse_term("(∀ p : Form, qfree(p) → formsubst((i : (Num) -> Term), p) == formsubst((j : (Num) -> Term), p)) == (termsubst(i) == termsubst(j))"), t1530))
}

///|
let formsubst_termsubst_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_TERMSUBST_EQ")

///|
/// `FORMSUBST_TERMSUBST_EQ`
pub fn formsubst_termsubst_eq() -> @kernel.Thm {
  formsubst_termsubst_eq_c.get()
}

///|
/// ISARESOLVENT_SUBSUME_L
fn step_78() -> Unit raise {
  let t1531 = @sets.set_tac(@list.List([]))
  let lemma = @tactics.prove(@term_syntax.parse_term("SUBSET((a : (_) -> Bool), (a' : (_) -> Bool)) && SUBSET((b : (_) -> Bool), (b' : (_) -> Bool)) → SUBSET(UNION(a, b), UNION(a', b'))"), t1531)
  let t1986 = @simp.rewrite_tac(@list.List([@fol.termsubst_triv()]))
  let t1985 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@fol.termsubst_termsubst()), @class.fun_eq_thm()]))
  let t1984 = @simp.once_rewrite_tac(@list.List([formsubst_termsubst_eq()]))
  let t1983 = @simp.simp_tac(@list.List([formsubst_formsubst()]))
  let t1981 = @term_syntax.parse_term("(w : Form)")
  let t1982 = @tactics.spec_tac(@term_syntax.parse_term("(w : Form)"), t1981)
  let t1980 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.clause(), @resolution.qfree_literal()])), @tactics.all_tac])
  let t1979 = @tactics.subgoal_then(@term_syntax.parse_term("qfree((w : Form))"), fn(x1976 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1977 = @tactics.mp_tac(x1976)
    fn(x1978 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1977(x1978)
    }
  })
  let t1975 = @simp.gen_rewrite_tac(fn(x1972 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1973 = @equal.land_conv(x1972)
    fn(x1974 : @kernel.Term) -> @kernel.Thm raise {
      s1973(x1974)
    }
  }, @list.List([@equal.gsym(@fol.formsubst_triv())]))
  let t1971 = @simp.asm_rewrite_tac(@list.List([]))
  let t1970 = @tactics.exists_tac(@term_syntax.parse_term("formsubst((ri : (Num) -> Term), (w : Form))"))
  let t1969 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1968 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) && ((c : Bool) → (a : Bool)) → !a → b && !c")))
  let t1967 = @simp.rewrite_tac(@list.List([@fol.formsubst_triv()]))
  let t1965 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@fol.termsubst_termsubst()), @class.fun_eq_thm(), @fol.termsubst_triv()]))
  let t1964 = @simp.once_rewrite_tac(@list.List([formsubst_termsubst_eq()]))
  let t1963 = @simp.simp_tac(@list.List([formsubst_formsubst()]))
  let t1961 = @term_syntax.parse_term("(w : Form)")
  let t1962 = @tactics.spec_tac(@term_syntax.parse_term("(w : Form)"), t1961)
  let t1960 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.clause(), @resolution.qfree_literal()])), @tactics.all_tac])
  let t1966 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("qfree((w : Form))"), fn(x1957 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1958 = @tactics.mp_tac(x1957)
    fn(x1959 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1958(x1959)
    }
  }), t1960), t1962), t1963), t1964), t1965), @tactics.all_tac])
  let t1956 = @tactics.subgoal_then(@term_syntax.parse_term("formsubst((si' : (Num) -> Term), formsubst((si : (Num) -> Term), (w : Form))) == formsubst(V, w)"), fn(x1953 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1954 = @tactics.subst1_tac(x1953)
    fn(x1955 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1954(x1955)
    }
  })
  let t1951 = @tactics.conjuncts_then2(fn(x1945 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1946 = @tactics.subst1_tac(x1945)
    fn(x1947 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1946(x1947)
    }
  }, fn(x1948 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1949 = @tactics.assume_tac(x1948)
    fn(x1950 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1949(x1950)
    }
  })
  let t1952 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(w : Form)"))(t1951))
  let t1944 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t1943 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1937 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1938 = @tactics.subst1_tac(x1937)
    fn(x1939 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1938(x1939)
    }
  }, fn(x1940 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1941 = @tactics.mp_tac(x1940)
    fn(x1942 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1941(x1942)
    }
  }))
  let t1936 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(v : Form)"))(fn(x1933 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1934 = @tactics.mp_tac(x1933)
    fn(x1935 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1934(x1935)
    }
  }))
  let t1932 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Form)"))
  let t1931 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image(), @sets.in_diff(), @trivia.o_thm()]))
  let t1930 = @tactics.map_every(@fol.expand_tac, @list.List(["q''", "q1''", "q'"]))
  let t1929 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o())]))
  let t1928 = @tactics.match_mp_tac(@sets.image_subset())
  let t1927 = @simp.rewrite_tac(@list.List([@sets.image_o()]))
  let t1925 = @meson.asm_meson_tac(@list.List([@sets.in_diff(), @resolution.image_formsubst_clause(), @resolution.clause(), @resolution.qfree_literal()]))
  let t1923 = @simp.rewrite_tac(@list.List([termsubst_termsubst_o()]))
  let t1922 = @simp.rewrite_tac(@list.List([@equal.gsym(termsubst_termsubst_o())]))
  let t1921 = @simp.rewrite_tac(@list.List([@trivia.o_assoc()]))
  let t1920 = @simp.once_rewrite_tac(@list.List([formsubst_termsubst_eq()]))
  let t1924 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@trivia.o_thm(), formsubst_formsubst()])), t1920), t1921), t1922), t1923), @tactics.all_tac])
  let t1919 = @tactics.subgoal_then(@term_syntax.parse_term("(∀ q : Form, qfree(q) → formsubst(o(termsubst((i : (Num) -> Term)), o(termsubst((ri : (Num) -> Term)), (si' : (Num) -> Term))), q) == o(formsubst(i), o(formsubst(ri), formsubst(si')), q)) && (∀ q : Form, IN(q, DIFF((q'' : (Form) -> Bool), (q1'' : (Form) -> Bool))) → qfree(q))"), fn(x1917 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_9 = x1917
    @meson.meson_tac(@list.List([th_9]))
  })
  let t1926 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image()])), t1919), @tactics.conj_tac), t1924), t1925), @tactics.all_tac])
  let t1916 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE(formsubst(o(termsubst((i : (Num) -> Term)), o(termsubst((ri : (Num) -> Term)), (si' : (Num) -> Term)))), DIFF((q'' : (Form) -> Bool), (q1'' : (Form) -> Bool))) == IMAGE(o(formsubst(i), o(formsubst(ri), formsubst(si'))), DIFF(q'', q1''))"), fn(x1913 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1914 = @tactics.subst1_tac(x1913)
    fn(x1915 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1914(x1915)
    }
  })
  let t1911 = @meson.asm_meson_tac(@list.List([]))
  let t1910 = @simp.rewrite_tac(@list.List([@resolution.fvs(), @sets.in_unions(), @sets.in_elim_thm()]))
  let t1909 = @tactics.subgoal_then(@term_syntax.parse_term("IN((z : Num), FVS((q'' : (Form) -> Bool)))"), fn(x1907 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_8 = x1907
    @simp.rewrite_tac(@list.List([th_8, @trivia.o_thm()]))
  })
  let t1906 = @fol.expand_tac("i'")
  let t1905 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t1904 = @tactics.match_mp_tac(@fol.formsubst_valuation())
  let t1903 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Form)"))
  let t1912 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ x : Form, IN(x, (q'' : (Form) -> Bool)) → formsubst((i' : (Num) -> Term), x) == formsubst(o(termsubst((i : (Num) -> Term)), o(termsubst((ri : (Num) -> Term)), (si' : (Num) -> Term))), x)"), fn(x1900 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_7 = x1900
    let t1902 = @meson.meson_tac(@list.List([th_7]))
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_diff()])), t1902)
  }), t1903), @tactics.disch_tac), t1904), t1905), @tactics.disch_tac), t1906), t1909), t1910), t1911), @tactics.all_tac])
  let t1899 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE(formsubst((i' : (Num) -> Term)), DIFF((q'' : (Form) -> Bool), (q1'' : (Form) -> Bool))) == IMAGE(formsubst(o(termsubst((i : (Num) -> Term)), o(termsubst((ri : (Num) -> Term)), (si' : (Num) -> Term)))), DIFF(q'', q1''))"), fn(x1896 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1897 = @tactics.subst1_tac(x1896)
    fn(x1898 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1897(x1898)
    }
  })
  let t1894 = @meson.meson_tac(@list.List([]))
  let t1893 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image(), @sets.in_diff(), @sets.in_elim_thm(), @trivia.o_thm()]))
  let t1892 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(IMAGE(formsubst((j : (Num) -> Term)), (p' : (Form) -> Bool)), (p : (Form) -> Bool))"))
  let t1891 = @fol.expand_tac("p1'")
  let t1889 = @meson.asm_meson_tac(@list.List([formsubst_formsubst(), @resolution.clause(), @resolution.qfree_literal()]))
  let t1890 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_diff(), @trivia.o_thm()])), t1889), @tactics.all_tac])
  let t1888 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE(formsubst(o(termsubst((i : (Num) -> Term)), (j : (Num) -> Term))), DIFF((p' : (Form) -> Bool), (p1' : (Form) -> Bool))) == IMAGE(o(formsubst(i), formsubst(j)), DIFF(p', p1'))"), fn(x1885 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1886 = @tactics.subst1_tac(x1885)
    fn(x1887 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1886(x1887)
    }
  })
  let t1883 = @meson.asm_meson_tac(@list.List([]))
  let t1882 = @simp.rewrite_tac(@list.List([@resolution.fvs(), @sets.in_unions(), @sets.in_elim_thm()]))
  let t1881 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) → !((a : Bool) && b) → !a")))
  let t1877 = @term_syntax.parse_term("(z : Num)")
  let t1880 = @tactics.disch_then(fn(x1879 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1874 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1875 = @tactics.mp_tac(x1874)
      fn(x1876 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1875(x1876)
      }
    })(((x1878 : @kernel.Thm) => @bool.spec(t1877, x1878))(x1879))
  })
  let t1873 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty()]))
  let t1872 = @tactics.undisch_tac(@term_syntax.parse_term("INTER(FVS((q'' : (Form) -> Bool)), FVS((p' : (Form) -> Bool))) == {}"))
  let t1871 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((z : Num), FVS((q'' : (Form) -> Bool)))"), fn(x1869 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_6 = x1869
    @simp.rewrite_tac(@list.List([th_6, @trivia.o_thm()]))
  })
  let t1868 = @fol.expand_tac("i'")
  let t1867 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t1866 = @tactics.match_mp_tac(@fol.formsubst_valuation())
  let t1865 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Form)"))
  let t1884 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ x : Form, IN(x, (p' : (Form) -> Bool)) → formsubst((i' : (Num) -> Term), x) == formsubst(o(termsubst((i : (Num) -> Term)), (j : (Num) -> Term)), x)"), fn(x1862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x1862
    let t1864 = @meson.meson_tac(@list.List([th_5]))
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_diff()])), t1864)
  }), t1865), @tactics.disch_tac), t1866), t1867), @tactics.disch_tac), t1868), t1871), t1872), t1873), t1880), t1881), t1882), t1883), @tactics.all_tac])
  let t1895 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IMAGE(formsubst((i' : (Num) -> Term)), DIFF((p' : (Form) -> Bool), (p1' : (Form) -> Bool))) == IMAGE(formsubst(o(termsubst((i : (Num) -> Term)), (j : (Num) -> Term))), DIFF(p', p1'))"), fn(x1859 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1860 = @tactics.subst1_tac(x1859)
    fn(x1861 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1860(x1861)
    }
  }), t1884), t1888), t1890), t1891), t1892), t1893), t1894), @tactics.all_tac])
  let t1858 = @tactics.match_mp_tac(lemma)
  let t1857 = @simp.rewrite_tac(@list.List([@sets.image_union()]))
  let t1855 = @meson.asm_meson_tac(@list.List([@resolution.image_formsubst_clause(), @resolution.clause(), @resolution.qfree_literal()]))
  let t1854 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_union()]))
  let t1853 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Form, IN(x, UNION(DIFF((p' : (Form) -> Bool), (p1' : (Form) -> Bool)), DIFF((q'' : (Form) -> Bool), (q1'' : (Form) -> Bool)))) → qfree(x)"), fn(x1850 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x1850
    let t1852 = @meson.meson_tac(@list.List([th_4]))
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image(), @trivia.o_thm()])), t1852)
  })
  let t1849 = @simp.asm_rewrite_tac(@list.List([]))
  let t1846 = @term_syntax.parse_term("(i' : (Num) -> Term)")
  let t1856 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1848 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1844 = @tactics.mp_tac(x1843)
      fn(x1845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1844(x1845)
      }
    })(((x1847 : @kernel.Thm) => @bool.spec(t1846, x1847))(x1848))
  }), t1849), t1853), t1854), t1855), @tactics.all_tac])
  let t1842 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE(formsubst((i' : (Num) -> Term)), UNION(DIFF((p' : (Form) -> Bool), (p1' : (Form) -> Bool)), DIFF((q'' : (Form) -> Bool), (q1'' : (Form) -> Bool))))"))
  let t1841 = @tactics.match_mp_tac(@sets.subset_trans())
  let t1840 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o())]))
  let t1839 = @tactics.exists_tac(@term_syntax.parse_term("(i' : (Num) -> Term)"))
  let t1838 = @fol.expand_tac("r")
  let t1833 = @simp.asm_rewrite_tac(@list.List([]))
  let t1834 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(i' : (Num) -> Term)")), t1833)
  let t1832 = @meson.meson_tac(@list.List([]))
  let t1831 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @sets.in_image()]))
  let t1830 = @tactics.undisch_tac(@term_syntax.parse_term("!((q1' : (Form) -> Bool) == {})"))
  let t1835 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@fol.expand_tac("q1''"), t1830), t1831), t1832)
  let t1829 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @sets.subset()]))
  let t1836 = @list.List([@tactics.then_tac(@fol.expand_tac("p1'"), t1829), t1835, t1834])
  let t1828 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1827 = @simp.rewrite_tac(@list.List([]))
  let t1826 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t1825 = @simp.asm_rewrite_tac(@list.List([]))
  let t1823 = @term_syntax.parse_term("(q1'' : (Form) -> Bool)")
  let t1824 = @tactics.map_every(fn(x1820 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1821 = @tactics.exists_tac(x1820)
    fn(x1822 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1821(x1822)
    }
  }, @list.List([@term_syntax.parse_term("(p1' : (Form) -> Bool)"), t1823]))
  let t1819 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t1837 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@resolution.isaresolvent()])), t1819), t1824), t1825), t1826), t1827), t1828), t1836), @tactics.all_tac])
  let t1818 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE(formsubst((k : (Num) -> Term)), UNION(DIFF((p' : (Form) -> Bool), (p1' : (Form) -> Bool)), DIFF((q'' : (Form) -> Bool), (q1'' : (Form) -> Bool))))"))
  let t1817 = @simp.abbrev_tac(@term_syntax.parse_term("(k : (Num) -> Term) == mgu(UNION((p1' : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, (q1'' : (Form) -> Bool))}))"))
  let t1815 = @meson.asm_meson_tac(@list.List([@resolution.clause(), @sets.subset(), @resolution.qfree_literal(), @resolution.image_formsubst_clause()]))
  let t1814 = @simp.asm_rewrite_tac(@list.List([@resolution.qfree_negate()]))
  let t1813 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1812 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_image(), @sets.in_elim_thm()]))
  let t1811 = @fol.expand_tac("p1'")
  let t1809 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t1808 = @fol.expand_tac("p1'")
  let t1807 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((p1' : (Form) -> Bool), (p' : (Form) -> Bool))"), fn(x1805 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x1805
    @meson.asm_meson_tac(@list.List([th_3, @sets.finite_subset(), @resolution.clause(), @resolution.qfree_literal()]))
  })
  let t1810 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@sets.finite_subset(), @resolution.clause(), @resolution.image_formsubst_clause(), @sets.image_o(), @sets.finite_image()]))])), t1807), t1808), t1809), @tactics.all_tac])
  let t1803 = @meson.meson_tac(@list.List([]))
  let t1804 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm()])), t1803), @tactics.all_tac])
  let t1802 = @tactics.subgoal_then(@term_syntax.parse_term("{op_tilde_tilde((p : Form)) | IN(p, (q1'' : (Form) -> Bool))} == IMAGE(op_tilde_tilde, q1'')"), fn(x1799 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1800 = @tactics.subst1_tac(x1799)
    fn(x1801 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1800(x1801)
    }
  })
  let t1798 = @simp.asm_rewrite_tac(@list.List([@sets.finite_union()]))
  let t1796 = @simp.asm_rewrite_tac(@list.List([]))
  let t1797 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(i' : (Num) -> Term)")), t1796)])
  let t1816 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.conj_assoc()])), @tactics.conj_tac), t1797), t1798), t1802), t1804), @tactics.conj_tac), t1810), t1811), t1812), t1813), t1814), t1815), @tactics.all_tac])
  let t1795 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("UNION((p1' : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, (q1'' : (Form) -> Bool))})"), @unif.mgu_v1()))
  let t1793 = @simp.asm_rewrite_tac(@list.List([@class.fun_eq_thm(), @equal.gsym(@fol.termsubst_termsubst()), @fol.termsubst_triv()]))
  let t1792 = @simp.once_rewrite_tac(@list.List([formsubst_termsubst_eq()]))
  let t1791 = @simp.simp_tac(@list.List([formsubst_formsubst()]))
  let t1789 = @term_syntax.parse_term("(x : Form)")
  let t1790 = @tactics.spec_tac(@term_syntax.parse_term("(x : Form)"), t1789)
  let t1788 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.clause(), @resolution.qfree_literal()])), @tactics.all_tac])
  let t1787 = @tactics.subgoal_then(@term_syntax.parse_term("qfree((x : Form))"), fn(x1784 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1785 = @tactics.mp_tac(x1784)
    fn(x1786 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1785(x1786)
    }
  })
  let t1783 = @tactics.subgoal_then(@term_syntax.parse_term("formsubst((ri' : (Num) -> Term), formsubst((ri : (Num) -> Term), (x : Form))) == formsubst(V, x)"), fn(x1781 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1781
    @simp.asm_rewrite_tac(@list.List([th_2, @fol.formsubst_triv()]))
  })
  let t1780 = @simp.asm_rewrite_tac(@list.List([]))
  let t1779 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Form)"))(@tactics.strip_assume_tac))
  let t1778 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t1777 = @fol.expand_tac("q'")
  let t1776 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset()])), @tactics.all_tac])
  let t1775 = @tactics.subgoal_then(@term_syntax.parse_term("IN((u : Form), (q' : (Form) -> Bool))"), fn(x1772 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1773 = @tactics.mp_tac(x1772)
    fn(x1774 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1773(x1774)
    }
  })
  let t1771 = @simp.rewrite_tac(@list.List([]))
  let t1770 = @tactics.exists_tac(@term_syntax.parse_term("formsubst((ri' : (Num) -> Term), (u : Form))"))
  let t1769 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t1768 = @fol.expand_tac("q''")
  let t1766 = @meson.asm_meson_tac(@list.List([]))
  let t1767 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@resolution.fvs(), @sets.in_unions(), @sets.in_elim_thm()])), t1766)])
  let t1765 = @tactics.subgoal_then(@term_syntax.parse_term("IN(formsubst((si : (Num) -> Term), formsubst((ri' : (Num) -> Term), (u : Form))), (q'' : (Form) -> Bool))"), fn(x1762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1763 = @tactics.mp_tac(x1762)
    fn(x1764 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1763(x1764)
    }
  })
  let t1761 = @tactics.subgoal_then(@term_syntax.parse_term("IN((z : Num), FVS((q'' : (Form) -> Bool)))"), fn(x1759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1759
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t1758 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t1757 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t1756 = @tactics.match_mp_tac(@fol.formsubst_valuation())
  let t1754 = @simp.asm_rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm()]))
  let t1753 = @simp.rewrite_tac(@list.List([termsubst_termsubst_o()]))
  let t1752 = @simp.rewrite_tac(@list.List([@equal.gsym(termsubst_termsubst_o())]))
  let t1751 = @simp.rewrite_tac(@list.List([@trivia.o_assoc()]))
  let t1750 = @simp.once_rewrite_tac(@list.List([formsubst_termsubst_eq()]))
  let t1748 = @term_syntax.parse_term("(u : Form)")
  let t1749 = @tactics.spec_tac(@term_syntax.parse_term("(u : Form)"), t1748)
  let t1747 = @tactics.undisch_tac(@term_syntax.parse_term("qfree((u : Form))"))
  let t1755 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([formsubst_formsubst()])), t1747), t1749), t1750), t1751), t1752), t1753), t1754)])
  let t1746 = @tactics.exists_tac(@term_syntax.parse_term("formsubst(o(termsubst((i : (Num) -> Term)), o(termsubst((ri : (Num) -> Term)), (si' : (Num) -> Term))), formsubst((si : (Num) -> Term), formsubst((ri' : (Num) -> Term), (u : Form))))"))
  let t1745 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1744 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset(), @resolution.clause(), @resolution.image_formsubst_clause(), @resolution.qfree_literal()])), @tactics.all_tac])
  let t1743 = @tactics.subgoal_then(@term_syntax.parse_term("qfree((u : Form))"), fn(x1740 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1741 = @tactics.assume_tac(x1740)
    fn(x1742 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1741(x1742)
    }
  })
  let t1739 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t1738 = @simp.rewrite_tac(@list.List([@resolution.formsubst_negate()]))
  let t1736 = @meson.asm_meson_tac(@list.List([]))
  let t1735 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1737 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t1735), t1736), @tactics.all_tac])
  let t1734 = @tactics.subgoal_then(@term_syntax.parse_term("formsubst((i : (Num) -> Term), op_tilde_tilde((u : Form))) == (P : Form)"), fn(x1733 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1730 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1731 = @tactics.subst1_tac(x1730)
      fn(x1732 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1731(x1732)
      }
    })(@equal.sym(x1733))
  })
  let t1729 = @simp.rewrite_tac(@list.List([@resolution.formsubst_negate()]))
  let t1728 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1723 = @tactics.subst_all_tac(x1722)
    fn(x1724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1723(x1724)
    }
  }, fn(x1725 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1726 = @tactics.mp_tac(x1725)
    fn(x1727 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1726(x1727)
    }
  }))
  let t1721 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Form)"))
  let t1720 = @simp.rewrite_tac(@list.List([@sets.in_image(), @theorems.left_imp_exists_thm()]))
  let t1719 = @fol.expand_tac("q1''")
  let t1718 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1712 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1713 = @tactics.mp_tac(x1712)
    fn(x1714 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1713(x1714)
    }
  }, fn(x1715 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1716 = @tactics.subst_all_tac(x1715)
    fn(x1717 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1716(x1717)
    }
  }))
  let t1711 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Form)"))
  let t1710 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @theorems.left_imp_exists_thm()]))
  let t1709 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Form)"))
  let t1707 = @meson.asm_meson_tac(@list.List([]))
  let t1706 = @simp.rewrite_tac(@list.List([@resolution.fvs(), @sets.in_unions(), @sets.in_elim_thm()]))
  let t1705 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) → !((a : Bool) && b) → !a")))
  let t1701 = @term_syntax.parse_term("(z : Num)")
  let t1704 = @tactics.disch_then(fn(x1703 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1698 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1699 = @tactics.mp_tac(x1698)
      fn(x1700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1699(x1700)
      }
    })(((x1702 : @kernel.Thm) => @bool.spec(t1701, x1702))(x1703))
  })
  let t1697 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty()]))
  let t1696 = @tactics.undisch_tac(@term_syntax.parse_term("INTER(FVS((q'' : (Form) -> Bool)), FVS((p' : (Form) -> Bool))) == {}"))
  let t1695 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((z : Num), FVS((q'' : (Form) -> Bool)))"), fn(x1693 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1693
    @simp.rewrite_tac(@list.List([th, @trivia.o_thm()]))
  })
  let t1692 = @simp.rewrite_tac(@list.List([]))
  let t1691 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t1690 = @tactics.match_mp_tac(@fol.formsubst_valuation())
  let t1688 = @simp.asm_simp_tac(@list.List([]))
  let t1687 = @simp.simp_tac(@list.List([@equal.gsym(formsubst_formsubst())]))
  let t1686 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.clause(), @resolution.qfree_literal()])), @tactics.all_tac])
  let t1689 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("qfree((x : Form))"), fn(x1683 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1684 = @tactics.mp_tac(x1683)
    fn(x1685 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1684(x1685)
    }
  }), t1686), t1687), t1688)])
  let t1682 = @tactics.exists_tac(@term_syntax.parse_term("formsubst(o(termsubst((i : (Num) -> Term)), (j : (Num) -> Term)), (x : Form))"))
  let t1681 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1680 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1679 = @fol.expand_tac("p1'")
  let t1708 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Form)")), t1679), t1680), @tactics.strip_tac), t1681), t1682), @tactics.conj_tac), t1689), t1690), t1691), @tactics.disch_tac), t1692), t1695), t1696), t1697), t1704), t1705), t1706), t1707), @tactics.all_tac])
  let t1678 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (a' : Bool)) && ((b : Bool) → (b' : Bool)) → a && b → a' && b'")))
  let t1677 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t1676 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t1675 = @simp.rewrite_tac(@list.List([@sets.in_union()]))
  let t1674 = @tactics.x_gen_tac(@term_syntax.parse_term("(P : Form)"))
  let t1673 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1672 = @simp.asm_rewrite_tac(@list.List([@unif.unifies_v1()]))
  let t1671 = @tactics.disch_then(fn(x1670 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1667 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1668 = @tactics.mp_tac(x1667)
      fn(x1669 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1668(x1669)
      }
    })(@bool.conjunct1(x1670))
  })
  let t1663 = @meson.asm_meson_tac(@list.List([@resolution.clause(), @sets.subset(), @resolution.qfree_literal(), @resolution.image_formsubst_clause()]))
  let t1662 = @simp.asm_rewrite_tac(@list.List([@resolution.qfree_negate()]))
  let t1661 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1664 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_image()])), t1661), t1662), t1663)
  let t1665 = @list.List([@meson.asm_meson_tac(@list.List([@sets.finite_subset(), @resolution.clause(), @resolution.image_formsubst_clause(), @sets.finite_image()])), t1664])
  let t1659 = @meson.meson_tac(@list.List([]))
  let t1660 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm()])), t1659), @tactics.all_tac])
  let t1658 = @tactics.subgoal_then(@term_syntax.parse_term("{op_tilde_tilde((p : Form)) | IN(p, (q1' : (Form) -> Bool))} == IMAGE(op_tilde_tilde, q1')"), fn(x1655 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1656 = @tactics.subst1_tac(x1655)
    fn(x1657 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1656(x1657)
    }
  })
  let t1666 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.finite_union()])), t1658), t1660), @tactics.conj_tac), t1665), @tactics.all_tac])
  let t1654 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("UNION((p1 : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, (q1' : (Form) -> Bool))})"), @unif.mgu_v1()))
  let t1794 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("((x : Num) => if IN(x, FVS((q'' : (Form) -> Bool))) { termsubst((i : (Num) -> Term), termsubst((ri : (Num) -> Term), (si' : (Num) -> Term)(x))) } else { termsubst(i, (j : (Num) -> Term)(x)) }) == (i' : (Num) -> Term)"), fn(x1653 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1650 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1651 = @tactics.subst_all_tac(x1650)
      fn(x1652 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1651(x1652)
      }
    })(@equal.sym(x1653))
  }), t1654), @tactics.ants_tac), t1666), t1671), t1672), t1673), t1674), t1675), t1676), t1677), t1678), @tactics.conj_tac), @tactics.disch_tac), t1708), t1709), t1710), t1711), t1718), t1719), t1720), t1721), t1728), @tactics.disch_tac), t1729), t1734), t1737), t1738), @tactics.ap_term_tac), t1739), t1743), t1744), t1745), t1746), @tactics.conj_tac), t1755), t1756), t1757), @tactics.disch_tac), t1758), t1761), t1765), t1767), t1768), t1769), t1770), t1771), t1775), t1776), t1777), t1778), t1779), t1780), t1783), t1787), t1788), t1790), t1791), t1792), t1793), @tactics.all_tac])
  let t1649 = @tactics.subgoal_then(@term_syntax.parse_term("Unifies((i' : (Num) -> Term), UNION((p1' : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, (q1'' : (Form) -> Bool))}))"), fn(x1646 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1647 = @tactics.assume_tac(x1646)
    fn(x1648 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1647(x1648)
    }
  })
  let t1645 = @simp.abbrev_tac(@term_syntax.parse_term("(i' : (Num) -> Term) == ((x : Num) => if IN(x, FVS((q'' : (Form) -> Bool))) { termsubst((i : (Num) -> Term), termsubst((ri : (Num) -> Term), (si' : (Num) -> Term)(x))) } else { termsubst(i, (j : (Num) -> Term)(x)) })"))
  let t1643 = @simp.asm_rewrite_tac(@list.List([]))
  let t1642 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @equal.gsym(@fol.termsubst_termsubst())]))
  let t1641 = @simp.rewrite_tac(@list.List([formsubst_termsubst_eq()]))
  let t1640 = @simp.simp_tac(@list.List([@trivia.o_thm(), formsubst_formsubst()]))
  let t1639 = @simp.asm_rewrite_tac(@list.List([]))
  let t1638 = @tactics.match_mp_tac(image_clause_eq())
  let t1637 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o())]))
  let t1636 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1633 = @drule.match_mp(@sets.image_subset())
  let t1630 = @term_syntax.parse_term("o(formsubst((si : (Num) -> Term)), formsubst((ri' : (Num) -> Term)))")
  let t1635 = @tactics.disch_then(fn(x1634 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1632 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1627 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1628 = @tactics.mp_tac(x1627)
        fn(x1629 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1628(x1629)
        }
      })(((x1631 : @kernel.Thm) => @bool.ispec(t1630, x1631))(x1632))
    })(t1633(x1634))
  })
  let t1626 = @fol.expand_tac("q'")
  let t1625 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET((q1' : (Form) -> Bool), (q' : (Form) -> Bool))"))
  let t1644 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@fol.expand_tac, @list.List(["q''", "q1''"])), t1625), t1626), t1635), t1636), @tactics.ap_term_tac), t1637), t1638), t1639), t1640), t1641), t1642), t1643), @tactics.all_tac])
  let t1624 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((q1'' : (Form) -> Bool), (q'' : (Form) -> Bool))"), fn(x1621 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1622 = @tactics.assume_tac(x1621)
    fn(x1623 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1622(x1623)
    }
  })
  let t1620 = @simp.abbrev_tac(@term_syntax.parse_term("(q1'' : (Form) -> Bool) == IMAGE(o(formsubst((si : (Num) -> Term)), formsubst((ri' : (Num) -> Term))), (q1' : (Form) -> Bool))"))
  let t1619 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.i_def(), @trivia.o_thm()]))
  let t1618 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(si' : (Num) -> Term)"))(fn(x1615 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1616 = @tactics.mp_tac(x1615)
    fn(x1617 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1616(x1617)
    }
  }))
  let t1614 = @simp.rewrite_tac(@list.List([@unif.renaming()]))
  let t1613 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1607 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1608 = @tactics.mp_tac(x1607)
    fn(x1609 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1608(x1609)
    }
  }, fn(x1610 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1611 = @tactics.assume_tac(x1610)
    fn(x1612 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1611(x1612)
    }
  }))
  let t1606 = @simp.asm_simp_tac(@list.List([@resolution.fvs_clause_finite()]))
  let t1604 = @term_syntax.parse_term("FVS((p' : (Form) -> Bool))")
  let t1605 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : (Form) -> Bool)"), t1604]), @resolution.rename()))
  let t1603 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.i_def(), @trivia.o_thm()]))
  let t1602 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(ri' : (Num) -> Term)"))(fn(x1599 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1600 = @tactics.mp_tac(x1599)
    fn(x1601 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1600(x1601)
    }
  }))
  let t1598 = @simp.rewrite_tac(@list.List([@unif.renaming()]))
  let t1597 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1591 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1592 = @tactics.mp_tac(x1591)
    fn(x1593 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1592(x1593)
    }
  }, fn(x1594 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1595 = @tactics.assume_tac(x1594)
    fn(x1596 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1595(x1596)
    }
  }))
  let t1590 = @simp.asm_simp_tac(@list.List([@resolution.fvs_clause_finite()]))
  let t1588 = @term_syntax.parse_term("FVS((p : (Form) -> Bool))")
  let t1589 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : (Form) -> Bool)"), t1588]), @resolution.rename()))
  let t1587 = @simp.abbrev_tac(@term_syntax.parse_term("(q'' : (Form) -> Bool) == IMAGE(formsubst((si : (Num) -> Term)), (q : (Form) -> Bool))"))
  let t1586 = @simp.abbrev_tac(@term_syntax.parse_term("(si : (Num) -> Term) == rename((q : (Form) -> Bool), FVS((p' : (Form) -> Bool)))"))
  let t1584 = @meson.meson_tac(@list.List([]))
  let t1583 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm(), @sets.subset(), @sets.in_inter(), @sets.not_in_empty()]))
  let t1582 = @tactics.undisch_tac(@term_syntax.parse_term("!(INTER(IMAGE(formsubst((j : (Num) -> Term)), (p' : (Form) -> Bool)), (p1 : (Form) -> Bool)) == {})"))
  let t1581 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(IMAGE(formsubst((j : (Num) -> Term)), (p' : (Form) -> Bool)), (p : (Form) -> Bool))"))
  let t1580 = @tactics.undisch_tac(@term_syntax.parse_term("!((p1 : (Form) -> Bool) == {})"))
  let t1585 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@fol.expand_tac("p1'"), t1580), t1581), t1582), t1583), t1584), @tactics.all_tac])
  let t1579 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(IMAGE(formsubst((j : (Num) -> Term)), (p1' : (Form) -> Bool)), (p1 : (Form) -> Bool)) && !(p1' == {})"), @tactics.strip_assume_tac)
  let t1578 = @simp.abbrev_tac(@term_syntax.parse_term("(p1' : (Form) -> Bool) == {(x : Form) | IN(x, (p' : (Form) -> Bool)) && IN(formsubst((j : (Num) -> Term), x), (p1 : (Form) -> Bool))}"))
  let t1576 = @meson.meson_tac(@list.List([]))
  let t1575 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.extension(), @sets.in_diff(), @sets.in_inter(), @sets.not_in_empty()]))
  let t1574 = @tactics.undisch_tac(@term_syntax.parse_term("INTER(IMAGE(formsubst((j : (Num) -> Term)), (p' : (Form) -> Bool)), (p1 : (Form) -> Bool)) == {}"))
  let t1573 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET(IMAGE(formsubst((j : (Num) -> Term)), (p' : (Form) -> Bool)), (p : (Form) -> Bool))"))
  let t1572 = @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))])
  let t1571 = @tactics.exists_tac(@term_syntax.parse_term("DIFF((p : (Form) -> Bool), (p1 : (Form) -> Bool))"))
  let t1570 = @tactics.match_mp_tac(@sets.subset_trans())
  let t1569 = @tactics.match_mp_tac(@sets.image_subset())
  let t1568 = @fol.expand_tac("r")
  let t1567 = @simp.rewrite_tac(@list.List([@sets.image_o()]))
  let t1565 = @meson.asm_meson_tac(@list.List([formsubst_formsubst(), @resolution.clause(), @resolution.qfree_literal()]))
  let t1566 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @trivia.o_thm()])), t1565), @tactics.all_tac])
  let t1564 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE(formsubst(o(termsubst((i : (Num) -> Term)), (j : (Num) -> Term))), (p' : (Form) -> Bool)) == IMAGE(o(formsubst(i), formsubst(j)), p')"), fn(x1561 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1562 = @tactics.subst1_tac(x1561)
    fn(x1563 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1562(x1563)
    }
  })
  let t1577 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @tactics.exists_tac(@term_syntax.parse_term("o(termsubst((i : (Num) -> Term)), (j : (Num) -> Term))"))), t1564), t1566), t1567), t1568), t1569), t1570), t1571), @tactics.conj_tac), t1572), t1573), t1574), t1575), t1576), @tactics.all_tac])
  let t1560 = @class.asm_cases_tac(@term_syntax.parse_term("INTER(IMAGE(formsubst((j : (Num) -> Term)), (p' : (Form) -> Bool)), (p1 : (Form) -> Bool)) == {}"))
  let t1557 = @term_syntax.parse_term("(j : (Num) -> Term)")
  let t1559 = @tactics.disch_then((x1558 : @kernel.Thm) => @tactics.x_choose_tac(t1557, x1558))
  let t1556 = @simp.rewrite_tac(@list.List([subsumes()]))
  let t1555 = @tactics.undisch_tac(@term_syntax.parse_term("subsumes((p' : (Form) -> Bool), (p : (Form) -> Bool))"))
  let t1554 = @simp.abbrev_tac(@term_syntax.parse_term("(ri : (Num) -> Term) == rename((q : (Form) -> Bool), FVS((p : (Form) -> Bool)))"))
  let t1553 = @tactics.disch_then(fn(x1552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1549 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1550 = @tactics.assume_tac(x1549)
      fn(x1551 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1550(x1551)
      }
    })(@equal.sym(x1552))
  })
  let t1548 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x1542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1543 = @tactics.assume_tac(x1542)
    fn(x1544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1543(x1544)
    }
  }, fn(x1545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1546 = @tactics.mp_tac(x1545)
    fn(x1547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1546(x1547)
    }
  })))
  let t1540 = @term_syntax.parse_term("(q1' : (Form) -> Bool)")
  let t1541 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p1 : (Form) -> Bool)"), t1540]))
  let t1539 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1538 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t1537 = @simp.abbrev_tac(@term_syntax.parse_term("(q' : (Form) -> Bool) == IMAGE(formsubst(rename((q : (Form) -> Bool), FVS((p : (Form) -> Bool)))), q)"))
  let t1536 = @simp.gen_rewrite_tac(fn(x1533 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1534 = @equal.land_conv(x1533)
    fn(x1535 : @kernel.Term) -> @kernel.Thm raise {
      s1534(x1535)
    }
  }, @list.List([@resolution.isaresolvent()]))
  let t1532 = @tactics.undisch_tac(@term_syntax.parse_term("isaresolvent((r : (Form) -> Bool), ((p : (Form) -> Bool), (q : (Form) -> Bool)))"))
  let t1987 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1532), t1536), t1537), t1538), t1539), t1541), t1548), @pair.let_tac), t1553), t1554), t1555), t1556), t1559), t1560), t1577), @tactics.disj2_tac), t1578), t1579), t1585), t1586), t1587), t1589), t1590), t1597), t1598), t1602), t1603), @tactics.strip_tac), t1605), t1606), t1613), t1614), t1618), t1619), @tactics.strip_tac), t1620), t1624), t1644), t1645), t1649), t1794), t1795), @tactics.ants_tac), t1816), t1817), @tactics.strip_tac), t1818), @tactics.conj_tac), t1837), t1838), t1839), t1840), t1841), t1842), @tactics.conj_tac), t1856), t1857), t1858), @tactics.conj_tac), t1895), t1899), t1912), t1916), t1926), t1927), t1928), t1929), t1930), t1931), t1932), t1936), t1943), t1944), t1952), t1956), t1966), t1967), t1968), @tactics.conj_tac), t1969), @tactics.disch_tac), t1970), t1971), @tactics.ap_term_tac), t1975), t1979), t1980), t1982), t1983), t1984), t1985), t1986)
  isaresolvent_subsume_l_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Form) -> Bool, ∀ p' : (Form) -> Bool, ∀ q : (Form) -> Bool, ∀ r : (Form) -> Bool, clause(p) && clause(p') && clause(q) && subsumes(p', p) && isaresolvent(r, (p, q)) → subsumes(p', r) || (∃ r' : (Form) -> Bool, isaresolvent(r', (p', q)) && subsumes(r', r))"), t1987))
}

///|
let isaresolvent_subsume_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISARESOLVENT_SUBSUME_L")

///|
/// `ISARESOLVENT_SUBSUME_L`
pub fn isaresolvent_subsume_l() -> @kernel.Thm {
  isaresolvent_subsume_l_c.get()
}

///|
/// ISARESOLVENT_SUBSUME_R
fn step_79() -> Unit raise {
  let t2013 = @tactics.asm_tac(@meson.meson_tac)(@list.List([isaresolvent_clause(), subsumes_trans()]))
  let t2012 = @simp.asm_rewrite_tac(@list.List([]))
  let t2009 = @term_syntax.parse_term("(r'' : (Form) -> Bool)")
  let t2010 = @term_syntax.parse_term("(q' : (Form) -> Bool)")
  let t2011 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (Form) -> Bool)"), t2010, t2009]), isaresolvent_sym()))
  let t2008 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r'' : (Form) -> Bool)"))(@tactics.strip_assume_tac))
  let t2006 = @simp.asm_rewrite_tac(@list.List([]))
  let t2005 = @tactics.exists_tac(@term_syntax.parse_term("(r' : (Form) -> Bool)"))
  let t2007 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @tactics.match_mp_tac(subsumes_trans())), t2005), t2006), @tactics.all_tac])
  let t2004 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x1998 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1999 = @tactics.assume_tac(x1998)
    fn(x2000 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1999(x2000)
    }
  }, fn(x2001 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2002 = @tactics.mp_tac(x2001)
    fn(x2003 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2002(x2003)
    }
  }))
  let t1997 = @simp.asm_rewrite_tac(@list.List([]))
  let t1993 = @term_syntax.parse_term("(r' : (Form) -> Bool)")
  let t1994 = @term_syntax.parse_term("(p : (Form) -> Bool)")
  let t1995 = @term_syntax.parse_term("(q' : (Form) -> Bool)")
  let t1996 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : (Form) -> Bool)"), t1995, t1994, t1993]), isaresolvent_subsume_l()))
  let t1992 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r' : (Form) -> Bool)"))(@tactics.strip_assume_tac))
  let t1991 = @simp.asm_rewrite_tac(@list.List([]))
  let t1988 = @term_syntax.parse_term("(r : (Form) -> Bool)")
  let t1989 = @term_syntax.parse_term("(p : (Form) -> Bool)")
  let t1990 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : (Form) -> Bool)"), t1989, t1988]), isaresolvent_sym()))
  let t2014 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1990), t1991), t1992), t1996), t1997), t2004), t2007), t2008), @tactics.disj2_tac), t2011), t2012), t2013)
  isaresolvent_subsume_r_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Form) -> Bool, ∀ q : (Form) -> Bool, ∀ q' : (Form) -> Bool, ∀ r : (Form) -> Bool, clause(p) && clause(q) && clause(q') && subsumes(q', q) && isaresolvent(r, (p, q)) → subsumes(q', r) || (∃ r' : (Form) -> Bool, isaresolvent(r', (p, q')) && subsumes(r', r))"), t2014))
}

///|
let isaresolvent_subsume_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISARESOLVENT_SUBSUME_R")

///|
/// `ISARESOLVENT_SUBSUME_R`
pub fn isaresolvent_subsume_r() -> @kernel.Thm {
  isaresolvent_subsume_r_c.get()
}

///|
/// ISARESOLVENT_SUBSUME
fn step_80() -> Unit raise {
  let t2034 = @meson.asm_meson_tac(@list.List([subsumes_trans(), isaresolvent_clause()]))
  let t2033 = @simp.asm_rewrite_tac(@list.List([]))
  let t2029 = @term_syntax.parse_term("(r' : (Form) -> Bool)")
  let t2030 = @term_syntax.parse_term("(q' : (Form) -> Bool)")
  let t2031 = @term_syntax.parse_term("(p' : (Form) -> Bool)")
  let t2032 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (Form) -> Bool)"), t2031, t2030, t2029]), isaresolvent_subsume_l()))
  let t2028 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r' : (Form) -> Bool)"))(@tactics.strip_assume_tac))
  let t2027 = @simp.asm_rewrite_tac(@list.List([]))
  let t2026 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x2020 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2021 = @tactics.assume_tac(x2020)
    fn(x2022 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2021(x2022)
    }
  }, fn(x2023 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2024 = @tactics.mp_tac(x2023)
    fn(x2025 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2024(x2025)
    }
  }))
  let t2019 = @simp.asm_rewrite_tac(@list.List([]))
  let t2015 = @term_syntax.parse_term("(r : (Form) -> Bool)")
  let t2016 = @term_syntax.parse_term("(q' : (Form) -> Bool)")
  let t2017 = @term_syntax.parse_term("(q : (Form) -> Bool)")
  let t2018 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : (Form) -> Bool)"), t2017, t2016, t2015]), isaresolvent_subsume_r()))
  let t2035 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2018), t2019), t2026), t2027), t2028), t2032), t2033), t2034)
  isaresolvent_subsume_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Form) -> Bool, ∀ p' : (Form) -> Bool, ∀ q : (Form) -> Bool, ∀ q' : (Form) -> Bool, ∀ r : (Form) -> Bool, clause(p) && clause(p') && clause(q) && clause(q') && subsumes(p', p) && subsumes(q', q) && isaresolvent(r, (p, q)) → subsumes(p', r) || subsumes(q', r) || (∃ r' : (Form) -> Bool, isaresolvent(r', (p', q')) && subsumes(r', r))"), t2035))
}

///|
let isaresolvent_subsume_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISARESOLVENT_SUBSUME")

///|
/// `ISARESOLVENT_SUBSUME`
pub fn isaresolvent_subsume() -> @kernel.Thm {
  isaresolvent_subsume_c.get()
}

///|
/// ALLRESOLVENTS_SUBSUME_L
fn step_81() -> Unit raise {
  let t2036 = @meson.meson_tac(@list.List([isaresolvent_subsume_l(), subsumes_refl()]))
  let t2037 = @tactics.then_tac(@simp.rewrite_tac(@list.List([subsumes_v1(), @sets.in_union(), allresolvents(), @sets.in_elim_thm()])), t2036)
  allresolvents_subsume_l_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((Form) -> Bool) -> Bool, ∀ t : ((Form) -> Bool) -> Bool, ∀ u : ((Form) -> Bool) -> Bool, (∀ c : (Form) -> Bool, IN(c, s) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, t) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, u) → clause(c)) && SUBSUMES(s, t) → SUBSUMES(UNION(s, allresolvents(s, u)), allresolvents(t, u))"), t2037))
}

///|
let allresolvents_subsume_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLRESOLVENTS_SUBSUME_L")

///|
/// `ALLRESOLVENTS_SUBSUME_L`
pub fn allresolvents_subsume_l() -> @kernel.Thm {
  allresolvents_subsume_l_c.get()
}

///|
/// ALLRESOLVENTS_SUBSUME_R
fn step_82() -> Unit raise {
  let t2038 = @meson.meson_tac(@list.List([isaresolvent_subsume_r(), subsumes_refl()]))
  let t2039 = @tactics.then_tac(@simp.rewrite_tac(@list.List([subsumes_v1(), @sets.in_union(), allresolvents(), @sets.in_elim_thm()])), t2038)
  allresolvents_subsume_r_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((Form) -> Bool) -> Bool, ∀ t : ((Form) -> Bool) -> Bool, ∀ u : ((Form) -> Bool) -> Bool, (∀ c : (Form) -> Bool, IN(c, s) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, t) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, u) → clause(c)) && SUBSUMES(t, u) → SUBSUMES(UNION(t, allresolvents(s, t)), allresolvents(s, u))"), t2039))
}

///|
let allresolvents_subsume_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLRESOLVENTS_SUBSUME_R")

///|
/// `ALLRESOLVENTS_SUBSUME_R`
pub fn allresolvents_subsume_r() -> @kernel.Thm {
  allresolvents_subsume_r_c.get()
}

///|
/// ALLRESOLVENTS_SUBSUME
fn step_83() -> Unit raise {
  let t2043 = @meson.asm_meson_tac(@list.List([allresolvents_clause()]))
  let t2042 = @simp.asm_simp_tac(@list.List([allresolvents_subsume_l(), allresolvents_subsume_r(), subsumes_union(), subsumes_refl_v1(), @sets.in_union()]))
  let t2041 = @tactics.exists_tac(@term_syntax.parse_term("UNION((s : ((Form) -> Bool) -> Bool), allresolvents(s, (t' : ((Form) -> Bool) -> Bool)))"))
  let t2040 = @tactics.match_mp_tac(subsumes_trans_v1())
  let t2044 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2040), t2041), t2042), t2043)
  allresolvents_subsume_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((Form) -> Bool) -> Bool, ∀ t : ((Form) -> Bool) -> Bool, ∀ s' : ((Form) -> Bool) -> Bool, ∀ t' : ((Form) -> Bool) -> Bool, (∀ c : (Form) -> Bool, IN(c, s) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, s') → clause(c)) && (∀ c : (Form) -> Bool, IN(c, t) → clause(c)) && (∀ c : (Form) -> Bool, IN(c, t') → clause(c)) && SUBSUMES(s, s') && SUBSUMES(t, t') → SUBSUMES(UNION(s, UNION(t, allresolvents(s, t))), allresolvents(s', t'))"), t2044))
}

///|
let allresolvents_subsume_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALLRESOLVENTS_SUBSUME")

///|
/// `ALLRESOLVENTS_SUBSUME`
pub fn allresolvents_subsume() -> @kernel.Thm {
  allresolvents_subsume_c.get()
}

///|
/// ISARESOLVENT_TAUTOLOGY_L
fn step_84() -> Unit raise {
  let t2045 = @meson.meson_tac(@list.List([]))
  let t2046 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm()])), t2045)
  let lemma = @tactics.prove(@term_syntax.parse_term("{op_tilde_tilde((p : Form)) | IN(p, (s : (Form) -> Bool))} == IMAGE(op_tilde_tilde, s)"), t2046)
  let t2220 = @meson.asm_meson_tac(@list.List([]))
  let t2219 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image(), @sets.in_diff(), @sets.in_union()]))
  let t2218 = @fol.expand_tac("r")
  let t2216 = @meson.asm_meson_tac(@list.List([@resolution.clause(), @resolution.image_formsubst_clause(), @sets.subset()]))
  let t2215 = @tactics.subgoal_then(@term_syntax.parse_term("literal((x : Form)) && literal((y : Form))"), fn(x2213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x2213
    @meson.meson_tac(@list.List([@resolution.negate_negate(), th_2]))
  })
  let t2212 = @simp.rewrite_tac(@list.List([@equal.gsym(@resolution.formsubst_negate())]))
  let t2208 = @term_syntax.parse_term("op_tilde_tilde")
  let t2211 = @tactics.disch_then(fn(x2210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2206 = @tactics.mp_tac(x2205)
      fn(x2207 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2206(x2207)
      }
    })(((x2209 : @kernel.Thm) => @equal.ap_term(t2208, x2209))(x2210))
  })
  let t2204 = @simp.asm_rewrite_tac(@list.List([]))
  let t2200 = @term_syntax.parse_term("(y : Form)")
  let t2203 = @tactics.disch_then(fn(x2202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2197 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2198 = @tactics.mp_tac(x2197)
      fn(x2199 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2198(x2199)
      }
    })(((x2201 : @kernel.Thm) => @bool.spec(t2200, x2201))(x2202))
  })
  let t2196 = @tactics.undisch_tac(@term_syntax.parse_term("∀ y : Form, IN(y, (q1' : (Form) -> Bool)) → formsubst((i : (Num) -> Term), op_tilde_tilde(y)) == formsubst(i, op_tilde_tilde((x : Form)))"))
  let t2217 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2196), t2203), t2204), t2211), t2212), t2215), t2216), @tactics.all_tac])
  let t2195 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Form, IN(y, (q1' : (Form) -> Bool)) → formsubst((i : (Num) -> Term), y) == formsubst(i, (x : Form))"), fn(x2192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2193 = @tactics.mp_tac(x2192)
    fn(x2194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2193(x2194)
    }
  })
  let t2191 = @simp.asm_rewrite_tac(@list.List([@sets.image_o()]))
  let t2189 = @meson.asm_meson_tac(@list.List([@resolution.clause(), formsubst_formsubst(), @resolution.qfree_literal()]))
  let t2190 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @trivia.o_thm()])), t2189), @tactics.all_tac])
  let t2188 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE(formsubst(o(termsubst((i : (Num) -> Term)), (k : (Num) -> Term))), (q : (Form) -> Bool)) == IMAGE(o(formsubst(i), formsubst(k)), q)"), fn(x2185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2186 = @tactics.subst1_tac(x2185)
    fn(x2187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2186(x2187)
    }
  })
  let t2184 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2183 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Form, IN(y, (q1' : (Form) -> Bool)) → formsubst((i : (Num) -> Term), op_tilde_tilde(y)) == formsubst(i, op_tilde_tilde((x : Form)))"), fn(x2180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2181 = @tactics.assume_tac(x2180)
    fn(x2182 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2181(x2182)
    }
  })
  let t2179 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t2178 = @simp.rewrite_tac(@list.List([@resolution.formsubst_negate(), @resolution.negate_refl(), @kernel.assume_rule(@term_syntax.parse_term("IN(op_tilde_tilde((x : Form)), (p1 : (Form) -> Bool))"))]))
  let t2177 = @tactics.disch_then(fn(x2173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2173
    let t2175 = @term_syntax.parse_term("(x : Form)")
    let t2176 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("op_tilde_tilde((x : Form))"), t2175]), th_1))
    @tactics.then_tac(@tactics.assume_tac(th_1), t2176)
  })
  let t2172 = @simp.rewrite_tac(@list.List([@unif.unifies_def(), @sets.in_union(), @sets.in_elim_thm()]))
  let t2171 = @tactics.disch_then(fn(x2170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2168 = @tactics.mp_tac(x2167)
      fn(x2169 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2168(x2169)
      }
    })(@bool.conjunct1(x2170))
  })
  let t2164 = @meson.asm_meson_tac(@list.List([@resolution.qfree_literal(), @resolution.clause(), @sets.subset(), @sets.in_image(), @resolution.image_formsubst_clause()]))
  let t2163 = @simp.asm_rewrite_tac(@list.List([@resolution.qfree_negate()]))
  let t2162 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2165 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_elim_thm()])), t2162), t2163), t2164)
  let t2161 = @meson.asm_meson_tac(@list.List([@sets.finite_image(), @sets.finite_subset(), @resolution.clause(), @sets.subset(), @sets.in_diff()]))
  let t2166 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([lemma, @sets.finite_union()])), t2161), t2165])), @tactics.all_tac])
  let t2160 = @simp.asm_rewrite_tac(@list.List([]))
  let t2159 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("UNION((p1 : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, (q1' : (Form) -> Bool))})"), @unif.mgu_v1()))
  let t2158 = @tactics.exists_tac(@term_syntax.parse_term("o(termsubst((i : (Num) -> Term)), (k : (Num) -> Term))"))
  let t2157 = @simp.rewrite_tac(@list.List([subsumes()]))
  let t2156 = @list.List([@meson.asm_meson_tac(@list.List([@sets.in_diff()])), @tactics.all_tac])
  let t2155 = @tactics.subgoal_then(@term_syntax.parse_term("IN(op_tilde_tilde((x : Form)), (p1 : (Form) -> Bool))"), fn(x2152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2153 = @tactics.assume_tac(x2152)
    fn(x2154 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2153(x2154)
    }
  })
  let t2150 = @meson.asm_meson_tac(@list.List([]))
  let t2149 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image(), @sets.in_diff(), @sets.in_union()]))
  let t2148 = @fol.expand_tac("r")
  let t2146 = @meson.asm_meson_tac(@list.List([@resolution.negate_negate(), @resolution.clause(), @resolution.image_formsubst_clause(), @sets.subset()]))
  let t2145 = @simp.rewrite_tac(@list.List([@equal.gsym(@resolution.formsubst_negate())]))
  let t2141 = @term_syntax.parse_term("op_tilde_tilde")
  let t2144 = @tactics.disch_then(fn(x2143 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2139 = @tactics.mp_tac(x2138)
      fn(x2140 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2139(x2140)
      }
    })(((x2142 : @kernel.Thm) => @equal.ap_term(t2141, x2142))(x2143))
  })
  let t2137 = @simp.asm_rewrite_tac(@list.List([]))
  let t2133 = @term_syntax.parse_term("(y : Form)")
  let t2136 = @tactics.disch_then(fn(x2135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2131 = @tactics.mp_tac(x2130)
      fn(x2132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2131(x2132)
      }
    })(((x2134 : @kernel.Thm) => @bool.spec(t2133, x2134))(x2135))
  })
  let t2129 = @tactics.undisch_tac(@term_syntax.parse_term("∀ y : Form, IN(y, (q1' : (Form) -> Bool)) → formsubst((i : (Num) -> Term), op_tilde_tilde(y)) == formsubst(i, (x : Form))"))
  let t2147 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2129), t2136), t2137), t2144), t2145), t2146), @tactics.all_tac])
  let t2128 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Form, IN(y, (q1' : (Form) -> Bool)) → formsubst((i : (Num) -> Term), y) == formsubst(i, op_tilde_tilde((x : Form)))"), fn(x2125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2126 = @tactics.mp_tac(x2125)
    fn(x2127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2126(x2127)
    }
  })
  let t2124 = @simp.asm_rewrite_tac(@list.List([@sets.image_o()]))
  let t2122 = @meson.asm_meson_tac(@list.List([@resolution.clause(), formsubst_formsubst(), @resolution.qfree_literal()]))
  let t2123 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @trivia.o_thm()])), t2122), @tactics.all_tac])
  let t2121 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE(formsubst(o(termsubst((i : (Num) -> Term)), (k : (Num) -> Term))), (q : (Form) -> Bool)) == IMAGE(o(formsubst(i), formsubst(k)), q)"), fn(x2118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2119 = @tactics.subst1_tac(x2118)
    fn(x2120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2119(x2120)
    }
  })
  let t2117 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2116 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Form, IN(y, (q1' : (Form) -> Bool)) → formsubst((i : (Num) -> Term), op_tilde_tilde(y)) == formsubst(i, (x : Form))"), fn(x2113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2114 = @tactics.assume_tac(x2113)
    fn(x2115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2114(x2115)
    }
  })
  let t2112 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t2111 = @simp.rewrite_tac(@list.List([@resolution.formsubst_negate(), @resolution.negate_refl(), @kernel.assume_rule(@term_syntax.parse_term("IN((x : Form), (p1 : (Form) -> Bool))"))]))
  let t2110 = @tactics.disch_then(fn(x2106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2106
    let t2108 = @term_syntax.parse_term("op_tilde_tilde((x : Form))")
    let t2109 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Form)"), t2108]), th))
    @tactics.then_tac(@tactics.assume_tac(th), t2109)
  })
  let t2105 = @simp.rewrite_tac(@list.List([@unif.unifies_def(), @sets.in_union(), @sets.in_elim_thm()]))
  let t2104 = @tactics.disch_then(fn(x2103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2100 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2101 = @tactics.mp_tac(x2100)
      fn(x2102 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2101(x2102)
      }
    })(@bool.conjunct1(x2103))
  })
  let t2097 = @meson.asm_meson_tac(@list.List([@resolution.qfree_literal(), @resolution.clause(), @sets.subset(), @sets.in_image(), @resolution.image_formsubst_clause()]))
  let t2096 = @simp.asm_rewrite_tac(@list.List([@resolution.qfree_negate()]))
  let t2095 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2098 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_elim_thm()])), t2095), t2096), t2097)
  let t2094 = @meson.asm_meson_tac(@list.List([@sets.finite_image(), @sets.finite_subset(), @resolution.clause(), @sets.subset(), @sets.in_diff()]))
  let t2099 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([lemma, @sets.finite_union()])), t2094), t2098])), @tactics.all_tac])
  let t2093 = @simp.asm_rewrite_tac(@list.List([]))
  let t2092 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("UNION((p1 : (Form) -> Bool), {op_tilde_tilde((p : Form)) | IN(p, (q1' : (Form) -> Bool))})"), @unif.mgu_v1()))
  let t2091 = @tactics.exists_tac(@term_syntax.parse_term("o(termsubst((i : (Num) -> Term)), (k : (Num) -> Term))"))
  let t2151 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([subsumes()])), t2091), t2092), t2093), @tactics.ants_tac), t2099), t2104), t2105), t2110), t2111), t2112), @tactics.strip_tac), t2116), t2117), t2121), t2123), t2124), t2128), t2147), t2148), t2149), t2150), @tactics.all_tac])
  let t2090 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : Form), (p1 : (Form) -> Bool))"))
  let t2089 = @simp.abbrev_tac(@term_syntax.parse_term("(k : (Num) -> Term) == rename((q : (Form) -> Bool), FVS((p : (Form) -> Bool)))"))
  let t2087 = @meson.asm_meson_tac(@list.List([@sets.in_diff()]))
  let t2086 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_diff(), @sets.in_union()]))
  let t2085 = @simp.rewrite_tac(@list.List([@equal.gsym(@resolution.formsubst_negate())]))
  let t2084 = @fol.expand_tac("r")
  let t2088 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @tactics.exists_tac(@term_syntax.parse_term("formsubst((i : (Num) -> Term), (x : Form))"))), t2084), t2085), t2086), t2087), @tactics.all_tac])
  let t2083 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : Form), DIFF((p : (Form) -> Bool), (p1 : (Form) -> Bool))) && IN(op_tilde_tilde(x), DIFF(p, p1))"))
  let t2082 = @tactics.disch_then(fn(x2081 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2078 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2079 = @tactics.assume_tac(x2078)
      fn(x2080 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2079(x2080)
      }
    })(@equal.sym(x2081))
  })
  let t2077 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x2071 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2072 = @tactics.assume_tac(x2071)
    fn(x2073 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2072(x2073)
    }
  }, fn(x2074 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2075 = @tactics.mp_tac(x2074)
    fn(x2076 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2075(x2076)
    }
  })))
  let t2069 = @term_syntax.parse_term("(q1' : (Form) -> Bool)")
  let t2070 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p1 : (Form) -> Bool)"), t2069]))
  let t2068 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t2067 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t2066 = @simp.abbrev_tac(@term_syntax.parse_term("(q' : (Form) -> Bool) == IMAGE(formsubst(rename((q : (Form) -> Bool), FVS((p : (Form) -> Bool)))), q)"))
  let t2065 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(x : Form)"))(@tactics.strip_assume_tac), fn(x2062 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2063 = @tactics.mp_tac(x2062)
    fn(x2064 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2063(x2064)
    }
  }))
  let t2061 = @simp.rewrite_tac(@list.List([tautologous(), @resolution.isaresolvent()]))
  let t2060 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2054 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2055 = @tactics.assume_tac(x2054)
    fn(x2056 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2055(x2056)
    }
  }, fn(x2057 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2058 = @tactics.mp_tac(x2057)
    fn(x2059 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2058(x2059)
    }
  }))
  let t2053 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2047 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2048 = @tactics.assume_tac(x2047)
    fn(x2049 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2048(x2049)
    }
  }, fn(x2050 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2051 = @tactics.mp_tac(x2050)
    fn(x2052 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2051(x2052)
    }
  }))
  let t2221 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2053), t2060), t2061), t2065), t2066), t2067), t2068), t2070), t2077), @pair.let_tac), t2082), t2083), t2088), t2089), @tactics.disj2_tac), t2090), t2151), t2155), t2156), t2157), t2158), t2159), t2160), @tactics.ants_tac), t2166), t2171), t2172), t2177), t2178), t2179), @tactics.strip_tac), t2183), t2184), t2188), t2190), t2191), t2195), t2217), t2218), t2219), t2220)
  isaresolvent_tautology_l_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Form) -> Bool, ∀ q : (Form) -> Bool, ∀ r : (Form) -> Bool, clause(p) && clause(q) && tautologous(p) && isaresolvent(r, (p, q)) → tautologous(r) || subsumes(q, r)"), t2221))
}

///|
let isaresolvent_tautology_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISARESOLVENT_TAUTOLOGY_L")

///|
/// `ISARESOLVENT_TAUTOLOGY_L`
pub fn isaresolvent_tautology_l() -> @kernel.Thm {
  isaresolvent_tautology_l_c.get()
}

///|
/// TAUTOLOGOUS_SUBSUMES
fn step_85() -> Unit raise {
  let t2222 = @meson.meson_tac(@list.List([subsumes(), tautologous(), @sets.subset(), tautologous_instance()]))
  tautologous_subsumes_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Form) -> Bool, ∀ q : (Form) -> Bool, subsumes(p, q) && tautologous(p) → tautologous(q)"), t2222))
}

///|
let tautologous_subsumes_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAUTOLOGOUS_SUBSUMES")

///|
/// `TAUTOLOGOUS_SUBSUMES`
pub fn tautologous_subsumes() -> @kernel.Thm {
  tautologous_subsumes_c.get()
}

///|
/// ISARESOLVENT_TAUTOLOGY_R
fn step_86() -> Unit raise {
  let t2223 = @meson.meson_tac(@list.List([isaresolvent_sym(), isaresolvent_tautology_l(), subsumes_trans(), tautologous_subsumes()]))
  isaresolvent_tautology_r_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Form) -> Bool, ∀ q : (Form) -> Bool, ∀ r : (Form) -> Bool, clause(p) && clause(q) && tautologous(p) && isaresolvent(r, (q, p)) → tautologous(r) || subsumes(q, r)"), t2223))
}

///|
let isaresolvent_tautology_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISARESOLVENT_TAUTOLOGY_R")

///|
/// `ISARESOLVENT_TAUTOLOGY_R`
pub fn isaresolvent_tautology_r() -> @kernel.Thm {
  isaresolvent_tautology_r_c.get()
}

///|
/// REPLACE_FROMNEW
fn step_87() -> Unit raise {
  let t2227 = @meson.asm_meson_tac(@list.List([]))
  let t2226 = @simp.simp_tac(@list.List([@lists.mem()]))
  let t2225 = @simp.simp_tac(@list.List([@lists.mem()]))
  let t2224 = @simp.rewrite_tac(@list.List([replace()]))
  let t2228 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t2224), t2225), @tactics.gen_tac), @class.cond_cases_tac), t2226), t2227)
  replace_fromnew_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], ∀ c : (Form) -> Bool, MEM(c, replace(cl, lis)) → MEM(c, lis) || c == cl"), t2228))
}

///|
let replace_fromnew_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REPLACE_FROMNEW")

///|
/// `REPLACE_FROMNEW`
pub fn replace_fromnew() -> @kernel.Thm {
  replace_fromnew_c.get()
}

///|
/// INCORPORATE_FROMNEW
fn step_88() -> Unit raise {
  let t2230 = @meson.meson_tac(@list.List([replace_fromnew()]))
  let t2229 = @simp.rewrite_tac(@list.List([incorporate()]))
  let t2231 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2229), @class.cond_cases_tac), t2230)
  incorporate_fromnew_c.set(@tactics.prove(@term_syntax.parse_term("∀ gcl : (Form) -> Bool, ∀ cl : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], ∀ c : (Form) -> Bool, MEM(c, incorporate(gcl, cl, lis)) → MEM(c, lis) || c == cl"), t2231))
}

///|
let incorporate_fromnew_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INCORPORATE_FROMNEW")

///|
/// `INCORPORATE_FROMNEW`
pub fn incorporate_fromnew() -> @kernel.Thm {
  incorporate_fromnew_c.get()
}

///|
/// ITLIST_INCORPORATE_FROMNEW
fn step_89() -> Unit raise {
  let t2233 = @meson.asm_meson_tac(@list.List([incorporate_fromnew()]))
  let t2232 = @simp.rewrite_tac(@list.List([@lists.itlist(), @lists.mem()]))
  let t2234 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @lists.list_induct_tac), t2232), t2233)
  itlist_incorporate_fromnew_c.set(@tactics.prove(@term_syntax.parse_term("∀ gcl : (Form) -> Bool, ∀ lis : List[(Form) -> Bool], ∀ new : List[(Form) -> Bool], ∀ c : (Form) -> Bool, MEM(c, ITLIST(incorporate(gcl), new, lis)) → MEM(c, new) || MEM(c, lis)"), t2234))
}

///|
let itlist_incorporate_fromnew_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST_INCORPORATE_FROMNEW")

///|
/// `ITLIST_INCORPORATE_FROMNEW`
pub fn itlist_incorporate_fromnew() -> @kernel.Thm {
  itlist_incorporate_fromnew_c.get()
}

///|
/// UNUSED_FROMNEW
fn step_90() -> Unit raise {
  let t2262 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) < (n : Num) → x < SUC(n)"))]))
  let t2260 = @simp.simp_tac(@list.List([@lists.mem(), @lists.tl()]))
  let t2258 = @term_syntax.parse_term("(l : List[(Form) -> Bool])")
  let t2259 = @tactics.spec_tac(@term_syntax.parse_term("SND(given((n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))"), t2258)
  let t2257 = @tactics.undisch_tac(@term_syntax.parse_term("!(SND(given((n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))) == NIL)"))
  let t2261 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("MEM((c : (Form) -> Bool), TL(SND(given((n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))))")), t2257), t2259), @lists.list_induct_tac), t2260), @tactics.all_tac])
  let t2256 = @tactics.subgoal_then(@term_syntax.parse_term("MEM((c : (Form) -> Bool), SND(given((n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))))"), fn(x2249 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2249
    @tactics.first_assum(fn(x2255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2251 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2252 = @tactics.mp_tac(x2251)
        fn(x2253 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2252(x2253)
        }
      })((fn(x2254 : @kernel.Thm) -> @kernel.Thm raise {
        @drule.match_mp(x2254)(th)
      })(x2255))
    })
  })
  let t2248 = @list.List([@meson.asm_meson_tac(@list.List([@arith.lt()])), @tactics.all_tac])
  let t2247 = @simp.asm_rewrite_tac(@list.List([]))
  let t2244 = @drule.match_mp(itlist_incorporate_fromnew())
  let t2246 = @tactics.disch_then(fn(x2245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2242 = @tactics.mp_tac(x2241)
      fn(x2243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2242(x2243)
      }
    })(t2244(x2245))
  })
  let t2240 = @simp.rewrite_tac(@list.List([@pair.snd()]))
  let t2239 = @list.List([@meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) < (n : Num) → x < SUC(n)"))])), @tactics.all_tac])
  let t2238 = @simp.rewrite_tac(@list.List([]))
  let t2237 = @simp.pure_rewrite_tac(@list.List([step()]))
  let t2236 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("given((n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))"), @pair.pair())))
  let t2235 = @simp.simp_tac(@list.List([given()]))
  let t2263 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @nums.induct_tac), t2235), t2236), t2237), @class.cond_cases_tac), t2238), t2239), @pair.let_tac), t2240), t2246), @tactics.strip_tac), t2247), t2248), t2256), t2261), t2262)
  unused_fromnew_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], ∀ c : (Form) -> Bool, ∀ n : Num, MEM(c, SND(given(n, (used, unused)))) → MEM(c, unused) || (∃ m : Num, m < n && MEM(c, resolvents(HD(SND(given(m, (used, unused)))), CONS(HD(SND(given(m, (used, unused)))), FST(given(m, (used, unused)))))))"), t2263))
}

///|
let unused_fromnew_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNUSED_FROMNEW")

///|
/// `UNUSED_FROMNEW`
pub fn unused_fromnew() -> @kernel.Thm {
  unused_fromnew_c.get()
}

///|
/// SUB_FROMNEW
fn step_91() -> Unit raise {
  let t2264 = @tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@lists.mem(), @lists.hd()])))
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ l : List[_], !(l == NIL) → MEM(HD(l), l)"), t2264)
  let t2277 = @simp.simp_tac(@list.List([@lists.mem(), @lists.tl(), @lists.hd()]))
  let t2275 = @term_syntax.parse_term("(l : List[(Form) -> Bool])")
  let t2276 = @tactics.spec_tac(@term_syntax.parse_term("SND(given((n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool]))))"), t2275)
  let t2274 = @simp.asm_rewrite_tac(@list.List([]))
  let t2273 = @tactics.undisch_tac(@term_syntax.parse_term("!(SND(given((n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))) == NIL)"))
  let t2272 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) < (n : Num) → x < SUC(n)"))]))])
  let t2271 = @tactics.subgoal_then(@term_syntax.parse_term("MEM((c : (Form) -> Bool), SND(given((n : Num), ((used : List[(Form) -> Bool]), (unused : List[(Form) -> Bool])))))"), fn(x2269 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2269
    @tactics.mp_tac(@drule.match_mp(unused_fromnew())(th))
  })
  let t2268 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) < (n : Num) → x < SUC(n)"))]))])
  let t2267 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t2266 = @list.List([@meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) < (n : Num) → x < SUC(n)"))])), @tactics.all_tac])
  let t2265 = @simp.rewrite_tac(@list.List([sub_def(), @sets.not_in_empty()]))
  let t2278 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), @nums.induct_tac), t2265), @class.cond_cases_tac), t2266), t2267), @tactics.strip_tac), t2268), t2271), t2272), t2273), t2274), t2276), @lists.list_induct_tac), t2277)
  sub_fromnew_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], ∀ c : (Form) -> Bool, ∀ n : Num, IN(c, Sub((used, unused), n)) → MEM(c, unused) || (∃ m : Num, m < n && MEM(c, resolvents(HD(SND(given(m, (used, unused)))), CONS(HD(SND(given(m, (used, unused)))), FST(given(m, (used, unused)))))))"), t2278))
}

///|
let sub_fromnew_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_FROMNEW")

///|
/// `SUB_FROMNEW`
pub fn sub_fromnew() -> @kernel.Thm {
  sub_fromnew_c.get()
}

///|
/// LEVEL_FROMNEW
fn step_92() -> Unit raise {
  let t2279 = @meson.meson_tac(@list.List([sub_fromnew()]))
  let t2280 = @tactics.then_tac(@simp.rewrite_tac(@list.List([level()])), t2279)
  level_fromnew_c.set(@tactics.prove(@term_syntax.parse_term("∀ used : List[(Form) -> Bool], ∀ unused : List[(Form) -> Bool], ∀ c : (Form) -> Bool, ∀ n : Num, IN(c, level((used, unused), n)) → MEM(c, unused) || (∃ m : Num, MEM(c, resolvents(HD(SND(given(m, (used, unused)))), CONS(HD(SND(given(m, (used, unused)))), FST(given(m, (used, unused)))))))"), t2280))
}

///|
let level_fromnew_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEVEL_FROMNEW")

///|
/// `LEVEL_FROMNEW`
pub fn level_fromnew() -> @kernel.Thm {
  level_fromnew_c.get()
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
  step_15()
  step_16()
  step_17()
  step_18()
  step_19()
  step_20()
  step_21()
  step_22()
  step_23()
  step_24()
  step_25()
  step_26()
  step_27()
  step_28()
  step_29()
  step_30()
  step_31()
  step_32()
  step_33()
  step_34()
  step_35()
  step_36()
  step_37()
  step_38()
  step_39()
  step_40()
  step_41()
  step_42()
  step_43()
  step_44()
  step_45()
  step_46()
  step_47()
  step_48()
  step_49()
  step_50()
  step_51()
  step_52()
  step_53()
  step_54()
  step_55()
  step_56()
  step_57()
  step_58()
  step_59()
  step_60()
  step_61()
  step_62()
  step_63()
  step_64()
  step_65()
  step_66()
  step_67()
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
  step_86()
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
}
