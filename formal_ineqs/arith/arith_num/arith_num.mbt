// Translated from upstream Formal_ineqs/arith/arith_num.hl; edit this file directly.

///|
/// arith_base
fn step_1() -> Unit raise {
  arith_base_c.set(@arith_options.base().val)
}

///|
let arith_base_c : @lib.Cell[Int64] = @lib.Cell::new("arith_base")

///|
/// `Arith_num.arith_base`
pub fn arith_base() -> Int64 {
  arith_base_c.get()
}

///|
/// maximum
fn step_2() -> Unit raise {
  maximum_c.set(arith_base())
}

///|
let maximum_c : @lib.Cell[Int64] = @lib.Cell::new("maximum")

///|
/// `maximum` (not in the signature of its module)
pub fn maximum() -> Int64 {
  maximum_c.get()
}

///|
/// fnum_type
fn step_3() -> Unit raise {
  fnum_type_c.set(@term_syntax.parse_type("(Num) -> Num"))
}

///|
let fnum_type_c : @lib.Cell[@kernel.HolType] = @lib.Cell::new("fnum_type")

///|
/// `fnum_type` (not in the signature of its module)
pub fn fnum_type() -> @kernel.HolType {
  fnum_type_c.get()
}

///|
/// numeral_const
fn step_4() -> Unit raise {
  numeral_const_c.set(@term_syntax.parse_term("NUMERAL"))
}

///|
let numeral_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("numeral_const")

///|
/// `numeral_const` (not in the signature of its module)
pub fn numeral_const() -> @kernel.Term {
  numeral_const_c.get()
}

///|
/// bit0_const
fn step_5() -> Unit raise {
  bit0_const_c.set(@term_syntax.parse_term("BIT0"))
}

///|
let bit0_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bit0_const")

///|
/// `bit0_const` (not in the signature of its module)
pub fn bit0_const() -> @kernel.Term {
  bit0_const_c.get()
}

///|
/// bit1_const
fn step_6() -> Unit raise {
  bit1_const_c.set(@term_syntax.parse_term("BIT1"))
}

///|
let bit1_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("bit1_const")

///|
/// `bit1_const` (not in the signature of its module)
pub fn bit1_const() -> @kernel.Term {
  bit1_const_c.get()
}

///|
/// names_array
fn step_7() -> Unit raise {
  names_array_c.set(@lib.array_init(maximum(), fn(x1 : Int64) -> String raise {
    let i = x1
    ("D" + Int64::to_string(i))
  }))
}

///|
let names_array_c : @lib.Cell[FixedArray[String]] = @lib.Cell::new("names_array")

///|
/// `names_array` (not in the signature of its module)
pub fn names_array() -> FixedArray[String] {
  names_array_c.get()
}

///|
/// num_name
fn step_8() -> Unit raise {
  num_name_c.set(("NUM" + Int64::to_string(arith_base())))
}

///|
let num_name_c : @lib.Cell[String] = @lib.Cell::new("num_name")

///|
/// `num_name` (not in the signature of its module)
pub fn num_name() -> String {
  num_name_c.get()
}

///|
/// num_def
fn step_9() -> Unit raise {
  num_def_c.set(@kernel.new_basic_definition(@basics.mk_eq(@kernel.mk_var(num_name(), fnum_type()), numeral_const())))
}

///|
let num_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_def")

///|
/// `Arith_num.num_def`
pub fn num_def() -> @kernel.Thm {
  num_def_c.get()
}

///|
/// num_const
fn step_10() -> Unit raise {
  num_const_c.set(@kernel.mk_const(num_name(), @list.List([])))
}

///|
let num_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("num_const")

///|
/// `Arith_num.num_const`
pub fn num_const() -> @kernel.Term {
  num_const_c.get()
}

///|
/// num_def_sym
fn step_11() -> Unit raise {
  num_def_sym_c.set(@equal.sym(num_def()))
}

///|
let num_def_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("num_def_sym")

///|
/// `num_def_sym` (not in the signature of its module)
pub fn num_def_sym() -> @kernel.Thm {
  num_def_sym_c.get()
}

///|
/// NUM_THM
fn step_12() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([num_def(), @nums.numeral()]))
  num_thm_c.set(@tactics.prove(@basics.mk_eq(@kernel.mk_comb(num_const(), @misc_vars.n_var_num()), @misc_vars.n_var_num()), t2))
}

///|
let num_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUM_THM")

///|
/// `Arith_num.NUM_THM`
pub fn num_thm() -> @kernel.Thm {
  num_thm_c.get()
}

///|
/// `mk_bit_definition`
pub fn mk_bit_definition(x3 : Int64) -> @kernel.Thm raise {
  let i = x3
  let lhs = @kernel.mk_var(@lib.array_get(names_array(), @lib.int63_to_int(i)), fnum_type())
  let tm1 = @basics.mk_binop(@misc_vars.mul_op_num(), @nums.mk_small_numeral(arith_base()), @misc_vars.n_var_num())
  let tm2 = @basics.mk_binop(@misc_vars.add_op_num(), tm1, @nums.mk_small_numeral(i))
  let rhs = @kernel.mk_abs(@misc_vars.n_var_num(), tm2)
  @kernel.new_basic_definition(@basics.mk_eq(lhs, rhs))
}

///|
/// def_basic_array
fn step_13() -> Unit raise {
  def_basic_array_c.set(@lib.array_init(maximum(), mk_bit_definition))
}

///|
let def_basic_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("def_basic_array")

///|
/// `def_basic_array` (not in the signature of its module)
pub fn def_basic_array() -> FixedArray[@kernel.Thm] {
  def_basic_array_c.get()
}

///|
/// def_array
fn step_14() -> Unit raise {
  def_array_c.set(@lib.array_init(maximum(), fn(x4 : Int64) -> @kernel.Thm raise {
    let i = x4
    let basic = @lib.array_get(def_basic_array(), @lib.int63_to_int(i))
    let th1 = @equal.ap_thm(basic, @misc_vars.n_var_num())
    @kernel.trans(th1, @kernel.beta(@kernel.rand(@kernel.concl(th1))))
  }))
}

///|
let def_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("def_array")

///|
/// `Arith_num.def_array`
pub fn def_array() -> FixedArray[@kernel.Thm] {
  def_array_c.get()
}

///|
/// def_table
fn step_15() -> Unit raise {
  def_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let def_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("def_table")

///|
/// `def_table` (not in the signature of its module)
pub fn def_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  def_table_c.get()
}

///|
/// def_basic_table
fn step_16() -> Unit raise {
  def_basic_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let def_basic_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("def_basic_table")

///|
/// `def_basic_table` (not in the signature of its module)
pub fn def_basic_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  def_basic_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:120
fn step_17() -> Unit raise {
  let i5 = Ref::{ val: 0L }
  let n6 = @lib.sub63(maximum(), 1L)
  while true {
    if (i5.val <= n6) {
      ()
    } else {
      break
    }
    let i = i5.val
    let t7 = @lib.array_get(def_array(), @lib.int63_to_int(i))
    let _ = @lib.hashtbl_add(def_table(), @lib.array_get(names_array(), @lib.int63_to_int(i)), t7)
    let t8 = @lib.array_get(def_basic_array(), @lib.int63_to_int(i))
    @lib.hashtbl_add(def_basic_table(), @lib.array_get(names_array(), @lib.int63_to_int(i)), t8)
    i5.val = @lib.add63(i5.val, 1L)
    ()
  }
  ()
}

///|
/// const_array
fn step_18() -> Unit raise {
  const_array_c.set(@lib.array_init(maximum(), fn(x9 : Int64) -> @kernel.Term raise {
    let i = x9
    @kernel.mk_const(@lib.array_get(names_array(), @lib.int63_to_int(i)), @list.List([]))
  }))
}

///|
let const_array_c : @lib.Cell[FixedArray[@kernel.Term]] = @lib.Cell::new("const_array")

///|
/// `Arith_num.const_array`
pub fn const_array() -> FixedArray[@kernel.Term] {
  const_array_c.get()
}

///|
/// b0_def
fn step_19() -> Unit raise {
  b0_def_c.set(@lib.array_get(def_array(), 0))
}

///|
let b0_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("b0_def")

///|
/// `b0_def` (not in the signature of its module)
pub fn b0_def() -> @kernel.Thm {
  b0_def_c.get()
}

///|
/// b0_const
fn step_20() -> Unit raise {
  b0_const_c.set(@lib.array_get(const_array(), 0))
}

///|
let b0_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("b0_const")

///|
/// `b0_const` (not in the signature of its module)
pub fn b0_const() -> @kernel.Term {
  b0_const_c.get()
}

///|
/// b0_name
fn step_21() -> Unit raise {
  b0_name_c.set(@lib.array_get(names_array(), 0))
}

///|
let b0_name_c : @lib.Cell[String] = @lib.Cell::new("b0_name")

///|
/// `b0_name` (not in the signature of its module)
pub fn b0_name() -> String {
  b0_name_c.get()
}

///|
/// max_const
fn step_22() -> Unit raise {
  max_const_c.set(@nums.mk_small_numeral(maximum()))
}

///|
let max_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("max_const")

///|
/// `max_const` (not in the signature of its module)
pub fn max_const() -> @kernel.Term {
  max_const_c.get()
}

///|
/// ADD_0_n
fn step_23() -> Unit raise {
  let t10 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_num.arith_add()), @arith.add_clauses()]))
  let t11 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@nums.numeral())])), t10)
  add_0_n_c.set(@tactics.prove(@term_syntax.parse_term("_0 + (n : Num) == n"), t11))
}

///|
let add_0_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_0_n")

///|
/// `ADD_0_n` (not in the signature of its module)
pub fn add_0_n() -> @kernel.Thm {
  add_0_n_c.get()
}

///|
/// ADD_n_0
fn step_24() -> Unit raise {
  let t12 = @simp.rewrite_tac(@list.List([@equal.gsym(@calc_num.arith_add()), @arith.add_clauses()]))
  let t13 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@nums.numeral())])), t12)
  add_n_0_c.set(@tactics.prove(@term_syntax.parse_term("(n : Num) + _0 == n"), t13))
}

///|
let add_n_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_n_0")

///|
/// `ADD_n_0` (not in the signature of its module)
pub fn add_n_0() -> @kernel.Thm {
  add_n_0_c.get()
}

///|
/// MUL_n_0
fn step_25() -> Unit raise {
  let t21 = @tactics.disch_then(fn(x19 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x19
    @simp.once_rewrite_tac(@list.List([th]))
  })
  let t18 = @list.List([@simp.rewrite_tac(@list.List([@nums.numeral()])), @tactics.all_tac])
  let t17 = @tactics.subgoal_then(@term_syntax.parse_term("_0 == 0"), fn(x14 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s15 = @tactics.mp_tac(x14)
    fn(x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s15(x16)
    }
  })
  let t22 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@nums.numeral()])), t17), t18), t21), @int.arith_tac)
  mul_n_0_c.set(@tactics.prove(@term_syntax.parse_term("(n : Num) * _0 == 0"), t22))
}

///|
let mul_n_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_n_0")

///|
/// `MUL_n_0` (not in the signature of its module)
pub fn mul_n_0() -> @kernel.Thm {
  mul_n_0_c.get()
}

///|
/// `def_thm`
pub fn def_thm(x23 : Int64) -> @kernel.Thm raise {
  let i = x23
  let bin = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(i)), @misc_vars.n_var_num())
  let bi0 = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(i)), @misc_vars.zero_const())
  let b0n = @kernel.mk_comb(@lib.array_get(const_array(), 0), @misc_vars.n_var_num())
  let rhs = @basics.mk_binop(@misc_vars.add_op_num(), bi0, b0n)
  let t25 = @simp.rewrite_tac(@list.List([mul_n_0(), @arith.add_clauses()]))
  let t24 = @lib.array_get(def_array(), 0)
  let t26 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(def_array(), @lib.int63_to_int(i)), t24])), t25), @int.arith_tac)
  @tactics.prove(@basics.mk_eq(bin, rhs), t26)
}

///|
/// def_thm_array
fn step_26() -> Unit raise {
  def_thm_array_c.set(@lib.array_init(maximum(), def_thm))
}

///|
let def_thm_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("def_thm_array")

///|
/// `Arith_num.def_thm_array`
pub fn def_thm_array() -> FixedArray[@kernel.Thm] {
  def_thm_array_c.get()
}

///|
/// B0_0
fn step_27() -> Unit raise {
  let t27 = @simp.rewrite_tac(@list.List([b0_def(), mul_n_0(), @arith.add_clauses(), @nums.numeral()]))
  b0_0_c.set(@tactics.prove(@basics.mk_eq(@kernel.mk_comb(b0_const(), @misc_vars.zero_const()), @misc_vars.zero_const()), t27))
}

///|
let b0_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B0_0")

///|
/// `B0_0` (not in the signature of its module)
pub fn b0_0() -> @kernel.Thm {
  b0_0_c.get()
}

///|
/// B0_EXPLICIT
fn step_28() -> Unit raise {
  let t29 = @simp.rewrite_tac(@list.List([b0_def(), @arith.add_clauses()]))
  let t28 = @basics.mk_binop(@misc_vars.mul_op_num(), max_const(), @misc_vars.n_var_num())
  b0_explicit_c.set(@tactics.prove(@basics.mk_eq(@kernel.mk_comb(b0_const(), @misc_vars.n_var_num()), t28), t29))
}

///|
let b0_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B0_EXPLICIT")

///|
/// `B0_EXPLICIT` (not in the signature of its module)
pub fn b0_explicit() -> @kernel.Thm {
  b0_explicit_c.get()
}

///|
/// mk_table
fn step_29() -> Unit raise {
  mk_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let mk_table_c : @lib.Cell[@lib.OHashtbl[@num.Num, @kernel.Term]] = @lib.Cell::new("mk_table")

///|
/// `mk_table` (not in the signature of its module)
pub fn mk_table() -> @lib.OHashtbl[@num.Num, @kernel.Term] {
  mk_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:175
fn step_30() -> Unit raise {
  let i30 = Ref::{ val: 0L }
  let n31 = @lib.sub63(maximum(), 1L)
  while true {
    if (i30.val <= n31) {
      ()
    } else {
      break
    }
    let i = i30.val
    let t32 = @lib.array_get(const_array(), @lib.int63_to_int(i))
    @lib.hashtbl_add(mk_table(), @num.num_of_int64(i), t32)
    i30.val = @lib.add63(i30.val, 1L)
    ()
  }
  ()
}

///|
/// max_num
fn step_31() -> Unit raise {
  max_num_c.set(@num.num_of_int64(maximum()))
}

///|
let max_num_c : @lib.Cell[@num.Num] = @lib.Cell::new("max_num")

///|
/// `max_num` (not in the signature of its module)
pub fn max_num() -> @num.Num {
  max_num_c.get()
}

///|
/// mk_numeral_hash
fn step_32() -> Unit raise {
  fn mk_num(x33 : @num.Num) -> @kernel.Term raise {
    let n = x33
    if @num.eq_num(n, @num.num_0) {
      @misc_vars.zero_const()
    } else {
      let m = @num.mod_num(n, max_num())
      let bit = @lib.hashtbl_find(mk_table(), m)
      @kernel.mk_comb(bit, mk_num(@num.quo_num(n, max_num())))
    }
  }
  mk_numeral_hash_c.set(fn(x34 : @num.Num) -> @kernel.Term raise {
    let n_1 = x34
    if @num.lt_num(n_1, @num.num_0) {
      raise Failure("mk_numeral_hash: negative argument")
    } else {
      @kernel.mk_comb(num_const(), mk_num(n_1))
    }
  })
}

///|
let mk_numeral_hash_c : @lib.Cell[(@num.Num) -> @kernel.Term raise] = @lib.Cell::new("mk_numeral_hash")

///|
/// `mk_numeral_hash`
pub fn mk_numeral_hash(x : @num.Num) -> @kernel.Term raise {
  (mk_numeral_hash_c.get())(x)
}

///|
/// mk_numeral_array
fn step_33() -> Unit raise {
  fn mk_num(x35 : @num.Num) -> @kernel.Term raise {
    let n = x35
    if @num.eq_num(n, @num.num_0) {
      @misc_vars.zero_const()
    } else {
      let m = @num.int63_of_num(@num.mod_num(n, max_num()))
      let bit = @lib.array_get(const_array(), @lib.int63_to_int(m))
      @kernel.mk_comb(bit, mk_num(@num.quo_num(n, max_num())))
    }
  }
  mk_numeral_array_c.set(fn(x36 : @num.Num) -> @kernel.Term raise {
    let n_1 = x36
    if @num.lt_num(n_1, @num.num_0) {
      raise Failure("mk_numeral_array: negative argument")
    } else {
      @kernel.mk_comb(num_const(), mk_num(n_1))
    }
  })
}

///|
let mk_numeral_array_c : @lib.Cell[(@num.Num) -> @kernel.Term raise] = @lib.Cell::new("mk_numeral_array")

///|
/// `mk_numeral_array`
pub fn mk_numeral_array(x : @num.Num) -> @kernel.Term raise {
  (mk_numeral_array_c.get())(x)
}

///|
/// mk_small_numeral_array
fn step_34() -> Unit raise {
  fn mk_num(x37 : Int64) -> @kernel.Term raise {
    let n = x37
    if (n == 0L) {
      @misc_vars.zero_const()
    } else {
      let m = @lib.mod63(n, maximum())
      let bit = @lib.array_get(const_array(), @lib.int63_to_int(m))
      @kernel.mk_comb(bit, mk_num(@lib.div63(n, maximum())))
    }
  }
  mk_small_numeral_array_c.set(fn(x38 : Int64) -> @kernel.Term raise {
    let n_1 = x38
    if (n_1 < 0L) {
      raise Failure("mk_small_numeral_array: negative argument")
    } else {
      @kernel.mk_comb(num_const(), mk_num(n_1))
    }
  })
}

///|
let mk_small_numeral_array_c : @lib.Cell[(Int64) -> @kernel.Term raise] = @lib.Cell::new("mk_small_numeral_array")

///|
/// `mk_small_numeral_array`
pub fn mk_small_numeral_array(x : Int64) -> @kernel.Term raise {
  (mk_small_numeral_array_c.get())(x)
}

///|
/// dest_table_num
fn step_35() -> Unit raise {
  dest_table_num_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let dest_table_num_c : @lib.Cell[@lib.OHashtbl[String, @num.Num]] = @lib.Cell::new("dest_table_num")

///|
/// `dest_table_num` (not in the signature of its module)
pub fn dest_table_num() -> @lib.OHashtbl[String, @num.Num] {
  dest_table_num_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:217
fn step_36() -> Unit raise {
  let i39 = Ref::{ val: 0L }
  let n40 = @lib.sub63(maximum(), 1L)
  while true {
    if (i39.val <= n40) {
      ()
    } else {
      break
    }
    let i = i39.val
    let t41 = @num.num_of_int64(i)
    @lib.hashtbl_add(dest_table_num(), @lib.array_get(names_array(), @lib.int63_to_int(i)), t41)
    i39.val = @lib.add63(i39.val, 1L)
    ()
  }
  ()
}

///|
/// max_num
fn step_37() -> Unit raise {
  max_num_v1_c.set(@num.num_of_int64(maximum()))
}

///|
let max_num_v1_c : @lib.Cell[@num.Num] = @lib.Cell::new("max_num")

///|
/// `max_num` (not in the signature of its module)
pub fn max_num_v1() -> @num.Num {
  max_num_v1_c.get()
}

///|
/// `raw_dest_hash`
pub fn raw_dest_hash(x42 : @kernel.Term) -> @num.Num raise {
  let tm = x42
  if (tm == @misc_vars.zero_const()) {
    @num.num_0
  } else {
    let (l, r) = @kernel.dest_comb(tm)
    let n = @num.mult_num(max_num_v1(), raw_dest_hash(r))
    let cn = @kernel.dest_const(l).0
    @num.add_num(n, @lib.hashtbl_find(dest_table_num(), cn))
  }
}

///|
/// `dest_numeral_hash`
pub fn dest_numeral_hash(x43 : @kernel.Term) -> @num.Num raise {
  let tm = x43
  raw_dest_hash(@kernel.rand(tm))
}

///|
/// th_num_conv
fn step_38() -> Unit raise {
  th_num_conv_c.set(@lib.array_init(maximum(), fn(x44 : Int64) -> @kernel.Thm raise {
    let i = x44
    let t45 = @lib.array_get(def_array(), @lib.int63_to_int(i))
    @equal.sym(@bool.spec_all(t45))
  }))
}

///|
let th_num_conv_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("th_num_conv")

///|
/// `th_num_conv` (not in the signature of its module)
pub fn th_num_conv() -> FixedArray[@kernel.Thm] {
  th_num_conv_c.get()
}

///|
/// mod_op_num
fn step_39() -> Unit raise {
  mod_op_num_c.set(@term_syntax.parse_term("MOD"))
}

///|
let mod_op_num_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("mod_op_num")

///|
/// `mod_op_num` (not in the signature of its module)
pub fn mod_op_num() -> @kernel.Term {
  mod_op_num_c.get()
}

///|
/// DIV_BASE
fn step_40() -> Unit raise {
  let h1 = @basics.mk_eq(@basics.mk_binop(@misc_vars.div_op_num(), @misc_vars.m_var_num(), max_const()), @misc_vars.q_var_num())
  let h2 = @basics.mk_eq(@basics.mk_binop(mod_op_num(), @misc_vars.m_var_num(), max_const()), @misc_vars.r_var_num())
  let c = @basics.mk_eq(@misc_vars.m_var_num(), @basics.mk_binop(@misc_vars.add_op_num(), @basics.mk_binop(@misc_vars.mul_op_num(), max_const(), @misc_vars.q_var_num()), @misc_vars.r_var_num()))
  let t46 = @bool.mk_imp(h1, @bool.mk_imp(h2, c))
  div_base_c.set(@bool.undisch_all(@int.arith_rule(t46)))
}

///|
let div_base_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_BASE")

///|
/// `DIV_BASE` (not in the signature of its module)
pub fn div_base() -> @kernel.Thm {
  div_base_c.get()
}

///|
/// ZERO_EQ_ZERO
fn step_41() -> Unit raise {
  let t47 = @term_syntax.parse_term("0 == _0")
  let t48 = @simp.rewrite_conv(@list.List([@nums.numeral()]))
  zero_eq_zero_c.set(@bool.eqt_elim(t48(t47)))
}

///|
let zero_eq_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ZERO_EQ_ZERO")

///|
/// `ZERO_EQ_ZERO` (not in the signature of its module)
pub fn zero_eq_zero() -> @kernel.Thm {
  zero_eq_zero_c.get()
}

///|
/// SYM_ZERO_EQ_ZERO
fn step_42() -> Unit raise {
  sym_zero_eq_zero_c.set(@equal.sym(zero_eq_zero()))
}

///|
let sym_zero_eq_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYM_ZERO_EQ_ZERO")

///|
/// `SYM_ZERO_EQ_ZERO` (not in the signature of its module)
pub fn sym_zero_eq_zero() -> @kernel.Thm {
  sym_zero_eq_zero_c.get()
}

///|
/// SYM_NUM_THM
fn step_43() -> Unit raise {
  sym_num_thm_c.set(@equal.sym(num_thm()))
}

///|
let sym_num_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SYM_NUM_THM")

///|
/// `SYM_NUM_THM` (not in the signature of its module)
pub fn sym_num_thm() -> @kernel.Thm {
  sym_num_thm_c.get()
}

///|
/// `NUMERAL_TO_NUM_CONV`
pub fn numeral_to_num_conv(x49 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x49
  fn raw_conv(x50 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x50
    if (@kernel.rand(tm_1) == @misc_vars.zero_const()) {
      zero_eq_zero()
    } else {
      let th_div = @calc_num.num_div_conv(@basics.mk_binop(@misc_vars.div_op_num(), tm_1, max_const()))
      let th_mod = @calc_num.num_mod_conv(@basics.mk_binop(mod_op_num(), tm_1, max_const()))
      let q_tm = @kernel.rand(@kernel.concl(th_div))
      let r_tm = @kernel.rand(@kernel.concl(th_mod))
      let th0 = @kernel.inst_rule(@list.List([(tm_1, @misc_vars.m_var_num()), (q_tm, @misc_vars.q_var_num()), (r_tm, @misc_vars.r_var_num())]), div_base())
      let th1 = @misc_functions.my_prove_hyp(th_mod, @misc_functions.my_prove_hyp(th_div, th0))
      let r = @nums.dest_small_numeral(r_tm)
      let th2 = @kernel.inst_rule(@list.List([(q_tm, @misc_vars.n_var_num())]), @lib.array_get(th_num_conv(), @lib.int63_to_int(r)))
      let th = @kernel.trans(th1, th2)
      let (ltm, rtm) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th)))
      let r_th = raw_conv(rtm)
      @kernel.trans(th, @equal.ap_term(ltm, r_th))
    }
  }
  if ((fn(x52 : @kernel.Term) -> String raise {
    (fn(x51 : (String, @kernel.HolType)) -> String raise {
      x51.0
    })(@kernel.dest_const(x52))
  })(@kernel.rator(tm)) != "NUMERAL") {
    raise Failure("NUMERAL_TO_NUM_CONV")
  } else {
    let th0_1 = raw_conv(tm)
    let n_tm = @kernel.rand(@kernel.concl(th0_1))
    @kernel.trans(th0_1, @kernel.inst_rule(@list.List([(n_tm, @misc_vars.n_var_num())]), sym_num_thm()))
  }
}

///|
/// replace_numerals
fn step_44() -> Unit raise {
  let t55 = @equal.depth_conv(numeral_to_num_conv)
  replace_numerals_c.set(fn(x56 : @kernel.Term) -> @kernel.Term raise {
    (fn(x54 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.rand((fn(x53 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x53)
      })(x54))
    })(t55(x56))
  })
}

///|
let replace_numerals_c : @lib.Cell[(@kernel.Term) -> @kernel.Term raise] = @lib.Cell::new("replace_numerals")

///|
/// `replace_numerals`
pub fn replace_numerals(x : @kernel.Term) -> @kernel.Term raise {
  (replace_numerals_c.get())(x)
}

///|
/// REPLACE_NUMERALS
fn step_45() -> Unit raise {
  let t57 = @equal.depth_conv(numeral_to_num_conv)
  replace_numerals_v1_c.set((x58 : @kernel.Thm) => @equal.conv_rule(t57, x58))
}

///|
let replace_numerals_v1_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("REPLACE_NUMERALS")

///|
/// `REPLACE_NUMERALS`
pub fn replace_numerals_v1(x : @kernel.Thm) -> @kernel.Thm raise {
  (replace_numerals_v1_c.get())(x)
}

///|
/// `NUM_TO_NUMERAL_CONV`
pub fn num_to_numeral_conv(x59 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x59
  fn raw_conv(x60 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x60
    if (tm_1 == @misc_vars.zero_const()) {
      sym_zero_eq_zero()
    } else {
      let (b_tm, n_tm) = @kernel.dest_comb(tm_1)
      let n_th = raw_conv(n_tm)
      let n_tm_p = @kernel.rand(@kernel.concl(n_th))
      let cb = (fn(x61 : (String, @kernel.HolType)) -> String raise {
        x61.0
      })(@kernel.dest_const(b_tm))
      let th0 = @lib.hashtbl_find(def_table(), cb)
      let th1 = @equal.ap_term(b_tm, n_th)
      let th2 = @kernel.trans(th1, @kernel.inst_rule(@list.List([(n_tm_p, @misc_vars.n_var_num())]), th0))
      let (ltm, rtm) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th2)))
      let mul_th = @calc_num.num_mult_conv(@kernel.rand(ltm))
      let add_th0 = @equal.ap_thm(@equal.ap_term(@misc_vars.add_op_num(), mul_th), rtm)
      let add_th = @kernel.trans(add_th0, @calc_num.num_add_conv(@kernel.rand(@kernel.concl(add_th0))))
      @kernel.trans(th2, add_th)
    }
  }
  let (ltm_1, rtm_1) = @kernel.dest_comb(tm)
  if ((fn(x62 : (String, @kernel.HolType)) -> String raise {
    x62.0
  })(@kernel.dest_const(ltm_1)) != num_name()) {
    raise Failure("NUM_TO_NUMERAL_CONV")
  } else {
    let num_th = @kernel.inst_rule(@list.List([(rtm_1, @misc_vars.n_var_num())]), num_thm())
    let th0_1 = raw_conv(rtm_1)
    @kernel.trans(num_th, th0_1)
  }
}

///|
/// SUC_NUM
fn step_46() -> Unit raise {
  let t64 = @simp.rewrite_tac(@list.List([num_def(), @nums.numeral()]))
  let t63 = @kernel.mk_comb(num_const(), @kernel.mk_comb(@misc_vars.suc_op_num(), @misc_vars.n_var_num()))
  suc_num_c.set(@tactics.prove(@basics.mk_eq(@kernel.mk_comb(@misc_vars.suc_op_num(), @kernel.mk_comb(num_const(), @misc_vars.n_var_num())), t63), t64))
}

///|
let suc_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUC_NUM")

///|
/// `SUC_NUM` (not in the signature of its module)
pub fn suc_num() -> @kernel.Thm {
  suc_num_c.get()
}

///|
/// SUC_0
fn step_47() -> Unit raise {
  let t66 = @simp.rewrite_tac(@list.List([@lib.array_get(def_array(), 1), mul_n_0(), @calc_num.arith_suc(), @nums.numeral(), @calc_num.arith_add()]))
  let t65 = @kernel.mk_comb(@lib.array_get(const_array(), 1), @misc_vars.zero_const())
  suc_0_c.set(@tactics.prove(@basics.mk_eq(@term_syntax.parse_term("SUC(_0)"), t65), t66))
}

///|
let suc_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUC_0")

///|
/// `SUC_0` (not in the signature of its module)
pub fn suc_0() -> @kernel.Thm {
  suc_0_c.get()
}

///|
/// `suc_th`
pub fn suc_th(x67 : Int64) -> @kernel.Thm raise {
  let i = x67
  let cflag = (@lib.add63(i, 1L) >= maximum())
  let suc = if cflag {
    0L
  } else {
    @lib.add63(i, 1L)
  }
  let lhs = @kernel.mk_comb(@misc_vars.suc_op_num(), @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(i)), @misc_vars.n_var_num()))
  let t68 = if cflag {
    @kernel.mk_comb(@misc_vars.suc_op_num(), @misc_vars.n_var_num())
  } else {
    @misc_vars.n_var_num()
  }
  let rhs = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(suc)), t68)
  let t69 = @lib.array_get(def_array(), @lib.int63_to_int(suc))
  let proof : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(def_array(), @lib.int63_to_int(i)), t69])), @int.arith_tac)
  @tactics.prove(@basics.mk_eq(lhs, rhs), proof)
}

///|
/// th_suc_array
fn step_48() -> Unit raise {
  th_suc_array_c.set(@lib.array_init(maximum(), suc_th))
}

///|
let th_suc_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("th_suc_array")

///|
/// `th_suc_array` (not in the signature of its module)
pub fn th_suc_array() -> FixedArray[@kernel.Thm] {
  th_suc_array_c.get()
}

///|
/// th_suc_table
fn step_49() -> Unit raise {
  th_suc_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let th_suc_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("th_suc_table")

///|
/// `th_suc_table` (not in the signature of its module)
pub fn th_suc_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  th_suc_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:331
fn step_50() -> Unit raise {
  let i70 = Ref::{ val: 0L }
  let n71 = @lib.sub63(maximum(), 1L)
  while true {
    if (i70.val <= n71) {
      ()
    } else {
      break
    }
    let i = i70.val
    let t72 = @lib.array_get(th_suc_array(), @lib.int63_to_int(i))
    @lib.hashtbl_add(th_suc_table(), @lib.array_get(names_array(), @lib.int63_to_int(i)), t72)
    i70.val = @lib.add63(i70.val, 1L)
    ()
  }
  ()
}

///|
/// SUC_MAX
fn step_51() -> Unit raise {
  suc_max_c.set(@lib.array_get(th_suc_array(), @lib.int63_to_int(@lib.sub63(maximum(), 1L))))
}

///|
let suc_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUC_MAX")

///|
/// `SUC_MAX` (not in the signature of its module)
pub fn suc_max() -> @kernel.Thm {
  suc_max_c.get()
}

///|
/// bit_max_name
fn step_52() -> Unit raise {
  bit_max_name_c.set(@lib.array_get(names_array(), @lib.int63_to_int(@lib.sub63(maximum(), 1L))))
}

///|
let bit_max_name_c : @lib.Cell[String] = @lib.Cell::new("bit_max_name")

///|
/// `bit_max_name` (not in the signature of its module)
pub fn bit_max_name() -> String {
  bit_max_name_c.get()
}

///|
/// `raw_suc_conv_hash`
pub fn raw_suc_conv_hash(x73 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x73
  let otm = @kernel.rand(tm)
  if (otm == @misc_vars.zero_const()) {
    suc_0()
  } else {
    let (btm, ntm) = @kernel.dest_comb(otm)
    let cn = @kernel.dest_const(btm).0
    if (cn == bit_max_name()) {
      let th = @kernel.inst_rule(@list.List([(ntm, @misc_vars.n_var_num())]), suc_max())
      let (ltm, rtm) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th)))
      @kernel.trans(th, @equal.ap_term(ltm, raw_suc_conv_hash(rtm)))
    } else {
      @kernel.inst_rule(@list.List([(ntm, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_suc_table(), cn))
    }
  }
}

///|
/// `NUM_SUC_HASH_CONV`
pub fn num_suc_hash_conv(x74 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x74
  let ntm = @kernel.rand(@kernel.rand(tm))
  let th = @kernel.inst_rule(@list.List([(ntm, @misc_vars.n_var_num())]), suc_num())
  let (lhs, rhs) = @kernel.dest_eq(@kernel.concl(th))
  if (lhs != tm) {
    raise Failure("NUM_SUC_HASH_CONV")
  } else {
    let (ltm, rtm) = @kernel.dest_comb(rhs)
    @kernel.trans(th, @equal.ap_term(ltm, raw_suc_conv_hash(rtm)))
  }
}

///|
/// EQ_0_NUM
fn step_53() -> Unit raise {
  let t77 = @simp.rewrite_tac(@list.List([num_def(), @nums.numeral()]))
  let t76 = @term_syntax.parse_term("(n : Num) == _0")
  let t75 = @term_syntax.parse_term("_0")
  eq_0_num_c.set(@tactics.prove(@basics.mk_eq(@basics.mk_eq(@kernel.mk_comb(num_const(), @misc_vars.n_var_num()), t75), t76), t77))
}

///|
let eq_0_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_0_NUM")

///|
/// `EQ_0_NUM` (not in the signature of its module)
pub fn eq_0_num() -> @kernel.Thm {
  eq_0_num_c.get()
}

///|
/// EQ_B0_0
fn step_54() -> Unit raise {
  let t80 = @simp.rewrite_tac(@list.List([b0_def(), @arith.add_clauses(), @nums.numeral(), @simp.rewrite_rule(@list.List([@nums.numeral()]))(@arith.mult_eq_0()), @calc_num.arith_eq()]))
  let t79 = @term_syntax.parse_term("(n : Num) == _0")
  let t78 = @term_syntax.parse_term("_0")
  eq_b0_0_c.set(@tactics.prove(@basics.mk_eq(@basics.mk_eq(@kernel.mk_comb(b0_const(), @misc_vars.n_var_num()), t78), t79), t80))
}

///|
let eq_b0_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_B0_0")

///|
/// `EQ_B0_0` (not in the signature of its module)
pub fn eq_b0_0() -> @kernel.Thm {
  eq_b0_0_c.get()
}

///|
/// EQ_0_0
fn step_55() -> Unit raise {
  let t81 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq()]))
  eq_0_0_c.set(@tactics.prove(@term_syntax.parse_term("(_0 == _0) == true"), t81))
}

///|
let eq_0_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_0_0")

///|
/// `EQ_0_0` (not in the signature of its module)
pub fn eq_0_0() -> @kernel.Thm {
  eq_0_0_c.get()
}

///|
/// eq_0_lemma
fn step_56() -> Unit raise {
  let t82 = @int.arith_rule(@term_syntax.parse_term("((a : Num) + (b : Num) == 0) == (a == 0 && b == 0)"))
  eq_0_lemma_c.set(@simp.rewrite_rule(@list.List([@nums.numeral()]))(t82))
}

///|
let eq_0_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eq_0_lemma")

///|
/// `eq_0_lemma` (not in the signature of its module)
pub fn eq_0_lemma() -> @kernel.Thm {
  eq_0_lemma_c.get()
}

///|
/// `eq_0_i`
pub fn eq_0_i(x83 : Int64) -> @kernel.Thm raise {
  let i = x83
  let concl = @basics.mk_eq(@basics.mk_eq(@kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(i)), @misc_vars.n_var_num()), @misc_vars.zero_const()), @misc_vars.f_const())
  @tactics.prove(concl, @simp.rewrite_tac(@list.List([@lib.array_get(def_array(), @lib.int63_to_int(i)), eq_0_lemma(), @nums.numeral(), @calc_num.arith_eq()])))
}

///|
/// th_eq0_array
fn step_57() -> Unit raise {
  th_eq0_array_c.set(@lib.array_init(maximum(), fn(x84 : Int64) -> @kernel.Thm raise {
    let i = x84
    if (i == 0L) {
      eq_0_0()
    } else {
      eq_0_i(i)
    }
  }))
}

///|
let th_eq0_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("th_eq0_array")

///|
/// `th_eq0_array` (not in the signature of its module)
pub fn th_eq0_array() -> FixedArray[@kernel.Thm] {
  th_eq0_array_c.get()
}

///|
/// th_eq0_table
fn step_58() -> Unit raise {
  th_eq0_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let th_eq0_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("th_eq0_table")

///|
/// `th_eq0_table` (not in the signature of its module)
pub fn th_eq0_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  th_eq0_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:383
fn step_59() -> Unit raise {
  let i85 = Ref::{ val: 0L }
  let n86 = @lib.sub63(maximum(), 1L)
  while true {
    if (i85.val <= n86) {
      ()
    } else {
      break
    }
    let i = i85.val
    let t87 = @lib.array_get(th_eq0_array(), @lib.int63_to_int(i))
    @lib.hashtbl_add(th_eq0_table(), @lib.array_get(names_array(), @lib.int63_to_int(i)), t87)
    i85.val = @lib.add63(i85.val, 1L)
    ()
  }
  ()
}

///|
/// `raw_eq0_hash_conv`
pub fn raw_eq0_hash_conv(x88 : @kernel.Term) -> @kernel.Thm raise {
  let rtm = x88
  if (rtm == @misc_vars.zero_const()) {
    eq_0_0()
  } else {
    let (b_tm, n_tm) = @kernel.dest_comb(rtm)
    let cn = (fn(x89 : (String, @kernel.HolType)) -> String raise {
      x89.0
    })(@kernel.dest_const(b_tm))
    if (cn == b0_name()) {
      let th0 = @kernel.inst_rule(@list.List([(n_tm, @misc_vars.n_var_num())]), eq_b0_0())
      let th1 = raw_eq0_hash_conv(n_tm)
      @kernel.trans(th0, th1)
    } else {
      @kernel.inst_rule(@list.List([(n_tm, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_eq0_table(), cn))
    }
  }
}

///|
/// `NUM_EQ0_HASH_CONV`
pub fn num_eq0_hash_conv(x90 : @kernel.Term) -> @kernel.Thm raise {
  let rtm = x90
  let n_tm = @kernel.rand(rtm)
  let th = @kernel.inst_rule(@list.List([(n_tm, @misc_vars.n_var_num())]), eq_0_num())
  @kernel.trans(th, raw_eq0_hash_conv(n_tm))
}

///|
/// PRE_NUM
fn step_60() -> Unit raise {
  let t92 = @simp.rewrite_tac(@list.List([num_def(), @nums.numeral()]))
  let t91 = @kernel.mk_comb(num_const(), @kernel.mk_comb(@misc_vars.pre_op_num(), @misc_vars.n_var_num()))
  pre_num_c.set(@tactics.prove(@basics.mk_eq(@kernel.mk_comb(@misc_vars.pre_op_num(), @kernel.mk_comb(num_const(), @misc_vars.n_var_num())), t91), t92))
}

///|
let pre_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRE_NUM")

///|
/// `PRE_NUM` (not in the signature of its module)
pub fn pre_num() -> @kernel.Thm {
  pre_num_c.get()
}

///|
/// PRE_0
fn step_61() -> Unit raise {
  let t93 = @simp.simp_tac(@list.List([@nums.numeral()]))
  let t94 = @tactics.then_tac(@tactics.mp_tac(@bool.conjunct1(@arith.pre())), t93)
  pre_0_c.set(@tactics.prove(@term_syntax.parse_term("PRE(_0) == _0"), t94))
}

///|
let pre_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRE_0")

///|
/// `PRE_0` (not in the signature of its module)
pub fn pre_0() -> @kernel.Thm {
  pre_0_c.get()
}

///|
/// PRE_B1_0
fn step_62() -> Unit raise {
  let t98 = @simp.rewrite_tac(@list.List([@lib.array_get(def_array(), 1), mul_n_0(), @calc_num.arith_add(), @nums.numeral(), @calc_num.arith_pre(), @calc_num.arith_eq()]))
  let t97 = @term_syntax.parse_term("_0")
  let t95 = @term_syntax.parse_term("_0")
  let t96 = @kernel.mk_comb(@lib.array_get(const_array(), 1), t95)
  pre_b1_0_c.set(@tactics.prove(@basics.mk_eq(@kernel.mk_comb(@term_syntax.parse_term("PRE"), t96), t97), t98))
}

///|
let pre_b1_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRE_B1_0")

///|
/// `PRE_B1_0` (not in the signature of its module)
pub fn pre_b1_0() -> @kernel.Thm {
  pre_b1_0_c.get()
}

///|
/// PRE_B0_n0
fn step_63() -> Unit raise {
  let t106 = @simp.rewrite_tac(@list.List([@nums.numeral(), @calc_num.arith_pre()]))
  let t105 = @tactics.disch_then(fn(x103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x103
    @simp.rewrite_tac(@list.List([th, mul_n_0()]))
  })
  let t107 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([b0_explicit()])), t105), t106)
  let t101 = @term_syntax.parse_term("_0")
  let t100 = @kernel.mk_comb(b0_const(), @term_syntax.parse_term("(n : Num)"))
  let t102 = @basics.mk_eq(@kernel.mk_comb(@term_syntax.parse_term("PRE"), t100), t101)
  let t108 = (@bool.mk_imp(@term_syntax.parse_term("((n : Num) == _0) == true"), t102), t107)
  pre_b0_n0_c.set(@bool.undisch_all((fn(x99 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x99.0, x99.1)
  })(t108)))
}

///|
let pre_b0_n0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRE_B0_n0")

///|
/// `PRE_B0_n0` (not in the signature of its module)
pub fn pre_b0_n0() -> @kernel.Thm {
  pre_b0_n0_c.get()
}

///|
/// PRE_B0_n1
fn step_64() -> Unit raise {
  let t116 = @tactics.then_tac(@simp.rewrite_tac(@list.List([b0_explicit(), @lib.array_get(def_array(), @lib.int63_to_int(@lib.sub63(maximum(), 1L)))])), @int.arith_tac)
  let t113 = @term_syntax.parse_term("PRE((n : Num))")
  let t114 = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(@lib.sub63(maximum(), 1L))), t113)
  let t112 = @kernel.mk_comb(b0_const(), @term_syntax.parse_term("(n : Num)"))
  let t115 = @basics.mk_eq(@kernel.mk_comb(@term_syntax.parse_term("PRE"), t112), t114)
  let t117 = (@bool.mk_imp(@term_syntax.parse_term("((n : Num) == 0) == false"), t115), t116)
  let t109 = @simp.pure_rewrite_rule(@list.List([@nums.numeral()]))
  pre_b0_n1_c.set((fn(x110 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch_all(t109(x110))
  })((fn(x111 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x111.0, x111.1)
  })(t117)))
}

///|
let pre_b0_n1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRE_B0_n1")

///|
/// `PRE_B0_n1` (not in the signature of its module)
pub fn pre_b0_n1() -> @kernel.Thm {
  pre_b0_n1_c.get()
}

///|
/// PRE_lemma
fn step_65() -> Unit raise {
  let t120 = @term_syntax.parse_term("((n : Num) == 0) == false → (SUC((m : Num)) == n) == (PRE(n) == m)")
  let t118 = @simp.pure_rewrite_rule(@list.List([@nums.numeral()]))
  pre_lemma_c.set((fn(x119 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch_all(t118(x119))
  })(@int.arith_rule(t120)))
}

///|
let pre_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRE_lemma")

///|
/// `PRE_lemma` (not in the signature of its module)
pub fn pre_lemma() -> @kernel.Thm {
  pre_lemma_c.get()
}

///|
/// `pre_th`
pub fn pre_th(x121 : Int64) -> @kernel.Thm raise {
  let i = x121
  let pre = @lib.sub63(i, 1L)
  let pre_tm = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(pre)), @misc_vars.n_var_num())
  let suc_tm = @kernel.mk_comb(@misc_vars.suc_op_num(), pre_tm)
  let suc_th_1 = raw_suc_conv_hash(suc_tm)
  let n_tm = @kernel.rand(@kernel.concl(suc_th_1))
  let n0_th = raw_eq0_hash_conv(n_tm)
  let th0 = @kernel.inst_rule(@list.List([(pre_tm, @misc_vars.m_var_num()), (n_tm, @misc_vars.n_var_num())]), pre_lemma())
  @misc_functions.my_prove_hyp(n0_th, @kernel.eq_mp(th0, suc_th_1))
}

///|
/// th_pre_array
fn step_66() -> Unit raise {
  th_pre_array_c.set(@lib.array_init(maximum(), fn(x122 : Int64) -> @kernel.Thm raise {
    let i = x122
    if (i == 0L) {
      @kernel.refl(@term_syntax.parse_term("_0"))
    } else {
      pre_th(i)
    }
  }))
}

///|
let th_pre_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("th_pre_array")

///|
/// `th_pre_array` (not in the signature of its module)
pub fn th_pre_array() -> FixedArray[@kernel.Thm] {
  th_pre_array_c.get()
}

///|
/// th_pre_table
fn step_67() -> Unit raise {
  th_pre_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let th_pre_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("th_pre_table")

///|
/// `th_pre_table` (not in the signature of its module)
pub fn th_pre_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  th_pre_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:448
fn step_68() -> Unit raise {
  let i123 = Ref::{ val: 0L }
  let n124 = @lib.sub63(maximum(), 1L)
  while true {
    if (i123.val <= n124) {
      ()
    } else {
      break
    }
    let i = i123.val
    let t125 = @lib.array_get(th_pre_array(), @lib.int63_to_int(i))
    @lib.hashtbl_add(th_pre_table(), @lib.array_get(names_array(), @lib.int63_to_int(i)), t125)
    i123.val = @lib.add63(i123.val, 1L)
    ()
  }
  ()
}

///|
/// b1_name
fn step_69() -> Unit raise {
  b1_name_c.set(@lib.array_get(names_array(), 1))
}

///|
let b1_name_c : @lib.Cell[String] = @lib.Cell::new("b1_name")

///|
/// `b1_name` (not in the signature of its module)
pub fn b1_name() -> String {
  b1_name_c.get()
}

///|
/// b1_pre_thm
fn step_70() -> Unit raise {
  b1_pre_thm_c.set(@lib.array_get(th_pre_array(), 1))
}

///|
let b1_pre_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("b1_pre_thm")

///|
/// `b1_pre_thm` (not in the signature of its module)
pub fn b1_pre_thm() -> @kernel.Thm {
  b1_pre_thm_c.get()
}

///|
/// `raw_pre_hash_conv`
pub fn raw_pre_hash_conv(x126 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x126
  let otm = @kernel.rand(tm)
  if (otm == @misc_vars.zero_const()) {
    pre_0()
  } else {
    let (btm, ntm) = @kernel.dest_comb(otm)
    let cn = @kernel.dest_const(btm).0
    if (cn == b0_name()) {
      let n_th = raw_eq0_hash_conv(ntm)
      if (@kernel.rand(@kernel.concl(n_th)) == @misc_vars.f_const()) {
        let th0 = @kernel.inst_rule(@list.List([(ntm, @misc_vars.n_var_num())]), pre_b0_n1())
        let th1 = @misc_functions.my_prove_hyp(n_th, th0)
        let (ltm, rtm) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th1)))
        let th2 = raw_pre_hash_conv(rtm)
        @kernel.trans(th1, @equal.ap_term(ltm, th2))
      } else {
        let th = @kernel.inst_rule(@list.List([(ntm, @misc_vars.n_var_num())]), pre_b0_n0())
        @misc_functions.my_prove_hyp(n_th, th)
      }
    } else {
      if (cn == b1_name()) {
        if (ntm == @misc_vars.zero_const()) {
          pre_b1_0()
        } else {
          @kernel.inst_rule(@list.List([(ntm, @misc_vars.n_var_num())]), b1_pre_thm())
        }
      } else {
        @kernel.inst_rule(@list.List([(ntm, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_pre_table(), cn))
      }
    }
  }
}

///|
/// `NUM_PRE_HASH_CONV`
pub fn num_pre_hash_conv(x127 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x127
  let ntm = @kernel.rand(@kernel.rand(tm))
  let th = @kernel.inst_rule(@list.List([(ntm, @misc_vars.n_var_num())]), pre_num())
  let (lhs, rhs) = @kernel.dest_eq(@kernel.concl(th))
  if (lhs != tm) {
    raise Failure("NUM_PRE_HASH_CONV")
  } else {
    let (ltm, rtm) = @kernel.dest_comb(rhs)
    @kernel.trans(th, @equal.ap_term(ltm, raw_pre_hash_conv(rtm)))
  }
}

///|
/// gt0_table
fn step_71() -> Unit raise {
  gt0_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let gt0_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("gt0_table")

///|
/// `gt0_table` (not in the signature of its module)
pub fn gt0_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  gt0_table_c.get()
}

///|
/// GT0_NUM
fn step_72() -> Unit raise {
  let t129 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
  let t130 = (@term_syntax.parse_term("(0 < NUMERAL((n : Num))) == (_0 < n)"), t129)
  let t131 = @simp.rewrite_rule(@list.List([@equal.gsym(num_def())]))
  gt0_num_c.set(t131((fn(x128 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x128.0, x128.1)
  })(t130)))
}

///|
let gt0_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GT0_NUM")

///|
/// `GT0_NUM` (not in the signature of its module)
pub fn gt0_num() -> @kernel.Thm {
  gt0_num_c.get()
}

///|
/// gt0_0
fn step_73() -> Unit raise {
  let t132 = @simp.rewrite_tac(@list.List([@calc_num.arith_lt()]))
  gt0_0_c.set(@tactics.prove(@term_syntax.parse_term("(_0 < _0) == false"), t132))
}

///|
let gt0_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gt0_0")

///|
/// `gt0_0` (not in the signature of its module)
pub fn gt0_0() -> @kernel.Thm {
  gt0_0_c.get()
}

///|
/// gt0_b0
fn step_74() -> Unit raise {
  let t136 = @tactics.then_tac(@simp.rewrite_tac(@list.List([b0_def()])), @int.arith_tac)
  let t135 = @term_syntax.parse_term("0 < (n : Num)")
  let t134 = @kernel.mk_comb(b0_const(), @misc_vars.n_var_num())
  let t137 = (@basics.mk_eq(@basics.mk_binop(@misc_vars.lt_op_num(), @term_syntax.parse_term("0"), t134), t135), t136)
  let t138 = @simp.rewrite_rule(@list.List([@nums.numeral()]))
  gt0_b0_c.set(t138((fn(x133 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x133.0, x133.1)
  })(t137)))
}

///|
let gt0_b0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gt0_b0")

///|
/// `gt0_b0` (not in the signature of its module)
pub fn gt0_b0() -> @kernel.Thm {
  gt0_b0_c.get()
}

///|
/// `gt0_th`
pub fn gt0_th(x139 : Int64) -> @kernel.Thm raise {
  let i = x139
  let bi = @lib.array_get(const_array(), @lib.int63_to_int(i))
  let concl = @basics.mk_eq(@basics.mk_binop(@misc_vars.lt_op_num(), @misc_vars.zero_num(), @kernel.mk_comb(bi, @misc_vars.n_var_num())), @misc_vars.t_const())
  let proof : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(def_array(), @lib.int63_to_int(i))])), @int.arith_tac)
  let t141 = @simp.pure_rewrite_rule(@list.List([@nums.numeral()]))
  t141((fn(x140 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x140.0, x140.1)
  })((concl, proof)))
}

///|
/// Formal_ineqs/arith/arith_num.hl:509
fn step_75() -> Unit raise {
  let i142 = Ref::{ val: 1L }
  let n143 = @lib.sub63(maximum(), 1L)
  while true {
    if (i142.val <= n143) {
      ()
    } else {
      break
    }
    let i = i142.val
    let t144 = gt0_th(i)
    @lib.hashtbl_add(gt0_table(), @lib.array_get(names_array(), @lib.int63_to_int(i)), t144)
    i142.val = @lib.add63(i142.val, 1L)
    ()
  }
  ()
}

///|
/// `raw_gt0_hash_conv`
pub fn raw_gt0_hash_conv(x145 : @kernel.Term) -> @kernel.Thm raise {
  let rtm = x145
  if (rtm == @misc_vars.zero_const()) {
    gt0_0()
  } else {
    let (b_tm, n_tm) = @kernel.dest_comb(rtm)
    let cn = (fn(x146 : (String, @kernel.HolType)) -> String raise {
      x146.0
    })(@kernel.dest_const(b_tm))
    if (cn == b0_name()) {
      let th0 = @kernel.inst_rule(@list.List([(n_tm, @misc_vars.n_var_num())]), gt0_b0())
      let th1 = raw_gt0_hash_conv(n_tm)
      @kernel.trans(th0, th1)
    } else {
      @kernel.inst_rule(@list.List([(n_tm, @misc_vars.n_var_num())]), @lib.hashtbl_find(gt0_table(), cn))
    }
  }
}

///|
/// `NUM_GT0_HASH_CONV`
pub fn num_gt0_hash_conv(x147 : @kernel.Term) -> @kernel.Thm raise {
  let rtm = x147
  let n_tm = @kernel.rand(rtm)
  let th = @kernel.inst_rule(@list.List([(n_tm, @misc_vars.n_var_num())]), gt0_num())
  @kernel.trans(th, raw_gt0_hash_conv(n_tm))
}

///|
/// EQ_NUM
fn step_76() -> Unit raise {
  let t149 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
  let t150 = (@term_syntax.parse_term("(NUMERAL((m : Num)) == NUMERAL((n : Num))) == (m == n)"), t149)
  let t151 = @simp.rewrite_rule(@list.List([@equal.sym(num_def())]))
  eq_num_c.set(t151((fn(x148 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x148.0, x148.1)
  })(t150)))
}

///|
let eq_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_NUM")

///|
/// `EQ_NUM` (not in the signature of its module)
pub fn eq_num() -> @kernel.Thm {
  eq_num_c.get()
}

///|
/// gen_bi_eq_bj
fn step_77() -> Unit raise {
  let t194 = @simp.asm_rewrite_tac(@list.List([]))
  let t193 = @tactics.undisch_tac(@term_syntax.parse_term("(m : Num) * (b : Num) + (i : Num) == (n : Num) * b + (j : Num)"))
  let t192 = @simp.rewrite_tac(@list.List([@arith.add_0()]))
  let t190 = @simp.asm_rewrite_tac(@list.List([]))
  let t188 = @drule.match_mp(@arith.div_eq_0())
  let t191 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x189 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s186 = @tactics.assume_tac(x185)
      fn(x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s186(x187)
      }
    })(t188(x189))
  }), t190), @tactics.all_tac])
  let t184 = @tactics.subgoal_then(@term_syntax.parse_term("DIV((i : Num), (b : Num)) == 0 && DIV((j : Num), b) == 0"), fn(x182 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x182
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t181 = @tactics.disch_then(fn(x179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x179
    @simp.rewrite_tac(@list.List([th]))
  })
  let t176 = @drule.match_mp(@bool.conjunct1(@arith.div_mult_add()))
  let t178 = @tactics.first_assum(fn(x177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s174 = @tactics.mp_tac(x173)
      fn(x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s174(x175)
      }
    })(t176(x177))
  })
  let t172 = @simp.rewrite_tac(@list.List([]))
  let t168 = @term_syntax.parse_term("(x : Num) => DIV(x, (b : Num))")
  let t171 = @tactics.first_assum(fn(x170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x165 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s166 = @tactics.mp_tac(x165)
      fn(x167 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s166(x167)
      }
    })(((x169 : @kernel.Thm) => @equal.ap_term(t168, x169))(x170))
  })
  let t164 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t163 = @list.List([@tactics.then_tac(@tactics.pop_assum(fn(x160 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s161 = @tactics.mp_tac(x160)
    fn(x162 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s161(x162)
    }
  }), @int.arith_tac), @tactics.all_tac])
  let t159 = @tactics.subgoal_then(@term_syntax.parse_term("!((b : Num) == 0)"), fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s157 = @tactics.assume_tac(x156)
    fn(x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s157(x158)
    }
  })
  let t155 = @tactics.pop_assum(fn(x152 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s153 = @tactics.mp_tac(x152)
    fn(x154 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s153(x154)
    }
  })
  let t195 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((b : Num) * (m : Num) + (i : Num) == b * (n : Num) + (j : Num)) == (m * b + i == n * b + j)"))])), @tactics.strip_tac), t155), t159), t163), t164), @tactics.disch_tac), t171), t172), t178), t181), t184), t191), t192), @tactics.disch_tac), t193), t194), @int.arith_tac)
  let aux_th = @tactics.prove(@term_syntax.parse_term("(i : Num) < (b : Num) && (j : Num) < b && !(i == j) → !(b * (m : Num) + i == b * (n : Num) + j)"), t195)
  gen_bi_eq_bj_c.set(fn(x196 : Int64) -> ((Int64) -> @kernel.Thm raise) raise {
    let i = x196
    fn(x197 : Int64) -> @kernel.Thm raise {
      let j = x197
      let bi_m = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(i)), @misc_vars.m_var_num())
      let bj_n = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(j)), @misc_vars.n_var_num())
      let eq_tm = @basics.mk_binop(@misc_vars.eq_op_num(), bi_m, bj_n)
      if (i == j) {
        let t198 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(def_array(), @lib.int63_to_int(i))])), @int.arith_tac)
        @tactics.prove(@basics.mk_eq(eq_tm, @basics.mk_binop(@misc_vars.eq_op_num(), @misc_vars.m_var_num(), @misc_vars.n_var_num())), t198)
      } else {
        let t201 = @tactics.conv_tac(@calc_num.num_reduce_conv)
        let t200 = @tactics.match_mp_tac(aux_th)
        let t199 = @lib.array_get(def_array(), @lib.int63_to_int(j))
        let t202 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(def_array(), @lib.int63_to_int(i)), t199])), t200), t201)
        @tactics.prove(@basics.mk_eq(eq_tm, @misc_vars.f_const()), t202)
      }
    }
  })
}

///|
let gen_bi_eq_bj_c : @lib.Cell[(Int64) -> ((Int64) -> @kernel.Thm raise) raise] = @lib.Cell::new("gen_bi_eq_bj")

///|
/// `gen_bi_eq_bj`
pub fn gen_bi_eq_bj(x : Int64) -> ((Int64) -> @kernel.Thm raise) raise {
  (gen_bi_eq_bj_c.get())(x)
}

///|
/// gen_next_eq_thm
fn step_78() -> Unit raise {
  let suc_eq_th = @int.arith_rule(@term_syntax.parse_term("(SUC((m : Num)) == SUC((n : Num))) == (m == n)"))
  gen_next_eq_thm_c.set(fn(x203 : @kernel.Thm) -> @kernel.Thm raise {
    let th = x203
    let (ltm, n_tm) = (fn(x204 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
      @kernel.dest_comb(@equal.lhand(x204))
    })((fn(x205 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x205)
    })(th))
    let m_tm = @kernel.rand(ltm)
    let th0 = @kernel.inst_rule(@list.List([(m_tm, @misc_vars.m_var_num()), (n_tm, @misc_vars.n_var_num())]), suc_eq_th)
    let suc_m = raw_suc_conv_hash(@kernel.mk_comb(@misc_vars.suc_op_num(), m_tm))
    let suc_n = raw_suc_conv_hash(@kernel.mk_comb(@misc_vars.suc_op_num(), n_tm))
    let th1 = @equal.sym(@kernel.mk_comb_rule(@equal.ap_term(@misc_vars.eq_op_num(), suc_m), suc_n))
    @kernel.trans(@kernel.trans(th1, th0), th)
  })
}

///|
let gen_next_eq_thm_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("gen_next_eq_thm")

///|
/// `gen_next_eq_thm`
pub fn gen_next_eq_thm(x : @kernel.Thm) -> @kernel.Thm raise {
  (gen_next_eq_thm_c.get())(x)
}

///|
/// th_eq_table
fn step_79() -> Unit raise {
  th_eq_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(@lib.mul63(maximum(), maximum()))))
}

///|
let th_eq_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("th_eq_table")

///|
/// `th_eq_table` (not in the signature of its module)
pub fn th_eq_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  th_eq_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:583
fn step_80() -> Unit raise {
  let i206 = Ref::{ val: 0L }
  let n207 = @lib.sub63(maximum(), 1L)
  while true {
    if (i206.val <= n207) {
      ()
    } else {
      break
    }
    let i = i206.val
    let t209 = @equal.land_conv(@equal.sym_conv)
    let sym : (@kernel.Thm) -> @kernel.Thm raise = fn(x211 : @kernel.Thm) -> @kernel.Thm raise {
      ((x208 : @kernel.Thm) => @kernel.inst_rule(@list.List([(@misc_vars.n_var_num(), @misc_vars.m_var_num()), (@misc_vars.m_var_num(), @misc_vars.n_var_num())]), x208))(((x210 : @kernel.Thm) => @equal.conv_rule(t209, x210))(x211))
    }
    let th = Ref::{ val: gen_bi_eq_bj(0L)(i) }
    let name_left = @lib.array_get(names_array(), 0)
    let name_right = @lib.array_get(names_array(), @lib.int63_to_int(i))
    let t212 = th.val
    let _ = @lib.hashtbl_add(th_eq_table(), (name_left + name_right), t212)
    let _ = if (i > 0L) {
      let t213 = sym(th.val)
      @lib.hashtbl_add(th_eq_table(), (name_right + name_left), t213)
    } else {
      ()
    }
    let i214 = Ref::{ val: 1L }
    let n215 = @lib.sub63(@lib.sub63(maximum(), i), 1L)
    while true {
      if (i214.val <= n215) {
        ()
      } else {
        break
      }
      let k = i214.val
      let x = k
      let y = @lib.add63(i, k)
      let name_left_1 = @lib.array_get(names_array(), @lib.int63_to_int(x))
      let name_right_1 = @lib.array_get(names_array(), @lib.int63_to_int(y))
      let _ = {
        th.val = gen_next_eq_thm(th.val)
        ()
      }
      let t216 = th.val
      let _ = @lib.hashtbl_add(th_eq_table(), (name_left_1 + name_right_1), t216)
      if (y > x) {
        let t217 = sym(th.val)
        @lib.hashtbl_add(th_eq_table(), (name_right_1 + name_left_1), t217)
      } else {
        ()
      }
      i214.val = @lib.add63(i214.val, 1L)
      ()
    }
    i206.val = @lib.add63(i206.val, 1L)
    ()
  }
  ()
}

///|
/// eq_0_sym
fn step_81() -> Unit raise {
  let t219 = @simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()]))
  let t220 = (@term_syntax.parse_term("(0 == (n : Num)) == (n == 0)"), t219)
  let t221 = @simp.rewrite_rule(@list.List([@nums.numeral()]))
  eq_0_sym_c.set(t221((fn(x218 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x218.0, x218.1)
  })(t220)))
}

///|
let eq_0_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eq_0_sym")

///|
/// `eq_0_sym` (not in the signature of its module)
pub fn eq_0_sym() -> @kernel.Thm {
  eq_0_sym_c.get()
}

///|
/// `raw_eq_hash_conv`
pub fn raw_eq_hash_conv(x222 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x222
  let (ltm, rtm) = @kernel.dest_comb(tm)
  let ltm_1 = @kernel.rand(ltm)
  if @kernel.is_const(rtm) {
    raw_eq0_hash_conv(ltm_1)
  } else {
    if @kernel.is_const(ltm_1) {
      let th0 = raw_eq0_hash_conv(rtm)
      let th1 = @kernel.inst_rule(@list.List([(rtm, @misc_vars.n_var_num())]), eq_0_sym())
      @kernel.trans(th1, th0)
    } else {
      let (bm_tm, m_tm) = @kernel.dest_comb(ltm_1)
      let (bn_tm, n_tm) = @kernel.dest_comb(rtm)
      let cbm = (fn(x223 : (String, @kernel.HolType)) -> String raise {
        x223.0
      })(@kernel.dest_const(bm_tm))
      let cbn = (fn(x224 : (String, @kernel.HolType)) -> String raise {
        x224.0
      })(@kernel.dest_const(bn_tm))
      let th0_1 = @kernel.inst_rule(@list.List([(m_tm, @misc_vars.m_var_num()), (n_tm, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_eq_table(), (cbm + cbn)))
      if (cbm != cbn) {
        th0_1
      } else {
        let th1_1 = raw_eq_hash_conv(@kernel.rand(@kernel.concl(th0_1)))
        @kernel.trans(th0_1, th1_1)
      }
    }
  }
}

///|
/// `NUM_EQ_HASH_CONV`
pub fn num_eq_hash_conv(x225 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x225
  let (atm, rtm) = @kernel.dest_comb(tm)
  let ltm = @kernel.rand(atm)
  let t226 = (@kernel.rand(rtm), @misc_vars.n_var_num())
  let th = @kernel.inst_rule(@list.List([(@kernel.rand(ltm), @misc_vars.m_var_num()), t226]), eq_num())
  let rtm_1 = @kernel.rand(@kernel.concl(th))
  @kernel.trans(th, raw_eq_hash_conv(rtm_1))
}

///|
/// LT_NUM
fn step_82() -> Unit raise {
  let t228 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
  let t229 = (@term_syntax.parse_term("(NUMERAL((m : Num)) < NUMERAL((n : Num))) == (m < n)"), t228)
  let t230 = @simp.rewrite_rule(@list.List([@equal.sym(num_def())]))
  lt_num_c.set(t230((fn(x227 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x227.0, x227.1)
  })(t229)))
}

///|
let lt_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_NUM")

///|
/// `LT_NUM` (not in the signature of its module)
pub fn lt_num() -> @kernel.Thm {
  lt_num_c.get()
}

///|
/// LE_NUM
fn step_83() -> Unit raise {
  let t232 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
  let t233 = (@term_syntax.parse_term("(NUMERAL((m : Num)) <= NUMERAL((n : Num))) == (m <= n)"), t232)
  let t234 = @simp.rewrite_rule(@list.List([@equal.sym(num_def())]))
  le_num_c.set(t234((fn(x231 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x231.0, x231.1)
  })(t233)))
}

///|
let le_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_NUM")

///|
/// `LE_NUM` (not in the signature of its module)
pub fn le_num() -> @kernel.Thm {
  le_num_c.get()
}

///|
/// LT_n_0
fn step_84() -> Unit raise {
  let t241 = @tactics.disch_then(fn(x239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x239
    @simp.pure_once_rewrite_tac(@list.List([th]))
  })
  let t238 = @list.List([@simp.rewrite_tac(@list.List([@nums.numeral()])), @tactics.all_tac])
  let t242 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("_0 == 0"), fn(x235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s236 = @tactics.mp_tac(x235)
    fn(x237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s236(x237)
    }
  }), t238), t241), @int.arith_tac)
  lt_n_0_c.set(@tactics.prove(@term_syntax.parse_term("((n : Num) < _0) == false"), t242))
}

///|
let lt_n_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_n_0")

///|
/// `LT_n_0` (not in the signature of its module)
pub fn lt_n_0() -> @kernel.Thm {
  lt_n_0_c.get()
}

///|
/// LE_0_n
fn step_85() -> Unit raise {
  let t249 = @tactics.disch_then(fn(x247 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x247
    @simp.pure_once_rewrite_tac(@list.List([th]))
  })
  let t246 = @list.List([@simp.rewrite_tac(@list.List([@nums.numeral()])), @tactics.all_tac])
  let t250 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("_0 == 0"), fn(x243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s244 = @tactics.mp_tac(x243)
    fn(x245 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s244(x245)
    }
  }), t246), t249), @int.arith_tac)
  le_0_n_c.set(@tactics.prove(@term_syntax.parse_term("(_0 <= (n : Num)) == true"), t250))
}

///|
let le_0_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_0_n")

///|
/// `LE_0_n` (not in the signature of its module)
pub fn le_0_n() -> @kernel.Thm {
  le_0_n_c.get()
}

///|
/// SUC_LT_THM
fn step_86() -> Unit raise {
  suc_lt_thm_c.set(@int.arith_rule(@term_syntax.parse_term("(SUC((m : Num)) < SUC((n : Num))) == (m < n)")))
}

///|
let suc_lt_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUC_LT_THM")

///|
/// `SUC_LT_THM` (not in the signature of its module)
pub fn suc_lt_thm() -> @kernel.Thm {
  suc_lt_thm_c.get()
}

///|
/// SUC_LE_THM
fn step_87() -> Unit raise {
  suc_le_thm_c.set(@int.arith_rule(@term_syntax.parse_term("(SUC((m : Num)) <= SUC((n : Num))) == (m <= n)")))
}

///|
let suc_le_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUC_LE_THM")

///|
/// `SUC_LE_THM` (not in the signature of its module)
pub fn suc_le_thm() -> @kernel.Thm {
  suc_le_thm_c.get()
}

///|
/// `gen_0_lt_bi`
pub fn gen_0_lt_bi(x251 : Int64) -> @kernel.Thm raise {
  let i = x251
  let bin = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(i)), @misc_vars.n_var_num())
  let lt_tm = @basics.mk_binop(@misc_vars.lt_op_num(), @misc_vars.zero_num(), bin)
  if (i > 0L) {
    let t255 = (lt_tm, @tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(def_array(), @lib.int63_to_int(i))])), @int.arith_tac))
    let t252 = @simp.pure_rewrite_rule(@list.List([@nums.numeral()]))
    (fn(x253 : @kernel.Thm) -> @kernel.Thm raise {
      t252(@bool.eqt_intro(x253))
    })((fn(x254 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
      @tactics.prove(x254.0, x254.1)
    })(t255))
  } else {
    let t257 = @tactics.then_tac(@simp.rewrite_tac(@list.List([b0_explicit()])), @int.arith_tac)
    let t258 = (@basics.mk_eq(lt_tm, @term_syntax.parse_term("0 < (n : Num)")), t257)
    let t259 = @simp.pure_rewrite_rule(@list.List([@nums.numeral()]))
    t259((fn(x256 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
      @tactics.prove(x256.0, x256.1)
    })(t258))
  }
}

///|
/// th_lt0_table
fn step_88() -> Unit raise {
  th_lt0_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let th_lt0_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("th_lt0_table")

///|
/// `th_lt0_table` (not in the signature of its module)
pub fn th_lt0_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  th_lt0_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:677
fn step_89() -> Unit raise {
  let i260 = Ref::{ val: 0L }
  let n261 = @lib.sub63(maximum(), 1L)
  while true {
    if (i260.val <= n261) {
      ()
    } else {
      break
    }
    let i = i260.val
    let th = gen_0_lt_bi(i)
    let name = @lib.array_get(names_array(), @lib.int63_to_int(i))
    @lib.hashtbl_add(th_lt0_table(), name, th)
    i260.val = @lib.add63(i260.val, 1L)
    ()
  }
  ()
}

///|
/// `gen_bi_lt_bj`
pub fn gen_bi_lt_bj(x262 : Int64, x263 : Int64) -> @kernel.Thm raise {
  let i = x262
  let j = x263
  let bim = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(i)), @misc_vars.m_var_num())
  let bjn = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(j)), @misc_vars.n_var_num())
  let lt_tm = @basics.mk_binop(@misc_vars.lt_op_num(), bim, bjn)
  let rhs = if (i >= j) {
    @basics.mk_binop(@misc_vars.lt_op_num(), @misc_vars.m_var_num(), @misc_vars.n_var_num())
  } else {
    @basics.mk_binop(@misc_vars.le_op_num(), @misc_vars.m_var_num(), @misc_vars.n_var_num())
  }
  let t264 = @lib.array_get(def_array(), @lib.int63_to_int(j))
  let t265 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(def_array(), @lib.int63_to_int(i)), t264])), @int.arith_tac)
  @tactics.prove(@basics.mk_eq(lt_tm, rhs), t265)
}

///|
/// `gen_next_lt_thm`
pub fn gen_next_lt_thm(x266 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x266
  let (ltm, n_tm) = (fn(x267 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
    @kernel.dest_comb(@equal.lhand(x267))
  })((fn(x268 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x268)
  })(th))
  let m_tm = @kernel.rand(ltm)
  let th0 = @kernel.inst_rule(@list.List([(m_tm, @misc_vars.m_var_num()), (n_tm, @misc_vars.n_var_num())]), suc_lt_thm())
  let suc_m = raw_suc_conv_hash(@kernel.mk_comb(@misc_vars.suc_op_num(), m_tm))
  let suc_n = raw_suc_conv_hash(@kernel.mk_comb(@misc_vars.suc_op_num(), n_tm))
  let th1 = @equal.sym(@kernel.mk_comb_rule(@equal.ap_term(@misc_vars.lt_op_num(), suc_m), suc_n))
  @kernel.trans(@kernel.trans(th1, th0), th)
}

///|
/// th_lt_table
fn step_90() -> Unit raise {
  th_lt_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(@lib.mul63(maximum(), maximum()))))
}

///|
let th_lt_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("th_lt_table")

///|
/// `th_lt_table` (not in the signature of its module)
pub fn th_lt_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  th_lt_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:709
fn step_91() -> Unit raise {
  let i269 = Ref::{ val: 0L }
  let n270 = @lib.sub63(maximum(), 1L)
  while true {
    if (i269.val <= n270) {
      ()
    } else {
      break
    }
    let i = i269.val
    let th = Ref::{ val: gen_bi_lt_bj(0L, i) }
    let name_left = @lib.array_get(names_array(), 0)
    let name_right = @lib.array_get(names_array(), @lib.int63_to_int(i))
    let t271 = th.val
    let _ = @lib.hashtbl_add(th_lt_table(), (name_left + name_right), t271)
    let i272 = Ref::{ val: 1L }
    let n273 = @lib.sub63(@lib.sub63(maximum(), i), 1L)
    while true {
      if (i272.val <= n273) {
        ()
      } else {
        break
      }
      let k = i272.val
      let x = k
      let y = @lib.add63(i, k)
      let name_left_1 = @lib.array_get(names_array(), @lib.int63_to_int(x))
      let name_right_1 = @lib.array_get(names_array(), @lib.int63_to_int(y))
      {
        th.val = gen_next_lt_thm(th.val)
        ()
      }
      let t274 = th.val
      @lib.hashtbl_add(th_lt_table(), (name_left_1 + name_right_1), t274)
      i272.val = @lib.add63(i272.val, 1L)
      ()
    }
    i269.val = @lib.add63(i269.val, 1L)
    ()
  }
  ()
}

///|
/// Formal_ineqs/arith/arith_num.hl:724
fn step_92() -> Unit raise {
  let i275 = Ref::{ val: 1L }
  let n276 = @lib.sub63(maximum(), 1L)
  while true {
    if (i275.val <= n276) {
      ()
    } else {
      break
    }
    let i = i275.val
    let th = Ref::{ val: gen_bi_lt_bj(i, 0L) }
    let name_left = @lib.array_get(names_array(), @lib.int63_to_int(i))
    let name_right = @lib.array_get(names_array(), 0)
    let t277 = th.val
    let _ = @lib.hashtbl_add(th_lt_table(), (name_left + name_right), t277)
    let i278 = Ref::{ val: 1L }
    let n279 = @lib.sub63(@lib.sub63(maximum(), i), 1L)
    while true {
      if (i278.val <= n279) {
        ()
      } else {
        break
      }
      let k = i278.val
      let x = @lib.add63(i, k)
      let y = k
      let name_left_1 = @lib.array_get(names_array(), @lib.int63_to_int(x))
      let name_right_1 = @lib.array_get(names_array(), @lib.int63_to_int(y))
      {
        th.val = gen_next_lt_thm(th.val)
        ()
      }
      let t280 = th.val
      @lib.hashtbl_add(th_lt_table(), (name_left_1 + name_right_1), t280)
      i278.val = @lib.add63(i278.val, 1L)
      ()
    }
    i275.val = @lib.add63(i275.val, 1L)
    ()
  }
  ()
}

///|
/// `gen_bi_le_0`
pub fn gen_bi_le_0(x281 : Int64) -> @kernel.Thm raise {
  let i = x281
  let bin = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(i)), @misc_vars.n_var_num())
  let lt_tm = @basics.mk_binop(@misc_vars.le_op_num(), bin, @misc_vars.zero_num())
  if (i > 0L) {
    let t283 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(def_array(), @lib.int63_to_int(i))])), @int.arith_tac)
    let t284 = (@basics.mk_eq(lt_tm, @misc_vars.f_const()), t283)
    let t285 = @simp.pure_rewrite_rule(@list.List([@nums.numeral()]))
    t285((fn(x282 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
      @tactics.prove(x282.0, x282.1)
    })(t284))
  } else {
    let t287 = @tactics.then_tac(@simp.rewrite_tac(@list.List([b0_explicit()])), @int.arith_tac)
    let t288 = (@basics.mk_eq(lt_tm, @term_syntax.parse_term("(n : Num) <= 0")), t287)
    let t289 = @simp.pure_rewrite_rule(@list.List([@nums.numeral()]))
    t289((fn(x286 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
      @tactics.prove(x286.0, x286.1)
    })(t288))
  }
}

///|
/// th_le0_table
fn step_93() -> Unit raise {
  th_le0_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let th_le0_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("th_le0_table")

///|
/// `th_le0_table` (not in the signature of its module)
pub fn th_le0_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  th_le0_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:751
fn step_94() -> Unit raise {
  let i290 = Ref::{ val: 0L }
  let n291 = @lib.sub63(maximum(), 1L)
  while true {
    if (i290.val <= n291) {
      ()
    } else {
      break
    }
    let i = i290.val
    let th = gen_bi_le_0(i)
    let name = @lib.array_get(names_array(), @lib.int63_to_int(i))
    @lib.hashtbl_add(th_le0_table(), name, th)
    i290.val = @lib.add63(i290.val, 1L)
    ()
  }
  ()
}

///|
/// `gen_bi_le_bj`
pub fn gen_bi_le_bj(x292 : Int64, x293 : Int64) -> @kernel.Thm raise {
  let i = x292
  let j = x293
  let bim = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(i)), @misc_vars.m_var_num())
  let bjn = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(j)), @misc_vars.n_var_num())
  let lt_tm = @basics.mk_binop(@misc_vars.le_op_num(), bim, bjn)
  let rhs = if (i > j) {
    @basics.mk_binop(@misc_vars.lt_op_num(), @misc_vars.m_var_num(), @misc_vars.n_var_num())
  } else {
    @basics.mk_binop(@misc_vars.le_op_num(), @misc_vars.m_var_num(), @misc_vars.n_var_num())
  }
  let t294 = @lib.array_get(def_array(), @lib.int63_to_int(j))
  let t295 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(def_array(), @lib.int63_to_int(i)), t294])), @int.arith_tac)
  @tactics.prove(@basics.mk_eq(lt_tm, rhs), t295)
}

///|
/// `gen_next_le_thm`
pub fn gen_next_le_thm(x296 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x296
  let (ltm, n_tm) = (fn(x297 : @kernel.Term) -> (@kernel.Term, @kernel.Term) raise {
    @kernel.dest_comb(@equal.lhand(x297))
  })((fn(x298 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x298)
  })(th))
  let m_tm = @kernel.rand(ltm)
  let th0 = @kernel.inst_rule(@list.List([(m_tm, @misc_vars.m_var_num()), (n_tm, @misc_vars.n_var_num())]), suc_le_thm())
  let suc_m = raw_suc_conv_hash(@kernel.mk_comb(@misc_vars.suc_op_num(), m_tm))
  let suc_n = raw_suc_conv_hash(@kernel.mk_comb(@misc_vars.suc_op_num(), n_tm))
  let th1 = @equal.sym(@kernel.mk_comb_rule(@equal.ap_term(@misc_vars.le_op_num(), suc_m), suc_n))
  @kernel.trans(@kernel.trans(th1, th0), th)
}

///|
/// th_le_table
fn step_95() -> Unit raise {
  th_le_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(@lib.mul63(maximum(), maximum()))))
}

///|
let th_le_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("th_le_table")

///|
/// `th_le_table` (not in the signature of its module)
pub fn th_le_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  th_le_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:783
fn step_96() -> Unit raise {
  let i299 = Ref::{ val: 0L }
  let n300 = @lib.sub63(maximum(), 1L)
  while true {
    if (i299.val <= n300) {
      ()
    } else {
      break
    }
    let i = i299.val
    let th = Ref::{ val: gen_bi_le_bj(0L, i) }
    let name_left = @lib.array_get(names_array(), 0)
    let name_right = @lib.array_get(names_array(), @lib.int63_to_int(i))
    let t301 = th.val
    let _ = @lib.hashtbl_add(th_le_table(), (name_left + name_right), t301)
    let i302 = Ref::{ val: 1L }
    let n303 = @lib.sub63(@lib.sub63(maximum(), i), 1L)
    while true {
      if (i302.val <= n303) {
        ()
      } else {
        break
      }
      let k = i302.val
      let x = k
      let y = @lib.add63(i, k)
      let name_left_1 = @lib.array_get(names_array(), @lib.int63_to_int(x))
      let name_right_1 = @lib.array_get(names_array(), @lib.int63_to_int(y))
      {
        th.val = gen_next_le_thm(th.val)
        ()
      }
      let t304 = th.val
      @lib.hashtbl_add(th_le_table(), (name_left_1 + name_right_1), t304)
      i302.val = @lib.add63(i302.val, 1L)
      ()
    }
    i299.val = @lib.add63(i299.val, 1L)
    ()
  }
  ()
}

///|
/// Formal_ineqs/arith/arith_num.hl:798
fn step_97() -> Unit raise {
  let i305 = Ref::{ val: 1L }
  let n306 = @lib.sub63(maximum(), 1L)
  while true {
    if (i305.val <= n306) {
      ()
    } else {
      break
    }
    let i = i305.val
    let th = Ref::{ val: gen_bi_le_bj(i, 0L) }
    let name_left = @lib.array_get(names_array(), @lib.int63_to_int(i))
    let name_right = @lib.array_get(names_array(), 0)
    let t307 = th.val
    let _ = @lib.hashtbl_add(th_le_table(), (name_left + name_right), t307)
    let i308 = Ref::{ val: 1L }
    let n309 = @lib.sub63(@lib.sub63(maximum(), i), 1L)
    while true {
      if (i308.val <= n309) {
        ()
      } else {
        break
      }
      let k = i308.val
      let x = @lib.add63(i, k)
      let y = k
      let name_left_1 = @lib.array_get(names_array(), @lib.int63_to_int(x))
      let name_right_1 = @lib.array_get(names_array(), @lib.int63_to_int(y))
      {
        th.val = gen_next_le_thm(th.val)
        ()
      }
      let t310 = th.val
      @lib.hashtbl_add(th_le_table(), (name_left_1 + name_right_1), t310)
      i308.val = @lib.add63(i308.val, 1L)
      ()
    }
    i305.val = @lib.add63(i305.val, 1L)
    ()
  }
  ()
}

///|
/// `raw_lt_hash_conv`
pub fn raw_lt_hash_conv(x311 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x311
  let (ltm, rtm) = @kernel.dest_comb(tm)
  let ltm_1 = @kernel.rand(ltm)
  if @kernel.is_const(rtm) {
    @kernel.inst_rule(@list.List([(ltm_1, @misc_vars.n_var_num())]), lt_n_0())
  } else {
    if @kernel.is_const(ltm_1) {
      let (bn_tm, n_tm) = @kernel.dest_comb(rtm)
      let cbn = (fn(x312 : (String, @kernel.HolType)) -> String raise {
        x312.0
      })(@kernel.dest_const(bn_tm))
      let th0 = @kernel.inst_rule(@list.List([(n_tm, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_lt0_table(), cbn))
      if (cbn == b0_name()) {
        let th1 = raw_lt_hash_conv(@kernel.rand(@kernel.concl(th0)))
        @kernel.trans(th0, th1)
      } else {
        th0
      }
    } else {
      let (bm_tm, m_tm) = @kernel.dest_comb(ltm_1)
      let (bn_tm_1, n_tm_1) = @kernel.dest_comb(rtm)
      let cbm = (fn(x313 : (String, @kernel.HolType)) -> String raise {
        x313.0
      })(@kernel.dest_const(bm_tm))
      let cbn_1 = (fn(x314 : (String, @kernel.HolType)) -> String raise {
        x314.0
      })(@kernel.dest_const(bn_tm_1))
      let th0_1 = @kernel.inst_rule(@list.List([(m_tm, @misc_vars.m_var_num()), (n_tm_1, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_lt_table(), (cbm + cbn_1)))
      let op = (fn(x319 : @kernel.Term) -> String raise {
        (fn(x318 : @kernel.Term) -> String raise {
          (fn(x317 : @kernel.Term) -> String raise {
            (fn(x316 : @kernel.Term) -> String raise {
              (fn(x315 : (String, @kernel.HolType)) -> String raise {
                x315.0
              })(@kernel.dest_const(x316))
            })(@kernel.rator(x317))
          })(@kernel.rator(x318))
        })(@kernel.rand(x319))
      })((fn(x320 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x320)
      })(th0_1))
      let th1_1 = if (op == "<") {
        raw_lt_hash_conv(@kernel.rand(@kernel.concl(th0_1)))
      } else {
        raw_le_hash_conv(@kernel.rand(@kernel.concl(th0_1)))
      }
      @kernel.trans(th0_1, th1_1)
    }
  }
}

///|
/// `raw_le_hash_conv`
pub fn raw_le_hash_conv(x321 : @kernel.Term) -> @kernel.Thm raise {
  let tm_1 = x321
  let (ltm_2, rtm_1) = @kernel.dest_comb(tm_1)
  let ltm_3 = @kernel.rand(ltm_2)
  if @kernel.is_const(ltm_3) {
    @kernel.inst_rule(@list.List([(rtm_1, @misc_vars.n_var_num())]), le_0_n())
  } else {
    if @kernel.is_const(rtm_1) {
      let (bn_tm_2, n_tm_2) = @kernel.dest_comb(ltm_3)
      let cbn_2 = (fn(x322 : (String, @kernel.HolType)) -> String raise {
        x322.0
      })(@kernel.dest_const(bn_tm_2))
      let th0_2 = @kernel.inst_rule(@list.List([(n_tm_2, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_le0_table(), cbn_2))
      if (cbn_2 == b0_name()) {
        let th1_2 = raw_le_hash_conv(@kernel.rand(@kernel.concl(th0_2)))
        @kernel.trans(th0_2, th1_2)
      } else {
        th0_2
      }
    } else {
      let (bm_tm_1, m_tm_1) = @kernel.dest_comb(ltm_3)
      let (bn_tm_3, n_tm_3) = @kernel.dest_comb(rtm_1)
      let cbm_1 = (fn(x323 : (String, @kernel.HolType)) -> String raise {
        x323.0
      })(@kernel.dest_const(bm_tm_1))
      let cbn_3 = (fn(x324 : (String, @kernel.HolType)) -> String raise {
        x324.0
      })(@kernel.dest_const(bn_tm_3))
      let th0_3 = @kernel.inst_rule(@list.List([(m_tm_1, @misc_vars.m_var_num()), (n_tm_3, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_le_table(), (cbm_1 + cbn_3)))
      let op_1 = (fn(x329 : @kernel.Term) -> String raise {
        (fn(x328 : @kernel.Term) -> String raise {
          (fn(x327 : @kernel.Term) -> String raise {
            (fn(x326 : @kernel.Term) -> String raise {
              (fn(x325 : (String, @kernel.HolType)) -> String raise {
                x325.0
              })(@kernel.dest_const(x326))
            })(@kernel.rator(x327))
          })(@kernel.rator(x328))
        })(@kernel.rand(x329))
      })((fn(x330 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x330)
      })(th0_3))
      let th1_3 = if (op_1 == "<") {
        raw_lt_hash_conv(@kernel.rand(@kernel.concl(th0_3)))
      } else {
        raw_le_hash_conv(@kernel.rand(@kernel.concl(th0_3)))
      }
      @kernel.trans(th0_3, th1_3)
    }
  }
}

///|
/// `NUM_LT_HASH_CONV`
pub fn num_lt_hash_conv(x331 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x331
  let (atm, rtm) = @kernel.dest_comb(tm)
  let ltm = @kernel.rand(atm)
  let t332 = (@kernel.rand(rtm), @misc_vars.n_var_num())
  let th = @kernel.inst_rule(@list.List([(@kernel.rand(ltm), @misc_vars.m_var_num()), t332]), lt_num())
  let rtm_1 = @kernel.rand(@kernel.concl(th))
  @kernel.trans(th, raw_lt_hash_conv(rtm_1))
}

///|
/// `NUM_LE_HASH_CONV`
pub fn num_le_hash_conv(x333 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x333
  let (atm, rtm) = @kernel.dest_comb(tm)
  let ltm = @kernel.rand(atm)
  let t334 = (@kernel.rand(rtm), @misc_vars.n_var_num())
  let th = @kernel.inst_rule(@list.List([(@kernel.rand(ltm), @misc_vars.m_var_num()), t334]), le_num())
  let rtm_1 = @kernel.rand(@kernel.concl(th))
  @kernel.trans(th, raw_le_hash_conv(rtm_1))
}

///|
/// ADD_NUM
fn step_98() -> Unit raise {
  let t336 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
  let t337 = (@term_syntax.parse_term("NUMERAL((m : Num)) + NUMERAL((n : Num)) == NUMERAL(m + n)"), t336)
  let t338 = @simp.rewrite_rule(@list.List([@equal.gsym(num_def())]))
  add_num_c.set(t338((fn(x335 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x335.0, x335.1)
  })(t337)))
}

///|
let add_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_NUM")

///|
/// `ADD_NUM` (not in the signature of its module)
pub fn add_num() -> @kernel.Thm {
  add_num_c.get()
}

///|
/// CADD_0_n
fn step_99() -> Unit raise {
  let t339 = @simp.rewrite_tac(@list.List([add_0_n()]))
  cadd_0_n_c.set(@tactics.prove(@term_syntax.parse_term("SUC(_0 + (n : Num)) == SUC(n)"), t339))
}

///|
let cadd_0_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CADD_0_n")

///|
/// `CADD_0_n` (not in the signature of its module)
pub fn cadd_0_n() -> @kernel.Thm {
  cadd_0_n_c.get()
}

///|
/// CADD_n_0
fn step_100() -> Unit raise {
  let t340 = @simp.rewrite_tac(@list.List([add_n_0()]))
  cadd_n_0_c.set(@tactics.prove(@term_syntax.parse_term("SUC((n : Num) + _0) == SUC(n)"), t340))
}

///|
let cadd_n_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CADD_n_0")

///|
/// `CADD_n_0` (not in the signature of its module)
pub fn cadd_n_0() -> @kernel.Thm {
  cadd_n_0_c.get()
}

///|
/// B0_SUC
fn step_101() -> Unit raise {
  let t342 = @tactics.then_tac(@simp.rewrite_tac(@list.List([b0_explicit()])), @int.arith_tac)
  let t341 = @basics.mk_binop(@misc_vars.add_op_num(), max_const(), @kernel.mk_comb(b0_const(), @misc_vars.n_var_num()))
  b0_suc_c.set(@tactics.prove(@basics.mk_eq(@kernel.mk_comb(b0_const(), @kernel.mk_comb(@misc_vars.suc_op_num(), @misc_vars.n_var_num())), t341), t342))
}

///|
let b0_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B0_SUC")

///|
/// `B0_SUC` (not in the signature of its module)
pub fn b0_suc() -> @kernel.Thm {
  b0_suc_c.get()
}

///|
/// B0_ADD
fn step_102() -> Unit raise {
  let t345 = @tactics.then_tac(@simp.rewrite_tac(@list.List([b0_explicit()])), @int.arith_tac)
  let t344 = @kernel.mk_comb(b0_const(), @basics.mk_binop(@misc_vars.add_op_num(), @misc_vars.m_var_num(), @misc_vars.n_var_num()))
  let t343 = @kernel.mk_comb(b0_const(), @misc_vars.n_var_num())
  b0_add_c.set(@tactics.prove(@basics.mk_eq(@basics.mk_binop(@misc_vars.add_op_num(), @kernel.mk_comb(b0_const(), @misc_vars.m_var_num()), t343), t344), t345))
}

///|
let b0_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("B0_ADD")

///|
/// `B0_ADD` (not in the signature of its module)
pub fn b0_add() -> @kernel.Thm {
  b0_add_c.get()
}

///|
/// SUC_ADD_RIGHT
fn step_103() -> Unit raise {
  suc_add_right_c.set(@tactics.prove(@term_syntax.parse_term("SUC((m : Num) + (n : Num)) == m + SUC(n)"), @int.arith_tac))
}

///|
let suc_add_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUC_ADD_RIGHT")

///|
/// `SUC_ADD_RIGHT` (not in the signature of its module)
pub fn suc_add_right() -> @kernel.Thm {
  suc_add_right_c.get()
}

///|
/// `th_add_right_next`
pub fn th_add_right_next(x346 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x346
  let (lhs, rhs) = @kernel.dest_eq(@kernel.concl(th))
  let (ltm, rtm) = @kernel.dest_comb(rhs)
  let cn = @kernel.dest_const(ltm).0
  let suc_th_1 = @equal.ap_term(@misc_vars.suc_op_num(), th)
  let th_rhs = @kernel.inst_rule(@list.List([(rtm, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_suc_table(), cn))
  let (ltm_1, rarg) = @kernel.dest_comb(lhs)
  let larg = @kernel.rand(ltm_1)
  let th1 = @kernel.inst_rule(@list.List([(larg, @misc_vars.m_var_num()), (rarg, @misc_vars.n_var_num())]), suc_add_right())
  let cn_1 = @kernel.dest_const(@kernel.rator(rarg)).0
  let th2 = @lib.hashtbl_find(th_suc_table(), cn_1)
  let th_lhs = @kernel.trans(th1, @equal.ap_term(ltm_1, th2))
  @kernel.trans(@kernel.trans(@equal.sym(th_lhs), suc_th_1), th_rhs)
}

///|
/// th_add_array
fn step_104() -> Unit raise {
  let t347 = @kernel.refl(@misc_vars.zero_const())
  th_add_array_c.set(@lib.array_make(@lib.mul63(maximum(), maximum()), t347))
}

///|
let th_add_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("th_add_array")

///|
/// `th_add_array` (not in the signature of its module)
pub fn th_add_array() -> FixedArray[@kernel.Thm] {
  th_add_array_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:935
fn step_105() -> Unit raise {
  let i348 = Ref::{ val: 0L }
  let n349 = @lib.sub63(maximum(), 1L)
  while true {
    if (i348.val <= n349) {
      ()
    } else {
      break
    }
    let i = i348.val
    let th0 = if (i == 0L) {
      b0_add()
    } else {
      let t350 = @lib.array_get(th_add_array(), @lib.int63_to_int(i))
      @kernel.inst_rule(@list.List([(@misc_vars.n_var_num(), @misc_vars.m_var_num()), (@misc_vars.m_var_num(), @misc_vars.n_var_num())]), @simp.once_rewrite_rule(@list.List([@arith.add_ac()]))(t350))
    }
    let _ = @lib.array_set(th_add_array(), @lib.int63_to_int(@lib.mul63(i, maximum())), th0)
    let i351 = Ref::{ val: 1L }
    let n352 = @lib.sub63(maximum(), 1L)
    while true {
      if (i351.val <= n352) {
        ()
      } else {
        break
      }
      let j = i351.val
      let t353 = th_add_right_next(@lib.array_get(th_add_array(), @lib.int63_to_int(@lib.sub63(@lib.add63(@lib.mul63(i, maximum()), j), 1L))))
      @lib.array_set(th_add_array(), @lib.int63_to_int(@lib.add63(@lib.mul63(i, maximum()), j)), t353)
      i351.val = @lib.add63(i351.val, 1L)
      ()
    }
    i348.val = @lib.add63(i348.val, 1L)
    ()
  }
  ()
}

///|
/// `th_cadd`
pub fn th_cadd(x354 : Int64, x355 : Int64) -> @kernel.Thm raise {
  let i = x354
  let j = x355
  let add_th = @lib.array_get(th_add_array(), @lib.int63_to_int(@lib.add63(@lib.mul63(i, maximum()), j)))
  let th0 = @equal.ap_term(@misc_vars.suc_op_num(), add_th)
  let (ltm, rtm) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th0)))
  let (ltm_1, rtm_1) = @kernel.dest_comb(rtm)
  let cn = @kernel.dest_const(ltm_1).0
  let suc_th_1 = @kernel.inst_rule(@list.List([(rtm_1, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_suc_table(), cn))
  @kernel.trans(th0, suc_th_1)
}

///|
/// th_cadd_array
fn step_106() -> Unit raise {
  let t356 = @kernel.refl(@misc_vars.zero_const())
  th_cadd_array_c.set(@lib.array_make(@lib.mul63(maximum(), maximum()), t356))
}

///|
let th_cadd_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("th_cadd_array")

///|
/// `th_cadd_array` (not in the signature of its module)
pub fn th_cadd_array() -> FixedArray[@kernel.Thm] {
  th_cadd_array_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:961
fn step_107() -> Unit raise {
  let i357 = Ref::{ val: 0L }
  let n358 = @lib.sub63(maximum(), 1L)
  while true {
    if (i357.val <= n358) {
      ()
    } else {
      break
    }
    let i = i357.val
    let i359 = Ref::{ val: 0L }
    let n360 = @lib.sub63(maximum(), 1L)
    while true {
      if (i359.val <= n360) {
        ()
      } else {
        break
      }
      let j = i359.val
      let t361 = th_cadd(i, j)
      @lib.array_set(th_cadd_array(), @lib.int63_to_int(@lib.add63(@lib.mul63(i, maximum()), j)), t361)
      i359.val = @lib.add63(i359.val, 1L)
      ()
    }
    i357.val = @lib.add63(i357.val, 1L)
    ()
  }
  ()
}

///|
/// th_add_table
fn step_108() -> Unit raise {
  th_add_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(@lib.mul63(maximum(), maximum()))))
}

///|
let th_add_table_c : @lib.Cell[@lib.OHashtbl[String, (@kernel.Thm, Bool)]] = @lib.Cell::new("th_add_table")

///|
/// `th_add_table` (not in the signature of its module)
pub fn th_add_table() -> @lib.OHashtbl[String, (@kernel.Thm, Bool)] {
  th_add_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:969
fn step_109() -> Unit raise {
  let i362 = Ref::{ val: 0L }
  let n363 = @lib.sub63(maximum(), 1L)
  while true {
    if (i362.val <= n363) {
      ()
    } else {
      break
    }
    let i = i362.val
    let i364 = Ref::{ val: 0L }
    let n365 = @lib.sub63(maximum(), 1L)
    while true {
      if (i364.val <= n365) {
        ()
      } else {
        break
      }
      let j = i364.val
      let t366 = @lib.array_get(names_array(), @lib.int63_to_int(j))
      let name = (@lib.array_get(names_array(), @lib.int63_to_int(i)) + t366)
      let th = @lib.array_get(th_add_array(), @lib.int63_to_int(@lib.add63(@lib.mul63(i, maximum()), j)))
      let cflag = (@lib.add63(i, j) >= maximum())
      @lib.hashtbl_add(th_add_table(), name, (th, cflag))
      i364.val = @lib.add63(i364.val, 1L)
      ()
    }
    i362.val = @lib.add63(i362.val, 1L)
    ()
  }
  ()
}

///|
/// th_cadd_table
fn step_110() -> Unit raise {
  th_cadd_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(@lib.mul63(maximum(), maximum()))))
}

///|
let th_cadd_table_c : @lib.Cell[@lib.OHashtbl[String, (@kernel.Thm, Bool)]] = @lib.Cell::new("th_cadd_table")

///|
/// `th_cadd_table` (not in the signature of its module)
pub fn th_cadd_table() -> @lib.OHashtbl[String, (@kernel.Thm, Bool)] {
  th_cadd_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:980
fn step_111() -> Unit raise {
  let i367 = Ref::{ val: 0L }
  let n368 = @lib.sub63(maximum(), 1L)
  while true {
    if (i367.val <= n368) {
      ()
    } else {
      break
    }
    let i = i367.val
    let i369 = Ref::{ val: 0L }
    let n370 = @lib.sub63(maximum(), 1L)
    while true {
      if (i369.val <= n370) {
        ()
      } else {
        break
      }
      let j = i369.val
      let t371 = @lib.array_get(names_array(), @lib.int63_to_int(j))
      let name = (@lib.array_get(names_array(), @lib.int63_to_int(i)) + t371)
      let th = @lib.array_get(th_cadd_array(), @lib.int63_to_int(@lib.add63(@lib.mul63(i, maximum()), j)))
      let cflag = (@lib.add63(@lib.add63(i, j), 1L) >= maximum())
      @lib.hashtbl_add(th_cadd_table(), name, (th, cflag))
      i369.val = @lib.add63(i369.val, 1L)
      ()
    }
    i367.val = @lib.add63(i367.val, 1L)
    ()
  }
  ()
}

///|
/// `raw_add_conv_hash`
pub fn raw_add_conv_hash(x372 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x372
  let (atm, rtm) = @kernel.dest_comb(tm)
  let ltm = @kernel.rand(atm)
  if (ltm == @misc_vars.zero_const()) {
    @kernel.inst_rule(@list.List([(rtm, @misc_vars.n_var_num())]), add_0_n())
  } else {
    if (rtm == @misc_vars.zero_const()) {
      @kernel.inst_rule(@list.List([(ltm, @misc_vars.n_var_num())]), add_n_0())
    } else {
      let (lbit, larg) = @kernel.dest_comb(ltm)
      let (rbit, rarg) = @kernel.dest_comb(rtm)
      let t373 = @kernel.dest_const(rbit).0
      let name = (@kernel.dest_const(lbit).0 + t373)
      let (th0, cflag) = @lib.hashtbl_find(th_add_table(), name)
      let th = @kernel.inst_rule(@list.List([(larg, @misc_vars.m_var_num()), (rarg, @misc_vars.n_var_num())]), th0)
      let (ltm_1, rtm_1) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th)))
      if cflag {
        @kernel.trans(th, @equal.ap_term(ltm_1, raw_adc_conv_hash(rtm_1)))
      } else {
        @kernel.trans(th, @equal.ap_term(ltm_1, raw_add_conv_hash(rtm_1)))
      }
    }
  }
}

///|
/// `raw_adc_conv_hash`
pub fn raw_adc_conv_hash(x374 : @kernel.Term) -> @kernel.Thm raise {
  let tm_1 = x374
  let (atm_1, rtm_2) = @kernel.dest_comb(@kernel.rand(tm_1))
  let ltm_2 = @kernel.rand(atm_1)
  if (ltm_2 == @misc_vars.zero_const()) {
    let th_1 = @kernel.inst_rule(@list.List([(rtm_2, @misc_vars.n_var_num())]), cadd_0_n())
    @kernel.trans(th_1, raw_suc_conv_hash(@kernel.rand(@kernel.concl(th_1))))
  } else {
    if (rtm_2 == @misc_vars.zero_const()) {
      let th_2 = @kernel.inst_rule(@list.List([(ltm_2, @misc_vars.n_var_num())]), cadd_n_0())
      @kernel.trans(th_2, raw_suc_conv_hash(@kernel.rand(@kernel.concl(th_2))))
    } else {
      let (lbit_1, larg_1) = @kernel.dest_comb(ltm_2)
      let (rbit_1, rarg_1) = @kernel.dest_comb(rtm_2)
      let t375 = @kernel.dest_const(rbit_1).0
      let name_1 = (@kernel.dest_const(lbit_1).0 + t375)
      let (th0_1, cflag_1) = @lib.hashtbl_find(th_cadd_table(), name_1)
      let th_3 = @kernel.inst_rule(@list.List([(larg_1, @misc_vars.m_var_num()), (rarg_1, @misc_vars.n_var_num())]), th0_1)
      let (ltm_3, rtm_3) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th_3)))
      if cflag_1 {
        @kernel.trans(th_3, @equal.ap_term(ltm_3, raw_adc_conv_hash(rtm_3)))
      } else {
        @kernel.trans(th_3, @equal.ap_term(ltm_3, raw_add_conv_hash(rtm_3)))
      }
    }
  }
}

///|
/// `NUM_ADD_HASH_CONV`
pub fn num_add_hash_conv(x376 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x376
  let (atm, rtm) = @kernel.dest_comb(tm)
  let ltm = @kernel.rand(atm)
  let t377 = (@kernel.rand(rtm), @misc_vars.n_var_num())
  let th = @kernel.inst_rule(@list.List([(@kernel.rand(ltm), @misc_vars.m_var_num()), t377]), add_num())
  let (ltm_1, rtm_1) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th)))
  @kernel.trans(th, @equal.ap_term(ltm_1, raw_add_conv_hash(rtm_1)))
}

///|
/// SUB_NUM
fn step_112() -> Unit raise {
  let t380 = @simp.rewrite_tac(@list.List([num_def(), @nums.numeral()]))
  let t379 = @kernel.mk_comb(num_const(), @basics.mk_binop(@misc_vars.sub_op_num(), @misc_vars.m_var_num(), @misc_vars.n_var_num()))
  let t378 = @kernel.mk_comb(num_const(), @misc_vars.n_var_num())
  sub_num_c.set(@tactics.prove(@basics.mk_eq(@basics.mk_binop(@misc_vars.sub_op_num(), @kernel.mk_comb(num_const(), @misc_vars.m_var_num()), t378), t379), t380))
}

///|
let sub_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_NUM")

///|
/// `SUB_NUM` (not in the signature of its module)
pub fn sub_num() -> @kernel.Thm {
  sub_num_c.get()
}

///|
/// SUB_lemma1
fn step_113() -> Unit raise {
  let t381 = @term_syntax.parse_term("(n : Num) + (t : Num) == (m : Num) → m - n == t")
  sub_lemma1_c.set(@bool.undisch_all(@int.arith_rule(t381)))
}

///|
let sub_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_lemma1")

///|
/// `SUB_lemma1` (not in the signature of its module)
pub fn sub_lemma1() -> @kernel.Thm {
  sub_lemma1_c.get()
}

///|
/// SUB_lemma2
fn step_114() -> Unit raise {
  let t384 = @term_syntax.parse_term("(m : Num) + (t : Num) == (n : Num) → m - n == 0")
  let t382 = @simp.rewrite_rule(@list.List([@nums.numeral()]))
  sub_lemma2_c.set((fn(x383 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch_all(t382(x383))
  })(@int.arith_rule(t384)))
}

///|
let sub_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB_lemma2")

///|
/// `SUB_lemma2` (not in the signature of its module)
pub fn sub_lemma2() -> @kernel.Thm {
  sub_lemma2_c.get()
}

///|
/// LE_lemma
fn step_115() -> Unit raise {
  let t385 = @term_syntax.parse_term("(n : Num) + (t : Num) == (m : Num) → n <= m")
  le_lemma_c.set(@bool.undisch_all(@int.arith_rule(t385)))
}

///|
let le_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LE_lemma")

///|
/// `LE_lemma` (not in the signature of its module)
pub fn le_lemma() -> @kernel.Thm {
  le_lemma_c.get()
}

///|
/// `raw_sub_hash_conv`
pub fn raw_sub_hash_conv(x386 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x386
  let (ltm, n_tm) = @kernel.dest_comb(tm)
  let m_tm = @kernel.rand(ltm)
  let m = raw_dest_hash(m_tm)
  let n = raw_dest_hash(n_tm)
  let t = @num.sub_num(m, n)
  if @num.ge_num(t, @num.num_0) {
    let t_tm = @kernel.rand(mk_numeral_array(t))
    let th0 = @kernel.inst_rule(@list.List([(n_tm, @misc_vars.n_var_num()), (t_tm, @misc_vars.t_var_num()), (m_tm, @misc_vars.m_var_num())]), sub_lemma1())
    let th_add = raw_add_conv_hash(@basics.mk_binop(@misc_vars.add_op_num(), n_tm, t_tm))
    @misc_functions.my_prove_hyp(th_add, th0)
  } else {
    let t_tm_1 = @kernel.rand(mk_numeral_array(@num.abs_num(t)))
    let th0_1 = @kernel.inst_rule(@list.List([(m_tm, @misc_vars.m_var_num()), (t_tm_1, @misc_vars.t_var_num()), (n_tm, @misc_vars.n_var_num())]), sub_lemma2())
    let th_add_1 = raw_add_conv_hash(@basics.mk_binop(@misc_vars.add_op_num(), m_tm, t_tm_1))
    @misc_functions.my_prove_hyp(th_add_1, th0_1)
  }
}

///|
/// `raw_sub_and_le_hash_conv`
pub fn raw_sub_and_le_hash_conv(x387 : @kernel.Term, x388 : @kernel.Term) -> ((@kernel.Thm, @kernel.Thm)) raise {
  let tm1 = x387
  let tm2 = x388
  let m = raw_dest_hash(tm1)
  let n = raw_dest_hash(tm2)
  let t = @num.sub_num(m, n)
  if @num.ge_num(t, @num.num_0) {
    let t_tm = @kernel.rand(mk_numeral_array(t))
    let inst : (@kernel.Thm) -> @kernel.Thm raise = (x389 : @kernel.Thm) => @kernel.inst_rule(@list.List([(tm2, @misc_vars.n_var_num()), (t_tm, @misc_vars.t_var_num()), (tm1, @misc_vars.m_var_num())]), x389)
    let th_sub = inst(sub_lemma1())
    let th_le = inst(le_lemma())
    let th_add = raw_add_conv_hash(@basics.mk_binop(@misc_vars.add_op_num(), tm2, t_tm))
    let t390 = @misc_functions.my_prove_hyp(th_add, th_le)
    (@misc_functions.my_prove_hyp(th_add, th_sub), t390)
  } else {
    let t_tm_1 = @kernel.rand(mk_numeral_array(@num.abs_num(t)))
    let inst_1 : (@kernel.Thm) -> @kernel.Thm raise = (x391 : @kernel.Thm) => @kernel.inst_rule(@list.List([(tm2, @misc_vars.m_var_num()), (t_tm_1, @misc_vars.t_var_num()), (tm1, @misc_vars.n_var_num())]), x391)
    let th_sub_1 = inst_1(sub_lemma1())
    let th_le_1 = inst_1(le_lemma())
    let th_add_1 = raw_add_conv_hash(@basics.mk_binop(@misc_vars.add_op_num(), tm1, t_tm_1))
    let t392 = @misc_functions.my_prove_hyp(th_add_1, th_le_1)
    (@misc_functions.my_prove_hyp(th_add_1, th_sub_1), t392)
  }
}

///|
/// `NUM_SUB_HASH_CONV`
pub fn num_sub_hash_conv(x393 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x393
  let (atm, rtm) = @kernel.dest_comb(tm)
  let ltm = @kernel.rand(atm)
  let t394 = (@kernel.rand(rtm), @misc_vars.n_var_num())
  let th = @kernel.inst_rule(@list.List([(@kernel.rand(ltm), @misc_vars.m_var_num()), t394]), sub_num())
  let (ltm_1, rtm_1) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th)))
  @kernel.trans(th, @equal.ap_term(ltm_1, raw_sub_hash_conv(rtm_1)))
}

///|
/// MUL_NUM
fn step_116() -> Unit raise {
  let t397 = @simp.rewrite_tac(@list.List([num_def(), @nums.numeral()]))
  let t396 = @kernel.mk_comb(num_const(), @basics.mk_binop(@misc_vars.mul_op_num(), @misc_vars.m_var_num(), @misc_vars.n_var_num()))
  let t395 = @kernel.mk_comb(num_const(), @misc_vars.n_var_num())
  mul_num_c.set(@tactics.prove(@basics.mk_eq(@basics.mk_binop(@misc_vars.mul_op_num(), @kernel.mk_comb(num_const(), @misc_vars.m_var_num()), t395), t396), t397))
}

///|
let mul_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_NUM")

///|
/// `MUL_NUM` (not in the signature of its module)
pub fn mul_num() -> @kernel.Thm {
  mul_num_c.get()
}

///|
/// MUL_0_n
fn step_117() -> Unit raise {
  let t400 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t399 = @simp.rewrite_tac(@list.List([num_def()]))
  let t398 = @simp.once_rewrite_tac(@list.List([@equal.gsym(mul_num())]))
  let t401 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(num_thm())])), t398), t399), t400)
  mul_0_n_c.set(@tactics.prove(@term_syntax.parse_term("_0 * (n : Num) == _0"), t401))
}

///|
let mul_0_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_0_n")

///|
/// `MUL_0_n` (not in the signature of its module)
pub fn mul_0_n() -> @kernel.Thm {
  mul_0_n_c.get()
}

///|
/// MUL_n_0
fn step_118() -> Unit raise {
  mul_n_0_v1_c.set(@simp.once_rewrite_rule(@list.List([@arith.mult_ac()]))(mul_0_n()))
}

///|
let mul_n_0_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_n_0")

///|
/// `MUL_n_0` (not in the signature of its module)
pub fn mul_n_0_v1() -> @kernel.Thm {
  mul_n_0_v1_c.get()
}

///|
let mul_1_n_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_1_n")

///|
/// `MUL_1_n` (not in the signature of its module)
pub fn mul_1_n() -> @kernel.Thm {
  mul_1_n_c.get()
}

///|
let mul_n_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_n_1")

///|
/// `MUL_n_1` (not in the signature of its module)
pub fn mul_n_1() -> @kernel.Thm {
  mul_n_1_c.get()
}

///|
/// MUL_1_n, MUL_n_1
fn step_119() -> Unit raise {
  let one_const = @kernel.mk_comb(@lib.array_get(const_array(), 1), @misc_vars.zero_num())
  let cond = @basics.mk_eq(@basics.mk_binop(@misc_vars.mul_op_num(), one_const, @misc_vars.n_var_num()), @misc_vars.n_var_num())
  let t403 = (cond, @tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(def_array(), 1)])), @int.arith_tac))
  let t404 = @simp.rewrite_rule(@list.List([@nums.numeral()]))
  let th = t404((fn(x402 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x402.0, x402.1)
  })(t403))
  let (mul_1_n, mul_n_1) = (th, @simp.once_rewrite_rule(@list.List([@arith.mult_ac()]))(th))
  mul_1_n_c.set(mul_1_n)
  mul_n_1_c.set(mul_n_1)
}

///|
/// MUL_B0_t
fn step_120() -> Unit raise {
  let t406 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@lib.array_get(def_array(), 0)])), @int.arith_tac)
  let t405 = @kernel.mk_comb(b0_const(), @basics.mk_binop(@misc_vars.mul_op_num(), @misc_vars.n_var_num(), @misc_vars.t_var_num()))
  mul_b0_t_c.set(@tactics.prove(@basics.mk_eq(@basics.mk_binop(@misc_vars.mul_op_num(), @kernel.mk_comb(b0_const(), @misc_vars.n_var_num()), @misc_vars.t_var_num()), t405), t406))
}

///|
let mul_b0_t_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_B0_t")

///|
/// `MUL_B0_t` (not in the signature of its module)
pub fn mul_b0_t() -> @kernel.Thm {
  mul_b0_t_c.get()
}

///|
/// MUL_t_B0
fn step_121() -> Unit raise {
  mul_t_b0_c.set(@simp.once_rewrite_rule(@list.List([@arith.mult_ac()]))(mul_b0_t()))
}

///|
let mul_t_b0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_t_B0")

///|
/// `MUL_t_B0` (not in the signature of its module)
pub fn mul_t_b0() -> @kernel.Thm {
  mul_t_b0_c.get()
}

///|
/// MUL_SUC_RIGHT
fn step_122() -> Unit raise {
  mul_suc_right_c.set(@tactics.prove(@term_syntax.parse_term("(m : Num) * SUC((n : Num)) == m * n + m"), @int.arith_tac))
}

///|
let mul_suc_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUL_SUC_RIGHT")

///|
/// `MUL_SUC_RIGHT` (not in the signature of its module)
pub fn mul_suc_right() -> @kernel.Thm {
  mul_suc_right_c.get()
}

///|
/// `mul_th_next_right`
pub fn mul_th_next_right(x407 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x407
  let (ltm, rtm) = @kernel.dest_comb(@kernel.rand(@kernel.rator(@kernel.concl(th))))
  let mtm = @kernel.rand(ltm)
  let th0 = @kernel.inst_rule(@list.List([(mtm, @misc_vars.m_var_num()), (rtm, @misc_vars.n_var_num())]), mul_suc_right())
  let th1 = @equal.ap_thm(@equal.ap_term(@misc_vars.add_op_num(), th), mtm)
  let sum_th = raw_add_conv_hash(@kernel.rand(@kernel.concl(th1)))
  let th2 = @kernel.trans(@kernel.trans(th0, th1), sum_th)
  let cn = @kernel.dest_const(@kernel.rator(rtm)).0
  let th_suc = @kernel.inst_rule(@list.List([(@misc_vars.zero_const(), @misc_vars.n_var_num())]), @lib.hashtbl_find(th_suc_table(), cn))
  let th3 = @equal.ap_term(@kernel.mk_comb(@misc_vars.mul_op_num(), mtm), th_suc)
  @kernel.trans(@equal.sym(th3), th2)
}

///|
/// mul_array
fn step_123() -> Unit raise {
  let t408 = @kernel.refl(@misc_vars.zero_const())
  mul_array_c.set(@lib.array_make(@lib.mul63(maximum(), maximum()), t408))
}

///|
let mul_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("mul_array")

///|
/// `mul_array` (not in the signature of its module)
pub fn mul_array() -> FixedArray[@kernel.Thm] {
  mul_array_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:1133
fn step_124() -> Unit raise {
  let i409 = Ref::{ val: 1L }
  let n410 = @lib.sub63(maximum(), 1L)
  while true {
    if (i409.val <= n410) {
      ()
    } else {
      break
    }
    let i = i409.val
    let th1 = @kernel.inst_rule(@list.List([(@kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(i)), @misc_vars.zero_const()), @misc_vars.n_var_num())]), mul_n_1())
    let _ = @lib.array_set(mul_array(), @lib.int63_to_int(@lib.add63(@lib.mul63(i, maximum()), 1L)), th1)
    let i411 = Ref::{ val: 2L }
    let n412 = @lib.sub63(maximum(), 1L)
    while true {
      if (i411.val <= n412) {
        ()
      } else {
        break
      }
      let j = i411.val
      let t413 = mul_th_next_right(@lib.array_get(mul_array(), @lib.int63_to_int(@lib.sub63(@lib.add63(@lib.mul63(i, maximum()), j), 1L))))
      @lib.array_set(mul_array(), @lib.int63_to_int(@lib.add63(@lib.mul63(i, maximum()), j)), t413)
      i411.val = @lib.add63(i411.val, 1L)
      ()
    }
    i409.val = @lib.add63(i409.val, 1L)
    ()
  }
  ()
}

///|
/// mul_table
fn step_125() -> Unit raise {
  mul_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(@lib.mul63(maximum(), maximum()))))
}

///|
let mul_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("mul_table")

///|
/// `mul_table` (not in the signature of its module)
pub fn mul_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  mul_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:1143
fn step_126() -> Unit raise {
  let i414 = Ref::{ val: 1L }
  let n415 = @lib.sub63(maximum(), 1L)
  while true {
    if (i414.val <= n415) {
      ()
    } else {
      break
    }
    let i = i414.val
    let i416 = Ref::{ val: 1L }
    let n417 = @lib.sub63(maximum(), 1L)
    while true {
      if (i416.val <= n417) {
        ()
      } else {
        break
      }
      let j = i416.val
      let t419 = @lib.array_get(mul_array(), @lib.int63_to_int(@lib.add63(@lib.mul63(i, maximum()), j)))
      let t418 = @lib.array_get(names_array(), @lib.int63_to_int(j))
      @lib.hashtbl_add(mul_table(), (@lib.array_get(names_array(), @lib.int63_to_int(i)) + t418), t419)
      i416.val = @lib.add63(i416.val, 1L)
      ()
    }
    i414.val = @lib.add63(i414.val, 1L)
    ()
  }
  ()
}

///|
/// prod_lemma
fn step_127() -> Unit raise {
  let mul : ((@kernel.Term, @kernel.Term)) -> @kernel.Term raise = fn(x420 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    let (a, b) = x420
    @basics.mk_binop(@misc_vars.mul_op_num(), a, b)
  }
  let add : ((@kernel.Term, @kernel.Term)) -> @kernel.Term raise = fn(x421 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
    let (a_1, b_1) = x421
    @basics.mk_binop(@misc_vars.add_op_num(), a_1, b_1)
  }
  let t422 = add((@misc_vars.r_var_num(), @kernel.mk_comb(b0_const(), @misc_vars.n_var_num())))
  let lhs = mul((add((@misc_vars.t_var_num(), @kernel.mk_comb(b0_const(), @misc_vars.m_var_num()))), t422))
  let t423 = mul((@misc_vars.n_var_num(), @misc_vars.t_var_num()))
  let t424 = add((mul((@misc_vars.m_var_num(), @misc_vars.r_var_num())), t423))
  let t425 = @kernel.mk_comb(b0_const(), add((@kernel.mk_comb(b0_const(), mul((@misc_vars.m_var_num(), @misc_vars.n_var_num()))), t424)))
  let rhs = add((mul((@misc_vars.t_var_num(), @misc_vars.r_var_num())), t425))
  let t429 = @simp.rewrite_tac(@list.List([@arith.add_ac(), @arith.mult_ac()]))
  let t428 = @simp.rewrite_tac(@list.List([@lib.array_get(th_add_array(), 0)]))
  let t427 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@arith.add_assoc())]))
  let t426 = @simp.rewrite_tac(@list.List([mul_b0_t(), mul_t_b0()]))
  let t430 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.left_add_distrib(), @arith.right_add_distrib()])), t426), t427), t428), t429)
  prod_lemma_c.set(@tactics.prove(@basics.mk_eq(lhs, rhs), t430))
}

///|
let prod_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prod_lemma")

///|
/// `prod_lemma` (not in the signature of its module)
pub fn prod_lemma() -> @kernel.Thm {
  prod_lemma_c.get()
}

///|
/// ADD_ASSOC'
fn step_128() -> Unit raise {
  add_assoc_p_c.set(@bool.spec_all(@arith.add_assoc()))
}

///|
let add_assoc_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD_ASSOC'")

///|
/// `ADD_ASSOC'` (not in the signature of its module)
pub fn add_assoc_p() -> @kernel.Thm {
  add_assoc_p_c.get()
}

///|
/// `dest_op`
pub fn dest_op(x431 : @kernel.Term) -> ((@kernel.Term, @kernel.Term)) raise {
  let tm = x431
  let (ltm, rtm) = @kernel.dest_comb(tm)
  (@kernel.rand(ltm), rtm)
}

///|
/// `gen_mul_thm`
pub fn gen_mul_thm(x432 : Int64, x433 : Int64) -> @kernel.Thm raise {
  let i = x432
  let j = x433
  let bi0 = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(i)), @misc_vars.zero_const())
  let bj0 = @kernel.mk_comb(@lib.array_get(const_array(), @lib.int63_to_int(j)), @misc_vars.zero_const())
  let def_i = @kernel.inst_rule(@list.List([(@misc_vars.m_var_num(), @misc_vars.n_var_num())]), @lib.array_get(def_thm_array(), @lib.int63_to_int(i)))
  let def_j = @lib.array_get(def_thm_array(), @lib.int63_to_int(j))
  let th0 = @kernel.mk_comb_rule(@equal.ap_term(@misc_vars.mul_op_num(), def_i), def_j)
  let th1 = @kernel.trans(th0, @kernel.inst_rule(@list.List([(bi0, @misc_vars.t_var_num()), (bj0, @misc_vars.r_var_num())]), prod_lemma()))
  let mul_th = @lib.array_get(mul_array(), @lib.int63_to_int(@lib.add63(@lib.mul63(i, maximum()), j)))
  let (larg, rarg) = dest_op(@kernel.rand(@kernel.concl(th1)))
  let th2 = @kernel.trans(th1, @equal.ap_thm(@equal.ap_term(@misc_vars.add_op_num(), mul_th), rarg))
  let larg_1 = @kernel.rand(@kernel.concl(mul_th))
  let (b_low, b_high) = @kernel.dest_comb(larg_1)
  let rtm = @kernel.rand(rarg)
  let th_add = @kernel.inst_rule(@list.List([(b_high, @misc_vars.m_var_num()), (rtm, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_add_table(), (@kernel.dest_const(b_low).0 + b0_name())).0)
  if (@lib.mul63(i, j) < maximum()) {
    let (ltm, rtm_1) = dest_op(@kernel.rand(@kernel.rand(@kernel.concl(th_add))))
    let add_0 = @equal.ap_term(b_low, @kernel.inst_rule(@list.List([(rtm_1, @misc_vars.n_var_num())]), add_0_n()))
    @kernel.trans(th2, @kernel.trans(th_add, add_0))
  } else {
    let (larg_2, rtm_2) = dest_op(@kernel.rand(@kernel.rand(@kernel.concl(th_add))))
    let (rarg_1, rtm_3) = dest_op(rtm_2)
    let th_assoc = @kernel.inst_rule(@list.List([(larg_2, @misc_vars.m_var_num()), (rarg_1, @misc_vars.n_var_num()), (rtm_3, @misc_vars.p_var_num())]), add_assoc_p())
    let mn = @kernel.rand(rarg_1)
    let b_high_1 = @kernel.rator(b_high)
    let th_add2_p = @kernel.inst_rule(@list.List([(@misc_vars.zero_const(), @misc_vars.m_var_num()), (mn, @misc_vars.n_var_num())]), @lib.hashtbl_find(th_add_table(), (@kernel.dest_const(b_high_1).0 + b0_name())).0)
    let add_0_1 = @equal.ap_term(b_high_1, @kernel.inst_rule(@list.List([(mn, @misc_vars.n_var_num())]), add_0_n()))
    let th_add2 = @kernel.trans(th_add2_p, add_0_1)
    let th3 = @kernel.trans(th_assoc, @equal.ap_thm(@equal.ap_term(@misc_vars.add_op_num(), th_add2), rtm_3))
    let th4 = @kernel.trans(th_add, @equal.ap_term(b_low, th3))
    @kernel.trans(th2, th4)
  }
}

///|
/// gen_mul_table
fn step_129() -> Unit raise {
  gen_mul_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(@lib.mul63(maximum(), maximum()))))
}

///|
let gen_mul_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("gen_mul_table")

///|
/// `gen_mul_table` (not in the signature of its module)
pub fn gen_mul_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  gen_mul_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:1209
fn step_130() -> Unit raise {
  let i434 = Ref::{ val: 1L }
  let n435 = @lib.sub63(maximum(), 1L)
  while true {
    if (i434.val <= n435) {
      ()
    } else {
      break
    }
    let i = i434.val
    let i436 = Ref::{ val: 1L }
    let n437 = @lib.sub63(maximum(), 1L)
    while true {
      if (i436.val <= n437) {
        ()
      } else {
        break
      }
      let j = i436.val
      let t438 = @lib.array_get(names_array(), @lib.int63_to_int(j))
      let name = (@lib.array_get(names_array(), @lib.int63_to_int(i)) + t438)
      @lib.hashtbl_add(gen_mul_table(), name, gen_mul_thm(i, j))
      i436.val = @lib.add63(i436.val, 1L)
      ()
    }
    i434.val = @lib.add63(i434.val, 1L)
    ()
  }
  ()
}

///|
/// `mul1_right_th`
pub fn mul1_right_th(x439 : Int64, x440 : Int64) -> @kernel.Thm raise {
  let i = x439
  let j = x440
  let t441 = @lib.array_get(names_array(), @lib.int63_to_int(j))
  let th0 = @kernel.inst_rule(@list.List([(@misc_vars.zero_const(), @misc_vars.n_var_num())]), @lib.hashtbl_find(gen_mul_table(), (@lib.array_get(names_array(), @lib.int63_to_int(i)) + t441)))
  let (b_low, rtm) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th0)))
  let (tm1, tm23) = dest_op(rtm)
  let (tm2p, tm3) = @kernel.dest_comb(tm23)
  let tm3_th = @kernel.inst_rule(@list.List([(@kernel.rand(tm3), @misc_vars.n_var_num())]), mul_0_n())
  let tm2_th = @kernel.inst_rule(@list.List([(@kernel.rand(tm2p), @misc_vars.n_var_num())]), add_n_0())
  let tm23_th = @kernel.trans(@equal.ap_term(tm2p, tm3_th), tm2_th)
  let (ltm, rtm_1) = @kernel.dest_comb(tm1)
  if (@lib.mul63(i, j) < maximum()) {
    let tm1_th = @kernel.trans(@equal.ap_term(ltm, @kernel.inst_rule(@list.List([(@misc_vars.m_var_num(), @misc_vars.n_var_num())]), mul_n_0_v1())), b0_0())
    let tm123_th_p = @kernel.trans(@kernel.inst_rule(@list.List([(tm23, @misc_vars.n_var_num())]), add_0_n()), tm23_th)
    let tm123_th = @kernel.trans(@equal.ap_thm(@equal.ap_term(@misc_vars.add_op_num(), tm1_th), tm23), tm123_th_p)
    @kernel.trans(th0, @equal.ap_term(b_low, tm123_th))
  } else {
    let tm1_th_1 = @equal.ap_term(ltm, @kernel.inst_rule(@list.List([(@misc_vars.m_var_num(), @misc_vars.n_var_num())]), mul_n_0_v1()))
    let tm123_th_1 = @kernel.mk_comb_rule(@equal.ap_term(@misc_vars.add_op_num(), tm1_th_1), tm23_th)
    @kernel.trans(th0, @equal.ap_term(b_low, tm123_th_1))
  }
}

///|
/// MULT_AC'
fn step_131() -> Unit raise {
  mult_ac_p_c.set(@bool.conjunct1(@arith.mult_ac()))
}

///|
let mult_ac_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULT_AC'")

///|
/// `MULT_AC'` (not in the signature of its module)
pub fn mult_ac_p() -> @kernel.Thm {
  mult_ac_p_c.get()
}

///|
/// `mul1_left_th`
pub fn mul1_left_th(x442 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x442
  let (lhs, rhs) = @kernel.dest_eq(@kernel.concl(th))
  let (ltm, rtm) = dest_op(lhs)
  let th_lhs = @kernel.inst_rule(@list.List([(ltm, @misc_vars.n_var_num()), (rtm, @misc_vars.m_var_num())]), mult_ac_p())
  let (btm, rtm_1) = @kernel.dest_comb(rhs)
  let (larg, rarg) = dest_op(rtm_1)
  if @kernel.is_comb(larg) {
    let (ltm_1, rtm_2) = dest_op(rarg)
    let th_rhs_p = @kernel.inst_rule(@list.List([(ltm_1, @misc_vars.m_var_num()), (rtm_2, @misc_vars.n_var_num())]), mult_ac_p())
    let th_rhs = @equal.ap_term(@kernel.mk_comb(@misc_vars.add_op_num(), larg), th_rhs_p)
    @kernel.trans(th_lhs, @kernel.trans(th, @equal.ap_term(btm, th_rhs)))
  } else {
    let th_rhs_1 = @kernel.inst_rule(@list.List([(larg, @misc_vars.m_var_num()), (rarg, @misc_vars.n_var_num())]), mult_ac_p())
    @kernel.trans(th_lhs, @kernel.trans(th, @equal.ap_term(btm, th_rhs_1)))
  }
}

///|
/// mul1_right_th_table
fn step_132() -> Unit raise {
  mul1_right_th_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(@lib.mul63(maximum(), maximum()))))
}

///|
let mul1_right_th_table_c : @lib.Cell[@lib.OHashtbl[String, (Bool, @kernel.Thm)]] = @lib.Cell::new("mul1_right_th_table")

///|
/// `mul1_right_th_table` (not in the signature of its module)
pub fn mul1_right_th_table() -> @lib.OHashtbl[String, (Bool, @kernel.Thm)] {
  mul1_right_th_table_c.get()
}

///|
/// mul1_left_th_table
fn step_133() -> Unit raise {
  mul1_left_th_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(@lib.mul63(maximum(), maximum()))))
}

///|
let mul1_left_th_table_c : @lib.Cell[@lib.OHashtbl[String, (Bool, @kernel.Thm)]] = @lib.Cell::new("mul1_left_th_table")

///|
/// `mul1_left_th_table` (not in the signature of its module)
pub fn mul1_left_th_table() -> @lib.OHashtbl[String, (Bool, @kernel.Thm)] {
  mul1_left_th_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:1259
fn step_134() -> Unit raise {
  let i443 = Ref::{ val: 1L }
  let n444 = @lib.sub63(maximum(), 1L)
  while true {
    if (i443.val <= n444) {
      ()
    } else {
      break
    }
    let i = i443.val
    let i445 = Ref::{ val: 1L }
    let n446 = @lib.sub63(maximum(), 1L)
    while true {
      if (i445.val <= n446) {
        ()
      } else {
        break
      }
      let j = i445.val
      let t447 = @lib.array_get(names_array(), @lib.int63_to_int(j))
      let name_right = (@lib.array_get(names_array(), @lib.int63_to_int(i)) + t447)
      let t448 = @lib.array_get(names_array(), @lib.int63_to_int(i))
      let name_left = (@lib.array_get(names_array(), @lib.int63_to_int(j)) + t448)
      let th = mul1_right_th(i, j)
      let add_flag = (@lib.mul63(i, j) >= maximum())
      let _ = @lib.hashtbl_add(mul1_right_th_table(), name_right, (add_flag, th))
      @lib.hashtbl_add(mul1_left_th_table(), name_left, (add_flag, mul1_left_th(th)))
      i445.val = @lib.add63(i445.val, 1L)
      ()
    }
    i443.val = @lib.add63(i443.val, 1L)
    ()
  }
  ()
}

///|
/// `raw_mul1_right_hash`
pub fn raw_mul1_right_hash(x449 : @kernel.Term, x450 : @kernel.Term, x451 : String) -> @kernel.Thm raise {
  let arg = x449
  let tm = x450
  let tmname = x451
  if (arg == @misc_vars.zero_const()) {
    @kernel.inst_rule(@list.List([(tm, @misc_vars.n_var_num())]), mul_0_n())
  } else {
    let (btm, mtm) = @kernel.dest_comb(arg)
    let cn = @kernel.dest_const(btm).0
    if (cn == b0_name()) {
      let th = @kernel.inst_rule(@list.List([(mtm, @misc_vars.n_var_num()), (tm, @misc_vars.t_var_num())]), mul_b0_t())
      @kernel.trans(th, @equal.ap_term(b0_const(), raw_mul1_right_hash(mtm, tm, tmname)))
    } else {
      let name = (cn + tmname)
      if (mtm == @misc_vars.zero_const()) {
        @lib.hashtbl_find(mul_table(), name)
      } else {
        let (add_flag, th_p) = @lib.hashtbl_find(mul1_right_th_table(), name)
        let th_1 = @kernel.inst_rule(@list.List([(mtm, @misc_vars.m_var_num())]), th_p)
        if add_flag {
          let (ltm, rtm) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th_1)))
          let (lplus, rarg) = @kernel.dest_comb(rtm)
          let th2 = @equal.ap_term(lplus, raw_mul1_right_hash(mtm, tm, tmname))
          let th_add = raw_add_conv_hash(@kernel.rand(@kernel.concl(th2)))
          @kernel.trans(th_1, @equal.ap_term(ltm, @kernel.trans(th2, th_add)))
        } else {
          let ltm_1 = @kernel.rator(@kernel.rand(@kernel.concl(th_1)))
          let th2_1 = @equal.ap_term(ltm_1, raw_mul1_right_hash(mtm, tm, tmname))
          @kernel.trans(th_1, th2_1)
        }
      }
    }
  }
}

///|
/// `raw_mul1_left_hash`
pub fn raw_mul1_left_hash(x452 : @kernel.Term, x453 : String, x454 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x452
  let tmname = x453
  let arg = x454
  if (arg == @misc_vars.zero_const()) {
    @kernel.inst_rule(@list.List([(tm, @misc_vars.n_var_num())]), mul_n_0_v1())
  } else {
    let (btm, mtm) = @kernel.dest_comb(arg)
    let cn = @kernel.dest_const(btm).0
    if (cn == b0_name()) {
      let th = @kernel.inst_rule(@list.List([(mtm, @misc_vars.n_var_num()), (tm, @misc_vars.t_var_num())]), mul_t_b0())
      @kernel.trans(th, @equal.ap_term(b0_const(), raw_mul1_left_hash(tm, tmname, mtm)))
    } else {
      let name = (tmname + cn)
      if (mtm == @misc_vars.zero_const()) {
        @lib.hashtbl_find(mul_table(), name)
      } else {
        let (add_flag, th_p) = @lib.hashtbl_find(mul1_left_th_table(), name)
        let th_1 = @kernel.inst_rule(@list.List([(mtm, @misc_vars.m_var_num())]), th_p)
        if add_flag {
          let (ltm, rtm) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th_1)))
          let (lplus, rarg) = @kernel.dest_comb(rtm)
          let th2 = @equal.ap_term(lplus, raw_mul1_left_hash(tm, tmname, mtm))
          let th_add = raw_add_conv_hash(@kernel.rand(@kernel.concl(th2)))
          @kernel.trans(th_1, @equal.ap_term(ltm, @kernel.trans(th2, th_add)))
        } else {
          let ltm_1 = @kernel.rator(@kernel.rand(@kernel.concl(th_1)))
          let th2_1 = @equal.ap_term(ltm_1, raw_mul1_left_hash(tm, tmname, mtm))
          @kernel.trans(th_1, th2_1)
        }
      }
    }
  }
}

///|
/// `raw_mul_conv_hash`
pub fn raw_mul_conv_hash(x455 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x455
  let (larg, rarg) = @kernel.dest_comb(tm)
  let larg_1 = @kernel.rand(larg)
  if (larg_1 == @misc_vars.zero_const()) {
    @kernel.inst_rule(@list.List([(rarg, @misc_vars.n_var_num())]), mul_0_n())
  } else {
    if (rarg == @misc_vars.zero_const()) {
      @kernel.inst_rule(@list.List([(larg_1, @misc_vars.n_var_num())]), mul_n_0_v1())
    } else {
      let (lbtm, mtm) = @kernel.dest_comb(larg_1)
      let lcn = @kernel.dest_const(lbtm).0
      if (lcn == b0_name()) {
        let th = @kernel.inst_rule(@list.List([(rarg, @misc_vars.t_var_num()), (mtm, @misc_vars.n_var_num())]), mul_b0_t())
        let (ltm, rtm) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th)))
        @kernel.trans(th, @equal.ap_term(ltm, raw_mul_conv_hash(rtm)))
      } else {
        let (rbtm, ntm) = @kernel.dest_comb(rarg)
        let rcn = @kernel.dest_const(rbtm).0
        if (rcn == b0_name()) {
          let th_1 = @kernel.inst_rule(@list.List([(larg_1, @misc_vars.t_var_num()), (ntm, @misc_vars.n_var_num())]), mul_t_b0())
          let (ltm_1, rtm_1) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th_1)))
          @kernel.trans(th_1, @equal.ap_term(ltm_1, raw_mul_conv_hash(rtm_1)))
        } else {
          if (ntm == @misc_vars.zero_const()) {
            if (mtm == @misc_vars.zero_const()) {
              @lib.hashtbl_find(mul_table(), (lcn + rcn))
            } else {
              raw_mul1_right_hash(larg_1, @kernel.mk_comb(rbtm, @misc_vars.zero_const()), rcn)
            }
          } else {
            if (mtm == @misc_vars.zero_const()) {
              raw_mul1_left_hash(@kernel.mk_comb(lbtm, @misc_vars.zero_const()), lcn, rarg)
            } else {
              let th0 = @kernel.inst_rule(@list.List([(mtm, @misc_vars.m_var_num()), (ntm, @misc_vars.n_var_num())]), @lib.hashtbl_find(gen_mul_table(), (lcn + rcn)))
              let (b_low, expr) = @kernel.dest_comb(@kernel.rand(@kernel.concl(th0)))
              let (ltm_2, rsum) = @kernel.dest_comb(expr)
              let (b_high, mul0) = @kernel.dest_comb(@kernel.rand(ltm_2))
              let th_mul0 = raw_mul_conv_hash(mul0)
              let th_mul1 = raw_mul1_right_hash(mtm, @kernel.mk_comb(rbtm, @misc_vars.zero_const()), rcn)
              let th_mul2 = raw_mul1_right_hash(ntm, @kernel.mk_comb(lbtm, @misc_vars.zero_const()), lcn)
              let th_larg = @equal.ap_term(@misc_vars.add_op_num(), @equal.ap_term(b_high, th_mul0))
              let th_rarg = @kernel.mk_comb_rule(@equal.ap_term(@misc_vars.add_op_num(), th_mul1), th_mul2)
              let add_rarg = @kernel.trans(th_rarg, raw_add_conv_hash(@kernel.rand(@kernel.concl(th_rarg))))
              let add_th = @kernel.mk_comb_rule(th_larg, add_rarg)
              let add = @kernel.trans(add_th, raw_add_conv_hash(@kernel.rand(@kernel.concl(add_th))))
              @kernel.trans(th0, @equal.ap_term(b_low, add))
            }
          }
        }
      }
    }
  }
}

///|
/// `NUM_MULT_HASH_CONV`
pub fn num_mult_hash_conv(x456 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x456
  let (ltm, rtm) = @kernel.dest_comb(tm)
  let t457 = @kernel.rand(rtm)
  let (larg, rarg) = (@kernel.rand(@kernel.rand(ltm)), t457)
  let th0 = @kernel.inst_rule(@list.List([(larg, @misc_vars.m_var_num()), (rarg, @misc_vars.n_var_num())]), mul_num())
  if (@kernel.rand(@kernel.rator(@kernel.concl(th0))) != tm) {
    raise Failure("NUM_MULT_HASH_CONV")
  } else {
    let rtm_1 = @kernel.rand(@kernel.rand(@kernel.concl(th0)))
    let th = raw_mul_conv_hash(rtm_1)
    @kernel.trans(th0, @equal.ap_term(num_const(), th))
  }
}

///|
/// DIV_NUM
fn step_135() -> Unit raise {
  let t460 = @simp.rewrite_tac(@list.List([num_def(), @nums.numeral()]))
  let t459 = @kernel.mk_comb(num_const(), @basics.mk_binop(@misc_vars.div_op_num(), @misc_vars.m_var_num(), @misc_vars.n_var_num()))
  let t458 = @kernel.mk_comb(num_const(), @misc_vars.n_var_num())
  div_num_c.set(@tactics.prove(@basics.mk_eq(@basics.mk_binop(@misc_vars.div_op_num(), @kernel.mk_comb(num_const(), @misc_vars.m_var_num()), t458), t459), t460))
}

///|
let div_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_NUM")

///|
/// `DIV_NUM` (not in the signature of its module)
pub fn div_num() -> @kernel.Thm {
  div_num_c.get()
}

///|
/// DIV_UNIQ'
fn step_136() -> Unit raise {
  let t465 = @simp.rewrite_rule(@list.List([@equal.gsym(@theorems.imp_imp())]))
  let t463 = @simp.once_rewrite_rule(@list.List([@int.arith_rule(@term_syntax.parse_term("((m : Num) == (q : Num) * (n : Num) + (r : Num)) == (q * n + r == m)"))]))
  let t461 = @simp.pure_once_rewrite_rule(@list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) < (b : Num)) == ((a < b) == true)"))]))
  div_uniq_p_c.set((fn(x466 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x464 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x462 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch_all(t461(x462))
      })(t463(x464))
    })(t465(x466))
  })(@bool.spec_all(@arith.div_uniq())))
}

///|
let div_uniq_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIV_UNIQ'")

///|
/// `DIV_UNIQ'` (not in the signature of its module)
pub fn div_uniq_p() -> @kernel.Thm {
  div_uniq_p_c.get()
}

///|
/// `raw_div_hash_conv`
pub fn raw_div_hash_conv(x467 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x467
  let (ltm, n_tm) = @kernel.dest_comb(tm)
  let m_tm = @kernel.rand(ltm)
  let m = raw_dest_hash(m_tm)
  let n = raw_dest_hash(n_tm)
  let q = @num.quo_num(m, n)
  let r = @num.mod_num(m, n)
  let q_tm = @kernel.rand(mk_numeral_array(q))
  let r_tm = @kernel.rand(mk_numeral_array(r))
  let qn_th = raw_mul_conv_hash(@basics.mk_binop(@misc_vars.mul_op_num(), q_tm, n_tm))
  let qn_tm = @kernel.rand(@kernel.concl(qn_th))
  let qnr_th = raw_add_conv_hash(@basics.mk_binop(@misc_vars.add_op_num(), qn_tm, r_tm))
  let th1 = @kernel.trans(@equal.ap_thm(@equal.ap_term(@misc_vars.add_op_num(), qn_th), r_tm), qnr_th)
  let th2 = raw_lt_hash_conv(@basics.mk_binop(@misc_vars.lt_op_num(), r_tm, n_tm))
  let th0 = @kernel.inst_rule(@list.List([(r_tm, @misc_vars.r_var_num()), (n_tm, @misc_vars.n_var_num()), (m_tm, @misc_vars.m_var_num()), (q_tm, @misc_vars.q_var_num())]), div_uniq_p())
  @misc_functions.my_prove_hyp(th1, @misc_functions.my_prove_hyp(th2, th0))
}

///|
/// `NUM_DIV_HASH_CONV`
pub fn num_div_hash_conv(x468 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x468
  let (ltm, rtm) = @kernel.dest_comb(tm)
  let t469 = @kernel.rand(rtm)
  let (larg, rarg) = (@kernel.rand(@kernel.rand(ltm)), t469)
  let th0 = @kernel.inst_rule(@list.List([(larg, @misc_vars.m_var_num()), (rarg, @misc_vars.n_var_num())]), div_num())
  if (@kernel.rand(@kernel.rator(@kernel.concl(th0))) != tm) {
    raise Failure("NUM_DIV_HASH_CONV")
  } else {
    let rtm_1 = @kernel.rand(@kernel.rand(@kernel.concl(th0)))
    let th = raw_div_hash_conv(rtm_1)
    @kernel.trans(th0, @equal.ap_term(num_const(), th))
  }
}

///|
/// even_const
fn step_137() -> Unit raise {
  even_const_c.set(@term_syntax.parse_term("EVEN"))
}

///|
let even_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("even_const")

///|
/// `even_const` (not in the signature of its module)
pub fn even_const() -> @kernel.Term {
  even_const_c.get()
}

///|
/// odd_const
fn step_138() -> Unit raise {
  odd_const_c.set(@term_syntax.parse_term("ODD"))
}

///|
let odd_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("odd_const")

///|
/// `odd_const` (not in the signature of its module)
pub fn odd_const() -> @kernel.Term {
  odd_const_c.get()
}

///|
/// eq_const
fn step_139() -> Unit raise {
  eq_const_c.set(@term_syntax.parse_term("(op_eq : (Bool, Bool) -> Bool)"))
}

///|
let eq_const_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("eq_const")

///|
/// `eq_const` (not in the signature of its module)
pub fn eq_const() -> @kernel.Term {
  eq_const_c.get()
}

///|
/// EVEN_NUM
fn step_140() -> Unit raise {
  let t471 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
  let t472 = (@term_syntax.parse_term("EVEN(NUMERAL((n : Num))) == EVEN(n)"), t471)
  let t473 = @simp.rewrite_rule(@list.List([@equal.gsym(num_def())]))
  even_num_c.set(t473((fn(x470 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x470.0, x470.1)
  })(t472)))
}

///|
let even_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_NUM")

///|
/// `EVEN_NUM` (not in the signature of its module)
pub fn even_num() -> @kernel.Thm {
  even_num_c.get()
}

///|
/// ODD_NUM
fn step_141() -> Unit raise {
  let t475 = @simp.rewrite_tac(@list.List([@nums.numeral()]))
  let t476 = (@term_syntax.parse_term("ODD(NUMERAL((n : Num))) == ODD(n)"), t475)
  let t477 = @simp.rewrite_rule(@list.List([@equal.gsym(num_def())]))
  odd_num_c.set(t477((fn(x474 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x474.0, x474.1)
  })(t476)))
}

///|
let odd_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_NUM")

///|
/// `ODD_NUM` (not in the signature of its module)
pub fn odd_num() -> @kernel.Thm {
  odd_num_c.get()
}

///|
/// EVEN_ZERO
fn step_142() -> Unit raise {
  let t478 = @simp.rewrite_tac(@list.List([@calc_num.arith_even()]))
  even_zero_c.set(@tactics.prove(@term_syntax.parse_term("EVEN(_0) == true"), t478))
}

///|
let even_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_ZERO")

///|
/// `EVEN_ZERO` (not in the signature of its module)
pub fn even_zero() -> @kernel.Thm {
  even_zero_c.get()
}

///|
/// ODD_ZERO
fn step_143() -> Unit raise {
  let t479 = @simp.rewrite_tac(@list.List([@calc_num.arith_odd()]))
  odd_zero_c.set(@tactics.prove(@term_syntax.parse_term("ODD(_0) == false"), t479))
}

///|
let odd_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_ZERO")

///|
/// `ODD_ZERO` (not in the signature of its module)
pub fn odd_zero() -> @kernel.Thm {
  odd_zero_c.get()
}

///|
/// EVEN_B0
fn step_144() -> Unit raise {
  let t482 = @tactics.conv_tac(@calc_num.num_even_conv)
  let t483 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([b0_explicit(), @arith.even_mult()])), @tactics.disj1_tac), t482)
  let t481 = @term_syntax.parse_term("true")
  let t480 = @kernel.mk_comb(b0_const(), @term_syntax.parse_term("(n : Num)"))
  even_b0_c.set(@tactics.prove(@basics.mk_eq(@kernel.mk_comb(@term_syntax.parse_term("EVEN"), t480), t481), t483))
}

///|
let even_b0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_B0")

///|
/// `EVEN_B0` (not in the signature of its module)
pub fn even_b0() -> @kernel.Thm {
  even_b0_c.get()
}

///|
/// ODD_B0
fn step_145() -> Unit raise {
  let t486 = @simp.rewrite_tac(@list.List([@arith.not_odd(), even_b0()]))
  let t485 = @term_syntax.parse_term("false")
  let t484 = @kernel.mk_comb(b0_const(), @term_syntax.parse_term("(n : Num)"))
  odd_b0_c.set(@tactics.prove(@basics.mk_eq(@kernel.mk_comb(@term_syntax.parse_term("ODD"), t484), t485), t486))
}

///|
let odd_b0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_B0")

///|
/// `ODD_B0` (not in the signature of its module)
pub fn odd_b0() -> @kernel.Thm {
  odd_b0_c.get()
}

///|
/// EVEN_SUC_T
fn step_146() -> Unit raise {
  let t487 = @simp.rewrite_tac(@list.List([@arith.even()]))
  even_suc_t_c.set(@tactics.prove(@term_syntax.parse_term("(EVEN(SUC((n : Num))) == true) == (EVEN(n) == false)"), t487))
}

///|
let even_suc_t_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_SUC_T")

///|
/// `EVEN_SUC_T` (not in the signature of its module)
pub fn even_suc_t() -> @kernel.Thm {
  even_suc_t_c.get()
}

///|
/// EVEN_SUC_F
fn step_147() -> Unit raise {
  let t488 = @simp.rewrite_tac(@list.List([@arith.even()]))
  even_suc_f_c.set(@tactics.prove(@term_syntax.parse_term("(EVEN(SUC((n : Num))) == false) == (EVEN(n) == true)"), t488))
}

///|
let even_suc_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EVEN_SUC_F")

///|
/// `EVEN_SUC_F` (not in the signature of its module)
pub fn even_suc_f() -> @kernel.Thm {
  even_suc_f_c.get()
}

///|
/// ODD_SUC_T
fn step_148() -> Unit raise {
  let t489 = @simp.rewrite_tac(@list.List([@arith.odd()]))
  odd_suc_t_c.set(@tactics.prove(@term_syntax.parse_term("(ODD(SUC((n : Num))) == true) == (ODD(n) == false)"), t489))
}

///|
let odd_suc_t_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_SUC_T")

///|
/// `ODD_SUC_T` (not in the signature of its module)
pub fn odd_suc_t() -> @kernel.Thm {
  odd_suc_t_c.get()
}

///|
/// ODD_SUC_F
fn step_149() -> Unit raise {
  let t490 = @simp.rewrite_tac(@list.List([@arith.odd()]))
  odd_suc_f_c.set(@tactics.prove(@term_syntax.parse_term("(ODD(SUC((n : Num))) == false) == (ODD(n) == true)"), t490))
}

///|
let odd_suc_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ODD_SUC_F")

///|
/// `ODD_SUC_F` (not in the signature of its module)
pub fn odd_suc_f() -> @kernel.Thm {
  odd_suc_f_c.get()
}

///|
/// `next_even_th`
pub fn next_even_th(x491 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x491
  let (ltm, rtm) = @kernel.dest_comb(@kernel.concl(th))
  let b_tm = @kernel.rand(@kernel.rand(ltm))
  let suc_b = raw_suc_conv_hash(@kernel.mk_comb(@misc_vars.suc_op_num(), b_tm))
  let flag = ((fn(x492 : (String, @kernel.HolType)) -> String raise {
    x492.0
  })(@kernel.dest_const(rtm)) == "T")
  let th0 = @equal.sym(@equal.ap_term(even_const(), suc_b))
  let t493 = if flag {
    @misc_vars.f_const()
  } else {
    @misc_vars.t_const()
  }
  let th1 = @equal.ap_thm(@equal.ap_term(eq_const(), th0), t493)
  let th2 = @kernel.inst_rule(@list.List([(b_tm, @misc_vars.n_var_num())]), if flag {
    even_suc_f()
  } else {
    even_suc_t()
  })
  @kernel.eq_mp(@equal.sym(@kernel.trans(th1, th2)), th)
}

///|
/// `next_odd_th`
pub fn next_odd_th(x494 : @kernel.Thm) -> @kernel.Thm raise {
  let th = x494
  let (ltm, rtm) = @kernel.dest_comb(@kernel.concl(th))
  let b_tm = @kernel.rand(@kernel.rand(ltm))
  let suc_b = raw_suc_conv_hash(@kernel.mk_comb(@misc_vars.suc_op_num(), b_tm))
  let flag = ((fn(x495 : (String, @kernel.HolType)) -> String raise {
    x495.0
  })(@kernel.dest_const(rtm)) == "T")
  let th0 = @equal.sym(@equal.ap_term(odd_const(), suc_b))
  let t496 = if flag {
    @misc_vars.f_const()
  } else {
    @misc_vars.t_const()
  }
  let th1 = @equal.ap_thm(@equal.ap_term(eq_const(), th0), t496)
  let th2 = @kernel.inst_rule(@list.List([(b_tm, @misc_vars.n_var_num())]), if flag {
    odd_suc_f()
  } else {
    odd_suc_t()
  })
  @kernel.eq_mp(@equal.sym(@kernel.trans(th1, th2)), th)
}

///|
/// even_thm_table
fn step_150() -> Unit raise {
  even_thm_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let even_thm_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("even_thm_table")

///|
/// `even_thm_table` (not in the signature of its module)
pub fn even_thm_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  even_thm_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:1491
fn step_151() -> Unit raise {
  @lib.hashtbl_add(even_thm_table(), @lib.array_get(names_array(), 0), even_b0())
}

///|
/// Formal_ineqs/arith/arith_num.hl:1493
fn step_152() -> Unit raise {
  let i497 = Ref::{ val: 1L }
  let n498 = @lib.sub63(maximum(), 1L)
  while true {
    if (i497.val <= n498) {
      ()
    } else {
      break
    }
    let i = i497.val
    let th0 = next_even_th(@lib.hashtbl_find(even_thm_table(), @lib.array_get(names_array(), @lib.int63_to_int(@lib.sub63(i, 1L)))))
    @lib.hashtbl_add(even_thm_table(), @lib.array_get(names_array(), @lib.int63_to_int(i)), th0)
    i497.val = @lib.add63(i497.val, 1L)
    ()
  }
  ()
}

///|
/// odd_thm_table
fn step_153() -> Unit raise {
  odd_thm_table_c.set(@lib.hashtbl_create(@lib.int63_to_int(maximum())))
}

///|
let odd_thm_table_c : @lib.Cell[@lib.OHashtbl[String, @kernel.Thm]] = @lib.Cell::new("odd_thm_table")

///|
/// `odd_thm_table` (not in the signature of its module)
pub fn odd_thm_table() -> @lib.OHashtbl[String, @kernel.Thm] {
  odd_thm_table_c.get()
}

///|
/// Formal_ineqs/arith/arith_num.hl:1499
fn step_154() -> Unit raise {
  @lib.hashtbl_add(odd_thm_table(), @lib.array_get(names_array(), 0), odd_b0())
}

///|
/// Formal_ineqs/arith/arith_num.hl:1501
fn step_155() -> Unit raise {
  let i499 = Ref::{ val: 1L }
  let n500 = @lib.sub63(maximum(), 1L)
  while true {
    if (i499.val <= n500) {
      ()
    } else {
      break
    }
    let i = i499.val
    let th0 = next_odd_th(@lib.hashtbl_find(odd_thm_table(), @lib.array_get(names_array(), @lib.int63_to_int(@lib.sub63(i, 1L)))))
    @lib.hashtbl_add(odd_thm_table(), @lib.array_get(names_array(), @lib.int63_to_int(i)), th0)
    i499.val = @lib.add63(i499.val, 1L)
    ()
  }
  ()
}

///|
/// `raw_even_hash_conv`
pub fn raw_even_hash_conv(x501 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x501
  let (ltm, rtm) = @kernel.dest_comb(tm)
  if ((fn(x502 : (String, @kernel.HolType)) -> String raise {
    x502.0
  })(@kernel.dest_const(ltm)) != "EVEN") {
    raise Failure("raw_even_hash_conv: no EVEN")
  } else {
    if @kernel.is_const(rtm) {
      even_zero()
    } else {
      let (b_tm, n_tm) = @kernel.dest_comb(rtm)
      let th0 = @lib.hashtbl_find(even_thm_table(), (fn(x503 : (String, @kernel.HolType)) -> String raise {
        x503.0
      })(@kernel.dest_const(b_tm)))
      @kernel.inst_rule(@list.List([(n_tm, @misc_vars.n_var_num())]), th0)
    }
  }
}

///|
/// `raw_odd_hash_conv`
pub fn raw_odd_hash_conv(x504 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x504
  let (ltm, rtm) = @kernel.dest_comb(tm)
  if ((fn(x505 : (String, @kernel.HolType)) -> String raise {
    x505.0
  })(@kernel.dest_const(ltm)) != "ODD") {
    raise Failure("raw_odd_hash_conv: no ODD")
  } else {
    if @kernel.is_const(rtm) {
      odd_zero()
    } else {
      let (b_tm, n_tm) = @kernel.dest_comb(rtm)
      let th0 = @lib.hashtbl_find(odd_thm_table(), (fn(x506 : (String, @kernel.HolType)) -> String raise {
        x506.0
      })(@kernel.dest_const(b_tm)))
      @kernel.inst_rule(@list.List([(n_tm, @misc_vars.n_var_num())]), th0)
    }
  }
}

///|
/// `NUM_EVEN_HASH_CONV`
pub fn num_even_hash_conv(x507 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x507
  let (ltm, rtm) = @kernel.dest_comb(tm)
  let th0 = @kernel.inst_rule(@list.List([(@kernel.rand(rtm), @misc_vars.n_var_num())]), even_num())
  let (ltm_1, rtm_1) = @kernel.dest_comb(@kernel.concl(th0))
  if (@kernel.rand(ltm_1) != tm) {
    raise Failure("NUM_EVEN_HASH_CONV")
  } else {
    let th1 = raw_even_hash_conv(rtm_1)
    @kernel.trans(th0, th1)
  }
}

///|
/// `NUM_ODD_HASH_CONV`
pub fn num_odd_hash_conv(x508 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x508
  let (ltm, rtm) = @kernel.dest_comb(tm)
  let th0 = @kernel.inst_rule(@list.List([(@kernel.rand(rtm), @misc_vars.n_var_num())]), odd_num())
  let (ltm_1, rtm_1) = @kernel.dest_comb(@kernel.concl(th0))
  if (@kernel.rand(ltm_1) != tm) {
    raise Failure("NUM_ODD_HASH_CONV")
  } else {
    let th1 = raw_odd_hash_conv(rtm_1)
    @kernel.trans(th0, th1)
  }
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
  step_67()
  step_68()
  step_69()
  step_70()
  step_71()
  step_72()
  step_73()
  step_74()
  step_75()
  step_76()
  step_77()
  step_78()
  step_79()
  step_80()
  step_81()
  step_82()
  step_83()
  step_84()
  step_85()
  step_86()
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
  step_93()
  step_94()
  step_95()
  step_96()
  step_97()
  step_98()
  step_99()
  step_100()
  step_101()
  step_102()
  step_103()
  step_104()
  step_105()
  step_106()
  step_107()
  step_108()
  step_109()
  step_110()
  step_111()
  step_112()
  step_113()
  step_114()
  step_115()
  step_116()
  step_117()
  step_118()
  step_119()
  step_120()
  step_121()
  step_122()
  step_123()
  step_124()
  step_125()
  step_126()
  step_127()
  step_128()
  step_129()
  step_130()
  step_131()
  step_132()
  step_133()
  step_134()
  step_135()
  step_136()
  step_137()
  step_138()
  step_139()
  step_140()
  step_141()
  step_142()
  step_143()
  step_144()
  step_145()
  step_146()
  step_147()
  step_148()
  step_149()
  step_150()
  step_151()
  step_152()
  step_153()
  step_154()
  step_155()
}
