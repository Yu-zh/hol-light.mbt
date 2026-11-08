// Translated from upstream Library/isum.ml; edit this file directly.

///|
/// ISUM_SUPPORT
fn step_1() -> Unit raise {
  let t1 = @simp.rewrite_tac(
    @list.List([@iterate.isum(), @iterate.iterate_support()]),
  )
  isum_support_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (_) -> Int, ∀ s : (_) -> Bool, isum(support(op_plus, f, s), f) == isum(s, f)"),
      t1,
    ),
  )
}

///|
let isum_support_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_SUPPORT")

///|
/// `ISUM_SUPPORT`
pub fn isum_support() -> @kernel.Thm {
  isum_support_c.get()
}

///|
/// int_isum
fn step_2() -> Unit raise {
  let t20 = @simp.simp_tac(
    @list.List([
      @iterate.neutral_int_add(),
      @iterate.neutral_real_add(),
      @int.int_of_num_th(),
      @int.int_add_th(),
    ]),
  )
  let t19 = @simp.simp_tac(
    @list.List([
      @iterate.iterate_clauses(),
      @iterate.monoidal_int_add(),
      @iterate.monoidal_real_add(),
    ]),
  )
  let t18 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t16 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t17 = @tactics.spec_tac(
    @term_syntax.parse_term("support(op_plus, (f : (A) -> Int), (s : (A) -> Bool))"),
    t16,
  )
  let t15 = @tactics.pop_assum(fn(
    x12 : @kernel.Thm,
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
    let s13 = @tactics.mp_tac(x12)
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
      s13(x14)
    }
  })
  let t11 = @simp.asm_rewrite_tac(
    @list.List([
      @iterate.neutral_real_add(),
      @iterate.neutral_int_add(),
      @int.int_of_num_th(),
    ]),
  )
  let t8 = @equal.gsym(@int.int_eq())
  let t9 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@int.int_of_num_th()), t8]),
  )
  let t10 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([
          @iterate.support(),
          @iterate.neutral_real_add(),
          @iterate.neutral_int_add(),
        ]),
      ),
      t9,
    ),
    @tactics.all_tac,
  ])
  let t7 = @tactics.subgoal_then(
    @term_syntax.parse_term("support(op_plus, (x : A) => real_of_int((f : (A) -> Int)(x)), (s : (A) -> Bool)) == support(op_plus, f, s)"),
    fn(
      x4 : @kernel.Thm,
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
      let s5 = @tactics.subst1_tac(x4)
      fn(
        x6 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s5(x6)
      }
    },
  )
  let t3 = @simp.once_rewrite_tac(@list.List([@iterate.iterate_expand_cases()]))
  let t2 = @simp.rewrite_tac(@list.List([@iterate.sum(), @iterate.isum()]))
  let t21 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.repeat_tac(@tactics.gen_tac),
                        t2,
                      ),
                      t3,
                    ),
                    t7,
                  ),
                  t10,
                ),
                @class.cond_cases_tac,
              ),
              t11,
            ),
            t15,
          ),
          t17,
        ),
        t18,
      ),
      t19,
    ),
    t20,
  )
  int_isum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Int, ∀ s : (A) -> Bool, real_of_int(isum(s, f)) == sum(s, (x : A) => real_of_int(f(x)))"),
      t21,
    ),
  )
}

///|
let int_isum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("int_isum")

///|
/// `int_isum`
pub fn int_isum() -> @kernel.Thm {
  int_isum_c.get()
}

///|
/// INT_OF_REAL_THM
fn step_3() -> Unit raise {
  let dest = @term_syntax.parse_term("real_of_int")
  let real_ty = @term_syntax.parse_type("Real")
  let int_ty = @term_syntax.parse_type("Int")
  let t22 = @tactics.then_tac(
    @class.cond_cases_tac,
    @simp.rewrite_tac(@list.List([])),
  )
  let cond_th = @tactics.prove(
    @term_syntax.parse_term("real_of_int(if (b : Bool) { (x : Int) } else { (y : Int) }) == (if b { real_of_int(x) } else { real_of_int(y) })"),
    t22,
  )
  let t23 = @simp.rewrite_tac(@list.List([@trivia.o_def()]))
  let compose_th = @tactics.prove(
    @term_syntax.parse_term("((x : _) => real_of_int(o((f : (_) -> Int), (g : (_) -> _), x))) == o((x : _) => real_of_int(f(x)), g)"),
    t23,
  )
  let t24 = @equal.gsym(@class.eta_ax())
  let thlist = @lib.map(
    @equal.gsym,
    @list.List([
      @int.int_eq(),
      @int.int_le(),
      @int.int_lt(),
      @int.int_ge(),
      @int.int_gt(),
      @int.int_of_num_th(),
      @int.int_neg_th(),
      @int.int_add_th(),
      @int.int_mul_th(),
      @int.int_sub_th(),
      @int.int_abs_th(),
      @int.int_max_th(),
      @int.int_min_th(),
      @int.int_pow_th(),
      int_isum(),
      @equal.gsym(@theorems.beta_thm()),
      t24,
      compose_th,
      cond_th,
    ]),
  )
  let rew_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.gen_rewrite_rule(
    fn(
      x25 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s26 = @equal.redepth_conv(x25)
      fn(x27 : @kernel.Term) -> @kernel.Thm raise { s26(x27) }
    },
    thlist,
  )
  let is_fun_into_real : (@kernel.HolType) -> @kernel.HolType raise = fn(
    x28 : @kernel.HolType,
  ) -> @kernel.HolType raise {
    let ty = x28
    try {
      match @kernel.dest_type(ty) {
        ("fun", More(s, tail=More(t, tail=Empty))) if t == real_ty =>
          @basics.mk_fun_ty(s, int_ty)
        ("real", Empty) => int_ty
        _ => raise Failure("")
      }
    } catch {
      Failure(_) => ty
      e => raise e
    }
  }
  let int_of_real_ty : (@kernel.HolType) -> @kernel.HolType raise = fn(
    x29 : @kernel.HolType,
  ) -> @kernel.HolType raise {
    let ty_1 = x29
    try {
      match @kernel.dest_type(ty_1) {
        ("real", Empty) => int_ty
        ("fun", More(s_1, tail=More(t_1, tail=Empty))) if t_1 == real_ty =>
          @basics.mk_fun_ty(s_1, int_ty)
        _ => ty_1
      }
    } catch {
      Failure(_) => ty_1
      e => raise e
    }
  }
  let int_tm_of_real_var : (@kernel.Term) -> @kernel.Term raise = fn(
    x30 : @kernel.Term,
  ) -> @kernel.Term raise {
    let v = x30
    let (s_2, ty_2) = @kernel.dest_var(v)
    let (tys, rty) = @lib.splitlist(@basics.dest_fun_ty, ty_2)
    if rty != real_ty {
      v
    } else {
      let ity = @lib.itlist(@basics.mk_fun_ty, tys, int_ty)
      let vs = @lib.map(
        fn(x31 : @kernel.HolType) -> @kernel.Term raise { @basics.genvar(x31) },
        tys,
      )
      @basics.list_mk_abs(
        vs,
        @kernel.mk_comb(
          dest,
          @basics.list_mk_comb(@kernel.mk_var(s_2, ity), vs),
        ),
      )
    }
  }
  let int_of_real_var : (@kernel.Term) -> @kernel.Term raise = fn(
    x32 : @kernel.Term,
  ) -> @kernel.Term raise {
    let v_1 = x32
    let (s_3, ty_3) = @kernel.dest_var(v_1)
    let (tys_1, rty_1) = @lib.splitlist(@basics.dest_fun_ty, ty_3)
    if rty_1 != real_ty {
      v_1
    } else {
      let ity_1 = @lib.itlist(@basics.mk_fun_ty, tys_1, int_ty)
      @kernel.mk_var(s_3, ity_1)
    }
  }
  let int_of_real_thm1 : (@kernel.Thm) -> @kernel.Thm raise = fn(
    x33 : @kernel.Thm,
  ) -> @kernel.Thm raise {
    let th = x33
    let t34 = @kernel.freesl(@kernel.hyp(th))
    let newavs = @lib.subtract(@kernel.frees(@kernel.concl(th)), t34)
    let (avs, bod) = @basics.strip_forall(@kernel.concl(th))
    let allavs = newavs.concat(avs)
    let avs_p = @lib.map(int_tm_of_real_var, allavs)
    let avs_p_p = @lib.map(int_of_real_var, avs)
    @bool.genl(avs_p_p, rew_rule(@bool.specl(avs_p, @bool.genl(newavs, th))))
  }
  fn int_of_real_thm_1(x35 : @kernel.Thm) -> @kernel.Thm raise {
    let th_1 = x35
    if @basics.is_conj(@kernel.concl(th_1)) {
      let t36 = int_of_real_thm1(@bool.conjunct2(th_1))
      @bool.conj(int_of_real_thm1(@bool.conjunct1(th_1)), t36)
    } else {
      int_of_real_thm1(th_1)
    }
  }
  int_of_real_thm_c.set(int_of_real_thm_1)
}

///|
let int_of_real_thm_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new(
  "INT_OF_REAL_THM",
)

///|
/// `INT_OF_REAL_THM`
pub fn int_of_real_thm(x : @kernel.Thm) -> @kernel.Thm raise {
  int_of_real_thm_c.get()(x)
}

///|
/// CARD_EQ_ISUM
fn step_4() -> Unit raise {
  card_eq_isum_c.set(int_of_real_thm(@iterate.card_eq_sum()))
}

///|
let card_eq_isum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_EQ_ISUM")

///|
/// `CARD_EQ_ISUM`
pub fn card_eq_isum() -> @kernel.Thm {
  card_eq_isum_c.get()
}

///|
/// INT_SUB_POW
fn step_5() -> Unit raise {
  int_sub_pow_c.set(int_of_real_thm(@iterate.real_sub_pow()))
}

///|
let int_sub_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_POW")

///|
/// `INT_SUB_POW`
pub fn int_sub_pow() -> @kernel.Thm {
  int_sub_pow_c.get()
}

///|
/// ISUM_0
fn step_6() -> Unit raise {
  isum_0_c.set(int_of_real_thm(@iterate.sum_0()))
}

///|
let isum_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_0")

///|
/// `ISUM_0`
pub fn isum_0() -> @kernel.Thm {
  isum_0_c.get()
}

///|
/// ISUM_ABS
fn step_7() -> Unit raise {
  isum_abs_c.set(int_of_real_thm(@iterate.sum_abs()))
}

///|
let isum_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_ABS")

///|
/// `ISUM_ABS`
pub fn isum_abs() -> @kernel.Thm {
  isum_abs_c.get()
}

///|
/// ISUM_ABS_BOUND
fn step_8() -> Unit raise {
  isum_abs_bound_c.set(int_of_real_thm(@iterate.sum_abs_bound()))
}

///|
let isum_abs_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_ABS_BOUND")

///|
/// `ISUM_ABS_BOUND`
pub fn isum_abs_bound() -> @kernel.Thm {
  isum_abs_bound_c.get()
}

///|
/// ISUM_ABS_LE
fn step_9() -> Unit raise {
  isum_abs_le_c.set(int_of_real_thm(@iterate.sum_abs_le()))
}

///|
let isum_abs_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_ABS_LE")

///|
/// `ISUM_ABS_LE`
pub fn isum_abs_le() -> @kernel.Thm {
  isum_abs_le_c.get()
}

///|
/// ISUM_ABS_NUMSEG
fn step_10() -> Unit raise {
  isum_abs_numseg_c.set(int_of_real_thm(@iterate.sum_abs_numseg()))
}

///|
let isum_abs_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_ABS_NUMSEG",
)

///|
/// `ISUM_ABS_NUMSEG`
pub fn isum_abs_numseg() -> @kernel.Thm {
  isum_abs_numseg_c.get()
}

///|
/// ISUM_ADD
fn step_11() -> Unit raise {
  isum_add_c.set(int_of_real_thm(@iterate.sum_add()))
}

///|
let isum_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_ADD")

///|
/// `ISUM_ADD`
pub fn isum_add() -> @kernel.Thm {
  isum_add_c.get()
}

///|
/// ISUM_ADD_NUMSEG
fn step_12() -> Unit raise {
  isum_add_numseg_c.set(int_of_real_thm(@iterate.sum_add_numseg()))
}

///|
let isum_add_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_ADD_NUMSEG",
)

///|
/// `ISUM_ADD_NUMSEG`
pub fn isum_add_numseg() -> @kernel.Thm {
  isum_add_numseg_c.get()
}

///|
/// ISUM_ADD_SPLIT
fn step_13() -> Unit raise {
  isum_add_split_c.set(int_of_real_thm(@iterate.sum_add_split()))
}

///|
let isum_add_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_ADD_SPLIT")

///|
/// `ISUM_ADD_SPLIT`
pub fn isum_add_split() -> @kernel.Thm {
  isum_add_split_c.get()
}

///|
/// ISUM_BIJECTION
fn step_14() -> Unit raise {
  isum_bijection_c.set(int_of_real_thm(@iterate.sum_bijection()))
}

///|
let isum_bijection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_BIJECTION")

///|
/// `ISUM_BIJECTION`
pub fn isum_bijection() -> @kernel.Thm {
  isum_bijection_c.get()
}

///|
/// ISUM_BOUND
fn step_15() -> Unit raise {
  isum_bound_c.set(int_of_real_thm(@iterate.sum_bound()))
}

///|
let isum_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_BOUND")

///|
/// `ISUM_BOUND`
pub fn isum_bound() -> @kernel.Thm {
  isum_bound_c.get()
}

///|
/// ISUM_BOUND_LT
fn step_16() -> Unit raise {
  isum_bound_lt_c.set(int_of_real_thm(@iterate.sum_bound_lt()))
}

///|
let isum_bound_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_BOUND_LT")

///|
/// `ISUM_BOUND_LT`
pub fn isum_bound_lt() -> @kernel.Thm {
  isum_bound_lt_c.get()
}

///|
/// ISUM_BOUND_LT_ALL
fn step_17() -> Unit raise {
  isum_bound_lt_all_c.set(int_of_real_thm(@iterate.sum_bound_lt_all()))
}

///|
let isum_bound_lt_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_BOUND_LT_ALL",
)

///|
/// `ISUM_BOUND_LT_ALL`
pub fn isum_bound_lt_all() -> @kernel.Thm {
  isum_bound_lt_all_c.get()
}

///|
/// ISUM_CASES
fn step_18() -> Unit raise {
  isum_cases_c.set(int_of_real_thm(@iterate.sum_cases()))
}

///|
let isum_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_CASES")

///|
/// `ISUM_CASES`
pub fn isum_cases() -> @kernel.Thm {
  isum_cases_c.get()
}

///|
/// ISUM_CLAUSES_LEFT
fn step_19() -> Unit raise {
  isum_clauses_left_c.set(int_of_real_thm(@iterate.sum_clauses_left()))
}

///|
let isum_clauses_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_CLAUSES_LEFT",
)

///|
/// `ISUM_CLAUSES_LEFT`
pub fn isum_clauses_left() -> @kernel.Thm {
  isum_clauses_left_c.get()
}

///|
/// ISUM_CLAUSES_NUMSEG
fn step_20() -> Unit raise {
  isum_clauses_numseg_c.set(int_of_real_thm(@iterate.sum_clauses_numseg()))
}

///|
let isum_clauses_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_CLAUSES_NUMSEG",
)

///|
/// `ISUM_CLAUSES_NUMSEG`
pub fn isum_clauses_numseg() -> @kernel.Thm {
  isum_clauses_numseg_c.get()
}

///|
/// ISUM_CLAUSES_RIGHT
fn step_21() -> Unit raise {
  isum_clauses_right_c.set(int_of_real_thm(@iterate.sum_clauses_right()))
}

///|
let isum_clauses_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_CLAUSES_RIGHT",
)

///|
/// `ISUM_CLAUSES_RIGHT`
pub fn isum_clauses_right() -> @kernel.Thm {
  isum_clauses_right_c.get()
}

///|
/// ISUM_COMBINE_L
fn step_22() -> Unit raise {
  isum_combine_l_c.set(int_of_real_thm(@iterate.sum_combine_l()))
}

///|
let isum_combine_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_COMBINE_L")

///|
/// `ISUM_COMBINE_L`
pub fn isum_combine_l() -> @kernel.Thm {
  isum_combine_l_c.get()
}

///|
/// ISUM_COMBINE_R
fn step_23() -> Unit raise {
  isum_combine_r_c.set(int_of_real_thm(@iterate.sum_combine_r()))
}

///|
let isum_combine_r_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_COMBINE_R")

///|
/// `ISUM_COMBINE_R`
pub fn isum_combine_r() -> @kernel.Thm {
  isum_combine_r_c.get()
}

///|
/// ISUM_CONST
fn step_24() -> Unit raise {
  isum_const_c.set(int_of_real_thm(@iterate.sum_const()))
}

///|
let isum_const_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_CONST")

///|
/// `ISUM_CONST`
pub fn isum_const() -> @kernel.Thm {
  isum_const_c.get()
}

///|
/// ISUM_CONST_NUMSEG
fn step_25() -> Unit raise {
  isum_const_numseg_c.set(int_of_real_thm(@iterate.sum_const_numseg()))
}

///|
let isum_const_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_CONST_NUMSEG",
)

///|
/// `ISUM_CONST_NUMSEG`
pub fn isum_const_numseg() -> @kernel.Thm {
  isum_const_numseg_c.get()
}

///|
/// ISUM_DELETE
fn step_26() -> Unit raise {
  isum_delete_c.set(int_of_real_thm(@iterate.sum_delete()))
}

///|
let isum_delete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_DELETE")

///|
/// `ISUM_DELETE`
pub fn isum_delete() -> @kernel.Thm {
  isum_delete_c.get()
}

///|
/// ISUM_DELETE_CASES
fn step_27() -> Unit raise {
  isum_delete_cases_c.set(int_of_real_thm(@iterate.sum_delete_cases()))
}

///|
let isum_delete_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_DELETE_CASES",
)

///|
/// `ISUM_DELETE_CASES`
pub fn isum_delete_cases() -> @kernel.Thm {
  isum_delete_cases_c.get()
}

///|
/// ISUM_DELTA
fn step_28() -> Unit raise {
  isum_delta_c.set(int_of_real_thm(@iterate.sum_delta()))
}

///|
let isum_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_DELTA")

///|
/// `ISUM_DELTA`
pub fn isum_delta() -> @kernel.Thm {
  isum_delta_c.get()
}

///|
/// ISUM_DIFF
fn step_29() -> Unit raise {
  isum_diff_c.set(int_of_real_thm(@iterate.sum_diff()))
}

///|
let isum_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_DIFF")

///|
/// `ISUM_DIFF`
pub fn isum_diff() -> @kernel.Thm {
  isum_diff_c.get()
}

///|
/// ISUM_DIFFS
fn step_30() -> Unit raise {
  isum_diffs_c.set(int_of_real_thm(@iterate.sum_diffs()))
}

///|
let isum_diffs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_DIFFS")

///|
/// `ISUM_DIFFS`
pub fn isum_diffs() -> @kernel.Thm {
  isum_diffs_c.get()
}

///|
/// ISUM_EQ
fn step_31() -> Unit raise {
  isum_eq_c.set(int_of_real_thm(@iterate.sum_eq()))
}

///|
let isum_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_EQ")

///|
/// `ISUM_EQ`
pub fn isum_eq() -> @kernel.Thm {
  isum_eq_c.get()
}

///|
/// ISUM_EQ_0
fn step_32() -> Unit raise {
  isum_eq_0_c.set(int_of_real_thm(@iterate.sum_eq_0()))
}

///|
let isum_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_EQ_0")

///|
/// `ISUM_EQ_0`
pub fn isum_eq_0() -> @kernel.Thm {
  isum_eq_0_c.get()
}

///|
/// ISUM_EQ_0_NUMSEG
fn step_33() -> Unit raise {
  isum_eq_0_numseg_c.set(int_of_real_thm(@iterate.sum_eq_0_numseg()))
}

///|
let isum_eq_0_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_EQ_0_NUMSEG",
)

///|
/// `ISUM_EQ_0_NUMSEG`
pub fn isum_eq_0_numseg() -> @kernel.Thm {
  isum_eq_0_numseg_c.get()
}

///|
/// ISUM_EQ_GENERAL
fn step_34() -> Unit raise {
  isum_eq_general_c.set(int_of_real_thm(@iterate.sum_eq_general()))
}

///|
let isum_eq_general_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_EQ_GENERAL",
)

///|
/// `ISUM_EQ_GENERAL`
pub fn isum_eq_general() -> @kernel.Thm {
  isum_eq_general_c.get()
}

///|
/// ISUM_EQ_GENERAL_INVERSES
fn step_35() -> Unit raise {
  isum_eq_general_inverses_c.set(
    int_of_real_thm(@iterate.sum_eq_general_inverses()),
  )
}

///|
let isum_eq_general_inverses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_EQ_GENERAL_INVERSES",
)

///|
/// `ISUM_EQ_GENERAL_INVERSES`
pub fn isum_eq_general_inverses() -> @kernel.Thm {
  isum_eq_general_inverses_c.get()
}

///|
/// ISUM_EQ_NUMSEG
fn step_36() -> Unit raise {
  isum_eq_numseg_c.set(int_of_real_thm(@iterate.sum_eq_numseg()))
}

///|
let isum_eq_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_EQ_NUMSEG")

///|
/// `ISUM_EQ_NUMSEG`
pub fn isum_eq_numseg() -> @kernel.Thm {
  isum_eq_numseg_c.get()
}

///|
/// ISUM_EQ_SUPERSET
fn step_37() -> Unit raise {
  isum_eq_superset_c.set(int_of_real_thm(@iterate.sum_eq_superset()))
}

///|
let isum_eq_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_EQ_SUPERSET",
)

///|
/// `ISUM_EQ_SUPERSET`
pub fn isum_eq_superset() -> @kernel.Thm {
  isum_eq_superset_c.get()
}

///|
/// ISUM_GROUP
fn step_38() -> Unit raise {
  isum_group_c.set(int_of_real_thm(@iterate.sum_group()))
}

///|
let isum_group_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_GROUP")

///|
/// `ISUM_GROUP`
pub fn isum_group() -> @kernel.Thm {
  isum_group_c.get()
}

///|
/// ISUM_IMAGE
fn step_39() -> Unit raise {
  isum_image_c.set(int_of_real_thm(@iterate.sum_image()))
}

///|
let isum_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_IMAGE")

///|
/// `ISUM_IMAGE`
pub fn isum_image() -> @kernel.Thm {
  isum_image_c.get()
}

///|
/// ISUM_IMAGE_GEN
fn step_40() -> Unit raise {
  isum_image_gen_c.set(int_of_real_thm(@iterate.sum_image_gen()))
}

///|
let isum_image_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_IMAGE_GEN")

///|
/// `ISUM_IMAGE_GEN`
pub fn isum_image_gen() -> @kernel.Thm {
  isum_image_gen_c.get()
}

///|
/// ISUM_IMAGE_LE
fn step_41() -> Unit raise {
  isum_image_le_c.set(int_of_real_thm(@iterate.sum_image_le()))
}

///|
let isum_image_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_IMAGE_LE")

///|
/// `ISUM_IMAGE_LE`
pub fn isum_image_le() -> @kernel.Thm {
  isum_image_le_c.get()
}

///|
/// ISUM_IMAGE_NONZERO
fn step_42() -> Unit raise {
  isum_image_nonzero_c.set(int_of_real_thm(@iterate.sum_image_nonzero()))
}

///|
let isum_image_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_IMAGE_NONZERO",
)

///|
/// `ISUM_IMAGE_NONZERO`
pub fn isum_image_nonzero() -> @kernel.Thm {
  isum_image_nonzero_c.get()
}

///|
/// ISUM_INCL_EXCL
fn step_43() -> Unit raise {
  isum_incl_excl_c.set(int_of_real_thm(@iterate.sum_incl_excl()))
}

///|
let isum_incl_excl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_INCL_EXCL")

///|
/// `ISUM_INCL_EXCL`
pub fn isum_incl_excl() -> @kernel.Thm {
  isum_incl_excl_c.get()
}

///|
/// ISUM_INJECTION
fn step_44() -> Unit raise {
  isum_injection_c.set(int_of_real_thm(@iterate.sum_injection()))
}

///|
let isum_injection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_INJECTION")

///|
/// `ISUM_INJECTION`
pub fn isum_injection() -> @kernel.Thm {
  isum_injection_c.get()
}

///|
/// ISUM_LE
fn step_45() -> Unit raise {
  isum_le_c.set(int_of_real_thm(@iterate.sum_le()))
}

///|
let isum_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_LE")

///|
/// `ISUM_LE`
pub fn isum_le() -> @kernel.Thm {
  isum_le_c.get()
}

///|
/// ISUM_LE_INCLUDED
fn step_46() -> Unit raise {
  isum_le_included_c.set(int_of_real_thm(@iterate.sum_le_included()))
}

///|
let isum_le_included_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_LE_INCLUDED",
)

///|
/// `ISUM_LE_INCLUDED`
pub fn isum_le_included() -> @kernel.Thm {
  isum_le_included_c.get()
}

///|
/// ISUM_LE_NUMSEG
fn step_47() -> Unit raise {
  isum_le_numseg_c.set(int_of_real_thm(@iterate.sum_le_numseg()))
}

///|
let isum_le_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_LE_NUMSEG")

///|
/// `ISUM_LE_NUMSEG`
pub fn isum_le_numseg() -> @kernel.Thm {
  isum_le_numseg_c.get()
}

///|
/// ISUM_LMUL
fn step_48() -> Unit raise {
  isum_lmul_c.set(int_of_real_thm(@iterate.sum_lmul()))
}

///|
let isum_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_LMUL")

///|
/// `ISUM_LMUL`
pub fn isum_lmul() -> @kernel.Thm {
  isum_lmul_c.get()
}

///|
/// ISUM_LT
fn step_49() -> Unit raise {
  isum_lt_c.set(int_of_real_thm(@iterate.sum_lt()))
}

///|
let isum_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_LT")

///|
/// `ISUM_LT`
pub fn isum_lt() -> @kernel.Thm {
  isum_lt_c.get()
}

///|
/// ISUM_LT_ALL
fn step_50() -> Unit raise {
  isum_lt_all_c.set(int_of_real_thm(@iterate.sum_lt_all()))
}

///|
let isum_lt_all_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_LT_ALL")

///|
/// `ISUM_LT_ALL`
pub fn isum_lt_all() -> @kernel.Thm {
  isum_lt_all_c.get()
}

///|
/// ISUM_MULTICOUNT
fn step_51() -> Unit raise {
  isum_multicount_c.set(int_of_real_thm(@iterate.sum_multicount()))
}

///|
let isum_multicount_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_MULTICOUNT",
)

///|
/// `ISUM_MULTICOUNT`
pub fn isum_multicount() -> @kernel.Thm {
  isum_multicount_c.get()
}

///|
/// ISUM_MULTICOUNT_GEN
fn step_52() -> Unit raise {
  isum_multicount_gen_c.set(int_of_real_thm(@iterate.sum_multicount_gen()))
}

///|
let isum_multicount_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_MULTICOUNT_GEN",
)

///|
/// `ISUM_MULTICOUNT_GEN`
pub fn isum_multicount_gen() -> @kernel.Thm {
  isum_multicount_gen_c.get()
}

///|
/// ISUM_NEG
fn step_53() -> Unit raise {
  isum_neg_c.set(int_of_real_thm(@iterate.sum_neg()))
}

///|
let isum_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_NEG")

///|
/// `ISUM_NEG`
pub fn isum_neg() -> @kernel.Thm {
  isum_neg_c.get()
}

///|
/// ISUM_OFFSET
fn step_54() -> Unit raise {
  isum_offset_c.set(int_of_real_thm(@iterate.sum_offset()))
}

///|
let isum_offset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_OFFSET")

///|
/// `ISUM_OFFSET`
pub fn isum_offset() -> @kernel.Thm {
  isum_offset_c.get()
}

///|
/// ISUM_OFFSET_0
fn step_55() -> Unit raise {
  isum_offset_0_c.set(int_of_real_thm(@iterate.sum_offset_0()))
}

///|
let isum_offset_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_OFFSET_0")

///|
/// `ISUM_OFFSET_0`
pub fn isum_offset_0() -> @kernel.Thm {
  isum_offset_0_c.get()
}

///|
/// ISUM_PARTIAL_PRE
fn step_56() -> Unit raise {
  isum_partial_pre_c.set(int_of_real_thm(@iterate.sum_partial_pre()))
}

///|
let isum_partial_pre_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_PARTIAL_PRE",
)

///|
/// `ISUM_PARTIAL_PRE`
pub fn isum_partial_pre() -> @kernel.Thm {
  isum_partial_pre_c.get()
}

///|
/// ISUM_PARTIAL_SUC
fn step_57() -> Unit raise {
  isum_partial_suc_c.set(int_of_real_thm(@iterate.sum_partial_suc()))
}

///|
let isum_partial_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_PARTIAL_SUC",
)

///|
/// `ISUM_PARTIAL_SUC`
pub fn isum_partial_suc() -> @kernel.Thm {
  isum_partial_suc_c.get()
}

///|
/// ISUM_POS_BOUND
fn step_58() -> Unit raise {
  isum_pos_bound_c.set(int_of_real_thm(@iterate.sum_pos_bound()))
}

///|
let isum_pos_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_POS_BOUND")

///|
/// `ISUM_POS_BOUND`
pub fn isum_pos_bound() -> @kernel.Thm {
  isum_pos_bound_c.get()
}

///|
/// ISUM_POS_EQ_0
fn step_59() -> Unit raise {
  isum_pos_eq_0_c.set(int_of_real_thm(@iterate.sum_pos_eq_0()))
}

///|
let isum_pos_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_POS_EQ_0")

///|
/// `ISUM_POS_EQ_0`
pub fn isum_pos_eq_0() -> @kernel.Thm {
  isum_pos_eq_0_c.get()
}

///|
/// ISUM_POS_EQ_0_NUMSEG
fn step_60() -> Unit raise {
  isum_pos_eq_0_numseg_c.set(int_of_real_thm(@iterate.sum_pos_eq_0_numseg()))
}

///|
let isum_pos_eq_0_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_POS_EQ_0_NUMSEG",
)

///|
/// `ISUM_POS_EQ_0_NUMSEG`
pub fn isum_pos_eq_0_numseg() -> @kernel.Thm {
  isum_pos_eq_0_numseg_c.get()
}

///|
/// ISUM_POS_LE
fn step_61() -> Unit raise {
  isum_pos_le_c.set(int_of_real_thm(@iterate.sum_pos_le()))
}

///|
let isum_pos_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_POS_LE")

///|
/// `ISUM_POS_LE`
pub fn isum_pos_le() -> @kernel.Thm {
  isum_pos_le_c.get()
}

///|
/// ISUM_POS_LE_NUMSEG
fn step_62() -> Unit raise {
  isum_pos_le_numseg_c.set(int_of_real_thm(@iterate.sum_pos_le_numseg()))
}

///|
let isum_pos_le_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_POS_LE_NUMSEG",
)

///|
/// `ISUM_POS_LE_NUMSEG`
pub fn isum_pos_le_numseg() -> @kernel.Thm {
  isum_pos_le_numseg_c.get()
}

///|
/// ISUM_RESTRICT
fn step_63() -> Unit raise {
  isum_restrict_c.set(int_of_real_thm(@iterate.sum_restrict()))
}

///|
let isum_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_RESTRICT")

///|
/// `ISUM_RESTRICT`
pub fn isum_restrict() -> @kernel.Thm {
  isum_restrict_c.get()
}

///|
/// ISUM_RESTRICT_SET
fn step_64() -> Unit raise {
  isum_restrict_set_c.set(int_of_real_thm(@iterate.sum_restrict_set()))
}

///|
let isum_restrict_set_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_RESTRICT_SET",
)

///|
/// `ISUM_RESTRICT_SET`
pub fn isum_restrict_set() -> @kernel.Thm {
  isum_restrict_set_c.get()
}

///|
/// ISUM_RMUL
fn step_65() -> Unit raise {
  isum_rmul_c.set(int_of_real_thm(@iterate.sum_rmul()))
}

///|
let isum_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_RMUL")

///|
/// `ISUM_RMUL`
pub fn isum_rmul() -> @kernel.Thm {
  isum_rmul_c.get()
}

///|
/// ISUM_SING
fn step_66() -> Unit raise {
  isum_sing_c.set(int_of_real_thm(@iterate.sum_sing()))
}

///|
let isum_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_SING")

///|
/// `ISUM_SING`
pub fn isum_sing() -> @kernel.Thm {
  isum_sing_c.get()
}

///|
/// ISUM_SING_NUMSEG
fn step_67() -> Unit raise {
  isum_sing_numseg_c.set(int_of_real_thm(@iterate.sum_sing_numseg()))
}

///|
let isum_sing_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_SING_NUMSEG",
)

///|
/// `ISUM_SING_NUMSEG`
pub fn isum_sing_numseg() -> @kernel.Thm {
  isum_sing_numseg_c.get()
}

///|
/// ISUM_SUB
fn step_68() -> Unit raise {
  isum_sub_c.set(int_of_real_thm(@iterate.sum_sub()))
}

///|
let isum_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_SUB")

///|
/// `ISUM_SUB`
pub fn isum_sub() -> @kernel.Thm {
  isum_sub_c.get()
}

///|
/// ISUM_SUBSET
fn step_69() -> Unit raise {
  isum_subset_c.set(int_of_real_thm(@iterate.sum_subset()))
}

///|
let isum_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_SUBSET")

///|
/// `ISUM_SUBSET`
pub fn isum_subset() -> @kernel.Thm {
  isum_subset_c.get()
}

///|
/// ISUM_SUBSET_SIMPLE
fn step_70() -> Unit raise {
  isum_subset_simple_c.set(int_of_real_thm(@iterate.sum_subset_simple()))
}

///|
let isum_subset_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_SUBSET_SIMPLE",
)

///|
/// `ISUM_SUBSET_SIMPLE`
pub fn isum_subset_simple() -> @kernel.Thm {
  isum_subset_simple_c.get()
}

///|
/// ISUM_SUB_NUMSEG
fn step_71() -> Unit raise {
  isum_sub_numseg_c.set(int_of_real_thm(@iterate.sum_sub_numseg()))
}

///|
let isum_sub_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_SUB_NUMSEG",
)

///|
/// `ISUM_SUB_NUMSEG`
pub fn isum_sub_numseg() -> @kernel.Thm {
  isum_sub_numseg_c.get()
}

///|
/// ISUM_ISUM_RESTRICT
fn step_72() -> Unit raise {
  isum_isum_restrict_c.set(int_of_real_thm(@iterate.sum_sum_restrict()))
}

///|
let isum_isum_restrict_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_ISUM_RESTRICT",
)

///|
/// `ISUM_ISUM_RESTRICT`
pub fn isum_isum_restrict() -> @kernel.Thm {
  isum_isum_restrict_c.get()
}

///|
/// ISUM_SUPERSET
fn step_73() -> Unit raise {
  isum_superset_c.set(int_of_real_thm(@iterate.sum_superset()))
}

///|
let isum_superset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_SUPERSET")

///|
/// `ISUM_SUPERSET`
pub fn isum_superset() -> @kernel.Thm {
  isum_superset_c.get()
}

///|
/// ISUM_SWAP
fn step_74() -> Unit raise {
  isum_swap_c.set(int_of_real_thm(@iterate.sum_swap()))
}

///|
let isum_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_SWAP")

///|
/// `ISUM_SWAP`
pub fn isum_swap() -> @kernel.Thm {
  isum_swap_c.get()
}

///|
/// ISUM_SWAP_NUMSEG
fn step_75() -> Unit raise {
  isum_swap_numseg_c.set(int_of_real_thm(@iterate.sum_swap_numseg()))
}

///|
let isum_swap_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_SWAP_NUMSEG",
)

///|
/// `ISUM_SWAP_NUMSEG`
pub fn isum_swap_numseg() -> @kernel.Thm {
  isum_swap_numseg_c.get()
}

///|
/// ISUM_TRIV_NUMSEG
fn step_76() -> Unit raise {
  isum_triv_numseg_c.set(int_of_real_thm(@iterate.sum_triv_numseg()))
}

///|
let isum_triv_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_TRIV_NUMSEG",
)

///|
/// `ISUM_TRIV_NUMSEG`
pub fn isum_triv_numseg() -> @kernel.Thm {
  isum_triv_numseg_c.get()
}

///|
/// ISUM_UNION
fn step_77() -> Unit raise {
  isum_union_c.set(int_of_real_thm(@iterate.sum_union()))
}

///|
let isum_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_UNION")

///|
/// `ISUM_UNION`
pub fn isum_union() -> @kernel.Thm {
  isum_union_c.get()
}

///|
/// ISUM_UNIONS_NONZERO
fn step_78() -> Unit raise {
  isum_unions_nonzero_c.set(int_of_real_thm(@iterate.sum_unions_nonzero()))
}

///|
let isum_unions_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_UNIONS_NONZERO",
)

///|
/// `ISUM_UNIONS_NONZERO`
pub fn isum_unions_nonzero() -> @kernel.Thm {
  isum_unions_nonzero_c.get()
}

///|
/// ISUM_UNION_EQ
fn step_79() -> Unit raise {
  isum_union_eq_c.set(int_of_real_thm(@iterate.sum_union_eq()))
}

///|
let isum_union_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_UNION_EQ")

///|
/// `ISUM_UNION_EQ`
pub fn isum_union_eq() -> @kernel.Thm {
  isum_union_eq_c.get()
}

///|
/// ISUM_UNION_LZERO
fn step_80() -> Unit raise {
  isum_union_lzero_c.set(int_of_real_thm(@iterate.sum_union_lzero()))
}

///|
let isum_union_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_UNION_LZERO",
)

///|
/// `ISUM_UNION_LZERO`
pub fn isum_union_lzero() -> @kernel.Thm {
  isum_union_lzero_c.get()
}

///|
/// ISUM_UNION_NONZERO
fn step_81() -> Unit raise {
  isum_union_nonzero_c.set(int_of_real_thm(@iterate.sum_union_nonzero()))
}

///|
let isum_union_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_UNION_NONZERO",
)

///|
/// `ISUM_UNION_NONZERO`
pub fn isum_union_nonzero() -> @kernel.Thm {
  isum_union_nonzero_c.get()
}

///|
/// ISUM_UNION_RZERO
fn step_82() -> Unit raise {
  isum_union_rzero_c.set(int_of_real_thm(@iterate.sum_union_rzero()))
}

///|
let isum_union_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_UNION_RZERO",
)

///|
/// `ISUM_UNION_RZERO`
pub fn isum_union_rzero() -> @kernel.Thm {
  isum_union_rzero_c.get()
}

///|
/// ISUM_ZERO_EXISTS
fn step_83() -> Unit raise {
  isum_zero_exists_c.set(int_of_real_thm(@iterate.sum_zero_exists()))
}

///|
let isum_zero_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_ZERO_EXISTS",
)

///|
/// `ISUM_ZERO_EXISTS`
pub fn isum_zero_exists() -> @kernel.Thm {
  isum_zero_exists_c.get()
}

///|
/// REAL_OF_NUM_ISUM
fn step_84() -> Unit raise {
  real_of_num_isum_c.set(int_of_real_thm(@iterate.real_of_num_sum()))
}

///|
let real_of_num_isum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_ISUM",
)

///|
/// `REAL_OF_NUM_ISUM`
pub fn real_of_num_isum() -> @kernel.Thm {
  real_of_num_isum_c.get()
}

///|
/// REAL_OF_NUM_ISUM_NUMSEG
fn step_85() -> Unit raise {
  real_of_num_isum_numseg_c.set(
    int_of_real_thm(@iterate.real_of_num_sum_numseg()),
  )
}

///|
let real_of_num_isum_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_ISUM_NUMSEG",
)

///|
/// `REAL_OF_NUM_ISUM_NUMSEG`
pub fn real_of_num_isum_numseg() -> @kernel.Thm {
  real_of_num_isum_numseg_c.get()
}

///|
/// ISUM_ISUM_PRODUCT
fn step_86() -> Unit raise {
  let t38 = @simp.rewrite_tac(@list.List([@iterate.monoidal_int_add()]))
  let t37 = @tactics.match_mp_tac(@iterate.iterate_iterate_product())
  let t39 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.isum()])), t37),
    t38,
  )
  isum_isum_product_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (A, B) -> Bool, ∀ x : (A, B) -> Int, FINITE(s) && (∀ i : A, IN(i, s) → FINITE(t(i))) → isum(s, (i : A) => isum(t(i), x(i))) == isum({((i : A), (j : B)) | IN(i, s) && IN(j, t(i))}, fn { (i, j) => x(i, j) })"),
      t39,
    ),
  )
}

///|
let isum_isum_product_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_ISUM_PRODUCT",
)

///|
/// `ISUM_ISUM_PRODUCT`
pub fn isum_isum_product() -> @kernel.Thm {
  isum_isum_product_c.get()
}

///|
/// ADMISSIBLE_ISUM
fn step_87() -> Unit raise {
  let t42 = @meson.asm_meson_tac(@list.List([]))
  let t41 = @tactics.match_mp_tac(isum_eq_numseg())
  let t40 = @tactics.repeat_tac(@tactics.strip_tac)
  let t43 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@define.admissible(), @pair.forall_pair_thm()]),
        ),
        t40,
      ),
      t41,
    ),
    t42,
  )
  admissible_isum_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ `<<` : (B, A) -> Bool, ∀ p : ((B) -> C, P) -> Bool, ∀ s : (P) -> A, ∀ h : ((B) -> C, P, Num) -> Int, ∀ a : (P) -> Num, ∀ b : (P) -> Num, admissible(`<<`, (f : (B) -> C) => fn { (k, x) => a(x) <= k && k <= b(x) && p(f, x) }, fn { (k, x) => s(x) }, (f : (B) -> C) => fn { (k, x) => h(f, x, k) }) → admissible(`<<`, p, s, (f : (B) -> C) => (x : P) => isum(op_dot_dot(a(x), b(x)), h(f, x)))"),
      t43,
    ),
  )
}

///|
let admissible_isum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ADMISSIBLE_ISUM",
)

///|
/// `ADMISSIBLE_ISUM`
pub fn admissible_isum() -> @kernel.Thm {
  admissible_isum_c.get()
}

///|
/// INT_SUB_POW_L1
fn step_88() -> Unit raise {
  let t44 = @simp.simp_tac(
    @list.List([int_of_real_thm(@iterate.real_sub_pow_l1()), @class.eta_ax()]),
  )
  int_sub_pow_l1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ n : Num, 1 <= n → int_of_num(1) - pow(x, n) == (int_of_num(1) - x) * isum(op_dot_dot(0, n - 1), (i : Num) => pow(x, i))"),
      t44,
    ),
  )
}

///|
let int_sub_pow_l1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_POW_L1")

///|
/// `INT_SUB_POW_L1`
pub fn int_sub_pow_l1() -> @kernel.Thm {
  int_sub_pow_l1_c.get()
}

///|
/// INT_SUB_POW_R1
fn step_89() -> Unit raise {
  let t45 = @simp.simp_tac(
    @list.List([int_of_real_thm(@iterate.real_sub_pow_r1()), @class.eta_ax()]),
  )
  int_sub_pow_r1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Int, ∀ n : Num, 1 <= n → pow(x, n) - int_of_num(1) == (x - int_of_num(1)) * isum(op_dot_dot(0, n - 1), (i : Num) => pow(x, i))"),
      t45,
    ),
  )
}

///|
let int_sub_pow_r1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INT_SUB_POW_R1")

///|
/// `INT_SUB_POW_R1`
pub fn int_sub_pow_r1() -> @kernel.Thm {
  int_sub_pow_r1_c.get()
}

///|
/// ISUM_UNIV
fn step_90() -> Unit raise {
  let t47 = @simp.rewrite_tac(@list.List([@iterate.monoidal_int_add()]))
  let t46 = @tactics.match_mp_tac(@iterate.iterate_univ())
  let t48 = @tactics.then_tac(
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.isum()])), t46),
    t47,
  )
  isum_univ_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ f : (A) -> Int, ∀ s : (A) -> Bool, SUBSET(support(op_plus, f, UNIV), s) → isum(s, f) == isum(UNIV, f)"),
      t48,
    ),
  )
}

///|
let isum_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_UNIV")

///|
/// `ISUM_UNIV`
pub fn isum_univ() -> @kernel.Thm {
  isum_univ_c.get()
}

///|
/// ISUM_CLOSED
fn step_91() -> Unit raise {
  let t57 = @simp.asm_simp_tac(
    @list.List([@iterate.neutral_int_add(), @equal.gsym(@iterate.isum())]),
  )
  let t53 = @term_syntax.parse_term("(P : (Int) -> Bool)")
  let t56 = @tactics.disch_then(fn(
    x55 : @kernel.Thm,
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
      x50 : @kernel.Thm,
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
      let s51 = @tactics.mp_tac(x50)
      fn(
        x52 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s51(x52)
      }
    })(((x54 : @kernel.Thm) => @bool.spec(t53, x54))(x55))
  })
  let t49 = @tactics.mp_tac(
    @drule.match_mp(@iterate.iterate_closed())(@iterate.monoidal_int_add()),
  )
  let t58 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t49),
      t56,
    ),
    t57,
  )
  isum_closed_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, ∀ f : (A) -> Int, ∀ s : (A) -> Bool, P(int_of_num(0)) && (∀ x : Int, ∀ y : Int, P(x) && P(y) → P(x + y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(isum(s, f))"),
      t58,
    ),
  )
}

///|
let isum_closed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_CLOSED")

///|
/// `ISUM_CLOSED`
pub fn isum_closed() -> @kernel.Thm {
  isum_closed_c.get()
}

///|
/// ISUM_RELATED
fn step_92() -> Unit raise {
  let t63 = @meson.asm_meson_tac(@list.List([]))
  let t62 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@iterate.isum()), @iterate.neutral_int_add()]),
  )
  let t60 = @drule.match_mp(@iterate.iterate_related())(
    @iterate.monoidal_int_add(),
  )
  let t61 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Int, Int) -> Bool)"), t60),
  )
  let t59 = @tactics.repeat_tac(@tactics.disch_tac)
  let t64 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @theorems.imp_conj(),
                @theorems.right_forall_imp_thm(),
              ]),
            ),
            @tactics.gen_tac,
          ),
          t59,
        ),
        t61,
      ),
      t62,
    ),
    t63,
  )
  isum_related_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Int, Int) -> Bool, ∀ f : (A) -> Int, ∀ g : (A) -> Int, ∀ s : (A) -> Bool, R(int_of_num(0), int_of_num(0)) && (∀ m : Int, ∀ n : Int, ∀ m' : Int, ∀ n' : Int, R(m, n) && R(m', n') → R(m + m', n + n')) && FINITE(s) && (∀ x : A, IN(x, s) → R(f(x), g(x))) → R(isum(s, f), isum(s, g))"),
      t64,
    ),
  )
}

///|
let isum_related_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_RELATED")

///|
/// `ISUM_RELATED`
pub fn isum_related() -> @kernel.Thm {
  isum_related_c.get()
}

///|
/// ISUM_CLOSED_NONEMPTY
fn step_93() -> Unit raise {
  let t73 = @simp.asm_simp_tac(
    @list.List([@iterate.neutral_int_add(), @equal.gsym(@iterate.isum())]),
  )
  let t69 = @term_syntax.parse_term("(P : (Int) -> Bool)")
  let t72 = @tactics.disch_then(fn(
    x71 : @kernel.Thm,
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
      x66 : @kernel.Thm,
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
      let s67 = @tactics.mp_tac(x66)
      fn(
        x68 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s67(x68)
      }
    })(((x70 : @kernel.Thm) => @bool.spec(t69, x70))(x71))
  })
  let t65 = @tactics.mp_tac(
    @drule.match_mp(@iterate.iterate_closed_nonempty())(
      @iterate.monoidal_int_add(),
    ),
  )
  let t74 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t65),
      t72,
    ),
    t73,
  )
  isum_closed_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Int) -> Bool, ∀ f : (A) -> Int, ∀ s : (A) -> Bool, FINITE(s) && !(s == {}) && (∀ x : Int, ∀ y : Int, P(x) && P(y) → P(x + y)) && (∀ a : A, IN(a, s) → P(f(a))) → P(isum(s, f))"),
      t74,
    ),
  )
}

///|
let isum_closed_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_CLOSED_NONEMPTY",
)

///|
/// `ISUM_CLOSED_NONEMPTY`
pub fn isum_closed_nonempty() -> @kernel.Thm {
  isum_closed_nonempty_c.get()
}

///|
/// ISUM_RELATED_NONEMPTY
fn step_94() -> Unit raise {
  let t79 = @meson.asm_meson_tac(@list.List([]))
  let t78 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@iterate.isum()), @iterate.neutral_int_add()]),
  )
  let t76 = @drule.match_mp(@iterate.iterate_related_nonempty())(
    @iterate.monoidal_int_add(),
  )
  let t77 = @tactics.mp_tac(
    @bool.ispec(@term_syntax.parse_term("(R : (Int, Int) -> Bool)"), t76),
  )
  let t75 = @tactics.repeat_tac(@tactics.disch_tac)
  let t80 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @theorems.imp_conj(),
                @theorems.right_forall_imp_thm(),
              ]),
            ),
            @tactics.gen_tac,
          ),
          t75,
        ),
        t77,
      ),
      t78,
    ),
    t79,
  )
  isum_related_nonempty_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ R : (Int, Int) -> Bool, ∀ f : (A) -> Int, ∀ g : (A) -> Int, ∀ s : (A) -> Bool, (∀ m : Int, ∀ n : Int, ∀ m' : Int, ∀ n' : Int, R(m, n) && R(m', n') → R(m + m', n + n')) && FINITE(s) && !(s == {}) && (∀ x : A, IN(x, s) → R(f(x), g(x))) → R(isum(s, f), isum(s, g))"),
      t80,
    ),
  )
}

///|
let isum_related_nonempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "ISUM_RELATED_NONEMPTY",
)

///|
/// `ISUM_RELATED_NONEMPTY`
pub fn isum_related_nonempty() -> @kernel.Thm {
  isum_related_nonempty_c.get()
}

///|
/// EXPAND_ISUM_CONV
fn step_95() -> Unit raise {
  let t82 = @simp.rewrite_tac(
    @list.List([isum_clauses_left(), isum_sing_numseg(), isum_triv_numseg()]),
  )
  let t83 = (
    @term_syntax.parse_term("((n : Num) < (m : Num) → isum(op_dot_dot(m, n), (f : (Num) -> Int)) == int_of_num(0)) && isum(op_dot_dot(m, m), f) == f(m) && (m <= n → isum(op_dot_dot(m, n), f) == f(m) + isum(op_dot_dot(m + 1, n), f))"),
    t82,
  )
  expand_isum_conv_c.set(
    match
      @bool.conjuncts_rule(
        (fn(
          x81 : (
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
          @tactics.prove(x81.0, x81.1)
        })(t83),
      ) {
      More(pth_0, tail=More(pth_1, tail=More(pth_2, tail=Empty))) => {
        let ns_tm = @term_syntax.parse_term("op_dot_dot")
        let f_tm = @term_syntax.parse_term("(f : (Num) -> Int)")
        let m_tm = @term_syntax.parse_term("(m : Num)")
        let n_tm = @term_syntax.parse_term("(n : Num)")
        fn conv(x84 : @kernel.Term) -> @kernel.Thm raise {
          let tm = x84
          let (smn, ftm) = @kernel.dest_comb(tm)
          let (s, mn) = @kernel.dest_comb(smn)
          if !(@kernel.is_const(s) && @kernel.dest_const(s).0 == "isum") {
            raise Failure("EXPAND_ISUM_CONV")
          } else {
            let (mtm, ntm) = @basics.dest_binop(ns_tm, mn)
            let m = @basics.dest_numeral(mtm)
            let n = @basics.dest_numeral(ntm)
            if @num.lt_num(n, m) {
              let th1 = @kernel.inst_rule(
                @list.List([(ftm, f_tm), (mtm, m_tm), (ntm, n_tm)]),
                pth_0,
              )
              @bool.mp(
                th1,
                @bool.eqt_elim(
                  @calc_num.num_lt_conv(@equal.lhand(@kernel.concl(th1))),
                ),
              )
            } else if @num.eq_num(n, m) {
              let t85 = @kernel.inst_rule(
                @list.List([(ftm, f_tm), (mtm, m_tm)]),
                pth_1,
              )
              @equal.conv_rule(
                @equal.rand_conv(@equal.try_conv(@equal.beta_conv)),
                t85,
              )
            } else {
              let th1_1 = @kernel.inst_rule(
                @list.List([(ftm, f_tm), (mtm, m_tm), (ntm, n_tm)]),
                pth_2,
              )
              let th2 = @bool.mp(
                th1_1,
                @bool.eqt_elim(
                  @calc_num.num_le_conv(@equal.lhand(@kernel.concl(th1_1))),
                ),
              )
              let t86 = @equal.thenc(
                @equal.land_conv(@equal.land_conv(@calc_num.num_add_conv)),
                conv,
              )
              @equal.conv_rule(
                @equal.rand_conv(
                  @equal.comb2_conv(
                    @equal.rand_conv(@equal.try_conv(@equal.beta_conv)),
                    t86,
                  ),
                ),
                th2,
              )
            }
          }
        }
        conv
      }
      _ => raise @lib.MatchFailure("tscript.ml:256")
    },
  )
}

///|
let expand_isum_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new(
  "EXPAND_ISUM_CONV",
)

///|
/// `EXPAND_ISUM_CONV`
pub fn expand_isum_conv(x : @kernel.Term) -> @kernel.Thm raise {
  expand_isum_conv_c.get()(x)
}

///|
/// Library/isum.ml:286
fn step_96() -> Unit raise {
  let t88 = @simp.asm_simp_tac(
    @list.List([@sets.in_elim_thm(), @iterate.in_numseg()]),
  )
  let t87 = @tactics.match_mp_tac(isum_eq())
  let t89 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t87),
    t88,
  )
  let th = @tactics.prove(
    @term_syntax.parse_term("(∀ f : (_) -> Int, ∀ g : (_) -> Int, ∀ s : (_) -> Bool, (∀ x : _, IN(x, s) → f(x) == g(x)) → isum(s, (i : _) => f(i)) == isum(s, g)) && (∀ f : (Num) -> Int, ∀ g : (Num) -> Int, ∀ a : Num, ∀ b : Num, (∀ i : Num, a <= i && i <= b → f(i) == g(i)) → isum(op_dot_dot(a, b), (i : Num) => f(i)) == isum(op_dot_dot(a, b), g)) && (∀ f : (_) -> Int, ∀ g : (_) -> Int, ∀ p : (_) -> Bool, (∀ x : _, p(x) → f(x) == g(x)) → isum({(y : _) | p(y)}, (i : _) => f(i)) == isum({(y : _) | p(y)}, g))"),
    t89,
  )
  @simp.extend_basic_congs(@lib.map(@bool.spec_all, @bool.conjuncts_rule(th)))
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
}
