// Translated from upstream 100/green.ml; edit this file directly.

///|
/// 100/green.ml:55
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// wirtinger_dbar
fn step_2() -> Unit raise {
  wirtinger_dbar_c.set(@pair.new_definition(@term_syntax.parse_term("(wirtinger_dbar : ((Cart[Real, 2]) -> Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])((f : (Cart[Real, 2]) -> Cart[Real, 2]), (z : Cart[Real, 2])) == complex((op_dollar(op_dollar(jacobian(f, at(z)), 1), 1) - op_dollar(op_dollar(jacobian(f, at(z)), 2), 2), op_dollar(op_dollar(jacobian(f, at(z)), 2), 1) + op_dollar(op_dollar(jacobian(f, at(z)), 1), 2))) / Cx(real_of_num(2))")))
}

///|
let wirtinger_dbar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("wirtinger_dbar")

///|
/// `wirtinger_dbar`
pub fn wirtinger_dbar() -> @kernel.Thm {
  wirtinger_dbar_c.get()
}

///|
/// wirtinger_dz
fn step_3() -> Unit raise {
  wirtinger_dz_c.set(@pair.new_definition(@term_syntax.parse_term("(wirtinger_dz : ((Cart[Real, 2]) -> Cart[Real, 2], Cart[Real, 2]) -> Cart[Real, 2])((f : (Cart[Real, 2]) -> Cart[Real, 2]), (z : Cart[Real, 2])) == complex((op_dollar(op_dollar(jacobian(f, at(z)), 1), 1) + op_dollar(op_dollar(jacobian(f, at(z)), 2), 2), op_dollar(op_dollar(jacobian(f, at(z)), 2), 1) - op_dollar(op_dollar(jacobian(f, at(z)), 1), 2))) / Cx(real_of_num(2))")))
}

///|
let wirtinger_dz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("wirtinger_dz")

///|
/// `wirtinger_dz`
pub fn wirtinger_dz() -> @kernel.Thm {
  wirtinger_dz_c.get()
}

///|
/// WIRTINGER_DBAR_EQ_ZERO
fn step_4() -> Unit raise {
  let t3 = @simp.asm_rewrite_tac(@list.List([]))
  let t2 = @simp.rewrite_tac(@list.List([@canal.cauchy_riemann()]))
  let t1 = @simp.rewrite_tac(@list.List([wirtinger_dbar(), @complexes.complex_eq(), @complexes.re_div_cx(), @complexes.im_div_cx(), @complexes.re(), @complexes.im(), @complexes.re_cx(), @complexes.im_cx()]))
  let t4 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1), t2), t3), @calc_rat.real_arith_tac)
  wirtinger_dbar_eq_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], differentiable(f, at(z)) → (wirtinger_dbar(f, z) == Cx(real_of_num(0))) == complex_differentiable(f, at(z))"), t4))
}

///|
let wirtinger_dbar_eq_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WIRTINGER_DBAR_EQ_ZERO")

///|
/// `WIRTINGER_DBAR_EQ_ZERO`
pub fn wirtinger_dbar_eq_zero() -> @kernel.Thm {
  wirtinger_dbar_eq_zero_c.get()
}

///|
/// WIRTINGER_DZ_COMPLEX_DERIVATIVE
fn step_5() -> Unit raise {
  let t20 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re_div_cx(), @complexes.im_div_cx(), @complexes.re(), @complexes.im()]))
  let t19 = @tactics.disch_then(fn(x16 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s17 = @tactics.subst1_tac(x16)
    fn(x18 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s17(x18)
    }
  })
  let t15 = @simp.rewrite_tac(@list.List([wirtinger_dz()]))
  let t12 = @simp.gen_rewrite_rule(fn(x11 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x11
  }, @list.List([@canal.cauchy_riemann()]))
  let t14 = @tactics.first_assum(fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t12(x13))
  })
  let t8 = @drule.match_mp(@canal.complex_derivative_jacobian())
  let t10 = @tactics.first_assum(fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x5 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s6 = @tactics.mp_tac(x5)
      fn(x7 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s6(x7)
      }
    })(t8(x9))
  })
  let t21 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t10), t14), t15), t19), t20), @calc_rat.real_arith_tac)
  wirtinger_dz_complex_derivative_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], complex_differentiable(f, at(z)) → wirtinger_dz(f, z) == complex_derivative(f, z)"), t21))
}

///|
let wirtinger_dz_complex_derivative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WIRTINGER_DZ_COMPLEX_DERIVATIVE")

///|
/// `WIRTINGER_DZ_COMPLEX_DERIVATIVE`
pub fn wirtinger_dz_complex_derivative() -> @kernel.Thm {
  wirtinger_dz_complex_derivative_c.get()
}

///|
/// FRECHET_WIRTINGER
fn step_6() -> Unit raise {
  let t40 = @equal.gsym(@complexes.im_def())
  let t41 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t40]))
  let t39 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith()]))
  let t38 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @complexes.im_def()]))
  let t37 = @simp.rewrite_tac(@list.List([@complexes.cnj(), @complexes.complex_mul(), @complexes.complex_add(), @complexes.re(), @complexes.im(), @complexes.re_div_cx(), @complexes.im_div_cx(), @vectors.matrix_vector_mul(), @cart.dimindex_2(), @vectors.sum_2()]))
  let t36 = @simp.rewrite_tac(@list.List([@complexes.complex_eq()]))
  let t35 = @simp.rewrite_tac(@list.List([wirtinger_dz(), wirtinger_dbar()]))
  let t33 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@derivatives.jacobian_works())]))
  let t32 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t31 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"))
  let t34 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.frechet_derivative_unique_at()), t31), t32), t33), @tactics.all_tac])
  let t30 = @tactics.subgoal_then(@term_syntax.parse_term("(f' : (Cart[Real, 2]) -> Cart[Real, 2]) == ((h : Cart[Real, 2]) => matrix_vector_mul(jacobian((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z : Cart[Real, 2]))), h))"), fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s28 = @tactics.subst1_tac(x27)
    fn(x29 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s28(x29)
    }
  })
  let t26 = @list.List([@meson.asm_meson_tac(@list.List([@derivatives.differentiable()])), @tactics.all_tac])
  let t25 = @tactics.subgoal_then(@term_syntax.parse_term("differentiable((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z : Cart[Real, 2])))"), fn(x22 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s23 = @tactics.assume_tac(x22)
    fn(x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s23(x24)
    }
  })
  let t42 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t25), t26), t30), t34), t35), t36), t37), t38), t39), t41), @calc_rat.real_arith_tac)
  frechet_wirtinger_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ f' : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], has_derivative(f, f', at(z)) → (∀ h : Cart[Real, 2], f'(h) == wirtinger_dz(f, z) * h + wirtinger_dbar(f, z) * cnj(h))"), t42))
}

///|
let frechet_wirtinger_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRECHET_WIRTINGER")

///|
/// `FRECHET_WIRTINGER`
pub fn frechet_wirtinger() -> @kernel.Thm {
  frechet_wirtinger_c.get()
}

///|
/// HAS_DERIVATIVE_CNJ
fn step_7() -> Unit raise {
  let t43 = @simp.rewrite_tac(@list.List([@complexes.linear_cnj()]))
  let t44 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@derivatives.has_derivative_linear())), t43)
  has_derivative_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], has_derivative(cnj, cnj, at(z))"), t44))
}

///|
let has_derivative_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_DERIVATIVE_CNJ")

///|
/// `HAS_DERIVATIVE_CNJ`
pub fn has_derivative_cnj() -> @kernel.Thm {
  has_derivative_cnj_c.get()
}

///|
/// JACOBIAN_CNJ
fn step_8() -> Unit raise {
  let t62 = @simp.rewrite_tac(@list.List([@vectors.matrix_of_matrix_vector_mul()]))
  let t60 = @equal.gsym(@complexes.im_def())
  let t61 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t60, @complexes.re(), @complexes.im()]))
  let t59 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith(), @vectors.vector_2()]))
  let t58 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @complexes.im_def()]))
  let t57 = @simp.rewrite_tac(@list.List([@complexes.cnj(), @vectors.matrix_vector_mul(), @cart.dimindex_2(), @vectors.sum_2()]))
  let t56 = @simp.rewrite_tac(@list.List([@complexes.complex_eq()]))
  let t55 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t63 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t55), t56), t57), t58), t59), t61), @calc_rat.real_arith_tac), t62])
  let t54 = @tactics.subgoal_then(@term_syntax.parse_term("cnj == ((x : Cart[Real, 2]) => matrix_vector_mul(vector([vector([real_of_num(1), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1)])]), x))"), fn(x51 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s52 = @tactics.subst1_tac(x51)
    fn(x53 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s52(x53)
    }
  })
  let t49 = @simp.rewrite_tac(@list.List([has_derivative_cnj()]))
  let t50 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_frechet_derivative_unique_at()), t49), @tactics.all_tac])
  let t48 = @tactics.subgoal_then(@term_syntax.parse_term("frechet_derivative(cnj, at((z : Cart[Real, 2]))) == cnj"), fn(x45 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s46 = @tactics.subst1_tac(x45)
    fn(x47 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s46(x47)
    }
  })
  let t64 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@derivatives.jacobian()]))), t48), t50), t54), t63)
  jacobian_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ z : Cart[Real, 2], jacobian(cnj, at(z)) == vector([vector([real_of_num(1), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1)])])"), t64))
}

///|
let jacobian_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("JACOBIAN_CNJ")

///|
/// `JACOBIAN_CNJ`
pub fn jacobian_cnj() -> @kernel.Thm {
  jacobian_cnj_c.get()
}

///|
/// WIRTINGER_DBAR_CNJ
fn step_9() -> Unit raise {
  let t67 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_eq(), @complexes.re(), @complexes.im(), @complexes.complex_mul(), @complexes.complex_inv(), @complexes.re_cx(), @complexes.im_cx()]))
  let t66 = @tactics.conv_tac(@equal.once_depth_conv(@calc_rat.real_rat_reduce_conv))
  let t65 = @simp.rewrite_tac(@list.List([@complexes.cx_def()]))
  let t68 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), wirtinger_dbar(), jacobian_cnj(), @vectors.vector_2()])), t65), t66), t67), @calc_rat.real_arith_tac)
  wirtinger_dbar_cnj_c.set(@tactics.prove(@term_syntax.parse_term("wirtinger_dbar(cnj) == ((z : Cart[Real, 2]) => Cx(real_of_num(1)))"), t68))
}

///|
let wirtinger_dbar_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WIRTINGER_DBAR_CNJ")

///|
/// `WIRTINGER_DBAR_CNJ`
pub fn wirtinger_dbar_cnj() -> @kernel.Thm {
  wirtinger_dbar_cnj_c.get()
}

///|
/// WIRTINGER_DBAR_I
fn step_10() -> Unit raise {
  let t69 = @simp.simp_tac(@list.List([@trivia.i_def(), @class.fun_eq_thm(), @derivatives.differentiable_id(), wirtinger_dbar_eq_zero(), @canal.complex_differentiable_id()]))
  wirtinger_dbar_i_c.set(@tactics.prove(@term_syntax.parse_term("wirtinger_dbar(I) == ((z : Cart[Real, 2]) => Cx(real_of_num(0)))"), t69))
}

///|
let wirtinger_dbar_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WIRTINGER_DBAR_I")

///|
/// `WIRTINGER_DBAR_I`
pub fn wirtinger_dbar_i() -> @kernel.Thm {
  wirtinger_dbar_i_c.get()
}

///|
/// WIRTINGER_DBAR_FRECHET
fn step_11() -> Unit raise {
  let t80 = @equal.gsym(@complexes.im_def())
  let t81 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t80]))
  let t79 = @simp.simp_tac(@list.List([@vectors.vector_2(), @cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith()]))
  let t78 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @complexes.im_def()]))
  let t76 = @equal.gsym(@complexes.im_def())
  let t77 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t76, @complexes.ii(), @complexes.cx_def(), @complexes.complex()]))
  let t75 = @simp.rewrite_tac(@list.List([@complexes.complex_basis()]))
  let t74 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith(), @vectors.vector_2()]))
  let t73 = @simp.simp_tac(@list.List([@vectors.matrix_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t72 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @complexes.im_def()]))
  let t71 = @simp.rewrite_tac(@list.List([@complexes.complex_add(), @complexes.complex_mul(), @complexes.re(), @complexes.im(), @complexes.re_div_cx(), @complexes.im_div_cx(), @complexes.ii(), @complexes.cx_def(), @complexes.complex()]))
  let t70 = @simp.rewrite_tac(@list.List([wirtinger_dbar(), @derivatives.jacobian(), @complexes.complex_eq()]))
  let t82 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t70), t71), t72), t73), t74), t75), t77), t78), t79), t81), @calc_rat.real_arith_tac)
  wirtinger_dbar_frechet_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], wirtinger_dbar(f, z) == (frechet_derivative(f, at(z), Cx(real_of_num(1))) + ii * frechet_derivative(f, at(z), ii)) / Cx(real_of_num(2))"), t82))
}

///|
let wirtinger_dbar_frechet_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WIRTINGER_DBAR_FRECHET")

///|
/// `WIRTINGER_DBAR_FRECHET`
pub fn wirtinger_dbar_frechet() -> @kernel.Thm {
  wirtinger_dbar_frechet_c.get()
}

///|
/// WIRTINGER_DBAR_CONTINUOUS
fn step_12() -> Unit raise {
  let t101 = @simp.rewrite_tac(@list.List([]))
  let t97 = @term_syntax.parse_term("ii")
  let t100 = @tactics.first_x_assum(fn(x99 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s95 = @tactics.mp_tac(x94)
      fn(x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s95(x96)
      }
    })(((x98 : @kernel.Thm) => @bool.spec(t97, x98))(x99))
  })
  let t102 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_complex_lmul()), t100), t101)
  let t93 = @simp.rewrite_tac(@list.List([]))
  let t90 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t103 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x92 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x87 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s88 = @tactics.mp_tac(x87)
      fn(x89 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s88(x89)
      }
    })(((x91 : @kernel.Thm) => @bool.spec(t90, x91))(x92))
  }), t93), t102])
  let t86 = @tactics.match_mp_tac(@topology.continuous_on_add())
  let t85 = @tactics.match_mp_tac(@canal.continuous_on_complex_rmul())
  let t84 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t83 = @simp.rewrite_tac(@list.List([wirtinger_dbar_frechet()]))
  let t104 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t83), t84), t85), t86), @tactics.conj_tac), t103)
  wirtinger_dbar_continuous_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), s)) → continuous_on((z : Cart[Real, 2]) => wirtinger_dbar(f, z), s)"), t104))
}

///|
let wirtinger_dbar_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WIRTINGER_DBAR_CONTINUOUS")

///|
/// `WIRTINGER_DBAR_CONTINUOUS`
pub fn wirtinger_dbar_continuous() -> @kernel.Thm {
  wirtinger_dbar_continuous_c.get()
}

///|
/// WIRTINGER_DBAR_BOUNDED_SUPPORT
fn step_13() -> Unit raise {
  let t148 = @simp.rewrite_tac(@list.List([@complexes.complex_add_lid(), @complexes.complex_div(), @complexes.complex_mul_lzero()]))
  let t147 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_mul_rzero()]))
  let t146 = @simp.rewrite_tac(@list.List([wirtinger_dbar_frechet()]))
  let t145 = @tactics.undisch_tac(@term_syntax.parse_term("!(wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (z : Cart[Real, 2])) == vec(0))"))
  let t143 = @simp.asm_rewrite_tac(@list.List([]))
  let t142 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t141 = @tactics.conv_tac(@equal.sym_conv)
  let t140 = @simp.asm_rewrite_tac(@list.List([@derivatives.has_derivative_const()]))
  let t138 = @term_syntax.parse_term("(e : Real)")
  let t139 = @tactics.map_every(fn(x135 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s136 = @tactics.exists_tac(x135)
    fn(x137 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s136(x137)
    }
  }, @list.List([@term_syntax.parse_term("(x : Cart[Real, 2]) => (vec : (Num) -> Cart[Real, 2])(0)"), t138]))
  let t134 = @tactics.match_mp_tac(@derivatives.has_derivative_transform_at())
  let t144 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_frechet_derivative_unique_at()), t134), t139), t140), @tactics.gen_tac), @tactics.disch_tac), t141), t142), t143), @tactics.all_tac])
  let t133 = @tactics.subgoal_then(@term_syntax.parse_term("frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z : Cart[Real, 2]))) == ((h : Cart[Real, 2]) => vec(0))"), fn(x130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s131 = @tactics.assume_tac(x130)
    fn(x132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s131(x132)
    }
  })
  let t128 = @meson.asm_meson_tac(@list.List([@vectors.dist_sym(), @real.real_not_le()]))
  let t124 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t127 = @tactics.disch_then(fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x121 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s122 = @tactics.mp_tac(x121)
      fn(x123 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s122(x123)
      }
    })(((x125 : @kernel.Thm) => @bool.spec(t124, x125))(x126))
  })
  let t120 = @simp.rewrite_tac(@list.List([@class.not_exists_thm(), @class.de_morgan_thm(), @iterate.in_support(), @sets.in_univ(), @vectors.neutral_vector_add(), @realarith.real_not_lt()]))
  let t119 = @tactics.undisch_tac(@term_syntax.parse_term("!(∃ y : Cart[Real, 2], IN(y, support(op_plus, (f : (Cart[Real, 2]) -> Cart[Real, 2]), UNIV)) && distance(((z : Cart[Real, 2]), y)) < (e : Real))"))
  let t129 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), @tactics.disch_tac), t119), t120), t127), t128), @tactics.all_tac])
  let t118 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Cart[Real, 2], distance((y, (z : Cart[Real, 2]))) < (e : Real) → (f : (Cart[Real, 2]) -> Cart[Real, 2])(y) == vec(0)"), fn(x115 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s116 = @tactics.assume_tac(x115)
    fn(x117 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s116(x117)
    }
  })
  let t114 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.dist_sym()])), @tactics.all_tac])
  let t113 = @class.asm_cases_tac(@term_syntax.parse_term("∃ y : Cart[Real, 2], IN(y, support(op_plus, (f : (Cart[Real, 2]) -> Cart[Real, 2]), UNIV)) && distance(((z : Cart[Real, 2]), y)) < (e : Real)"))
  let t112 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t111 = @simp.rewrite_tac(@list.List([@topology.closure_approachable()]))
  let t110 = @simp.rewrite_tac(@list.List([@iterate.in_support(), @sets.in_univ(), @vectors.neutral_vector_add()]))
  let t109 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t108 = @simp.rewrite_tac(@list.List([@sets.subset()]))
  let t107 = @simp.asm_simp_tac(@list.List([@topology.bounded_closure()]))
  let t106 = @tactics.exists_tac(@term_syntax.parse_term("closure(support(op_plus, (f : (Cart[Real, 2]) -> Cart[Real, 2]), UNIV))"))
  let t105 = @tactics.match_mp_tac(@topology.bounded_subset())
  let t149 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t105), t106), t107), t108), t109), t110), @tactics.disch_tac), t111), t112), @tactics.disch_tac), t113), t114), t118), t129), t133), t144), t145), t146), t147), t148)
  wirtinger_dbar_bounded_support_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], differentiable_on(f, UNIV) && bounded(support(op_plus, f, UNIV)) → bounded(support(op_plus, wirtinger_dbar(f), UNIV))"), t149))
}

///|
let wirtinger_dbar_bounded_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WIRTINGER_DBAR_BOUNDED_SUPPORT")

///|
/// `WIRTINGER_DBAR_BOUNDED_SUPPORT`
pub fn wirtinger_dbar_bounded_support() -> @kernel.Thm {
  wirtinger_dbar_bounded_support_c.get()
}

///|
/// CAUCHY_TRANSFORM_DBAR_TRANSLATION
fn step_14() -> Unit raise {
  let t162 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(w : Cart[Real, 2]) + (x : Cart[Real, 2]) - w == x"))]))
  let t161 = @simp.rewrite_tac(@list.List([@equal.gsym(@integration.integral_translation())]))
  let t160 = @tactics.disch_then(fn(x151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x151
    @simp.gen_rewrite_tac(fn(x159 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x153 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s154 = @equal.land_conv(x153)
        fn(x155 : @kernel.Term) -> @kernel.Thm raise {
          s154(x155)
        }
      })((fn(x156 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s157 = @equal.once_depth_conv(x156)
        fn(x158 : @kernel.Term) -> @kernel.Thm raise {
          s157(x158)
        }
      })(x159))
    }, @list.List([@equal.sym(th)]))
  })
  let t150 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(w : Cart[Real, 2])"), @vectors.translation_univ()))
  let t163 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t150), t160), t161), t162)
  cauchy_transform_dbar_translation_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar(f, z) / (z - w)) == integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar(f, w + z) / z)"), t163))
}

///|
let cauchy_transform_dbar_translation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CAUCHY_TRANSFORM_DBAR_TRANSLATION")

///|
/// `CAUCHY_TRANSFORM_DBAR_TRANSLATION`
pub fn cauchy_transform_dbar_translation() -> @kernel.Thm {
  cauchy_transform_dbar_translation_c.get()
}

///|
/// CONTINUOUS_ON_TRANSLATE_UNIV
fn step_15() -> Unit raise {
  let t173 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t171 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@topology.continuous_on_subset()))
  let t174 = @tactics.then_tac(@tactics.first_x_assum(fn(x172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t171(x172))
  }), t173)
  let t170 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const(), @topology.continuous_on_id()]))
  let t175 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_add()), t170), t174])
  let t169 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t168 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t167 = @tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((a : Cart[Real, 2]) + z)) == o(f, (z : Cart[Real, 2]) => a + z)"), fn(x164 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s165 = @tactics.subst1_tac(x164)
    fn(x166 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s165(x166)
    }
  })
  let t176 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t167), t168), t169), @tactics.conj_tac), t175)
  continuous_on_translate_univ_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ a : Cart[Real, 2], continuous_on(f, UNIV) → continuous_on((z : Cart[Real, 2]) => f(a + z), UNIV)"), t176))
}

///|
let continuous_on_translate_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_TRANSLATE_UNIV")

///|
/// `CONTINUOUS_ON_TRANSLATE_UNIV`
pub fn continuous_on_translate_univ() -> @kernel.Thm {
  continuous_on_translate_univ_c.get()
}

///|
/// BOUNDED_SUPPORT_TRANSLATE
fn step_16() -> Unit raise {
  let t189 = @simp.asm_simp_tac(@list.List([@topology.bounded_translation()]))
  let t188 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((z : Cart[Real, 2]) => -(a : Cart[Real, 2]) + z, support(op_plus, (f : (Cart[Real, 2]) -> Cart[Real, 2]), UNIV))"))
  let t187 = @tactics.match_mp_tac(@topology.bounded_subset())
  let t185 = @simp.asm_rewrite_tac(@list.List([@vectors.neutral_vector_add()]))
  let t184 = @simp.rewrite_tac(@list.List([@iterate.in_support(), @sets.in_univ()]))
  let t183 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("-(a : Cart[Real, 2]) + (a + (z : Cart[Real, 2])) == z")), @vectors.neutral_vector_add()]))
  let t182 = @tactics.exists_tac(@term_syntax.parse_term("(a : Cart[Real, 2]) + (z : Cart[Real, 2])"))
  let t181 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t186 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @iterate.in_support(), @sets.in_univ(), @sets.in_image()])), t181), @tactics.strip_tac), t182), t183), t184), t185), @tactics.all_tac])
  let t180 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(support(op_plus, (z : Cart[Real, 2]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((a : Cart[Real, 2]) + z), UNIV), IMAGE((z : Cart[Real, 2]) => -a + z, support(op_plus, f, UNIV)))"), fn(x177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s178 = @tactics.assume_tac(x177)
    fn(x179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s178(x179)
    }
  })
  let t190 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t180), t186), t187), t188), t189)
  bounded_support_translate_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ a : Cart[Real, 2], bounded(support(op_plus, f, UNIV)) → bounded(support(op_plus, (z : Cart[Real, 2]) => f(a + z), UNIV))"), t190))
}

///|
let bounded_support_translate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDED_SUPPORT_TRANSLATE")

///|
/// `BOUNDED_SUPPORT_TRANSLATE`
pub fn bounded_support_translate() -> @kernel.Thm {
  bounded_support_translate_c.get()
}

///|
/// POLAR_SIMPLIFY
fn step_17() -> Unit raise {
  let t202 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_rinv(), @complexes.complex_mul_lid()]))
  let t201 = @tactics.subgoal_then(@term_syntax.parse_term("Cx(drop((r : Cart[Real, Unit]))) * ((g : Cart[Real, 2]) * (inv(Cx(drop(r))) * inv((e : Cart[Real, 2])))) == Cx(drop(r)) * inv(Cx(drop(r))) * (g * inv(e))"), fn(x198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s199 = @tactics.subst1_tac(x198)
    fn(x200 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s199(x200)
    }
  })
  let t197 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_inv_mul()]))
  let t196 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.cx_inj()])), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t195 = @tactics.subgoal_then(@term_syntax.parse_term("!(Cx(drop((r : Cart[Real, Unit]))) == Cx(real_of_num(0)))"), fn(x192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s193 = @tactics.assume_tac(x192)
    fn(x194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s193(x194)
    }
  })
  let t191 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul()]))
  let t203 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t191), t195), t196), t197), t201), @list.List([@complexes.simple_complex_arith_tac, @tactics.all_tac])), t202)
  polar_simplify_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : Cart[Real, 2], ∀ r : Cart[Real, Unit], ∀ e : Cart[Real, 2], real_of_num(0) < drop(r) && !(e == Cx(real_of_num(0))) → op_pct(drop(r), g / (Cx(drop(r)) * e)) == g * inv(e)"), t203))
}

///|
let polar_simplify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLAR_SIMPLIFY")

///|
/// `POLAR_SIMPLIFY`
pub fn polar_simplify() -> @kernel.Thm {
  polar_simplify_c.get()
}

///|
/// INV_CEXP_II
fn step_18() -> Unit raise {
  let t206 = @simp.rewrite_tac(@list.List([@complexes.cnj(), @complexes.ii(), @complexes.cx_def(), @complexes.complex_mul(), @complexes.complex_neg(), @complexes.re(), @complexes.im(), @complexes.complex_eq()]))
  let t205 = @simp.rewrite_tac(@list.List([@equal.gsym(@transcendentals.cexp_neg())]))
  let t204 = @tactics.conv_tac(@equal.sym_conv)
  let t207 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@transcendentals.cnj_cexp()]))), t204), t205), @tactics.ap_term_tac), t206), @calc_rat.real_arith_tac)
  inv_cexp_ii_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Real, inv(cexp(ii * Cx(t))) == cnj(cexp(ii * Cx(t)))"), t207))
}

///|
let inv_cexp_ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INV_CEXP_II")

///|
/// `INV_CEXP_II`
pub fn inv_cexp_ii() -> @kernel.Thm {
  inv_cexp_ii_c.get()
}

///|
/// POLAR_CEXP_SIMPLIFY
fn step_19() -> Unit raise {
  let t214 = @simp.rewrite_tac(@list.List([inv_cexp_ii()]))
  let t213 = @simp.asm_simp_tac(@list.List([polar_simplify()]))
  let t212 = @list.List([@simp.rewrite_tac(@list.List([@transcendentals.cexp_nz()])), @tactics.all_tac])
  let t211 = @tactics.subgoal_then(@term_syntax.parse_term("!(cexp(ii * Cx(drop((t : Cart[Real, Unit])))) == Cx(real_of_num(0)))"), fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s209 = @tactics.assume_tac(x208)
    fn(x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s209(x210)
    }
  })
  let t215 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t211), t212), t213), t214)
  polar_cexp_simplify_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : Cart[Real, 2], ∀ r : Cart[Real, Unit], ∀ t : Cart[Real, Unit], real_of_num(0) < drop(r) → op_pct(drop(r), g / (Cx(drop(r)) * cexp(ii * Cx(drop(t))))) == g * cnj(cexp(ii * Cx(drop(t))))"), t215))
}

///|
let polar_cexp_simplify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLAR_CEXP_SIMPLIFY")

///|
/// `POLAR_CEXP_SIMPLIFY`
pub fn polar_cexp_simplify() -> @kernel.Thm {
  polar_cexp_simplify_c.get()
}

///|
/// WIRTINGER_DBAR_FRECHET_POLAR
fn step_20() -> Unit raise {
  let t236 = @tactics.conv_tac(@complexes.complex_ring)
  let t235 = @simp.asm_rewrite_tac(@list.List([@complexes.cnj_mul(), @complexes.cnj_ii()]))
  let t233 = @simp.asm_rewrite_tac(@list.List([]))
  let t234 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@derivatives.frechet_derivative_at()), t233), @tactics.all_tac])
  let t232 = @tactics.subgoal_then(@term_syntax.parse_term("(f' : (Cart[Real, 2]) -> Cart[Real, 2]) == frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z : Cart[Real, 2])))"), fn(x229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s230 = @tactics.subst_all_tac(x229)
    fn(x231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s230(x231)
    }
  })
  let t228 = @simp.asm_rewrite_tac(@list.List([]))
  let t225 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t226 = @term_syntax.parse_term("(f' : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t227 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t226, t225]), frechet_wirtinger()))
  let t222 = @term_syntax.parse_term("(f' : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t224 = @tactics.disch_then((x223 : @kernel.Thm) => @tactics.x_choose_tac(t222, x223))
  let t219 = @simp.rewrite_rule(@list.List([@derivatives.differentiable()]))
  let t221 = @tactics.first_x_assum(fn(x220 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x216 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s217 = @tactics.mp_tac(x216)
      fn(x218 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s217(x218)
      }
    })(t219(x220))
  })
  let t237 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t221), t224), t227), t228), @tactics.disch_tac), t232), t234), t235), t236)
  wirtinger_dbar_frechet_polar_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ e : Cart[Real, 2], differentiable(f, at(z)) → frechet_derivative(f, at(z), e) + ii * frechet_derivative(f, at(z), ii * e) == Cx(real_of_num(2)) * (wirtinger_dbar(f, z) * cnj(e))"), t237))
}

///|
let wirtinger_dbar_frechet_polar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WIRTINGER_DBAR_FRECHET_POLAR")

///|
/// `WIRTINGER_DBAR_FRECHET_POLAR`
pub fn wirtinger_dbar_frechet_polar() -> @kernel.Thm {
  wirtinger_dbar_frechet_polar_c.get()
}

///|
/// CEXP_2PII
fn step_21() -> Unit raise {
  let t238 = @simp.rewrite_tac(@list.List([@floor.integer_closed(), @realax.real_mul_lid(), @complexes.complex_mul_sym()]))
  let t239 = @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(1)"), @transcendentals.cexp_integer_2pi())), t238)
  cexp_2pii_c.set(@tactics.prove(@term_syntax.parse_term("cexp(ii * Cx(real_of_num(2) * pi)) == Cx(real_of_num(1))"), t239))
}

///|
let cexp_2pii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CEXP_2PII")

///|
/// `CEXP_2PII`
pub fn cexp_2pii() -> @kernel.Thm {
  cexp_2pii_c.get()
}

///|
/// CEXP_0II
fn step_22() -> Unit raise {
  let t240 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rzero(), @transcendentals.cexp_0()]))
  cexp_0ii_c.set(@tactics.prove(@term_syntax.parse_term("cexp(ii * Cx(real_of_num(0))) == Cx(real_of_num(1))"), t240))
}

///|
let cexp_0ii_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CEXP_0II")

///|
/// `CEXP_0II`
pub fn cexp_0ii() -> @kernel.Thm {
  cexp_0ii_c.get()
}

///|
/// NORM_CPOW_COMPLEX
fn step_23() -> Unit raise {
  let t247 = @simp.asm_rewrite_tac(@list.List([@transcendentals.rpow(), @vectors.norm_pos_lt(), @vectors.norm_eq_0(), @complexes.complex_vec_0()]))
  let t246 = @simp.asm_simp_tac(@list.List([@transcendentals.norm_cexp(), @complexes.re_mul_cx(), @transcendentals.re_clog()]))
  let t245 = @simp.asm_simp_tac(@list.List([@complexes.complex_norm_0(), @transcendentals.rpow_zero(), @class.cond_id()]))
  let t244 = @class.asm_cases_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) == Cx(real_of_num(0))"))
  let t243 = @simp.rewrite_tac(@list.List([@transcendentals.cpow()]))
  let t242 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Real)"))
  let t241 = @simp.rewrite_tac(@list.List([@complexes.forall_real(), @complexes.re_cx(), @complexes.cx_inj()]))
  let t248 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])")), t241), t242), t243), t244), t245), t246), t247)
  norm_cpow_complex_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ z : Cart[Real, 2], real(z) → norm(cpow(w, z)) == (if w == Cx(real_of_num(0)) && z == Cx(real_of_num(0)) { real_of_num(0) } else { rpow(norm(w), Re(z)) })"), t248))
}

///|
let norm_cpow_complex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_CPOW_COMPLEX")

///|
/// `NORM_CPOW_COMPLEX`
pub fn norm_cpow_complex() -> @kernel.Thm {
  norm_cpow_complex_c.get()
}

///|
/// ABSOLUTELY_INTEGRABLE_CPOW
fn step_24() -> Unit raise {
  let t369 = @simp.asm_simp_tac(@list.List([@realax.real_abs(), @transcendentals.rpow_add_alt(), @transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t368 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec(), @vectors.lift_drop(), @trivia.o_thm()]))
  let t367 = @simp.rewrite_tac(@list.List([@integration.negligible_sing(), @sets.in_sing(), @sets.in_diff(), @equal.gsym(@vectors.drop_eq())]))
  let t366 = @tactics.exists_tac(@term_syntax.parse_term("{(vec : (Num) -> Cart[Real, Unit])(0)}"))
  let t365 = @tactics.match_mp_tac(@integration.integrable_spike())
  let t364 = @simp.rewrite_tac(@list.List([@realanalysis.real_integrable_on_v1(), @topology.image_lift_real_interval(), @vectors.lift_num()]))
  let t360 = @drule.match_mp(@realanalysis.has_real_integral_integrable())
  let t362 = @tactics.disch_then(fn(x361 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x357 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s358 = @tactics.mp_tac(x357)
      fn(x359 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s358(x359)
      }
    })(t360(x361))
  })
  let t355 = @tactics.conv_tac(@calc_rat.real_field)
  let t354 = @tactics.undisch_tac(@term_syntax.parse_term("-real_of_num(2) < (p : Real)"))
  let t353 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(p : Real) + real_of_num(2) - real_of_num(1) == p + real_of_num(1)"))]))
  let t352 = @tactics.repeat_tac(@tactics.strip_tac)
  let t356 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.in_real_interval()])), t352), @realanalysis.real_diff_tac), t353), t354), t355)
  let t351 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_rpow())
  let t363 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_on_lmul()), t351), @calc_rat.asm_real_arith_tac), t356])), t362])
  let t350 = @simp.asm_rewrite_tac(@list.List([]))
  let t346 = @term_syntax.parse_term("(r : Real)")
  let t347 = @term_syntax.parse_term("real_of_num(0)")
  let t348 = @term_syntax.parse_term("(x : Real) => rpow(x, (p : Real) + real_of_num(1))")
  let t349 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real) => inv((p : Real) + real_of_num(2)) * rpow(x, p + real_of_num(2))"), t348, t347, t346]), @realanalysis.real_fundamental_theorem_of_calculus_interior()))
  let t345 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.interval_ne_empty_1(), @vectors.drop_vec(), @vectors.lift_drop()])))
  let t344 = @simp.asm_rewrite_tac(@list.List([@integration.integrable_on_empty()]))
  let t343 = @class.asm_cases_tac(@term_syntax.parse_term("interval([(vec(0), lift((r : Real)))]) == {}"))
  let t341 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.drop_vec()]))
  let t342 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @topology.in_interval_1()])), t341), @tactics.all_tac])
  let t340 = @tactics.subgoal_then(@term_syntax.parse_term("{(x : Cart[Real, Unit]) | real_of_num(0) <= drop(x) && drop(x) <= (r : Real)} == interval([(vec(0), lift(r))])"), fn(x337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s338 = @tactics.subst1_tac(x337)
    fn(x339 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s338(x339)
    }
  })
  let t336 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real) && abs(x) <= (a : Real)) == (real_of_num(0) <= x && x <= a)"))]))
  let t335 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INTER((x : _) => (P : (_) -> Bool)(x), {(x : _) | (Q : (_) -> Bool)(x)}) == {(x : _) | Q(x) && P(x)}"))]))
  let t334 = @tactics.match_mp_tac(@integration.integrable_cmul())
  let t333 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@sets.in_()]))(@integration.integrable_restrict_inter())]))
  let t332 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_rzero()]))
  let t331 = @simp.rewrite_tac(@list.List([@sets.empty_gspec(), @integration.negligible_empty(), @class.cond_rand()]))
  let t330 = @simp.rewrite_tac(@list.List([@integration.absolutely_integrable_const(), @integration.integral_const()]))
  let t329 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx(), @transcendentals.real_abs_rpow(), @real.real_abs_abs()]))
  let t328 = @simp.rewrite_tac(@list.List([@vectors.norm_lift(), @vectors.real_abs_norm(), @equal.gsym(@vectors.lift_cmul())]))
  let t327 = @simp.rewrite_tac(@list.List([@vectors.norm_0(), @vectors.lift_num(), @vectors.vector_mul_rzero()]))
  let t326 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @transcendentals.norm_cexp_ii(), @realarith.real_mul_rid()]))
  let t325 = @simp.rewrite_tac(@list.List([@topology.in_cball_0(), @equal.gsym(@complexes.complex_vec_0())]))
  let t324 = @simp.rewrite_tac(@list.List([@class.cond_rand(), @class.cond_rator()]))
  let t322 = @tactics.disch_then(fn(x319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s320 = @tactics.subst1_tac(x319)
    fn(x321 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s320(x321)
    }
  })
  let t318 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image(), @sets.in_diff(), @sets.in_sing(), @sets.in_univ(), @sets.in_delete(), @complexes.complex_norm_zero()]))
  let t317 = @tactics.match_mp_tac(@sets.image_subset())
  let t316 = @simp.rewrite_tac(@list.List([@sets.image_o()]))
  let t315 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@topology.continuous_on_subset()))
  let t314 = @simp.rewrite_tac(@list.List([@sets.in_delete(), @realanalysis.real_continuous_on_v1()]))
  let t312 = @term_syntax.parse_term("(p : Real)")
  let t313 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("DELETE(UNIV, real_of_num(0))"), t312]), @realanalysis.real_continuous_on_rpow()))
  let t311 = @simp.rewrite_tac(@list.List([@topology.continuous_on_lift_norm()]))
  let t310 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t309 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_drop()])), @tactics.all_tac])
  let t308 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, 2]) => lift(rpow(norm(x), (p : Real)))) == o(o(lift, o((x : Real) => rpow(x, p), drop)), o(lift, norm))"), fn(x305 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s306 = @tactics.subst1_tac(x305)
    fn(x307 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s306(x307)
    }
  })
  let t304 = @simp.rewrite_tac(@list.List([@measure.lebesgue_measurable_univ(), @integration.negligible_sing()]))
  let t303 = @tactics.exists_tac(@term_syntax.parse_term("{Cx(real_of_num(0))}"))
  let t302 = @tactics.match_mp_tac(@measure.continuous_ae_imp_measurable_on_lebesgue_measurable_subset())
  let t301 = @simp.rewrite_tac(@list.List([@measure.lebesgue_measurable_cball()]))
  let t300 = @simp.rewrite_tac(@list.List([@sets.in_gspec(), @measure.measurable_on_const()]))
  let t323 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_on_cases()), t300), t301), t302), t303), t304), t308), t309), t310), t311), t313), t314), t315), t316), t317), t318), t322])
  let t295 = @drule.part_match(fn(x294 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x294))
  }, @transcendentals.fubini_tonelli_polar())
  let t290 = @simp.gen_rewrite_tac(fn(x289 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x289
  }, @list.List([@equal.gsym(@integration.absolutely_integrable_restrict_univ())]))
  let t287 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t286 = @simp.rewrite_tac(@list.List([@measure.measurable_delete(), @measure.measurable_cball()]))
  let t285 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool)) && !(x == (a : _))} == DELETE(s, a)"))]))
  let t284 = @simp.rewrite_tac(@list.List([@measure.integrable_on_const()]))
  let t283 = @tactics.match_mp_tac(@integration.integrable_cases())
  let t288 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@transcendentals.rpow_0(), @class.cond_rand(), @vectors.lift_num()])), t283), t284), t285), t286), t287])
  let t282 = @simp.asm_rewrite_tac(@list.List([]))
  let t281 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Real) == real_of_num(0)"))
  let t280 = @simp.simp_tac(@list.List([norm_cpow_complex(), @complexes.real_cx(), @complexes.cx_inj(), @complexes.re_cx()]))
  let t279 = @simp.asm_simp_tac(@list.List([@realanalysis.measurable_on_cpow(), @measure.lebesgue_measurable_cball()]))
  let t278 = @simp.once_rewrite_tac(@list.List([@measure.absolutely_integrable_measurable()]))
  let t277 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(w : Cart[Real, 2]) + (y : Cart[Real, 2]) - (w + Cx(real_of_num(0))) == y"))]))
  let t276 = @simp.rewrite_tac(@list.List([@equal.gsym(@integration.absolutely_integrable_translation()), @topology.cball_translation()]))
  let t275 = @tactics.subst1_tac(@complexes.complex_ring(@term_syntax.parse_term("(w : Cart[Real, 2]) == w + Cx(real_of_num(0))")))
  let t267 = @term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)")
  let t274 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x271 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x266 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        @tactics.all_tac
      })(((x270 : @kernel.Term) => @lib.check(fn(x269 : @kernel.Term) -> Bool raise {
        ((x268 : @kernel.Term) => @basics.free_in(t267, x268))(x269)
      }, x270))(x271))
    })((fn(x272 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x272)
    })(x273))
  }))
  let t265 = @simp.asm_simp_tac(@list.List([@measure.measurable_imp_lebesgue_measurable()]))
  let t264 = @tactics.exists_tac(@term_syntax.parse_term("cball(((w : Cart[Real, 2]), (r : Real)))"))
  let t263 = @tactics.match_mp_tac(@measure.absolutely_integrable_on_lebesgue_measurable_subset())
  let t262 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Real)"))(@tactics.strip_assume_tac))
  let t259 = @drule.match_mp(@topology.bounded_subset_cball())
  let t256 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t261 = @tactics.first_x_assum(fn(x260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x258 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s254 = @tactics.mp_tac(x253)
        fn(x255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s254(x255)
        }
      })(((x257 : @kernel.Thm) => @bool.spec(t256, x257))(x258))
    })(t259(x260))
  })
  let t252 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t251 = @simp.rewrite_tac(@list.List([@complexes.re_cx()]))
  let t250 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Real)"))
  let t249 = @tactics.repeat_tac(@tactics.disch_tac)
  let t370 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm(), @complexes.forall_real()])), @tactics.gen_tac), t249), t250), t251), @tactics.disch_tac), t252), t261), t262), t263), t264), t265), t274), t275), t276), t277), t278), t279), t280), t281), t282), t288), t290), fn(x299 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x298 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x296 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x291 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s292 = @tactics.mp_tac(x291)
          fn(x293 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s292(x293)
          }
        })(t295(x296))
      })((fn(x297 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x297.1
      })(x298))
    })(x299)(x299)
  }), @tactics.ants_tac), t323), t324), t325), t326), t327), t328), t329), t330), t331), t332), t333), t334), t335), t336), t340), t342), t343), t344), t345), t349), t350), @tactics.ants_tac), t363), t364), t365), t366), t367), t368), t369), @calc_rat.real_arith_tac)
  absolutely_integrable_cpow_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, ∀ p : Cart[Real, 2], ∀ w : Cart[Real, 2], bounded(s) && measurable(s) && real(p) && -real_of_num(2) < Re(p) → absolutely_integrable_on((z : Cart[Real, 2]) => cpow(z - w, p), s)"), t370))
}

///|
let absolutely_integrable_cpow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_INTEGRABLE_CPOW")

///|
/// `ABSOLUTELY_INTEGRABLE_CPOW`
pub fn absolutely_integrable_cpow() -> @kernel.Thm {
  absolutely_integrable_cpow_c.get()
}

///|
/// INV_ABSOLUTELY_INTEGRABLE_BOUNDED
fn step_25() -> Unit raise {
  let t379 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t378 = @simp.asm_simp_tac(@list.List([@complexes.real_neg(), @complexes.real_cx(), @complexes.re_neg(), @complexes.re_cx()]))
  let t380 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(absolutely_integrable_cpow()), t378), t379)
  let t377 = @simp.asm_rewrite_tac(@list.List([]))
  let t376 = @simp.rewrite_tac(@list.List([@transcendentals.cpow_neg(), @transcendentals.cpow_n(), @complexes.complex_pow_1()]))
  let t375 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_sing()]))
  let t381 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), t375), @tactics.strip_tac), t376), @class.cond_cases_tac), t377), t380])
  let t374 = @simp.rewrite_tac(@list.List([@integration.negligible_sing()]))
  let t373 = @tactics.exists_tac(@term_syntax.parse_term("{(w : Cart[Real, 2])}"))
  let t372 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => cpow(z - (w : Cart[Real, 2]), -Cx(real_of_num(1)))"))
  let t371 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(@integration.absolutely_integrable_spike()))
  let t382 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t371), t372), t373), t374), @tactics.conj_tac), t381)
  inv_absolutely_integrable_bounded_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, ∀ w : Cart[Real, 2], bounded(s) && measurable(s) → absolutely_integrable_on((z : Cart[Real, 2]) => inv(z - w), s)"), t382))
}

///|
let inv_absolutely_integrable_bounded_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INV_ABSOLUTELY_INTEGRABLE_BOUNDED")

///|
/// `INV_ABSOLUTELY_INTEGRABLE_BOUNDED`
pub fn inv_absolutely_integrable_bounded() -> @kernel.Thm {
  inv_absolutely_integrable_bounded_c.get()
}

///|
/// LSPACE_COMPLEX_INV
fn step_26() -> Unit raise {
  let t414 = @simp.asm_simp_tac(@list.List([norm_cpow_complex(), @complexes.real_cx(), @complexes.complex_sub_0(), @complexes.re_cx()]))
  let t413 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_inv(), @transcendentals.rpow_inv()]))
  let t412 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_sing()]))
  let t411 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t410 = @simp.rewrite_tac(@list.List([@integration.negligible_sing()]))
  let t409 = @tactics.exists_tac(@term_syntax.parse_term("{(w : Cart[Real, 2])}"))
  let t408 = @tactics.match_mp_tac(@integration.absolutely_integrable_spike())
  let t407 = @simp.rewrite_tac(@list.List([]))
  let t404 = @drule.match_mp(@integration.absolutely_integrable_norm())
  let t406 = @tactics.disch_then(fn(x405 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x401 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s402 = @tactics.mp_tac(x401)
      fn(x403 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s402(x403)
      }
    })(t404(x405))
  })
  let t400 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_neg2()]))
  let t399 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_neg(), @transcendentals.cpow_n(), @complexes.real_neg(), @complexes.real_cx(), @complexes.re_neg(), @complexes.re_cx()]))
  let t397 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t398 = @term_syntax.parse_term("-Cx((p : Real))")
  let t415 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)"), t398, t397]), absolutely_integrable_cpow())), t399), t400), t406), t407), t408), t409), t410), t411), t412), @tactics.strip_tac), @tactics.ap_term_tac), t413), @tactics.ap_term_tac), t414)
  let t396 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_sub_refl(), @complexes.complex_inv_0()]))
  let t395 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t394 = @tactics.disch_then(fn(x393 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s391 = @tactics.mp_tac(x390)
      fn(x392 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s391(x392)
      }
    })(@bool.conjunct1(x393))
  })
  let t389 = @simp.rewrite_tac(@list.List([@measure.absolutely_integrable_measurable()]))
  let t388 = @simp.rewrite_tac(@list.List([@complexes.complex_pow_1(), @complexes.complex_sub_0()]))
  let t387 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t386 = @simp.asm_simp_tac(@list.List([@transcendentals.cpow_neg(), @transcendentals.cpow_n(), @complexes.real_neg(), @complexes.real_cx(), @complexes.re_neg(), @complexes.re_cx()]))
  let t384 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t385 = @term_syntax.parse_term("-Cx(real_of_num(1))")
  let t416 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)"), t385, t384]), absolutely_integrable_cpow())), t386), t387), t388), t389), t394), t395), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.abs_tac), @class.cond_cases_tac), t396), t415])
  let t383 = @simp.rewrite_tac(@list.List([@lpspaces.lspace_alt(), @sets.in_elim_thm()]))
  let t417 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t383), @tactics.conj_tac), t416)
  lspace_complex_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 2]) -> Bool, ∀ p : Real, ∀ w : Cart[Real, 2], bounded(s) && measurable(s) && p < real_of_num(2) → IN((z : Cart[Real, 2]) => inv(z - w), lspace(s, p))"), t417))
}

///|
let lspace_complex_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LSPACE_COMPLEX_INV")

///|
/// `LSPACE_COMPLEX_INV`
pub fn lspace_complex_inv() -> @kernel.Thm {
  lspace_complex_inv_c.get()
}

///|
/// CAUCHY_KERNEL_ABSOLUTELY_INTEGRABLE
fn step_27() -> Unit raise {
  let t460 = @simp.rewrite_tac(@list.List([@topology.bounded_cball(), @measure.measurable_cball()]))
  let t461 = @tactics.then_tac(@tactics.match_mp_tac(inv_absolutely_integrable_bounded()), t460)
  let t458 = @simp.rewrite_tac(@list.List([@topology.compact_cball()]))
  let t457 = @simp.asm_rewrite_tac(@list.List([@sets.subset_univ()]))
  let t456 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t459 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t456), t457), t458])
  let t455 = @tactics.match_mp_tac(@topology.compact_continuous_image())
  let t462 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.compact_imp_bounded()), t455), @tactics.conj_tac), t459)
  let t452 = @simp.rewrite_tac(@list.List([@measure.measurable_cball()]))
  let t453 = @tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_imp_lebesgue_measurable()), t452)
  let t451 = @simp.asm_rewrite_tac(@list.List([]))
  let t454 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@measure.continuous_imp_measurable_on()), t451), t453])
  let t450 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t449 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t463 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_on_lebesgue_measurable_subset()), t449), t450), @tactics.conj_tac), t454), t462, t461])
  let t448 = @tactics.repeat_tac(@tactics.conj_tac)
  let t447 = @simp.rewrite_tac(@list.List([@complexes.bilinear_complex_mul()]))
  let t446 = @tactics.match_mp_tac(@measure.absolutely_integrable_bounded_measurable_product())
  let t445 = @list.List([@simp.rewrite_tac(@list.List([])), @tactics.all_tac])
  let t444 = @tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => (u : (Cart[Real, 2]) -> Cart[Real, 2])(z) * inv(z - (w : Cart[Real, 2]))) == ((z : Cart[Real, 2]) => u(z) * ((z : Cart[Real, 2]) => inv(z - w))(z))"), fn(x441 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s442 = @tactics.subst1_tac(x441)
    fn(x443 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s442(x443)
    }
  })
  let t464 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@integration.absolutely_integrable_restrict_univ()])), t444), t445), t446), t447), t448), t463)
  let t440 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_mul_lzero(), @complexes.complex_vec_0()]))
  let t439 = @simp.rewrite_tac(@list.List([@iterate.support(), @sets.in_elim_thm(), @sets.in_univ(), @vectors.neutral_vector_add()]))
  let t438 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset()])), @tactics.all_tac])
  let t437 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((z : Cart[Real, 2]), support(op_plus, (u : (Cart[Real, 2]) -> Cart[Real, 2]), UNIV))"), fn(x434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s435 = @tactics.mp_tac(x434)
    fn(x436 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s435(x436)
    }
  })
  let t433 = @simp.asm_rewrite_tac(@list.List([]))
  let t465 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @class.cond_cases_tac), t433), t437), t438), t439), @tactics.disch_tac), t440), t464])
  let t432 = @simp.rewrite_tac(@list.List([@integration.negligible_empty(), @sets.in_diff(), @sets.not_in_empty(), @sets.in_univ()]))
  let t431 = @tactics.exists_tac(@term_syntax.parse_term("({} : (Cart[Real, 2]) -> Bool)"))
  let t430 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => if IN(z, cball((Cx(real_of_num(0)), (R : Real)))) { (u : (Cart[Real, 2]) -> Cart[Real, 2])(z) * inv(z - (w : Cart[Real, 2])) } else { vec(0) }"))
  let t429 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(@integration.absolutely_integrable_spike()))
  let t428 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(R : Real)"))(@tactics.strip_assume_tac))
  let t425 = @drule.match_mp(@topology.bounded_subset_cball())
  let t422 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t427 = @tactics.first_x_assum(fn(x426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x419 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s420 = @tactics.mp_tac(x419)
        fn(x421 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s420(x421)
        }
      })(((x423 : @kernel.Thm) => @bool.spec(t422, x423))(x424))
    })(t425(x426))
  })
  let t418 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t466 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t418), t427), t428), t429), t430), t431), t432), @tactics.conj_tac), t465)
  cauchy_kernel_absolutely_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], continuous_on(u, UNIV) && bounded(support(op_plus, u, UNIV)) → absolutely_integrable_on((z : Cart[Real, 2]) => u(z) / (z - w), UNIV)"), t466))
}

///|
let cauchy_kernel_absolutely_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CAUCHY_KERNEL_ABSOLUTELY_INTEGRABLE")

///|
/// `CAUCHY_KERNEL_ABSOLUTELY_INTEGRABLE`
pub fn cauchy_kernel_absolutely_integrable() -> @kernel.Thm {
  cauchy_kernel_absolutely_integrable_c.get()
}

///|
/// INTEGRAL_IF_CONST
fn step_28() -> Unit raise {
  let t467 = @simp.rewrite_tac(@list.List([@class.eta_ax(), @integration.integral_0()]))
  let t468 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @class.cond_cases_tac), t467)
  integral_if_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, M]) -> Bool, ∀ P : Bool, ∀ f : (Cart[Real, M]) -> Cart[Real, N], integral(s, (y : Cart[Real, M]) => if P { f(y) } else { vec(0) }) == (if P { integral(s, f) } else { vec(0) })"), t468))
}

///|
let integral_if_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRAL_IF_CONST")

///|
/// `INTEGRAL_IF_CONST`
pub fn integral_if_const() -> @kernel.Thm {
  integral_if_const_c.get()
}

///|
/// NEGLIGIBLE_GRAPH_PRODUCT
fn step_29() -> Unit raise {
  let t513 = @simp.rewrite_tac(@list.List([@integration.negligible_empty()]))
  let t511 = @simp.rewrite_tac(@list.List([@integration.negligible_sing()]))
  let t510 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(y : Cart[Real, 2]) | y == (a : Cart[Real, 2])} == {a}"))]))
  let t512 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty()])), @tactics.gen_tac), t510), t511), @tactics.all_tac])
  let t509 = @tactics.subgoal_then(@term_syntax.parse_term("{(x : Cart[Real, Unit]) | !negligible({(y : Cart[Real, 2]) | y == (h : (Cart[Real, Unit]) -> Cart[Real, 2])(x)})} == {}"), fn(x506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s507 = @tactics.subst1_tac(x506)
    fn(x508 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s507(x508)
    }
  })
  let t505 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @cart.fstcart_pastecart(), @cart.sndcart_pastecart()]))
  let t504 = @tactics.disch_then(fn(x501 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s502 = @tactics.subst1_tac(x501)
    fn(x503 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s502(x503)
    }
  })
  let t496 = @parser.parse_type("N")
  let t497 = (@parser.parse_type("2"), t496)
  let t495 = @parser.parse_type("M")
  let t498 = @drule.match_mp(@kernel.inst_type(@list.List([(@parser.parse_type("1"), t495), t497]), @measure.fubini_tonelli_negligible()))
  let t500 = @tactics.first_x_assum(fn(x499 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x492 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s493 = @tactics.mp_tac(x492)
      fn(x494 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s493(x494)
      }
    })(t498(x499))
  })
  let t490 = @simp.asm_rewrite_tac(@list.List([@topology.closed_sing()]))
  let t489 = @tactics.match_mp_tac(@measure.lebesgue_measurable_preimage_closed())
  let t487 = @tactics.conv_tac(@vectors.vector_arith)
  let t488 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_sing()])), @tactics.gen_tac), t487), @tactics.all_tac])
  let t491 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("{(p : Cart[Real, Finite_sum[Unit, 2]]) | sndcart(p) == (h : (Cart[Real, Unit]) -> Cart[Real, 2])(fstcart(p))} == {(p : Cart[Real, Finite_sum[Unit, 2]]) | IN(((p : Cart[Real, Finite_sum[Unit, 2]]) => sndcart(p) - h(fstcart(p)))(p), {vec(0)})}"), fn(x484 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s485 = @tactics.subst1_tac(x484)
    fn(x486 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s485(x486)
    }
  }), t488), t489), t490), @tactics.all_tac])
  let t483 = @tactics.subgoal_then(@term_syntax.parse_term("lebesgue_measurable({(p : Cart[Real, Finite_sum[Unit, 2]]) | sndcart(p) == (h : (Cart[Real, Unit]) -> Cart[Real, 2])(fstcart(p))})"), fn(x480 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s481 = @tactics.assume_tac(x480)
    fn(x482 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s481(x482)
    }
  })
  let t476 = @simp.asm_rewrite_tac(@list.List([]))
  let t475 = @parser.parse_type("N")
  let t477 = @tactics.then_tac(@tactics.match_mp_tac(@kernel.inst_type(@list.List([(@parser.parse_type("2"), t475)]), @measure.measurable_on_compose_fstcart())), t476)
  let t474 = @simp.rewrite_tac(@list.List([@vectors.linear_sndcart()]))
  let t473 = @tactics.match_mp_tac(@topology.linear_continuous_on())
  let t478 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.continuous_imp_measurable_on()), t473), t474), t477])
  let t479 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_on_sub()), @tactics.conj_tac), t478), @tactics.all_tac])
  let t472 = @tactics.subgoal_then(@term_syntax.parse_term("measurable_on((p : Cart[Real, Finite_sum[Unit, 2]]) => sndcart(p) - (h : (Cart[Real, Unit]) -> Cart[Real, 2])(fstcart(p)), UNIV)"), fn(x469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s470 = @tactics.assume_tac(x469)
    fn(x471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s470(x471)
    }
  })
  let t514 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t472), t479), t483), t491), t500), t504), t505), t509), t512), t513)
  negligible_graph_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ h : (Cart[Real, Unit]) -> Cart[Real, 2], measurable_on(h, UNIV) → negligible({(p : Cart[Real, Finite_sum[Unit, 2]]) | sndcart(p) == h(fstcart(p))})"), t514))
}

///|
let negligible_graph_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEGLIGIBLE_GRAPH_PRODUCT")

///|
/// `NEGLIGIBLE_GRAPH_PRODUCT`
pub fn negligible_graph_product() -> @kernel.Thm {
  negligible_graph_product_c.get()
}

///|
/// MEASURABLE_ON_FUBINI_INTEGRAND
fn step_30() -> Unit raise {
  let t568 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t567 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Cart[Real, Finite_sum[Unit, 2]])"))
  let t566 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@measure.measurable_on_eq()))
  let t562 = @parser.parse_type("N")
  let t563 = @drule.match_mp(@kernel.inst_type(@list.List([(@parser.parse_type("2"), t562)]), @measure.measurable_on_compose_fstcart()))
  let t565 = @tactics.disch_then(fn(x564 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x559 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s560 = @tactics.mp_tac(x559)
      fn(x561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s560(x561)
      }
    })(t563(x564))
  })
  let t557 = @simp.asm_rewrite_tac(@list.List([]))
  let t556 = @tactics.match_mp_tac(@measure.absolutely_integrable_vector_derivative_absolutely_continuous())
  let t555 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t554 = @tactics.match_mp_tac(@measure.integrable_imp_measurable())
  let t558 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@measure.measurable_on_univ()])), t554), t555), t556), t557), @tactics.all_tac])
  let t569 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("measurable_on((t : Cart[Real, Unit]) => if IN(t, interval([(vec(0), vec(1))])) { vector_derivative((g : (Cart[Real, Unit]) -> Cart[Real, 2]), at(t)) } else { vec(0) }, UNIV)"), fn(x551 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s552 = @tactics.mp_tac(x551)
    fn(x553 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s552(x553)
    }
  }), t558), t565), t566), t567), t568)
  let t546 = @simp.asm_rewrite_tac(@list.List([]))
  let t545 = @tactics.match_mp_tac(@measure.continuous_imp_measurable_on())
  let t547 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(negligible_graph_product()), t545), t546)
  let t544 = @tactics.conv_tac(@vectors.vector_arith)
  let t548 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @equal.gsym(@complexes.complex_vec_0())])), @tactics.gen_tac), t544), t547])
  let t549 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("{(p : Cart[Real, Finite_sum[Unit, 2]]) | sndcart(p) - (G : (Cart[Real, Unit]) -> Cart[Real, 2])(fstcart(p)) == Cx(real_of_num(0))} == {(p : Cart[Real, Finite_sum[Unit, 2]]) | sndcart(p) == G(fstcart(p))}"), fn(x541 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s542 = @tactics.subst1_tac(x541)
    fn(x543 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s542(x543)
    }
  }), t548)
  let t538 = @simp.asm_rewrite_tac(@list.List([]))
  let t537 = @tactics.match_mp_tac(@measure.continuous_imp_measurable_on())
  let t536 = @parser.parse_type("N")
  let t539 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@kernel.inst_type(@list.List([(@parser.parse_type("2"), t536)]), @measure.measurable_on_compose_fstcart())), t537), t538)
  let t535 = @simp.rewrite_tac(@list.List([@vectors.linear_sndcart()]))
  let t534 = @tactics.match_mp_tac(@topology.linear_continuous_on())
  let t540 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.continuous_imp_measurable_on()), t534), t535), t539])
  let t550 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_on_sub()), @tactics.conj_tac), t540), t549])
  let t570 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.measurable_on_complex_inv()), @tactics.conj_tac), t550), t569])
  let t571 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.measurable_on_complex_mul()), @tactics.conj_tac), t570)
  let t533 = @simp.asm_rewrite_tac(@list.List([]))
  let t532 = @tactics.match_mp_tac(@measure.continuous_imp_measurable_on())
  let t531 = @parser.parse_type("M")
  let t572 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@kernel.inst_type(@list.List([(@parser.parse_type("1"), t531)]), @measure.measurable_on_compose_sndcart())), t532), t533), t571])
  let t530 = @tactics.match_mp_tac(@realanalysis.measurable_on_complex_mul())
  let t527 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_mul_rzero()]))
  let t526 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_assoc()]))
  let t528 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([])), t526), t527])
  let t525 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t529 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(p : Cart[Real, Finite_sum[Unit, 2]])")), t525), @class.cond_cases_tac), t528), @tactics.all_tac])
  let t524 = @tactics.exists_tac(@term_syntax.parse_term("(p : Cart[Real, Finite_sum[Unit, 2]]) => (u : (Cart[Real, 2]) -> Cart[Real, 2])(sndcart(p)) * (inv(sndcart(p) - (G : (Cart[Real, Unit]) -> Cart[Real, 2])(fstcart(p))) * (if IN(fstcart(p), interval([(vec(0), vec(1))])) { vector_derivative((g : (Cart[Real, Unit]) -> Cart[Real, 2]), at(fstcart(p))) } else { vec(0) }))"))
  let t523 = @tactics.match_mp_tac(@measure.measurable_on_eq())
  let t520 = @meson.meson_tac(@list.List([]))
  let t519 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path(), @paths.path()]))
  let t518 = @simp.rewrite_tac(@list.List([@topology.closed_interval(), @sets.subset_univ()]))
  let t521 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.match_mp_tac(@topology.closed_subset()), t518), t519])), t520])
  let t516 = @term_syntax.parse_term("(interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])")
  let t517 = @term_syntax.parse_term("(UNIV : (Cart[Real, Unit]) -> Bool)")
  let t522 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), t517, t516]), @convex.tietze_unbounded())), @tactics.ants_tac), t521), @tactics.all_tac])
  let t515 = @tactics.subgoal_then(@term_syntax.parse_term("∃ G : (Cart[Real, Unit]) -> Cart[Real, 2], continuous_on(G, UNIV) && (∀ x : Cart[Real, Unit], IN(x, interval([(vec(0), vec(1))])) → G(x) == (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x))"), @tactics.strip_assume_tac)
  let t573 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t515), t522), t523), t524), @tactics.conj_tac), t529), t530), @tactics.conj_tac), t572)
  measurable_on_fubini_integrand_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], continuous_on(u, UNIV) && absolutely_continuous_on(g, interval([(vec(0), vec(1))])) → measurable_on((p : Cart[Real, Finite_sum[Unit, 2]]) => if IN(fstcart(p), interval([(vec(0), vec(1))])) { u(sndcart(p)) / (sndcart(p) - g(fstcart(p))) * vector_derivative(g, at(fstcart(p))) } else { vec(0) }, UNIV)"), t573))
}

///|
let measurable_on_fubini_integrand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEASURABLE_ON_FUBINI_INTEGRAND")

///|
/// `MEASURABLE_ON_FUBINI_INTEGRAND`
pub fn measurable_on_fubini_integrand() -> @kernel.Thm {
  measurable_on_fubini_integrand_c.get()
}

///|
/// CAUCHY_KERNEL_NORM_UNIFORM_BOUND
fn step_31() -> Unit raise {
  let t766 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t765 = @tactics.match_mp_tac(@integration.integral_eq())
  let t764 = @simp.rewrite_tac(@list.List([@equal.gsym(@integration.integral_translation())]))
  let t763 = @list.List([@simp.rewrite_tac(@list.List([@equal.gsym(@topology.cball_translation()), @complexes.complex_add_rid()])), @tactics.all_tac])
  let t762 = @tactics.subgoal_then(@term_syntax.parse_term("cball(((w : Cart[Real, 2]), (R : Real) + (S : Real))) == IMAGE((z : Cart[Real, 2]) => w + z, cball((Cx(real_of_num(0)), R + S)))"), fn(x759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s760 = @tactics.subst1_tac(x759)
    fn(x761 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s760(x761)
    }
  })
  let t758 = @simp.expand_tac("C")
  let t757 = @tactics.subgoal_then(@term_syntax.parse_term("(M : Real) * drop(integral(cball(((w : Cart[Real, 2]), (R : Real) + (S : Real))), (y : Cart[Real, 2]) => lift(norm(inv(y - w))))) == (C : Real)"), fn(x755 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x755
    @simp.asm_rewrite_tac(@list.List([th_4, @realax.real_le_refl()]))
  })
  let t752 = @simp.rewrite_tac(@list.List([@topology.bounded_cball(), @measure.measurable_cball()]))
  let t753 = @list.List([@simp.rewrite_tac(@list.List([@topology.bounded_cball(), @measure.measurable_cball()])), t752])
  let t751 = @tactics.match_mp_tac(inv_absolutely_integrable_bounded())
  let t750 = @tactics.match_mp_tac(@integration.absolutely_integrable_norm())
  let t749 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t748 = @simp.asm_rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.norm_pos_le()]))
  let t747 = @tactics.match_mp_tac(@integration.integral_subset_drop_le())
  let t746 = @simp.asm_rewrite_tac(@list.List([]))
  let t754 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_le_lmul()), t746), t747), t748), @tactics.conj_tac), t749), t750), t751), t753), @tactics.all_tac])
  let t745 = @tactics.subgoal_then(@term_syntax.parse_term("(M : Real) * drop(integral(cball((Cx(real_of_num(0)), (R : Real))), (y : Cart[Real, 2]) => lift(norm(inv(y - (w : Cart[Real, 2])))))) <= M * drop(integral(cball((w, R + (S : Real))), (y : Cart[Real, 2]) => lift(norm(inv(y - w)))))"), fn(x741 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x741
    let t744 = @list.List([@tactics.accept_tac(th_3), @tactics.all_tac])
    let t743 = @tactics.exists_tac(@term_syntax.parse_term("(M : Real) * drop(integral(cball(((w : Cart[Real, 2]), (R : Real) + (S : Real))), (y : Cart[Real, 2]) => lift(norm(inv(y - w)))))"))
    @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t743), @tactics.conj_tac), t744)
  })
  let t739 = @simp.rewrite_tac(@list.List([@vectors.dist(), @complexes.complex_sub_rzero(), @complexes.complex_sub_lzero(), @vectors.norm_neg()]))
  let t736 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t737 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t738 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(w : Cart[Real, 2])"), t737, t736]), @vectors.dist_triangle()))
  let t735 = @tactics.repeat_tac(@tactics.strip_tac)
  let t734 = @simp.rewrite_tac(@list.List([@topology.in_cball(), @vectors.dist(), @complexes.complex_sub_lzero(), @vectors.norm_neg()]))
  let t733 = @tactics.undisch_tac(@term_syntax.parse_term("IN((y : Cart[Real, 2]), cball((Cx(real_of_num(0)), (R : Real))))"))
  let t732 = @simp.rewrite_tac(@list.List([@topology.in_cball(), @vectors.dist(), @complexes.complex_sub_lzero(), @vectors.norm_neg()]))
  let t731 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset()])), @tactics.all_tac])
  let t730 = @tactics.subgoal_then(@term_syntax.parse_term("IN((w : Cart[Real, 2]), cball((Cx(real_of_num(0)), (S : Real))))"), fn(x727 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s728 = @tactics.mp_tac(x727)
    fn(x729 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s728(x729)
    }
  })
  let t726 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t740 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset()])), t726), @tactics.disch_tac), t730), t731), t732), t733), t734), t735), t738), t739), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t725 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(cball((Cx(real_of_num(0)), (R : Real))), cball(((w : Cart[Real, 2]), R + (S : Real))))"), fn(x722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s723 = @tactics.assume_tac(x722)
    fn(x724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s723(x724)
    }
  })
  let t718 = @simp.rewrite_tac(@list.List([@topology.bounded_cball(), @measure.measurable_cball()]))
  let t717 = @tactics.match_mp_tac(inv_absolutely_integrable_bounded())
  let t716 = @tactics.match_mp_tac(@integration.absolutely_integrable_norm())
  let t715 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t714 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((y : Cart[Real, 2]) => lift(norm(inv(y - (w : Cart[Real, 2])))), cball((Cx(real_of_num(0)), (R : Real))))"), fn(x711 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x711
    let t713 = @drule.match_mp(@integration.integral_cmul())(th_2)
    @simp.simp_tac(@list.List([@equal.conv_rule(@equal.once_depth_conv(@equal.beta_conv), t713), @vectors.drop_cmul(), @realax.real_le_refl()]))
  })
  let t719 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.lift_cmul()])), t714), t715), t716), t717), t718)
  let t707 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t706 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t705 = @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_norm_mul()]))
  let t704 = @simp.rewrite_tac(@list.List([@vectors.lift_drop()]))
  let t708 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), @tactics.disch_tac), t704), t705), t706), t707)
  let t703 = @simp.rewrite_tac(@list.List([@topology.bounded_cball(), @measure.measurable_cball()]))
  let t702 = @tactics.match_mp_tac(inv_absolutely_integrable_bounded())
  let t701 = @tactics.match_mp_tac(@integration.absolutely_integrable_norm())
  let t700 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t699 = @tactics.match_mp_tac(@integration.integrable_cmul())
  let t709 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.lift_cmul()])), t699), t700), t701), t702), t703)
  let t696 = @simp.rewrite_tac(@list.List([@measure.measurable_cball()]))
  let t697 = @tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_imp_lebesgue_measurable()), t696)
  let t695 = @simp.asm_rewrite_tac(@list.List([@topology.bounded_cball()]))
  let t694 = @tactics.exists_tac(@term_syntax.parse_term("cball((Cx(real_of_num(0)), (R : Real)))"))
  let t693 = @tactics.match_mp_tac(@topology.bounded_subset())
  let t692 = @simp.asm_rewrite_tac(@list.List([]))
  let t698 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(cauchy_kernel_absolutely_integrable()), t692), t693), t694), t695), t697])
  let t691 = @simp.asm_rewrite_tac(@list.List([@sets.subset_univ()]))
  let t690 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t689 = @tactics.match_mp_tac(@measure.absolutely_integrable_on_lebesgue_measurable_subset())
  let t688 = @tactics.match_mp_tac(@integration.absolutely_integrable_norm())
  let t710 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable()), t688), t689), t690), t691), @tactics.conj_tac), t698), t709, t708])
  let t687 = @tactics.repeat_tac(@tactics.conj_tac)
  let t720 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@integration.integral_drop_le()), t687), t710), t719])
  let t686 = @tactics.exists_tac(@term_syntax.parse_term("drop(integral(cball((Cx(real_of_num(0)), (R : Real))), (y : Cart[Real, 2]) => lift((M : Real) * norm(inv(y - (w : Cart[Real, 2]))))))"))
  let t721 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t686), @tactics.conj_tac), t720), @tactics.all_tac])
  let t685 = @tactics.subgoal_then(@term_syntax.parse_term("drop(integral(cball((Cx(real_of_num(0)), (R : Real))), (y : Cart[Real, 2]) => lift(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : Cart[Real, 2])))))) <= (M : Real) * drop(integral(cball((Cx(real_of_num(0)), R)), (y : Cart[Real, 2]) => lift(norm(inv(y - w)))))"), fn(x681 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x681
    let t684 = @list.List([@tactics.accept_tac(th_1), @tactics.all_tac])
    let t683 = @tactics.exists_tac(@term_syntax.parse_term("(M : Real) * drop(integral(cball((Cx(real_of_num(0)), (R : Real))), (y : Cart[Real, 2]) => lift(norm(inv(y - (w : Cart[Real, 2]))))))"))
    @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t683), @tactics.conj_tac), t684)
  })
  let t678 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_div(), @complexes.complex_mul_lzero(), @complexes.complex_norm_cx(), @calc_int.real_abs_num(), @vectors.norm_0(), @vectors.lift_num()]))
  let t677 = @simp.simp_tac(@list.List([]))
  let t676 = @simp.rewrite_tac(@list.List([@iterate.support(), @sets.in_elim_thm(), @sets.in_univ(), @vectors.neutral_vector_add()]))
  let t675 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset()])), @tactics.all_tac])
  let t679 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!IN((y : Cart[Real, 2]), support(op_plus, (u : (Cart[Real, 2]) -> Cart[Real, 2]), UNIV))"), fn(x672 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s673 = @tactics.mp_tac(x672)
    fn(x674 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s673(x674)
    }
  }), t675), t676), t677), t678])
  let t671 = @tactics.subgoal_then(@term_syntax.parse_term("(u : (Cart[Real, 2]) -> Cart[Real, 2])((y : Cart[Real, 2])) == vec(0)"), fn(x668 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s669 = @tactics.subst1_tac(x668)
    fn(x670 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s669(x670)
    }
  })
  let t667 = @simp.asm_rewrite_tac(@list.List([]))
  let t666 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t665 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t664 = @tactics.match_mp_tac(@integration.integral_eq())
  let t663 = @simp.gen_rewrite_tac(fn(x660 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s661 = @equal.land_conv(x660)
    fn(x662 : @kernel.Term) -> @kernel.Thm raise {
      s661(x662)
    }
  }, @list.List([@equal.gsym(@integration.integral_restrict_univ())]))
  let t680 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t663), t664), t665), t666), @class.cond_cases_tac), t667), t671), t679), @tactics.all_tac])
  let t659 = @tactics.subgoal_then(@term_syntax.parse_term("integral(UNIV, (y : Cart[Real, 2]) => lift(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : Cart[Real, 2]))))) == integral(cball((Cx(real_of_num(0)), (R : Real))), (y : Cart[Real, 2]) => lift(norm(u(y) / (y - w))))"), fn(x656 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s657 = @tactics.subst1_tac(x656)
    fn(x658 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s657(x658)
    }
  })
  let t655 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t652 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.norm_pos_le()]))
  let t651 = @tactics.disch_then(fn(x647 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x647
    let t649 = @drule.match_mp(@integration.absolutely_integrable_norm())(th)
    let t650 = @equal.conv_rule(@equal.once_depth_conv(@equal.beta_conv), t649)
    @tactics.accept_tac(@drule.match_mp(@integration.absolutely_integrable_imp_integrable())(t650))
  })
  let t646 = @simp.rewrite_tac(@list.List([@complexes.complex_sub_rzero()]))
  let t643 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t653 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x645 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x640 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s641 = @tactics.mp_tac(x640)
      fn(x642 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s641(x642)
      }
    })(((x644 : @kernel.Thm) => @bool.spec(t643, x644))(x645))
  }), t646), t651), t652])
  let t639 = @tactics.match_mp_tac(@integration.integral_drop_pos())
  let t638 = @simp.asm_rewrite_tac(@list.List([]))
  let t637 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t654 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("C"), t637), t638), t639), @tactics.conj_tac), t653), @tactics.all_tac])
  let t636 = @tactics.exists_tac(@term_syntax.parse_term("(C : Real)"))
  let t635 = @simp.abbrev_tac(@term_syntax.parse_term("(C : Real) == (M : Real) * drop(integral(cball((Cx(real_of_num(0)), (R : Real) + (S : Real))), (z : Cart[Real, 2]) => lift(norm(inv(z)))))"))
  let t633 = @simp.rewrite_tac(@list.List([@topology.bounded_cball(), @measure.measurable_cball()]))
  let t634 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(inv_absolutely_integrable_bounded())), t633), @tactics.all_tac])
  let t632 = @tactics.subgoal_then(@term_syntax.parse_term("∀ w : Cart[Real, 2], absolutely_integrable_on((z : Cart[Real, 2]) => inv(z - w), cball((Cx(real_of_num(0)), (R : Real) + (S : Real))))"), fn(x629 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s630 = @tactics.assume_tac(x629)
    fn(x631 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s630(x631)
    }
  })
  let t627 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_0()]))
  let t626 = @simp.rewrite_tac(@list.List([@iterate.support(), @sets.in_elim_thm(), @sets.in_univ(), @vectors.neutral_vector_add()]))
  let t625 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset()])), @tactics.all_tac])
  let t624 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((y : Cart[Real, 2]), support(op_plus, (u : (Cart[Real, 2]) -> Cart[Real, 2]), UNIV))"), fn(x621 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s622 = @tactics.mp_tac(x621)
    fn(x623 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s622(x623)
    }
  })
  let t620 = @list.List([@simp.asm_simp_tac(@list.List([])), @tactics.all_tac])
  let t619 = @class.asm_cases_tac(@term_syntax.parse_term("IN((y : Cart[Real, 2]), cball((Cx(real_of_num(0)), (R : Real))))"))
  let t618 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t617 = @tactics.exists_tac(@term_syntax.parse_term("(M : Real)"))
  let t616 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(M : Real)"))(@tactics.strip_assume_tac))
  let t615 = @simp.rewrite_tac(@list.List([@topology.bounded_pos(), @sets.forall_in_image()]))
  let t612 = @drule.match_mp(@topology.compact_imp_bounded())
  let t614 = @tactics.disch_then(fn(x613 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x609 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s610 = @tactics.mp_tac(x609)
      fn(x611 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s610(x611)
      }
    })(t612(x613))
  })
  let t607 = @simp.rewrite_tac(@list.List([@topology.compact_cball()]))
  let t606 = @simp.asm_rewrite_tac(@list.List([@sets.subset_univ()]))
  let t605 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t608 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t605), t606), t607])), @tactics.all_tac])
  let t603 = @term_syntax.parse_term("cball((Cx(real_of_num(0)), (R : Real)))")
  let t604 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(u : (Cart[Real, 2]) -> Cart[Real, 2])"), t603]), @topology.compact_continuous_image()))
  let t602 = @simp.asm_rewrite_tac(@list.List([@topology.closure_univ(), @sets.in_univ()]))
  let t601 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t628 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(u : (Cart[Real, 2]) -> Cart[Real, 2])"), t601]), @topology.continuous_on_closure())), t602), @tactics.disch_tac), t604), @tactics.ants_tac), t608), t614), t615), t616), t617), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t618), t619), t620), t624), t625), t626), @tactics.disch_tac), t627), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t600 = @tactics.subgoal_then(@term_syntax.parse_term("∃ M : Real, real_of_num(0) <= M && (∀ y : Cart[Real, 2], norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y)) <= M)"), @tactics.strip_assume_tac)
  let t599 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(S : Real)"))(@tactics.strip_assume_tac))
  let t596 = @drule.match_mp(@topology.bounded_subset_cball())
  let t593 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t598 = @tactics.disch_then(fn(x597 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s591 = @tactics.mp_tac(x590)
        fn(x592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s591(x592)
        }
      })(((x594 : @kernel.Thm) => @bool.spec(t593, x594))(x595))
    })(t596(x597))
  })
  let t587 = @drule.match_mp(@topology.compact_imp_bounded())
  let t589 = @tactics.first_x_assum(fn(x588 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x584 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s585 = @tactics.mp_tac(x584)
      fn(x586 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s585(x586)
      }
    })(t587(x588))
  })
  let t583 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(R : Real)"))(@tactics.strip_assume_tac))
  let t580 = @drule.match_mp(@topology.bounded_subset_cball())
  let t577 = @term_syntax.parse_term("Cx(real_of_num(0))")
  let t582 = @tactics.first_x_assum(fn(x581 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s575 = @tactics.mp_tac(x574)
        fn(x576 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s575(x576)
        }
      })(((x578 : @kernel.Thm) => @bool.spec(t577, x578))(x579))
    })(t580(x581))
  })
  let t767 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t582), t583), t589), t598), t599), t600), t628), t632), t634), t635), t636), @tactics.conj_tac), t654), t655), @tactics.disch_tac), t659), t680), t685), t721), t725), t740), t745), t754), t757), t758), @tactics.ap_term_tac), @tactics.ap_term_tac), t762), t763), t764), t765), t766), @tactics.disch_tac), @tactics.beta_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @complexes.simple_complex_arith_tac)
  cauchy_kernel_norm_uniform_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, 2]) -> Cart[Real, 2], ∀ K : (Cart[Real, 2]) -> Bool, continuous_on(u, UNIV) && bounded(support(op_plus, u, UNIV)) && compact(K) → (∃ C : Real, real_of_num(0) <= C && (∀ w : Cart[Real, 2], IN(w, K) → drop(integral(UNIV, (y : Cart[Real, 2]) => lift(norm(u(y) / (y - w))))) <= C))"), t767))
}

///|
let cauchy_kernel_norm_uniform_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CAUCHY_KERNEL_NORM_UNIFORM_BOUND")

///|
/// `CAUCHY_KERNEL_NORM_UNIFORM_BOUND`
pub fn cauchy_kernel_norm_uniform_bound() -> @kernel.Thm {
  cauchy_kernel_norm_uniform_bound_c.get()
}

///|
/// SUPPORT_BOUNDED_OUTSIDE
fn step_32() -> Unit raise {
  let t778 = @simp.asm_rewrite_tac(@list.List([]))
  let t777 = @simp.rewrite_tac(@list.List([@iterate.in_support(), @sets.in_univ(), @vectors.neutral_vector_add()]))
  let t773 = @term_syntax.parse_term("(y : Cart[Real, M])")
  let t776 = @tactics.first_x_assum(fn(x775 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s771 = @tactics.mp_tac(x770)
      fn(x772 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s771(x772)
      }
    })(((x774 : @kernel.Thm) => @bool.spec(t773, x774))(x775))
  })
  let t769 = @simp.asm_rewrite_tac(@list.List([]))
  let t768 = @class.asm_cases_tac(@term_syntax.parse_term("(u : (Cart[Real, M]) -> Cart[Real, N])((y : Cart[Real, M])) == vec(0)"))
  let t779 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t768), t769), t776), t777), t778), @calc_rat.asm_real_arith_tac)
  support_bounded_outside_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, M]) -> Cart[Real, N], ∀ R : Real, ∀ y : Cart[Real, M], (∀ z : Cart[Real, M], IN(z, support(op_plus, u, UNIV)) → norm(z) <= R) && norm(y) > R → u(y) == vec(0)"), t779))
}

///|
let support_bounded_outside_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUPPORT_BOUNDED_OUTSIDE")

///|
/// `SUPPORT_BOUNDED_OUTSIDE`
pub fn support_bounded_outside() -> @kernel.Thm {
  support_bounded_outside_c.get()
}

///|
/// CAUCHY_KERNEL_NORM_TRUNC_INTEGRABLE
fn step_33() -> Unit raise {
  let t803 = @simp.rewrite_tac(@list.List([@vectors.real_abs_norm(), @realax.real_le_refl()]))
  let t802 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @vectors.norm_lift(), @vectors.lift_drop(), @realax.real_min()]))
  let t804 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), t802), @class.cond_cases_tac), t803), @calc_rat.asm_real_arith_tac)
  let t801 = @simp.asm_rewrite_tac(@list.List([]))
  let t800 = @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())
  let t805 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.absolutely_integrable_imp_lift_norm_integrable()), t800), t801)
  let t799 = @simp.asm_rewrite_tac(@list.List([@measure.measurable_on_const()]))
  let t798 = @tactics.match_mp_tac(@measure.measurable_on_min())
  let t796 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_()), @vectors.lift_drop(), @realax.real_min()]))
  let t795 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), @cart.dimindex_1(), @vectors.forall_1()]))
  let t794 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t797 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t794), t795), t796), @tactics.all_tac])
  let t793 = @tactics.subgoal_then(@term_syntax.parse_term("((y : Cart[Real, 2]) => lift(min(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : Cart[Real, 2]))), real_of_num((n : Num))))) == ((y : Cart[Real, 2]) => lambda((i : Num) => min(op_dollar(lift(norm(u(y) / (y - w))), i), op_dollar(lift(real_of_num(n)), i))))"), fn(x790 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s791 = @tactics.subst1_tac(x790)
    fn(x792 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s791(x792)
    }
  })
  let t788 = @simp.asm_rewrite_tac(@list.List([]))
  let t787 = @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())
  let t786 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_lift_norm_integrable())
  let t789 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.integrable_imp_measurable()), t786), t787), t788), @tactics.all_tac])
  let t806 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("measurable_on((y : Cart[Real, 2]) => lift(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : Cart[Real, 2])))), UNIV)"), fn(x783 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s784 = @tactics.assume_tac(x783)
    fn(x785 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s784(x785)
    }
  }), t789), t793), t797), t798), t799), t805, t804])
  let t782 = @tactics.repeat_tac(@tactics.conj_tac)
  let t781 = @tactics.exists_tac(@term_syntax.parse_term("(y : Cart[Real, 2]) => lift(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : Cart[Real, 2]))))"))
  let t780 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_integrable())
  let t807 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t780), t781), t782), t806)
  cauchy_kernel_norm_trunc_integrable_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ n : Num, continuous_on(u, UNIV) && bounded(support(op_plus, u, UNIV)) → integrable_on((y : Cart[Real, 2]) => lift(min(norm(u(y) / (y - w)), real_of_num(n))), UNIV)"), t807))
}

///|
let cauchy_kernel_norm_trunc_integrable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CAUCHY_KERNEL_NORM_TRUNC_INTEGRABLE")

///|
/// `CAUCHY_KERNEL_NORM_TRUNC_INTEGRABLE`
pub fn cauchy_kernel_norm_trunc_integrable() -> @kernel.Thm {
  cauchy_kernel_norm_trunc_integrable_c.get()
}

///|
/// CAUCHY_KERNEL_NORM_TRUNC_CONTINUOUS
fn step_34() -> Unit raise {
  let t903 = @tactics.disch_then(fn(x901 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x901
    @tactics.accept_tac(@bool.conjunct2(th_2))
  })
  let t900 = @tactics.disch_then(fn(x896 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x896
    let t899 = @simp.asm_rewrite_tac(@list.List([@integration.negligible_sing()]))
    let t898 = @tactics.mp_tac(th_1)
    @tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t898), t899)
  })
  let t895 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @sets.in_diff(), @sets.in_sing()]))
  let t894 = @tactics.conv_tac(@equal.land_conv(@equal.depth_conv(@equal.beta_conv)))
  let t889 = @term_syntax.parse_term("{(w0 : Cart[Real, 2])}")
  let t890 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t891 = @term_syntax.parse_term("(y : Cart[Real, 2]) => if IN(y, cball((vec(0), (R : Real)))) { lift(real_of_num((n : Num))) } else { vec(0) }")
  let t892 = @term_syntax.parse_term("(y : Cart[Real, 2]) => lift(min(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w0 : Cart[Real, 2]))), real_of_num((n : Num))))")
  let t893 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(k : Num) => (y : Cart[Real, 2]) => lift(min(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : (Num) -> Cart[Real, 2])(k))), real_of_num((n : Num))))"), t892, t891, t890, t889]), @integration.dominated_convergence_ae()))
  let t886 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t883 = @meson.asm_meson_tac(@list.List([]))
  let t884 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_sub_0()])), t883)
  let t882 = @simp.asm_rewrite_tac(@list.List([]))
  let t881 = @simp.rewrite_tac(@list.List([@topology.lim_const()]))
  let t885 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.lim_sub()), t881), t882), t884])
  let t880 = @tactics.match_mp_tac(@canal.lim_complex_inv())
  let t879 = @list.List([@simp.rewrite_tac(@list.List([@topology.lim_const()])), @tactics.all_tac])
  let t878 = @tactics.match_mp_tac(@canal.lim_complex_mul())
  let t877 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t887 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.lim_norm()), t877), t878), @tactics.conj_tac), t879), t880), @tactics.conj_tac), t885), t886])
  let t876 = @tactics.match_mp_tac(@topology.lim_min())
  let t874 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_()), @vectors.lift_drop(), @realax.real_min()]))
  let t875 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), @cart.dimindex_1(), @vectors.forall_1()]))), t874), @tactics.all_tac])
  let t873 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], lift(min(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])((y : Cart[Real, 2])) / (y - z)), real_of_num((n : Num)))) == lambda((i : Num) => min(op_dollar(lift(norm(u(y) / (y - z))), i), op_dollar(lift(real_of_num(n)), i)))"), fn(x871 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x871
    @simp.rewrite_tac(@list.List([th]))
  })
  let t888 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), @tactics.disch_tac), t873), t875), t876), @tactics.conj_tac), t887), @tactics.all_tac])
  let t870 = @tactics.subgoal_then(@term_syntax.parse_term("∀ y : Cart[Real, 2], !(y == (w0 : Cart[Real, 2])) → op_minus_minus_gt((k : Num) => lift(min(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : (Num) -> Cart[Real, 2])(k))), real_of_num((n : Num)))), lift(min(norm(u(y) / (y - w0)), real_of_num(n))), sequentially)"), fn(x867 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s868 = @tactics.assume_tac(x867)
    fn(x869 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s868(x869)
    }
  })
  let t862 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_vec_0(), @complexes.complex_mul_lzero(), @complexes.complex_norm_cx(), @calc_int.real_abs_num(), @realax.real_min()])), @calc_rat.real_arith_tac)
  let t861 = @simp.rewrite_tac(@list.List([@topology.in_cball_0()]))
  let t860 = @tactics.pop_assum(fn(x857 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s858 = @tactics.mp_tac(x857)
    fn(x859 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s858(x859)
    }
  })
  let t856 = @tactics.disch_then(@tactics.match_mp_tac)
  let t855 = @simp.asm_rewrite_tac(@list.List([]))
  let t853 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t854 = @term_syntax.parse_term("(R : Real)")
  let t863 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(u : (Cart[Real, 2]) -> Cart[Real, 2])"), t854, t853]), support_bounded_outside())), t855), t856), t860), t861), @calc_rat.asm_real_arith_tac), t862])
  let t852 = @tactics.subgoal_then(@term_syntax.parse_term("(u : (Cart[Real, 2]) -> Cart[Real, 2])((y : Cart[Real, 2])) == vec(0)"), fn(x849 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s850 = @tactics.subst1_tac(x849)
    fn(x851 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s850(x851)
    }
  })
  let t864 = @tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.drop_vec()])), t852), t863)
  let t848 = @simp.rewrite_tac(@list.List([@vectors.real_abs_norm()]))
  let t847 = @simp.rewrite_tac(@list.List([@realax.real_min()]))
  let t865 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.lift_drop()])), t847), @class.cond_cases_tac), t848), @calc_rat.asm_real_arith_tac), t864])
  let t846 = @class.asm_cases_tac(@term_syntax.parse_term("IN((y : Cart[Real, 2]), cball((vec(0), (R : Real))))"))
  let t845 = @simp.rewrite_tac(@list.List([@vectors.norm_lift()]))
  let t866 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t845), t846), t865), @tactics.all_tac])
  let t844 = @tactics.subgoal_then(@term_syntax.parse_term("∀ k : Num, ∀ y : Cart[Real, 2], !(y == (w0 : Cart[Real, 2])) → norm(lift(min(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : (Num) -> Cart[Real, 2])(k))), real_of_num((n : Num))))) <= drop(if IN(y, cball((vec(0), (R : Real)))) { lift(real_of_num(n)) } else { vec(0) })"), fn(x841 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s842 = @tactics.assume_tac(x841)
    fn(x843 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s842(x843)
    }
  })
  let t835 = @simp.rewrite_tac(@list.List([@measure.integrable_on_const(), @measure.measurable_cball()]))
  let t834 = @simp.asm_rewrite_tac(@list.List([]))
  let t836 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), @tactics.disch_tac), @tactics.beta_tac), t834), t835])
  let t833 = @tactics.exists_tac(@term_syntax.parse_term("(y : Cart[Real, 2]) => lift(real_of_num((n : Num)))"))
  let t837 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integrable_eq()), t833), @tactics.conj_tac), t836)
  let t838 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t832 = @simp.asm_rewrite_tac(@list.List([]))
  let t831 = @simp.rewrite_tac(@list.List([]))
  let t839 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), t831), @tactics.disch_tac), t832), t838, t837])
  let t830 = @tactics.repeat_tac(@tactics.conj_tac)
  let t829 = @tactics.exists_tac(@term_syntax.parse_term("(cball : ((Cart[Real, 2], Real), Cart[Real, 2]) -> Bool)(((vec : (Num) -> Cart[Real, 2])(0), (R : Real)))"))
  let t840 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integrable_on_superset()), t829), t830), t839), @tactics.all_tac])
  let t828 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((y : Cart[Real, 2]) => if IN(y, cball((vec(0), (R : Real)))) { lift(real_of_num((n : Num))) } else { vec(0) }, UNIV)"), fn(x825 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s826 = @tactics.assume_tac(x825)
    fn(x827 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s826(x827)
    }
  })
  let t823 = @simp.asm_rewrite_tac(@list.List([]))
  let t824 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(cauchy_kernel_norm_trunc_integrable())), t823), @tactics.all_tac])
  let t822 = @tactics.subgoal_then(@term_syntax.parse_term("∀ k : Num, integrable_on((y : Cart[Real, 2]) => lift(min(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : (Num) -> Cart[Real, 2])(k))), real_of_num((n : Num)))), UNIV)"), fn(x819 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s820 = @tactics.assume_tac(x819)
    fn(x821 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s820(x821)
    }
  })
  let t818 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(R : Real)"))(@tactics.strip_assume_tac))
  let t815 = @simp.gen_rewrite_rule(fn(x814 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x814
  }, @list.List([@topology.bounded_pos()]))
  let t817 = @tactics.first_assum(fn(x816 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x811 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s812 = @tactics.mp_tac(x811)
      fn(x813 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s812(x813)
      }
    })(t815(x816))
  })
  let t809 = @term_syntax.parse_term("(w0 : Cart[Real, 2])")
  let t810 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(w : (Num) -> Cart[Real, 2])"), t809]))
  let t808 = @simp.rewrite_tac(@list.List([@topology.continuous_on_sequentially(), @sets.in_univ(), @trivia.o_def()]))
  let t904 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t808), t810), @tactics.disch_tac), t817), t818), t822), t824), t828), t840), t844), t866), t870), t888), t893), t894), t895), t900), t903)
  cauchy_kernel_norm_trunc_continuous_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, 2]) -> Cart[Real, 2], ∀ n : Num, continuous_on(u, UNIV) && bounded(support(op_plus, u, UNIV)) → continuous_on((w : Cart[Real, 2]) => integral(UNIV, (y : Cart[Real, 2]) => lift(min(norm(u(y) / (y - w)), real_of_num(n)))), UNIV)"), t904))
}

///|
let cauchy_kernel_norm_trunc_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CAUCHY_KERNEL_NORM_TRUNC_CONTINUOUS")

///|
/// `CAUCHY_KERNEL_NORM_TRUNC_CONTINUOUS`
pub fn cauchy_kernel_norm_trunc_continuous() -> @kernel.Thm {
  cauchy_kernel_norm_trunc_continuous_c.get()
}

///|
/// CAUCHY_KERNEL_NORM_TRUNC_CONVERGES
fn step_35() -> Unit raise {
  let t935 = @tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([])))
  let t930 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_le())]))
  let t929 = @tactics.undisch_tac(@term_syntax.parse_term("(N : Num) <= (k : Num)"))
  let t928 = @simp.rewrite_tac(@list.List([@real.real_not_le()]))
  let t927 = @tactics.undisch_tac(@term_syntax.parse_term("!(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])((y : Cart[Real, 2])) / (y - (w : Cart[Real, 2]))) <= real_of_num((k : Num)))"))
  let t926 = @simp.rewrite_tac(@list.List([]))
  let t925 = @simp.rewrite_tac(@list.List([@realax.real_min()]))
  let t924 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t923 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num)"))
  let t920 = @term_syntax.parse_term("(N : Num)")
  let t922 = @tactics.disch_then((x921 : @kernel.Thm) => @tactics.x_choose_tac(t920, x921))
  let t919 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("norm((u : (Cart[Real, 2]) -> Cart[Real, 2])((y : Cart[Real, 2])) / (y - (w : Cart[Real, 2])))"), @real.real_arch_simple()))
  let t918 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t917 = @tactics.match_mp_tac(@topology.lim_eventually())
  let t931 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), t917), t918), t919), t922), t923), t924), @tactics.disch_tac), @tactics.ap_term_tac), t925), @class.cond_cases_tac), t926), t927), t928), @tactics.disch_tac), t929), t930), @calc_rat.asm_real_arith_tac)
  let t916 = @simp.rewrite_tac(@list.List([@vectors.real_abs_norm(), @realax.real_le_refl()]))
  let t915 = @simp.rewrite_tac(@list.List([@vectors.norm_lift(), @vectors.lift_drop(), @realax.real_min()]))
  let t932 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t915), @class.cond_cases_tac), t916), @calc_rat.asm_real_arith_tac)
  let t914 = @simp.asm_rewrite_tac(@list.List([]))
  let t913 = @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())
  let t933 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.absolutely_integrable_imp_lift_norm_integrable()), t913), t914)
  let t912 = @simp.asm_rewrite_tac(@list.List([]))
  let t934 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(cauchy_kernel_norm_trunc_integrable())), t912), t933, t932, t931])
  let t936 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t934), t935])
  let t911 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @sets.in_diff(), @sets.not_in_empty(), @integration.negligible_empty()]))
  let t910 = @tactics.conv_tac(@equal.land_conv(@equal.depth_conv(@equal.beta_conv)))
  let t905 = @term_syntax.parse_term("({} : (Cart[Real, 2]) -> Bool)")
  let t906 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t907 = @term_syntax.parse_term("(y : Cart[Real, 2]) => lift(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : Cart[Real, 2]))))")
  let t908 = @term_syntax.parse_term("(y : Cart[Real, 2]) => lift(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : Cart[Real, 2]))))")
  let t909 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(k : Num) => (y : Cart[Real, 2]) => lift(min(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (w : Cart[Real, 2]))), real_of_num(k)))"), t908, t907, t906, t905]), @integration.dominated_convergence_ae()))
  let t937 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t909), t910), t911), @tactics.ants_tac), t936)
  cauchy_kernel_norm_trunc_converges_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], continuous_on(u, UNIV) && bounded(support(op_plus, u, UNIV)) → op_minus_minus_gt((n : Num) => integral(UNIV, (y : Cart[Real, 2]) => lift(min(norm(u(y) / (y - w)), real_of_num(n)))), integral(UNIV, (y : Cart[Real, 2]) => lift(norm(u(y) / (y - w)))), sequentially)"), t937))
}

///|
let cauchy_kernel_norm_trunc_converges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CAUCHY_KERNEL_NORM_TRUNC_CONVERGES")

///|
/// `CAUCHY_KERNEL_NORM_TRUNC_CONVERGES`
pub fn cauchy_kernel_norm_trunc_converges() -> @kernel.Thm {
  cauchy_kernel_norm_trunc_converges_c.get()
}

///|
/// CAUCHY_KERNEL_WEIGHTED_MEASURABLE
fn step_36() -> Unit raise {
  let t969 = @simp.asm_rewrite_tac(@list.List([]))
  let t967 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((x : Cart[Real, Unit]))")
  let t968 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(u : (Cart[Real, 2]) -> Cart[Real, 2])"), t967]), cauchy_kernel_norm_trunc_converges()))
  let t970 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])")), @tactics.disch_tac), t968), t969)
  let t964 = @simp.asm_rewrite_tac(@list.List([]))
  let t963 = @tactics.match_mp_tac(cauchy_kernel_norm_trunc_continuous())
  let t962 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t961 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t965 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t961), t962), t963), t964)
  let t966 = @list.List([@meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path(), @paths.path()])), t965])
  let t960 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t959 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t958 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, Unit]) => integral(UNIV, (y : Cart[Real, 2]) => lift(min(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x))), real_of_num((nn : Num)))))) == o((w : Cart[Real, 2]) => integral(UNIV, (y : Cart[Real, 2]) => lift(min(norm(u(y) / (y - w)), real_of_num(nn)))), g)"), fn(x955 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s956 = @tactics.subst1_tac(x955)
    fn(x957 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s956(x957)
    }
  })
  let t954 = @simp.rewrite_tac(@list.List([@topology.closed_interval()]))
  let t953 = @tactics.match_mp_tac(@measure.continuous_imp_measurable_on_closed_subset())
  let t971 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(nn : Num)")), t953), t954), t958), t959), t960), @tactics.conj_tac), t966), t970])
  let t952 = @simp.rewrite_tac(@list.List([@integration.negligible_empty(), @sets.in_diff(), @sets.not_in_empty(), @sets.in_univ()]))
  let t951 = @tactics.conv_tac(@equal.land_conv(@equal.depth_conv(@equal.beta_conv)))
  let t948 = @term_syntax.parse_term("({} : (Cart[Real, Unit]) -> Bool)")
  let t949 = @term_syntax.parse_term("(interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])")
  let t950 = @term_syntax.parse_term("(x : Cart[Real, Unit]) => integral(UNIV, (y : Cart[Real, 2]) => lift(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x)))))")
  let t972 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (x : Cart[Real, Unit]) => integral(UNIV, (y : Cart[Real, 2]) => lift(min(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x))), real_of_num(n))))"), t950, t949, t948]), @measure.measurable_on_limit())), t951), t952), @tactics.conj_tac), t971)
  let t947 = @simp.asm_rewrite_tac(@list.List([]))
  let t946 = @tactics.match_mp_tac(@measure.absolutely_integrable_vector_derivative_absolutely_continuous())
  let t945 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t944 = @tactics.match_mp_tac(@measure.integrable_imp_measurable())
  let t973 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_on_norm()), t944), t945), t946), t947), t972])
  let t943 = @tactics.match_mp_tac(@measure.measurable_on_drop_mul())
  let t942 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @vectors.lift_drop()])), @tactics.all_tac])
  let t941 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, Unit]) => op_pct(norm(vector_derivative((g : (Cart[Real, Unit]) -> Cart[Real, 2]), at(x))), integral(UNIV, (y : Cart[Real, 2]) => lift(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - g(x))))))) == ((x : Cart[Real, Unit]) => op_pct(drop(((x : Cart[Real, Unit]) => lift(norm(vector_derivative(g, at(x)))))(x)), ((x : Cart[Real, Unit]) => integral(UNIV, (y : Cart[Real, 2]) => lift(norm(u(y) / (y - g(x))))))(x)))"), fn(x938 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s939 = @tactics.subst1_tac(x938)
    fn(x940 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s939(x940)
    }
  })
  let t974 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t941), t942), t943), @tactics.conj_tac), t973)
  cauchy_kernel_weighted_measurable_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], continuous_on(u, UNIV) && bounded(support(op_plus, u, UNIV)) && absolutely_continuous_on(g, interval([(vec(0), vec(1))])) → measurable_on((x : Cart[Real, Unit]) => op_pct(norm(vector_derivative(g, at(x))), integral(UNIV, (y : Cart[Real, 2]) => lift(norm(u(y) / (y - g(x)))))), interval([(vec(0), vec(1))]))"), t974))
}

///|
let cauchy_kernel_weighted_measurable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CAUCHY_KERNEL_WEIGHTED_MEASURABLE")

///|
/// `CAUCHY_KERNEL_WEIGHTED_MEASURABLE`
pub fn cauchy_kernel_weighted_measurable() -> @kernel.Thm {
  cauchy_kernel_weighted_measurable_c.get()
}

///|
/// NEGLIGIBLE_ABSOLUTELY_CONTINUOUS_PATH_IMAGE
fn step_37() -> Unit raise {
  let t978 = @simp.rewrite_tac(@list.List([@cart.dimindex_2()]))
  let t977 = @simp.asm_rewrite_tac(@list.List([@topology.is_interval_interval()]))
  let t976 = @tactics.match_mp_tac(@measure.negligible_absolutely_continuous_image_lowdim())
  let t975 = @simp.rewrite_tac(@list.List([@paths.path_image()]))
  let t979 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t975), t976), t977), t978), @int.arith_tac)
  negligible_absolutely_continuous_path_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], absolutely_continuous_on(g, interval([(vec(0), vec(1))])) → negligible(path_image(g))"), t979))
}

///|
let negligible_absolutely_continuous_path_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NEGLIGIBLE_ABSOLUTELY_CONTINUOUS_PATH_IMAGE")

///|
/// `NEGLIGIBLE_ABSOLUTELY_CONTINUOUS_PATH_IMAGE`
pub fn negligible_absolutely_continuous_path_image() -> @kernel.Thm {
  negligible_absolutely_continuous_path_image_c.get()
}

///|
/// PATH_INTEGRABLE_CONTINUOUS_ABSOLUTELY_CONTINUOUS
fn step_38() -> Unit raise {
  let t1034 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff()]))
  let t1033 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1032 = @tactics.match_mp_tac(@derivatives.vector_derivative_at())
  let t1031 = @simp.rewrite_tac(@list.List([@sets.in_diff()]))
  let t1030 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t1029 = @simp.asm_rewrite_tac(@list.List([]))
  let t1028 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1027 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t1026 = @tactics.conv_tac(@equal.land_conv(@equal.depth_conv(@equal.beta_conv)))
  let t1022 = @term_syntax.parse_term("(interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])")
  let t1023 = @term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool)")
  let t1024 = @term_syntax.parse_term("(t : Cart[Real, Unit]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * vector_derivative(g, at(t))")
  let t1025 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(t : Cart[Real, Unit]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * (gd : (Cart[Real, Unit]) -> Cart[Real, 2])(t)"), t1024, t1023, t1022]), @integration.integrable_spike()))
  let t1018 = @simp.asm_rewrite_tac(@list.List([@topology.compact_interval()]))
  let t1017 = @tactics.match_mp_tac(@topology.compact_continuous_image())
  let t1019 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.compact_imp_bounded()), t1017), t1018)
  let t1016 = @simp.asm_rewrite_tac(@list.List([@topology.closed_interval()]))
  let t1020 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@measure.continuous_imp_measurable_on_closed_subset()), t1016), t1019])
  let t1015 = @simp.asm_rewrite_tac(@list.List([@complexes.bilinear_complex_mul()]))
  let t1014 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("complex_mul"), @measure.absolutely_integrable_bounded_measurable_product()))
  let t1021 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable()), t1014), t1015), @tactics.conj_tac), t1020), @tactics.all_tac])
  let t1013 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((t : Cart[Real, Unit]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * (gd : (Cart[Real, Unit]) -> Cart[Real, 2])(t), interval([(vec(0), vec(1))]))"), fn(x1010 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1011 = @tactics.assume_tac(x1010)
    fn(x1012 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1011(x1012)
    }
  })
  let t1008 = @meson.asm_meson_tac(@list.List([@topology.continuous_on_subset(), @paths.path_image(), @sets.image_o(), @sets.subset_refl()]))
  let t1007 = @list.List([@meson.asm_meson_tac(@list.List([@paths.path()])), @tactics.all_tac])
  let t1006 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1009 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@trivia.o_def())])), t1006), @tactics.conj_tac), t1007), t1008), @tactics.all_tac])
  let t1005 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on((t : Cart[Real, Unit]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)), interval([(vec(0), vec(1))]))"), fn(x1002 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1003 = @tactics.assume_tac(x1002)
    fn(x1004 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1003(x1004)
    }
  })
  let t1000 = @meson.asm_meson_tac(@list.List([@integration.absolutely_continuous_on_imp_continuous(), @topology.is_interval_interval()]))
  let t1001 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.path()])), t1000), @tactics.all_tac])
  let t999 = @tactics.subgoal_then(@term_syntax.parse_term("path((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"), fn(x996 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s997 = @tactics.assume_tac(x996)
    fn(x998 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s997(x998)
    }
  })
  let t994 = @term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool)")
  let t995 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(gd : (Cart[Real, Unit]) -> Cart[Real, 2])"), t994]))
  let t993 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t990 = @drule.match_mp(@measure.absolutely_integrable_bounded_variation_derivative())
  let t992 = @tactics.first_assum(fn(x991 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x987 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s988 = @tactics.mp_tac(x987)
      fn(x989 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s988(x989)
      }
    })(t990(x991))
  })
  let t985 = @simp.asm_rewrite_tac(@list.List([@topology.bounded_interval()]))
  let t986 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@integration.absolutely_continuous_on_imp_has_bounded_variation_on()), t985), @tactics.all_tac])
  let t984 = @tactics.subgoal_then(@term_syntax.parse_term("has_bounded_variation_on((g : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([(vec(0), vec(1))]))"), fn(x981 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s982 = @tactics.assume_tac(x981)
    fn(x983 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s982(x983)
    }
  })
  let t980 = @simp.rewrite_tac(@list.List([@cauchy.path_integrable_on(), @cauchy.has_path_integral_v1(), @equal.gsym(@integration.integrable_on())]))
  let t1035 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t980), t984), t986), t992), t993), t995), @tactics.strip_tac), t999), t1001), t1005), t1009), t1013), t1021), t1025), t1026), t1027), t1028), t1029), t1030), t1031), @tactics.strip_tac), @tactics.ap_term_tac), t1032), t1033), t1034)
  path_integrable_continuous_absolutely_continuous_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], continuous_on(f, path_image(g)) && absolutely_continuous_on(g, interval([(vec(0), vec(1))])) → path_integrable_on(f, g)"), t1035))
}

///|
let path_integrable_continuous_absolutely_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PATH_INTEGRABLE_CONTINUOUS_ABSOLUTELY_CONTINUOUS")

///|
/// `PATH_INTEGRABLE_CONTINUOUS_ABSOLUTELY_CONTINUOUS`
pub fn path_integrable_continuous_absolutely_continuous() -> @kernel.Thm {
  path_integrable_continuous_absolutely_continuous_c.get()
}

///|
/// FUBINI_PATH_AREA
fn step_39() -> Unit raise {
  let t1207 = @simp.asm_rewrite_tac(@list.List([]))
  let t1206 = @tactics.match_mp_tac(@integration.integrable_neg())
  let t1204 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_neg(), @complexes.complex_mul_rneg(), @complexes.complex_mul_lneg()]))
  let t1203 = @simp.gen_rewrite_tac(fn(x1202 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1196 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1197 = @equal.land_conv(x1196)
      fn(x1198 : @kernel.Term) -> @kernel.Thm raise {
        s1197(x1198)
      }
    })((fn(x1199 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1200 = @equal.once_depth_conv(x1199)
      fn(x1201 : @kernel.Term) -> @kernel.Thm raise {
        s1200(x1201)
      }
    })(x1202))
  }, @list.List([@equal.gsym(@complexes.complex_neg_sub())]))
  let t1195 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t1205 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.complex_div()])), t1195), t1203), t1204), @tactics.all_tac])
  let t1194 = @tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => Cx(real_of_num(1)) / ((z : Cart[Real, 2]) - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * vector_derivative(g, at(t))) == ((t : Cart[Real, Unit]) => -(Cx(real_of_num(1)) / (g(t) - z) * vector_derivative(g, at(t))))"), fn(x1191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1192 = @tactics.subst1_tac(x1191)
    fn(x1193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1192(x1193)
    }
  })
  let t1187 = @meson.asm_meson_tac(@list.List([]))
  let t1186 = @simp.rewrite_tac(@list.List([]))
  let t1185 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((z : Cart[Real, 2]), path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))"))
  let t1184 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t1188 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_sub_0()])), t1184), @tactics.disch_tac), @tactics.disch_tac), t1185), t1186), t1187)
  let t1183 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const(), @topology.continuous_on_id()]))
  let t1189 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_sub()), t1183), t1188])
  let t1182 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const()]))
  let t1181 = @tactics.match_mp_tac(@canal.continuous_on_complex_div())
  let t1180 = @simp.asm_rewrite_tac(@list.List([]))
  let t1179 = @tactics.match_mp_tac(path_integrable_continuous_absolutely_continuous())
  let t1190 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@cauchy.path_integrable_on_v1())])), t1179), t1180), t1181), t1182), @tactics.conj_tac), t1189), @tactics.all_tac])
  let t1178 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((t : Cart[Real, Unit]) => Cx(real_of_num(1)) / ((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t) - (z : Cart[Real, 2])) * vector_derivative(g, at(t)), interval([(vec(0), vec(1))]))"), fn(x1175 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1176 = @tactics.assume_tac(x1175)
    fn(x1177 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1176(x1177)
    }
  })
  let t1174 = @tactics.match_mp_tac(@canal.integral_complex_lmul())
  let t1173 = @tactics.conv_tac(@equal.sym_conv)
  let t1172 = @list.List([@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_lid(), @complexes.complex_mul_assoc()]))), @tactics.all_tac])
  let t1171 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Unit], (u : (Cart[Real, 2]) -> Cart[Real, 2])((z : Cart[Real, 2])) / (z - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x)) * vector_derivative(g, at(x)) == u(z) * (Cx(real_of_num(1)) / (z - g(x)) * vector_derivative(g, at(x)))"), fn(x1169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x1169
    @simp.rewrite_tac(@list.List([th_3]))
  })
  let t1168 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t1167 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t1165 = @simp.asm_rewrite_tac(@list.List([]))
  let t1166 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(negligible_absolutely_continuous_path_image()), t1165), @tactics.all_tac])
  let t1164 = @tactics.exists_tac(@term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t1163 = @tactics.match_mp_tac(@integration.integral_spike())
  let t1162 = @tactics.first_x_assum(fn(x1157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1157
    @simp.gen_rewrite_tac(fn(x1159 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1160 = @equal.land_conv(x1159)
      fn(x1161 : @kernel.Term) -> @kernel.Thm raise {
        s1160(x1161)
      }
    }, @list.List([th_2]))
  })
  let t1155 = @simp.asm_rewrite_tac(@list.List([]))
  let t1154 = @tactics.match_mp_tac(@canal.integral_complex_rmul())
  let t1156 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.conv_tac(@equal.sym_conv)), t1154), t1155), @tactics.all_tac])
  let t1153 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Unit], integral(UNIV, (z : Cart[Real, 2]) => (u : (Cart[Real, 2]) -> Cart[Real, 2])(z) / (z - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x))) * vector_derivative(g, at(x)) == integral(UNIV, (z : Cart[Real, 2]) => u(z) / (z - g(x)) * vector_derivative(g, at(x)))"), fn(x1151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1151
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t1150 = @simp.rewrite_tac(@list.List([integral_if_const(), @integration.integral_restrict_univ()]))
  let t1149 = @simp.rewrite_tac(@list.List([@cart.fstcart_pastecart(), @cart.sndcart_pastecart()]))
  let t1146 = @drule.match_mp(@measure.fubini_integral_swap())
  let t1148 = @tactics.first_x_assum(fn(x1147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1143 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1144 = @tactics.mp_tac(x1143)
      fn(x1145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1144(x1145)
      }
    })(t1146(x1147))
  })
  let t1132 = @simp.asm_rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()]))
  let t1131 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t1130 = @simp.rewrite_tac(@list.List([@paths.path_image(), @sets.in_image()]))
  let t1133 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t1130), t1131), t1132)
  let t1128 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.norm_pos_le()]))
  let t1127 = @simp.asm_rewrite_tac(@list.List([]))
  let t1126 = @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())
  let t1125 = @tactics.match_mp_tac(@integration.absolutely_integrable_norm())
  let t1129 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable()), t1125), t1126), t1127), t1128])
  let t1134 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@integration.integral_drop_pos()), @tactics.conj_tac), t1129), t1133])
  let t1124 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (C : Real) → abs(x) <= C")))
  let t1135 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_real(), @equal.gsym(@vectors.drop_())])), t1124), @tactics.conj_tac), t1134)
  let t1136 = @list.List([@simp.rewrite_tac(@list.List([@vectors.norm_pos_le()])), t1135])
  let t1123 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1122 = @simp.gen_rewrite_tac(fn(x1119 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1120 = @equal.rand_conv(x1119)
    fn(x1121 : @kernel.Term) -> @kernel.Thm raise {
      s1120(x1121)
    }
  }, @list.List([@realax.real_mul_sym()]))
  let t1118 = @simp.rewrite_tac(@list.List([@vectors.drop_cmul(), @vectors.lift_drop()]))
  let t1117 = @simp.rewrite_tac(@list.List([@vectors.norm_mul(), @realax.real_abs(), @vectors.norm_pos_le()]))
  let t1116 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()]))
  let t1137 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.beta_tac, @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))), t1116), @tactics.disch_tac), t1117), t1118), t1122), t1123), @tactics.conj_tac), t1136)
  let t1115 = @simp.asm_rewrite_tac(@list.List([]))
  let t1114 = @simp.rewrite_tac(@list.List([@integration.absolutely_integrable_on()]))
  let t1113 = @simp.asm_rewrite_tac(@list.List([]))
  let t1112 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), @measure.absolutely_integrable_vector_derivative_absolutely_continuous()))
  let t1138 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integrable_cmul()), t1112), t1113), t1114), @tactics.strip_tac), t1115)
  let t1111 = @simp.asm_rewrite_tac(@list.List([]))
  let t1139 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(cauchy_kernel_weighted_measurable()), t1111), t1138, t1137])
  let t1110 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1109 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, Unit]) => op_pct((C : Real), lift(norm(vector_derivative((g : (Cart[Real, Unit]) -> Cart[Real, 2]), at(x)))))"))
  let t1108 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_integrable())
  let t1107 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(C : Real)"))(@tactics.strip_assume_tac))
  let t1105 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t1104 = @tactics.match_mp_tac(@paths.compact_path_image())
  let t1106 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1104), t1105), @tactics.all_tac])
  let t1102 = @term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t1103 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(u : (Cart[Real, 2]) -> Cart[Real, 2])"), t1102]), cauchy_kernel_norm_uniform_bound()))
  let t1101 = @simp.rewrite_tac(@list.List([@integration.integrable_restrict_univ()]))
  let t1098 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_0(), @vectors.lift_num(), @integration.integral_0()]))
  let t1097 = @simp.asm_rewrite_tac(@list.List([]))
  let t1096 = @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())
  let t1095 = @tactics.match_mp_tac(@integration.absolutely_integrable_norm())
  let t1094 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t1093 = @tactics.match_mp_tac(@integration.integral_cmul())
  let t1091 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul()]))
  let t1090 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t1089 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t1092 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), @tactics.gen_tac), t1089), t1090), t1091), @tactics.all_tac])
  let t1088 = @tactics.subgoal_then(@term_syntax.parse_term("((y : Cart[Real, 2]) => lift(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (g : (Cart[Real, Unit]) -> Cart[Real, 2])((x : Cart[Real, Unit]))) * vector_derivative(g, at(x))))) == ((y : Cart[Real, 2]) => op_pct(norm(vector_derivative(g, at(x))), lift(norm(u(y) / (y - g(x))))))"), fn(x1085 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1086 = @tactics.subst1_tac(x1085)
    fn(x1087 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1086(x1087)
    }
  })
  let t1099 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1088), t1092), t1093), t1094), t1095), t1096), t1097), t1098])
  let t1084 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t1100 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t1084), @class.cond_cases_tac), t1099), @tactics.all_tac])
  let t1140 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, Unit]) => integral(UNIV, (y : Cart[Real, 2]) => lift(norm(if IN(x, interval([(vec(0), vec(1))])) { (u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x)) * vector_derivative(g, at(x)) } else { vec(0) })))) == ((x : Cart[Real, Unit]) => if IN(x, interval([(vec(0), vec(1))])) { op_pct(norm(vector_derivative(g, at(x))), integral(UNIV, (y : Cart[Real, 2]) => lift(norm(u(y) / (y - g(x)))))) } else { vec(0) })"), fn(x1081 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1082 = @tactics.subst1_tac(x1081)
    fn(x1083 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1082(x1083)
    }
  }), t1100), t1101), t1103), @tactics.ants_tac), t1106), t1107), t1108), t1109), t1110), t1139)
  let t1079 = @simp.rewrite_tac(@list.List([@integration.negligible_empty()]))
  let t1077 = @simp.asm_rewrite_tac(@list.List([@integration.absolutely_integrable_on(), @vectors.norm_0(), @vectors.lift_num(), @integration.integrable_0()]))
  let t1076 = @simp.asm_rewrite_tac(@list.List([]))
  let t1075 = @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())
  let t1074 = @tactics.match_mp_tac(@canal.absolutely_integrable_complex_rmul())
  let t1078 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1074), t1075), t1076), t1077])
  let t1073 = @class.asm_cases_tac(@term_syntax.parse_term("IN((t : Cart[Real, Unit]), interval([(vec(0), vec(1))]))"))
  let t1072 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!!(p : Bool) == p"))]))
  let t1071 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t1080 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty()])), t1071), t1072), t1073), t1078), t1079])
  let t1141 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("{(x : Cart[Real, Unit]) | !absolutely_integrable_on((y : Cart[Real, 2]) => if IN(x, interval([(vec(0), vec(1))])) { (u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x)) * vector_derivative(g, at(x)) } else { vec(0) }, UNIV)} == {}"), fn(x1068 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1069 = @tactics.subst1_tac(x1068)
    fn(x1070 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1069(x1070)
    }
  }), t1080), t1140])
  let t1067 = @simp.rewrite_tac(@list.List([@cart.fstcart_pastecart(), @cart.sndcart_pastecart()]))
  let t1066 = @tactics.disch_then(fn(x1064 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1064
    @simp.rewrite_tac(@list.List([th]))
  })
  let t1061 = @drule.match_mp(@measure.fubini_tonelli())
  let t1063 = @tactics.disch_then(fn(x1062 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1058 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1059 = @tactics.mp_tac(x1058)
      fn(x1060 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1059(x1060)
      }
    })(t1061(x1062))
  })
  let t1056 = @simp.asm_rewrite_tac(@list.List([]))
  let t1057 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(measurable_on_fubini_integrand()), t1056), @tactics.all_tac])
  let t1142 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("measurable_on((p : Cart[Real, Finite_sum[Unit, 2]]) => if IN(fstcart(p), interval([(vec(0), vec(1))])) { (u : (Cart[Real, 2]) -> Cart[Real, 2])(sndcart(p)) / (sndcart(p) - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(fstcart(p))) * vector_derivative(g, at(fstcart(p))) } else { vec(0) }, UNIV)"), fn(x1053 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1054 = @tactics.mp_tac(x1053)
    fn(x1055 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1054(x1055)
    }
  }), t1057), t1063), t1066), t1067), @tactics.conj_tac), t1141), @tactics.all_tac])
  let t1052 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_integrable_on((p : Cart[Real, Finite_sum[Unit, 2]]) => if IN(fstcart(p), interval([(vec(0), vec(1))])) { (u : (Cart[Real, 2]) -> Cart[Real, 2])(sndcart(p)) / (sndcart(p) - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(fstcart(p))) * vector_derivative(g, at(fstcart(p))) } else { vec(0) }, UNIV)"), fn(x1049 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1050 = @tactics.assume_tac(x1049)
    fn(x1051 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1050(x1051)
    }
  })
  let t1047 = @simp.asm_rewrite_tac(@list.List([]))
  let t1048 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())), t1047), @tactics.all_tac])
  let t1046 = @tactics.subgoal_then(@term_syntax.parse_term("∀ w : Cart[Real, 2], integrable_on((z : Cart[Real, 2]) => (u : (Cart[Real, 2]) -> Cart[Real, 2])(z) / (z - w), UNIV)"), fn(x1043 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1044 = @tactics.assume_tac(x1043)
    fn(x1045 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1044(x1045)
    }
  })
  let t1041 = @simp.asm_rewrite_tac(@list.List([]))
  let t1042 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())), t1041), @tactics.all_tac])
  let t1040 = @tactics.subgoal_then(@term_syntax.parse_term("∀ w : Cart[Real, 2], absolutely_integrable_on((z : Cart[Real, 2]) => (u : (Cart[Real, 2]) -> Cart[Real, 2])(z) / (z - w), UNIV)"), fn(x1037 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1038 = @tactics.assume_tac(x1037)
    fn(x1039 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1038(x1039)
    }
  })
  let t1036 = @simp.rewrite_tac(@list.List([@cauchy.path_integral_integral()]))
  let t1208 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1036), t1040), t1042), t1046), t1048), t1052), t1142), t1148), t1149), t1150), @tactics.disch_tac), t1153), t1156), t1162), t1163), t1164), @tactics.conj_tac), t1166), t1167), t1168), @tactics.disch_tac), t1171), t1172), t1173), t1174), t1178), t1190), t1194), t1205), t1206), t1207)
  fubini_path_area_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], continuous_on(u, UNIV) && bounded(support(op_plus, u, UNIV)) && absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) → path_integral(g, (w : Cart[Real, 2]) => integral(UNIV, (z : Cart[Real, 2]) => u(z) / (z - w))) == integral(UNIV, (z : Cart[Real, 2]) => u(z) * path_integral(g, (w : Cart[Real, 2]) => Cx(real_of_num(1)) / (z - w)))"), t1208))
}

///|
let fubini_path_area_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUBINI_PATH_AREA")

///|
/// `FUBINI_PATH_AREA`
pub fn fubini_path_area() -> @kernel.Thm {
  fubini_path_area_c.get()
}

///|
/// ABSOLUTELY_INTEGRABLE_DBAR_KERNEL
fn step_40() -> Unit raise {
  let t1217 = @simp.asm_rewrite_tac(@list.List([]))
  let t1218 = @tactics.then_tac(@tactics.match_mp_tac(bounded_support_translate()), t1217)
  let t1216 = @simp.asm_rewrite_tac(@list.List([]))
  let t1215 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@class.eta_ax()])))
  let t1219 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(continuous_on_translate_univ()), t1215), t1216), t1218])
  let t1214 = @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())
  let t1213 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.complex_sub_rzero()])), @tactics.all_tac])
  let t1212 = @tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + z) / z) == ((z : Cart[Real, 2]) => wirtinger_dbar(f, w + z) / (z - Cx(real_of_num(0))))"), fn(x1209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1210 = @tactics.subst1_tac(x1209)
    fn(x1211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1210(x1211)
    }
  })
  let t1220 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1212), t1213), t1214), @tactics.conj_tac), t1219)
  absolutely_integrable_dbar_kernel_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => wirtinger_dbar(f, z), UNIV) && bounded(support(op_plus, wirtinger_dbar(f), UNIV)) → absolutely_integrable_on((z : Cart[Real, 2]) => wirtinger_dbar(f, w + z) / z, UNIV)"), t1220))
}

///|
let absolutely_integrable_dbar_kernel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_INTEGRABLE_DBAR_KERNEL")

///|
/// `ABSOLUTELY_INTEGRABLE_DBAR_KERNEL`
pub fn absolutely_integrable_dbar_kernel() -> @kernel.Thm {
  absolutely_integrable_dbar_kernel_c.get()
}

///|
/// HAS_DERIVATIVE_CX_DROP
fn step_41() -> Unit raise {
  let t1221 = @simp.rewrite_tac(@list.List([@vectors.linear(), @vectors.drop_add(), @vectors.drop_cmul(), @complexes.cx_add(), @complexes.cx_mul(), @complexes.complex_cmul()]))
  let t1222 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@derivatives.has_derivative_linear())), t1221)
  has_derivative_cx_drop_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Cart[Real, Unit], has_derivative((t : Cart[Real, Unit]) => Cx(drop(t)), (h : Cart[Real, Unit]) => Cx(drop(h)), at(t))"), t1222))
}

///|
let has_derivative_cx_drop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_DERIVATIVE_CX_DROP")

///|
/// `HAS_DERIVATIVE_CX_DROP`
pub fn has_derivative_cx_drop() -> @kernel.Thm {
  has_derivative_cx_drop_c.get()
}

///|
/// HAS_DERIVATIVE_II_CX_DROP
fn step_42() -> Unit raise {
  let t1233 = @tactics.match_accept_tac(@complexes.linear_complex_mul())
  let t1234 = @tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_derivative_linear()), t1233)
  let t1235 = @list.List([@meson.meson_tac(@list.List([has_derivative_cx_drop()])), t1234])
  let t1232 = @tactics.match_mp_tac(@derivatives.diff_chain_at())
  let t1231 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1230 = @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, Unit]) => ii * Cx(drop(h))) == o((z : Cart[Real, 2]) => ii * z, (h : Cart[Real, Unit]) => Cx(drop(h)))"), fn(x1227 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1228 = @tactics.subst1_tac(x1227)
    fn(x1229 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1228(x1229)
    }
  })
  let t1226 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1236 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => ii * Cx(drop(t))) == o((z : Cart[Real, 2]) => ii * z, (t : Cart[Real, Unit]) => Cx(drop(t)))"), fn(x1223 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1224 = @tactics.subst1_tac(x1223)
    fn(x1225 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1224(x1225)
    }
  })), t1226), t1230), t1231), t1232), @tactics.conj_tac), t1235)
  has_derivative_ii_cx_drop_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Cart[Real, Unit], has_derivative((t : Cart[Real, Unit]) => ii * Cx(drop(t)), (h : Cart[Real, Unit]) => ii * Cx(drop(h)), at(t))"), t1236))
}

///|
let has_derivative_ii_cx_drop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_DERIVATIVE_II_CX_DROP")

///|
/// `HAS_DERIVATIVE_II_CX_DROP`
pub fn has_derivative_ii_cx_drop() -> @kernel.Thm {
  has_derivative_ii_cx_drop_c.get()
}

///|
/// HAS_DERIVATIVE_CEXP_POLAR
fn step_43() -> Unit raise {
  let t1247 = @simp.rewrite_tac(@list.List([@canal.has_complex_derivative()]))
  let t1248 = @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("ii * Cx(drop((t : Cart[Real, Unit])))"), @transcendentals.has_complex_derivative_cexp())), t1247)
  let t1249 = @list.List([@meson.meson_tac(@list.List([has_derivative_ii_cx_drop()])), t1248])
  let t1246 = @tactics.match_mp_tac(@derivatives.diff_chain_at())
  let t1245 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1244 = @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, Unit]) => cexp(ii * Cx(drop((t : Cart[Real, Unit])))) * (ii * Cx(drop(h)))) == o((x : Cart[Real, 2]) => cexp(ii * Cx(drop(t))) * x, (h : Cart[Real, Unit]) => ii * Cx(drop(h)))"), fn(x1241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1242 = @tactics.subst1_tac(x1241)
    fn(x1243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1242(x1243)
    }
  })
  let t1240 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1250 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => cexp(ii * Cx(drop(t)))) == o(cexp, (t : Cart[Real, Unit]) => ii * Cx(drop(t)))"), fn(x1237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1238 = @tactics.subst1_tac(x1237)
    fn(x1239 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1238(x1239)
    }
  })), t1240), t1244), t1245), t1246), @tactics.conj_tac), t1249)
  has_derivative_cexp_polar_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Cart[Real, Unit], has_derivative((t : Cart[Real, Unit]) => cexp(ii * Cx(drop(t))), (h : Cart[Real, Unit]) => cexp(ii * Cx(drop(t))) * (ii * Cx(drop(h))), at(t))"), t1250))
}

///|
let has_derivative_cexp_polar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_DERIVATIVE_CEXP_POLAR")

///|
/// `HAS_DERIVATIVE_CEXP_POLAR`
pub fn has_derivative_cexp_polar() -> @kernel.Thm {
  has_derivative_cexp_polar_c.get()
}

///|
/// HAS_DERIVATIVE_AFFINE_MUL
fn step_44() -> Unit raise {
  let t1262 = @drule.match_mp(@derivatives.has_derivative_add())
  let t1260 = @simp.rewrite_rule(@list.List([@vectors.vector_add_lid()]))
  let t1264 = @tactics.disch_then(fn(x1263 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1261 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1258 = @tactics.accept_tac(x1257)
        fn(x1259 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1258(x1259)
        }
      })(t1260(x1261))
    })(t1262(x1263))
  })
  let t1255 = @tactics.match_accept_tac(@complexes.linear_complex_mul())
  let t1256 = @tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_derivative_linear()), t1255)
  let t1265 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@simp.rewrite_tac(@list.List([@derivatives.has_derivative_const()])), t1256])), t1264])
  let t1254 = @tactics.subgoal_then(@term_syntax.parse_term("has_derivative((z : Cart[Real, 2]) => (w : Cart[Real, 2]), (h : Cart[Real, 2]) => vec(0), at((a : Cart[Real, 2]))) && has_derivative((z : Cart[Real, 2]) => (c : Cart[Real, 2]) * z, (h : Cart[Real, 2]) => c * h, at(a))"), fn(x1251 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1252 = @tactics.mp_tac(x1251)
    fn(x1253 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1252(x1253)
    }
  })
  let t1266 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1254), t1265)
  has_derivative_affine_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ a : Cart[Real, 2], has_derivative((z : Cart[Real, 2]) => w + c * z, (h : Cart[Real, 2]) => c * h, at(a))"), t1266))
}

///|
let has_derivative_affine_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_DERIVATIVE_AFFINE_MUL")

///|
/// `HAS_DERIVATIVE_AFFINE_MUL`
pub fn has_derivative_affine_mul() -> @kernel.Thm {
  has_derivative_affine_mul_c.get()
}

///|
/// HAS_DERIVATIVE_POLAR_PATH
fn step_45() -> Unit raise {
  let t1278 = @simp.rewrite_tac(@list.List([has_derivative_affine_mul()]))
  let t1279 = @list.List([@meson.meson_tac(@list.List([has_derivative_cexp_polar()])), t1278])
  let t1277 = @tactics.match_mp_tac(@derivatives.diff_chain_at())
  let t1276 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1275 = @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, Unit]) => Cx((r : Real)) * (cexp(ii * Cx(drop((t : Cart[Real, Unit])))) * (ii * Cx(drop(h))))) == o((h : Cart[Real, 2]) => Cx(r) * h, (h : Cart[Real, Unit]) => cexp(ii * Cx(drop(t))) * (ii * Cx(drop(h))))"), fn(x1272 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1273 = @tactics.subst1_tac(x1272)
    fn(x1274 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1273(x1274)
    }
  })
  let t1271 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1270 = @tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => (w : Cart[Real, 2]) + Cx((r : Real)) * cexp(ii * Cx(drop(t)))) == o((z : Cart[Real, 2]) => w + Cx(r) * z, (t : Cart[Real, Unit]) => cexp(ii * Cx(drop(t))))"), fn(x1267 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1268 = @tactics.subst1_tac(x1267)
    fn(x1269 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1268(x1269)
    }
  })
  let t1280 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1270), t1271), t1275), t1276), t1277), @tactics.conj_tac), t1279)
  has_derivative_polar_path_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ r : Real, ∀ t : Cart[Real, Unit], has_derivative((t : Cart[Real, Unit]) => w + Cx(r) * cexp(ii * Cx(drop(t))), (h : Cart[Real, Unit]) => Cx(r) * (cexp(ii * Cx(drop(t))) * (ii * Cx(drop(h)))), at(t))"), t1280))
}

///|
let has_derivative_polar_path_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_DERIVATIVE_POLAR_PATH")

///|
/// `HAS_DERIVATIVE_POLAR_PATH`
pub fn has_derivative_polar_path() -> @kernel.Thm {
  has_derivative_polar_path_c.get()
}

///|
/// CONTINUOUS_ON_COMPLEX_LMUL_FN
fn step_46() -> Unit raise {
  let t1281 = @tactics.match_accept_tac(@complexes.linear_complex_mul())
  let t1282 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@topology.linear_continuous_on())), t1281)
  continuous_on_complex_lmul_fn_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => c * z, UNIV)"), t1282))
}

///|
let continuous_on_complex_lmul_fn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_COMPLEX_LMUL_FN")

///|
/// `CONTINUOUS_ON_COMPLEX_LMUL_FN`
pub fn continuous_on_complex_lmul_fn() -> @kernel.Thm {
  continuous_on_complex_lmul_fn_c.get()
}

///|
/// CONT_II_CX_DROP
fn step_47() -> Unit raise {
  let t1288 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), continuous_on_complex_lmul_fn()]))
  let t1287 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t1289 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t1287), t1288)
  let t1286 = @simp.rewrite_tac(@list.List([@topology.continuous_on_id()]))
  let t1290 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_cx_drop()), t1286), t1289])
  let t1285 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1291 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("continuous_on(o((z : Cart[Real, 2]) => ii * z, (t : Cart[Real, Unit]) => Cx(drop(t))), UNIV)"), fn(x1283 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1283
    @tactics.accept_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(th))
  }), t1285), @tactics.conj_tac), t1290)
  cont_ii_cx_drop_c.set(@tactics.prove(@term_syntax.parse_term("continuous_on((t : Cart[Real, Unit]) => ii * Cx(drop(t)), UNIV)"), t1291))
}

///|
let cont_ii_cx_drop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONT_II_CX_DROP")

///|
/// `CONT_II_CX_DROP`
pub fn cont_ii_cx_drop() -> @kernel.Thm {
  cont_ii_cx_drop_c.get()
}

///|
/// CONT_CEXP_POLAR
fn step_48() -> Unit raise {
  let t1296 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), @transcendentals.continuous_on_cexp()]))
  let t1295 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t1297 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t1295), t1296)
  let t1298 = @list.List([@simp.rewrite_tac(@list.List([cont_ii_cx_drop()])), t1297])
  let t1294 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1299 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("continuous_on(o(cexp, (t : Cart[Real, Unit]) => ii * Cx(drop(t))), UNIV)"), fn(x1292 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1292
    @tactics.accept_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(th))
  }), t1294), @tactics.conj_tac), t1298)
  cont_cexp_polar_c.set(@tactics.prove(@term_syntax.parse_term("continuous_on((t : Cart[Real, Unit]) => cexp(ii * Cx(drop(t))), UNIV)"), t1299))
}

///|
let cont_cexp_polar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONT_CEXP_POLAR")

///|
/// `CONT_CEXP_POLAR`
pub fn cont_cexp_polar() -> @kernel.Thm {
  cont_cexp_polar_c.get()
}

///|
/// CONTINUOUS_ON_POLAR_PATH
fn step_49() -> Unit raise {
  let t1313 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const(), @topology.continuous_on_id()]))
  let t1312 = @tactics.match_mp_tac(@topology.continuous_on_add())
  let t1311 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t1310 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t1314 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t1310), t1311), t1312), t1313)
  let t1315 = @list.List([@simp.rewrite_tac(@list.List([continuous_on_complex_lmul_fn()])), t1314])
  let t1309 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1308 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on(o((z : Cart[Real, 2]) => (w : Cart[Real, 2]) + z, (z : Cart[Real, 2]) => Cx((r : Real)) * z), UNIV)"), fn(x1306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1306
    @tactics.accept_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(th_1))
  })
  let t1305 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t1304 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t1316 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t1304), t1305), t1308), t1309), @tactics.conj_tac), t1315)
  let t1317 = @list.List([@simp.rewrite_tac(@list.List([cont_cexp_polar()])), t1316])
  let t1303 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1302 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on(o((z : Cart[Real, 2]) => (w : Cart[Real, 2]) + Cx((r : Real)) * z, (t : Cart[Real, Unit]) => cexp(ii * Cx(drop(t)))), UNIV)"), fn(x1300 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1300
    @tactics.accept_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(th))
  })
  let t1318 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1302), t1303), @tactics.conj_tac), t1317)
  continuous_on_polar_path_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ r : Real, continuous_on((t : Cart[Real, Unit]) => w + Cx(r) * cexp(ii * Cx(drop(t))), UNIV)"), t1318))
}

///|
let continuous_on_polar_path_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_POLAR_PATH")

///|
/// `CONTINUOUS_ON_POLAR_PATH`
pub fn continuous_on_polar_path() -> @kernel.Thm {
  continuous_on_polar_path_c.get()
}

///|
/// CONTINUOUS_ON_POLAR_PATH_INTERVAL
fn step_50() -> Unit raise {
  let t1321 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), continuous_on_polar_path()]))
  let t1320 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, Unit]) -> Bool)"))
  let t1319 = @tactics.match_mp_tac(@topology.continuous_on_subset())
  let t1322 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1319), t1320), t1321)
  continuous_on_polar_path_interval_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ r : Real, continuous_on((t : Cart[Real, Unit]) => w + Cx(r) * cexp(ii * Cx(drop(t))), interval([(vec(0), lift(real_of_num(2) * pi))]))"), t1322))
}

///|
let continuous_on_polar_path_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_POLAR_PATH_INTERVAL")

///|
/// `CONTINUOUS_ON_POLAR_PATH_INTERVAL`
pub fn continuous_on_polar_path_interval() -> @kernel.Thm {
  continuous_on_polar_path_interval_c.get()
}

///|
/// CONTINUOUS_ON_F_POLAR
fn step_51() -> Unit raise {
  let t1328 = @simp.asm_rewrite_tac(@list.List([@sets.subset_univ()]))
  let t1327 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t1329 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t1327), t1328)
  let t1330 = @list.List([@simp.rewrite_tac(@list.List([continuous_on_polar_path_interval()])), t1329])
  let t1326 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1325 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on(o((f : (Cart[Real, 2]) -> Cart[Real, 2]), (t : Cart[Real, Unit]) => (w : Cart[Real, 2]) + Cx((r : Real)) * cexp(ii * Cx(drop(t)))), interval([(vec(0), lift(real_of_num(2) * pi))]))"), fn(x1323 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1323
    @tactics.accept_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(th))
  })
  let t1331 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1325), t1326), @tactics.conj_tac), t1330)
  continuous_on_f_polar_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ r : Real, continuous_on(f, UNIV) → continuous_on((t : Cart[Real, Unit]) => f(w + Cx(r) * cexp(ii * Cx(drop(t)))), interval([(vec(0), lift(real_of_num(2) * pi))]))"), t1331))
}

///|
let continuous_on_f_polar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_F_POLAR")

///|
/// `CONTINUOUS_ON_F_POLAR`
pub fn continuous_on_f_polar() -> @kernel.Thm {
  continuous_on_f_polar_c.get()
}

///|
/// HAS_VECTOR_DERIVATIVE_F_POLAR
fn step_52() -> Unit raise {
  let t1371 = @simp.asm_rewrite_tac(@list.List([]))
  let t1368 = @simp.asm_rewrite_tac(@list.List([]))
  let t1367 = @tactics.match_mp_tac(@derivatives.linear_frechet_derivative())
  let t1369 = @tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("linear(frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx((r : Real)) * cexp(ii * Cx(drop((t : Cart[Real, Unit])))))))"), fn(x1365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1365
    @simp.rewrite_tac(@list.List([@drule.match_mp(@vectors.linear_cmul())(th)]))
  }), t1367), t1368)
  let t1364 = @simp.rewrite_tac(@list.List([@complexes.complex_eq(), @complexes.re(), @complexes.im()]))
  let t1370 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_cmul(), @complexes.cx_def(), @complexes.complex_mul(), @complexes.re(), @complexes.im(), @calc_int.real_mul_rzero(), @real.real_sub_rzero(), @realax.real_add_lid()])), t1364), @calc_rat.real_arith_tac), t1369])
  let t1363 = @tactics.subgoal_then(@term_syntax.parse_term("Cx((r : Real)) * (cexp(ii * Cx(drop((t : Cart[Real, Unit])))) * (ii * Cx(drop((h : Cart[Real, Unit]))))) == op_pct(drop(h), Cx(r) * (cexp(ii * Cx(drop(t))) * ii))"), fn(x1360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1361 = @tactics.subst1_tac(x1360)
    fn(x1362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1361(x1362)
    }
  })
  let t1359 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : Cart[Real, Unit])"))
  let t1372 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t1359), t1363), t1370), t1371])
  let t1373 = @tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, Unit]) => op_pct(drop(h), frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx((r : Real)) * cexp(ii * Cx(drop((t : Cart[Real, Unit]))))), Cx(r) * (cexp(ii * Cx(drop(t))) * ii)))) == ((h : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(r) * cexp(ii * Cx(drop(t)))), Cx(r) * (cexp(ii * Cx(drop(t))) * (ii * Cx(drop(h))))))"), fn(x1356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1357 = @tactics.subst1_tac(x1356)
    fn(x1358 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1357(x1358)
    }
  })), t1372)
  let t1353 = @simp.rewrite_tac(@list.List([]))
  let t1351 = @simp.gen_rewrite_rule(fn(x1350 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1350
  }, @list.List([@derivatives.frechet_derivative_works()]))
  let t1354 = @tactics.then_tac(@tactics.first_x_assum(fn(x1352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1347 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1348 = @tactics.mp_tac(x1347)
      fn(x1349 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1348(x1349)
      }
    })(t1351(x1352))
  }), t1353)
  let t1355 = @list.List([@simp.rewrite_tac(@list.List([has_derivative_polar_path()])), t1354])
  let t1346 = @tactics.match_mp_tac(@derivatives.diff_chain_at())
  let t1345 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1344 = @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx((r : Real)) * cexp(ii * Cx(drop((t : Cart[Real, Unit]))))), Cx(r) * (cexp(ii * Cx(drop(t))) * (ii * Cx(drop(h)))))) == o(frechet_derivative(f, at(w + Cx(r) * cexp(ii * Cx(drop(t))))), (h : Cart[Real, Unit]) => Cx(r) * (cexp(ii * Cx(drop(t))) * (ii * Cx(drop(h)))))"), fn(x1341 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1342 = @tactics.subst1_tac(x1341)
    fn(x1343 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1342(x1343)
    }
  })
  let t1340 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1374 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + Cx((r : Real)) * cexp(ii * Cx(drop(t))))) == o(f, (t : Cart[Real, Unit]) => w + Cx(r) * cexp(ii * Cx(drop(t))))"), fn(x1337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1338 = @tactics.subst1_tac(x1337)
    fn(x1339 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1338(x1339)
    }
  }), t1340), t1344), t1345), t1346), @tactics.conj_tac), t1355), t1373])
  let t1336 = @tactics.subgoal_then(@term_syntax.parse_term("has_derivative((t : Cart[Real, Unit]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + Cx((r : Real)) * cexp(ii * Cx(drop(t)))), (h : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(r) * cexp(ii * Cx(drop((t : Cart[Real, Unit]))))), Cx(r) * (cexp(ii * Cx(drop(t))) * (ii * Cx(drop(h))))), at(t))"), fn(x1333 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1334 = @tactics.mp_tac(x1333)
    fn(x1335 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1334(x1335)
    }
  })
  let t1332 = @simp.rewrite_tac(@list.List([@derivatives.has_vector_derivative()]))
  let t1375 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1332), t1336), t1374)
  has_vector_derivative_f_polar_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ r : Real, ∀ t : Cart[Real, Unit], differentiable(f, at(w + Cx(r) * cexp(ii * Cx(drop(t))))) → has_vector_derivative((t : Cart[Real, Unit]) => f(w + Cx(r) * cexp(ii * Cx(drop(t)))), frechet_derivative(f, at(w + Cx(r) * cexp(ii * Cx(drop(t)))), Cx(r) * (cexp(ii * Cx(drop(t))) * ii)), at(t))"), t1375))
}

///|
let has_vector_derivative_f_polar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_VECTOR_DERIVATIVE_F_POLAR")

///|
/// `HAS_VECTOR_DERIVATIVE_F_POLAR`
pub fn has_vector_derivative_f_polar() -> @kernel.Thm {
  has_vector_derivative_f_polar_c.get()
}

///|
/// ANGULAR_FTC
fn step_53() -> Unit raise {
  let t1382 = @meson.asm_meson_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at(), @topology.open_univ(), @sets.in_univ()]))
  let t1381 = @tactics.match_mp_tac(has_vector_derivative_f_polar())
  let t1380 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec(), @vectors.lift_drop()]))
  let t1383 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])")), t1380), @tactics.strip_tac), t1381), t1382)
  let t1379 = @simp.asm_rewrite_tac(@list.List([]))
  let t1384 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(continuous_on_f_polar()), t1379), t1383])
  let t1378 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1377 = @simp.rewrite_tac(@list.List([@vectors.drop_vec(), @vectors.lift_drop()]))
  let t1376 = @tactics.match_mp_tac(@integration.fundamental_theorem_of_calculus_interior())
  let t1385 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1376), t1377), @tactics.conj_tac), t1378), @tactics.conj_tac), t1384)
  angular_ftc_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ r : Real, continuous_on(f, UNIV) && differentiable_on(f, UNIV) → has_integral((t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(r) * cexp(ii * Cx(drop(t)))), Cx(r) * (cexp(ii * Cx(drop(t))) * ii)), f(w + Cx(r) * cexp(ii * Cx(drop(lift(real_of_num(2) * pi))))) - f(w + Cx(r) * cexp(ii * Cx(drop(vec(0))))), interval([(vec(0), lift(real_of_num(2) * pi))]))"), t1385))
}

///|
let angular_ftc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGULAR_FTC")

///|
/// `ANGULAR_FTC`
pub fn angular_ftc() -> @kernel.Thm {
  angular_ftc_c.get()
}

///|
/// ANGULAR_INTEGRAL_ZERO
fn step_54() -> Unit raise {
  let t1393 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rid(), @vectors.vector_sub_refl()]))
  let t1392 = @simp.rewrite_tac(@list.List([cexp_2pii(), cexp_0ii()]))
  let t1391 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.drop_vec()]))
  let t1390 = @simp.asm_rewrite_tac(@list.List([]))
  let t1387 = @term_syntax.parse_term("(r : Real)")
  let t1388 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1389 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1388, t1387]), angular_ftc()))
  let t1386 = @tactics.match_mp_tac(@integration.integral_unique())
  let t1394 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1386), t1389), t1390), t1391), t1392), t1393)
  angular_integral_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ r : Real, continuous_on(f, UNIV) && differentiable_on(f, UNIV) → integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(r) * cexp(ii * Cx(drop(t)))), Cx(r) * (cexp(ii * Cx(drop(t))) * ii))) == vec(0)"), t1394))
}

///|
let angular_integral_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGULAR_INTEGRAL_ZERO")

///|
/// `ANGULAR_INTEGRAL_ZERO`
pub fn angular_integral_zero() -> @kernel.Thm {
  angular_integral_zero_c.get()
}

///|
/// FRECHET_DERIVATIVE_CX_LMUL
fn step_55() -> Unit raise {
  let t1411 = @meson.asm_meson_tac(@list.List([@vectors.linear_cmul()]))
  let t1410 = @list.List([@simp.rewrite_tac(@list.List([@complexes.complex_cmul()])), @tactics.all_tac])
  let t1409 = @tactics.subgoal_then(@term_syntax.parse_term("Cx((c : Real)) * frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z : Cart[Real, 2])), (x : Cart[Real, 2])) == op_pct(c, frechet_derivative(f, at(z), x))"), fn(x1406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1407 = @tactics.subst1_tac(x1406)
    fn(x1408 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1407(x1408)
    }
  })
  let t1405 = @list.List([@simp.rewrite_tac(@list.List([@complexes.complex_cmul()])), @tactics.all_tac])
  let t1404 = @tactics.subgoal_then(@term_syntax.parse_term("Cx((c : Real)) * (x : Cart[Real, 2]) == op_pct(c, x)"), fn(x1401 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1402 = @tactics.subst1_tac(x1401)
    fn(x1403 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1402(x1403)
    }
  })
  let t1399 = @simp.asm_rewrite_tac(@list.List([]))
  let t1400 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@derivatives.linear_frechet_derivative()), t1399), @tactics.all_tac])
  let t1398 = @tactics.subgoal_then(@term_syntax.parse_term("linear(frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z : Cart[Real, 2]))))"), fn(x1395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1396 = @tactics.mp_tac(x1395)
    fn(x1397 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1396(x1397)
    }
  })
  let t1412 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1398), t1400), @tactics.disch_tac), t1404), t1405), t1409), t1410), t1411)
  frechet_derivative_cx_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], ∀ c : Real, ∀ x : Cart[Real, 2], differentiable(f, at(z)) → frechet_derivative(f, at(z), Cx(c) * x) == Cx(c) * frechet_derivative(f, at(z), x)"), t1412))
}

///|
let frechet_derivative_cx_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRECHET_DERIVATIVE_CX_LMUL")

///|
/// `FRECHET_DERIVATIVE_CX_LMUL`
pub fn frechet_derivative_cx_lmul() -> @kernel.Thm {
  frechet_derivative_cx_lmul_c.get()
}

///|
/// ANGULAR_INTEGRAL_II_ZERO
fn step_56() -> Unit raise {
  let t1460 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@complexes.complex_vec_0())]))
  let t1459 = @simp.asm_rewrite_tac(@list.List([]))
  let t1461 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((r : Real) == real_of_num(0))")), t1459), t1460])
  let t1458 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t1457 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_entire(), @complexes.cx_inj()]))
  let t1455 = @simp.asm_rewrite_tac(@list.List([]))
  let t1456 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@equal.gsym(@canal.integral_complex_lmul())])), t1455), @tactics.all_tac])
  let t1454 = @tactics.subgoal_then(@term_syntax.parse_term("Cx((r : Real)) * integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(r) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t))))) == vec(0)"), fn(x1451 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1452 = @tactics.mp_tac(x1451)
    fn(x1453 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1452(x1453)
    }
  })
  let t1449 = @meson.asm_meson_tac(@list.List([]))
  let t1448 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_cmul()), @integration.integrable_cmul_eq()]))
  let t1445 = @drule.match_mp(@integration.has_integral_integrable())
  let t1447 = @tactics.first_x_assum(fn(x1446 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1443 = @tactics.mp_tac(x1442)
      fn(x1444 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1443(x1444)
      }
    })(t1445(x1446))
  })
  let t1440 = @meson.asm_meson_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at(), @topology.open_univ(), @sets.in_univ()]))
  let t1439 = @tactics.match_mp_tac(frechet_derivative_cx_lmul())
  let t1438 = @tactics.subgoal_then(@term_syntax.parse_term("Cx((r : Real)) * (cexp(ii * Cx(drop((t : Cart[Real, Unit])))) * ii) == Cx(r) * (ii * cexp(ii * Cx(drop(t))))"), fn(x1435 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1436 = @tactics.subst1_tac(x1435)
    fn(x1437 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1436(x1437)
    }
  })
  let t1441 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])")), t1438), @list.List([@complexes.simple_complex_arith_tac, @tactics.all_tac])), t1439), t1440), @tactics.all_tac])
  let t1434 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx((r : Real)) * cexp(ii * Cx(drop(t)))), Cx(r) * (cexp(ii * Cx(drop(t))) * ii)) == Cx(r) * frechet_derivative(f, at(w + Cx(r) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t))))"), fn(x1432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1432
    @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([th_1])))
  })
  let t1431 = @simp.asm_rewrite_tac(@list.List([]))
  let t1429 = @term_syntax.parse_term("(r : Real)")
  let t1430 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1450 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1430, t1429]), angular_ftc())), t1431), @tactics.disch_tac), t1434), t1441), t1447), t1448), t1449), @tactics.all_tac])
  let t1462 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("integrable_on((t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx((r : Real)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))), interval([(vec(0), lift(real_of_num(2) * pi))]))"), fn(x1426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1427 = @tactics.assume_tac(x1426)
    fn(x1428 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1427(x1428)
    }
  }), t1450), t1454), t1456), t1457), t1458), t1461)
  let t1425 = @meson.asm_meson_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at(), @topology.open_univ(), @sets.in_univ()]))
  let t1424 = @tactics.match_mp_tac(frechet_derivative_cx_lmul())
  let t1423 = @tactics.subgoal_then(@term_syntax.parse_term("Cx((r : Real)) * (cexp(ii * Cx(drop((t : Cart[Real, Unit])))) * ii) == Cx(r) * (ii * cexp(ii * Cx(drop(t))))"), fn(x1420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1421 = @tactics.subst1_tac(x1420)
    fn(x1422 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1421(x1422)
    }
  })
  let t1463 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])")), t1423), @list.List([@complexes.simple_complex_arith_tac, @tactics.all_tac])), t1424), t1425), t1462])
  let t1419 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx((r : Real)) * cexp(ii * Cx(drop(t)))), Cx(r) * (cexp(ii * Cx(drop(t))) * ii)) == Cx(r) * frechet_derivative(f, at(w + Cx(r) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t))))"), fn(x1417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1417
    @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([th])))
  })
  let t1416 = @simp.asm_rewrite_tac(@list.List([]))
  let t1413 = @term_syntax.parse_term("(r : Real)")
  let t1414 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1415 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1414, t1413]), angular_integral_zero()))
  let t1464 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1415), t1416), @tactics.disch_tac), t1419), t1463)
  angular_integral_ii_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ r : Real, continuous_on(f, UNIV) && differentiable_on(f, UNIV) && !(r == real_of_num(0)) → integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(r) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t))))) == vec(0)"), t1464))
}

///|
let angular_integral_ii_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANGULAR_INTEGRAL_II_ZERO")

///|
/// `ANGULAR_INTEGRAL_II_ZERO`
pub fn angular_integral_ii_zero() -> @kernel.Thm {
  angular_integral_ii_zero_c.get()
}

///|
/// HAS_DERIVATIVE_RADIAL_PATH
fn step_57() -> Unit raise {
  let t1488 = @drule.match_mp(@derivatives.has_derivative_add())
  let t1486 = @simp.rewrite_rule(@list.List([@vectors.vector_add_lid()]))
  let t1490 = @tactics.disch_then(fn(x1489 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1487 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1483 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1484 = @tactics.accept_tac(x1483)
        fn(x1485 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1484(x1485)
        }
      })(t1486(x1487))
    })(t1488(x1489))
  })
  let t1479 = @tactics.match_accept_tac(@complexes.linear_complex_mul())
  let t1480 = @tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_derivative_linear()), t1479)
  let t1481 = @list.List([@meson.meson_tac(@list.List([has_derivative_cx_drop()])), t1480])
  let t1478 = @tactics.match_mp_tac(@derivatives.diff_chain_at())
  let t1477 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def(), @complexes.complex_mul_sym()])), @tactics.all_tac])
  let t1476 = @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, Unit]) => Cx(drop(h)) * cexp(ii * Cx((t0 : Real)))) == o((z : Cart[Real, 2]) => cexp(ii * Cx(t0)) * z, (h : Cart[Real, Unit]) => Cx(drop(h)))"), fn(x1473 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1474 = @tactics.subst1_tac(x1473)
    fn(x1475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1474(x1475)
    }
  })
  let t1472 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def(), @complexes.complex_mul_sym()])), @tactics.all_tac])
  let t1482 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((r : Cart[Real, Unit]) => Cx(drop(r)) * cexp(ii * Cx((t0 : Real)))) == o((z : Cart[Real, 2]) => cexp(ii * Cx(t0)) * z, (r : Cart[Real, Unit]) => Cx(drop(r)))"), fn(x1469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1470 = @tactics.subst1_tac(x1469)
    fn(x1471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1470(x1471)
    }
  }), t1472), t1476), t1477), t1478), @tactics.conj_tac), t1481)
  let t1491 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@simp.rewrite_tac(@list.List([@derivatives.has_derivative_const()])), t1482])), t1490])
  let t1468 = @tactics.subgoal_then(@term_syntax.parse_term("has_derivative((r : Cart[Real, Unit]) => (w : Cart[Real, 2]), (h : Cart[Real, Unit]) => vec(0), at((r : Cart[Real, Unit]))) && has_derivative((r : Cart[Real, Unit]) => Cx(drop(r)) * cexp(ii * Cx((t0 : Real))), (h : Cart[Real, Unit]) => Cx(drop(h)) * cexp(ii * Cx(t0)), at(r))"), fn(x1465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1466 = @tactics.mp_tac(x1465)
    fn(x1467 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1466(x1467)
    }
  })
  let t1492 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1468), t1491)
  has_derivative_radial_path_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ t0 : Real, ∀ r : Cart[Real, Unit], has_derivative((r : Cart[Real, Unit]) => w + Cx(drop(r)) * cexp(ii * Cx(t0)), (h : Cart[Real, Unit]) => Cx(drop(h)) * cexp(ii * Cx(t0)), at(r))"), t1492))
}

///|
let has_derivative_radial_path_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_DERIVATIVE_RADIAL_PATH")

///|
/// `HAS_DERIVATIVE_RADIAL_PATH`
pub fn has_derivative_radial_path() -> @kernel.Thm {
  has_derivative_radial_path_c.get()
}

///|
/// HAS_VECTOR_DERIVATIVE_F_RADIAL
fn step_58() -> Unit raise {
  let t1527 = @simp.asm_rewrite_tac(@list.List([]))
  let t1526 = @simp.asm_rewrite_tac(@list.List([]))
  let t1525 = @tactics.match_mp_tac(@derivatives.linear_frechet_derivative())
  let t1524 = @tactics.subgoal_then(@term_syntax.parse_term("linear(frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx((t0 : Real))))))"), fn(x1521 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1521
    let t1523 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul()]))
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(@vectors.linear_cmul())(th))])), t1523)
  })
  let t1520 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : Cart[Real, Unit])"))
  let t1528 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t1520), t1524), t1525), t1526), t1527])
  let t1529 = @tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, Unit]) => op_pct(drop(h), frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx((t0 : Real)))), cexp(ii * Cx(t0))))) == ((h : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(t0))), Cx(drop(h)) * cexp(ii * Cx(t0))))"), fn(x1517 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1518 = @tactics.subst1_tac(x1517)
    fn(x1519 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1518(x1519)
    }
  })), t1528)
  let t1514 = @simp.rewrite_tac(@list.List([]))
  let t1512 = @simp.gen_rewrite_rule(fn(x1511 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1511
  }, @list.List([@derivatives.frechet_derivative_works()]))
  let t1515 = @tactics.then_tac(@tactics.first_x_assum(fn(x1513 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1508 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1509 = @tactics.mp_tac(x1508)
      fn(x1510 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1509(x1510)
      }
    })(t1512(x1513))
  }), t1514)
  let t1516 = @list.List([@simp.rewrite_tac(@list.List([has_derivative_radial_path()])), t1515])
  let t1507 = @tactics.match_mp_tac(@derivatives.diff_chain_at())
  let t1506 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1505 = @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx((t0 : Real)))), Cx(drop(h)) * cexp(ii * Cx(t0)))) == o(frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(t0)))), (h : Cart[Real, Unit]) => Cx(drop(h)) * cexp(ii * Cx(t0)))"), fn(x1502 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1503 = @tactics.subst1_tac(x1502)
    fn(x1504 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1503(x1504)
    }
  })
  let t1501 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1530 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((r : Cart[Real, Unit]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx((t0 : Real))))) == o(f, (r : Cart[Real, Unit]) => w + Cx(drop(r)) * cexp(ii * Cx(t0)))"), fn(x1498 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1499 = @tactics.subst1_tac(x1498)
    fn(x1500 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1499(x1500)
    }
  }), t1501), t1505), t1506), t1507), @tactics.conj_tac), t1516), t1529])
  let t1497 = @tactics.subgoal_then(@term_syntax.parse_term("has_derivative((r : Cart[Real, Unit]) => (f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx((t0 : Real)))), (h : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(t0))), Cx(drop(h)) * cexp(ii * Cx(t0))), at(r))"), fn(x1494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1495 = @tactics.mp_tac(x1494)
    fn(x1496 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1495(x1496)
    }
  })
  let t1493 = @simp.rewrite_tac(@list.List([@derivatives.has_vector_derivative()]))
  let t1531 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1493), t1497), t1530)
  has_vector_derivative_f_radial_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ t0 : Real, ∀ r : Cart[Real, Unit], differentiable(f, at(w + Cx(drop(r)) * cexp(ii * Cx(t0)))) → has_vector_derivative((r : Cart[Real, Unit]) => f(w + Cx(drop(r)) * cexp(ii * Cx(t0))), frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(t0))), cexp(ii * Cx(t0))), at(r))"), t1531))
}

///|
let has_vector_derivative_f_radial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_VECTOR_DERIVATIVE_F_RADIAL")

///|
/// `HAS_VECTOR_DERIVATIVE_F_RADIAL`
pub fn has_vector_derivative_f_radial() -> @kernel.Thm {
  has_vector_derivative_f_radial_c.get()
}

///|
/// CONTINUOUS_ON_RADIAL_PATH
fn step_59() -> Unit raise {
  let t1544 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.complex_mul_sym()]))
  let t1543 = @tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => z * cexp(ii * Cx((t0 : Real)))) == ((z : Cart[Real, 2]) => cexp(ii * Cx(t0)) * z)"), fn(x1541 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1541
    @simp.rewrite_tac(@list.List([th_1, continuous_on_complex_lmul_fn()]))
  })
  let t1540 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t1539 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t1545 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t1539), t1540), t1543), t1544)
  let t1538 = @simp.rewrite_tac(@list.List([@topology.continuous_on_id()]))
  let t1546 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_cx_drop()), t1538), t1545])
  let t1537 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1536 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on(o((z : Cart[Real, 2]) => z * cexp(ii * Cx((t0 : Real))), (r : Cart[Real, Unit]) => Cx(drop(r))), UNIV)"), fn(x1534 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1534
    @tactics.accept_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(th))
  })
  let t1533 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const()]))
  let t1532 = @tactics.match_mp_tac(@topology.continuous_on_add())
  let t1547 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1532), t1533), t1536), t1537), @tactics.conj_tac), t1546)
  continuous_on_radial_path_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ t0 : Real, continuous_on((r : Cart[Real, Unit]) => w + Cx(drop(r)) * cexp(ii * Cx(t0)), UNIV)"), t1547))
}

///|
let continuous_on_radial_path_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_RADIAL_PATH")

///|
/// `CONTINUOUS_ON_RADIAL_PATH`
pub fn continuous_on_radial_path() -> @kernel.Thm {
  continuous_on_radial_path_c.get()
}

///|
/// CONTINUOUS_ON_F_RADIAL
fn step_60() -> Unit raise {
  let t1555 = @simp.asm_rewrite_tac(@list.List([@sets.subset_univ()]))
  let t1554 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t1556 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t1554), t1555)
  let t1553 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), continuous_on_radial_path()]))
  let t1552 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, Unit]) -> Bool)"))
  let t1557 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t1552), t1553), t1556])
  let t1551 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1550 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on(o((f : (Cart[Real, 2]) -> Cart[Real, 2]), (r : Cart[Real, Unit]) => (w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx((t0 : Real)))), {(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)})"), fn(x1548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1548
    @tactics.accept_tac(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(th))
  })
  let t1558 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1550), t1551), @tactics.conj_tac), t1557)
  continuous_on_f_radial_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ t0 : Real, continuous_on(f, UNIV) → continuous_on((r : Cart[Real, Unit]) => f(w + Cx(drop(r)) * cexp(ii * Cx(t0))), {(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)})"), t1558))
}

///|
let continuous_on_f_radial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_F_RADIAL")

///|
/// `CONTINUOUS_ON_F_RADIAL`
pub fn continuous_on_f_radial() -> @kernel.Thm {
  continuous_on_f_radial_c.get()
}

///|
/// RADIAL_FTC
fn step_61() -> Unit raise {
  let t1573 = @simp.rewrite_tac(@list.List([@vectors.drop_vec(), @vectors.lift_drop(), @complexes.complex_mul_lzero(), @complexes.complex_add_rid()]))
  let t1570 = @meson.asm_meson_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at(), @topology.open_univ(), @sets.in_univ()]))
  let t1569 = @tactics.match_mp_tac(has_vector_derivative_f_radial())
  let t1568 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec(), @vectors.lift_drop()]))
  let t1571 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(r : Cart[Real, Unit])")), t1568), @tactics.strip_tac), t1569), t1570)
  let t1566 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @topology.in_interval_1(), @sets.in_elim_thm(), @vectors.drop_vec(), @vectors.lift_drop()])), @calc_rat.real_arith_tac)
  let t1565 = @simp.asm_rewrite_tac(@list.List([]))
  let t1567 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(continuous_on_f_radial()), t1565), t1566])
  let t1564 = @tactics.exists_tac(@term_syntax.parse_term("{(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}"))
  let t1572 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t1564), @tactics.conj_tac), t1567), t1571])
  let t1563 = @simp.rewrite_tac(@list.List([@vectors.drop_vec(), @vectors.lift_drop()]))
  let t1574 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.fundamental_theorem_of_calculus_interior()), t1563), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @tactics.conj_tac), t1572), t1573])
  let t1562 = @tactics.subgoal_then(@term_syntax.parse_term("has_integral((r : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx((t0 : Real)))), cexp(ii * Cx(t0))), f(w + Cx(drop(lift((R : Real)))) * cexp(ii * Cx(t0))) - f(w + Cx(drop(vec(0))) * cexp(ii * Cx(t0))), interval([(vec(0), lift(R))]))"), fn(x1559 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1560 = @tactics.mp_tac(x1559)
    fn(x1561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1560(x1561)
    }
  })
  let t1575 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1562), t1574)
  radial_ftc_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ t0 : Real, ∀ R : Real, continuous_on(f, UNIV) && differentiable_on(f, UNIV) && real_of_num(0) < R → has_integral((r : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(t0))), cexp(ii * Cx(t0))), f(w + Cx(R) * cexp(ii * Cx(t0))) - f(w), interval([(vec(0), lift(R))]))"), t1575))
}

///|
let radial_ftc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADIAL_FTC")

///|
/// `RADIAL_FTC`
pub fn radial_ftc() -> @kernel.Thm {
  radial_ftc_c.get()
}

///|
/// INNER_INTEGRAL_SIMPLIFY
fn step_62() -> Unit raise {
  let t1725 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_vec_0(), @complexes.complex_mul_rzero()]))
  let t1723 = @simp.asm_rewrite_tac(@list.List([]))
  let t1724 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@canal.integral_complex_lmul()), t1723), @tactics.all_tac])
  let t1722 = @tactics.subgoal_then(@term_syntax.parse_term("integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => ii * frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t))))) == ii * integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))))"), fn(x1719 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1720 = @tactics.subst1_tac(x1719)
    fn(x1721 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1720(x1721)
    }
  })
  let t1718 = @tactics.subgoal_then(@term_syntax.parse_term("integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => ii * frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t))))) == vec(0)"), fn(x1716 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1716
    @simp.rewrite_tac(@list.List([th_2, @vectors.vector_add_rid()]))
  })
  let t1714 = @meson.asm_meson_tac(@list.List([]))
  let t1713 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_cmul()), @integration.integrable_cmul_eq()]))
  let t1710 = @drule.match_mp(@integration.has_integral_integrable())
  let t1712 = @tactics.first_x_assum(fn(x1711 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1707 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1708 = @tactics.mp_tac(x1707)
      fn(x1709 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1708(x1709)
      }
    })(t1710(x1711))
  })
  let t1705 = @meson.asm_meson_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at(), @topology.open_univ(), @sets.in_univ()]))
  let t1704 = @tactics.match_mp_tac(frechet_derivative_cx_lmul())
  let t1703 = @tactics.subgoal_then(@term_syntax.parse_term("Cx(drop((r : Cart[Real, Unit]))) * (cexp(ii * Cx(drop((t' : Cart[Real, Unit])))) * ii) == Cx(drop(r)) * (ii * cexp(ii * Cx(drop(t'))))"), fn(x1700 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1701 = @tactics.subst1_tac(x1700)
    fn(x1702 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1701(x1702)
    }
  })
  let t1706 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t' : Cart[Real, Unit])")), t1703), @list.List([@complexes.simple_complex_arith_tac, @tactics.all_tac])), t1704), t1705), @tactics.all_tac])
  let t1699 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), Cx(drop(r)) * (cexp(ii * Cx(drop(t))) * ii)) == Cx(drop(r)) * frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t))))"), fn(x1697 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1697
    @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([th_1])))
  })
  let t1696 = @simp.asm_rewrite_tac(@list.List([]))
  let t1694 = @term_syntax.parse_term("drop((r : Cart[Real, Unit]))")
  let t1695 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1715 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1695, t1694]), angular_ftc())), t1696), @tactics.disch_tac), t1699), t1706), t1712), t1713), t1714), @tactics.all_tac])
  let t1693 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))), interval([(vec(0), lift(real_of_num(2) * pi))]))"), fn(x1690 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1691 = @tactics.assume_tac(x1690)
    fn(x1692 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1691(x1692)
    }
  })
  let t1689 = @simp.asm_rewrite_tac(@list.List([]))
  let t1686 = @term_syntax.parse_term("drop((r : Cart[Real, Unit]))")
  let t1687 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1688 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1687, t1686]), angular_integral_ii_zero()))
  let t1685 = @tactics.subgoal_then(@term_syntax.parse_term("!(drop((r : Cart[Real, Unit])) == real_of_num(0))"), fn(x1682 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1683 = @tactics.assume_tac(x1682)
    fn(x1684 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1683(x1684)
    }
  })
  let t1681 = @simp.asm_simp_tac(@list.List([@integration.integral_add()]))
  let t1678 = @simp.asm_rewrite_tac(@list.List([]))
  let t1677 = @simp.asm_rewrite_tac(@list.List([]))
  let t1676 = @tactics.match_mp_tac(@integration.integrable_sub())
  let t1674 = @tactics.conv_tac(@complexes.complex_ring)
  let t1673 = @tactics.x_gen_tac(@term_syntax.parse_term("(t' : Cart[Real, Unit])"))
  let t1675 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t1673), t1674), @tactics.all_tac])
  let t1679 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t))))) == ((t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))) + ii * frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))) - ii * frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))))"), fn(x1670 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1671 = @tactics.subst1_tac(x1670)
    fn(x1672 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1671(x1672)
    }
  }), t1675), t1676), t1677), t1678])
  let t1668 = @simp.asm_rewrite_tac(@list.List([@complexes.linear_complex_mul()]))
  let t1667 = @tactics.match_mp_tac(@integration.integrable_linear())
  let t1666 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1669 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => ii * frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t))))) == o((x : Cart[Real, 2]) => ii * x, (t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))))"), fn(x1663 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1664 = @tactics.subst1_tac(x1663)
    fn(x1665 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1664(x1665)
    }
  }), t1666), t1667), t1668), @tactics.all_tac])
  let t1662 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((t : Cart[Real, Unit]) => ii * frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))), interval([(vec(0), lift(real_of_num(2) * pi))]))"), fn(x1659 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1660 = @tactics.assume_tac(x1659)
    fn(x1661 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1660(x1661)
    }
  })
  let t1657 = @meson.asm_meson_tac(@list.List([]))
  let t1656 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.complex_cmul()), @integration.integrable_cmul_eq()]))
  let t1653 = @drule.match_mp(@integration.has_integral_integrable())
  let t1655 = @tactics.first_x_assum(fn(x1654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1650 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1651 = @tactics.mp_tac(x1650)
      fn(x1652 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1651(x1652)
      }
    })(t1653(x1654))
  })
  let t1648 = @meson.asm_meson_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at(), @topology.open_univ(), @sets.in_univ()]))
  let t1647 = @tactics.match_mp_tac(frechet_derivative_cx_lmul())
  let t1646 = @tactics.subgoal_then(@term_syntax.parse_term("Cx(drop((r : Cart[Real, Unit]))) * (cexp(ii * Cx(drop((t' : Cart[Real, Unit])))) * ii) == Cx(drop(r)) * (ii * cexp(ii * Cx(drop(t'))))"), fn(x1643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1644 = @tactics.subst1_tac(x1643)
    fn(x1645 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1644(x1645)
    }
  })
  let t1649 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t' : Cart[Real, Unit])")), t1646), @list.List([@complexes.simple_complex_arith_tac, @tactics.all_tac])), t1647), t1648), @tactics.all_tac])
  let t1642 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), Cx(drop(r)) * (cexp(ii * Cx(drop(t))) * ii)) == Cx(drop(r)) * frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t))))"), fn(x1640 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1640
    @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([th])))
  })
  let t1639 = @simp.asm_rewrite_tac(@list.List([]))
  let t1636 = @term_syntax.parse_term("drop((r : Cart[Real, Unit]))")
  let t1637 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1638 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1637, t1636]), angular_ftc()))
  let t1658 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!(drop((r : Cart[Real, Unit])) == real_of_num(0))"), fn(x1633 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1634 = @tactics.assume_tac(x1633)
    fn(x1635 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1634(x1635)
    }
  }), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1638), t1639), @tactics.disch_tac), t1642), t1649), t1655), t1656), t1657), @tactics.all_tac])
  let t1680 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("integrable_on((t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))), interval([(vec(0), lift(real_of_num(2) * pi))]))"), fn(x1630 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1631 = @tactics.assume_tac(x1630)
    fn(x1632 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1631(x1632)
    }
  }), t1658), t1662), t1669), @tactics.conj_tac), t1679), @tactics.all_tac])
  let t1629 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))), interval([(vec(0), lift(real_of_num(2) * pi))])) && integrable_on((t : Cart[Real, Unit]) => ii * frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))), interval([(vec(0), lift(real_of_num(2) * pi))]))"), @tactics.strip_assume_tac)
  let t1627 = @simp.asm_rewrite_tac(@list.List([]))
  let t1628 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@canal.integral_complex_lmul()), t1627), @tactics.all_tac])
  let t1626 = @tactics.subgoal_then(@term_syntax.parse_term("integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => inv(Cx(real_of_num(2))) * (frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))) + ii * frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))))) == inv(Cx(real_of_num(2))) * integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))) + ii * frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))))"), fn(x1623 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1624 = @tactics.subst1_tac(x1623)
    fn(x1625 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1624(x1625)
    }
  })
  let t1616 = @simp.rewrite_tac(@list.List([@canal.continuous_on_cnj()]))
  let t1615 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), cont_cexp_polar()]))
  let t1614 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, Unit]) -> Bool)"))
  let t1617 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t1614), t1615), t1616])
  let t1613 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1612 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1618 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => cnj(cexp(ii * Cx(drop(t))))) == o(cnj, (t : Cart[Real, Unit]) => cexp(ii * Cx(drop(t))))"), fn(x1609 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1610 = @tactics.subst1_tac(x1609)
    fn(x1611 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1610(x1611)
    }
  }), t1612), t1613), @tactics.conj_tac), t1617)
  let t1608 = @simp.asm_rewrite_tac(@list.List([]))
  let t1607 = @tactics.match_mp_tac(wirtinger_dbar_continuous())
  let t1606 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t1605 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t1604 = @tactics.match_mp_tac(@topology.continuous_on_subset())
  let t1603 = @list.List([@simp.rewrite_tac(@list.List([continuous_on_polar_path_interval()])), @tactics.all_tac])
  let t1602 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1601 = @list.List([@simp.rewrite_tac(@list.List([@trivia.o_def()])), @tactics.all_tac])
  let t1619 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t))))) == o((z : Cart[Real, 2]) => wirtinger_dbar(f, z), (t : Cart[Real, Unit]) => w + Cx(drop(r)) * cexp(ii * Cx(drop(t))))"), fn(x1598 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1599 = @tactics.subst1_tac(x1598)
    fn(x1600 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1599(x1600)
    }
  }), t1601), t1602), @tactics.conj_tac), t1603), t1604), t1605), t1606), t1607), t1608), t1618])
  let t1620 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_complex_mul()), @tactics.conj_tac), t1619)
  let t1621 = @list.List([@simp.rewrite_tac(@list.List([@topology.continuous_on_const()])), t1620])
  let t1597 = @tactics.match_mp_tac(@canal.continuous_on_complex_mul())
  let t1596 = @tactics.match_mp_tac(@integration.integrable_continuous())
  let t1594 = @meson.asm_meson_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at(), @topology.open_univ(), @sets.in_univ()]))
  let t1593 = @tactics.match_mp_tac(wirtinger_dbar_frechet_polar())
  let t1592 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t1595 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t1592), t1593), t1594), @tactics.all_tac])
  let t1622 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))) + ii * frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t))))) == ((t : Cart[Real, Unit]) => Cx(real_of_num(2)) * (wirtinger_dbar(f, w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))) * cnj(cexp(ii * Cx(drop(t))))))"), fn(x1589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1590 = @tactics.subst1_tac(x1589)
    fn(x1591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1590(x1591)
    }
  }), t1595), t1596), t1597), @tactics.conj_tac), t1621), @tactics.all_tac])
  let t1588 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))) + ii * frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))), interval([(vec(0), lift(real_of_num(2) * pi))]))"), fn(x1585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1586 = @tactics.assume_tac(x1585)
    fn(x1587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1586(x1587)
    }
  })
  let t1726 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t1588), t1622), t1626), t1628), @tactics.ap_term_tac), t1629), t1680), t1681), t1685), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1688), t1689), @tactics.disch_tac), t1693), t1715), t1718), t1722), t1724), t1725)
  let t1582 = @meson.asm_meson_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at(), @topology.open_univ(), @sets.in_univ()]))
  let t1583 = @tactics.then_tac(@tactics.match_mp_tac(wirtinger_dbar_frechet_polar()), t1582)
  let t1584 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.cx_inj()])), @calc_rat.real_arith_tac), t1583])
  let t1581 = @tactics.match_mp_tac(@complexes.complex_field(@term_syntax.parse_term("!(Cx(real_of_num(2)) == Cx(real_of_num(0))) && (f1 : Cart[Real, 2]) + ii * (f2 : Cart[Real, 2]) == Cx(real_of_num(2)) * ((d : Cart[Real, 2]) * (c : Cart[Real, 2])) → d * c == inv(Cx(real_of_num(2))) * (f1 + ii * f2)")))
  let t1580 = @simp.asm_simp_tac(@list.List([polar_cexp_simplify()]))
  let t1727 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])")), t1580), t1581), @tactics.conj_tac), t1584), t1726])
  let t1579 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], op_pct(drop((r : Cart[Real, Unit])), wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))) / (Cx(drop(r)) * cexp(ii * Cx(drop(t))))) == inv(Cx(real_of_num(2))) * (frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))) + ii * frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), ii * cexp(ii * Cx(drop(t)))))"), fn(x1576 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1577 = @tactics.assume_tac(x1576)
    fn(x1578 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1577(x1578)
    }
  })
  let t1728 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1579), t1727)
  inner_integral_simplify_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ r : Cart[Real, Unit], continuous_on(f, UNIV) && differentiable_on(f, UNIV) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), UNIV)) && real_of_num(0) < drop(r) → integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => op_pct(drop(r), wirtinger_dbar(f, w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))) / (Cx(drop(r)) * cexp(ii * Cx(drop(t)))))) == inv(Cx(real_of_num(2))) * integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))))"), t1728))
}

///|
let inner_integral_simplify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INNER_INTEGRAL_SIMPLIFY")

///|
/// `INNER_INTEGRAL_SIMPLIFY`
pub fn inner_integral_simplify() -> @kernel.Thm {
  inner_integral_simplify_c.get()
}

///|
/// RADIAL_INTEGRAL_NEG_FW
fn step_63() -> Unit raise {
  let t1791 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_lzero(), @vectors.dist_refl()]))
  let t1789 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(w : Cart[Real, 2])"), @vectors.norm_pos_le()))
  let t1788 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @transcendentals.norm_cexp_ii(), @complexes.complex_norm_cx(), @realarith.real_mul_rid()]))
  let t1787 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(x : Cart[Real, 2]) - ((w : Cart[Real, 2]) + x) == -w")), @vectors.norm_neg()]))
  let t1785 = @term_syntax.parse_term("(w : Cart[Real, 2]) + Cx((a : Real)) * cexp(ii * Cx((t0 : Real)))")
  let t1786 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("Cx((a : Real)) * cexp(ii * Cx((t0 : Real)))"), t1785]), @vectors.norm_triangle_sub()))
  let t1782 = @meson.asm_meson_tac(@list.List([]))
  let t1781 = @simp.asm_rewrite_tac(@list.List([]))
  let t1783 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.in_support(), @sets.in_univ(), @vectors.neutral_vector_add()])), t1781), t1782])
  let t1784 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN((w : Cart[Real, 2]) + Cx((a : Real)) * cexp(ii * Cx((t0 : Real))), support(op_plus, (f : (Cart[Real, 2]) -> Cart[Real, 2]), UNIV))"), fn(x1778 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1779 = @tactics.mp_tac(x1778)
    fn(x1780 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1779(x1780)
    }
  }), t1783), @tactics.all_tac])
  let t1777 = @tactics.subgoal_then(@term_syntax.parse_term("norm((w : Cart[Real, 2]) + Cx((a : Real)) * cexp(ii * Cx((t0 : Real)))) <= (R : Real)"), fn(x1774 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1775 = @tactics.mp_tac(x1774)
    fn(x1776 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1775(x1776)
    }
  })
  let t1790 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(p : Bool) → false) → p"))), @tactics.disch_tac), t1777), t1784), t1786), t1787), t1788), t1789), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1773 = @tactics.subgoal_then(@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + Cx((a : Real)) * cexp(ii * Cx((t0 : Real)))) == vec(0)"), fn(x1770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1771 = @tactics.subst1_tac(x1770)
    fn(x1772 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1771(x1772)
    }
  })
  let t1768 = @simp.asm_rewrite_tac(@list.List([]))
  let t1767 = @tactics.match_mp_tac(radial_ftc())
  let t1769 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integral_unique()), t1767), t1768), @tactics.all_tac])
  let t1766 = @tactics.subgoal_then(@term_syntax.parse_term("integral(interval([(vec(0), lift((a : Real)))]), (r : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx((t0 : Real)))), cexp(ii * Cx(t0)))) == f(w + Cx(a) * cexp(ii * Cx(t0))) - f(w)"), fn(x1763 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1764 = @tactics.subst1_tac(x1763)
    fn(x1765 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1764(x1765)
    }
  })
  let t1762 = @list.List([@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(w : Cart[Real, 2])"), @vectors.norm_pos_le())), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1761 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (a : Real)"), fn(x1758 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1759 = @tactics.assume_tac(x1758)
    fn(x1760 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1759(x1760)
    }
  })
  let t1757 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Real)"))
  let t1756 = @tactics.exists_tac(@term_syntax.parse_term("(B : Real)"))
  let t1755 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1754 = @simp.rewrite_tac(@list.List([@topology.lim_at_posinfinity()]))
  let t1750 = @simp.rewrite_tac(@list.List([@vectors.lift_drop()]))
  let t1749 = @simp.asm_rewrite_tac(@list.List([]))
  let t1745 = @term_syntax.parse_term("drop((a : Cart[Real, Unit]))")
  let t1746 = @term_syntax.parse_term("(t0 : Real)")
  let t1747 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t1748 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1747, t1746, t1745]), radial_ftc()))
  let t1744 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])((w : Cart[Real, 2]) + Cx(drop((a : Cart[Real, Unit]))) * cexp(ii * Cx((t0 : Real)))) - f(w)"))
  let t1751 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.has_integral_integrable()), t1744), t1748), t1749), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1750)
  let t1743 = @simp.rewrite_tac(@list.List([@integration.content_eq_0_1(), @vectors.drop_vec()]))
  let t1752 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integrable_on_null()), t1743), @calc_rat.asm_real_arith_tac), t1751])
  let t1742 = @class.asm_cases_tac(@term_syntax.parse_term("drop((a : Cart[Real, Unit])) <= real_of_num(0)"))
  let t1753 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, Unit])")), t1742), t1752), @tactics.all_tac])
  let t1741 = @simp.rewrite_tac(@list.List([@integration.has_integral_lim_at_posinfinity()]))
  let t1740 = @tactics.subgoal_then(@term_syntax.parse_term("has_integral((r : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx((t0 : Real)))), cexp(ii * Cx(t0))), -f(w), {(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)})"), fn(x1738 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1738
    @simp.rewrite_tac(@list.List([@drule.match_mp(@integration.integral_unique())(th)]))
  })
  let t1737 = @simp.abbrev_tac(@term_syntax.parse_term("(B : Real) == (R : Real) + (norm((w : Cart[Real, 2])) + real_of_num(1))"))
  let t1736 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(R : Real)"))(@tactics.strip_assume_tac))
  let t1733 = @simp.gen_rewrite_rule(fn(x1732 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1732
  }, @list.List([@topology.bounded_pos()]))
  let t1735 = @tactics.first_x_assum(fn(x1734 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1729 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1730 = @tactics.mp_tac(x1729)
      fn(x1731 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1730(x1731)
      }
    })(t1733(x1734))
  })
  let t1792 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1735), t1736), t1737), t1740), t1741), @tactics.conj_tac), t1753), t1754), t1755), @tactics.disch_tac), t1756), t1757), @tactics.disch_tac), t1761), t1762), t1766), t1769), t1773), t1790), t1791), @calc_rat.asm_real_arith_tac)
  radial_integral_neg_fw_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], ∀ t0 : Real, continuous_on(f, UNIV) && differentiable_on(f, UNIV) && bounded(support(op_plus, f, UNIV)) → integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(t0))), cexp(ii * Cx(t0)))) == -f(w)"), t1792))
}

///|
let radial_integral_neg_fw_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADIAL_INTEGRAL_NEG_FW")

///|
/// `RADIAL_INTEGRAL_NEG_FW`
pub fn radial_integral_neg_fw() -> @kernel.Thm {
  radial_integral_neg_fw_c.get()
}

///|
/// DROP_POS_OF_NONNEG_NZ
fn step_64() -> Unit raise {
  let t1793 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_1(), @vectors.forall_1(), @vectors.vec_component(), @vectors.drop_()]))), @calc_rat.real_arith_tac)
  drop_pos_of_nonneg_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Cart[Real, Unit], real_of_num(0) <= drop(r) && !(r == vec(0)) → real_of_num(0) < drop(r)"), t1793))
}

///|
let drop_pos_of_nonneg_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DROP_POS_OF_NONNEG_NZ")

///|
/// `DROP_POS_OF_NONNEG_NZ`
pub fn drop_pos_of_nonneg_nz() -> @kernel.Thm {
  drop_pos_of_nonneg_nz_c.get()
}

///|
/// WIRTINGER_DZ_FRECHET
fn step_65() -> Unit raise {
  let t1804 = @equal.gsym(@complexes.im_def())
  let t1805 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t1804]))
  let t1803 = @simp.simp_tac(@list.List([@vectors.vector_2(), @cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith()]))
  let t1802 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @complexes.im_def()]))
  let t1800 = @equal.gsym(@complexes.im_def())
  let t1801 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), t1800, @complexes.ii(), @complexes.cx_def(), @complexes.complex()]))
  let t1799 = @simp.rewrite_tac(@list.List([@complexes.complex_basis()]))
  let t1798 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith(), @vectors.vector_2()]))
  let t1797 = @simp.simp_tac(@list.List([@vectors.matrix_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t1796 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @complexes.im_def()]))
  let t1795 = @simp.rewrite_tac(@list.List([@complexes.complex_add(), @complexes.complex_sub(), @complexes.complex_mul(), @complexes.complex_neg(), @complexes.re(), @complexes.im(), @complexes.re_div_cx(), @complexes.im_div_cx(), @complexes.ii(), @complexes.cx_def(), @complexes.complex()]))
  let t1794 = @simp.rewrite_tac(@list.List([wirtinger_dz(), @derivatives.jacobian(), @complexes.complex_eq()]))
  let t1806 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1794), t1795), t1796), t1797), t1798), t1799), t1801), t1802), t1803), t1805), @calc_rat.real_arith_tac)
  wirtinger_dz_frechet_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], wirtinger_dz(f, z) == (frechet_derivative(f, at(z), Cx(real_of_num(1))) - ii * frechet_derivative(f, at(z), ii)) / Cx(real_of_num(2))"), t1806))
}

///|
let wirtinger_dz_frechet_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WIRTINGER_DZ_FRECHET")

///|
/// `WIRTINGER_DZ_FRECHET`
pub fn wirtinger_dz_frechet() -> @kernel.Thm {
  wirtinger_dz_frechet_c.get()
}

///|
/// WIRTINGER_DZ_CONTINUOUS
fn step_66() -> Unit raise {
  let t1825 = @simp.rewrite_tac(@list.List([]))
  let t1821 = @term_syntax.parse_term("ii")
  let t1824 = @tactics.first_x_assum(fn(x1823 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1819 = @tactics.mp_tac(x1818)
      fn(x1820 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1819(x1820)
      }
    })(((x1822 : @kernel.Thm) => @bool.spec(t1821, x1822))(x1823))
  })
  let t1826 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_complex_lmul()), t1824), t1825)
  let t1817 = @simp.rewrite_tac(@list.List([]))
  let t1814 = @term_syntax.parse_term("Cx(real_of_num(1))")
  let t1827 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x1816 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1811 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1812 = @tactics.mp_tac(x1811)
      fn(x1813 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1812(x1813)
      }
    })(((x1815 : @kernel.Thm) => @bool.spec(t1814, x1815))(x1816))
  }), t1817), t1826])
  let t1810 = @tactics.match_mp_tac(@topology.continuous_on_sub())
  let t1809 = @tactics.match_mp_tac(@canal.continuous_on_complex_rmul())
  let t1808 = @simp.rewrite_tac(@list.List([@complexes.complex_div()]))
  let t1807 = @simp.rewrite_tac(@list.List([wirtinger_dz_frechet()]))
  let t1828 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1807), t1808), t1809), t1810), @tactics.conj_tac), t1827)
  wirtinger_dz_continuous_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ s : (Cart[Real, 2]) -> Bool, (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), s)) → continuous_on((z : Cart[Real, 2]) => wirtinger_dz(f, z), s)"), t1828))
}

///|
let wirtinger_dz_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WIRTINGER_DZ_CONTINUOUS")

///|
/// `WIRTINGER_DZ_CONTINUOUS`
pub fn wirtinger_dz_continuous() -> @kernel.Thm {
  wirtinger_dz_continuous_c.get()
}

///|
/// FRECHET_CONTINUOUS_ON_JOINT
fn step_67() -> Unit raise {
  let t1882 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax(), @canal.continuous_on_cnj()]))
  let t1881 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1883 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1878 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1879 = @equal.land_conv(x1878)
    fn(x1880 : @kernel.Term) -> @kernel.Thm raise {
      s1879(x1880)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())])), t1881), t1882)
  let t1877 = @simp.asm_rewrite_tac(@list.List([@sets.subset_univ()]))
  let t1876 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t1875 = @tactics.match_mp_tac(@topology.continuous_on_subset())
  let t1874 = @simp.asm_rewrite_tac(@list.List([]))
  let t1873 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1884 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1870 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1871 = @equal.land_conv(x1870)
    fn(x1872 : @kernel.Term) -> @kernel.Thm raise {
      s1871(x1872)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())])), t1873), t1874), t1875), t1876), t1877), t1883])
  let t1885 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_complex_mul()), @tactics.conj_tac), t1884)
  let t1868 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax()]))
  let t1867 = @simp.asm_rewrite_tac(@list.List([@sets.subset_univ()]))
  let t1866 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t1865 = @tactics.match_mp_tac(@topology.continuous_on_subset())
  let t1864 = @simp.asm_rewrite_tac(@list.List([]))
  let t1863 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1869 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1860 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1861 = @equal.land_conv(x1860)
    fn(x1862 : @kernel.Term) -> @kernel.Thm raise {
      s1861(x1862)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())])), t1863), t1864), t1865), t1866), t1867), t1868])
  let t1886 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_complex_mul()), @tactics.conj_tac), t1869), t1885])
  let t1859 = @tactics.match_mp_tac(@topology.continuous_on_add())
  let t1857 = @simp.asm_rewrite_tac(@list.List([]))
  let t1858 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@class.eta_ax()]))(wirtinger_dbar_continuous())), t1857), @tactics.all_tac])
  let t1856 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on(wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2])), UNIV)"), fn(x1853 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1854 = @tactics.assume_tac(x1853)
    fn(x1855 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1854(x1855)
    }
  })
  let t1851 = @simp.asm_rewrite_tac(@list.List([]))
  let t1852 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@class.eta_ax()]))(wirtinger_dz_continuous())), t1851), @tactics.all_tac])
  let t1850 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on(wirtinger_dz((f : (Cart[Real, 2]) -> Cart[Real, 2])), UNIV)"), fn(x1847 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1848 = @tactics.assume_tac(x1847)
    fn(x1849 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1848(x1849)
    }
  })
  let t1844 = @tactics.disch_then(fn(x1842 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1842
    @simp.rewrite_tac(@list.List([th]))
  })
  let t1845 = @list.List([@simp.asm_rewrite_tac(@list.List([@equal.gsym(@derivatives.frechet_derivative_works())])), t1844])
  let t1839 = @term_syntax.parse_term("(g : (Cart[Real, P]) -> Cart[Real, 2])((x : Cart[Real, P]))")
  let t1840 = @term_syntax.parse_term("frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((g : (Cart[Real, P]) -> Cart[Real, 2])((x : Cart[Real, P]))))")
  let t1841 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1840, t1839]), frechet_wirtinger()))
  let t1838 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, P])"))
  let t1846 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t1838), t1841), @tactics.ants_tac), t1845), @tactics.all_tac])
  let t1837 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, P]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((g : (Cart[Real, P]) -> Cart[Real, 2])(x)), (h : (Cart[Real, P]) -> Cart[Real, 2])(x))) == ((x : Cart[Real, P]) => wirtinger_dz(f, g(x)) * h(x) + wirtinger_dbar(f, g(x)) * cnj(h(x)))"), fn(x1834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1835 = @tactics.subst1_tac(x1834)
    fn(x1836 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1835(x1836)
    }
  })
  let t1833 = @list.List([@meson.asm_meson_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at(), @topology.open_univ(), @sets.in_univ()])), @tactics.all_tac])
  let t1832 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], differentiable((f : (Cart[Real, 2]) -> Cart[Real, 2]), at(z))"), fn(x1829 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1830 = @tactics.assume_tac(x1829)
    fn(x1831 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1830(x1831)
    }
  })
  let t1887 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1832), t1833), t1837), t1846), t1850), t1852), t1856), t1858), t1859), @tactics.conj_tac), t1886)
  frechet_continuous_on_joint_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, P]) -> Cart[Real, 2], ∀ h : (Cart[Real, P]) -> Cart[Real, 2], ∀ s : (Cart[Real, P]) -> Bool, differentiable_on(f, UNIV) && (∀ e : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), e), UNIV)) && continuous_on(g, s) && continuous_on(h, s) → continuous_on((x : Cart[Real, P]) => frechet_derivative(f, at(g(x)), h(x)), s)"), t1887))
}

///|
let frechet_continuous_on_joint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRECHET_CONTINUOUS_ON_JOINT")

///|
/// `FRECHET_CONTINUOUS_ON_JOINT`
pub fn frechet_continuous_on_joint() -> @kernel.Thm {
  frechet_continuous_on_joint_c.get()
}

///|
/// CONTINUOUS_ON_CEXP_SNDCART
fn step_68() -> Unit raise {
  let t1896 = @simp.rewrite_tac(@list.List([@vectors.linear_sndcart()]))
  let t1895 = @tactics.match_mp_tac(@topology.linear_continuous_on())
  let t1894 = @tactics.match_mp_tac(@canal.continuous_on_cx_drop())
  let t1893 = @tactics.match_mp_tac(@canal.continuous_on_complex_lmul())
  let t1892 = @simp.rewrite_tac(@list.List([@transcendentals.continuous_on_cexp()]))
  let t1891 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t1897 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.gen_rewrite_tac(fn(x1888 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1889 = @equal.land_conv(x1888)
    fn(x1890 : @kernel.Term) -> @kernel.Thm raise {
      s1889(x1890)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())]))), t1891), t1892), t1893), t1894), t1895), t1896)
  continuous_on_cexp_sndcart_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, Finite_sum[Unit, Unit]]) -> Bool, continuous_on((z : Cart[Real, Finite_sum[Unit, Unit]]) => cexp(ii * Cx(drop(sndcart(z)))), s)"), t1897))
}

///|
let continuous_on_cexp_sndcart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CEXP_SNDCART")

///|
/// `CONTINUOUS_ON_CEXP_SNDCART`
pub fn continuous_on_cexp_sndcart() -> @kernel.Thm {
  continuous_on_cexp_sndcart_c.get()
}

///|
/// CONTINUOUS_ON_POLAR_PASTECART
fn step_69() -> Unit raise {
  let t1901 = @simp.rewrite_tac(@list.List([continuous_on_cexp_sndcart()]))
  let t1900 = @simp.rewrite_tac(@list.List([@vectors.linear_fstcart()]))
  let t1899 = @tactics.match_mp_tac(@topology.linear_continuous_on())
  let t1902 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_cx_drop()), t1899), t1900), t1901])
  let t1903 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@canal.continuous_on_complex_mul()), @tactics.conj_tac), t1902)
  let t1904 = @list.List([@simp.rewrite_tac(@list.List([@topology.continuous_on_const()])), t1903])
  let t1898 = @tactics.match_mp_tac(@topology.continuous_on_add())
  let t1905 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1898), @tactics.conj_tac), t1904)
  continuous_on_polar_pastecart_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ s : (Cart[Real, Finite_sum[Unit, Unit]]) -> Bool, continuous_on((z : Cart[Real, Finite_sum[Unit, Unit]]) => w + Cx(drop(fstcart(z))) * cexp(ii * Cx(drop(sndcart(z)))), s)"), t1905))
}

///|
let continuous_on_polar_pastecart_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_POLAR_PASTECART")

///|
/// `CONTINUOUS_ON_POLAR_PASTECART`
pub fn continuous_on_polar_pastecart() -> @kernel.Thm {
  continuous_on_polar_pastecart_c.get()
}

///|
/// FRECHET_DERIVATIVE_ZERO_OUTSIDE
fn step_70() -> Unit raise {
  let t1933 = @tactics.disch_then(fn(x1931 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1931
    @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
  })
  let t1928 = @drule.match_mp(@derivatives.frechet_derivative_at())
  let t1930 = @tactics.first_x_assum(fn(x1929 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1925 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1926 = @tactics.mp_tac(x1925)
      fn(x1927 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1926(x1927)
      }
    })(t1928(x1929))
  })
  let t1922 = @simp.rewrite_tac(@list.List([]))
  let t1921 = @simp.rewrite_tac(@list.List([@vectors.norm_sub()]))
  let t1919 = @term_syntax.parse_term("(y : Cart[Real, M])")
  let t1920 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, M])"), t1919]), @vectors.norm_triangle_sub()))
  let t1918 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1917 = @tactics.conv_tac(@equal.sym_conv)
  let t1916 = @simp.rewrite_tac(@list.List([@vectors.dist()]))
  let t1915 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, M])"))
  let t1923 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1915), t1916), @tactics.disch_tac), t1917), t1918), t1920), t1921), @calc_rat.asm_real_arith_tac), t1922])
  let t1914 = @simp.rewrite_tac(@list.List([@derivatives.has_derivative_const()]))
  let t1910 = @term_syntax.parse_term("(norm((z : Cart[Real, M])) - (R : Real)) / real_of_num(2)")
  let t1911 = @term_syntax.parse_term("(z : Cart[Real, M])")
  let t1912 = @term_syntax.parse_term("(f : (Cart[Real, M]) -> Cart[Real, N])")
  let t1913 = @term_syntax.parse_term("(h : Cart[Real, M]) => (vec : (Num) -> Cart[Real, N])(0)")
  let t1924 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(y : Cart[Real, M]) => (vec : (Num) -> Cart[Real, N])(0)"), t1913, t1912, t1911, t1910]), @derivatives.has_derivative_transform_at())), t1914), @tactics.ants_tac), t1923), @tactics.all_tac])
  let t1909 = @tactics.subgoal_then(@term_syntax.parse_term("has_derivative((f : (Cart[Real, M]) -> Cart[Real, N]), (h : Cart[Real, M]) => vec(0), at((z : Cart[Real, M])))"), fn(x1906 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1907 = @tactics.assume_tac(x1906)
    fn(x1908 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1907(x1908)
    }
  })
  let t1934 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1909), t1924), t1930), t1933)
  frechet_derivative_zero_outside_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ z : Cart[Real, M], ∀ h : Cart[Real, M], ∀ R : Real, differentiable_on(f, UNIV) && (∀ y : Cart[Real, M], R < norm(y) → f(y) == vec(0)) && R < norm(z) → frechet_derivative(f, at(z), h) == vec(0)"), t1934))
}

///|
let frechet_derivative_zero_outside_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FRECHET_DERIVATIVE_ZERO_OUTSIDE")

///|
/// `FRECHET_DERIVATIVE_ZERO_OUTSIDE`
pub fn frechet_derivative_zero_outside() -> @kernel.Thm {
  frechet_derivative_zero_outside_c.get()
}

///|
/// ZERO_OUTSIDE_SUPPORT_BALL
fn step_71() -> Unit raise {
  let t1948 = @tactics.then_tac(@tactics.disch_then(fn(x1941 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1941
    @tactics.first_assum(fn(x1947 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1943 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1944 = @tactics.mp_tac(x1943)
        fn(x1945 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1944(x1945)
        }
      })((fn(x1946 : @kernel.Thm) -> @kernel.Thm raise {
        @drule.match_mp(x1946)(th)
      })(x1947))
    })
  }), @calc_rat.asm_real_arith_tac)
  let t1940 = @simp.asm_rewrite_tac(@list.List([]))
  let t1949 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.in_support(), @sets.in_univ(), @vectors.neutral_vector_add()])), t1940), t1948])
  let t1939 = @tactics.subgoal_then(@term_syntax.parse_term("IN((y : Cart[Real, M]), support(op_plus, (f : (Cart[Real, M]) -> Cart[Real, N]), UNIV))"), fn(x1936 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1937 = @tactics.mp_tac(x1936)
    fn(x1938 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1937(x1938)
    }
  })
  let t1935 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(p : Bool) → false) → p")))
  let t1950 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1935), @tactics.disch_tac), t1939), t1949)
  zero_outside_support_ball_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ R : Real, (∀ x : Cart[Real, M], IN(x, support(op_plus, f, UNIV)) → norm(x) <= R) → (∀ y : Cart[Real, M], R < norm(y) → f(y) == vec(0))"), t1950))
}

///|
let zero_outside_support_ball_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZERO_OUTSIDE_SUPPORT_BALL")

///|
/// `ZERO_OUTSIDE_SUPPORT_BALL`
pub fn zero_outside_support_ball() -> @kernel.Thm {
  zero_outside_support_ball_c.get()
}

///|
/// POLAR_POINT_NORM_BOUND
fn step_72() -> Unit raise {
  let t1955 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(w : Cart[Real, 2])"), @vectors.norm_pos_le()))
  let t1954 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul(), @transcendentals.norm_cexp_ii(), @complexes.complex_norm_cx(), @realarith.real_mul_rid()]))
  let t1953 = @simp.rewrite_tac(@list.List([@complexes.complex_ring(@term_syntax.parse_term("(x : Cart[Real, 2]) - ((w : Cart[Real, 2]) + x) == -w")), @vectors.norm_neg()]))
  let t1951 = @term_syntax.parse_term("(w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop((t : Cart[Real, Unit]))))")
  let t1952 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop((t : Cart[Real, Unit]))))"), t1951]), @vectors.norm_triangle_sub()))
  let t1956 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1952), t1953), t1954), t1955), @calc_rat.asm_real_arith_tac)
  polar_point_norm_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 2], ∀ r : Cart[Real, Unit], ∀ t : Cart[Real, Unit], ∀ R : Real, R + (norm(w) + real_of_num(1)) <= drop(r) → R < norm(w + Cx(drop(r)) * cexp(ii * Cx(drop(t))))"), t1956))
}

///|
let polar_point_norm_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLAR_POINT_NORM_BOUND")

///|
/// `POLAR_POINT_NORM_BOUND`
pub fn polar_point_norm_bound() -> @kernel.Thm {
  polar_point_norm_bound_c.get()
}

///|
/// POLAR_FUBINI_SWAP
fn step_73() -> Unit raise {
  let t2024 = @simp.asm_rewrite_tac(@list.List([continuous_on_polar_pastecart(), continuous_on_cexp_sndcart()]))
  let t2023 = @tactics.match_mp_tac(frechet_continuous_on_joint())
  let t2022 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2021 = @simp.rewrite_tac(@list.List([]))
  let t2016 = @term_syntax.parse_term("lift(real_of_num(2) * pi)")
  let t2017 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t2018 = @term_syntax.parse_term("lift((B : Real))")
  let t2019 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t2020 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(r : Cart[Real, Unit]) => (t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t))))"), t2019, t2018, t2017, t2016]), @measure.integral_swap_continuous()))
  let t2014 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2013 = @simp.asm_rewrite_tac(@list.List([]))
  let t2012 = @class.asm_cases_tac(@term_syntax.parse_term("drop((r : Cart[Real, Unit])) <= (B : Real)"))
  let t2011 = @simp.asm_rewrite_tac(@list.List([]))
  let t2010 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= drop((r : Cart[Real, Unit]))"))
  let t2009 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @topology.in_interval_1(), @vectors.drop_vec(), @vectors.lift_drop()]))
  let t2008 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Cart[Real, Unit])"))
  let t2007 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t2006 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@integration.integral_restrict_univ())]))
  let t2005 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t2015 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))), t2005), t2006), @tactics.ap_term_tac), t2007), t2008), t2009), t2010), t2011), t2012), t2013), t2014), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2004 = @tactics.subgoal_then(@term_syntax.parse_term("integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))))) == integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => integral(interval([(vec(0), lift((B : Real)))]), (r : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t))))))"), fn(x2001 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2002 = @tactics.subst1_tac(x2001)
    fn(x2003 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2002(x2003)
    }
  })
  let t1999 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1998 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop((r : Cart[Real, Unit]))) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))) == vec(0)"), fn(x1996 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1996
    @simp.rewrite_tac(@list.List([th, @integration.integral_0()]))
  })
  let t1995 = @simp.asm_rewrite_tac(@list.List([]))
  let t1994 = @class.asm_cases_tac(@term_syntax.parse_term("drop((r : Cart[Real, Unit])) <= (B : Real)"))
  let t1993 = @simp.asm_rewrite_tac(@list.List([]))
  let t1992 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= drop((r : Cart[Real, Unit]))"))
  let t1991 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @topology.in_interval_1(), @vectors.drop_vec(), @vectors.lift_drop()]))
  let t1990 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Cart[Real, Unit])"))
  let t1989 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t2000 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@integration.integral_restrict_univ())])), @tactics.ap_term_tac), t1989), t1990), t1991), t1992), t1993), t1994), t1995), t1998), @tactics.gen_tac), t1999), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1988 = @tactics.subgoal_then(@term_syntax.parse_term("integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))))) == integral(interval([(vec(0), lift((B : Real)))]), (r : Cart[Real, Unit]) => integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t))))))"), fn(x1985 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1986 = @tactics.subst1_tac(x1985)
    fn(x1987 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1986(x1987)
    }
  })
  let t1983 = @simp.expand_tac("B")
  let t1982 = @tactics.match_mp_tac(polar_point_norm_bound())
  let t1981 = @simp.asm_rewrite_tac(@list.List([]))
  let t1980 = @tactics.exists_tac(@term_syntax.parse_term("(R : Real)"))
  let t1979 = @tactics.match_mp_tac(frechet_derivative_zero_outside())
  let t1984 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1979), t1980), t1981), t1982), t1983), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1978 = @tactics.subgoal_then(@term_syntax.parse_term("∀ r : Cart[Real, Unit], ∀ t : Cart[Real, Unit], (B : Real) < drop(r) → frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))) == vec(0)"), fn(x1975 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1976 = @tactics.assume_tac(x1975)
    fn(x1977 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1976(x1977)
    }
  })
  let t1974 = @simp.asm_rewrite_tac(@list.List([]))
  let t1972 = @term_syntax.parse_term("(R : Real)")
  let t1973 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t1972]), zero_outside_support_ball()))
  let t1970 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(w : Cart[Real, 2])"), @vectors.norm_pos_le()))
  let t1971 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("B"), t1970), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1969 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (B : Real)"), fn(x1966 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1967 = @tactics.assume_tac(x1966)
    fn(x1968 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1967(x1968)
    }
  })
  let t1965 = @simp.abbrev_tac(@term_syntax.parse_term("(B : Real) == (R : Real) + (norm((w : Cart[Real, 2])) + real_of_num(1))"))
  let t1964 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(R : Real)"))(@tactics.strip_assume_tac))
  let t1961 = @simp.gen_rewrite_rule(fn(x1960 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1960
  }, @list.List([@topology.bounded_pos()]))
  let t1963 = @tactics.first_x_assum(fn(x1962 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1957 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1958 = @tactics.mp_tac(x1957)
      fn(x1959 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1958(x1959)
      }
    })(t1961(x1962))
  })
  let t2025 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1963), t1964), t1965), t1969), t1971), t1973), t1974), @tactics.disch_tac), t1978), t1984), t1988), t2000), t2004), t2015), t2020), t2021), t2022), t2023), t2024)
  polar_fubini_swap_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], continuous_on(f, UNIV) && differentiable_on(f, UNIV) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), UNIV)) && bounded(support(op_plus, f, UNIV)) → integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))))) == integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t))))))"), t2025))
}

///|
let polar_fubini_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLAR_FUBINI_SWAP")

///|
/// `POLAR_FUBINI_SWAP`
pub fn polar_fubini_swap() -> @kernel.Thm {
  polar_fubini_swap_c.get()
}

///|
/// POLAR_INTEGRAL_DECOMPOSITION
fn step_74() -> Unit raise {
  let t2120 = @simp.asm_rewrite_tac(@list.List([]))
  let t2117 = @term_syntax.parse_term("drop((t0 : Cart[Real, Unit]))")
  let t2118 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t2119 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t2118, t2117]), radial_integral_neg_fw()))
  let t2116 = @tactics.x_gen_tac(@term_syntax.parse_term("(t0 : Cart[Real, Unit])"))
  let t2115 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t))))) == -f(w)"), fn(x2113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2113
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t2111 = @simp.asm_rewrite_tac(@list.List([]))
  let t2112 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(polar_fubini_swap()), t2111), @tactics.all_tac])
  let t2110 = @tactics.subgoal_then(@term_syntax.parse_term("integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t)))))) == integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t))))))"), fn(x2107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2108 = @tactics.subst1_tac(x2107)
    fn(x2109 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2108(x2109)
    }
  })
  let t2105 = @simp.asm_simp_tac(@list.List([@equal.gsym(@canal.integral_complex_lmul())]))
  let t2103 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_eq_0(), @complexes.cx_inj()]))
  let t2102 = @tactics.undisch_tac(@term_syntax.parse_term("inv(Cx(real_of_num(2))) == Cx(real_of_num(0))"))
  let t2101 = @simp.asm_rewrite_tac(@list.List([]))
  let t2100 = @simp.rewrite_tac(@list.List([@canal.integrable_complex_lmul_eq()]))
  let t2096 = @simp.asm_rewrite_tac(@list.List([]))
  let t2097 = @tactics.then_tac(@tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable()), t2096)
  let t2094 = @simp.simp_tac(@list.List([]))
  let t2095 = @list.List([@meson.asm_meson_tac(@list.List([drop_pos_of_nonneg_nz()])), t2094])
  let t2093 = @simp.asm_rewrite_tac(@list.List([]))
  let t2090 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t2091 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t2092 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t2091, t2090]), inner_integral_simplify()))
  let t2089 = @tactics.conv_tac(@equal.sym_conv)
  let t2098 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t2089), t2092), t2093), @tactics.ants_tac), t2095), t2097])
  let t2088 = @simp.rewrite_tac(@list.List([@integration.negligible_sing(), @sets.in_diff(), @sets.in_elim_thm(), @sets.in_sing()]))
  let t2087 = @tactics.exists_tac(@term_syntax.parse_term("{(vec : (Num) -> Cart[Real, Unit])(0)}"))
  let t2086 = @tactics.exists_tac(@term_syntax.parse_term("(r : Cart[Real, Unit]) => integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => op_pct(drop(r), wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))) / (Cx(drop(r)) * cexp(ii * Cx(drop(t))))))"))
  let t2099 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(@integration.integrable_spike())), t2086), t2087), t2088), @tactics.conj_tac), t2098), @tactics.all_tac])
  let t2104 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("integrable_on((r : Cart[Real, Unit]) => inv(Cx(real_of_num(2))) * integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t))))), {(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)})"), fn(x2083 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2084 = @tactics.mp_tac(x2083)
    fn(x2085 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2084(x2085)
    }
  }), t2099), t2100), @tactics.strip_tac), t2101), t2102), t2103), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2082 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((r : Cart[Real, Unit]) => integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t))))), {(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)})"), fn(x2079 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2080 = @tactics.assume_tac(x2079)
    fn(x2081 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2080(x2081)
    }
  })
  let t2076 = @simp.simp_tac(@list.List([]))
  let t2077 = @list.List([@meson.asm_meson_tac(@list.List([drop_pos_of_nonneg_nz()])), t2076])
  let t2075 = @simp.asm_rewrite_tac(@list.List([]))
  let t2072 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t2073 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t2074 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t2073, t2072]), inner_integral_simplify()))
  let t2071 = @simp.rewrite_tac(@list.List([@integration.negligible_sing(), @sets.in_diff(), @sets.in_elim_thm(), @sets.in_sing()]))
  let t2070 = @tactics.exists_tac(@term_syntax.parse_term("{(vec : (Num) -> Cart[Real, Unit])(0)}"))
  let t2078 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integral_spike()), t2070), t2071), @tactics.gen_tac), @tactics.strip_tac), t2074), t2075), @tactics.ants_tac), t2077), @tactics.all_tac])
  let t2069 = @tactics.subgoal_then(@term_syntax.parse_term("integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => op_pct(drop(r), wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))) / (Cx(drop(r)) * cexp(ii * Cx(drop(t))))))) == integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => inv(Cx(real_of_num(2))) * integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t))))))"), fn(x2066 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2067 = @tactics.subst1_tac(x2066)
    fn(x2068 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2067(x2068)
    }
  })
  let t2064 = @tactics.disch_then(fn(x2062 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2062
    @tactics.accept_tac(@bool.conjunct1(@bool.conjunct2(th)))
  })
  let t2061 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t2065 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@equal.beta_rule(@bool.ispec(@term_syntax.parse_term("(z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + z) / z"), @transcendentals.fubini_polar()))), @tactics.ants_tac), t2061), t2064), @tactics.all_tac])
  let t2106 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("absolutely_integrable_on((r : Cart[Real, Unit]) => integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => op_pct(drop(r), wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))) / (Cx(drop(r)) * cexp(ii * Cx(drop(t)))))), {(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)})"), fn(x2058 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2059 = @tactics.assume_tac(x2058)
    fn(x2060 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2059(x2060)
    }
  }), t2065), t2069), t2078), t2082), t2104), t2105), @tactics.all_tac])
  let t2057 = @tactics.subgoal_then(@term_syntax.parse_term("integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => op_pct(drop(r), wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + Cx(drop(r)) * cexp(ii * Cx(drop(t)))) / (Cx(drop(r)) * cexp(ii * Cx(drop(t))))))) == inv(Cx(real_of_num(2))) * integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => frechet_derivative(f, at(w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))), cexp(ii * Cx(drop(t))))))"), fn(x2054 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2055 = @tactics.subst1_tac(x2054)
    fn(x2056 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2055(x2056)
    }
  })
  let t2052 = @tactics.disch_then(fn(x2051 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2050 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2049 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2046 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s2047 = @tactics.accept_tac(x2046)
          fn(x2048 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s2047(x2048)
          }
        })(@equal.sym(x2049))
      })(@bool.conjunct2(x2050))
    })(@bool.conjunct2(x2051))
  })
  let t2045 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t2053 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@equal.beta_rule(@bool.ispec(@term_syntax.parse_term("(z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + z) / z"), @transcendentals.fubini_polar()))), @tactics.ants_tac), t2045), t2052), @tactics.all_tac])
  let t2044 = @tactics.subgoal_then(@term_syntax.parse_term("integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + z) / z) == integral({(r : Cart[Real, Unit]) | real_of_num(0) <= drop(r)}, (r : Cart[Real, Unit]) => integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => op_pct(drop(r), wirtinger_dbar(f, w + Cx(drop(r)) * cexp(ii * Cx(drop(t)))) / (Cx(drop(r)) * cexp(ii * Cx(drop(t)))))))"), fn(x2041 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2042 = @tactics.subst1_tac(x2041)
    fn(x2043 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2042(x2043)
    }
  })
  let t2037 = @simp.asm_rewrite_tac(@list.List([]))
  let t2038 = @tactics.then_tac(@tactics.match_mp_tac(wirtinger_dbar_bounded_support()), t2037)
  let t2036 = @simp.asm_rewrite_tac(@list.List([]))
  let t2039 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(wirtinger_dbar_continuous()), t2036), t2038])
  let t2040 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(absolutely_integrable_dbar_kernel()), @tactics.conj_tac), t2039), @tactics.all_tac])
  let t2035 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_integrable_on((z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + z) / z, UNIV)"), fn(x2032 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2033 = @tactics.assume_tac(x2032)
    fn(x2034 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2033(x2034)
    }
  })
  let t2030 = @simp.asm_rewrite_tac(@list.List([]))
  let t2031 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@derivatives.differentiable_imp_continuous_on()), t2030), @tactics.all_tac])
  let t2029 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on((f : (Cart[Real, 2]) -> Cart[Real, 2]), UNIV)"), fn(x2026 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2027 = @tactics.assume_tac(x2026)
    fn(x2028 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2027(x2028)
    }
  })
  let t2121 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2029), t2031), t2035), t2040), t2044), t2053), t2057), t2106), t2110), t2112), t2115), t2116), t2119), t2120)
  polar_integral_decomposition_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], differentiable_on(f, UNIV) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), UNIV)) && bounded(support(op_plus, f, UNIV)) → integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar(f, w + z) / z) == inv(Cx(real_of_num(2))) * integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => -f(w))"), t2121))
}

///|
let polar_integral_decomposition_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLAR_INTEGRAL_DECOMPOSITION")

///|
/// `POLAR_INTEGRAL_DECOMPOSITION`
pub fn polar_integral_decomposition() -> @kernel.Thm {
  polar_integral_decomposition_c.get()
}

///|
/// INTEGRAL_CONST_2PI
fn step_75() -> Unit raise {
  let t2129 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul()]))
  let t2128 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t2127 = @simp.rewrite_tac(@list.List([@vectors.drop_vec(), @vectors.lift_drop()]))
  let t2126 = @term_syntax.parse_term("lift(real_of_num(2) * pi)")
  let t2130 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)"), t2126]), @integration.content_1())), t2127), t2128), @calc_rat.real_arith_tac), t2129])
  let t2125 = @tactics.subgoal_then(@term_syntax.parse_term("content(interval([(vec(0), lift(real_of_num(2) * pi))])) == real_of_num(2) * pi"), fn(x2122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2123 = @tactics.subst1_tac(x2122)
    fn(x2124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2123(x2124)
    }
  })
  let t2131 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@integration.integral_const()]))), t2125), t2130)
  integral_const_2pi_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => c) == Cx(real_of_num(2) * pi) * c"), t2131))
}

///|
let integral_const_2pi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRAL_CONST_2PI")

///|
/// `INTEGRAL_CONST_2PI`
pub fn integral_const_2pi() -> @kernel.Thm {
  integral_const_2pi_c.get()
}

///|
/// INV_TWO_TIMES_TWO_PI
fn step_76() -> Unit raise {
  let t2136 = @simp.rewrite_tac(@list.List([@complexes.cx_inj()]))
  let t2135 = @tactics.match_mp_tac(@complexes.complex_mul_linv())
  let t2134 = @tactics.subgoal_then(@term_syntax.parse_term("inv(Cx(real_of_num(2))) * Cx(real_of_num(2)) == Cx(real_of_num(1))"), fn(x2132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2132
    @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc(), th, @complexes.complex_mul_lid()]))
  })
  let t2137 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.cx_mul()])), t2134), t2135), t2136), @calc_rat.real_arith_tac)
  inv_two_times_two_pi_c.set(@tactics.prove(@term_syntax.parse_term("inv(Cx(real_of_num(2))) * Cx(real_of_num(2) * pi) == Cx(pi)"), t2137))
}

///|
let inv_two_times_two_pi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INV_TWO_TIMES_TWO_PI")

///|
/// `INV_TWO_TIMES_TWO_PI`
pub fn inv_two_times_two_pi() -> @kernel.Thm {
  inv_two_times_two_pi_c.get()
}

///|
/// CAUCHY_TRANSFORM_INVERTS_DBAR
fn step_77() -> Unit raise {
  let t2145 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rneg()]))
  let t2144 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_assoc(), inv_two_times_two_pi()]))
  let t2146 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([integral_const_2pi()])), t2144), t2145)
  let t2143 = @simp.asm_rewrite_tac(@list.List([]))
  let t2147 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(polar_integral_decomposition()), t2143), t2146])
  let t2142 = @tactics.subgoal_then(@term_syntax.parse_term("integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (w : Cart[Real, 2]) + z) / z) == inv(Cx(real_of_num(2))) * integral(interval([(vec(0), lift(real_of_num(2) * pi))]), (t : Cart[Real, Unit]) => -f(w))"), fn(x2139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2140 = @tactics.subst1_tac(x2139)
    fn(x2141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2140(x2141)
    }
  })
  let t2138 = @simp.once_rewrite_tac(@list.List([cauchy_transform_dbar_translation()]))
  let t2148 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2138), t2142), t2147)
  cauchy_transform_inverts_dbar_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ w : Cart[Real, 2], differentiable_on(f, UNIV) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), UNIV)) && bounded(support(op_plus, f, UNIV)) → integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar(f, z) / (z - w)) == -(Cx(pi) * f(w))"), t2148))
}

///|
let cauchy_transform_inverts_dbar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CAUCHY_TRANSFORM_INVERTS_DBAR")

///|
/// `CAUCHY_TRANSFORM_INVERTS_DBAR`
pub fn cauchy_transform_inverts_dbar() -> @kernel.Thm {
  cauchy_transform_inverts_dbar_c.get()
}

///|
/// PIECEWISE_HAS_DERIVATIVE_LOCAL
fn step_78() -> Unit raise {
  let t2203 = @tactics.then_tac(@tactics.first_x_assum(fn(x2202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(((x2201 : @kernel.Thm) => @lib.check(fn(x2199 : @kernel.Thm) -> Bool raise {
      let th_2 = x2199
      let t2200 = @kernel.concl(th_2)
      @basics.free_in(@term_syntax.parse_term("(d2 : Real)"), t2200)
    }, x2201))(x2202))
  }), @calc_rat.asm_real_arith_tac)
  let t2204 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t2203])
  let t2205 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(ef : (Cart[Real, M]) -> Cart[Real, N])((y : Cart[Real, M])) - (g : (Cart[Real, M]) -> Cart[Real, N])((z : Cart[Real, M])) - (f' : (Cart[Real, M]) -> Cart[Real, N])(y - z) == g(y) - g(z) - f'(y - z)"), fn(x2196 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2197 = @tactics.subst1_tac(x2196)
    fn(x2198 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2197(x2198)
    }
  }), t2204)
  let t2194 = @tactics.then_tac(@tactics.first_x_assum(fn(x2193 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(((x2192 : @kernel.Thm) => @lib.check(fn(x2190 : @kernel.Thm) -> Bool raise {
      let th_1 = x2190
      let t2191 = @kernel.concl(th_1)
      @basics.free_in(@term_syntax.parse_term("(d1 : Real)"), t2191)
    }, x2192))(x2193))
  }), @calc_rat.asm_real_arith_tac)
  let t2188 = @simp.asm_rewrite_tac(@list.List([]))
  let t2189 = @list.List([@meson.asm_meson_tac(@list.List([])), t2188])
  let t2195 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(g : (Cart[Real, M]) -> Cart[Real, N])((z : Cart[Real, M])) == (f : (Cart[Real, M]) -> Cart[Real, N])(z)"), fn(x2186 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2186
    @simp.rewrite_tac(@list.List([th]))
  }), t2189), t2194])
  let t2206 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(ef : (Cart[Real, M]) -> Cart[Real, N])((y : Cart[Real, M])) - (g : (Cart[Real, M]) -> Cart[Real, N])((z : Cart[Real, M])) - (f' : (Cart[Real, M]) -> Cart[Real, N])(y - z) == (f : (Cart[Real, M]) -> Cart[Real, N])(y) - f(z) - f'(y - z)"), fn(x2183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2184 = @tactics.subst1_tac(x2183)
    fn(x2185 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2184(x2185)
    }
  }), t2195), t2205])
  let t2182 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t2178 = @term_syntax.parse_term("(y : Cart[Real, M])")
  let t2181 = @tactics.disch_then(fn(x2180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2175 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2176 = @tactics.mp_tac(x2175)
      fn(x2177 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2176(x2177)
      }
    })(((x2179 : @kernel.Thm) => @bool.spec(t2178, x2179))(x2180))
  })
  let t2174 = @tactics.undisch_tac(@term_syntax.parse_term("∀ y : Cart[Real, M], norm(y - (z : Cart[Real, M])) < (d0 : Real) → (ef : (Cart[Real, M]) -> Cart[Real, N])(y) == (f : (Cart[Real, M]) -> Cart[Real, N])(y) || ef(y) == (g : (Cart[Real, M]) -> Cart[Real, N])(y)"))
  let t2173 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, M])"))
  let t2172 = @tactics.exists_tac(@term_syntax.parse_term("min((d0 : Real), min((d1 : Real), (d2 : Real)))"))
  let t2171 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d2 : Real)"))(@tactics.strip_assume_tac))
  let t2170 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t2166 = @term_syntax.parse_term("(e : Real)")
  let t2169 = @tactics.disch_then(fn(x2168 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2164 = @tactics.mp_tac(x2163)
      fn(x2165 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2164(x2165)
      }
    })(((x2167 : @kernel.Thm) => @bool.spec(t2166, x2167))(x2168))
  })
  let t2162 = @tactics.undisch_tac(@term_syntax.parse_term("∀ e : Real, real_of_num(0) < e → (∃ d : Real, real_of_num(0) < d && (∀ y : Cart[Real, M], norm(y - (z : Cart[Real, M])) < d → norm((g : (Cart[Real, M]) -> Cart[Real, N])(y) - g(z) - (f' : (Cart[Real, M]) -> Cart[Real, N])(y - z)) <= e * norm(y - z)))"))
  let t2161 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d1 : Real)"))(@tactics.strip_assume_tac))
  let t2160 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t2156 = @term_syntax.parse_term("(e : Real)")
  let t2159 = @tactics.disch_then(fn(x2158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2154 = @tactics.mp_tac(x2153)
      fn(x2155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2154(x2155)
      }
    })(((x2157 : @kernel.Thm) => @bool.spec(t2156, x2157))(x2158))
  })
  let t2152 = @tactics.undisch_tac(@term_syntax.parse_term("∀ e : Real, real_of_num(0) < e → (∃ d : Real, real_of_num(0) < d && (∀ y : Cart[Real, M], norm(y - (z : Cart[Real, M])) < d → norm((f : (Cart[Real, M]) -> Cart[Real, N])(y) - f(z) - (f' : (Cart[Real, M]) -> Cart[Real, N])(y - z)) <= e * norm(y - z)))"))
  let t2151 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t2150 = @simp.asm_rewrite_tac(@list.List([]))
  let t2149 = @simp.rewrite_tac(@list.List([@derivatives.has_derivative_at_alt()]))
  let t2207 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2149), @tactics.strip_tac), t2150), t2151), @tactics.disch_tac), t2152), t2159), @tactics.ants_tac), t2160), t2161), t2162), t2169), @tactics.ants_tac), t2170), t2171), t2172), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2173), @tactics.disch_tac), t2174), t2181), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2182), t2206)
  piecewise_has_derivative_local_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, M]) -> Cart[Real, N], ∀ g : (Cart[Real, M]) -> Cart[Real, N], ∀ ef : (Cart[Real, M]) -> Cart[Real, N], ∀ f' : (Cart[Real, M]) -> Cart[Real, N], ∀ z : Cart[Real, M], ∀ d0 : Real, real_of_num(0) < d0 && has_derivative(f, f', at(z)) && has_derivative(g, f', at(z)) && f(z) == g(z) && (∀ y : Cart[Real, M], norm(y - z) < d0 → ef(y) == f(y) || ef(y) == g(y)) && ef(z) == f(z) → has_derivative(ef, f', at(z))"), t2207))
}

///|
let piecewise_has_derivative_local_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PIECEWISE_HAS_DERIVATIVE_LOCAL")

///|
/// `PIECEWISE_HAS_DERIVATIVE_LOCAL`
pub fn piecewise_has_derivative_local() -> @kernel.Thm {
  piecewise_has_derivative_local_c.get()
}

///|
/// PIECEWISE_HAS_REAL_DERIVATIVE_LOCAL
fn step_79() -> Unit raise {
  let t2230 = @simp.simp_tac(@list.List([]))
  let t2229 = @simp.rewrite_tac(@list.List([@vectors.norm_real(), @equal.gsym(@vectors.drop_()), @vectors.drop_sub(), @vectors.lift_drop()]))
  let t2231 = @list.List([@tactics.then_tac(@tactics.pop_assum(fn(x2226 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2227 = @tactics.mp_tac(x2226)
    fn(x2228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2227(x2228)
    }
  }), t2229), t2230])
  let t2222 = @term_syntax.parse_term("drop((y : Cart[Real, Unit]))")
  let t2225 = @tactics.first_x_assum(fn(x2224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2220 = @tactics.mp_tac(x2219)
      fn(x2221 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2220(x2221)
      }
    })(((x2223 : @kernel.Thm) => @bool.spec(t2222, x2223))(x2224))
  })
  let t2218 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, Unit])"))
  let t2217 = @simp.asm_rewrite_tac(@list.List([@vectors.lift_eq(), @vectors.lift_drop()]))
  let t2216 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t2213 = @term_syntax.parse_term("(d0 : Real)")
  let t2214 = @term_syntax.parse_term("(y : Cart[Real, Unit]) => lift((g : (Real) -> Real)(drop(y)))")
  let t2215 = @tactics.map_every(fn(x2210 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2211 = @tactics.exists_tac(x2210)
    fn(x2212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2211(x2212)
    }
  }, @list.List([@term_syntax.parse_term("(y : Cart[Real, Unit]) => lift((f : (Real) -> Real)(drop(y)))"), t2214, t2213]))
  let t2209 = @tactics.match_mp_tac(piecewise_has_derivative_local())
  let t2208 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_frechet_derivative_at(), @trivia.o_def(), @vectors.lift_drop()]))
  let t2232 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2208), @tactics.strip_tac), t2209), t2215), t2216), t2217), t2218), @tactics.disch_tac), t2225), @tactics.ants_tac), t2231)
  piecewise_has_real_derivative_local_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ g : (Real) -> Real, ∀ ef : (Real) -> Real, ∀ f' : Real, ∀ x : Real, ∀ d0 : Real, real_of_num(0) < d0 && has_real_derivative(f, f', atreal(x)) && has_real_derivative(g, f', atreal(x)) && f(x) == g(x) && (∀ y : Real, abs(y - x) < d0 → ef(y) == f(y) || ef(y) == g(y)) && ef(x) == f(x) → has_real_derivative(ef, f', atreal(x))"), t2232))
}

///|
let piecewise_has_real_derivative_local_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PIECEWISE_HAS_REAL_DERIVATIVE_LOCAL")

///|
/// `PIECEWISE_HAS_REAL_DERIVATIVE_LOCAL`
pub fn piecewise_has_real_derivative_local() -> @kernel.Thm {
  piecewise_has_real_derivative_local_c.get()
}

///|
/// hermite_cutoff
fn step_80() -> Unit raise {
  hermite_cutoff_c.set(@pair.new_definition(@term_syntax.parse_term("(hermite_cutoff : (Real) -> Real)((t : Real)) == (if t <= real_of_num(0) { real_of_num(1) } else { if real_of_num(1) <= t { real_of_num(0) } else { real_of_num(2) * pow(t, 3) - real_of_num(3) * pow(t, 2) + real_of_num(1) } })")))
}

///|
let hermite_cutoff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hermite_cutoff")

///|
/// `hermite_cutoff`
pub fn hermite_cutoff() -> @kernel.Thm {
  hermite_cutoff_c.get()
}

///|
/// hermite_cutoff_deriv
fn step_81() -> Unit raise {
  hermite_cutoff_deriv_c.set(@pair.new_definition(@term_syntax.parse_term("(hermite_cutoff_deriv : (Real) -> Real)((t : Real)) == (if t <= real_of_num(0) { real_of_num(0) } else { if real_of_num(1) <= t { real_of_num(0) } else { real_of_num(6) * pow(t, 2) - real_of_num(6) * t } })")))
}

///|
let hermite_cutoff_deriv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hermite_cutoff_deriv")

///|
/// `hermite_cutoff_deriv`
pub fn hermite_cutoff_deriv() -> @kernel.Thm {
  hermite_cutoff_deriv_c.get()
}

///|
/// HAS_REAL_DERIVATIVE_HERMITE_INTERIOR
fn step_82() -> Unit raise {
  let t2241 = @simp.simp_tac(@list.List([]))
  let t2239 = @tactics.then_tac(@tactics.then_tac(@realanalysis.real_diff_tac, @tactics.conv_tac(@calc_num.num_reduce_conv)), @calc_rat.real_arith_tac)
  let t2238 = @simp.rewrite_tac(@list.List([hermite_cutoff()]))
  let t2240 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(s : Real)")), @tactics.disch_tac), t2238), @class.cond_cases_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @class.cond_cases_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.refl_tac])), t2239])
  let t2242 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @tactics.conj_tac), t2240), t2241])
  let t2233 = @term_syntax.parse_term("min((t : Real), real_of_num(1) - t)")
  let t2234 = @term_syntax.parse_term("(t : Real)")
  let t2235 = @term_syntax.parse_term("hermite_cutoff")
  let t2236 = @term_syntax.parse_term("real_of_num(6) * pow((t : Real), 2) - real_of_num(6) * t")
  let t2237 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(t : Real) => real_of_num(2) * pow(t, 3) - real_of_num(3) * pow(t, 2) + real_of_num(1)"), t2236, t2235, t2234, t2233]), @realanalysis.has_real_derivative_transform_atreal()))
  let t2243 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2237), @tactics.ants_tac), t2242)
  has_real_derivative_hermite_interior_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Real, real_of_num(0) < t && t < real_of_num(1) → has_real_derivative(hermite_cutoff, real_of_num(6) * pow(t, 2) - real_of_num(6) * t, atreal(t))"), t2243))
}

///|
let has_real_derivative_hermite_interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_DERIVATIVE_HERMITE_INTERIOR")

///|
/// `HAS_REAL_DERIVATIVE_HERMITE_INTERIOR`
pub fn has_real_derivative_hermite_interior() -> @kernel.Thm {
  has_real_derivative_hermite_interior_c.get()
}

///|
/// HAS_REAL_DERIVATIVE_HERMITE_LEFT
fn step_83() -> Unit raise {
  let t2252 = @simp.simp_tac(@list.List([]))
  let t2250 = @tactics.then_tac(@realanalysis.real_diff_tac, @tactics.refl_tac)
  let t2249 = @simp.rewrite_tac(@list.List([hermite_cutoff()]))
  let t2251 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(s : Real)")), @tactics.disch_tac), t2249), @class.cond_cases_tac), @list.List([@tactics.refl_tac, @calc_rat.asm_real_arith_tac])), t2250])
  let t2253 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @tactics.conj_tac), t2251), t2252])
  let t2244 = @term_syntax.parse_term("-(t : Real)")
  let t2245 = @term_syntax.parse_term("(t : Real)")
  let t2246 = @term_syntax.parse_term("hermite_cutoff")
  let t2247 = @term_syntax.parse_term("real_of_num(0)")
  let t2248 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(t : Real) => real_of_num(1)"), t2247, t2246, t2245, t2244]), @realanalysis.has_real_derivative_transform_atreal()))
  let t2254 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2248), @tactics.ants_tac), t2253)
  has_real_derivative_hermite_left_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Real, t < real_of_num(0) → has_real_derivative(hermite_cutoff, real_of_num(0), atreal(t))"), t2254))
}

///|
let has_real_derivative_hermite_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_DERIVATIVE_HERMITE_LEFT")

///|
/// `HAS_REAL_DERIVATIVE_HERMITE_LEFT`
pub fn has_real_derivative_hermite_left() -> @kernel.Thm {
  has_real_derivative_hermite_left_c.get()
}

///|
/// HAS_REAL_DERIVATIVE_HERMITE_RIGHT
fn step_84() -> Unit raise {
  let t2263 = @simp.simp_tac(@list.List([]))
  let t2261 = @tactics.then_tac(@realanalysis.real_diff_tac, @tactics.refl_tac)
  let t2260 = @simp.rewrite_tac(@list.List([hermite_cutoff()]))
  let t2262 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(s : Real)")), @tactics.disch_tac), t2260), @class.cond_cases_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @class.cond_cases_tac), @list.List([@tactics.refl_tac, @calc_rat.asm_real_arith_tac])), t2261])
  let t2264 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @tactics.conj_tac), t2262), t2263])
  let t2255 = @term_syntax.parse_term("(t : Real) - real_of_num(1)")
  let t2256 = @term_syntax.parse_term("(t : Real)")
  let t2257 = @term_syntax.parse_term("hermite_cutoff")
  let t2258 = @term_syntax.parse_term("real_of_num(0)")
  let t2259 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(t : Real) => real_of_num(0)"), t2258, t2257, t2256, t2255]), @realanalysis.has_real_derivative_transform_atreal()))
  let t2265 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2259), @tactics.ants_tac), t2264)
  has_real_derivative_hermite_right_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Real, real_of_num(1) < t → has_real_derivative(hermite_cutoff, real_of_num(0), atreal(t))"), t2265))
}

///|
let has_real_derivative_hermite_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_DERIVATIVE_HERMITE_RIGHT")

///|
/// `HAS_REAL_DERIVATIVE_HERMITE_RIGHT`
pub fn has_real_derivative_hermite_right() -> @kernel.Thm {
  has_real_derivative_hermite_right_c.get()
}

///|
/// HAS_REAL_DERIVATIVE_HERMITE_AT_0
fn step_85() -> Unit raise {
  let t2277 = @tactics.then_tac(@simp.rewrite_tac(@list.List([hermite_cutoff()])), @calc_rat.real_arith_tac)
  let t2276 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.then_tac(@tactics.disj2_tac, @tactics.refl_tac)])
  let t2275 = @list.List([@tactics.then_tac(@tactics.disj1_tac, @tactics.refl_tac), @tactics.all_tac])
  let t2274 = @simp.rewrite_tac(@list.List([hermite_cutoff()]))
  let t2273 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t2278 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)")), t2273), @tactics.disch_tac), t2274), @class.cond_cases_tac), t2275), @class.cond_cases_tac), t2276)
  let t2279 = @tactics.then_tac(@tactics.then_tac(@realanalysis.real_diff_tac, @tactics.conv_tac(@calc_num.num_reduce_conv)), @calc_rat.real_arith_tac)
  let t2280 = @list.List([@calc_rat.real_arith_tac, @tactics.then_tac(@realanalysis.real_diff_tac, @tactics.refl_tac), t2279, @calc_rat.real_arith_tac, t2278, t2277])
  let t2272 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2269 = @term_syntax.parse_term("real_of_num(1)")
  let t2270 = @term_syntax.parse_term("(t : Real) => real_of_num(2) * pow(t, 3) - real_of_num(3) * pow(t, 2) + real_of_num(1)")
  let t2271 = @tactics.map_every(fn(x2266 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2267 = @tactics.exists_tac(x2266)
    fn(x2268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2267(x2268)
    }
  }, @list.List([@term_syntax.parse_term("(t : Real) => real_of_num(1)"), t2270, t2269]))
  let t2281 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(piecewise_has_real_derivative_local()), t2271), t2272), t2280)
  has_real_derivative_hermite_at_0_c.set(@tactics.prove(@term_syntax.parse_term("has_real_derivative(hermite_cutoff, real_of_num(0), atreal(real_of_num(0)))"), t2281))
}

///|
let has_real_derivative_hermite_at_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_DERIVATIVE_HERMITE_AT_0")

///|
/// `HAS_REAL_DERIVATIVE_HERMITE_AT_0`
pub fn has_real_derivative_hermite_at_0() -> @kernel.Thm {
  has_real_derivative_hermite_at_0_c.get()
}

///|
/// HAS_REAL_DERIVATIVE_HERMITE_AT_1
fn step_86() -> Unit raise {
  let t2292 = @tactics.then_tac(@simp.rewrite_tac(@list.List([hermite_cutoff()])), @calc_rat.real_arith_tac)
  let t2291 = @list.List([@tactics.then_tac(@tactics.disj2_tac, @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2290 = @list.List([@tactics.then_tac(@tactics.disj1_tac, @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2289 = @simp.rewrite_tac(@list.List([hermite_cutoff()]))
  let t2293 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t : Real)")), @tactics.disch_tac), t2289), @class.cond_cases_tac), t2290), @class.cond_cases_tac), t2291), @tactics.disj1_tac), @tactics.refl_tac)
  let t2294 = @tactics.then_tac(@realanalysis.real_diff_tac, @tactics.refl_tac)
  let t2295 = @list.List([@calc_rat.real_arith_tac, @tactics.then_tac(@tactics.then_tac(@realanalysis.real_diff_tac, @tactics.conv_tac(@calc_num.num_reduce_conv)), @calc_rat.real_arith_tac), t2294, @calc_rat.real_arith_tac, t2293, t2292])
  let t2288 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2285 = @term_syntax.parse_term("real_of_num(1)")
  let t2286 = @term_syntax.parse_term("(t : Real) => real_of_num(0)")
  let t2287 = @tactics.map_every(fn(x2282 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2283 = @tactics.exists_tac(x2282)
    fn(x2284 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2283(x2284)
    }
  }, @list.List([@term_syntax.parse_term("(t : Real) => real_of_num(2) * pow(t, 3) - real_of_num(3) * pow(t, 2) + real_of_num(1)"), t2286, t2285]))
  let t2296 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(piecewise_has_real_derivative_local()), t2287), t2288), t2295)
  has_real_derivative_hermite_at_1_c.set(@tactics.prove(@term_syntax.parse_term("has_real_derivative(hermite_cutoff, real_of_num(0), atreal(real_of_num(1)))"), t2296))
}

///|
let has_real_derivative_hermite_at_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_DERIVATIVE_HERMITE_AT_1")

///|
/// `HAS_REAL_DERIVATIVE_HERMITE_AT_1`
pub fn has_real_derivative_hermite_at_1() -> @kernel.Thm {
  has_real_derivative_hermite_at_1_c.get()
}

///|
/// HAS_REAL_DERIVATIVE_HERMITE_EXPLICIT
fn step_87() -> Unit raise {
  let t2301 = @tactics.then_tac(@tactics.match_mp_tac(has_real_derivative_hermite_interior()), @calc_rat.asm_real_arith_tac)
  let t2299 = @tactics.then_tac(@tactics.match_mp_tac(has_real_derivative_hermite_right()), @calc_rat.asm_real_arith_tac)
  let t2300 = @list.List([@simp.asm_rewrite_tac(@list.List([has_real_derivative_hermite_at_1()])), t2299])
  let t2302 = @tactics.thenl(@class.cond_cases_tac, @list.List([@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(t : Real) == real_of_num(1)")), t2300), t2301]))
  let t2297 = @tactics.then_tac(@tactics.match_mp_tac(has_real_derivative_hermite_left()), @calc_rat.asm_real_arith_tac)
  let t2298 = @list.List([@simp.asm_rewrite_tac(@list.List([has_real_derivative_hermite_at_0()])), t2297])
  let t2303 = @list.List([@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(t : Real) == real_of_num(0)")), t2298), t2302])
  let t2304 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([hermite_cutoff_deriv()]))), @class.cond_cases_tac), t2303)
  has_real_derivative_hermite_explicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Real, has_real_derivative(hermite_cutoff, hermite_cutoff_deriv(t), atreal(t))"), t2304))
}

///|
let has_real_derivative_hermite_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_REAL_DERIVATIVE_HERMITE_EXPLICIT")

///|
/// `HAS_REAL_DERIVATIVE_HERMITE_EXPLICIT`
pub fn has_real_derivative_hermite_explicit() -> @kernel.Thm {
  has_real_derivative_hermite_explicit_c.get()
}

///|
/// POLY_CONTINUOUS_REAL1
fn step_88() -> Unit raise {
  let t2314 = @simp.rewrite_tac(@list.List([@topology.continuous_on_id()]))
  let t2313 = @simp.rewrite_tac(@list.List([@topology.continuous_on_id()]))
  let t2315 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_lift_dot2()), t2313), t2314])
  let t2312 = @tactics.match_mp_tac(@topology.continuous_on_cmul())
  let t2316 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_sub()), @tactics.conj_tac), t2312), t2315)
  let t2311 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_1(), @vectors.forall_1(), @vectors.vector_sub_component(), @vectors.vector_mul_component(), @vectors.lift(), @cart.lambda_beta(), @arith.le_refl(), @vectors.dot_1(), @vectors.drop_(), @realarith.real_pow_2()]))
  let t2317 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), @tactics.gen_tac), t2311), @calc_rat.real_arith_tac), t2316])
  let t2310 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, Unit]) => lift(real_of_num(6) * pow(drop(x), 2) - real_of_num(6) * drop(x))) == ((x : Cart[Real, Unit]) => op_pct(real_of_num(6), lift(dot(x, x))) - op_pct(real_of_num(6), x))"), fn(x2307 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2308 = @tactics.subst1_tac(x2307)
    fn(x2309 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2308(x2309)
    }
  })
  let t2306 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t2305 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, Unit]) -> Bool)"))
  let t2318 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t2305), t2306), t2310), t2317)
  poly_continuous_real1_c.set(@tactics.prove(@term_syntax.parse_term("continuous_on((x : Cart[Real, Unit]) => lift(real_of_num(6) * pow(drop(x), 2) - real_of_num(6) * drop(x)), (s : (Cart[Real, Unit]) -> Bool))"), t2318))
}

///|
let poly_continuous_real1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_CONTINUOUS_REAL1")

///|
/// `POLY_CONTINUOUS_REAL1`
pub fn poly_continuous_real1() -> @kernel.Thm {
  poly_continuous_real1_c.get()
}

///|
/// HERMITE_CUTOFF_DERIV_CONTINUOUS
fn step_89() -> Unit raise {
  let t2346 = @simp.rewrite_tac(@list.List([@vectors.lift_num()]))
  let t2345 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2347 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([])), t2345), t2346)
  let t2348 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @vectors.lift_drop(), @topology.continuous_on_id()]))
  let t2340 = @simp.rewrite_tac(@list.List([@vectors.lift_num()]))
  let t2339 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2341 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([])), t2339), t2340)
  let t2338 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), @trivia.o_def(), @vectors.lift_drop(), @topology.continuous_on_id()]))
  let t2337 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, Unit]) -> Bool)"))
  let t2342 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t2337), t2338)
  let t2343 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const()]))
  let t2344 = @list.List([@simp.rewrite_tac(@list.List([poly_continuous_real1()])), t2343, t2342, t2341])
  let t2336 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2349 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_cases_le()), t2336), t2344)
  let t2350 = @list.List([@simp.rewrite_tac(@list.List([@topology.continuous_on_const()])), t2349, t2348, t2347])
  let t2335 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2334 = @tactics.match_mp_tac(@topology.continuous_on_cases_le())
  let t2331 = @tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @class.cond_cases_tac), @list.List([@tactics.refl_tac, @calc_rat.asm_real_arith_tac]))
  let t2329 = @simp.rewrite_tac(@list.List([@vectors.lift_num()]))
  let t2328 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2330 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("drop((x : Cart[Real, Unit])) == real_of_num(1)"), fn(x2325 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2326 = @tactics.subst1_tac(x2325)
    fn(x2327 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2326(x2327)
    }
  }), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2328), t2329), @tactics.refl_tac])
  let t2332 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.lift_num()])), @class.cond_cases_tac), t2330), t2331])
  let t2324 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(1) <= drop((x : Cart[Real, Unit]))"))
  let t2323 = @simp.rewrite_tac(@list.List([@vectors.lift_num()]))
  let t2322 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t2333 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), hermite_cutoff_deriv()])), t2322), @class.cond_cases_tac), t2323), t2324), t2332), @tactics.all_tac])
  let t2351 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("o(lift, o(hermite_cutoff_deriv, drop)) == ((x : Cart[Real, Unit]) => if drop(x) <= real_of_num(0) { vec(0) } else { if drop(x) <= real_of_num(1) { lift(real_of_num(6) * pow(drop(x), 2) - real_of_num(6) * drop(x)) } else { vec(0) } })"), fn(x2319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2320 = @tactics.subst1_tac(x2319)
    fn(x2321 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2320(x2321)
    }
  }), t2333), t2334), t2335), t2350)
  hermite_cutoff_deriv_continuous_c.set(@tactics.prove(@term_syntax.parse_term("continuous_on(o(lift, o(hermite_cutoff_deriv, drop)), UNIV)"), t2351))
}

///|
let hermite_cutoff_deriv_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_CUTOFF_DERIV_CONTINUOUS")

///|
/// `HERMITE_CUTOFF_DERIV_CONTINUOUS`
pub fn hermite_cutoff_deriv_continuous() -> @kernel.Thm {
  hermite_cutoff_deriv_continuous_c.get()
}

///|
/// HERMITE_CUTOFF_DIFFERENTIABLE
fn step_90() -> Unit raise {
  let t2354 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_frechet_derivative_at(), @trivia.o_def(), @vectors.lift_drop()]))
  let t2353 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("drop((x : Cart[Real, Unit]))"), has_real_derivative_hermite_explicit()))
  let t2352 = @tactics.exists_tac(@term_syntax.parse_term("(v : Cart[Real, Unit]) => op_pct(hermite_cutoff_deriv(drop((x : Cart[Real, Unit]))), v)"))
  let t2355 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@derivatives.differentiable()]))), t2352), t2353), t2354)
  hermite_cutoff_differentiable_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Unit], differentiable(o(lift, o(hermite_cutoff, drop)), at(x))"), t2355))
}

///|
let hermite_cutoff_differentiable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_CUTOFF_DIFFERENTIABLE")

///|
/// `HERMITE_CUTOFF_DIFFERENTIABLE`
pub fn hermite_cutoff_differentiable() -> @kernel.Thm {
  hermite_cutoff_differentiable_c.get()
}

///|
/// HERMITE_CUTOFF_DIFFERENTIABLE_ON
fn step_91() -> Unit raise {
  let t2358 = @simp.rewrite_tac(@list.List([hermite_cutoff_differentiable()]))
  let t2357 = @tactics.match_mp_tac(@derivatives.differentiable_at_within())
  let t2356 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2359 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@derivatives.differentiable_on()])), t2356), t2357), t2358)
  hermite_cutoff_differentiable_on_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, Unit]) -> Bool, differentiable_on(o(lift, o(hermite_cutoff, drop)), s)"), t2359))
}

///|
let hermite_cutoff_differentiable_on_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_CUTOFF_DIFFERENTIABLE_ON")

///|
/// `HERMITE_CUTOFF_DIFFERENTIABLE_ON`
pub fn hermite_cutoff_differentiable_on() -> @kernel.Thm {
  hermite_cutoff_differentiable_on_c.get()
}

///|
/// HERMITE_CUTOFF_CONTINUOUS
fn step_92() -> Unit raise {
  let t2360 = @simp.rewrite_tac(@list.List([hermite_cutoff_differentiable_on()]))
  let t2361 = @tactics.then_tac(@tactics.match_mp_tac(@derivatives.differentiable_imp_continuous_on()), t2360)
  hermite_cutoff_continuous_c.set(@tactics.prove(@term_syntax.parse_term("continuous_on(o(lift, o(hermite_cutoff, drop)), UNIV)"), t2361))
}

///|
let hermite_cutoff_continuous_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_CUTOFF_CONTINUOUS")

///|
/// `HERMITE_CUTOFF_CONTINUOUS`
pub fn hermite_cutoff_continuous() -> @kernel.Thm {
  hermite_cutoff_continuous_c.get()
}

///|
/// HERMITE_CUTOFF_CHI_HAS_DERIVATIVE
fn step_93() -> Unit raise {
  let t2396 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_frechet_derivative_at(), @trivia.o_def(), @vectors.lift_drop()]))
  let t2397 = @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(pow(norm((z : Cart[Real, 2])), 2) - pow((R : Real), 2)) / (c : Real)"), has_real_derivative_hermite_explicit())), t2396)
  let t2393 = @simp.rewrite_tac(@list.List([@derivatives.has_derivative_sqnorm_at()]))
  let t2392 = @tactics.match_mp_tac(@derivatives.has_derivative_cmul())
  let t2391 = @simp.rewrite_tac(@list.List([@derivatives.has_derivative_const()]))
  let t2394 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_derivative_add()), t2391), t2392), t2393)
  let t2390 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_1(), @vectors.forall_1(), @vectors.vector_mul_component(), @vectors.vector_add_component(), @vectors.vec_component(), @vectors.lift(), @cart.lambda_beta(), @arith.le_refl(), @realax.real_div(), @realax.real_mul_assoc()]))
  let t2395 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), @tactics.gen_tac), t2390), @calc_rat.real_arith_tac), t2394])
  let t2389 = @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, 2]) => lift(real_of_num(2) * dot((z : Cart[Real, 2]), h) / (c : Real))) == ((h : Cart[Real, 2]) => op_pct(inv(c), ((h : Cart[Real, 2]) => op_pct(real_of_num(2), lift(dot(z, h))))(h)) + ((h : Cart[Real, 2]) => vec(0))(h))"), fn(x2386 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2387 = @tactics.subst1_tac(x2386)
    fn(x2388 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2387(x2388)
    }
  })
  let t2384 = @tactics.conv_tac(@calc_rat.real_field)
  let t2383 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (c : Real)"))
  let t2382 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_1(), @vectors.forall_1(), @vectors.vector_mul_component(), @vectors.vector_add_component(), @vectors.lift(), @cart.lambda_beta(), @arith.le_refl()]))
  let t2385 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), @tactics.gen_tac), t2382), t2383), t2384), @tactics.all_tac])
  let t2398 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((z' : Cart[Real, 2]) => lift((pow(norm(z'), 2) - pow((R : Real), 2)) / (c : Real))) == ((z' : Cart[Real, 2]) => op_pct(inv(c), lift(pow(norm(z'), 2))) + lift(-(pow(R, 2) / c)))"), fn(x2379 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2380 = @tactics.subst1_tac(x2379)
    fn(x2381 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2380(x2381)
    }
  }), t2385), t2389), t2395), t2397])
  let t2378 = @tactics.match_mp_tac(@derivatives.diff_chain_at())
  let t2377 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_def()])), @tactics.all_tac])
  let t2376 = @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, 2]) => op_pct(hermite_cutoff_deriv((pow(norm((z : Cart[Real, 2])), 2) - pow((R : Real), 2)) / (c : Real)), lift(real_of_num(2) * dot(z, h) / c))) == o((v : Cart[Real, Unit]) => op_pct(hermite_cutoff_deriv((pow(norm(z), 2) - pow(R, 2)) / c), v), (h : Cart[Real, 2]) => lift(real_of_num(2) * dot(z, h) / c))"), fn(x2373 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2374 = @tactics.subst1_tac(x2373)
    fn(x2375 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2374(x2375)
    }
  })
  let t2371 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_1(), @vectors.forall_1(), @vectors.vector_mul_component(), @vectors.lift(), @cart.lambda_beta(), @arith.le_refl()]))
  let t2372 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), @tactics.gen_tac), t2371), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2370 = @tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm((z : Cart[Real, 2])), 2) - pow((R : Real), 2)) / (c : Real)) * (real_of_num(2) * dot(z, h) / c))) == ((h : Cart[Real, 2]) => op_pct(hermite_cutoff_deriv((pow(norm(z), 2) - pow(R, 2)) / c), lift(real_of_num(2) * dot(z, h) / c)))"), fn(x2367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2368 = @tactics.subst1_tac(x2367)
    fn(x2369 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2368(x2369)
    }
  })
  let t2366 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_def(), @vectors.lift_drop()])), @tactics.all_tac])
  let t2365 = @tactics.subgoal_then(@term_syntax.parse_term("((z' : Cart[Real, 2]) => lift(hermite_cutoff((pow(norm(z'), 2) - pow((R : Real), 2)) / (c : Real)))) == o(o(lift, o(hermite_cutoff, drop)), (z' : Cart[Real, 2]) => lift((pow(norm(z'), 2) - pow(R, 2)) / c))"), fn(x2362 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2363 = @tactics.subst1_tac(x2362)
    fn(x2364 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2363(x2364)
    }
  })
  let t2399 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2365), t2366), t2370), t2372), t2376), t2377), t2378), @tactics.conj_tac), t2398)
  hermite_cutoff_chi_has_derivative_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : Real, ∀ c : Real, ∀ z : Cart[Real, 2], real_of_num(0) < c → has_derivative((z' : Cart[Real, 2]) => lift(hermite_cutoff((pow(norm(z'), 2) - pow(R, 2)) / c)), (h : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z), 2) - pow(R, 2)) / c) * (real_of_num(2) * dot(z, h) / c)), at(z))"), t2399))
}

///|
let hermite_cutoff_chi_has_derivative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_CUTOFF_CHI_HAS_DERIVATIVE")

///|
/// `HERMITE_CUTOFF_CHI_HAS_DERIVATIVE`
pub fn hermite_cutoff_chi_has_derivative() -> @kernel.Thm {
  hermite_cutoff_chi_has_derivative_c.get()
}

///|
/// HERMITE_CUTOFF_LE_0
fn step_94() -> Unit raise {
  let t2401 = @simp.asm_rewrite_tac(@list.List([]))
  let t2400 = @simp.rewrite_tac(@list.List([hermite_cutoff()]))
  let t2402 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t2400), t2401)
  hermite_cutoff_le_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Real, t <= real_of_num(0) → hermite_cutoff(t) == real_of_num(1)"), t2402))
}

///|
let hermite_cutoff_le_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_CUTOFF_LE_0")

///|
/// `HERMITE_CUTOFF_LE_0`
pub fn hermite_cutoff_le_0() -> @kernel.Thm {
  hermite_cutoff_le_0_c.get()
}

///|
/// HERMITE_CUTOFF_GE_1
fn step_95() -> Unit raise {
  let t2404 = @list.List([@calc_rat.asm_real_arith_tac, @simp.asm_rewrite_tac(@list.List([]))])
  let t2403 = @simp.rewrite_tac(@list.List([hermite_cutoff()]))
  let t2405 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t2403), @class.cond_cases_tac), t2404)
  hermite_cutoff_ge_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Real, real_of_num(1) <= t → hermite_cutoff(t) == real_of_num(0)"), t2405))
}

///|
let hermite_cutoff_ge_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_CUTOFF_GE_1")

///|
/// `HERMITE_CUTOFF_GE_1`
pub fn hermite_cutoff_ge_1() -> @kernel.Thm {
  hermite_cutoff_ge_1_c.get()
}

///|
/// HERMITE_CUTOFF_NONNEG
fn step_96() -> Unit raise {
  let t2417 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_le()), @calc_rat.asm_real_arith_tac), @calc_rat.asm_real_arith_tac])
  let t2416 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2415 = @list.List([@tactics.conv_tac(@calc_rat.real_ring), @tactics.all_tac])
  let t2414 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(2) * pow((t : Real), 3) - real_of_num(3) * pow(t, 2) + real_of_num(1) == pow(real_of_num(1) - t, 2) * (real_of_num(1) + real_of_num(2) * t)"), fn(x2411 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2412 = @tactics.subst1_tac(x2411)
    fn(x2413 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2412(x2413)
    }
  })
  let t2410 = @simp.asm_rewrite_tac(@list.List([]))
  let t2409 = @simp.rewrite_tac(@list.List([hermite_cutoff()]))
  let t2408 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([hermite_cutoff_ge_1()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2407 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(1) <= (t : Real)"))
  let t2406 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([hermite_cutoff_le_0()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2418 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @class.asm_cases_tac(@term_syntax.parse_term("(t : Real) <= real_of_num(0)"))), t2406), t2407), t2408), t2409), t2410), t2414), t2415), t2416), @tactics.conj_tac), t2417)
  hermite_cutoff_nonneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Real, real_of_num(0) <= hermite_cutoff(t)"), t2418))
}

///|
let hermite_cutoff_nonneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_CUTOFF_NONNEG")

///|
/// `HERMITE_CUTOFF_NONNEG`
pub fn hermite_cutoff_nonneg() -> @kernel.Thm {
  hermite_cutoff_nonneg_c.get()
}

///|
/// HERMITE_CUTOFF_SHIFTED_HAS_DERIVATIVE
fn step_97() -> Unit raise {
  let t2434 = @simp.asm_rewrite_tac(@list.List([]))
  let t2432 = @term_syntax.parse_term("(z : Cart[Real, 2]) - (a : Cart[Real, 2])")
  let t2433 = @term_syntax.parse_term("(c : Real)")
  let t2435 = @tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(R : Real)"), t2433, t2432]), hermite_cutoff_chi_has_derivative())), t2434)
  let t2431 = @simp.rewrite_tac(@list.List([@derivatives.has_derivative_id(), @derivatives.has_derivative_const()]))
  let t2430 = @tactics.match_mp_tac(@derivatives.has_derivative_sub())
  let t2429 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @vectors.vector_sub_rzero()])), @tactics.all_tac])
  let t2436 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((h : Cart[Real, 2]) => h) == ((h : Cart[Real, 2]) => h - vec(0))"), fn(x2426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2427 = @tactics.subst1_tac(x2426)
    fn(x2428 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2427(x2428)
    }
  }), t2429), t2430), t2431), t2435])
  let t2425 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2424 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t2419 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t2420 = @term_syntax.parse_term("(h : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm((z : Cart[Real, 2]) - (a : Cart[Real, 2])), 2) - pow((R : Real), 2)) / (c : Real)) * (real_of_num(2) * dot(z - a, h) / c))")
  let t2421 = @term_syntax.parse_term("(h : Cart[Real, 2]) => h")
  let t2422 = @term_syntax.parse_term("(w : Cart[Real, 2]) => lift(hermite_cutoff((pow(norm(w), 2) - pow((R : Real), 2)) / (c : Real)))")
  let t2423 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(w : Cart[Real, 2]) => w - (a : Cart[Real, 2])"), t2422, t2421, t2420, t2419]), @derivatives.diff_chain_at()))
  let t2437 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2423), t2424), t2425), @tactics.conj_tac), t2436)
  hermite_cutoff_shifted_has_derivative_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ R : Real, ∀ c : Real, ∀ z : Cart[Real, 2], real_of_num(0) < c → has_derivative((w : Cart[Real, 2]) => lift(hermite_cutoff((pow(norm(w - a), 2) - pow(R, 2)) / c)), (h : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z - a), 2) - pow(R, 2)) / c) * (real_of_num(2) * dot(z - a, h) / c)), at(z))"), t2437))
}

///|
let hermite_cutoff_shifted_has_derivative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HERMITE_CUTOFF_SHIFTED_HAS_DERIVATIVE")

///|
/// `HERMITE_CUTOFF_SHIFTED_HAS_DERIVATIVE`
pub fn hermite_cutoff_shifted_has_derivative() -> @kernel.Thm {
  hermite_cutoff_shifted_has_derivative_c.get()
}

///|
/// PHI_SHIFTED_CONTINUOUS_ON
fn step_98() -> Unit raise {
  let t2448 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const()]))
  let t2447 = @simp.rewrite_tac(@list.List([@topology.continuous_on_id(), @topology.continuous_on_const()]))
  let t2446 = @tactics.match_mp_tac(@topology.continuous_on_sub())
  let t2445 = @tactics.match_mp_tac(@topology.continuous_on_lift_dot2())
  let t2449 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_cmul()), t2445), @tactics.conj_tac), t2446), t2447), t2448])
  let t2450 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_add()), @tactics.conj_tac), t2449)
  let t2444 = @tactics.conv_tac(@calc_rat.real_field)
  let t2443 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (c : Real)"))
  let t2442 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_1(), @vectors.forall_1(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @vectors.lift(), @cart.lambda_beta(), @arith.le_refl()]))
  let t2451 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @vectors.norm_pow_2()])), @tactics.gen_tac), t2442), t2443), t2444), t2450])
  let t2441 = @tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => lift((pow(norm(z - (a : Cart[Real, 2])), 2) - pow((R : Real), 2)) / (c : Real))) == ((z : Cart[Real, 2]) => op_pct(inv(c), lift(dot(z - a, z - a))) + lift(-(pow(R, 2) / c)))"), fn(x2438 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2439 = @tactics.subst1_tac(x2438)
    fn(x2440 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2439(x2440)
    }
  })
  let t2452 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2441), t2451)
  phi_shifted_continuous_on_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ c : Real, ∀ R : Real, ∀ s : (Cart[Real, 2]) -> Bool, real_of_num(0) < c → continuous_on((z : Cart[Real, 2]) => lift((pow(norm(z - a), 2) - pow(R, 2)) / c), s)"), t2452))
}

///|
let phi_shifted_continuous_on_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PHI_SHIFTED_CONTINUOUS_ON")

///|
/// `PHI_SHIFTED_CONTINUOUS_ON`
pub fn phi_shifted_continuous_on() -> @kernel.Thm {
  phi_shifted_continuous_on_c.get()
}

///|
/// HCD_SHIFTED_CONTINUOUS_ON
fn step_99() -> Unit raise {
  let t2460 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), hermite_cutoff_deriv_continuous()]))
  let t2459 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, Unit]) -> Bool)"))
  let t2461 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t2459), t2460)
  let t2462 = @list.List([@simp.asm_simp_tac(@list.List([phi_shifted_continuous_on()])), t2461])
  let t2458 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t2457 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @vectors.lift_drop()])), @tactics.all_tac])
  let t2456 = @tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z - (a : Cart[Real, 2])), 2) - pow((R : Real), 2)) / (c : Real)))) == o(o(lift, o(hermite_cutoff_deriv, drop)), (z : Cart[Real, 2]) => lift((pow(norm(z - a), 2) - pow(R, 2)) / c))"), fn(x2453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2454 = @tactics.subst1_tac(x2453)
    fn(x2455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2454(x2455)
    }
  })
  let t2463 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2456), t2457), t2458), @tactics.conj_tac), t2462)
  hcd_shifted_continuous_on_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ c : Real, ∀ R : Real, ∀ s : (Cart[Real, 2]) -> Bool, real_of_num(0) < c → continuous_on((z : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z - a), 2) - pow(R, 2)) / c)), s)"), t2463))
}

///|
let hcd_shifted_continuous_on_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HCD_SHIFTED_CONTINUOUS_ON")

///|
/// `HCD_SHIFTED_CONTINUOUS_ON`
pub fn hcd_shifted_continuous_on() -> @kernel.Thm {
  hcd_shifted_continuous_on_c.get()
}

///|
/// HC_SHIFTED_CONTINUOUS_ON
fn step_100() -> Unit raise {
  let t2471 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), hermite_cutoff_continuous()]))
  let t2470 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, Unit]) -> Bool)"))
  let t2472 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t2470), t2471)
  let t2473 = @list.List([@simp.asm_simp_tac(@list.List([phi_shifted_continuous_on()])), t2472])
  let t2469 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t2468 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @vectors.lift_drop()])), @tactics.all_tac])
  let t2467 = @tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => lift(hermite_cutoff((pow(norm(z - (a : Cart[Real, 2])), 2) - pow((R : Real), 2)) / (c : Real)))) == o(o(lift, o(hermite_cutoff, drop)), (z : Cart[Real, 2]) => lift((pow(norm(z - a), 2) - pow(R, 2)) / c))"), fn(x2464 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2465 = @tactics.subst1_tac(x2464)
    fn(x2466 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2465(x2466)
    }
  })
  let t2474 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2467), t2468), t2469), @tactics.conj_tac), t2473)
  hc_shifted_continuous_on_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ c : Real, ∀ R : Real, ∀ s : (Cart[Real, 2]) -> Bool, real_of_num(0) < c → continuous_on((z : Cart[Real, 2]) => lift(hermite_cutoff((pow(norm(z - a), 2) - pow(R, 2)) / c)), s)"), t2474))
}

///|
let hc_shifted_continuous_on_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HC_SHIFTED_CONTINUOUS_ON")

///|
/// `HC_SHIFTED_CONTINUOUS_ON`
pub fn hc_shifted_continuous_on() -> @kernel.Thm {
  hc_shifted_continuous_on_c.get()
}

///|
/// SMOOTH_EXTENSION_FROM_OPEN
fn step_101() -> Unit raise {
  let t2930 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lid()]))
  let t2929 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(hermite_cutoff_le_0()), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2928 = @tactics.subgoal_then(@term_syntax.parse_term("hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm((z : Cart[Real, 2]) - a), 2) - pow((r : Real), 2)) / (cc : Real)))) == real_of_num(1)"), fn(x2925 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2926 = @tactics.subst1_tac(x2925)
    fn(x2927 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2926(x2927)
    }
  })
  let t2923 = @simp.asm_rewrite_tac(@list.List([]))
  let t2924 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t2923), @tactics.all_tac])
  let t2922 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(1) <= sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm((z : Cart[Real, 2]) - a), 2) - pow((r : Real), 2)) / (cc : Real)))"), fn(x2919 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2920 = @tactics.assume_tac(x2919)
    fn(x2921 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2920(x2921)
    }
  })
  let t2931 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.disch_tac), t2922), t2924), t2928), t2929), t2930)
  let t2918 = @meson.asm_meson_tac(@list.List([]))
  let t2917 = @simp.rewrite_tac(@list.List([@sets.subset(), @iterate.support(), @sets.in_elim_thm(), @vectors.neutral_vector_add(), @sets.in_univ()]))
  let t2916 = @list.List([@meson.asm_meson_tac(@list.List([@topology.compact_imp_bounded()])), @tactics.all_tac])
  let t2915 = @tactics.exists_tac(@term_syntax.parse_term("(W : (Cart[Real, 2]) -> Bool)"))
  let t2932 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.bounded_subset()), t2915), @tactics.conj_tac), t2916), t2917), t2918)
  let t2912 = @meson.asm_meson_tac(@list.List([@topology.continuous_on_eq_continuous_at()]))
  let t2910 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2911 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()])), t2910), @tactics.all_tac])
  let t2913 = @tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN((w : Cart[Real, 2]), DIFF(UNIV, (W : (Cart[Real, 2]) -> Bool)))"), fn(x2907 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2908 = @tactics.assume_tac(x2907)
    fn(x2909 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2908(x2909)
    }
  }), t2911), t2912)
  let t2914 = @list.List([@meson.asm_meson_tac(@list.List([@topology.continuous_on_eq_continuous_at()])), t2913])
  let t2906 = @class.asm_cases_tac(@term_syntax.parse_term("IN((w : Cart[Real, 2]), (u : (Cart[Real, 2]) -> Bool))"))
  let t2905 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t2904 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_at(), @topology.open_univ(), @sets.in_univ()]))
  let t2901 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const()]))
  let t2898 = @simp.rewrite_tac(@list.List([]))
  let t2899 = @tactics.then_tac(@tactics.disch_then(fn(x2896 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x2896
    @simp.rewrite_tac(@list.List([@equal.gsym(th_3)]))
  }), t2898)
  let t2894 = @simp.rewrite_tac(@list.List([@derivatives.has_derivative_const()]))
  let t2893 = @meson.asm_meson_tac(@list.List([]))
  let t2892 = @tactics.conv_tac(@equal.sym_conv)
  let t2891 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t2895 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), t2891), @tactics.disch_tac), t2892), t2893), t2894])
  let t2890 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t2889 = @tactics.exists_tac(@term_syntax.parse_term("DIFF(UNIV, (W : (Cart[Real, 2]) -> Bool))"))
  let t2888 = @tactics.exists_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) => (vec : (Num) -> Cart[Real, 2])(0)"))
  let t2900 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_derivative_transform_within_open()), t2888), t2889), t2890), @tactics.conj_tac), t2895), t2899])
  let t2887 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t2884 = @term_syntax.parse_term("(z' : Cart[Real, 2])")
  let t2885 = @term_syntax.parse_term("(h' : Cart[Real, 2]) => (vec : (Num) -> Cart[Real, 2])(0)")
  let t2886 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(w : Cart[Real, 2]) => op_pct(hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(w - a), 2) - pow((r : Real), 2)) / (cc : Real)))), (f : (Cart[Real, 2]) -> Cart[Real, 2])(w))"), t2885, t2884]), @derivatives.frechet_derivative_at()))
  let t2883 = @tactics.conv_tac(@equal.sym_conv)
  let t2882 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t2902 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z' : Cart[Real, 2])")), t2882), @tactics.disch_tac), t2883), t2886), t2887), @tactics.ants_tac), t2900), t2901])
  let t2881 = @tactics.exists_tac(@term_syntax.parse_term("(z' : Cart[Real, 2]) => (vec : (Num) -> Cart[Real, 2])(0)"))
  let t2903 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_eq()), t2881), @tactics.conj_tac), t2902), @tactics.all_tac])
  let t2880 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on((z' : Cart[Real, 2]) => frechet_derivative((w : Cart[Real, 2]) => op_pct(hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(w - a), 2) - pow((r : Real), 2)) / (cc : Real)))), (f : (Cart[Real, 2]) -> Cart[Real, 2])(w)), at(z'), (h : Cart[Real, 2])), DIFF(UNIV, (W : (Cart[Real, 2]) -> Bool)))"), fn(x2877 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2878 = @tactics.assume_tac(x2877)
    fn(x2879 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2878(x2879)
    }
  })
  let t2869 = @simp.asm_rewrite_tac(@list.List([]))
  let t2868 = @tactics.match_mp_tac(@derivatives.differentiable_imp_continuous_on())
  let t2867 = @simp.rewrite_tac(@list.List([@sets.subset_refl()]))
  let t2866 = @tactics.exists_tac(@term_syntax.parse_term("(u : (Cart[Real, 2]) -> Bool)"))
  let t2870 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t2866), t2867), t2868), t2869)
  let t2865 = @simp.asm_rewrite_tac(@list.List([@sets.subset_univ()]))
  let t2864 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t2863 = @tactics.match_mp_tac(@topology.continuous_on_subset())
  let t2862 = @simp.rewrite_tac(@list.List([@vectors.lift_drop()]))
  let t2871 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_def()])), t2862), t2863), t2864), t2865), t2870])
  let t2872 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_mul()), @tactics.conj_tac), t2871)
  let t2860 = @simp.asm_rewrite_tac(@list.List([]))
  let t2857 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), hermite_cutoff_continuous()]))
  let t2856 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, Unit]) -> Bool)"))
  let t2858 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t2856), t2857)
  let t2853 = @simp.asm_simp_tac(@list.List([hc_shifted_continuous_on()]))
  let t2852 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t2851 = @simp.asm_rewrite_tac(@list.List([]))
  let t2854 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_vsum()), t2851), t2852), @tactics.disch_tac), t2853)
  let t2855 = @list.List([@simp.rewrite_tac(@list.List([@topology.continuous_on_const()])), t2854])
  let t2850 = @tactics.match_mp_tac(@topology.continuous_on_sub())
  let t2849 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @vectors.lift_sub(), @vectors.lift_sum(), @trivia.o_def()])), @tactics.all_tac])
  let t2859 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((z' : Cart[Real, 2]) => lift(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow((r : Real), 2)) / (cc : Real))))) == ((z' : Cart[Real, 2]) => lift(real_of_num(1)) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff((pow(norm(z' - a), 2) - pow(r, 2)) / cc))))"), fn(x2846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2847 = @tactics.subst1_tac(x2846)
    fn(x2848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2847(x2848)
    }
  }), t2849), t2850), @tactics.conj_tac), t2855), t2858])
  let t2845 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t2844 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @vectors.lift_drop()])), @tactics.all_tac])
  let t2843 = @tactics.subgoal_then(@term_syntax.parse_term("((z' : Cart[Real, 2]) => lift(hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow((r : Real), 2)) / (cc : Real)))))) == o(o(lift, o(hermite_cutoff, drop)), (z' : Cart[Real, 2]) => lift(real_of_num(1) - sum(A, (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow(r, 2)) / cc))))"), fn(x2840 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2841 = @tactics.subst1_tac(x2840)
    fn(x2842 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2841(x2842)
    }
  })
  let t2839 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t2838 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t2837 = @tactics.match_mp_tac(@topology.continuous_on_subset())
  let t2861 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_def()])), t2837), t2838), t2839), t2843), t2844), t2845), @tactics.conj_tac), t2859), t2860])
  let t2873 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_mul()), @tactics.conj_tac), t2861), t2872])
  let t2874 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_add()), @tactics.conj_tac), t2873)
  let t2835 = @tactics.then_tac(@tactics.disch_then(fn(x2833 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x2833
    @simp.rewrite_tac(@list.List([@equal.gsym(th_2)]))
  }), @tactics.refl_tac)
  let t2830 = @simp.asm_rewrite_tac(@list.List([]))
  let t2826 = @term_syntax.parse_term("(z' : Cart[Real, 2])")
  let t2829 = @tactics.disch_then(fn(x2828 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2823 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2824 = @tactics.mp_tac(x2823)
      fn(x2825 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2824(x2825)
      }
    })(((x2827 : @kernel.Thm) => @bool.spec(t2826, x2827))(x2828))
  })
  let t2822 = @simp.asm_simp_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at()]))
  let t2821 = @tactics.undisch_tac(@term_syntax.parse_term("differentiable_on((f : (Cart[Real, 2]) -> Cart[Real, 2]), (u : (Cart[Real, 2]) -> Bool))"))
  let t2831 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@derivatives.frechet_derivative_works())])), t2821), t2822), t2829), t2830)
  let t2820 = @simp.rewrite_tac(@list.List([]))
  let t2816 = @term_syntax.parse_term("(z' : Cart[Real, 2])")
  let t2819 = @tactics.first_x_assum(fn(x2818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2814 = @tactics.mp_tac(x2813)
      fn(x2815 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2814(x2815)
      }
    })(((x2817 : @kernel.Thm) => @bool.spec(t2816, x2817))(x2818))
  })
  let t2812 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @vectors.lift_drop()])), @tactics.all_tac])
  let t2832 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((h' : Cart[Real, 2]) => lift(drop(op_pct(hermite_cutoff_deriv(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm((z' : Cart[Real, 2]) - a), 2) - pow((r : Real), 2)) / (cc : Real)))), vec(0) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z' - a), 2) - pow(r, 2)) / cc) * (real_of_num(2) * dot(z' - a, h') / cc))))))) == ((h' : Cart[Real, 2]) => op_pct(hermite_cutoff_deriv(real_of_num(1) - sum(A, (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow(r, 2)) / cc))), vec(0) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z' - a), 2) - pow(r, 2)) / cc) * (real_of_num(2) * dot(z' - a, h') / cc)))))"), fn(x2809 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2810 = @tactics.subst1_tac(x2809)
    fn(x2811 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2810(x2811)
    }
  }), t2812), t2819), t2820), t2831])
  let t2808 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2807 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let t2803 = @term_syntax.parse_term("(z' : Cart[Real, 2])")
  let t2804 = @term_syntax.parse_term("frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at((z' : Cart[Real, 2])))")
  let t2805 = @term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])")
  let t2806 = @term_syntax.parse_term("(h' : Cart[Real, 2]) => drop(op_pct(hermite_cutoff_deriv(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm((z' : Cart[Real, 2]) - a), 2) - pow((r : Real), 2)) / (cc : Real)))), vec(0) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z' - a), 2) - pow(r, 2)) / cc) * (real_of_num(2) * dot(z' - a, h') / cc)))))")
  let t2836 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z'' : Cart[Real, 2]) => hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z'' - a), 2) - pow((r : Real), 2)) / (cc : Real))))"), t2806, t2805, t2804, t2803]), @derivatives.has_derivative_mul_at())), t2807), t2808), @tactics.conj_tac), t2832), t2835])
  let t2802 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t2799 = @term_syntax.parse_term("(z' : Cart[Real, 2])")
  let t2800 = @term_syntax.parse_term("(h' : Cart[Real, 2]) => op_pct(hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm((z' : Cart[Real, 2]) - a), 2) - pow((r : Real), 2)) / (cc : Real)))), frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at(z'), h')) + op_pct(drop(op_pct(hermite_cutoff_deriv(real_of_num(1) - sum(A, (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow(r, 2)) / cc))), vec(0) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z' - a), 2) - pow(r, 2)) / cc) * (real_of_num(2) * dot(z' - a, h') / cc))))), f(z'))")
  let t2801 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z'' : Cart[Real, 2]) => op_pct(hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z'' - a), 2) - pow((r : Real), 2)) / (cc : Real)))), (f : (Cart[Real, 2]) -> Cart[Real, 2])(z''))"), t2800, t2799]), @derivatives.frechet_derivative_at()))
  let t2798 = @tactics.conv_tac(@equal.sym_conv)
  let t2875 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z' : Cart[Real, 2])")), @tactics.disch_tac), t2798), t2801), t2802), @tactics.ants_tac), t2836), t2874])
  let t2797 = @tactics.exists_tac(@term_syntax.parse_term("(z' : Cart[Real, 2]) => op_pct(hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow((r : Real), 2)) / (cc : Real)))), frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at(z'), (h : Cart[Real, 2]))) + op_pct(drop(op_pct(hermite_cutoff_deriv(real_of_num(1) - sum(A, (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow(r, 2)) / cc))), vec(0) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z' - a), 2) - pow(r, 2)) / cc) * (real_of_num(2) * dot(z' - a, h) / cc))))), f(z'))"))
  let t2876 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_eq()), t2797), @tactics.conj_tac), t2875), @tactics.all_tac])
  let t2796 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on((z' : Cart[Real, 2]) => frechet_derivative((w : Cart[Real, 2]) => op_pct(hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(w - a), 2) - pow((r : Real), 2)) / (cc : Real)))), (f : (Cart[Real, 2]) -> Cart[Real, 2])(w)), at(z'), (h : Cart[Real, 2])), (u : (Cart[Real, 2]) -> Bool))"), fn(x2793 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2794 = @tactics.assume_tac(x2793)
    fn(x2795 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2794(x2795)
    }
  })
  let t2782 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const()]))
  let t2781 = @simp.rewrite_tac(@list.List([@topology.continuous_on_id(), @topology.continuous_on_const()]))
  let t2783 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_sub()), t2781), t2782])
  let t2780 = @tactics.match_mp_tac(@topology.continuous_on_lift_dot2())
  let t2784 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_cmul()), t2780), @tactics.conj_tac), t2783)
  let t2779 = @tactics.conv_tac(@calc_rat.real_field)
  let t2778 = @tactics.undisch_tac(@term_syntax.parse_term("real_of_num(0) < (cc : Real)"))
  let t2777 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_1(), @vectors.forall_1(), @vectors.vector_mul_component(), @vectors.lift(), @cart.lambda_beta(), @arith.le_refl()]))
  let t2785 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), @tactics.gen_tac), t2777), t2778), t2779), t2784])
  let t2786 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((z' : Cart[Real, 2]) => lift(real_of_num(2) * dot(z' - (a : Cart[Real, 2]), (h : Cart[Real, 2])) / (cc : Real))) == ((z' : Cart[Real, 2]) => op_pct(inv(cc) * real_of_num(2), lift(dot(z' - a, h))))"), fn(x2774 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2775 = @tactics.subst1_tac(x2774)
    fn(x2776 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2775(x2776)
    }
  }), t2785)
  let t2773 = @simp.asm_simp_tac(@list.List([hcd_shifted_continuous_on()]))
  let t2787 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_def()])), t2773), t2786])
  let t2772 = @tactics.match_mp_tac(@topology.continuous_on_mul())
  let t2770 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_1(), @vectors.forall_1(), @vectors.vector_mul_component(), @vectors.lift(), @cart.lambda_beta(), @arith.le_refl()]))
  let t2771 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), @tactics.gen_tac), t2770), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2769 = @tactics.subgoal_then(@term_syntax.parse_term("((z' : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z' - (a : Cart[Real, 2])), 2) - pow((r : Real), 2)) / (cc : Real)) * (real_of_num(2) * dot(z' - a, (h : Cart[Real, 2])) / cc))) == ((z' : Cart[Real, 2]) => op_pct(hermite_cutoff_deriv((pow(norm(z' - a), 2) - pow(r, 2)) / cc), lift(real_of_num(2) * dot(z' - a, h) / cc)))"), fn(x2766 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2767 = @tactics.subst1_tac(x2766)
    fn(x2768 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2767(x2768)
    }
  })
  let t2765 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t2764 = @simp.asm_rewrite_tac(@list.List([]))
  let t2788 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_vsum()), t2764), t2765), @tactics.disch_tac), t2769), t2771), t2772), @tactics.conj_tac), t2787)
  let t2789 = @list.List([@simp.rewrite_tac(@list.List([@topology.continuous_on_const()])), t2788])
  let t2790 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_sub()), @tactics.conj_tac), t2789)
  let t2761 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), hermite_cutoff_deriv_continuous()]))
  let t2760 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, Unit]) -> Bool)"))
  let t2762 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t2760), t2761)
  let t2757 = @simp.asm_simp_tac(@list.List([hc_shifted_continuous_on()]))
  let t2756 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t2755 = @simp.asm_rewrite_tac(@list.List([]))
  let t2758 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_vsum()), t2755), t2756), @tactics.disch_tac), t2757)
  let t2759 = @list.List([@simp.rewrite_tac(@list.List([@topology.continuous_on_const()])), t2758])
  let t2754 = @tactics.match_mp_tac(@topology.continuous_on_sub())
  let t2753 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @vectors.lift_sub(), @vectors.lift_sum(), @trivia.o_def()])), @tactics.all_tac])
  let t2763 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((z' : Cart[Real, 2]) => lift(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow((r : Real), 2)) / (cc : Real))))) == ((z' : Cart[Real, 2]) => lift(real_of_num(1)) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff((pow(norm(z' - a), 2) - pow(r, 2)) / cc))))"), fn(x2750 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2751 = @tactics.subst1_tac(x2750)
    fn(x2752 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2751(x2752)
    }
  }), t2753), t2754), @tactics.conj_tac), t2759), t2762])
  let t2749 = @tactics.match_mp_tac(@topology.continuous_on_compose())
  let t2748 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @vectors.lift_drop()])), @tactics.all_tac])
  let t2747 = @tactics.subgoal_then(@term_syntax.parse_term("((z' : Cart[Real, 2]) => lift(hermite_cutoff_deriv(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow((r : Real), 2)) / (cc : Real)))))) == o(o(lift, o(hermite_cutoff_deriv, drop)), (z' : Cart[Real, 2]) => lift(real_of_num(1) - sum(A, (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow(r, 2)) / cc))))"), fn(x2744 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2745 = @tactics.subst1_tac(x2744)
    fn(x2746 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2745(x2746)
    }
  })
  let t2791 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_def()])), t2747), t2748), t2749), @tactics.conj_tac), t2763), t2790])
  let t2792 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_mul()), @tactics.conj_tac), t2791), @tactics.all_tac])
  let t2743 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on((z' : Cart[Real, 2]) => op_pct(hermite_cutoff_deriv(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow((r : Real), 2)) / (cc : Real)))), vec(0) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z' - a), 2) - pow(r, 2)) / cc) * (real_of_num(2) * dot(z' - a, (h : Cart[Real, 2])) / cc)))), UNIV)"), fn(x2740 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2741 = @tactics.assume_tac(x2740)
    fn(x2742 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2741(x2742)
    }
  })
  let t2736 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_frechet_derivative_at(), @trivia.o_def(), @vectors.lift_drop()]))
  let t2737 = @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm((z' : Cart[Real, 2]) - a), 2) - pow((r : Real), 2)) / (cc : Real)))"), has_real_derivative_hermite_explicit())), t2736)
  let t2733 = @simp.asm_rewrite_tac(@list.List([]))
  let t2732 = @tactics.match_mp_tac(hermite_cutoff_shifted_has_derivative())
  let t2731 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t2730 = @simp.asm_rewrite_tac(@list.List([]))
  let t2734 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.has_derivative_vsum()), t2730), t2731), @tactics.disch_tac), t2732), t2733)
  let t2735 = @list.List([@simp.rewrite_tac(@list.List([@derivatives.has_derivative_const()])), t2734])
  let t2729 = @tactics.match_mp_tac(@derivatives.has_derivative_sub())
  let t2728 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @vectors.lift_sub(), @vectors.lift_sum(), @trivia.o_def()])), @tactics.all_tac])
  let t2738 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((w : Cart[Real, 2]) => lift(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(w - a), 2) - pow((r : Real), 2)) / (cc : Real))))) == ((w : Cart[Real, 2]) => lift(real_of_num(1)) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff((pow(norm(w - a), 2) - pow(r, 2)) / cc))))"), fn(x2725 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2726 = @tactics.subst1_tac(x2725)
    fn(x2727 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2726(x2727)
    }
  }), t2728), t2729), @tactics.conj_tac), t2735), t2737])
  let t2724 = @tactics.match_mp_tac(@derivatives.diff_chain_at())
  let t2723 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @vectors.lift_drop()])), @tactics.all_tac])
  let t2722 = @tactics.subgoal_then(@term_syntax.parse_term("((h' : Cart[Real, 2]) => op_pct(hermite_cutoff_deriv(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm((z' : Cart[Real, 2]) - a), 2) - pow((r : Real), 2)) / (cc : Real)))), vec(0) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z' - a), 2) - pow(r, 2)) / cc) * (real_of_num(2) * dot(z' - a, h') / cc))))) == o((v : Cart[Real, Unit]) => op_pct(hermite_cutoff_deriv(drop(lift(real_of_num(1) - sum(A, (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow(r, 2)) / cc))))), v), (h' : Cart[Real, 2]) => vec(0) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z' - a), 2) - pow(r, 2)) / cc) * (real_of_num(2) * dot(z' - a, h') / cc))))"), fn(x2719 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2720 = @tactics.subst1_tac(x2719)
    fn(x2721 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2720(x2721)
    }
  })
  let t2718 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @vectors.lift_drop()])), @tactics.all_tac])
  let t2717 = @tactics.subgoal_then(@term_syntax.parse_term("((w : Cart[Real, 2]) => lift(hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(w - a), 2) - pow((r : Real), 2)) / (cc : Real)))))) == o(o(lift, o(hermite_cutoff, drop)), (w : Cart[Real, 2]) => lift(real_of_num(1) - sum(A, (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(w - a), 2) - pow(r, 2)) / cc))))"), fn(x2714 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2715 = @tactics.subst1_tac(x2714)
    fn(x2716 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2715(x2716)
    }
  })
  let t2739 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z' : Cart[Real, 2])")), t2717), t2718), t2722), t2723), t2724), @tactics.conj_tac), t2738), @tactics.all_tac])
  let t2933 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.subgoal_then(@term_syntax.parse_term("∀ z' : Cart[Real, 2], has_derivative((w : Cart[Real, 2]) => lift(hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(w - a), 2) - pow((r : Real), 2)) / (cc : Real))))), (h' : Cart[Real, 2]) => op_pct(hermite_cutoff_deriv(real_of_num(1) - sum(A, (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z' - a), 2) - pow(r, 2)) / cc))), vec(0) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm(z' - a), 2) - pow(r, 2)) / cc) * (real_of_num(2) * dot(z' - a, h') / cc)))), at(z'))"), fn(x2711 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2712 = @tactics.assume_tac(x2711)
    fn(x2713 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2712(x2713)
    }
  })), t2739), t2743), t2792), t2796), t2876), t2880), t2903), t2904), t2905), t2906), t2914)
  let t2707 = @simp.rewrite_tac(@list.List([@derivatives.has_derivative_const()]))
  let t2706 = @meson.asm_meson_tac(@list.List([]))
  let t2705 = @tactics.conv_tac(@equal.sym_conv)
  let t2704 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t2708 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])")), t2704), @tactics.disch_tac), t2705), t2706), t2707])
  let t2703 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t2702 = @tactics.exists_tac(@term_syntax.parse_term("DIFF(UNIV, (W : (Cart[Real, 2]) -> Bool))"))
  let t2701 = @tactics.exists_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) => (vec : (Num) -> Cart[Real, 2])(0)"))
  let t2700 = @tactics.match_mp_tac(@derivatives.has_derivative_transform_within_open())
  let t2699 = @tactics.exists_tac(@term_syntax.parse_term("(h : Cart[Real, 2]) => (vec : (Num) -> Cart[Real, 2])(0)"))
  let t2698 = @simp.rewrite_tac(@list.List([@derivatives.differentiable()]))
  let t2697 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2709 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!IN((z : Cart[Real, 2]), (W : (Cart[Real, 2]) -> Bool))"), fn(x2694 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2695 = @tactics.assume_tac(x2694)
    fn(x2696 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2695(x2696)
    }
  }), t2697), t2698), t2699), t2700), t2701), t2702), t2703), @tactics.conj_tac), t2708)
  let t2691 = @simp.asm_rewrite_tac(@list.List([]))
  let t2687 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t2690 = @tactics.disch_then(fn(x2689 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2684 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2685 = @tactics.mp_tac(x2684)
      fn(x2686 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2685(x2686)
      }
    })(((x2688 : @kernel.Thm) => @bool.spec(t2687, x2688))(x2689))
  })
  let t2683 = @simp.asm_simp_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at()]))
  let t2692 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("differentiable_on((f : (Cart[Real, 2]) -> Cart[Real, 2]), (u : (Cart[Real, 2]) -> Bool))")), t2683), t2690), t2691)
  let t2681 = @simp.rewrite_tac(@list.List([hermite_cutoff_differentiable()]))
  let t2678 = @simp.asm_rewrite_tac(@list.List([]))
  let t2677 = @tactics.match_mp_tac(hermite_cutoff_shifted_has_derivative())
  let t2676 = @tactics.exists_tac(@term_syntax.parse_term("(h : Cart[Real, 2]) => lift(hermite_cutoff_deriv((pow(norm((z : Cart[Real, 2]) - (a : Cart[Real, 2])), 2) - pow((r : Real), 2)) / (cc : Real)) * (real_of_num(2) * dot(z - a, h) / cc))"))
  let t2675 = @simp.rewrite_tac(@list.List([@derivatives.differentiable()]))
  let t2674 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t2673 = @simp.asm_rewrite_tac(@list.List([]))
  let t2679 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.differentiable_vsum()), t2673), t2674), @tactics.disch_tac), t2675), t2676), t2677), t2678)
  let t2680 = @list.List([@simp.rewrite_tac(@list.List([@derivatives.differentiable_const()])), t2679])
  let t2672 = @tactics.match_mp_tac(@derivatives.differentiable_sub())
  let t2671 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @vectors.lift_sub(), @vectors.lift_sum(), @trivia.o_def()])), @tactics.all_tac])
  let t2682 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((w : Cart[Real, 2]) => lift(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(w - a), 2) - pow((r : Real), 2)) / (cc : Real))))) == ((w : Cart[Real, 2]) => lift(real_of_num(1)) - vsum(A, (a : Cart[Real, 2]) => lift(hermite_cutoff((pow(norm(w - a), 2) - pow(r, 2)) / cc))))"), fn(x2668 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2669 = @tactics.subst1_tac(x2668)
    fn(x2670 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2669(x2670)
    }
  }), t2671), t2672), @tactics.conj_tac), t2680), t2681])
  let t2667 = @tactics.match_mp_tac(@derivatives.differentiable_chain_at())
  let t2666 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @vectors.lift_drop()])), @tactics.all_tac])
  let t2693 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("o(lift, (w : Cart[Real, 2]) => hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(w - a), 2) - pow((r : Real), 2)) / (cc : Real))))) == o(o(lift, o(hermite_cutoff, drop)), (w : Cart[Real, 2]) => lift(real_of_num(1) - sum(A, (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(w - a), 2) - pow(r, 2)) / cc))))"), fn(x2663 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2664 = @tactics.subst1_tac(x2663)
    fn(x2665 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2664(x2665)
    }
  }), t2666), t2667), @tactics.conj_tac), t2682), t2692])
  let t2710 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.differentiable_mul_at()), @tactics.conj_tac), t2693), t2709])
  let t2662 = @class.asm_cases_tac(@term_syntax.parse_term("IN((z : Cart[Real, 2]), (u : (Cart[Real, 2]) -> Bool))"))
  let t2661 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2934 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@derivatives.differentiable_on_eq_differentiable_at(), @topology.open_univ(), @sets.in_univ()])), t2661), t2662), t2710), t2933, t2932, t2931])
  let t2660 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2659 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t2658 = @tactics.exists_tac(@term_syntax.parse_term("(w : Cart[Real, 2]) => op_pct(hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(w - a), 2) - pow((r : Real), 2)) / (cc : Real)))), (f : (Cart[Real, 2]) -> Cart[Real, 2])(w))"))
  let t2656 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2655 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff()]))
  let t2654 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t2653 = @tactics.match_mp_tac(@iterate.sum_subset_simple())
  let t2651 = @tactics.first_x_assum(fn(x2649 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let bz_1 = x2649
    @tactics.match_mp_tac(bz_1)
  })
  let t2648 = @tactics.subgoal_then(@term_syntax.parse_term("hermite_cutoff((pow(norm((z : Cart[Real, 2]) - (a0 : Cart[Real, 2])), 2) - pow((r : Real), 2)) / (cc : Real)) == real_of_num(1)"), fn(x2646 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2646
    @simp.rewrite_tac(@list.List([th_1, @realax.real_le_refl()]))
  })
  let t2652 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.sum_sing()])), @tactics.beta_tac), t2648), t2651), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2645 = @tactics.exists_tac(@term_syntax.parse_term("sum({(a0 : Cart[Real, 2])}, (a : Cart[Real, 2]) => hermite_cutoff((pow(norm((z : Cart[Real, 2]) - a), 2) - pow((r : Real), 2)) / (cc : Real)))"))
  let t2644 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t2643 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a0 : Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t2641 = @meson.meson_tac(@list.List([@vectors.norm_sub()]))
  let t2640 = @simp.rewrite_tac(@list.List([@topology.in_ball(), @vectors.dist()]))
  let t2639 = @simp.rewrite_tac(@list.List([@sets.unions_image(), @sets.in_elim_thm()]))
  let t2638 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset()])), @tactics.all_tac])
  let t2637 = @tactics.subgoal_then(@term_syntax.parse_term("IN((z : Cart[Real, 2]), UNIONS(IMAGE((x : Cart[Real, 2]) => ball((x, (e : Real) / real_of_num(3))), (A : (Cart[Real, 2]) -> Bool))))"), fn(x2634 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2635 = @tactics.mp_tac(x2634)
    fn(x2636 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2635(x2636)
    }
  })
  let t2642 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.expand_tac("r"), t2637), t2638), t2639), t2640), t2641), @tactics.all_tac])
  let t2633 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : Cart[Real, 2], IN(a, (A : (Cart[Real, 2]) -> Bool)) && norm((z : Cart[Real, 2]) - a) < (r : Real)"), fn(x2630 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2631 = @tactics.mp_tac(x2630)
    fn(x2632 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2631(x2632)
    }
  })
  let t2657 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.disch_tac), t2633), t2642), t2643), t2644), t2645), @tactics.conj_tac), t2652), t2653), t2654), t2655), t2656), @tactics.all_tac])
  let t2629 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], IN(z, (K : (Cart[Real, 2]) -> Bool)) → real_of_num(1) <= sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z - a), 2) - pow((r : Real), 2)) / (cc : Real)))"), fn(x2626 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2627 = @tactics.assume_tac(x2626)
    fn(x2628 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2627(x2628)
    }
  })
  let t2624 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lzero()]))
  let t2623 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(hermite_cutoff_ge_1()), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2622 = @tactics.subgoal_then(@term_syntax.parse_term("hermite_cutoff(real_of_num(1)) == real_of_num(0)"), fn(x2619 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2620 = @tactics.subst1_tac(x2619)
    fn(x2621 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2620(x2621)
    }
  })
  let t2616 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_cball(), @vectors.dist(), @vectors.norm_sub(), @real.real_not_le()])), @calc_rat.real_arith_tac)
  let t2614 = @meson.asm_meson_tac(@list.List([@sets.subset()]))
  let t2613 = @simp.asm_rewrite_tac(@list.List([]))
  let t2615 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t2613), t2614])
  let t2617 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("SUBSET(cball(((a : Cart[Real, 2]), real_of_num(2) * (r : Real))), (W : (Cart[Real, 2]) -> Bool))"), fn(x2610 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2611 = @tactics.mp_tac(x2610)
    fn(x2612 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2611(x2612)
    }
  }), t2615), t2616])
  let t2609 = @tactics.subgoal_then(@term_syntax.parse_term("!IN((z : Cart[Real, 2]), cball(((a : Cart[Real, 2]), real_of_num(2) * (r : Real))))"), fn(x2606 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2607 = @tactics.mp_tac(x2606)
    fn(x2608 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2607(x2608)
    }
  })
  let t2605 = @tactics.first_x_assum(fn(x2603 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let bz = x2603
    @tactics.match_mp_tac(bz)
  })
  let t2602 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, 2])"))
  let t2618 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq_0()), t2602), @tactics.disch_tac), @tactics.beta_tac), t2605), t2609), t2617), @tactics.all_tac])
  let t2601 = @tactics.subgoal_then(@term_syntax.parse_term("sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm((z : Cart[Real, 2]) - a), 2) - pow((r : Real), 2)) / (cc : Real))) == real_of_num(0)"), fn(x2599 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2599
    @simp.rewrite_tac(@list.List([th, @real.real_sub_rzero()]))
  })
  let t2597 = @simp.asm_rewrite_tac(@list.List([]))
  let t2596 = @tactics.exists_tac(@term_syntax.parse_term("(b : Cart[Real, 2])"))
  let t2595 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t2594 = @simp.rewrite_tac(@list.List([@sets.unions_image(), @sets.subset(), @sets.in_elim_thm()]))
  let t2593 = @simp.expand_tac("W")
  let t2598 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(b : Cart[Real, 2])")), @tactics.disch_tac), t2593), t2594), t2595), @tactics.disch_tac), t2596), t2597), @tactics.all_tac])
  let t2592 = @tactics.subgoal_then(@term_syntax.parse_term("∀ b : Cart[Real, 2], IN(b, (A : (Cart[Real, 2]) -> Bool)) → SUBSET(cball((b, real_of_num(2) * (r : Real))), (W : (Cart[Real, 2]) -> Bool))"), fn(x2589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2590 = @tactics.assume_tac(x2589)
    fn(x2591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2590(x2591)
    }
  })
  let t2625 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.disch_tac), t2592), t2598), t2601), t2618), t2622), t2623), t2624), @tactics.all_tac])
  let t2588 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], !IN(z, (W : (Cart[Real, 2]) -> Bool)) → op_pct(hermite_cutoff(real_of_num(1) - sum((A : (Cart[Real, 2]) -> Bool), (a : Cart[Real, 2]) => hermite_cutoff((pow(norm(z - a), 2) - pow((r : Real), 2)) / (cc : Real)))), (f : (Cart[Real, 2]) -> Cart[Real, 2])(z)) == vec(0)"), fn(x2585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2586 = @tactics.assume_tac(x2585)
    fn(x2587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2586(x2587)
    }
  })
  let t2584 = @list.List([@simp.rewrite_tac(@list.List([hermite_cutoff_nonneg()])), @tactics.all_tac])
  let t2583 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ a : Cart[Real, 2], real_of_num(0) <= hermite_cutoff((pow(norm(z - a), 2) - pow((r : Real), 2)) / (cc : Real))"), fn(x2580 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2581 = @tactics.assume_tac(x2580)
    fn(x2582 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2581(x2582)
    }
  })
  let t2578 = @simp.asm_rewrite_tac(@list.List([@real.real_le_inv_eq()]))
  let t2577 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2575 = @equal.gsym(@calc_int.real_mul_lneg())
  let t2576 = @simp.rewrite_tac(@list.List([@realax.real_div(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) * (y : Real) <= real_of_num(0)) == (real_of_num(0) <= -(x * y))")), t2575]))
  let t2573 = @simp.asm_simp_tac(@list.List([@vectors.norm_pos_le()]))
  let t2574 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_le2()), t2573), @tactics.all_tac])
  let t2572 = @tactics.subgoal_then(@term_syntax.parse_term("pow(norm((z : Cart[Real, 2]) - (a : Cart[Real, 2])), 2) <= pow((r : Real), 2)"), fn(x2569 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2570 = @tactics.mp_tac(x2569)
    fn(x2571 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2570(x2571)
    }
  })
  let t2568 = @tactics.match_mp_tac(hermite_cutoff_le_0())
  let t2579 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2568), t2572), t2574), t2576), @tactics.disch_tac), t2577), t2578), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2567 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ a : Cart[Real, 2], norm(z - a) <= (r : Real) → hermite_cutoff((pow(norm(z - a), 2) - pow(r, 2)) / (cc : Real)) == real_of_num(1)"), fn(x2564 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2565 = @tactics.assume_tac(x2564)
    fn(x2566 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2565(x2566)
    }
  })
  let t2562 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_le2()), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2561 = @tactics.subgoal_then(@term_syntax.parse_term("pow(real_of_num(2) * (r : Real), 2) <= pow(norm((z : Cart[Real, 2]) - (a : Cart[Real, 2])), 2)"), fn(x2558 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2559 = @tactics.mp_tac(x2558)
    fn(x2560 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2559(x2560)
    }
  })
  let t2557 = @simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @realax.real_mul_lid()]))
  let t2556 = @tactics.match_mp_tac(hermite_cutoff_ge_1())
  let t2563 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2556), t2557), t2561), t2562), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2555 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], ∀ a : Cart[Real, 2], real_of_num(2) * (r : Real) <= norm(z - a) → hermite_cutoff((pow(norm(z - a), 2) - pow(r, 2)) / (cc : Real)) == real_of_num(0)"), fn(x2552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2553 = @tactics.assume_tac(x2552)
    fn(x2554 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2553(x2554)
    }
  })
  let t2550 = @meson.asm_meson_tac(@list.List([@topology.compact_imp_closed()]))
  let t2549 = @simp.rewrite_tac(@list.List([@topology.open_univ()]))
  let t2551 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.open_diff()), t2549), t2550), @tactics.all_tac])
  let t2548 = @tactics.subgoal_then(@term_syntax.parse_term("open(DIFF(UNIV, (W : (Cart[Real, 2]) -> Bool)))"), fn(x2545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2546 = @tactics.assume_tac(x2545)
    fn(x2547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2546(x2547)
    }
  })
  let t2543 = @simp.asm_simp_tac(@list.List([@sets.finite_image(), @sets.forall_in_image(), @topology.compact_cball()]))
  let t2542 = @tactics.match_mp_tac(@topology.compact_unions())
  let t2544 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("W"), t2542), t2543), @tactics.all_tac])
  let t2541 = @tactics.subgoal_then(@term_syntax.parse_term("compact((W : (Cart[Real, 2]) -> Bool))"), fn(x2538 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2539 = @tactics.assume_tac(x2538)
    fn(x2540 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2539(x2540)
    }
  })
  let t2536 = @simp.asm_rewrite_tac(@list.List([]))
  let t2535 = @simp.rewrite_tac(@list.List([@sets.unions_subset(), @sets.forall_in_image()]))
  let t2537 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("W"), t2535), t2536), @tactics.all_tac])
  let t2534 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((W : (Cart[Real, 2]) -> Bool), (u : (Cart[Real, 2]) -> Bool))"), fn(x2531 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2532 = @tactics.assume_tac(x2531)
    fn(x2533 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2532(x2533)
    }
  })
  let t2530 = @simp.abbrev_tac(@term_syntax.parse_term("(W : (Cart[Real, 2]) -> Bool) == UNIONS(IMAGE((a : Cart[Real, 2]) => cball((a, real_of_num(2) * (r : Real))), (A : (Cart[Real, 2]) -> Bool)))"))
  let t2526 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2527 = @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t2526)
  let t2525 = @simp.expand_tac("r")
  let t2524 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(t : Real) < (e : Real) → (x : Real) <= t → x < e")))
  let t2528 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @topology.in_cball(), @topology.in_ball()])), @tactics.gen_tac), t2524), t2525), @calc_rat.asm_real_arith_tac), t2527])
  let t2523 = @tactics.exists_tac(@term_syntax.parse_term("ball(((a : Cart[Real, 2]), (e : Real)))"))
  let t2522 = @tactics.match_mp_tac(@sets.subset_trans())
  let t2529 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, 2])")), @tactics.disch_tac), t2522), t2523), @tactics.conj_tac), t2528), @tactics.all_tac])
  let t2521 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : Cart[Real, 2], IN(a, (A : (Cart[Real, 2]) -> Bool)) → SUBSET(cball((a, real_of_num(2) * (r : Real))), (u : (Cart[Real, 2]) -> Bool))"), fn(x2518 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2519 = @tactics.assume_tac(x2518)
    fn(x2520 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2519(x2520)
    }
  })
  let t2516 = @simp.rewrite_tac(@list.List([@real.real_pow_mul(), @realarith.real_pow_2()]))
  let t2517 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("cc"), t2516), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2515 = @tactics.subgoal_then(@term_syntax.parse_term("pow((r : Real), 2) + (cc : Real) == pow(real_of_num(2) * r, 2)"), fn(x2512 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2513 = @tactics.assume_tac(x2512)
    fn(x2514 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2513(x2514)
    }
  })
  let t2510 = @simp.asm_simp_tac(@list.List([@real.real_pow_lt()]))
  let t2509 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t2511 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("cc"), t2509), t2510), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2508 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (cc : Real)"), fn(x2505 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2506 = @tactics.assume_tac(x2505)
    fn(x2507 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2506(x2507)
    }
  })
  let t2504 = @list.List([@tactics.then_tac(@simp.expand_tac("r"), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2503 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < (r : Real)"), fn(x2500 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2501 = @tactics.assume_tac(x2500)
    fn(x2502 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2501(x2502)
    }
  })
  let t2499 = @simp.abbrev_tac(@term_syntax.parse_term("(cc : Real) == real_of_num(3) * pow((r : Real), 2)"))
  let t2498 = @simp.abbrev_tac(@term_syntax.parse_term("(r : Real) == (e : Real) / real_of_num(3)"))
  let t2497 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(A : (Cart[Real, 2]) -> Bool)"))(@tactics.strip_assume_tac))
  let t2496 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t2492 = @term_syntax.parse_term("(e : Real) / real_of_num(3)")
  let t2495 = @tactics.disch_then(fn(x2494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2489 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2490 = @tactics.mp_tac(x2489)
      fn(x2491 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2490(x2491)
      }
    })(((x2493 : @kernel.Thm) => @bool.spec(t2492, x2493))(x2494))
  })
  let t2488 = @simp.asm_rewrite_tac(@list.List([]))
  let t2487 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(K : (Cart[Real, 2]) -> Bool)"), @topology.compact_imp_totally_bounded()))
  let t2486 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(e : Real)"))(@tactics.strip_assume_tac))
  let t2485 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2484 = @simp.rewrite_tac(@list.List([@sets.in_sing(), @sets.unions_1(), @theorems.unwind_thm2()]))
  let t2480 = @term_syntax.parse_term("{(u : (Cart[Real, 2]) -> Bool)}")
  let t2483 = @tactics.disch_then(fn(x2482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2477 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2478 = @tactics.mp_tac(x2477)
      fn(x2479 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2478(x2479)
      }
    })(((x2481 : @kernel.Thm) => @bool.spec(t2480, x2481))(x2482))
  })
  let t2476 = @simp.asm_rewrite_tac(@list.List([]))
  let t2475 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(K : (Cart[Real, 2]) -> Bool)"), @topology.heine_borel_lemma()))
  let t2935 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2475), t2476), t2483), t2484), @tactics.ants_tac), t2485), t2486), t2487), t2488), t2495), t2496), t2497), t2498), t2499), t2503), t2504), t2508), t2511), t2515), t2517), t2521), t2529), t2530), t2534), t2537), t2541), t2544), t2548), t2551), t2555), t2563), t2567), t2579), t2583), t2584), t2588), t2625), t2629), t2657), t2658), t2659), t2660), t2934)
  smooth_extension_from_open_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ u : (Cart[Real, 2]) -> Bool, ∀ K : (Cart[Real, 2]) -> Bool, compact(K) && open(u) && SUBSET(K, u) && differentiable_on(f, u) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), u)) → (∃ ef : (Cart[Real, 2]) -> Cart[Real, 2], differentiable_on(ef, UNIV) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(ef, at(z), h), UNIV)) && bounded(support(op_plus, ef, UNIV)) && (∀ z : Cart[Real, 2], IN(z, K) → ef(z) == f(z)))"), t2935))
}

///|
let smooth_extension_from_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SMOOTH_EXTENSION_FROM_OPEN")

///|
/// `SMOOTH_EXTENSION_FROM_OPEN`
pub fn smooth_extension_from_open() -> @kernel.Thm {
  smooth_extension_from_open_c.get()
}

///|
/// ABSOLUTELY_INTEGRABLE_CAUCHY_PATH_PRODUCT
fn step_102() -> Unit raise {
  let t3022 = @simp.asm_rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()]))
  let t3021 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t3020 = @simp.rewrite_tac(@list.List([@paths.path_image(), @sets.in_image()]))
  let t3023 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t3020), t3021), t3022)
  let t3018 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.norm_pos_le()]))
  let t3017 = @simp.asm_rewrite_tac(@list.List([]))
  let t3016 = @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())
  let t3015 = @tactics.match_mp_tac(@integration.absolutely_integrable_norm())
  let t3019 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable()), t3015), t3016), t3017), t3018])
  let t3024 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@integration.integral_drop_pos()), @tactics.conj_tac), t3019), t3023])
  let t3014 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (C : Real) → abs(x) <= C")))
  let t3025 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_real(), @equal.gsym(@vectors.drop_())])), t3014), @tactics.conj_tac), t3024)
  let t3026 = @list.List([@simp.rewrite_tac(@list.List([@vectors.norm_pos_le()])), t3025])
  let t3013 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t3012 = @simp.gen_rewrite_tac(fn(x3009 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3010 = @equal.rand_conv(x3009)
    fn(x3011 : @kernel.Term) -> @kernel.Thm raise {
      s3010(x3011)
    }
  }, @list.List([@realax.real_mul_sym()]))
  let t3008 = @simp.rewrite_tac(@list.List([@vectors.drop_cmul(), @vectors.lift_drop()]))
  let t3007 = @simp.rewrite_tac(@list.List([@vectors.norm_mul(), @realax.real_abs(), @vectors.norm_pos_le()]))
  let t3006 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()]))
  let t3027 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.beta_tac, @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))), t3006), @tactics.disch_tac), t3007), t3008), t3012), t3013), @tactics.conj_tac), t3026)
  let t3005 = @simp.asm_rewrite_tac(@list.List([]))
  let t3004 = @simp.rewrite_tac(@list.List([@integration.absolutely_integrable_on()]))
  let t3003 = @simp.asm_rewrite_tac(@list.List([]))
  let t3002 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), @measure.absolutely_integrable_vector_derivative_absolutely_continuous()))
  let t3028 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integrable_cmul()), t3002), t3003), t3004), @tactics.strip_tac), t3005)
  let t3001 = @simp.asm_rewrite_tac(@list.List([]))
  let t3029 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(cauchy_kernel_weighted_measurable()), t3001), t3028, t3027])
  let t3000 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2999 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, Unit]) => op_pct((C : Real), lift(norm(vector_derivative((g : (Cart[Real, Unit]) -> Cart[Real, 2]), at(x)))))"))
  let t2998 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_integrable())
  let t2997 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(C : Real)"))(@tactics.strip_assume_tac))
  let t2995 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t2994 = @tactics.match_mp_tac(@paths.compact_path_image())
  let t2996 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2994), t2995), @tactics.all_tac])
  let t2992 = @term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t2993 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(u : (Cart[Real, 2]) -> Cart[Real, 2])"), t2992]), cauchy_kernel_norm_uniform_bound()))
  let t2991 = @simp.rewrite_tac(@list.List([@integration.integrable_restrict_univ()]))
  let t2988 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_0(), @vectors.lift_num(), @integration.integral_0()]))
  let t2987 = @simp.asm_rewrite_tac(@list.List([]))
  let t2986 = @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())
  let t2985 = @tactics.match_mp_tac(@integration.absolutely_integrable_norm())
  let t2984 = @tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable())
  let t2983 = @tactics.match_mp_tac(@integration.integral_cmul())
  let t2981 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul()]))
  let t2980 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t2979 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_mul()]))
  let t2982 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), @tactics.gen_tac), t2979), t2980), t2981), @tactics.all_tac])
  let t2978 = @tactics.subgoal_then(@term_syntax.parse_term("((y : Cart[Real, 2]) => lift(norm((u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (g : (Cart[Real, Unit]) -> Cart[Real, 2])((x : Cart[Real, Unit]))) * vector_derivative(g, at(x))))) == ((y : Cart[Real, 2]) => op_pct(norm(vector_derivative(g, at(x))), lift(norm(u(y) / (y - g(x))))))"), fn(x2975 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2976 = @tactics.subst1_tac(x2975)
    fn(x2977 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2976(x2977)
    }
  })
  let t2989 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2978), t2982), t2983), t2984), t2985), t2986), t2987), t2988])
  let t2974 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t2990 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t2974), @class.cond_cases_tac), t2989), @tactics.all_tac])
  let t3030 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, Unit]) => integral(UNIV, (y : Cart[Real, 2]) => lift(norm(if IN(x, interval([(vec(0), vec(1))])) { (u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x)) * vector_derivative(g, at(x)) } else { vec(0) })))) == ((x : Cart[Real, Unit]) => if IN(x, interval([(vec(0), vec(1))])) { op_pct(norm(vector_derivative(g, at(x))), integral(UNIV, (y : Cart[Real, 2]) => lift(norm(u(y) / (y - g(x)))))) } else { vec(0) })"), fn(x2971 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2972 = @tactics.subst1_tac(x2971)
    fn(x2973 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2972(x2973)
    }
  }), t2990), t2991), t2993), @tactics.ants_tac), t2996), t2997), t2998), t2999), t3000), t3029)
  let t2969 = @simp.rewrite_tac(@list.List([@integration.negligible_empty()]))
  let t2967 = @simp.asm_rewrite_tac(@list.List([@integration.absolutely_integrable_on(), @vectors.norm_0(), @vectors.lift_num(), @integration.integrable_0()]))
  let t2966 = @simp.asm_rewrite_tac(@list.List([]))
  let t2965 = @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())
  let t2964 = @tactics.match_mp_tac(@canal.absolutely_integrable_complex_rmul())
  let t2968 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2964), t2965), t2966), t2967])
  let t2963 = @class.asm_cases_tac(@term_syntax.parse_term("IN((t : Cart[Real, Unit]), interval([(vec(0), vec(1))]))"))
  let t2962 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!!(p : Bool) == p"))]))
  let t2961 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t2970 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty()])), t2961), t2962), t2963), t2968), t2969])
  let t3031 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("{(x : Cart[Real, Unit]) | !absolutely_integrable_on((y : Cart[Real, 2]) => if IN(x, interval([(vec(0), vec(1))])) { (u : (Cart[Real, 2]) -> Cart[Real, 2])(y) / (y - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x)) * vector_derivative(g, at(x)) } else { vec(0) }, UNIV)} == {}"), fn(x2958 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2959 = @tactics.subst1_tac(x2958)
    fn(x2960 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2959(x2960)
    }
  }), t2970), t3030])
  let t2957 = @simp.rewrite_tac(@list.List([@cart.fstcart_pastecart(), @cart.sndcart_pastecart()]))
  let t2956 = @tactics.disch_then(fn(x2954 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2954
    @simp.rewrite_tac(@list.List([th]))
  })
  let t2951 = @drule.match_mp(@measure.fubini_tonelli())
  let t2953 = @tactics.disch_then(fn(x2952 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2948 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2949 = @tactics.mp_tac(x2948)
      fn(x2950 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2949(x2950)
      }
    })(t2951(x2952))
  })
  let t2946 = @simp.asm_rewrite_tac(@list.List([]))
  let t2947 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(measurable_on_fubini_integrand()), t2946), @tactics.all_tac])
  let t2945 = @tactics.subgoal_then(@term_syntax.parse_term("measurable_on((p : Cart[Real, Finite_sum[Unit, 2]]) => if IN(fstcart(p), interval([(vec(0), vec(1))])) { (u : (Cart[Real, 2]) -> Cart[Real, 2])(sndcart(p)) / (sndcart(p) - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(fstcart(p))) * vector_derivative(g, at(fstcart(p))) } else { vec(0) }, UNIV)"), fn(x2942 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2943 = @tactics.mp_tac(x2942)
    fn(x2944 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2943(x2944)
    }
  })
  let t2940 = @simp.asm_rewrite_tac(@list.List([]))
  let t2941 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(cauchy_kernel_absolutely_integrable())), t2940), @tactics.all_tac])
  let t2939 = @tactics.subgoal_then(@term_syntax.parse_term("∀ w : Cart[Real, 2], absolutely_integrable_on((z : Cart[Real, 2]) => (u : (Cart[Real, 2]) -> Cart[Real, 2])(z) / (z - w), UNIV)"), fn(x2936 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2937 = @tactics.assume_tac(x2936)
    fn(x2938 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2937(x2938)
    }
  })
  let t3032 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2939), t2941), t2945), t2947), t2953), t2956), t2957), @tactics.conj_tac), t3031)
  absolutely_integrable_cauchy_path_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], continuous_on(u, UNIV) && bounded(support(op_plus, u, UNIV)) && absolutely_continuous_on(g, interval([(vec(0), vec(1))])) → absolutely_integrable_on((p : Cart[Real, Finite_sum[Unit, 2]]) => if IN(fstcart(p), interval([(vec(0), vec(1))])) { u(sndcart(p)) / (sndcart(p) - g(fstcart(p))) * vector_derivative(g, at(fstcart(p))) } else { vec(0) }, UNIV)"), t3032))
}

///|
let absolutely_integrable_cauchy_path_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABSOLUTELY_INTEGRABLE_CAUCHY_PATH_PRODUCT")

///|
/// `ABSOLUTELY_INTEGRABLE_CAUCHY_PATH_PRODUCT`
pub fn absolutely_integrable_cauchy_path_product() -> @kernel.Thm {
  absolutely_integrable_cauchy_path_product_c.get()
}

///|
/// INTEGRABLE_WINDING_DBAR_PRODUCT
fn step_103() -> Unit raise {
  let t3150 = @tactics.first_x_assum(fn(x3147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3148 = @tactics.accept_tac(x3147)
    fn(x3149 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3148(x3149)
    }
  })
  let t3146 = @meson.meson_tac(@list.List([]))
  let t3145 = @tactics.mp_tac(@cauchy.cx_2pii_nz())
  let t3144 = @simp.rewrite_tac(@list.List([@complexes.complex_neg_eq_0()]))
  let t3151 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("-(Cx(real_of_num(2)) * (Cx(pi) * ii)) == Cx(real_of_num(0))")), t3144), t3145), t3146), t3150])
  let t3143 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t3142 = @simp.rewrite_tac(@list.List([@canal.integrable_complex_lmul_eq()]))
  let t3141 = @tactics.undisch_tac(@term_syntax.parse_term("integrable_on((z : Cart[Real, 2]) => -(Cx(real_of_num(2)) * (Cx(pi) * ii)) * (Cx(Re(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)))) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z)), UNIV)"))
  let t3137 = @tactics.then_tac(@tactics.beta_tac, @simp.asm_rewrite_tac(@list.List([])))
  let t3135 = @simp.simp_tac(@list.List([]))
  let t3134 = @simp.rewrite_tac(@list.List([@cauchy.complex_integer()]))
  let t3132 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3133 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@cauchy.integer_winding_number()), t3132), @tactics.all_tac])
  let t3131 = @tactics.subgoal_then(@term_syntax.parse_term("complex_integer(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (z : Cart[Real, 2]))))"), fn(x3128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3129 = @tactics.mp_tac(x3128)
    fn(x3130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3129(x3130)
    }
  })
  let t3136 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@complexes.real_v1()), @complexes.real()])), t3131), t3133), t3134), t3135), @tactics.all_tac])
  let t3127 = @tactics.subgoal_then(@term_syntax.parse_term("winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (z : Cart[Real, 2]))) == Cx(Re(winding_number((g, z))))"), fn(x3124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3125 = @tactics.subst1_tac(x3124)
    fn(x3126 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3125(x3126)
    }
  })
  let t3122 = @simp.asm_rewrite_tac(@list.List([]))
  let t3121 = @simp.rewrite_tac(@list.List([@equal.gsym(@cauchy.path_integral_integral())]))
  let t3120 = @simp.asm_simp_tac(@list.List([@integration.integral_neg()]))
  let t3123 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t3120), @tactics.ap_term_tac), t3121), t3122), @tactics.all_tac])
  let t3119 = @tactics.subgoal_then(@term_syntax.parse_term("integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => Cx(real_of_num(1)) / ((z : Cart[Real, 2]) - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * vector_derivative(g, at(t))) == -(Cx(real_of_num(2)) * (Cx(pi) * (ii * winding_number((g, z)))))"), fn(x3116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3117 = @tactics.subst1_tac(x3116)
    fn(x3118 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3117(x3118)
    }
  })
  let t3114 = @simp.asm_rewrite_tac(@list.List([]))
  let t3113 = @tactics.match_mp_tac(@integration.integrable_neg())
  let t3112 = @simp.asm_rewrite_tac(@list.List([]))
  let t3115 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@canal.integral_complex_lmul()), t3112), t3113), t3114), @tactics.all_tac])
  let t3111 = @tactics.subgoal_then(@term_syntax.parse_term("integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (z : Cart[Real, 2])) * (Cx(real_of_num(1)) / (z - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * vector_derivative(g, at(t)))) == wirtinger_dbar(f, z) * integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => Cx(real_of_num(1)) / (z - g(t)) * vector_derivative(g, at(t)))"), fn(x3108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3109 = @tactics.subst1_tac(x3108)
    fn(x3110 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3109(x3110)
    }
  })
  let t3107 = @list.List([@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@complexes.complex_div(), @complexes.complex_mul_lid(), @complexes.complex_mul_assoc()]))), @tactics.all_tac])
  let t3106 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), (z : Cart[Real, 2])) / (z - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * vector_derivative(g, at(t)) == wirtinger_dbar(f, z) * (Cx(real_of_num(1)) / (z - g(t)) * vector_derivative(g, at(t)))"), fn(x3104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3104
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t3102 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_neg(), @complexes.complex_mul_lneg()]))
  let t3101 = @simp.gen_rewrite_tac(fn(x3100 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3094 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3095 = @equal.land_conv(x3094)
      fn(x3096 : @kernel.Term) -> @kernel.Thm raise {
        s3095(x3096)
      }
    })((fn(x3097 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3098 = @equal.once_depth_conv(x3097)
      fn(x3099 : @kernel.Term) -> @kernel.Thm raise {
        s3098(x3099)
      }
    })(x3100))
  }, @list.List([@equal.gsym(@complexes.complex_neg_sub())]))
  let t3093 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t3103 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.complex_div(), @complexes.complex_mul_lid()])), t3093), t3101), t3102), @tactics.all_tac])
  let t3092 = @tactics.subgoal_then(@term_syntax.parse_term("((t : Cart[Real, Unit]) => Cx(real_of_num(1)) / ((z : Cart[Real, 2]) - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * vector_derivative(g, at(t))) == ((t : Cart[Real, Unit]) => -(Cx(real_of_num(1)) / (g(t) - z) * vector_derivative(g, at(t))))"), fn(x3089 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3090 = @tactics.assume_tac(x3089)
    fn(x3091 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3090(x3091)
    }
  })
  let t3087 = @simp.rewrite_tac(@list.List([@cauchy.path_integrable_on_v1()]))
  let t3088 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("path_integrable_on((w : Cart[Real, 2]) => Cx(real_of_num(1)) / (w - (z : Cart[Real, 2])), (g : (Cart[Real, Unit]) -> Cart[Real, 2]))")), t3087), @tactics.all_tac])
  let t3086 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((t : Cart[Real, Unit]) => Cx(real_of_num(1)) / ((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t) - (z : Cart[Real, 2])) * vector_derivative(g, at(t)), interval([(vec(0), vec(1))]))"), fn(x3083 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3084 = @tactics.assume_tac(x3083)
    fn(x3085 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3084(x3085)
    }
  })
  let t3080 = @drule.match_mp(@cauchy.path_integral_unique())
  let t3082 = @tactics.first_assum(fn(x3081 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3077 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3078 = @tactics.assume_tac(x3077)
      fn(x3079 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3078(x3079)
      }
    })(t3080(x3081))
  })
  let t3074 = @drule.match_mp(@cauchy.has_path_integral_integrable())
  let t3076 = @tactics.first_assum(fn(x3075 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3071 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3072 = @tactics.assume_tac(x3071)
      fn(x3073 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3072(x3073)
      }
    })(t3074(x3075))
  })
  let t3070 = @simp.asm_rewrite_tac(@list.List([]))
  let t3068 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t3069 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), t3068]), @cauchy.has_path_integral_winding_number_ac()))
  let t3067 = @tactics.conv_tac(@equal.sym_conv)
  let t3066 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t3138 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), t3066), @tactics.disch_tac), @tactics.beta_tac), t3067), t3069), t3070), @tactics.disch_tac), t3076), t3082), t3086), t3088), t3092), t3103), t3106), t3107), t3111), t3115), t3119), t3123), t3127), t3136), @complexes.simple_complex_arith_tac)
  let t3139 = @list.List([@meson.asm_meson_tac(@list.List([negligible_absolutely_continuous_path_image()])), t3138, t3137])
  let t3065 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3064 = @tactics.disch_then(@tactics.match_mp_tac)
  let t3060 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t3061 = @term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t3062 = @term_syntax.parse_term("(z : Cart[Real, 2]) => -(Cx(real_of_num(2)) * (Cx(pi) * ii)) * (Cx(Re(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)))) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z))")
  let t3063 = @bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z) / (z - (g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * vector_derivative(g, at(t)))"), t3062, t3061, t3060]), @integration.integrable_spike())
  let t3140 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(t3063)), t3064), t3065), t3139), @tactics.all_tac])
  let t3059 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((z : Cart[Real, 2]) => -(Cx(real_of_num(2)) * (Cx(pi) * ii)) * (Cx(Re(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)))) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z)), UNIV)"), fn(x3056 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3057 = @tactics.assume_tac(x3056)
    fn(x3058 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3057(x3058)
    }
  })
  let t3055 = @tactics.disch_then(fn(x3053 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3053
    @tactics.mp_tac(@drule.match_mp(@integration.has_integral_integrable())(th))
  })
  let t3052 = @simp.rewrite_tac(@list.List([integral_if_const(), @integration.integral_restrict_univ()]))
  let t3051 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3045 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3046 = @tactics.assume_tac(x3045)
    fn(x3047 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3046(x3047)
    }
  }, fn(x3048 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3049 = @tactics.mp_tac(x3048)
    fn(x3050 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3049(x3050)
    }
  }))
  let t3044 = @simp.rewrite_tac(@list.List([@cart.fstcart_pastecart(), @cart.sndcart_pastecart()]))
  let t3041 = @drule.match_mp(@measure.fubini_absolutely_integrable_alt())
  let t3043 = @tactics.first_assum(fn(x3042 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3038 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3039 = @tactics.mp_tac(x3038)
      fn(x3040 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3039(x3040)
      }
    })(t3041(x3042))
  })
  let t3037 = @simp.asm_rewrite_tac(@list.List([]))
  let t3036 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t3035 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@class.eta_ax()])))
  let t3033 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t3034 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z)"), t3033]), absolutely_integrable_cauchy_path_product()))
  let t3152 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3034), t3035), t3036), t3037), @tactics.disch_tac), t3043), t3044), t3051), t3052), t3055), @tactics.disch_tac), t3059), t3140), t3141), t3142), t3143), t3151)
  integrable_winding_dbar_product_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => wirtinger_dbar(f, z), UNIV) && bounded(support(op_plus, wirtinger_dbar(f), UNIV)) && absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) → integrable_on((z : Cart[Real, 2]) => Cx(Re(winding_number((g, z)))) * wirtinger_dbar(f, z), UNIV)"), t3152))
}

///|
let integrable_winding_dbar_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTEGRABLE_WINDING_DBAR_PRODUCT")

///|
/// `INTEGRABLE_WINDING_DBAR_PRODUCT`
pub fn integrable_winding_dbar_product() -> @kernel.Thm {
  integrable_winding_dbar_product_c.get()
}

///|
/// COMPLEX_GREEN_ALT
fn step_104() -> Unit raise {
  let t3285 = @tactics.conv_tac(@complexes.complex_field)
  let t3284 = @simp.rewrite_tac(@list.List([@complexes.cx_inv()]))
  let t3283 = @tactics.undisch_tac(@term_syntax.parse_term("-Cx(pi) * path_integral((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (f : (Cart[Real, 2]) -> Cart[Real, 2])) == -(Cx(real_of_num(2)) * (Cx(pi) * ii)) * integral(UNIV, (z : Cart[Real, 2]) => Cx(Re(winding_number((g, z)))) * wirtinger_dbar(f, z))"))
  let t3282 = @tactics.mp_tac(@transcendentals.cx_pi_nz())
  let t3281 = @tactics.mp_tac(@cauchy.cx_2pii_nz())
  let t3279 = @simp.asm_simp_tac(@list.List([@canal.integral_complex_lmul()]))
  let t3278 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), @tactics.gen_tac), @complexes.simple_complex_arith_tac), @tactics.all_tac])
  let t3277 = @tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z) * -(Cx(real_of_num(2)) * (Cx(pi) * (ii * Cx(Re(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)))))))) == ((z : Cart[Real, 2]) => -(Cx(real_of_num(2)) * (Cx(pi) * ii)) * (Cx(Re(winding_number((g, z)))) * wirtinger_dbar(f, z)))"), fn(x3274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3275 = @tactics.subst1_tac(x3274)
    fn(x3276 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3275(x3276)
    }
  })
  let t3272 = @simp.simp_tac(@list.List([]))
  let t3271 = @simp.rewrite_tac(@list.List([@cauchy.complex_integer()]))
  let t3269 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3270 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@cauchy.integer_winding_number()), t3269), @tactics.all_tac])
  let t3268 = @tactics.subgoal_then(@term_syntax.parse_term("complex_integer(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (z : Cart[Real, 2]))))"), fn(x3265 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3266 = @tactics.mp_tac(x3265)
    fn(x3267 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3266(x3267)
    }
  })
  let t3264 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.real_v1()), @complexes.real()]))
  let t3263 = @tactics.repeat_tac(@tactics.ap_term_tac)
  let t3261 = @simp.asm_rewrite_tac(@list.List([]))
  let t3260 = @simp.asm_simp_tac(@list.List([@cauchy.path_integral_neg()]))
  let t3258 = @simp.rewrite_tac(@list.List([@complexes.complex_inv_neg()]))
  let t3257 = @simp.gen_rewrite_tac(fn(x3256 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3250 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3251 = @equal.land_conv(x3250)
      fn(x3252 : @kernel.Term) -> @kernel.Thm raise {
        s3251(x3252)
      }
    })((fn(x3253 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3254 = @equal.once_depth_conv(x3253)
      fn(x3255 : @kernel.Term) -> @kernel.Thm raise {
        s3254(x3255)
      }
    })(x3256))
  }, @list.List([@equal.gsym(@complexes.complex_neg_sub())]))
  let t3249 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t3259 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.complex_div(), @complexes.complex_mul_lid()])), t3249), t3257), t3258), @tactics.all_tac])
  let t3248 = @tactics.subgoal_then(@term_syntax.parse_term("((w : Cart[Real, 2]) => Cx(real_of_num(1)) / ((z : Cart[Real, 2]) - w)) == ((w : Cart[Real, 2]) => -(Cx(real_of_num(1)) / (w - z)))"), fn(x3245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3246 = @tactics.subst1_tac(x3245)
    fn(x3247 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3246(x3247)
    }
  })
  let t3242 = @drule.match_mp(@cauchy.path_integral_unique())
  let t3244 = @tactics.first_assum(fn(x3243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3240 = @tactics.assume_tac(x3239)
      fn(x3241 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3240(x3241)
      }
    })(t3242(x3243))
  })
  let t3236 = @drule.match_mp(@cauchy.has_path_integral_integrable())
  let t3238 = @tactics.first_assum(fn(x3237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3233 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3234 = @tactics.assume_tac(x3233)
      fn(x3235 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3234(x3235)
      }
    })(t3236(x3237))
  })
  let t3232 = @simp.asm_rewrite_tac(@list.List([]))
  let t3231 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t3262 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), t3231]), @cauchy.has_path_integral_winding_number_ac())), t3232), @tactics.disch_tac), t3238), t3244), t3248), t3259), t3260), t3261), @complexes.simple_complex_arith_tac), @tactics.all_tac])
  let t3230 = @tactics.subgoal_then(@term_syntax.parse_term("path_integral((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (w : Cart[Real, 2]) => Cx(real_of_num(1)) / ((z : Cart[Real, 2]) - w)) == -(Cx(real_of_num(2)) * (Cx(pi) * (ii * winding_number((g, z)))))"), fn(x3227 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3228 = @tactics.subst1_tac(x3227)
    fn(x3229 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3228(x3229)
    }
  })
  let t3226 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t3225 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3224 = @list.List([@meson.asm_meson_tac(@list.List([negligible_absolutely_continuous_path_image()])), @tactics.all_tac])
  let t3223 = @tactics.exists_tac(@term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t3273 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integral_spike()), t3223), @tactics.conj_tac), t3224), t3225), t3226), @tactics.disch_tac), @tactics.ap_term_tac), t3230), t3262), t3263), t3264), t3268), t3270), t3271), t3272), @tactics.all_tac])
  let t3222 = @tactics.subgoal_then(@term_syntax.parse_term("integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z) * path_integral((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (w : Cart[Real, 2]) => Cx(real_of_num(1)) / (z - w))) == integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar(f, z) * -(Cx(real_of_num(2)) * (Cx(pi) * (ii * Cx(Re(winding_number((g, z))))))))"), fn(x3219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3220 = @tactics.subst1_tac(x3219)
    fn(x3221 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3220(x3221)
    }
  })
  let t3280 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t3222), t3273), t3277), t3278), t3279), @tactics.all_tac])
  let t3218 = @tactics.subgoal_then(@term_syntax.parse_term("-Cx(pi) * path_integral((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (f : (Cart[Real, 2]) -> Cart[Real, 2])) == -(Cx(real_of_num(2)) * (Cx(pi) * ii)) * integral(UNIV, (z : Cart[Real, 2]) => Cx(Re(winding_number((g, z)))) * wirtinger_dbar(f, z))"), fn(x3215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3216 = @tactics.assume_tac(x3215)
    fn(x3217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3216(x3217)
    }
  })
  let t3213 = @meson.asm_meson_tac(@list.List([]))
  let t3211 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_mul_lneg()]))
  let t3212 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), @tactics.gen_tac), t3211), @tactics.all_tac])
  let t3210 = @tactics.subgoal_then(@term_syntax.parse_term("((w : Cart[Real, 2]) => integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z) / (z - w))) == ((w : Cart[Real, 2]) => -Cx(pi) * f(w))"), fn(x3207 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3208 = @tactics.assume_tac(x3207)
    fn(x3209 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3208(x3209)
    }
  })
  let t3205 = @simp.asm_rewrite_tac(@list.List([]))
  let t3204 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t3203 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@class.eta_ax()])))
  let t3206 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(fubini_path_area()), t3203), t3204), t3205), @tactics.all_tac])
  let t3202 = @tactics.subgoal_then(@term_syntax.parse_term("path_integral((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (w : Cart[Real, 2]) => integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z) / (z - w))) == integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar(f, z) * path_integral(g, (w : Cart[Real, 2]) => Cx(real_of_num(1)) / (z - w)))"), fn(x3199 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3200 = @tactics.assume_tac(x3199)
    fn(x3201 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3200(x3201)
    }
  })
  let t3197 = @simp.asm_rewrite_tac(@list.List([]))
  let t3198 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@cauchy.path_integral_complex_lmul()), t3197), @tactics.all_tac])
  let t3214 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("path_integral((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (w : Cart[Real, 2]) => -Cx(pi) * (f : (Cart[Real, 2]) -> Cart[Real, 2])(w)) == -Cx(pi) * path_integral(g, f)"), fn(x3194 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3195 = @tactics.assume_tac(x3194)
    fn(x3196 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3195(x3196)
    }
  }), t3198), t3202), t3206), t3210), t3212), t3213), @tactics.all_tac])
  let t3193 = @tactics.subgoal_then(@term_syntax.parse_term("-Cx(pi) * path_integral((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (f : (Cart[Real, 2]) -> Cart[Real, 2])) == integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar(f, z) * path_integral(g, (w : Cart[Real, 2]) => Cx(real_of_num(1)) / (z - w)))"), fn(x3190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3191 = @tactics.assume_tac(x3190)
    fn(x3192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3191(x3192)
    }
  })
  let t3189 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t3188 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t3185 = @simp.asm_rewrite_tac(@list.List([]))
  let t3184 = @simp.asm_rewrite_tac(@list.List([]))
  let t3183 = @tactics.match_mp_tac(@derivatives.differentiable_imp_continuous_on())
  let t3182 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t3181 = @tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)"))
  let t3186 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_on_subset()), t3181), t3182), t3183), t3184), t3185])
  let t3187 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(path_integrable_continuous_absolutely_continuous()), @tactics.conj_tac), t3186), @tactics.all_tac])
  let t3180 = @tactics.subgoal_then(@term_syntax.parse_term("path_integrable_on((f : (Cart[Real, 2]) -> Cart[Real, 2]), (g : (Cart[Real, Unit]) -> Cart[Real, 2]))"), fn(x3177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3178 = @tactics.assume_tac(x3177)
    fn(x3179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3178(x3179)
    }
  })
  let t3175 = @simp.asm_rewrite_tac(@list.List([]))
  let t3176 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(integrable_winding_dbar_product()), t3175), @tactics.all_tac])
  let t3174 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((z : Cart[Real, 2]) => Cx(Re(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)))) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z), UNIV)"), fn(x3171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3172 = @tactics.assume_tac(x3171)
    fn(x3173 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3172(x3173)
    }
  })
  let t3169 = @simp.asm_rewrite_tac(@list.List([]))
  let t3170 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(cauchy_transform_inverts_dbar())), t3169), @tactics.all_tac])
  let t3168 = @tactics.subgoal_then(@term_syntax.parse_term("∀ w : Cart[Real, 2], integral(UNIV, (z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z) / (z - w)) == -(Cx(pi) * f(w))"), fn(x3165 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3166 = @tactics.assume_tac(x3165)
    fn(x3167 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3166(x3167)
    }
  })
  let t3163 = @simp.asm_rewrite_tac(@list.List([]))
  let t3164 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(wirtinger_dbar_bounded_support()), t3163), @tactics.all_tac])
  let t3162 = @tactics.subgoal_then(@term_syntax.parse_term("bounded(support(op_plus, wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2])), UNIV))"), fn(x3159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3160 = @tactics.assume_tac(x3159)
    fn(x3161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3160(x3161)
    }
  })
  let t3157 = @simp.asm_rewrite_tac(@list.List([]))
  let t3158 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(wirtinger_dbar_continuous()), t3157), @tactics.all_tac])
  let t3156 = @tactics.subgoal_then(@term_syntax.parse_term("continuous_on((z : Cart[Real, 2]) => wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z), UNIV)"), fn(x3153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3154 = @tactics.assume_tac(x3153)
    fn(x3155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3154(x3155)
    }
  })
  let t3286 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t3156), t3158), t3162), t3164), t3168), t3170), t3174), t3176), t3180), t3187), @tactics.conj_tac), t3188), @tactics.conj_tac), t3189), t3193), t3214), t3218), t3280), t3281), t3282), t3283), t3284), t3285)
  let complex_green_univ = @tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], differentiable_on(f, UNIV) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), UNIV)) && bounded(support(op_plus, f, UNIV)) && absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) → integrable_on((z : Cart[Real, 2]) => Cx(Re(winding_number((g, z)))) * wirtinger_dbar(f, z), UNIV) && path_integrable_on(f, g) && Cx(inv(real_of_num(2))) / ii * path_integral(g, f) == integral(UNIV, (z : Cart[Real, 2]) => Cx(Re(winding_number((g, z)))) * wirtinger_dbar(f, z))"), t3286)
  let t3387 = @tactics.disch_then(fn(x3384 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3385 = @tactics.accept_tac(x3384)
    fn(x3386 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3385(x3386)
    }
  })
  let t3382 = @meson.asm_meson_tac(@list.List([negligible_absolutely_continuous_path_image()]))
  let t3381 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t3380 = @tactics.exists_tac(@term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t3383 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integral_spike()), t3380), t3381), t3382), @tactics.all_tac])
  let t3379 = @tactics.subgoal_then(@term_syntax.parse_term("integral(UNIV, (z : Cart[Real, 2]) => Cx(Re(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)))) * wirtinger_dbar((ef : (Cart[Real, 2]) -> Cart[Real, 2]), z)) == integral(UNIV, (z : Cart[Real, 2]) => Cx(Re(winding_number((g, z)))) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z))"), fn(x3376 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3377 = @tactics.subst1_tac(x3376)
    fn(x3378 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3377(x3378)
    }
  })
  let t3374 = @simp.asm_rewrite_tac(@list.List([@sets.in_union()]))
  let t3373 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3372 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3375 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.path_integral_eq()), t3372), @tactics.disch_tac), t3373), t3374), @tactics.all_tac])
  let t3371 = @tactics.subgoal_then(@term_syntax.parse_term("path_integral((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (ef : (Cart[Real, 2]) -> Cart[Real, 2])) == path_integral(g, (f : (Cart[Real, 2]) -> Cart[Real, 2]))"), fn(x3368 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3369 = @tactics.subst1_tac(x3368)
    fn(x3370 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3369(x3370)
    }
  })
  let t3367 = @tactics.undisch_tac(@term_syntax.parse_term("Cx(inv(real_of_num(2))) / ii * path_integral((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (ef : (Cart[Real, 2]) -> Cart[Real, 2])) == integral(UNIV, (z : Cart[Real, 2]) => Cx(Re(winding_number((g, z)))) * wirtinger_dbar(ef, z))"))
  let t3365 = @simp.asm_rewrite_tac(@list.List([@sets.in_union()]))
  let t3364 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3363 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3362 = @simp.asm_rewrite_tac(@list.List([]))
  let t3361 = @tactics.exists_tac(@term_syntax.parse_term("(ef : (Cart[Real, 2]) -> Cart[Real, 2])"))
  let t3366 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.path_integrable_eq()), t3361), t3362), t3363), @tactics.disch_tac), t3364), t3365), @tactics.all_tac])
  let t3359 = @meson.asm_meson_tac(@list.List([negligible_absolutely_continuous_path_image()]))
  let t3358 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t3357 = @tactics.disch_then(fn(x3355 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3355
    @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(th))
  })
  let t3351 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t3352 = @term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t3353 = @term_syntax.parse_term("(z : Cart[Real, 2]) => Cx(Re(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)))) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z)")
  let t3354 = @bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => Cx(Re(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)))) * wirtinger_dbar((ef : (Cart[Real, 2]) -> Cart[Real, 2]), z)"), t3353, t3352, t3351]), @integration.integrable_spike())
  let t3360 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@equal.conv_rule(@equal.depth_conv(@equal.beta_conv), t3354)), t3357), t3358), t3359), @tactics.all_tac])
  let t3346 = @simp.rewrite_tac(@list.List([@complexes.re_cx(), @complexes.complex_mul_lzero()]))
  let t3345 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3347 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@cauchy.winding_number_zero_in_outside()), t3345), t3346])
  let t3348 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (z : Cart[Real, 2]))) == Cx(real_of_num(0))"), fn(x3342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3343 = @tactics.subst1_tac(x3342)
    fn(x3344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3343(x3344)
    }
  }), t3347)
  let t3341 = @simp.asm_simp_tac(@list.List([]))
  let t3349 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([wirtinger_dbar(), @derivatives.jacobian()]))), t3341), t3348])
  let t3340 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t3338 = @simp.asm_rewrite_tac(@list.List([]))
  let t3334 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t3337 = @tactics.disch_then(fn(x3336 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3331 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3332 = @tactics.mp_tac(x3331)
      fn(x3333 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3332(x3333)
      }
    })(((x3335 : @kernel.Thm) => @bool.spec(t3334, x3335))(x3336))
  })
  let t3330 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.in_diff(), @sets.in_univ()]))
  let t3339 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"), @paths.inside_union_outside())), t3330), t3337), t3338), @tactics.all_tac])
  let t3329 = @tactics.subgoal_then(@term_syntax.parse_term("IN((z : Cart[Real, 2]), inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))) || IN(z, outside(path_image(g)))"), fn(x3326 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3327 = @tactics.mp_tac(x3326)
    fn(x3328 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3327(x3328)
    }
  })
  let t3350 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.disch_tac), t3329), t3339), t3340), t3349), @tactics.all_tac])
  let t3325 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], !IN(z, path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))) → Cx(Re(winding_number((g, z)))) * wirtinger_dbar((ef : (Cart[Real, 2]) -> Cart[Real, 2]), z) == Cx(Re(winding_number((g, z)))) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z)"), fn(x3322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3323 = @tactics.assume_tac(x3322)
    fn(x3324 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3323(x3324)
    }
  })
  let t3320 = @simp.asm_rewrite_tac(@list.List([]))
  let t3321 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(complex_green_univ), t3320), @tactics.all_tac])
  let t3319 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((z : Cart[Real, 2]) => Cx(Re(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)))) * wirtinger_dbar((ef : (Cart[Real, 2]) -> Cart[Real, 2]), z), UNIV) && path_integrable_on(ef, g) && Cx(inv(real_of_num(2))) / ii * path_integral(g, ef) == integral(UNIV, (z : Cart[Real, 2]) => Cx(Re(winding_number((g, z)))) * wirtinger_dbar(ef, z))"), @tactics.strip_assume_tac)
  let t3316 = @meson.asm_meson_tac(@list.List([@derivatives.frechet_derivative_works(), @derivatives.differentiable_on(), @sets.in_univ(), @topology.within_univ()]))
  let t3315 = @simp.asm_rewrite_tac(@list.List([@sets.in_union()]))
  let t3314 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3317 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])")), @tactics.disch_tac), t3314), t3315), t3316])
  let t3313 = @simp.asm_rewrite_tac(@list.List([]))
  let t3312 = @tactics.exists_tac(@term_syntax.parse_term("inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))"))
  let t3311 = @tactics.exists_tac(@term_syntax.parse_term("(ef : (Cart[Real, 2]) -> Cart[Real, 2])"))
  let t3310 = @tactics.match_mp_tac(@derivatives.has_derivative_transform_within_open())
  let t3309 = @tactics.match_mp_tac(@derivatives.has_frechet_derivative_unique_at())
  let t3308 = @tactics.conv_tac(@equal.sym_conv)
  let t3318 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.disch_tac), t3308), t3309), t3310), t3311), t3312), t3313), @tactics.conj_tac), t3317), @tactics.all_tac])
  let t3307 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], IN(z, inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))) → frechet_derivative((ef : (Cart[Real, 2]) -> Cart[Real, 2]), at(z)) == frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at(z))"), fn(x3304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3305 = @tactics.assume_tac(x3304)
    fn(x3306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3305(x3306)
    }
  })
  let t3302 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3301 = @tactics.match_mp_tac(@paths.compact_path_image())
  let t3300 = @tactics.match_mp_tac(@topology.compact_imp_closed())
  let t3303 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@paths.open_inside()), t3300), t3301), t3302), @tactics.all_tac])
  let t3299 = @tactics.subgoal_then(@term_syntax.parse_term("open(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))"), fn(x3296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3297 = @tactics.assume_tac(x3296)
    fn(x3298 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3297(x3298)
    }
  })
  let t3295 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(ef : (Cart[Real, 2]) -> Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t3293 = @simp.asm_rewrite_tac(@list.List([]))
  let t3292 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t3291 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t3290 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3289 = @tactics.match_mp_tac(@paths.compact_path_image())
  let t3294 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@paths.compact_with_inside()), t3289), t3290), @tactics.all_tac])), @tactics.conj_tac), t3291), @tactics.conj_tac), t3292), t3293), @tactics.all_tac])
  let t3287 = @term_syntax.parse_term("UNION(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])), inside(path_image(g)))")
  let t3288 = @term_syntax.parse_term("(u : (Cart[Real, 2]) -> Bool)")
  let t3388 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t3288, t3287]), smooth_extension_from_open())), @tactics.ants_tac), t3294), t3295), t3299), t3303), t3307), t3318), t3319), t3321), t3325), t3350), @tactics.conj_tac), t3360), @tactics.conj_tac), t3366), t3367), t3371), t3375), t3379), t3383), t3387)
  let t3389 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t3388)
  complex_green_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ u : (Cart[Real, 2]) -> Bool, absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) && open(u) && SUBSET(UNION(inside(path_image(g)), path_image(g)), u) && differentiable_on(f, u) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), u)) → integrable_on((z : Cart[Real, 2]) => Cx(Re(winding_number((g, z)))) * wirtinger_dbar(f, z), UNIV) && path_integrable_on(f, g) && Cx(inv(real_of_num(2))) / ii * path_integral(g, f) == integral(UNIV, (z : Cart[Real, 2]) => Cx(Re(winding_number((g, z)))) * wirtinger_dbar(f, z))"), t3389))
}

///|
let complex_green_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_GREEN_ALT")

///|
/// `COMPLEX_GREEN_ALT`
pub fn complex_green_alt() -> @kernel.Thm {
  complex_green_alt_c.get()
}

///|
/// COMPLEX_GREEN
fn step_105() -> Unit raise {
  let t3427 = @meson.asm_meson_tac(@list.List([@cauchy.integer_winding_number(), @cauchy.complex_integer()]))
  let t3426 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.real_v1()), @complexes.real()]))
  let t3425 = @tactics.conv_tac(@equal.sym_conv)
  let t3424 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3423 = @simp.asm_simp_tac(@list.List([negligible_absolutely_continuous_path_image(), @sets.in_diff(), @sets.in_univ()]))
  let t3422 = @tactics.exists_tac(@term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t3421 = @tactics.match_mp_tac(@integration.integral_spike())
  let t3420 = @tactics.replicate_tac(2, @tactics.ap_term_tac)
  let t3419 = @simp.asm_rewrite_tac(@list.List([]))
  let t3418 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t3415 = @simp.asm_rewrite_tac(@list.List([]))
  let t3413 = @meson.asm_meson_tac(@list.List([@cauchy.integer_winding_number(), @cauchy.complex_integer()]))
  let t3412 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.real_v1()), @complexes.real()]))
  let t3411 = @tactics.conv_tac(@equal.sym_conv)
  let t3414 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t3411), t3412), t3413)
  let t3416 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([negligible_absolutely_continuous_path_image()])), t3414])), t3415])
  let t3410 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t3409 = @tactics.disch_then(fn(x3407 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3407
    @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(th))
  })
  let t3403 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t3404 = @term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t3405 = @term_syntax.parse_term("(z : Cart[Real, 2]) => winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z)")
  let t3406 = @bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => Cx(Re(winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)))) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z)"), t3405, t3404, t3403]), @integration.integrable_spike())
  let t3417 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@equal.conv_rule(@equal.depth_conv(@equal.beta_conv), t3406)), t3409), t3410), @tactics.conj_tac), t3416), @tactics.all_tac])
  let t3402 = @list.List([@meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()])), @tactics.all_tac])
  let t3401 = @tactics.subgoal_then(@term_syntax.parse_term("path((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"), fn(x3398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3399 = @tactics.assume_tac(x3398)
    fn(x3400 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3399(x3400)
    }
  })
  let t3397 = @simp.rewrite_tac(@list.List([@complexes.cx_inv(), @complexes.complex_field(@term_syntax.parse_term("(inv(Cx(real_of_num(2))) / ii * (x : Cart[Real, 2]) == (y : Cart[Real, 2])) == (x == Cx(real_of_num(2)) * (ii * y))"))]))
  let t3396 = @tactics.first_x_assum(@tactics.strip_assume_tac)
  let t3393 = @drule.match_mp(complex_green_alt())
  let t3395 = @tactics.first_assum(fn(x3394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3391 = @tactics.mp_tac(x3390)
      fn(x3392 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3391(x3392)
      }
    })(t3393(x3394))
  })
  let t3428 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t3395), t3396), t3397), @tactics.strip_tac), t3401), t3402), @tactics.conj_tac), t3417), @tactics.conj_tac), t3418), t3419), t3420), t3421), t3422), t3423), t3424), @tactics.ap_thm_tac), @tactics.ap_term_tac), t3425), t3426), t3427)
  complex_green_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ u : (Cart[Real, 2]) -> Bool, absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) && open(u) && SUBSET(UNION(inside(path_image(g)), path_image(g)), u) && differentiable_on(f, u) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), u)) → integrable_on((z : Cart[Real, 2]) => winding_number((g, z)) * wirtinger_dbar(f, z), UNIV) && path_integrable_on(f, g) && path_integral(g, f) == Cx(real_of_num(2)) * (ii * integral(UNIV, (z : Cart[Real, 2]) => winding_number((g, z)) * wirtinger_dbar(f, z)))"), t3428))
}

///|
let complex_green_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_GREEN")

///|
/// `COMPLEX_GREEN`
pub fn complex_green() -> @kernel.Thm {
  complex_green_c.get()
}

///|
/// COMPLEX_GREEN_INSIDE
fn step_106() -> Unit raise {
  let t3484 = @simp.asm_rewrite_tac(@list.List([@paths.outside_inside(), @sets.in_diff(), @sets.in_univ(), @sets.in_union()]))
  let t3483 = @simp.asm_simp_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3482 = @tactics.match_mp_tac(@cauchy.winding_number_zero_in_outside())
  let t3481 = @simp.rewrite_tac(@list.List([@complexes.complex_entire()]))
  let t3480 = @tactics.conv_tac(@equal.sym_conv)
  let t3479 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0()]))
  let t3478 = @simp.asm_rewrite_tac(@list.List([]))
  let t3477 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3476 = @simp.asm_simp_tac(@list.List([negligible_absolutely_continuous_path_image(), @sets.in_diff(), @sets.in_univ()]))
  let t3475 = @tactics.exists_tac(@term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t3474 = @tactics.match_mp_tac(@integration.integral_spike())
  let t3473 = @simp.gen_rewrite_tac(fn(x3470 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3471 = @equal.rand_conv(x3470)
    fn(x3472 : @kernel.Term) -> @kernel.Thm raise {
      s3471(x3472)
    }
  }, @list.List([@equal.gsym(@integration.integral_restrict_univ())]))
  let t3469 = @tactics.replicate_tac(2, @tactics.ap_term_tac)
  let t3468 = @simp.asm_rewrite_tac(@list.List([]))
  let t3467 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t3464 = @drule.match_mp(complex_green())
  let t3466 = @tactics.first_assum(fn(x3465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t3464(x3465))
  })
  let t3461 = @simp.rewrite_tac(@list.List([@integration.integrable_restrict_univ()]))
  let t3459 = @simp.asm_rewrite_tac(@list.List([]))
  let t3456 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lzero()]))
  let t3455 = @simp.asm_rewrite_tac(@list.List([@paths.outside_inside(), @sets.in_diff(), @sets.in_univ(), @sets.in_union()]))
  let t3454 = @simp.asm_simp_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3457 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@cauchy.winding_number_zero_in_outside()), t3454), t3455), t3456])
  let t3453 = @tactics.subgoal_then(@term_syntax.parse_term("winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), (z : Cart[Real, 2]))) == Cx(real_of_num(0))"), fn(x3450 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3451 = @tactics.subst1_tac(x3450)
    fn(x3452 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3451(x3452)
    }
  })
  let t3449 = @simp.rewrite_tac(@list.List([@complexes.complex_vec_0()]))
  let t3448 = @simp.asm_rewrite_tac(@list.List([]))
  let t3447 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_univ()]))
  let t3458 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), t3447), @tactics.disch_tac), @class.cond_cases_tac), t3448), t3449), t3453), t3457)
  let t3446 = @simp.asm_rewrite_tac(@list.List([]))
  let t3460 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.match_mp_tac(negligible_absolutely_continuous_path_image()), t3446), t3458])), t3459])
  let t3445 = @tactics.disch_then(fn(x3443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3443
    @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(th))
  })
  let t3439 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t3440 = @term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t3441 = @term_syntax.parse_term("(z : Cart[Real, 2]) => if IN(z, inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))) { winding_number((g, z)) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z) } else { vec(0) }")
  let t3442 = @bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z)"), t3441, t3440, t3439]), @integration.integrable_spike())
  let t3462 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@equal.conv_rule(@equal.depth_conv(@equal.beta_conv), t3442)), t3445), @tactics.conj_tac), t3460), t3461])
  let t3438 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((z : Cart[Real, 2]) => if IN(z, inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))) { winding_number((g, z)) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z) } else { vec(0) }, UNIV)"), fn(x3435 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3436 = @tactics.mp_tac(x3435)
    fn(x3437 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3436(x3437)
    }
  })
  let t3433 = @drule.match_mp(complex_green())
  let t3463 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x3434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3429 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3430 = @tactics.mp_tac(x3429)
        fn(x3431 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3430(x3431)
        }
      })(@bool.conjunct1(x3432))
    })(t3433(x3434))
  }), @tactics.disch_tac), t3438), t3462), @tactics.all_tac])
  let t3485 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), @tactics.conj_tac), t3463), t3466), @tactics.conj_tac), t3467), t3468), t3469), t3473), t3474), t3475), t3476), t3477), @tactics.strip_tac), @class.cond_cases_tac), t3478), t3479), t3480), t3481), @tactics.disj1_tac), t3482), t3483), t3484)
  complex_green_inside_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ u : (Cart[Real, 2]) -> Bool, absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) && open(u) && SUBSET(UNION(inside(path_image(g)), path_image(g)), u) && differentiable_on(f, u) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), u)) → integrable_on((z : Cart[Real, 2]) => winding_number((g, z)) * wirtinger_dbar(f, z), inside(path_image(g))) && path_integrable_on(f, g) && path_integral(g, f) == Cx(real_of_num(2)) * (ii * integral(inside(path_image(g)), (z : Cart[Real, 2]) => winding_number((g, z)) * wirtinger_dbar(f, z)))"), t3485))
}

///|
let complex_green_inside_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_GREEN_INSIDE")

///|
/// `COMPLEX_GREEN_INSIDE`
pub fn complex_green_inside() -> @kernel.Thm {
  complex_green_inside_c.get()
}

///|
/// HAS_PATH_INTEGRAL_CNJ
fn step_107() -> Unit raise {
  let t3501 = @simp.rewrite_tac(@list.List([wirtinger_dbar_cnj(), @complexes.complex_mul_rid()]))
  let t3500 = @tactics.match_mp_tac(@integration.integral_eq())
  let t3499 = @tactics.replicate_tac(2, @tactics.ap_term_tac)
  let t3498 = @simp.asm_rewrite_tac(@list.List([]))
  let t3497 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t3493 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const()]))
  let t3492 = @bool.spec_all(has_derivative_cnj())
  let t3494 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@drule.match_mp(@derivatives.has_frechet_derivative_unique_at())(t3492)]))), t3493)
  let t3491 = @simp.rewrite_tac(@list.List([has_derivative_cnj()]))
  let t3490 = @tactics.exists_tac(@term_syntax.parse_term("cnj"))
  let t3489 = @tactics.match_mp_tac(@derivatives.has_derivative_imp_differentiable())
  let t3495 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@derivatives.differentiable_at_imp_differentiable_on()), @tactics.gen_tac), @tactics.disch_tac), t3489), t3490), t3491), t3494])
  let t3496 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@topology.open_univ(), @sets.subset_univ()])), @tactics.conj_tac), t3495), @tactics.all_tac])
  let t3486 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t3487 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t3488 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("cnj"), t3487, t3486]), complex_green_inside()))
  let t3502 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t3488), @tactics.ants_tac), t3496), @tactics.strip_tac), @tactics.conj_tac), t3497), t3498), t3499), t3500), t3501)
  has_path_integral_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) → path_integrable_on(cnj, g) && path_integral(g, cnj) == Cx(real_of_num(2)) * (ii * integral(inside(path_image(g)), (z : Cart[Real, 2]) => winding_number((g, z))))"), t3502))
}

///|
let has_path_integral_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_PATH_INTEGRAL_CNJ")

///|
/// `HAS_PATH_INTEGRAL_CNJ`
pub fn has_path_integral_cnj() -> @kernel.Thm {
  has_path_integral_cnj_c.get()
}

///|
/// COMPLEX_GREEN_CNJ
fn step_108() -> Unit raise {
  let t3525 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul(), @complexes.complex_mul_rid()]))
  let t3524 = @simp.asm_simp_tac(@list.List([@measure.integral_const_gen()]))
  let t3522 = @tactics.disch_then(fn(x3519 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3520 = @tactics.subst1_tac(x3519)
    fn(x3521 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3520(x3521)
    }
  })
  let t3523 = @list.List([@simp.asm_simp_tac(@list.List([])), t3522])
  let t3516 = @term_syntax.parse_term("inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))")
  let t3517 = @term_syntax.parse_term("(z : Cart[Real, 2]) => Cx(real_of_num(1))")
  let t3518 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z))"), t3517, t3516]), @integration.integral_eq()))
  let t3514 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3513 = @tactics.match_mp_tac(@paths.compact_path_image())
  let t3515 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_inside()), t3513), t3514), @tactics.all_tac])
  let t3512 = @tactics.subgoal_then(@term_syntax.parse_term("measurable(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))"), fn(x3509 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3510 = @tactics.assume_tac(x3509)
    fn(x3511 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3510(x3511)
    }
  })
  let t3508 = @tactics.replicate_tac(2, @tactics.ap_term_tac)
  let t3507 = @simp.asm_rewrite_tac(@list.List([]))
  let t3506 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t3505 = @simp.asm_rewrite_tac(@list.List([]))
  let t3504 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), has_path_integral_cnj()))
  let t3503 = @simp.rewrite_tac(@list.List([@cauchy.has_path_integral_integrable_integral()]))
  let t3526 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t3503), t3504), t3505), @tactics.strip_tac), @tactics.conj_tac), t3506), t3507), t3508), t3512), t3515), t3518), @tactics.ants_tac), t3523), t3524), t3525)
  complex_green_cnj_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) && (∀ z : Cart[Real, 2], IN(z, inside(path_image(g))) → winding_number((g, z)) == Cx(real_of_num(1))) → has_path_integral(cnj, Cx(real_of_num(2)) * (ii * Cx(measure(inside(path_image(g))))), g)"), t3526))
}

///|
let complex_green_cnj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_GREEN_CNJ")

///|
/// `COMPLEX_GREEN_CNJ`
pub fn complex_green_cnj() -> @kernel.Thm {
  complex_green_cnj_c.get()
}

///|
/// HAS_PATH_INTEGRAL_I_CLOSED
fn step_109() -> Unit raise {
  let t3555 = @simp.rewrite_tac(@list.List([@integration.integral_0(), @complexes.complex_mul_rzero(), @complexes.complex_vec_0()]))
  let t3554 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.complex_vec_0()])), @tactics.all_tac])
  let t3553 = @tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => Cx(real_of_num(0))) == ((z : Cart[Real, 2]) => vec(0))"), fn(x3550 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3551 = @tactics.subst1_tac(x3550)
    fn(x3552 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3551(x3552)
    }
  })
  let t3549 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rzero()]))
  let t3548 = @simp.rewrite_tac(@list.List([wirtinger_dbar_i()]))
  let t3547 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t3544 = @simp.rewrite_tac(@list.List([@equal.gsym(@cauchy.has_path_integral_integrable_integral())]))
  let t3545 = @tactics.then_tac(@tactics.disch_then(fn(x3543 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3540 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3541 = @tactics.mp_tac(x3540)
      fn(x3542 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3541(x3542)
      }
    })(@bool.conjunct2(x3543))
  }), t3544)
  let t3535 = @simp.rewrite_tac(@list.List([@topology.continuous_on_const()]))
  let t3536 = @tactics.then_tac(@tactics.conv_tac(@equal.depth_conv(@equal.beta_conv)), t3535)
  let t3534 = @simp.rewrite_tac(@list.List([@derivatives.has_derivative_id()]))
  let t3533 = @tactics.match_mp_tac(@derivatives.frechet_derivative_at())
  let t3537 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.conv_tac(@equal.sym_conv)), t3533), t3534), t3536])
  let t3532 = @tactics.subgoal_then(@term_syntax.parse_term("∀ z : Cart[Real, 2], frechet_derivative((x : Cart[Real, 2]) => x, at(z)) == ((h : Cart[Real, 2]) => h)"), fn(x3530 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3530
    @simp.rewrite_tac(@list.List([th]))
  })
  let t3538 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@trivia.i_def()]))), t3532), t3537)
  let t3539 = @list.List([@simp.rewrite_tac(@list.List([@trivia.i_def(), @derivatives.differentiable_on_id()])), t3538])
  let t3546 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@topology.open_univ(), @sets.subset_univ()])), @tactics.conj_tac), t3539), t3545])
  let t3527 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t3528 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t3529 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(I : (Cart[Real, 2]) -> Cart[Real, 2])"), t3528, t3527]), complex_green_inside()))
  let t3556 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t3529), @tactics.ants_tac), t3546), t3547), @tactics.ap_thm_tac), @tactics.ap_term_tac), t3548), t3549), t3553), t3554), t3555)
  has_path_integral_i_closed_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) → has_path_integral(I, Cx(real_of_num(0)), g)"), t3556))
}

///|
let has_path_integral_i_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_PATH_INTEGRAL_I_CLOSED")

///|
/// `HAS_PATH_INTEGRAL_I_CLOSED`
pub fn has_path_integral_i_closed() -> @kernel.Thm {
  has_path_integral_i_closed_c.get()
}

///|
/// COMPLEX_GREEN_I
fn step_110() -> Unit raise {
  let t3557 = @meson.meson_tac(@list.List([has_path_integral_i_closed()]))
  complex_green_i_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) && (∀ z : Cart[Real, 2], IN(z, inside(path_image(g))) → winding_number((g, z)) == Cx(real_of_num(1))) → has_path_integral(I, Cx(real_of_num(0)), g)"), t3557))
}

///|
let complex_green_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_GREEN_I")

///|
/// `COMPLEX_GREEN_I`
pub fn complex_green_i() -> @kernel.Thm {
  complex_green_i_c.get()
}

///|
/// COMPLEX_GREEN_AREA
fn step_111() -> Unit raise {
  let t3566 = @tactics.conv_tac(@complexes.complex_field)
  let t3565 = @tactics.undisch_tac(@term_syntax.parse_term("path_integral((g : (Cart[Real, Unit]) -> Cart[Real, 2]), cnj) == Cx(real_of_num(2)) * (ii * Cx(measure(inside(path_image(g)))))"))
  let t3564 = @simp.asm_rewrite_tac(@list.List([]))
  let t3563 = @simp.rewrite_tac(@list.List([@cauchy.has_path_integral_integrable_integral()]))
  let t3561 = @drule.match_mp(complex_green_cnj())
  let t3567 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x3562 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3558 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3559 = @tactics.mp_tac(x3558)
      fn(x3560 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3559(x3560)
      }
    })(t3561(x3562))
  })), t3563), @tactics.strip_tac), t3564), t3565), t3566)
  complex_green_area_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) && (∀ z : Cart[Real, 2], IN(z, inside(path_image(g))) → winding_number((g, z)) == Cx(real_of_num(1))) → path_integrable_on(cnj, g) && Cx(measure(inside(path_image(g)))) == -ii / Cx(real_of_num(2)) * path_integral(g, cnj)"), t3567))
}

///|
let complex_green_area_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_GREEN_AREA")

///|
/// `COMPLEX_GREEN_AREA`
pub fn complex_green_area() -> @kernel.Thm {
  complex_green_area_c.get()
}

///|
/// COMPLEX_GREEN_AREA_ABS
fn step_112() -> Unit raise {
  let t3616 = @simp.asm_rewrite_tac(@list.List([]))
  let t3615 = @tactics.match_mp_tac(@measure.measure_pos_le())
  let t3614 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → x == real_of_num(2) * abs(x) / real_of_num(2)")))
  let t3613 = @simp.rewrite_tac(@list.List([@complexes.complex_norm_cx()]))
  let t3612 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_rneg(), @vectors.norm_neg(), @complexes.complex_norm_mul(), @complexes.complex_norm_cx(), @complexes.complex_norm_ii(), @calc_int.real_abs_num(), @realax.real_mul_lid()]))
  let t3608 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lneg(), @complexes.complex_mul_lid()]))
  let t3607 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t3606 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul()]))
  let t3605 = @simp.asm_simp_tac(@list.List([@measure.integral_const_gen()]))
  let t3603 = @tactics.disch_then(fn(x3600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3601 = @tactics.subst1_tac(x3600)
    fn(x3602 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3601(x3602)
    }
  })
  let t3604 = @list.List([@simp.asm_simp_tac(@list.List([])), t3603])
  let t3598 = @term_syntax.parse_term("inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))")
  let t3599 = @term_syntax.parse_term("(z : Cart[Real, 2]) => -Cx(real_of_num(1))")
  let t3609 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z))"), t3599, t3598]), @integration.integral_eq())), @tactics.ants_tac), t3604), t3605), t3606), t3607), t3608), @tactics.all_tac])
  let t3610 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("integral(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))), (z : Cart[Real, 2]) => winding_number((g, z))) == -Cx(measure(inside(path_image(g))))"), fn(x3595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3596 = @tactics.subst1_tac(x3595)
    fn(x3597 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3596(x3597)
    }
  }), t3609)
  let t3593 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul(), @complexes.complex_mul_rid()]))
  let t3592 = @simp.asm_simp_tac(@list.List([@measure.integral_const_gen()]))
  let t3590 = @tactics.disch_then(fn(x3587 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3588 = @tactics.subst1_tac(x3587)
    fn(x3589 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3588(x3589)
    }
  })
  let t3591 = @list.List([@simp.asm_simp_tac(@list.List([])), t3590])
  let t3585 = @term_syntax.parse_term("inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))")
  let t3586 = @term_syntax.parse_term("(z : Cart[Real, 2]) => Cx(real_of_num(1))")
  let t3594 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z))"), t3586, t3585]), @integration.integral_eq())), @tactics.ants_tac), t3591), t3592), t3593), @tactics.all_tac])
  let t3611 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("integral(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))), (z : Cart[Real, 2]) => winding_number((g, z))) == Cx(measure(inside(path_image(g))))"), fn(x3582 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3583 = @tactics.subst1_tac(x3582)
    fn(x3584 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3583(x3584)
    }
  }), t3594), t3610])
  let t3581 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t3580 = @list.List([@meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()])), @tactics.all_tac])
  let t3579 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), @cauchy.simple_closed_path_winding_number_inside()))
  let t3577 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3576 = @tactics.match_mp_tac(@paths.compact_path_image())
  let t3578 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_inside()), t3576), t3577), @tactics.all_tac])
  let t3575 = @tactics.subgoal_then(@term_syntax.parse_term("measurable(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))"), fn(x3572 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3573 = @tactics.assume_tac(x3572)
    fn(x3574 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3573(x3574)
    }
  })
  let t3571 = @simp.asm_rewrite_tac(@list.List([]))
  let t3570 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t3569 = @simp.asm_rewrite_tac(@list.List([]))
  let t3568 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), has_path_integral_cnj()))
  let t3617 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t3568), t3569), @tactics.strip_tac), @tactics.conj_tac), t3570), t3571), t3575), t3578), t3579), @tactics.ants_tac), t3580), t3581), t3611), t3612), t3613), t3614), t3615), t3616)
  complex_green_area_abs_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && simple_path(g) && pathfinish(g) == pathstart(g) → path_integrable_on(cnj, g) && measure(inside(path_image(g))) == norm(path_integral(g, cnj)) / real_of_num(2)"), t3617))
}

///|
let complex_green_area_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_GREEN_AREA_ABS")

///|
/// `COMPLEX_GREEN_AREA_ABS`
pub fn complex_green_area_abs() -> @kernel.Thm {
  complex_green_area_abs_c.get()
}

///|
/// GREEN_THEOREM_CURL
fn step_113() -> Unit raise {
  let t3656 = @tactics.disch_then(fn(x3653 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3654 = @tactics.accept_tac(x3653)
    fn(x3655 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3654(x3655)
    }
  })
  let t3652 = @simp.simp_tac(@list.List([@calc_int.real_add_ac()]))
  let t3650 = @equal.gsym(@complexes.re_def())
  let t3651 = @simp.rewrite_tac(@list.List([@complexes.im(), @equal.gsym(@complexes.im_def()), t3650]))
  let t3649 = @tactics.disch_then(fn(x3648 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3645 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3646 = @tactics.mp_tac(x3645)
      fn(x3647 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3646(x3647)
      }
    })(@bool.conjunct2(x3648))
  })
  let t3643 = @equal.gsym(@complexes.re_def())
  let t3644 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @vectors.forall_2(), @equal.gsym(@complexes.im_def()), t3643]))
  let t3642 = @simp.gen_rewrite_tac(fn(x3641 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3635 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3636 = @equal.land_conv(x3635)
      fn(x3637 : @kernel.Term) -> @kernel.Thm raise {
        s3636(x3637)
      }
    })((fn(x3638 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3639 = @equal.once_depth_conv(x3638)
      fn(x3640 : @kernel.Term) -> @kernel.Thm raise {
        s3639(x3640)
      }
    })(x3641))
  }, @list.List([@integration.has_integral_componentwise()]))
  let t3634 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@complexes.complex_mul()]))(@cauchy.has_path_integral_v1())]))
  let t3632 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_lid()]))
  let t3631 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3633 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integral_eq()), t3631), @tactics.disch_tac), t3632), @tactics.all_tac])
  let t3630 = @tactics.subgoal_then(@term_syntax.parse_term("integral(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))), (z : Cart[Real, 2]) => winding_number((g, z)) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z)) == integral(inside(path_image(g)), wirtinger_dbar(f))"), fn(x3628 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3628
    @simp.rewrite_tac(@list.List([th]))
  })
  let t3627 = @simp.rewrite_tac(@list.List([@equal.gsym(@cauchy.has_path_integral_integrable_integral())]))
  let t3626 = @tactics.disch_then(fn(x3625 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3622 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3623 = @tactics.mp_tac(x3622)
      fn(x3624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3623(x3624)
      }
    })(@bool.conjunct2(x3625))
  })
  let t3621 = @simp.asm_rewrite_tac(@list.List([]))
  let t3618 = @term_syntax.parse_term("(u : (Cart[Real, 2]) -> Bool)")
  let t3619 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t3620 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t3619, t3618]), complex_green_inside()))
  let t3657 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t3620), t3621), t3626), t3627), t3630), t3633), t3634), t3642), t3644), t3649), t3651), t3652), t3656)
  let green_theorem_real = @tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ u : (Cart[Real, 2]) -> Bool, absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) && (∀ z : Cart[Real, 2], IN(z, inside(path_image(g))) → winding_number((g, z)) == Cx(real_of_num(1))) && open(u) && SUBSET(UNION(inside(path_image(g)), path_image(g)), u) && differentiable_on(f, u) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), u)) → has_integral((t : Cart[Real, Unit]) => lift(op_dollar(f(g(t)), 2) * op_dollar(vector_derivative(g, at(t)), 1) + op_dollar(f(g(t)), 1) * op_dollar(vector_derivative(g, at(t)), 2)), lift(Im(Cx(real_of_num(2)) * (ii * integral(inside(path_image(g)), wirtinger_dbar(f))))), interval([(vec(0), vec(1))]))"), t3657)
  let t3663 = @tactics.conv_tac(@calc_rat.real_field)
  let t3662 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @complexes.im_def()]))
  let t3661 = @simp.rewrite_tac(@list.List([@complexes.im_mul_cx(), @complexes.im_mul_ii(), @complexes.re_add(), @complexes.re_mul_ii()]))
  let t3660 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_assoc()]))
  let t3659 = @simp.rewrite_tac(@list.List([@complexes.im_mul_cx()]))
  let t3658 = @simp.rewrite_tac(@list.List([wirtinger_dbar_frechet(), @complexes.complex_div(), @equal.gsym(@complexes.cx_inv())]))
  let t3664 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t3658), t3659), t3660), t3661), t3662), t3663)
  let wirtinger_dbar_2i_im = @tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ z : Cart[Real, 2], Im(Cx(real_of_num(2)) * (ii * wirtinger_dbar(f, z))) == op_dollar(frechet_derivative(f, at(z), Cx(real_of_num(1))), 1) - op_dollar(frechet_derivative(f, at(z), ii), 2)"), t3664)
  let t3675 = @simp.rewrite_tac(@list.List([@vectors.linear_id()]))
  let t3674 = @tactics.match_mp_tac(@complexes.linear_complex_lmul())
  let t3673 = @tactics.match_mp_tac(@complexes.linear_complex_lmul())
  let t3672 = @simp.rewrite_tac(@list.List([@vectors.linear_lift_component()]))
  let t3671 = @tactics.match_mp_tac(@vectors.linear_compose())
  let t3669 = @simp.rewrite_tac(@list.List([@complexes.im_def()]))
  let t3668 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t3670 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm()])), @tactics.gen_tac), t3668), t3669), @tactics.all_tac])
  let t3676 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("((z : Cart[Real, 2]) => lift(Im(Cx(real_of_num(2)) * (ii * z)))) == o((x : Cart[Real, 2]) => lift(op_dollar(x, 2)), (z : Cart[Real, 2]) => Cx(real_of_num(2)) * (ii * z))"), fn(x3665 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3666 = @tactics.subst1_tac(x3665)
    fn(x3667 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3666(x3667)
    }
  }), t3670), t3671), t3672), t3673), t3674), t3675)
  let linear_lift_im_2i = @tactics.prove(@term_syntax.parse_term("linear((z : Cart[Real, 2]) => lift(Im(Cx(real_of_num(2)) * (ii * z))))"), t3676)
  let t3725 = @simp.asm_rewrite_tac(@list.List([]))
  let t3724 = @simp.rewrite_tac(@list.List([@integration.has_integral_integrable_integral()]))
  let t3720 = @simp.rewrite_tac(@list.List([wirtinger_dbar_2i_im]))
  let t3719 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t3718 = @tactics.match_mp_tac(@integration.integral_eq())
  let t3717 = @tactics.disch_then(fn(x3716 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3713 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3714 = @tactics.subst1_tac(x3713)
      fn(x3715 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3714(x3715)
      }
    })(@equal.sym(x3716))
  })
  let t3721 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@trivia.o_def()])), t3717), t3718), t3719), @tactics.disch_tac), @tactics.beta_tac), @tactics.ap_term_tac), t3720)
  let t3722 = @list.List([@simp.asm_rewrite_tac(@list.List([linear_lift_im_2i])), t3721])
  let t3711 = @term_syntax.parse_term("(z : Cart[Real, 2]) => lift(Im(Cx(real_of_num(2)) * (ii * z)))")
  let t3712 = @term_syntax.parse_term("inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))")
  let t3723 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]))"), t3712, t3711]), @integration.integral_linear())), @tactics.ants_tac), t3722), @tactics.all_tac])
  let t3710 = @tactics.subgoal_then(@term_syntax.parse_term("lift(Im(Cx(real_of_num(2)) * (ii * integral(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))), wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2])))))) == integral(inside(path_image(g)), (z : Cart[Real, 2]) => lift(op_dollar(frechet_derivative(f, at(z), Cx(real_of_num(1))), 1) - op_dollar(frechet_derivative(f, at(z), ii), 2)))"), fn(x3708 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3708
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t3707 = @simp.asm_rewrite_tac(@list.List([]))
  let t3704 = @term_syntax.parse_term("(u : (Cart[Real, 2]) -> Bool)")
  let t3705 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t3706 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t3705, t3704]), green_theorem_real))
  let t3703 = @simp.asm_rewrite_tac(@list.List([]))
  let t3699 = @simp.asm_rewrite_tac(@list.List([linear_lift_im_2i]))
  let t3700 = @tactics.then_tac(@tactics.match_mp_tac(@integration.integrable_linear()), t3699)
  let t3698 = @simp.rewrite_tac(@list.List([wirtinger_dbar_2i_im]))
  let t3697 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t3701 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.disch_tac), t3697), @tactics.ap_term_tac), t3698), t3700])
  let t3696 = @tactics.exists_tac(@term_syntax.parse_term("o((z : Cart[Real, 2]) => lift(Im(Cx(real_of_num(2)) * (ii * z))), wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2])))"))
  let t3702 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integrable_eq()), t3696), @tactics.conj_tac), t3701), @tactics.all_tac])
  let t3695 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((z : Cart[Real, 2]) => lift(op_dollar(frechet_derivative((f : (Cart[Real, 2]) -> Cart[Real, 2]), at(z), Cx(real_of_num(1))), 1) - op_dollar(frechet_derivative(f, at(z), ii), 2)), inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))"), fn(x3692 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3693 = @tactics.assume_tac(x3692)
    fn(x3694 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3693(x3694)
    }
  })
  let t3687 = @simp.simp_tac(@list.List([]))
  let t3688 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t3687])
  let t3685 = @term_syntax.parse_term("(u : (Cart[Real, 2]) -> Bool)")
  let t3686 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t3689 = @tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 2]) -> Cart[Real, 2])"), t3686, t3685]), complex_green_inside())), @tactics.ants_tac), t3688)
  let t3684 = @simp.asm_simp_tac(@list.List([@complexes.complex_mul_lid()]))
  let t3683 = @tactics.conv_tac(@equal.depth_conv(@equal.beta_conv))
  let t3690 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), @tactics.disch_tac), t3683), t3684), t3689])
  let t3682 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z)) * wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2]), z)"))
  let t3691 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integrable_eq()), t3682), @tactics.conj_tac), t3690), @tactics.all_tac])
  let t3681 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on(wirtinger_dbar((f : (Cart[Real, 2]) -> Cart[Real, 2])), inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))"), fn(x3678 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3679 = @tactics.assume_tac(x3678)
    fn(x3680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3679(x3680)
    }
  })
  let t3677 = @tactics.repeat_tac(@tactics.gen_tac)
  let t3726 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.complex_basis()])), t3677), @tactics.strip_tac), t3681), t3691), t3695), t3702), t3703), t3706), t3707), t3710), t3723), t3724), @tactics.strip_tac), t3725)
  green_theorem_curl_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 2]) -> Cart[Real, 2], ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ u : (Cart[Real, 2]) -> Bool, absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) && (∀ z : Cart[Real, 2], IN(z, inside(path_image(g))) → winding_number((g, z)) == Cx(real_of_num(1))) && open(u) && SUBSET(UNION(inside(path_image(g)), path_image(g)), u) && differentiable_on(f, u) && (∀ h : Cart[Real, 2], continuous_on((z : Cart[Real, 2]) => frechet_derivative(f, at(z), h), u)) → integrable_on((z : Cart[Real, 2]) => lift(op_dollar(frechet_derivative(f, at(z), basis(1)), 1) - op_dollar(frechet_derivative(f, at(z), basis(2)), 2)), inside(path_image(g))) && integrable_on((t : Cart[Real, Unit]) => lift(op_dollar(f(g(t)), 2) * op_dollar(vector_derivative(g, at(t)), 1) + op_dollar(f(g(t)), 1) * op_dollar(vector_derivative(g, at(t)), 2)), interval([(vec(0), vec(1))])) && integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => lift(op_dollar(f(g(t)), 2) * op_dollar(vector_derivative(g, at(t)), 1) + op_dollar(f(g(t)), 1) * op_dollar(vector_derivative(g, at(t)), 2))) == integral(inside(path_image(g)), (z : Cart[Real, 2]) => lift(op_dollar(frechet_derivative(f, at(z), basis(1)), 1) - op_dollar(frechet_derivative(f, at(z), basis(2)), 2)))"), t3726))
}

///|
let green_theorem_curl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GREEN_THEOREM_CURL")

///|
/// `GREEN_THEOREM_CURL`
pub fn green_theorem_curl() -> @kernel.Thm {
  green_theorem_curl_c.get()
}

///|
/// GREEN_AREA
fn step_114() -> Unit raise {
  let t3765 = @tactics.first_assum(fn(x3762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3763 = @tactics.accept_tac(x3762)
    fn(x3764 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3763(x3764)
    }
  })
  let t3761 = @tactics.match_mp_tac(@integration.has_integral_add())
  let t3760 = @tactics.match_mp_tac(@integration.has_integral_cmul())
  let t3759 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_add_rid(), @equal.gsym(@vectors.lift_cmul()), @vectors.lift_eq()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3758 = @tactics.subgoal_then(@term_syntax.parse_term("lift(measure(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))) == op_pct(inv(real_of_num(2)), lift(real_of_num(2) * measure(inside(path_image(g)))) + vec(0))"), fn(x3755 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3756 = @tactics.subst1_tac(x3755)
    fn(x3757 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3756(x3757)
    }
  })
  let t3753 = @equal.gsym(@vectors.lift_cmul())
  let t3754 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_add()), t3753]))), @tactics.ap_term_tac), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3752 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], lift(Re((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * Im(vector_derivative(g, at(t)))) == op_pct(inv(real_of_num(2)), lift(Re(g(t)) * Im(vector_derivative(g, at(t))) + -Im(g(t)) * Re(vector_derivative(g, at(t)))) + lift(Re(g(t)) * Im(vector_derivative(g, at(t))) + Im(g(t)) * Re(vector_derivative(g, at(t)))))"), fn(x3750 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3750
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t3749 = @tactics.disch_then(fn(x3746 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3746
    let b = @bool.conjunct2(@bool.conjunct1(th))
    let d = @bool.conjunct2(@bool.conjunct2(th))
    let t3748 = @tactics.assume_tac(d)
    @tactics.then_tac(@tactics.assume_tac(b), t3748)
  })
  let t3745 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @complexes.complex_vec_0()]))
  let t3744 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @vectors.lift_num()]))
  let t3743 = @simp.rewrite_tac(@list.List([@complexes.re(), @complexes.im(), @complexes.re_ii(), @complexes.im_ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.im_mul_cx(), @complexes.re_mul_cx()]))
  let t3741 = @equal.gsym(@complexes.re_def())
  let t3742 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @vectors.forall_2(), @equal.gsym(@complexes.im_def()), t3741, @trivia.i_def()]))
  let t3740 = @simp.gen_rewrite_tac(fn(x3739 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3733 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3734 = @equal.land_conv(x3733)
      fn(x3735 : @kernel.Term) -> @kernel.Thm raise {
        s3734(x3735)
      }
    })((fn(x3736 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3737 = @equal.once_depth_conv(x3736)
      fn(x3738 : @kernel.Term) -> @kernel.Thm raise {
        s3737(x3738)
      }
    })(x3739))
  }, @list.List([@integration.has_integral_componentwise()]))
  let t3732 = @simp.rewrite_tac(@list.List([@complexes.re_cnj(), @complexes.im_cnj()]))
  let t3731 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@complexes.complex_mul()]))(@cauchy.has_path_integral_v1())]))
  let t3730 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t3729 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), complex_green_cnj()))
  let t3728 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), complex_green_i()))
  let t3727 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3766 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@integration.has_integral_integrable_integral())])), t3727), t3728), t3729), t3730), t3731), t3732), t3740), t3742), t3743), t3744), t3745), t3749), t3752), t3754), t3758), t3759), t3760), t3761), @tactics.conj_tac), t3765)
  green_area_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) && (∀ z : Cart[Real, 2], IN(z, inside(path_image(g))) → winding_number((g, z)) == Cx(real_of_num(1))) → integrable_on((t : Cart[Real, Unit]) => lift(op_dollar(g(t), 1) * op_dollar(vector_derivative(g, at(t)), 2)), interval([(vec(0), vec(1))])) && integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => lift(op_dollar(g(t), 1) * op_dollar(vector_derivative(g, at(t)), 2))) == lift(measure(inside(path_image(g))))"), t3766))
}

///|
let green_area_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GREEN_AREA")

///|
/// `GREEN_AREA`
pub fn green_area() -> @kernel.Thm {
  green_area_c.get()
}

///|
/// GREEN_AREA_ALT
fn step_115() -> Unit raise {
  let t3806 = @tactics.first_assum(fn(x3803 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3804 = @tactics.accept_tac(x3803)
    fn(x3805 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3804(x3805)
    }
  })
  let t3802 = @tactics.match_mp_tac(@integration.has_integral_sub())
  let t3801 = @tactics.match_mp_tac(@integration.has_integral_cmul())
  let t3799 = @equal.gsym(@vectors.lift_neg())
  let t3800 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_sub_rzero(), @equal.gsym(@vectors.lift_cmul()), t3799, @vectors.lift_eq()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3798 = @tactics.subgoal_then(@term_syntax.parse_term("-lift(measure(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))) == op_pct(-inv(real_of_num(2)), lift(real_of_num(2) * measure(inside(path_image(g)))) - vec(0))"), fn(x3795 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3796 = @tactics.subst1_tac(x3795)
    fn(x3797 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3796(x3797)
    }
  })
  let t3793 = @equal.gsym(@vectors.lift_cmul())
  let t3794 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_sub()), t3793]))), @tactics.ap_term_tac), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3792 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], lift(Re(vector_derivative((g : (Cart[Real, Unit]) -> Cart[Real, 2]), at(t))) * Im(g(t))) == op_pct(-inv(real_of_num(2)), lift(Re(g(t)) * Im(vector_derivative(g, at(t))) + -Im(g(t)) * Re(vector_derivative(g, at(t)))) - lift(Re(g(t)) * Im(vector_derivative(g, at(t))) + Im(g(t)) * Re(vector_derivative(g, at(t)))))"), fn(x3790 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3790
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t3789 = @tactics.disch_then(fn(x3786 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3786
    let b = @bool.conjunct2(@bool.conjunct1(th))
    let d = @bool.conjunct2(@bool.conjunct2(th))
    let t3788 = @tactics.assume_tac(d)
    @tactics.then_tac(@tactics.assume_tac(b), t3788)
  })
  let t3785 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @complexes.complex_vec_0()]))
  let t3784 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @vectors.lift_num()]))
  let t3783 = @simp.rewrite_tac(@list.List([@complexes.re(), @complexes.im(), @complexes.re_ii(), @complexes.im_ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.im_mul_cx(), @complexes.re_mul_cx()]))
  let t3781 = @equal.gsym(@complexes.re_def())
  let t3782 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @vectors.forall_2(), @equal.gsym(@complexes.im_def()), t3781, @trivia.i_def()]))
  let t3780 = @simp.gen_rewrite_tac(fn(x3779 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3773 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3774 = @equal.land_conv(x3773)
      fn(x3775 : @kernel.Term) -> @kernel.Thm raise {
        s3774(x3775)
      }
    })((fn(x3776 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3777 = @equal.once_depth_conv(x3776)
      fn(x3778 : @kernel.Term) -> @kernel.Thm raise {
        s3777(x3778)
      }
    })(x3779))
  }, @list.List([@integration.has_integral_componentwise()]))
  let t3772 = @simp.rewrite_tac(@list.List([@complexes.re_cnj(), @complexes.im_cnj()]))
  let t3771 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@complexes.complex_mul()]))(@cauchy.has_path_integral_v1())]))
  let t3770 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t3769 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), complex_green_cnj()))
  let t3768 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), complex_green_i()))
  let t3767 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3807 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@integration.has_integral_integrable_integral())])), t3767), t3768), t3769), t3770), t3771), t3772), t3780), t3782), t3783), t3784), t3785), t3789), t3792), t3794), t3798), t3800), t3801), t3802), @tactics.conj_tac), t3806)
  green_area_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && pathfinish(g) == pathstart(g) && (∀ z : Cart[Real, 2], IN(z, inside(path_image(g))) → winding_number((g, z)) == Cx(real_of_num(1))) → integrable_on((t : Cart[Real, Unit]) => lift(op_dollar(vector_derivative(g, at(t)), 1) * op_dollar(g(t), 2)), interval([(vec(0), vec(1))])) && integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => lift(op_dollar(vector_derivative(g, at(t)), 1) * op_dollar(g(t), 2))) == -lift(measure(inside(path_image(g))))"), t3807))
}

///|
let green_area_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GREEN_AREA_ALT")

///|
/// `GREEN_AREA_ALT`
pub fn green_area_alt() -> @kernel.Thm {
  green_area_alt_c.get()
}

///|
/// GREEN_AREA_ABS
fn step_116() -> Unit raise {
  let t3915 = @simp.asm_rewrite_tac(@list.List([]))
  let t3914 = @tactics.match_mp_tac(@measure.measure_pos_le())
  let t3913 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) == x")))
  let t3912 = @simp.rewrite_tac(@list.List([@vectors.norm_neg(), @vectors.norm_lift()]))
  let t3909 = @drule.match_mp(@integration.integral_unique())
  let t3911 = @tactics.first_assum(fn(x3910 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3906 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3907 = @tactics.subst1_tac(x3906)
      fn(x3908 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3907(x3908)
      }
    })(t3909(x3910))
  })
  let t3905 = @list.List([@meson.asm_meson_tac(@list.List([@integration.has_integral_integrable()])), @tactics.all_tac])
  let t3903 = @tactics.first_assum(fn(x3900 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3901 = @tactics.accept_tac(x3900)
    fn(x3902 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3901(x3902)
    }
  })
  let t3899 = @tactics.match_mp_tac(@integration.has_integral_add())
  let t3898 = @tactics.match_mp_tac(@integration.has_integral_cmul())
  let t3896 = @equal.gsym(@vectors.lift_neg())
  let t3897 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_add_rid(), @equal.gsym(@vectors.lift_cmul()), t3896, @vectors.lift_eq()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3895 = @tactics.subgoal_then(@term_syntax.parse_term("-lift(measure(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))) == op_pct(inv(real_of_num(2)), lift(real_of_num(2) * -measure(inside(path_image(g)))) + vec(0))"), fn(x3892 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3893 = @tactics.subst1_tac(x3892)
    fn(x3894 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3893(x3894)
    }
  })
  let t3890 = @equal.gsym(@vectors.lift_cmul())
  let t3891 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_add()), t3890]))), @tactics.ap_term_tac), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3904 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], lift(Re((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * Im(vector_derivative(g, at(t)))) == op_pct(inv(real_of_num(2)), lift(Re(g(t)) * Im(vector_derivative(g, at(t))) + -(Im(g(t)) * Re(vector_derivative(g, at(t))))) + lift(Re(g(t)) * Im(vector_derivative(g, at(t))) + Im(g(t)) * Re(vector_derivative(g, at(t)))))"), fn(x3888 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3888
    @simp.rewrite_tac(@list.List([th_1]))
  }), t3891), t3895), t3897), t3898), t3899), @tactics.conj_tac), t3903), @tactics.all_tac])
  let t3887 = @tactics.subgoal_then(@term_syntax.parse_term("has_integral((t : Cart[Real, Unit]) => lift(Re((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t)) * Im(vector_derivative(g, at(t)))), -lift(measure(inside(path_image(g)))), interval([(vec(0), vec(1))]))"), fn(x3884 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3885 = @tactics.assume_tac(x3884)
    fn(x3886 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3885(x3886)
    }
  })
  let t3883 = @tactics.disch_then(fn(x3880 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3880
    let c1 = @bool.conjunct1(th)
    let c2 = @bool.conjunct2(th)
    let b = @bool.conjunct2(c1)
    let d = @bool.conjunct2(c2)
    let t3882 = @tactics.assume_tac(d)
    @tactics.then_tac(@tactics.assume_tac(b), t3882)
  })
  let t3879 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @complexes.complex_vec_0(), @vectors.lift_neg()]))
  let t3878 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @vectors.lift_num(), @calc_int.real_neg_0(), @calc_int.real_mul_lneg()]))
  let t3877 = @simp.rewrite_tac(@list.List([@complexes.re(), @complexes.im(), @complexes.re_ii(), @complexes.im_ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.im_mul_cx(), @complexes.re_mul_cx(), @complexes.re_neg(), @complexes.im_neg(), @complexes.complex_mul_rneg()]))
  let t3875 = @equal.gsym(@complexes.re_def())
  let t3876 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @vectors.forall_2(), @equal.gsym(@complexes.im_def()), t3875, @trivia.i_def()]))
  let t3874 = @simp.gen_rewrite_tac(fn(x3873 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3867 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3868 = @equal.land_conv(x3867)
      fn(x3869 : @kernel.Term) -> @kernel.Thm raise {
        s3868(x3869)
      }
    })((fn(x3870 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3871 = @equal.once_depth_conv(x3870)
      fn(x3872 : @kernel.Term) -> @kernel.Thm raise {
        s3871(x3872)
      }
    })(x3873))
  }, @list.List([@integration.has_integral_componentwise()]))
  let t3866 = @simp.rewrite_tac(@list.List([@complexes.re_cnj(), @complexes.im_cnj()]))
  let t3865 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@complexes.complex_mul()]))(@cauchy.has_path_integral_v1())]))
  let t3864 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t3863 = @tactics.undisch_tac(@term_syntax.parse_term("has_path_integral(I, Cx(real_of_num(0)), (g : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t3862 = @tactics.undisch_tac(@term_syntax.parse_term("has_path_integral(cnj, Cx(real_of_num(2)) * (ii * -Cx(measure(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))))), g)"))
  let t3860 = @simp.asm_rewrite_tac(@list.List([]))
  let t3861 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(has_path_integral_i_closed()), t3860), @tactics.all_tac])
  let t3859 = @tactics.subgoal_then(@term_syntax.parse_term("has_path_integral(I, Cx(real_of_num(0)), (g : (Cart[Real, Unit]) -> Cart[Real, 2]))"), fn(x3856 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3857 = @tactics.assume_tac(x3856)
    fn(x3858 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3857(x3858)
    }
  })
  let t3854 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lneg(), @complexes.complex_mul_lid()]))
  let t3853 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t3852 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul()]))
  let t3851 = @simp.asm_simp_tac(@list.List([@measure.integral_const_gen()]))
  let t3849 = @tactics.disch_then(fn(x3846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3847 = @tactics.subst1_tac(x3846)
    fn(x3848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3847(x3848)
    }
  })
  let t3850 = @list.List([@simp.asm_simp_tac(@list.List([])), t3849])
  let t3843 = @term_syntax.parse_term("inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))")
  let t3844 = @term_syntax.parse_term("(z : Cart[Real, 2]) => -Cx(real_of_num(1))")
  let t3845 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z))"), t3844, t3843]), @integration.integral_eq()))
  let t3842 = @tactics.replicate_tac(2, @tactics.ap_term_tac)
  let t3841 = @simp.asm_rewrite_tac(@list.List([]))
  let t3840 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t3839 = @simp.asm_rewrite_tac(@list.List([]))
  let t3838 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), has_path_integral_cnj()))
  let t3855 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cauchy.has_path_integral_integrable_integral()])), t3838), t3839), @tactics.strip_tac), @tactics.conj_tac), t3840), t3841), t3842), t3845), @tactics.ants_tac), t3850), t3851), t3852), t3853), t3854), @tactics.all_tac])
  let t3837 = @tactics.subgoal_then(@term_syntax.parse_term("has_path_integral(cnj, Cx(real_of_num(2)) * (ii * -Cx(measure(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))))), g)"), fn(x3834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3835 = @tactics.assume_tac(x3834)
    fn(x3836 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3835(x3836)
    }
  })
  let t3832 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3831 = @tactics.match_mp_tac(@paths.compact_path_image())
  let t3833 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_inside()), t3831), t3832), @tactics.all_tac])
  let t3830 = @tactics.subgoal_then(@term_syntax.parse_term("measurable(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))"), fn(x3827 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3828 = @tactics.assume_tac(x3827)
    fn(x3829 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3828(x3829)
    }
  })
  let t3825 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3824 = @tactics.match_mp_tac(@paths.compact_path_image())
  let t3823 = @tactics.match_mp_tac(@measure.measurable_inside())
  let t3822 = @tactics.match_mp_tac(@measure.measure_pos_le())
  let t3821 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) == x")))
  let t3820 = @simp.rewrite_tac(@list.List([@vectors.norm_lift()]))
  let t3817 = @drule.match_mp(@integration.integral_unique())
  let t3819 = @tactics.first_assum(fn(x3818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3814 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3815 = @tactics.subst1_tac(x3814)
      fn(x3816 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3815(x3816)
      }
    })(t3817(x3818))
  })
  let t3813 = @list.List([@meson.asm_meson_tac(@list.List([@integration.has_integral_integrable()])), @tactics.all_tac])
  let t3812 = @simp.rewrite_tac(@list.List([@equal.gsym(@integration.has_integral_integrable_integral())]))
  let t3811 = @simp.asm_rewrite_tac(@list.List([]))
  let t3826 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), green_area())), t3811), t3812), @tactics.disch_tac), @tactics.conj_tac), t3813), t3819), t3820), t3821), t3822), t3823), t3824), t3825), @tactics.all_tac])
  let t3810 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t3809 = @list.List([@meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()])), @tactics.all_tac])
  let t3808 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), @cauchy.simple_closed_path_winding_number_inside()))
  let t3916 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t3808), @tactics.ants_tac), t3809), t3810), t3826), t3830), t3833), t3837), t3855), t3859), t3861), t3862), t3863), t3864), t3865), t3866), t3874), t3876), t3877), t3878), t3879), t3883), t3887), t3904), @tactics.conj_tac), t3905), t3911), t3912), t3913), t3914), t3915)
  green_area_abs_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && simple_path(g) && pathfinish(g) == pathstart(g) → integrable_on((t : Cart[Real, Unit]) => lift(op_dollar(g(t), 1) * op_dollar(vector_derivative(g, at(t)), 2)), interval([(vec(0), vec(1))])) && norm(integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => lift(op_dollar(g(t), 1) * op_dollar(vector_derivative(g, at(t)), 2)))) == measure(inside(path_image(g)))"), t3916))
}

///|
let green_area_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GREEN_AREA_ABS")

///|
/// `GREEN_AREA_ABS`
pub fn green_area_abs() -> @kernel.Thm {
  green_area_abs_c.get()
}

///|
/// GREEN_AREA_ABS_ALT
fn step_117() -> Unit raise {
  let t4024 = @simp.asm_rewrite_tac(@list.List([]))
  let t4023 = @tactics.match_mp_tac(@measure.measure_pos_le())
  let t4022 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) == x")))
  let t4021 = @simp.rewrite_tac(@list.List([@vectors.norm_lift()]))
  let t4018 = @drule.match_mp(@integration.integral_unique())
  let t4020 = @tactics.first_assum(fn(x4019 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x4015 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s4016 = @tactics.subst1_tac(x4015)
      fn(x4017 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s4016(x4017)
      }
    })(t4018(x4019))
  })
  let t4014 = @list.List([@meson.asm_meson_tac(@list.List([@integration.has_integral_integrable()])), @tactics.all_tac])
  let t4012 = @tactics.first_assum(fn(x4009 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4010 = @tactics.accept_tac(x4009)
    fn(x4011 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4010(x4011)
    }
  })
  let t4008 = @tactics.match_mp_tac(@integration.has_integral_sub())
  let t4007 = @tactics.match_mp_tac(@integration.has_integral_cmul())
  let t4005 = @equal.gsym(@vectors.lift_neg())
  let t4006 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_sub_rzero(), @equal.gsym(@vectors.lift_cmul()), t4005, @vectors.lift_eq()])), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4004 = @tactics.subgoal_then(@term_syntax.parse_term("lift(measure(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))) == op_pct(-inv(real_of_num(2)), lift(real_of_num(2) * -measure(inside(path_image(g)))) - vec(0))"), fn(x4001 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s4002 = @tactics.subst1_tac(x4001)
    fn(x4003 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s4002(x4003)
    }
  })
  let t3999 = @equal.gsym(@vectors.lift_cmul())
  let t4000 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_sub()), t3999]))), @tactics.ap_term_tac), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t4013 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], lift(Re(vector_derivative((g : (Cart[Real, Unit]) -> Cart[Real, 2]), at(t))) * Im(g(t))) == op_pct(-inv(real_of_num(2)), lift(Re(g(t)) * Im(vector_derivative(g, at(t))) + -(Im(g(t)) * Re(vector_derivative(g, at(t))))) - lift(Re(g(t)) * Im(vector_derivative(g, at(t))) + Im(g(t)) * Re(vector_derivative(g, at(t)))))"), fn(x3997 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3997
    @simp.rewrite_tac(@list.List([th_1]))
  }), t4000), t4004), t4006), t4007), t4008), @tactics.conj_tac), t4012), @tactics.all_tac])
  let t3996 = @tactics.subgoal_then(@term_syntax.parse_term("has_integral((t : Cart[Real, Unit]) => lift(Re(vector_derivative((g : (Cart[Real, Unit]) -> Cart[Real, 2]), at(t))) * Im(g(t))), lift(measure(inside(path_image(g)))), interval([(vec(0), vec(1))]))"), fn(x3993 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3994 = @tactics.assume_tac(x3993)
    fn(x3995 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3994(x3995)
    }
  })
  let t3992 = @tactics.disch_then(fn(x3989 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3989
    let c1 = @bool.conjunct1(th)
    let c2 = @bool.conjunct2(th)
    let b = @bool.conjunct2(c1)
    let d = @bool.conjunct2(c2)
    let t3991 = @tactics.assume_tac(d)
    @tactics.then_tac(@tactics.assume_tac(b), t3991)
  })
  let t3988 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @complexes.complex_vec_0(), @vectors.lift_neg()]))
  let t3987 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_mul_rzero(), @vectors.lift_num(), @calc_int.real_neg_0(), @calc_int.real_mul_lneg()]))
  let t3986 = @simp.rewrite_tac(@list.List([@complexes.re(), @complexes.im(), @complexes.re_ii(), @complexes.im_ii(), @complexes.re_cx(), @complexes.im_cx(), @complexes.im_mul_cx(), @complexes.re_mul_cx(), @complexes.re_neg(), @complexes.im_neg(), @complexes.complex_mul_rneg()]))
  let t3984 = @equal.gsym(@complexes.re_def())
  let t3985 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @vectors.forall_2(), @equal.gsym(@complexes.im_def()), t3984, @trivia.i_def()]))
  let t3983 = @simp.gen_rewrite_tac(fn(x3982 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3976 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3977 = @equal.land_conv(x3976)
      fn(x3978 : @kernel.Term) -> @kernel.Thm raise {
        s3977(x3978)
      }
    })((fn(x3979 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3980 = @equal.once_depth_conv(x3979)
      fn(x3981 : @kernel.Term) -> @kernel.Thm raise {
        s3980(x3981)
      }
    })(x3982))
  }, @list.List([@integration.has_integral_componentwise()]))
  let t3975 = @simp.rewrite_tac(@list.List([@complexes.re_cnj(), @complexes.im_cnj()]))
  let t3974 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@complexes.complex_mul()]))(@cauchy.has_path_integral_v1())]))
  let t3973 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t3972 = @tactics.undisch_tac(@term_syntax.parse_term("has_path_integral(I, Cx(real_of_num(0)), (g : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t3971 = @tactics.undisch_tac(@term_syntax.parse_term("has_path_integral(cnj, Cx(real_of_num(2)) * (ii * -Cx(measure(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))))), g)"))
  let t3969 = @simp.asm_rewrite_tac(@list.List([]))
  let t3970 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(has_path_integral_i_closed()), t3969), @tactics.all_tac])
  let t3968 = @tactics.subgoal_then(@term_syntax.parse_term("has_path_integral(I, Cx(real_of_num(0)), (g : (Cart[Real, Unit]) -> Cart[Real, 2]))"), fn(x3965 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3966 = @tactics.assume_tac(x3965)
    fn(x3967 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3966(x3967)
    }
  })
  let t3963 = @simp.rewrite_tac(@list.List([@complexes.complex_mul_lneg(), @complexes.complex_mul_lid()]))
  let t3962 = @simp.once_rewrite_tac(@list.List([@complexes.complex_mul_sym()]))
  let t3961 = @simp.rewrite_tac(@list.List([@complexes.complex_cmul()]))
  let t3960 = @simp.asm_simp_tac(@list.List([@measure.integral_const_gen()]))
  let t3958 = @tactics.disch_then(fn(x3955 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3956 = @tactics.subst1_tac(x3955)
    fn(x3957 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3956(x3957)
    }
  })
  let t3959 = @list.List([@simp.asm_simp_tac(@list.List([])), t3958])
  let t3952 = @term_syntax.parse_term("inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))")
  let t3953 = @term_syntax.parse_term("(z : Cart[Real, 2]) => -Cx(real_of_num(1))")
  let t3954 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, 2]) => winding_number(((g : (Cart[Real, Unit]) -> Cart[Real, 2]), z))"), t3953, t3952]), @integration.integral_eq()))
  let t3951 = @tactics.replicate_tac(2, @tactics.ap_term_tac)
  let t3950 = @simp.asm_rewrite_tac(@list.List([]))
  let t3949 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t3948 = @simp.asm_rewrite_tac(@list.List([]))
  let t3947 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), has_path_integral_cnj()))
  let t3964 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@cauchy.has_path_integral_integrable_integral()])), t3947), t3948), @tactics.strip_tac), @tactics.conj_tac), t3949), t3950), t3951), t3954), @tactics.ants_tac), t3959), t3960), t3961), t3962), t3963), @tactics.all_tac])
  let t3946 = @tactics.subgoal_then(@term_syntax.parse_term("has_path_integral(cnj, Cx(real_of_num(2)) * (ii * -Cx(measure(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))))), g)"), fn(x3943 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3944 = @tactics.assume_tac(x3943)
    fn(x3945 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3944(x3945)
    }
  })
  let t3941 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3940 = @tactics.match_mp_tac(@paths.compact_path_image())
  let t3942 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_inside()), t3940), t3941), @tactics.all_tac])
  let t3939 = @tactics.subgoal_then(@term_syntax.parse_term("measurable(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))"), fn(x3936 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3937 = @tactics.assume_tac(x3936)
    fn(x3938 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3937(x3938)
    }
  })
  let t3934 = @meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()]))
  let t3933 = @tactics.match_mp_tac(@paths.compact_path_image())
  let t3932 = @tactics.match_mp_tac(@measure.measurable_inside())
  let t3931 = @tactics.match_mp_tac(@measure.measure_pos_le())
  let t3930 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → abs(x) == x")))
  let t3929 = @simp.rewrite_tac(@list.List([@vectors.norm_neg(), @vectors.norm_lift()]))
  let t3926 = @drule.match_mp(@integration.integral_unique())
  let t3928 = @tactics.first_assum(fn(x3927 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3923 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3924 = @tactics.subst1_tac(x3923)
      fn(x3925 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3924(x3925)
      }
    })(t3926(x3927))
  })
  let t3922 = @list.List([@meson.asm_meson_tac(@list.List([@integration.has_integral_integrable()])), @tactics.all_tac])
  let t3921 = @simp.rewrite_tac(@list.List([@equal.gsym(@integration.has_integral_integrable_integral())]))
  let t3920 = @simp.asm_rewrite_tac(@list.List([]))
  let t3935 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), green_area_alt())), t3920), t3921), @tactics.disch_tac), @tactics.conj_tac), t3922), t3928), t3929), t3930), t3931), t3932), t3933), t3934), @tactics.all_tac])
  let t3919 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t3918 = @list.List([@meson.asm_meson_tac(@list.List([@measure.absolutely_continuous_imp_path()])), @tactics.all_tac])
  let t3917 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), @cauchy.simple_closed_path_winding_number_inside()))
  let t4025 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t3917), @tactics.ants_tac), t3918), t3919), t3935), t3939), t3942), t3946), t3964), t3968), t3970), t3971), t3972), t3973), t3974), t3975), t3983), t3985), t3986), t3987), t3988), t3992), t3996), t4013), @tactics.conj_tac), t4014), t4020), t4021), t4022), t4023), t4024)
  green_area_abs_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && simple_path(g) && pathfinish(g) == pathstart(g) → integrable_on((t : Cart[Real, Unit]) => lift(op_dollar(vector_derivative(g, at(t)), 1) * op_dollar(g(t), 2)), interval([(vec(0), vec(1))])) && norm(integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => lift(op_dollar(vector_derivative(g, at(t)), 1) * op_dollar(g(t), 2)))) == measure(inside(path_image(g)))"), t4025))
}

///|
let green_area_abs_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GREEN_AREA_ABS_ALT")

///|
/// `GREEN_AREA_ABS_ALT`
pub fn green_area_abs_alt() -> @kernel.Thm {
  green_area_abs_alt_c.get()
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
  step_105()
  step_106()
  step_107()
  step_108()
  step_109()
  step_110()
  step_111()
  step_112()
  step_113()
  step_114()
  step_115()
  step_116()
  step_117()
}
