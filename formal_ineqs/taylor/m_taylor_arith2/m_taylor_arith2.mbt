// Translated from upstream Formal_ineqs/taylor/m_taylor_arith2.hl; edit this file directly.

///|
/// `mk_vars`
pub fn mk_vars(x1 : Int64, x2 : String, x3 : @kernel.HolType) -> @list.List[@kernel.Term] raise {
  let n = x1
  let name = x2
  let ty = x3
  @lib.map(fn(x4 : Int64) -> @kernel.Term raise {
    let i = x4
    @kernel.mk_var((name + Int64::to_string(i)), ty)
  }, @lib.range(1L, n))
}

///|
/// `all_n_components2`
pub fn all_n_components2(x5 : Int64, x6 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
  let n = x5
  let all_n_th = x6
  let th0 = @equal.sym(@lib.array_get(@m_taylor_arith.all_n_array(), @lib.int63_to_int(n)))
  let (_, list_tm, s_tm) = @m_taylor_arith.dest_all_n(@kernel.concl(all_n_th))
  let list_ty = @kernel.type_of(list_tm)
  let ty = (fn(x8 : (String, @list.List[@kernel.HolType])) -> @kernel.HolType raise {
    @lib.hd((fn(x7 : (String, @list.List[@kernel.HolType])) -> @list.List[@kernel.HolType] raise {
      x7.1
    })(x8))
  })(@kernel.dest_type(list_ty))
  let s_var = @kernel.mk_var("s", @kernel.type_of(s_tm))
  let a_vars = mk_vars(n, "a", ty)
  let list_tms = @basics.dest_list(list_tm)
  let t9 = (@list.List([(s_tm, s_var)])).concat(@lib.zip(list_tms, a_vars))
  let th1 = ((x10 : @kernel.Thm) => @kernel.inst_rule(t9, x10))((fn(x12 : @kernel.Thm) -> @kernel.Thm raise {
    ((x11 : @kernel.Thm) => @kernel.inst_type(@list.List([(ty, @kernel.aty)]), x11))(x12)
  })(th0))
  @bool.conjuncts_rule(@kernel.eq_mp(th1, all_n_th))
}

///|
/// `gen_taylor_arith_thm`
pub fn gen_taylor_arith_thm(x13 : @kernel.Thm, x14 : (@kernel.Thm) -> @kernel.Thm raise, x15 : Int64) -> @kernel.Thm raise {
  let arith_th = x13
  let final_rule = x14
  let n = x15
  let t18 = @term_syntax.parse_term("1")
  let t16 = @simp.rewrite_rule(@list.List([@arith_num.num_thm()]))
  let num1_th = (fn(x17 : @kernel.Thm) -> @kernel.Thm raise {
    @equal.sym(t16(x17))
  })(@arith_nat.numeral_to_num_conv(t18))
  let t21 = @list.List([(@lib.array_get(@m_taylor.n_type_array(), @lib.int63_to_int(n)), @misc_vars.nty())])
  let t19 = @simp.rewrite_rule(@list.List([num1_th]))
  let th0 = (fn(x20 : @kernel.Thm) -> @kernel.Thm raise {
    t19(@bool.disch_all(x20))
  })((fn(x23 : @kernel.Thm) -> @kernel.Thm raise {
    ((x22 : @kernel.Thm) => @kernel.inst_type(t21, x22))(x23)
  })(arith_th))
  let pty = @term_syntax.parse_type("(Real, Real)")
  let dfs = mk_vars(n, "df", pty)
  let ddfs_p = @lib.map(fn(x24 : Int64) -> @list.List[@kernel.Term] raise {
    let i = x24
    @lib.map(fn(x25 : Int64) -> @kernel.Term raise {
      let j = x25
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i)), @lib.int63_to_int(j))
    }, @lib.range(1L, i))
  }, @lib.range(1L, n))
  let ddfs = @lib.map(fn(x26 : @list.List[@kernel.Term]) -> @kernel.Term raise {
    let list = x26
    @lists.mk_list(list, pty)
  }, ddfs_p)
  let d_bounds_list = @lists.mk_list(dfs, pty)
  let dd_bounds_list = @lists.mk_list(ddfs, @kernel.type_of(@lib.hd(ddfs)))
  let th1 = @kernel.inst_rule(@list.List([(d_bounds_list, @misc_vars.d_bounds_list_var()), (dd_bounds_list, @misc_vars.dd_bounds_list_var())]), th0)
  let t28 = @simp.rewrite_rule(@list.List([@multivariate_taylor_compiled.all_n()]))
  let th2 = ((x27 : @kernel.Thm) => @equal.conv_rule(@calc_num.num_reduce_conv, x27))(t28(th1))
  let t33 = @simp.pure_rewrite_rule(@list.List([@float_theory.float_of_num(), @float_theory.min_exp_def()]))
  let t30 = @simp.rewrite_rule(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  (fn(x32 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x31 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x29 : @kernel.Thm) -> @kernel.Thm raise {
        @bool.undisch_all(final_rule(x29))
      })(t30(x31))
    })(@arith_nat.numerals_to_num(x32))
  })(t33(th2))
}

///|
/// gen_add_thm
fn step_1() -> Unit raise {
  gen_add_thm_c.set((x35 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_add_p(), (x34 : @kernel.Thm) => @equal.conv_rule(@equal.all_conv, x34), x35))
}

///|
let gen_add_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_add_thm")

///|
/// `gen_add_thm`
pub fn gen_add_thm(x : Int64) -> @kernel.Thm raise {
  (gen_add_thm_c.get())(x)
}

///|
/// gen_sub_thm
fn step_2() -> Unit raise {
  gen_sub_thm_c.set((x37 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_sub_p(), (x36 : @kernel.Thm) => @equal.conv_rule(@equal.all_conv, x36), x37))
}

///|
let gen_sub_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_sub_thm")

///|
/// `gen_sub_thm`
pub fn gen_sub_thm(x : Int64) -> @kernel.Thm raise {
  (gen_sub_thm_c.get())(x)
}

///|
/// gen_mul_thm
fn step_3() -> Unit raise {
  gen_mul_thm_c.set((x39 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_mul_p(), (x38 : @kernel.Thm) => @equal.conv_rule(@equal.all_conv, x38), x39))
}

///|
let gen_mul_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_mul_thm")

///|
/// `gen_mul_thm`
pub fn gen_mul_thm(x : Int64) -> @kernel.Thm raise {
  (gen_mul_thm_c.get())(x)
}

///|
/// gen_neg_thm
fn step_4() -> Unit raise {
  gen_neg_thm_c.set((x41 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_neg_p(), (x40 : @kernel.Thm) => @equal.conv_rule(@equal.all_conv, x40), x41))
}

///|
let gen_neg_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_neg_thm")

///|
/// `gen_neg_thm`
pub fn gen_neg_thm(x : Int64) -> @kernel.Thm raise {
  (gen_neg_thm_c.get())(x)
}

///|
/// gen_inv_thm
fn step_5() -> Unit raise {
  let t42 = @simp.rewrite_rule(@list.List([@more_float.float2_eq()]))
  gen_inv_thm_c.set((x43 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_inv_p(), t42, x43))
}

///|
let gen_inv_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_inv_thm")

///|
/// `gen_inv_thm`
pub fn gen_inv_thm(x : Int64) -> @kernel.Thm raise {
  (gen_inv_thm_c.get())(x)
}

///|
/// gen_sqrt_thm
fn step_6() -> Unit raise {
  let t44 = @simp.rewrite_rule(@list.List([@more_float.float2_eq()]))
  gen_sqrt_thm_c.set((x45 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_sqrt_p(), t44, x45))
}

///|
let gen_sqrt_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_sqrt_thm")

///|
/// `gen_sqrt_thm`
pub fn gen_sqrt_thm(x : Int64) -> @kernel.Thm raise {
  (gen_sqrt_thm_c.get())(x)
}

///|
/// gen_exp_thm
fn step_7() -> Unit raise {
  gen_exp_thm_c.set((x47 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_exp_p(), (x46 : @kernel.Thm) => @equal.conv_rule(@equal.all_conv, x46), x47))
}

///|
let gen_exp_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_exp_thm")

///|
/// `gen_exp_thm`
pub fn gen_exp_thm(x : Int64) -> @kernel.Thm raise {
  (gen_exp_thm_c.get())(x)
}

///|
/// gen_log_thm
fn step_8() -> Unit raise {
  let t48 = @term_syntax.parse_term("pow((x : Real), 2)")
  let t49 = @simp.rewrite_conv(@list.List([@equal.sym(@more_float.num2_eq())]))
  let pow2_th = @equal.sym(t49(t48))
  let t50 = @simp.rewrite_rule(@list.List([pow2_th]))
  gen_log_thm_c.set((x51 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_log_p(), t50, x51))
}

///|
let gen_log_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_log_thm")

///|
/// `gen_log_thm`
pub fn gen_log_thm(x : Int64) -> @kernel.Thm raise {
  (gen_log_thm_c.get())(x)
}

///|
/// gen_atn_thm
fn step_9() -> Unit raise {
  let t52 = @term_syntax.parse_term("pow((x : Real), 2)")
  let t53 = @simp.rewrite_conv(@list.List([@equal.sym(@more_float.num2_eq())]))
  let pow2_th = @equal.sym(t53(t52))
  let t54 = @simp.rewrite_rule(@list.List([@more_float.float2_eq(), @more_float.float1_eq(), pow2_th]))
  gen_atn_thm_c.set((x55 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_atn_p(), t54, x55))
}

///|
let gen_atn_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_atn_thm")

///|
/// `gen_atn_thm`
pub fn gen_atn_thm(x : Int64) -> @kernel.Thm raise {
  (gen_atn_thm_c.get())(x)
}

///|
/// gen_cos_thm
fn step_10() -> Unit raise {
  gen_cos_thm_c.set((x57 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_cos_p(), (x56 : @kernel.Thm) => @equal.conv_rule(@equal.all_conv, x56), x57))
}

///|
let gen_cos_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_cos_thm")

///|
/// `gen_cos_thm`
pub fn gen_cos_thm(x : Int64) -> @kernel.Thm raise {
  (gen_cos_thm_c.get())(x)
}

///|
/// gen_sin_thm
fn step_11() -> Unit raise {
  gen_sin_thm_c.set((x59 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_sin_p(), (x58 : @kernel.Thm) => @equal.conv_rule(@equal.all_conv, x58), x59))
}

///|
let gen_sin_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_sin_thm")

///|
/// `gen_sin_thm`
pub fn gen_sin_thm(x : Int64) -> @kernel.Thm raise {
  (gen_sin_thm_c.get())(x)
}

///|
/// gen_acs_thm
fn step_12() -> Unit raise {
  let t60 = @term_syntax.parse_term("iabs((f_bounds : (Real, Real))) < real_of_num(1)")
  let iabs_lemma = @simp.rewrite_conv(@list.List([@equal.sym(@more_float.float1_eq())]))(t60)
  let t61 = @term_syntax.parse_term("pow((x : Real), 3)")
  let t62 = @simp.rewrite_conv(@list.List([@equal.sym(@more_float.num3_eq())]))
  let pow3_lemma = @equal.sym(t62(t61))
  let t63 = @simp.rewrite_rule(@list.List([@more_float.float1_eq(), pow3_lemma]))
  let t64 = @simp.rewrite_rule(@list.List([iabs_lemma]))
  gen_acs_thm_c.set((x66 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_acs_p(), fn(x65 : @kernel.Thm) -> @kernel.Thm raise {
    t64(t63(x65))
  }, x66))
}

///|
let gen_acs_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_acs_thm")

///|
/// `gen_acs_thm`
pub fn gen_acs_thm(x : Int64) -> @kernel.Thm raise {
  (gen_acs_thm_c.get())(x)
}

///|
/// gen_asn_thm
fn step_13() -> Unit raise {
  let t67 = @term_syntax.parse_term("iabs((f_bounds : (Real, Real))) < real_of_num(1)")
  let iabs_lemma = @simp.rewrite_conv(@list.List([@equal.sym(@more_float.float1_eq())]))(t67)
  let t68 = @term_syntax.parse_term("pow((x : Real), 3)")
  let t69 = @simp.rewrite_conv(@list.List([@equal.sym(@more_float.num3_eq())]))
  let pow3_lemma = @equal.sym(t69(t68))
  let t70 = @simp.rewrite_rule(@list.List([@more_float.float1_eq(), pow3_lemma]))
  let t71 = @simp.rewrite_rule(@list.List([iabs_lemma]))
  gen_asn_thm_c.set((x73 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_asn_p(), fn(x72 : @kernel.Thm) -> @kernel.Thm raise {
    t71(t70(x72))
  }, x73))
}

///|
let gen_asn_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_asn_thm")

///|
/// `gen_asn_thm`
pub fn gen_asn_thm(x : Int64) -> @kernel.Thm raise {
  (gen_asn_thm_c.get())(x)
}

///|
/// gen_matan_thm
fn step_14() -> Unit raise {
  gen_matan_thm_c.set((x75 : Int64) => gen_taylor_arith_thm(@m_taylor_arith.mk_m_taylor_matan_p(), (x74 : @kernel.Thm) => @equal.conv_rule(@equal.all_conv, x74), x75))
}

///|
let gen_matan_thm_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("gen_matan_thm")

///|
/// `gen_matan_thm`
pub fn gen_matan_thm(x : Int64) -> @kernel.Thm raise {
  (gen_matan_thm_c.get())(x)
}

///|
let add_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("add_ths_array")

///|
/// `M_taylor_arith2.add_ths_array`
pub fn add_ths_array() -> FixedArray[@kernel.Thm] {
  add_ths_array_c.get()
}

///|
let sub_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("sub_ths_array")

///|
/// `M_taylor_arith2.sub_ths_array`
pub fn sub_ths_array() -> FixedArray[@kernel.Thm] {
  sub_ths_array_c.get()
}

///|
let mul_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("mul_ths_array")

///|
/// `M_taylor_arith2.mul_ths_array`
pub fn mul_ths_array() -> FixedArray[@kernel.Thm] {
  mul_ths_array_c.get()
}

///|
let neg_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("neg_ths_array")

///|
/// `M_taylor_arith2.neg_ths_array`
pub fn neg_ths_array() -> FixedArray[@kernel.Thm] {
  neg_ths_array_c.get()
}

///|
let inv_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("inv_ths_array")

///|
/// `M_taylor_arith2.inv_ths_array`
pub fn inv_ths_array() -> FixedArray[@kernel.Thm] {
  inv_ths_array_c.get()
}

///|
let sqrt_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("sqrt_ths_array")

///|
/// `M_taylor_arith2.sqrt_ths_array`
pub fn sqrt_ths_array() -> FixedArray[@kernel.Thm] {
  sqrt_ths_array_c.get()
}

///|
let exp_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("exp_ths_array")

///|
/// `M_taylor_arith2.exp_ths_array`
pub fn exp_ths_array() -> FixedArray[@kernel.Thm] {
  exp_ths_array_c.get()
}

///|
let log_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("log_ths_array")

///|
/// `M_taylor_arith2.log_ths_array`
pub fn log_ths_array() -> FixedArray[@kernel.Thm] {
  log_ths_array_c.get()
}

///|
let atn_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("atn_ths_array")

///|
/// `M_taylor_arith2.atn_ths_array`
pub fn atn_ths_array() -> FixedArray[@kernel.Thm] {
  atn_ths_array_c.get()
}

///|
let cos_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("cos_ths_array")

///|
/// `M_taylor_arith2.cos_ths_array`
pub fn cos_ths_array() -> FixedArray[@kernel.Thm] {
  cos_ths_array_c.get()
}

///|
let sin_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("sin_ths_array")

///|
/// `M_taylor_arith2.sin_ths_array`
pub fn sin_ths_array() -> FixedArray[@kernel.Thm] {
  sin_ths_array_c.get()
}

///|
let acs_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("acs_ths_array")

///|
/// `M_taylor_arith2.acs_ths_array`
pub fn acs_ths_array() -> FixedArray[@kernel.Thm] {
  acs_ths_array_c.get()
}

///|
let asn_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("asn_ths_array")

///|
/// `M_taylor_arith2.asn_ths_array`
pub fn asn_ths_array() -> FixedArray[@kernel.Thm] {
  asn_ths_array_c.get()
}

///|
let matan_ths_array_c : @lib.Cell[FixedArray[@kernel.Thm]] = @lib.Cell::new("matan_ths_array")

///|
/// `M_taylor_arith2.matan_ths_array`
pub fn matan_ths_array() -> FixedArray[@kernel.Thm] {
  matan_ths_array_c.get()
}

///|
/// add_ths_array, sub_ths_array, mul_ths_array, neg_ths_array, inv_ths_array, sqrt_ths_array, exp_ths_array, log_ths_array, atn_ths_array, cos_ths_array, sin_ths_array, acs_ths_array, asn_ths_array, matan_ths_array
fn step_15() -> Unit raise {
  let gen : ((Int64) -> @kernel.Thm raise) -> FixedArray[@kernel.Thm] raise = fn(x76 : (Int64) -> @kernel.Thm raise) -> FixedArray[@kernel.Thm] raise {
    let f = x76
    @lib.array_init(@lib.add63(@m_taylor.max_dim(), 1L), fn(x77 : Int64) -> @kernel.Thm raise {
      let i = x77
      if (i == 0L) {
        @bool.truth()
      } else {
        f(i)
      }
    })
  }
  let t78 = gen(gen_matan_thm)
  let t79 = gen(gen_asn_thm)
  let t80 = gen(gen_acs_thm)
  let t81 = gen(gen_sin_thm)
  let t82 = gen(gen_cos_thm)
  let t83 = gen(gen_atn_thm)
  let t84 = gen(gen_log_thm)
  let t85 = gen(gen_exp_thm)
  let t86 = gen(gen_sqrt_thm)
  let t87 = gen(gen_inv_thm)
  let t88 = gen(gen_neg_thm)
  let t89 = gen(gen_mul_thm)
  let t90 = gen(gen_sub_thm)
  let (add_ths_array, sub_ths_array, mul_ths_array, neg_ths_array, inv_ths_array, sqrt_ths_array, exp_ths_array, log_ths_array, atn_ths_array, cos_ths_array, sin_ths_array, acs_ths_array, asn_ths_array, matan_ths_array) = (gen(gen_add_thm), t90, t89, t88, t87, t86, t85, t84, t83, t82, t81, t80, t79, t78)
  add_ths_array_c.set(add_ths_array)
  sub_ths_array_c.set(sub_ths_array)
  mul_ths_array_c.set(mul_ths_array)
  neg_ths_array_c.set(neg_ths_array)
  inv_ths_array_c.set(inv_ths_array)
  sqrt_ths_array_c.set(sqrt_ths_array)
  exp_ths_array_c.set(exp_ths_array)
  log_ths_array_c.set(log_ths_array)
  atn_ths_array_c.set(atn_ths_array)
  cos_ths_array_c.set(cos_ths_array)
  sin_ths_array_c.set(sin_ths_array)
  acs_ths_array_c.set(acs_ths_array)
  asn_ths_array_c.set(asn_ths_array)
  matan_ths_array_c.set(matan_ths_array)
}

///|
/// `eval_m_taylor_add2`
pub fn eval_m_taylor_add2(x91 : Int64, x92 : Int64, x93 : Int64, x94 : @kernel.Thm, x95 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x91
  let p_lin = x92
  let p_second = x93
  let taylor1_th = x94
  let taylor2_th = x95
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let (_, diff2_f2_th, lin2_th, second2_th) = @m_taylor.dest_m_taylor_thms(n)(taylor2_th)
  let f1_tm = @kernel.rand((fn(x96 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x96)
  })(diff2_f1_th))
  let f2_tm = @kernel.rand((fn(x97 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x97)
  })(diff2_f2_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let g_var = @kernel.mk_var("g", @kernel.type_of(f2_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let (_, bounds2_th, df2_th) = @m_taylor_arith.m_lin_approx_components(n, lin2_th)
  let bounds_th = @arith_float.float_interval_add(p_lin, bounds1_th, bounds2_th)
  let bounds_tm = @kernel.rand((fn(x98 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x98)
  })(bounds_th))
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, all_n_components2(n, df1_th))
  let df2_ths = @lib.map(@misc_functions.my_beta_rule, all_n_components2(n, df2_th))
  let df_ths = @lib.map2((x99 : @kernel.Thm, x100 : @kernel.Thm) => @arith_float.float_interval_add(p_lin, x99, x100), df1_ths, df2_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1_p = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd2_p = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second2_th))
  let dd1 = @lib.map2(fn(x101 : Int64, x102 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x101
    (fn(x106 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x105 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x103 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x103))(((x104 : @kernel.Thm) => all_n_components2(i, x104))(x105))
      })(@misc_functions.my_beta_rule(x106))
    })(x102)
  }, @lib.range(1L, n), dd1_p)
  let dd2 = @lib.map2(fn(x107 : Int64, x108 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i_1 = x107
    (fn(x112 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x111 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x109 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x109))(((x110 : @kernel.Thm) => all_n_components2(i_1, x110))(x111))
      })(@misc_functions.my_beta_rule(x112))
    })(x108)
  }, @lib.range(1L, n), dd2_p)
  let dd_ths = @lib.map2((x115 : @list.List[@kernel.Thm], x116 : @list.List[@kernel.Thm]) => @lib.map2((x113 : @kernel.Thm, x114 : @kernel.Thm) => @arith_float.float_interval_add(p_second, x113, x114), x115, x116), dd1, dd2)
  let t120 = @lib.flat(dd_ths)
  let dd_th = (fn(x118 : @kernel.Thm) -> @kernel.Thm raise {
    ((x117 : @kernel.Thm) => @bool.gen(x_var, x117))(@bool.disch_all(x118))
  })(((x119 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x119))(t120))
  let df_vars = @lib.map(fn(x121 : Int64) -> @kernel.Term raise {
    let i_2 = x121
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x122 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x122
    @lib.map(fn(x123 : Int64) -> @kernel.Term raise {
      let j = x123
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x125 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x124 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x124)
    })(x125))
  }, df_ths)
  let dds = @lib.map((x128 : @list.List[@kernel.Thm]) => @lib.map(fn(x127 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x126 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x126)
    })(x127))
  }, x128), dd_ths)
  let t129 = @lib.flat(dd_vars)
  let t130 = @lib.zip(@lib.flat(dds), t129)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t130)
  let t143 = @lib.array_get(add_ths_array(), @lib.int63_to_int(n))
  let th = (fn(x141 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x139 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x137 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x135 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x133 : @kernel.Thm) -> @kernel.Thm raise {
            ((x131 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x131))(((x132 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f2_th, x132))(x133))
          })(((x134 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x134))(x135))
        })(((x136 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x136))(x137))
      })(((x138 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x138))(x139))
    })(((x140 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x140))(x141))
  })(((x142 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f2_tm, g_var), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x142))(t143))
  let eq_th = @m_taylor_arith.binary_beta_gen_eq(f1_tm, f2_tm, x_var, @misc_vars.add_op_real())
  @m_taylor_arith.m_taylor_interval_norm(th, eq_th)
}

///|
/// `eval_m_taylor_sub2`
pub fn eval_m_taylor_sub2(x144 : Int64, x145 : Int64, x146 : Int64, x147 : @kernel.Thm, x148 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x144
  let p_lin = x145
  let p_second = x146
  let taylor1_th = x147
  let taylor2_th = x148
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let (_, diff2_f2_th, lin2_th, second2_th) = @m_taylor.dest_m_taylor_thms(n)(taylor2_th)
  let f1_tm = @kernel.rand((fn(x149 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x149)
  })(diff2_f1_th))
  let f2_tm = @kernel.rand((fn(x150 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x150)
  })(diff2_f2_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let g_var = @kernel.mk_var("g", @kernel.type_of(f2_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let (_, bounds2_th, df2_th) = @m_taylor_arith.m_lin_approx_components(n, lin2_th)
  let bounds_th = @arith_float.float_interval_sub(p_lin, bounds1_th, bounds2_th)
  let bounds_tm = @kernel.rand((fn(x151 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x151)
  })(bounds_th))
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, all_n_components2(n, df1_th))
  let df2_ths = @lib.map(@misc_functions.my_beta_rule, all_n_components2(n, df2_th))
  let df_ths = @lib.map2((x152 : @kernel.Thm, x153 : @kernel.Thm) => @arith_float.float_interval_sub(p_lin, x152, x153), df1_ths, df2_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1_p = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd2_p = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second2_th))
  let dd1 = @lib.map2(fn(x154 : Int64, x155 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x154
    (fn(x159 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x158 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x156 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x156))(((x157 : @kernel.Thm) => all_n_components2(i, x157))(x158))
      })(@misc_functions.my_beta_rule(x159))
    })(x155)
  }, @lib.range(1L, n), dd1_p)
  let dd2 = @lib.map2(fn(x160 : Int64, x161 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i_1 = x160
    (fn(x165 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x164 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x162 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x162))(((x163 : @kernel.Thm) => all_n_components2(i_1, x163))(x164))
      })(@misc_functions.my_beta_rule(x165))
    })(x161)
  }, @lib.range(1L, n), dd2_p)
  let dd_ths = @lib.map2((x168 : @list.List[@kernel.Thm], x169 : @list.List[@kernel.Thm]) => @lib.map2((x166 : @kernel.Thm, x167 : @kernel.Thm) => @arith_float.float_interval_sub(p_second, x166, x167), x168, x169), dd1, dd2)
  let t173 = @lib.flat(dd_ths)
  let dd_th = (fn(x171 : @kernel.Thm) -> @kernel.Thm raise {
    ((x170 : @kernel.Thm) => @bool.gen(x_var, x170))(@bool.disch_all(x171))
  })(((x172 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x172))(t173))
  let df_vars = @lib.map(fn(x174 : Int64) -> @kernel.Term raise {
    let i_2 = x174
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x175 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x175
    @lib.map(fn(x176 : Int64) -> @kernel.Term raise {
      let j = x176
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x178 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x177 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x177)
    })(x178))
  }, df_ths)
  let dds = @lib.map((x181 : @list.List[@kernel.Thm]) => @lib.map(fn(x180 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x179 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x179)
    })(x180))
  }, x181), dd_ths)
  let t182 = @lib.flat(dd_vars)
  let t183 = @lib.zip(@lib.flat(dds), t182)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t183)
  let t196 = @lib.array_get(sub_ths_array(), @lib.int63_to_int(n))
  let th = (fn(x194 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x192 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x190 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x188 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x186 : @kernel.Thm) -> @kernel.Thm raise {
            ((x184 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x184))(((x185 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f2_th, x185))(x186))
          })(((x187 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x187))(x188))
        })(((x189 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x189))(x190))
      })(((x191 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x191))(x192))
    })(((x193 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x193))(x194))
  })(((x195 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f2_tm, g_var), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x195))(t196))
  let eq_th = @m_taylor_arith.binary_beta_gen_eq(f1_tm, f2_tm, x_var, @misc_vars.sub_op_real())
  @m_taylor_arith.m_taylor_interval_norm(th, eq_th)
}

///|
/// `eval_m_taylor_mul2`
pub fn eval_m_taylor_mul2(x197 : Int64, x198 : Int64, x199 : Int64, x200 : @kernel.Thm, x201 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x197
  let p_lin = x198
  let p_second = x199
  let taylor1_th = x200
  let taylor2_th = x201
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let (_, diff2_f2_th, lin2_th, second2_th) = @m_taylor.dest_m_taylor_thms(n)(taylor2_th)
  let f1_tm = @kernel.rand((fn(x202 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x202)
  })(diff2_f1_th))
  let f2_tm = @kernel.rand((fn(x203 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x203)
  })(diff2_f2_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let g_var = @kernel.mk_var("g", @kernel.type_of(f2_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let undisch : (@kernel.Thm) -> @kernel.Thm raise = fn(x205 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch(((x204 : @kernel.Thm) => @bool.spec(x_var, x204))(x205))
  }
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let (_, bounds2_th, df2_th) = @m_taylor_arith.m_lin_approx_components(n, lin2_th)
  let bounds_th = @arith_float.float_interval_mul(p_lin)(bounds1_th)(bounds2_th)
  let bounds_tm = @kernel.rand((fn(x206 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x206)
  })(bounds_th))
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, all_n_components2(n, df1_th))
  let df2_ths = @lib.map(@misc_functions.my_beta_rule, all_n_components2(n, df2_th))
  let (op_star, op_plus) = (@arith_float.float_interval_mul(p_lin), fn(x209 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x210 : @kernel.Thm) -> @kernel.Thm raise {
      ((x207 : @kernel.Thm, x208 : @kernel.Thm) => @arith_float.float_interval_add(p_lin, x207, x208))(x209, x210)
    }
  })
  let df_ths = @lib.map2(fn(x211 : @kernel.Thm, x212 : @kernel.Thm) -> @kernel.Thm raise {
    let d1 = x211
    let d2 = x212
    let t213 = op_star(bounds1_th)(d2)
    op_plus(op_star(d1)(bounds2_th))(t213)
  }, df1_ths, df2_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let d1_bounds = @lib.map(fn(x214 : Int64) -> @kernel.Thm raise {
    let i = x214
    undisch(@m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i)(taylor1_th))
  }, @lib.range(1L, n))
  let d2_bounds = @lib.map(fn(x215 : Int64) -> @kernel.Thm raise {
    let i_1 = x215
    undisch(@m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i_1)(taylor2_th))
  }, @lib.range(1L, n))
  let f1_bound = undisch(@m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th))
  let f2_bound = undisch(@m_taylor.eval_m_taylor_bound(n)(p_second)(taylor2_th))
  let ns = @lib.range(1L, n)
  let dd1_p = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd2_p = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second2_th))
  let dd1 = @lib.map2(fn(x216 : Int64, x217 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i_2 = x216
    (fn(x221 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x220 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x218 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x218))(((x219 : @kernel.Thm) => all_n_components2(i_2, x219))(x220))
      })(@misc_functions.my_beta_rule(x221))
    })(x217)
  }, ns, dd1_p)
  let dd2 = @lib.map2(fn(x222 : Int64, x223 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i_3 = x222
    (fn(x227 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x226 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x224 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x224))(((x225 : @kernel.Thm) => all_n_components2(i_3, x225))(x226))
      })(@misc_functions.my_beta_rule(x227))
    })(x223)
  }, ns, dd2_p)
  let (op_star_1, op_plus_1) = (@arith_float.float_interval_mul(p_second), fn(x230 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x231 : @kernel.Thm) -> @kernel.Thm raise {
      ((x228 : @kernel.Thm, x229 : @kernel.Thm) => @arith_float.float_interval_add(p_second, x228, x229))(x230, x231)
    }
  })
  let dd_ths = @lib.map2(fn(x232 : (@list.List[@kernel.Thm], @list.List[@kernel.Thm]), x233 : Int64) -> @list.List[@kernel.Thm] raise {
    let (dd1_list, dd2_list) = x232
    let i_4 = x233
    let di1 = @lib.list_nth(d1_bounds, @lib.int63_to_int(@lib.sub63(i_4, 1L)))
    let di2 = @lib.list_nth(d2_bounds, @lib.int63_to_int(@lib.sub63(i_4, 1L)))
    let t239 = @lib.range(1L, i_4)
    @lib.map2(fn(x234 : (@kernel.Thm, @kernel.Thm), x235 : Int64) -> @kernel.Thm raise {
      let (dd1_1, dd2_1) = x234
      let j = x235
      let dj1 = @lib.list_nth(d1_bounds, @lib.int63_to_int(@lib.sub63(j, 1L)))
      let dj2 = @lib.list_nth(d2_bounds, @lib.int63_to_int(@lib.sub63(j, 1L)))
      let t237 = op_star_1(f1_bound)(dd2_1)
      let t238 = op_plus_1(op_star_1(dj1)(di2))(t237)
      let t236 = op_star_1(di1)(dj2)
      op_plus_1(op_plus_1(op_star_1(dd1_1)(f2_bound))(t236))(t238)
    }, @lib.zip(dd1_list, dd2_list), t239)
  }, @lib.zip(dd1, dd2), ns)
  let t243 = @lib.flat(dd_ths)
  let dd_th = (fn(x241 : @kernel.Thm) -> @kernel.Thm raise {
    ((x240 : @kernel.Thm) => @bool.gen(x_var, x240))(@bool.disch_all(x241))
  })(((x242 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x242))(t243))
  let df_vars = @lib.map(fn(x244 : Int64) -> @kernel.Term raise {
    let i_5 = x244
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_5))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x245 : Int64) -> @list.List[@kernel.Term] raise {
    let i_6 = x245
    @lib.map(fn(x246 : Int64) -> @kernel.Term raise {
      let j_1 = x246
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_6)), @lib.int63_to_int(j_1))
    }, @lib.range(1L, i_6))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x248 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x247 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x247)
    })(x248))
  }, df_ths)
  let dds = @lib.map((x251 : @list.List[@kernel.Thm]) => @lib.map(fn(x250 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x249 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x249)
    })(x250))
  }, x251), dd_ths)
  let t252 = @lib.flat(dd_vars)
  let t253 = @lib.zip(@lib.flat(dds), t252)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t253)
  let t266 = @lib.array_get(mul_ths_array(), @lib.int63_to_int(n))
  let th = (fn(x264 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x262 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x260 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x258 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x256 : @kernel.Thm) -> @kernel.Thm raise {
            ((x254 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x254))(((x255 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f2_th, x255))(x256))
          })(((x257 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x257))(x258))
        })(((x259 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x259))(x260))
      })(((x261 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x261))(x262))
    })(((x263 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x263))(x264))
  })(((x265 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f2_tm, g_var), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x265))(t266))
  let eq_th = @m_taylor_arith.binary_beta_gen_eq(f1_tm, f2_tm, x_var, @misc_vars.mul_op_real())
  @m_taylor_arith.m_taylor_interval_norm(th, eq_th)
}

///|
/// `eval_m_taylor_neg2_raw`
pub fn eval_m_taylor_neg2_raw(x267 : Bool, x268 : Int64, x269 : @kernel.Thm) -> @kernel.Thm raise {
  let norm_flag = x267
  let n = x268
  let taylor1_th = x269
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let f1_tm = @kernel.rand((fn(x270 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x270)
  })(diff2_f1_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let bounds_th = @arith_float.float_interval_neg_v1(bounds1_th)
  let bounds_tm = @kernel.rand((fn(x271 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x271)
  })(bounds_th))
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, all_n_components2(n, df1_th))
  let df_ths = @lib.map(@arith_float.float_interval_neg_v1, df1_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1_p = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd1 = @lib.map2(fn(x272 : Int64, x273 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x272
    (fn(x277 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x276 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x274 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x274))(((x275 : @kernel.Thm) => all_n_components2(i, x275))(x276))
      })(@misc_functions.my_beta_rule(x277))
    })(x273)
  }, @lib.range(1L, n), dd1_p)
  let dd_ths = @lib.map((x278 : @list.List[@kernel.Thm]) => @lib.map(@arith_float.float_interval_neg_v1, x278), dd1)
  let t282 = @lib.flat(dd_ths)
  let dd_th = (fn(x280 : @kernel.Thm) -> @kernel.Thm raise {
    ((x279 : @kernel.Thm) => @bool.gen(x_var, x279))(@bool.disch_all(x280))
  })(((x281 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x281))(t282))
  let df_vars = @lib.map(fn(x283 : Int64) -> @kernel.Term raise {
    let i_1 = x283
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_1))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x284 : Int64) -> @list.List[@kernel.Term] raise {
    let i_2 = x284
    @lib.map(fn(x285 : Int64) -> @kernel.Term raise {
      let j = x285
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_2)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_2))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x287 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x286 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x286)
    })(x287))
  }, df_ths)
  let dds = @lib.map((x290 : @list.List[@kernel.Thm]) => @lib.map(fn(x289 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x288 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x288)
    })(x289))
  }, x290), dd_ths)
  let t291 = @lib.flat(dd_vars)
  let t292 = @lib.zip(@lib.flat(dds), t291)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t292)
  let t303 = @lib.array_get(neg_ths_array(), @lib.int63_to_int(n))
  let th = (fn(x301 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x299 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x297 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x295 : @kernel.Thm) -> @kernel.Thm raise {
          ((x293 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x293))(((x294 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x294))(x295))
        })(((x296 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x296))(x297))
      })(((x298 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x298))(x299))
    })(((x300 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x300))(x301))
  })(((x302 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x302))(t303))
  if norm_flag {
    let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm, x_var, @misc_vars.neg_op_real())
    @m_taylor_arith.m_taylor_interval_norm(th, eq_th)
  } else {
    th
  }
}

///|
/// eval_m_taylor_neg2
fn step_16() -> Unit raise {
  eval_m_taylor_neg2_c.set(fn(x306 : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x307 : @kernel.Thm) -> @kernel.Thm raise {
      ((x304 : Int64, x305 : @kernel.Thm) => eval_m_taylor_neg2_raw(true, x304, x305))(x306, x307)
    }
  })
}

///|
let eval_m_taylor_neg2_c : @lib.Cell[(Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise] = @lib.Cell::new("eval_m_taylor_neg2")

///|
/// `eval_m_taylor_neg2`
pub fn eval_m_taylor_neg2(x : Int64) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
  (eval_m_taylor_neg2_c.get())(x)
}

///|
/// `eval_m_taylor_abs2`
pub fn eval_m_taylor_abs2(x308 : Int64, x309 : Int64, x310 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x308
  let p_second = x309
  let taylor1_th = x310
  let f1_bound0 = @m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th)
  let f_bounds_tm = (fn(x314 : @kernel.Term) -> @kernel.Term raise {
    (fn(x313 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
      (fn(x311 : @kernel.Term) -> @kernel.Term raise {
        @kernel.rand(@kernel.rand(x311))
      })((fn(x312 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        x312.1
      })(x313))
    })(@basics.dest_forall(x314))
  })((fn(x315 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x315)
  })(f1_bound0))
  let (cond_th_2, taylor_th, th0, (f1_tm_1, domain_tm_1, y_tm_1, w_tm_1, bounds_tm_1, d_tm_1, dd_tm_1)) = try {
    let cond_th = @more_float.check_interval_pos(f_bounds_tm)
    (cond_th, taylor1_th, @m_taylor_arith.mk_m_taylor_abs_pos_p(), @m_taylor.dest_m_taylor(@kernel.concl(taylor1_th)))
  } catch {
    Failure(_) => {
      let cond_th_1 = @more_float.check_interval_neg(f_bounds_tm)
      let neg_taylor = eval_m_taylor_neg2_raw(false, n, taylor1_th)
      let (neg_f1_tm, domain_tm, y_tm, w_tm, bounds_tm, d_tm, dd_tm) = @m_taylor.dest_m_taylor(@kernel.concl(neg_taylor))
      let f1_tm = (fn(x318 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
        (fn(x316 : @kernel.Term) -> @kernel.Term raise {
          @kernel.rator(@kernel.rand(x316))
        })((fn(x317 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          x317.1
        })(x318))
      })(@kernel.dest_abs(neg_f1_tm))
      (cond_th_1, neg_taylor, @m_taylor_arith.mk_m_taylor_abs_neg_p(), (f1_tm, domain_tm, y_tm, w_tm, bounds_tm, d_tm, dd_tm))
    }
    e => raise e
  }
  let ty = @kernel.type_of(y_tm_1)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm_1))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm_1))
  let t326 = @list.List([(@lib.array_get(@m_taylor.n_type_array(), @lib.int63_to_int(n)), @misc_vars.nty())])
  let th1 = (fn(x325 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x323 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x321 : @kernel.Thm) -> @kernel.Thm raise {
        ((x319 : @kernel.Thm) => @misc_functions.my_prove_hyp(f1_bound0, x319))(((x320 : @kernel.Thm) => @misc_functions.my_prove_hyp(cond_th_2, x320))(x321))
      })(((x322 : @kernel.Thm) => @misc_functions.my_prove_hyp(taylor_th, x322))(x323))
    })(((x324 : @kernel.Thm) => @kernel.inst_rule(@list.List([(f1_tm_1, f_var), (f_bounds_tm, @misc_vars.f_bounds_var()), (domain_tm_1, domain_var), (y_tm_1, y_var), (w_tm_1, w_var), (bounds_tm_1, @misc_vars.bounds_var()), (d_tm_1, @misc_vars.d_bounds_list_var()), (dd_tm_1, @misc_vars.dd_bounds_list_var())]), x324))(x325))
  })((fn(x328 : @kernel.Thm) -> @kernel.Thm raise {
    ((x327 : @kernel.Thm) => @kernel.inst_type(t326, x327))(x328)
  })(th0))
  let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm_1, x_var, @m_taylor_arith.abs_tm())
  @m_taylor_arith.m_taylor_interval_norm(th1, eq_th)
}

///|
/// `eval_m_taylor_inv2`
pub fn eval_m_taylor_inv2(x329 : Int64, x330 : Int64, x331 : Int64, x332 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x329
  let p_lin = x330
  let p_second = x331
  let taylor1_th = x332
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let f1_tm = @kernel.rand((fn(x333 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x333)
  })(diff2_f1_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let undisch : (@kernel.Thm) -> @kernel.Thm raise = fn(x335 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch(((x334 : @kernel.Thm) => @bool.spec(x_var, x334))(x335))
  }
  let f1_bound0 = @m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th)
  let f1_bound = undisch(f1_bound0)
  let f_bounds_tm = @kernel.rand((fn(x336 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x336)
  })(f1_bound))
  let cond_th = @more_float.check_interval_not_zero(f_bounds_tm)
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let bounds_th = @more_float.float_interval_inv(p_lin)(bounds1_th)
  let bounds_tm = @kernel.rand((fn(x337 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x337)
  })(bounds_th))
  let t338 = @arith_float.float_interval_mul(p_lin)
  let (neg, inv, op_star) = (@arith_float.float_interval_neg_v1, @more_float.float_interval_inv(p_lin), t338)
  let u_bounds = neg(inv(op_star(bounds1_th)(bounds1_th)))
  let df1_ths_p = all_n_components2(n, df1_th)
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, df1_ths_p)
  let op_star_1 : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = @arith_float.float_interval_mul(p_lin)
  let df_ths = @lib.map(fn(x339 : @kernel.Thm) -> @kernel.Thm raise {
    let th1 = x339
    op_star_1(u_bounds)(th1)
  }, df1_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1 = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd_ths = @lib.map2(fn(x340 : Int64, x341 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x340
    (fn(x345 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x344 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x342 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x342))(((x343 : @kernel.Thm) => all_n_components2(i, x343))(x344))
      })(@misc_functions.my_beta_rule(x345))
    })(x341)
  }, @lib.range(1L, n), dd1)
  let d1_bounds = @lib.map(fn(x346 : Int64) -> @kernel.Thm raise {
    let i_1 = x346
    let th0 = @m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i_1)(taylor1_th)
    undisch(th0)
  }, @lib.range(1L, n))
  let t347 = @arith_float.float_interval_mul(p_second)
  let (inv_1, op_star_2) = (@more_float.float_interval_inv(p_second), t347)
  let ff = op_star_2(f1_bound)(f1_bound)
  let t348 = inv_1(op_star_2(f1_bound)(ff))
  let t349 = op_star_2(@more_float.two_interval())(t348)
  let (d1_th0, d2_th0) = (inv_1(ff), t349)
  let (op_star_3, op_minus) = (@arith_float.float_interval_mul(p_second), fn(x352 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x353 : @kernel.Thm) -> @kernel.Thm raise {
      ((x350 : @kernel.Thm, x351 : @kernel.Thm) => @arith_float.float_interval_sub(p_second, x350, x351))(x352, x353)
    }
  })
  let dd_ths_1 = @lib.map2(fn(x354 : @list.List[@kernel.Thm], x355 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let dd_list = x354
    let di1 = x355
    @misc_functions.my_map2(fn(x356 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let dd = x356
      fn(x357 : @kernel.Thm) -> @kernel.Thm raise {
        let dj1 = x357
        let t358 = op_star_3(d1_th0)(dd)
        op_minus(op_star_3(op_star_3(d2_th0)(dj1))(di1))(t358)
      }
    }, dd_list, d1_bounds)
  }, dd_ths, d1_bounds)
  let t362 = @lib.flat(dd_ths_1)
  let dd_th = (fn(x360 : @kernel.Thm) -> @kernel.Thm raise {
    ((x359 : @kernel.Thm) => @bool.gen(x_var, x359))(@bool.disch_all(x360))
  })(((x361 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x361))(t362))
  let df_vars = @lib.map(fn(x363 : Int64) -> @kernel.Term raise {
    let i_2 = x363
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x364 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x364
    @lib.map(fn(x365 : Int64) -> @kernel.Term raise {
      let j = x365
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x367 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x366 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x366)
    })(x367))
  }, df_ths)
  let dds = @lib.map((x370 : @list.List[@kernel.Thm]) => @lib.map(fn(x369 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x368 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x368)
    })(x369))
  }, x370), dd_ths_1)
  let t371 = @lib.flat(dd_vars)
  let t372 = @lib.zip(@lib.flat(dds), t371)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t372)
  let t387 = @lib.array_get(inv_ths_array(), @lib.int63_to_int(n))
  let th1_1 = (fn(x385 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x383 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x381 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x379 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x377 : @kernel.Thm) -> @kernel.Thm raise {
            (fn(x375 : @kernel.Thm) -> @kernel.Thm raise {
              ((x373 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x373))(((x374 : @kernel.Thm) => @misc_functions.my_prove_hyp(cond_th, x374))(x375))
            })(((x376 : @kernel.Thm) => @misc_functions.my_prove_hyp(f1_bound0, x376))(x377))
          })(((x378 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x378))(x379))
        })(((x380 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x380))(x381))
      })(((x382 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x382))(x383))
    })(((x384 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x384))(x385))
  })(((x386 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f_bounds_tm, @misc_vars.f_bounds_var()), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x386))(t387))
  let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm, x_var, @misc_vars.inv_op_real())
  @m_taylor_arith.m_taylor_interval_norm(th1_1, eq_th)
}

///|
/// `eval_m_taylor_sqrt2`
pub fn eval_m_taylor_sqrt2(x388 : Int64, x389 : Int64, x390 : Int64, x391 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x388
  let p_lin = x389
  let p_second = x390
  let taylor1_th = x391
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let f1_tm = @kernel.rand((fn(x392 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x392)
  })(diff2_f1_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let undisch : (@kernel.Thm) -> @kernel.Thm raise = fn(x394 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch(((x393 : @kernel.Thm) => @bool.spec(x_var, x393))(x394))
  }
  let f1_bound0 = @m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th)
  let f1_bound = undisch(f1_bound0)
  let f_bounds_tm = @kernel.rand((fn(x395 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x395)
  })(f1_bound))
  let cond_th = @more_float.check_interval_pos(f_bounds_tm)
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let bounds_th = @arith_float.float_interval_sqrt_v1(p_lin, bounds1_th)
  let bounds_tm = @kernel.rand((fn(x396 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x396)
  })(bounds_th))
  let t397 = @arith_float.float_interval_mul(p_lin)
  let (inv, op_star) = (@more_float.float_interval_inv(p_lin), t397)
  let u_bounds = inv(op_star(@more_float.two_interval())(bounds_th))
  let df1_ths_p = all_n_components2(n, df1_th)
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, df1_ths_p)
  let op_star_1 : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = @arith_float.float_interval_mul(p_lin)
  let df_ths = @lib.map(fn(x398 : @kernel.Thm) -> @kernel.Thm raise {
    let th1 = x398
    op_star_1(u_bounds)(th1)
  }, df1_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1 = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd_ths = @lib.map2(fn(x399 : Int64, x400 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x399
    (fn(x404 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x403 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x401 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x401))(((x402 : @kernel.Thm) => all_n_components2(i, x402))(x403))
      })(@misc_functions.my_beta_rule(x404))
    })(x400)
  }, @lib.range(1L, n), dd1)
  let d1_bounds = @lib.map(fn(x405 : Int64) -> @kernel.Thm raise {
    let i_1 = x405
    let th0 = @m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i_1)(taylor1_th)
    undisch(th0)
  }, @lib.range(1L, n))
  let t407 = @arith_float.float_interval_mul(p_second)
  let (neg, sqrt, inv_1, op_star_2) = (@arith_float.float_interval_neg_v1, (x406 : @kernel.Thm) => @arith_float.float_interval_sqrt_v1(p_second, x406), @more_float.float_interval_inv(p_second), t407)
  let t408 = sqrt(f1_bound)
  let two_sqrt_f = op_star_2(@more_float.two_interval())(t408)
  let t409 = op_star_2(@more_float.two_interval())(f1_bound)
  let t410 = neg(inv_1(op_star_2(two_sqrt_f)(t409)))
  let (d1_th0, d2_th0) = (inv_1(two_sqrt_f), t410)
  let (op_star_3, op_plus) = (@arith_float.float_interval_mul(p_second), fn(x413 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x414 : @kernel.Thm) -> @kernel.Thm raise {
      ((x411 : @kernel.Thm, x412 : @kernel.Thm) => @arith_float.float_interval_add(p_second, x411, x412))(x413, x414)
    }
  })
  let dd_ths_1 = @lib.map2(fn(x415 : @list.List[@kernel.Thm], x416 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let dd_list = x415
    let di1 = x416
    @misc_functions.my_map2(fn(x417 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let dd = x417
      fn(x418 : @kernel.Thm) -> @kernel.Thm raise {
        let dj1 = x418
        let t419 = op_star_3(d1_th0)(dd)
        op_plus(op_star_3(op_star_3(d2_th0)(dj1))(di1))(t419)
      }
    }, dd_list, d1_bounds)
  }, dd_ths, d1_bounds)
  let t423 = @lib.flat(dd_ths_1)
  let dd_th = (fn(x421 : @kernel.Thm) -> @kernel.Thm raise {
    ((x420 : @kernel.Thm) => @bool.gen(x_var, x420))(@bool.disch_all(x421))
  })(((x422 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x422))(t423))
  let df_vars = @lib.map(fn(x424 : Int64) -> @kernel.Term raise {
    let i_2 = x424
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x425 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x425
    @lib.map(fn(x426 : Int64) -> @kernel.Term raise {
      let j = x426
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x428 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x427 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x427)
    })(x428))
  }, df_ths)
  let dds = @lib.map((x431 : @list.List[@kernel.Thm]) => @lib.map(fn(x430 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x429 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x429)
    })(x430))
  }, x431), dd_ths_1)
  let t432 = @lib.flat(dd_vars)
  let t433 = @lib.zip(@lib.flat(dds), t432)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t433)
  let t448 = @lib.array_get(sqrt_ths_array(), @lib.int63_to_int(n))
  let th1_1 = (fn(x446 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x444 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x442 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x440 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x438 : @kernel.Thm) -> @kernel.Thm raise {
            (fn(x436 : @kernel.Thm) -> @kernel.Thm raise {
              ((x434 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x434))(((x435 : @kernel.Thm) => @misc_functions.my_prove_hyp(cond_th, x435))(x436))
            })(((x437 : @kernel.Thm) => @misc_functions.my_prove_hyp(f1_bound0, x437))(x438))
          })(((x439 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x439))(x440))
        })(((x441 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x441))(x442))
      })(((x443 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x443))(x444))
    })(((x445 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x445))(x446))
  })(((x447 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f_bounds_tm, @misc_vars.f_bounds_var()), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x447))(t448))
  let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm, x_var, @m_taylor_arith.sqrt_tm())
  @m_taylor_arith.m_taylor_interval_norm(th1_1, eq_th)
}

///|
/// `eval_m_taylor_exp2`
pub fn eval_m_taylor_exp2(x449 : Int64, x450 : Int64, x451 : Int64, x452 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x449
  let p_lin = x450
  let p_second = x451
  let taylor1_th = x452
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let f1_tm = @kernel.rand((fn(x453 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x453)
  })(diff2_f1_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let undisch : (@kernel.Thm) -> @kernel.Thm raise = fn(x455 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch(((x454 : @kernel.Thm) => @bool.spec(x_var, x454))(x455))
  }
  let f1_bound0 = @m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th)
  let f1_bound = undisch(f1_bound0)
  let f_bounds_tm = @kernel.rand((fn(x456 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x456)
  })(f1_bound))
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let bounds_th = @exp_eval.float_interval_exp(p_lin, bounds1_th)
  let bounds_tm = @kernel.rand((fn(x457 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x457)
  })(bounds_th))
  let exp : (@kernel.Thm) -> @kernel.Thm raise = (x458 : @kernel.Thm) => @exp_eval.float_interval_exp(p_lin, x458)
  let u_bounds = exp(bounds1_th)
  let df1_ths_p = all_n_components2(n, df1_th)
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, df1_ths_p)
  let op_star : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = @arith_float.float_interval_mul(p_lin)
  let df_ths = @lib.map(fn(x459 : @kernel.Thm) -> @kernel.Thm raise {
    let th1 = x459
    op_star(u_bounds)(th1)
  }, df1_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1 = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd_ths = @lib.map2(fn(x460 : Int64, x461 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x460
    (fn(x465 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x464 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x462 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x462))(((x463 : @kernel.Thm) => all_n_components2(i, x463))(x464))
      })(@misc_functions.my_beta_rule(x465))
    })(x461)
  }, @lib.range(1L, n), dd1)
  let d1_bounds = @lib.map(fn(x466 : Int64) -> @kernel.Thm raise {
    let i_1 = x466
    let th0 = @m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i_1)(taylor1_th)
    undisch(th0)
  }, @lib.range(1L, n))
  let exp_1 : (@kernel.Thm) -> @kernel.Thm raise = (x467 : @kernel.Thm) => @exp_eval.float_interval_exp(p_second, x467)
  let exp_f = exp_1(f1_bound)
  let (d1_th0, d2_th0) = (exp_f, exp_f)
  let (op_star_1, op_plus) = (@arith_float.float_interval_mul(p_second), fn(x470 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x471 : @kernel.Thm) -> @kernel.Thm raise {
      ((x468 : @kernel.Thm, x469 : @kernel.Thm) => @arith_float.float_interval_add(p_second, x468, x469))(x470, x471)
    }
  })
  let dd_ths_1 = @lib.map2(fn(x472 : @list.List[@kernel.Thm], x473 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let dd_list = x472
    let di1 = x473
    @misc_functions.my_map2(fn(x474 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let dd = x474
      fn(x475 : @kernel.Thm) -> @kernel.Thm raise {
        let dj1 = x475
        let t476 = op_star_1(d1_th0)(dd)
        op_plus(op_star_1(op_star_1(d2_th0)(dj1))(di1))(t476)
      }
    }, dd_list, d1_bounds)
  }, dd_ths, d1_bounds)
  let t480 = @lib.flat(dd_ths_1)
  let dd_th = (fn(x478 : @kernel.Thm) -> @kernel.Thm raise {
    ((x477 : @kernel.Thm) => @bool.gen(x_var, x477))(@bool.disch_all(x478))
  })(((x479 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x479))(t480))
  let df_vars = @lib.map(fn(x481 : Int64) -> @kernel.Term raise {
    let i_2 = x481
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x482 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x482
    @lib.map(fn(x483 : Int64) -> @kernel.Term raise {
      let j = x483
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x485 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x484 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x484)
    })(x485))
  }, df_ths)
  let dds = @lib.map((x488 : @list.List[@kernel.Thm]) => @lib.map(fn(x487 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x486 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x486)
    })(x487))
  }, x488), dd_ths_1)
  let t489 = @lib.flat(dd_vars)
  let t490 = @lib.zip(@lib.flat(dds), t489)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t490)
  let t503 = @lib.array_get(exp_ths_array(), @lib.int63_to_int(n))
  let th1_1 = (fn(x501 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x499 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x497 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x495 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x493 : @kernel.Thm) -> @kernel.Thm raise {
            ((x491 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x491))(((x492 : @kernel.Thm) => @misc_functions.my_prove_hyp(f1_bound0, x492))(x493))
          })(((x494 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x494))(x495))
        })(((x496 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x496))(x497))
      })(((x498 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x498))(x499))
    })(((x500 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x500))(x501))
  })(((x502 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f_bounds_tm, @misc_vars.f_bounds_var()), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x502))(t503))
  let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm, x_var, @m_taylor_arith.exp_tm())
  @m_taylor_arith.m_taylor_interval_norm(th1_1, eq_th)
}

///|
/// `eval_m_taylor_log2`
pub fn eval_m_taylor_log2(x504 : Int64, x505 : Int64, x506 : Int64, x507 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x504
  let p_lin = x505
  let p_second = x506
  let taylor1_th = x507
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let f1_tm = @kernel.rand((fn(x508 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x508)
  })(diff2_f1_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let undisch : (@kernel.Thm) -> @kernel.Thm raise = fn(x510 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch(((x509 : @kernel.Thm) => @bool.spec(x_var, x509))(x510))
  }
  let f1_bound0 = @m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th)
  let f1_bound = undisch(f1_bound0)
  let f_bounds_tm = @kernel.rand((fn(x511 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x511)
  })(f1_bound))
  let cond_th = @more_float.check_interval_pos(f_bounds_tm)
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let bounds_th = @log_eval.float_interval_log(p_lin, bounds1_th)
  let bounds_tm = @kernel.rand((fn(x512 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x512)
  })(bounds_th))
  let inv : (@kernel.Thm) -> @kernel.Thm raise = @more_float.float_interval_inv(p_lin)
  let u_bounds = inv(bounds1_th)
  let df1_ths_p = all_n_components2(n, df1_th)
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, df1_ths_p)
  let op_star : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = @arith_float.float_interval_mul(p_lin)
  let df_ths = @lib.map(fn(x513 : @kernel.Thm) -> @kernel.Thm raise {
    let th1 = x513
    op_star(u_bounds)(th1)
  }, df1_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1 = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd_ths = @lib.map2(fn(x514 : Int64, x515 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x514
    (fn(x519 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x518 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x516 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x516))(((x517 : @kernel.Thm) => all_n_components2(i, x517))(x518))
      })(@misc_functions.my_beta_rule(x519))
    })(x515)
  }, @lib.range(1L, n), dd1)
  let d1_bounds = @lib.map(fn(x520 : Int64) -> @kernel.Thm raise {
    let i_1 = x520
    let th0 = @m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i_1)(taylor1_th)
    undisch(th0)
  }, @lib.range(1L, n))
  let (neg, pow2, inv_1) = (@arith_float.float_interval_neg_v1, (x521 : @kernel.Thm) => @float_pow.float_interval_pow(p_second, 2L, x521), @more_float.float_interval_inv(p_second))
  let inv_f = inv_1(f1_bound)
  let (d1_th0, d2_th0) = (inv_f, neg(pow2(inv_f)))
  let (op_star_1, op_plus) = (@arith_float.float_interval_mul(p_second), fn(x524 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x525 : @kernel.Thm) -> @kernel.Thm raise {
      ((x522 : @kernel.Thm, x523 : @kernel.Thm) => @arith_float.float_interval_add(p_second, x522, x523))(x524, x525)
    }
  })
  let dd_ths_1 = @lib.map2(fn(x526 : @list.List[@kernel.Thm], x527 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let dd_list = x526
    let di1 = x527
    @misc_functions.my_map2(fn(x528 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let dd = x528
      fn(x529 : @kernel.Thm) -> @kernel.Thm raise {
        let dj1 = x529
        let t530 = op_star_1(d1_th0)(dd)
        op_plus(op_star_1(op_star_1(d2_th0)(dj1))(di1))(t530)
      }
    }, dd_list, d1_bounds)
  }, dd_ths, d1_bounds)
  let t534 = @lib.flat(dd_ths_1)
  let dd_th = (fn(x532 : @kernel.Thm) -> @kernel.Thm raise {
    ((x531 : @kernel.Thm) => @bool.gen(x_var, x531))(@bool.disch_all(x532))
  })(((x533 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x533))(t534))
  let df_vars = @lib.map(fn(x535 : Int64) -> @kernel.Term raise {
    let i_2 = x535
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x536 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x536
    @lib.map(fn(x537 : Int64) -> @kernel.Term raise {
      let j = x537
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x539 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x538 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x538)
    })(x539))
  }, df_ths)
  let dds = @lib.map((x542 : @list.List[@kernel.Thm]) => @lib.map(fn(x541 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x540 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x540)
    })(x541))
  }, x542), dd_ths_1)
  let t543 = @lib.flat(dd_vars)
  let t544 = @lib.zip(@lib.flat(dds), t543)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t544)
  let t559 = @lib.array_get(log_ths_array(), @lib.int63_to_int(n))
  let th1_1 = (fn(x557 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x555 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x553 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x551 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x549 : @kernel.Thm) -> @kernel.Thm raise {
            (fn(x547 : @kernel.Thm) -> @kernel.Thm raise {
              ((x545 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x545))(((x546 : @kernel.Thm) => @misc_functions.my_prove_hyp(cond_th, x546))(x547))
            })(((x548 : @kernel.Thm) => @misc_functions.my_prove_hyp(f1_bound0, x548))(x549))
          })(((x550 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x550))(x551))
        })(((x552 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x552))(x553))
      })(((x554 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x554))(x555))
    })(((x556 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x556))(x557))
  })(((x558 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f_bounds_tm, @misc_vars.f_bounds_var()), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x558))(t559))
  let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm, x_var, @m_taylor_arith.log_tm())
  @m_taylor_arith.m_taylor_interval_norm(th1_1, eq_th)
}

///|
/// `eval_m_taylor_atn2`
pub fn eval_m_taylor_atn2(x560 : Int64, x561 : Int64, x562 : Int64, x563 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x560
  let p_lin = x561
  let p_second = x562
  let taylor1_th = x563
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let f1_tm = @kernel.rand((fn(x564 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x564)
  })(diff2_f1_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let undisch : (@kernel.Thm) -> @kernel.Thm raise = fn(x566 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch(((x565 : @kernel.Thm) => @bool.spec(x_var, x565))(x566))
  }
  let f1_bound0 = @m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th)
  let f1_bound = undisch(f1_bound0)
  let f_bounds_tm = @kernel.rand((fn(x567 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x567)
  })(f1_bound))
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let bounds_th = @atn_eval.float_interval_atn(p_lin, bounds1_th)
  let bounds_tm = @kernel.rand((fn(x568 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x568)
  })(bounds_th))
  let t573 = @arith_float.float_interval_mul(p_lin)
  let (inv, op_plus, op_star) = (@more_float.float_interval_inv(p_lin), fn(x571 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x572 : @kernel.Thm) -> @kernel.Thm raise {
      ((x569 : @kernel.Thm, x570 : @kernel.Thm) => @arith_float.float_interval_add(p_lin, x569, x570))(x571, x572)
    }
  }, t573)
  let t574 = op_star(bounds1_th)(bounds1_th)
  let u_bounds = inv(op_plus(@more_float.one_interval())(t574))
  let df1_ths_p = all_n_components2(n, df1_th)
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, df1_ths_p)
  let op_star_1 : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = @arith_float.float_interval_mul(p_lin)
  let df_ths = @lib.map(fn(x575 : @kernel.Thm) -> @kernel.Thm raise {
    let th1 = x575
    op_star_1(u_bounds)(th1)
  }, df1_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1 = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd_ths = @lib.map2(fn(x576 : Int64, x577 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x576
    (fn(x581 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x580 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x578 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x578))(((x579 : @kernel.Thm) => all_n_components2(i, x579))(x580))
      })(@misc_functions.my_beta_rule(x581))
    })(x577)
  }, @lib.range(1L, n), dd1)
  let d1_bounds = @lib.map(fn(x582 : Int64) -> @kernel.Thm raise {
    let i_1 = x582
    let th0 = @m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i_1)(taylor1_th)
    undisch(th0)
  }, @lib.range(1L, n))
  let t588 = @arith_float.float_interval_mul(p_second)
  let (neg, inv_1, op_plus_1, op_star_2, pow2) = (@arith_float.float_interval_neg_v1, @more_float.float_interval_inv(p_second), fn(x585 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x586 : @kernel.Thm) -> @kernel.Thm raise {
      ((x583 : @kernel.Thm, x584 : @kernel.Thm) => @arith_float.float_interval_add(p_second, x583, x584))(x585, x586)
    }
  }, t588, (x587 : @kernel.Thm) => @float_pow.float_interval_pow(p_second, 2L, x587))
  let t589 = op_star_2(f1_bound)(f1_bound)
  let inv_one_ff = inv_1(op_plus_1(@more_float.one_interval())(t589))
  let t590 = pow2(inv_one_ff)
  let (d1_th0, d2_th0) = (inv_one_ff, op_star_2(op_star_2(@more_float.neg_two_interval())(f1_bound))(t590))
  let (op_star_3, op_plus_2) = (@arith_float.float_interval_mul(p_second), fn(x593 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x594 : @kernel.Thm) -> @kernel.Thm raise {
      ((x591 : @kernel.Thm, x592 : @kernel.Thm) => @arith_float.float_interval_add(p_second, x591, x592))(x593, x594)
    }
  })
  let dd_ths_1 = @lib.map2(fn(x595 : @list.List[@kernel.Thm], x596 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let dd_list = x595
    let di1 = x596
    @misc_functions.my_map2(fn(x597 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let dd = x597
      fn(x598 : @kernel.Thm) -> @kernel.Thm raise {
        let dj1 = x598
        let t599 = op_star_3(d1_th0)(dd)
        op_plus_2(op_star_3(op_star_3(d2_th0)(dj1))(di1))(t599)
      }
    }, dd_list, d1_bounds)
  }, dd_ths, d1_bounds)
  let t603 = @lib.flat(dd_ths_1)
  let dd_th = (fn(x601 : @kernel.Thm) -> @kernel.Thm raise {
    ((x600 : @kernel.Thm) => @bool.gen(x_var, x600))(@bool.disch_all(x601))
  })(((x602 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x602))(t603))
  let df_vars = @lib.map(fn(x604 : Int64) -> @kernel.Term raise {
    let i_2 = x604
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x605 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x605
    @lib.map(fn(x606 : Int64) -> @kernel.Term raise {
      let j = x606
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x608 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x607 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x607)
    })(x608))
  }, df_ths)
  let dds = @lib.map((x611 : @list.List[@kernel.Thm]) => @lib.map(fn(x610 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x609 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x609)
    })(x610))
  }, x611), dd_ths_1)
  let t612 = @lib.flat(dd_vars)
  let t613 = @lib.zip(@lib.flat(dds), t612)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t613)
  let t626 = @lib.array_get(atn_ths_array(), @lib.int63_to_int(n))
  let th1_1 = (fn(x624 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x622 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x620 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x618 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x616 : @kernel.Thm) -> @kernel.Thm raise {
            ((x614 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x614))(((x615 : @kernel.Thm) => @misc_functions.my_prove_hyp(f1_bound0, x615))(x616))
          })(((x617 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x617))(x618))
        })(((x619 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x619))(x620))
      })(((x621 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x621))(x622))
    })(((x623 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x623))(x624))
  })(((x625 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f_bounds_tm, @misc_vars.f_bounds_var()), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x625))(t626))
  let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm, x_var, @m_taylor_arith.atn_tm())
  @m_taylor_arith.m_taylor_interval_norm(th1_1, eq_th)
}

///|
/// `eval_m_taylor_cos2`
pub fn eval_m_taylor_cos2(x627 : Int64, x628 : Int64, x629 : Int64, x630 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x627
  let p_lin = x628
  let p_second = x629
  let taylor1_th = x630
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let f1_tm = @kernel.rand((fn(x631 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x631)
  })(diff2_f1_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let undisch : (@kernel.Thm) -> @kernel.Thm raise = fn(x633 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch(((x632 : @kernel.Thm) => @bool.spec(x_var, x632))(x633))
  }
  let f1_bound0 = @m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th)
  let f1_bound = undisch(f1_bound0)
  let f_bounds_tm = @kernel.rand((fn(x634 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x634)
  })(f1_bound))
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let bounds_th = @cos_eval.float_interval_cos(p_lin, bounds1_th)
  let bounds_tm = @kernel.rand((fn(x635 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x635)
  })(bounds_th))
  let (sin, neg) = ((x636 : @kernel.Thm) => @sin_eval.float_interval_sin(p_lin, x636), @arith_float.float_interval_neg_v1)
  let u_bounds = neg(sin(bounds1_th))
  let df1_ths_p = all_n_components2(n, df1_th)
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, df1_ths_p)
  let op_star : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = @arith_float.float_interval_mul(p_lin)
  let df_ths = @lib.map(fn(x637 : @kernel.Thm) -> @kernel.Thm raise {
    let th1 = x637
    op_star(u_bounds)(th1)
  }, df1_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1 = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd_ths = @lib.map2(fn(x638 : Int64, x639 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x638
    (fn(x643 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x642 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x640 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x640))(((x641 : @kernel.Thm) => all_n_components2(i, x641))(x642))
      })(@misc_functions.my_beta_rule(x643))
    })(x639)
  }, @lib.range(1L, n), dd1)
  let d1_bounds = @lib.map(fn(x644 : Int64) -> @kernel.Thm raise {
    let i_1 = x644
    let th0 = @m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i_1)(taylor1_th)
    undisch(th0)
  }, @lib.range(1L, n))
  let (cos, sin_1) = ((x645 : @kernel.Thm) => @cos_eval.float_interval_cos(p_second, x645), (x646 : @kernel.Thm) => @sin_eval.float_interval_sin(p_second, x646))
  let t647 = cos(f1_bound)
  let (d1_th0, d2_th0) = (sin_1(f1_bound), t647)
  let (op_star_1, op_plus) = (@arith_float.float_interval_mul(p_second), fn(x650 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x651 : @kernel.Thm) -> @kernel.Thm raise {
      ((x648 : @kernel.Thm, x649 : @kernel.Thm) => @arith_float.float_interval_add(p_second, x648, x649))(x650, x651)
    }
  })
  let neg_1 : (@kernel.Thm) -> @kernel.Thm raise = @arith_float.float_interval_neg_v1
  let dd_ths_1 = @lib.map2(fn(x652 : @list.List[@kernel.Thm], x653 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let dd_list = x652
    let di1 = x653
    @misc_functions.my_map2(fn(x654 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let dd = x654
      fn(x655 : @kernel.Thm) -> @kernel.Thm raise {
        let dj1 = x655
        let t656 = op_star_1(d1_th0)(dd)
        neg_1(op_plus(op_star_1(op_star_1(d2_th0)(dj1))(di1))(t656))
      }
    }, dd_list, d1_bounds)
  }, dd_ths, d1_bounds)
  let t660 = @lib.flat(dd_ths_1)
  let dd_th = (fn(x658 : @kernel.Thm) -> @kernel.Thm raise {
    ((x657 : @kernel.Thm) => @bool.gen(x_var, x657))(@bool.disch_all(x658))
  })(((x659 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x659))(t660))
  let df_vars = @lib.map(fn(x661 : Int64) -> @kernel.Term raise {
    let i_2 = x661
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x662 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x662
    @lib.map(fn(x663 : Int64) -> @kernel.Term raise {
      let j = x663
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x665 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x664 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x664)
    })(x665))
  }, df_ths)
  let dds = @lib.map((x668 : @list.List[@kernel.Thm]) => @lib.map(fn(x667 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x666 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x666)
    })(x667))
  }, x668), dd_ths_1)
  let t669 = @lib.flat(dd_vars)
  let t670 = @lib.zip(@lib.flat(dds), t669)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t670)
  let t683 = @lib.array_get(cos_ths_array(), @lib.int63_to_int(n))
  let th1_1 = (fn(x681 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x679 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x677 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x675 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x673 : @kernel.Thm) -> @kernel.Thm raise {
            ((x671 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x671))(((x672 : @kernel.Thm) => @misc_functions.my_prove_hyp(f1_bound0, x672))(x673))
          })(((x674 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x674))(x675))
        })(((x676 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x676))(x677))
      })(((x678 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x678))(x679))
    })(((x680 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x680))(x681))
  })(((x682 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f_bounds_tm, @misc_vars.f_bounds_var()), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x682))(t683))
  let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm, x_var, @m_taylor_arith.cos_tm())
  @m_taylor_arith.m_taylor_interval_norm(th1_1, eq_th)
}

///|
/// `eval_m_taylor_sin2`
pub fn eval_m_taylor_sin2(x684 : Int64, x685 : Int64, x686 : Int64, x687 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x684
  let p_lin = x685
  let p_second = x686
  let taylor1_th = x687
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let f1_tm = @kernel.rand((fn(x688 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x688)
  })(diff2_f1_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let undisch : (@kernel.Thm) -> @kernel.Thm raise = fn(x690 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch(((x689 : @kernel.Thm) => @bool.spec(x_var, x689))(x690))
  }
  let f1_bound0 = @m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th)
  let f1_bound = undisch(f1_bound0)
  let f_bounds_tm = @kernel.rand((fn(x691 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x691)
  })(f1_bound))
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let bounds_th = @sin_eval.float_interval_sin(p_lin, bounds1_th)
  let bounds_tm = @kernel.rand((fn(x692 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x692)
  })(bounds_th))
  let cos : (@kernel.Thm) -> @kernel.Thm raise = (x693 : @kernel.Thm) => @cos_eval.float_interval_cos(p_lin, x693)
  let u_bounds = cos(bounds1_th)
  let df1_ths_p = all_n_components2(n, df1_th)
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, df1_ths_p)
  let op_star : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = @arith_float.float_interval_mul(p_lin)
  let df_ths = @lib.map(fn(x694 : @kernel.Thm) -> @kernel.Thm raise {
    let th1 = x694
    op_star(u_bounds)(th1)
  }, df1_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1 = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd_ths = @lib.map2(fn(x695 : Int64, x696 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x695
    (fn(x700 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x699 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x697 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x697))(((x698 : @kernel.Thm) => all_n_components2(i, x698))(x699))
      })(@misc_functions.my_beta_rule(x700))
    })(x696)
  }, @lib.range(1L, n), dd1)
  let d1_bounds = @lib.map(fn(x701 : Int64) -> @kernel.Thm raise {
    let i_1 = x701
    let th0 = @m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i_1)(taylor1_th)
    undisch(th0)
  }, @lib.range(1L, n))
  let (cos_1, sin) = ((x702 : @kernel.Thm) => @cos_eval.float_interval_cos(p_second, x702), (x703 : @kernel.Thm) => @sin_eval.float_interval_sin(p_second, x703))
  let neg : (@kernel.Thm) -> @kernel.Thm raise = @arith_float.float_interval_neg_v1
  let t704 = neg(sin(f1_bound))
  let (d1_th0, d2_th0) = (cos_1(f1_bound), t704)
  let (op_star_1, op_plus) = (@arith_float.float_interval_mul(p_second), fn(x707 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x708 : @kernel.Thm) -> @kernel.Thm raise {
      ((x705 : @kernel.Thm, x706 : @kernel.Thm) => @arith_float.float_interval_add(p_second, x705, x706))(x707, x708)
    }
  })
  let dd_ths_1 = @lib.map2(fn(x709 : @list.List[@kernel.Thm], x710 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let dd_list = x709
    let di1 = x710
    @misc_functions.my_map2(fn(x711 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let dd = x711
      fn(x712 : @kernel.Thm) -> @kernel.Thm raise {
        let dj1 = x712
        let t713 = op_star_1(d1_th0)(dd)
        op_plus(op_star_1(op_star_1(d2_th0)(dj1))(di1))(t713)
      }
    }, dd_list, d1_bounds)
  }, dd_ths, d1_bounds)
  let t717 = @lib.flat(dd_ths_1)
  let dd_th = (fn(x715 : @kernel.Thm) -> @kernel.Thm raise {
    ((x714 : @kernel.Thm) => @bool.gen(x_var, x714))(@bool.disch_all(x715))
  })(((x716 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x716))(t717))
  let df_vars = @lib.map(fn(x718 : Int64) -> @kernel.Term raise {
    let i_2 = x718
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x719 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x719
    @lib.map(fn(x720 : Int64) -> @kernel.Term raise {
      let j = x720
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x722 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x721 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x721)
    })(x722))
  }, df_ths)
  let dds = @lib.map((x725 : @list.List[@kernel.Thm]) => @lib.map(fn(x724 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x723 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x723)
    })(x724))
  }, x725), dd_ths_1)
  let t726 = @lib.flat(dd_vars)
  let t727 = @lib.zip(@lib.flat(dds), t726)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t727)
  let t740 = @lib.array_get(sin_ths_array(), @lib.int63_to_int(n))
  let th1_1 = (fn(x738 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x736 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x734 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x732 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x730 : @kernel.Thm) -> @kernel.Thm raise {
            ((x728 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x728))(((x729 : @kernel.Thm) => @misc_functions.my_prove_hyp(f1_bound0, x729))(x730))
          })(((x731 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x731))(x732))
        })(((x733 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x733))(x734))
      })(((x735 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x735))(x736))
    })(((x737 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x737))(x738))
  })(((x739 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f_bounds_tm, @misc_vars.f_bounds_var()), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x739))(t740))
  let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm, x_var, @m_taylor_arith.sin_tm())
  @m_taylor_arith.m_taylor_interval_norm(th1_1, eq_th)
}

///|
/// `eval_m_taylor_asn2`
pub fn eval_m_taylor_asn2(x741 : Int64, x742 : Int64, x743 : Int64, x744 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x741
  let p_lin = x742
  let p_second = x743
  let taylor1_th = x744
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let f1_tm = @kernel.rand((fn(x745 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x745)
  })(diff2_f1_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let undisch : (@kernel.Thm) -> @kernel.Thm raise = fn(x747 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch(((x746 : @kernel.Thm) => @bool.spec(x_var, x746))(x747))
  }
  let f1_bound0 = @m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th)
  let f1_bound = undisch(f1_bound0)
  let f_bounds_tm = @kernel.rand((fn(x748 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x748)
  })(f1_bound))
  let cond_th = @bool.eqt_elim(@more_float.check_interval_iabs(f_bounds_tm, @more_float.one_float()))
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let bounds_th = @asn_acs_eval.float_interval_asn(p_lin, bounds1_th)
  let bounds_tm = @kernel.rand((fn(x749 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x749)
  })(bounds_th))
  let (inv, sqrt) = (@more_float.float_interval_inv(p_lin), (x750 : @kernel.Thm) => @arith_float.float_interval_sqrt_v1(p_lin, x750))
  let (op_star, op_minus) = (@arith_float.float_interval_mul(p_lin), fn(x753 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x754 : @kernel.Thm) -> @kernel.Thm raise {
      ((x751 : @kernel.Thm, x752 : @kernel.Thm) => @arith_float.float_interval_sub(p_lin, x751, x752))(x753, x754)
    }
  })
  let t755 = op_star(bounds1_th)(bounds1_th)
  let u_bounds = inv(sqrt(op_minus(@more_float.one_interval())(t755)))
  let df1_ths_p = all_n_components2(n, df1_th)
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, df1_ths_p)
  let op_star_1 : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = @arith_float.float_interval_mul(p_lin)
  let df_ths = @lib.map(fn(x756 : @kernel.Thm) -> @kernel.Thm raise {
    let th1 = x756
    op_star_1(u_bounds)(th1)
  }, df1_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1 = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd_ths = @lib.map2(fn(x757 : Int64, x758 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x757
    (fn(x762 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x761 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x759 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x759))(((x760 : @kernel.Thm) => all_n_components2(i, x760))(x761))
      })(@misc_functions.my_beta_rule(x762))
    })(x758)
  }, @lib.range(1L, n), dd1)
  let d1_bounds = @lib.map(fn(x763 : Int64) -> @kernel.Thm raise {
    let i_1 = x763
    let th0 = @m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i_1)(taylor1_th)
    undisch(th0)
  }, @lib.range(1L, n))
  let (sqrt_1, inv_1) = ((x764 : @kernel.Thm) => @arith_float.float_interval_sqrt_v1(p_second, x764), @more_float.float_interval_inv(p_second))
  let (op_minus_1, op_star_2, op_slash, pow3) = (fn(x767 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x768 : @kernel.Thm) -> @kernel.Thm raise {
      ((x765 : @kernel.Thm, x766 : @kernel.Thm) => @arith_float.float_interval_sub(p_second, x765, x766))(x767, x768)
    }
  }, @arith_float.float_interval_mul(p_second), fn(x771 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x772 : @kernel.Thm) -> @kernel.Thm raise {
      ((x769 : @kernel.Thm, x770 : @kernel.Thm) => @arith_float.float_interval_div(p_second, x769, x770))(x771, x772)
    }
  }, (x773 : @kernel.Thm) => @float_pow.float_interval_pow(p_second, 3L, x773))
  let t774 = op_star_2(f1_bound)(f1_bound)
  let ff_1 = op_minus_1(@more_float.one_interval())(t774)
  let t775 = sqrt_1(pow3(ff_1))
  let t776 = op_slash(f1_bound)(t775)
  let (d1_th0, d2_th0) = (inv_1(sqrt_1(ff_1)), t776)
  let (op_star_3, op_plus) = (@arith_float.float_interval_mul(p_second), fn(x779 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x780 : @kernel.Thm) -> @kernel.Thm raise {
      ((x777 : @kernel.Thm, x778 : @kernel.Thm) => @arith_float.float_interval_add(p_second, x777, x778))(x779, x780)
    }
  })
  let dd_ths_1 = @lib.map2(fn(x781 : @list.List[@kernel.Thm], x782 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let dd_list = x781
    let di1 = x782
    @misc_functions.my_map2(fn(x783 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let dd = x783
      fn(x784 : @kernel.Thm) -> @kernel.Thm raise {
        let dj1 = x784
        let t785 = op_star_3(d1_th0)(dd)
        op_plus(op_star_3(op_star_3(d2_th0)(dj1))(di1))(t785)
      }
    }, dd_list, d1_bounds)
  }, dd_ths, d1_bounds)
  let t789 = @lib.flat(dd_ths_1)
  let dd_th = (fn(x787 : @kernel.Thm) -> @kernel.Thm raise {
    ((x786 : @kernel.Thm) => @bool.gen(x_var, x786))(@bool.disch_all(x787))
  })(((x788 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x788))(t789))
  let df_vars = @lib.map(fn(x790 : Int64) -> @kernel.Term raise {
    let i_2 = x790
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x791 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x791
    @lib.map(fn(x792 : Int64) -> @kernel.Term raise {
      let j = x792
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x794 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x793 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x793)
    })(x794))
  }, df_ths)
  let dds = @lib.map((x797 : @list.List[@kernel.Thm]) => @lib.map(fn(x796 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x795 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x795)
    })(x796))
  }, x797), dd_ths_1)
  let t798 = @lib.flat(dd_vars)
  let t799 = @lib.zip(@lib.flat(dds), t798)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t799)
  let t814 = @lib.array_get(asn_ths_array(), @lib.int63_to_int(n))
  let th1_1 = (fn(x812 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x810 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x808 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x806 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x804 : @kernel.Thm) -> @kernel.Thm raise {
            (fn(x802 : @kernel.Thm) -> @kernel.Thm raise {
              ((x800 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x800))(((x801 : @kernel.Thm) => @misc_functions.my_prove_hyp(cond_th, x801))(x802))
            })(((x803 : @kernel.Thm) => @misc_functions.my_prove_hyp(f1_bound0, x803))(x804))
          })(((x805 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x805))(x806))
        })(((x807 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x807))(x808))
      })(((x809 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x809))(x810))
    })(((x811 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x811))(x812))
  })(((x813 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f_bounds_tm, @misc_vars.f_bounds_var()), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x813))(t814))
  let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm, x_var, @m_taylor_arith.asn_tm())
  @m_taylor_arith.m_taylor_interval_norm(th1_1, eq_th)
}

///|
/// `eval_m_taylor_acs2`
pub fn eval_m_taylor_acs2(x815 : Int64, x816 : Int64, x817 : Int64, x818 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x815
  let p_lin = x816
  let p_second = x817
  let taylor1_th = x818
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let f1_tm = @kernel.rand((fn(x819 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x819)
  })(diff2_f1_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let undisch : (@kernel.Thm) -> @kernel.Thm raise = fn(x821 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch(((x820 : @kernel.Thm) => @bool.spec(x_var, x820))(x821))
  }
  let f1_bound0 = @m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th)
  let f1_bound = undisch(f1_bound0)
  let f_bounds_tm = @kernel.rand((fn(x822 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x822)
  })(f1_bound))
  let cond_th = @bool.eqt_elim(@more_float.check_interval_iabs(f_bounds_tm, @more_float.one_float()))
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let bounds_th = @asn_acs_eval.float_interval_acs(p_lin, bounds1_th)
  let bounds_tm = @kernel.rand((fn(x823 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x823)
  })(bounds_th))
  let (inv, sqrt, neg) = (@more_float.float_interval_inv(p_lin), (x824 : @kernel.Thm) => @arith_float.float_interval_sqrt_v1(p_lin, x824), @arith_float.float_interval_neg_v1)
  let (op_star, op_minus) = (@arith_float.float_interval_mul(p_lin), fn(x827 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x828 : @kernel.Thm) -> @kernel.Thm raise {
      ((x825 : @kernel.Thm, x826 : @kernel.Thm) => @arith_float.float_interval_sub(p_lin, x825, x826))(x827, x828)
    }
  })
  let t829 = op_star(bounds1_th)(bounds1_th)
  let u_bounds = neg(inv(sqrt(op_minus(@more_float.one_interval())(t829))))
  let df1_ths_p = all_n_components2(n, df1_th)
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, df1_ths_p)
  let op_star_1 : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = @arith_float.float_interval_mul(p_lin)
  let df_ths = @lib.map(fn(x830 : @kernel.Thm) -> @kernel.Thm raise {
    let th1 = x830
    op_star_1(u_bounds)(th1)
  }, df1_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1 = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd_ths = @lib.map2(fn(x831 : Int64, x832 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x831
    (fn(x836 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x835 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x833 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x833))(((x834 : @kernel.Thm) => all_n_components2(i, x834))(x835))
      })(@misc_functions.my_beta_rule(x836))
    })(x832)
  }, @lib.range(1L, n), dd1)
  let d1_bounds = @lib.map(fn(x837 : Int64) -> @kernel.Thm raise {
    let i_1 = x837
    let th0 = @m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i_1)(taylor1_th)
    undisch(th0)
  }, @lib.range(1L, n))
  let (neg_1, sqrt_1, inv_1) = (@arith_float.float_interval_neg_v1, (x838 : @kernel.Thm) => @arith_float.float_interval_sqrt_v1(p_second, x838), @more_float.float_interval_inv(p_second))
  let (op_minus_1, op_star_2, op_slash, pow3) = (fn(x841 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x842 : @kernel.Thm) -> @kernel.Thm raise {
      ((x839 : @kernel.Thm, x840 : @kernel.Thm) => @arith_float.float_interval_sub(p_second, x839, x840))(x841, x842)
    }
  }, @arith_float.float_interval_mul(p_second), fn(x845 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x846 : @kernel.Thm) -> @kernel.Thm raise {
      ((x843 : @kernel.Thm, x844 : @kernel.Thm) => @arith_float.float_interval_div(p_second, x843, x844))(x845, x846)
    }
  }, (x847 : @kernel.Thm) => @float_pow.float_interval_pow(p_second, 3L, x847))
  let t848 = op_star_2(f1_bound)(f1_bound)
  let ff_1 = op_minus_1(@more_float.one_interval())(t848)
  let t849 = sqrt_1(pow3(ff_1))
  let t850 = neg_1(op_slash(f1_bound)(t849))
  let (d1_th0, d2_th0) = (inv_1(sqrt_1(ff_1)), t850)
  let (op_star_3, op_minus_2) = (@arith_float.float_interval_mul(p_second), fn(x853 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x854 : @kernel.Thm) -> @kernel.Thm raise {
      ((x851 : @kernel.Thm, x852 : @kernel.Thm) => @arith_float.float_interval_sub(p_second, x851, x852))(x853, x854)
    }
  })
  let dd_ths_1 = @lib.map2(fn(x855 : @list.List[@kernel.Thm], x856 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let dd_list = x855
    let di1 = x856
    @misc_functions.my_map2(fn(x857 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let dd = x857
      fn(x858 : @kernel.Thm) -> @kernel.Thm raise {
        let dj1 = x858
        let t859 = op_star_3(d1_th0)(dd)
        op_minus_2(op_star_3(op_star_3(d2_th0)(dj1))(di1))(t859)
      }
    }, dd_list, d1_bounds)
  }, dd_ths, d1_bounds)
  let t863 = @lib.flat(dd_ths_1)
  let dd_th = (fn(x861 : @kernel.Thm) -> @kernel.Thm raise {
    ((x860 : @kernel.Thm) => @bool.gen(x_var, x860))(@bool.disch_all(x861))
  })(((x862 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x862))(t863))
  let df_vars = @lib.map(fn(x864 : Int64) -> @kernel.Term raise {
    let i_2 = x864
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x865 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x865
    @lib.map(fn(x866 : Int64) -> @kernel.Term raise {
      let j = x866
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x868 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x867 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x867)
    })(x868))
  }, df_ths)
  let dds = @lib.map((x871 : @list.List[@kernel.Thm]) => @lib.map(fn(x870 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x869 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x869)
    })(x870))
  }, x871), dd_ths_1)
  let t872 = @lib.flat(dd_vars)
  let t873 = @lib.zip(@lib.flat(dds), t872)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t873)
  let t888 = @lib.array_get(acs_ths_array(), @lib.int63_to_int(n))
  let th1_1 = (fn(x886 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x884 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x882 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x880 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x878 : @kernel.Thm) -> @kernel.Thm raise {
            (fn(x876 : @kernel.Thm) -> @kernel.Thm raise {
              ((x874 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x874))(((x875 : @kernel.Thm) => @misc_functions.my_prove_hyp(cond_th, x875))(x876))
            })(((x877 : @kernel.Thm) => @misc_functions.my_prove_hyp(f1_bound0, x877))(x878))
          })(((x879 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x879))(x880))
        })(((x881 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x881))(x882))
      })(((x883 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x883))(x884))
    })(((x885 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x885))(x886))
  })(((x887 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f_bounds_tm, @misc_vars.f_bounds_var()), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x887))(t888))
  let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm, x_var, @m_taylor_arith.acs_tm())
  @m_taylor_arith.m_taylor_interval_norm(th1_1, eq_th)
}

///|
/// `eval_m_taylor_matan2`
pub fn eval_m_taylor_matan2(x889 : Int64, x890 : Int64, x891 : Int64, x892 : @kernel.Thm) -> @kernel.Thm raise {
  let n = x889
  let p_lin = x890
  let p_second = x891
  let taylor1_th = x892
  let (domain_th, diff2_f1_th, lin1_th, second1_th) = @m_taylor.dest_m_taylor_thms(n)(taylor1_th)
  let f1_tm = @kernel.rand((fn(x893 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x893)
  })(diff2_f1_th))
  let (domain_tm, y_tm, w_tm) = @m_taylor.dest_m_cell_domain(@kernel.concl(domain_th))
  let ty = @kernel.type_of(y_tm)
  let x_var = @kernel.mk_var("x", ty)
  let y_var = @kernel.mk_var("y", ty)
  let w_var = @kernel.mk_var("w", ty)
  let f_var = @kernel.mk_var("f", @kernel.type_of(f1_tm))
  let domain_var = @kernel.mk_var("domain", @kernel.type_of(domain_tm))
  let undisch : (@kernel.Thm) -> @kernel.Thm raise = fn(x895 : @kernel.Thm) -> @kernel.Thm raise {
    @bool.undisch(((x894 : @kernel.Thm) => @bool.spec(x_var, x894))(x895))
  }
  let f1_bound0 = @m_taylor.eval_m_taylor_bound(n)(p_second)(taylor1_th)
  let f1_bound = undisch(f1_bound0)
  let f_bounds_tm = @kernel.rand((fn(x896 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x896)
  })(f1_bound))
  let cond_th = @more_float.check_interval_gt(@m_taylor_arith.neg_one_float())(f_bounds_tm)
  let (_, bounds1_th, df1_th) = @m_taylor_arith.m_lin_approx_components(n, lin1_th)
  let bounds_th = @matan_eval.float_interval_matan(p_lin)(bounds1_th)
  let bounds_tm = @kernel.rand((fn(x897 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.concl(x897)
  })(bounds_th))
  let u_bounds = @matan_eval.float_interval_dmatan(p_lin)(bounds1_th)
  let df1_ths_p = all_n_components2(n, df1_th)
  let df1_ths = @lib.map(@misc_functions.my_beta_rule, df1_ths_p)
  let op_star : (@kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise = @arith_float.float_interval_mul(p_lin)
  let df_ths = @lib.map(fn(x898 : @kernel.Thm) -> @kernel.Thm raise {
    let th1 = x898
    op_star(u_bounds)(th1)
  }, df1_ths)
  let df_th = @lib.end_itlist(@bool.conj, df_ths)
  let dd1 = all_n_components2(n, @m_taylor_arith.second_bounded_components(n, second1_th))
  let dd_ths = @lib.map2(fn(x899 : Int64, x900 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let i = x899
    (fn(x904 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
      (fn(x903 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
        ((x901 : @list.List[@kernel.Thm]) => @lib.map(@misc_functions.my_beta_rule, x901))(((x902 : @kernel.Thm) => all_n_components2(i, x902))(x903))
      })(@misc_functions.my_beta_rule(x904))
    })(x900)
  }, @lib.range(1L, n), dd1)
  let d1_bounds = @lib.map(fn(x905 : Int64) -> @kernel.Thm raise {
    let i_1 = x905
    let th0 = @m_taylor.eval_m_taylor_partial_bound(n)(p_second)(i_1)(taylor1_th)
    undisch(th0)
  }, @lib.range(1L, n))
  let t906 = @matan_eval.float_interval_ddmatan(p_second, f1_bound)
  let (d1_th0, d2_th0) = (@matan_eval.float_interval_dmatan(p_second)(f1_bound), t906)
  let (op_star_1, op_plus) = (@arith_float.float_interval_mul(p_second), fn(x909 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
    fn(x910 : @kernel.Thm) -> @kernel.Thm raise {
      ((x907 : @kernel.Thm, x908 : @kernel.Thm) => @arith_float.float_interval_add(p_second, x907, x908))(x909, x910)
    }
  })
  let dd_ths_1 = @lib.map2(fn(x911 : @list.List[@kernel.Thm], x912 : @kernel.Thm) -> @list.List[@kernel.Thm] raise {
    let dd_list = x911
    let di1 = x912
    @misc_functions.my_map2(fn(x913 : @kernel.Thm) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
      let dd = x913
      fn(x914 : @kernel.Thm) -> @kernel.Thm raise {
        let dj1 = x914
        let t915 = op_star_1(d1_th0)(dd)
        op_plus(op_star_1(op_star_1(d2_th0)(dj1))(di1))(t915)
      }
    }, dd_list, d1_bounds)
  }, dd_ths, d1_bounds)
  let t919 = @lib.flat(dd_ths_1)
  let dd_th = (fn(x917 : @kernel.Thm) -> @kernel.Thm raise {
    ((x916 : @kernel.Thm) => @bool.gen(x_var, x916))(@bool.disch_all(x917))
  })(((x918 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x918))(t919))
  let df_vars = @lib.map(fn(x920 : Int64) -> @kernel.Term raise {
    let i_2 = x920
    @lib.array_get(@m_taylor.df_vars_array(), @lib.int63_to_int(i_2))
  }, @lib.range(1L, n))
  let dd_vars = @lib.map(fn(x921 : Int64) -> @list.List[@kernel.Term] raise {
    let i_3 = x921
    @lib.map(fn(x922 : Int64) -> @kernel.Term raise {
      let j = x922
      @lib.array_get(@lib.array_get(@m_taylor.dd_vars_array(), @lib.int63_to_int(i_3)), @lib.int63_to_int(j))
    }, @lib.range(1L, i_3))
  }, @lib.range(1L, n))
  let dfs = @lib.map(fn(x924 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x923 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x923)
    })(x924))
  }, df_ths)
  let dds = @lib.map((x927 : @list.List[@kernel.Thm]) => @lib.map(fn(x926 : @kernel.Thm) -> @kernel.Term raise {
    @kernel.rand((fn(x925 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x925)
    })(x926))
  }, x927), dd_ths_1)
  let t928 = @lib.flat(dd_vars)
  let t929 = @lib.zip(@lib.flat(dds), t928)
  let inst_list = @lib.union(@lib.zip(dfs, df_vars), t929)
  let t944 = @lib.array_get(matan_ths_array(), @lib.int63_to_int(n))
  let th1_1 = (fn(x942 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x940 : @kernel.Thm) -> @kernel.Thm raise {
      (fn(x938 : @kernel.Thm) -> @kernel.Thm raise {
        (fn(x936 : @kernel.Thm) -> @kernel.Thm raise {
          (fn(x934 : @kernel.Thm) -> @kernel.Thm raise {
            (fn(x932 : @kernel.Thm) -> @kernel.Thm raise {
              ((x930 : @kernel.Thm) => @misc_functions.my_prove_hyp(diff2_f1_th, x930))(((x931 : @kernel.Thm) => @misc_functions.my_prove_hyp(cond_th, x931))(x932))
            })(((x933 : @kernel.Thm) => @misc_functions.my_prove_hyp(f1_bound0, x933))(x934))
          })(((x935 : @kernel.Thm) => @misc_functions.my_prove_hyp(bounds_th, x935))(x936))
        })(((x937 : @kernel.Thm) => @misc_functions.my_prove_hyp(domain_th, x937))(x938))
      })(((x939 : @kernel.Thm) => @misc_functions.my_prove_hyp(dd_th, x939))(x940))
    })(((x941 : @kernel.Thm) => @misc_functions.my_prove_hyp(df_th, x941))(x942))
  })(((x943 : @kernel.Thm) => @kernel.inst_rule((@list.List([(f1_tm, f_var), (f_bounds_tm, @misc_vars.f_bounds_var()), (domain_tm, domain_var), (y_tm, y_var), (w_tm, w_var), (bounds_tm, @misc_vars.bounds_var())])).concat(inst_list), x943))(t944))
  let eq_th = @m_taylor_arith.unary_beta_gen_eq(f1_tm, x_var, @m_taylor_arith.matan_tm())
  @m_taylor_arith.m_taylor_interval_norm(th1_1, eq_th)
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
}
