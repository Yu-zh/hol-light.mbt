// Translated from upstream class.ml; edit this file directly.

///|
/// ETA_AX
fn step_1() -> Unit raise {
  eta_ax_c.set(@kernel.new_axiom(@term_syntax.parse_term("∀ t : (A) -> B, ((x : A) => t(x)) == t")))
}

///|
let eta_ax_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ETA_AX")

///|
/// `ETA_AX`
pub fn eta_ax() -> @kernel.Thm {
  eta_ax_c.get()
}

///|
/// ETA_CONV
fn step_2() -> Unit raise {
  let t = @term_syntax.parse_term("(t : (A) -> B)")
  let t1 = @tactics.match_accept_tac(eta_ax())
  let pth = @tactics.prove(@term_syntax.parse_term("((x : A) => (t : (A) -> B)(x)) == t"), t1)
  eta_conv_c.set(fn(x2 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x2
    try {
      let (bv, bod) = @kernel.dest_abs(tm)
      let (l, r) = @kernel.dest_comb(bod)
      if r == bv && !@kernel.vfree_in(bv, l) {
        let t3 = (@kernel.type_of(bod), @basics.bty)
        let t4 = @bool.pinst(
          @list.List([(@kernel.type_of(bv), @kernel.aty), t3]),
          @list.List([(l, t)]),
          pth,
        )
        @kernel.trans(@kernel.refl(tm), t4)
      } else {
        @lib.failure()
      }
    } catch {
      Failure(_) => raise Failure("ETA_CONV")
      e => raise e
    }
  })
}

///|
let eta_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "ETA_CONV",
)

///|
/// `ETA_CONV`
pub fn eta_conv(x : @kernel.Term) -> @kernel.Thm raise {
  eta_conv_c.get()(x)
}

///|
/// EQ_EXT
fn step_3() -> Unit raise {
  let t15 = @simp.rewrite_tac(@list.List([eta_ax()]))
  let t11 = @term_syntax.parse_term("(x : A)")
  let t8 = @term_syntax.parse_term("(x : A)")
  let t14 = @tactics.disch_then(fn(
    x13 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    (fn(
      x10 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x5 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s6 = @tactics.mp_tac(x5)
        fn(
          x7 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s6(x7)
        }
      })(((x9 : @kernel.Thm) => @kernel.abs_rule(t8, x9))(x10))
    })(((x12 : @kernel.Thm) => @bool.spec(t11, x12))(x13))
  })
  let t16 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t14),
    t15,
  )
  eq_ext_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> B, (∀ x : A, f(x) == g(x)) → f == g"),
      t16,
    ),
  )
}

///|
let eq_ext_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_EXT")

///|
/// `EQ_EXT`
pub fn eq_ext() -> @kernel.Thm {
  eq_ext_c.get()
}

///|
/// FUN_EQ_THM
fn step_4() -> Unit raise {
  let t20 = @tactics.match_accept_tac(eq_ext())
  let t21 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
          x17 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s18 = @tactics.subst1_tac(x17)
          fn(
            x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s18(x19)
          }
        }),
        @tactics.gen_tac,
      ),
      @tactics.refl_tac,
    ),
    t20,
  ])
  let t22 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t21,
  )
  fun_eq_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> B, ∀ g : (A) -> B, (f == g) == (∀ x : A, f(x) == g(x))"),
      t22,
    ),
  )
}

///|
let fun_eq_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUN_EQ_THM")

///|
/// `FUN_EQ_THM`
pub fn fun_eq_thm() -> @kernel.Thm {
  fun_eq_thm_c.get()
}

///|
/// class.ml:45
fn step_5() -> Unit raise {
  @kernel.new_constant("@", @parser.parse_type("(A->bool)->A"))
}

///|
/// class.ml:47
fn step_6() -> Unit raise {
  @printer.parse_as_binder("@")
}

///|
/// is_select
fn step_7() -> Unit raise {
  is_select_c.set(fn(x24 : @kernel.Term) -> Bool raise {
    ((x23 : @kernel.Term) => @basics.is_binder("@", x23))(x24)
  })
}

///|
let is_select_c : @lib.Cell[(@kernel.Term) -> Bool raise] = @lib.Cell::new(
  "is_select",
)

///|
/// `is_select`
pub fn is_select(x : @kernel.Term) -> Bool raise {
  is_select_c.get()(x)
}

///|
/// dest_select
fn step_8() -> Unit raise {
  dest_select_c.set((x25 : @kernel.Term) => @basics.dest_binder("@", x25))
}

///|
let dest_select_c : @lib.Cell[
  (@kernel.Term) -> (@kernel.Term, @kernel.Term) raise,
] = @lib.Cell::new("dest_select")

///|
/// `dest_select`
pub fn dest_select(x : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
  dest_select_c.get()(x)
}

///|
/// mk_select
fn step_9() -> Unit raise {
  mk_select_c.set(fn(x28 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    ((x26 : @kernel.Term, x27 : @kernel.Term) => {
      @basics.mk_binder("@", x26, x27)
    })(x28.0, x28.1)
  })
}

///|
let mk_select_c : @lib.Cell[
  ((@kernel.Term, @kernel.Term)) -> @kernel.Term raise,
] = @lib.Cell::new("mk_select")

///|
/// `mk_select`
pub fn mk_select(x : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
  mk_select_c.get()(x)
}

///|
/// SELECT_AX
fn step_10() -> Unit raise {
  select_ax_c.set(
    @kernel.new_axiom(@term_syntax.parse_term("∀ P : (A) -> Bool, ∀ x : A, P(x) → P(select(P))")),
  )
}

///|
let select_ax_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SELECT_AX")

///|
/// `SELECT_AX`
pub fn select_ax() -> @kernel.Thm {
  select_ax_c.get()
}

///|
/// EXISTS_THM
fn step_11() -> Unit raise {
  let t45 = @tactics.pop_assum(fn(
    x42 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s43 = @tactics.accept_tac(x42)
    fn(
      x44 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s43(x44)
    }
  })
  let t46 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_tac,
      @tactics.exists_tac(@term_syntax.parse_term("select((P : (A) -> Bool))")),
    ),
    t45,
  )
  let t41 = @tactics.match_accept_tac(select_ax())
  let t47 = @list.List([
    @tactics.then_tac(
      @tactics.disch_then(
        @tactics.choose_then(fn(
          x38 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s39 = @tactics.mp_tac(x38)
          fn(
            x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s39(x40)
          }
        }),
      ),
      t41,
    ),
    t46,
  ])
  let t37 = @simp.gen_rewrite_tac(
    fn(
      x36 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x30 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s31 = @equal.land_conv(x30)
        fn(x32 : @kernel.Term) -> @kernel.Thm raise { s31(x32) }
      })(
        (fn(
          x33 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s34 = @equal.rand_conv(x33)
          fn(x35 : @kernel.Term) -> @kernel.Thm raise { s34(x35) }
        })(x36),
      )
    },
    @list.List([@equal.gsym(eta_ax())]),
  )
  let t29 = @tactics.x_gen_tac(@term_syntax.parse_term("(P : (A) -> Bool)"))
  let t48 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(eq_ext()), @tactics.beta_tac),
          t29,
        ),
        t37,
      ),
      @tactics.eq_tac,
    ),
    t47,
  )
  exists_thm_c.set(
    @tactics.prove(@term_syntax.parse_term("op_q == ((P : (A) -> Bool) => P(select(P)))"), t48),
  )
}

///|
let exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_THM")

///|
/// `EXISTS_THM`
pub fn exists_thm() -> @kernel.Thm {
  exists_thm_c.get()
}

///|
/// SELECT_RULE
fn step_12() -> Unit raise {
  let p = @term_syntax.parse_term("(P : (A) -> Bool)")
  let t49 = @simp.simp_tac(@list.List([select_ax(), eta_ax()]))
  let pth = @tactics.prove(
    @term_syntax.parse_term("op_q((P : (A) -> Bool)) → P(select(P))"),
    t49,
  )
  select_rule_c.set(fn(x50 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x50
    try {
      let abs = @kernel.rand(@kernel.concl(th))
      let ty = @kernel.type_of(@basics.bndvar(abs))
      @equal.conv_rule(
        @equal.beta_conv,
        @bool.mp(
          @bool.pinst(
            @list.List([(ty, @kernel.aty)]),
            @list.List([(abs, p)]),
            pth,
          ),
          th,
        ),
      )
    } catch {
      Failure(_) => raise Failure("SELECT_RULE")
      e => raise e
    }
  })
}

///|
let select_rule_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "SELECT_RULE",
)

///|
/// `SELECT_RULE`
pub fn select_rule(x : @kernel.Thm) -> @kernel.Thm raise {
  select_rule_c.get()(x)
}

///|
/// SELECT_CONV
fn step_13() -> Unit raise {
  let p = @term_syntax.parse_term("(P : (A) -> Bool)")
  let t51 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([exists_thm()])),
      @tactics.beta_tac,
    ),
    @tactics.refl_tac,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("(P : (A) -> Bool)(select(P)) == op_q(P)"),
    t51,
  )
  select_conv_c.set(fn(x52 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x52
    try {
      let is_epsok : (@kernel.Term) -> Bool raise = fn(
        x53 : @kernel.Term,
      ) -> Bool raise {
        let t = x53
        if is_select(t) {
          let (bv, bod) = dest_select(t)
          @basics.aconv(tm, @kernel.vsubst(@list.List([(t, bv)]), bod))
        } else {
          false
        }
      }
      let pickeps = @basics.find_term(is_epsok, tm)
      let abs = @kernel.rand(pickeps)
      let ty = @kernel.type_of(@basics.bndvar(abs))
      let t54 = @bool.pinst(
        @list.List([(ty, @kernel.aty)]),
        @list.List([(abs, p)]),
        pth,
      )
      @equal.conv_rule(@equal.land_conv(@equal.beta_conv), t54)
    } catch {
      Failure(_) => raise Failure("SELECT_CONV")
      e => raise e
    }
  })
}

///|
let select_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "SELECT_CONV",
)

///|
/// `SELECT_CONV`
pub fn select_conv(x : @kernel.Term) -> @kernel.Thm raise {
  select_conv_c.get()(x)
}

///|
/// SELECT_REFL
fn step_14() -> Unit raise {
  let t55 = @tactics.exists_tac(@term_syntax.parse_term("(x : A)"))
  let t56 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.conv_tac(select_conv)),
      t55,
    ),
    @tactics.refl_tac,
  )
  select_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : A, select((y : A) => y == x) == x"), t56),
  )
}

///|
let select_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SELECT_REFL")

///|
/// `SELECT_REFL`
pub fn select_refl() -> @kernel.Thm {
  select_refl_c.get()
}

///|
/// SELECT_UNIQUE
fn step_15() -> Unit raise {
  let t65 = @simp.asm_rewrite_tac(@list.List([select_refl()]))
  let t64 = @simp.gen_rewrite_tac(
    fn(
      x63 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x57 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s58 = @equal.land_conv(x57)
        fn(x59 : @kernel.Term) -> @kernel.Thm raise { s58(x59) }
      })(
        (fn(
          x60 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s61 = @equal.rand_conv(x60)
          fn(x62 : @kernel.Term) -> @kernel.Thm raise { s61(x62) }
        })(x63),
      )
    },
    @list.List([@equal.gsym(eta_ax())]),
  )
  let t66 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t64),
    t65,
  )
  select_unique_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ x : A, (∀ y : A, P(y) == (y == x)) → select(P) == x"),
      t66,
    ),
  )
}

///|
let select_unique_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SELECT_UNIQUE")

///|
/// `SELECT_UNIQUE`
pub fn select_unique() -> @kernel.Thm {
  select_unique_c.get()
}

///|
/// class.ml:113
fn step_16() -> Unit raise {
  @simp.extend_basic_rewrites(@list.List([select_refl()]))
}

///|
/// the_type_definitions
fn step_17() -> Unit raise {
  the_type_definitions_c.set(Ref::{ val: @list.List([]), })
}

///|
let the_type_definitions_c : @lib.Cell[
  Ref[@list.List[((String, String, String), (@kernel.Thm, @kernel.Thm))]],
] = @lib.Cell::new("the_type_definitions")

///|
/// `the_type_definitions`
pub fn the_type_definitions() -> Ref[
  @list.List[((String, String, String), (@kernel.Thm, @kernel.Thm))],
] {
  the_type_definitions_c.get()
}

///|
/// `new_type_definition`
pub fn new_type_definition(
  x67 : String,
  x68 : (String, String),
  x69 : @kernel.Thm,
) -> @kernel.Thm raise {
  let tyname = x67
  let (absname, repname) = x68
  let th = x69
  try {
    let (th_p, tth_p) = @lib.assoc(
      (tyname, absname, repname),
      the_type_definitions().val,
    )
    let t70 = @kernel.concl(th)
    if @kernel.concl(th_p) != t70 {
      raise Failure("")
    } else {
      @lib.warn(true, "Benign redefinition of type")
      tth_p
    }
  } catch {
    Failure(_) => {
      let th0 = @equal.conv_rule(
        @equal.thenc(
          @equal.rator_conv(@simp.rewr_conv(exists_thm())),
          @equal.beta_conv,
        ),
        th,
      )
      let (th1, th2) = @kernel.new_basic_type_definition(
        tyname, absname, repname, th0,
      )
      let t71 = @bool.gen_all(
        @equal.conv_rule(
          @equal.land_conv(@equal.try_conv(@equal.beta_conv)),
          th2,
        ),
      )
      let tth = @bool.conj(@bool.gen_all(th1), t71)
      {
        the_type_definitions().val = the_type_definitions().val.prepend(
          ((tyname, absname, repname), (th, tth)),
        )
        ()
      }
      tth
    }
    e => raise e
  }
}

///|
/// EXCLUDED_MIDDLE
fn step_18() -> Unit raise {
  let t84 = @simp.asm_rewrite_tac(
    @list.List([@itab.itaut(@term_syntax.parse_term("((p : Bool) || true) == true"))]),
  )
  let t83 = @simp.pure_once_asm_rewrite_tac(@list.List([]))
  let t82 = @tactics.mp_tac(@itab.itaut(@term_syntax.parse_term("!(true == false)")))
  let t81 = @tactics.try_tac(
    @tactics.then_tac(
      @tactics.disj1_tac,
      @tactics.first_assum(fn(
        x78 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s79 = @tactics.accept_tac(x78)
        fn(
          x80 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s79(x80)
        }
      }),
    ),
  )
  let t85 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_then(fn(
                x77 : @kernel.Thm,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                @tactics.strip_assume_tac(@equal.gsym(x77))
              }),
              t81,
            ),
            @tactics.disj2_tac,
          ),
          @tactics.disch_tac,
        ),
        t82,
      ),
      t83,
    ),
    t84,
  )
  let t75 = @tactics.exists_tac(@term_syntax.parse_term("true"))
  let t76 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("false")), t75])
  let t86 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(@tactics.conj_tac, @tactics.conv_tac(select_conv)),
          t76,
        ),
        @tactics.disj1_tac,
      ),
      @tactics.refl_tac,
    ),
    t85,
  ])
  let t87 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.subgoal_then(
        @term_syntax.parse_term("(select((x : Bool) => x == false || (t : Bool)) == false || t) && (select((x : Bool) => x == true || t) == true || t)"),
        fn(
          x72 : @kernel.Thm,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          let s73 = @tactics.mp_tac(x72)
          fn(
            x74 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise {
            s73(x74)
          }
        },
      ),
    ),
    t86,
  )
  excluded_middle_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Bool, t || !t"), t87))
}

///|
let excluded_middle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXCLUDED_MIDDLE",
)

///|
/// `EXCLUDED_MIDDLE`
pub fn excluded_middle() -> @kernel.Thm {
  excluded_middle_c.get()
}

///|
/// BOOL_CASES_AX
fn step_19() -> Unit raise {
  let t88 = @simp.asm_rewrite_tac(@list.List([]))
  let t89 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @tactics.disj_cases_tac(
        @bool.spec(@term_syntax.parse_term("(t : Bool)"), excluded_middle()),
      ),
    ),
    t88,
  )
  bool_cases_ax_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ t : Bool, t == true || t == false"), t89),
  )
}

///|
let bool_cases_ax_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOOL_CASES_AX")

///|
/// `BOOL_CASES_AX`
pub fn bool_cases_ax() -> @kernel.Thm {
  bool_cases_ax_c.get()
}

///|
/// `BOOL_CASES_TAC`
pub fn bool_cases_tac(x90 : @kernel.Term) -> @tactics.Tactic raise {
  let p = x90
  @tactics.struct_cases_tac(@bool.spec(p, bool_cases_ax()))
}

///|
/// `ASM_CASES_TAC`
pub fn asm_cases_tac(x92 : @kernel.Term) -> @tactics.Tactic raise {
  let t = x92
  @tactics.disj_cases_tac(@bool.spec(t, excluded_middle()))
}

///|
/// TAUT
fn step_20() -> Unit raise {
  let prop_rewrite_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @simp.rewrite_tac(@list.List([]))
  let rtaut_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = fn(
    x94 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise {
    let (asl, w) = x94
    let ok : (@kernel.Term) -> Bool raise = fn(
      x95 : @kernel.Term,
    ) -> Bool raise {
      let t = x95
      @kernel.type_of(t) == @kernel.bool_ty &&
      @lib.can(
        (x97 : @kernel.Term) => {
          @basics.find_term(
            fn(x96 : @kernel.Term) -> Bool raise { @kernel.is_var(x96) },
            x97,
          )
        },
        t,
      ) &&
      @basics.free_in(t, w)
    }
    let t101 = (fn(
      x98 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise,
    ) -> ((
      ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise) raise {
      let t1 = x98
      fn(
        x99 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let t2 = x99
        @tactics.then_tac(t1, t2)
      }
    })(@simp.rewrite_tac(@list.List([])))
    @tactics.then_tac(prop_rewrite_tac, fn(
      x112 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      (fn(
        x111 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x109 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x107 : @list.List[@kernel.Term],
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x103 : @list.List[@kernel.Term],
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x102 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                t101(bool_cases_tac(x102))
              })(@lib.hd(x103))
            })(
              ((x106 : @list.List[@kernel.Term]) => {
                @lib.sort(
                  fn(x104 : @kernel.Term, x105 : @kernel.Term) -> Bool raise {
                    @basics.free_in(x104, x105)
                  },
                  x106,
                )
              })(x107),
            )
          })(((x108 : @kernel.Term) => @basics.find_terms(ok, x108))(x109))
        })(
          (fn(
            x110 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> @kernel.Term raise {
            x110.1
          })(x111),
        )
      })(x112)(x112)
    })((asl, w))
  }
  let t113 = @tactics.repeat_tac(rtaut_tac)
  let taut_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @tactics.then_tac(
    @tactics.repeat_tac(
      @tactics.orelse_tac(@tactics.gen_tac, @tactics.conj_tac),
    ),
    t113,
  )
  taut_v1_c.set(fn(x114 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x114
    @tactics.prove(tm, taut_tac)
  })
}

///|
let taut_v1_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "TAUT",
)

///|
/// `TAUT`
pub fn taut_v1(x : @kernel.Term) -> @kernel.Thm raise {
  taut_v1_c.get()(x)
}

///|
/// DE_MORGAN_THM
fn step_21() -> Unit raise {
  de_morgan_thm_c.set(
    taut_v1(
      @term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, !(t1 && t2) == (!t1 || !t2) && !(t1 || t2) == (!t1 && !t2)"),
    ),
  )
}

///|
let de_morgan_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DE_MORGAN_THM")

///|
/// `DE_MORGAN_THM`
pub fn de_morgan_thm() -> @kernel.Thm {
  de_morgan_thm_c.get()
}

///|
/// NOT_CLAUSES
fn step_22() -> Unit raise {
  not_clauses_c.set(
    taut_v1(
      @term_syntax.parse_term("(∀ t : Bool, !!t == t) && !true == false && !false == true"),
    ),
  )
}

///|
let not_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_CLAUSES")

///|
/// `NOT_CLAUSES`
pub fn not_clauses() -> @kernel.Thm {
  not_clauses_c.get()
}

///|
/// NOT_IMP
fn step_23() -> Unit raise {
  not_imp_c.set(
    taut_v1(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, !(t1 → t2) == (t1 && !t2)")),
  )
}

///|
let not_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_IMP")

///|
/// `NOT_IMP`
pub fn not_imp() -> @kernel.Thm {
  not_imp_c.get()
}

///|
/// CONTRAPOS_THM
fn step_24() -> Unit raise {
  contrapos_thm_c.set(
    taut_v1(@term_syntax.parse_term("∀ t1 : Bool, ∀ t2 : Bool, (!t1 → !t2) == (t2 → t1)")),
  )
}

///|
let contrapos_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTRAPOS_THM")

///|
/// `CONTRAPOS_THM`
pub fn contrapos_thm() -> @kernel.Thm {
  contrapos_thm_c.get()
}

///|
/// class.ml:195
fn step_25() -> Unit raise {
  @simp.extend_basic_rewrites(@list.List([@bool.conjunct1(not_clauses())]))
}

///|
/// CCONTR
fn step_26() -> Unit raise {
  let p = @term_syntax.parse_term("(P : Bool)")
  let pth = taut_v1(@term_syntax.parse_term("(!(P : Bool) → false) → P"))
  ccontr_c.set(fn(
    x115 : @kernel.Term,
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let tm = x115
    fn(x116 : @kernel.Thm) -> @kernel.Thm raise {
      let th = x116
      try {
        let tm_p = @bool.mk_neg(tm)
        let t117 = @bool.disch(tm_p, th)
        @bool.mp(@kernel.inst_rule(@list.List([(tm, p)]), pth), t117)
      } catch {
        Failure(_) => raise Failure("CCONTR")
        e => raise e
      }
    }
  })
}

///|
let ccontr_c : @lib.Cell[
  (@kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("CCONTR")

///|
/// `CCONTR`
pub fn ccontr(x : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  ccontr_c.get()(x)
}

///|
/// CONTRAPOS_CONV
fn step_27() -> Unit raise {
  let a = @term_syntax.parse_term("(a : Bool)")
  let b = @term_syntax.parse_term("(b : Bool)")
  let pth = taut_v1(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!b → !a)"))
  contrapos_conv_c.set(fn(x118 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x118
    try {
      let (p, q) = @basics.dest_imp(tm)
      @kernel.inst_rule(@list.List([(p, a), (q, b)]), pth)
    } catch {
      Failure(_) => raise Failure("CONTRAPOS_CONV")
      e => raise e
    }
  })
}

///|
let contrapos_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "CONTRAPOS_CONV",
)

///|
/// `CONTRAPOS_CONV`
pub fn contrapos_conv(x : @kernel.Term) -> @kernel.Thm raise {
  contrapos_conv_c.get()(x)
}

///|
/// REFUTE_THEN
fn step_28() -> Unit raise {
  let f_tm = @term_syntax.parse_term("false")
  let conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
    taut_v1(@term_syntax.parse_term("(p : Bool) == (!p → false)")),
  )
  refute_then_c.set(fn(
    x119 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let ttac = x119
    fn(
      x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      let (asl, w) as gl = x120
      if w == f_tm {
        @tactics.all_tac(gl)
      } else if @basics.is_neg(w) {
        @tactics.disch_then(ttac)(gl)
      } else {
        let t121 = @tactics.disch_then(ttac)
        @tactics.then_tac(@tactics.conv_tac(conv), t121)(gl)
      }
    }
  })
}

///|
let refute_then_c : @lib.Cell[
  (@tactics.ThmTactic) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise,
] = @lib.Cell::new("REFUTE_THEN")

///|
/// `REFUTE_THEN`
pub fn refute_then(
  x : @tactics.ThmTactic,
) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise {
  refute_then_c.get()(x)
}

///|
/// NOT_EXISTS_THM
fn step_29() -> Unit raise {
  let t132 = @simp.asm_rewrite_tac(@list.List([]))
  let t133 = @tactics.then_tac(
    @tactics.disch_then(
      @tactics.choose_then(fn(
        x129 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s130 = @tactics.mp_tac(x129)
        fn(
          x131 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s130(x131)
        }
      }),
    ),
    t132,
  )
  let t128 = @tactics.pop_assum(fn(
    x125 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s126 = @tactics.accept_tac(x125)
    fn(
      x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s126(x127)
    }
  })
  let t124 = @tactics.exists_tac(@term_syntax.parse_term("(x : A)"))
  let t123 = @simp.rewrite_tac(@list.List([]))
  let t122 = @tactics.undisch_tac(@term_syntax.parse_term("!(∃ x : A, (P : (A) -> Bool)(x))"))
  let t134 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
            t122,
          ),
          t123,
        ),
        t124,
      ),
      t128,
    ),
    t133,
  ])
  let t135 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
      @tactics.disch_tac,
    ),
    t134,
  )
  not_exists_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, !(∃ x : A, P(x)) == (∀ x : A, !P(x))"),
      t135,
    ),
  )
}

///|
let not_exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_EXISTS_THM")

///|
/// `NOT_EXISTS_THM`
pub fn not_exists_thm() -> @kernel.Thm {
  not_exists_thm_c.get()
}

///|
/// EXISTS_NOT_THM
fn step_30() -> Unit raise {
  let t136 = @simp.rewrite_tac(@list.List([not_exists_thm()]))
  let t137 = @tactics.then_tac(
    @simp.once_rewrite_tac(
      @list.List([taut_v1(@term_syntax.parse_term("((a : Bool) == !(b : Bool)) == (!a == b)"))]),
    ),
    t136,
  )
  exists_not_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, (∃ x : A, !P(x)) == !(∀ x : A, P(x))"),
      t137,
    ),
  )
}

///|
let exists_not_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_NOT_THM")

///|
/// `EXISTS_NOT_THM`
pub fn exists_not_thm() -> @kernel.Thm {
  exists_not_thm_c.get()
}

///|
/// NOT_FORALL_THM
fn step_31() -> Unit raise {
  let t138 = @tactics.match_accept_tac(@equal.gsym(exists_not_thm()))
  not_forall_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, !(∀ x : A, P(x)) == (∃ x : A, !P(x))"),
      t138,
    ),
  )
}

///|
let not_forall_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_FORALL_THM")

///|
/// `NOT_FORALL_THM`
pub fn not_forall_thm() -> @kernel.Thm {
  not_forall_thm_c.get()
}

///|
/// FORALL_NOT_THM
fn step_32() -> Unit raise {
  let t139 = @tactics.match_accept_tac(@equal.gsym(not_exists_thm()))
  forall_not_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, (∀ x : A, !P(x)) == !(∃ x : A, P(x))"),
      t139,
    ),
  )
}

///|
let forall_not_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_NOT_THM")

///|
/// `FORALL_NOT_THM`
pub fn forall_not_thm() -> @kernel.Thm {
  forall_not_thm_c.get()
}

///|
/// FORALL_BOOL_THM
fn step_33() -> Unit raise {
  let t142 = @simp.asm_rewrite_tac(@list.List([]))
  let t141 = bool_cases_tac(@term_syntax.parse_term("(b : Bool)"))
  let t140 = @simp.asm_rewrite_tac(@list.List([]))
  let t143 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.eq_tac, @tactics.disch_tac),
          t140,
        ),
        @tactics.gen_tac,
      ),
      t141,
    ),
    t142,
  )
  forall_bool_thm_c.set(
    @tactics.prove(@term_syntax.parse_term("(∀ b : Bool, (P : (Bool) -> Bool)(b)) == (P(true) && P(false))"), t143),
  )
}

///|
let forall_bool_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "FORALL_BOOL_THM",
)

///|
/// `FORALL_BOOL_THM`
pub fn forall_bool_thm() -> @kernel.Thm {
  forall_bool_thm_c.get()
}

///|
/// EXISTS_BOOL_THM
fn step_34() -> Unit raise {
  let t144 = @simp.rewrite_tac(
    @list.List([de_morgan_thm(), not_exists_thm(), forall_bool_thm()]),
  )
  let t145 = @tactics.then_tac(
    @tactics.match_mp_tac(
      taut_v1(@term_syntax.parse_term("!(p : Bool) == !(q : Bool) → p == q")),
    ),
    t144,
  )
  exists_bool_thm_c.set(
    @tactics.prove(@term_syntax.parse_term("(∃ b : Bool, (P : (Bool) -> Bool)(b)) == (P(true) || P(false))"), t145),
  )
}

///|
let exists_bool_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "EXISTS_BOOL_THM",
)

///|
/// `EXISTS_BOOL_THM`
pub fn exists_bool_thm() -> @kernel.Thm {
  exists_bool_thm_c.get()
}

///|
/// LEFT_FORALL_OR_THM
fn step_35() -> Unit raise {
  let t147 = @simp.rewrite_tac(
    @list.List([
      not_forall_thm(),
      de_morgan_thm(),
      @theorems.left_exists_and_thm(),
    ]),
  )
  let t146 = @simp.once_rewrite_tac(
    @list.List([taut_v1(@term_syntax.parse_term("((a : Bool) == (b : Bool)) == (!a == !b)"))]),
  )
  let t148 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t146),
    t147,
  )
  left_forall_or_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (∀ x : A, P(x) || Q) == ((∀ x : A, P(x)) || Q)"),
      t148,
    ),
  )
}

///|
let left_forall_or_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_FORALL_OR_THM",
)

///|
/// `LEFT_FORALL_OR_THM`
pub fn left_forall_or_thm() -> @kernel.Thm {
  left_forall_or_thm_c.get()
}

///|
/// RIGHT_FORALL_OR_THM
fn step_36() -> Unit raise {
  let t150 = @simp.rewrite_tac(
    @list.List([
      not_forall_thm(),
      de_morgan_thm(),
      @theorems.right_exists_and_thm(),
    ]),
  )
  let t149 = @simp.once_rewrite_tac(
    @list.List([taut_v1(@term_syntax.parse_term("((a : Bool) == (b : Bool)) == (!a == !b)"))]),
  )
  let t151 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t149),
    t150,
  )
  right_forall_or_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (∀ x : A, P || Q(x)) == (P || (∀ x : A, Q(x)))"),
      t151,
    ),
  )
}

///|
let right_forall_or_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_FORALL_OR_THM",
)

///|
/// `RIGHT_FORALL_OR_THM`
pub fn right_forall_or_thm() -> @kernel.Thm {
  right_forall_or_thm_c.get()
}

///|
/// LEFT_OR_FORALL_THM
fn step_37() -> Unit raise {
  let t152 = @tactics.match_accept_tac(@equal.gsym(left_forall_or_thm()))
  left_or_forall_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, ((∀ x : A, P(x)) || Q) == (∀ x : A, P(x) || Q)"),
      t152,
    ),
  )
}

///|
let left_or_forall_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_OR_FORALL_THM",
)

///|
/// `LEFT_OR_FORALL_THM`
pub fn left_or_forall_thm() -> @kernel.Thm {
  left_or_forall_thm_c.get()
}

///|
/// RIGHT_OR_FORALL_THM
fn step_38() -> Unit raise {
  let t153 = @tactics.match_accept_tac(@equal.gsym(right_forall_or_thm()))
  right_or_forall_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P || (∀ x : A, Q(x))) == (∀ x : A, P || Q(x))"),
      t153,
    ),
  )
}

///|
let right_or_forall_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_OR_FORALL_THM",
)

///|
/// `RIGHT_OR_FORALL_THM`
pub fn right_or_forall_thm() -> @kernel.Thm {
  right_or_forall_thm_c.get()
}

///|
/// LEFT_IMP_FORALL_THM
fn step_39() -> Unit raise {
  let t155 = @simp.rewrite_tac(
    @list.List([not_exists_thm(), not_imp(), @theorems.left_and_forall_thm()]),
  )
  let t154 = @simp.once_rewrite_tac(
    @list.List([taut_v1(@term_syntax.parse_term("((a : Bool) == (b : Bool)) == (!a == !b)"))]),
  )
  let t156 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t154),
    t155,
  )
  left_imp_forall_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, ((∀ x : A, P(x)) → Q) == (∃ x : A, P(x) → Q)"),
      t156,
    ),
  )
}

///|
let left_imp_forall_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_IMP_FORALL_THM",
)

///|
/// `LEFT_IMP_FORALL_THM`
pub fn left_imp_forall_thm() -> @kernel.Thm {
  left_imp_forall_thm_c.get()
}

///|
/// LEFT_EXISTS_IMP_THM
fn step_40() -> Unit raise {
  let t157 = @tactics.match_accept_tac(@equal.gsym(left_imp_forall_thm()))
  left_exists_imp_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ Q : Bool, (∃ x : A, P(x) → Q) == ((∀ x : A, P(x)) → Q)"),
      t157,
    ),
  )
}

///|
let left_exists_imp_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "LEFT_EXISTS_IMP_THM",
)

///|
/// `LEFT_EXISTS_IMP_THM`
pub fn left_exists_imp_thm() -> @kernel.Thm {
  left_exists_imp_thm_c.get()
}

///|
/// RIGHT_IMP_EXISTS_THM
fn step_41() -> Unit raise {
  let t159 = @simp.rewrite_tac(
    @list.List([not_exists_thm(), not_imp(), @theorems.right_and_forall_thm()]),
  )
  let t158 = @simp.once_rewrite_tac(
    @list.List([taut_v1(@term_syntax.parse_term("((a : Bool) == (b : Bool)) == (!a == !b)"))]),
  )
  let t160 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t158),
    t159,
  )
  right_imp_exists_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (P → (∃ x : A, Q(x))) == (∃ x : A, P → Q(x))"),
      t160,
    ),
  )
}

///|
let right_imp_exists_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_IMP_EXISTS_THM",
)

///|
/// `RIGHT_IMP_EXISTS_THM`
pub fn right_imp_exists_thm() -> @kernel.Thm {
  right_imp_exists_thm_c.get()
}

///|
/// RIGHT_EXISTS_IMP_THM
fn step_42() -> Unit raise {
  let t161 = @tactics.match_accept_tac(@equal.gsym(right_imp_exists_thm()))
  right_exists_imp_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : Bool, ∀ Q : (A) -> Bool, (∃ x : A, P → Q(x)) == (P → (∃ x : A, Q(x)))"),
      t161,
    ),
  )
}

///|
let right_exists_imp_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "RIGHT_EXISTS_IMP_THM",
)

///|
/// `RIGHT_EXISTS_IMP_THM`
pub fn right_exists_imp_thm() -> @kernel.Thm {
  right_exists_imp_thm_c.get()
}

///|
/// COND_DEF
fn step_43() -> Unit raise {
  cond_def_c.set(
    @drule.new_definition(
      @term_syntax.parse_term("(COND : (Bool, A, A) -> A) == ((t : Bool) => (t1 : A) => (t2 : A) => select((x : A) => (t == true → x == t1) && (t == false → x == t2)))"),
    ),
  )
}

///|
let cond_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_DEF")

///|
/// `COND_DEF`
pub fn cond_def() -> @kernel.Thm {
  cond_def_c.get()
}

///|
/// COND_CLAUSES
fn step_44() -> Unit raise {
  let t162 = @simp.rewrite_tac(@list.List([cond_def()]))
  cond_clauses_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ t1 : A, ∀ t2 : A, (if true { t1 } else { t2 }) == t1 && (if false { t1 } else { t2 }) == t2"),
      t162,
    ),
  )
}

///|
let cond_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_CLAUSES")

///|
/// `COND_CLAUSES`
pub fn cond_clauses() -> @kernel.Thm {
  cond_clauses_c.get()
}

///|
/// `is_cond`
pub fn is_cond(x163 : @kernel.Term) -> Bool raise {
  let tm = x163
  try
    @kernel.dest_const(@kernel.rator(@kernel.rator(@kernel.rator(tm)))).0 ==
    "COND"
  catch {
    Failure(_) => false
    e => raise e
  }
}

///|
/// `mk_cond`
pub fn mk_cond(
  x164 : @kernel.Term,
  x165 : @kernel.Term,
  x166 : @kernel.Term,
) -> @kernel.Term raise {
  let (b, x, y) = (x164, x165, x166)
  try {
    let c = @kernel.mk_const(
      "COND",
      @list.List([(@kernel.type_of(x), @kernel.aty)]),
    )
    @kernel.mk_comb(@kernel.mk_comb(@kernel.mk_comb(c, b), x), y)
  } catch {
    Failure(_) => raise Failure("mk_cond")
    e => raise e
  }
}

///|
/// `dest_cond`
pub fn dest_cond(
  x167 : @kernel.Term,
) -> (@kernel.Term, (@kernel.Term, @kernel.Term)) raise {
  let tm = x167
  try {
    let (tm1, y) = @kernel.dest_comb(tm)
    let (tm2, x) = @kernel.dest_comb(tm1)
    let (c, b) = @kernel.dest_comb(tm2)
    if @kernel.dest_const(c).0 == "COND" {
      (b, (x, y))
    } else {
      @lib.failure()
    }
  } catch {
    Failure(_) => raise Failure("dest_cond")
    e => raise e
  }
}

///|
/// class.ml:340
fn step_45() -> Unit raise {
  @simp.extend_basic_rewrites(@list.List([cond_clauses()]))
}

///|
/// COND_EXPAND
fn step_46() -> Unit raise {
  let t169 = @simp.rewrite_tac(@list.List([]))
  let t168 = bool_cases_tac(@term_syntax.parse_term("(b : Bool)"))
  let t170 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t168),
    t169,
  )
  cond_expand_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ b : Bool, ∀ t1 : Bool, ∀ t2 : Bool, (if b { t1 } else { t2 }) == ((!b || t1) && (b || t2))"),
      t170,
    ),
  )
}

///|
let cond_expand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_EXPAND")

///|
/// `COND_EXPAND`
pub fn cond_expand() -> @kernel.Thm {
  cond_expand_c.get()
}

///|
/// COND_ID
fn step_47() -> Unit raise {
  let t172 = @simp.rewrite_tac(@list.List([]))
  let t171 = bool_cases_tac(@term_syntax.parse_term("(b : Bool)"))
  let t173 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t171),
    t172,
  )
  cond_id_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ b : Bool, ∀ t : A, (if b { t } else { t }) == t"),
      t173,
    ),
  )
}

///|
let cond_id_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_ID")

///|
/// `COND_ID`
pub fn cond_id() -> @kernel.Thm {
  cond_id_c.get()
}

///|
/// COND_RAND
fn step_48() -> Unit raise {
  let t175 = @simp.rewrite_tac(@list.List([]))
  let t174 = bool_cases_tac(@term_syntax.parse_term("(b : Bool)"))
  let t176 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t174),
    t175,
  )
  cond_rand_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ b : Bool, ∀ f : (A) -> B, ∀ x : A, ∀ y : A, f(if b { x } else { y }) == (if b { f(x) } else { f(y) })"),
      t176,
    ),
  )
}

///|
let cond_rand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_RAND")

///|
/// `COND_RAND`
pub fn cond_rand() -> @kernel.Thm {
  cond_rand_c.get()
}

///|
/// COND_RATOR
fn step_49() -> Unit raise {
  let t178 = @simp.rewrite_tac(@list.List([]))
  let t177 = bool_cases_tac(@term_syntax.parse_term("(b : Bool)"))
  let t179 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t177),
    t178,
  )
  cond_rator_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ b : Bool, ∀ f : (A) -> B, ∀ g : (A) -> B, ∀ x : A, COND(b, f, g, x) == (if b { f(x) } else { g(x) })"),
      t179,
    ),
  )
}

///|
let cond_rator_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_RATOR")

///|
/// `COND_RATOR`
pub fn cond_rator() -> @kernel.Thm {
  cond_rator_c.get()
}

///|
/// COND_ABS
fn step_50() -> Unit raise {
  let t181 = @simp.rewrite_tac(@list.List([eta_ax()]))
  let t180 = bool_cases_tac(@term_syntax.parse_term("(b : Bool)"))
  let t182 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t180),
    t181,
  )
  cond_abs_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ b : Bool, ∀ f : (A) -> B, ∀ g : (A) -> B, ((x : A) => if b { f(x) } else { g(x) }) == (if b { f } else { g })"),
      t182,
    ),
  )
}

///|
let cond_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_ABS")

///|
/// `COND_ABS`
pub fn cond_abs() -> @kernel.Thm {
  cond_abs_c.get()
}

///|
/// COND_SWAP
fn step_51() -> Unit raise {
  let t184 = @simp.rewrite_tac(@list.List([]))
  let t183 = bool_cases_tac(@term_syntax.parse_term("(p : Bool)"))
  let t185 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t183),
    t184,
  )
  cond_swap_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ p : Bool, ∀ x : A, ∀ y : A, (if !p { x } else { y }) == (if p { y } else { x })"),
      t185,
    ),
  )
}

///|
let cond_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_SWAP")

///|
/// `COND_SWAP`
pub fn cond_swap() -> @kernel.Thm {
  cond_swap_c.get()
}

///|
/// TAUT
fn step_52() -> Unit raise {
  let prop_rewrite_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @simp.rewrite_tac(@list.List([]))
  let rtaut_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = fn(
    x186 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise {
    let (asl, w) = x186
    let ok : (@kernel.Term) -> Bool raise = fn(
      x187 : @kernel.Term,
    ) -> Bool raise {
      let t = x187
      @kernel.type_of(t) == @kernel.bool_ty &&
      @lib.can(
        (x189 : @kernel.Term) => {
          @basics.find_term(
            fn(x188 : @kernel.Term) -> Bool raise { @kernel.is_var(x188) },
            x189,
          )
        },
        t,
      ) &&
      @basics.free_in(t, w)
    }
    let t193 = (fn(
      x190 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise,
    ) -> ((
      ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise) raise {
      let t1 = x190
      fn(
        x191 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let t2 = x191
        @tactics.then_tac(t1, t2)
      }
    })(@simp.rewrite_tac(@list.List([])))
    @tactics.then_tac(prop_rewrite_tac, fn(
      x204 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      (fn(
        x203 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        (fn(
          x201 : @kernel.Term,
        ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise) raise {
          (fn(
            x199 : @list.List[@kernel.Term],
          ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
            (
              @list.List[@kernel.Term],
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
            ),
            @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
            (
              (
                @list.List[(Int64, @kernel.Term)],
                @list.List[(@kernel.Term, @kernel.Term)],
                @list.List[(@kernel.HolType, @kernel.HolType)],
              ),
              @list.List[@kernel.Thm],
            ) -> @kernel.Thm raise,
          ) raise) raise {
            (fn(
              x195 : @list.List[@kernel.Term],
            ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
              (
                @list.List[@kernel.Term],
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
              ),
              @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
              (
                (
                  @list.List[(Int64, @kernel.Term)],
                  @list.List[(@kernel.Term, @kernel.Term)],
                  @list.List[(@kernel.HolType, @kernel.HolType)],
                ),
                @list.List[@kernel.Thm],
              ) -> @kernel.Thm raise,
            ) raise) raise {
              (fn(
                x194 : @kernel.Term,
              ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                (
                  @list.List[@kernel.Term],
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                ),
                @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
                (
                  (
                    @list.List[(Int64, @kernel.Term)],
                    @list.List[(@kernel.Term, @kernel.Term)],
                    @list.List[(@kernel.HolType, @kernel.HolType)],
                  ),
                  @list.List[@kernel.Thm],
                ) -> @kernel.Thm raise,
              ) raise) raise {
                t193(bool_cases_tac(x194))
              })(@lib.hd(x195))
            })(
              ((x198 : @list.List[@kernel.Term]) => {
                @lib.sort(
                  fn(x196 : @kernel.Term, x197 : @kernel.Term) -> Bool raise {
                    @basics.free_in(x196, x197)
                  },
                  x198,
                )
              })(x199),
            )
          })(((x200 : @kernel.Term) => @basics.find_terms(ok, x200))(x201))
        })(
          (fn(
            x202 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> @kernel.Term raise {
            x202.1
          })(x203),
        )
      })(x204)(x204)
    })((asl, w))
  }
  let t205 = @tactics.repeat_tac(rtaut_tac)
  let taut_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise = @tactics.then_tac(
    @tactics.repeat_tac(
      @tactics.orelse_tac(@tactics.gen_tac, @tactics.conj_tac),
    ),
    t205,
  )
  taut_c.set(fn(x206 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x206
    @tactics.prove(tm, taut_tac) catch {
      Failure(_) =>
        raise Failure(
          "TAUT `" + (@printer.string_of_term(tm) + "`: cannot solve"),
        )
      e => raise e
    }
  })
}

///|
let taut_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "TAUT",
)

///|
/// `TAUT`
pub fn taut(x : @kernel.Term) -> @kernel.Thm raise {
  taut_c.get()(x)
}

///|
/// MONO_COND
fn step_53() -> Unit raise {
  let t207 = @simp.asm_rewrite_tac(@list.List([]))
  let t208 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.strip_tac,
      bool_cases_tac(@term_syntax.parse_term("(b : Bool)")),
    ),
    t207,
  )
  mono_cond_c.set(
    @tactics.prove(
      @term_syntax.parse_term("((A : Bool) → (B : Bool)) && ((C : Bool) → (D : Bool)) → (if (b : Bool) { A } else { C }) → (if b { B } else { D })"),
      t208,
    ),
  )
}

///|
let mono_cond_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONO_COND")

///|
/// `MONO_COND`
pub fn mono_cond() -> @kernel.Thm {
  mono_cond_c.get()
}

///|
/// class.ml:393
fn step_54() -> Unit raise {
  @ind_defs.monotonicity_theorems().val = @ind_defs.monotonicity_theorems().val.prepend(
    mono_cond(),
  )
  ()
}

///|
/// COND_ELIM_THM
fn step_55() -> Unit raise {
  let t209 = @simp.rewrite_tac(@list.List([]))
  let t210 = @tactics.then_tac(
    bool_cases_tac(@term_syntax.parse_term("(c : Bool)")),
    t209,
  )
  cond_elim_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(P : (A) -> Bool)(if (c : Bool) { (x : A) } else { (y : A) }) == ((c → P(x)) && (!c → P(y)))"),
      t210,
    ),
  )
}

///|
let cond_elim_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COND_ELIM_THM")

///|
/// `COND_ELIM_THM`
pub fn cond_elim_thm() -> @kernel.Thm {
  cond_elim_thm_c.get()
}

///|
/// COND_ELIM_CONV
fn step_56() -> Unit raise {
  cond_elim_conv_c.set(
    @drule.higher_rewrite_conv(@list.List([cond_elim_thm()]))(true),
  )
}

///|
let cond_elim_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new(
  "COND_ELIM_CONV",
)

///|
/// `COND_ELIM_CONV`
pub fn cond_elim_conv(x : @kernel.Term) -> @kernel.Thm raise {
  cond_elim_conv_c.get()(x)
}

///|
/// COND_CASES_TAC
fn step_57() -> Unit raise {
  let deneg_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
    fn(
      x211 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x211
    },
    @list.List([taut(@term_syntax.parse_term("!!(p : Bool) == p"))]),
  )
  let t219 = @tactics.disch_then(fn(
    x215 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let th_1 = x215
    try {
      let th_p = deneg_rule(th_1)
      let t217 = @tactics.subst1_tac(@bool.eqt_intro(th_p))
      @tactics.then_tac(@tactics.assume_tac(th_p), t217)
    } catch {
      Failure(_) => {
        let t218 = @tactics.subst1_tac(@bool.eqf_intro(th_1))
        @tactics.then_tac(@tactics.assume_tac(th_1), t218)
      }
      e => raise e
    }
  })
  let t220 = @list.List([
    @tactics.disch_then(fn(
      x212 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let th = x212
      let t214 = @tactics.subst1_tac(@bool.eqt_intro(th))
      @tactics.then_tac(@tactics.assume_tac(th), t214)
    }),
    t219,
  ])
  cond_cases_tac_c.set(
    @tactics.thenl(
      @tactics.then_tac(@tactics.conv_tac(cond_elim_conv), @tactics.conj_tac),
      t220,
    ),
  )
}

///|
let cond_cases_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new(
  "COND_CASES_TAC",
)

///|
/// `COND_CASES_TAC`
pub fn cond_cases_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  cond_cases_tac_c.get()(x)
}

///|
/// SKOLEM_THM
fn step_58() -> Unit raise {
  let t227 = @tactics.pop_assum(fn(
    x224 : @kernel.Thm,
  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
    (
      @list.List[@kernel.Term],
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
    ),
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise {
    let s225 = @tactics.match_accept_tac(x224)
    fn(
      x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
    ) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise {
      s225(x226)
    }
  })
  let t222 = @tactics.exists_tac(@term_syntax.parse_term("(y : (A) -> B)((x : A))"))
  let t221 = @tactics.conv_tac(select_conv)
  let t223 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.exists_tac(@term_syntax.parse_term("(x : A) => select((y : B) => (P : (A, B) -> Bool)(x, y))")),
          @tactics.gen_tac,
        ),
        @tactics.beta_tac,
      ),
      t221,
    ),
    t222,
  ])
  let t228 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.repeat_tac(
        @tactics.orelse_tac(@tactics.strip_tac, @tactics.eq_tac),
      ),
      t223,
    ),
    t227,
  )
  skolem_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, (∀ x : A, ∃ y : B, P(x, y)) == (∃ y : (A) -> B, ∀ x : A, P(x, y(x)))"),
      t228,
    ),
  )
}

///|
let skolem_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SKOLEM_THM")

///|
/// `SKOLEM_THM`
pub fn skolem_thm() -> @kernel.Thm {
  skolem_thm_c.get()
}

///|
/// SKOLEM_THM_GEN
fn step_59() -> Unit raise {
  let t229 = @simp.rewrite_tac(
    @list.List([right_imp_exists_thm(), skolem_thm()]),
  )
  skolem_thm_gen_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A) -> Bool, ∀ R : (A, B) -> Bool, (∀ x : A, P(x) → (∃ y : B, R(x, y))) == (∃ f : (A) -> B, ∀ x : A, P(x) → R(x, f(x)))"),
      t229,
    ),
  )
}

///|
let skolem_thm_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SKOLEM_THM_GEN")

///|
/// `SKOLEM_THM_GEN`
pub fn skolem_thm_gen() -> @kernel.Thm {
  skolem_thm_gen_c.get()
}

///|
/// UNIQUE_SKOLEM_ALT
fn step_60() -> Unit raise {
  let t230 = @tactics.then_tac(
    @tactics.gen_tac,
    @simp.rewrite_tac(@list.List([@theorems.exists_unique_alt(), skolem_thm()])),
  )
  unique_skolem_alt_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, (∀ x : A, existsunique((y : B) => P(x, y))) == (∃ f : (A) -> B, ∀ x : A, ∀ y : B, P(x, y) == (f(x) == y))"),
      t230,
    ),
  )
}

///|
let unique_skolem_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "UNIQUE_SKOLEM_ALT",
)

///|
/// `UNIQUE_SKOLEM_ALT`
pub fn unique_skolem_alt() -> @kernel.Thm {
  unique_skolem_alt_c.get()
}

///|
/// UNIQUE_SKOLEM_THM
fn step_61() -> Unit raise {
  let t260 = @simp.rewrite_tac(@list.List([]))
  let t257 = @term_syntax.parse_term("(x : A)")
  let t261 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x259 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      (fn(
        x252 : @kernel.Thm,
      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise) raise {
        let s253 = @tactics.mp_tac(x252)
        fn(
          x254 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
        ) -> (
          (
            @list.List[@kernel.Term],
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
          ),
          @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
          (
            (
              @list.List[(Int64, @kernel.Term)],
              @list.List[(@kernel.Term, @kernel.Term)],
              @list.List[(@kernel.HolType, @kernel.HolType)],
            ),
            @list.List[@kernel.Thm],
          ) -> @kernel.Thm raise,
        ) raise {
          s253(x254)
        }
      })(
        (fn(x258 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x255 : @kernel.Thm,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x256 : @kernel.Term) -> @kernel.Thm raise {
              @equal.ap_thm(x255, x256)
            }
          })(x258)(t257)
        })(x259),
      )
    }),
    t260,
  )
  let t251 = @simp.asm_rewrite_tac(@list.List([]))
  let t250 = @tactics.repeat_tac(@tactics.strip_tac)
  let t262 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t250),
          @tactics.beta_tac,
        ),
        cond_cases_tac,
      ),
      t251,
    ),
    t261,
  ])
  let t249 = @tactics.subgoal_then(
    @term_syntax.parse_term("((z : A) => if z == (x : A) { (y1 : B) } else { (f : (A) -> B)(z) }) == ((z : A) => if z == x { (y2 : B) } else { f(z) })"),
    fn(
      x246 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s247 = @tactics.mp_tac(x246)
      fn(
        x248 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s247(x248)
      }
    },
  )
  let t243 = @term_syntax.parse_term("(f : (A) -> B)")
  let t245 = @tactics.first_assum((x244 : @kernel.Thm) => {
    @tactics.x_choose_tac(t243, x244)
  })
  let t241 = @term_syntax.parse_term("(y2 : B)")
  let t242 = @term_syntax.parse_term("(y1 : B)")
  let t263 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.map_every(
            @tactics.x_gen_tac,
            @list.List([@term_syntax.parse_term("(x : A)"), t242, t241]),
          ),
          @tactics.strip_tac,
        ),
        t245,
      ),
      t249,
    ),
    t262,
  )
  let t240 = @simp.asm_rewrite_tac(@list.List([]))
  let t239 = @tactics.exists_tac(@term_syntax.parse_term("(x : A)"))
  let t238 = @tactics.first_assum(@tactics.match_mp_tac)
  let t237 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : A)"))
  let t236 = @simp.once_rewrite_tac(@list.List([fun_eq_thm()]))
  let t264 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t236),
            t237,
          ),
          t238,
        ),
        t239,
      ),
      t240,
    ),
    t263,
  ])
  let t235 = @simp.asm_rewrite_tac(@list.List([]))
  let t234 = @tactics.disch_then(
    @tactics.conjuncts_then(fn(
      x231 : @kernel.Thm,
    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
      (
        @list.List[@kernel.Term],
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
      ),
      @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
      (
        (
          @list.List[(Int64, @kernel.Term)],
          @list.List[(@kernel.Term, @kernel.Term)],
          @list.List[(@kernel.HolType, @kernel.HolType)],
        ),
        @list.List[@kernel.Thm],
      ) -> @kernel.Thm raise,
    ) raise) raise {
      let s232 = @tactics.assume_tac(x231)
      fn(
        x233 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
      ) -> (
        (
          @list.List[@kernel.Term],
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
        ),
        @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
        (
          (
            @list.List[(Int64, @kernel.Term)],
            @list.List[(@kernel.Term, @kernel.Term)],
            @list.List[(@kernel.HolType, @kernel.HolType)],
          ),
          @list.List[@kernel.Thm],
        ) -> @kernel.Thm raise,
      ) raise {
        s232(x233)
      }
    }),
  )
  let t265 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @simp.rewrite_tac(
              @list.List([
                @theorems.exists_unique_thm(),
                skolem_thm(),
                @theorems.forall_and_thm(),
              ]),
            ),
          ),
          @tactics.eq_tac,
        ),
        t234,
      ),
      t235,
    ),
    t264,
  )
  unique_skolem_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (A, B) -> Bool, (∀ x : A, existsunique((y : B) => P(x, y))) == existsunique((f : (A) -> B) => ∀ x : A, P(x, f(x)))"),
      t265,
    ),
  )
}

///|
let unique_skolem_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "UNIQUE_SKOLEM_THM",
)

///|
/// `UNIQUE_SKOLEM_THM`
pub fn unique_skolem_thm() -> @kernel.Thm {
  unique_skolem_thm_c.get()
}

///|
/// class.ml:463
fn step_62() -> Unit raise {
  let cond_cong = taut(
    @term_syntax.parse_term("(g : Bool) == (g' : Bool) → (g' → (t : _) == (t' : _)) → (!g' → (e : _) == (e' : _)) → (if g { t } else { e }) == (if g' { t' } else { e' })"),
  )
  @simp.extend_basic_congs(@list.List([cond_cong]))
}

///|
/// class.ml:470
fn step_63() -> Unit raise {
  let t266 = @simp.rewrite_tac(@list.List([]))
  let cond_eq_clause = @tactics.prove(
    @term_syntax.parse_term("(if (x : _) == x { (y : _) } else { (z : _) }) == y"),
    t266,
  )
  @simp.extend_basic_rewrites(@list.List([cond_eq_clause]))
}

///|
/// bool_INDUCT
fn step_64() -> Unit raise {
  let t268 = @simp.asm_rewrite_tac(@list.List([]))
  let t267 = @tactics.disj_cases_tac(
    @bool.spec(@term_syntax.parse_term("(x : Bool)"), bool_cases_ax()),
  )
  let t269 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t267),
    t268,
  )
  bool_induct_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ P : (Bool) -> Bool, P(false) && P(true) → (∀ x : Bool, P(x))"), t269),
  )
}

///|
let bool_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bool_INDUCT")

///|
/// `bool_INDUCT`
pub fn bool_induct() -> @kernel.Thm {
  bool_induct_c.get()
}

///|
/// bool_RECURSION
fn step_65() -> Unit raise {
  let t271 = @simp.rewrite_tac(@list.List([]))
  let t270 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : Bool) => if x { (b : A) } else { (a : A) }"),
  )
  let t272 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t270),
    t271,
  )
  bool_recursion_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ a : A, ∀ b : A, ∃ f : (Bool) -> A, f(false) == a && f(true) == b"), t272),
  )
}

///|
let bool_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bool_RECURSION")

///|
/// `bool_RECURSION`
pub fn bool_recursion() -> @kernel.Thm {
  bool_recursion_c.get()
}

///|
/// inductive_type_store
fn step_66() -> Unit raise {
  inductive_type_store_c.set(Ref::{
    val: @list.List([("bool", (2L, bool_induct(), bool_recursion()))]),
  })
}

///|
let inductive_type_store_c : @lib.Cell[
  Ref[@list.List[(String, (Int64, @kernel.Thm, @kernel.Thm))]],
] = @lib.Cell::new("inductive_type_store")

///|
/// `inductive_type_store`
pub fn inductive_type_store() -> Ref[
  @list.List[(String, (Int64, @kernel.Thm, @kernel.Thm))],
] {
  inductive_type_store_c.get()
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
}
