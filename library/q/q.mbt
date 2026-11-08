// Translated from upstream Library/q.ml; edit this file directly.

///|
/// parse_preterm
fn step_1() -> Unit raise {
  parse_preterm_c.set(@term_syntax.parse_preterm)
}

///|
let parse_preterm_c : @lib.Cell[(String) -> @preterm.Preterm raise] = @lib.Cell::new(
  "parse_preterm",
)

///|
/// `parse_preterm`
pub fn parse_preterm(x : String) -> @preterm.Preterm raise {
  parse_preterm_c.get()(x)
}

///|
/// `CONTEXT_common`
pub fn[TA, TB] context_common(
  x6 : (@list.List[(String, @preterm.Pretype)]) -> ((TB) -> TA raise) raise,
  x7 : @list.List[@kernel.Term],
  x8 : @kernel.Term,
  x9 : TB,
) -> TA raise {
  let f = x6
  let hs = x7
  let c = x8
  let x = x9
  let vs = @kernel.freesl(hs.prepend(c))
  f(
    @lib.map(
      fn(x10 : @kernel.Term) -> (String, @preterm.Pretype) raise {
        let x_1 = x10
        let t11 = @preterm.pretype_of_type(@kernel.type_of(x_1))
        (@printer.name_of(x_1), t11)
      },
      vs,
    ),
  )(x)
}

///|
/// `CONTEXT_TAC`
pub fn[TA, TB] context_tac(
  x12 : (@list.List[(String, @preterm.Pretype)]) -> ((
    (@list.List[(TB, @kernel.Thm)], @kernel.Term),
  ) -> TA raise) raise,
  x13 : (@list.List[(TB, @kernel.Thm)], @kernel.Term),
) -> TA raise {
  let ttac = x12
  let (asms, c) as g = x13
  context_common(
    ttac,
    @lib.map(
      fn(x16 : (TB, @kernel.Thm)) -> @kernel.Term raise {
        (fn(x14 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x14) })(
          (fn(x15 : (TB, @kernel.Thm)) -> @kernel.Thm raise { x15.1 })(x16),
        )
      },
      asms,
    ),
    c,
    g,
  )
}

///|
/// `CONTEXT_RULE`
pub fn[TA] context_rule(
  x17 : (@list.List[(String, @preterm.Pretype)]) -> ((@kernel.Thm) -> TA raise) raise,
  x18 : @kernel.Thm,
) -> TA raise {
  let r = x17
  let th = x18
  let t19 = @kernel.concl(th)
  context_common(r, @kernel.hyp(th), t19, th)
}

///|
/// `PARSES_IN_CONTEXT`
pub fn[TA, TB] parses_in_context(
  x20 : (@list.List[@kernel.Term]) -> ((
    (@list.List[(TB, @kernel.Thm)], @kernel.Term),
  ) -> TA raise) raise,
  x21 : @list.List[String],
) -> (((@list.List[(TB, @kernel.Thm)], @kernel.Term)) -> TA raise) raise {
  let ttac = x20
  let ss = x21
  (x28 : (@list.List[(TB, @kernel.Thm)], @kernel.Term)) => {
    context_tac(
      fn(
        x23 : @list.List[(String, @preterm.Pretype)],
      ) -> (((@list.List[(TB, @kernel.Thm)], @kernel.Term)) -> TA raise) raise {
        let env = x23
        ttac(
          @lib.map(
            fn(x27 : String) -> @kernel.Term raise {
              @term_syntax.parse_term_in_context(env, x27)
            },
            ss,
          ),
        )
      },
      x28,
    )
  }
}

///|
/// `PARSE_IN_CONTEXT`
pub fn[TA, TB] parse_in_context(
  x29 : (@kernel.Term) -> (((@list.List[(TB, @kernel.Thm)], @kernel.Term)) -> TA raise) raise,
  x30 : String,
) -> (((@list.List[(TB, @kernel.Thm)], @kernel.Term)) -> TA raise) raise {
  let tac = x29
  let s = x30
  parses_in_context(
    fn(
      x32 : @list.List[@kernel.Term],
    ) -> (((@list.List[(TB, @kernel.Thm)], @kernel.Term)) -> TA raise) raise {
      match x32 {
        More(t, tail=Empty) => tac(t)
        _ => raise @lib.MatchFailure("tscript.ml:91")
      }
    },
    @list.List([s]),
  )
}

///|
/// type_of_forall
fn step_2() -> Unit raise {
  type_of_forall_c.set(fn(x37 : @kernel.Term) -> @kernel.HolType raise {
    (fn(x36 : (@kernel.Term, @kernel.Term)) -> @kernel.HolType raise {
      (fn(x34 : @kernel.Term) -> @kernel.HolType raise { @kernel.type_of(x34) })(
        (fn(x35 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise { x35.0 })(
          x36,
        ),
      )
    })(@basics.dest_forall(x37))
  })
}

///|
let type_of_forall_c : @lib.Cell[(@kernel.Term) -> @kernel.HolType raise] = @lib.Cell::new(
  "type_of_forall",
)

///|
/// `type_of_forall`
pub fn type_of_forall(x : @kernel.Term) -> @kernel.HolType raise {
  type_of_forall_c.get()(x)
}

///|
/// `force_type`
pub fn force_type(
  x38 : @list.List[(String, @preterm.Pretype)]?,
) -> ((String) -> ((@kernel.HolType) -> @kernel.Term raise) raise) raise {
  let _opt_ = x38
  let env = match _opt_ {
    Some(_sth_) => _sth_
    None => @list.List([])
  }
  fn(x40 : String) -> ((@kernel.HolType) -> @kernel.Term raise) raise {
    let s = x40
    fn(x41 : @kernel.HolType) -> @kernel.Term raise {
      let ty = x41
      let pty = @preterm.pretype_of_type(ty)
      @term_syntax.parse_term_in_context(env, s, ty=pty)
    }
  }
}

///|
/// `BOOL_CONTEXT_TAC`
pub fn[TA, TB] bool_context_tac(
  x42 : (@kernel.Term) -> (((@list.List[(TB, @kernel.Thm)], @kernel.Term)) -> TA raise) raise,
  x43 : String,
) -> (((@list.List[(TB, @kernel.Thm)], @kernel.Term)) -> TA raise) raise {
  let ttac = x42
  let s = x43
  (x47 : (@list.List[(TB, @kernel.Thm)], @kernel.Term)) => {
    context_tac(
      fn(
        x45 : @list.List[(String, @preterm.Pretype)],
      ) -> (((@list.List[(TB, @kernel.Thm)], @kernel.Term)) -> TA raise) raise {
        let env = x45
        ttac(force_type(Some(env))(s)(@kernel.bool_ty))
      },
      x47,
    )
  }
}

///|
/// `SUBGOAL_THEN`
pub fn subgoal_then(
  x48 : String,
  x49 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
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
) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise {
  let s = x48
  let ttac = x49
  bool_context_tac(
    fn(
      x55 : @kernel.Term,
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
        x51 : @kernel.Term,
      ) -> ((
        (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
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
      ) raise) raise) raise {
        fn(
          x52 : (@kernel.Thm) -> ((
            (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          let s53 = @tactics.subgoal_then(x51, x52)
          fn(
            x54 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s53(x54)
          }
        }
      })(x55)(ttac)
    },
    s,
  )
}

///|
/// `SUBGOAL_TAC`
pub fn subgoal_tac(
  x56 : String,
  x57 : String,
  x58 : @list.List[
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
  ],
) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise {
  let l = x56
  let s = x57
  let tacs = x58
  bool_context_tac(
    fn(
      x66 : @kernel.Term,
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
        x62 : @kernel.Term,
      ) -> ((
        @list.List[
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
        ],
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
        fn(
          x63 : @list.List[
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
          ],
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
          let s64 = ((
            x60 : @kernel.Term,
            x61 : @list.List[
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
            ],
          ) => @tactics.subgoal_tac(l, x60, x61))(x62, x63)
          fn(
            x65 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s64(x65)
          }
        }
      })(x66)(tacs)
    },
    s,
  )
}

///|
/// ABBREV_TAC
fn step_3() -> Unit raise {
  abbrev_tac_c.set((x67 : String) => bool_context_tac(@simp.abbrev_tac, x67))
}

///|
let abbrev_tac_c : @lib.Cell[(String) -> @tactics.Tactic raise] = @lib.Cell::new(
  "ABBREV_TAC",
)

///|
/// `ABBREV_TAC`
pub fn abbrev_tac(x : String) -> @tactics.Tactic raise {
  abbrev_tac_c.get()(x)
}

///|
/// ASM_CASES_TAC
fn step_4() -> Unit raise {
  asm_cases_tac_c.set((x68 : String) => {
    bool_context_tac(@class.asm_cases_tac, x68)
  })
}

///|
let asm_cases_tac_c : @lib.Cell[(String) -> @tactics.Tactic raise] = @lib.Cell::new(
  "ASM_CASES_TAC",
)

///|
/// `ASM_CASES_TAC`
pub fn asm_cases_tac(x : String) -> @tactics.Tactic raise {
  asm_cases_tac_c.get()(x)
}

///|
/// BOOL_CASES_TAC
fn step_5() -> Unit raise {
  bool_cases_tac_c.set((x69 : String) => {
    bool_context_tac(@class.bool_cases_tac, x69)
  })
}

///|
let bool_cases_tac_c : @lib.Cell[(String) -> @tactics.Tactic raise] = @lib.Cell::new(
  "BOOL_CASES_TAC",
)

///|
/// `BOOL_CASES_TAC`
pub fn bool_cases_tac(x : String) -> @tactics.Tactic raise {
  bool_cases_tac_c.get()(x)
}

///|
/// `EXISTS_TAC`
pub fn exists_tac(
  x70 : String,
  x71 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let s = x70
  let (_, c) as g = x71
  context_tac(
    fn(
      x72 : @list.List[(String, @preterm.Pretype)],
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
      let env = x72
      let t74 = @kernel.type_of(@basics.dest_exists(c).0)
      @tactics.exists_tac(force_type(Some(env))(s)(t74))
    },
    g,
  )
}

///|
/// `SPEC_TAC`
pub fn spec_tac(
  x75 : String,
  x76 : String,
) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise) raise {
  let (u, x) = (x75, x76)
  parse_in_context(
    fn(
      x78 : @kernel.Term,
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
      let u_p = x78
      let t80 = @kernel.type_of(u_p)
      @tactics.spec_tac(u_p, force_type(None)(x)(t80))
    },
    u,
  )
}

///|
/// `SPEC`
pub fn spec(x81 : String, x82 : @kernel.Thm) -> @kernel.Thm raise {
  let s = x81
  let th = x82
  context_rule(
    fn(
      x83 : @list.List[(String, @preterm.Pretype)],
    ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let env = x83
      let t85 = type_of_forall(@kernel.concl(th))
      let t86 = force_type(Some(env))(s)(t85)
      (x87 : @kernel.Thm) => @bool.spec(t86, x87)
    },
    th,
  )
}

///|
/// `SPECL`
pub fn specl(x88 : @list.List[String], x89 : @kernel.Thm) -> @kernel.Thm raise {
  let tms = x88
  let th = x89
  @lib.rev_itlist(spec, tms, th) catch {
    Failure(_) => raise Failure("SPECL")
    e => raise e
  }
}

///|
/// `GEN`
pub fn gen(x90 : String, x91 : @kernel.Thm) -> @kernel.Thm raise {
  let s = x90
  let th = x91
  @bool.gen(
    @lib.find(
      fn(x94 : @kernel.Term) -> Bool raise {
        (fn(x92 : String) -> Bool raise { s == x92 })(
          (fn(x93 : @kernel.Term) -> String raise { @printer.name_of(x93) })(
            x94,
          ),
        )
      },
      @kernel.frees(@kernel.concl(th)),
    ) catch {
      _ => @term_syntax.parse_term(s)
    },
    th,
  )
}

///|
/// GENL
fn step_6() -> Unit raise {
  genl_c.set(fn(
    x97 : @list.List[String],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x98 : @kernel.Thm) -> @kernel.Thm raise {
      ((x95 : @list.List[String], x96 : @kernel.Thm) => {
        @lib.itlist(gen, x95, x96)
      })(x97, x98)
    }
  })
}

///|
let genl_c : @lib.Cell[
  (@list.List[String]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("GENL")

///|
/// `GENL`
pub fn genl(
  x : @list.List[String],
) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  genl_c.get()(x)
}

///|
/// `X_GEN_TAC`
pub fn x_gen_tac(
  x99 : String,
  x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let s = x99
  let (_, c) as g = x100
  let t101 = type_of_forall(c)
  @tactics.x_gen_tac(force_type(None)(s)(t101))(g)
}


///|
let real_arith_c : @lib.Cell[(String) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_ARITH",
)

///|
/// `REAL_ARITH`
pub fn real_arith(x : String) -> @kernel.Thm raise {
  real_arith_c.get()(x)
}

///|
let real_field_c : @lib.Cell[(String) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_FIELD",
)

///|
/// `REAL_FIELD`
pub fn real_field(x : String) -> @kernel.Thm raise {
  real_field_c.get()(x)
}

///|
let real_ring_c : @lib.Cell[(String) -> @kernel.Thm raise] = @lib.Cell::new(
  "REAL_RING",
)

///|
/// `REAL_RING`
pub fn real_ring(x : String) -> @kernel.Thm raise {
  real_ring_c.get()(x)
}

///|
/// REAL_ARITH, REAL_FIELD, REAL_RING
fn step_7() -> Unit raise {
  match
    @lib.map(
      fn(
        x107 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((String) -> @kernel.Thm raise) raise {
        fn(x108 : String) -> @kernel.Thm raise {
          ((x105 : (@kernel.Term) -> @kernel.Thm raise, x106 : String) => {
            x105(@term_syntax.parse_term(x106))
          })(x107, x108)
        }
      },
      @list.List([
        @calc_rat.real_arith, @calc_rat.real_field, @calc_rat.real_ring,
      ]),
    ) {
    More(real_arith, tail=More(real_field, tail=More(real_ring, tail=Empty))) => {
      real_arith_c.set(real_arith)
      real_field_c.set(real_field)
      real_ring_c.set(real_ring)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:138:8")
  }
}

///|
let arith_rule_c : @lib.Cell[(String) -> @kernel.Thm raise] = @lib.Cell::new(
  "ARITH_RULE",
)

///|
/// `ARITH_RULE`
pub fn arith_rule(x : String) -> @kernel.Thm raise {
  arith_rule_c.get()(x)
}

///|
let num_ring_c : @lib.Cell[(String) -> @kernel.Thm raise] = @lib.Cell::new(
  "NUM_RING",
)

///|
/// `NUM_RING`
pub fn num_ring(x : String) -> @kernel.Thm raise {
  num_ring_c.get()(x)
}

///|
/// ARITH_RULE, NUM_RING
fn step_8() -> Unit raise {
  match
    @lib.map(
      fn(
        x111 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((String) -> @kernel.Thm raise) raise {
        fn(x112 : String) -> @kernel.Thm raise {
          ((x109 : (@kernel.Term) -> @kernel.Thm raise, x110 : String) => {
            x109(@term_syntax.parse_term(x110))
          })(x111, x112)
        }
      },
      @list.List([@int.arith_rule, @grobner.num_ring]),
    ) {
    More(arith_rule, tail=More(num_ring, tail=Empty)) => {
      arith_rule_c.set(arith_rule)
      num_ring_c.set(num_ring)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:141:8")
  }
}

///|
/// INT_ARITH
fn step_9() -> Unit raise {
  int_arith_c.set((x113 : String) => {
    @int.int_arith(@term_syntax.parse_term(x113))
  })
}

///|
let int_arith_c : @lib.Cell[(String) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_ARITH",
)

///|
/// `INT_ARITH`
pub fn int_arith(x : String) -> @kernel.Thm raise {
  int_arith_c.get()(x)
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
}
