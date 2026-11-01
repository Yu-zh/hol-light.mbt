// Translated from upstream Model/modelset.ml; edit this file directly.

///|
/// INJ_LEMMA
fn step_1() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([]))
  inj_lemma_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : _, ∀ y : _, (f : (_) -> _)(x) == f(y) → x == y) == (∀ x : _, ∀ y : _, (f(x) == f(y)) == (x == y))"), t1))
}

///|
let inj_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INJ_LEMMA")

///|
/// `INJ_LEMMA`
pub fn inj_lemma() -> @kernel.Thm {
  inj_lemma_c.get()
}

///|
/// Model/modelset.ml:13
fn step_2() -> Unit raise {
  @printer.parse_as_infix("|->", (12L, "right"))
}

///|
/// valmod
fn step_3() -> Unit raise {
  valmod_c.set(@pair.new_definition(@term_syntax.parse_term("(op_bar_minus_gt : (A, B, (A) -> B, A) -> B)((x : A), (a : B), (v : (A) -> B)) == ((y : A) => if y == x { a } else { v(y) })")))
}

///|
let valmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("valmod")

///|
/// `valmod`
pub fn valmod() -> @kernel.Thm {
  valmod_c.get()
}

///|
/// VALMOD
fn step_4() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([valmod()]))
  valmod_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ x : _, ∀ y : _, ∀ a : _, op_bar_minus_gt(x, y, v, a) == (if a == x { y } else { v(a) })"), t2))
}

///|
let valmod_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD")

///|
/// `VALMOD`
pub fn valmod_v1() -> @kernel.Thm {
  valmod_v1_c.get()
}

///|
/// VALMOD_BASIC
fn step_5() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([valmod()]))
  valmod_basic_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ x : _, ∀ y : _, op_bar_minus_gt(x, y, v, x) == y"), t3))
}

///|
let valmod_basic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_BASIC")

///|
/// `VALMOD_BASIC`
pub fn valmod_basic() -> @kernel.Thm {
  valmod_basic_c.get()
}

///|
/// VALMOD_VALMOD_BASIC
fn step_6() -> Unit raise {
  let t5 = @simp.asm_rewrite_tac(@list.List([]))
  let t4 = @tactics.repeat_tac(@tactics.gen_tac)
  let t6 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([valmod(), @class.fun_eq_thm()])), t4), @class.cond_cases_tac), t5)
  valmod_valmod_basic_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ a : _, ∀ b : _, ∀ x : _, op_bar_minus_gt(x, a, op_bar_minus_gt(x, b, v)) == op_bar_minus_gt(x, a, v)"), t6))
}

///|
let valmod_valmod_basic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_VALMOD_BASIC")

///|
/// `VALMOD_VALMOD_BASIC`
pub fn valmod_valmod_basic() -> @kernel.Thm {
  valmod_valmod_basic_c.get()
}

///|
/// VALMOD_REPEAT
fn step_7() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([]))
  let t8 = @tactics.then_tac(@simp.rewrite_tac(@list.List([valmod(), @class.fun_eq_thm()])), t7)
  valmod_repeat_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ x : _, op_bar_minus_gt(x, v(x), v) == v"), t8))
}

///|
let valmod_repeat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_REPEAT")

///|
/// `VALMOD_REPEAT`
pub fn valmod_repeat() -> @kernel.Thm {
  valmod_repeat_c.get()
}

///|
/// FORALL_VALMOD
fn step_8() -> Unit raise {
  let t9 = @meson.meson_tac(@list.List([valmod_repeat()]))
  forall_valmod_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, (∀ v : (_) -> _, ∀ a : _, (P : ((_) -> _) -> Bool)(op_bar_minus_gt(x, a, v))) == (∀ v : (_) -> _, P(v))"), t9))
}

///|
let forall_valmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_VALMOD")

///|
/// `FORALL_VALMOD`
pub fn forall_valmod() -> @kernel.Thm {
  forall_valmod_c.get()
}

///|
/// VALMOD_SWAP
fn step_9() -> Unit raise {
  let t10 = @meson.meson_tac(@list.List([]))
  let t11 = @tactics.then_tac(@simp.rewrite_tac(@list.List([valmod(), @class.fun_eq_thm()])), t10)
  valmod_swap_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (_) -> _, ∀ x : _, ∀ y : _, ∀ a : _, ∀ b : _, !(x == y) → op_bar_minus_gt(x, a, op_bar_minus_gt(y, b, v)) == op_bar_minus_gt(y, b, op_bar_minus_gt(x, a, v))"), t11))
}

///|
let valmod_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALMOD_SWAP")

///|
/// `VALMOD_SWAP`
pub fn valmod_swap() -> @kernel.Thm {
  valmod_swap_c.get()
}

///|
/// ind_model_tybij_th
fn step_10() -> Unit raise {
  let t12 = @meson.meson_tac(@list.List([@sets.member_not_empty(), @sets.in_sing(), @sets.finite_rules()]))
  ind_model_tybij_th_c.set(@tactics.prove(@term_syntax.parse_term("∃ x : Num, IN(x, select((s : (Num) -> Bool) => !(s == {}) && FINITE(s)))"), t12))
}

///|
let ind_model_tybij_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ind_model_tybij_th")

///|
/// `ind_model_tybij_th`
pub fn ind_model_tybij_th() -> @kernel.Thm {
  ind_model_tybij_th_c.get()
}

///|
/// ind_model_tybij
fn step_11() -> Unit raise {
  ind_model_tybij_c.set(@class.new_type_definition("ind_model", ("mk_ind", "dest_ind"), ind_model_tybij_th()))
}

///|
let ind_model_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ind_model_tybij")

///|
/// `ind_model_tybij`
pub fn ind_model_tybij() -> @kernel.Thm {
  ind_model_tybij_c.get()
}

///|
/// inacc_tybij_th
fn step_12() -> Unit raise {
  let t13 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  inacc_tybij_th_c.set(@tactics.prove(@term_syntax.parse_term("∃ x : Num, IN(x, UNIV)"), t13))
}

///|
let inacc_tybij_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inacc_tybij_th")

///|
/// `inacc_tybij_th`
pub fn inacc_tybij_th() -> @kernel.Thm {
  inacc_tybij_th_c.get()
}

///|
/// inacc_tybij
fn step_13() -> Unit raise {
  inacc_tybij_c.set(@class.new_type_definition("I", ("mk_I", "dest_I"), inacc_tybij_th()))
}

///|
let inacc_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inacc_tybij")

///|
/// `inacc_tybij`
pub fn inacc_tybij() -> @kernel.Thm {
  inacc_tybij_c.get()
}

///|
/// I_AXIOM
fn step_14() -> Unit raise {
  let t17 = @meson.meson_tac(@list.List([inacc_tybij(), @sets.in_univ()]))
  let t16 = @simp.rewrite_tac(@list.List([@equal.gsym(@card.card_le_antisym()), @sets.le_c(), @sets.in_univ()]))
  let t15 = @simp.rewrite_tac(@list.List([@card.card_eq_refl()]))
  let t14 = @tactics.match_mp_tac(@card.card_lt_cong())
  let t18 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@card.finite_card_lt()]))), t14), t15), t16), t17)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, (op_lt_us_c : ((_) -> Bool, (I) -> Bool) -> Bool)(s, (UNIV : (I) -> Bool)) == (FINITE : ((_) -> Bool) -> Bool)(s)"), t18)
  let t23 = @meson.meson_tac(@list.List([@sets.finite_image(), @sets.not_insert_empty(), @sets.finite_rules()]))
  let t24 = @list.List([@meson.meson_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_univ(), ind_model_tybij()])), t23])
  let t22 = @tactics.subgoal_then(@term_syntax.parse_term("UNIV == IMAGE(mk_ind, select((s : (Num) -> Bool) => !(s == {}) && FINITE(s)))"), fn(x19 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s20 = @tactics.subst1_tac(x19)
    fn(x21 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s20(x21)
    }
  })
  let t25 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([lemma, @sets.finite_powerset()])), t22), t24)
  i_axiom_c.set(@tactics.prove(@term_syntax.parse_term("(op_lt_us_c : ((Ind_model) -> Bool, (I) -> Bool) -> Bool)((UNIV : (Ind_model) -> Bool), (UNIV : (I) -> Bool)) && (∀ s : (A) -> Bool, (op_lt_us_c : ((A) -> Bool, (I) -> Bool) -> Bool)(s, (UNIV : (I) -> Bool)) → (op_lt_us_c : (((A) -> Bool) -> Bool, (I) -> Bool) -> Bool)({(t : (A) -> Bool) | (SUBSET : ((A) -> Bool, (A) -> Bool) -> Bool)(t, s)}, (UNIV : (I) -> Bool)))"), t25))
}

///|
let i_axiom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_AXIOM")

///|
/// `I_AXIOM`
pub fn i_axiom() -> @kernel.Thm {
  i_axiom_c.get()
}

///|
/// I_INFINITE
fn step_15() -> Unit raise {
  let t45 = @tactics.pop_assum(fn(x42 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s43 = @tactics.mp_tac(x42)
    fn(x44 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s43(x44)
    }
  })
  let t41 = @simp.rewrite_tac(@list.List([@arith.exp(), @calc_num.arith()]))
  let t40 = @tactics.pop_assum(fn(x39 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t37 = @term_syntax.parse_term("(n : Num)")
  let t38 = @tactics.spec_tac(@term_syntax.parse_term("(CARD : ((I) -> Bool) -> Num)((UNIV : (I) -> Bool)) - 1"), t37)
  let t36 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) - 1 < (b : Num) → !(a == 0) → a <= b")))
  let t35 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) == 0) → n - 1 < n")), @arith.not_lt()]))
  let t34 = @list.List([@simp.asm_simp_tac(@list.List([@sets.card_eq_0(), @equal.gsym(@sets.member_not_empty()), @sets.in_univ()])), @tactics.all_tac])
  let t33 = @tactics.subgoal_then(@term_syntax.parse_term("!((CARD : ((I) -> Bool) -> Num)((UNIV : (I) -> Bool)) == 0)"), fn(x30 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s31 = @tactics.mp_tac(x30)
    fn(x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s31(x32)
    }
  })
  let t29 = @simp.simp_tac(@list.List([@sets.card_numseg_lt(), @sets.card_powerset(), @sets.finite_numseg_lt()]))
  let t28 = @simp.asm_simp_tac(@list.List([@card.card_lt_card(), @sets.finite_numseg_lt(), @sets.finite_powerset()]))
  let t26 = @bool.conjunct2(i_axiom())
  let t27 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("{(n : Num) | n < (CARD : ((I) -> Bool) -> Num)((UNIV : (I) -> Bool)) - 1}"), t26))
  let t46 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.infinite()])), @tactics.disch_tac), t27), t28), t29), t33), t34), t35), t36), t38), t40), @nums.induct_tac), t41), t45), @int.arith_tac)
  i_infinite_c.set(@tactics.prove(@term_syntax.parse_term("(INFINITE : ((I) -> Bool) -> Bool)((UNIV : (I) -> Bool))"), t46))
}

///|
let i_infinite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_INFINITE")

///|
/// `I_INFINITE`
pub fn i_infinite() -> @kernel.Thm {
  i_infinite_c.get()
}

///|
/// I_PAIR_EXISTS
fn step_16() -> Unit raise {
  let t55 = @meson.meson_tac(@list.List([@pair.pair()]))
  let t54 = @simp.rewrite_tac(@list.List([@sets.extension(), @card.mul_c(), @sets.in_elim_thm(), @sets.in_univ()]))
  let t53 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) == (b : Bool) → a → b")))
  let t52 = @tactics.mp_tac(@drule.match_mp(@card.card_square_infinite())(i_infinite()))
  let t51 = @tactics.match_mp_tac(@card.card_eq_imp_le())
  let t50 = @list.List([@tactics.all_tac, @simp.rewrite_tac(@list.List([@sets.le_c(), @sets.in_univ()]))])
  let t56 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(op_lt_eq_us_c : (((I, I)) -> Bool, (I) -> Bool) -> Bool)((UNIV : ((I, I)) -> Bool), (UNIV : (I) -> Bool))"), fn(x47 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s48 = @tactics.mp_tac(x47)
    fn(x49 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s48(x49)
    }
  }), t50), t51), t52), t53), @tactics.ap_thm_tac), @tactics.ap_term_tac), t54), t55)
  i_pair_exists_c.set(@tactics.prove(@term_syntax.parse_term("∃ f : ((I, I)) -> I, ∀ x : (I, I), ∀ y : (I, I), f(x) == f(y) → x == y"), t56))
}

///|
let i_pair_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_PAIR_EXISTS")

///|
/// `I_PAIR_EXISTS`
pub fn i_pair_exists() -> @kernel.Thm {
  i_pair_exists_c.get()
}

///|
/// I_PAIR
fn step_17() -> Unit raise {
  let t57 = @nums.new_specification(@list.List(["I_PAIR"]))(i_pair_exists())
  i_pair_c.set(@simp.rewrite_rule(@list.List([inj_lemma()]))(t57))
}

///|
let i_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_PAIR")

///|
/// `I_PAIR`
pub fn i_pair() -> @kernel.Thm {
  i_pair_c.get()
}

///|
/// CARD_BOOL_LT_I
fn step_18() -> Unit raise {
  let t68 = @simp.simp_tac(@list.List([@sets.finite_rules()]))
  let t67 = @meson.meson_tac(@list.List([]))
  let t69 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_univ(), @sets.in_insert()])), t67), t68])
  let t66 = @tactics.subgoal_then(@term_syntax.parse_term("UNIV == {false, true}"), fn(x63 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s64 = @tactics.subst1_tac(x63)
    fn(x65 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s64(x65)
    }
  })
  let t62 = @tactics.subgoal_then(@term_syntax.parse_term("(FINITE : ((Bool) -> Bool) -> Bool)((UNIV : (Bool) -> Bool))"), fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x60
    @meson.asm_meson_tac(@list.List([th, @card.card_le_finite()]))
  })
  let t59 = @simp.rewrite_tac(@list.List([@sets.infinite()]))
  let t58 = @tactics.mp_tac(i_infinite())
  let t70 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@card.card_not_le())])), @tactics.disch_tac), t58), t59), t62), t66), t69)
  card_bool_lt_i_c.set(@tactics.prove(@term_syntax.parse_term("(op_lt_us_c : ((Bool) -> Bool, (I) -> Bool) -> Bool)((UNIV : (Bool) -> Bool), (UNIV : (I) -> Bool))"), t70))
}

///|
let card_bool_lt_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_BOOL_LT_I")

///|
/// `CARD_BOOL_LT_I`
pub fn card_bool_lt_i() -> @kernel.Thm {
  card_bool_lt_i_c.get()
}

///|
/// I_BOOL_EXISTS
fn step_19() -> Unit raise {
  let t71 = @simp.simp_tac(@list.List([@sets.lt_c(), @sets.le_c(), @sets.in_univ()]))
  let t72 = @tactics.then_tac(@tactics.mp_tac(@drule.match_mp(@card.card_lt_imp_le())(card_bool_lt_i())), t71)
  i_bool_exists_c.set(@tactics.prove(@term_syntax.parse_term("∃ f : (Bool) -> I, ∀ x : Bool, ∀ y : Bool, f(x) == f(y) → x == y"), t72))
}

///|
let i_bool_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_BOOL_EXISTS")

///|
/// `I_BOOL_EXISTS`
pub fn i_bool_exists() -> @kernel.Thm {
  i_bool_exists_c.get()
}

///|
/// I_BOOL
fn step_20() -> Unit raise {
  let t73 = @nums.new_specification(@list.List(["I_BOOL"]))(i_bool_exists())
  i_bool_c.set(@simp.rewrite_rule(@list.List([inj_lemma()]))(t73))
}

///|
let i_bool_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_BOOL")

///|
/// `I_BOOL`
pub fn i_bool() -> @kernel.Thm {
  i_bool_c.get()
}

///|
/// I_IND_EXISTS
fn step_21() -> Unit raise {
  let t74 = @simp.simp_tac(@list.List([@sets.lt_c(), @sets.le_c(), @sets.in_univ()]))
  let t75 = @tactics.then_tac(@tactics.mp_tac(@bool.conjunct1(i_axiom())), t74)
  i_ind_exists_c.set(@tactics.prove(@term_syntax.parse_term("∃ f : (Ind_model) -> I, ∀ x : Ind_model, ∀ y : Ind_model, f(x) == f(y) → x == y"), t75))
}

///|
let i_ind_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_IND_EXISTS")

///|
/// `I_IND_EXISTS`
pub fn i_ind_exists() -> @kernel.Thm {
  i_ind_exists_c.get()
}

///|
/// I_IND
fn step_22() -> Unit raise {
  let t76 = @nums.new_specification(@list.List(["I_IND"]))(i_ind_exists())
  i_ind_c.set(@simp.rewrite_rule(@list.List([inj_lemma()]))(t76))
}

///|
let i_ind_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_IND")

///|
/// `I_IND`
pub fn i_ind() -> @kernel.Thm {
  i_ind_c.get()
}

///|
/// I_SET_EXISTS
fn step_23() -> Unit raise {
  let t88 = @simp.rewrite_tac(@list.List([@sets.le_c(), @sets.in_univ(), @sets.in_elim_thm()]))
  let t85 = @drule.match_mp(@card.card_lt_imp_le())
  let t87 = @tactics.disch_then(fn(x86 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x82 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s83 = @tactics.mp_tac(x82)
      fn(x84 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s83(x84)
      }
    })(t85(x86))
  })
  let t80 = @drule.match_mp(@bool.conjunct2(i_axiom()))
  let t89 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x81 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x77 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s78 = @tactics.mp_tac(x77)
      fn(x79 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s78(x79)
      }
    })(t80(x81))
  })), t87), t88)
  i_set_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (I) -> Bool, (op_lt_us_c : ((I) -> Bool, (I) -> Bool) -> Bool)(s, (UNIV : (I) -> Bool)) → (∃ f : ((I) -> Bool) -> I, ∀ t : (I) -> Bool, ∀ u : (I) -> Bool, (SUBSET : ((I) -> Bool, (I) -> Bool) -> Bool)(t, s) && (SUBSET : ((I) -> Bool, (I) -> Bool) -> Bool)(u, s) && f(t) == f(u) → t == u)"), t89))
}

///|
let i_set_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_SET_EXISTS")

///|
/// `I_SET_EXISTS`
pub fn i_set_exists() -> @kernel.Thm {
  i_set_exists_c.get()
}

///|
/// I_SET
fn step_24() -> Unit raise {
  let t90 = @simp.rewrite_rule(@list.List([@class.right_imp_exists_thm(), @class.skolem_thm()]))(i_set_exists())
  i_set_c.set(@nums.new_specification(@list.List(["I_SET"]))(t90))
}

///|
let i_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_SET")

///|
/// `I_SET`
pub fn i_set() -> @kernel.Thm {
  i_set_c.get()
}

///|
let setlevel_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("setlevel_INDUCT")

///|
/// `setlevel_INDUCT`
pub fn setlevel_induct() -> @kernel.Thm {
  setlevel_induct_c.get()
}

///|
let setlevel_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("setlevel_RECURSION")

///|
/// `setlevel_RECURSION`
pub fn setlevel_recursion() -> @kernel.Thm {
  setlevel_recursion_c.get()
}

///|
/// setlevel_INDUCT, setlevel_RECURSION
fn step_25() -> Unit raise {
  let (setlevel_induct, setlevel_recursion) = @ind_types.define_type("setlevel = Ur_bool\n           | Ur_ind\n           | Powerset setlevel\n           | Cartprod setlevel setlevel")
  setlevel_induct_c.set(setlevel_induct)
  setlevel_recursion_c.set(setlevel_recursion)
}

///|
/// setlevel_DISTINCT
fn step_26() -> Unit raise {
  setlevel_distinct_c.set(@ind_types.distinctness("setlevel"))
}

///|
let setlevel_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("setlevel_DISTINCT")

///|
/// `setlevel_DISTINCT`
pub fn setlevel_distinct() -> @kernel.Thm {
  setlevel_distinct_c.get()
}

///|
/// setlevel_INJ
fn step_27() -> Unit raise {
  setlevel_inj_c.set(@ind_types.injectivity("setlevel"))
}

///|
let setlevel_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("setlevel_INJ")

///|
/// `setlevel_INJ`
pub fn setlevel_inj() -> @kernel.Thm {
  setlevel_inj_c.get()
}

///|
/// setlevel
fn step_28() -> Unit raise {
  let t91 = @term_syntax.parse_term("(setlevel : (Setlevel, I) -> Bool)(Ur_bool) == IMAGE(I_BOOL, UNIV) && setlevel(Ur_ind) == IMAGE(I_IND, UNIV) && setlevel(Cartprod((l1 : Setlevel), (l2 : Setlevel))) == IMAGE(I_PAIR, {((x : I), (y : I)) | IN(x, setlevel(l1)) && IN(y, setlevel(l2))}) && setlevel(Powerset((l : Setlevel))) == IMAGE(I_SET(setlevel(l)), {(s : (I) -> Bool) | SUBSET(s, setlevel(l))})")
  setlevel_c.set(@recursion.new_recursive_definition(setlevel_recursion())(t91))
}

///|
let setlevel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("setlevel")

///|
/// `setlevel`
pub fn setlevel() -> @kernel.Thm {
  setlevel_c.get()
}

///|
/// SETLEVEL_CARD
fn step_29() -> Unit raise {
  let t108 = @simp.asm_simp_tac(@list.List([@card.card_mul_lt_infinite(), i_infinite(), @equal.gsym(@card.mul_c()), @card.card_le_image()]))
  let t106 = @term_syntax.parse_term("op_star_us_c(setlevel((l1 : Setlevel)), setlevel((l2 : Setlevel)))")
  let t107 = @tactics.trans_tac(@card.card_let_trans())(t106)
  let t104 = @term_syntax.parse_term("(l2 : Setlevel)")
  let t105 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(l1 : Setlevel)"), t104]))
  let t100 = @simp.asm_simp_tac(@list.List([i_axiom(), @card.card_le_image()]))
  let t98 = @term_syntax.parse_term("{(s : (I) -> Bool) | SUBSET(s, setlevel((l : Setlevel)))}")
  let t99 = @tactics.trans_tac(@card.card_let_trans())(t98)
  let t101 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(l : Setlevel)")), @tactics.disch_tac), t99), t100)
  let t97 = @simp.rewrite_tac(@list.List([@card.card_le_image(), i_axiom()]))
  let t96 = @term_syntax.parse_term("(UNIV : (Ind_model) -> Bool)")
  let t102 = @tactics.then_tac(@tactics.trans_tac(@card.card_let_trans())(t96), t97)
  let t95 = @simp.rewrite_tac(@list.List([@card.card_le_image(), card_bool_lt_i()]))
  let t94 = @term_syntax.parse_term("(UNIV : (Bool) -> Bool)")
  let t103 = @list.List([@tactics.then_tac(@tactics.trans_tac(@card.card_let_trans())(t94), t95), t102, t101, @tactics.all_tac])
  let t93 = @tactics.repeat_tac(@tactics.conj_tac)
  let t92 = @simp.rewrite_tac(@list.List([setlevel()]))
  let t109 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(setlevel_induct()), t92), t93), t103), t105), @tactics.strip_tac), t107), t108)
  setlevel_card_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Setlevel, (op_lt_us_c : ((I) -> Bool, (I) -> Bool) -> Bool)(setlevel(l), (UNIV : (I) -> Bool))"), t109))
}

///|
let setlevel_card_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETLEVEL_CARD")

///|
/// `SETLEVEL_CARD`
pub fn setlevel_card() -> @kernel.Thm {
  setlevel_card_c.get()
}

///|
/// I_SET_SETLEVEL
fn step_30() -> Unit raise {
  let t110 = @meson.meson_tac(@list.List([setlevel_card(), i_set()]))
  i_set_setlevel_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Setlevel, ∀ s : (I) -> Bool, ∀ t : (I) -> Bool, SUBSET(s, setlevel(l)) && SUBSET(t, setlevel(l)) && I_SET(setlevel(l), s) == I_SET(setlevel(l), t) → s == t"), t110))
}

///|
let i_set_setlevel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("I_SET_SETLEVEL")

///|
/// `I_SET_SETLEVEL`
pub fn i_set_setlevel() -> @kernel.Thm {
  i_set_setlevel_c.get()
}

///|
/// universe
fn step_31() -> Unit raise {
  universe_c.set(@pair.new_definition(@term_syntax.parse_term("(universe : ((Setlevel, I)) -> Bool) == {((t : Setlevel), (x : I)) | IN(x, setlevel(t))}")))
}

///|
let universe_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("universe")

///|
/// `universe`
pub fn universe() -> @kernel.Thm {
  universe_c.get()
}

///|
/// v_tybij_th
fn step_32() -> Unit raise {
  let t112 = @meson.meson_tac(@list.List([]))
  let t111 = @simp.rewrite_tac(@list.List([universe(), @sets.in_elim_thm(), @pair.pair_eq(), @theorems.conj_assoc(), @simp.once_rewrite_rule(@list.List([@theorems.conj_sym()]))(@theorems.unwind_thm1()), setlevel(), @sets.in_image(), @sets.in_univ()]))
  let t113 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(Ur_bool, I_BOOL(true))")), t111), t112)
  v_tybij_th_c.set(@tactics.prove(@term_syntax.parse_term("∃ a : (Setlevel, I), IN(a, universe)"), t113))
}

///|
let v_tybij_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("v_tybij_th")

///|
/// `v_tybij_th`
pub fn v_tybij_th() -> @kernel.Thm {
  v_tybij_th_c.get()
}

///|
/// v_tybij
fn step_33() -> Unit raise {
  v_tybij_c.set(@class.new_type_definition("V", ("mk_V", "dest_V"), v_tybij_th()))
}

///|
let v_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("v_tybij")

///|
/// `v_tybij`
pub fn v_tybij() -> @kernel.Thm {
  v_tybij_c.get()
}

///|
/// V_TYBIJ
fn step_34() -> Unit raise {
  let t115 = @meson.meson_tac(@list.List([]))
  let t114 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), universe(), @pair.forall_pair_thm(), @pair.pair_eq()]))
  let t116 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct2(v_tybij()))])), t114), t115)
  v_tybij_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Setlevel, ∀ e : I, IN(e, setlevel(l)) == (dest_V(mk_V((l, e))) == (l, e))"), t116))
}

///|
let v_tybij_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("V_TYBIJ")

///|
/// `V_TYBIJ`
pub fn v_tybij_v1() -> @kernel.Thm {
  v_tybij_v1_c.get()
}

///|
/// droplevel
fn step_35() -> Unit raise {
  let t117 = @term_syntax.parse_term("(droplevel : (Setlevel) -> Setlevel)(Powerset((l : Setlevel))) == l")
  droplevel_c.set(@recursion.new_recursive_definition(setlevel_recursion())(t117))
}

///|
let droplevel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("droplevel")

///|
/// `droplevel`
pub fn droplevel() -> @kernel.Thm {
  droplevel_c.get()
}

///|
/// isasetlevel
fn step_36() -> Unit raise {
  let t118 = @term_syntax.parse_term("(isasetlevel : (Setlevel) -> Bool)(Ur_bool) == false && isasetlevel(Ur_ind) == false && isasetlevel(Cartprod((l1 : Setlevel), (l2 : Setlevel))) == false && isasetlevel(Powerset((l : Setlevel))) == true")
  isasetlevel_c.set(@recursion.new_recursive_definition(setlevel_recursion())(t118))
}

///|
let isasetlevel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("isasetlevel")

///|
/// `isasetlevel`
pub fn isasetlevel() -> @kernel.Thm {
  isasetlevel_c.get()
}

///|
/// level
fn step_37() -> Unit raise {
  level_c.set(@pair.new_definition(@term_syntax.parse_term("(level : (V) -> Setlevel)((x : V)) == FST(dest_V(x))")))
}

///|
let level_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("level")

///|
/// `level`
pub fn level() -> @kernel.Thm {
  level_c.get()
}

///|
/// element
fn step_38() -> Unit raise {
  element_c.set(@pair.new_definition(@term_syntax.parse_term("(element : (V) -> I)((x : V)) == SND(dest_V(x))")))
}

///|
let element_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("element")

///|
/// `element`
pub fn element() -> @kernel.Thm {
  element_c.get()
}

///|
/// ELEMENT_IN_LEVEL
fn step_39() -> Unit raise {
  let t119 = @simp.rewrite_tac(@list.List([v_tybij_v1(), v_tybij(), level(), element(), @pair.pair()]))
  element_in_level_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : V, IN(element(x), setlevel(level(x)))"), t119))
}

///|
let element_in_level_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ELEMENT_IN_LEVEL")

///|
/// `ELEMENT_IN_LEVEL`
pub fn element_in_level() -> @kernel.Thm {
  element_in_level_c.get()
}

///|
/// SET
fn step_40() -> Unit raise {
  let t120 = @simp.rewrite_tac(@list.List([level(), element(), @pair.pair(), v_tybij()]))
  set_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : V, mk_V((level(x), element(x))) == x"), t120))
}

///|
let set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SET")

///|
/// `SET`
pub fn set() -> @kernel.Thm {
  set_c.get()
}

///|
/// set
fn step_41() -> Unit raise {
  set_v1_c.set(@pair.new_definition(@term_syntax.parse_term("(set : (V, I) -> Bool)((x : V)) == select((s : (I) -> Bool) => SUBSET(s, setlevel(droplevel(level(x)))) && I_SET(setlevel(droplevel(level(x))), s) == element(x))")))
}

///|
let set_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("set")

///|
/// `set`
pub fn set_v1() -> @kernel.Thm {
  set_v1_c.get()
}

///|
/// isaset
fn step_42() -> Unit raise {
  isaset_c.set(@pair.new_definition(@term_syntax.parse_term("(isaset : (V) -> Bool)((x : V)) == (∃ l : Setlevel, level(x) == Powerset(l))")))
}

///|
let isaset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("isaset")

///|
/// `isaset`
pub fn isaset() -> @kernel.Thm {
  isaset_c.get()
}

///|
/// Model/modelset.ml:303
fn step_43() -> Unit raise {
  @printer.parse_as_infix("<:", (11L, "right"))
}

///|
/// inset
fn step_44() -> Unit raise {
  inset_c.set(@pair.new_definition(@term_syntax.parse_term("(op_lt_colon : (V, V) -> Bool)((x : V), (s : V)) == (level(s) == Powerset(level(x)) && IN(element(x), set(s)))")))
}

///|
let inset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("inset")

///|
/// `inset`
pub fn inset() -> @kernel.Thm {
  inset_c.get()
}

///|
/// Model/modelset.ml:308
fn step_45() -> Unit raise {
  @printer.parse_as_infix("<=:", (12L, "right"))
}

///|
/// subset_def
fn step_46() -> Unit raise {
  subset_def_c.set(@pair.new_definition(@term_syntax.parse_term("(op_lt_eq_colon : (V, V) -> Bool)((s : V), (t : V)) == (level(s) == level(t) && (∀ x : V, op_lt_colon(x, s) → op_lt_colon(x, t)))")))
}

///|
let subset_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("subset_def")

///|
/// `subset_def`
pub fn subset_def() -> @kernel.Thm {
  subset_def_c.get()
}

///|
/// MEMBERS_ISASET
fn step_47() -> Unit raise {
  let t121 = @meson.meson_tac(@list.List([]))
  let t122 = @tactics.then_tac(@simp.rewrite_tac(@list.List([inset(), isaset()])), t121)
  members_isaset_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : V, ∀ s : V, op_lt_colon(x, s) → isaset(s)"), t122))
}

///|
let members_isaset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEMBERS_ISASET")

///|
/// `MEMBERS_ISASET`
pub fn members_isaset() -> @kernel.Thm {
  members_isaset_c.get()
}

///|
/// LEVEL_NONEMPTY
fn step_48() -> Unit raise {
  let t127 = @meson.meson_tac(@list.List([@sets.empty_subset()]))
  let t126 = @simp.rewrite_tac(@list.List([@pair.exists_pair_thm(), @sets.in_elim_thm()]))
  let t125 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_univ()]))
  let t124 = @simp.rewrite_tac(@list.List([setlevel(), @sets.image_eq_empty()]))
  let t123 = @tactics.match_mp_tac(setlevel_induct())
  let t128 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.member_not_empty()])), t123), t124), t125), t126), t127)
  level_nonempty_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Setlevel, ∃ x : I, IN(x, setlevel(l))"), t128))
}

///|
let level_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEVEL_NONEMPTY")

///|
/// `LEVEL_NONEMPTY`
pub fn level_nonempty() -> @kernel.Thm {
  level_nonempty_c.get()
}

///|
/// LEVEL_SET_EXISTS
fn step_49() -> Unit raise {
  let t131 = @meson.meson_tac(@list.List([@pair.fst(), @pair.pair(), v_tybij_v1()]))
  let t130 = @simp.rewrite_tac(@list.List([level()]))
  let t129 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t132 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(level_nonempty()), t129), t130), t131)
  level_set_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Setlevel, ∃ s : V, level(s) == l"), t132))
}

///|
let level_set_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEVEL_SET_EXISTS")

///|
/// `LEVEL_SET_EXISTS`
pub fn level_set_exists() -> @kernel.Thm {
  level_set_exists_c.get()
}

///|
/// MK_V_CLAUSES
fn step_50() -> Unit raise {
  let t133 = @simp.rewrite_tac(@list.List([level(), element(), @pair.pair(), @equal.gsym(@pair.pair_eq()), v_tybij_v1()]))
  mk_v_clauses_c.set(@tactics.prove(@term_syntax.parse_term("IN((e : I), setlevel((l : Setlevel))) → level(mk_V((l, e))) == l && element(mk_V((l, e))) == e"), t133))
}

///|
let mk_v_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MK_V_CLAUSES")

///|
/// `MK_V_CLAUSES`
pub fn mk_v_clauses() -> @kernel.Thm {
  mk_v_clauses_c.get()
}

///|
/// MK_V_SET
fn step_51() -> Unit raise {
  let t150 = @meson.asm_meson_tac(@list.List([i_set_setlevel()]))
  let t149 = @simp.rewrite_tac(@list.List([]))
  let t148 = @tactics.match_mp_tac(@class.select_unique())
  let t147 = @simp.asm_simp_tac(@list.List([mk_v_clauses(), droplevel()]))
  let t145 = @meson.asm_meson_tac(@list.List([]))
  let t146 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([setlevel(), @sets.in_image(), @sets.in_elim_thm()])), t145), @tactics.all_tac])
  let t144 = @tactics.subgoal_then(@term_syntax.parse_term("IN(I_SET(setlevel((l : Setlevel)), (s : (I) -> Bool)), setlevel(Powerset(l)))"), fn(x141 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s142 = @tactics.assume_tac(x141)
    fn(x143 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s142(x143)
    }
  })
  let t140 = @simp.asm_simp_tac(@list.List([mk_v_clauses(), set_v1()]))
  let t138 = @meson.asm_meson_tac(@list.List([]))
  let t139 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([setlevel(), @sets.in_image(), @sets.in_elim_thm()])), t138), @tactics.all_tac])
  let t137 = @tactics.subgoal_then(@term_syntax.parse_term("IN(I_SET(setlevel((l : Setlevel)), (s : (I) -> Bool)), setlevel(Powerset(l)))"), fn(x134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s135 = @tactics.assume_tac(x134)
    fn(x136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s135(x136)
    }
  })
  let t151 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t137), t139), t140), t144), t146), t147), t148), t149), t150)
  mk_v_set_c.set(@tactics.prove(@term_syntax.parse_term("SUBSET((s : (I) -> Bool), setlevel((l : Setlevel))) → set(mk_V((Powerset(l), I_SET(setlevel(l), s)))) == s && level(mk_V((Powerset(l), I_SET(setlevel(l), s)))) == Powerset(l) && element(mk_V((Powerset(l), I_SET(setlevel(l), s)))) == I_SET(setlevel(l), s)"), t151))
}

///|
let mk_v_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MK_V_SET")

///|
/// `MK_V_SET`
pub fn mk_v_set() -> @kernel.Thm {
  mk_v_set_c.get()
}

///|
/// EMPTY_EXISTS
fn step_52() -> Unit raise {
  let t158 = @meson.meson_tac(@list.List([level_set_exists(), members_isaset(), isaset(), setlevel_distinct()]))
  let t156 = @simp.simp_tac(@list.List([inset(), mk_v_clauses(), mk_v_set(), @sets.empty_subset(), @sets.not_in_empty()]))
  let t155 = @tactics.exists_tac(@term_syntax.parse_term("mk_V((Powerset((l : Setlevel)), I_SET(setlevel(l), {})))"))
  let t154 = @tactics.disch_then(fn(x153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t157 = @list.List([@tactics.all_tac, @tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(l : Setlevel)")), t154), t155), t156), @tactics.all_tac])
  let t152 = @tactics.repeat_tac(@tactics.conj_tac)
  let t159 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(setlevel_induct()), t152), t157), t158)
  empty_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Setlevel, ∃ s : V, level(s) == l && (∀ x : V, !op_lt_colon(x, s))"), t159))
}

///|
let empty_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EMPTY_EXISTS")

///|
/// `EMPTY_EXISTS`
pub fn empty_exists() -> @kernel.Thm {
  empty_exists_c.get()
}

///|
/// EMPTY_SET
fn step_53() -> Unit raise {
  let t160 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(empty_exists())
  empty_set_c.set(@nums.new_specification(@list.List(["emptyset"]))(t160))
}

///|
let empty_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EMPTY_SET")

///|
/// `EMPTY_SET`
pub fn empty_set() -> @kernel.Thm {
  empty_set_c.get()
}

///|
/// COMPREHENSION_EXISTS
fn step_54() -> Unit raise {
  let t182 = @meson.asm_meson_tac(@list.List([set(), mk_v_set()]))
  let t181 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t180 = @simp.rewrite_tac(@list.List([setlevel_inj()]))
  let t179 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : V)"))
  let t178 = @simp.asm_simp_tac(@list.List([mk_v_set(), inset()]))
  let t176 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t177 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()])), t176), @tactics.all_tac])
  let t175 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET({(i : I) | IN(i, (u : (I) -> Bool)) && (p : (V) -> Bool)(mk_V(((l : Setlevel), i)))}, setlevel(l))"), fn(x172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s173 = @tactics.assume_tac(x172)
    fn(x174 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s173(x174)
    }
  })
  let t171 = @tactics.exists_tac(@term_syntax.parse_term("mk_V((Powerset((l : Setlevel)), I_SET(setlevel(l), {(i : I) | IN(i, (u : (I) -> Bool)) && (p : (V) -> Bool)(mk_V((l, i)))})))"))
  let t170 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : (I) -> Bool)"))(@tactics.strip_assume_tac))
  let t169 = @simp.asm_rewrite_tac(@list.List([setlevel(), @sets.in_image(), @sets.in_elim_thm()]))
  let t168 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : V)"), element_in_level()))
  let t165 = @simp.rewrite_rule(@list.List([isaset()]))
  let t163 = @term_syntax.parse_term("(l : Setlevel)")
  let t167 = @tactics.pop_assum(fn(x166 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x164 : @kernel.Thm) => @tactics.x_choose_tac(t163, x164))(t165(x166))
  })
  let t162 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([members_isaset()]))])
  let t161 = @class.asm_cases_tac(@term_syntax.parse_term("isaset((s : V))"))
  let t183 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t161), t162), t167), t168), t169), t170), t171), t175), t177), t178), t179), t180), t181), t182)
  comprehension_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, ∀ p : (V) -> Bool, ∃ t : V, level(t) == level(s) && (∀ x : V, op_lt_colon(x, t) == (op_lt_colon(x, s) && p(x)))"), t183))
}

///|
let comprehension_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPREHENSION_EXISTS")

///|
/// `COMPREHENSION_EXISTS`
pub fn comprehension_exists() -> @kernel.Thm {
  comprehension_exists_c.get()
}

///|
/// Model/modelset.ml:402
fn step_55() -> Unit raise {
  @printer.parse_as_infix("suchthat", (21L, "left"))
}

///|
/// SUCHTHAT
fn step_56() -> Unit raise {
  let t184 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(comprehension_exists())
  suchthat_c.set(@nums.new_specification(@list.List(["suchthat"]))(t184))
}

///|
let suchthat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUCHTHAT")

///|
/// `SUCHTHAT`
pub fn suchthat() -> @kernel.Thm {
  suchthat_c.get()
}

///|
/// SETLEVEL_EXISTS
fn step_57() -> Unit raise {
  let t186 = @meson.meson_tac(@list.List([]))
  let t185 = @simp.simp_tac(@list.List([mk_v_set(), @sets.subset_refl(), inset(), setlevel_inj()]))
  let t187 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.exists_tac(@term_syntax.parse_term("mk_V((Powerset((l : Setlevel)), I_SET(setlevel(l), setlevel(l))))"))), t185), t186)
  setlevel_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Setlevel, ∃ s : V, level(s) == Powerset(l) && (∀ x : V, op_lt_colon(x, s) == (level(x) == l && IN(element(x), setlevel(l))))"), t187))
}

///|
let setlevel_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETLEVEL_EXISTS")

///|
/// `SETLEVEL_EXISTS`
pub fn setlevel_exists() -> @kernel.Thm {
  setlevel_exists_c.get()
}

///|
/// SET_DECOMP
fn step_58() -> Unit raise {
  let t197 = @meson.meson_tac(@list.List([]))
  let t196 = @simp.asm_rewrite_tac(@list.List([setlevel(), @sets.in_image(), @sets.in_elim_thm()]))
  let t195 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : V)"), element_in_level()))
  let t194 = @simp.asm_rewrite_tac(@list.List([setlevel(), droplevel()]))
  let t193 = @tactics.conv_tac(@class.select_conv)
  let t192 = @simp.rewrite_tac(@list.List([set_v1()]))
  let t189 = @term_syntax.parse_term("(l : Setlevel)")
  let t191 = @tactics.disch_then((x190 : @kernel.Thm) => @tactics.x_choose_tac(t189, x190))
  let t188 = @simp.rewrite_tac(@list.List([isaset()]))
  let t198 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t188), t191), t192), t193), t194), t195), t196), t197)
  set_decomp_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, isaset(s) → SUBSET(set(s), setlevel(droplevel(level(s)))) && I_SET(setlevel(droplevel(level(s))), set(s)) == element(s)"), t198))
}

///|
let set_decomp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SET_DECOMP")

///|
/// `SET_DECOMP`
pub fn set_decomp() -> @kernel.Thm {
  set_decomp_c.get()
}

///|
/// SET_SUBSET_SETLEVEL
fn step_59() -> Unit raise {
  let t199 = @meson.meson_tac(@list.List([set_decomp()]))
  set_subset_setlevel_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, isaset(s) → SUBSET(set(s), setlevel(droplevel(level(s))))"), t199))
}

///|
let set_subset_setlevel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SET_SUBSET_SETLEVEL")

///|
/// `SET_SUBSET_SETLEVEL`
pub fn set_subset_setlevel() -> @kernel.Thm {
  set_subset_setlevel_c.get()
}

///|
/// POWERSET_EXISTS
fn step_60() -> Unit raise {
  let t226 = @meson.asm_meson_tac(@list.List([element_in_level(), members_isaset(), isaset()]))
  let t225 = @simp.asm_rewrite_tac(@list.List([subset_def()]))
  let t224 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : V)"))
  let t223 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t227 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("level((s : V))"), setlevel_exists())), t223), t224), @tactics.strip_tac), t225), t226)
  let t222 = @meson.asm_meson_tac(@list.List([element_in_level()]))
  let t221 = @simp.asm_rewrite_tac(@list.List([subset_def()]))
  let t220 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : V)"))
  let t219 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t217 = @term_syntax.parse_term("(v : V) => ∀ x : V, op_lt_colon(x, v) → op_lt_colon(x, (s : V))")
  let t218 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(t : V)"), t217]), comprehension_exists()))
  let t215 = @bool.spec(@term_syntax.parse_term("Powerset((l : Setlevel))"), setlevel_exists())
  let t216 = @tactics.x_choose_then(@term_syntax.parse_term("(t : V)"))(@tactics.strip_assume_tac)(t215)
  let t214 = @simp.asm_rewrite_tac(@list.List([droplevel()]))
  let t213 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(l : Setlevel)"))(@tactics.strip_assume_tac))
  let t210 = @simp.gen_rewrite_rule(fn(x209 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x209
  }, @list.List([isaset()]))
  let t212 = @tactics.first_assum(fn(x211 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x206 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s207 = @tactics.mp_tac(x206)
      fn(x208 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s207(x208)
      }
    })(t210(x211))
  })
  let t204 = @drule.match_mp(set_decomp())
  let t228 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x203 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x200 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s201 = @tactics.mp_tac(x200)
        fn(x202 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s201(x202)
        }
      })(@equal.gsym(x203))
    })(t204(x205))
  }), t212), t213), t214), @tactics.strip_tac), t216), t218), t219), t220), @tactics.strip_tac), t221), t222), t227])
  let t229 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("isaset((s : V))"))), t228)
  powerset_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, ∃ t : V, level(t) == Powerset(level(s)) && (∀ x : V, op_lt_colon(x, t) == op_lt_eq_colon(x, s))"), t229))
}

///|
let powerset_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POWERSET_EXISTS")

///|
/// `POWERSET_EXISTS`
pub fn powerset_exists() -> @kernel.Thm {
  powerset_exists_c.get()
}

///|
/// POWERSET
fn step_61() -> Unit raise {
  let t230 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(powerset_exists())
  powerset_c.set(@nums.new_specification(@list.List(["powerset"]))(t230))
}

///|
let powerset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POWERSET")

///|
/// `POWERSET`
pub fn powerset() -> @kernel.Thm {
  powerset_c.get()
}

///|
/// pair
fn step_62() -> Unit raise {
  pair_c.set(@pair.new_definition(@term_syntax.parse_term("(pair : (V, V) -> V)((x : V), (y : V)) == mk_V((Cartprod(level(x), level(y)), I_PAIR((element(x), element(y)))))")))
}

///|
let pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pair")

///|
/// `pair`
pub fn pair() -> @kernel.Thm {
  pair_c.get()
}

///|
/// PAIR_IN_LEVEL
fn step_63() -> Unit raise {
  let t231 = @meson.meson_tac(@list.List([]))
  let t232 = @tactics.then_tac(@simp.rewrite_tac(@list.List([setlevel(), @sets.in_image(), @sets.in_elim_thm()])), t231)
  pair_in_level_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : I, ∀ y : I, ∀ l : Setlevel, ∀ m : Setlevel, IN(x, setlevel(l)) && IN(y, setlevel(m)) → IN(I_PAIR((x, y)), setlevel(Cartprod(l, m)))"), t232))
}

///|
let pair_in_level_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIR_IN_LEVEL")

///|
/// `PAIR_IN_LEVEL`
pub fn pair_in_level() -> @kernel.Thm {
  pair_in_level_c.get()
}

///|
/// DEST_MK_PAIR
fn step_64() -> Unit raise {
  let t233 = @simp.simp_tac(@list.List([pair_in_level(), element_in_level()]))
  let t234 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(v_tybij_v1())])), t233)
  dest_mk_pair_c.set(@tactics.prove(@term_syntax.parse_term("dest_V(mk_V((Cartprod(level((x : V)), level((y : V))), I_PAIR((element(x), element(y)))))) == (Cartprod(level(x), level(y)), I_PAIR((element(x), element(y))))"), t234))
}

///|
let dest_mk_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_MK_PAIR")

///|
/// `DEST_MK_PAIR`
pub fn dest_mk_pair() -> @kernel.Thm {
  dest_mk_pair_c.get()
}

///|
/// PAIR_INJ
fn step_65() -> Unit raise {
  let t247 = @meson.meson_tac(@list.List([@pair.pair(), @bool.conjunct1(v_tybij())]))
  let t246 = @simp.rewrite_tac(@list.List([level(), element()]))
  let t245 = @simp.rewrite_tac(@list.List([setlevel_inj(), @pair.pair_eq(), i_pair()]))
  let t244 = @simp.rewrite_tac(@list.List([dest_mk_pair()]))
  let t240 = @term_syntax.parse_term("dest_V")
  let t243 = @tactics.disch_then(fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s238 = @tactics.mp_tac(x237)
      fn(x239 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s238(x239)
      }
    })(((x241 : @kernel.Thm) => @equal.ap_term(t240, x241))(x242))
  })
  let t236 = @simp.rewrite_tac(@list.List([pair()]))
  let t235 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([]))])
  let t248 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t235), t236), t243), t244), t245), t246), t247)
  pair_inj_c.set(@tactics.prove(@term_syntax.parse_term("∀ x1 : V, ∀ y1 : V, ∀ x2 : V, ∀ y2 : V, (pair(x1, y1) == pair(x2, y2)) == (x1 == x2 && y1 == y2)"), t248))
}

///|
let pair_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIR_INJ")

///|
/// `PAIR_INJ`
pub fn pair_inj() -> @kernel.Thm {
  pair_inj_c.get()
}

///|
/// LEVEL_PAIR
fn step_66() -> Unit raise {
  let t249 = @bool.spec_all(pair())
  let t250 = @equal.ap_term(@term_syntax.parse_term("dest_V"), t249)
  let t251 = @simp.rewrite_tac(@list.List([level(), @simp.rewrite_rule(@list.List([dest_mk_pair()]))(t250)]))
  level_pair_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : V, ∀ y : V, level(pair(x, y)) == Cartprod(level(x), level(y))"), t251))
}

///|
let level_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEVEL_PAIR")

///|
/// `LEVEL_PAIR`
pub fn level_pair() -> @kernel.Thm {
  level_pair_c.get()
}

///|
/// fst_def
fn step_67() -> Unit raise {
  fst_def_c.set(@pair.new_definition(@term_syntax.parse_term("(fst : (V) -> V)((p : V)) == select((x : V) => ∃ y : V, p == pair(x, y))")))
}

///|
let fst_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("fst_def")

///|
/// `fst_def`
pub fn fst_def() -> @kernel.Thm {
  fst_def_c.get()
}

///|
/// snd_def
fn step_68() -> Unit raise {
  snd_def_c.set(@pair.new_definition(@term_syntax.parse_term("(snd : (V) -> V)((p : V)) == select((y : V) => ∃ x : V, p == pair(x, y))")))
}

///|
let snd_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("snd_def")

///|
/// `snd_def`
pub fn snd_def() -> @kernel.Thm {
  snd_def_c.get()
}

///|
/// PAIR_CLAUSES
fn step_69() -> Unit raise {
  let t252 = @meson.meson_tac(@list.List([pair_inj()]))
  let t253 = @tactics.then_tac(@simp.rewrite_tac(@list.List([fst_def(), snd_def()])), t252)
  pair_clauses_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : V, ∀ y : V, fst(pair(x, y)) == x && snd(pair(x, y)) == y"), t253))
}

///|
let pair_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIR_CLAUSES")

///|
/// `PAIR_CLAUSES`
pub fn pair_clauses() -> @kernel.Thm {
  pair_clauses_c.get()
}

///|
/// CARTESIAN_EXISTS
fn step_70() -> Unit raise {
  let t274 = @meson.asm_meson_tac(@list.List([inset(), setlevel_inj()]))
  let t273 = @simp.asm_rewrite_tac(@list.List([level_pair()]))
  let t272 = @list.List([@meson.meson_tac(@list.List([element_in_level()])), @tactics.all_tac])
  let t271 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) && ((c : Bool) → a) → ((a && b) && c) == c")))
  let t270 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : V)"))
  let t269 = @simp.asm_rewrite_tac(@list.List([]))
  let t268 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : V)"))
  let t267 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t265 = @term_syntax.parse_term("(z : V) => ∃ x : V, ∃ y : V, z == pair(x, y) && op_lt_colon(x, (s : V)) && op_lt_colon(y, (t : V))")
  let t266 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(u : V)"), t265]), comprehension_exists()))
  let t264 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : V)"))(@tactics.strip_assume_tac))
  let t263 = @simp.asm_rewrite_tac(@list.List([droplevel()]))
  let t262 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Cartprod((l : Setlevel), (m : Setlevel))"), setlevel_exists()))
  let t261 = @list.List([@meson.asm_meson_tac(@list.List([isaset()])), @tactics.all_tac])
  let t260 = @tactics.subgoal_then(@term_syntax.parse_term("∃ m : Setlevel, level((t : V)) == Powerset(m)"), @tactics.choose_tac)
  let t259 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([empty_exists(), members_isaset()]))])
  let t258 = @class.asm_cases_tac(@term_syntax.parse_term("isaset((t : V))"))
  let t257 = @list.List([@meson.asm_meson_tac(@list.List([isaset()])), @tactics.all_tac])
  let t256 = @tactics.subgoal_then(@term_syntax.parse_term("∃ l : Setlevel, level((s : V)) == Powerset(l)"), @tactics.choose_tac)
  let t255 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([empty_exists(), members_isaset()]))])
  let t254 = @class.asm_cases_tac(@term_syntax.parse_term("isaset((s : V))"))
  let t275 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t254), t255), t256), t257), t258), t259), t260), t261), t262), t263), t264), t266), t267), t268), @tactics.strip_tac), t269), t270), t271), @tactics.conj_tac), t272), @tactics.strip_tac), t273), @tactics.binop_tac), t274)
  cartesian_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, ∀ t : V, ∃ u : V, level(u) == Powerset(Cartprod(droplevel(level(s)), droplevel(level(t)))) && (∀ z : V, op_lt_colon(z, u) == (∃ x : V, ∃ y : V, z == pair(x, y) && op_lt_colon(x, s) && op_lt_colon(y, t)))"), t275))
}

///|
let cartesian_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARTESIAN_EXISTS")

///|
/// `CARTESIAN_EXISTS`
pub fn cartesian_exists() -> @kernel.Thm {
  cartesian_exists_c.get()
}

///|
/// CARTPRODUCT
fn step_71() -> Unit raise {
  let t276 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(cartesian_exists())
  cartproduct_c.set(@nums.new_specification(@list.List(["cartproduct"]))(t276))
}

///|
let cartproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARTPRODUCT")

///|
/// `CARTPRODUCT`
pub fn cartproduct() -> @kernel.Thm {
  cartproduct_c.get()
}

///|
/// IN_SET_ELEMENT
fn step_72() -> Unit raise {
  let t287 = @meson.asm_meson_tac(@list.List([set_subset_setlevel(), @sets.subset(), droplevel()]))
  let t286 = @tactics.subgoal_then(@term_syntax.parse_term("IN((e : I), setlevel((l : Setlevel)))"), fn(x284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x284
    @simp.asm_simp_tac(@list.List([t, mk_v_clauses()]))
  })
  let t283 = @simp.rewrite_tac(@list.List([inset()]))
  let t282 = @tactics.exists_tac(@term_syntax.parse_term("mk_V(((l : Setlevel), (e : I)))"))
  let t279 = @simp.rewrite_rule(@list.List([isaset()]))
  let t277 = @term_syntax.parse_term("(l : Setlevel)")
  let t281 = @tactics.first_assum(fn(x280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x278 : @kernel.Thm) => @tactics.x_choose_tac(t277, x278))(t279(x280))
  })
  let t288 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t281), t282), t283), t286), t287)
  in_set_element_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, isaset(s) && IN((e : I), set(s)) → (∃ x : V, e == element(x) && level(s) == Powerset(level(x)) && op_lt_colon(x, s))"), t288))
}

///|
let in_set_element_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_SET_ELEMENT")

///|
/// `IN_SET_ELEMENT`
pub fn in_set_element() -> @kernel.Thm {
  in_set_element_c.get()
}

///|
/// SUBSET_ALT
fn step_73() -> Unit raise {
  let t293 = @meson.asm_meson_tac(@list.List([in_set_element()]))
  let t292 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t291 = @simp.asm_rewrite_tac(@list.List([@sets.subset()]))
  let t290 = @class.asm_cases_tac(@term_syntax.parse_term("level((s : V)) == level((t : V))"))
  let t289 = @simp.rewrite_tac(@list.List([subset_def(), inset()]))
  let t294 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t289), t290), t291), @tactics.strip_tac), @tactics.eq_tac), t292), t293)
  subset_alt_c.set(@tactics.prove(@term_syntax.parse_term("isaset((s : V)) && isaset((t : V)) → op_lt_eq_colon(s, t) == (level(s) == level(t) && SUBSET(set(s), set(t)))"), t294))
}

///|
let subset_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_ALT")

///|
/// `SUBSET_ALT`
pub fn subset_alt() -> @kernel.Thm {
  subset_alt_c.get()
}

///|
/// SUBSET_ANTISYM_LEVEL
fn step_74() -> Unit raise {
  let t318 = @meson.asm_meson_tac(@list.List([@sets.subset_antisym()]))
  let t317 = @tactics.repeat_tac(@tactics.disch_then(fn(x316 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x313 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s314 = @tactics.subst1_tac(x313)
      fn(x315 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s314(x315)
      }
    })(@equal.sym(x316))
  }))
  let t312 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(t : V)"), set()))
  let t311 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : V)"), set()))
  let t310 = @tactics.repeat_tac(@tactics.strip_tac)
  let t307 = @drule.match_mp(set_decomp())
  let t309 = @tactics.every_assum(fn(x308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x303 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s304 = @tactics.mp_tac(x303)
        fn(x305 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s304(x305)
        }
      })(@equal.gsym(x306))
    })(t307(x308))
  })
  let t302 = @simp.asm_simp_tac(@list.List([subset_alt()]))
  let t301 = @tactics.replicate_tac(2, @tactics.disch_then(@tactics.conjuncts_then2(fn(x295 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s296 = @tactics.assume_tac(x295)
    fn(x297 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s296(x297)
    }
  }, fn(x298 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s299 = @tactics.mp_tac(x298)
    fn(x300 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s299(x300)
    }
  })))
  let t319 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t301), t302), t309), t310), t311), t312), t317), @tactics.ap_term_tac), @tactics.binop_tac), t318)
  subset_antisym_level_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, ∀ t : V, isaset(s) && isaset(t) && op_lt_eq_colon(s, t) && op_lt_eq_colon(t, s) → s == t"), t319))
}

///|
let subset_antisym_level_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSET_ANTISYM_LEVEL")

///|
/// `SUBSET_ANTISYM_LEVEL`
pub fn subset_antisym_level() -> @kernel.Thm {
  subset_antisym_level_c.get()
}

///|
/// EXTENSIONALITY_LEVEL
fn step_75() -> Unit raise {
  let t320 = @meson.meson_tac(@list.List([subset_antisym_level(), subset_def()]))
  extensionality_level_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, ∀ t : V, isaset(s) && isaset(t) && level(s) == level(t) && (∀ x : V, op_lt_colon(x, s) == op_lt_colon(x, t)) → s == t"), t320))
}

///|
let extensionality_level_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXTENSIONALITY_LEVEL")

///|
/// `EXTENSIONALITY_LEVEL`
pub fn extensionality_level() -> @kernel.Thm {
  extensionality_level_c.get()
}

///|
/// EXTENSIONALITY_NONEMPTY
fn step_76() -> Unit raise {
  let t322 = @meson.asm_meson_tac(@list.List([members_isaset(), inset()]))
  let t321 = @tactics.match_mp_tac(extensionality_level())
  let t323 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t321), t322)
  extensionality_nonempty_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, ∀ t : V, (∃ x : V, op_lt_colon(x, s)) && (∃ x : V, op_lt_colon(x, t)) && (∀ x : V, op_lt_colon(x, s) == op_lt_colon(x, t)) → s == t"), t323))
}

///|
let extensionality_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXTENSIONALITY_NONEMPTY")

///|
/// `EXTENSIONALITY_NONEMPTY`
pub fn extensionality_nonempty() -> @kernel.Thm {
  extensionality_nonempty_c.get()
}

///|
/// UNION_EXISTS
fn step_77() -> Unit raise {
  let t351 = @meson.asm_meson_tac(@list.List([inset(), element_in_level(), setlevel_inj()]))
  let t350 = @simp.asm_rewrite_tac(@list.List([]))
  let t349 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t347 = @term_syntax.parse_term("(x : V) => ∃ u : V, op_lt_colon(x, u) && op_lt_colon(u, (s : V))")
  let t348 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(t : V)"), t347]), comprehension_exists()))
  let t346 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : V)"))(@tactics.strip_assume_tac))
  let t345 = @simp.asm_rewrite_tac(@list.List([droplevel()]))
  let t344 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(m : Setlevel)"), setlevel_exists()))
  let t343 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(m : Setlevel)"))(fn(x340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s341 = @tactics.subst_all_tac(x340)
    fn(x342 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s341(x342)
    }
  }))
  let t338 = @meson.asm_meson_tac(@list.List([setlevel_inj()]))
  let t337 = @simp.rewrite_tac(@list.List([inset()]))
  let t336 = @simp.asm_rewrite_tac(@list.List([]))
  let t335 = @tactics.repeat_tac(@tactics.strip_tac)
  let t334 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t339 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(l : Setlevel)"), empty_exists())), t334), t335), t336), t337), t338)])
  let t333 = @class.asm_cases_tac(@term_syntax.parse_term("∃ m : Setlevel, (l : Setlevel) == Powerset(m)"))
  let t332 = @simp.asm_rewrite_tac(@list.List([droplevel()]))
  let t329 = @simp.rewrite_rule(@list.List([isaset()]))
  let t327 = @term_syntax.parse_term("(l : Setlevel)")
  let t331 = @tactics.first_assum(fn(x330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    ((x328 : @kernel.Thm) => @tactics.x_choose_tac(t327, x328))(t329(x330))
  })
  let t325 = @meson.asm_meson_tac(@list.List([members_isaset()]))
  let t324 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t326 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("droplevel(level((s : V)))"), empty_exists())), t324), t325)])
  let t352 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("isaset((s : V))"))), t326), t331), t332), t333), t339), t343), t344), t345), t346), t348), t349), @tactics.gen_tac), @tactics.strip_tac), t350), t351)
  union_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, ∃ t : V, level(t) == droplevel(level(s)) && (∀ x : V, op_lt_colon(x, t) == (∃ u : V, op_lt_colon(x, u) && op_lt_colon(u, s)))"), t352))
}

///|
let union_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNION_EXISTS")

///|
/// `UNION_EXISTS`
pub fn union_exists() -> @kernel.Thm {
  union_exists_c.get()
}

///|
/// SETUNION
fn step_78() -> Unit raise {
  let t353 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(union_exists())
  setunion_c.set(@nums.new_specification(@list.List(["setunion"]))(t353))
}

///|
let setunion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SETUNION")

///|
/// `SETUNION`
pub fn setunion() -> @kernel.Thm {
  setunion_c.get()
}

///|
/// true_def
fn step_79() -> Unit raise {
  true_def_c.set(@pair.new_definition(@term_syntax.parse_term("(True : V) == mk_V((Ur_bool, I_BOOL(true)))")))
}

///|
let true_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("true_def")

///|
/// `true_def`
pub fn true_def() -> @kernel.Thm {
  true_def_c.get()
}

///|
/// false_def
fn step_80() -> Unit raise {
  false_def_c.set(@pair.new_definition(@term_syntax.parse_term("(False : V) == mk_V((Ur_bool, I_BOOL(false)))")))
}

///|
let false_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("false_def")

///|
/// `false_def`
pub fn false_def() -> @kernel.Thm {
  false_def_c.get()
}

///|
/// boolset
fn step_81() -> Unit raise {
  boolset_c.set(@pair.new_definition(@term_syntax.parse_term("(boolset : V) == mk_V((Powerset(Ur_bool), I_SET(setlevel(Ur_bool), setlevel(Ur_bool))))")))
}

///|
let boolset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("boolset")

///|
/// `boolset`
pub fn boolset() -> @kernel.Thm {
  boolset_c.get()
}

///|
/// IN_BOOL
fn step_82() -> Unit raise {
  let t380 = @meson.asm_meson_tac(@list.List([v_tybij_v1(), element_in_level(), @pair.pair_eq()]))
  let t379 = @meson.meson_tac(@list.List([]))
  let t381 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([setlevel(), @sets.in_image(), @sets.in_univ()])), t379), t380])
  let t378 = @tactics.subgoal_then(@term_syntax.parse_term("∀ b : Bool, IN(I_BOOL(b), setlevel(Ur_bool))"), fn(x375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s376 = @tactics.assume_tac(x375)
    fn(x377 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s376(x377)
    }
  })
  let t374 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t373 = @simp.gen_rewrite_tac(fn(x372 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x368 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x362 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s363 = @equal.rand_conv(x362)
        fn(x364 : @kernel.Term) -> @kernel.Thm raise {
          s363(x364)
        }
      })((fn(x365 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s366 = @equal.binop_conv(x365)
        fn(x367 : @kernel.Term) -> @kernel.Thm raise {
          s366(x367)
        }
      })(x368))
    })((fn(x369 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s370 = @equal.land_conv(x369)
      fn(x371 : @kernel.Term) -> @kernel.Thm raise {
        s370(x371)
      }
    })(x372))
  }, @list.List([@equal.gsym(set())]))
  let t360 = @meson.meson_tac(@list.List([i_bool()]))
  let t361 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_univ(), @sets.in_insert(), @sets.not_in_empty()])), t360), @tactics.all_tac])
  let t359 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE(I_BOOL, UNIV) == {I_BOOL(false), I_BOOL(true)}"), fn(x356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s357 = @tactics.subst1_tac(x356)
    fn(x358 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s357(x358)
    }
  })
  let t355 = @simp.rewrite_tac(@list.List([setlevel_inj(), setlevel()]))
  let t354 = @simp.simp_tac(@list.List([mk_v_set(), @sets.subset_refl()]))
  let t382 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([inset(), boolset(), true_def(), false_def()])), t354), t355), t359), t361), @tactics.gen_tac), t373), t374), t378), t381)
  in_bool_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : V, op_lt_colon(x, boolset) == (x == True || x == False)"), t382))
}

///|
let in_bool_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_BOOL")

///|
/// `IN_BOOL`
pub fn in_bool() -> @kernel.Thm {
  in_bool_c.get()
}

///|
/// TRUE_NE_FALSE
fn step_83() -> Unit raise {
  let t395 = @meson.asm_meson_tac(@list.List([v_tybij_v1(), i_bool(), @pair.pair_eq()]))
  let t394 = @meson.meson_tac(@list.List([]))
  let t396 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([setlevel(), @sets.in_image(), @sets.in_univ()])), t394), t395])
  let t393 = @tactics.subgoal_then(@term_syntax.parse_term("∀ b : Bool, IN(I_BOOL(b), setlevel(Ur_bool))"), fn(x390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s391 = @tactics.assume_tac(x390)
    fn(x392 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s391(x392)
    }
  })
  let t386 = @term_syntax.parse_term("dest_V")
  let t389 = @tactics.disch_then(fn(x388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s384 = @tactics.mp_tac(x383)
      fn(x385 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s384(x385)
      }
    })(((x387 : @kernel.Thm) => @equal.ap_term(t386, x387))(x388))
  })
  let t397 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([true_def(), false_def()])), t389), t393), t396)
  true_ne_false_c.set(@tactics.prove(@term_syntax.parse_term("!(True == False)"), t397))
}

///|
let true_ne_false_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRUE_NE_FALSE")

///|
/// `TRUE_NE_FALSE`
pub fn true_ne_false() -> @kernel.Thm {
  true_ne_false_c.get()
}

///|
/// BOOLEAN_EQ
fn step_84() -> Unit raise {
  let t398 = @meson.meson_tac(@list.List([true_ne_false(), in_bool()]))
  boolean_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : V, ∀ y : V, op_lt_colon(x, boolset) && op_lt_colon(y, boolset) && (x == True) == (y == True) → x == y"), t398))
}

///|
let boolean_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOOLEAN_EQ")

///|
/// `BOOLEAN_EQ`
pub fn boolean_eq() -> @kernel.Thm {
  boolean_eq_c.get()
}

///|
/// indset
fn step_85() -> Unit raise {
  indset_c.set(@pair.new_definition(@term_syntax.parse_term("(indset : V) == mk_V((Powerset(Ur_ind), I_SET(setlevel(Ur_ind), setlevel(Ur_ind))))")))
}

///|
let indset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("indset")

///|
/// `indset`
pub fn indset() -> @kernel.Thm {
  indset_c.get()
}

///|
/// INDSET_IND_MODEL
fn step_86() -> Unit raise {
  let t407 = @meson.asm_meson_tac(@list.List([v_tybij_v1(), i_ind(), element_in_level(), @pair.pair_eq()]))
  let t406 = @simp.asm_simp_tac(@list.List([mk_v_set(), @sets.subset_refl(), inset(), indset(), mk_v_clauses()]))
  let t404 = @meson.meson_tac(@list.List([]))
  let t405 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([setlevel(), @sets.in_image(), @sets.in_univ()])), t404), @tactics.all_tac])
  let t403 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Ind_model, IN(I_IND(i), setlevel(Ur_ind))"), fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s401 = @tactics.assume_tac(x400)
    fn(x402 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s401(x402)
    }
  })
  let t399 = @simp.rewrite_tac(@list.List([]))
  let t408 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(i : Ind_model) => mk_V((Ur_ind, I_IND(i)))")), t399), t403), t405), t406), t407)
  indset_ind_model_c.set(@tactics.prove(@term_syntax.parse_term("∃ f : (Ind_model) -> V, (∀ i : Ind_model, op_lt_colon(f(i), indset)) && (∀ i : Ind_model, ∀ j : Ind_model, f(i) == f(j) → i == j)"), t408))
}

///|
let indset_ind_model_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDSET_IND_MODEL")

///|
/// `INDSET_IND_MODEL`
pub fn indset_ind_model() -> @kernel.Thm {
  indset_ind_model_c.get()
}

///|
/// INDSET_INHABITED
fn step_87() -> Unit raise {
  let t409 = @meson.meson_tac(@list.List([indset_ind_model()]))
  indset_inhabited_c.set(@tactics.prove(@term_syntax.parse_term("∃ x : V, op_lt_colon(x, indset)"), t409))
}

///|
let indset_inhabited_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INDSET_INHABITED")

///|
/// `INDSET_INHABITED`
pub fn indset_inhabited() -> @kernel.Thm {
  indset_inhabited_c.get()
}

///|
/// ch
fn step_88() -> Unit raise {
  let t410 = @meson.meson_tac(@list.List([]))
  let t411 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@class.skolem_thm())])), t410)
  let th = @tactics.prove(@term_syntax.parse_term("∃ ch : (V) -> V, ∀ s : V, (∃ x : V, op_lt_colon(x, s)) → op_lt_colon(ch(s), s)"), t411)
  ch_c.set(@nums.new_specification(@list.List(["ch"]))(th))
}

///|
let ch_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ch")

///|
/// `ch`
pub fn ch() -> @kernel.Thm {
  ch_c.get()
}

///|
/// IN_POWERSET
fn step_89() -> Unit raise {
  let t412 = @meson.meson_tac(@list.List([powerset()]))
  in_powerset_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : V, ∀ s : V, op_lt_colon(x, powerset(s)) == op_lt_eq_colon(x, s)"), t412))
}

///|
let in_powerset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_POWERSET")

///|
/// `IN_POWERSET`
pub fn in_powerset() -> @kernel.Thm {
  in_powerset_c.get()
}

///|
/// IN_CARTPRODUCT
fn step_90() -> Unit raise {
  let t413 = @meson.meson_tac(@list.List([cartproduct()]))
  in_cartproduct_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : V, ∀ s : V, ∀ t : V, op_lt_colon(z, cartproduct(s, t)) == (∃ x : V, ∃ y : V, z == pair(x, y) && op_lt_colon(x, s) && op_lt_colon(y, t))"), t413))
}

///|
let in_cartproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_CARTPRODUCT")

///|
/// `IN_CARTPRODUCT`
pub fn in_cartproduct() -> @kernel.Thm {
  in_cartproduct_c.get()
}

///|
/// IN_COMPREHENSION
fn step_91() -> Unit raise {
  let t414 = @meson.meson_tac(@list.List([suchthat()]))
  in_comprehension_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (V) -> Bool, ∀ s : V, ∀ x : V, op_lt_colon(x, suchthat(s, p)) == (op_lt_colon(x, s) && p(x))"), t414))
}

///|
let in_comprehension_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_COMPREHENSION")

///|
/// `IN_COMPREHENSION`
pub fn in_comprehension() -> @kernel.Thm {
  in_comprehension_c.get()
}

///|
/// CARTPRODUCT_INHABITED
fn step_92() -> Unit raise {
  let t415 = @meson.meson_tac(@list.List([in_cartproduct()]))
  cartproduct_inhabited_c.set(@tactics.prove(@term_syntax.parse_term("(∃ x : V, op_lt_colon(x, (s : V))) && (∃ y : V, op_lt_colon(y, (t : V))) → (∃ z : V, op_lt_colon(z, cartproduct(s, t)))"), t415))
}

///|
let cartproduct_inhabited_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARTPRODUCT_INHABITED")

///|
/// `CARTPRODUCT_INHABITED`
pub fn cartproduct_inhabited() -> @kernel.Thm {
  cartproduct_inhabited_c.get()
}

///|
/// funspace
fn step_93() -> Unit raise {
  funspace_c.set(@pair.new_definition(@term_syntax.parse_term("(funspace : (V, V) -> V)((s : V), (t : V)) == suchthat(powerset(cartproduct(s, t)), (u : V) => ∀ x : V, op_lt_colon(x, s) → existsunique((y : V) => op_lt_colon(pair(x, y), u)))")))
}

///|
let funspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("funspace")

///|
/// `funspace`
pub fn funspace() -> @kernel.Thm {
  funspace_c.get()
}

///|
/// apply_def
fn step_94() -> Unit raise {
  apply_def_c.set(@pair.new_definition(@term_syntax.parse_term("(apply : (V, V) -> V)((f : V), (x : V)) == select((y : V) => op_lt_colon(pair(x, y), f))")))
}

///|
let apply_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("apply_def")

///|
/// `apply_def`
pub fn apply_def() -> @kernel.Thm {
  apply_def_c.get()
}

///|
/// abstract
fn step_95() -> Unit raise {
  abstract__c.set(@pair.new_definition(@term_syntax.parse_term("(abstract_ : (V, V, (V) -> V) -> V)((s : V), (t : V), (f : (V) -> V)) == suchthat(cartproduct(s, t), (z : V) => ∀ x : V, ∀ y : V, pair(x, y) == z → y == f(x))")))
}

///|
let abstract__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("abstract")

///|
/// `abstract`
pub fn abstract_() -> @kernel.Thm {
  abstract__c.get()
}

///|
/// APPLY_ABSTRACT
fn step_96() -> Unit raise {
  let t419 = @meson.asm_meson_tac(@list.List([]))
  let t418 = @simp.rewrite_tac(@list.List([pair_inj()]))
  let t417 = @tactics.match_mp_tac(@class.select_unique())
  let t416 = @simp.rewrite_tac(@list.List([apply_def(), abstract_(), in_cartproduct(), suchthat()]))
  let t420 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t416), t417), t418), t419)
  apply_abstract_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : V, ∀ s : V, ∀ t : V, op_lt_colon(x, s) && op_lt_colon((f : (V) -> V)(x), t) → apply(abstract_(s, t, f), x) == f(x)"), t420))
}

///|
let apply_abstract_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPLY_ABSTRACT")

///|
/// `APPLY_ABSTRACT`
pub fn apply_abstract() -> @kernel.Thm {
  apply_abstract_c.get()
}

///|
/// APPLY_IN_RANSPACE
fn step_97() -> Unit raise {
  let t422 = @meson.meson_tac(@list.List([pair_inj()]))
  let t421 = @simp.rewrite_tac(@list.List([apply_def()]))
  let t423 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([funspace(), suchthat(), in_powerset(), in_cartproduct(), subset_def()])), t421), t422)
  apply_in_ranspace_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : V, ∀ x : V, ∀ s : V, ∀ t : V, op_lt_colon(x, s) && op_lt_colon(f, funspace(s, t)) → op_lt_colon(apply(f, x), t)"), t423))
}

///|
let apply_in_ranspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPLY_IN_RANSPACE")

///|
/// `APPLY_IN_RANSPACE`
pub fn apply_in_ranspace() -> @kernel.Thm {
  apply_in_ranspace_c.get()
}

///|
/// ABSTRACT_IN_FUNSPACE
fn step_98() -> Unit raise {
  let t426 = @meson.meson_tac(@list.List([]))
  let t425 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm1(), @theorems.exists_refl()]))
  let t424 = @simp.simp_tac(@list.List([@theorems.left_forall_imp_thm(), @equal.gsym(@theorems.conj_assoc()), @theorems.right_exists_and_thm()]))
  let t427 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([funspace(), abstract_(), suchthat(), in_powerset(), in_cartproduct(), subset_def(), pair_inj()])), t424), t425), t426)
  abstract_in_funspace_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (V) -> V, ∀ x : _, ∀ s : V, ∀ t : V, (∀ x : V, op_lt_colon(x, s) → op_lt_colon(f(x), t)) → op_lt_colon(abstract_(s, t, f), funspace(s, t))"), t427))
}

///|
let abstract_in_funspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSTRACT_IN_FUNSPACE")

///|
/// `ABSTRACT_IN_FUNSPACE`
pub fn abstract_in_funspace() -> @kernel.Thm {
  abstract_in_funspace_c.get()
}

///|
/// FUNSPACE_INHABITED
fn step_99() -> Unit raise {
  let t430 = @meson.asm_meson_tac(@list.List([]))
  let t429 = @tactics.match_mp_tac(abstract_in_funspace())
  let t428 = @tactics.exists_tac(@term_syntax.parse_term("abstract_((s : V), (t : V), (x : V) => select((y : V) => op_lt_colon(y, t)))"))
  let t431 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t428), t429), t430)
  funspace_inhabited_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, ∀ t : V, ((∃ x : V, op_lt_colon(x, s)) → (∃ y : V, op_lt_colon(y, t))) → (∃ f : V, op_lt_colon(f, funspace(s, t)))"), t431))
}

///|
let funspace_inhabited_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUNSPACE_INHABITED")

///|
/// `FUNSPACE_INHABITED`
pub fn funspace_inhabited() -> @kernel.Thm {
  funspace_inhabited_c.get()
}

///|
/// ABSTRACT_EQ
fn step_100() -> Unit raise {
  let t446 = @meson.asm_meson_tac(@list.List([]))
  let t445 = @simp.asm_rewrite_tac(@list.List([pair_inj()]))
  let t444 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t443 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.exists_refl()]))
  let t442 = @simp.asm_rewrite_tac(@list.List([pair_inj()]))
  let t440 = @meson.asm_meson_tac(@list.List([]))
  let t441 = @list.List([@meson.asm_meson_tac(@list.List([])), t440, @tactics.all_tac])
  let t439 = @simp.simp_tac(@list.List([@theorems.left_forall_imp_thm()]))
  let t438 = @simp.rewrite_tac(@list.List([pair_inj()]))
  let t437 = @simp.simp_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) && (b : Bool) && (c : Bool)) && (d : Bool)) == !(a → b && c → !d)"))]))
  let t436 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t435 = @tactics.repeat_tac(@tactics.conj_tac)
  let t434 = @simp.rewrite_tac(@list.List([suchthat(), in_cartproduct()]))
  let t433 = @tactics.match_mp_tac(extensionality_nonempty())
  let t432 = @tactics.repeat_tac(@tactics.strip_tac)
  let t447 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([abstract_()])), t432), t433), t434), t435), t436), t437), t438), t439), t441), t442), t443), t444), @tactics.gen_tac), @tactics.eq_tac), @tactics.strip_tac), t445), t446)
  abstract_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : V, ∀ t1 : V, ∀ t2 : V, ∀ f : (V) -> V, ∀ g : (V) -> V, (∃ x : V, op_lt_colon(x, s)) && (∀ x : V, op_lt_colon(x, s) → op_lt_colon(f(x), t1) && op_lt_colon(g(x), t2) && f(x) == g(x)) → abstract_(s, t1, f) == abstract_(s, t2, g)"), t447))
}

///|
let abstract_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSTRACT_EQ")

///|
/// `ABSTRACT_EQ`
pub fn abstract_eq() -> @kernel.Thm {
  abstract_eq_c.get()
}

///|
/// boolean
fn step_101() -> Unit raise {
  boolean_c.set(@pair.new_definition(@term_syntax.parse_term("(boolean : (Bool) -> V)((b : Bool)) == (if b { True } else { False })")))
}

///|
let boolean_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("boolean")

///|
/// `boolean`
pub fn boolean() -> @kernel.Thm {
  boolean_c.get()
}

///|
/// holds
fn step_102() -> Unit raise {
  holds_c.set(@pair.new_definition(@term_syntax.parse_term("(holds : (V, V) -> Bool)((s : V), (x : V)) == (apply(s, x) == True)")))
}

///|
let holds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("holds")

///|
/// `holds`
pub fn holds() -> @kernel.Thm {
  holds_c.get()
}

///|
/// BOOLEAN_IN_BOOLSET
fn step_103() -> Unit raise {
  let t448 = @meson.meson_tac(@list.List([in_bool()]))
  let t449 = @tactics.then_tac(@simp.rewrite_tac(@list.List([boolean()])), t448)
  boolean_in_boolset_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Bool, op_lt_colon(boolean(b), boolset)"), t449))
}

///|
let boolean_in_boolset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOOLEAN_IN_BOOLSET")

///|
/// `BOOLEAN_IN_BOOLSET`
pub fn boolean_in_boolset() -> @kernel.Thm {
  boolean_in_boolset_c.get()
}

///|
/// BOOLEAN_EQ_TRUE
fn step_104() -> Unit raise {
  let t450 = @meson.meson_tac(@list.List([true_ne_false()]))
  let t451 = @tactics.then_tac(@simp.rewrite_tac(@list.List([boolean()])), t450)
  boolean_eq_true_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Bool, (boolean(b) == True) == b"), t451))
}

///|
let boolean_eq_true_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOOLEAN_EQ_TRUE")

///|
/// `BOOLEAN_EQ_TRUE`
pub fn boolean_eq_true() -> @kernel.Thm {
  boolean_eq_true_c.get()
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
  step_93()
  step_94()
  step_95()
  step_96()
  step_97()
  step_98()
  step_99()
  step_100()
  step_101()
  step_102()
  step_103()
  step_104()
}
