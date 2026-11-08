// Translated from upstream WZ/wz.ml; edit this file directly.

///|
/// WZ/wz.ml:14
fn step_1() -> Unit raise {
  @printer.parse_as_infix("spow", (24L, "left"))
}

///|
/// spow
fn step_2() -> Unit raise {
  spow_c.set(@pair.new_definition(@term_syntax.parse_term("(spow : (Real, Real) -> Real)((x : Real), (y : Real)) == (if x == real_of_num(0) { real_of_num(0) } else { if x < real_of_num(0) { cos(y * pi) * rpow(-x, y) } else { rpow(x, y) } })")))
}

///|
let spow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("spow")

///|
/// `spow`
pub fn spow() -> @kernel.Thm {
  spow_c.get()
}

///|
/// SPOW_STEP_UP
fn step_3() -> Unit raise {
  let t6 = @simp.rewrite_tac(@list.List([@transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t7 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.rpow_add(), @calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) && !(x < real_of_num(0)) → real_of_num(0) < x"))])), t6)
  let t5 = @simp.rewrite_tac(@list.List([@transcendentals.cos_add(), @transcendentals.sin_pi(), @transcendentals.cos_pi()]))
  let t4 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((y : Real) + real_of_num(1)) * pi == y * pi + pi"))]))
  let t8 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.rpow_add(), @real.real_neg_gt0(), @transcendentals.rpow_pow(), @real.real_pow_1()])), t4), t5), @calc_rat.real_arith_tac), t7])
  let t3 = @simp.asm_rewrite_tac(@list.List([]))
  let t2 = @simp.asm_simp_tac(@list.List([spow(), @realarith.real_lt_refl(), @transcendentals.rpow_zero(), @calc_int.real_mul_rzero()]))
  let t1 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t9 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1), t2), @class.cond_cases_tac), t3), t8)
  spow_step_up_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, spow(x, y + real_of_num(1)) == spow(x, y) * x"), t9))
}

///|
let spow_step_up_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SPOW_STEP_UP")

///|
/// `SPOW_STEP_UP`
pub fn spow_step_up() -> @kernel.Thm {
  spow_step_up_c.get()
}

///|
/// SPOW_STEP_DOWN
fn step_4() -> Unit raise {
  let t20 = @simp.rewrite_tac(@list.List([@transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t21 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.rpow_sub(), @calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) && !(x < real_of_num(0)) → real_of_num(0) < x"))])), t20)
  let t19 = @tactics.conv_tac(@calc_rat.real_field)
  let t18 = @tactics.repeat_tac(@tactics.pop_assum(fn(x15 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s16 = @tactics.mp_tac(x15)
    fn(x17 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s16(x17)
    }
  }))
  let t14 = @simp.rewrite_tac(@list.List([@transcendentals.cos_sub(), @transcendentals.sin_pi(), @transcendentals.cos_pi()]))
  let t13 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((y : Real) - real_of_num(1)) * pi == y * pi - pi"))]))
  let t22 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@transcendentals.rpow_sub(), @real.real_neg_gt0(), @transcendentals.rpow_pow(), @real.real_pow_1()])), t13), t14), t18), t19), t21])
  let t12 = @simp.asm_rewrite_tac(@list.List([]))
  let t11 = @simp.asm_simp_tac(@list.List([spow(), @realarith.real_lt_refl(), @transcendentals.rpow_zero(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) / real_of_num(0) == real_of_num(0)"))]))
  let t10 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t23 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t10), t11), @class.cond_cases_tac), t12), t22)
  spow_step_down_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, spow(x, y - real_of_num(1)) == spow(x, y) / x"), t23))
}

///|
let spow_step_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SPOW_STEP_DOWN")

///|
/// `SPOW_STEP_DOWN`
pub fn spow_step_down() -> @kernel.Thm {
  spow_step_down_c.get()
}

///|
/// SPOW_EQ_0
fn step_5() -> Unit raise {
  let t27 = @simp.asm_rewrite_tac(@list.List([@transcendentals.rpow_eq_0(), @realarith.real_entire()]))
  let t26 = @simp.asm_rewrite_tac(@list.List([]))
  let t25 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t24 = @simp.rewrite_tac(@list.List([spow()]))
  let t28 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t24), t25), t26), @class.cond_cases_tac), t27), @calc_rat.asm_real_arith_tac)
  spow_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (spow(x, y) == real_of_num(0)) == (x == real_of_num(0) || x < real_of_num(0) && cos(y * pi) == real_of_num(0))"), t28))
}

///|
let spow_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SPOW_EQ_0")

///|
/// `SPOW_EQ_0`
pub fn spow_eq_0() -> @kernel.Thm {
  spow_eq_0_c.get()
}

///|
/// SPECIAL_REAL_FIELD_TAC
fn step_6() -> Unit raise {
  let inv_tm = @term_syntax.parse_term("real_inv")
  let t29 = @term_syntax.parse_term("real_div")
  let is_div : (@kernel.Term) -> Bool raise = fn(x31 : @kernel.Term) -> Bool raise {
    ((x30 : @kernel.Term) => @basics.is_binop(t29, x30))(x31)
  }
  let is_inv : (@kernel.Term) -> Bool raise = fn(x32 : @kernel.Term) -> Bool raise {
    let tm = x32
    ((is_div(tm) || (@kernel.is_comb(tm) && (@kernel.rator(tm) == inv_tm))) && !@calc_int.is_ratconst(@kernel.rand(tm)))
  }
  special_real_field_tac_c.set(fn(x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl, tm_1) = x33
    let (ant, con) = @basics.dest_imp(tm_1)
    let is_freeinv : (@kernel.Term) -> Bool raise = fn(x34 : @kernel.Term) -> Bool raise {
      let t = x34
      (is_inv(t) && @basics.free_in(t, tm_1))
    }
    let ivtms = @lib.setify(@basics.find_terms(is_freeinv, con))
    let itms = @lib.setify(@lib.map(@kernel.rand, @basics.find_terms(is_freeinv, con)))
    let hyps = @lib.map(fn(x35 : @kernel.Term) -> @kernel.Thm raise {
      let t_1 = x35
      @bool.spec(t_1, @real.real_mul_rinv())
    }, itms)
    let aths = @bool.conjuncts_rule(@kernel.assume_rule(ant))
    let pths = @lib.map(fn(x36 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x36
      @lib.tryfind((x37 : @kernel.Thm) => @bool.mp(th, x37), aths)
    }, hyps)
    let gvs = @lib.map(fn(x40 : @kernel.Term) -> @kernel.Term raise {
      (fn(x38 : @kernel.HolType) -> @kernel.Term raise {
        @basics.genvar(x38)
      })((fn(x39 : @kernel.Term) -> @kernel.HolType raise {
        @kernel.type_of(x39)
      })(x40))
    }, itms)
    let t48 = @tactics.conv_tac(@calc_rat.real_ring)
    let t47 = @tactics.map_every(fn(x44 : (@kernel.Term, @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s45 = @tactics.spec_tac(x44.0, x44.1)
      fn(x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s45(x46)
      }
    }, @lib.zip(ivtms, gvs))
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.map_every(fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s42 = @tactics.mp_tac(x41)
      fn(x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s42(x43)
      }
    }, pths)), t47), t48)((asl, tm_1))
  })
}

///|
let special_real_field_tac_c : @lib.Cell[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise] = @lib.Cell::new("SPECIAL_REAL_FIELD_TAC")

///|
/// `SPECIAL_REAL_FIELD_TAC`
pub fn special_real_field_tac(x : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  (special_real_field_tac_c.get())(x)
}

///|
/// rfact
fn step_7() -> Unit raise {
  rfact_c.set(@pair.new_definition(@term_syntax.parse_term("(rfact : (Real) -> Real)((x : Real)) == gamma(x + real_of_num(1))")))
}

///|
let rfact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("rfact")

///|
/// `rfact`
pub fn rfact() -> @kernel.Thm {
  rfact_c.get()
}

///|
/// rbinom
fn step_8() -> Unit raise {
  rbinom_c.set(@pair.new_definition(@term_syntax.parse_term("(rbinom : ((Real, Real)) -> Real)(((n : Real), (k : Real))) == rfact(n) / (rfact(k) * rfact(n - k))")))
}

///|
let rbinom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("rbinom")

///|
/// `rbinom`
pub fn rbinom() -> @kernel.Thm {
  rbinom_c.get()
}

///|
/// RFACT_STEP_UP
fn step_9() -> Unit raise {
  let t53 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) == -real_of_num(1)) == (x + real_of_num(1) == real_of_num(0))"))]))
  let t52 = @simp.gen_rewrite_tac(fn(x49 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s50 = @equal.land_conv(x49)
    fn(x51 : @kernel.Term) -> @kernel.Thm raise {
      s50(x51)
    }
  }, @list.List([@gamma.gamma_recurrence()]))
  let t54 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([rfact()]))), t52), t53)
  rfact_step_up_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Real, rfact(n + real_of_num(1)) == (if n == -real_of_num(1) { real_of_num(1) } else { (n + real_of_num(1)) * rfact(n) })"), t54))
}

///|
let rfact_step_up_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RFACT_STEP_UP")

///|
/// `RFACT_STEP_UP`
pub fn rfact_step_up() -> @kernel.Thm {
  rfact_step_up_c.get()
}

///|
/// RFACT_STEP_DOWN
fn step_10() -> Unit raise {
  let t59 = @tactics.try_tac(@tactics.ap_term_tac)
  let t58 = @simp.gen_rewrite_tac(fn(x55 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s56 = @equal.land_conv(x55)
    fn(x57 : @kernel.Term) -> @kernel.Thm raise {
      s56(x57)
    }
  }, @list.List([@gamma.gamma_recurrence_alt()]))
  let t60 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([rfact()]))), t58), @tactics.binop_tac), t59), @calc_rat.real_arith_tac)
  rfact_step_down_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Real, rfact(n - real_of_num(1)) == rfact(n) / n"), t60))
}

///|
let rfact_step_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RFACT_STEP_DOWN")

///|
/// `RFACT_STEP_DOWN`
pub fn rfact_step_down() -> @kernel.Thm {
  rfact_step_down_c.get()
}

///|
/// RBINOM_TOP_STEP
fn step_11() -> Unit raise {
  let t69 = @tactics.conv_tac(@calc_rat.real_field)
  let t68 = @tactics.repeat_tac(@tactics.pop_assum(fn(x65 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s66 = @tactics.mp_tac(x65)
    fn(x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s66(x67)
    }
  }))
  let t64 = @tactics.repeat_tac(@tactics.thenl(@class.cond_cases_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])))
  let t63 = @simp.rewrite_tac(@list.List([rfact_step_up()]))
  let t62 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) + real_of_num(1) - (k : Real) == n - k + real_of_num(1)"))]))
  let t61 = @simp.rewrite_tac(@list.List([rbinom()]))
  let t70 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t61), t62), t63), t64), t68), t69)
  rbinom_top_step_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Real, ∀ n : Real, !(n + real_of_num(1) == real_of_num(0)) && !(n + real_of_num(1) == k) → rbinom((n + real_of_num(1), k)) == (n + real_of_num(1)) / (n - k + real_of_num(1)) * rbinom((n, k))"), t70))
}

///|
let rbinom_top_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RBINOM_TOP_STEP")

///|
/// `RBINOM_TOP_STEP`
pub fn rbinom_top_step() -> @kernel.Thm {
  rbinom_top_step_c.get()
}

///|
/// RBINOM_BOTTOM_STEP
fn step_12() -> Unit raise {
  let t78 = @tactics.conv_tac(@calc_rat.real_field)
  let t77 = @tactics.repeat_tac(@tactics.pop_assum(fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s75 = @tactics.mp_tac(x74)
    fn(x76 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s75(x76)
    }
  }))
  let t73 = @simp.rewrite_tac(@list.List([rfact_step_up(), rfact_step_down()]))
  let t72 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) - ((k : Real) + real_of_num(1)) == n - k - real_of_num(1)"))]))
  let t71 = @simp.rewrite_tac(@list.List([rbinom()]))
  let t79 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t71), t72), t73), @class.cond_cases_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t77), t78)
  rbinom_bottom_step_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Real, ∀ n : Real, !(k + real_of_num(1) == real_of_num(0)) → rbinom((n, k + real_of_num(1))) == (n - k) / (k + real_of_num(1)) * rbinom((n, k))"), t79))
}

///|
let rbinom_bottom_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RBINOM_BOTTOM_STEP")

///|
/// `RBINOM_BOTTOM_STEP`
pub fn rbinom_bottom_step() -> @kernel.Thm {
  rbinom_bottom_step_c.get()
}

///|
/// RBINOM_TOP_STEP_DOWN
fn step_13() -> Unit raise {
  let t82 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv()]))
  let t81 = @simp.rewrite_tac(@list.List([rfact_step_down(), @calc_rat.real_arith(@term_syntax.parse_term("(n : Real) - real_of_num(1) - (k : Real) == n - k - real_of_num(1)"))]))
  let t80 = @simp.rewrite_tac(@list.List([rbinom()]))
  let t83 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t80), t81), t82), @calc_rat.real_arith_tac)
  rbinom_top_step_down_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Real, ∀ n : Real, rbinom((n - real_of_num(1), k)) == (n - k) / n * rbinom((n, k))"), t83))
}

///|
let rbinom_top_step_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RBINOM_TOP_STEP_DOWN")

///|
/// `RBINOM_TOP_STEP_DOWN`
pub fn rbinom_top_step_down() -> @kernel.Thm {
  rbinom_top_step_down_c.get()
}

///|
/// RBINOM_BOTTOM_STEP_DOWN
fn step_14() -> Unit raise {
  let t87 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv()]))
  let t86 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((n : Real) - (k : Real) == -real_of_num(1)) == (n + real_of_num(1) == k)"))]))
  let t85 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(n : Real) - ((k : Real) - real_of_num(1)) == n - k + real_of_num(1)")), rfact_step_up()]))
  let t84 = @simp.rewrite_tac(@list.List([rbinom(), rfact_step_down()]))
  let t88 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t84), t85), t86), t87), @calc_rat.real_arith_tac)
  rbinom_bottom_step_down_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Real, ∀ n : Real, !(n + real_of_num(1) == k) → rbinom((n, k - real_of_num(1))) == k / (n - k + real_of_num(1)) * rbinom((n, k))"), t88))
}

///|
let rbinom_bottom_step_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RBINOM_BOTTOM_STEP_DOWN")

///|
/// `RBINOM_BOTTOM_STEP_DOWN`
pub fn rbinom_bottom_step_down() -> @kernel.Thm {
  rbinom_bottom_step_down_c.get()
}

///|
/// RBINOM_STEP_BOTH_UP
fn step_15() -> Unit raise {
  let t90 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv()]))
  let t89 = @simp.simp_tac(@list.List([rfact_step_up(), @calc_rat.real_arith(@term_syntax.parse_term("((n : Real) == -(x : Real)) == (n + x == real_of_num(0))"))]))
  let t91 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([rbinom(), @calc_rat.real_arith(@term_syntax.parse_term("(n : Real) + real_of_num(1) - ((k : Real) + real_of_num(1)) == n - k"))])), t89), t90), @calc_rat.real_arith_tac)
  rbinom_step_both_up_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Real, ∀ n : Real, !(k + real_of_num(1) == real_of_num(0)) && !(n + real_of_num(1) == real_of_num(0)) → rbinom((n + real_of_num(1), k + real_of_num(1))) == (n + real_of_num(1)) / (k + real_of_num(1)) * rbinom((n, k))"), t91))
}

///|
let rbinom_step_both_up_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RBINOM_STEP_BOTH_UP")

///|
/// `RBINOM_STEP_BOTH_UP`
pub fn rbinom_step_both_up() -> @kernel.Thm {
  rbinom_step_both_up_c.get()
}

///|
/// RBINOM_STEP_BOTH_DOWN
fn step_16() -> Unit raise {
  let t93 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv()]))
  let t92 = @simp.rewrite_tac(@list.List([rfact_step_down()]))
  let t94 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([rbinom(), @calc_rat.real_arith(@term_syntax.parse_term("(n : Real) - real_of_num(1) - ((k : Real) - real_of_num(1)) == n - k"))])), t92), t93), @calc_rat.real_arith_tac)
  rbinom_step_both_down_c.set(@tactics.prove(@term_syntax.parse_term("∀ k : Real, ∀ n : Real, rbinom((n - real_of_num(1), k - real_of_num(1))) == k / n * rbinom((n, k))"), t94))
}

///|
let rbinom_step_both_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RBINOM_STEP_BOTH_DOWN")

///|
/// `RBINOM_STEP_BOTH_DOWN`
pub fn rbinom_step_both_down() -> @kernel.Thm {
  rbinom_step_both_down_c.get()
}

///|
/// LIM_RFACT
fn step_17() -> Unit raise {
  let t98 = @tactics.match_mp_tac(@gamma.real_continuous_atreal_gamma())
  let t97 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), @realanalysis.reallim_add(), @realanalysis.reallim_const()]))
  let t96 = @tactics.match_mp_tac(@bool.spec(@term_syntax.parse_term("gamma"), @realanalysis.reallim_real_continuous_function()))
  let t95 = @simp.rewrite_tac(@list.List([rfact(), @equal.gsym(@gamma.gamma_fact())]))
  let t99 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t95), t96), t97), t98), @calc_rat.real_arith_tac)
  lim_rfact_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ nn : (A) -> Real, ∀ n : Num, op_minus_minus_minus_gt(nn, real_of_num(n), net) → op_minus_minus_minus_gt((a : A) => rfact(nn(a)), real_of_num(FACT(n)), net)"), t99))
}

///|
let lim_rfact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_RFACT")

///|
/// `LIM_RFACT`
pub fn lim_rfact() -> @kernel.Thm {
  lim_rfact_c.get()
}

///|
/// LIM_INV_RFACT
fn step_18() -> Unit raise {
  let t128 = @simp.asm_simp_tac(@list.List([@gamma.real_continuous_atreal_recip_gamma(), @realanalysis.reallim_add(), @realanalysis.reallim_const()]))
  let t126 = @bool.spec(@term_syntax.parse_term("o(inv, gamma)"), @realanalysis.reallim_real_continuous_function())
  let t127 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@trivia.o_thm()]))(t126))
  let t129 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([rfact()])), t127), t128)
  let t125 = @simp.simp_tac(@list.List([@real.real_of_num_lt(), @real.real_of_num_sub(), @arith.le_1()]))
  let t122 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("-(x : Real) < real_of_num(0) → real_of_num(0) < x")))
  let t124 = @tactics.first_x_assum(fn(x123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s120 = @tactics.mp_tac(x119)
      fn(x121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s120(x121)
      }
    })(t122(x123))
  })
  let t118 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(-(x : Real) + real_of_num(1) + (y : Real) == real_of_num(0)) == (y == x - real_of_num(1))"))]))
  let t117 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.exists_tac(@term_syntax.parse_term("(m : Num) - 1"))])
  let t115 = @tactics.disj_cases_then(fn(x112 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s113 = @tactics.subst_all_tac(x112)
    fn(x114 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s113(x114)
    }
  })
  let t116 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(t115))
  let t109 = @simp.gen_rewrite_rule(fn(x108 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x108
  }, @list.List([@int.is_int()]))
  let t111 = @tactics.first_x_assum(fn(x110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x105 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s106 = @tactics.mp_tac(x105)
      fn(x107 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s106(x107)
      }
    })(t109(x110))
  })
  let t104 = @simp.rewrite_tac(@list.List([@gamma.gamma_eq_0(), @real.real_inv_eq_0()]))
  let t130 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t104), t111), t116), t117), t118), t124), t125), t129])
  let t103 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) == inv(gamma((x : Real) + real_of_num(1)))"), fn(x100 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s101 = @tactics.subst1_tac(x100)
    fn(x102 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s101(x102)
    }
  })
  let t131 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t103), t130)
  lim_inv_rfact_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ nn : (A) -> Real, ∀ x : Real, integer(x) && x < real_of_num(0) && op_minus_minus_minus_gt(nn, x, net) → op_minus_minus_minus_gt((a : A) => inv(rfact(nn(a))), real_of_num(0), net)"), t131))
}

///|
let lim_inv_rfact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_INV_RFACT")

///|
/// `LIM_INV_RFACT`
pub fn lim_inv_rfact() -> @kernel.Thm {
  lim_inv_rfact_c.get()
}

///|
/// LIM_RBINOM
fn step_19() -> Unit raise {
  let t149 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_of_num_le())])))
  let t148 = @simp.asm_simp_tac(@list.List([@floor.integer_closed(), @realanalysis.reallim_sub()]))
  let t147 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((n : Num)) - real_of_num((k : Num))"))
  let t150 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(lim_inv_rfact()), t147), t148), t149), @calc_rat.asm_real_arith_tac)
  let t146 = @simp.asm_simp_tac(@list.List([lim_rfact(), @realax.real_of_num_eq(), @arith.fact_nz()]))
  let t145 = @tactics.match_mp_tac(@realanalysis.reallim_inv())
  let t144 = @simp.asm_simp_tac(@list.List([lim_rfact()]))
  let t151 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_mul()), t144), t145), t146), t150])
  let t143 = @tactics.match_mp_tac(@realanalysis.reallim_mul())
  let t142 = @tactics.subst1_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) == real_of_num(FACT((n : Num))) * inv(real_of_num(FACT((k : Num)))) * real_of_num(0)")))
  let t152 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @realax.real_mul_assoc()])), t142), t143), @tactics.conj_tac), t151)
  let t141 = @simp.asm_simp_tac(@list.List([@realanalysis.reallim_sub(), @equal.gsym(@real.real_of_num_sub())]))
  let t140 = @tactics.match_mp_tac(lim_rfact())
  let t139 = @simp.asm_simp_tac(@list.List([@realax.real_of_num_eq(), @arith.fact_nz(), lim_rfact()]))
  let t138 = @tactics.match_mp_tac(@realanalysis.reallim_mul())
  let t137 = @simp.gen_rewrite_tac(fn(x134 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s135 = @equal.land_conv(x134)
    fn(x136 : @kernel.Term) -> @kernel.Thm raise {
      s135(x136)
    }
  }, @list.List([@realax.real_mul_sym()]))
  let t133 = @simp.asm_simp_tac(@list.List([@realarith.real_entire(), @realax.real_of_num_eq(), @arith.fact_nz(), lim_rfact()]))
  let t153 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_div()), t133), t137), t138), t139), t140), t141), t152])
  let t132 = @simp.rewrite_tac(@list.List([rbinom(), @binomial.real_of_num_binom()]))
  let t154 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t132), @class.cond_cases_tac), t153)
  lim_rbinom_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ nn : (A) -> Real, ∀ kk : (A) -> Real, ∀ n : Num, ∀ k : Num, op_minus_minus_minus_gt(nn, real_of_num(n), net) && op_minus_minus_minus_gt(kk, real_of_num(k), net) → op_minus_minus_minus_gt((a : A) => rbinom((nn(a), kk(a))), real_of_num(binom((n, k))), net)"), t154))
}

///|
let lim_rbinom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LIM_RBINOM")

///|
/// `LIM_RBINOM`
pub fn lim_rbinom() -> @kernel.Thm {
  lim_rbinom_c.get()
}

///|
/// REALLIM_SPOW
fn step_20() -> Unit raise {
  let t167 = @simp.simp_tac(@list.List([@realanalysis.reallim_rmul(), @realanalysis.reallim_atreal_id(), @realanalysis.real_continuous_at_cos()]))
  let t166 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("cos"), @realanalysis.reallim_real_continuous_function()))
  let t165 = @simp.rewrite_tac(@list.List([@metric.eventually_true()]))
  let t161 = @simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.reallim_compose_at())
  let t162 = @drule.match_mp(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(t161))
  let t164 = @tactics.first_x_assum(fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t162(x163))
  })
  let t160 = @simp.asm_simp_tac(@list.List([@realanalysis.reallim_rpow_compose(), @realanalysis.reallim_const(), @real.real_neg_gt0(), @calc_rat.real_arith(@term_syntax.parse_term("!((t : Real) == real_of_num(0)) && !(t < real_of_num(0)) → real_of_num(0) < t"))]))
  let t159 = @tactics.repeat_tac(@tactics.match_mp_tac(@realanalysis.reallim_mul()))
  let t158 = @simp.asm_rewrite_tac(@list.List([]))
  let t157 = @class.asm_cases_tac(@term_syntax.parse_term("(t : Real) < real_of_num(0)"))
  let t156 = @simp.asm_rewrite_tac(@list.List([spow(), @realanalysis.reallim_const()]))
  let t155 = @class.asm_cases_tac(@term_syntax.parse_term("(t : Real) == real_of_num(0)"))
  let t168 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t155), t156), @tactics.disch_tac), t157), t158), t159), t160), t164), t165), t166), t167)
  reallim_spow_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Real, ∀ l : Real, op_minus_minus_minus_gt(f, l, net) → op_minus_minus_minus_gt((x : A) => spow((t : Real), f(x)), spow(t, l), net)"), t168))
}

///|
let reallim_spow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALLIM_SPOW")

///|
/// `REALLIM_SPOW`
pub fn reallim_spow() -> @kernel.Thm {
  reallim_spow_c.get()
}

///|
/// REALLIM_SPOW_COMPOSE
fn step_21() -> Unit raise {
  let t209 = @simp.simp_tac(@list.List([@realanalysis.reallim_rmul(), @realanalysis.reallim_atreal_id(), @realanalysis.real_continuous_at_cos()]))
  let t208 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("cos"), @realanalysis.reallim_real_continuous_function()))
  let t207 = @simp.rewrite_tac(@list.List([@metric.eventually_true()]))
  let t203 = @simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.reallim_compose_at())
  let t204 = @drule.match_mp(@simp.rewrite_rule(@list.List([@trivia.o_def()]))(t203))
  let t206 = @tactics.first_x_assum(fn(x205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t204(x205))
  })
  let t202 = @simp.asm_simp_tac(@list.List([@realanalysis.reallim_rpow_compose(), @realanalysis.reallim_neg(), @real.real_neg_gt0()]))
  let t210 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_mul()), t202), t206), t207), t208), t209)
  let t201 = @simp.asm_rewrite_tac(@list.List([@real.real_neg_gt0()]))
  let t198 = @simp.rewrite_rule(@list.List([@realanalysis.tendsto_real()]))
  let t200 = @tactics.first_x_assum(fn(x199 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t198(x199))
  })
  let t197 = @simp.rewrite_tac(@list.List([]))
  let t196 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => abs((f : (A) -> Real)(x) - (l : Real)) < -l"))
  let t195 = @tactics.match_mp_tac(@metric.eventually_mono())
  let t194 = @simp.simp_tac(@list.List([spow(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < real_of_num(0) → !(x == real_of_num(0))"))]))
  let t193 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => (f : (A) -> Real)(x) < real_of_num(0)"))
  let t211 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.eventually_mono()), t193), t194), t195), t196), t197), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t200), t201), t210])
  let t192 = @simp.rewrite_tac(@list.List([]))
  let t212 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(x : A) => cos((g : (A) -> Real)(x) * pi) * rpow(-(f : (A) -> Real)(x), g(x))")), t192), @tactics.conj_tac), t211)
  let t189 = @simp.asm_rewrite_tac(@list.List([]))
  let t190 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_rpow_compose()), t189)
  let t188 = @simp.asm_rewrite_tac(@list.List([]))
  let t185 = @simp.rewrite_rule(@list.List([@realanalysis.tendsto_real()]))
  let t187 = @tactics.first_x_assum(fn(x186 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t185(x186))
  })
  let t184 = @simp.rewrite_tac(@list.List([]))
  let t183 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => abs((f : (A) -> Real)(x) - (l : Real)) < l"))
  let t182 = @tactics.match_mp_tac(@metric.eventually_mono())
  let t181 = @simp.simp_tac(@list.List([spow(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (x : Real) → !(x == real_of_num(0)) && !(x < real_of_num(0))"))]))
  let t180 = @tactics.exists_tac(@term_syntax.parse_term("(x : A) => real_of_num(0) < (f : (A) -> Real)(x)"))
  let t191 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.eventually_mono()), t180), t181), t182), t183), t184), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t187), t188), t190])
  let t179 = @simp.rewrite_tac(@list.List([]))
  let t213 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(x : A) => rpow((f : (A) -> Real)(x), (g : (A) -> Real)(x))")), t179), @tactics.conj_tac), t191), t212])
  let t178 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eventually())
  let t177 = @simp.asm_rewrite_tac(@list.List([]))
  let t176 = @simp.gen_rewrite_tac(fn(x173 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s174 = @equal.land_conv(x173)
    fn(x175 : @kernel.Term) -> @kernel.Thm raise {
      s174(x175)
    }
  }, @list.List([spow()]))
  let t169 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) → real_of_num(0) < x && !(x < real_of_num(0)) || x < real_of_num(0) && !(real_of_num(0) < x)")))
  let t170 = @tactics.disj_cases_then(@tactics.strip_assume_tac)
  let t172 = @tactics.first_assum(fn(x171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t170(t169(x171))
  })
  let t214 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t172), t176), t177), t178), t213)
  reallim_spow_compose_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Real, ∀ g : (A) -> Real, ∀ l : Real, ∀ m : Real, op_minus_minus_minus_gt(f, l, net) && op_minus_minus_minus_gt(g, m, net) && !(l == real_of_num(0)) → op_minus_minus_minus_gt((x : A) => spow(f(x), g(x)), spow(l, m), net)"), t214))
}

///|
let reallim_spow_compose_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REALLIM_SPOW_COMPOSE")

///|
/// `REALLIM_SPOW_COMPOSE`
pub fn reallim_spow_compose() -> @kernel.Thm {
  reallim_spow_compose_c.get()
}

///|
/// RFACT_EQ_0
fn step_22() -> Unit raise {
  let t216 = @meson.asm_meson_tac(@list.List([@floor.integer_closed(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (a : Real) - a == x"))]))
  let t217 = @list.List([@simp.asm_simp_tac(@list.List([@floor.integer_closed(), @floor.real_lt_integers()])), t216])
  let t215 = @class.asm_cases_tac(@term_syntax.parse_term("integer((x : Real))"))
  let t218 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([rfact(), @gamma.gamma_eq_0(), @equal.gsym(@floor.nonpositive_integer_alt())])), @tactics.gen_tac), t215), t217)
  rfact_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, (rfact(x) == real_of_num(0)) == (integer(x) && x < real_of_num(0))"), t218))
}

///|
let rfact_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RFACT_EQ_0")

///|
/// `RFACT_EQ_0`
pub fn rfact_eq_0() -> @kernel.Thm {
  rfact_eq_0_c.get()
}

///|
/// REAL_CONTINUOUS_AT_RFACT
fn step_23() -> Unit raise {
  let t244 = @simp.simp_tac(@list.List([@floor.integer_closed()]))
  let t241 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + real_of_num(1) + (n : Real) == real_of_num(0) → x == -(n + real_of_num(1))")))
  let t243 = @tactics.first_assum(fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x238 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s239 = @tactics.subst1_tac(x238)
      fn(x240 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s239(x240)
      }
    })(t241(x242))
  })
  let t237 = @tactics.disch_then(fn(x231 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x231
    let t236 = @tactics.assume_tac(th)
    @tactics.then_tac(@tactics.pop_assum(fn(x233 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s234 = @tactics.mp_tac(x233)
      fn(x235 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s234(x235)
      }
    }), t236)
  })
  let t230 = @tactics.match_mp_tac(@gamma.real_continuous_atreal_gamma())
  let t229 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_add(), @realanalysis.real_continuous_const(), @realanalysis.real_continuous_at_id()]))
  let t228 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_compose())
  let t227 = @simp.gen_rewrite_tac(fn(x224 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s225 = @equal.land_conv(x224)
    fn(x226 : @kernel.Term) -> @kernel.Thm raise {
      s225(x226)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t223 = @simp.rewrite_tac(@list.List([rfact()]))
  let t222 = @simp.gen_rewrite_tac(fn(x219 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s220 = @equal.land_conv(x219)
    fn(x221 : @kernel.Term) -> @kernel.Thm raise {
      s220(x221)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t245 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t222), t223), t227), t228), t229), t230), @tactics.gen_tac), t237), t243), t244), @calc_rat.real_arith_tac)
  real_continuous_at_rfact_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, !(integer(x) && x <= -real_of_num(1)) → real_continuous(rfact, atreal(x))"), t245))
}

///|
let real_continuous_at_rfact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_AT_RFACT")

///|
/// `REAL_CONTINUOUS_AT_RFACT`
pub fn real_continuous_at_rfact() -> @kernel.Thm {
  real_continuous_at_rfact_c.get()
}

///|
/// REAL_CONTINUOUS_AT_INV_RFACT
fn step_24() -> Unit raise {
  let t264 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_add(), @realanalysis.real_continuous_const(), @realanalysis.real_continuous_at_id(), @gamma.real_continuous_atreal_recip_gamma()]))
  let t263 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_compose())
  let t262 = @simp.rewrite_tac(@list.List([@trivia.o_assoc()]))
  let t261 = @simp.gen_rewrite_tac(fn(x260 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x254 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s255 = @equal.land_conv(x254)
      fn(x256 : @kernel.Term) -> @kernel.Thm raise {
        s255(x256)
      }
    })((fn(x257 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s258 = @equal.rand_conv(x257)
      fn(x259 : @kernel.Term) -> @kernel.Thm raise {
        s258(x259)
      }
    })(x260))
  }, @list.List([@equal.gsym(@trivia.o_def())]))
  let t253 = @simp.rewrite_tac(@list.List([rfact()]))
  let t265 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.gen_rewrite_tac(fn(x252 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x246 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s247 = @equal.land_conv(x246)
      fn(x248 : @kernel.Term) -> @kernel.Thm raise {
        s247(x248)
      }
    })((fn(x249 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s250 = @equal.rand_conv(x249)
      fn(x251 : @kernel.Term) -> @kernel.Thm raise {
        s250(x251)
      }
    })(x252))
  }, @list.List([@equal.gsym(@class.eta_ax())]))), t253), t261), t262), t263), t264)
  real_continuous_at_inv_rfact_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, real_continuous(o(inv, rfact), atreal(x))"), t265))
}

///|
let real_continuous_at_inv_rfact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_AT_INV_RFACT")

///|
/// `REAL_CONTINUOUS_AT_INV_RFACT`
pub fn real_continuous_at_inv_rfact() -> @kernel.Thm {
  real_continuous_at_inv_rfact_c.get()
}

///|
/// REAL_CONTINUOUS_RFACT_COMPOSE_WITHIN
fn step_25() -> Unit raise {
  let t270 = @simp.asm_simp_tac(@list.List([real_continuous_at_rfact()]))
  let t269 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t268 = @simp.asm_rewrite_tac(@list.List([]))
  let t267 = @tactics.match_mp_tac(@realanalysis.real_continuous_within_compose())
  let t266 = @simp.rewrite_tac(@list.List([@equal.gsym(@trivia.o_def())]))
  let t271 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t266), t267), t268), t269), t270)
  real_continuous_rfact_compose_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ nn : (Cart[Real, N]) -> Real, ∀ s : (Cart[Real, N]) -> Bool, ∀ z : Cart[Real, N], real_continuous(nn, within(at(z), s)) && !(integer(nn(z)) && nn(z) <= -real_of_num(1)) → real_continuous((x : Cart[Real, N]) => rfact(nn(x)), within(at(z), s))"), t271))
}

///|
let real_continuous_rfact_compose_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_RFACT_COMPOSE_WITHIN")

///|
/// `REAL_CONTINUOUS_RFACT_COMPOSE_WITHIN`
pub fn real_continuous_rfact_compose_within() -> @kernel.Thm {
  real_continuous_rfact_compose_within_c.get()
}

///|
/// REAL_CONTINUOUS_INV_RFACT_COMPOSE_WITHIN
fn step_26() -> Unit raise {
  let t276 = @simp.rewrite_tac(@list.List([real_continuous_at_inv_rfact()]))
  let t275 = @tactics.match_mp_tac(@realanalysis.real_continuous_atreal_withinreal())
  let t274 = @simp.asm_rewrite_tac(@list.List([]))
  let t273 = @tactics.match_mp_tac(@realanalysis.real_continuous_within_compose())
  let t272 = @simp.rewrite_tac(@list.List([@equal.gsym(@trivia.o_def()), @trivia.o_assoc()]))
  let t277 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t272), t273), t274), t275), t276)
  real_continuous_inv_rfact_compose_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ nn : (Cart[Real, N]) -> Real, ∀ s : (Cart[Real, N]) -> Bool, ∀ z : Cart[Real, N], real_continuous(nn, within(at(z), s)) → real_continuous((x : Cart[Real, N]) => inv(rfact(nn(x))), within(at(z), s))"), t277))
}

///|
let real_continuous_inv_rfact_compose_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_INV_RFACT_COMPOSE_WITHIN")

///|
/// `REAL_CONTINUOUS_INV_RFACT_COMPOSE_WITHIN`
pub fn real_continuous_inv_rfact_compose_within() -> @kernel.Thm {
  real_continuous_inv_rfact_compose_within_c.get()
}

///|
/// REAL_CONTINUOUS_RBINOM_COMPOSE_WITHIN
fn step_27() -> Unit raise {
  let t280 = @simp.asm_simp_tac(@list.List([real_continuous_inv_rfact_compose_within(), @realanalysis.real_continuous_mul(), @realanalysis.real_continuous_sub()]))
  let t281 = @list.List([@simp.asm_simp_tac(@list.List([real_continuous_rfact_compose_within()])), t280])
  let t279 = @tactics.match_mp_tac(@realanalysis.real_continuous_mul())
  let t278 = @simp.rewrite_tac(@list.List([rbinom(), @realax.real_div(), @real.real_inv_mul()]))
  let t282 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t278), t279), @tactics.conj_tac), t281)
  real_continuous_rbinom_compose_within_c.set(@tactics.prove(@term_syntax.parse_term("∀ nn : (Cart[Real, N]) -> Real, ∀ kk : (Cart[Real, N]) -> Real, ∀ s : (Cart[Real, N]) -> Bool, ∀ a : Cart[Real, N], real_continuous(nn, within(at(a), s)) && real_continuous(kk, within(at(a), s)) && !(integer(nn(a)) && nn(a) <= -real_of_num(1)) → real_continuous((x : Cart[Real, N]) => rbinom((nn(x), kk(x))), within(at(a), s))"), t282))
}

///|
let real_continuous_rbinom_compose_within_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_CONTINUOUS_RBINOM_COMPOSE_WITHIN")

///|
/// `REAL_CONTINUOUS_RBINOM_COMPOSE_WITHIN`
pub fn real_continuous_rbinom_compose_within() -> @kernel.Thm {
  real_continuous_rbinom_compose_within_c.get()
}

///|
/// ratpoly
fn step_28() -> Unit raise {
  ratpoly_c.set(@pair.new_definition(@term_syntax.parse_term("(ratpoly : (((Num) -> Num) -> Real) -> Bool)((p : ((Num) -> Num) -> Real)) == ((∀ m : (Num) -> Num, rational(p(m))) && FINITE({(m : (Num) -> Num) | !(p(m) == real_of_num(0))}) && (∀ m : (Num) -> Num, !(p(m) == real_of_num(0)) → FINITE({(i : Num) | !(m(i) == 0)})))")))
}

///|
let ratpoly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ratpoly")

///|
/// `ratpoly`
pub fn ratpoly() -> @kernel.Thm {
  ratpoly_c.get()
}

///|
/// COUNTABLE_RATPOLY
fn step_29() -> Unit raise {
  let t410 = @meson.asm_meson_tac(@list.List([]))
  let t409 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @theorems.unwind_thm1()]))
  let t405 = @term_syntax.parse_term("(f : (Num) -> Num)")
  let t408 = @tactics.first_x_assum(fn(x407 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x402 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s403 = @tactics.mp_tac(x402)
      fn(x404 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s403(x404)
      }
    })(((x406 : @kernel.Thm) => @bool.spec(t405, x406))(x407))
  })
  let t401 = @class.asm_cases_tac(@term_syntax.parse_term("(p : ((Num) -> Num) -> Real)((f : (Num) -> Num)) == real_of_num(0)"))
  let t400 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (Num) -> Num)"))
  let t399 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @pair.exists_pair_thm(), @pair.pair_eq(), @pair.forall_pair_thm(), @sets.in_elim_thm()]))
  let t398 = @simp.gen_rewrite_tac(fn(x395 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s396 = @equal.rand_conv(x395)
    fn(x397 : @kernel.Term) -> @kernel.Thm raise {
      s396(x397)
    }
  }, @list.List([@class.fun_eq_thm()]))
  let t394 = @simp.asm_simp_tac(@list.List([@sets.set_of_list_of_set(), @sets.finite_image()]))
  let t390 = @term_syntax.parse_term("(set_of_list : (List[((Num) -> Num, Real)], ((Num) -> Num, Real)) -> Bool)")
  let t393 = @tactics.first_x_assum(fn(x392 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x387 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s388 = @tactics.mp_tac(x387)
      fn(x389 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s388(x389)
      }
    })(((x391 : @kernel.Thm) => @equal.ap_term(t390, x391))(x392))
  })
  let t385 = @term_syntax.parse_term("(q : ((Num) -> Num) -> Real)")
  let t386 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : ((Num) -> Num) -> Real)"), t385]))
  let t384 = @list.List([@simp.simp_tac(@list.List([@sets.in_()])), @tactics.all_tac])
  let t383 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), @sets.in_cross(), @sets.in_elim_thm()]))
  let t382 = @simp.simp_tac(@list.List([@sets.mem_list_of_set(), @sets.finite_image()]))
  let t381 = @tactics.exists_tac(@term_syntax.parse_term("(p : ((Num) -> Num) -> Real) => list_of_set(IMAGE((m : (Num) -> Num) => (m, p(m)), {(m : (Num) -> Num) | !(p(m) == real_of_num(0))}))"))
  let t380 = @simp.rewrite_tac(@list.List([@sets.le_c(), @sets.in_elim_thm()]))
  let t377 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@card.card_le_trans()))
  let t374 = @drule.match_mp(@card.card_eq_imp_le())
  let t376 = @tactics.disch_then(fn(x375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s372 = @tactics.mp_tac(x371)
      fn(x373 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s372(x373)
      }
    })(t374(x375))
  })
  let t368 = @drule.match_mp(@card.card_eq_trans())
  let t370 = @tactics.disch_then(fn(x369 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s366 = @tactics.mp_tac(x365)
      fn(x367 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s366(x367)
      }
    })(t368(x369))
  })
  let t364 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.imp_conj_alt())]))
  let t363 = @tactics.pop_assum(fn(x360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s361 = @tactics.mp_tac(x360)
    fn(x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s361(x362)
    }
  })
  let t359 = @tactics.disch_then(fn(x358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t357 = @simp.simp_tac(@list.List([@sets.num_infinite()]))
  let t355 = @drule.match_mp(@card.card_infinite_cong())
  let t378 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s353 = @tactics.mp_tac(x352)
      fn(x354 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s353(x354)
      }
    })(t355(x356))
  }), t357), t359), t363), t364), t370), t376), t377)
  let t349 = @simp.simp_tac(@list.List([@sets.finite_restrict(), @sets.finite_sing()]))
  let t348 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _) && (P : (_) -> Bool)(x)} == {(x : _) | IN(x, {a}) && P(x)}"))]))
  let t347 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("!((if (x : _) == (a : _) { (c : _) } else { (z : _) }) == z) == (x == a && !(c == z))"))]))
  let t346 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => if i == 0 { (j : Num) } else { 0 }"))
  let t345 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t344 = @tactics.exists_tac(@term_syntax.parse_term("(m : (Num) -> Num) => m(0)"))
  let t350 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.le_c_v1(), @sets.in_univ(), @sets.in_elim_thm()])), t344), t345), t346), t347), t348), t349)
  let t341 = @simp.rewrite_tac(@list.List([@card.card_square_num()]))
  let t340 = @tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@card.card_eq_trans()))
  let t339 = @simp.rewrite_tac(@list.List([@sets.univ_not_empty(), @equal.gsym(@sets.infinite()), @sets.num_infinite()]))
  let t338 = @simp.rewrite_tac(@list.List([@equal.gsym(@card.mul_c_univ()), @sets.infinite(), @card.card_mul_finite_eq()]))
  let t332 = @drule.part_match(fn(x331 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x331))
  }, @card.card_eq_list())
  let t342 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@card.card_eq_imp_le()), fn(x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x336 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x334 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x333 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s329 = @tactics.mp_tac(x328)
            fn(x330 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s329(x330)
            }
          })(t332(x333))
        })(@equal.lhand(x334))
      })((fn(x335 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x335.1
      })(x336))
    })(x337)(x337)
  }), t338), t339), t340), t341)
  let t327 = @meson.asm_meson_tac(@list.List([]))
  let t326 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @theorems.unwind_thm1()]))
  let t322 = @term_syntax.parse_term("(i : Num)")
  let t325 = @tactics.first_x_assum(fn(x324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s320 = @tactics.mp_tac(x319)
      fn(x321 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s320(x321)
      }
    })(((x323 : @kernel.Thm) => @bool.spec(t322, x323))(x324))
  })
  let t318 = @class.asm_cases_tac(@term_syntax.parse_term("(m2 : (Num) -> Num)((i : Num)) == 0"))
  let t317 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t316 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @pair.exists_pair_thm(), @pair.pair_eq(), @pair.forall_pair_thm(), @sets.in_elim_thm()]))
  let t315 = @simp.gen_rewrite_tac(fn(x312 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s313 = @equal.rand_conv(x312)
    fn(x314 : @kernel.Term) -> @kernel.Thm raise {
      s313(x314)
    }
  }, @list.List([@class.fun_eq_thm()]))
  let t311 = @simp.asm_simp_tac(@list.List([@sets.set_of_list_of_set(), @sets.finite_image()]))
  let t307 = @term_syntax.parse_term("(set_of_list : (List[(Num, Num)], (Num, Num)) -> Bool)")
  let t310 = @tactics.first_x_assum(fn(x309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x304 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s305 = @tactics.mp_tac(x304)
      fn(x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s305(x306)
      }
    })(((x308 : @kernel.Thm) => @equal.ap_term(t307, x308))(x309))
  })
  let t303 = @simp.rewrite_tac(@list.List([]))
  let t301 = @term_syntax.parse_term("(m2 : (Num) -> Num)")
  let t302 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(m1 : (Num) -> Num)"), t301]))
  let t300 = @tactics.exists_tac(@term_syntax.parse_term("(m : (Num) -> Num) => list_of_set(IMAGE((i : Num) => (i, m(i)), {(i : Num) | !(m(i) == 0)}))"))
  let t343 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.le_c(), @sets.in_elim_thm(), @sets.in_univ()])), t300), t302), t303), @tactics.strip_tac), t310), t311), t315), t316), @tactics.disch_tac), t317), t318), t325), t326), t327), t342])
  let t299 = @term_syntax.parse_term("(UNIV : (List[(Num, Num)]) -> Bool)")
  let t351 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.trans_tac(@card.card_le_trans())(t299), @tactics.conj_tac), t343), t350])
  let t298 = @simp.rewrite_tac(@list.List([@equal.gsym(@card.card_le_antisym())]))
  let t297 = @simp.rewrite_tac(@list.List([@misc.card_eq_rational()]))
  let t296 = @tactics.match_mp_tac(@card.card_mul_cong())
  let t295 = @simp.rewrite_tac(@list.List([@card.card_square_num()]))
  let t293 = @term_syntax.parse_term("(op_star_us_c : ((Num) -> Bool, (Num) -> Bool, (Num, Num)) -> Bool)((UNIV : (Num) -> Bool), (UNIV : (Num) -> Bool))")
  let t294 = @tactics.trans_tac(@card.card_eq_trans())(t293)
  let t379 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.cross(), @equal.gsym(@card.mul_c())])), t294), t295), t296), t297), t298), @tactics.conj_tac), t351), t378])
  let t292 = @tactics.subgoal_then(@term_syntax.parse_term("(op_eq_us_c : ((((Num) -> Num, Real)) -> Bool, (Num) -> Bool) -> Bool)((CROSS : (((Num) -> Num) -> Bool, (Real) -> Bool, ((Num) -> Num, Real)) -> Bool)({(m : (Num) -> Num) | (FINITE : ((Num) -> Bool) -> Bool)({(i : Num) | !(m(i) == 0)})}, rational), (UNIV : (Num) -> Bool))"), fn(x289 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s290 = @tactics.assume_tac(x289)
    fn(x291 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s290(x291)
    }
  })
  let t288 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("CROSS({(m : (Num) -> Num) | FINITE({(i : Num) | !(m(i) == 0)})}, rational)"), @card.card_eq_list_gen()))
  let t287 = @simp.rewrite_tac(@list.List([@sets.countable(), @sets.ge_c()]))
  let t286 = @simp.rewrite_tac(@list.List([ratpoly()]))
  let t411 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x283 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s284 = @equal.rand_conv(x283)
    fn(x285 : @kernel.Term) -> @kernel.Thm raise {
      s284(x285)
    }
  }, @list.List([@equal.gsym(@class.eta_ax())])), t286), t287), t288), t292), t379), t380), t381), t382), t383), @tactics.conj_tac), t384), t386), @tactics.strip_tac), t393), t394), t398), t399), @tactics.disch_tac), t400), t401), t408), t409), t410)
  countable_ratpoly_c.set(@tactics.prove(@term_syntax.parse_term("COUNTABLE(ratpoly)"), t411))
}

///|
let countable_ratpoly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_RATPOLY")

///|
/// `COUNTABLE_RATPOLY`
pub fn countable_ratpoly() -> @kernel.Thm {
  countable_ratpoly_c.get()
}

///|
/// poly_eval
fn step_30() -> Unit raise {
  poly_eval_c.set(@pair.new_definition(@term_syntax.parse_term("(poly_eval : (((Num) -> Num) -> Real, (Num) -> Real) -> Real)((p : ((Num) -> Num) -> Real), (x : (Num) -> Real)) == sum(UNIV, (m : (Num) -> Num) => p(m) * product(UNIV, (i : Num) => pow(x(i), m(i))))")))
}

///|
let poly_eval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("poly_eval")

///|
/// `poly_eval`
pub fn poly_eval() -> @kernel.Thm {
  poly_eval_c.get()
}

///|
/// POLY_EVAL_RATPOLY
fn step_31() -> Unit raise {
  let t418 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @sets.subset_univ(), @realax.real_pow()]))
  let t417 = @tactics.match_mp_tac(@products.product_superset())
  let t416 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : (Num) -> Num)"))
  let t415 = @simp.asm_simp_tac(@list.List([@sets.subset_univ(), @sets.in_elim_thm(), @calc_int.real_mul_lzero()]))
  let t414 = @tactics.match_mp_tac(@iterate.sum_eq_superset())
  let t413 = @simp.rewrite_tac(@list.List([poly_eval()]))
  let t412 = @tactics.repeat_tac(@tactics.strip_tac)
  let t419 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([ratpoly()])), t412), t413), t414), t415), t416), @tactics.disch_tac), @tactics.ap_term_tac), t417), t418)
  poly_eval_ratpoly_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : ((Num) -> Num) -> Real, ∀ x : (Num) -> Real, ratpoly(p) → poly_eval(p, x) == sum({(m : (Num) -> Num) | !(p(m) == real_of_num(0))}, (m : (Num) -> Num) => p(m) * product({(i : Num) | !(m(i) == 0)}, (i : Num) => pow(x(i), m(i))))"), t419))
}

///|
let poly_eval_ratpoly_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLY_EVAL_RATPOLY")

///|
/// `POLY_EVAL_RATPOLY`
pub fn poly_eval_ratpoly() -> @kernel.Thm {
  poly_eval_ratpoly_c.get()
}

///|
/// ratpolyfun
fn step_32() -> Unit raise {
  ratpolyfun_c.set(@pair.new_definition(@term_syntax.parse_term("(ratpolyfun : ((Real) -> Bool, ((Real, Real)) -> Real) -> Bool)((s : (Real) -> Bool), (f : ((Real, Real)) -> Real)) == (∃ p : ((Num) -> Num) -> Real, ratpoly(p) && f == GABS((f : ((Real, Real)) -> Real) => ∀ x : Real, ∀ y : Real, GEQ(f((x, y)), poly_eval(p, (i : Num) => EL(i, CONS(x, CONS(y, list_of_set(s))))))))")))
}

///|
let ratpolyfun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ratpolyfun")

///|
/// `ratpolyfun`
pub fn ratpolyfun() -> @kernel.Thm {
  ratpolyfun_c.get()
}

///|
/// COUNTABLE_RATPOLYFUN
fn step_33() -> Unit raise {
  let t426 = @meson.meson_tac(@list.List([]))
  let t425 = @simp.rewrite_tac(@list.List([ratpolyfun()]))
  let t424 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t423 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t422 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image()]))
  let t421 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@card.countable_subset()))
  let t420 = @drule.match_mp(@card.countable_image())(countable_ratpoly())
  let t427 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(p : ((Num) -> Num) -> Real) => GABS((f : ((Real, Real)) -> Real) => ∀ x : Real, ∀ y : Real, GEQ(f((x, y)), poly_eval(p, (i : Num) => EL(i, CONS(x, CONS(y, list_of_set((s : (Real) -> Bool))))))))"), t420))), t421), t422), t423), t424), t425), t426)
  countable_ratpolyfun_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, COUNTABLE(ratpolyfun(s))"), t427))
}

///|
let countable_ratpolyfun_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_RATPOLYFUN")

///|
/// `COUNTABLE_RATPOLYFUN`
pub fn countable_ratpolyfun() -> @kernel.Thm {
  countable_ratpolyfun_c.get()
}

///|
/// RATPOLYFUN_CONST
fn step_34() -> Unit raise {
  let t440 = @simp.simp_tac(@list.List([@iterate.sum_delta(), @sets.in_univ(), @realax.real_pow(), @products.product_one(), @realarith.real_mul_rid()]))
  let t439 = @simp.rewrite_tac(@list.List([@class.cond_rand(), @class.cond_rator(), @calc_int.real_mul_lzero()]))
  let t438 = @simp.rewrite_tac(@list.List([poly_eval(), @pair.forall_pair_thm()]))
  let t441 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x437 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x437
  }, @list.List([@class.fun_eq_thm()])), t438), t439), t440)
  let t436 = @simp.asm_rewrite_tac(@list.List([@sets.empty_gspec(), @sets.finite_empty()]))
  let t442 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.cond_cases_tac), t436)
  let t435 = @simp.asm_rewrite_tac(@list.List([]))
  let t434 = @simp.rewrite_tac(@list.List([@sets.finite_sing(), @sets.subset(), @sets.in_elim_thm(), @sets.in_sing()]))
  let t433 = @tactics.exists_tac(@term_syntax.parse_term("{(i : Num) => 0}"))
  let t443 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t433), t434), @tactics.gen_tac), @class.cond_cases_tac), t435)
  let t432 = @simp.asm_rewrite_tac(@list.List([@floor.rational_closed()]))
  let t444 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.cond_cases_tac), t432), t443, t442, t441])
  let t431 = @tactics.repeat_tac(@tactics.conj_tac)
  let t430 = @simp.rewrite_tac(@list.List([]))
  let t429 = @tactics.exists_tac(@term_syntax.parse_term("(m : (Num) -> Num) => if m == ((i : Num) => 0) { (c : Real) } else { real_of_num(0) }"))
  let t428 = @simp.rewrite_tac(@list.List([ratpolyfun(), ratpoly()]))
  let t445 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t428), t429), t430), t431), t444)
  ratpolyfun_const_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ c : Real, rational(c) → ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ x : Real, ∀ y : Real, GEQ(f((x, y)), c)))"), t445))
}

///|
let ratpolyfun_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATPOLYFUN_CONST")

///|
/// `RATPOLYFUN_CONST`
pub fn ratpolyfun_const() -> @kernel.Thm {
  ratpolyfun_const_c.get()
}

///|
/// RATPOLYFUN_VAR
fn step_35() -> Unit raise {
  let t472 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1")), @lists.el(), @lists.hd(), @lists.tl()]))
  let t471 = @simp.simp_tac(@list.List([@products.product_delta(), @sets.in_univ(), @lists.el(), @lists.hd()]))
  let t470 = @simp.rewrite_tac(@list.List([@realax.real_pow(), @real.real_pow_1()]))
  let t469 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t468 = @simp.simp_tac(@list.List([@iterate.sum_delta(), @sets.in_univ(), @realax.real_mul_lid()]))
  let t467 = @simp.rewrite_tac(@list.List([@class.cond_rand(), @class.cond_rator(), @calc_int.real_mul_lzero()]))
  let t465 = @term_syntax.parse_term("(y : Real)")
  let t466 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Real)"), t465]))
  let t464 = @simp.rewrite_tac(@list.List([poly_eval(), @pair.forall_pair_thm()]))
  let t463 = @simp.gen_rewrite_tac(fn(x462 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x462
  }, @list.List([@class.fun_eq_thm()]))
  let t461 = @simp.rewrite_tac(@list.List([@sets.sing_gspec(), @sets.finite_sing()]))
  let t460 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("!(if (p : Bool) { false } else { true }) == p"))]))
  let t459 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t458 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t457 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t456 = @simp.simp_tac(@list.List([]))
  let t455 = @simp.rewrite_tac(@list.List([@sets.sing_gspec(), @sets.finite_sing()]))
  let t454 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("!(if (p : Bool) { false } else { true }) == p"))]))
  let t453 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t452 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t451 = @simp.rewrite_tac(@list.List([@floor.rational_closed(), @class.cond_id()]))
  let t450 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t449 = @simp.rewrite_tac(@list.List([]))
  let t447 = @tactics.exists_tac(@term_syntax.parse_term("(m : (Num) -> Num) => if m == ((i : Num) => if i == 1 { 1 } else { 0 }) { real_of_num(1) } else { real_of_num(0) }"))
  let t448 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(m : (Num) -> Num) => if m == ((i : Num) => if i == 0 { 1 } else { 0 }) { real_of_num(1) } else { real_of_num(0) }")), t447])
  let t446 = @simp.rewrite_tac(@list.List([ratpolyfun(), ratpoly()]))
  let t473 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t446), t448), t449), t450), t451), t452), t453), t454), t455), t456), t457), t458), t459), t460), t461), t463), t464), t466), t467), t468), t469), t470), t471), t472)
  ratpolyfun_var_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), n))) && ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), k)))"), t473))
}

///|
let ratpolyfun_var_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATPOLYFUN_VAR")

///|
/// `RATPOLYFUN_VAR`
pub fn ratpolyfun_var() -> @kernel.Thm {
  ratpolyfun_var_c.get()
}

///|
/// RATPOLYFUN_PARAMETER
fn step_36() -> Unit raise {
  let t511 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(n : Num) + 2 == SUC(SUC(n))")), @lists.el(), @lists.hd(), @lists.tl()]))
  let t510 = @simp.simp_tac(@list.List([@products.product_delta(), @sets.in_univ()]))
  let t509 = @simp.rewrite_tac(@list.List([@realax.real_pow(), @real.real_pow_1()]))
  let t508 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t507 = @simp.simp_tac(@list.List([@iterate.sum_delta(), @sets.in_univ(), @realax.real_mul_lid()]))
  let t506 = @simp.rewrite_tac(@list.List([@class.cond_rand(), @class.cond_rator(), @calc_int.real_mul_lzero()]))
  let t504 = @term_syntax.parse_term("(y : Real)")
  let t505 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Real)"), t504]))
  let t503 = @simp.rewrite_tac(@list.List([poly_eval(), @pair.forall_pair_thm()]))
  let t502 = @simp.gen_rewrite_tac(fn(x501 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x501
  }, @list.List([@class.fun_eq_thm()]))
  let t500 = @simp.rewrite_tac(@list.List([@sets.sing_gspec(), @sets.finite_sing()]))
  let t499 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("!(if (p : Bool) { false } else { true }) == p"))]))
  let t498 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t497 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t496 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t495 = @simp.simp_tac(@list.List([]))
  let t494 = @simp.rewrite_tac(@list.List([@sets.sing_gspec(), @sets.finite_sing()]))
  let t493 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("!(if (p : Bool) { false } else { true }) == p"))]))
  let t492 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t491 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t490 = @simp.rewrite_tac(@list.List([@floor.rational_closed(), @class.cond_id()]))
  let t489 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t488 = @simp.rewrite_tac(@list.List([]))
  let t487 = @tactics.exists_tac(@term_syntax.parse_term("(m : (Num) -> Num) => if m == ((i : Num) => if i == (n : Num) + 2 { 1 } else { 0 }) { real_of_num(1) } else { real_of_num(0) }"))
  let t486 = @simp.rewrite_tac(@list.List([ratpolyfun(), ratpoly()]))
  let t485 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x484 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x484))
  }))
  let t483 = @simp.asm_rewrite_tac(@list.List([@lists.mem_exists_el()]))
  let t480 = @drule.match_mp(@sets.mem_list_of_set())
  let t477 = @term_syntax.parse_term("(a : Real)")
  let t482 = @tactics.first_x_assum(fn(x481 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x479 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x474 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s475 = @tactics.mp_tac(x474)
        fn(x476 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s475(x476)
        }
      })(((x478 : @kernel.Thm) => @bool.spec(t477, x478))(x479))
    })(t480(x481))
  })
  let t512 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t482), t483), t485), t486), t487), t488), t489), t490), t491), t492), t493), t494), t495), t496), t497), t498), t499), t500), t502), t503), t505), t506), t507), t508), t509), t510), t511)
  ratpolyfun_parameter_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ a : Real, FINITE(s) && IN(a, s) → ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ x : Real, ∀ y : Real, GEQ(f((x, y)), a)))"), t512))
}

///|
let ratpolyfun_parameter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATPOLYFUN_PARAMETER")

///|
/// `RATPOLYFUN_PARAMETER`
pub fn ratpolyfun_parameter() -> @kernel.Thm {
  ratpolyfun_parameter_c.get()
}

///|
/// RATPOLYFUN_NEG
fn step_37() -> Unit raise {
  let t532 = @simp.asm_simp_tac(@list.List([@floor.rational_closed(), @real.real_neg_eq_0()]))
  let t531 = @simp.rewrite_tac(@list.List([ratpoly()]))
  let t530 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([ratpoly()])))
  let t529 = @simp.rewrite_tac(@list.List([poly_eval(), @calc_int.real_mul_lneg(), @iterate.sum_neg()]))
  let t528 = @tactics.exists_tac(@term_syntax.parse_term("(m : (Num) -> Num) => -(p : ((Num) -> Num) -> Real)(m)"))
  let t526 = @simp.simp_tac(@list.List([]))
  let t527 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t526)])
  let t525 = @tactics.subgoal_then(@term_syntax.parse_term("∃ r : ((Num) -> Num) -> Real, ratpoly(r) && (∀ xs : (Num) -> Real, -poly_eval((p : ((Num) -> Num) -> Real), xs) == poly_eval(r, xs))"), fn(x522 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s523 = @tactics.mp_tac(x522)
    fn(x524 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s523(x524)
    }
  })
  let t521 = @tactics.disch_then(fn(x520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x517 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s518 = @tactics.assume_tac(x517)
      fn(x519 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s518(x519)
      }
    })(@bool.conjunct1(x520))
  })
  let t516 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : ((Num) -> Num) -> Real)"))
  let t515 = @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t514 = @simp.rewrite_tac(@list.List([ratpolyfun(), @class.fun_eq_thm(), @pair.forall_pair_thm()]))
  let t513 = @term_syntax.parse_term("(s : (Real) -> Bool)")
  let t533 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : (Real, Real) -> Real)"), t513])), t514), t515), t516), t521), t525), t527), t528), t529), t530), t531), t532)
  ratpolyfun_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real, Real) -> Real, ∀ s : (Real) -> Bool, ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), p(n, k)))) → ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), -p(n, k))))"), t533))
}

///|
let ratpolyfun_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATPOLYFUN_NEG")

///|
/// `RATPOLYFUN_NEG`
pub fn ratpolyfun_neg() -> @kernel.Thm {
  ratpolyfun_neg_c.get()
}

///|
/// RATPOLYFUN_ADD
fn step_38() -> Unit raise {
  let t574 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict()]))
  let t573 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | IN(x, {(y : _) | P(y)}) && Q(x)}"))]))
  let t572 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @sets.in_univ(), @class.de_morgan_thm()]))
  let t571 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([ratpoly()])))
  let t570 = @tactics.match_mp_tac(@iterate.sum_add_gen())
  let t569 = @tactics.conv_tac(@equal.sym_conv)
  let t575 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([poly_eval(), @real.real_add_rdistrib()]))), t569), t570), t571), t572), t573), t574)
  let t566 = @simp.asm_simp_tac(@list.List([]))
  let t564 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) + (y : Real) == real_of_num(0)) → !(x == real_of_num(0)) || !(y == real_of_num(0))")))
  let t567 = @tactics.then_tac(@tactics.first_x_assum(fn(x565 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t564(x565))
  }), t566)
  let t563 = @simp.asm_rewrite_tac(@list.List([@sets.finite_union(), @sets.subset(), @sets.in_union(), @sets.in_elim_thm()]))
  let t562 = @tactics.exists_tac(@term_syntax.parse_term("UNION({(m : (Num) -> Num) | !((p : ((Num) -> Num) -> Real)(m) == real_of_num(0))}, {(m : (Num) -> Num) | !((q : ((Num) -> Num) -> Real)(m) == real_of_num(0))})"))
  let t568 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t562), t563), @calc_rat.real_arith_tac), t567])
  let t561 = @simp.asm_simp_tac(@list.List([@floor.rational_closed()]))
  let t560 = @tactics.repeat_tac(@tactics.strip_tac)
  let t559 = @simp.rewrite_tac(@list.List([ratpoly()]))
  let t576 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x556 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s557 = @tactics.mp_tac(x556)
    fn(x558 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s557(x558)
    }
  })), t559), t560), t561), t568), t575])
  let t555 = @tactics.exists_tac(@term_syntax.parse_term("(m : (Num) -> Num) => (p : ((Num) -> Num) -> Real)(m) + (q : ((Num) -> Num) -> Real)(m)"))
  let t553 = @simp.simp_tac(@list.List([]))
  let t554 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t553)])
  let t552 = @tactics.subgoal_then(@term_syntax.parse_term("∃ r : ((Num) -> Num) -> Real, ratpoly(r) && (∀ xs : (Num) -> Real, poly_eval((p : ((Num) -> Num) -> Real), xs) + poly_eval((q : ((Num) -> Num) -> Real), xs) == poly_eval(r, xs))"), fn(x549 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s550 = @tactics.mp_tac(x549)
    fn(x551 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s550(x551)
    }
  })
  let t548 = @tactics.repeat_tac(@tactics.disch_then(fn(x547 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t546 = @simp.simp_tac(@list.List([@class.fun_eq_thm(), @pair.forall_pair_thm()]))
  let t543 = @simp.gen_rewrite_rule(fn(x542 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x542
  }, @list.List([@class.fun_eq_thm()]))
  let t545 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x544 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s540 = @tactics.mp_tac(x539)
      fn(x541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s540(x541)
      }
    })(t543(x544))
  }))
  let t537 = @tactics.x_choose_then(@term_syntax.parse_term("(q : ((Num) -> Num) -> Real)"))(@tactics.strip_assume_tac)
  let t538 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(p : ((Num) -> Num) -> Real)"))(@tactics.strip_assume_tac), t537))
  let t536 = @simp.rewrite_tac(@list.List([ratpolyfun()]))
  let t534 = @term_syntax.parse_term("(s : (Real) -> Bool)")
  let t535 = @term_syntax.parse_term("(g : (Real, Real) -> Real)")
  let t577 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : (Real, Real) -> Real)"), t535, t534])), t536), t538), t545), t546), t548), t552), t554), t555), @tactics.conj_tac), t576)
  ratpolyfun_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real, Real) -> Real, ∀ q : (Real, Real) -> Real, ∀ s : (Real) -> Bool, ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), p(n, k)))) && ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), q(n, k)))) → ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), p(n, k) + q(n, k))))"), t577))
}

///|
let ratpolyfun_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATPOLYFUN_ADD")

///|
/// `RATPOLYFUN_ADD`
pub fn ratpolyfun_add() -> @kernel.Thm {
  ratpolyfun_add_c.get()
}

///|
/// RATPOLYFUN_SUB
fn step_39() -> Unit raise {
  let t578 = @simp.simp_tac(@list.List([@realax.real_sub(), ratpolyfun_add(), ratpolyfun_neg()]))
  ratpolyfun_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real, Real) -> Real, ∀ q : (Real, Real) -> Real, ∀ s : (Real) -> Bool, ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), p(n, k)))) && ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), q(n, k)))) → ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), p(n, k) - q(n, k))))"), t578))
}

///|
let ratpolyfun_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATPOLYFUN_SUB")

///|
/// `RATPOLYFUN_SUB`
pub fn ratpolyfun_sub() -> @kernel.Thm {
  ratpolyfun_sub_c.get()
}

///|
/// RATPOLYFUN_MUL
fn step_40() -> Unit raise {
  let t741 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict()]))
  let t740 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([ratpoly()])))
  let t739 = @simp.rewrite_tac(@list.List([@real.real_pow_eq_1(), @sets.set_rule(@term_syntax.parse_term("{(i : _) | IN(i, UNIV) && !((p : (_) -> Bool)(i) || (q : (_) -> Bool)(i))} == {(i : _) | IN(i, {(j : _) | !q(j)}) && !p(i)}"))]))
  let t738 = @tactics.match_mp_tac(@products.product_mul_gen())
  let t735 = @simp.rewrite_tac(@list.List([@real.real_pow_add()]))
  let t734 = @tactics.first_x_assum(fn(x733 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x730 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s731 = @tactics.subst1_tac(x730)
      fn(x732 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s731(x732)
      }
    })(@equal.sym(x733))
  })
  let t729 = @tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("(z : Real) == (x : Real) * (y : Real) → (p : Real) * x * ((q : Real) * y) == p * q * z")))
  let t728 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @class.de_morgan_thm()]))
  let t727 = @term_syntax.parse_term("(m2 : (Num) -> Num)")
  let t736 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(m1 : (Num) -> Num)"), t727])), t728), @tactics.strip_tac), t729), t734), t735)
  let t726 = @tactics.conv_tac(@equal.sym_conv)
  let t724 = @equal.gsym(@realarith.real_entire())
  let t725 = @simp.rewrite_tac(@list.List([@equal.gsym(@class.de_morgan_thm()), t724, @real.real_pow_add()]))
  let t723 = @simp.asm_rewrite_tac(@list.List([]))
  let t722 = @class.asm_cases_tac(@term_syntax.parse_term("(q : ((Num) -> Num) -> Real)((m2 : (Num) -> Num)) == real_of_num(0)"))
  let t721 = @simp.asm_rewrite_tac(@list.List([]))
  let t720 = @class.asm_cases_tac(@term_syntax.parse_term("(p : ((Num) -> Num) -> Real)((m1 : (Num) -> Num)) == real_of_num(0)"))
  let t719 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @class.de_morgan_thm()]))
  let t718 = @tactics.disch_then(fn(x717 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x714 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s715 = @tactics.subst1_tac(x714)
      fn(x716 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s715(x716)
      }
    })(@equal.sym(x717))
  })
  let t713 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((r : Bool) → (p : Bool) == (q : Bool)) → (p && r) == (r && q)")))
  let t711 = @term_syntax.parse_term("(m2 : (Num) -> Num)")
  let t712 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(m1 : (Num) -> Num)"), t711]))
  let t737 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @pair.forall_pair_thm(), @sets.in_elim_pair_thm()])), t712), t713), t718), t719), t720), t721), t722), t723), t725), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t726), t736])
  let t710 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t709 = @tactics.match_mp_tac(@meson.meson(@list.List([@iterate.sum_eq()]), @term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) && (∀ x : _, IN(x, s) → (f : (_) -> Real)(x) == (g : (_) -> Real)(x)) → sum(s, f) == sum(t, g)")))
  let t708 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : (_, _)) | IN(x, {((a : _), (b : _)) | (P : (_, _) -> Bool)(a, b)}) && (Q : ((_, _)) -> Bool)(x)} == {((a : _), (b : _)) | P(a, b) && Q((a, b))}"))]))
  let t707 = @simp.rewrite_tac(@list.List([@iterate.support(), @sets.in_univ(), @iterate.neutral_real_add()]))
  let t706 = @simp.gen_rewrite_tac(fn(x703 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s704 = @equal.rand_conv(x703)
    fn(x705 : @kernel.Term) -> @kernel.Thm raise {
      s704(x705)
    }
  }, @list.List([@equal.gsym(@iterate.sum_support())]))
  let t702 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t701 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : (Num) -> Num)"))
  let t700 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t698 = @tactics.disch_then(fn(x697 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x694 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s695 = @tactics.subst1_tac(x694)
      fn(x696 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s695(x696)
      }
    })(@equal.sym(x697))
  })
  let t693 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict()]))
  let t692 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([ratpoly()])))
  let t691 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("((x : _) => (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)) == {(x : _) | IN(x, {(y : _) | P(y)}) && Q(x)}"))]))
  let t690 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @sets.in_univ(), @class.de_morgan_thm()]))
  let t699 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@sets.in_()]))(@sets.finite_product_dependent())), t690), t691), t692), t693), t698])
  let t689 = @simp.rewrite_tac(@list.List([@sets.subset_univ()]))
  let t688 = @tactics.disch_then(fn(x676 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x676
    let t682 = @drule.part_match(fn(x681 : @kernel.Term) -> @kernel.Term raise {
      @kernel.rand(@kernel.rand(x681))
    }, th)
    fn(x687 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      (fn(x686 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x684 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x683 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x678 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s679 = @tactics.mp_tac(x678)
              fn(x680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s679(x680)
              }
            })(t682(x683))
          })(@equal.lhand(x684))
        })((fn(x685 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
          x685.1
        })(x686))
      })(x687)(x687)
    }
  })
  let t674 = @simp.once_rewrite_rule(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ f : _, ∀ g : _, ∀ s : _, ∀ t : _, (P : (_, _, _, _) -> Bool)(f, g, s, t)) == (∀ f : _, ∀ t : _, ∀ g : _, ∀ s : _, P(f, g, s, t))"))]))(@iterate.sum_group())
  let t673 = @term_syntax.parse_term("(UNIV : ((Num) -> Num) -> Bool)")
  let t675 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("GABS((f : (((Num) -> Num, (Num) -> Num), Num) -> Num) => ∀ k : (Num) -> Num, ∀ l : (Num) -> Num, GEQ(f((k, l)), (i : Num) => k(i) + l(i)))"), t673]), t674))
  let t671 = @tactics.disch_then(fn(x668 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s669 = @tactics.subst1_tac(x668)
    fn(x670 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s669(x670)
    }
  })
  let t667 = @simp.asm_simp_tac(@list.List([@sets.finite_restrict()]))
  let t666 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == {(x : _) | IN(x, {(y : _) | P(y)}) && Q(x)}"))]))
  let t665 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @sets.in_univ(), @class.de_morgan_thm()]))
  let t672 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([ratpoly()]))), t665), t666), t667), t671])
  let t664 = @simp.rewrite_tac(@list.List([@iterate.support(), @sets.in_univ(), @iterate.neutral_real_add(), @sets.in_elim_thm()]))
  let t658 = @drule.part_match(fn(x657 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x657))
  }, @iterate.sum_sum_product())
  let t653 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_lmul())]))
  let t652 = @simp.rewrite_tac(@list.List([@equal.gsym(@iterate.sum_rmul())]))
  let t651 = @simp.gen_rewrite_tac(fn(x650 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x644 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s645 = @equal.land_conv(x644)
      fn(x646 : @kernel.Term) -> @kernel.Thm raise {
        s645(x646)
      }
    })((fn(x647 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s648 = @equal.binop_conv(x647)
      fn(x649 : @kernel.Term) -> @kernel.Thm raise {
        s648(x649)
      }
    })(x650))
  }, @list.List([@equal.gsym(@iterate.sum_support())]))
  let t742 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([poly_eval()]))), t651), t652), t653), fn(x663 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x662 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x660 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x659 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s655 = @tactics.mp_tac(x654)
            fn(x656 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s655(x656)
            }
          })(t658(x659))
        })(@equal.lhand(x660))
      })((fn(x661 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x661.1
      })(x662))
    })(x663)(x663)
  }), t664), @tactics.ants_tac), t672), t675), t688), t689), @tactics.ants_tac), t699), t700), t701), t702), t706), t707), t708), t709), t710), @tactics.conj_tac), t737), t738), t739), t740), t741)
  let t640 = @simp.asm_simp_tac(@list.List([@arith.add_eq_0(), @sets.finite_union(), @sets.set_rule(@term_syntax.parse_term("{(x : _) | !((P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x))} == UNION({(x : _) | !P(x)}, {(x : _) | !Q(x)})"))]))
  let t639 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x638 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x635 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s636 = @tactics.subst1_tac(x635)
      fn(x637 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s636(x637)
      }
    })(@equal.sym(x638))
  }, @tactics.strip_assume_tac))
  let t634 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm(), @realarith.real_entire()]))
  let t632 = @term_syntax.parse_term("(l : (Num) -> Num)")
  let t633 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : (Num) -> Num)"), t632]))
  let t631 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp(), @theorems.left_imp_exists_thm()]))
  let t630 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t628 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@equal.gsym(@class.contrapos_thm())]))(@iterate.sum_eq_0()))
  let t641 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x629 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x625 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s626 = @tactics.mp_tac(x625)
      fn(x627 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s626(x627)
      }
    })(t628(x629))
  }), t630), t631), t633), t634), t639), t640)
  let t622 = @sets.set_tac(@list.List([]))
  let t621 = @simp.rewrite_tac(@list.List([@sets.in_elim_pair_thm()]))
  let t620 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec(), @sets.in_image(), @pair.exists_pair_thm()]))
  let t617 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@equal.gsym(@class.contrapos_thm())]))(@iterate.sum_eq_0()))
  let t619 = @tactics.disch_then(fn(x618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x614 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s615 = @tactics.mp_tac(x614)
      fn(x616 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s615(x616)
      }
    })(t617(x618))
  })
  let t613 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : (Num) -> Num)"))
  let t623 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()])), t613), t619), t620), t621), t622)
  let t612 = @simp.asm_rewrite_tac(@list.List([]))
  let t611 = @tactics.match_mp_tac(@sets.finite_product_dependent())
  let t610 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{((k : _), (l : _)) | !((P : (_) -> Bool)(k) || (Q : (_) -> Bool)(l))} == {((k : _), (l : _)) | IN(k, {(x : _) | !P(x)}) && IN(l, {(x : _) | !Q(x)})}"))]))
  let t609 = @simp.rewrite_tac(@list.List([@realarith.real_entire()]))
  let t624 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_image()), t609), t610), t611), t612), t623])
  let t608 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE(GABS((f : (((Num) -> Num, (Num) -> Num), Num) -> Num) => ∀ k : (Num) -> Num, ∀ l : (Num) -> Num, GEQ(f((k, l)), (i : Num) => k(i) + l(i))), {((k : (Num) -> Num), (l : (Num) -> Num)) | !((p : ((Num) -> Num) -> Real)(k) * (q : ((Num) -> Num) -> Real)(l) == real_of_num(0))})"))
  let t642 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t608), @tactics.conj_tac), t624)
  let t607 = @simp.asm_simp_tac(@list.List([@floor.rational_closed()]))
  let t606 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t643 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@floor.rational_sum()), t606), t607), t642, t641])
  let t605 = @tactics.repeat_tac(@tactics.strip_tac)
  let t604 = @simp.rewrite_tac(@list.List([ratpoly()]))
  let t743 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x601 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s602 = @tactics.mp_tac(x601)
    fn(x603 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s602(x603)
    }
  })), t604), t605), t643), t742])
  let t600 = @tactics.exists_tac(@term_syntax.parse_term("(m : (Num) -> Num) => sum({((k : (Num) -> Num), (l : (Num) -> Num)) | ((i : Num) => k(i) + l(i)) == m}, GABS((f : (((Num) -> Num, (Num) -> Num)) -> Real) => ∀ k : (Num) -> Num, ∀ l : (Num) -> Num, GEQ(f((k, l)), (p : ((Num) -> Num) -> Real)(k) * (q : ((Num) -> Num) -> Real)(l))))"))
  let t598 = @simp.simp_tac(@list.List([]))
  let t599 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t598)])
  let t597 = @tactics.subgoal_then(@term_syntax.parse_term("∃ r : ((Num) -> Num) -> Real, ratpoly(r) && (∀ xs : (Num) -> Real, poly_eval((p : ((Num) -> Num) -> Real), xs) * poly_eval((q : ((Num) -> Num) -> Real), xs) == poly_eval(r, xs))"), fn(x594 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s595 = @tactics.mp_tac(x594)
    fn(x596 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s595(x596)
    }
  })
  let t593 = @tactics.repeat_tac(@tactics.disch_then(fn(x592 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t591 = @simp.simp_tac(@list.List([@class.fun_eq_thm(), @pair.forall_pair_thm()]))
  let t588 = @simp.gen_rewrite_rule(fn(x587 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x587
  }, @list.List([@class.fun_eq_thm()]))
  let t590 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x584 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s585 = @tactics.mp_tac(x584)
      fn(x586 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s585(x586)
      }
    })(t588(x589))
  }))
  let t582 = @tactics.x_choose_then(@term_syntax.parse_term("(q : ((Num) -> Num) -> Real)"))(@tactics.strip_assume_tac)
  let t583 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(p : ((Num) -> Num) -> Real)"))(@tactics.strip_assume_tac), t582))
  let t581 = @simp.rewrite_tac(@list.List([ratpolyfun()]))
  let t579 = @term_syntax.parse_term("(s : (Real) -> Bool)")
  let t580 = @term_syntax.parse_term("(g : (Real, Real) -> Real)")
  let t744 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : (Real, Real) -> Real)"), t580, t579])), t581), t583), t590), t591), t593), t597), t599), t600), @tactics.conj_tac), t743)
  ratpolyfun_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real, Real) -> Real, ∀ q : (Real, Real) -> Real, ∀ s : (Real) -> Bool, ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), p(n, k)))) && ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), q(n, k)))) → ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), p(n, k) * q(n, k))))"), t744))
}

///|
let ratpolyfun_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATPOLYFUN_MUL")

///|
/// `RATPOLYFUN_MUL`
pub fn ratpolyfun_mul() -> @kernel.Thm {
  ratpolyfun_mul_c.get()
}

///|
/// RATPOLYFUN_POW
fn step_41() -> Unit raise {
  let t747 = @simp.asm_simp_tac(@list.List([ratpolyfun_mul()]))
  let t746 = @simp.simp_tac(@list.List([@realax.real_pow(), ratpolyfun_const(), @floor.rational_closed()]))
  let t745 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t748 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))), @tactics.gen_tac), t745), @tactics.disch_tac), @nums.induct_tac), t746), t747)
  ratpolyfun_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real, Real) -> Real, ∀ r : Num, ∀ s : (Real) -> Bool, ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), p(n, k)))) → ratpolyfun(s, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), pow(p(n, k), r))))"), t748))
}

///|
let ratpolyfun_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATPOLYFUN_POW")

///|
/// `RATPOLYFUN_POW`
pub fn ratpolyfun_pow() -> @kernel.Thm {
  ratpolyfun_pow_c.get()
}

///|
/// RATPOLYFUN_TAC
fn step_42() -> Unit raise {
  let t755 = @simp.asm_simp_tac(@list.List([@floor.rational_closed()]))
  let t756 = @tactics.then_tac(@tactics.match_mp_tac(ratpolyfun_const()), t755)
  let t754 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty(), @sets.in_insert()]))
  let t757 = @tactics.orelse_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(ratpolyfun_parameter()), t754), @tactics.no_tac), t756)
  let t753 = @simp.rewrite_tac(@list.List([ratpolyfun_var()]))
  let t752 = @tactics.then_tac(@tactics.match_mp_tac(ratpolyfun_mul()), @tactics.conj_tac)
  let t751 = @tactics.then_tac(@tactics.match_mp_tac(ratpolyfun_sub()), @tactics.conj_tac)
  let t750 = @tactics.then_tac(@tactics.match_mp_tac(ratpolyfun_add()), @tactics.conj_tac)
  let t749 = @tactics.match_mp_tac(ratpolyfun_pow())
  ratpolyfun_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.match_mp_tac(ratpolyfun_neg()), t749), t750), t751), t752)), t753), t757))
}

///|
let ratpolyfun_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("RATPOLYFUN_TAC")

///|
/// `RATPOLYFUN_TAC`
pub fn ratpolyfun_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (ratpolyfun_tac_c.get())(x)
}

///|
/// ratty
fn step_43() -> Unit raise {
  ratty_c.set(@pair.new_definition(@term_syntax.parse_term("(ratty : ((Real) -> Bool, (Real, Real)) -> Bool)((s : (Real) -> Bool), (t : (Real, Real))) == (∃ p : ((Real, Real)) -> Real, ratpolyfun(s, p) && p(t) == real_of_num(0) && !(∀ w : (Real, Real), p(w) == real_of_num(0)))")))
}

///|
let ratty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ratty")

///|
/// `ratty`
pub fn ratty() -> @kernel.Thm {
  ratty_c.get()
}

///|
/// magical_set
fn step_44() -> Unit raise {
  magical_set_c.set(@pair.new_definition(@term_syntax.parse_term("(magical_set : ((Real) -> Bool, Cart[Real, 2]) -> Bool)((s : (Real) -> Bool)) == INTERS({{(z : Cart[Real, 2]) | !(FST((p : (((Real, Real)) -> Real, Real, Real)), (FST(SND(p)) + Re(z), SND(SND(p)) + Im(z))) == real_of_num(0))} | IN(p, CROSS(DELETE(ratpolyfun(s), (x : (Real, Real)) => real_of_num(0)), CROSS(integer, integer)))})")))
}

///|
let magical_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("magical_set")

///|
/// `magical_set`
pub fn magical_set() -> @kernel.Thm {
  magical_set_c.get()
}

///|
/// IN_MAGICAL_SET_IMP_NOT_RATTY
fn step_45() -> Unit raise {
  let t783 = @simp.asm_rewrite_tac(@list.List([@class.fun_eq_thm(), @complexes.im(), @complexes.re()]))
  let t782 = @simp.rewrite_tac(@list.List([]))
  let t781 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t780 = @simp.asm_simp_tac(@list.List([@sets.in_(), @floor.integer_closed()]))
  let t779 = @simp.rewrite_tac(@list.List([@sets.in_delete()]))
  let t774 = @term_syntax.parse_term("(k : Real)")
  let t775 = @list.List([@term_syntax.parse_term("real_of_num((n : Num))"), t774])
  let t778 = @tactics.disch_then(fn(x777 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x771 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s772 = @tactics.mp_tac(x771)
      fn(x773 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s772(x773)
      }
    })(((x776 : @kernel.Thm) => @bool.specl(t775, x776))(x777))
  })
  let t770 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : ((Real, Real)) -> Real)"))
  let t769 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t768 = @simp.rewrite_tac(@list.List([ratty(), @class.not_exists_thm()]))
  let t767 = @simp.rewrite_tac(@list.List([@sets.inters_gspec(), @sets.in_elim_thm(), @pair.forall_pair_thm(), @sets.in_cross()]))
  let t764 = @simp.gen_rewrite_rule(fn(x761 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s762 = @equal.rand_conv(x761)
    fn(x763 : @kernel.Term) -> @kernel.Thm raise {
      s762(x763)
    }
  }, @list.List([magical_set()]))
  let t766 = @tactics.first_x_assum(fn(x765 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x758 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s759 = @tactics.mp_tac(x758)
      fn(x760 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s759(x760)
      }
    })(t764(x765))
  })
  let t784 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t766), t767), t768), t769), t770), t778), t779), t780), t781), t782), @tactics.strip_tac), t783)
  in_magical_set_imp_not_ratty_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Real) -> Bool, ∀ d : Real, ∀ e : Real, ∀ n : Num, ∀ k : Real, integer(k) && IN(complex((d, e)), magical_set(s)) → !ratty(s, (real_of_num(n) + d, k + e))"), t784))
}

///|
let in_magical_set_imp_not_ratty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_MAGICAL_SET_IMP_NOT_RATTY")

///|
/// `IN_MAGICAL_SET_IMP_NOT_RATTY`
pub fn in_magical_set_imp_not_ratty() -> @kernel.Thm {
  in_magical_set_imp_not_ratty_c.get()
}

///|
/// DENSE_MAGICAL_SET
fn step_46() -> Unit raise {
  let t865 = @simp.simp_tac(@list.List([@realanalysis.real_polynomial_function_rules(), @cart.dimindex_2(), @calc_num.arith(), @lists.el(), @lists.hd(), @lists.tl()]))
  let t864 = @tactics.match_mp_tac(@nums.num_induction())
  let t863 = @simp.simp_tac(@list.List([@complexes.re_def(), @realanalysis.real_polynomial_function_rules(), @cart.dimindex_2(), @calc_num.arith(), @lists.el(), @lists.hd(), @lists.tl(), @complexes.im_def()]))
  let t862 = @tactics.match_mp_tac(@nums.num_induction())
  let t860 = @term_syntax.parse_term("(j : Num)")
  let t861 = @tactics.spec_tac(@term_syntax.parse_term("(i : Num)"), t860)
  let t859 = @tactics.match_mp_tac(@realanalysis.real_polynomial_function_pow())
  let t858 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t857 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let t856 = @tactics.match_mp_tac(@realanalysis.real_polynomial_function_product())
  let t855 = @simp.rewrite_tac(@list.List([@realanalysis.real_polynomial_function_rules()]))
  let t854 = @tactics.match_mp_tac(@realanalysis.real_polynomial_function_mul())
  let t853 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t852 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : (Num) -> Num)"))
  let t851 = @simp.asm_rewrite_tac(@list.List([]))
  let t850 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([ratpoly()])))
  let t849 = @tactics.match_mp_tac(@realanalysis.real_polynomial_function_sum())
  let t848 = @simp.asm_simp_tac(@list.List([poly_eval_ratpoly()]))
  let t847 = @simp.rewrite_tac(@list.List([]))
  let t846 = @tactics.first_x_assum(fn(x843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s844 = @tactics.subst1_tac(x843)
    fn(x845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s844(x845)
    }
  })
  let t842 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(q : ((Num) -> Num) -> Real)"))(@tactics.strip_assume_tac))
  let t839 = @simp.gen_rewrite_rule(fn(x838 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x838
  }, @list.List([ratpolyfun()]))
  let t841 = @tactics.first_x_assum(fn(x840 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x835 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s836 = @tactics.mp_tac(x835)
      fn(x837 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s836(x837)
      }
    })(t839(x840))
  })
  let t834 = @simp.simp_tac(@list.List([@realanalysis.vector_polynomial_function_add(), @realanalysis.vector_polynomial_function_id(), @realanalysis.vector_polynomial_function_const()]))
  let t832 = @tactics.match_mp_tac(@realanalysis.real_vector_polynomial_function_o())
  let t831 = @simp.rewrite_tac(@list.List([@trivia.o_def(), @class.fun_eq_thm(), @complexes.re(), @complexes.im(), @complexes.re_add(), @complexes.im_add()]))
  let t833 = @list.List([@tactics.then_tac(@simp.expand_tac("q"), t831), t832])
  let t830 = @tactics.subgoal_then(@term_syntax.parse_term("(q : (Cart[Real, 2]) -> Real) == o((z : Cart[Real, 2]) => (p : ((Real, Real)) -> Real)((Re(z), Im(z))), (z : Cart[Real, 2]) => complex(((n : Real), (k : Real))) + z)"), fn(x827 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s828 = @tactics.subst1_tac(x827)
    fn(x829 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s828(x829)
    }
  })
  let t825 = @simp.rewrite_tac(@list.List([@complexes.re(), @complexes.im(), @real.real_sub_add2()]))
  let t821 = @term_syntax.parse_term("complex(((x : Real) - (n : Real), (y : Real) - (k : Real)))")
  let t824 = @tactics.first_x_assum(fn(x823 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s819 = @tactics.mp_tac(x818)
      fn(x820 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s819(x820)
      }
    })(((x822 : @kernel.Thm) => @bool.spec(t821, x822))(x823))
  })
  let t816 = @term_syntax.parse_term("(y : Real)")
  let t817 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Real)"), t816]))
  let t815 = @simp.rewrite_tac(@list.List([@class.contrapos_thm(), @pair.forall_pair_thm(), @class.fun_eq_thm()]))
  let t814 = @tactics.first_x_assum(fn(x813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x806 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s807 = @tactics.mp_tac(x806)
      fn(x808 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s807(x808)
      }
    })(((x812 : @kernel.Thm) => @lib.check(fn(x811 : @kernel.Thm) -> Bool raise {
      (fn(x809 : @kernel.Term) -> Bool raise {
        @basics.is_neg(x809)
      })((fn(x810 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x810)
      })(x811))
    }, x812))(x813))
  })
  let t805 = @simp.asm_rewrite_tac(@list.List([]))
  let t826 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.nowhere_dense_algebraic_variety()), t805), t814), t815), @tactics.disch_tac), t817), t824), t825)])
  let t804 = @tactics.subgoal_then(@term_syntax.parse_term("real_polynomial_function((q : (Cart[Real, 2]) -> Real))"), fn(x801 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s802 = @tactics.assume_tac(x801)
    fn(x803 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s802(x803)
    }
  })
  let t800 = @simp.abbrev_tac(@term_syntax.parse_term("(q : (Cart[Real, 2]) -> Real) == ((z : Cart[Real, 2]) => (p : ((Real, Real)) -> Real)(((n : Real) + Re(z), (k : Real) + Im(z))))"))
  let t799 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t796 = @term_syntax.parse_term("(k : Real)")
  let t797 = @term_syntax.parse_term("(n : Real)")
  let t798 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : ((Real, Real)) -> Real)"), t797, t796]))
  let t795 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @sets.in_cross(), @sets.in_delete()]))
  let t794 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec(), @sets.set_rule(@term_syntax.parse_term("DIFF(UNIV, {(z : _) | !(P : (_) -> Bool)(z)}) == {(x : _) | P(x)}"))]))
  let t792 = @simp.simp_tac(@list.List([@card.countable_cross(), @misc.countable_integer(), countable_ratpolyfun(), @card.countable_delete()]))
  let t791 = @tactics.match_mp_tac(@card.countable_cross())
  let t790 = @tactics.match_mp_tac(@card.countable_image())
  let t789 = @tactics.match_mp_tac(@card.countable_image())
  let t793 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.simple_image()])), t789), t790), t791), t792), @tactics.all_tac])
  let t788 = @tactics.match_mp_tac(@topology.nowhere_dense_countable_unions())
  let t787 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("DIFF(UNIV, DIFF(UNIV, (s : (_) -> Bool))) == s"))]))
  let t786 = @simp.rewrite_tac(@list.List([magical_set(), @sets.inters_unions()]))
  let t785 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.interior_complement())]))
  let t866 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("((s : (_) -> Bool) == UNIV) == (DIFF(UNIV, s) == {})"))])), t785), t786), t787), t788), @tactics.conj_tac), t793), t794), t795), t798), t799), @tactics.strip_tac), t800), t804), t826), t830), t833), t834), t841), t842), t846), t847), t848), t849), t850), t851), t852), t853), @tactics.disch_tac), t854), t855), t856), t857), t858), @tactics.disch_tac), t859), t861), t862), t863), t864), t865)
  dense_magical_set_c.set(@tactics.prove(@term_syntax.parse_term("closure(magical_set((s : (Real) -> Bool))) == UNIV"), t866))
}

///|
let dense_magical_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DENSE_MAGICAL_SET")

///|
/// `DENSE_MAGICAL_SET`
pub fn dense_magical_set() -> @kernel.Thm {
  dense_magical_set_c.get()
}

///|
/// APPROACHABLE_WITHIN_AUGMENTED_MAGICAL_SET
fn step_47() -> Unit raise {
  let t868 = @simp.asm_simp_tac(@list.List([@topology.closure_open_inter_superset(), dense_magical_set(), @sets.subset_univ(), @topology.open_delete()]))
  let t867 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("DELETE(INTER((s : (_) -> Bool), (t : (_) -> Bool)), (a : _)) == INTER(DELETE(s, a), t)"))]))
  let t869 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.trivial_limit_within(), @equal.gsym(@topology.in_closure_delete())])), t867), t868)
  approachable_within_augmented_magical_set_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Real) -> Bool, ∀ s : (Cart[Real, 2]) -> Bool, open(s) && limit_point_of(Cx(real_of_num(0)), s) → !trivial_limit(within(at(Cx(real_of_num(0))), INTER(s, magical_set(p))))"), t869))
}

///|
let approachable_within_augmented_magical_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("APPROACHABLE_WITHIN_AUGMENTED_MAGICAL_SET")

///|
/// `APPROACHABLE_WITHIN_AUGMENTED_MAGICAL_SET`
pub fn approachable_within_augmented_magical_set() -> @kernel.Thm {
  approachable_within_augmented_magical_set_c.get()
}

///|
/// ZEILBERGER_GEN
fn step_48() -> Unit raise {
  let t871 = @simp.rewrite_tac(@list.List([@vectors.dist(), @complexes.complex_sub_rzero(), @vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, 2]) + (z : Cart[Real, 2]) - a == z"))]))
  let t870 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @sets.forall_in_gspec()]))
  let t872 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.reallim_within()])), t870), t871)
  let lemma = @tactics.prove(@term_syntax.parse_term("op_minus_minus_minus_gt((f : (Cart[Real, 2]) -> Real), (l : Real), within(at((a : Cart[Real, 2])), {a + (z : Cart[Real, 2]) | IN(z, (s : (Cart[Real, 2]) -> Bool))})) == op_minus_minus_minus_gt((w : Cart[Real, 2]) => f(a + w), l, within(at(Cx(real_of_num(0))), s))"), t872)
  let t1025 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_complex_components_at()]))
  let t1024 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_const()]))
  let t1023 = @tactics.match_mp_tac(@realanalysis.real_continuous_add())
  let t1022 = @tactics.repeat_tac(@tactics.disch_then(fn(x1021 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t1020 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_const()]))
  let t1018 = @simp.rewrite_tac(@list.List([@lists.el(), @lists.hd(), @lists.tl()]))
  let t1019 = @tactics.replicate_tac(2, @tactics.try_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@nums.num_induction()), t1018), @tactics.conj_tac)))
  let t1016 = @term_syntax.parse_term("(j : Num)")
  let t1017 = @tactics.spec_tac(@term_syntax.parse_term("(i : Num)"), t1016)
  let t1015 = @tactics.match_mp_tac(@realanalysis.real_continuous_pow())
  let t1014 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t1013 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let t1012 = @tactics.match_mp_tac(@realanalysis.real_continuous_product())
  let t1011 = @tactics.match_mp_tac(@realanalysis.real_continuous_lmul())
  let t1010 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1009 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1008 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([ratpoly()])))
  let t1007 = @tactics.match_mp_tac(@realanalysis.real_continuous_sum())
  let t1006 = @simp.asm_simp_tac(@list.List([poly_eval_ratpoly()]))
  let t1005 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : ((Num) -> Num) -> Real)"))
  let t1004 = @simp.rewrite_tac(@list.List([ratpolyfun(), @theorems.left_imp_exists_thm()]))
  let t1002 = @tactics.undisch_tac(@term_syntax.parse_term("ratpolyfun((e : (Real) -> Bool), (q : ((Real, Real)) -> Real))"))
  let t1003 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.undisch_tac(@term_syntax.parse_term("ratpolyfun((e : (Real) -> Bool), (p : ((Real, Real)) -> Real))")), t1002]))
  let t1001 = @simp.asm_rewrite_tac(@list.List([@complexes.re_cx(), @complexes.im_cx(), @calc_int.real_add_rid(), @equal.gsym(@realax.real_of_num_add())]))
  let t1000 = @tactics.match_mp_tac(@realanalysis.real_continuous_div_at())
  let t999 = @simp.rewrite_tac(@list.List([@complexes.im_cx(), @complexes.re_cx(), @calc_int.real_add_rid()]))
  let t998 = @tactics.match_mp_tac(@meson.meson(@list.List([@realanalysis.real_continuous_at_within(), @realanalysis.real_continuous_within()]), @term_syntax.parse_term("real_continuous((f : (Cart[Real, _]) -> Real), at((z : Cart[Real, _]))) && f(z) == (l : Real) → op_minus_minus_minus_gt(f, l, within(at(z), (s : (Cart[Real, _]) -> Bool)))")))
  let t996 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t995 = @simp.asm_rewrite_tac(@list.List([]))
  let t994 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)"))
  let t997 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_within_subset()), t994), t995), t996)]))
  let t993 = @tactics.match_mp_tac(@realanalysis.reallim_mul())
  let t992 = @tactics.match_mp_tac(@realanalysis.reallim_sub())
  let t990 = @meson.asm_meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((m : Num) + 1 < m)"))]))
  let t991 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("(b : Real) == real_of_num(0) → -(y : Real) == (a : Real) * b - y"))), t990), @tactics.all_tac])
  let t989 = @tactics.subgoal_then(@term_syntax.parse_term("-((p : ((Real, Real)) -> Real)((real_of_num((n : Num)), real_of_num(0))) / (q : ((Real, Real)) -> Real)((real_of_num(n), real_of_num(0))) * (f : (Num, Num) -> Real)(n, 0)) == p((real_of_num(n), real_of_num((m : Num) + 1))) / q((real_of_num(n), real_of_num(m + 1))) * f(n, m + 1) - p((real_of_num(n), real_of_num(0))) / q((real_of_num(n), real_of_num(0))) * f(n, 0)"), fn(x986 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s987 = @tactics.subst1_tac(x986)
    fn(x988 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s987(x988)
    }
  })
  let t985 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @iterate.sum_diffs_alt(), @arith.le_0()]))
  let t981 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @sets.in_elim_thm()]))
  let t979 = @simp.gen_rewrite_rule(fn(x978 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x978
  }, @list.List([@sets.in_inter()]))
  let t982 = @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x980 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x975 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s976 = @tactics.mp_tac(x975)
      fn(x977 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s976(x977)
      }
    })(t979(x980))
  }), t981), @calc_rat.real_arith_tac)
  let t974 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t973 = @simp.asm_rewrite_tac(@list.List([@complexes.complex_v1(), @floor.integer_closed()]))
  let t983 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(in_magical_set_imp_not_ratty()), t973), t974), t982])
  let t972 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t971 = @tactics.conv_tac(@equal.sym_conv)
  let t969 = @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + real_of_num(1) + (y : Real) == x + y + real_of_num(1)"))
  let t970 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t969]))
  let t968 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t967 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t966 = @simp.rewrite_tac(@list.List([@floor.finite_intseg()]))
  let t965 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t964 = @simp.rewrite_tac(@list.List([@complexes.complex_add(), @complexes.re(), @complexes.im()]))
  let t963 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t962 = @simp.rewrite_tac(@list.List([@real.real_lt_01(), @equal.gsym(@vectors.dist_nz())]))
  let t961 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t984 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.eventually_within()])), t961), t962), t963), @tactics.strip_tac), t964), t965), t966), t967), t968), @tactics.strip_tac), t970), t971), t972), @tactics.conj_tac), t983), @tactics.all_tac])
  let t960 = @simp.rewrite_tac(@list.List([]))
  let t959 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => sum(op_dot_dot(0, (m : Num)), (k : Num) => (p : ((Real, Real)) -> Real)((real_of_num((n : Num)) + Re(z), real_of_num(k) + real_of_num(1) + Im(z))) / (q : ((Real, Real)) -> Real)((real_of_num(n) + Re(z), real_of_num(k) + real_of_num(1) + Im(z))) * (ff : (Cart[Real, 2]) -> Real)(complex((real_of_num(n), real_of_num(k) + real_of_num(1))) + z) - p((real_of_num(n) + Re(z), real_of_num(k) + Im(z))) / q((real_of_num(n) + Re(z), real_of_num(k) + Im(z))) * ff(complex((real_of_num(n), real_of_num(k))) + z))"))
  let t1026 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_transform_eventually()), t959), t960), @tactics.conj_tac), t984), t985), t989), t991), t992), @tactics.conj_tac), t993), t997), t998), t999), t1000), t1001), t1003), t1004), t1005), @tactics.strip_tac), t1006), t1007), t1008), t1009), t1010), t1011), t1012), t1013), t1014), @tactics.disch_tac), t1015), t1017), t1019), t1020), t1022), t1023), t1024), t1025)
  let t956 = @sets.set_tac(@list.List([]))
  let t955 = @simp.asm_rewrite_tac(@list.List([]))
  let t954 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Cart[Real, 2]) -> Bool)"))
  let t953 = @tactics.match_mp_tac(@realanalysis.reallim_within_subset())
  let t952 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t951 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @iterate.in_numseg()]))
  let t957 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_sum()), t951), t952), @tactics.strip_tac), t953), t954), t955), t956)
  let t950 = @meson.asm_meson_tac(@list.List([@arith.lt_imp_le()]))
  let t949 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), @sets.in_univ(), @iterate.in_numseg(), @arith.le_0()]))
  let t958 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_superset()), t949), t950), t957])
  let t1027 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("sum(UNIV, (k : Num) => (h : (Num, Num) -> Real)((n : Num), k)) == sum(op_dot_dot(0, (m : Num)), (k : Num) => h(n, k))"), fn(x946 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s947 = @tactics.subst1_tac(x946)
    fn(x948 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s947(x948)
    }
  }), t958), t1026])
  let t945 = @simp.asm_simp_tac(@list.List([approachable_within_augmented_magical_set(), @topology.open_inter(), @simp.rewrite_rule(@list.List([@realax.real_gt()]))(@canal.open_halfspace_re_gt())]))
  let t944 = @tactics.exists_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) => sum(op_dot_dot(0, (m : Num)), (k : Num) => (hh : (Cart[Real, 2]) -> Real)(complex((real_of_num((n : Num)), real_of_num(k))) + z))"))
  let t943 = @tactics.match_mp_tac(@bool.ispec(@term_syntax.parse_term("within(at(Cx(real_of_num(0))), INTER(INTER((s : (Cart[Real, 2]) -> Bool), {(z : Cart[Real, 2]) | real_of_num(0) < Re(z)}), magical_set((e : (Real) -> Bool))))"), @realanalysis.reallim_unique()))
  let t941 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((a : Num) + 1 + 1 <= a)"))]))
  let t940 = @simp.simp_tac(@list.List([@realax.real_of_num_add(), @int.arith_rule(@term_syntax.parse_term("((m : Num) < (n : Num) + 1) == (m <= n)"))]))
  let t939 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ a : Num, (P : (Num) -> Bool)(a) → (Q : (Num) -> Bool)(a + 1)) → (∃ a : Num, P(a)) → (∃ b : Num, Q(b))")))
  let t938 = @simp.rewrite_tac(@list.List([@sets.forall_in_union(), @sets.in_elim_thm()]))
  let t935 = @drule.match_mp(@misc.upper_bound_finite_set())
  let t932 = @term_syntax.parse_term("(i : Num) => i")
  let t937 = @tactics.disch_then(fn(x936 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x934 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x929 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s930 = @tactics.mp_tac(x929)
        fn(x931 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s930(x931)
        }
      })(((x933 : @kernel.Thm) => @bool.spec(t932, x933))(x934))
    })(t935(x936))
  })
  let t928 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@sets.finite_union())]))
  let t926 = @simp.rewrite_tac(@list.List([@iterate.polynomial_function_id()]))
  let t925 = @simp.rewrite_tac(@list.List([@lists.el(), @lists.hd(), @iterate.polynomial_function_const(), @lists.tl()]))
  let t924 = @tactics.match_mp_tac(@nums.num_induction())
  let t923 = @simp.rewrite_tac(@list.List([@lists.el(), @lists.hd(), @iterate.polynomial_function_const()]))
  let t922 = @tactics.match_mp_tac(@nums.num_induction())
  let t920 = @term_syntax.parse_term("(j : Num)")
  let t921 = @tactics.spec_tac(@term_syntax.parse_term("(i : Num)"), t920)
  let t919 = @tactics.match_mp_tac(@iterate.polynomial_function_pow())
  let t918 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t917 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm()]))
  let t916 = @tactics.match_mp_tac(@products.polynomial_function_product())
  let t915 = @simp.rewrite_tac(@list.List([@iterate.polynomial_function_const()]))
  let t914 = @tactics.match_mp_tac(@iterate.polynomial_function_mul())
  let t913 = @tactics.repeat_tac(@tactics.strip_tac)
  let t912 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @realax.real_mul_assoc()]))
  let t911 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([ratpoly()])))
  let t910 = @tactics.match_mp_tac(@iterate.polynomial_function_sum())
  let t909 = @simp.asm_simp_tac(@list.List([poly_eval_ratpoly()]))
  let t908 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : ((Num) -> Num) -> Real)"))
  let t907 = @simp.rewrite_tac(@list.List([ratpolyfun(), @theorems.left_imp_exists_thm()]))
  let t906 = @tactics.undisch_tac(@term_syntax.parse_term("ratpolyfun((e : (Real) -> Bool), (q : ((Real, Real)) -> Real))"))
  let t905 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t900 = @drule.part_match(fn(x899 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x899))
  }, @iterate.polynomial_function_finite_roots())
  let t895 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq()]))
  let t894 = @tactics.match_mp_tac(@sets.finite_image_inj())
  let t927 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(k : Num) | (q : ((Real, Real)) -> Real)((real_of_num((n : Num)), real_of_num(k))) == real_of_num(0)} == {(k : Num) | IN(real_of_num(k), {(x : Real) | q((real_of_num(n), x)) == real_of_num(0)})}"))])), t894), t895), fn(x904 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x903 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x901 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x896 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s897 = @tactics.mp_tac(x896)
          fn(x898 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s897(x898)
          }
        })(t900(x901))
      })((fn(x902 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x902.1
      })(x903))
    })(x904)(x904)
  }), @tactics.ants_tac), t905), t906), t907), t908), @tactics.strip_tac), t909), t910), t911), t912), t913), t914), t915), t916), t917), t918), @tactics.disch_tac), t919), t921), t922), t923), t924), t925), t926), @tactics.all_tac])
  let t893 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(k : Num) | (q : ((Real, Real)) -> Real)((real_of_num((n : Num)), real_of_num(k))) == real_of_num(0)})"), fn(x890 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s891 = @tactics.mp_tac(x890)
    fn(x892 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s891(x892)
    }
  })
  let t889 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t942 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("FINITE({(k : Num) | !((f : (Num, Num) -> Real)((n : Num), k) == real_of_num(0))}) && FINITE({(k : Num) | !((h : (Num, Num) -> Real)(n, k) == real_of_num(0))})"), fn(x886 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s887 = @tactics.mp_tac(x886)
    fn(x888 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s887(x888)
    }
  }), t889), t893), t927), t928), t937), t938), t939), t940), t941), @tactics.all_tac])
  let t885 = @tactics.subgoal_then(@term_syntax.parse_term("∃ m : Num, !((q : ((Real, Real)) -> Real)((real_of_num((n : Num)), real_of_num(m) + real_of_num(1))) == real_of_num(0)) && (∀ k : Num, !((f : (Num, Num) -> Real)(n, k) == real_of_num(0)) → k < m) && (∀ k : Num, !((h : (Num, Num) -> Real)(n, k) == real_of_num(0)) → k < m)"), @tactics.strip_assume_tac)
  let t884 = @tactics.repeat_tac(@tactics.strip_tac)
  let t883 = @tactics.undisch_then(@term_syntax.parse_term("(P : (Num) -> Bool)((n : Num))"), fn(x882 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t881 = @simp.asm_rewrite_tac(@list.List([]))
  let t877 = @term_syntax.parse_term("(n : Num)")
  let t880 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x879 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x874 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s875 = @tactics.mp_tac(x874)
      fn(x876 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s875(x876)
      }
    })(((x878 : @kernel.Thm) => @bool.spec(t877, x878))(x879))
  }))
  let t873 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1028 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([lemma])), t873), t880), t881), t883), t884), t885), t942), t943), t944), t945), @tactics.conj_tac), t1027)
  zeilberger_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ e : (Real) -> Bool, ∀ f : (Num, Num) -> Real, ∀ h : (Num, Num) -> Real, ∀ ff : (Cart[Real, 2]) -> Real, ∀ hh : (Cart[Real, 2]) -> Real, ∀ p : ((Real, Real)) -> Real, ∀ q : ((Real, Real)) -> Real, ∀ s : (Cart[Real, 2]) -> Bool, open(s) && limit_point_of(Cx(real_of_num(0)), INTER(s, {(z : Cart[Real, 2]) | real_of_num(0) < Re(z)})) && ((∀ n : Num, FINITE({(k : Num) | !(f(n, k) == real_of_num(0))})) && (∀ n : Num, FINITE({(k : Num) | !(h(n, k) == real_of_num(0))}))) && ((∀ n : Num, ∀ k : Num, P(n) → op_minus_minus_minus_gt(ff, f(n, k), within(at(complex((real_of_num(n), real_of_num(k)))), {complex((real_of_num(n), real_of_num(k))) + (x : Cart[Real, 2]) | IN(x, s)}))) && (∀ n : Num, ∀ k : Num, P(n) → op_minus_minus_minus_gt(hh, h(n, k), within(at(complex((real_of_num(n), real_of_num(k)))), {complex((real_of_num(n), real_of_num(k))) + (x : Cart[Real, 2]) | IN(x, s)})))) && (ratpolyfun(e, p) && ratpolyfun(e, q)) && (∀ n : Num, P(n) → !(q((real_of_num(n), real_of_num(0))) == real_of_num(0))) && (∀ n : Real, ∀ k : Real, !ratty(e, (n, k)) && real_of_num(0) < n → hh(complex((n, k))) == p((n, k + real_of_num(1))) / q((n, k + real_of_num(1))) * ff(complex((n, k + real_of_num(1)))) - p((n, k)) / q((n, k)) * ff(complex((n, k)))) → (∀ n : Num, P(n) → sum(UNIV, (k : Num) => h(n, k)) == -(p((real_of_num(n), real_of_num(0))) / q((real_of_num(n), real_of_num(0))) * f(n, 0)))"), t1028))
}

///|
let zeilberger_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZEILBERGER_GEN")

///|
/// `ZEILBERGER_GEN`
pub fn zeilberger_gen() -> @kernel.Thm {
  zeilberger_gen_c.get()
}

///|
/// ZEILBERGER
fn step_49() -> Unit raise {
  let t1050 = @simp.rewrite_tac(@list.List([@theorems.exists_refl()]))
  let t1049 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @complexes.complex_ring(@term_syntax.parse_term("((w : Cart[Real, 2]) + (z : Cart[Real, 2]) == (y : Cart[Real, 2])) == (z == y - w)"))]))
  let t1048 = @tactics.match_mp_tac(@sets.surjective_image_eq())
  let t1047 = @simp.rewrite_tac(@list.List([@sets.simple_image()]))
  let t1051 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ w : Cart[Real, 2], {w + (z : Cart[Real, 2]) | IN(z, UNIV)} == UNIV"), fn(x1045 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1045
    @simp.rewrite_tac(@list.List([th, @topology.within_univ()]))
  }), @tactics.gen_tac), t1047), t1048), t1049), t1050)
  let t1044 = @simp.rewrite_tac(@list.List([@equal.gsym(@complexes.re_def()), @complexes.re_cx(), @sets.in_elim_thm()]))
  let t1043 = @simp.rewrite_tac(@list.List([@complexes.re_def(), @equal.gsym(@realax.real_gt()), @topology.closure_halfspace_component_gt()]))
  let t1042 = @simp.simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("!IN((a : _), (s : (_) -> Bool)) → DELETE(s, a) == s")), @sets.in_elim_thm(), @complexes.re_cx(), @realarith.real_lt_refl()]))
  let t1052 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@topology.in_closure_delete())])), t1042), t1043), t1044), @calc_rat.real_arith_tac), t1051])
  let t1041 = @simp.gen_rewrite_tac(fn(x1038 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1039 = @equal.land_conv(x1038)
    fn(x1040 : @kernel.Term) -> @kernel.Thm raise {
      s1039(x1040)
    }
  }, @list.List([@theorems.imp_conj()]))
  let t1037 = @simp.rewrite_tac(@list.List([@topology.open_univ(), @sets.inter_univ()]))
  let t1033 = @term_syntax.parse_term("(UNIV : (Cart[Real, 2]) -> Bool)")
  let t1036 = @tactics.disch_then(fn(x1035 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1030 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1031 = @tactics.mp_tac(x1030)
      fn(x1032 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1031(x1032)
      }
    })(((x1034 : @kernel.Thm) => @bool.spec(t1033, x1034))(x1035))
  })
  let t1029 = @tactics.replicate_tac(8, @tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t1053 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(zeilberger_gen()), t1029), t1036), t1037), t1041), @tactics.ants_tac), t1052)
  zeilberger_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Num) -> Bool, ∀ e : (Real) -> Bool, ∀ f : (Num, Num) -> Real, ∀ h : (Num, Num) -> Real, ∀ ff : (Cart[Real, 2]) -> Real, ∀ hh : (Cart[Real, 2]) -> Real, ∀ p : ((Real, Real)) -> Real, ∀ q : ((Real, Real)) -> Real, ((∀ n : Num, FINITE({(k : Num) | !(f(n, k) == real_of_num(0))})) && (∀ n : Num, FINITE({(k : Num) | !(h(n, k) == real_of_num(0))}))) && ((∀ n : Num, ∀ k : Num, P(n) → op_minus_minus_minus_gt(ff, f(n, k), at(complex((real_of_num(n), real_of_num(k)))))) && (∀ n : Num, ∀ k : Num, P(n) → op_minus_minus_minus_gt(hh, h(n, k), at(complex((real_of_num(n), real_of_num(k))))))) && (ratpolyfun(e, p) && ratpolyfun(e, q)) && (∀ n : Num, P(n) → !(q((real_of_num(n), real_of_num(0))) == real_of_num(0))) && (∀ n : Real, ∀ k : Real, !ratty(e, (n, k)) && real_of_num(0) < n → hh(complex((n, k))) == p((n, k + real_of_num(1))) / q((n, k + real_of_num(1))) * ff(complex((n, k + real_of_num(1)))) - p((n, k)) / q((n, k)) * ff(complex((n, k)))) → (∀ n : Num, P(n) → sum(UNIV, (k : Num) => h(n, k)) == -(p((real_of_num(n), real_of_num(0))) / q((real_of_num(n), real_of_num(0))) * f(n, 0)))"), t1053))
}

///|
let zeilberger_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZEILBERGER")

///|
/// `ZEILBERGER`
pub fn zeilberger() -> @kernel.Thm {
  zeilberger_c.get()
}

///|
/// FINITE_SUPPORT_BINOM
fn step_50() -> Unit raise {
  let t1061 = @term_syntax.parse_term("(k : Num)")
  let t1064 = @tactics.first_x_assum(fn(x1063 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1058 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1059 = @tactics.mp_tac(x1058)
      fn(x1060 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1059(x1060)
      }
    })(((x1062 : @kernel.Thm) => @bool.spec(t1061, x1062))(x1063))
  })
  let t1057 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)"))
  let t1056 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @binomial.binom_eq_0(), @sets.subset(), @sets.in_elim_thm(), @iterate.in_numseg()]))
  let t1055 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot(0, (n : Num))"))
  let t1054 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1065 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1054), t1055), t1056), t1057), t1064), @int.arith_tac)
  finite_support_binom_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : (Num) -> Num, ∀ n : Num, (∀ k : Num, k <= m(k)) → FINITE({(k : Num) | !(binom((n, m(k))) == 0)})"), t1065))
}

///|
let finite_support_binom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT_BINOM")

///|
/// `FINITE_SUPPORT_BINOM`
pub fn finite_support_binom() -> @kernel.Thm {
  finite_support_binom_c.get()
}

///|
/// FINITE_SUPPORT_ADD
fn step_51() -> Unit raise {
  let t1068 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union(), @sets.in_elim_thm()]))
  let t1067 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t1066 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.finite_union())]))
  let t1069 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1066), t1067), t1068), @int.arith_tac)
  finite_support_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Num, ∀ g : (A) -> Num, FINITE({(k : A) | !(f(k) == 0)}) && FINITE({(k : A) | !(g(k) == 0)}) → FINITE({(k : A) | !(f(k) + g(k) == 0)})"), t1069))
}

///|
let finite_support_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT_ADD")

///|
/// `FINITE_SUPPORT_ADD`
pub fn finite_support_add() -> @kernel.Thm {
  finite_support_add_c.get()
}

///|
/// FINITE_SUPPORT_MUL
fn step_52() -> Unit raise {
  let t1076 = @tactics.conv_tac(@grobner.num_ring)
  let t1075 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_inter(), @sets.in_elim_thm()]))
  let t1074 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t1073 = @tactics.disch_then(@tactics.disj_cases_then(fn(x1070 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1071 = @tactics.mp_tac(x1070)
    fn(x1072 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1071(x1072)
    }
  }))
  let t1077 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1073), t1074), t1075), t1076)
  finite_support_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Num, ∀ g : (A) -> Num, FINITE({(k : A) | !(f(k) == 0)}) || FINITE({(k : A) | !(g(k) == 0)}) → FINITE({(k : A) | !(f(k) * g(k) == 0)})"), t1077))
}

///|
let finite_support_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT_MUL")

///|
/// `FINITE_SUPPORT_MUL`
pub fn finite_support_mul() -> @kernel.Thm {
  finite_support_mul_c.get()
}

///|
/// `FINITE_SUPPORT_TAC`
pub fn finite_support_tac(x1078 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let gl = x1078
  let t1080 = @tactics.then_tac(@tactics.disj2_tac, finite_support_tac)
  let t1081 = @tactics.orelse_tac(@tactics.then_tac(@tactics.disj1_tac, finite_support_tac), t1080)
  let t1082 = @tactics.then_tac(@tactics.match_mp_tac(finite_support_mul()), t1081)
  let t1079 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(finite_support_add()), @tactics.conj_tac), finite_support_tac)
  @tactics.orelse_tac(@tactics.orelse_tac(@tactics.then_tac(@tactics.match_mp_tac(finite_support_binom()), @int.arith_tac), t1079), t1082)(gl)
}

///|
/// FINITE_SUPPORT_REAL_ADD
fn step_53() -> Unit raise {
  let t1085 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union(), @sets.in_elim_thm()]))
  let t1084 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t1083 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.finite_union())]))
  let t1086 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1083), t1084), t1085), @calc_rat.real_arith_tac)
  finite_support_real_add_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, FINITE({(k : A) | !(f(k) == real_of_num(0))}) && FINITE({(k : A) | !(g(k) == real_of_num(0))}) → FINITE({(k : A) | !(f(k) + g(k) == real_of_num(0))})"), t1086))
}

///|
let finite_support_real_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT_REAL_ADD")

///|
/// `FINITE_SUPPORT_REAL_ADD`
pub fn finite_support_real_add() -> @kernel.Thm {
  finite_support_real_add_c.get()
}

///|
/// FINITE_SUPPORT_REAL_SUB
fn step_54() -> Unit raise {
  let t1089 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union(), @sets.in_elim_thm()]))
  let t1088 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t1087 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.finite_union())]))
  let t1090 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1087), t1088), t1089), @calc_rat.real_arith_tac)
  finite_support_real_sub_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, FINITE({(k : A) | !(f(k) == real_of_num(0))}) && FINITE({(k : A) | !(g(k) == real_of_num(0))}) → FINITE({(k : A) | !(f(k) - g(k) == real_of_num(0))})"), t1090))
}

///|
let finite_support_real_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT_REAL_SUB")

///|
/// `FINITE_SUPPORT_REAL_SUB`
pub fn finite_support_real_sub() -> @kernel.Thm {
  finite_support_real_sub_c.get()
}

///|
/// FINITE_SUPPORT_REAL_INV
fn step_55() -> Unit raise {
  let t1091 = @simp.rewrite_tac(@list.List([@real.real_inv_eq_0()]))
  finite_support_real_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, FINITE({(k : A) | !(f(k) == real_of_num(0))}) → FINITE({(k : A) | !(inv(f(k)) == real_of_num(0))})"), t1091))
}

///|
let finite_support_real_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT_REAL_INV")

///|
/// `FINITE_SUPPORT_REAL_INV`
pub fn finite_support_real_inv() -> @kernel.Thm {
  finite_support_real_inv_c.get()
}

///|
/// FINITE_SUPPORT_REAL_POW
fn step_56() -> Unit raise {
  let t1092 = @sets.set_tac(@list.List([]))
  let t1093 = @tactics.then_tac(@simp.simp_tac(@list.List([@real.real_pow_eq_0()])), t1092)
  finite_support_real_pow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, ∀ n : Num, FINITE({(k : A) | !(f(k) == real_of_num(0))}) && !(n == 0) → FINITE({(k : A) | !(pow(f(k), n) == real_of_num(0))})"), t1093))
}

///|
let finite_support_real_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT_REAL_POW")

///|
/// `FINITE_SUPPORT_REAL_POW`
pub fn finite_support_real_pow() -> @kernel.Thm {
  finite_support_real_pow_c.get()
}

///|
/// FINITE_SUPPORT_SPOW
fn step_57() -> Unit raise {
  let t1101 = @sets.set_tac(@list.List([]))
  let t1100 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t1099 = @tactics.disch_then(fn(x1098 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1095 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1096 = @tactics.mp_tac(x1095)
      fn(x1097 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1096(x1097)
      }
    })(@bool.conjunct1(x1098))
  })
  let t1094 = @simp.simp_tac(@list.List([spow_eq_0()]))
  let t1102 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1094), t1099), t1100), t1101)
  finite_support_spow_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, ∀ y : Real, FINITE({(k : A) | !(f(k) == real_of_num(0))}) && !(y == real_of_num(0)) → FINITE({(k : A) | !(spow(f(k), y) == real_of_num(0))})"), t1102))
}

///|
let finite_support_spow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT_SPOW")

///|
/// `FINITE_SUPPORT_SPOW`
pub fn finite_support_spow() -> @kernel.Thm {
  finite_support_spow_c.get()
}

///|
/// FINITE_SUPPORT_REAL_MUL
fn step_58() -> Unit raise {
  let t1109 = @sets.set_tac(@list.List([]))
  let t1108 = @simp.rewrite_tac(@list.List([@realarith.real_entire()]))
  let t1107 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t1106 = @tactics.disch_then(@tactics.disj_cases_then(fn(x1103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1104 = @tactics.mp_tac(x1103)
    fn(x1105 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1104(x1105)
    }
  }))
  let t1110 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1106), t1107), t1108), t1109)
  finite_support_real_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, FINITE({(k : A) | !(f(k) == real_of_num(0))}) || FINITE({(k : A) | !(g(k) == real_of_num(0))}) → FINITE({(k : A) | !(f(k) * g(k) == real_of_num(0))})"), t1110))
}

///|
let finite_support_real_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT_REAL_MUL")

///|
/// `FINITE_SUPPORT_REAL_MUL`
pub fn finite_support_real_mul() -> @kernel.Thm {
  finite_support_real_mul_c.get()
}

///|
/// FINITE_SUPPORT_REAL_DIV
fn step_59() -> Unit raise {
  let t1117 = @sets.set_tac(@list.List([]))
  let t1116 = @simp.rewrite_tac(@list.List([@real.real_div_eq_0()]))
  let t1115 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t1114 = @tactics.disch_then(@tactics.disj_cases_then(fn(x1111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1112 = @tactics.mp_tac(x1111)
    fn(x1113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1112(x1113)
    }
  }))
  let t1118 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1114), t1115), t1116), t1117)
  finite_support_real_div_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Real, ∀ g : (A) -> Real, FINITE({(k : A) | !(f(k) == real_of_num(0))}) || FINITE({(k : A) | !(g(k) == real_of_num(0))}) → FINITE({(k : A) | !(f(k) / g(k) == real_of_num(0))})"), t1118))
}

///|
let finite_support_real_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT_REAL_DIV")

///|
/// `FINITE_SUPPORT_REAL_DIV`
pub fn finite_support_real_div() -> @kernel.Thm {
  finite_support_real_div_c.get()
}

///|
/// FINITE_SUPPORT_REAL_OF_NUM
fn step_60() -> Unit raise {
  let t1119 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq()]))
  finite_support_real_of_num_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (A) -> Num, FINITE({(k : A) | !(f(k) == 0)}) → FINITE({(k : A) | !(real_of_num(f(k)) == real_of_num(0))})"), t1119))
}

///|
let finite_support_real_of_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUPPORT_REAL_OF_NUM")

///|
/// `FINITE_SUPPORT_REAL_OF_NUM`
pub fn finite_support_real_of_num() -> @kernel.Thm {
  finite_support_real_of_num_c.get()
}

///|
/// `REAL_FINITE_SUPPORT_TAC`
pub fn real_finite_support_tac(x1120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let gl = x1120
  let t1127 = @tactics.then_tac(@tactics.disj2_tac, real_finite_support_tac)
  let t1128 = @tactics.orelse_tac(@tactics.then_tac(@tactics.disj1_tac, real_finite_support_tac), t1127)
  let t1126 = @tactics.match_mp_tac(finite_support_real_div())
  let t1129 = @tactics.then_tac(@tactics.orelse_tac(@tactics.match_mp_tac(finite_support_real_mul()), t1126), t1128)
  let t1124 = @tactics.match_mp_tac(finite_support_real_sub())
  let t1125 = @tactics.then_tac(@tactics.then_tac(@tactics.orelse_tac(@tactics.match_mp_tac(finite_support_real_add()), t1124), @tactics.conj_tac), finite_support_tac)
  let t1123 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(finite_support_spow()), @tactics.conj_tac), @list.List([real_finite_support_tac, @calc_rat.real_arith_tac]))
  let t1122 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(finite_support_real_pow()), @tactics.conj_tac), @list.List([real_finite_support_tac, @int.arith_tac]))
  let t1121 = @tactics.then_tac(@tactics.match_mp_tac(finite_support_real_inv()), real_finite_support_tac)
  @tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.then_tac(@tactics.match_mp_tac(finite_support_real_of_num()), finite_support_tac), t1121), t1122), t1123), t1125), t1129)(gl)
}

///|
/// support_containment
fn step_61() -> Unit raise {
  let t1130 = @simp.rewrite_tac(@list.List([]))
  let dummy = @tactics.prove(@term_syntax.parse_term("(∀ n : _, ∀ k : _, !IN(k, (s : (_, _) -> Bool)(n)) → (f : (_, _) -> Real)(n, k) == real_of_num(0)) → (∀ n : _, sum(s(n), f(n)) == sum(s(n), f(n)))"), t1130)
  support_containment_c.set(fn(x1131 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let ntm = x1131
    fn(x1132 : @kernel.Term) -> @kernel.Term raise {
      let tm = x1132
      let t1133 = @bool.mk_forall(ntm, @basics.mk_eq(tm, tm))
      let th = @drule.part_match(@kernel.rand, dummy)(t1133)
      let tm_p = @equal.lhand(@kernel.concl(th))
      let th_p = @lib.funpow(2, fn(x1134 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1135 = @equal.binder_conv(x1134)
        fn(x1136 : @kernel.Term) -> @kernel.Thm raise {
          s1135(x1136)
        }
      }, @equal.rand_conv(@equal.land_conv(@equal.try_conv(@equal.beta_conv))))(tm_p)
      @kernel.rand(@kernel.concl(th_p))
    }
  })
}

///|
let support_containment_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise] = @lib.Cell::new("support_containment")

///|
/// `support_containment`
pub fn support_containment(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
  (support_containment_c.get())(x)
}

///|
/// finite_support
fn step_62() -> Unit raise {
  let t1137 = @simp.rewrite_tac(@list.List([]))
  let dummy = @tactics.prove(@term_syntax.parse_term("(∀ n : _, FINITE({(k : _) | !((f : (_, _) -> Real)(n, k) == real_of_num(0))})) → (∀ n : _, sum((s : (_, _) -> Bool)(n), f(n)) == sum(s(n), f(n)))"), t1137)
  finite_support_c.set(fn(x1138 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let ntm = x1138
    fn(x1139 : @kernel.Term) -> @kernel.Term raise {
      let tm = x1139
      let t1140 = @bool.mk_forall(ntm, @basics.mk_eq(tm, tm))
      let th = @drule.part_match(@kernel.rand, dummy)(t1140)
      let tm_p = @equal.lhand(@kernel.concl(th))
      let th_p = @equal.binder_conv(@equal.rand_conv(@equal.rand_conv(@equal.abs_conv(@equal.binder_conv(@equal.land_conv(@equal.rand_conv(@equal.land_conv(@equal.try_conv(@equal.beta_conv)))))))))(tm_p)
      @kernel.rand(@kernel.concl(th_p))
    }
  })
}

///|
let finite_support_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise] = @lib.Cell::new("finite_support")

///|
/// `finite_support`
pub fn finite_support(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
  (finite_support_c.get())(x)
}

///|
/// SUPPORT_CONTAINMENT_TAC
fn step_63() -> Unit raise {
  support_containment_tac_c.set(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.in_numseg(), @realarith.real_entire(), @real.real_div_eq_0(), @realax.real_of_num_eq(), @binomial.binom_eq_0(), spow_eq_0(), @real.real_pow_eq_0(), @calc_num.arith_eq(), @arith.fact_nz(), @real.real_neg_eq_0(), @sets.in_univ(), @sets.in_elim_thm(), @sets.not_in_empty()])), @int.asm_arith_tac))
}

///|
let support_containment_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("SUPPORT_CONTAINMENT_TAC")

///|
/// `SUPPORT_CONTAINMENT_TAC`
pub fn support_containment_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (support_containment_tac_c.get())(x)
}

///|
/// SUPPORT_CONTAINMENT_IMP_UNIVERSALIZE
fn step_64() -> Unit raise {
  let t1143 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1142 = @tactics.match_mp_tac(@iterate.sum_superset())
  let t1141 = @tactics.conv_tac(@equal.sym_conv)
  let t1144 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1141), t1142), t1143)
  support_containment_imp_universalize_c.set(@tactics.prove(@term_syntax.parse_term("(∀ n : Num, ∀ k : Num, !IN(k, (s : (Num, Num) -> Bool)(n)) → (f : (Num, Num) -> Real)(n, k) == real_of_num(0)) → (∀ n : Num, sum(s(n), f(n)) == sum(UNIV, f(n)))"), t1144))
}

///|
let support_containment_imp_universalize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUPPORT_CONTAINMENT_IMP_UNIVERSALIZE")

///|
/// `SUPPORT_CONTAINMENT_IMP_UNIVERSALIZE`
pub fn support_containment_imp_universalize() -> @kernel.Thm {
  support_containment_imp_universalize_c.get()
}

///|
/// SUPPORT_CONTAINMENT_IMP_FINITE
fn step_65() -> Unit raise {
  let t1148 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1147 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg()]))
  let t1146 = @tactics.exists_tac(@term_syntax.parse_term("op_dot_dot((a : (Num) -> Num)((n : Num)), (b : (Num) -> Num)(n))"))
  let t1145 = @tactics.match_mp_tac(@sets.finite_subset())
  let t1149 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1145), t1146), t1147), t1148)
  support_containment_imp_finite_c.set(@tactics.prove(@term_syntax.parse_term("(∀ n : Num, ∀ k : Num, !IN(k, op_dot_dot((a : (Num) -> Num)(n), (b : (Num) -> Num)(n))) → (f : (Num, Num) -> Real)(n, k) == real_of_num(0)) → (∀ n : Num, FINITE({(k : Num) | !(f(n, k) == real_of_num(0))}))"), t1149))
}

///|
let support_containment_imp_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUPPORT_CONTAINMENT_IMP_FINITE")

///|
/// `SUPPORT_CONTAINMENT_IMP_FINITE`
pub fn support_containment_imp_finite() -> @kernel.Thm {
  support_containment_imp_finite_c.get()
}

///|
/// `SUPPORT_RULE`
pub fn support_rule(x1150 : @kernel.Term, x1151 : @kernel.Term) -> ((@kernel.Thm, @kernel.Thm, @kernel.Thm)) raise {
  let ntm = x1150
  let tm = x1151
  let cth = @tactics.prove(support_containment(ntm)(tm), support_containment_tac)
  let t1152 = @drule.match_mp(support_containment_imp_universalize())(cth)
  let eth = @equal.conv_rule(@equal.binder_conv(@equal.binop_conv(@equal.rand_conv(@equal.try_conv(@equal.beta_conv)))), t1152)
  let fth = try {
    @drule.match_mp(support_containment_imp_finite())(cth)
  } catch {
    Failure(_) => {
      let t1153 = @tactics.then_tac(@tactics.gen_tac, real_finite_support_tac)
      @tactics.prove(finite_support(ntm)(tm), t1153)
    }
    e => raise e
  }
  (cth, eth, fth)
}

///|
/// pats
fn step_66() -> Unit raise {
  let t1159 = @term_syntax.parse_term("pow(real_of_num((p : Num)), (n : Num))")
  let t1160 = (@term_syntax.parse_term("real_of_num(EXP((p : Num), (n : Num)))"), t1159)
  let t1158 = @term_syntax.parse_term("real_of_num((p : Num)) * real_of_num((q : Num))")
  let t1161 = (@term_syntax.parse_term("real_of_num((p : Num) * (q : Num))"), t1158)
  let t1157 = @term_syntax.parse_term("real_of_num((p : Num)) - real_of_num((q : Num))")
  let t1162 = (@term_syntax.parse_term("real_of_num((p : Num) - (q : Num))"), t1157)
  let t1156 = @term_syntax.parse_term("real_of_num((p : Num)) + real_of_num((q : Num))")
  let t1163 = (@term_syntax.parse_term("real_of_num((p : Num) + (q : Num))"), t1156)
  let t1155 = @term_syntax.parse_term("rfact(real_of_num((p : Num)))")
  let t1164 = (@term_syntax.parse_term("real_of_num(FACT((p : Num)))"), t1155)
  let t1154 = @term_syntax.parse_term("rbinom((real_of_num((p : Num)), real_of_num((q : Num))))")
  pats_c.set(@list.List([(@term_syntax.parse_term("real_of_num(binom(((p : Num), (q : Num))))"), t1154), t1164, t1163, t1162, t1161, t1160]))
}

///|
let pats_c : @lib.Cell[@list.List[(@kernel.Term, @kernel.Term)]] = @lib.Cell::new("pats")

///|
/// `pats`
pub fn pats() -> @list.List[(@kernel.Term, @kernel.Term)] {
  pats_c.get()
}

///|
/// `repper`
pub fn repper(x1165 : @kernel.Term) -> @kernel.Term raise {
  let tm = x1165
  @lib.tryfind(fn(x1166 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    let (ptm, qtm) = x1166
    @drule.instantiate(@drule.term_match(@list.List([]), ptm, tm), qtm)
  }, pats())
}

///|
/// ron_tm
fn step_67() -> Unit raise {
  ron_tm_c.set(@term_syntax.parse_term("real_of_num"))
}

///|
let ron_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("ron_tm")

///|
/// `ron_tm`
pub fn ron_tm() -> @kernel.Term {
  ron_tm_c.get()
}

///|
/// real_ty
fn step_68() -> Unit raise {
  real_ty_c.set(@parser.parse_type("real"))
}

///|
let real_ty_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("real_ty")

///|
/// `real_ty`
pub fn real_ty() -> @kernel.HolType {
  real_ty_c.get()
}

///|
/// `limit_variant`
pub fn limit_variant(x1167 : @kernel.Term, x1168 : @kernel.Term, x1169 : @kernel.Term) -> @kernel.Term raise {
  let ktm = x1167
  let ntm = x1168
  let tm = x1169
  let tm_p = try {
    repper(tm)
  } catch {
    Failure(_) => tm
    e => raise e
  }
  if @kernel.is_comb(tm_p) {
    let (ltm, rtm) = @kernel.dest_comb(tm_p)
    if ((ltm == ron_tm()) && ((rtm == ktm) || (rtm == ntm))) {
      @kernel.mk_var(@kernel.dest_var(rtm).0, real_ty())
    } else {
      let t1170 = limit_variant(ktm, ntm, rtm)
      @kernel.mk_comb(limit_variant(ktm, ntm, ltm), t1170)
    }
  } else {
    tm_p
  }
}

///|
/// add_tm
fn step_69() -> Unit raise {
  add_tm_c.set(@term_syntax.parse_term("(op_plus : (Num, Num) -> Num)"))
}

///|
let add_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("add_tm")

///|
/// `add_tm`
pub fn add_tm() -> @kernel.Term {
  add_tm_c.get()
}

///|
/// pth_mult
fn step_70() -> Unit raise {
  let t1178 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @class.contrapos_thm()]))
  let t1175 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.finite_subset()))
  let t1177 = @tactics.first_x_assum(fn(x1176 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1175(x1176))
  })
  let t1174 = @simp.asm_simp_tac(@list.List([@realarith.real_entire()]))
  let t1173 = @simp.asm_rewrite_tac(@list.List([@iterate.sum_lmul()]))
  let t1172 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1171 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t1179 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1171), @tactics.strip_tac), @tactics.gen_tac), t1172), t1173), t1174), t1177), t1178)
  pth_mult_c.set(@tactics.prove(@term_syntax.parse_term("(∀ k : Num, !IN(k, (s : (Num) -> Bool)) → (f : (Num) -> Real)(k) == real_of_num(0)) && sum(s, (k : Num) => f(k)) == sum(UNIV, (k : Num) => f(k)) && FINITE({(k : Num) | !(f(k) == real_of_num(0))}) → (∀ c : Real, (∀ k : Num, !IN(k, s) → c * f(k) == real_of_num(0)) && c * sum(s, (k : Num) => f(k)) == sum(UNIV, (k : Num) => c * f(k)) && FINITE({(k : Num) | !(c * f(k) == real_of_num(0))}))"), t1179))
}

///|
let pth_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_mult")

///|
/// `pth_mult`
pub fn pth_mult() -> @kernel.Thm {
  pth_mult_c.get()
}

///|
/// pth_add
fn step_71() -> Unit raise {
  let t1189 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union(), @sets.in_elim_thm()]))
  let t1188 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.finite_subset()))
  let t1187 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@sets.finite_union())]))
  let t1186 = @tactics.disch_then(@tactics.conjuncts_then(fn(x1185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1184 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1182 = @tactics.mp_tac(x1181)
        fn(x1183 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1182(x1183)
        }
      })(@lib.last(x1184))
    })(@bool.conjuncts_rule(x1185))
  }))
  let t1180 = @simp.simp_tac(@list.List([@iterate.sum_add_gen(), @sets.in_univ(), @class.eta_ax()]))
  let t1190 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@sets.in_union(), @class.de_morgan_thm(), @realax.real_add_lid()])), t1180), t1186), t1187), t1188), t1189), @calc_rat.real_arith_tac)
  pth_add_c.set(@tactics.prove(@term_syntax.parse_term("((∀ k : Num, !IN(k, (s : (Num) -> Bool)) → (f' : (Num) -> Real)(k) == real_of_num(0)) && (f : Real) == sum(UNIV, (k : Num) => f'(k)) && FINITE({(k : Num) | !(f'(k) == real_of_num(0))})) && (∀ k : Num, !IN(k, (t : (Num) -> Bool)) → (g' : (Num) -> Real)(k) == real_of_num(0)) && (g : Real) == sum(UNIV, (k : Num) => g'(k)) && FINITE({(k : Num) | !(g'(k) == real_of_num(0))}) → (∀ k : Num, !IN(k, UNION(s, t)) → f'(k) + g'(k) == real_of_num(0)) && f + g == sum(UNIV, (k : Num) => f'(k) + g'(k)) && FINITE({(k : Num) | !(f'(k) + g'(k) == real_of_num(0))})"), t1190))
}

///|
let pth_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_add")

///|
/// `pth_add`
pub fn pth_add() -> @kernel.Thm {
  pth_add_c.get()
}

///|
/// OUTPUT_SIMP_CONV
fn step_72() -> Unit raise {
  let t1194 = @simp.rewrite_conv(@list.List([@calc_int.real_mul_lzero(), @realax.real_inv_0(), @calc_int.real_mul_rzero()]))
  let t1193 = @simp.rewrite_conv(@list.List([@calc_int.real_mul_lzero(), @realax.real_inv_0(), @calc_int.real_mul_rzero()]))
  let t1192 = @simp.rewrite_conv(@list.List([@bool.conjunct1(@binomial.binom()), @binomial.binom_refl()]))
  let t1191 = @simp.rewrite_conv(@list.List([@arith.add_clauses(), @arith.mult_clauses()]))
  output_simp_conv_c.set(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@simp.rewrite_conv(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_inv_pow(), @real.real_inv_inv()])), @calc_num.num_reduce_conv), t1191), t1192), @calc_rat.real_rat_reduce_conv), t1193), @calc_rat.real_rat_reduce_conv), t1194), @calc_rat.real_rat_reduce_conv))
}

///|
let output_simp_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("OUTPUT_SIMP_CONV")

///|
/// `OUTPUT_SIMP_CONV`
pub fn output_simp_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (output_simp_conv_c.get())(x)
}

///|
/// `WZ_INITIAL_REDUCTIONS`
pub fn wz_initial_reductions(x1195 : @kernel.Term, x1196 : @kernel.Term, x1197 : @kernel.Term, x1198 : @list.List[@kernel.Term], x1199 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term], @kernel.Thm)) raise {
  let ntm = x1195
  let stm = x1196
  let rtm = x1197
  let ctm = x1198
  let atm = x1199
  let (ktm, bod) = @kernel.dest_abs(@kernel.rand(stm))
  let parms = @lib.filter(fn(x1200 : @kernel.Term) -> Bool raise {
    let t = x1200
    let t1201 = @parser.parse_type("real")
    (@kernel.type_of(t) == t1201)
  }, @lib.map(fn(x1202 : @kernel.Term) -> @kernel.Term raise {
    let t_1 = x1202
    let t1203 = @parser.parse_type("num")
    if (@kernel.type_of(t_1) == t1203) {
      @kernel.mk_comb(@term_syntax.parse_term("real_of_num"), t_1)
    } else {
      t_1
    }
  }, @lib.subtract(@kernel.frees(stm), @list.List([ntm]))))
  let nntm = @kernel.mk_var(@kernel.dest_var(ntm).0, real_ty())
  let kktm = @kernel.mk_var(@kernel.dest_var(ktm).0, real_ty())
  let (cth0, eth0, fth0) = support_rule(ntm, stm)
  let t1204 = @bool.spec(ntm, fth0)
  let t1205 = @bool.conj(@bool.spec(ntm, eth0), t1204)
  let cmbth0 = @bool.gen(ntm, @bool.conj(@bool.spec(ntm, cth0), t1205))
  let cths = @lib.map(fn(x1206 : (@kernel.Term, Int64)) -> @kernel.Thm raise {
    let (c, i) = x1206
    let ntm_p = if (i == 0L) {
      ntm
    } else {
      let t1207 = @nums.mk_small_numeral(i)
      @kernel.mk_comb(@kernel.mk_comb(add_tm(), ntm), t1207)
    }
    let t1208 = @bool.spec(ntm_p, cmbth0)
    @bool.spec(c, @drule.match_mp(pth_mult())(t1208))
  }, @lib.zip(ctm, @lib.range(0L, @lib.sub63(Int::to_int64(@lib.length(ctm)), 1L))))
  let efth1 = @bool.conjunct2(@lib.end_itlist(fn(x1209 : @kernel.Thm, x1210 : @kernel.Thm) -> @kernel.Thm raise {
    let th1 = x1209
    let th2 = x1210
    let t1211 = @bool.conj(th1, th2)
    @drule.match_mp(pth_add())(t1211)
  }, cths))
  let eth1 = @bool.conjunct1(efth1)
  let fth1 = @bool.conjunct2(efth1)
  let eth = @bool.gen(ntm, eth1)
  let fth = @bool.gen(ntm, fth1)
  let hbod = @basics.body(@kernel.rand(@kernel.rand(@kernel.concl(eth1))))
  let t1212 = (kktm, @kernel.mk_comb(ron_tm(), ktm))
  let rtm_p = @basics.subst(@list.List([(nntm, @kernel.mk_comb(ron_tm(), ntm)), t1212]), rtm)
  let ptm = if @list.List::is_empty(atm) {
    @kernel.concl(@bool.truth())
  } else {
    @bool.list_mk_conj(atm)
  }
  let t1215 = @equal.gsym(@calc_int.real_of_num_pow())
  let t1216 = @equal.gsym(@realax.real_of_num_mul())
  let t1217 = @equal.gsym(@realax.real_of_num_add())
  let t1218 = @equal.gsym(@real.real_of_num_suc())
  let t1219 = @equal.gsym(@real.real_of_num_ge())
  let t1220 = @equal.gsym(@real.real_of_num_gt())
  let t1221 = @equal.gsym(@realax.real_of_num_le())
  let t1222 = @equal.gsym(@real.real_of_num_lt())
  let t1223 = @simp.rewrite_conv(@list.List([@equal.gsym(@realax.real_of_num_eq()), t1222, t1221, t1220, t1219, t1218, t1217, t1216, t1215]))
  let t1213 = @int.arith_rule(@term_syntax.parse_term("!((m : Num) == (n : Num)) == (m + 1 <= n || n + 1 <= m)"))
  let t1214 = @simp.rewrite_conv(@list.List([@equal.gsym(@arith.le_suc_lt()), t1213]))
  let pth = @equal.thenc(@equal.thenc(@simp.rewrite_conv(@list.List([@realax.real_of_num_eq(), @real.real_of_num_lt(), @realax.real_of_num_le(), @real.real_of_num_gt(), @real.real_of_num_ge(), @real.real_of_num_suc(), @realax.real_of_num_add(), @realax.real_of_num_mul(), @calc_int.real_of_num_pow()])), t1214), t1223)(ptm)
  let t1231 = @kernel.rand(rtm_p)
  let t1232 = @basics.mk_gabs(@pair.mk_pair((nntm, kktm)), t1231)
  let t1230 = @equal.lhand(rtm_p)
  let t1233 = @basics.mk_gabs(@pair.mk_pair((nntm, kktm)), t1230)
  let t1228 = limit_variant(ktm, ntm, hbod)
  let t1227 = (@term_syntax.parse_term("Im((z : Cart[Real, 2]))"), kktm)
  let t1229 = @basics.subst(@list.List([(@term_syntax.parse_term("Re((z : Cart[Real, 2]))"), nntm), t1227]), t1228)
  let t1234 = @kernel.mk_abs(@term_syntax.parse_term("(z : Cart[Real, 2])"), t1229)
  let t1225 = limit_variant(ktm, ntm, bod)
  let t1224 = (@term_syntax.parse_term("Im((z : Cart[Real, 2]))"), kktm)
  let t1226 = @basics.subst(@list.List([(@term_syntax.parse_term("Re((z : Cart[Real, 2]))"), nntm), t1224]), t1225)
  let t1235 = @kernel.mk_abs(@term_syntax.parse_term("(z : Cart[Real, 2])"), t1226)
  let t1236 = @basics.list_mk_abs(@list.List([ntm, ktm]), hbod)
  let t1237 = @basics.list_mk_abs(@list.List([ntm, ktm]), bod)
  let t1238 = @sets.mk_setenum((parms, @parser.parse_type("real")))
  let t1239 = @bool.specl(@list.List([@kernel.mk_abs(ntm, @kernel.rand(@kernel.concl(pth))), t1238, t1237, t1236, t1235, t1234, t1233, t1232]), zeilberger())
  let t1240 = @equal.conv_rule(@equal.top_depth_conv(@pair.gen_beta_conv), t1239)
  let th0 = @simp.pure_rewrite_rule(@list.List([@complexes.re(), @complexes.im()]))(t1240)
  let t1242 = @bool.conj(fth0, fth)
  let th1_1 = @bool.mp(@simp.gen_rewrite_rule(fn(x1241 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1241
  }, @list.List([@theorems.imp_conj()]))(th0), t1242)
  let th2_1 = @simp.gen_rewrite_rule(fn(x1257 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1253 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1249 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x1243 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1244 = @equal.rand_conv(x1243)
          fn(x1245 : @kernel.Term) -> @kernel.Thm raise {
            s1244(x1245)
          }
        })((fn(x1246 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1247 = @equal.binder_conv(x1246)
          fn(x1248 : @kernel.Term) -> @kernel.Thm raise {
            s1247(x1248)
          }
        })(x1249))
      })((fn(x1250 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1251 = @equal.rand_conv(x1250)
        fn(x1252 : @kernel.Term) -> @kernel.Thm raise {
          s1251(x1252)
        }
      })(x1253))
    })((fn(x1254 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1255 = @equal.land_conv(x1254)
      fn(x1256 : @kernel.Term) -> @kernel.Thm raise {
        s1255(x1256)
      }
    })(x1257))
  }, @list.List([@equal.gsym(eth)]))(th1_1)
  let th3 = @simp.gen_rewrite_rule(fn(x1268 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1264 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1258 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1259 = @equal.rand_conv(x1258)
        fn(x1260 : @kernel.Term) -> @kernel.Thm raise {
          s1259(x1260)
        }
      })((fn(x1261 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1262 = @equal.binder_conv(x1261)
        fn(x1263 : @kernel.Term) -> @kernel.Thm raise {
          s1262(x1263)
        }
      })(x1264))
    })((fn(x1265 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1266 = @equal.land_conv(x1265)
      fn(x1267 : @kernel.Term) -> @kernel.Thm raise {
        s1266(x1267)
      }
    })(x1268))
  }, @list.List([@equal.sym(pth)]))(th2_1)
  let th4 = @simp.pure_rewrite_rule(@list.List([@bool.conjunct1(@bool.spec_all(@theorems.imp_clauses()))]))(th3)
  let atms = @lib.filter(fn(x1269 : @kernel.Term) -> Bool raise {
    let a = x1269
    !@basics.free_in(ntm, a)
  }, atm)
  (atms, th4)
}

///|
/// SEPARATE_CONSTANT_CONV
fn step_73() -> Unit raise {
  let t1270 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc())])), @calc_rat.real_arith_tac)
  let pth = @tactics.prove(@term_syntax.parse_term("(x : Real) + real_of_num(SUC((n : Num))) == x + real_of_num(1) + real_of_num(n) && x + -real_of_num(SUC(n)) == x - real_of_num(1) + -real_of_num(n)"), t1270)
  let conv0 : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x1271 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1271
  }, @list.List([@calc_int.real_add_rid(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + -real_of_num(0) == x"))]))
  let t1275 = @simp.gen_rewrite_conv(fn(x1274 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1274
  }, @list.List([@bool.conjunct2(pth)]))
  let t1276 = @equal.thenc(@equal.rand_conv(@equal.rand_conv(@equal.rand_conv(@calc_num.num_conv))), t1275)
  let t1273 = @simp.gen_rewrite_conv(fn(x1272 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1272
  }, @list.List([@bool.conjunct1(pth)]))
  let conv1 : (@kernel.Term) -> @kernel.Thm raise = @equal.orelsec(@equal.thenc(@equal.rand_conv(@equal.rand_conv(@calc_num.num_conv)), t1273), t1276)
  let t1278 = @equal.try_conv(conv0)
  let t1277 = @equal.repeatc(conv1)
  separate_constant_conv_c.set(@equal.thenc(@equal.thenc(@equal.thenc(@calc_rat.real_poly_conv, @simp.pure_rewrite_conv(@list.List([@realax.real_add_assoc()]))), t1277), t1278))
}

///|
let separate_constant_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("SEPARATE_CONSTANT_CONV")

///|
/// `SEPARATE_CONSTANT_CONV`
pub fn separate_constant_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (separate_constant_conv_c.get())(x)
}

///|
/// pat_rfact
fn step_74() -> Unit raise {
  pat_rfact_c.set(@term_syntax.parse_term("rfact((x : Real))"))
}

///|
let pat_rfact_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("pat_rfact")

///|
/// `pat_rfact`
pub fn pat_rfact() -> @kernel.Term {
  pat_rfact_c.get()
}

///|
/// pat_rbinom
fn step_75() -> Unit raise {
  pat_rbinom_c.set(@term_syntax.parse_term("rbinom(((x : Real), (y : Real)))"))
}

///|
let pat_rbinom_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("pat_rbinom")

///|
/// `pat_rbinom`
pub fn pat_rbinom() -> @kernel.Term {
  pat_rbinom_c.get()
}

///|
/// pat_spow
fn step_76() -> Unit raise {
  pat_spow_c.set(@term_syntax.parse_term("spow((x : Real), (y : Real))"))
}

///|
let pat_spow_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("pat_spow")

///|
/// `pat_spow`
pub fn pat_spow() -> @kernel.Term {
  pat_spow_c.get()
}

///|
/// `APPLY_FBPOW_CONV`
pub fn apply_fbpow_conv(x1279 : (@kernel.Term) -> @kernel.Thm raise, x1280 : @kernel.Term) -> @kernel.Thm raise {
  let conv = x1279
  let tm = x1280
  if (@lib.can((x1281 : @kernel.Term) => @drule.term_match(@list.List([]), pat_rfact(), x1281), tm) || @lib.can((x1282 : @kernel.Term) => @drule.term_match(@list.List([]), pat_spow(), x1282), tm)) {
    @equal.rand_conv(conv)(tm)
  } else {
    if @lib.can((x1283 : @kernel.Term) => @drule.term_match(@list.List([]), pat_rbinom(), x1283), tm) {
      @equal.rand_conv(@equal.binop_conv(conv))(tm)
    } else {
      raise Failure("APPLY_FBPOW_CONV")
    }
  }
}

///|
/// pth_up
fn step_77() -> Unit raise {
  let t1305 = @simp.asm_rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t1304 = @simp.asm_simp_tac(@list.List([ratpolyfun_add(), ratpolyfun_const(), @floor.rational_closed()]))
  let t1303 = @simp.asm_rewrite_tac(@list.List([@realax.real_add_linv()]))
  let t1299 = @term_syntax.parse_term("GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), (p : (Real, Real) -> Real)(n, k) + real_of_num(1)))")
  let t1302 = @tactics.disch_then(fn(x1301 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1297 = @tactics.mp_tac(x1296)
      fn(x1298 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1297(x1298)
      }
    })(((x1300 : @kernel.Thm) => @bool.spec(t1299, x1300))(x1301))
  })
  let t1295 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1292 = @simp.gen_rewrite_rule(fn(x1289 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1290 = @equal.rand_conv(x1289)
    fn(x1291 : @kernel.Term) -> @kernel.Thm raise {
      s1290(x1291)
    }
  }, @list.List([ratty()]))
  let t1294 = @tactics.first_x_assum(fn(x1293 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1286 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1287 = @tactics.mp_tac(x1286)
      fn(x1288 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1287(x1288)
      }
    })(t1292(x1293))
  })
  let t1285 = @simp.rewrite_tac(@list.List([]))
  let t1284 = @simp.rewrite_tac(@list.List([rfact_step_up()]))
  let t1306 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1284), @class.cond_cases_tac), t1285), t1294), t1295), t1302), t1303), t1304), t1305)
  pth_up_c.set(@tactics.prove(@term_syntax.parse_term("!ratty((e : (Real) -> Bool), ((n : Real), (k : Real))) → ratpolyfun(e, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), (p : (Real, Real) -> Real)(n, k)))) && !(∀ n : Real, ∀ k : Real, p(n, k) + real_of_num(1) == real_of_num(0)) → rfact(p(n, k) + real_of_num(1)) == (p(n, k) + real_of_num(1)) * rfact(p(n, k))"), t1306))
}

///|
let pth_up_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_up")

///|
/// `pth_up`
pub fn pth_up() -> @kernel.Thm {
  pth_up_c.get()
}

///|
/// pth_down
fn step_78() -> Unit raise {
  let t1307 = @simp.rewrite_tac(@list.List([rfact_step_down()]))
  pth_down_c.set(@tactics.prove(@term_syntax.parse_term("!ratty((e : (Real) -> Bool), ((n : Real), (k : Real))) → rfact((p : (Real, Real) -> Real)(n, k) - real_of_num(1)) == rfact(p(n, k)) / p(n, k)"), t1307))
}

///|
let pth_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_down")

///|
/// `pth_down`
pub fn pth_down() -> @kernel.Thm {
  pth_down_c.get()
}

///|
/// `RFACT_STEP_CONV`
pub fn rfact_step_conv(x1308 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let nrth = x1308
  let pth_down_p = @drule.match_mp(pth_down())(nrth)
  let pth_up_p = @drule.match_mp(pth_up())(nrth)
  fn(x1310 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1310
    try {
      @drule.part_match(@equal.lhs, pth_down_p)(tm)
    } catch {
      Failure(_) => {
        let th = @drule.part_match(fn(x1311 : @kernel.Term) -> @kernel.Term raise {
          @equal.lhs(@kernel.rand(x1311))
        }, pth_up_p)(tm)
        let t1320 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
        let t1315 = @term_syntax.parse_term("real_of_num(7) / real_of_num(44)")
        let t1316 = @list.List([@term_syntax.parse_term("real_of_num(1) / real_of_num(12345)"), t1315])
        let t1319 = @tactics.disch_then(fn(x1318 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1313 = @tactics.mp_tac(x1312)
            fn(x1314 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1313(x1314)
            }
          })(((x1317 : @kernel.Thm) => @bool.specl(t1316, x1317))(x1318))
        })
        let t1321 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([ratpolyfun_tac, @tactics.all_tac])), t1319), t1320), @calc_rat.real_arith_tac)
        let sth = @tactics.prove(@equal.lhand(@kernel.concl(th)), t1321)
        @bool.mp(th, sth)
      }
      e => raise e
    }
  }
}

///|
/// pth_top_down
fn step_79() -> Unit raise {
  let t1322 = @simp.rewrite_tac(@list.List([rbinom_top_step_down()]))
  pth_top_down_c.set(@tactics.prove(@term_syntax.parse_term("!ratty((e : (Real) -> Bool), ((n : Real), (k : Real))) → rbinom(((p : (Real, Real) -> Real)(n, k) - real_of_num(1), (q : (Real, Real) -> Real)(n, k))) == (p(n, k) - q(n, k)) / p(n, k) * rbinom((p(n, k), q(n, k)))"), t1322))
}

///|
let pth_top_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_top_down")

///|
/// `pth_top_down`
pub fn pth_top_down() -> @kernel.Thm {
  pth_top_down_c.get()
}

///|
/// pth_both_down
fn step_80() -> Unit raise {
  let t1323 = @simp.rewrite_tac(@list.List([rbinom_step_both_down()]))
  pth_both_down_c.set(@tactics.prove(@term_syntax.parse_term("!ratty((e : (Real) -> Bool), ((n : Real), (k : Real))) → rbinom(((p : (Real, Real) -> Real)(n, k) - real_of_num(1), (q : (Real, Real) -> Real)(n, k) - real_of_num(1))) == q(n, k) / p(n, k) * rbinom((p(n, k), q(n, k)))"), t1323))
}

///|
let pth_both_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_both_down")

///|
/// `pth_both_down`
pub fn pth_both_down() -> @kernel.Thm {
  pth_both_down_c.get()
}

///|
let pth_both_up_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_both_up")

///|
/// `pth_both_up`
pub fn pth_both_up() -> @kernel.Thm {
  pth_both_up_c.get()
}

///|
let pth_top_up_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_top_up")

///|
/// `pth_top_up`
pub fn pth_top_up() -> @kernel.Thm {
  pth_top_up_c.get()
}

///|
let pth_bottom_up_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_bottom_up")

///|
/// `pth_bottom_up`
pub fn pth_bottom_up() -> @kernel.Thm {
  pth_bottom_up_c.get()
}

///|
let pth_bottom_down_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_bottom_down")

///|
/// `pth_bottom_down`
pub fn pth_bottom_down() -> @kernel.Thm {
  pth_bottom_down_c.get()
}

///|
/// pth_both_up, pth_top_up, pth_bottom_up, pth_bottom_down
fn step_81() -> Unit raise {
  let t1359 = @simp.asm_rewrite_tac(@list.List([@realarith.real_sub_0()]))
  let t1358 = @simp.asm_simp_tac(@list.List([ratpolyfun_sub(), ratpolyfun_add(), ratpolyfun_const(), @floor.rational_closed(), @real.real_sub_rzero()]))
  let t1357 = @simp.asm_rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t1356 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && !(r : Bool) → !(p && (q : Bool) && !r) → !q")))
  let t1355 = @simp.rewrite_tac(@list.List([]))
  let t1354 = @tactics.disch_then(fn(x1348 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1348
    fn(x1353 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      (fn(x1350 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let (asl, w) = x1350
        let t1352 = @equal.lhand(@kernel.rand(w))
        @tactics.mp_tac(@bool.spec(@basics.mk_gabs(@term_syntax.parse_term("((n : Real), (k : Real))"), t1352), th))
      })(x1353)(x1353)
    }
  })
  let t1347 = @simp.gen_rewrite_tac(fn(x1346 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1340 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1341 = @equal.rand_conv(x1340)
      fn(x1342 : @kernel.Term) -> @kernel.Thm raise {
        s1341(x1342)
      }
    })((fn(x1343 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1344 = @equal.rand_conv(x1343)
      fn(x1345 : @kernel.Term) -> @kernel.Thm raise {
        s1344(x1345)
      }
    })(x1346))
  }, @list.List([@equal.gsym(@realarith.real_sub_0())]))
  let t1339 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1336 = @simp.gen_rewrite_rule(fn(x1333 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1334 = @equal.rand_conv(x1333)
    fn(x1335 : @kernel.Term) -> @kernel.Thm raise {
      s1334(x1335)
    }
  }, @list.List([ratty()]))
  let t1338 = @tactics.first_x_assum(fn(x1337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1331 = @tactics.mp_tac(x1330)
      fn(x1332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1331(x1332)
      }
    })(t1336(x1337))
  })
  let t1329 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1325 = @tactics.match_mp_tac(rbinom_bottom_step_down())
  let t1326 = @tactics.match_mp_tac(rbinom_bottom_step())
  let t1327 = @tactics.match_mp_tac(rbinom_top_step())
  let t1328 = @list.List([@tactics.match_mp_tac(rbinom_step_both_up()), t1327, t1326, t1325])
  let t1360 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t1328), t1329), t1338), t1339), t1347), t1354), t1355), t1356), t1357), t1358), t1359)
  let t1361 = (@term_syntax.parse_term("(!ratty((e : (Real) -> Bool), ((n : Real), (k : Real))) → (ratpolyfun(e, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), (p : (Real, Real) -> Real)(n, k)))) && ratpolyfun(e, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), (q : (Real, Real) -> Real)(n, k))))) && !(∀ n : Real, ∀ k : Real, p(n, k) + real_of_num(1) == real_of_num(0)) && !(∀ n : Real, ∀ k : Real, q(n, k) + real_of_num(1) == real_of_num(0)) → rbinom((p(n, k) + real_of_num(1), q(n, k) + real_of_num(1))) == (p(n, k) + real_of_num(1)) / (q(n, k) + real_of_num(1)) * rbinom((p(n, k), q(n, k)))) && (!ratty(e, (n, k)) → (ratpolyfun(e, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), p(n, k)))) && ratpolyfun(e, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), q(n, k))))) && !(∀ n : Real, ∀ k : Real, p(n, k) + real_of_num(1) == real_of_num(0)) && !(∀ n : Real, ∀ k : Real, p(n, k) + real_of_num(1) == q(n, k)) → rbinom((p(n, k) + real_of_num(1), q(n, k))) == (p(n, k) + real_of_num(1)) / (p(n, k) - q(n, k) + real_of_num(1)) * rbinom((p(n, k), q(n, k)))) && (!ratty(e, (n, k)) → (ratpolyfun(e, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), p(n, k)))) && ratpolyfun(e, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), q(n, k))))) && !(∀ n : Real, ∀ k : Real, q(n, k) + real_of_num(1) == real_of_num(0)) → rbinom((p(n, k), q(n, k) + real_of_num(1))) == (p(n, k) - q(n, k)) / (q(n, k) + real_of_num(1)) * rbinom((p(n, k), q(n, k)))) && (!ratty(e, (n, k)) → (ratpolyfun(e, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), p(n, k)))) && ratpolyfun(e, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), q(n, k))))) && !(∀ n : Real, ∀ k : Real, p(n, k) + real_of_num(1) == q(n, k)) → rbinom((p(n, k), q(n, k) - real_of_num(1))) == q(n, k) / (p(n, k) - q(n, k) + real_of_num(1)) * rbinom((p(n, k), q(n, k))))"), t1360)
  let ths = @bool.conjuncts_rule((fn(x1324 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x1324.0, x1324.1)
  })(t1361))
  let t1362 = @lib.el(3, ths)
  let t1363 = @lib.el(2, ths)
  let t1364 = @lib.el(1, ths)
  let (pth_both_up, pth_top_up, pth_bottom_up, pth_bottom_down) = (@lib.el(0, ths), t1364, t1363, t1362)
  pth_both_up_c.set(pth_both_up)
  pth_top_up_c.set(pth_top_up)
  pth_bottom_up_c.set(pth_bottom_up)
  pth_bottom_down_c.set(pth_bottom_down)
}

///|
/// `RBINOM_STEP_CONV`
pub fn rbinom_step_conv(x1365 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let nrth = x1365
  let ths = @lib.map(fn(x1367 : @kernel.Thm) -> @kernel.Thm raise {
    @drule.match_mp(x1367)(nrth)
  }, @list.List([pth_top_down(), pth_both_down(), pth_both_up(), pth_top_up(), pth_bottom_up(), pth_bottom_down()]))
  let pth_top_down_p = @lib.el(0, ths)
  let pth_both_down_p = @lib.el(1, ths)
  let pth_both_up_p = @lib.el(2, ths)
  let pth_top_up_p = @lib.el(3, ths)
  let pth_bottom_up_p = @lib.el(4, ths)
  let pth_bottom_down_p = @lib.el(5, ths)
  fn(x1368 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1368
    try {
      @drule.part_match(@equal.lhs, pth_both_down_p)(tm)
    } catch {
      Failure(_) => {
        try {
          @drule.part_match(@equal.lhs, pth_top_down_p)(tm)
        } catch {
          Failure(_) => {
            let th = try {
              @drule.part_match(fn(x1369 : @kernel.Term) -> @kernel.Term raise {
                @equal.lhs(@kernel.rand(x1369))
              }, pth_both_up_p)(tm)
            } catch {
              Failure(_) => {
                try {
                  @drule.part_match(fn(x1370 : @kernel.Term) -> @kernel.Term raise {
                    @equal.lhs(@kernel.rand(x1370))
                  }, pth_top_up_p)(tm)
                } catch {
                  Failure(_) => {
                    try {
                      @drule.part_match(fn(x1371 : @kernel.Term) -> @kernel.Term raise {
                        @equal.lhs(@kernel.rand(x1371))
                      }, pth_bottom_up_p)(tm)
                    } catch {
                      Failure(_) => @drule.part_match(fn(x1372 : @kernel.Term) -> @kernel.Term raise {
                        @equal.lhs(@kernel.rand(x1372))
                      }, pth_bottom_down_p)(tm)
                      e => raise e
                    }
                  }
                  e => raise e
                }
              }
              e => raise e
            }
            let t1383 = @tactics.conv_tac(@calc_rat.real_ring)
            let t1382 = @tactics.disch_then(fn(x1375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let th_1 = x1375
              let t1380 = @term_syntax.parse_term("real_of_num(55)")
              let t1381 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(0)"), t1380]), th_1))
              let t1378 = @term_syntax.parse_term("real_of_num(3) / real_of_num(4)")
              let t1379 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("-real_of_num(99) / real_of_num(12)"), t1378]), th_1))
              let t1377 = @term_syntax.parse_term("real_of_num(7) / real_of_num(44)")
              @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(1) / real_of_num(12345)"), t1377]), th_1)), t1379), t1381)
            })
            let t1374 = @tactics.try_tac(@calc_rat.real_arith_tac)
            let t1373 = @tactics.repeat_tac(@tactics.conj_tac)
            let t1384 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), ratpolyfun_tac), @tactics.all_tac])), t1373), t1374), t1382), t1383)
            let sth = @tactics.prove(@equal.lhand(@kernel.concl(th)), t1384)
            @bool.mp(th, sth)
          }
          e => raise e
        }
      }
      e => raise e
    }
  }
}

///|
/// SPOW_STEP_CONV
fn step_82() -> Unit raise {
  spow_step_conv_c.set(@simp.gen_rewrite_conv(fn(x1385 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1385
  }, @list.List([spow_step_up(), spow_step_down()])))
}

///|
let spow_step_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("SPOW_STEP_CONV")

///|
/// `SPOW_STEP_CONV`
pub fn spow_step_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (spow_step_conv_c.get())(x)
}

///|
/// pth_zero
fn step_83() -> Unit raise {
  let t1386 = @meson.meson_tac(@list.List([@floor.rational_closed()]))
  pth_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, !rational(x) → !(x == real_of_num(0))"), t1386))
}

///|
let pth_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_zero")

///|
/// `pth_zero`
pub fn pth_zero() -> @kernel.Thm {
  pth_zero_c.get()
}

///|
/// pth_rfact
fn step_84() -> Unit raise {
  let t1389 = @simp.asm_simp_tac(@list.List([@floor.integer_closed(), @floor.real_lt_integers()]))
  let t1388 = @simp.asm_simp_tac(@list.List([@floor.rational_closed()]))
  let t1387 = @class.asm_cases_tac(@term_syntax.parse_term("integer((x : Real))"))
  let t1390 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([rfact_eq_0()]))), t1387), t1388), t1389), @calc_rat.real_arith_tac)
  pth_rfact_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, !(rational(x) && x <= -real_of_num(1)) → !(rfact(x) == real_of_num(0))"), t1390))
}

///|
let pth_rfact_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_rfact")

///|
/// `pth_rfact`
pub fn pth_rfact() -> @kernel.Thm {
  pth_rfact_c.get()
}

///|
/// pth_rbinom
fn step_85() -> Unit raise {
  let t1391 = @simp.simp_tac(@list.List([rbinom(), @real.real_div_eq_0(), @realarith.real_entire(), pth_rfact()]))
  pth_rbinom_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, !(rational(x) && x <= -real_of_num(1)) && !(rational(y) && y <= -real_of_num(1)) && !(rational(x - y) && x - y <= -real_of_num(1)) → !(rbinom((x, y)) == real_of_num(0))"), t1391))
}

///|
let pth_rbinom_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_rbinom")

///|
/// `pth_rbinom`
pub fn pth_rbinom() -> @kernel.Thm {
  pth_rbinom_c.get()
}

///|
/// pth_spow
fn step_86() -> Unit raise {
  let t1393 = @meson.asm_meson_tac(@list.List([@floor.rational_closed()]))
  let t1392 = @simp.rewrite_tac(@list.List([@real.real_eq_mul_rcancel(), @transcendentals.pi_nz()]))
  let t1394 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([spow_eq_0(), @transcendentals.cos_eq_0()]))), t1392), t1393)
  pth_spow_c.set(@tactics.prove(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) && !rational((y : Real)) → !(spow(x, y) == real_of_num(0))"), t1394))
}

///|
let pth_spow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_spow")

///|
/// `pth_spow`
pub fn pth_spow() -> @kernel.Thm {
  pth_spow_c.get()
}

///|
/// pth_main
fn step_87() -> Unit raise {
  let t1401 = @meson.asm_meson_tac(@list.List([]))
  let t1400 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @realarith.real_sub_0()]))
  let t1399 = @simp.asm_simp_tac(@list.List([ratpolyfun_sub(), ratpolyfun_const(), @real.real_sub_refl()]))
  let t1398 = @tactics.exists_tac(@term_syntax.parse_term("GABS((f : ((Real, Real)) -> Real) => ∀ x : Real, ∀ y : Real, GEQ(f((x, y)), (p : (Real, Real) -> Real)(x, y) - p((n : Real), (k : Real))))"))
  let t1397 = @simp.rewrite_tac(@list.List([ratty()]))
  let t1396 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t1402 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1395 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1395
  }, @list.List([@equal.gsym(@class.contrapos_thm())])), t1396), @tactics.strip_tac), t1397), t1398), t1399), t1400), t1401)
  pth_main_c.set(@tactics.prove(@term_syntax.parse_term("!ratty((e : (Real) -> Bool), ((n : Real), (k : Real))) → ratpolyfun(e, GABS((f : ((Real, Real)) -> Real) => ∀ n : Real, ∀ k : Real, GEQ(f((n, k)), (p : (Real, Real) -> Real)(n, k)))) && !(∃ c : Real, ∀ n : Real, ∀ k : Real, p(n, k) == c) → !rational(p(n, k))"), t1402))
}

///|
let pth_main_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth_main")

///|
/// `pth_main`
pub fn pth_main() -> @kernel.Thm {
  pth_main_c.get()
}

///|
/// NONZERO_RATTY_TAC
fn step_88() -> Unit raise {
  let t1443 = @tactics.conv_tac(@calc_rat.real_ring)
  let t1442 = @tactics.disch_then(@tactics.choose_then(fn(x1435 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1435
    let t1440 = @term_syntax.parse_term("real_of_num(55)")
    let t1441 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(0)"), t1440]), th))
    let t1438 = @term_syntax.parse_term("real_of_num(3) / real_of_num(4)")
    let t1439 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("-real_of_num(99) / real_of_num(12)"), t1438]), th))
    let t1437 = @term_syntax.parse_term("real_of_num(7) / real_of_num(44)")
    @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(1) / real_of_num(12345)"), t1437]), th)), t1439), t1441)
  }))
  let t1434 = @tactics.thenl(@tactics.conj_tac, @list.List([ratpolyfun_tac, @tactics.all_tac]))
  let t1431 = @drule.match_mp(pth_main())
  let t1433 = @tactics.first_assum(fn(x1432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1431(x1432))
  })
  let t1430 = @simp.rewrite_tac(@list.List([]))
  let t1429 = @tactics.try_tac(@tactics.disch_then(fn(x1428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1426 = @tactics.mp_tac(x1425)
      fn(x1427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1426(x1427)
      }
    })(@bool.conjunct1(x1428))
  }))
  let t1424 = @tactics.try_tac(@tactics.then_tac(@tactics.disch_then(fn(x1423 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1421 = @tactics.mp_tac(x1420)
      fn(x1422 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1421(x1422)
      }
    })(@bool.conjunct2(x1423))
  }), @calc_rat.asm_real_arith_tac))
  let t1418 = @tactics.match_mp_tac(pth_zero())
  let t1417 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(pth_rbinom()), @tactics.conj_tac), @list.List([@tactics.all_tac, @tactics.conj_tac]))
  let t1416 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(pth_spow()), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))
  let t1419 = @tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.match_mp_tac(pth_rfact()), t1416), t1417), t1418)
  let t1415 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1413 = @tactics.disch_then(fn(x1412 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1409 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1410 = @tactics.mp_tac(x1409)
      fn(x1411 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1410(x1411)
      }
    })(@bool.conjunct1(x1412))
  })
  let t1414 = @tactics.try_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1406 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1407 = @equal.rand_conv(x1406)
    fn(x1408 : @kernel.Term) -> @kernel.Thm raise {
      s1407(x1408)
    }
  }, @list.List([spow_eq_0()])), t1413))
  let t1405 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1404 = @simp.rewrite_tac(@list.List([@real.real_pow_eq_0(), @real.real_neg_eq_0()]))
  let t1403 = @tactics.try_tac(@calc_rat.asm_real_arith_tac)
  nonzero_ratty_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t1403), t1404), t1405), t1414), t1415), t1419), t1424), t1429), t1430), t1433), t1434), t1442), t1443))
}

///|
let nonzero_ratty_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("NONZERO_RATTY_TAC")

///|
/// `NONZERO_RATTY_TAC`
pub fn nonzero_ratty_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (nonzero_ratty_tac_c.get())(x)
}

///|
/// `TACTIC_4`
pub fn tactic_4(x1444 : @list.List[(String, @kernel.Thm)], x1445 : @kernel.Term) -> @tactics.Goalstate raise {
  let (asl, w) = (x1444, x1445)
  let t1446 = @term_syntax.parse_term("!ratty((e : (Real) -> Bool), ((n : Real), (k : Real)))")
  let nrth = @lib.find((x1452 : (String, @kernel.Thm)) => @lib.can(fn(x1451 : (String, @kernel.Thm)) -> (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise {
    (fn(x1449 : @kernel.Thm) -> (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise {
      ((x1447 : @kernel.Term) => @drule.term_match(@list.List([]), t1446, x1447))((fn(x1448 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x1448)
      })(x1449))
    })((fn(x1450 : (String, @kernel.Thm)) -> @kernel.Thm raise {
      x1450.1
    })(x1451))
  }, x1452), asl).1
  let t1459 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1458 = @simp.rewrite_tac(@list.List([@realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv(), @real.real_inv_pow()]))
  let t1457 = @tactics.conv_tac(@equal.once_depth_conv((x1456 : @kernel.Term) => apply_fbpow_conv(@calc_rat.real_poly_conv, x1456)))
  let t1454 = rbinom_step_conv(nrth)
  let t1455 = @tactics.conv_tac(@equal.top_depth_conv(@equal.orelsec(@equal.orelsec(rfact_step_conv(nrth), t1454), spow_step_conv)))
  @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.once_depth_conv((x1453 : @kernel.Term) => apply_fbpow_conv(separate_constant_conv, x1453))), t1455), t1457), t1458), t1459), fn(x1469 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1460 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl_1, w_1) = x1460
      let itms = @basics.find_terms(fn(x1462 : @kernel.Term) -> Bool raise {
        let t = x1462
        if @kernel.is_comb(t) {
          let t1463 = @term_syntax.parse_term("real_inv")
          (@kernel.rator(t) == t1463)
        } else {
          false
        }
      }, w_1)
      @tactics.subgoal_then(@bool.list_mk_conj(@lib.map(fn(x1464 : @kernel.Term) -> @kernel.Term raise {
        let t_1 = x1464
        let t1465 = @term_syntax.parse_term("real_of_num(0)")
        @bool.mk_neg(@basics.mk_eq(@kernel.rand(t_1), t1465))
      }, itms)), fn(x1466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1467 = @tactics.mp_tac(x1466)
        fn(x1468 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1467(x1468)
        }
      })
    })(x1469)(x1469)
  }), @list.List([nonzero_ratty_tac, special_real_field_tac]))((asl, w))
}

///|
/// pth
fn step_89() -> Unit raise {
  pth_c.set(@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real)) && (!(x == real_of_num(0)) || !(y == real_of_num(0))) → !(x + y == real_of_num(0))")))
}

///|
let pth_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pth")

///|
/// `pth`
pub fn pth() -> @kernel.Thm {
  pth_c.get()
}

///|
/// real_add_tm
fn step_90() -> Unit raise {
  real_add_tm_c.set(@term_syntax.parse_term("real_add"))
}

///|
let real_add_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("real_add_tm")

///|
/// `real_add_tm`
pub fn real_add_tm() -> @kernel.Term {
  real_add_tm_c.get()
}

///|
/// real_mul_tm
fn step_91() -> Unit raise {
  real_mul_tm_c.set(@term_syntax.parse_term("real_mul"))
}

///|
let real_mul_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("real_mul_tm")

///|
/// `real_mul_tm`
pub fn real_mul_tm() -> @kernel.Term {
  real_mul_tm_c.get()
}

///|
/// NONZERO_DIVIS_TAC
fn step_92() -> Unit raise {
  let t1505 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1504 = @simp.rewrite_tac(@list.List([@arith.mult_eq_1()]))
  let t1503 = @simp.gen_rewrite_tac(fn(x1502 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1496 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1497 = @equal.rand_conv(x1496)
      fn(x1498 : @kernel.Term) -> @kernel.Thm raise {
        s1497(x1498)
      }
    })((fn(x1499 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1500 = @equal.binder_conv(x1499)
      fn(x1501 : @kernel.Term) -> @kernel.Thm raise {
        s1500(x1501)
      }
    })(x1502))
  }, @list.List([@theorems.eq_sym_eq()]))
  let t1495 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t1494 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1493 = @simp.rewrite_tac(@list.List([@floor.integer_div()]))
  let t1492 = @list.List([@simp.asm_simp_tac(@list.List([@floor.integer_closed()])), @tactics.all_tac])
  let t1491 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("integer((a : Real)) && !integer((b : Real)) → !(a == b)")))
  let t1490 = @tactics.conv_tac(@equal.rand_conv(@equal.comb2_conv(@equal.rand_conv(@calc_rat.real_poly_conv), @calc_rat.real_rat_reduce_conv)))
  let t1489 = @simp.rewrite_tac(@list.List([]))
  let t1478 = @tactics.conv_tac(@equal.rand_conv(@equal.comb2_conv(@equal.rand_conv(@calc_rat.real_poly_conv), @calc_rat.real_rat_reduce_conv)))
  let t1477 = @simp.rewrite_tac(@list.List([]))
  let t1474 = @drule.match_mp(@calc_rat.real_field(@term_syntax.parse_term("(a : Real) + (b : Real) == real_of_num(0) → -(inv(b) * a) == inv(b) * b")))
  let t1476 = @tactics.disch_then(fn(x1475 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1471 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1472 = @tactics.mp_tac(x1471)
      fn(x1473 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1472(x1473)
      }
    })(t1474(x1475))
  })
  let t1470 = @simp.rewrite_tac(@list.List([@realax.real_add_assoc()]))
  nonzero_divis_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.rand_conv(@equal.land_conv(@calc_rat.real_poly_conv))), t1470), t1476), t1477), t1478), fn(x1488 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1479 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x1479
      let ts = @lib.map(@equal.lhand, @lib.striplist((x1481 : @kernel.Term) => @basics.dest_binop(real_add_tm(), x1481), @equal.lhand(@kernel.rand(w))))
      let cc = @num.abs_num(@num.div_num(@num.num_1, @lib.end_itlist(@num.gcd_num, @lib.map(@calc_int.rat_of_term, ts))))
      let t1485 = @kernel.mk_comb(real_mul_tm(), @calc_int.term_of_rat(cc))
      @tactics.disch_then(fn(x1487 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s1483 = @tactics.mp_tac(x1482)
          fn(x1484 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s1483(x1484)
          }
        })(((x1486 : @kernel.Thm) => @equal.ap_term(t1485, x1486))(x1487))
      })
    })(x1488)(x1488)
  }), t1489), t1490), t1491), @tactics.conj_tac), t1492), t1493), t1494), t1495), t1503), t1504), t1505))
}

///|
let nonzero_divis_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("NONZERO_DIVIS_TAC")

///|
/// `NONZERO_DIVIS_TAC`
pub fn nonzero_divis_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (nonzero_divis_tac_c.get())(x)
}

///|
/// `NONZERO_INEQ_TAC`
pub fn nonzero_ineq_tac(x1506 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let gl = x1506
  let t1513 = @tactics.then_tac(@tactics.disj2_tac, nonzero_ineq_tac)
  let t1514 = @tactics.orelse_tac(@tactics.then_tac(@tactics.disj1_tac, nonzero_ineq_tac), t1513)
  let t1511 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1512 = @tactics.then_tac(@tactics.match_mp_tac(@real.real_pow_le()), t1511)
  let t1510 = @tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), @tactics.conj_tac)
  let t1515 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.repeat_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@int.asm_arith_tac, @tactics.then_tac(@tactics.match_mp_tac(@realarith.real_le_add()), @tactics.conj_tac)), t1510), t1512))), @tactics.no_tac), t1514])
  let t1516 = @tactics.try_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(pth()), @tactics.conj_tac), t1515))
  let t1509 = @tactics.try_tac(nonzero_divis_tac)
  let t1508 = @tactics.try_tac(@calc_rat.asm_real_arith_tac)
  let t1507 = @tactics.repeat_tac(@tactics.conj_tac)
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_pow_eq_0(), @realarith.real_entire(), @class.de_morgan_thm(), @calc_num.arith_eq()])), t1507), t1508), t1509), t1516), nonzero_divis_tac)(gl)
}

///|
/// NONZERO_ADHOC_TAC
fn step_93() -> Unit raise {
  let t1519 = @tactics.try_tac(nonzero_ineq_tac)
  let t1518 = @tactics.conv_tac(@equal.rand_conv(@equal.land_conv(@calc_rat.real_poly_conv)))
  let t1517 = @tactics.repeat_tac(@tactics.conj_tac)
  nonzero_adhoc_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_pow_eq_0(), @realarith.real_entire(), @class.de_morgan_thm(), @calc_num.arith_eq()])), t1517), t1518), t1519))
}

///|
let nonzero_adhoc_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("NONZERO_ADHOC_TAC")

///|
/// `NONZERO_ADHOC_TAC`
pub fn nonzero_adhoc_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (nonzero_adhoc_tac_c.get())(x)
}

///|
/// REAL_CONTINUOUS_ADHOC_TAC
fn step_94() -> Unit raise {
  let t1525 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_const()]))
  let t1524 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_complex_components_at(), @realanalysis.real_continuous_complex_components_within()]))
  let t1523 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_mul()), @tactics.conj_tac)
  let t1522 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_sub()), @tactics.conj_tac)
  let t1521 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_add()), @tactics.conj_tac)
  let t1520 = @tactics.match_mp_tac(@realanalysis.real_continuous_neg())
  real_continuous_adhoc_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_pow()), t1520), t1521), t1522), t1523)), t1524), t1525))
}

///|
let real_continuous_adhoc_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("REAL_CONTINUOUS_ADHOC_TAC")

///|
/// `REAL_CONTINUOUS_ADHOC_TAC`
pub fn real_continuous_adhoc_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (real_continuous_adhoc_tac_c.get())(x)
}

///|
/// REALLIM_NONZERO_TAC
fn step_95() -> Unit raise {
  let t1528 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1527 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1526 = @simp.rewrite_tac(@list.List([rbinom(), rfact_eq_0(), @realarith.real_entire(), @real.real_div_eq_0(), spow_eq_0(), @real.real_pow_eq_0()]))
  reallim_nonzero_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re(), @complexes.im()])), t1526), t1527), t1528), @calc_rat.asm_real_arith_tac))
}

///|
let reallim_nonzero_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("REALLIM_NONZERO_TAC")

///|
/// `REALLIM_NONZERO_TAC`
pub fn reallim_nonzero_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (reallim_nonzero_tac_c.get())(x)
}

///|
/// REALLIM_INEQ_TAC
fn step_96() -> Unit raise {
  reallim_ineq_tac_c.set(@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re(), @complexes.im()])), @calc_rat.asm_real_arith_tac))
}

///|
let reallim_ineq_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("REALLIM_INEQ_TAC")

///|
/// `REALLIM_INEQ_TAC`
pub fn reallim_ineq_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (reallim_ineq_tac_c.get())(x)
}

///|
/// REALLIM_CONTINUOUS_TAC
fn step_97() -> Unit raise {
  let t1548 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_complex_components_within(), @realanalysis.real_continuous_const()]))
  let t1546 = @list.List([@tactics.conj_tac, @tactics.then_tac(@tactics.disch_then(fn(x1545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1543 = @tactics.mp_tac(x1542)
      fn(x1544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1543(x1544)
      }
    })(@bool.conjunct2(x1545))
  }), reallim_ineq_tac)])
  let t1547 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.conj_assoc()]))(real_continuous_rbinom_compose_within())), @tactics.conj_tac), t1546)
  let t1540 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.disch_then(fn(x1539 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1537 = @tactics.mp_tac(x1536)
      fn(x1538 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1537(x1538)
      }
    })(@bool.conjunct2(x1539))
  }), reallim_ineq_tac)])
  let t1541 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(real_continuous_rfact_compose_within()), @tactics.conj_tac), t1540)
  let t1535 = @tactics.match_mp_tac(@realanalysis.real_continuous_pow())
  let t1534 = @tactics.match_mp_tac(@realanalysis.real_continuous_neg())
  let t1533 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_sub()), @tactics.conj_tac)
  let t1532 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_add()), @tactics.conj_tac)
  let t1531 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_mul()), @tactics.conj_tac)
  let t1530 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.conj_assoc()]))(@realanalysis.real_continuous_rpow_compose_within())), @tactics.conj_tac), @list.List([@tactics.conj_tac, reallim_nonzero_tac]))
  let t1529 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_inv_within()), @tactics.conj_tac), @list.List([@tactics.all_tac, reallim_nonzero_tac]))
  reallim_continuous_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.match_mp_tac(real_continuous_inv_rfact_compose_within()), t1529), t1530), t1531), t1532), t1533), t1534), t1535), t1541), t1547)), t1548), @tactics.no_tac))
}

///|
let reallim_continuous_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("REALLIM_CONTINUOUS_TAC")

///|
/// `REALLIM_CONTINUOUS_TAC`
pub fn reallim_continuous_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (reallim_continuous_tac_c.get())(x)
}

///|
/// TACTIC_1
fn step_98() -> Unit raise {
  let t1587 = @tactics.try_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x1584 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1585 = @equal.rand_conv(x1584)
    fn(x1586 : @kernel.Term) -> @kernel.Thm raise {
      s1585(x1586)
    }
  }, @list.List([@equal.gsym(@topology.within_univ())])), reallim_continuous_tac))
  let t1583 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_complex_components_at(), @complexes.re(), @complexes.im()]))
  let t1582 = @tactics.match_mp_tac(@meson.meson(@list.List([@realanalysis.real_continuous_at()]), @term_syntax.parse_term("(f : (Cart[Real, _]) -> Real)((x : Cart[Real, _])) == (y : Real) && real_continuous(f, at(x)) → op_minus_minus_minus_gt(f, y, at(x))")))
  let t1581 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_const()]))
  let t1577 = @equal.gsym(@realax.real_of_num_mul())
  let t1578 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t1577]))
  let t1575 = @list.List([@tactics.all_tac, @tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re(), @complexes.im()])), nonzero_adhoc_tac)])
  let t1574 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1576 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(reallim_spow_compose()), t1574), t1575)
  let t1573 = @tactics.match_mp_tac(lim_rfact())
  let t1579 = @tactics.then_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.then_tac(@tactics.match_mp_tac(lim_rbinom()), @tactics.conj_tac), t1573), t1576), t1578)
  let t1570 = @equal.gsym(@realax.real_of_num_add())
  let t1571 = @list.List([@tactics.conj_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul()), t1570])), @calc_rat.asm_real_arith_tac)])
  let t1569 = @simp.once_rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t1572 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(reallim_spow_compose()), t1569), @tactics.conj_tac), t1571)
  let t1566 = @tactics.try_tac(@calc_rat.asm_real_arith_tac)
  let t1560 = @equal.gsym(@calc_int.real_of_num_pow())
  let t1561 = @equal.gsym(@realax.real_of_num_mul())
  let t1562 = @equal.gsym(@realax.real_of_num_add())
  let t1563 = @equal.gsym(@realax.real_of_num_eq())
  let t1564 = @equal.gsym(@real.real_of_num_lt())
  let t1565 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_lt()), t1564, t1563, t1562, t1561, t1560]))
  let t1559 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq(), @binomial.binom_eq_0(), @arith.fact_nz()]))
  let t1558 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1557 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1556 = @simp.rewrite_tac(@list.List([spow_eq_0(), @real.real_pow_eq_0(), @realarith.real_entire(), @real.real_div_eq_0(), @transcendentals.cos_npi(), @real.real_pow_eq_0(), @real.real_neg_eq_0()]))
  let t1567 = @list.List([@tactics.conj_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_of_num_add()])), t1556), t1557), t1558), t1559), t1565), t1566), nonzero_adhoc_tac)])
  let t1555 = @simp.gen_rewrite_tac(fn(x1554 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1554
  }, @list.List([@theorems.conj_assoc()]))
  let t1553 = @tactics.match_mp_tac(reallim_spow_compose())
  let t1568 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.orelse_tac(@tactics.match_mp_tac(@realanalysis.reallim_div()), t1553), t1555), @tactics.conj_tac), t1567)
  let t1552 = @tactics.match_mp_tac(reallim_spow())
  let t1551 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_sub()), @tactics.conj_tac)
  let t1550 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_add()), @tactics.conj_tac)
  let t1549 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_mul()), @tactics.conj_tac)
  let t1580 = @tactics.repeat_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.orelse_tac(@tactics.match_mp_tac(@realanalysis.reallim_pow()), t1549), t1550), t1551), t1552), t1568), t1572), t1579))
  tactic_1_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1580), t1581), t1582), t1583), t1587))
}

///|
let tactic_1_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("TACTIC_1")

///|
/// `TACTIC_1`
pub fn tactic_1(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (tactic_1_c.get())(x)
}

///|
/// SIDECOND_TAC
fn step_99() -> Unit raise {
  let t1611 = @tactics.try_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), fn(x1610 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    tactic_4(x1610.0, x1610.1)
  }))
  let t1609 = @tactics.try_tac(nonzero_adhoc_tac)
  let t1608 = @tactics.try_tac(fn(x1607 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    @tactics.disch_tac(((x1606 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @lib.check(fn(x1605 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> Bool raise {
      (fn(x1603 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x1603)
      })((fn(x1604 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1604.1
      })(x1605))
    }, x1606))(x1607))
  })
  let t1601 = @equal.gsym(@realax.real_of_num_mul())
  let t1602 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add()), t1601]))
  let t1599 = @equal.gsym(@real.real_of_num_lt())
  let t1600 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_eq()), t1599]))
  let t1598 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1597 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1596 = @simp.rewrite_tac(@list.List([@realarith.real_entire(), @real.real_pow_eq_0(), @realarith.real_entire(), @real.real_div_eq_0(), @realax.real_of_num_eq(), @arith.fact_nz(), @binomial.binom_eq_0()]))
  let t1595 = @tactics.try_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")))
  let t1612 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t1595), t1596), t1597), t1598), t1600), t1602), t1608), t1609), t1611]))
  let t1613 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.conj_tac, ratpolyfun_tac), t1612]))
  let t1594 = @tactics.try_tac(tactic_1)
  let t1591 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@complexes.re(), @complexes.im()])), @tactics.refl_tac), @tactics.all_tac]))
  let t1592 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([@realanalysis.real_continuous_at()]), @term_syntax.parse_term("(f : (Cart[Real, _]) -> Real)((x : Cart[Real, _])) == (y : Real) && real_continuous(f, at(x)) → op_minus_minus_minus_gt(f, y, at(x))"))), t1591), real_continuous_adhoc_tac), @tactics.all_tac]))
  let t1590 = @tactics.match_mp_tac(@realanalysis.reallim_mul())
  let t1589 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_add()), @tactics.conj_tac))
  let t1593 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())])), t1589), t1590), t1592)])
  let t1588 = @tactics.try_tac(@tactics.disch_tac)
  sidecond_tac_c.set(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.repeat_tac(@tactics.gen_tac)), t1588), t1593), t1594), t1613])))
}

///|
let sidecond_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("SIDECOND_TAC")

///|
/// `SIDECOND_TAC`
pub fn sidecond_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (sidecond_tac_c.get())(x)
}

///|
/// `WZ_PROVE`
pub fn wz_prove(x1614 : @kernel.Term, x1615 : @kernel.Term, x1616 : @kernel.Term, x1617 : @list.List[@kernel.Term], x1618 : @list.List[@kernel.Term]) -> @kernel.Thm raise {
  let ntm = x1614
  let stm = x1615
  let rtm = x1616
  let ctm = x1617
  let atm = x1618
  if @list.List::is_empty(ctm) {
    raise Failure("WZ_PROVE: empty coefficient list")
  } else {
    ()
  }
  let (atms, th) = wz_initial_reductions(ntm, stm, rtm, ctm, atm)
  let t1622 = @tactics.match_mp_tac(th)
  let t1623 = @tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x1619 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let a = x1619
    let t1621 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.no_tac)])
    @tactics.thenl(@class.asm_cases_tac(a), t1621)
  }, atms), t1622), sidecond_tac)
  let th_p = @tactics.prove(@kernel.rand(@kernel.concl(th)), t1623)
  @equal.conv_rule(@equal.once_depth_conv(@equal.binder_conv(@equal.rand_conv(output_simp_conv))), th_p)
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
}
