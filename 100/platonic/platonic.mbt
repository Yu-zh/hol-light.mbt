// Translated from upstream 100/platonic.ml; edit this file directly.

///|
/// 100/platonic.ml:8
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// std_tetrahedron
fn step_2() -> Unit raise {
  std_tetrahedron_c.set(@pair.new_definition(@term_syntax.parse_term("(std_tetrahedron : (Cart[Real, 3]) -> Bool) == hull(convex, {vector([real_of_num(1), real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)])})")))
}

///|
let std_tetrahedron_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("std_tetrahedron")

///|
/// `std_tetrahedron`
pub fn std_tetrahedron() -> @kernel.Thm {
  std_tetrahedron_c.get()
}

///|
/// std_cube
fn step_3() -> Unit raise {
  std_cube_c.set(@pair.new_definition(@term_syntax.parse_term("(std_cube : (Cart[Real, 3]) -> Bool) == hull(convex, {vector([real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)])})")))
}

///|
let std_cube_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("std_cube")

///|
/// `std_cube`
pub fn std_cube() -> @kernel.Thm {
  std_cube_c.get()
}

///|
/// std_octahedron
fn step_4() -> Unit raise {
  std_octahedron_c.set(@pair.new_definition(@term_syntax.parse_term("(std_octahedron : (Cart[Real, 3]) -> Bool) == hull(convex, {vector([real_of_num(1), real_of_num(0), real_of_num(0)]), vector([-real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), real_of_num(1)]), vector([real_of_num(0), real_of_num(0), -real_of_num(1)]), vector([real_of_num(0), real_of_num(1), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(0)])})")))
}

///|
let std_octahedron_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("std_octahedron")

///|
/// `std_octahedron`
pub fn std_octahedron() -> @kernel.Thm {
  std_octahedron_c.get()
}

///|
/// std_dodecahedron
fn step_5() -> Unit raise {
  std_dodecahedron_c.set(@pair.new_definition(@term_syntax.parse_term("(std_dodecahedron : (Cart[Real, 3]) -> Bool) == LET((p : Real) => LET_END(hull(convex, {vector([real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(0), inv(p), p]), vector([real_of_num(0), inv(p), -p]), vector([real_of_num(0), -inv(p), p]), vector([real_of_num(0), -inv(p), -p]), vector([inv(p), p, real_of_num(0)]), vector([inv(p), -p, real_of_num(0)]), vector([-inv(p), p, real_of_num(0)]), vector([-inv(p), -p, real_of_num(0)]), vector([p, real_of_num(0), inv(p)]), vector([-p, real_of_num(0), inv(p)]), vector([p, real_of_num(0), -inv(p)]), vector([-p, real_of_num(0), -inv(p)])})), (real_of_num(1) + sqrt(real_of_num(5))) / real_of_num(2))")))
}

///|
let std_dodecahedron_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("std_dodecahedron")

///|
/// `std_dodecahedron`
pub fn std_dodecahedron() -> @kernel.Thm {
  std_dodecahedron_c.get()
}

///|
/// std_icosahedron
fn step_6() -> Unit raise {
  std_icosahedron_c.set(@pair.new_definition(@term_syntax.parse_term("(std_icosahedron : (Cart[Real, 3]) -> Bool) == LET((p : Real) => LET_END(hull(convex, {vector([real_of_num(0), real_of_num(1), p]), vector([real_of_num(0), real_of_num(1), -p]), vector([real_of_num(0), -real_of_num(1), p]), vector([real_of_num(0), -real_of_num(1), -p]), vector([real_of_num(1), p, real_of_num(0)]), vector([real_of_num(1), -p, real_of_num(0)]), vector([-real_of_num(1), p, real_of_num(0)]), vector([-real_of_num(1), -p, real_of_num(0)]), vector([p, real_of_num(0), real_of_num(1)]), vector([-p, real_of_num(0), real_of_num(1)]), vector([p, real_of_num(0), -real_of_num(1)]), vector([-p, real_of_num(0), -real_of_num(1)])})), (real_of_num(1) + sqrt(real_of_num(5))) / real_of_num(2))")))
}

///|
let std_icosahedron_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("std_icosahedron")

///|
/// `std_icosahedron`
pub fn std_icosahedron() -> @kernel.Thm {
  std_icosahedron_c.get()
}

///|
/// REAL_RAT5_OF_RAT_CONV
fn step_7() -> Unit raise {
  let pth = @tactics.prove(@term_syntax.parse_term("(p : Real) == p + real_of_num(0) * sqrt(real_of_num(5))"), @calc_rat.real_arith_tac)
  let conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(pth)
  real_rat5_of_rat_conv_c.set(fn(x1 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1
    if @calc_int.is_ratconst(tm) {
      conv(tm)
    } else {
      @kernel.refl(tm)
    }
  })
}

///|
let real_rat5_of_rat_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("REAL_RAT5_OF_RAT_CONV")

///|
/// `REAL_RAT5_OF_RAT_CONV`
pub fn real_rat5_of_rat_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (real_rat5_of_rat_conv_c.get())(x)
}

///|
/// REAL_RAT_OF_RAT5_CONV
fn step_8() -> Unit raise {
  let pth = @tactics.prove(@term_syntax.parse_term("(p : Real) + real_of_num(0) * sqrt(real_of_num(5)) == p"), @calc_rat.real_arith_tac)
  real_rat_of_rat5_conv_c.set(@simp.gen_rewrite_conv(fn(x2 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3 = @equal.try_conv(x2)
    fn(x4 : @kernel.Term) -> @kernel.Thm raise {
      s3(x4)
    }
  }, @list.List([pth])))
}

///|
let real_rat_of_rat5_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("REAL_RAT_OF_RAT5_CONV")

///|
/// `REAL_RAT_OF_RAT5_CONV`
pub fn real_rat_of_rat5_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (real_rat_of_rat5_conv_c.get())(x)
}

///|
/// REAL_RAT5_ADD_CONV
fn step_9() -> Unit raise {
  let pth = @tactics.prove(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) * sqrt(real_of_num(5)) + ((a2 : Real) + (b2 : Real) * sqrt(real_of_num(5))) == a1 + a2 + (b1 + b2) * sqrt(real_of_num(5))"), @calc_rat.real_arith_tac)
  let t8 = @equal.rand_conv(@equal.land_conv(@calc_rat.real_rat_add_conv))
  let t7 = @equal.land_conv(@calc_rat.real_rat_add_conv)
  let t6 = @simp.gen_rewrite_conv(fn(x5 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x5
  }, @list.List([pth]))
  real_rat5_add_conv_c.set(@equal.orelsec(@calc_rat.real_rat_add_conv, @equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.binop_conv(real_rat5_of_rat_conv), t6), t7), t8), real_rat_of_rat5_conv)))
}

///|
let real_rat5_add_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("REAL_RAT5_ADD_CONV")

///|
/// `REAL_RAT5_ADD_CONV`
pub fn real_rat5_add_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (real_rat5_add_conv_c.get())(x)
}

///|
/// REAL_RAT5_SUB_CONV
fn step_10() -> Unit raise {
  let pth = @tactics.prove(@term_syntax.parse_term("(a1 : Real) + (b1 : Real) * sqrt(real_of_num(5)) - ((a2 : Real) + (b2 : Real) * sqrt(real_of_num(5))) == a1 - a2 + (b1 - b2) * sqrt(real_of_num(5))"), @calc_rat.real_arith_tac)
  let t12 = @equal.rand_conv(@equal.land_conv(@calc_rat.real_rat_sub_conv))
  let t11 = @equal.land_conv(@calc_rat.real_rat_sub_conv)
  let t10 = @simp.gen_rewrite_conv(fn(x9 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x9
  }, @list.List([pth]))
  real_rat5_sub_conv_c.set(@equal.orelsec(@calc_rat.real_rat_sub_conv, @equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.binop_conv(real_rat5_of_rat_conv), t10), t11), t12), real_rat_of_rat5_conv)))
}

///|
let real_rat5_sub_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("REAL_RAT5_SUB_CONV")

///|
/// `REAL_RAT5_SUB_CONV`
pub fn real_rat5_sub_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (real_rat5_sub_conv_c.get())(x)
}

///|
/// REAL_RAT5_MUL_CONV
fn step_11() -> Unit raise {
  let t13 = @tactics.conv_tac(@calc_rat.real_field)
  let t14 = @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("real_of_num(5)"), @real.sqrt_pow_2())), t13)
  let pth = @tactics.prove(@term_syntax.parse_term("((a1 : Real) + (b1 : Real) * sqrt(real_of_num(5))) * ((a2 : Real) + (b2 : Real) * sqrt(real_of_num(5))) == a1 * a2 + real_of_num(5) * (b1 * b2) + (a1 * b2 + a2 * b1) * sqrt(real_of_num(5))"), t14)
  let t19 = @equal.rand_conv(@equal.land_conv(@equal.thenc(@equal.binop_conv(@calc_rat.real_rat_mul_conv), @calc_rat.real_rat_add_conv)))
  let t17 = @equal.rand_conv(@calc_rat.real_rat_mul_conv)
  let t18 = @equal.land_conv(@equal.thenc(@equal.thenc(@equal.comb_conv(@equal.rand_conv(@calc_rat.real_rat_mul_conv)), t17), @calc_rat.real_rat_add_conv))
  let t16 = @simp.gen_rewrite_conv(fn(x15 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x15
  }, @list.List([pth]))
  real_rat5_mul_conv_c.set(@equal.orelsec(@calc_rat.real_rat_mul_conv, @equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.binop_conv(real_rat5_of_rat_conv), t16), t18), t19), real_rat_of_rat5_conv)))
}

///|
let real_rat5_mul_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("REAL_RAT5_MUL_CONV")

///|
/// `REAL_RAT5_MUL_CONV`
pub fn real_rat5_mul_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (real_rat5_mul_conv_c.get())(x)
}

///|
/// REAL_RAT5_INV_CONV
fn step_12() -> Unit raise {
  let t33 = @tactics.conv_tac(@calc_rat.real_field)
  let t34 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_entire(), @class.de_morgan_thm()])), t33)
  let t32 = @tactics.conv_tac(@calc_rat.real_field)
  let t35 = @list.List([@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(5)"), @real.sqrt_pow_2())), t32), t34])
  let t31 = @tactics.subgoal_then(@term_syntax.parse_term("pow((a : Real), 2) - real_of_num(5) * pow((b : Real), 2) == (a + b * sqrt(real_of_num(5))) * (a - b * sqrt(real_of_num(5)))"), fn(x28 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s29 = @tactics.subst1_tac(x28)
    fn(x30 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s29(x30)
    }
  })
  let t27 = @simp.gen_rewrite_tac(fn(x26 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x20 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s21 = @equal.land_conv(x20)
      fn(x22 : @kernel.Term) -> @kernel.Thm raise {
        s21(x22)
      }
    })((fn(x23 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s24 = @equal.once_depth_conv(x23)
      fn(x25 : @kernel.Term) -> @kernel.Thm raise {
        s24(x25)
      }
    })(x26))
  }, @list.List([@equal.gsym(@realarith.real_sub_0())]))
  let t36 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t27), t31), t35)
  let pth = @tactics.prove(@term_syntax.parse_term("!(pow((a : Real), 2) == real_of_num(5) * pow((b : Real), 2)) → inv(a + b * sqrt(real_of_num(5))) == a / (pow(a, 2) - real_of_num(5) * pow(b, 2)) + -b / (pow(a, 2) - real_of_num(5) * pow(b, 2)) * sqrt(real_of_num(5))"), t36)
  real_rat5_inv_conv_c.set(fn(x37 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x37
    try {
      @calc_rat.real_rat_inv_conv(tm)
    } catch {
      Failure(_) => {
        let th1 = @drule.part_match(fn(x38 : @kernel.Term) -> @kernel.Term raise {
          @equal.lhs(@kernel.rand(x38))
        }, pth)(tm)
        let th2 = @bool.mp(th1, @bool.eqt_elim(@calc_rat.real_rat_reduce_conv(@equal.lhand(@kernel.concl(th1)))))
        let th3 = @equal.conv_rule(@lib.funpow(2, fn(x39 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s40 = @equal.rand_conv(x39)
          fn(x41 : @kernel.Term) -> @kernel.Thm raise {
            s40(x41)
          }
        }, @lib.funpow(2, fn(x42 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s43 = @equal.land_conv(x42)
          fn(x44 : @kernel.Term) -> @kernel.Thm raise {
            s43(x44)
          }
        }, @calc_rat.real_rat_neg_conv)), th2)
        let t45 = @equal.rand_conv(@equal.thenc(@equal.rand_conv(@calc_rat.real_rat_pow_conv), @calc_rat.real_rat_mul_conv))
        let th4 = @equal.conv_rule(@equal.rand_conv(@equal.rand_conv(@equal.land_conv(@equal.thenc(@equal.rand_conv(@equal.thenc(@equal.thenc(@equal.land_conv(@calc_rat.real_rat_pow_conv), t45), @calc_rat.real_rat_sub_conv)), @calc_rat.real_rat_div_conv)))), th3)
        let t46 = @equal.rand_conv(@equal.thenc(@equal.rand_conv(@calc_rat.real_rat_pow_conv), @calc_rat.real_rat_mul_conv))
        let th5 = @equal.conv_rule(@equal.rand_conv(@equal.land_conv(@equal.thenc(@equal.rand_conv(@equal.thenc(@equal.thenc(@equal.land_conv(@calc_rat.real_rat_pow_conv), t46), @calc_rat.real_rat_sub_conv)), @calc_rat.real_rat_div_conv))), th4)
        th5
      }
      e => raise e
    }
  })
}

///|
let real_rat5_inv_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("REAL_RAT5_INV_CONV")

///|
/// `REAL_RAT5_INV_CONV`
pub fn real_rat5_inv_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (real_rat5_inv_conv_c.get())(x)
}

///|
/// REAL_RAT5_DIV_CONV
fn step_13() -> Unit raise {
  let t48 = @equal.rand_conv(real_rat5_inv_conv)
  real_rat5_div_conv_c.set(@equal.thenc(@equal.thenc(@simp.gen_rewrite_conv(fn(x47 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x47
  }, @list.List([@realax.real_div()])), t48), real_rat5_mul_conv))
}

///|
let real_rat5_div_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("REAL_RAT5_DIV_CONV")

///|
/// `REAL_RAT5_DIV_CONV`
pub fn real_rat5_div_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (real_rat5_div_conv_c.get())(x)
}

///|
/// REAL_RAT5_LE_CONV
fn step_14() -> Unit raise {
  let t66 = @simp.simp_tac(@list.List([@real.sqrt_pos_lt(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t64 = @bool.conjunct1(@real.real_le_mul_eq())
  let t63 = @term_syntax.parse_term("(y : Real)")
  let t65 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("sqrt(real_of_num(5))"), t63]), t64))
  let t61 = @equal.gsym(@real.real_le_square_abs())
  let t62 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_mul()), t61]))
  let t60 = @tactics.disch_then(fn(x51 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x51
    @simp.gen_rewrite_tac(fn(x59 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x53 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s54 = @equal.rand_conv(x53)
        fn(x55 : @kernel.Term) -> @kernel.Thm raise {
          s54(x55)
        }
      })((fn(x56 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s57 = @equal.once_depth_conv(x56)
        fn(x58 : @kernel.Term) -> @kernel.Thm raise {
          s57(x58)
        }
      })(x59))
    }, @list.List([@equal.sym(th)]))
  })
  let t50 = @simp.rewrite_tac(@list.List([@realarith.real_pos()]))
  let t49 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("real_of_num(5)"), @real.sqrt_pow_2()))
  let t67 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t49), t50), t60), t62), t65), t66), @calc_rat.real_arith_tac)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, (x <= y * sqrt(real_of_num(5))) == (x <= real_of_num(0) && real_of_num(0) <= y || real_of_num(0) <= x && real_of_num(0) <= y && pow(x, 2) <= real_of_num(5) * pow(y, 2) || x <= real_of_num(0) && y <= real_of_num(0) && real_of_num(5) * pow(y, 2) <= pow(x, 2))"), t67)
  let t68 = @simp.rewrite_tac(@list.List([lemma]))
  let t69 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real) * (x : Real) <= (a' : Real) + (b' : Real) * x) == (a - a' <= (b' - b) * x)"))])), t68), @calc_rat.real_arith_tac)
  let pth = @tactics.prove(@term_syntax.parse_term("((a1 : Real) + (b1 : Real) * sqrt(real_of_num(5)) <= (a2 : Real) + (b2 : Real) * sqrt(real_of_num(5))) == (a1 <= a2 && b1 <= b2 || a2 <= a1 && b1 <= b2 && pow(a1 - a2, 2) <= real_of_num(5) * pow(b2 - b1, 2) || a1 <= a2 && b2 <= b1 && real_of_num(5) * pow(b2 - b1, 2) <= pow(a1 - a2, 2))"), t69)
  let t71 = @simp.gen_rewrite_conv(fn(x70 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x70
  }, @list.List([pth]))
  real_rat5_le_conv_c.set(@equal.orelsec(@calc_rat.real_rat_le_conv, @equal.thenc(@equal.thenc(@equal.binop_conv(real_rat5_of_rat_conv), t71), @calc_rat.real_rat_reduce_conv)))
}

///|
let real_rat5_le_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("REAL_RAT5_LE_CONV")

///|
/// `REAL_RAT5_LE_CONV`
pub fn real_rat5_le_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (real_rat5_le_conv_c.get())(x)
}

///|
/// REAL_RAT5_EQ_CONV
fn step_15() -> Unit raise {
  let t75 = @simp.gen_rewrite_conv(fn(x74 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x74
  }, @list.List([@theorems.and_clauses()]))
  let t73 = @equal.binop_conv(real_rat5_le_conv)
  real_rat5_eq_conv_c.set(@equal.thenc(@equal.thenc(@simp.gen_rewrite_conv(fn(x72 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x72
  }, @list.List([@equal.gsym(@realax.real_le_antisym())])), t73), t75))
}

///|
let real_rat5_eq_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("REAL_RAT5_EQ_CONV")

///|
/// `REAL_RAT5_EQ_CONV`
pub fn real_rat5_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (real_rat5_eq_conv_c.get())(x)
}

///|
/// VECTOR3_SUB_CONV
fn step_16() -> Unit raise {
  let t76 = @simp.rewrite_tac(@list.List([@vectors.vector_3(), @vectors.vector_sub_component()]))
  let t77 = @tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_3(), @vectors.forall_3()])), t76)
  let pth = @tactics.prove(@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 3])([(x1 : Real), (x2 : Real), (x3 : Real)]) - (vector : (List[Real]) -> Cart[Real, 3])([(y1 : Real), (y2 : Real), (y3 : Real)]) == (vector : (List[Real]) -> Cart[Real, 3])([x1 - y1, x2 - y2, x3 - y3])"), t77)
  let t80 = @equal.rand_conv((x79 : @kernel.Term) => @lists.list_conv(real_rat5_sub_conv, x79))
  vector3_sub_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x78 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x78
  }, @list.List([pth])), t80))
}

///|
let vector3_sub_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("VECTOR3_SUB_CONV")

///|
/// `VECTOR3_SUB_CONV`
pub fn vector3_sub_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (vector3_sub_conv_c.get())(x)
}

///|
/// VECTOR3_CROSS_CONV
fn step_17() -> Unit raise {
  let t81 = @simp.rewrite_tac(@list.List([@cross.cross(), @vectors.vector_3()]))
  let pth = @tactics.prove(@term_syntax.parse_term("cross(vector([(x1 : Real), (x2 : Real), (x3 : Real)]), vector([(y1 : Real), (y2 : Real), (y3 : Real)])) == vector([x2 * y3 - x3 * y2, x3 * y1 - x1 * y3, x1 * y2 - x2 * y1])"), t81)
  let t83 = @equal.thenc(@equal.binop_conv(real_rat5_mul_conv), real_rat5_sub_conv)
  let t85 = @equal.rand_conv((x84 : @kernel.Term) => @lists.list_conv(t83, x84))
  vector3_cross_conv_c.set(@equal.thenc(@simp.gen_rewrite_conv(fn(x82 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x82
  }, @list.List([pth])), t85))
}

///|
let vector3_cross_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("VECTOR3_CROSS_CONV")

///|
/// `VECTOR3_CROSS_CONV`
pub fn vector3_cross_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (vector3_cross_conv_c.get())(x)
}

///|
/// VECTOR3_EQ_0_CONV
fn step_18() -> Unit raise {
  let t86 = @simp.rewrite_tac(@list.List([@vectors.vector_3(), @vectors.vec_component()]))
  let t87 = @tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_3(), @vectors.forall_3()])), t86)
  let pth = @tactics.prove(@term_syntax.parse_term("((vector : (List[Real]) -> Cart[Real, 3])([(x1 : Real), (x2 : Real), (x3 : Real)]) == (vec : (Num) -> Cart[Real, 3])(0)) == (x1 == real_of_num(0) && x2 == real_of_num(0) && x3 == real_of_num(0))"), t87)
  let t90 = @simp.rewrite_conv(@list.List([]))
  let t89 = @equal.depth_binop_conv(@term_syntax.parse_term("op_slash_bslash"), real_rat5_eq_conv)
  vector3_eq_0_conv_c.set(@equal.thenc(@equal.thenc(@simp.gen_rewrite_conv(fn(x88 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x88
  }, @list.List([pth])), t89), t90))
}

///|
let vector3_eq_0_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("VECTOR3_EQ_0_CONV")

///|
/// `VECTOR3_EQ_0_CONV`
pub fn vector3_eq_0_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (vector3_eq_0_conv_c.get())(x)
}

///|
/// VECTOR3_DOT_CONV
fn step_19() -> Unit raise {
  let t91 = @simp.rewrite_tac(@list.List([@vectors.dot_3(), @vectors.vector_3()]))
  let pth = @tactics.prove(@term_syntax.parse_term("(dot : (Cart[Real, 3], Cart[Real, 3]) -> Real)((vector : (List[Real]) -> Cart[Real, 3])([(x1 : Real), (x2 : Real), (x3 : Real)]), (vector : (List[Real]) -> Cart[Real, 3])([(y1 : Real), (y2 : Real), (y3 : Real)])) == x1 * y1 + (x2 * y2 + x3 * y3)"), t91)
  let t94 = @equal.rand_conv(real_rat5_add_conv)
  let t93 = @equal.depth_binop_conv(@term_syntax.parse_term("real_add"), real_rat5_mul_conv)
  vector3_dot_conv_c.set(@equal.thenc(@equal.thenc(@equal.thenc(@simp.gen_rewrite_conv(fn(x92 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x92
  }, @list.List([pth])), t93), t94), real_rat5_add_conv))
}

///|
let vector3_dot_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("VECTOR3_DOT_CONV")

///|
/// `VECTOR3_DOT_CONV`
pub fn vector3_dot_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (vector3_dot_conv_c.get())(x)
}

///|
/// STD_DODECAHEDRON
fn step_20() -> Unit raise {
  let t95 = @tactics.conv_tac(@calc_rat.real_field)
  let t96 = @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("real_of_num(5)"), @real.sqrt_pow_2())), t95)
  let golden_inverse = @tactics.prove(@term_syntax.parse_term("inv((real_of_num(1) + sqrt(real_of_num(5))) / real_of_num(2)) == -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))"), t96)
  let t102 = @simp.rewrite_tac(@list.List([]))
  let t101 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t100 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-((a : Real) + (b : Real) * sqrt(real_of_num(5))) == -a + -b * sqrt(real_of_num(5))"))]))
  let t99 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) + (s : Real)) / real_of_num(2) == real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * s"))]))
  let t98 = @simp.rewrite_tac(@list.List([golden_inverse]))
  let t97 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t103 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([std_dodecahedron()])), t97), t98), t99), t100), t101), t102)
  std_dodecahedron_v1_c.set(@tactics.prove(@term_syntax.parse_term("std_dodecahedron == hull(convex, {vector([real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])})"), t103))
}

///|
let std_dodecahedron_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STD_DODECAHEDRON")

///|
/// `STD_DODECAHEDRON`
pub fn std_dodecahedron_v1() -> @kernel.Thm {
  std_dodecahedron_v1_c.get()
}

///|
/// STD_ICOSAHEDRON
fn step_21() -> Unit raise {
  let t108 = @simp.rewrite_tac(@list.List([]))
  let t107 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t106 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("-((a : Real) + (b : Real) * sqrt(real_of_num(5))) == -a + -b * sqrt(real_of_num(5))"))]))
  let t105 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) + (s : Real)) / real_of_num(2) == real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * s"))]))
  let t104 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t109 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([std_icosahedron()])), t104), t105), t106), t107), t108)
  std_icosahedron_v1_c.set(@tactics.prove(@term_syntax.parse_term("std_icosahedron == hull(convex, {vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)])})"), t109))
}

///|
let std_icosahedron_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STD_ICOSAHEDRON")

///|
/// `STD_ICOSAHEDRON`
pub fn std_icosahedron_v1() -> @kernel.Thm {
  std_icosahedron_v1_c.get()
}

///|
/// COMPUTE_FACES_2
fn step_22() -> Unit raise {
  let t466 = @term_syntax.parse_term("dot((a : Cart[Real, 3]), (x : Cart[Real, 3])) == (b : Real)")
  let t467 = @tactics.map_every(fn(x463 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s464 = @tactics.undisch_tac(x463)
    fn(x465 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s464(x465)
    }
  }, @list.List([@term_syntax.parse_term("cross((z : Cart[Real, 3]) - (x : Cart[Real, 3]), (y : Cart[Real, 3]) - x) == (a : Cart[Real, 3])"), t466]))
  let t462 = @simp.asm_rewrite_tac(@list.List([@sets.in_inter(), @sets.in_elim_thm()]))
  let t461 = @tactics.match_mp_tac(@misc.hull_inc())
  let t460 = @tactics.repeat_tac(@tactics.conj_tac)
  let t459 = @simp.rewrite_tac(@list.List([@sets.empty_subset()]))
  let t458 = @simp.asm_rewrite_tac(@list.List([@sets.insert_subset()]))
  let t468 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@convex.aff_dim_subset()), t458), t459), t460), t461), t462), t467), @cross.vec3_tac)
  let t457 = @tactics.conv_tac(@int.int_reduce_conv)
  let t456 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @calc_num.arith()]))
  let t455 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty()]))
  let t454 = @simp.asm_simp_tac(@list.List([@convex.aff_dim_affine_independent()]))
  let t452 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.collinear_3_eq_affine_dependent(), @class.de_morgan_thm()])), @tactics.strip_tac)
  let t451 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@cross.cross_eq_0())]))
  let t450 = @simp.once_rewrite_tac(@list.List([@vectors.collinear_3()]))
  let t453 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _), (y : _), (z : _)} == {z, x, y}"))])), t450), t451), t452])
  let t469 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!collinear({(x : Cart[Real, 3]), (y : Cart[Real, 3]), (z : Cart[Real, 3])})"), fn(x447 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s448 = @tactics.mp_tac(x447)
    fn(x449 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s448(x449)
    }
  }), t453), t454), t455), t456), t457), t468])
  let t446 = @tactics.exists_tac(@term_syntax.parse_term("aff_dim({(x : Cart[Real, 3]), (y : Cart[Real, 3]), (z : Cart[Real, 3])})"))
  let t470 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.int_le_trans()), t446), @tactics.conj_tac), t469)
  let t444 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@convex.aff_dim_hyperplane(), @cart.dimindex_3()])), @int.int_arith_tac)
  let t443 = @sets.set_tac(@list.List([]))
  let t442 = @simp.rewrite_tac(@list.List([@convex.convex_hyperplane()]))
  let t441 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t440 = @simp.asm_rewrite_tac(@list.List([]))
  let t445 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@convex.aff_dim_subset()), t440), t441), t442), t443), t444])
  let t439 = @tactics.exists_tac(@term_syntax.parse_term("aff_dim({(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"))
  let t471 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.int_le_trans()), t439), @tactics.conj_tac), t445), t470])
  let t472 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@int.int_le_antisym())])), @tactics.conj_tac), t471)
  let t436 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t435 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_ge()]))
  let t434 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t433 = @simp.simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (P : (_) -> Bool)(x)) == SUBSET(s, {(x : _) | P(x)})"))]))
  let t432 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t437 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@polytope.face_of_inter_supporting_hyperplane_ge()), t432), t433), t434), t435), t436)
  let t431 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t430 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_le()]))
  let t429 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t428 = @simp.simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (P : (_) -> Bool)(x)) == SUBSET(s, {(x : _) | P(x)})"))]))
  let t427 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t438 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@polytope.face_of_inter_supporting_hyperplane_le()), t427), t428), t429), t430), t431), t437])
  let t426 = @tactics.first_x_assum(@tactics.disj_cases_tac)
  let t420 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_diff(), @sets.in_elim_thm(), @realax.real_gt(), @realarith.real_lt_le()]))
  let t419 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@realax.real_ge()])))
  let t418 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_gt()]))
  let t417 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t414 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")))
  let t416 = @tactics.first_x_assum(fn(x415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t414(x415))
  })
  let t413 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(dot((a : Cart[Real, 3]), (q : Cart[Real, 3])) > (b : Real)) == IN(q, {(x : Cart[Real, 3]) | dot(a, x) > b})"))]))
  let t412 = @list.List([@calc_rat.asm_real_arith_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_gt())]))])
  let t421 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_lmul()), @tactics.conj_tac), t412), t413), t416), t417), t418), t419), t420)
  let t410 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t409 = @sets.set_tac(@list.List([]))
  let t408 = @simp.rewrite_tac(@list.List([@convex.convex_hyperplane()]))
  let t407 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t405 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")))
  let t411 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t405(x406))
  }), t407), t408), t409), t410])
  let t422 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN((p : Cart[Real, 3]), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"), fn(x402 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s403 = @tactics.mp_tac(x402)
    fn(x404 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s403(x404)
    }
  }), t411), t421])
  let t401 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (u : Real)) * (p : Real) == (real_of_num(1) - u) * (b : Real) && u * b < u * (q : Real) → (real_of_num(1) - u) * p + u * q > b")))
  let t423 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) > (y : Real) → !(x == y)"))), t401), @tactics.conj_tac), t422)
  let t398 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_diff(), @sets.in_elim_thm(), @realarith.real_lt_le()]))
  let t397 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_lt()]))
  let t396 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t393 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")))
  let t395 = @tactics.first_x_assum(fn(x394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t393(x394))
  })
  let t392 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(dot((a : Cart[Real, 3]), (q : Cart[Real, 3])) < (b : Real)) == IN(q, {(x : Cart[Real, 3]) | dot(a, x) < b})"))]))
  let t399 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_lmul()), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t392), t395), t396), t397), t398)
  let t390 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t389 = @sets.set_tac(@list.List([]))
  let t388 = @simp.rewrite_tac(@list.List([@convex.convex_hyperplane()]))
  let t387 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t385 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")))
  let t391 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x386 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t385(x386))
  }), t387), t388), t389), t390])
  let t400 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN((p : Cart[Real, 3]), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"), fn(x382 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s383 = @tactics.mp_tac(x382)
    fn(x384 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s383(x384)
    }
  }), t391), t399])
  let t381 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (u : Real)) * (p : Real) == (real_of_num(1) - u) * (b : Real) && u * (q : Real) < u * b → (real_of_num(1) - u) * p + u * q < b")))
  let t424 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (y : Real) → !(x == y)"))), t381), @tactics.conj_tac), t400), t423])
  let t380 = @tactics.first_x_assum(@tactics.disj_cases_tac)
  let t379 = @simp.rewrite_tac(@list.List([@vectors.dot_radd(), @vectors.dot_rmul()]))
  let t378 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t377 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")))
  let t376 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - real_of_num(0), (p : Cart[Real, N])) + op_pct(real_of_num(0), (q : Cart[Real, N])) == p"))]))
  let t375 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Real) == real_of_num(0)"))
  let t374 = @tactics.replicate_tac(4, @tactics.disch_tac)
  let t371 = @term_syntax.parse_term("(q : Cart[Real, 3])")
  let t372 = @term_syntax.parse_term("(u : Real)")
  let t373 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Cart[Real, 3])"), t372, t371]))
  let t370 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_inter(), @theorems.imp_conj(), @sets.forall_in_gspec()]))
  let t368 = @tactics.disch_then(fn(x365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s366 = @tactics.subst1_tac(x365)
    fn(x367 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s366(x367)
    }
  })
  let t364 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t369 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@convex.convex_convex_hull(), @convex.convex_hull_eq_empty()])), t364), t368])
  let t357 = @drule.part_match(fn(x356 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x356))
  }, @convex.convex_hull_union_nonempty_explicit())
  let t351 = @simp.rewrite_tac(@list.List([@misc.hull_subset()]))
  let t350 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET(INTER((s : (_) -> Bool), (t : (_) -> Bool)), hull((P : ((_) -> Bool) -> Bool), INTER(s, t))) && SUBSET(DIFF(s, t), hull(P, DIFF(s, t))) → SUBSET(s, UNION(hull(P, INTER(s, t)), hull(P, DIFF(s, t))))")))
  let t349 = @tactics.match_mp_tac(@misc.hull_mono())
  let t352 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET(INTER(s, (u : (_) -> Bool)), INTER(t, u))"))), t349), t350), t351), @tactics.all_tac])
  let t348 = @tactics.exists_tac(@term_syntax.parse_term("INTER(hull(convex, UNION(hull(convex, INTER((s : (Cart[Real, 3]) -> Bool), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})), hull(convex, DIFF(s, {(x : Cart[Real, 3]) | dot(a, x) == b})))), {(x : Cart[Real, 3]) | dot(a, x) == b})"))
  let t347 = @tactics.match_mp_tac(@sets.subset_trans())
  let t345 = @sets.set_tac(@list.List([]))
  let t346 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → INTER(s, t) == s"))])), t345), @tactics.all_tac])
  let t344 = @class.asm_cases_tac(@term_syntax.parse_term("SUBSET((s : (Cart[Real, 3]) -> Bool), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"))
  let t342 = @simp.rewrite_tac(@list.List([@convex.convex_hull_eq(), @convex.convex_hyperplane()]))
  let t341 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → SUBSET(s, t)")))
  let t340 = @simp.simp_tac(@list.List([@misc.hull_mono(), @sets.inter_subset()]))
  let t339 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"))
  let t338 = @tactics.match_mp_tac(@sets.subset_trans())
  let t343 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@sets.subset_inter(), @misc.hull_mono(), @sets.inter_subset()])), t338), t339), t340), t341), t342), @tactics.all_tac])
  let t425 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_antisym()), @tactics.conj_tac), t343), t344), t346), t347), t348), @tactics.conj_tac), t352), fn(x363 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x360 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x359 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x358 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x353 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s354 = @tactics.mp_tac(x353)
              fn(x355 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s354(x355)
              }
            })(t357(x358))
          })(@equal.lhand(x359))
        })(@equal.lhand(x360))
      })((fn(x361 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x361.1
      })(x362))
    })(x363)(x363)
  }), @tactics.ants_tac), t369), t370), t373), t374), t375), t376), t377), t378), t379), t380), t424), @tactics.all_tac])
  let t337 = @tactics.subgoal_then(@term_syntax.parse_term("hull(convex, INTER((s : (Cart[Real, 3]) -> Bool), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})) == INTER(hull(convex, s), {(x : Cart[Real, 3]) | dot(a, x) == b})"), fn(x334 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s335 = @tactics.subst1_tac(x334)
    fn(x336 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s335(x336)
    }
  })
  let t473 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t337), t425), t426), t438), t472])
  let t333 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s331 = @tactics.assume_tac(x330)
    fn(x332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s331(x332)
    }
  }))
  let t329 = @tactics.repeat_tac(@pair.let_tac)
  let t326 = @term_syntax.parse_term("(z : Cart[Real, 3])")
  let t327 = @term_syntax.parse_term("(y : Cart[Real, 3])")
  let t328 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Cart[Real, 3])"), t327, t326]))
  let t474 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])), t328), t329), t333), @tactics.conj_tac), t473)
  let t321 = @simp.rewrite_tac(@list.List([@convex.convex_hull_eq(), @convex.convex_hyperplane()]))
  let t320 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → SUBSET(s, t)")))
  let t319 = @simp.simp_tac(@list.List([@misc.hull_mono(), @sets.inter_subset()]))
  let t318 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"))
  let t317 = @tactics.match_mp_tac(@sets.subset_trans())
  let t316 = @simp.asm_rewrite_tac(@list.List([]))
  let t315 = @simp.simp_tac(@list.List([@misc.hull_mono(), @sets.inter_subset()]))
  let t314 = @simp.rewrite_tac(@list.List([@sets.subset_inter()]))
  let t322 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x309
    @simp.gen_rewrite_tac(fn(x311 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s312 = @equal.rand_conv(x311)
      fn(x313 : @kernel.Term) -> @kernel.Thm raise {
        s312(x313)
      }
    }, @list.List([@equal.sym(th_3)]))
  }), t314), t315), t316), t317), t318), t319), t320), t321)
  let t308 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t307 = @simp.rewrite_tac(@list.List([@misc.hull_subset()]))
  let t306 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, (t : (Cart[Real, 3]) -> Bool))"))
  let t305 = @tactics.match_mp_tac(@sets.subset_trans())
  let t304 = @simp.asm_rewrite_tac(@list.List([]))
  let t303 = @simp.rewrite_tac(@list.List([@sets.subset_inter()]))
  let t323 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_mono()), t303), t304), t305), t306), t307), t308), t322])
  let t324 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_antisym()), @tactics.conj_tac), t323)
  let t300 = @tactics.match_mp_tac(@real.real_convex_bound_lt())
  let t299 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (b : Real) → a == b → false")))
  let t298 = @tactics.disch_then(@tactics.choose_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x295 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s296 = @tactics.mp_tac(x295)
    fn(x297 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s296(x297)
    }
  })))
  let t294 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2(), @vectors.dot_radd(), @vectors.dot_rmul(), @theorems.conj_assoc()]))
  let t293 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @theorems.right_exists_and_thm()]))
  let t292 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t301 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_segment(), @sets.in_elim_thm(), @theorems.left_and_exists_thm()])), t292), t293), t294), t298), t299), t300), @calc_rat.asm_real_arith_tac)
  let t291 = @simp.asm_simp_tac(@list.List([@topology.ends_in_segment(), @topology.connected_segment(), @realarith.real_lt_imp_le()]))
  let t289 = @term_syntax.parse_term("(u : Cart[Real, 3])")
  let t290 = @tactics.map_every(fn(x286 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s287 = @tactics.exists_tac(x286)
    fn(x288 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s287(x288)
    }
  }, @list.List([@term_syntax.parse_term("(v : Cart[Real, 3])"), t289]))
  let t285 = @tactics.match_mp_tac(@topology.connected_ivt_hyperplane())
  let t284 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t302 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t284), t285), t290), t291), t301])
  let t283 = @tactics.subgoal_then(@term_syntax.parse_term("∃ w : Cart[Real, 3], IN(w, segment([((u : Cart[Real, 3]), (v : Cart[Real, 3]))])) && IN(w, {(w : Cart[Real, 3]) | dot((a' : Cart[Real, 3]), w) == (b' : Real)})"), fn(x280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s281 = @tactics.mp_tac(x280)
    fn(x282 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s281(x282)
    }
  })
  let t277 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t278 = @list.List([@simp.asm_simp_tac(@list.List([@misc.hull_inc()])), t277])
  let t276 = @tactics.subgoal_then(@term_syntax.parse_term("IN((u : Cart[Real, 3]), hull(convex, (s : (Cart[Real, 3]) -> Bool))) && IN((v : Cart[Real, 3]), hull(convex, s))"), fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s274 = @tactics.mp_tac(x273)
    fn(x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s274(x275)
    }
  })
  let t272 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @real.real_lt_imp_ne()]))
  let t271 = @simp.asm_rewrite_tac(@list.List([]))
  let t270 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("((f : (_) -> Real)((x : _)) <= (b : Real) && !(f(x) == b)) == (IN(x, {(x : _) | f(x) <= b}) && !IN(x, {(x : _) | f(x) == b}))"))]))
  let t279 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_lt_le()])), t270), t271), t272), t276), t278), @tactics.all_tac])
  let t269 = @tactics.subgoal_then(@term_syntax.parse_term("dot((a' : Cart[Real, 3]), (u : Cart[Real, 3])) < (b' : Real) && dot(a', (v : Cart[Real, 3])) < b'"), fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s267 = @tactics.assume_tac(x266)
    fn(x268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s267(x268)
    }
  })
  let t263 = @term_syntax.parse_term("(v : Cart[Real, 3])")
  let t261 = @term_syntax.parse_term("(u : Cart[Real, 3])")
  let t265 = @tactics.disch_then(@tactics.conjuncts_then2((x262 : @kernel.Thm) => @tactics.x_choose_tac(t261, x262), (x264 : @kernel.Thm) => @tactics.x_choose_tac(t263, x264)))
  let t260 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp(), @realax.real_ge(), @real.real_not_le()]))
  let t325 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(p : Bool) && !(q : Bool) → false) → p || q"))), t260), t265), t269), t279), t283), t302), t324])
  let t259 = @tactics.disch_then(fn(x256 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x256
    let t258 = @tactics.assume_tac(th_2)
    @tactics.then_tac(@tactics.subst_all_tac(th_2), t258)
  })
  let t253 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → INTER(s, t) == s"))]))
  let t252 = @simp.asm_simp_tac(@list.List([@realax.real_ge(), @realax.real_le_refl()]))
  let t254 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.subset(), @sets.in_elim_thm()]))), t252), t253])
  let t250 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t249 = @simp.rewrite_tac(@list.List([@convex.affine_hyperplane()]))
  let t248 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t247 = @tactics.first_x_assum(fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x242
    @simp.gen_rewrite_tac(fn(x244 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s245 = @equal.land_conv(x244)
      fn(x246 : @kernel.Term) -> @kernel.Thm raise {
        s245(x246)
      }
    }, @list.List([@equal.sym(th_1)]))
  })
  let t241 = @simp.rewrite_tac(@list.List([@convex.convex_hull_subset_affine_hull()]))
  let t240 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, (t : (Cart[Real, 3]) -> Bool))"))
  let t239 = @tactics.match_mp_tac(@sets.subset_trans())
  let t238 = @simp.asm_rewrite_tac(@list.List([]))
  let t237 = @simp.rewrite_tac(@list.List([@misc.hull_subset()]))
  let t236 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, (s : (Cart[Real, 3]) -> Bool))"))
  let t251 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_trans()), t236), t237), t238), t239), t240), t241), t247), t248), t249), t250), @tactics.all_tac])
  let t235 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((s : (Cart[Real, 3]) -> Bool), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"), fn(x232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s233 = @tactics.assume_tac(x232)
    fn(x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s233(x234)
    }
  })
  let t255 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.inter_univ()]))), t235), t251), @tactics.conj_tac), t254), @tactics.all_tac])
  let t231 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s225 = @tactics.subst_all_tac(x224)
    fn(x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s225(x226)
    }
  }, fn(x230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x227 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s228 = @tactics.mp_tac(x227)
      fn(x229 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s228(x229)
      }
    })(@equal.sym(x230))
  }))
  let t223 = @simp.asm_rewrite_tac(@list.List([@vectors.hyperplane_eq_empty()]))
  let t220 = @simp.gen_rewrite_rule(fn(x219 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x219
  }, @list.List([@determinants.subset_hyperplanes()]))
  let t222 = @tactics.first_x_assum(fn(x221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x216 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s217 = @tactics.mp_tac(x216)
      fn(x218 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s217(x218)
      }
    })(t220(x221))
  })
  let t215 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @tactics.conv_tac(@int.int_reduce_conv)))
  let t214 = @simp.asm_simp_tac(@list.List([@convex.aff_dim_affine_inter_hyperplane(), @convex.aff_dim_hyperplane(), @convex.affine_hyperplane(), @cart.dimindex_3()]))
  let t210 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t209 = @simp.rewrite_tac(@list.List([@misc.hull_subset()]))
  let t208 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, (t : (Cart[Real, 3]) -> Bool))"))
  let t207 = @tactics.match_mp_tac(@sets.subset_trans())
  let t206 = @simp.asm_rewrite_tac(@list.List([]))
  let t205 = @tactics.exists_tac(@term_syntax.parse_term("(t : (Cart[Real, 3]) -> Bool)"))
  let t211 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_trans()), t205), t206), t207), t208), t209), t210)
  let t212 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t211])
  let t204 = @simp.rewrite_tac(@list.List([@sets.subset_inter()]))
  let t203 = @tactics.match_mp_tac(@convex.aff_dim_subset())
  let t202 = @simp.rewrite_tac(@list.List([@convex.aff_dim_affine_hull()]))
  let t201 = @tactics.first_x_assum(fn(x192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x192
    @simp.gen_rewrite_tac(fn(x200 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x194 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s195 = @equal.land_conv(x194)
        fn(x196 : @kernel.Term) -> @kernel.Thm raise {
          s195(x196)
        }
      })((fn(x197 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s198 = @equal.rand_conv(x197)
        fn(x199 : @kernel.Term) -> @kernel.Thm raise {
          s198(x199)
        }
      })(x200))
    }, @list.List([@equal.sym(th)]))
  })
  let t213 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x189 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s190 = @equal.land_conv(x189)
    fn(x191 : @kernel.Term) -> @kernel.Thm raise {
      s190(x191)
    }
  }, @list.List([@equal.gsym(@convex.aff_dim_affine_hull())])), t201), t202), t203), t204), @tactics.conj_tac), t212), @tactics.all_tac])
  let t188 = @tactics.subgoal_then(@term_syntax.parse_term("aff_dim((t : (Cart[Real, 3]) -> Bool)) <= aff_dim(INTER({(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)}, {(x : Cart[Real, 3]) | dot((a' : Cart[Real, 3]), x) == (b' : Real)}))"), fn(x185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s186 = @tactics.mp_tac(x185)
    fn(x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s186(x187)
    }
  })
  let t184 = @tactics.disch_then(fn(x183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x183))
  })
  let t181 = @term_syntax.parse_term("(b' : Real)")
  let t182 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a' : Cart[Real, 3])"), t181]))
  let t180 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t179 = @simp.asm_simp_tac(@list.List([@polytope.polyhedron_convex_hull(), @polytope.exposed_face_of()]))
  let t177 = @term_syntax.parse_term("hull(convex, (t : (Cart[Real, 3]) -> Bool))")
  let t178 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("hull(convex, (s : (Cart[Real, 3]) -> Bool))"), t177]), @polytope.exposed_face_of_polyhedron()))
  let t175 = @term_syntax.parse_term("dot((a : Cart[Real, 3]), (x : Cart[Real, 3])) == (b : Real)")
  let t176 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x172 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s173 = @tactics.undisch_tac(x172)
    fn(x174 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s173(x174)
    }
  }, @list.List([@term_syntax.parse_term("cross((z : Cart[Real, 3]) - (x : Cart[Real, 3]), (y : Cart[Real, 3]) - x) == (a : Cart[Real, 3])"), t175])), @cross.vec3_tac), @tactics.all_tac])
  let t171 = @tactics.subgoal_then(@term_syntax.parse_term("dot((a : Cart[Real, 3]), (y : Cart[Real, 3])) == (b : Real) && dot(a, (z : Cart[Real, 3])) == b"), @tactics.strip_assume_tac)
  let t170 = @simp.asm_rewrite_tac(@list.List([]))
  let t169 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@cross.cross_eq_0())]))
  let t168 = @simp.once_rewrite_tac(@list.List([@vectors.collinear_3()]))
  let t167 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _), (y : _), (z : _)} == {z, x, y}"))]))
  let t166 = @list.List([@simp.asm_rewrite_tac(@list.List([@convex.collinear_3_eq_affine_dependent()])), @tactics.all_tac])
  let t165 = @tactics.subgoal_then(@term_syntax.parse_term("!collinear({(x : Cart[Real, 3]), (y : Cart[Real, 3]), (z : Cart[Real, 3])})"), fn(x162 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s163 = @tactics.mp_tac(x162)
    fn(x164 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s163(x164)
    }
  })
  let t161 = @tactics.repeat_tac(@pair.let_tac)
  let t160 = @tactics.replicate_tac(3, @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])))
  let t157 = @term_syntax.parse_term("(z : Cart[Real, 3])")
  let t158 = @term_syntax.parse_term("(y : Cart[Real, 3])")
  let t159 = @tactics.map_every(fn(x154 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s155 = @tactics.exists_tac(x154)
    fn(x156 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s155(x156)
    }
  }, @list.List([@term_syntax.parse_term("(x : Cart[Real, 3])"), t158, t157]))
  let t153 = @tactics.disch_then(fn(x150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s151 = @tactics.subst_all_tac(x150)
    fn(x152 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s151(x152)
    }
  })
  let t149 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x143 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s144 = @tactics.assume_tac(x143)
    fn(x145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s144(x145)
    }
  }, fn(x146 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s147 = @tactics.mp_tac(x146)
    fn(x148 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s147(x148)
    }
  })))
  let t140 = @term_syntax.parse_term("(z : Cart[Real, 3])")
  let t141 = @term_syntax.parse_term("(y : Cart[Real, 3])")
  let t142 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Cart[Real, 3])"), t141, t140]))
  let t139 = @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t138 = @tactics.conv_tac(@equal.land_conv(@sets.has_size_conv))
  let t135 = @meson.asm_meson_tac(@list.List([@convex.aff_dim_unique()]))
  let t136 = @list.List([@meson.asm_meson_tac(@list.List([@convex.aff_dim_affine_hull()])), t135])
  let t134 = @tactics.match_mp_tac(@int.int_arith(@term_syntax.parse_term("aff_dim((u : (Cart[Real, 3]) -> Bool)) == int_of_num(2) && aff_dim(u) == int_of_num(CARD(u)) - int_of_num(1) → int_of_num(CARD(u)) == int_of_num(3)")))
  let t133 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_eq())]))
  let t137 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.has_size(), @convex.affine_independent_imp_finite()])), t133), t134), @tactics.conj_tac), t136), @tactics.all_tac])
  let t132 = @tactics.subgoal_then(@term_syntax.parse_term("HAS_SIZE((u : (Cart[Real, 3]) -> Bool), 3)"), fn(x129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s130 = @tactics.mp_tac(x129)
    fn(x131 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s130(x131)
    }
  })
  let t128 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t127 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(t : (Cart[Real, 3]) -> Bool)"), @convex.affine_basis_exists()))
  let t126 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@convex.aff_dim_convex_hull()])))
  let t125 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x119 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s120 = @tactics.assume_tac(x119)
    fn(x121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s120(x121)
    }
  }, fn(x122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s123 = @tactics.subst_all_tac(x122)
    fn(x124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s123(x124)
    }
  }))
  let t117 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : (Cart[Real, 3]) -> Bool)"))(fn(x114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s115 = @tactics.mp_tac(x114)
    fn(x116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s115(x116)
    }
  }))
  let t113 = @simp.asm_simp_tac(@list.List([@topology.finite_imp_compact()]))
  let t118 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@polytope.face_of_convex_hull_subset()), t113), t117])
  let t475 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.strip_tac, @tactics.subgoal_then(@term_syntax.parse_term("∃ t : (Cart[Real, 3]) -> Bool, SUBSET(t, (s : (Cart[Real, 3]) -> Bool)) && (f : (Cart[Real, 3]) -> Bool) == hull(convex, t)"), fn(x110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s111 = @tactics.mp_tac(x110)
    fn(x112 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s111(x112)
    }
  })), t118), t125), t126), t127), t128), t132), t137), t138), t139), t142), t149), t153), t159), t160), t161), t165), t166), t167), t168), t169), @tactics.disch_tac), t170), t171), t176), t178), t179), t180), t182), t184), t188), t213), t214), t215), t222), t223), t231), t255), t259), @tactics.conj_tac), t325), t474])
  let t476 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @tactics.eq_tac), t475)
  compute_faces_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, ∀ s : (Cart[Real, 3]) -> Bool, FINITE(s) → (face_of(f, hull(convex, s)) && aff_dim(f) == int_of_num(2)) == (∃ x : Cart[Real, 3], ∃ y : Cart[Real, 3], ∃ z : Cart[Real, 3], IN(x, s) && IN(y, s) && IN(z, s) && LET((a : Cart[Real, 3]) => LET_END(!(a == vec(0)) && LET((b : Real) => LET_END(((∀ w : Cart[Real, 3], IN(w, s) → dot(a, w) <= b) || (∀ w : Cart[Real, 3], IN(w, s) → dot(a, w) >= b)) && f == hull(convex, INTER(s, {(x : Cart[Real, 3]) | dot(a, x) == b}))), dot(a, x))), cross(z - x, y - x)))"), t476))
}

///|
let compute_faces_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPUTE_FACES_2")

///|
/// `COMPUTE_FACES_2`
pub fn compute_faces_2() -> @kernel.Thm {
  compute_faces_2_c.get()
}

///|
/// COMPUTE_FACES_2_STEP_1
fn step_23() -> Unit raise {
  let t491 = @simp.rewrite_tac(@list.List([@cross.vec3_rule(@term_syntax.parse_term("dot(cross((z : Cart[Real, 3]) - (x : Cart[Real, 3]), (y : Cart[Real, 3]) - x), y) == dot(cross(z - x, y - x), x)"))]))
  let t490 = @simp.rewrite_tac(@list.List([@theorems.disj_aci()]))
  let t489 = @simp.rewrite_tac(@list.List([@vectors.vector_neg_eq_0(), @vectors.dot_lneg(), @real.real_eq_neg2(), @calc_int.real_le_neg2(), @realax.real_ge()]))
  let t487 = @term_syntax.parse_term("cross((y : Cart[Real, 3]) - (x : Cart[Real, 3]), (z : Cart[Real, 3]) - x) == -cross(z - x, y - x)")
  let t488 = @tactics.map_every(fn(x486 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x483 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s484 = @tactics.subst1_tac(x483)
      fn(x485 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s484(x485)
      }
    })(@cross.vec3_rule(x486))
  }, @list.List([@term_syntax.parse_term("cross((z : Cart[Real, 3]) - (y : Cart[Real, 3]), (x : Cart[Real, 3]) - y) == -cross(z - x, y - x)"), t487]))
  let t482 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t481 = @tactics.repeat_tac(@tactics.gen_tac)
  let t480 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_refl(), @cross.cross_0()]))
  let t479 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t478 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, ∀ z : _, (Q : (_, _, _) -> Bool)(x, y, z) → Q(x, z, y)) && (∀ x : _, ∀ y : _, ∀ z : _, Q(x, y, z) → Q(y, x, z)) && (∀ x : _, ∀ z : _, !Q(x, x, z)) → (∃ x : _, ∃ y : _, ∃ z : _, (x == (v : _) || (P : (_) -> Bool)(x)) && (y == v || P(y)) && (z == v || P(z)) && Q(x, y, z)) == ((∃ y : _, ∃ z : _, P(y) && P(z) && Q(v, y, z)) || (∃ x : _, ∃ y : _, ∃ z : _, P(x) && P(y) && P(z) && Q(x, y, z)))")))
  let t477 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t492 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t477), t478), t479), t480), @tactics.conj_tac), t481), t482), t488), t489), t490), t491)
  compute_faces_2_step_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, ∀ v : Cart[Real, 3], ∀ s : (Cart[Real, 3]) -> Bool, ∀ t : (Cart[Real, 3]) -> Bool, (∃ x : Cart[Real, 3], ∃ y : Cart[Real, 3], ∃ z : Cart[Real, 3], IN(x, INSERT(v, s)) && IN(y, INSERT(v, s)) && IN(z, INSERT(v, s)) && LET((a : Cart[Real, 3]) => LET_END(!(a == vec(0)) && LET((b : Real) => LET_END(((∀ w : Cart[Real, 3], IN(w, t) → dot(a, w) <= b) || (∀ w : Cart[Real, 3], IN(w, t) → dot(a, w) >= b)) && f == hull(convex, INTER(t, {(x : Cart[Real, 3]) | dot(a, x) == b}))), dot(a, x))), cross(z - x, y - x))) == ((∃ y : Cart[Real, 3], ∃ z : Cart[Real, 3], IN(y, s) && IN(z, s) && LET((a : Cart[Real, 3]) => LET_END(!(a == vec(0)) && LET((b : Real) => LET_END(((∀ w : Cart[Real, 3], IN(w, t) → dot(a, w) <= b) || (∀ w : Cart[Real, 3], IN(w, t) → dot(a, w) >= b)) && f == hull(convex, INTER(t, {(x : Cart[Real, 3]) | dot(a, x) == b}))), dot(a, v))), cross(z - v, y - v))) || (∃ x : Cart[Real, 3], ∃ y : Cart[Real, 3], ∃ z : Cart[Real, 3], IN(x, s) && IN(y, s) && IN(z, s) && LET((a : Cart[Real, 3]) => LET_END(!(a == vec(0)) && LET((b : Real) => LET_END(((∀ w : Cart[Real, 3], IN(w, t) → dot(a, w) <= b) || (∀ w : Cart[Real, 3], IN(w, t) → dot(a, w) >= b)) && f == hull(convex, INTER(t, {(x : Cart[Real, 3]) | dot(a, x) == b}))), dot(a, x))), cross(z - x, y - x))))"), t492))
}

///|
let compute_faces_2_step_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPUTE_FACES_2_STEP_1")

///|
/// `COMPUTE_FACES_2_STEP_1`
pub fn compute_faces_2_step_1() -> @kernel.Thm {
  compute_faces_2_step_1_c.get()
}

///|
/// COMPUTE_FACES_2_STEP_2
fn step_24() -> Unit raise {
  let t501 = @simp.rewrite_tac(@list.List([@theorems.disj_aci()]))
  let t500 = @simp.rewrite_tac(@list.List([@vectors.vector_neg_eq_0(), @vectors.dot_lneg(), @real.real_eq_neg2(), @calc_int.real_le_neg2(), @realax.real_ge()]))
  let t499 = @tactics.subst1_tac(@cross.vec3_rule(@term_syntax.parse_term("cross((x : Cart[Real, 3]) - (v : Cart[Real, 3]), (y : Cart[Real, 3]) - v) == -cross(y - v, x - v)")))
  let t498 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t497 = @tactics.repeat_tac(@tactics.gen_tac)
  let t496 = @simp.rewrite_tac(@list.List([@cross.cross_refl()]))
  let t495 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t494 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, (Q : (_, _) -> Bool)(x, y) → Q(y, x)) && (∀ x : _, !Q(x, x)) → (∃ y : _, ∃ z : _, (y == (u : _) || (P : (_) -> Bool)(y)) && (z == u || P(z)) && Q(y, z)) == ((∃ z : _, P(z) && Q(u, z)) || (∃ y : _, ∃ z : _, P(y) && P(z) && Q(y, z)))")))
  let t493 = @simp.rewrite_tac(@list.List([@sets.in_insert()]))
  let t502 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t493), t494), t495), t496), t497), t498), t499), t500), t501)
  compute_faces_2_step_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, ∀ u : Cart[Real, 3], ∀ v : Cart[Real, 3], ∀ s : (Cart[Real, 3]) -> Bool, (∃ y : Cart[Real, 3], ∃ z : Cart[Real, 3], IN(y, INSERT(u, s)) && IN(z, INSERT(u, s)) && LET((a : Cart[Real, 3]) => LET_END(!(a == vec(0)) && LET((b : Real) => LET_END(((∀ w : Cart[Real, 3], IN(w, (t : (Cart[Real, 3]) -> Bool)) → dot(a, w) <= b) || (∀ w : Cart[Real, 3], IN(w, t) → dot(a, w) >= b)) && f == hull(convex, INTER(t, {(x : Cart[Real, 3]) | dot(a, x) == b}))), dot(a, v))), cross(z - v, y - v))) == ((∃ z : Cart[Real, 3], IN(z, s) && LET((a : Cart[Real, 3]) => LET_END(!(a == vec(0)) && LET((b : Real) => LET_END(((∀ w : Cart[Real, 3], IN(w, t) → dot(a, w) <= b) || (∀ w : Cart[Real, 3], IN(w, t) → dot(a, w) >= b)) && f == hull(convex, INTER(t, {(x : Cart[Real, 3]) | dot(a, x) == b}))), dot(a, v))), cross(z - v, u - v))) || (∃ y : Cart[Real, 3], ∃ z : Cart[Real, 3], IN(y, s) && IN(z, s) && LET((a : Cart[Real, 3]) => LET_END(!(a == vec(0)) && LET((b : Real) => LET_END(((∀ w : Cart[Real, 3], IN(w, t) → dot(a, w) <= b) || (∀ w : Cart[Real, 3], IN(w, t) → dot(a, w) >= b)) && f == hull(convex, INTER(t, {(x : Cart[Real, 3]) | dot(a, x) == b}))), dot(a, v))), cross(z - v, y - v))))"), t502))
}

///|
let compute_faces_2_step_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPUTE_FACES_2_STEP_2")

///|
/// `COMPUTE_FACES_2_STEP_2`
pub fn compute_faces_2_step_2() -> @kernel.Thm {
  compute_faces_2_step_2_c.get()
}

///|
/// COMPUTE_FACES_TAC
fn step_25() -> Unit raise {
  let t503 = @tactics.then_tac(@class.cond_cases_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([])))
  let lemma = @tactics.prove(@term_syntax.parse_term("INTER(INSERT((x : _), (s : (_) -> Bool)), {(x : _) | (P : (_) -> Bool)(x)}) == (if P(x) { INSERT(x, INTER(s, {(x : _) | P(x)})) } else { INTER(s, {(x : _) | P(x)}) })"), t503)
  let t524 = @simp.rewrite_tac(@list.List([@theorems.disj_aci()]))
  let t523 = @simp.rewrite_tac(@list.List([@sets.insert_ac()]))
  let t522 = @simp.rewrite_tac(@list.List([@sets.inter_empty()]))
  let t520 = @simp.rewrite_tac(@list.List([]))
  let t519 = @tactics.conv_tac(@equal.once_depth_conv(@equal.thenc(@equal.land_conv(vector3_dot_conv), real_rat5_eq_conv)))
  let t521 = @tactics.repeat_tac(@tactics.then_tac(@tactics.changed_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([lemma])), t519)), t520))
  let t518 = @simp.rewrite_tac(@list.List([@theorems.disj_aci()]))
  let t517 = @simp.rewrite_tac(@list.List([@sets.insert_ac()]))
  let t516 = @tactics.conv_tac(@equal.once_depth_conv(real_rat5_le_conv))
  let t515 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t514 = @tactics.conv_tac(@equal.once_depth_conv(vector3_dot_conv))
  let t513 = @simp.rewrite_tac(@list.List([@realax.real_ge()]))
  let t512 = @tactics.conv_tac(@equal.once_depth_conv(vector3_eq_0_conv))
  let t511 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t510 = @tactics.conv_tac(@equal.once_depth_conv(vector3_cross_conv))
  let t509 = @tactics.conv_tac(@equal.once_depth_conv(vector3_sub_conv))
  let t508 = @simp.rewrite_tac(@list.List([@sets.forall_in_insert(), @sets.not_in_empty()]))
  let t507 = @simp.rewrite_tac(@list.List([@sets.exists_in_insert(), @sets.not_in_empty()]))
  let t506 = @simp.rewrite_tac(@list.List([@sets.not_in_empty()]))
  let t505 = @simp.rewrite_tac(@list.List([compute_faces_2_step_2()]))
  let t504 = @simp.rewrite_tac(@list.List([compute_faces_2_step_1()]))
  compute_faces_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([compute_faces_2(), @sets.finite_insert(), @sets.finite_empty()])), t504), t505), t506), t507), t508), t509), t510), t511), t512), t513), t514), t515), t516), t517), t518), t521), t522), t523), t524))
}

///|
let compute_faces_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("COMPUTE_FACES_TAC")

///|
/// `COMPUTE_FACES_TAC`
pub fn compute_faces_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (compute_faces_tac_c.get())(x)
}

///|
/// TETRAHEDRON_FACETS
fn step_26() -> Unit raise {
  let t526 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([std_tetrahedron()]))), compute_faces_tac)
  tetrahedron_facets_c.set(@lib.time(fn(x525 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x525.0, x525.1)
  }, (@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, (face_of(f, std_tetrahedron) && aff_dim(f) == int_of_num(2)) == (f == hull(convex, {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}))"), t526)))
}

///|
let tetrahedron_facets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TETRAHEDRON_FACETS")

///|
/// `TETRAHEDRON_FACETS`
pub fn tetrahedron_facets() -> @kernel.Thm {
  tetrahedron_facets_c.get()
}

///|
/// CUBE_FACETS
fn step_27() -> Unit raise {
  let t528 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([std_cube()]))), compute_faces_tac)
  cube_facets_c.set(@lib.time(fn(x527 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x527.0, x527.1)
  }, (@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, (face_of(f, std_cube) && aff_dim(f) == int_of_num(2)) == (f == hull(convex, {vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}) || f == hull(convex, {vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}))"), t528)))
}

///|
let cube_facets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBE_FACETS")

///|
/// `CUBE_FACETS`
pub fn cube_facets() -> @kernel.Thm {
  cube_facets_c.get()
}

///|
/// OCTAHEDRON_FACETS
fn step_28() -> Unit raise {
  let t530 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([std_octahedron()]))), compute_faces_tac)
  octahedron_facets_c.set(@lib.time(fn(x529 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x529.0, x529.1)
  }, (@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, (face_of(f, std_octahedron) && aff_dim(f) == int_of_num(2)) == (f == hull(convex, {vector([-real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), -real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), -real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), real_of_num(1)])}) || f == hull(convex, {vector([real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), -real_of_num(1)])}) || f == hull(convex, {vector([real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), real_of_num(1)])}) || f == hull(convex, {vector([real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), -real_of_num(1)])}) || f == hull(convex, {vector([real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), real_of_num(1)])}))"), t530)))
}

///|
let octahedron_facets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OCTAHEDRON_FACETS")

///|
/// `OCTAHEDRON_FACETS`
pub fn octahedron_facets() -> @kernel.Thm {
  octahedron_facets_c.get()
}

///|
/// ICOSAHEDRON_FACETS
fn step_29() -> Unit raise {
  let t532 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([std_icosahedron_v1()]))), compute_faces_tac)
  icosahedron_facets_c.set(@lib.time(fn(x531 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x531.0, x531.1)
  }, (@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, (face_of(f, std_icosahedron) && aff_dim(f) == int_of_num(2)) == (f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || f == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || f == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}))"), t532)))
}

///|
let icosahedron_facets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ICOSAHEDRON_FACETS")

///|
/// `ICOSAHEDRON_FACETS`
pub fn icosahedron_facets() -> @kernel.Thm {
  icosahedron_facets_c.get()
}

///|
/// DODECAHEDRON_FACETS
fn step_30() -> Unit raise {
  let t534 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([std_dodecahedron_v1()]))), compute_faces_tac)
  dodecahedron_facets_c.set(@lib.time(fn(x533 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x533.0, x533.1)
  }, (@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, (face_of(f, std_dodecahedron) && aff_dim(f) == int_of_num(2)) == (f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}) || f == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || f == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}))"), t534)))
}

///|
let dodecahedron_facets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DODECAHEDRON_FACETS")

///|
/// `DODECAHEDRON_FACETS`
pub fn dodecahedron_facets() -> @kernel.Thm {
  dodecahedron_facets_c.get()
}

///|
/// COPLANAR_HYPERPLANE_RULE
fn step_31() -> Unit raise {
  let t539 = @term_syntax.parse_term("(op_minus : (Cart[Real, 3], Cart[Real, 3]) -> Cart[Real, 3])")
  let mk_sub : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x542 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x543 : @kernel.Term) -> @kernel.Term raise {
      ((x540 : @kernel.Term, x541 : @kernel.Term) => @basics.mk_binop(t539, x540, x541))(x542, x543)
    }
  }
  let t544 = @term_syntax.parse_term("cross")
  let mk_cross : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x547 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x548 : @kernel.Term) -> @kernel.Term raise {
      ((x545 : @kernel.Term, x546 : @kernel.Term) => @basics.mk_binop(t544, x545, x546))(x547, x548)
    }
  }
  let t549 = @term_syntax.parse_term("(dot : (Cart[Real, 3], Cart[Real, 3]) -> Real)")
  let mk_dot : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x552 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x553 : @kernel.Term) -> @kernel.Term raise {
      ((x550 : @kernel.Term, x551 : @kernel.Term) => @basics.mk_binop(t549, x550, x551))(x552, x553)
    }
  }
  let zerovec_tm = @term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 3])([real_of_num(0), real_of_num(0), real_of_num(0)])")
  let template = @term_syntax.parse_term("∀ x : Cart[Real, 3], IN(x, (s : (Cart[Real, 3]) -> Bool)) → dot((n : Cart[Real, 3]), x) == (d : Real)")
  let s_tm = @term_syntax.parse_term("(s : (Cart[Real, 3]) -> Bool)")
  let n_tm = @term_syntax.parse_term("(n : Cart[Real, 3])")
  let d_tm = @term_syntax.parse_term("(d : Real)")
  let mk_normal : (@list.List[@kernel.Term]) -> @kernel.Term raise = fn(x554 : @list.List[@kernel.Term]) -> @kernel.Term raise {
    match x554 {
      More(x, tail=More(y, tail=More(z, tail=Empty))) => {
        let t555 = mk_sub(z)(x)
        mk_cross(mk_sub(y)(x))(t555)
      }
      _ => raise @lib.MatchFailure("tscript.ml:753")
    }
  }
  let eval_normal : (@list.List[@kernel.Term]) -> @kernel.Thm raise = fn(x556 : @list.List[@kernel.Term]) -> @kernel.Thm raise {
    let t_1 = x556
    let t557 = mk_normal(t_1)
    @equal.thenc(@equal.binop_conv(vector3_sub_conv), vector3_cross_conv)(t557)
  }
  let check_normal : (@list.List[@kernel.Term]) -> @kernel.Term raise = fn(x558 : @list.List[@kernel.Term]) -> @kernel.Term raise {
    let t_2 = x558
    let th = eval_normal(t_2)
    let n = @kernel.rand(@kernel.concl(th))
    if (n == zerovec_tm) {
      raise Failure("check_normal")
    } else {
      n
    }
  }
  coplanar_hyperplane_rule_c.set(fn(x559 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x559
    let s = @sets.dest_setenum(tm)
    if (Int::to_int64(@lib.length(s)) < 3L) {
      raise Failure("COPLANAR_HYPERPLANE_RULE: trivial")
    } else {
      let n_1 = @lib.tryfind(check_normal, allsets_l(3L, s))
      let t560 = @lib.hd(s)
      let d = @kernel.rand(@kernel.concl(vector3_dot_conv(mk_dot(n_1)(t560))))
      let ptm = @kernel.vsubst(@list.List([(tm, s_tm), (n_1, n_tm), (d, d_tm)]), template)
      let t566 = @simp.gen_rewrite_conv(fn(x563 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s564 = @equal.depth_conv(x563)
        fn(x565 : @kernel.Term) -> @kernel.Thm raise {
          s564(x565)
        }
      }, @list.List([@theorems.and_clauses()]))
      let t561 = @equal.thenc(@equal.land_conv(vector3_dot_conv), real_rat5_eq_conv)
      let t562 = @equal.depth_binop_conv(@term_syntax.parse_term("op_slash_bslash"), t561)
      @bool.eqt_elim(@equal.thenc(@equal.thenc(@simp.rewrite_conv(@list.List([@sets.forall_in_insert(), @sets.not_in_empty()])), t562), t566)(ptm))
    }
  })
}

///|
let coplanar_hyperplane_rule_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COPLANAR_HYPERPLANE_RULE")

///|
/// `COPLANAR_HYPERPLANE_RULE`
pub fn coplanar_hyperplane_rule(x : @kernel.Term) -> @kernel.Thm raise {
  (coplanar_hyperplane_rule_c.get())(x)
}

///|
fn[TA] allsets_l(x535 : Int64, x536 : @list.List[TA]) -> @list.List[@list.List[TA]] raise {
  let m = x535
  let l = x536
  if (m == 0L) {
    @list.List([@list.List([])])
  } else {
    match l {
      Empty => @list.List([])
      More(h, tail=t) => {
        let t538 = allsets_l(m, t)
        @lib.map(fn(x537 : @list.List[TA]) -> @list.List[TA] raise {
          let g = x537
          g.prepend(h)
        }, allsets_l(@lib.sub63(m, 1L), t)).concat(t538)
      }
    }
  }
}

///|
/// COMPUTE_FACES_1
fn step_32() -> Unit raise {
  let t983 = @simp.expand_tac("a")
  let t982 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @vectors.dot_radd(), @real.real_eq_add_lcancel_0(), @vectors.dot_eq_0()]))
  let t979 = @simp.gen_rewrite_rule(fn(x978 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x978
  }, @list.List([@sets.subset()]))
  let t975 = @term_syntax.parse_term("(x : Cart[Real, 3]) + (n : Cart[Real, 3])")
  let t981 = @tactics.first_x_assum(fn(x980 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x977 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s973 = @tactics.mp_tac(x972)
        fn(x974 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s973(x974)
        }
      })(((x976 : @kernel.Thm) => @bool.spec(t975, x976))(x977))
    })(t979(x980))
  })
  let t971 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @tactics.conv_tac(@int.int_reduce_conv)))
  let t970 = @simp.asm_simp_tac(@list.List([@convex.aff_dim_affine_inter_hyperplane(), @convex.affine_hyperplane(), @convex.aff_dim_hyperplane(), @cart.dimindex_3()]))
  let t968 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t969 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@convex.aff_dim_subset()), t968), @tactics.all_tac])
  let t967 = @tactics.exists_tac(@term_syntax.parse_term("aff_dim(INTER({(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)}, {(x : Cart[Real, 3]) | dot((n : Cart[Real, 3]), x) == (d : Real)}))"))
  let t966 = @tactics.match_mp_tac(@int.int_le_trans())
  let t965 = @simp.rewrite_tac(@list.List([@convex.aff_dim_convex_hull()]))
  let t960 = @term_syntax.parse_term("dot((a : Cart[Real, 3]), (x : Cart[Real, 3])) == (b : Real)")
  let t961 = @tactics.map_every(fn(x957 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s958 = @tactics.undisch_tac(x957)
    fn(x959 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s958(x959)
    }
  }, @list.List([@term_syntax.parse_term("cross((n : Cart[Real, 3]), (y : Cart[Real, 3]) - (x : Cart[Real, 3])) == (a : Cart[Real, 3])"), t960]))
  let t956 = @simp.asm_rewrite_tac(@list.List([@sets.in_inter(), @sets.in_elim_thm()]))
  let t955 = @tactics.match_mp_tac(@misc.hull_inc())
  let t954 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t962 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@convex.aff_dim_subset()), t954), @tactics.conj_tac), t955), t956), t961), @cross.vec3_tac)
  let t953 = @meson.asm_meson_tac(@list.List([@cross.cross_0(), @vectors.vector_sub_refl(), @int.int_le_refl()]))
  let t963 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@convex.aff_dim_2()])), t953), t962])
  let t952 = @tactics.exists_tac(@term_syntax.parse_term("aff_dim({(x : Cart[Real, 3]), (y : Cart[Real, 3])})"))
  let t964 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.int_le_trans()), t952), @tactics.conj_tac), t963)])
  let t984 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@equal.gsym(@int.int_le_antisym())])), @tactics.conj_tac), t964), t965), t966), t967), @tactics.conj_tac), t969), t970), t971), t981), t982), t983), @cross.vec3_tac)
  let t949 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t948 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_ge()]))
  let t947 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t946 = @simp.simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (P : (_) -> Bool)(x)) == SUBSET(s, {(x : _) | P(x)})"))]))
  let t945 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t950 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@polytope.face_of_inter_supporting_hyperplane_ge()), t945), t946), t947), t948), t949)
  let t944 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t943 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_le()]))
  let t942 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t941 = @simp.simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (P : (_) -> Bool)(x)) == SUBSET(s, {(x : _) | P(x)})"))]))
  let t940 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t951 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@polytope.face_of_inter_supporting_hyperplane_le()), t940), t941), t942), t943), t944), t950])
  let t939 = @tactics.first_x_assum(@tactics.disj_cases_tac)
  let t933 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_diff(), @sets.in_elim_thm(), @realax.real_gt(), @realarith.real_lt_le()]))
  let t932 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@realax.real_ge()])))
  let t931 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_gt()]))
  let t930 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t927 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")))
  let t929 = @tactics.first_x_assum(fn(x928 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t927(x928))
  })
  let t926 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(dot((a : Cart[Real, 3]), (q : Cart[Real, 3])) > (b : Real)) == IN(q, {(x : Cart[Real, 3]) | dot(a, x) > b})"))]))
  let t925 = @list.List([@calc_rat.asm_real_arith_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_gt())]))])
  let t934 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_lmul()), @tactics.conj_tac), t925), t926), t929), t930), t931), t932), t933)
  let t923 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t922 = @sets.set_tac(@list.List([]))
  let t921 = @simp.rewrite_tac(@list.List([@convex.convex_hyperplane()]))
  let t920 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t918 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")))
  let t924 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x919 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t918(x919))
  }), t920), t921), t922), t923])
  let t935 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN((p : Cart[Real, 3]), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"), fn(x915 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s916 = @tactics.mp_tac(x915)
    fn(x917 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s916(x917)
    }
  }), t924), t934])
  let t914 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (u : Real)) * (p : Real) == (real_of_num(1) - u) * (b : Real) && u * b < u * (q : Real) → (real_of_num(1) - u) * p + u * q > b")))
  let t936 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) > (y : Real) → !(x == y)"))), t914), @tactics.conj_tac), t935)
  let t911 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_diff(), @sets.in_elim_thm(), @realarith.real_lt_le()]))
  let t910 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_lt()]))
  let t909 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t906 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")))
  let t908 = @tactics.first_x_assum(fn(x907 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t906(x907))
  })
  let t905 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(dot((a : Cart[Real, 3]), (q : Cart[Real, 3])) < (b : Real)) == IN(q, {(x : Cart[Real, 3]) | dot(a, x) < b})"))]))
  let t912 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_lmul()), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t905), t908), t909), t910), t911)
  let t903 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t902 = @sets.set_tac(@list.List([]))
  let t901 = @simp.rewrite_tac(@list.List([@convex.convex_hyperplane()]))
  let t900 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t898 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")))
  let t904 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x899 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t898(x899))
  }), t900), t901), t902), t903])
  let t913 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN((p : Cart[Real, 3]), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"), fn(x895 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s896 = @tactics.mp_tac(x895)
    fn(x897 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s896(x897)
    }
  }), t904), t912])
  let t894 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (u : Real)) * (p : Real) == (real_of_num(1) - u) * (b : Real) && u * (q : Real) < u * b → (real_of_num(1) - u) * p + u * q < b")))
  let t937 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) < (y : Real) → !(x == y)"))), t894), @tactics.conj_tac), t913), t936])
  let t893 = @tactics.first_x_assum(@tactics.disj_cases_tac)
  let t892 = @simp.rewrite_tac(@list.List([@vectors.dot_radd(), @vectors.dot_rmul()]))
  let t891 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t890 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")))
  let t889 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - real_of_num(0), (p : Cart[Real, N])) + op_pct(real_of_num(0), (q : Cart[Real, N])) == p"))]))
  let t888 = @class.asm_cases_tac(@term_syntax.parse_term("(u : Real) == real_of_num(0)"))
  let t887 = @tactics.replicate_tac(4, @tactics.disch_tac)
  let t884 = @term_syntax.parse_term("(q : Cart[Real, 3])")
  let t885 = @term_syntax.parse_term("(u : Real)")
  let t886 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Cart[Real, 3])"), t885, t884]))
  let t883 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_inter(), @theorems.imp_conj(), @sets.forall_in_gspec()]))
  let t881 = @tactics.disch_then(fn(x878 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s879 = @tactics.subst1_tac(x878)
    fn(x880 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s879(x880)
    }
  })
  let t877 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t882 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@convex.convex_convex_hull(), @convex.convex_hull_eq_empty()])), t877), t881])
  let t870 = @drule.part_match(fn(x869 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x869))
  }, @convex.convex_hull_union_nonempty_explicit())
  let t864 = @simp.rewrite_tac(@list.List([@misc.hull_subset()]))
  let t863 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET(INTER((s : (_) -> Bool), (t : (_) -> Bool)), hull((P : ((_) -> Bool) -> Bool), INTER(s, t))) && SUBSET(DIFF(s, t), hull(P, DIFF(s, t))) → SUBSET(s, UNION(hull(P, INTER(s, t)), hull(P, DIFF(s, t))))")))
  let t862 = @tactics.match_mp_tac(@misc.hull_mono())
  let t865 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET(INTER(s, (u : (_) -> Bool)), INTER(t, u))"))), t862), t863), t864), @tactics.all_tac])
  let t861 = @tactics.exists_tac(@term_syntax.parse_term("INTER(hull(convex, UNION(hull(convex, INTER((s : (Cart[Real, 3]) -> Bool), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})), hull(convex, DIFF(s, {(x : Cart[Real, 3]) | dot(a, x) == b})))), {(x : Cart[Real, 3]) | dot(a, x) == b})"))
  let t860 = @tactics.match_mp_tac(@sets.subset_trans())
  let t858 = @sets.set_tac(@list.List([]))
  let t859 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → INTER(s, t) == s"))])), t858), @tactics.all_tac])
  let t857 = @class.asm_cases_tac(@term_syntax.parse_term("SUBSET((s : (Cart[Real, 3]) -> Bool), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"))
  let t855 = @simp.rewrite_tac(@list.List([@convex.convex_hull_eq(), @convex.convex_hyperplane()]))
  let t854 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → SUBSET(s, t)")))
  let t853 = @simp.simp_tac(@list.List([@misc.hull_mono(), @sets.inter_subset()]))
  let t852 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"))
  let t851 = @tactics.match_mp_tac(@sets.subset_trans())
  let t856 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@sets.subset_inter(), @misc.hull_mono(), @sets.inter_subset()])), t851), t852), t853), t854), t855), @tactics.all_tac])
  let t938 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_antisym()), @tactics.conj_tac), t856), t857), t859), t860), t861), @tactics.conj_tac), t865), fn(x876 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x875 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x873 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x872 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x871 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x866 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s867 = @tactics.mp_tac(x866)
              fn(x868 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s867(x868)
              }
            })(t870(x871))
          })(@equal.lhand(x872))
        })(@equal.lhand(x873))
      })((fn(x874 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x874.1
      })(x875))
    })(x876)(x876)
  }), @tactics.ants_tac), t882), t883), t886), t887), t888), t889), t890), t891), t892), t893), t937), @tactics.all_tac])
  let t850 = @tactics.subgoal_then(@term_syntax.parse_term("hull(convex, INTER((s : (Cart[Real, 3]) -> Bool), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})) == INTER(hull(convex, s), {(x : Cart[Real, 3]) | dot(a, x) == b})"), fn(x847 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s848 = @tactics.subst1_tac(x847)
    fn(x849 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s848(x849)
    }
  })
  let t985 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t850), t938), t939), t951), t984])
  let t846 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s844 = @tactics.assume_tac(x843)
    fn(x845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s844(x845)
    }
  }))
  let t842 = @tactics.repeat_tac(@pair.let_tac)
  let t840 = @term_syntax.parse_term("(y : Cart[Real, 3])")
  let t841 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Cart[Real, 3])"), t840]))
  let t986 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])), t841), t842), t846), @tactics.conj_tac), t985)
  let t835 = @simp.rewrite_tac(@list.List([@convex.convex_hull_eq(), @convex.convex_hyperplane()]))
  let t834 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → SUBSET(s, t)")))
  let t833 = @simp.simp_tac(@list.List([@misc.hull_mono(), @sets.inter_subset()]))
  let t832 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"))
  let t831 = @tactics.match_mp_tac(@sets.subset_trans())
  let t830 = @simp.asm_rewrite_tac(@list.List([]))
  let t829 = @simp.simp_tac(@list.List([@misc.hull_mono(), @sets.inter_subset()]))
  let t836 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.subset_inter()])), t829), t830), t831), t832), t833), t834), t835)
  let t828 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t827 = @simp.rewrite_tac(@list.List([@misc.hull_subset()]))
  let t826 = @tactics.exists_tac(@term_syntax.parse_term("hull(convex, (t : (Cart[Real, 3]) -> Bool))"))
  let t825 = @tactics.match_mp_tac(@sets.subset_trans())
  let t824 = @simp.asm_rewrite_tac(@list.List([]))
  let t823 = @simp.rewrite_tac(@list.List([@sets.subset_inter()]))
  let t837 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_mono()), t823), t824), t825), t826), t827), t828), t836])
  let t822 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t838 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x817 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x817
    @simp.gen_rewrite_tac(fn(x819 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s820 = @equal.land_conv(x819)
      fn(x821 : @kernel.Term) -> @kernel.Thm raise {
        s820(x821)
      }
    }, @list.List([@equal.sym(th_5)]))
  }), t822), @tactics.conj_tac), t837)
  let t814 = @tactics.match_mp_tac(@real.real_convex_bound_lt())
  let t813 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (b : Real) → a == b → false")))
  let t812 = @tactics.disch_then(@tactics.choose_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x809 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s810 = @tactics.mp_tac(x809)
    fn(x811 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s810(x811)
    }
  })))
  let t808 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2(), @vectors.dot_radd(), @vectors.dot_rmul(), @theorems.conj_assoc()]))
  let t807 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @theorems.right_exists_and_thm()]))
  let t806 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t815 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_segment(), @sets.in_elim_thm(), @theorems.left_and_exists_thm()])), t806), t807), t808), t812), t813), t814), @calc_rat.asm_real_arith_tac)
  let t805 = @simp.asm_simp_tac(@list.List([@topology.ends_in_segment(), @topology.connected_segment(), @realarith.real_lt_imp_le()]))
  let t803 = @term_syntax.parse_term("(u : Cart[Real, 3])")
  let t804 = @tactics.map_every(fn(x800 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s801 = @tactics.exists_tac(x800)
    fn(x802 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s801(x802)
    }
  }, @list.List([@term_syntax.parse_term("(v : Cart[Real, 3])"), t803]))
  let t799 = @tactics.match_mp_tac(@topology.connected_ivt_hyperplane())
  let t798 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t816 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t798), t799), t804), t805), t815])
  let t797 = @tactics.subgoal_then(@term_syntax.parse_term("∃ w : Cart[Real, 3], IN(w, segment([((u : Cart[Real, 3]), (v : Cart[Real, 3]))])) && IN(w, {(w : Cart[Real, 3]) | dot((a' : Cart[Real, 3]), w) == (b' : Real)})"), fn(x794 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s795 = @tactics.mp_tac(x794)
    fn(x796 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s795(x796)
    }
  })
  let t791 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t792 = @list.List([@simp.asm_simp_tac(@list.List([@misc.hull_inc()])), t791])
  let t790 = @tactics.subgoal_then(@term_syntax.parse_term("IN((u : Cart[Real, 3]), hull(convex, (s : (Cart[Real, 3]) -> Bool))) && IN((v : Cart[Real, 3]), hull(convex, s))"), fn(x787 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s788 = @tactics.mp_tac(x787)
    fn(x789 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s788(x789)
    }
  })
  let t786 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @real.real_lt_imp_ne()]))
  let t785 = @simp.asm_rewrite_tac(@list.List([]))
  let t784 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("((f : (_) -> Real)((x : _)) <= (b : Real) && !(f(x) == b)) == (IN(x, {(x : _) | f(x) <= b}) && !IN(x, {(x : _) | f(x) == b}))"))]))
  let t793 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_lt_le()])), t784), t785), t786), t790), t792), @tactics.all_tac])
  let t783 = @tactics.subgoal_then(@term_syntax.parse_term("dot((a' : Cart[Real, 3]), (u : Cart[Real, 3])) < (b' : Real) && dot(a', (v : Cart[Real, 3])) < b'"), fn(x780 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s781 = @tactics.assume_tac(x780)
    fn(x782 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s781(x782)
    }
  })
  let t777 = @term_syntax.parse_term("(v : Cart[Real, 3])")
  let t775 = @term_syntax.parse_term("(u : Cart[Real, 3])")
  let t779 = @tactics.disch_then(@tactics.conjuncts_then2((x776 : @kernel.Thm) => @tactics.x_choose_tac(t775, x776), (x778 : @kernel.Thm) => @tactics.x_choose_tac(t777, x778)))
  let t774 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp(), @realax.real_ge(), @real.real_not_le()]))
  let t839 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(p : Bool) && !(q : Bool) → false) → p || q"))), t774), t779), t783), t793), t797), t816), t838])
  let t773 = @tactics.disch_then(fn(x770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x770
    let t772 = @tactics.assume_tac(th_4)
    @tactics.then_tac(@tactics.subst_all_tac(th_4), t772)
  })
  let t769 = @tactics.disch_then(fn(x765 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x765
    let t768 = @tactics.mp_tac(@equal.sym(th_3))
    @tactics.then_tac(@tactics.disch_then(fn(x767 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    }), t768)
  })
  let t764 = @simp.asm_rewrite_tac(@list.List([@vectors.hyperplane_eq_empty(), @vectors.hyperplane_eq_univ()]))
  let t761 = @simp.gen_rewrite_rule(fn(x760 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x760
  }, @list.List([@determinants.subset_hyperplanes()]))
  let t763 = @tactics.first_x_assum(fn(x762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x757 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s758 = @tactics.mp_tac(x757)
      fn(x759 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s758(x759)
      }
    })(t761(x762))
  })
  let t753 = @simp.asm_simp_tac(@list.List([@misc.hull_inc()]))
  let t754 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()])), t753)
  let t752 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t751 = @simp.rewrite_tac(@list.List([@convex.affine_hyperplane()]))
  let t755 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_minimal()), t751), t752), t754])
  let t750 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(hull(affine, (s : (Cart[Real, 3]) -> Bool)), {(x : Cart[Real, 3]) | dot((n : Cart[Real, 3]), x) == (d : Real)})"), fn(x747 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s748 = @tactics.mp_tac(x747)
    fn(x749 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s748(x749)
    }
  })
  let t746 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == (d : Real) && (y : Real) == d → x == y")))
  let t744 = @simp.rewrite_tac(@list.List([@vectors.dot_sym()]))
  let t745 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@vectors.dot_radd()])), t744), @calc_rat.real_arith_tac)])
  let t743 = @tactics.subgoal_then(@term_syntax.parse_term("dot((n : Cart[Real, 3]), (x : Cart[Real, 3]) + (a' : Cart[Real, 3])) == dot(n, x)"), fn(x740 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s741 = @tactics.mp_tac(x740)
    fn(x742 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s741(x742)
    }
  })
  let t737 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t736 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t738 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_inc()), t736), t737])
  let t739 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, 3]), hull(convex, (t : (Cart[Real, 3]) -> Bool)))"), fn(x733 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s734 = @tactics.mp_tac(x733)
    fn(x735 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s734(x735)
    }
  }), t738), @tactics.all_tac])
  let t732 = @tactics.subgoal_then(@term_syntax.parse_term("dot((a' : Cart[Real, 3]), (x : Cart[Real, 3])) == (b' : Real)"), fn(x729 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s730 = @tactics.subst1_tac(x729)
    fn(x731 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s730(x731)
    }
  })
  let t727 = @simp.asm_rewrite_tac(@list.List([@real.real_eq_add_lcancel_0(), @vectors.dot_eq_0()]))
  let t728 = @list.List([@tactics.then_tac(@simp.expand_tac("a"), @cross.vec3_tac), @tactics.all_tac, t727])
  let t726 = @tactics.repeat_tac(@tactics.conj_tac)
  let t725 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @vectors.dot_radd()]))
  let t724 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (q : Bool) && !(r : Bool) → (p && q → r) → (s : Bool)")))
  let t720 = @term_syntax.parse_term("(x : Cart[Real, 3]) + (n : Cart[Real, 3])")
  let t723 = @tactics.disch_then(fn(x722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x717 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s718 = @tactics.mp_tac(x717)
      fn(x719 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s718(x719)
      }
    })(((x721 : @kernel.Thm) => @bool.spec(t720, x721))(x722))
  })
  let t714 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET(INTER((s : (_) -> Bool), (t : (_) -> Bool)), (u : (_) -> Bool)) → (∀ x : _, IN(x, s) && IN(x, t) → IN(x, u))")))
  let t716 = @tactics.first_x_assum(fn(x715 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x711 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s712 = @tactics.mp_tac(x711)
      fn(x713 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s712(x713)
      }
    })(t714(x715))
  })
  let t756 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @tactics.conv_tac(@int.int_reduce_conv))), t716), t723), t724), t725), t726), t728), t732), t739), t743), t745), t746), t750), t755)])
  let t710 = @simp.asm_rewrite_tac(@list.List([]))
  let t709 = @class.asm_cases_tac(@term_syntax.parse_term("SUBSET({(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)}, {(v : Cart[Real, 3]) | dot((a' : Cart[Real, 3]), v) == (b' : Real)})"))
  let t708 = @simp.asm_simp_tac(@list.List([@convex.aff_dim_affine_inter_hyperplane(), @convex.aff_dim_hyperplane(), @convex.affine_hyperplane(), @cart.dimindex_3(), @convex.affine_inter()]))
  let t705 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t704 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t706 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@misc.hull_inc())), t704), t705])
  let t703 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, 3]), hull(convex, (t : (Cart[Real, 3]) -> Bool))) && IN((y : Cart[Real, 3]), hull(convex, t))"), fn(x700 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s701 = @tactics.mp_tac(x700)
    fn(x702 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s701(x702)
    }
  })
  let t699 = @simp.asm_simp_tac(@list.List([]))
  let t698 = @simp.rewrite_tac(@list.List([@sets.subset_inter(), @sets.insert_subset(), @sets.empty_subset(), @sets.in_elim_thm()]))
  let t697 = @tactics.match_mp_tac(@convex.aff_dim_subset())
  let t696 = @simp.rewrite_tac(@list.List([@convex.aff_dim_affine_hull()]))
  let t695 = @tactics.first_x_assum(fn(x686 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x686
    @simp.gen_rewrite_tac(fn(x694 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x688 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s689 = @equal.land_conv(x688)
        fn(x690 : @kernel.Term) -> @kernel.Thm raise {
          s689(x690)
        }
      })((fn(x691 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s692 = @equal.rand_conv(x691)
        fn(x693 : @kernel.Term) -> @kernel.Thm raise {
          s692(x693)
        }
      })(x694))
    }, @list.List([@equal.sym(th_2)]))
  })
  let t707 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x683 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s684 = @equal.land_conv(x683)
    fn(x685 : @kernel.Term) -> @kernel.Thm raise {
      s684(x685)
    }
  }, @list.List([@equal.gsym(@convex.aff_dim_affine_hull())])), t695), t696), t697), t698), t699), t703), t706), @tactics.all_tac])
  let t682 = @tactics.subgoal_then(@term_syntax.parse_term("aff_dim((t : (Cart[Real, 3]) -> Bool)) <= aff_dim(INTER(INTER({(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)}, {(x : Cart[Real, 3]) | dot((a' : Cart[Real, 3]), x) == (b' : Real)}), {(x : Cart[Real, 3]) | dot((n : Cart[Real, 3]), x) == (d : Real)}))"), fn(x679 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s680 = @tactics.mp_tac(x679)
    fn(x681 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s680(x681)
    }
  })
  let t678 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@convex.affine_hull_convex_hull()])))
  let t674 = @tactics.then_tac(@tactics.ap_term_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([])))
  let t673 = @simp.asm_simp_tac(@list.List([@realax.real_ge(), @realax.real_le_refl()]))
  let t675 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.subset(), @sets.in_elim_thm()]))), t673), t674]))
  let t672 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t671 = @simp.rewrite_tac(@list.List([@convex.affine_hyperplane()]))
  let t670 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t669 = @tactics.first_x_assum(fn(x664 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x664
    @simp.gen_rewrite_tac(fn(x666 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s667 = @equal.land_conv(x666)
      fn(x668 : @kernel.Term) -> @kernel.Thm raise {
        s667(x668)
      }
    }, @list.List([@equal.sym(th_1)]))
  })
  let t663 = @simp.rewrite_tac(@list.List([@misc.hull_subset()]))
  let t662 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, (s : (Cart[Real, 3]) -> Bool))"))
  let t676 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_trans()), t662), t663), t669), t670), t671), t672), t675])
  let t661 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((s : (Cart[Real, 3]) -> Bool), {(x : Cart[Real, 3]) | dot((a : Cart[Real, 3]), x) == (b : Real)})"), fn(x658 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s659 = @tactics.assume_tac(x658)
    fn(x660 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s659(x660)
    }
  })
  let t657 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("((s : (_) -> Bool) == INTER(s, (t : (_) -> Bool))) == SUBSET(s, t)"))]))
  let t656 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@convex.affine_hull_convex_hull()])))
  let t655 = @tactics.undisch_then(@term_syntax.parse_term("hull(convex, (t : (Cart[Real, 3]) -> Bool)) == hull(convex, (s : (Cart[Real, 3]) -> Bool))"), fn(x652 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x652
    let t654 = @tactics.assume_tac(th)
    @tactics.then_tac(@tactics.subst_all_tac(th), t654)
  })
  let t650 = @simp.gen_rewrite_rule(fn(x647 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s648 = @equal.rand_conv(x647)
    fn(x649 : @kernel.Term) -> @kernel.Thm raise {
      s648(x649)
    }
  }, @list.List([@equal.gsym(@convex.affine_hull_convex_hull())]))
  let t677 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x651 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s645 = @tactics.assume_tac(x644)
      fn(x646 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s645(x646)
      }
    })(t650(x651))
  }), t655), t656), t657), @tactics.strip_tac), t661), t676), @tactics.strip_tac])
  let t643 = @simp.asm_rewrite_tac(@list.List([]))
  let t642 = @class.asm_cases_tac(@term_syntax.parse_term("hull(convex, (t : (Cart[Real, 3]) -> Bool)) == hull(convex, (s : (Cart[Real, 3]) -> Bool))"))
  let t640 = @simp.asm_rewrite_tac(@list.List([]))
  let t639 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t638 = @tactics.match_mp_tac(@misc.hull_inc())
  let t637 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 3])"))
  let t641 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty())])), t637), t638), t639), t640])
  let t636 = @tactics.subgoal_then(@term_syntax.parse_term("!(hull(convex, (t : (Cart[Real, 3]) -> Bool)) == {})"), fn(x633 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s634 = @tactics.assume_tac(x633)
    fn(x635 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s634(x635)
    }
  })
  let t631 = @term_syntax.parse_term("(b' : Real)")
  let t632 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a' : Cart[Real, 3])"), t631]))
  let t630 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t629 = @simp.asm_simp_tac(@list.List([@polytope.polyhedron_convex_hull(), @polytope.exposed_face_of_parallel()]))
  let t627 = @term_syntax.parse_term("hull(convex, (t : (Cart[Real, 3]) -> Bool))")
  let t628 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("hull(convex, (s : (Cart[Real, 3]) -> Bool))"), t627]), @polytope.exposed_face_of_polyhedron()))
  let t625 = @term_syntax.parse_term("dot((a : Cart[Real, 3]), (x : Cart[Real, 3])) == (b : Real)")
  let t626 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x622 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s623 = @tactics.undisch_tac(x622)
    fn(x624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s623(x624)
    }
  }, @list.List([@term_syntax.parse_term("cross((n : Cart[Real, 3]), (y : Cart[Real, 3]) - (x : Cart[Real, 3])) == (a : Cart[Real, 3])"), t625])), @cross.vec3_tac), @tactics.all_tac])
  let t621 = @tactics.subgoal_then(@term_syntax.parse_term("dot((a : Cart[Real, 3]), (y : Cart[Real, 3])) == (b : Real)"), fn(x618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s619 = @tactics.assume_tac(x618)
    fn(x620 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s619(x620)
    }
  })
  let t617 = @simp.asm_simp_tac(@list.List([@vectors.dot_rsub(), @vectors.vector_sub_eq(), @realarith.real_sub_0()]))
  let t615 = @term_syntax.parse_term("(y : Cart[Real, 3]) - (x : Cart[Real, 3])")
  let t616 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Cart[Real, 3])"), t615]), @cross.norm_and_cross_eq_0()))
  let t614 = @tactics.repeat_tac(@pair.let_tac)
  let t613 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t612 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, 3]), (s : (Cart[Real, 3]) -> Bool)) && IN((y : Cart[Real, 3]), s)"), @tactics.strip_assume_tac)
  let t611 = @tactics.replicate_tac(2, @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])))
  let t609 = @term_syntax.parse_term("(y : Cart[Real, 3])")
  let t610 = @tactics.map_every(fn(x606 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s607 = @tactics.exists_tac(x606)
    fn(x608 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s607(x608)
    }
  }, @list.List([@term_syntax.parse_term("(x : Cart[Real, 3])"), t609]))
  let t605 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x599 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s600 = @tactics.assume_tac(x599)
    fn(x601 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s600(x601)
    }
  }, fn(x602 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s603 = @tactics.subst_all_tac(x602)
    fn(x604 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s603(x604)
    }
  }))
  let t597 = @term_syntax.parse_term("(y : Cart[Real, 3])")
  let t598 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Cart[Real, 3])"), t597]))
  let t596 = @simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t595 = @tactics.conv_tac(@equal.land_conv(@sets.has_size_conv))
  let t592 = @meson.asm_meson_tac(@list.List([@convex.aff_dim_unique()]))
  let t593 = @list.List([@meson.asm_meson_tac(@list.List([@convex.aff_dim_affine_hull()])), t592])
  let t591 = @tactics.match_mp_tac(@int.int_arith(@term_syntax.parse_term("aff_dim((u : (Cart[Real, 3]) -> Bool)) == int_of_num(1) && aff_dim(u) == int_of_num(CARD(u)) - int_of_num(1) → int_of_num(CARD(u)) == int_of_num(2)")))
  let t590 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_eq())]))
  let t594 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@sets.has_size(), @convex.affine_independent_imp_finite()])), t590), t591), @tactics.conj_tac), t593), @tactics.all_tac])
  let t589 = @tactics.subgoal_then(@term_syntax.parse_term("HAS_SIZE((u : (Cart[Real, 3]) -> Bool), 2)"), fn(x586 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s587 = @tactics.mp_tac(x586)
    fn(x588 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s587(x588)
    }
  })
  let t585 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t584 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(t : (Cart[Real, 3]) -> Bool)"), @convex.affine_basis_exists()))
  let t583 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@convex.aff_dim_convex_hull()])))
  let t582 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x576 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s577 = @tactics.assume_tac(x576)
    fn(x578 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s577(x578)
    }
  }, fn(x579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s580 = @tactics.subst_all_tac(x579)
    fn(x581 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s580(x581)
    }
  }))
  let t574 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : (Cart[Real, 3]) -> Bool)"))(fn(x571 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s572 = @tactics.mp_tac(x571)
    fn(x573 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s572(x573)
    }
  }))
  let t570 = @simp.asm_simp_tac(@list.List([@topology.finite_imp_compact()]))
  let t575 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@polytope.face_of_convex_hull_subset()), t570), t574])
  let t987 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.strip_tac, @tactics.subgoal_then(@term_syntax.parse_term("∃ t : (Cart[Real, 3]) -> Bool, SUBSET(t, (s : (Cart[Real, 3]) -> Bool)) && (f : (Cart[Real, 3]) -> Bool) == hull(convex, t)"), fn(x567 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s568 = @tactics.mp_tac(x567)
    fn(x569 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s568(x569)
    }
  })), t575), t582), t583), t584), t585), t589), t594), t595), t596), t598), t605), t610), t611), t612), t613), t614), t616), t617), @tactics.disch_tac), t621), t626), t628), t629), t630), t632), t636), t641), t642), t643), t677), t678), t682), t707), t708), t709), t710), t756), t763), t764), t769), t773), @tactics.conj_tac), t839), t986])
  let t988 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @tactics.strip_tac), @tactics.gen_tac), @tactics.eq_tac), t987)
  compute_faces_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, 3]) -> Bool, ∀ n : Cart[Real, 3], ∀ d : Real, (∀ x : Cart[Real, 3], IN(x, s) → dot(n, x) == d) → FINITE(s) && !(n == vec(0)) → (∀ f : (Cart[Real, 3]) -> Bool, (face_of(f, hull(convex, s)) && aff_dim(f) == int_of_num(1)) == (∃ x : Cart[Real, 3], ∃ y : Cart[Real, 3], IN(x, s) && IN(y, s) && LET((a : Cart[Real, 3]) => LET_END(!(a == vec(0)) && LET((b : Real) => LET_END(((∀ w : Cart[Real, 3], IN(w, s) → dot(a, w) <= b) || (∀ w : Cart[Real, 3], IN(w, s) → dot(a, w) >= b)) && f == hull(convex, INTER(s, {(x : Cart[Real, 3]) | dot(a, x) == b}))), dot(a, x))), cross(n, y - x))))"), t988))
}

///|
let compute_faces_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPUTE_FACES_1")

///|
/// `COMPUTE_FACES_1`
pub fn compute_faces_1() -> @kernel.Thm {
  compute_faces_1_c.get()
}

///|
/// COMPUTE_EDGES_CONV
fn step_33() -> Unit raise {
  let t989 = @tactics.then_tac(@class.cond_cases_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([])))
  let lemma = @tactics.prove(@term_syntax.parse_term("INTER(INSERT((x : _), (s : (_) -> Bool)), {(x : _) | (P : (_) -> Bool)(x)}) == (if P(x) { INSERT(x, INTER(s, {(x : _) | P(x)})) } else { INTER(s, {(x : _) | P(x)}) })"), t989)
  compute_edges_conv_c.set(fn(x990 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x990
    let t991 = coplanar_hyperplane_rule(tm)
    let th1 = @drule.match_mp(compute_faces_1())(t991)
    let t996 = @simp.gen_rewrite_conv(fn(x995 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x995
    }, @list.List([@theorems.and_clauses()]))
    let t993 = @simp.gen_rewrite_conv(fn(x992 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x992
    }, @list.List([@class.not_clauses()]))
    let t994 = @equal.thenc(@equal.rand_conv(vector3_eq_0_conv), t993)
    let th2 = @bool.mp(@equal.conv_rule(@equal.land_conv(@equal.thenc(@equal.comb2_conv(@equal.rand_conv(@simp.pure_rewrite_conv(@list.List([@sets.finite_insert(), @sets.finite_empty()]))), t994), t996)), th1), @bool.truth())
    let t1014 = @simp.rewrite_conv(@list.List([@theorems.disj_aci()]))
    let t1013 = @simp.rewrite_conv(@list.List([@sets.insert_ac()]))
    let t1012 = @simp.rewrite_conv(@list.List([@sets.inter_empty()]))
    let t1010 = @simp.rewrite_conv(@list.List([]))
    let t1009 = @equal.once_depth_conv(@equal.thenc(@equal.land_conv(vector3_dot_conv), real_rat5_eq_conv))
    let t1011 = @equal.repeatc(@equal.changed_conv(@equal.thenc(@equal.thenc(@simp.once_rewrite_conv(@list.List([lemma])), t1009), t1010)))
    let t1008 = @simp.rewrite_conv(@list.List([@theorems.disj_aci()]))
    let t1007 = @simp.rewrite_conv(@list.List([@sets.insert_ac()]))
    let t1006 = @equal.once_depth_conv(real_rat5_le_conv)
    let t1005 = @equal.once_depth_conv(@pair.let_conv)
    let t1004 = @equal.once_depth_conv(vector3_dot_conv)
    let t1003 = @simp.rewrite_conv(@list.List([@realax.real_ge()]))
    let t1002 = @equal.once_depth_conv(vector3_eq_0_conv)
    let t1001 = @equal.once_depth_conv(@pair.let_conv)
    let t1000 = @equal.once_depth_conv(vector3_cross_conv)
    let t999 = @equal.once_depth_conv(vector3_sub_conv)
    let t998 = @simp.rewrite_conv(@list.List([@sets.forall_in_insert(), @sets.not_in_empty()]))
    let t997 = @simp.rewrite_conv(@list.List([@sets.exists_in_insert(), @sets.not_in_empty()]))
    @equal.conv_rule(@equal.binder_conv(@equal.rand_conv(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@equal.thenc(@simp.rewrite_conv(@list.List([@theorems.right_exists_and_thm()])), t997), t998), t999), t1000), t1001), t1002), t1003), t1004), t1005), t1006), t1007), t1008), t1011), t1012), t1013), t1014))), th2)
  })
}

///|
let compute_edges_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("COMPUTE_EDGES_CONV")

///|
/// `COMPUTE_EDGES_CONV`
pub fn compute_edges_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (compute_edges_conv_c.get())(x)
}

///|
/// CARD_EQ_LEMMA
fn step_34() -> Unit raise {
  let t1016 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert()]))
  let t1015 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1017 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.has_size()])), t1015), t1016), @int.asm_arith_tac)
  card_eq_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : _, ∀ s : (_) -> Bool, ∀ n : Num, 0 < n && !IN(x, s) && HAS_SIZE(s, n - 1) → HAS_SIZE(INSERT(x, s), n)"), t1017))
}

///|
let card_eq_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_LEMMA")

///|
/// `CARD_EQ_LEMMA`
pub fn card_eq_lemma() -> @kernel.Thm {
  card_eq_lemma_c.get()
}

///|
/// `EDGES_PER_FACE_TAC`
pub fn edges_per_face_tac(x1018 : @kernel.Thm) -> @tactics.Tactic raise {
  let th = x1018
  let t1051 = @simp.rewrite_tac(@list.List([@bool.conjunct1(@sets.has_size_clauses())]))
  let t1050 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1046 = @simp.rewrite_tac(@list.List([]))
  let t1045 = @tactics.conv_tac(@equal.once_depth_conv(vector3_eq_0_conv))
  let t1044 = @tactics.conv_tac(@equal.once_depth_conv(vector3_sub_conv))
  let t1043 = @simp.pure_once_rewrite_tac(@list.List([@equal.gsym(@vectors.vector_sub_eq())]))
  let t1042 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!((a : _) == (c : _) && (b : _) == (d : _)) && !(a == d && b == c) && !(a == b && c == d) → !({a, b} == {c, d})")))
  let t1041 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1047 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @convex.segment_eq(), @class.de_morgan_thm()])), t1041), t1042), t1043), t1044), t1045), t1046), @tactics.no_tac)
  let t1048 = @list.List([@tactics.then_tac(@tactics.conv_tac(@calc_num.num_reduce_conv), @tactics.no_tac), t1047, @tactics.all_tac])
  let t1040 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1049 = @tactics.repeat_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(card_eq_lemma()), t1040), t1048))
  let t1039 = @tactics.match_mp_tac(@meson.meson(@list.List([@sets.has_size()]), @term_syntax.parse_term("HAS_SIZE((s : (_) -> Bool), (n : Num)) → CARD(s) == n")))
  let t1038 = @simp.rewrite_tac(@list.List([@equal.gsym(@convex.segment_convex_hull())]))
  let t1036 = @sets.set_rule(@term_syntax.parse_term("{(x : _) | IN(x, (s : (_) -> Bool))} == s"))
  let t1037 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.in_insert()), t1036]))
  let t1035 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("((x : _) == (a : _) || x == (b : _)) == IN(x, {a, b})"))]))
  let t1031 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x1028 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1029 = @tactics.subst1_tac(x1028)
    fn(x1030 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1029(x1030)
    }
  }))
  let t1027 = @simp.asm_rewrite_tac(@list.List([]))
  let t1026 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(f : (Cart[Real, 3]) -> Bool)"), th))
  let t1024 = @meson.asm_meson_tac(@list.List([@polytope.face_of_face(), @polytope.face_of_trans(), @polytope.face_of_imp_subset()]))
  let t1023 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1025 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.gen_rewrite_tac(fn(x1022 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1022
  }, @list.List([@sets.extension()]))), t1023), t1024), @tactics.all_tac])
  let t1021 = @tactics.exists_tac(@term_syntax.parse_term("CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, (f : (Cart[Real, 3]) -> Bool)) && aff_dim(e) == int_of_num(1)})"))
  let t1020 = @tactics.match_mp_tac(@theorems.eq_trans())
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1020), t1021), @tactics.conj_tac), t1025), t1026), t1027), t1031), fn(x1034 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1032 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (_, w) = x1032
      @simp.rewrite_tac(@list.List([compute_edges_conv(@basics.find_term(@sets.is_setenum, w))]))
    })(x1034)(x1034)
  }), t1035), t1037), t1038), t1039), t1049), t1050), t1051)
}

///|
/// TETRAHEDRON_EDGES_PER_FACE
fn step_35() -> Unit raise {
  let t1052 = edges_per_face_tac(tetrahedron_facets())
  tetrahedron_edges_per_face_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, face_of(f, std_tetrahedron) && aff_dim(f) == int_of_num(2) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, std_tetrahedron) && aff_dim(e) == int_of_num(1) && SUBSET(e, f)}) == 3"), t1052))
}

///|
let tetrahedron_edges_per_face_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TETRAHEDRON_EDGES_PER_FACE")

///|
/// `TETRAHEDRON_EDGES_PER_FACE`
pub fn tetrahedron_edges_per_face() -> @kernel.Thm {
  tetrahedron_edges_per_face_c.get()
}

///|
/// CUBE_EDGES_PER_FACE
fn step_36() -> Unit raise {
  let t1053 = edges_per_face_tac(cube_facets())
  cube_edges_per_face_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, face_of(f, std_cube) && aff_dim(f) == int_of_num(2) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, std_cube) && aff_dim(e) == int_of_num(1) && SUBSET(e, f)}) == 4"), t1053))
}

///|
let cube_edges_per_face_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBE_EDGES_PER_FACE")

///|
/// `CUBE_EDGES_PER_FACE`
pub fn cube_edges_per_face() -> @kernel.Thm {
  cube_edges_per_face_c.get()
}

///|
/// OCTAHEDRON_EDGES_PER_FACE
fn step_37() -> Unit raise {
  let t1054 = edges_per_face_tac(octahedron_facets())
  octahedron_edges_per_face_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, face_of(f, std_octahedron) && aff_dim(f) == int_of_num(2) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, std_octahedron) && aff_dim(e) == int_of_num(1) && SUBSET(e, f)}) == 3"), t1054))
}

///|
let octahedron_edges_per_face_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OCTAHEDRON_EDGES_PER_FACE")

///|
/// `OCTAHEDRON_EDGES_PER_FACE`
pub fn octahedron_edges_per_face() -> @kernel.Thm {
  octahedron_edges_per_face_c.get()
}

///|
/// DODECAHEDRON_EDGES_PER_FACE
fn step_38() -> Unit raise {
  let t1055 = edges_per_face_tac(dodecahedron_facets())
  dodecahedron_edges_per_face_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, face_of(f, std_dodecahedron) && aff_dim(f) == int_of_num(2) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, std_dodecahedron) && aff_dim(e) == int_of_num(1) && SUBSET(e, f)}) == 5"), t1055))
}

///|
let dodecahedron_edges_per_face_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DODECAHEDRON_EDGES_PER_FACE")

///|
/// `DODECAHEDRON_EDGES_PER_FACE`
pub fn dodecahedron_edges_per_face() -> @kernel.Thm {
  dodecahedron_edges_per_face_c.get()
}

///|
/// ICOSAHEDRON_EDGES_PER_FACE
fn step_39() -> Unit raise {
  let t1056 = edges_per_face_tac(icosahedron_facets())
  icosahedron_edges_per_face_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Bool, face_of(f, std_icosahedron) && aff_dim(f) == int_of_num(2) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, std_icosahedron) && aff_dim(e) == int_of_num(1) && SUBSET(e, f)}) == 3"), t1056))
}

///|
let icosahedron_edges_per_face_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ICOSAHEDRON_EDGES_PER_FACE")

///|
/// `ICOSAHEDRON_EDGES_PER_FACE`
pub fn icosahedron_edges_per_face() -> @kernel.Thm {
  icosahedron_edges_per_face_c.get()
}

///|
/// POLYTOPE_3D_LEMMA
fn step_40() -> Unit raise {
  let t1082 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @calc_num.arith()]))
  let t1081 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty()]))
  let t1080 = @simp.asm_simp_tac(@list.List([@convex.aff_dim_affine_independent()]))
  let t1079 = @simp.rewrite_tac(@list.List([@convex.collinear_3_eq_affine_dependent(), @sets.insert_ac(), @class.de_morgan_thm()]))
  let t1078 = @simp.rewrite_tac(@list.List([@cross.cross_eq_0(), @equal.gsym(@vectors.collinear_3())]))
  let t1077 = @simp.expand_tac("a")
  let t1083 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!((a : Cart[Real, 3]) == vec(0))")), t1077), t1078), t1079), @tactics.strip_tac), t1080), t1081), t1082), @int.int_arith_tac)
  let t1075 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1074 = @simp.expand_tac("a")
  let t1073 = @tactics.undisch_tac(@term_syntax.parse_term("!((a : Cart[Real, 3]) == vec(0))"))
  let t1072 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset(), @sets.in_elim_thm()]))
  let t1071 = @simp.rewrite_tac(@list.List([@convex.affine_hyperplane()]))
  let t1070 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t1068 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(x, t)")))
  let t1076 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1069 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1068(x1069))
  }), t1070), t1071), t1072), t1073), t1074), @cross.vec3_tac), t1075])
  let t1084 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN((w : Cart[Real, 3]), {(w : Cart[Real, 3]) | dot((a : Cart[Real, 3]), w) == dot(a, (x : Cart[Real, 3]))})"), fn(x1065 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1066 = @tactics.mp_tac(x1065)
    fn(x1067 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1066(x1067)
    }
  }), t1076), t1083])
  let t1064 = @simp.once_rewrite_tac(@list.List([@convex.aff_dim_insert()]))
  let t1062 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1063 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(@convex.aff_dim_subset()), t1062)])
  let t1061 = @tactics.exists_tac(@term_syntax.parse_term("aff_dim({(w : Cart[Real, 3]), (x : Cart[Real, 3]), (y : Cart[Real, 3]), (z : Cart[Real, 3])})"))
  let t1060 = @tactics.match_mp_tac(@int.int_le_trans())
  let t1059 = @simp.rewrite_tac(@list.List([@convex.aff_dim_convex_hull()]))
  let t1058 = @list.List([@simp.rewrite_tac(@list.List([@equal.gsym(@cart.dimindex_3()), @convex.aff_dim_le_univ()])), @tactics.all_tac])
  let t1057 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_le_antisym())]))
  let t1085 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @pair.let_tac), @tactics.strip_tac), t1057), @tactics.conj_tac), t1058), t1059), t1060), t1061), @tactics.conj_tac), t1063), t1064), @class.cond_cases_tac), t1084)
  polytope_3d_lemma_c.set(@tactics.prove(@term_syntax.parse_term("LET((a : Cart[Real, 3]) => LET_END(!(a == vec(0)) && (∃ w : Cart[Real, 3], IN(w, (s : (Cart[Real, 3]) -> Bool)) && !(dot(a, w) == dot(a, (x : Cart[Real, 3]))))), cross((z : Cart[Real, 3]) - x, (y : Cart[Real, 3]) - x)) → aff_dim(hull(convex, INSERT(x, INSERT(y, INSERT(z, s))))) == int_of_num(3)"), t1085))
}

///|
let polytope_3d_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POLYTOPE_3D_LEMMA")

///|
/// `POLYTOPE_3D_LEMMA`
pub fn polytope_3d_lemma() -> @kernel.Thm {
  polytope_3d_lemma_c.get()
}

///|
/// POLYTOPE_FULLDIM_TAC
fn step_41() -> Unit raise {
  let t1093 = @simp.rewrite_tac(@list.List([]))
  let t1092 = @tactics.conv_tac(@equal.once_depth_conv(real_rat5_eq_conv))
  let t1091 = @tactics.conv_tac(@equal.once_depth_conv(vector3_dot_conv))
  let t1090 = @simp.rewrite_tac(@list.List([@sets.exists_in_insert(), @sets.not_in_empty()]))
  let t1094 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.once_depth_conv(vector3_dot_conv)), t1090), t1091), t1092), t1093)
  let t1089 = @simp.rewrite_tac(@list.List([]))
  let t1095 = @list.List([@tactics.then_tac(@tactics.conv_tac(@equal.rand_conv(vector3_eq_0_conv)), t1089), t1094])
  let t1088 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t1087 = @tactics.conv_tac(@equal.once_depth_conv(vector3_cross_conv))
  let t1086 = @tactics.conv_tac(@equal.once_depth_conv(vector3_sub_conv))
  polytope_fulldim_tac_c.set(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(polytope_3d_lemma()), t1086), t1087), t1088), @tactics.conj_tac), t1095))
}

///|
let polytope_fulldim_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("POLYTOPE_FULLDIM_TAC")

///|
/// `POLYTOPE_FULLDIM_TAC`
pub fn polytope_fulldim_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (polytope_fulldim_tac_c.get())(x)
}

///|
/// STD_TETRAHEDRON_FULLDIM
fn step_42() -> Unit raise {
  let t1096 = @tactics.then_tac(@simp.rewrite_tac(@list.List([std_tetrahedron()])), polytope_fulldim_tac)
  std_tetrahedron_fulldim_c.set(@tactics.prove(@term_syntax.parse_term("aff_dim(std_tetrahedron) == int_of_num(3)"), t1096))
}

///|
let std_tetrahedron_fulldim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STD_TETRAHEDRON_FULLDIM")

///|
/// `STD_TETRAHEDRON_FULLDIM`
pub fn std_tetrahedron_fulldim() -> @kernel.Thm {
  std_tetrahedron_fulldim_c.get()
}

///|
/// STD_CUBE_FULLDIM
fn step_43() -> Unit raise {
  let t1097 = @tactics.then_tac(@simp.rewrite_tac(@list.List([std_cube()])), polytope_fulldim_tac)
  std_cube_fulldim_c.set(@tactics.prove(@term_syntax.parse_term("aff_dim(std_cube) == int_of_num(3)"), t1097))
}

///|
let std_cube_fulldim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STD_CUBE_FULLDIM")

///|
/// `STD_CUBE_FULLDIM`
pub fn std_cube_fulldim() -> @kernel.Thm {
  std_cube_fulldim_c.get()
}

///|
/// STD_OCTAHEDRON_FULLDIM
fn step_44() -> Unit raise {
  let t1098 = @tactics.then_tac(@simp.rewrite_tac(@list.List([std_octahedron()])), polytope_fulldim_tac)
  std_octahedron_fulldim_c.set(@tactics.prove(@term_syntax.parse_term("aff_dim(std_octahedron) == int_of_num(3)"), t1098))
}

///|
let std_octahedron_fulldim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STD_OCTAHEDRON_FULLDIM")

///|
/// `STD_OCTAHEDRON_FULLDIM`
pub fn std_octahedron_fulldim() -> @kernel.Thm {
  std_octahedron_fulldim_c.get()
}

///|
/// STD_DODECAHEDRON_FULLDIM
fn step_45() -> Unit raise {
  let t1099 = @tactics.then_tac(@simp.rewrite_tac(@list.List([std_dodecahedron_v1()])), polytope_fulldim_tac)
  std_dodecahedron_fulldim_c.set(@tactics.prove(@term_syntax.parse_term("aff_dim(std_dodecahedron) == int_of_num(3)"), t1099))
}

///|
let std_dodecahedron_fulldim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STD_DODECAHEDRON_FULLDIM")

///|
/// `STD_DODECAHEDRON_FULLDIM`
pub fn std_dodecahedron_fulldim() -> @kernel.Thm {
  std_dodecahedron_fulldim_c.get()
}

///|
/// STD_ICOSAHEDRON_FULLDIM
fn step_46() -> Unit raise {
  let t1100 = @tactics.then_tac(@simp.rewrite_tac(@list.List([std_icosahedron_v1()])), polytope_fulldim_tac)
  std_icosahedron_fulldim_c.set(@tactics.prove(@term_syntax.parse_term("aff_dim(std_icosahedron) == int_of_num(3)"), t1100))
}

///|
let std_icosahedron_fulldim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STD_ICOSAHEDRON_FULLDIM")

///|
/// `STD_ICOSAHEDRON_FULLDIM`
pub fn std_icosahedron_fulldim() -> @kernel.Thm {
  std_icosahedron_fulldim_c.get()
}

///|
/// `COMPUTE_EDGES_TAC`
pub fn compute_edges_tac(x1101 : @kernel.Thm, x1102 : @kernel.Thm, x1103 : @kernel.Thm) -> @tactics.Tactic raise {
  let defn = x1101
  let fulldim = x1102
  let facets = x1103
  let t1133 = @simp.rewrite_tac(@list.List([@theorems.disj_aci()]))
  let t1132 = @simp.rewrite_tac(@list.List([@sets.insert_ac()]))
  let t1131 = @tactics.conv_tac(@equal.land_conv(@equal.depth_binop_conv(@term_syntax.parse_term("op_bslash_slash"), fn(x1130 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x1130
    @simp.rewr_conv(compute_edges_conv(@kernel.rand(@kernel.rand(@equal.lhand(tm)))))(tm)
  })))
  let t1129 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @theorems.unwind_thm2()]))
  let t1128 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)"))]))
  let t1134 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([facets])), t1128), t1129), t1131), t1132), t1133)
  let t1125 = @meson.asm_meson_tac(@list.List([@polytope.face_of_face()]))
  let t1124 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1123 = @simp.rewrite_tac(@list.List([fulldim]))
  let t1122 = @simp.rewrite_tac(@list.List([@polytope.facet_of()]))
  let t1126 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t1122), t1123), t1124), t1125)
  let t1119 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1118 = @simp.asm_rewrite_tac(@list.List([fulldim, @convex.aff_dim_empty()]))
  let t1115 = @term_syntax.parse_term("(aff_dim : ((Cart[Real, 3]) -> Bool) -> Int)")
  let t1120 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.disch_then(fn(x1117 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1112 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1113 = @tactics.mp_tac(x1112)
      fn(x1114 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1113(x1114)
      }
    })(((x1116 : @kernel.Thm) => @equal.ap_term(t1115, x1116))(x1117))
  })), t1118), t1119)
  let t1111 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t1110 = @tactics.match_mp_tac(@polytope.polyhedron_convex_hull())
  let t1121 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([defn])), t1110), t1111), t1120])
  let t1127 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.conj_tac), t1121), t1126])
  let t1108 = @term_syntax.parse_term("(e : (Cart[Real, 3]) -> Bool)")
  let t1109 = @tactics.mp_tac(@bool.ispecl(@list.List([@equal.lhs(@kernel.concl(defn)), t1108]), @polytope.face_of_polyhedron_subset_facet()))
  let t1135 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.eq_tac, @list.List([@tactics.strip_tac, @meson.meson_tac(@list.List([@polytope.face_of_trans()]))])), t1109), @tactics.ants_tac), t1127), t1134])
  let t1106 = @term_syntax.parse_term("∃ f : (Cart[Real, 3]) -> Bool, (face_of(f, (p : (Cart[Real, 3]) -> Bool)) && aff_dim(f) == int_of_num(2)) && face_of((e : (Cart[Real, 3]) -> Bool), f) && aff_dim(e) == int_of_num(1)")
  let t1105 = @term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)")
  let t1107 = @tactics.exists_tac(@kernel.vsubst(@list.List([(@equal.lhs(@kernel.concl(defn)), t1105)]), t1106))
  @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@theorems.eq_trans())), t1107), @tactics.conj_tac), t1135)
}

///|
/// TETRAHEDRON_EDGES
fn step_47() -> Unit raise {
  let t1136 = compute_edges_tac(std_tetrahedron(), std_tetrahedron_fulldim(), tetrahedron_facets())
  tetrahedron_edges_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : (Cart[Real, 3]) -> Bool, (face_of(e, std_tetrahedron) && aff_dim(e) == int_of_num(1)) == (e == hull(convex, {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}))"), t1136))
}

///|
let tetrahedron_edges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TETRAHEDRON_EDGES")

///|
/// `TETRAHEDRON_EDGES`
pub fn tetrahedron_edges() -> @kernel.Thm {
  tetrahedron_edges_c.get()
}

///|
/// CUBE_EDGES
fn step_48() -> Unit raise {
  let t1137 = compute_edges_tac(std_cube(), std_cube_fulldim(), cube_facets())
  cube_edges_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : (Cart[Real, 3]) -> Bool, (face_of(e, std_cube) && aff_dim(e) == int_of_num(1)) == (e == hull(convex, {vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}))"), t1137))
}

///|
let cube_edges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBE_EDGES")

///|
/// `CUBE_EDGES`
pub fn cube_edges() -> @kernel.Thm {
  cube_edges_c.get()
}

///|
/// OCTAHEDRON_EDGES
fn step_49() -> Unit raise {
  let t1138 = compute_edges_tac(std_octahedron(), std_octahedron_fulldim(), octahedron_facets())
  octahedron_edges_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : (Cart[Real, 3]) -> Bool, (face_of(e, std_octahedron) && aff_dim(e) == int_of_num(1)) == (e == hull(convex, {vector([-real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(0)])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), real_of_num(0)])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(0)])}) || e == hull(convex, {vector([real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), real_of_num(0)])}) || e == hull(convex, {vector([real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), -real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1), real_of_num(0), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(0), -real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), -real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(0), -real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(0), real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), -real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(0), real_of_num(1), real_of_num(0)]), vector([real_of_num(0), real_of_num(0), real_of_num(1)])}))"), t1138))
}

///|
let octahedron_edges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OCTAHEDRON_EDGES")

///|
/// `OCTAHEDRON_EDGES`
pub fn octahedron_edges() -> @kernel.Thm {
  octahedron_edges_c.get()
}

///|
/// DODECAHEDRON_EDGES
fn step_50() -> Unit raise {
  let t1139 = compute_edges_tac(std_dodecahedron_v1(), std_dodecahedron_fulldim(), dodecahedron_facets())
  dodecahedron_edges_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : (Cart[Real, 3]) -> Bool, (face_of(e, std_dodecahedron) && aff_dim(e) == int_of_num(1)) == (e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), -real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([-real_of_num(1), real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1), -real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1), real_of_num(1), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1), -real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(1), real_of_num(1), -real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1), -real_of_num(1), -real_of_num(1)]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1), -real_of_num(1), real_of_num(1)]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1), real_of_num(1), -real_of_num(1)]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1), real_of_num(1), real_of_num(1)]), vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}))"), t1139))
}

///|
let dodecahedron_edges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DODECAHEDRON_EDGES")

///|
/// `DODECAHEDRON_EDGES`
pub fn dodecahedron_edges() -> @kernel.Thm {
  dodecahedron_edges_c.get()
}

///|
/// ICOSAHEDRON_EDGES
fn step_51() -> Unit raise {
  let t1140 = compute_edges_tac(std_icosahedron_v1(), std_icosahedron_fulldim(), icosahedron_facets())
  icosahedron_edges_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : (Cart[Real, 3]) -> Bool, (face_of(e, std_icosahedron) && aff_dim(e) == int_of_num(1)) == (e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)]), vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)]), vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)]), vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}) || e == hull(convex, {vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))]), vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])}))"), t1140))
}

///|
let icosahedron_edges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ICOSAHEDRON_EDGES")

///|
/// `ICOSAHEDRON_EDGES`
pub fn icosahedron_edges() -> @kernel.Thm {
  icosahedron_edges_c.get()
}

///|
/// `COMPUTE_VERTICES_TAC`
pub fn compute_vertices_tac(x1141 : @kernel.Thm, x1142 : @kernel.Thm, x1143 : @kernel.Thm) -> @tactics.Tactic raise {
  let defn = x1141
  let fulldim = x1142
  let edges = x1143
  let t1208 = @simp.rewrite_tac(@list.List([@theorems.disj_aci()]))
  let t1207 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @theorems.unwind_thm2()]))
  let t1206 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)"))]))
  let t1205 = @simp.rewrite_tac(@list.List([@polytope.extreme_point_of_segment()]))
  let t1204 = @simp.rewrite_tac(@list.List([@equal.gsym(@convex.segment_convex_hull()), @polytope.face_of_sing()]))
  let t1203 = @simp.once_rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(face_of((v : (Cart[Real, _]) -> Bool), (s : (Cart[Real, _]) -> Bool)) && v == {(a : Cart[Real, _])}) == (face_of({a}, s) && v == {a})"))]))
  let t1202 = @simp.rewrite_tac(@list.List([@convex.aff_dim_eq_0(), @theorems.right_and_exists_thm()]))
  let t1201 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @theorems.unwind_thm2()]))
  let t1200 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)"))]))
  let t1209 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([edges])), t1200), t1201), t1202), t1203), t1204), t1205), t1206), t1207), t1208)
  let t1197 = @meson.asm_meson_tac(@list.List([@polytope.face_of_face(), @polytope.face_of_trans()]))
  let t1196 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1195 = @simp.asm_rewrite_tac(@list.List([fulldim]))
  let t1194 = @simp.rewrite_tac(@list.List([@polytope.facet_of()]))
  let t1198 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t1194), t1195), t1196), t1197)
  let t1189 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1188 = @simp.asm_rewrite_tac(@list.List([fulldim, @convex.aff_dim_empty()]))
  let t1185 = @term_syntax.parse_term("(aff_dim : ((Cart[Real, 3]) -> Bool) -> Int)")
  let t1190 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1182 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1183 = @tactics.mp_tac(x1182)
      fn(x1184 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1183(x1184)
      }
    })(((x1186 : @kernel.Thm) => @equal.ap_term(t1185, x1186))(x1187))
  }), t1188), t1189)
  let t1181 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1180 = @simp.asm_rewrite_tac(@list.List([fulldim, @convex.aff_dim_empty()]))
  let t1177 = @term_syntax.parse_term("(aff_dim : ((Cart[Real, 3]) -> Bool) -> Int)")
  let t1191 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1175 = @tactics.mp_tac(x1174)
      fn(x1176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1175(x1176)
      }
    })(((x1178 : @kernel.Thm) => @equal.ap_term(t1177, x1178))(x1179))
  }), t1180), t1181)
  let t1192 = @meson.asm_meson_tac(@list.List([@polytope.face_of_face()]))
  let t1173 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t1172 = @tactics.match_mp_tac(@polytope.polyhedron_convex_hull())
  let t1171 = @simp.rewrite_tac(@list.List([defn]))
  let t1170 = @tactics.first_assum(fn(x1167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1167
    let t1169 = @list.List([@tactics.all_tac, @tactics.accept_tac(th)])
    @tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@kernel.rand(@kernel.concl(th))), @tactics.conj_tac), t1169)
  })
  let t1193 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@polytope.face_of_polyhedron_polyhedron()), t1170), t1171), t1172), t1173), t1192, t1191, t1190])
  let t1199 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t1193), t1198])
  let t1165 = @term_syntax.parse_term("(v : (Cart[Real, 3]) -> Bool)")
  let t1166 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 3]) -> Bool)"), t1165]), @polytope.face_of_polyhedron_subset_facet()))
  let t1162 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : (Cart[Real, 3]) -> Bool)"))(@tactics.strip_assume_tac))
  let t1163 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@polytope.facet_of()])), t1162)
  let t1159 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1158 = @simp.asm_rewrite_tac(@list.List([fulldim, @convex.aff_dim_empty()]))
  let t1155 = @term_syntax.parse_term("(aff_dim : ((Cart[Real, 3]) -> Bool) -> Int)")
  let t1160 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.disch_then(fn(x1157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1153 = @tactics.mp_tac(x1152)
      fn(x1154 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1153(x1154)
      }
    })(((x1156 : @kernel.Thm) => @equal.ap_term(t1155, x1156))(x1157))
  })), t1158), t1159)
  let t1151 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t1150 = @tactics.match_mp_tac(@polytope.polyhedron_convex_hull())
  let t1161 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([defn])), t1150), t1151), t1160])
  let t1164 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.conj_tac), t1161), t1163])
  let t1148 = @term_syntax.parse_term("(v : (Cart[Real, 3]) -> Bool)")
  let t1149 = @tactics.mp_tac(@bool.ispecl(@list.List([@equal.lhs(@kernel.concl(defn)), t1148]), @polytope.face_of_polyhedron_subset_facet()))
  let t1210 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.eq_tac, @list.List([@tactics.strip_tac, @meson.meson_tac(@list.List([@polytope.face_of_trans()]))])), t1149), @tactics.ants_tac), t1164), t1166), @tactics.ants_tac), t1199), t1209])
  let t1146 = @term_syntax.parse_term("∃ e : (Cart[Real, 3]) -> Bool, (face_of(e, (p : (Cart[Real, 3]) -> Bool)) && aff_dim(e) == int_of_num(1)) && face_of((v : (Cart[Real, 3]) -> Bool), e) && aff_dim(v) == int_of_num(0)")
  let t1145 = @term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)")
  let t1147 = @tactics.exists_tac(@kernel.vsubst(@list.List([(@equal.lhs(@kernel.concl(defn)), t1145)]), t1146))
  @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@theorems.eq_trans())), t1147), @tactics.conj_tac), t1210)
}

///|
/// TETRAHEDRON_VERTICES
fn step_52() -> Unit raise {
  let t1211 = compute_vertices_tac(std_tetrahedron(), std_tetrahedron_fulldim(), tetrahedron_edges())
  tetrahedron_vertices_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 3]) -> Bool, (face_of(v, std_tetrahedron) && aff_dim(v) == int_of_num(0)) == (v == {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)])} || v == {vector([-real_of_num(1), real_of_num(1), -real_of_num(1)])} || v == {vector([real_of_num(1), -real_of_num(1), -real_of_num(1)])} || v == {vector([real_of_num(1), real_of_num(1), real_of_num(1)])})"), t1211))
}

///|
let tetrahedron_vertices_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TETRAHEDRON_VERTICES")

///|
/// `TETRAHEDRON_VERTICES`
pub fn tetrahedron_vertices() -> @kernel.Thm {
  tetrahedron_vertices_c.get()
}

///|
/// CUBE_VERTICES
fn step_53() -> Unit raise {
  let t1212 = compute_vertices_tac(std_cube(), std_cube_fulldim(), cube_edges())
  cube_vertices_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 3]) -> Bool, (face_of(v, std_cube) && aff_dim(v) == int_of_num(0)) == (v == {vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)])} || v == {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)])} || v == {vector([-real_of_num(1), real_of_num(1), -real_of_num(1)])} || v == {vector([-real_of_num(1), real_of_num(1), real_of_num(1)])} || v == {vector([real_of_num(1), -real_of_num(1), -real_of_num(1)])} || v == {vector([real_of_num(1), -real_of_num(1), real_of_num(1)])} || v == {vector([real_of_num(1), real_of_num(1), -real_of_num(1)])} || v == {vector([real_of_num(1), real_of_num(1), real_of_num(1)])})"), t1212))
}

///|
let cube_vertices_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBE_VERTICES")

///|
/// `CUBE_VERTICES`
pub fn cube_vertices() -> @kernel.Thm {
  cube_vertices_c.get()
}

///|
/// OCTAHEDRON_VERTICES
fn step_54() -> Unit raise {
  let t1213 = compute_vertices_tac(std_octahedron(), std_octahedron_fulldim(), octahedron_edges())
  octahedron_vertices_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 3]) -> Bool, (face_of(v, std_octahedron) && aff_dim(v) == int_of_num(0)) == (v == {vector([-real_of_num(1), real_of_num(0), real_of_num(0)])} || v == {vector([real_of_num(1), real_of_num(0), real_of_num(0)])} || v == {vector([real_of_num(0), -real_of_num(1), real_of_num(0)])} || v == {vector([real_of_num(0), real_of_num(1), real_of_num(0)])} || v == {vector([real_of_num(0), real_of_num(0), -real_of_num(1)])} || v == {vector([real_of_num(0), real_of_num(0), real_of_num(1)])})"), t1213))
}

///|
let octahedron_vertices_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OCTAHEDRON_VERTICES")

///|
/// `OCTAHEDRON_VERTICES`
pub fn octahedron_vertices() -> @kernel.Thm {
  octahedron_vertices_c.get()
}

///|
/// DODECAHEDRON_VERTICES
fn step_55() -> Unit raise {
  let t1214 = compute_vertices_tac(std_dodecahedron_v1(), std_dodecahedron_fulldim(), dodecahedron_edges())
  dodecahedron_vertices_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 3]) -> Bool, (face_of(v, std_dodecahedron) && aff_dim(v) == int_of_num(0)) == (v == {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])} || v == {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])} || v == {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])} || v == {vector([-real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])} || v == {vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])} || v == {vector([real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])} || v == {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])} || v == {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])} || v == {vector([-real_of_num(1), -real_of_num(1), -real_of_num(1)])} || v == {vector([-real_of_num(1), -real_of_num(1), real_of_num(1)])} || v == {vector([-real_of_num(1), real_of_num(1), -real_of_num(1)])} || v == {vector([-real_of_num(1), real_of_num(1), real_of_num(1)])} || v == {vector([real_of_num(1), -real_of_num(1), -real_of_num(1)])} || v == {vector([real_of_num(1), -real_of_num(1), real_of_num(1)])} || v == {vector([real_of_num(1), real_of_num(1), -real_of_num(1)])} || v == {vector([real_of_num(1), real_of_num(1), real_of_num(1)])} || v == {vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])} || v == {vector([real_of_num(0), -real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])} || v == {vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])} || v == {vector([real_of_num(0), real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])})"), t1214))
}

///|
let dodecahedron_vertices_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DODECAHEDRON_VERTICES")

///|
/// `DODECAHEDRON_VERTICES`
pub fn dodecahedron_vertices() -> @kernel.Thm {
  dodecahedron_vertices_c.get()
}

///|
/// ICOSAHEDRON_VERTICES
fn step_56() -> Unit raise {
  let t1215 = compute_vertices_tac(std_icosahedron_v1(), std_icosahedron_fulldim(), icosahedron_edges())
  icosahedron_vertices_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 3]) -> Bool, (face_of(v, std_icosahedron) && aff_dim(v) == int_of_num(0)) == (v == {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)])} || v == {vector([-real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)])} || v == {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), -real_of_num(1)])} || v == {vector([real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0), real_of_num(1)])} || v == {vector([-real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])} || v == {vector([-real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])} || v == {vector([real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])} || v == {vector([real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5)), real_of_num(0)])} || v == {vector([real_of_num(0), -real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])} || v == {vector([real_of_num(0), -real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])} || v == {vector([real_of_num(0), real_of_num(1), -real_of_num(1) / real_of_num(2) + -real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])} || v == {vector([real_of_num(0), real_of_num(1), real_of_num(1) / real_of_num(2) + real_of_num(1) / real_of_num(2) * sqrt(real_of_num(5))])})"), t1215))
}

///|
let icosahedron_vertices_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ICOSAHEDRON_VERTICES")

///|
/// `ICOSAHEDRON_VERTICES`
pub fn icosahedron_vertices() -> @kernel.Thm {
  icosahedron_vertices_c.get()
}

///|
/// `EDGES_PER_VERTEX_TAC`
pub fn edges_per_vertex_tac(x1216 : @kernel.Thm, x1217 : @kernel.Thm, x1218 : @kernel.Thm) -> @tactics.Tactic raise {
  let defn = x1216
  let edges = x1217
  let verts = x1218
  let t1254 = @simp.rewrite_tac(@list.List([@bool.conjunct1(@sets.has_size_clauses())]))
  let t1253 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1249 = @simp.rewrite_tac(@list.List([]))
  let t1248 = @tactics.conv_tac(@equal.once_depth_conv(vector3_eq_0_conv))
  let t1247 = @tactics.conv_tac(@equal.once_depth_conv(vector3_sub_conv))
  let t1246 = @simp.pure_once_rewrite_tac(@list.List([@equal.gsym(@vectors.vector_sub_eq())]))
  let t1245 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("!((a : _) == (c : _) && (b : _) == (d : _)) && !(a == d && b == c) && !(a == b && c == d) → !({a, b} == {c, d})")))
  let t1244 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1250 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm(), @convex.segment_eq()])), t1244), t1245), t1246), t1247), t1248), t1249), @tactics.no_tac)
  let t1251 = @list.List([@tactics.then_tac(@tactics.conv_tac(@calc_num.num_reduce_conv), @tactics.no_tac), t1250, @tactics.all_tac])
  let t1243 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1252 = @tactics.repeat_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(card_eq_lemma()), t1243), t1251))
  let t1242 = @tactics.match_mp_tac(@meson.meson(@list.List([@sets.has_size()]), @term_syntax.parse_term("HAS_SIZE((s : (_) -> Bool), (n : Num)) → CARD(s) == n")))
  let t1241 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("UNION({(x : _)}, (s : (_) -> Bool)) == INSERT(x, s)"))]))
  let t1240 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}"))]))
  let t1239 = @simp.rewrite_tac(@list.List([@sets.empty_gspec(), @sets.union_empty()]))
  let t1238 = @tactics.conv_tac(@equal.once_depth_conv(vector3_eq_0_conv))
  let t1237 = @tactics.conv_tac(@equal.once_depth_conv(vector3_sub_conv))
  let t1236 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.vector_sub_eq())]))
  let t1235 = @simp.rewrite_tac(@list.List([@equal.gsym(@convex.segment_convex_hull()), @polytope.extreme_point_of_segment()]))
  let t1234 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([@polytope.face_of_sing()]), @term_syntax.parse_term("((e : (Cart[Real, _]) -> Bool) == (a : (Cart[Real, _]) -> Bool) && face_of({(x : Cart[Real, _])}, e)) == (e == a && extreme_point_of(x, a))"))]))
  let t1233 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(e : _) | ((P : (_) -> Bool)(e) || (Q : (_) -> Bool)(e)) && (R : (_) -> Bool)(e)} == UNION({(e : _) | P(e) && R(e)}, {(e : _) | Q(e) && R(e)})"))]))
  let t1232 = @simp.rewrite_tac(@list.List([edges]))
  let t1231 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x1228 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1229 = @tactics.subst1_tac(x1228)
    fn(x1230 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1229(x1230)
    }
  }))
  let t1227 = @simp.asm_rewrite_tac(@list.List([]))
  let t1226 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(v : (Cart[Real, 3]) -> Bool)"), verts))
  let t1224 = @meson.asm_meson_tac(@list.List([@polytope.face_of_face()]))
  let t1225 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()]))), t1224), @tactics.all_tac])
  let t1222 = @term_syntax.parse_term("CARD({(e : (Cart[Real, 3]) -> Bool) | (face_of(e, (p : (Cart[Real, 3]) -> Bool)) && aff_dim(e) == int_of_num(1)) && face_of((v : (Cart[Real, 3]) -> Bool), e)})")
  let t1221 = @term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)")
  let t1223 = @tactics.exists_tac(@kernel.vsubst(@list.List([(@equal.lhs(@kernel.concl(defn)), t1221)]), t1222))
  let t1220 = @tactics.match_mp_tac(@theorems.eq_trans())
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1220), t1223), @tactics.conj_tac), t1225), t1226), t1227), t1231), t1232), t1233), t1234), t1235), t1236), t1237), t1238), t1239), t1240), t1241), t1242), t1252), t1253), t1254)
}

///|
/// TETRAHEDRON_EDGES_PER_VERTEX
fn step_57() -> Unit raise {
  let t1255 = edges_per_vertex_tac(std_tetrahedron(), tetrahedron_edges(), tetrahedron_vertices())
  tetrahedron_edges_per_vertex_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 3]) -> Bool, face_of(v, std_tetrahedron) && aff_dim(v) == int_of_num(0) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, std_tetrahedron) && aff_dim(e) == int_of_num(1) && SUBSET(v, e)}) == 3"), t1255))
}

///|
let tetrahedron_edges_per_vertex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TETRAHEDRON_EDGES_PER_VERTEX")

///|
/// `TETRAHEDRON_EDGES_PER_VERTEX`
pub fn tetrahedron_edges_per_vertex() -> @kernel.Thm {
  tetrahedron_edges_per_vertex_c.get()
}

///|
/// CUBE_EDGES_PER_VERTEX
fn step_58() -> Unit raise {
  let t1256 = edges_per_vertex_tac(std_cube(), cube_edges(), cube_vertices())
  cube_edges_per_vertex_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 3]) -> Bool, face_of(v, std_cube) && aff_dim(v) == int_of_num(0) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, std_cube) && aff_dim(e) == int_of_num(1) && SUBSET(v, e)}) == 3"), t1256))
}

///|
let cube_edges_per_vertex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBE_EDGES_PER_VERTEX")

///|
/// `CUBE_EDGES_PER_VERTEX`
pub fn cube_edges_per_vertex() -> @kernel.Thm {
  cube_edges_per_vertex_c.get()
}

///|
/// OCTAHEDRON_EDGES_PER_VERTEX
fn step_59() -> Unit raise {
  let t1257 = edges_per_vertex_tac(std_octahedron(), octahedron_edges(), octahedron_vertices())
  octahedron_edges_per_vertex_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 3]) -> Bool, face_of(v, std_octahedron) && aff_dim(v) == int_of_num(0) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, std_octahedron) && aff_dim(e) == int_of_num(1) && SUBSET(v, e)}) == 4"), t1257))
}

///|
let octahedron_edges_per_vertex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OCTAHEDRON_EDGES_PER_VERTEX")

///|
/// `OCTAHEDRON_EDGES_PER_VERTEX`
pub fn octahedron_edges_per_vertex() -> @kernel.Thm {
  octahedron_edges_per_vertex_c.get()
}

///|
/// DODECAHEDRON_EDGES_PER_VERTEX
fn step_60() -> Unit raise {
  let t1258 = edges_per_vertex_tac(std_dodecahedron_v1(), dodecahedron_edges(), dodecahedron_vertices())
  dodecahedron_edges_per_vertex_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 3]) -> Bool, face_of(v, std_dodecahedron) && aff_dim(v) == int_of_num(0) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, std_dodecahedron) && aff_dim(e) == int_of_num(1) && SUBSET(v, e)}) == 3"), t1258))
}

///|
let dodecahedron_edges_per_vertex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DODECAHEDRON_EDGES_PER_VERTEX")

///|
/// `DODECAHEDRON_EDGES_PER_VERTEX`
pub fn dodecahedron_edges_per_vertex() -> @kernel.Thm {
  dodecahedron_edges_per_vertex_c.get()
}

///|
/// ICOSAHEDRON_EDGES_PER_VERTEX
fn step_61() -> Unit raise {
  let t1259 = edges_per_vertex_tac(std_icosahedron_v1(), icosahedron_edges(), icosahedron_vertices())
  icosahedron_edges_per_vertex_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Cart[Real, 3]) -> Bool, face_of(v, std_icosahedron) && aff_dim(v) == int_of_num(0) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, std_icosahedron) && aff_dim(e) == int_of_num(1) && SUBSET(v, e)}) == 5"), t1259))
}

///|
let icosahedron_edges_per_vertex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ICOSAHEDRON_EDGES_PER_VERTEX")

///|
/// `ICOSAHEDRON_EDGES_PER_VERTEX`
pub fn icosahedron_edges_per_vertex() -> @kernel.Thm {
  icosahedron_edges_per_vertex_c.get()
}

///|
/// MULTIPLE_COUNTING_LEMMA
fn step_62() -> Unit raise {
  let t1264 = @simp.asm_simp_tac(@list.List([@iterate.nsum_const(), @sets.finite_restrict()]))
  let t1260 = @term_syntax.parse_term("(t : (B) -> Bool)")
  let t1261 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t1262 = @term_syntax.parse_term("(x : A) => (y : B) => 1")
  let t1263 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(R : (A, B) -> Bool)"), t1262, t1261, t1260]), @iterate.nsum_nsum_restrict()))
  let t1265 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1263), t1264), @int.arith_tac)
  multiple_counting_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (A, B) -> Bool, ∀ s : (A) -> Bool, ∀ t : (B) -> Bool, FINITE(s) && FINITE(t) && (∀ x : A, IN(x, s) → CARD({(y : B) | IN(y, t) && R(x, y)}) == (m : Num)) && (∀ y : B, IN(y, t) → CARD({(x : A) | IN(x, s) && R(x, y)}) == (n : Num)) → m * CARD(s) == n * CARD(t)"), t1265))
}

///|
let multiple_counting_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIPLE_COUNTING_LEMMA")

///|
/// `MULTIPLE_COUNTING_LEMMA`
pub fn multiple_counting_lemma() -> @kernel.Thm {
  multiple_counting_lemma_c.get()
}

///|
/// SIZE_ZERO_DIMENSIONAL_FACES
fn step_63() -> Unit raise {
  let t1279 = @sets.set_tac(@list.List([]))
  let t1278 = @simp.asm_simp_tac(@list.List([@polytope.finite_polyhedron_extreme_points()]))
  let t1275 = @tactics.match_mp_tac(@sets.has_size_image_inj_eq())
  let t1276 = @tactics.match_mp_tac(@sets.finite_image_inj_eq())
  let t1277 = @list.List([@tactics.match_mp_tac(@sets.card_image_inj()), t1276, t1275])
  let t1280 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t1277), t1278), t1279)
  let t1274 = @meson.meson_tac(@list.List([]))
  let t1273 = @simp.rewrite_tac(@list.List([@convex.aff_dim_eq_0()]))
  let t1272 = @simp.rewrite_tac(@list.List([@convex.aff_dim_sing(), @polytope.face_of_sing(), @sets.in_elim_thm()]))
  let t1271 = @tactics.match_mp_tac(@sets.surjective_image_eq())
  let t1281 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t1271), t1272), t1273), t1274), t1280])
  let t1270 = @tactics.subgoal_then(@term_syntax.parse_term("{(f : (Cart[Real, N]) -> Bool) | face_of(f, (s : (Cart[Real, N]) -> Bool)) && aff_dim(f) == int_of_num(0)} == IMAGE((v : Cart[Real, N]) => {v}, {(v : Cart[Real, N]) | extreme_point_of(v, s)})"), fn(x1267 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1268 = @tactics.subst1_tac(x1267)
    fn(x1269 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1268(x1269)
    }
  })
  let t1266 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1282 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_and_forall_thm()])), t1266), @tactics.disch_tac), t1270), t1281)
  size_zero_dimensional_faces_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, polyhedron(s) → CARD({(f : (Cart[Real, N]) -> Bool) | face_of(f, s) && aff_dim(f) == int_of_num(0)}) == CARD({(v : Cart[Real, N]) | extreme_point_of(v, s)}) && FINITE({(f : (Cart[Real, N]) -> Bool) | face_of(f, s) && aff_dim(f) == int_of_num(0)}) == FINITE({(v : Cart[Real, N]) | extreme_point_of(v, s)}) && (∀ n : Num, HAS_SIZE({(f : (Cart[Real, N]) -> Bool) | face_of(f, s) && aff_dim(f) == int_of_num(0)}, n) == HAS_SIZE({(v : Cart[Real, N]) | extreme_point_of(v, s)}, n))"), t1282))
}

///|
let size_zero_dimensional_faces_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZE_ZERO_DIMENSIONAL_FACES")

///|
/// `SIZE_ZERO_DIMENSIONAL_FACES`
pub fn size_zero_dimensional_faces() -> @kernel.Thm {
  size_zero_dimensional_faces_c.get()
}

///|
/// PLATONIC_SOLIDS_LIMITS
fn step_64() -> Unit raise {
  let t1571 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1570 = @simp.asm_rewrite_tac(@list.List([]))
  let t1569 = @tactics.undisch_tac(@term_syntax.parse_term("(E : Num) * (2 * ((m : Num) + (n : Num))) == m * (n * (E + 2))"))
  let t1568 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("3 <= (m : Num) → (m <= 5) == (m == 3 || m == 4 || m == 5)"))]))
  let t1567 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((m : Num) < 4 + 2) == (m <= 5)"))]))
  let t1566 = @simp.rewrite_tac(@list.List([@real.real_lt_sub_radd(), @realax.real_of_num_add(), @real.real_of_num_lt()]))
  let t1564 = @simp.rewrite_tac(@list.List([@realax.real_of_num_mul(), @realax.real_of_num_add(), @realax.real_of_num_le()]))
  let t1563 = @simp.rewrite_tac(@list.List([@real.real_sub_ldistrib(), @real.real_sub_rdistrib(), @real.real_le_sub_ladd()]))
  let t1562 = @simp.asm_rewrite_tac(@list.List([@realax.real_of_num_mul(), @realax.real_of_num_add(), @real.real_of_num_lt()]))
  let t1561 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(((m : Real) - real_of_num(2)) * ((n : Real) - real_of_num(2)) < real_of_num(4)) == (m * n < real_of_num(2) * (m + n))"))]))
  let t1560 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(4)"))
  let t1559 = @tactics.match_mp_tac(@realarith.real_lte_trans())
  let t1558 = @simp.asm_simp_tac(@list.List([@realarith.real_sub_lt(), @real.real_of_num_lt(), @int.arith_rule(@term_syntax.parse_term("(2 < (n : Num)) == (3 <= n)"))]))
  let t1556 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((m : Num)) - real_of_num(2)"))
  let t1557 = @tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_lcancel_imp()), t1556)
  let t1555 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num((n : Num)) - real_of_num(2)"))
  let t1565 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.match_mp_tac(@real.real_lt_rcancel_imp()), t1555), t1557])), t1558), t1559), t1560), t1561), t1562), t1563), t1564), @int.asm_arith_tac), @tactics.all_tac])
  let t1554 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num((m : Num)) - real_of_num(2) < real_of_num(4) && real_of_num((n : Num)) - real_of_num(2) < real_of_num(4)"), fn(x1551 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1552 = @tactics.mp_tac(x1551)
    fn(x1553 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1552(x1553)
    }
  })
  let t1547 = @simp.rewrite_tac(@list.List([@arith.mult_eq_0()]))
  let t1546 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")))
  let t1548 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((m : Num) * ((n : Num) * ((E : Num) + 2)) <= E * (m * n)) == (2 * (m * n) == 0)"))])), t1546), t1547), @int.asm_arith_tac)
  let t1549 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()])), @int.asm_arith_tac), t1548])
  let t1545 = @tactics.subgoal_then(@term_syntax.parse_term("(E : Num) * (2 * ((m : Num) + (n : Num))) <= E * (m * n)"), fn(x1542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1543 = @tactics.mp_tac(x1542)
    fn(x1544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1543(x1544)
    }
  })
  let t1550 = @list.List([@tactics.disch_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@arith.not_lt()])))), t1545), t1549)])
  let t1541 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) * (n : Num) < 2 * (m + n)"))
  let t1540 = @tactics.subgoal_then(@term_syntax.parse_term("3 <= (n : Num)"), fn(x1537 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1538 = @tactics.assume_tac(x1537)
    fn(x1539 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1538(x1539)
    }
  })
  let t1533 = @drule.match_mp(@grobner.num_ring(@term_syntax.parse_term("(E : Num) * (c : Num) == 2 * E → E == 0 || c == 2")))
  let t1535 = @tactics.first_x_assum(fn(x1534 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1530 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1531 = @tactics.mp_tac(x1530)
      fn(x1532 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1531(x1532)
      }
    })(t1533(x1534))
  })
  let t1529 = @tactics.disch_then(fn(x1528 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1525 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1526 = @tactics.subst_all_tac(x1525)
      fn(x1527 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1526(x1527)
      }
    })(@equal.sym(x1528))
  })
  let t1536 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((E : Num) * (2 * ((n : Num) + 2)) == n * (2 * (E + 2))) == (E == n)"))])), t1529), t1535), @int.asm_arith_tac), @tactics.all_tac])
  let t1524 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 2"))
  let t1522 = @list.List([@int.arith_tac, @tactics.then_tac(@tactics.match_mp_tac(@arith.le_mult2()), @int.asm_arith_tac)])
  let t1521 = @tactics.exists_tac(@term_syntax.parse_term("2 * ((m : Num) + 2)"))
  let t1520 = @tactics.match_mp_tac(@arith.lte_trans())
  let t1519 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(n : Num) < (m : Num) → !(m == n)")))
  let t1518 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")))
  let t1523 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.mult_clauses(), @int.arith_rule(@term_syntax.parse_term("((E : Num) * (2 * ((n : Num) + 1)) == n * (E + 2)) == (E * (n + 2) == 2 * n)"))])), t1518), t1519), t1520), t1521), @tactics.conj_tac), t1522), @tactics.all_tac])
  let t1517 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 1"))
  let t1516 = @simp.abbrev_tac(@term_syntax.parse_term("(E : Num) == CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, (p : (Cart[Real, 3]) -> Bool)) && aff_dim(e) == int_of_num(1)})"))
  let t1515 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((m : Num) * (2 * (e : Num)) + (n : Num) * (2 * e) == m * (n * (e + 2))) == (e * (2 * (m + n)) == m * (n * (e + 2)))"))]))
  let t1514 = @simp.asm_rewrite_tac(@list.List([]))
  let t1509 = @term_syntax.parse_term("(n : Num)")
  let t1510 = @list.List([@term_syntax.parse_term("(m : Num)"), t1509])
  let t1513 = @tactics.disch_then(fn(x1512 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1507 = @tactics.mp_tac(x1506)
      fn(x1508 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1507(x1508)
      }
    })(((x1511 : @kernel.Thm) => @bool.specl(t1510, x1511))(x1512))
  })
  let t1503 = @drule.match_mp(@grobner.num_ring(@term_syntax.parse_term("(v : Num) + (f : Num) == (e : Num) + 2 → (∀ m : Num, ∀ n : Num, m * (n * v) + n * (m * f) == m * (n * (e + 2)))")))
  let t1505 = @tactics.first_assum(fn(x1504 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1500 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1501 = @tactics.mp_tac(x1500)
      fn(x1502 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1501(x1502)
      }
    })(t1503(x1504))
  })
  let t1498 = @simp.asm_rewrite_tac(@list.List([]))
  let t1495 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("0 * (x : Num) == 2 * (e : Num) → e == 0")))
  let t1497 = @tactics.first_x_assum(fn(x1496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1492 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1493 = @tactics.mp_tac(x1492)
      fn(x1494 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1493(x1494)
      }
    })(t1495(x1496))
  })
  let t1499 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("(n : Num) == 0"), fn(x1489 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1490 = @tactics.subst_all_tac(x1489)
    fn(x1491 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1490(x1491)
    }
  }), t1497), t1498), @tactics.all_tac])
  let t1488 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1485 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("3 <= (m : Num) → !(m == 0)")))
  let t1487 = @tactics.first_assum(fn(x1486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1483 = @tactics.assume_tac(x1482)
      fn(x1484 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1483(x1484)
      }
    })(t1485(x1486))
  })
  let t1479 = @meson.asm_meson_tac(@list.List([@polytope.face_of_face()]))
  let t1480 = @list.List([@meson.asm_meson_tac(@list.List([@polytope.face_of_trans(), @polytope.face_of_imp_subset()])), t1479])
  let t1478 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1477 = @simp.asm_simp_tac(@list.List([@convex.aff_dim_empty()]))
  let t1476 = @class.asm_cases_tac(@term_syntax.parse_term("(e : (Cart[Real, 3]) -> Bool) == {}"))
  let t1475 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : (Cart[Real, 3]) -> Bool)"))
  let t1474 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1473 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1472 = @simp.gen_rewrite_tac(fn(x1471 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1471
  }, @list.List([@sets.extension()]))
  let t1470 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1469 = @simp.rewrite_tac(@list.List([@int.int_of_num_le()]))
  let t1468 = @list.List([@meson.asm_meson_tac(@list.List([@polytope.face_of_polytope_polytope()])), @tactics.all_tac])
  let t1467 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1466 = @simp.asm_rewrite_tac(@list.List([@polytope.facet_of()]))
  let t1465 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(f : (Cart[Real, 3]) -> Bool)"), @polytope.polytope_facet_lower_bound()))
  let t1464 = @tactics.disch_then(fn(x1455 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1455
    let t1463 = @tactics.first_x_assum(fn(x1462 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1460 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s1458 = @tactics.subst1_tac(x1457)
          fn(x1459 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s1458(x1459)
          }
        })(@equal.sym(x1460))
      })((fn(x1461 : @kernel.Thm) -> @kernel.Thm raise {
        @drule.match_mp(x1461)(th)
      })(x1462))
    })
    @tactics.then_tac(@tactics.strip_assume_tac(th), t1463)
  })
  let t1454 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : (Cart[Real, 3]) -> Bool)"))(fn(x1451 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1452 = @tactics.mp_tac(x1451)
    fn(x1453 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1452(x1453)
    }
  }))
  let t1450 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1446 = @simp.gen_rewrite_rule(fn(x1445 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1445
  }, @list.List([@equal.gsym(@sets.member_not_empty())]))
  let t1448 = @tactics.first_x_assum(fn(x1447 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1443 = @tactics.mp_tac(x1442)
      fn(x1444 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1443(x1444)
      }
    })(t1446(x1447))
  })
  let t1441 = @simp.asm_rewrite_tac(@list.List([@sets.card_clauses()]))
  let t1449 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("4 <= CARD({(f : (Cart[Real, 3]) -> Bool) | face_of(f, (p : (Cart[Real, 3]) -> Bool)) && aff_dim(f) == int_of_num(2)})")), t1441), @int.arith_tac), t1448])
  let t1481 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("{(f : (Cart[Real, 3]) -> Bool) | face_of(f, (p : (Cart[Real, 3]) -> Bool)) && aff_dim(f) == int_of_num(2)} == {}")), t1449), t1450), t1454), t1464), t1465), t1466), t1467), @tactics.ants_tac), t1468), t1469), t1470), @tactics.ap_term_tac), @tactics.ap_term_tac), t1472), t1473), t1474), t1475), @tactics.eq_tac), t1476), t1477), t1478), t1480), @tactics.all_tac])
  let t1440 = @tactics.subgoal_then(@term_syntax.parse_term("3 <= (m : Num)"), fn(x1437 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1438 = @tactics.assume_tac(x1437)
    fn(x1439 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1438(x1439)
    }
  })
  let t1436 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))
  let t1435 = @class.asm_cases_tac(@term_syntax.parse_term("CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, (p : (Cart[Real, 3]) -> Bool)) && aff_dim(e) == int_of_num(1)}) == 0"))
  let t1434 = @simp.asm_rewrite_tac(@list.List([]))
  let t1431 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(v : Num) + (f : Num) == (e : Num) + 2 → 4 <= v && 4 <= f → 6 <= e")))
  let t1433 = @tactics.first_assum(fn(x1432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1429 = @tactics.mp_tac(x1428)
      fn(x1430 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1429(x1430)
      }
    })(t1431(x1432))
  })
  let t1426 = @meson.asm_meson_tac(@list.List([@int.int_arith(@term_syntax.parse_term("!(int_of_num(2) == -int_of_num(1))")), @convex.aff_dim_empty()]))
  let t1425 = @simp.asm_rewrite_tac(@list.List([]))
  let t1424 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1423 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1422 = @simp.gen_rewrite_tac(fn(x1421 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1421
  }, @list.List([@sets.extension()]))
  let t1420 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1419 = @simp.asm_rewrite_tac(@list.List([@int.int_of_num_le(), @polytope.facet_of()]))
  let t1418 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1417 = @simp.asm_rewrite_tac(@list.List([]))
  let t1427 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)"), @polytope.polytope_facet_lower_bound())), t1417), t1418), t1419), t1420), @tactics.ap_term_tac), @tactics.ap_term_tac), t1422), t1423), t1424), @tactics.gen_tac), @tactics.eq_tac), @tactics.strip_tac), t1425), t1426), @tactics.all_tac])
  let t1416 = @tactics.subgoal_then(@term_syntax.parse_term("4 <= CARD({(f : (Cart[Real, 3]) -> Bool) | face_of(f, (p : (Cart[Real, 3]) -> Bool)) && aff_dim(f) == int_of_num(2)})"), fn(x1413 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1414 = @tactics.assume_tac(x1413)
    fn(x1415 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1414(x1415)
    }
  })
  let t1411 = @simp.rewrite_tac(@list.List([@int.int_of_num_le()]))
  let t1410 = @tactics.conv_tac(@int.int_reduce_conv)
  let t1409 = @simp.asm_rewrite_tac(@list.List([]))
  let t1408 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)"), @polytope.polytope_vertex_lower_bound()))
  let t1412 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([size_zero_dimensional_faces(), @polytope.polytope_imp_polyhedron()])), t1408), t1409), t1410), t1411), @tactics.all_tac])
  let t1407 = @tactics.subgoal_then(@term_syntax.parse_term("4 <= CARD({(v : (Cart[Real, 3]) -> Bool) | face_of(v, (p : (Cart[Real, 3]) -> Bool)) && aff_dim(v) == int_of_num(0)})"), fn(x1404 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1405 = @tactics.assume_tac(x1404)
    fn(x1406 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1405(x1406)
    }
  })
  let t1401 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(a : Num) + (b : Num) - (c : Num) == 2 → a + b == c + 2")))
  let t1403 = @tactics.disch_then(fn(x1402 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1399 = @tactics.assume_tac(x1398)
      fn(x1400 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1399(x1400)
      }
    })(t1401(x1402))
  })
  let t1390 = @simp.asm_rewrite_tac(@list.List([@sets.in_sing(), @sets.not_in_empty(), @calc_num.arith()]))
  let t1389 = @simp.asm_simp_tac(@list.List([@sets.finite_insert(), @sets.card_clauses(), @sets.finite_empty()]))
  let t1388 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _) || x == (b : _)} == {a, b}"))]))
  let t1391 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@polytope.extreme_point_of_segment()])), t1388), t1389), t1390)
  let t1383 = @sets.set_tac(@list.List([]))
  let t1384 = @list.List([@meson.asm_meson_tac(@list.List([@polytope.face_of_face()])), t1383])
  let t1382 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@polytope.face_of_sing())]))
  let t1381 = @tactics.exists_tac(@term_syntax.parse_term("(v : Cart[Real, 3])"))
  let t1380 = @simp.rewrite_tac(@list.List([@theorems.exists_unique()]))
  let t1379 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(v : Cart[Real, 3])"))(fn(x1376 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1377 = @tactics.subst_all_tac(x1376)
    fn(x1378 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1377(x1378)
    }
  }))
  let t1375 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1369 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1370 = @tactics.mp_tac(x1369)
    fn(x1371 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1370(x1371)
    }
  }, fn(x1372 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1373 = @tactics.assume_tac(x1372)
    fn(x1374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1373(x1374)
    }
  }))
  let t1368 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1362 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1363 = @tactics.assume_tac(x1362)
    fn(x1364 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1363(x1364)
    }
  }, fn(x1365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1366 = @tactics.mp_tac(x1365)
    fn(x1367 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1366(x1367)
    }
  }))
  let t1361 = @simp.rewrite_tac(@list.List([@convex.aff_dim_eq_0()]))
  let t1385 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(s : (Cart[Real, 3]) -> Bool)")), t1361), t1368), t1375), t1379), t1380), t1381), t1382), @tactics.conj_tac), t1384)
  let t1360 = @meson.asm_meson_tac(@list.List([@polytope.face_of_trans(), @polytope.face_of_imp_subset()]))
  let t1359 = @simp.rewrite_tac(@list.List([@equal.gsym(@polytope.face_of_sing())]))
  let t1386 = @tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(v : Cart[Real, 3])")), t1359), t1360)
  let t1358 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t1357 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _) || x == (b : _)} == {a, b}"))]))
  let t1387 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@polytope.extreme_point_of_segment()])), t1357), t1358), t1386, t1385])
  let t1356 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1355 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @polytope.face_of_sing(), @convex.aff_dim_sing()]))
  let t1354 = @tactics.exists_tac(@term_syntax.parse_term("(v : Cart[Real, 3]) => {v}"))
  let t1392 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.card_image_inj_eq()), t1354), t1355), t1356), t1387), t1391])
  let t1353 = @tactics.exists_tac(@term_syntax.parse_term("CARD({(v : Cart[Real, 3]) | extreme_point_of(v, segment([((a : Cart[Real, 3]), (b : Cart[Real, 3]))]))})"))
  let t1352 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1350 = @simp.asm_rewrite_tac(@list.List([@topology.segment_refl(), @convex.aff_dim_sing(), @int.int_of_num_eq(), @calc_num.arith_eq()]))
  let t1351 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("aff_dim((e : (Cart[Real, 3]) -> Bool)) == int_of_num(1)")), t1350), @tactics.all_tac])
  let t1393 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(a : Cart[Real, 3]) == (b : Cart[Real, 3])")), t1351), t1352), t1353), @tactics.conj_tac), t1392)
  let t1345 = @meson.asm_meson_tac(@list.List([@misc.hull_subset()]))
  let t1344 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), @tactics.gen_tac))
  let t1343 = @simp.rewrite_tac(@list.List([@convex.collinear_affine_hull()]))
  let t1341 = @tactics.conv_tac(@equal.land_conv(@sets.has_size_conv))
  let t1342 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.has_size()])), t1341])
  let t1340 = @tactics.subgoal_then(@term_syntax.parse_term("HAS_SIZE((b : (Cart[Real, 3]) -> Bool), 2)"), fn(x1337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1338 = @tactics.mp_tac(x1337)
    fn(x1339 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1338(x1339)
    }
  })
  let t1336 = @simp.rewrite_tac(@list.List([@int.int_of_num_eq()]))
  let t1335 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@convex.affine_independent_imp_finite()]))])
  let t1334 = @class.asm_cases_tac(@term_syntax.parse_term("FINITE((b : (Cart[Real, 3]) -> Bool))"))
  let t1333 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1329 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1326 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1327 = @tactics.assume_tac(x1326)
      fn(x1328 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1327(x1328)
      }
    })(@equal.sym(x1329))
  }, fn(x1330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1331 = @tactics.mp_tac(x1330)
    fn(x1332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1331(x1332)
    }
  }))
  let t1325 = @simp.asm_rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(int_of_num(1) == (b : Int) - int_of_num(1)) == (b == int_of_num(2))"))]))
  let t1324 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : (Cart[Real, 3]) -> Bool)"))(fn(x1321 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1322 = @tactics.mp_tac(x1321)
    fn(x1323 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1322(x1323)
    }
  }))
  let t1346 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(e : (Cart[Real, 3]) -> Bool)"), @convex.aff_dim_v1())), t1324), t1325), t1333), t1334), t1335), t1336), @tactics.strip_tac), t1340), t1342), t1343), t1344), t1345)
  let t1347 = @meson.asm_meson_tac(@list.List([@polytope.face_of_imp_convex()]))
  let t1320 = @simp.asm_simp_tac(@list.List([@polytope.polytope_imp_convex(), @polytope.polytope_imp_compact()]))
  let t1319 = @tactics.exists_tac(@term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)"))
  let t1348 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@polytope.face_of_imp_compact()), t1319), t1320)
  let t1318 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@convex.aff_dim_empty()])))
  let t1349 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1315 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1316 = @tactics.subst_all_tac(x1315)
    fn(x1317 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1316(x1317)
    }
  }), t1318), @int.asm_int_arith_tac), t1348, t1347, t1346])
  let t1314 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1394 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@convex.compact_convex_collinear_segment()), t1314), t1349), t1393])
  let t1395 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ a : Cart[Real, 3], ∃ b : Cart[Real, 3], (e : (Cart[Real, 3]) -> Bool) == segment([(a, b)])"), @tactics.strip_assume_tac), t1394)
  let t1310 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.in_insert(), @sets.finite_rules(), @sets.not_in_empty(), @calc_num.arith()]))
  let t1309 = @meson.asm_meson_tac(@list.List([]))
  let t1308 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_insert(), @sets.not_in_empty()]))
  let t1311 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.gen_rewrite_tac(fn(x1307 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1307
  }, @list.List([@sets.extension()]))), t1308), t1309), t1310])
  let t1306 = @tactics.exists_tac(@term_syntax.parse_term("CARD({(f1 : (Cart[Real, 3]) -> Bool), (f2 : (Cart[Real, 3]) -> Bool)})"))
  let t1305 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1303 = @term_syntax.parse_term("(f2 : (Cart[Real, 3]) -> Bool)")
  let t1304 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f1 : (Cart[Real, 3]) -> Bool)"), t1303]))
  let t1302 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1312 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@int.int_reduce_conv), t1302), t1304), @tactics.strip_tac), t1305), t1306), @tactics.conj_tac), t1311)
  let t1301 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@convex.aff_dim_empty()])))
  let t1300 = @tactics.disch_then(fn(x1297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1298 = @tactics.subst_all_tac(x1297)
    fn(x1299 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1298(x1299)
    }
  })
  let t1313 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@int.int_reduce_conv), t1300), t1301), @int.asm_int_arith_tac), t1312])
  let t1296 = @simp.asm_simp_tac(@list.List([@polytope.polytope_imp_polyhedron()]))
  let t1295 = @term_syntax.parse_term("(e : (Cart[Real, 3]) -> Bool)")
  let t1396 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)"), t1295]), @polytope.polyhedron_ridge_two_facets())), t1296), @tactics.ants_tac), t1313), t1395])
  let t1294 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : (Cart[Real, 3]) -> Bool)"))
  let t1293 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @equal.gsym(@theorems.conj_assoc())]))
  let t1292 = @simp.asm_simp_tac(@list.List([@polytope.finite_polytope_faces(), @sets.finite_restrict()]))
  let t1291 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("face_of((f : (Cart[Real, _]) -> Bool), (s : (Cart[Real, _]) -> Bool)) == IN(f, {(f : (Cart[Real, _]) -> Bool) | face_of(f, s)})"))]))
  let t1289 = @tactics.exists_tac(@term_syntax.parse_term("(v : (Cart[Real, 3]) -> Bool) => (e : (Cart[Real, 3]) -> Bool) => SUBSET(v, e)"))
  let t1290 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(f : (Cart[Real, 3]) -> Bool) => (e : (Cart[Real, 3]) -> Bool) => SUBSET(e, f)")), t1289])
  let t1397 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(multiple_counting_lemma())), t1290), t1291), t1292), t1293), t1294), @tactics.strip_tac), t1396), @tactics.all_tac])
  let t1288 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) * CARD({(f : (Cart[Real, 3]) -> Bool) | face_of(f, (p : (Cart[Real, 3]) -> Bool)) && aff_dim(f) == int_of_num(2)}) == 2 * CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, p) && aff_dim(e) == int_of_num(1)}) && (n : Num) * CARD({(v : (Cart[Real, 3]) -> Bool) | face_of(v, p) && aff_dim(v) == int_of_num(0)}) == 2 * CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, p) && aff_dim(e) == int_of_num(1)})"), fn(x1285 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1286 = @tactics.mp_tac(x1285)
    fn(x1287 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1286(x1287)
    }
  })
  let t1284 = @simp.asm_rewrite_tac(@list.List([]))
  let t1283 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)"), @polyhedron.euler_relation()))
  let t1572 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1283), t1284), t1288), t1397), @tactics.strip_tac), t1403), t1407), t1412), t1416), t1427), t1433), t1434), t1435), t1436), @tactics.disch_tac), t1440), t1481), t1487), t1488), t1499), t1505), t1513), t1514), t1515), t1516), t1517), t1523), t1524), t1536), t1540), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t1541), t1550), t1554), t1565), t1566), t1567), t1568), @tactics.strip_tac), t1569), t1570), t1571), @int.asm_arith_tac)
  platonic_solids_limits_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, 3]) -> Bool, ∀ m : Num, ∀ n : Num, polytope(p) && aff_dim(p) == int_of_num(3) && (∀ f : (Cart[Real, 3]) -> Bool, face_of(f, p) && aff_dim(f) == int_of_num(2) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, p) && aff_dim(e) == int_of_num(1) && SUBSET(e, f)}) == m) && (∀ v : (Cart[Real, 3]) -> Bool, face_of(v, p) && aff_dim(v) == int_of_num(0) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, p) && aff_dim(e) == int_of_num(1) && SUBSET(v, e)}) == n) → m == 3 && n == 3 || m == 4 && n == 3 || m == 3 && n == 4 || m == 5 && n == 3 || m == 3 && n == 5"), t1572))
}

///|
let platonic_solids_limits_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PLATONIC_SOLIDS_LIMITS")

///|
/// `PLATONIC_SOLIDS_LIMITS`
pub fn platonic_solids_limits() -> @kernel.Thm {
  platonic_solids_limits_c.get()
}

///|
/// PLATONIC_SOLIDS
fn step_65() -> Unit raise {
  let t1593 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t1592 = @tactics.match_mp_tac(@polytope.polytope_convex_hull())
  let t1591 = @simp.rewrite_tac(@list.List([std_icosahedron_v1()]))
  let t1590 = @simp.asm_rewrite_tac(@list.List([icosahedron_edges_per_vertex(), icosahedron_edges_per_face(), std_icosahedron_fulldim()]))
  let t1594 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("std_icosahedron")), t1590), t1591), t1592), t1593)
  let t1589 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t1588 = @tactics.match_mp_tac(@polytope.polytope_convex_hull())
  let t1587 = @simp.rewrite_tac(@list.List([std_dodecahedron_v1()]))
  let t1586 = @simp.asm_rewrite_tac(@list.List([dodecahedron_edges_per_vertex(), dodecahedron_edges_per_face(), std_dodecahedron_fulldim()]))
  let t1595 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("std_dodecahedron")), t1586), t1587), t1588), t1589)
  let t1585 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t1584 = @tactics.match_mp_tac(@polytope.polytope_convex_hull())
  let t1583 = @simp.rewrite_tac(@list.List([std_octahedron()]))
  let t1582 = @simp.asm_rewrite_tac(@list.List([octahedron_edges_per_vertex(), octahedron_edges_per_face(), std_octahedron_fulldim()]))
  let t1596 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("std_octahedron")), t1582), t1583), t1584), t1585)
  let t1581 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t1580 = @tactics.match_mp_tac(@polytope.polytope_convex_hull())
  let t1579 = @simp.rewrite_tac(@list.List([std_cube()]))
  let t1578 = @simp.asm_rewrite_tac(@list.List([cube_edges_per_vertex(), cube_edges_per_face(), std_cube_fulldim()]))
  let t1597 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("std_cube")), t1578), t1579), t1580), t1581)
  let t1577 = @simp.rewrite_tac(@list.List([@sets.finite_insert(), @sets.finite_empty()]))
  let t1576 = @tactics.match_mp_tac(@polytope.polytope_convex_hull())
  let t1575 = @simp.rewrite_tac(@list.List([std_tetrahedron()]))
  let t1574 = @simp.asm_rewrite_tac(@list.List([tetrahedron_edges_per_vertex(), tetrahedron_edges_per_face(), std_tetrahedron_fulldim()]))
  let t1598 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("std_tetrahedron")), t1574), t1575), t1576), t1577), t1597, t1596, t1595, t1594])
  let t1573 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), platonic_solids_limits()]))
  let t1599 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t1573), @tactics.strip_tac), t1598)
  platonic_solids_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (∃ p : (Cart[Real, 3]) -> Bool, polytope(p) && aff_dim(p) == int_of_num(3) && (∀ f : (Cart[Real, 3]) -> Bool, face_of(f, p) && aff_dim(f) == int_of_num(2) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, p) && aff_dim(e) == int_of_num(1) && SUBSET(e, f)}) == m) && (∀ v : (Cart[Real, 3]) -> Bool, face_of(v, p) && aff_dim(v) == int_of_num(0) → CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, p) && aff_dim(e) == int_of_num(1) && SUBSET(v, e)}) == n)) == (m == 3 && n == 3 || m == 4 && n == 3 || m == 3 && n == 4 || m == 5 && n == 3 || m == 3 && n == 5)"), t1599))
}

///|
let platonic_solids_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PLATONIC_SOLIDS")

///|
/// `PLATONIC_SOLIDS`
pub fn platonic_solids() -> @kernel.Thm {
  platonic_solids_c.get()
}

///|
/// 100/platonic.ml:1875
fn step_66() -> Unit raise {
  @printer.parse_as_infix("congruent", (12L, "right"))
}

///|
/// congruent
fn step_67() -> Unit raise {
  congruent_c.set(@pair.new_definition(@term_syntax.parse_term("(congruent : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)((s : (Cart[Real, N]) -> Bool), (t : (Cart[Real, N]) -> Bool)) == (∃ c : Cart[Real, N], ∃ f : (Cart[Real, N]) -> Cart[Real, N], orthogonal_transformation(f) && t == IMAGE((x : Cart[Real, N]) => c + f(x), s))")))
}

///|
let congruent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("congruent")

///|
/// `congruent`
pub fn congruent() -> @kernel.Thm {
  congruent_c.get()
}

///|
/// CONGRUENT_SIMPLE
fn step_68() -> Unit raise {
  let t1613 = @simp.asm_simp_tac(@list.List([@vectors.matrix_of_matrix_vector_mul(), @vectors.matrix_vector_mul_linear()]))
  let t1612 = @simp.rewrite_tac(@list.List([@vectors.vector_add_lid(), @determinants.orthogonal_transformation_matrix()]))
  let t1611 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, 3]) => matrix_vector_mul((A : Cart[Cart[Real, 3], 3]), x)"))
  let t1610 = @tactics.exists_tac(@term_syntax.parse_term("(vec : (Num) -> Cart[Real, 3])(0)"))
  let t1609 = @simp.rewrite_tac(@list.List([congruent()]))
  let t1608 = @simp.simp_tac(@list.List([@convex.convex_hull_linear_image(), @vectors.matrix_vector_mul_linear()]))
  let t1607 = @tactics.disch_then(@tactics.choose_then(@tactics.conjuncts_then2(fn(x1600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1601 = @tactics.assume_tac(x1600)
    fn(x1602 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1601(x1602)
    }
  }, fn(x1606 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1603 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1604 = @tactics.subst1_tac(x1603)
      fn(x1605 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1604(x1605)
      }
    })(@equal.sym(x1606))
  })))
  let t1614 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1607), t1608), t1609), t1610), t1611), t1612), t1613)
  congruent_simple_c.set(@tactics.prove(@term_syntax.parse_term("(∃ A : Cart[Cart[Real, 3], 3], orthogonal_matrix(A) && IMAGE((x : Cart[Real, 3]) => matrix_vector_mul(A, x), (s : (Cart[Real, 3]) -> Bool)) == (t : (Cart[Real, 3]) -> Bool)) → congruent(hull(convex, s), hull(convex, t))"), t1614))
}

///|
let congruent_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONGRUENT_SIMPLE")

///|
/// `CONGRUENT_SIMPLE`
pub fn congruent_simple() -> @kernel.Thm {
  congruent_simple_c.get()
}

///|
/// CONGRUENT_SEGMENTS
fn step_69() -> Unit raise {
  let t1641 = @meson.asm_meson_tac(@list.List([@vectors.linear_sub()]))
  let t1640 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((d : Cart[Real, N]) == (c : Cart[Real, N]) - (a : Cart[Real, N]) + (b : Cart[Real, N])) == (b - a == d - c)"))]))
  let t1639 = @list.List([@vectors.vector_arith_tac, @tactics.then_tac(@tactics.ap_thm_tac, @tactics.ap_term_tac)])
  let t1638 = @simp.rewrite_tac(@list.List([@sets.image_clauses()]))
  let t1636 = @equal.gsym(@convex.convex_hull_translation())
  let t1637 = @simp.asm_simp_tac(@list.List([@equal.gsym(@convex.convex_hull_linear_image()), @convex.segment_convex_hull(), @sets.image_o(), t1636]))
  let t1635 = @list.List([@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm()])), @tactics.all_tac])
  let t1634 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Cart[Real, N]) => (c : Cart[Real, N]) - (f : (Cart[Real, N]) -> Cart[Real, N])((a : Cart[Real, N])) + f(x)) == o((x : Cart[Real, N]) => c - f(a) + x, f)"), fn(x1631 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1632 = @tactics.subst1_tac(x1631)
    fn(x1633 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1632(x1633)
    }
  })
  let t1628 = @drule.match_mp(@determinants.orthogonal_transformation_linear())
  let t1630 = @tactics.first_assum(fn(x1629 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1625 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1626 = @tactics.assume_tac(x1625)
      fn(x1627 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1626(x1627)
      }
    })(t1628(x1629))
  })
  let t1624 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Cart[Real, N])"))
  let t1623 = @tactics.exists_tac(@term_syntax.parse_term("(c : Cart[Real, N]) - (f : (Cart[Real, N]) -> Cart[Real, N])((a : Cart[Real, N]))"))
  let t1622 = @simp.rewrite_tac(@list.List([congruent()]))
  let t1621 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Cart[Real, N])"))(@tactics.strip_assume_tac))
  let t1620 = @list.List([@tactics.then_tac(@tactics.pop_assum(fn(x1617 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1618 = @tactics.mp_tac(x1617)
    fn(x1619 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1618(x1619)
    }
  }), @vectors.norm_arith_tac), @tactics.all_tac])
  let t1615 = @term_syntax.parse_term("(d : Cart[Real, N]) - (c : Cart[Real, N])")
  let t1616 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(b : Cart[Real, N]) - (a : Cart[Real, N])"), t1615]), @determinants.orthogonal_transformation_exists()))
  let t1642 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1616), @tactics.ants_tac), t1620), t1621), t1622), t1623), t1624), t1630), t1634), t1635), t1637), t1638), @tactics.ap_term_tac), @tactics.binop_tac), t1639), t1640), t1641)
  congruent_segments_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Cart[Real, N], ∀ c : Cart[Real, N], ∀ d : Cart[Real, N], distance((a, b)) == distance((c, d)) → congruent(segment([(a, b)]), segment([(c, d)]))"), t1642))
}

///|
let congruent_segments_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONGRUENT_SEGMENTS")

///|
/// `CONGRUENT_SEGMENTS`
pub fn congruent_segments() -> @kernel.Thm {
  congruent_segments_c.get()
}

///|
/// compute_dist
fn step_70() -> Unit raise {
  let t1643 = @term_syntax.parse_term("(op_minus : (Cart[Real, 3], Cart[Real, 3]) -> Cart[Real, 3])")
  let mk_sub : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x1646 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x1647 : @kernel.Term) -> @kernel.Term raise {
      ((x1644 : @kernel.Term, x1645 : @kernel.Term) => @basics.mk_binop(t1643, x1644, x1645))(x1646, x1647)
    }
  }
  let dot_tm = @term_syntax.parse_term("(dot : (Cart[Real, 3], Cart[Real, 3]) -> Real)")
  compute_dist_c.set(fn(x1648 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let v1 = x1648
    fn(x1649 : @kernel.Term) -> @kernel.Term raise {
      let v2 = x1649
      let vth = vector3_sub_conv(mk_sub(v1)(v2))
      let t1650 = @kernel.mk_comb_rule(@equal.ap_term(dot_tm, vth), vth)
      let dth = @equal.conv_rule(@equal.rand_conv(vector3_dot_conv), t1650)
      @kernel.rand(@kernel.concl(dth))
    }
  })
}

///|
let compute_dist_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise] = @lib.Cell::new("compute_dist")

///|
/// `compute_dist`
pub fn compute_dist(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
  (compute_dist_c.get())(x)
}

///|
/// le_rat5
fn step_71() -> Unit raise {
  let t1651 = @term_syntax.parse_term("real_le")
  let mk_le : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x1654 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x1655 : @kernel.Term) -> @kernel.Term raise {
      ((x1652 : @kernel.Term, x1653 : @kernel.Term) => @basics.mk_binop(t1651, x1652, x1653))(x1654, x1655)
    }
  }
  let t_tm = @term_syntax.parse_term("true")
  le_rat5_c.set(fn(x1656 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
    let r1 = x1656
    fn(x1657 : @kernel.Term) -> Bool raise {
      let r2 = x1657
      (@kernel.rand(@kernel.concl(real_rat5_le_conv(mk_le(r1)(r2)))) == t_tm)
    }
  })
}

///|
let le_rat5_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> Bool raise) raise] = @lib.Cell::new("le_rat5")

///|
/// `le_rat5`
pub fn le_rat5(x : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
  (le_rat5_c.get())(x)
}

///|
/// `three_adjacent_points`
pub fn three_adjacent_points(x1658 : @list.List[@kernel.Term]) -> ((@kernel.Term, @kernel.Term, @kernel.Term)) raise {
  let s = x1658
  match s {
    More(x, tail=t) => {
      match @lib.sort(fn(x1659 : (@kernel.Term, @kernel.Term), x1660 : (@kernel.Term, @kernel.Term)) -> Bool raise {
        let (_, r1) = x1659
        let (_, r2) = x1660
        le_rat5(r1)(r2)
      }, @lib.map(fn(x1661 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
        let y = x1661
        (y, compute_dist(x)(y))
      }, t)) {
        More((y_1, _), tail=More((z, _), tail=_)) => (x, y_1, z)
        _ => raise @lib.MatchFailure("tscript.ml:1930")
      }
    }
    _ => raise Failure("three_adjacent_points: no points")
  }
}

///|
/// mk_33matrix
fn step_72() -> Unit raise {
  let a11_tm = @term_syntax.parse_term("(a11 : Real)")
  let a12_tm = @term_syntax.parse_term("(a12 : Real)")
  let a13_tm = @term_syntax.parse_term("(a13 : Real)")
  let a21_tm = @term_syntax.parse_term("(a21 : Real)")
  let a22_tm = @term_syntax.parse_term("(a22 : Real)")
  let a23_tm = @term_syntax.parse_term("(a23 : Real)")
  let a31_tm = @term_syntax.parse_term("(a31 : Real)")
  let a32_tm = @term_syntax.parse_term("(a32 : Real)")
  let a33_tm = @term_syntax.parse_term("(a33 : Real)")
  let pat_tm = @term_syntax.parse_term("(vector : (List[Cart[Real, 3]]) -> Cart[Cart[Real, 3], 3])([(vector : (List[Real]) -> Cart[Real, 3])([(a11 : Real), (a12 : Real), (a13 : Real)]), (vector : (List[Real]) -> Cart[Real, 3])([(a21 : Real), (a22 : Real), (a23 : Real)]), (vector : (List[Real]) -> Cart[Real, 3])([(a31 : Real), (a32 : Real), (a33 : Real)])])")
  mk_33matrix_c.set(fn(x1662 : @list.List[@kernel.Term]) -> @kernel.Term raise {
    match x1662 {
      More(a11, tail=More(a12, tail=More(a13, tail=More(a21, tail=More(a22, tail=More(a23, tail=More(a31, tail=More(a32, tail=More(a33, tail=Empty))))))))) => @kernel.vsubst(@list.List([(a11, a11_tm), (a12, a12_tm), (a13, a13_tm), (a21, a21_tm), (a22, a22_tm), (a23, a23_tm), (a31, a31_tm), (a32, a32_tm), (a33, a33_tm)]), pat_tm)
      _ => raise @lib.MatchFailure("tscript.ml:1950")
    }
  })
}

///|
let mk_33matrix_c : @lib.Cell[(@list.List[@kernel.Term]) -> @kernel.Term raise] = @lib.Cell::new("mk_33matrix")

///|
/// `mk_33matrix`
pub fn mk_33matrix(x : @list.List[@kernel.Term]) -> @kernel.Term raise {
  (mk_33matrix_c.get())(x)
}

///|
/// MATRIX_VECTOR_MUL_3
fn step_73() -> Unit raise {
  let t1663 = @simp.rewrite_tac(@list.List([@cart.dimindex_3(), @vectors.forall_3(), @vectors.sum_3(), @vectors.vector_3()]))
  let t1664 = @tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.matrix_vector_mul(), @cart.lambda_beta()])), t1663)
  matrix_vector_mul_3_c.set(@tactics.prove(@term_syntax.parse_term("(matrix_vector_mul : (Cart[Cart[Real, 3], 3], Cart[Real, 3]) -> Cart[Real, 3])((vector : (List[Cart[Real, 3]]) -> Cart[Cart[Real, 3], 3])([(vector : (List[Real]) -> Cart[Real, 3])([(a11 : Real), (a12 : Real), (a13 : Real)]), (vector : (List[Real]) -> Cart[Real, 3])([(a21 : Real), (a22 : Real), (a23 : Real)]), (vector : (List[Real]) -> Cart[Real, 3])([(a31 : Real), (a32 : Real), (a33 : Real)])]), (vector : (List[Real]) -> Cart[Real, 3])([(x1 : Real), (x2 : Real), (x3 : Real)])) == (vector : (List[Real]) -> Cart[Real, 3])([a11 * x1 + (a12 * x2 + a13 * x3), a21 * x1 + (a22 * x2 + a23 * x3), a31 * x1 + (a32 * x2 + a33 * x3)])"), t1664))
}

///|
let matrix_vector_mul_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MATRIX_VECTOR_MUL_3")

///|
/// `MATRIX_VECTOR_MUL_3`
pub fn matrix_vector_mul_3() -> @kernel.Thm {
  matrix_vector_mul_3_c.get()
}

///|
/// MATRIX_LEMMA
fn step_74() -> Unit raise {
  let t1665 = @simp.rewrite_tac(@list.List([@vectors.forall_3(), @cart.dimindex_3(), @vectors.vector_3(), @vectors.sum_3()]))
  let t1666 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.transp(), @vectors.matrix_vector_mul(), @vectors.row(), @vectors.vector_3(), @cart.lambda_beta()])), t1665), @calc_rat.real_arith_tac)
  matrix_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Cart[Real, 3], 3], ((matrix_vector_mul : (Cart[Cart[Real, 3], 3], Cart[Real, 3]) -> Cart[Real, 3])(A, (x1 : Cart[Real, 3])) == (x2 : Cart[Real, 3]) && (matrix_vector_mul : (Cart[Cart[Real, 3], 3], Cart[Real, 3]) -> Cart[Real, 3])(A, (y1 : Cart[Real, 3])) == (y2 : Cart[Real, 3]) && (matrix_vector_mul : (Cart[Cart[Real, 3], 3], Cart[Real, 3]) -> Cart[Real, 3])(A, (z1 : Cart[Real, 3])) == (z2 : Cart[Real, 3])) == ((matrix_vector_mul : (Cart[Cart[Real, 3], 3], Cart[Real, 3]) -> Cart[Real, 3])((vector : (List[Cart[Real, 3]]) -> Cart[Cart[Real, 3], 3])([x1, y1, z1]), (row : (Num, Cart[Cart[Real, 3], 3]) -> Cart[Real, 3])(1, A)) == (vector : (List[Real]) -> Cart[Real, 3])([(op_dollar : (Cart[Real, 3], Num) -> Real)(x2, 1), (op_dollar : (Cart[Real, 3], Num) -> Real)(y2, 1), (op_dollar : (Cart[Real, 3], Num) -> Real)(z2, 1)]) && (matrix_vector_mul : (Cart[Cart[Real, 3], 3], Cart[Real, 3]) -> Cart[Real, 3])((vector : (List[Cart[Real, 3]]) -> Cart[Cart[Real, 3], 3])([x1, y1, z1]), (row : (Num, Cart[Cart[Real, 3], 3]) -> Cart[Real, 3])(2, A)) == (vector : (List[Real]) -> Cart[Real, 3])([(op_dollar : (Cart[Real, 3], Num) -> Real)(x2, 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(y2, 2), (op_dollar : (Cart[Real, 3], Num) -> Real)(z2, 2)]) && (matrix_vector_mul : (Cart[Cart[Real, 3], 3], Cart[Real, 3]) -> Cart[Real, 3])((vector : (List[Cart[Real, 3]]) -> Cart[Cart[Real, 3], 3])([x1, y1, z1]), (row : (Num, Cart[Cart[Real, 3], 3]) -> Cart[Real, 3])(3, A)) == (vector : (List[Real]) -> Cart[Real, 3])([(op_dollar : (Cart[Real, 3], Num) -> Real)(x2, 3), (op_dollar : (Cart[Real, 3], Num) -> Real)(y2, 3), (op_dollar : (Cart[Real, 3], Num) -> Real)(z2, 3)]))"), t1666))
}

///|
let matrix_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MATRIX_LEMMA")

///|
/// `MATRIX_LEMMA`
pub fn matrix_lemma() -> @kernel.Thm {
  matrix_lemma_c.get()
}

///|
/// MATRIX_BY_CRAMER_LEMMA
fn step_75() -> Unit raise {
  let t1674 = @simp.rewrite_tac(@list.List([@cart.dimindex_3(), @vectors.forall_3()]))
  let t1673 = @simp.simp_tac(@list.List([@cart.lambda_beta()]))
  let t1672 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @vectors.row()]))
  let t1671 = @simp.asm_simp_tac(@list.List([@determinants.cramer()]))
  let t1670 = @simp.gen_rewrite_tac(fn(x1667 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1668 = @equal.land_conv(x1667)
    fn(x1669 : @kernel.Term) -> @kernel.Thm raise {
      s1668(x1669)
    }
  }, @list.List([matrix_lemma()]))
  let t1675 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1670), t1671), t1672), t1673), t1674)
  matrix_by_cramer_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Cart[Real, 3], 3], !((det : (Cart[Cart[Real, 3], 3]) -> Real)((vector : (List[Cart[Real, 3]]) -> Cart[Cart[Real, 3], 3])([(x1 : Cart[Real, 3]), (y1 : Cart[Real, 3]), (z1 : Cart[Real, 3])])) == real_of_num(0)) → ((matrix_vector_mul : (Cart[Cart[Real, 3], 3], Cart[Real, 3]) -> Cart[Real, 3])(A, x1) == (x2 : Cart[Real, 3]) && (matrix_vector_mul : (Cart[Cart[Real, 3], 3], Cart[Real, 3]) -> Cart[Real, 3])(A, y1) == (y2 : Cart[Real, 3]) && (matrix_vector_mul : (Cart[Cart[Real, 3], 3], Cart[Real, 3]) -> Cart[Real, 3])(A, z1) == (z2 : Cart[Real, 3])) == (A == (lambda : ((Num) -> Cart[Real, 3]) -> Cart[Cart[Real, 3], 3])((m : Num) => (lambda : ((Num) -> Real) -> Cart[Real, 3])((k : Num) => (det : (Cart[Cart[Real, 3], 3]) -> Real)((lambda : ((Num) -> Cart[Real, 3]) -> Cart[Cart[Real, 3], 3])((i : Num) => (lambda : ((Num) -> Real) -> Cart[Real, 3])((j : Num) => if j == k { (op_dollar : (Cart[Real, 3], Num) -> Real)((vector : (List[Real]) -> Cart[Real, 3])([(op_dollar : (Cart[Real, 3], Num) -> Real)(x2, m), (op_dollar : (Cart[Real, 3], Num) -> Real)(y2, m), (op_dollar : (Cart[Real, 3], Num) -> Real)(z2, m)]), i) } else { (op_dollar : (Cart[Real, 3], Num) -> Real)((op_dollar : (Cart[Cart[Real, 3], 3], Num) -> Cart[Real, 3])((vector : (List[Cart[Real, 3]]) -> Cart[Cart[Real, 3], 3])([x1, y1, z1]), i), j) }))) / (det : (Cart[Cart[Real, 3], 3]) -> Real)((vector : (List[Cart[Real, 3]]) -> Cart[Cart[Real, 3], 3])([x1, y1, z1])))))"), t1675))
}

///|
let matrix_by_cramer_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MATRIX_BY_CRAMER_LEMMA")

///|
/// `MATRIX_BY_CRAMER_LEMMA`
pub fn matrix_by_cramer_lemma() -> @kernel.Thm {
  matrix_by_cramer_lemma_c.get()
}

///|
/// MATRIX_BY_CRAMER
fn step_76() -> Unit raise {
  let t1681 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t1680 = @simp.rewrite_tac(@list.List([@vectors.forall_3(), @calc_num.arith(), @vectors.vector_3()]))
  let t1679 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @cart.dimindex_3(), @calc_num.arith(), @vectors.vector_3()]))
  let t1678 = @simp.rewrite_tac(@list.List([@determinants.det_3(), @cart.cart_eq()]))
  let t1677 = @simp.asm_simp_tac(@list.List([matrix_by_cramer_lemma()]))
  let t1676 = @tactics.conv_tac(@pair.let_conv)
  let t1682 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1676), @tactics.disch_tac), t1677), t1678), t1679), t1680), t1681)
  matrix_by_cramer_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Cart[Real, 3], 3], ∀ x1 : Cart[Real, 3], ∀ y1 : Cart[Real, 3], ∀ z1 : Cart[Real, 3], ∀ x2 : Cart[Real, 3], ∀ y2 : Cart[Real, 3], ∀ z2 : Cart[Real, 3], LET((d : Real) => LET_END(!(d == real_of_num(0)) → (matrix_vector_mul(A, x1) == x2 && matrix_vector_mul(A, y1) == y2 && matrix_vector_mul(A, z1) == z2) == (op_dollar(op_dollar(A, 1), 1) == (op_dollar(x2, 1) * (op_dollar(y1, 2) * op_dollar(z1, 3)) + (op_dollar(x1, 2) * (op_dollar(y1, 3) * op_dollar(z2, 1)) + (op_dollar(x1, 3) * (op_dollar(y2, 1) * op_dollar(z1, 2)) - op_dollar(x2, 1) * (op_dollar(y1, 3) * op_dollar(z1, 2)) - op_dollar(x1, 2) * (op_dollar(y2, 1) * op_dollar(z1, 3)) - op_dollar(x1, 3) * (op_dollar(y1, 2) * op_dollar(z2, 1))))) / d && op_dollar(op_dollar(A, 1), 2) == (op_dollar(x1, 1) * (op_dollar(y2, 1) * op_dollar(z1, 3)) + (op_dollar(x2, 1) * (op_dollar(y1, 3) * op_dollar(z1, 1)) + (op_dollar(x1, 3) * (op_dollar(y1, 1) * op_dollar(z2, 1)) - op_dollar(x1, 1) * (op_dollar(y1, 3) * op_dollar(z2, 1)) - op_dollar(x2, 1) * (op_dollar(y1, 1) * op_dollar(z1, 3)) - op_dollar(x1, 3) * (op_dollar(y2, 1) * op_dollar(z1, 1))))) / d && op_dollar(op_dollar(A, 1), 3) == (op_dollar(x1, 1) * (op_dollar(y1, 2) * op_dollar(z2, 1)) + (op_dollar(x1, 2) * (op_dollar(y2, 1) * op_dollar(z1, 1)) + (op_dollar(x2, 1) * (op_dollar(y1, 1) * op_dollar(z1, 2)) - op_dollar(x1, 1) * (op_dollar(y2, 1) * op_dollar(z1, 2)) - op_dollar(x1, 2) * (op_dollar(y1, 1) * op_dollar(z2, 1)) - op_dollar(x2, 1) * (op_dollar(y1, 2) * op_dollar(z1, 1))))) / d && op_dollar(op_dollar(A, 2), 1) == (op_dollar(x2, 2) * (op_dollar(y1, 2) * op_dollar(z1, 3)) + (op_dollar(x1, 2) * (op_dollar(y1, 3) * op_dollar(z2, 2)) + (op_dollar(x1, 3) * (op_dollar(y2, 2) * op_dollar(z1, 2)) - op_dollar(x2, 2) * (op_dollar(y1, 3) * op_dollar(z1, 2)) - op_dollar(x1, 2) * (op_dollar(y2, 2) * op_dollar(z1, 3)) - op_dollar(x1, 3) * (op_dollar(y1, 2) * op_dollar(z2, 2))))) / d && op_dollar(op_dollar(A, 2), 2) == (op_dollar(x1, 1) * (op_dollar(y2, 2) * op_dollar(z1, 3)) + (op_dollar(x2, 2) * (op_dollar(y1, 3) * op_dollar(z1, 1)) + (op_dollar(x1, 3) * (op_dollar(y1, 1) * op_dollar(z2, 2)) - op_dollar(x1, 1) * (op_dollar(y1, 3) * op_dollar(z2, 2)) - op_dollar(x2, 2) * (op_dollar(y1, 1) * op_dollar(z1, 3)) - op_dollar(x1, 3) * (op_dollar(y2, 2) * op_dollar(z1, 1))))) / d && op_dollar(op_dollar(A, 2), 3) == (op_dollar(x1, 1) * (op_dollar(y1, 2) * op_dollar(z2, 2)) + (op_dollar(x1, 2) * (op_dollar(y2, 2) * op_dollar(z1, 1)) + (op_dollar(x2, 2) * (op_dollar(y1, 1) * op_dollar(z1, 2)) - op_dollar(x1, 1) * (op_dollar(y2, 2) * op_dollar(z1, 2)) - op_dollar(x1, 2) * (op_dollar(y1, 1) * op_dollar(z2, 2)) - op_dollar(x2, 2) * (op_dollar(y1, 2) * op_dollar(z1, 1))))) / d && op_dollar(op_dollar(A, 3), 1) == (op_dollar(x2, 3) * (op_dollar(y1, 2) * op_dollar(z1, 3)) + (op_dollar(x1, 2) * (op_dollar(y1, 3) * op_dollar(z2, 3)) + (op_dollar(x1, 3) * (op_dollar(y2, 3) * op_dollar(z1, 2)) - op_dollar(x2, 3) * (op_dollar(y1, 3) * op_dollar(z1, 2)) - op_dollar(x1, 2) * (op_dollar(y2, 3) * op_dollar(z1, 3)) - op_dollar(x1, 3) * (op_dollar(y1, 2) * op_dollar(z2, 3))))) / d && op_dollar(op_dollar(A, 3), 2) == (op_dollar(x1, 1) * (op_dollar(y2, 3) * op_dollar(z1, 3)) + (op_dollar(x2, 3) * (op_dollar(y1, 3) * op_dollar(z1, 1)) + (op_dollar(x1, 3) * (op_dollar(y1, 1) * op_dollar(z2, 3)) - op_dollar(x1, 1) * (op_dollar(y1, 3) * op_dollar(z2, 3)) - op_dollar(x2, 3) * (op_dollar(y1, 1) * op_dollar(z1, 3)) - op_dollar(x1, 3) * (op_dollar(y2, 3) * op_dollar(z1, 1))))) / d && op_dollar(op_dollar(A, 3), 3) == (op_dollar(x1, 1) * (op_dollar(y1, 2) * op_dollar(z2, 3)) + (op_dollar(x1, 2) * (op_dollar(y2, 3) * op_dollar(z1, 1)) + (op_dollar(x2, 3) * (op_dollar(y1, 1) * op_dollar(z1, 2)) - op_dollar(x1, 1) * (op_dollar(y2, 3) * op_dollar(z1, 2)) - op_dollar(x1, 2) * (op_dollar(y1, 1) * op_dollar(z2, 3)) - op_dollar(x2, 3) * (op_dollar(y1, 2) * op_dollar(z1, 1))))) / d)), det(vector([x1, y1, z1])))"), t1682))
}

///|
let matrix_by_cramer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MATRIX_BY_CRAMER")

///|
/// `MATRIX_BY_CRAMER`
pub fn matrix_by_cramer() -> @kernel.Thm {
  matrix_by_cramer_c.get()
}

///|
/// `CONGRUENT_EDGES_TAC`
pub fn congruent_edges_tac(x1683 : @kernel.Thm) -> @tactics.Tactic raise {
  let edges = x1683
  let t1695 = @simp.rewrite_tac(@list.List([]))
  let t1694 = @tactics.conv_tac(@equal.once_depth_conv(real_rat5_eq_conv))
  let t1693 = @tactics.conv_tac(@equal.once_depth_conv(vector3_dot_conv))
  let t1692 = @tactics.conv_tac(@equal.once_depth_conv(vector3_sub_conv))
  let t1691 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.norm_pow_2()]))
  let t1690 = @simp.rewrite_tac(@list.List([@vectors.dist_eq()]))
  let t1689 = @tactics.match_mp_tac(congruent_segments())
  let t1688 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@convex.segment_convex_hull())]))
  let t1687 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1686 = @simp.rewrite_tac(@list.List([edges]))
  let t1685 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), t1685), t1686), t1687), t1688), t1689), t1690), t1691), t1692), t1693), t1694), t1695)
}

///|
/// `CONGRUENT_FACES_TAC`
pub fn congruent_faces_tac(x1696 : @kernel.Thm) -> @tactics.Tactic raise {
  let facets = x1696
  let t1701 = @simp.asm_rewrite_tac(@list.List([]))
  let t1700 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1699 = @simp.rewrite_tac(@list.List([facets]))
  let t1698 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), t1698), t1699), t1700), t1701), fn(x1717 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1702 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x1702
      let t1 = @kernel.rand(@equal.lhand(w))
      let t2 = @kernel.rand(@kernel.rand(w))
      let (x1, y1, z1) = three_adjacent_points(@sets.dest_setenum(t1))
      let (x2, y2, z2) = three_adjacent_points(@sets.dest_setenum(t2))
      let th1 = @bool.specl(@list.List([@term_syntax.parse_term("(A : Cart[Cart[Real, 3], 3])"), x1, y1, z1, x2, y2, z2]), matrix_by_cramer())
      let th2 = @simp.rewrite_rule(@list.List([@vectors.vector_3(), @determinants.det_3()]))(th1)
      let th3 = @equal.conv_rule(@equal.depth_conv(real_rat5_mul_conv), th2)
      let th4 = @equal.conv_rule(@equal.depth_conv(@equal.orelsec(real_rat5_add_conv, real_rat5_sub_conv)), th3)
      let th5 = @equal.conv_rule(@pair.let_conv, th4)
      let th6 = @equal.conv_rule(@equal.once_depth_conv(real_rat5_div_conv), th5)
      let th7 = @equal.conv_rule(@equal.once_depth_conv(real_rat5_eq_conv), th6)
      let t1704 = @equal.lhand(@kernel.concl(th7))
      let th8 = @bool.mp(th7, @bool.eqt_elim(@simp.rewrite_conv(@list.List([]))(t1704)))
      let tms = @lib.map(@equal.rhs, @basics.conjuncts(@kernel.rand(@kernel.concl(th8))))
      let matt = mk_33matrix(tms)
      let t1714 = @simp.rewrite_tac(@list.List([@sets.insert_ac()]))
      let t1713 = @tactics.conv_tac(@equal.depth_conv(real_rat5_add_conv))
      let t1712 = @tactics.conv_tac(@equal.once_depth_conv(real_rat5_mul_conv))
      let t1715 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.image_clauses(), matrix_vector_mul_3()])), t1712), t1713), t1714)
      let t1711 = @simp.rewrite_tac(@list.List([]))
      let t1710 = @tactics.conv_tac(@equal.once_depth_conv(real_rat5_eq_conv))
      let t1709 = @tactics.conv_tac(@equal.depth_conv(real_rat5_add_conv))
      let t1708 = @tactics.conv_tac(@equal.once_depth_conv(real_rat5_mul_conv))
      let t1707 = @simp.rewrite_tac(@list.List([@cart.dimindex_3(), @vectors.sum_3(), @vectors.forall_3(), @vectors.vector_3(), @calc_num.arith()]))
      let t1706 = @simp.simp_tac(@list.List([@vectors.transp(), @cart.lambda_beta(), @vectors.matrix_mul(), @vectors.mat()]))
      let t1716 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@determinants.orthogonal_matrix_v1(), @cart.cart_eq()])), t1706), t1707), t1708), t1709), t1710), t1711), @tactics.no_tac), t1715])
      let t1705 = @tactics.exists_tac(matt)
      @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(congruent_simple()), t1705), @tactics.conj_tac), t1716)
    })(x1717)(x1717)
  })
}

///|
/// TETRAHEDRON_CONGRUENT_EDGES
fn step_77() -> Unit raise {
  let t1718 = congruent_edges_tac(tetrahedron_edges())
  tetrahedron_congruent_edges_c.set(@tactics.prove(@term_syntax.parse_term("∀ e1 : (Cart[Real, 3]) -> Bool, ∀ e2 : (Cart[Real, 3]) -> Bool, face_of(e1, std_tetrahedron) && aff_dim(e1) == int_of_num(1) && face_of(e2, std_tetrahedron) && aff_dim(e2) == int_of_num(1) → congruent(e1, e2)"), t1718))
}

///|
let tetrahedron_congruent_edges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TETRAHEDRON_CONGRUENT_EDGES")

///|
/// `TETRAHEDRON_CONGRUENT_EDGES`
pub fn tetrahedron_congruent_edges() -> @kernel.Thm {
  tetrahedron_congruent_edges_c.get()
}

///|
/// TETRAHEDRON_CONGRUENT_FACETS
fn step_78() -> Unit raise {
  let t1719 = congruent_faces_tac(tetrahedron_facets())
  tetrahedron_congruent_facets_c.set(@tactics.prove(@term_syntax.parse_term("∀ f1 : (Cart[Real, 3]) -> Bool, ∀ f2 : (Cart[Real, 3]) -> Bool, face_of(f1, std_tetrahedron) && aff_dim(f1) == int_of_num(2) && face_of(f2, std_tetrahedron) && aff_dim(f2) == int_of_num(2) → congruent(f1, f2)"), t1719))
}

///|
let tetrahedron_congruent_facets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TETRAHEDRON_CONGRUENT_FACETS")

///|
/// `TETRAHEDRON_CONGRUENT_FACETS`
pub fn tetrahedron_congruent_facets() -> @kernel.Thm {
  tetrahedron_congruent_facets_c.get()
}

///|
/// CUBE_CONGRUENT_EDGES
fn step_79() -> Unit raise {
  let t1720 = congruent_edges_tac(cube_edges())
  cube_congruent_edges_c.set(@tactics.prove(@term_syntax.parse_term("∀ e1 : (Cart[Real, 3]) -> Bool, ∀ e2 : (Cart[Real, 3]) -> Bool, face_of(e1, std_cube) && aff_dim(e1) == int_of_num(1) && face_of(e2, std_cube) && aff_dim(e2) == int_of_num(1) → congruent(e1, e2)"), t1720))
}

///|
let cube_congruent_edges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBE_CONGRUENT_EDGES")

///|
/// `CUBE_CONGRUENT_EDGES`
pub fn cube_congruent_edges() -> @kernel.Thm {
  cube_congruent_edges_c.get()
}

///|
/// CUBE_CONGRUENT_FACETS
fn step_80() -> Unit raise {
  let t1721 = congruent_faces_tac(cube_facets())
  cube_congruent_facets_c.set(@tactics.prove(@term_syntax.parse_term("∀ f1 : (Cart[Real, 3]) -> Bool, ∀ f2 : (Cart[Real, 3]) -> Bool, face_of(f1, std_cube) && aff_dim(f1) == int_of_num(2) && face_of(f2, std_cube) && aff_dim(f2) == int_of_num(2) → congruent(f1, f2)"), t1721))
}

///|
let cube_congruent_facets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBE_CONGRUENT_FACETS")

///|
/// `CUBE_CONGRUENT_FACETS`
pub fn cube_congruent_facets() -> @kernel.Thm {
  cube_congruent_facets_c.get()
}

///|
/// OCTAHEDRON_CONGRUENT_EDGES
fn step_81() -> Unit raise {
  let t1722 = congruent_edges_tac(octahedron_edges())
  octahedron_congruent_edges_c.set(@tactics.prove(@term_syntax.parse_term("∀ e1 : (Cart[Real, 3]) -> Bool, ∀ e2 : (Cart[Real, 3]) -> Bool, face_of(e1, std_octahedron) && aff_dim(e1) == int_of_num(1) && face_of(e2, std_octahedron) && aff_dim(e2) == int_of_num(1) → congruent(e1, e2)"), t1722))
}

///|
let octahedron_congruent_edges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OCTAHEDRON_CONGRUENT_EDGES")

///|
/// `OCTAHEDRON_CONGRUENT_EDGES`
pub fn octahedron_congruent_edges() -> @kernel.Thm {
  octahedron_congruent_edges_c.get()
}

///|
/// OCTAHEDRON_CONGRUENT_FACETS
fn step_82() -> Unit raise {
  let t1723 = congruent_faces_tac(octahedron_facets())
  octahedron_congruent_facets_c.set(@tactics.prove(@term_syntax.parse_term("∀ f1 : (Cart[Real, 3]) -> Bool, ∀ f2 : (Cart[Real, 3]) -> Bool, face_of(f1, std_octahedron) && aff_dim(f1) == int_of_num(2) && face_of(f2, std_octahedron) && aff_dim(f2) == int_of_num(2) → congruent(f1, f2)"), t1723))
}

///|
let octahedron_congruent_facets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OCTAHEDRON_CONGRUENT_FACETS")

///|
/// `OCTAHEDRON_CONGRUENT_FACETS`
pub fn octahedron_congruent_facets() -> @kernel.Thm {
  octahedron_congruent_facets_c.get()
}

///|
/// DODECAHEDRON_CONGRUENT_EDGES
fn step_83() -> Unit raise {
  let t1724 = congruent_edges_tac(dodecahedron_edges())
  dodecahedron_congruent_edges_c.set(@tactics.prove(@term_syntax.parse_term("∀ e1 : (Cart[Real, 3]) -> Bool, ∀ e2 : (Cart[Real, 3]) -> Bool, face_of(e1, std_dodecahedron) && aff_dim(e1) == int_of_num(1) && face_of(e2, std_dodecahedron) && aff_dim(e2) == int_of_num(1) → congruent(e1, e2)"), t1724))
}

///|
let dodecahedron_congruent_edges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DODECAHEDRON_CONGRUENT_EDGES")

///|
/// `DODECAHEDRON_CONGRUENT_EDGES`
pub fn dodecahedron_congruent_edges() -> @kernel.Thm {
  dodecahedron_congruent_edges_c.get()
}

///|
/// DODECAHEDRON_CONGRUENT_FACETS
fn step_84() -> Unit raise {
  let t1725 = congruent_faces_tac(dodecahedron_facets())
  dodecahedron_congruent_facets_c.set(@tactics.prove(@term_syntax.parse_term("∀ f1 : (Cart[Real, 3]) -> Bool, ∀ f2 : (Cart[Real, 3]) -> Bool, face_of(f1, std_dodecahedron) && aff_dim(f1) == int_of_num(2) && face_of(f2, std_dodecahedron) && aff_dim(f2) == int_of_num(2) → congruent(f1, f2)"), t1725))
}

///|
let dodecahedron_congruent_facets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DODECAHEDRON_CONGRUENT_FACETS")

///|
/// `DODECAHEDRON_CONGRUENT_FACETS`
pub fn dodecahedron_congruent_facets() -> @kernel.Thm {
  dodecahedron_congruent_facets_c.get()
}

///|
/// ICOSAHEDRON_CONGRUENT_EDGES
fn step_85() -> Unit raise {
  let t1726 = congruent_edges_tac(icosahedron_edges())
  icosahedron_congruent_edges_c.set(@tactics.prove(@term_syntax.parse_term("∀ e1 : (Cart[Real, 3]) -> Bool, ∀ e2 : (Cart[Real, 3]) -> Bool, face_of(e1, std_icosahedron) && aff_dim(e1) == int_of_num(1) && face_of(e2, std_icosahedron) && aff_dim(e2) == int_of_num(1) → congruent(e1, e2)"), t1726))
}

///|
let icosahedron_congruent_edges_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ICOSAHEDRON_CONGRUENT_EDGES")

///|
/// `ICOSAHEDRON_CONGRUENT_EDGES`
pub fn icosahedron_congruent_edges() -> @kernel.Thm {
  icosahedron_congruent_edges_c.get()
}

///|
/// ICOSAHEDRON_CONGRUENT_FACETS
fn step_86() -> Unit raise {
  let t1727 = congruent_faces_tac(icosahedron_facets())
  icosahedron_congruent_facets_c.set(@tactics.prove(@term_syntax.parse_term("∀ f1 : (Cart[Real, 3]) -> Bool, ∀ f2 : (Cart[Real, 3]) -> Bool, face_of(f1, std_icosahedron) && aff_dim(f1) == int_of_num(2) && face_of(f2, std_icosahedron) && aff_dim(f2) == int_of_num(2) → congruent(f1, f2)"), t1727))
}

///|
let icosahedron_congruent_facets_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ICOSAHEDRON_CONGRUENT_FACETS")

///|
/// `ICOSAHEDRON_CONGRUENT_FACETS`
pub fn icosahedron_congruent_facets() -> @kernel.Thm {
  icosahedron_congruent_facets_c.get()
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
}
