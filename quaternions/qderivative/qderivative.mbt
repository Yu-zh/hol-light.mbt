// Translated from upstream Quaternions/qderivative.hl; edit this file directly.

///|
/// QUAT_HAS_DERIVATIVE_CONST
fn step_1() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([@derivatives.has_derivative_const(), @equal.gsym(@quaternion.quat_vec_0())]))
  quat_has_derivative_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[Cart[Real, N]], ∀ p : Cart[Real, 4], has_derivative((q : Cart[Real, N]) => p, (q : Cart[Real, N]) => Hx(real_of_num(0)), net)"), t1))
}

///|
let quat_has_derivative_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_HAS_DERIVATIVE_CONST")

///|
/// `QUAT_HAS_DERIVATIVE_CONST`
pub fn quat_has_derivative_const() -> @kernel.Thm {
  quat_has_derivative_const_c.get()
}

///|
/// QUAT_HAS_DERIVATIVE_RMUL
fn step_2() -> Unit raise {
  let t2 = @simp.simp_tac(@list.List([@derivatives.has_derivative_linear(), @quaternion.linear_quat_rmul()]))
  quat_has_derivative_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[Cart[Real, 4]], ∀ p : Cart[Real, 4], has_derivative((q : Cart[Real, 4]) => q * p, (q : Cart[Real, 4]) => q * p, net)"), t2))
}

///|
let quat_has_derivative_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_HAS_DERIVATIVE_RMUL")

///|
/// `QUAT_HAS_DERIVATIVE_RMUL`
pub fn quat_has_derivative_rmul() -> @kernel.Thm {
  quat_has_derivative_rmul_c.get()
}

///|
/// QUAT_HAS_DERIVATIVE_MUL_AT
fn step_3() -> Unit raise {
  let t4 = @simp.asm_rewrite_tac(@list.List([@derivatives.has_derivative_bilinear_at(), @quaternion.bilinear_quat_mul()]))
  let t3 = @tactics.match_mp_tac(@derivatives.has_derivative_bilinear_at())
  let t5 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3), t4)
  quat_has_derivative_mul_at_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 4]) -> Cart[Real, 4], ∀ f' : (Cart[Real, 4]) -> Cart[Real, 4], ∀ g : (Cart[Real, 4]) -> Cart[Real, 4], ∀ g' : (Cart[Real, 4]) -> Cart[Real, 4], ∀ q : Cart[Real, 4], has_derivative(f, f', at(q)) && has_derivative(g, g', at(q)) → has_derivative((x : Cart[Real, 4]) => f(x) * g(x), (x : Cart[Real, 4]) => f(q) * g'(x) + f'(x) * g(q), at(q))"), t5))
}

///|
let quat_has_derivative_mul_at_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_HAS_DERIVATIVE_MUL_AT")

///|
/// `QUAT_HAS_DERIVATIVE_MUL_AT`
pub fn quat_has_derivative_mul_at() -> @kernel.Thm {
  quat_has_derivative_mul_at_c.get()
}

///|
/// QUAT_HAS_DERIVATIVE_MUL_WITHIN
fn step_4() -> Unit raise {
  let t7 = @simp.asm_rewrite_tac(@list.List([@derivatives.has_derivative_bilinear_within(), @quaternion.bilinear_quat_mul()]))
  let t6 = @tactics.match_mp_tac(@derivatives.has_derivative_bilinear_within())
  let t8 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t6), t7)
  quat_has_derivative_mul_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 4]) -> Cart[Real, 4], ∀ f' : (Cart[Real, 4]) -> Cart[Real, 4], ∀ g : (Cart[Real, 4]) -> Cart[Real, 4], ∀ g' : (Cart[Real, 4]) -> Cart[Real, 4], ∀ q : Cart[Real, 4], ∀ s : (Cart[Real, 4]) -> Bool, has_derivative(f, f', within(at(q), s)) && has_derivative(g, g', within(at(q), s)) → has_derivative((x : Cart[Real, 4]) => f(x) * g(x), (x : Cart[Real, 4]) => f(q) * g'(x) + f'(x) * g(q), within(at(q), s))"), t8))
}

///|
let quat_has_derivative_mul_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_HAS_DERIVATIVE_MUL_WITHIN")

///|
/// `QUAT_HAS_DERIVATIVE_MUL_WITHIN`
pub fn quat_has_derivative_mul_within() -> @kernel.Thm {
  quat_has_derivative_mul_within_c.get()
}

///|
/// QUAT_HAS_DERIVATIVE_SQUARE
fn step_5() -> Unit raise {
  let t12 = @simp.rewrite_tac(@list.List([]))
  let t13 = @list.List([@simp.simp_tac(@list.List([@derivatives.has_derivative_bilinear_at(), @derivatives.has_derivative_id(), @quaternion.bilinear_quat_mul()])), t12])
  let t14 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.subgoal_then(@term_syntax.parse_term("has_derivative((x : Cart[Real, 4]) => ((q : Cart[Real, 4]) => q)(x) * ((q : Cart[Real, 4]) => q)(x), (d : Cart[Real, 4]) => ((q : Cart[Real, 4]) => q)((q0 : Cart[Real, 4])) * ((q : Cart[Real, 4]) => q)(d) + ((q : Cart[Real, 4]) => q)(d) * ((q : Cart[Real, 4]) => q)(q0), at(q0))"), fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s10 = @tactics.mp_tac(x9)
    fn(x11 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s10(x11)
    }
  })), t13)
  quat_has_derivative_square_c.set(@tactics.prove(@term_syntax.parse_term("∀ q0 : Cart[Real, 4], has_derivative((q : Cart[Real, 4]) => q * q, (q : Cart[Real, 4]) => q0 * q + q * q0, at(q0))"), t14))
}

///|
let quat_has_derivative_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_HAS_DERIVATIVE_SQUARE")

///|
/// `QUAT_HAS_DERIVATIVE_SQUARE`
pub fn quat_has_derivative_square() -> @kernel.Thm {
  quat_has_derivative_square_c.get()
}

///|
/// QUAT_HAS_DERIVATIVE_POW
fn step_6() -> Unit raise {
  let t34 = @simp.rewrite_tac(@list.List([]))
  let t31 = @drule.match_mp(@derivatives.has_derivative_bilinear_at())
  let t33 = @tactics.disch_then(fn(x32 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x28 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s29 = @tactics.mp_tac(x28)
      fn(x30 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s29(x30)
      }
    })(t31(x32))
  })
  let t27 = @tactics.hyp_tac(@quaternions_misc.mp_list_tac, "id ind_n")(@list.List([@quaternion.bilinear_quat_mul()]))
  let t35 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.label_tac("id", @bool.ispec(@term_syntax.parse_term("at((q0 : Cart[Real, 4]))"), @derivatives.has_derivative_id())), t27), t33), t34)
  let t25 = @equal.gsym(@quaternion.quat_mul_assoc())
  let t26 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) <= (n : Num) → SUC(n) - x == SUC(n - x)")), @quaternion.quat_pow(), t25]))
  let t24 = @tactics.repeat_tac(@tactics.strip_tac)
  let t23 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @class.fun_eq_thm()]))
  let t22 = @tactics.match_mp_tac(@vectors.vsum_eq())
  let t36 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.simp_tac(@list.List([@iterate.finite_numseg(), @equal.gsym(@quaternion.vsum_quat_lmul())]))), t22), t23), t24), t26), t35])
  let t21 = @tactics.subgoal_then(@term_syntax.parse_term("∀ q : Cart[Real, 4], vsum(op_dot_dot(1, (n : Num)), (i : Num) => pow((q0 : Cart[Real, 4]), SUC(n) - i) * (q * pow(q0, i - 1))) == q0 * vsum(op_dot_dot(1, n), (i : Num) => pow(q0, n - i) * (q * pow(q0, i - 1)))"), fn(x19 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x19
    @simp.rewrite_tac(@list.List([th]))
  })
  let t17 = @int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) - 1 == n"))
  let t18 = @simp.rewrite_tac(@list.List([@quaternion.quat_pow(), @vectors.vsum_clauses_numseg(), @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))")), @arith.sub_refl(), @quaternion.quat_mul_lid(), t17]))
  let t15 = @tactics.match_accept_tac(quat_has_derivative_const())
  let t16 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@quaternion.quat_pow(), @iterate.numseg_conv(@term_syntax.parse_term("op_dot_dot(1, 0)")), @vectors.vsum_clauses(), @quaternion.quat_vec_0()])), t15), @tactics.all_tac])
  let t37 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @quaternions_misc.induct_tac), t16), t18), t21), t36)
  quat_has_derivative_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ q0 : Cart[Real, 4], ∀ n : Num, has_derivative((q : Cart[Real, 4]) => pow(q, n), (q : Cart[Real, 4]) => vsum(op_dot_dot(1, n), (i : Num) => pow(q0, n - i) * (q * pow(q0, i - 1))), at(q0))"), t37))
}

///|
let quat_has_derivative_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_HAS_DERIVATIVE_POW")

///|
/// `QUAT_HAS_DERIVATIVE_POW`
pub fn quat_has_derivative_pow() -> @kernel.Thm {
  quat_has_derivative_pow_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
}
