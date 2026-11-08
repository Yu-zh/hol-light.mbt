// Translated from upstream Boyer_Moore/generalize.ml; edit this file directly.

///|
/// `is_generalizable`
pub fn is_generalizable(x1 : @list.List[String], x2 : @kernel.Term) -> Bool raise {
  let accessors = x1
  let tm = x2
  !((@kernel.is_var(tm) || (@equalities.is_explicit_value_template(tm) || (@basics.is_eq(tm) || (try {
    @lib.mem((fn(x6 : (@kernel.Term, @list.List[@kernel.Term])) -> String raise {
      (fn(x4 : @kernel.Term) -> String raise {
        (fn(x3 : (String, @kernel.HolType)) -> String raise {
          x3.0
        })(@kernel.dest_const(x4))
      })((fn(x5 : (@kernel.Term, @list.List[@kernel.Term])) -> @kernel.Term raise {
        x5.0
      })(x6))
    })((fn(x7 : @kernel.Term) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
      @basics.strip_comb(x7)
    })(tm)), accessors)
  } catch {
    Failure(_) => false
    e => raise e
  })))))
}

///|
/// `generalizable_subterms`
pub fn generalizable_subterms(x8 : @list.List[String], x9 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let accessors = x8
  let tm = x9
  try {
    @lib.setify(@support.find_bm_terms((x10 : @kernel.Term) => is_generalizable(accessors, x10), tm))
  } catch {
    Failure(_) => raise Failure("generalizable_subterms")
    e => raise e
  }
}

///|
/// `minimal_common_subterms`
pub fn minimal_common_subterms(x11 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
  let tml = x11
  let tml_p = @lib.setify(tml)
  @lib.filter(fn(x12 : @kernel.Term) -> Bool raise {
    let tm = x12
    !@lib.exists(fn(x13 : @kernel.Term) -> Bool raise {
      let tm_p = x13
      (@definitions.is_subterm(tm_p, tm) && !((tm_p == tm)))
    }, tml_p)
  }, tml_p)
}

///|
/// `to_be_generalized`
pub fn to_be_generalized(x14 : @kernel.Term, x15 : @list.List[@kernel.Term], x16 : @kernel.Term) -> Bool raise {
  let tm = x14
  let tml = x15
  let gen = x16
  try {
    let (l, r) = @kernel.dest_eq(@basics.dest_neg(tm))
    if (@definitions.is_subterm(gen, l) && @definitions.is_subterm(gen, r)) {
      true
    } else {
      raise Failure("")
    }
  } catch {
    Failure(_) => {
      try {
        let (l_1, r_1) = @kernel.dest_eq(tm)
        if (@definitions.is_subterm(gen, l_1) && @definitions.is_subterm(gen, r_1)) {
          true
        } else {
          raise Failure("")
        }
      } catch {
        Failure(_) => @lib.exists((x17 : @kernel.Term) => @definitions.is_subterm(gen, x17), tml)
        e => raise e
      }
    }
    e => raise e
  }
}

///|
/// `terms_to_be_generalized`
pub fn terms_to_be_generalized(x18 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let tm = x18
  let accessors = @shells.all_accessors(())
  fn terms_to_be_generalized_p(x19 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
    let tml = x19
    if @list.List::is_empty(tml) {
      @list.List([])
    } else {
      match tml {
        More(h, tail=t) => {
          let gens = generalizable_subterms(accessors, h)
          let gens_p = @lib.filter((x20 : @kernel.Term) => to_be_generalized(h, t, x20), gens)
          gens_p.concat(terms_to_be_generalized_p(t))
        }
        _ => raise @lib.MatchFailure("tscript.ml:102")
      }
    }
  }
  minimal_common_subterms(terms_to_be_generalized_p(@support.disj_list(tm)))
}

///|
/// `distinct_var`
pub fn distinct_var(x21 : @list.List[@kernel.Term], x22 : @kernel.HolType) -> @kernel.Term raise {
  let vars = x21
  let ty = x22
  let letter = try {
    (fn(x26 : (String, @list.List[@kernel.HolType])) -> String raise {
      (fn(x24 : String) -> String raise {
        @lib.hd((fn(x23 : String) -> @list.List[String] raise {
          @lib.explode(x23)
        })(x24))
      })((fn(x25 : (String, @list.List[@kernel.HolType])) -> String raise {
        x25.0
      })(x26))
    })(@kernel.dest_type(ty))
  } catch {
    Failure(_) => "x"
    e => raise e
  }
  @kernel.variant(vars, @kernel.mk_var(letter, ty))
}

///|
/// `distinct_vars`
pub fn distinct_vars(x27 : @list.List[@kernel.Term], x28 : @list.List[@kernel.HolType]) -> @list.List[@kernel.Term] raise {
  let vars = x27
  let tyl = x28
  if @list.List::is_empty(tyl) {
    @list.List([])
  } else {
    let var_ = distinct_var(vars, @lib.hd(tyl))
    distinct_vars(vars.prepend(var_), @lib.tl(tyl)).prepend(var_)
  }
}

///|
/// `apply_gen_lemma`
pub fn apply_gen_lemma(x29 : @kernel.Term, x30 : @kernel.Thm) -> @kernel.Thm raise {
  let tm = x29
  let th = x30
  try {
    let apply_gen_lemma_p : (@kernel.Term) -> @kernel.Thm raise = fn(x31 : @kernel.Term) -> @kernel.Thm raise {
      let subtm = x31
      let (_, tm_bind, ty_bind) = @drule.term_match(@list.List([]), subtm, tm)
      let (insts, vars) = @lib.list_split(tm_bind)
      let th_p = (fn(x34 : @kernel.Thm) -> @kernel.Thm raise {
        ((x32 : @kernel.Thm) => @bool.specl(insts, x32))(((x33 : @kernel.Thm) => @bool.genl(vars, x33))(x34))
      })((fn(x36 : @kernel.Thm) -> @kernel.Thm raise {
        ((x35 : @kernel.Thm) => @kernel.inst_type(ty_bind, x35))(x36)
      })(th))
      let t37 = @kernel.concl(th_p)
      let gen_conc = @basics.subst(@list.List([(@basics.genvar(@kernel.type_of(tm)), tm)]), t37)
      let f = @basics.strip_comb(tm).0
      if @definitions.is_subterm(f, gen_conc) {
        raise Failure("")
      } else {
        th_p
      }
    }
    match @kernel.dest_thm(th) {
      (Empty, conc) => {
        let conc_vars = @kernel.frees(conc)
        let good_subterm : (@kernel.Term) -> Bool raise = fn(x38 : @kernel.Term) -> Bool raise {
          let subtm_1 = x38
          (@lib.can((x39 : @kernel.Term) => @drule.term_match(@list.List([]), subtm_1, x39), tm) && @list.List::is_empty(@lib.subtract(conc_vars, @kernel.frees(subtm_1))))
        }
        let subtms = @lib.rev(@basics.find_terms(good_subterm, conc))
        @lib.tryfind(apply_gen_lemma_p, subtms)
      }
      _ => raise @lib.MatchFailure("tscript.ml:170")
    }
  } catch {
    Failure(_) => raise Failure("apply_gen_lemma")
    e => raise e
  }
}

///|
/// `applicable_gen_lemmas`
pub fn applicable_gen_lemmas(x40 : @list.List[@kernel.Term]) -> @list.List[@kernel.Thm] raise {
  let tml = x40
  @lib.flat(@lib.map(fn(x41 : @kernel.Term) -> @list.List[@kernel.Thm] raise {
    let tm = x41
    @lib.mapfilter((x42 : @kernel.Thm) => apply_gen_lemma(tm, x42), @environment.gen_lemmas(()))
  }, tml))
}

///|
/// `generalize_heuristic`
pub fn generalize_heuristic(x43 : @kernel.Term, x44 : Bool) -> ((@list.List[(@kernel.Term, Bool)], (@list.List[@kernel.Thm]) -> @kernel.Thm raise)) raise {
  let (tm, _ as ind) = (x43, x44)
  try {
    let negate : (@kernel.Thm) -> @kernel.Thm raise = fn(x45 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x45
      match @kernel.dest_thm(th) {
        (Empty, tm_1) => {
          if @basics.is_neg(tm_1) {
            @bool.eqf_intro(th)
          } else {
            @bool.eqf_intro(@equal.conv_rule(@simp.rewr_conv(@equal.sym(@bool.spec_all(@lib.hd(@bool.conjuncts_rule(@class.not_clauses()))))), th))
          }
        }
        _ => raise @lib.MatchFailure("tscript.ml:232")
      }
    }
    let elim_lemma : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(x46 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let lemma = x46
      fn(x47 : @kernel.Thm) -> @kernel.Thm raise {
        let th_1 = x47
        let rest = @basics.dest_disj(@kernel.concl(th_1)).1
        let t48 = @equal.ap_thm(@equal.ap_term(@term_syntax.parse_term("op_bslash_slash"), lemma), rest)
        @kernel.eq_mp(@equal.conv_rule(@equal.rand_conv(@simp.rewr_conv(@rewrite_rules.f_or())), t48), th_1)
      }
    }
    let gen_terms = @lib.check(fn(x49 : @list.List[@kernel.Term]) -> Bool raise {
      let l = x49
      !@list.List::is_empty(l)
    }, terms_to_be_generalized(tm))
    let lemmas = @lib.map(negate, applicable_gen_lemmas(gen_terms))
    let tm_p = @lib.itlist((x51 : @kernel.Term, x52 : @kernel.Term) => @lib.curry(fn(x50 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      @bool.mk_disj(x50.0, x50.1)
    }, x51, x52), @lib.map(fn(x54 : @kernel.Thm) -> @kernel.Term raise {
      @equal.lhs((fn(x53 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x53)
      })(x54))
    }, lemmas), tm)
    let t56 = @lib.map(fn(x55 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x55)
    }, gen_terms)
    let new_vars = distinct_vars(@kernel.frees(tm_p), t56)
    let tm_p_p = @basics.subst(@support.lcombinep(new_vars, gen_terms), tm_p)
    let countercheck = try {
      @counterexample.counter_check(5L, tm_p_p)
    } catch {
      Failure(_) => {
        @lib.warn(true, "Could not generate counter example!")
        true
      }
      e => raise e
    }
    if (countercheck == true) {
      let proof : (@kernel.Thm) -> @kernel.Thm raise = fn(x57 : @kernel.Thm) -> @kernel.Thm raise {
        let th_p_p = x57
        let th_p = @bool.specl(gen_terms, @bool.genl(new_vars, th_p_p))
        @lib.rev_itlist(fn(x58 : @kernel.Thm, x59 : @kernel.Thm) -> @kernel.Thm raise {
          let s60 = elim_lemma(x58)
          s60(x59)
        }, lemmas, th_p)
      }
      @waterfall.proof_print_string_l("-> Generalize Heuristic", ())
      {
        @environment.my_gen_terms().val = (@environment.my_gen_terms().val).prepend(tm_p_p)
        ()
      }
      (@list.List([(tm_p_p, ind)]), (x62 : @list.List[@kernel.Thm]) => @waterfall.apply_fproof("generalize_heuristic", fn(x61 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
        proof(@lib.hd(x61))
      }, @list.List([tm_p_p]), x62))
    } else {
      raise Failure("Counter example failure!")
    }
  } catch {
    Failure(_) => raise Failure("generalize_heuristic")
    e => raise e
  }
}

///|
/// `is_constructor_eq`
pub fn is_constructor_eq(x63 : String, x64 : @kernel.Term, x65 : @kernel.Term) -> Bool raise {
  let constructor_ = x63
  let v = x64
  let tm = x65
  try {
    let (a, b) = @kernel.dest_eq(tm)
    let cand_c = if (v == a) {
      b
    } else {
      if (v == b) {
        a
      } else {
        raise Failure("")
      }
    }
    let cand_name = (fn(x69 : (@kernel.Term, @list.List[@kernel.Term])) -> String raise {
      (fn(x67 : @kernel.Term) -> String raise {
        (fn(x66 : (String, @kernel.HolType)) -> String raise {
          x66.0
        })(@kernel.dest_const(x67))
      })((fn(x68 : (@kernel.Term, @list.List[@kernel.Term])) -> @kernel.Term raise {
        x68.0
      })(x69))
    })((fn(x70 : @kernel.Term) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
      @basics.strip_comb(x70)
    })(cand_c))
    (constructor_ == cand_name)
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// `is_constructor_neq`
pub fn is_constructor_neq(x71 : String, x72 : @kernel.Term, x73 : @kernel.Term) -> Bool raise {
  let constructor_ = x71
  let v = x72
  let tm = x73
  try {
    let tm_p = @basics.dest_neg(tm)
    let (a, b) = @kernel.dest_eq(tm_p)
    let cand_c = if (v == a) {
      b
    } else {
      if (v == b) {
        a
      } else {
        raise Failure("")
      }
    }
    let cand_name = (fn(x77 : (@kernel.Term, @list.List[@kernel.Term])) -> String raise {
      (fn(x75 : @kernel.Term) -> String raise {
        (fn(x74 : (String, @kernel.HolType)) -> String raise {
          x74.0
        })(@kernel.dest_const(x75))
      })((fn(x76 : (@kernel.Term, @list.List[@kernel.Term])) -> @kernel.Term raise {
        x76.0
      })(x77))
    })((fn(x78 : @kernel.Term) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
      @basics.strip_comb(x78)
    })(cand_c))
    (constructor_ == cand_name)
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// `infer_constructor`
pub fn infer_constructor(x79 : @kernel.Term, x80 : @kernel.Term) -> String raise {
  let v = x79
  let tm = x80
  try {
    @printer.print_term(v)
    @pp.std_formatter.print_string(" XXX ")
    @printer.print_term(tm)
    {
      @pp.std_formatter.print_newline()
    }
    let t82 = @kernel.type_of(v)
    let v_ty = (fn(x81 : (String, @list.List[@kernel.HolType])) -> String raise {
      x81.0
    })(@kernel.dest_type(t82))
    let clist = @lib.map(fn(x83 : (String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])) -> String raise {
      @support.fst3(x83.0, x83.1, x83.2)
    }, @shells.shell_constructors(@shells.sys_shell_info(v_ty)))
    let conjs = @support.conj_list(tm)
    let check_constructor_eq : (String) -> ((@kernel.Term) -> ((@list.List[@kernel.Term]) -> Bool raise) raise) raise = fn(x84 : String) -> ((@kernel.Term) -> ((@list.List[@kernel.Term]) -> Bool raise) raise) raise {
      let c = x84
      fn(x85 : @kernel.Term) -> ((@list.List[@kernel.Term]) -> Bool raise) raise {
        let v_1 = x85
        fn(x86 : @list.List[@kernel.Term]) -> Bool raise {
          let tms = x86
          let res = @lib.map((x87 : @kernel.Term) => is_constructor_eq(c, v_1, x87), tms)
          if @lib.mem(true, res) {
            true
          } else {
            false
          }
        }
      }
    }
    let check_constructor_neq : (String) -> ((@kernel.Term) -> ((@list.List[@kernel.Term]) -> Bool raise) raise) raise = fn(x88 : String) -> ((@kernel.Term) -> ((@list.List[@kernel.Term]) -> Bool raise) raise) raise {
      let c_1 = x88
      fn(x89 : @kernel.Term) -> ((@list.List[@kernel.Term]) -> Bool raise) raise {
        let v_2 = x89
        fn(x90 : @list.List[@kernel.Term]) -> Bool raise {
          let tms_1 = x90
          let res_1 = @lib.map((x91 : @kernel.Term) => is_constructor_neq(c_1, v_2, x91), tms_1)
          if @lib.mem(true, res_1) {
            true
          } else {
            false
          }
        }
      }
    }
    let check_constructor : (String) -> ((@list.List[String]) -> ((@kernel.Term) -> ((@list.List[@kernel.Term]) -> Bool raise) raise) raise) raise = fn(x92 : String) -> ((@list.List[String]) -> ((@kernel.Term) -> ((@list.List[@kernel.Term]) -> Bool raise) raise) raise) raise {
      let c_2 = x92
      fn(x93 : @list.List[String]) -> ((@kernel.Term) -> ((@list.List[@kernel.Term]) -> Bool raise) raise) raise {
        let all_constr = x93
        fn(x94 : @kernel.Term) -> ((@list.List[@kernel.Term]) -> Bool raise) raise {
          let v_3 = x94
          fn(x95 : @list.List[@kernel.Term]) -> Bool raise {
            let tms_2 = x95
            if check_constructor_eq(c_2)(v_3)(tms_2) {
              true
            } else {
              let constrs = @lib.subtract(all_constr, @list.List([c_2]))
              let res_2 = @lib.map(fn(x96 : String) -> Bool raise {
                let c_3 = x96
                check_constructor_neq(c_3)(v_3)(tms_2)
              }, constrs)
              if @lib.mem(false, res_2) {
                false
              } else {
                true
              }
            }
          }
        }
      }
    }
    let res_3 = @lib.map(fn(x97 : String) -> Bool raise {
      let c_4 = x97
      check_constructor(c_4)(clist)(v)(conjs)
    }, clist)
    let reslist = @lib.list_combine(res_3, clist)
    @lib.assoc(true, reslist)
  } catch {
    Failure(_) => raise Failure("infer_constructor")
    e => raise e
  }
}

///|
/// `get_rec_pos_of_fun`
pub fn get_rec_pos_of_fun(x98 : @kernel.Term) -> Int64 raise {
  let f = x98
  try {
    (fn(x102 : (String, @kernel.HolType)) -> Int64 raise {
      (fn(x100 : String) -> Int64 raise {
        (fn(x99 : (Int64, @list.List[(String, @kernel.Thm)])) -> Int64 raise {
          x99.0
        })(@environment.get_def(x100))
      })((fn(x101 : (String, @kernel.HolType)) -> String raise {
        x101.0
      })(x102))
    })(@kernel.dest_const(f))
  } catch {
    Failure(_) => 0L
    e => raise e
  }
}

///|
/// `is_in_rec_pos`
pub fn is_in_rec_pos(x103 : @kernel.Term, x104 : @kernel.Term) -> Bool raise {
  let subtm = x103
  let tm = x104
  let (op, args) = @basics.strip_comb(tm)
  try {
    let rec_argn = get_rec_pos_of_fun(op)
    if (@lib.el(@lib.int63_to_int(@lib.sub63(rec_argn, 1L)), args) == subtm) {
      true
    } else {
      raise Failure("")
    }
  } catch {
    Failure(_) => @lib.mem(true, @lib.map((x105 : @kernel.Term) => is_in_rec_pos(subtm, x105), args))
    e => raise e
  }
}

///|
/// `is_var_in_rec_pos`
pub fn is_var_in_rec_pos(x106 : @kernel.Term, x107 : @kernel.Term) -> Bool raise {
  let v = x106
  let tm = x107
  try {
    if !@kernel.is_var(v) {
      false
    } else {
      if !@lib.mem(v, @kernel.frees(tm)) {
        false
      } else {
        is_in_rec_pos(v, tm)
      }
    }
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// `eliminateSelectors`
pub fn eliminateselectors(x108 : @kernel.Term) -> @kernel.Term raise {
  let tm = x108
  try {
    let vars = @kernel.frees(tm)
    let vars_p = @lib.filter(fn(x111 : @kernel.Term) -> Bool raise {
      (fn(x109 : Bool) -> Bool raise {
        !x109
      })((fn(x110 : @kernel.Term) -> Bool raise {
        let v = x110
        is_var_in_rec_pos(v, tm)
      })(x111))
    }, vars)
    if @list.List::is_empty(vars_p) {
      tm
    } else {
      fn find_candidate(x112 : @list.List[@kernel.Term], x113 : @kernel.Term) -> ((@kernel.Term, String)) raise {
        let vars_1 = x112
        let tm_1 = x113
        if @list.List::is_empty(vars_1) {
          raise Failure("find_candidate")
        } else {
          let var_ = @lib.hd(vars_1)
          try {
            (var_, infer_constructor(var_, tm_1))
          } catch {
            Failure(_) => find_candidate(@lib.tl(vars_1), tm_1)
            e => raise e
          }
        }
      }
      let (var__1, constr) = find_candidate(vars_p, tm)
      let t115 = @kernel.type_of(var__1)
      let v_ty = (fn(x114 : (String, @list.List[@kernel.HolType])) -> String raise {
        x114.0
      })(@kernel.dest_type(t115))
      let s_info = @shells.sys_shell_info(v_ty)
      let new_vars = distinct_vars(vars, @shells.shell_constructor_arg_types(constr, s_info))
      let new_subtm = @basics.list_mk_icomb(constr, new_vars)
      let new_tm = @basics.subst(@list.List([(new_subtm, var__1)]), tm)
      let t120 = @simp.rewrite_conv(@lib.map(fn(x119 : (String, @kernel.Thm)) -> @kernel.Thm raise {
        x119.1
      }, @shells.shell_constructor_accessors(constr, s_info)))(new_tm)
      (fn(x117 : @kernel.Term) -> @kernel.Term raise {
        (fn(x116 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          x116.1
        })(@kernel.dest_eq(x117))
      })((fn(x118 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x118)
      })(t120))
    }
  } catch {
    Failure(_) => raise Failure("eliminateSelectors")
    e => raise e
  }
}

///|
/// all_variables
fn step_1() -> Unit raise {
  fn vars(x121 : @list.List[@kernel.Term], x122 : @kernel.Term) -> @list.List[@kernel.Term] raise {
    let (acc, tm) = (x121, x122)
    if @kernel.is_var(tm) {
      acc.prepend(tm)
    } else {
      if @kernel.is_const(tm) {
        acc
      } else {
        if @kernel.is_abs(tm) {
          let (v, bod) = @kernel.dest_abs(tm)
          vars(acc.prepend(v), bod)
        } else {
          let (l, r) = @kernel.dest_comb(tm)
          vars(vars(acc, r), l)
        }
      }
    }
  }
  all_variables_c.set(fn(x123 : @kernel.Term) -> @list.List[@kernel.Term] raise {
    let tm_1 = x123
    vars(@list.List([]), tm_1)
  })
}

///|
let all_variables_c : @lib.Cell[(@kernel.Term) -> @list.List[@kernel.Term] raise] = @lib.Cell::new("all_variables")

///|
/// `all_variables`
pub fn all_variables(x : @kernel.Term) -> @list.List[@kernel.Term] raise {
  (all_variables_c.get())(x)
}

///|
/// all_equations
fn step_2() -> Unit raise {
  fn eqs(x124 : @list.List[@kernel.Term], x125 : @kernel.Term) -> @list.List[@kernel.Term] raise {
    let (acc, tm) = (x124, x125)
    if @basics.is_eq(tm) {
      acc.prepend(tm)
    } else {
      if @kernel.is_var(tm) {
        acc
      } else {
        if @kernel.is_const(tm) {
          acc
        } else {
          if @kernel.is_abs(tm) {
            let (v, bod) = @kernel.dest_abs(tm)
            eqs(acc, bod)
          } else {
            let (l, r) = @kernel.dest_comb(tm)
            eqs(eqs(acc, r), l)
          }
        }
      }
    }
  }
  all_equations_c.set(fn(x126 : @kernel.Term) -> @list.List[@kernel.Term] raise {
    let tm_1 = x126
    eqs(@list.List([]), tm_1)
  })
}

///|
let all_equations_c : @lib.Cell[(@kernel.Term) -> @list.List[@kernel.Term] raise] = @lib.Cell::new("all_equations")

///|
/// `all_equations`
pub fn all_equations(x : @kernel.Term) -> @list.List[@kernel.Term] raise {
  (all_equations_c.get())(x)
}

///|
/// `contains_any`
pub fn contains_any(x127 : @kernel.Term, x128 : @list.List[String]) -> Bool raise {
  let tm = x127
  let args = x128
  if @kernel.is_var(tm) {
    false
  } else {
    if @nums.is_numeral(tm) {
      false
    } else {
      if @kernel.is_const(tm) {
        @lib.mem((fn(x129 : (String, @kernel.HolType)) -> String raise {
          x129.0
        })(@kernel.dest_const(tm)), args)
      } else {
        if @kernel.is_abs(tm) {
          let (v, bod) = @kernel.dest_abs(tm)
          contains_any(v, args)
        } else {
          let (l, r) = @kernel.dest_comb(tm)
          (contains_any(l, args) || contains_any(r, args))
        }
      }
    }
  }
}

///|
/// `is_rec_type`
pub fn is_rec_type(x130 : @kernel.Term) -> Bool raise {
  let tm = x130
  try {
    let t134 = @shells.shells(())
    @lib.mem((fn(x132 : @kernel.HolType) -> String raise {
      (fn(x131 : (String, @list.List[@kernel.HolType])) -> String raise {
        x131.0
      })(@kernel.dest_type(x132))
    })((fn(x133 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x133)
    })(tm)), t134)
  } catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// `is_generalizable_subterm`
pub fn is_generalizable_subterm(x135 : @list.List[String], x136 : @kernel.Term) -> Bool raise {
  let bad = x135
  let tm = x136
  (is_rec_type(tm) && !((@kernel.is_var(tm) || (@kernel.is_const(tm) || (@nums.is_numeral(tm) || contains_any(tm, bad))))))
}

///|
/// `is_suitable_proposal`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] is_suitable_proposal(x137 : @list.List[TA], x138 : TB, x139 : @list.List[TA]) -> Bool raise {
  let s = x137
  let phi = x138
  let gens = x139
  (@lib.forall(fn(x140 : TA) -> Bool raise {
    let tm = x140
    @lib.mem(tm, gens)
  }, s) && @lib.exists(fn(x141 : TA) -> Bool raise {
    let tm_1 = x141
    (@support.lcount(tm_1, gens) > 1L)
  }, s))
}

///|
/// checksuitableeq
fn step_3() -> Unit raise {
  checksuitableeq_c.set(Ref::{ val: false })
}

///|
let checksuitableeq_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("checksuitableeq")

///|
/// `checksuitableeq`
pub fn checksuitableeq() -> Ref[Bool] {
  checksuitableeq_c.get()
}

///|
/// newisgen
fn step_4() -> Unit raise {
  newisgen_c.set(Ref::{ val: true })
}

///|
let newisgen_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("newisgen")

///|
/// `newisgen`
pub fn newisgen() -> Ref[Bool] {
  newisgen_c.get()
}

///|
/// `is_eq_suitable`
pub fn is_eq_suitable(x142 : @kernel.Term, x143 : @kernel.Term) -> Bool raise {
  let t = x142
  let eq = x143
  if !(checksuitableeq().val) {
    true
  } else {
    if !@basics.is_eq(eq) {
      false
    } else {
      let (l, r) = @kernel.dest_eq(eq)
      if (@definitions.is_subterm(t, r) && @definitions.is_subterm(t, l)) {
        true
      } else {
        (Int::to_int64(@lib.length(@support.find_bm_terms(fn(x144 : @kernel.Term) -> Bool raise {
          (t == x144)
        }, eq))) > 1L)
      }
    }
  }
}

///|
/// `generateProposals`
pub fn generateproposals(x145 : @kernel.Term, x146 : @kernel.Term) -> @list.List[@list.List[@kernel.Term]] raise {
  let tm = x145
  let phi = x146
  let t156 = @shells.all_constructors(())
  let bad_1 = @shells.all_accessors(()).concat(t156)
  let gens_1 = if newisgen().val {
    @support.find_bm_terms((x157 : @kernel.Term) => is_generalizable_subterm(bad_1, x157), phi)
  } else {
    @support.find_bm_terms((x158 : @kernel.Term) => is_generalizable(bad_1, x158), phi)
  }
  generateproposals_p_l(bad_1, tm, phi, gens_1)
}

///|
fn[TA, TB] generateproposals_p_l(x147 : TA, x148 : @kernel.Term, x149 : TB, x150 : @list.List[@kernel.Term]) -> @list.List[@list.List[@kernel.Term]] raise {
  let bad = x147
  let tm_1 = x148
  let phi_1 = x149
  let gens = x150
  let p = @list.List([])
  if @basics.is_eq(tm_1) {
    let (t1, t2) = @kernel.dest_eq(tm_1)
    let p1 = generateproposals_p_l(bad, t1, phi_1, gens)
    let p1_p = if is_suitable_proposal(@list.List([t1]), phi_1, gens) {
      p1.concat(@list.List([@list.List([t1])]))
    } else {
      p1
    }
    let p_1 = p.concat(@lib.filter((x152 : @list.List[@kernel.Term]) => @lib.exists(fn(x151 : @kernel.Term) -> Bool raise {
      let t = x151
      is_eq_suitable(t, tm_1)
    }, x152), p1_p))
    let p2 = generateproposals_p_l(bad, t2, phi_1, gens)
    let p2_p = if is_suitable_proposal(@list.List([t2]), phi_1, gens) {
      p2.concat(@list.List([@list.List([t2])]))
    } else {
      p2
    }
    p_1.concat(@lib.filter((x154 : @list.List[@kernel.Term]) => @lib.exists(fn(x153 : @kernel.Term) -> Bool raise {
      let t_1 = x153
      is_eq_suitable(t_1, tm_1)
    }, x154), p2_p))
  } else {
    if @kernel.is_comb(tm_1) {
      let (op, args) = @basics.strip_comb(tm_1)
      let recpos = get_rec_pos_of_fun(op)
      let s = if (recpos > 0L) {
        @list.List([@lib.el(@lib.int63_to_int(@lib.sub63(recpos, 1L)), args)])
      } else {
        @list.List([])
      }
      let p_2 = if is_suitable_proposal(s, phi_1, gens) {
        p.concat(@list.List([s]))
      } else {
        p
      }
      p_2.concat(@lib.flat(@lib.map(fn(x155 : @kernel.Term) -> @list.List[@list.List[@kernel.Term]] raise {
        let tm_2 = x155
        generateproposals_p_l(bad, tm_2, phi_1, gens)
      }, args)))
    } else {
      p
    }
  }
}

///|
/// `proposal_induction_test`
pub fn proposal_induction_test(x159 : @list.List[@kernel.Term], x160 : @kernel.Term) -> Bool raise {
  let s = x159
  let phi = x160
  let t162 = @lib.map(fn(x161 : @kernel.Term) -> @kernel.HolType raise {
    @kernel.type_of(x161)
  }, s)
  let newvars = distinct_vars(@kernel.frees(phi), t162)
  let subs = @lib.list_combine(newvars, s)
  let newterm = @basics.subst(subs, phi)
  let (unfl, fl) = @induction.possible_inductions(newterm)
  if @lib.exists(fn(x163 : @kernel.Term) -> Bool raise {
    let v = x163
    @lib.mem(v, unfl.concat(fl))
  }, newvars) {
    true
  } else {
    false
  }
}

///|
/// `get_proposal_term_occs`
pub fn get_proposal_term_occs(x164 : @list.List[@kernel.Term], x165 : @kernel.Term) -> Int64 raise {
  let s = x164
  let phi = x165
  let gens = @support.find_bm_terms(fn(x166 : @kernel.Term) -> Bool raise {
    let tm = x166
    true
  }, phi)
  let scount = @lib.map(fn(x167 : @kernel.Term) -> Int64 raise {
    let tm_1 = x167
    @support.lcount(tm_1, gens)
  }, s)
  @lib.itlist(fn(x170 : Int64, x171 : Int64) -> Int64 raise {
    let s172 = (fn(x168 : Int64) -> ((Int64) -> Int64 raise) raise {
      fn(x169 : Int64) -> Int64 raise {
        @lib.add63(x168, x169)
      }
    })(x170)
    s172(x171)
  }, scount, 0L)
}

///|
/// `organizeProposals`
pub fn organizeproposals(x173 : @list.List[@list.List[@kernel.Term]], x174 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let s = x173
  let phi = x174
  let stest = @lib.map(fn(x175 : @list.List[@kernel.Term]) -> (@list.List[@kernel.Term], Bool) raise {
    let prop = x175
    (prop, proposal_induction_test(prop, phi))
  }, s)
  let indok = @lib.filter(fn(x178 : (@list.List[@kernel.Term], Bool)) -> Bool raise {
    (fn(x176 : Bool) -> Bool raise {
      (true == x176)
    })((fn(x177 : (@list.List[@kernel.Term], Bool)) -> Bool raise {
      x177.1
    })(x178))
  }, stest)
  let s_p = if @list.List::is_empty(indok) {
    @waterfall.proof_print_string_l("Weak Generalization", @lib.map(fn(x179 : (@list.List[@kernel.Term], Bool)) -> @list.List[@kernel.Term] raise {
      x179.0
    }, stest))
  } else {
    @lib.map(fn(x180 : (@list.List[@kernel.Term], Bool)) -> @list.List[@kernel.Term] raise {
      x180.0
    }, indok)
  }
  if (Int::to_int64(@lib.length(s_p)) == 1L) {
    @lib.hd(s_p)
  } else {
    let t183 = @lib.map(fn(x182 : @list.List[@kernel.Term]) -> (@list.List[@kernel.Term], Int64) raise {
      let prop_1 = x182
      (prop_1, @support.lcount(prop_1, s_p))
    }, s_p)
    let scounted = (fn(x181 : @list.List[(@list.List[@kernel.Term], Int64)]) -> @list.List[(@list.List[@kernel.Term], Int64)] raise {
      @lib.rev(x181)
    })(@support.sort_on_snd(t183))
    let smax = (fn(x184 : (@list.List[@kernel.Term], Int64)) -> Int64 raise {
      x184.1
    })(@lib.hd(scounted))
    let s_p_p = @lib.map(fn(x185 : (@list.List[@kernel.Term], Int64)) -> @list.List[@kernel.Term] raise {
      x185.0
    }, @lib.filter(fn(x188 : (@list.List[@kernel.Term], Int64)) -> Bool raise {
      (fn(x186 : Int64) -> Bool raise {
        (smax == x186)
      })((fn(x187 : (@list.List[@kernel.Term], Int64)) -> Int64 raise {
        x187.1
      })(x188))
    }, scounted))
    if (Int::to_int64(@lib.length(s_p_p)) == 1L) {
      @lib.hd(s_p_p)
    } else {
      let t191 = @lib.map(fn(x190 : @list.List[@kernel.Term]) -> (@list.List[@kernel.Term], Int64) raise {
        let prop_2 = x190
        (prop_2, get_proposal_term_occs(prop_2, phi))
      }, s_p_p)
      let soccscounted = (fn(x189 : @list.List[(@list.List[@kernel.Term], Int64)]) -> @list.List[(@list.List[@kernel.Term], Int64)] raise {
        @lib.rev(x189)
      })(@support.sort_on_snd(t191))
      (fn(x192 : (@list.List[@kernel.Term], Int64)) -> @list.List[@kernel.Term] raise {
        x192.0
      })(@lib.hd(soccscounted))
    }
  }
}

///|
/// `generalizeCommonSubterms`
pub fn generalizecommonsubterms(x193 : @kernel.Term) -> ((@kernel.Term, @list.List[(@kernel.Term, @kernel.Term)])) raise {
  let tm = x193
  let props = generateproposals(tm, tm)
  if @list.List::is_empty(props) {
    raise Failure("")
  } else {
    let s = organizeproposals(props, tm)
    let t195 = @lib.map(fn(x194 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x194)
    }, s)
    let newvars = distinct_vars(@kernel.frees(tm), t195)
    let varcomb = @lib.list_combine(newvars, s)
    (@basics.subst(varcomb, tm), varcomb)
  }
}

///|
/// `separate`
pub fn separate(x196 : @kernel.Term, x197 : @kernel.Term, x198 : @kernel.Term, x199 : Bool, x200 : @kernel.Term) -> @kernel.Term raise {
  let f = x196
  let v = x197
  let v_p = x198
  let allrpos = x199
  let tm = x200
  let replace : (@kernel.Term) -> ((@kernel.Term) -> ((@kernel.Term) -> ((Bool) -> @kernel.Term raise) raise) raise) raise = fn(x201 : @kernel.Term) -> ((@kernel.Term) -> ((@kernel.Term) -> ((Bool) -> @kernel.Term raise) raise) raise) raise {
    let tm_1 = x201
    fn(x202 : @kernel.Term) -> ((@kernel.Term) -> ((Bool) -> @kernel.Term raise) raise) raise {
      let v_1 = x202
      fn(x203 : @kernel.Term) -> ((Bool) -> @kernel.Term raise) raise {
        let v_p_1 = x203
        fn(x204 : Bool) -> @kernel.Term raise {
          let rpos = x204
          if !rpos {
            tm_1
          } else {
            if (tm_1 == v_1) {
              v_p_1
            } else {
              separate(f, v_1, v_p_1, allrpos, tm_1)
            }
          }
        }
      }
    }
  }
  if @kernel.is_comb(tm) {
    let (op, args) = @basics.strip_comb(tm)
    let recpos = get_rec_pos_of_fun(op)
    if (allrpos && !((op == @term_syntax.parse_term("(op_eq : (_, _) -> Bool)")))) {
      @basics.list_mk_comb(op, @lib.map(fn(x205 : (@kernel.Term, Int64)) -> @kernel.Term raise {
        let (t, i) = x205
        replace(t)(v)(v_p)(((i == recpos) || (recpos == 0L)))
      }, @support.number_list(args)))
    } else {
      if (op == @term_syntax.parse_term("(op_eq : (_, _) -> Bool)")) {
        let t206 = replace(@lib.hd(@lib.tl(args)))(v)(v_p)(true)
        @basics.list_mk_comb(op, @list.List([replace(@lib.hd(args))(v)(v_p)(true), t206]))
      } else {
        if (op == f) {
          @basics.list_mk_comb(op, @lib.map(fn(x207 : (@kernel.Term, Int64)) -> @kernel.Term raise {
            let (t_1, i_1) = x207
            replace(t_1)(v)(v_p)((i_1 == recpos))
          }, @support.number_list(args)))
        } else {
          @basics.list_mk_comb(op, @lib.map((x208 : @kernel.Term) => separate(f, v, v_p, allrpos, x208), args))
        }
      }
    }
  } else {
    tm
  }
}

///|
/// `generalized_apart_successfully`
pub fn generalized_apart_successfully(x209 : @kernel.Term, x210 : @kernel.Term, x211 : @kernel.Term, x212 : @kernel.Term) -> Bool raise {
  let v = x209
  let v_p = x210
  let tm = x211
  let tm_p = x212
  if (tm_p == v_p) {
    true
  } else {
    if @basics.is_eq(tm) {
      let (tm1, tm2) = @kernel.dest_eq(tm)
      let (tm1_p, tm2_p) = @kernel.dest_eq(tm_p)
      (generalized_apart_successfully(v, v_p, tm1, tm1_p) && generalized_apart_successfully(v, v_p, tm2, tm2_p))
    } else {
      let av = all_variables(tm)
      let av_p = all_variables(tm_p)
      let varsub = @lib.list_combine(av, av_p)
      (@lib.mem((v, v_p), varsub) && @lib.mem(v, av_p))
    }
  }
}

///|
/// `useful_apart_generalization`
pub fn useful_apart_generalization(x213 : @kernel.Term, x214 : @kernel.Term, x215 : @kernel.Term, x216 : @kernel.Term) -> Bool raise {
  let v = x213
  let v_p = x214
  let tm = x215
  let gen = x216
  let t217 = all_equations(gen)
  let eqssub = @lib.list_combine(all_equations(tm), t217)
  let eqsok = @lib.forall(fn(x218 : (@kernel.Term, @kernel.Term)) -> Bool raise {
    let (x, y) = x218
    ((x == y) || generalized_apart_successfully(v, v_p, x, y))
  }, eqssub)
  let countercheck = try {
    @counterexample.counter_check(5L, gen)
  } catch {
    Failure(s) => {
      @lib.warn(true, ("Could not generate counter example: " + s))
      true
    }
    e => raise e
  }
  (eqsok && (generalized_apart_successfully(v, v_p, tm, gen) && countercheck))
}

///|
/// `generalize_apart`
pub fn generalize_apart(x219 : @kernel.Term) -> ((@kernel.Term, @list.List[(@kernel.Term, @kernel.Term)])) raise {
  let tm = x219
  let is_fun : (@kernel.Term) -> Bool raise = fn(x220 : @kernel.Term) -> Bool raise {
    let tm_1 = x220
    try {
      let t226 = @environment.defs_names(())
      @lib.mem((fn(x224 : (@kernel.Term, @list.List[@kernel.Term])) -> String raise {
        (fn(x222 : @kernel.Term) -> String raise {
          (fn(x221 : (String, @kernel.HolType)) -> String raise {
            x221.0
          })(@kernel.dest_const(x222))
        })((fn(x223 : (@kernel.Term, @list.List[@kernel.Term])) -> @kernel.Term raise {
          x223.0
        })(x224))
      })((fn(x225 : @kernel.Term) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
        @basics.strip_comb(x225)
      })(tm_1)), t226)
    } catch {
      Failure(_) => false
      e => raise e
    }
  }
  let fs = @support.find_bm_terms(is_fun, tm)
  let dfs = @lib.map(fn(x227 : @kernel.Term) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
    @basics.strip_comb(x227)
  }, fs)
  let find_f : ((@kernel.Term, @list.List[@kernel.Term])) -> ((@list.List[(@kernel.Term, @list.List[@kernel.Term])]) -> Bool raise) raise = fn(x228 : (@kernel.Term, @list.List[@kernel.Term])) -> ((@list.List[(@kernel.Term, @list.List[@kernel.Term])]) -> Bool raise) raise {
    let (op, args) = x228
    fn(x229 : @list.List[(@kernel.Term, @list.List[@kernel.Term])]) -> Bool raise {
      let dfs_1 = x229
      let r = get_rec_pos_of_fun(op)
      let arg_filter : (@list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> Bool raise) raise = fn(x230 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> Bool raise) raise {
        let args_1 = x230
        fn(x231 : @list.List[@kernel.Term]) -> Bool raise {
          let args_p = x231
          let v = @lib.el(@lib.int63_to_int(@lib.sub63(r, 1L)), args_1)
          (@kernel.is_var(v) && @lib.mem(v, @support.remove_el(r, args_p).1))
        }
      }
      let match_filter : ((@kernel.Term, @list.List[@kernel.Term])) -> Bool raise = fn(x232 : (@kernel.Term, @list.List[@kernel.Term])) -> Bool raise {
        let (op_p, args_p_1) = x232
        ((op_p == op) && arg_filter(args)(args_p_1))
      }
      @lib.can((x233 : @list.List[(@kernel.Term, @list.List[@kernel.Term])]) => @lib.find(match_filter, x233), dfs_1)
    }
  }
  let (f, args_3) = try {
    @lib.find(fn(x234 : (@kernel.Term, @list.List[@kernel.Term])) -> Bool raise {
      let (op_1, args_2) = x234
      find_f((op_1, args_2))(dfs)
    }, dfs)
  } catch {
    Failure(_) => raise Failure("")
    e => raise e
  }
  let v_1 = @lib.el(@lib.int63_to_int(@lib.sub63(get_rec_pos_of_fun(f), 1L)), args_3)
  let t235 = @kernel.type_of(v_1)
  let v_p = distinct_var(@kernel.frees(tm), t235)
  let gen = separate(f, v_1, v_p, false, tm)
  if useful_apart_generalization(v_1, v_p, tm, gen) {
    (gen, @list.List([(v_p, v_1)]))
  } else {
    let pcs = @lib.map(fn(x236 : (@kernel.Term, @list.List[@kernel.Term])) -> @kernel.Term raise {
      x236.0
    }, dfs)
    let restpcs = @lib.subtract(pcs, @list.List([f]))
    let recposs = @lib.map(get_rec_pos_of_fun, restpcs)
    let recpos = try {
      @lib.find(fn(x237 : Int64) -> Bool raise {
        (0L < x237)
      }, recposs)
    } catch {
      Failure(_) => 0L
      e => raise e
    }
    let gen_1 = if @lib.forall(fn(x238 : Int64) -> Bool raise {
      let x = x238
      ((x == 0L) || (x == recpos))
    }, recposs) {
      separate(f, v_1, v_p, true, tm)
    } else {
      raise Failure("not same recpos for all functions")
    }
    if useful_apart_generalization(v_1, v_p, tm, gen_1) {
      (gen_1, @list.List([(v_p, v_1)]))
    } else {
      raise Failure("failed")
    }
  }
}

///|
/// checkgen
fn step_5() -> Unit raise {
  checkgen_c.set(Ref::{ val: true })
}

///|
let checkgen_c : @lib.Cell[Ref[Bool]] = @lib.Cell::new("checkgen")

///|
/// `checkgen`
pub fn checkgen() -> Ref[Bool] {
  checkgen_c.get()
}

///|
/// `generalize_heuristic_aderhold`
pub fn generalize_heuristic_aderhold(x239 : @kernel.Term, x240 : Bool) -> ((@list.List[(@kernel.Term, Bool)], (@list.List[@kernel.Thm]) -> @kernel.Thm raise)) raise {
  let (tm, _ as ind) = (x239, x240)
  if (@lib.mem(tm, @environment.my_gen_terms().val) && checkgen().val) {
    raise Failure("")
  } else {
    try {
      let elim_lemma : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(x241 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        let lemma = x241
        fn(x242 : @kernel.Thm) -> @kernel.Thm raise {
          let th = x242
          let rest = @basics.dest_disj(@kernel.concl(th)).1
          let t243 = @equal.ap_thm(@equal.ap_term(@term_syntax.parse_term("op_bslash_slash"), lemma), rest)
          @kernel.eq_mp(@equal.conv_rule(@equal.rand_conv(@simp.rewr_conv(@rewrite_rules.f_or())), t243), th)
        }
      }
      let (tm_p, subs) = try {
        generalize_apart(tm)
      } catch {
        Failure(_) => (tm, @list.List([]))
        e => raise e
      }
      let (new_ap_vars, gen_ap_terms) = @lib.list_split(subs)
      let (tm_p_p, subs_1) = try {
        generalizecommonsubterms(tm_p)
      } catch {
        Failure(_) => (tm_p, @list.List([]))
        e => raise e
      }
      if (tm == tm_p_p) {
        raise Failure("")
      } else {
        let (new_vars, gen_terms) = @lib.list_split(subs_1)
        let lemmas = @list.List([])
        let countercheck = try {
          @counterexample.counter_check(5L, tm_p_p)
        } catch {
          Failure(s) => {
            @lib.warn(true, ("Could not generate counter example: " + s))
            true
          }
          e => raise e
        }
        if (countercheck == true) {
          let proof : (@kernel.Thm) -> @kernel.Thm raise = fn(x244 : @kernel.Thm) -> @kernel.Thm raise {
            let th_p_p = x244
            let th_p = (fn(x249 : @kernel.Thm) -> @kernel.Thm raise {
              (fn(x247 : @kernel.Thm) -> @kernel.Thm raise {
                ((x245 : @kernel.Thm) => @bool.specl(gen_ap_terms, x245))(((x246 : @kernel.Thm) => @bool.genl(new_ap_vars, x246))(x247))
              })(((x248 : @kernel.Thm) => @bool.specl(gen_terms, x248))(x249))
            })(((x250 : @kernel.Thm) => @bool.genl(new_vars, x250))(th_p_p))
            @lib.rev_itlist(fn(x251 : @kernel.Thm, x252 : @kernel.Thm) -> @kernel.Thm raise {
              let s253 = elim_lemma(x251)
              s253(x252)
            }, lemmas, th_p)
          }
          @waterfall.proof_print_string_l("-> Generalize Heuristic", ())
          {
            @environment.my_gen_terms().val = (@environment.my_gen_terms().val).prepend(tm_p_p)
            ()
          }
          (@list.List([(tm_p_p, ind)]), (x255 : @list.List[@kernel.Thm]) => @waterfall.apply_fproof("generalize_heuristic_aderhold", fn(x254 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
            proof(@lib.hd(x254))
          }, @list.List([tm_p_p]), x255))
        } else {
          raise Failure("Counter example failure!")
        }
      }
    } catch {
      Failure(_) => raise Failure("generalize_heuristic")
      e => raise e
    }
  }
}

///|
/// `generalize_heuristic_ext`
pub fn generalize_heuristic_ext(x256 : @kernel.Term, x257 : Bool) -> ((@list.List[(@kernel.Term, Bool)], (@list.List[@kernel.Thm]) -> @kernel.Thm raise)) raise {
  let (tm, _ as ind) = (x256, x257)
  if (@lib.mem(tm, @environment.my_gen_terms().val) && checkgen().val) {
    raise Failure("")
  } else {
    try {
      let elim_lemma : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = fn(x258 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        let lemma = x258
        fn(x259 : @kernel.Thm) -> @kernel.Thm raise {
          let th = x259
          let rest = @basics.dest_disj(@kernel.concl(th)).1
          let t260 = @equal.ap_thm(@equal.ap_term(@term_syntax.parse_term("op_bslash_slash"), lemma), rest)
          @kernel.eq_mp(@equal.conv_rule(@equal.rand_conv(@simp.rewr_conv(@rewrite_rules.f_or())), t260), th)
        }
      }
      let lemmas = @list.List([])
      let (tm_p, subs) = try {
        generalize_apart(tm)
      } catch {
        Failure(_) => (tm, @list.List([]))
        e => raise e
      }
      let (new_ap_vars, gen_ap_terms) = @lib.list_split(subs)
      let gen_terms = terms_to_be_generalized(tm_p)
      let _ = @lib.check(fn(x261 : @list.List[@kernel.Term]) -> Bool raise {
        let l = x261
        !@list.List::is_empty(l)
      }, gen_ap_terms.concat(gen_terms))
      let t263 = @lib.map(fn(x262 : @kernel.Term) -> @kernel.HolType raise {
        @kernel.type_of(x262)
      }, gen_terms)
      let new_vars = distinct_vars(@kernel.frees(tm_p), t263)
      let tm_p_p = @basics.subst(@support.lcombinep(new_vars, gen_terms), tm_p)
      let countercheck = try {
        @counterexample.counter_check(5L, tm_p_p)
      } catch {
        Failure(_) => {
          @lib.warn(true, "Could not generate counter example!")
          true
        }
        e => raise e
      }
      if (countercheck == true) {
        let proof : (@kernel.Thm) -> @kernel.Thm raise = fn(x264 : @kernel.Thm) -> @kernel.Thm raise {
          let th_p_p = x264
          let th_p = (fn(x269 : @kernel.Thm) -> @kernel.Thm raise {
            (fn(x267 : @kernel.Thm) -> @kernel.Thm raise {
              ((x265 : @kernel.Thm) => @bool.specl(gen_ap_terms, x265))(((x266 : @kernel.Thm) => @bool.genl(new_ap_vars, x266))(x267))
            })(((x268 : @kernel.Thm) => @bool.specl(gen_terms, x268))(x269))
          })(((x270 : @kernel.Thm) => @bool.genl(new_vars, x270))(th_p_p))
          @lib.rev_itlist(fn(x271 : @kernel.Thm, x272 : @kernel.Thm) -> @kernel.Thm raise {
            let s273 = elim_lemma(x271)
            s273(x272)
          }, lemmas, th_p)
        }
        @waterfall.proof_print_string_l("-> Generalize Heuristic", ())
        {
          @environment.my_gen_terms().val = (@environment.my_gen_terms().val).prepend(tm_p_p)
          ()
        }
        (@list.List([(tm_p_p, ind)]), (x275 : @list.List[@kernel.Thm]) => @waterfall.apply_fproof("generalize_heuristic_ext", fn(x274 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
          proof(@lib.hd(x274))
        }, @list.List([tm_p_p]), x275))
      } else {
        raise Failure("Counter example failure!")
      }
    } catch {
      Failure(_) => raise Failure("generalize_heuristic")
      e => raise e
    }
  }
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
}
