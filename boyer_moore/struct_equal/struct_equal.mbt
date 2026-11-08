// Translated from upstream Boyer_Moore/struct_equal.ml; edit this file directly.

///|
/// subst_occs
fn step_1() -> Unit raise {
  fn subst_occs_1(x1 : @list.List[(@list.List[Int64], (@kernel.Term, @kernel.Term))], x2 : @kernel.Term) -> ((@kernel.Term, @list.List[(@list.List[Int64], (@kernel.Term, @kernel.Term))])) raise {
    let slist = x1
    let tm = x2
    let (applic, noway) = @lib.partition(fn(x3 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> Bool raise {
      let (i, (t, x)) = x3
      @basics.aconv(tm, x)
    }, slist)
    let sposs = @lib.map(fn(x4 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> ((@list.List[Int64], (@kernel.Term, @kernel.Term)), (@list.List[Int64], (@kernel.Term, @kernel.Term))) raise {
      let (l, z) = x4
      let (l1, l2) = @lib.partition(fn(x5 : Int64) -> Bool raise {
        (1L == x5)
      }, l)
      ((l1, z), (l2, z))
    }, applic)
    let (racts, rrest) = @lib.unzip(sposs)
    let acts = @lib.filter(fn(x6 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> Bool raise {
      let t_1 = x6
      !@list.List::is_empty(t_1.0)
    }, racts)
    let trest = @lib.map(fn(x7 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> (@list.List[Int64], (@kernel.Term, @kernel.Term)) raise {
      let (n, t_2) = x7
      (@lib.map(fn(x10 : Int64) -> Int64 raise {
        (fn(x8 : Int64) -> ((Int64) -> Int64 raise) raise {
          fn(x9 : Int64) -> Int64 raise {
            @lib.sub63(x8, x9)
          }
        })(x10)(1L)
      }, n), t_2)
    }, rrest)
    let urest = @lib.filter(fn(x11 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> Bool raise {
      let t_3 = x11
      !@list.List::is_empty(t_3.0)
    }, trest)
    let tlist = urest.concat(noway)
    if @list.List::is_empty(acts) {
      if @kernel.is_comb(tm) {
        let (l_1, r) = @kernel.dest_comb(tm)
        let (l_p, s_p) = subst_occs_1(tlist, l_1)
        let (r_p, s_p_p) = subst_occs_1(s_p, r)
        (@kernel.mk_comb(l_p, r_p), s_p_p)
      } else {
        if @kernel.is_abs(tm) {
          let (bv, bod) = @kernel.dest_abs(tm)
          let gv = @basics.genvar(@kernel.type_of(bv))
          let nbod = @kernel.vsubst(@list.List([(gv, bv)]), bod)
          let (tm_p, s_p_1) = subst_occs_1(tlist, nbod)
          (@basics.alpha(bv, @kernel.mk_abs(gv, tm_p)), s_p_1)
        } else {
          (tm, tlist)
        }
      }
    } else {
      let tm_p_1 = (fn(x12 : (@list.List[Int64], (@kernel.Term, @kernel.Term))) -> @kernel.Term raise {
        let (n_1, (t_4, x_1)) = x12
        @basics.subst(@list.List([(t_4, x_1)]), tm)
      })(@lib.hd(acts))
      (tm_p_1, tlist)
    }
  }
  subst_occs_c.set(fn(x13 : @list.List[@list.List[Int64]]) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise) raise {
    let ilist = x13
    fn(x14 : @list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
      let slist_1 = x14
      fn(x15 : @kernel.Term) -> @kernel.Term raise {
        let tm_1 = x15
        subst_occs_1(@lib.zip(ilist, slist_1), tm_1).0
      }
    }
  })
}

///|
let subst_occs_c : @lib.Cell[(@list.List[@list.List[Int64]]) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise) raise] = @lib.Cell::new("subst_occs")

///|
/// `subst_occs`
pub fn subst_occs(x : @list.List[@list.List[Int64]]) -> ((@list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise) raise {
  (subst_occs_c.get())(x)
}

///|
/// `GSUBS`
pub fn gsubs(x16 : (@list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Term) -> @kernel.Term raise) raise, x17 : @list.List[@kernel.Thm], x18 : @kernel.Thm) -> @kernel.Thm raise {
  let substfn = x16
  let ths = x17
  let th = x18
  let ls = @lib.map(fn(x20 : @kernel.Thm) -> @kernel.Term raise {
    @equal.lhs((fn(x19 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x19)
    })(x20))
  }, ths)
  let vars = @lib.map(fn(x23 : @kernel.Term) -> @kernel.Term raise {
    (fn(x21 : @kernel.HolType) -> @kernel.Term raise {
      @basics.genvar(x21)
    })((fn(x22 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x22)
    })(x23))
  }, ls)
  let t24 = @kernel.concl(th)
  let w = substfn(@lib.list_combine(ls, vars))(t24)
  @support.subst(@lib.list_combine(ths, vars), w, th)
}

///|
/// `SUBS_OCCS`
pub fn subs_occs(x25 : @list.List[(@list.List[Int64], @kernel.Thm)], x26 : @kernel.Thm) -> @kernel.Thm raise {
  let nlths = x25
  let th = x26
  try {
    let (nll, ths) = @lib.unzip(nlths)
    gsubs(subst_occs(nll), ths, th)
  } catch {
    Failure(_) => raise Failure("SUBS_OCCS")
    e => raise e
  }
}

///|
/// VAR_NOT_EQ_STRUCT_OF_VAR_CONV
fn step_2() -> Unit raise {
  var_not_eq_struct_of_var_conv_c.set(try {
    let name : (@kernel.Term) -> String raise = fn(x33 : @kernel.Term) -> String raise {
      (fn(x32 : (String, @kernel.HolType)) -> String raise {
        x32.0
      })(@kernel.dest_const(x33))
    }
    fn generalise(x56 : @kernel.Term, x57 : @list.List[Int64]) -> ((@kernel.Term, @list.List[(@kernel.Term, @kernel.Term)])) raise {
      let (st_2, occ) = (x56, x57)
      fn replace_side_structs(x58 : (Int64, @kernel.Term, @list.List[(@kernel.Term, @kernel.Term)]), x59 : Int64, x60 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term], @list.List[(@kernel.Term, @kernel.Term)])) raise {
        let (n_3, argn_p, binding) = x58
        let m = x59
        let args_1 = x60
        if @list.List::is_empty(args_1) {
          (@list.List([]), @list.List([]))
        } else {
          let m_p = @lib.add63(m, 1L)
          let arg_1 = @lib.hd(args_1)
          let (rest, bind) = replace_side_structs((n_3, argn_p, binding), m_p, @lib.tl(args_1))
          if (m_p == n_3) {
            (rest.prepend(argn_p), binding.concat(bind))
          } else {
            if @kernel.is_var(arg_1) {
              (rest.prepend(arg_1), bind.prepend((arg_1, arg_1)))
            } else {
              let var_ = @basics.genvar(@kernel.type_of(arg_1))
              (rest.prepend(var_), bind.prepend((var_, arg_1)))
            }
          }
        }
      }
      if @list.List::is_empty(occ) {
        (st_2, @list.List([]))
      } else {
        let (f_1, args_2) = @basics.strip_comb(st_2)
        match occ {
          More(n_4, tail=occ_p) => {
            let (argn_p_1, binding_1) = generalise(@lib.el(@lib.int63_to_int(@lib.sub63(n_4, 1L)), args_2), occ_p)
            let (args_p, bind_1) = replace_side_structs((n_4, argn_p_1, binding_1), 0L, args_2)
            (@basics.list_mk_comb(f_1, args_p), bind_1)
          }
          _ => raise @lib.MatchFailure("tscript.ml:171")
        }
      }
    }
    fn constr_apps(x61 : @kernel.Term, x62 : (@kernel.Term, @list.List[Int64])) -> @list.List[@kernel.Term] raise {
      let v_2 = x61
      let (st_3, occ_1) = x62
      if @list.List::is_empty(occ_1) {
        @list.List([])
      } else {
        let (f_2, args_4) = @basics.strip_comb(st_3)
        match occ_1 {
          More(n_6, tail=occ_p_1) => {
            let args_p_1 = replace_argn_l((n_6, v_2), 0L, args_4)
            let t67 = constr_apps(v_2, (@lib.el(@lib.int63_to_int(@lib.sub63(n_6, 1L)), args_4), occ_p_1))
            t67.prepend(@basics.list_mk_comb(f_2, args_p_1))
          }
          _ => raise @lib.MatchFailure("tscript.ml:187")
        }
      }
    }
    let two_constrs : (@kernel.Thm) -> (@kernel.Term, @kernel.Term) raise = fn(x87 : @kernel.Thm) -> (@kernel.Term, @kernel.Term) raise {
      (fn(x85 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
        (fn(x83 : (@list.List[@kernel.Term], @kernel.Term)) -> (@kernel.Term, @kernel.Term) raise {
          (fn(x81 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
            (fn(x80 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
              ((x79 : (@kernel.Term, @kernel.Term)) => @support.hash(fn(x75 : @kernel.Term) -> @kernel.Term raise {
                (fn(x73 : (@kernel.Term, @list.List[@kernel.Term])) -> @kernel.Term raise {
                  x73.0
                })((fn(x74 : @kernel.Term) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
                  @basics.strip_comb(x74)
                })(x75))
              }, fn(x78 : @kernel.Term) -> @kernel.Term raise {
                (fn(x76 : (@kernel.Term, @list.List[@kernel.Term])) -> @kernel.Term raise {
                  x76.0
                })((fn(x77 : @kernel.Term) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
                  @basics.strip_comb(x77)
                })(x78))
              }, x79))(@kernel.dest_eq(x80))
            })(@basics.dest_neg(x81))
          })((fn(x82 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
            x82.1
          })(x83))
        })((fn(x84 : @kernel.Term) -> (@list.List[@kernel.Term], @kernel.Term) raise {
          @basics.strip_forall(x84)
        })(x85))
      })((fn(x86 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x86)
      })(x87))
    }
    let depth_sym : (@kernel.Thm) -> @kernel.Thm raise = fn(x91 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x90 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.gen_all(@support.not_eq_sym(x90))
      })(@bool.spec_all(x91))
    }
    fn arg_types(x92 : @kernel.HolType) -> @list.List[@kernel.HolType] raise {
      let ty = x92
      try {
        match @kernel.dest_type(ty) {
          ("fun", More(argty, tail=More(rest_1, tail=Empty))) => arg_types(rest_1).prepend(argty)
          _ => @list.List([])
        }
      } catch {
        Failure(_) => @list.List([])
        e => raise e
      }
    }
    let name_and_args : (@kernel.Term) -> (String, @list.List[@kernel.HolType]) raise = fn(x95 : @kernel.Term) -> (String, @list.List[@kernel.HolType]) raise {
      ((x94 : (String, @kernel.HolType)) => @support.hash(fn(x93 : String) -> String raise {
        x93
      }, arg_types, x94))(@kernel.dest_const(x95))
    }
    fn(x96 : (@kernel.Thm, @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let (induction, distincts, oneones) = x96
      let half_distincts = @lib.map(fn(x98 : @kernel.Thm) -> ((String, String), @kernel.Thm) raise {
        let th = x98
        (@support.hash(name, name, two_constrs(th)), th)
      }, distincts)
      let distincts_1 = half_distincts.concat(@lib.map((x100 : ((String, String), @kernel.Thm)) => @support.hash(fn(x99 : (String, String)) -> (String, String) raise {
        flip_l(x99.0, x99.1)
      }, depth_sym, x100), half_distincts))
      let ind_goals = (fn(x107 : @kernel.Term) -> @list.List[@kernel.Term] raise {
        (fn(x106 : (@kernel.Term, @kernel.Term)) -> @list.List[@kernel.Term] raise {
          (fn(x104 : @kernel.Term) -> @list.List[@kernel.Term] raise {
            (fn(x103 : (@kernel.Term, @kernel.Term)) -> @list.List[@kernel.Term] raise {
              (fn(x101 : @kernel.Term) -> @list.List[@kernel.Term] raise {
                @basics.conjuncts(x101)
              })((fn(x102 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
                x102.0
              })(x103))
            })(@basics.dest_imp(x104))
          })((fn(x105 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x105.1
          })(x106))
        })(@basics.dest_forall(x107))
      })((fn(x108 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x108)
      })(induction))
      let constrs_1 = @lib.map(fn(x125 : @kernel.Term) -> (String, @list.List[@kernel.HolType]) raise {
        (fn(x123 : (@list.List[@kernel.Term], @kernel.Term)) -> (String, @list.List[@kernel.HolType]) raise {
          (fn(x121 : @kernel.Term) -> (String, @list.List[@kernel.HolType]) raise {
            (fn(x119 : (@list.List[@kernel.Term], @kernel.Term)) -> (String, @list.List[@kernel.HolType]) raise {
              (fn(x117 : @kernel.Term) -> (String, @list.List[@kernel.HolType]) raise {
                (fn(x115 : (@list.List[@kernel.Term], @kernel.Term)) -> (String, @list.List[@kernel.HolType]) raise {
                  (fn(x113 : @kernel.Term) -> (String, @list.List[@kernel.HolType]) raise {
                    (fn(x112 : @kernel.Term) -> (String, @list.List[@kernel.HolType]) raise {
                      (fn(x110 : (@kernel.Term, @list.List[@kernel.Term])) -> (String, @list.List[@kernel.HolType]) raise {
                        name_and_args((fn(x109 : (@kernel.Term, @list.List[@kernel.Term])) -> @kernel.Term raise {
                          x109.0
                        })(x110))
                      })((fn(x111 : @kernel.Term) -> (@kernel.Term, @list.List[@kernel.Term]) raise {
                        @basics.strip_comb(x111)
                      })(x112))
                    })(@kernel.rand(x113))
                  })((fn(x114 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
                    x114.1
                  })(x115))
                })((fn(x116 : @kernel.Term) -> (@list.List[@kernel.Term], @kernel.Term) raise {
                  @basics.strip_forall(x116)
                })(x117))
              })((fn(x118 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
                x118.1
              })(x119))
            })(((x120 : @kernel.Term) => @lib.splitlist(@basics.dest_imp, x120))(x121))
          })((fn(x122 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
            x122.1
          })(x123))
        })((fn(x124 : @kernel.Term) -> (@list.List[@kernel.Term], @kernel.Term) raise {
          @basics.strip_forall(x124)
        })(x125))
      }, ind_goals)
      fn(x126 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x126
        let (l_6, r) = @kernel.dest_eq(@basics.dest_neg(tm))
        let (flipped, v_3, st_4) = if @kernel.is_var(l_6) {
          if @kernel.is_var(r) {
            raise Failure("")
          } else {
            (false, l_6, r)
          }
        } else {
          if @kernel.is_var(r) {
            (true, r, l_6)
          } else {
            raise Failure("")
          }
        }
        let occ_2 = min_length_l(((x34, x35, x36) => occurrences_l(name, x34, x35, x36))(constrs_1, v_3, st_4))
        let (st_p, bind_2) = generalise(st_4, occ_2)
        let (vars, subterms) = @lib.list_split(bind_2)
        let apps = constr_apps(v_3, (st_p, occ_2))
        let rotats = @lib.map((x129 : @list.List[@kernel.Term]) => @lib.end_itlist(fn(x127 : @kernel.Term, x128 : @kernel.Term) -> @kernel.Term raise {
          let t1 = x127
          let t2 = x128
          @basics.subst(@list.List([(t2, v_3)]), t1)
        }, x129), rotations_l(apps))
        let uneqs = @lib.map(fn(x132 : @kernel.Term) -> @kernel.Term raise {
          @bool.mk_neg(((x131 : @kernel.Term) => @lib.curry(fn(x130 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            @basics.mk_eq(x130.0, x130.1)
          }, v_3, x131))(x132))
        }, rotats)
        let conj = @bool.mk_forall(v_3, @bool.list_mk_conj(@lib.map((x134 : @kernel.Term) => @lib.curry(fn(x133 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
          @bool.list_mk_forall(x133.0, x133.1)
        }, vars, x134), uneqs)))
        let t136 = @simp.asm_rewrite_tac(oneones.concat(@lib.map(fn(x135 : ((String, String), @kernel.Thm)) -> @kernel.Thm raise {
          x135.1
        }, distincts_1)))
        let th1 = @tactics.prove(conj, @tactics.then_tac(@support.induct_tac_(induction), t136))
        let th2 = (fn(x137 : @kernel.Thm) -> @kernel.Thm raise {
          @lib.hd(@bool.conjuncts_rule(x137))
        })(((x138 : @kernel.Thm) => @bool.spec(v_3, x138))(th1))
        let th3 = @bool.specl(subterms, th2)
        let th4 = if flipped {
          @support.not_eq_sym(th3)
        } else {
          th3
        }
        @bool.eqt_intro(@equal.conv_rule(fn(x141 : @kernel.Term) -> @kernel.Thm raise {
          (fn(x139 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            fn(x140 : @kernel.Term) -> @kernel.Thm raise {
              @equal.alpha_rule(x139, x140)
            }
          })(x141)(tm)
        }, th4))
      }
    }
  } catch {
    Failure(_) => raise Failure("VAR_NOT_EQ_STRUCT_OF_VAR_CONV")
    e => raise e
  })
}

///|
let var_not_eq_struct_of_var_conv_c : @lib.Cell[((@kernel.Thm, @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("VAR_NOT_EQ_STRUCT_OF_VAR_CONV")

///|
/// `VAR_NOT_EQ_STRUCT_OF_VAR_CONV`
pub fn var_not_eq_struct_of_var_conv(x : (@kernel.Thm, @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (var_not_eq_struct_of_var_conv_c.get())(x)
}

///|
fn[TB] number_list_p_l(x28 : Int64, x29 : @list.List[TB]) -> @list.List[(TB, Int64)] raise {
  let n = x28
  let l_1 = x29
  if @list.List::is_empty(l_1) {
    @list.List([])
  } else {
    let t30 = @lib.tl(l_1)
    let t31 = number_list_p_l(@lib.add63(n, 1L), t30)
    t31.prepend((@lib.hd(l_1), n))
  }
}

///|
fn[TA] number_list_l(x27 : @list.List[TA]) -> @list.List[(TA, Int64)] raise {
  let l = x27
  number_list_p_l(1L, l)
}

///|
fn[TC] occurrences_l(name : (@kernel.Term) -> String raise, x34 : @list.List[(String, TC)], x35 : @kernel.Term, x36 : @kernel.Term) -> @list.List[@list.List[Int64]] raise {
  let constrs = x34
  let v = x35
  let st = x36
  fn occurrences_p(x37 : @kernel.Term, x38 : @kernel.Term, x39 : @list.List[Int64]) -> @list.List[@list.List[Int64]] raise {
    let v_1 = x37
    let st_1 = x38
    let path = x39
    let t40 = @kernel.type_of(v_1)
    if !((@kernel.type_of(st_1) == t40)) {
      @list.List([])
    } else {
      if (st_1 == v_1) {
        @list.List([@lib.rev(path)])
      } else {
        if @kernel.is_var(st_1) {
          @list.List([])
        } else {
          let (f, args) = @lib.check(fn(x47 : (@kernel.Term, @list.List[@kernel.Term])) -> Bool raise {
            (fn(x45 : @kernel.Term) -> Bool raise {
              ((x44 : String) => @lib.can(fn(x43 : String) -> TC raise {
                (fn(x41 : String) -> ((@list.List[(String, TC)]) -> TC raise) raise {
                  fn(x42 : @list.List[(String, TC)]) -> TC raise {
                    @lib.assoc(x41, x42)
                  }
                })(x43)(constrs)
              }, x44))(name(x45))
            })((fn(x46 : (@kernel.Term, @list.List[@kernel.Term])) -> @kernel.Term raise {
              x46.0
            })(x47))
          }, @basics.strip_comb(st_1))
          @lib.flat(@lib.map(fn(x48 : (@kernel.Term, Int64)) -> @list.List[@list.List[Int64]] raise {
            let (arg, n_1) = x48
            occurrences_p(v_1, arg, path.prepend(n_1))
          }, number_list_l(args)))
        }
      }
    }
  }
  occurrences_p(v, st, @list.List([]))
}

///|
fn[TE] min_length_p_l(x50 : (@list.List[TE], Int64), x51 : @list.List[@list.List[TE]]) -> @list.List[TE] raise {
  let (x, n_2) = x50
  let l_3 = x51
  if @list.List::is_empty(l_3) {
    x
  } else {
    if (Int::to_int64(@lib.length(@lib.hd(l_3))) < n_2) {
      let t53 = @lib.tl(l_3)
      let t52 = Int::to_int64(@lib.length(@lib.hd(l_3)))
      min_length_p_l((@lib.hd(l_3), t52), t53)
    } else {
      min_length_p_l((x, n_2), @lib.tl(l_3))
    }
  }
}

///|
fn[TD] min_length_l(x49 : @list.List[@list.List[TD]]) -> @list.List[TD] raise {
  let l_2 = x49
  if @list.List::is_empty(l_2) {
    raise Failure("min_length")
  } else {
    let t55 = @lib.tl(l_2)
    let t54 = Int::to_int64(@lib.length(@lib.hd(l_2)))
    min_length_p_l((@lib.hd(l_2), t54), t55)
  }
}

///|
fn[TF] replace_argn_l(x63 : (Int64, TF), x64 : Int64, x65 : @list.List[TF]) -> @list.List[TF] raise {
  let (n_5, argn_p_2) = x63
  let m_1 = x64
  let args_3 = x65
  if @list.List::is_empty(args_3) {
    @list.List([])
  } else {
    let m_p_1 = @lib.add63(m_1, 1L)
    if (m_p_1 == n_5) {
      @lib.tl(args_3).prepend(argn_p_2)
    } else {
      let t66 = replace_argn_l((n_5, argn_p_2), m_p_1, @lib.tl(args_3))
      t66.prepend(@lib.hd(args_3))
    }
  }
}

///|
fn[TH] rotations_p_l(x69 : @list.List[TH], x70 : Int64) -> @list.List[@list.List[TH]] raise {
  let l_5 = x69
  let n_7 = x70
  if (n_7 < 1L) {
    @list.List([])
  } else {
    let t72 = @lib.sub63(n_7, 1L)
    let t71 = @list.List([@lib.hd(l_5)])
    rotations_p_l(@lib.tl(l_5).concat(t71), t72).prepend(l_5)
  }
}

///|
fn[TG] rotations_l(x68 : @list.List[TG]) -> @list.List[@list.List[TG]] raise {
  let l_4 = x68
  rotations_p_l(l_4, Int::to_int64(@lib.length(l_4)))
}

///|
fn[TI, TJ] flip_l(x88 : TJ, x89 : TI) -> ((TI, TJ)) raise {
  let (x_1, y) = (x88, x89)
  (y, x_1)
}

///|
/// CONJS_CONV
fn step_3() -> Unit raise {
  conjs_conv_c.set(try {
    let is_ : (String) -> ((@kernel.Thm) -> Bool raise) raise = fn(x142 : String) -> ((@kernel.Thm) -> Bool raise) raise {
      let st = x142
      fn(x143 : @kernel.Thm) -> Bool raise {
        let th = x143
        try {
          (@kernel.dest_const(@kernel.rand(@kernel.concl(th))).0 == st)
        } catch {
          Failure(_) => false
          e => raise e
        }
      }
    }
    let v1 = @basics.genvar(@parser.parse_type("bool"))
    let v2 = @basics.genvar(@parser.parse_type("bool"))
    let th1 = @kernel.assume_rule(@basics.mk_eq(v1, @term_syntax.parse_term("false")))
    let cnj = @bool.mk_conj(v1, v2)
    let th1_1 = @bool.disch(cnj, @kernel.eq_mp(th1, @bool.conjunct1(@kernel.assume_rule(cnj))))
    let t144 = @bool.contr(cnj, @kernel.assume_rule(@term_syntax.parse_term("false")))
    let th2 = @bool.disch(@term_syntax.parse_term("false"), t144)
    let t145 = @bool.imp_antisym_rule(th1_1, th2)
    let fthm1 = @bool.disch(@basics.mk_eq(v1, @term_syntax.parse_term("false")), t145)
    let fthm2 = @equal.conv_rule(@equal.once_depth_conv(@simp.rewr_conv(@theorems.conj_sym())), fthm1)
    let fandr : (@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x146 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let th_1 = x146
      fn(x147 : @kernel.Term) -> @kernel.Thm raise {
        let tm = x147
        @bool.mp(@kernel.inst_rule(@list.List([(@equal.lhs(@kernel.concl(th_1)), v1), (tm, v2)]), fthm1), th_1)
      }
    }
    let fandl : (@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x148 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let th_2 = x148
      fn(x149 : @kernel.Term) -> @kernel.Thm raise {
        let tm_1 = x149
        @bool.mp(@kernel.inst_rule(@list.List([(@equal.lhs(@kernel.concl(th_2)), v1), (tm_1, v2)]), fthm2), th_2)
      }
    }
    let th1_2 = @kernel.assume_rule(@basics.mk_eq(v1, @term_syntax.parse_term("true")))
    let th2_1 = subs_occs(@list.List([(@list.List([2L]), th1_2)]), @kernel.refl(@bool.mk_conj(v1, v2)))
    let t150 = @simp.once_rewrite_rule(@list.List([]))(th2_1)
    let tthm1 = @bool.disch(@basics.mk_eq(v1, @term_syntax.parse_term("true")), t150)
    let tthm2 = @equal.conv_rule(@equal.once_depth_conv(@simp.rewr_conv(@theorems.conj_sym())), tthm1)
    let tandr : (@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x151 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let th_3 = x151
      fn(x152 : @kernel.Term) -> @kernel.Thm raise {
        let tm_2 = x152
        @bool.mp(@kernel.inst_rule(@list.List([(@equal.lhs(@kernel.concl(th_3)), v1), (tm_2, v2)]), tthm1), th_3)
      }
    }
    let tandl : (@kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise = fn(x153 : @kernel.Thm) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let th_4 = x153
      fn(x154 : @kernel.Term) -> @kernel.Thm raise {
        let tm_3 = x154
        @bool.mp(@kernel.inst_rule(@list.List([(@equal.lhs(@kernel.concl(th_4)), v1), (tm_3, v2)]), tthm2), th_4)
      }
    }
    fn cconv(x155 : (@kernel.Term) -> @kernel.Thm raise, x156 : @kernel.Term) -> @kernel.Thm raise {
      let conv = x155
      let tm_4 = x156
      let (c, cs) = @basics.dest_conj(tm_4)
      let cth = conv(c)
      if is_("F")(cth) {
        fandr(cth)(cs)
      } else {
        let csth = cconv(conv, cs)
        if is_("F")(csth) {
          fandl(csth)(c)
        } else {
          if is_("T")(cth) {
            @kernel.trans(tandr(cth)(cs), csth)
          } else {
            if is_("T")(csth) {
              @kernel.trans(tandl(csth)(c), cth)
            } else {
              try {
                @kernel.mk_comb_rule(@equal.ap_term(@term_syntax.parse_term("op_slash_bslash"), cth), csth)
              } catch {
                Failure(_) => conv(tm_4)
                e => raise e
              }
            }
          }
        }
      }
    }
    fn(x157 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let conv_1 = x157
      fn(x158 : @kernel.Term) -> @kernel.Thm raise {
        let tm_5 = x158
        cconv(conv_1, tm_5)
      }
    }
  } catch {
    Failure(_) => raise Failure("CONJS_CONV")
    e => raise e
  })
}

///|
let conjs_conv_c : @lib.Cell[((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("CONJS_CONV")

///|
/// `CONJS_CONV`
pub fn conjs_conv(x : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (conjs_conv_c.get())(x)
}

///|
/// `ONE_STEP_RECTY_EQ_CONV`
pub fn one_step_recty_eq_conv(x159 : @kernel.Thm, x160 : @list.List[@kernel.Thm], x161 : @list.List[@kernel.Thm]) -> (((@kernel.Term) -> @kernel.Thm raise) -> @equal.Conv raise) raise {
  let (induction, distincts, oneones) = (x159, x160, x161)
  let t164 = var_not_eq_struct_of_var_conv((induction, distincts, oneones))
  let not_eq_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x166 : @kernel.Term) -> @kernel.Thm raise {
    (fn(x165 : @kernel.Term) -> @kernel.Thm raise {
      (fn(x163 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.eqf_intro(@bool.eqt_elim(x163))
      })(t164(x165))
    })(@bool.mk_neg(x166))
  }
  let inj_rew : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x167 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x167
  }, oneones)
  let ths1 = @lib.map(@bool.spec_all, distincts)
  let ths2 = @lib.map(fn(x169 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x168 : @kernel.Thm) -> @kernel.Thm raise {
      @bool.gen_all(@bool.eqf_intro(x168))
    })(@support.not_eq_sym(x169))
  }, ths1)
  let dths = ths2.concat(@lib.map(fn(x170 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.gen_all(@bool.eqf_intro(x170))
  }, ths1))
  let dist_rew : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x171 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x171
  }, dths)
  fn(x172 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let conv = x172
    let t174 = @equal.thenc(inj_rew, conjs_conv(conv))
    @equal.orelsec(@equal.orelsec(@equal.orelsec(not_eq_conv, dist_rew), t174), fn(x175 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x175
      raise Failure("ONE_STEP_RECTY_EQ_CONV")
    })
  }
}

///|
/// `RECTY_EQ_CONV`
pub fn recty_eq_conv(x176 : @kernel.Thm, x177 : @list.List[@kernel.Thm], x178 : @list.List[@kernel.Thm]) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  let (induction, distincts, oneones) = (x176, x177, x178)
  try {
    let one_step_conv : ((@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise = one_step_recty_eq_conv(induction, distincts, oneones)
    let refl_conv : (@kernel.Term) -> @kernel.Thm raise = fn(x180 : @kernel.Term) -> @kernel.Thm raise {
      let tm = x180
      let (l, r) = @kernel.dest_eq(tm)
      if (l == r) {
        @bool.eqt_intro(@kernel.refl(l))
      } else {
        raise Failure("REFL_CONV")
      }
    }
    fn conv(x181 : @kernel.Term) -> @kernel.Thm raise {
      let tm_1 = x181
      @equal.orelsec(@equal.orelsec(one_step_conv(conv), refl_conv), @equal.all_conv)(tm_1)
    }
    fn(x182 : @kernel.Term) -> @kernel.Thm raise {
      let tm_2 = x182
      conv(tm_2)
    }
  } catch {
    Failure(_) => raise Failure("RECTY_EQ_CONV")
    e => raise e
  }
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
}
