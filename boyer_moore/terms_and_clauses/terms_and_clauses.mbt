// Translated from upstream Boyer_Moore/terms_and_clauses.ml; edit this file directly.

///|
/// `SUBST_CONV`
pub fn subst_conv(x1 : @list.List[(@kernel.Thm, @kernel.Term)], x2 : @kernel.Term, x3 : @kernel.Term) -> @kernel.Thm raise {
  let thvars = x1
  let template = x2
  let tm = x3
  let (thms, vars) = @lib.unzip(thvars)
  let gvs = @lib.map(fn(x6 : @kernel.Term) -> @kernel.Term raise {
    (fn(x4 : @kernel.HolType) -> @kernel.Term raise {
      @basics.genvar(x4)
    })((fn(x5 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x5)
    })(x6))
  }, vars)
  let gtemplate = @basics.subst(@lib.zip(gvs, vars), template)
  let t7 = @kernel.refl(tm)
  let t8 = @basics.mk_eq(template, gtemplate)
  @support.subst(@lib.zip(thms, gvs), t8, t7)
}

///|
/// bool_EQ_CONV
fn step_1() -> Unit raise {
  let boolty = @term_syntax.parse_type("Bool")
  let check : (@kernel.Term) -> @kernel.Term raise = (x10 : @kernel.Term) => @lib.check(fn(x9 : @kernel.Term) -> Bool raise {
    let tm = x9
    (@kernel.type_of(tm) == boolty)
  }, x10)
  let t13 = @bool.conjuncts_rule(@bool.spec(@term_syntax.parse_term("(b : Bool)"), @theorems.eq_clauses()))
  let t11 = @term_syntax.parse_term("(b : Bool)")
  let clist = @lib.map((x12 : @kernel.Thm) => @bool.gen(t11, x12), t13)
  let tb = @lib.hd(clist)
  let bt = @lib.hd(@lib.tl(clist))
  let t = @term_syntax.parse_term("true")
  let f = @term_syntax.parse_term("false")
  bool_eq_conv_c.set(fn(x14 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x14
    try {
      let t16 = @kernel.dest_eq(tm_1)
      let t17 = check(t16.1)
      let (l, r) = ((fn(x15 : @kernel.Term) -> @kernel.Term raise {
        x15
      })(t16.0), t17)
      if (l == r) {
        @bool.eqt_intro(@kernel.refl(l))
      } else {
        if (l == t) {
          @bool.spec(r, tb)
        } else {
          if (r == t) {
            @bool.spec(l, bt)
          } else {
            @lib.failure()
          }
        }
      }
    } catch {
      Failure(_) => raise Failure("bool_EQ_CONV")
      e => raise e
    }
  })
}

///|
let bool_eq_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("bool_EQ_CONV")

///|
/// `bool_EQ_CONV`
pub fn bool_eq_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (bool_eq_conv_c.get())(x)
}

///|
/// `rewrite_with_lemmas`
pub fn rewrite_with_lemmas(x18 : (@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise, x19 : @list.List[@kernel.Term], x20 : @list.List[@kernel.Term], x21 : @kernel.Term) -> @kernel.Thm raise {
  let rewrite = x18
  let hyp_chain = x19
  let assumps = x20
  let tm = x21
  let rewrite_hyp : (@kernel.Term) -> @kernel.Thm raise = fn(x22 : @kernel.Term) -> @kernel.Thm raise {
    let h = x22
    try {
      @bool.eqt_intro(@kernel.assume_rule(@lib.find(fn(x23 : @kernel.Term) -> Bool raise {
        let tm_1 = x23
        (tm_1 == h)
      }, assumps)))
    } catch {
      Failure(_) => {
        if @lib.mem(h, hyp_chain) {
          @equal.all_conv(h)
        } else {
          rewrite(hyp_chain.prepend(h))(assumps)(h)
        }
      }
      e => raise e
    }
  }
  fn try_rewrites(x24 : @list.List[@kernel.Term], x25 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
    let assumps_1 = x24
    let ths = x25
    if @list.List::is_empty(ths) {
      raise Failure("try_rewrites")
    } else {
      try {
        let th = @rewrite_rules.inst_frees_in_hyps(assumps_1, @lib.hd(ths))
        let hyp_ths = @lib.map(fn(x26 : @kernel.Term) -> @kernel.Thm raise {
          @bool.eqt_elim(rewrite_hyp(x26))
        }, @kernel.hyp(th))
        @lib.itlist(@bool.prove_hyp, hyp_ths, th)
      } catch {
        Failure(_) => try_rewrites(assumps_1, @lib.tl(ths))
        e => raise e
      }
    }
  }
  try {
    try_rewrites(assumps, @rewrite_rules.applicable_rewrites(tm))
  } catch {
    Failure(_) => @equal.all_conv(tm)
    e => raise e
  }
}

///|
/// `rewrite_explicit_value`
pub fn rewrite_explicit_value(x27 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x27
  fn conv(x28 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x28
    @equal.thenc(@calc_num.num_conv, @equal.try_conv(@equal.rand_conv(conv)))(tm_1)
  }
  let t30 = @equal.try_conv((x29 : @kernel.Term) => @rewrite_rules.args_conv(rewrite_explicit_value, x29))
  @equal.thenc(@equal.try_conv(conv), t30)(tm)
}

///|
let cond_t_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_T")

///|
/// `COND_T`
pub fn cond_t() -> @kernel.Thm {
  cond_t_c.get()
}

///|
let cond_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_F")

///|
/// `COND_F`
pub fn cond_f() -> @kernel.Thm {
  cond_f_c.get()
}

///|
/// COND_T, COND_F
fn step_2() -> Unit raise {
  match @bool.conjuncts_rule(@bool.spec_all(@class.cond_clauses())) {
    More(cond_t, tail=More(cond_f, tail=Empty)) => {
      cond_t_c.set(cond_t)
      cond_f_c.set(cond_f)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:98:4")
  }
}

///|
/// COND_LEFT
fn step_3() -> Unit raise {
  let t32 = @simp.rewrite_tac(@list.List([]))
  let t31 = @class.bool_cases_tac(@term_syntax.parse_term("(b : Bool)"))
  let t33 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t31), t32)
  cond_left_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Bool, ∀ x : X, ∀ x' : X, ∀ y : X, (b → x == x') → (if b { x } else { y }) == (if b { x' } else { y })"), t33))
}

///|
let cond_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_LEFT")

///|
/// `COND_LEFT`
pub fn cond_left() -> @kernel.Thm {
  cond_left_c.get()
}

///|
/// COND_RIGHT
fn step_4() -> Unit raise {
  let t35 = @simp.rewrite_tac(@list.List([]))
  let t34 = @class.bool_cases_tac(@term_syntax.parse_term("(b : Bool)"))
  let t36 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t34), t35)
  cond_right_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Bool, ∀ y : X, ∀ y' : X, ∀ x : X, (!b → y == y') → (if b { x } else { y }) == (if b { x } else { y' })"), t36))
}

///|
let cond_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_RIGHT")

///|
/// `COND_RIGHT`
pub fn cond_right() -> @kernel.Thm {
  cond_right_c.get()
}

///|
/// COND_RIGHT_F
fn step_5() -> Unit raise {
  let t37 = @simp.rewrite_tac(@list.List([]))
  let t38 = @tactics.then_tac(@class.bool_cases_tac(@term_syntax.parse_term("(b : Bool)")), t37)
  cond_right_f_c.set(@tactics.prove(@term_syntax.parse_term("(if (b : Bool) { b } else { false }) == b"), t38))
}

///|
let cond_right_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_RIGHT_F")

///|
/// `COND_RIGHT_F`
pub fn cond_right_f() -> @kernel.Thm {
  cond_right_f_c.get()
}

///|
/// COND_T_F
fn step_6() -> Unit raise {
  let t39 = @simp.rewrite_tac(@list.List([]))
  let t40 = @tactics.then_tac(@class.bool_cases_tac(@term_syntax.parse_term("(b : Bool)")), t39)
  cond_t_f_c.set(@tactics.prove(@term_syntax.parse_term("(if (b : Bool) { true } else { false }) == b"), t40))
}

///|
let cond_t_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_T_F")

///|
/// `COND_T_F`
pub fn cond_t_f() -> @kernel.Thm {
  cond_t_f_c.get()
}

///|
/// `rewrite_conditional`
pub fn rewrite_conditional(x41 : (@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise, x42 : @list.List[@kernel.Term], x43 : @kernel.Term) -> @kernel.Thm raise {
  let rewrite = x41
  let assumps = x42
  let tm = x43
  try {
    let th1 = @equal.rator_conv(@equal.rator_conv(@equal.rand_conv(rewrite(assumps))))(tm)
    let tm1 = @equal.rhs(@kernel.concl(th1))
    let (b_p, (x, y)) = @class.dest_cond(tm1)
    if @support.is_t(b_p) {
      let t44 = rewrite(assumps)
      @kernel.trans(th1, @equal.thenc(@simp.rewr_conv(cond_t()), t44)(tm1))
    } else {
      if @support.is_f(b_p) {
        let t45 = rewrite(assumps)
        @kernel.trans(th1, @equal.thenc(@simp.rewr_conv(cond_f()), t45)(tm1))
      } else {
        let th2 = @bool.disch(b_p, rewrite(assumps.prepend(b_p))(x))
        let x_p = @kernel.rand(@kernel.rand(@kernel.concl(th2)))
        let th3 = @bool.mp(@bool.ispecl(@list.List([b_p, x, x_p, y]), cond_left()), th2)
        let tm3 = @equal.rhs(@kernel.concl(th3))
        let notb_p = @bool.mk_neg(b_p)
        let th4 = @bool.disch(notb_p, rewrite(assumps.prepend(notb_p))(y))
        let y_p = @kernel.rand(@kernel.rand(@kernel.concl(th4)))
        let th5 = @bool.mp(@bool.ispecl(@list.List([b_p, y, y_p, x_p]), cond_right()), th4)
        let t47 = @equal.rhs(@kernel.concl(th5))
        let t48 = @equal.try_conv(@simp.rewr_conv(cond_t_f()))
        let t46 = @simp.rewr_conv(cond_right_f())
        let th6 = @equal.orelsec(@equal.orelsec(@simp.rewr_conv(@class.cond_id()), t46), t48)(t47)
        @kernel.trans(@kernel.trans(@kernel.trans(th1, th3), th5), th6)
      }
    }
  } catch {
    Failure(_) => raise Failure("rewrite_conditional")
    e => raise e
  }
}

///|
/// EQ_T
fn step_7() -> Unit raise {
  let t49 = @simp.rewrite_tac(@list.List([]))
  let t50 = @tactics.then_tac(@class.bool_cases_tac(@term_syntax.parse_term("(x : Bool)")), t49)
  eq_t_c.set(@tactics.prove(@term_syntax.parse_term("((x : Bool) == true) == x"), t50))
}

///|
let eq_t_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_T")

///|
/// `EQ_T`
pub fn eq_t() -> @kernel.Thm {
  eq_t_c.get()
}

///|
/// EQ_EQ
fn step_8() -> Unit raise {
  let t52 = @simp.rewrite_tac(@list.List([]))
  let t51 = @class.bool_cases_tac(@term_syntax.parse_term("(y : X) == (z : X)"))
  let t53 = @tactics.then_tac(@tactics.then_tac(@class.bool_cases_tac(@term_syntax.parse_term("(x : Bool)")), t51), t52)
  eq_eq_c.set(@tactics.prove(@term_syntax.parse_term("((x : Bool) == ((y : X) == (z : X))) == (if y == z { x == true } else { x == false })"), t53))
}

///|
let eq_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_EQ")

///|
/// `EQ_EQ`
pub fn eq_eq() -> @kernel.Thm {
  eq_eq_c.get()
}

///|
/// EQ_F
fn step_9() -> Unit raise {
  let t54 = @simp.rewrite_tac(@list.List([]))
  let t55 = @tactics.then_tac(@class.bool_cases_tac(@term_syntax.parse_term("(x : Bool)")), t54)
  eq_f_c.set(@tactics.prove(@term_syntax.parse_term("((x : Bool) == false) == (if x { false } else { true })"), t55))
}

///|
let eq_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_F")

///|
/// `EQ_F`
pub fn eq_f() -> @kernel.Thm {
  eq_f_c.get()
}

///|
/// `prove_terms_not_eq`
pub fn prove_terms_not_eq(x56 : @kernel.Term, x57 : @kernel.Term) -> @kernel.Thm raise {
  let l = x56
  let r = x57
  fn struct_conv(x58 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x58
    @equal.orelsec(@equal.orelsec(@equal.orelsec(bool_eq_conv, @calc_num.num_eq_conv), fn(x59 : @kernel.Term) -> @kernel.Thm raise {
      let tm_1 = x59
      let (l_1, r_1) = @kernel.dest_eq(tm_1)
      let t61 = @kernel.type_of(l_1)
      let ty_name = (fn(x60 : (String, @list.List[@kernel.HolType])) -> String raise {
        x60.0
      })(@kernel.dest_type(t61))
      let ty_info = @shells.sys_shell_info(ty_name)
      let ty_conv : ((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise = ty_info.struct_conv
      ty_conv(struct_conv)(tm_1)
    }), @equal.all_conv)(tm)
  }
  try {
    let th = struct_conv(@basics.mk_eq(l, r))
    if @support.is_f(@equal.rhs(@kernel.concl(th))) {
      th
    } else {
      raise Failure("")
    }
  } catch {
    Failure(_) => raise Failure("prove_terms_not_eq")
    e => raise e
  }
}

///|
/// `rewrite_equality`
pub fn rewrite_equality(x62 : (@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise, x63 : @list.List[@kernel.Term], x64 : @list.List[@kernel.Term], x65 : @kernel.Term) -> @kernel.Thm raise {
  let rewrite = x62
  let hyp_chain = x63
  let assumps = x64
  let tm = x65
  try {
    let t66 = @equal.rand_conv(rewrite(hyp_chain)(assumps))
    let th1 = @equal.thenc(@equal.rator_conv(@equal.rand_conv(rewrite(hyp_chain)(assumps))), t66)(tm)
    let tm1 = @equal.rhs(@kernel.concl(th1))
    let (l, r) = @kernel.dest_eq(tm1)
    if (l == r) {
      @kernel.trans(th1, @bool.eqt_intro(@bool.ispec(l, @theorems.eq_refl())))
    } else {
      try {
        @kernel.trans(th1, prove_terms_not_eq(l, r))
      } catch {
        Failure(_) => {
          let t68 = @equal.try_conv(@simp.rewr_conv(eq_f()))
          let t67 = @simp.rewr_conv(eq_eq())
          let th2 = @equal.orelsec(@equal.orelsec(@simp.rewr_conv(eq_t()), t67), t68)(tm1)
          let th3 = rewrite_with_lemmas(rewrite, hyp_chain, assumps, @equal.rhs(@kernel.concl(th2)))
          @kernel.trans(@kernel.trans(th1, th2), th3)
        }
        e => raise e
      }
    }
  } catch {
    Failure(_) => raise Failure("rewrite_equality")
    e => raise e
  }
}

///|
/// `rewrite_application`
pub fn[TA] rewrite_application(x69 : (TA) -> ((@list.List[String]) -> ((@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise) raise, x70 : TA, x71 : @list.List[String], x72 : @list.List[@kernel.Term], x73 : @list.List[@kernel.Term], x74 : @kernel.Term) -> @kernel.Thm raise {
  let rewrite = x69
  let lit = x70
  let funcs = x71
  let hyp_chain = x72
  let assumps = x73
  let tm = x74
  try {
    let th1 = @rewrite_rules.args_conv(rewrite(lit)(funcs)(hyp_chain)(assumps), tm)
    let tm1 = @equal.rhs(@kernel.concl(th1))
    let (f, args) = @basics.strip_comb(tm1)
    let name = @kernel.dest_const(f).0
    if @lib.mem(name, @shells.all_constructors(())) {
      th1
    } else {
      try {
        let (i, constructors) = @environment.get_def(name)
        if (i == 0L) {
          let th2 = @simp.rewr_conv(@lib.hd(constructors).1)(tm1)
          let t75 = @equal.rhs(@kernel.concl(th2))
          let th3 = rewrite(lit)(funcs)(hyp_chain)(assumps)(t75)
          @kernel.trans(@kernel.trans(th1, th2), th3)
        } else {
          if @lib.mem(name, funcs) {
            th1
          } else {
            let th2_1 = rewrite_with_lemmas(rewrite(lit)(funcs), hyp_chain, assumps, tm1)
            let tm2 = @equal.rhs(@kernel.concl(th2_1))
            if (tm2 == tm1) {
              try {
                let argi = @lib.el(@lib.int63_to_int(@lib.sub63(i, 1L)), args)
                let constructor_ = try {
                  @kernel.dest_const(@basics.strip_comb(argi).0).0
                } catch {
                  Failure(_) => ""
                  e => raise e
                }
                let th = @lib.assoc(constructor_, constructors)
                let th3_1 = @simp.rewr_conv(th)(tm1)
                let tm3 = @equal.rhs(@kernel.concl(th3_1))
                let funcs_p = if @definitions.is_explicit_value(argi) {
                  funcs
                } else {
                  funcs.prepend(name)
                }
                let th4 = rewrite(lit)(funcs_p)(hyp_chain)(assumps)(tm3)
                let tm4 = @equal.rhs(@kernel.concl(th4))
                if @definitions.good_properties(assumps, tm1, tm4, lit) {
                  @kernel.trans(@kernel.trans(th1, th3_1), th4)
                } else {
                  th1
                }
              } catch {
                Failure(_) => th1
                e => raise e
              }
            } else {
              @kernel.trans(th1, th2_1)
            }
          }
        }
      } catch {
        Failure("get_def") => @kernel.trans(th1, rewrite_with_lemmas(rewrite(lit)(funcs), hyp_chain, assumps, tm1))
        e => raise e
      }
    }
  } catch {
    Failure(_) => raise Failure("rewrite_application")
    e => raise e
  }
}

///|
/// `rewrite_term`
pub fn[TA] rewrite_term(x76 : TA, x77 : @list.List[String], x78 : @list.List[@kernel.Term], x79 : @list.List[@kernel.Term], x80 : @kernel.Term) -> @kernel.Thm raise {
  let lit = x76
  let funcs = x77
  let hyp_chain = x78
  let assumps = x79
  let tm = x80
  try {
    @bool.eqt_intro(@kernel.assume_rule(@lib.find(fn(x81 : @kernel.Term) -> Bool raise {
      let t = x81
      (t == tm)
    }, assumps)))
  } catch {
    Failure(_) => {
      try {
        @bool.eqf_intro(@kernel.assume_rule(@lib.find(fn(x82 : @kernel.Term) -> Bool raise {
          let t_1 = x82
          (t_1 == @bool.mk_neg(tm))
        }, assumps)))
      } catch {
        Failure(_) => {
          try {
            let rewrite : (@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise = fn(x86 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
              fn(x87 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                fn(x88 : @kernel.Term) -> @kernel.Thm raise {
                  ((x83 : @list.List[@kernel.Term], x84 : @list.List[@kernel.Term], x85 : @kernel.Term) => rewrite_term(lit, funcs, x83, x84, x85))(x86, x87, x88)
                }
              }
            }
            if @kernel.is_var(tm) {
              @equal.all_conv(tm)
            } else {
              if @definitions.is_explicit_value(tm) {
                rewrite_explicit_value(tm)
              } else {
                if @class.is_cond(tm) {
                  rewrite_conditional(rewrite(hyp_chain), assumps, tm)
                } else {
                  if @basics.is_eq(tm) {
                    rewrite_equality(rewrite, hyp_chain, assumps, tm)
                  } else {
                    rewrite_application(fn(x89 : TA) -> ((@list.List[String]) -> ((@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise) raise {
                      fn(x90 : @list.List[String]) -> ((@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise) raise {
                        fn(x91 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise) raise {
                          fn(x92 : @list.List[@kernel.Term]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                            fn(x93 : @kernel.Term) -> @kernel.Thm raise {
                              rewrite_term(x89, x90, x91, x92, x93)
                            }
                          }
                        }
                      }
                    }, lit, funcs, hyp_chain, assumps, tm)
                  }
                }
              }
            }
          } catch {
            Failure(_) => raise Failure("rewrite_term")
            e => raise e
          }
        }
        e => raise e
      }
    }
    e => raise e
  }
}

///|
/// `MOVE_COND_UP_CONV`
pub fn move_cond_up_conv(x94 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x94
  try {
    if !@lib.can((x95 : @kernel.Term) => @basics.find_term(@class.is_cond, x95), tm) {
      @equal.all_conv(tm)
    } else {
      if @class.is_cond(tm) {
        let t97 = @equal.rand_conv(move_cond_up_conv)
        let t96 = @equal.rator_conv(@equal.rand_conv(move_cond_up_conv))
        @equal.thenc(@equal.thenc(@equal.rator_conv(@equal.rator_conv(@equal.rand_conv(move_cond_up_conv))), t96), t97)(tm)
      } else {
        if @kernel.is_comb(tm) {
          let (op, arg) = @kernel.dest_comb(tm)
          if @class.is_cond(op) {
            @equal.thenc(@simp.rewr_conv(@class.cond_rator()), move_cond_up_conv)(tm)
          } else {
            if @class.is_cond(arg) {
              @equal.thenc(@simp.rewr_conv(@class.cond_rand()), move_cond_up_conv)(tm)
            } else {
              let t98 = @equal.rand_conv(move_cond_up_conv)
              let th = @equal.thenc(@equal.rator_conv(move_cond_up_conv), t98)(tm)
              let tm_p = @equal.rhs(@kernel.concl(th))
              if (tm_p == tm) {
                th
              } else {
                @kernel.trans(th, move_cond_up_conv(tm_p))
              }
            }
          }
        } else {
          @equal.all_conv(tm)
        }
      }
    }
  } catch {
    Failure(_) => raise Failure("MOVE_COND_UP_CONV")
    e => raise e
  }
}

///|
/// COND_OR
fn step_10() -> Unit raise {
  let t99 = @simp.rewrite_tac(@list.List([]))
  let t100 = @tactics.then_tac(@class.bool_cases_tac(@term_syntax.parse_term("(b : Bool)")), t99)
  cond_or_c.set(@tactics.prove(@term_syntax.parse_term("((if (b : Bool) { (x : Bool) } else { (y : Bool) }) || (z : Bool)) == ((!b || x || z) && (b || y || z))"), t100))
}

///|
let cond_or_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_OR")

///|
/// `COND_OR`
pub fn cond_or() -> @kernel.Thm {
  cond_or_c.get()
}

///|
/// `MOVE_NOT_THRU_CONDS_CONV`
pub fn move_not_thru_conds_conv(x101 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x101
  try {
    if @basics.is_neg(tm) {
      if @class.is_cond(@kernel.rand(tm)) {
        let t103 = @equal.rand_conv(move_not_thru_conds_conv)
        let t102 = @equal.rator_conv(@equal.rand_conv(move_not_thru_conds_conv))
        @equal.thenc(@equal.thenc(@simp.rewr_conv(@class.cond_rand()), t102), t103)(tm)
      } else {
        @equal.try_conv(@simp.rewr_conv(@clausal_form.not_not_norm()))(tm)
      }
    } else {
      @equal.all_conv(tm)
    }
  } catch {
    Failure(_) => raise Failure("MOVE_NOT_THRU_CONDS_CONV")
    e => raise e
  }
}

///|
/// `EXPAND_ONE_COND_CONV`
pub fn expand_one_cond_conv(x104 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x104
  try {
    let t106 = @equal.rator_conv(@equal.rand_conv(@equal.rator_conv(@equal.rand_conv(move_not_thru_conds_conv))))
    let t105 = @simp.rewr_conv(@clausal_form.cond_expand())
    @equal.thenc(@equal.orelsec(@simp.rewr_conv(cond_or()), t105), t106)(tm)
  } catch {
    Failure(_) => raise Failure("EXPAND_ONE_COND_CONV")
    e => raise e
  }
}

///|
/// `OR_OVER_ANDS_CONV`
pub fn or_over_ands_conv(x107 : (@kernel.Term) -> @kernel.Thm raise, x108 : @kernel.Term) -> @kernel.Thm raise {
  let conv = x107
  let tm = x108
  if @basics.is_disj(tm) {
    if @basics.is_conj(@kernel.rand(tm)) {
      let t112 = @equal.rand_conv((x111 : @kernel.Term) => or_over_ands_conv(conv, x111))
      let t110 = @equal.rator_conv(@equal.rand_conv((x109 : @kernel.Term) => or_over_ands_conv(conv, x109)))
      @equal.thenc(@equal.thenc(@simp.rewr_conv(@clausal_form.left_or_over_and()), t110), t112)(tm)
    } else {
      conv(tm)
    }
  } else {
    @equal.all_conv(tm)
  }
}

///|
/// `EXPAND_COND_CONV`
pub fn expand_cond_conv(x113 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x113
  try {
    let t116 = @equal.rand_conv(@equal.thenc(@equal.rand_conv(expand_cond_conv), (x115 : @kernel.Term) => or_over_ands_conv(expand_cond_conv, x115)))
    @equal.thenc(@equal.thenc(expand_one_cond_conv, @equal.rator_conv(@equal.rand_conv(@equal.thenc(@equal.rand_conv(expand_cond_conv), (x114 : @kernel.Term) => or_over_ands_conv(expand_cond_conv, x114))))), t116)(tm)
  } catch {
    Failure(_) => @equal.all_conv(tm)
    e => raise e
  }
}

///|
/// `SPLIT_CLAUSE_ON_COND_CONV`
pub fn split_clause_on_cond_conv(x117 : Int64, x118 : @kernel.Term) -> @kernel.Thm raise {
  let n = x117
  let tm = x118
  try {
    @lib.funpow(@lib.int63_to_int(n), fn(x119 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let conv = x119
      @equal.thenc(@equal.rand_conv(conv), (x121 : @kernel.Term) => or_over_ands_conv(@equal.all_conv, x121))
    }, expand_cond_conv)(tm)
  } catch {
    Failure(_) => raise Failure("SPLIT_CLAUSE_ON_COND_CONV")
    e => raise e
  }
}

///|
/// `simplify_one_literal`
pub fn simplify_one_literal(x122 : Int64, x123 : @kernel.Term) -> ((@kernel.Thm, Int64)) raise {
  let n = x122
  let tm = x123
  try {
    let negate : (@kernel.Term) -> @kernel.Term raise = fn(x124 : @kernel.Term) -> @kernel.Term raise {
      let tm_1 = x124
      if @basics.is_neg(tm_1) {
        @kernel.rand(tm_1)
      } else {
        @bool.mk_neg(tm_1)
      }
    }
    let negate_1 : (@kernel.Thm) -> @kernel.Thm raise = fn(x125 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x125
      let tm_2 = @equal.rhs(@kernel.concl(th))
      let th_p = @equal.ap_term(@term_syntax.parse_term("op_tilde"), th)
      if @support.is_t(tm_2) {
        @kernel.trans(th_p, @lib.el(1, @bool.conjuncts_rule(@class.not_clauses())))
      } else {
        if @support.is_f(tm_2) {
          @kernel.trans(th_p, @lib.el(2, @bool.conjuncts_rule(@class.not_clauses())))
        } else {
          th_p
        }
      }
    }
    let t126 = @support.disj_list(tm)
    let (overs_1, y_1, unders_1) = match @lib.chop_list(@lib.int63_to_int(n), t126) {
      (overs, More(y, tail=unders)) => (overs, y, unders)
      _ => raise Failure("")
    }
    let overs_p = @lib.map(negate, overs_1)
    let unders_p = @lib.map(negate, unders_1)
    let th1 = if @basics.is_neg(y_1) {
      negate_1(rewrite_term(y_1, @list.List([]), @list.List([]), overs_p.concat(unders_p), @kernel.rand(y_1)))
    } else {
      rewrite_term(y_1, @list.List([]), @list.List([]), overs_p.concat(unders_p), y_1)
    }
    let tm1 = @equal.rhs(@kernel.concl(th1))
    if (@support.is_t(tm1) || @support.is_f(tm1)) {
      let t127 = if @list.List::is_empty(unders_1) {
        0L
      } else {
        (-1L)
      }
      (@rewrite_rules.multi_disj_disch((overs_p, unders_p), th1), t127)
    } else {
      let th2 = @kernel.trans(th1, move_cond_up_conv(tm1))
      let tm2 = @equal.rhs(@kernel.concl(th2))
      let th3 = @rewrite_rules.multi_disj_disch((overs_p, unders_p), th2)
      if @class.is_cond(tm2) {
        (@equal.conv_rule(@equal.rand_conv((x128 : @kernel.Term) => split_clause_on_cond_conv(n, x128)), th3), 1L)
      } else {
        (th3, 0L)
      }
    }
  } catch {
    Failure(_) => raise Failure("simplify_one_literal")
    e => raise e
  }
}

///|
/// `simplify_clause`
pub fn simplify_clause(x129 : Int64, x130 : @kernel.Term) -> ((@list.List[@kernel.Term], (@list.List[@kernel.Thm]) -> @kernel.Thm raise)) raise {
  let n = x129
  let tm = x130
  try {
    let (th, change_flag) = simplify_one_literal(n, tm)
    let tm_p = @equal.rhs(@kernel.concl(th))
    if @support.is_t(tm_p) {
      (@list.List([]), (x132 : @list.List[@kernel.Thm]) => @waterfall.apply_fproof("simplify_clause", fn(x131 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
        let ths = x131
        @bool.eqt_elim(th)
      }, @list.List([]), x132))
    } else {
      let (tms, proof) = if (change_flag < 0L) {
        simplify_clause(n, tm_p)
      } else {
        if (change_flag == 0L) {
          simplify_clause(@lib.add63(n, 1L), tm_p)
        } else {
          simplify_clauses(@lib.add63(n, 1L), tm_p)
        }
      }
      (tms, fn(x133 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
        let ths_1 = x133
        let t134 = proof(ths_1)
        @kernel.eq_mp(@equal.sym(th), t134)
      })
    }
  } catch {
    Failure(_) => (@list.List([tm]), (x135 : @list.List[@kernel.Thm]) => @waterfall.apply_fproof("simplify_clause", @lib.hd, @list.List([tm]), x135))
    e => raise e
  }
}

///|
/// `simplify_clauses`
pub fn simplify_clauses(x136 : Int64, x137 : @kernel.Term) -> ((@list.List[@kernel.Term], (@list.List[@kernel.Thm]) -> @kernel.Thm raise)) raise {
  let n_1 = x136
  let tm_1 = x137
  try {
    let (tm1, tm2) = @basics.dest_conj(tm_1)
    let (tms1, proof1) = simplify_clauses(@lib.add63(n_1, 1L), tm1)
    let (tms2, proof2) = simplify_clauses(@lib.add63(n_1, 1L), tm2)
    (tms1.concat(tms2), fn(x138 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
      let ths_2 = x138
      let (ths1, ths2) = @lib.chop_list(@lib.length(tms1), ths_2)
      let t139 = proof2(ths2)
      @bool.conj(proof1(ths1), t139)
    })
  } catch {
    Failure(_) => simplify_clause(n_1, tm_1)
    e => raise e
  }
}

///|
/// `HL_simplify_clause`
pub fn hl_simplify_clause(x140 : @list.List[@kernel.Thm], x141 : @kernel.Term) -> ((@list.List[@kernel.Term], (@list.List[@kernel.Thm]) -> @kernel.Thm raise)) raise {
  let l = x140
  let tm = x141
  try {
    let t144 = @shells.all_accessor_thms(())
    let t145 = @lib.flat(@environment.defs(()))
    let rules = @lib.itlist(fn(x142 : @list.List[@kernel.Thm], x143 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
      @lib.union(x142, x143)
    }, @list.List([l, @environment.rewrite_rules(()), t145, t144]), @list.List([]))
    let th = @simp.simp_conv(rules)(tm)
    let tm_p = @equal.rhs(@kernel.concl(th))
    let tmc = try {
      (fn(x147 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.rand((fn(x146 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x146)
        })(x147))
      })(@class.cond_elim_conv(tm_p))
    } catch {
      Failure(_) => tm_p
      e => raise e
    }
    if @support.is_t(tm_p) {
      (@list.List([]), (x149 : @list.List[@kernel.Thm]) => @waterfall.apply_fproof("HL_simplify_clause", fn(x148 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
        let ths = x148
        @bool.eqt_elim(th)
      }, @list.List([]), x149))
    } else {
      let t150 = @equal.sym(th)
      (@list.List([tm_p]), (x153 : @list.List[@kernel.Thm]) => @waterfall.apply_fproof("HL_simplify_clause", fn(x152 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
        ((x151 : @kernel.Thm) => @kernel.eq_mp(t150, x151))(@lib.hd(x152))
      }, @list.List([tm_p]), x153))
    }
  } catch {
    Failure(_) => (@list.List([tm]), (x154 : @list.List[@kernel.Thm]) => @waterfall.apply_fproof("HL_simplify_clause", @lib.hd, @list.List([tm]), x154))
    e => raise e
  }
}

///|
/// `simplify_heuristic`
pub fn simplify_heuristic(x155 : @kernel.Term, x156 : Bool) -> ((@list.List[(@kernel.Term, Bool)], (@list.List[@kernel.Thm]) -> @kernel.Thm raise)) raise {
  let (tm, _ as ind) = (x155, x156)
  try {
    let (tms, proof) = simplify_clause(0L, tm)
    if (tms == @list.List([tm])) {
      raise Failure("")
    } else {
      @waterfall.proof_print_string_l("-> Simplify Heuristic", ())
      (@lib.map(fn(x157 : @kernel.Term) -> (@kernel.Term, Bool) raise {
        let tm_1 = x157
        (tm_1, ind)
      }, tms), proof)
    }
  } catch {
    Failure(_) => raise Failure("simplify_heuristic")
    e => raise e
  }
}

///|
/// `HL_simplify_heuristic`
pub fn hl_simplify_heuristic(x158 : @list.List[@kernel.Thm], x159 : (@kernel.Term, Bool)) -> ((@list.List[(@kernel.Term, Bool)], (@list.List[@kernel.Thm]) -> @kernel.Thm raise)) raise {
  let l = x158
  let (tm, _ as ind) = x159
  try {
    let (tms, proof) = hl_simplify_clause(l, tm)
    if (tms == @list.List([tm])) {
      raise Failure("")
    } else {
      @waterfall.proof_print_string_l("-> HL Simplify Heuristic", ())
      (@lib.map(fn(x160 : @kernel.Term) -> (@kernel.Term, Bool) raise {
        let tm_1 = x160
        (tm_1, ind)
      }, tms), proof)
    }
  } catch {
    Failure(_) => raise Failure("HL_simplify_heuristic")
    e => raise e
  }
}

///|
/// NOT_EQ_F
fn step_11() -> Unit raise {
  let t162 = @lib.el(1, @bool.conjuncts_rule(@class.not_clauses()))
  let t161 = @bool.spec_all(@theorems.refl_clause())
  not_eq_f_c.set(@bool.gen_all(@kernel.trans(@equal.ap_term(@term_syntax.parse_term("op_tilde"), t161), t162)))
}

///|
let not_eq_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_EQ_F")

///|
/// `NOT_EQ_F`
pub fn not_eq_f() -> @kernel.Thm {
  not_eq_f_c.get()
}

///|
/// `subst_heuristic`
pub fn subst_heuristic(x163 : @kernel.Term, x164 : Bool) -> ((@list.List[(@kernel.Term, Bool)], (@list.List[@kernel.Thm]) -> @kernel.Thm raise)) raise {
  let (tm, _ as ind) = (x163, x164)
  try {
    let checkx : ((@kernel.Term, @kernel.Term)) -> Bool raise = fn(x165 : (@kernel.Term, @kernel.Term)) -> Bool raise {
      let (v, t) = x165
      (@kernel.is_var(v) && !@lib.mem(v, @kernel.frees(t)))
    }
    fn split_disjuncts(x166 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term], @list.List[@kernel.Term])) raise {
      let tml = x166
      if @lib.can((x169 : @kernel.Term) => @lib.check(fn(x168 : @kernel.Term) -> Bool raise {
        (fn(x167 : @kernel.Term) -> Bool raise {
          checkx(@kernel.dest_eq(x167))
        })(@basics.dest_neg(x168))
      }, x169), @lib.hd(tml)) {
        (@list.List([]), tml)
      } else {
        (fn(x170 : (@list.List[@kernel.Term], @list.List[@kernel.Term])) -> (@list.List[@kernel.Term], @list.List[@kernel.Term]) raise {
          let (l1, l2) = x170
          (l1.prepend(@lib.hd(tml)), l2)
        })(split_disjuncts(@lib.tl(tml)))
      }
    }
    match split_disjuncts(@support.disj_list(tm)) {
      (overs, More(neq, tail=unders)) => {
        let eq = @basics.dest_neg(neq)
        let (v_1, t_1) = @kernel.dest_eq(eq)
        let ass = @kernel.assume_rule(neq)
        let th1 = @lib.itlist(@bool.disj2, overs, try {
          @bool.disj1(ass, @bool.list_mk_disj(unders))
        } catch {
          Failure(_) => ass
          e => raise e
        })
        let t171 = subst_conv(@list.List([(@kernel.assume_rule(eq), v_1)]), tm, tm)
        let th2 = @equal.subs(@list.List([@bool.ispec(t_1, not_eq_f())]), t171)
        let th3 = @bool.spec(eq, @class.excluded_middle())
        let tm_p = @equal.rhs(@kernel.concl(th2))
        let proof : (@kernel.Thm) -> @kernel.Thm raise = fn(x172 : @kernel.Thm) -> @kernel.Thm raise {
          let th = x172
          @bool.disj_cases(th3, @kernel.eq_mp(@equal.sym(th2), th), th1)
        }
        @waterfall.proof_print_string_l("-> Subst Heuristic", ())
        (@list.List([(tm_p, ind)]), (x174 : @list.List[@kernel.Thm]) => @waterfall.apply_fproof("subst_heuristic", fn(x173 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
          proof(@lib.hd(x173))
        }, @list.List([tm_p]), x174))
      }
      _ => raise @lib.MatchFailure("tscript.ml:756")
    }
  } catch {
    Failure(_) => raise Failure("subst_heuristic")
    e => raise e
  }
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
}
