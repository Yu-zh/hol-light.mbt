// Translated from upstream quot.ml; edit this file directly.

///|
/// `define_quotient_type`
pub fn define_quotient_type(
  x1 : String,
  x2 : (String, String),
  x3 : @kernel.Term,
) -> (@kernel.Thm, @kernel.Thm) raise {
  let tyname = x1
  let (absname, repname) = x2
  let eqv = x3
  let ty = @lib.hd(@kernel.dest_type(@kernel.type_of(eqv)).1)
  let pty = @basics.mk_fun_ty(ty, @kernel.bool_ty)
  let s = @kernel.mk_var("s", pty)
  let x = @kernel.mk_var("x", ty)
  let eqvx = @kernel.mk_comb(eqv, x)
  let pred = @kernel.mk_abs(s, @bool.mk_exists(x, @basics.mk_eq(s, eqvx)))
  let th0 = @equal.beta_conv(@kernel.mk_comb(pred, eqvx))
  let t4 = @kernel.refl(eqvx)
  let th1 = @bool.exists_rule(@kernel.rand(@kernel.concl(th0)), x, t4)
  let th2 = @kernel.eq_mp(@equal.sym(th0), th1)
  let (abs, rep) = @kernel.new_basic_type_definition(
    tyname, absname, repname, th2,
  )
  (abs, @equal.conv_rule(@equal.land_conv(@equal.beta_conv), rep))
}

///|
/// lift_function
fn step_1() -> Unit raise {
  let t12 = @tactics.match_accept_tac(@class.select_refl())
  let t13 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.gen_rewrite_tac(
        fn(
          x11 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x5 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s6 = @equal.land_conv(x5)
            fn(x7 : @kernel.Term) -> @kernel.Thm raise { s6(x7) }
          })(
            (fn(
              x8 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s9 = @equal.binder_conv(x8)
              fn(x10 : @kernel.Term) -> @kernel.Thm raise { s9(x10) }
            })(x11),
          )
        },
        @list.List([@theorems.eq_sym_eq()]),
      ),
    ),
    t12,
  )
  let select_lemma = @tactics.prove(
    @term_syntax.parse_term("∀ x : A, select((y : A) => x == y) == x"),
    t13,
  )
  lift_function_c.set(fn(
    x14 : @kernel.Thm,
  ) -> (((@kernel.Thm, @kernel.Thm)) -> ((String) -> ((@kernel.Thm) -> (
    @kernel.Thm,
    @kernel.Thm,
  ) raise) raise) raise) raise {
    let tybij2 = x14
    let (tybl, tybr) = @kernel.dest_comb(@kernel.concl(tybij2))
    let eqvx = @kernel.rand(@basics.body(@kernel.rand(@kernel.rand(tybl))))
    let (eqv, xtm) = @kernel.dest_comb(eqvx)
    let (dmr, rtm) = @kernel.dest_eq(tybr)
    let (dest, mrt) = @kernel.dest_comb(dmr)
    let mk = @kernel.rator(mrt)
    let ety = @kernel.type_of(mrt)
    fn(
      x16 : (@kernel.Thm, @kernel.Thm),
    ) -> ((String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise {
      let (refl_th, trans_th) = x16
      fn(
        x17 : String,
      ) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise {
        let fname = x17
        fn(x18 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
          let wth = x18
          let wtm = @lib.repeat(
            fn(x20 : @kernel.Term) -> @kernel.Term raise {
              (fn(x19 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                x19.1
              })(@basics.dest_forall(x20))
            },
            @kernel.concl(wth),
          )
          let wfvs = @kernel.frees(wtm)
          let (hyps, con) = try {
            let t23 = @basics.dest_imp(wtm)
            let t24 = (fn(x22 : @kernel.Term) -> @kernel.Term raise { x22 })(
              t23.1,
            )
            (
              (fn(x21 : @kernel.Term) -> @list.List[@kernel.Term] raise {
                @basics.conjuncts(x21)
              })(t23.0),
              t24,
            )
          } catch {
            Failure(_) => (@list.List([]), wtm)
            e => raise e
          }
          let (eqs, rels) = @lib.partition(
            fn(x25 : @kernel.Term) -> Bool raise { @basics.is_eq(x25) },
            hyps,
          )
          let rvs = @lib.map(@equal.lhand, rels)
          let qvs = @lib.map(@equal.lhs, eqs)
          let evs = @basics.variants(
            wfvs,
            @lib.map(
              fn(x26 : @kernel.Term) -> @kernel.Term raise {
                let v = x26
                @kernel.mk_var(@kernel.dest_var(v).0, ety)
              },
              rvs,
            ),
          )
          let mems = @lib.map2(
            fn(x27 : @kernel.Term, x28 : @kernel.Term) -> @kernel.Term raise {
              let rv = x27
              let ev = x28
              @kernel.mk_comb(@kernel.mk_comb(dest, ev), rv)
            },
            rvs,
            evs,
          )
          let (lcon, rcon) = @kernel.dest_comb(con)
          let u = @kernel.variant(
            evs.concat(wfvs),
            @kernel.mk_var("u", @kernel.type_of(rcon)),
          )
          let ucon = @kernel.mk_comb(lcon, u)
          let dbod = @bool.list_mk_conj(mems.prepend(ucon))
          let detm = @bool.list_mk_exists(rvs, dbod)
          let datm = @kernel.mk_abs(u, detm)
          let def = if @basics.is_eq(con) {
            @basics.list_mk_icomb("@", @list.List([datm]))
          } else {
            @kernel.mk_comb(mk, datm)
          }
          let newargs = @lib.map(
            fn(x29 : @kernel.Term) -> @kernel.Term raise {
              let e = x29
              @equal.lhs(e) catch {
                Failure(_) => {
                  let t30 = @lib.zip(rvs, evs)
                  @lib.assoc(@equal.lhand(e), t30)
                }
                e => raise e
              }
            },
            hyps,
          )
          let rdef = @basics.list_mk_abs(newargs, def)
          let ldef = @kernel.mk_var(fname, @kernel.type_of(rdef))
          let dth = @drule.new_definition(@basics.mk_eq(ldef, rdef))
          let eth = @lib.rev_itlist(
            fn(x31 : @kernel.Term, x32 : @kernel.Thm) -> @kernel.Thm raise {
              let v_1 = x31
              let th = x32
              let t33 = @equal.ap_thm(th, v_1)
              @equal.conv_rule(@equal.rand_conv(@equal.beta_conv), t33)
            },
            newargs,
            dth,
          )
          let targs = @lib.map(
            fn(x34 : @kernel.Term) -> @kernel.Term raise {
              let v_2 = x34
              @kernel.mk_comb(mk, @kernel.mk_comb(eqv, v_2))
            },
            rvs,
          )
          let th_1 = @kernel.inst_rule(@list.List([(eqvx, rtm)]), tybij2)
          let t35 = @kernel.refl(eqvx)
          let dme_th = @kernel.eq_mp(
            th_1,
            @bool.exists_rule(@equal.lhs(@kernel.concl(th_1)), xtm, t35),
          )
          let ith = @kernel.inst_rule(@lib.zip(targs, evs), eth)
          let jth = @equal.subs(
            @lib.map(
              fn(x36 : @kernel.Term) -> @kernel.Thm raise {
                let v_3 = x36
                @kernel.inst_rule(@list.List([(v_3, xtm)]), dme_th)
              },
              rvs,
            ),
            ith,
          )
          let (apop, uxtm) = @kernel.dest_comb(@kernel.rand(@kernel.concl(jth)))
          let extm = @basics.body(uxtm)
          let (evs_1, bod) = @basics.strip_exists(extm)
          let th1 = @kernel.assume_rule(bod)
          let th2 = if evs_1 == @list.List([]) {
            th1
          } else {
            let (th2a, th2b) = @bool.conj_pair(th1)
            let t38 = @lib.map(
              fn(x37 : @kernel.Term) -> @kernel.Thm raise { @kernel.refl(x37) },
              qvs,
            )
            let ethlist = @bool.conjuncts_rule(th2b).concat(t38)
            let th2c = @lib.end_itlist(
              @bool.conj,
              @lib.map(
                fn(x39 : @kernel.Term) -> @kernel.Thm raise {
                  let v_4 = x39
                  let t40 = @equal.lhand(v_4)
                  @lib.find(
                    fn(x44 : @kernel.Thm) -> Bool raise {
                      (fn(x42 : @kernel.Term) -> Bool raise {
                        (fn(x41 : @kernel.Term) -> Bool raise { t40 == x41 })(
                          @equal.lhand(x42),
                        )
                      })(
                        (fn(x43 : @kernel.Thm) -> @kernel.Term raise {
                          @kernel.concl(x43)
                        })(x44),
                      )
                    },
                    ethlist,
                  )
                },
                hyps,
              ),
            )
            let th2d = @drule.match_mp(wth)(th2c)
            let th2e = @kernel.trans(th2d, th2a) catch {
              Failure(_) => {
                let t45 = @bool.conj(th2d, th2a)
                @drule.match_mp(trans_th)(t45)
              }
              e => raise e
            }
            @lib.itlist(@bool.simple_choose, evs_1, th2e)
          }
          let th3 = @kernel.assume_rule(@kernel.concl(th2))
          let th4 = @lib.end_itlist(
            @bool.conj,
            @lib.map(
              fn(x48 : @kernel.Term) -> @kernel.Thm raise {
                (fn(
                  x46 : @kernel.Term,
                ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
                  fn(x47 : @kernel.Thm) -> @kernel.Thm raise {
                    @bool.spec(x46, x47)
                  }
                })(x48)(refl_th)
              },
              rvs,
            ).prepend(th3),
          )
          let th5 = @lib.itlist(
            @bool.simple_exists,
            evs_1,
            @kernel.assume_rule(bod),
          )
          let th6 = @drule.match_mp(@bool.disch_all(th5))(th4)
          let t49 = @bool.disch_all(th6)
          let th7 = @bool.imp_antisym_rule(@bool.disch_all(th2), t49)
          let th8 = @kernel.trans(
            jth,
            @equal.ap_term(apop, @kernel.abs_rule(u, th7)),
          )
          let fconv : (@kernel.Term) -> @kernel.Thm raise = if @basics.is_eq(
              con,
            ) {
            @simp.rewr_conv(select_lemma)
          } else {
            @equal.rand_conv(@class.eta_conv)
          }
          let th9 = @equal.conv_rule(@equal.rand_conv(fconv), th8)
          (eth, @equal.gsym(th9))
        }
      }
    }
  })
}

///|
let lift_function_c : @lib.Cell[
  (@kernel.Thm) -> (((@kernel.Thm, @kernel.Thm)) -> ((String) -> ((@kernel.Thm) -> (
    @kernel.Thm,
    @kernel.Thm,
  ) raise) raise) raise) raise,
] = @lib.Cell::new("lift_function")

///|
/// `lift_function`
pub fn lift_function(
  x : @kernel.Thm,
) -> (((@kernel.Thm, @kernel.Thm)) -> ((String) -> ((@kernel.Thm) -> (
  @kernel.Thm,
  @kernel.Thm,
) raise) raise) raise) raise {
  lift_function_c.get()(x)
}

///|
/// lift_theorem
fn step_2() -> Unit raise {
  let t80 = @meson.asm_meson_tac(@list.List([]))
  let t79 = @tactics.conv_tac(@class.select_conv)
  let t78 = @tactics.first_assum(fn(
    x75 : @kernel.Thm,
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
    let th_1 = x75
    @simp.gen_rewrite_tac(
      fn(
        x77 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x77
      },
      @list.List([th_1]),
    )
  })
  let t74 = @simp.gen_rewrite_tac(
    fn(
      x73 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x67 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s68 = @equal.land_conv(x67)
        fn(x69 : @kernel.Term) -> @kernel.Thm raise { s68(x69) }
      })(
        (fn(
          x70 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s71 = @equal.rand_conv(x70)
          fn(x72 : @kernel.Term) -> @kernel.Thm raise { s71(x72) }
        })(x73),
      )
    },
    @list.List([@equal.gsym(@class.eta_ax())]),
  )
  let t66 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t65 = @tactics.subgoal_then(
    @term_syntax.parse_term("(dest : (Absty, Repty) -> Bool)((mk : ((Repty) -> Bool) -> Absty)((R : (Repty, Repty) -> Bool)((x : Repty)))) == R(x)"),
    fn(
      x62 : @kernel.Thm,
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
      let s63 = @tactics.subst1_tac(x62)
      fn(
        x64 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s63(x64)
      }
    },
  )
  let t61 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Repty)"))
  let t60 = @tactics.repeat_tac(
    @tactics.disch_then(fn(
      x58 : @kernel.Thm,
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
      let th = x58
      @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
    }),
  )
  let t56 = @meson.asm_meson_tac(@list.List([]))
  let t55 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t57 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t55),
      t56,
    ),
    @tactics.all_tac,
  ])
  let t54 = @tactics.match_mp_tac(
    @class.taut(
      @term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool)) && (b → a → (d : Bool)) → a && b && c && d"),
    ),
  )
  let t53 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t81 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.thenl(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.thenl(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.thenl(
                          @tactics.then_tac(
                            @tactics.strip_tac,
                            @tactics.subgoal_then(
                              @term_syntax.parse_term("∀ x : Repty, ∀ y : Repty, ((mk : ((Repty) -> Bool) -> Absty)((R : (Repty, Repty) -> Bool)(x)) == mk(R(y))) == (R(x) == R(y))"),
                              fn(
                                x50 : @kernel.Thm,
                              ) -> ((
                                (
                                  @list.List[(String, @kernel.Thm)],
                                  @kernel.Term,
                                ),
                              ) -> (
                                (
                                  @list.List[@kernel.Term],
                                  (
                                    @list.List[(Int64, @kernel.Term)],
                                    @list.List[(@kernel.Term, @kernel.Term)],
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
                                  ),
                                ),
                                @list.List[
                                  (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ],
                                (
                                  (
                                    @list.List[(Int64, @kernel.Term)],
                                    @list.List[(@kernel.Term, @kernel.Term)],
                                    @list.List[
                                      (@kernel.HolType, @kernel.HolType),
                                    ],
                                  ),
                                  @list.List[@kernel.Thm],
                                ) -> @kernel.Thm raise,
                              ) raise) raise {
                                let s51 = @tactics.assume_tac(x50)
                                fn(
                                  x52 : (
                                    @list.List[(String, @kernel.Thm)],
                                    @kernel.Term,
                                  ),
                                ) -> (
                                  (
                                    @list.List[@kernel.Term],
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                  ),
                                  @list.List[
                                    (
                                      @list.List[(String, @kernel.Thm)],
                                      @kernel.Term,
                                    ),
                                  ],
                                  (
                                    (
                                      @list.List[(Int64, @kernel.Term)],
                                      @list.List[(@kernel.Term, @kernel.Term)],
                                      @list.List[
                                        (@kernel.HolType, @kernel.HolType),
                                      ],
                                    ),
                                    @list.List[@kernel.Thm],
                                  ) -> @kernel.Thm raise,
                                ) raise {
                                  s51(x52)
                                }
                              },
                            ),
                          ),
                          t53,
                        ),
                        t54,
                      ),
                      @tactics.conj_tac,
                    ),
                    t57,
                  ),
                  t60,
                ),
                t61,
              ),
              t65,
            ),
            t66,
          ),
          t74,
        ),
        t78,
      ),
      t79,
    ),
    t80,
  )
  let pth = @tactics.prove(
    @term_syntax.parse_term("(∀ x : Repty, (R : (Repty, Repty) -> Bool)(x, x)) && (∀ x : Repty, ∀ y : Repty, R(x, y) == R(y, x)) && (∀ x : Repty, ∀ y : Repty, ∀ z : Repty, R(x, y) && R(y, z) → R(x, z)) && (∀ a : Absty, (mk : ((Repty) -> Bool) -> Absty)((dest : (Absty, Repty) -> Bool)(a)) == a) && (∀ r : (Repty) -> Bool, (∃ x : Repty, r == R(x)) == (dest(mk(r)) == r)) → (∀ x : Repty, ∀ y : Repty, R(x, y) == (mk(R(x)) == mk(R(y)))) && (∀ P : (Absty) -> Bool, (∀ x : Repty, P(mk(R(x)))) == (∀ x : Absty, P(x))) && (∀ P : (Absty) -> Bool, (∃ x : Repty, P(mk(R(x)))) == (∃ x : Absty, P(x))) && (∀ x : Absty, mk(R(select(dest(x)))) == x)"),
    t81,
  )
  lift_theorem_c.set(fn(
    x82 : (@kernel.Thm, @kernel.Thm),
  ) -> (((@kernel.Thm, @kernel.Thm, @kernel.Thm)) -> ((@list.List[@kernel.Thm]) -> ((
    @kernel.Thm,
  ) -> @kernel.Thm raise) raise) raise) raise {
    let tybij = x82
    fn(
      x83 : (@kernel.Thm, @kernel.Thm, @kernel.Thm),
    ) -> ((@list.List[@kernel.Thm]) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
      let (refl_th, sym_th, trans_th) = x83
      let tybij1 = @bool.gen_all(tybij.0)
      let tybij2 = @bool.gen_all(tybij.1)
      let cth = @lib.end_itlist(
        @bool.conj,
        @list.List([refl_th, sym_th, trans_th, tybij1, tybij2]),
      )
      let ith = @drule.match_mp(pth)(cth)
      fn(
        x85 : @list.List[@kernel.Thm],
      ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        let trths = x85
        @simp.rewrite_rule(trths.prepend(ith))
      }
    }
  })
}

///|
let lift_theorem_c : @lib.Cell[
  ((@kernel.Thm, @kernel.Thm)) -> (((@kernel.Thm, @kernel.Thm, @kernel.Thm)) -> ((
    @list.List[@kernel.Thm],
  ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise,
] = @lib.Cell::new("lift_theorem")

///|
/// `lift_theorem`
pub fn lift_theorem(
  x : (@kernel.Thm, @kernel.Thm),
) -> (((@kernel.Thm, @kernel.Thm, @kernel.Thm)) -> ((@list.List[@kernel.Thm]) -> ((
  @kernel.Thm,
) -> @kernel.Thm raise) raise) raise) raise {
  lift_theorem_c.get()(x)
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
}
