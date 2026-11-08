// Translated from upstream Tutorial/Linking_external_tools.ml; edit this file directly.

///|
/// `maximas`
pub fn maximas(x1 : String) -> String raise {
  let e = x1
  let filename = @lib.temp_file("maxima", ".out")
  let s = ("echo 'linel:10000; display2d:false;" + (e + (";' | maxima | grep '^(%o3)' | sed -e 's/^(%o3) //' >" + filename)))
  if (Int::to_int64(@lib.sys_command(s)) != 0L) {
    raise Failure("maxima")
  } else {
    let fd = @lib.open_in(filename)
    let data = @lib.input_line(fd)
    @lib.close_in(fd)
    @lib.sys_remove(filename)
    data
  }
}

///|
/// Tutorial/Linking_external_tools.ml:14
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// maxima_ops
fn step_2() -> Unit raise {
  let t2 = ("^", @term_syntax.parse_term("real_pow"))
  let t3 = ("/", @term_syntax.parse_term("op_slash"))
  let t4 = ("*", @term_syntax.parse_term("real_mul"))
  let t5 = ("-", @term_syntax.parse_term("real_sub"))
  maxima_ops_c.set(@list.List([("+", @term_syntax.parse_term("real_add")), t5, t4, t3, t2]))
}

///|
let maxima_ops_c : @lib.Cell[@list.List[(String, @kernel.Term)]] = @lib.Cell::new("maxima_ops")

///|
/// `maxima_ops`
pub fn maxima_ops() -> @list.List[(String, @kernel.Term)] {
  maxima_ops_c.get()
}

///|
/// maxima_funs
fn step_3() -> Unit raise {
  let t6 = ("cos", @term_syntax.parse_term("cos"))
  maxima_funs_c.set(@list.List([("sin", @term_syntax.parse_term("sin")), t6]))
}

///|
let maxima_funs_c : @lib.Cell[@list.List[(String, @kernel.Term)]] = @lib.Cell::new("maxima_funs")

///|
/// `maxima_funs`
pub fn maxima_funs() -> @list.List[(String, @kernel.Term)] {
  maxima_funs_c.get()
}

///|
/// mk_uneg
fn step_4() -> Unit raise {
  let t8 = @term_syntax.parse_term("real_neg")
  mk_uneg_c.set((x9 : @kernel.Term) => @lib.curry(fn(x7 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    @kernel.mk_comb(x7.0, x7.1)
  }, t8, x9))
}

///|
let mk_uneg_c : @lib.Cell[(@kernel.Term) -> @kernel.Term raise] = @lib.Cell::new("mk_uneg")

///|
/// `mk_uneg`
pub fn mk_uneg(x : @kernel.Term) -> @kernel.Term raise {
  (mk_uneg_c.get())(x)
}

///|
/// dest_uneg
fn step_5() -> Unit raise {
  let ntm = @term_syntax.parse_term("real_neg")
  dest_uneg_c.set(fn(x10 : @kernel.Term) -> @kernel.Term raise {
    let tm = x10
    let (op, t) = @kernel.dest_comb(tm)
    if (op == ntm) {
      t
    } else {
      raise Failure("dest_uneg")
    }
  })
}

///|
let dest_uneg_c : @lib.Cell[(@kernel.Term) -> @kernel.Term raise] = @lib.Cell::new("dest_uneg")

///|
/// `dest_uneg`
pub fn dest_uneg(x : @kernel.Term) -> @kernel.Term raise {
  (dest_uneg_c.get())(x)
}

///|
/// mk_pow
fn step_6() -> Unit raise {
  let t11 = @term_syntax.parse_term("real_pow")
  let f : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = fn(x14 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    fn(x15 : @kernel.Term) -> @kernel.Term raise {
      ((x12 : @kernel.Term, x13 : @kernel.Term) => @basics.mk_binop(t11, x12, x13))(x14, x15)
    }
  }
  mk_pow_c.set(fn(x16 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let x = x16
    fn(x17 : @kernel.Term) -> @kernel.Term raise {
      let y = x17
      let t18 = @kernel.rand(y)
      f(x)(t18)
    }
  })
}

///|
let mk_pow_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise] = @lib.Cell::new("mk_pow")

///|
/// `mk_pow`
pub fn mk_pow(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
  (mk_pow_c.get())(x)
}

///|
/// mk_realvar
fn step_7() -> Unit raise {
  let real_ty = @term_syntax.parse_type("Real")
  mk_realvar_c.set(fn(x19 : String) -> @kernel.Term raise {
    let x = x19
    @kernel.mk_var(x, real_ty)
  })
}

///|
let mk_realvar_c : @lib.Cell[(String) -> @kernel.Term raise] = @lib.Cell::new("mk_realvar")

///|
/// `mk_realvar`
pub fn mk_realvar(x : String) -> @kernel.Term raise {
  (mk_realvar_c.get())(x)
}

///|
/// `string_of_hol`
pub fn string_of_hol(x20 : @kernel.Term) -> String raise {
  let tm = x20
  if @calc_int.is_ratconst(tm) {
    ("(" + (@num.string_of_num(@calc_int.rat_of_term(tm)) + ")"))
  } else {
    if @nums.is_numeral(tm) {
      @num.string_of_num(@basics.dest_numeral(tm))
    } else {
      if @kernel.is_var(tm) {
        @kernel.dest_var(tm).0
      } else {
        if @lib.can(dest_uneg, tm) {
          ("-(" + (string_of_hol(@kernel.rand(tm)) + ")"))
        } else {
          let (lop, r) = @kernel.dest_comb(tm)
          try {
            let (op, l) = @kernel.dest_comb(lop)
            let t21 = (" " + (string_of_hol(r) + ")"))
            let t22 = (" " + (@lib.rev_assoc(op, maxima_ops()) + t21))
            ("(" + (string_of_hol(l) + t22))
          } catch {
            Failure(_) => {
              let t23 = ("(" + (string_of_hol(r) + ")"))
              (@lib.rev_assoc(lop, maxima_funs()) + t23)
            }
            e => raise e
          }
        }
      }
    }
  }
}

///|
/// Tutorial/Linking_external_tools.ml:38
fn step_8() -> Unit raise {
  ignore(string_of_hol(@term_syntax.parse_term("pow((x : Real) + sin(-real_of_num(2) * x), 2) - cos(x - real_of_num(22) / real_of_num(7))")))
}

///|
/// `lexe`
pub fn lexe(x24 : String) -> @list.List[String] raise {
  let s = x24
  @list.List(@lexer.lex(s).map(fn(x25 : @lexer.Lexcode) -> String raise {
    match x25 {
      @lexer.Lexcode::Resword(s_1) => s_1
      @lexer.Lexcode::Ident(s_2) => s_2
    }
  }))
}

///|
/// `parse_bracketed`
pub fn[TA, TB] parse_bracketed(x26 : (TB) -> (TA, @list.List[String]) raise, x27 : TB) -> ((TA, @list.List[String])) raise {
  let prs = x26
  let inp = x27
  match prs(inp) {
    (ast, More(")", tail=rst)) => (ast, rst)
    _ => raise Failure("Closing bracket expected")
  }
}

///|
/// `parse_ginfix`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash, TC] parse_ginfix(x28 : TB, x29 : ((TC) -> TA raise) -> ((TC) -> ((TC) -> TA raise) raise) raise, x30 : (TC) -> TA raise, x31 : (@list.List[TB]) -> (TC, @list.List[TB]) raise, x32 : @list.List[TB]) -> ((TA, @list.List[TB])) raise {
  let op = x28
  let opup = x29
  let sof = x30
  let prs = x31
  let inp = x32
  match prs(inp) {
    (e1, More(hop, tail=rst)) if (hop == op) => parse_ginfix(op, opup, opup(sof)(e1), prs, rst)
    (e1_1, rest) => (sof(e1_1), rest)
  }
}

///|
/// `parse_general_infix`
pub fn parse_general_infix(x33 : String) -> (((@list.List[String]) -> (@kernel.Term, @list.List[String]) raise) -> ((@list.List[String]) -> (@kernel.Term, @list.List[String]) raise) raise) raise {
  let op = x33
  let opcon : (@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise = if (op == "^") {
    mk_pow
  } else {
    let t35 = @lib.assoc(op, maxima_ops())
    fn(x38 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
      fn(x39 : @kernel.Term) -> @kernel.Term raise {
        ((x36 : @kernel.Term, x37 : @kernel.Term) => @basics.mk_binop(t35, x36, x37))(x38, x39)
      }
    }
  }
  let constr : ((@kernel.Term) -> @kernel.Term raise) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise) raise = if ((op != "^") && (@printer.get_infix_status(op).1 == "right")) {
    fn(x40 : (@kernel.Term) -> @kernel.Term raise) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise) raise {
      let f = x40
      fn(x41 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
        let e1 = x41
        fn(x42 : @kernel.Term) -> @kernel.Term raise {
          let e2 = x42
          f(opcon(e1)(e2))
        }
      }
    }
  } else {
    fn(x43 : (@kernel.Term) -> @kernel.Term raise) -> ((@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise) raise {
      let f_1 = x43
      fn(x44 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
        let e1_1 = x44
        fn(x45 : @kernel.Term) -> @kernel.Term raise {
          let e2_1 = x45
          opcon(f_1(e1_1))(e2_1)
        }
      }
    }
  }
  fn(x49 : (@list.List[String]) -> (@kernel.Term, @list.List[String]) raise) -> ((@list.List[String]) -> (@kernel.Term, @list.List[String]) raise) raise {
    fn(x50 : @list.List[String]) -> (@kernel.Term, @list.List[String]) raise {
      ((x47 : (@list.List[String]) -> (@kernel.Term, @list.List[String]) raise, x48 : @list.List[String]) => parse_ginfix(op, constr, fn(x46 : @kernel.Term) -> @kernel.Term raise {
        let x = x46
        x
      }, x47, x48))(x49, x50)
    }
  }
}

///|
/// `parse_atomic_expression`
pub fn parse_atomic_expression(x51 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp = x51
  match inp {
    Empty => raise Failure("expression expected")
    More("(", tail=rest) => parse_bracketed(parse_expression, rest)
    More(s, tail=rest_1) if @lib.forall(fn(x52 : String) -> Bool raise {
  @printer.isnum(x52)
}, @lib.explode(s)) => (@calc_int.term_of_rat(@num.num_of_string(s)), rest_1)
    More(s_1, tail=More("(", tail=rest_2)) if @lib.forall(fn(x53 : String) -> Bool raise {
  @printer.isalnum(x53)
}, @lib.explode(s_1)) => {
      let (e, rst) = parse_bracketed(parse_expression, rest_2)
      (@kernel.mk_comb(@lib.assoc(s_1, maxima_funs()), e), rst)
    }
    More(s_2, tail=rest_3) if @lib.forall(fn(x54 : String) -> Bool raise {
  @printer.isalnum(x54)
}, @lib.explode(s_2)) => (mk_realvar(s_2), rest_3)
    _ => raise @lib.MatchFailure("tscript.ml:60")
  }
}

///|
/// `parse_exp`
pub fn parse_exp(x55 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp_1 = x55
  parse_general_infix("^")(parse_atomic_expression)(inp_1)
}

///|
/// `parse_neg`
pub fn parse_neg(x56 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp_2 = x56
  match inp_2 {
    More("-", tail=rest_4) => {
      let (e_1, rst_1) = parse_neg(rest_4)
      (mk_uneg(e_1), rst_1)
    }
    _ => parse_exp(inp_2)
  }
}

///|
/// `parse_expression`
pub fn parse_expression(x57 : @list.List[String]) -> ((@kernel.Term, @list.List[String])) raise {
  let inp_3 = x57
  @lib.itlist(fn(x58 : String, x59 : (@list.List[String]) -> (@kernel.Term, @list.List[String]) raise) -> ((@list.List[String]) -> (@kernel.Term, @list.List[String]) raise) raise {
    let s60 = parse_general_infix(x58)
    let s61 = s60(x59)
    fn(x62 : @list.List[String]) -> (@kernel.Term, @list.List[String]) raise {
      s61(x62)
    }
  }, @lib.map(fn(x63 : (String, @kernel.Term)) -> String raise {
    x63.0
  }, maxima_ops()), parse_neg)(inp_3)
}

///|
/// hol_of_string
fn step_9() -> Unit raise {
  hol_of_string_c.set(fn(x66 : String) -> @kernel.Term raise {
    (fn(x65 : @list.List[String]) -> @kernel.Term raise {
      (fn(x64 : (@kernel.Term, @list.List[String])) -> @kernel.Term raise {
        x64.0
      })(parse_expression(x65))
    })(lexe(x66))
  })
}

///|
let hol_of_string_c : @lib.Cell[(String) -> @kernel.Term raise] = @lib.Cell::new("hol_of_string")

///|
/// `hol_of_string`
pub fn hol_of_string(x : String) -> @kernel.Term raise {
  (hol_of_string_c.get())(x)
}

///|
/// Tutorial/Linking_external_tools.ml:79
fn step_10() -> Unit raise {
  ignore(hol_of_string("sin(x) - cos(-(- - 1 + x))"))
}

///|
/// `FACTOR_CONV`
pub fn factor_conv(x67 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x67
  let s = ("factor(" + (string_of_hol(tm) + ")"))
  let tm_p = hol_of_string(maximas(s))
  @calc_rat.real_ring(@basics.mk_eq(tm, tm_p))
}

///|
/// Tutorial/Linking_external_tools.ml:86
fn step_11() -> Unit raise {
  ignore(factor_conv(@term_syntax.parse_term("real_of_num(1234567890)")))
}

///|
/// Tutorial/Linking_external_tools.ml:88
fn step_12() -> Unit raise {
  ignore(factor_conv(@term_syntax.parse_term("pow((x : Real), 6) - real_of_num(1)")))
}

///|
/// Tutorial/Linking_external_tools.ml:90
fn step_13() -> Unit raise {
  ignore(factor_conv(@term_syntax.parse_term("(r : Real) * (r * ((x : Real) * (real_of_num(1) - x)) * (real_of_num(1) - r * (x * (real_of_num(1) - x)))) - x")))
}

///|
/// `ANTIDERIV_CONV`
pub fn antideriv_conv_v1(x68 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x68
  let (x, bod) = @kernel.dest_abs(tm)
  let t69 = ("," + (@kernel.dest_var(x).0 + ")"))
  let s = ("integrate(" + (string_of_hol(bod) + t69))
  let tm_p = @kernel.mk_abs(x, hol_of_string(maximas(s)))
  let t70 = @bool.spec(x, @transc.diff_conv(tm_p))
  let th1 = @equal.conv_rule(@equal.thenc(@calc_num.num_reduce_conv, @calc_rat.real_rat_reduce_conv), t70)
  let th2 = @calc_rat.real_ring(@basics.mk_eq(@equal.lhand(@kernel.concl(th1)), bod))
  @bool.gen(x, @simp.gen_rewrite_rule(fn(x71 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s72 = @equal.land_conv(x71)
    fn(x73 : @kernel.Term) -> @kernel.Thm raise {
      s72(x73)
    }
  }, @list.List([th2]))(th1))
}

///|
/// Tutorial/Linking_external_tools.ml:101
fn step_14() -> Unit raise {
  ignore(antideriv_conv_v1(@term_syntax.parse_term("(x : Real) => pow(x + real_of_num(5), 2) + real_of_num(77) * x")))
}

///|
/// Tutorial/Linking_external_tools.ml:103
fn step_15() -> Unit raise {
  ignore(antideriv_conv_v1(@term_syntax.parse_term("(x : Real) => sin(x) + pow(x, 11)")))
}

///|
/// SIN_N_CLAUSES
fn step_16() -> Unit raise {
  let t77 = @tactics.conv_tac(@calc_rat.real_ring)
  let t76 = @simp.rewrite_tac(@list.List([@real.real_add_rdistrib(), @transc.sin_add(), @transc.cos_add(), @realax.real_mul_lid()]))
  let t75 = @simp.rewrite_tac(@list.List([@arith.add1(), @equal.gsym(@realax.real_of_num_add())]))
  let t74 = @simp.rewrite_tac(@list.List([@nums.numeral(), @arith.bit0(), @arith.bit1()]))
  let t78 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_mul_2(), @realarith.real_pow_2()])), t74), t75), t76), t77)
  sin_n_clauses_c.set(@tactics.prove(@term_syntax.parse_term("sin(real_of_num(NUMERAL(BIT0((n : Num)))) * (x : Real)) == real_of_num(2) * (sin(real_of_num(NUMERAL(n)) * x) * cos(real_of_num(NUMERAL(n)) * x)) && sin(real_of_num(NUMERAL(BIT1(n))) * x) == sin(real_of_num(NUMERAL(BIT0(n))) * x) * cos(x) + sin(x) * cos(real_of_num(NUMERAL(BIT0(n))) * x) && cos(real_of_num(NUMERAL(BIT0(n))) * x) == pow(cos(real_of_num(NUMERAL(n)) * x), 2) - pow(sin(real_of_num(NUMERAL(n)) * x), 2) && cos(real_of_num(NUMERAL(BIT1(n))) * x) == cos(real_of_num(NUMERAL(BIT0(n))) * x) * cos(x) - sin(x) * sin(real_of_num(NUMERAL(BIT0(n))) * x)"), t78))
}

///|
let sin_n_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIN_N_CLAUSES")

///|
/// `SIN_N_CLAUSES`
pub fn sin_n_clauses() -> @kernel.Thm {
  sin_n_clauses_c.get()
}

///|
/// `TRIG_IDENT_TAC`
pub fn trig_ident_tac(x79 : @kernel.Term) -> @tactics.Tactic raise {
  let x = x79
  let t83 = @tactics.conv_tac(@calc_rat.real_ring)
  let t82 = @tactics.mp_tac(@bool.spec(x, @transc.sin_circle()))
  let t81 = @simp.rewrite_tac(@list.List([@analysis.real_mul_lzero(), @transc.sin_0(), @transc.cos_0(), @analysis.real_mul_rzero()]))
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([sin_n_clauses(), @transc.sin_add(), @transc.cos_add()])), t81), t82), t83)
}

///|
/// `ANTIDERIV_CONV`
pub fn antideriv_conv(x84 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x84
  let (x, bod) = @kernel.dest_abs(tm)
  let t85 = ("," + (@kernel.dest_var(x).0 + "))"))
  let s = ("expand(integrate(" + (string_of_hol(bod) + t85))
  let tm_p = @kernel.mk_abs(x, hol_of_string(maximas(s)))
  let t86 = @bool.spec(x, @transc.diff_conv(tm_p))
  let th1 = @equal.conv_rule(@equal.thenc(@calc_num.num_reduce_conv, @calc_rat.real_rat_reduce_conv), t86)
  let t87 = trig_ident_tac(x)
  let th2 = @tactics.prove(@basics.mk_eq(@equal.lhand(@kernel.concl(th1)), bod), t87)
  @bool.gen(x, @simp.gen_rewrite_rule(fn(x88 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s89 = @equal.land_conv(x88)
    fn(x90 : @kernel.Term) -> @kernel.Thm raise {
      s89(x90)
    }
  }, @list.List([th2]))(th1))
}

///|
/// Tutorial/Linking_external_tools.ml:140
fn step_17() -> Unit raise {
  ignore(@lib.time(antideriv_conv, @term_syntax.parse_term("(x : Real) => pow(sin(x), 3)")))
}

///|
/// Tutorial/Linking_external_tools.ml:142
fn step_18() -> Unit raise {
  ignore(@lib.time(antideriv_conv, @term_syntax.parse_term("(x : Real) => sin(x) * (pow(sin(x), 5) * pow(cos(x), 4)) + cos(x)")))
}

///|
/// FCT1_WEAK
fn step_19() -> Unit raise {
  let t91 = @meson.meson_tac(@list.List([@transc.ftc1()]))
  fct1_weak_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Real, diffl((f : (Real) -> Real), (f' : (Real) -> Real)(x), x)) → (∀ x : Real, real_of_num(0) <= x → defint((real_of_num(0), x), f', f(x) - f(real_of_num(0))))"), t91))
}

///|
let fct1_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FCT1_WEAK")

///|
/// `FCT1_WEAK`
pub fn fct1_weak() -> @kernel.Thm {
  fct1_weak_c.get()
}

///|
/// `INTEGRAL_CONV`
pub fn integral_conv(x92 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x92
  let t93 = antideriv_conv(tm)
  let th1 = @drule.match_mp(fct1_weak())(t93)
  let t95 = @simp.rewrite_rule(@list.List([@transc.sin_0(), @transc.cos_0(), @analysis.real_mul_lzero(), @analysis.real_mul_rzero()]))
  (fn(x98 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x96 : @kernel.Thm) -> @kernel.Thm raise {
      ((x94 : @kernel.Thm) => @equal.conv_rule(@calc_rat.real_rat_reduce_conv, x94))(t95(x96))
    })(((x97 : @kernel.Thm) => @equal.conv_rule(@calc_rat.real_rat_reduce_conv, x97))(x98))
  })(@equal.beta_rule(th1))
}

///|
/// Tutorial/Linking_external_tools.ml:154
fn step_20() -> Unit raise {
  ignore(integral_conv(@term_syntax.parse_term("(x : Real) => pow(sin(x), 13)")))
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
}
