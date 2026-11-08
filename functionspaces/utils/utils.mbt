// Translated from upstream Functionspaces/utils.ml; edit this file directly.

///|
/// EQ_TO_IMP
fn step_1() -> Unit raise {
  eq_to_imp_c.set(@class.taut(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (P == Q) == ((P → Q) && (Q → P))")))
}

///|
let eq_to_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_TO_IMP")

///|
/// `EQ_TO_IMP`
pub fn eq_to_imp() -> @kernel.Thm {
  eq_to_imp_c.get()
}

///|
/// EQ_NOT
fn step_2() -> Unit raise {
  eq_not_c.set(@class.taut(@term_syntax.parse_term("∀ P : Bool, ∀ Q : Bool, (!P == !Q) == (P == Q)")))
}

///|
let eq_not_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_NOT")

///|
/// `EQ_NOT`
pub fn eq_not() -> @kernel.Thm {
  eq_not_c.get()
}

///|
/// LET_DEFS
fn step_3() -> Unit raise {
  let_defs_c.set(@bool.conj(@pair.let_def(), @pair.let_end_def()))
}

///|
let let_defs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LET_DEFS")

///|
/// `LET_DEFS`
pub fn let_defs() -> @kernel.Thm {
  let_defs_c.get()
}

///|
/// COMPLEX_FIELD
fn step_4() -> Unit raise {
  complex_field_c.set((x1 : String) => @complexes.complex_field(@term_syntax.parse_term(x1)))
}

///|
let complex_field_c : @lib.Cell[(String) -> @kernel.Thm raise] = @lib.Cell::new("COMPLEX_FIELD")

///|
/// `COMPLEX_FIELD`
pub fn complex_field(x : String) -> @kernel.Thm raise {
  (complex_field_c.get())(x)
}

///|
/// SIMPLE_COMPLEX_ARITH
fn step_5() -> Unit raise {
  simple_complex_arith_c.set((x2 : String) => @complexes.simple_complex_arith(@term_syntax.parse_term(x2)))
}

///|
let simple_complex_arith_c : @lib.Cell[(String) -> @kernel.Thm raise] = @lib.Cell::new("SIMPLE_COMPLEX_ARITH")

///|
/// `SIMPLE_COMPLEX_ARITH`
pub fn simple_complex_arith(x : String) -> @kernel.Thm raise {
  (simple_complex_arith_c.get())(x)
}

///|
/// `HINT_EXISTS_TAC`
pub fn hint_exists_tac(x3 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let (hs, c) as g = x3
  let hs_1 = @lib.map(fn(x4 : (String, @kernel.Thm)) -> @kernel.Thm raise {
    x4.1
  }, hs)
  let (v, c_p) = @basics.dest_exists(c)
  let (vs, c_p_1) = @basics.strip_exists(c_p)
  let hyp_match : (@kernel.Term) -> ((@kernel.Thm) -> ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @kernel.Thm) raise) raise = fn(x5 : @kernel.Term) -> ((@kernel.Thm) -> ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @kernel.Thm) raise) raise {
    let c_1 = x5
    fn(x6 : @kernel.Thm) -> ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @kernel.Thm) raise {
      let h = x6
      ignore(@lib.check(fn(x14 : @kernel.Term) -> Bool raise {
        (fn(x12 : @list.List[@kernel.Term]) -> Bool raise {
          (fn(x7 : Bool) -> Bool raise {
            !x7
          })(((x11 : @list.List[@kernel.Term]) => @lib.exists(fn(x10 : @kernel.Term) -> Bool raise {
            (fn(x8 : @kernel.Term) -> ((@list.List[@kernel.Term]) -> Bool raise) raise {
              fn(x9 : @list.List[@kernel.Term]) -> Bool raise {
                @lib.mem(x8, x9)
              }
            })(x10)(vs)
          }, x11))(x12))
        })((fn(x13 : @kernel.Term) -> @list.List[@kernel.Term] raise {
          @kernel.frees(x13)
        })(x14))
      }, c_1))
      let t15 = @kernel.concl(h)
      (@drule.term_match(@lib.subtract(@kernel.frees(c_1), @list.List([v])), c_1, t15), h)
    }
  }
  let ((_, subs, _), h_1) = @lib.tryfind(fn(x19 : @kernel.Term) -> ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @kernel.Thm) raise {
    (fn(x18 : (@kernel.Thm) -> ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @kernel.Thm) raise) -> ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @kernel.Thm) raise {
      (fn(x16 : (@kernel.Thm) -> ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @kernel.Thm) raise) -> ((@list.List[@kernel.Thm]) -> ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @kernel.Thm) raise) raise {
        fn(x17 : @list.List[@kernel.Thm]) -> ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @kernel.Thm) raise {
          @lib.tryfind(x16, x17)
        }
      })(x18)(hs_1)
    })(hyp_match(x19))
  }, @basics.binops(@term_syntax.parse_term("op_slash_bslash"), c_p_1))
  let witness = match subs {
    Empty => v
    More((t, u), tail=Empty) if (u == v) => t
    _ => raise Failure("HINT_EXISTS_TAC not applicable")
  }
  let t20 = @simp.rewrite_tac(hs_1)
  @tactics.then_tac(@tactics.exists_tac(witness), t20)(g)
}

///|
/// `GEN_PURE_MP_REWR_TAC`
pub fn gen_pure_mp_rewr_tac(x21 : (@kernel.Term) -> @kernel.Term raise, x22 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise {
  let sel = x21
  let th = x22
  let concl : (@kernel.Term) -> @kernel.Term raise = fn(x25 : @kernel.Term) -> @kernel.Term raise {
    (fn(x24 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      x24.1
    })(@basics.dest_imp(x25))
  }
  let body : (@kernel.Term) -> @kernel.Term raise = fn(x29 : @kernel.Term) -> @kernel.Term raise {
    (fn(x28 : @kernel.Term) -> @kernel.Term raise {
      (fn(x26 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
        x26.1
      })((fn(x27 : @kernel.Term) -> (@list.List[@kernel.Term], @kernel.Term) raise {
        @basics.strip_forall(x27)
      })(x28))
    })(concl(x29))
  }
  let part_match : (@kernel.Term) -> @kernel.Thm raise = try {
    @drule.part_match(fn(x30 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhs(body(x30))
    }, th)
  } catch {
    _ => {
      let f1 : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(concl, th)
      let f2 : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(body, th)
      fn(x31 : @kernel.Term) -> @kernel.Thm raise {
        let t = x31
        try {
          f1(t)
        } catch {
          _ => f2(t)
        }
      }
    }
  }
  fn(x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (_, c) as g = x32
    let th_1 = Ref::{ val: @bool.truth() }
    let match_term : (@kernel.Term) -> Bool raise = fn(x33 : @kernel.Term) -> Bool raise {
      let t_1 = x33
      try {
        {
          th_1.val = part_match(t_1)
          ()
        }
        true
      } catch {
        _ => false
      }
    }
    ignore(@basics.find_term(match_term, sel(c)))
    let (_, big_th) = @bool.eq_imp_rule(@simp.once_rewrite_conv(@list.List([@bool.undisch(@bool.spec_all(th_1.val))]))(c))
    let t34 = @simp.once_rewrite_rule(@list.List([@theorems.imp_imp()]))
    let mp_th = (fn(x35 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.gen_all(t34(x35))
    })(@bool.disch_all(big_th))
    @tactics.match_mp_tac(mp_th)(g)
  }
}

///|
/// PURE_MP_REWR_TAC
fn step_6() -> Unit raise {
  pure_mp_rewr_tac_c.set((x37 : @kernel.Thm) => gen_pure_mp_rewr_tac(fn(x36 : @kernel.Term) -> @kernel.Term raise {
    x36
  }, x37))
}

///|
let pure_mp_rewr_tac_c : @lib.Cell[(@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise] = @lib.Cell::new("PURE_MP_REWR_TAC")

///|
/// `PURE_MP_REWR_TAC`
pub fn pure_mp_rewr_tac(x : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise {
  (pure_mp_rewr_tac_c.get())(x)
}

///|
/// `GEN_MP_REWR_TAC`
pub fn gen_mp_rewr_tac(x38 : (@kernel.Term) -> @kernel.Term raise, x39 : @kernel.Thm) -> @tactics.Tactic raise {
  let s = x38
  let x = x39
  let t42 = @simp.asm_rewrite_tac(@list.List([]))
  let t41 = @tactics.try_tac(hint_exists_tac)
  @tactics.then_tac(@tactics.then_tac(gen_pure_mp_rewr_tac(s, x), t41), t42)
}

///|
/// MP_REWR_TAC
fn step_7() -> Unit raise {
  mp_rewr_tac_c.set((x44 : @kernel.Thm) => gen_mp_rewr_tac(fn(x43 : @kernel.Term) -> @kernel.Term raise {
    x43
  }, x44))
}

///|
let mp_rewr_tac_c : @lib.Cell[(@kernel.Thm) -> @tactics.Tactic raise] = @lib.Cell::new("MP_REWR_TAC")

///|
/// `MP_REWR_TAC`
pub fn mp_rewr_tac(x : @kernel.Thm) -> @tactics.Tactic raise {
  (mp_rewr_tac_c.get())(x)
}

///|
/// MP_REWRITE_TAC
fn step_8() -> Unit raise {
  mp_rewrite_tac_c.set((x45 : @list.List[@kernel.Thm]) => @tactics.map_every(mp_rewr_tac, x45))
}

///|
let mp_rewrite_tac_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("MP_REWRITE_TAC")

///|
/// `MP_REWRITE_TAC`
pub fn mp_rewrite_tac(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (mp_rewrite_tac_c.get())(x)
}

///|
/// `CASES_REWRITE_TAC`
pub fn cases_rewrite_tac(x46 : @kernel.Thm, x47 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  let th = x46
  let (_, c) as g = x47
  let concl : (@kernel.Term) -> @kernel.Term raise = fn(x49 : @kernel.Term) -> @kernel.Term raise {
    (fn(x48 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      x48.1
    })(@basics.dest_imp(x49))
  }
  let body : (@kernel.Term) -> @kernel.Term raise = fn(x53 : @kernel.Term) -> @kernel.Term raise {
    (fn(x52 : @kernel.Term) -> @kernel.Term raise {
      (fn(x50 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
        x50.1
      })((fn(x51 : @kernel.Term) -> (@list.List[@kernel.Term], @kernel.Term) raise {
        @basics.strip_forall(x51)
      })(x52))
    })(concl(x53))
  }
  let part_match : (@kernel.Term) -> @kernel.Thm raise = try {
    @drule.part_match(fn(x54 : @kernel.Term) -> @kernel.Term raise {
      @equal.lhs(body(x54))
    }, th)
  } catch {
    _ => {
      let f1 : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(concl, th)
      let f2 : (@kernel.Term) -> @kernel.Thm raise = @drule.part_match(body, th)
      fn(x55 : @kernel.Term) -> @kernel.Thm raise {
        let t = x55
        try {
          f1(t)
        } catch {
          _ => f2(t)
        }
      }
    }
  }
  let th_1 = Ref::{ val: @bool.truth() }
  ignore(@basics.find_term(fn(x56 : @kernel.Term) -> Bool raise {
    let t_1 = x56
    try {
      {
        th_1.val = part_match(t_1)
        ()
      }
      true
    } catch {
      _ => false
    }
  }, c))
  let t63 = @simp.rewrite_rule(@list.List([@class.not_clauses()]))
  let t65 = @tactics.pop_assum(fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s61 = @tactics.assume_tac(x60)
      fn(x62 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s61(x62)
      }
    })(t63(x64))
  })
  let t66 = @list.List([@tactics.pop_assum(fn(x57 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let x = x57
    let t59 = @tactics.assume_tac(x)
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@bool.mp(th_1.val, x)])), t59)
  }), t65])
  @tactics.thenl(@class.asm_cases_tac(@equal.lhand(@kernel.concl(th_1.val))), t66)(g)
}

///|
/// `wrap`
pub fn[TA, TB] wrap(x67 : (@list.List[TB]) -> TA raise, x68 : TB) -> TA raise {
  let f = x67
  let x = x68
  f(@list.List([x]))
}

///|
/// `CONJS`
pub fn conjs(x69 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let xs = x69
  @lib.end_itlist(@bool.conj, xs)
}

///|
/// `simp_horn_conv`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] simp_horn_conv(x : @list.List[(@list.List[TA], @list.List[TA])]) -> @list.List[(@list.List[TA], @list.List[TA])] raise {
  let f : (@list.List[(@list.List[TA], @list.List[TA])]) -> @list.List[(@list.List[TA], @list.List[TA])] raise = simp_horn_conv_rec_l
  f(x)
}

///|
fn[TB, TC] fact_l(x70 : @list.List[TC], x71 : TB) -> TB raise {
  let (x, y) = (x70, x71)
  if @list.List::is_empty(x) {
    y
  } else {
    @lib.failure()
  }
}

///|
fn[TD] tl_l(x72 : @list.List[TD]) -> @list.List[TD] raise {
  match x72 {
    Empty => @list.List([])
    More(_, tail=xs) => xs
  }
}

///|
fn[TA : Eq + @lib.OCompare + @lib.OHash] simp_horn_conv_rec_l(x73 : @list.List[(@list.List[TA], @list.List[TA])]) -> @list.List[(@list.List[TA], @list.List[TA])] raise {
  let l = x73
  let fixpoint = Ref::{ val: true }
  let l_p = @lib.rev_itlist(fn(x74 : (@list.List[TA], @list.List[TA]), x75 : (@list.List[(@list.List[TA], @list.List[TA])], @list.List[(@list.List[TA], @list.List[TA])])) -> (@list.List[(@list.List[TA], @list.List[TA])], @list.List[(@list.List[TA], @list.List[TA])]) raise {
    let (hs, cs) = x74
    let (dones, todos) = x75
    let facts = @lib.flat(@lib.mapfilter(fn(x76 : (@list.List[TA], @list.List[TA])) -> @list.List[TA] raise {
      fact_l(x76.0, x76.1)
    }, dones.concat(todos)))
    let f : (@list.List[TA]) -> @list.List[TA] raise = (x82 : @list.List[TA]) => @lib.filter(fn(x81 : TA) -> Bool raise {
      (fn(x77 : Bool) -> Bool raise {
        !x77
      })((fn(x80 : TA) -> Bool raise {
        (fn(x78 : TA) -> ((@list.List[TA]) -> Bool raise) raise {
          fn(x79 : @list.List[TA]) -> Bool raise {
            @lib.mem(x78, x79)
          }
        })(x80)(facts)
      })(x81))
    }, x82)
    let hs_p = f(hs)
    let cs_p = @lib.filter(fn(x87 : TA) -> Bool raise {
      (fn(x83 : Bool) -> Bool raise {
        !x83
      })((fn(x86 : TA) -> Bool raise {
        (fn(x84 : TA) -> ((@list.List[TA]) -> Bool raise) raise {
          fn(x85 : @list.List[TA]) -> Bool raise {
            @lib.mem(x84, x85)
          }
        })(x86)(hs_p)
      })(x87))
    }, f(cs))
    if (!((hs_p == hs)) || !((cs_p == cs))) {
      {
        fixpoint.val = false
        ()
      }
    } else {
      ()
    }
    if (@list.List::is_empty(cs_p) && !@list.List::is_empty(cs)) {
      (dones, tl_l(todos))
    } else {
      (dones.prepend((hs_p, cs_p)), tl_l(todos))
    }
  }, l, (@list.List([]), tl_l(l)))
  if fixpoint.val {
    l
  } else {
    simp_horn_conv_rec_l(l_p.0)
  }
}

///|
/// horns_of_term
fn step_9() -> Unit raise {
  let t88 = @term_syntax.parse_term("op_slash_bslash")
  let strip_conj : (@kernel.Term) -> @list.List[@kernel.Term] raise = fn(x90 : @kernel.Term) -> @list.List[@kernel.Term] raise {
    ((x89 : @kernel.Term) => @basics.binops(t88, x89))(x90)
  }
  horns_of_term_c.set(fn(x91 : @kernel.Term) -> @list.List[(@list.List[@kernel.Term], @list.List[@kernel.Term])] raise {
    let t = x91
    @lib.map(fn(x92 : @kernel.Term) -> (@list.List[@kernel.Term], @list.List[@kernel.Term]) raise {
      let t_1 = x92
      try {
        let (h, c) = @basics.dest_imp(t_1)
        let t93 = strip_conj(c)
        (strip_conj(h), t93)
      } catch {
        _ => (@list.List([]), @list.List([t_1]))
      }
    }, strip_conj(t))
  })
}

///|
let horns_of_term_c : @lib.Cell[(@kernel.Term) -> @list.List[(@list.List[@kernel.Term], @list.List[@kernel.Term])] raise] = @lib.Cell::new("horns_of_term")

///|
/// `horns_of_term`
pub fn horns_of_term(x : @kernel.Term) -> @list.List[(@list.List[@kernel.Term], @list.List[@kernel.Term])] raise {
  (horns_of_term_c.get())(x)
}

///|
/// term_of_horns
fn step_10() -> Unit raise {
  let term_of_horn : ((@list.List[@kernel.Term], @list.List[@kernel.Term])) -> @kernel.Term raise = fn(x94 : (@list.List[@kernel.Term], @list.List[@kernel.Term])) -> @kernel.Term raise {
    match x94 {
      (Empty, cs) => @bool.list_mk_conj(cs)
      (_, Empty) => @term_syntax.parse_term("true")
      (hs, cs_1) => {
        let t95 = @bool.list_mk_conj(cs_1)
        @bool.mk_imp(@bool.list_mk_conj(hs), t95)
      }
    }
  }
  term_of_horns_c.set(fn(x97 : @list.List[(@list.List[@kernel.Term], @list.List[@kernel.Term])]) -> @kernel.Term raise {
    @bool.list_mk_conj(((x96 : @list.List[(@list.List[@kernel.Term], @list.List[@kernel.Term])]) => @lib.map(term_of_horn, x96))(x97))
  })
}

///|
let term_of_horns_c : @lib.Cell[(@list.List[(@list.List[@kernel.Term], @list.List[@kernel.Term])]) -> @kernel.Term raise] = @lib.Cell::new("term_of_horns")

///|
/// `term_of_horns`
pub fn term_of_horns(x : @list.List[(@list.List[@kernel.Term], @list.List[@kernel.Term])]) -> @kernel.Term raise {
  (term_of_horns_c.get())(x)
}

///|
/// `SIMP_HORN_CONV`
pub fn simp_horn_conv_v1(x98 : @kernel.Term) -> @kernel.Thm raise {
  let t = x98
  @class.taut(@basics.mk_eq(t, (fn(x99 : @list.List[(@list.List[@kernel.Term], @list.List[@kernel.Term])]) -> @kernel.Term raise {
    term_of_horns(simp_horn_conv(x99))
  })(horns_of_term(t))))
}

///|
/// SIMP_HORN_TAC
fn step_11() -> Unit raise {
  simp_horn_tac_c.set(@tactics.assum_list(fn(x100 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let xs = x100
    let t105 = @simp.rewrite_tac(xs)
    let t104 = @tactics.conv_tac(@equal.top_depth_conv(@equal.changed_conv(simp_horn_conv_v1)))
    @tactics.then_tac(@tactics.then_tac(@tactics.try_tac(fn(x102 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      let g = x102
      let t103 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
      @tactics.then_tac(@tactics.mp_tac(conjs(xs)), t103)(g)
    }), t104), t105)
  }))
}

///|
let simp_horn_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("SIMP_HORN_TAC")

///|
/// `SIMP_HORN_TAC`
pub fn simp_horn_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (simp_horn_tac_c.get())(x)
}

///|
/// `fixpoint`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] fixpoint(x106 : (TA) -> TA raise, x107 : TA) -> TA raise {
  let f = x106
  let x = x107
  let y = f(x)
  if (y == x) {
    y
  } else {
    fixpoint(f, y)
  }
}

///|
/// gimp_imp
fn step_12() -> Unit raise {
  fn self_(x108 : @list.List[@kernel.Term], x109 : @list.List[@kernel.Term], x110 : @kernel.Term) -> @kernel.Term raise {
    let vars = x108
    let premisses = x109
    let t = x110
    try {
      let (v, b) = @basics.dest_forall(t)
      self_(vars.prepend(v), premisses, b)
    } catch {
      _ => {
        try {
          let (p, c) = @basics.dest_imp(t)
          self_(vars, premisses.prepend(p), c)
        } catch {
          _ => {
            let body = match premisses {
              Empty => t
              More(_, tail=_) => @bool.mk_imp(@bool.list_mk_conj(@lib.rev(premisses)), t)
            }
            @bool.list_mk_forall(@lib.rev(vars), body)
          }
        }
      }
    }
  }
  gimp_imp_c.set((x111 : @kernel.Term) => self_(@list.List([]), @list.List([]), x111))
}

///|
let gimp_imp_c : @lib.Cell[(@kernel.Term) -> @kernel.Term raise] = @lib.Cell::new("gimp_imp")

///|
/// `gimp_imp`
pub fn gimp_imp(x : @kernel.Term) -> @kernel.Term raise {
  (gimp_imp_c.get())(x)
}

///|
/// `GIMP_IMP_CONV`
pub fn gimp_imp_conv(x112 : @kernel.Term) -> @kernel.Thm raise {
  let t = x112
  @meson.meson(@list.List([]), @basics.mk_eq(t, gimp_imp(t)))
}

///|
/// GIMP_IMP
fn step_13() -> Unit raise {
  gimp_imp_v1_c.set((x113 : @kernel.Thm) => @equal.conv_rule(gimp_imp_conv, x113))
}

///|
let gimp_imp_v1_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("GIMP_IMP")

///|
/// `GIMP_IMP`
pub fn gimp_imp_v1(x : @kernel.Thm) -> @kernel.Thm raise {
  (gimp_imp_v1_c.get())(x)
}

///|
/// `MATCH_TRANS`
pub fn match_trans(x114 : @kernel.Thm, x115 : @kernel.Thm) -> @kernel.Thm raise {
  let thm1 = x114
  let thm2 = x115
  let t116 = @bool.undisch(@bool.spec_all(thm1))
  @bool.gen_all(@bool.disch_all(@drule.match_mp(thm2)(t116)))
}

///|
/// GCONV_TAC
fn step_14() -> Unit raise {
  gconv_tac_c.set(fn(x127 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x123 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x117 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s118 = @tactics.conv_tac(x117)
        fn(x119 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s118(x119)
        }
      })((fn(x120 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s121 = @equal.depth_conv(x120)
        fn(x122 : @kernel.Term) -> @kernel.Thm raise {
          s121(x122)
        }
      })(x123))
    })((fn(x124 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s125 = @equal.changed_conv(x124)
      fn(x126 : @kernel.Term) -> @kernel.Thm raise {
        s125(x126)
      }
    })(x127))
  })
}

///|
let gconv_tac_c : @lib.Cell[(@equal.Conv) -> @tactics.Tactic raise] = @lib.Cell::new("GCONV_TAC")

///|
/// `GCONV_TAC`
pub fn gconv_tac(x : @equal.Conv) -> @tactics.Tactic raise {
  (gconv_tac_c.get())(x)
}

///|
/// `LET_RULE`
pub fn let_rule(x128 : @kernel.Thm) -> @kernel.Thm raise {
  let thm = x128
  @simp.rewrite_rule(@list.List([@pair.let_def(), @pair.let_end_def()]))(thm)
}

///|
/// `LET_RULE_L`
pub fn let_rule_l(x129 : @list.List[@kernel.Thm], x130 : @kernel.Thm) -> @kernel.Thm raise {
  let l = x129
  let thm = x130
  @simp.rewrite_rule((@list.List([@pair.let_def(), @pair.let_end_def()])).concat(l))(thm)
}

///|
/// `SPEC_V`
pub fn spec_v(x131 : (String, String), x132 : @kernel.Thm) -> @kernel.Thm raise {
  let (x, v) = x131
  let thm = x132
  (fn(x135 : @kernel.Thm) -> @kernel.Thm raise {
    ((x133 : @kernel.Thm) => @q.spec(v, x133))(((x134 : @kernel.Thm) => @q.gen(x, x134))(x135))
  })(@bool.spec_all(thm))
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
}
