// Translated from upstream Formal_ineqs/informal/informal_eval_interval.hl; edit this file directly.

///|
/// `mk_float_interval_decimal`
pub fn mk_float_interval_decimal(x1 : Int64, x2 : @kernel.Term) -> @informal_interval.Interval raise {
  let pp = x1
  let decimal_tm = x2
  let (n_tm, d_tm) = @basics.dest_binary("DECIMAL", decimal_tm)
  let t3 = @basics.dest_numeral(d_tm)
  let (n, d) = (@basics.dest_numeral(n_tm), t3)
  let t4 = @informal_interval.mk_num_interval(d)
  let (n_int, d_int) = (@informal_interval.mk_num_interval(n), t4)
  @informal_interval.div_interval(pp, n_int, d_int)
}

///|
/// unary_interval_operations
fn step_1() -> Unit raise {
  let table = @lib.hashtbl_create(10)
  @lib.hashtbl_add(table, "real_neg", fn(x5 : Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    let pp = x5
    fn(x7 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
      @informal_interval.neg_interval(x7.0, x7.1)
    }
  })
  @lib.hashtbl_add(table, "real_abs", fn(x8 : Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    let pp_1 = x8
    fn(x10 : ((Bool, @bigint.BigInt, Int64), (Bool, @bigint.BigInt, Int64))) -> @informal_interval.Interval raise {
      @informal_interval.abs_interval(x10.0, x10.1)
    }
  })
  @lib.hashtbl_add(table, "real_inv", fn(x11 : Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x12 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      @informal_interval.inv_interval(x11, x12)
    }
  })
  @lib.hashtbl_add(table, "sqrt", fn(x13 : Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x14 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      @informal_interval.sqrt_interval(x13, x14)
    }
  })
  @lib.hashtbl_add(table, "exp", fn(x15 : Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x16 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      @informal_exp.exp_interval(x15, x16)
    }
  })
  @lib.hashtbl_add(table, "log", fn(x17 : Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x18 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      @informal_log.log_interval(x17, x18)
    }
  })
  @lib.hashtbl_add(table, "cos", fn(x19 : Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x20 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      @informal_sin_cos.cos_interval(x19, x20)
    }
  })
  @lib.hashtbl_add(table, "sin", fn(x21 : Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x22 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      @informal_sin_cos.sin_interval(x21, x22)
    }
  })
  @lib.hashtbl_add(table, "atn", fn(x23 : Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x24 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      @informal_atn.atn_interval(x23, x24)
    }
  })
  @lib.hashtbl_add(table, "acs", fn(x25 : Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x26 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      @informal_asn_acs.acs_interval(x25, x26)
    }
  })
  @lib.hashtbl_add(table, "asn", fn(x27 : Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
    fn(x28 : @informal_interval.Interval) -> @informal_interval.Interval raise {
      @informal_asn_acs.asn_interval(x27, x28)
    }
  })
  @lib.hashtbl_add(table, "matan", @informal_matan.matan_interval)
  @lib.hashtbl_add(table, "dmatan", @informal_matan.dmatan_interval)
  @lib.hashtbl_add(table, "ddmatan", @informal_matan.ddmatan_interval)
  unary_interval_operations_c.set(table)
}

///|
let unary_interval_operations_c : @lib.Cell[@lib.OHashtbl[String, (Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise]] = @lib.Cell::new("unary_interval_operations")

///|
/// `Informal_eval_interval.unary_interval_operations`
pub fn unary_interval_operations() -> @lib.OHashtbl[String, (Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise] {
  unary_interval_operations_c.get()
}

///|
/// binary_interval_operations
fn step_2() -> Unit raise {
  let table = @lib.hashtbl_create(10)
  @lib.hashtbl_add(table, "real_add", fn(x29 : Int64) -> ((@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise {
    fn(x30 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      fn(x31 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        @informal_interval.add_interval(x29, x30, x31)
      }
    }
  })
  @lib.hashtbl_add(table, "real_sub", fn(x32 : Int64) -> ((@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise {
    fn(x33 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      fn(x34 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        @informal_interval.sub_interval(x32, x33, x34)
      }
    }
  })
  @lib.hashtbl_add(table, "real_mul", fn(x35 : Int64) -> ((@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise {
    fn(x36 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      fn(x37 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        @informal_interval.mul_interval(x35, x36, x37)
      }
    }
  })
  @lib.hashtbl_add(table, "real_div", fn(x38 : Int64) -> ((@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise {
    fn(x39 : @informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise {
      fn(x40 : @informal_interval.Interval) -> @informal_interval.Interval raise {
        @informal_interval.div_interval(x38, x39, x40)
      }
    }
  })
  binary_interval_operations_c.set(table)
}

///|
let binary_interval_operations_c : @lib.Cell[@lib.OHashtbl[String, (Int64) -> ((@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise]] = @lib.Cell::new("binary_interval_operations")

///|
/// `Informal_eval_interval.binary_interval_operations`
pub fn binary_interval_operations() -> @lib.OHashtbl[String, (Int64) -> ((@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise] {
  binary_interval_operations_c.get()
}

///|
/// interval_constants
fn step_3() -> Unit raise {
  let table = @lib.hashtbl_create(10)
  @lib.hashtbl_add(table, "pi", fn(x41 : Int64) -> @informal_interval.Interval raise {
    let pp = x41
    @lib.array_get(@informal_atn.pi_approx_array(), @lib.int63_to_int(pp))
  })
  interval_constants_c.set(table)
}

///|
let interval_constants_c : @lib.Cell[@lib.OHashtbl[String, (Int64) -> @informal_interval.Interval raise]] = @lib.Cell::new("interval_constants")

///|
/// `Informal_eval_interval.interval_constants`
pub fn interval_constants() -> @lib.OHashtbl[String, (Int64) -> @informal_interval.Interval raise] {
  interval_constants_c.get()
}

///|
/// `interval_fun`
#derive(Eq, Debug)
pub(all) enum IntervalFun {
  Int_ref(Int64)
  Int_var(Int64)
  Int_const(@informal_interval.Interval)
  Int_decimal_const(@kernel.Term)
  Int_named_const(String)
  Int_pow(Int64, IntervalFun)
  Int_unary(String, IntervalFun)
  Int_binary(String, IntervalFun, IntervalFun)
}

///|
pub extend IntervalFun with Eq::{not_equal, equal}

///|
pub extend IntervalFun with Debug::{to_repr}

///|
pub extend IntervalFun with @lib.OCompare::{ocompare}

///|
pub extend IntervalFun with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_IntervalFun(x : IntervalFun) -> Int {
  match x {
    Int_ref(_) => 1000000
    Int_var(_) => 1000001
    Int_const(_) => 1000002
    Int_decimal_const(_) => 1000003
    Int_named_const(_) => 1000004
    Int_pow(_, _) => 1000005
    Int_unary(_, _) => 1000006
    Int_binary(_, _, _) => 1000007
  }
}

///|
pub impl @lib.OCompare for IntervalFun with fn ocompare(self, other) {
  match (self, other) {
    (Int_ref(a0), Int_ref(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Int_var(a0), Int_var(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Int_const(a0), Int_const(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Int_decimal_const(a0), Int_decimal_const(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Int_named_const(a0), Int_named_const(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Int_pow(a0, a1), Int_pow(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Int_unary(a0, a1), Int_unary(b0, b1)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      @lib.compare(a1, b1)
    }
    (Int_binary(a0, a1, a2), Int_binary(b0, b1, b2)) => {
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
    _ => ocaml_rank_IntervalFun(self).compare(ocaml_rank_IntervalFun(other))
  }
}

///|
pub impl @lib.OHash for IntervalFun with fn ohash_visit(self, h) {
  match self {
    Int_ref(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Int_var(a0) => {
      h.block(1, 1)
      h.field(a0)
    }
    Int_const(a0) => {
      h.block(2, 1)
      h.field(a0)
    }
    Int_decimal_const(a0) => {
      h.block(3, 1)
      h.field(a0)
    }
    Int_named_const(a0) => {
      h.block(4, 1)
      h.field(a0)
    }
    Int_pow(a0, a1) => {
      h.block(5, 2)
      h.field(a0)
      h.field(a1)
    }
    Int_unary(a0, a1) => {
      h.block(6, 2)
      h.field(a0)
      h.field(a1)
    }
    Int_binary(a0, a1, a2) => {
      h.block(7, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
  }
}

///|
/// `eq_ifun`
pub fn eq_ifun(x42 : IntervalFun, x43 : IntervalFun) -> Bool raise {
  let ifun1 = x42
  let ifun2 = x43
  match (ifun1, ifun2) {
    (IntervalFun::Int_ref(r1), IntervalFun::Int_ref(r2)) => (r1 == r2)
    (IntervalFun::Int_var(v1), IntervalFun::Int_var(v2)) => (v1 == v2)
    (IntervalFun::Int_decimal_const(tm1), IntervalFun::Int_decimal_const(tm2)) => (tm1 == tm2)
    (IntervalFun::Int_named_const(name1), IntervalFun::Int_named_const(name2)) => (name1 == name2)
    (IntervalFun::Int_pow(n1, f1), IntervalFun::Int_pow(n2, f2)) => ((n1 == n2) && eq_ifun(f1, f2))
    (IntervalFun::Int_unary(op1, f1_1), IntervalFun::Int_unary(op2, f2_1)) => ((op1 == op2) && eq_ifun(f1_1, f2_1))
    (IntervalFun::Int_binary(op1_1, f1_2, g1), IntervalFun::Int_binary(op2_1, f2_2, g2)) => ((op1_1 == op2_1) && (eq_ifun(f1_2, f2_2) && eq_ifun(g1, g2)))
    (IntervalFun::Int_const(int1), IntervalFun::Int_const(int2)) => {
      let (lo1, hi1) = @informal_interval.dest_interval(int1.0, int1.1)
      let (lo2, hi2) = @informal_interval.dest_interval(int2.0, int2.1)
      (@informal_float.eq_float(lo1, lo2) && @informal_float.eq_float(hi1, hi2))
    }
    _ => false
  }
}

///|
/// eval_interval_fun
fn step_4() -> Unit raise {
  let u_find : (String) -> ((Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise = fn(x44 : String) -> ((Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise {
    @lib.hashtbl_find(unary_interval_operations(), x44)
  }
  let b_find : (String) -> ((Int64) -> ((@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise) raise = fn(x45 : String) -> ((Int64) -> ((@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise) raise {
    @lib.hashtbl_find(binary_interval_operations(), x45)
  }
  let c_find : (String) -> ((Int64) -> @informal_interval.Interval raise) raise = fn(x46 : String) -> ((Int64) -> @informal_interval.Interval raise) raise {
    @lib.hashtbl_find(interval_constants(), x46)
  }
  eval_interval_fun_c.set(fn(x47 : Int64) -> ((IntervalFun) -> ((@list.List[@informal_interval.Interval]) -> ((@list.List[@informal_interval.Interval]) -> @informal_interval.Interval raise) raise) raise) raise {
    let pp = x47
    fn(x48 : IntervalFun) -> ((@list.List[@informal_interval.Interval]) -> ((@list.List[@informal_interval.Interval]) -> @informal_interval.Interval raise) raise) raise {
      let ifun = x48
      fn(x49 : @list.List[@informal_interval.Interval]) -> ((@list.List[@informal_interval.Interval]) -> @informal_interval.Interval raise) raise {
        let vars = x49
        fn(x50 : @list.List[@informal_interval.Interval]) -> @informal_interval.Interval raise {
          let refs = x50
          fn rec_eval(x51 : IntervalFun) -> @informal_interval.Interval raise {
            let f = x51
            match f {
              IntervalFun::Int_ref(i) => @lib.list_nth(refs, @lib.int63_to_int(i))
              IntervalFun::Int_var(i_1) => @lib.list_nth(vars, @lib.int63_to_int(@lib.sub63(i_1, 1L)))
              IntervalFun::Int_const(int) => int
              IntervalFun::Int_decimal_const(tm) => mk_float_interval_decimal(pp, tm)
              IntervalFun::Int_named_const(name) => c_find(name)(pp)
              IntervalFun::Int_pow(n, f1) => @informal_interval.pow_interval(pp, n, rec_eval(f1))
              IntervalFun::Int_unary(op, f1_1) => {
                let t52 = rec_eval(f1_1)
                u_find(op)(pp)(t52)
              }
              IntervalFun::Int_binary(op_1, f1_2, f2) => {
                let t53 = rec_eval(f2)
                let t54 = rec_eval(f1_2)
                b_find(op_1)(pp)(t54)(t53)
              }
            }
          }
          rec_eval(ifun)
        }
      }
    }
  })
}

///|
let eval_interval_fun_c : @lib.Cell[(Int64) -> ((IntervalFun) -> ((@list.List[@informal_interval.Interval]) -> ((@list.List[@informal_interval.Interval]) -> @informal_interval.Interval raise) raise) raise) raise] = @lib.Cell::new("eval_interval_fun")

///|
/// `eval_interval_fun`
pub fn eval_interval_fun(x : Int64) -> ((IntervalFun) -> ((@list.List[@informal_interval.Interval]) -> ((@list.List[@informal_interval.Interval]) -> @informal_interval.Interval raise) raise) raise) raise {
  (eval_interval_fun_c.get())(x)
}

///|
/// eval_constants
fn step_5() -> Unit raise {
  let u_find : (String) -> ((Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise = fn(x55 : String) -> ((Int64) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise {
    @lib.hashtbl_find(unary_interval_operations(), x55)
  }
  let b_find : (String) -> ((Int64) -> ((@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise) raise = fn(x56 : String) -> ((Int64) -> ((@informal_interval.Interval) -> ((@informal_interval.Interval) -> @informal_interval.Interval raise) raise) raise) raise {
    @lib.hashtbl_find(binary_interval_operations(), x56)
  }
  let c_find : (String) -> ((Int64) -> @informal_interval.Interval raise) raise = fn(x57 : String) -> ((Int64) -> @informal_interval.Interval raise) raise {
    @lib.hashtbl_find(interval_constants(), x57)
  }
  eval_constants_c.set(fn(x58 : Int64) -> ((IntervalFun) -> IntervalFun raise) raise {
    let pp = x58
    fn(x59 : IntervalFun) -> IntervalFun raise {
      let ifun = x59
      fn rec_eval(x60 : IntervalFun) -> IntervalFun raise {
        let f = x60
        match f {
          IntervalFun::Int_decimal_const(tm) => IntervalFun::Int_const(mk_float_interval_decimal(pp, tm))
          IntervalFun::Int_named_const(name) => IntervalFun::Int_const(c_find(name)(pp))
          IntervalFun::Int_pow(n, f1) => {
            let f1_val = rec_eval(f1)
            match f1_val {
              IntervalFun::Int_const(int) => IntervalFun::Int_const(@informal_interval.pow_interval(pp, n, int))
              _ => IntervalFun::Int_pow(n, f1_val)
            }
          }
          IntervalFun::Int_unary(op, f1_1) => {
            let f1_val_1 = rec_eval(f1_1)
            match f1_val_1 {
              IntervalFun::Int_const(int_1) => IntervalFun::Int_const(u_find(op)(pp)(int_1))
              _ => IntervalFun::Int_unary(op, f1_val_1)
            }
          }
          IntervalFun::Int_binary(op_1, f1_2, f2) => {
            let t61 = rec_eval(f2)
            let (f1_val_2, f2_val) = (rec_eval(f1_2), t61)
            match f1_val_2 {
              IntervalFun::Int_const(int1) => {
                match f2_val {
                  IntervalFun::Int_const(int2) => IntervalFun::Int_const(b_find(op_1)(pp)(int1)(int2))
                  _ => IntervalFun::Int_binary(op_1, f1_val_2, f2_val)
                }
              }
              _ => IntervalFun::Int_binary(op_1, f1_val_2, f2_val)
            }
          }
          _ => f
        }
      }
      rec_eval(ifun)
    }
  })
}

///|
let eval_constants_c : @lib.Cell[(Int64) -> ((IntervalFun) -> IntervalFun raise) raise] = @lib.Cell::new("eval_constants")

///|
/// `eval_constants`
pub fn eval_constants(x : Int64) -> ((IntervalFun) -> IntervalFun raise) raise {
  (eval_constants_c.get())(x)
}

///|
/// build_interval_fun
fn step_6() -> Unit raise {
  let amp_op_real = @term_syntax.parse_term("real_of_num")
  fn rec_build(x62 : @kernel.Term) -> IntervalFun raise {
    let expr_tm = x62
    if @kernel.is_const(expr_tm) {
      IntervalFun::Int_named_const(@kernel.dest_const(expr_tm).0)
    } else {
      if @kernel.is_var(expr_tm) {
        raise Failure(("Variables should be of the form name$i: " + @printer.string_of_term(expr_tm)))
      } else {
        let (ltm, r_tm) = @kernel.dest_comb(expr_tm)
        if @kernel.is_const(ltm) {
          if (ltm == amp_op_real) {
            let n = @basics.dest_numeral(r_tm)
            IntervalFun::Int_const(@informal_interval.mk_num_interval(n))
          } else {
            let r_fun = rec_build(r_tm)
            IntervalFun::Int_unary((fn(x63 : (String, @kernel.HolType)) -> String raise {
              x63.0
            })(@kernel.dest_const(ltm)), r_fun)
          }
        } else {
          let (op, l_tm) = @kernel.dest_comb(ltm)
          let name = (fn(x64 : (String, @kernel.HolType)) -> String raise {
            x64.0
          })(@kernel.dest_const(op))
          if (name == "DECIMAL") {
            IntervalFun::Int_decimal_const(expr_tm)
          } else {
            if (name == "real_pow") {
              let n_1 = @nums.dest_small_numeral(r_tm)
              IntervalFun::Int_pow(n_1, rec_build(l_tm))
            } else {
              if (name == "$") {
                IntervalFun::Int_var(@nums.dest_small_numeral(@kernel.rand(expr_tm)))
              } else {
                let lhs = rec_build(l_tm)
                let rhs = rec_build(r_tm)
                IntervalFun::Int_binary((fn(x65 : (String, @kernel.HolType)) -> String raise {
                  x65.0
                })(@kernel.dest_const(op)), lhs, rhs)
              }
            }
          }
        }
      }
    }
  }
  build_interval_fun_c.set(rec_build)
}

///|
let build_interval_fun_c : @lib.Cell[(@kernel.Term) -> IntervalFun raise] = @lib.Cell::new("build_interval_fun")

///|
/// `build_interval_fun`
pub fn build_interval_fun(x : @kernel.Term) -> IntervalFun raise {
  (build_interval_fun_c.get())(x)
}

///|
/// `replace_subexpr`
pub fn replace_subexpr(x66 : IntervalFun, x67 : Int64, x68 : @list.List[IntervalFun]) -> ((Int64, @list.List[IntervalFun])) raise {
  let expr = x66
  let expr_index = x67
  let f_list = x68
  fn replace(x69 : IntervalFun) -> ((Int64, IntervalFun)) raise {
    let f = x69
    if eq_ifun(f, expr) {
      (1L, IntervalFun::Int_ref(expr_index))
    } else {
      match f {
        IntervalFun::Int_pow(k, f1) => {
          let (c, f1_p) = replace(f1)
          (c, IntervalFun::Int_pow(k, f1_p))
        }
        IntervalFun::Int_unary(op, f1_1) => {
          let (c_1, f1_p_1) = replace(f1_1)
          (c_1, IntervalFun::Int_unary(op, f1_p_1))
        }
        IntervalFun::Int_binary(op_1, f1_2, f2) => {
          let (c1, f1_p_2) = replace(f1_2)
          let (c2, f2_p) = replace(f2)
          let t70 = IntervalFun::Int_binary(op_1, f1_p_2, f2_p)
          (@lib.add63(c1, c2), t70)
        }
        _ => (0L, f)
      }
    }
  }
  let (cs, fs) = @lib.unzip(@lib.map(replace, f_list))
  (@lib.itlist(fn(x73 : Int64, x74 : Int64) -> Int64 raise {
    let s75 = (fn(x71 : Int64) -> ((Int64) -> Int64 raise) raise {
      fn(x72 : Int64) -> Int64 raise {
        @lib.add63(x71, x72)
      }
    })(x73)
    s75(x74)
  }, cs, 0L), fs)
}

///|
/// `is_leaf`
pub fn is_leaf(x76 : IntervalFun) -> Bool raise {
  let f = x76
  match f {
    IntervalFun::Int_pow(_, _) => false
    IntervalFun::Int_unary(_, _) => false
    IntervalFun::Int_binary(_, _, _) => false
    _ => true
  }
}

///|
/// `find_and_replace_all`
pub fn find_and_replace_all(x77 : @list.List[IntervalFun], x78 : @list.List[IntervalFun]) -> ((@list.List[IntervalFun], @list.List[IntervalFun])) raise {
  let f_list = x77
  let acc = x78
  fn find_and_replace(x79 : IntervalFun, x80 : Int64, x81 : @list.List[IntervalFun]) -> ((IntervalFun, (Int64, @list.List[IntervalFun]))) raise {
    let f = x79
    let i = x80
    let f_list_1 = x81
    if is_leaf(f) {
      (f, (0L, f_list_1))
    } else {
      let (expr_1, (c, fs_1)) = match f {
        IntervalFun::Int_pow(k, f1) => find_and_replace(f1, i, f_list_1)
        IntervalFun::Int_unary(op, f1_1) => find_and_replace(f1_1, i, f_list_1)
        IntervalFun::Int_binary(op_1, f1_2, f2) => {
          let (expr, (c1, fs)) = find_and_replace(f1_2, i, f_list_1)
          if (c1 > 1L) {
            (expr, (c1, fs))
          } else {
            find_and_replace(f2, i, f_list_1)
          }
        }
        _ => (f, (0L, f_list_1))
      }
      if (c > 1L) {
        (expr_1, (c, fs_1))
      } else {
        (f, replace_subexpr(f, i, f_list_1))
      }
    }
  }
  fn iterate(x82 : @list.List[IntervalFun], x83 : @list.List[IntervalFun]) -> ((@list.List[IntervalFun], @list.List[IntervalFun])) raise {
    let fs_2 = x82
    let acc_1 = x83
    let i_1 = Int::to_int64(@lib.length(acc_1))
    let (expr_2, (c_1, fs_p)) = find_and_replace(@lib.hd(fs_2), i_1, fs_2)
    if (c_1 > 1L) {
      iterate(fs_p, acc_1.concat(@list.List([expr_2])))
    } else {
      (fs_2, acc_1)
    }
  }
  fn iterate_all(x84 : @list.List[IntervalFun], x85 : @list.List[IntervalFun], x86 : @list.List[IntervalFun]) -> ((@list.List[IntervalFun], @list.List[IntervalFun])) raise {
    let f_list_2 = x84
    let ref_acc = x85
    let f_acc = x86
    match f_list_2 {
      Empty => (f_acc, ref_acc)
      More(f_1, tail=fs_3) => {
        let (fs_p_1, acc_p) = iterate(f_list_2, ref_acc)
        let t87 = f_acc.concat(@list.List([@lib.hd(fs_p_1)]))
        iterate_all(@lib.tl(fs_p_1), acc_p, t87)
      }
    }
  }
  iterate_all(f_list, acc, @list.List([]))
}

///|
/// `eval_interval_fun_list`
pub fn eval_interval_fun_list(x88 : Int64, x89 : (@list.List[IntervalFun], @list.List[IntervalFun]), x90 : @list.List[@informal_interval.Interval]) -> @list.List[@informal_interval.Interval] raise {
  let pp = x88
  let (f_list, refs) = x89
  let vars = x90
  fn eval_refs(x91 : @list.List[IntervalFun], x92 : @list.List[@informal_interval.Interval]) -> @list.List[@informal_interval.Interval] raise {
    let refs_1 = x91
    let acc = x92
    match refs_1 {
      Empty => acc
      More(r, tail=rs) => {
        let v = eval_interval_fun(pp)(r)(vars)(acc)
        eval_refs(rs, acc.concat(@list.List([v])))
      }
    }
  }
  let rs_1 = eval_refs(refs, @list.List([]))
  @lib.map(fn(x93 : IntervalFun) -> @informal_interval.Interval raise {
    let f = x93
    eval_interval_fun(pp)(f)(vars)(rs_1)
  }, f_list)
}

///|
/// `interval_to_float_interval`
pub fn interval_to_float_interval(x94 : Int64, x95 : @kernel.Thm) -> @informal_interval.Interval raise {
  let pp = x94
  let int_th = x95
  let (lo_tm, hi_tm) = (fn(x96 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
    @pair.dest_pair(@kernel.rand(x96))
  })((fn(x97 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x97)
  })(int_th))
  let f_lo = build_interval_fun(lo_tm)
  let f_hi = build_interval_fun(hi_tm)
  let int_lo = eval_interval_fun(pp)(f_lo)(@list.List([]))(@list.List([]))
  let int_hi = eval_interval_fun(pp)(f_hi)(@list.List([]))(@list.List([]))
  let (a, _) = @informal_interval.dest_interval(int_lo.0, int_lo.1)
  let (_, b) = @informal_interval.dest_interval(int_hi.0, int_hi.1)
  @informal_interval.mk_interval(a, b)
}

///|
/// `add_constant_interval`
pub fn add_constant_interval(x98 : @kernel.Thm) -> Unit raise {
  let int_th = x98
  let c_tm = (fn(x99 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rator(x99))
  })((fn(x100 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x100)
  })(int_th))
  let _ = (@kernel.is_const(c_tm) || @lib.raise_error(Failure("add_constant_interval: not a constant")))
  let interval = interval_to_float_interval(20L, int_th)
  let approx_array = @lib.array_init(20L, fn(x101 : Int64) -> @informal_interval.Interval raise {
    let i = x101
    @informal_interval.round_interval(if (i == 0L) {
      1L
    } else {
      i
    }, interval)
  })
  @lib.hashtbl_add(interval_constants(), @kernel.dest_const(c_tm).0, fn(x102 : Int64) -> @informal_interval.Interval raise {
    let pp = x102
    @lib.array_get(approx_array, @lib.int63_to_int(pp))
  })
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
}
