// Translated from upstream Boyer_Moore/counterexample.ml; edit this file directly.

///|
/// counter_check_num
fn step_1() -> Unit raise {
  counter_check_num_c.set(Ref::{ val: 500L })
}

///|
let counter_check_num_c : @lib.Cell[Ref[Int64]] = @lib.Cell::new("counter_check_num")

///|
/// `counter_check_num`
pub fn counter_check_num() -> Ref[Int64] {
  counter_check_num_c.get()
}

///|
/// `counter_checks`
pub fn counter_checks(x1 : Int64) -> Unit raise {
  let t = x1
  {
    counter_check_num().val = t
    ()
  }
}

///|
/// counterexamples
fn step_2() -> Unit raise {
  counterexamples_c.set(Ref::{ val: 0L })
}

///|
let counterexamples_c : @lib.Cell[Ref[Int64]] = @lib.Cell::new("counterexamples")

///|
/// `counterexamples`
pub fn counterexamples() -> Ref[Int64] {
  counterexamples_c.get()
}

///|
/// `inc_counterexamples`
pub fn inc_counterexamples(x2 : Unit) -> Unit raise {
  let _ = x2
  {
    counterexamples().val = @lib.add63(counterexamples().val, 1L)
    ()
  }
  ()
}

///|
/// `inst_type`
pub fn inst_type(x3 : @list.List[(@kernel.HolType, @kernel.HolType)], x4 : @kernel.HolType) -> @kernel.HolType raise {
  let ins = x3
  let ty = x4
  let tm = @kernel.mk_var("x", ty)
  let itm = @kernel.inst(ins, tm)
  @kernel.type_of(itm)
}

///|
/// `shell_type_match`
pub fn shell_type_match(x5 : @kernel.HolType) -> @list.List[(@kernel.HolType, @kernel.HolType)] raise {
  let ty = x5
  if @kernel.is_type(ty) {
    let (tys, tyargs) = @kernel.dest_type(ty)
    let info = try {
      @shells.sys_shell_info(tys)
    } catch {
      Failure(_) => raise Failure(("No shell defined for type '" + (@printer.string_of_type(ty) + "'")))
      e => raise e
    }
    @lib.itlist(fn(x6 : @list.List[(@kernel.HolType, @kernel.HolType)], x7 : @list.List[(@kernel.HolType, @kernel.HolType)]) -> @list.List[(@kernel.HolType, @kernel.HolType)] raise {
      @lib.union(x6, x7)
    }, @lib.map(shell_type_match, tyargs), @list.List([]))
  } else {
    try {
      @basics.type_match(ty, @term_syntax.parse_type("Num"), @list.List([]))
    } catch {
      Failure(_) => raise Failure(("Unknown type '" + (@printer.string_of_type(ty) + "' that doesn't match 'num'!")))
      e => raise e
    }
  }
}

///|
/// `HL_rewrite_ground_term`
pub fn hl_rewrite_ground_term(x8 : @kernel.Term) -> @kernel.Term raise {
  let tm = x8
  if @list.List::is_empty(@kernel.frees(tm)) {
    let numred = try {
      (fn(x10 : @kernel.Thm) -> @kernel.Term raise {
        @equal.rhs((fn(x9 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x9)
        })(x10))
      })(@calc_num.num_reduce_conv(tm))
    } catch {
      Failure(_) => tm
      e => raise e
    }
    if @support.is_t(numred) {
      numred
    } else {
      let t11 = @shells.all_accessor_thms(())
      let rew : (@kernel.Term) -> @kernel.Thm raise = @simp.rewrite_conv(@lib.union(@environment.rewrite_rules(()), t11))
      (fn(x13 : @kernel.Thm) -> @kernel.Term raise {
        @equal.rhs((fn(x12 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x12)
        })(x13))
      })(rew(tm))
    }
  } else {
    raise Failure(("rewrite_ground_term: free vars in term: " + @printer.string_of_term(tm)))
  }
}

///|
/// `HL_rewrite_ground_term'`
pub fn hl_rewrite_ground_term_p(x14 : @kernel.Term) -> @kernel.Term raise {
  let tm = x14
  if @list.List::is_empty(@kernel.frees(tm)) {
    let t16 = @shells.all_accessor_thms(())
    let rules = @lib.union((fn(x15 : @list.List[@list.List[@kernel.Thm]]) -> @list.List[@kernel.Thm] raise {
      @lib.flat(x15)
    })(@environment.defs(())), t16)
    let arith_rules = @list.List([@arith.pre(), @arith.add(), @arith.mult(), @arith.exp(), @arith.even(), @arith.odd(), @arith.le(), @arith.lt(), @arith.ge(), @arith.gt(), @arith.sub()])
    let rew : (@kernel.Term) -> @kernel.Thm raise = @simp.rewrite_conv(@lib.subtract(rules, arith_rules).prepend(@calc_num.arith()))
    (fn(x18 : @kernel.Thm) -> @kernel.Term raise {
      @equal.rhs((fn(x17 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x17)
      })(x18))
    })(rew(tm))
  } else {
    raise Failure(("rewrite_ground_term: free vars in term: " + @printer.string_of_term(tm)))
  }
}

///|
/// random_example
fn step_3() -> Unit raise {
  fn random_example_p(x19 : Int64, x20 : Int64, x21 : @kernel.HolType) -> @kernel.Term raise {
    let origdepth = x19
    let maxdepth = x20
    let ty = x21
    let tyi = shell_type_match(ty)
    let ty_p = inst_type(tyi, ty)
    let (tystr, typarams) = @kernel.dest_type(ty_p)
    let sinfo = @shells.sys_shell_info(tystr)
    let ocons = @shells.shell_constructors(sinfo)
    let sh_arg_types = @shells.shell_arg_types(sinfo)
    let arg_type_pairs = @lib.zip(sh_arg_types, typarams)
    let arg_types_matches = try {
      @lib.itlist(fn(x22 : (@kernel.HolType, @kernel.HolType), x23 : @list.List[(@kernel.HolType, @kernel.HolType)]) -> @list.List[(@kernel.HolType, @kernel.HolType)] raise {
        let (x, y) = x22
        let l = x23
        @basics.type_match(x, y, l)
      }, arg_type_pairs, tyi)
    } catch {
      Failure(_) => raise Failure("Shell argument types cannot be matched.")
      e => raise e
    }
    let mk_cons_type : (@list.List[@kernel.HolType]) -> @kernel.HolType raise = fn(x24 : @list.List[@kernel.HolType]) -> @kernel.HolType raise {
      let arglist = x24
      @lib.fold_left(fn(x25 : @kernel.HolType, x26 : @kernel.HolType) -> @kernel.HolType raise {
        let ty_1 = x25
        let i = x26
        @kernel.mk_type("fun", @list.List([i, ty_1]))
      }, ty_p, @lib.rev(arglist))
    }
    let inst_cons = @lib.map(fn(x27 : (String, @list.List[@kernel.HolType], @list.List[(String, @kernel.Thm)])) -> (String, @list.List[@kernel.HolType]) raise {
      let (x_1, y_1, _) = x27
      (x_1, @lib.map((x28 : @kernel.HolType) => inst_type(arg_types_matches, x28), y_1))
    }, ocons)
    let mk_cons : ((String, @list.List[@kernel.HolType])) -> (@kernel.Term, @list.List[@kernel.HolType]) raise = fn(x29 : (String, @list.List[@kernel.HolType])) -> (@kernel.Term, @list.List[@kernel.HolType]) raise {
      let (x_2, y_2) = x29
      try {
        let n = @num.num_of_string(x_2)
        (@nums.mk_numeral(n), y_2)
      } catch {
        Failure(_) => (@basics.mk_mconst(x_2, mk_cons_type(y_2)), y_2)
        e => raise e
      }
    }
    let cons = @lib.map(mk_cons, inst_cons)
    let (tcons, ntcons) = @lib.partition(fn(x32 : (@kernel.Term, @list.List[@kernel.HolType])) -> Bool raise {
      terminal_filter_l(x32.0, x32.1)
    }, cons)
    if (maxdepth > 1L) {
      let prob = @lib.div63(200L, @lib.mul63(@lib.sub63(maxdepth, 1L), 3L))
      let newdepth = @lib.sub63(maxdepth, 1L)
      let selcons = if (@lib.random_int(100L) <= prob) {
        tcons
      } else {
        ntcons
      }
      let (cconstm, cconsargs) = @lib.list_nth(selcons, @lib.int63_to_int(@lib.random_int(Int::to_int64(@lib.length(selcons)))))
      let args = @lib.map((x33 : @kernel.HolType) => random_example_p(origdepth, newdepth, x33), cconsargs)
      @lib.fold_left(fn(x34 : @kernel.Term, x35 : @kernel.Term) -> @kernel.Term raise {
        let x_3 = x34
        let y_3 = x35
        @kernel.mk_comb(x_3, y_3)
      }, cconstm, args)
    } else {
      (fn(x36 : (@kernel.Term, @list.List[@kernel.HolType])) -> @kernel.Term raise {
        x36.0
      })(@lib.hd(tcons))
    }
  }
  random_example_c.set(fn(x37 : Int64) -> ((@kernel.HolType) -> @kernel.Term raise) raise {
    let maxdepth_1 = x37
    fn(x38 : @kernel.HolType) -> @kernel.Term raise {
      let ty_2 = x38
      random_example_p(maxdepth_1, maxdepth_1, ty_2)
    }
  })
}

///|
let random_example_c : @lib.Cell[(Int64) -> ((@kernel.HolType) -> @kernel.Term raise) raise] = @lib.Cell::new("random_example")

///|
/// `random_example`
pub fn random_example(x : Int64) -> ((@kernel.HolType) -> @kernel.Term raise) raise {
  (random_example_c.get())(x)
}

///|
fn[TA, TB] terminal_filter_l(x30 : TA, x31 : @list.List[TB]) -> Bool raise {
  let (_, l_1) = (x30, x31)
  @list.List::is_empty(l_1)
}

///|
/// `random_grounding`
pub fn random_grounding(x39 : Int64, x40 : @kernel.Term) -> @kernel.Term raise {
  let maxdepth = x39
  let tm = x40
  let vars = @kernel.frees(tm)
  let types = @lib.map(fn(x41 : @kernel.Term) -> @kernel.HolType raise {
    @kernel.type_of(x41)
  }, vars)
  let examples = @lib.map(random_example(maxdepth), types)
  let pairs = @lib.zip(vars, examples)
  let insts = @lib.map(fn(x42 : (@kernel.Term, @kernel.Term)) -> (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]) raise {
    let (v, e) = x42
    @drule.term_match(@list.List([]), v, e)
  }, pairs)
  @lib.itlist(@drule.instantiate, insts, tm)
}

///|
/// `counter_check_once`
pub fn counter_check_once(x43 : Int64, x44 : @kernel.Term) -> Bool raise {
  let maxdepth = x43
  let tm = x44
  let tm_p = random_grounding(maxdepth, tm)
  let tm_p_p = hl_rewrite_ground_term(tm_p)
  if @support.is_t(tm_p_p) {
    true
  } else {
    let t45 = (" : " + @printer.string_of_term(tm_p))
    let t46 = ("Found counterexample for " + (@printer.string_of_term(tm) + t45))
    let junk = @lib.warn(@waterfall.proof_printing().val, t46)
    inc_counterexamples(())
    false
  }
}

///|
/// `counter_check_n`
pub fn counter_check_n(x47 : Int64, x48 : Int64, x49 : @kernel.Term) -> Bool raise {
  let maxdepth = x47
  let n = x48
  let tm = x49
  if (n <= 0L) {
    true
  } else {
    if counter_check_once(maxdepth, tm) {
      counter_check_n(maxdepth, @lib.sub63(n, 1L), tm)
    } else {
      false
    }
  }
}

///|
/// `counter_check`
pub fn counter_check(x50 : Int64, x51 : @kernel.Term) -> Bool raise {
  let maxdepth = x50
  let tm = x51
  counter_check_n(maxdepth, counter_check_num().val, tm)
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
}
