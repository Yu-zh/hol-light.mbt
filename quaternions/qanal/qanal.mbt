// Translated from upstream Quaternions/qanal.hl; edit this file directly.

///|
/// Quaternions/qanal.hl:7
fn step_1() -> Unit raise {
  @quaternion.prioritize_quat(())
}

///|
/// QUAT_SQNORM_MUL
fn step_2() -> Unit raise {
  let t1 = @tactics.conv_tac(@equal.binop_conv(@calc_rat.real_poly_conv))
  let t2 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_sqnorm(), @quaternion.quat_cnj(), @quaternion.quat_mul(), @quaternion.quat_components()])), @tactics.gen_tac), t1), @tactics.refl_tac)
  quat_sqnorm_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], pow(norm(q), 2) == Re(cnj(q) * q)"), t2))
}

///|
let quat_sqnorm_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_SQNORM_MUL")

///|
/// `QUAT_SQNORM_MUL`
pub fn quat_sqnorm_mul() -> @kernel.Thm {
  quat_sqnorm_mul_c.get()
}

///|
/// QUAT_INV_POW
fn step_3() -> Unit raise {
  let t6 = @simp.asm_rewrite_tac(@list.List([@quaternion.quat_pow_suc_alt(), @quaternion.quat_inv_mul()]))
  let t7 = @tactics.then_tac(@simp.gen_rewrite_tac(fn(x3 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4 = @equal.rand_conv(x3)
    fn(x5 : @kernel.Term) -> @kernel.Thm raise {
      s4(x5)
    }
  }, @list.List([@quaternion.quat_pow()])), t6)
  let t8 = @list.List([@simp.rewrite_tac(@list.List([@quaternion.quat_pow(), @quaternion.quat_inv_1()])), t7])
  let t9 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @quaternions_misc.induct_tac), t8)
  quat_inv_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], ∀ n : Num, inv(pow(x, n)) == pow(inv(x), n)"), t9))
}

///|
let quat_inv_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_INV_POW")

///|
/// `QUAT_INV_POW`
pub fn quat_inv_pow() -> @kernel.Thm {
  quat_inv_pow_c.get()
}

///|
/// QUAT_NORM_IMG
fn step_4() -> Unit raise {
  let t12 = @tactics.conv_tac(@calc_rat.real_ring)
  let t11 = @simp.rewrite_tac(@list.List([@quaternion.quat_mul(), @quaternion.quat_components(), @quaternion.hx_components(), @quaternion.quat_neg_components(), @quaternion.quat_cnj_components(), @qcalc.cnj_quat()]))
  let t10 = @simp.rewrite_tac(@list.List([@quaternion.quat_pow_2(), @quaternion.forall_quat(), @quaternion.quat_eq()]))
  let t13 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_norm_pow_2()])), t10), t11), t12)
  quat_norm_img_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 4], Re(x) == real_of_num(0) → pow(x, 2) == -pow(Hx(norm(x)), 2)"), t13))
}

///|
let quat_norm_img_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_NORM_IMG")

///|
/// `QUAT_NORM_IMG`
pub fn quat_norm_img() -> @kernel.Thm {
  quat_norm_img_c.get()
}

///|
/// UNIFORM_LIM_QUAT_MUL
fn step_5() -> Unit raise {
  let t20 = @simp.rewrite_tac(@list.List([@topology.uniform_lim_bilinear()]))
  let t19 = @tactics.disch_then(fn(x18 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x14 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s15 = @tactics.mp_tac(x14)
      fn(x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s15(x16)
      }
    })(((x17 : @kernel.Thm) => @bool.conj(@quaternion.bilinear_quat_mul(), x17))(x18))
  })
  let t21 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t19), t20)
  uniform_lim_quat_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ P : (B) -> Bool, ∀ f : (B, A) -> Cart[Real, 4], ∀ g : (B, A) -> Cart[Real, 4], ∀ l : (B) -> Cart[Real, 4], ∀ m : (B) -> Cart[Real, 4], ∀ b1 : Real, ∀ b2 : Real, eventually((x : A) => ∀ n : B, P(n) → norm(l(n)) <= b1, net) && eventually((x : A) => ∀ n : B, P(n) → norm(m(n)) <= b2, net) && (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(f(n, x) - l(n)) < e, net)) && (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(g(n, x) - m(n)) < e, net)) → (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(f(n, x) * g(n, x) - l(n) * m(n)) < e, net))"), t21))
}

///|
let uniform_lim_quat_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFORM_LIM_QUAT_MUL")

///|
/// `UNIFORM_LIM_QUAT_MUL`
pub fn uniform_lim_quat_mul() -> @kernel.Thm {
  uniform_lim_quat_mul_c.get()
}

///|
/// UNIFORM_LIM_QUAT_INV
fn step_6() -> Unit raise {
  let t84 = @simp.asm_simp_tac(@list.List([@misc.real_half(), @real.real_pow_lt(), @real.real_lt_mul()]))
  let t85 = @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t84)
  let t83 = @meson.asm_meson_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("(b : Real) <= norm((l : Cart[Real, 4])) && norm((f : Cart[Real, 4]) - l) < b / real_of_num(2) → b / real_of_num(2) <= norm(f)"))]))
  let t82 = @simp.rewrite_tac(@list.List([]))
  let t81 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@metric.eventually_mono()))
  let t80 = @tactics.first_x_assum(fn(x73 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x73
    let t79 = @simp.gen_rewrite_tac(fn(x76 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s77 = @equal.land_conv(x76)
      fn(x78 : @kernel.Term) -> @kernel.Thm raise {
        s77(x78)
      }
    }, @list.List([@equal.gsym(@metric.eventually_and())]))
    let t75 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
    @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(th_1), t75), t79)
  })
  let t72 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t69 = @term_syntax.parse_term("(b : Real) / real_of_num(2)")
  let t86 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x71 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x66 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s67 = @tactics.mp_tac(x66)
      fn(x68 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s67(x68)
      }
    })(((x70 : @kernel.Thm) => @bool.spec(t69, x70))(x71))
  }), t72), t80), t81), t82), t83), t85])
  let t87 = @tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@metric.eventually_and()])), @tactics.conj_tac), t86)
  let t65 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t64 = @simp.asm_simp_tac(@list.List([@real.real_le_lmul_eq(), @calc_rat.real_arith(@term_syntax.parse_term("pow((b : Real), 2) / real_of_num(2) == b / real_of_num(2) * b"))]))
  let t63 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (e : Real) * (b : Real) == e * (a * b)"))]))
  let t60 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realarith.real_lte_trans()))
  let t62 = @tactics.first_x_assum(fn(x61 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t60(x61))
  })
  let t59 = @simp.once_rewrite_tac(@list.List([@vectors.norm_sub()]))
  let t58 = @simp.asm_simp_tac(@list.List([@quaternion.quat_norm_nz(), @quaternion.quat_norm_zero(), @realax.real_mul_assoc(), @real.real_mul_rinv(), @realax.real_mul_lid()]))
  let t57 = @tactics.exists_tac(@term_syntax.parse_term("norm((f : (B, A) -> Cart[Real, 4])((n : B), (x : A)))"))
  let t56 = @tactics.match_mp_tac(@real.real_lt_lcancel_imp())
  let t55 = @simp.asm_simp_tac(@list.List([@quaternion.quat_norm_nz(), @quaternion.quat_norm_zero(), @equal.gsym(@realax.real_mul_assoc()), @realax.real_mul_linv(), @realarith.real_mul_rid()]))
  let t54 = @tactics.exists_tac(@term_syntax.parse_term("norm((l : (B) -> Cart[Real, 4])((n : B)))"))
  let t53 = @tactics.match_mp_tac(@real.real_lt_rcancel_imp())
  let t52 = @simp.rewrite_tac(@list.List([@quaternion.quat_norm_mul(), @quaternion.quat_norm_inv()]))
  let t50 = @simp.asm_simp_tac(@list.List([@quaternion.quat_sub_rdistrib(), @equal.gsym(@quaternion.quat_mul_assoc()), @quaternion.quat_mul_linv(), @quaternion.quat_mul_rid(), @quaternion.quat_mul_lid()]))
  let t49 = @tactics.exists_tac(@term_syntax.parse_term("(q : Cart[Real, 4])"))
  let t48 = @tactics.match_mp_tac(@quaternion.quat_mul_rcancel())
  let t47 = @simp.asm_simp_tac(@list.List([@quaternion.quat_sub_ldistrib(), @quaternion.quat_mul_assoc(), @quaternion.quat_mul_rinv(), @quaternion.quat_mul_lid()]))
  let t46 = @tactics.exists_tac(@term_syntax.parse_term("(p : Cart[Real, 4])"))
  let t45 = @tactics.match_mp_tac(@quaternion.quat_mul_lcancel())
  let t51 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t45), t46), t47), t48), t49), t50), @tactics.all_tac])
  let t44 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Cart[Real, 4], ∀ q : Cart[Real, 4], !(p == Hx(real_of_num(0))) && !(q == Hx(real_of_num(0))) → inv(p) - inv(q) == inv(p) * ((q - p) * inv(q))"), fn(x42 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x42
    @simp.asm_simp_tac(@list.List([th]))
  })
  let t40 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@quaternion.norm_hx()])))
  let t41 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.disch_then(fn(x37 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s38 = @tactics.subst_all_tac(x37)
    fn(x39 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s38(x39)
    }
  })), t40), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t36 = @tactics.subgoal_then(@term_syntax.parse_term("!((f : (B, A) -> Cart[Real, 4])((n : B), (x : A)) == Hx(real_of_num(0))) && !((l : (B) -> Cart[Real, 4])(n) == Hx(real_of_num(0)))"), @tactics.strip_assume_tac)
  let t35 = @tactics.repeat_tac(@tactics.disch_tac)
  let t33 = @simp.asm_rewrite_tac(@list.List([]))
  let t30 = @term_syntax.parse_term("(n : B)")
  let t34 = @tactics.repeat_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x32 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s28 = @tactics.mp_tac(x27)
      fn(x29 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s28(x29)
      }
    })(((x31 : @kernel.Thm) => @bool.spec(t30, x31))(x32))
  }), t33))
  let t26 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : B)"))
  let t88 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : A)")), @tactics.strip_tac), t26), @tactics.disch_tac), t34), t35), t36), t41), t44), t51), t52), t53), t54), t55), t56), t57), t58), t59), t62), t63), t64), t65), @calc_rat.asm_real_arith_tac), t87])
  let t25 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t24 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) && (r : Bool)) == ((p → q) && (p → r))"))]))
  let t23 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => ∀ n : B, (P : (B) -> Bool)(n) → (b : Real) <= norm((l : (B) -> Cart[Real, 4])(n)) && b / real_of_num(2) <= norm((f : (B, A) -> Cart[Real, 4])(n, x)) && norm(f(n, x) - l(n)) < (e : Real) * (pow(b, 2) / real_of_num(2))"))
  let t22 = @tactics.match_mp_tac(@metric.eventually_mono())
  let t89 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t22), t23), t24), t25), @tactics.conj_tac), t88)
  uniform_lim_quat_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ P : (B) -> Bool, ∀ f : (B, A) -> Cart[Real, 4], ∀ l : (B) -> Cart[Real, 4], ∀ b : Real, (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(f(n, x) - l(n)) < e, net)) && real_of_num(0) < b && eventually((x : A) => ∀ n : B, P(n) → b <= norm(l(n)), net) → (∀ e : Real, real_of_num(0) < e → eventually((x : A) => ∀ n : B, P(n) → norm(inv(f(n, x)) - inv(l(n))) < e, net))"), t89))
}

///|
let uniform_lim_quat_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFORM_LIM_QUAT_INV")

///|
/// `UNIFORM_LIM_QUAT_INV`
pub fn uniform_lim_quat_inv() -> @kernel.Thm {
  uniform_lim_quat_inv_c.get()
}

///|
/// LIM_QUAT_MUL
fn step_7() -> Unit raise {
  let t90 = @simp.simp_tac(@list.List([@topology.lim_bilinear(), @quaternion.bilinear_quat_mul()]))
  lim_quat_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ g : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ m : Cart[Real, 4], op_minus_minus_gt(f, l, net) && op_minus_minus_gt(g, m, net) → op_minus_minus_gt((x : A) => f(x) * g(x), l * m, net)"), t90))
}

///|
let lim_quat_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_QUAT_MUL")

///|
/// `LIM_QUAT_MUL`
pub fn lim_quat_mul() -> @kernel.Thm {
  lim_quat_mul_c.get()
}

///|
/// LIM_QUAT_INV
fn step_8() -> Unit raise {
  let t97 = @equal.gsym(@topology.tendsto())
  let t98 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.dist()), t97, @quaternion.quat_norm_nz()]))
  let t96 = @simp.asm_rewrite_tac(@list.List([@realax.real_le_refl(), @metric.eventually_true()]))
  let t91 = @term_syntax.parse_term("norm((l : Cart[Real, 4]))")
  let t92 = @term_syntax.parse_term("(n : X) => (l : Cart[Real, 4])")
  let t93 = @term_syntax.parse_term("(n : X) => (f : (A) -> Cart[Real, 4])")
  let t94 = @term_syntax.parse_term("(x : X) => true")
  let t95 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t94, t93, t92, t91]), uniform_lim_quat_inv()))
  let t99 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t95), t96), t98)
  lim_quat_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], op_minus_minus_gt(f, l, net) && !(l == Hx(real_of_num(0))) → op_minus_minus_gt((x : A) => inv(f(x)), inv(l), net)"), t99))
}

///|
let lim_quat_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_QUAT_INV")

///|
/// `LIM_QUAT_INV`
pub fn lim_quat_inv() -> @kernel.Thm {
  lim_quat_inv_c.get()
}

///|
/// LIM_QUAT_POW
fn step_9() -> Unit raise {
  let t101 = @simp.asm_simp_tac(@list.List([lim_quat_mul(), @quaternion.quat_pow(), @topology.lim_const()]))
  let t100 = @tactics.repeat_tac(@tactics.gen_tac)
  let t102 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), t100), @tactics.disch_tac), @quaternions_misc.induct_tac), t101)
  lim_quat_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ n : Num, op_minus_minus_gt(f, l, net) → op_minus_minus_gt((x : A) => pow(f(x), n), pow(l, n), net)"), t102))
}

///|
let lim_quat_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_QUAT_POW")

///|
/// `LIM_QUAT_POW`
pub fn lim_quat_pow() -> @kernel.Thm {
  lim_quat_pow_c.get()
}

///|
/// LIM_QUAT_LMUL
fn step_10() -> Unit raise {
  let t103 = @simp.simp_tac(@list.List([lim_quat_mul(), @topology.lim_const()]))
  lim_quat_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ c : Cart[Real, 4], op_minus_minus_gt(f, l, (net : Net[A])) → op_minus_minus_gt((x : A) => c * f(x), c * l, net)"), t103))
}

///|
let lim_quat_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_QUAT_LMUL")

///|
/// `LIM_QUAT_LMUL`
pub fn lim_quat_lmul() -> @kernel.Thm {
  lim_quat_lmul_c.get()
}

///|
/// LIM_QUAT_RMUL
fn step_11() -> Unit raise {
  let t104 = @simp.simp_tac(@list.List([lim_quat_mul(), @topology.lim_const()]))
  lim_quat_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ c : Cart[Real, 4], op_minus_minus_gt(f, l, (net : Net[A])) → op_minus_minus_gt((x : A) => f(x) * c, l * c, net)"), t104))
}

///|
let lim_quat_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_QUAT_RMUL")

///|
/// `LIM_QUAT_RMUL`
pub fn lim_quat_rmul() -> @kernel.Thm {
  lim_quat_rmul_c.get()
}

///|
/// LIM_NULL_QUAT_NEG
fn step_12() -> Unit raise {
  let t111 = @simp.rewrite_tac(@list.List([@quaternion.quat_neg_0()]))
  let t108 = @drule.match_mp(@topology.lim_neg())
  let t110 = @tactics.disch_then(fn(x109 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x105 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s106 = @tactics.mp_tac(x105)
      fn(x107 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s106(x107)
      }
    })(t108(x109))
  })
  let t112 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t110), t111)
  lim_null_quat_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], op_minus_minus_gt(f, Hx(real_of_num(0)), net) → op_minus_minus_gt((x : A) => -f(x), Hx(real_of_num(0)), net)"), t112))
}

///|
let lim_null_quat_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_QUAT_NEG")

///|
/// `LIM_NULL_QUAT_NEG`
pub fn lim_null_quat_neg() -> @kernel.Thm {
  lim_null_quat_neg_c.get()
}

///|
/// LIM_NULL_QUAT_ADD
fn step_13() -> Unit raise {
  let t119 = @simp.rewrite_tac(@list.List([@quaternion.quat_add_lid()]))
  let t116 = @drule.match_mp(@topology.lim_add())
  let t118 = @tactics.disch_then(fn(x117 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s114 = @tactics.mp_tac(x113)
      fn(x115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s114(x115)
      }
    })(t116(x117))
  })
  let t120 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t118), t119)
  lim_null_quat_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ g : (A) -> Cart[Real, 4], op_minus_minus_gt(f, Hx(real_of_num(0)), net) && op_minus_minus_gt(g, Hx(real_of_num(0)), net) → op_minus_minus_gt((x : A) => f(x) + g(x), Hx(real_of_num(0)), net)"), t120))
}

///|
let lim_null_quat_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_QUAT_ADD")

///|
/// `LIM_NULL_QUAT_ADD`
pub fn lim_null_quat_add() -> @kernel.Thm {
  lim_null_quat_add_c.get()
}

///|
/// LIM_NULL_QUAT_SUB
fn step_14() -> Unit raise {
  let t127 = @simp.rewrite_tac(@list.List([@quaternion.quat_sub_refl()]))
  let t124 = @drule.match_mp(@topology.lim_sub())
  let t126 = @tactics.disch_then(fn(x125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x121 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s122 = @tactics.mp_tac(x121)
      fn(x123 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s122(x123)
      }
    })(t124(x125))
  })
  let t128 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t126), t127)
  lim_null_quat_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ g : (A) -> Cart[Real, 4], op_minus_minus_gt(f, Hx(real_of_num(0)), net) && op_minus_minus_gt(g, Hx(real_of_num(0)), net) → op_minus_minus_gt((x : A) => f(x) - g(x), Hx(real_of_num(0)), net)"), t128))
}

///|
let lim_null_quat_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_QUAT_SUB")

///|
/// `LIM_NULL_QUAT_SUB`
pub fn lim_null_quat_sub() -> @kernel.Thm {
  lim_null_quat_sub_c.get()
}

///|
/// LIM_NULL_QUAT_MUL
fn step_15() -> Unit raise {
  let t135 = @simp.rewrite_tac(@list.List([@quaternion.quat_mul_lzero()]))
  let t132 = @drule.match_mp(lim_quat_mul())
  let t134 = @tactics.disch_then(fn(x133 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s130 = @tactics.mp_tac(x129)
      fn(x131 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s130(x131)
      }
    })(t132(x133))
  })
  let t136 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t134), t135)
  lim_null_quat_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ g : (A) -> Cart[Real, 4], op_minus_minus_gt(f, Hx(real_of_num(0)), net) && op_minus_minus_gt(g, Hx(real_of_num(0)), net) → op_minus_minus_gt((x : A) => f(x) * g(x), Hx(real_of_num(0)), net)"), t136))
}

///|
let lim_null_quat_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_QUAT_MUL")

///|
/// `LIM_NULL_QUAT_MUL`
pub fn lim_null_quat_mul() -> @kernel.Thm {
  lim_null_quat_mul_c.get()
}

///|
/// LIM_NULL_QUAT_LMUL
fn step_16() -> Unit raise {
  let t138 = @simp.asm_simp_tac(@list.List([lim_quat_lmul()]))
  let t137 = @tactics.subst1_tac(@qnormalizer.quat_poly(@term_syntax.parse_term("Hx(real_of_num(0)) == (c : Cart[Real, 4]) * Hx(real_of_num(0))")))
  let t139 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t137), t138)
  lim_null_quat_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ c : Cart[Real, 4], op_minus_minus_gt(f, Hx(real_of_num(0)), net) → op_minus_minus_gt((x : A) => c * f(x), Hx(real_of_num(0)), net)"), t139))
}

///|
let lim_null_quat_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_QUAT_LMUL")

///|
/// `LIM_NULL_QUAT_LMUL`
pub fn lim_null_quat_lmul() -> @kernel.Thm {
  lim_null_quat_lmul_c.get()
}

///|
/// LIM_NULL_QUAT_RMUL
fn step_17() -> Unit raise {
  let t141 = @simp.asm_simp_tac(@list.List([lim_quat_rmul()]))
  let t140 = @tactics.subst1_tac(@qnormalizer.quat_poly(@term_syntax.parse_term("Hx(real_of_num(0)) == Hx(real_of_num(0)) * (c : Cart[Real, 4])")))
  let t142 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t140), t141)
  lim_null_quat_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ c : Cart[Real, 4], op_minus_minus_gt(f, Hx(real_of_num(0)), net) → op_minus_minus_gt((x : A) => f(x) * c, Hx(real_of_num(0)), net)"), t142))
}

///|
let lim_null_quat_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_QUAT_RMUL")

///|
/// `LIM_NULL_QUAT_RMUL`
pub fn lim_null_quat_rmul() -> @kernel.Thm {
  lim_null_quat_rmul_c.get()
}

///|
/// LIM_NULL_QUAT_POW
fn step_18() -> Unit raise {
  let t152 = @simp.asm_rewrite_tac(@list.List([@quaternion.quat_pow_zero()]))
  let t149 = @drule.match_mp(lim_quat_pow())
  let t146 = @term_syntax.parse_term("(n : Num)")
  let t151 = @tactics.first_x_assum(fn(x150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x143 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s144 = @tactics.mp_tac(x143)
        fn(x145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s144(x145)
        }
      })(((x147 : @kernel.Thm) => @bool.spec(t146, x147))(x148))
    })(t149(x150))
  })
  let t153 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t151), t152)
  lim_null_quat_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ n : Num, op_minus_minus_gt(f, Hx(real_of_num(0)), net) && !(n == 0) → op_minus_minus_gt((x : A) => pow(f(x), n), Hx(real_of_num(0)), net)"), t153))
}

///|
let lim_null_quat_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_QUAT_POW")

///|
/// `LIM_NULL_QUAT_POW`
pub fn lim_null_quat_pow() -> @kernel.Thm {
  lim_null_quat_pow_c.get()
}

///|
/// LIM_NULL_QUAT_BOUND
fn step_19() -> Unit raise {
  let t154 = @simp.rewrite_tac(@list.List([@equal.gsym(@quaternion.quat_vec_0()), @topology.lim_transform_bound()]))
  lim_null_quat_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ g : (A) -> Cart[Real, 4], eventually((n : A) => norm(f(n)) <= norm(g(n)), net) && op_minus_minus_gt(g, Hx(real_of_num(0)), net) → op_minus_minus_gt(f, Hx(real_of_num(0)), net)"), t154))
}

///|
let lim_null_quat_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_QUAT_BOUND")

///|
/// `LIM_NULL_QUAT_BOUND`
pub fn lim_null_quat_bound() -> @kernel.Thm {
  lim_null_quat_bound_c.get()
}

///|
/// SUMS_QUAT_0
fn step_20() -> Unit raise {
  let t155 = @simp.rewrite_tac(@list.List([@equal.gsym(@quaternion.quat_vec_0()), @topology.sums_0()]))
  sums_quat_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 4], ∀ s : (Num) -> Bool, (∀ n : Num, IN(n, s) → f(n) == Hx(real_of_num(0))) → sums(f, Hx(real_of_num(0)), s)"), t155))
}

///|
let sums_quat_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMS_QUAT_0")

///|
/// `SUMS_QUAT_0`
pub fn sums_quat_0() -> @kernel.Thm {
  sums_quat_0_c.get()
}

///|
/// LIM_NULL_QUAT_RMUL_BOUNDED
fn step_21() -> Unit raise {
  let t163 = @meson.asm_meson_tac(@list.List([]))
  let t162 = @tactics.match_mp_tac(@metric.eventually_mono())
  let t161 = @simp.asm_rewrite_tac(@list.List([@trivia.o_def(), @vectors.norm_lift(), @vectors.real_abs_norm()]))
  let t160 = @tactics.exists_tac(@term_syntax.parse_term("(B : Real)"))
  let t159 = @tactics.match_mp_tac(@topology.lim_null_vmul_bounded())
  let t158 = @tactics.repeat_tac(@tactics.strip_tac)
  let t157 = @simp.rewrite_tac(@list.List([@quaternion.quat_norm_mul(), @vectors.lift_cmul()]))
  let t156 = @simp.once_rewrite_tac(@list.List([@topology.lim_null_norm()]))
  let t164 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@quaternion.quat_vec_0())])), t156), t157), t158), t159), t160), t161), t162), t163)
  lim_null_quat_rmul_bounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Cart[Real, 4], ∀ g : (A) -> Cart[Real, 4], op_minus_minus_gt(f, Hx(real_of_num(0)), (net : Net[A])) && eventually((a : A) => norm(g(a)) <= (B : Real), net) → op_minus_minus_gt((z : A) => f(z) * g(z), Hx(real_of_num(0)), net)"), t164))
}

///|
let lim_null_quat_rmul_bounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_QUAT_RMUL_BOUNDED")

///|
/// `LIM_NULL_QUAT_RMUL_BOUNDED`
pub fn lim_null_quat_rmul_bounded() -> @kernel.Thm {
  lim_null_quat_rmul_bounded_c.get()
}

///|
/// LIM_NULL_QUAT_LMUL_BOUNDED
fn step_22() -> Unit raise {
  let t174 = @meson.asm_meson_tac(@list.List([]))
  let t173 = @tactics.match_mp_tac(@metric.eventually_mono())
  let t172 = @simp.asm_rewrite_tac(@list.List([@trivia.o_def(), @vectors.norm_lift(), @vectors.real_abs_norm()]))
  let t171 = @tactics.exists_tac(@term_syntax.parse_term("(B : Real)"))
  let t170 = @tactics.match_mp_tac(@topology.lim_null_vmul_bounded())
  let t169 = @tactics.repeat_tac(@tactics.strip_tac)
  let t168 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul()]))
  let t167 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t166 = @simp.rewrite_tac(@list.List([@quaternion.quat_norm_mul()]))
  let t165 = @simp.once_rewrite_tac(@list.List([@topology.lim_null_norm()]))
  let t175 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@quaternion.quat_vec_0())])), t165), t166), t167), t168), t169), t170), t171), t172), t173), t174)
  lim_null_quat_lmul_bounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ g : (A) -> Cart[Real, 4], eventually((a : A) => norm(f(a)) <= (B : Real), net) && op_minus_minus_gt(g, Hx(real_of_num(0)), net) → op_minus_minus_gt((z : A) => f(z) * g(z), Hx(real_of_num(0)), net)"), t175))
}

///|
let lim_null_quat_lmul_bounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_NULL_QUAT_LMUL_BOUNDED")

///|
/// `LIM_NULL_QUAT_LMUL_BOUNDED`
pub fn lim_null_quat_lmul_bounded() -> @kernel.Thm {
  lim_null_quat_lmul_bounded_c.get()
}

///|
/// LIM_QUAT_RE_UBOUND
fn step_23() -> Unit raise {
  let t182 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_4(), @calc_num.arith()]))
  let t177 = @term_syntax.parse_term("1")
  let t178 = @term_syntax.parse_term("(b : Real)")
  let t179 = @term_syntax.parse_term("(l : Cart[Real, 4])")
  let t180 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 4])")
  let t181 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t180, t179, t178, t177]), @topology.lim_component_ubound()))
  let t176 = @tactics.repeat_tac(@tactics.strip_tac)
  let t183 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_re_def()])), t176), t181), t182)
  lim_quat_re_ubound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => Re(f(x)) <= b, net) → Re(l) <= b"), t183))
}

///|
let lim_quat_re_ubound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_QUAT_RE_UBOUND")

///|
/// `LIM_QUAT_RE_UBOUND`
pub fn lim_quat_re_ubound() -> @kernel.Thm {
  lim_quat_re_ubound_c.get()
}

///|
/// LIM_IM1_UBOUND
fn step_24() -> Unit raise {
  let t190 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_4(), @calc_num.arith()]))
  let t185 = @term_syntax.parse_term("2")
  let t186 = @term_syntax.parse_term("(b : Real)")
  let t187 = @term_syntax.parse_term("(l : Cart[Real, 4])")
  let t188 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 4])")
  let t189 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t188, t187, t186, t185]), @topology.lim_component_ubound()))
  let t184 = @tactics.repeat_tac(@tactics.strip_tac)
  let t191 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_im1_def()])), t184), t189), t190)
  lim_im1_ubound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => Im1(f(x)) <= b, net) → Im1(l) <= b"), t191))
}

///|
let lim_im1_ubound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_IM1_UBOUND")

///|
/// `LIM_IM1_UBOUND`
pub fn lim_im1_ubound() -> @kernel.Thm {
  lim_im1_ubound_c.get()
}

///|
/// LIM_IM2_UBOUND
fn step_25() -> Unit raise {
  let t198 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_4(), @calc_num.arith()]))
  let t193 = @term_syntax.parse_term("3")
  let t194 = @term_syntax.parse_term("(b : Real)")
  let t195 = @term_syntax.parse_term("(l : Cart[Real, 4])")
  let t196 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 4])")
  let t197 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t196, t195, t194, t193]), @topology.lim_component_ubound()))
  let t192 = @tactics.repeat_tac(@tactics.strip_tac)
  let t199 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_im2_def()])), t192), t197), t198)
  lim_im2_ubound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => Im2(f(x)) <= b, net) → Im2(l) <= b"), t199))
}

///|
let lim_im2_ubound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_IM2_UBOUND")

///|
/// `LIM_IM2_UBOUND`
pub fn lim_im2_ubound() -> @kernel.Thm {
  lim_im2_ubound_c.get()
}

///|
/// LIM_IM3_UBOUND
fn step_26() -> Unit raise {
  let t206 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_4(), @calc_num.arith()]))
  let t201 = @term_syntax.parse_term("4")
  let t202 = @term_syntax.parse_term("(b : Real)")
  let t203 = @term_syntax.parse_term("(l : Cart[Real, 4])")
  let t204 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 4])")
  let t205 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t204, t203, t202, t201]), @topology.lim_component_ubound()))
  let t200 = @tactics.repeat_tac(@tactics.strip_tac)
  let t207 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_im3_def()])), t200), t205), t206)
  lim_im3_ubound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => Im3(f(x)) <= b, net) → Im3(l) <= b"), t207))
}

///|
let lim_im3_ubound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_IM3_UBOUND")

///|
/// `LIM_IM3_UBOUND`
pub fn lim_im3_ubound() -> @kernel.Thm {
  lim_im3_ubound_c.get()
}

///|
/// QUAT_LIM_UBOUND_COMPONENTS
fn step_27() -> Unit raise {
  quat_lim_ubound_components_c.set(@lib.end_itlist(@bool.conj, @list.List([lim_quat_re_ubound(), lim_im1_ubound(), lim_im2_ubound(), lim_im3_ubound()])))
}

///|
let quat_lim_ubound_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_LIM_UBOUND_COMPONENTS")

///|
/// `QUAT_LIM_UBOUND_COMPONENTS`
pub fn quat_lim_ubound_components() -> @kernel.Thm {
  quat_lim_ubound_components_c.get()
}

///|
/// LIM_QUAT_RE_LBOUND
fn step_28() -> Unit raise {
  let t214 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_4(), @calc_num.arith()]))
  let t209 = @term_syntax.parse_term("1")
  let t210 = @term_syntax.parse_term("(b : Real)")
  let t211 = @term_syntax.parse_term("(l : Cart[Real, 4])")
  let t212 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 4])")
  let t213 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t212, t211, t210, t209]), @topology.lim_component_lbound()))
  let t208 = @tactics.repeat_tac(@tactics.strip_tac)
  let t215 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_re_def()])), t208), t213), t214)
  lim_quat_re_lbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => b <= Re(f(x)), net) → b <= Re(l)"), t215))
}

///|
let lim_quat_re_lbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_QUAT_RE_LBOUND")

///|
/// `LIM_QUAT_RE_LBOUND`
pub fn lim_quat_re_lbound() -> @kernel.Thm {
  lim_quat_re_lbound_c.get()
}

///|
/// LIM_IM1_LBOUND
fn step_29() -> Unit raise {
  let t222 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_4(), @calc_num.arith()]))
  let t217 = @term_syntax.parse_term("2")
  let t218 = @term_syntax.parse_term("(b : Real)")
  let t219 = @term_syntax.parse_term("(l : Cart[Real, 4])")
  let t220 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 4])")
  let t221 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t220, t219, t218, t217]), @topology.lim_component_lbound()))
  let t216 = @tactics.repeat_tac(@tactics.strip_tac)
  let t223 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_im1_def()])), t216), t221), t222)
  lim_im1_lbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => b <= Im1(f(x)), net) → b <= Im1(l)"), t223))
}

///|
let lim_im1_lbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_IM1_LBOUND")

///|
/// `LIM_IM1_LBOUND`
pub fn lim_im1_lbound() -> @kernel.Thm {
  lim_im1_lbound_c.get()
}

///|
/// LIM_IM2_LBOUND
fn step_30() -> Unit raise {
  let t230 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_4(), @calc_num.arith()]))
  let t225 = @term_syntax.parse_term("3")
  let t226 = @term_syntax.parse_term("(b : Real)")
  let t227 = @term_syntax.parse_term("(l : Cart[Real, 4])")
  let t228 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 4])")
  let t229 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t228, t227, t226, t225]), @topology.lim_component_lbound()))
  let t224 = @tactics.repeat_tac(@tactics.strip_tac)
  let t231 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_im2_def()])), t224), t229), t230)
  lim_im2_lbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => b <= Im2(f(x)), net) → b <= Im2(l)"), t231))
}

///|
let lim_im2_lbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_IM2_LBOUND")

///|
/// `LIM_IM2_LBOUND`
pub fn lim_im2_lbound() -> @kernel.Thm {
  lim_im2_lbound_c.get()
}

///|
/// LIM_IM3_LBOUND
fn step_31() -> Unit raise {
  let t238 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_4(), @calc_num.arith()]))
  let t233 = @term_syntax.parse_term("4")
  let t234 = @term_syntax.parse_term("(b : Real)")
  let t235 = @term_syntax.parse_term("(l : Cart[Real, 4])")
  let t236 = @term_syntax.parse_term("(f : (A) -> Cart[Real, 4])")
  let t237 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(net : Net[A])"), t236, t235, t234, t233]), @topology.lim_component_lbound()))
  let t232 = @tactics.repeat_tac(@tactics.strip_tac)
  let t239 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_im3_def()])), t232), t237), t238)
  lim_im3_lbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ b : Real, !trivial_limit(net) && op_minus_minus_gt(f, l, net) && eventually((x : A) => b <= Im3(f(x)), net) → b <= Im3(l)"), t239))
}

///|
let lim_im3_lbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_IM3_LBOUND")

///|
/// `LIM_IM3_LBOUND`
pub fn lim_im3_lbound() -> @kernel.Thm {
  lim_im3_lbound_c.get()
}

///|
/// QUAT_LIM_LBOUND_COMPONENTS
fn step_32() -> Unit raise {
  quat_lim_lbound_components_c.set(@lib.end_itlist(@bool.conj, @list.List([lim_quat_re_lbound(), lim_im1_lbound(), lim_im2_lbound(), lim_im3_lbound()])))
}

///|
let quat_lim_lbound_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_LIM_LBOUND_COMPONENTS")

///|
/// `QUAT_LIM_LBOUND_COMPONENTS`
pub fn quat_lim_lbound_components() -> @kernel.Thm {
  quat_lim_lbound_components_c.get()
}

///|
/// SERIES_QUAT_LMUL
fn step_33() -> Unit raise {
  let t246 = @simp.rewrite_tac(@list.List([@quaternion.linear_quat_lmul()]))
  let t245 = @simp.gen_rewrite_tac(fn(x242 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s243 = @equal.rand_conv(x242)
    fn(x244 : @kernel.Term) -> @kernel.Thm raise {
      s243(x244)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t241 = @simp.asm_rewrite_tac(@list.List([]))
  let t240 = @tactics.match_mp_tac(@topology.series_linear())
  let t247 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t240), t241), t245), t246)
  series_quat_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ c : Cart[Real, 4], ∀ s : (Num) -> Bool, sums(f, l, s) → sums((x : Num) => c * f(x), c * l, s)"), t247))
}

///|
let series_quat_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_QUAT_LMUL")

///|
/// `SERIES_QUAT_LMUL`
pub fn series_quat_lmul() -> @kernel.Thm {
  series_quat_lmul_c.get()
}

///|
/// SERIES_QUAT_RMUL
fn step_34() -> Unit raise {
  let t258 = @simp.rewrite_tac(@list.List([@quaternion.linear_quat_rmul()]))
  let t257 = @simp.gen_rewrite_tac(fn(x254 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s255 = @equal.rand_conv(x254)
    fn(x256 : @kernel.Term) -> @kernel.Thm raise {
      s255(x256)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t253 = @simp.asm_rewrite_tac(@list.List([]))
  let t252 = @tactics.match_mp_tac(@topology.series_linear())
  let t251 = @tactics.subgoal_then(@term_syntax.parse_term("sums((x : Num) => ((y : Cart[Real, 4]) => y * (c : Cart[Real, 4]))((f : (Num) -> Cart[Real, 4])(x)), ((y : Cart[Real, 4]) => y * c)((l : Cart[Real, 4])), (s : (Num) -> Bool))"), fn(x248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x248
    let t250 = @simp.rewrite_tac(@list.List([]))
    @tactics.then_tac(@tactics.mp_tac(th), t250)
  })
  let t259 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t251), t252), t253), t257), t258)
  series_quat_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 4], ∀ l : Cart[Real, 4], ∀ c : Cart[Real, 4], ∀ s : (Num) -> Bool, sums(f, l, s) → sums((x : Num) => f(x) * c, l * c, s)"), t259))
}

///|
let series_quat_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SERIES_QUAT_RMUL")

///|
/// `SERIES_QUAT_RMUL`
pub fn series_quat_rmul() -> @kernel.Thm {
  series_quat_rmul_c.get()
}

///|
/// SUMMABLE_QUAT_LMUL
fn step_35() -> Unit raise {
  let t260 = @meson.meson_tac(@list.List([series_quat_lmul()]))
  let t261 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.summable()])), t260)
  summable_quat_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 4], ∀ c : Cart[Real, 4], ∀ s : (Num) -> Bool, summable(s, f) → summable(s, (x : Num) => c * f(x))"), t261))
}

///|
let summable_quat_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_QUAT_LMUL")

///|
/// `SUMMABLE_QUAT_LMUL`
pub fn summable_quat_lmul() -> @kernel.Thm {
  summable_quat_lmul_c.get()
}

///|
/// SUMMABLE_QUAT_RMUL
fn step_36() -> Unit raise {
  let t262 = @meson.meson_tac(@list.List([series_quat_rmul()]))
  let t263 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.summable()])), t262)
  summable_quat_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Cart[Real, 4], ∀ c : Cart[Real, 4], ∀ s : (Num) -> Bool, summable(s, f) → summable(s, (x : Num) => f(x) * c)"), t263))
}

///|
let summable_quat_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_QUAT_RMUL")

///|
/// `SUMMABLE_QUAT_RMUL`
pub fn summable_quat_rmul() -> @kernel.Thm {
  summable_quat_rmul_c.get()
}

///|
/// CONTINUOUS_QUAT_MUL
fn step_37() -> Unit raise {
  let t264 = @simp.simp_tac(@list.List([@topology.continuous(), lim_quat_mul()]))
  continuous_quat_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ g : (A) -> Cart[Real, 4], continuous(f, net) && continuous(g, net) → continuous((x : A) => f(x) * g(x), net)"), t264))
}

///|
let continuous_quat_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_QUAT_MUL")

///|
/// `CONTINUOUS_QUAT_MUL`
pub fn continuous_quat_mul() -> @kernel.Thm {
  continuous_quat_mul_c.get()
}

///|
/// CONTINUOUS_QUAT_INV
fn step_38() -> Unit raise {
  let t265 = @simp.simp_tac(@list.List([@topology.continuous(), lim_quat_inv()]))
  continuous_quat_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], continuous(f, net) && !(f(netlimit(net)) == Hx(real_of_num(0))) → continuous((x : A) => inv(f(x)), net)"), t265))
}

///|
let continuous_quat_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_QUAT_INV")

///|
/// `CONTINUOUS_QUAT_INV`
pub fn continuous_quat_inv() -> @kernel.Thm {
  continuous_quat_inv_c.get()
}

///|
/// CONTINUOUS_QUAT_POW
fn step_39() -> Unit raise {
  let t266 = @simp.simp_tac(@list.List([@topology.continuous(), lim_quat_pow()]))
  continuous_quat_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 4], ∀ n : Num, continuous(f, net) → continuous((x : A) => pow(f(x), n), net)"), t266))
}

///|
let continuous_quat_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_QUAT_POW")

///|
/// `CONTINUOUS_QUAT_POW`
pub fn continuous_quat_pow() -> @kernel.Thm {
  continuous_quat_pow_c.get()
}

///|
/// CONTINUOUS_QUAT_INV_WITHIN
fn step_40() -> Unit raise {
  let t267 = @meson.meson_tac(@list.List([continuous_quat_inv(), @topology.continuous_trivial_limit(), @topology.netlimit_within()]))
  continuous_quat_inv_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 4], ∀ s : (Cart[Real, N]) -> Bool, ∀ a : Cart[Real, N], continuous(f, within(at(a), s)) && !(f(a) == Hx(real_of_num(0))) → continuous((x : Cart[Real, N]) => inv(f(x)), within(at(a), s))"), t267))
}

///|
let continuous_quat_inv_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_QUAT_INV_WITHIN")

///|
/// `CONTINUOUS_QUAT_INV_WITHIN`
pub fn continuous_quat_inv_within() -> @kernel.Thm {
  continuous_quat_inv_within_c.get()
}

///|
/// CONTINUOUS_QUAT_INV_AT
fn step_41() -> Unit raise {
  let t268 = @simp.simp_tac(@list.List([continuous_quat_inv(), @topology.netlimit_at()]))
  continuous_quat_inv_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 4], ∀ a : Cart[Real, N], continuous(f, at(a)) && !(f(a) == Hx(real_of_num(0))) → continuous((x : Cart[Real, N]) => inv(f(x)), at(a))"), t268))
}

///|
let continuous_quat_inv_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_QUAT_INV_AT")

///|
/// `CONTINUOUS_QUAT_INV_AT`
pub fn continuous_quat_inv_at() -> @kernel.Thm {
  continuous_quat_inv_at_c.get()
}

///|
/// CONTINUOUS_ON_QUAT_MUL
fn step_42() -> Unit raise {
  let t269 = @simp.simp_tac(@list.List([continuous_quat_mul()]))
  let t270 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous_on_eq_continuous_within()])), t269)
  continuous_on_quat_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 4], ∀ g : (Cart[Real, N]) -> Cart[Real, 4], ∀ s : (Cart[Real, N]) -> Bool, continuous_on(f, s) && continuous_on(g, s) → continuous_on((x : Cart[Real, N]) => f(x) * g(x), s)"), t270))
}

///|
let continuous_on_quat_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_QUAT_MUL")

///|
/// `CONTINUOUS_ON_QUAT_MUL`
pub fn continuous_on_quat_mul() -> @kernel.Thm {
  continuous_on_quat_mul_c.get()
}

///|
/// CONTINUOUS_ON_QUAT_LMUL
fn step_43() -> Unit raise {
  let t271 = @simp.simp_tac(@list.List([lim_quat_mul(), @topology.lim_const()]))
  let t272 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous_on_v1()])), t271)
  continuous_on_quat_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 4], ∀ s : (Cart[Real, N]) -> Bool, continuous_on(f, s) → continuous_on((x : Cart[Real, N]) => (c : Cart[Real, 4]) * f(x), s)"), t272))
}

///|
let continuous_on_quat_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_QUAT_LMUL")

///|
/// `CONTINUOUS_ON_QUAT_LMUL`
pub fn continuous_on_quat_lmul() -> @kernel.Thm {
  continuous_on_quat_lmul_c.get()
}

///|
/// CONTINUOUS_ON_QUAT_RMUL
fn step_44() -> Unit raise {
  let t273 = @simp.simp_tac(@list.List([lim_quat_mul(), @topology.lim_const()]))
  let t274 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous_on_v1()])), t273)
  continuous_on_quat_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 4], ∀ s : (Cart[Real, N]) -> Bool, continuous_on(f, s) → continuous_on((x : Cart[Real, N]) => f(x) * (c : Cart[Real, 4]), s)"), t274))
}

///|
let continuous_on_quat_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_QUAT_RMUL")

///|
/// `CONTINUOUS_ON_QUAT_RMUL`
pub fn continuous_on_quat_rmul() -> @kernel.Thm {
  continuous_on_quat_rmul_c.get()
}

///|
/// CONTINUOUS_ON_QUAT_INV
fn step_45() -> Unit raise {
  let t275 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_quat_inv_within()]))
  continuous_on_quat_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 4], continuous_on(f, (s : (Cart[Real, N]) -> Bool)) && (∀ x : Cart[Real, N], IN(x, s) → !(f(x) == Hx(real_of_num(0)))) → continuous_on((x : Cart[Real, N]) => inv(f(x)), s)"), t275))
}

///|
let continuous_on_quat_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_QUAT_INV")

///|
/// `CONTINUOUS_ON_QUAT_INV`
pub fn continuous_on_quat_inv() -> @kernel.Thm {
  continuous_on_quat_inv_c.get()
}

///|
/// CONTINUOUS_ON_QUAT_POW
fn step_46() -> Unit raise {
  let t276 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_quat_pow()]))
  continuous_on_quat_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 4], ∀ n : Num, ∀ s : (Cart[Real, N]) -> Bool, continuous_on(f, s) → continuous_on((x : Cart[Real, N]) => pow(f(x), n), s)"), t276))
}

///|
let continuous_on_quat_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_QUAT_POW")

///|
/// `CONTINUOUS_ON_QUAT_POW`
pub fn continuous_on_quat_pow() -> @kernel.Thm {
  continuous_on_quat_pow_c.get()
}

///|
/// CONTINUOUS_AT_HX_NORM
fn step_47() -> Unit raise {
  let t277 = @meson.meson_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("norm((a : Cart[Real, N]) - (b : Cart[Real, N])) < (d : Real) → abs(norm(a) - norm(b)) < d"))]))
  let t278 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous_at_v1(), @vectors.dist(), @equal.gsym(@quaternion.hx_sub()), @quaternion.norm_hx()])), t277)
  continuous_at_hx_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, N], continuous((z : Cart[Real, N]) => Hx(norm(z)), at(z))"), t278))
}

///|
let continuous_at_hx_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_HX_NORM")

///|
/// `CONTINUOUS_AT_HX_NORM`
pub fn continuous_at_hx_norm() -> @kernel.Thm {
  continuous_at_hx_norm_c.get()
}

///|
/// CONTINUOUS_WITHIN_HX_NORM
fn step_48() -> Unit raise {
  let t279 = @simp.simp_tac(@list.List([continuous_at_hx_norm(), @topology.continuous_at_within()]))
  continuous_within_hx_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, continuous((z : Cart[Real, N]) => Hx(norm(z)), within(at(z), s))"), t279))
}

///|
let continuous_within_hx_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_WITHIN_HX_NORM")

///|
/// `CONTINUOUS_WITHIN_HX_NORM`
pub fn continuous_within_hx_norm() -> @kernel.Thm {
  continuous_within_hx_norm_c.get()
}

///|
/// CONTINUOUS_ON_HX_NORM
fn step_49() -> Unit raise {
  let t280 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_within_hx_norm()]))
  continuous_on_hx_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, continuous_on((z : Cart[Real, N]) => Hx(norm(z)), s)"), t280))
}

///|
let continuous_on_hx_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_HX_NORM")

///|
/// `CONTINUOUS_ON_HX_NORM`
pub fn continuous_on_hx_norm() -> @kernel.Thm {
  continuous_on_hx_norm_c.get()
}

///|
/// CONTINUOUS_AT_HX_DOT
fn step_50() -> Unit raise {
  let t282 = @simp.rewrite_tac(@list.List([@vectors.linear(), @vectors.dot_radd(), @vectors.dot_rmul(), @quaternion.hx_add(), @quaternion.quat_cmul(), @quaternion.hx_mul()]))
  let t281 = @tactics.match_mp_tac(@topology.linear_continuous_at())
  let t283 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t281), t282)
  continuous_at_hx_dot_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, N], ∀ z : Cart[Real, N], continuous((z : Cart[Real, N]) => Hx(dot(c, z)), at(z))"), t283))
}

///|
let continuous_at_hx_dot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_HX_DOT")

///|
/// `CONTINUOUS_AT_HX_DOT`
pub fn continuous_at_hx_dot() -> @kernel.Thm {
  continuous_at_hx_dot_c.get()
}

///|
/// CONTINUOUS_WITHIN_HX_DOT
fn step_51() -> Unit raise {
  let t284 = @simp.simp_tac(@list.List([continuous_at_hx_dot(), @topology.continuous_at_within()]))
  continuous_within_hx_dot_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, N], ∀ z : Cart[Real, N], ∀ s : (Cart[Real, N]) -> Bool, continuous((z : Cart[Real, N]) => Hx(dot(c, z)), within(at(z), s))"), t284))
}

///|
let continuous_within_hx_dot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_WITHIN_HX_DOT")

///|
/// `CONTINUOUS_WITHIN_HX_DOT`
pub fn continuous_within_hx_dot() -> @kernel.Thm {
  continuous_within_hx_dot_c.get()
}

///|
/// CONTINUOUS_ON_HX_DOT
fn step_52() -> Unit raise {
  let t285 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_within_hx_dot()]))
  continuous_on_hx_dot_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, ∀ c : Cart[Real, N], continuous_on((z : Cart[Real, N]) => Hx(dot(c, z)), s)"), t285))
}

///|
let continuous_on_hx_dot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_HX_DOT")

///|
/// `CONTINUOUS_ON_HX_DOT`
pub fn continuous_on_hx_dot() -> @kernel.Thm {
  continuous_on_hx_dot_c.get()
}

///|
/// CONTINUOUS_HX_DROP
fn step_53() -> Unit raise {
  let t288 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.norm_1())]))
  let t286 = @equal.gsym(@vectors.drop_sub())
  let t287 = @simp.rewrite_tac(@list.List([@vectors.dist(), @equal.gsym(@quaternion.hx_sub()), @quaternion.norm_hx(), t286]))
  let t289 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous(), @topology.tendsto()])), t287), t288)
  continuous_hx_drop_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, Unit], continuous(f, net) → continuous((x : A) => Hx(drop(f(x))), net)"), t289))
}

///|
let continuous_hx_drop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_HX_DROP")

///|
/// `CONTINUOUS_HX_DROP`
pub fn continuous_hx_drop() -> @kernel.Thm {
  continuous_hx_drop_c.get()
}

///|
/// CONTINUOUS_ON_HX_DROP
fn step_54() -> Unit raise {
  let t290 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_hx_drop()]))
  continuous_on_hx_drop_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, Unit], ∀ s : (Cart[Real, N]) -> Bool, continuous_on(f, s) → continuous_on((x : Cart[Real, N]) => Hx(drop(f(x))), s)"), t290))
}

///|
let continuous_on_hx_drop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_HX_DROP")

///|
/// `CONTINUOUS_ON_HX_DROP`
pub fn continuous_on_hx_drop() -> @kernel.Thm {
  continuous_on_hx_drop_c.get()
}

///|
/// CONTINUOUS_HX_LIFT
fn step_55() -> Unit raise {
  let t292 = @simp.rewrite_tac(@list.List([@quaternion.norm_hx(), @vectors.norm_lift()]))
  let t291 = @equal.gsym(@vectors.lift_sub())
  let t293 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.continuous(), @topology.tendsto(), @vectors.dist(), @equal.gsym(@quaternion.hx_sub()), t291])), t292)
  continuous_hx_lift_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, continuous((x : A) => Hx(f(x)), (net : Net[A])) == continuous((x : A) => lift(f(x)), net)"), t293))
}

///|
let continuous_hx_lift_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_HX_LIFT")

///|
/// `CONTINUOUS_HX_LIFT`
pub fn continuous_hx_lift() -> @kernel.Thm {
  continuous_hx_lift_c.get()
}

///|
/// CONTINUOUS_ON_HX_LIFT
fn step_56() -> Unit raise {
  let t294 = @simp.rewrite_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_hx_lift()]))
  continuous_on_hx_lift_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Real, ∀ s : (Cart[Real, N]) -> Bool, continuous_on((x : Cart[Real, N]) => Hx(f(x)), s) == continuous_on((x : Cart[Real, N]) => lift(f(x)), s)"), t294))
}

///|
let continuous_on_hx_lift_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_HX_LIFT")

///|
/// `CONTINUOUS_ON_HX_LIFT`
pub fn continuous_on_hx_lift() -> @kernel.Thm {
  continuous_on_hx_lift_c.get()
}

///|
/// LINEAR_QUAT_COMPONENTS
fn step_57() -> Unit raise {
  let t295 = @simp.rewrite_tac(@list.List([@vectors.linear(), @trivia.o_thm(), @quaternion.quat_add_components(), @quaternion.quat_cmul_components(), @quaternion.hx_add(), @quaternion.hx_mul(), @quaternion.quat_cmul()]))
  linear_quat_components_c.set(@tactics.prove(@term_syntax.parse_term("(linear : ((Cart[Real, 4]) -> Cart[Real, 4]) -> Bool)((o : ((Real) -> Cart[Real, 4], (Cart[Real, 4]) -> Real, Cart[Real, 4]) -> Cart[Real, 4])(Hx, Re)) && (linear : ((Cart[Real, 4]) -> Cart[Real, 4]) -> Bool)((o : ((Real) -> Cart[Real, 4], (Cart[Real, 4]) -> Real, Cart[Real, 4]) -> Cart[Real, 4])(Hx, Im1)) && (linear : ((Cart[Real, 4]) -> Cart[Real, 4]) -> Bool)((o : ((Real) -> Cart[Real, 4], (Cart[Real, 4]) -> Real, Cart[Real, 4]) -> Cart[Real, 4])(Hx, Im2)) && (linear : ((Cart[Real, 4]) -> Cart[Real, 4]) -> Bool)((o : ((Real) -> Cart[Real, 4], (Cart[Real, 4]) -> Real, Cart[Real, 4]) -> Cart[Real, 4])(Hx, Im3))"), t295))
}

///|
let linear_quat_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINEAR_QUAT_COMPONENTS")

///|
/// `LINEAR_QUAT_COMPONENTS`
pub fn linear_quat_components() -> @kernel.Thm {
  linear_quat_components_c.get()
}

///|
/// CONTINUOUS_AT_QUAT_COMPONENTS
fn step_58() -> Unit raise {
  let t297 = @simp.rewrite_tac(@list.List([linear_quat_components()]))
  let t296 = @tactics.match_mp_tac(@topology.linear_continuous_at())
  let t298 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t296), t297)
  continuous_at_quat_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ q : Cart[Real, 4], continuous(o(Hx, Re), at(q))) && (∀ q : Cart[Real, 4], continuous(o(Hx, Im1), at(q))) && (∀ q : Cart[Real, 4], continuous(o(Hx, Im2), at(q))) && (∀ q : Cart[Real, 4], continuous(o(Hx, Im3), at(q)))"), t298))
}

///|
let continuous_at_quat_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_AT_QUAT_COMPONENTS")

///|
/// `CONTINUOUS_AT_QUAT_COMPONENTS`
pub fn continuous_at_quat_components() -> @kernel.Thm {
  continuous_at_quat_components_c.get()
}

///|
/// CONTINUOUS_ON_QUAT_COMPONENTS
fn step_59() -> Unit raise {
  let t300 = @simp.rewrite_tac(@list.List([linear_quat_components()]))
  let t299 = @tactics.match_mp_tac(@topology.linear_continuous_on())
  let t301 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t299), t300)
  continuous_on_quat_components_c.set(@tactics.prove(@term_syntax.parse_term("(∀ s : (Cart[Real, 4]) -> Bool, continuous_on(o(Hx, Re), s)) && (∀ s : (Cart[Real, 4]) -> Bool, continuous_on(o(Hx, Im1), s)) && (∀ s : (Cart[Real, 4]) -> Bool, continuous_on(o(Hx, Im2), s)) && (∀ s : (Cart[Real, 4]) -> Bool, continuous_on(o(Hx, Im3), s))"), t301))
}

///|
let continuous_on_quat_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_QUAT_COMPONENTS")

///|
/// `CONTINUOUS_ON_QUAT_COMPONENTS`
pub fn continuous_on_quat_components() -> @kernel.Thm {
  continuous_on_quat_components_c.get()
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
}
