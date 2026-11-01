// Translated from upstream thecops.ml; edit this file directly.

///|
/// hashek_def
fn step_1() -> Unit raise {
  hashek_def_c.set(@drule.new_definition(@term_syntax.parse_term("(hashek : Bool) == true")))
}

///|
let hashek_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hashek_def")

///|
/// `hashek_def`
pub fn hashek_def() -> @kernel.Thm {
  hashek_def_c.get()
}

///|
/// hashek_tm
fn step_2() -> Unit raise {
  hashek_tm_c.set(@term_syntax.parse_term("hashek"))
}

///|
let hashek_tm_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("hashek_tm")

///|
/// `hashek_tm`
pub fn hashek_tm() -> @kernel.Term {
  hashek_tm_c.get()
}

///|
/// hashek_thm
fn step_3() -> Unit raise {
  let t1 = @simp.simp_tac(@list.List([hashek_def()]))
  hashek_thm_c.set(@tactics.prove(@term_syntax.parse_term("hashek"), t1))
}

///|
let hashek_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hashek_thm")

///|
/// `hashek_thm`
pub fn hashek_thm() -> @kernel.Thm {
  hashek_thm_c.get()
}

///|
/// hashek_prop
fn step_4() -> Unit raise {
  let t2 = @simp.simp_tac(@list.List([hashek_def()]))
  hashek_prop_c.set(
    @tactics.prove(
      @term_syntax.parse_term("((x : Bool) && hashek → (y : Bool) && hashek) → x → y"),
      t2,
    ),
  )
}

///|
let hashek_prop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hashek_prop")

///|
/// `hashek_prop`
pub fn hashek_prop() -> @kernel.Thm {
  hashek_prop_c.get()
}

///|
/// hashek_eq
fn step_5() -> Unit raise {
  let t3 = @simp.simp_tac(@list.List([hashek_def()]))
  hashek_eq_c.set(@tactics.prove(@term_syntax.parse_term("!hashek == false"), t3))
}

///|
let hashek_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hashek_eq")

///|
/// `hashek_eq`
pub fn hashek_eq() -> @kernel.Thm {
  hashek_eq_c.get()
}

///|
/// `MARK_CONCL`
pub fn mark_concl(x4 : String) -> @tactics.Tactic raise {
  let label = x4
  let t36 = @class.refute_then(fn(
    x33 : @kernel.Thm,
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
    let s34 = @tactics.assume_tac(x33)
    fn(
      x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s34(x35)
    }
  })
  let t32 = @tactics.disch_then(fn(
    x27 : @kernel.Thm,
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
    let th_1 = x27
    @tactics.every(
      @lib.map(
        fn(
          x29 : @kernel.Thm,
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
          let s30 = @tactics.assume_tac(x29)
          fn(
            x31 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s30(x31)
          }
        },
        @bool.conjuncts_rule(th_1),
      ),
    )
  })
  let t26 = @tactics.match_mp_tac(hashek_prop())
  let t13 = @tactics.pop_assum_list(fn(
    x11 : @list.List[@kernel.Thm],
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
    let l = x11
    @tactics.assume_tac(
      if l == @list.List([]) {
        @bool.truth()
      } else {
        @lib.end_itlist(@bool.conj, l)
      },
    )
  })
  let t10 = @simp.rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("∀ t : Bool, (!t → false) == t"))]),
  )
  @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.use_then(label, fn(
                    x6 : @kernel.Thm,
                  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                    (
                      @list.List[@kernel.Term],
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                    ),
                    @list.List[
                      (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ],
                    (
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                      @list.List[@kernel.Thm],
                    ) -> @kernel.Thm raise,
                  ) raise) raise {
                    let th = x6
                    @tactics.undisch_tac(@kernel.concl(th))
                  }),
                  fn(
                    x8 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> (
                    (
                      @list.List[@kernel.Term],
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                    ),
                    @list.List[
                      (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ],
                    (
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                      @list.List[@kernel.Thm],
                    ) -> @kernel.Thm raise,
                  ) raise {
                    let g = x8
                    if @basics.is_imp(g.1) {
                      ()
                    } else {
                      raise @lib.AssertFailure("tscript.ml:27:5")
                    }
                    let t9 = @term_syntax.parse_term("false")
                    if @basics.dest_imp(g.1).1 == t9 {
                      ()
                    } else {
                      raise @lib.AssertFailure("tscript.ml:30:5")
                    }
                    @tactics.all_tac(g)
                  },
                ),
                t10,
              ),
              t13,
            ),
            fn(
              x14 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              let g_1 = x14
              if Int::to_int64(@lib.length(g_1.0)) == 1L {
                ()
              } else {
                raise @lib.AssertFailure("tscript.ml:36:12")
              }
              @tactics.all_tac(g_1)
            },
          ),
          fn(
            x25 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              ((x22 : @list.List[(String, @kernel.Thm)]) => {
                @tactics.map_every(
                  fn(
                    x21 : (String, @kernel.Thm),
                  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                    (
                      @list.List[@kernel.Term],
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                    ),
                    @list.List[
                      (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ],
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
                      x19 : @kernel.Thm,
                    ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                      (
                        @list.List[@kernel.Term],
                        (
                          @list.List[(Int64, @kernel.Term)],
                          @list.List[(@kernel.Term, @kernel.Term)],
                          @list.List[(@kernel.HolType, @kernel.HolType)],
                        ),
                      ),
                      @list.List[
                        (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ],
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
                        x15 : @kernel.Term,
                      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                        (
                          @list.List[@kernel.Term],
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                        ),
                        @list.List[
                          (@list.List[(String, @kernel.Thm)], @kernel.Term),
                        ],
                        (
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                          @list.List[@kernel.Thm],
                        ) -> @kernel.Thm raise,
                      ) raise) raise {
                        let s16 = @tactics.undisch_tac(x15)
                        fn(
                          x17 : (
                            @list.List[(String, @kernel.Thm)],
                            @kernel.Term,
                          ),
                        ) -> (
                          (
                            @list.List[@kernel.Term],
                            (
                              @list.List[(Int64, @kernel.Term)],
                              @list.List[(@kernel.Term, @kernel.Term)],
                              @list.List[(@kernel.HolType, @kernel.HolType)],
                            ),
                          ),
                          @list.List[
                            (@list.List[(String, @kernel.Thm)], @kernel.Term),
                          ],
                          (
                            (
                              @list.List[(Int64, @kernel.Term)],
                              @list.List[(@kernel.Term, @kernel.Term)],
                              @list.List[(@kernel.HolType, @kernel.HolType)],
                            ),
                            @list.List[@kernel.Thm],
                          ) -> @kernel.Thm raise,
                        ) raise {
                          s16(x17)
                        }
                      })(
                        (fn(x18 : @kernel.Thm) -> @kernel.Term raise {
                          @kernel.concl(x18)
                        })(x19),
                      )
                    })(
                      (fn(x20 : (String, @kernel.Thm)) -> @kernel.Thm raise {
                        x20.1
                      })(x21),
                    )
                  },
                  x22,
                )
              })(
                (fn(
                  x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                ) -> @list.List[(String, @kernel.Thm)] raise {
                  x23.0
                })(x24),
              )
            })(x25)(x25)
          },
        ),
        t26,
      ),
      t32,
    ),
    t36,
  )
}

///|
/// MARK_ASSUMS
fn step_6() -> Unit raise {
  let t37 = @term_syntax.parse_term("hashek")
  mark_assums_c.set(
    @tactics.rule_assum_tac((x38 : @kernel.Thm) => @bool.disch(t37, x38)),
  )
}

///|
let mark_assums_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("MARK_ASSUMS")

///|
/// `MARK_ASSUMS`
pub fn mark_assums(x : @tactics.Goal) -> @tactics.Goalstate raise {
  mark_assums_c.get()(x)
}

///|
/// `strom`
pub type Strom[TA] = (Unit) -> TA raise

///|
/// `exception End_of_strom`
pub(all) suberror End_of_strom {
  End_of_strom
}

///|
/// `nil`
pub fn[TA] nil(x39 : Unit) -> TA raise {
  let _ = x39
  raise End_of_strom::End_of_strom
}

///|
/// `cons`
pub fn[TA] cons(
  x40 : TA,
  x41 : (Unit) -> TA raise,
) -> ((Unit) -> TA raise) raise {
  let x = x40
  let l = x41
  let past = Ref::{ val: false, }
  fn(x43 : Unit) -> TA raise {
    let _ = x43
    if past.val {
      l(())
    } else {
      {
        past.val = true
        ()
      }
      x
    }
  }
}

///|
/// `append`
pub fn[TA] append(
  x44 : (Unit) -> TA raise,
  x45 : (Unit) -> TA raise,
) -> ((Unit) -> TA raise) raise {
  let xs = x44
  let ys = x45
  let past = Ref::{ val: false, }
  fn(x47 : Unit) -> TA raise {
    let _ = x47
    if past.val {
      ys(())
    } else {
      xs(()) catch {
        End_of_strom::End_of_strom => {
          {
            past.val = true
            ()
          }
          ys(())
        }
        e => raise e
      }
    }
  }
}

///|
/// `of_list`
pub fn[TA] of_list(x48 : @list.List[TA]) -> ((Unit) -> TA raise) raise {
  let l = x48
  let r = Ref::{ val: l, }
  fn(x50 : Unit) -> TA raise {
    let _ = x50
    match r.val {
      Empty => raise End_of_strom::End_of_strom
      More(x, tail=xs) => {
        {
          r.val = xs
          ()
        }
        x
      }
    }
  }
}

///|
/// `to_list`
pub fn[TA] to_list(x51 : (Unit) -> TA raise) -> @list.List[TA] raise {
  let l = x51
  try {
    let x = l(())
    to_list(l).prepend(x)
  } catch {
    End_of_strom::End_of_strom => @list.List([])
    e => raise e
  }
}

///|
/// `iter`
pub fn[TA, TB] iter(
  x52 : (TB) -> TA raise,
  x53 : (Unit) -> TB raise,
) -> Unit raise {
  let f = x52
  let l = x53
  (x54 => iter_1_l(l, f, x54))(()) catch {
    End_of_strom::End_of_strom => ()
    e => raise e
  }
}

///|
fn[TA, TB, TC] iter_1_l(
  l : (Unit) -> TB raise,
  f : (TB) -> TA raise,
  x54 : Unit,
) -> TC raise {
  let iter_1 = (x54 : Unit) => iter_1_l(l, f, x54)
  let _ = x54
  let x = l(())
  ignore(f(x))
  iter_1(())
}

///|
/// `map`
pub fn[TA, TB] map(
  x55 : (TB) -> TA raise,
  x56 : (Unit) -> TB raise,
  x57 : Unit,
) -> TA raise {
  let _ as f = x55
  let _ as l = x56
  let _ = x57
  f(l(()))
}

///|
/// `mapi`
pub fn[TA, TB] mapi(
  x58 : (Int64) -> ((TB) -> TA raise) raise,
  x59 : (Unit) -> TB raise,
) -> ((Unit) -> TA raise) raise {
  let _ as f = x58
  let _ as l = x59
  let i = Ref::{ val: 0L, }
  fn(x61 : Unit) -> TA raise {
    let _ = x61
    let h = i.val
    @lib.incr(i)
    let t62 = l(())
    f(h)(t62)
  }
}

///|
/// `take`
pub fn[TA] take(
  x63 : Int64,
  x64 : (Unit) -> TA raise,
) -> ((Unit) -> TA raise) raise {
  let n = x63
  let l = x64
  let i = Ref::{ val: n, }
  fn(x66 : Unit) -> TA raise {
    let _ = x66
    if i.val == 0L {
      raise End_of_strom::End_of_strom
    } else {
      @lib.decr(i)
      l(())
    }
  }
}

///|
/// `take_while`
pub fn[TA] take_while(
  x67 : (TA) -> Bool raise,
  x68 : (Unit) -> TA raise,
  x69 : Unit,
) -> TA raise {
  let p = x67
  let l = x68
  let _ = x69
  let x = l(())
  if p(x) {
    x
  } else {
    raise End_of_strom::End_of_strom
  }
}

///|
/// `filter`
pub fn[TA] filter(
  x70 : (TA) -> Bool raise,
  x71 : (Unit) -> TA raise,
  x72 : Unit,
) -> TA raise {
  let p = x70
  let l = x71
  let _ = x72
  let x = l(())
  if p(x) {
    x
  } else {
    filter(p, l, ())
  }
}

///|
/// `filter_map`
pub fn[TA, TB] filter_map(
  x73 : (TB) -> TA? raise,
  x74 : (Unit) -> TB raise,
  x75 : Unit,
) -> TA raise {
  let f = x73
  let l = x74
  let _ = x75
  match f(l(())) {
    None => filter_map(f, l, ())
    Some(y) => y
  }
}

///|
/// `concat`
pub fn[TA] concat(
  x76 : (Unit) -> ((Unit) -> TA raise) raise,
) -> ((Unit) -> TA raise) raise {
  let _ as ls = x76
  let last = Ref::{ val: nil, }
  fn concat_1(x78 : Unit) -> TA raise {
    let _ = x78
    (last.val)(()) catch {
      End_of_strom::End_of_strom => {
        {
          last.val = ls(())
          ()
        }
        concat_1(())
      }
      e => raise e
    }
  }
  concat_1
}

///|
/// `concat_map`
pub fn[TA, TB] concat_map(
  x79 : (TB) -> ((Unit) -> TA raise) raise,
  x80 : (Unit) -> TB raise,
) -> ((Unit) -> TA raise) raise {
  let _ as f = x79
  let _ as l = x80
  let last = Ref::{ val: nil, }
  fn concat_map_1(x82 : Unit) -> TA raise {
    let _ = x82
    (last.val)(()) catch {
      End_of_strom::End_of_strom => {
        {
          last.val = f(l(()))
          ()
        }
        concat_map_1(())
      }
      e => raise e
    }
  }
  concat_map_1
}

///|
/// `next_opt`
pub fn[TA] next_opt(x83 : (Unit) -> TA raise) -> TA? raise {
  let l = x83
  Some(l(())) catch {
    End_of_strom::End_of_strom => None
    e => raise e
  }
}

///|
/// `cache`
pub fn[TA] cache(
  x84 : (Unit) -> ((Unit) -> TA raise) raise,
) -> ((Unit) -> TA raise) raise {
  let _ as f = x84
  let result = Ref::{ val: None, }
  fn(x86 : Unit) -> TA raise {
    let _ = x86
    match result.val {
      None => {
        let l : (Unit) -> TA raise = f(())
        {
          result.val = Some(l)
          ()
        }
        l(())
      }
      Some(l_1) => l_1(())
    }
  }
}

///|
/// `cut`
pub fn[TA] cut(
  x87 : (Unit) -> TA raise,
  x88 : (Unit) -> TA raise,
) -> ((Unit) -> TA raise) raise {
  let xs = x87
  let ys = x88
  let cut_1 = Ref::{ val: false, }
  let past = Ref::{ val: false, }
  fn(x90 : Unit) -> TA raise {
    let _ = x90
    if past.val {
      ys(())
    } else if cut_1.val {
      nil(())
    } else {
      try {
        let x = xs(())
        {
          cut_1.val = true
          ()
        }
        x
      } catch {
        End_of_strom::End_of_strom => {
          {
            past.val = true
            ()
          }
          ys(())
        }
        e => raise e
      }
    }
  }
}

///|
/// `integers_from`
pub fn integers_from(x91 : Int64) -> ((Unit) -> Int64 raise) raise {
  let n = x91
  let i = Ref::{ val: n, }
  fn(x93 : Unit) -> Int64 raise {
    let _ = x93
    let h = i.val
    @lib.incr(i)
    h
  }
}

///|
/// `var`
pub fn var_(x94 : Int64) -> @meson.FolTerm raise {
  let v = x94
  @meson.FolTerm::Fvar(v)
}

///|
/// `negate_lit`
pub fn[TA] negate_lit(x95 : Int64, x96 : TA) -> (Int64, TA) raise {
  let (i, l) = (x95, x96)
  (@lib.neg63(i), l)
}

///|
/// `term_max_var`
pub fn term_max_var(x97 : Int64, x98 : @meson.FolTerm) -> Int64 raise {
  let acc = x97
  match x98 {
    @meson.FolTerm::Fvar(x) => if acc >= x { acc } else { x }
    @meson.FolTerm::Fnapp(_, l) => @lib.fold_left(term_max_var, acc, l)
  }
}

///|
/// `lit_max_var`
pub fn[TA] lit_max_var(
  x99 : Int64,
  x100 : (TA, @list.List[@meson.FolTerm]),
) -> Int64 raise {
  let acc = x99
  let (_, a) = x100
  @lib.fold_left(term_max_var, acc, a)
}

///|
/// `map_term_vars`
pub fn map_term_vars(
  x101 : (Int64) -> @meson.FolTerm raise,
  x102 : @meson.FolTerm,
) -> @meson.FolTerm raise {
  let f = x101
  match x102 {
    @meson.FolTerm::Fvar(v) => f(v)
    @meson.FolTerm::Fnapp(p, t) =>
      @meson.FolTerm::Fnapp(
        p,
        @lib.map((x103 : @meson.FolTerm) => map_term_vars(f, x103), t),
      )
  }
}

///|
/// `map_lit_vars`
pub fn[TA] map_lit_vars(
  x104 : (Int64) -> @meson.FolTerm raise,
  x105 : (TA, @list.List[@meson.FolTerm]),
) -> (TA, @list.List[@meson.FolTerm]) raise {
  let f = x104
  let (p, a) = x105
  (p, @lib.map((x106 : @meson.FolTerm) => map_term_vars(f, x106), a))
}

///|
/// `map_term`
pub fn[TA] map_term(
  x107 : (Int64) -> TA raise,
  x108 : ((Int64, @list.List[@meson.FolTerm])) -> TA raise,
  x109 : @meson.FolTerm,
) -> TA raise {
  let fv = x107
  let fa = x108
  match x109 {
    @meson.FolTerm::Fvar(v) => fv(v)
    @meson.FolTerm::Fnapp(p, a) => fa((p, a))
  }
}

///|
/// `term_ground`
pub fn term_ground(x110 : @meson.FolTerm) -> Bool raise {
  let t = x110
  map_term(
    (x111 : Int64) => @firstorder.const_(false, x111),
    fn(x112 : (Int64, @list.List[@meson.FolTerm])) -> Bool raise {
      lit_ground(x112.0, x112.1)
    },
    t,
  )
}

///|
/// `lit_ground`
pub fn lit_ground(
  x113 : Int64,
  x114 : @list.List[@meson.FolTerm],
) -> Bool raise {
  let (p, a) = (x113, x114)
  @lib.forall(term_ground, a)
}

///|
/// `pp_interleave`
pub fn[TA, TB, TC] pp_interleave(
  x115 : (TB) -> TA raise,
  x116 : (TB) -> ((TC) -> Unit raise) raise,
  x117 : TB,
  x118 : @list.List[TC],
) -> Unit raise {
  let sep = x115
  let fn_ = x116
  let f = x117
  match x118 {
    More(x, tail=More(_, tail=_) as xs) => {
      fn_(f)(x)
      ignore(sep(f))
      pp_interleave(sep, fn_, f, xs)
    }
    More(x_1, tail=Empty) => fn_(f)(x_1)
    Empty => ()
  }
}

///|
/// `pp_iter`
pub fn[TA] pp_iter(
  x119 : String,
) -> (((@pp.Formatter) -> ((TA) -> Unit raise) raise) -> ((@pp.Formatter) -> ((
  @list.List[TA],
) -> Unit raise) raise) raise) raise {
  let sep = x119
  fn(
    x125 : (@pp.Formatter) -> ((TA) -> Unit raise) raise,
  ) -> ((@pp.Formatter) -> ((@list.List[TA]) -> Unit raise) raise) raise {
    fn(x126 : @pp.Formatter) -> ((@list.List[TA]) -> Unit raise) raise {
      fn(x127 : @list.List[TA]) -> Unit raise {
        ((
          x122 : (@pp.Formatter) -> ((TA) -> Unit raise) raise,
          x123 : @pp.Formatter,
          x124 : @list.List[TA],
        ) => {
          pp_interleave(
            fn(x121 : @pp.Formatter) -> Unit raise {
              let f = x121
              @pp.Formatter::print_string(f, sep)
            },
            x122,
            x123,
            x124,
          )
        })(x125, x126, x127)
      }
    }
  }
}

///|
/// `pp_iter_sp`
pub fn[TA] pp_iter_sp(
  x128 : String,
  x129 : (@pp.Formatter) -> ((TA) -> Unit raise) raise,
) -> ((@pp.Formatter) -> ((@list.List[TA]) -> Unit raise) raise) raise {
  let sep = x128
  let fn_ = x129
  let sep_1 : (@pp.Formatter) -> Unit raise = fn(
    x131 : @pp.Formatter,
  ) -> Unit raise {
    let f = x131
    @pp.Formatter::print_string(f, Char::to_string(' '))
    @pp.Formatter::print_string(f, sep)
    @pp.Formatter::print_space(f)
  }
  fn(x134 : @pp.Formatter) -> ((@list.List[TA]) -> Unit raise) raise {
    fn(x135 : @list.List[TA]) -> Unit raise {
      ((x132 : @pp.Formatter, x133 : @list.List[TA]) => {
        pp_interleave(sep_1, fn_, x132, x133)
      })(x134, x135)
    }
  }
}

///|
/// `pp_enclose`
pub fn[TA, TB] pp_enclose(
  x136 : String,
  x137 : String,
  x138 : (@pp.Formatter) -> ((TB) -> TA raise) raise,
  x139 : @pp.Formatter,
  x140 : TB,
) -> Unit raise {
  let start = x136
  let stop = x137
  let fn_ = x138
  let f = x139
  let x = x140
  @pp.Formatter::print_string(f, start)
  ignore(fn_(f)(x))
  @pp.Formatter::print_string(f, stop)
}

///|
/// `pp_enclose_cut`
pub fn[TA, TB] pp_enclose_cut(
  x141 : String,
  x142 : String,
  x143 : (@pp.Formatter) -> ((TA) -> TB raise) raise,
) -> ((@pp.Formatter) -> ((TA) -> Unit raise) raise) raise {
  let start = x141
  let stop = x142
  let fn_ = x143
  fn(x149 : @pp.Formatter) -> ((TA) -> Unit raise) raise {
    fn(x150 : TA) -> Unit raise {
      ((x147 : @pp.Formatter, x148 : TA) => {
        pp_enclose(
          start,
          stop,
          fn(x145 : @pp.Formatter) -> ((TA) -> Unit raise) raise {
            let f = x145
            fn(x146 : TA) -> Unit raise {
              let x = x146
              ignore(fn_(f)(x))
              @pp.Formatter::print_cut(f)
            }
          },
          x147,
          x148,
        )
      })(x149, x150)
    }
  }
}

///|
/// `pp_enum`
pub fn[TA] pp_enum(
  x151 : String,
  x152 : String,
  x153 : String,
  x154 : (@pp.Formatter) -> ((TA) -> Unit raise) raise,
) -> ((@pp.Formatter) -> ((@list.List[TA]) -> Unit raise) raise) raise {
  let sep = x151
  let start = x152
  let stop = x153
  let fn_ = x154
  let t156 = pp_iter(sep)(fn_)
  fn(x159 : @pp.Formatter) -> ((@list.List[TA]) -> Unit raise) raise {
    fn(x160 : @list.List[TA]) -> Unit raise {
      ((x157 : @pp.Formatter, x158 : @list.List[TA]) => {
        pp_enclose(start, stop, t156, x157, x158)
      })(x159, x160)
    }
  }
}

///|
/// `pp_with_box`
pub fn[TA, TB] pp_with_box(
  x161 : Int64,
  x162 : (@pp.Formatter) -> ((TB) -> TA raise) raise,
  x163 : @pp.Formatter,
  x164 : TB,
) -> Unit raise {
  let i = x161
  let fn_ = x162
  let f = x163
  let x = x164
  @pp.Formatter::open_box(f, @lib.int63_to_int(i))
  ignore(fn_(f)(x))
  @pp.Formatter::close_box(f)
}

///|
/// `pp_nl`
pub fn[TA, TB] pp_nl(
  x165 : (@pp.Formatter) -> ((TB) -> TA raise) raise,
  x166 : @pp.Formatter,
  x167 : TB,
) -> Unit raise {
  let fn_ = x165
  let f = x166
  let x = x167
  ignore(fn_(f)(x))
  @pp.Formatter::print_newline(f)
}

///|
/// `pp_print_null`
pub fn[TA, TB] pp_print_null(x168 : TA, x169 : TB) -> Unit raise {
  let f = x168
  let x = x169
  ()
}

///|
/// `pp_print_var`
pub fn pp_print_var(x170 : @pp.Formatter, x171 : Int64) -> Unit raise {
  let f = x170
  let i = x171
  @pp.Formatter::print_string(
    f,
    Char::to_string(
      @lib.char_chr(@lib.int63_to_int(@lib.add63(65L, @lib.mod63(i, 26L)))),
    ),
  )
  if i > 25L {
    @pp.Formatter::print_string(f, Int64::to_string(@lib.div63(i, 26L)))
  } else {
    ()
  }
}

///|
/// `pp_print_fterm`
pub fn pp_print_fterm(
  x172 : @pp.Formatter,
  x173 : @meson.FolTerm,
) -> Unit raise {
  let f = x172
  match x173 {
    @meson.FolTerm::Fvar(i) => pp_print_var(f, i)
    @meson.FolTerm::Fnapp(i_1, l) => {
      @printer.pp_print_term(f, @meson.hol_of_const(i_1))
      if l != @list.List([]) {
        pp_enum(",", "(", ")", fn(
          x174 : @pp.Formatter,
        ) -> ((@meson.FolTerm) -> Unit raise) raise {
          fn(x175 : @meson.FolTerm) -> Unit raise { pp_print_fterm(x174, x175) }
        })(f)(l)
      } else {
        ()
      }
    }
  }
}

///|
/// `pp_print_lit`
pub fn pp_print_lit(
  x176 : @pp.Formatter,
  x177 : (Int64, @list.List[@meson.FolTerm]),
) -> Unit raise {
  let f = x176
  let (i, l) = x177
  if i < 0L {
    @pp.Formatter::print_string(f, Char::to_string('~'))
  } else {
    ()
  }
  @printer.pp_print_term(f, @meson.hol_of_const(@lib.abs63(i)))
  if l != @list.List([]) {
    pp_enum(",", "(", ")", fn(
      x178 : @pp.Formatter,
    ) -> ((@meson.FolTerm) -> Unit raise) raise {
      fn(x179 : @meson.FolTerm) -> Unit raise { pp_print_fterm(x178, x179) }
    })(f)(l)
  } else {
    ()
  }
}

///|
/// string_of_fterm
fn step_7() -> Unit raise {
  string_of_fterm_c.set(
    @printer.print_to_string(fn(
      x180 : @pp.Formatter,
    ) -> ((@meson.FolTerm) -> Unit raise) raise {
      fn(x181 : @meson.FolTerm) -> Unit raise { pp_print_fterm(x180, x181) }
    }),
  )
}

///|
let string_of_fterm_c : @lib.Cell[(@meson.FolTerm) -> String raise] = @lib.Cell::new(
  "string_of_fterm",
)

///|
/// `string_of_fterm`
pub fn string_of_fterm(x : @meson.FolTerm) -> String raise {
  string_of_fterm_c.get()(x)
}

///|
/// string_of_lit
fn step_8() -> Unit raise {
  string_of_lit_c.set(
    @printer.print_to_string(fn(
      x182 : @pp.Formatter,
    ) -> (((Int64, @list.List[@meson.FolTerm])) -> Unit raise) raise {
      fn(x183 : (Int64, @list.List[@meson.FolTerm])) -> Unit raise {
        pp_print_lit(x182, x183)
      }
    }),
  )
}

///|
let string_of_lit_c : @lib.Cell[
  ((Int64, @list.List[@meson.FolTerm])) -> String raise,
] = @lib.Cell::new("string_of_lit")

///|
/// `string_of_lit`
pub fn string_of_lit(x : (Int64, @list.List[@meson.FolTerm])) -> String raise {
  string_of_lit_c.get()(x)
}

///|
/// string_of_lits
fn step_9() -> Unit raise {
  string_of_lits_c.set(
    @printer.print_to_string(
      pp_iter(", ")(fn(
        x184 : @pp.Formatter,
      ) -> (((Int64, @list.List[@meson.FolTerm])) -> Unit raise) raise {
        fn(x185 : (Int64, @list.List[@meson.FolTerm])) -> Unit raise {
          pp_print_lit(x184, x185)
        }
      }),
    ),
  )
}

///|
let string_of_lits_c : @lib.Cell[
  (@list.List[(Int64, @list.List[@meson.FolTerm])]) -> String raise,
] = @lib.Cell::new("string_of_lits")

///|
/// `string_of_lits`
pub fn string_of_lits(
  x : @list.List[(Int64, @list.List[@meson.FolTerm])],
) -> String raise {
  string_of_lits_c.get()(x)
}

///|
/// `contrapositive`
pub type Contrapositive = (
  @list.List[@meson.FolTerm],
  @list.List[@meson.FolAtom],
  Int64,
  (Int64, @kernel.Thm),
)

///|
/// `clause_max_var`
pub fn[TA] clause_max_var(
  x186 : @list.List[(TA, @list.List[@meson.FolTerm])],
) -> Int64 raise {
  let cl = x186
  @lib.add63(1L, @lib.fold_left(lit_max_var, -1L, cl))
}

///|
/// `mapentry`
pub fn[TA, TB] mapentry(
  x187 : (
    @list.List[(TA, @list.List[@meson.FolTerm])],
    (TA, @list.List[@meson.FolTerm]),
  ),
  x188 : TB,
) -> (
  @list.List[@meson.FolTerm],
  @list.List[(TA, @list.List[@meson.FolTerm])],
  Int64,
  TB,
) raise {
  let ((cl_rest, (p, args)), th) = (x187, x188)
  (args, cl_rest, clause_max_var(cl_rest.prepend((p, args))), th)
}

///|
/// db
fn step_10() -> Unit raise {
  db_c.set(@lib.hashtbl_create(10017))
}

///|
let db_c : @lib.Cell[@lib.OHashtbl[Int64, @list.List[Contrapositive]]] = @lib.Cell::new(
  "db",
)

///|
/// `db`
pub fn db() -> @lib.OHashtbl[Int64, @list.List[Contrapositive]] {
  db_c.get()
}

///|
/// `axioms2db`
pub fn axioms2db(x189 : @list.List[@kernel.Thm]) -> Unit raise {
  let ths = x189
  @lib.hashtbl_clear(db())
  @lib.op_bar_gt(@firstorder.fol_of_hol_clauses(ths), x193 => {
    @lib.do_list(
      fn(
        x190 : (
          Int64,
          @list.List[
            (
              (@list.List[@meson.FolAtom], (Int64, @list.List[@meson.FolTerm])),
              (Int64, @kernel.Thm),
            ),
          ],
        ),
      ) -> Unit raise {
        let (p, l) = x190
        let t192 = @lib.map(
          fn(
            x191 : (
              (@list.List[@meson.FolAtom], (Int64, @list.List[@meson.FolTerm])),
              (Int64, @kernel.Thm),
            ),
          ) -> (
            @list.List[@meson.FolTerm],
            @list.List[@meson.FolAtom],
            Int64,
            (Int64, @kernel.Thm),
          ) raise {
            mapentry(x191.0, x191.1)
          },
          l,
        )
        @lib.hashtbl_add(db(), @lib.neg63(p), t192)
      },
      x193,
    )
  })
}

///|
/// `db_entries`
pub fn[TA] db_entries(x194 : (Int64, TA)) -> @list.List[Contrapositive] raise {
  let lit = x194
  @lib.hashtbl_find(db(), lit.0) catch {
    @lib.NotFound => @list.List([])
    e => raise e
  }
}

///|
/// `lit`
pub type Lit = (Int64, @list.List[@meson.FolTerm])

///|
/// `iterm`
pub type Iterm = @meson.FolTerm

///|
/// `offset_term`
pub fn offset_term(x195 : Int64, x196 : @meson.FolTerm) -> @meson.FolTerm raise {
  let off = x195
  let tm = x196
  match tm {
    @meson.FolTerm::Fvar(v) => @meson.FolTerm::Fvar(@lib.add63(v, off))
    @meson.FolTerm::Fnapp(f, a) =>
      @meson.FolTerm::Fnapp(
        f,
        @lib.map((x197 : @meson.FolTerm) => offset_term(off, x197), a),
      )
  }
}

///|
/// `offset_lit`
pub fn[TA] offset_lit(
  x198 : Int64,
  x199 : (TA, @list.List[@meson.FolTerm]),
) -> (TA, @list.List[@meson.FolTerm]) raise {
  let off = x198
  let (p, pa) = x199
  (p, @lib.map((x200 : @meson.FolTerm) => offset_term(off, x200), pa))
}

///|
/// `exception Unify`
pub(all) suberror Unify {
  Unify
}

///|
/// `t`
pub type T = @list.List[(Int64, Iterm)]

///|
/// `istriv`
pub fn istriv(
  x201 : @list.List[(Int64, @meson.FolTerm)],
  x202 : Int64,
  x203 : @meson.FolTerm,
) -> Bool raise {
  let sub = x201
  let x = x202
  match x203 {
    @meson.FolTerm::Fvar(y) =>
      y == x ||
      (try {
        let t = @lib.list_assoc(y, sub)
        istriv(sub, x, t)
      } catch {
        @lib.NotFound => false
        e => raise e
      })
    @meson.FolTerm::Fnapp(f, a) =>
      @lib.exists((x204 : @meson.FolTerm) => istriv(sub, x, x204), a) &&
      @lib.raise_error(Unify::Unify)
  }
}

///|
/// `add_subst`
pub fn add_subst(
  x205 : @list.List[(Int64, @meson.FolTerm)],
  x206 : Int64,
  x207 : @meson.FolTerm,
) -> @list.List[(Int64, @meson.FolTerm)] raise {
  let sub = x205
  let x = x206
  let t = x207
  if istriv(sub, x, t) {
    sub
  } else {
    sub.prepend((x, t))
  }
}

///|
/// `unify_tm`
pub fn unify_tm(
  x208 : @list.List[(Int64, @meson.FolTerm)],
  x209 : @meson.FolTerm,
  x210 : @meson.FolTerm,
) -> @list.List[(Int64, @meson.FolTerm)] raise {
  let sub = x208
  let tm1 = x209
  let tm2 = x210
  match (tm1, tm2) {
    (@meson.FolTerm::Fnapp(f, fargs), @meson.FolTerm::Fnapp(g, gargs)) =>
      if f != g {
        raise Unify::Unify
      } else {
        unify_tms(sub, fargs, gargs)
      }
    (tm, @meson.FolTerm::Fvar(x)) | (@meson.FolTerm::Fvar(x), tm) =>
      try {
        let t = @lib.list_assoc(x, sub)
        unify_tm(sub, tm, t)
      } catch {
        @lib.NotFound => add_subst(sub, x, tm)
        e => raise e
      }
  }
}

///|
/// `unify_tms`
pub fn unify_tms(
  x211 : @list.List[(Int64, @meson.FolTerm)],
  x212 : @list.List[@meson.FolTerm],
  x213 : @list.List[@meson.FolTerm],
) -> @list.List[(Int64, @meson.FolTerm)] raise {
  let sub_1 = x211
  let l1 = x212
  let l2 = x213
  @lib.list_fold_left2(unify_tm, sub_1, l1, l2)
}

///|
/// `unify_lit`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] unify_lit(
  x214 : @list.List[(Int64, @meson.FolTerm)],
  x215 : (TA, @list.List[@meson.FolTerm]),
  x216 : (TA, @list.List[@meson.FolTerm]),
) -> @list.List[(Int64, @meson.FolTerm)] raise {
  let env = x214
  let (h1, l1) = x215
  let (h2, l2) = x216
  if h1 != h2 {
    raise Unify::Unify
  } else {
    unify_tms(env, l1, l2)
  }
}

///|
/// `unify_tm_off`
pub fn unify_tm_off(
  x217 : Int64,
  x218 : @list.List[(Int64, @meson.FolTerm)],
  x219 : @meson.FolTerm,
  x220 : @meson.FolTerm,
) -> @list.List[(Int64, @meson.FolTerm)] raise {
  let off = x217
  let sub = x218
  let t1 = x219
  let t2 = x220
  match (t1, t2) {
    (@meson.FolTerm::Fnapp(f, fargs), @meson.FolTerm::Fnapp(g, gargs)) =>
      if f != g {
        raise Unify::Unify
      } else {
        unify_tms_off(off)(sub)(fargs)(gargs)
      }
    (_, @meson.FolTerm::Fvar(x)) => {
      let x_1 = @lib.add63(x, off)
      try {
        let t = @lib.list_assoc(x_1, sub)
        unify_tm_off(0L, sub, t1, t)
      } catch {
        @lib.NotFound => add_subst(sub, x_1, t1)
        e => raise e
      }
    }
    (@meson.FolTerm::Fvar(x_2), _) =>
      try {
        let t_1 = @lib.list_assoc(x_2, sub)
        unify_tm_off(off, sub, t_1, t2)
      } catch {
        @lib.NotFound => add_subst(sub, x_2, offset_term(off, t2))
        e => raise e
      }
  }
}

///|
/// `unify_tms_off`
pub fn unify_tms_off(
  x221 : Int64,
) -> ((@list.List[(Int64, @meson.FolTerm)]) -> ((@list.List[@meson.FolTerm]) -> ((
  @list.List[@meson.FolTerm],
) -> @list.List[(Int64, @meson.FolTerm)] raise) raise) raise) raise {
  let off_1 = x221
  fn(
    x229 : @list.List[(Int64, @meson.FolTerm)],
  ) -> ((@list.List[@meson.FolTerm]) -> ((@list.List[@meson.FolTerm]) -> @list.List[
    (Int64, @meson.FolTerm),
  ] raise) raise) raise {
    fn(
      x230 : @list.List[@meson.FolTerm],
    ) -> ((@list.List[@meson.FolTerm]) -> @list.List[(Int64, @meson.FolTerm)] raise) raise {
      fn(
        x231 : @list.List[@meson.FolTerm],
      ) -> @list.List[(Int64, @meson.FolTerm)] raise {
        ((x226, x227, x228) => {
          @lib.list_fold_left2(
            (
              x223 : @list.List[(Int64, @meson.FolTerm)],
              x224 : @meson.FolTerm,
              x225 : @meson.FolTerm,
            ) => unify_tm_off(off_1, x223, x224, x225),
            x226,
            x227,
            x228,
          )
        })(x229, x230, x231)
      }
    }
  }
}

///|
/// `eq_var_tm`
pub fn eq_var_tm(
  x232 : @list.List[(Int64, @meson.FolTerm)],
  x233 : Int64,
  x234 : @meson.FolTerm,
) -> Bool raise {
  let sub = x232
  let x = x233
  match x234 {
    @meson.FolTerm::Fvar(y) =>
      y == x ||
      (try {
        let t = @lib.list_assoc(y, sub)
        eq_var_tm(sub, x, t)
      } catch {
        @lib.NotFound => false
        e => raise e
      })
    @meson.FolTerm::Fnapp(f, a) => false
  }
}

///|
/// `eq_term`
pub fn eq_term(
  x235 : @list.List[(Int64, @meson.FolTerm)],
  x236 : @meson.FolTerm,
  x237 : @meson.FolTerm,
) -> Bool raise {
  let sub = x235
  let tm1 = x236
  let tm2 = x237
  match (tm1, tm2) {
    (@meson.FolTerm::Fnapp(f, fa), @meson.FolTerm::Fnapp(g, ga)) =>
      f == g && eq_terms(sub)(fa)(ga)
    (_, @meson.FolTerm::Fvar(x)) =>
      try {
        let t = @lib.list_assoc(x, sub)
        eq_term(sub, tm1, t)
      } catch {
        @lib.NotFound => eq_var_tm(sub, x, tm1)
        e => raise e
      }
    (@meson.FolTerm::Fvar(x_1), _) =>
      try {
        let t_1 = @lib.list_assoc(x_1, sub)
        eq_term(sub, t_1, tm2)
      } catch {
        @lib.NotFound => eq_var_tm(sub, x_1, tm2)
        e => raise e
      }
  }
}

///|
/// `eq_terms`
pub fn eq_terms(
  x238 : @list.List[(Int64, @meson.FolTerm)],
) -> ((@list.List[@meson.FolTerm]) -> ((@list.List[@meson.FolTerm]) -> Bool raise) raise) raise {
  let sub_1 = x238
  fn(
    x244 : @list.List[@meson.FolTerm],
  ) -> ((@list.List[@meson.FolTerm]) -> Bool raise) raise {
    fn(x245 : @list.List[@meson.FolTerm]) -> Bool raise {
      ((x242, x243) => {
        @lib.list_for_all2(
          (x240 : @meson.FolTerm, x241 : @meson.FolTerm) => {
            eq_term(sub_1, x240, x241)
          },
          x242,
          x243,
        )
      })(x244, x245)
    }
  }
}

///|
/// `eq_lit`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] eq_lit(
  x246 : @list.List[(Int64, @meson.FolTerm)],
  x247 : (TA, @list.List[@meson.FolTerm]),
  x248 : (TA, @list.List[@meson.FolTerm]),
) -> Bool raise {
  let sub = x246
  let (p, pa) = x247
  let (q, qa) = x248
  p == q && eq_terms(sub)(pa)(qa)
}

///|
/// `inst_tm`
pub fn inst_tm(
  x249 : @list.List[(Int64, @meson.FolTerm)],
  x250 : @meson.FolTerm,
) -> @meson.FolTerm raise {
  let sub = x249
  match x250 {
    @meson.FolTerm::Fvar(v) =>
      try {
        let t = @lib.list_assoc(v, sub)
        inst_tm(sub, t)
      } catch {
        @lib.NotFound => @meson.FolTerm::Fvar(v)
        e => raise e
      }
    @meson.FolTerm::Fnapp(f, args) =>
      @meson.FolTerm::Fnapp(
        f,
        @lib.map((x251 : @meson.FolTerm) => inst_tm(sub, x251), args),
      )
  }
}

///|
/// `inst_lit`
pub fn[TA] inst_lit(
  x252 : @list.List[(Int64, @meson.FolTerm)],
  x253 : (TA, @list.List[@meson.FolTerm]),
) -> (TA, @list.List[@meson.FolTerm]) raise {
  let sub = x252
  let (p, l) = x253
  (p, @lib.map((x254 : @meson.FolTerm) => inst_tm(sub, x254), l))
}

///|
/// `ground_tm`
pub fn ground_tm(
  x255 : @list.List[(Int64, @meson.FolTerm)],
  x256 : @meson.FolTerm,
) -> Bool raise {
  let sub = x255
  match x256 {
    @meson.FolTerm::Fvar(v) =>
      try {
        let t = @lib.list_assoc(v, sub)
        ground_tm(sub, t)
      } catch {
        @lib.NotFound => false
        e => raise e
      }
    @meson.FolTerm::Fnapp(f, args) =>
      @lib.forall((x257 : @meson.FolTerm) => ground_tm(sub, x257), args)
  }
}

///|
/// `ground_lit`
pub fn[TA] ground_lit(
  x258 : @list.List[(Int64, @meson.FolTerm)],
  x259 : (TA, @list.List[@meson.FolTerm]),
) -> Bool raise {
  let sub = x258
  let (p, l) = x259
  @lib.forall((x260 : @meson.FolTerm) => ground_tm(sub, x260), l)
}

///|
/// `empty`
pub fn[TA, TB] empty(x261 : TB) -> @list.List[TA] raise {
  @list.List([])
}

///|
/// `to_list`
pub fn[TA] to_list_v1(x262 : TA) -> TA raise {
  let sub = x262
  sub
}

///|
/// `t`
pub type T1 = ((FixedArray[Iterm?], Ref[@list.List[Int64]]), @list.List[Int64])

///|
/// `exception Unify`
pub(all) suberror Unify1 {
  Unify
}

///|
/// `restore_subst`
pub fn[TA] restore_subst(
  x263 : (FixedArray[TA?], Ref[@list.List[Int64]]),
  x264 : @list.List[Int64],
) -> Unit raise {
  let ((suba, env), subl) = (x263, x264)
  while true {
    if !physical_equal(env.val, subl) {
      ()
    } else {
      break
    }
    match env.val {
      More(h, tail=t) => {
        @lib.array_set(suba, @lib.int63_to_int(h), None)
        env.val = t
        ()
      }
      Empty => raise Failure("restore_subst")
    }
    ()
  }
  ()
}

///|
/// `istriv`
pub fn istriv_v1(
  x265 : FixedArray[@meson.FolTerm?],
  x266 : Int64,
  x267 : @meson.FolTerm,
) -> Bool raise {
  let suba = x265
  let x = x266
  match x267 {
    @meson.FolTerm::Fvar(y) =>
      y == x ||
      (match @lib.array_get(suba, @lib.int63_to_int(y)) {
        Some(t) => istriv_v1(suba, x, t)
        None => false
      })
    @meson.FolTerm::Fnapp(f, a) =>
      @lib.exists((x268 : @meson.FolTerm) => istriv_v1(suba, x, x268), a) &&
      @lib.raise_error(Unify1::Unify)
  }
}

///|
/// `add_subst`
pub fn add_subst_v1(
  x269 : (
    (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
    @list.List[Int64],
  ),
  x270 : Int64,
  x271 : @meson.FolTerm,
) -> ((FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]), @list.List[Int64]) raise {
  let ((suba, env), subl) as sub = x269
  let x = x270
  let tm = x271
  if istriv_v1(suba, x, tm) {
    sub
  } else {
    @lib.array_set(suba, @lib.int63_to_int(x), Some(tm))
    {
      env.val = env.val.prepend(x)
      ()
    }
    ((suba, env), env.val)
  }
}

///|
/// `unify_tm`
pub fn unify_tm_v1(
  x272 : (
    (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
    @list.List[Int64],
  ),
  x273 : @meson.FolTerm,
  x274 : @meson.FolTerm,
) -> ((FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]), @list.List[Int64]) raise {
  let ((suba, env), subl) as sub = x272
  let tm1 = x273
  let tm2 = x274
  match (tm1, tm2) {
    (@meson.FolTerm::Fnapp(f, fargs), @meson.FolTerm::Fnapp(g, gargs)) =>
      if f != g {
        raise Unify1::Unify
      } else {
        @lib.list_fold_left2(unify_tm_v1, sub, fargs, gargs)
      }
    (tm, @meson.FolTerm::Fvar(x)) | (@meson.FolTerm::Fvar(x), tm) =>
      match @lib.array_get(suba, @lib.int63_to_int(x)) {
        Some(t) => unify_tm_v1(sub, tm, t)
        None => add_subst_v1(sub, x, tm)
      }
  }
}

///|
/// `unify_tms`
pub fn unify_tms_v1(
  x275 : (
    (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
    @list.List[Int64],
  ),
  x276 : @list.List[@meson.FolTerm],
  x277 : @list.List[@meson.FolTerm],
) -> ((FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]), @list.List[Int64]) raise {
  let sub = x275
  let l1 = x276
  let l2 = x277
  restore_subst(sub.0, sub.1)
  @lib.list_fold_left2(unify_tm_v1, sub, l1, l2)
}

///|
/// `unify_lit`
pub fn unify_lit_v1(
  x278 : (
    (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
    @list.List[Int64],
  ),
  x279 : (Int64, @list.List[@meson.FolTerm]),
  x280 : (Int64, @list.List[@meson.FolTerm]),
) -> ((FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]), @list.List[Int64]) raise {
  let env = x278
  let (_ as h1, l1) = x279
  let (h2, l2) = x280
  if h1 != h2 {
    raise Unify1::Unify
  } else {
    unify_tms_v1(env, l1, l2)
  }
}

///|
/// `offset_vars`
pub fn offset_vars(x281 : Int64, x282 : @meson.FolTerm) -> @meson.FolTerm raise {
  let off = x281
  match x282 {
    @meson.FolTerm::Fvar(x) => @meson.FolTerm::Fvar(@lib.add63(x, off))
    @meson.FolTerm::Fnapp(x_1, l) =>
      @meson.FolTerm::Fnapp(
        x_1,
        @lib.map((x283 : @meson.FolTerm) => offset_vars(off, x283), l),
      )
  }
}

///|
/// `unify_tm_off`
pub fn unify_tm_off_v1(
  x284 : Int64,
  x285 : (
    (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
    @list.List[Int64],
  ),
  x286 : @meson.FolTerm,
  x287 : @meson.FolTerm,
) -> ((FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]), @list.List[Int64]) raise {
  let off = x284
  let ((suba, env), subl) as sub = x285
  let t1 = x286
  let t2 = x287
  match (t1, t2) {
    (@meson.FolTerm::Fnapp(f, fargs), @meson.FolTerm::Fnapp(g, gargs)) =>
      if f != g {
        raise Unify1::Unify
      } else {
        @lib.list_fold_left2(
          (
            x288 : (
              (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
              @list.List[Int64],
            ),
            x289 : @meson.FolTerm,
            x290 : @meson.FolTerm,
          ) => unify_tm_off_v1(off, x288, x289, x290),
          sub,
          fargs,
          gargs,
        )
      }
    (_, @meson.FolTerm::Fvar(x)) => {
      let x_1 = @lib.add63(x, off)
      match @lib.array_get(suba, @lib.int63_to_int(x_1)) {
        Some(t) => unify_tm_off_v1(0L, sub, t1, t)
        None => add_subst_v1(sub, x_1, t1)
      }
    }
    (@meson.FolTerm::Fvar(x_2), _) =>
      match @lib.array_get(suba, @lib.int63_to_int(x_2)) {
        Some(t_1) => unify_tm_off_v1(off, sub, t_1, t2)
        None => {
          let t2_p = offset_vars(off, t2)
          add_subst_v1(sub, x_2, t2_p)
        }
      }
  }
}

///|
/// `unify_tms_off`
pub fn unify_tms_off_v1(
  x291 : Int64,
  x292 : (
    (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
    @list.List[Int64],
  ),
  x293 : @list.List[@meson.FolTerm],
  x294 : @list.List[@meson.FolTerm],
) -> ((FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]), @list.List[Int64]) raise {
  let off = x291
  let sub = x292
  let l1 = x293
  let l2 = x294
  restore_subst(sub.0, sub.1)
  @lib.list_fold_left2(
    (
      x295 : (
        (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
        @list.List[Int64],
      ),
      x296 : @meson.FolTerm,
      x297 : @meson.FolTerm,
    ) => unify_tm_off_v1(off, x295, x296, x297),
    sub,
    l1,
    l2,
  )
}

///|
/// `eq_var_tm`
pub fn eq_var_tm_v1(
  x298 : FixedArray[@meson.FolTerm?],
  x299 : Int64,
  x300 : @meson.FolTerm,
) -> Bool raise {
  let suba = x298
  let x = x299
  match x300 {
    @meson.FolTerm::Fvar(y) =>
      y == x ||
      (match @lib.array_get(suba, @lib.int63_to_int(y)) {
        Some(t) => eq_var_tm_v1(suba, x, t)
        None => false
      })
    @meson.FolTerm::Fnapp(f, a) => false
  }
}

///|
/// `eq_tm`
pub fn eq_tm(
  x301 : FixedArray[@meson.FolTerm?],
  x302 : @meson.FolTerm,
  x303 : @meson.FolTerm,
) -> Bool raise {
  let suba = x301
  let tm1 = x302
  let tm2 = x303
  match (tm1, tm2) {
    (@meson.FolTerm::Fnapp(f, fargs), @meson.FolTerm::Fnapp(g, gargs)) =>
      f == g &&
      @lib.list_for_all2(
        (x304 : @meson.FolTerm, x305 : @meson.FolTerm) => {
          eq_tm(suba, x304, x305)
        },
        fargs,
        gargs,
      )
    (_, @meson.FolTerm::Fvar(x)) =>
      match @lib.array_get(suba, @lib.int63_to_int(x)) {
        Some(t) => eq_tm(suba, tm1, t)
        None => eq_var_tm_v1(suba, x, tm1)
      }
    (@meson.FolTerm::Fvar(x_1), _) =>
      match @lib.array_get(suba, @lib.int63_to_int(x_1)) {
        Some(t_1) => eq_tm(suba, t_1, tm2)
        None => eq_var_tm_v1(suba, x_1, tm2)
      }
  }
}

///|
/// `eq_lit`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash] eq_lit_v1(
  x306 : (
    (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
    @list.List[Int64],
  ),
  x307 : (TA, @list.List[@meson.FolTerm]),
  x308 : (TA, @list.List[@meson.FolTerm]),
) -> Bool raise {
  let ((suba, _), _) as sub = x306
  let (p1, args1) = x307
  let (p2, args2) = x308
  if p1 == p2 {
    restore_subst(sub.0, sub.1)
    @lib.list_for_all2(
      (x309 : @meson.FolTerm, x310 : @meson.FolTerm) => eq_tm(suba, x309, x310),
      args1,
      args2,
    )
  } else {
    false
  }
}

///|
/// `empty`
pub fn[TA, TB] empty_v1(
  x311 : Int64,
) -> ((FixedArray[Iterm?], Ref[@list.List[TA]]), @list.List[TB]) raise {
  let n = x311
  let suba = @lib.array_make(n, None)
  let env = Ref::{ val: @list.List([]), }
  let subl = @list.List([])
  ((suba, env), subl)
}

///|
/// `to_list`
pub fn[TA, TB] to_list_v2(
  x312 : (FixedArray[TA?], TB),
  x313 : @list.List[Int64],
) -> @list.List[(Int64, TA)] raise {
  let ((suba, env), subl) = (x312, x313)
  @lib.map(
    fn(x314 : Int64) -> (Int64, TA) raise {
      let v = x314
      match @lib.array_get(suba, @lib.int63_to_int(v)) {
        None => raise Failure("convert_subst")
        Some(t) => (v, t)
      }
    },
    subl,
  )
}

///|
/// `inst_term`
pub fn inst_term(
  x315 : FixedArray[@meson.FolTerm?],
  x316 : @meson.FolTerm,
) -> @meson.FolTerm raise {
  let suba = x315
  match x316 {
    @meson.FolTerm::Fvar(x) =>
      match @lib.array_get(suba, @lib.int63_to_int(x)) {
        Some(t) => inst_term(suba, t)
        None => @meson.FolTerm::Fvar(x)
      }
    @meson.FolTerm::Fnapp(f, a) =>
      @meson.FolTerm::Fnapp(
        f,
        @lib.map((x317 : @meson.FolTerm) => inst_term(suba, x317), a),
      )
  }
}

///|
/// `inst_tm`
pub fn inst_tm_v1(
  x318 : (
    (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
    @list.List[Int64],
  ),
  x319 : @meson.FolTerm,
) -> @meson.FolTerm raise {
  let ((suba, _), _) as sub = x318
  let t = x319
  restore_subst(sub.0, sub.1)
  inst_term(suba, t)
}

///|
/// `inst_lit`
pub fn[TA] inst_lit_v1(
  x320 : (
    (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
    @list.List[Int64],
  ),
  x321 : (TA, @list.List[@meson.FolTerm]),
) -> (TA, @list.List[@meson.FolTerm]) raise {
  let ((suba, _), _) as sub = x320
  let (p, l) = x321
  restore_subst(sub.0, sub.1)
  (p, @lib.map((x322 : @meson.FolTerm) => inst_term(suba, x322), l))
}

///|
/// `ground_tm`
pub fn ground_tm_v1(
  x323 : FixedArray[@meson.FolTerm?],
  x324 : @meson.FolTerm,
) -> Bool raise {
  let suba = x323
  match x324 {
    @meson.FolTerm::Fvar(x) =>
      match @lib.array_get(suba, @lib.int63_to_int(x)) {
        Some(t) => ground_tm_v1(suba, t)
        None => false
      }
    @meson.FolTerm::Fnapp(f, a) =>
      @lib.forall((x325 : @meson.FolTerm) => ground_tm_v1(suba, x325), a)
  }
}

///|
/// `ground_lit`
pub fn[TA] ground_lit_v1(
  x326 : (
    (FixedArray[@meson.FolTerm?], Ref[@list.List[Int64]]),
    @list.List[Int64],
  ),
  x327 : (TA, @list.List[@meson.FolTerm]),
) -> Bool raise {
  let ((suba, _), _) as sub = x326
  let (p, l) = x327
  restore_subst(sub.0, sub.1)
  @lib.forall((x328 : @meson.FolTerm) => ground_tm_v1(suba, x328), l)
}

///|
/// `eq`
pub fn[TA] eq(
  x329 : (T1, TA),
  x330 : (Int64, @list.List[@meson.FolTerm]),
  x331 : (Int64, @list.List[@meson.FolTerm]),
) -> Bool raise {
  let (sub, off) = x329
  let l1 = x330
  let l2 = x331
  eq_lit_v1(sub, l1, l2)
}

///|
/// `unify`
pub fn[TA] unify(
  x332 : (T1, TA),
  x333 : (Int64, @list.List[@meson.FolTerm]),
  x334 : (Int64, @list.List[@meson.FolTerm]),
) -> (T1, TA)? raise {
  let (sub, off) = x332
  let l1 = x333
  let l2 = x334
  Some((unify_lit_v1(sub, l1, l2), off)) catch {
    Unify1::Unify => None
    e => raise e
  }
}

///|
/// `unify_rename_subst`
pub fn[TA] unify_rename_subst(
  x335 : Int64,
  x336 : @list.List[@meson.FolTerm],
  x337 : @list.List[@meson.FolTerm],
  x338 : T1,
  x339 : @list.List[(TA, @list.List[@meson.FolTerm])],
) -> (T1, @list.List[(TA, @list.List[@meson.FolTerm])]) raise {
  let off = x335
  let l1 = x336
  let l2 = x337
  let sub = x338
  let list = x339
  let t341 = @lib.map(
    (x340 : (TA, @list.List[@meson.FolTerm])) => offset_lit(off, x340),
    list,
  )
  (unify_tms_off_v1(off, sub, l1, l2), t341)
}

///|
/// `unify_rename`
pub fn[TA, TB] unify_rename(
  x342 : (T1, Int64),
  x343 : @list.List[@meson.FolTerm],
  x344 : (
    @list.List[@meson.FolTerm],
    @list.List[(TA, @list.List[@meson.FolTerm])],
    Int64,
    TB,
  ),
) -> ((T1, Int64), @list.List[(TA, @list.List[@meson.FolTerm])])? raise {
  let (s, off) = x342
  let args1 = x343
  let (args2, rest, vars, _) = x344
  Some(
    if vars == 0L {
      ((unify_tms_v1(s, args1, args2), off), rest)
    } else {
      let (s_1, rest_1) = unify_rename_subst(off, args1, args2, s, rest)
      ((s_1, @lib.add63(off, vars)), rest_1)
    },
  ) catch {
    Unify1::Unify => None
    e => raise e
  }
}

///|
/// `search_opts`
pub(all) struct SearchOpts {
  cut1 : Bool
  cut2 : Bool
  cut3 : Bool
  comp : Int64
  improved_lemmas : Bool
  improved_regularity : Bool
  add_eq_symmetry : Bool
} derive(Eq, Debug)

///|
pub extend SearchOpts with Eq::{not_equal, equal}

///|
pub extend SearchOpts with Debug::{to_repr}

///|
pub extend SearchOpts with @lib.OCompare::{ocompare}

///|
pub extend SearchOpts with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for SearchOpts with fn ocompare(self, other) {
  let c = @lib.compare(self.cut1, other.cut1)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.cut2, other.cut2)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.cut3, other.cut3)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.comp, other.comp)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.improved_lemmas, other.improved_lemmas)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.improved_regularity, other.improved_regularity)
  if c != 0 {
    return c
  }
  @lib.compare(self.add_eq_symmetry, other.add_eq_symmetry)
}

///|
pub impl @lib.OHash for SearchOpts with fn ohash_visit(self, h) {
  h.block(0, 7)
  h.field(self.cut1)
  h.field(self.cut2)
  h.field(self.cut3)
  h.field(self.comp)
  h.field(self.improved_lemmas)
  h.field(self.improved_regularity)
  h.field(self.add_eq_symmetry)
}

///|
/// search_opts
fn step_11() -> Unit raise {
  search_opts_c.set(SearchOpts::{
    cut1: true,
    cut2: true,
    cut3: true,
    comp: 7L,
    improved_lemmas: true,
    improved_regularity: true,
    add_eq_symmetry: true,
  })
}

///|
let search_opts_c : @lib.Cell[SearchOpts] = @lib.Cell::new("search_opts")

///|
/// `search_opts`
pub fn search_opts() -> SearchOpts {
  search_opts_c.get()
}

///|
/// `deepen`
pub fn[TA] deepen(x345 : (Int64) -> TA? raise, x346 : Int64) -> TA raise {
  let f = x345
  let i = x346
  match f(i) {
    Some(x) => x
    None => deepen(f, @lib.add63(i, 1L))
  }
}

///|
/// `deepen_to`
pub fn[TA] deepen_to(
  x347 : Int64,
  x348 : (Int64) -> TA? raise,
  x349 : Int64,
) -> TA? raise {
  let n = x347
  let f = x348
  let i = x349
  if i > n {
    None
  } else {
    match f(i) {
      None => deepen_to(n, f, @lib.add63(i, 1L))
      s => s
    }
  }
}

///|
/// `strategy`
pub fn[TA] strategy(
  x350 : SearchOpts,
  x351 : (SearchOpts) -> ((Int64) -> TA? raise) raise,
) -> TA raise {
  let opt = x350
  let f = x351
  if opt.cut1 || opt.cut2 || opt.cut3 {
    let t352 = f(opt)
    match deepen_to(opt.comp, t352, 0L) {
      None =>
        deepen(
          f(SearchOpts::{ ..opt, cut1: false, cut2: false, cut3: false, }),
          0L,
        )
      Some(prf) => prf
    }
  } else {
    deepen(f(opt), 0L)
  }
}

///|
/// create_equality_axioms
fn step_12() -> Unit raise {
  let t356 = @tactics.conv_tac(@class.taut)
  let t355 = @simp.asm_rewrite_tac(@list.List([]))
  let t354 = @class.asm_cases_tac(@term_syntax.parse_term("(x : A) == (y : A)"))
  let t357 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@simp.rewrite_tac(@list.List([])), t354),
      t355,
    ),
    t356,
  )
  let t358 = (
    @term_syntax.parse_term("(x : A) == x && (!(x == (y : A)) || y == x) && (!(x == y) || !(x == (z : A)) || y == z)"),
    t357,
  )
  let eq_thms = @bool.conjuncts_rule(
    (fn(
      x353 : (
        @kernel.Term,
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
      ),
    ) -> @kernel.Thm raise {
      @tactics.prove(x353.0, x353.1)
    })(t358),
  )
  let imp_elim_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(
    @class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!a || b)")),
  )
  let eq_elim_rule : (@kernel.Thm) -> @kernel.Thm raise = @drule.match_mp(
    @class.taut(@term_syntax.parse_term("(a : Bool) == (b : Bool) → b || !a")),
  )
  let veq_tm = @kernel.rator(@kernel.rator(@kernel.concl(@lib.hd(eq_thms))))
  fn tm_consts(
    x364 : @kernel.Term,
    x365 : @list.List[(@kernel.Term, Int64)],
  ) -> @list.List[(@kernel.Term, Int64)] raise {
    let tm = x364
    let acc = x365
    let (fn_, args) = @basics.strip_comb(tm)
    if args == @list.List([]) {
      acc
    } else {
      @lib.itlist(
        tm_consts,
        args,
        @lib.insert((fn_, Int::to_int64(@lib.length(args))), acc),
      )
    }
  }
  fn fm_consts(
    x366 : @kernel.Term,
    x367 : (
      @list.List[(@kernel.Term, Int64)],
      @list.List[(@kernel.Term, Int64)],
    ),
  ) -> (@list.List[(@kernel.Term, Int64)], @list.List[(@kernel.Term, Int64)]) raise {
    let tm_1 = x366
    let (preds, funs) as acc_1 = x367
    fm_consts(@basics.dest_forall(tm_1).1, acc_1) catch {
      Failure(_) =>
        fm_consts(@basics.dest_exists(tm_1).1, acc_1) catch {
          Failure(_) =>
            try {
              let (l, r) = @basics.dest_conj(tm_1)
              fm_consts(l, fm_consts(r, acc_1))
            } catch {
              Failure(_) =>
                try {
                  let (l_1, r_1) = @basics.dest_disj(tm_1)
                  fm_consts(l_1, fm_consts(r_1, acc_1))
                } catch {
                  Failure(_) =>
                    try {
                      let (l_2, r_2) = @basics.dest_imp(tm_1)
                      fm_consts(l_2, fm_consts(r_2, acc_1))
                    } catch {
                      Failure(_) =>
                        fm_consts(@basics.dest_neg(tm_1), acc_1) catch {
                          Failure(_) =>
                            try {
                              let (l_3, r_3) = @kernel.dest_eq(tm_1)
                              if @kernel.type_of(l_3) == @kernel.bool_ty {
                                fm_consts(r_3, fm_consts(l_3, acc_1))
                              } else {
                                raise Failure("atomic equality")
                              }
                            } catch {
                              Failure(_) => {
                                let (pred, args_1) = @basics.strip_comb(tm_1)
                                if args_1 == @list.List([]) {
                                  acc_1
                                } else {
                                  let t368 = @lib.itlist(
                                    tm_consts, args_1, funs,
                                  )
                                  (
                                    @lib.insert(
                                      (pred, Int::to_int64(@lib.length(args_1))),
                                      preds,
                                    ),
                                    t368,
                                  )
                                }
                              }
                              e => raise e
                            }
                          e => raise e
                        }
                      e => raise e
                    }
                  e => raise e
                }
              e => raise e
            }
          e => raise e
        }
      e => raise e
    }
  }
  let create_congruence_axiom : (Bool) -> (((@kernel.Term, Int64)) -> @kernel.Thm raise) raise = fn(
    x369 : Bool,
  ) -> (((@kernel.Term, Int64)) -> @kernel.Thm raise) raise {
    let pflag = x369
    fn(x370 : (@kernel.Term, Int64)) -> @kernel.Thm raise {
      let (tm_2, len) = x370
      let (atys, rty) = @lib.splitlist(
        fn(x371 : @kernel.HolType) -> (@kernel.HolType, @kernel.HolType) raise {
          let ty = x371
          let (op, l_4) = @kernel.dest_type(ty)
          if op == "fun" {
            let t372 = @lib.hd(@lib.tl(l_4))
            (@lib.hd(l_4), t372)
          } else {
            @lib.failure()
          }
        },
        @kernel.type_of(tm_2),
      )
      let ctys = @lib.chop_list(@lib.int63_to_int(len), atys).0
      let largs = @lib.map(
        fn(x373 : @kernel.HolType) -> @kernel.Term raise {
          @basics.genvar(x373)
        },
        ctys,
      )
      let rargs = @lib.map(
        fn(x374 : @kernel.HolType) -> @kernel.Term raise {
          @basics.genvar(x374)
        },
        ctys,
      )
      let t384 = @kernel.refl(tm_2)
      let th1 = @lib.rev_itlist(
        fn(x380 : @kernel.Thm, x381 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(
            x378 : @kernel.Thm,
          ) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
            fn(x379 : @kernel.Thm) -> @kernel.Thm raise {
              ((x376 : @kernel.Thm, x377 : @kernel.Thm) => {
                @lib.curry(
                  fn(x375 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
                    @kernel.mk_comb_rule(x375.0, x375.1)
                  },
                  x376,
                  x377,
                )
              })(x378, x379)
            }
          })(x381)(x380)
        },
        @lib.map(
          fn(x383 : (@kernel.Term, @kernel.Term)) -> @kernel.Thm raise {
            @kernel.assume_rule(
              (fn(x382 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                @basics.mk_eq(x382.0, x382.1)
              })(x383),
            )
          },
          @lib.zip(largs, rargs),
        ),
        t384,
      )
      let th2 = if pflag { eq_elim_rule(th1) } else { th1 }
      @lib.itlist(
        fn(x385 : @kernel.Term, x386 : @kernel.Thm) -> @kernel.Thm raise {
          let e = x385
          let th = x386
          @equal.conv_rule(imp_elim_conv, @bool.disch(e, th))
        },
        @kernel.hyp(th2),
        th2,
      )
    }
  }
  create_equality_axioms_c.set(fn(
    x387 : @list.List[@kernel.Term],
  ) -> @list.List[@kernel.Thm] raise {
    let tms = x387
    let (preds_1, funs_1) = @lib.itlist(
      fm_consts,
      tms,
      (@list.List([]), @list.List([])),
    )
    let (eqs0, noneqs) = @lib.partition(
      fn(x388 : (@kernel.Term, Int64)) -> Bool raise {
        let (t, _) = x388
        @kernel.is_const(t) && @kernel.dest_const(t).0 == "="
      },
      preds_1,
    )
    if eqs0 == @list.List([]) {
      @list.List([])
    } else {
      let pcongs = @lib.map(create_congruence_axiom(true), noneqs)
      let fcongs = @lib.map(create_congruence_axiom(false), funs_1)
      let (preds1, _) = @lib.itlist(
        fm_consts,
        @lib.map(
          fn(x389 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x389) },
          pcongs.concat(fcongs),
        ),
        (@list.List([]), @list.List([])),
      )
      let eqs1 = @lib.filter(
        fn(x390 : (@kernel.Term, Int64)) -> Bool raise {
          let (t_1, _) = x390
          @kernel.is_const(t_1) && @kernel.dest_const(t_1).0 == "="
        },
        preds1,
      )
      let eqs = @lib.union(eqs0, eqs1)
      let equivs = @lib.itlist(
        fn(
          x398 : (@kernel.Term, Int64),
          x399 : @list.List[@kernel.Thm],
        ) -> @list.List[@kernel.Thm] raise {
          (fn(
            x395 : @list.List[@kernel.Thm],
          ) -> ((@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise) raise {
            fn(
              x396 : @list.List[@kernel.Thm],
            ) -> @list.List[@kernel.Thm] raise {
              ((x393 : @list.List[@kernel.Thm], x394 : @list.List[@kernel.Thm]) => {
                @lib.union_eq(
                  fn(x391 : @kernel.Thm, x392 : @kernel.Thm) -> Bool raise {
                    @basics.equals_thm(x391, x392)
                  },
                  x393,
                  x394,
                )
              })(x395, x396)
            }
          })(
            (fn(x397 : (@kernel.Term, Int64)) -> @list.List[@kernel.Thm] raise {
              ((x359, x360) => {
                create_equivalence_axioms_l(veq_tm, eq_thms, x359, x360)
              })(x397.0, x397.1)
            })(x398),
          )(x399)
        },
        eqs,
        @list.List([]),
      )
      equivs.concat(pcongs.concat(fcongs))
    }
  })
}

///|
let create_equality_axioms_c : @lib.Cell[
  (@list.List[@kernel.Term]) -> @list.List[@kernel.Thm] raise,
] = @lib.Cell::new("create_equality_axioms")

///|
/// `create_equality_axioms`
pub fn create_equality_axioms(
  x : @list.List[@kernel.Term],
) -> @list.List[@kernel.Thm] raise {
  create_equality_axioms_c.get()(x)
}

///|
fn[TA] create_equivalence_axioms_l(
  veq_tm : @kernel.Term,
  eq_thms : @list.List[@kernel.Thm],
  x359 : @kernel.Term,
  x360 : TA,
) -> @list.List[@kernel.Thm] raise {
  let (eq_1, _) = (x359, x360)
  let t361 = @kernel.type_of(eq_1)
  let tyins = @basics.type_match(@kernel.type_of(veq_tm), t361, @list.List([]))
  @lib.map(
    fn(x363 : @kernel.Thm) -> @kernel.Thm raise {
      ((x362 : @kernel.Thm) => @kernel.inst_type(tyins, x362))(x363)
    },
    eq_thms,
  )
}

///|
/// `create_eq_axs`
pub fn create_eq_axs(
  x400 : Bool,
) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Thm] raise) raise {
  let sym = x400
  match sym {
    true => create_equality_axioms
    false => @meson.create_equality_axioms
  }
}

///|
/// `PREPARE_COP_TAC`
pub fn prepare_cop_tac(x402 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let ths = x402
  let t435 = @tactics.repeat_tac(@tactics.first_x_assum(@tactics.choose_tac))
  let t432 = @equal.thenc(@canon.nnf_conv, @canon.skolem_conv)
  let t434 = @tactics.rule_assum_tac((x433 : @kernel.Thm) => {
    @equal.conv_rule(t432, x433)
  })
  let t431 = @class.refute_then(fn(
    x428 : @kernel.Thm,
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
    let s429 = @tactics.assume_tac(x428)
    fn(
      x430 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s429(x430)
    }
  })
  let t427 = @tactics.repeat_tac(
    @tactics.orelse_tac(@tactics.gen_tac, @tactics.disch_tac),
  )
  let t426 = @tactics.conv_tac(
    @equal.thenc(
      @equal.thenc(
        @equal.thenc(
          @equal.thenc(
            @canon.presimp_conv,
            @equal.top_depth_conv(@equal.beta_conv),
          ),
          @canon.lambda_elim_conv,
        ),
        @canon.conds_celim_conv,
      ),
      @meson.quant_bool_conv,
    ),
  )
  let t409 = @tactics.orelse_tac(mark_concl("copconcl"), mark_assums)
  let t408 = @meson.poly_assume_tac(@lib.map(@bool.gen_all, ths))
  @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @class.refute_then(fn(
                          x405 : @kernel.Thm,
                        ) -> ((
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
                          @list.List[
                            (@list.List[(String, @kernel.Thm)], @kernel.Term),
                          ],
                          (
                            (
                              @list.List[(Int64, @kernel.Term)],
                              @list.List[(@kernel.Term, @kernel.Term)],
                              @list.List[(@kernel.HolType, @kernel.HolType)],
                            ),
                            @list.List[@kernel.Thm],
                          ) -> @kernel.Thm raise,
                        ) raise) raise {
                          let s406 = ((x404 : @kernel.Thm) => {
                            @tactics.label_tac("copconcl", x404)
                          })(x405)
                          fn(
                            x407 : (
                              @list.List[(String, @kernel.Thm)],
                              @kernel.Term,
                            ),
                          ) -> (
                            (
                              @list.List[@kernel.Term],
                              (
                                @list.List[(Int64, @kernel.Term)],
                                @list.List[(@kernel.Term, @kernel.Term)],
                                @list.List[(@kernel.HolType, @kernel.HolType)],
                              ),
                            ),
                            @list.List[
                              (@list.List[(String, @kernel.Thm)], @kernel.Term),
                            ],
                            (
                              (
                                @list.List[(Int64, @kernel.Term)],
                                @list.List[(@kernel.Term, @kernel.Term)],
                                @list.List[(@kernel.HolType, @kernel.HolType)],
                              ),
                              @list.List[@kernel.Thm],
                            ) -> @kernel.Thm raise,
                          ) raise {
                            s406(x407)
                          }
                        }),
                        t408,
                      ),
                      t409,
                    ),
                    fn(
                      x420 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ) -> (
                      (
                        @list.List[@kernel.Term],
                        (
                          @list.List[(Int64, @kernel.Term)],
                          @list.List[(@kernel.Term, @kernel.Term)],
                          @list.List[(@kernel.HolType, @kernel.HolType)],
                        ),
                      ),
                      @list.List[
                        (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ],
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
                        x419 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                        (
                          @list.List[@kernel.Term],
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                        ),
                        @list.List[
                          (@list.List[(String, @kernel.Thm)], @kernel.Term),
                        ],
                        (
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                          @list.List[@kernel.Thm],
                        ) -> @kernel.Thm raise,
                      ) raise) raise {
                        ((x417 : @list.List[(String, @kernel.Thm)]) => {
                          @tactics.map_every(
                            fn(
                              x416 : (String, @kernel.Thm),
                            ) -> ((
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
                                  @list.List[(@kernel.HolType, @kernel.HolType)],
                                ),
                                @list.List[@kernel.Thm],
                              ) -> @kernel.Thm raise,
                            ) raise) raise {
                              (fn(
                                x414 : @kernel.Thm,
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
                                (fn(
                                  x410 : @kernel.Term,
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
                                  let s411 = @tactics.undisch_tac(x410)
                                  fn(
                                    x412 : (
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
                                    s411(x412)
                                  }
                                })(
                                  (fn(
                                    x413 : @kernel.Thm,
                                  ) -> @kernel.Term raise {
                                    @kernel.concl(x413)
                                  })(x414),
                                )
                              })(
                                (fn(
                                  x415 : (String, @kernel.Thm),
                                ) -> @kernel.Thm raise {
                                  x415.1
                                })(x416),
                              )
                            },
                            x417,
                          )
                        })(
                          (fn(
                            x418 : (
                              @list.List[(String, @kernel.Thm)],
                              @kernel.Term,
                            ),
                          ) -> @list.List[(String, @kernel.Thm)] raise {
                            x418.0
                          })(x419),
                        )
                      })(x420)(x420)
                    },
                  ),
                  @canon.select_elim_tac,
                ),
                fn(
                  x425 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                    x421 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                    (
                      @list.List[@kernel.Term],
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                    ),
                    @list.List[
                      (@list.List[(String, @kernel.Thm)], @kernel.Term),
                    ],
                    (
                      (
                        @list.List[(Int64, @kernel.Term)],
                        @list.List[(@kernel.Term, @kernel.Term)],
                        @list.List[(@kernel.HolType, @kernel.HolType)],
                      ),
                      @list.List[@kernel.Thm],
                    ) -> @kernel.Thm raise,
                  ) raise) raise {
                    let (asl, w) = x421
                    @tactics.map_every(
                      fn(
                        x423 : @kernel.Term,
                      ) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
                        (
                          @list.List[@kernel.Term],
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                        ),
                        @list.List[
                          (@list.List[(String, @kernel.Thm)], @kernel.Term),
                        ],
                        (
                          (
                            @list.List[(Int64, @kernel.Term)],
                            @list.List[(@kernel.Term, @kernel.Term)],
                            @list.List[(@kernel.HolType, @kernel.HolType)],
                          ),
                          @list.List[@kernel.Thm],
                        ) -> @kernel.Thm raise,
                      ) raise) raise {
                        let v = x423
                        @tactics.spec_tac(v, v)
                      },
                      @kernel.frees(w),
                    )
                  })(x425)(x425)
                },
              ),
              t426,
            ),
            t427,
          ),
          t431,
        ),
        t434,
      ),
      t435,
    ),
    @canon.asm_fol_tac,
  )
}

///|
/// `proof`
pub(all) enum Proof[TA, TB] {
  Lemma
  Reduction
  Extension(TB, @list.List[(TA, Proof[TA, TB])])
} derive(Eq, Debug)

///|
pub extend Proof with Eq::{not_equal, equal}

///|
pub extend Proof with Debug::{to_repr}

///|
pub extend Proof with @lib.OCompare::{ocompare}

///|
pub extend Proof with @lib.OHash::{ohash_visit}

///|
fn[TA, TB] ocaml_rank_Proof(x : Proof[TA, TB]) -> Int {
  match x {
    Lemma => 0
    Reduction => 1
    Extension(_, _) => 1000000
  }
}

///|
pub impl[TA : @lib.OCompare, TB : @lib.OCompare] @lib.OCompare for Proof[TA, TB] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Extension(a0, a1), Extension(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    _ => ocaml_rank_Proof(self).compare(ocaml_rank_Proof(other))
  }
}

///|
pub impl[TA : @lib.OHash, TB : @lib.OHash] @lib.OHash for Proof[TA, TB] with fn ohash_visit(
  self,
  h,
) {
  match self {
    Lemma => h.int(0L)
    Reduction => h.int(1L)
    Extension(a0, a1) => {
      h.block(0, 2)
      h.field(a0)
      h.field(a1)
    }
  }
}

///|
/// `cut`
pub fn[TA] cut_v1(
  x436 : Bool,
  x437 : (Unit) -> TA raise,
  x438 : (Unit) -> TA raise,
) -> ((Unit) -> TA raise) raise {
  let p = x436
  let xs = x437
  let ys = x438
  if p {
    cut(xs, ys)
  } else {
    append(xs, ys)
  }
}

///|
/// `prove_lit`
pub fn prove_lit(
  x440 : SearchOpts,
  x441 : (T1, Int64),
  x442 : (
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Int64,
  ),
  x443 : (Int64, @list.List[@meson.FolTerm]),
) -> Strom[
  (
    (T1, Int64),
    @list.List[Lit],
    Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)],
  ),
] raise {
  let opt = x440
  let sub = x441
  let (path, lem, lim) = x442
  let lit = x443
  if @firstorder.copverb().val {
    let t445 = string_of_lit(inst_lit_v1(sub.0, lit))
    @pp.std_formatter.print_string("Lit: " + t445 + "\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  if @firstorder.copverb().val {
    let t447 = string_of_lits(
      @lib.map(
        (x446 : (Int64, @list.List[@meson.FolTerm])) => inst_lit_v1(sub.0, x446),
        path,
      ),
    )
    @pp.std_formatter.print_string("Path: " + t447 + "\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  if @firstorder.copverb().val {
    let t449 = string_of_lits(
      @lib.map(
        (x448 : (Int64, @list.List[@meson.FolTerm])) => inst_lit_v1(sub.0, x448),
        lem,
      ),
    )
    @pp.std_formatter.print_string("Lemmas: " + t449 + "\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  let neglit = negate_lit(lit.0, lit.1)
  let lemmas : (Unit) -> (
    (T1, Int64),
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Proof[_, _],
  ) raise = if opt.improved_lemmas {
    if @lib.exists(
        (x450 : (Int64, @list.List[@meson.FolTerm])) => eq(sub, lit, x450),
        lem,
      ) {
      if @firstorder.copverb().val {
        @pp.std_formatter.print_string("lemma\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      cons((sub, lem, Proof::Lemma), nil)
    } else {
      nil
    }
  } else {
    @lib.op_bar_gt(
      @lib.op_bar_gt(of_list(lem), fn(
        x454 : (Unit) -> (Int64, @list.List[@meson.FolTerm]) raise,
      ) -> ((Unit) -> (Int64, @list.List[@meson.FolTerm]) raise) raise {
        fn(x455 : Unit) -> (Int64, @list.List[@meson.FolTerm]) raise {
          ((
            x452 : (Unit) -> (Int64, @list.List[@meson.FolTerm]) raise,
            x453 : Unit,
          ) => {
            filter(
              (x451 : (Int64, @list.List[@meson.FolTerm])) => eq(sub, lit, x451),
              x452,
              x453,
            )
          })(x454, x455)
        }
      }),
      (x459 : (Unit) -> (Int64, @list.List[@meson.FolTerm]) raise) => {
        (x460 : Unit) => {
          ((
            x457 : (Unit) -> (Int64, @list.List[@meson.FolTerm]) raise,
            x458 : Unit,
          ) => {
            map(
              (x456 : (Int64, @list.List[@meson.FolTerm])) => {
                let l = x456
                if @firstorder.copverb().val {
                  @pp.std_formatter.print_string("lemma\n")
                  @pp.std_formatter.print_flush()
                  ()
                } else {
                  ()
                }
                (sub, lem.prepend(lit), Proof::Lemma)
              },
              x457,
              x458,
            )
          })(x459, x460)
        }
      },
    )
  }
  let t465 = of_list(path)
  let reductions : (Unit) -> (
    (T1, Int64),
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Proof[_, _],
  ) raise = (x466 : Unit) => {
    filter_map(
      (x461 : (Int64, @list.List[@meson.FolTerm])) => {
        let p = x461
        if @firstorder.copverb().val {
          let t462 = string_of_lit(inst_lit_v1(sub.0, lit))
          let t463 = string_of_lit(p)
          @pp.std_formatter.print_string(
            "Reduction try " +
            t463 +
            " (for lit " +
            t462 +
            ", lim " +
            Int64::to_string(lim) +
            ")\n",
          )
          @pp.std_formatter.print_flush()
          ()
        } else {
          ()
        }
        @firstorder.op_gt_gt_eq(unify(sub, neglit, p), (x464 : (T1, Int64)) => {
          let sub1 = x464
          if @firstorder.copverb().val {
            @pp.std_formatter.print_string("Reduction works\n")
            @pp.std_formatter.print_flush()
            ()
          } else {
            ()
          }
          Some((sub1, lem.prepend(lit), Proof::Reduction))
        })
      },
      t465,
      x466,
    )
  }
  let extensions : (Unit) -> (
    (T1, Int64),
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)],
  ) raise = @lib.op_bar_gt(@lib.op_bar_gt(db_entries(neglit), of_list), (
    x474 : (Unit) -> (
      @list.List[@meson.FolTerm],
      @list.List[@meson.FolAtom],
      Int64,
      (Int64, @kernel.Thm),
    ) raise,
  ) => {
    concat_map(
      fn(
        x467 : (
          @list.List[@meson.FolTerm],
          @list.List[@meson.FolAtom],
          Int64,
          (Int64, @kernel.Thm),
        ),
      ) -> ((Unit) -> (
        (T1, Int64),
        @list.List[(Int64, @list.List[@meson.FolTerm])],
        Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)],
      ) raise) raise {
        let (_, _, vars, hsh) as contra = x467
        if lim < 0L && vars > 0L {
          nil
        } else {
          match unify_rename(sub, lit.1, contra) {
            Some((sub1_1, cla1)) =>
              @lib.op_bar_gt(
                prove_clause(
                  opt,
                  sub1_1,
                  (path.prepend(lit), lem, @lib.sub63(lim, 1L)),
                  (cla1, hsh),
                ),
                fn(
                  x472 : (Unit) -> (
                    (T1, Int64),
                    @list.List[
                      (
                        (Int64, @list.List[@meson.FolTerm]),
                        Proof[
                          (Int64, @list.List[@meson.FolTerm]),
                          (Int64, @kernel.Thm),
                        ],
                      ),
                    ],
                  ) raise,
                ) -> ((Unit) -> (
                  (T1, Int64),
                  @list.List[(Int64, @list.List[@meson.FolTerm])],
                  Proof[
                    (Int64, @list.List[@meson.FolTerm]),
                    (Int64, @kernel.Thm),
                  ],
                ) raise) raise {
                  fn(
                    x473 : Unit,
                  ) -> (
                    (T1, Int64),
                    @list.List[(Int64, @list.List[@meson.FolTerm])],
                    Proof[
                      (Int64, @list.List[@meson.FolTerm]),
                      (Int64, @kernel.Thm),
                    ],
                  ) raise {
                    ((
                      x470 : (Unit) -> (
                        (T1, Int64),
                        @list.List[
                          (
                            (Int64, @list.List[@meson.FolTerm]),
                            Proof[
                              (Int64, @list.List[@meson.FolTerm]),
                              (Int64, @kernel.Thm),
                            ],
                          ),
                        ],
                      ) raise,
                      x471 : Unit,
                    ) => {
                      map(
                        fn(
                          x469 : (
                            (T1, Int64),
                            @list.List[
                              (
                                (Int64, @list.List[@meson.FolTerm]),
                                Proof[
                                  (Int64, @list.List[@meson.FolTerm]),
                                  (Int64, @kernel.Thm),
                                ],
                              ),
                            ],
                          ),
                        ) -> (
                          (T1, Int64),
                          @list.List[(Int64, @list.List[@meson.FolTerm])],
                          Proof[
                            (Int64, @list.List[@meson.FolTerm]),
                            (Int64, @kernel.Thm),
                          ],
                        ) raise {
                          let (sub2, prfs) = x469
                          (sub2, lem.prepend(lit), Proof::Extension(hsh, prfs))
                        },
                        x470,
                        x471,
                      )
                    })(x472, x473)
                  }
                },
              )
            None => nil
          }
        }
      },
      x474,
    )
  })
  let t475 = cut_v1(opt.cut3, extensions, nil)
  let t476 = cut_v1(opt.cut2, reductions, t475)
  cut_v1(opt.cut1, lemmas, t476)
}

///|
/// `prove_clause`
pub fn prove_clause(
  x477 : SearchOpts,
  x478 : (T1, Int64),
  x479 : (
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Int64,
  ),
  x480 : (@list.List[(Int64, @list.List[@meson.FolTerm])], (Int64, @kernel.Thm)),
) -> Strom[
  (
    (T1, Int64),
    @list.List[
      (
        (Int64, @list.List[@meson.FolTerm]),
        Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)],
      ),
    ],
  ),
] raise {
  let opt_1 = x477
  let sub_1 = x478
  let (path_1, lem_1, lim_1) = x479
  let (cl, cl_hsh) = x480
  match cl {
    More(lit_1, tail=lits) =>
      if @lib.exists(
          fn(x482 : (Int64, @list.List[@meson.FolTerm])) -> Bool raise {
            let x = x482
            @lib.exists(
              (x483 : (Int64, @list.List[@meson.FolTerm])) => eq(sub_1, x, x483),
              path_1,
            )
          },
          cl,
        ) {
        if @firstorder.copverb().val {
          @pp.std_formatter.print_string("regularity\n")
          @pp.std_formatter.print_flush()
          ()
        } else {
          ()
        }
        nil
      } else {
        @lib.op_bar_gt(prove_lit(opt_1, sub_1, (path_1, lem_1, lim_1), lit_1), (
          x491 : (Unit) -> (
            (T1, Int64),
            @list.List[(Int64, @list.List[@meson.FolTerm])],
            Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)],
          ) raise,
        ) => {
          concat_map(
            fn(
              x484 : (
                (T1, Int64),
                @list.List[(Int64, @list.List[@meson.FolTerm])],
                Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)],
              ),
            ) -> ((Unit) -> (
              (T1, Int64),
              @list.List[
                (
                  (Int64, @list.List[@meson.FolTerm]),
                  Proof[
                    (Int64, @list.List[@meson.FolTerm]),
                    (Int64, @kernel.Thm),
                  ],
                ),
              ],
            ) raise) raise {
              let (sub1_2, lem1, prf1) = x484
              @lib.op_bar_gt(
                prove_clause(
                  opt_1,
                  sub1_2,
                  (path_1, lem1, lim_1),
                  (lits, cl_hsh),
                ),
                fn(
                  x489 : (Unit) -> (
                    (T1, Int64),
                    @list.List[
                      (
                        (Int64, @list.List[@meson.FolTerm]),
                        Proof[
                          (Int64, @list.List[@meson.FolTerm]),
                          (Int64, @kernel.Thm),
                        ],
                      ),
                    ],
                  ) raise,
                ) -> ((Unit) -> (
                  (T1, Int64),
                  @list.List[
                    (
                      (Int64, @list.List[@meson.FolTerm]),
                      Proof[
                        (Int64, @list.List[@meson.FolTerm]),
                        (Int64, @kernel.Thm),
                      ],
                    ),
                  ],
                ) raise) raise {
                  fn(
                    x490 : Unit,
                  ) -> (
                    (T1, Int64),
                    @list.List[
                      (
                        (Int64, @list.List[@meson.FolTerm]),
                        Proof[
                          (Int64, @list.List[@meson.FolTerm]),
                          (Int64, @kernel.Thm),
                        ],
                      ),
                    ],
                  ) raise {
                    ((
                      x487 : (Unit) -> (
                        (T1, Int64),
                        @list.List[
                          (
                            (Int64, @list.List[@meson.FolTerm]),
                            Proof[
                              (Int64, @list.List[@meson.FolTerm]),
                              (Int64, @kernel.Thm),
                            ],
                          ),
                        ],
                      ) raise,
                      x488 : Unit,
                    ) => {
                      map(
                        fn(
                          x486 : (
                            (T1, Int64),
                            @list.List[
                              (
                                (Int64, @list.List[@meson.FolTerm]),
                                Proof[
                                  (Int64, @list.List[@meson.FolTerm]),
                                  (Int64, @kernel.Thm),
                                ],
                              ),
                            ],
                          ),
                        ) -> (
                          (T1, Int64),
                          @list.List[
                            (
                              (Int64, @list.List[@meson.FolTerm]),
                              Proof[
                                (Int64, @list.List[@meson.FolTerm]),
                                (Int64, @kernel.Thm),
                              ],
                            ),
                          ],
                        ) raise {
                          let (sub2_1, prfs_1) = x486
                          (sub2_1, prfs_1.prepend((lit_1, prf1)))
                        },
                        x487,
                        x488,
                      )
                    })(x489, x490)
                  }
                },
              )
            },
            x491,
          )
        })
      }
    Empty => cons((sub_1, @list.List([])), nil)
  }
}

///|
/// `hol_negate`
pub fn hol_negate(x492 : @kernel.Term) -> @kernel.Term raise {
  let tm = x492
  @basics.dest_neg(tm) catch {
    Failure(_) => @bool.mk_neg(tm)
    e => raise e
  }
}

///|
/// `hashek_of_proof`
pub fn hashek_of_proof(
  x493 : T1,
  x494 : @list.List[@kernel.Thm],
  x495 : (Int64, @list.List[@meson.FolTerm]),
) -> ((Proof[Lit, (Int64, @kernel.Thm)]) -> @kernel.Thm raise) raise {
  let sub = x493
  let lem = x494
  let lit = x495
  let t497 = inst_lit_v1(sub, lit)
  let liti = @firstorder.hol_of_literal(t497.0, t497.1)
  fn(
    x498 : Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)],
  ) -> @kernel.Thm raise {
    match x498 {
      Proof::Lemma =>
        @lib.find(
          fn(x499 : @kernel.Thm) -> Bool raise {
            let x = x499
            @kernel.concl(x) == liti
          },
          lem,
        )
      Proof::Reduction => @kernel.assume_rule(liti)
      Proof::Extension(contra, prfs) => {
        let (_, ths) = @firstorder.fold_map(
          fn(
            x500 : @list.List[@kernel.Thm],
          ) -> ((
            (
              (Int64, @list.List[@meson.FolTerm]),
              Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)],
            ),
          ) -> (@list.List[@kernel.Thm], @kernel.Thm) raise) raise {
            let lem_1 = x500
            fn(
              x501 : (
                (Int64, @list.List[@meson.FolTerm]),
                Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)],
              ),
            ) -> (@list.List[@kernel.Thm], @kernel.Thm) raise {
              let (lit_1, prf) = x501
              let p = hashek_of_proof(sub, lem_1, lit_1)(prf)
              (lem_1.prepend(p), p)
            }
          },
          lem,
          prfs,
        )
        let cth = @meson.make_hol_contrapos(contra)
        let hth = if ths == @list.List([]) {
          cth
        } else {
          let t502 = @lib.end_itlist(@bool.conj, ths)
          @drule.match_mp(cth)(t502)
        }
        let ith = @drule.part_match(
          fn(x503 : @kernel.Term) -> @kernel.Term raise { x503 },
          hth,
        )(liti)
        @meson.finish_rule(@bool.disch(hol_negate(@kernel.concl(ith)), ith))
      }
    }
  }
}

///|
/// `start`
pub fn start(
  x504 : SearchOpts,
  x505 : Int64,
) -> (T1, Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)])? raise {
  let opt = x504
  let lim = x505
  if @firstorder.copverb().val {
    let t506 = @lib.add63(lim, 1L)
    @pp.std_formatter.print_string("Start " + Int64::to_string(t506) + "\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  let sub0 = empty_v1(1000000L)
  let hashek = @firstorder.fol_of_literal(
    @list.List([]),
    @list.List([]),
    hashek_tm(),
  )
  let hashek_neg = negate_lit(hashek.0, hashek.1)
  let prfs : (Unit) -> (
    (T1, Int64),
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)],
  ) raise = prove_lit(
    opt,
    (sub0, 0L),
    (@list.List([]), @list.List([]), lim),
    hashek_neg,
  )
  match next_opt(prfs) {
    Some((sub, _, prf)) => Some((sub.0, prf))
    None => None
  }
}

///|
/// `LEANCOP_DEEPEN`
pub fn leancop_deepen(
  x507 : SearchOpts,
  x508 : @list.List[@kernel.Thm],
) -> @kernel.Thm raise {
  let opt = x507
  let ths = x508
  @meson.clear_contrapos_cache(())
  @firstorder.reset_vars(())
  @firstorder.reset_consts(())
  let t510 = @lib.map(
    fn(x509 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x509) },
    ths,
  )
  let ths_p = ths.concat(create_eq_axs(opt.add_eq_symmetry)(t510))
  axioms2db(ths_p)
  let (sub, prf) = strategy(opt, fn(
    x511 : SearchOpts,
  ) -> ((Int64) -> (
    T1,
    Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)],
  )? raise) raise {
    fn(
      x512 : Int64,
    ) -> (T1, Proof[(Int64, @list.List[@meson.FolTerm]), (Int64, @kernel.Thm)])? raise {
      start(x511, x512)
    }
  })
  let hashek = @firstorder.fol_of_literal(
    @list.List([]),
    @list.List([]),
    hashek_tm(),
  )
  let hashek_neg = negate_lit(hashek.0, hashek.1)
  let th = hashek_of_proof(sub, @list.List([]), hashek_neg)(prf)
  @kernel.eq_mp(hashek_eq(), th)
}

///|
/// `PREPARE_LEAN_TAC`
pub fn prepare_lean_tac(
  x513 : @list.List[@kernel.Thm],
) -> @tactics.Tactic raise {
  let ths = x513
  let t529 = @tactics.repeat_tac(@tactics.first_x_assum(@tactics.subst_var_tac))
  let t526 = @canon.assoc_conv(@theorems.disj_assoc())
  let t528 = @tactics.rule_assum_tac((x527 : @kernel.Thm) => {
    @equal.conv_rule(t526, x527)
  })
  let t525 = @tactics.repeat_tac(
    @tactics.first_x_assum((x524 : @kernel.Thm) => {
      @meson.conjuncts_then_p(
        fn(
          x521 : @kernel.Thm,
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
          let s522 = @tactics.assume_tac(x521)
          fn(
            x523 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s522(x523)
          }
        },
        x524,
      )
    }),
  )
  let t520 = @tactics.rule_assum_tac((x519 : @kernel.Thm) => {
    @lib.repeat(
      fn(x518 : @kernel.Thm) -> @kernel.Thm raise {
        let th = x518
        @bool.spec(
          @basics.genvar(
            @kernel.type_of(@basics.dest_forall(@kernel.concl(th)).0),
          ),
          th,
        )
      },
      x519,
    )
  })
  let t515 = @equal.thenc(@canon.prenex_conv, @canon.weak_cnf_conv)
  let t517 = @tactics.rule_assum_tac((x516 : @kernel.Thm) => {
    @equal.conv_rule(t515, x516)
  })
  @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.then_tac(prepare_cop_tac(ths), t517), t520),
        t525,
      ),
      t528,
    ),
    t529,
  )
}

///|
/// `PURE_LEANCOP`
pub fn pure_leancop(
  x530 : SearchOpts,
  x531 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let opt = x530
  let gl = x531
  @tactics.orelse_tac(
    @tactics.first_assum(fn(
      x532 : @kernel.Thm,
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
      let s533 = @tactics.contr_tac(x532)
      fn(
        x534 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s533(x534)
      }
    }),
    fn(
      x545 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        x544 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          x542 : @list.List[(String, @kernel.Thm)],
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
            x539 : @list.List[@kernel.Thm],
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
              x535 : @kernel.Thm,
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
              let s536 = @tactics.accept_tac(x535)
              fn(
                x537 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s536(x537)
              }
            })(
              ((x538 : @list.List[@kernel.Thm]) => leancop_deepen(opt, x538))(
                x539,
              ),
            )
          })(
            ((x541 : @list.List[(String, @kernel.Thm)]) => {
              @lib.map(
                fn(x540 : (String, @kernel.Thm)) -> @kernel.Thm raise { x540.1 },
                x541,
              )
            })(x542),
          )
        })(
          (fn(
            x543 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> @list.List[(String, @kernel.Thm)] raise {
            x543.0
          })(x544),
        )
      })(x545)(x545)
    },
  )(gl)
}

///|
/// `GEN_LEANCOP_TAC`
pub fn gen_leancop_tac(
  x546 : SearchOpts,
  x547 : @list.List[@kernel.Thm],
) -> @tactics.Tactic raise {
  let opt = x546
  let ths = x547
  @tactics.then_tac(prepare_lean_tac(ths), (
    x549 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) => pure_leancop(opt, x549))
}

///|
/// `LEANCOP_TAC`
pub fn leancop_tac(x550 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let ths = x550
  gen_leancop_tac(search_opts(), ths)
}

///|
/// `LEANCOP`
pub fn leancop(
  x552 : @list.List[@kernel.Thm],
  x553 : @kernel.Term,
) -> @kernel.Thm raise {
  let ths = x552
  let tm = x553
  @tactics.prove(tm, leancop_tac(ths))
}

///|
/// `litmat`
pub(all) enum Litmat[TA] {
  Lit(Lit)
  Mat(Imatrix[TA])
} derive(Eq, Debug)

///|
pub extend Litmat with Eq::{not_equal, equal}

///|
pub extend Litmat with Debug::{to_repr}

///|
pub extend Litmat with @lib.OCompare::{ocompare}

///|
pub extend Litmat with @lib.OHash::{ohash_visit}

///|
fn[TA] ocaml_rank_Litmat(x : Litmat[TA]) -> Int {
  match x {
    Lit(_) => 1000000
    Mat(_) => 1000001
  }
}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for Litmat[TA] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Lit(a0), Lit(b0)) => @lib.compare(a0, b0)
    (Mat(a0), Mat(b0)) => @lib.compare(a0, b0)
    _ => ocaml_rank_Litmat(self).compare(ocaml_rank_Litmat(other))
  }
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for Litmat[TA] with fn ohash_visit(self, h) {
  match self {
    Lit(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Mat(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
  }
}

///|
/// `imatrix`
pub type Imatrix[TA] = (TA, Matrix[TA])

///|
/// `matrix`
pub type Matrix[TA] = @list.List[Iclause[TA]]

///|
/// `iclause`
pub type Iclause[TA] = ((TA, @list.List[Int64]), Clause[TA])

///|
/// `clause`
pub type Clause[TA] = @list.List[Litmat[TA]]

///|
/// `map_litmat`
pub fn[TA, TB] map_litmat(
  x554 : ((Int64, @list.List[@meson.FolTerm])) -> TA raise,
  x555 : ((TB, @list.List[((TB, @list.List[Int64]), @list.List[Litmat[TB]])])) -> TA raise,
  x556 : Litmat[TB],
) -> TA raise {
  let fl = x554
  let fm = x555
  match x556 {
    Litmat::Lit(lit) => fl(lit)
    Litmat::Mat(mat) => fm(mat)
  }
}

///|
/// `lit`
pub fn[TA] lit(x557 : (Int64, @list.List[@meson.FolTerm])) -> Litmat[TA] raise {
  let x = x557
  Litmat::Lit(x)
}

///|
/// `mat`
pub fn[TA] mat(
  x558 : (TA, @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])]),
) -> Litmat[TA] raise {
  let x = x558
  Litmat::Mat(x)
}

///|
/// `lit_of_litmat`
pub fn[TA] lit_of_litmat(x559 : Litmat[TA]) -> Lit? raise {
  match x559 {
    Litmat::Lit(l) => Some(l)
    Litmat::Mat(_) => None
  }
}

///|
/// `clause_lits`
pub fn[TA] clause_lits(x560 : @list.List[Litmat[TA]]) -> @list.List[Lit] raise {
  let c = x560
  @firstorder.filter_map(lit_of_litmat, c)
}

///|
/// `clause_of_matrix`
pub fn clause_of_matrix(
  x561 : @list.List[((Unit, @list.List[Int64]), @list.List[Litmat[Unit]])],
) -> Clause[Unit] raise {
  match x561 {
    More(((_, Empty), c), tail=Empty) => c
    lm => @list.List([Litmat::Mat(((), lm))])
  }
}

///|
/// `strip_disj`
pub fn strip_disj(x562 : @meson.FolForm) -> @list.List[@meson.FolForm] raise {
  match x562 {
    @meson.FolForm::Disj(l, r) => {
      let t563 = strip_disj(r)
      strip_disj(l).concat(t563)
    }
    x => @list.List([x])
  }
}

///|
/// `strip_conj`
pub fn strip_conj(x564 : @meson.FolForm) -> @list.List[@meson.FolForm] raise {
  match x564 {
    @meson.FolForm::Conj(l, r) => {
      let t565 = strip_conj(r)
      strip_conj(l).concat(t565)
    }
    x => @list.List([x])
  }
}

///|
/// `strip_forallq`
pub fn strip_forallq(
  x566 : @list.List[Int64],
  x567 : @meson.FolForm,
) -> (@list.List[Int64], @meson.FolForm) raise {
  let acc = x566
  match x567 {
    @meson.FolForm::Forallq(x, t) => strip_forallq(acc.prepend(x), t)
    t_1 => (@lib.rev(acc), t_1)
  }
}

///|
/// `litmat_of_form`
pub fn litmat_of_form(x568 : @meson.FolForm) -> Litmat[Unit] raise {
  match x568 {
    @meson.FolForm::Atom(t) => Litmat::Lit(t)
    (@meson.FolForm::Conj(_, _) as t_1)
    | (@meson.FolForm::Forallq(_, _) as t_1) =>
      Litmat::Mat(((), matrix_of_form(t_1)))
    _ => raise Failure("litmat_of_form")
  }
}

///|
/// `matrix_of_form`
pub fn matrix_of_form(x569 : @meson.FolForm) -> Matrix[Unit] raise {
  let t_2 = x569
  @lib.map(iclause_of_form, strip_conj(t_2))
}

///|
/// `clause_of_form`
pub fn clause_of_form(x570 : @meson.FolForm) -> Clause[Unit] raise {
  let t_3 = x570
  @lib.map(litmat_of_form, strip_disj(t_3))
}

///|
/// `iclause_of_form`
pub fn iclause_of_form(x571 : @meson.FolForm) -> Iclause[Unit] raise {
  let t_4 = x571
  let (univ, t_p) = strip_forallq(@list.List([]), t_4)
  (((), univ), clause_of_form(t_p))
}

///|
/// `litmat_max_var`
pub fn[TA] litmat_max_var(x572 : Int64) -> ((Litmat[TA]) -> Int64 raise) raise {
  let acc = x572
  (x576 : Litmat[TA]) => {
    map_litmat(
      (x574 : (Int64, @list.List[@meson.FolTerm])) => lit_max_var(acc, x574),
      (
        x575 : (
          TA,
          @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
        ),
      ) => imatrix_max_var(acc, x575),
      x576,
    )
  }
}

///|
/// `imatrix_max_var`
pub fn[TA] imatrix_max_var(
  x577 : Int64,
  x578 : (TA, @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])]),
) -> Int64 raise {
  let acc_1 = x577
  let (_, m) = x578
  matrix_max_var(acc_1, m)
}

///|
/// `iclause_max_var`
pub fn[TA] iclause_max_var(
  x579 : Int64,
  x580 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
) -> Int64 raise {
  let acc_2 = x579
  let (_, c) = x580
  clause_max_var_v1(acc_2, c)
}

///|
/// `matrix_max_var`
pub fn[TA] matrix_max_var(
  x581 : Int64,
  x582 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
) -> Int64 raise {
  let acc_3 = x581
  let m_1 = x582
  @lib.fold_left(iclause_max_var, acc_3, m_1)
}

///|
/// `clause_max_var`
pub fn[TA] clause_max_var_v1(
  x583 : Int64,
  x584 : @list.List[Litmat[TA]],
) -> Int64 raise {
  let acc_4 = x583
  let c_1 = x584
  @lib.fold_left(
    fn(x585 : Int64, x586 : Litmat[TA]) -> Int64 raise {
      let s587 = litmat_max_var(x585)
      s587(x586)
    },
    acc_4,
    c_1,
  )
}

///|
/// `clause_offset`
pub fn[TA] clause_offset(x588 : @list.List[Litmat[TA]]) -> Int64 raise {
  let c = x588
  @lib.add63(1L, clause_max_var_v1(-1L, c))
}

///|
/// `iclause_offset`
pub fn[TA] iclause_offset(
  x589 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
) -> Int64 raise {
  let c = x589
  @lib.add63(1L, iclause_max_var(-1L, c))
}

///|
/// `clause_ground`
pub fn[TA] clause_ground(x590 : @list.List[Litmat[TA]]) -> Bool raise {
  let c = x590
  @lib.forall(
    fn(x591 : Litmat[TA]) -> Bool raise {
      match x591 {
        Litmat::Lit(l) => lit_ground(l.0, l.1)
        Litmat::Mat(_) => false
      }
    },
    c,
  )
}

///|
/// `index_imatrix`
pub fn[TA] index_imatrix(
  x592 : Int64,
  x593 : (TA, @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])]),
) -> (Int64, Imatrix[Int64]) raise {
  let i = x592
  let (_, m) = x593
  let (j, m_p) = index_matrix(@lib.add63(i, 1L), m)
  (j, (i, m_p))
}

///|
/// `index_matrix`
pub fn[TA] index_matrix(
  x594 : Int64,
  x595 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
) -> (Int64, Matrix[Int64]) raise {
  let i_1 = x594
  let m_1 = x595
  @firstorder.fold_map(
    fn(
      x596 : Int64,
    ) -> ((((TA, @list.List[Int64]), @list.List[Litmat[TA]])) -> (
      Int64,
      ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
    ) raise) raise {
      fn(
        x597 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
      ) -> (Int64, ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])) raise {
        index_iclause(x596, x597)
      }
    },
    i_1,
    m_1,
  )
}

///|
/// `index_iclause`
pub fn[TA] index_iclause(
  x598 : Int64,
  x599 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
) -> (Int64, Iclause[Int64]) raise {
  let i_2 = x598
  let ((_, v), c) = x599
  let (j_1, c_p) = index_clause(@lib.add63(i_2, 1L), c)
  (j_1, ((i_2, v), c_p))
}

///|
/// `index_clause`
pub fn[TA] index_clause(
  x600 : Int64,
  x601 : @list.List[Litmat[TA]],
) -> (Int64, Clause[Int64]) raise {
  let i_3 = x600
  let c_1 = x601
  @firstorder.fold_map(
    fn(x602 : Int64) -> ((Litmat[TA]) -> (Int64, Litmat[Int64]) raise) raise {
      fn(x603 : Litmat[TA]) -> (Int64, Litmat[Int64]) raise {
        index_litmat(x602, x603)
      }
    },
    i_3,
    c_1,
  )
}

///|
/// `index_litmat`
pub fn[TA] index_litmat(
  x604 : Int64,
  x605 : Litmat[TA],
) -> (Int64, Litmat[Int64]) raise {
  let i_4 = x604
  match x605 {
    Litmat::Lit(l) => (i_4, Litmat::Lit(l))
    Litmat::Mat(m_2) => {
      let (j_2, m_p_1) = index_imatrix(i_4, m_2)
      (j_2, Litmat::Mat(m_p_1))
    }
  }
}

///|
/// `index_matrix`
pub fn[TA] index_matrix_v1(
  x606 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
) -> Matrix[Int64] raise {
  let m = x606
  index_matrix(0L, m).1
}

///|
/// `map_imatrix`
pub fn[TA, TB] map_imatrix(
  x607 : (TB) -> TA raise,
  x608 : (TB, @list.List[((TB, @list.List[Int64]), @list.List[Litmat[TB]])]),
) -> Imatrix[TA] raise {
  let f = x607
  let (t, m) = x608
  let t609 = map_matrix(f)(m)
  (f(t), t609)
}

///|
/// `map_matrix`
pub fn[TA, TB] map_matrix(
  x610 : (TB) -> TA raise,
) -> ((Matrix[TB]) -> Matrix[TA] raise) raise {
  let f_1 = x610
  x613 => {
    @lib.map(
      (x612 : ((TB, @list.List[Int64]), @list.List[Litmat[TB]])) => {
        map_iclause(f_1, x612)
      },
      x613,
    )
  }
}

///|
/// `map_iclause`
pub fn[TA, TB] map_iclause(
  x614 : (TB) -> TA raise,
  x615 : ((TB, @list.List[Int64]), @list.List[Litmat[TB]]),
) -> Iclause[TA] raise {
  let f_2 = x614
  let ((t_1, v), c) = x615
  let t616 = map_clause(f_2)(c)
  ((f_2(t_1), v), t616)
}

///|
/// `map_clause`
pub fn[TA, TB] map_clause(
  x617 : (TB) -> TA raise,
) -> ((Clause[TB]) -> Clause[TA] raise) raise {
  let f_3 = x617
  x622 => {
    @lib.map(
      (x621 : Litmat[TB]) => {
        map_litmat(
          lit,
          (
            x620 : (
              TB,
              @list.List[((TB, @list.List[Int64]), @list.List[Litmat[TB]])],
            ),
          ) => {
            @firstorder.op_percent(
              mat,
              (
                x619 : (
                  TB,
                  @list.List[((TB, @list.List[Int64]), @list.List[Litmat[TB]])],
                ),
              ) => map_imatrix(f_3, x619),
              x620,
            )
          },
          x621,
        )
      },
      x622,
    )
  }
}

///|
/// `copy_matrix`
pub fn[TA, TB] copy_matrix(
  x623 : TB,
) -> ((Matrix[TA]) -> Matrix[(TA, TB)] raise) raise {
  let k = x623
  map_matrix(fn(x625 : TA) -> (TA, TB) raise {
    let i = x625
    (i, k)
  })
}

///|
/// `copy_clause`
pub fn[TA, TB] copy_clause(
  x626 : TB,
) -> ((Clause[TA]) -> Clause[(TA, TB)] raise) raise {
  let k = x626
  map_clause(fn(x628 : TA) -> (TA, TB) raise {
    let i = x628
    (i, k)
  })
}

///|
/// `break_map`
pub fn[TA, TB] break_map(
  x629 : (TB) -> TA? raise,
  x630 : @list.List[TB],
) -> @list.List[TA]? raise {
  let f = x629
  match x630 {
    Empty => Some(@list.List([]))
    More(x, tail=xs) =>
      @firstorder.op_gt_gt_eq(f(x), fn(x631 : TA) -> @list.List[TA]? raise {
        let y = x631
        @firstorder.op_gt_gt_eq(break_map(f, xs), fn(
          x632 : @list.List[TA],
        ) -> @list.List[TA]? raise {
          let ys = x632
          Some(ys.prepend(y))
        })
      })
  }
}

///|
/// `litmat_positive`
pub fn[TA] litmat_positive(x633 : Litmat[TA]) -> Litmat[TA]? raise {
  let lm = x633
  map_litmat(
    fn(x634 : (Int64, @list.List[@meson.FolTerm])) -> Litmat[TA]? raise {
      lit_positive(x634.0, x634.1)
    },
    fn(
      x635 : (TA, @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])]),
    ) -> Litmat[TA]? raise {
      imatrix_positive(x635.0, x635.1)
    },
    lm,
  )
}

///|
/// `lit_positive`
pub fn[TA] lit_positive(
  x636 : Int64,
  x637 : @list.List[@meson.FolTerm],
) -> Litmat[TA]? raise {
  let (p, a) = (x636, x637)
  if p < 0L {
    Some(Litmat::Lit((p, a)))
  } else {
    None
  }
}

///|
/// `imatrix_positive`
pub fn[TA] imatrix_positive(
  x638 : TA,
  x639 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
) -> Litmat[TA]? raise {
  let (i, m) = (x638, x639)
  match matrix_positive(m) {
    Empty => None
    m_p => Some(Litmat::Mat((i, m_p)))
  }
}

///|
/// `matrix_positive`
pub fn[TA] matrix_positive(
  x640 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
) -> Matrix[TA] raise {
  let m_1 = x640
  @firstorder.filter_map(
    fn(
      x641 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
    ) -> ((TA, @list.List[Int64]), @list.List[Litmat[TA]])? raise {
      iclause_positive(x641.0, x641.1)
    },
    m_1,
  )
}

///|
/// `iclause_positive`
pub fn[TA] iclause_positive(
  x642 : (TA, @list.List[Int64]),
  x643 : @list.List[Litmat[TA]],
) -> Iclause[TA]? raise {
  let (i_1, c) = (x642, x643)
  @firstorder.op_gt_gt_eq(clause_positive(c), fn(
    x644 : @list.List[Litmat[TA]],
  ) -> ((TA, @list.List[Int64]), @list.List[Litmat[TA]])? raise {
    let c_p = x644
    Some((i_1, c_p))
  })
}

///|
/// `clause_positive`
pub fn[TA] clause_positive(x645 : @list.List[Litmat[TA]]) -> Clause[TA]? raise {
  let c_1 = x645
  break_map(litmat_positive, c_1)
}

///|
/// `map_litmat_vars`
pub fn[TA] map_litmat_vars(
  x646 : (Int64) -> Int64 raise,
) -> ((Litmat[TA]) -> Litmat[TA] raise) raise {
  let f = x646
  (x653 : Litmat[TA]) => {
    map_litmat(
      (x650 : (Int64, @list.List[@meson.FolTerm])) => {
        @firstorder.op_percent(
          lit,
          (x649 : (Int64, @list.List[@meson.FolTerm])) => {
            map_lit_vars(
              (x648 : Int64) => @firstorder.op_percent(var_, f, x648),
              x649,
            )
          },
          x650,
        )
      },
      (
        x652 : (
          TA,
          @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
        ),
      ) => {
        @firstorder.op_percent(
          mat,
          (
            x651 : (
              TA,
              @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
            ),
          ) => map_imatrix_vars(f, x651),
          x652,
        )
      },
      x653,
    )
  }
}

///|
/// `map_imatrix_vars`
pub fn[TA] map_imatrix_vars(
  x654 : (Int64) -> Int64 raise,
  x655 : (TA, @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])]),
) -> Imatrix[TA] raise {
  let f_1 = x654
  let (i, m) = x655
  (i, map_matrix_vars(f_1, m))
}

///|
/// `map_matrix_vars`
pub fn[TA] map_matrix_vars(
  x656 : (Int64) -> Int64 raise,
  x657 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
) -> Matrix[TA] raise {
  let f_2 = x656
  let m_1 = x657
  @lib.map(
    (x658 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]])) => {
      map_iclause_vars(f_2, x658)
    },
    m_1,
  )
}

///|
/// `map_iclause_vars`
pub fn[TA] map_iclause_vars(
  x659 : (Int64) -> Int64 raise,
  x660 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
) -> Iclause[TA] raise {
  let f_3 = x659
  let ((i_1, v), c) = x660
  let t661 = map_clause_vars(f_3, c)
  ((i_1, @lib.map(f_3, v)), t661)
}

///|
/// `map_clause_vars`
pub fn[TA] map_clause_vars(
  x662 : (Int64) -> Int64 raise,
  x663 : @list.List[Litmat[TA]],
) -> Clause[TA] raise {
  let f_4 = x662
  let c_1 = x663
  @lib.map(map_litmat_vars(f_4), c_1)
}

///|
/// `offset_iclause`
pub fn[TA] offset_iclause(
  x664 : Int64,
) -> ((Iclause[TA]) -> Iclause[TA] raise) raise {
  let off = x664
  (x667 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]])) => {
    map_iclause_vars(
      fn(x666 : Int64) -> Int64 raise { @lib.add63(off, x666) },
      x667,
    )
  }
}

///|
/// `offset_clause`
pub fn[TA] offset_clause(
  x668 : Int64,
) -> ((Clause[TA]) -> Clause[TA] raise) raise {
  let off = x668
  (x671 : @list.List[Litmat[TA]]) => {
    map_clause_vars(
      fn(x670 : Int64) -> Int64 raise { @lib.add63(off, x670) },
      x671,
    )
  }
}

///|
/// `offset_matrix`
pub fn[TA] offset_matrix(
  x672 : Int64,
) -> ((Matrix[TA]) -> Matrix[TA] raise) raise {
  let off = x672
  (x675 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])]) => {
    map_matrix_vars(
      fn(x674 : Int64) -> Int64 raise { @lib.add63(off, x674) },
      x675,
    )
  }
}

///|
/// `pp_print_litmat`
pub fn[TA, TB] pp_print_litmat(
  x676 : (@pp.Formatter) -> ((TB) -> TA raise) raise,
  x677 : @pp.Formatter,
  x678 : Litmat[TB],
) -> Unit raise {
  let fi = x676
  let f = x677
  match x678 {
    Litmat::Lit(l) => pp_print_lit(f, l)
    Litmat::Mat(m) => pp_print_imatrix(fi, f, m)
  }
}

///|
/// `pp_print_imatrix`
pub fn[TA, TB] pp_print_imatrix(
  x679 : (@pp.Formatter) -> ((TB) -> TA raise) raise,
  x680 : @pp.Formatter,
  x681 : (TB, @list.List[((TB, @list.List[Int64]), @list.List[Litmat[TB]])]),
) -> Unit raise {
  let fi_1 = x679
  let f_1 = x680
  let (i, m_1) = x681
  @pp.Formatter::open_box(f_1, 1)
  ignore(fi_1(f_1)(i))
  pp_print_matrix(fi_1)(f_1)(m_1)
  @pp.Formatter::close_box(f_1)
}

///|
/// `pp_print_matrix`
pub fn[TA, TB] pp_print_matrix(
  x682 : (@pp.Formatter) -> ((TA) -> TB raise) raise,
) -> ((@pp.Formatter) -> ((Matrix[TA]) -> Unit raise) raise) raise {
  let fi_2 = x682
  let t688 = pp_enclose_cut(
    "[",
    "]",
    pp_iter_sp("&", fn(
      x686 : @pp.Formatter,
    ) -> ((((TA, @list.List[Int64]), @list.List[Litmat[TA]])) -> Unit raise) raise {
      fn(
        x687 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
      ) -> Unit raise {
        ((
          x684 : @pp.Formatter,
          x685 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
        ) => pp_print_iclause(fi_2, x684, x685))(x686, x687)
      }
    }),
  )
  fn(
    x691 : @pp.Formatter,
  ) -> ((@list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])]) -> Unit raise) raise {
    fn(
      x692 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
    ) -> Unit raise {
      ((
        x689 : @pp.Formatter,
        x690 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
      ) => pp_with_box(1L, t688, x689, x690))(x691, x692)
    }
  }
}

///|
/// `pp_print_iclause`
pub fn[TA, TB] pp_print_iclause(
  x693 : (@pp.Formatter) -> ((TB) -> TA raise) raise,
  x694 : @pp.Formatter,
  x695 : ((TB, @list.List[Int64]), @list.List[Litmat[TB]]),
) -> Unit raise {
  let fi_3 = x693
  let f_2 = x694
  let ((i_1, v), c) = x695
  @pp.Formatter::open_box(f_2, 1)
  ignore(fi_3(f_2)(i_1))
  pp_enum(",", "{", "}", fn(
    x696 : @pp.Formatter,
  ) -> ((Int64) -> Unit raise) raise {
    fn(x697 : Int64) -> Unit raise { pp_print_var(x696, x697) }
  })(f_2)(v)
  @pp.Formatter::print_string(f_2, Char::to_string(':'))
  @pp.Formatter::print_space(f_2)
  pp_print_nclause(fi_3)(f_2)(c)
  @pp.Formatter::close_box(f_2)
}

///|
/// `pp_print_nclause`
pub fn[TA, TB] pp_print_nclause(
  x698 : (@pp.Formatter) -> ((TA) -> TB raise) raise,
) -> ((@pp.Formatter) -> ((Clause[TA]) -> Unit raise) raise) raise {
  let fi_4 = x698
  let t704 = pp_enclose_cut(
    "[",
    "]",
    pp_iter_sp("|", fn(
      x702 : @pp.Formatter,
    ) -> ((Litmat[TA]) -> Unit raise) raise {
      fn(x703 : Litmat[TA]) -> Unit raise {
        ((x700 : @pp.Formatter, x701 : Litmat[TA]) => {
          pp_print_litmat(fi_4, x700, x701)
        })(x702, x703)
      }
    }),
  )
  fn(x707 : @pp.Formatter) -> ((@list.List[Litmat[TA]]) -> Unit raise) raise {
    fn(x708 : @list.List[Litmat[TA]]) -> Unit raise {
      ((x705 : @pp.Formatter, x706 : @list.List[Litmat[TA]]) => {
        pp_with_box(1L, t704, x705, x706)
      })(x707, x708)
    }
  }
}

///|
/// pp_print_index
fn step_13() -> Unit raise {
  pp_print_index_c.set(fn(
    x713 : @pp.Formatter,
  ) -> ((Int64) -> Unit raise) raise {
    fn(x714 : Int64) -> Unit raise {
      ((x711 : @pp.Formatter, x712 : Int64) => {
        pp_enclose(
          "<",
          ">",
          fn(x709 : @pp.Formatter) -> ((Int64) -> Unit raise) raise {
            fn(x710 : Int64) -> Unit raise {
              @pp.Formatter::print_string(x709, Int64::to_string(x710))
            }
          },
          x711,
          x712,
        )
      })(x713, x714)
    }
  })
}

///|
let pp_print_index_c : @lib.Cell[
  (@pp.Formatter) -> ((Int64) -> Unit raise) raise,
] = @lib.Cell::new("pp_print_index")

///|
/// `pp_print_index`
pub fn pp_print_index(x : @pp.Formatter) -> ((Int64) -> Unit raise) raise {
  pp_print_index_c.get()(x)
}

///|
/// `string_of_litmat`
pub fn[TA] string_of_litmat(x715 : Litmat[TA]) -> String raise {
  let c = x715
  @printer.print_to_string(fn(
    x720 : @pp.Formatter,
  ) -> ((Litmat[TA]) -> Unit raise) raise {
    fn(x721 : Litmat[TA]) -> Unit raise {
      ((x718 : @pp.Formatter, x719 : Litmat[TA]) => {
        pp_print_litmat(
          fn(x716 : @pp.Formatter) -> ((TA) -> Unit raise) raise {
            fn(x717 : TA) -> Unit raise { pp_print_null(x716, x717) }
          },
          x718,
          x719,
        )
      })(x720, x721)
    }
  })(c)
}

///|
/// `string_of_iclause`
pub fn[TA] string_of_iclause(
  x722 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
) -> String raise {
  let c = x722
  @printer.print_to_string(fn(
    x727 : @pp.Formatter,
  ) -> ((((TA, @list.List[Int64]), @list.List[Litmat[TA]])) -> Unit raise) raise {
    fn(x728 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]])) -> Unit raise {
      ((
        x725 : @pp.Formatter,
        x726 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
      ) => {
        pp_print_iclause(
          fn(x723 : @pp.Formatter) -> ((TA) -> Unit raise) raise {
            fn(x724 : TA) -> Unit raise { pp_print_null(x723, x724) }
          },
          x725,
          x726,
        )
      })(x727, x728)
    }
  })(c)
}

///|
/// string_of_iclause_i
fn step_14() -> Unit raise {
  string_of_iclause_i_c.set(
    @printer.print_to_string(fn(
      x731 : @pp.Formatter,
    ) -> ((((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])) -> Unit raise) raise {
      fn(
        x732 : ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
      ) -> Unit raise {
        ((
          x729 : @pp.Formatter,
          x730 : ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
        ) => pp_print_iclause(pp_print_index, x729, x730))(x731, x732)
      }
    }),
  )
}

///|
let string_of_iclause_i_c : @lib.Cell[(Iclause[Int64]) -> String raise] = @lib.Cell::new(
  "string_of_iclause_i",
)

///|
/// `string_of_iclause_i`
pub fn string_of_iclause_i(x : Iclause[Int64]) -> String raise {
  string_of_iclause_i_c.get()(x)
}

///|
/// `string_of_nclause`
pub fn[TA] string_of_nclause(x733 : @list.List[Litmat[TA]]) -> String raise {
  let c = x733
  @printer.print_to_string(
    pp_print_nclause(fn(x734 : @pp.Formatter) -> ((TA) -> Unit raise) raise {
      fn(x735 : TA) -> Unit raise { pp_print_null(x734, x735) }
    }),
  )(c)
}

///|
/// `string_of_matrix`
pub fn[TA] string_of_matrix(
  x736 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
) -> String raise {
  let m = x736
  @printer.print_to_string(
    pp_print_matrix(fn(x737 : @pp.Formatter) -> ((TA) -> Unit raise) raise {
      fn(x738 : TA) -> Unit raise { pp_print_null(x737, x738) }
    }),
  )(m)
}

///|
/// `pp_print_matrix_ni`
pub fn[TA] pp_print_matrix_ni(
  x739 : @pp.Formatter,
  x740 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
) -> Unit raise {
  let fmt = x739
  let x = x740
  pp_print_matrix(fn(x741 : @pp.Formatter) -> ((TA) -> Unit raise) raise {
    fn(x742 : TA) -> Unit raise { pp_print_null(x741, x742) }
  })(fmt)(x)
}

///|
/// `print_iclause`
pub fn[TA] print_iclause(
  x743 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
) -> Unit raise {
  let c = x743
  pp_nl(
    fn(
      x748 : @pp.Formatter,
    ) -> ((((TA, @list.List[Int64]), @list.List[Litmat[TA]])) -> Unit raise) raise {
      fn(
        x749 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
      ) -> Unit raise {
        ((
          x746 : @pp.Formatter,
          x747 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
        ) => {
          pp_print_iclause(
            fn(x744 : @pp.Formatter) -> ((TA) -> Unit raise) raise {
              fn(x745 : TA) -> Unit raise { pp_print_null(x744, x745) }
            },
            x746,
            x747,
          )
        })(x748, x749)
      }
    },
    @pp.std_formatter,
    c,
  )
}

///|
/// print_iclause_i
fn step_15() -> Unit raise {
  print_iclause_i_c.set((
    x754 : ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
  ) => {
    pp_nl(
      fn(
        x752 : @pp.Formatter,
      ) -> ((((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])) -> Unit raise) raise {
        fn(
          x753 : ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
        ) -> Unit raise {
          ((
            x750 : @pp.Formatter,
            x751 : ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
          ) => pp_print_iclause(pp_print_index, x750, x751))(x752, x753)
        }
      },
      @pp.std_formatter,
      x754,
    )
  })
}

///|
let print_iclause_i_c : @lib.Cell[(Iclause[Int64]) -> Unit raise] = @lib.Cell::new(
  "print_iclause_i",
)

///|
/// `print_iclause_i`
pub fn print_iclause_i(x : Iclause[Int64]) -> Unit raise {
  print_iclause_i_c.get()(x)
}

///|
/// `print_nclause`
pub fn[TA] print_nclause(x755 : @list.List[Litmat[TA]]) -> Unit raise {
  let c = x755
  pp_nl(
    pp_print_nclause(fn(x756 : @pp.Formatter) -> ((TA) -> Unit raise) raise {
      fn(x757 : TA) -> Unit raise { pp_print_null(x756, x757) }
    }),
    @pp.std_formatter,
    c,
  )
}

///|
/// print_matrix_i
fn step_16() -> Unit raise {
  let t758 = pp_print_matrix(pp_print_index)
  print_matrix_i_c.set((
    x759 : @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
  ) => pp_nl(t758, @pp.std_formatter, x759))
}

///|
let print_matrix_i_c : @lib.Cell[(Matrix[Int64]) -> Unit raise] = @lib.Cell::new(
  "print_matrix_i",
)

///|
/// `print_matrix_i`
pub fn print_matrix_i(x : Matrix[Int64]) -> Unit raise {
  print_matrix_i_c.get()(x)
}

///|
/// `proof`
pub(all) enum Proof1[TA, TB, TC, TD] {
  Lemma
  Reduction
  Decomposition(TB, TC, @list.List[(TA, Proof1[TA, TB, TC, TD])])
  Extension(TB, TD, @list.List[(TA, Proof1[TA, TB, TC, TD])])
} derive(Eq, Debug)

///|
pub extend Proof1 with Eq::{not_equal, equal}

///|
pub extend Proof1 with Debug::{to_repr}

///|
pub extend Proof1 with @lib.OCompare::{ocompare}

///|
pub extend Proof1 with @lib.OHash::{ohash_visit}

///|
fn[TA, TB, TC, TD] ocaml_rank_Proof1(x : Proof1[TA, TB, TC, TD]) -> Int {
  match x {
    Lemma => 0
    Reduction => 1
    Decomposition(_, _, _) => 1000000
    Extension(_, _, _) => 1000001
  }
}

///|
pub impl[
  TA : @lib.OCompare,
  TB : @lib.OCompare,
  TC : @lib.OCompare,
  TD : @lib.OCompare,
] @lib.OCompare for Proof1[TA, TB, TC, TD] with fn ocompare(self, other) {
  match (self, other) {
    (Decomposition(a0, a1, a2), Decomposition(b0, b1, b2)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      @lib.compare(a2, b2)
    }
    (Extension(a0, a1, a2), Extension(b0, b1, b2)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      @lib.compare(a2, b2)
    }
    _ => ocaml_rank_Proof1(self).compare(ocaml_rank_Proof1(other))
  }
}

///|
pub impl[TA : @lib.OHash, TB : @lib.OHash, TC : @lib.OHash, TD : @lib.OHash] @lib.OHash for Proof1[
  TA,
  TB,
  TC,
  TD,
] with fn ohash_visit(self, h) {
  match self {
    Lemma => h.int(0L)
    Reduction => h.int(1L)
    Decomposition(a0, a1, a2) => {
      h.block(0, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
    Extension(a0, a1, a2) => {
      h.block(1, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
  }
}

///|
/// `pp_print_proof`
pub fn[TA, TB, TC, TD, TE] pp_print_proof(
  x760 : ((TB) -> ((TA) -> String raise) raise, (TC) -> String raise),
  x761 : TB,
  x762 : @pp.Formatter,
  x763 : (TA, Proof1[TA, TC, TD, TE]),
) -> Unit raise {
  let (fl, fc) = x760
  let sub = x761
  let f = x762
  let (lit_1, prf) = x763
  @pp.Formatter::open_vbox(f, 2)
  @pp.Formatter::print_string(f, fl(sub)(lit_1))
  @pp.Formatter::print_string(f, Char::to_string(' '))
  pp_print_prf((fl, fc), sub, f, prf)
  @pp.Formatter::close_box(f)
}

///|
/// `pp_print_prf`
pub fn[TA, TB, TC, TD, TE] pp_print_prf(
  x764 : ((TB) -> ((TA) -> String raise) raise, (TC) -> String raise),
  x765 : TB,
  x766 : @pp.Formatter,
  x767 : Proof1[TA, TC, TD, TE],
) -> Unit raise {
  let (fl_1, fc_1) = x764
  let sub_1 = x765
  let f_1 = x766
  match x767 {
    Proof1::Reduction => @pp.Formatter::print_string(f_1, "Red")
    Proof1::Lemma => @pp.Formatter::print_string(f_1, "Lem")
    Proof1::Decomposition(cl, recon, prfs) => {
      @pp.Formatter::print_string(f_1, "Dec " + fc_1(cl))
      pp_print_proofs((fl_1, fc_1), sub_1, f_1)(prfs)
    }
    Proof1::Extension(cl_1, recon_1, prfs_1) => {
      @pp.Formatter::print_string(f_1, "Ext " + fc_1(cl_1))
      pp_print_proofs((fl_1, fc_1), sub_1, f_1)(prfs_1)
    }
  }
}

///|
/// `pp_print_proofs`
pub fn[TA, TB, TC, TD, TE] pp_print_proofs(
  x768 : ((TE) -> ((TA) -> String raise) raise, (TB) -> String raise),
  x769 : TE,
  x770 : @pp.Formatter,
) -> ((@list.List[(TA, Proof1[TA, TB, TC, TD])]) -> Unit raise) raise {
  let (fl_2, fc_2) = x768
  let sub_2 = x769
  let f_2 = x770
  x773 => {
    @lib.do_list(
      fn(x772 : (TA, Proof1[TA, TB, TC, TD])) -> Unit raise {
        let x = x772
        @pp.Formatter::print_cut(f_2)
        pp_print_proof((fl_2, fc_2), sub_2, f_2, x)
      },
      x773,
    )
  }
}

///|
/// `string_of_inst_litmat`
pub fn[TA, TB] string_of_inst_litmat(
  x774 : TA,
  x775 : Litmat[TB],
) -> String raise {
  let sub = x774
  let litmat = x775
  string_of_litmat(litmat)
}

///|
/// `print_proofa`
pub fn[TA, TB, TC, TD, TE] print_proofa(
  x776 : ((TB) -> ((TA) -> String raise) raise, (TC) -> String raise),
  x777 : TB,
  x778 : (TA, Proof1[TA, TC, TD, TE]),
) -> Unit raise {
  let (fl, fc) = x776
  let sub = x777
  let prf = x778
  pp_nl(
    fn(
      x781 : @pp.Formatter,
    ) -> (((TA, Proof1[TA, TC, TD, TE])) -> Unit raise) raise {
      fn(x782 : (TA, Proof1[TA, TC, TD, TE])) -> Unit raise {
        ((x779 : @pp.Formatter, x780 : (TA, Proof1[TA, TC, TD, TE])) => {
          pp_print_proof((fl, fc), sub, x779, x780)
        })(x781, x782)
      }
    },
    @pp.std_formatter,
    prf,
  )
}

///|
/// `print_proof_def`
pub fn[TA, TB, TC, TD, TE] print_proof_def(
  x783 : TA,
  x784 : (Litmat[TB], Proof1[Litmat[TB], @list.List[Litmat[TC]], TD, TE]),
) -> Unit raise {
  let sub = x783
  let prf = x784
  print_proofa(
    (
      fn(x785 : TA) -> ((Litmat[TB]) -> String raise) raise {
        fn(x786 : Litmat[TB]) -> String raise {
          string_of_inst_litmat(x785, x786)
        }
      },
      string_of_nclause,
    ),
    sub,
    prf,
  )
}

///|
/// `litmat_ext`
pub(all) enum LitmatExt[TA] {
  Litext((Clause[TA], Clause[TA]), Clause[TA])
  Matext(Int64, (Clause[TA], Clause[TA]), ClauseExt[TA])
} derive(Eq, Debug)

///|
pub extend LitmatExt with Eq::{not_equal, equal}

///|
pub extend LitmatExt with Debug::{to_repr}

///|
pub extend LitmatExt with @lib.OCompare::{ocompare}

///|
pub extend LitmatExt with @lib.OHash::{ohash_visit}

///|
fn[TA] ocaml_rank_LitmatExt(x : LitmatExt[TA]) -> Int {
  match x {
    Litext(_, _) => 1000000
    Matext(_, _, _) => 1000001
  }
}

///|
pub impl[TA : @lib.OCompare] @lib.OCompare for LitmatExt[TA] with fn ocompare(
  self,
  other,
) {
  match (self, other) {
    (Litext(a0, a1), Litext(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Matext(a0, a1, a2), Matext(b0, b1, b2)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      @lib.compare(a2, b2)
    }
    _ => ocaml_rank_LitmatExt(self).compare(ocaml_rank_LitmatExt(other))
  }
}

///|
pub impl[TA : @lib.OHash] @lib.OHash for LitmatExt[TA] with fn ohash_visit(
  self,
  h,
) {
  match self {
    Litext(a0, a1) => {
      h.block(0, 2)
      h.field(a0)
      h.field(a1)
    }
    Matext(a0, a1, a2) => {
      h.block(1, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
  }
}

///|
/// `clause_ext`
pub type ClauseExt[TA] = (
  (Int64, @list.List[TA]),
  (Matrix[TA], Matrix[TA]),
  LitmatExt[TA],
)

///|
/// `offset_iv`
pub fn[TA] offset_iv(
  x787 : Int64,
  x788 : (TA, @list.List[Int64]),
) -> (TA, @list.List[Int64]) raise {
  let off = x787
  let (i, v) = x788
  (i, @lib.map(fn(x789 : Int64) -> Int64 raise { @lib.add63(off, x789) }, v))
}

///|
/// `offset_litmat_ext`
pub fn offset_litmat_ext(
  x790 : Int64,
  x791 : LitmatExt[Int64],
) -> LitmatExt[Int64] raise {
  let off = x790
  match x791 {
    LitmatExt::Litext(clab, clac) => {
      let t792 = offset_clause(off)(clac)
      LitmatExt::Litext(@firstorder.mapn(offset_clause(off), clab), t792)
    }
    LitmatExt::Matext(j, clalr, clext) => {
      let t793 = offset_clause_ext(off, clext)
      LitmatExt::Matext(j, @firstorder.mapn(offset_clause(off), clalr), t793)
    }
  }
}

///|
/// `offset_clause_ext`
pub fn offset_clause_ext(
  x794 : Int64,
  x795 : (
    (Int64, @list.List[Int64]),
    (
      @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
      @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
    ),
    LitmatExt[Int64],
  ),
) -> ClauseExt[Int64] raise {
  let off_1 = x794
  let (iv, matlr, lmext) = x795
  let t796 = offset_litmat_ext(off_1, lmext)
  let t797 = @firstorder.mapn(offset_matrix(off_1), matlr)
  (offset_iv(off_1, iv), t797, t796)
}

///|
/// `claBC_of_litmat_ext`
pub fn clabc_of_litmat_ext(
  x798 : LitmatExt[Int64],
) -> (@list.List[Litmat[Int64]], Clause[Int64]) raise {
  match x798 {
    LitmatExt::Litext((clal, clar), clac) => (@lib.rev_append(clal, clar), clac)
    LitmatExt::Matext(j, (clal_1, clar_1), clext) => {
      let (matb, matc) = matbc_of_clause_ext(clext.0, clext.1, clext.2)
      let clalr = @lib.rev_append(clal_1, clar_1)
      (matb.concat(clalr), clalr.prepend(Litmat::Mat((j, matc))))
    }
  }
}

///|
/// `matBC_of_clause_ext`
pub fn matbc_of_clause_ext(
  x799 : (Int64, @list.List[Int64]),
  x800 : (
    @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
    @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
  ),
  x801 : LitmatExt[Int64],
) -> (@list.List[Litmat[Int64]], Matrix[Int64]) raise {
  let (iv, (matl, matr), lmext) = (x799, x800, x801)
  let (clab, clac_1) = clabc_of_litmat_ext(lmext)
  (clab, @lib.rev_append(matl, matr).prepend((iv, clac_1)))
}

///|
/// `litext_of_litmat_ext`
pub fn[TA] litext_of_litmat_ext(
  x802 : LitmatExt[TA],
) -> ((Clause[TA], Clause[TA]), Clause[TA]) raise {
  match x802 {
    LitmatExt::Litext(clab, clac) => (clab, clac)
    LitmatExt::Matext(_, _, clext) =>
      litext_of_clause_ext(clext.0, clext.1, clext.2)
  }
}

///|
/// `litext_of_clause_ext`
pub fn[TA] litext_of_clause_ext(
  x803 : (Int64, @list.List[TA]),
  x804 : (
    @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
    @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
  ),
  x805 : LitmatExt[TA],
) -> ((Clause[TA], Clause[TA]), Clause[TA]) raise {
  let (_, _, lmext) = (x803, x804, x805)
  litext_of_litmat_ext(lmext)
}

///|
/// `assert_iclause`
pub fn assert_iclause(
  x806 : (
    @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
    @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
  ),
  x807 : ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
) -> @list.List[(Lit, ClauseExt[Int64])] raise {
  let matlr = x806
  let (iv, _ as c) = x807
  @lib.op_bar_gt(
    @lib.op_bar_gt(@firstorder.list_rest(c), (
      x811 : @list.List[
        (Litmat[Int64], (@list.List[Litmat[Int64]], @list.List[Litmat[Int64]])),
      ],
    ) => {
      @firstorder.concat_map(
        fn(
          x808 : (
            Litmat[Int64],
            (@list.List[Litmat[Int64]], @list.List[Litmat[Int64]]),
          ),
        ) -> @list.List[((Int64, @list.List[@meson.FolTerm]), LitmatExt[Int64])] raise {
          let (lm, clalr) = x808
          map_litmat(
            fn(
              x809 : (Int64, @list.List[@meson.FolTerm]),
            ) -> @list.List[
              ((Int64, @list.List[@meson.FolTerm]), LitmatExt[Int64]),
            ] raise {
              let lit_1 = x809
              @list.List([(lit_1, LitmatExt::Litext(clalr, c))])
            },
            (
              x810 : (
                Int64,
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
              ),
            ) => assert_imatrix(clalr, x810),
            lm,
          )
        },
        x811,
      )
    }),
    x813 => {
      @lib.map(
        fn(
          x812 : ((Int64, @list.List[@meson.FolTerm]), LitmatExt[Int64]),
        ) -> (
          (Int64, @list.List[@meson.FolTerm]),
          (
            (Int64, @list.List[Int64]),
            (
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
            ),
            LitmatExt[Int64],
          ),
        ) raise {
          let (lit_2, lmext) = x812
          (lit_2, (iv, matlr, lmext))
        },
        x813,
      )
    },
  )
}

///|
/// `assert_imatrix`
pub fn assert_imatrix(
  x814 : (@list.List[Litmat[Int64]], @list.List[Litmat[Int64]]),
  x815 : (
    Int64,
    @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
  ),
) -> @list.List[(Lit, LitmatExt[Int64])] raise {
  let clalr_1 = x814
  let (j, mat_1) = x815
  @lib.op_bar_gt(
    @lib.op_bar_gt(@firstorder.list_rest(mat_1), (
      x817 : @list.List[
        (
          ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
          (
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
          ),
        ),
      ],
    ) => {
      @firstorder.concat_map(
        fn(
          x816 : (
            ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
            (
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
            ),
          ),
        ) -> @list.List[
          (
            (Int64, @list.List[@meson.FolTerm]),
            (
              (Int64, @list.List[Int64]),
              (
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
              ),
              LitmatExt[Int64],
            ),
          ),
        ] raise {
          let (cla, matlr_1) = x816
          assert_iclause(matlr_1, cla)
        },
        x817,
      )
    }),
    x819 => {
      @lib.map(
        fn(
          x818 : (
            (Int64, @list.List[@meson.FolTerm]),
            (
              (Int64, @list.List[Int64]),
              (
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
              ),
              LitmatExt[Int64],
            ),
          ),
        ) -> ((Int64, @list.List[@meson.FolTerm]), LitmatExt[Int64]) raise {
          let (lit_3, claext) = x818
          (lit_3, LitmatExt::Matext(j, clalr_1, claext))
        },
        x819,
      )
    },
  )
}

///|
/// `assert_matrix`
pub fn assert_matrix(
  x820 : @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
) -> @list.List[(Lit, ClauseExt[Int64])] raise {
  let mat_1 = x820
  @lib.op_bar_gt(@firstorder.list_rest(mat_1), (
    x822 : @list.List[
      (
        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
        (
          @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
          @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
        ),
      ),
    ],
  ) => {
    @firstorder.concat_map(
      fn(
        x821 : (
          ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
          (
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
          ),
        ),
      ) -> @list.List[
        (
          (Int64, @list.List[@meson.FolTerm]),
          (
            (Int64, @list.List[Int64]),
            (
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
            ),
            LitmatExt[Int64],
          ),
        ),
      ] raise {
        let (cla, matlr) = x821
        assert_iclause(matlr, cla)
      },
      x822,
    )
  })
}

///|
/// `contrapositive`
pub type Contrapositive1[TA] = (
  ClauseExt[TA],
  @list.List[@meson.FolTerm],
  Bool,
  Int64,
)

///|
/// db
fn step_17() -> Unit raise {
  db_v1_c.set(@lib.hashtbl_create(10000))
}

///|
let db_v1_c : @lib.Cell[
  @lib.OHashtbl[Int64, @list.List[Contrapositive1[Int64]]],
] = @lib.Cell::new("db")

///|
/// `db`
pub fn db_v1() -> @lib.OHashtbl[Int64, @list.List[Contrapositive1[Int64]]] {
  db_v1_c.get()
}

///|
/// `insert_db`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] insert_db(
  x823 : @lib.OHashtbl[
    TA,
    @list.List[
      (
        (
          (Int64, @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
          ),
          LitmatExt[Int64],
        ),
        TB,
        Bool,
        Int64,
      ),
    ],
  ],
  x824 : (
    (TA, TB),
    (
      (Int64, @list.List[Int64]),
      (
        @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
        @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
      ),
      LitmatExt[Int64],
    ),
  ),
) -> Unit raise {
  let db_1 = x823
  let ((p, a), clext) = x824
  let matc = matbc_of_clause_ext(clext.0, clext.1, clext.2).1
  let off = @lib.add63(1L, matrix_max_var(-1L, matc))
  let ground = @lib.op_bar_gt(
    @lib.op_bar_gt(litext_of_clause_ext(clext.0, clext.1, clext.2), fn(
      x825 : (
        (@list.List[Litmat[Int64]], @list.List[Litmat[Int64]]),
        @list.List[Litmat[Int64]],
      ),
    ) -> @list.List[Litmat[Int64]] raise {
      x825.1
    }),
    clause_ground,
  )
  let v = (clext, a, ground, off)
  @lib.op_bar_gt(
    @lib.op_bar_gt(@lib.hashtbl_find(db_1, p), fn(
      x826 : @list.List[
        (
          (
            (Int64, @list.List[Int64]),
            (
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
            ),
            LitmatExt[Int64],
          ),
          TB,
          Bool,
          Int64,
        ),
      ],
    ) -> @list.List[
      (
        (
          (Int64, @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
          ),
          LitmatExt[Int64],
        ),
        TB,
        Bool,
        Int64,
      ),
    ] raise {
      let l = x826
      l.prepend(v)
    }),
    fn(
      x827 : @list.List[
        (
          (
            (Int64, @list.List[Int64]),
            (
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
            ),
            LitmatExt[Int64],
          ),
          TB,
          Bool,
          Int64,
        ),
      ],
    ) -> Unit raise {
      @lib.hashtbl_replace(db_1, p, x827)
    },
  ) catch {
    @lib.NotFound => @lib.hashtbl_add(db_1, p, @list.List([v]))
    e => raise e
  }
}

///|
/// `matrix2db`
pub fn matrix2db(
  x828 : @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
) -> Unit raise {
  let m = x828
  let predb = assert_matrix(m)
  @lib.hashtbl_clear(db_v1())
  @lib.do_list(
    (
      x829 : (
        (Int64, @list.List[@meson.FolTerm]),
        (
          (Int64, @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
          ),
          LitmatExt[Int64],
        ),
      ),
    ) => insert_db(db_v1(), x829),
    @lib.rev(predb),
  )
}

///|
/// `db_entries`
pub fn[TA] db_entries_v1(
  x830 : (Int64, TA),
) -> @list.List[Contrapositive1[Int64]] raise {
  let lit_1 = x830
  @lib.hashtbl_find(db_v1(), lit_1.0) catch {
    @lib.NotFound => @list.List([])
    e => raise e
  }
}

///|
/// `unify_vars`
pub fn[TA] unify_vars(
  x831 : (T1, TA),
  x832 : @list.List[Int64],
  x833 : @list.List[Int64],
) -> (T1, TA)? raise {
  let (sub, off) = x831
  let l1 = x832
  let l2 = x833
  try {
    let t834 = @lib.map(var_, l2)
    Some((unify_tms_v1(sub, @lib.map(var_, l1), t834), off))
  } catch {
    Unify1::Unify => None
    e => raise e
  }
}

///|
/// `unify_rename`
pub fn[TA] unify_rename_v1(
  x835 : (T1, Int64),
  x836 : @list.List[@meson.FolTerm],
  x837 : (
    (
      (Int64, @list.List[Int64]),
      (
        @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
        @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
      ),
      LitmatExt[Int64],
    ),
    @list.List[@meson.FolTerm],
    TA,
    Int64,
  ),
) -> ((T1, Int64), ClauseExt[Int64])? raise {
  let (sub, off) = x835
  let args1 = x836
  let (clext, args2, _, vars) = x837
  Some(
    if vars == 0L {
      ((unify_tms_v1(sub, args1, args2), off), clext)
    } else {
      let t839 = offset_clause_ext(off, clext)
      let t838 = @lib.add63(off, vars)
      ((unify_tms_off_v1(off, sub, args1, args2), t838), t839)
    },
  ) catch {
    Unify1::Unify => None
    e => raise e
  }
}

///|
/// `pick`
pub fn[TA, TB] pick(
  x840 : (TB) -> TA? raise,
  x841 : @list.List[TB],
) -> (TA, (TB) -> @list.List[TB] raise) raise {
  let f = x840
  let l = x841
  fn go(
    x842 : @list.List[TB],
    x843 : @list.List[TB],
  ) -> (TA, (TB) -> @list.List[TB] raise) raise {
    let acc = x842
    match x843 {
      More(x, tail=xs) =>
        match f(x) {
          Some(y) =>
            (
              y,
              fn(x844 : TB) -> @list.List[TB] raise {
                let z = x844
                @lib.rev_append(acc, xs.prepend(z))
              },
            )
          None => go(acc.prepend(x), xs)
        }
      Empty => raise Failure("pick: no element found")
    }
  }
  go(@list.List([]), l)
}

///|
/// `nth_clause`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB, TC, TD] nth_clause(
  x845 : TA,
  x846 : (((TA, TB), TC), TD),
) -> (((TA, TB), TC), TD)? raise {
  let i = x845
  let (((j, k), v), _) as c = x846
  if i == j {
    Some(c)
  } else {
    None
  }
}

///|
/// `nth_matrix`
pub fn[TA : Eq + @lib.OCompare + @lib.OHash, TB] nth_matrix(
  x847 : TA,
  x848 : Litmat[(TA, TB)],
) -> ((TA, TB), Matrix[(TA, TB)])? raise {
  let i = x847
  match x848 {
    Litmat::Lit(_) => None
    Litmat::Mat(((j, k), _) as m) => if i == j { Some(m) } else { None }
  }
}

///|
/// `unique`
pub fn[TA, TB] unique(
  x849 : (TB) -> TA? raise,
  x850 : @list.List[TB],
) -> Bool raise {
  let f = x849
  let l = x850
  Int::to_int64(@lib.length(@firstorder.filter_map(f, l))) == 1L
}

///|
/// `prove_ec`
pub fn[TA] prove_ec(
  x851 : Int64,
  x852 : (T1, TA),
  x853 : (
    (Int64, @list.List[Int64]),
    (
      @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
      @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
    ),
    LitmatExt[Int64],
  ),
  x854 : @list.List[
    (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
  ],
  x855 : @list.List[(Int64, Int64)],
) -> Strom[
  (
    (T1, TA),
    (
      @list.List[((Int64, @list.List[Int64]), Int64)],
      (
        (Int64, @list.List[Int64]),
        (Matrix[Int64], Matrix[Int64]),
        LitmatExt[Int64],
      ),
    ),
    (((Int64, Int64), @list.List[Int64]), Clause[(Int64, Int64)]),
    Matrix[(Int64, Int64)],
  ),
] raise {
  let k = x851
  let sub = x852
  let ((i, v), _, lmext) as clext = x853
  let mi = x854
  let pi = x855
  if unique(
      (
        x857 : (
          ((Int64, Int64), @list.List[Int64]),
          @list.List[Litmat[(Int64, Int64)]],
        ),
      ) => nth_clause(i, x857),
      mi,
    ) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1132:2")
  }
  if Int::to_int64(@lib.length(pi)) == k {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1133:2")
  }
  let ((((i_1, k1), v1), cla1), miab) = pick(
    (
      x858 : (
        ((Int64, Int64), @list.List[Int64]),
        @list.List[Litmat[(Int64, Int64)]],
      ),
    ) => nth_clause(i, x858),
    mi,
  )
  let alt1 : (Unit) -> ((Unit) -> (
    (T1, TA),
    (
      @list.List[((Int64, @list.List[Int64]), Int64)],
      (
        (Int64, @list.List[Int64]),
        (
          @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
          @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
        ),
        LitmatExt[Int64],
      ),
    ),
    (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
    @list.List[
      (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
    ],
  ) raise) raise = fn(
    x859 : Unit,
  ) -> ((Unit) -> (
    (T1, TA),
    (
      @list.List[((Int64, @list.List[Int64]), Int64)],
      (
        (Int64, @list.List[Int64]),
        (
          @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
          @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
        ),
        LitmatExt[Int64],
      ),
    ),
    (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
    @list.List[
      (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
    ],
  ) raise) raise {
    let _ = x859
    match lmext {
      LitmatExt::Matext(j, _, clext_p) if @lib.mem((j, k1), pi) =>
        match unify_vars(sub, v, v1) {
          None => nil
          Some(sub2) => {
            let (((j_1, k1_p), mi2), clade) = pick(
              (x861 : Litmat[(Int64, Int64)]) => nth_matrix(j, x861),
              cla1,
            )
            if unique(
                (x862 : Litmat[(Int64, Int64)]) => nth_matrix(j_1, x862),
                cla1,
              ) {
              ()
            } else {
              raise @lib.AssertFailure("tscript.ml:1140:8")
            }
            if k1 == k1_p {
              ()
            } else {
              raise @lib.AssertFailure("tscript.ml:1141:8")
            }
            @lib.op_bar_gt(prove_ec(k, sub2, clext_p, mi2, pi), fn(
              x866 : (Unit) -> (
                (T1, TA),
                (
                  @list.List[((Int64, @list.List[Int64]), Int64)],
                  (
                    (Int64, @list.List[Int64]),
                    (
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                    ),
                    LitmatExt[Int64],
                  ),
                ),
                (
                  ((Int64, Int64), @list.List[Int64]),
                  @list.List[Litmat[(Int64, Int64)]],
                ),
                @list.List[
                  (
                    ((Int64, Int64), @list.List[Int64]),
                    @list.List[Litmat[(Int64, Int64)]],
                  ),
                ],
              ) raise,
            ) -> ((Unit) -> (
              (T1, TA),
              (
                @list.List[((Int64, @list.List[Int64]), Int64)],
                (
                  (Int64, @list.List[Int64]),
                  (
                    @list.List[
                      ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                    ],
                    @list.List[
                      ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                    ],
                  ),
                  LitmatExt[Int64],
                ),
              ),
              (
                ((Int64, Int64), @list.List[Int64]),
                @list.List[Litmat[(Int64, Int64)]],
              ),
              @list.List[
                (
                  ((Int64, Int64), @list.List[Int64]),
                  @list.List[Litmat[(Int64, Int64)]],
                ),
              ],
            ) raise) raise {
              fn(
                x867 : Unit,
              ) -> (
                (T1, TA),
                (
                  @list.List[((Int64, @list.List[Int64]), Int64)],
                  (
                    (Int64, @list.List[Int64]),
                    (
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                    ),
                    LitmatExt[Int64],
                  ),
                ),
                (
                  ((Int64, Int64), @list.List[Int64]),
                  @list.List[Litmat[(Int64, Int64)]],
                ),
                @list.List[
                  (
                    ((Int64, Int64), @list.List[Int64]),
                    @list.List[Litmat[(Int64, Int64)]],
                  ),
                ],
              ) raise {
                ((
                  x864 : (Unit) -> (
                    (T1, TA),
                    (
                      @list.List[((Int64, @list.List[Int64]), Int64)],
                      (
                        (Int64, @list.List[Int64]),
                        (
                          @list.List[
                            (
                              (Int64, @list.List[Int64]),
                              @list.List[Litmat[Int64]],
                            ),
                          ],
                          @list.List[
                            (
                              (Int64, @list.List[Int64]),
                              @list.List[Litmat[Int64]],
                            ),
                          ],
                        ),
                        LitmatExt[Int64],
                      ),
                    ),
                    (
                      ((Int64, Int64), @list.List[Int64]),
                      @list.List[Litmat[(Int64, Int64)]],
                    ),
                    @list.List[
                      (
                        ((Int64, Int64), @list.List[Int64]),
                        @list.List[Litmat[(Int64, Int64)]],
                      ),
                    ],
                  ) raise,
                  x865 : Unit,
                ) => {
                  map(
                    fn(
                      x863 : (
                        (T1, TA),
                        (
                          @list.List[((Int64, @list.List[Int64]), Int64)],
                          (
                            (Int64, @list.List[Int64]),
                            (
                              @list.List[
                                (
                                  (Int64, @list.List[Int64]),
                                  @list.List[Litmat[Int64]],
                                ),
                              ],
                              @list.List[
                                (
                                  (Int64, @list.List[Int64]),
                                  @list.List[Litmat[Int64]],
                                ),
                              ],
                            ),
                            LitmatExt[Int64],
                          ),
                        ),
                        (
                          ((Int64, Int64), @list.List[Int64]),
                          @list.List[Litmat[(Int64, Int64)]],
                        ),
                        @list.List[
                          (
                            ((Int64, Int64), @list.List[Int64]),
                            @list.List[Litmat[(Int64, Int64)]],
                          ),
                        ],
                      ),
                    ) -> (
                      (T1, TA),
                      (
                        @list.List[((Int64, @list.List[Int64]), Int64)],
                        (
                          (Int64, @list.List[Int64]),
                          (
                            @list.List[
                              (
                                (Int64, @list.List[Int64]),
                                @list.List[Litmat[Int64]],
                              ),
                            ],
                            @list.List[
                              (
                                (Int64, @list.List[Int64]),
                                @list.List[Litmat[Int64]],
                              ),
                            ],
                          ),
                          LitmatExt[Int64],
                        ),
                      ),
                      (
                        ((Int64, Int64), @list.List[Int64]),
                        @list.List[Litmat[(Int64, Int64)]],
                      ),
                      @list.List[
                        (
                          ((Int64, Int64), @list.List[Int64]),
                          @list.List[Litmat[(Int64, Int64)]],
                        ),
                      ],
                    ) raise {
                      let (sub3, (prefix, postfix), clab1, mi3) = x863
                      (
                        sub3,
                        (prefix.prepend(((i_1, v1), j_1)), postfix),
                        clab1,
                        miab(
                          (
                            ((i_1, k1), v1),
                            clade(Litmat::Mat(((j_1, k1), mi3))),
                          ),
                        ),
                      )
                    },
                    x864,
                    x865,
                  )
                })(x866, x867)
              }
            })
          }
        }
      _ => nil
    }
  }
  let t872 = cache(x868 => {
    alt2_l(i_1, k1, pi, v, lmext, k, sub, clext, miab, x868)
  })
  append(cache(alt1), t872)
}

///|
fn[TC] index_l(
  i_1 : Int64,
  k : Int64,
  v : @list.List[Int64],
  x870 : @list.List[Litmat[TC]],
) -> (((Int64, Int64), @list.List[Int64]), Clause[(TC, Int64)]) raise {
  let cla = x870
  (((i_1, k), v), copy_clause(k)(cla))
}

///|
fn[TA, TB] alt2_l(
  i_1 : Int64,
  k1 : Int64,
  pi : @list.List[(Int64, Int64)],
  v : @list.List[Int64],
  lmext : LitmatExt[Int64],
  k : Int64,
  sub : (T1, TA),
  clext : (
    (Int64, @list.List[Int64]),
    (
      @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
      @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
    ),
    LitmatExt[Int64],
  ),
  miab : (
    (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
  ) -> @list.List[
    (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
  ] raise,
  x868 : Unit,
) -> ((Unit) -> (
  (T1, TA),
  (
    @list.List[TB],
    (
      (Int64, @list.List[Int64]),
      (Matrix[Int64], Matrix[Int64]),
      LitmatExt[Int64],
    ),
  ),
  (((Int64, Int64), @list.List[Int64]), Clause[(Int64, Int64)]),
  @list.List[Iclause[(Int64, Int64)]],
) raise) raise {
  let _ = x868
  if @lib.mem((i_1, k1), pi) && v == @list.List([]) {
    nil
  } else {
    let (clab, clac) = clabc_of_litmat_ext(lmext)
    let t871 = miab((x870 => index_l(i_1, k, v, x870))(clac))
    cons(
      (
        sub,
        (@list.List([]), clext),
        (x870 => index_l(i_1, k, v, x870))(clab),
        t871,
      ),
      nil,
    )
  }
}

///|
/// `cut`
pub fn[TA] cut_v2(
  x873 : Bool,
  x874 : (Unit) -> TA raise,
  x875 : (Unit) -> TA raise,
) -> ((Unit) -> TA raise) raise {
  let p = x873
  let xs = x874
  let ys = x875
  if p {
    cut(xs, ys)
  } else {
    append(xs, ys)
  }
}

///|
/// `prove_lit`
pub fn prove_lit_v1(
  x877 : SearchOpts,
  x878 : (T1, Int64),
  x879 : (
    @list.List[
      (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
    ],
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    @list.List[(Int64, Int64)],
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Int64,
  ),
  x880 : (Int64, @list.List[@meson.FolTerm]),
) -> Strom[
  (
    (T1, Int64),
    @list.List[Lit],
    (
      Litmat[(Int64, Int64)],
      Proof1[
        Litmat[(Int64, Int64)],
        Clause[(Int64, Int64)],
        ((Int64, Int64), @list.List[Int64]),
        (
          @list.List[((Int64, @list.List[Int64]), Int64)],
          (
            (Int64, @list.List[Int64]),
            (Matrix[Int64], Matrix[Int64]),
            LitmatExt[Int64],
          ),
        ),
      ],
    ),
  ),
] raise {
  let opt = x877
  let sub = x878
  let (mi, path, pi, lem, lim) = x879
  let lit_1 = x880
  if @firstorder.copverb().val {
    let t882 = string_of_lit(inst_lit_v1(sub.0, lit_1))
    @pp.std_formatter.print_string("Lit: " + t882 + "\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  if @firstorder.copverb().val {
    let t883 = string_of_lits(path)
    @pp.std_formatter.print_string("Path: " + t883 + "\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  if @firstorder.copverb().val {
    let t884 = string_of_lits(lem)
    @pp.std_formatter.print_string("Lemmas: " + t884 + "\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  let neglit = negate_lit(lit_1.0, lit_1.1)
  let k = @lib.lazy_new(() => Int::to_int64(@lib.length(pi)))
  let lemmas : (Unit) -> (
    (T1, Int64),
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Proof1[_, _, _, _],
  ) raise = if @lib.exists(
      (x885 : (Int64, @list.List[@meson.FolTerm])) => eq(sub, lit_1, x885),
      lem,
    ) {
    if @firstorder.copverb().val {
      @pp.std_formatter.print_string("lemma\n")
      @pp.std_formatter.print_flush()
      ()
    } else {
      ()
    }
    cons((sub, lem, Proof1::Lemma), nil)
  } else {
    nil
  }
  let reductions : (Unit) -> (
    (T1, Int64),
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Proof1[_, _, _, _],
  ) raise = @lib.op_bar_gt(of_list(path), (
    x890 : (Unit) -> (Int64, @list.List[@meson.FolTerm]) raise,
  ) => {
    (x891 : Unit) => {
      ((x888 : (Unit) -> (Int64, @list.List[@meson.FolTerm]) raise, x889 : Unit) => {
        filter_map(
          (x886 : (Int64, @list.List[@meson.FolTerm])) => {
            let p = x886
            if @firstorder.copverb().val {
              let t887 = string_of_lit(p)
              @pp.std_formatter.print_string("Reduction try " + t887 + "\n")
              @pp.std_formatter.print_flush()
              ()
            } else {
              ()
            }
            match unify(sub, neglit, p) {
              Some(sub1) => {
                if @firstorder.copverb().val {
                  @pp.std_formatter.print_string("Reduction works\n")
                  @pp.std_formatter.print_flush()
                  ()
                } else {
                  ()
                }
                Some((sub1, lem, Proof1::Reduction))
              }
              None => None
            }
          },
          x888,
          x889,
        )
      })(x890, x891)
    }
  })
  let extensions : (Unit) -> (
    (T1, Int64),
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Proof1[
      Litmat[(Int64, Int64)],
      @list.List[Litmat[(Int64, Int64)]],
      ((Int64, Int64), @list.List[Int64]),
      (
        @list.List[((Int64, @list.List[Int64]), Int64)],
        (
          (Int64, @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
          ),
          LitmatExt[Int64],
        ),
      ),
    ],
  ) raise = @lib.op_bar_gt(@lib.op_bar_gt(db_entries_v1(neglit), of_list), (
    x906 : (Unit) -> (
      (
        (Int64, @list.List[Int64]),
        (
          @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
          @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
        ),
        LitmatExt[Int64],
      ),
      @list.List[@meson.FolTerm],
      Bool,
      Int64,
    ) raise,
  ) => {
    concat_map(
      fn(
        x892 : (
          (
            (Int64, @list.List[Int64]),
            (
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
            ),
            LitmatExt[Int64],
          ),
          @list.List[@meson.FolTerm],
          Bool,
          Int64,
        ),
      ) -> ((Unit) -> (
        (T1, Int64),
        @list.List[(Int64, @list.List[@meson.FolTerm])],
        Proof1[
          Litmat[(Int64, Int64)],
          @list.List[Litmat[(Int64, Int64)]],
          ((Int64, Int64), @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), Int64)],
            (
              (Int64, @list.List[Int64]),
              (
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
              ),
              LitmatExt[Int64],
            ),
          ),
        ],
      ) raise) raise {
        let (_, args, ground, vars) as contra = x892
        if @firstorder.copverb().val {
          let t894 = @lib.string_concat(",", @lib.map(string_of_fterm, args))
          let t895 = string_of_lit(inst_lit_v1(sub.0, lit_1))
          @pp.std_formatter.print_string(
            "Extension try (for lit " +
            t895 +
            ", args (" +
            t894 +
            "), lim " +
            Int64::to_string(lim) +
            ", vars " +
            Int64::to_string(vars) +
            ")\n",
          )
          @pp.std_formatter.print_flush()
          ()
        } else {
          ()
        }
        if lim < 0L && !ground {
          nil
        } else {
          match unify_rename_v1(sub, lit_1.1, contra) {
            Some((sub1_1, clext)) => {
              if @firstorder.copverb().val {
                let t896 = string_of_lit(inst_lit_v1(sub1_1.0, lit_1))
                @pp.std_formatter.print_string(
                  "Extension works (for lit " +
                  t896 +
                  ", lim " +
                  Int64::to_string(lim) +
                  ")\n",
                )
                @pp.std_formatter.print_flush()
                ()
              } else {
                ()
              }
              if @firstorder.copverb().val {
                @pp.std_formatter.print_string(
                  "Old/new offsets: " +
                  Int64::to_string(sub.1) +
                  "/" +
                  Int64::to_string(sub1_1.1) +
                  "\n",
                )
                @pp.std_formatter.print_flush()
                ()
              } else {
                ()
              }
              @lib.op_bar_gt(
                prove_ec(@lib.lazy_force(k), sub1_1, clext, mi, pi),
                (
                  x905 : (Unit) -> (
                    (T1, Int64),
                    (
                      @list.List[((Int64, @list.List[Int64]), Int64)],
                      (
                        (Int64, @list.List[Int64]),
                        (
                          @list.List[
                            (
                              (Int64, @list.List[Int64]),
                              @list.List[Litmat[Int64]],
                            ),
                          ],
                          @list.List[
                            (
                              (Int64, @list.List[Int64]),
                              @list.List[Litmat[Int64]],
                            ),
                          ],
                        ),
                        LitmatExt[Int64],
                      ),
                    ),
                    (
                      ((Int64, Int64), @list.List[Int64]),
                      @list.List[Litmat[(Int64, Int64)]],
                    ),
                    @list.List[
                      (
                        ((Int64, Int64), @list.List[Int64]),
                        @list.List[Litmat[(Int64, Int64)]],
                      ),
                    ],
                  ) raise,
                ) => {
                  concat_map(
                    fn(
                      x897 : (
                        (T1, Int64),
                        (
                          @list.List[((Int64, @list.List[Int64]), Int64)],
                          (
                            (Int64, @list.List[Int64]),
                            (
                              @list.List[
                                (
                                  (Int64, @list.List[Int64]),
                                  @list.List[Litmat[Int64]],
                                ),
                              ],
                              @list.List[
                                (
                                  (Int64, @list.List[Int64]),
                                  @list.List[Litmat[Int64]],
                                ),
                              ],
                            ),
                            LitmatExt[Int64],
                          ),
                        ),
                        (
                          ((Int64, Int64), @list.List[Int64]),
                          @list.List[Litmat[(Int64, Int64)]],
                        ),
                        @list.List[
                          (
                            ((Int64, Int64), @list.List[Int64]),
                            @list.List[Litmat[(Int64, Int64)]],
                          ),
                        ],
                      ),
                    ) -> ((Unit) -> (
                      (T1, Int64),
                      @list.List[(Int64, @list.List[@meson.FolTerm])],
                      Proof1[
                        Litmat[(Int64, Int64)],
                        @list.List[Litmat[(Int64, Int64)]],
                        ((Int64, Int64), @list.List[Int64]),
                        (
                          @list.List[((Int64, @list.List[Int64]), Int64)],
                          (
                            (Int64, @list.List[Int64]),
                            (
                              @list.List[
                                (
                                  (Int64, @list.List[Int64]),
                                  @list.List[Litmat[Int64]],
                                ),
                              ],
                              @list.List[
                                (
                                  (Int64, @list.List[Int64]),
                                  @list.List[Litmat[Int64]],
                                ),
                              ],
                            ),
                            LitmatExt[Int64],
                          ),
                        ),
                      ],
                    ) raise) raise {
                      let (sub2, position, ((i, v), clab1), mi1) = x897
                      if @firstorder.copverb().val {
                        let t899 = string_of_nclause(clab1)
                        @pp.std_formatter.print_string(
                          "Extension clause " + t899 + " found\n",
                        )
                        @pp.std_formatter.print_flush()
                        ()
                      } else {
                        ()
                      }
                      @lib.op_bar_gt(
                        prove_clause_v1(
                          opt,
                          sub2,
                          (
                            mi1,
                            path.prepend(lit_1),
                            pi.prepend(i),
                            lem,
                            @lib.sub63(lim, 1L),
                          ),
                          clab1,
                        ),
                        fn(
                          x903 : (Unit) -> (
                            (T1, Int64),
                            @list.List[
                              (
                                Litmat[(Int64, Int64)],
                                Proof1[
                                  Litmat[(Int64, Int64)],
                                  @list.List[Litmat[(Int64, Int64)]],
                                  ((Int64, Int64), @list.List[Int64]),
                                  (
                                    @list.List[
                                      ((Int64, @list.List[Int64]), Int64),
                                    ],
                                    (
                                      (Int64, @list.List[Int64]),
                                      (
                                        @list.List[
                                          (
                                            (Int64, @list.List[Int64]),
                                            @list.List[Litmat[Int64]],
                                          ),
                                        ],
                                        @list.List[
                                          (
                                            (Int64, @list.List[Int64]),
                                            @list.List[Litmat[Int64]],
                                          ),
                                        ],
                                      ),
                                      LitmatExt[Int64],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ) raise,
                        ) -> ((Unit) -> (
                          (T1, Int64),
                          @list.List[(Int64, @list.List[@meson.FolTerm])],
                          Proof1[
                            Litmat[(Int64, Int64)],
                            @list.List[Litmat[(Int64, Int64)]],
                            ((Int64, Int64), @list.List[Int64]),
                            (
                              @list.List[((Int64, @list.List[Int64]), Int64)],
                              (
                                (Int64, @list.List[Int64]),
                                (
                                  @list.List[
                                    (
                                      (Int64, @list.List[Int64]),
                                      @list.List[Litmat[Int64]],
                                    ),
                                  ],
                                  @list.List[
                                    (
                                      (Int64, @list.List[Int64]),
                                      @list.List[Litmat[Int64]],
                                    ),
                                  ],
                                ),
                                LitmatExt[Int64],
                              ),
                            ),
                          ],
                        ) raise) raise {
                          fn(
                            x904 : Unit,
                          ) -> (
                            (T1, Int64),
                            @list.List[(Int64, @list.List[@meson.FolTerm])],
                            Proof1[
                              Litmat[(Int64, Int64)],
                              @list.List[Litmat[(Int64, Int64)]],
                              ((Int64, Int64), @list.List[Int64]),
                              (
                                @list.List[((Int64, @list.List[Int64]), Int64)],
                                (
                                  (Int64, @list.List[Int64]),
                                  (
                                    @list.List[
                                      (
                                        (Int64, @list.List[Int64]),
                                        @list.List[Litmat[Int64]],
                                      ),
                                    ],
                                    @list.List[
                                      (
                                        (Int64, @list.List[Int64]),
                                        @list.List[Litmat[Int64]],
                                      ),
                                    ],
                                  ),
                                  LitmatExt[Int64],
                                ),
                              ),
                            ],
                          ) raise {
                            ((
                              x901 : (Unit) -> (
                                (T1, Int64),
                                @list.List[
                                  (
                                    Litmat[(Int64, Int64)],
                                    Proof1[
                                      Litmat[(Int64, Int64)],
                                      @list.List[Litmat[(Int64, Int64)]],
                                      ((Int64, Int64), @list.List[Int64]),
                                      (
                                        @list.List[
                                          ((Int64, @list.List[Int64]), Int64),
                                        ],
                                        (
                                          (Int64, @list.List[Int64]),
                                          (
                                            @list.List[
                                              (
                                                (Int64, @list.List[Int64]),
                                                @list.List[Litmat[Int64]],
                                              ),
                                            ],
                                            @list.List[
                                              (
                                                (Int64, @list.List[Int64]),
                                                @list.List[Litmat[Int64]],
                                              ),
                                            ],
                                          ),
                                          LitmatExt[Int64],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ) raise,
                              x902 : Unit,
                            ) => {
                              map(
                                fn(
                                  x900 : (
                                    (T1, Int64),
                                    @list.List[
                                      (
                                        Litmat[(Int64, Int64)],
                                        Proof1[
                                          Litmat[(Int64, Int64)],
                                          @list.List[Litmat[(Int64, Int64)]],
                                          ((Int64, Int64), @list.List[Int64]),
                                          (
                                            @list.List[
                                              (
                                                (Int64, @list.List[Int64]),
                                                Int64,
                                              ),
                                            ],
                                            (
                                              (Int64, @list.List[Int64]),
                                              (
                                                @list.List[
                                                  (
                                                    (Int64, @list.List[Int64]),
                                                    @list.List[Litmat[Int64]],
                                                  ),
                                                ],
                                                @list.List[
                                                  (
                                                    (Int64, @list.List[Int64]),
                                                    @list.List[Litmat[Int64]],
                                                  ),
                                                ],
                                              ),
                                              LitmatExt[Int64],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ) -> (
                                  (T1, Int64),
                                  @list.List[
                                    (Int64, @list.List[@meson.FolTerm]),
                                  ],
                                  Proof1[
                                    Litmat[(Int64, Int64)],
                                    @list.List[Litmat[(Int64, Int64)]],
                                    ((Int64, Int64), @list.List[Int64]),
                                    (
                                      @list.List[
                                        ((Int64, @list.List[Int64]), Int64),
                                      ],
                                      (
                                        (Int64, @list.List[Int64]),
                                        (
                                          @list.List[
                                            (
                                              (Int64, @list.List[Int64]),
                                              @list.List[Litmat[Int64]],
                                            ),
                                          ],
                                          @list.List[
                                            (
                                              (Int64, @list.List[Int64]),
                                              @list.List[Litmat[Int64]],
                                            ),
                                          ],
                                        ),
                                        LitmatExt[Int64],
                                      ),
                                    ),
                                  ],
                                ) raise {
                                  let (sub3, prfs) = x900
                                  (
                                    sub3,
                                    lem.prepend(lit_1),
                                    Proof1::Extension(
                                      clab1.prepend(Litmat::Lit(neglit)),
                                      position,
                                      prfs,
                                    ),
                                  )
                                },
                                x901,
                                x902,
                              )
                            })(x903, x904)
                          }
                        },
                      )
                    },
                    x905,
                  )
                },
              )
            }
            None => nil
          }
        }
      },
      x906,
    )
  })
  let t907 = cut_v2(opt.cut3, extensions, nil)
  let t908 = cut_v2(opt.cut2, reductions, t907)
  let t909 = cut_v2(opt.cut1, lemmas, t908)
  @lib.op_bar_gt(cut_v2(ground_lit_v1(sub.0, lit_1), t909, nil), fn(
    x913 : (Unit) -> (
      (T1, Int64),
      @list.List[(Int64, @list.List[@meson.FolTerm])],
      Proof1[
        Litmat[(Int64, Int64)],
        @list.List[Litmat[(Int64, Int64)]],
        ((Int64, Int64), @list.List[Int64]),
        (
          @list.List[((Int64, @list.List[Int64]), Int64)],
          (
            (Int64, @list.List[Int64]),
            (
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
            ),
            LitmatExt[Int64],
          ),
        ),
      ],
    ) raise,
  ) -> ((Unit) -> (
    (T1, Int64),
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    (
      Litmat[(Int64, Int64)],
      Proof1[
        Litmat[(Int64, Int64)],
        @list.List[Litmat[(Int64, Int64)]],
        ((Int64, Int64), @list.List[Int64]),
        (
          @list.List[((Int64, @list.List[Int64]), Int64)],
          (
            (Int64, @list.List[Int64]),
            (
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
            ),
            LitmatExt[Int64],
          ),
        ),
      ],
    ),
  ) raise) raise {
    fn(
      x914 : Unit,
    ) -> (
      (T1, Int64),
      @list.List[(Int64, @list.List[@meson.FolTerm])],
      (
        Litmat[(Int64, Int64)],
        Proof1[
          Litmat[(Int64, Int64)],
          @list.List[Litmat[(Int64, Int64)]],
          ((Int64, Int64), @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), Int64)],
            (
              (Int64, @list.List[Int64]),
              (
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
              ),
              LitmatExt[Int64],
            ),
          ),
        ],
      ),
    ) raise {
      ((
        x911 : (Unit) -> (
          (T1, Int64),
          @list.List[(Int64, @list.List[@meson.FolTerm])],
          Proof1[
            Litmat[(Int64, Int64)],
            @list.List[Litmat[(Int64, Int64)]],
            ((Int64, Int64), @list.List[Int64]),
            (
              @list.List[((Int64, @list.List[Int64]), Int64)],
              (
                (Int64, @list.List[Int64]),
                (
                  @list.List[
                    ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                  ],
                  @list.List[
                    ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                  ],
                ),
                LitmatExt[Int64],
              ),
            ),
          ],
        ) raise,
        x912 : Unit,
      ) => {
        map(
          fn(
            x910 : (
              (T1, Int64),
              @list.List[(Int64, @list.List[@meson.FolTerm])],
              Proof1[
                Litmat[(Int64, Int64)],
                @list.List[Litmat[(Int64, Int64)]],
                ((Int64, Int64), @list.List[Int64]),
                (
                  @list.List[((Int64, @list.List[Int64]), Int64)],
                  (
                    (Int64, @list.List[Int64]),
                    (
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                    ),
                    LitmatExt[Int64],
                  ),
                ),
              ],
            ),
          ) -> (
            (T1, Int64),
            @list.List[(Int64, @list.List[@meson.FolTerm])],
            (
              Litmat[(Int64, Int64)],
              Proof1[
                Litmat[(Int64, Int64)],
                @list.List[Litmat[(Int64, Int64)]],
                ((Int64, Int64), @list.List[Int64]),
                (
                  @list.List[((Int64, @list.List[Int64]), Int64)],
                  (
                    (Int64, @list.List[Int64]),
                    (
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                    ),
                    LitmatExt[Int64],
                  ),
                ),
              ],
            ),
          ) raise {
            let (sub1_2, lem1, prf1) = x910
            (sub1_2, lem1, (Litmat::Lit(lit_1), prf1))
          },
          x911,
          x912,
        )
      })(x913, x914)
    }
  })
}

///|
/// `prove_mat`
pub fn prove_mat(
  x915 : SearchOpts,
  x916 : (T1, Int64),
  x917 : (
    @list.List[
      (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
    ],
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    @list.List[(Int64, Int64)],
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Int64,
  ),
  x918 : (
    (Int64, Int64),
    @list.List[
      (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
    ],
  ),
) -> Strom[
  (
    (T1, Int64),
    @list.List[Lit],
    (
      Litmat[(Int64, Int64)],
      Proof1[
        Litmat[(Int64, Int64)],
        Clause[(Int64, Int64)],
        ((Int64, Int64), @list.List[Int64]),
        (
          @list.List[((Int64, @list.List[Int64]), Int64)],
          (
            (Int64, @list.List[Int64]),
            (Matrix[Int64], Matrix[Int64]),
            LitmatExt[Int64],
          ),
        ),
      ],
    ),
  ),
] raise {
  let opt_1 = x915
  let sub_1 = x916
  let (mi_1, path_1, pi_1, lem_1, lim_1) = x917
  let (j, mat1) = x918
  if @firstorder.copverb().val {
    @pp.std_formatter.print_string("prove_mat\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  @lib.op_bar_gt(of_list(mat1), (
    x929 : (Unit) -> (
      ((Int64, Int64), @list.List[Int64]),
      @list.List[Litmat[(Int64, Int64)]],
    ) raise,
  ) => {
    concat_map(
      fn(
        x920 : (
          ((Int64, Int64), @list.List[Int64]),
          @list.List[Litmat[(Int64, Int64)]],
        ),
      ) -> ((Unit) -> (
        (T1, Int64),
        @list.List[(Int64, @list.List[@meson.FolTerm])],
        (
          Litmat[(Int64, Int64)],
          Proof1[
            Litmat[(Int64, Int64)],
            @list.List[Litmat[(Int64, Int64)]],
            ((Int64, Int64), @list.List[Int64]),
            (
              @list.List[((Int64, @list.List[Int64]), Int64)],
              (
                (Int64, @list.List[Int64]),
                (
                  @list.List[
                    ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                  ],
                  @list.List[
                    ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                  ],
                ),
                LitmatExt[Int64],
              ),
            ),
          ],
        ),
      ) raise) raise {
        let ((i_1, _) as idx, cla1) = x920
        if @firstorder.copverb().val {
          let t922 = string_of_nclause(cla1)
          @pp.std_formatter.print_string("Decomposition chose: " + t922 + "\n")
          @pp.std_formatter.print_flush()
          ()
        } else {
          ()
        }
        @lib.op_bar_gt(
          prove_clause_v1(
            opt_1,
            sub_1,
            (mi_1, path_1, pi_1.prepend(j).prepend(i_1), lem_1, lim_1),
            cla1,
          ),
          fn(
            x927 : (Unit) -> (
              (T1, Int64),
              @list.List[
                (
                  Litmat[(Int64, Int64)],
                  Proof1[
                    Litmat[(Int64, Int64)],
                    @list.List[Litmat[(Int64, Int64)]],
                    ((Int64, Int64), @list.List[Int64]),
                    (
                      @list.List[((Int64, @list.List[Int64]), Int64)],
                      (
                        (Int64, @list.List[Int64]),
                        (
                          @list.List[
                            (
                              (Int64, @list.List[Int64]),
                              @list.List[Litmat[Int64]],
                            ),
                          ],
                          @list.List[
                            (
                              (Int64, @list.List[Int64]),
                              @list.List[Litmat[Int64]],
                            ),
                          ],
                        ),
                        LitmatExt[Int64],
                      ),
                    ),
                  ],
                ),
              ],
            ) raise,
          ) -> ((Unit) -> (
            (T1, Int64),
            @list.List[(Int64, @list.List[@meson.FolTerm])],
            (
              Litmat[(Int64, Int64)],
              Proof1[
                Litmat[(Int64, Int64)],
                @list.List[Litmat[(Int64, Int64)]],
                ((Int64, Int64), @list.List[Int64]),
                (
                  @list.List[((Int64, @list.List[Int64]), Int64)],
                  (
                    (Int64, @list.List[Int64]),
                    (
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                    ),
                    LitmatExt[Int64],
                  ),
                ),
              ],
            ),
          ) raise) raise {
            fn(
              x928 : Unit,
            ) -> (
              (T1, Int64),
              @list.List[(Int64, @list.List[@meson.FolTerm])],
              (
                Litmat[(Int64, Int64)],
                Proof1[
                  Litmat[(Int64, Int64)],
                  @list.List[Litmat[(Int64, Int64)]],
                  ((Int64, Int64), @list.List[Int64]),
                  (
                    @list.List[((Int64, @list.List[Int64]), Int64)],
                    (
                      (Int64, @list.List[Int64]),
                      (
                        @list.List[
                          (
                            (Int64, @list.List[Int64]),
                            @list.List[Litmat[Int64]],
                          ),
                        ],
                        @list.List[
                          (
                            (Int64, @list.List[Int64]),
                            @list.List[Litmat[Int64]],
                          ),
                        ],
                      ),
                      LitmatExt[Int64],
                    ),
                  ),
                ],
              ),
            ) raise {
              ((
                x925 : (Unit) -> (
                  (T1, Int64),
                  @list.List[
                    (
                      Litmat[(Int64, Int64)],
                      Proof1[
                        Litmat[(Int64, Int64)],
                        @list.List[Litmat[(Int64, Int64)]],
                        ((Int64, Int64), @list.List[Int64]),
                        (
                          @list.List[((Int64, @list.List[Int64]), Int64)],
                          (
                            (Int64, @list.List[Int64]),
                            (
                              @list.List[
                                (
                                  (Int64, @list.List[Int64]),
                                  @list.List[Litmat[Int64]],
                                ),
                              ],
                              @list.List[
                                (
                                  (Int64, @list.List[Int64]),
                                  @list.List[Litmat[Int64]],
                                ),
                              ],
                            ),
                            LitmatExt[Int64],
                          ),
                        ),
                      ],
                    ),
                  ],
                ) raise,
                x926 : Unit,
              ) => {
                map(
                  fn(
                    x923 : (
                      (T1, Int64),
                      @list.List[
                        (
                          Litmat[(Int64, Int64)],
                          Proof1[
                            Litmat[(Int64, Int64)],
                            @list.List[Litmat[(Int64, Int64)]],
                            ((Int64, Int64), @list.List[Int64]),
                            (
                              @list.List[((Int64, @list.List[Int64]), Int64)],
                              (
                                (Int64, @list.List[Int64]),
                                (
                                  @list.List[
                                    (
                                      (Int64, @list.List[Int64]),
                                      @list.List[Litmat[Int64]],
                                    ),
                                  ],
                                  @list.List[
                                    (
                                      (Int64, @list.List[Int64]),
                                      @list.List[Litmat[Int64]],
                                    ),
                                  ],
                                ),
                                LitmatExt[Int64],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ) -> (
                    (T1, Int64),
                    @list.List[(Int64, @list.List[@meson.FolTerm])],
                    (
                      Litmat[(Int64, Int64)],
                      Proof1[
                        Litmat[(Int64, Int64)],
                        @list.List[Litmat[(Int64, Int64)]],
                        ((Int64, Int64), @list.List[Int64]),
                        (
                          @list.List[((Int64, @list.List[Int64]), Int64)],
                          (
                            (Int64, @list.List[Int64]),
                            (
                              @list.List[
                                (
                                  (Int64, @list.List[Int64]),
                                  @list.List[Litmat[Int64]],
                                ),
                              ],
                              @list.List[
                                (
                                  (Int64, @list.List[Int64]),
                                  @list.List[Litmat[Int64]],
                                ),
                              ],
                            ),
                            LitmatExt[Int64],
                          ),
                        ),
                      ],
                    ),
                  ) raise {
                    let (sub1_3, prf1_1) = x923
                    let t924 = Proof1::Decomposition(cla1, idx, prf1_1)
                    (sub1_3, lem_1, (Litmat::Mat((j, mat1)), t924))
                  },
                  x925,
                  x926,
                )
              })(x927, x928)
            }
          },
        )
      },
      x929,
    )
  })
}

///|
/// `prove_litmat`
pub fn prove_litmat(
  x930 : SearchOpts,
  x931 : (T1, Int64),
  x932 : (
    @list.List[
      (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
    ],
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    @list.List[(Int64, Int64)],
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Int64,
  ),
) -> ((Litmat[(Int64, Int64)]) -> Strom[
  (
    (T1, Int64),
    @list.List[Lit],
    (
      Litmat[(Int64, Int64)],
      Proof1[
        Litmat[(Int64, Int64)],
        Clause[(Int64, Int64)],
        ((Int64, Int64), @list.List[Int64]),
        (
          @list.List[((Int64, @list.List[Int64]), Int64)],
          (
            (Int64, @list.List[Int64]),
            (Matrix[Int64], Matrix[Int64]),
            LitmatExt[Int64],
          ),
        ),
      ],
    ),
  ),
] raise) raise {
  let opt_2 = x930
  let sub_2 = x931
  let st = x932
  (x936 : Litmat[(Int64, Int64)]) => {
    map_litmat(
      (x934 : (Int64, @list.List[@meson.FolTerm])) => {
        prove_lit_v1(opt_2, sub_2, st, x934)
      },
      (
        x935 : (
          (Int64, Int64),
          @list.List[
            (
              ((Int64, Int64), @list.List[Int64]),
              @list.List[Litmat[(Int64, Int64)]],
            ),
          ],
        ),
      ) => prove_mat(opt_2, sub_2, st, x935),
      x936,
    )
  }
}

///|
/// `prove_clause`
pub fn prove_clause_v1(
  x937 : SearchOpts,
  x938 : (T1, Int64),
  x939 : (
    @list.List[
      (((Int64, Int64), @list.List[Int64]), @list.List[Litmat[(Int64, Int64)]]),
    ],
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    @list.List[(Int64, Int64)],
    @list.List[(Int64, @list.List[@meson.FolTerm])],
    Int64,
  ),
  x940 : @list.List[Litmat[(Int64, Int64)]],
) -> Strom[
  (
    (T1, Int64),
    @list.List[
      (
        Litmat[(Int64, Int64)],
        Proof1[
          Litmat[(Int64, Int64)],
          Clause[(Int64, Int64)],
          ((Int64, Int64), @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), Int64)],
            (
              (Int64, @list.List[Int64]),
              (Matrix[Int64], Matrix[Int64]),
              LitmatExt[Int64],
            ),
          ),
        ],
      ),
    ],
  ),
] raise {
  let opt_3 = x937
  let sub_3 = x938
  let (mi_2, path_2, pi_2, lem_2, lim_2) = x939
  match x940 {
    More(lm, tail=cla) => {
      let check : (@list.List[(Int64, @list.List[@meson.FolTerm])]) -> Bool raise = x944 => {
        @lib.exists(
          fn(x942 : (Int64, @list.List[@meson.FolTerm])) -> Bool raise {
            let x = x942
            @lib.exists(
              (x943 : (Int64, @list.List[@meson.FolTerm])) => eq(sub_3, x, x943),
              path_2,
            )
          },
          x944,
        )
      }
      let regularity = if opt_3.improved_regularity {
        check(clause_lits(cla.prepend(lm)))
      } else {
        match lm {
          Litmat::Mat(_) => false
          Litmat::Lit(l) => check(clause_lits(cla).prepend(l))
        }
      }
      if regularity {
        if @firstorder.copverb().val {
          @pp.std_formatter.print_string("regularity\n")
          @pp.std_formatter.print_flush()
          ()
        } else {
          ()
        }
        nil
      } else {
        @lib.op_bar_gt(
          prove_litmat(opt_3, sub_3, (mi_2, path_2, pi_2, lem_2, lim_2))(lm),
          (
            x952 : (Unit) -> (
              (T1, Int64),
              @list.List[(Int64, @list.List[@meson.FolTerm])],
              (
                Litmat[(Int64, Int64)],
                Proof1[
                  Litmat[(Int64, Int64)],
                  @list.List[Litmat[(Int64, Int64)]],
                  ((Int64, Int64), @list.List[Int64]),
                  (
                    @list.List[((Int64, @list.List[Int64]), Int64)],
                    (
                      (Int64, @list.List[Int64]),
                      (
                        @list.List[
                          (
                            (Int64, @list.List[Int64]),
                            @list.List[Litmat[Int64]],
                          ),
                        ],
                        @list.List[
                          (
                            (Int64, @list.List[Int64]),
                            @list.List[Litmat[Int64]],
                          ),
                        ],
                      ),
                      LitmatExt[Int64],
                    ),
                  ),
                ],
              ),
            ) raise,
          ) => {
            concat_map(
              fn(
                x945 : (
                  (T1, Int64),
                  @list.List[(Int64, @list.List[@meson.FolTerm])],
                  (
                    Litmat[(Int64, Int64)],
                    Proof1[
                      Litmat[(Int64, Int64)],
                      @list.List[Litmat[(Int64, Int64)]],
                      ((Int64, Int64), @list.List[Int64]),
                      (
                        @list.List[((Int64, @list.List[Int64]), Int64)],
                        (
                          (Int64, @list.List[Int64]),
                          (
                            @list.List[
                              (
                                (Int64, @list.List[Int64]),
                                @list.List[Litmat[Int64]],
                              ),
                            ],
                            @list.List[
                              (
                                (Int64, @list.List[Int64]),
                                @list.List[Litmat[Int64]],
                              ),
                            ],
                          ),
                          LitmatExt[Int64],
                        ),
                      ),
                    ],
                  ),
                ),
              ) -> ((Unit) -> (
                (T1, Int64),
                @list.List[
                  (
                    Litmat[(Int64, Int64)],
                    Proof1[
                      Litmat[(Int64, Int64)],
                      @list.List[Litmat[(Int64, Int64)]],
                      ((Int64, Int64), @list.List[Int64]),
                      (
                        @list.List[((Int64, @list.List[Int64]), Int64)],
                        (
                          (Int64, @list.List[Int64]),
                          (
                            @list.List[
                              (
                                (Int64, @list.List[Int64]),
                                @list.List[Litmat[Int64]],
                              ),
                            ],
                            @list.List[
                              (
                                (Int64, @list.List[Int64]),
                                @list.List[Litmat[Int64]],
                              ),
                            ],
                          ),
                          LitmatExt[Int64],
                        ),
                      ),
                    ],
                  ),
                ],
              ) raise) raise {
                let (sub1_4, lem1_1, prf1_2) = x945
                @lib.op_bar_gt(
                  prove_clause_v1(
                    opt_3,
                    sub1_4,
                    (mi_2, path_2, pi_2, lem1_1, lim_2),
                    cla,
                  ),
                  fn(
                    x950 : (Unit) -> (
                      (T1, Int64),
                      @list.List[
                        (
                          Litmat[(Int64, Int64)],
                          Proof1[
                            Litmat[(Int64, Int64)],
                            @list.List[Litmat[(Int64, Int64)]],
                            ((Int64, Int64), @list.List[Int64]),
                            (
                              @list.List[((Int64, @list.List[Int64]), Int64)],
                              (
                                (Int64, @list.List[Int64]),
                                (
                                  @list.List[
                                    (
                                      (Int64, @list.List[Int64]),
                                      @list.List[Litmat[Int64]],
                                    ),
                                  ],
                                  @list.List[
                                    (
                                      (Int64, @list.List[Int64]),
                                      @list.List[Litmat[Int64]],
                                    ),
                                  ],
                                ),
                                LitmatExt[Int64],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ) raise,
                  ) -> ((Unit) -> (
                    (T1, Int64),
                    @list.List[
                      (
                        Litmat[(Int64, Int64)],
                        Proof1[
                          Litmat[(Int64, Int64)],
                          @list.List[Litmat[(Int64, Int64)]],
                          ((Int64, Int64), @list.List[Int64]),
                          (
                            @list.List[((Int64, @list.List[Int64]), Int64)],
                            (
                              (Int64, @list.List[Int64]),
                              (
                                @list.List[
                                  (
                                    (Int64, @list.List[Int64]),
                                    @list.List[Litmat[Int64]],
                                  ),
                                ],
                                @list.List[
                                  (
                                    (Int64, @list.List[Int64]),
                                    @list.List[Litmat[Int64]],
                                  ),
                                ],
                              ),
                              LitmatExt[Int64],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ) raise) raise {
                    fn(
                      x951 : Unit,
                    ) -> (
                      (T1, Int64),
                      @list.List[
                        (
                          Litmat[(Int64, Int64)],
                          Proof1[
                            Litmat[(Int64, Int64)],
                            @list.List[Litmat[(Int64, Int64)]],
                            ((Int64, Int64), @list.List[Int64]),
                            (
                              @list.List[((Int64, @list.List[Int64]), Int64)],
                              (
                                (Int64, @list.List[Int64]),
                                (
                                  @list.List[
                                    (
                                      (Int64, @list.List[Int64]),
                                      @list.List[Litmat[Int64]],
                                    ),
                                  ],
                                  @list.List[
                                    (
                                      (Int64, @list.List[Int64]),
                                      @list.List[Litmat[Int64]],
                                    ),
                                  ],
                                ),
                                LitmatExt[Int64],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ) raise {
                      ((
                        x948 : (Unit) -> (
                          (T1, Int64),
                          @list.List[
                            (
                              Litmat[(Int64, Int64)],
                              Proof1[
                                Litmat[(Int64, Int64)],
                                @list.List[Litmat[(Int64, Int64)]],
                                ((Int64, Int64), @list.List[Int64]),
                                (
                                  @list.List[
                                    ((Int64, @list.List[Int64]), Int64),
                                  ],
                                  (
                                    (Int64, @list.List[Int64]),
                                    (
                                      @list.List[
                                        (
                                          (Int64, @list.List[Int64]),
                                          @list.List[Litmat[Int64]],
                                        ),
                                      ],
                                      @list.List[
                                        (
                                          (Int64, @list.List[Int64]),
                                          @list.List[Litmat[Int64]],
                                        ),
                                      ],
                                    ),
                                    LitmatExt[Int64],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ) raise,
                        x949 : Unit,
                      ) => {
                        map(
                          fn(
                            x947 : (
                              (T1, Int64),
                              @list.List[
                                (
                                  Litmat[(Int64, Int64)],
                                  Proof1[
                                    Litmat[(Int64, Int64)],
                                    @list.List[Litmat[(Int64, Int64)]],
                                    ((Int64, Int64), @list.List[Int64]),
                                    (
                                      @list.List[
                                        ((Int64, @list.List[Int64]), Int64),
                                      ],
                                      (
                                        (Int64, @list.List[Int64]),
                                        (
                                          @list.List[
                                            (
                                              (Int64, @list.List[Int64]),
                                              @list.List[Litmat[Int64]],
                                            ),
                                          ],
                                          @list.List[
                                            (
                                              (Int64, @list.List[Int64]),
                                              @list.List[Litmat[Int64]],
                                            ),
                                          ],
                                        ),
                                        LitmatExt[Int64],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ) -> (
                            (T1, Int64),
                            @list.List[
                              (
                                Litmat[(Int64, Int64)],
                                Proof1[
                                  Litmat[(Int64, Int64)],
                                  @list.List[Litmat[(Int64, Int64)]],
                                  ((Int64, Int64), @list.List[Int64]),
                                  (
                                    @list.List[
                                      ((Int64, @list.List[Int64]), Int64),
                                    ],
                                    (
                                      (Int64, @list.List[Int64]),
                                      (
                                        @list.List[
                                          (
                                            (Int64, @list.List[Int64]),
                                            @list.List[Litmat[Int64]],
                                          ),
                                        ],
                                        @list.List[
                                          (
                                            (Int64, @list.List[Int64]),
                                            @list.List[Litmat[Int64]],
                                          ),
                                        ],
                                      ),
                                      LitmatExt[Int64],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ) raise {
                            let (sub2_1, prf2) = x947
                            (sub2_1, prf2.prepend(prf1_2))
                          },
                          x948,
                          x949,
                        )
                      })(x950, x951)
                    }
                  },
                )
              },
              x952,
            )
          },
        )
      }
    }
    Empty => {
      if @firstorder.copverb().val {
        @pp.std_formatter.print_string("axiom\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      cons((sub_3, @list.List([])), nil)
    }
  }
}

///|
/// `DISJ_CASES_LIST`
pub fn disj_cases_list(
  x954 : @kernel.Thm,
  x955 : @list.List[@kernel.Thm],
) -> @kernel.Thm raise {
  let th = x954
  let prfs = x955
  let t956 = Int::to_int64(@lib.length(@basics.disjuncts(@kernel.concl(th))))
  if Int::to_int64(@lib.length(prfs)) == t956 {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1245:2")
  }
  let t960 = @lib.map(
    fn(x959 : @kernel.Thm) -> @list.List[@kernel.Term] raise {
      @kernel.hyp(x959)
    },
    prfs,
  )
  if @lib.list_for_all2(
      fn(x957 : @kernel.Term, x958 : @list.List[@kernel.Term]) -> Bool raise {
        @lib.mem(x957, x958)
      },
      @basics.disjuncts(@kernel.concl(th)),
      t960,
    ) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1246:2")
  }
  let c = @kernel.concl(@lib.hd(prfs))
  if @lib.fold_left(
      fn(x961 : Bool, x962 : @kernel.Thm) -> Bool raise {
        let acc = x961
        let x = x962
        acc && @kernel.concl(x) == c
      },
      true,
      prfs,
    ) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1248:2")
  }
  match prfs {
    Empty => raise Failure("DISJ_CASES_LIST")
    More(p, tail=Empty) => @bool.mp(@bool.disch(@kernel.concl(th), p), th)
    More(p1, tail=More(p2, tail=Empty)) => @bool.disj_cases(th, p1, p2)
    More(p_1, tail=ps) =>
      @bool.disj_cases(
        th,
        p_1,
        disj_cases_list(
          @kernel.assume_rule(@basics.dest_disj(@kernel.concl(th)).1),
          ps,
        ),
      )
  }
}

///|
/// thecops.ml:1256
fn step_18() -> Unit raise {
  let t967 = @term_syntax.parse_term("(c : Bool) || (b : Bool) || (a : Bool)")
  let t963 = @lib.op_bar_gt(
    @class.taut(@term_syntax.parse_term("(c : Bool) → c || (b : Bool) || (a : Bool)")),
    @bool.undisch,
  )
  let t964 = @lib.op_bar_gt(
    @class.taut(@term_syntax.parse_term("(b : Bool) → (c : Bool) || b || (a : Bool)")),
    @bool.undisch,
  )
  let t965 = @list.List([
    @lib.op_bar_gt(
      @class.taut(@term_syntax.parse_term("(a : Bool) → (c : Bool) || (b : Bool) || a")),
      @bool.undisch,
    ),
    t964,
    t963,
  ])
  if @lib.op_bar_gt(
      disj_cases_list(
        @kernel.assume_rule(@term_syntax.parse_term("(a : Bool) || (b : Bool) || (c : Bool)")),
        t965,
      ),
      fn(x966 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x966) },
    ) ==
    t967 {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1256:0")
  }
}

///|
/// `CONTRADICTION`
pub fn contradiction(
  x968 : @kernel.Thm,
  x969 : @kernel.Thm,
) -> @kernel.Thm raise {
  let x = x968
  let y = x969
  let t970 = @kernel.concl(y)
  let (xc, yc) = (@kernel.concl(x), t970)
  if @firstorder.copverb().val {
    let t971 = @printer.string_of_term(yc)
    let t972 = @printer.string_of_term(xc)
    @pp.std_formatter.print_string("contra: " + t972 + " with " + t971 + "\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  if @basics.is_neg(xc) && !@basics.is_neg(yc) {
    @bool.mp(@bool.not_elim(x), y)
  } else if @basics.is_neg(yc) && !@basics.is_neg(xc) {
    @bool.mp(@bool.not_elim(y), x)
  } else {
    raise Failure("no contradiction found")
  }
}

///|
/// thecops.ml:1269
fn step_19() -> Unit raise {
  let t974 = @term_syntax.parse_term("false")
  let t973 = @kernel.assume_rule(@term_syntax.parse_term("(p : Bool)"))
  if @kernel.concl(
      contradiction(@kernel.assume_rule(@term_syntax.parse_term("!(p : Bool)")), t973),
    ) ==
    t974 {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1269:0")
  }
}

///|
/// thecops.ml:1270
fn step_20() -> Unit raise {
  let t976 = @term_syntax.parse_term("false")
  let t975 = @kernel.assume_rule(@term_syntax.parse_term("!(p : Bool)"))
  if @kernel.concl(
      contradiction(@kernel.assume_rule(@term_syntax.parse_term("(p : Bool)")), t975),
    ) ==
    t976 {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1270:0")
  }
}

///|
/// `flip_neg`
pub fn flip_neg(x977 : @kernel.Term) -> @kernel.Term raise {
  let tm = x977
  if @basics.is_neg(tm) {
    @basics.dest_neg(tm)
  } else {
    @bool.mk_neg(tm)
  }
}

///|
/// `nth_disj`
pub fn nth_disj(
  x978 : Int64,
  x979 : @kernel.Thm,
) -> (@kernel.Thm, (@list.List[@kernel.Thm], @list.List[@kernel.Thm])) raise {
  let j = x978
  let th = x979
  if @firstorder.copverb().val {
    let t980 = @printer.string_of_term(@kernel.concl(th))
    @pp.std_formatter.print_string(
      "nth_disj " + Int64::to_string(j) + " " + t980 + "\n",
    )
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  let t983 = @firstorder.nth_rest(j)
  @lib.op_bar_gt(
    @lib.op_bar_gt(
      @lib.op_bar_gt(@kernel.concl(th), fn(
        x981 : @kernel.Term,
      ) -> @list.List[@kernel.Term] raise {
        @basics.disjuncts(x981)
      }),
      x982 => @lib.map(@kernel.assume_rule, x982),
    ),
    t983,
  )
}

///|
/// `nth_conj`
pub fn nth_conj(x984 : Int64, x985 : @kernel.Thm) -> @kernel.Thm raise {
  let i = x984
  let th = x985
  if @firstorder.copverb().val {
    let t986 = @printer.string_of_term(@kernel.concl(th))
    @pp.std_formatter.print_string(
      "nth_conj " + Int64::to_string(i) + " " + t986 + "\n",
    )
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  let t987 = @lib.int63_to_int(i)
  @lib.list_nth(@bool.conjuncts_rule(th), t987)
}

///|
/// `inst_var`
pub fn inst_var(
  x988 : T1,
  x989 : @kernel.HolType,
  x990 : Int64,
) -> @kernel.Term raise {
  let sub = x988
  let ty = x989
  let v = x990
  let ftm = inst_tm_v1(sub, @meson.FolTerm::Fvar(v))
  @firstorder.hol_of_term(ty, ftm) catch {
    Failure(e) => raise Failure("inst_var: " + e)
    e => raise e
  }
}

///|
/// `spec_vars`
pub fn spec_vars(
  x991 : T1,
  x992 : @list.List[Int64],
  x993 : @kernel.Thm,
) -> @kernel.Thm raise {
  let sub = x991
  let vs = x992
  let th = x993
  if @firstorder.copverb().val {
    let t994 = @printer.string_of_term(@kernel.concl(th))
    let t995 = Int::to_int64(@lib.length(vs))
    @pp.std_formatter.print_string(
      "spec_vars: |vars| = " + Int64::to_string(t995) + ", th = " + t994 + "\n",
    )
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  let tys = @lib.op_bar_gt(
    @lib.op_bar_gt(
      @lib.op_bar_gt(@kernel.concl(th), fn(
        x996 : @kernel.Term,
      ) -> (@list.List[@kernel.Term], @kernel.Term) raise {
        @basics.strip_forall(x996)
      }),
      fn(
        x997 : (@list.List[@kernel.Term], @kernel.Term),
      ) -> @list.List[@kernel.Term] raise {
        x997.0
      },
    ),
    x999 => {
      @lib.map(
        fn(x998 : @kernel.Term) -> @kernel.HolType raise {
          @kernel.type_of(x998)
        },
        x999,
      )
    },
  )
  let t1000 = Int::to_int64(@lib.length(vs))
  if Int::to_int64(@lib.length(tys)) == t1000 {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1295:2")
  }
  @lib.list_fold_left2(
    fn(
      x1001 : @kernel.Thm,
      x1002 : @kernel.HolType,
      x1003 : Int64,
    ) -> @kernel.Thm raise {
      let th_1 = x1001
      let ty = x1002
      let v = x1003
      @bool.spec(inst_var(sub, ty, v), th_1)
    },
    th,
    tys,
    vs,
  )
}

///|
/// `recon_data`
pub(all) struct ReconData {
  problem : @kernel.Thm
  mapping : @list.List[(Int64, Int64)]
  sub : T1
}

///|
pub extend ReconData with @lib.OCompare::{ocompare}

///|
pub extend ReconData with @lib.OHash::{ohash_visit}

///|
pub impl @lib.OCompare for ReconData with fn ocompare(self, other) {
  let c = @lib.compare(self.problem, other.problem)
  if c != 0 {
    return c
  }
  let c = @lib.compare(self.mapping, other.mapping)
  if c != 0 {
    return c
  }
  @lib.compare(self.sub, other.sub)
}

///|
pub impl @lib.OHash for ReconData with fn ohash_visit(self, h) {
  h.block(0, 3)
  h.field(self.problem)
  h.field(self.mapping)
  h.field(self.sub)
}

///|
/// `clause_index_mapping`
pub fn[TA] clause_index_mapping(
  x1004 : @list.List[Litmat[TA]],
) -> @list.List[(TA, Int64)] raise {
  let cl = x1004
  @lib.op_bar_gt(
    @lib.op_bar_gt(cl, x1008 => {
      @lib.list_mapi(
        fn(x1005 : Int, x1006 : Litmat[TA]) -> @list.List[(TA, Int64)] raise {
          let idx = x1005
          match x1006 {
            Litmat::Lit(_) => @list.List([])
            Litmat::Mat((j, mat_1)) => {
              let t1007 = matrix_index_mapping(mat_1)
              t1007.prepend((j, Int::to_int64(idx)))
            }
          }
        },
        x1008,
      )
    }),
    fn(
      x1009 : @list.List[@list.List[(TA, Int64)]],
    ) -> @list.List[(TA, Int64)] raise {
      @lib.flat(x1009)
    },
  )
}

///|
/// `matrix_index_mapping`
pub fn[TA] matrix_index_mapping(
  x1010 : @list.List[((TA, @list.List[Int64]), @list.List[Litmat[TA]])],
) -> @list.List[(TA, Int64)] raise {
  let mat_2 = x1010
  @lib.op_bar_gt(
    @lib.op_bar_gt(mat_2, x1014 => {
      @lib.list_mapi(
        fn(
          x1011 : Int,
          x1012 : ((TA, @list.List[Int64]), @list.List[Litmat[TA]]),
        ) -> @list.List[(TA, Int64)] raise {
          let idx_1 = x1011
          let ((i, v), cl_1) = x1012
          let t1013 = clause_index_mapping(cl_1)
          t1013.prepend((i, Int::to_int64(idx_1)))
        },
        x1014,
      )
    }),
    fn(
      x1015 : @list.List[@list.List[(TA, Int64)]],
    ) -> @list.List[(TA, Int64)] raise {
      @lib.flat(x1015)
    },
  )
}

///|
/// `mk_recon_data`
pub fn mk_recon_data(
  x1016 : @kernel.Thm,
  x1017 : @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
  x1018 : T1,
) -> ReconData raise {
  let (problem, mat_1, sub) = (x1016, x1017, x1018)
  ReconData::{ problem, mapping: matrix_index_mapping(mat_1), sub, }
}

///|
/// `prefix_problem`
pub fn prefix_problem(
  x1019 : ReconData,
) -> ((@list.List[((Int64, @list.List[Int64]), Int64)]) -> @kernel.Thm raise) raise {
  let data = x1019
  let rel : (Int64) -> Int64 raise = fn(x1021 : Int64) -> Int64 raise {
    let i = x1021
    @lib.list_assoc(i, data.mapping)
  }
  let t1031 = data.problem
  x1032 => {
    @lib.fold_left(
      fn(
        x1022 : @kernel.Thm,
        x1023 : ((Int64, @list.List[Int64]), Int64),
      ) -> @kernel.Thm raise {
        let th = x1022
        let ((i_1, v), j) = x1023
        let t1028 = rel(j)
        let t1026 = data.sub
        let t1024 = rel(i_1)
        @lib.op_bar_gt(
          @lib.op_bar_gt(
            @lib.op_bar_gt(
              @lib.op_bar_gt(th, (x1025 : @kernel.Thm) => nth_conj(t1024, x1025)),
              (x1027 : @kernel.Thm) => spec_vars(t1026, v, x1027),
            ),
            (x1029 : @kernel.Thm) => nth_disj(t1028, x1029),
          ),
          fn(
            x1030 : (
              @kernel.Thm,
              (@list.List[@kernel.Thm], @list.List[@kernel.Thm]),
            ),
          ) -> @kernel.Thm raise {
            x1030.0
          },
        )
      },
      t1031,
      x1032,
    )
  }
}

///|
/// `eat_proofs`
pub fn[
  TA : Eq + @lib.OCompare + @lib.OHash,
  TB : Eq + @lib.OCompare + @lib.OHash,
] eat_proofs(
  x1033 : ReconData,
) -> ((
  (
    @list.List[(@kernel.Term, @kernel.Thm)],
    @list.List[
      (
        Litmat[TA],
        Proof1[
          Litmat[TA],
          Clause[TA],
          ((Int64, TB), @list.List[Int64]),
          (@list.List[((Int64, @list.List[Int64]), Int64)], ClauseExt[Int64]),
        ],
      ),
    ],
  ),
) -> ((@list.List[@kernel.Thm]) -> (
  (
    @list.List[(@kernel.Term, @kernel.Thm)],
    @list.List[
      (
        Litmat[TA],
        Proof1[
          Litmat[TA],
          Clause[TA],
          ((Int64, TB), @list.List[Int64]),
          (@list.List[((Int64, @list.List[Int64]), Int64)], ClauseExt[Int64]),
        ],
      ),
    ],
  ),
  @list.List[@kernel.Thm],
) raise) raise) raise {
  let data = x1033
  fn(
    x1039 : (
      @list.List[(@kernel.Term, @kernel.Thm)],
      @list.List[
        (
          Litmat[TA],
          Proof1[
            Litmat[TA],
            @list.List[Litmat[TA]],
            ((Int64, TB), @list.List[Int64]),
            (
              @list.List[((Int64, @list.List[Int64]), Int64)],
              (
                (Int64, @list.List[Int64]),
                (
                  @list.List[
                    ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                  ],
                  @list.List[
                    ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                  ],
                ),
                LitmatExt[Int64],
              ),
            ),
          ],
        ),
      ],
    ),
  ) -> ((@list.List[@kernel.Thm]) -> (
    (
      @list.List[(@kernel.Term, @kernel.Thm)],
      @list.List[
        (
          Litmat[TA],
          Proof1[
            Litmat[TA],
            @list.List[Litmat[TA]],
            ((Int64, TB), @list.List[Int64]),
            (
              @list.List[((Int64, @list.List[Int64]), Int64)],
              (
                (Int64, @list.List[Int64]),
                (
                  @list.List[
                    ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                  ],
                  @list.List[
                    ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                  ],
                ),
                LitmatExt[Int64],
              ),
            ),
          ],
        ),
      ],
    ),
    @list.List[@kernel.Thm],
  ) raise) raise {
    fn(
      x1040 : @list.List[@kernel.Thm],
    ) -> (
      (
        @list.List[(@kernel.Term, @kernel.Thm)],
        @list.List[
          (
            Litmat[TA],
            Proof1[
              Litmat[TA],
              @list.List[Litmat[TA]],
              ((Int64, TB), @list.List[Int64]),
              (
                @list.List[((Int64, @list.List[Int64]), Int64)],
                (
                  (Int64, @list.List[Int64]),
                  (
                    @list.List[
                      ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                    ],
                    @list.List[
                      ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                    ],
                  ),
                  LitmatExt[Int64],
                ),
              ),
            ],
          ),
        ],
      ),
      @list.List[@kernel.Thm],
    ) raise {
      ((
        x1037 : (
          @list.List[(@kernel.Term, @kernel.Thm)],
          @list.List[
            (
              Litmat[TA],
              Proof1[
                Litmat[TA],
                @list.List[Litmat[TA]],
                ((Int64, TB), @list.List[Int64]),
                (
                  @list.List[((Int64, @list.List[Int64]), Int64)],
                  (
                    (Int64, @list.List[Int64]),
                    (
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                      @list.List[
                        ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                      ],
                    ),
                    LitmatExt[Int64],
                  ),
                ),
              ],
            ),
          ],
        ),
        x1038 : @list.List[@kernel.Thm],
      ) => {
        @firstorder.fold_map(
          fn(
            x1035 : (
              @list.List[(@kernel.Term, @kernel.Thm)],
              @list.List[
                (
                  Litmat[TA],
                  Proof1[
                    Litmat[TA],
                    @list.List[Litmat[TA]],
                    ((Int64, TB), @list.List[Int64]),
                    (
                      @list.List[((Int64, @list.List[Int64]), Int64)],
                      (
                        (Int64, @list.List[Int64]),
                        (
                          @list.List[
                            (
                              (Int64, @list.List[Int64]),
                              @list.List[Litmat[Int64]],
                            ),
                          ],
                          @list.List[
                            (
                              (Int64, @list.List[Int64]),
                              @list.List[Litmat[Int64]],
                            ),
                          ],
                        ),
                        LitmatExt[Int64],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ) -> ((@kernel.Thm) -> (
            (
              @list.List[(@kernel.Term, @kernel.Thm)],
              @list.List[
                (
                  Litmat[TA],
                  Proof1[
                    Litmat[TA],
                    @list.List[Litmat[TA]],
                    ((Int64, TB), @list.List[Int64]),
                    (
                      @list.List[((Int64, @list.List[Int64]), Int64)],
                      (
                        (Int64, @list.List[Int64]),
                        (
                          @list.List[
                            (
                              (Int64, @list.List[Int64]),
                              @list.List[Litmat[Int64]],
                            ),
                          ],
                          @list.List[
                            (
                              (Int64, @list.List[Int64]),
                              @list.List[Litmat[Int64]],
                            ),
                          ],
                        ),
                        LitmatExt[Int64],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            @kernel.Thm,
          ) raise) raise {
            let (lem, prfs) = x1035
            fn(
              x1036 : @kernel.Thm,
            ) -> (
              (
                @list.List[(@kernel.Term, @kernel.Thm)],
                @list.List[
                  (
                    Litmat[TA],
                    Proof1[
                      Litmat[TA],
                      @list.List[Litmat[TA]],
                      ((Int64, TB), @list.List[Int64]),
                      (
                        @list.List[((Int64, @list.List[Int64]), Int64)],
                        (
                          (Int64, @list.List[Int64]),
                          (
                            @list.List[
                              (
                                (Int64, @list.List[Int64]),
                                @list.List[Litmat[Int64]],
                              ),
                            ],
                            @list.List[
                              (
                                (Int64, @list.List[Int64]),
                                @list.List[Litmat[Int64]],
                              ),
                            ],
                          ),
                          LitmatExt[Int64],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              @kernel.Thm,
            ) raise {
              let th = x1036
              match prfs {
                More(prf, tail=prfs_1) => {
                  let bot = bot_of_proof(data, lem, th, prf)
                  ((lem.prepend((@kernel.concl(th), bot)), prfs_1), bot)
                }
                Empty => raise Failure("eat_proofs")
              }
            }
          },
          x1037,
          x1038,
        )
      })(x1039, x1040)
    }
  }
}

///|
/// `bot_of_clause_ext`
pub fn[
  TA : Eq + @lib.OCompare + @lib.OHash,
  TB : Eq + @lib.OCompare + @lib.OHash,
] bot_of_clause_ext(
  x1041 : ReconData,
  x1042 : (
    (Int64, @list.List[Int64]),
    (
      @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
      @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
    ),
    LitmatExt[Int64],
  ),
  x1043 : (
    @list.List[(@kernel.Term, @kernel.Thm)],
    @list.List[
      (
        Litmat[TA],
        Proof1[
          Litmat[TA],
          @list.List[Litmat[TA]],
          ((Int64, TB), @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), Int64)],
            (
              (Int64, @list.List[Int64]),
              (
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
              ),
              LitmatExt[Int64],
            ),
          ),
        ],
      ),
    ],
  ),
  x1044 : @kernel.Thm,
) -> (
  (
    @list.List[(@kernel.Term, @kernel.Thm)],
    @list.List[
      (
        Litmat[TA],
        Proof1[
          Litmat[TA],
          Clause[TA],
          ((Int64, TB), @list.List[Int64]),
          (@list.List[((Int64, @list.List[Int64]), Int64)], ClauseExt[Int64]),
        ],
      ),
    ],
  ),
  @kernel.Thm,
) raise {
  let data_1 = x1041
  let ((i, v), (matl, matr), lmext) = x1042
  let acc = x1043
  let th_1 = x1044
  let i_p = @lib.list_assoc(i, data_1.mapping)
  if i_p == Int::to_int64(@lib.length(matl)) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1339:2")
  }
  let t1045 = @lib.add63(1L, Int::to_int64(@lib.length(matl.concat(matr))))
  if Int::to_int64(@lib.length(@bool.conjuncts_rule(th_1))) == t1045 {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1340:2")
  }
  let t1046 = data_1.sub
  bot_of_litmat_ext(
    data_1,
    acc,
    @lib.op_bar_gt(nth_conj(i_p, th_1), (x1047 : @kernel.Thm) => {
      spec_vars(t1046, v, x1047)
    }),
    lmext,
  )
}

///|
/// `bot_of_litmat_ext`
pub fn[
  TA : Eq + @lib.OCompare + @lib.OHash,
  TB : Eq + @lib.OCompare + @lib.OHash,
] bot_of_litmat_ext(
  x1048 : ReconData,
  x1049 : (
    @list.List[(@kernel.Term, @kernel.Thm)],
    @list.List[
      (
        Litmat[TA],
        Proof1[
          Litmat[TA],
          @list.List[Litmat[TA]],
          ((Int64, TB), @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), Int64)],
            (
              (Int64, @list.List[Int64]),
              (
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
              ),
              LitmatExt[Int64],
            ),
          ),
        ],
      ),
    ],
  ),
  x1050 : @kernel.Thm,
  x1051 : LitmatExt[Int64],
) -> (
  (
    @list.List[(@kernel.Term, @kernel.Thm)],
    @list.List[
      (
        Litmat[TA],
        Proof1[
          Litmat[TA],
          Clause[TA],
          ((Int64, TB), @list.List[Int64]),
          (@list.List[((Int64, @list.List[Int64]), Int64)], ClauseExt[Int64]),
        ],
      ),
    ],
  ),
  @kernel.Thm,
) raise {
  let data_2 = x1048
  let acc_1 = x1049
  let thi = x1050
  match x1051 {
    LitmatExt::Litext((clal, clar), clac) => {
      let j = Int::to_int64(@lib.length(clal))
      let (thj, (thl, thr)) = nth_disj(j, thi)
      let (acc1, botsl) = eat_proofs(data_2)(acc_1)(thl)
      let (acc2, botsr) = eat_proofs(data_2)(acc1)(thr)
      if @firstorder.copverb().val {
        let t1052 = @printer.string_of_thm(thi)
        @pp.std_formatter.print_string(
          "bot_of_litmat_ext: thi = " + t1052 + "\n",
        )
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let tmj = @kernel.concl(thj)
      if !(@basics.is_conj(tmj) || @basics.is_disj(tmj)) {
        ()
      } else {
        raise @lib.AssertFailure("tscript.ml:1350:6")
      }
      let botj = contradiction(
        thj,
        @lib.op_bar_gt(
          @lib.op_bar_gt(@kernel.concl(thj), flip_neg),
          @kernel.assume_rule,
        ),
      )
      (acc2, disj_cases_list(thi, botsl.concat(botsr.prepend(botj))))
    }
    LitmatExt::Matext(j_1, (clal_1, clar_1), clext) => {
      let j_p = @lib.list_assoc(j_1, data_2.mapping)
      if j_p == Int::to_int64(@lib.length(clal_1)) {
        ()
      } else {
        raise @lib.AssertFailure("tscript.ml:1355:6")
      }
      let (thj_1, (thl_1, thr_1)) = nth_disj(j_p, thi)
      let (acc1_1, botj_1) = bot_of_clause_ext(data_2, clext, acc_1, thj_1)
      let (acc2_1, botsl_1) = eat_proofs(data_2)(acc1_1)(thl_1)
      let (acc3, botsr_1) = eat_proofs(data_2)(acc2_1)(thr_1)
      (acc3, disj_cases_list(thi, botsl_1.concat(botsr_1.prepend(botj_1))))
    }
  }
}

///|
/// `bot_of_proof`
pub fn[
  TA : Eq + @lib.OCompare + @lib.OHash,
  TB : Eq + @lib.OCompare + @lib.OHash,
] bot_of_proof(
  x1053 : ReconData,
  x1054 : @list.List[(@kernel.Term, @kernel.Thm)],
  x1055 : @kernel.Thm,
  x1056 : (
    Litmat[TA],
    Proof1[
      Litmat[TA],
      @list.List[Litmat[TA]],
      ((Int64, TB), @list.List[Int64]),
      (
        @list.List[((Int64, @list.List[Int64]), Int64)],
        (
          (Int64, @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
            @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
          ),
          LitmatExt[Int64],
        ),
      ),
    ],
  ),
) -> @kernel.Thm raise {
  let data_3 = x1053
  let lem_1 = x1054
  let th_2 = x1055
  match x1056 {
    (
      Litmat::Mat((j_2, mat_1)),
      Proof1::Decomposition(cla, ((i_1, k), v_1), prfs_2),
    ) => {
      let i_p_1 = @lib.list_assoc(i_1, data_3.mapping)
      if i_p_1 < Int::to_int64(@lib.length(mat_1)) {
        ()
      } else {
        raise @lib.AssertFailure("tscript.ml:1365:6")
      }
      if @lib.list_nth(mat_1, @lib.int63_to_int(i_p_1)).1 == cla {
        ()
      } else {
        raise @lib.AssertFailure("tscript.ml:1366:6")
      }
      if @firstorder.copverb().val {
        let t1057 = @printer.string_of_term(@kernel.concl(th_2))
        @pp.std_formatter.print_string(
          "Decomposition " + Int64::to_string(i_p_1) + ": " + t1057 + "\n",
        )
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      let t1058 = data_3.sub
      let thi_1 = @lib.op_bar_gt(nth_conj(i_p_1, th_2), (x1059 : @kernel.Thm) => {
        spec_vars(t1058, v_1, x1059)
      })
      let djs = @basics.disjuncts(@kernel.concl(thi_1))
      let t1060 = Int::to_int64(@lib.length(prfs_2))
      if Int::to_int64(@lib.length(djs)) == t1060 {
        ()
      } else {
        raise @lib.AssertFailure("tscript.ml:1371:6")
      }
      let t1061 = eat_proofs(data_3)((lem_1, prfs_2))
      @lib.op_bar_gt(
        @lib.op_bar_gt(
          @lib.op_bar_gt(@lib.map(@kernel.assume_rule, djs), t1061),
          fn(
            x1062 : (
              (
                @list.List[(@kernel.Term, @kernel.Thm)],
                @list.List[
                  (
                    Litmat[TA],
                    Proof1[
                      Litmat[TA],
                      @list.List[Litmat[TA]],
                      ((Int64, TB), @list.List[Int64]),
                      (
                        @list.List[((Int64, @list.List[Int64]), Int64)],
                        (
                          (Int64, @list.List[Int64]),
                          (
                            @list.List[
                              (
                                (Int64, @list.List[Int64]),
                                @list.List[Litmat[Int64]],
                              ),
                            ],
                            @list.List[
                              (
                                (Int64, @list.List[Int64]),
                                @list.List[Litmat[Int64]],
                              ),
                            ],
                          ),
                          LitmatExt[Int64],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              @list.List[@kernel.Thm],
            ),
          ) -> @list.List[@kernel.Thm] raise {
            x1062.1
          },
        ),
        (x1063 : @list.List[@kernel.Thm]) => disj_cases_list(thi_1, x1063),
      )
    }
    (Litmat::Lit(lit_1), prf_1) => {
      let t1064 = inst_lit_v1(data_3.sub, lit_1)
      let liti = @firstorder.hol_of_literal(t1064.0, t1064.1)
      if @firstorder.copverb().val {
        let t1065 = @printer.string_of_term(liti)
        @pp.std_formatter.print_string("bot_of_proof: lit = " + t1065 + "\n")
        @pp.std_formatter.print_flush()
        ()
      } else {
        ()
      }
      if liti == @kernel.concl(th_2) {
        ()
      } else {
        raise @lib.AssertFailure("tscript.ml:1378:6")
      }
      match prf_1 {
        Proof1::Reduction =>
          @lib.op_bar_gt(@lib.op_bar_gt(flip_neg(liti), @kernel.assume_rule), (
            x1066 : @kernel.Thm,
          ) => contradiction(th_2, x1066))
        Proof1::Lemma => {
          if @lib.list_mem_assoc(liti, lem_1) {
            ()
          } else {
            raise @lib.AssertFailure("tscript.ml:1381:17")
          }
          @lib.list_assoc(liti, lem_1)
        }
        Proof1::Extension(_, (prefix, postfix), prfs_3) => {
          let prefix_th = prefix_problem(data_3)(prefix)
          if @firstorder.copverb().val {
            let t1067 = @printer.string_of_thm(prefix_th)
            @pp.std_formatter.print_string("prefix_th = " + t1067 + "\n")
            @pp.std_formatter.print_flush()
            ()
          } else {
            ()
          }
          let ((_, prfs_p), bot_1) = bot_of_clause_ext(
            data_3,
            postfix,
            (lem_1, prfs_3),
            prefix_th,
          )
          if prfs_p == @list.List([]) {
            ()
          } else {
            raise @lib.AssertFailure("tscript.ml:1388:10")
          }
          let t1068 = @kernel.hyp(bot_1)
          if @lib.mem(@kernel.concl(th_2), t1068) {
            ()
          } else {
            raise @lib.AssertFailure("tscript.ml:1389:10")
          }
          @bool.mp(@bool.disch(@kernel.concl(th_2), bot_1), th_2)
        }
        _ => raise Failure("bot_of_proof: not a well-formed proof")
      }
    }
    _ => raise Failure("bot_of_proof: not a well-formed proof")
  }
}

///|
/// `start`
pub fn start_v1(
  x1069 : @list.List[((Int64, @list.List[Int64]), @list.List[Litmat[Int64]])],
  x1070 : SearchOpts,
  x1071 : Int64,
) -> (
  T1,
  (
    Litmat[(Int64, Int64)],
    Proof1[
      Litmat[(Int64, Int64)],
      Clause[(Int64, Int64)],
      ((Int64, Int64), @list.List[Int64]),
      (
        @list.List[((Int64, @list.List[Int64]), Int64)],
        (
          (Int64, @list.List[Int64]),
          (Matrix[Int64], Matrix[Int64]),
          LitmatExt[Int64],
        ),
      ),
    ],
  ),
)? raise {
  let mat_1 = x1069
  let opt = x1070
  let lim = x1071
  if @firstorder.copverb().val {
    let t1072 = @lib.add63(lim, 1L)
    @pp.std_formatter.print_string("Start " + Int64::to_string(t1072) + "\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  let mati = copy_matrix(0L)(mat_1)
  let sub0 = empty_v1(1000000L)
  let hashek = @firstorder.fol_of_literal(
    @list.List([]),
    @list.List([]),
    hashek_tm(),
  )
  @firstorder.op_gt_gt_eq(
    @lib.op_bar_gt(
      @lib.op_bar_gt(of_list(mati), fn(
        x1077 : (Unit) -> (
          ((Int64, Int64), @list.List[Int64]),
          @list.List[Litmat[(Int64, Int64)]],
        ) raise,
      ) -> ((Unit) -> (
        (T1, Int64),
        Proof1[
          Litmat[(Int64, Int64)],
          @list.List[Litmat[(Int64, Int64)]],
          ((Int64, Int64), @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), Int64)],
            (
              (Int64, @list.List[Int64]),
              (
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
              ),
              LitmatExt[Int64],
            ),
          ),
        ],
      ) raise) raise {
        fn(
          x1078 : Unit,
        ) -> (
          (T1, Int64),
          Proof1[
            Litmat[(Int64, Int64)],
            @list.List[Litmat[(Int64, Int64)]],
            ((Int64, Int64), @list.List[Int64]),
            (
              @list.List[((Int64, @list.List[Int64]), Int64)],
              (
                (Int64, @list.List[Int64]),
                (
                  @list.List[
                    ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                  ],
                  @list.List[
                    ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                  ],
                ),
                LitmatExt[Int64],
              ),
            ),
          ],
        ) raise {
          ((
            x1075 : (Unit) -> (
              ((Int64, Int64), @list.List[Int64]),
              @list.List[Litmat[(Int64, Int64)]],
            ) raise,
            x1076 : Unit,
          ) => {
            filter_map(
              fn(
                x1073 : (
                  ((Int64, Int64), @list.List[Int64]),
                  @list.List[Litmat[(Int64, Int64)]],
                ),
              ) -> (
                (T1, Int64),
                Proof1[
                  Litmat[(Int64, Int64)],
                  @list.List[Litmat[(Int64, Int64)]],
                  ((Int64, Int64), @list.List[Int64]),
                  (
                    @list.List[((Int64, @list.List[Int64]), Int64)],
                    (
                      (Int64, @list.List[Int64]),
                      (
                        @list.List[
                          (
                            (Int64, @list.List[Int64]),
                            @list.List[Litmat[Int64]],
                          ),
                        ],
                        @list.List[
                          (
                            (Int64, @list.List[Int64]),
                            @list.List[Litmat[Int64]],
                          ),
                        ],
                      ),
                      LitmatExt[Int64],
                    ),
                  ),
                ],
              )? raise {
                match x1073 {
                  (
                    ((i, _), v) as idx,
                    More(Litmat::Lit(lit_1), tail=Empty) as cla,
                  ) if lit_1 == hashek =>
                    @firstorder.op_gt_gt_eq(
                      @lib.op_bar_gt(
                        prove_clause_v1(
                          opt,
                          (sub0, 0L),
                          (
                            mati,
                            @list.List([]),
                            @list.List([(i, 0L)]),
                            @list.List([]),
                            lim,
                          ),
                          cla,
                        ),
                        next_opt,
                      ),
                      fn(
                        x1074 : (
                          (T1, Int64),
                          @list.List[
                            (
                              Litmat[(Int64, Int64)],
                              Proof1[
                                Litmat[(Int64, Int64)],
                                @list.List[Litmat[(Int64, Int64)]],
                                ((Int64, Int64), @list.List[Int64]),
                                (
                                  @list.List[
                                    ((Int64, @list.List[Int64]), Int64),
                                  ],
                                  (
                                    (Int64, @list.List[Int64]),
                                    (
                                      @list.List[
                                        (
                                          (Int64, @list.List[Int64]),
                                          @list.List[Litmat[Int64]],
                                        ),
                                      ],
                                      @list.List[
                                        (
                                          (Int64, @list.List[Int64]),
                                          @list.List[Litmat[Int64]],
                                        ),
                                      ],
                                    ),
                                    LitmatExt[Int64],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ) -> (
                        (T1, Int64),
                        Proof1[
                          Litmat[(Int64, Int64)],
                          @list.List[Litmat[(Int64, Int64)]],
                          ((Int64, Int64), @list.List[Int64]),
                          (
                            @list.List[((Int64, @list.List[Int64]), Int64)],
                            (
                              (Int64, @list.List[Int64]),
                              (
                                @list.List[
                                  (
                                    (Int64, @list.List[Int64]),
                                    @list.List[Litmat[Int64]],
                                  ),
                                ],
                                @list.List[
                                  (
                                    (Int64, @list.List[Int64]),
                                    @list.List[Litmat[Int64]],
                                  ),
                                ],
                              ),
                              LitmatExt[Int64],
                            ),
                          ),
                        ],
                      )? raise {
                        let (sub, prfs) = x1074
                        Some((sub, Proof1::Decomposition(cla, idx, prfs)))
                      },
                    )
                  _ => None
                }
              },
              x1075,
              x1076,
            )
          })(x1077, x1078)
        }
      }),
      next_opt,
    ),
    fn(
      x1079 : (
        (T1, Int64),
        Proof1[
          Litmat[(Int64, Int64)],
          @list.List[Litmat[(Int64, Int64)]],
          ((Int64, Int64), @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), Int64)],
            (
              (Int64, @list.List[Int64]),
              (
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
              ),
              LitmatExt[Int64],
            ),
          ),
        ],
      ),
    ) -> (
      T1,
      (
        Litmat[(Int64, Int64)],
        Proof1[
          Litmat[(Int64, Int64)],
          @list.List[Litmat[(Int64, Int64)]],
          ((Int64, Int64), @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), Int64)],
            (
              (Int64, @list.List[Int64]),
              (
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
              ),
              LitmatExt[Int64],
            ),
          ),
        ],
      ),
    )? raise {
      let (sub_1, prf) = x1079
      Some((sub_1.0, (Litmat::Mat(((-1L, 0L), mati)), prf)))
    },
  )
}

///|
/// `fol_of_thm`
pub fn fol_of_thm(x1080 : @kernel.Thm) -> @meson.FolForm raise {
  let th = x1080
  let lconsts = @kernel.freesl(@kernel.hyp(th))
  let tm = @kernel.concl(th)
  if @lib.forall(
      fn(x1081 : @kernel.Term) -> Bool raise {
        let x = x1081
        @lib.mem(x, lconsts)
      },
      @kernel.frees(tm),
    ) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1424:2")
  }
  @firstorder.fol_of_form(@list.List([]), lconsts, tm)
}

///|
/// `NANOCOP_DEEPEN`
pub fn nanocop_deepen(
  x1082 : SearchOpts,
  x1083 : @list.List[@kernel.Thm],
) -> @kernel.Thm raise {
  let opt = x1082
  let ths = x1083
  if @firstorder.copverb().val {
    {
      @pp.std_formatter.print_string("NANOCOP_DEEPEN with ths:\n")
      @pp.std_formatter.print_flush()
      ()
    }
    @lib.do_list(
      fn(x1085 : @kernel.Thm) -> Unit raise {
        ((x1084 : String) => {
          @pp.std_formatter.print_string("  th: " + x1084 + "\n")
          @pp.std_formatter.print_flush()
          ()
        })(@printer.string_of_thm(x1085))
      },
      ths,
    )
  } else {
    ()
  }
  @firstorder.reset_vars(())
  @firstorder.reset_consts(())
  let t1087 = create_eq_axs(opt.add_eq_symmetry)
  let gen_eq : (@list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise = fn(
    x1091 : @list.List[@kernel.Thm],
  ) -> @list.List[@kernel.Thm] raise {
    (fn(x1088 : @list.List[@kernel.Term]) -> @list.List[@kernel.Thm] raise {
      ((x1086 : @list.List[@kernel.Thm]) => @lib.map(@bool.gen_all, x1086))(
        t1087(x1088),
      )
    })(
      ((x1090 : @list.List[@kernel.Thm]) => {
        @lib.map(
          fn(x1089 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x1089) },
          x1090,
        )
      })(x1091),
    )
  }
  let ths_p = if @lib.exists(
      fn(x1092 : @kernel.Thm) -> Bool raise {
        let th = x1092
        @kernel.concl(th) == hashek_tm()
      },
      ths,
    ) {
    ths
  } else {
    ths.prepend(hashek_thm())
  }
  let ths_p_1 = @lib.setify(ths_p.concat(gen_eq(ths_p)))
  let th_1 = @lib.end_itlist(@bool.conj, ths_p_1)
  let fol = fol_of_thm(th_1)
  let mat_1 = index_matrix_v1(matrix_of_form(fol))
  if @firstorder.copverb().val {
    {
      @pp.std_formatter.print_string("Matrix:\n")
      @pp.std_formatter.print_flush()
      ()
    }
    print_matrix_i(mat_1)
  } else {
    ()
  }
  matrix2db(mat_1)
  if @firstorder.copverb().val {
    @pp.std_formatter.print_string("Matrix loaded.\n")
    @pp.std_formatter.print_flush()
    ()
  } else {
    ()
  }
  let (sub, prfs) = strategy(opt, fn(
    x1095 : SearchOpts,
  ) -> ((Int64) -> (
    T1,
    (
      Litmat[(Int64, Int64)],
      Proof1[
        Litmat[(Int64, Int64)],
        @list.List[Litmat[(Int64, Int64)]],
        ((Int64, Int64), @list.List[Int64]),
        (
          @list.List[((Int64, @list.List[Int64]), Int64)],
          (
            (Int64, @list.List[Int64]),
            (
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
              @list.List[
                ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
              ],
            ),
            LitmatExt[Int64],
          ),
        ),
      ],
    ),
  )? raise) raise {
    fn(
      x1096 : Int64,
    ) -> (
      T1,
      (
        Litmat[(Int64, Int64)],
        Proof1[
          Litmat[(Int64, Int64)],
          @list.List[Litmat[(Int64, Int64)]],
          ((Int64, Int64), @list.List[Int64]),
          (
            @list.List[((Int64, @list.List[Int64]), Int64)],
            (
              (Int64, @list.List[Int64]),
              (
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
                @list.List[
                  ((Int64, @list.List[Int64]), @list.List[Litmat[Int64]]),
                ],
              ),
              LitmatExt[Int64],
            ),
          ),
        ],
      ),
    )? raise {
      ((x1093 : SearchOpts, x1094 : Int64) => start_v1(mat_1, x1093, x1094))(
        x1095, x1096,
      )
    }
  })
  if @firstorder.copverb().val {
    {
      @pp.std_formatter.print_string("Theorem\n")
      @pp.std_formatter.print_flush()
      ()
    }
    print_proof_def(sub, prfs)
  } else {
    ()
  }
  let data = mk_recon_data(th_1, mat_1, sub)
  let bot = bot_of_proof(data, @list.List([]), th_1, prfs)
  if @firstorder.copverb().val {
    {
      @pp.std_formatter.print_string("Reconstruction:\n")
      @pp.std_formatter.print_flush()
      ()
    }
    @printer.print_thm(bot)
  } else {
    ()
  }
  let t1097 = @kernel.hyp(th_1)
  if @lib.set_eq(@kernel.hyp(bot), t1097) {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1456:2")
  }
  let t1098 = @term_syntax.parse_term("false")
  if @kernel.concl(bot) == t1098 {
    ()
  } else {
    raise @lib.AssertFailure("tscript.ml:1457:2")
  }
  bot
}

///|
/// `PRINT_TAC`
pub fn print_tac(
  x1099 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let g = x1099
  if @firstorder.copverb().val {
    @tactics.print_goal(g)
  } else {
    ()
  }
  @tactics.all_tac(g)
}

///|
/// `PRINT_ID_TAC`
pub fn print_id_tac(
  x1100 : String,
  x1101 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let s = x1100
  let g = x1101
  if @firstorder.copverb().val {
    @pp.print_string(s + "\n")
  } else {
    ()
  }
  print_tac(g)
}

///|
/// `PREPARE_NANOCOP_TAC`
pub fn prepare_nanocop_tac(
  x1102 : @list.List[@kernel.Thm],
) -> @tactics.Tactic raise {
  let ths = x1102
  let t1110 = @tactics.repeat_tac(
    @tactics.first_x_assum(@tactics.subst_var_tac),
  )
  let t1107 = @equal.depth_conv(
    @equal.changed_conv(@canon.assoc_conv(@theorems.conj_assoc())),
  )
  let t1109 = @tactics.rule_assum_tac((x1108 : @kernel.Thm) => {
    @equal.conv_rule(t1107, x1108)
  })
  let t1104 = @equal.depth_conv(
    @equal.changed_conv(@canon.assoc_conv(@theorems.disj_assoc())),
  )
  let t1106 = @tactics.rule_assum_tac((x1105 : @kernel.Thm) => {
    @equal.conv_rule(t1104, x1105)
  })
  @tactics.then_tac(
    @tactics.then_tac(@tactics.then_tac(prepare_cop_tac(ths), t1106), t1109),
    t1110,
  )
}

///|
/// `PURE_NANOCOP`
pub fn pure_nanocop(
  x1111 : SearchOpts,
  x1112 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
) -> @tactics.Goalstate raise {
  let opt = x1111
  let gl = x1112
  @tactics.orelse_tac(
    @tactics.first_assum(fn(
      x1113 : @kernel.Thm,
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
      let s1114 = @tactics.contr_tac(x1113)
      fn(
        x1115 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1114(x1115)
      }
    }),
    fn(
      x1126 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        x1125 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          x1123 : @list.List[(String, @kernel.Thm)],
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
            x1120 : @list.List[@kernel.Thm],
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
              x1116 : @kernel.Thm,
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
              let s1117 = @tactics.accept_tac(x1116)
              fn(
                x1118 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s1117(x1118)
              }
            })(
              ((x1119 : @list.List[@kernel.Thm]) => nanocop_deepen(opt, x1119))(
                x1120,
              ),
            )
          })(
            ((x1122 : @list.List[(String, @kernel.Thm)]) => {
              @lib.map(
                fn(x1121 : (String, @kernel.Thm)) -> @kernel.Thm raise {
                  x1121.1
                },
                x1122,
              )
            })(x1123),
          )
        })(
          (fn(
            x1124 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
          ) -> @list.List[(String, @kernel.Thm)] raise {
            x1124.0
          })(x1125),
        )
      })(x1126)(x1126)
    },
  )(gl)
}

///|
/// `GEN_NANOCOP_TAC`
pub fn gen_nanocop_tac(
  x1127 : SearchOpts,
  x1128 : @list.List[@kernel.Thm],
) -> @tactics.Tactic raise {
  let opt = x1127
  let ths = x1128
  @tactics.then_tac(prepare_nanocop_tac(ths), (
    x1130 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
  ) => pure_nanocop(opt, x1130))
}

///|
/// `NANOCOP_TAC`
pub fn nanocop_tac(x1131 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let ths = x1131
  gen_nanocop_tac(search_opts(), ths)
}

///|
/// `NANOCOP`
pub fn nanocop(
  x1133 : @list.List[@kernel.Thm],
  x1134 : @kernel.Term,
) -> @kernel.Thm raise {
  let ths = x1133
  let tm = x1134
  @tactics.prove(tm, nanocop_tac(ths))
}

///|
/// LEANCOP_TAC
fn step_21() -> Unit raise {
  leancop_tac_v1_c.set(leancop_tac)
}

///|
let leancop_tac_v1_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> @tactics.Tactic raise,
] = @lib.Cell::new("LEANCOP_TAC")

///|
/// `LEANCOP_TAC`
pub fn leancop_tac_v1(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  leancop_tac_v1_c.get()(x)
}

///|
/// LEANCOP
fn step_22() -> Unit raise {
  leancop_v1_c.set(fn(
    x1135 : @list.List[@kernel.Thm],
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x1136 : @kernel.Term) -> @kernel.Thm raise { leancop(x1135, x1136) }
  })
}

///|
let leancop_v1_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("LEANCOP")

///|
/// `LEANCOP`
pub fn leancop_v1(
  x : @list.List[@kernel.Thm],
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  leancop_v1_c.get()(x)
}

///|
/// NANOCOP_TAC
fn step_23() -> Unit raise {
  nanocop_tac_v1_c.set(nanocop_tac)
}

///|
let nanocop_tac_v1_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> @tactics.Tactic raise,
] = @lib.Cell::new("NANOCOP_TAC")

///|
/// `NANOCOP_TAC`
pub fn nanocop_tac_v1(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  nanocop_tac_v1_c.get()(x)
}

///|
/// NANOCOP
fn step_24() -> Unit raise {
  nanocop_v1_c.set(fn(
    x1137 : @list.List[@kernel.Thm],
  ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x1138 : @kernel.Term) -> @kernel.Thm raise { nanocop(x1137, x1138) }
  })
}

///|
let nanocop_v1_c : @lib.Cell[
  (@list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise,
] = @lib.Cell::new("NANOCOP")

///|
/// `NANOCOP`
pub fn nanocop_v1(
  x : @list.List[@kernel.Thm],
) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  nanocop_v1_c.get()(x)
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
}
