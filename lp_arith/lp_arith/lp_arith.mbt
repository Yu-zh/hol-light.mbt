// Translated from upstream LP_arith/lp_arith.ml; edit this file directly.

///|
/// cddwrapper
fn step_1() -> Unit raise {
  cddwrapper_c.set("cdd_cert")
}

///|
let cddwrapper_c : @lib.Cell[String] = @lib.Cell::new("cddwrapper")

///|
/// `cddwrapper`
pub fn cddwrapper() -> String {
  cddwrapper_c.get()
}

///|
/// lin_of_hol
fn step_2() -> Unit raise {
  let one_tm = @term_syntax.parse_term("real_of_num(1)")
  let zero_tm = @term_syntax.parse_term("real_of_num(0)")
  let add_tm = @term_syntax.parse_term("real_add")
  let mul_tm = @term_syntax.parse_term("real_mul")
  let lin_add : (@lib.Func[@kernel.Term, @num.Num]) -> ((@lib.Func[@kernel.Term, @num.Num]) -> @lib.Func[@kernel.Term, @num.Num] raise) raise = fn(x6 : @lib.Func[@kernel.Term, @num.Num]) -> ((@lib.Func[@kernel.Term, @num.Num]) -> @lib.Func[@kernel.Term, @num.Num] raise) raise {
    fn(x7 : @lib.Func[@kernel.Term, @num.Num]) -> @lib.Func[@kernel.Term, @num.Num] raise {
      ((x4 : @lib.Func[@kernel.Term, @num.Num], x5 : @lib.Func[@kernel.Term, @num.Num]) => @lib.combine(fn(x1 : @num.Num, x2 : @num.Num) -> @num.Num raise {
        @num.add_num(x1, x2)
      }, fn(x3 : @num.Num) -> Bool raise {
        let x = x3
        @num.eq_num(x, @num.num_0)
      }, x4, x5))(x6, x7)
    }
  }
  fn lin_of_hol_1(x8 : @kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise {
    let tm = x8
    if (tm == zero_tm) {
      @lib.undefined()
    } else {
      if !@kernel.is_comb(tm) {
        @lib.single(tm, @num.num_of_int64(1L))
      } else {
        if @calc_int.is_ratconst(tm) {
          @lib.single(one_tm, @calc_int.rat_of_term(tm))
        } else {
          let (lop, r) = @kernel.dest_comb(tm)
          if !@kernel.is_comb(lop) {
            @lib.single(tm, @num.num_of_int64(1L))
          } else {
            let (op, l) = @kernel.dest_comb(lop)
            if (op == add_tm) {
              let t9 = lin_of_hol_1(r)
              lin_add(lin_of_hol_1(l))(t9)
            } else {
              if ((op == mul_tm) && @calc_int.is_ratconst(l)) {
                @lib.single(r, @calc_int.rat_of_term(l))
              } else {
                @lib.single(tm, @num.num_of_int64(1L))
              }
            }
          }
        }
      }
    }
  }
  lin_of_hol_c.set(lin_of_hol_1)
}

///|
let lin_of_hol_c : @lib.Cell[(@kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise] = @lib.Cell::new("lin_of_hol")

///|
/// `lin_of_hol`
pub fn lin_of_hol(x : @kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise {
  (lin_of_hol_c.get())(x)
}

///|
/// `words`
pub fn words(x10 : String) -> @list.List[String] raise {
  let s = x10
  let stre = @lib.stream_of_string(s)
  fn sb(x12 : String, x13 : @lib.Stream[Char]) -> @list.List[String] raise {
    let acc = x12
    let st_1 = x13
    if is_empty_l(st_1) {
      @list.List([acc])
    } else {
      let t = @lib.stream_next(st_1)
      if (t == ' ') {
        sb("", st_1).prepend(acc)
      } else {
        sb((acc + @lib.char_escaped(t)), st_1)
      }
    }
  }
  @lib.filter(fn(x14 : String) -> Bool raise {
    let x = x14
    (x != "")
  }, sb("", stre))
}

///|
fn[TA] is_empty_l(x11 : @lib.Stream[TA]) -> Bool raise {
  let st = x11
  match @lib.stream_peek(st) {
    None => true
    Some(_) => false
  }
}

///|
/// `cdd`
pub fn cdd(x15 : String) -> String raise {
  let ins = x15
  let outfn = @lib.temp_file("cdd", ".res")
  let infn = @lib.temp_file("cdd", ".ine")
  let s = ("cat " + (infn + ("| " + (cddwrapper() + (" 2> /dev/null > " + outfn)))))
  let inch = @lib.open_out(infn)
  @lib.output_string(inch, ins)
  @lib.close_out(inch)
  if (Int::to_int64(@lib.sys_command(s)) != 0L) {
    raise Failure("cdd")
  } else {
    let fd = @lib.open_in(outfn)
    let data = @lib.input_line(fd)
    @lib.close_in(fd)
    @lib.sys_remove(infn)
    @lib.sys_remove(outfn)
    data
  }
}

///|
/// `take`
pub fn[TA] take(x16 : Int64, x17 : @list.List[TA]) -> @list.List[TA] raise {
  let n = x16
  let l = x17
  match l {
    More(x, tail=xs) => {
      if (n == 0L) {
        @list.List([])
      } else {
        take(@lib.sub63(n, 1L), xs).prepend(x)
      }
    }
    Empty => @list.List([])
  }
}

///|
/// `drop`
pub fn[TA] drop_(x18 : Int64, x19 : @list.List[TA]) -> @list.List[TA] raise {
  let n = x18
  let l = x19
  match l {
    More(x, tail=xs) => {
      if (n == 0L) {
        l
      } else {
        drop_(@lib.sub63(n, 1L), xs)
      }
    }
    Empty => @list.List([])
  }
}

///|
/// `lp_prover`
pub fn lp_prover(x20 : @list.List[@lib.Func[@kernel.Term, @num.Num]], x21 : @list.List[@lib.Func[@kernel.Term, @num.Num]], x22 : @list.List[@lib.Func[@kernel.Term, @num.Num]]) -> @realarith.Positivstellensatz raise {
  let (eq, le, lt) = (x20, x21, x22)
  let one_tm = @term_syntax.parse_term("real_of_num(1)")
  let vars = @lib.subtract(@lib.itlist(fn(x26 : @lib.Func[@kernel.Term, @num.Num], x27 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
    (fn(x23 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
      fn(x24 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
        @lib.union(x23, x24)
      }
    })((fn(x25 : @lib.Func[@kernel.Term, @num.Num]) -> @list.List[@kernel.Term] raise {
      @lib.dom(x25)
    })(x26))(x27)
  }, eq.concat(le.concat(lt)), @list.List([])), @list.List([one_tm]))
  let neq = Int::to_int64(@lib.length(eq))
  let nle = Int::to_int64(@lib.length(le))
  let nlt = Int::to_int64(@lib.length(lt))
  let nr = Int::to_int64(@lib.length(eq.concat(le.concat(lt))))
  let get_row : (@kernel.Term) -> @list.List[@num.Num] raise = fn(x28 : @kernel.Term) -> @list.List[@num.Num] raise {
    let v = x28
    @lib.map(fn(x29 : @lib.Func[@kernel.Term, @num.Num]) -> @num.Num raise {
      let x = x29
      @lib.applyd(x, fn(x30 : @kernel.Term) -> @num.Num raise {
        @num.num_0
      }, v)
    }, eq.concat(le.concat(lt)))
  }
  let one_at : (Int64) -> @list.List[@list.List[@num.Num]] raise = fn(x33 : Int64) -> @list.List[@list.List[@num.Num]] raise {
    let n_1 = x33
    @lib.map(fn(x34 : Int64) -> @list.List[@num.Num] raise {
      let i = x34
      let t35 = (@list.List([@num.num_1])).concat(rep_l(@lib.sub63(@lib.sub63(n_1, i), 1L), @num.num_0))
      rep_l(i, @num.num_0).concat(t35)
    }, @lib.range(0L, @lib.sub63(n_1, 1L)))
  }
  let main_rows = @lib.map(fn(x37 : @kernel.Term) -> @list.List[@num.Num] raise {
    (fn(x36 : @list.List[@num.Num]) -> @list.List[@num.Num] raise {
      let l = x36
      l.prepend(@num.num_0)
    })(get_row(x37))
  }, vars)
  let t38 = rep_l(Int::to_int64(@lib.length(lt)), @num.num_1)
  let t39 = rep_l(Int::to_int64(@lib.length(le)), @num.num_0).concat(t38)
  let t40 = rep_l(Int::to_int64(@lib.length(eq)), @num.num_0).concat(t39)
  let lt_row = (@list.List([@num.minus_num(@num.num_1)])).concat(t40)
  let pos_rows = @lib.map(fn(x41 : @list.List[@num.Num]) -> @list.List[@num.Num] raise {
    let l_1 = x41
    rep_l(@lib.add63(Int::to_int64(@lib.length(eq)), 1L), @num.num_0).concat(l_1)
  }, one_at(Int::to_int64(@lib.length(le.concat(lt)))))
  let bvec = get_row(one_tm).prepend(@num.num_0)
  let mat = main_rows.concat((@list.List([lt_row])).concat(pos_rows))
  let string_of_row : (@list.List[@num.Num]) -> String raise = fn(x45 : @list.List[@num.Num]) -> String raise {
    (fn(x42 : @list.List[String]) -> String raise {
      @lib.string_concat(" ", x42)
    })(((x44 : @list.List[@num.Num]) => @lib.map(fn(x43 : @num.Num) -> String raise {
      @num.string_of_num(x43)
    }, x44))(x45))
  }
  let t49 = @lib.string_concat(" ", @list.List(["minimize", string_of_row(bvec)]))
  let t50 = @lib.string_concat("\n", @lib.map(string_of_row, mat))
  let t48 = Int64::to_string(@lib.add63(nr, 1L))
  let t51 = @lib.string_concat(" ", @list.List([Int64::to_string(Int::to_int64(@lib.length(mat))), t48, "rational"]))
  let t47 = (" " + @lib.string_concat(" ", @lib.map(fn(x46 : Int64) -> String raise {
    Int64::to_string(x46)
  }, @lib.range(1L, Int::to_int64(@lib.length(main_rows))))))
  let cddlp = @lib.string_concat("\n", @list.List(["H-representation", ("linearity " + (Int64::to_string(Int::to_int64(@lib.length(main_rows))) + t47)), "begin", t51, t50, "end", t49]))
  let outp = cdd(cddlp)
  let res = if (outp == "No Contradiction") {
    raise Failure("No contradiction")
  } else {
    @lib.map(@num.nums_num_of_string, words(outp))
  }
  let t52 = take(nlt, drop_(@lib.add63(nle, neq), res))
  let t53 = take(nle, drop_(neq, res))
  let (req, rle, rlt) = (take(neq, res), t53, t52)
  let peq = @lib.map2(fn(x54 : @num.Num, x55 : Int64) -> @list.List[@realarith.Positivstellensatz] raise {
    let r = x54
    let e_1 = x55
    if @num.eq_num(r, @num.num_0) {
      @list.List([])
    } else {
      let t56 = @realarith.Positivstellensatz::Axiom_eq(e_1)
      @list.List([@realarith.Positivstellensatz::Eqmul(@calc_int.term_of_rat(r), t56)])
    }
  }, req, @lib.range(0L, @lib.sub63(neq, 1L)))
  let ple = @lib.map2(fn(x57 : @num.Num, x58 : Int64) -> @list.List[@realarith.Positivstellensatz] raise {
    let r_1 = x57
    let e_2 = x58
    if @num.eq_num(r_1, @num.num_0) {
      @list.List([])
    } else {
      let t59 = @realarith.Positivstellensatz::Axiom_le(e_2)
      @list.List([@realarith.Positivstellensatz::Product(@realarith.Positivstellensatz::Rational_lt(r_1), t59)])
    }
  }, rle, @lib.range(0L, @lib.sub63(nle, 1L)))
  let plt = @lib.map2(fn(x60 : @num.Num, x61 : Int64) -> @list.List[@realarith.Positivstellensatz] raise {
    let r_2 = x60
    let e_3 = x61
    if @num.eq_num(r_2, @num.num_0) {
      @list.List([])
    } else {
      let t62 = @realarith.Positivstellensatz::Axiom_lt(e_3)
      @list.List([@realarith.Positivstellensatz::Product(@realarith.Positivstellensatz::Rational_lt(r_2), t62)])
    }
  }, rlt, @lib.range(0L, @lib.sub63(nlt, 1L)))
  let pp = @lib.flat(peq.concat(ple.concat(plt)))
  let t65 = @lib.hd(pp)
  let refu = @lib.itlist(fn(x63 : @realarith.Positivstellensatz, x64 : @realarith.Positivstellensatz) -> @realarith.Positivstellensatz raise {
    let acc = x63
    let x_1 = x64
    @realarith.Positivstellensatz::Sum(acc, x_1)
  }, @lib.tl(pp), t65)
  refu
}

///|
fn[TA] rep_l(x31 : Int64, x32 : TA) -> @list.List[TA] raise {
  let n = x31
  let e = x32
  if (n == 0L) {
    @list.List([])
  } else {
    rep_l(@lib.sub63(n, 1L), e).prepend(e)
  }
}

///|
/// LP_PROVER
fn step_3() -> Unit raise {
  let is_alien : (@kernel.Term) -> Bool raise = fn(x66 : @kernel.Term) -> Bool raise {
    let tm = x66
    match tm {
      @kernel.Term::Comb(@kernel.Term::Const("real_of_num", _), n) if !@nums.is_numeral(n) => true
      _ => false
    }
  }
  let n_tm = @term_syntax.parse_term("(n : Num)")
  let t67 = @bool.spec(n_tm, @realarith.real_pos())
  let pth = @simp.rewrite_rule(@list.List([@equal.gsym(@realax.real_ge())]))(t67)
  lp_prover_v1_c.set(fn(x68 : ((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> ((@realarith.Positivstellensatz) -> @kernel.Thm raise) raise) -> (((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> @kernel.Thm raise) raise {
    let translator = x68
    fn(x69 : (@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> @kernel.Thm raise {
      let (eq, le, lt) = x69
      let eq_pols = @lib.map(fn(x72 : @kernel.Thm) -> @lib.Func[@kernel.Term, @num.Num] raise {
        (fn(x70 : @kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise {
          lin_of_hol(@equal.lhand(x70))
        })((fn(x71 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x71)
        })(x72))
      }, eq)
      let le_pols = @lib.map(fn(x75 : @kernel.Thm) -> @lib.Func[@kernel.Term, @num.Num] raise {
        (fn(x73 : @kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise {
          lin_of_hol(@equal.lhand(x73))
        })((fn(x74 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x74)
        })(x75))
      }, le)
      let lt_pols = @lib.map(fn(x78 : @kernel.Thm) -> @lib.Func[@kernel.Term, @num.Num] raise {
        (fn(x76 : @kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise {
          lin_of_hol(@equal.lhand(x76))
        })((fn(x77 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x77)
        })(x78))
      }, lt)
      let aliens = @lib.filter(is_alien, @lib.itlist(fn(x82 : @lib.Func[@kernel.Term, @num.Num], x83 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
        (fn(x79 : @list.List[@kernel.Term]) -> ((@list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise) raise {
          fn(x80 : @list.List[@kernel.Term]) -> @list.List[@kernel.Term] raise {
            @lib.union(x79, x80)
          }
        })((fn(x81 : @lib.Func[@kernel.Term, @num.Num]) -> @list.List[@kernel.Term] raise {
          @lib.dom(x81)
        })(x82))(x83)
      }, eq_pols.concat(le_pols.concat(lt_pols)), @list.List([])))
      let le_pols_p = le_pols.concat(@lib.map(fn(x84 : @kernel.Term) -> @lib.Func[@kernel.Term, @num.Num] raise {
        let v = x84
        @lib.single(v, @num.num_of_int64(1L))
      }, aliens))
      let proof = lp_prover(eq_pols, le_pols_p, lt_pols)
      let le_p = le.concat(@lib.map(fn(x85 : @kernel.Term) -> @kernel.Thm raise {
        let a = x85
        @kernel.inst_rule(@list.List([(@kernel.rand(a), n_tm)]), pth)
      }, aliens))
      translator((eq, le_p, lt))(proof)
    }
  })
}

///|
let lp_prover_v1_c : @lib.Cell[(((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> ((@realarith.Positivstellensatz) -> @kernel.Thm raise) raise) -> (((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> @kernel.Thm raise) raise] = @lib.Cell::new("LP_PROVER")

///|
/// `LP_PROVER`
pub fn lp_prover_v1(x : ((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> ((@realarith.Positivstellensatz) -> @kernel.Thm raise) raise) -> (((@list.List[@kernel.Thm], @list.List[@kernel.Thm], @list.List[@kernel.Thm])) -> @kernel.Thm raise) raise {
  (lp_prover_v1_c.get())(x)
}

///|
/// LP_ARITH
fn step_4() -> Unit raise {
  let init_ : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x86 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s87 = @equal.once_depth_conv(x86)
    fn(x88 : @kernel.Term) -> @kernel.Thm raise {
      s87(x88)
    }
  }, @list.List([@calc_rat.decimal()]))
  let pure_ : (@kernel.Term) -> @kernel.Thm raise = @calc_rat.gen_real_arith(lp_prover_v1)
  lp_arith_c.set(fn(x89 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x89
    let th = init_(tm)
    let t90 = pure_(@kernel.rand(@kernel.concl(th)))
    @kernel.eq_mp(@equal.sym(th), t90)
  })
}

///|
let lp_arith_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("LP_ARITH")

///|
/// `LP_ARITH`
pub fn lp_arith(x : @kernel.Term) -> @kernel.Thm raise {
  (lp_arith_c.get())(x)
}

///|
/// LP_ARITH_TAC
fn step_5() -> Unit raise {
  lp_arith_tac_c.set(@tactics.conv_tac(lp_arith))
}

///|
let lp_arith_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("LP_ARITH_TAC")

///|
/// `LP_ARITH_TAC`
pub fn lp_arith_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (lp_arith_tac_c.get())(x)
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
}
