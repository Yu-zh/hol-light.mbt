// Translated from upstream Formal_ineqs/trig/poly_eval.hl; edit this file directly.

///|
/// Formal_ineqs/trig/poly_eval.hl:29
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// mk_float_interval_decimal
fn step_2() -> Unit raise {
  let decimal_p = @bool.spec_all(@calc_rat.decimal())
  mk_float_interval_decimal_c.set(fn(x1 : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let pp = x1
    fn(x2 : @kernel.Term) -> @kernel.Thm raise {
      let decimal_tm = x2
      let (n_tm, d_tm) = @basics.dest_binary("DECIMAL", decimal_tm)
      let t3 = @basics.dest_numeral(d_tm)
      let (n, d) = (@basics.dest_numeral(n_tm), t3)
      let t4 = @arith_float.mk_float_interval_num(d)
      let (n_int, d_int) = (@arith_float.mk_float_interval_num(n), t4)
      let int = @arith_float.float_interval_div(pp, n_int, d_int)
      let eq_th = @kernel.inst_rule(@list.List([(n_tm, @misc_vars.x_var_num()), (d_tm, @misc_vars.y_var_num())]), decimal_p)
      @more_float.norm_interval(int, eq_th)
    }
  })
}

///|
let mk_float_interval_decimal_c : @lib.Cell[(Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("mk_float_interval_decimal")

///|
/// `mk_float_interval_decimal`
pub fn mk_float_interval_decimal(x : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (mk_float_interval_decimal_c.get())(x)
}

///|
/// `float_interval_calc`
pub fn float_interval_calc(x5 : Int64, x6 : @kernel.Term, x7 : @kernel.Thm) -> @kernel.Thm raise {
  let pp = x5
  let expr_tm = x6
  let x_th = x7
  if @kernel.is_var(expr_tm) {
    x_th
  } else {
    let (ltm, r_tm) = @kernel.dest_comb(expr_tm)
    if @kernel.is_comb(ltm) {
      let (op, l_tm) = @kernel.dest_comb(ltm)
      let name = (fn(x8 : (String, @kernel.HolType)) -> String raise {
        x8.0
      })(@kernel.dest_const(op))
      match name {
        "DECIMAL" => mk_float_interval_decimal(pp)(expr_tm)
        _ => {
          let l_th = float_interval_calc(pp, l_tm, x_th)
          let r_th = float_interval_calc(pp, r_tm, x_th)
          if (op == @misc_vars.add_op_real()) {
            @arith_float.float_interval_add(pp, l_th, r_th)
          } else {
            if (op == @misc_vars.mul_op_real()) {
              @arith_float.float_interval_mul(pp)(l_th)(r_th)
            } else {
              if (op == @misc_vars.div_op_real()) {
                @arith_float.float_interval_div(pp, l_th, r_th)
              } else {
                if (op == @misc_vars.sub_op_real()) {
                  @arith_float.float_interval_sub(pp, l_th, r_th)
                } else {
                  raise Failure(("Unknown operation: " + name))
                }
              }
            }
          }
        }
      }
    } else {
      if (ltm == @misc_vars.neg_op_real()) {
        let r_th_1 = float_interval_calc(pp, r_tm, x_th)
        @arith_float.float_interval_neg_v1(r_th_1)
      } else {
        if (ltm == @misc_vars.inv_op_real()) {
          let r_th_2 = float_interval_calc(pp, r_tm, x_th)
          @more_float.float_interval_inv(pp)(r_th_2)
        } else {
          @arith_float.mk_float_interval_num(@basics.dest_numeral(r_tm))
        }
      }
    }
  }
}

///|
/// `float_interval_const`
pub fn float_interval_const(x9 : Int64, x10 : @kernel.Term) -> @kernel.Thm raise {
  let pp = x9
  let expr_tm = x10
  float_interval_calc(pp, expr_tm, @bool.truth())
}

///|
/// `poly_coeff`
#derive(Eq, Debug)
pub(all) struct PolyCoeff {
  c_tm : @kernel.Term
  bounds_tm : @kernel.Term
  interval_th : @kernel.Thm
  sign : Int64
  sign_high_th : @kernel.Thm
  sign_low_th : @kernel.Thm
}

///|
pub extend PolyCoeff with Eq::{not_equal, equal}

///|
pub extend PolyCoeff with Debug::{to_repr}

///|
pub extend PolyCoeff with @lib.OCompare::{ocompare}

///|
pub extend PolyCoeff with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for PolyCoeff with fn ocompare(self, other) {
  let c = @lib.compare(self.c_tm, other.c_tm)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.bounds_tm, other.bounds_tm)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.interval_th, other.interval_th)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.sign, other.sign)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.sign_high_th, other.sign_high_th)
  if c != 0 {
    return c
  }
  @lib.compare(self.sign_low_th, other.sign_low_th)
}

///|
pub impl @lib.OHash for PolyCoeff with fn ohash_visit(self, h) {
  h.block(0, 6)
  h.field(self.c_tm)
  h.field(self.bounds_tm)
  h.field(self.interval_th)
  h.field(self.sign)
  h.field(self.sign_high_th)
  h.field(self.sign_low_th)
}

///|
/// mk_poly_coeffs
fn step_3() -> Unit raise {
  let t11 = @term_syntax.parse_term("(e : Num)")
  let t12 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t11]), @float_theory.float_f_pos()))
  let t13 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@interval_arith.interval_arith()])), t12), @calc_rat.real_arith_tac)
  let interval_pos = @tactics.prove(@term_syntax.parse_term("interval_arith((x : Real), (float_num(false, (n : Num), (e : Num)), (f : Real))) → interval_arith(x, (real_of_num(0), f)) && interval_arith(float_num(false, n, e), (real_of_num(0), x))"), t13)
  let t14 = @term_syntax.parse_term("(e : Num)")
  let t15 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t14]), @float_theory.float_t_neg()))
  let t16 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@interval_arith.interval_arith()])), t15), @calc_rat.real_arith_tac)
  let interval_neg = @tactics.prove(@term_syntax.parse_term("interval_arith((x : Real), ((f : Real), float_num(true, (n : Num), (e : Num)))) → interval_arith(x, (f, real_of_num(0))) && interval_arith(float_num(true, n, e), (x, real_of_num(0)))"), t16)
  let mk_poly_coeff : (Int64) -> ((@kernel.Term) -> PolyCoeff raise) raise = fn(x17 : Int64) -> ((@kernel.Term) -> PolyCoeff raise) raise {
    let pp = x17
    fn(x18 : @kernel.Term) -> PolyCoeff raise {
      let cs_tm = x18
      let eq_th = @calc_num.num_reduce_conv(cs_tm)
      let expr_tm = @kernel.rand((fn(x19 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x19)
      })(eq_th))
      let t20 = float_interval_const(pp, expr_tm)
      let int_th = @simp.rewrite_rule(@list.List([@equal.gsym(eq_th)]))(t20)
      let (c_tm, bounds) = @interval_arith.dest_interval_arith(@kernel.concl(int_th))
      let (a, b) = @pair.dest_pair(bounds)
      let (s1, _, _) = @arith_float.dest_float(a)
      let (s2, _, _) = @arith_float.dest_float(b)
      let (sign, sign_th) = match (s1, s2) {
        ("F", _) => (1L, @drule.match_mp(interval_pos)(int_th))
        (_, "T") => ((-1L), @drule.match_mp(interval_neg)(int_th))
        _ => (0L, @bool.truth())
      }
      let (sign_high, sign_low) = @misc_functions.pair_of_list(@bool.conjuncts_rule(sign_th))
      PolyCoeff::{ c_tm: c_tm, bounds_tm: bounds, interval_th: int_th, sign: sign, sign_high_th: sign_high, sign_low_th: sign_low }
    }
  }
  mk_poly_coeffs_c.set(fn(x21 : Int64) -> ((@kernel.Term) -> @list.List[PolyCoeff] raise) raise {
    let pp_1 = x21
    fn(x22 : @kernel.Term) -> @list.List[PolyCoeff] raise {
      let list_tm = x22
      let t23 = @basics.dest_list(list_tm)
      @lib.map(mk_poly_coeff(pp_1), t23)
    }
  })
}

///|
let mk_poly_coeffs_c : @lib.Cell[(Int64) -> ((@kernel.Term) -> @list.List[PolyCoeff] raise) raise] = @lib.Cell::new("mk_poly_coeffs")

///|
/// `mk_poly_coeffs`
pub fn mk_poly_coeffs(x : Int64) -> ((@kernel.Term) -> @list.List[PolyCoeff] raise) raise {
  (mk_poly_coeffs_c.get())(x)
}

///|
/// eval_interval_poly_f
fn step_4() -> Unit raise {
  let poly_f_empty_p = @more_float.rule(@poly.poly_f_empty_interval())
  let poly_f_sing_p = @more_float.rule(@poly.poly_f_sing())
  let poly_f_cons_p = @more_float.rule(@poly.poly_f_cons())
  let interval_const = @term_syntax.parse_term("interval_arith")
  eval_interval_poly_f_c.set(fn(x24 : Int64) -> (((@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    let pp = x24
    fn(x25 : (@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let (cs_tm, cs_list) = x25
      fn(x26 : @kernel.Thm) -> @kernel.Thm raise {
        let x_th = x26
        fn eval(x27 : @kernel.Term, x28 : @list.List[PolyCoeff], x29 : @kernel.Term, x30 : @kernel.Thm) -> @kernel.Thm raise {
          let cs_tm_1 = x27
          let cs_list_1 = x28
          let x_tm = x29
          let x_th_1 = x30
          match cs_list_1 {
            Empty => @kernel.inst_rule(@list.List([(x_tm, @misc_vars.x_var_real())]), poly_f_empty_p)
            More(first, tail=Empty) => {
              let th0 = @kernel.inst_rule(@list.List([(first.c_tm, @misc_vars.c_var_real()), (x_tm, @misc_vars.x_var_real())]), poly_f_sing_p)
              let t32 = first.interval_th
              let t31 = first.bounds_tm
              @kernel.eq_mp(@equal.sym(@equal.ap_thm(@equal.ap_term(interval_const, th0), t31)), t32)
            }
            More(first_1, tail=rest) => {
              let (ltm, t_tm) = @kernel.dest_comb(cs_tm_1)
              let h_tm = @kernel.rand(ltm)
              let th0_1 = @kernel.inst_rule(@list.List([(h_tm, @misc_vars.h_var_real()), (t_tm, @misc_vars.t_var_real_list()), (x_tm, @misc_vars.x_var_real())]), poly_f_cons_p)
              let r_th = eval(t_tm, rest, x_tm, x_th_1)
              let t33 = @arith_float.float_interval_mul(pp)(x_th_1)(r_th)
              let th1 = @arith_float.float_interval_add(pp, first_1.interval_th, t33)
              let bounds = @kernel.rand(@kernel.concl(th1))
              @kernel.eq_mp(@equal.sym(@equal.ap_thm(@equal.ap_term(interval_const, th0_1), bounds)), th1)
            }
          }
        }
        let x_tm_1 = @kernel.rand(@kernel.rator(@kernel.concl(x_th)))
        eval(cs_tm, cs_list, x_tm_1, x_th)
      }
    }
  })
}

///|
let eval_interval_poly_f_c : @lib.Cell[(Int64) -> (((@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("eval_interval_poly_f")

///|
/// `eval_interval_poly_f`
pub fn eval_interval_poly_f(x : Int64) -> (((@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
  (eval_interval_poly_f_c.get())(x)
}

///|
/// eval_high_poly_f_pos_pos
fn step_5() -> Unit raise {
  let t34 = @simp.rewrite_rule(@list.List([@poly.real_zero()]))
  let rule_p : (@kernel.Thm) -> @kernel.Thm raise = fn(x37 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x36 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x35 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch_all(t34(x35))
      })(@bool.disch_all(x36))
    })(@more_float.rule(x37))
  }
  let poly_f_empty_high_p = rule_p(@poly.poly_f_empty_high_pos())
  let poly_f_sing_high_p = rule_p(@poly.poly_f_sing_high_pos())
  let poly_f_cons_high_p = rule_p(@poly.poly_f_cons_high_pos_pos())
  let check_pos : (PolyCoeff) -> Unit raise = fn(x38 : PolyCoeff) -> Unit raise {
    let c = x38
    if (c.sign == 1L) {
      ()
    } else {
      let t39 = @printer.string_of_term(c.bounds_tm)
      raise Failure(((("eval_high_poly_f_pos_pos: non-positive coefficient: " + @printer.string_of_term(c.c_tm)) + ", ") + t39))
    }
  }
  eval_high_poly_f_pos_pos_c.set(fn(x40 : Int64) -> (((@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    let pp = x40
    fn(x41 : (@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let (cs_tm, cs_list) = x41
      fn(x42 : @kernel.Thm) -> @kernel.Thm raise {
        let x_th = x42
        fn eval(x43 : @kernel.Term, x44 : @list.List[PolyCoeff], x45 : @kernel.Term, x46 : @kernel.Thm) -> @kernel.Thm raise {
          let cs_tm_1 = x43
          let cs_list_1 = x44
          let x_tm = x45
          let x_th_1 = x46
          match cs_list_1 {
            Empty => @kernel.inst_rule(@list.List([(x_tm, @misc_vars.x_var_real())]), poly_f_empty_high_p)
            More(first, tail=Empty) => {
              let _ = check_pos(first)
              let bounds_tm = @kernel.rand(@kernel.concl(first.sign_high_th))
              let th0 = @kernel.inst_rule(@list.List([(first.c_tm, @misc_vars.c_var_real()), (bounds_tm, @misc_vars.bounds_var()), (x_tm, @misc_vars.x_var_real())]), poly_f_sing_high_p)
              @misc_functions.my_prove_hyp(first.sign_high_th, th0)
            }
            More(first_1, tail=rest) => {
              let _ = check_pos(first_1)
              let (ltm, t_tm) = @kernel.dest_comb(cs_tm_1)
              let h_tm = @kernel.rand(ltm)
              let rest_th = eval(t_tm, rest, x_tm, x_th_1)
              let a_tm = (fn(x47 : @kernel.Term) -> @kernel.Term raise {
                @kernel.rand(@kernel.rand(x47))
              })((fn(x48 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x48)
              })(rest_th))
              let t51 = first_1.sign_high_th
              let b_tm = (fn(x49 : @kernel.Term) -> @kernel.Term raise {
                @kernel.rand(@kernel.rand(x49))
              })((fn(x50 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x50)
              })(t51))
              let c_tm = (fn(x52 : @kernel.Term) -> @kernel.Term raise {
                @kernel.rand(@kernel.rand(x52))
              })((fn(x53 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x53)
              })(x_th_1))
              let m_bound_th = @arith_float.float_mul_hi_v1(pp)(c_tm)(a_tm)
              let m_tm = @kernel.rand((fn(x54 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x54)
              })(m_bound_th))
              let r_bound_th = @arith_float.float_add_hi_v1(pp)(b_tm)(m_tm)
              let r_tm = @kernel.rand((fn(x55 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x55)
              })(r_bound_th))
              let th0_1 = @kernel.inst_rule(@list.List([(h_tm, @misc_vars.h_var_real()), (t_tm, @misc_vars.t_var_real_list()), (x_tm, @misc_vars.x_var_real()), (a_tm, @misc_vars.a_var_real()), (b_tm, @misc_vars.b_var_real()), (c_tm, @misc_vars.c_var_real()), (m_tm, @misc_vars.m_var_real()), (r_tm, @misc_vars.r_var_real())]), poly_f_cons_high_p)
              let t56 = @misc_functions.my_prove_hyp(rest_th, @misc_functions.my_prove_hyp(x_th_1, th0_1))
              @misc_functions.my_prove_hyp(r_bound_th, @misc_functions.my_prove_hyp(m_bound_th, @misc_functions.my_prove_hyp(first_1.sign_high_th, t56)))
            }
          }
        }
        let x_tm_1 = @kernel.rand(@kernel.rator(@kernel.concl(x_th)))
        eval(cs_tm, cs_list, x_tm_1, x_th)
      }
    }
  })
}

///|
let eval_high_poly_f_pos_pos_c : @lib.Cell[(Int64) -> (((@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("eval_high_poly_f_pos_pos")

///|
/// `eval_high_poly_f_pos_pos`
pub fn eval_high_poly_f_pos_pos(x : Int64) -> (((@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
  (eval_high_poly_f_pos_pos_c.get())(x)
}

///|
/// eval_low_poly_f_pos_pos
fn step_6() -> Unit raise {
  let t57 = @simp.rewrite_rule(@list.List([@poly.real_zero()]))
  let rule_p : (@kernel.Thm) -> @kernel.Thm raise = fn(x60 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x59 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x58 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch_all(t57(x58))
      })(@bool.disch_all(x59))
    })(@more_float.rule(x60))
  }
  let poly_f_empty_low_p = rule_p(@poly.poly_f_empty_low_pos())
  let poly_f_sing_low_p = rule_p(@poly.poly_f_sing_low_pos())
  let poly_f_cons_low_p = rule_p(@poly.poly_f_cons_low_pos_pos())
  let check_pos : (PolyCoeff) -> Unit raise = fn(x61 : PolyCoeff) -> Unit raise {
    let c = x61
    if (c.sign == 1L) {
      ()
    } else {
      let t62 = @printer.string_of_term(c.bounds_tm)
      raise Failure(((("eval_low_poly_f_pos_pos: non-positive coefficient: " + @printer.string_of_term(c.c_tm)) + ", ") + t62))
    }
  }
  eval_low_poly_f_pos_pos_c.set(fn(x63 : Int64) -> (((@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    let pp = x63
    fn(x64 : (@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let (cs_tm, cs_list) = x64
      fn(x65 : @kernel.Thm) -> @kernel.Thm raise {
        let x_th = x65
        fn eval(x66 : @kernel.Term, x67 : @list.List[PolyCoeff], x68 : @kernel.Term, x69 : @kernel.Thm) -> @kernel.Thm raise {
          let cs_tm_1 = x66
          let cs_list_1 = x67
          let x_tm = x68
          let x_th_1 = x69
          match cs_list_1 {
            Empty => @kernel.inst_rule(@list.List([(x_tm, @misc_vars.x_var_real())]), poly_f_empty_low_p)
            More(first, tail=Empty) => {
              let _ = check_pos(first)
              let t72 = first.sign_low_th
              let b_tm = (fn(x70 : @kernel.Term) -> @kernel.Term raise {
                @kernel.rand(@kernel.rator(x70))
              })((fn(x71 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x71)
              })(t72))
              let th0 = @kernel.inst_rule(@list.List([(first.c_tm, @misc_vars.c_var_real()), (b_tm, @misc_vars.b_var_real()), (x_tm, @misc_vars.x_var_real())]), poly_f_sing_low_p)
              @misc_functions.my_prove_hyp(first.sign_low_th, th0)
            }
            More(first_1, tail=rest) => {
              let _ = check_pos(first_1)
              let (ltm, t_tm) = @kernel.dest_comb(cs_tm_1)
              let h_tm = @kernel.rand(ltm)
              let rest_th = eval(t_tm, rest, x_tm, x_th_1)
              let a_tm = (fn(x73 : @kernel.Term) -> @kernel.Term raise {
                @kernel.rand(@kernel.rator(x73))
              })((fn(x74 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x74)
              })(rest_th))
              let t77 = first_1.sign_low_th
              let b_tm_1 = (fn(x75 : @kernel.Term) -> @kernel.Term raise {
                @kernel.rand(@kernel.rator(x75))
              })((fn(x76 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x76)
              })(t77))
              let c_tm = (fn(x78 : @kernel.Term) -> @kernel.Term raise {
                @kernel.rand(@kernel.rator(x78))
              })((fn(x79 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x79)
              })(x_th_1))
              let m_bound_th = @arith_float.float_mul_lo_v1(pp)(c_tm)(a_tm)
              let m_tm = (fn(x80 : @kernel.Term) -> @kernel.Term raise {
                @kernel.rand(@kernel.rator(x80))
              })((fn(x81 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x81)
              })(m_bound_th))
              let r_bound_th = @arith_float.float_add_lo_v1(pp)(b_tm_1)(m_tm)
              let r_tm = (fn(x82 : @kernel.Term) -> @kernel.Term raise {
                @kernel.rand(@kernel.rator(x82))
              })((fn(x83 : @kernel.Thm) -> @kernel.Term raise {
                @kernel.concl(x83)
              })(r_bound_th))
              let r_ge0_th = @bool.eqt_elim(@arith_float.float_ge0_v1(r_tm))
              let th0_1 = @kernel.inst_rule(@list.List([(h_tm, @misc_vars.h_var_real()), (t_tm, @misc_vars.t_var_real_list()), (x_tm, @misc_vars.x_var_real()), (a_tm, @misc_vars.a_var_real()), (b_tm_1, @misc_vars.b_var_real()), (c_tm, @misc_vars.c_var_real()), (m_tm, @misc_vars.m_var_real()), (r_tm, @misc_vars.r_var_real())]), poly_f_cons_low_p)
              let t84 = @misc_functions.my_prove_hyp(rest_th, @misc_functions.my_prove_hyp(x_th_1, th0_1))
              @misc_functions.my_prove_hyp(r_ge0_th, @misc_functions.my_prove_hyp(r_bound_th, @misc_functions.my_prove_hyp(m_bound_th, @misc_functions.my_prove_hyp(first_1.sign_low_th, t84))))
            }
          }
        }
        let x_tm_1 = @kernel.rand(@kernel.rand(@kernel.concl(x_th)))
        eval(cs_tm, cs_list, x_tm_1, x_th)
      }
    }
  })
}

///|
let eval_low_poly_f_pos_pos_c : @lib.Cell[(Int64) -> (((@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise] = @lib.Cell::new("eval_low_poly_f_pos_pos")

///|
/// `eval_low_poly_f_pos_pos`
pub fn eval_low_poly_f_pos_pos(x : Int64) -> (((@kernel.Term, @list.List[PolyCoeff])) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
  (eval_low_poly_f_pos_pos_c.get())(x)
}

///|
/// eval_pow2_high
fn step_7() -> Unit raise {
  let t86 = @simp.rewrite_tac(@list.List([@interval_arith.interval_arith(), @realarith.real_pow_2(), @realarith.real_le_square()]))
  let t87 = (@term_syntax.parse_term("(x : Real) * x <= (a : Real) → interval_arith(pow(x, 2), (real_of_num(0), a))"), t86)
  let pow2_th = @bool.undisch_all((fn(x85 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x85.0, x85.1)
  })(t87))
  eval_pow2_high_c.set(fn(x88 : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let pp = x88
    fn(x89 : @kernel.Term) -> @kernel.Thm raise {
      let f_tm = x89
      let mul_th = @arith_float.float_mul_hi_v1(pp)(f_tm)(f_tm)
      let a_tm = @kernel.rand((fn(x90 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x90)
      })(mul_th))
      let th0 = @kernel.inst_rule(@list.List([(f_tm, @misc_vars.x_var_real()), (a_tm, @misc_vars.a_var_real())]), pow2_th)
      @misc_functions.my_prove_hyp(mul_th, th0)
    }
  })
}

///|
let eval_pow2_high_c : @lib.Cell[(Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("eval_pow2_high")

///|
/// `eval_pow2_high`
pub fn eval_pow2_high(x : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (eval_pow2_high_c.get())(x)
}

///|
/// eval_pow2_low
fn step_8() -> Unit raise {
  let t92 = @simp.simp_tac(@list.List([@interval_arith.interval_arith(), @realarith.real_pow_2()]))
  let t93 = (@term_syntax.parse_term("(real_of_num(0) <= (a : Real)) == true → a <= (x : Real) * x → interval_arith(a, (real_of_num(0), pow(x, 2)))"), t92)
  let pow2_th = @bool.undisch_all((fn(x91 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x91.0, x91.1)
  })(t93))
  eval_pow2_low_c.set(fn(x94 : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let pp = x94
    fn(x95 : @kernel.Term) -> @kernel.Thm raise {
      let f_tm = x95
      let mul_th = @arith_float.float_mul_lo_v1(pp)(f_tm)(f_tm)
      let a_tm = (fn(x96 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rand(@kernel.rator(x96))
      })((fn(x97 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x97)
      })(mul_th))
      let a_ge0_th = @arith_float.float_ge0_v1(a_tm)
      let th0 = @kernel.inst_rule(@list.List([(f_tm, @misc_vars.x_var_real()), (a_tm, @misc_vars.a_var_real())]), pow2_th)
      @misc_functions.my_prove_hyp(mul_th, @misc_functions.my_prove_hyp(a_ge0_th, th0))
    }
  })
}

///|
let eval_pow2_low_c : @lib.Cell[(Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("eval_pow2_low")

///|
/// `eval_pow2_low`
pub fn eval_pow2_low(x : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (eval_pow2_low_c.get())(x)
}

///|
/// eval_pow4_high
fn step_9() -> Unit raise {
  let t104 = @simp.asm_rewrite_tac(@list.List([@real.real_le_pow_2(), @realarith.real_pow_2()]))
  let t103 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t102 = @simp.asm_rewrite_tac(@list.List([]))
  let t101 = @tactics.exists_tac(@term_syntax.parse_term("(a : Real) * a"))
  let t105 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t101), t102), t103), t104)
  let t100 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t106 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), t100), t105])
  let t99 = @tactics.repeat_tac(@tactics.strip_tac)
  let t107 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@interval_arith.interval_arith(), @int.arith_rule(@term_syntax.parse_term("4 == 2 + 2")), @real.real_pow_add()])), t99), t106)
  let t108 = (@term_syntax.parse_term("(x : Real) * x <= (a : Real) → a * a <= (b : Real) → interval_arith(pow(x, 4), (real_of_num(0), b))"), t107)
  let pow4_th = @bool.undisch_all((fn(x98 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x98.0, x98.1)
  })(t108))
  eval_pow4_high_c.set(fn(x109 : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let pp = x109
    fn(x110 : @kernel.Term) -> @kernel.Thm raise {
      let f_tm = x110
      let mul1_th = @arith_float.float_mul_hi_v1(pp)(f_tm)(f_tm)
      let a_tm = @kernel.rand((fn(x111 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x111)
      })(mul1_th))
      let mul2_th = @arith_float.float_mul_hi_v1(pp)(a_tm)(a_tm)
      let b_tm = @kernel.rand((fn(x112 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x112)
      })(mul2_th))
      let th0 = @kernel.inst_rule(@list.List([(f_tm, @misc_vars.x_var_real()), (a_tm, @misc_vars.a_var_real()), (b_tm, @misc_vars.b_var_real())]), pow4_th)
      @misc_functions.my_prove_hyp(mul1_th, @misc_functions.my_prove_hyp(mul2_th, th0))
    }
  })
}

///|
let eval_pow4_high_c : @lib.Cell[(Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("eval_pow4_high")

///|
/// `eval_pow4_high`
pub fn eval_pow4_high(x : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (eval_pow4_high_c.get())(x)
}

///|
/// eval_pow4_low
fn step_10() -> Unit raise {
  let t120 = @simp.asm_rewrite_tac(@list.List([@real.real_le_pow_2(), @realarith.real_pow_2()]))
  let t119 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t118 = @simp.asm_rewrite_tac(@list.List([]))
  let t117 = @tactics.exists_tac(@term_syntax.parse_term("(a : Real) * a"))
  let t116 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t115 = @simp.asm_rewrite_tac(@list.List([]))
  let t114 = @tactics.repeat_tac(@tactics.strip_tac)
  let t121 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@interval_arith.interval_arith(), @int.arith_rule(@term_syntax.parse_term("4 == 2 + 2")), @real.real_pow_add()])), t114), t115), t116), t117), t118), t119), t120)
  let t122 = (@term_syntax.parse_term("(a : Real) <= (x : Real) * x → (b : Real) <= a * a → (real_of_num(0) <= a) == true → (real_of_num(0) <= b) == true → interval_arith(b, (real_of_num(0), pow(x, 4)))"), t121)
  let pow4_th = @bool.undisch_all((fn(x113 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x113.0, x113.1)
  })(t122))
  eval_pow4_low_c.set(fn(x123 : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let pp = x123
    fn(x124 : @kernel.Term) -> @kernel.Thm raise {
      let f_tm = x124
      let mul1_th = @arith_float.float_mul_lo_v1(pp)(f_tm)(f_tm)
      let a_tm = (fn(x125 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rand(@kernel.rator(x125))
      })((fn(x126 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x126)
      })(mul1_th))
      let mul2_th = @arith_float.float_mul_lo_v1(pp)(a_tm)(a_tm)
      let b_tm = (fn(x127 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rand(@kernel.rator(x127))
      })((fn(x128 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x128)
      })(mul2_th))
      let a_ge0 = @arith_float.float_ge0_v1(a_tm)
      let b_ge0 = @arith_float.float_ge0_v1(b_tm)
      let th0 = @kernel.inst_rule(@list.List([(f_tm, @misc_vars.x_var_real()), (a_tm, @misc_vars.a_var_real()), (b_tm, @misc_vars.b_var_real())]), pow4_th)
      @lib.itlist(@misc_functions.my_prove_hyp, @list.List([mul1_th, mul2_th, a_ge0, b_ge0]), th0)
    }
  })
}

///|
let eval_pow4_low_c : @lib.Cell[(Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("eval_pow4_low")

///|
/// `eval_pow4_low`
pub fn eval_pow4_low(x : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (eval_pow4_low_c.get())(x)
}

///|
/// eval_pow2_pow4_high
fn step_11() -> Unit raise {
  let t135 = @simp.asm_rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t134 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t133 = @simp.asm_rewrite_tac(@list.List([]))
  let t132 = @tactics.exists_tac(@term_syntax.parse_term("(a : Real) * a"))
  let t136 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t132), t133), t134), t135)
  let t131 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t137 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_mul()), t131), t136])
  let t130 = @tactics.repeat_tac(@tactics.strip_tac)
  let t138 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@interval_arith.interval_arith(), @int.arith_rule(@term_syntax.parse_term("4 == 2 + 2")), @real.real_pow_add()])), t130), t137)
  let t139 = (@term_syntax.parse_term("interval_arith(pow((x : Real), 2), (real_of_num(0), (a : Real))) → a * a <= (b : Real) → interval_arith(pow(x, 4), (real_of_num(0), b))"), t138)
  let pow4_th = @bool.undisch_all((fn(x129 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x129.0, x129.1)
  })(t139))
  eval_pow2_pow4_high_c.set(fn(x140 : Int64) -> ((@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise) raise {
    let pp = x140
    fn(x141 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
      let f_tm = x141
      let pow2_th = eval_pow2_high(pp)(f_tm)
      let a_tm = (fn(x142 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rand(@kernel.rand(x142))
      })((fn(x143 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x143)
      })(pow2_th))
      let mul_th = @arith_float.float_mul_hi_v1(pp)(a_tm)(a_tm)
      let b_tm = @kernel.rand((fn(x144 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x144)
      })(mul_th))
      let th0 = @kernel.inst_rule(@list.List([(f_tm, @misc_vars.x_var_real()), (a_tm, @misc_vars.a_var_real()), (b_tm, @misc_vars.b_var_real())]), pow4_th)
      (pow2_th, @misc_functions.my_prove_hyp(mul_th, @misc_functions.my_prove_hyp(pow2_th, th0)))
    }
  })
}

///|
let eval_pow2_pow4_high_c : @lib.Cell[(Int64) -> ((@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise) raise] = @lib.Cell::new("eval_pow2_pow4_high")

///|
/// `eval_pow2_pow4_high`
pub fn eval_pow2_pow4_high(x : Int64) -> ((@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise) raise {
  (eval_pow2_pow4_high_c.get())(x)
}

///|
/// eval_pow2_pow4_low
fn step_12() -> Unit raise {
  let t150 = @simp.asm_rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t149 = @tactics.match_mp_tac(@real.real_le_mul2())
  let t148 = @simp.asm_rewrite_tac(@list.List([]))
  let t147 = @tactics.exists_tac(@term_syntax.parse_term("(a : Real) * a"))
  let t151 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realax.real_le_trans()), t147), t148), t149), t150)
  let t152 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t151])
  let t146 = @tactics.repeat_tac(@tactics.strip_tac)
  let t153 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@interval_arith.interval_arith(), @int.arith_rule(@term_syntax.parse_term("4 == 2 + 2")), @real.real_pow_add()])), t146), t152)
  let t154 = (@term_syntax.parse_term("interval_arith((a : Real), (real_of_num(0), pow((x : Real), 2))) → (b : Real) <= a * a → (real_of_num(0) <= b) == true → interval_arith(b, (real_of_num(0), pow(x, 4)))"), t153)
  let pow4_th = @bool.undisch_all((fn(x145 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x145.0, x145.1)
  })(t154))
  eval_pow2_pow4_low_c.set(fn(x155 : Int64) -> ((@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise) raise {
    let pp = x155
    fn(x156 : @kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise {
      let f_tm = x156
      let pow2_th = eval_pow2_low(pp)(f_tm)
      let a_tm = (fn(x157 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rand(@kernel.rator(x157))
      })((fn(x158 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x158)
      })(pow2_th))
      let mul_th = @arith_float.float_mul_lo_v1(pp)(a_tm)(a_tm)
      let b_tm = (fn(x159 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rand(@kernel.rator(x159))
      })((fn(x160 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x160)
      })(mul_th))
      let b_ge0_th = @arith_float.float_ge0_v1(b_tm)
      let th0 = @kernel.inst_rule(@list.List([(f_tm, @misc_vars.x_var_real()), (a_tm, @misc_vars.a_var_real()), (b_tm, @misc_vars.b_var_real())]), pow4_th)
      (pow2_th, @misc_functions.my_prove_hyp(b_ge0_th, @misc_functions.my_prove_hyp(mul_th, @misc_functions.my_prove_hyp(pow2_th, th0))))
    }
  })
}

///|
let eval_pow2_pow4_low_c : @lib.Cell[(Int64) -> ((@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise) raise] = @lib.Cell::new("eval_pow2_pow4_low")

///|
/// `eval_pow2_pow4_low`
pub fn eval_pow2_pow4_low(x : Int64) -> ((@kernel.Term) -> (@kernel.Thm, @kernel.Thm) raise) raise {
  (eval_pow2_pow4_low_c.get())(x)
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
}
