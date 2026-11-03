// Translated from upstream Formal_ineqs/arith/eval_interval.hl; edit this file directly.

///|
/// mk_float_interval_decimal
fn step_1() -> Unit raise {
  let decimal_p = @bool.spec_all(@calc_rat.decimal())
  mk_float_interval_decimal_c.set(fn(x1 : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let pp = x1
    fn(x2 : @kernel.Term) -> @kernel.Thm raise {
      let decimal_tm = x2
      let (n_tm, d_tm) = @basics.dest_binary("DECIMAL", decimal_tm)
      let t3 = @basics.dest_numeral(d_tm)
      let (n, d) = (@basics.dest_numeral(n_tm), t3)
      let t4 = @arith_float.mk_float_interval_num(d)
      let (n_int, d_int) = (@arith_float.mk_float_interval_num(n), t4)
      let int = @arith_float.float_interval_div(pp, n_int, d_int)
      let eq_th = @kernel.inst_rule(@list.List([(n_tm, @misc_vars.x_var_num()), (d_tm, @misc_vars.y_var_num())]), decimal_p)
      @more_float.norm_interval(int, eq_th)
    }
  })
}

///|
let mk_float_interval_decimal_c : @lib.Cell[(Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("mk_float_interval_decimal")

///|
/// `mk_float_interval_decimal`
pub fn mk_float_interval_decimal(x : Int64) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (mk_float_interval_decimal_c.get())(x)
}

///|
/// unary_interval_operations
fn step_2() -> Unit raise {
  let table = @lib.hashtbl_create(10)
  @lib.hashtbl_add(table, @term_syntax.parse_term("real_neg"), fn(x5 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let pp = x5
    @arith_float.float_interval_neg_v1
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("real_abs"), fn(x7 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let pp_1 = x7
    @arith_float.float_interval_abs
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("inv"), @more_float.float_interval_inv)
  @lib.hashtbl_add(table, @term_syntax.parse_term("sqrt"), fn(x9 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x10 : @kernel.Thm) -> @kernel.Thm raise {
      @arith_float.float_interval_sqrt_v1(x9, x10)
    }
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("exp"), fn(x11 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x12 : @kernel.Thm) -> @kernel.Thm raise {
      @exp_eval.float_interval_exp(x11, x12)
    }
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("log"), fn(x13 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x14 : @kernel.Thm) -> @kernel.Thm raise {
      @log_eval.float_interval_log(x13, x14)
    }
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("atn"), fn(x15 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x16 : @kernel.Thm) -> @kernel.Thm raise {
      @atn_eval.float_interval_atn(x15, x16)
    }
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("acs"), fn(x17 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x18 : @kernel.Thm) -> @kernel.Thm raise {
      @asn_acs_eval.float_interval_acs(x17, x18)
    }
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("asn"), fn(x19 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x20 : @kernel.Thm) -> @kernel.Thm raise {
      @asn_acs_eval.float_interval_asn(x19, x20)
    }
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("sin"), fn(x21 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x22 : @kernel.Thm) -> @kernel.Thm raise {
      @sin_eval.float_interval_sin(x21, x22)
    }
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("cos"), fn(x23 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x24 : @kernel.Thm) -> @kernel.Thm raise {
      @cos_eval.float_interval_cos(x23, x24)
    }
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("matan"), @matan_eval.float_interval_matan)
  @lib.hashtbl_add(table, @term_syntax.parse_term("dmatan"), @matan_eval.float_interval_dmatan)
  @lib.hashtbl_add(table, @term_syntax.parse_term("ddmatan"), fn(x25 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x26 : @kernel.Thm) -> @kernel.Thm raise {
      @matan_eval.float_interval_ddmatan(x25, x26)
    }
  })
  unary_interval_operations_c.set(table)
}

///|
let unary_interval_operations_c : @lib.Cell[@lib.OHashtbl[@kernel.Term, (Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise]] = @lib.Cell::new("unary_interval_operations")

///|
/// `Eval_interval.unary_interval_operations`
pub fn unary_interval_operations() -> @lib.OHashtbl[@kernel.Term, (Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise] {
  unary_interval_operations_c.get()
}

///|
/// binary_interval_operations
fn step_3() -> Unit raise {
  let table = @lib.hashtbl_create(10)
  @lib.hashtbl_add(table, @term_syntax.parse_term("real_add"), fn(x27 : Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    fn(x28 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x29 : @kernel.Thm) -> @kernel.Thm raise {
        @arith_float.float_interval_add(x27, x28, x29)
      }
    }
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("real_sub"), fn(x30 : Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    fn(x31 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x32 : @kernel.Thm) -> @kernel.Thm raise {
        @arith_float.float_interval_sub(x30, x31, x32)
      }
    }
  })
  @lib.hashtbl_add(table, @term_syntax.parse_term("real_mul"), @arith_float.float_interval_mul)
  @lib.hashtbl_add(table, @term_syntax.parse_term("op_slash"), fn(x33 : Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    fn(x34 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      fn(x35 : @kernel.Thm) -> @kernel.Thm raise {
        @arith_float.float_interval_div(x33, x34, x35)
      }
    }
  })
  binary_interval_operations_c.set(table)
}

///|
let binary_interval_operations_c : @lib.Cell[@lib.OHashtbl[@kernel.Term, (Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise]] = @lib.Cell::new("binary_interval_operations")

///|
/// `Eval_interval.binary_interval_operations`
pub fn binary_interval_operations() -> @lib.OHashtbl[@kernel.Term, (Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise] {
  binary_interval_operations_c.get()
}

///|
/// interval_constants
fn step_4() -> Unit raise {
  let table = @lib.hashtbl_create(10)
  @lib.hashtbl_add(table, @term_syntax.parse_term("pi"), fn(x36 : Int64) -> @kernel.Thm raise {
    let pp = x36
    @lib.array_get(@atn_eval.pi_approx_array(), @lib.int63_to_int(pp))
  })
  interval_constants_c.set(table)
}

///|
let interval_constants_c : @lib.Cell[@lib.OHashtbl[@kernel.Term, (Int64) -> @kernel.Thm raise]] = @lib.Cell::new("interval_constants")

///|
/// `Eval_interval.interval_constants`
pub fn interval_constants() -> @lib.OHashtbl[@kernel.Term, (Int64) -> @kernel.Thm raise] {
  interval_constants_c.get()
}

///|
/// `interval_fun`
#derive(Eq, Debug)
pub(all) enum IntervalFun {
  Int_ref(Int64)
  Int_var(@kernel.Term)
  Int_const(@kernel.Thm)
  Int_decimal_const(@kernel.Term)
  Int_named_const(@kernel.Term)
  Int_pow(Int64, IntervalFun)
  Int_unary(@kernel.Term, IntervalFun)
  Int_binary(@kernel.Term, IntervalFun, IntervalFun)
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
/// `eval_interval_fun`
pub fn eval_interval_fun(x37 : Int64, x38 : IntervalFun, x39 : @list.List[(@kernel.Term, @kernel.Thm)], x40 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
  let pp = x37
  let ifun = x38
  let vars = x39
  let refs = x40
  let u_find : (@kernel.Term) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise = fn(x41 : @kernel.Term) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    @lib.hashtbl_find(unary_interval_operations(), x41)
  }
  let b_find : (@kernel.Term) -> ((Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise = fn(x42 : @kernel.Term) -> ((Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
    @lib.hashtbl_find(binary_interval_operations(), x42)
  }
  let c_find : (@kernel.Term) -> ((Int64) -> @kernel.Thm raise) raise = fn(x43 : @kernel.Term) -> ((Int64) -> @kernel.Thm raise) raise {
    @lib.hashtbl_find(interval_constants(), x43)
  }
  fn rec_eval(x44 : IntervalFun) -> @kernel.Thm raise {
    let f = x44
    match f {
      IntervalFun::Int_ref(i) => @lib.list_nth(refs, @lib.int63_to_int(i))
      IntervalFun::Int_var(tm) => @lib.assoc(tm, vars)
      IntervalFun::Int_const(th) => th
      IntervalFun::Int_decimal_const(tm_1) => mk_float_interval_decimal(pp)(tm_1)
      IntervalFun::Int_named_const(tm_2) => c_find(tm_2)(pp)
      IntervalFun::Int_pow(n, f1) => @float_pow.float_interval_pow(pp, n, rec_eval(f1))
      IntervalFun::Int_unary(tm_3, f1_1) => {
        let t45 = rec_eval(f1_1)
        u_find(tm_3)(pp)(t45)
      }
      IntervalFun::Int_binary(tm_4, f1_2, f2) => {
        let t46 = rec_eval(f2)
        let t47 = rec_eval(f1_2)
        b_find(tm_4)(pp)(t47)(t46)
      }
    }
  }
  rec_eval(ifun)
}

///|
/// `eval_constants`
pub fn eval_constants(x48 : Int64, x49 : IntervalFun) -> IntervalFun raise {
  let pp = x48
  let ifun = x49
  let u_find : (@kernel.Term) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise = fn(x50 : @kernel.Term) -> ((Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise {
    @lib.hashtbl_find(unary_interval_operations(), x50)
  }
  let b_find : (@kernel.Term) -> ((Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise = fn(x51 : @kernel.Term) -> ((Int64) -> ((@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise) raise) raise {
    @lib.hashtbl_find(binary_interval_operations(), x51)
  }
  let c_find : (@kernel.Term) -> ((Int64) -> @kernel.Thm raise) raise = fn(x52 : @kernel.Term) -> ((Int64) -> @kernel.Thm raise) raise {
    @lib.hashtbl_find(interval_constants(), x52)
  }
  fn rec_eval(x53 : IntervalFun) -> IntervalFun raise {
    let f = x53
    match f {
      IntervalFun::Int_decimal_const(tm) => IntervalFun::Int_const(mk_float_interval_decimal(pp)(tm))
      IntervalFun::Int_named_const(tm_1) => IntervalFun::Int_const(c_find(tm_1)(pp))
      IntervalFun::Int_pow(n, f1) => {
        let f1_val = rec_eval(f1)
        match f1_val {
          IntervalFun::Int_const(th) => IntervalFun::Int_const(@float_pow.float_interval_pow(pp, n, th))
          _ => IntervalFun::Int_pow(n, f1_val)
        }
      }
      IntervalFun::Int_unary(tm_2, f1_1) => {
        let f1_val_1 = rec_eval(f1_1)
        match f1_val_1 {
          IntervalFun::Int_const(th_1) => IntervalFun::Int_const(u_find(tm_2)(pp)(th_1))
          _ => IntervalFun::Int_unary(tm_2, f1_val_1)
        }
      }
      IntervalFun::Int_binary(tm_3, f1_2, f2) => {
        let t54 = rec_eval(f2)
        let (f1_val_2, f2_val) = (rec_eval(f1_2), t54)
        match f1_val_2 {
          IntervalFun::Int_const(th1) => {
            match f2_val {
              IntervalFun::Int_const(th2) => IntervalFun::Int_const(b_find(tm_3)(pp)(th1)(th2))
              _ => IntervalFun::Int_binary(tm_3, f1_val_2, f2_val)
            }
          }
          _ => IntervalFun::Int_binary(tm_3, f1_val_2, f2_val)
        }
      }
      _ => f
    }
  }
  rec_eval(ifun)
}

///|
/// `build_interval_fun`
pub fn build_interval_fun(x55 : @kernel.Term) -> IntervalFun raise {
  let expr_tm = x55
  if @kernel.is_const(expr_tm) {
    IntervalFun::Int_named_const(expr_tm)
  } else {
    if @kernel.is_var(expr_tm) {
      IntervalFun::Int_var(expr_tm)
    } else {
      let (ltm, r_tm) = @kernel.dest_comb(expr_tm)
      if @kernel.is_const(ltm) {
        if (ltm == @misc_vars.amp_op_real()) {
          let n = @basics.dest_numeral(r_tm)
          IntervalFun::Int_const(@arith_float.mk_float_interval_num(n))
        } else {
          let r_fun = build_interval_fun(r_tm)
          IntervalFun::Int_unary(ltm, r_fun)
        }
      } else {
        let (op, l_tm) = @kernel.dest_comb(ltm)
        let name = (fn(x56 : (String, @kernel.HolType)) -> String raise {
          x56.0
        })(@kernel.dest_const(op))
        if (name == "DECIMAL") {
          IntervalFun::Int_decimal_const(expr_tm)
        } else {
          if (name == "real_pow") {
            let n_1 = @nums.dest_small_numeral(r_tm)
            IntervalFun::Int_pow(n_1, build_interval_fun(l_tm))
          } else {
            if (name == "$") {
              IntervalFun::Int_var(expr_tm)
            } else {
              let lhs = build_interval_fun(l_tm)
              let rhs = build_interval_fun(r_tm)
              IntervalFun::Int_binary(op, lhs, rhs)
            }
          }
        }
      }
    }
  }
}

///|
/// `replace_subexpr`
pub fn replace_subexpr(x57 : IntervalFun, x58 : Int64, x59 : @list.List[IntervalFun]) -> ((Int64, @list.List[IntervalFun])) raise {
  let expr = x57
  let expr_index = x58
  let f_list = x59
  fn replace(x60 : IntervalFun) -> ((Int64, IntervalFun)) raise {
    let f = x60
    if (f == expr) {
      (1L, IntervalFun::Int_ref(expr_index))
    } else {
      match f {
        IntervalFun::Int_pow(k, f1) => {
          let (c, f1_p) = replace(f1)
          (c, IntervalFun::Int_pow(k, f1_p))
        }
        IntervalFun::Int_unary(tm, f1_1) => {
          let (c_1, f1_p_1) = replace(f1_1)
          (c_1, IntervalFun::Int_unary(tm, f1_p_1))
        }
        IntervalFun::Int_binary(tm_1, f1_2, f2) => {
          let (c1, f1_p_2) = replace(f1_2)
          let (c2, f2_p) = replace(f2)
          let t61 = IntervalFun::Int_binary(tm_1, f1_p_2, f2_p)
          (@lib.add63(c1, c2), t61)
        }
        _ => (0L, f)
      }
    }
  }
  let (cs, fs) = @lib.unzip(@lib.map(replace, f_list))
  (@lib.itlist(fn(x64 : Int64, x65 : Int64) -> Int64 raise {
    let s66 = (fn(x62 : Int64) -> ((Int64) -> Int64 raise) raise {
      fn(x63 : Int64) -> Int64 raise {
        @lib.add63(x62, x63)
      }
    })(x64)
    s66(x65)
  }, cs, 0L), fs)
}

///|
/// `is_leaf`
pub fn is_leaf(x67 : IntervalFun) -> Bool raise {
  let f = x67
  match f {
    IntervalFun::Int_pow(_, _) => false
    IntervalFun::Int_unary(_, _) => false
    IntervalFun::Int_binary(_, _, _) => false
    _ => true
  }
}

///|
/// `find_and_replace_all`
pub fn find_and_replace_all(x68 : @list.List[IntervalFun], x69 : @list.List[IntervalFun]) -> ((@list.List[IntervalFun], @list.List[IntervalFun])) raise {
  let f_list = x68
  let acc = x69
  fn find_and_replace(x70 : IntervalFun, x71 : Int64, x72 : @list.List[IntervalFun]) -> ((IntervalFun, (Int64, @list.List[IntervalFun]))) raise {
    let f = x70
    let i = x71
    let f_list_1 = x72
    if is_leaf(f) {
      (f, (0L, f_list_1))
    } else {
      let (expr_1, (c, fs_1)) = match f {
        IntervalFun::Int_pow(k, f1) => find_and_replace(f1, i, f_list_1)
        IntervalFun::Int_unary(tm, f1_1) => find_and_replace(f1_1, i, f_list_1)
        IntervalFun::Int_binary(tm_1, f1_2, f2) => {
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
  fn iterate(x73 : @list.List[IntervalFun], x74 : @list.List[IntervalFun]) -> ((@list.List[IntervalFun], @list.List[IntervalFun])) raise {
    let fs_2 = x73
    let acc_1 = x74
    let i_1 = Int::to_int64(@lib.length(acc_1))
    let (expr_2, (c_1, fs_p)) = find_and_replace(@lib.hd(fs_2), i_1, fs_2)
    if (c_1 > 1L) {
      iterate(fs_p, acc_1.concat(@list.List([expr_2])))
    } else {
      (fs_2, acc_1)
    }
  }
  fn iterate_all(x75 : @list.List[IntervalFun], x76 : @list.List[IntervalFun], x77 : @list.List[IntervalFun]) -> ((@list.List[IntervalFun], @list.List[IntervalFun])) raise {
    let f_list_2 = x75
    let ref_acc = x76
    let f_acc = x77
    match f_list_2 {
      Empty => (f_acc, ref_acc)
      More(f_1, tail=fs_3) => {
        let (fs_p_1, acc_p) = iterate(f_list_2, ref_acc)
        let t78 = f_acc.concat(@list.List([@lib.hd(fs_p_1)]))
        iterate_all(@lib.tl(fs_p_1), acc_p, t78)
      }
    }
  }
  iterate_all(f_list, acc, @list.List([]))
}

///|
/// `eval_interval_fun_list`
pub fn eval_interval_fun_list(x79 : Int64, x80 : (@list.List[IntervalFun], @list.List[IntervalFun]), x81 : @list.List[(@kernel.Term, @kernel.Thm)]) -> @list.List[@kernel.Thm] raise {
  let pp = x79
  let (f_list, refs) = x80
  let vars = x81
  fn eval_refs(x82 : @list.List[IntervalFun], x83 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
    let refs_1 = x82
    let acc = x83
    match refs_1 {
      Empty => acc
      More(r, tail=rs) => {
        let v = eval_interval_fun(pp, r, vars, acc)
        eval_refs(rs, acc.concat(@list.List([v])))
      }
    }
  }
  let rs_1 = eval_refs(refs, @list.List([]))
  @lib.map(fn(x84 : IntervalFun) -> @kernel.Thm raise {
    let f = x84
    eval_interval_fun(pp, f, vars, rs_1)
  }, f_list)
}

///|
/// interval_to_float_interval
fn step_5() -> Unit raise {
  let t86 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@interval_arith.interval_arith()])), @calc_rat.real_arith_tac)
  let t87 = (@term_syntax.parse_term("interval_arith((x : Real), ((lo : Real), (hi : Real))) → interval_arith(lo, ((a : Real), (y : Real))) → interval_arith(hi, ((z : Real), (b : Real))) → interval_arith(x, (a, b))"), t86)
  let th = @bool.undisch_all((fn(x85 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x85.0, x85.1)
  })(t87))
  interval_to_float_interval_c.set(fn(x88 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    let pp = x88
    fn(x89 : @kernel.Thm) -> @kernel.Thm raise {
      let int_th = x89
      let (x_tm, bounds) = @interval_arith.dest_interval_arith(@kernel.concl(int_th))
      let (lo, hi) = @pair.dest_pair(bounds)
      let f_lo = build_interval_fun(lo)
      let f_hi = build_interval_fun(hi)
      let th_lo = eval_interval_fun(pp, f_lo, @list.List([]), @list.List([]))
      let th_hi = eval_interval_fun(pp, f_hi, @list.List([]), @list.List([]))
      let (a_tm, y_tm) = (fn(x90 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
        @pair.dest_pair(@kernel.rand(x90))
      })((fn(x91 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x91)
      })(th_lo))
      let (z_tm, b_tm) = (fn(x92 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
        @pair.dest_pair(@kernel.rand(x92))
      })((fn(x93 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x93)
      })(th_hi))
      let th1 = @kernel.inst_rule(@list.List([(x_tm, @misc_vars.x_var_real()), (lo, @misc_vars.lo_var_real()), (hi, @misc_vars.hi_var_real()), (a_tm, @misc_vars.a_var_real()), (y_tm, @misc_vars.y_var_real()), (z_tm, @misc_vars.z_var_real()), (b_tm, @misc_vars.b_var_real())]), th)
      (fn(x96 : @kernel.Thm) -> @kernel.Thm raise {
        ((x94 : @kernel.Thm) => @misc_functions.my_prove_hyp(int_th, x94))(((x95 : @kernel.Thm) => @misc_functions.my_prove_hyp(th_lo, x95))(x96))
      })(((x97 : @kernel.Thm) => @misc_functions.my_prove_hyp(th_hi, x97))(th1))
    }
  })
}

///|
let interval_to_float_interval_c : @lib.Cell[(Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise] = @lib.Cell::new("interval_to_float_interval")

///|
/// `interval_to_float_interval`
pub fn interval_to_float_interval(x : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  (interval_to_float_interval_c.get())(x)
}

///|
/// `add_constant_interval`
pub fn add_constant_interval(x98 : @kernel.Thm) -> Unit raise {
  let int_th = x98
  let (c_tm, _) = @interval_arith.dest_interval_arith(@kernel.concl(int_th))
  let _ = @misc_functions.assert_msg(@kernel.is_const(c_tm), "add_constant_interval: not a constant")
  let th = interval_to_float_interval(20L)(int_th)
  let approx_array = @lib.array_init(20L, fn(x99 : Int64) -> @kernel.Thm raise {
    let i = x99
    @arith_float.float_interval_round(i, th)
  })
  @lib.hashtbl_add(interval_constants(), c_tm, fn(x100 : Int64) -> @kernel.Thm raise {
    let pp = x100
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
}
