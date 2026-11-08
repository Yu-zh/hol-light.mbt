// Translated from upstream Jordan/float.ml; edit this file directly.

///|
/// Jordan/float.ml:9
fn step_1() -> Unit raise {
  @parse_ext_override_interface.prioritize_real(())
}

///|
let add_test_v1_c : @lib.Cell[((String, Bool)) -> Unit raise] = @lib.Cell::new("add_test")

///|
/// `add_test`
pub fn add_test_v1(x : (String, Bool)) -> Unit raise {
  (add_test_v1_c.get())(x)
}

///|
let test__v1_c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new("test")

///|
/// `test`
pub fn test__v1(x : Unit) -> Unit raise {
  (test__v1_c.get())(x)
}

///|
/// add_test, test
fn step_2() -> Unit raise {
  let (add_test, test_) = @lib_ext.new_test_suite(())
  add_test_v1_c.set(add_test)
  test__v1_c.set(test_)
}

///|
/// twopow
fn step_3() -> Unit raise {
  twopow_c.set(@pair.new_definition(@term_syntax.parse_term("(twopow : (Int) -> Real)((x : Int)) == (if (∃ n : Num, x == int_of_num(n)) { pow(real_of_num(2), nabs(x)) } else { inv(pow(real_of_num(2), nabs(x))) })")))
}

///|
let twopow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("twopow")

///|
/// `twopow`
pub fn twopow() -> @kernel.Thm {
  twopow_c.get()
}

///|
/// float
fn step_4() -> Unit raise {
  float_c.set(@pair.new_definition(@term_syntax.parse_term("(float : (Int, Int) -> Real)((x : Int), (n : Int)) == real_of_int(x) * twopow(n)")))
}

///|
let float_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("float")

///|
/// `float`
pub fn float() -> @kernel.Thm {
  float_c.get()
}

///|
/// interval
fn step_5() -> Unit raise {
  interval_c.set(@pair.new_definition(@term_syntax.parse_term("(interval : (Real, Real, Real) -> Bool)((x : Real), (f : Real), (eps : Real)) == (abs(x - f) <= eps)")))
}

///|
let interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("interval")

///|
/// `interval`
pub fn interval() -> @kernel.Thm {
  interval_c.get()
}

///|
/// `mk_interval`
pub fn mk_interval(x1 : @kernel.Term, x2 : @kernel.Term, x3 : @kernel.Term) -> @kernel.Term raise {
  let a = x1
  let b = x2
  let ex = x3
  @kernel.mk_comb(@kernel.mk_comb(@kernel.mk_comb(@term_syntax.parse_term("interval"), a), b), ex)
}

///|
/// Jordan/float.ml:32
fn step_6() -> Unit raise {
  let t6 = @term_syntax.parse_term("interval(DECIMAL(3, 1), DECIMAL(4, 1), DECIMAL(1, 1))")
  let t4 = @term_syntax.parse_term("DECIMAL(1, 1)")
  let t5 = @term_syntax.parse_term("DECIMAL(4, 1)")
  add_test_v1(("mk_interval", (mk_interval(@term_syntax.parse_term("DECIMAL(3, 1)"), t5, t4) == t6)))
}

///|
/// `dest_interval`
pub fn dest_interval(x7 : @kernel.Term) -> ((@kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let intv = x7
  let (h1, ex) = @kernel.dest_comb(intv)
  let (h2, f) = @kernel.dest_comb(h1)
  let (h3, a) = @kernel.dest_comb(h2)
  let _ = if (h3 == @term_syntax.parse_term("interval")) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:39:11")
  }
  (a, f, ex)
}

///|
/// Jordan/float.ml:42
fn step_7() -> Unit raise {
  let a = @term_syntax.parse_term("DECIMAL(3, 1)")
  let b = @term_syntax.parse_term("DECIMAL(4, 1)")
  let c = @term_syntax.parse_term("DECIMAL(1, 1)")
  add_test_v1(("dest_interval", (dest_interval(mk_interval(a, b, c)) == (a, b, c))))
}

///|
/// `dest_int`
pub fn dest_int(x8 : @kernel.Term) -> @num.Num raise {
  let b = x8
  let dest_pos_int : (@kernel.Term) -> @num.Num raise = fn(x9 : @kernel.Term) -> @num.Num raise {
    let a = x9
    let (op, nat) = @kernel.dest_comb(a)
    if (@kernel.dest_const(op).0 == "int_of_num") {
      @basics.dest_numeral(nat)
    } else {
      @lib.failure()
    }
  }
  let (op_p, u) = @kernel.dest_comb(b)
  try {
    if (@kernel.dest_const(op_p).0 == "int_neg") {
      @num.minus_num(dest_pos_int(u))
    } else {
      dest_pos_int(b)
    }
  } catch {
    Failure(_) => raise Failure("dest_int ")
    e => raise e
  }
}

///|
/// `mk_int`
pub fn mk_int(x10 : @num.Num) -> @kernel.Term raise {
  let a = x10
  let sgn = Int::to_int64(@num.sign_num(a))
  let abv = @num.abs_num(a)
  let t11 = @nums.mk_numeral(abv)
  let r = @kernel.mk_comb(@term_syntax.parse_term("int_of_num"), t11)
  try {
    if (sgn < 0L) {
      @kernel.mk_comb(@term_syntax.parse_term("int_neg"), r)
    } else {
      r
    }
  } catch {
    Failure(_) => raise Failure(("dest_int " + @num.string_of_num(a)))
    e => raise e
  }
}

///|
/// Jordan/float.ml:69
fn step_8() -> Unit raise {
  let t12 = @term_syntax.parse_term("-int_of_num(1443)")
  add_test_v1(("mk_int", if (mk_int(@num.num_of_int64((-1443L))) == t12) {
    let t13 = @term_syntax.parse_term("int_of_num(37)")
    (mk_int(@num.num_of_int64(37L)) == t13)
  } else {
    false
  }))
}

///|
/// split_ratio
fn step_9() -> Unit raise {
  split_ratio_c.set(fn(x14 : @num.Num) -> (@num.Num, @num.Num) raise {
    @num.numdom(x14)
  })
}

///|
let split_ratio_c : @lib.Cell[(@num.Num) -> (@num.Num, @num.Num) raise] = @lib.Cell::new("split_ratio")

///|
/// `split_ratio`
pub fn split_ratio(x : @num.Num) -> ((@num.Num, @num.Num)) raise {
  (split_ratio_c.get())(x)
}

///|
/// Jordan/float.ml:77
fn step_10() -> Unit raise {
  let t15 = @num.num_of_int64(20L)
  let (a, b) = split_ratio(@num.div_num(@num.num_of_int64(4L), t15))
  add_test_v1(("split_ratio", (@num.eq_num(a, @num.num_of_int64(1L)) && @num.eq_num(b, @num.num_of_int64(5L)))))
}

///|
/// `factor_C`
pub fn factor_c(x16 : Int64) -> ((@num.Num) -> (@num.Num, @num.Num) raise) raise {
  let c = x16
  let intc = @num.num_of_int64(c)
  fn divc(x18 : @num.Num, x19 : @num.Num) -> ((@num.Num, @num.Num)) raise {
    let (a, b) = (x18, x19)
    let t20 = @num.mod_num(a, intc)
    if @num.eq_num(@num.num_of_int64(0L), t20) {
      let t21 = @num.add_num(b, @num.num_of_int64(1L))
      divc(@num.div_num(a, intc), t21)
    } else {
      (a, b)
    }
  }
  fn(x22 : @num.Num) -> (@num.Num, @num.Num) raise {
    let r = x22
    if (@num.is_integer_num(r) && !((Int::to_int64(@num.sign_num(r)) == 0L))) {
      divc(r, @num.num_of_int64(0L))
    } else {
      raise Failure("factor_C")
    }
  }
}

///|
/// Jordan/float.ml:94
fn step_11() -> Unit raise {
  let t24 = @num.num_of_int64(5L)
  let t25 = (@num.num_of_int64(129L), t24)
  let t23 = @num.num_of_int64(@lib.add63(4096L, 32L))
  add_test_v1(("factor_C", if (factor_c(2L)(t23) == t25) {
    let t27 = @num.num_of_int64(3L)
    let t28 = (@num.num_of_int64(5L), t27)
    let t26 = @num.num_of_int64(5000L)
    if (factor_c(10L)(t26) == t28) {
      let t29 = @num.num_of_int64(3L)
      let t30 = @num.div_num(@num.num_of_int64(50L), t29)
      @lib_ext.cannot(factor_c(2L), t30)
    } else {
      false
    }
  } else {
    false
  }))
}

///|
/// `dest_float`
pub fn dest_float(x31 : @kernel.Term) -> @num.Num raise {
  let f = x31
  let (a, b) = @basics.dest_binop(@term_syntax.parse_term("float"), f)
  let t32 = dest_int(b)
  let t33 = @num.power_num(@num.num_of_int64(2L), t32)
  @num.mult_num(dest_int(a), t33)
}

///|
/// Jordan/float.ml:106
fn step_12() -> Unit raise {
  let t34 = @num.num_of_int64(393216L)
  add_test_v1(("dest_float", (dest_float(@term_syntax.parse_term("float(int_of_num(3), int_of_num(17))")) == t34)))
}

///|
/// Jordan/float.ml:109
fn step_13() -> Unit raise {
  add_test_v1(("dest_float2", @lib_ext.cannot(dest_float, @term_syntax.parse_term("float(int_of_num(3) + int_of_num(1), int_of_num(17))"))))
}

///|
/// `mk_float`
pub fn mk_float(x35 : @num.Num) -> @kernel.Term raise {
  let r = x35
  let (a, b) = split_ratio(r)
  let (a_p, exp_a) = if @num.eq_num(a, @num.num_of_int64(0L)) {
    let t36 = @num.num_of_int64(0L)
    (@num.num_of_int64(0L), t36)
  } else {
    factor_c(2L)(a)
  }
  let (b_p, exp_b) = factor_c(2L)(b)
  let c = @num.div_num(a_p, b_p)
  if @num.is_integer_num(c) {
    let t37 = mk_int(@num.sub_num(exp_a, exp_b))
    let t38 = mk_int(c)
    @basics.mk_binop(@term_syntax.parse_term("float"), t38, t37)
  } else {
    raise Failure("mk_float")
  }
}

///|
/// Jordan/float.ml:124
fn step_14() -> Unit raise {
  let t39 = @term_syntax.parse_term("float(int_of_num(129), int_of_num(5))")
  add_test_v1(("mk_float", if (mk_float(@num.num_of_int64(@lib.add63(4096L, 32L))) == t39) {
    let t40 = @term_syntax.parse_term("float(int_of_num(0), int_of_num(0))")
    (mk_float(@num.num_of_int64(0L)) == t40)
  } else {
    false
  }))
}

///|
/// Jordan/float.ml:128
fn step_15() -> Unit raise {
  let rtest : (@num.Num) -> Bool raise = fn(x41 : @num.Num) -> Bool raise {
    let t = x41
    @num.eq_num(t, dest_float(mk_float(t)))
  }
  let t42 = @num.num_of_int64(1024L)
  add_test_v1(("mk_float2", if rtest(@num.div_num(@num.num_of_int64(3L), t42)) {
    let t43 = @num.num_of_int64(3L)
    @lib_ext.cannot(rtest, @num.div_num(@num.num_of_int64(1L), t43))
  } else {
    false
  }))
}

///|
/// Jordan/float.ml:133
fn step_16() -> Unit raise {
  let t44 = @term_syntax.parse_term("float(int_of_num(1), int_of_num(5))")
  add_test_v1(("mk_float dest_float", (mk_float(dest_float(@term_syntax.parse_term("float(int_of_num(4), int_of_num(3))"))) == t44)))
}

///|
/// `mk_pos_decimal`
pub fn mk_pos_decimal(x45 : @num.Num) -> @kernel.Term raise {
  let r = x45
  let _ = if @num.ge_num(r, @num.num_of_int64(0L)) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:140:12")
  }
  let (a, b) = split_ratio(r)
  if @num.eq_num(a, @num.num_of_int64(0L)) {
    @term_syntax.parse_term("DECIMAL(0, 1)")
  } else {
    let (a1, exp_a5) = factor_c(5L)(a)
    let (a2, exp_a2) = factor_c(2L)(a1)
    let (b1, exp_b5) = factor_c(5L)(b)
    let (b2, exp_b2) = factor_c(2L)(b1)
    let _ = if @num.eq_num(b2, @num.num_of_int64(1L)) {
      ()
    } else {
      raise @lib.AssertFailure("tscript.ml:147:12")
    }
    let t48 = @num.num_of_int64(0L)
    let t49 = @num.sub_num(exp_b2, exp_a2)
    let c = @lib.end_itlist(fn(x46 : @num.Num, x47 : @num.Num) -> @num.Num raise {
      @num.max_num(x46, x47)
    }, @list.List([@num.sub_num(exp_b5, exp_a5), t49, t48]))
    let t51 = @num.sub_num(@num.add_num(c, exp_a5), exp_b5)
    let t52 = @num.power_num(@num.num_of_int64(5L), t51)
    let t50 = @num.sub_num(@num.add_num(c, exp_a2), exp_b2)
    let a_p = @num.mult_num(@num.mult_num(a2, @num.power_num(@num.num_of_int64(2L), t50)), t52)
    let b_p = @num.power_num(@num.num_of_int64(10L), c)
    let t53 = @nums.mk_numeral(b_p)
    let t54 = @nums.mk_numeral(a_p)
    @basics.mk_binop(@term_syntax.parse_term("DECIMAL"), t54, t53)
  }
}

///|
/// Jordan/float.ml:154
fn step_17() -> Unit raise {
  let t55 = @term_syntax.parse_term("DECIMAL(5000, 1)")
  add_test_v1(("mk_pos_decimal", if (mk_pos_decimal(@num.num_of_int64(5000L)) == t55) {
    let t57 = @term_syntax.parse_term("DECIMAL(75, 100)")
    let t56 = @num.num_of_int64(40L)
    if (mk_pos_decimal(@num.div_num(@num.num_of_int64(30L), t56)) == t57) {
      let t58 = @term_syntax.parse_term("DECIMAL(0, 1)")
      if (mk_pos_decimal(@num.num_of_int64(0L)) == t58) {
        let t60 = @term_syntax.parse_term("DECIMAL(6, 10)")
        let t59 = @num.num_of_int64(25L)
        if (mk_pos_decimal(@num.div_num(@num.num_of_int64(15L), t59)) == t60) {
          let t62 = @term_syntax.parse_term("DECIMAL(625, 100)")
          let t61 = @num.num_of_int64(4L)
          if (mk_pos_decimal(@num.div_num(@num.num_of_int64(25L), t61)) == t62) {
            let t64 = @term_syntax.parse_term("DECIMAL(8, 100)")
            let t63 = @num.num_of_int64(25L)
            (mk_pos_decimal(@num.div_num(@num.num_of_int64(2L), t63)) == t64)
          } else {
            false
          }
        } else {
          false
        }
      } else {
        false
      }
    } else {
      false
    }
  } else {
    false
  }))
}

///|
/// `mk_decimal`
pub fn mk_decimal(x65 : @num.Num) -> @kernel.Term raise {
  let r = x65
  let a = Int::to_int64(@num.sign_num(r))
  let b = mk_pos_decimal(@num.abs_num(r))
  if (a < 0L) {
    @kernel.mk_comb(@term_syntax.parse_term("real_neg"), b)
  } else {
    b
  }
}

///|
/// Jordan/float.ml:168
fn step_18() -> Unit raise {
  let t66 = @term_syntax.parse_term("DECIMAL(3, 1)")
  add_test_v1(("mk_decimal", if (mk_decimal(@num.num_of_int64(3L)) == t66) {
    let t67 = @term_syntax.parse_term("-DECIMAL(3, 1)")
    (mk_decimal(@num.num_of_int64((-3L))) == t67)
  } else {
    false
  }))
}

///|
/// `dest_decimal`
pub fn dest_decimal(x68 : @kernel.Term) -> @num.Num raise {
  let f = x68
  let (a, b) = @basics.dest_binop(@term_syntax.parse_term("DECIMAL"), f)
  let a1 = @basics.dest_numeral(a)
  let b1 = @basics.dest_numeral(b)
  @num.div_num(a1, b1)
}

///|
/// Jordan/float.ml:183
fn step_19() -> Unit raise {
  let t69 = @num.num_of_int64(10L)
  let t70 = @num.div_num(@num.num_of_int64(34L), t69)
  add_test_v1(("dest_decimal", @num.eq_num(dest_decimal(@term_syntax.parse_term("DECIMAL(34, 10)")), t70)))
}

///|
/// Jordan/float.ml:185
fn step_20() -> Unit raise {
  add_test_v1(("dest_decimal2", @lib_ext.cannot(dest_decimal, @term_syntax.parse_term("-DECIMAL(34, 10)"))))
}

///|
/// TWOPOW_POS
fn step_21() -> Unit raise {
  let t74 = @meson.meson_tac(@list.List([]))
  let t73 = @tactics_ext.taut_tac(@term_syntax.parse_term("(A : Bool) → !A → (B : Bool)"))
  let t71 = @simp.rewrite_tac(@list.List([@num_ext_nabs.nabs_pos()]))
  let t75 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([twopow()])), @tactics.gen_tac), @class.cond_cases_tac), @list.List([@tactics.ap_term_tac, @tactics.all_tac])), t71), (x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(0L, x72)), t73), t74)
  twopow_pos_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, twopow(int_of_num(n)) == pow(real_of_num(2), n)"), t75))
}

///|
let twopow_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_POS")

///|
/// `TWOPOW_POS`
pub fn twopow_pos() -> @kernel.Thm {
  twopow_pos_c.get()
}

///|
/// TWOPOW_NEG
fn step_22() -> Unit raise {
  let t83 = @simp.asm_rewrite_tac(@list.List([@realax.real_pow(), @real.real_inv_1()]))
  let t82 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_eq(), @arith.add_eq_0()]))
  let t81 = @simp.rewrite_tac(@list.List([@tactics_refine.prove(@term_syntax.parse_term("∀ u : Num, ∀ y : Num, (-real_of_num(u) == real_of_num(y)) == (real_of_num(u) + real_of_num(y) == real_of_num(0))"), @calc_rat.real_arith_tac)]))
  let t80 = @simp.rewrite_tac(@list.List([@int.int_eq(), @int.int_neg_th(), @num_ext_nabs.int_num_real()]))
  let t78 = @simp.rewrite_tac(@list.List([@num_ext_nabs.nabs_neg()]))
  let t77 = @tactics.pop_assum(@tactics.choose_tac)
  let t76 = @tactics.thenl(@class.cond_cases_tac, @list.List([@tactics.all_tac, @simp.rewrite_tac(@list.List([@num_ext_nabs.nabs_neg()]))]))
  let t84 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([twopow()]))), t76), t77), t78), (x79 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(0L, x79)), t80), t81), t82), @tactics.disch_tac), t83)
  twopow_neg_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, twopow(-int_of_num(n)) == inv(pow(real_of_num(2), n))"), t84))
}

///|
let twopow_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_NEG")

///|
/// `TWOPOW_NEG`
pub fn twopow_neg() -> @kernel.Thm {
  twopow_neg_c.get()
}

///|
/// TWOPOW_INV
fn step_23() -> Unit raise {
  let t87 = @simp.asm_rewrite_tac(@list.List([twopow_pos(), twopow_neg(), @real.real_inv_inv(), @int.int_neg_neg()]))
  let t86 = @tactics.pop_assum(@tactics.disj_cases_tac)
  let t85 = @tactics.pop_assum(@tactics.choose_tac)
  let t88 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(a : Int)"), @num_ext_nabs.int_rep2()))), t85), t86), t87)
  twopow_inv_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, twopow(-a) == inv(twopow(a))"), t88))
}

///|
let twopow_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_INV")

///|
/// `TWOPOW_INV`
pub fn twopow_inv() -> @kernel.Thm {
  twopow_inv_c.get()
}

///|
/// INT_REP3
fn step_24() -> Unit raise {
  let t108 = @simp.asm_rewrite_tac(@list.List([@int.int_neg_eq_0(), @int.int_of_num_eq()]))
  let t107 = @tactics.first_x_assum(fn(x106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x99 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s100 = @tactics.mp_tac(x99)
      fn(x101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s100(x101)
      }
    })(((x105 : @kernel.Thm) => @lib.check(fn(x104 : @kernel.Thm) -> Bool raise {
      (fn(x102 : @kernel.Term) -> Bool raise {
        @basics.is_neg(x102)
      })((fn(x103 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x103)
      })(x104))
    }, x105))(x106))
  })
  let t98 = @simp.asm_rewrite_tac(@list.List([@int.int_eq_neg2()]))
  let t97 = @tactics.exists_tac(@term_syntax.parse_term("PRE((n : Num))"))
  let t96 = @list.List([@tactics.then_tac(@tactics.disch_tac, @tactics.asm_tac(@meson.meson_tac)(@list.List([]))), @tactics.all_tac])
  let t95 = @tactics.pop_assum(@tactics.disj_cases_tac)
  let t92 = @simp.asm_rewrite_tac(@list.List([]))
  let t93 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("0")), t92), @tactics.all_tac])
  let t90 = @meson.meson_tac(@list.List([]))
  let t91 = @tactics.disj_cases_tac(@tactics_refine.prove(@term_syntax.parse_term("(a : Int) == int_of_num(0) || !(a == int_of_num(0))"), t90))
  let t89 = @tactics.pop_assum(@tactics.choose_tac)
  let t109 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(a : Int)"), @num_ext_nabs.int_rep2()))), t89), t91), t93), (x94 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(0L, x94)), t95), t96), @tactics.disch_tac), t97), @tactics.disj2_tac), t98), t107), t108), @int.arith_tac)
  int_rep3_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∃ n : Num, a == int_of_num(n) || a == -int_of_num(n + 1)"), t109))
}

///|
let int_rep3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_REP3")

///|
/// `INT_REP3`
pub fn int_rep3() -> @kernel.Thm {
  int_rep3_c.get()
}

///|
/// REAL_EQ_INV
fn step_25() -> Unit raise {
  let t110 = @simp.asm_rewrite_tac(@list.List([]))
  let t111 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_inv_inv())]))), t110)
  let t112 = @list.List([@tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([]))), t111])
  let t113 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t112)
  real_eq_inv_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x == y) == (inv(x) == inv(y))"), t113))
}

///|
let real_eq_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_EQ_INV")

///|
/// `REAL_EQ_INV`
pub fn real_eq_inv() -> @kernel.Thm {
  real_eq_inv_c.get()
}

///|
/// TWOPOW_ADD_1
fn step_26() -> Unit raise {
  let t118 = @calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(2) == real_of_num(0))"))
  let t119 = @simp.rewrite_tac(@list.List([@drule.match_mp(@analysis.real_mul_rinv())(t118), @analysis.real_mul_rid()]))
  let t116 = @equal.gsym(@realax.real_mul_assoc())
  let t117 = @equal.gsym(real_eq_inv())
  let t120 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_inv_mul()), t117, @real.real_pow_add(), t116, @real.real_pow_1()]))
  let t115 = @equal.gsym(@real.real_inv_inv())
  let t121 = @simp.once_rewrite_tac(@list.List([@bool.spec(@term_syntax.parse_term("pow(real_of_num(2), 1)"), t115)]))
  let t122 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_neg_add()), @int.int_of_num_add(), twopow_neg(), twopow_pos()]))
  let t114 = @equal.gsym(@int.int_add_assoc())
  let t123 = @tactics.every(@list.List([@simp.asm_rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_add()), @int.int_neg_add(), t114, @int.int_add_linv(), @int.int_add_rid()])), t122, t121, t120, t119]))
  let t124 = @list.List([@simp.asm_rewrite_tac(@list.List([twopow_pos(), @int.int_of_num_add(), @real.real_pow_add()])), t123])
  let t125 = @tactics.thenl(@tactics.pop_assum(@tactics.disj_cases_tac), t124)
  let t126 = @tactics.every(@list.List([@tactics.gen_tac, @tactics.choose_tac(@bool.spec(@term_syntax.parse_term("(a : Int)"), int_rep3())), t125]))
  twopow_add_1_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, twopow(a + int_of_num(1)) == twopow(a) * twopow(int_of_num(1))"), t126))
}

///|
let twopow_add_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_ADD_1")

///|
/// `TWOPOW_ADD_1`
pub fn twopow_add_1() -> @kernel.Thm {
  twopow_add_1_c.get()
}

///|
/// REAL_INV2
fn step_27() -> Unit raise {
  let t127 = @list.List([@calc_rat.real_arith_tac, @simp.simp_tac(@list.List([@analysis.real_mul_rinv(), @realax.real_mul_linv()]))])
  let t128 = @tactics.thenl(@tactics_ext.subgoal_tac(@term_syntax.parse_term("!(real_of_num(2) == real_of_num(0))")), t127)
  real_inv2_c.set(@tactics_refine.prove(@term_syntax.parse_term("inv(real_of_num(2)) * real_of_num(2) == real_of_num(1) && real_of_num(2) * inv(real_of_num(2)) == real_of_num(1)"), t128))
}

///|
let real_inv2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV2")

///|
/// `REAL_INV2`
pub fn real_inv2() -> @kernel.Thm {
  real_inv2_c.get()
}

///|
/// TWOPOW_0
fn step_28() -> Unit raise {
  let t129 = @simp.rewrite_tac(@list.List([twopow_pos(), @realax.real_pow()]))
  twopow_0_c.set(@tactics_refine.prove(@term_syntax.parse_term("twopow(int_of_num(0)) == real_of_num(1)"), t129))
}

///|
let twopow_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_0")

///|
/// `TWOPOW_0`
pub fn twopow_0() -> @kernel.Thm {
  twopow_0_c.get()
}

///|
/// TWOPOW_SUB_NUM
fn step_29() -> Unit raise {
  let t137 = @simp.rewrite_tac(@list.List([real_inv2(), @analysis.real_mul_rid()]))
  let t135 = @tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(2) * x == x * real_of_num(2)"), @calc_rat.real_arith_tac)
  let t136 = @simp.rewrite_tac(@list.List([twopow_pos(), @real.real_pow_1(), @equal.gsym(@realax.real_mul_assoc()), t135]))
  let t134 = @simp.abbrev_tac(@term_syntax.parse_term("(b : Real) == inv(twopow(int_of_num((n : Num))))"))
  let t133 = @simp.abbrev_tac(@term_syntax.parse_term("(a : Real) == twopow(int_of_num((m : Num)))"))
  let t132 = @simp.rewrite_tac(@list.List([@real.real_inv_mul()]))
  let t131 = @simp.asm_rewrite_tac(@list.List([twopow_add_1(), twopow_inv(), @tactics_refine.prove(@term_syntax.parse_term("int_of_num((m : Num)) + int_of_num(1) - (int_of_num((n : Num)) + int_of_num(1)) == int_of_num(m) - int_of_num(n)"), @int.int_arith_tac)]))
  let t130 = @tactics.then_tac(@nums.induct_tac, @simp.asm_rewrite_tac(@list.List([@int.int_sub_rzero(), twopow_0(), @analysis.real_mul_rid(), @int.int_neg_0(), @arith.add1(), @equal.gsym(@int.int_of_num_add())])))
  let t138 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@nums.induct_tac, @list.List([@simp.rewrite_tac(@list.List([@int.int_sub_lzero(), @realax.real_mul_lid(), twopow_0()])), @tactics.all_tac])), t130), t131), t132), t133), t134), t136), t137)
  twopow_sub_num_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, twopow(int_of_num(m) - int_of_num(n)) == twopow(int_of_num(m)) * twopow(-int_of_num(n))"), t138))
}

///|
let twopow_sub_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_SUB_NUM")

///|
/// `TWOPOW_SUB_NUM`
pub fn twopow_sub_num() -> @kernel.Thm {
  twopow_sub_num_c.get()
}

///|
/// TWOPOW_ADD_NUM
fn step_30() -> Unit raise {
  let t139 = @simp.rewrite_tac(@list.List([twopow_pos(), @real.real_pow_add(), @int.int_of_num_add()]))
  twopow_add_num_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, twopow(int_of_num(m) + int_of_num(n)) == twopow(int_of_num(m)) * twopow(int_of_num(n))"), t139))
}

///|
let twopow_add_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_ADD_NUM")

///|
/// `TWOPOW_ADD_NUM`
pub fn twopow_add_num() -> @kernel.Thm {
  twopow_add_num_c.get()
}

///|
/// TWOPOW_ADD_INT
fn step_31() -> Unit raise {
  let t153 = @meson.meson_tac(@list.List([@real.real_mul_ac()]))
  let t152 = @simp.abbrev_tac(@term_syntax.parse_term("(e : Real) == inv(pow(real_of_num(2), (m' : Num)))"))
  let t151 = @simp.abbrev_tac(@term_syntax.parse_term("(d : Real) == pow(real_of_num(2), (n' : Num))"))
  let t150 = @simp.abbrev_tac(@term_syntax.parse_term("(c : Real) == pow(real_of_num(2), (n : Num))"))
  let t149 = @simp.abbrev_tac(@term_syntax.parse_term("(a' : Real) == inv(pow(real_of_num(2), (m : Num)))"))
  let t148 = @simp.asm_rewrite_tac(@list.List([twopow_sub_num(), twopow_inv(), twopow_pos(), @real.real_pow_add(), @real.real_inv_mul(), @equal.gsym(@realax.real_mul_assoc())]))
  let t147 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_add())])), @int.int_arith_tac), @tactics.all_tac])
  let t146 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("int_of_num((n : Num)) - int_of_num((m : Num)) + (int_of_num((n' : Num)) - int_of_num((m' : Num))) == int_of_num(n + n') - int_of_num(m + m')"))
  let t145 = @simp.asm_rewrite_tac(@list.List([]))
  let t144 = @tactics.repeat_tac(@tactics.pop_assum(@tactics.choose_tac))
  let t143 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(b : Int)"), @num_ext_nabs.int_rep()))
  let t142 = @tactics.pop_assum(@tactics.choose_tac)
  let t141 = @tactics.pop_assum(@tactics.choose_tac)
  let t140 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(a : Int)"), @num_ext_nabs.int_rep()))
  let t154 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t140), t141), t142), t143), t144), t145), t146), t147), @tactics.disch_tac), t148), t149), t150), t151), t152), t153)
  twopow_add_int_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, twopow(a + b) == twopow(a) * twopow(b)"), t154))
}

///|
let twopow_add_int_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_ADD_INT")

///|
/// `TWOPOW_ADD_INT`
pub fn twopow_add_int() -> @kernel.Thm {
  twopow_add_int_c.get()
}

///|
/// TWOPOW_ABS
fn step_32() -> Unit raise {
  let t156 = @simp.asm_rewrite_tac(@list.List([twopow_pos(), twopow_neg(), @real.real_abs_pow(), @calc_int.real_abs_num(), @real.real_abs_inv()]))
  let t155 = @bool.spec(@term_syntax.parse_term("(a : Int)"), @num_ext_nabs.int_rep2())
  let t157 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.choose_then(@tactics.disj_cases_tac)(t155)), t156)
  twopow_abs_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, abs(twopow(a)) == twopow(a)"), t157))
}

///|
let twopow_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_ABS")

///|
/// `TWOPOW_ABS`
pub fn twopow_abs() -> @kernel.Thm {
  twopow_abs_c.get()
}

///|
/// REAL_POW_POW
fn step_33() -> Unit raise {
  let t158 = @simp.asm_rewrite_tac(@list.List([@arith.add1(), @arith.left_add_distrib(), @real.real_pow_add(), @real.real_mul_ac(), @arith.mult_clauses()]))
  let t159 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_pow()])), t158)
  let t160 = @list.List([@simp.rewrite_tac(@list.List([@realax.real_pow(), @arith.mult_0()])), t159])
  let t161 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t160)
  real_pow_pow_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ m : Num, ∀ n : Num, pow(pow(x, m), n) == pow(x, m * n)"), t161))
}

///|
let real_pow_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_POW_POW")

///|
/// `REAL_POW_POW`
pub fn real_pow_pow() -> @kernel.Thm {
  real_pow_pow_c.get()
}

///|
/// INT_POW_POW
fn step_34() -> Unit raise {
  int_pow_pow_c.set(@int.int_of_real_thm(real_pow_pow()))
}

///|
let int_pow_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_POW")

///|
/// `INT_POW_POW`
pub fn int_pow_pow() -> @kernel.Thm {
  int_pow_pow_c.get()
}

///|
/// TWOPOW_POW
fn step_35() -> Unit raise {
  let t164 = @simp.asm_rewrite_tac(@list.List([twopow_pos(), @int.int_of_num_mul(), real_pow_pow(), twopow_neg(), @real.real_pow_inv(), @int.int_of_num_mul(), @equal.gsym(@int.int_neg_lmul())]))
  let t162 = @bool.spec(@term_syntax.parse_term("(a : Int)"), @num_ext_nabs.int_rep2())
  let t163 = @tactics.choose_then(@tactics.disj_cases_tac)(t162)
  let t165 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t163), t164)
  twopow_pow_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ n : Num, pow(twopow(a), n) == twopow(a * int_of_num(n))"), t165))
}

///|
let twopow_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_POW")

///|
/// `TWOPOW_POW`
pub fn twopow_pow() -> @kernel.Thm {
  twopow_pow_c.get()
}

///|
/// FLOAT_NEG
fn step_36() -> Unit raise {
  let t166 = @simp.rewrite_tac(@list.List([float(), @equal.gsym(@calc_int.real_mul_lneg()), @int.int_neg_th()]))
  let t167 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t166)
  float_neg_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ m : Int, -float(a, m) == float(-a, m)"), t167))
}

///|
let float_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_NEG")

///|
/// `FLOAT_NEG`
pub fn float_neg() -> @kernel.Thm {
  float_neg_c.get()
}

///|
/// FLOAT_MUL
fn step_37() -> Unit raise {
  let t169 = @meson.meson_tac(@list.List([@real.real_mul_ac()]))
  let t168 = @simp.rewrite_tac(@list.List([float(), @equal.gsym(@realax.real_mul_assoc()), twopow_add_int(), @int.int_mul_th()]))
  let t170 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t168), t169)
  float_mul_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Int, ∀ n : Int, float(a, m) * float(b, n) == float(a * b, m + n)"), t170))
}

///|
let float_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_MUL")

///|
/// `FLOAT_MUL`
pub fn float_mul() -> @kernel.Thm {
  float_mul_c.get()
}

///|
/// FLOAT_ADD
fn step_38() -> Unit raise {
  let t173 = @meson.meson_tac(@list.List([@real.real_mul_ac()]))
  let t172 = @simp.rewrite_tac(@list.List([twopow_pos(), @num_ext_nabs.int_num_real(), @equal.gsym(@calc_int.real_of_num_pow())]))
  let t171 = @tactics.repeat_tac(@tactics.gen_tac)
  let t174 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([float(), @int.int_add_th(), @real.real_add_rdistrib(), @int.int_mul_th(), twopow_add_int()])), t171), t172), t173)
  float_add_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ c : Num, ∀ m : Int, float(a, m + int_of_num(c)) + float(b, m) == float(int_of_num(EXP(2, c)) * a + b, m)"), t174))
}

///|
let float_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_ADD")

///|
/// `FLOAT_ADD`
pub fn float_add() -> @kernel.Thm {
  float_add_c.get()
}

///|
/// FLOAT_ADD_EQ
fn step_39() -> Unit raise {
  let t180 = @simp.rewrite_tac(@list.List([@arith.exp(), @int.int_mul_lid()]))
  let t175 = @bool.spec(@term_syntax.parse_term("(a : Int)"), float_add())
  let t176 = @bool.spec(@term_syntax.parse_term("(b : Int)"), t175)
  let t177 = @bool.spec(@term_syntax.parse_term("0"), t176)
  let t178 = @bool.spec(@term_syntax.parse_term("(m : Int)"), t177)
  let t179 = @simp.rewrite_tac(@list.List([@simp.rewrite_rule(@list.List([@int.int_add_rid()]))(t178)]))
  let t181 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t179), t180)
  float_add_eq_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Int, float(a, m) + float(b, m) == float(a + b, m)"), t181))
}

///|
let float_add_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_ADD_EQ")

///|
/// `FLOAT_ADD_EQ`
pub fn float_add_eq() -> @kernel.Thm {
  float_add_eq_c.get()
}

///|
/// FLOAT_ADD_NP
fn step_40() -> Unit raise {
  let t182 = @simp.rewrite_tac(@list.List([@calc_int.real_add_ac()]))
  float_add_np_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Num, ∀ n : Num, float(b, -int_of_num(n)) + float(a, int_of_num(m)) == float(a, int_of_num(m)) + float(b, -int_of_num(n))"), t182))
}

///|
let float_add_np_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_ADD_NP")

///|
/// `FLOAT_ADD_NP`
pub fn float_add_np() -> @kernel.Thm {
  float_add_np_c.get()
}

///|
/// FLOAT_ADD_PN
fn step_41() -> Unit raise {
  let t184 = @tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([float_add()])))
  let t185 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_add())])), @int.int_arith_tac), t184])
  let t183 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("int_of_num((m : Num)) == -int_of_num((n : Num)) + int_of_num(m + n)"))
  let t186 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t183), t185)
  float_add_pn_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Num, ∀ n : Num, float(a, int_of_num(m)) + float(b, -int_of_num(n)) == float(int_of_num(EXP(2, m + n)) * a + b, -int_of_num(n))"), t186))
}

///|
let float_add_pn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_ADD_PN")

///|
/// `FLOAT_ADD_PN`
pub fn float_add_pn() -> @kernel.Thm {
  float_add_pn_c.get()
}

///|
/// FLOAT_ADD_PP
fn step_42() -> Unit raise {
  let t192 = @tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([float_add()])))
  let t191 = @tactics.match_accept_tac(@equal.gsym(@arith.sub_add()))
  let t188 = @simp.rewrite_tac(@list.List([@arith.add_ac()]))
  let t189 = @simp.rewrite_tac(@list.List([@tactics_refine.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, n + (m - n) == m - n + n"), t188)]))
  let t193 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_of_num_add()])), @tactics.ap_term_tac), t189), (x190 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(0L, x190)), t191), t192])
  let t187 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("int_of_num((m : Num)) == int_of_num((n : Num)) + int_of_num(m - n)"))
  let t194 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t187), t193)
  float_add_pp_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Num, ∀ n : Num, n <= m → float(a, int_of_num(m)) + float(b, int_of_num(n)) == float(int_of_num(EXP(2, m - n)) * a + b, int_of_num(n))"), t194))
}

///|
let float_add_pp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_ADD_PP")

///|
/// `FLOAT_ADD_PP`
pub fn float_add_pp() -> @kernel.Thm {
  float_add_pp_c.get()
}

///|
/// FLOAT_ADD_PPv2
fn step_43() -> Unit raise {
  let t202 = @simp.rewrite_tac(@list.List([@calc_int.real_add_ac()]))
  let t201 = @simp.simp_tac(@list.List([@equal.gsym(float_add_pp())]))
  let t195 = @meson.meson_tac(@list.List([@arith.lt_le()]))
  let t196 = @tactics_refine.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → m <= n"), t195)
  let t199 = @tactics_ext.h_match_mp((x197 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t196, x197))((x198 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x198))
  let t203 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t199), (x200 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(0L, x200)), t201), @tactics.disch_tac), t202)
  float_add_ppv2_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Num, ∀ n : Num, m < n → float(a, int_of_num(m)) + float(b, int_of_num(n)) == float(int_of_num(EXP(2, n - m)) * b + a, int_of_num(m))"), t203))
}

///|
let float_add_ppv2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_ADD_PPv2")

///|
/// `FLOAT_ADD_PPv2`
pub fn float_add_ppv2() -> @kernel.Thm {
  float_add_ppv2_c.get()
}

///|
/// FLOAT_ADD_NN
fn step_44() -> Unit raise {
  let t206 = @tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([@equal.gsym(float_add()), @calc_int.real_add_ac()])))
  let t207 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac((x205 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(0L, x205), @simp.simp_tac(@list.List([@int.int_of_real_thm(@equal.gsym(@real.real_of_num_sub()))]))), @tactics.disch_tac), @int.int_arith_tac), t206])
  let t204 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("-int_of_num((n : Num)) == -int_of_num((m : Num)) + int_of_num(m - n)"))
  let t208 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t204), t207)
  float_add_nn_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Num, ∀ n : Num, n <= m → float(a, -int_of_num(m)) + float(b, -int_of_num(n)) == float(int_of_num(EXP(2, m - n)) * b + a, -int_of_num(m))"), t208))
}

///|
let float_add_nn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_ADD_NN")

///|
/// `FLOAT_ADD_NN`
pub fn float_add_nn() -> @kernel.Thm {
  float_add_nn_c.get()
}

///|
/// FLOAT_ADD_NNv2
fn step_45() -> Unit raise {
  let t216 = @simp.rewrite_tac(@list.List([@calc_int.real_add_ac()]))
  let t215 = @simp.simp_tac(@list.List([@equal.gsym(float_add_nn())]))
  let t209 = @meson.meson_tac(@list.List([@arith.lt_le()]))
  let t210 = @tactics_refine.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → m <= n"), t209)
  let t213 = @tactics_ext.h_match_mp((x211 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t210, x211))((x212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x212))
  let t217 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t213), (x214 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(0L, x214)), t215), @tactics.disch_tac), t216)
  float_add_nnv2_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ m : Num, ∀ n : Num, m < n → float(a, -int_of_num(m)) + float(b, -int_of_num(n)) == float(int_of_num(EXP(2, n - m)) * a + b, -int_of_num(n))"), t217))
}

///|
let float_add_nnv2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_ADD_NNv2")

///|
/// `FLOAT_ADD_NNv2`
pub fn float_add_nnv2() -> @kernel.Thm {
  float_add_nnv2_c.get()
}

///|
/// FLOAT_SUB
fn step_46() -> Unit raise {
  let t218 = @simp.rewrite_tac(@list.List([float(), @int.int_neg_th(), @realax.real_sub(), @analysis.real_neg_lmul()]))
  float_sub_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ n : Int, ∀ m : Int, float(a, n) - float(b, m) == float(a, n) + float(-b, m)"), t218))
}

///|
let float_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_SUB")

///|
/// `FLOAT_SUB`
pub fn float_sub() -> @kernel.Thm {
  float_sub_c.get()
}

///|
/// FLOAT_ABS
fn step_47() -> Unit raise {
  let t219 = @simp.rewrite_tac(@list.List([float(), @int.int_abs_th(), @real.real_abs_mul(), twopow_abs()]))
  float_abs_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ n : Int, abs(float(a, n)) == float(abs(a), n)"), t219))
}

///|
let float_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_ABS")

///|
/// `FLOAT_ABS`
pub fn float_abs() -> @kernel.Thm {
  float_abs_c.get()
}

///|
/// FLOAT_POW
fn step_48() -> Unit raise {
  let t220 = @simp.rewrite_tac(@list.List([float(), @real.real_pow_mul(), @int.int_pow_th(), twopow_pow()]))
  float_pow_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ n : Int, ∀ m : Num, pow(float(a, n), m) == float(pow(a, m), n * int_of_num(m))"), t220))
}

///|
let float_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_POW")

///|
/// `FLOAT_POW`
pub fn float_pow() -> @kernel.Thm {
  float_pow_c.get()
}

///|
/// INT_SUB
fn step_49() -> Unit raise {
  let t221 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_sub_rneg()), @int.int_neg_neg()]))
  int_sub_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, a - b == a + -b"), t221))
}

///|
let int_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB")

///|
/// `INT_SUB`
pub fn int_sub() -> @kernel.Thm {
  int_sub_c.get()
}

///|
/// INT_ABS_NUM
fn step_50() -> Unit raise {
  let t222 = @simp.rewrite_tac(@list.List([@int.int_eq(), @int.int_abs_th(), @num_ext_nabs.int_num_real(), @calc_int.real_abs_num()]))
  int_abs_num_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, abs(int_of_num(n)) == int_of_num(n)"), t222))
}

///|
let int_abs_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_NUM")

///|
/// `INT_ABS_NUM`
pub fn int_abs_num() -> @kernel.Thm {
  int_abs_num_c.get()
}

///|
/// INT_ABS_NEG_NUM
fn step_51() -> Unit raise {
  let t223 = @simp.rewrite_tac(@list.List([@int.int_eq(), @int.int_abs_th(), @int.int_neg_th(), @num_ext_nabs.int_num_real(), @calc_int.real_abs_num(), @calc_int.real_abs_neg()]))
  int_abs_neg_num_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, abs(-int_of_num(n)) == int_of_num(n)"), t223))
}

///|
let int_abs_neg_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ABS_NEG_NUM")

///|
/// `INT_ABS_NEG_NUM`
pub fn int_abs_neg_num() -> @kernel.Thm {
  int_abs_neg_num_c.get()
}

///|
/// INT_ADD_NEG_NUM
fn step_52() -> Unit raise {
  let t224 = @simp.rewrite_tac(@list.List([@int.int_add_ac()]))
  int_add_neg_num_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, -int_of_num(x) + int_of_num(y) == int_of_num(y) + -int_of_num(x)"), t224))
}

///|
let int_add_neg_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_NEG_NUM")

///|
/// `INT_ADD_NEG_NUM`
pub fn int_add_neg_num() -> @kernel.Thm {
  int_add_neg_num_c.get()
}

///|
/// INT_POW_MUL
fn step_53() -> Unit raise {
  int_pow_mul_c.set(@int.int_of_real_thm(@real.real_pow_mul()))
}

///|
let int_pow_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_MUL")

///|
/// `INT_POW_MUL`
pub fn int_pow_mul() -> @kernel.Thm {
  int_pow_mul_c.get()
}

///|
/// INT_POW_NEG1
fn step_54() -> Unit raise {
  let t225 = @equal.gsym(@int.int_neg_minus1())
  let t226 = @simp.rewrite_tac(@list.List([@equal.gsym(int_pow_mul()), t225]))
  int_pow_neg1_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Num, ∀ n : Num, pow(-int_of_num(x), n) == pow(-int_of_num(1), n) * pow(int_of_num(x), n)"), t226))
}

///|
let int_pow_neg1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_NEG1")

///|
/// `INT_POW_NEG1`
pub fn int_pow_neg1() -> @kernel.Thm {
  int_pow_neg1_c.get()
}

///|
/// INT_POW_EVEN_NEG1
fn step_55() -> Unit raise {
  let t235 = @simp.rewrite_tac(@list.List([@int.int_mul_rid(), @int.int_mul_lid(), @int.int_of_real_thm(@real.real_pow_one())]))
  let t234 = @analysis.expand_tac("a")
  let t231 = @int.int_of_real_thm(@realarith.real_pow_2())
  let t232 = @equal.gsym(int_pow_pow())
  let t233 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2()), t232, t231, @int.int_neg_mul2()]))
  let t230 = @simp.rewrite_tac(@list.List([@nums.numeral(), @arith.bit0()]))
  let t229 = @simp.abbrev_tac(@term_syntax.parse_term("(b : Int) == pow(int_of_num((x : Num)), NUMERAL(BIT0((n : Num))))"))
  let t228 = @simp.abbrev_tac(@term_syntax.parse_term("(a : Int) == int_of_num(1)"))
  let t227 = @simp.once_rewrite_tac(@list.List([int_pow_neg1()]))
  let t236 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t227), t228), t229), t230), t233), t234), t235)
  int_pow_even_neg1_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Num, ∀ n : Num, pow(-int_of_num(x), NUMERAL(BIT0(n))) == pow(int_of_num(x), NUMERAL(BIT0(n)))"), t236))
}

///|
let int_pow_even_neg1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_EVEN_NEG1")

///|
/// `INT_POW_EVEN_NEG1`
pub fn int_pow_even_neg1() -> @kernel.Thm {
  int_pow_even_neg1_c.get()
}

///|
/// INT_POW_ODD_NEG1
fn step_56() -> Unit raise {
  let t246 = @simp.rewrite_tac(@list.List([@int.int_of_real_thm(@analysis.pow_1()), @int.int_mul_lid(), @int.int_mul_lneg()]))
  let t244 = @int.int_of_real_thm(@real.real_pow_add())
  let t245 = @simp.rewrite_tac(@list.List([@int.int_of_real_thm(@analysis.pow_minus1()), t244]))
  let t243 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_2())]))
  let t242 = @analysis.expand_tac("a")
  let t241 = @simp.once_rewrite_tac(@list.List([@arith.add1()]))
  let t240 = @simp.rewrite_tac(@list.List([@nums.numeral(), @arith.bit1()]))
  let t239 = @simp.abbrev_tac(@term_syntax.parse_term("(b : Int) == pow(int_of_num((x : Num)), NUMERAL(BIT1((n : Num))))"))
  let t238 = @simp.abbrev_tac(@term_syntax.parse_term("(a : Int) == int_of_num(1)"))
  let t237 = @simp.once_rewrite_tac(@list.List([int_pow_neg1()]))
  let t247 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t237), t238), t239), t240), t241), t242), t243), t245), t246)
  int_pow_odd_neg1_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Num, ∀ n : Num, pow(-int_of_num(x), NUMERAL(BIT1(n))) == -pow(int_of_num(x), NUMERAL(BIT1(n)))"), t247))
}

///|
let int_pow_odd_neg1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POW_ODD_NEG1")

///|
/// `INT_POW_ODD_NEG1`
pub fn int_pow_odd_neg1() -> @kernel.Thm {
  int_pow_odd_neg1_c.get()
}

///|
/// INT_ADD_NEG
fn step_57() -> Unit raise {
  let t251 = @tactics.accept_tac(@int.int_arith(@term_syntax.parse_term("int_of_num((x : Num)) + -int_of_num((y : Num)) == -(int_of_num(y) - int_of_num(x))")))
  let t252 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([]))), t251)
  let t249 = @simp.simp_tac(@list.List([@equal.gsym(@int.int_of_real_thm(@real.real_of_num_sub()))]))
  let t250 = @list.List([@tactics.asm_tac(@meson.meson_tac)(@list.List([@arith.le_lt()])), t249])
  let t253 = @list.List([@tactics.thenl(@tactics_ext.subgoal_tac(@term_syntax.parse_term("(x : Num) <= (y : Num)")), t250), t252])
  let t248 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("int_of_num((y : Num) - (x : Num)) == int_of_num(y) - int_of_num(x)"))
  let t254 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t248), t253)
  int_add_neg_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, x < y → int_of_num(x) + -int_of_num(y) == -int_of_num(y - x)"), t254))
}

///|
let int_add_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_NEG")

///|
/// `INT_ADD_NEG`
pub fn int_add_neg() -> @kernel.Thm {
  int_add_neg_c.get()
}

///|
/// INT_ADD_NEGv2
fn step_58() -> Unit raise {
  let t257 = @tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([int_sub()])))
  let t258 = @list.List([@tactics.then_tac((x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(0L, x256), @simp.simp_tac(@list.List([@equal.gsym(@int.int_of_real_thm(@real.real_of_num_sub()))]))), t257])
  let t255 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("int_of_num((x : Num) - (y : Num)) == int_of_num(x) - int_of_num(y)"))
  let t259 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t255), t258)
  int_add_negv2_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, y <= x → int_of_num(x) + -int_of_num(y) == int_of_num(x - y)"), t259))
}

///|
let int_add_negv2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ADD_NEGv2")

///|
/// `INT_ADD_NEGv2`
pub fn int_add_negv2() -> @kernel.Thm {
  int_add_negv2_c.get()
}

///|
/// `INT_SUB_CONV`
pub fn int_sub_conv(x260 : @kernel.Term) -> @kernel.Thm raise {
  let t = x260
  let (a, b) = @basics.dest_binop(@term_syntax.parse_term("(op_plus : (Int, Int) -> Int)"), t)
  let (_, a_1) = @kernel.dest_comb(a)
  let (_, b_1) = @kernel.dest_comb(b)
  let (_, b_2) = @kernel.dest_comb(b_1)
  let a_2 = @basics.dest_numeral(a_1)
  let b_3 = @basics.dest_numeral(b_2)
  let thm = if @num.le_num(b_3, a_2) {
    int_add_negv2()
  } else {
    int_add_neg()
  }
  @num_calc_simp.arith_simp_conv(@list.List([thm]))(t)
}

///|
/// FLOAT_CONV
fn step_59() -> Unit raise {
  float_conv_c.set(@num_calc_simp.arith_simp_conv(@list.List([float_mul(), float_sub(), float_abs(), float_pow(), float_add_nn(), float_add_nnv2(), float_add_pp(), float_add_ppv2(), float_add_np(), float_add_pn(), float_neg(), @int.int_neg_neg(), int_sub(), int_abs_num(), int_abs_neg_num(), @int.int_mul_lneg(), @int.int_mul_rneg(), @int.int_neg_mul2(), @int.int_of_num_mul(), @int.int_of_num_add(), @equal.gsym(@int.int_neg_add()), int_add_neg_num(), @int.int_of_num_pow(), int_pow_odd_neg1(), int_pow_even_neg1(), int_add_neg(), int_add_negv2()])))
}

///|
let float_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("FLOAT_CONV")

///|
/// `FLOAT_CONV`
pub fn float_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (float_conv_c.get())(x)
}

///|
/// Jordan/float.ml:557
fn step_60() -> Unit raise {
  let f : (@kernel.Term) -> Bool raise = fn(x261 : @kernel.Term) -> Bool raise {
    let z = x261
    let (x, y) = @kernel.dest_eq(z)
    let (u, v) = @kernel.dest_thm(float_conv(x))
    (@list.List::is_empty(u) && (z == v))
  }
  add_test_v1(("FLOAT_CONV1", (f(@term_syntax.parse_term("float(int_of_num(3), int_of_num(0)) == float(int_of_num(3), int_of_num(0))")) && (f(@term_syntax.parse_term("float(int_of_num(3), int_of_num(3)) == float(int_of_num(3), int_of_num(3))")) && (f(@term_syntax.parse_term("float(int_of_num(3), int_of_num(0)) + float(int_of_num(4), int_of_num(0)) == float(int_of_num(7), int_of_num(0))")) && (f(@term_syntax.parse_term("float(int_of_num(1) + int_of_num(3), int_of_num(4)) == float(int_of_num(4), int_of_num(4))")) && (f(@term_syntax.parse_term("float(int_of_num(3) - int_of_num(7), int_of_num(0)) == float(-int_of_num(4), int_of_num(0))")) && (f(@term_syntax.parse_term("float(int_of_num(3), int_of_num(4)) * float(-int_of_num(2), int_of_num(3)) == float(-int_of_num(6), int_of_num(7))")) && f(@term_syntax.parse_term("-float(-int_of_num(3), int_of_num(0)) == float(int_of_num(3), int_of_num(0))"))))))))))
}

///|
/// REAL_ADD_LE_SUBST_RHS
fn step_61() -> Unit raise {
  let t268 = @tactics.asm_tac(@meson.meson_tac)(@list.List([@analysis.real_le_radd(), @analysis.real_le_trans()]))
  let t267 = @tactics.asm_tac(@simp.once_rewrite_tac)(@list.List([]))
  let t263 = @tactics.repeat_tac(@tactics.disch_tac)
  let t262 = @tactics.repeat_tac(@tactics_ext.taut_tac(@term_syntax.parse_term("((b : Bool) → (a : Bool) → (c : Bool)) → a && b → c")))
  let t269 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t262), t263), (x266 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.h_ruler(@simp.once_rewrite_rule, @list.List([(x264 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x264)]), (x265 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x265), x266)), t267), t268)
  real_add_le_subst_rhs_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ P : (Real) -> Real, a <= P(b) && (∀ x : Real, P(x) == x + P(real_of_num(0))) && b <= c → a <= P(c)"), t269))
}

///|
let real_add_le_subst_rhs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_LE_SUBST_RHS")

///|
/// `REAL_ADD_LE_SUBST_RHS`
pub fn real_add_le_subst_rhs() -> @kernel.Thm {
  real_add_le_subst_rhs_c.get()
}

///|
/// REAL_ADD_LE_SUBST_LHS
fn step_62() -> Unit raise {
  let t274 = @tactics.asm_tac(@meson.meson_tac)(@list.List([@analysis.real_le_radd(), @analysis.real_le_trans()]))
  let t273 = @tactics.asm_tac(@simp.once_rewrite_tac)(@list.List([]))
  let t275 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics_ext.rep_gen_tac, @tactics_ext.disch_all_tac), (x272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.h_ruler(@simp.once_rewrite_rule, @list.List([(x270 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x270)]), (x271 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x271), x272)), t273), t274)
  real_add_le_subst_lhs_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ P : (Real) -> Real, P(a) <= b && (∀ x : Real, P(x) == x + P(real_of_num(0))) && c <= a → P(c) <= b"), t275))
}

///|
let real_add_le_subst_lhs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_LE_SUBST_LHS")

///|
/// `REAL_ADD_LE_SUBST_LHS`
pub fn real_add_le_subst_lhs() -> @kernel.Thm {
  real_add_le_subst_lhs_c.get()
}

///|
/// `IWRITE_REAL_LE_RHS`
pub fn iwrite_real_le_rhs(x276 : @kernel.Thm, x277 : @kernel.Thm) -> @kernel.Thm raise {
  let rel = x276
  let thm = x277
  let bvar = @basics.genvar(@term_syntax.parse_type("Real"))
  let t278 = @kernel.concl(rel)
  let (bt, _) = @basics.dest_binop(@term_syntax.parse_term("real_le"), t278)
  let sub : (@kernel.Term) -> @kernel.Thm raise = @equal.subs_conv(@list.List([@kernel.assume_rule(@basics.mk_eq(bt, bvar))]))
  let rule : (@kernel.Thm) -> @kernel.Thm raise = fn(x279 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x279
    @kernel.eq_mp(sub(@kernel.concl(th)), th)
  }
  let t280 = rule(thm)
  let (subrel, subthm) = (rule(rel), t280)
  let t281 = @kernel.concl(subthm)
  let (a, p) = @basics.dest_binop(@term_syntax.parse_term("real_le"), t281)
  let t282 = @kernel.concl(subrel)
  let (_, c) = @basics.dest_binop(@term_syntax.parse_term("real_le"), t282)
  let pfn = @kernel.mk_abs(bvar, p)
  let imp_th = @equal.beta_rule(@bool.specl(@list.List([a, bvar, c, pfn]), real_add_le_subst_rhs()))
  let ppart = @calc_rat.real_arith(@basics.dest_conj(@basics.dest_conj(@basics.dest_imp(@kernel.concl(imp_th)).0).1).0)
  let t283 = @bool.conj(subthm, @bool.conj(ppart, subrel))
  let prethm = @drule.match_mp(imp_th)(t283)
  let prethm2 = @bool.spec(bt, @bool.gen(bvar, @bool.disch(@lib.find(fn(x284 : @kernel.Term) -> Bool raise {
    let x = x284
    try {
      (bvar == @equal.rhs(x))
    } catch {
      failure => false
    }
  }, @kernel.hyp(prethm)), prethm)))
  let t285 = @kernel.refl(bt)
  @drule.match_mp(prethm2)(t285)
}

///|
/// `IWRITE_REAL_LE_LHS`
pub fn iwrite_real_le_lhs(x286 : @kernel.Thm, x287 : @kernel.Thm) -> @kernel.Thm raise {
  let rel = x286
  let thm = x287
  let avar = @basics.genvar(@term_syntax.parse_type("Real"))
  let t288 = @kernel.concl(rel)
  let (_, at) = @basics.dest_binop(@term_syntax.parse_term("real_le"), t288)
  let sub : (@kernel.Term) -> @kernel.Thm raise = @equal.subs_conv(@list.List([@kernel.assume_rule(@basics.mk_eq(at, avar))]))
  let rule : (@kernel.Thm) -> @kernel.Thm raise = fn(x289 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x289
    @kernel.eq_mp(sub(@kernel.concl(th)), th)
  }
  let t290 = rule(thm)
  let (subrel, subthm) = (rule(rel), t290)
  let t291 = @kernel.concl(subthm)
  let (p, b) = @basics.dest_binop(@term_syntax.parse_term("real_le"), t291)
  let t292 = @kernel.concl(subrel)
  let (c, _) = @basics.dest_binop(@term_syntax.parse_term("real_le"), t292)
  let pfn = @kernel.mk_abs(avar, p)
  let imp_th = @equal.beta_rule(@bool.specl(@list.List([avar, b, c, pfn]), real_add_le_subst_lhs()))
  let ppart = @calc_rat.real_arith(@basics.dest_conj(@basics.dest_conj(@basics.dest_imp(@kernel.concl(imp_th)).0).1).0)
  let t293 = @bool.conj(subthm, @bool.conj(ppart, subrel))
  let prethm = @drule.match_mp(imp_th)(t293)
  let prethm2 = @bool.spec(at, @bool.gen(avar, @bool.disch(@lib.find(fn(x294 : @kernel.Term) -> Bool raise {
    let x = x294
    try {
      (avar == @equal.rhs(x))
    } catch {
      failure => false
    }
  }, @kernel.hyp(prethm)), prethm)))
  let t295 = @kernel.refl(at)
  @drule.match_mp(prethm2)(t295)
}

///|
/// INTERVAL_ADD
fn step_63() -> Unit raise {
  let t306 = @simp.asm_rewrite_tac(@list.List([]))
  let t307 = @tactics_ext.h_val2(fn(x302 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x303 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_rhs(x302, x303)
    }
  }, (x304 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(2L, x304), (x305 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x305))
  let t308 = @tactics_ext.h_val2(fn(x298 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x299 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_rhs(x298, x299)
    }
  }, (x300 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x300), (x301 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(2L, x301))
  let t309 = @tactics.repeat_tac(@tactics.disch_tac)
  let t310 = @simp.abbrev_tac(@term_syntax.parse_term("(b' : Real) == abs((b : Real))"))
  let t311 = @simp.abbrev_tac(@term_syntax.parse_term("(a' : Real) == abs((a : Real))"))
  let t296 = @bool.spec(@term_syntax.parse_term("(a : Real)"), @analysis.abs_triangle())
  let t312 = @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(b : Real)"), t296))
  let t313 = @simp.abbrev_tac(@term_syntax.parse_term("(b : Real) == (y : Real) - (g : Real)"))
  let t314 = @simp.abbrev_tac(@term_syntax.parse_term("(a : Real) == (x : Real) - (f : Real)"))
  let t315 = @simp.rewrite_tac(@list.List([@tactics_refine.prove(@term_syntax.parse_term("(x : Real) + (y : Real) - ((f : Real) + (g : Real)) == x - f + (y - g)"), @calc_rat.real_arith_tac)]))
  let t316 = @simp.rewrite_tac(@list.List([interval()]))
  let t317 = @tactics_ext.taut_tac(@term_syntax.parse_term("((A : Bool) → (B : Bool) → (C : Bool)) → A && B → C"))
  let t318 = @tactics.every(@list.List([@tactics.repeat_tac(@tactics.gen_tac), t317, t316, t315, t314, t313, t312, (x297 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(0L, x297), t311, t310, t309, t308, t307, t306]))
  interval_add_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, ∀ y : Real, ∀ g : Real, ∀ ey : Real, interval(x, f, ex) && interval(y, g, ey) → interval(x + y, f + g, ex + ey)"), t318))
}

///|
let interval_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_ADD")

///|
/// `INTERVAL_ADD`
pub fn interval_add() -> @kernel.Thm {
  interval_add_c.get()
}

///|
/// INTERVAL_NEG
fn step_64() -> Unit raise {
  let t319 = @simp.rewrite_tac(@list.List([interval(), @calc_int.real_abs_neg(), @calc_rat.real_arith(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, -x - -y == -(x - y)"))]))
  interval_neg_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, interval(x, f, ex) == interval(-x, -f, ex)"), t319))
}

///|
let interval_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_NEG")

///|
/// `INTERVAL_NEG`
pub fn interval_neg() -> @kernel.Thm {
  interval_neg_c.get()
}

///|
/// INTERVAL_NEG2
fn step_65() -> Unit raise {
  let t320 = @simp.rewrite_tac(@list.List([interval(), @calc_int.real_abs_neg(), @calc_rat.real_arith(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, -x - y == -(x - -y)"))]))
  interval_neg2_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, interval(-x, f, ex) == interval(x, -f, ex)"), t320))
}

///|
let interval_neg2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_NEG2")

///|
/// `INTERVAL_NEG2`
pub fn interval_neg2() -> @kernel.Thm {
  interval_neg2_c.get()
}

///|
/// INTERVAL_SUB
fn step_66() -> Unit raise {
  let t324 = @tactics.asm_tac(@meson.meson_tac)(@list.List([interval_add()]))
  let t325 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_sub()])), @tactics_ext.disch_all_tac), (x323 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.h_ruler(@simp.once_rewrite_rule, @list.List([(x321 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(interval_neg(), x321)]), (x322 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x322), x323)), t324)
  interval_sub_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, ∀ y : Real, ∀ g : Real, ∀ ey : Real, interval(x, f, ex) && interval(y, g, ey) → interval(x - y, f - g, ex + ey)"), t325))
}

///|
let interval_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_SUB")

///|
/// `INTERVAL_SUB`
pub fn interval_sub() -> @kernel.Thm {
  interval_sub_c.get()
}

///|
/// REAL_PROP_LE_LABS
fn step_67() -> Unit raise {
  let t326 = @simp.simp_tac(@list.List([@analysis.real_le_lmul_imp(), @analysis.abs_pos()]))
  real_prop_le_labs_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, y <= z → abs(x) * y <= abs(x) * z"), t326))
}

///|
let real_prop_le_labs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_PROP_LE_LABS")

///|
/// `REAL_PROP_LE_LABS`
pub fn real_prop_le_labs() -> @kernel.Thm {
  real_prop_le_labs_c.get()
}

///|
/// REAL_PROP_LE_RABS
fn step_68() -> Unit raise {
  let t327 = @simp.simp_tac(@list.List([@analysis.real_le_rmul_imp(), @analysis.abs_pos()]))
  real_prop_le_rabs_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, y <= z → y * abs(x) <= z * abs(x)"), t327))
}

///|
let real_prop_le_rabs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_PROP_LE_RABS")

///|
/// `REAL_PROP_LE_RABS`
pub fn real_prop_le_rabs() -> @kernel.Thm {
  real_prop_le_rabs_c.get()
}

///|
/// REAL_LE_ABS_MUL
fn step_69() -> Unit raise {
  let t328 = @tactics.asm_tac(@meson.meson_tac)(@list.List([@analysis.real_le_rmul_imp()]))
  let t329 = @tactics.then_tac(@tactics.then_tac(@tactics_ext.disch_all_tac, @tactics.assume_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((z : Real)) <= (w : Real) → real_of_num(0) <= w")))), t328)
  real_le_abs_mul_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, ∀ w : Real, x <= y && abs(z) <= w → x * w <= y * w"), t329))
}

///|
let real_le_abs_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_ABS_MUL")

///|
/// `REAL_LE_ABS_MUL`
pub fn real_le_abs_mul() -> @kernel.Thm {
  real_le_abs_mul_c.get()
}

///|
/// INTERVAL_MUL
fn step_70() -> Unit raise {
  let t394 = @tactics.pop_assum(fn(x391 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s392 = @tactics.accept_tac(x391)
    fn(x393 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s392(x393)
    }
  })
  let t390 = @tactics_ext.h_val2(fn(x386 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x387 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_rhs(x386, x387)
    }
  }, (x388 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x388), (x389 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(3L, x389))
  let t385 = @tactics_ext.h_match_mp((x383 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x383))((x384 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x384))
  let t382 = @tactics_ext.h_conj((x380 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(11L, x380))((x381 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(12L, x381))
  let t376 = @term_syntax.parse_term("(ey : Real)")
  let t377 = @term_syntax.parse_term("(y : Real) - (g : Real)")
  let t378 = @term_syntax.parse_term("(ex : Real)")
  let t379 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("abs((x : Real) - (f : Real))"), t378, t377, t376]), real_le_abs_mul()))
  let t375 = @tactics_ext.h_val2(fn(x371 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x372 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_rhs(x371, x372)
    }
  }, (x373 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x373), (x374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x374))
  let t365 = @term_syntax.parse_term("(ey : Real)")
  let t366 = @term_syntax.parse_term("abs((y : Real) - (g : Real))")
  let t367 = @bool.specl(@list.List([@term_syntax.parse_term("(x : Real) - (f : Real)"), t366, t365]), real_prop_le_labs())
  let t370 = @tactics_ext.h_match_mp((x368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t367, x368))((x369 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(9L, x369))
  let t364 = @tactics_ext.h_val2(fn(x360 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x361 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_rhs(x360, x361)
    }
  }, (x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x362), (x363 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x363))
  let t354 = @term_syntax.parse_term("(ey : Real)")
  let t355 = @term_syntax.parse_term("abs((y : Real) - (g : Real))")
  let t356 = @bool.specl(@list.List([@term_syntax.parse_term("(f : Real)"), t355, t354]), real_prop_le_labs())
  let t359 = @tactics_ext.h_match_mp((x357 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t356, x357))((x358 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(7L, x358))
  let t353 = @tactics_ext.h_val2(fn(x349 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x350 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_rhs(x349, x350)
    }
  }, (x351 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x351), (x352 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x352))
  let t343 = @term_syntax.parse_term("(ex : Real)")
  let t344 = @term_syntax.parse_term("abs((x : Real) - (f : Real))")
  let t345 = @bool.specl(@list.List([@term_syntax.parse_term("(g : Real)"), t344, t343]), real_prop_le_rabs())
  let t348 = @tactics_ext.h_match_mp((x346 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t345, x346))((x347 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(4L, x347))
  let t342 = @tactics_ext.h_rewrite_rule(@list.List([(x340 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@analysis.abs_mul(), x340)]), (x341 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x341))
  let t339 = @tactics_ext.h_val2(fn(x335 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x336 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_rhs(x335, x336)
    }
  }, (x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x337), (x338 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x338))
  let t333 = @term_syntax.parse_term("((x : Real) - (f : Real)) * ((y : Real) - (g : Real))")
  let t334 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("((x : Real) - (f : Real)) * (g : Real)"), t333]), @analysis.abs_triangle()))
  let t331 = @term_syntax.parse_term("((x : Real) - (f : Real)) * (g : Real) + (x - f) * ((y : Real) - g)")
  let t332 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : Real) * ((y : Real) - (g : Real))"), t331]), @analysis.abs_triangle()))
  let t330 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * (y : Real) - (f : Real) * (g : Real) == f * (y - g) + ((x - f) * g + (x - f) * (y - g))"))]))
  let t395 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics_ext.rep_gen_tac, @simp.rewrite_tac(@list.List([interval()]))), t330), @tactics_ext.disch_all_tac), t332), t334), t339), t342), t348), t353), t359), t364), t370), t375), t379), t382), t385), t390), t394)
  interval_mul_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, ∀ y : Real, ∀ g : Real, ∀ ey : Real, interval(x, f, ex) && interval(y, g, ey) → interval(x * y, f * g, abs(f) * ey + (ex * abs(g) + ex * ey))"), t395))
}

///|
let interval_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_MUL")

///|
/// `INTERVAL_MUL`
pub fn interval_mul() -> @kernel.Thm {
  interval_mul_c.get()
}

///|
/// INTERVAL_NUM
fn step_71() -> Unit raise {
  let t396 = @simp.rewrite_tac(@list.List([interval(), float(), twopow_pos(), @analysis.pow(), @analysis.real_mul_rid(), @num_ext_nabs.int_num_real(), @analysis.real_sub_refl(), @real.real_abs_0(), @analysis.real_le_refl()]))
  interval_num_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, interval(real_of_num(n), float(int_of_num(n), int_of_num(0)), float(int_of_num(0), int_of_num(0)))"), t396))
}

///|
let interval_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_NUM")

///|
/// `INTERVAL_NUM`
pub fn interval_num() -> @kernel.Thm {
  interval_num_c.get()
}

///|
/// INTERVAL_CENTER
fn step_72() -> Unit raise {
  let t403 = @simp.asm_rewrite_tac(@list.List([]))
  let t402 = @tactics_ext.h_val2(fn(x398 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x399 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_rhs(x398, x399)
    }
  }, (x400 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x400), (x401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x401))
  let t397 = @tactics.assume_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - (g : Real)) <= abs((f : Real) - g) + abs(x - f)")))
  let t404 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([interval()])), @tactics_ext.disch_all_tac), t397), t402), t403)
  interval_center_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, ∀ g : Real, interval(x, f, ex) → interval(x, g, abs(f - g) + ex)"), t404))
}

///|
let interval_center_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_CENTER")

///|
/// `INTERVAL_CENTER`
pub fn interval_center() -> @kernel.Thm {
  interval_center_c.get()
}

///|
/// INTERVAL_WIDTH
fn step_73() -> Unit raise {
  let t410 = @simp.asm_rewrite_tac(@list.List([]))
  let t409 = @tactics_ext.h_val2(fn(x405 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x406 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_rhs(x405, x406)
    }
  }, (x407 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x407), (x408 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x408))
  let t411 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([interval()])), @tactics_ext.disch_all_tac), t409), t410)
  interval_width_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, ∀ ex' : Real, ex <= ex' → interval(x, f, ex) → interval(x, f, ex')"), t411))
}

///|
let interval_width_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_WIDTH")

///|
/// `INTERVAL_WIDTH`
pub fn interval_width() -> @kernel.Thm {
  interval_width_c.get()
}

///|
/// INTERVAL_MAX
fn step_74() -> Unit raise {
  let t412 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interval()])), @calc_rat.real_arith_tac)
  interval_max_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, interval(x, f, ex) → x <= f + ex"), t412))
}

///|
let interval_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_MAX")

///|
/// `INTERVAL_MAX`
pub fn interval_max() -> @kernel.Thm {
  interval_max_c.get()
}

///|
/// INTERVAL_MIN
fn step_75() -> Unit raise {
  let t413 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interval()])), @calc_rat.real_arith_tac)
  interval_min_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, interval(x, f, ex) → f - ex <= x"), t413))
}

///|
let interval_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_MIN")

///|
/// `INTERVAL_MIN`
pub fn interval_min() -> @kernel.Thm {
  interval_min_c.get()
}

///|
/// INTERVAL_ABS_MIN
fn step_76() -> Unit raise {
  let t414 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interval()])), @calc_rat.real_arith_tac)
  interval_abs_min_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, interval(x, f, ex) → abs(f) - ex <= abs(x)"), t414))
}

///|
let interval_abs_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_ABS_MIN")

///|
/// `INTERVAL_ABS_MIN`
pub fn interval_abs_min() -> @kernel.Thm {
  interval_abs_min_c.get()
}

///|
/// INTERVAL_ABS_MAX
fn step_77() -> Unit raise {
  let t415 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interval()])), @calc_rat.real_arith_tac)
  interval_abs_max_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, interval(x, f, ex) → abs(x) <= abs(f) + ex"), t415))
}

///|
let interval_abs_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_ABS_MAX")

///|
/// `INTERVAL_ABS_MAX`
pub fn interval_abs_max() -> @kernel.Thm {
  interval_abs_max_c.get()
}

///|
/// REAL_RINV_2
fn step_78() -> Unit raise {
  let t416 = @tactics.every(@list.List([@tactics.match_mp_tac(@analysis.real_mul_rinv()), @calc_rat.real_arith_tac]))
  real_rinv_2_c.set(@tactics_refine.prove(@term_syntax.parse_term("real_of_num(2) * inv(real_of_num(2)) == real_of_num(1)"), t416))
}

///|
let real_rinv_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_RINV_2")

///|
/// `REAL_RINV_2`
pub fn real_rinv_2() -> @kernel.Thm {
  real_rinv_2_c.get()
}

///|
/// INTERVAL_MK
fn step_79() -> Unit raise {
  let t423 = @simp.asm_rewrite_tac(@list.List([real_rinv_2(), @analysis.real_mul_rid()]))
  let t422 = @equal.gsym(@realax.real_mul_assoc())
  let t424 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) + (a : Real) + (a - b) == a * real_of_num(2)")), t422]))
  let t425 = @tactics.every(@list.List([@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_add_rdistrib())])), t424, t423]))
  let t420 = @simp.asm_rewrite_tac(@list.List([real_rinv_2(), @analysis.real_mul_rid()]))
  let t419 = @equal.gsym(@realax.real_mul_assoc())
  let t421 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) + (a : Real) - (a - b) == b * real_of_num(2)")), t419]))
  let t426 = @list.List([@tactics.every(@list.List([@simp.rewrite_tac(@list.List([@equal.gsym(@analysis.real_sub_rdistrib())])), t421, t420])), t425])
  let t417 = @simp.rewrite_tac(@list.List([@equal.gsym(@analysis.interval_abs())]))
  let t418 = @simp.rewrite_tac(@list.List([interval(), float(), twopow_neg(), @num_ext_nabs.int_num_real(), @real.real_pow_1(), @realax.real_mul_lid()]))
  let t427 = @tactics.thenl(@tactics.every(@list.List([@simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()])), @tactics_ext.disch_all_tac, t418, t417, @tactics.conj_tac])), t426)
  interval_mk_c.set(@tactics_refine.prove(@term_syntax.parse_term("LET((half : Real) => LET_END(∀ x : Real, ∀ xmin : Real, ∀ xmax : Real, xmin <= x && x <= xmax → interval(x, (xmin + xmax) * half, (xmax - xmin) * half)), float(int_of_num(1), -int_of_num(1)))"), t427))
}

///|
let interval_mk_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_MK")

///|
/// `INTERVAL_MK`
pub fn interval_mk() -> @kernel.Thm {
  interval_mk_c.get()
}

///|
/// INTERVAL_EPS_POS
fn step_80() -> Unit raise {
  let t430 = @tactics.match_accept_tac(@analysis.real_le_trans())
  let t431 = @tactics.disch_then(fn(x428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x = x428
    @tactics.mp_tac(@bool.conj(@bool.spec(@term_syntax.parse_term("(x : Real) - (f : Real)"), @real.real_abs_pos()), x))
  })
  let t432 = @tactics.repeat_tac(@tactics.gen_tac)
  let t433 = @tactics.every(@list.List([@simp.rewrite_tac(@list.List([interval()])), t432, t431, t430]))
  interval_eps_pos_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, interval(x, f, ex) → real_of_num(0) <= ex"), t433))
}

///|
let interval_eps_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_EPS_POS")

///|
/// `INTERVAL_EPS_POS`
pub fn interval_eps_pos() -> @kernel.Thm {
  interval_eps_pos_c.get()
}

///|
/// INTERVAL_EPS_0
fn step_81() -> Unit raise {
  let t434 = @tactics.every(@list.List([@simp.rewrite_tac(@list.List([interval(), float(), @int.int_of_num_th(), @analysis.real_mul_lzero()])), @calc_rat.real_arith_tac]))
  interval_eps_0_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ n : Int, interval(x, f, float(int_of_num(0), n)) → x == f"), t434))
}

///|
let interval_eps_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_EPS_0")

///|
/// `INTERVAL_EPS_0`
pub fn interval_eps_0() -> @kernel.Thm {
  interval_eps_0_c.get()
}

///|
/// REAL_EQ_RCANCEL_IMP'
fn step_82() -> Unit raise {
  let t435 = @meson.meson_tac(@list.List([@real.real_eq_rcancel_imp()]))
  real_eq_rcancel_imp_p_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, ∀ z : Real, x * z == y * z → !(z == real_of_num(0)) → x == y"), t435))
}

///|
let real_eq_rcancel_imp_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_EQ_RCANCEL_IMP'")

///|
/// `REAL_EQ_RCANCEL_IMP'`
pub fn real_eq_rcancel_imp_p() -> @kernel.Thm {
  real_eq_rcancel_imp_p_c.get()
}

///|
/// REAL_MK_POS_ABS_'
fn step_83() -> Unit raise {
  let t436 = @meson.meson_tac(@list.List([@real_ext.real_prop_nz_abs(), @analysis.abs_pos(), @analysis.real_lt_le()]))
  real_mk_pos_abs__p_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, !(x == real_of_num(0)) → real_of_num(0) < abs(x)"), t436))
}

///|
let real_mk_pos_abs__p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MK_POS_ABS_'")

///|
/// `REAL_MK_POS_ABS_'`
pub fn real_mk_pos_abs__p() -> @kernel.Thm {
  real_mk_pos_abs__p_c.get()
}

///|
/// INTERVAL_DIV
fn step_84() -> Unit raise {
  let t449 = @simp.asm_rewrite_tac(@list.List([]))
  let t448 = @tactics_ext.h_rule2(fn(x444 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x445 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x444, x445)
    }
  }, (x446 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(2L, x446), (x447 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x447))
  let t450 = @tactics_ext.h_match_mp((x443 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@real_ext.real_prop_nn_rcancel(), x443))(t448)
  let t442 = @tactics_ext.h_rule2(fn(x438 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x439 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x438, x439)
    }
  }, (x440 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x440), (x441 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(2L, x441))
  let t451 = @tactics_ext.h_match_mp((x437 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@analysis.real_le_trans(), x437))(t442)
  let t452 = @tactics.every(@list.List([@tactics_ext.disch_all_tac, @tactics.assume_tac(@bool.spec(@term_syntax.parse_term("(z : Real)"), @real_ext.real_mk_nn_abs())), t451, t450, t449]))
  let lemma1 = @tactics_refine.prove(@term_syntax.parse_term("real_of_num(0) < (u : Real) && abs((z : Real)) <= (e : Real) * u → real_of_num(0) <= e"), t452)
  let t504 = @simp.asm_rewrite_tac(@list.List([]))
  let t503 = @tactics_ext.h_rule2(fn(x499 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x500 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x499, x500)
    }
  }, (x501 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(3L, x501), (x502 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x502))
  let t505 = @tactics_ext.h(@drule.match_mp(@analysis.real_le_trans()))(t503)
  let t498 = @tactics_ext.h_rule2(fn(x494 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x495 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x494, x495)
    }
  }, (x496 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x496), (x497 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(3L, x497))
  let t506 = @tactics_ext.h(@drule.match_mp(@real_ext.real_prop_le_lmul()))(t498)
  let t493 = @tactics_ext.h_rule2(fn(x489 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x490 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x489, x490)
    }
  }, (x491 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x491), (x492 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x492))
  let t507 = @tactics_ext.h(@drule.match_mp(lemma1))(t493)
  let t508 = @tactics_ext.popl_tac(@list.List([0L, 2L, 4L, 6L]))
  let t509 = @simp.abbrev_tac(@term_syntax.parse_term("(u : Real) == abs((g : Real)) - (ey : Real)"))
  let t510 = @tactics_ext.h(@simp.once_rewrite_rule(@list.List([@equal.gsym(@analysis.real_sub_lt())])))((x488 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(4L, x488))
  let t511 = @simp.abbrev_tac(@term_syntax.parse_term("(z : Real) == (x : Real) - (h : Real) * (y : Real)"))
  let t512 = @tactics_ext.h(@simp.once_rewrite_rule(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - (f : Real) + (f - (h : Real) * (g : Real)) + h * (g - (y : Real)) == x - h * y"))])))((x487 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x487))
  let t513 = @tactics_ext.popl_tac(@list.List([1L, 2L, 3L, 4L, 5L, 6L, 7L, 9L, 10L, 12L]))
  let t483 = @bool.spec(@term_syntax.parse_term("(x : Real) - (f : Real) + (f - (h : Real) * (g : Real))"), @analysis.abs_triangle())
  let t484 = @bool.spec(@term_syntax.parse_term("(h : Real) * ((g : Real) - (y : Real))"), t483)
  let t514 = @tactics_ext.h_val2(fn(x481 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x482 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_lhs(x481, x482)
    }
  }, (x485 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t484, x485), (x486 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x486))
  let t515 = @tactics_ext.h_val2(fn(x477 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x478 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_lhs(x477, x478)
    }
  }, (x479 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x479), (x480 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(3L, x480))
  let t516 = @tactics_ext.h(@simp.rewrite_rule(@list.List([@equal.gsym(@analysis.abs_mul())])))((x476 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x476))
  let t517 = @tactics_ext.h(@drule.match_mp(@bool.spec(@term_syntax.parse_term("(h : Real)"), real_prop_le_labs())))((x475 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x475))
  let t518 = @tactics_ext.h(@simp.once_rewrite_rule(@list.List([@real.real_abs_sub()])))((x474 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(4L, x474))
  let t470 = @bool.spec(@term_syntax.parse_term("(x : Real) - (f : Real)"), @analysis.abs_triangle())
  let t471 = @bool.spec(@term_syntax.parse_term("(f : Real) - (h : Real) * (g : Real)"), t470)
  let t519 = @tactics_ext.h_val2(fn(x468 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x469 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_lhs(x468, x469)
    }
  }, (x472 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t471, x472), (x473 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x473))
  let t520 = @tactics_ext.h(@simp.rewrite_rule(@list.List([@realax.real_add_assoc()])))((x467 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x467))
  let t521 = @tactics_ext.h_val2(fn(x463 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x464 : @kernel.Thm) -> @kernel.Thm raise {
      iwrite_real_le_lhs(x463, x464)
    }
  }, (x465 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(2L, x465), (x466 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(4L, x466))
  let t522 = @tactics_ext.popl_tac(@list.List([3L, 4L, 5L]))
  let t523 = @tactics_ext.h(@drule.match_mp(interval_abs_min()))((x462 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(4L, x462))
  let t524 = @tactics_ext.h(@simp.rewrite_rule(@list.List([interval()])))((x461 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(3L, x461))
  let t525 = @tactics_ext.h(@simp.rewrite_rule(@list.List([interval()])))((x460 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x460))
  let t526 = @simp.asm_simp_tac(@list.List([@realax.real_mul_linv(), @analysis.real_mul_rid()]))
  let t459 = @equal.gsym(@realax.real_mul_assoc())
  let t527 = @simp.rewrite_tac(@list.List([@equal.gsym(@analysis.abs_mul()), @analysis.real_sub_rdistrib(), @realax.real_div(), t459]))
  let t528 = @tactics.match_mp_tac(@real_ext.real_mul_rtimes_le())
  let t529 = @tactics.disch_then(fn(x457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x457
    @tactics.mp_tac(@drule.match_mp(real_mk_pos_abs__p())(th))
  })
  let t530 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics_ext.h(fn(x454 : @kernel.Thm) -> @kernel.Thm raise {
    x454
  })((x455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x455))), (x456 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.undisch_el_tac(0L, x456))
  let t531 = @tactics.every(@list.List([@simp.rewrite_tac(@list.List([interval()])), t530, t529, t528, t527, t526, t525, t524, t523, t522, t521, t520, t519, t518, t517, t516, t515, t514, t513, t512, t511, t510, t509, t508, t507, t506, t505, t504]))
  let t453 = @simp.rewrite_tac(@list.List([interval()]))
  let t532 = @list.List([@tactics.every(@list.List([@tactics_ext.undisch_list(@list.List([1L, 2L])), t453, @calc_rat.real_arith_tac])), t531])
  let t533 = @tactics.every(@list.List([@tactics_ext.disch_all_tac, @tactics.thenl(@tactics_ext.subgoal_tac(@term_syntax.parse_term("!((y : Real) == real_of_num(0))")), t532)]))
  interval_div_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, ∀ y : Real, ∀ g : Real, ∀ ey : Real, ∀ h : Real, ∀ ez : Real, interval(x, f, ex) && interval(y, g, ey) && ey < abs(g) && ex + (abs(f - h * g) + abs(h) * ey) <= ez * (abs(g) - ey) → interval(x / y, h, ez)"), t533))
}

///|
let interval_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_DIV")

///|
/// `INTERVAL_DIV`
pub fn interval_div() -> @kernel.Thm {
  interval_div_c.get()
}

///|
/// INTERVAL_ABSV
fn step_85() -> Unit raise {
  let t535 = @meson.asm_meson_tac(@list.List([@analysis.real_le_trans()]))
  let t534 = @term_syntax.parse_term("(f : Real)")
  let t536 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real)"), t534]), @real.real_abs_sub_abs()))
  let t537 = @tactics.every(@list.List([@simp.rewrite_tac(@list.List([interval()])), @tactics_ext.disch_all_tac, t536, t535]))
  interval_absv_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, interval(x, f, ex) → interval(abs(x), abs(f), ex)"), t537))
}

///|
let interval_absv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_ABSV")

///|
/// `INTERVAL_ABSV`
pub fn interval_absv() -> @kernel.Thm {
  interval_absv_c.get()
}

///|
/// ssqrt
fn step_86() -> Unit raise {
  ssqrt_c.set(@pair.new_definition(@term_syntax.parse_term("(ssqrt : (Real) -> Real)((x : Real)) == (if x < real_of_num(0) { real_of_num(0) } else { sqrt(x) })")))
}

///|
let ssqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ssqrt")

///|
/// `ssqrt`
pub fn ssqrt() -> @kernel.Thm {
  ssqrt_c.get()
}

///|
/// LET_TAC
fn step_87() -> Unit raise {
  let_tac_c.set(@simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()])))
}

///|
let let_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("LET_TAC")

///|
/// `LET_TAC`
pub fn let_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (let_tac_c.get())(x)
}

///|
/// REAL_SSQRT_NEG
fn step_88() -> Unit raise {
  let t538 = @meson.asm_meson_tac(@list.List([]))
  let t539 = @tactics.thenl(@class.cond_cases_tac, @list.List([@tactics.accept_tac(@kernel.refl(@term_syntax.parse_term("real_of_num(0)"))), t538]))
  let t540 = @tactics.every(@list.List([@tactics_ext.disch_all_tac, @simp.rewrite_tac(@list.List([ssqrt()])), t539]))
  real_ssqrt_neg_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, x < real_of_num(0) → ssqrt(x) == real_of_num(0)"), t540))
}

///|
let real_ssqrt_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SSQRT_NEG")

///|
/// `REAL_SSQRT_NEG`
pub fn real_ssqrt_neg() -> @kernel.Thm {
  real_ssqrt_neg_c.get()
}

///|
/// REAL_SSQRT_NN
fn step_89() -> Unit raise {
  let t541 = @tactics.accept_tac(@kernel.refl(@term_syntax.parse_term("sqrt((x : Real))")))
  let t542 = @tactics.thenl(@class.cond_cases_tac, @list.List([@meson.asm_meson_tac(@list.List([@realax.real_lt()])), t541]))
  let t543 = @tactics.every(@list.List([@tactics_ext.disch_all_tac, @simp.rewrite_tac(@list.List([ssqrt()])), t542]))
  real_ssqrt_nn_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → ssqrt(x) == sqrt(x)"), t543))
}

///|
let real_ssqrt_nn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SSQRT_NN")

///|
/// `REAL_SSQRT_NN`
pub fn real_ssqrt_nn() -> @kernel.Thm {
  real_ssqrt_nn_c.get()
}

///|
/// REAL_MK_NN_SSQRT
fn step_90() -> Unit raise {
  let t550 = @meson.asm_meson_tac(@list.List([@real_ext.real_prop_nn_sqrt()]))
  let t551 = @tactics.then_tac(@tactics.pop_assum(fn(x548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x548
    @tactics.assume_tac(@bool.conj(th_1, @drule.match_mp(real_ssqrt_nn())(th_1)))
  }), t550)
  let t547 = @meson.meson_tac(@list.List([@analysis.real_le_refl()]))
  let t552 = @list.List([@tactics.then_tac(@tactics.pop_assum(fn(x545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x545
    @tactics.mp_tac(@drule.match_mp(real_ssqrt_neg())(th))
  }), t547), t551])
  let t544 = @term_syntax.parse_term("real_of_num(0)")
  let t553 = @tactics.every(@list.List([@tactics.gen_tac, @tactics.thenl(@tactics.disj_cases_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real)"), t544]), @realarith.real_lte_total())), t552)]))
  real_mk_nn_ssqrt_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= ssqrt(x)"), t553))
}

///|
let real_mk_nn_ssqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MK_NN_SSQRT")

///|
/// `REAL_MK_NN_SSQRT`
pub fn real_mk_nn_ssqrt() -> @kernel.Thm {
  real_mk_nn_ssqrt_c.get()
}

///|
/// REAL_SV_SSQRT_0
fn step_91() -> Unit raise {
  let t556 = @tactics.accept_tac(@real_ext.real_sv_sqrt_0())
  let t557 = @tactics.disch_then(fn(x554 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x554
    @simp.rewrite_tac(@list.List([@drule.match_mp(real_ssqrt_nn())(th)]))
  })
  let t558 = @tactics.every(@list.List([@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(0)"), @analysis.real_le_refl())), t557, t556]))
  real_sv_ssqrt_0_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : _, ssqrt(real_of_num(0)) == real_of_num(0)"), t558))
}

///|
let real_sv_ssqrt_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SV_SSQRT_0")

///|
/// `REAL_SV_SSQRT_0`
pub fn real_sv_ssqrt_0() -> @kernel.Thm {
  real_sv_ssqrt_0_c.get()
}

///|
/// REAL_SSQRT_EQ_0
fn step_92() -> Unit raise {
  let t560 = @meson.asm_meson_tac(@list.List([@real.sqrt_eq_0(), @real.real_eq_imp_le()]))
  let t561 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([real_ssqrt_nn()])), t560)
  let t562 = @list.List([@meson.asm_meson_tac(@list.List([@analysis.real_lt_imp_le()])), t561])
  let t559 = @term_syntax.parse_term("real_of_num(0)")
  let t563 = @tactics.every(@list.List([@tactics.gen_tac, @tactics.thenl(@tactics.disj_cases_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real)"), t559]), @realarith.real_lte_total())), t562)]))
  real_ssqrt_eq_0_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ssqrt(x) == real_of_num(0) → x <= real_of_num(0)"), t563))
}

///|
let real_ssqrt_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SSQRT_EQ_0")

///|
/// `REAL_SSQRT_EQ_0`
pub fn real_ssqrt_eq_0() -> @kernel.Thm {
  real_ssqrt_eq_0_c.get()
}

///|
/// REAL_SSQRT_MONO
fn step_93() -> Unit raise {
  let t565 = @meson.asm_meson_tac(@list.List([@analysis.real_le_trans(), real_ssqrt_nn(), @real_ext.real_prop_le_sqrt()]))
  let t566 = @list.List([@meson.asm_meson_tac(@list.List([real_ssqrt_neg(), real_mk_nn_ssqrt()])), t565])
  let t564 = @term_syntax.parse_term("real_of_num(0)")
  let t567 = @tactics.every(@list.List([@tactics.gen_tac, @tactics.thenl(@tactics.disj_cases_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real)"), t564]), @realarith.real_lte_total())), t566)]))
  real_ssqrt_mono_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, x <= (y : Real) → ssqrt(x) <= ssqrt(y)"), t567))
}

///|
let real_ssqrt_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SSQRT_MONO")

///|
/// `REAL_SSQRT_MONO`
pub fn real_ssqrt_mono() -> @kernel.Thm {
  real_ssqrt_mono_c.get()
}

///|
/// REAL_SSQRT_CHAR
fn step_94() -> Unit raise {
  let t572 = @meson.asm_meson_tac(@list.List([real_ssqrt_nn(), @real.sqrt_mul(), @real.pow_2_sqrt_abs(), @realarith.real_pow_2(), @real.real_abs_refl()]))
  let t569 = @bool.spec(@term_syntax.parse_term("(t : Real)"), @real_ext.real_mk_nn_square())
  let t573 = @tactics.every(@list.List([@tactics_ext.disch_all_tac, @tactics_ext.h_assume_tac((x571 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.h_rule_list(@simp.rewrite_rule, @list.List([(x568 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x568)]), (x570 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t569, x570), x571)), t572]))
  real_ssqrt_char_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ t : Real, real_of_num(0) <= t && t * t == x → t == ssqrt(x)"), t573))
}

///|
let real_ssqrt_char_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SSQRT_CHAR")

///|
/// `REAL_SSQRT_CHAR`
pub fn real_ssqrt_char() -> @kernel.Thm {
  real_ssqrt_char_c.get()
}

///|
/// REAL_SSQRT_SQUARE
fn step_95() -> Unit raise {
  let t574 = @meson.meson_tac(@list.List([real_ssqrt_nn(), @analysis.pow_2(), @real.sqrt_pow_2()]))
  real_ssqrt_square_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → ssqrt(x) * ssqrt(x) == x"), t574))
}

///|
let real_ssqrt_square_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SSQRT_SQUARE")

///|
/// `REAL_SSQRT_SQUARE`
pub fn real_ssqrt_square() -> @kernel.Thm {
  real_ssqrt_square_c.get()
}

///|
/// REAL_SSQRT_SQUARE'
fn step_96() -> Unit raise {
  let t576 = @simp.asm_simp_tac(@list.List([@real.sqrt_mul(), @equal.gsym(@analysis.pow_2()), @real.sqrt_pow_2()]))
  let t575 = @bool.spec(@term_syntax.parse_term("(x : Real)"), @real_ext.real_mk_nn_square())
  let t577 = @tactics.then_tac(@tactics.then_tac(@tactics_ext.disch_all_tac, @simp.rewrite_tac(@list.List([@drule.match_mp(real_ssqrt_nn())(t575)]))), t576)
  real_ssqrt_square_p_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, real_of_num(0) <= x → ssqrt(x * x) == x"), t577))
}

///|
let real_ssqrt_square_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_SSQRT_SQUARE'")

///|
/// `REAL_SSQRT_SQUARE'`
pub fn real_ssqrt_square_p() -> @kernel.Thm {
  real_ssqrt_square_p_c.get()
}

///|
/// INTERVAL_SSQRT
fn step_97() -> Unit raise {
  let t691 = @simp.asm_rewrite_tac(@list.List([interval()]))
  let t690 = @tactics_ext.h_rule2(fn(x686 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x687 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x686, x687)
    }
  }, (x688 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(7L, x688), (x689 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x689))
  let t692 = @tactics_ext.h(@drule.match_mp(@analysis.real_le_trans()))(t690)
  let t693 = @tactics_ext.h_rewrite_rule(@list.List([(x683 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x683), (x684 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@analysis.real_mul_rid(), x684)]), (x685 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(2L, x685))
  let t694 = @tactics_ext.h(@drule.match_mp(@analysis.real_mul_rinv()))((x682 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x682))
  let t695 = @tactics_ext.h(@drule.match_mp(@real_ext.real_mk_nz_pos()))((x681 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(8L, x681))
  let t696 = @tactics_ext.h(@simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_mul_assoc())])))((x680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x680))
  let t679 = @tactics_ext.h_rule2(fn(x675 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x676 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x675, x676)
    }
  }, (x677 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(11L, x677), (x678 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x678))
  let t697 = @tactics_ext.h(@drule.match_mp(@real.real_le_rmul()))(t679)
  let t698 = @tactics_ext.h(@drule.match_mp(@analysis.real_lt_imp_le()))((x674 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x674))
  let t699 = @tactics_ext.h(@drule.match_mp(@real_ext.real_prop_pos_inv()))((x673 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(4L, x673))
  let t672 = @tactics_ext.h_rule2(fn(x668 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x669 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x668, x669)
    }
  }, (x670 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(2L, x670), (x671 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x671))
  let t700 = @tactics_ext.h(@drule.match_mp(@analysis.real_le_trans()))(t672)
  let t667 = @tactics_ext.h_rule2(fn(x663 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x664 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x663, x664)
    }
  }, (x665 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(3L, x665), (x666 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x666))
  let t701 = @tactics_ext.h(@drule.match_mp(@real.real_le_lmul()))(t667)
  let t702 = @tactics_ext.popl_tac(@list.List([1L, 2L, 3L, 4L, 5L, 7L, 8L, 9L, 12L, 13L]))
  let t662 = @tactics_ext.h_rule2(fn(x658 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x659 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x658, x659)
    }
  }, (x660 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(9L, x660), (x661 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x661))
  let t703 = @tactics_ext.h(@drule.match_mp(@real.real_le_inv2()))(t662)
  let t655 = @term_syntax.parse_term("(u : Real)")
  let t656 = @term_syntax.parse_term("ssqrt((x : Real))")
  let t704 = @tactics_ext.h(@simp.once_rewrite_rule(@list.List([@equal.gsym(@bool.specl(@list.List([@term_syntax.parse_term("(v : Real)"), t656, t655]), @analysis.real_le_radd()))])))((x657 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x657))
  let t705 = @tactics_ext.h_rewrite_rule(@list.List([(x653 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x653)]), (x654 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x654))
  let t706 = @tactics_ext.h(@drule.match_mp(real_ssqrt_square_p()))((x652 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(16L, x652))
  let t707 = @tactics_ext.h(@drule.match_mp(real_ssqrt_mono()))((x651 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x651))
  let t650 = @tactics_ext.h_rule2(fn(x646 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x647 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x646, x647)
    }
  }, (x648 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(12L, x648), (x649 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(9L, x649))
  let t708 = @tactics_ext.h(@drule.match_mp(@analysis.real_le_trans()))(t650)
  let t709 = @tactics_ext.popl_tac(@list.List([1L, 2L, 3L, 5L, 6L, 7L, 8L]))
  let t710 = @tactics_ext.h_rewrite_rule(@list.List([@tactics_ext.h_rule(@equal.gsym, (x644 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x644))]), (x645 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x645))
  let t643 = @tactics_ext.h_rule2(fn(x639 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x640 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x639, x640)
    }
  }, (x641 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(5L, x641), (x642 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(2L, x642))
  let t711 = @tactics_ext.h(@drule.match_mp(@real.real_le_rmul()))(t643)
  let t712 = @tactics_ext.h_rewrite_rule(@list.List([(x637 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x637)]), (x638 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(2L, x638))
  let t713 = @tactics_ext.h(@simp.rewrite_rule(@list.List([@equal.gsym(@real.real_abs_refl())])))((x636 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x636))
  let t714 = @tactics_ext.h(@drule.match_mp(@analysis.real_lt_imp_le()))((x635 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(4L, x635))
  let t715 = @tactics_ext.h(@simp.rewrite_rule(@list.List([@analysis.abs_mul()])))((x634 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x634))
  let t631 = @term_syntax.parse_term("real_abs")
  let t716 = @tactics_ext.h((x632 : @kernel.Thm) => @equal.ap_term(t631, x632))((x633 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x633))
  let t717 = @tactics_ext.popl_tac(@list.List([1L, 2L, 3L, 4L]))
  let t630 = @tactics_ext.h_rule2(fn(x626 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x627 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x626, x627)
    }
  }, (x628 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(3L, x628), (x629 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x629))
  let t718 = @tactics_ext.h(@drule.match_mp(@analysis.real_le_trans()))(t630)
  let t625 = @tactics_ext.h_rule2(fn(x621 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x622 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x621, x622)
    }
  }, (x623 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x623), (x624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x624))
  let t719 = @tactics_ext.h(@drule.match_mp(@real.real_le_add2()))(t625)
  let t720 = @tactics_ext.popl_tac(@list.List([1L, 5L, 15L, 16L]))
  let t721 = @tactics_ext.h(@simp.once_rewrite_rule(@list.List([@real.real_abs_sub()])))((x620 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x620))
  let t722 = @tactics_ext.h(@simp.once_rewrite_rule(@list.List([interval()])))((x619 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(14L, x619))
  let t723 = @tactics_ext.h(@simp.rewrite_rule(@list.List([interval()])))((x618 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(12L, x618))
  let t724 = @tactics.assume_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real) - (u : Real) * u) <= abs(x - (f : Real)) + abs(f - u * u)")))
  let t725 = @tactics_ext.h_simp_rule(@list.List([(x615 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(7L, x615), (x616 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(real_ssqrt_square(), x616)]))((x617 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x617))
  let t726 = @tactics_ext.popl_tac(@list.List([1L, 2L]))
  let t727 = @tactics_ext.h(@simp.rewrite_rule(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@real.real_diffsq())])))((x614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x614))
  let t728 = @tactics_ext.h(@simp.rewrite_rule(@list.List([@realax.real_mul_assoc()])))((x613 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x613))
  let t729 = @tactics_ext.popl_tac(@list.List([1L, 2L, 3L]))
  let t730 = @tactics_ext.h_rewrite_rule(@list.List([@tactics_ext.h_rule(@equal.gsym, (x611 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x611))]), (x612 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(2L, x612))
  let t731 = @tactics_ext.h(@drule.match_mp(@analysis.real_mul_rinv()))((x610 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x610))
  let t732 = @tactics_ext.h(@drule.match_mp(@real_ext.real_mk_nz_pos()))((x609 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(2L, x609))
  let t733 = @tactics.assume_tac(@calc_rat.real_arith(@term_syntax.parse_term("ssqrt((x : Real)) - (u : Real) == (ssqrt(x) - u) * real_of_num(1)")))
  let t734 = @tactics_ext.h(@drule.match_mp(@real_ext.real_prop_pos_inv()))((x608 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x608))
  let t604 = @bool.spec(@term_syntax.parse_term("(x : Real)"), real_mk_nn_ssqrt())
  let t607 = @tactics_ext.h_rule2(fn(x602 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x603 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x602, x603)
    }
  }, (x605 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t604, x605), (x606 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(11L, x606))
  let t735 = @tactics_ext.h(@drule.match_mp(@real_ext.real_prop_pos_ladd()))(t607)
  let t601 = @tactics_ext.h_rule2(fn(x597 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x598 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x597, x598)
    }
  }, (x599 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(11L, x599), (x600 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(10L, x600))
  let t736 = @tactics_ext.h(@drule.match_mp(@real_ext.real_prop_pos_ladd()))(t601)
  let t596 = @tactics_ext.h_rule2(fn(x592 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x593 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x592, x593)
    }
  }, (x594 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x594), (x595 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x595))
  let t737 = @tactics_ext.h(@drule.match_mp(@real_ext.real_prop_nn_add2()))(t596)
  let t738 = @tactics_ext.h(@drule.match_mp(interval_eps_pos()))((x591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(5L, x591))
  let t739 = @tactics_ext.h(@drule.match_mp(interval_eps_pos()))((x590 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(3L, x590))
  let t589 = @tactics_ext.h_rule2(fn(x585 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x586 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x585, x586)
    }
  }, (x587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x587), (x588 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(0L, x588))
  let t740 = @tactics_ext.h(@drule.match_mp(@analysis.real_le_trans()))(t589)
  let t741 = @tactics_ext.h(@drule.match_mp(interval_min()))((x584 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(1L, x584))
  let t580 = @bool.spec(@term_syntax.parse_term("(v : Real)"), @real_ext.real_mk_nn_square())
  let t583 = @tactics_ext.h_rule2(fn(x578 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x579 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x578, x579)
    }
  }, (x581 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t580, x581), (x582 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp_int(3L, x582))
  let t742 = @tactics.every(@list.List([@tactics_ext.disch_all_tac, @tactics_ext.h(@drule.match_mp(@analysis.real_le_trans()))(t583), t741, t740, t739, t738, t737, t736, t735, t734, t733, t732, t731, t730, t729, t728, t727, t726, t725, t724, t723, t722, t721, t720, t719, t718, t717, t716, t715, t714, t713, t712, t711, t710, t709, t708, t707, t706, t705, t704, t703, t702, t701, t700, t699, t698, t697, t696, t695, t694, t693, t692, t691]))
  interval_ssqrt_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, ∀ u : Real, ∀ ey : Real, ∀ ez : Real, ∀ v : Real, interval(x, f, ex) && interval(u * u, f, ey) && ex + ey <= ez * (v + u) && v * v <= f - ex && real_of_num(0) < u && real_of_num(0) <= v → interval(ssqrt(x), u, ez)"), t742))
}

///|
let interval_ssqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_SSQRT")

///|
/// `INTERVAL_SSQRT`
pub fn interval_ssqrt() -> @kernel.Thm {
  interval_ssqrt_c.get()
}

///|
/// Jordan/float.ml:1060
fn step_98() -> Unit raise {
  test__v1(())
}

///|
/// DOUBLE_CONV_FILE
fn step_99() -> Unit raise {
  double_conv_file_c.set(true)
}

///|
let double_conv_file_c : @lib.Cell[Bool] = @lib.Cell::new("DOUBLE_CONV_FILE")

///|
/// `DOUBLE_CONV_FILE`
pub fn double_conv_file() -> Bool {
  double_conv_file_c.get()
}

///|
let add_test_c : @lib.Cell[((String, Bool)) -> Unit raise] = @lib.Cell::new("add_test")

///|
/// `add_test`
pub fn add_test(x : (String, Bool)) -> Unit raise {
  (add_test_c.get())(x)
}

///|
let test__c : @lib.Cell[(Unit) -> Unit raise] = @lib.Cell::new("test")

///|
/// `test`
pub fn test_(x : Unit) -> Unit raise {
  (test__c.get())(x)
}

///|
/// add_test, test
fn step_100() -> Unit raise {
  let (add_test, test_) = @lib_ext.new_test_suite(())
  add_test_c.set(add_test)
  test__c.set(test_)
}

///|
/// `num_exponent`
pub fn num_exponent(x743 : @num.Num) -> @num.Num raise {
  let a = x743
  let afloat = @num.float_of_num(@num.abs_num(a))
  @num.num_of_int64(@lib.sub63(@lib.float_frexp(afloat).1, 1L))
}

///|
/// Jordan/float.ml:1090
fn step_101() -> Unit raise {
  let f : ((@num.Num, Int64)) -> Bool raise = fn(x744 : (@num.Num, Int64)) -> Bool raise {
    let (u, v) = x744
    let t745 = @num.num_of_int64(v)
    (num_exponent(u) == t745)
  }
  let t746 = @num.num_of_int64(4L)
  let t747 = (@num.div_num(@num.num_of_int64(3L), t746), (-1L))
  let t748 = (@num.num_of_int64(0L), (-1L))
  let t749 = (@num.num_of_int64((-65L)), 6L)
  let t750 = (@num.num_of_int64(65L), 6L)
  add_test(("num_exponenwt", @lib.forall(f, @list.List([(@num.num_of_int64(1L), 0L), t750, t749, t748, t747]))))
}

///|
/// `dest_unary`
pub fn dest_unary(x751 : @kernel.Term, x752 : @kernel.Term) -> @kernel.Term raise {
  let op = x751
  let tm = x752
  try {
    let (xop, r) = @kernel.dest_comb(tm)
    if (xop == op) {
      r
    } else {
      @lib.failure()
    }
  } catch {
    Failure(_) => raise Failure("dest_unary")
    e => raise e
  }
}

///|
/// `round_outward`
pub fn round_outward(x753 : Int64, x754 : @num.Num) -> @num.Num raise {
  let prec_b = x753
  let a = x754
  let b = @num.abs_num(a)
  let sign : (@num.Num) -> @num.Num raise = if @num.eq_num(a, b) {
    fn(x755 : @num.Num) -> @num.Num raise {
      x755
    }
  } else {
    fn(x756 : @num.Num) -> @num.Num raise {
      @num.minus_num(x756)
    }
  }
  let t757 = @num.num_of_int64(prec_b)
  let t758 = @num.sub_num(num_exponent(b), t757)
  let throw_bits = @num.max_num(@num.num_of_int64(0L), t758)
  let twoexp = @num.power_num(@num.num_of_int64(2L), throw_bits)
  @num.mult_num(sign(@num.ceiling_num(@num.div_num(b, twoexp))), twoexp)
}

///|
/// `round_inward`
pub fn round_inward(x759 : Int64, x760 : @num.Num) -> @num.Num raise {
  let prec_b = x759
  let a = x760
  let b = @num.abs_num(a)
  let sign : (@num.Num) -> @num.Num raise = if @num.eq_num(a, b) {
    fn(x761 : @num.Num) -> @num.Num raise {
      x761
    }
  } else {
    fn(x762 : @num.Num) -> @num.Num raise {
      @num.minus_num(x762)
    }
  }
  let t763 = @num.num_of_int64(prec_b)
  let t764 = @num.sub_num(num_exponent(b), t763)
  let throw_bits = @num.max_num(@num.num_of_int64(0L), t764)
  let twoexp = @num.power_num(@num.num_of_int64(2L), throw_bits)
  @num.mult_num(sign(@num.floor_num(@num.div_num(b, twoexp))), twoexp)
}

///|
/// `round_rat`
pub fn round_rat(x765 : Int64, x766 : @num.Num) -> @num.Num raise {
  let bprec = x765
  let n = x766
  let b = @num.abs_num(n)
  let sign : (@num.Num) -> @num.Num raise = if @num.eq_num(b, n) {
    fn(x767 : @num.Num) -> @num.Num raise {
      x767
    }
  } else {
    fn(x768 : @num.Num) -> @num.Num raise {
      @num.minus_num(x768)
    }
  }
  let t769 = @num.num_of_int64(bprec)
  let powt = @num.power_num(@num.num_of_int64(2L), t769)
  sign(@num.div_num(round_outward(bprec, @num.ceiling_num(@num.mult_num(b, powt))), powt))
}

///|
/// `round_inward_rat`
pub fn round_inward_rat(x770 : Int64, x771 : @num.Num) -> @num.Num raise {
  let bprec = x770
  let n = x771
  let b = @num.abs_num(n)
  let sign : (@num.Num) -> @num.Num raise = if @num.eq_num(b, n) {
    fn(x772 : @num.Num) -> @num.Num raise {
      x772
    }
  } else {
    fn(x773 : @num.Num) -> @num.Num raise {
      @num.minus_num(x773)
    }
  }
  let t774 = @num.num_of_int64(bprec)
  let powt = @num.power_num(@num.num_of_int64(2L), t774)
  sign(@num.div_num(round_inward(bprec, @num.floor_num(@num.mult_num(b, powt))), powt))
}

///|
/// `round_outward_float`
pub fn round_outward_float(x775 : Int64, x776 : Double) -> @num.Num raise {
  let bprec = x775
  let f = x776
  if (f == 0.0) {
    @num.num_of_int64(0L)
  } else {
    let b = Double::abs(f)
    let sign : (@num.Num) -> @num.Num raise = if (@lib.compare(f, 0.0) >= 0) {
      fn(x777 : @num.Num) -> @num.Num raise {
        x777
      }
    } else {
      fn(x778 : @num.Num) -> @num.Num raise {
        @num.minus_num(x778)
      }
    }
    let (x, n) = @lib.float_frexp(b)
    let u = @lib.norm63(Double::to_int64(Double::ceil(@lib.float_ldexp(x, bprec))))
    let t779 = @num.num_of_int64(@lib.sub63(n, bprec))
    let t780 = @num.power_num(@num.num_of_int64(2L), t779)
    sign(@num.mult_num(@num.num_of_int64(u), t780))
  }
}

///|
/// `round_inward_float`
pub fn round_inward_float(x781 : Int64, x782 : Double) -> @num.Num raise {
  let bprec = x781
  let f = x782
  if (f == 0.0) {
    @num.num_of_int64(0L)
  } else {
    let bprec_1 = if (bprec > 25L) {
      25L
    } else {
      bprec
    }
    let b = Double::abs(f)
    let sign : (@num.Num) -> @num.Num raise = if (@lib.compare(f, 0.0) >= 0) {
      fn(x783 : @num.Num) -> @num.Num raise {
        x783
      }
    } else {
      fn(x784 : @num.Num) -> @num.Num raise {
        @num.minus_num(x784)
      }
    }
    let (x, n) = @lib.float_frexp(b)
    let u = @lib.norm63(Double::to_int64(Double::floor(@lib.float_ldexp(x, bprec_1))))
    let t785 = @num.num_of_int64(@lib.sub63(n, bprec_1))
    let t786 = @num.power_num(@num.num_of_int64(2L), t785)
    sign(@num.mult_num(@num.num_of_int64(u), t786))
  }
}

///|
/// `SUBST_TERM`
pub fn subst_term(x787 : @list.List[(@kernel.Term, @kernel.Term)], x788 : @kernel.Term) -> @kernel.Term raise {
  let sublist = x787
  let tm = x788
  let t791 = @kernel.refl(tm)
  let t792 = @bool.genl(@lib.map(fn(x790 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    x790.1
  }, sublist), t791)
  @equal.rhs(@kernel.concl(@bool.specl(@lib.map(fn(x789 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    x789.0
  }, sublist), t792)))
}

///|
/// Jordan/float.ml:1166
fn step_102() -> Unit raise {
  let t797 = @term_syntax.parse_term("DECIMAL(1, 1) + (DECIMAL(2, 1) + (c : Real))")
  let t796 = @term_syntax.parse_term("(a : Real) + ((b : Real) + (c : Real))")
  let t794 = @term_syntax.parse_term("(b : Real)")
  let t795 = (@term_syntax.parse_term("DECIMAL(2, 1)"), t794)
  let t793 = @term_syntax.parse_term("(a : Real)")
  add_test(("SUBST_TERM", (subst_term(@list.List([(@term_syntax.parse_term("DECIMAL(1, 1)"), t793), t795]), t796) == t797)))
}

///|
/// `INTERVAL_CLEAN_CONV`
pub fn interval_clean_conv(x798 : @kernel.Term) -> @kernel.Thm raise {
  let interv = x798
  let (ixf, ex) = @kernel.dest_comb(interv)
  let (ix, f) = @kernel.dest_comb(ixf)
  let fthm = float_conv(f)
  let exthm = float_conv(ex)
  let ixfthm = @equal.ap_term(ix, fthm)
  @kernel.mk_comb_rule(ixfthm, exthm)
}

///|
/// Jordan/float.ml:1183
fn step_103() -> Unit raise {
  let testval = interval_clean_conv(@term_syntax.parse_term("interval(real_of_num(1) + real_of_num(1), float(int_of_num(3), int_of_num(4)) + float(int_of_num(2), -int_of_num(3)), float(int_of_num(1), int_of_num(2)) * float(int_of_num(3), -int_of_num(2)))"))
  let hypval = @kernel.hyp(testval)
  let concval = @kernel.concl(testval)
  add_test(("INTERVAL_CLEAN_CONV", ((Int::to_int64(@lib.length(hypval)) == 0L) && (concval == @term_syntax.parse_term("interval(real_of_num(1) + real_of_num(1), float(int_of_num(3), int_of_num(4)) + float(int_of_num(2), -int_of_num(3)), float(int_of_num(1), int_of_num(2)) * float(int_of_num(3), -int_of_num(2))) == interval(real_of_num(1) + real_of_num(1), float(int_of_num(386), -int_of_num(3)), float(int_of_num(3), int_of_num(0)))")))))
}

///|
/// FLOAT_EQ
fn step_104() -> Unit raise {
  let t799 = @meson.meson_tac(@list.List([@analysis.real_sub_0()]))
  float_eq_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ a' : Int, ∀ b' : Int, (float(a, b) == float(a', b')) == (float(a, b) - float(a', b') == real_of_num(0))"), t799))
}

///|
let float_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_EQ")

///|
/// `FLOAT_EQ`
pub fn float_eq() -> @kernel.Thm {
  float_eq_c.get()
}

///|
/// FLOAT_LT
fn step_105() -> Unit raise {
  let t800 = @meson.meson_tac(@list.List([@analysis.real_sub_lt()]))
  float_lt_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ a' : Int, ∀ b' : Int, (float(a, b) < float(a', b')) == (real_of_num(0) < float(a', b') - float(a, b))"), t800))
}

///|
let float_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_LT")

///|
/// `FLOAT_LT`
pub fn float_lt() -> @kernel.Thm {
  float_lt_c.get()
}

///|
/// FLOAT_LE
fn step_106() -> Unit raise {
  let t801 = @meson.meson_tac(@list.List([@analysis.real_sub_le()]))
  float_le_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, ∀ a' : Int, ∀ b' : Int, (float(a, b) <= float(a', b')) == (real_of_num(0) <= float(a', b') - float(a, b))"), t801))
}

///|
let float_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_LE")

///|
/// `FLOAT_LE`
pub fn float_le() -> @kernel.Thm {
  float_le_c.get()
}

///|
/// TWOPOW_MK_POS
fn step_107() -> Unit raise {
  let t802 = @tactics.match_mp_tac(@real.real_pow_lt())
  let t803 = @tactics.try_tac(@tactics.match_mp_tac(@analysis.real_inv_pos()))
  let t804 = @simp.asm_rewrite_tac(@list.List([twopow_pos(), twopow_neg()]))
  let t805 = @tactics.pop_assum(@tactics.disj_cases_tac)
  let t806 = @tactics.every(@list.List([@tactics.gen_tac, @tactics.choose_tac(@bool.spec(@term_syntax.parse_term("(a : Int)"), @num_ext_nabs.int_rep2())), t805, t804, t803, t802, @calc_rat.real_arith_tac]))
  twopow_mk_pos_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, real_of_num(0) < twopow(a)"), t806))
}

///|
let twopow_mk_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_MK_POS")

///|
/// `TWOPOW_MK_POS`
pub fn twopow_mk_pos() -> @kernel.Thm {
  twopow_mk_pos_c.get()
}

///|
/// TWOPOW_NZ
fn step_108() -> Unit raise {
  let t807 = @bool.spec(@term_syntax.parse_term("(a : Int)"), twopow_mk_pos())
  let t808 = @tactics.then_tac(@tactics.gen_tac, @tactics.accept_tac(@drule.match_mp(@real_ext.real_mk_nz_pos())(t807)))
  twopow_nz_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, !(twopow(a) == real_of_num(0))"), t808))
}

///|
let twopow_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TWOPOW_NZ")

///|
/// `TWOPOW_NZ`
pub fn twopow_nz() -> @kernel.Thm {
  twopow_nz_c.get()
}

///|
/// FLOAT_ZERO
fn step_109() -> Unit raise {
  let t809 = @meson.meson_tac(@list.List([twopow_nz()]))
  let t810 = @tactics.every(@list.List([@simp.rewrite_tac(@list.List([float(), @realarith.real_entire(), @num_ext_nabs.int_of_num_dest()])), t809]))
  float_zero_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, (float(a, b) == real_of_num(0)) == (a == int_of_num(0))"), t810))
}

///|
let float_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_ZERO")

///|
/// `FLOAT_ZERO`
pub fn float_zero() -> @kernel.Thm {
  float_zero_c.get()
}

///|
/// INT_ZERO
fn step_110() -> Unit raise {
  let t811 = @simp.rewrite_tac(@list.List([@int.int_of_num_eq()]))
  int_zero_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, (int_of_num(n) == int_of_num(0)) == (n == 0)"), t811))
}

///|
let int_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ZERO")

///|
/// `INT_ZERO`
pub fn int_zero() -> @kernel.Thm {
  int_zero_c.get()
}

///|
/// INT_ZERO_NEG
fn step_111() -> Unit raise {
  let t812 = @simp.rewrite_tac(@list.List([@int.int_neg_eq_0(), int_zero()]))
  int_zero_neg_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, (-int_of_num(n) == int_of_num(0)) == (n == 0)"), t812))
}

///|
let int_zero_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_ZERO_NEG")

///|
/// `INT_ZERO_NEG`
pub fn int_zero_neg() -> @kernel.Thm {
  int_zero_neg_c.get()
}

///|
/// FLOAT_NN
fn step_112() -> Unit raise {
  let t827 = @simp.asm_rewrite_tac(@list.List([]))
  let t828 = @tactics_ext.input_combo(@list.List([(x824 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@real_ext.real_prop_nn_mul2(), x824), @tactics_ext.op_amp_amp_amp((x825 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("2", x825))((x826 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("1", x826))]))
  let t829 = @tactics_ext.input_combo(@list.List([(x821 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@int.int_of_num_th(), x821), (x822 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@int.int_le(), x822), (x823 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("0", x823)]))
  let t819 = @bool.spec(@term_syntax.parse_term("(b : Int)"), twopow_mk_pos())
  let t830 = @tactics.every(@list.List([@tactics_ext.disch_all_tac, @tactics_ext.input_combo(@list.List([(x818 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@real_ext.real_prop_nn_pos(), x818), (x820 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t819, x820)])), t829, t828, t827]))
  let t817 = @meson.asm_meson_tac(@list.List([@int.int_le(), @int.int_of_num_th()]))
  let t814 = @bool.spec(@term_syntax.parse_term("(b : Int)"), twopow_mk_pos())
  let t831 = @tactics.thenl(@tactics.eq_tac, @list.List([@tactics.every(@list.List([@tactics_ext.disch_all_tac, @tactics_ext.input_combo(@list.List([(x813 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@real_ext.real_prop_nn_rcancel(), x813), @tactics_ext.op_amp_amp_amp((x815 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t814, x815))((x816 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("0", x816))])), t817])), t830]))
  let t832 = @tactics.every(@list.List([@simp.rewrite_tac(@list.List([float(), @num_ext_nabs.int_of_num_dest()])), @tactics_ext.rep_gen_tac, t831]))
  float_nn_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, (real_of_num(0) <= float(a, b)) == (int_of_num(0) <= a)"), t832))
}

///|
let float_nn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_NN")

///|
/// `FLOAT_NN`
pub fn float_nn() -> @kernel.Thm {
  float_nn_c.get()
}

///|
/// INT_NN
fn step_113() -> Unit raise {
  int_nn_c.set(@int.int_pos())
}

///|
let int_nn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NN")

///|
/// `INT_NN`
pub fn int_nn() -> @kernel.Thm {
  int_nn_c.get()
}

///|
/// INT_NN_NEG
fn step_114() -> Unit raise {
  let t833 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_neg_ge0(), @int.int_of_num_le()])), @int.arith_tac)
  int_nn_neg_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, (int_of_num(0) <= -int_of_num(n)) == (n == 0)"), t833))
}

///|
let int_nn_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_NN_NEG")

///|
/// `INT_NN_NEG`
pub fn int_nn_neg() -> @kernel.Thm {
  int_nn_neg_c.get()
}

///|
/// FLOAT_POS
fn step_115() -> Unit raise {
  let t834 = @meson.meson_tac(@list.List([float_nn(), float_zero(), @int.int_lt_le(), @analysis.real_lt_le()]))
  float_pos_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Int, ∀ b : Int, (real_of_num(0) < float(a, b)) == (int_of_num(0) < a)"), t834))
}

///|
let float_pos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FLOAT_POS")

///|
/// `FLOAT_POS`
pub fn float_pos() -> @kernel.Thm {
  float_pos_c.get()
}

///|
/// INT_POS'
fn step_116() -> Unit raise {
  let t835 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_of_num_lt()])), @int.arith_tac)
  int_pos_p_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, (int_of_num(0) < int_of_num(n)) == !(n == 0)"), t835))
}

///|
let int_pos_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POS'")

///|
/// `INT_POS'`
pub fn int_pos_p() -> @kernel.Thm {
  int_pos_p_c.get()
}

///|
/// INT_POS_NEG
fn step_117() -> Unit raise {
  let t836 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.int_of_num_lt()])), @int.arith_tac)
  int_pos_neg_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, (int_of_num(0) < -int_of_num(n)) == false"), t836))
}

///|
let int_pos_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_POS_NEG")

///|
/// `INT_POS_NEG`
pub fn int_pos_neg() -> @kernel.Thm {
  int_pos_neg_c.get()
}

///|
/// RAT_LEMMA1_SUB
fn step_118() -> Unit raise {
  let t837 = @meson.meson_tac(@list.List([@realax.real_div()]))
  let t838 = @simp.simp_tac(@list.List([@calc_rat.rat_lemma1()]))
  let t839 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_div())]))
  let t840 = @simp.rewrite_tac(@list.List([@realax.real_sub(), @equal.gsym(@calc_int.real_mul_lneg())]))
  let t841 = @tactics.every(@list.List([@simp.rewrite_tac(@list.List([@realax.real_div()])), t840, t839, t838, @tactics.disch_tac, t837]))
  rat_lemma1_sub_c.set(@tactics_refine.prove(@term_syntax.parse_term("!((y1 : Real) == real_of_num(0)) && !((y2 : Real) == real_of_num(0)) → (x1 : Real) / y1 - (x2 : Real) / y2 == (x1 * y2 - x2 * y1) * (inv(y1) * inv(y2))"), t841))
}

///|
let rat_lemma1_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RAT_LEMMA1_SUB")

///|
/// `RAT_LEMMA1_SUB`
pub fn rat_lemma1_sub() -> @kernel.Thm {
  rat_lemma1_sub_c.get()
}

///|
/// INTERVAL_0
fn step_119() -> Unit raise {
  let t842 = @meson.meson_tac(@list.List([interval(), @analysis.real_sub_le()]))
  interval_0_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Real, ∀ f : Real, ∀ ex : Real, interval(a, f, ex) == (real_of_num(0) <= ex - abs(a - f))"), t842))
}

///|
let interval_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_0")

///|
/// `INTERVAL_0`
pub fn interval_0() -> @kernel.Thm {
  interval_0_c.get()
}

///|
/// ABS_NUM
fn step_120() -> Unit raise {
  let t877 = @simp.asm_rewrite_tac(@list.List([@arith.sub_eq_0()]))
  let t878 = @simp.rewrite_tac(@list.List([@arith.eq_add_lcancel_0()]))
  let t879 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, (x == y) == (y == x)"))]))
  let t880 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq()]))
  let t881 = @simp.asm_simp_tac(@list.List([@real.real_of_num_sub()]))
  let t882 = @simp.asm_rewrite_tac(@list.List([]))
  let t883 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, -(x - y) == y - x"))]))
  let t884 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@calc_int.real_abs_neg())]))
  let t874 = @equal.gsym(@analysis.abs_refl())
  let t885 = @tactics_ext.h_rewrite_rule(@list.List([(x875 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t874, x875)]), (x876 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("2", x876))
  let t871 = @equal.gsym(@analysis.real_sub_le())
  let t886 = @tactics_ext.h_once_rewrite_rule(@list.List([(x872 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t871, x872)]), (x873 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("1", x873))
  let t868 = @equal.gsym(@realax.real_of_num_le())
  let t887 = @tactics.every(@list.List([@tactics_refine.label_all_tac, @tactics_ext.h_rewrite_rule(@list.List([(x869 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t868, x869)]), (x870 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("0", x870)), @tactics_refine.label_all_tac, t886, @tactics_refine.label_all_tac, t885, t884, t883, t882, t881, t880, t879, t878, t877]))
  let t858 = @simp.asm_rewrite_tac(@list.List([@arith.sub_eq_0()]))
  let t859 = @simp.rewrite_tac(@list.List([@arith.eq_add_rcancel_0()]))
  let t860 = @simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, (x == y) == (y == x)"))]))
  let t861 = @simp.rewrite_tac(@list.List([@realax.real_of_num_eq()]))
  let t862 = @simp.asm_simp_tac(@list.List([@real.real_of_num_sub()]))
  let t863 = @tactics_ext.h_match_mp((x856 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@arith.lt_imp_le(), x856))((x857 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("0", x857))
  let t864 = @simp.asm_rewrite_tac(@list.List([]))
  let t853 = @equal.gsym(@analysis.abs_refl())
  let t865 = @tactics_ext.h_rewrite_rule(@list.List([(x854 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t853, x854)]), (x855 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("3", x855))
  let t866 = @tactics_ext.h_match_mp((x851 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@analysis.real_lt_imp_le(), x851))((x852 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("2", x852))
  let t848 = @equal.gsym(@analysis.real_sub_lt())
  let t867 = @tactics_ext.h_once_rewrite_rule(@list.List([(x849 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t848, x849)]), (x850 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("1", x850))
  let t845 = @equal.gsym(@real.real_of_num_lt())
  let t888 = @list.List([@tactics.every(@list.List([@tactics_refine.label_all_tac, @tactics_ext.h_rewrite_rule(@list.List([(x846 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(t845, x846)]), (x847 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("0", x847)), @tactics_refine.label_all_tac, t867, @tactics_refine.label_all_tac, t866, @tactics_refine.label_all_tac, t865, t864, t863, t862, t861, t860, t859, t858])), t887])
  let t843 = @term_syntax.parse_term("(n : Num)")
  let t844 = @tactics.disj_cases_tac(@bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t843]), @arith.lte_cases()))
  let t889 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t844), t888)
  abs_num_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, abs(real_of_num(n) - real_of_num(m)) == real_of_num(m - n + (n - m))"), t889))
}

///|
let abs_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABS_NUM")

///|
/// `ABS_NUM`
pub fn abs_num() -> @kernel.Thm {
  abs_num_c.get()
}

///|
/// INTERVAL_TO_LESS
fn step_121() -> Unit raise {
  let lemma1 = @calc_rat.real_arith(@term_syntax.parse_term("∀ ex : Real, ∀ ey : Real, ∀ f : Real, ∀ g : Real, real_of_num(0) < g - (ey + (ex + f)) → f + ex < g - ey"))
  let t908 = @simp.asm_rewrite_tac(@list.List([]))
  let t907 = @tactics_ext.h_rule2(fn(x903 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x904 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x903, x904)
    }
  }, (x905 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("6", x905), (x906 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("3", x906))
  let t909 = @tactics_ext.h_match_mp((x902 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@analysis.real_lte_trans(), x902))(t907)
  let t901 = @tactics_ext.h_rule2(fn(x897 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x898 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.conj(x897, x898)
    }
  }, (x899 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("4", x899), (x900 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("5", x900))
  let t910 = @tactics_ext.h_match_mp((x896 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(@realarith.real_let_trans(), x896))(t901)
  let t911 = @tactics_ext.h_match_mp((x894 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(interval_min(), x894))((x895 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("1", x895))
  let t912 = @tactics_ext.h_match_mp((x892 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(interval_max(), x892))((x893 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("0", x893))
  let t913 = @tactics_ext.h_match_mp((x890 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.thm(lemma1, x890))((x891 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @tactics_ext.hyp("2", x891))
  let t914 = @tactics.every(@list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics_ext.disch_all_tac, t913, t912, t911, @tactics_refine.label_all_tac, t910, @tactics_refine.label_all_tac, t909, t908]))
  interval_to_less_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Real, ∀ f : Real, ∀ ex : Real, ∀ b : Real, ∀ g : Real, ∀ ey : Real, interval(a, f, ex) && interval(b, g, ey) && real_of_num(0) < g - (ey + (ex + f)) → a < b"), t914))
}

///|
let interval_to_less_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_TO_LESS")

///|
/// `INTERVAL_TO_LESS`
pub fn interval_to_less() -> @kernel.Thm {
  interval_to_less_c.get()
}

///|
/// ABS_TO_INTERVAL
fn step_122() -> Unit raise {
  let t920 = @meson.asm_meson_tac(@list.List([@analysis.real_le_trans()]))
  let t921 = @simp.asm_rewrite_tac(@list.List([]))
  let t922 = @tactics.exists_tac(@term_syntax.parse_term("abs((u : Real) - (f : Real))"))
  let t923 = @tactics.exists_tac(@term_syntax.parse_term("abs((c : Real) - (u : Real))"))
  let t924 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(∃ a : Real, ∃ b : Real, (x : Real) <= a + b && a <= (u : Real) && b <= (v : Real)) → x <= u + v")))
  let t919 = @calc_rat.real_arith(@term_syntax.parse_term("abs((k : Real) - (g : Real)) <= (ey : Real) → k <= g + ey"))
  let t925 = @tactics.imp_res_then(fn(x916 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s917 = @tactics.assume_tac(x916)
    fn(x918 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s917(x918)
    }
  })(t919)
  let t915 = @term_syntax.parse_term("(u : Real) - (f : Real)")
  let t926 = @tactics.assume_tac(@bool.specl(@list.List([@term_syntax.parse_term("(c : Real) - (u : Real)"), t915]), @analysis.abs_triangle()))
  let t927 = @simp.once_rewrite_tac(@list.List([@realax.real_add_assoc()]))
  let t928 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(c : Real) - (f : Real) == c - (u : Real) + (u - f)"))]))
  let t929 = @tactics.repeat_tac(@tactics.gen_tac)
  let t930 = @tactics.every(@list.List([@simp.rewrite_tac(@list.List([interval()])), @tactics_ext.disch_all_tac, t929, @tactics_ext.disch_all_tac, t928, t927, t926, t925, t924, t923, t922, t921, t920]))
  abs_to_interval_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ c : Real, ∀ u : Real, ∀ k : Real, abs(c - u) <= k → (∀ f : Real, ∀ g : Real, ∀ ex : Real, ∀ ey : Real, interval(u, f, ex) && interval(k, g, ey) → interval(c, f, g + (ey + ex)))"), t930))
}

///|
let abs_to_interval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABS_TO_INTERVAL")

///|
/// `ABS_TO_INTERVAL`
pub fn abs_to_interval() -> @kernel.Thm {
  abs_to_interval_c.get()
}

///|
/// calculated_constants
fn step_123() -> Unit raise {
  calculated_constants_c.set(Ref::{ val: @list.List([]) })
}

///|
let calculated_constants_c : @lib.Cell[Ref[@list.List[(@kernel.Term, @kernel.Thm)]]] = @lib.Cell::new("calculated_constants")

///|
/// `calculated_constants`
pub fn calculated_constants() -> Ref[@list.List[(@kernel.Term, @kernel.Thm)]] {
  calculated_constants_c.get()
}

///|
/// `add_real_constant`
pub fn add_real_constant(x931 : @kernel.Thm) -> Unit raise {
  let ineq = x931
  try {
    let t932 = @kernel.concl(ineq)
    let (abst, k) = @basics.dest_binop(@term_syntax.parse_term("real_le"), t932)
    let (absh, cmu) = @kernel.dest_comb(abst)
    let (c, u) = @basics.dest_binop(@term_syntax.parse_term("real_sub"), cmu)
    {
      calculated_constants().val = (calculated_constants().val).prepend((c, ineq))
      ()
    }
  } catch {
    _ => {
      try {
        let (c_1, f, ex) = dest_interval(@kernel.concl(ineq))
        {
          calculated_constants().val = (calculated_constants().val).prepend((c_1, ineq))
          ()
        }
      } catch {
        _ => raise Failure("calculated_constants format : abs(c - u) <= k")
      }
    }
  }
}

///|
/// `get_real_constant`
pub fn get_real_constant(x933 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x933
  @lib.assoc(tm, calculated_constants().val)
}

///|
/// `remove_real_constant`
pub fn remove_real_constant(x934 : @kernel.Term) -> Unit raise {
  let tm = x934
  {
    calculated_constants().val = @lib.filter(fn(x935 : (@kernel.Term, @kernel.Thm)) -> Bool raise {
      let t = x935
      !((t.0 == tm))
    }, calculated_constants().val)
    ()
  }
}

///|
/// `INTERVAL_OF_NUM`
pub fn interval_of_num(x936 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x936
  let tm1 = @kernel.dest_comb(tm).1
  let th1 = @num_calc_simp.arith_rewrite_conv(@list.List([]))(tm1)
  let t938 = @bool.spec(@equal.rhs(@kernel.concl(th1)), interval_num())
  let t937 = @equal.gsym(th1)
  @simp.once_rewrite_rule(@list.List([@equal.ap_term(@term_syntax.parse_term("real_of_num"), t937)]))(t938)
}

///|
/// Jordan/float.ml:1405
fn step_124() -> Unit raise {
  let t939 = (@list.List([]), @term_syntax.parse_term("interval(real_of_num(3), float(int_of_num(3), int_of_num(0)), float(int_of_num(0), int_of_num(0)))"))
  add_test(("INTERVAL_OF_NUM", (@kernel.dest_thm(interval_of_num(@term_syntax.parse_term("real_of_num(3)"))) == t939)))
}

///|
/// `INTERVAL_OF_NEG`
pub fn interval_of_neg(x940 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x940
  let (sign, u) = @kernel.dest_comb(tm)
  let _ = if (sign == @term_syntax.parse_term("real_neg")) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1413:12")
  }
  let (amp, tm1) = @kernel.dest_comb(u)
  let _ = if (amp == @term_syntax.parse_term("real_of_num")) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1415:12")
  }
  let th1 = @num_calc_simp.arith_rewrite_conv(@list.List([]))(tm1)
  let t942 = @bool.spec(@equal.rhs(@kernel.concl(th1)), interval_num())
  let t941 = @equal.gsym(th1)
  let t943 = @simp.once_rewrite_rule(@list.List([@equal.ap_term(@term_syntax.parse_term("real_of_num"), t941)]))(t942)
  let t944 = @simp.once_rewrite_rule(@list.List([interval_neg()]))(t943)
  @simp.once_rewrite_rule(@list.List([float_neg()]))(t944)
}

///|
/// Jordan/float.ml:1422
fn step_125() -> Unit raise {
  let t945 = (@list.List([]), @term_syntax.parse_term("interval(-real_of_num(3 + 4), float(-int_of_num(7), int_of_num(0)), float(int_of_num(0), int_of_num(0)))"))
  add_test(("INTERVAL_OF_NEG", (@kernel.dest_thm(interval_of_neg(@term_syntax.parse_term("-real_of_num(3 + 4)"))) == t945)))
}

///|
/// `INTERVAL_TO_LESS_CONV`
pub fn interval_to_less_conv(x946 : @kernel.Thm, x947 : @kernel.Thm) -> @kernel.Thm raise {
  let thm1 = x946
  let thm2 = x947
  let (a, f, ex) = dest_interval(@kernel.concl(thm1))
  let (b, g, ey) = dest_interval(@kernel.concl(thm2))
  let rthm = @kernel.assume_rule(@term_syntax.parse_term("∀ f : Real, ∀ g : Real, ∀ ex : Real, ∀ ey : Real, real_of_num(0) < g - (ey + (ex + f))"))
  let rspec = @kernel.concl(@bool.specl(@list.List([f, g, ex, ey]), rthm))
  let rspec_simp = float_conv(@basics.dest_binop(@term_syntax.parse_term("real_lt"), rspec).1)
  let rthm2 = @tactics_refine.prove(rspec, @tactics.then_tac(@simp.rewrite_tac(@list.List([rspec_simp, float_pos(), int_pos_p(), int_pos_neg()])), @int.arith_tac))
  let fthm = @bool.conj(thm1, @bool.conj(thm2, rthm2))
  @drule.match_mp(interval_to_less())(fthm)
}

///|
/// Jordan/float.ml:1440
fn step_126() -> Unit raise {
  let thm1 = @kernel.assume_rule(@term_syntax.parse_term("interval(DECIMAL(1, 10), float(int_of_num(1), -int_of_num(1)), float(int_of_num(1), -int_of_num(2)))"))
  let thm2 = @kernel.assume_rule(@term_syntax.parse_term("interval(DECIMAL(7, 1), float(int_of_num(4), int_of_num(1)), float(int_of_num(1), int_of_num(0)))"))
  let thm3 = interval_to_less_conv(thm1, thm2)
  let t948 = @term_syntax.parse_term("DECIMAL(1, 10) < DECIMAL(7, 1)")
  add_test(("INTERVAL_TO_LESS_CONV", (@kernel.concl(thm3) == t948)))
}

///|
/// Jordan/float.ml:1447
fn step_127() -> Unit raise {
  let t949 = interval_of_num(@term_syntax.parse_term("real_of_num(8)"))
  let (h, c) = @kernel.dest_thm(interval_to_less_conv(interval_of_num(@term_syntax.parse_term("real_of_num(3)")), t949))
  add_test(("INTERVAL_TO_LESS_CONV2", (@list.List::is_empty(h) && (c == @term_syntax.parse_term("real_of_num(3) < real_of_num(8)")))))
}

///|
/// lemma1
fn step_128() -> Unit raise {
  let t950 = @meson.meson_tac(@list.List([@real.real_div_1()]))
  lemma1_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, ∀ p : Num, (real_of_num(p) / real_of_num(m) <= real_of_num(n)) == (real_of_num(p) / real_of_num(m) <= real_of_num(n) / real_of_num(1))"), t950))
}

///|
let lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lemma1")

///|
/// `lemma1`
pub fn lemma1() -> @kernel.Thm {
  lemma1_c.get()
}

///|
/// lemma2
fn step_129() -> Unit raise {
  let t951 = @meson.meson_tac(@list.List([@real.real_div_1()]))
  lemma2_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Num, ∀ m : Num, ∀ p : Num, (real_of_num(p) <= real_of_num(n) / real_of_num(m)) == (real_of_num(p) / real_of_num(1) <= real_of_num(n) / real_of_num(m))"), t951))
}

///|
let lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lemma2")

///|
/// `lemma2`
pub fn lemma2() -> @kernel.Thm {
  lemma2_c.get()
}

///|
/// lemma3
fn step_130() -> Unit raise {
  let t952 = @simp.asm_simp_tac(@list.List([@calc_rat.rat_lemma4(), @analysis.real_lt(), @realax.real_of_num_mul(), @analysis.real_le_v1()]))
  let t953 = @tactics.every(@list.List([@tactics.repeat_tac(@tactics.gen_tac), @tactics_ext.disch_all_tac, t952]))
  lemma3_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, ∀ d : Num, 0 < b && 0 < d && a * d <= c * b → real_of_num(a) / real_of_num(b) <= real_of_num(c) / real_of_num(d)"), t953))
}

///|
let lemma3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lemma3")

///|
/// `lemma3`
pub fn lemma3() -> @kernel.Thm {
  lemma3_c.get()
}

///|
/// DEC_FLOAT
fn step_131() -> Unit raise {
  let t954 = @num_calc_simp.arith_simp_conv(@list.List([@calc_rat.decimal(), float(), twopow_pos(), twopow_neg(), @equal.gsym(@realax.real_div()), @calc_int.real_of_num_pow(), @num_ext_nabs.int_num_real(), @realax.real_of_num_mul(), lemma1(), lemma2(), lemma3()]))
  dec_float_c.set(fn(x955 : @kernel.Term) -> @kernel.Thm raise {
    @bool.eqt_elim(t954(x955))
  })
}

///|
let dec_float_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("DEC_FLOAT")

///|
/// `DEC_FLOAT`
pub fn dec_float(x : @kernel.Term) -> @kernel.Thm raise {
  (dec_float_c.get())(x)
}

///|
/// Jordan/float.ml:1476
fn step_132() -> Unit raise {
  let f : ((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> Bool raise) raise = fn(x956 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> Bool raise) raise {
    let c = x956
    fn(x957 : @kernel.Term) -> Bool raise {
      let x = x957
      (@kernel.dest_thm(c(x)) == (@list.List([]), x))
    }
  }
  let t958 = @term_syntax.parse_term("DECIMAL(100, 10) <= float(int_of_num(3), int_of_num(2))")
  add_test(("DEC_FLOAT", if f(dec_float)(t958) {
    let t959 = @term_syntax.parse_term("DECIMAL(10, 1) <= float(int_of_num(3), int_of_num(2))")
    if f(dec_float)(t959) {
      let t960 = @term_syntax.parse_term("DECIMAL(1, 10) <= float(int_of_num(1), -int_of_num(2))")
      if f(dec_float)(t960) {
        let t961 = @term_syntax.parse_term("float(int_of_num(3), int_of_num(2)) <= DECIMAL(130, 10)")
        if f(dec_float)(t961) {
          let t962 = @term_syntax.parse_term("float(int_of_num(3), int_of_num(2)) <= DECIMAL(13, 1)")
          if f(dec_float)(t962) {
            let t963 = @term_syntax.parse_term("float(int_of_num(1), -int_of_num(2)) <= DECIMAL(3, 10)")
            f(dec_float)(t963)
          } else {
            false
          }
        } else {
          false
        }
      } else {
        false
      }
    } else {
      false
    }
  } else {
    false
  }))
}

///|
/// `FLOAT_INEQ_CONV`
pub fn float_ineq_conv(x964 : @kernel.Term) -> @kernel.Thm raise {
  let t = x964
  let t965 = @equal.gsym(@analysis.real_sub_le())
  let thm1 = @simp.once_rewrite_conv(@list.List([@equal.gsym(@analysis.real_sub_lt()), t965]))(t)
  let rhsx = @equal.rhs(@kernel.concl(thm1))
  let t966 = @simp.rewrite_tac(@list.List([float_nn(), float_pos(), int_nn(), int_nn_neg(), int_pos_p(), int_pos_neg()]))
  let thm2 = @tactics_refine.prove(rhsx, @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([float_conv(@kernel.dest_comb(rhsx).1)])), t966), @int.arith_tac))
  @simp.rewrite_rule(@list.List([@equal.gsym(thm1)]))(thm2)
}

///|
/// t1
fn step_133() -> Unit raise {
  t1_c.set(@term_syntax.parse_term("float(int_of_num(3), int_of_num(0)) + float(int_of_num(4), int_of_num(0)) < float(int_of_num(8), int_of_num(1))"))
}

///|
let t1_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("t1")

///|
/// `t1`
pub fn t1() -> @kernel.Term {
  t1_c.get()
}

///|
/// Jordan/float.ml:1499
fn step_134() -> Unit raise {
  let f : ((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> Bool raise) raise = fn(x967 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> Bool raise) raise {
    let c = x967
    fn(x968 : @kernel.Term) -> Bool raise {
      let x = x968
      (@kernel.dest_thm(c(x)) == (@list.List([]), x))
    }
  }
  let t1_1 = @term_syntax.parse_term("float(int_of_num(3), int_of_num(0)) + float(int_of_num(4), int_of_num(0)) < float(int_of_num(8), int_of_num(1))")
  add_test(("FLOAT_INEQ_CONV", f(float_ineq_conv)(t1_1)))
}

///|
/// INTERVAL_MINMAX
fn step_135() -> Unit raise {
  let t969 = @simp.rewrite_tac(@list.List([interval(), @analysis.abs_bounds()]))
  let t970 = @tactics.every(@list.List([@tactics.repeat_tac(@tactics.gen_tac), t969, @calc_rat.real_arith_tac]))
  interval_minmax_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ x : Real, ∀ f : Real, ∀ ex : Real, f - ex <= x && x <= f + ex → interval(x, f, ex)"), t970))
}

///|
let interval_minmax_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_MINMAX")

///|
/// `INTERVAL_MINMAX`
pub fn interval_minmax() -> @kernel.Thm {
  interval_minmax_c.get()
}

///|
/// `INTERVAL_OF_DECIMAL`
pub fn interval_of_decimal(x971 : Int64, x972 : @kernel.Term) -> @kernel.Thm raise {
  let bprec = x971
  let dec = x972
  let a_num = dest_decimal(dec)
  let f_num = round_rat(bprec, a_num)
  let ex_num = round_rat(bprec, @num.abs_num(@num.sub_num(f_num, a_num)))
  let _ = if @num.le_num(ex_num, f_num) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1524:10")
  }
  let f = mk_float(f_num)
  let ex = mk_float(ex_num)
  let fplus_ex = float_conv(@basics.mk_binop(@term_syntax.parse_term("real_add"), f, ex))
  let fminus_ex = float_conv(@basics.mk_binop(@term_syntax.parse_term("real_sub"), f, ex))
  let fplus_term = @equal.rhs(@kernel.concl(fplus_ex))
  let fminus_term = @equal.rhs(@kernel.concl(fminus_ex))
  let th1 = dec_float(@basics.mk_binop(@term_syntax.parse_term("real_le"), fminus_term, dec))
  let th2 = dec_float(@basics.mk_binop(@term_syntax.parse_term("real_le"), dec, fplus_term))
  let intv = mk_interval(dec, f, ex)
  @bool.eqt_elim(@simp.simp_conv(@list.List([interval_minmax(), fplus_ex, fminus_ex, th1, th2]))(intv))
}

///|
/// Jordan/float.ml:1536
fn step_136() -> Unit raise {
  let (h, c) = @kernel.dest_thm(interval_of_decimal(4L, @term_syntax.parse_term("DECIMAL(361, 10)")))
  let (x, f, ex) = dest_interval(c)
  add_test(("INTERVAL_OF_DECIMAL", (@list.List::is_empty(h) && (x == @term_syntax.parse_term("DECIMAL(361, 10)")))))
}

///|
/// Jordan/float.ml:1541
fn step_137() -> Unit raise {
  add_test(("INTERVAL_OF_DECIMAL2", @lib.can(fn(x973 : Unit) -> @kernel.Thm raise {
    let _ = x973
    let t974 = interval_of_decimal(4L, @term_syntax.parse_term("DECIMAL(361, 10)"))
    interval_to_less_conv(interval_of_decimal(4L, @term_syntax.parse_term("DECIMAL(3333, 100)")), t974)
  }, ())))
}

///|
/// `falsify_ex`
pub fn[TA] falsify_ex(x975 : (TA) -> Bool raise, x976 : TA) -> Bool raise {
  let f = x975
  let x = x976
  try {
    f(x)
  } catch {
    _ => false
  }
}

///|
/// is_bits_format
fn step_138() -> Unit raise {
  fn format(x977 : @kernel.Term) -> Bool raise {
    let x = x977
    if (x == @term_syntax.parse_term("_0")) {
      true
    } else {
      let (h, t) = @kernel.dest_comb(x)
      (((h == @term_syntax.parse_term("BIT1")) || (h == @term_syntax.parse_term("BIT0"))) && format(t))
    }
  }
  is_bits_format_c.set((x978 : @kernel.Term) => falsify_ex(format, x978))
}

///|
let is_bits_format_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_bits_format")

///|
/// `is_bits_format`
pub fn is_bits_format(x : @kernel.Term) -> Bool raise {
  (is_bits_format_c.get())(x)
}

///|
/// is_numeral_format
fn step_139() -> Unit raise {
  let fn_ : (@kernel.Term) -> Bool raise = fn(x979 : @kernel.Term) -> Bool raise {
    let x = x979
    let (h, t) = @kernel.dest_comb(x)
    ((h == @term_syntax.parse_term("NUMERAL")) && is_bits_format(t))
  }
  is_numeral_format_c.set((x980 : @kernel.Term) => falsify_ex(fn_, x980))
}

///|
let is_numeral_format_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_numeral_format")

///|
/// `is_numeral_format`
pub fn is_numeral_format(x : @kernel.Term) -> Bool raise {
  (is_numeral_format_c.get())(x)
}

///|
/// is_decimal_format
fn step_140() -> Unit raise {
  let fn_ : (@kernel.Term) -> Bool raise = fn(x981 : @kernel.Term) -> Bool raise {
    let x = x981
    let (t1_1, t2) = @basics.dest_binop(@term_syntax.parse_term("DECIMAL"), x)
    (is_numeral_format(t1_1) && is_numeral_format(t2))
  }
  is_decimal_format_c.set((x982 : @kernel.Term) => falsify_ex(fn_, x982))
}

///|
let is_decimal_format_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_decimal_format")

///|
/// `is_decimal_format`
pub fn is_decimal_format(x : @kernel.Term) -> Bool raise {
  (is_decimal_format_c.get())(x)
}

///|
/// is_pos_int_format
fn step_141() -> Unit raise {
  let fn_ : (@kernel.Term) -> Bool raise = fn(x983 : @kernel.Term) -> Bool raise {
    let x = x983
    let (h, t) = @kernel.dest_comb(x)
    ((h == @term_syntax.parse_term("int_of_num")) && is_numeral_format(t))
  }
  is_pos_int_format_c.set((x984 : @kernel.Term) => falsify_ex(fn_, x984))
}

///|
let is_pos_int_format_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_pos_int_format")

///|
/// `is_pos_int_format`
pub fn is_pos_int_format(x : @kernel.Term) -> Bool raise {
  (is_pos_int_format_c.get())(x)
}

///|
/// is_neg_int_format
fn step_142() -> Unit raise {
  let fn_ : (@kernel.Term) -> Bool raise = fn(x985 : @kernel.Term) -> Bool raise {
    let x = x985
    let (h, t) = @kernel.dest_comb(x)
    ((h == @term_syntax.parse_term("(op_minus_minus : (Int) -> Int)")) && is_pos_int_format(t))
  }
  is_neg_int_format_c.set((x986 : @kernel.Term) => falsify_ex(fn_, x986))
}

///|
let is_neg_int_format_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_neg_int_format")

///|
/// `is_neg_int_format`
pub fn is_neg_int_format(x : @kernel.Term) -> Bool raise {
  (is_neg_int_format_c.get())(x)
}

///|
/// `is_int_format`
pub fn is_int_format(x987 : @kernel.Term) -> Bool raise {
  let x = x987
  (is_neg_int_format(x) || is_pos_int_format(x))
}

///|
/// is_float_format
fn step_143() -> Unit raise {
  let fn_ : (@kernel.Term) -> Bool raise = fn(x988 : @kernel.Term) -> Bool raise {
    let x = x988
    let (t1_1, t2) = @basics.dest_binop(@term_syntax.parse_term("float"), x)
    (is_int_format(t1_1) && is_int_format(t2))
  }
  is_float_format_c.set((x989 : @kernel.Term) => falsify_ex(fn_, x989))
}

///|
let is_float_format_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_float_format")

///|
/// `is_float_format`
pub fn is_float_format(x : @kernel.Term) -> Bool raise {
  (is_float_format_c.get())(x)
}

///|
/// is_interval_format
fn step_144() -> Unit raise {
  let fn_ : (@kernel.Term) -> Bool raise = fn(x990 : @kernel.Term) -> Bool raise {
    let x = x990
    let (a, b, c) = dest_interval(x)
    (is_float_format(b) && is_float_format(c))
  }
  is_interval_format_c.set((x991 : @kernel.Term) => falsify_ex(fn_, x991))
}

///|
let is_interval_format_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_interval_format")

///|
/// `is_interval_format`
pub fn is_interval_format(x : @kernel.Term) -> Bool raise {
  (is_interval_format_c.get())(x)
}

///|
/// is_neg_real
fn step_145() -> Unit raise {
  let fn_ : (@kernel.Term) -> Bool raise = fn(x992 : @kernel.Term) -> Bool raise {
    let x = x992
    let (h, t) = @kernel.dest_comb(x)
    (h == @term_syntax.parse_term("real_neg"))
  }
  is_neg_real_c.set((x993 : @kernel.Term) => falsify_ex(fn_, x993))
}

///|
let is_neg_real_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_neg_real")

///|
/// `is_neg_real`
pub fn is_neg_real(x : @kernel.Term) -> Bool raise {
  (is_neg_real_c.get())(x)
}

///|
/// is_real_num_format
fn step_146() -> Unit raise {
  let fn_ : (@kernel.Term) -> Bool raise = fn(x994 : @kernel.Term) -> Bool raise {
    let x = x994
    let (h, t) = @kernel.dest_comb(x)
    ((h == @term_syntax.parse_term("real_of_num")) && is_numeral_format(t))
  }
  is_real_num_format_c.set((x995 : @kernel.Term) => falsify_ex(fn_, x995))
}

///|
let is_real_num_format_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_real_num_format")

///|
/// `is_real_num_format`
pub fn is_real_num_format(x : @kernel.Term) -> Bool raise {
  (is_real_num_format_c.get())(x)
}

///|
/// `is_comb_of`
pub fn is_comb_of(x996 : @kernel.Term, x997 : @kernel.Term) -> Bool raise {
  let t = x996
  let u = x997
  let fn_ : (@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise = fn(x998 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    let t_1 = x998
    fn(x999 : @kernel.Term) -> Bool raise {
      let u_1 = x999
      (t_1 == @kernel.dest_comb(u_1).0)
    }
  }
  try {
    fn_(t)(u)
  } catch {
    failure => false
  }
}

///|
/// `heron_sqrt`
pub fn heron_sqrt(x1000 : Int64, x1001 : @num.Num, x1002 : @num.Num, x1003 : @num.Num) -> @num.Num raise {
  let depth = x1000
  let a = x1001
  let x = x1002
  let eps = x1003
  let t1004 = @num.num_of_int64(2L)
  let half = @num.div_num(@num.num_of_int64(1L), t1004)
  if (depth <= 0L) {
    raise Failure("sqrt recursion depth exceeded")
  } else {
    if (@num.lt_num(@num.abs_num(@num.sub_num(x, @num.div_num(a, x))), eps) && @num.ge_num(@num.mult_num(x, x), a)) {
      @num.div_num(a, x)
    } else {
      let x_p = @num.mult_num(half, @num.add_num(x, @num.div_num(a, x)))
      heron_sqrt(@lib.sub63(depth, 1L), a, x_p, eps)
    }
  }
}

///|
/// INTERVAL_OF_TWOPOW
fn step_147() -> Unit raise {
  let t1005 = @tactics.then_tac(@simp.rewrite_tac(@list.List([interval(), float(), @int.int_of_num_th()])), @calc_rat.real_arith_tac)
  interval_of_twopow_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ n : Int, interval(twopow(n), float(int_of_num(1), n), float(int_of_num(0), int_of_num(0)))"), t1005))
}

///|
let interval_of_twopow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INTERVAL_OF_TWOPOW")

///|
/// `INTERVAL_OF_TWOPOW`
pub fn interval_of_twopow() -> @kernel.Thm {
  interval_of_twopow_c.get()
}

///|
/// `INTERVAL_OF_TERM`
pub fn interval_of_term(x1006 : Int64, x1007 : @kernel.Term) -> @kernel.Thm raise {
  let bprec = x1006
  let tm = x1007
  if @lib.can(get_real_constant, tm) {
    try {
      let int_thm = get_real_constant(tm)
      if @lib.can(dest_interval, @kernel.concl(int_thm)) {
        int_thm
      } else {
        let absthm = get_real_constant(tm)
        let t1008 = @kernel.concl(absthm)
        let (abst, k) = @basics.dest_binop(@term_syntax.parse_term("real_le"), t1008)
        let (absh, cmu) = @kernel.dest_comb(abst)
        let (c, u) = @basics.dest_binop(@term_syntax.parse_term("real_sub"), cmu)
        let intk = interval_of_term(bprec, k)
        let intu = interval_of_term(bprec, u)
        let thm1 = @drule.match_mp(abs_to_interval())(absthm)
        let t1009 = @bool.conj(intu, intk)
        let thm2 = @drule.match_mp(thm1)(t1009)
        let (_, f, ex) = dest_interval(@kernel.concl(thm2))
        let fthm = float_conv(f)
        let exthm = float_conv(ex)
        let thm3 = @simp.rewrite_rule(@list.List([fthm, exthm]))(thm2)
        add_real_constant(thm3)
        thm3
      }
    } catch {
      _ => raise Failure("INTERVAL_OF_TERM : CONSTANT")
    }
  } else {
    if is_real_num_format(tm) {
      interval_of_num(tm)
    } else {
      if is_decimal_format(tm) {
        interval_of_decimal(bprec, tm)
      } else {
        if is_neg_real(tm) {
          try {
            let (_, t) = @kernel.dest_comb(tm)
            let int1 = interval_of_term(bprec, t)
            let (_, b, _) = dest_interval(@kernel.concl(int1))
            let thm1_1 = float_conv(@kernel.mk_comb(@term_syntax.parse_term("(op_minus_minus : (Real) -> Real)"), b))
            let t1010 = @simp.once_rewrite_rule(@list.List([interval_neg()]))(int1)
            @simp.rewrite_rule(@list.List([thm1_1]))(t1010)
          } catch {
            _ => raise Failure("INTERVAL_OF_TERM : NEG")
          }
        } else {
          if is_comb_of(@term_syntax.parse_term("real_abs"), tm) {
            try {
              let (_, b_1) = @kernel.dest_comb(tm)
              let t1011 = interval_of_term(bprec, b_1)
              let b_int = @drule.match_mp(interval_absv())(t1011)
              let (_, f_1, _) = dest_interval(@kernel.concl(b_int))
              let thm1_2 = float_conv(f_1)
              @simp.rewrite_rule(@list.List([thm1_2]))(b_int)
            } catch {
              _ => raise Failure("INTERVAL_OF_TERM : ABS")
            }
          } else {
            if is_comb_of(@term_syntax.parse_term("twopow"), tm) {
              try {
                let (_, b_2) = @kernel.dest_comb(tm)
                @bool.spec(b_2, interval_of_twopow())
              } catch {
                _ => raise Failure("INTERVAL_OF_TERM : TWOPOW")
              }
            } else {
              let t1012 = @term_syntax.parse_term("real_add")
              if @lib.can((x1013 : @kernel.Term) => @basics.dest_binop(t1012, x1013), tm) {
                try {
                  let (a, b_3) = @basics.dest_binop(@term_syntax.parse_term("real_add"), tm)
                  let a_int = interval_of_term(bprec, a)
                  let b_int_1 = interval_of_term(bprec, b_3)
                  let t1014 = @bool.conj(a_int, b_int_1)
                  let c_int = @drule.match_mp(interval_add())(t1014)
                  let (_, f_2, ex_1) = dest_interval(@kernel.concl(c_int))
                  let thm1_3 = float_conv(f_2)
                  let thm2_1 = float_conv(ex_1)
                  @simp.rewrite_rule(@list.List([thm1_3, thm2_1]))(c_int)
                } catch {
                  _ => raise Failure("INTERVAL_OF_TERM : ADD")
                }
              } else {
                let t1015 = @term_syntax.parse_term("real_sub")
                if @lib.can((x1016 : @kernel.Term) => @basics.dest_binop(t1015, x1016), tm) {
                  try {
                    let (a_1, b_4) = @basics.dest_binop(@term_syntax.parse_term("real_sub"), tm)
                    let a_int_1 = interval_of_term(bprec, a_1)
                    let b_int_2 = interval_of_term(bprec, b_4)
                    let t1017 = @bool.conj(a_int_1, b_int_2)
                    let c_int_1 = @drule.match_mp(interval_sub())(t1017)
                    let (_, f_3, ex_2) = dest_interval(@kernel.concl(c_int_1))
                    let thm1_4 = float_conv(f_3)
                    let thm2_2 = float_conv(ex_2)
                    @simp.rewrite_rule(@list.List([thm1_4, thm2_2]))(c_int_1)
                  } catch {
                    _ => raise Failure("INTERVAL_OF_TERM : SUB")
                  }
                } else {
                  let t1018 = @term_syntax.parse_term("real_mul")
                  if @lib.can((x1019 : @kernel.Term) => @basics.dest_binop(t1018, x1019), tm) {
                    try {
                      let (a_2, b_5) = @basics.dest_binop(@term_syntax.parse_term("real_mul"), tm)
                      let a_int_2 = interval_of_term(bprec, a_2)
                      let b_int_3 = interval_of_term(bprec, b_5)
                      let t1020 = @bool.conj(a_int_2, b_int_3)
                      let c_int_2 = @drule.match_mp(interval_mul())(t1020)
                      let (_, f_4, ex_3) = dest_interval(@kernel.concl(c_int_2))
                      let thm1_5 = float_conv(f_4)
                      let thm2_3 = float_conv(ex_3)
                      @simp.rewrite_rule(@list.List([thm1_5, thm2_3]))(c_int_2)
                    } catch {
                      _ => raise Failure("INTERVAL_OF_TERM : MUL")
                    }
                  } else {
                    let t1021 = @term_syntax.parse_term("op_slash")
                    if @lib.can((x1022 : @kernel.Term) => @basics.dest_binop(t1021, x1022), tm) {
                      try {
                        let (a_3, b_6) = @basics.dest_binop(@term_syntax.parse_term("op_slash"), tm)
                        let a_int_3 = interval_of_term(bprec, a_3)
                        let b_int_4 = interval_of_term(bprec, b_6)
                        let (_, f_5, ex_4) = dest_interval(@kernel.concl(a_int_3))
                        let (_, g, ey) = dest_interval(@kernel.concl(b_int_4))
                        let f_num = dest_float(f_5)
                        let ex_num = dest_float(ex_4)
                        let g_num = dest_float(g)
                        let ey_num = dest_float(ey)
                        let h_num = round_rat(bprec, @num.div_num(f_num, g_num))
                        let h = mk_float(h_num)
                        let t1024 = @num.sub_num(@num.abs_num(g_num), ey_num)
                        let t1023 = @num.mult_num(@num.abs_num(h_num), ey_num)
                        let ez_rat = @num.div_num(@num.add_num(@num.add_num(ex_num, @num.abs_num(@num.sub_num(f_num, @num.mult_num(h_num, g_num)))), t1023), t1024)
                        let ez_num = round_rat(bprec, ez_rat)
                        let _ = if @num.ge_num(ez_num, @num.num_of_int64(0L)) {
                          ()
                        } else {
                          raise @lib.AssertFailure("tscript.ml:1753:12")
                        }
                        let ez = mk_float(ez_num)
                        let hyp1 = a_int_3
                        let hyp2 = b_int_4
                        let t1025 = @kernel.mk_comb(@term_syntax.parse_term("real_abs"), g)
                        let hyp3 = float_ineq_conv(@basics.mk_binop(@term_syntax.parse_term("real_lt"), ey, t1025))
                        let thm = @bool.specl(@list.List([a_3, f_5, ex_4, b_6, g, ey, h, ez]), interval_div())
                        let conj2 : (@kernel.Term) -> @kernel.Term raise = fn(x1026 : @kernel.Term) -> @kernel.Term raise {
                          let x = x1026
                          @basics.dest_conj(x).1
                        }
                        let hyp4t = conj2(conj2(conj2(@basics.dest_imp(@kernel.concl(thm)).0)))
                        let hyp4 = float_ineq_conv(hyp4t)
                        let hyp_all = @lib.end_itlist(@bool.conj, @list.List([hyp1, hyp2, hyp3, hyp4]))
                        @drule.match_mp(thm)(hyp_all)
                      } catch {
                        _ => raise Failure("INTERVAL_OF_TERM :DIV")
                      }
                    } else {
                      let t1027 = @term_syntax.parse_term("ssqrt")
                      if @lib.can((x1028 : @kernel.Term) => dest_unary(t1027, x1028), tm) {
                        try {
                          let x_1 = dest_unary(@term_syntax.parse_term("ssqrt"), tm)
                          let x_int = interval_of_term(bprec, x_1)
                          let (_, f_6, ex_5) = dest_interval(@kernel.concl(x_int))
                          let f_num_1 = dest_float(f_6)
                          let ex_num_1 = dest_float(ex_5)
                          let fd_num = @num.sub_num(f_num_1, ex_num_1)
                          let fe_f = @num.float_of_num(fd_num)
                          let apprx_sqrt = Double::sqrt(fe_f)
                          let v_num1 = round_inward_float(25L, apprx_sqrt)
                          let t1029 = @num.num_of_int64(@lib.sub63(@lib.neg63(bprec), 4L))
                          let v_num = round_inward_rat(bprec, heron_sqrt(10L, fd_num, v_num1, @num.power_num(@num.num_of_int64(2L), t1029)))
                          let u_num1 = round_inward_float(25L, Double::sqrt(@num.float_of_num(f_num_1)))
                          let t1030 = @num.num_of_int64(@lib.sub63(@lib.neg63(bprec), 4L))
                          let u_num = round_inward_rat(bprec, heron_sqrt(10L, f_num_1, u_num1, @num.power_num(@num.num_of_int64(2L), t1030)))
                          let ey_num_1 = round_rat(bprec, @num.abs_num(@num.sub_num(f_num_1, @num.mult_num(u_num, u_num))))
                          let t1031 = @num.add_num(u_num, v_num)
                          let ez_num_1 = round_rat(bprec, @num.div_num(@num.add_num(ex_num_1, ey_num_1), t1031))
                          let t1032 = mk_float(u_num)
                          let (v, u_1) = (mk_float(v_num), t1032)
                          let t1033 = mk_float(ez_num_1)
                          let (ey_1, ez_1) = (mk_float(ey_num_1), t1033)
                          let thm_1 = @bool.specl(@list.List([x_1, f_6, ex_5, u_1, ey_1, ez_1, v]), interval_ssqrt())
                          let conjhyp = @basics.dest_imp(@kernel.concl(thm_1)).0
                          fn break_conj(x1034 : @kernel.Term, x1035 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
                            let c_1 = x1034
                            let acc = x1035
                            if !@basics.is_conj(c_1) {
                              acc.prepend(c_1)
                            } else {
                              let (u_2, v_1) = @basics.dest_conj(c_1)
                              break_conj(v_1, acc.prepend(u_2))
                            }
                          }
                          match break_conj(conjhyp, @list.List([])) {
                            More(hyp6, tail=More(hyp5, tail=More(hyp4_1, tail=More(hyp3_1, tail=More(hyp2_1, tail=More(hyp1_1, tail=Empty)))))) => {
                              let t1036 = @tactics.conv_tac(float_ineq_conv)
                              let thm2_4 = @tactics_refine.prove(hyp2_1, @tactics.then_tac(@simp.rewrite_tac(@list.List([interval()])), t1036))
                              let thm3_1 = float_ineq_conv(hyp3_1)
                              let thm4 = float_ineq_conv(hyp4_1)
                              let float_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@simp.rewrite_tac(@list.List([float_nn(), float_pos(), int_nn(), int_nn_neg(), int_pos_p(), int_pos_neg()])), @int.arith_tac)
                              let thm5 = @tactics_refine.prove(hyp5, float_tac)
                              let thm6 = @tactics_refine.prove(hyp6, float_tac)
                              let ant = @lib.end_itlist(@bool.conj, @list.List([x_int, thm2_4, thm3_1, thm4, thm5, thm6]))
                              @drule.match_mp(thm_1)(ant)
                            }
                            _ => raise @lib.MatchFailure("tscript.ml:1792")
                          }
                        } catch {
                          _ => raise Failure("INTERVAL_OF_TERM : SSQRT")
                        }
                      } else {
                        raise Failure("INTERVAL_OF_TERM : case not installed")
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

///|
/// `real_ineq`
pub fn real_ineq(x1037 : Int64, x1038 : @kernel.Term) -> @kernel.Thm raise {
  let bprec = x1037
  let tm = x1038
  let (t1_1, t2) = @basics.dest_binop(@term_syntax.parse_term("(op_lt : (Real, Real) -> Bool)"), tm)
  let int1 = interval_of_term(bprec, t1_1)
  let int2 = interval_of_term(bprec, t2)
  interval_to_less_conv(int1, int2)
}

///|
/// Jordan/float.ml:1819
fn step_148() -> Unit raise {
  @parse_ext_override_interface.pop_priority(())
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
  step_118()
  step_119()
  step_120()
  step_121()
  step_122()
  step_123()
  step_124()
  step_125()
  step_126()
  step_127()
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
  step_136()
  step_137()
  step_138()
  step_139()
  step_140()
  step_141()
  step_142()
  step_143()
  step_144()
  step_145()
  step_146()
  step_147()
  step_148()
}
