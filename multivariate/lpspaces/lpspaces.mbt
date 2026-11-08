// Translated from upstream Multivariate/lpspaces.ml; edit this file directly.

///|
/// lspace
fn step_1() -> Unit raise {
  lspace_c.set(@pair.new_definition(@term_syntax.parse_term("(lspace : ((Cart[Real, M]) -> Bool, Real, (Cart[Real, M]) -> Cart[Real, N]) -> Bool)((s : (Cart[Real, M]) -> Bool), (p : Real)) == {(f : (Cart[Real, M]) -> Cart[Real, N]) | measurable_on(f, s) && integrable_on((x : Cart[Real, M]) => lift(rpow(norm(f(x)), p)), s)}")))
}

///|
let lspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lspace")

///|
/// `lspace`
pub fn lspace() -> @kernel.Thm {
  lspace_c.get()
}

///|
/// LSPACE_ALT
fn step_2() -> Unit raise {
  let t1 = @simp.simp_tac(@list.List([@integration.absolutely_integrable_eq_integrable_pos(), @vectors.lift_drop(), @transcendentals.rpow_pos_le(), @vectors.norm_pos_le()]))
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([lspace()])), t1)
  lspace_alt_c.set(@tactics.prove(@term_syntax.parse_term("lspace((s : (Cart[Real, M]) -> Bool), (p : Real)) == {(f : (Cart[Real, M]) -> Cart[Real, N]) | measurable_on(f, s) && absolutely_integrable_on((x : Cart[Real, M]) => lift(rpow(norm(f(x)), p)), s)}"), t2))
}

///|
let lspace_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_ALT")

///|
/// `LSPACE_ALT`
pub fn lspace_alt() -> @kernel.Thm {
  lspace_alt_c.get()
}

///|
/// LSPACE_ZERO
fn step_3() -> Unit raise {
  let t6 = @sets.set_tac(@list.List([]))
  let t5 = @simp.asm_rewrite_tac(@list.List([]))
  let t4 = @class.asm_cases_tac(@term_syntax.parse_term("measurable((s : (Cart[Real, M]) -> Bool))"))
  let t3 = @simp.rewrite_tac(@list.List([@measure.integrable_on_const(), @vectors.vec_eq(), @calc_num.arith_eq()]))
  let t7 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace(), @transcendentals.rpow_pow(), @realax.real_pow(), @vectors.norm_0(), @vectors.lift_num()])), @tactics.gen_tac), t3), t4), t5), t6)
  lspace_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, lspace(s, real_of_num(0)) == (if measurable(s) { {(f : (Cart[Real, M]) -> Cart[Real, N]) | measurable_on(f, s)} } else { {} })"), t7))
}

///|
let lspace_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_ZERO")

///|
/// `LSPACE_ZERO`
pub fn lspace_zero() -> @kernel.Thm {
  lspace_zero_c.get()
}

///|
/// LSPACE_CONST
fn step_4() -> Unit raise {
  let t8 = @simp.simp_tac(@list.List([lspace(), @sets.in_elim_thm(), @measure.integrable_on_const(), @measure.integrable_imp_measurable()]))
  lspace_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, ∀ p : Real, ∀ c : Cart[Real, _], measurable(s) → IN((x : Cart[Real, _]) => c, lspace(s, p))"), t8))
}

///|
let lspace_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_CONST")

///|
/// `LSPACE_CONST`
pub fn lspace_const() -> @kernel.Thm {
  lspace_const_c.get()
}

///|
/// LSPACE_0
fn step_5() -> Unit raise {
  let t9 = @simp.simp_tac(@list.List([@measure.integrable_imp_measurable(), @integration.integrable_0()]))
  let t10 = @tactics.then_tac(@simp.simp_tac(@list.List([lspace(), @sets.in_elim_thm(), @vectors.norm_0(), @transcendentals.rpow_zero(), @vectors.lift_num()])), t9)
  lspace_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, ∀ p : Real, !(p == real_of_num(0)) → (IN : ((Cart[Real, _]) -> Cart[Real, _], ((Cart[Real, _]) -> Cart[Real, _]) -> Bool) -> Bool)((x : Cart[Real, _]) => (vec : (Num) -> Cart[Real, _])(0), (lspace : ((Cart[Real, _]) -> Bool, Real, (Cart[Real, _]) -> Cart[Real, _]) -> Bool)(s, p))"), t10))
}

///|
let lspace_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_0")

///|
/// `LSPACE_0`
pub fn lspace_0() -> @kernel.Thm {
  lspace_0_c.get()
}

///|
/// LSPACE_CMUL
fn step_6() -> Unit raise {
  let t13 = @simp.simp_tac(@list.List([@measure.measurable_on_cmul(), @integration.integrable_cmul()]))
  let t12 = @simp.simp_tac(@list.List([@vectors.norm_mul(), @transcendentals.rpow_mul(), @vectors.norm_pos_le(), @vectors.lift_cmul()]))
  let t11 = @simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()]))
  let t14 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t11), t12), t13)
  lspace_cmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ c : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], IN(f, lspace(s, p)) → IN((x : Cart[Real, M]) => op_pct(c, f(x)), lspace(s, p))"), t14))
}

///|
let lspace_cmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_CMUL")

///|
/// `LSPACE_CMUL`
pub fn lspace_cmul() -> @kernel.Thm {
  lspace_cmul_c.get()
}

///|
/// LSPACE_NEG
fn step_7() -> Unit raise {
  let t15 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("-(x : Cart[Real, N]) == op_pct(-real_of_num(1), x)")), lspace_cmul()]))
  lspace_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], IN(f, lspace(s, p)) → IN((x : Cart[Real, M]) => -f(x), lspace(s, p))"), t15))
}

///|
let lspace_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_NEG")

///|
/// `LSPACE_NEG`
pub fn lspace_neg() -> @kernel.Thm {
  lspace_neg_c.get()
}

///|
/// LSPACE_ADD
fn step_8() -> Unit raise {
  let t57 = @simp.asm_simp_tac(@list.List([@real.real_le_addl(), @transcendentals.rpow_pos_le(), @realarith.real_pos()]))
  let t56 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t58 = @tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.rpow_mul()])), t56), t57)
  let t59 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.rpow_le2()), @calc_rat.asm_real_arith_tac), t58])
  let t55 = @tactics.exists_tac(@term_syntax.parse_term("rpow(real_of_num(2) * (z : Real), (p : Real))"))
  let t54 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t53 = @tactics.repeat_tac(@tactics.strip_tac)
  let t52 = @list.List([@meson.meson_tac(@list.List([@realax.real_add_sym()])), @tactics.all_tac])
  let t51 = @tactics.match_mp_tac(@real.real_wlog_le())
  let t49 = @term_syntax.parse_term("(w : Real)")
  let t50 = @tactics.spec_tac(@term_syntax.parse_term("norm((f : (Cart[Real, M]) -> Cart[Real, N])((x : Cart[Real, M])))"), t49)
  let t48 = @term_syntax.parse_term("(z : Real)")
  let t60 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("norm((g : (Cart[Real, M]) -> Cart[Real, N])((x : Cart[Real, M])))"), t48), t50), t51), @tactics.conj_tac), t52), t53), t54), t55), @tactics.conj_tac), t59)
  let t61 = @list.List([@simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @transcendentals.rpow_pos_le(), @transcendentals.rpow_le2(), @vectors.norm_triangle(), @transcendentals.rpow_le2(), @realarith.real_lt_imp_le()])), t60])
  let t47 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= rpow(norm((f : Cart[Real, N]) + (g : Cart[Real, N])), (p : Real)) && real_of_num(0) <= norm(f) && real_of_num(0) <= norm(g) && rpow(norm(f + g), p) <= rpow(norm(f) + norm(g), p)) && (real_of_num(0) <= norm(f) && real_of_num(0) <= norm(g) → rpow(norm(f) + norm(g), p) <= (e : Real)) → abs(rpow(norm(f + g), p)) <= e")))
  let t46 = @simp.rewrite_tac(@list.List([@vectors.norm_lift(), @vectors.real_abs_norm(), @vectors.lift_drop()]))
  let t62 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])")), @tactics.disch_tac), t46), t47), @tactics.conj_tac), t61)
  let t45 = @simp.asm_rewrite_tac(@list.List([]))
  let t44 = @tactics.match_mp_tac(@integration.integrable_add())
  let t43 = @tactics.match_mp_tac(@integration.integrable_cmul())
  let t63 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.lift_cmul(), @vectors.lift_add()])), t43), t44), t45)
  let t39 = @simp.rewrite_tac(@list.List([@vectors.lift_num()]))
  let t40 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@trivia.o_thm(), @vectors.drop_vec(), @transcendentals.rpow_zero(), @real.real_lt_imp_nz()])), t39)
  let t38 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_rpow())
  let t37 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_continuous_on_v1())]))
  let t41 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.image_lift_univ())])), t37), t38), @calc_rat.asm_real_arith_tac)
  let t36 = @simp.asm_rewrite_tac(@list.List([]))
  let t35 = @tactics.match_mp_tac(@measure.measurable_on_add())
  let t42 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_on_norm()), t35), t36), t41, t40])
  let t34 = @tactics.repeat_tac(@tactics.conj_tac)
  let t33 = @tactics.match_mp_tac(@measure.measurable_on_compose_continuous_0())
  let t32 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @vectors.lift_drop()])), @tactics.all_tac])
  let t64 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, M]) => lift(rpow(norm((f : (Cart[Real, M]) -> Cart[Real, N])(x) + (g : (Cart[Real, M]) -> Cart[Real, N])(x)), (p : Real)))) == o(o(lift, o((y : Real) => rpow(y, p), drop)), (x : Cart[Real, M]) => lift(norm(f(x) + g(x))))"), fn(x29 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s30 = @tactics.subst1_tac(x29)
    fn(x31 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s30(x31)
    }
  }), t32), t33), t34), t42), t63, t62])
  let t28 = @tactics.repeat_tac(@tactics.conj_tac)
  let t27 = @simp.rewrite_tac(@list.List([]))
  let t26 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, M]) => lift(rpow(real_of_num(2), (p : Real)) * (rpow(norm((f : (Cart[Real, M]) -> Cart[Real, N])(x)), p) + rpow(norm((g : (Cart[Real, M]) -> Cart[Real, N])(x)), p)))"))
  let t25 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_integrable())
  let t24 = @simp.asm_simp_tac(@list.List([@measure.measurable_on_add()]))
  let t23 = @tactics.repeat_tac(@tactics.strip_tac)
  let t22 = @simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()]))
  let t20 = @simp.asm_rewrite_tac(@list.List([@sets.not_in_empty(), @sets.in_elim_thm(), @measure.measurable_on_add()]))
  let t19 = @class.asm_cases_tac(@term_syntax.parse_term("measurable((s : (Cart[Real, M]) -> Bool))"))
  let t21 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace_zero()])), t19), t20), @tactics.all_tac])
  let t18 = @simp.asm_rewrite_tac(@list.List([]))
  let t17 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Real) == real_of_num(0)"))
  let t16 = @simp.rewrite_tac(@list.List([@realarith.real_le_lt()]))
  let t65 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t16), t17), t18), t21), t22), t23), t24), t25), t26), t27), t28), t64)
  lspace_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, N], real_of_num(0) <= p && IN(f, lspace(s, p)) && IN(g, lspace(s, p)) → IN((x : Cart[Real, M]) => f(x) + g(x), lspace(s, p))"), t65))
}

///|
let lspace_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_ADD")

///|
/// `LSPACE_ADD`
pub fn lspace_add() -> @kernel.Thm {
  lspace_add_c.get()
}

///|
/// LSPACE_SUB
fn step_9() -> Unit raise {
  let t66 = @simp.simp_tac(@list.List([@vectors.vector_sub_v1(), lspace_add(), lspace_neg()]))
  lspace_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, N], real_of_num(0) <= p && IN(f, lspace(s, p)) && IN(g, lspace(s, p)) → IN((x : Cart[Real, M]) => f(x) - g(x), lspace(s, p))"), t66))
}

///|
let lspace_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_SUB")

///|
/// `LSPACE_SUB`
pub fn lspace_sub() -> @kernel.Thm {
  lspace_sub_c.get()
}

///|
/// LSPACE_IMP_INTEGRABLE
fn step_10() -> Unit raise {
  let t67 = @simp.simp_tac(@list.List([lspace(), @sets.in_elim_thm()]))
  lspace_imp_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, _]) -> Cart[Real, _], IN(f, lspace(s, p)) → integrable_on((x : Cart[Real, _]) => lift(rpow(norm(f(x)), p)), s)"), t67))
}

///|
let lspace_imp_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_IMP_INTEGRABLE")

///|
/// `LSPACE_IMP_INTEGRABLE`
pub fn lspace_imp_integrable() -> @kernel.Thm {
  lspace_imp_integrable_c.get()
}

///|
/// LSPACE_NORM
fn step_11() -> Unit raise {
  let t68 = @simp.simp_tac(@list.List([@vectors.norm_lift(), @vectors.real_abs_norm(), @measure.measurable_on_norm()]))
  let t69 = @tactics.then_tac(@simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()])), t68)
  lspace_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, _]) -> Cart[Real, _], IN(f, lspace(s, p)) → IN((x : Cart[Real, _]) => lift(norm(f(x))), lspace(s, p))"), t69))
}

///|
let lspace_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_NORM")

///|
/// `LSPACE_NORM`
pub fn lspace_norm() -> @kernel.Thm {
  lspace_norm_c.get()
}

///|
/// LSPACE_VSUM
fn step_12() -> Unit raise {
  let t73 = @simp.asm_simp_tac(@list.List([lspace_add(), @realarith.real_lt_imp_le(), @class.eta_ax(), @sets.in_insert()]))
  let t72 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses(), @vectors.vsum_clauses(), lspace_0(), @real.real_lt_imp_nz()]))
  let t71 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t70 = @tactics.repeat_tac(@tactics.gen_tac)
  let t74 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), t70), @tactics.disch_tac), @tactics.gen_tac), t71), t72), t73)
  lspace_vsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ f : (A, Cart[Real, M]) -> Cart[Real, N], ∀ t : (A) -> Bool, real_of_num(0) < p && FINITE(t) && (∀ i : A, IN(i, t) → IN(f(i), lspace(s, p))) → IN((x : Cart[Real, M]) => vsum(t, (i : A) => f(i, x)), lspace(s, p))"), t74))
}

///|
let lspace_vsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_VSUM")

///|
/// `LSPACE_VSUM`
pub fn lspace_vsum() -> @kernel.Thm {
  lspace_vsum_c.get()
}

///|
/// LSPACE_MAX
fn step_13() -> Unit raise {
  let t119 = @simp.asm_simp_tac(@list.List([@vectors.component_le_norm()]))
  let t118 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (y : Real) && abs((x' : Real)) <= (y' : Real) → abs(max(x, x')) <= max(y, y')")))
  let t117 = @tactics.repeat_tac(@tactics.strip_tac)
  let t116 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg(), @cart.lambda_beta()]))
  let t115 = @tactics.match_mp_tac(@iterate.sum_bound())
  let t114 = @simp.gen_rewrite_tac(fn(x113 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x109 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x103 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s104 = @equal.rand_conv(x103)
        fn(x105 : @kernel.Term) -> @kernel.Thm raise {
          s104(x105)
        }
      })((fn(x106 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s107 = @equal.land_conv(x106)
        fn(x108 : @kernel.Term) -> @kernel.Thm raise {
          s107(x108)
        }
      })(x109))
    })((fn(x110 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s111 = @equal.rand_conv(x110)
      fn(x112 : @kernel.Term) -> @kernel.Thm raise {
        s111(x112)
      }
    })(x113))
  }, @list.List([@equal.gsym(@iterate.card_numseg_1())]))
  let t102 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realax.real_le_trans()))
  let t96 = @drule.part_match(@equal.lhand, @vectors.norm_le_l1())
  let t92 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @vectors.norm_pos_le()]))
  let t91 = @tactics.match_mp_tac(@transcendentals.rpow_le2())
  let t90 = @simp.rewrite_tac(@list.List([@vectors.lift_drop()]))
  let t89 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.rpow_mul()), @vectors.norm_lift(), @transcendentals.real_abs_rpow(), @vectors.real_abs_norm()]))
  let t88 = @simp.asm_simp_tac(@list.List([@transcendentals.real_max_rpow(), @vectors.norm_pos_le(), @realarith.real_lt_imp_le()]))
  let t120 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])")), @tactics.disch_tac), t88), t89), t90), t91), t92), fn(x101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x98 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x97 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x93 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s94 = @tactics.mp_tac(x93)
            fn(x95 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s94(x95)
            }
          })(t96(x97))
        })(@equal.lhand(x98))
      })((fn(x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x99.1
      })(x100))
    })(x101)(x101)
  }), t102), t114), t115), t116), t117), t118), t119)
  let t87 = @simp.simp_tac(@list.List([@transcendentals.rpow_pos_le(), @vectors.norm_pos_le()]))
  let t86 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @cart.dimindex_1(), @vectors.forall_1(), @equal.gsym(@vectors.drop_()), @vectors.lift_drop()]))
  let t85 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t84 = @simp.asm_rewrite_tac(@list.List([]))
  let t83 = @tactics.match_mp_tac(@integration.nonnegative_absolutely_integrable())
  let t82 = @tactics.match_mp_tac(@integration.absolutely_integrable_max_1())
  let t81 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t80 = @tactics.match_mp_tac(@integration.integrable_cmul())
  let t121 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.lift_cmul()])), t80), t81), t82), @tactics.conj_tac), t83), t84), t85), t86), t87), t120])
  let t79 = @simp.asm_simp_tac(@list.List([@realanalysis.measurable_on_lift_rpow(), @measure.measurable_on_norm(), @measure.measurable_on_max()]))
  let t78 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, M]) => lift(rpow(real_of_num((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))), (p : Real)) * max(rpow((norm : (Cart[Real, N]) -> Real)((f : (Cart[Real, M]) -> Cart[Real, N])(x)), p), rpow((norm : (Cart[Real, N]) -> Real)((g : (Cart[Real, M]) -> Cart[Real, N])(x)), p)))"))
  let t77 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_integrable())
  let t76 = @simp.asm_simp_tac(@list.List([@measure.measurable_on_max()]))
  let t75 = @tactics.repeat_tac(@tactics.strip_tac)
  let t122 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()])), t75), t76), t77), t78), t79), @tactics.conj_tac), t121)
  lspace_max_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ k : _, ∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, N], (IN : ((Cart[Real, M]) -> Cart[Real, N], ((Cart[Real, M]) -> Cart[Real, N]) -> Bool) -> Bool)(f, (lspace : ((Cart[Real, M]) -> Bool, Real, (Cart[Real, M]) -> Cart[Real, N]) -> Bool)(s, p)) && (IN : ((Cart[Real, M]) -> Cart[Real, N], ((Cart[Real, M]) -> Cart[Real, N]) -> Bool) -> Bool)(g, (lspace : ((Cart[Real, M]) -> Bool, Real, (Cart[Real, M]) -> Cart[Real, N]) -> Bool)(s, p)) && real_of_num(0) < p → (IN : ((Cart[Real, M]) -> Cart[Real, N], ((Cart[Real, M]) -> Cart[Real, N]) -> Bool) -> Bool)((x : Cart[Real, M]) => (lambda : ((Num) -> Real) -> Cart[Real, N])((i : Num) => max((op_dollar : (Cart[Real, N], Num) -> Real)(f(x), i), (op_dollar : (Cart[Real, N], Num) -> Real)(g(x), i))), (lspace : ((Cart[Real, M]) -> Bool, Real, (Cart[Real, M]) -> Cart[Real, N]) -> Bool)(s, p))"), t122))
}

///|
let lspace_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_MAX")

///|
/// `LSPACE_MAX`
pub fn lspace_max() -> @kernel.Thm {
  lspace_max_c.get()
}

///|
/// LSPACE_MIN
fn step_14() -> Unit raise {
  let t167 = @simp.asm_simp_tac(@list.List([@vectors.component_le_norm()]))
  let t166 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (y : Real) && abs((x' : Real)) <= (y' : Real) → abs(min(x, x')) <= max(y, y')")))
  let t165 = @tactics.repeat_tac(@tactics.strip_tac)
  let t164 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg(), @cart.lambda_beta()]))
  let t163 = @tactics.match_mp_tac(@iterate.sum_bound())
  let t162 = @simp.gen_rewrite_tac(fn(x161 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x157 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x151 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s152 = @equal.rand_conv(x151)
        fn(x153 : @kernel.Term) -> @kernel.Thm raise {
          s152(x153)
        }
      })((fn(x154 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s155 = @equal.land_conv(x154)
        fn(x156 : @kernel.Term) -> @kernel.Thm raise {
          s155(x156)
        }
      })(x157))
    })((fn(x158 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s159 = @equal.rand_conv(x158)
      fn(x160 : @kernel.Term) -> @kernel.Thm raise {
        s159(x160)
      }
    })(x161))
  }, @list.List([@equal.gsym(@iterate.card_numseg_1())]))
  let t150 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realax.real_le_trans()))
  let t144 = @drule.part_match(@equal.lhand, @vectors.norm_le_l1())
  let t140 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @vectors.norm_pos_le()]))
  let t139 = @tactics.match_mp_tac(@transcendentals.rpow_le2())
  let t138 = @simp.rewrite_tac(@list.List([@vectors.lift_drop()]))
  let t137 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.rpow_mul()), @vectors.norm_lift(), @transcendentals.real_abs_rpow(), @vectors.real_abs_norm()]))
  let t136 = @simp.asm_simp_tac(@list.List([@transcendentals.real_max_rpow(), @vectors.norm_pos_le(), @realarith.real_lt_imp_le()]))
  let t168 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])")), @tactics.disch_tac), t136), t137), t138), t139), t140), fn(x149 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x148 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x146 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x145 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x141 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s142 = @tactics.mp_tac(x141)
            fn(x143 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s142(x143)
            }
          })(t144(x145))
        })(@equal.lhand(x146))
      })((fn(x147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x147.1
      })(x148))
    })(x149)(x149)
  }), t150), t162), t163), t164), t165), t166), t167)
  let t135 = @simp.simp_tac(@list.List([@transcendentals.rpow_pos_le(), @vectors.norm_pos_le()]))
  let t134 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @cart.dimindex_1(), @vectors.forall_1(), @equal.gsym(@vectors.drop_()), @vectors.lift_drop()]))
  let t133 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t132 = @simp.asm_rewrite_tac(@list.List([]))
  let t131 = @tactics.match_mp_tac(@integration.nonnegative_absolutely_integrable())
  let t130 = @tactics.match_mp_tac(@integration.absolutely_integrable_max_1())
  let t129 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t128 = @tactics.match_mp_tac(@integration.integrable_cmul())
  let t169 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.lift_cmul()])), t128), t129), t130), @tactics.conj_tac), t131), t132), t133), t134), t135), t168])
  let t127 = @simp.asm_simp_tac(@list.List([@realanalysis.measurable_on_lift_rpow(), @measure.measurable_on_norm(), @measure.measurable_on_min()]))
  let t126 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, M]) => lift(rpow(real_of_num((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))), (p : Real)) * max(rpow((norm : (Cart[Real, N]) -> Real)((f : (Cart[Real, M]) -> Cart[Real, N])(x)), p), rpow((norm : (Cart[Real, N]) -> Real)((g : (Cart[Real, M]) -> Cart[Real, N])(x)), p)))"))
  let t125 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_integrable())
  let t124 = @simp.asm_simp_tac(@list.List([@measure.measurable_on_min()]))
  let t123 = @tactics.repeat_tac(@tactics.strip_tac)
  let t170 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()])), t123), t124), t125), t126), t127), @tactics.conj_tac), t169)
  lspace_min_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ k : _, ∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, N], (IN : ((Cart[Real, M]) -> Cart[Real, N], ((Cart[Real, M]) -> Cart[Real, N]) -> Bool) -> Bool)(f, (lspace : ((Cart[Real, M]) -> Bool, Real, (Cart[Real, M]) -> Cart[Real, N]) -> Bool)(s, p)) && (IN : ((Cart[Real, M]) -> Cart[Real, N], ((Cart[Real, M]) -> Cart[Real, N]) -> Bool) -> Bool)(g, (lspace : ((Cart[Real, M]) -> Bool, Real, (Cart[Real, M]) -> Cart[Real, N]) -> Bool)(s, p)) && real_of_num(0) < p → (IN : ((Cart[Real, M]) -> Cart[Real, N], ((Cart[Real, M]) -> Cart[Real, N]) -> Bool) -> Bool)((x : Cart[Real, M]) => (lambda : ((Num) -> Real) -> Cart[Real, N])((i : Num) => min((op_dollar : (Cart[Real, N], Num) -> Real)(f(x), i), (op_dollar : (Cart[Real, N], Num) -> Real)(g(x), i))), (lspace : ((Cart[Real, M]) -> Bool, Real, (Cart[Real, M]) -> Cart[Real, N]) -> Bool)(s, p))"), t170))
}

///|
let lspace_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_MIN")

///|
/// `LSPACE_MIN`
pub fn lspace_min() -> @kernel.Thm {
  lspace_min_c.get()
}

///|
/// LSPACE_BOUNDED_MEASURABLE
fn step_15() -> Unit raise {
  let t179 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_le2(), @realarith.real_lt_imp_le(), @vectors.norm_pos_le()]))
  let t178 = @simp.rewrite_tac(@list.List([@transcendentals.real_abs_rpow(), @vectors.real_abs_norm()]))
  let t177 = @simp.rewrite_tac(@list.List([@vectors.norm_lift(), @vectors.lift_drop()]))
  let t176 = @tactics.repeat_tac(@tactics.strip_tac)
  let t175 = @simp.asm_simp_tac(@list.List([@realanalysis.measurable_on_lift_rpow(), @measure.measurable_on_norm()]))
  let t174 = @simp.asm_simp_tac(@list.List([lspace_imp_integrable()]))
  let t173 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, M]) => lift(rpow(norm((g : (Cart[Real, M]) -> Cart[Real, P])(x)), (p : Real)))"))
  let t172 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_integrable())
  let t171 = @simp.asm_rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()]))
  let t180 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t171), t172), t173), t174), t175), t176), t177), t178), t179)
  lspace_bounded_measurable_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, P], real_of_num(0) < p && measurable_on(f, s) && IN(g, lspace(s, p)) && (∀ x : Cart[Real, M], IN(x, s) → norm(f(x)) <= norm(g(x))) → IN(f, lspace(s, p))"), t180))
}

///|
let lspace_bounded_measurable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_BOUNDED_MEASURABLE")

///|
/// `LSPACE_BOUNDED_MEASURABLE`
pub fn lspace_bounded_measurable() -> @kernel.Thm {
  lspace_bounded_measurable_c.get()
}

///|
/// LSPACE_BOUNDED_MEASURABLE_SIMPLE
fn step_16() -> Unit raise {
  let t194 = @simp.simp_tac(@list.List([@realax.real_abs(), @realarith.real_lt_imp_le()]))
  let t193 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t192 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t189 = @simp.gen_rewrite_rule(fn(x188 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x188
  }, @list.List([@topology.bounded_pos()]))
  let t191 = @tactics.first_x_assum(fn(x190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s186 = @tactics.mp_tac(x185)
      fn(x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s186(x187)
      }
    })(t189(x190))
  })
  let t184 = @simp.asm_simp_tac(@list.List([lspace_const(), @vectors.norm_lift()]))
  let t183 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ x : Real, (P : ((_) -> Cart[Real, Unit]) -> Bool)((a : _) => lift(x))) → (∃ x : (_) -> Cart[Real, Unit], P(x))")))
  let t181 = @parser.parse_type("P")
  let t182 = @tactics.match_mp_tac(@kernel.inst_type(@list.List([(@parser.parse_type("1"), t181)]), lspace_bounded_measurable()))
  let t195 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t182), t183), t184), t191), t192), t193), t194)
  lspace_bounded_measurable_simple_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], real_of_num(0) < p && measurable_on(f, s) && measurable(s) && bounded(IMAGE(f, s)) → IN(f, lspace(s, p))"), t195))
}

///|
let lspace_bounded_measurable_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_BOUNDED_MEASURABLE_SIMPLE")

///|
/// `LSPACE_BOUNDED_MEASURABLE_SIMPLE`
pub fn lspace_bounded_measurable_simple() -> @kernel.Thm {
  lspace_bounded_measurable_simple_c.get()
}

///|
/// LSPACE_INTEGRABLE_PRODUCT
fn step_17() -> Unit raise {
  let t222 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t221 = @tactics.match_mp_tac(@realanalysis.young_inequality())
  let t220 = @tactics.repeat_tac(@tactics.strip_tac)
  let t223 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_lift(), @real.real_abs_mul(), @vectors.real_abs_norm(), @vectors.lift_drop(), @vectors.drop_add()])), t220), t221), t222)
  let t219 = @simp.asm_rewrite_tac(@list.List([]))
  let t218 = @tactics.match_mp_tac(@integration.integrable_cmul())
  let t217 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul()]))
  let t216 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@realax.real_div())]))
  let t224 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integrable_add()), t216), t217), @tactics.conj_tac), t218), t219)
  let t215 = @simp.asm_rewrite_tac(@list.List([]))
  let t214 = @tactics.match_mp_tac(@measure.measurable_on_norm())
  let t213 = @tactics.match_mp_tac(@measure.measurable_on_drop_mul())
  let t212 = @simp.gen_rewrite_tac(fn(x211 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x207 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x201 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s202 = @equal.land_conv(x201)
        fn(x203 : @kernel.Term) -> @kernel.Thm raise {
          s202(x203)
        }
      })((fn(x204 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s205 = @equal.abs_conv(x204)
        fn(x206 : @kernel.Term) -> @kernel.Thm raise {
          s205(x206)
        }
      })(x207))
    })((fn(x208 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s209 = @equal.land_conv(x208)
      fn(x210 : @kernel.Term) -> @kernel.Thm raise {
        s209(x210)
      }
    })(x211))
  }, @list.List([@equal.gsym(@vectors.lift_drop())]))
  let t225 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.lift_cmul()])), t212), t213), @tactics.conj_tac), t214), t215), t224, t223])
  let t200 = @tactics.repeat_tac(@tactics.conj_tac)
  let t199 = @simp.rewrite_tac(@list.List([]))
  let t198 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, M]) => lift(rpow(norm((f : (Cart[Real, M]) -> Cart[Real, N])(x)), (p : Real)) / p) + lift(rpow(norm((g : (Cart[Real, M]) -> Cart[Real, N])(x)), (q : Real)) / q)"))
  let t197 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_integrable())
  let t196 = @tactics.repeat_tac(@tactics.strip_tac)
  let t226 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()])), t196), t197), t198), t199), t200), t225)
  lspace_integrable_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ q : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, N], real_of_num(0) < p && real_of_num(0) < q && inv(p) + inv(q) == real_of_num(1) && IN(f, lspace(s, p)) && IN(g, lspace(s, q)) → integrable_on((x : Cart[Real, M]) => lift(norm(f(x)) * norm(g(x))), s)"), t226))
}

///|
let lspace_integrable_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_INTEGRABLE_PRODUCT")

///|
/// `LSPACE_INTEGRABLE_PRODUCT`
pub fn lspace_integrable_product() -> @kernel.Thm {
  lspace_integrable_product_c.get()
}

///|
/// LSPACE_1
fn step_18() -> Unit raise {
  let t227 = @simp.rewrite_tac(@list.List([@transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t228 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@measure.absolutely_integrable_measurable(), lspace(), @sets.in_elim_thm()])), t227)
  lspace_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, IN(f, lspace(s, real_of_num(1))) == absolutely_integrable_on(f, s)"), t228))
}

///|
let lspace_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_1")

///|
/// `LSPACE_1`
pub fn lspace_1() -> @kernel.Thm {
  lspace_1_c.get()
}

///|
/// LSPACE_MONO
fn step_19() -> Unit raise {
  let t245 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t244 = @tactics.match_mp_tac(@transcendentals.rpow_1_le())
  let t246 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) → x <= max(y, (z : Real))"))), t244), t245), @calc_rat.asm_real_arith_tac)
  let t243 = @simp.asm_rewrite_tac(@list.List([]))
  let t242 = @tactics.match_mp_tac(@transcendentals.rpow_mono_le())
  let t247 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (y : Real) → x <= max((z : Real), y)"))), t242), t243), t246])
  let t240 = @term_syntax.parse_term("norm((f : (Cart[Real, M]) -> Cart[Real, N])((x : Cart[Real, M])))")
  let t241 = @tactics.disj_cases_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("real_of_num(1)"), t240]), @realax.real_le_total()))
  let t239 = @simp.rewrite_tac(@list.List([@vectors.norm_lift(), @vectors.lift_drop(), @transcendentals.real_abs_rpow(), @vectors.real_abs_norm()]))
  let t248 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])")), @tactics.disch_tac), t239), t241), t247)
  let t238 = @simp.simp_tac(@list.List([@transcendentals.rpow_pos_le(), @vectors.norm_pos_le(), @realarith.real_pos()]))
  let t237 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @cart.dimindex_1(), @vectors.forall_1(), @equal.gsym(@vectors.drop_()), @vectors.lift_drop()]))
  let t236 = @simp.asm_simp_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm(), @measure.integrable_on_const()]))
  let t235 = @tactics.match_mp_tac(@integration.nonnegative_absolutely_integrable())
  let t234 = @tactics.match_mp_tac(@integration.absolutely_integrable_max_1())
  let t249 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable()), t234), @tactics.conj_tac), t235), t236), t237), t238), t248])
  let t233 = @simp.asm_simp_tac(@list.List([@realanalysis.measurable_on_lift_rpow(), @measure.measurable_on_norm()]))
  let t232 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, M]) => lift(max(real_of_num(1), rpow(norm((f : (Cart[Real, M]) -> Cart[Real, N])(x)), (q : Real))))"))
  let t231 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_integrable())
  let t230 = @simp.asm_rewrite_tac(@list.List([]))
  let t229 = @tactics.repeat_tac(@tactics.strip_tac)
  let t250 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()])), t229), t230), t231), t232), t233), @tactics.conj_tac), t249)
  lspace_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ q : Real, IN(f, lspace(s, q)) && measurable(s) && real_of_num(0) < p && p <= q → IN(f, lspace(s, p))"), t250))
}

///|
let lspace_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_MONO")

///|
/// `LSPACE_MONO`
pub fn lspace_mono() -> @kernel.Thm {
  lspace_mono_c.get()
}

///|
/// LSPACE_INCLUSION
fn step_20() -> Unit raise {
  let t254 = @simp.asm_rewrite_tac(@list.List([]))
  let t253 = @tactics.exists_tac(@term_syntax.parse_term("(q : Real)"))
  let t252 = @tactics.match_mp_tac(lspace_mono())
  let t251 = @tactics.repeat_tac(@tactics.strip_tac)
  let t255 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset()])), t251), t252), t253), t254)
  lspace_inclusion_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ q : Real, measurable(s) && real_of_num(0) < p && p <= q → (SUBSET : (((Cart[Real, M]) -> Cart[Real, N]) -> Bool, ((Cart[Real, M]) -> Cart[Real, N]) -> Bool) -> Bool)((lspace : ((Cart[Real, M]) -> Bool, Real, (Cart[Real, M]) -> Cart[Real, N]) -> Bool)(s, q), (lspace : ((Cart[Real, M]) -> Bool, Real, (Cart[Real, M]) -> Cart[Real, N]) -> Bool)(s, p))"), t255))
}

///|
let lspace_inclusion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_INCLUSION")

///|
/// `LSPACE_INCLUSION`
pub fn lspace_inclusion() -> @kernel.Thm {
  lspace_inclusion_c.get()
}

///|
/// LSPACE_SUBSET
fn step_21() -> Unit raise {
  let t257 = @meson.asm_meson_tac(@list.List([@measure.measurable_on_lebesgue_measurable_subset(), @measure.absolutely_integrable_on_lebesgue_measurable_subset()]))
  let t256 = @tactics.repeat_tac(@tactics.strip_tac)
  let t258 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace_alt(), @sets.in_elim_thm()])), t256), t257)
  lspace_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, ∀ t : (Cart[Real, M]) -> Bool, ∀ p : Real, IN(f, lspace(t, p)) && lebesgue_measurable(s) && SUBSET(s, t) → IN(f, lspace(s, p))"), t258))
}

///|
let lspace_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_SUBSET")

///|
/// `LSPACE_SUBSET`
pub fn lspace_subset() -> @kernel.Thm {
  lspace_subset_c.get()
}

///|
/// lnorm
fn step_22() -> Unit raise {
  lnorm_c.set(@pair.new_definition(@term_syntax.parse_term("(lnorm : ((Cart[Real, _]) -> Bool, Real, (Cart[Real, _]) -> Cart[Real, _]) -> Real)((s : (Cart[Real, _]) -> Bool), (p : Real), (f : (Cart[Real, _]) -> Cart[Real, _])) == rpow(drop(integral(s, (x : Cart[Real, _]) => lift(rpow(norm(f(x)), p)))), inv(p))")))
}

///|
let lnorm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lnorm")

///|
/// `lnorm`
pub fn lnorm() -> @kernel.Thm {
  lnorm_c.get()
}

///|
/// LNORM_0
fn step_23() -> Unit raise {
  let t260 = @simp.asm_rewrite_tac(@list.List([@vectors.lift_num(), @integration.integral_0(), @vectors.drop_vec(), @transcendentals.rpow_zero(), @real.real_inv_eq_0()]))
  let t259 = @simp.asm_rewrite_tac(@list.List([lnorm(), @vectors.norm_0(), @transcendentals.rpow_zero()]))
  let t261 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t259), t260)
  lnorm_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, ∀ p : Real, !(p == real_of_num(0)) → (lnorm : ((Cart[Real, _]) -> Bool, Real, (Cart[Real, _]) -> Cart[Real, _]) -> Real)(s, p, (x : Cart[Real, _]) => (vec : (Num) -> Cart[Real, _])(0)) == real_of_num(0)"), t261))
}

///|
let lnorm_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LNORM_0")

///|
/// `LNORM_0`
pub fn lnorm_0() -> @kernel.Thm {
  lnorm_0_c.get()
}

///|
/// LNORM_CONST
fn step_24() -> Unit raise {
  let t263 = @simp.simp_tac(@list.List([@real.real_mul_rinv(), @real.real_lt_imp_nz(), @transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t262 = @simp.simp_tac(@list.List([@transcendentals.rpow_rpow(), @vectors.norm_pos_le(), @transcendentals.rpow_mul()]))
  let t264 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([lnorm(), @measure.integral_const_gen(), @vectors.drop_cmul(), @vectors.lift_drop()])), t262), t263)
  lnorm_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ c : Cart[Real, N], measurable(s) && real_of_num(0) < p → lnorm(s, p, (x : Cart[Real, M]) => c) == rpow(measure(s), inv(p)) * norm(c)"), t264))
}

///|
let lnorm_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LNORM_CONST")

///|
/// `LNORM_CONST`
pub fn lnorm_const() -> @kernel.Thm {
  lnorm_const_c.get()
}

///|
/// LNORM_MONO
fn step_25() -> Unit raise {
  let t272 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_le2(), @vectors.norm_pos_le()]))
  let t271 = @simp.asm_rewrite_tac(@list.List([@vectors.lift_drop()]))
  let t270 = @tactics.exists_tac(@term_syntax.parse_term("(t : (Cart[Real, M]) -> Bool)"))
  let t269 = @tactics.match_mp_tac(@integration.integral_drop_le_ae())
  let t268 = @simp.asm_simp_tac(@list.List([@integration.integral_drop_pos(), @vectors.lift_drop(), @transcendentals.rpow_pos_le(), @vectors.norm_pos_le()]))
  let t267 = @simp.asm_rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t266 = @tactics.match_mp_tac(@transcendentals.rpow_le2())
  let t265 = @tactics.repeat_tac(@tactics.strip_tac)
  let t273 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace(), lnorm(), @sets.in_elim_thm()])), t265), t266), t267), t268), t269), t270), t271), t272)
  lnorm_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, P], ∀ s : (Cart[Real, M]) -> Bool, ∀ t : (Cart[Real, M]) -> Bool, ∀ p : Real, real_of_num(0) <= p && IN(f, lspace(s, p)) && IN(g, lspace(s, p)) && negligible(t) && (∀ x : Cart[Real, M], IN(x, DIFF(s, t)) → norm(f(x)) <= norm(g(x))) → lnorm(s, p, f) <= lnorm(s, p, g)"), t273))
}

///|
let lnorm_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LNORM_MONO")

///|
/// `LNORM_MONO`
pub fn lnorm_mono() -> @kernel.Thm {
  lnorm_mono_c.get()
}

///|
/// LNORM_NEG
fn step_26() -> Unit raise {
  let t274 = @simp.rewrite_tac(@list.List([lnorm(), @vectors.norm_neg()]))
  lnorm_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], lnorm(s, p, (x : Cart[Real, M]) => -f(x)) == lnorm(s, p, f)"), t274))
}

///|
let lnorm_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LNORM_NEG")

///|
/// `LNORM_NEG`
pub fn lnorm_neg() -> @kernel.Thm {
  lnorm_neg_c.get()
}

///|
/// LNORM_MUL
fn step_27() -> Unit raise {
  let t279 = @simp.rewrite_tac(@list.List([@transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t278 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_rpow(), @real.real_abs_pos(), @real.real_mul_rinv()]))
  let t277 = @simp.rewrite_tac(@list.List([@vectors.drop_cmul(), @transcendentals.rpow_mul()]))
  let t276 = @simp.asm_simp_tac(@list.List([@integration.integral_cmul(), lspace_imp_integrable()]))
  let t275 = @simp.rewrite_tac(@list.List([lnorm(), @vectors.norm_mul(), @transcendentals.rpow_mul(), @vectors.lift_cmul()]))
  let t280 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t275), t276), t277), @tactics.ap_thm_tac), @tactics.ap_term_tac), t278), t279)
  lnorm_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, _]) -> Cart[Real, _], ∀ c : Real, IN(f, lspace(s, p)) && !(p == real_of_num(0)) → lnorm(s, p, (x : Cart[Real, _]) => op_pct(c, f(x))) == abs(c) * lnorm(s, p, f)"), t280))
}

///|
let lnorm_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LNORM_MUL")

///|
/// `LNORM_MUL`
pub fn lnorm_mul() -> @kernel.Thm {
  lnorm_mul_c.get()
}

///|
/// LNORM_EQ_0
fn step_28() -> Unit raise {
  let t290 = @simp.asm_rewrite_tac(@list.List([@transcendentals.rpow_eq_0(), @vectors.norm_eq_0(), @cart.cart_eq(), @vectors.vec_component()]))
  let t289 = @simp.rewrite_tac(@list.List([@vectors.forall_1(), @cart.dimindex_1(), @vectors.vec_component()]))
  let t288 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @cart.cart_eq(), @cart.lambda_beta()]))
  let t287 = @simp.gen_rewrite_tac(fn(x286 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x286
  }, @list.List([@sets.extension()]))
  let t285 = @simp.simp_tac(@list.List([@integration.has_integral_negligible_eq(), @vectors.lift(), @cart.lambda_beta(), @vectors.norm_pos_le(), @transcendentals.rpow_pos_le()]))
  let t284 = @simp.asm_simp_tac(@list.List([@integration.integral_eq_has_integral()]))
  let t283 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_eq()), @vectors.lift_num(), @vectors.lift_drop()]))
  let t282 = @simp.asm_simp_tac(@list.List([lnorm(), @transcendentals.rpow_eq_0(), @real.real_inv_eq_0()]))
  let t281 = @tactics.repeat_tac(@tactics.strip_tac)
  let t291 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()])), t281), t282), t283), t284), t285), @tactics.ap_term_tac), t287), t288), t289), t290)
  lnorm_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, _]) -> Cart[Real, _], !(p == real_of_num(0)) && IN(f, lspace(s, p)) → (lnorm(s, p, f) == real_of_num(0)) == negligible({(x : Cart[Real, _]) | IN(x, s) && !(f(x) == vec(0))})"), t291))
}

///|
let lnorm_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LNORM_EQ_0")

///|
/// `LNORM_EQ_0`
pub fn lnorm_eq_0() -> @kernel.Thm {
  lnorm_eq_0_c.get()
}

///|
/// LNORM_POS_LE
fn step_29() -> Unit raise {
  let t295 = @simp.asm_simp_tac(@list.List([@vectors.lift_drop(), @vectors.norm_pos_le(), @transcendentals.rpow_pos_le()]))
  let t294 = @tactics.match_mp_tac(@integration.integral_drop_pos())
  let t293 = @tactics.match_mp_tac(@transcendentals.rpow_pos_le())
  let t292 = @tactics.repeat_tac(@tactics.strip_tac)
  let t296 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([lspace(), @sets.in_elim_thm(), lnorm()])), t292), t293), t294), t295)
  lnorm_pos_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, _]) -> Cart[Real, _], IN(f, lspace(s, p)) → real_of_num(0) <= lnorm(s, p, f)"), t296))
}

///|
let lnorm_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LNORM_POS_LE")

///|
/// `LNORM_POS_LE`
pub fn lnorm_pos_le() -> @kernel.Thm {
  lnorm_pos_le_c.get()
}

///|
/// LNORM_NORM
fn step_30() -> Unit raise {
  let t297 = @simp.rewrite_tac(@list.List([lnorm(), @vectors.norm_lift(), @vectors.real_abs_norm()]))
  lnorm_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, _]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, _]) -> Cart[Real, _], lnorm(s, p, (x : Cart[Real, _]) => lift(norm(f(x)))) == lnorm(s, p, f)"), t297))
}

///|
let lnorm_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LNORM_NORM")

///|
/// `LNORM_NORM`
pub fn lnorm_norm() -> @kernel.Thm {
  lnorm_norm_c.get()
}

///|
/// LNORM_RPOW
fn step_31() -> Unit raise {
  let t300 = @simp.asm_simp_tac(@list.List([@realax.real_mul_linv(), @transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t299 = @simp.asm_simp_tac(@list.List([@integration.integral_drop_pos(), @vectors.lift_drop(), @vectors.norm_pos_le(), @transcendentals.rpow_rpow(), lspace_imp_integrable(), @transcendentals.rpow_pos_le()]))
  let t298 = @simp.rewrite_tac(@list.List([lnorm()]))
  let t301 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t298), t299), t300)
  lnorm_rpow_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], IN(f, lspace(s, p)) && !(p == real_of_num(0)) → rpow(lnorm(s, p, f), p) == drop(integral(s, (x : Cart[Real, M]) => lift(rpow(norm(f(x)), p))))"), t301))
}

///|
let lnorm_rpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LNORM_RPOW")

///|
/// `LNORM_RPOW`
pub fn lnorm_rpow() -> @kernel.Thm {
  lnorm_rpow_c.get()
}

///|
/// INTEGRAL_LNORM_RPOW
fn step_32() -> Unit raise {
  let t302 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.drop_eq()), @vectors.lift_drop(), lnorm_rpow()]))
  integral_lnorm_rpow_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], IN(f, lspace(s, p)) && !(p == real_of_num(0)) → integral(s, (x : Cart[Real, M]) => lift(rpow(norm(f(x)), p))) == lift(rpow(lnorm(s, p, f), p))"), t302))
}

///|
let integral_lnorm_rpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRAL_LNORM_RPOW")

///|
/// `INTEGRAL_LNORM_RPOW`
pub fn integral_lnorm_rpow() -> @kernel.Thm {
  integral_lnorm_rpow_c.get()
}

///|
/// HOELDER_INEQUALITY
fn step_33() -> Unit raise {
  let t368 = @simp.asm_rewrite_tac(@list.List([@realarith.real_mul_rid(), @realax.real_le_refl()]))
  let t367 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), @realax.real_mul_linv(), @real.real_lt_imp_nz(), @transcendentals.rpow_pos_lt()]))
  let t366 = @simp.rewrite_tac(@list.List([@vectors.drop_add(), @vectors.drop_cmul(), @vectors.lift_drop()]))
  let t365 = @simp.asm_simp_tac(@list.List([integral_lnorm_rpow(), @real.real_lt_imp_nz()]))
  let t364 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → abs(x) == x")), @transcendentals.rpow_inv()]))
  let t363 = @simp.asm_simp_tac(@list.List([@integration.integral_add(), @integration.integrable_cmul(), @integration.integral_cmul(), lspace_imp_integrable(), @real.real_abs_inv()]))
  let t362 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul(), @vectors.vector_mul_assoc()]))
  let t361 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@realax.real_div())]))
  let t369 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.lift_add(), @vectors.norm_mul(), @vectors.lift_cmul(), @transcendentals.rpow_mul()])), t361), t362), t363), t364), t365), t366), t367), t368)
  let t358 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @vectors.norm_pos_le(), lnorm_pos_le(), @real.real_le_inv_eq()]))
  let t357 = @tactics.match_mp_tac(@realanalysis.young_inequality())
  let t356 = @tactics.repeat_tac(@tactics.strip_tac)
  let t355 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) * ((c : Real) * (d : Real)) == a * c * (b * d)"))]))
  let t354 = @simp.asm_simp_tac(@list.List([@realax.real_abs(), lnorm_pos_le(), @real.real_lt_imp_nz()]))
  let t359 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.drop_cmul(), @vectors.lift_drop(), @vectors.norm_mul(), @real.real_abs_inv()])), t354), t355), t356), t357), t358)
  let t353 = @simp.asm_simp_tac(@list.List([lspace_imp_integrable(), @integration.integrable_cmul(), @vectors.lift_cmul()]))
  let t352 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@realax.real_div())]))
  let t351 = @simp.rewrite_tac(@list.List([@vectors.norm_mul(), @transcendentals.rpow_mul()]))
  let t350 = @tactics.match_mp_tac(@integration.integrable_add())
  let t360 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.lift_add()])), t350), t351), t352), t353), t359])
  let t349 = @simp.asm_simp_tac(@list.List([@vectors.lift_drop(), @integration.integrable_cmul()]))
  let t370 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integral_drop_le()), t349), @tactics.conj_tac), t360), t369])
  let t348 = @tactics.exists_tac(@term_syntax.parse_term("drop(integral((s : (Cart[Real, M]) -> Bool), (x : Cart[Real, M]) => lift(rpow(norm(op_pct(inv(lnorm(s, (p : Real), (f : (Cart[Real, M]) -> Cart[Real, N]))), f(x))), p) / p + rpow(norm(op_pct(inv(lnorm(s, (q : Real), (g : (Cart[Real, M]) -> Cart[Real, N]))), g(x))), q) / q)))"))
  let t347 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t346 = @simp.rewrite_tac(@list.List([@real.real_inv_mul()]))
  let t345 = @simp.asm_simp_tac(@list.List([@equal.gsym(@integration.integral_cmul())]))
  let t344 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_cmul())]))
  let t343 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@realax.real_div())]))
  let t342 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_ldiv_eq()), @real.real_lt_mul()]))
  let t341 = @simp.gen_rewrite_tac(fn(x338 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s339 = @equal.rand_conv(x338)
    fn(x340 : @kernel.Term) -> @kernel.Thm raise {
      s339(x340)
    }
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t335 = @meson.meson_tac(@list.List([]))
  let t334 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @cart.cart_eq(), @vectors.norm_eq_0(), @vectors.vec_component()]))
  let t333 = @simp.rewrite_tac(@list.List([@cart.dimindex_1(), @vectors.forall_1(), @vectors.vec_component()]))
  let t332 = @simp.simp_tac(@list.List([@cart.cart_eq(), @sets.subset(), @sets.in_elim_thm(), @cart.lambda_beta()]))
  let t329 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.negligible_subset()))
  let t331 = @tactics.first_x_assum(fn(x330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t329(x330))
  })
  let t328 = @simp.simp_tac(@list.List([@integration.has_integral_negligible_eq(), @vectors.lift(), @cart.lambda_beta(), @vectors.norm_pos_le(), @realax.real_le_mul()]))
  let t327 = @simp.asm_simp_tac(@list.List([@integration.integral_eq_has_integral(), @vectors.lift_num()]))
  let t326 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), lnorm_pos_le(), @equal.gsym(@vectors.lift_eq()), @vectors.lift_drop()]))
  let t325 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) && (x : Real) == real_of_num(0) → x <= y")))
  let t324 = @tactics.repeat_tac(@tactics.disch_tac)
  let t336 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([lnorm_eq_0(), @real.real_lt_imp_nz()])), t324), t325), t326), t327), t328), t331), t332), t333), t334), t335), @tactics.all_tac])
  let t323 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x317 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s318 = @tactics.mp_tac(x317)
    fn(x319 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s318(x319)
    }
  }, fn(x320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s321 = @tactics.assume_tac(x320)
    fn(x322 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s321(x322)
    }
  }))
  let t337 = @tactics.repeat_tac(@tactics.thenl(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x314 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s315 = @equal.land_conv(x314)
    fn(x316 : @kernel.Term) -> @kernel.Thm raise {
      s315(x316)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real)) == (x == real_of_num(0) || real_of_num(0) < x)"))])), t323), t336))
  let t312 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t313 = @list.List([@simp.asm_simp_tac(@list.List([lnorm_pos_le()])), t312])
  let t311 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= lnorm((s : (Cart[Real, M]) -> Bool), (p : Real), (f : (Cart[Real, M]) -> Cart[Real, N])) && real_of_num(0) <= lnorm(s, (q : Real), (g : (Cart[Real, M]) -> Cart[Real, N]))"), fn(x308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s309 = @tactics.mp_tac(x308)
    fn(x310 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s309(x310)
    }
  })
  let t307 = @simp.asm_rewrite_tac(@list.List([]))
  let t306 = @tactics.disch_then(fn(x304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x304
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t303 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t371 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(lspace_integrable_product()), t303), t306), t307), @tactics.disch_tac), t311), t313), t337), t341), t342), t343), t344), t345), t346), t347), t348), @tactics.conj_tac), t370)
  hoelder_inequality_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ q : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, N], real_of_num(0) < p && real_of_num(0) < q && inv(p) + inv(q) == real_of_num(1) && IN(f, lspace(s, p)) && IN(g, lspace(s, q)) → drop(integral(s, (x : Cart[Real, M]) => lift(norm(f(x)) * norm(g(x))))) <= lnorm(s, p, f) * lnorm(s, q, g)"), t371))
}

///|
let hoelder_inequality_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOELDER_INEQUALITY")

///|
/// `HOELDER_INEQUALITY`
pub fn hoelder_inequality() -> @kernel.Thm {
  hoelder_inequality_c.get()
}

///|
/// HOELDER_INEQUALITY_FULL
fn step_34() -> Unit raise {
  let t378 = @simp.asm_simp_tac(@list.List([hoelder_inequality()]))
  let t375 = @drule.match_mp(lspace_integrable_product())
  let t377 = @tactics.first_assum(fn(x376 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x372 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s373 = @tactics.assume_tac(x372)
      fn(x374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s373(x374)
      }
    })(t375(x376))
  })
  let t379 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t377), t378)
  hoelder_inequality_full_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ q : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, N], real_of_num(0) < p && real_of_num(0) < q && inv(p) + inv(q) == real_of_num(1) && IN(f, lspace(s, p)) && IN(g, lspace(s, q)) → integrable_on((x : Cart[Real, M]) => lift(norm(f(x)) * norm(g(x))), s) && drop(integral(s, (x : Cart[Real, M]) => lift(norm(f(x)) * norm(g(x))))) <= lnorm(s, p, f) * lnorm(s, q, g)"), t379))
}

///|
let hoelder_inequality_full_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOELDER_INEQUALITY_FULL")

///|
/// `HOELDER_INEQUALITY_FULL`
pub fn hoelder_inequality_full() -> @kernel.Thm {
  hoelder_inequality_full_c.get()
}

///|
/// LNORM_TRIANGLE
fn step_35() -> Unit raise {
  let t484 = @simp.simp_tac(@list.List([@vectors.norm_triangle(), @real.real_le_rmul(), @vectors.norm_pos_le(), @transcendentals.rpow_pos_le(), @realax.real_le_mul()]))
  let t485 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_add_rdistrib()), @vectors.lift_drop(), @vectors.drop_add()])), t484)
  let t481 = @simp.simp_tac(@list.List([lspace(), @sets.in_elim_thm(), @measure.measurable_on_norm()]))
  let t482 = @list.List([@simp.asm_simp_tac(@list.List([lspace_add(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (p : Real) → real_of_num(0) <= p"))])), t481])
  let t483 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, M]) => (f : (Cart[Real, M]) -> Cart[Real, N])(x) + (g : (Cart[Real, M]) -> Cart[Real, N])(x), lspace((s : (Cart[Real, M]) -> Bool), (p : Real)))"), fn(x478 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s479 = @tactics.mp_tac(x478)
    fn(x480 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s479(x480)
    }
  }), t482)
  let t477 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.measurable_on_lift_rpow()), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac]))])
  let t486 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_on_lift_mul()), @tactics.conj_tac), t477), t483), t485])
  let t476 = @simp.asm_simp_tac(@list.List([@integration.integrable_add()]))
  let t475 = @tactics.match_mp_tac(@measure.integral_drop_le_measurable())
  let t474 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(i2 : Real) <= (i1 : Real) → i1 <= (f : Real) * (y : Real) + (g : Real) * y → i2 <= y * (f + g)")))
  let t472 = @simp.asm_simp_tac(@list.List([@vectors.lift_drop(), @transcendentals.rpow_pos_le(), @vectors.norm_pos_le(), lspace_imp_integrable(), lspace_add(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (p : Real) → real_of_num(0) <= p"))]))
  let t471 = @tactics.match_mp_tac(@integration.integral_drop_pos())
  let t470 = @tactics.match_mp_tac(@equal.gsym(@transcendentals.rpow_rpow()))
  let t469 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t468 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t467 = @simp.rewrite_tac(@list.List([@real.real_inv_div()]))
  let t466 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("real_of_num(1) < (p : Real) → (p - real_of_num(1)) * (p / (p - real_of_num(1))) == p"))]))
  let t465 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_rpow(), @integration.integral_drop_pos(), @vectors.lift_drop(), @vectors.norm_pos_le(), @vectors.norm_lift(), @vectors.real_abs_norm(), @transcendentals.real_abs_rpow()]))
  let t473 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lnorm()])), t465), t466), t467), t468), t469), t470), t471), t472), @tactics.all_tac])
  let t464 = @tactics.subgoal_then(@term_syntax.parse_term("lnorm((s : (Cart[Real, M]) -> Bool), (p : Real) / (p - real_of_num(1)), (x : Cart[Real, M]) => lift(rpow(norm((f : (Cart[Real, M]) -> Cart[Real, N])(x) + (g : (Cart[Real, M]) -> Cart[Real, N])(x)), p - real_of_num(1)))) == rpow(lnorm(s, p, (x : Cart[Real, M]) => f(x) + g(x)), p - real_of_num(1))"), fn(x461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s462 = @tactics.subst1_tac(x461)
    fn(x463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s462(x463)
    }
  })
  let t459 = @equal.gsym(@integration.integral_add())
  let t460 = @simp.asm_simp_tac(@list.List([@equal.gsym(@vectors.drop_add()), t459]))
  let t456 = @drule.match_mp(@real.real_le_add2())
  let t458 = @tactics.disch_then(fn(x457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s454 = @tactics.mp_tac(x453)
      fn(x455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s454(x455)
      }
    })(t456(x457))
  })
  let t452 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((p1 : Bool) && (p2 : Bool) → (b1 : Bool) && (b2 : Bool) → (c : Bool)) → p1 && b1 → p2 && b2 → c")))
  let t451 = @simp.rewrite_tac(@list.List([@vectors.norm_lift(), @vectors.real_abs_norm(), lnorm_norm(), @transcendentals.real_abs_rpow()]))
  let t448 = @simp.simp_tac(@list.List([lspace(), @sets.in_elim_thm(), @measure.measurable_on_norm()]))
  let t449 = @list.List([@simp.asm_simp_tac(@list.List([lspace_add(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (p : Real) → real_of_num(0) <= p"))])), t448])
  let t447 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, M]) => (f : (Cart[Real, M]) -> Cart[Real, N])(x) + (g : (Cart[Real, M]) -> Cart[Real, N])(x), lspace((s : (Cart[Real, M]) -> Bool), (p : Real)))"), fn(x444 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s445 = @tactics.mp_tac(x444)
    fn(x446 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s445(x446)
    }
  })
  let t443 = @tactics.match_mp_tac(@realanalysis.measurable_on_lift_rpow())
  let t442 = @simp.asm_simp_tac(@list.List([lspace_imp_integrable(), lspace_add(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (p : Real) → real_of_num(0) <= p"))]))
  let t441 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("real_of_num(1) < (p : Real) → (p - real_of_num(1)) * (p / (p - real_of_num(1))) == p"))]))
  let t450 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([lspace(), @sets.in_elim_thm(), @vectors.norm_lift(), @vectors.real_abs_norm(), @transcendentals.real_abs_rpow(), @transcendentals.rpow_rpow(), @vectors.norm_pos_le()])), t441), t442), t443), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), t447), t449), @tactics.all_tac])
  let t440 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && ((q : Bool) → (r : Bool) → (s : Bool)) → (p → q) → (p → r) → s")))
  let t438 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(1) < (p : Real) → inv(p) + inv(p / (p - real_of_num(1))) == real_of_num(1)"))
  let t439 = @simp.asm_simp_tac(@list.List([lspace_norm(), @real.real_lt_div(), @realarith.real_sub_lt(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (p : Real) → real_of_num(0) < p")), t438]))
  let t433 = @term_syntax.parse_term("(x : Cart[Real, M]) => lift(rpow(norm((f : (Cart[Real, M]) -> Cart[Real, N])(x) + (g : (Cart[Real, M]) -> Cart[Real, N])(x)), (p : Real) - real_of_num(1)))")
  let t434 = @term_syntax.parse_term("(x : Cart[Real, M]) => lift(norm((f : (Cart[Real, M]) -> Cart[Real, N])(x)))")
  let t435 = @term_syntax.parse_term("(p : Real) / (p - real_of_num(1))")
  let t436 = @term_syntax.parse_term("(p : Real)")
  let t437 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)"), t436, t435, t434, t433]), hoelder_inequality_full()))
  let t428 = @term_syntax.parse_term("(x : Cart[Real, M]) => lift(rpow(norm((f : (Cart[Real, M]) -> Cart[Real, N])(x) + (g : (Cart[Real, M]) -> Cart[Real, N])(x)), (p : Real) - real_of_num(1)))")
  let t429 = @term_syntax.parse_term("(x : Cart[Real, M]) => lift(norm((g : (Cart[Real, M]) -> Cart[Real, N])(x)))")
  let t430 = @term_syntax.parse_term("(p : Real) / (p - real_of_num(1))")
  let t431 = @term_syntax.parse_term("(p : Real)")
  let t432 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)"), t431, t430, t429, t428]), hoelder_inequality_full()))
  let t427 = @simp.rewrite_tac(@list.List([@transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t426 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_add_alt(), @vectors.norm_pos_le(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(1) + (p - real_of_num(1)) == real_of_num(0) → p - real_of_num(1) == real_of_num(0)"))]))
  let t425 = @tactics.conv_tac(@equal.land_conv(@equal.subs_conv(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(p : Real) == real_of_num(1) + (p - real_of_num(1))"))]))))
  let t423 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) <= p && !(p == real_of_num(0))"))
  let t424 = @simp.asm_simp_tac(@list.List([lspace_add(), lnorm_rpow(), @calc_rat.real_arith(@term_syntax.parse_term("(p : Real) - real_of_num(1) + real_of_num(1) == p")), t423]))
  let t421 = @equal.gsym(@transcendentals.rpow_add())
  let t422 = @simp.asm_simp_tac(@list.List([@equal.gsym(@transcendentals.rpow_pow()), t421]))
  let t420 = @simp.gen_rewrite_tac(fn(x419 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x413 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s414 = @equal.land_conv(x413)
      fn(x415 : @kernel.Term) -> @kernel.Thm raise {
        s414(x415)
      }
    })((fn(x416 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s417 = @equal.rand_conv(x416)
      fn(x418 : @kernel.Term) -> @kernel.Thm raise {
        s417(x418)
      }
    })(x419))
  }, @list.List([@equal.gsym(@real.real_pow_1())]))
  let t412 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_pos_lt()]))
  let t411 = @tactics.exists_tac(@term_syntax.parse_term("rpow(lnorm((s : (Cart[Real, M]) -> Bool), (p : Real), (x : Cart[Real, M]) => (f : (Cart[Real, M]) -> Cart[Real, N])(x) + (g : (Cart[Real, M]) -> Cart[Real, N])(x)), p - real_of_num(1))"))
  let t410 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t407 = @simp.asm_simp_tac(@list.List([lnorm_pos_le(), @realarith.real_le_add()]))
  let t408 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x404 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s405 = @equal.land_conv(x404)
    fn(x406 : @kernel.Term) -> @kernel.Thm raise {
      s405(x406)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real)) == (x == real_of_num(0) || real_of_num(0) < x)"))])), @tactics.strip_tac), t407)
  let t409 = @list.List([@simp.asm_simp_tac(@list.List([lnorm_pos_le(), lspace_add(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) <= p"))])), t408])
  let t403 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= lnorm((s : (Cart[Real, M]) -> Bool), (p : Real), (x : Cart[Real, M]) => (f : (Cart[Real, M]) -> Cart[Real, N])(x) + (g : (Cart[Real, M]) -> Cart[Real, N])(x))"), fn(x400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s401 = @tactics.mp_tac(x400)
    fn(x402 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s401(x402)
    }
  })
  let t399 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(1) < (p : Real)"), fn(x396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s397 = @tactics.assume_tac(x396)
    fn(x398 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s397(x398)
    }
  })
  let t394 = @simp.asm_rewrite_tac(@list.List([]))
  let t393 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([lspace(), @sets.in_elim_thm()])))
  let t392 = @tactics.match_mp_tac(@measure.measurable_on_add())
  let t391 = @tactics.match_mp_tac(@measure.measurable_on_norm())
  let t390 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le(), @vectors.norm_triangle()]))
  let t389 = @simp.rewrite_tac(@list.List([@transcendentals.rpow_pow(), @real.real_pow_1(), @vectors.lift_drop(), @vectors.drop_add()]))
  let t388 = @simp.asm_simp_tac(@list.List([lspace_imp_integrable(), @integration.integrable_add()]))
  let t387 = @tactics.match_mp_tac(@measure.integral_drop_le_measurable())
  let t384 = @equal.gsym(@integration.integral_add())
  let t385 = @equal.gsym(@vectors.drop_add())
  let t386 = @simp.asm_simp_tac(@list.List([lnorm(), @meson.meson(@list.List([@transcendentals.rpow_pow(), @real.real_pow_1(), @real.real_inv_1()]), @term_syntax.parse_term("rpow((x : Real), inv(real_of_num(1))) == x")), t385, t384, lspace_imp_integrable()]))
  let t395 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s382 = @tactics.subst_all_tac(x381)
    fn(x383 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s382(x383)
    }
  }), t386), t387), t388), t389), t390), t391), t392), t393), t394), @tactics.all_tac])
  let t380 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Real) == real_of_num(1)"))
  let t487 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t380), t395), t399), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t403), t409), t410), t411), t412), t420), t422), t424), t425), t426), t427), t432), t437), t439), t440), @tactics.conj_tac), t450), t451), t452), @tactics.strip_tac), t458), t460), t464), t473), t474), t475), t476), @tactics.conj_tac), t486)
  lnorm_triangle_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, N], IN(f, lspace(s, p)) && IN(g, lspace(s, p)) && real_of_num(1) <= p → lnorm(s, p, (x : Cart[Real, M]) => f(x) + g(x)) <= lnorm(s, p, f) + lnorm(s, p, g)"), t487))
}

///|
let lnorm_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LNORM_TRIANGLE")

///|
/// `LNORM_TRIANGLE`
pub fn lnorm_triangle() -> @kernel.Thm {
  lnorm_triangle_c.get()
}

///|
/// VSUM_LNORM
fn step_36() -> Unit raise {
  let t516 = @simp.asm_simp_tac(@list.List([@class.eta_ax(), lspace_vsum(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) < p"))]))
  let t510 = @drule.part_match(fn(x509 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x509))
  }, lnorm_triangle())
  let t505 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (x : Real) + (y : Real) → y <= (z : Real) → a <= x + z")))
  let t504 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x498 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s499 = @tactics.mp_tac(x498)
    fn(x500 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s499(x500)
    }
  }, fn(x501 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s502 = @tactics.assume_tac(x501)
    fn(x503 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s502(x503)
    }
  }))
  let t497 = @simp.asm_simp_tac(@list.List([]))
  let t496 = @tactics.disch_then(fn(x494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x494
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t493 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t491 = @term_syntax.parse_term("(u : (A) -> Bool)")
  let t492 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(i : A)"), t491]))
  let t490 = @simp.asm_simp_tac(@list.List([@iterate.sum_clauses(), @vectors.vsum_clauses(), lnorm_0(), @realax.real_le_refl(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → !(p == real_of_num(0))"))]))
  let t489 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t488 = @tactics.repeat_tac(@tactics.gen_tac)
  let t517 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), t488), @tactics.disch_tac), @tactics.gen_tac), t489), t490), t492), t493), t496), t497), t504), t505), fn(x515 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x514 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x512 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x511 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s507 = @tactics.mp_tac(x506)
            fn(x508 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s507(x508)
            }
          })(t510(x511))
        })(@equal.lhand(x512))
      })((fn(x513 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x513.1
      })(x514))
    })(x515)(x515)
  }), t516)
  vsum_lnorm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ f : (A, Cart[Real, M]) -> Cart[Real, N], ∀ t : (A) -> Bool, real_of_num(1) <= p && FINITE(t) && (∀ i : A, IN(i, t) → IN(f(i), lspace(s, p))) → lnorm(s, p, (x : Cart[Real, M]) => vsum(t, (i : A) => f(i, x))) <= sum(t, (i : A) => lnorm(s, p, f(i)))"), t517))
}

///|
let vsum_lnorm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUM_LNORM")

///|
/// `VSUM_LNORM`
pub fn vsum_lnorm() -> @kernel.Thm {
  vsum_lnorm_c.get()
}

///|
/// HOELDER_BOUND
fn step_37() -> Unit raise {
  let t564 = @simp.rewrite_tac(@list.List([@vectors.norm_1(), @real.real_abs_le()]))
  let t563 = @simp.asm_simp_tac(@list.List([@measure.measure_pos_le(), @transcendentals.rpow_pos_le()]))
  let t565 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t563), t564)
  let t562 = @simp.asm_simp_tac(@list.List([@integration.absolutely_integrable_le()]))
  let t561 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (p : Real) → real_of_num(0) <= p"))]))
  let t566 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.rpow_le2()), t561), t562), t565])
  let t560 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a' : Real) <= (a : Real) && (b : Real) <= (b' : Real) → a <= b → a' <= b'")))
  let t558 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(1) < (p : Real) → inv(p / (p - real_of_num(1))) * p == p - real_of_num(1)"))
  let t559 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_mul(), @transcendentals.rpow_rpow(), @measure.measure_pos_le(), lnorm_rpow(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (p : Real) → real_of_num(0) <= p && !(p == real_of_num(0))")), t558, @integration.integral_drop_pos(), @vectors.lift_drop(), @vectors.norm_pos_le()]))
  let t555 = @drule.match_mp(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool) → (s : Bool)) == (q → p && r → s)"))]))(@transcendentals.rpow_le2()))
  let t552 = @term_syntax.parse_term("(p : Real)")
  let t557 = @tactics.disch_then(fn(x556 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x554 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x549 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s550 = @tactics.mp_tac(x549)
        fn(x551 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s550(x551)
        }
      })(((x553 : @kernel.Thm) => @bool.spec(t552, x553))(x554))
    })(t555(x556))
  })
  let t548 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s543 = @tactics.assume_tac(x542)
    fn(x544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s543(x544)
    }
  }, fn(x545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s546 = @tactics.mp_tac(x545)
    fn(x547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s546(x547)
    }
  }))
  let t540 = @simp.rewrite_tac(@list.List([@vectors.norm_basis_1(), @realarith.real_mul_rid(), @realax.real_mul_lid()]))
  let t539 = @tactics.conv_tac(@calc_rat.real_field)
  let t538 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(1) < (p : Real)"))
  let t541 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.match_mp_tac(@real.real_lt_div()), @tactics.all_tac])), t538), t539), t540])
  let t537 = @simp.asm_simp_tac(@list.List([lspace_const(), lnorm_const(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) < (p : Real) → real_of_num(0) < p"))]))
  let t532 = @term_syntax.parse_term("(f : (Cart[Real, M]) -> Cart[Real, N])")
  let t533 = @term_syntax.parse_term("(x : Cart[Real, M]) => (basis : (Num) -> Cart[Real, N])(1)")
  let t534 = @term_syntax.parse_term("(p : Real)")
  let t535 = @term_syntax.parse_term("(p : Real) / (p - real_of_num(1))")
  let t536 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)"), t535, t534, t533, t532]), hoelder_inequality_full()))
  let t530 = @simp.asm_simp_tac(@list.List([]))
  let t529 = @tactics.exists_tac(@term_syntax.parse_term("(p : Real)"))
  let t528 = @tactics.match_mp_tac(lspace_mono())
  let t531 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(lspace_1())])), t528), t529), t530), @calc_rat.asm_real_arith_tac), @tactics.disch_tac])
  let t527 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t525 = @simp.asm_rewrite_tac(@list.List([]))
  let t524 = @tactics.match_mp_tac(@integration.absolutely_integrable_le())
  let t523 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (a : Real) → x <= abs(a)")))
  let t522 = @simp.rewrite_tac(@list.List([@vectors.norm_1()]))
  let t521 = @simp.asm_rewrite_tac(@list.List([@realax.real_pow(), @realax.real_mul_lid()]))
  let t526 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace_1(), @transcendentals.rpow_pow(), @real.real_pow_1(), @real.real_sub_refl()])), @tactics.strip_tac), t521), t522), t523), t524), t525), @tactics.strip_tac])
  let t520 = @simp.asm_rewrite_tac(@list.List([]))
  let t519 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Real) == real_of_num(1)"))
  let t518 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) <= (p : Real)) == (p == real_of_num(1) || real_of_num(1) < p)"))]))
  let t567 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t518), t519), t520), t526), t527), @tactics.conj_tac), t531), t536), t537), @tactics.ants_tac), t541), t548), t557), t559), t560), @tactics.conj_tac), t566)
  hoelder_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, real_of_num(1) <= p && measurable(s) && IN(f, lspace(s, p)) → absolutely_integrable_on(f, s) && rpow(norm(integral(s, f)), p) <= rpow(measure(s), p - real_of_num(1)) * norm(integral(s, (x : Cart[Real, M]) => lift(rpow(norm(f(x)), p))))"), t567))
}

///|
let hoelder_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOELDER_BOUND")

///|
/// `HOELDER_BOUND`
pub fn hoelder_bound() -> @kernel.Thm {
  hoelder_bound_c.get()
}

///|
/// lproduct
fn step_38() -> Unit raise {
  lproduct_c.set(@pair.new_definition(@term_syntax.parse_term("(lproduct : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Cart[Real, 2], (Cart[Real, N]) -> Cart[Real, 2]) -> Cart[Real, 2])((s : (Cart[Real, N]) -> Bool), (f : (Cart[Real, N]) -> Cart[Real, 2]), (g : (Cart[Real, N]) -> Cart[Real, 2])) == integral(s, (x : Cart[Real, N]) => f(x) * cnj(g(x)))")))
}

///|
let lproduct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lproduct")

///|
/// `lproduct`
pub fn lproduct() -> @kernel.Thm {
  lproduct_c.get()
}

///|
/// LPRODUCT_SYM
fn step_39() -> Unit raise {
  let t583 = @simp.rewrite_tac(@list.List([@complexes.cnj_cnj()]))
  let t582 = @tactics.disch_then(fn(x579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s580 = @tactics.subst1_tac(x579)
    fn(x581 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s580(x581)
    }
  })
  let t578 = @simp.asm_rewrite_tac(@list.List([@complexes.linear_cnj(), @trivia.o_def()]))
  let t575 = @term_syntax.parse_term("cnj")
  let t576 = @term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)")
  let t577 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Cart[Real, N]) => (f : (Cart[Real, N]) -> Cart[Real, 2])(x) * cnj((g : (Cart[Real, N]) -> Cart[Real, 2])(x))"), t576, t575]), @integration.integral_linear()))
  let t573 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t574 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.cnj_mul(), @complexes.cnj_cnj()])), t573), @tactics.all_tac])
  let t572 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, N]) => (g : (Cart[Real, N]) -> Cart[Real, 2])(x) * cnj((f : (Cart[Real, N]) -> Cart[Real, 2])(x))) == ((x : Cart[Real, N]) => cnj(f(x) * cnj(g(x))))"), fn(x569 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s570 = @tactics.subst1_tac(x569)
    fn(x571 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s570(x571)
    }
  })
  let t568 = @simp.rewrite_tac(@list.List([lproduct()]))
  let t584 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t568), t572), t574), t577), t578), t582), t583)
  lproduct_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ g : (Cart[Real, N]) -> Cart[Real, 2], integrable_on((x : Cart[Real, N]) => f(x) * cnj(g(x)), s) → lproduct(s, f, g) == cnj(lproduct(s, g, f))"), t584))
}

///|
let lproduct_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRODUCT_SYM")

///|
/// `LPRODUCT_SYM`
pub fn lproduct_sym() -> @kernel.Thm {
  lproduct_sym_c.get()
}

///|
/// CXDROP_LINEAR
fn step_40() -> Unit raise {
  let t585 = @tactics.conv_tac(@complexes.complex_ring)
  let t586 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.linear(), @vectors.drop_add(), @vectors.drop_cmul(), @complexes.complex_cmul(), @complexes.cx_add(), @complexes.cx_mul()])), t585)
  cxdrop_linear_c.set(@tactics.prove(@term_syntax.parse_term("linear((y : Cart[Real, Unit]) => Cx(drop(y)))"), t586))
}

///|
let cxdrop_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CXDROP_LINEAR")

///|
/// `CXDROP_LINEAR`
pub fn cxdrop_linear() -> @kernel.Thm {
  cxdrop_linear_c.get()
}

///|
/// CX_DROP_INTEGRAL
fn step_41() -> Unit raise {
  let t590 = @simp.asm_rewrite_tac(@list.List([cxdrop_linear(), @trivia.o_def()]))
  let t587 = @term_syntax.parse_term("(y : Cart[Real, Unit]) => Cx(drop(y))")
  let t588 = @term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)")
  let t589 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(gg : (Cart[Real, N]) -> Cart[Real, Unit])"), t588, t587]), @integration.integral_linear()))
  let t591 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t589), t590)
  cx_drop_integral_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ gg : (Cart[Real, N]) -> Cart[Real, Unit], integrable_on(gg, s) → integral(s, (x : Cart[Real, N]) => Cx(drop(gg(x)))) == Cx(drop(integral(s, gg)))"), t591))
}

///|
let cx_drop_integral_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CX_DROP_INTEGRAL")

///|
/// `CX_DROP_INTEGRAL`
pub fn cx_drop_integral() -> @kernel.Thm {
  cx_drop_integral_c.get()
}

///|
/// LPRODUCT_SELF
fn step_42() -> Unit raise {
  let t598 = @simp.asm_simp_tac(@list.List([cx_drop_integral()]))
  let t597 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @vectors.lift_drop(), @complexes.complex_mul_cnj(), @complexes.cx_pow()])), @tactics.all_tac])
  let t596 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, N]) => (f : (Cart[Real, N]) -> Cart[Real, 2])(x) * cnj(f(x))) == ((x : Cart[Real, N]) => Cx(drop(lift(pow(norm(f(x)), 2)))))"), fn(x593 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s594 = @tactics.subst1_tac(x593)
    fn(x595 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s594(x595)
    }
  })
  let t592 = @simp.rewrite_tac(@list.List([lproduct()]))
  let t599 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t592), t596), t597), t598)
  lproduct_self_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ f : (Cart[Real, N]) -> Cart[Real, 2], integrable_on((x : Cart[Real, N]) => lift(pow(norm(f(x)), 2)), s) → lproduct(s, f, f) == Cx(drop(integral(s, (x : Cart[Real, N]) => lift(pow(norm(f(x)), 2)))))"), t599))
}

///|
let lproduct_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRODUCT_SELF")

///|
/// `LPRODUCT_SELF`
pub fn lproduct_self() -> @kernel.Thm {
  lproduct_self_c.get()
}

///|
/// LPRODUCT_SELF_LNORM
fn step_43() -> Unit raise {
  let t621 = @tactics.disch_then(fn(x620 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x617 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s618 = @tactics.subst1_tac(x617)
      fn(x619 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s618(x619)
      }
    })(@equal.sym(x620))
  })
  let t616 = @simp.rewrite_tac(@list.List([@transcendentals.rpow_pow()]))
  let t615 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(2) == real_of_num(0))"))]))
  let t612 = @term_syntax.parse_term("(f : (Cart[Real, N]) -> Cart[Real, 2])")
  let t613 = @term_syntax.parse_term("real_of_num(2)")
  let t614 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t613, t612]), lnorm_rpow()))
  let t611 = @simp.asm_simp_tac(@list.List([lproduct_self()]))
  let t609 = @simp.simp_tac(@list.List([@transcendentals.rpow_pow()]))
  let t607 = @simp.rewrite_rule(@list.List([lspace(), @sets.in_elim_thm()]))
  let t610 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x608 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x604 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s605 = @tactics.mp_tac(x604)
      fn(x606 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s605(x606)
      }
    })(t607(x608))
  }), t609), @tactics.all_tac])
  let t603 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((x : Cart[Real, N]) => lift(pow(norm((f : (Cart[Real, N]) -> Cart[Real, 2])(x)), 2)), (s : (Cart[Real, N]) -> Bool))"), fn(x600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s601 = @tactics.assume_tac(x600)
    fn(x602 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s601(x602)
    }
  })
  let t622 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t603), t610), t611), @tactics.ap_term_tac), t614), t615), t616), t621), @tactics.refl_tac)
  lproduct_self_lnorm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ f : (Cart[Real, N]) -> Cart[Real, 2], IN(f, lspace(s, real_of_num(2))) → lproduct(s, f, f) == Cx(pow(lnorm(s, real_of_num(2), f), 2))"), t622))
}

///|
let lproduct_self_lnorm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRODUCT_SELF_LNORM")

///|
/// `LPRODUCT_SELF_LNORM`
pub fn lproduct_self_lnorm() -> @kernel.Thm {
  lproduct_self_lnorm_c.get()
}

///|
/// LPRODUCT_CAUCHY_SCHWARZ
fn step_44() -> Unit raise {
  let t641 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t640 = @simp.asm_rewrite_tac(@list.List([]))
  let t636 = @term_syntax.parse_term("(g : (Cart[Real, N]) -> Cart[Real, 2])")
  let t637 = @term_syntax.parse_term("(f : (Cart[Real, N]) -> Cart[Real, 2])")
  let t638 = @term_syntax.parse_term("real_of_num(2)")
  let t639 = @term_syntax.parse_term("real_of_num(2)")
  let t642 = @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t639, t638, t637, t636]), hoelder_inequality())), t640), t641)
  let t633 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @complexes.complex_norm_mul(), @complexes.complex_norm_cnj(), @realax.real_le_refl()]))
  let t634 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t633)
  let t632 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t631 = @simp.asm_rewrite_tac(@list.List([]))
  let t627 = @term_syntax.parse_term("(g : (Cart[Real, N]) -> Cart[Real, 2])")
  let t628 = @term_syntax.parse_term("(f : (Cart[Real, N]) -> Cart[Real, 2])")
  let t629 = @term_syntax.parse_term("real_of_num(2)")
  let t630 = @term_syntax.parse_term("real_of_num(2)")
  let t635 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t630, t629, t628, t627]), lspace_integrable_product())), t631), t632), t634])
  let t626 = @simp.asm_rewrite_tac(@list.List([]))
  let t643 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integral_norm_bound_integral()), t626), @tactics.conj_tac), t635), t642])
  let t625 = @tactics.exists_tac(@term_syntax.parse_term("drop(integral((s : (Cart[Real, N]) -> Bool), (x : Cart[Real, N]) => lift(norm((f : (Cart[Real, N]) -> Cart[Real, 2])(x)) * norm((g : (Cart[Real, N]) -> Cart[Real, 2])(x)))))"))
  let t624 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t623 = @simp.rewrite_tac(@list.List([lproduct()]))
  let t644 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t623), t624), t625), @tactics.conj_tac), t643)
  lproduct_cauchy_schwarz_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ g : (Cart[Real, N]) -> Cart[Real, 2], IN(f, lspace(s, real_of_num(2))) && IN(g, lspace(s, real_of_num(2))) && integrable_on((x : Cart[Real, N]) => f(x) * cnj(g(x)), s) → norm(lproduct(s, f, g)) <= lnorm(s, real_of_num(2), f) * lnorm(s, real_of_num(2), g)"), t644))
}

///|
let lproduct_cauchy_schwarz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRODUCT_CAUCHY_SCHWARZ")

///|
/// `LPRODUCT_CAUCHY_SCHWARZ`
pub fn lproduct_cauchy_schwarz() -> @kernel.Thm {
  lproduct_cauchy_schwarz_c.get()
}

///|
/// LPRODUCT_RMUL
fn step_45() -> Unit raise {
  let t652 = @simp.asm_simp_tac(@list.List([@canal.integral_complex_lmul()]))
  let t650 = @tactics.conv_tac(@complexes.complex_ring)
  let t651 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.cnj_mul()])), t650), @tactics.all_tac])
  let t649 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, N]) => (f : (Cart[Real, N]) -> Cart[Real, 2])(x) * cnj((c : Cart[Real, 2]) * (h : (Cart[Real, N]) -> Cart[Real, 2])(x))) == ((x : Cart[Real, N]) => cnj(c) * (f(x) * cnj(h(x))))"), fn(x646 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s647 = @tactics.subst1_tac(x646)
    fn(x648 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s647(x648)
    }
  })
  let t645 = @simp.rewrite_tac(@list.List([lproduct()]))
  let t653 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t645), t649), t651), t652)
  lproduct_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ h : (Cart[Real, N]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], integrable_on((x : Cart[Real, N]) => f(x) * cnj(h(x)), s) → lproduct(s, f, (x : Cart[Real, N]) => c * h(x)) == cnj(c) * lproduct(s, f, h)"), t653))
}

///|
let lproduct_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRODUCT_RMUL")

///|
/// `LPRODUCT_RMUL`
pub fn lproduct_rmul() -> @kernel.Thm {
  lproduct_rmul_c.get()
}

///|
/// LPRODUCT_RSUM
fn step_46() -> Unit raise {
  let t665 = @simp.asm_rewrite_tac(@list.List([]))
  let t662 = @term_syntax.parse_term("(k : (A) -> Bool)")
  let t663 = @term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)")
  let t664 = @tactics.mp_tac(@equal.beta_rule(@bool.ispecl(@list.List([@term_syntax.parse_term("(i : A) => (x : Cart[Real, N]) => (f : (Cart[Real, N]) -> Cart[Real, 2])(x) * cnj((g : (A, Cart[Real, N]) -> Cart[Real, 2])(i, x))"), t663, t662]), @integration.integral_vsum())))
  let t660 = @simp.asm_simp_tac(@list.List([@complexes.cnj_vsum(), @equal.gsym(@complexes.vsum_complex_lmul())]))
  let t659 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t661 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t659), t660), @tactics.all_tac])
  let t658 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, N]) => (f : (Cart[Real, N]) -> Cart[Real, 2])(x) * cnj(vsum((k : (A) -> Bool), (i : A) => (g : (A, Cart[Real, N]) -> Cart[Real, 2])(i, x)))) == ((x : Cart[Real, N]) => vsum(k, (i : A) => f(x) * cnj(g(i, x))))"), fn(x655 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s656 = @tactics.subst1_tac(x655)
    fn(x657 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s656(x657)
    }
  })
  let t654 = @simp.rewrite_tac(@list.List([lproduct()]))
  let t666 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t654), t658), t661), t664), t665)
  lproduct_rsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ g : (A, Cart[Real, N]) -> Cart[Real, 2], ∀ k : (A) -> Bool, FINITE(k) && (∀ i : A, IN(i, k) → integrable_on((x : Cart[Real, N]) => f(x) * cnj(g(i, x)), s)) → lproduct(s, f, (x : Cart[Real, N]) => vsum(k, (i : A) => g(i, x))) == vsum(k, (i : A) => lproduct(s, f, g(i)))"), t666))
}

///|
let lproduct_rsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRODUCT_RSUM")

///|
/// `LPRODUCT_RSUM`
pub fn lproduct_rsum() -> @kernel.Thm {
  lproduct_rsum_c.get()
}

///|
/// LPRODUCT_LMUL
fn step_47() -> Unit raise {
  let t674 = @simp.asm_simp_tac(@list.List([@canal.integral_complex_lmul()]))
  let t672 = @tactics.conv_tac(@complexes.complex_ring)
  let t673 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t672), @tactics.all_tac])
  let t671 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, N]) => (c : Cart[Real, 2]) * (f : (Cart[Real, N]) -> Cart[Real, 2])(x) * cnj((g : (Cart[Real, N]) -> Cart[Real, 2])(x))) == ((x : Cart[Real, N]) => c * (f(x) * cnj(g(x))))"), fn(x668 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s669 = @tactics.subst1_tac(x668)
    fn(x670 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s669(x670)
    }
  })
  let t667 = @simp.rewrite_tac(@list.List([lproduct()]))
  let t675 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t667), t671), t673), t674)
  lproduct_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ g : (Cart[Real, N]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], integrable_on((x : Cart[Real, N]) => f(x) * cnj(g(x)), s) → lproduct(s, (x : Cart[Real, N]) => c * f(x), g) == c * lproduct(s, f, g)"), t675))
}

///|
let lproduct_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRODUCT_LMUL")

///|
/// `LPRODUCT_LMUL`
pub fn lproduct_lmul() -> @kernel.Thm {
  lproduct_lmul_c.get()
}

///|
/// LPRODUCT_LSUM
fn step_48() -> Unit raise {
  let t687 = @simp.asm_rewrite_tac(@list.List([]))
  let t684 = @term_syntax.parse_term("(k : (A) -> Bool)")
  let t685 = @term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)")
  let t686 = @tactics.mp_tac(@equal.beta_rule(@bool.ispecl(@list.List([@term_syntax.parse_term("(i : A) => (x : Cart[Real, N]) => (g : (A, Cart[Real, N]) -> Cart[Real, 2])(i, x) * cnj((h : (Cart[Real, N]) -> Cart[Real, 2])(x))"), t685, t684]), @integration.integral_vsum())))
  let t682 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.vsum_complex_rmul())]))
  let t681 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t683 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t681), t682), @tactics.all_tac])
  let t680 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, N]) => vsum((k : (A) -> Bool), (i : A) => (g : (A, Cart[Real, N]) -> Cart[Real, 2])(i, x)) * cnj((h : (Cart[Real, N]) -> Cart[Real, 2])(x))) == ((x : Cart[Real, N]) => vsum(k, (i : A) => g(i, x) * cnj(h(x))))"), fn(x677 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s678 = @tactics.subst1_tac(x677)
    fn(x679 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s678(x679)
    }
  })
  let t676 = @simp.rewrite_tac(@list.List([lproduct()]))
  let t688 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t676), t680), t683), t686), t687)
  lproduct_lsum_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ g : (A, Cart[Real, N]) -> Cart[Real, 2], ∀ h : (Cart[Real, N]) -> Cart[Real, 2], ∀ k : (A) -> Bool, FINITE(k) && (∀ i : A, IN(i, k) → integrable_on((x : Cart[Real, N]) => g(i, x) * cnj(h(x)), s)) → lproduct(s, (x : Cart[Real, N]) => vsum(k, (i : A) => g(i, x)), h) == vsum(k, (i : A) => lproduct(s, g(i), h))"), t688))
}

///|
let lproduct_lsum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRODUCT_LSUM")

///|
/// `LPRODUCT_LSUM`
pub fn lproduct_lsum() -> @kernel.Thm {
  lproduct_lsum_c.get()
}

///|
/// LSPACE_COMPLEX_LMUL
fn step_49() -> Unit raise {
  let t698 = @simp.asm_rewrite_tac(@list.List([]))
  let t697 = @tactics.match_mp_tac(@integration.integrable_cmul())
  let t696 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.complex_norm_mul(), @transcendentals.rpow_mul(), @vectors.lift_cmul()])), @tactics.all_tac])
  let t695 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, N]) => lift(rpow(norm((c : Cart[Real, 2]) * (h : (Cart[Real, N]) -> Cart[Real, 2])(x)), (p : Real)))) == ((x : Cart[Real, N]) => op_pct(rpow(norm(c), p), lift(rpow(norm(h(x)), p))))"), fn(x692 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s693 = @tactics.subst1_tac(x692)
    fn(x694 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s693(x694)
    }
  })
  let t690 = @simp.asm_rewrite_tac(@list.List([@measure.measurable_on_const()]))
  let t691 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.measurable_on_complex_mul()), t690), @tactics.all_tac])
  let t689 = @simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()]))
  let t699 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t689), @tactics.strip_tac), @tactics.conj_tac), t691), t695), t696), t697), t698)
  lspace_complex_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ h : (Cart[Real, N]) -> Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ p : Real, IN(h, lspace(UNIV, p)) → IN((x : Cart[Real, N]) => c * h(x), lspace(UNIV, p))"), t699))
}

///|
let lspace_complex_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_COMPLEX_LMUL")

///|
/// `LSPACE_COMPLEX_LMUL`
pub fn lspace_complex_lmul() -> @kernel.Thm {
  lspace_complex_lmul_c.get()
}

///|
/// MEASURABLE_ON_CNJ
fn step_50() -> Unit raise {
  let t711 = @simp.rewrite_tac(@list.List([@complexes.linear_cnj()]))
  let t710 = @tactics.match_mp_tac(@topology.linear_continuous_on())
  let t709 = @simp.asm_rewrite_tac(@list.List([@measure.measurable_on_univ()]))
  let t708 = @tactics.match_mp_tac(@measure.measurable_on_compose_continuous())
  let t706 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0(), @complexes.cnj_cx()]))
  let t707 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm()])), @tactics.gen_tac), @class.cond_cases_tac), t706), @tactics.all_tac])
  let t705 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, N]) => if IN(x, (s : (Cart[Real, N]) -> Bool)) { cnj((g : (Cart[Real, N]) -> Cart[Real, 2])(x)) } else { vec(0) }) == o(cnj, (x : Cart[Real, N]) => if IN(x, s) { g(x) } else { vec(0) })"), fn(x702 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s703 = @tactics.subst1_tac(x702)
    fn(x704 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s703(x704)
    }
  })
  let t701 = @simp.rewrite_tac(@list.List([]))
  let t700 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@measure.measurable_on_univ())]))
  let t712 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t700), t701), t705), t707), t708), t709), t710), t711)
  measurable_on_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, measurable_on(g, s) → measurable_on((x : Cart[Real, N]) => cnj(g(x)), s)"), t712))
}

///|
let measurable_on_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEASURABLE_ON_CNJ")

///|
/// `MEASURABLE_ON_CNJ`
pub fn measurable_on_cnj() -> @kernel.Thm {
  measurable_on_cnj_c.get()
}

///|
/// L2_CNJ_PRODUCT_INTEGRABLE
fn step_51() -> Unit raise {
  let t728 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @complexes.complex_norm_mul(), @complexes.complex_norm_cnj(), @realax.real_le_refl()]))
  let t729 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t728)
  let t726 = @calc_rat.real_arith(@term_syntax.parse_term("inv(real_of_num(2)) + inv(real_of_num(2)) == real_of_num(1)"))
  let t727 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(2)")), t726]))
  let t722 = @term_syntax.parse_term("(g : (Cart[Real, N]) -> Cart[Real, 2])")
  let t723 = @term_syntax.parse_term("(f : (Cart[Real, N]) -> Cart[Real, 2])")
  let t724 = @term_syntax.parse_term("real_of_num(2)")
  let t725 = @term_syntax.parse_term("real_of_num(2)")
  let t730 = @tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t725, t724, t723, t722]), lspace_integrable_product())), t727)
  let t719 = @simp.asm_rewrite_tac(@list.List([]))
  let t718 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([lspace(), @sets.in_elim_thm()])))
  let t720 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(measurable_on_cnj()), t718), t719)
  let t717 = @simp.asm_rewrite_tac(@list.List([]))
  let t721 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([lspace(), @sets.in_elim_thm()]))), t717), t720])
  let t731 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.measurable_on_complex_mul()), @tactics.conj_tac), t721), t730, t729])
  let t716 = @tactics.repeat_tac(@tactics.conj_tac)
  let t715 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, N]) => lift(norm((f : (Cart[Real, N]) -> Cart[Real, 2])(x)) * norm((g : (Cart[Real, N]) -> Cart[Real, 2])(x)))"))
  let t714 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_absolutely_integrable())
  let t713 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t732 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t713), t714), t715), t716), t731)
  l2_cnj_product_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ g : (Cart[Real, N]) -> Cart[Real, 2], IN(f, lspace(s, real_of_num(2))) && IN(g, lspace(s, real_of_num(2))) → integrable_on((x : Cart[Real, N]) => f(x) * cnj(g(x)), s)"), t732))
}

///|
let l2_cnj_product_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("L2_CNJ_PRODUCT_INTEGRABLE")

///|
/// `L2_CNJ_PRODUCT_INTEGRABLE`
pub fn l2_cnj_product_integrable() -> @kernel.Thm {
  l2_cnj_product_integrable_c.get()
}

///|
/// LSPACE_CNJ
fn step_52() -> Unit raise {
  let t734 = @simp.asm_simp_tac(@list.List([measurable_on_cnj(), @complexes.complex_norm_cnj()]))
  let t733 = @tactics.repeat_tac(@tactics.strip_tac)
  let t735 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()])), t733), t734)
  lspace_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, IN(f, lspace(s, real_of_num(2))) → IN((x : Cart[Real, N]) => cnj(f(x)), lspace(s, real_of_num(2)))"), t735))
}

///|
let lspace_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_CNJ")

///|
/// `LSPACE_CNJ`
pub fn lspace_cnj() -> @kernel.Thm {
  lspace_cnj_c.get()
}

///|
/// LPRODUCT_LSUB
fn step_53() -> Unit raise {
  let t748 = @simp.rewrite_tac(@list.List([]))
  let t747 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t746 = @tactics.match_mp_tac(@integration.integral_eq())
  let t745 = @simp.asm_simp_tac(@list.List([@equal.gsym(@integration.integral_sub())]))
  let t744 = @simp.asm_rewrite_tac(@list.List([]))
  let t741 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Cart[Real, 2])")
  let t742 = @term_syntax.parse_term("(b : (Cart[Real, N]) -> Cart[Real, 2])")
  let t743 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t742, t741]), l2_cnj_product_integrable()))
  let t740 = @simp.asm_rewrite_tac(@list.List([]))
  let t737 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Cart[Real, 2])")
  let t738 = @term_syntax.parse_term("(a : (Cart[Real, N]) -> Cart[Real, 2])")
  let t739 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t738, t737]), l2_cnj_product_integrable()))
  let t736 = @simp.rewrite_tac(@list.List([lproduct()]))
  let t749 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t736), t739), t740), @tactics.disch_tac), t743), t744), @tactics.disch_tac), t745), t746), t747), @tactics.disch_tac), t748), @complexes.simple_complex_arith_tac)
  lproduct_lsub_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : (Cart[Real, N]) -> Cart[Real, 2], ∀ b : (Cart[Real, N]) -> Cart[Real, 2], ∀ c : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, IN(a, lspace(s, real_of_num(2))) && IN(b, lspace(s, real_of_num(2))) && IN(c, lspace(s, real_of_num(2))) → lproduct(s, a, c) - lproduct(s, b, c) == lproduct(s, (x : Cart[Real, N]) => a(x) - b(x), c)"), t749))
}

///|
let lproduct_lsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRODUCT_LSUB")

///|
/// `LPRODUCT_LSUB`
pub fn lproduct_lsub() -> @kernel.Thm {
  lproduct_lsub_c.get()
}

///|
/// LPRODUCT_L2LIM
fn step_54() -> Unit raise {
  let t797 = @simp.asm_rewrite_tac(@list.List([@arith.ge()]))
  let t796 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t795 = @simp.asm_rewrite_tac(@list.List([]))
  let t794 = @tactics.match_mp_tac(@real.real_lt_rmul())
  let t793 = @list.List([@simp.asm_simp_tac(@list.List([@real.real_div_rmul(), @real.real_lt_imp_nz()])), @tactics.all_tac])
  let t798 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(e : Real) == e / (lnorm((s : (Cart[Real, N]) -> Bool), real_of_num(2), (h : (Cart[Real, N]) -> Cart[Real, 2])) + real_of_num(1)) * (lnorm(s, real_of_num(2), h) + real_of_num(1))"), fn(x790 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s791 = @tactics.subst1_tac(x790)
    fn(x792 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s791(x792)
    }
  }), t793), t794), t795), t796), t797), @int.asm_arith_tac)
  let t788 = @simp.asm_simp_tac(@list.List([lspace_sub(), @realarith.real_pos(), @class.eta_ax()]))
  let t789 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(lnorm_pos_le()), t788), @calc_rat.asm_real_arith_tac])
  let t799 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), @tactics.conj_tac), t789), t798])
  let t787 = @tactics.exists_tac(@term_syntax.parse_term("lnorm((s : (Cart[Real, N]) -> Bool), real_of_num(2), (x : Cart[Real, N]) => (gn : (Num, Cart[Real, N]) -> Cart[Real, 2])((n : Num), x) - (g : (Cart[Real, N]) -> Cart[Real, 2])(x)) * (lnorm(s, real_of_num(2), (h : (Cart[Real, N]) -> Cart[Real, 2])) + real_of_num(1))"))
  let t800 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realarith.real_let_trans()), t787), @tactics.conj_tac), t799)
  let t784 = @simp.asm_simp_tac(@list.List([lspace_sub(), @realarith.real_pos(), @class.eta_ax()]))
  let t785 = @tactics.then_tac(@tactics.match_mp_tac(l2_cnj_product_integrable()), t784)
  let t783 = @simp.asm_rewrite_tac(@list.List([@realarith.real_pos(), @class.eta_ax()]))
  let t786 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(lspace_sub()), t783), t785])
  let t782 = @simp.asm_rewrite_tac(@list.List([]))
  let t801 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lproduct_cauchy_schwarz()), t782), @tactics.conj_tac), t786), t800])
  let t781 = @tactics.exists_tac(@term_syntax.parse_term("lnorm((s : (Cart[Real, N]) -> Bool), real_of_num(2), (x : Cart[Real, N]) => (gn : (Num, Cart[Real, N]) -> Cart[Real, 2])((n : Num), x) - (g : (Cart[Real, N]) -> Cart[Real, 2])(x)) * lnorm(s, real_of_num(2), (h : (Cart[Real, N]) -> Cart[Real, 2]))"))
  let t780 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t778 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax()]))
  let t779 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(lproduct_lsub()), t778), @tactics.all_tac])
  let t777 = @tactics.subgoal_then(@term_syntax.parse_term("lproduct((s : (Cart[Real, N]) -> Bool), (gn : (Num, Cart[Real, N]) -> Cart[Real, 2])((n : Num)), (h : (Cart[Real, N]) -> Cart[Real, 2])) - lproduct(s, (g : (Cart[Real, N]) -> Cart[Real, 2]), h) == lproduct(s, (x : Cart[Real, N]) => gn(n, x) - g(x), h)"), fn(x774 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s775 = @tactics.subst1_tac(x774)
    fn(x776 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s775(x776)
    }
  })
  let t773 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t772 = @tactics.exists_tac(@term_syntax.parse_term("(M : Num)"))
  let t769 = @term_syntax.parse_term("(M : Num)")
  let t771 = @tactics.disch_then((x770 : @kernel.Thm) => @tactics.x_choose_tac(t769, x770))
  let t768 = @simp.asm_simp_tac(@list.List([@real.real_lt_div()]))
  let t764 = @term_syntax.parse_term("(e : Real) / (lnorm((s : (Cart[Real, N]) -> Bool), real_of_num(2), (h : (Cart[Real, N]) -> Cart[Real, 2])) + real_of_num(1))")
  let t767 = @tactics.first_x_assum(fn(x766 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x761 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s762 = @tactics.mp_tac(x761)
      fn(x763 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s762(x763)
      }
    })(((x765 : @kernel.Thm) => @bool.spec(t764, x765))(x766))
  })
  let t760 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < lnorm((s : (Cart[Real, N]) -> Bool), real_of_num(2), (h : (Cart[Real, N]) -> Cart[Real, 2])) + real_of_num(1)"), fn(x757 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s758 = @tactics.assume_tac(x757)
    fn(x759 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s758(x759)
    }
  })
  let t756 = @list.List([@simp.asm_simp_tac(@list.List([lnorm_pos_le()])), @tactics.all_tac])
  let t755 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= lnorm((s : (Cart[Real, N]) -> Bool), real_of_num(2), (h : (Cart[Real, N]) -> Cart[Real, 2]))"), fn(x752 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s753 = @tactics.assume_tac(x752)
    fn(x754 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s753(x754)
    }
  })
  let t751 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t750 = @simp.rewrite_tac(@list.List([@topology.lim_sequentially(), @vectors.dist()]))
  let t802 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t750), t751), @tactics.disch_tac), t755), t756), t760), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t767), t768), t771), t772), t773), @tactics.disch_tac), t777), t779), t780), t781), @tactics.conj_tac), t801)
  lproduct_l2lim_c.set(@tactics.prove(@term_syntax.parse_term("∀ gn : (Num, Cart[Real, N]) -> Cart[Real, 2], ∀ g : (Cart[Real, N]) -> Cart[Real, 2], ∀ h : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, (∀ n : Num, IN(gn(n), lspace(s, real_of_num(2)))) && IN(g, lspace(s, real_of_num(2))) && IN(h, lspace(s, real_of_num(2))) && (∀ e : Real, real_of_num(0) < e → (∃ M : Num, ∀ n : Num, n >= M → lnorm(s, real_of_num(2), (x : Cart[Real, N]) => gn(n, x) - g(x)) < e)) → op_minus_minus_gt((n : Num) => lproduct(s, gn(n), h), lproduct(s, g, h), sequentially)"), t802))
}

///|
let lproduct_l2lim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRODUCT_L2LIM")

///|
/// `LPRODUCT_L2LIM`
pub fn lproduct_l2lim() -> @kernel.Thm {
  lproduct_l2lim_c.get()
}

///|
/// LPRODUCT_L2LIM_RSLOT
fn step_55() -> Unit raise {
  let t821 = @simp.asm_rewrite_tac(@list.List([]))
  let t820 = @tactics.match_mp_tac(lproduct_l2lim())
  let t819 = @simp.rewrite_tac(@list.List([@canal.lim_cnj()]))
  let t817 = @simp.asm_simp_tac(@list.List([@class.eta_ax()]))
  let t816 = @tactics.match_mp_tac(l2_cnj_product_integrable())
  let t818 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lproduct_sym()), t816), t817), @tactics.all_tac])
  let t815 = @tactics.subgoal_then(@term_syntax.parse_term("lproduct((s : (Cart[Real, N]) -> Bool), (d : (Cart[Real, N]) -> Cart[Real, 2]), (m : (Cart[Real, N]) -> Cart[Real, 2])) == cnj(lproduct(s, m, d))"), fn(x812 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s813 = @tactics.subst1_tac(x812)
    fn(x814 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s813(x814)
    }
  })
  let t810 = @simp.asm_simp_tac(@list.List([@class.eta_ax()]))
  let t809 = @tactics.match_mp_tac(l2_cnj_product_integrable())
  let t808 = @tactics.match_mp_tac(lproduct_sym())
  let t807 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t811 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t807), t808), t809), t810), @tactics.all_tac])
  let t806 = @tactics.subgoal_then(@term_syntax.parse_term("((n : Num) => lproduct((s : (Cart[Real, N]) -> Bool), (d : (Cart[Real, N]) -> Cart[Real, 2]), (mn : (Num, Cart[Real, N]) -> Cart[Real, 2])(n))) == ((n : Num) => cnj(lproduct(s, mn(n), d)))"), fn(x803 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s804 = @tactics.subst1_tac(x803)
    fn(x805 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s804(x805)
    }
  })
  let t822 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t806), t811), t815), t818), t819), t820), t821)
  lproduct_l2lim_rslot_c.set(@tactics.prove(@term_syntax.parse_term("∀ mn : (Num, Cart[Real, N]) -> Cart[Real, 2], ∀ m : (Cart[Real, N]) -> Cart[Real, 2], ∀ d : (Cart[Real, N]) -> Cart[Real, 2], ∀ s : (Cart[Real, N]) -> Bool, (∀ n : Num, IN(mn(n), lspace(s, real_of_num(2)))) && IN(m, lspace(s, real_of_num(2))) && IN(d, lspace(s, real_of_num(2))) && (∀ e : Real, real_of_num(0) < e → (∃ M : Num, ∀ n : Num, n >= M → lnorm(s, real_of_num(2), (x : Cart[Real, N]) => mn(n, x) - m(x)) < e)) → op_minus_minus_gt((n : Num) => lproduct(s, d, mn(n)), lproduct(s, d, m), sequentially)"), t822))
}

///|
let lproduct_l2lim_rslot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LPRODUCT_L2LIM_RSLOT")

///|
/// `LPRODUCT_L2LIM_RSLOT`
pub fn lproduct_l2lim_rslot() -> @kernel.Thm {
  lproduct_l2lim_rslot_c.get()
}

///|
/// LSPACE_SUMMABLE_UNIV
fn step_56() -> Unit raise {
  let t1140 = @sets.set_tac(@list.List([]))
  let t1137 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.negligible_subset()))
  let t1139 = @tactics.first_x_assum(fn(x1138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1137(x1138))
  })
  let t1136 = @tactics.match_mp_tac(@integration.integral_spike_set())
  let t1135 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) < (e : Real) → x < e"))]))])
  let t1134 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, Unit], integral(DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool)), f) == integral(s, f)"), fn(x1131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1132 = @tactics.mp_tac(x1131)
    fn(x1133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1132(x1133)
    }
  })
  let t1130 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mono()))
  let t1129 = @simp.rewrite_tac(@list.List([]))
  let t1128 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t1127 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1126 = @simp.rewrite_tac(@list.List([@topology.tendsto(), @vectors.dist_0(), @vectors.norm_real(), @equal.gsym(@vectors.drop_()), @vectors.lift_drop()]))
  let t1125 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_inv_eq()]))
  let t1121 = @term_syntax.parse_term("inv((p : Real))")
  let t1124 = @tactics.disch_then(fn(x1123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1119 = @tactics.mp_tac(x1118)
      fn(x1120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1119(x1120)
      }
    })(((x1122 : @kernel.Thm) => @bool.spec(t1121, x1122))(x1123))
  })
  let t1115 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj(), @trivia.o_def()]))(@realanalysis.lim_null_rpow()))
  let t1117 = @tactics.disch_then(fn(x1116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1112 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1113 = @tactics.mp_tac(x1112)
      fn(x1114 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1113(x1114)
      }
    })(t1115(x1116))
  })
  let t1141 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1111 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1107 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1103 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x1097 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1098 = @equal.land_conv(x1097)
          fn(x1099 : @kernel.Term) -> @kernel.Thm raise {
            s1098(x1099)
          }
        })((fn(x1100 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1101 = @equal.rator_conv(x1100)
          fn(x1102 : @kernel.Term) -> @kernel.Thm raise {
            s1101(x1102)
          }
        })(x1103))
      })((fn(x1104 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1105 = @equal.land_conv(x1104)
        fn(x1106 : @kernel.Term) -> @kernel.Thm raise {
          s1105(x1106)
        }
      })(x1107))
    })((fn(x1108 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1109 = @equal.abs_conv(x1108)
      fn(x1110 : @kernel.Term) -> @kernel.Thm raise {
        s1109(x1110)
      }
    })(x1111))
  }, @list.List([@equal.gsym(@vectors.lift_drop())])), t1117), t1124), t1125), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1126), t1127), @tactics.gen_tac), t1128), t1129), t1130), t1134), t1135), @tactics.gen_tac), t1136), t1139), t1140)
  let t1092 = @simp.asm_simp_tac(@list.List([]))
  let t1091 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.sums(), @sets.inter_univ()])))
  let t1090 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.lim_null())]))
  let t1089 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.lim_null_norm())]))
  let t1088 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @calc_rat.asm_real_arith_tac])
  let t1087 = @tactics.match_mp_tac(@realanalysis.lim_null_rpow())
  let t1093 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])")), @tactics.strip_tac), t1087), @tactics.conj_tac), t1088), t1089), t1090), t1091), t1092)
  let t1086 = @simp.asm_simp_tac(@list.List([]))
  let t1085 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((x : Cart[Real, N])) <= (a : Real) && norm((y : Cart[Real, N])) <= a → norm(x - y) <= real_of_num(2) * a")))
  let t1084 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t1083 = @tactics.match_mp_tac(@transcendentals.rpow_le2())
  let t1082 = @simp.rewrite_tac(@list.List([@vectors.real_abs_norm(), @vectors.lift_drop(), @transcendentals.real_abs_rpow()]))
  let t1081 = @simp.rewrite_tac(@list.List([@vectors.norm_real(), @equal.gsym(@vectors.drop_())]))
  let t1080 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1094 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.drop_cmul(), @equal.gsym(@transcendentals.rpow_mul()), @vectors.lift_drop()])), t1080), t1081), t1082), t1083), t1084), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), t1085), t1086)
  let t1079 = @sets.set_tac(@list.List([]))
  let t1076 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.negligible_subset()))
  let t1078 = @tactics.first_x_assum(fn(x1077 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1076(x1077))
  })
  let t1075 = @tactics.match_mp_tac(@integration.integrable_spike_set())
  let t1074 = @tactics.undisch_tac(@term_syntax.parse_term("integrable_on((hp : (Cart[Real, M]) -> Cart[Real, Unit]), (s : (Cart[Real, M]) -> Bool))"))
  let t1073 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t1072 = @simp.asm_simp_tac(@list.List([@realax.real_mul_linv(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → !(p == real_of_num(0))"))]))
  let t1071 = @simp.asm_simp_tac(@list.List([@sets.diff_empty(), @integration.negligible_empty(), @transcendentals.rpow_rpow()]))
  let t1070 = @tactics.exists_tac(@term_syntax.parse_term("({} : (Cart[Real, M]) -> Bool)"))
  let t1069 = @tactics.exists_tac(@term_syntax.parse_term("(hp : (Cart[Real, M]) -> Cart[Real, Unit])"))
  let t1068 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(@integration.integrable_spike()))
  let t1067 = @simp.rewrite_tac(@list.List([@vectors.lift_drop()]))
  let t1066 = @simp.expand_tac("h")
  let t1095 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integrable_cmul()), t1066), t1067), t1068), t1069), t1070), t1071), t1072), t1073), t1074), t1075), t1078), t1079)
  let t1063 = @simp.asm_rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t1062 = @tactics.match_mp_tac(lspace_vsum())
  let t1061 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax()]))
  let t1060 = @tactics.match_mp_tac(lspace_sub())
  let t1064 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lspace_imp_integrable()), t1060), t1061), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1062), t1063), @calc_rat.asm_real_arith_tac)
  let t1059 = @sets.set_tac(@list.List([]))
  let t1057 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.negligible_subset()))
  let t1065 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x1058 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1057(x1058))
  }), t1059), t1064])
  let t1056 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)"))
  let t1055 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(@integration.integrable_spike_set()))
  let t1096 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t1055), t1056), @tactics.conj_tac), t1065), t1095, t1094, t1093])
  let t1142 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t1096), t1141])
  let t1054 = @simp.rewrite_tac(@list.List([lnorm(), @integration.integral_0(), @realanalysis.real_integral_0(), @integration.integrable_0()]))
  let t1050 = @term_syntax.parse_term("DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool))")
  let t1051 = @term_syntax.parse_term("(x : Cart[Real, M]) => op_pct(rpow(real_of_num(2), (p : Real)), lift(rpow(drop((h : (Cart[Real, M]) -> Cart[Real, Unit])(x)), p)))")
  let t1052 = @term_syntax.parse_term("(x : Cart[Real, M]) => (vec : (Num) -> Cart[Real, Unit])(0)")
  let t1053 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (x : Cart[Real, M]) => lift(rpow(norm(vsum(op_dot_dot(0, n), (i : Num) => (f : (Num, Cart[Real, M]) -> Cart[Real, N])(i, x)) - (l : (Cart[Real, M]) -> Cart[Real, N])(x)), (p : Real)))"), t1052, t1051, t1050]), @integration.dominated_convergence()))
  let t1048 = @simp.rewrite_tac(@list.List([@metric.eventually_true()]))
  let t1047 = @simp.asm_simp_tac(@list.List([@metric.trivial_limit_sequentially(), @vectors.lift_drop(), @transcendentals.rpow_pos_le()]))
  let t1046 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) => lift(rpow(drop((g : (Num, Cart[Real, M]) -> Cart[Real, Unit])(k, (x : Cart[Real, M]))), (p : Real)))"))
  let t1045 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_drop_lbound()))
  let t1049 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1045), t1046), t1047), t1048), @tactics.all_tac])
  let t1044 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, M], IN(x, DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool))) → real_of_num(0) <= drop((hp : (Cart[Real, M]) -> Cart[Real, Unit])(x))"), fn(x1041 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1042 = @tactics.assume_tac(x1041)
    fn(x1043 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1042(x1043)
    }
  })
  let t1040 = @list.List([@meson.asm_meson_tac(@list.List([@realax.real_le_trans(), @vectors.norm_pos_le()])), @tactics.all_tac])
  let t1039 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, M], IN(x, DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool))) → real_of_num(0) <= drop((h : (Cart[Real, M]) -> Cart[Real, Unit])(x))"), fn(x1036 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1037 = @tactics.assume_tac(x1036)
    fn(x1038 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1037(x1038)
    }
  })
  let t1028 = @simp.rewrite_tac(@list.List([@transcendentals.rpow_pow()]))
  let t1029 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@realax.real_mul_linv(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → !(p == real_of_num(0))"))])), t1028)
  let t1027 = @simp.asm_simp_tac(@list.List([@vectors.lift_drop(), @transcendentals.rpow_pos_le(), @metric.eventually_true()]))
  let t1026 = @simp.asm_simp_tac(@list.List([@sets.in_diff(), @metric.trivial_limit_sequentially()]))
  let t1025 = @tactics.exists_tac(@term_syntax.parse_term("(k : Num) => lift(rpow(drop((g : (Num, Cart[Real, M]) -> Cart[Real, Unit])(k, (x : Cart[Real, M]))), (p : Real)))"))
  let t1024 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_drop_lbound()))
  let t1030 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.rpow_rpow()), t1024), t1025), t1026), t1027), t1029])
  let t1023 = @tactics.exists_tac(@term_syntax.parse_term("rpow(drop((hp : (Cart[Real, M]) -> Cart[Real, Unit])((x : Cart[Real, M]))), inv((p : Real)) * p)"))
  let t1022 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1021 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == pow((y : Real), 1) → x <= y")))
  let t1020 = @simp.rewrite_tac(@list.List([@vectors.lift_drop()]))
  let t1031 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t1020), t1021), t1022), t1023), @tactics.conj_tac), t1030)
  let t1019 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @sets.in_diff()]))
  let t1032 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@transcendentals.rpow_le2()), t1019), @calc_rat.asm_real_arith_tac), t1031])
  let t1018 = @tactics.exists_tac(@term_syntax.parse_term("rpow(drop((h : (Cart[Real, M]) -> Cart[Real, Unit])((x : Cart[Real, M]))), (p : Real))"))
  let t1017 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t1016 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @realax.real_le_refl()]))
  let t1033 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_lift(), @transcendentals.real_abs_rpow(), @vectors.real_abs_norm()])), @tactics.gen_tac), @tactics.disch_tac), @class.cond_cases_tac), t1016), t1017), t1018), @tactics.conj_tac), t1032)
  let t1015 = @simp.asm_simp_tac(@list.List([@sets.in_diff()]))
  let t1014 = @tactics.exists_tac(@term_syntax.parse_term("(k : (Cart[Real, M]) -> Bool)"))
  let t1013 = @tactics.match_mp_tac(@integration.integrable_spike())
  let t1034 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("integrable_on((hp : (Cart[Real, M]) -> Cart[Real, Unit]), (s : (Cart[Real, M]) -> Bool))")), t1013), t1014), t1015), t1033])
  let t1012 = @simp.asm_simp_tac(@list.List([@realanalysis.measurable_on_lift_rpow(), @measure.measurable_on_norm(), @class.eta_ax(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) < p"))]))
  let t1011 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, M]) => if IN(x, (k : (Cart[Real, M]) -> Bool)) { lift(rpow(norm((l : (Cart[Real, M]) -> Cart[Real, N])(x)), (p : Real))) } else { (hp : (Cart[Real, M]) -> Cart[Real, Unit])(x) }"))
  let t1010 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_integrable())
  let t1008 = @simp.asm_rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t1007 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([lspace(), @sets.in_elim_thm()])))
  let t1006 = @tactics.match_mp_tac(@measure.measurable_on_vsum())
  let t1005 = @simp.rewrite_tac(@list.List([@sets.inter_univ()]))
  let t1004 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@topology.sums())]))
  let t1003 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("op_dot_dot(0, (n : Num)) == INTER(UNIV, op_dot_dot(0, n))"))]))
  let t1002 = @simp.asm_rewrite_tac(@list.List([]))
  let t1001 = @tactics.exists_tac(@term_syntax.parse_term("(k : (Cart[Real, M]) -> Bool)"))
  let t1000 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (x : Cart[Real, M]) => vsum(op_dot_dot(0, n), (i : Num) => (f : (Num, Cart[Real, M]) -> Cart[Real, N])(i, x))"))
  let t1009 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_on_limit()), t1000), t1001), t1002), t1003), t1004), @tactics.gen_tac), t1005), t1006), t1007), t1008), @tactics.disch_tac])
  let t999 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t1035 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()])), t999), @tactics.conj_tac), t1009), t1010), t1011), t1012), @tactics.conj_tac), t1034), @tactics.disch_tac])
  let t998 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t996 = @simp.asm_simp_tac(@list.List([@sets.inter_univ()]))
  let t995 = @tactics.match_mp_tac(@metric.always_eventually())
  let t994 = @simp.asm_simp_tac(@list.List([@sets.in_diff(), @equal.gsym(@topology.sums()), @metric.trivial_limit_sequentially()]))
  let t993 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => vsum(INTER(UNIV, op_dot_dot(0, n)), (i : Num) => (f : (Num, Cart[Real, M]) -> Cart[Real, N])(i, (x : Cart[Real, M])))"))
  let t992 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_norm_ubound()))
  let t997 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t992), t993), t994), t995), t996), @tactics.all_tac])
  let t991 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, M], IN(x, DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool))) → norm((l : (Cart[Real, M]) -> Cart[Real, N])(x)) <= drop((h : (Cart[Real, M]) -> Cart[Real, Unit])(x))"), fn(x988 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s989 = @tactics.assume_tac(x988)
    fn(x990 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s989(x990)
    }
  })
  let t984 = @tactics.undisch_tac(@term_syntax.parse_term("(n : Num) <= (m : Num)"))
  let t983 = @simp.rewrite_tac(@list.List([@sets.subset(), @iterate.in_numseg(), @vectors.norm_pos_le(), @iterate.finite_numseg()]))
  let t982 = @tactics.match_mp_tac(@iterate.sum_subset_simple())
  let t981 = @simp.simp_tac(@list.List([@vectors.drop_vsum(), @iterate.finite_numseg(), @trivia.o_def(), @vectors.lift_drop()]))
  let t980 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t979 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t985 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@metric.eventually_sequentially()])), t979), t980), @tactics.disch_tac), t981), t982), t983), t984), @int.arith_tac)
  let t978 = @simp.asm_simp_tac(@list.List([@sets.in_diff()]))
  let t986 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@class.fun_eq_thm()]))), t978), t985])
  let t977 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t976 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => vsum(op_dot_dot(0, n), (i : Num) => lift(norm((f : (Num, Cart[Real, M]) -> Cart[Real, N])(i, (x : Cart[Real, M])))))"))
  let t975 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_drop_lbound()))
  let t974 = @simp.simp_tac(@list.List([@vectors.lift_sum(), @iterate.finite_numseg()]))
  let t973 = @simp.gen_rewrite_tac(fn(x970 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s971 = @equal.land_conv(x970)
    fn(x972 : @kernel.Term) -> @kernel.Thm raise {
      s971(x972)
    }
  }, @list.List([@equal.gsym(@vectors.lift_drop())]))
  let t969 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t968 = @tactics.match_mp_tac(@vectors.vsum_norm_triangle())
  let t987 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t968), t969), t973), t974), t975), t976), t977), @tactics.conj_tac), t986), @tactics.all_tac])
  let t967 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∀ x : Cart[Real, M], IN(x, DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool))) → norm(vsum(op_dot_dot(0, n), (i : Num) => (f : (Num, Cart[Real, M]) -> Cart[Real, N])(i, x))) <= drop((h : (Cart[Real, M]) -> Cart[Real, Unit])(x))"), fn(x964 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s965 = @tactics.assume_tac(x964)
    fn(x966 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s965(x966)
    }
  })
  let t963 = @tactics.x_gen_tac(@term_syntax.parse_term("(l : (Cart[Real, M]) -> Cart[Real, N])"))
  let t962 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t961 = @simp.rewrite_tac(@list.List([@class.skolem_thm()]))
  let t960 = @simp.gen_rewrite_tac(fn(x959 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x953 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s954 = @equal.land_conv(x953)
      fn(x955 : @kernel.Term) -> @kernel.Thm raise {
        s954(x955)
      }
    })((fn(x956 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s957 = @equal.once_depth_conv(x956)
      fn(x958 : @kernel.Term) -> @kernel.Thm raise {
        s957(x958)
      }
    })(x959))
  }, @list.List([@class.right_imp_exists_thm()]))
  let t952 = @simp.rewrite_tac(@list.List([@topology.summable()]))
  let t950 = @simp.asm_simp_tac(@list.List([]))
  let t949 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@class.fun_eq_thm()])))
  let t948 = @simp.rewrite_tac(@list.List([@topology.sums(), @sets.inter_univ()]))
  let t947 = @tactics.exists_tac(@term_syntax.parse_term("(h : (Cart[Real, M]) -> Cart[Real, Unit])((x : Cart[Real, M]))"))
  let t946 = @simp.rewrite_tac(@list.List([@topology.summable()]))
  let t945 = @tactics.match_mp_tac(@topology.series_lift_absconv_imp_conv())
  let t951 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t945), t946), t947), t948), t949), t950), @tactics.all_tac])
  let t944 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, M], IN(x, DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool))) → summable(UNIV, (i : Num) => (f : (Num, Cart[Real, M]) -> Cart[Real, N])(i, x))"), fn(x941 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s942 = @tactics.mp_tac(x941)
    fn(x943 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s942(x943)
    }
  })
  let t939 = @simp.rewrite_tac(@list.List([@transcendentals.rpow_pow(), @real.real_pow_1(), @vectors.lift_drop(), @class.eta_ax()]))
  let t938 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_rpow(), @real.real_mul_rinv(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → !(p == real_of_num(0))"))]))
  let t937 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_drop()]))
  let t936 = @simp.expand_tac("h")
  let t934 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t933 = @tactics.match_mp_tac(@realanalysis.real_continuous_at_rpow())
  let t932 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_continuous_continuous_atreal())]))
  let t935 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x931 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x925 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s926 = @equal.rand_conv(x925)
      fn(x927 : @kernel.Term) -> @kernel.Thm raise {
        s926(x927)
      }
    })((fn(x928 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s929 = @equal.rand_conv(x928)
      fn(x930 : @kernel.Term) -> @kernel.Thm raise {
        s929(x930)
      }
    })(x931))
  }, @list.List([@equal.gsym(@vectors.lift_drop())])), t932), t933), t934), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t924 = @simp.asm_simp_tac(@list.List([]))
  let t920 = @term_syntax.parse_term("(hp : (Cart[Real, M]) -> Cart[Real, Unit])((x : Cart[Real, M]))")
  let t921 = @term_syntax.parse_term("(i : Num) => lift(rpow(drop((g : (Num, Cart[Real, M]) -> Cart[Real, Unit])(i, (x : Cart[Real, M]))), (p : Real)))")
  let t922 = @term_syntax.parse_term("sequentially")
  let t923 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("o(lift, o((x : Real) => rpow(x, inv((p : Real))), drop))"), t922, t921, t920]), @topology.lim_continuous_function()))
  let t940 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])")), @tactics.disch_tac), t923), t924), @tactics.ants_tac), t935), t936), t937), t938), t939), @tactics.all_tac])
  let t919 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, M], IN(x, DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool))) → op_minus_minus_gt((i : Num) => (g : (Num, Cart[Real, M]) -> Cart[Real, Unit])(i, x), (h : (Cart[Real, M]) -> Cart[Real, Unit])(x), sequentially)"), fn(x916 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s917 = @tactics.assume_tac(x916)
    fn(x918 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s917(x918)
    }
  })
  let t915 = @simp.abbrev_tac(@term_syntax.parse_term("(h : (Cart[Real, M]) -> Cart[Real, Unit]) == ((x : Cart[Real, M]) => lift(rpow(drop((hp : (Cart[Real, M]) -> Cart[Real, Unit])(x)), inv((p : Real)))))"))
  let t913 = @term_syntax.parse_term("(k : (Cart[Real, M]) -> Bool)")
  let t914 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(hp : (Cart[Real, M]) -> Cart[Real, Unit])"), t913]))
  let t912 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t910 = @simp.asm_simp_tac(@list.List([lnorm_pos_le()]))
  let t909 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (a : Real) → real_of_num(0) <= abs(x) && abs(x) <= a")))
  let t908 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) <= p"))]))
  let t907 = @tactics.match_mp_tac(@transcendentals.rpow_le2())
  let t906 = @simp.rewrite_tac(@list.List([@vectors.norm_lift(), @transcendentals.real_abs_rpow()]))
  let t905 = @simp.asm_simp_tac(@list.List([integral_lnorm_rpow(), @class.eta_ax(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → !(p == real_of_num(0))"))]))
  let t904 = @tactics.disch_then(fn(x903 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t902 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t901 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t900 = @tactics.exists_tac(@term_syntax.parse_term("rpow((M : Real), (p : Real))"))
  let t899 = @simp.rewrite_tac(@list.List([@topology.bounded()]))
  let t898 = @simp.asm_simp_tac(@list.List([lspace_imp_integrable(), @class.eta_ax()]))
  let t896 = @simp.asm_rewrite_tac(@list.List([@realax.real_abs()]))
  let t895 = @simp.rewrite_tac(@list.List([@vectors.norm_real(), @equal.gsym(@vectors.drop_())]))
  let t897 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t895), t896), @tactics.all_tac])
  let t894 = @tactics.subgoal_then(@term_syntax.parse_term("∀ k : Num, ∀ x : Cart[Real, M], drop((g : (Num, Cart[Real, M]) -> Cart[Real, Unit])(k, x)) == norm(g(k, x))"), fn(x892 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x892
    @simp.rewrite_tac(@list.List([th]))
  })
  let t888 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_drop(), @vectors.norm_pos_le()]))
  let t889 = @tactics.then_tac(@simp.simp_tac(@list.List([@iterate.sum_clauses_numseg(), @arith.le_0(), @real.real_le_addr()])), t888)
  let t887 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_drop(), @vectors.norm_pos_le()]))
  let t890 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_pos_le_numseg()), t887), t889, @calc_rat.asm_real_arith_tac])
  let t886 = @tactics.repeat_tac(@tactics.conj_tac)
  let t885 = @tactics.match_mp_tac(@transcendentals.rpow_le2())
  let t884 = @simp.simp_tac(@list.List([@vectors.drop_vsum(), @iterate.finite_numseg()]))
  let t883 = @simp.expand_tac("g")
  let t891 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t883), t884), t885), t886), t890), @tactics.all_tac])
  let t911 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) && (a : Bool) && (c : Bool) → a && b && c"))), @tactics.conj_tac), t891), t894), t897), t898), t899), t900), t901), t902), t904), t905), t906), t907), t908), t909), t910), @tactics.all_tac])
  let t882 = @simp.rewrite_tac(@list.List([@vectors.lift_drop()]))
  let t880 = @term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)")
  let t881 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(i : Num) => (x : Cart[Real, M]) => lift(rpow(drop((g : (Num, Cart[Real, M]) -> Cart[Real, Unit])(i, x)), (p : Real)))"), t880]), @integration.beppo_levi_monotone_convergence_increasing()))
  let t878 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_drop(), @vectors.norm_pos_le()]))
  let t877 = @tactics.match_mp_tac(@iterate.sum_pos_le_numseg())
  let t876 = @simp.simp_tac(@list.List([@vectors.drop_vsum(), @iterate.finite_numseg(), @vectors.lift_drop()]))
  let t875 = @simp.expand_tac("g")
  let t879 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t875), t876), t877), t878), @tactics.all_tac])
  let t874 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∀ x : Cart[Real, M], real_of_num(0) <= drop((g : (Num, Cart[Real, M]) -> Cart[Real, Unit])(n, x))"), fn(x871 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s872 = @tactics.assume_tac(x871)
    fn(x873 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s872(x873)
    }
  })
  let t869 = @simp.asm_simp_tac(@list.List([lspace_norm(), @class.eta_ax()]))
  let t868 = @list.List([@calc_rat.asm_real_arith_tac, @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))])
  let t867 = @tactics.match_mp_tac(lspace_vsum())
  let t866 = @simp.rewrite_tac(@list.List([]))
  let t870 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.expand_tac("g")), t866), t867), @tactics.conj_tac), t868), t869), @tactics.all_tac])
  let t865 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, IN((g : (Num, Cart[Real, M]) -> Cart[Real, Unit])(n), lspace((s : (Cart[Real, M]) -> Bool), (p : Real)))"), fn(x862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s863 = @tactics.assume_tac(x862)
    fn(x864 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s863(x864)
    }
  })
  let t860 = @simp.asm_simp_tac(@list.List([lnorm_pos_le()]))
  let t859 = @tactics.match_mp_tac(@realanalysis.real_partial_sums_le_infsum())
  let t858 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t857 = @simp.gen_rewrite_tac(fn(x856 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x850 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s851 = @equal.land_conv(x850)
      fn(x852 : @kernel.Term) -> @kernel.Thm raise {
        s851(x852)
      }
    })((fn(x853 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s854 = @equal.land_conv(x853)
      fn(x855 : @kernel.Term) -> @kernel.Thm raise {
        s854(x855)
      }
    })(x856))
  }, @list.List([@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == INTER(UNIV, s)"))]))
  let t849 = @simp.expand_tac("M")
  let t848 = @simp.rewrite_tac(@list.List([lnorm_norm()]))
  let t847 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realax.real_le_trans()))
  let t846 = @simp.asm_simp_tac(@list.List([@iterate.finite_numseg(), lspace_norm(), @class.eta_ax()]))
  let t840 = @drule.part_match(fn(x839 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x839))
  }, vsum_lnorm())
  let t861 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.expand_tac("g")), fn(x845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x844 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x842 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x841 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x836 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s837 = @tactics.mp_tac(x836)
            fn(x838 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s837(x838)
            }
          })(t840(x841))
        })(@equal.lhand(x842))
      })((fn(x843 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x843.1
      })(x844))
    })(x845)(x845)
  }), t846), t847), t848), t849), t857), t858), t859), t860), @tactics.all_tac])
  let t835 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, lnorm((s : (Cart[Real, M]) -> Bool), (p : Real), (g : (Num, Cart[Real, M]) -> Cart[Real, Unit])(n)) <= (M : Real)"), fn(x832 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s833 = @tactics.assume_tac(x832)
    fn(x834 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s833(x834)
    }
  })
  let t831 = @simp.abbrev_tac(@term_syntax.parse_term("(g : (Num, Cart[Real, M]) -> Cart[Real, Unit]) == ((n : Num) => (x : Cart[Real, M]) => vsum(op_dot_dot(0, n), (i : Num) => lift(norm((f : (Num, Cart[Real, M]) -> Cart[Real, N])(i, x)))))"))
  let t830 = @simp.abbrev_tac(@term_syntax.parse_term("(M : Real) == real_infsum(UNIV, (i : Num) => lnorm((s : (Cart[Real, M]) -> Bool), (p : Real), (f : (Num, Cart[Real, M]) -> Cart[Real, N])(i)))"))
  let t827 = @simp.gen_rewrite_rule(fn(x826 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x826
  }, @list.List([@equal.gsym(@realanalysis.real_sums_infsum())]))
  let t829 = @tactics.first_assum(fn(x828 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x823 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s824 = @tactics.mp_tac(x823)
      fn(x825 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s824(x825)
      }
    })(t827(x828))
  })
  let t1143 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t829), t830), @tactics.disch_tac), t831), t835), t861), t865), t870), t874), t879), t881), t882), @tactics.ants_tac), t911), t912), t914), @tactics.strip_tac), t915), t919), t940), t944), t951), t952), t960), t961), t962), t963), @tactics.disch_tac), t967), t987), t991), t997), t998), @tactics.conj_tac), t1035), t1039), t1040), t1044), t1049), t1053), t1054), @tactics.ants_tac), t1142)
  lspace_summable_univ_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, Cart[Real, M]) -> Cart[Real, N], ∀ p : Real, ∀ s : (Cart[Real, M]) -> Bool, real_of_num(1) <= p && (∀ i : Num, IN(f(i), lspace(s, p))) && real_summable(UNIV, (i : Num) => lnorm(s, p, f(i))) → (∃ g : (Cart[Real, M]) -> Cart[Real, N], IN(g, lspace(s, p)) && (∀ e : Real, real_of_num(0) < e → eventually((n : Num) => lnorm(s, p, (x : Cart[Real, M]) => vsum(op_dot_dot(0, n), (i : Num) => f(i, x)) - g(x)) < e, sequentially)))"), t1143))
}

///|
let lspace_summable_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_SUMMABLE_UNIV")

///|
/// `LSPACE_SUMMABLE_UNIV`
pub fn lspace_summable_univ() -> @kernel.Thm {
  lspace_summable_univ_c.get()
}

///|
/// LSPACE_SUMMABLE
fn step_57() -> Unit raise {
  let t1183 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {(x : _) | IN(x, t) && IN(x, s)}"))]))
  let t1182 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vsum_restrict_set())]))
  let t1181 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])"))
  let t1184 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))), t1181), t1182), t1183)
  let t1180 = @simp.asm_simp_tac(@list.List([@class.eta_ax(), lspace_0(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → !(p == real_of_num(0))"))]))
  let t1179 = @class.asm_cases_tac(@term_syntax.parse_term("IN((i : Num), (t : (Num) -> Bool))"))
  let t1178 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t1177 = @simp.asm_simp_tac(@list.List([@iterate.finite_numseg(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) < p"))]))
  let t1176 = @tactics.match_mp_tac(lspace_vsum())
  let t1175 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) <= p"))]))
  let t1174 = @tactics.match_mp_tac(lspace_sub())
  let t1185 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lnorm_pos_le()), t1174), t1175), t1176), t1177), t1178), t1179), t1180), t1184])
  let t1173 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x == (y : Real) → x < (e : Real) → abs(y) < e")))
  let t1172 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t1171 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1170 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mono()))
  let t1169 = @simp.rewrite_tac(@list.List([]))
  let t1168 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t1167 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1166 = @simp.asm_rewrite_tac(@list.List([@realanalysis.tendsto_real()]))
  let t1165 = @class.asm_cases_tac(@term_syntax.parse_term("IN((g : (Cart[Real, M]) -> Cart[Real, N]), lspace((s : (Cart[Real, M]) -> Bool), (p : Real)))"))
  let t1164 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : (Cart[Real, M]) -> Cart[Real, N])"))
  let t1186 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t1164), t1165), t1166), t1167), @tactics.gen_tac), t1168), t1169), t1170), t1171), t1172), t1173), @tactics.conj_tac), t1185)
  let t1162 = @simp.asm_simp_tac(@list.List([@class.eta_ax(), lnorm_0(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → !(p == real_of_num(0))"))]))
  let t1161 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t1160 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1159 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1158 = @simp.rewrite_tac(@list.List([@realanalysis.real_summable()]))
  let t1156 = @simp.gen_rewrite_rule(fn(x1155 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1155
  }, @list.List([@realanalysis.real_summable()]))
  let t1163 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1153 = @tactics.mp_tac(x1152)
      fn(x1154 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1153(x1154)
      }
    })(t1156(x1157))
  }), t1158), t1159), @tactics.gen_tac), t1160), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1161), @tactics.gen_tac), @class.cond_cases_tac), t1162)
  let t1151 = @simp.asm_simp_tac(@list.List([lspace_0(), @class.eta_ax(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → !(p == real_of_num(0))"))]))
  let t1150 = @class.asm_cases_tac(@term_syntax.parse_term("IN((i : Num), (t : (Num) -> Bool))"))
  let t1187 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)")), t1150), t1151), t1163])), t1186])
  let t1149 = @simp.asm_rewrite_tac(@list.List([]))
  let t1146 = @term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)")
  let t1147 = @term_syntax.parse_term("(p : Real)")
  let t1148 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (x : Cart[Real, M]) => if IN(n, (t : (Num) -> Bool)) { (f : (Num, Cart[Real, M]) -> Cart[Real, N])(n, x) } else { vec(0) }"), t1147, t1146]), lspace_summable_univ()))
  let t1145 = @simp.rewrite_tac(@list.List([]))
  let t1144 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_summable_restrict())]))
  let t1188 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1144), t1145), @tactics.strip_tac), t1148), t1149), @tactics.ants_tac), t1187)
  lspace_summable_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, Cart[Real, M]) -> Cart[Real, N], ∀ p : Real, ∀ s : (Cart[Real, M]) -> Bool, ∀ t : (Num) -> Bool, real_of_num(1) <= p && (∀ i : Num, IN(i, t) → IN(f(i), lspace(s, p))) && real_summable(t, (i : Num) => lnorm(s, p, f(i))) → (∃ g : (Cart[Real, M]) -> Cart[Real, N], IN(g, lspace(s, p)) && op_minus_minus_minus_gt((n : Num) => lnorm(s, p, (x : Cart[Real, M]) => vsum(INTER(t, op_dot_dot(0, n)), (i : Num) => f(i, x)) - g(x)), real_of_num(0), sequentially))"), t1188))
}

///|
let lspace_summable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_SUMMABLE")

///|
/// `LSPACE_SUMMABLE`
pub fn lspace_summable() -> @kernel.Thm {
  lspace_summable_c.get()
}

///|
/// RIESZ_FISCHER
fn step_58() -> Unit raise {
  let t1306 = @simp.asm_simp_tac(@list.List([lnorm_neg(), lspace_sub(), @class.eta_ax(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) <= p"))]))
  let t1305 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) / real_of_num(2) && (y : Real) < e / real_of_num(2) → (z : Real) <= x + y → z < e")))
  let t1304 = @simp.asm_simp_tac(@list.List([lspace_sub(), lspace_neg(), @class.eta_ax(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) <= p"))]))
  let t1298 = @drule.part_match(fn(x1297 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1297))
  }, lnorm_triangle())
  let t1293 = @simp.once_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(f : (Num, _) -> Cart[Real, N])((n : Num), (x : _)) - ((g : (_) -> Cart[Real, N])(x) + f((k : (Num) -> Num)(0), x)) == f(k(n + 1), x) - f(k(0), x) - g(x) + -(f(k(n + 1), x) - f(n, x))"))]))
  let t1307 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.disch_tac), t1293), fn(x1303 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1302 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1300 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1299 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1295 = @tactics.mp_tac(x1294)
            fn(x1296 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1295(x1296)
            }
          })(t1298(x1299))
        })(@equal.lhand(x1300))
      })((fn(x1301 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1301.1
      })(x1302))
    })(x1303)(x1303)
  }), t1304), t1305), t1306)
  let t1292 = @simp.asm_rewrite_tac(@list.List([]))
  let t1291 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(m : Num) <= (k : (Num) -> Num)(m) && k(m) < k(SUC(m)) → SUC(m) <= k(SUC(m))")))
  let t1290 = @simp.rewrite_tac(@list.List([@arith.le_0()]))
  let t1288 = @term_syntax.parse_term("(m : Num)")
  let t1289 = @list.List([@int.asm_arith_tac, @tactics.spec_tac(@term_syntax.parse_term("(n : Num) + 1"), t1288)])
  let t1287 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) + 1"))
  let t1308 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t1287), @tactics.conj_tac), t1289), @nums.induct_tac), t1290), t1291), t1292), t1307])
  let t1286 = @simp.asm_rewrite_tac(@list.List([]))
  let t1281 = @term_syntax.parse_term("(n : Num)")
  let t1282 = @list.List([@term_syntax.parse_term("(k : (Num) -> Num)((n : Num) + 1)"), t1281])
  let t1285 = @tactics.first_x_assum(fn(x1284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1279 = @tactics.mp_tac(x1278)
      fn(x1280 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1279(x1280)
      }
    })(((x1283 : @kernel.Thm) => @bool.specl(t1282, x1283))(x1284))
  })
  let t1274 = @term_syntax.parse_term("(n : Num)")
  let t1277 = @tactics.remove_then("+", fn(x1276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1271 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1272 = @tactics.mp_tac(x1271)
      fn(x1273 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1272(x1273)
      }
    })(((x1275 : @kernel.Thm) => @bool.spec(t1274, x1275))(x1276))
  })
  let t1270 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(MAX((N1 : Num), (N2 : Num)) <= (n : Num)) == (N1 <= n && N2 <= n)"))]))
  let t1269 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1268 = @tactics.exists_tac(@term_syntax.parse_term("MAX((N1 : Num), (N2 : Num))"))
  let t1265 = @term_syntax.parse_term("(N2 : Num)")
  let t1267 = @tactics.disch_then((x1266 : @kernel.Thm) => @tactics.x_choose_tac(t1265, x1266))
  let t1264 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @arith.ge()]))
  let t1260 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1263 = @tactics.first_x_assum(fn(x1262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1258 = @tactics.mp_tac(x1257)
      fn(x1259 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1258(x1259)
      }
    })(((x1261 : @kernel.Thm) => @bool.spec(t1260, x1261))(x1262))
  })
  let t1256 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N1 : Num)"))(fn(x1253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1254 = ((x1252 : @kernel.Thm) => @tactics.label_tac("+", x1252))(x1253)
    fn(x1255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1254(x1255)
    }
  }))
  let t1251 = @simp.rewrite_tac(@list.List([@arith.add1(), @vectors.vsum_diffs_alt(), @arith.le_0()]))
  let t1250 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @metric.eventually_sequentially()]))
  let t1246 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1249 = @tactics.remove_then("*", fn(x1248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1244 = @tactics.mp_tac(x1243)
      fn(x1245 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1244(x1245)
      }
    })(((x1247 : @kernel.Thm) => @bool.spec(t1246, x1247))(x1248))
  })
  let t1242 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1241 = @simp.asm_simp_tac(@list.List([lspace_add(), @class.eta_ax(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) <= p"))]))
  let t1240 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, M]) => (g : (Cart[Real, M]) -> Cart[Real, N])(x) + (f : (Num, Cart[Real, M]) -> Cart[Real, N])((k : (Num) -> Num)(0), x)"))
  let t1239 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1233 = @tactics.assume_tac(x1232)
    fn(x1234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1233(x1234)
    }
  }, fn(x1236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1237 = ((x1235 : @kernel.Thm) => @tactics.label_tac("*", x1235))(x1236)
    fn(x1238 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1237(x1238)
    }
  }))
  let t1309 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Cart[Real, M]) -> Cart[Real, N])"))(fn(x1229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1230 = @tactics.mp_tac(x1229)
    fn(x1231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1230(x1231)
    }
  })), t1239), t1240), t1241), t1242), @tactics.disch_tac), t1249), t1250), t1251), t1256), t1263), t1264), t1267), t1268), t1269), t1270), @tactics.strip_tac), t1277), t1285), t1286), @tactics.ants_tac), t1308)
  let t1226 = @simp.asm_simp_tac(@list.List([lnorm_pos_le(), lspace_sub(), @class.eta_ax(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) <= p"))]))
  let t1225 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x < (y : Real) → abs(x) <= y")))
  let t1224 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_pow())]))
  let t1223 = @tactics.disch_then(fn(x1222 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1221 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1227 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t1221), t1223), t1224), t1225), t1226)
  let t1220 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1228 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_summable_gp()), t1220), t1227])
  let t1219 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => pow(inv(real_of_num(2)), n)"))
  let t1218 = @tactics.match_mp_tac(@realanalysis.real_summable_comparison())
  let t1310 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([lspace_sub(), @class.eta_ax(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) <= p"))])), t1218), t1219), @tactics.conj_tac), t1228), t1309])
  let t1217 = @simp.asm_rewrite_tac(@list.List([]))
  let t1214 = @term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)")
  let t1215 = @term_syntax.parse_term("(p : Real)")
  let t1216 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (x : Cart[Real, M]) => (f : (Num, Cart[Real, M]) -> Cart[Real, N])((k : (Num) -> Num)(SUC(n)), x) - f(k(n), x)"), t1215, t1214]), lspace_summable_univ()))
  let t1212 = @simp.asm_rewrite_tac(@list.List([]))
  let t1210 = @term_syntax.parse_term("(n : Num)")
  let t1211 = @list.List([@int.arith_tac, @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1210)])
  let t1209 = @simp.asm_rewrite_tac(@list.List([]))
  let t1208 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1207 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) < MAX(n + 1, (m : Num))"))]))
  let t1206 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1205 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1203 = @term_syntax.parse_term("(k : (Num) -> Num)(0) == (N : (Num) -> Num)(0) && (∀ n : Num, k(SUC(n)) == MAX(k(n) + 1, MAX(N(n), N(SUC(n)))))")
  let t1204 = @tactics.mp_tac(@recursion.prove_recursive_functions_exist(@nums.num_recursion())(t1203))
  let t1200 = @term_syntax.parse_term("(N : (Num) -> Num)")
  let t1202 = @tactics.disch_then((x1201 : @kernel.Thm) => @tactics.x_choose_tac(t1200, x1201))
  let t1199 = @simp.rewrite_tac(@list.List([@real.real_lt_inv_eq(), @real.real_lt_pow2(), @class.skolem_thm()]))
  let t1196 = @term_syntax.parse_term("inv(pow(real_of_num(2), (n : Num)))")
  let t1193 = @term_syntax.parse_term("(n : Num)")
  let t1213 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1195 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1191 = @tactics.mp_tac(x1190)
        fn(x1192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1191(x1192)
        }
      })(((x1194 : @kernel.Thm) => @bool.gen(t1193, x1194))(x1195))
    })(((x1197 : @kernel.Thm) => @bool.spec(t1196, x1197))(x1198))
  }), t1199), t1202), t1204), t1205), t1206), t1207), t1208), t1209), @tactics.conj_tac), t1211), @nums.induct_tac), t1212), @int.arith_tac), @tactics.all_tac])
  let t1189 = @tactics.subgoal_then(@term_syntax.parse_term("∃ k : (Num) -> Num, (∀ n : Num, k(n) < k(SUC(n))) && (∀ n : Num, lnorm((s : (Cart[Real, M]) -> Bool), (p : Real), (x : Cart[Real, M]) => (f : (Num, Cart[Real, M]) -> Cart[Real, N])(k(SUC(n)), x) - f(k(n), x)) < inv(pow(real_of_num(2), n)))"), @tactics.strip_assume_tac)
  let t1311 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1189), t1213), t1216), t1217), @tactics.ants_tac), t1310)
  riesz_fischer_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, Cart[Real, M]) -> Cart[Real, N], ∀ p : Real, ∀ s : (Cart[Real, M]) -> Bool, real_of_num(1) <= p && (∀ n : Num, IN(f(n), lspace(s, p))) && (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ m : Num, ∀ n : Num, m >= N && n >= N → lnorm(s, p, (x : Cart[Real, M]) => f(m, x) - f(n, x)) < e)) → (∃ g : (Cart[Real, M]) -> Cart[Real, N], IN(g, lspace(s, p)) && (∀ e : Real, real_of_num(0) < e → (∃ N : Num, ∀ n : Num, n >= N → lnorm(s, p, (x : Cart[Real, M]) => f(n, x) - g(x)) < e)))"), t1311))
}

///|
let riesz_fischer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RIESZ_FISCHER")

///|
/// `RIESZ_FISCHER`
pub fn riesz_fischer() -> @kernel.Thm {
  riesz_fischer_c.get()
}

///|
/// LSPACE_DOMINATED_CONVERGENCE
fn step_59() -> Unit raise {
  let t1532 = @sets.set_tac(@list.List([]))
  let t1529 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.negligible_subset()))
  let t1531 = @tactics.first_x_assum(fn(x1530 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1529(x1530))
  })
  let t1528 = @tactics.match_mp_tac(@integration.integral_spike_set())
  let t1527 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_eq()]))
  let t1526 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1525 = @tactics.match_mp_tac(@metric.always_eventually())
  let t1524 = @tactics.match_mp_tac(@topology.lim_eventually())
  let t1523 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.lim_transform()))
  let t1521 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t1520 = @tactics.match_mp_tac(@realanalysis.real_continuous_at_rpow())
  let t1519 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_continuous_continuous_atreal())]))
  let t1522 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1518 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1512 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1513 = @equal.rand_conv(x1512)
      fn(x1514 : @kernel.Term) -> @kernel.Thm raise {
        s1513(x1514)
      }
    })((fn(x1515 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1516 = @equal.rand_conv(x1515)
      fn(x1517 : @kernel.Term) -> @kernel.Thm raise {
        s1516(x1517)
      }
    })(x1518))
  }, @list.List([@equal.gsym(@vectors.lift_drop())])), t1519), t1520), t1521), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1511 = @simp.asm_simp_tac(@list.List([@real.real_inv_eq_0(), @real.real_lt_imp_nz(), @vectors.lift_num()]))
  let t1510 = @simp.asm_simp_tac(@list.List([@trivia.o_thm(), @vectors.drop_vec(), @transcendentals.rpow_zero(), @real.real_lt_imp_nz(), @vectors.lift_num()]))
  let t1507 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.lim_continuous_function()))
  let t1504 = @term_syntax.parse_term("o(lift, o((x : Real) => rpow(x, inv((p : Real))), drop))")
  let t1509 = @tactics.disch_then(fn(x1508 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1501 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1502 = @tactics.mp_tac(x1501)
        fn(x1503 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1502(x1503)
        }
      })(((x1505 : @kernel.Thm) => @bool.ispec(t1504, x1505))(x1506))
    })(t1507(x1508))
  })
  let t1500 = @simp.rewrite_tac(@list.List([@integration.integral_0(), @realanalysis.tendsto_real_v1(), lnorm(), @trivia.o_def(), @vectors.lift_drop(), @vectors.lift_num()]))
  let t1498 = @tactics.disch_then(fn(x1497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1495 = @tactics.mp_tac(x1494)
      fn(x1496 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1495(x1496)
      }
    })(@bool.conjunct2(x1497))
  })
  let t1489 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t1488 = @tactics.match_mp_tac(@realanalysis.real_continuous_at_rpow())
  let t1487 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_continuous_continuous_atreal())]))
  let t1486 = @simp.gen_rewrite_tac(fn(x1485 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1479 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1480 = @equal.rand_conv(x1479)
      fn(x1481 : @kernel.Term) -> @kernel.Thm raise {
        s1480(x1481)
      }
    })((fn(x1482 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1483 = @equal.rand_conv(x1482)
      fn(x1484 : @kernel.Term) -> @kernel.Thm raise {
        s1483(x1484)
      }
    })(x1485))
  }, @list.List([@equal.gsym(@vectors.lift_drop())]))
  let t1478 = @simp.rewrite_tac(@list.List([@topology.continuous_at_lift_norm()]))
  let t1477 = @tactics.match_mp_tac(@topology.continuous_at_compose())
  let t1476 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1475 = @simp.asm_simp_tac(@list.List([@vectors.norm_0(), @transcendentals.rpow_zero(), @real.real_lt_imp_nz(), @vectors.lift_drop(), @vectors.lift_num()]))
  let t1474 = @simp.asm_simp_tac(@list.List([@trivia.o_thm(), @vectors.drop_vec(), @transcendentals.rpow_zero(), @real.real_lt_imp_nz(), @vectors.lift_num()]))
  let t1471 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.lim_continuous_function()))
  let t1468 = @term_syntax.parse_term("(o : ((Cart[Real, Unit]) -> Cart[Real, Unit], (Cart[Real, N]) -> Cart[Real, Unit], Cart[Real, N]) -> Cart[Real, Unit])(o(lift, o((x : Real) => rpow(x, (p : Real)), drop)), (o : ((Real) -> Cart[Real, Unit], (Cart[Real, N]) -> Real, Cart[Real, N]) -> Cart[Real, Unit])(lift, (norm : (Cart[Real, N]) -> Real)))")
  let t1473 = @tactics.disch_then(fn(x1472 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1470 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1466 = @tactics.mp_tac(x1465)
        fn(x1467 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1466(x1467)
        }
      })(((x1469 : @kernel.Thm) => @bool.ispec(t1468, x1469))(x1470))
    })(t1471(x1472))
  })
  let t1464 = @simp.gen_rewrite_tac(fn(x1461 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1462 = @equal.land_conv(x1461)
    fn(x1463 : @kernel.Term) -> @kernel.Thm raise {
      s1462(x1463)
    }
  }, @list.List([@topology.lim_null()]))
  let t1460 = @simp.asm_rewrite_tac(@list.List([]))
  let t1456 = @term_syntax.parse_term("(x : Cart[Real, M])")
  let t1459 = @tactics.disch_then(fn(x1458 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1454 = @tactics.mp_tac(x1453)
      fn(x1455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1454(x1455)
      }
    })(((x1457 : @kernel.Thm) => @bool.spec(t1456, x1457))(x1458))
  })
  let t1452 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Cart[Real, M], IN(x, DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool))) → op_minus_minus_gt((n : Num) => (f : (Num, Cart[Real, M]) -> Cart[Real, N])(n, x), (g : (Cart[Real, M]) -> Cart[Real, N])(x), sequentially)"))
  let t1490 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])")), @tactics.disch_tac), t1452), t1459), t1460), t1464), t1473), t1474), t1475), t1476), t1477), t1478), t1486), t1487), t1488), t1489), @calc_rat.asm_real_arith_tac)
  let t1451 = @simp.asm_simp_tac(@list.List([@sets.in_diff()]))
  let t1450 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((x : Cart[Real, N])) <= norm((z : Cart[Real, N])) && norm((y : Cart[Real, N])) <= norm(z) → norm(x - y) <= norm(op_pct(real_of_num(2), z))")))
  let t1449 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @realarith.real_lt_imp_le()]))
  let t1448 = @tactics.match_mp_tac(@transcendentals.rpow_le2())
  let t1447 = @simp.rewrite_tac(@list.List([@vectors.norm_lift(), @transcendentals.real_abs_rpow(), @vectors.real_abs_norm(), @vectors.lift_drop()]))
  let t1446 = @simp.rewrite_tac(@list.List([@sets.in_diff()]))
  let t1445 = @term_syntax.parse_term("(x : Cart[Real, M])")
  let t1491 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : Num)"), t1445])), t1446), @tactics.strip_tac), t1447), t1448), t1449), t1450), t1451)
  let t1444 = @sets.set_tac(@list.List([]))
  let t1441 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.negligible_subset()))
  let t1443 = @tactics.first_x_assum(fn(x1442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1441(x1442))
  })
  let t1440 = @tactics.match_mp_tac(@integration.integrable_spike_set())
  let t1437 = @drule.match_mp(lspace_imp_integrable())
  let t1439 = @tactics.disch_then(fn(x1438 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1435 = @tactics.mp_tac(x1434)
      fn(x1436 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1435(x1436)
      }
    })(t1437(x1438))
  })
  let t1433 = @tactics.undisch_tac(@term_syntax.parse_term("IN((h : (Cart[Real, M]) -> Cart[Real, N]), lspace((s : (Cart[Real, M]) -> Bool), (p : Real)))"))
  let t1432 = @tactics.match_mp_tac(@integration.integrable_cmul())
  let t1492 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_mul(), @transcendentals.rpow_mul(), @vectors.lift_cmul()])), t1432), t1433), t1439), t1440), t1443), t1444)
  let t1431 = @sets.set_tac(@list.List([]))
  let t1428 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.negligible_subset()))
  let t1430 = @tactics.first_x_assum(fn(x1429 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1428(x1429))
  })
  let t1427 = @tactics.match_mp_tac(@integration.integrable_spike_set())
  let t1426 = @simp.rewrite_tac(@list.List([]))
  let t1423 = @drule.match_mp(lspace_imp_integrable())
  let t1425 = @tactics.disch_then(fn(x1424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1421 = @tactics.mp_tac(x1420)
      fn(x1422 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1421(x1422)
      }
    })(t1423(x1424))
  })
  let t1419 = @list.List([@simp.asm_simp_tac(@list.List([lspace_sub(), @realarith.real_lt_imp_le(), @class.eta_ax()])), @tactics.all_tac])
  let t1418 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, M]) => (f : (Num, Cart[Real, M]) -> Cart[Real, N])((k : Num), x) - (g : (Cart[Real, M]) -> Cart[Real, N])(x), lspace((s : (Cart[Real, M]) -> Bool), (p : Real)))"), fn(x1415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1416 = @tactics.mp_tac(x1415)
    fn(x1417 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1416(x1417)
    }
  })
  let t1493 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)")), t1418), t1419), t1425), t1426), t1427), t1430), t1431), t1492, t1491, t1490])
  let t1499 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t1493), t1498])
  let t1414 = @simp.rewrite_tac(@list.List([]))
  let t1410 = @term_syntax.parse_term("DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool))")
  let t1411 = @term_syntax.parse_term("(x : Cart[Real, M]) => lift(rpow(norm(op_pct(real_of_num(2), (h : (Cart[Real, M]) -> Cart[Real, N])(x))), (p : Real)))")
  let t1412 = @term_syntax.parse_term("(x : Cart[Real, M]) => (vec : (Num) -> Cart[Real, Unit])(0)")
  let t1413 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (x : Cart[Real, M]) => lift(rpow(norm((f : (Num, Cart[Real, M]) -> Cart[Real, N])(n, x) - (g : (Cart[Real, M]) -> Cart[Real, N])(x)), (p : Real)))"), t1412, t1411, t1410]), @integration.dominated_convergence()))
  let t1408 = @simp.asm_simp_tac(@list.List([]))
  let t1407 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.in_diff()])))
  let t1406 = @tactics.match_mp_tac(@metric.always_eventually())
  let t1405 = @simp.asm_simp_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t1404 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (f : (Num, Cart[Real, M]) -> Cart[Real, N])(n, (x : Cart[Real, M]))"))
  let t1403 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_norm_ubound()))
  let t1409 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])")), @tactics.strip_tac), t1403), t1404), t1405), t1406), t1407), t1408), @tactics.all_tac])
  let t1402 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, M], IN(x, DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool))) → norm((g : (Cart[Real, M]) -> Cart[Real, N])(x)) <= norm((h : (Cart[Real, M]) -> Cart[Real, N])(x))"), fn(x1399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1400 = @tactics.assume_tac(x1399)
    fn(x1401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1400(x1401)
    }
  })
  let t1395 = @sets.set_tac(@list.List([]))
  let t1392 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.negligible_subset()))
  let t1394 = @tactics.first_x_assum(fn(x1393 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1392(x1393))
  })
  let t1390 = @drule.match_mp(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) → (c : Bool)) == (b → a → c)"))]))(@integration.integrable_spike_set()))
  let t1396 = @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1391 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1390(x1391))
  }), t1394), t1395)
  let t1389 = @simp.asm_rewrite_tac(@list.List([]))
  let t1388 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([lspace(), @sets.in_elim_thm()])))
  let t1387 = @simp.asm_rewrite_tac(@list.List([]))
  let t1386 = @tactics.exists_tac(@term_syntax.parse_term("(k : (Cart[Real, M]) -> Bool)"))
  let t1385 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Num, Cart[Real, M]) -> Cart[Real, N])"))
  let t1397 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_on_limit()), t1385), t1386), t1387), t1388), t1389), t1396])
  let t1398 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([lspace(), @sets.in_elim_thm()])), @tactics.conj_tac), t1397), @tactics.disch_tac])
  let t1384 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t1378 = @simp.rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t1377 = @tactics.match_mp_tac(@realanalysis.real_continuous_at_rpow())
  let t1376 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_continuous_continuous_atreal())]))
  let t1375 = @simp.gen_rewrite_tac(fn(x1374 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1368 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1369 = @equal.rand_conv(x1368)
      fn(x1370 : @kernel.Term) -> @kernel.Thm raise {
        s1369(x1370)
      }
    })((fn(x1371 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1372 = @equal.rand_conv(x1371)
      fn(x1373 : @kernel.Term) -> @kernel.Thm raise {
        s1372(x1373)
      }
    })(x1374))
  }, @list.List([@equal.gsym(@vectors.lift_drop())]))
  let t1367 = @simp.rewrite_tac(@list.List([@topology.continuous_at_lift_norm()]))
  let t1366 = @tactics.match_mp_tac(@topology.continuous_at_compose())
  let t1365 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1364 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @vectors.lift_drop()]))
  let t1363 = @simp.asm_simp_tac(@list.List([@trivia.o_thm(), @vectors.drop_vec(), @transcendentals.rpow_zero(), @real.real_lt_imp_nz(), @vectors.lift_num()]))
  let t1360 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.lim_continuous_function()))
  let t1357 = @term_syntax.parse_term("(o : ((Cart[Real, Unit]) -> Cart[Real, Unit], (Cart[Real, N]) -> Cart[Real, Unit], Cart[Real, N]) -> Cart[Real, Unit])(o(lift, o((x : Real) => rpow(x, (p : Real)), drop)), (o : ((Real) -> Cart[Real, Unit], (Cart[Real, N]) -> Real, Cart[Real, N]) -> Cart[Real, Unit])(lift, (norm : (Cart[Real, N]) -> Real)))")
  let t1362 = @tactics.disch_then(fn(x1361 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1359 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1354 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1355 = @tactics.mp_tac(x1354)
        fn(x1356 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1355(x1356)
        }
      })(((x1358 : @kernel.Thm) => @bool.ispec(t1357, x1358))(x1359))
    })(t1360(x1361))
  })
  let t1353 = @simp.asm_rewrite_tac(@list.List([]))
  let t1349 = @term_syntax.parse_term("(x : Cart[Real, M])")
  let t1352 = @tactics.first_x_assum(fn(x1351 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1346 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1347 = @tactics.mp_tac(x1346)
      fn(x1348 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1347(x1348)
      }
    })(((x1350 : @kernel.Thm) => @bool.spec(t1349, x1350))(x1351))
  })
  let t1379 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])")), @tactics.disch_tac), t1352), t1353), t1362), t1363), t1364), t1365), t1366), t1367), t1375), t1376), t1377), t1378), @calc_rat.asm_real_arith_tac)
  let t1345 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le(), @realarith.real_lt_imp_le()]))
  let t1344 = @tactics.match_mp_tac(@transcendentals.rpow_le2())
  let t1343 = @simp.rewrite_tac(@list.List([@vectors.norm_lift(), @transcendentals.real_abs_rpow(), @vectors.real_abs_norm(), @vectors.lift_drop()]))
  let t1342 = @simp.rewrite_tac(@list.List([@sets.in_diff()]))
  let t1341 = @term_syntax.parse_term("(x : Cart[Real, M])")
  let t1380 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : Num)"), t1341])), t1342), @tactics.strip_tac), t1343), t1344), t1345)
  let t1340 = @sets.set_tac(@list.List([]))
  let t1337 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.negligible_subset()))
  let t1339 = @tactics.first_x_assum(fn(x1338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1337(x1338))
  })
  let t1336 = @tactics.match_mp_tac(@integration.integrable_spike_set())
  let t1334 = @drule.match_mp(lspace_imp_integrable())
  let t1381 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1331 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1332 = @tactics.mp_tac(x1331)
      fn(x1333 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1332(x1333)
      }
    })(t1334(x1335))
  }), t1336), t1339), t1340)
  let t1330 = @sets.set_tac(@list.List([]))
  let t1327 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.negligible_subset()))
  let t1329 = @tactics.first_x_assum(fn(x1328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1327(x1328))
  })
  let t1326 = @tactics.match_mp_tac(@integration.integrable_spike_set())
  let t1322 = @term_syntax.parse_term("(k : Num)")
  let t1320 = @drule.match_mp(lspace_imp_integrable())
  let t1325 = @tactics.first_assum(fn(x1324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1321 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1317 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1318 = @tactics.mp_tac(x1317)
        fn(x1319 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1318(x1319)
        }
      })(t1320(x1321))
    })(((x1323 : @kernel.Thm) => @bool.spec(t1322, x1323))(x1324))
  })
  let t1382 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)")), t1325), t1326), t1329), t1330), t1381, t1380, t1379])
  let t1383 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t1382), @tactics.strip_tac])
  let t1316 = @simp.rewrite_tac(@list.List([]))
  let t1312 = @term_syntax.parse_term("DIFF((s : (Cart[Real, M]) -> Bool), (k : (Cart[Real, M]) -> Bool))")
  let t1313 = @term_syntax.parse_term("(x : Cart[Real, M]) => lift(rpow(norm((h : (Cart[Real, M]) -> Cart[Real, N])(x)), (p : Real)))")
  let t1314 = @term_syntax.parse_term("(x : Cart[Real, M]) => lift(rpow(norm((g : (Cart[Real, M]) -> Cart[Real, N])(x)), (p : Real)))")
  let t1315 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (x : Cart[Real, M]) => lift(rpow(norm((f : (Num, Cart[Real, M]) -> Cart[Real, N])(n, x)), (p : Real)))"), t1314, t1313, t1312]), @integration.dominated_convergence()))
  let t1533 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1315), t1316), @tactics.ants_tac), t1383), t1384), @tactics.conj_tac), t1398), t1402), t1409), t1413), t1414), @tactics.ants_tac), t1499), t1500), t1509), t1510), t1511), @tactics.ants_tac), t1522), t1523), t1524), t1525), t1526), t1527), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t1528), t1531), t1532)
  lspace_dominated_convergence_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num, Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, N], ∀ h : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ k : (Cart[Real, M]) -> Bool, real_of_num(0) < p && (∀ n : Num, IN(f(n), lspace(s, p))) && IN(h, lspace(s, p)) && (∀ n : Num, ∀ x : Cart[Real, M], IN(x, s) → norm(f(n, x)) <= norm(h(x))) && negligible(k) && (∀ x : Cart[Real, M], IN(x, DIFF(s, k)) → op_minus_minus_gt((n : Num) => f(n, x), g(x), sequentially)) → IN(g, lspace(s, p)) && op_minus_minus_minus_gt((n : Num) => lnorm(s, p, (x : Cart[Real, M]) => f(n, x) - g(x)), real_of_num(0), sequentially)"), t1533))
}

///|
let lspace_dominated_convergence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_DOMINATED_CONVERGENCE")

///|
/// `LSPACE_DOMINATED_CONVERGENCE`
pub fn lspace_dominated_convergence() -> @kernel.Thm {
  lspace_dominated_convergence_c.get()
}

///|
/// LSPACE_APPROXIMATE_BOUNDED
fn step_60() -> Unit raise {
  let t1635 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_neg_sub()]))
  let t1634 = @simp.once_rewrite_tac(@list.List([@equal.gsym(lnorm_neg())]))
  let t1636 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) < (e : Real) → x < e"))), t1634), t1635)
  let t1633 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg(), @cart.lambda_beta()]))
  let t1632 = @tactics.match_mp_tac(@iterate.sum_bound())
  let t1631 = @simp.gen_rewrite_tac(fn(x1630 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1626 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1620 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1621 = @equal.rand_conv(x1620)
        fn(x1622 : @kernel.Term) -> @kernel.Thm raise {
          s1621(x1622)
        }
      })((fn(x1623 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1624 = @equal.land_conv(x1623)
        fn(x1625 : @kernel.Term) -> @kernel.Thm raise {
          s1624(x1625)
        }
      })(x1626))
    })((fn(x1627 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1628 = @equal.rand_conv(x1627)
      fn(x1629 : @kernel.Term) -> @kernel.Thm raise {
        s1628(x1629)
      }
    })(x1630))
  }, @list.List([@equal.gsym(@iterate.card_numseg_1())]))
  let t1619 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realax.real_le_trans()))
  let t1613 = @drule.part_match(@equal.lhand, @vectors.norm_le_l1())
  let t1609 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])"))
  let t1608 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))) * real_of_num((n : Num))"))
  let t1637 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.bounded(), @sets.forall_in_image()])), t1608), t1609), @tactics.disch_tac), fn(x1618 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1617 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1615 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1614 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1610 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1611 = @tactics.mp_tac(x1610)
            fn(x1612 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1611(x1612)
            }
          })(t1613(x1614))
        })(@equal.lhand(x1615))
      })((fn(x1616 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1616.1
      })(x1617))
    })(x1618)(x1618)
  }), t1619), t1631), t1632), t1633), @calc_rat.real_arith_tac), t1636])
  let t1607 = @simp.asm_rewrite_tac(@list.List([]))
  let t1606 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, M]) => (lambda : ((Num) -> Real) -> Cart[Real, N])((i : Num) => max(-real_of_num((n : Num)), min(real_of_num(n), (op_dollar : (Cart[Real, N], Num) -> Real)((f : (Cart[Real, M]) -> Cart[Real, N])(x), i))))"))
  let t1605 = @simp.rewrite_tac(@list.List([@arith.le_refl(), @real.real_sub_rzero()]))
  let t1601 = @term_syntax.parse_term("(n : Num)")
  let t1604 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x1603 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1598 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1599 = @tactics.mp_tac(x1598)
      fn(x1600 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1599(x1600)
      }
    })(((x1602 : @kernel.Thm) => @bool.spec(t1601, x1602))(x1603))
  }))
  let t1597 = @simp.asm_rewrite_tac(@list.List([]))
  let t1593 = @term_syntax.parse_term("(e : Real)")
  let t1596 = @tactics.disch_then(fn(x1595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1591 = @tactics.mp_tac(x1590)
      fn(x1592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1591(x1592)
      }
    })(((x1594 : @kernel.Thm) => @bool.spec(t1593, x1594))(x1595))
  })
  let t1589 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially()]))
  let t1638 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x1583 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1584 = @tactics.assume_tac(x1583)
    fn(x1585 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1584(x1585)
    }
  }, fn(x1586 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1587 = @tactics.mp_tac(x1586)
    fn(x1588 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1587(x1588)
    }
  })), t1589), t1596), t1597), t1604), t1605), @tactics.disch_tac), t1606), t1607), @tactics.conj_tac), t1637)
  let t1582 = @simp.simp_tac(@list.List([@class.fun_eq_thm(), @cart.cart_eq(), @cart.lambda_beta(), @vectors.vec_component(), @vectors.vector_neg_component()]))
  let t1581 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(x : _) == (y : _) → IN(x, (s : (_) -> Bool)) → IN(y, s)")))
  let t1580 = @simp.asm_rewrite_tac(@list.List([]))
  let t1577 = @drule.match_mp(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) → (d : Bool)) == (a && b → c → d)"))]))(lspace_max()))
  let t1579 = @tactics.disch_then(fn(x1578 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1575 = @tactics.mp_tac(x1574)
      fn(x1576 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1575(x1576)
      }
    })(t1577(x1578))
  })
  let t1573 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1570 = @term_syntax.parse_term("-(vec : (Num) -> Cart[Real, N])((n : Num))")
  let t1571 = @term_syntax.parse_term("(p : Real)")
  let t1572 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)"), t1571, t1570]), lspace_const()))
  let t1569 = @simp.asm_rewrite_tac(@list.List([]))
  let t1566 = @drule.match_mp(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) → (d : Bool)) == (a && b → c → d)"))]))(lspace_min()))
  let t1568 = @tactics.disch_then(fn(x1567 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1564 = @tactics.mp_tac(x1563)
      fn(x1565 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1564(x1565)
      }
    })(t1566(x1567))
  })
  let t1562 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1561 = @tactics.undisch_tac(@term_syntax.parse_term("IN((f : (Cart[Real, M]) -> Cart[Real, N]), lspace((s : (Cart[Real, M]) -> Bool), (p : Real)))"))
  let t1560 = @simp.asm_rewrite_tac(@list.List([]))
  let t1557 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, N])((n : Num))")
  let t1558 = @term_syntax.parse_term("(p : Real)")
  let t1559 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)"), t1558, t1557]), lspace_const()))
  let t1639 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t1559), t1560), t1561), t1562), t1568), t1569), t1572), t1573), t1579), t1580), t1581), t1582), @calc_rat.real_arith_tac)
  let t1556 = @meson.asm_meson_tac(@list.List([@realax.real_of_num_le(), @realax.real_le_trans()]))
  let t1555 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (n : Real) → max(-n, min(n, x)) == x")))
  let t1554 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t1553 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1552 = @simp.simp_tac(@list.List([@sets.forall_in_image(), @iterate.in_numseg(), @cart.cart_eq(), @cart.lambda_beta()]))
  let t1551 = @simp.simp_tac(@list.List([@sets.real_sup_le_finite(), @iterate.finite_numseg(), @iterate.numseg_empty(), @arith.not_lt(), @cart.dimindex_ge_1(), @sets.finite_image(), @sets.image_eq_empty()]))
  let t1550 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t1549 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1548 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("sup((IMAGE : ((Num) -> Real, (Num) -> Bool, Real) -> Bool)((i : Num) => abs((op_dollar : (Cart[Real, N], Num) -> Real)((f : (Cart[Real, M]) -> Cart[Real, N])((x : Cart[Real, M])), i)), op_dot_dot(1, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)))))"), @real.real_arch_simple()))
  let t1547 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t1546 = @tactics.match_mp_tac(@topology.lim_eventually())
  let t1545 = @simp.rewrite_tac(@list.List([@sets.diff_empty()]))
  let t1640 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])")), t1545), @tactics.disch_tac), t1546), t1547), t1548), t1549), t1550), t1551), t1552), @tactics.disch_tac), t1553), @tactics.disch_tac), t1554), @tactics.strip_tac), t1555), t1556)
  let t1544 = @simp.simp_tac(@list.List([@cart.lambda_beta()]))
  let t1543 = @tactics.match_mp_tac(@vectors.norm_le_componentwise())
  let t1641 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1543), t1544), @calc_rat.real_arith_tac), t1640, t1639, t1638])
  let t1542 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1541 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) && (c : Bool) && (a : Bool) && (a && (d : Bool) → (e : Bool)) → (a && b && c → d) → e")))
  let t1540 = @simp.asm_rewrite_tac(@list.List([@integration.negligible_empty()]))
  let t1534 = @term_syntax.parse_term("({} : (Cart[Real, M]) -> Bool)")
  let t1535 = @term_syntax.parse_term("(p : Real)")
  let t1536 = @term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)")
  let t1537 = @term_syntax.parse_term("(f : (Cart[Real, M]) -> Cart[Real, N])")
  let t1538 = @term_syntax.parse_term("(f : (Cart[Real, M]) -> Cart[Real, N])")
  let t1539 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (x : Cart[Real, M]) => (lambda : ((Num) -> Real) -> Cart[Real, N])((i : Num) => max(-real_of_num(n), min(real_of_num(n), (op_dollar : (Cart[Real, N], Num) -> Real)((f : (Cart[Real, M]) -> Cart[Real, N])(x), i))))"), t1538, t1537, t1536, t1535, t1534]), lspace_dominated_convergence()))
  let t1642 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1539), t1540), t1541), t1542), t1641)
  lspace_approximate_bounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ e : Real, real_of_num(0) < p && measurable(s) && IN(f, lspace(s, p)) && real_of_num(0) < e → (∃ g : (Cart[Real, M]) -> Cart[Real, N], IN(g, lspace(s, p)) && bounded(IMAGE(g, s)) && lnorm(s, p, (x : Cart[Real, M]) => f(x) - g(x)) < e)"), t1642))
}

///|
let lspace_approximate_bounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_APPROXIMATE_BOUNDED")

///|
/// `LSPACE_APPROXIMATE_BOUNDED`
pub fn lspace_approximate_bounded() -> @kernel.Thm {
  lspace_approximate_bounded_c.get()
}

///|
/// LSPACE_APPROXIMATE_CONTINUOUS
fn step_61() -> Unit raise {
  let t1813 = @simp.asm_simp_tac(@list.List([lnorm_neg(), @calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) < (e : Real) → x < e"))]))
  let t1812 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(y : Real) < (e : Real) / real_of_num(2) && (z : Real) < e / real_of_num(2) → (x : Real) <= y + z → x < e")))
  let t1811 = @simp.asm_simp_tac(@list.List([lspace_sub(), @class.eta_ax(), @realarith.real_lt_imp_le(), lspace_neg()]))
  let t1805 = @drule.part_match(fn(x1804 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1804))
  }, lnorm_triangle())
  let t1800 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@class.fun_eq_thm()])), @vectors.vector_arith_tac), @tactics.all_tac])
  let t1799 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, M]) => (f : (Cart[Real, M]) -> Cart[Real, N])(x) - (g : (Num, Cart[Real, M]) -> Cart[Real, N])((n : Num), x)) == ((x : Cart[Real, M]) => f(x) - (h : (Cart[Real, M]) -> Cart[Real, N])(x) + -(g(n, x) - h(x)))"), fn(x1796 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1797 = @tactics.subst1_tac(x1796)
    fn(x1798 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1797(x1798)
    }
  })
  let t1795 = @simp.asm_rewrite_tac(@list.List([]))
  let t1794 = @tactics.exists_tac(@term_syntax.parse_term("(g : (Num, Cart[Real, M]) -> Cart[Real, N])((n : Num))"))
  let t1793 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t1789 = @term_syntax.parse_term("(n : Num)")
  let t1792 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x1791 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1786 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1787 = @tactics.mp_tac(x1786)
      fn(x1788 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1787(x1788)
      }
    })(((x1790 : @kernel.Thm) => @bool.spec(t1789, x1790))(x1791))
  }))
  let t1785 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t1781 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1784 = @tactics.disch_then(fn(x1783 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1778 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1779 = @tactics.mp_tac(x1778)
      fn(x1780 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1779(x1780)
      }
    })(((x1782 : @kernel.Thm) => @bool.spec(t1781, x1782))(x1783))
  })
  let t1777 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_sequentially(), @real.real_sub_rzero()]))
  let t1776 = @simp.asm_simp_tac(@list.List([lspace_const()]))
  let t1770 = @term_syntax.parse_term("(k : (Cart[Real, M]) -> Bool)")
  let t1771 = @term_syntax.parse_term("(p : Real)")
  let t1772 = @term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)")
  let t1773 = @term_syntax.parse_term("(x : Cart[Real, M]) => (op_pct : (Real, Cart[Real, N]) -> Cart[Real, N])((B : Real), (vec : (Num) -> Cart[Real, N])(1))")
  let t1774 = @term_syntax.parse_term("(h : (Cart[Real, M]) -> Cart[Real, N])")
  let t1775 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Num, Cart[Real, M]) -> Cart[Real, N])"), t1774, t1773, t1772, t1771, t1770]), lspace_dominated_convergence()))
  let t1768 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@measure.measurable_integrable())]))
  let t1767 = @tactics.match_mp_tac(@measure.integrable_imp_measurable())
  let t1766 = @simp.asm_simp_tac(@list.List([@measure.continuous_imp_measurable_on(), @class.eta_ax()]))
  let t1765 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@measure.lebesgue_measurable(), @vectors.indicator()]))(@measure.measurable_on_restrict()))
  let t1764 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@measure.measurable_on_univ())]))
  let t1763 = @simp.asm_simp_tac(@list.List([lspace_const()]))
  let t1762 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, M]) => (op_pct : (Real, Cart[Real, N]) -> Cart[Real, N])((B : Real), (vec : (Num) -> Cart[Real, N])(1))"))
  let t1760 = @parser.parse_type("P")
  let t1761 = @tactics.match_mp_tac(@kernel.inst_type(@list.List([(@parser.parse_type("N"), t1760)]), lspace_bounded_measurable()))
  let t1769 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t1761), t1762), t1763), t1764), t1765), t1766), t1767), t1768), @tactics.all_tac])
  let t1759 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, IN((g : (Num, Cart[Real, M]) -> Cart[Real, N])(n), lspace((s : (Cart[Real, M]) -> Bool), (p : Real)))"), fn(x1756 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1757 = @tactics.assume_tac(x1756)
    fn(x1758 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1757(x1758)
    }
  })
  let t1751 = @simp.asm_rewrite_tac(@list.List([]))
  let t1747 = @term_syntax.parse_term("(k : Num)")
  let t1750 = @tactics.disch_then(fn(x1749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1744 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1745 = @tactics.mp_tac(x1744)
      fn(x1746 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1745(x1746)
      }
    })(((x1748 : @kernel.Thm) => @bool.spec(t1747, x1748))(x1749))
  })
  let t1741 = @drule.match_mp(@vectors.norm_bound_component_le())
  let t1743 = @tactics.disch_then(fn(x1742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1738 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1739 = @tactics.mp_tac(x1738)
      fn(x1740 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1739(x1740)
      }
    })(t1741(x1742))
  })
  let t1737 = @simp.asm_rewrite_tac(@list.List([]))
  let t1733 = @term_syntax.parse_term("(x : Cart[Real, M])")
  let t1736 = @tactics.first_x_assum(fn(x1735 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1730 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1731 = @tactics.mp_tac(x1730)
      fn(x1732 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1731(x1732)
      }
    })(((x1734 : @kernel.Thm) => @bool.spec(t1733, x1734))(x1735))
  })
  let t1729 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1728 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @vectors.vector_sub_component()]))
  let t1727 = @tactics.match_mp_tac(@vectors.norm_le_componentwise())
  let t1726 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("norm((c : Cart[Real, N]) - (a : Cart[Real, N])) <= norm((b : Cart[Real, N]) - a) → distance((b, a)) < (ee : Real) → distance((c, a)) < ee")))
  let t1725 = @simp.rewrite_tac(@list.List([]))
  let t1724 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t1723 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1722 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1721 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t1720 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1719 = @simp.rewrite_tac(@list.List([]))
  let t1718 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t1717 = @tactics.x_gen_tac(@term_syntax.parse_term("(ee : Real)"))
  let t1716 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1715 = @simp.rewrite_tac(@list.List([@topology.lim_sequentially()]))
  let t1714 = @simp.asm_rewrite_tac(@list.List([]))
  let t1710 = @term_syntax.parse_term("(x : Cart[Real, M])")
  let t1713 = @tactics.first_x_assum(fn(x1712 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1707 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1708 = @tactics.mp_tac(x1707)
      fn(x1709 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1708(x1709)
      }
    })(((x1711 : @kernel.Thm) => @bool.spec(t1710, x1711))(x1712))
  })
  let t1706 = @simp.rewrite_tac(@list.List([@sets.in_diff()]))
  let t1752 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, M])")), t1706), @tactics.strip_tac), t1713), t1714), t1715), t1716), t1717), t1718), t1719), t1720), t1721), t1722), t1723), t1724), t1725), t1726), t1727), t1728), t1729), @tactics.strip_tac), t1736), t1737), t1743), t1750), t1751), @calc_rat.real_arith_tac)
  let t1705 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @vectors.vec_component(), @vectors.vector_mul_component()]))
  let t1704 = @tactics.match_mp_tac(@vectors.norm_le_componentwise())
  let t1753 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1704), t1705), @calc_rat.real_arith_tac)
  let t1703 = @simp.simp_tac(@list.List([@class.fun_eq_thm(), @cart.cart_eq(), @cart.lambda_beta()]))
  let t1702 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1699 = @drule.match_mp(@topology.continuous_on_max())
  let t1701 = @tactics.disch_then(fn(x1700 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1696 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1697 = @tactics.mp_tac(x1696)
      fn(x1698 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1697(x1698)
      }
    })(t1699(x1700))
  })
  let t1695 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1693 = @term_syntax.parse_term("(lambda : ((Num) -> Real) -> Cart[Real, N])((i : Num) => -(B : Real))")
  let t1694 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(UNIV : (Cart[Real, M]) -> Bool)"), t1693]), @topology.continuous_on_const()))
  let t1690 = @drule.match_mp(@topology.continuous_on_min())
  let t1692 = @tactics.disch_then(fn(x1691 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1687 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1688 = @tactics.mp_tac(x1687)
      fn(x1689 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1688(x1689)
      }
    })(t1690(x1691))
  })
  let t1686 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1684 = @term_syntax.parse_term("(lambda : ((Num) -> Real) -> Cart[Real, N])((i : Num) => (B : Real))")
  let t1685 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(UNIV : (Cart[Real, M]) -> Bool)"), t1684]), @topology.continuous_on_const()))
  let t1680 = @term_syntax.parse_term("(n : Num)")
  let t1683 = @tactics.first_x_assum(fn(x1682 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1677 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1678 = @tactics.mp_tac(x1677)
      fn(x1679 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1678(x1679)
      }
    })(((x1681 : @kernel.Thm) => @bool.spec(t1680, x1681))(x1682))
  })
  let t1754 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t1683), t1685), t1686), t1692), t1694), t1695), t1701), t1702), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1703), t1753, t1752])
  let t1676 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1675 = @simp.asm_rewrite_tac(@list.List([]))
  let t1674 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) => (x : Cart[Real, M]) => (lambda : ((Num) -> Real) -> Cart[Real, N])((i : Num) => max(-(B : Real), min(B, (op_dollar : (Cart[Real, N], Num) -> Real)((g : (Num, Cart[Real, M]) -> Cart[Real, N])(n, x), i))))"))
  let t1673 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g : (Num, Cart[Real, M]) -> Cart[Real, N])"))(@tactics.strip_assume_tac))
  let t1672 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : (Cart[Real, M]) -> Bool)"))
  let t1671 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1670 = @simp.rewrite_tac(@list.List([@measure.measurable_on()]))
  let t1668 = @simp.asm_rewrite_tac(@list.List([]))
  let t1669 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([lspace(), @sets.in_elim_thm()]))), t1668), @tactics.all_tac])
  let t1755 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("measurable_on((h : (Cart[Real, M]) -> Cart[Real, N]), (s : (Cart[Real, M]) -> Bool))"), fn(x1665 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1666 = @tactics.mp_tac(x1665)
    fn(x1667 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1666(x1667)
    }
  }), t1669), t1670), t1671), t1672), t1673), t1674), t1675), t1676), t1754), @tactics.all_tac])
  let t1664 = @tactics.subgoal_then(@term_syntax.parse_term("∃ k : (Cart[Real, M]) -> Bool, ∃ g : (Num, Cart[Real, M]) -> Cart[Real, N], (negligible : ((Cart[Real, M]) -> Bool) -> Bool)(k) && (∀ n : Num, (continuous_on : ((Cart[Real, M]) -> Cart[Real, N], (Cart[Real, M]) -> Bool) -> Bool)(g(n), (UNIV : (Cart[Real, M]) -> Bool))) && (∀ n : Num, ∀ x : Cart[Real, M], (IN : (Cart[Real, M], (Cart[Real, M]) -> Bool) -> Bool)(x, (s : (Cart[Real, M]) -> Bool)) → (norm : (Cart[Real, N]) -> Real)(g(n, x)) <= (norm : (Cart[Real, N]) -> Real)((op_pct : (Real, Cart[Real, N]) -> Cart[Real, N])((B : Real), (vec : (Num) -> Cart[Real, N])(1)))) && (∀ x : Cart[Real, M], (IN : (Cart[Real, M], (Cart[Real, M]) -> Bool) -> Bool)(x, (DIFF : ((Cart[Real, M]) -> Bool, (Cart[Real, M]) -> Bool, Cart[Real, M]) -> Bool)(s, k)) → (op_minus_minus_gt : ((Num) -> Cart[Real, N], Cart[Real, N], Net[Num]) -> Bool)((n : Num) => g(n, x), (h : (Cart[Real, M]) -> Cart[Real, N])(x), sequentially))"), @tactics.strip_assume_tac)
  let t1663 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(@tactics.strip_assume_tac))
  let t1662 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t1659 = @simp.gen_rewrite_rule(fn(x1658 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1658
  }, @list.List([@topology.bounded_pos()]))
  let t1661 = @tactics.first_x_assum(fn(x1660 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1655 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1656 = @tactics.mp_tac(x1655)
      fn(x1657 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1656(x1657)
      }
    })(t1659(x1660))
  })
  let t1654 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(h : (Cart[Real, M]) -> Cart[Real, N])"))(@tactics.strip_assume_tac))
  let t1653 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t1649 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1650 = @term_syntax.parse_term("(p : Real)")
  let t1651 = @term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)")
  let t1652 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, M]) -> Cart[Real, N])"), t1651, t1650, t1649]), lspace_approximate_bounded()))
  let t1646 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) < p")))
  let t1648 = @tactics.first_assum(fn(x1647 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1644 = @tactics.assume_tac(x1643)
      fn(x1645 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1644(x1645)
      }
    })(t1646(x1647))
  })
  let t1814 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1648), t1652), t1653), t1654), t1661), t1662), t1663), t1664), t1755), t1759), t1769), t1775), t1776), t1777), t1784), t1785), t1792), t1793), @tactics.disch_tac), t1794), t1795), t1799), t1800), fn(x1810 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1809 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1807 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1806 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1801 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1802 = @tactics.mp_tac(x1801)
            fn(x1803 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1802(x1803)
            }
          })(t1805(x1806))
        })(@equal.lhand(x1807))
      })((fn(x1808 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1808.1
      })(x1809))
    })(x1810)(x1810)
  }), t1811), t1812), t1813)
  lspace_approximate_continuous_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ e : Real, real_of_num(1) <= p && measurable(s) && IN(f, lspace(s, p)) && real_of_num(0) < e → (∃ g : (Cart[Real, M]) -> Cart[Real, N], continuous_on(g, UNIV) && IN(g, lspace(s, p)) && lnorm(s, p, (x : Cart[Real, M]) => f(x) - g(x)) < e)"), t1814))
}

///|
let lspace_approximate_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_APPROXIMATE_CONTINUOUS")

///|
/// `LSPACE_APPROXIMATE_CONTINUOUS`
pub fn lspace_approximate_continuous() -> @kernel.Thm {
  lspace_approximate_continuous_c.get()
}

///|
/// LSPACE_APPROXIMATE_VECTOR_POLYNOMIAL_FUNCTION
fn step_62() -> Unit raise {
  let t1880 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq()]))
  let t1879 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((m : Real) * ((e : Real) / real_of_num(2)) <= e / real_of_num(2) * (n : Real)) == (e * m <= e * n)"))]))
  let t1876 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → real_of_num(0) < x + real_of_num(1)"))
  let t1877 = @list.List([@measure.measure_pos_le(), @transcendentals.rpow_pos_le(), @real.real_le_ldiv_eq(), @calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) == (if real_of_num(0) < x { x } else { -x })")), t1876])
  let t1873 = @simp.basic_ss(@list.List([]))
  let t1878 = @tactics.asm_tac(fn(x1875 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1870 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1871 = @tactics.conv_tac(x1870)
      fn(x1872 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1871(x1872)
      }
    })(((x1874 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t1873, 4, x1874))(x1875))
  })(t1877)
  let t1869 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (e : Real) → (x : Real) * (abs(e) / real_of_num(2) / (y : Real)) == x * (e / real_of_num(2)) / y"))]))
  let t1868 = @simp.rewrite_tac(@list.List([@vectors.norm_lift(), @real.real_abs_div(), @calc_int.real_abs_num()]))
  let t1881 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([lnorm_const(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) < p"))])), t1868), t1869), t1878), t1879), t1880), @calc_rat.real_arith_tac)
  let t1865 = @simp.rewrite_rule(@list.List([@sets.subset()]))(@topology.closure_subset())
  let t1866 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (y : Real) → x <= abs(y)"))
  let t1867 = @simp.asm_simp_tac(@list.List([lspace_sub(), lspace_const(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) <= p")), @vectors.norm_lift(), t1866, t1865]))
  let t1864 = @simp.rewrite_tac(@list.List([@integration.negligible_empty(), @sets.diff_empty()]))
  let t1863 = @tactics.exists_tac(@term_syntax.parse_term("({} : (Cart[Real, M]) -> Bool)"))
  let t1882 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lnorm_mono()), t1863), t1864), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1867), t1881])
  let t1861 = @term_syntax.parse_term("lnorm((s : (Cart[Real, M]) -> Bool), (p : Real), (x : Cart[Real, M]) => lift((e : Real) / real_of_num(2) / (rpow(measure(s), inv(p)) + real_of_num(1))))")
  let t1862 = @tactics.trans_tac(@realax.real_le_trans())(t1861)
  let t1857 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (e : Real) / real_of_num(2) → (y : Real) <= e / real_of_num(2) → x + y < e")))
  let t1859 = @tactics.first_x_assum(fn(x1858 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1857(x1858))
  })
  let t1856 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(f : Cart[Real, N]) - (g : Cart[Real, N]) + (g - (h : Cart[Real, N])) == f - h"))]))
  let t1855 = @simp.asm_simp_tac(@list.List([lspace_sub(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (p : Real) → real_of_num(0) <= p"))]))
  let t1849 = @drule.part_match(fn(x1848 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x1848))
  }, lnorm_triangle())
  let t1860 = @list.List([@tactics.then_tac(@tactics.then_tac(fn(x1854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1853 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1851 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1850 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1845 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1846 = @tactics.mp_tac(x1845)
            fn(x1847 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1846(x1847)
            }
          })(t1849(x1850))
        })(@kernel.rand(x1851))
      })((fn(x1852 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1852.1
      })(x1853))
    })(x1854)(x1854)
  }, t1855), t1856), t1859])
  let t1843 = @term_syntax.parse_term("lnorm((s : (Cart[Real, M]) -> Bool), (p : Real), (x : Cart[Real, M]) => (f : (Cart[Real, M]) -> Cart[Real, N])(x) - (g : (Cart[Real, M]) -> Cart[Real, N])(x)) + lnorm(s, p, (x : Cart[Real, M]) => g(x) - (h : (Cart[Real, M]) -> Cart[Real, N])(x))")
  let t1844 = @tactics.trans_tac(@realarith.real_let_trans())(t1843)
  let t1841 = @simp.asm_simp_tac(@list.List([@realanalysis.continuous_on_vector_polynomial_function(), @topology.compact_closure()]))
  let t1840 = @tactics.match_mp_tac(@topology.compact_continuous_image())
  let t1839 = @tactics.match_mp_tac(@topology.compact_imp_bounded())
  let t1838 = @simp.simp_tac(@list.List([@sets.image_subset(), @topology.closure_subset()]))
  let t1837 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((h : (Cart[Real, M]) -> Cart[Real, N]), closure((s : (Cart[Real, M]) -> Bool)))"))
  let t1836 = @tactics.match_mp_tac(@topology.bounded_subset())
  let t1835 = @simp.asm_simp_tac(@list.List([@measure.continuous_imp_measurable_on_lebesgue_measurable_subset(), @measure.measurable_imp_lebesgue_measurable(), @realanalysis.continuous_on_vector_polynomial_function()]))
  let t1834 = @list.List([@calc_rat.asm_real_arith_tac, @simp.asm_rewrite_tac(@list.List([]))])
  let t1842 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(lspace_bounded_measurable_simple()), @tactics.conj_tac), t1834), t1835), t1836), t1837), t1838), t1839), t1840), t1841), @tactics.disch_tac])
  let t1833 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t1830 = @simp.asm_rewrite_tac(@list.List([]))
  let t1829 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, M]) -> Cart[Real, N])"))
  let t1831 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t1829), @tactics.strip_tac), t1830)
  let t1827 = @simp.asm_simp_tac(@list.List([@transcendentals.rpow_pos_le(), @measure.measure_pos_le()]))
  let t1826 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → real_of_num(0) < x + real_of_num(1)")))
  let t1825 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t1828 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_div()), t1825), t1826), t1827)
  let t1832 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([@topology.continuous_on_subset(), @sets.subset_univ()])), t1828])), t1831])
  let t1824 = @simp.asm_rewrite_tac(@list.List([@misc.real_half(), @topology.compact_closure()]))
  let t1821 = @term_syntax.parse_term("(e : Real) / real_of_num(2) / (rpow(measure((s : (Cart[Real, M]) -> Bool)), inv((p : Real))) + real_of_num(1))")
  let t1822 = @term_syntax.parse_term("closure((s : (Cart[Real, M]) -> Bool))")
  let t1823 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, M]) -> Cart[Real, N])"), t1822, t1821]), @realanalysis.stone_weierstrass_vector_polynomial_function()))
  let t1820 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : (Cart[Real, M]) -> Cart[Real, N])"))
  let t1819 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), @misc.real_half()]))
  let t1815 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1816 = @term_syntax.parse_term("(p : Real)")
  let t1817 = @term_syntax.parse_term("(s : (Cart[Real, M]) -> Bool)")
  let t1818 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, M]) -> Cart[Real, N])"), t1817, t1816, t1815]), lspace_approximate_continuous()))
  let t1883 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1818), t1819), t1820), @tactics.strip_tac), t1823), t1824), @tactics.ants_tac), t1832), t1833), @tactics.conj_tac), t1842), t1844), @tactics.conj_tac), t1860), t1862), @tactics.conj_tac), t1882)
  lspace_approximate_vector_polynomial_function_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ s : (Cart[Real, M]) -> Bool, ∀ p : Real, ∀ e : Real, real_of_num(1) <= p && bounded(s) && measurable(s) && IN(f, lspace(s, p)) && real_of_num(0) < e → (∃ g : (Cart[Real, M]) -> Cart[Real, N], vector_polynomial_function(g) && IN(g, lspace(s, p)) && lnorm(s, p, (x : Cart[Real, M]) => f(x) - g(x)) < e)"), t1883))
}

///|
let lspace_approximate_vector_polynomial_function_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_APPROXIMATE_VECTOR_POLYNOMIAL_FUNCTION")

///|
/// `LSPACE_APPROXIMATE_VECTOR_POLYNOMIAL_FUNCTION`
pub fn lspace_approximate_vector_polynomial_function() -> @kernel.Thm {
  lspace_approximate_vector_polynomial_function_c.get()
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
}
