// Translated from upstream Examples/complexpolygon.ml; edit this file directly.

///|
/// circle_group
fn step_1() -> Unit raise {
  circle_group_c.set(@pair.new_definition(@term_syntax.parse_term("(circle_group : Group[Cart[Real, 2]]) == group(({(z : Cart[Real, 2]) | norm(z) == real_of_num(1)}, Cx(real_of_num(1)), inv, op_star))")))
}

///|
let circle_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("circle_group")

///|
/// `circle_group`
pub fn circle_group() -> @kernel.Thm {
  circle_group_c.get()
}

///|
/// CIRCLE_GROUP
fn step_2() -> Unit raise {
  let t15 = @tactics.conv_tac(@complexes.complex_field)
  let t14 = @tactics.pop_assum(fn(x11 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s12 = @tactics.mp_tac(x11)
    fn(x13 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s12(x13)
    }
  })
  let t10 = @tactics.disch_then(fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t8 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_norm_0(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t7 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t6 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t5 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc()]))
  let t4 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3 = @simp.simp_tac(@list.List([@complexes.complex_norm_inv(), @complexes.complex_norm_mul(), @complexes.complex_norm_cx()]))
  let t2 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @complexes.complex_mul_lid(), @complexes.complex_mul_rid()]))
  let t1 = @simp.rewrite_tac(@list.List([circle_group(), @equal.gsym(@bool.conjunct2(@grouptheory.group_tybij()))]))
  let t16 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@grouptheory.group_carrier(), @grouptheory.group_id(), @grouptheory.group_inv(), @grouptheory.group_mul(), @equal.gsym(@pair.pair_eq())])), t1), t2), t3), t4), t5), t6), t7), t8), t10), t14), t15)
  circle_group_v1_c.set(@tactics.prove(@term_syntax.parse_term("group_carrier(circle_group) == {(z : Cart[Real, 2]) | norm(z) == real_of_num(1)} && group_id(circle_group) == Cx(real_of_num(1)) && group_inv(circle_group) == inv && group_mul(circle_group) == op_star"), t16))
}

///|
let circle_group_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CIRCLE_GROUP")

///|
/// `CIRCLE_GROUP`
pub fn circle_group_v1() -> @kernel.Thm {
  circle_group_v1_c.get()
}

///|
/// ABELIAN_CIRCLE_GROUP
fn step_3() -> Unit raise {
  let t17 = @simp.rewrite_tac(@list.List([@grouptheory.abelian_group(), circle_group_v1(), @complexes.complex_mul_sym()]))
  abelian_circle_group_c.set(@tactics.prove(@term_syntax.parse_term("abelian_group(circle_group)"), t17))
}

///|
let abelian_circle_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABELIAN_CIRCLE_GROUP")

///|
/// `ABELIAN_CIRCLE_GROUP`
pub fn abelian_circle_group() -> @kernel.Thm {
  abelian_circle_group_c.get()
}

///|
/// GROUP_POW_CIRCLE_GROUP
fn step_4() -> Unit raise {
  let t18 = @simp.asm_rewrite_tac(@list.List([@grouptheory.group_pow(), circle_group_v1(), @complexes.complex_pow()]))
  let t19 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t18)
  group_pow_circle_group_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ n : Num, group_pow(circle_group, z, n) == pow(z, n)"), t19))
}

///|
let group_pow_circle_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GROUP_POW_CIRCLE_GROUP")

///|
/// `GROUP_POW_CIRCLE_GROUP`
pub fn group_pow_circle_group() -> @kernel.Thm {
  group_pow_circle_group_c.get()
}

///|
/// FINITE_SUBGROUP_OF_CIRCLE_GROUP
fn step_5() -> Unit raise {
  let t42 = @meson.asm_meson_tac(@list.List([@sets.card_eq_0(), @sets.not_in_empty(), @int.divides_le_imp()]))
  let t41 = @simp.asm_simp_tac(@list.List([@grouptheory.carrier_subgroup_generated_subgroup()]))
  let t39 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t40 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("subgroup_generated(circle_group, (s : (Cart[Real, 2]) -> Bool))"), t39]), @grouptheory.group_element_order_divides_group_order()))
  let t38 = @simp.asm_rewrite_tac(@list.List([]))
  let t37 = @term_syntax.parse_term("(n : Num)")
  let t43 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.trans_tac(@arith.le_trans())(t37), t38), t40), t41), t42)
  let t36 = @simp.asm_simp_tac(@list.List([@grouptheory.carrier_subgroup_generated_subgroup(), circle_group_v1(), @bool.conjunct2(@grouptheory.subgroup_generated_v1()), @grouptheory.group_pow_subgroup_generated(), group_pow_circle_group()]))
  let t33 = @term_syntax.parse_term("(n : Num)")
  let t34 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t35 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("subgroup_generated(circle_group, (s : (Cart[Real, 2]) -> Bool))"), t34, t33]), @grouptheory.group_pow_eq_id()))
  let t32 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t44 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()])), t32), @tactics.disch_tac), t35), t36), t43])
  let t31 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t30 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(n : Num)"), @transcendentals.finite_card_complex_roots_unity()))
  let t29 = @tactics.match_mp_tac(@sets.card_subset_le())
  let t28 = @simp.asm_simp_tac(@list.List([@arith.le_1()]))
  let t27 = @simp.asm_simp_tac(@list.List([@grouptheory.carrier_subgroup_generated_subgroup()]))
  let t25 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t26 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("subgroup_generated(circle_group, (s : (Cart[Real, 2]) -> Bool))"), t25]), @grouptheory.finite_group_element_order_nonzero()))
  let t24 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t23 = @simp.abbrev_tac(@term_syntax.parse_term("(n : Num) == group_element_order(subgroup_generated(circle_group, (s : (Cart[Real, 2]) -> Bool)), (z : Cart[Real, 2]))"))
  let t22 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t21 = @simp.asm_simp_tac(@list.List([@grouptheory.cyclic_group_element_order(), @grouptheory.carrier_subgroup_generated_subgroup(), @grouptheory.abelian_subgroup_generated(), abelian_circle_group()]))
  let t20 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("subgroup_generated(circle_group, (s : (Cart[Real, 2]) -> Bool))"), @grouptheory.abelian_group_order_divides_maximal()))
  let t45 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t20), t21), t22), t23), t24), t26), t27), @tactics.disch_tac), t28), t29), t30), t31), @tactics.strip_tac), @tactics.conj_tac), t44)
  finite_subgroup_of_circle_group_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, FINITE(s) && subgroup_of(s, circle_group) → (∃ n : Num, 1 <= n && s == {(z : Cart[Real, 2]) | pow(z, n) == Cx(real_of_num(1))})"), t45))
}

///|
let finite_subgroup_of_circle_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUBGROUP_OF_CIRCLE_GROUP")

///|
/// `FINITE_SUBGROUP_OF_CIRCLE_GROUP`
pub fn finite_subgroup_of_circle_group() -> @kernel.Thm {
  finite_subgroup_of_circle_group_c.get()
}

///|
/// DARIO_LEMMA1
fn step_6() -> Unit raise {
  let t59 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t58 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@sets.subset(), @theorems.right_imp_forall_thm()]))(@misc.hull_mono()))
  let t57 = @simp.asm_rewrite_tac(@list.List([@complexes.bilinear_complex_mul()]))
  let t53 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t54 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t55 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t56 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t60 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("complex_mul"), t56, t55, t54, t53]), @convex.bilinear_in_convex_hull())), t57), t58), t59)
  let t52 = @meson.asm_meson_tac(@list.List([@realarith.real_lt_refl()]))
  let t51 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_mul(), @realax.real_mul_lid()]))
  let t50 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(q : Bool) → (!(p : Bool) → q) → p")))
  let t49 = @simp.asm_simp_tac(@list.List([@misc.hull_inc(), @complexes.complex_sub_rzero()]))
  let t47 = @term_syntax.parse_term("(w : Cart[Real, 2]) * (z : Cart[Real, 2])")
  let t48 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t61 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("Cx(real_of_num(0))"), t48, t47]), @convex.simplex_furthest_lt_exists())), t49), t50), t51), t52), t60])
  let t46 = @tactics.repeat_tac(@tactics.strip_tac)
  let t62 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t46), t61)
  dario_lemma1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, (∀ z : Cart[Real, 2], IN(z, s) → norm(z) == real_of_num(1)) → (∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], IN(w, hull(convex, s)) && IN(z, hull(convex, s)) → IN(w * z, hull(convex, s))) == (∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], IN(w, s) && IN(z, s) → IN(w * z, s))"), t62))
}

///|
let dario_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DARIO_LEMMA1")

///|
/// `DARIO_LEMMA1`
pub fn dario_lemma1() -> @kernel.Thm {
  dario_lemma1_c.get()
}

///|
/// DARIO_LEMMA2
fn step_7() -> Unit raise {
  let t71 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t70 = @simp.rewrite_tac(@list.List([@grouptheory.group_setmul(), @sets.subset(), @sets.forall_in_gspec(), circle_group_v1()]))
  let t69 = @tactics.disch_then(fn(x66 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s67 = @tactics.subst1_tac(x66)
    fn(x68 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s67(x68)
    }
  })
  let t65 = @simp.asm_rewrite_tac(@list.List([]))
  let t63 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t64 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("circle_group"), t63]), @grouptheory.finite_subgroup_of_setwise()))
  let t72 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t64), t65), t69), t70), t71)
  dario_lemma2_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, FINITE(s) && !(s == {}) && (∀ z : Cart[Real, 2], IN(z, s) → norm(z) == real_of_num(1)) → (∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], IN(w, s) && IN(z, s) → IN(w * z, s)) == subgroup_of(s, circle_group)"), t72))
}

///|
let dario_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DARIO_LEMMA2")

///|
/// `DARIO_LEMMA2`
pub fn dario_lemma2() -> @kernel.Thm {
  dario_lemma2_c.get()
}

///|
/// DARIO
fn step_8() -> Unit raise {
  let t74 = @tactics.then_tac(@tactics.strip_tac, @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @complexes.complex_pow_mul(), @complexes.complex_mul_lid()])))
  let t75 = @list.List([@simp.asm_simp_tac(@list.List([dario_lemma2(), finite_subgroup_of_circle_group()])), t74])
  let t73 = @simp.asm_simp_tac(@list.List([dario_lemma1()]))
  let t76 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t73), @tactics.eq_tac), t75)
  dario_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, FINITE(s) && !(s == {}) && (∀ z : Cart[Real, 2], IN(z, s) → norm(z) == real_of_num(1)) → (∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], IN(w, hull(convex, s)) && IN(z, hull(convex, s)) → IN(w * z, hull(convex, s))) == (∃ n : Num, 1 <= n && s == {(z : Cart[Real, 2]) | pow(z, n) == Cx(real_of_num(1))})"), t76))
}

///|
let dario_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DARIO")

///|
/// `DARIO`
pub fn dario() -> @kernel.Thm {
  dario_c.get()
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
}
