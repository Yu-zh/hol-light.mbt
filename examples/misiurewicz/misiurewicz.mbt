// Translated from upstream Examples/misiurewicz.ml; edit this file directly.

///|
/// HAS_COMPLEX_DERIVATIVE_CEXP_COMPOSE
fn step_1() -> Unit raise {
  let t13 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lid()]))
  let t12 = @simp.gen_rewrite_tac(fn(x11 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x5 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s6 = @equal.rator_conv(x5)
      fn(x7 : @kernel.Term) -> @kernel.Thm raise {
        s6(x7)
      }
    })((fn(x8 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s9 = @equal.land_conv(x8)
      fn(x10 : @kernel.Term) -> @kernel.Thm raise {
        s9(x10)
      }
    })(x11))
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t4 = @simp.asm_rewrite_tac(@list.List([]))
  let t3 = @tactics.match_mp_tac(@canal.complex_diff_chain_at())
  let t2 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t1 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@trivia.o_def())]))
  let t14 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1), t2), t3), t4), t12), @canal.complex_diff_tac), t13)
  has_complex_derivative_cexp_compose_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], has_complex_derivative(f, (f' : Cart[Real, 2]), at(z)) → has_complex_derivative((w : Cart[Real, 2]) => cexp(f(w)), f' * cexp(f(z)), at(z))"), t14))
}

///|
let has_complex_derivative_cexp_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_COMPLEX_DERIVATIVE_CEXP_COMPOSE")

///|
/// `HAS_COMPLEX_DERIVATIVE_CEXP_COMPOSE`
pub fn has_complex_derivative_cexp_compose() -> @kernel.Thm {
  has_complex_derivative_cexp_compose_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_CEXP_COMPOSE
fn step_2() -> Unit raise {
  let t15 = @meson.meson_tac(@list.List([@canal.complex_differentiable(), has_complex_derivative_cexp_compose()]))
  complex_differentiable_cexp_compose_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) → complex_differentiable((w : Cart[Real, 2]) => cexp(f(w)), at(z))"), t15))
}

///|
let complex_differentiable_cexp_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_CEXP_COMPOSE")

///|
/// `COMPLEX_DIFFERENTIABLE_CEXP_COMPOSE`
pub fn complex_differentiable_cexp_compose() -> @kernel.Thm {
  complex_differentiable_cexp_compose_c.get()
}

///|
/// COMPLEX_DERIVATIVE_CEXP_COMPOSE
fn step_3() -> Unit raise {
  let t18 = @simp.asm_rewrite_tac(@list.List([@canal.has_complex_derivative_differentiable()]))
  let t17 = @tactics.match_mp_tac(has_complex_derivative_cexp_compose())
  let t16 = @tactics.match_mp_tac(@canal.has_complex_derivative_derivative())
  let t19 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t16), t17), t18)
  complex_derivative_cexp_compose_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) → complex_derivative((w : Cart[Real, 2]) => cexp(f(w)), z) == complex_derivative(f, z) * cexp(f(z))"), t19))
}

///|
let complex_derivative_cexp_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DERIVATIVE_CEXP_COMPOSE")

///|
/// `COMPLEX_DERIVATIVE_CEXP_COMPOSE`
pub fn complex_derivative_cexp_compose() -> @kernel.Thm {
  complex_derivative_cexp_compose_c.get()
}

///|
/// COMPLEX_DIFFERENTIABLE_ITER_CEXP
fn step_4() -> Unit raise {
  let t29 = @simp.asm_simp_tac(@list.List([complex_differentiable_cexp_compose()]))
  let t28 = @simp.asm_simp_tac(@list.List([@iter.iter(), @canal.complex_differentiable_id()]))
  let t30 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x27 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    ((x23 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(2, fn(x20 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s21 = @equal.binder_conv(x20)
      fn(x22 : @kernel.Term) -> @kernel.Thm raise {
        s21(x22)
      }
    }, x23))((fn(x24 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s25 = @equal.land_conv(x24)
      fn(x26 : @kernel.Term) -> @kernel.Thm raise {
        s25(x26)
      }
    })(x27))
  }, @list.List([@equal.gsym(@class.eta_ax())])), @nums.induct_tac), t28), t29)
  complex_differentiable_iter_cexp_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ z : Cart[Real, 2], complex_differentiable(ITER(n, cexp), at(z))"), t30))
}

///|
let complex_differentiable_iter_cexp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_DIFFERENTIABLE_ITER_CEXP")

///|
/// `COMPLEX_DIFFERENTIABLE_ITER_CEXP`
pub fn complex_differentiable_iter_cexp() -> @kernel.Thm {
  complex_differentiable_iter_cexp_c.get()
}

///|
/// CONTINUOUS_ITER_CEXP
fn step_5() -> Unit raise {
  let t31 = @simp.simp_tac(@list.List([@canal.complex_differentiable_imp_continuous_at(), complex_differentiable_iter_cexp()]))
  continuous_iter_cexp_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ z : Cart[Real, 2], continuous(ITER(n, cexp), at(z))"), t31))
}

///|
let continuous_iter_cexp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ITER_CEXP")

///|
/// `CONTINUOUS_ITER_CEXP`
pub fn continuous_iter_cexp() -> @kernel.Thm {
  continuous_iter_cexp_c.get()
}

///|
/// HOLOMORPHIC_ON_ITER_CEXP
fn step_6() -> Unit raise {
  let t32 = @simp.simp_tac(@list.List([@canal.holomorphic_on_differentiable(), @canal.complex_differentiable_at_within(), complex_differentiable_iter_cexp()]))
  holomorphic_on_iter_cexp_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : (Cart[Real, 2]) -> Bool, holomorphic_on(ITER(n, cexp), s)"), t32))
}

///|
let holomorphic_on_iter_cexp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLOMORPHIC_ON_ITER_CEXP")

///|
/// `HOLOMORPHIC_ON_ITER_CEXP`
pub fn holomorphic_on_iter_cexp() -> @kernel.Thm {
  holomorphic_on_iter_cexp_c.get()
}

///|
/// CONTINUOUS_ON_ITER_CEXP
fn step_7() -> Unit raise {
  let t33 = @simp.simp_tac(@list.List([@canal.holomorphic_on_imp_continuous_on(), holomorphic_on_iter_cexp()]))
  continuous_on_iter_cexp_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ s : (Cart[Real, 2]) -> Bool, continuous_on(ITER(n, cexp), s)"), t33))
}

///|
let continuous_on_iter_cexp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_ITER_CEXP")

///|
/// `CONTINUOUS_ON_ITER_CEXP`
pub fn continuous_on_iter_cexp() -> @kernel.Thm {
  continuous_on_iter_cexp_c.get()
}

///|
/// LEMMA_1
fn step_8() -> Unit raise {
  let t62 = @simp.simp_tac(@list.List([@real.real_le_lmul_eq(), @transcendentals.real_exp_pos_lt(), @transcendentals.real_abs_sin_bound_le()]))
  let t61 = @simp.rewrite_tac(@list.List([@transcendentals.im_cexp(), @transcendentals.norm_cexp(), @real.real_abs_mul(), @transcendentals.real_abs_exp()]))
  let t60 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t59 = @tactics.pop_assum_list(fn(x58 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t56 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t57 = @tactics.spec_tac(@term_syntax.parse_term("ITER((n : Num), cexp, (z : Cart[Real, 2]))"), t56)
  let t55 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_mul(), @real.real_le_rmul(), @vectors.norm_pos_le(), @arith.le_1()]))
  let t53 = @term_syntax.parse_term("abs(Im(ITER((n : Num), cexp, (z : Cart[Real, 2])))) * norm(cexp(ITER(n, cexp, z)))")
  let t54 = @tactics.trans_tac(@realax.real_le_trans())(t53)
  let t52 = @simp.asm_rewrite_tac(@list.List([@iter.iter_pointless(), @trivia.i_def(), @trivia.o_def(), @canal.complex_derivative_id(), @complexes.complex_mul_lid(), @complexes.complex_norm_ge_re_im()]))
  let t51 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t50 = @simp.asm_simp_tac(@list.List([complex_derivative_cexp_compose(), complex_differentiable_iter_cexp(), @class.eta_ax()]))
  let t49 = @simp.rewrite_tac(@list.List([@iter.iter()]))
  let t48 = @simp.gen_rewrite_tac(fn(x47 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x43 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x37 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s38 = @equal.rand_conv(x37)
        fn(x39 : @kernel.Term) -> @kernel.Thm raise {
          s38(x39)
        }
      })((fn(x40 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s41 = @equal.rand_conv(x40)
        fn(x42 : @kernel.Term) -> @kernel.Thm raise {
          s41(x42)
        }
      })(x43))
    })((fn(x44 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s45 = @equal.land_conv(x44)
      fn(x46 : @kernel.Term) -> @kernel.Thm raise {
        s45(x46)
      }
    })(x47))
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t36 = @tactics.disch_then(fn(x35 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t34 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t63 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@iter.iter(), @calc_num.arith()]))), t34), t36), t48), t49), t50), t51), t52), t54), t55), t57), t59), @tactics.gen_tac), t60), t61), t62)
  lemma_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ z : Cart[Real, 2], 1 <= n → abs(Im(ITER(n, cexp, z))) <= norm(complex_derivative(ITER(n, cexp), z))"), t63))
}

///|
let lemma_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_1")

///|
/// `LEMMA_1`
pub fn lemma_1() -> @kernel.Thm {
  lemma_1_c.get()
}

///|
/// LEMMA_2a
fn step_9() -> Unit raise {
  let t82 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_le_x(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) + (l : Real) + (real_of_num(1) - l) <= (e : Real) * real_of_num(2) / real_of_num(2)) == (real_of_num(1) + x <= e)"))]))
  let t81 = @simp.simp_tac(@list.List([@transcendentals.real_exp_add(), @transcendentals.exp_log(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t78 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(z : Real) - (l : Real) == (x : Real) → z == x + l")))
  let t80 = @tactics.first_assum(fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s76 = @tactics.subst1_tac(x75)
      fn(x77 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s76(x77)
      }
    })(t78(x79))
  })
  let t74 = @simp.abbrev_tac(@term_syntax.parse_term("(x : Real) == Re((z : Cart[Real, 2])) - log(real_of_num(2))"))
  let t72 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t71 = @simp.rewrite_tac(@list.List([@transcendentals.cos_pi3()]))
  let t70 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realax.real_le_trans()))
  let t69 = @simp.asm_rewrite_tac(@list.List([@transcendentals.cos_abs()]))
  let t67 = @term_syntax.parse_term("abs(Im((z : Cart[Real, 2])))")
  let t68 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("pi / real_of_num(3)"), t67]), @transcendentals.cos_mono_le_eq()))
  let t73 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@realax.real_div(), @real.real_le_lmul_eq(), @transcendentals.real_exp_pos_lt()])), t68), t69), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t70), t71), t72)])
  let t65 = @term_syntax.parse_term("exp(Re((z : Cart[Real, 2]))) / real_of_num(2)")
  let t66 = @tactics.trans_tac(@realax.real_le_trans())(t65)
  let t64 = @simp.rewrite_tac(@list.List([@transcendentals.re_cexp(), @realax.real_ge()]))
  let t83 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t64), t66), @tactics.conj_tac), t73), t74), t80), t81), t82)
  lemma_2a_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], abs(Im(z)) <= pi / real_of_num(3) → Re(cexp(z)) >= Re(z) + (real_of_num(1) - log(real_of_num(2)))"), t83))
}

///|
let lemma_2a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_2a")

///|
/// `LEMMA_2a`
pub fn lemma_2a() -> @kernel.Thm {
  lemma_2a_c.get()
}

///|
/// LEMMA_2b
fn step_10() -> Unit raise {
  let t220 = @simp.rewrite_tac(@list.List([@arith.le_add()]))
  let t219 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t218 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t215 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(m : Real) * (a : Real) <= (b : Real) → (c : Real) >= real_of_num(2) * b → real_of_num(2) * m * a <= c")))
  let t217 = @tactics.first_x_assum(fn(x216 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t215(x216))
  })
  let t214 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @realax.real_pow(), @realax.real_mul_lid(), @realax.real_le_refl()]))
  let t212 = @term_syntax.parse_term("(m : Num)")
  let t213 = @tactics.spec_tac(@term_syntax.parse_term("(d : Num)"), t212)
  let t209 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(p : Real) < (x : Real) → x <= (a : Real) → a <= p → false")))
  let t211 = @tactics.first_x_assum(fn(x210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t209(x210))
  })
  let t205 = @term_syntax.parse_term("(N : Num) + (d : Num)")
  let t208 = @tactics.disch_then(fn(x207 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s203 = @tactics.mp_tac(x202)
      fn(x204 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s203(x204)
      }
    })(((x206 : @kernel.Thm) => @bool.spec(t205, x206))(x207))
  })
  let t199 = @term_syntax.parse_term("(d : Num)")
  let t201 = @tactics.disch_then((x200 : @kernel.Thm) => @tactics.x_choose_tac(t199, x200))
  let t198 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t197 = @simp.asm_simp_tac(@list.List([@real.real_lt_ldiv_eq()]))
  let t195 = @term_syntax.parse_term("pi / real_of_num(3) / abs(Im(ITER((N : Num), cexp, (z : Cart[Real, 2]))))")
  let t196 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(2)"), t195]), @real.real_arch_pow()))
  let t194 = @tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, abs(Im(ITER(n, cexp, (z : Cart[Real, 2])))) <= pi / real_of_num(3)"))
  let t192 = @simp.asm_rewrite_tac(@list.List([]))
  let t191 = @tactics.match_mp_tac(lemma_2a())
  let t190 = @simp.rewrite_tac(@list.List([@iter.iter()]))
  let t187 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(z : Real) + (m : Real) * (l : Real) <= (n : Real) → (s : Real) >= n + l → z + (m + real_of_num(1)) * l <= s")))
  let t189 = @tactics.first_x_assum(fn(x188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t187(x188))
  })
  let t185 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc())]))
  let t186 = @list.List([@simp.rewrite_tac(@list.List([@iter.iter(), @calc_int.real_mul_lzero(), @calc_int.real_add_rid(), @realax.real_le_refl()])), t185])
  let t183 = @term_syntax.parse_term("(m : Num)")
  let t184 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t183)
  let t181 = @tactics.mp_tac(@cauchy.log2_approx_32())
  let t180 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_le()]))
  let t179 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t182 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_le_ladd()])), t179), t180), t181), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t177 = @term_syntax.parse_term("Re((z : Cart[Real, 2])) + real_of_num((n : Num)) * (real_of_num(1) - log(real_of_num(2)))")
  let t178 = @tactics.trans_tac(@realax.real_le_trans())(t177)
  let t175 = @term_syntax.parse_term("Re((z : Cart[Real, 2])) + real_of_num((N : Num)) * (real_of_num(1) - log(real_of_num(2)))")
  let t176 = @tactics.trans_tac(@realax.real_le_trans())(t175)
  let t174 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()]))
  let t172 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(5)"))
  let t173 = @simp.once_rewrite_tac(@list.List([@equal.sym(@drule.match_mp(@transcendentals.exp_log())(t172))]))
  let t171 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t170 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t169 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(5) * (b : Real) <= (u : Real) * (v : Real) → (x : Real) >= real_of_num(2) / real_of_num(5) * u * v → x >= real_of_num(2) * b")))
  let t165 = @term_syntax.parse_term("(n : Num)")
  let t168 = @tactics.remove_then("*", fn(x167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x162 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s163 = @tactics.mp_tac(x162)
      fn(x164 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s163(x164)
      }
    })(((x166 : @kernel.Thm) => @bool.spec(t165, x166))(x167))
  })
  let t161 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t160 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t159 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t155 = @term_syntax.parse_term("log(real_of_num(5)) - Re((z : Cart[Real, 2]))")
  let t158 = @tactics.disch_then(fn(x157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s153 = @tactics.mp_tac(x152)
      fn(x154 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s153(x154)
      }
    })(((x156 : @kernel.Thm) => @bool.spec(t155, x156))(x157))
  })
  let t151 = @list.List([@tactics.then_tac(@tactics.mp_tac(@cauchy.log2_approx_32()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t193 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("real_of_num(1) - log(real_of_num(2))"), @real.real_arch())), @tactics.ants_tac), t151), t158), t159), t160), @tactics.disch_tac), t161), @tactics.disch_tac), t168), t169), t170), t171), t173), t174), t176), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t178), @tactics.conj_tac), t182), t184), @nums.induct_tac), t186), t189), t190), t191), t192), @tactics.all_tac])
  let t150 = @tactics.subgoal_then(@term_syntax.parse_term("∃ N : Num, ∀ n : Num, N <= n → abs(Im(ITER(n + 1, cexp, (z : Cart[Real, 2])))) >= real_of_num(2) * abs(Im(ITER(n, cexp, z)))"), @tactics.choose_tac)
  let t148 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t147 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.real_abs_nz()), @transcendentals.real_exp_pos_lt()]))
  let t146 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_mul()), @tactics.conj_tac))
  let t145 = @simp.simp_tac(@list.List([@arith.add1(), @realax.real_ge(), @real.real_not_le(), @calc_int.real_abs_num()]))
  let t144 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t140 = @term_syntax.parse_term("(n : Num)")
  let t143 = @tactics.remove_then("*", fn(x142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s138 = @tactics.mp_tac(x137)
      fn(x139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s138(x139)
      }
    })(((x141 : @kernel.Thm) => @bool.spec(t140, x141))(x142))
  })
  let t136 = @list.List([@meson.asm_meson_tac(@list.List([@iter.iter(), @complexes.real()])), @tactics.all_tac])
  let t149 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_abs_nz())])), @nums.induct_tac), t136), t143), t144), t145), @tactics.disch_tac), t146), t147), t148), @tactics.all_tac])
  let t135 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, real_of_num(0) < abs(Im(ITER(n, cexp, (z : Cart[Real, 2]))))"), fn(x132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s133 = @tactics.assume_tac(x132)
    fn(x134 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s133(x134)
    }
  })
  let t130 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t129 = @tactics.match_mp_tac(@real.real_pow_le2())
  let t128 = @list.List([@tactics.all_tac, @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)])
  let t126 = @term_syntax.parse_term("pow(real_of_num(16) / real_of_num(5), 2)")
  let t127 = @tactics.trans_tac(@realax.real_le_trans())(t126)
  let t125 = @simp.asm_simp_tac(@list.List([@real.real_pow_le2(), @calc_rat.real_arith(@term_syntax.parse_term("(pow(pi / real_of_num(3), 2) <= (a : Real)) == (pow(pi, 2) <= real_of_num(9) * a)"))]))
  let t123 = @term_syntax.parse_term("pow(pi / real_of_num(3), 2)")
  let t124 = @tactics.trans_tac(@realax.real_le_trans())(t123)
  let t122 = @simp.asm_rewrite_tac(@list.List([]))
  let t121 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t120 = @simp.asm_simp_tac(@list.List([@realax.real_abs(), @calc_rat.real_arith(@term_syntax.parse_term("(pow((x : Real), 3) / real_of_num(2) <= (a : Real) * x) == (x * pow(x, 2) <= x * (real_of_num(2) * a))"))]))
  let t119 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(e : Real) <= (real_of_num(1) - (a : Real)) * (x : Real) → abs(sin(x) - x / real_of_num(1)) <= e → a * x <= sin(x)")))
  let t113 = @equal.gsym(@complexes.cx_neg())
  let t114 = @equal.gsym(@complexes.cx_add())
  let t115 = @equal.gsym(@complexes.cx_sub())
  let t116 = @equal.gsym(@complexes.cx_mul())
  let t117 = @equal.gsym(@complexes.cx_pow())
  let t118 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.cx_div()), t117, t116, t115, t114, t113, @complexes.complex_norm_cx(), @realax.real_mul_lid()]))
  let t112 = @simp.rewrite_tac(@list.List([@complexes.complex_pow(), @complexes.complex_pow_1()]))
  let t111 = @simp.rewrite_tac(@list.List([@complexes.im_cx(), @calc_int.real_abs_num(), @transcendentals.real_exp_0(), @equal.gsym(@transcendentals.cx_sin())]))
  let t110 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t109 = @simp.rewrite_tac(@list.List([@vectors.vsum_sing_numseg()]))
  let t107 = @term_syntax.parse_term("Cx((x : Real))")
  let t108 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("0"), t107]), @transcendentals.taylor_csin()))
  let t106 = @tactics.repeat_tac(@tactics.strip_tac)
  let t105 = @simp.simp_tac(@list.List([@realax.real_abs(), @transcendentals.sin_pos_pi_le(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= pi / real_of_num(3) → x <= pi"))]))
  let t104 = @simp.rewrite_tac(@list.List([@transcendentals.sin_neg(), @calc_int.real_abs_neg()]))
  let t103 = @tactics.match_mp_tac(@meson.meson(@list.List([@realarith.real_le_negtotal()]), @term_syntax.parse_term("(∀ x : Real, (P : (Real) -> Bool)(-x) == P(x)) && (∀ x : Real, real_of_num(0) <= x → P(x)) → (∀ x : Real, P(x))")))
  let t101 = @term_syntax.parse_term("(x : Real)")
  let t102 = @tactics.spec_tac(@term_syntax.parse_term("Im(ITER((n : Num), cexp, (z : Cart[Real, 2])))"), t101)
  let t97 = @term_syntax.parse_term("(n : Num)")
  let t100 = @tactics.first_x_assum(fn(x99 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s95 = @tactics.mp_tac(x94)
      fn(x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s95(x96)
      }
    })(((x98 : @kernel.Thm) => @bool.spec(t97, x98))(x99))
  })
  let t93 = @simp.simp_tac(@list.List([@real.real_le_lmul_eq(), @transcendentals.real_exp_pos_lt()]))
  let t92 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((e : Real) * (x : Real) >= (y : Real) * e * (z : Real)) == (e * (y * z) <= e * x)"))]))
  let t91 = @simp.rewrite_tac(@list.List([@iter.iter(), @equal.gsym(@arith.add1()), @transcendentals.im_cexp(), @transcendentals.real_abs_exp(), @real.real_abs_mul()]))
  let t131 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t91), t92), t93), t100), t102), t103), t104), t105), t106), t108), t109), t110), t111), t112), t118), t119), t120), t121), t122), t124), t125), t127), @tactics.conj_tac), t128), t129), t130), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t90 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, abs(Im(ITER(n + 1, cexp, (z : Cart[Real, 2])))) >= real_of_num(2) / real_of_num(5) * exp(Re(ITER(n, cexp, z))) * abs(Im(ITER(n, cexp, z)))"), fn(x87 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s88 = ((x86 : @kernel.Thm) => @tactics.label_tac("*", x86))(x87)
    fn(x89 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s88(x89)
    }
  })
  let t85 = @simp.rewrite_tac(@list.List([@realax.real_gt(), @realarith.real_not_lt()]))
  let t84 = @simp.once_rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ n : _, (P : (_) -> Bool)(n)) == ((∀ n : _, !P(n)) → false)"))]))
  let t221 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t84), t85), @tactics.disch_tac), t90), t131), t135), t149), t150), t193), t194), t196), t197), t198), t201), t208), t211), t213), @nums.induct_tac), t214), t217), t218), t219), t220)
  lemma_2b_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], !real(z) → (∃ n : Num, abs(Im(ITER(n, cexp, z))) > pi / real_of_num(3))"), t221))
}

///|
let lemma_2b_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_2b")

///|
/// `LEMMA_2b`
pub fn lemma_2b() -> @kernel.Thm {
  lemma_2b_c.get()
}

///|
/// LEMMA_3
fn step_11() -> Unit raise {
  let t396 = @meson.asm_meson_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(a : Cart[Real, 2]) * (b : Cart[Real, 2]) == Cx(real_of_num(1)) → !(a == Cx(real_of_num(0)))"))]))
  let t395 = @simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @complexes.complex_norm_nz(), @realax.real_mul_lid()]))
  let t394 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) * ((r : Real) / (s : Real)) == r * n / s"))]))
  let t393 = @simp.asm_simp_tac(@list.List([@equal.gsym(@complexes.complex_norm_mul()), @complexes.complex_norm_cx(), @calc_int.real_abs_num()]))
  let t392 = @tactics.exists_tac(@term_syntax.parse_term("norm(complex_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), (z : Cart[Real, 2])))"))
  let t391 = @tactics.match_mp_tac(@real.real_le_lcancel_imp())
  let t390 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t387 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((t : (_) -> Bool), IMAGE((f : (_) -> _), (s : (_) -> Bool))) → (∀ x : _, IN(x, s) → (P : (_) -> Bool)(f(x))) → (∀ x : _, IN(x, t) → P(x))")))
  let t389 = @tactics.first_assum(fn(x388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t387(x388))
  })
  let t386 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset()])), @tactics.all_tac])
  let t385 = @simp.rewrite_tac(@list.List([@canal.has_complex_derivative_differentiable()]))
  let t384 = @simp.asm_simp_tac(@list.List([@canal.has_complex_derivative_within_open(), @topology.open_ball(), @canal.complex_differentiable_within_open()]))
  let t381 = @simp.gen_rewrite_rule(fn(x380 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x380
  }, @list.List([@canal.holomorphic_on_differentiable()]))
  let t383 = @tactics.first_assum(fn(x382 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s378 = @tactics.mp_tac(x377)
      fn(x379 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s378(x379)
      }
    })(t381(x382))
  })
  let t375 = @meson.asm_meson_tac(@list.List([@topology.in_ball(), @vectors.dist(), @vectors.dist_sym(), @realarith.real_lt_imp_le()]))
  let t374 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq(), @real.real_lt_div()]))
  let t373 = @simp.gen_rewrite_tac(fn(x370 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s371 = @equal.rand_conv(x370)
    fn(x372 : @kernel.Term) -> @kernel.Thm raise {
      s371(x372)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(t : Real) / (s : Real) * (r : Real) == r / s * t"))]))
  let t369 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("(s : Real) <= (t : Real) → norm((w : Cart[Real, 2]) - (b : Cart[Real, 2])) <= s → distance((b, w)) <= t")))
  let t368 = @simp.asm_simp_tac(@list.List([@topology.centre_in_ball(), @topology.in_cball()]))
  let t364 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]))")
  let t365 = @list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((b : Cart[Real, 2]))"), t364])
  let t376 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x361 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s362 = @tactics.mp_tac(x361)
      fn(x363 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s362(x363)
      }
    })(((x366 : @kernel.Thm) => @bool.specl(t365, x366))(x367))
  }), t368), t369), t373), t374), t375)])
  let t360 = @simp.rewrite_tac(@list.List([@convex.convex_ball()]))
  let t356 = @term_syntax.parse_term("(r : Real) / (s : Real)")
  let t357 = @term_syntax.parse_term("ball(((f : (Cart[Real, 2]) -> Cart[Real, 2])((b : Cart[Real, 2])), (t : Real)))")
  let t358 = @term_syntax.parse_term("complex_derivative((g : (Cart[Real, 2]) -> Cart[Real, 2]))")
  let t359 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])"), t358, t357, t356]), @canal.complex_mvt()))
  let t355 = @tactics.repeat_tac(@tactics.strip_tac)
  let t353 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t354 = @tactics.spec_tac(@term_syntax.parse_term("(z : (Num) -> Cart[Real, 2])((nn : Num))"), t353)
  let t352 = @tactics.x_gen_tac(@term_syntax.parse_term("(nn : Num)"))
  let t351 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t350 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm(), @theorems.imp_imp()]))
  let t349 = @tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, IN((z : (Num) -> Cart[Real, 2])(n), ball(((b : Cart[Real, 2]), (r : Real))))"))
  let t348 = @tactics.undisch_tac(@term_syntax.parse_term("∀ n : Num, IN((f : (Cart[Real, 2]) -> Cart[Real, 2])((z : (Num) -> Cart[Real, 2])(n)), ball((f((b : Cart[Real, 2])), (t : Real))))"))
  let t344 = @simp.asm_simp_tac(@list.List([@real.real_lt_rmul_eq(), @real.real_lt_ldiv_eq(), @realax.real_mul_lid()]))
  let t343 = @simp.gen_rewrite_tac(fn(x340 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s341 = @equal.rand_conv(x340)
    fn(x342 : @kernel.Term) -> @kernel.Thm raise {
      s341(x342)
    }
  }, @list.List([@equal.gsym(@realax.real_mul_lid())]))
  let t339 = @simp.rewrite_tac(@list.List([@topology.subset_balls(), @vectors.dist_refl(), @realax.real_add_lid()]))
  let t337 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")))
  let t345 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t337(x338))
  }), t339), @tactics.disj1_tac), t343), t344)
  let t334 = @simp.asm_simp_tac(@list.List([@canal.complex_differentiable_imp_continuous_at()]))
  let t333 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@trivia.o_def())]))
  let t332 = @tactics.disch_then(@tactics.match_mp_tac)
  let t331 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t330 = @term_syntax.parse_term("sequentially")
  let t335 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t330]), @topology.lim_continuous_function())), t331), t332), t333), t334)
  let t329 = @simp.asm_rewrite_tac(@list.List([@trivia.o_def()]))
  let t328 = @tactics.match_mp_tac(@topology.lim_subsequence())
  let t336 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_assoc()])), t328), t329), t335])
  let t327 = @simp.rewrite_tac(@list.List([@metric.trivial_limit_sequentially()]))
  let t326 = @tactics.exists_tac(@term_syntax.parse_term("o((f : (Cart[Real, 2]) -> Cart[Real, 2]), o((z : (Num) -> Cart[Real, 2]), (r : (Num) -> Num)))"))
  let t346 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("sequentially"), @topology.lim_unique())), t326), t327), @tactics.conj_tac), t336), t345])
  let t325 = @tactics.exists_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t324 = @simp.rewrite_tac(@list.List([]))
  let t321 = @simp.gen_rewrite_rule(fn(x318 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s319 = @equal.rand_conv(x318)
    fn(x320 : @kernel.Term) -> @kernel.Thm raise {
      s319(x320)
    }
  }, @list.List([@sets.in_image()]))
  let t323 = @tactics.first_x_assum(fn(x322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s316 = @tactics.mp_tac(x315)
      fn(x317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s316(x317)
      }
    })(t321(x322))
  })
  let t313 = @term_syntax.parse_term("(r : (Num) -> Num)")
  let t314 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(w : Cart[Real, 2])"), t313]))
  let t312 = @simp.asm_rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t308 = @term_syntax.parse_term("(z : (Num) -> Cart[Real, 2])")
  let t311 = @tactics.disch_then(fn(x310 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x305 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s306 = @tactics.mp_tac(x305)
      fn(x307 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s306(x307)
      }
    })(((x309 : @kernel.Thm) => @bool.spec(t308, x309))(x310))
  })
  let t304 = @simp.rewrite_tac(@list.List([@topology.compact_cball()]))
  let t347 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("cball(((b : Cart[Real, 2]), (t : Real) / (s : Real) * (r : Real)))"), @topology.compact())), t304), t311), t312), t314), @tactics.strip_tac), t323), t324), t325), @tactics.conj_tac), t346)])
  let t303 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, IN((z : (Num) -> Cart[Real, 2])(n), cball(((b : Cart[Real, 2]), (t : Real) / (s : Real) * (r : Real))))"), fn(x300 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s301 = @tactics.assume_tac(x300)
    fn(x302 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s301(x302)
    }
  })
  let t299 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : (Num) -> Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t298 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t297 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t296 = @simp.rewrite_tac(@list.List([@class.eta_ax(), @theorems.left_and_exists_thm(), @equal.gsym(@theorems.conj_assoc())]))
  let t295 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.fun_eq_thm())]))
  let t294 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_inter(), @class.skolem_thm(), @theorems.forall_and_thm()]))
  let t292 = @simp.rewrite_tac(@list.List([@topology.closure_sequential()]))
  let t291 = @simp.asm_rewrite_tac(@list.List([@topology.in_cball(), @realax.real_le_refl()]))
  let t290 = @simp.asm_simp_tac(@list.List([@topology.closure_ball()]))
  let t293 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → INTER(t, s) == s"))])), t290), t291), t292])
  let t289 = @tactics.subgoal_then(@term_syntax.parse_term("IN((c : Cart[Real, 2]), closure(INTER(IMAGE((f : (Cart[Real, 2]) -> Cart[Real, 2]), ball(((b : Cart[Real, 2]), (r : Real)))), ball((f(b), (t : Real))))))"), fn(x286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s287 = @tactics.mp_tac(x286)
    fn(x288 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s287(x288)
    }
  })
  let t284 = @simp.asm_rewrite_tac(@list.List([@topology.centre_in_ball()]))
  let t281 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("!IN((y : _), IMAGE((f : (_) -> _), (s : (_) -> Bool))) → IN((x : _), s) → !(f(x) == y)")))
  let t283 = @tactics.first_x_assum(fn(x282 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t281(x282))
  })
  let t280 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist_nz())]))
  let t285 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("t"), t280), t283), t284), @tactics.all_tac])
  let t279 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (t : Real)"), fn(x276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s277 = @tactics.assume_tac(x276)
    fn(x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s277(x278)
    }
  })
  let t275 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("false → (p : Bool)")))
  let t274 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@real.real_not_le()])))
  let t273 = @list.List([@meson.asm_meson_tac(@list.List([@topology.subset_ball(), @sets.subset_trans()])), @tactics.all_tac])
  let t272 = @class.asm_cases_tac(@term_syntax.parse_term("(s : Real) <= (t : Real)"))
  let t271 = @simp.abbrev_tac(@term_syntax.parse_term("(t : Real) == distance(((f : (Cart[Real, 2]) -> Cart[Real, 2])((b : Cart[Real, 2])), (c : Cart[Real, 2])))"))
  let t267 = @equal.gsym(@sets.subset())
  let t268 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.in_ball()), @real.real_not_le(), t267]))
  let t269 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x266 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x262 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x256 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s257 = @equal.land_conv(x256)
        fn(x258 : @kernel.Term) -> @kernel.Thm raise {
          s257(x258)
        }
      })((fn(x259 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s260 = @equal.rand_conv(x259)
        fn(x261 : @kernel.Term) -> @kernel.Thm raise {
          s260(x261)
        }
      })(x262))
    })((fn(x263 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s264 = @equal.binder_conv(x263)
      fn(x265 : @kernel.Term) -> @kernel.Thm raise {
        s264(x265)
      }
    })(x266))
  }, @list.List([@equal.gsym(@class.contrapos_thm())])), t268)
  let t255 = @simp.asm_simp_tac(@list.List([@canal.holomorphic_on_differentiable(), @canal.holomorphic_on_imp_continuous_on(), @canal.complex_differentiable_at_within()]))
  let t254 = @simp.rewrite_tac(@list.List([@topology.compact_cball()]))
  let t253 = @tactics.match_mp_tac(@topology.compact_continuous_image())
  let t252 = @tactics.match_mp_tac(@topology.compact_imp_bounded())
  let t251 = @simp.simp_tac(@list.List([@sets.image_subset(), @topology.ball_subset_cball()]))
  let t250 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((f : (Cart[Real, 2]) -> Cart[Real, 2]), cball(((b : Cart[Real, 2]), (r : Real))))"))
  let t249 = @tactics.match_mp_tac(@topology.bounded_subset())
  let t248 = @simp.rewrite_tac(@list.List([@topology.not_bounded_univ()]))
  let t244 = @term_syntax.parse_term("(bounded : ((Cart[Real, 2]) -> Bool) -> Bool)")
  let t247 = @tactics.disch_then(fn(x246 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s242 = @tactics.mp_tac(x241)
      fn(x243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s242(x243)
      }
    })(((x245 : @kernel.Thm) => @equal.ap_term(t244, x245))(x246))
  })
  let t270 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(DIFF(UNIV, (s : (_) -> Bool)) == {}) == (s == UNIV)"))])), t247), t248), t249), t250), t251), t252), t253), t254), t255), t269])
  let t240 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@topology.open_closed()), @sets.in_diff(), @sets.in_univ()]))
  let t238 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((b : Cart[Real, 2]))")
  let t239 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("DIFF(UNIV, IMAGE((f : (Cart[Real, 2]) -> Cart[Real, 2]), ball(((b : Cart[Real, 2]), (r : Real)))))"), t238]), @topology.closest_point_exists()))
  let t237 = @simp.abbrev_tac(@term_syntax.parse_term("(c : Cart[Real, 2]) == closest_point(DIFF(UNIV, IMAGE((f : (Cart[Real, 2]) -> Cart[Real, 2]), ball(((b : Cart[Real, 2]), (r : Real))))), f(b))"))
  let t235 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s233 = @tactics.assume_tac(x232)
    fn(x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s233(x234)
    }
  }, @tactics.x_choose_then(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])"))(@tactics.strip_assume_tac)))
  let t236 = @list.List([@simp.asm_simp_tac(@list.List([@canal.holomorphic_on_differentiable(), @canal.complex_differentiable_at_within()])), t235])
  let t231 = @simp.asm_rewrite_tac(@list.List([@sets.injective_on_alt(), @topology.open_ball()]))
  let t229 = @term_syntax.parse_term("ball(((b : Cart[Real, 2]), (r : Real)))")
  let t230 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t229]), @cauchy.holomorphic_on_inverse()))
  let t228 = @tactics.repeat_tac(@tactics.strip_tac)
  let t227 = @simp.rewrite_tac(@list.List([@sets.injective_on_alt()]))
  let t225 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t226 = @tactics.spec_tac(@term_syntax.parse_term("ITER((n : Num), cexp)"), t225)
  let t224 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(n : Num)"), complex_differentiable_iter_cexp()))
  let t223 = @list.List([@meson.asm_meson_tac(@list.List([@topology.ball_eq_empty(), @sets.empty_subset()])), @tactics.all_tac])
  let t222 = @tactics.disj_cases_tac(@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) <= real_of_num(0) || real_of_num(0) < s")))
  let t397 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t222), t223), t224), t226), t227), t228), t230), t231), @tactics.ants_tac), t236), t237), t239), t240), @tactics.ants_tac), t270), t271), @tactics.strip_tac), t272), t273), t274), t275), t279), t285), t289), t293), t294), t295), t296), t297), t298), t299), t303), t347), t348), t349), t350), t351), t352), t354), t355), t359), t360), @tactics.ants_tac), t376), t383), t384), t385), @tactics.disch_tac), @tactics.conj_tac), t386), t389), t390), @tactics.disch_tac), t391), t392), t393), t394), t395), t396)
  lemma_3_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ b : Cart[Real, 2], ∀ r : Real, ∀ s : Real, real_of_num(0) < r && (∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], IN(w, ball((b, r))) && IN(z, ball((b, r))) && ITER(n, cexp, w) == ITER(n, cexp, z) → w == z) && (∀ z : Cart[Real, 2], IN(z, ball((b, r))) → s <= r * norm(complex_derivative(ITER(n, cexp), z))) → SUBSET(ball((ITER(n, cexp, b), s)), IMAGE(ITER(n, cexp), ball((b, r))))"), t397))
}

///|
let lemma_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_3")

///|
/// `LEMMA_3`
pub fn lemma_3() -> @kernel.Thm {
  lemma_3_c.get()
}

///|
/// LEMMA_4
fn step_12() -> Unit raise {
  let t659 = @simp.simp_tac(@list.List([@complexes.im_def(), @vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t658 = @simp.asm_rewrite_tac(@list.List([@complexes.im_add(), @complexes.im_sub(), @complexes.complex_cmul(), @complexes.im_mul_cx()]))
  let t657 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])))
  let t655 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t656 = @tactics.map_every(fn(x652 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s653 = @tactics.exists_tac(x652)
    fn(x654 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s653(x654)
    }
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t655]))
  let t651 = @tactics.disch_then(fn(x650 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x650))
  })
  let t649 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Cart[Real, 2])"))
  let t648 = @tactics.disch_then(fn(x647 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x647))
  })
  let t646 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t645 = @simp.rewrite_tac(@list.List([@sets.in_image(), @theorems.left_imp_exists_thm()]))
  let t643 = @vectors.norm_arith(@term_syntax.parse_term("distance(((w : Cart[Real, 2]), w + (x : Cart[Real, 2]))) == norm(x) && distance((w, w - x)) == norm(x)"))
  let t644 = @simp.simp_tac(@list.List([@topology.in_ball(), @vectors.norm_mul(), @vectors.norm_basis(), @cart.dimindex_2(), @calc_num.arith(), @transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < pi → abs(pi / real_of_num(2)) * real_of_num(1) < pi")), t643]))
  let t642 = @tactics.disch_then(fn(x639 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x639
    let t641 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(w : Cart[Real, 2]) + op_pct(pi / real_of_num(2), basis(2))"), th_1))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(w : Cart[Real, 2]) - op_pct(pi / real_of_num(2), basis(2))"), th_1)), t641)
  })
  let t638 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t660 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.abbrev_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) == ITER((r : (Num) -> Num)((n : Num)), cexp, (z : Cart[Real, 2]))")), t638), t642), t644), t645), t646), t648), t649), t651), t656), t657), t658), t659), @calc_rat.real_arith_tac)
  let t637 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t636 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq()]))
  let t633 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("pi < (x : Real) → x <= (y : Real) → pi <= y")))
  let t635 = @tactics.first_x_assum(fn(x634 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t633(x634))
  })
  let t632 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t661 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t632])), @tactics.disch_tac), t635), t636), t637), t660])
  let t631 = @simp.asm_rewrite_tac(@list.List([]))
  let t627 = @term_syntax.parse_term("pi")
  let t628 = @term_syntax.parse_term("(r : Real)")
  let t629 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t630 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(r : (Num) -> Num)((n : Num))"), t629, t628, t627]), lemma_3()))
  let t626 = @tactics.exists_tac(@term_syntax.parse_term("(r : (Num) -> Num)((n : Num))"))
  let t623 = @term_syntax.parse_term("(n : Num)")
  let t625 = @tactics.disch_then((x624 : @kernel.Thm) => @tactics.x_choose_tac(t623, x624))
  let t622 = @simp.asm_simp_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@real.real_lt_ldiv_eq())]))
  let t621 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_approx_32()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t619 = @term_syntax.parse_term("pi / (r : Real)")
  let t620 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("pi / real_of_num(3)"), t619]), @real.real_arch_pow()))
  let t618 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Real)"))
  let t617 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t613 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t616 = @tactics.disch_then(fn(x615 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x610 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s611 = @tactics.mp_tac(x610)
      fn(x612 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s611(x612)
      }
    })(((x614 : @kernel.Thm) => @bool.spec(t613, x614))(x615))
  })
  let t607 = @simp.gen_rewrite_rule(fn(x606 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x606
  }, @list.List([@topology.open_contains_ball()]))
  let t609 = @tactics.first_x_assum(fn(x608 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x603 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s604 = @tactics.mp_tac(x603)
      fn(x605 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s604(x605)
      }
    })(t607(x608))
  })
  let t600 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t602 = @tactics.disch_then((x601 : @kernel.Thm) => @tactics.x_choose_tac(t600, x601))
  let t597 = @simp.gen_rewrite_rule(fn(x596 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x596
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t599 = @tactics.first_x_assum(fn(x598 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x593 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s594 = @tactics.mp_tac(x593)
      fn(x595 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s594(x595)
      }
    })(t597(x598))
  })
  let t591 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t590 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t589 = @tactics.disch_then(@tactics.match_mp_tac)
  let t585 = @term_syntax.parse_term("SUC((n : Num))")
  let t583 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("DISJOINT(IMAGE((f : (_) -> _), (s : (_) -> Bool)), (t : (_) -> Bool)) → (∀ P : (_) -> Bool, (∀ z : _, !IN(z, t) → P(z)) → (∀ z : _, IN(z, s) → P(f(z))))")))
  let t588 = @tactics.first_x_assum(fn(x587 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x584 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x580 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s581 = @tactics.mp_tac(x580)
        fn(x582 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s581(x582)
        }
      })(t583(x584))
    })(((x586 : @kernel.Thm) => @bool.spec(t585, x586))(x587))
  })
  let t578 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t579 = @tactics.spec_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"), t578)
  let t577 = @tactics.undisch_tac(@term_syntax.parse_term("IN((z : Cart[Real, 2]), (v : (Cart[Real, 2]) -> Bool))"))
  let t576 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realax.real_le_trans()))
  let t575 = @simp.asm_simp_tac(@list.List([@iter.iter_add(), @arith.sub_add(), @arith.lt_imp_le()]))
  let t574 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) < (n : Num) → 1 <= n - m"))]))
  let t568 = @drule.part_match(fn(x567 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x567))
  }, lemma_1())
  let t563 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (x : Real) / real_of_num(3)) == (real_of_num(0) < x)")), @transcendentals.pi_pos(), @real.real_pow_le(), @realarith.real_lt_imp_le()]))
  let t562 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t561 = @simp.rewrite_tac(@list.List([@realax.real_pow(), @complexes.complex_norm_mul()]))
  let t559 = @simp.simp_tac(@list.List([@canal.complex_derivative_chain(), complex_differentiable_iter_cexp()]))
  let t558 = @simp.asm_simp_tac(@list.List([@arith.sub_add(), @arith.lt_imp_le()]))
  let t560 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @iter.iter_add()])), t558), t559])
  let t557 = @tactics.subgoal_then(@term_syntax.parse_term("ITER((r : (Num) -> Num)(SUC((n : Num))), cexp) == o(ITER(r(SUC(n)) - r(n), cexp), ITER(r(n), cexp))"), fn(x554 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s555 = @tactics.subst1_tac(x554)
    fn(x556 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s555(x556)
    }
  })
  let t552 = @tactics.mp_tac(@transcendentals.pi_approx_32())
  let t551 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t547 = @term_syntax.parse_term("0")
  let t545 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("DISJOINT(IMAGE((f : (_) -> _), (s : (_) -> Bool)), (t : (_) -> Bool)) → (∀ z : _, !IN(z, t) → (P : (_) -> Bool)(z)) → (∀ z : _, IN(z, s) → P(f(z)))")))
  let t550 = @tactics.first_x_assum(fn(x549 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x546 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.match_mp_tac(t545(x546))
    })(((x548 : @kernel.Thm) => @bool.spec(t547, x548))(x549))
  })
  let t543 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t544 = @tactics.spec_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"), t543)
  let t542 = @tactics.undisch_tac(@term_syntax.parse_term("IN((z : Cart[Real, 2]), (v : (Cart[Real, 2]) -> Bool))"))
  let t541 = @simp.asm_simp_tac(@list.List([@realax.real_pow(), @arith.le_1(), lemma_1()]))
  let t540 = @term_syntax.parse_term("abs(Im(ITER((r : (Num) -> Num)(0), cexp, (z : Cart[Real, 2]))))")
  let t553 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.trans_tac(@realax.real_le_trans())(t540), t541), t542), t544), t550), t551), t552), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t592 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))), @tactics.disch_tac), t553), t557), t560), t561), t562), t563), fn(x573 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x572 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x570 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x569 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x564 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s565 = @tactics.mp_tac(x564)
            fn(x566 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s565(x566)
            }
          })(t568(x569))
        })(@kernel.rand(x570))
      })((fn(x571 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x571.1
      })(x572))
    })(x573)(x573)
  }), t574), t575), t576), t577), t579), t588), t589), t590), t591), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t539 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∀ z : Cart[Real, 2], IN(z, (v : (Cart[Real, 2]) -> Bool)) → pow(pi / real_of_num(3), n) <= norm(complex_derivative(ITER((r : (Num) -> Num)(n), cexp), z))"), fn(x536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s537 = @tactics.assume_tac(x536)
    fn(x538 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s537(x538)
    }
  })
  let t534 = @meson.asm_meson_tac(@list.List([@arith.lt_trans()]))
  let t535 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@arith.transitive_stepwise_lt()), t534), @tactics.all_tac])
  let t533 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → (r : (Num) -> Num)(m) < r(n)"), fn(x530 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s531 = @tactics.assume_tac(x530)
    fn(x532 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s531(x532)
    }
  })
  let t528 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) < (n : Num) → 0 < n"))]))
  let t527 = @tactics.match_mp_tac(@arith.dependent_choice())
  let t529 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.and_forall_thm()])), t527), t528), @tactics.all_tac])
  let t526 = @tactics.subgoal_then(@term_syntax.parse_term("∃ r : (Num) -> Num, ((∀ n : Num, 0 < r(n)) && (∀ n : Num, DISJOINT(IMAGE(ITER(r(n), cexp), (v : (Cart[Real, 2]) -> Bool)), {(z : Cart[Real, 2]) | abs(Im(z)) <= pi / real_of_num(3)}))) && (∀ n : Num, r(n) < r(SUC(n)))"), @tactics.strip_assume_tac)
  let t525 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.injective_on_alt()])))
  let t523 = @simp.asm_rewrite_tac(@list.List([]))
  let t522 = @tactics.match_mp_tac(@floor.real_abs_integer_lemma())
  let t521 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) <= (x : Real) → real_of_num(1) <= real_of_num(2) * x")))
  let t520 = @simp.simp_tac(@list.List([@real.real_le_lmul_eq(), @transcendentals.pi_pos()]))
  let t519 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(pi <= real_of_num(2) * ((x : Real) * pi)) == (pi * real_of_num(1) <= pi * (real_of_num(2) * x))"))]))
  let t518 = @simp.simp_tac(@list.List([@real.real_abs_mul(), @transcendentals.real_abs_pi(), @calc_int.real_abs_num()]))
  let t517 = @tactics.disch_then(fn(x516 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t515 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @complexes.complex_mul_lzero(), @complexes.complex_add_rid()]))
  let t514 = @class.asm_cases_tac(@term_syntax.parse_term("(i : Real) == real_of_num(0)"))
  let t513 = @simp.asm_rewrite_tac(@list.List([@complexes.im_add(), @real.real_add_sub(), @complexes.im_mul_ii(), @complexes.re_cx()]))
  let t512 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(i : Real)"))(@tactics.strip_assume_tac))
  let t509 = @simp.gen_rewrite_rule(fn(x508 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x508
  }, @list.List([@transcendentals.cexp_eq()]))
  let t511 = @tactics.first_x_assum(fn(x510 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x505 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s506 = @tactics.mp_tac(x505)
      fn(x507 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s506(x507)
      }
    })(t509(x510))
  })
  let t504 = @simp.asm_rewrite_tac(@list.List([]))
  let t499 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t500 = @list.List([@term_syntax.parse_term("(w : Cart[Real, 2])"), t499])
  let t503 = @tactics.first_x_assum(fn(x502 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s497 = @tactics.mp_tac(x496)
      fn(x498 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s497(x498)
      }
    })(((x501 : @kernel.Thm) => @bool.specl(t500, x501))(x502))
  })
  let t495 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t494 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t493 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t492 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t491 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t490 = @simp.rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t489 = @tactics.disch_then(fn(x486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x486
    let t488 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(n : Num)")), t488)
  })
  let t485 = @simp.rewrite_tac(@list.List([]))
  let t482 = @drule.match_mp(@class.taut(@term_syntax.parse_term("((p : Bool) → (r : Bool)) → (!p → (q : Bool) → r) → q → r")))
  let t484 = @tactics.first_x_assum(fn(x483 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t482(x483))
  })
  let t481 = @simp.simp_tac(@list.List([@iter.iter()]))
  let t480 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t478 = @simp.gen_rewrite_rule(fn(x477 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x477
  }, @list.List([@class.not_forall_thm()]))
  let t524 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x479 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x474 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s475 = @tactics.mp_tac(x474)
      fn(x476 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s475(x476)
      }
    })(t478(x479))
  }), t480), @nums.induct_tac), t481), t484), t485), @tactics.disch_tac), t489), t490), t491), t492), t493), t494), t495), @tactics.strip_tac), t503), t504), t511), t512), t513), t514), t515), t517), t518), t519), t520), t521), t522), t523)])
  let t473 = @class.asm_cases_tac(@term_syntax.parse_term("∀ n : Num, ∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], IN(w, (v : (Cart[Real, 2]) -> Bool)) && IN(z, v) && ITER(n, cexp, w) == ITER(n, cexp, z) → w == z"))
  let t469 = @simp.asm_simp_tac(@list.List([@transcendentals.pi_nz(), @floor.floor(), @calc_rat.real_field(@term_syntax.parse_term("!(pi == real_of_num(0)) → (x : Real) * pi / pi == x"))]))
  let t468 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t470 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t468), @tactics.strip_tac), t469)
  let t465 = @simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @real.real_add_rdistrib(), @real.real_div_rmul(), @transcendentals.pi_pos(), @real.real_lt_imp_nz(), @complexes.im_add(), @complexes.im_mul_ii(), @complexes.re_cx(), @real.real_le_ladd()]))
  let t464 = @simp.rewrite_tac(@list.List([@floor.floor()]))
  let t463 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + real_of_num(1) <= (y : Real) && y < floor(y) + real_of_num(1) → x <= floor(y)")))
  let t466 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac]))), t463), t464), t465), @calc_rat.asm_real_arith_tac)
  let t462 = @simp.simp_tac(@list.List([@canal.holomorphic_on_differentiable(), complex_differentiable_iter_cexp(), @canal.holomorphic_on_imp_continuous_on(), @canal.complex_differentiable_at_within()]))
  let t461 = @simp.asm_rewrite_tac(@list.List([]))
  let t467 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.connected_continuous_image()), t461), t462), t466])
  let t471 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@floor.floor()])), @tactics.conj_tac), t467), t470])
  let t458 = @equal.gsym(@real.real_le_rdiv_eq())
  let t459 = @equal.gsym(@real.real_le_ldiv_eq())
  let t460 = @simp.simp_tac(@list.List([@transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < real_of_num(2)")), @real.real_lt_mul(), t459, t458]))
  let t457 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith(), @equal.gsym(@complexes.im_def()), @sets.exists_in_image()]))
  let t452 = @term_syntax.parse_term("2")
  let t453 = @term_syntax.parse_term("floor(Im(ITER((n : Num), cexp, (w : Cart[Real, 2]))) / pi) * pi")
  let t454 = @term_syntax.parse_term("ITER((n : Num), cexp, (w : Cart[Real, 2]))")
  let t455 = @term_syntax.parse_term("ITER((n : Num), cexp, (z : Cart[Real, 2]))")
  let t456 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("IMAGE(ITER((n : Num), cexp), (v : (Cart[Real, 2]) -> Bool))"), t455, t454, t453, t452]), @topology.connected_ivt_component()))
  let t451 = @tactics.repeat_tac(@tactics.strip_tac)
  let t450 = @simp.simp_tac(@list.List([@realax.real_abs(), @realarith.real_sub_le()]))
  let t448 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t449 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(w : Cart[Real, 2])"), t448]))
  let t447 = @list.List([@meson.meson_tac(@list.List([@real.real_abs_sub()])), @tactics.all_tac])
  let t446 = @simp.rewrite_tac(@list.List([@realax.real_le_total()]))
  let t445 = @tactics.exists_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) => (z : Cart[Real, 2]) => Im(ITER((n : Num), cexp, z)) <= Im(ITER(n, cexp, w))"))
  let t444 = @tactics.match_mp_tac(@theorems.wlog_relation())
  let t443 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t442 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t472 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t442), t443), t444), t445), t446), @tactics.conj_tac), t447), t449), t450), t451), t456), t457), t460), @tactics.ants_tac), t471)])
  let t441 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Num, ∃ w : Cart[Real, 2], ∃ z : Cart[Real, 2], IN(w, (v : (Cart[Real, 2]) -> Bool)) && IN(z, v) && pi <= abs(Im(ITER(n, cexp, w)) - Im(ITER(n, cexp, z)))"), fn(x438 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s439 = @tactics.mp_tac(x438)
    fn(x440 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s439(x440)
    }
  })
  let t434 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t433 = @simp.asm_simp_tac(@list.List([@complexes.real(), @sets.in_elim_thm()]))
  let t432 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : Cart[Real, 2], real(x) → IN(x, (t : (Cart[Real, 2]) -> Bool))) && IN((z : _), (s : (_) -> Bool)) → real((f : (_) -> Cart[Real, 2])(z)) → !DISJOINT(IMAGE(f, s), t)")))
  let t428 = @term_syntax.parse_term("(d : Num)")
  let t431 = @tactics.first_x_assum(fn(x430 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s426 = @tactics.mp_tac(x425)
      fn(x427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s426(x427)
      }
    })(((x429 : @kernel.Thm) => @bool.spec(t428, x429))(x430))
  })
  let t424 = @tactics.disch_then(fn(x421 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s422 = @tactics.subst1_tac(x421)
    fn(x423 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s422(x423)
    }
  })
  let t420 = @term_syntax.parse_term("(d : Num)")
  let t435 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(q : Num)"), t420])), t424), t431), t432), t433), t434), @calc_rat.real_arith_tac)
  let t418 = @simp.asm_simp_tac(@list.List([@iter.iter(), @transcendentals.real_exp()]))
  let t417 = @simp.simp_tac(@list.List([@real.real_div_rmul(), @transcendentals.pi_nz()]))
  let t414 = @drule.match_mp(@transcendentals.sin_integer_pi())
  let t416 = @tactics.first_assum(fn(x415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x411 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s412 = @tactics.mp_tac(x411)
      fn(x413 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s412(x413)
      }
    })(t414(x415))
  })
  let t419 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.add_clauses(), @iter.iter(), @complexes.real(), @transcendentals.im_cexp(), @realarith.real_entire()])), @tactics.disj2_tac), t416), t417), t418])
  let t436 = @list.List([@tactics.thenl(@tactics.then_tac(@nums.induct_tac, @simp.once_rewrite_tac(@list.List([@arith.add_clauses()]))), t419), t435])
  let t410 = @tactics.subgoal_then(@term_syntax.parse_term("∀ d : Num, real(ITER((n : Num) + SUC(d), cexp, (z : Cart[Real, 2])))"), fn(x407 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s408 = @tactics.assume_tac(x407)
    fn(x409 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s408(x409)
    }
  })
  let t406 = @simp.rewrite_tac(@list.List([@arith.lt_exists(), @theorems.left_imp_exists_thm()]))
  let t437 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(n : Num)")), t406), t410), t436)])
  let t405 = @tactics.subgoal_then(@term_syntax.parse_term("∃ n : Num, ∃ z : Cart[Real, 2], IN(z, (v : (Cart[Real, 2]) -> Bool)) && integer(Im(ITER(n, cexp, z)) / pi)"), @tactics.strip_assume_tac)
  let t402 = @simp.asm_rewrite_tac(@list.List([@arith.not_le()]))
  let t401 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t400 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @sets.subset(), @sets.in_elim_thm(), @iterate.in_numseg(), @arith.le_0()]))
  let t399 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (N : Num))"))
  let t403 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t399), t400), t401), t402)
  let t404 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(p : Bool) → p) → p"))), @tactics.disch_tac), t403])
  let t398 = @tactics.subgoal_then(@term_syntax.parse_term("∃ N : Num, ∀ n : Num, N < n → !DISJOINT(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), {(z : Cart[Real, 2]) | abs(Im(z)) <= pi / real_of_num(3)})"), @tactics.strip_assume_tac)
  let t662 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t398), t404), t405), t437), t441), t472), t473), t524), t525), t526), t529), t533), t535), t539), t592), t599), t602), t609), t616), t617), t618), @tactics.strip_tac), t620), @tactics.ants_tac), t621), t622), t625), t626), t630), t631), @tactics.ants_tac), t661)
  lemma_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 2]) -> Bool, !(v == {}) && open(v) && connected(v) → FINITE({(n : Num) | DISJOINT(IMAGE(ITER(n, cexp), v), {(z : Cart[Real, 2]) | abs(Im(z)) <= pi / real_of_num(3)})})"), t662))
}

///|
let lemma_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_4")

///|
/// `LEMMA_4`
pub fn lemma_4() -> @kernel.Thm {
  lemma_4_c.get()
}

///|
/// LEMMA_5
fn step_13() -> Unit raise {
  let t944 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t945 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), @int.asm_arith_tac), t944])
  let t943 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) && (r : Bool) → (!p && !(q : Bool) → !r) → q")))
  let t942 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(DIFF((s : (_) -> Bool), (t : (_) -> Bool)) == {}) == SUBSET(s, t)"))]))
  let t941 = @simp.asm_simp_tac(@list.List([@topology.connected_continuous_image(), continuous_on_iter_cexp()]))
  let t940 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t946 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("IMAGE(ITER(SUC((n : Num) + (m : Num)), cexp), (v : (Cart[Real, 2]) -> Bool))"), t940]), @topology.connected_inter_frontier()))), t941), t942), t943), @tactics.conj_tac), t945)
  let t939 = @tactics.mp_tac(@cauchy.log2_approx_32())
  let t936 = @drule.match_mp(lemma_2a())
  let t938 = @tactics.first_x_assum(fn(x937 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x933 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s934 = @tactics.mp_tac(x933)
      fn(x935 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s934(x935)
      }
    })(t936(x937))
  })
  let t932 = @tactics.repeat_tac(@tactics.strip_tac)
  let t931 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t930 = @tactics.map_every(fn(x927 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s928 = @simp.expand_tac(x927)
    fn(x929 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s928(x929)
    }
  }, @list.List(["h", "s"]))
  let t924 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((u : (_) -> Bool), INTER((w : (_) -> Bool), INTER((h : (_) -> Bool), (s : (_) -> Bool)))) → (∀ x : _, IN(x, h) && IN(x, s) → IN((f : (_) -> _)(x), h)) → SUBSET(IMAGE(f, u), h)")))
  let t926 = @tactics.first_x_assum(fn(x925 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t924(x925))
  })
  let t947 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iter.iter_pointless(), @sets.image_o()])), t926), t930), t931), t932), t938), t939), @calc_rat.asm_real_arith_tac), t946])
  let t923 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t922 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), @int.asm_arith_tac), @tactics.disch_tac])
  let t921 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t920 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @sets.subset_inter()]))
  let t919 = @list.List([@simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), @iter.iter_pointless(), @sets.subset_inter()])), @tactics.all_tac])
  let t918 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t917 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, SUBSET(IMAGE(ITER((n : Num) + m, cexp), (v : (Cart[Real, 2]) -> Bool)), INTER((w : (Cart[Real, 2]) -> Bool), INTER((h : (Cart[Real, 2]) -> Bool), (s : (Cart[Real, 2]) -> Bool))))"), fn(x914 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s915 = @tactics.mp_tac(x914)
    fn(x916 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s915(x916)
    }
  })
  let t912 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t911 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t909 = @equal.gsym(@iter.iter_add())
  let t910 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(t909)]))
  let t908 = @simp.gen_rewrite_tac(fn(x907 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x903 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x899 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x893 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s894 = @equal.rand_conv(x893)
          fn(x895 : @kernel.Term) -> @kernel.Thm raise {
            s894(x895)
          }
        })((fn(x896 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s897 = @equal.rand_conv(x896)
          fn(x898 : @kernel.Term) -> @kernel.Thm raise {
            s897(x898)
          }
        })(x899))
      })((fn(x900 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s901 = @equal.land_conv(x900)
        fn(x902 : @kernel.Term) -> @kernel.Thm raise {
          s901(x902)
        }
      })(x903))
    })((fn(x904 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s905 = @equal.land_conv(x904)
      fn(x906 : @kernel.Term) -> @kernel.Thm raise {
        s905(x906)
      }
    })(x907))
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t892 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t891 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t890 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) > (y : Real)) == !(x <= y)"))]))
  let t889 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t888 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(z : Cart[Real, 2])"), lemma_2b()))
  let t887 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t913 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ z : Cart[Real, 2], IN(z, IMAGE(ITER((n : Num), cexp), (v : (Cart[Real, 2]) -> Bool)))"), @tactics.strip_assume_tac), t887), t888), @tactics.ants_tac), t889), t890), t891), t892), t908), t910), t911), t912])
  let t886 = @tactics.subgoal_then(@term_syntax.parse_term("∃ m : Num, !SUBSET(IMAGE(ITER((n : Num) + m, cexp), (v : (Cart[Real, 2]) -> Bool)), (s : (Cart[Real, 2]) -> Bool))"), fn(x883 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s884 = @tactics.mp_tac(x883)
    fn(x885 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s884(x885)
    }
  })
  let t882 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(DIFF((s : (_) -> Bool), (t : (_) -> Bool)) == {}) == SUBSET(s, t)"))]))
  let t881 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t880 = @simp.asm_simp_tac(@list.List([@topology.connected_continuous_image(), continuous_on_iter_cexp(), @class.not_imp()]))
  let t878 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t879 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("IMAGE(ITER((n : Num), cexp), (v : (Cart[Real, 2]) -> Bool))"), t878]), @topology.connected_inter_frontier()))
  let t877 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("!((m : Num) <= (n : Num)) → n <= m")))
  let t876 = @simp.rewrite_tac(@list.List([@sets.subset_inter()]))
  let t875 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t874 = @simp.rewrite_tac(@list.List([@class.not_imp(), @sets.in_elim_thm(), @iterate.in_numseg(), @arith.le_0()]))
  let t873 = @simp.pure_once_rewrite_tac(@list.List([@sets.subset()]))
  let t871 = @sets.set_tac(@list.List([]))
  let t870 = @simp.asm_simp_tac(@list.List([@sets.infinite_diff_finite()]))
  let t869 = @tactics.exists_tac(@term_syntax.parse_term("DIFF({(n : Num) | SUBSET(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), (h : (Cart[Real, 2]) -> Bool))}, {(n : Num) | !SUBSET(IMAGE(ITER(n, cexp), v), (w : (Cart[Real, 2]) -> Bool))})"))
  let t868 = @tactics.match_mp_tac(@sets.infinite_superset())
  let t867 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @equal.gsym(@sets.infinite())]))
  let t865 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t872 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x866 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s863 = @tactics.mp_tac(x862)
      fn(x864 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s863(x864)
      }
    })(t865(x866))
  }), t867), t868), t869), t870), t871), @tactics.all_tac])
  let t861 = @tactics.subgoal_then(@term_syntax.parse_term("!SUBSET({(n : Num) | SUBSET(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), INTER((w : (Cart[Real, 2]) -> Bool), (h : (Cart[Real, 2]) -> Bool)))}, op_dot_dot(0, (N : Num)))"), fn(x858 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s859 = @tactics.mp_tac(x858)
    fn(x860 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s859(x860)
    }
  })
  let t856 = @meson.meson_tac(@list.List([]))
  let t855 = @simp.rewrite_tac(@list.List([@sets.disjoint(), @sets.in_elim_thm(), @sets.in_union()]))
  let t854 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((N : Num) + 1 <= (n : Num)) == !(n <= N)")), @class.contrapos_thm()]))
  let t853 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(fn(x850 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x850
    let t852 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(N : Num) + 1")), t852)
  }))
  let t849 = @list.List([@meson.asm_meson_tac(@list.List([lemma_4()])), @tactics.all_tac])
  let t848 = @simp.asm_simp_tac(@list.List([@sets.finite_union()]))
  let t847 = @term_syntax.parse_term("UNION({(n : Num) | !SUBSET(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), (w : (Cart[Real, 2]) -> Bool))}, {(n : Num) | DISJOINT(IMAGE(ITER(n, cexp), v), (s : (Cart[Real, 2]) -> Bool))})")
  let t857 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => n"), t847]), @misc.upper_bound_finite_set())), t848), @tactics.ants_tac), t849), t853), t854), t855), t856), @tactics.all_tac])
  let t846 = @tactics.subgoal_then(@term_syntax.parse_term("∃ N : Num, (∀ n : Num, N <= n → !(INTER(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), (s : (Cart[Real, 2]) -> Bool)) == {})) && (∀ n : Num, N <= n → SUBSET(IMAGE(ITER(n, cexp), v), (w : (Cart[Real, 2]) -> Bool)))"), @tactics.strip_assume_tac)
  let t844 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t837 = @drule.part_match(@equal.lhand, @topology.frontier_inter_subset())
  let t833 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})"))]))
  let t832 = @simp.expand_tac("w")
  let t831 = @simp.rewrite_tac(@list.List([@topology.frontier_complement()]))
  let t830 = @simp.asm_simp_tac(@list.List([@topology.connected_continuous_image(), continuous_on_iter_cexp()]))
  let t827 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.connected_inter_frontier()))
  let t829 = @tactics.disch_then(fn(x828 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x824 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s825 = @tactics.mp_tac(x824)
      fn(x826 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s825(x826)
      }
    })(t827(x828))
  })
  let t823 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(!(INTER((s : (_) -> Bool), DIFF(UNIV, (t : (_) -> Bool))) == {}) && !(DIFF(s, DIFF(UNIV, t)) == {}) → false) → !SUBSET(s, t) → DISJOINT(s, t)")))
  let t822 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t821 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t820 = @simp.gen_rewrite_tac(fn(x819 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x819
  }, @list.List([@sets.subset()]))
  let t817 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.finite_subset()))
  let t845 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t817(x818))
  }), t820), t821), t822), t823), t829), t830), t831), t832), t833), fn(x843 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x842 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x840 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x839 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x838 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s835 = @tactics.mp_tac(x834)
              fn(x836 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s835(x836)
              }
            })(t837(x838))
          })(@kernel.rand(x839))
        })(@equal.lhand(x840))
      })((fn(x841 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x841.1
      })(x842))
    })(x843)(x843)
  }), t844), @tactics.all_tac])
  let t816 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(n : Num) | !SUBSET(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), (w : (Cart[Real, 2]) -> Bool))})"), fn(x813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s814 = @tactics.assume_tac(x813)
    fn(x815 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s814(x815)
    }
  })
  let t807 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t804 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ z : Cart[Real, 2], (Q : (Cart[Real, 2]) -> Bool)(z) → (P : (Cart[Real, 2]) -> Bool)(z)) → DISJOINT((t : (Cart[Real, 2]) -> Bool), {(z : Cart[Real, 2]) | P(cexp(z))}) → DISJOINT(IMAGE(cexp, t), {(z : Cart[Real, 2]) | Q(z)})")))
  let t805 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @iter.iter_pointless(), @sets.image_o()])), t804)
  let t806 = @list.List([@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → IN(x, (t : (_) -> Bool))) → DISJOINT((u : (_) -> Bool), t) → DISJOINT(u, s)"))), t805])
  let t803 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t802 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t808 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (s' : (_) -> Bool)) && SUBSET((t : (_) -> Bool), (t' : (_) -> Bool)) → SUBSET(UNION(s, t), UNION(s', t'))"))), @tactics.conj_tac), t802), t803), t806), t807), @calc_rat.real_arith_tac)
  let t801 = @simp.asm_simp_tac(@list.List([@topology.connected_continuous_image(), continuous_on_iter_cexp()]))
  let t800 = @simp.asm_rewrite_tac(@list.List([@topology.frontier_complement()]))
  let t797 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.connected_inter_frontier()))
  let t799 = @tactics.disch_then(fn(x798 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x794 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s795 = @tactics.mp_tac(x794)
      fn(x796 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s795(x796)
      }
    })(t797(x798))
  })
  let t793 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!(!(INTER((s : (_) -> Bool), DIFF(UNIV, (t : (_) -> Bool))) == {}) && !(DIFF(s, DIFF(UNIV, t)) == {})) → SUBSET(s, t) || DISJOINT(s, t)")))
  let t809 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.gen_tac), t793), t799), t800), t801), t808])
  let t792 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("((∀ n : _, SUBSET((f : (_, _) -> Bool)(n), (s : (_) -> Bool)) || DISJOINT(f(n), s)) && (∀ n : _, SUBSET(f(n), (t : (_) -> Bool)) || DISJOINT(f(n), t))) && SUBSET(UNION({(n : _) | DISJOINT(f(n), s)}, {(n : _) | DISJOINT(f(n), t)}), (u : (_) -> Bool)) → SUBSET({(n : _) | DISJOINT(f(n), INTER(s, t))}, u)")))
  let t791 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})"))]))
  let t810 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("w"), t791), t792), @tactics.conj_tac), t809)
  let t790 = @sets.set_tac(@list.List([]))
  let t789 = @simp.asm_simp_tac(@list.List([lemma_4(), @sets.finite_image()]))
  let t788 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((n : Num) => n - 1, {(n : Num) | DISJOINT(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), {(z : Cart[Real, 2]) | abs(Im(z)) <= pi / real_of_num(3)})})"))
  let t787 = @tactics.match_mp_tac(@sets.finite_subset())
  let t786 = @simp.gen_rewrite_tac(fn(x785 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x781 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x777 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x773 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(x767 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s768 = @equal.rand_conv(x767)
            fn(x769 : @kernel.Term) -> @kernel.Thm raise {
              s768(x769)
            }
          })((fn(x770 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s771 = @equal.rand_conv(x770)
            fn(x772 : @kernel.Term) -> @kernel.Thm raise {
              s771(x772)
            }
          })(x773))
        })((fn(x774 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s775 = @equal.abs_conv(x774)
          fn(x776 : @kernel.Term) -> @kernel.Thm raise {
            s775(x776)
          }
        })(x777))
      })((fn(x778 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s779 = @equal.binder_conv(x778)
        fn(x780 : @kernel.Term) -> @kernel.Thm raise {
          s779(x780)
        }
      })(x781))
    })((fn(x782 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s783 = @equal.rand_conv(x782)
      fn(x784 : @kernel.Term) -> @kernel.Thm raise {
        s783(x784)
      }
    })(x785))
  }, @list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) == n + 1 - 1"))]))
  let t811 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.finite_union(), lemma_4()])), t786), t787), t788), t789), t790), t810])
  let t766 = @tactics.exists_tac(@term_syntax.parse_term("UNION({(n : Num) | DISJOINT(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), {(z : Cart[Real, 2]) | abs(Im(z)) <= pi / real_of_num(3)})}, {(n : Num) | DISJOINT(IMAGE(ITER(n + 1, cexp), v), {(z : Cart[Real, 2]) | abs(Im(z)) <= pi / real_of_num(3)})})"))
  let t812 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t766), @tactics.conj_tac), t811), @tactics.all_tac])
  let t765 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(n : Num) | DISJOINT(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), (w : (Cart[Real, 2]) -> Bool))})"), fn(x762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s763 = @tactics.assume_tac(x762)
    fn(x764 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s763(x764)
    }
  })
  let t760 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t759 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@sets.subset()]))(@topology.closure_subset()))
  let t758 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t757 = @simp.rewrite_tac(@list.List([@topology.closed_closure(), @transcendentals.continuous_on_cexp()]))
  let t756 = @tactics.match_mp_tac(@topology.forall_in_closure())
  let t755 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image()]))
  let t754 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET(IMAGE((f : (_) -> _), (s : (_) -> Bool)), (t : (_) -> Bool)) && SUBSET(IMAGE(f, (u : (_) -> Bool)), (v : (_) -> Bool)) → SUBSET(IMAGE(f, INTER(s, u)), INTER(t, v))")))
  let t753 = @simp.rewrite_tac(@list.List([@topology.frontier_closures(), @real.real_not_le(), @sets.set_rule(@term_syntax.parse_term("DIFF(UNIV, {(x : _) | (P : (_) -> Bool)(x)}) == {(x : _) | !P(x)}"))]))
  let t752 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET(IMAGE((f : (_) -> _), (u : (_) -> Bool)), (t : (_) -> Bool)) → INTER(IMAGE(f, (s : (_) -> Bool)), t) == {} → INTER(s, u) == {}")))
  let t751 = @simp.rewrite_tac(@list.List([@iter.iter_pointless(), @sets.image_o()]))
  let t747 = @term_syntax.parse_term("SUC((n : Num))")
  let t750 = @tactics.first_x_assum(fn(x749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x744 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s745 = @tactics.mp_tac(x744)
      fn(x746 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s745(x746)
      }
    })(((x748 : @kernel.Thm) => @bool.spec(t747, x748))(x749))
  })
  let t761 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t750), t751), t752), t753), t754), @tactics.conj_tac), t755), t756), t757), @tactics.gen_tac), t758), @tactics.disch_tac), t759), t760), @tactics.all_tac])
  let t743 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, INTER(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), frontier({(z : Cart[Real, 2]) | abs(Im(cexp(z))) <= real_of_num(2) * pi})) == {}"), fn(x740 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s741 = @tactics.assume_tac(x740)
    fn(x742 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s741(x742)
    }
  })
  let t738 = @simp.rewrite_tac(@list.List([@transcendentals.sin_neg(), @transcendentals.sin_npi(), @calc_int.real_mul_rzero(), @calc_int.real_neg_0()]))
  let t734 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) == (a : Real) → x == a || x == -a")))
  let t735 = @tactics.disj_cases_then(fn(x731 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s732 = @tactics.subst1_tac(x731)
    fn(x733 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s732(x733)
    }
  })
  let t737 = @tactics.disch_then(fn(x736 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t735(t734(x736))
  })
  let t730 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @complexes.real(), @transcendentals.im_cexp()]))
  let t729 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (t : (_) -> Bool)) → real((f : (_) -> Cart[Real, 2])(x))) → INTER(IMAGE(f, (s : (_) -> Bool)), real) == {} → INTER(s, t) == {}")))
  let t728 = @simp.rewrite_tac(@list.List([@iter.iter_pointless(), @sets.image_o()]))
  let t724 = @term_syntax.parse_term("SUC((n : Num))")
  let t727 = @tactics.first_x_assum(fn(x726 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x721 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s722 = @tactics.mp_tac(x721)
      fn(x723 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s722(x723)
      }
    })(((x725 : @kernel.Thm) => @bool.spec(t724, x725))(x726))
  })
  let t720 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t719 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.im_def())]))
  let t739 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.im_def(), @convex.frontier_strip_component_le()])), t719), t720), t727), t728), t729), t730), @tactics.gen_tac), t737), t738), @tactics.all_tac])
  let t718 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, INTER(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), frontier({(z : Cart[Real, 2]) | abs(Im(z)) <= real_of_num(2) * pi})) == {}"), fn(x715 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s716 = @tactics.assume_tac(x715)
    fn(x717 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s716(x717)
    }
  })
  let t711 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t710 = @tactics.match_mp_tac(@real.sqrt_mono_le())
  let t709 = @tactics.subst1_tac(@equal.sym(@real.sqrt_1()))
  let t708 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_le()]))
  let t712 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t708), t709), t710), t711)
  let t706 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()])), @calc_rat.asm_real_arith_tac)
  let t705 = @tactics.mp_tac(@transcendentals.e_approx_32())
  let t704 = @tactics.match_mp_tac(@real.real_pow_le2())
  let t707 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.real_exp_n()])), t704), t705), @calc_rat.real_arith_tac), t706])
  let t703 = @term_syntax.parse_term("exp(real_of_num(4) * real_of_num(1))")
  let t713 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.trans_tac(@realax.real_le_trans())(t703), @tactics.conj_tac), t707), t712])
  let t702 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (x : Real) && x * real_of_num(1) <= x * (s : Real) → a <= x * s")))
  let t701 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_approx_32()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t700 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("pi < real_of_num(4) && pow(real_of_num(2), 4) <= (x : Real) * (y : Real) → real_of_num(2) * pi < x * (y / real_of_num(2))")))
  let t698 = @simp.simp_tac(@list.List([@real.real_abs_refl(), @real.real_le_div(), @real.sqrt_pos_le(), @realarith.real_pos()]))
  let t697 = @simp.rewrite_tac(@list.List([@transcendentals.sin_neg(), @transcendentals.sin_pi3(), @calc_int.real_abs_neg()]))
  let t694 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) == (a : Real) → x == a || x == -a")))
  let t695 = @tactics.disj_cases_then(fn(x691 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s692 = @tactics.subst1_tac(x691)
    fn(x693 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s692(x693)
    }
  })
  let t699 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x696 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t695(t694(x696))
  }), t697), t698), @tactics.all_tac])
  let t690 = @tactics.subgoal_then(@term_syntax.parse_term("abs(sin(Im((z : Cart[Real, 2])))) == sqrt(real_of_num(3)) / real_of_num(2)"), fn(x687 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s688 = @tactics.subst1_tac(x687)
    fn(x689 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s688(x689)
    }
  })
  let t686 = @simp.rewrite_tac(@list.List([@real.real_not_le(), @real.real_abs_mul(), @transcendentals.real_abs_exp()]))
  let t685 = @tactics.disch_then(fn(x684 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x681 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s682 = @tactics.mp_tac(x681)
      fn(x683 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s682(x683)
      }
    })(@bool.conjunct2(x684))
  })
  let t680 = @simp.rewrite_tac(@list.List([@transcendentals.im_cexp(), @realax.real_gt()]))
  let t679 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t678 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t677 = @tactics.map_every(fn(x674 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s675 = @simp.expand_tac(x674)
    fn(x676 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s675(x676)
    }
  }, @list.List(["h", "w"]))
  let t673 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) && IN(x, (u : (_) -> Bool)) → !IN(x, (t : (_) -> Bool))) → DISJOINT(s, INTER(t, u))")))
  let t672 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.im_def())]))
  let t671 = @simp.rewrite_tac(@list.List([@complexes.im_def(), @convex.frontier_strip_component_le()]))
  let t714 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("s"), t671), t672), t673), t677), t678), t679), t680), @tactics.strip_tac), t685), t686), t690), t699), t700), @tactics.conj_tac), t701), t702), @tactics.conj_tac), t713), @tactics.all_tac])
  let t670 = @tactics.subgoal_then(@term_syntax.parse_term("DISJOINT(frontier((s : (Cart[Real, 2]) -> Bool)), INTER((w : (Cart[Real, 2]) -> Bool), (h : (Cart[Real, 2]) -> Bool)))"), fn(x667 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s668 = @tactics.assume_tac(x667)
    fn(x669 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s668(x669)
    }
  })
  let t664 = @term_syntax.parse_term("(w : (Cart[Real, 2]) -> Bool) == {(z : Cart[Real, 2]) | abs(Im(z)) <= real_of_num(2) * pi && abs(Im(cexp(z))) <= real_of_num(2) * pi}")
  let t665 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool) == {(z : Cart[Real, 2]) | abs(Im(z)) <= pi / real_of_num(3)}")
  let t666 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(h : (Cart[Real, 2]) -> Bool) == {(z : Cart[Real, 2]) | Re(z) > real_of_num(4)}"), t665, t664]))
  let t663 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.not_forall_thm())]))
  let t948 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t663), @tactics.disch_tac), t666), t670), t714), t718), t739), t743), t761), t765), t812), t816), t845), t846), t857), t861), t872), t873), t874), t875), t876), @tactics.strip_tac), t877), @tactics.disch_tac), t879), t880), @tactics.conj_tac), t881), t882), @tactics.disch_tac), t886), t913), t917), t918), @nums.induct_tac), t919), t920), t921), @tactics.conj_tac), t922), t923), @tactics.conj_tac), t947)
  lemma_5_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 2]) -> Bool, !(v == {}) && open(v) && connected(v) && INFINITE({(n : Num) | SUBSET(IMAGE(ITER(n, cexp), v), {(z : Cart[Real, 2]) | Re(z) > real_of_num(4)})}) → (∃ n : Num, !(INTER(IMAGE(ITER(n, cexp), v), real) == {}))"), t948))
}

///|
let lemma_5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_5")

///|
/// `LEMMA_5`
pub fn lemma_5() -> @kernel.Thm {
  lemma_5_c.get()
}

///|
/// LEMMA_6
fn step_14() -> Unit raise {
  let t970 = @simp.rewrite_tac(@list.List([@transcendentals.norm_cexp(), @transcendentals.real_exp_mono_le()]))
  let t969 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @canal.complex_in_cball_0(), @realax.real_gt(), @realarith.real_not_lt()]))
  let t966 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("INTER(IMAGE((f : (_) -> _), (s : (_) -> Bool)), (t : (_) -> Bool)) == {} → (∀ x : _, !IN(x, (u : (_) -> Bool)) → IN(f(x), t)) → SUBSET(s, u)")))
  let t968 = @tactics.first_x_assum(fn(x967 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t966(x967))
  })
  let t965 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@iter.iter_pointless(), @sets.image_o()])))
  let t964 = @simp.asm_rewrite_tac(@list.List([@arith.add1(), @sets.in_elim_thm()]))
  let t963 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t962 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t961 = @tactics.disch_then(fn(x960 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t959 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t958 = @simp.rewrite_tac(@list.List([]))
  let t957 = @tactics.match_mp_tac(@nums.num_induction())
  let t956 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.in_elim_thm()]))
  let t955 = @simp.gen_rewrite_tac(fn(x954 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x954
  }, @list.List([@sets.subset()]))
  let t953 = @simp.asm_simp_tac(@list.List([@sets.finite_insert(), @sets.finite_image()]))
  let t952 = @tactics.exists_tac(@term_syntax.parse_term("INSERT(0, IMAGE((n : Num) => n + 1, {(n : Num) | SUBSET(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), {(z : Cart[Real, 2]) | Re(z) > real_of_num(4)})}))"))
  let t951 = @tactics.match_mp_tac(@sets.finite_subset())
  let t950 = @simp.asm_rewrite_tac(@list.List([@sets.infinite()]))
  let t949 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(v : (Cart[Real, 2]) -> Bool)"), lemma_5()))
  let t971 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t949), t950), @tactics.disch_tac), t951), t952), t953), t955), t956), t957), t958), t959), t961), @tactics.disch_tac), @tactics.disj2_tac), t962), t963), t964), t965), t968), t969), t970)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 2]) -> Bool, !(v == {}) && open(v) && connected(v) && (∀ n : Num, INTER(IMAGE(ITER(n, cexp), v), real) == {}) → FINITE({(n : Num) | INTER(IMAGE(ITER(n, cexp), v), cball((Cx(real_of_num(0)), exp(real_of_num(4))))) == {}})"), t971)
  let t1288 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.in_ball()])))
  let t1287 = @list.List([@int.asm_arith_tac, @simp.rewrite_tac(@list.List([@topology.in_cball()]))])
  let t1286 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1285 = @simp.rewrite_tac(@list.List([@vectors.dist()]))
  let t1284 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1283 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t1282 = @simp.rewrite_tac(@list.List([@topology.in_ball()]))
  let t1279 = @simp.gen_rewrite_rule(fn(x1278 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1278
  }, @list.List([@sets.subset()]))
  let t1281 = @tactics.first_x_assum(fn(x1280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1279(x1280))
  })
  let t1276 = @equal.gsym(@iter.iter_add())
  let t1277 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@arith.add_sym()]))(t1276)]))
  let t1275 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t1274 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @arith.le_0()]))
  let t1273 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1272 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), @sets.set_rule(@term_syntax.parse_term("DISJOINT((s : (_) -> Bool), (t : (_) -> Bool)) == (∀ x : _, IN(x, s) → IN(x, DIFF(UNIV, t)))"))]))
  let t1289 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @sets.in_univ(), @sets.in_elim_thm(), @sets.in_diff()])), t1272), t1273), t1274), @tactics.disch_tac), t1275), @tactics.disch_tac), t1277), t1281), t1282), t1283), t1284), t1285), t1286), @tactics.conj_tac), t1287), t1288), @calc_rat.asm_real_arith_tac)
  let t1271 = @meson.asm_meson_tac(@list.List([@arith.lt_refl()]))
  let t1270 = @simp.rewrite_tac(@list.List([@arith.eq_add_rcancel()]))
  let t1269 = @tactics.match_mp_tac(@arith.wlog_lt())
  let t1268 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @iterate.in_numseg(), @sets.in_diff(), @arith.le_0(), @arith.not_le()]))
  let t1267 = @simp.simp_tac(@list.List([@sets.infinite_diff_finite(), @sets.num_infinite(), @iterate.finite_numseg()]))
  let t1290 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.infinite_image()), t1267), t1268), t1269), t1270), t1271), t1289])
  let t1266 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((n : Num) => (r : (Num) -> Num)(n) + (k : Num), DIFF(UNIV, op_dot_dot(0, (N : Num))))"))
  let t1291 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.infinite_superset()), t1266), @tactics.conj_tac), t1290)
  let t1263 = @list.List([@calc_rat.asm_real_arith_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@sets.infinite())]))])
  let t1262 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t1261 = @simp.asm_rewrite_tac(@list.List([@topology.open_ball(), @convex.connected_ball(), @topology.ball_eq_empty()]))
  let t1264 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("ball(((w : Cart[Real, 2]), min((b : Real), (c : Real))))"), lemma_4())), t1261), t1262), @tactics.conj_tac), t1263)
  let t1258 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1259 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.subset_balls(), @vectors.dist_refl()])), @calc_rat.real_arith_tac), t1258])
  let t1257 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(ball(((w : Cart[Real, 2]), min((b : Real), (c : Real)))), ball((w, c)))"), fn(x1254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1255 = @tactics.mp_tac(x1254)
    fn(x1256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1255(x1256)
    }
  })
  let t1260 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac, @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.not_exists_thm()])), t1257), t1259)])
  let t1253 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1252 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t1251 = @simp.asm_rewrite_tac(@list.List([@topology.open_ball(), @convex.connected_ball(), @topology.ball_eq_empty()]))
  let t1265 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("ball(((w : Cart[Real, 2]), min((b : Real), (c : Real))))"), lemma_5())), t1251), t1252), t1253), t1260), t1264])
  let t1250 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c : Real)"))(@tactics.strip_assume_tac))
  let t1249 = @simp.asm_rewrite_tac(@list.List([]))
  let t1245 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1248 = @tactics.disch_then(fn(x1247 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1243 = @tactics.mp_tac(x1242)
      fn(x1244 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1243(x1244)
      }
    })(((x1246 : @kernel.Thm) => @bool.spec(t1245, x1246))(x1247))
  })
  let t1239 = @simp.gen_rewrite_rule(fn(x1238 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1238
  }, @list.List([@topology.open_contains_ball()]))
  let t1241 = @tactics.first_x_assum(fn(x1240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1236 = @tactics.mp_tac(x1235)
      fn(x1237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1236(x1237)
      }
    })(t1239(x1240))
  })
  let t1233 = @term_syntax.parse_term("(N : Num)")
  let t1234 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(b : Real)"), t1233]))
  let t1232 = @simp.asm_rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1228 = @term_syntax.parse_term("(d : Real)")
  let t1231 = @tactics.first_x_assum(fn(x1230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1226 = @tactics.mp_tac(x1225)
      fn(x1227 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1226(x1227)
      }
    })(((x1229 : @kernel.Thm) => @bool.spec(t1228, x1229))(x1230))
  })
  let t1224 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t1223 = @simp.asm_rewrite_tac(@list.List([]))
  let t1218 = @term_syntax.parse_term("(e : Real)")
  let t1219 = @list.List([@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]))"), t1218])
  let t1222 = @tactics.disch_then(fn(x1221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1216 = @tactics.mp_tac(x1215)
      fn(x1217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1216(x1217)
      }
    })(((x1220 : @kernel.Thm) => @bool.specl(t1219, x1220))(x1221))
  })
  let t1214 = @simp.rewrite_tac(@list.List([@topology.continuous_on(), @sets.in_univ()]))
  let t1212 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t1213 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(k : Num)"), t1212]), continuous_on_iter_cexp()))
  let t1211 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(e : Real)"))(@tactics.strip_assume_tac))
  let t1209 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.closed()), @complexes.im_def(), @convex.closed_strip_component_le()]))
  let t1208 = @simp.expand_tac("s")
  let t1207 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @topology.open_halfspace_component_gt()]))
  let t1210 = @tactics.thenl(@tactics.ants_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t1207), t1208), t1209), @tactics.all_tac]))
  let t1204 = @drule.match_mp(@meson.meson(@list.List([@topology.open_contains_ball()]), @term_syntax.parse_term("IN(ITER((n : Num), (f : (Cart[Real, _]) -> Cart[Real, _]), (x : Cart[Real, _])), (s : (Cart[Real, _]) -> Bool)) → open(s) → (∃ e : Real, real_of_num(0) < e && SUBSET(ball((ITER(n, f, x), e)), s))")))
  let t1206 = @tactics.first_assum(fn(x1205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1201 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1202 = @tactics.mp_tac(x1201)
      fn(x1203 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1202(x1203)
      }
    })(t1204(x1205))
  })
  let t1198 = @simp.rewrite_rule(@list.List([@sets.in_union()]))
  let t1200 = @tactics.first_x_assum(fn(x1199 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t1198(x1199))
  })
  let t1196 = @simp.asm_rewrite_tac(@list.List([@transcendentals.re_cexp(), @transcendentals.cos_0(), @realarith.real_mul_rid(), @transcendentals.real_exp_le_x()]))
  let t1195 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexes.real()])))
  let t1194 = @simp.asm_rewrite_tac(@list.List([]))
  let t1193 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(g : Real) + (n : Real) <= Re((x : Cart[Real, 2])) && real_of_num(1) + Re(x) <= Re(cexp(x)) → g + (n + real_of_num(1)) <= Re(cexp(x))")))
  let t1192 = @simp.asm_simp_tac(@list.List([@transcendentals.real_exp(), @equal.gsym(@real.real_of_num_suc())]))
  let t1191 = @simp.asm_rewrite_tac(@list.List([@iter.iter(), @calc_int.real_add_rid(), @realax.real_le_refl()]))
  let t1189 = @term_syntax.parse_term("(n : Num)")
  let t1190 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t1189)
  let t1188 = @tactics.exists_tac(@term_syntax.parse_term("real(ITER((n : Num), cexp, (g : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]))))"))
  let t1187 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("∀ p : Bool, p && (q : Bool) → q")))
  let t1186 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (n : Real) <= (y : Real) → real_of_num(5) - x <= n → y > real_of_num(4)")))
  let t1185 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1184 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1183 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(5) - Re((g : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2])))"), @real.real_arch_simple()))
  let t1182 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1181 = @simp.expand_tac("h")
  let t1179 = @simp.rewrite_tac(@list.List([@realax.real_gt(), @real.real_not_le(), @sets.in_elim_thm()]))
  let t1176 = @drule.match_mp(lemma_2b())
  let t1178 = @tactics.first_assum(fn(x1177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1174 = @tactics.mp_tac(x1173)
      fn(x1175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1174(x1175)
      }
    })(t1176(x1177))
  })
  let t1180 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @simp.expand_tac("s")), t1178), t1179)])
  let t1172 = @class.asm_cases_tac(@term_syntax.parse_term("real((g : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2])))"))
  let t1197 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_diff(), @sets.in_univ(), @theorems.exists_or_thm()])), t1172), t1180), @tactics.disj1_tac), t1181), t1182), t1183), t1184), t1185), t1186), t1187), t1188), t1190), @nums.induct_tac), t1191), t1192), t1193), t1194), t1195), t1196), @tactics.all_tac])
  let t1171 = @tactics.subgoal_then(@term_syntax.parse_term("∃ k : Num, IN(ITER(k, cexp, (g : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]))), UNION((h : (Cart[Real, 2]) -> Bool), DIFF(UNIV, (s : (Cart[Real, 2]) -> Bool))))"), @tactics.strip_assume_tac)
  let t1170 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1169 = @simp.asm_rewrite_tac(@list.List([]))
  let t1165 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1168 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x1167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1162 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1163 = @tactics.mp_tac(x1162)
      fn(x1164 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1163(x1164)
      }
    })(((x1166 : @kernel.Thm) => @bool.spec(t1165, x1166))(x1167))
  }))
  let t1159 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1161 = @tactics.disch_then((x1160 : @kernel.Thm) => @tactics.x_choose_tac(t1159, x1160))
  let t1157 = @simp.gen_rewrite_rule(fn(x1156 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1156
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t1292 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1154 = @tactics.mp_tac(x1153)
      fn(x1155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1154(x1155)
      }
    })(t1157(x1158))
  }), t1161), t1168), t1169), t1170), t1171), t1197), t1200), t1206), t1210), t1211), t1213), t1214), t1222), t1223), t1224), t1231), t1232), t1234), @tactics.strip_tac), t1241), t1248), t1249), t1250), t1265), t1291)
  let t1150 = @simp.once_rewrite_tac(@list.List([@vectors.dist_sym()]))
  let t1149 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1148 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("distance(((y : Cart[Real, 2]), (x : Cart[Real, 2]))) < (e : Real) / real_of_num(2) → norm((z : Cart[Real, 2]) - y) < e / real_of_num(2) → norm(z - x) < e")))
  let t1147 = @tactics.disch_then(fn(x1144 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1144
    let t1146 = @simp.asm_rewrite_tac(@list.List([]))
    @tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th_1)), t1146)
  })
  let t1143 = @simp.rewrite_tac(@list.List([@real.real_le_min()]))
  let t1142 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t1141 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1140 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1139 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1138 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t1137 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1136 = @simp.asm_rewrite_tac(@list.List([@topology.compact_cball(), @misc.real_half(), @arith.ge(), @real.real_lt_min(), @topology.in_cball()]))
  let t1131 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1132 = @list.List([@term_syntax.parse_term("cball(((w : Cart[Real, 2]), (b : Real)))"), t1131])
  let t1135 = @tactics.first_x_assum(fn(x1134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1129 = @tactics.mp_tac(x1128)
      fn(x1130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1129(x1130)
      }
    })(((x1133 : @kernel.Thm) => @bool.specl(t1132, x1133))(x1134))
  })
  let t1127 = @tactics.exists_tac(@term_syntax.parse_term("min((b : Real), (d : Real) / real_of_num(2))"))
  let t1126 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : Real)"))(@tactics.strip_assume_tac))
  let t1125 = @simp.asm_rewrite_tac(@list.List([]))
  let t1121 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1124 = @tactics.disch_then(fn(x1123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1119 = @tactics.mp_tac(x1118)
      fn(x1120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1119(x1120)
      }
    })(((x1122 : @kernel.Thm) => @bool.spec(t1121, x1122))(x1123))
  })
  let t1115 = @simp.gen_rewrite_rule(fn(x1114 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1114
  }, @list.List([@topology.open_contains_cball()]))
  let t1117 = @tactics.first_x_assum(fn(x1116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1112 = @tactics.mp_tac(x1111)
      fn(x1113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1112(x1113)
      }
    })(t1115(x1116))
  })
  let t1110 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t1109 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t1105 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t1108 = @tactics.disch_then(fn(x1107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1103 = @tactics.mp_tac(x1102)
      fn(x1104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1103(x1104)
      }
    })(((x1106 : @kernel.Thm) => @bool.spec(t1105, x1106))(x1107))
  })
  let t1100 = @simp.rewrite_tac(@list.List([@topology.continuous_at_v1()]))
  let t1101 = @list.List([@meson.asm_meson_tac(@list.List([@topology.continuous_on_eq_continuous_at(), @canal.holomorphic_on_imp_continuous_on()])), t1100])
  let t1099 = @tactics.subgoal_then(@term_syntax.parse_term("continuous((g : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2])))"), fn(x1096 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1097 = @tactics.mp_tac(x1096)
    fn(x1098 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1097(x1098)
    }
  })
  let t1094 = @term_syntax.parse_term("(e : Real)")
  let t1095 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(w : Cart[Real, 2])"), t1094]))
  let t1093 = @simp.asm_rewrite_tac(@list.List([]))
  let t1092 = @tactics.x_gen_tac(@term_syntax.parse_term("(g : (Cart[Real, 2]) -> Cart[Real, 2])"))
  let t1151 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t1092), @tactics.strip_tac), t1093), t1095), @tactics.strip_tac), t1099), t1101), t1108), t1109), t1110), t1117), t1124), t1125), t1126), t1127), t1135), t1136), t1137), t1138), t1139), t1140), t1141), t1142), t1143), t1147), t1148), t1149), t1150), @calc_rat.asm_real_arith_tac)
  let t1089 = @simp.simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t1088 = @simp.rewrite_tac(@list.List([@theorems.forall_unwind_thm2(), @real.real_not_le()]))
  let t1087 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!(((p : Bool) && (q : Bool)) && (r : Bool)) == (p → q → !r)"))]))
  let t1086 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t1085 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1084 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1083 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm(), @class.not_exists_thm()]))
  let t1082 = @simp.rewrite_tac(@list.List([@vectors.dist(), @complexes.complex_sub_lzero(), @vectors.norm_neg()]))
  let t1081 = @simp.rewrite_tac(@list.List([@topology.in_ball(), @topology.in_cball(), @class.contrapos_thm()]))
  let t1080 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.in_image(), @sets.not_in_empty()]))
  let t1079 = @simp.expand_tac("d")
  let t1078 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(M : Num) + ((N : Num) + 1) >= N && (M + (N + 1) <= (r : (Num) -> Num)(M + (N + 1)) → !(r(M + (N + 1)) <= M))"))]))
  let t1075 = @drule.match_mp(@misc.monotone_bigger())
  let t1077 = @tactics.first_assum(fn(x1076 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1072 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1073 = @tactics.assume_tac(x1072)
      fn(x1074 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1073(x1074)
      }
    })(t1075(x1076))
  })
  let t1071 = @tactics.disch_then(fn(x1062 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1062
    let t1070 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(r : (Num) -> Num)((M : Num) + ((N : Num) + 1))"), th))
    let t1067 = @term_syntax.parse_term("(M : Num) + ((N : Num) + 1)")
    @tactics.then_tac(@tactics.disch_then(fn(x1069 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1064 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1065 = @tactics.mp_tac(x1064)
        fn(x1066 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1065(x1066)
        }
      })(((x1068 : @kernel.Thm) => @bool.spec(t1067, x1068))(x1069))
    }), t1070)
  })
  let t1061 = @tactics.x_gen_tac(@term_syntax.parse_term("(M : Num)"))
  let t1060 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), @sets.forall_in_gspec()]))
  let t1058 = @drule.match_mp(@misc.upper_bound_finite_set())
  let t1055 = @term_syntax.parse_term("(n : Num) => n")
  let t1090 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1059 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1057 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1052 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1053 = @tactics.mp_tac(x1052)
        fn(x1054 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1053(x1054)
        }
      })(((x1056 : @kernel.Thm) => @bool.ispec(t1055, x1056))(x1057))
    })(t1058(x1059))
  }), t1060), t1061), t1071), t1077), t1078), t1079), t1080), t1081), t1082), t1083), t1084), t1085), t1086), t1087), t1088), t1089)
  let t1051 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1050 = @term_syntax.parse_term("(b : Real)")
  let t1091 = @list.List([@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(w : Cart[Real, 2])"), t1050]), @topology.ball_subset_cball())), t1051), t1090])
  let t1049 = @simp.asm_rewrite_tac(@list.List([@real.real_not_le()]))
  let t1048 = @simp.asm_rewrite_tac(@list.List([@topology.open_ball(), @convex.connected_ball(), @topology.ball_eq_empty()]))
  let t1047 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("ball(((w : Cart[Real, 2]), (b : Real)))"), lemma))
  let t1046 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t1045 = @simp.asm_rewrite_tac(@list.List([@topology.compact_cball(), @class.not_exists_thm()]))
  let t1040 = @term_syntax.parse_term("exp(real_of_num(4))")
  let t1041 = @list.List([@term_syntax.parse_term("cball(((w : Cart[Real, 2]), (b : Real)))"), t1040])
  let t1044 = @tactics.disch_then(fn(x1043 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1037 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1038 = @tactics.mp_tac(x1037)
      fn(x1039 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1038(x1039)
      }
    })(((x1042 : @kernel.Thm) => @bool.specl(t1041, x1042))(x1043))
  })
  let t1036 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : Real)"))(@tactics.strip_assume_tac))
  let t1035 = @simp.asm_rewrite_tac(@list.List([]))
  let t1031 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1034 = @tactics.disch_then(fn(x1033 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1028 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1029 = @tactics.mp_tac(x1028)
      fn(x1030 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1029(x1030)
      }
    })(((x1032 : @kernel.Thm) => @bool.spec(t1031, x1032))(x1033))
  })
  let t1025 = @simp.gen_rewrite_rule(fn(x1024 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1024
  }, @list.List([@topology.open_contains_cball()]))
  let t1027 = @tactics.first_x_assum(fn(x1026 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1021 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1022 = @tactics.mp_tac(x1021)
      fn(x1023 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1022(x1023)
      }
    })(t1025(x1026))
  })
  let t1018 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1020 = @tactics.disch_then((x1019 : @kernel.Thm) => @tactics.x_choose_tac(t1018, x1019))
  let t1015 = @simp.gen_rewrite_rule(fn(x1014 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1014
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t1017 = @tactics.first_x_assum(fn(x1016 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1011 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1012 = @tactics.mp_tac(x1011)
      fn(x1013 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1012(x1013)
      }
    })(t1015(x1016))
  })
  let t1152 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(q : Bool) → (p : Bool) && q → (r : Bool)"))), t1017), t1020), t1027), t1034), t1035), t1036), t1044), t1045), t1046), t1047), t1048), t1049), @tactics.ants_tac), t1091), t1151])
  let t1010 = @tactics.disch_then(@tactics.disj_cases_then(fn(x1007 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1008 = @tactics.mp_tac(x1007)
    fn(x1009 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1008(x1009)
    }
  }))
  let t1004 = @simp.asm_rewrite_tac(@list.List([]))
  let t1003 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x997 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s998 = @tactics.assume_tac(x997)
    fn(x999 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s998(x999)
    }
  }, fn(x1000 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1001 = @tactics.mp_tac(x1000)
    fn(x1002 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1001(x1002)
    }
  }))
  let t996 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : (Num) -> Num)"))
  let t995 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1005 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()])), t995), t996), t1003), t1004)
  let t994 = @simp.rewrite_tac(@list.List([@complexes.real_cx()]))
  let t993 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(P : (_) -> Bool)((a : _)) && P((b : _)) → INTER(IMAGE((f : (_) -> _), (s : (_) -> Bool)), P) == {} → (∀ x : _, IN(x, s) → !(f(x) == a) && !(f(x) == b))")))
  let t989 = @term_syntax.parse_term("(n : Num)")
  let t992 = @tactics.first_x_assum(fn(x991 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x986 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s987 = @tactics.mp_tac(x986)
      fn(x988 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s987(x988)
      }
    })(((x990 : @kernel.Thm) => @bool.spec(t989, x990))(x991))
  })
  let t985 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t984 = @simp.rewrite_tac(@list.List([holomorphic_on_iter_cexp()]))
  let t983 = @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))])
  let t982 = @simp.asm_rewrite_tac(@list.List([@sets.forall_in_gspec(), @sets.in_univ(), @class.not_imp()]))
  let t1006 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.cx_inj(), @realax.real_of_num_eq(), @calc_num.arith_eq()])), t982), @tactics.conj_tac), t983), t984), t985), t992), t993), t994), t1005])
  let t981 = @simp.asm_rewrite_tac(@list.List([@class.not_imp()]))
  let t977 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t978 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t979 = @term_syntax.parse_term("(v : (Cart[Real, 2]) -> Bool)")
  let t980 = @term_syntax.parse_term("{ITER((n : Num), cexp) | IN(n, UNIV)}")
  let t1293 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => ITER(n, cexp)"), t980, t979, t978, t977]), @cauchy.montel_omitting())), t981), @tactics.ants_tac), t1006), t1010), t1152), t1292])
  let t976 = @tactics.subgoal_then(@term_syntax.parse_term("∃ g : (Cart[Real, 2]) -> Cart[Real, 2], ∃ r : (Num) -> Num, holomorphic_on(g, (v : (Cart[Real, 2]) -> Bool)) && (∀ m : Num, ∀ n : Num, m < n → r(m) < r(n)) && (∀ x : Cart[Real, 2], IN(x, v) → op_minus_minus_gt((n : Num) => ITER(r(n), cexp, x), g(x), sequentially)) && (∀ x : Cart[Real, 2], ∀ e : Real, IN(x, v) && real_of_num(0) < e → (∃ d : Real, ∃ N : Num, real_of_num(0) < d && (∀ n : Num, ∀ y : Cart[Real, 2], N <= n && IN(y, cball((x, d))) → norm(ITER(r(n), cexp, y) - g(x)) < e)))"), @tactics.strip_assume_tac)
  let t974 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool) == {(z : Cart[Real, 2]) | abs(Im(z)) <= pi / real_of_num(3)}")
  let t975 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(h : (Cart[Real, 2]) -> Bool) == {(z : Cart[Real, 2]) | Re(z) > real_of_num(4)}"), t974]))
  let t973 = @simp.abbrev_tac(@term_syntax.parse_term("(d : (Cart[Real, 2]) -> Bool) == cball((Cx(real_of_num(0)), exp(real_of_num(4))))"))
  let t972 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1294 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@class.not_forall_thm())])), t972), t973), t975), t976), t1293)
  lemma_6_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 2]) -> Bool, !(v == {}) && open(v) && connected(v) → (∃ n : Num, !(INTER(IMAGE(ITER(n, cexp), v), real) == {}))"), t1294))
}

///|
let lemma_6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_6")

///|
/// `LEMMA_6`
pub fn lemma_6() -> @kernel.Thm {
  lemma_6_c.get()
}

///|
/// THEOREM
fn step_15() -> Unit raise {
  let t1789 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_le()]))
  let t1788 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_0(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) * -real_of_num(1) <= real_of_num(0)) == (real_of_num(0) <= x)"))]))
  let t1787 = @simp.rewrite_tac(@list.List([@transcendentals.cos_pi(), @equal.gsym(@transcendentals.real_exp_0()), @transcendentals.real_exp_mono_le()]))
  let t1786 = @tactics.disch_then(fn(x1783 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1784 = @tactics.subst1_tac(x1783)
    fn(x1785 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1784(x1785)
    }
  })
  let t1782 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@transcendentals.cos_abs())]))
  let t1781 = @simp.simp_tac(@list.List([@iter.iter(), @transcendentals.norm_cexp(), @transcendentals.re_cexp()]))
  let t1779 = @equal.gsym(@real.real_not_le())
  let t1780 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(N : Num) < (n : Num) → N <= SUC(SUC(n))")), t1779, @class.contrapos_thm()]))
  let t1778 = @tactics.disch_then(fn(x1773 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1773
    let t1776 = @term_syntax.parse_term("(x : Cart[Real, 2])")
    let t1777 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("SUC(SUC((n : Num)))"), t1776]), th_2))
    let t1775 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), @tactics.disch_tac), t1775), @tactics.disch_tac), t1777)
  })
  let t1772 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @arith.not_lt(), @sets.set_rule(@term_syntax.parse_term("(INTER(IMAGE((f : (_) -> _), (s : (_) -> Bool)), (t : (_) -> Bool)) == {}) == (∀ x : _, IN(x, s) → !IN(f(x), t))"))]))
  let t1771 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.not_lt()), @class.contrapos_thm()]))
  let t1770 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t1769 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1768 = @simp.rewrite_tac(@list.List([@sets.subset(), @arith.ge(), @iterate.in_numseg(), @arith.le_0(), @sets.in_elim_thm()]))
  let t1767 = @simp.rewrite_tac(@list.List([@iterate.finite_subset_numseg()]))
  let t1763 = @term_syntax.parse_term("real_of_num(1)")
  let t1766 = @tactics.first_x_assum(fn(x1765 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1760 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1761 = @tactics.mp_tac(x1760)
      fn(x1762 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1761(x1762)
      }
    })(((x1764 : @kernel.Thm) => @bool.spec(t1763, x1764))(x1765))
  })
  let t1758 = @simp.rewrite_tac(@list.List([@sets.infinite()]))
  let t1757 = @simp.rewrite_tac(@list.List([@topology.continuous_on_id()]))
  let t1756 = @tactics.match_mp_tac(@topology.continuous_on_lift_abs_component())
  let t1755 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @complexes.im_def()]))
  let t1754 = @simp.asm_simp_tac(@list.List([@topology.connected_continuous_image(), continuous_on_iter_cexp()]))
  let t1753 = @tactics.match_mp_tac(@topology.connected_continuous_image())
  let t1752 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.asm_real_arith_tac)])
  let t1751 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1750 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_()), @trivia.o_thm(), @vectors.lift_drop()]))
  let t1749 = @simp.gen_rewrite_tac(fn(x1748 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1742 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1743 = @equal.land_conv(x1742)
      fn(x1744 : @kernel.Term) -> @kernel.Thm raise {
        s1743(x1744)
      }
    })((fn(x1745 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1746 = @equal.rand_conv(x1745)
      fn(x1747 : @kernel.Term) -> @kernel.Thm raise {
        s1746(x1747)
      }
    })(x1748))
  }, @list.List([@sets.exists_in_image()]))
  let t1741 = @simp.asm_simp_tac(@list.List([@cart.dimindex_1(), @arith.le_refl(), @sets.fun_in_image()]))
  let t1736 = @term_syntax.parse_term("1")
  let t1737 = @term_syntax.parse_term("pi")
  let t1738 = @term_syntax.parse_term("o(lift, o(abs, Im), (b : Cart[Real, 2]))")
  let t1739 = @term_syntax.parse_term("o(lift, o(abs, Im), (a : Cart[Real, 2]))")
  let t1740 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("IMAGE(o(lift, o(abs, Im)), IMAGE(ITER((n : Num), cexp), (v : (Cart[Real, 2]) -> Bool)))"), t1739, t1738, t1737, t1736]), @topology.connected_ivt_component()))
  let t1734 = @tactics.x_choose_then(@term_syntax.parse_term("(a : Cart[Real, 2])"))(@tactics.strip_assume_tac)
  let t1735 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(b : Cart[Real, 2])"))(@tactics.strip_assume_tac), t1734))
  let t1733 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp(), @sets.in_inter(), @real.real_not_le(), @complexes.real(), @sets.in_elim_thm(), @sets.set_rule(@term_syntax.parse_term("IN((x : Cart[Real, 2]), real) == real(x)"))]))
  let t1732 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.subset(), @sets.disjoint(), @sets.in_elim_thm()]))
  let t1731 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1730 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1729 = @simp.gen_rewrite_tac(fn(x1728 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1728
  }, @list.List([@sets.subset()]))
  let t1726 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.infinite_superset()))
  let t1759 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1727 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1726(x1727))
  }), t1729), t1730), t1731), t1732), t1733), t1735), t1740), t1741), t1749), t1750), t1751), @tactics.conj_tac), t1752), t1753), t1754), t1755), t1756), t1757), t1758])
  let t1725 = @tactics.subgoal_then(@term_syntax.parse_term("INFINITE({(n : Num) | !(INTER(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), {(x : Cart[Real, 2]) | abs(Im(x)) == pi}) == {})})"), fn(x1722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1723 = @tactics.mp_tac(x1722)
    fn(x1724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1723(x1724)
    }
  })
  let t1720 = @sets.set_tac(@list.List([]))
  let t1719 = @simp.rewrite_tac(@list.List([@sets.image_o()]))
  let t1718 = @simp.asm_simp_tac(@list.List([@arith.lt_suc_le(), @arith.lt_imp_le(), @iter.iter_pointless()]))
  let t1717 = @tactics.disch_then(fn(x1713 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1713
    let t1716 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("SUC((k : Num))"), th_1))
    let t1715 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(k : Num)"), th_1))
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)")), @tactics.disch_tac), t1715), t1716)
  })
  let t1712 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @class.contrapos_thm(), @equal.gsym(@arith.not_lt())]))
  let t1711 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @arith.le_0()]))
  let t1710 = @simp.once_rewrite_tac(@list.List([@sets.subset()]))
  let t1709 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1708 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1707 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})")), @sets.subset_inter(), @iterate.finite_subset_numseg()]))
  let t1706 = @simp.expand_tac("w")
  let t1705 = @simp.rewrite_tac(@list.List([@sets.infinite(), @class.contrapos_thm()]))
  let t1704 = @tactics.undisch_tac(@term_syntax.parse_term("INFINITE({(n : Num) | !SUBSET(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), (w : (Cart[Real, 2]) -> Bool))})"))
  let t1703 = @simp.asm_rewrite_tac(@list.List([]))
  let t1702 = @tactics.match_mp_tac(@sets.infinite_diff_finite())
  let t1721 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && !(Q : (_) -> Bool)(x)} == DIFF({(x : _) | P(x)}, {(x : _) | Q(x)})"))])), t1702), t1703), t1704), t1705), t1706), t1707), t1708), t1709), t1710), t1711), t1712), t1717), t1718), t1719), t1720), @tactics.all_tac])
  let t1701 = @tactics.subgoal_then(@term_syntax.parse_term("INFINITE({(n : Num) | !SUBSET(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), {(z : Cart[Real, 2]) | abs(Im(z)) <= real_of_num(2) * pi}) && !DISJOINT(IMAGE(ITER(n, cexp), v), real)})"), fn(x1698 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1699 = @tactics.assume_tac(x1698)
    fn(x1700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1699(x1700)
    }
  })
  let t1694 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1693 = @tactics.match_mp_tac(@real.sqrt_mono_le())
  let t1692 = @tactics.subst1_tac(@equal.sym(@real.sqrt_1()))
  let t1691 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp_pos_le()]))
  let t1695 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t1691), t1692), t1693), t1694)
  let t1689 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.real_exp_mono_le()])), @calc_rat.asm_real_arith_tac)
  let t1688 = @tactics.mp_tac(@transcendentals.e_approx_32())
  let t1687 = @tactics.match_mp_tac(@real.real_pow_le2())
  let t1690 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.real_exp_n()])), t1687), t1688), @calc_rat.real_arith_tac), t1689])
  let t1686 = @term_syntax.parse_term("exp(real_of_num(4) * real_of_num(1))")
  let t1696 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.trans_tac(@realax.real_le_trans())(t1686), @tactics.conj_tac), t1690), t1695])
  let t1685 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) <= (x : Real) && x * real_of_num(1) <= x * (s : Real) → a <= x * s")))
  let t1684 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_approx_32()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1683 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("pi < real_of_num(4) && pow(real_of_num(2), 4) <= (x : Real) * (y : Real) → real_of_num(2) * pi < x * (y / real_of_num(2))")))
  let t1681 = @simp.simp_tac(@list.List([@real.real_abs_refl(), @real.real_le_div(), @real.sqrt_pos_le(), @realarith.real_pos()]))
  let t1680 = @simp.rewrite_tac(@list.List([@transcendentals.sin_neg(), @transcendentals.sin_pi3(), @calc_int.real_abs_neg()]))
  let t1677 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) == (a : Real) → x == a || x == -a")))
  let t1678 = @tactics.disj_cases_then(fn(x1674 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1675 = @tactics.subst1_tac(x1674)
    fn(x1676 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1675(x1676)
    }
  })
  let t1682 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1679 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t1678(t1677(x1679))
  }), t1680), t1681), @tactics.all_tac])
  let t1673 = @tactics.subgoal_then(@term_syntax.parse_term("abs(sin(Im((z : Cart[Real, 2])))) == sqrt(real_of_num(3)) / real_of_num(2)"), fn(x1670 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1671 = @tactics.subst1_tac(x1670)
    fn(x1672 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1671(x1672)
    }
  })
  let t1669 = @simp.rewrite_tac(@list.List([@real.real_not_le(), @real.real_abs_mul(), @transcendentals.real_abs_exp()]))
  let t1668 = @tactics.disch_then(fn(x1667 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1664 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1665 = @tactics.mp_tac(x1664)
      fn(x1666 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1665(x1666)
      }
    })(@bool.conjunct2(x1667))
  })
  let t1663 = @simp.rewrite_tac(@list.List([@transcendentals.im_cexp(), @realax.real_gt()]))
  let t1662 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1661 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1660 = @tactics.map_every(fn(x1657 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1658 = @simp.expand_tac(x1657)
    fn(x1659 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1658(x1659)
    }
  }, @list.List(["h", "w"]))
  let t1656 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) && IN(x, (u : (_) -> Bool)) → !IN(x, (t : (_) -> Bool))) → DISJOINT(s, INTER(t, u))")))
  let t1655 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.im_def())]))
  let t1654 = @simp.rewrite_tac(@list.List([@complexes.im_def(), @convex.frontier_strip_component_le()]))
  let t1653 = @simp.expand_tac("s")
  let t1652 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t1651 = @tactics.subgoal_then(@term_syntax.parse_term("DISJOINT(frontier((s : (Cart[Real, 2]) -> Bool)), INTER((w : (Cart[Real, 2]) -> Bool), (h : (Cart[Real, 2]) -> Bool)))"), fn(x1648 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1649 = @tactics.assume_tac(x1648)
    fn(x1650 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1649(x1650)
    }
  })
  let t1646 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1645 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t1644 = @simp.simp_tac(@list.List([@complexes.real(), @sets.in_elim_thm(), @sets.subset()]))
  let t1643 = @simp.expand_tac("s")
  let t1641 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("!DISJOINT((s : (Cart[Real, 2]) -> Bool), real) → SUBSET({(x : Cart[Real, 2]) | real(x)}, (t : (Cart[Real, 2]) -> Bool)) → !(INTER(s, t) == {})")))
  let t1647 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1642 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1641(x1642))
  }), t1643), t1644), t1645), @calc_rat.real_arith_tac), t1646, @tactics.all_tac])
  let t1640 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1639 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t1638 = @simp.asm_simp_tac(@list.List([@topology.connected_continuous_image(), continuous_on_iter_cexp()]))
  let t1636 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t1637 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("IMAGE(ITER((n : Num), cexp), (v : (Cart[Real, 2]) -> Bool))"), t1636]), @topology.connected_inter_frontier()))
  let t1635 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1634 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1633 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1632 = @simp.gen_rewrite_tac(fn(x1631 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1631
  }, @list.List([@sets.subset()]))
  let t1629 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.infinite_superset()))
  let t1697 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1630 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1629(x1630))
  }), t1632), t1633), t1634), t1635), t1637), t1638), t1639), t1640), t1647), t1651), t1652), t1653), t1654), t1655), t1656), t1660), t1661), t1662), t1663), @tactics.strip_tac), t1668), t1669), t1673), t1682), t1683), @tactics.conj_tac), t1684), t1685), @tactics.conj_tac), t1696), @tactics.all_tac])
  let t1628 = @tactics.subgoal_then(@term_syntax.parse_term("INFINITE({(n : Num) | !SUBSET(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), (w : (Cart[Real, 2]) -> Bool))})"), fn(x1625 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1626 = @tactics.assume_tac(x1625)
    fn(x1627 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1626(x1627)
    }
  })
  let t1621 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1619 = @equal.gsym(@realarith.real_not_lt())
  let t1620 = @simp.simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) + ((N : Num) + 1) <= N)")), @sets.image_o(), t1619]))
  let t1618 = @simp.once_rewrite_tac(@list.List([@iter.iter_add_pointless()]))
  let t1617 = @simp.rewrite_tac(@list.List([]))
  let t1613 = @term_syntax.parse_term("(n : Num) + ((N : Num) + 1)")
  let t1616 = @tactics.disch_then(fn(x1615 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1610 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1611 = @tactics.mp_tac(x1610)
      fn(x1612 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1611(x1612)
      }
    })(((x1614 : @kernel.Thm) => @bool.spec(t1613, x1614))(x1615))
  })
  let t1607 = @term_syntax.parse_term("(n : Num)")
  let t1609 = @tactics.disch_then((x1608 : @kernel.Thm) => @tactics.x_choose_tac(t1607, x1608))
  let t1606 = @simp.rewrite_tac(@list.List([@realax.real_gt(), @sets.in_elim_thm(), @sets.subset()]))
  let t1605 = @simp.expand_tac("s")
  let t1603 = @drule.match_mp(lemma_2b())
  let t1622 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1604 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1601 = @tactics.mp_tac(x1600)
      fn(x1602 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1601(x1602)
      }
    })(t1603(x1604))
  }), t1605), t1606), t1609), t1616), t1617), t1618), t1620), t1621)
  let t1599 = @meson.asm_meson_tac(@list.List([]))
  let t1598 = @simp.asm_rewrite_tac(@list.List([@canal.has_complex_derivative_const()]))
  let t1596 = @term_syntax.parse_term("IMAGE(ITER((n : Num), cexp), (v : (Cart[Real, 2]) -> Bool))")
  let t1597 = @tactics.map_every(fn(x1593 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1594 = @tactics.exists_tac(x1593)
    fn(x1595 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1594(x1595)
    }
  }, @list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => (c : Cart[Real, 2])"), t1596]))
  let t1592 = @tactics.match_mp_tac(@canal.has_complex_derivative_transform_within_open())
  let t1591 = @simp.rewrite_tac(@list.List([@transcendentals.has_complex_derivative_cexp()]))
  let t1589 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t1590 = @tactics.map_every(fn(x1586 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1587 = @tactics.exists_tac(x1586)
    fn(x1588 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1587(x1588)
    }
  }, @list.List([@term_syntax.parse_term("cexp"), t1589]))
  let t1585 = @tactics.match_mp_tac(@canal.complex_derivative_unique_at())
  let t1584 = @simp.rewrite_tac(@list.List([]))
  let t1583 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : Cart[Real, 2])"), @transcendentals.cexp_nz()))
  let t1582 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1581 = @tactics.subgoal_then(@term_syntax.parse_term("∃ x : Cart[Real, 2], IN(x, IMAGE(ITER((n : Num), cexp), (v : (Cart[Real, 2]) -> Bool)))"), @tactics.strip_assume_tac)
  let t1578 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t1580 = @tactics.disch_then((x1579 : @kernel.Thm) => @tactics.x_choose_tac(t1578, x1579))
  let t1577 = @simp.asm_simp_tac(@list.List([@topology.connected_continuous_image(), continuous_on_iter_cexp()]))
  let t1576 = @simp.asm_rewrite_tac(@list.List([@sets.subset_refl(), @transcendentals.holomorphic_on_cexp()]))
  let t1575 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE(ITER((n : Num), cexp), (v : (Cart[Real, 2]) -> Bool))"))
  let t1574 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()]))(@cauchy.open_mapping_thm()))
  let t1573 = @simp.asm_rewrite_tac(@list.List([@iter.iter_pointless(), @sets.image_i(), @sets.image_o()]))
  let t1571 = @term_syntax.parse_term("(n : Num)")
  let t1572 = @tactics.spec_tac(@term_syntax.parse_term("(N : Num) + 1"), t1571)
  let t1570 = @simp.asm_rewrite_tac(@list.List([@topology.interior_eq()]))
  let t1569 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("interior(IMAGE((f : (_) -> Cart[Real, _]), (s : (_) -> Bool))) == IMAGE(f, s) && !(s == {}) → !SUBSET(interior(IMAGE(f, s)), {})")))
  let t1568 = @simp.rewrite_tac(@list.List([@complexes.interior_real()]))
  let t1565 = @drule.match_mp(@topology.subset_interior())
  let t1567 = @tactics.disch_then(fn(x1566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1562 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1563 = @tactics.mp_tac(x1562)
      fn(x1564 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1563(x1564)
      }
    })(t1565(x1566))
  })
  let t1623 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → (∃ z : _, IN(z, s) && !t(z))"))), t1567), t1568), t1569), t1570), t1572), @nums.induct_tac), t1573), t1574), t1575), t1576), t1577), t1580), t1581), t1582), t1583), t1584), t1585), t1590), t1591), t1592), t1597), t1598), t1599), t1622])
  let t1561 = @tactics.subgoal_then(@term_syntax.parse_term("∃ z : Cart[Real, 2], IN(z, IMAGE(ITER((N : Num) + 1, cexp), (v : (Cart[Real, 2]) -> Bool))) && !real(z)"), @tactics.strip_assume_tac)
  let t1560 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Num)"))
  let t1559 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), @sets.forall_in_gspec()]))
  let t1556 = @drule.match_mp(@misc.upper_bound_finite_set())
  let t1553 = @term_syntax.parse_term("(n : Num) => n")
  let t1558 = @tactics.disch_then(fn(x1557 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1555 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1550 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1551 = @tactics.mp_tac(x1550)
        fn(x1552 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1551(x1552)
        }
      })(((x1554 : @kernel.Thm) => @bool.ispec(t1553, x1554))(x1555))
    })(t1556(x1557))
  })
  let t1549 = @simp.asm_rewrite_tac(@list.List([@sets.finite_union(), @sets.infinite()]))
  let t1548 = @tactics.match_mp_tac(@sets.infinite_diff_finite())
  let t1624 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x)} == DIFF({(x : _) | R(x)}, UNION({(x : _) | !P(x)}, {(x : _) | !Q(x)}))"))])), t1548), t1549), t1558), t1559), t1560), t1561), t1623), @tactics.all_tac])
  let t1547 = @tactics.subgoal_then(@term_syntax.parse_term("INFINITE({(n : Num) | SUBSET(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), (h : (Cart[Real, 2]) -> Bool)) && !DISJOINT(IMAGE(ITER(n, cexp), v), real) && !SUBSET(IMAGE(ITER(n, cexp), v), (s : (Cart[Real, 2]) -> Bool))})"), fn(x1544 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1545 = @tactics.assume_tac(x1544)
    fn(x1546 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1545(x1546)
    }
  })
  let t1542 = @simp.rewrite_tac(@list.List([@transcendentals.real_exp()]))
  let t1541 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : Cart[Real, 2], real(x) → real(cexp(x))) → !(INTER((s : (Cart[Real, 2]) -> Bool), real) == {}) → !(INTER(IMAGE(cexp, s), real) == {})")))
  let t1540 = @simp.rewrite_tac(@list.List([@sets.image_o()]))
  let t1539 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t1538 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), @iter.iter_pointless()]))
  let t1537 = @tactics.match_mp_tac(@nums.num_induction())
  let t1536 = @simp.rewrite_tac(@list.List([@sets.disjoint()]))
  let t1534 = @term_syntax.parse_term("(∀ d : Num, !(P : (Num) -> Bool)((N : Num) + d)) → (∀ n : Num, P(n) → n <= N)")
  let t1535 = @tactics.match_mp_tac(@meson.meson(@list.List([@int.arith_rule(@term_syntax.parse_term("!((n : Num) <= (N : Num)) → n == N + (n - N)"))]), t1534))
  let t1533 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @sets.subset(), @iterate.in_numseg(), @arith.le_0(), @sets.in_elim_thm()]))
  let t1532 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (N : Num))"))
  let t1531 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1530 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(fn(x1527 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1528 = ((x1526 : @kernel.Thm) => @tactics.label_tac("*", x1526))(x1527)
    fn(x1529 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1528(x1529)
    }
  }))
  let t1525 = @simp.asm_rewrite_tac(@list.List([]))
  let t1543 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(v : (Cart[Real, 2]) -> Bool)"), lemma_6())), t1525), t1530), t1531), t1532), t1533), t1535), t1536), t1537), t1538), t1539), t1540), t1541), t1542), @tactics.all_tac])
  let t1524 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(n : Num) | DISJOINT(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), real)})"), fn(x1521 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1522 = @tactics.assume_tac(x1521)
    fn(x1523 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1522(x1523)
    }
  })
  let t1519 = @simp.rewrite_tac(@list.List([@realax.real_gt(), @iter.iter(), @transcendentals.norm_cexp(), @transcendentals.real_exp_mono_lt()]))
  let t1517 = @equal.gsym(@arith.add1())
  let t1518 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(N : Num) < (n : Num) → SUC(n) >= N")), t1517]))
  let t1516 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1511 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1512 = @list.List([@term_syntax.parse_term("(n : Num) + 1"), t1511])
  let t1515 = @tactics.first_x_assum(fn(x1514 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1508 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1509 = @tactics.mp_tac(x1508)
      fn(x1510 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1509(x1510)
      }
    })(((x1513 : @kernel.Thm) => @bool.specl(t1512, x1513))(x1514))
  })
  let t1507 = @simp.expand_tac("h")
  let t1506 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t1505 = @simp.rewrite_tac(@list.List([@arith.not_le()]))
  let t1504 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t1503 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t1502 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1501 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @sets.subset(), @iterate.in_numseg(), @sets.in_elim_thm(), @arith.le_0()]))
  let t1500 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (N : Num))"))
  let t1499 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1496 = @term_syntax.parse_term("(N : Num)")
  let t1498 = @tactics.disch_then((x1497 : @kernel.Thm) => @tactics.x_choose_tac(t1496, x1497))
  let t1493 = @term_syntax.parse_term("exp(real_of_num(4))")
  let t1520 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1495 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1491 = @tactics.mp_tac(x1490)
      fn(x1492 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1491(x1492)
      }
    })(((x1494 : @kernel.Thm) => @bool.spec(t1493, x1494))(x1495))
  }), t1498), t1499), t1500), t1501), t1502), t1503), t1504), t1505), @tactics.disch_tac), t1506), @tactics.disch_tac), t1507), t1515), t1516), t1518), t1519), @tactics.all_tac])
  let t1489 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(n : Num) | !SUBSET(IMAGE(ITER(n, cexp), (v : (Cart[Real, 2]) -> Bool)), (h : (Cart[Real, 2]) -> Bool))})"), fn(x1486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1487 = @tactics.assume_tac(x1486)
    fn(x1488 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1487(x1488)
    }
  })
  let t1483 = @term_syntax.parse_term("(w : (Cart[Real, 2]) -> Bool) == {(z : Cart[Real, 2]) | abs(Im(z)) <= real_of_num(2) * pi && abs(Im(cexp(z))) <= real_of_num(2) * pi}")
  let t1484 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool) == {(z : Cart[Real, 2]) | abs(Im(z)) <= pi / real_of_num(3)}")
  let t1485 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(h : (Cart[Real, 2]) -> Bool) == {(z : Cart[Real, 2]) | Re(z) > real_of_num(4)}"), t1484, t1483]))
  let t1482 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1478 = @simp.asm_rewrite_tac(@list.List([@transcendentals.real_exp_le_x()]))
  let t1477 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(d : Real) + (y : Real) <= (x : Real) && real_of_num(1) + x <= exp(x) → d + real_of_num(1) + y <= exp(x) * real_of_num(1)")))
  let t1476 = @simp.asm_rewrite_tac(@list.List([@transcendentals.cos_0(), @equal.gsym(@real.real_of_num_suc())]))
  let t1475 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@complexes.real()])))
  let t1474 = @simp.asm_simp_tac(@list.List([@arith.add_clauses(), @iter.iter(), @complexes.real_cx(), @complexes.re_cx(), @realax.real_add_lid(), @realax.real_le_refl(), @transcendentals.real_exp(), @transcendentals.re_cexp()]))
  let t1473 = @tactics.subgoal_then(@term_syntax.parse_term("∀ d : Num, real(ITER((n : Num) + d, cexp, (w : Cart[Real, 2]))) && real_of_num(d) + (x : Real) <= Re(ITER(n + d, cexp, w))"), fn(x1471 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1471
    @meson.meson_tac(@list.List([th]))
  })
  let t1469 = @term_syntax.parse_term("(d : Num)")
  let t1470 = @tactics.spec_tac(@term_syntax.parse_term("(m : Num) + (d : Num)"), t1469)
  let t1468 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(m : Num) + (n : Num) + (d : Num) == n + (m + d)"))]))
  let t1467 = @list.List([@calc_rat.real_arith_tac, @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @arith.add_assoc()]))])
  let t1465 = @term_syntax.parse_term("real_of_num((m : Num)) + real_of_num((d : Num)) + (x : Real)")
  let t1466 = @tactics.trans_tac(@realax.real_le_trans())(t1465)
  let t1464 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(x1461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1462 = @tactics.subst1_tac(x1461)
    fn(x1463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1462(x1463)
    }
  }))
  let t1459 = @simp.rewrite_tac(@list.List([@arith.le_exists()]))
  let t1460 = @list.List([@meson.asm_meson_tac(@list.List([@misc.monotone_bigger()])), t1459])
  let t1458 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) + (n : Num) <= (r : (Num) -> Num)(m + n)"), fn(x1455 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1456 = @tactics.mp_tac(x1455)
    fn(x1457 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1456(x1457)
    }
  })
  let t1453 = @term_syntax.parse_term("(m : Num)")
  let t1454 = @tactics.spec_tac(@term_syntax.parse_term("(N : Num) + (M : Num)"), t1453)
  let t1452 = @list.List([@calc_rat.real_arith_tac, @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @arith.add_assoc()]))])
  let t1450 = @term_syntax.parse_term("real_of_num((N : Num)) + real_of_num((M : Num)) + (x : Real)")
  let t1451 = @tactics.trans_tac(@realax.real_le_trans())(t1450)
  let t1447 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(g : Real) + (real_of_num(1) - (x : Real)) <= (m : Real) → m + x <= (f : Real) → real_of_num(1) <= abs(f - g)")))
  let t1449 = @tactics.first_x_assum(fn(x1448 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1447(x1448))
  })
  let t1446 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), @complexes.re_sub(), @realarith.real_not_lt()]))
  let t1443 = @drule.match_mp(@meson.meson(@list.List([@vectors.component_le_norm(), @realarith.real_let_trans()]), @term_syntax.parse_term("norm((x : Cart[Real, _])) < real_of_num(1) → abs(op_dollar(x, 1)) < real_of_num(1)")))
  let t1445 = @tactics.disch_then(fn(x1444 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1440 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1441 = @tactics.mp_tac(x1440)
      fn(x1442 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1441(x1442)
      }
    })(t1443(x1444))
  })
  let t1439 = @simp.rewrite_tac(@list.List([@arith.le_add(), @vectors.dist()]))
  let t1435 = @term_syntax.parse_term("(N : Num) + ((M : Num) + (n : Num))")
  let t1438 = @tactics.remove_then("*", fn(x1437 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1433 = @tactics.mp_tac(x1432)
      fn(x1434 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1433(x1434)
      }
    })(((x1436 : @kernel.Thm) => @bool.spec(t1435, x1436))(x1437))
  })
  let t1429 = @term_syntax.parse_term("(M : Num)")
  let t1431 = @tactics.disch_then((x1430 : @kernel.Thm) => @tactics.x_choose_tac(t1429, x1430))
  let t1428 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("Re((g : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]))) + (real_of_num(1) - (x : Real))"), @real.real_arch_simple()))
  let t1427 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(fn(x1424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1425 = ((x1423 : @kernel.Thm) => @tactics.label_tac("*", x1423))(x1424)
    fn(x1426 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1425(x1426)
    }
  }))
  let t1422 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t1418 = @term_syntax.parse_term("real_of_num(1)")
  let t1421 = @tactics.disch_then(fn(x1420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1416 = @tactics.mp_tac(x1415)
      fn(x1417 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1416(x1417)
      }
    })(((x1419 : @kernel.Thm) => @bool.spec(t1418, x1419))(x1420))
  })
  let t1414 = @simp.asm_rewrite_tac(@list.List([@topology.lim_sequentially()]))
  let t1410 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1413 = @tactics.first_x_assum(fn(x1412 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1407 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1408 = @tactics.mp_tac(x1407)
      fn(x1409 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1408(x1409)
      }
    })(((x1411 : @kernel.Thm) => @bool.spec(t1410, x1411))(x1412))
  })
  let t1406 = @tactics.disch_then(fn(x1405 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x1405))
  })
  let t1402 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1403 = @term_syntax.parse_term("(x : Real)")
  let t1404 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t1403, t1402]))
  let t1401 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1400 = @simp.rewrite_tac(@list.List([@complexes.exists_real(), @sets.in_image()]))
  let t1399 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("((P : Bool) && IN((x : Cart[Real, 2]), real)) == (real(x) && P)"))]))
  let t1398 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_inter()]))
  let t1397 = @simp.asm_rewrite_tac(@list.List([]))
  let t1479 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(v : (Cart[Real, 2]) -> Bool)"), lemma_6())), t1397), t1398), t1399), t1400), t1401), t1404), t1406), t1413), t1414), t1421), t1422), t1427), t1428), t1431), t1438), t1439), t1445), t1446), t1449), t1451), @tactics.conj_tac), t1452), t1454), @tactics.gen_tac), t1458), t1460), t1464), t1466), @tactics.conj_tac), t1467), t1468), t1470), t1473), @nums.induct_tac), t1474), t1475), t1476), t1477), t1478)
  let t1394 = @meson.asm_meson_tac(@list.List([@simp.rewrite_rule(@list.List([@sets.subset()]))(@topology.ball_subset_cball())]))
  let t1393 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_refl(), @equal.gsym(@real.real_not_le())]))
  let t1390 = @term_syntax.parse_term("(n : Num)")
  let t1395 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x1392 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1387 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1388 = @tactics.mp_tac(x1387)
      fn(x1389 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1388(x1389)
      }
    })(((x1391 : @kernel.Thm) => @bool.spec(t1390, x1391))(x1392))
  })), t1393), t1394)
  let t1386 = @simp.asm_rewrite_tac(@list.List([@topology.subset_balls(), @vectors.dist_refl()]))
  let t1385 = @term_syntax.parse_term("ball(((z : Cart[Real, 2]), (d : Real)))")
  let t1396 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.trans_tac(@sets.subset_trans())(t1385), t1386), @calc_rat.asm_real_arith_tac), t1395])
  let t1384 = @simp.rewrite_tac(@list.List([@topology.compact_cball(), @class.not_imp()]))
  let t1380 = @term_syntax.parse_term("(c : Real)")
  let t1381 = @list.List([@term_syntax.parse_term("cball(((z : Cart[Real, 2]), (d : Real) / real_of_num(2)))"), t1380])
  let t1480 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1378 = @tactics.mp_tac(x1377)
      fn(x1379 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1378(x1379)
      }
    })(((x1382 : @kernel.Thm) => @bool.specl(t1381, x1382))(x1383))
  }), t1384), @tactics.conj_tac), t1396), t1479])
  let t1376 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1375 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x1374 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1372 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1369 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        @tactics.all_tac
      })(((x1371 : @kernel.Term) => @lib.check(fn(x1370 : @kernel.Term) -> Bool raise {
        @basics.is_forall(x1370)
      }, x1371))(x1372))
    })((fn(x1373 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x1373)
    })(x1374))
  }))
  let t1367 = @simp.rewrite_tac(@list.List([@sets.exists_in_image()]))
  let t1368 = @list.List([@meson.asm_meson_tac(@list.List([])), t1367])
  let t1366 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∃ x : Cart[Real, 2], IN(x, IMAGE(ITER((r : (Num) -> Num)(n), cexp), ball(((z : Cart[Real, 2]), (d : Real) / real_of_num(2))))) && norm(x) <= (c : Real)"), fn(x1363 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1364 = @tactics.mp_tac(x1363)
    fn(x1365 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1364(x1365)
    }
  })
  let t1362 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1361 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → (r : (Num) -> Num)(m) < r(n)"), fn(x1358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1359 = @tactics.mp_tac(x1358)
    fn(x1360 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1359(x1360)
    }
  })
  let t1357 = @simp.abbrev_tac(@term_syntax.parse_term("(r : (Num) -> Num)((n : Num)) == (q : (Num) -> Num)((p : (Num) -> Num)(n))"))
  let t1356 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1350 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1351 = @tactics.assume_tac(x1350)
    fn(x1352 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1351(x1352)
    }
  }, fn(x1353 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1354 = @tactics.mp_tac(x1353)
    fn(x1355 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1354(x1355)
    }
  }))
  let t1349 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : (Num) -> Num)"))
  let t1348 = @simp.asm_rewrite_tac(@list.List([]))
  let t1347 = @tactics.exists_tac(@term_syntax.parse_term("(q : (Num) -> Num)"))
  let t1345 = @meson.asm_meson_tac(@list.List([@arith.lt_trans()]))
  let t1346 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@arith.transitive_stepwise_lt()), t1345), @tactics.all_tac])
  let t1344 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → (q : (Num) -> Num)(m) < q(n)"), fn(x1341 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1342 = @tactics.assume_tac(x1341)
    fn(x1343 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1342(x1343)
    }
  })
  let t1339 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) >= (N : Num) + 1 → N < n"))]))
  let t1338 = @simp.rewrite_tac(@list.List([@sets.exists_in_image()]))
  let t1340 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.dependent_choice()), t1338), t1339), @tactics.all_tac])
  let t1337 = @tactics.subgoal_then(@term_syntax.parse_term("∃ q : (Num) -> Num, (∀ n : Num, ∃ x : Cart[Real, 2], IN(x, IMAGE(ITER(q(n), cexp), ball(((z : Cart[Real, 2]), (d : Real) / real_of_num(2))))) && norm(x) <= (c : Real)) && (∀ n : Num, q(n) < q(SUC(n)))"), @tactics.strip_assume_tac)
  let t1334 = @term_syntax.parse_term("(c : Real)")
  let t1336 = @tactics.disch_then((x1335 : @kernel.Thm) => @tactics.x_choose_tac(t1334, x1335))
  let t1333 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @realarith.real_not_lt()]))
  let t1332 = @simp.asm_rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_exists_thm(), @class.not_imp()]))
  let t1331 = @simp.asm_rewrite_tac(@list.List([@topology.open_ball(), @convex.connected_ball(), @topology.ball_eq_empty(), @real.real_not_le(), @misc.real_half(), @topology.bounded_ball()]))
  let t1327 = @term_syntax.parse_term("ball(((z : Cart[Real, 2]), (d : Real) / real_of_num(2)))")
  let t1330 = @tactics.first_x_assum(fn(x1329 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1325 = @tactics.mp_tac(x1324)
      fn(x1326 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1325(x1326)
      }
    })(((x1328 : @kernel.Thm) => @bool.spec(t1327, x1328))(x1329))
  })
  let t1323 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t1322 = @simp.asm_rewrite_tac(@list.List([]))
  let t1318 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1321 = @tactics.disch_then(fn(x1320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1316 = @tactics.mp_tac(x1315)
      fn(x1317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1316(x1317)
      }
    })(((x1319 : @kernel.Thm) => @bool.spec(t1318, x1319))(x1320))
  })
  let t1312 = @simp.gen_rewrite_rule(fn(x1311 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1311
  }, @list.List([@topology.open_contains_ball()]))
  let t1314 = @tactics.first_assum(fn(x1313 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1309 = @tactics.mp_tac(x1308)
      fn(x1310 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1309(x1310)
      }
    })(t1312(x1313))
  })
  let t1305 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t1307 = @tactics.disch_then((x1306 : @kernel.Thm) => @tactics.x_choose_tac(t1305, x1306))
  let t1302 = @simp.gen_rewrite_rule(fn(x1301 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1301
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t1304 = @tactics.first_assum(fn(x1303 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1298 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1299 = @tactics.mp_tac(x1298)
      fn(x1300 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1299(x1300)
      }
    })(t1302(x1303))
  })
  let t1481 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(v : (Cart[Real, 2]) -> Bool)")), @tactics.strip_tac), t1304), t1307), t1314), t1321), t1322), t1323), t1330), t1331), t1332), t1333), t1336), t1337), t1340), t1344), t1346), t1347), t1348), t1349), t1356), t1357), t1361), t1362), t1366), t1368), t1375), t1376), t1480)])
  let t1790 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ v : (Cart[Real, 2]) -> Bool, !(open(v) && connected(v) && bounded(v) && !(v == {}) && (∀ c : Real, ∃ N : Num, ∀ n : Num, ∀ x : Cart[Real, 2], n >= N && IN(x, v) → c < norm(ITER(n, cexp, x))))"), fn(x1295 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1296 = @tactics.assume_tac(x1295)
    fn(x1297 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1296(x1297)
    }
  }), t1481), t1482), t1485), t1489), t1520), t1524), t1543), t1547), t1624), t1628), t1697), t1701), t1721), t1725), t1759), t1766), t1767), t1768), t1769), t1770), t1771), t1772), t1778), t1780), t1781), t1782), t1786), t1787), t1788), t1789)
  theorem_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 2]) -> Bool, open(v) && connected(v) && !(v == {}) → (∃ q : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → q(m) < q(n)) && (∀ r : (Num) -> Num, (∀ m : Num, ∀ n : Num, m < n → r(m) < r(n)) && ((∀ x : Cart[Real, 2], IN(x, v) → op_minus_minus_gt((n : Num) => inv(ITER(q(r(n)), cexp, x)), Cx(real_of_num(0)), sequentially)) && (∀ k : (Cart[Real, 2]) -> Bool, ∀ c : Real, compact(k) && SUBSET(k, v) → (∃ N : Num, ∀ n : Num, ∀ x : Cart[Real, 2], n >= N && IN(x, k) → c < norm(ITER(q(r(n)), cexp, x)))) || (∃ g : (Cart[Real, 2]) -> Cart[Real, 2], holomorphic_on(g, v) && (∀ x : Cart[Real, 2], IN(x, v) → op_minus_minus_gt((n : Num) => ITER(q(r(n)), cexp, x), g(x), sequentially)) && (∀ k : (Cart[Real, 2]) -> Bool, ∀ e : Real, compact(k) && SUBSET(k, v) && real_of_num(0) < e → (∃ N : Num, ∀ n : Num, ∀ x : Cart[Real, 2], n >= N && IN(x, k) → norm(ITER(q(r(n)), cexp, x) - g(x)) < e)))) → false))"), t1790))
}

///|
let theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THEOREM")

///|
/// `THEOREM`
pub fn theorem() -> @kernel.Thm {
  theorem_c.get()
}

///|
/// STRONG
fn step_16() -> Unit raise {
  let t1867 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1866 = @simp.rewrite_tac(@list.List([@iter.iter(), @transcendentals.cexp_nz()]))
  let t1865 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t1864 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t1863 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) && (r : Bool)) == ((p → q) && (p → r))"))]))
  let t1862 = @simp.rewrite_tac(@list.List([@sets.in_univ(), holomorphic_on_iter_cexp()]))
  let t1860 = @sets.set_tac(@list.List([]))
  let t1861 = @list.List([@simp.rewrite_tac(@list.List([@sets.forall_in_gspec()])), t1860])
  let t1859 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1858 = @simp.asm_rewrite_tac(@list.List([@class.not_imp(), @class.not_forall_thm()]))
  let t1853 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t1854 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t1855 = @term_syntax.parse_term("(v : (Cart[Real, 2]) -> Bool)")
  let t1856 = @term_syntax.parse_term("{ITER((n : Num), cexp) | IN(n, UNIV)}")
  let t1857 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => ITER((q : (Num) -> Num)(n), cexp)"), t1856, t1855, t1854, t1853]), @cauchy.montel_omitting()))
  let t1852 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1847 = @tactics.assume_tac(x1846)
    fn(x1848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1847(x1848)
    }
  }, fn(x1849 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1850 = @tactics.mp_tac(x1849)
    fn(x1851 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1850(x1851)
    }
  }))
  let t1845 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : (Num) -> Num)"))
  let t1844 = @simp.asm_rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1843 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(v : (Cart[Real, 2]) -> Bool)"), theorem()))
  let t1842 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("((∀ x : _, !(P : (_) -> Bool)(x)) → false) → (∃ x : _, P(x))")))
  let t1841 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1837 = @simp.asm_rewrite_tac(@list.List([@topology.subset_balls(), @vectors.dist_refl()]))
  let t1835 = @term_syntax.parse_term("ball(((b : Cart[Real, 2]), (r : Real)))")
  let t1836 = @tactics.trans_tac(@sets.subset_trans())(t1835)
  let t1834 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → IN((a : _), IMAGE((f : (_) -> _), s)) → IN(a, IMAGE(f, t))")))
  let t1833 = @list.List([@calc_rat.real_arith_tac, @tactics.match_mp_tac(@theorems.mono_exists())])
  let t1832 = @simp.rewrite_tac(@list.List([@topology.in_ball(), @vectors.dist(), @complexes.complex_sub_rzero()]))
  let t1831 = @simp.asm_rewrite_tac(@list.List([@real.real_not_le(), @real.real_lt_min(), @equal.gsym(@vectors.dist_nz()), @complexes.complex_norm_nz()]))
  let t1830 = @simp.asm_rewrite_tac(@list.List([@topology.open_ball(), @convex.connected_ball(), @topology.ball_eq_empty()]))
  let t1825 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t1826 = @list.List([@term_syntax.parse_term("ball(((b : Cart[Real, 2]), min((r : Real), min(norm(b), distance((b, (a : Cart[Real, 2])))))))"), t1825])
  let t1829 = @tactics.first_x_assum(fn(x1828 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1822 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1823 = @tactics.mp_tac(x1822)
      fn(x1824 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1823(x1824)
      }
    })(((x1827 : @kernel.Thm) => @bool.specl(t1826, x1827))(x1828))
  })
  let t1821 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Real)"))(@tactics.strip_assume_tac))
  let t1820 = @simp.asm_rewrite_tac(@list.List([]))
  let t1816 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t1819 = @tactics.disch_then(fn(x1818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1814 = @tactics.mp_tac(x1813)
      fn(x1815 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1814(x1815)
      }
    })(((x1817 : @kernel.Thm) => @bool.spec(t1816, x1817))(x1818))
  })
  let t1810 = @simp.gen_rewrite_rule(fn(x1809 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1809
  }, @list.List([@topology.open_contains_ball()]))
  let t1812 = @tactics.first_x_assum(fn(x1811 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1806 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1807 = @tactics.mp_tac(x1806)
      fn(x1808 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1807(x1808)
      }
    })(t1810(x1811))
  })
  let t1805 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t1838 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_insert(), @sets.not_in_empty(), @class.not_forall_thm(), @class.not_imp(), @class.de_morgan_thm()])), t1805), t1812), t1819), t1820), t1821), t1829), t1830), t1831), t1832), @tactics.ants_tac), t1833), @tactics.gen_tac), t1834), t1836), t1837), @calc_rat.real_arith_tac)
  let t1804 = @meson.asm_meson_tac(@list.List([@topology.finite_imp_not_open()]))
  let t1803 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t1801 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t1839 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1802 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1798 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1799 = @tactics.mp_tac(x1798)
      fn(x1800 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1799(x1800)
      }
    })(t1801(x1802))
  }), t1803), t1804), t1838])
  let t1797 = @tactics.subgoal_then(@term_syntax.parse_term("!SUBSET((u : (Cart[Real, 2]) -> Bool), {Cx(real_of_num(0)), (a : Cart[Real, 2])})"), fn(x1794 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1795 = @tactics.mp_tac(x1794)
    fn(x1796 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1795(x1796)
    }
  })
  let t1840 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1797), t1839)])
  let t1868 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ v : (Cart[Real, 2]) -> Bool, ∀ a : Cart[Real, 2], open(v) && !(v == {}) && connected(v) && !IN(Cx(real_of_num(0)), v) && !(a == Cx(real_of_num(0))) → (∃ n : Num, IN(a, IMAGE(ITER(n, cexp), v)))"), fn(x1791 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1792 = @tactics.assume_tac(x1791)
    fn(x1793 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1792(x1793)
    }
  }), t1840), t1841), t1842), @tactics.disch_tac), t1843), t1844), t1845), t1852), t1857), t1858), t1859), @tactics.conj_tac), t1861), t1862), t1863), t1864), @tactics.conj_tac), t1865), @nums.induct_tac), t1866), t1867)
  strong_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, 2]) -> Bool, ∀ a : Cart[Real, 2], open(u) && !(u == {}) && !(a == Cx(real_of_num(0))) → (∃ n : Num, IN(a, IMAGE(ITER(n, cexp), u)))"), t1868))
}

///|
let strong_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STRONG")

///|
/// `STRONG`
pub fn strong() -> @kernel.Thm {
  strong_c.get()
}

///|
/// COROLLARY
fn step_17() -> Unit raise {
  let t1891 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1890 = @simp.asm_rewrite_tac(@list.List([]))
  let t1888 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t1889 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(u : (Cart[Real, 2]) -> Bool)"), t1888]), strong()))
  let t1885 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t1883 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("!SUBSET((s : (_) -> Bool), {(z : _)}) → (∃ a : _, IN(a, s) && !(a == z))")))
  let t1886 = @tactics.then_tac(@tactics.disch_then(fn(x1884 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1880 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1881 = @tactics.mp_tac(x1880)
      fn(x1882 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1881(x1882)
      }
    })(t1883(x1884))
  }), t1885)
  let t1879 = @meson.asm_meson_tac(@list.List([@topology.finite_imp_not_open()]))
  let t1878 = @simp.rewrite_tac(@list.List([@sets.finite_sing()]))
  let t1876 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t1887 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1877 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1873 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1874 = @tactics.mp_tac(x1873)
      fn(x1875 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1874(x1875)
      }
    })(t1876(x1877))
  }), t1878), t1879), t1886])
  let t1872 = @tactics.subgoal_then(@term_syntax.parse_term("!SUBSET((v : (Cart[Real, 2]) -> Bool), {Cx(real_of_num(0))})"), fn(x1869 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1870 = @tactics.mp_tac(x1869)
    fn(x1871 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1870(x1871)
    }
  })
  let t1892 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1872), t1887), t1889), t1890), t1891)
  corollary_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, 2]) -> Bool, ∀ v : (Cart[Real, 2]) -> Bool, open(u) && !(u == {}) && open(v) && !(v == {}) → (∃ n : Num, !(INTER(IMAGE(ITER(n, cexp), u), v) == {}))"), t1892))
}

///|
let corollary_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COROLLARY")

///|
/// `COROLLARY`
pub fn corollary() -> @kernel.Thm {
  corollary_c.get()
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
}
