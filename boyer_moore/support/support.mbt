// Translated from upstream Boyer_Moore/support.ml; edit this file directly.

///|
/// `SUBST`
pub fn subst(x1 : @list.List[(@kernel.Thm, @kernel.Term)], x2 : @kernel.Term, x3 : @kernel.Thm) -> @kernel.Thm raise {
  let thl = x1
  let pat = x2
  let th = x3
  let (eqs, vs) = @lib.unzip(thl)
  let gvs = @lib.map(fn(x6 : @kernel.Term) -> @kernel.Term raise {
    (fn(x4 : @kernel.HolType) -> @kernel.Term raise {
      @basics.genvar(x4)
    })((fn(x5 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x5)
    })(x6))
  }, vs)
  let gpat = @basics.subst(@lib.zip(gvs, vs), pat)
  let (ls, rs) = @lib.unzip(@lib.map(fn(x8 : @kernel.Thm) -> (@kernel.Term, @kernel.Term) raise {
    @kernel.dest_eq((fn(x7 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x7)
    })(x8))
  }, eqs))
  let ths = @lib.map(fn(x10 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
    @kernel.assume_rule((fn(x9 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      @basics.mk_eq(x9.0, x9.1)
    })(x10))
  }, @lib.zip(gvs, rs))
  let th1 = @kernel.assume_rule(gpat)
  let th2 = @equal.subs(ths, th1)
  let t12 = @bool.disch(gpat, th2)
  let th3 = @lib.itlist(@bool.disch, @lib.map(fn(x11 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x11)
  }, ths), t12)
  let th4 = @kernel.inst_rule(@lib.zip(ls, gvs), th3)
  @bool.mp(@lib.rev_itlist(fn(x15 : @kernel.Thm, x16 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x13 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x14 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.mp(x13, x14)
      }
    })(x16)(x15)
  }, eqs, th4), th)
}

///|
/// `SUBST_CONV`
pub fn subst_conv(x17 : @list.List[(@kernel.Thm, @kernel.Term)], x18 : @kernel.Term, x19 : @kernel.Term) -> @kernel.Thm raise {
  let thvars = x17
  let template = x18
  let tm = x19
  let (thms, vars) = @lib.unzip(thvars)
  let gvs = @lib.map(fn(x22 : @kernel.Term) -> @kernel.Term raise {
    (fn(x20 : @kernel.HolType) -> @kernel.Term raise {
      @basics.genvar(x20)
    })((fn(x21 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x21)
    })(x22))
  }, vars)
  let gtemplate = @basics.subst(@lib.zip(gvs, vars), template)
  let t23 = @kernel.refl(tm)
  let t24 = @basics.mk_eq(template, gtemplate)
  subst(@lib.zip(thms, gvs), t24, t23)
}

///|
/// CONTRAPOS
fn step_1() -> Unit raise {
  let a = @term_syntax.parse_term("(a : Bool)")
  let b = @term_syntax.parse_term("(b : Bool)")
  let pth = @itab.itaut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) → !b → !a"))
  contrapos_c.set(fn(x25 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x25
    try {
      let (p, q) = @basics.dest_imp(@kernel.concl(th))
      @bool.mp(@kernel.inst_rule(@list.List([(p, a), (q, b)]), pth), th)
    } catch {
      Failure(_) => raise Failure("CONTRAPOS")
      e => raise e
    }
  })
}

///|
let contrapos_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("CONTRAPOS")

///|
/// `CONTRAPOS`
pub fn contrapos(x : @kernel.Thm) -> @kernel.Thm raise {
  (contrapos_c.get())(x)
}

///|
/// NOT_EQ_SYM
fn step_2() -> Unit raise {
  let t27 = contrapos(@bool.disch_all(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("(a : A) == (b : A)")))))
  let t26 = @term_syntax.parse_term("(b : A)")
  let pth = @bool.genl(@list.List([@term_syntax.parse_term("(a : A)"), t26]), t27)
  let aty = @term_syntax.parse_type("A")
  not_eq_sym_c.set(fn(x28 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x28
    try {
      let (l, r) = @kernel.dest_eq(@basics.dest_neg(@kernel.concl(th)))
      @bool.mp(@bool.specl(@list.List([r, l]), @kernel.inst_type(@list.List([(@kernel.type_of(l), aty)]), pth)), th)
    } catch {
      Failure(_) => raise Failure("NOT_EQ_SYM")
      e => raise e
    }
  })
}

///|
let not_eq_sym_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("NOT_EQ_SYM")

///|
/// `NOT_EQ_SYM`
pub fn not_eq_sym(x : @kernel.Thm) -> @kernel.Thm raise {
  (not_eq_sym_c.get())(x)
}

///|
/// `hash`
pub fn[TA, TB, TC, TD] hash(x29 : (TC) -> TA raise, x30 : (TD) -> TB raise, x31 : (TC, TD)) -> ((TA, TB)) raise {
  let f = x29
  let g = x30
  let (x, y) = x31
  let t32 = g(y)
  (f(x), t32)
}

///|
/// `hashI`
pub fn[TA, TB, TC] hashi(x33 : (TC) -> TA raise, x34 : (TC, TB)) -> ((TA, TB)) raise {
  let f = x33
  let (x, y) = x34
  hash(f, fn(x35 : TB) -> TB raise {
    x35
  }, (x, y))
}

///|
/// `fst3`
pub fn[TA, TB, TC] fst3(x36 : TA, x37 : TB, x38 : TC) -> TA raise {
  let (x, _, _) = (x36, x37, x38)
  x
}

///|
/// `snd3`
pub fn[TA, TB, TC] snd3(x39 : TB, x40 : TA, x41 : TC) -> TA raise {
  let (_, x, _) = (x39, x40, x41)
  x
}

///|
/// `thd3`
pub fn[TA, TB, TC] thd3(x42 : TB, x43 : TC, x44 : TA) -> TA raise {
  let (_, _, x) = (x42, x43, x44)
  x
}

///|
/// `lcombinep`
pub fn[TA, TB] lcombinep(x45 : @list.List[TA], x46 : @list.List[TB]) -> @list.List[(TA, TB)] raise {
  let (x, y) = (x45, x46)
  @lib.list_combine(x, y)
}

///|
/// `lcount`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] lcount(x47 : TA, x48 : @list.List[TA]) -> Int64 raise {
  let x = x47
  let l = x48
  Int::to_int64(@lib.length(@lib.filter(fn(x49 : TA) -> Bool raise {
    (x == x49)
  }, l)))
}

///|
/// `list_mk_imp`
pub fn list_mk_imp(x50 : @list.List[@kernel.Term], x51 : @kernel.Term) -> @kernel.Term raise {
  let (tms, tm) = (x50, x51)
  if @list.List::is_empty(tms) {
    tm
  } else {
    try {
      @lib.itlist(fn(x52 : @kernel.Term, x53 : @kernel.Term) -> @kernel.Term raise {
        let p = x52
        let q = x53
        @bool.mk_imp(p, q)
      }, tms, tm)
    } catch {
      Failure(_) => raise Failure("list_mk_imp")
      e => raise e
    }
  }
}

///|
/// `INDUCT_TAC_`
pub fn induct_tac_(x54 : @kernel.Thm) -> @tactics.Tactic raise {
  let thm = x54
  let t56 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.disch_tac)])
  @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(thm), @tactics.conj_tac), t56)
}

///|
/// `distinct`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] distinct(x57 : @list.List[TA]) -> Bool raise {
  let x = x57
  if @list.List::is_empty(x) {
    true
  } else {
    let t58 = @lib.tl(x)
    (!@lib.mem(@lib.hd(x), t58) && distinct(@lib.tl(x)))
  }
}

///|
/// is_T
fn step_3() -> Unit raise {
  let t = @term_syntax.parse_term("true")
  is_t_c.set(fn(x59 : @kernel.Term) -> Bool raise {
    let tm = x59
    (tm == t)
  })
}

///|
let is_t_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_T")

///|
/// `is_T`
pub fn is_t(x : @kernel.Term) -> Bool raise {
  (is_t_c.get())(x)
}

///|
/// is_F
fn step_4() -> Unit raise {
  let f = @term_syntax.parse_term("false")
  is_f_c.set(fn(x60 : @kernel.Term) -> Bool raise {
    let tm_1 = x60
    (tm_1 == f)
  })
}

///|
let is_f_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new("is_F")

///|
/// `is_F`
pub fn is_f(x : @kernel.Term) -> Bool raise {
  (is_f_c.get())(x)
}

///|
/// `conj_list`
pub fn conj_list_v1(x61 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let tm = x61
  try {
    let (tm1, tm2) = @basics.dest_conj(tm)
    conj_list_v1(tm2).prepend(tm1)
  } catch {
    Failure(_) => @list.List([tm])
    e => raise e
  }
}

///|
/// `disj_list`
pub fn disj_list_v1(x62 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let tm = x62
  try {
    let (tm1, tm2) = @basics.dest_disj(tm)
    disj_list_v1(tm2).prepend(tm1)
  } catch {
    Failure(_) => @list.List([tm])
    e => raise e
  }
}

///|
/// `number_list`
pub fn[TA] number_list(x63 : @list.List[TA]) -> @list.List[(TA, Int64)] raise {
  let l = x63
  number_list_p_l(1L, l)
}

///|
fn[TB] number_list_p_l(x64 : Int64, x65 : @list.List[TB]) -> @list.List[(TB, Int64)] raise {
  let n = x64
  let l_1 = x65
  if @list.List::is_empty(l_1) {
    @list.List([])
  } else {
    let t66 = @lib.tl(l_1)
    let t67 = number_list_p_l(@lib.add63(n, 1L), t66)
    t67.prepend((@lib.hd(l_1), n))
  }
}

///|
/// `insert_on_snd`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] insert_on_snd(x68 : (TA, TB), x69 : @list.List[(TA, TB)]) -> @list.List[(TA, TB)] raise {
  let (x, n) = x68
  let l = x69
  if @list.List::is_empty(l) {
    @list.List([(x, n)])
  } else {
    let h = @lib.hd(l)
    if (@lib.compare(n, h.1) < 0) {
      l.prepend((x, n))
    } else {
      insert_on_snd((x, n), @lib.tl(l)).prepend(h)
    }
  }
}

///|
/// `sort_on_snd`
pub fn[TA, TB : Eq + @lib.OCompare + @lib.OHash] sort_on_snd(x70 : @list.List[(TA, TB)]) -> @list.List[(TA, TB)] raise {
  let l = x70
  if @list.List::is_empty(l) {
    @list.List([])
  } else {
    let t71 = sort_on_snd(@lib.tl(l))
    insert_on_snd(@lib.hd(l), t71)
  }
}

///|
/// `conj_list`
pub fn conj_list(x72 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let tm = x72
  try {
    let (tm1, tm2) = @basics.dest_conj(tm)
    conj_list(tm2).prepend(tm1)
  } catch {
    Failure(_) => @list.List([tm])
    e => raise e
  }
}

///|
/// `disj_list`
pub fn disj_list(x73 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let tm = x73
  try {
    let (tm1, tm2) = @basics.dest_disj(tm)
    disj_list(tm2).prepend(tm1)
  } catch {
    Failure(_) => @list.List([tm])
    e => raise e
  }
}

///|
/// `find_bm_terms`
pub fn find_bm_terms(x74 : (@kernel.Term) -> Bool raise, x75 : @kernel.Term) -> @list.List[@kernel.Term] raise {
  let p = x74
  let tm = x75
  try {
    fn accum(x76 : @list.List[@kernel.Term], x77 : (@kernel.Term) -> Bool raise, x78 : @kernel.Term) -> @list.List[@kernel.Term] raise {
      let tml = x76
      let p_1 = x77
      let tm_1 = x78
      let tml_p = if p_1(tm_1) {
        tml.prepend(tm_1)
      } else {
        tml
      }
      let args = @basics.strip_comb(tm_1).1
      try {
        @lib.rev_itlist(fn(x79 : @kernel.Term, x80 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
          let tm_2 = x79
          let tml_1 = x80
          accum(tml_1, p_1, tm_2)
        }, args, tml_p)
      } catch {
        Failure(_) => tml_p
        e => raise e
      }
    }
    accum(@list.List([]), p, tm)
  } catch {
    Failure(_) => raise Failure("find_bm_terms")
    e => raise e
  }
}

///|
/// `remove_el`
pub fn[TA] remove_el(x81 : Int64, x82 : @list.List[TA]) -> ((TA, @list.List[TA])) raise {
  let n = x81
  let l = x82
  if (@list.List::is_empty(l) || (n < 1L)) {
    raise Failure("remove_el")
  } else {
    if (n == 1L) {
      let t83 = @lib.tl(l)
      (@lib.hd(l), t83)
    } else {
      let t84 = @lib.tl(l)
      let (x, l_p) = remove_el(@lib.sub63(n, 1L), t84)
      (x, l_p.prepend(@lib.hd(l)))
    }
  }
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
}
