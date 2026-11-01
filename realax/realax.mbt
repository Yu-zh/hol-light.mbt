// Translated from upstream realax.ml; edit this file directly.

///|
/// realax.ml:16
fn step_1() -> Unit raise {
  @printer.parse_as_infix("++", (16L, "right"))
}

///|
/// realax.ml:17
fn step_2() -> Unit raise {
  @printer.parse_as_infix("**", (20L, "right"))
}

///|
/// realax.ml:18
fn step_3() -> Unit raise {
  @printer.parse_as_infix("<<=", (12L, "right"))
}

///|
/// realax.ml:19
fn step_4() -> Unit raise {
  @printer.parse_as_infix("===", (10L, "right"))
}

///|
/// realax.ml:21
fn step_5() -> Unit raise {
  @printer.parse_as_infix("treal_mul", (20L, "right"))
}

///|
/// realax.ml:22
fn step_6() -> Unit raise {
  @printer.parse_as_infix("treal_add", (16L, "right"))
}

///|
/// realax.ml:23
fn step_7() -> Unit raise {
  @printer.parse_as_infix("treal_le", (12L, "right"))
}

///|
/// realax.ml:24
fn step_8() -> Unit raise {
  @printer.parse_as_infix("treal_eq", (10L, "right"))
}

///|
/// realax.ml:26
fn step_9() -> Unit raise {
  @preterm.make_overloadable("+", @parser.parse_type("A->A->A"))
}

///|
/// realax.ml:27
fn step_10() -> Unit raise {
  @preterm.make_overloadable("-", @parser.parse_type("A->A->A"))
}

///|
/// realax.ml:28
fn step_11() -> Unit raise {
  @preterm.make_overloadable("*", @parser.parse_type("A->A->A"))
}

///|
/// realax.ml:29
fn step_12() -> Unit raise {
  @preterm.make_overloadable("/", @parser.parse_type("A->A->A"))
}

///|
/// realax.ml:30
fn step_13() -> Unit raise {
  @preterm.make_overloadable("<", @parser.parse_type("A->A->bool"))
}

///|
/// realax.ml:31
fn step_14() -> Unit raise {
  @preterm.make_overloadable("<=", @parser.parse_type("A->A->bool"))
}

///|
/// realax.ml:32
fn step_15() -> Unit raise {
  @preterm.make_overloadable(">", @parser.parse_type("A->A->bool"))
}

///|
/// realax.ml:33
fn step_16() -> Unit raise {
  @preterm.make_overloadable(">=", @parser.parse_type("A->A->bool"))
}

///|
/// realax.ml:34
fn step_17() -> Unit raise {
  @preterm.make_overloadable("--", @parser.parse_type("A->A"))
}

///|
/// realax.ml:35
fn step_18() -> Unit raise {
  @preterm.make_overloadable("pow", @parser.parse_type("A->num->A"))
}

///|
/// realax.ml:36
fn step_19() -> Unit raise {
  @preterm.make_overloadable("inv", @parser.parse_type("A->A"))
}

///|
/// realax.ml:37
fn step_20() -> Unit raise {
  @preterm.make_overloadable("abs", @parser.parse_type("A->A"))
}

///|
/// realax.ml:38
fn step_21() -> Unit raise {
  @preterm.make_overloadable("max", @parser.parse_type("A->A->A"))
}

///|
/// realax.ml:39
fn step_22() -> Unit raise {
  @preterm.make_overloadable("min", @parser.parse_type("A->A->A"))
}

///|
/// realax.ml:40
fn step_23() -> Unit raise {
  @preterm.make_overloadable("&", @parser.parse_type("num->A"))
}

///|
/// realax.ml:42
fn step_24() -> Unit raise {
  let t2 = (">=", @term_syntax.parse_term("op_gt_eq"))
  let t3 = (">", @term_syntax.parse_term("op_gt"))
  let t4 = ("<=", @term_syntax.parse_term("op_lt_eq"))
  let t5 = ("<", @term_syntax.parse_term("op_lt"))
  let t6 = ("*", @term_syntax.parse_term("op_star"))
  let t7 = ("-", @term_syntax.parse_term("op_minus"))
  @lib.do_list(
    fn(x1 : (String, @kernel.Term)) -> Unit raise {
      @preterm.overload_interface(x1.0, x1.1)
    },
    @list.List([
      ("+", @term_syntax.parse_term("op_plus")),
      t7,
      t6,
      t5,
      t4,
      t3,
      t2,
    ]),
  )
}

///|
/// `prioritize_num`
pub fn prioritize_num(x8 : Unit) -> Unit raise {
  let _ = x8
  @preterm.prioritize_overload(@kernel.mk_type("num", @list.List([])))
}

///|
/// dist
fn step_25() -> Unit raise {
  dist_c.set(
    @pair.new_definition(@term_syntax.parse_term("(dist : ((Num, Num)) -> Num)(((m : Num), (n : Num))) == m - n + (n - m)")),
  )
}

///|
let dist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("dist")

///|
/// `dist`
pub fn dist() -> @kernel.Thm {
  dist_c.get()
}

///|
/// DIST_REFL
fn step_26() -> Unit raise {
  let t9 = @simp.rewrite_tac(
    @list.List([dist(), @arith.sub_refl(), @arith.add_clauses()]),
  )
  dist_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, dist((n, n)) == 0"), t9))
}

///|
let dist_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_REFL")

///|
/// `DIST_REFL`
pub fn dist_refl() -> @kernel.Thm {
  dist_refl_c.get()
}

///|
/// DIST_LZERO
fn step_27() -> Unit raise {
  let t10 = @simp.rewrite_tac(
    @list.List([dist(), @arith.sub_0(), @arith.add_clauses()]),
  )
  dist_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, dist((0, n)) == n"), t10))
}

///|
let dist_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_LZERO")

///|
/// `DIST_LZERO`
pub fn dist_lzero() -> @kernel.Thm {
  dist_lzero_c.get()
}

///|
/// DIST_RZERO
fn step_28() -> Unit raise {
  let t11 = @simp.rewrite_tac(
    @list.List([dist(), @arith.sub_0(), @arith.add_clauses()]),
  )
  dist_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, dist((n, 0)) == n"), t11))
}

///|
let dist_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_RZERO")

///|
/// `DIST_RZERO`
pub fn dist_rzero() -> @kernel.Thm {
  dist_rzero_c.get()
}

///|
/// DIST_SYM
fn step_29() -> Unit raise {
  let t12 = @tactics.match_accept_tac(@arith.add_sym())
  let t13 = @tactics.then_tac(@simp.rewrite_tac(@list.List([dist()])), t12)
  dist_sym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, dist((m, n)) == dist((n, m))"), t13),
  )
}

///|
let dist_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_SYM")

///|
/// `DIST_SYM`
pub fn dist_sym() -> @kernel.Thm {
  dist_sym_c.get()
}

///|
/// DIST_LADD
fn step_30() -> Unit raise {
  let t14 = @simp.rewrite_tac(@list.List([dist(), @arith.sub_add_lcancel()]))
  dist_ladd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ p : Num, ∀ n : Num, dist((m + n, m + p)) == dist((n, p))"),
      t14,
    ),
  )
}

///|
let dist_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_LADD")

///|
/// `DIST_LADD`
pub fn dist_ladd() -> @kernel.Thm {
  dist_ladd_c.get()
}

///|
/// DIST_RADD
fn step_31() -> Unit raise {
  let t15 = @simp.rewrite_tac(@list.List([dist(), @arith.sub_add_rcancel()]))
  dist_radd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ p : Num, ∀ n : Num, dist((m + p, n + p)) == dist((m, n))"),
      t15,
    ),
  )
}

///|
let dist_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_RADD")

///|
/// `DIST_RADD`
pub fn dist_radd() -> @kernel.Thm {
  dist_radd_c.get()
}

///|
/// DIST_LADD_0
fn step_32() -> Unit raise {
  let t16 = @simp.rewrite_tac(
    @list.List([
      dist(),
      @arith.add_sub2(),
      @arith.add_subr2(),
      @arith.add_clauses(),
    ]),
  )
  dist_ladd_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, dist((m + n, m)) == n"), t16),
  )
}

///|
let dist_ladd_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_LADD_0")

///|
/// `DIST_LADD_0`
pub fn dist_ladd_0() -> @kernel.Thm {
  dist_ladd_0_c.get()
}

///|
/// DIST_RADD_0
fn step_33() -> Unit raise {
  let t17 = @tactics.match_accept_tac(dist_ladd_0())
  let t18 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([dist_sym()])),
    t17,
  )
  dist_radd_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, dist((m, m + n)) == n"), t18),
  )
}

///|
let dist_radd_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_RADD_0")

///|
/// `DIST_RADD_0`
pub fn dist_radd_0() -> @kernel.Thm {
  dist_radd_0_c.get()
}

///|
/// DIST_LMUL
fn step_34() -> Unit raise {
  let t19 = @simp.rewrite_tac(
    @list.List([dist(), @arith.left_add_distrib(), @arith.left_sub_distrib()]),
  )
  dist_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, m * dist((n, p)) == dist((m * n, m * p))"),
      t19,
    ),
  )
}

///|
let dist_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_LMUL")

///|
/// `DIST_LMUL`
pub fn dist_lmul() -> @kernel.Thm {
  dist_lmul_c.get()
}

///|
/// DIST_RMUL
fn step_35() -> Unit raise {
  let t20 = @simp.rewrite_tac(
    @list.List([dist(), @arith.right_add_distrib(), @arith.right_sub_distrib()]),
  )
  dist_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, dist((m, n)) * p == dist((m * p, n * p))"),
      t20,
    ),
  )
}

///|
let dist_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_RMUL")

///|
/// `DIST_RMUL`
pub fn dist_rmul() -> @kernel.Thm {
  dist_rmul_c.get()
}

///|
/// DIST_EQ_0
fn step_36() -> Unit raise {
  let t21 = @simp.rewrite_tac(
    @list.List([
      dist(),
      @arith.add_eq_0(),
      @arith.sub_eq_0(),
      @arith.le_antisym(),
    ]),
  )
  dist_eq_0_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, (dist((m, n)) == 0) == (m == n)"), t21),
  )
}

///|
let dist_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_EQ_0")

///|
/// `DIST_EQ_0`
pub fn dist_eq_0() -> @kernel.Thm {
  dist_eq_0_c.get()
}

///|
/// DIST_ELIM_THM
fn step_37() -> Unit raise {
  let t46 = @simp.asm_rewrite_tac(@list.List([]))
  let t45 = @tactics.first_assum(@tactics.match_mp_tac)
  let t44 = @simp.asm_rewrite_tac(@list.List([]))
  let t43 = @tactics.repeat_tac(@tactics.strip_tac)
  let t42 = @simp.asm_rewrite_tac(@list.List([]))
  let t41 = @class.asm_cases_tac(@term_syntax.parse_term("(e : Num) == 0"))
  let t40 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@arith.add_assoc()),
      @arith.eq_add_lcancel_0(),
      @arith.add_eq_0(),
    ]),
  )
  let t39 = @simp.gen_rewrite_tac(
    fn(
      x38 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x32 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s33 = @equal.rand_conv(x32)
        fn(x34 : @kernel.Term) -> @kernel.Thm raise { s33(x34) }
      })(
        (fn(
          x35 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s36 = @equal.once_depth_conv(x35)
          fn(x37 : @kernel.Term) -> @kernel.Thm raise { s36(x37) }
        })(x38),
      )
    },
    @list.List([@theorems.eq_sym_eq()]),
  )
  let t31 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.eq_add_lcancel()]),
  )
  let t30 = @simp.rewrite_tac(
    @list.List([
      dist(),
      @arith.add_sub(),
      @arith.add_sub2(),
      @arith.add_subr(),
      @arith.add_subr2(),
    ]),
  )
  let t26 = @simp.rewrite_rule(@list.List([@arith.le_exists()]))
  let t27 = @tactics.x_choose_then(@term_syntax.parse_term("(e : Num)"))(fn(
    x23 : @kernel.Thm,
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
    let s24 = @tactics.subst1_tac(x23)
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
      s24(x25)
    }
  })
  let t29 = @tactics.pop_assum(fn(
    x28 : @kernel.Thm,
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
    t27(t26(x28))
  })
  let t22 = @term_syntax.parse_term("(y : Num)")
  let t47 = @tactics.then_tac(
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
                          @tactics.disj_cases_tac(
                            @bool.specl(
                              @list.List([@term_syntax.parse_term("(x : Num)"), t22]),
                              @arith.le_cases(),
                            ),
                          ),
                          t29,
                        ),
                        t30,
                      ),
                      t31,
                    ),
                    t39,
                  ),
                  t40,
                ),
                t41,
              ),
              t42,
            ),
            @tactics.eq_tac,
          ),
          t43,
        ),
        t44,
      ),
      t45,
    ),
    t46,
  )
  dist_elim_thm_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(P : (Num) -> Bool)(dist(((x : Num), (y : Num)))) == (∀ d : Num, (x == y + d → P(d)) && (y == x + d → P(d)))"),
      t47,
    ),
  )
}

///|
let dist_elim_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_ELIM_THM")

///|
/// `DIST_ELIM_THM`
pub fn dist_elim_thm() -> @kernel.Thm {
  dist_elim_thm_c.get()
}

///|
let dist_le_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_LE_CASES")

///|
/// `DIST_LE_CASES`
pub fn dist_le_cases() -> @kernel.Thm {
  dist_le_cases_c.get()
}

///|
let dist_addbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_ADDBOUND")

///|
/// `DIST_ADDBOUND`
pub fn dist_addbound() -> @kernel.Thm {
  dist_addbound_c.get()
}

///|
let dist_triangle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_TRIANGLE")

///|
/// `DIST_TRIANGLE`
pub fn dist_triangle() -> @kernel.Thm {
  dist_triangle_c.get()
}

///|
let dist_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_ADD2")

///|
/// `DIST_ADD2`
pub fn dist_add2() -> @kernel.Thm {
  dist_add2_c.get()
}

///|
let dist_add2_rev_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIST_ADD2_REV")

///|
/// `DIST_ADD2_REV`
pub fn dist_add2_rev() -> @kernel.Thm {
  dist_add2_rev_c.get()
}

///|
/// DIST_LE_CASES, DIST_ADDBOUND, DIST_TRIANGLE, DIST_ADD2, DIST_ADD2_REV
fn step_38() -> Unit raise {
  let conv : (@kernel.Term) -> @kernel.Thm raise = @drule.higher_rewrite_conv(
    @list.List([@arith.sub_elim_thm(), @class.cond_elim_thm(), dist_elim_thm()]),
  )(false)
  let t52 = @tactics.disch_then(fn(
    x49 : @kernel.Thm,
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
    let th = x49
    let (l, r) = @kernel.dest_eq(@kernel.concl(th))
    let t51 = if @kernel.is_var(l) && !@kernel.vfree_in(l, r) {
      @tactics.all_tac
    } else {
      @tactics.assume_tac(th)
    }
    @tactics.then_tac(@tactics.subst_all_tac(th), t51)
  })
  let t48 = @tactics.try_tac(@tactics.gen_tac)
  let dist_elim_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
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
  ) raise = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.conv_tac(conv), t48),
      @tactics.conj_tac,
    ),
    t52,
  )
  let t64 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @nums.not_suc()]),
  )
  let t63 = @tactics.conv_tac(@equal.land_conv(@arith.num_cancel_conv))
  let t62 = @tactics.pop_assum(fn(
    x59 : @kernel.Thm,
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
    let s60 = @tactics.mp_tac(x59)
    fn(
      x61 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s60(x61)
    }
  })
  let t58 = @tactics.disch_then(
    @tactics.choose_then(fn(
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
      let s56 = @tactics.subst_all_tac(x55)
      fn(
        x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s56(x57)
      }
    }),
  )
  let t54 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.not_lt()), @arith.lt_exists()]),
  )
  let t53 = @tactics.repeat_tac(dist_elim_tac)
  let dist_elim_tac_p : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (
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
  ) raise = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t53),
            t54,
          ),
          t58,
        ),
        t62,
      ),
      t63,
    ),
    t64,
  )
  let t66 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(@arith.add_assoc()),
      @arith.le_add(),
      @arith.le_add_lcancel(),
    ]),
  )
  let t65 = @tactics.repeat_tac(dist_elim_tac)
  let t67 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t65),
    t66,
  )
  let dist_le_cases = @tactics.prove(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, (dist((m, n)) <= p) == (m <= n + p && n <= m + p)"),
    t67,
  )
  let t69 = @simp.rewrite_tac(
    @list.List([@arith.add_assoc(), @arith.le_addr()]),
  )
  let t68 = @list.List([
    @simp.once_rewrite_tac(@list.List([@arith.add_sym()])),
    @tactics.all_tac,
  ])
  let t70 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), dist_elim_tac),
      t68,
    ),
    t69,
  )
  let dist_addbound = @tactics.prove(
    @term_syntax.parse_term("∀ m : Num, ∀ n : Num, dist((m, n)) <= m + n"),
    t70,
  )
  let t72 = (
    @term_syntax.parse_term("(∀ m : Num, ∀ n : Num, ∀ p : Num, dist((m, p)) <= dist((m, n)) + dist((n, p))) && (∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, dist((m + n, p + q)) <= dist((m, p)) + dist((n, q))) && (∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, dist((m, p)) <= dist((m + n, p + q)) + dist((n, q)))"),
    dist_elim_tac_p,
  )
  let (
    dist_le_cases_1,
    dist_addbound_1,
    dist_triangle_1,
    dist_add2_1,
    dist_add2_rev_1,
  ) = match
    @bool.conjuncts_rule(
      (fn(
        x71 : (
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
        @tactics.prove(x71.0, x71.1)
      })(t72),
    ) {
    More(
      dist_triangle,
      tail=More(dist_add2, tail=More(dist_add2_rev, tail=Empty))
    ) => (dist_le_cases, dist_addbound, dist_triangle, dist_add2, dist_add2_rev)
    _ => raise @lib.MatchFailure("tscript.ml:149")
  }
  dist_le_cases_c.set(dist_le_cases_1)
  dist_addbound_c.set(dist_addbound_1)
  dist_triangle_c.set(dist_triangle_1)
  dist_add2_c.set(dist_add2_1)
  dist_add2_rev_c.set(dist_add2_rev_1)
}

///|
/// DIST_TRIANGLE_LE
fn step_39() -> Unit raise {
  let t75 = @simp.asm_rewrite_tac(@list.List([dist_triangle()]))
  let t74 = @tactics.exists_tac(@term_syntax.parse_term("dist(((m : Num), (n : Num))) + dist((n, (p : Num)))"))
  let t73 = @tactics.match_mp_tac(@arith.le_trans())
  let t76 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t73),
      t74,
    ),
    t75,
  )
  dist_triangle_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, dist((m, n)) + dist((n, p)) <= q → dist((m, p)) <= q"),
      t76,
    ),
  )
}

///|
let dist_triangle_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIST_TRIANGLE_LE",
)

///|
/// `DIST_TRIANGLE_LE`
pub fn dist_triangle_le() -> @kernel.Thm {
  dist_triangle_le_c.get()
}

///|
/// DIST_TRIANGLES_LE
fn step_40() -> Unit raise {
  let t94 = @simp.asm_rewrite_tac(@list.List([]))
  let t93 = @simp.once_rewrite_tac(@list.List([dist_sym()]))
  let t92 = @simp.rewrite_tac(@list.List([@arith.le_add_lcancel()]))
  let t91 = @simp.gen_rewrite_tac(
    fn(
      x88 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s89 = @equal.rand_conv(x88)
      fn(x90 : @kernel.Term) -> @kernel.Thm raise { s89(x90) }
    },
    @list.List([@arith.add_sym()]),
  )
  let t87 = @tactics.exists_tac(@term_syntax.parse_term("(q : Num)"))
  let t86 = @tactics.match_mp_tac(dist_triangle_le())
  let t85 = @simp.asm_rewrite_tac(@list.List([]))
  let t84 = @tactics.match_mp_tac(@arith.le_add2())
  let t83 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add_assoc())]))
  let t82 = @simp.gen_rewrite_tac(
    fn(
      x79 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s80 = @equal.rand_conv(x79)
      fn(x81 : @kernel.Term) -> @kernel.Thm raise { s80(x81) }
    },
    @list.List([@arith.add_sym()]),
  )
  let t78 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t77 = @tactics.match_mp_tac(dist_triangle_le())
  let t95 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.strip_tac),
                          t77,
                        ),
                        t78,
                      ),
                      t82,
                    ),
                    t83,
                  ),
                  t84,
                ),
                t85,
              ),
              t86,
            ),
            t87,
          ),
          t91,
        ),
        t92,
      ),
      t93,
    ),
    t94,
  )
  dist_triangles_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ p : Num, ∀ q : Num, ∀ r : Num, ∀ s : Num, dist((m, n)) <= r && dist((p, q)) <= s → dist((m, p)) <= dist((n, q)) + (r + s)"),
      t95,
    ),
  )
}

///|
let dist_triangles_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "DIST_TRIANGLES_LE",
)

///|
/// `DIST_TRIANGLES_LE`
pub fn dist_triangles_le() -> @kernel.Thm {
  dist_triangles_le_c.get()
}

///|
/// BOUNDS_LINEAR
fn step_41() -> Unit raise {
  let t120 = @simp.rewrite_tac(
    @list.List([
      @arith.right_add_distrib(),
      @equal.gsym(@arith.add_assoc()),
      @arith.le_add(),
    ]),
  )
  let t117 = @simp.rewrite_rule(@list.List([@arith.le_exists()]))
  let t118 = @tactics.choose_then(fn(
    x114 : @kernel.Thm,
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
    let s115 = @tactics.subst1_tac(x114)
    fn(
      x116 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s115(x116)
    }
  })
  let t121 = @tactics.then_tac(
    @tactics.disch_then(fn(
      x119 : @kernel.Thm,
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
      t118(t117(x119))
    }),
    t120,
  )
  let t113 = @simp.rewrite_tac(
    @list.List([@arith.add_assoc(), @arith.le_addr()]),
  )
  let t112 = @simp.rewrite_tac(
    @list.List([
      @arith.not_le(),
      @arith.mult_clauses(),
      @arith.add_clauses(),
      @arith.lt_suc_le(),
    ]),
  )
  let t108 = @term_syntax.parse_term("SUC((C : Num))")
  let t111 = @tactics.disch_then(fn(
    x110 : @kernel.Thm,
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
      x105 : @kernel.Thm,
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
      let s106 = @tactics.mp_tac(x105)
      fn(
        x107 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s106(x107)
      }
    })(((x109 : @kernel.Thm) => @bool.spec(t108, x109))(x110))
  })
  let t104 = @simp.rewrite_tac(
    @list.List([@arith.right_add_distrib(), @arith.le_add_lcancel()]),
  )
  let t100 = @simp.rewrite_rule(@list.List([@arith.lt_exists()]))
  let t101 = @tactics.choose_then(fn(
    x97 : @kernel.Thm,
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
    let s98 = @tactics.subst1_tac(x97)
    fn(
      x99 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s98(x99)
    }
  })
  let t103 = @tactics.disch_then(fn(
    x102 : @kernel.Thm,
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
    t101(t100(x102))
  })
  let t96 = @simp.rewrite_tac(@list.List([@arith.not_le()]))
  let t122 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.conv_tac(@class.contrapos_conv), t96),
              t103,
            ),
            t104,
          ),
          t111,
        ),
        t112,
      ),
      t113,
    ),
    t121,
  ])
  let t123 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
    t122,
  )
  bounds_linear_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ A : Num, ∀ B : Num, ∀ C : Num, (∀ n : Num, A * n <= B * n + C) == (A <= B)"),
      t123,
    ),
  )
}

///|
let bounds_linear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDS_LINEAR")

///|
/// `BOUNDS_LINEAR`
pub fn bounds_linear() -> @kernel.Thm {
  bounds_linear_c.get()
}

///|
/// BOUNDS_LINEAR_0
fn step_42() -> Unit raise {
  let t127 = @simp.rewrite_tac(
    @list.List([@arith.mult_clauses(), @arith.add_clauses(), @arith.le()]),
  )
  let t124 = @term_syntax.parse_term("(B : Num)")
  let t125 = @term_syntax.parse_term("0")
  let t126 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(A : Num)"), t125, t124]),
      bounds_linear(),
    ),
  )
  let t128 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t126),
    t127,
  )
  bounds_linear_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ A : Num, ∀ B : Num, (∀ n : Num, A * n <= B) == (A == 0)"),
      t128,
    ),
  )
}

///|
let bounds_linear_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "BOUNDS_LINEAR_0",
)

///|
/// `BOUNDS_LINEAR_0`
pub fn bounds_linear_0() -> @kernel.Thm {
  bounds_linear_0_c.get()
}

///|
/// BOUNDS_DIVIDED
fn step_43() -> Unit raise {
  let t172 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), @arith.le_add()]),
  )
  let t170 = @term_syntax.parse_term("(n : Num)")
  let t171 = @tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t170)
  let t169 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t168 = @simp.rewrite_tac(@list.List([@arith.le_add()]))
  let t167 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num) * (n : Num)"))
  let t166 = @tactics.match_mp_tac(@arith.le_trans())
  let t165 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.add_assoc()), @arith.le_add_lcancel()]),
  )
  let t164 = @simp.gen_rewrite_tac(
    fn(
      x163 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x157 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s158 = @equal.rand_conv(x157)
        fn(x159 : @kernel.Term) -> @kernel.Thm raise { s158(x159) }
      })(
        (fn(
          x160 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s161 = @equal.once_depth_conv(x160)
          fn(x162 : @kernel.Term) -> @kernel.Thm raise { s161(x162) }
        })(x163),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t156 = @simp.gen_rewrite_tac(
    fn(
      x153 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s154 = @equal.rand_conv(x153)
      fn(x155 : @kernel.Term) -> @kernel.Thm raise { s154(x155) }
    },
    @list.List([@arith.add_sym()]),
  )
  let t152 = @simp.rewrite_tac(@list.List([@arith.left_add_distrib()]))
  let t151 = @simp.asm_rewrite_tac(@list.List([]))
  let t150 = @tactics.exists_tac(@term_syntax.parse_term("(A : Num) * (n : Num) + (B : Num)"))
  let t149 = @tactics.match_mp_tac(@arith.le_trans())
  let t148 = @tactics.disch_then(fn(
    x147 : @kernel.Thm,
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
      x144 : @kernel.Thm,
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
      let s145 = @tactics.subst1_tac(x144)
      fn(
        x146 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s145(x146)
      }
    })(@equal.sym(x147))
  })
  let t143 = @simp.asm_rewrite_tac(@list.List([@arith.le_add()]))
  let t142 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t139 = @term_syntax.parse_term("(P : (Num) -> Num)(0) + ((A : Num) + (B : Num))")
  let t140 = @term_syntax.parse_term("(P : (Num) -> Num)((n : Num))")
  let t141 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(n : Num)"), t140, t139]),
      @arith.le_mult_lcancel(),
    ),
  )
  let t173 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.exists_tac(
                                          @term_syntax.parse_term("(P : (Num) -> Num)(0) + ((A : Num) + (B : Num))"),
                                        ),
                                        @tactics.gen_tac,
                                      ),
                                      t141,
                                    ),
                                    t142,
                                  ),
                                  t143,
                                ),
                                t148,
                              ),
                              t149,
                            ),
                            t150,
                          ),
                          t151,
                        ),
                        t152,
                      ),
                      t156,
                    ),
                    t164,
                  ),
                  t165,
                ),
                t166,
              ),
              t167,
            ),
            t168,
          ),
          t169,
        ),
        t171,
      ),
      @nums.induct_tac,
    ),
    t172,
  )
  let t138 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t137 = @simp.gen_rewrite_tac(
    fn(
      x134 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s135 = @equal.rand_conv(x134)
      fn(x136 : @kernel.Term) -> @kernel.Thm raise { s135(x136) }
    },
    @list.List([@arith.mult_sym()]),
  )
  let t133 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t132 = @term_syntax.parse_term("0")
  let t174 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.map_every(
              fn(
                x129 : @kernel.Term,
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
                let s130 = @tactics.exists_tac(x129)
                fn(
                  x131 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  s130(x131)
                }
              },
              @list.List([@term_syntax.parse_term("(B : Num)"), t132]),
            ),
            @tactics.gen_tac,
          ),
          t133,
        ),
        t137,
      ),
      t138,
    ),
    t173,
  ])
  let t175 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac),
      @tactics.strip_tac,
    ),
    t174,
  )
  bounds_divided_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Num, (∃ B : Num, ∀ n : Num, P(n) <= B) == (∃ A : Num, ∃ B : Num, ∀ n : Num, n * P(n) <= A * n + B)"),
      t175,
    ),
  )
}

///|
let bounds_divided_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDS_DIVIDED")

///|
/// `BOUNDS_DIVIDED`
pub fn bounds_divided() -> @kernel.Thm {
  bounds_divided_c.get()
}

///|
/// BOUNDS_NOTZERO
fn step_44() -> Unit raise {
  let t186 = @simp.rewrite_tac(
    @list.List([@arith.mult_clauses(), @arith.le_add()]),
  )
  let t184 = @term_syntax.parse_term("(p : Num)")
  let t185 = @tactics.spec_tac(@term_syntax.parse_term("(m : Num) + (n : Num)"), t184)
  let t183 = @tactics.undisch_tac(@term_syntax.parse_term("!((m : Num) + (n : Num) == 0)"))
  let t182 = @simp.rewrite_tac(
    @list.List([@arith.right_add_distrib(), @arith.le_add_lcancel()]),
  )
  let t181 = @simp.asm_rewrite_tac(@list.List([]))
  let t180 = @tactics.exists_tac(@term_syntax.parse_term("(A : Num) * ((m : Num) + (n : Num)) + (B : Num)"))
  let t187 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t180),
              t181,
            ),
            t182,
          ),
          t183,
        ),
        t185,
      ),
      @nums.induct_tac,
    ),
    t186,
  )
  let t179 = @simp.asm_rewrite_tac(@list.List([@arith.le_0()]))
  let t188 = @list.List([
    @tactics.then_tac(
      @tactics.rule_assum_tac(
        @simp.rewrite_rule(@list.List([@arith.add_eq_0()])),
      ),
      t179,
    ),
    t187,
  ])
  let t178 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) + (n : Num) == 0"))
  let t177 = @tactics.repeat_tac(@tactics.gen_tac)
  let t176 = @tactics.exists_tac(@term_syntax.parse_term("(A : Num) + (B : Num)"))
  let t189 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t176),
        t177,
      ),
      t178,
    ),
    t188,
  )
  bounds_notzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num, Num) -> Num, ∀ A : Num, ∀ B : Num, P(0, 0) == 0 && (∀ m : Num, ∀ n : Num, P(m, n) <= A * (m + n) + B) → (∃ B : Num, ∀ m : Num, ∀ n : Num, P(m, n) <= B * (m + n))"),
      t189,
    ),
  )
}

///|
let bounds_notzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDS_NOTZERO")

///|
/// `BOUNDS_NOTZERO`
pub fn bounds_notzero() -> @kernel.Thm {
  bounds_notzero_c.get()
}

///|
/// BOUNDS_IGNORE
fn step_45() -> Unit raise {
  let t216 = @simp.rewrite_tac(@list.List([@arith.le_add()]))
  let t215 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t214 = @simp.rewrite_tac(@list.List([@arith.add_assoc()]))
  let t213 = @tactics.disch_then(fn(
    x210 : @kernel.Thm,
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
    let s211 = @tactics.subst1_tac(x210)
    fn(
      x212 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s211(x212)
    }
  })
  let t209 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.not_le())]))
  let t208 = @simp.rewrite_tac(@list.List([@arith.not_le(), @arith.lt()]))
  let t217 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.undisch_tac(@term_syntax.parse_term("!(SUC((N : Num)) <= (i : Num))")),
              t208,
            ),
            t209,
          ),
          t213,
        ),
        t214,
      ),
      t215,
    ),
    t216,
  )
  let t207 = @simp.asm_rewrite_tac(@list.List([]))
  let t206 = @tactics.first_assum(@tactics.match_mp_tac)
  let t205 = @simp.rewrite_tac(
    @list.List([@arith.le_add(), @arith.add_assoc()]),
  )
  let t204 = @tactics.exists_tac(@term_syntax.parse_term("(Q : (Num) -> Num)((i : Num)) + (B : Num)"))
  let t218 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t204),
          t205,
        ),
        t206,
      ),
      t207,
    ),
    t217,
  ])
  let t203 = @class.asm_cases_tac(@term_syntax.parse_term("SUC((N : Num)) <= (i : Num)"))
  let t202 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t201 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num) + (P : (Num) -> Num)((N : Num))"))
  let t200 = @tactics.first_assum(@tactics.match_mp_tac)
  let t219 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
              t200,
            ),
            t201,
          ),
          t202,
        ),
        @tactics.disch_tac,
      ),
      t203,
    ),
    t218,
  )
  let t199 = @simp.asm_rewrite_tac(@list.List([]))
  let t198 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num)"))
  let t220 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(@list.List([@arith.le_0()])),
            @tactics.gen_tac,
          ),
          @tactics.disch_tac,
        ),
        t198,
      ),
      t199,
    ),
    t219,
  ])
  let t196 = @term_syntax.parse_term("(N : Num)")
  let t197 = @tactics.spec_tac(@term_syntax.parse_term("(N : Num)"), t196)
  let t194 = @term_syntax.parse_term("(B : Num)")
  let t195 = @tactics.spec_tac(@term_syntax.parse_term("(B : Num)"), t194)
  let t221 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.pop_assum(fn(
            x191 : @kernel.Thm,
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
            let s192 = @tactics.mp_tac(x191)
            fn(
              x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s192(x193)
            }
          }),
          t195,
        ),
        t197,
      ),
      @nums.induct_tac,
    ),
    t220,
  )
  let t190 = @simp.asm_rewrite_tac(@list.List([]))
  let t222 = @list.List([
    @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(B : Num)")), t190),
    t221,
  ])
  let t223 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac),
      @tactics.strip_tac,
    ),
    t222,
  )
  bounds_ignore_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Num) -> Num, ∀ Q : (Num) -> Num, (∃ B : Num, ∀ i : Num, P(i) <= Q(i) + B) == (∃ B : Num, ∃ N : Num, ∀ i : Num, N <= i → P(i) <= Q(i) + B)"),
      t223,
    ),
  )
}

///|
let bounds_ignore_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BOUNDS_IGNORE")

///|
/// `BOUNDS_IGNORE`
pub fn bounds_ignore() -> @kernel.Thm {
  bounds_ignore_c.get()
}

///|
/// is_nadd
fn step_46() -> Unit raise {
  is_nadd_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(is_nadd : ((Num) -> Num) -> Bool)((x : (Num) -> Num)) == (∃ B : Num, ∀ m : Num, ∀ n : Num, dist((m * x(n), n * x(m))) <= B * (m + n))"),
    ),
  )
}

///|
let is_nadd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_nadd")

///|
/// `is_nadd`
pub fn is_nadd() -> @kernel.Thm {
  is_nadd_c.get()
}

///|
/// is_nadd_0
fn step_47() -> Unit raise {
  let t224 = @simp.rewrite_tac(
    @list.List([is_nadd(), @arith.mult_clauses(), dist_refl(), @arith.le_0()]),
  )
  is_nadd_0_c.set(@tactics.prove(@term_syntax.parse_term("is_nadd((n : Num) => 0)"), t224))
}

///|
let is_nadd_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_nadd_0")

///|
/// `is_nadd_0`
pub fn is_nadd_0() -> @kernel.Thm {
  is_nadd_0_c.get()
}

///|
let nadd_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nadd_abs")

///|
/// `nadd_abs`
pub fn nadd_abs() -> @kernel.Thm {
  nadd_abs_c.get()
}

///|
let nadd_rep_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nadd_rep")

///|
/// `nadd_rep`
pub fn nadd_rep() -> @kernel.Thm {
  nadd_rep_c.get()
}

///|
/// nadd_abs, nadd_rep
fn step_48() -> Unit raise {
  let (nadd_abs, nadd_rep) = @kernel.new_basic_type_definition(
    "nadd",
    "mk_nadd",
    "dest_nadd",
    is_nadd_0(),
  )
  nadd_abs_c.set(nadd_abs)
  nadd_rep_c.set(nadd_rep)
}

///|
/// realax.ml:263
fn step_49() -> Unit raise {
  @preterm.override_interface("fn", @term_syntax.parse_term("dest_nadd"))
}

///|
/// realax.ml:264
fn step_50() -> Unit raise {
  @preterm.override_interface("afn", @term_syntax.parse_term("mk_nadd"))
}

///|
/// NADD_CAUCHY
fn step_51() -> Unit raise {
  let t225 = @simp.rewrite_tac(
    @list.List([@equal.gsym(is_nadd()), nadd_rep(), nadd_abs(), @class.eta_ax()]),
  )
  nadd_cauchy_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∃ B : Num, ∀ m : Num, ∀ n : Num, dist((m * dest_nadd(x, n), n * dest_nadd(x, m))) <= B * (m + n)"),
      t225,
    ),
  )
}

///|
let nadd_cauchy_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_CAUCHY")

///|
/// `NADD_CAUCHY`
pub fn nadd_cauchy() -> @kernel.Thm {
  nadd_cauchy_c.get()
}

///|
/// NADD_BOUND
fn step_52() -> Unit raise {
  let t247 = @simp.rewrite_tac(@list.List([@arith.add_ac(), @arith.mult_ac()]))
  let t246 = @simp.rewrite_tac(
    @list.List([
      @arith.left_add_distrib(),
      @arith.right_add_distrib(),
      @arith.mult_clauses(),
    ]),
  )
  let t245 = @tactics.disch_then(fn(
    x244 : @kernel.Thm,
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
      x241 : @kernel.Thm,
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
      let s242 = @tactics.mp_tac(x241)
      fn(
        x243 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s242(x243)
      }
    })(@bool.conjunct2(x244))
  })
  let t240 = @simp.rewrite_tac(
    @list.List([dist_le_cases(), @arith.mult_clauses()]),
  )
  let t235 = @term_syntax.parse_term("1")
  let t236 = @list.List([@term_syntax.parse_term("(n : Num)"), t235])
  let t239 = @tactics.pop_assum(fn(
    x238 : @kernel.Thm,
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
      x232 : @kernel.Thm,
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
      let s233 = @tactics.mp_tac(x232)
      fn(
        x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s233(x234)
      }
    })(((x237 : @kernel.Thm) => @bool.specl(t236, x237))(x238))
  })
  let t230 = @term_syntax.parse_term("(B : Num)")
  let t231 = @tactics.map_every(
    fn(
      x227 : @kernel.Term,
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
      let s228 = @tactics.exists_tac(x227)
      fn(
        x229 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s228(x229)
      }
    },
    @list.List([@term_syntax.parse_term("(B : Num) + dest_nadd((x : Nadd), 1)"), t230]),
  )
  let t226 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_cauchy())
  let t248 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.gen_tac,
                  @tactics.x_choose_tac(@term_syntax.parse_term("(B : Num)"), t226),
                ),
                t231,
              ),
              @tactics.gen_tac,
            ),
            t239,
          ),
          t240,
        ),
        t245,
      ),
      t246,
    ),
    t247,
  )
  nadd_bound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∃ A : Num, ∃ B : Num, ∀ n : Num, dest_nadd(x, n) <= A * n + B"),
      t248,
    ),
  )
}

///|
let nadd_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_BOUND")

///|
/// `NADD_BOUND`
pub fn nadd_bound() -> @kernel.Thm {
  nadd_bound_c.get()
}

///|
/// NADD_MULTIPLICATIVE
fn step_53() -> Unit raise {
  let t282 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@theorems.exists_refl())]),
  )
  let t281 = @tactics.conv_tac(@equal.once_depth_conv(@arith.num_cancel_conv))
  let t280 = @simp.rewrite_tac(
    @list.List([
      @arith.le_exists(),
      @arith.right_add_distrib(),
      @arith.left_add_distrib(),
      @arith.mult_ac(),
    ]),
  )
  let t279 = @tactics.pop_assum(fn(
    x278 : @kernel.Thm,
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
    @tactics.match_mp_tac(@arith.le_imp(x278))
  })
  let t277 = @simp.gen_rewrite_tac(
    fn(
      x276 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x272 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x268 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x262 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s263 = @equal.land_conv(x262)
            fn(x264 : @kernel.Term) -> @kernel.Thm raise { s263(x264) }
          })(
            (fn(
              x265 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s266 = @equal.rand_conv(x265)
              fn(x267 : @kernel.Term) -> @kernel.Thm raise { s266(x267) }
            })(x268),
          )
        })(
          (fn(
            x269 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s270 = @equal.rand_conv(x269)
            fn(x271 : @kernel.Term) -> @kernel.Thm raise { s270(x271) }
          })(x272),
        )
      })(
        (fn(
          x273 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s274 = @equal.land_conv(x273)
          fn(x275 : @kernel.Term) -> @kernel.Thm raise { s274(x275) }
        })(x276),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t261 = @simp.rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t259 = @equal.gsym(@arith.le_mult_lcancel())
  let t260 = @simp.rewrite_tac(
    @list.List([
      @class.taut(@term_syntax.parse_term("(!(a : Bool) → (b : Bool)) == (a || b)")),
      t259,
      dist_lmul(),
    ]),
  )
  let t257 = @tactics.undisch_tac(@term_syntax.parse_term("!((n : Num) == 0)"))
  let t256 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@theorems.exists_refl())]),
  )
  let t255 = @tactics.conv_tac(@equal.once_depth_conv(@arith.num_cancel_conv))
  let t254 = @simp.rewrite_tac(@list.List([@arith.le_exists()]))
  let t253 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.mult_clauses(),
      @arith.right_add_distrib(),
      @arith.mult_ac(),
    ]),
  )
  let t258 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@arith.le_imp(dist_addbound())),
            t253,
          ),
          t254,
        ),
        t255,
      ),
      t256,
    ),
    t257,
  ])
  let t252 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t251 = @tactics.repeat_tac(@tactics.gen_tac)
  let t250 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num) + dest_nadd((x : Nadd), 0)"))
  let t249 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_cauchy())
  let t283 = @tactics.then_tac(
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
                        @tactics.then_tac(
                          @tactics.gen_tac,
                          @tactics.x_choose_tac(
                            @term_syntax.parse_term("(B : Num)"),
                            t249,
                          ),
                        ),
                        t250,
                      ),
                      t251,
                    ),
                    t252,
                  ),
                  t258,
                ),
                t260,
              ),
              t261,
            ),
            t277,
          ),
          t279,
        ),
        t280,
      ),
      t281,
    ),
    t282,
  )
  nadd_multiplicative_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∃ B : Num, ∀ m : Num, ∀ n : Num, dist((dest_nadd(x, m * n), m * dest_nadd(x, n))) <= B * m + B"),
      t283,
    ),
  )
}

///|
let nadd_multiplicative_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MULTIPLICATIVE",
)

///|
/// `NADD_MULTIPLICATIVE`
pub fn nadd_multiplicative() -> @kernel.Thm {
  nadd_multiplicative_c.get()
}

///|
/// NADD_ADDITIVE
fn step_54() -> Unit raise {
  let t319 = @simp.asm_rewrite_tac(@list.List([]))
  let t320 = @tactics.then_tac(@tactics.match_mp_tac(@arith.le_add2()), t319)
  let t318 = @tactics.conv_tac(@arith.num_cancel_conv)
  let t317 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t316 = @simp.rewrite_tac(
    @list.List([
      @arith.right_add_distrib(),
      @arith.left_add_distrib(),
      @arith.mult_clauses(),
    ]),
  )
  let t315 = @term_syntax.parse_term("1 + (1 + 1)")
  let t321 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.rewrite_tac(
              @list.List([
                @equal.sym(
                  @simp.rewrite_conv(@list.List([@calc_num.arith()]))(t315),
                ),
              ]),
            ),
            t316,
          ),
          t317,
        ),
        t318,
      ),
      @tactics.refl_tac,
    ),
    t320,
  ])
  let t314 = @tactics.subgoal_then(
    @term_syntax.parse_term("((m : Num) + (n : Num)) * (3 * (B : Num)) == B * (m + (m + n)) + B * (n + (m + n))"),
    fn(
      x311 : @kernel.Thm,
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
      let s312 = @tactics.subst1_tac(x311)
      fn(
        x313 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s312(x313)
      }
    },
  )
  let t310 = @tactics.match_mp_tac(@arith.le_imp(dist_add2()))
  let t309 = @simp.gen_rewrite_tac(
    fn(
      x308 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x304 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x298 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s299 = @equal.land_conv(x298)
          fn(x300 : @kernel.Term) -> @kernel.Thm raise { s299(x300) }
        })(
          (fn(
            x301 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s302 = @equal.rand_conv(x301)
            fn(x303 : @kernel.Term) -> @kernel.Thm raise { s302(x303) }
          })(x304),
        )
      })(
        (fn(
          x305 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s306 = @equal.land_conv(x305)
          fn(x307 : @kernel.Term) -> @kernel.Thm raise { s306(x307) }
        })(x308),
      )
    },
    @list.List([@arith.right_add_distrib()]),
  )
  let t297 = @simp.rewrite_tac(
    @list.List([dist_lmul(), @arith.left_add_distrib()]),
  )
  let t295 = @equal.gsym(@arith.le_mult_lcancel())
  let t296 = @simp.rewrite_tac(
    @list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) → (b : Bool)) == (a || b)")), t295]),
  )
  let t292 = @tactics.undisch_tac(@term_syntax.parse_term("!((m : Num) + (n : Num) == 0)"))
  let t291 = @simp.rewrite_tac(@list.List([@arith.le_add()]))
  let t290 = @tactics.exists_tac(@term_syntax.parse_term("3 * (B : Num)"))
  let t293 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t290),
      t291,
    ),
    t292,
  )
  let t289 = @simp.asm_rewrite_tac(
    @list.List([@arith.add_clauses(), dist_ladd_0(), @arith.le_addr()]),
  )
  let t288 = @simp.once_rewrite_tac(@list.List([dist_sym()]))
  let t294 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.rule_assum_tac(
          @simp.rewrite_rule(@list.List([@arith.add_eq_0()])),
        ),
        t288,
      ),
      t289,
    ),
    t293,
  ])
  let t287 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) + (n : Num) == 0"))
  let t286 = @tactics.repeat_tac(@tactics.gen_tac)
  let t285 = @tactics.exists_tac(@term_syntax.parse_term("3 * (B : Num) + dest_nadd((x : Nadd), 0)"))
  let t284 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_cauchy())
  let t322 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.gen_tac,
                        @tactics.x_choose_tac(@term_syntax.parse_term("(B : Num)"), t284),
                      ),
                      t285,
                    ),
                    t286,
                  ),
                  t287,
                ),
                t294,
              ),
              t296,
            ),
            t297,
          ),
          t309,
        ),
        t310,
      ),
      t314,
    ),
    t321,
  )
  nadd_additive_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∃ B : Num, ∀ m : Num, ∀ n : Num, dist((dest_nadd(x, m + n), dest_nadd(x, m) + dest_nadd(x, n))) <= B"),
      t322,
    ),
  )
}

///|
let nadd_additive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_ADDITIVE")

///|
/// `NADD_ADDITIVE`
pub fn nadd_additive() -> @kernel.Thm {
  nadd_additive_c.get()
}

///|
/// NADD_SUC
fn step_55() -> Unit raise {
  let t329 = @simp.asm_rewrite_tac(
    @list.List([dist_ladd_0(), @arith.le_refl()]),
  )
  let t328 = @tactics.match_mp_tac(@arith.le_add2())
  let t327 = @simp.asm_rewrite_tac(@list.List([@arith.add1()]))
  let t326 = @tactics.exists_tac(@term_syntax.parse_term("dest_nadd((x : Nadd), (n : Num)) + dest_nadd(x, 1)"))
  let t325 = @tactics.match_mp_tac(@arith.le_imp(dist_triangle()))
  let t324 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num) + dest_nadd((x : Nadd), 1)"))
  let t323 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_additive())
  let t330 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.gen_tac,
                  @tactics.x_choose_tac(@term_syntax.parse_term("(B : Num)"), t323),
                ),
                t324,
              ),
              @tactics.gen_tac,
            ),
            t325,
          ),
          t326,
        ),
        t327,
      ),
      t328,
    ),
    t329,
  )
  nadd_suc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∃ B : Num, ∀ n : Num, dist((dest_nadd(x, SUC(n)), dest_nadd(x, n))) <= B"),
      t330,
    ),
  )
}

///|
let nadd_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_SUC")

///|
/// `NADD_SUC`
pub fn nadd_suc() -> @kernel.Thm {
  nadd_suc_c.get()
}

///|
/// NADD_DIST_LEMMA
fn step_56() -> Unit raise {
  let t342 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@arith.add1()), @arith.mult_clauses()]),
  )
  let t341 = @tactics.match_mp_tac(@arith.le_add2())
  let t340 = @simp.gen_rewrite_tac(
    fn(
      x337 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s338 = @equal.rand_conv(x337)
      fn(x339 : @kernel.Term) -> @kernel.Thm raise { s338(x339) }
    },
    @list.List([@arith.add_sym()]),
  )
  let t336 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @arith.left_add_distrib()]),
  )
  let t335 = @tactics.exists_tac(@term_syntax.parse_term("dest_nadd((x : Nadd), (m : Num) + (n : Num))"))
  let t334 = @tactics.match_mp_tac(@arith.le_imp(dist_triangle()))
  let t333 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), dist_refl(), @arith.le_0()]),
  )
  let t332 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num)"))
  let t331 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_suc())
  let t343 = @tactics.then_tac(
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
                        @tactics.gen_tac,
                        @tactics.x_choose_tac(@term_syntax.parse_term("(B : Num)"), t331),
                      ),
                      t332,
                    ),
                    @tactics.gen_tac,
                  ),
                  @nums.induct_tac,
                ),
                t333,
              ),
              t334,
            ),
            t335,
          ),
          t336,
        ),
        t340,
      ),
      t341,
    ),
    t342,
  )
  nadd_dist_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∃ B : Num, ∀ m : Num, ∀ n : Num, dist((dest_nadd(x, m + n), dest_nadd(x, m))) <= B * n"),
      t343,
    ),
  )
}

///|
let nadd_dist_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_DIST_LEMMA",
)

///|
/// `NADD_DIST_LEMMA`
pub fn nadd_dist_lemma() -> @kernel.Thm {
  nadd_dist_lemma_c.get()
}

///|
/// NADD_DIST
fn step_57() -> Unit raise {
  let t361 = @simp.asm_rewrite_tac(@list.List([dist_ladd_0()]))
  let t360 = @list.List([
    @simp.once_rewrite_tac(@list.List([dist_sym()])),
    @tactics.all_tac,
  ])
  let t356 = @simp.once_rewrite_rule(@list.List([@arith.le_exists()]))
  let t357 = @tactics.choose_then(fn(
    x353 : @kernel.Thm,
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
    let s354 = @tactics.subst1_tac(x353)
    fn(
      x355 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s354(x355)
    }
  })
  let t359 = @tactics.disch_then(fn(
    x358 : @kernel.Thm,
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
    t357(t356(x358))
  })
  let t350 = @term_syntax.parse_term("(n : Num)")
  let t351 = @bool.specl(
    @list.List([@term_syntax.parse_term("(m : Num)"), t350]),
    @arith.le_cases(),
  )
  let t352 = @tactics.disj_cases_then(fn(
    x347 : @kernel.Thm,
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
    let s348 = @tactics.mp_tac(x347)
    fn(
      x349 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s348(x349)
    }
  })(t351)
  let t346 = @tactics.repeat_tac(@tactics.gen_tac)
  let t345 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num)"))
  let t344 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_dist_lemma())
  let t362 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @tactics.x_choose_tac(@term_syntax.parse_term("(B : Num)"), t344),
              ),
              t345,
            ),
            t346,
          ),
          t352,
        ),
        t359,
      ),
      t360,
    ),
    t361,
  )
  nadd_dist_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∃ B : Num, ∀ m : Num, ∀ n : Num, dist((dest_nadd(x, m), dest_nadd(x, n))) <= B * dist((m, n))"),
      t362,
    ),
  )
}

///|
let nadd_dist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_DIST")

///|
/// `NADD_DIST`
pub fn nadd_dist() -> @kernel.Thm {
  nadd_dist_c.get()
}

///|
/// NADD_ALTMUL
fn step_58() -> Unit raise {
  let t391 = @equal.gsym(@arith.mult_assoc())
  let t392 = @simp.asm_rewrite_tac(
    @list.List([
      @equal.gsym(@arith.left_add_distrib()),
      t391,
      @arith.le_mult_lcancel(),
    ]),
  )
  let t390 = @simp.rewrite_tac(
    @list.List([
      @arith.mult_clauses(),
      @equal.gsym(@arith.add_assoc()),
      @arith.le_add_lcancel(),
    ]),
  )
  let t389 = @simp.rewrite_tac(
    @list.List([@arith.left_add_distrib(), @arith.right_add_distrib()]),
  )
  let t388 = @simp.asm_rewrite_tac(@list.List([]))
  let t387 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num) * ((n : Num) + dest_nadd((y : Nadd), n))"))
  let t386 = @tactics.match_mp_tac(@arith.le_trans())
  let t385 = @simp.gen_rewrite_tac(
    fn(
      x384 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x380 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x374 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s375 = @equal.land_conv(x374)
          fn(x376 : @kernel.Term) -> @kernel.Thm raise { s375(x376) }
        })(
          (fn(
            x377 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s378 = @equal.rand_conv(x377)
            fn(x379 : @kernel.Term) -> @kernel.Thm raise { s378(x379) }
          })(x380),
        )
      })(
        (fn(
          x381 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s382 = @equal.rand_conv(x381)
          fn(x383 : @kernel.Term) -> @kernel.Thm raise { s382(x383) }
        })(x384),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t372 = @term_syntax.parse_term("(B : Num) * (L : Num)")
  let t373 = @tactics.map_every(
    fn(
      x369 : @kernel.Term,
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
      let s370 = @tactics.exists_tac(x369)
      fn(
        x371 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s370(x371)
      }
    },
    @list.List([@term_syntax.parse_term("(B : Num) * (1 + (M : Num))"), t372]),
  )
  let t366 = @term_syntax.parse_term("(L : Num)")
  let t368 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(M : Num)"))((x367 : @kernel.Thm) => {
      @tactics.x_choose_tac(t366, x367)
    }),
  )
  let t365 = @tactics.mp_tac(
    @bool.spec(@term_syntax.parse_term("(y : Nadd)"), nadd_bound()),
  )
  let t363 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_cauchy())
  let t364 = @tactics.x_choose_tac(@term_syntax.parse_term("(B : Num)"), t363)
  let t393 = @tactics.then_tac(
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
                          @tactics.repeat_tac(@tactics.gen_tac),
                          t364,
                        ),
                        t365,
                      ),
                      t368,
                    ),
                    t373,
                  ),
                  @tactics.gen_tac,
                ),
                t385,
              ),
              t386,
            ),
            t387,
          ),
          t388,
        ),
        t389,
      ),
      t390,
    ),
    t392,
  )
  nadd_altmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∃ A : Num, ∃ B : Num, ∀ n : Num, dist((n * dest_nadd(x, dest_nadd(y, n)), dest_nadd(x, n) * dest_nadd(y, n))) <= A * n + B"),
      t393,
    ),
  )
}

///|
let nadd_altmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_ALTMUL")

///|
/// `NADD_ALTMUL`
pub fn nadd_altmul() -> @kernel.Thm {
  nadd_altmul_c.get()
}

///|
/// realax.ml:367
fn step_59() -> Unit raise {
  @preterm.override_interface(
    "===",
    @term_syntax.parse_term("(nadd_eq : (Nadd, Nadd) -> Bool)"),
  )
}

///|
/// nadd_eq
fn step_60() -> Unit raise {
  nadd_eq_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(nadd_eq : (Nadd, Nadd) -> Bool)((x : Nadd), (y : Nadd)) == (∃ B : Num, ∀ n : Num, dist((dest_nadd(x, n), dest_nadd(y, n))) <= B)"),
    ),
  )
}

///|
let nadd_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nadd_eq")

///|
/// `nadd_eq`
pub fn nadd_eq() -> @kernel.Thm {
  nadd_eq_c.get()
}

///|
/// NADD_EQ_REFL
fn step_61() -> Unit raise {
  let t394 = @tactics.then_tac(
    @tactics.gen_tac,
    @simp.rewrite_tac(@list.List([nadd_eq(), dist_refl(), @arith.le_0()])),
  )
  nadd_eq_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Nadd, nadd_eq(x, x)"), t394))
}

///|
let nadd_eq_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_EQ_REFL")

///|
/// `NADD_EQ_REFL`
pub fn nadd_eq_refl() -> @kernel.Thm {
  nadd_eq_refl_c.get()
}

///|
/// NADD_EQ_SYM
fn step_62() -> Unit raise {
  let t403 = @simp.gen_rewrite_tac(
    fn(
      x402 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x396 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s397 = @equal.rand_conv(x396)
        fn(x398 : @kernel.Term) -> @kernel.Thm raise { s397(x398) }
      })(
        (fn(
          x399 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s400 = @equal.once_depth_conv(x399)
          fn(x401 : @kernel.Term) -> @kernel.Thm raise { s400(x401) }
        })(x402),
      )
    },
    @list.List([dist_sym()]),
  )
  let t395 = @simp.rewrite_tac(@list.List([nadd_eq()]))
  let t404 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t395),
      t403,
    ),
    @tactics.refl_tac,
  )
  nadd_eq_sym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, nadd_eq(x, y) == nadd_eq(y, x)"), t404),
  )
}

///|
let nadd_eq_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_EQ_SYM")

///|
/// `NADD_EQ_SYM`
pub fn nadd_eq_sym() -> @kernel.Thm {
  nadd_eq_sym_c.get()
}

///|
/// NADD_EQ_TRANS
fn step_63() -> Unit raise {
  let t416 = @simp.asm_rewrite_tac(@list.List([]))
  let t415 = @tactics.match_mp_tac(@arith.le_add2())
  let t414 = @tactics.exists_tac(@term_syntax.parse_term("dest_nadd((y : Nadd), (n : Num))"))
  let t413 = @tactics.match_mp_tac(@arith.le_imp(dist_triangle()))
  let t412 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t411 = @tactics.exists_tac(@term_syntax.parse_term("(B1 : Num) + (B2 : Num)"))
  let t408 = @term_syntax.parse_term("(B2 : Num)")
  let t406 = @term_syntax.parse_term("(B1 : Num)")
  let t410 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x407 : @kernel.Thm) => @tactics.x_choose_tac(t406, x407),
      (x409 : @kernel.Thm) => @tactics.x_choose_tac(t408, x409),
    ),
  )
  let t405 = @simp.rewrite_tac(@list.List([nadd_eq()]))
  let t417 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t405),
                t410,
              ),
              t411,
            ),
            t412,
          ),
          t413,
        ),
        t414,
      ),
      t415,
    ),
    t416,
  )
  nadd_eq_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, nadd_eq(x, y) && nadd_eq(y, z) → nadd_eq(x, z)"),
      t417,
    ),
  )
}

///|
let nadd_eq_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_EQ_TRANS")

///|
/// `NADD_EQ_TRANS`
pub fn nadd_eq_trans() -> @kernel.Thm {
  nadd_eq_trans_c.get()
}

///|
/// realax.ml:394
fn step_64() -> Unit raise {
  @preterm.override_interface("&", @term_syntax.parse_term("(nadd_of_num : (Num) -> Nadd)"))
}

///|
/// nadd_of_num
fn step_65() -> Unit raise {
  nadd_of_num_c.set(
    @pair.new_definition(@term_syntax.parse_term("(nadd_of_num : (Num) -> Nadd)((k : Num)) == mk_nadd((n : Num) => k * n)")),
  )
}

///|
let nadd_of_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nadd_of_num")

///|
/// `nadd_of_num`
pub fn nadd_of_num() -> @kernel.Thm {
  nadd_of_num_c.get()
}

///|
/// NADD_OF_NUM
fn step_66() -> Unit raise {
  let t418 = @simp.rewrite_tac(
    @list.List([dist_refl(), @arith.le_0(), @arith.mult_ac()]),
  )
  let t419 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([nadd_of_num(), @equal.gsym(nadd_rep()), is_nadd()]),
    ),
    t418,
  )
  nadd_of_num_v1_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ k : Num, dest_nadd(nadd_of_num(k)) == ((n : Num) => k * n)"), t419),
  )
}

///|
let nadd_of_num_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_OF_NUM")

///|
/// `NADD_OF_NUM`
pub fn nadd_of_num_v1() -> @kernel.Thm {
  nadd_of_num_v1_c.get()
}

///|
/// NADD_OF_NUM_WELLDEF
fn step_67() -> Unit raise {
  let t424 = @tactics.match_accept_tac(nadd_eq_refl())
  let t423 = @tactics.disch_then(fn(
    x420 : @kernel.Thm,
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
    let s421 = @tactics.subst1_tac(x420)
    fn(
      x422 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s421(x422)
    }
  })
  let t425 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t423),
    t424,
  )
  nadd_of_num_welldef_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m == n → nadd_eq(nadd_of_num(m), nadd_of_num(n))"), t425),
  )
}

///|
let nadd_of_num_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_OF_NUM_WELLDEF",
)

///|
/// `NADD_OF_NUM_WELLDEF`
pub fn nadd_of_num_welldef() -> @kernel.Thm {
  nadd_of_num_welldef_c.get()
}

///|
/// NADD_OF_NUM_EQ
fn step_68() -> Unit raise {
  let t428 = @simp.rewrite_tac(
    @list.List([@equal.gsym(dist_rmul()), bounds_linear_0(), dist_eq_0()]),
  )
  let t427 = @simp.rewrite_tac(@list.List([nadd_eq(), nadd_of_num_v1()]))
  let t426 = @simp.rewrite_tac(@list.List([nadd_of_num_welldef()]))
  let t429 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.eq_tac,
        ),
        t426,
      ),
      t427,
    ),
    t428,
  )
  nadd_of_num_eq_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, nadd_eq(nadd_of_num(m), nadd_of_num(n)) == (m == n)"), t429),
  )
}

///|
let nadd_of_num_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_OF_NUM_EQ")

///|
/// `NADD_OF_NUM_EQ`
pub fn nadd_of_num_eq() -> @kernel.Thm {
  nadd_of_num_eq_c.get()
}

///|
/// realax.ml:419
fn step_69() -> Unit raise {
  @preterm.override_interface(
    "<<=",
    @term_syntax.parse_term("(nadd_le : (Nadd, Nadd) -> Bool)"),
  )
}

///|
/// nadd_le
fn step_70() -> Unit raise {
  nadd_le_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(nadd_le : (Nadd, Nadd) -> Bool)((x : Nadd), (y : Nadd)) == (∃ B : Num, ∀ n : Num, dest_nadd(x, n) <= dest_nadd(y, n) + B)"),
    ),
  )
}

///|
let nadd_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nadd_le")

///|
/// `nadd_le`
pub fn nadd_le() -> @kernel.Thm {
  nadd_le_c.get()
}

///|
/// NADD_LE_WELLDEF_LEMMA
fn step_71() -> Unit raise {
  let t455 = @simp.asm_rewrite_tac(@list.List([@arith.le_add_rcancel()]))
  let t454 = @tactics.first_assum(fn(
    x453 : @kernel.Thm,
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
    @tactics.match_mp_tac(@arith.le_imp(x453))
  })
  let t452 = @simp.rewrite_tac(
    @list.List([@arith.add_assoc(), @arith.le_add_rcancel()]),
  )
  let t451 = @tactics.first_assum(fn(
    x450 : @kernel.Thm,
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
      x449 : @kernel.Thm,
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
      @tactics.match_mp_tac(@arith.le_imp(x449))
    })(@bool.conjunct2(x450))
  })
  let t448 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t447 = @tactics.exists_tac(@term_syntax.parse_term("(B2 : Num) + (B : Num) + (B1 : Num)"))
  let t444 = @term_syntax.parse_term("(B : Num)")
  let t446 = @tactics.disch_then((x445 : @kernel.Thm) => {
    @tactics.x_choose_tac(t444, x445)
  })
  let t438 = @term_syntax.parse_term("(B2 : Num)")
  let t443 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x439 : @kernel.Thm) => @tactics.x_choose_tac(t438, x439),
      fn(
        x440 : @kernel.Thm,
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
        let s441 = @tactics.mp_tac(x440)
        fn(
          x442 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s441(x442)
        }
      },
    ),
  )
  let t432 = @term_syntax.parse_term("(B1 : Num)")
  let t437 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x433 : @kernel.Thm) => @tactics.x_choose_tac(t432, x433),
      fn(
        x434 : @kernel.Thm,
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
        let s435 = @tactics.mp_tac(x434)
        fn(
          x436 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s435(x436)
        }
      },
    ),
  )
  let t431 = @simp.rewrite_tac(
    @list.List([dist_le_cases(), @theorems.forall_and_thm()]),
  )
  let t430 = @simp.rewrite_tac(@list.List([nadd_eq(), nadd_le()]))
  let t456 = @tactics.then_tac(
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
                        @tactics.repeat_tac(@tactics.gen_tac),
                        t430,
                      ),
                      t431,
                    ),
                    t437,
                  ),
                  t443,
                ),
                t446,
              ),
              t447,
            ),
            t448,
          ),
          t451,
        ),
        t452,
      ),
      t454,
    ),
    t455,
  )
  nadd_le_welldef_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ x' : Nadd, ∀ y : Nadd, ∀ y' : Nadd, nadd_eq(x, x') && nadd_eq(y, y') && nadd_le(x, y) → nadd_le(x', y')"),
      t456,
    ),
  )
}

///|
let nadd_le_welldef_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_LE_WELLDEF_LEMMA",
)

///|
/// `NADD_LE_WELLDEF_LEMMA`
pub fn nadd_le_welldef_lemma() -> @kernel.Thm {
  nadd_le_welldef_lemma_c.get()
}

///|
/// NADD_LE_WELLDEF
fn step_72() -> Unit raise {
  let t470 = @simp.asm_rewrite_tac(@list.List([]))
  let t467 = @simp.once_rewrite_tac(@list.List([nadd_eq_sym()]))
  let t466 = @term_syntax.parse_term("(y' : Nadd)")
  let t468 = @tactics.then_tac(
    @tactics.map_every(
      fn(
        x463 : @kernel.Term,
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
        let s464 = @tactics.exists_tac(x463)
        fn(
          x465 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s464(x465)
        }
      },
      @list.List([@term_syntax.parse_term("(x' : Nadd)"), t466]),
    ),
    t467,
  )
  let t462 = @term_syntax.parse_term("(y : Nadd)")
  let t469 = @list.List([
    @tactics.map_every(
      fn(
        x459 : @kernel.Term,
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
        let s460 = @tactics.exists_tac(x459)
        fn(
          x461 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s460(x461)
        }
      },
      @list.List([@term_syntax.parse_term("(x : Nadd)"), t462]),
    ),
    t468,
  ])
  let t458 = @simp.asm_rewrite_tac(@list.List([]))
  let t457 = @tactics.match_mp_tac(nadd_le_welldef_lemma())
  let t471 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.repeat_tac(@tactics.strip_tac),
              @tactics.eq_tac,
            ),
            @tactics.disch_tac,
          ),
          t457,
        ),
        t458,
      ),
      t469,
    ),
    t470,
  )
  nadd_le_welldef_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ x' : Nadd, ∀ y : Nadd, ∀ y' : Nadd, nadd_eq(x, x') && nadd_eq(y, y') → nadd_le(x, y) == nadd_le(x', y')"),
      t471,
    ),
  )
}

///|
let nadd_le_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_LE_WELLDEF",
)

///|
/// `NADD_LE_WELLDEF`
pub fn nadd_le_welldef() -> @kernel.Thm {
  nadd_le_welldef_c.get()
}

///|
/// NADD_LE_REFL
fn step_73() -> Unit raise {
  let t472 = @simp.rewrite_tac(@list.List([nadd_le(), @arith.le_add()]))
  nadd_le_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Nadd, nadd_le(x, x)"), t472))
}

///|
let nadd_le_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LE_REFL")

///|
/// `NADD_LE_REFL`
pub fn nadd_le_refl() -> @kernel.Thm {
  nadd_le_refl_c.get()
}

///|
/// NADD_LE_TRANS
fn step_74() -> Unit raise {
  let t486 = @simp.asm_rewrite_tac(
    @list.List([@arith.add_assoc(), @arith.le_add_rcancel()]),
  )
  let t485 = @tactics.first_assum(fn(
    x484 : @kernel.Thm,
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
    @tactics.match_mp_tac(@arith.le_imp(x484))
  })
  let t483 = @tactics.exists_tac(@term_syntax.parse_term("(B2 : Num) + (B1 : Num)"))
  let t480 = @term_syntax.parse_term("(B2 : Num)")
  let t482 = @tactics.disch_then((x481 : @kernel.Thm) => {
    @tactics.x_choose_tac(t480, x481)
  })
  let t474 = @term_syntax.parse_term("(B1 : Num)")
  let t479 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x475 : @kernel.Thm) => @tactics.x_choose_tac(t474, x475),
      fn(
        x476 : @kernel.Thm,
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
        let s477 = @tactics.mp_tac(x476)
        fn(
          x478 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s477(x478)
        }
      },
    ),
  )
  let t473 = @simp.rewrite_tac(@list.List([nadd_le()]))
  let t487 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t473),
              t479,
            ),
            t482,
          ),
          t483,
        ),
        @tactics.gen_tac,
      ),
      t485,
    ),
    t486,
  )
  nadd_le_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, nadd_le(x, y) && nadd_le(y, z) → nadd_le(x, z)"),
      t487,
    ),
  )
}

///|
let nadd_le_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LE_TRANS")

///|
/// `NADD_LE_TRANS`
pub fn nadd_le_trans() -> @kernel.Thm {
  nadd_le_trans_c.get()
}

///|
/// NADD_LE_ANTISYM
fn step_75() -> Unit raise {
  let t500 = @simp.asm_rewrite_tac(@list.List([]))
  let t499 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num)"))
  let t497 = @term_syntax.parse_term("(B : Num)")
  let t501 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then((x498 : @kernel.Thm) => {
          @tactics.x_choose_tac(t497, x498)
        }),
        @tactics.conj_tac,
      ),
      t499,
    ),
    t500,
  )
  let t496 = @simp.asm_rewrite_tac(
    @list.List([
      @arith.add_assoc(),
      @arith.le_add_rcancel(),
      @arith.le_add(),
      @arith.le_addr(),
    ]),
  )
  let t495 = @tactics.first_assum(fn(
    x494 : @kernel.Thm,
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
    @tactics.match_mp_tac(@arith.le_imp(x494))
  })
  let t493 = @tactics.exists_tac(@term_syntax.parse_term("(B1 : Num) + (B2 : Num)"))
  let t491 = @term_syntax.parse_term("(B2 : Num)")
  let t489 = @term_syntax.parse_term("(B1 : Num)")
  let t502 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.disch_then(
                @tactics.conjuncts_then2(
                  (x490 : @kernel.Thm) => @tactics.x_choose_tac(t489, x490),
                  (x492 : @kernel.Thm) => @tactics.x_choose_tac(t491, x492),
                ),
              ),
              t493,
            ),
            @tactics.gen_tac,
          ),
          @tactics.conj_tac,
        ),
        t495,
      ),
      t496,
    ),
    t501,
  ])
  let t488 = @simp.rewrite_tac(
    @list.List([nadd_le(), nadd_eq(), dist_le_cases()]),
  )
  let t503 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t488),
      @tactics.eq_tac,
    ),
    t502,
  )
  nadd_le_antisym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, (nadd_le(x, y) && nadd_le(y, x)) == nadd_eq(x, y)"),
      t503,
    ),
  )
}

///|
let nadd_le_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_LE_ANTISYM",
)

///|
/// `NADD_LE_ANTISYM`
pub fn nadd_le_antisym() -> @kernel.Thm {
  nadd_le_antisym_c.get()
}

///|
/// NADD_LE_TOTAL_LEMMA
fn step_76() -> Unit raise {
  let t523 = @simp.rewrite_tac(
    @list.List([@arith.add_assoc(), @arith.le_add()]),
  )
  let t522 = @tactics.disch_then(fn(
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
    @tactics.match_mp_tac(@arith.le_imp(x521))
  })
  let t520 = @simp.rewrite_tac(@list.List([@arith.not_lt()]))
  let t519 = @tactics.conv_tac(@class.contrapos_conv)
  let t518 = @simp.asm_rewrite_tac(
    @list.List([@arith.not_lt(), @arith.add_assoc(), @arith.le_addr()]),
  )
  let t517 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t516 = @tactics.pop_assum(fn(
    x513 : @kernel.Thm,
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
    let s514 = @tactics.mp_tac(x513)
    fn(
      x515 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s514(x515)
    }
  })
  let t512 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t508 = @term_syntax.parse_term("(B : Num) + dest_nadd((x : Nadd), 0)")
  let t506 = @term_syntax.parse_term("(n : Num)")
  let t511 = @tactics.pop_assum(fn(
    x510 : @kernel.Thm,
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
    ((x507 : @kernel.Thm) => @tactics.x_choose_tac(t506, x507))(
      ((x509 : @kernel.Thm) => @bool.spec(t508, x509))(x510),
    )
  })
  let t505 = @simp.rewrite_tac(@list.List([@arith.not_le()]))
  let t504 = @simp.rewrite_tac(
    @list.List([nadd_le(), @class.not_forall_thm(), @class.not_exists_thm()]),
  )
  let t524 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.repeat_tac(@tactics.gen_tac),
                            t504,
                          ),
                          t505,
                        ),
                        @tactics.disch_tac,
                      ),
                      @tactics.gen_tac,
                    ),
                    t511,
                  ),
                  t512,
                ),
                t516,
              ),
              t517,
            ),
            t518,
          ),
          t519,
        ),
        t520,
      ),
      t522,
    ),
    t523,
  )
  nadd_le_total_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, !nadd_le(x, y) → (∀ B : Num, ∃ n : Num, !(n == 0) && dest_nadd(y, n) + B < dest_nadd(x, n))"),
      t524,
    ),
  )
}

///|
let nadd_le_total_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_LE_TOTAL_LEMMA",
)

///|
/// `NADD_LE_TOTAL_LEMMA`
pub fn nadd_le_total_lemma() -> @kernel.Thm {
  nadd_le_total_lemma_c.get()
}

///|
/// NADD_LE_TOTAL
fn step_77() -> Unit raise {
  let t586 = @simp.asm_rewrite_tac(@list.List([]))
  let t585 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([dist_le_cases()])),
  )
  let t584 = @simp.gen_rewrite_tac(
    fn(
      x583 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x577 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s578 = @equal.rand_conv(x577)
        fn(x579 : @kernel.Term) -> @kernel.Thm raise { s578(x579) }
      })(
        (fn(
          x580 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s581 = @equal.rand_conv(x580)
          fn(x582 : @kernel.Term) -> @kernel.Thm raise { s581(x582) }
        })(x583),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t576 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.right_add_distrib())]),
  )
  let t575 = @tactics.match_mp_tac(@arith.le_add2())
  let t573 = @term_syntax.parse_term("(a : Num) + ((b : Num) + (c : Num)) + ((d : Num) + ((e : Num) + (f : Num))) == d + (b + e) + (a + (c + f))")
  let t574 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@arith.add_ac())(t573)]),
  )
  let t572 = @simp.rewrite_tac(@list.List([@arith.left_add_distrib()]))
  let t571 = @simp.rewrite_tac(@list.List([@arith.not_lt()]))
  let t568 = @drule.match_mp(@arith.lt_add2())
  let t570 = @tactics.disch_then(fn(
    x569 : @kernel.Thm,
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
      x565 : @kernel.Thm,
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
      let s566 = @tactics.mp_tac(x565)
      fn(
        x567 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s566(x567)
      }
    })(t568(x569))
  })
  let t564 = @simp.rewrite_tac(@list.List([@arith.not_le()]))
  let t563 = @simp.rewrite_tac(
    @list.List([@arith.not_lt(), @equal.gsym(@arith.le_mult_lcancel())]),
  )
  let t560 = @drule.match_mp(
    @itab.itaut(
      @term_syntax.parse_term("(!(a : Bool) && (b : Bool)) && !(c : Bool) && (d : Bool) → !(c || !b) && !(a || !d)"),
    ),
  )
  let t562 = @tactics.disch_then(fn(
    x561 : @kernel.Thm,
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
      x557 : @kernel.Thm,
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
      let s558 = @tactics.mp_tac(x557)
      fn(
        x559 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s558(x559)
      }
    })(t560(x561))
  })
  let t555 = @tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(
    x552 : @kernel.Thm,
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
    let s553 = @tactics.mp_tac(x552)
    fn(
      x554 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s553(x554)
    }
  })
  let t556 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(t555),
  )
  let t551 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t550 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t546 = @term_syntax.parse_term("(B1 : Num) + (B2 : Num)")
  let t549 = @tactics.disch_then(fn(
    x548 : @kernel.Thm,
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
      x543 : @kernel.Thm,
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
      let s544 = @tactics.mp_tac(x543)
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
        s544(x545)
      }
    })(((x547 : @kernel.Thm) => @bool.spec(t546, x547))(x548))
  })
  let t542 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t537 = @drule.match_mp(nadd_le_total_lemma())
  let t541 = @tactics.disch_then(fn(
    x540 : @kernel.Thm,
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
        x536 : @list.List[@kernel.Thm],
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
          let s533 = @tactics.mp_tac(x532)
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
        })(
          ((x535 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x535))(
            x536,
          ),
        )
      })(((x538 : @list.List[@kernel.Thm]) => @lib.map(t537, x538))(x539))
    })(@bool.conjuncts_rule(x540))
  })
  let t531 = @simp.pure_once_rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t529 = @bool.spec(@term_syntax.parse_term("(y : Nadd)"), nadd_cauchy())
  let t530 = @tactics.x_choose_tac(@term_syntax.parse_term("(B2 : Num)"), t529)
  let t527 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_cauchy())
  let t528 = @tactics.x_choose_tac(@term_syntax.parse_term("(B1 : Num)"), t527)
  let t526 = @simp.gen_rewrite_tac(
    fn(
      x525 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x525
    },
    @list.List([@class.taut(@term_syntax.parse_term("(a : Bool) == !!a"))]),
  )
  let t587 = @tactics.then_tac(
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
                                                @tactics.repeat_tac(
                                                  @tactics.gen_tac,
                                                ),
                                                t526,
                                              ),
                                              t528,
                                            ),
                                            t530,
                                          ),
                                          t531,
                                        ),
                                        t541,
                                      ),
                                      t542,
                                    ),
                                    t549,
                                  ),
                                  t550,
                                ),
                                t551,
                              ),
                              t556,
                            ),
                            t562,
                          ),
                          t563,
                        ),
                        t564,
                      ),
                      t570,
                    ),
                    t571,
                  ),
                  t572,
                ),
                t574,
              ),
              t575,
            ),
            t576,
          ),
          @tactics.conj_tac,
        ),
        t584,
      ),
      t585,
    ),
    t586,
  )
  nadd_le_total_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, nadd_le(x, y) || nadd_le(y, x)"), t587),
  )
}

///|
let nadd_le_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LE_TOTAL")

///|
/// `NADD_LE_TOTAL`
pub fn nadd_le_total() -> @kernel.Thm {
  nadd_le_total_c.get()
}

///|
/// NADD_ARCH
fn step_78() -> Unit raise {
  let t588 = @simp.rewrite_tac(
    @list.List([nadd_le(), nadd_of_num_v1(), nadd_bound()]),
  )
  nadd_arch_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Nadd, ∃ n : Num, nadd_le(x, nadd_of_num(n))"), t588))
}

///|
let nadd_arch_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_ARCH")

///|
/// `NADD_ARCH`
pub fn nadd_arch() -> @kernel.Thm {
  nadd_arch_c.get()
}

///|
/// NADD_OF_NUM_LE
fn step_79() -> Unit raise {
  let t590 = @simp.rewrite_tac(@list.List([bounds_linear()]))
  let t589 = @simp.rewrite_tac(@list.List([nadd_le(), nadd_of_num_v1()]))
  let t591 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t589),
    t590,
  )
  nadd_of_num_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, nadd_le(nadd_of_num(m), nadd_of_num(n)) == (m <= n)"), t591),
  )
}

///|
let nadd_of_num_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_OF_NUM_LE")

///|
/// `NADD_OF_NUM_LE`
pub fn nadd_of_num_le() -> @kernel.Thm {
  nadd_of_num_le_c.get()
}

///|
/// realax.ml:515
fn step_80() -> Unit raise {
  @preterm.override_interface(
    "++",
    @term_syntax.parse_term("(nadd_add : (Nadd, Nadd) -> Nadd)"),
  )
}

///|
/// nadd_add
fn step_81() -> Unit raise {
  nadd_add_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(nadd_add : (Nadd, Nadd) -> Nadd)((x : Nadd), (y : Nadd)) == mk_nadd((n : Num) => dest_nadd(x, n) + dest_nadd(y, n))"),
    ),
  )
}

///|
let nadd_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nadd_add")

///|
/// `nadd_add`
pub fn nadd_add() -> @kernel.Thm {
  nadd_add_c.get()
}

///|
/// NADD_ADD
fn step_82() -> Unit raise {
  let t611 = @simp.asm_rewrite_tac(@list.List([]))
  let t610 = @tactics.match_mp_tac(@arith.le_add2())
  let t609 = @simp.rewrite_tac(@list.List([@arith.right_add_distrib()]))
  let t608 = @tactics.match_mp_tac(@arith.le_imp(dist_add2()))
  let t607 = @simp.gen_rewrite_tac(
    fn(
      x606 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x600 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s601 = @equal.land_conv(x600)
        fn(x602 : @kernel.Term) -> @kernel.Thm raise { s601(x602) }
      })(
        (fn(
          x603 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s604 = @equal.once_depth_conv(x603)
          fn(x605 : @kernel.Term) -> @kernel.Thm raise { s604(x605) }
        })(x606),
      )
    },
    @list.List([@arith.left_add_distrib()]),
  )
  let t598 = @term_syntax.parse_term("(n : Num)")
  let t599 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t598]),
  )
  let t597 = @tactics.exists_tac(@term_syntax.parse_term("(B1 : Num) + (B2 : Num)"))
  let t595 = @bool.spec(@term_syntax.parse_term("(y : Nadd)"), nadd_cauchy())
  let t596 = @tactics.x_choose_tac(@term_syntax.parse_term("(B2 : Num)"), t595)
  let t593 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_cauchy())
  let t594 = @tactics.x_choose_tac(@term_syntax.parse_term("(B1 : Num)"), t593)
  let t592 = @simp.rewrite_tac(
    @list.List([nadd_add(), @equal.gsym(nadd_rep()), is_nadd()]),
  )
  let t612 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.gen_tac),
                      t592,
                    ),
                    t594,
                  ),
                  t596,
                ),
                t597,
              ),
              t599,
            ),
            t607,
          ),
          t608,
        ),
        t609,
      ),
      t610,
    ),
    t611,
  )
  nadd_add_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, dest_nadd(nadd_add(x, y)) == ((n : Num) => dest_nadd(x, n) + dest_nadd(y, n))"),
      t612,
    ),
  )
}

///|
let nadd_add_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_ADD")

///|
/// `NADD_ADD`
pub fn nadd_add_v1() -> @kernel.Thm {
  nadd_add_v1_c.get()
}

///|
/// NADD_ADD_WELLDEF
fn step_83() -> Unit raise {
  let t623 = @simp.asm_rewrite_tac(@list.List([]))
  let t622 = @tactics.match_mp_tac(@arith.le_add2())
  let t621 = @tactics.match_mp_tac(@arith.le_imp(dist_add2()))
  let t620 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t619 = @tactics.exists_tac(@term_syntax.parse_term("(B1 : Num) + (B2 : Num)"))
  let t616 = @term_syntax.parse_term("(B2 : Num)")
  let t614 = @term_syntax.parse_term("(B1 : Num)")
  let t618 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x615 : @kernel.Thm) => @tactics.x_choose_tac(t614, x615),
      (x617 : @kernel.Thm) => @tactics.x_choose_tac(t616, x617),
    ),
  )
  let t613 = @simp.rewrite_tac(@list.List([nadd_eq(), nadd_add_v1()]))
  let t624 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t613),
              t618,
            ),
            t619,
          ),
          t620,
        ),
        t621,
      ),
      t622,
    ),
    t623,
  )
  nadd_add_welldef_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ x' : Nadd, ∀ y : Nadd, ∀ y' : Nadd, nadd_eq(x, x') && nadd_eq(y, y') → nadd_eq(nadd_add(x, y), nadd_add(x', y'))"),
      t624,
    ),
  )
}

///|
let nadd_add_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_ADD_WELLDEF",
)

///|
/// `NADD_ADD_WELLDEF`
pub fn nadd_add_welldef() -> @kernel.Thm {
  nadd_add_welldef_c.get()
}

///|
/// NADD_ADD_SYM
fn step_84() -> Unit raise {
  let t634 = @simp.rewrite_tac(@list.List([nadd_eq_refl()]))
  let t633 = @simp.gen_rewrite_tac(
    fn(
      x632 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x626 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s627 = @equal.rand_conv(x626)
        fn(x628 : @kernel.Term) -> @kernel.Thm raise { s627(x628) }
      })(
        (fn(
          x629 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s630 = @equal.once_depth_conv(x629)
          fn(x631 : @kernel.Term) -> @kernel.Thm raise { s630(x631) }
        })(x632),
      )
    },
    @list.List([@arith.add_sym()]),
  )
  let t625 = @simp.rewrite_tac(@list.List([nadd_add()]))
  let t635 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t625),
      t633,
    ),
    t634,
  )
  nadd_add_sym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, nadd_eq(nadd_add(x, y), nadd_add(y, x))"), t635),
  )
}

///|
let nadd_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_ADD_SYM")

///|
/// `NADD_ADD_SYM`
pub fn nadd_add_sym() -> @kernel.Thm {
  nadd_add_sym_c.get()
}

///|
/// NADD_ADD_ASSOC
fn step_85() -> Unit raise {
  let t637 = @simp.rewrite_tac(
    @list.List([nadd_add_v1(), @arith.add_assoc(), nadd_eq_refl()]),
  )
  let t636 = @simp.once_rewrite_tac(@list.List([nadd_add()]))
  let t638 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t636),
    t637,
  )
  nadd_add_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, nadd_eq(nadd_add(x, nadd_add(y, z)), nadd_add(nadd_add(x, y), z))"),
      t638,
    ),
  )
}

///|
let nadd_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_ADD_ASSOC")

///|
/// `NADD_ADD_ASSOC`
pub fn nadd_add_assoc() -> @kernel.Thm {
  nadd_add_assoc_c.get()
}

///|
/// NADD_ADD_LID
fn step_86() -> Unit raise {
  let t639 = @simp.rewrite_tac(
    @list.List([
      @arith.mult_clauses(),
      @arith.add_clauses(),
      dist_refl(),
      @arith.le_0(),
    ]),
  )
  let t640 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.gen_tac,
      @simp.rewrite_tac(
        @list.List([nadd_eq(), nadd_add_v1(), nadd_of_num_v1()]),
      ),
    ),
    t639,
  )
  nadd_add_lid_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Nadd, nadd_eq(nadd_add(nadd_of_num(0), x), x)"), t640),
  )
}

///|
let nadd_add_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_ADD_LID")

///|
/// `NADD_ADD_LID`
pub fn nadd_add_lid() -> @kernel.Thm {
  nadd_add_lid_c.get()
}

///|
/// NADD_ADD_LCANCEL
fn step_87() -> Unit raise {
  let t641 = @simp.rewrite_tac(
    @list.List([nadd_eq(), nadd_add_v1(), dist_ladd()]),
  )
  let t642 = @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t641)
  nadd_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, nadd_eq(nadd_add(x, y), nadd_add(x, z)) → nadd_eq(y, z)"),
      t642,
    ),
  )
}

///|
let nadd_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_ADD_LCANCEL",
)

///|
/// `NADD_ADD_LCANCEL`
pub fn nadd_add_lcancel() -> @kernel.Thm {
  nadd_add_lcancel_c.get()
}

///|
/// NADD_LE_ADD
fn step_88() -> Unit raise {
  let t645 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.le_add()]),
  )
  let t644 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t643 = @simp.rewrite_tac(@list.List([nadd_le(), nadd_add_v1()]))
  let t646 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t643),
      t644,
    ),
    t645,
  )
  nadd_le_add_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, nadd_le(x, nadd_add(x, y))"), t646),
  )
}

///|
let nadd_le_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LE_ADD")

///|
/// `NADD_LE_ADD`
pub fn nadd_le_add() -> @kernel.Thm {
  nadd_le_add_c.get()
}

///|
/// NADD_LE_EXISTS
fn step_89() -> Unit raise {
  let t713 = @simp.asm_rewrite_tac(
    @list.List([dist_radd_0(), @arith.le_refl()]),
  )
  let t712 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(dist_lmul()),
      dist_addbound(),
      @arith.le_mult_lcancel(),
    ]),
  )
  let t711 = @simp.gen_rewrite_tac(
    fn(
      x710 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x704 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s705 = @equal.land_conv(x704)
        fn(x706 : @kernel.Term) -> @kernel.Thm raise { s705(x706) }
      })(
        (fn(
          x707 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s708 = @equal.once_depth_conv(x707)
          fn(x709 : @kernel.Term) -> @kernel.Thm raise { s708(x709) }
        })(x710),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t703 = @simp.asm_rewrite_tac(@list.List([]))
  let t702 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t701 = @tactics.match_mp_tac(@arith.le_add2())
  let t700 = @simp.gen_rewrite_tac(
    fn(
      x697 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s698 = @equal.rand_conv(x697)
      fn(x699 : @kernel.Term) -> @kernel.Thm raise { s698(x699) }
    },
    @list.List([@arith.add_sym()]),
  )
  let t696 = @simp.rewrite_tac(@list.List([@arith.right_add_distrib()]))
  let t695 = @tactics.match_mp_tac(@arith.le_imp(dist_add2()))
  let t694 = @simp.gen_rewrite_tac(
    fn(
      x693 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x687 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s688 = @equal.land_conv(x687)
        fn(x689 : @kernel.Term) -> @kernel.Thm raise { s688(x689) }
      })(
        (fn(
          x690 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s691 = @equal.once_depth_conv(x690)
          fn(x692 : @kernel.Term) -> @kernel.Thm raise { s691(x692) }
        })(x693),
      )
    },
    @list.List([@arith.left_add_distrib()]),
  )
  let t686 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@arith.left_add_distrib())]),
  )
  let t685 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t684 = @simp.asm_rewrite_tac(@list.List([]))
  let t683 = @tactics.match_mp_tac(@arith.le_add2())
  let t682 = @simp.gen_rewrite_tac(
    fn(
      x679 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s680 = @equal.rand_conv(x679)
      fn(x681 : @kernel.Term) -> @kernel.Thm raise { s680(x681) }
    },
    @list.List([@arith.add_sym()]),
  )
  let t678 = @simp.once_rewrite_tac(@list.List([@arith.right_add_distrib()]))
  let t676 = @term_syntax.parse_term("(n : Num) * dest_nadd((x : Nadd), (m : Num))")
  let t677 = @tactics.map_every(
    fn(
      x673 : @kernel.Term,
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
      let s674 = @tactics.exists_tac(x673)
      fn(
        x675 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s674(x675)
      }
    },
    @list.List([@term_syntax.parse_term("(m : Num) * dest_nadd((x : Nadd), (n : Num))"), t676]),
  )
  let t672 = @tactics.match_mp_tac(@arith.le_imp(dist_add2_rev()))
  let t671 = @tactics.repeat_tac(@tactics.gen_tac)
  let t670 = @tactics.exists_tac(@term_syntax.parse_term("(B1 : Num) + ((B2 : Num) + (B : Num))"))
  let t668 = @bool.spec(@term_syntax.parse_term("(y : Nadd)"), nadd_cauchy())
  let t669 = @tactics.x_choose_tac(@term_syntax.parse_term("(B2 : Num)"), t668)
  let t666 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_cauchy())
  let t667 = @tactics.x_choose_tac(@term_syntax.parse_term("(B1 : Num)"), t666)
  let t714 = @list.List([
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
                                              @simp.rewrite_tac(
                                                @list.List([
                                                  @equal.gsym(nadd_rep()),
                                                  is_nadd(),
                                                ]),
                                              ),
                                              t667,
                                            ),
                                            t669,
                                          ),
                                          t670,
                                        ),
                                        t671,
                                      ),
                                      t672,
                                    ),
                                    t677,
                                  ),
                                  t678,
                                ),
                                t682,
                              ),
                              t683,
                            ),
                            t684,
                          ),
                          t685,
                        ),
                        t686,
                      ),
                      t694,
                    ),
                    t695,
                  ),
                  t696,
                ),
                t700,
              ),
              t701,
            ),
            t702,
          ),
          t703,
        ),
        t711,
      ),
      t712,
    ),
    t713,
  ])
  let t665 = @tactics.subgoal_then(@term_syntax.parse_term("dest_nadd(mk_nadd((d : (Num) -> Num))) == d"), fn(
    x662 : @kernel.Thm,
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
    let s663 = @tactics.subst1_tac(x662)
    fn(
      x664 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s663(x664)
    }
  })
  let t661 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t660 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num)"))
  let t659 = @simp.rewrite_tac(@list.List([nadd_eq(), nadd_add_v1()]))
  let t658 = @tactics.exists_tac(@term_syntax.parse_term("mk_nadd((d : (Num) -> Num))"))
  let t657 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : (Num) -> Num)"))(fn(
      x656 : @kernel.Thm,
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
        x653 : @kernel.Thm,
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
        let s654 = @tactics.assume_tac(x653)
        fn(
          x655 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s654(x655)
        }
      })(@equal.gsym(x656))
    }),
  )
  let t652 = @simp.rewrite_tac(
    @list.List([@arith.le_exists(), @class.skolem_thm()]),
  )
  let t651 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(B : Num)"))(fn(
      x648 : @kernel.Thm,
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
      let s649 = @tactics.mp_tac(x648)
      fn(
        x650 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s649(x650)
      }
    }),
  )
  let t647 = @simp.rewrite_tac(@list.List([nadd_le()]))
  let t715 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.repeat_tac(@tactics.gen_tac),
                      t647,
                    ),
                    t651,
                  ),
                  t652,
                ),
                t657,
              ),
              t658,
            ),
            t659,
          ),
          t660,
        ),
        t661,
      ),
      t665,
    ),
    t714,
  )
  nadd_le_exists_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, nadd_le(x, y) → (∃ d : Nadd, nadd_eq(y, nadd_add(x, d)))"),
      t715,
    ),
  )
}

///|
let nadd_le_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LE_EXISTS")

///|
/// `NADD_LE_EXISTS`
pub fn nadd_le_exists() -> @kernel.Thm {
  nadd_le_exists_c.get()
}

///|
/// NADD_OF_NUM_ADD
fn step_90() -> Unit raise {
  let t716 = @simp.rewrite_tac(
    @list.List([@arith.right_add_distrib(), dist_refl(), @arith.le_0()]),
  )
  let t717 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([nadd_eq(), nadd_of_num_v1(), nadd_add_v1()])),
    t716,
  )
  nadd_of_num_add_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, nadd_eq(nadd_add(nadd_of_num(m), nadd_of_num(n)), nadd_of_num(m + n))"), t717),
  )
}

///|
let nadd_of_num_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_OF_NUM_ADD",
)

///|
/// `NADD_OF_NUM_ADD`
pub fn nadd_of_num_add() -> @kernel.Thm {
  nadd_of_num_add_c.get()
}

///|
/// realax.ml:606
fn step_91() -> Unit raise {
  @preterm.override_interface(
    "**",
    @term_syntax.parse_term("(nadd_mul : (Nadd, Nadd) -> Nadd)"),
  )
}

///|
/// nadd_mul
fn step_92() -> Unit raise {
  nadd_mul_c.set(
    @pair.new_definition(@term_syntax.parse_term("(nadd_mul : (Nadd, Nadd) -> Nadd)((x : Nadd), (y : Nadd)) == mk_nadd((n : Num) => dest_nadd(x, dest_nadd(y, n)))")),
  )
}

///|
let nadd_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nadd_mul")

///|
/// `nadd_mul`
pub fn nadd_mul() -> @kernel.Thm {
  nadd_mul_c.get()
}

///|
/// NADD_MUL
fn step_93() -> Unit raise {
  let t747 = @simp.rewrite_tac(
    @list.List([
      @arith.left_add_distrib(),
      @arith.right_add_distrib(),
      @arith.mult_assoc(),
      @arith.add_ac(),
    ]),
  )
  let t748 = @tactics.then_tac(@tactics.match_mp_tac(@arith.eq_imp_le()), t747)
  let t746 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t745 = @tactics.exists_tac(
    @term_syntax.parse_term("(C : Num) * dist(((m : Num) * dest_nadd((y : Nadd), (n : Num)), n * dest_nadd(y, m)))"),
  )
  let t744 = @tactics.match_mp_tac(@arith.le_trans())
  let t743 = @simp.asm_rewrite_tac(@list.List([]))
  let t742 = @simp.once_rewrite_tac(@list.List([dist_sym()]))
  let t741 = @tactics.match_mp_tac(@arith.le_add2())
  let t740 = @tactics.exists_tac(@term_syntax.parse_term("dest_nadd((x : Nadd), (n : Num) * dest_nadd((y : Nadd), (m : Num)))"))
  let t739 = @tactics.match_mp_tac(@arith.le_imp(dist_triangle()))
  let t738 = @simp.asm_rewrite_tac(@list.List([]))
  let t737 = @simp.once_rewrite_tac(@list.List([dist_sym()]))
  let t736 = @tactics.match_mp_tac(@arith.le_add2())
  let t735 = @tactics.exists_tac(@term_syntax.parse_term("dest_nadd((x : Nadd), (m : Num) * dest_nadd((y : Nadd), (n : Num)))"))
  let t749 = @list.List([
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
                          @tactics.then_tac(
                            @tactics.match_mp_tac(
                              @arith.le_imp(dist_triangle()),
                            ),
                            t735,
                          ),
                          t736,
                        ),
                        t737,
                      ),
                      t738,
                    ),
                    t739,
                  ),
                  t740,
                ),
                t741,
              ),
              t742,
            ),
            t743,
          ),
          t744,
        ),
        t745,
      ),
      t746,
    ),
    t748,
  ])
  let t734 = @tactics.exists_tac(
    @term_syntax.parse_term("(D : Num) * (m : Num) + D + (D * (n : Num) + D + (C : Num) * ((B : Num) * (m + n)))"),
  )
  let t733 = @tactics.match_mp_tac(@arith.le_trans())
  let t732 = @tactics.repeat_tac(@tactics.gen_tac)
  let t730 = @term_syntax.parse_term("(D : Num) + D")
  let t731 = @tactics.map_every(
    fn(
      x727 : @kernel.Term,
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
      let s728 = @tactics.exists_tac(x727)
      fn(
        x729 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s728(x729)
      }
    },
    @list.List([@term_syntax.parse_term("(D : Num) + (C : Num) * (B : Num)"), t730]),
  )
  let t726 = @simp.rewrite_tac(@list.List([@arith.mult_clauses(), dist_refl()]))
  let t725 = @tactics.match_mp_tac(bounds_notzero())
  let t723 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_multiplicative())
  let t724 = @tactics.x_choose_tac(@term_syntax.parse_term("(D : Num)"), t723)
  let t721 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_dist())
  let t722 = @tactics.x_choose_tac(@term_syntax.parse_term("(C : Num)"), t721)
  let t719 = @bool.spec(@term_syntax.parse_term("(y : Nadd)"), nadd_cauchy())
  let t720 = @tactics.x_choose_tac(@term_syntax.parse_term("(B : Num)"), t719)
  let t718 = @simp.rewrite_tac(
    @list.List([nadd_mul(), @equal.gsym(nadd_rep()), is_nadd()]),
  )
  let t750 = @tactics.thenl(
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
                          @tactics.repeat_tac(@tactics.gen_tac),
                          t718,
                        ),
                        t720,
                      ),
                      t722,
                    ),
                    t724,
                  ),
                  t725,
                ),
                t726,
              ),
              t731,
            ),
            t732,
          ),
          t733,
        ),
        t734,
      ),
      @tactics.conj_tac,
    ),
    t749,
  )
  nadd_mul_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, dest_nadd(nadd_mul(x, y)) == ((n : Num) => dest_nadd(x, dest_nadd(y, n)))"),
      t750,
    ),
  )
}

///|
let nadd_mul_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_MUL")

///|
/// `NADD_MUL`
pub fn nadd_mul_v1() -> @kernel.Thm {
  nadd_mul_v1_c.get()
}

///|
/// NADD_MUL_SYM
fn step_94() -> Unit raise {
  let t794 = @simp.asm_rewrite_tac(@list.List([]))
  let t793 = @simp.gen_rewrite_tac(
    fn(
      x792 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x785 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s786 = @equal.land_conv(x785)
        fn(x787 : @kernel.Term) -> @kernel.Thm raise { s786(x787) }
      })(
        ((x791 : (@kernel.Term) -> @kernel.Thm raise) => {
          @lib.funpow(
            2,
            fn(
              x788 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s789 = @equal.rand_conv(x788)
              fn(x790 : @kernel.Term) -> @kernel.Thm raise { s789(x790) }
            },
            x791,
          )
        })(x792),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t784 = @simp.once_rewrite_tac(@list.List([dist_sym()]))
  let t783 = @simp.asm_rewrite_tac(@list.List([]))
  let t782 = @tactics.match_mp_tac(@arith.le_add2())
  let t781 = @tactics.exists_tac(@term_syntax.parse_term("dest_nadd((x : Nadd), (n : Num)) * dest_nadd((y : Nadd), n)"))
  let t780 = @tactics.match_mp_tac(@arith.le_imp(dist_triangle()))
  let t778 = @term_syntax.parse_term("(a : Num) + (b : Num) + ((c : Num) + (d : Num)) == a + c + (b + d)")
  let t779 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@arith.add_ac())(t778)]),
  )
  let t777 = @simp.rewrite_tac(@list.List([@arith.right_add_distrib()]))
  let t775 = @term_syntax.parse_term("(B1 : Num) + (B2 : Num)")
  let t776 = @tactics.map_every(
    fn(
      x772 : @kernel.Term,
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
      let s773 = @tactics.exists_tac(x772)
      fn(
        x774 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s773(x774)
      }
    },
    @list.List([@term_syntax.parse_term("(A1 : Num) + (A2 : Num)"), t775]),
  )
  let t771 = @simp.rewrite_tac(@list.List([dist_lmul()]))
  let t770 = @simp.rewrite_tac(@list.List([bounds_divided()]))
  let t767 = @term_syntax.parse_term("(B2 : Num)")
  let t769 = @tactics.disch_then((x768 : @kernel.Thm) => {
    @tactics.x_choose_tac(t767, x768)
  })
  let t764 = @term_syntax.parse_term("(x : Nadd)")
  let t765 = @bool.specl(
    @list.List([@term_syntax.parse_term("(y : Nadd)"), t764]),
    nadd_altmul(),
  )
  let t766 = @tactics.x_choose_then(@term_syntax.parse_term("(A2 : Num)"))(fn(
    x761 : @kernel.Thm,
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
    let s762 = @tactics.mp_tac(x761)
    fn(
      x763 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s762(x763)
    }
  })(t765)
  let t758 = @term_syntax.parse_term("(B1 : Num)")
  let t760 = @tactics.disch_then((x759 : @kernel.Thm) => {
    @tactics.x_choose_tac(t758, x759)
  })
  let t755 = @term_syntax.parse_term("(y : Nadd)")
  let t756 = @bool.specl(
    @list.List([@term_syntax.parse_term("(x : Nadd)"), t755]),
    nadd_altmul(),
  )
  let t757 = @tactics.x_choose_then(@term_syntax.parse_term("(A1 : Num)"))(fn(
    x752 : @kernel.Thm,
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
    let s753 = @tactics.mp_tac(x752)
    fn(
      x754 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s753(x754)
    }
  })(t756)
  let t751 = @simp.rewrite_tac(@list.List([nadd_eq(), nadd_mul_v1()]))
  let t795 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.repeat_tac(@tactics.gen_tac),
                                      t751,
                                    ),
                                    t757,
                                  ),
                                  t760,
                                ),
                                t766,
                              ),
                              t769,
                            ),
                            t770,
                          ),
                          t771,
                        ),
                        t776,
                      ),
                      @tactics.gen_tac,
                    ),
                    t777,
                  ),
                  t779,
                ),
                t780,
              ),
              t781,
            ),
            t782,
          ),
          t783,
        ),
        t784,
      ),
      t793,
    ),
    t794,
  )
  nadd_mul_sym_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, nadd_eq(nadd_mul(x, y), nadd_mul(y, x))"), t795),
  )
}

///|
let nadd_mul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_MUL_SYM")

///|
/// `NADD_MUL_SYM`
pub fn nadd_mul_sym() -> @kernel.Thm {
  nadd_mul_sym_c.get()
}

///|
/// NADD_MUL_ASSOC
fn step_95() -> Unit raise {
  let t797 = @simp.rewrite_tac(@list.List([nadd_mul_v1(), nadd_eq_refl()]))
  let t796 = @simp.once_rewrite_tac(@list.List([nadd_mul()]))
  let t798 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t796),
    t797,
  )
  nadd_mul_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, nadd_eq(nadd_mul(x, nadd_mul(y, z)), nadd_mul(nadd_mul(x, y), z))"),
      t798,
    ),
  )
}

///|
let nadd_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_MUL_ASSOC")

///|
/// `NADD_MUL_ASSOC`
pub fn nadd_mul_assoc() -> @kernel.Thm {
  nadd_mul_assoc_c.get()
}

///|
/// NADD_MUL_LID
fn step_96() -> Unit raise {
  let t799 = @simp.rewrite_tac(
    @list.List([nadd_abs(), nadd_eq_refl(), @class.eta_ax()]),
  )
  let t800 = @tactics.then_tac(
    @simp.rewrite_tac(
      @list.List([nadd_of_num_v1(), nadd_mul(), @arith.mult_clauses()]),
    ),
    t799,
  )
  nadd_mul_lid_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Nadd, nadd_eq(nadd_mul(nadd_of_num(1), x), x)"), t800),
  )
}

///|
let nadd_mul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_MUL_LID")

///|
/// `NADD_MUL_LID`
pub fn nadd_mul_lid() -> @kernel.Thm {
  nadd_mul_lid_c.get()
}

///|
/// NADD_LDISTRIB
fn step_97() -> Unit raise {
  let t806 = @simp.asm_rewrite_tac(@list.List([]))
  let t805 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num)"))
  let t803 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_additive())
  let t804 = @tactics.x_choose_tac(@term_syntax.parse_term("(B : Num)"), t803)
  let t802 = @simp.rewrite_tac(@list.List([nadd_add_v1(), nadd_mul_v1()]))
  let t801 = @simp.rewrite_tac(@list.List([nadd_eq()]))
  let t807 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t801),
          t802,
        ),
        t804,
      ),
      t805,
    ),
    t806,
  )
  nadd_ldistrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, nadd_eq(nadd_mul(x, nadd_add(y, z)), nadd_add(nadd_mul(x, y), nadd_mul(x, z)))"),
      t807,
    ),
  )
}

///|
let nadd_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LDISTRIB")

///|
/// `NADD_LDISTRIB`
pub fn nadd_ldistrib() -> @kernel.Thm {
  nadd_ldistrib_c.get()
}

///|
/// NADD_MUL_WELLDEF_LEMMA
fn step_98() -> Unit raise {
  let t818 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t817 = @tactics.exists_tac(
    @term_syntax.parse_term("(B2 : Num) * dist((dest_nadd((y : Nadd), (n : Num)), dest_nadd((y' : Nadd), n)))"),
  )
  let t816 = @tactics.match_mp_tac(@arith.le_trans())
  let t815 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t814 = @tactics.exists_tac(@term_syntax.parse_term("(B2 : Num) * (B1 : Num)"))
  let t812 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_dist())
  let t813 = @tactics.x_choose_tac(@term_syntax.parse_term("(B2 : Num)"), t812)
  let t809 = @term_syntax.parse_term("(B1 : Num)")
  let t811 = @tactics.disch_then((x810 : @kernel.Thm) => {
    @tactics.x_choose_tac(t809, x810)
  })
  let t808 = @simp.rewrite_tac(@list.List([nadd_eq(), nadd_mul_v1()]))
  let t819 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t808),
                t811,
              ),
              t813,
            ),
            t814,
          ),
          t815,
        ),
        t816,
      ),
      t817,
    ),
    t818,
  )
  nadd_mul_welldef_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ y' : Nadd, nadd_eq(y, y') → nadd_eq(nadd_mul(x, y), nadd_mul(x, y'))"),
      t819,
    ),
  )
}

///|
let nadd_mul_welldef_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_WELLDEF_LEMMA",
)

///|
/// `NADD_MUL_WELLDEF_LEMMA`
pub fn nadd_mul_welldef_lemma() -> @kernel.Thm {
  nadd_mul_welldef_lemma_c.get()
}

///|
/// NADD_MUL_WELLDEF
fn step_99() -> Unit raise {
  let t829 = @simp.asm_rewrite_tac(@list.List([]))
  let t828 = @tactics.match_mp_tac(nadd_mul_welldef_lemma())
  let t826 = @simp.rewrite_tac(@list.List([nadd_mul_sym()]))
  let t825 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul((y : Nadd), (x : Nadd))"))
  let t824 = @tactics.match_mp_tac(nadd_eq_trans())
  let t823 = @simp.rewrite_tac(@list.List([nadd_mul_sym()]))
  let t822 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul((y : Nadd), (x' : Nadd))"))
  let t827 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.match_mp_tac(nadd_eq_trans()), t822),
            t823,
          ),
          t824,
        ),
        t825,
      ),
      t826,
    ),
    @tactics.all_tac,
  ])
  let t821 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul((x' : Nadd), (y : Nadd))"))
  let t820 = @tactics.match_mp_tac(nadd_eq_trans())
  let t830 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.strip_tac,
              ),
              t820,
            ),
            t821,
          ),
          @tactics.conj_tac,
        ),
        t827,
      ),
      t828,
    ),
    t829,
  )
  nadd_mul_welldef_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ x' : Nadd, ∀ y : Nadd, ∀ y' : Nadd, nadd_eq(x, x') && nadd_eq(y, y') → nadd_eq(nadd_mul(x, y), nadd_mul(x', y'))"),
      t830,
    ),
  )
}

///|
let nadd_mul_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_WELLDEF",
)

///|
/// `NADD_MUL_WELLDEF`
pub fn nadd_mul_welldef() -> @kernel.Thm {
  nadd_mul_welldef_c.get()
}

///|
/// NADD_OF_NUM_MUL
fn step_100() -> Unit raise {
  let t831 = @simp.rewrite_tac(
    @list.List([@arith.mult_assoc(), dist_refl(), @arith.le_0()]),
  )
  let t832 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([nadd_eq(), nadd_of_num_v1(), nadd_mul_v1()])),
    t831,
  )
  nadd_of_num_mul_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, nadd_eq(nadd_mul(nadd_of_num(m), nadd_of_num(n)), nadd_of_num(m * n))"), t832),
  )
}

///|
let nadd_of_num_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_OF_NUM_MUL",
)

///|
/// `NADD_OF_NUM_MUL`
pub fn nadd_of_num_mul() -> @kernel.Thm {
  nadd_of_num_mul_c.get()
}

///|
/// NADD_LE_0
fn step_101() -> Unit raise {
  let t833 = @tactics.then_tac(
    @tactics.gen_tac,
    @simp.rewrite_tac(
      @list.List([
        nadd_le(),
        nadd_of_num_v1(),
        @arith.mult_clauses(),
        @arith.le_0(),
      ]),
    ),
  )
  nadd_le_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Nadd, nadd_le(nadd_of_num(0), x)"), t833))
}

///|
let nadd_le_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LE_0")

///|
/// `NADD_LE_0`
pub fn nadd_le_0() -> @kernel.Thm {
  nadd_le_0_c.get()
}

///|
/// NADD_EQ_IMP_LE
fn step_102() -> Unit raise {
  let t839 = @simp.asm_rewrite_tac(@list.List([]))
  let t838 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num)"))
  let t835 = @term_syntax.parse_term("(B : Num)")
  let t837 = @tactics.disch_then((x836 : @kernel.Thm) => {
    @tactics.x_choose_tac(t835, x836)
  })
  let t834 = @simp.rewrite_tac(
    @list.List([nadd_eq(), nadd_le(), dist_le_cases()]),
  )
  let t840 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t834),
        t837,
      ),
      t838,
    ),
    t839,
  )
  nadd_eq_imp_le_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, nadd_eq(x, y) → nadd_le(x, y)"), t840),
  )
}

///|
let nadd_eq_imp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_EQ_IMP_LE")

///|
/// `NADD_EQ_IMP_LE`
pub fn nadd_eq_imp_le() -> @kernel.Thm {
  nadd_eq_imp_le_c.get()
}

///|
/// NADD_LE_LMUL
fn step_103() -> Unit raise {
  let t855 = @simp.asm_rewrite_tac(@list.List([nadd_eq_refl()]))
  let t854 = @tactics.match_mp_tac(nadd_mul_welldef())
  let t853 = @simp.rewrite_tac(@list.List([nadd_ldistrib()]))
  let t852 = @simp.once_rewrite_tac(@list.List([nadd_eq_sym()]))
  let t851 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul((x : Nadd), nadd_add((y : Nadd), (d : Nadd)))"))
  let t850 = @tactics.match_mp_tac(nadd_eq_trans())
  let t849 = @tactics.match_mp_tac(nadd_eq_imp_le())
  let t848 = @simp.rewrite_tac(@list.List([nadd_le_add()]))
  let t847 = @tactics.exists_tac(@term_syntax.parse_term("nadd_add(nadd_mul((x : Nadd), (y : Nadd)), nadd_mul(x, (d : Nadd)))"))
  let t846 = @tactics.match_mp_tac(nadd_le_trans())
  let t843 = @drule.match_mp(nadd_le_exists())
  let t841 = @term_syntax.parse_term("(d : Nadd)")
  let t845 = @tactics.disch_then(fn(
    x844 : @kernel.Thm,
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
    ((x842 : @kernel.Thm) => @tactics.x_choose_tac(t841, x842))(t843(x844))
  })
  let t856 = @tactics.then_tac(
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
                        @tactics.repeat_tac(@tactics.gen_tac),
                        t845,
                      ),
                      t846,
                    ),
                    t847,
                  ),
                  t848,
                ),
                t849,
              ),
              t850,
            ),
            t851,
          ),
          t852,
        ),
        t853,
      ),
      t854,
    ),
    t855,
  )
  nadd_le_lmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, nadd_le(y, z) → nadd_le(nadd_mul(x, y), nadd_mul(x, z))"),
      t856,
    ),
  )
}

///|
let nadd_le_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LE_LMUL")

///|
/// `NADD_LE_LMUL`
pub fn nadd_le_lmul() -> @kernel.Thm {
  nadd_le_lmul_c.get()
}

///|
/// NADD_LE_RMUL
fn step_104() -> Unit raise {
  let t857 = @meson.meson_tac(
    @list.List([nadd_le_lmul(), nadd_le_welldef(), nadd_mul_sym()]),
  )
  nadd_le_rmul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, nadd_le(x, y) → nadd_le(nadd_mul(x, z), nadd_mul(y, z))"),
      t857,
    ),
  )
}

///|
let nadd_le_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LE_RMUL")

///|
/// `NADD_LE_RMUL`
pub fn nadd_le_rmul() -> @kernel.Thm {
  nadd_le_rmul_c.get()
}

///|
/// NADD_LE_RADD
fn step_105() -> Unit raise {
  let t885 = @simp.gen_rewrite_tac(
    fn(
      x884 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x880 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x873 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s874 = @equal.land_conv(x873)
          fn(x875 : @kernel.Term) -> @kernel.Thm raise { s874(x875) }
        })(
          ((x879 : (@kernel.Term) -> @kernel.Thm raise) => {
            @lib.funpow(
              2,
              fn(
                x876 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s877 = @equal.binder_conv(x876)
                fn(x878 : @kernel.Term) -> @kernel.Thm raise { s877(x878) }
              },
              x879,
            )
          })(x880),
        )
      })(
        (fn(
          x881 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s882 = @equal.rand_conv(x881)
          fn(x883 : @kernel.Term) -> @kernel.Thm raise { s882(x883) }
        })(x884),
      )
    },
    @list.List([@arith.add_sym()]),
  )
  let t872 = @simp.rewrite_tac(
    @list.List([@arith.add_assoc(), @arith.le_add_rcancel()]),
  )
  let t871 = @simp.gen_rewrite_tac(
    fn(
      x870 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x866 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x859 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s860 = @equal.land_conv(x859)
          fn(x861 : @kernel.Term) -> @kernel.Thm raise { s860(x861) }
        })(
          ((x865 : (@kernel.Term) -> @kernel.Thm raise) => {
            @lib.funpow(
              2,
              fn(
                x862 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s863 = @equal.binder_conv(x862)
                fn(x864 : @kernel.Term) -> @kernel.Thm raise { s863(x864) }
              },
              x865,
            )
          })(x866),
        )
      })(
        (fn(
          x867 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s868 = @equal.rand_conv(x867)
          fn(x869 : @kernel.Term) -> @kernel.Thm raise { s868(x869) }
        })(x870),
      )
    },
    @list.List([@arith.add_sym()]),
  )
  let t858 = @simp.rewrite_tac(@list.List([nadd_le(), nadd_add_v1()]))
  let t886 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t858),
          t871,
        ),
        t872,
      ),
      t885,
    ),
    @tactics.refl_tac,
  )
  nadd_le_radd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, nadd_le(nadd_add(x, z), nadd_add(y, z)) == nadd_le(x, y)"),
      t886,
    ),
  )
}

///|
let nadd_le_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LE_RADD")

///|
/// `NADD_LE_RADD`
pub fn nadd_le_radd() -> @kernel.Thm {
  nadd_le_radd_c.get()
}

///|
/// NADD_LE_LADD
fn step_106() -> Unit raise {
  let t887 = @meson.meson_tac(
    @list.List([nadd_le_radd(), nadd_add_sym(), nadd_le_welldef()]),
  )
  nadd_le_ladd_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, nadd_le(nadd_add(x, y), nadd_add(x, z)) == nadd_le(y, z)"),
      t887,
    ),
  )
}

///|
let nadd_le_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LE_LADD")

///|
/// `NADD_LE_LADD`
pub fn nadd_le_ladd() -> @kernel.Thm {
  nadd_le_ladd_c.get()
}

///|
/// NADD_RDISTRIB
fn step_107() -> Unit raise {
  let t888 = @meson.meson_tac(
    @list.List([
      nadd_ldistrib(),
      nadd_mul_sym(),
      nadd_add_welldef(),
      nadd_eq_trans(),
      nadd_eq_refl(),
      nadd_eq_sym(),
    ]),
  )
  nadd_rdistrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, nadd_eq(nadd_mul(nadd_add(x, y), z), nadd_add(nadd_mul(x, z), nadd_mul(y, z)))"),
      t888,
    ),
  )
}

///|
let nadd_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_RDISTRIB")

///|
/// `NADD_RDISTRIB`
pub fn nadd_rdistrib() -> @kernel.Thm {
  nadd_rdistrib_c.get()
}

///|
/// NADD_ARCH_MULT
fn step_108() -> Unit raise {
  let t930 = @tactics.first_assum(fn(
    x927 : @kernel.Thm,
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
    let s928 = @tactics.accept_tac(x927)
    fn(
      x929 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s928(x929)
    }
  })
  let t926 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t925 = @tactics.match_mp_tac(@arith.lt_imp_le())
  let t924 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t923 = @simp.gen_rewrite_tac(
    fn(
      x920 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s921 = @equal.rand_conv(x920)
      fn(x922 : @kernel.Term) -> @kernel.Thm raise { s921(x922) }
    },
    @list.List([@arith.mult_sym()]),
  )
  let t919 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.right_add_distrib())]),
  )
  let t918 = @simp.asm_rewrite_tac(@list.List([]))
  let t917 = @tactics.rule_assum_tac(
    @simp.rewrite_rule(@list.List([dist_le_cases()])),
  )
  let t916 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) * dest_nadd((x : Nadd), (N : Num))"))
  let t915 = @tactics.match_mp_tac(@arith.le_trans())
  let t913 = @equal.gsym(@arith.left_add_distrib())
  let t914 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.add_assoc()), t913]),
  )
  let t912 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num) * (i : Num)"))
  let t911 = @tactics.match_mp_tac(
    @bool.gen_all(@bool.eq_imp_rule(@bool.spec_all(@arith.le_add_rcancel())).0),
  )
  let t910 = @simp.rewrite_tac(@list.List([nadd_mul_v1(), nadd_of_num_v1()]))
  let t909 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t907 = @term_syntax.parse_term("(B : Num) * (N : Num)")
  let t908 = @tactics.map_every(
    fn(
      x904 : @kernel.Term,
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
      let s905 = @tactics.exists_tac(x904)
      fn(
        x906 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s905(x906)
      }
    },
    @list.List([@term_syntax.parse_term("(N : Num)"), t907]),
  )
  let t901 = @term_syntax.parse_term("(N : Num)")
  let t903 = @tactics.disch_then((x902 : @kernel.Thm) => {
    @tactics.x_choose_tac(t901, x902)
  })
  let t900 = @simp.rewrite_tac(
    @list.List([@arith.mult_clauses(), dist_rzero(), @arith.not_le()]),
  )
  let t899 = @simp.rewrite_tac(
    @list.List([@class.not_forall_thm(), nadd_of_num_v1()]),
  )
  let t895 = @term_syntax.parse_term("(B : Num) + (k : Num)")
  let t898 = @tactics.disch_then(fn(
    x897 : @kernel.Thm,
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
      x892 : @kernel.Thm,
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
      let s893 = @tactics.mp_tac(x892)
      fn(
        x894 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s893(x894)
      }
    })(((x896 : @kernel.Thm) => @bool.spec(t895, x896))(x897))
  })
  let t890 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_cauchy())
  let t891 = @tactics.x_choose_tac(@term_syntax.parse_term("(B : Num)"), t890)
  let t889 = @simp.rewrite_tac(
    @list.List([nadd_eq(), nadd_le(), @class.not_exists_thm()]),
  )
  let t931 = @tactics.then_tac(
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
                                                @tactics.repeat_tac(
                                                  @tactics.gen_tac,
                                                ),
                                                t889,
                                              ),
                                              t891,
                                            ),
                                            t898,
                                          ),
                                          t899,
                                        ),
                                        t900,
                                      ),
                                      t903,
                                    ),
                                    t908,
                                  ),
                                  t909,
                                ),
                                t910,
                              ),
                              t911,
                            ),
                            t912,
                          ),
                          t914,
                        ),
                        t915,
                      ),
                      t916,
                    ),
                    t917,
                  ),
                  t918,
                ),
                t919,
              ),
              t923,
            ),
            t924,
          ),
          @tactics.disj1_tac,
        ),
        t925,
      ),
      t926,
    ),
    t930,
  )
  nadd_arch_mult_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ k : Num, !nadd_eq(x, nadd_of_num(0)) → (∃ N : Num, nadd_le(nadd_of_num(k), nadd_mul(nadd_of_num(N), x)))"),
      t931,
    ),
  )
}

///|
let nadd_arch_mult_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_ARCH_MULT")

///|
/// `NADD_ARCH_MULT`
pub fn nadd_arch_mult() -> @kernel.Thm {
  nadd_arch_mult_c.get()
}

///|
/// NADD_ARCH_ZERO
fn step_109() -> Unit raise {
  let t967 = @meson.asm_meson_tac(
    @list.List([
      nadd_le_trans(),
      nadd_le_welldef(),
      nadd_eq_refl(),
      nadd_add_lid(),
    ]),
  )
  let t965 = @meson.asm_meson_tac(
    @list.List([nadd_le_welldef(), nadd_eq_refl()]),
  )
  let t963 = @meson.meson_tac(
    @list.List([nadd_add_welldef(), nadd_eq_refl(), nadd_mul_lid()]),
  )
  let t961 = @meson.meson_tac(
    @list.List([nadd_rdistrib(), nadd_mul_sym(), nadd_eq_sym(), nadd_eq_trans()]),
  )
  let t962 = @list.List([
    @meson.meson_tac(
      @list.List([
        nadd_of_num_add(),
        nadd_mul_welldef(),
        nadd_eq_refl(),
        nadd_eq_sym(),
      ]),
    ),
    t961,
  ])
  let t960 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul(nadd_add(nadd_of_num(1), nadd_of_num((N : Num))), (x : Nadd))"))
  let t964 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(nadd_eq_trans()), t960),
        @tactics.conj_tac,
      ),
      t962,
    ),
    t963,
  ])
  let t959 = @tactics.exists_tac(@term_syntax.parse_term("nadd_add(nadd_mul(nadd_of_num(1), (x : Nadd)), nadd_mul(nadd_of_num((N : Num)), x))"))
  let t958 = @tactics.match_mp_tac(nadd_eq_trans())
  let t966 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.once_rewrite_tac(@list.List([@arith.add_sym()])),
            t958,
          ),
          t959,
        ),
        @tactics.conj_tac,
      ),
      t964,
    ),
    t965,
  ])
  let t968 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(
        @term_syntax.parse_term("nadd_eq(nadd_mul(nadd_of_num((N : Num) + 1), (x : Nadd)), nadd_add(x, nadd_mul(nadd_of_num(N), x)))"),
        fn(
          x955 : @kernel.Thm,
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
          let s956 = @tactics.mp_tac(x955)
          fn(
            x957 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s956(x957)
          }
        },
      ),
      t966,
    ),
    t967,
  ])
  let t954 = @tactics.exists_tac(@term_syntax.parse_term("(k : Nadd)"))
  let t953 = @tactics.match_mp_tac(nadd_le_trans())
  let t952 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul(nadd_of_num((N : Num)), (x : Nadd))"))
  let t951 = @tactics.match_mp_tac(
    @bool.gen_all(@bool.eq_imp_rule(@bool.spec_all(nadd_le_radd())).0),
  )
  let t950 = @simp.rewrite_tac(
    @list.List([@equal.gsym(nadd_le_antisym()), nadd_le_0()]),
  )
  let t949 = @tactics.undisch_tac(@term_syntax.parse_term("!nadd_eq((x : Nadd), nadd_of_num(0))"))
  let t948 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num) + 1"))
  let t944 = @term_syntax.parse_term("(p : Num)")
  let t942 = @term_syntax.parse_term("(N : Num)")
  let t947 = @tactics.disch_then(fn(
    x946 : @kernel.Thm,
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
    ((x943 : @kernel.Thm) => @tactics.x_choose_tac(t942, x943))(
      ((x945 : @kernel.Thm) => @bool.spec(t944, x945))(x946),
    )
  })
  let t939 = @drule.match_mp(nadd_arch_mult())
  let t941 = @tactics.first_assum(fn(
    x940 : @kernel.Thm,
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
      x936 : @kernel.Thm,
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
      let s937 = @tactics.mp_tac(x936)
      fn(
        x938 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s937(x938)
      }
    })(t939(x940))
  })
  let t934 = @bool.spec(@term_syntax.parse_term("(k : Nadd)"), nadd_arch())
  let t935 = @tactics.x_choose_tac(@term_syntax.parse_term("(p : Num)"), t934)
  let t933 = @simp.rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t932 = @tactics.conv_tac(@class.contrapos_conv)
  let t969 = @tactics.thenl(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.repeat_tac(@tactics.gen_tac),
                                  t932,
                                ),
                                @tactics.disch_tac,
                              ),
                              t933,
                            ),
                            t935,
                          ),
                          t941,
                        ),
                        t947,
                      ),
                      t948,
                    ),
                    @tactics.disch_tac,
                  ),
                  t949,
                ),
                t950,
              ),
              t951,
            ),
            t952,
          ),
          t953,
        ),
        t954,
      ),
      @tactics.conj_tac,
    ),
    t968,
  )
  nadd_arch_zero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ k : Nadd, (∀ n : Num, nadd_le(nadd_mul(nadd_of_num(n), x), k)) → nadd_eq(x, nadd_of_num(0))"),
      t969,
    ),
  )
}

///|
let nadd_arch_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_ARCH_ZERO")

///|
/// `NADD_ARCH_ZERO`
pub fn nadd_arch_zero() -> @kernel.Thm {
  nadd_arch_zero_c.get()
}

///|
/// NADD_ARCH_LEMMA
fn step_110() -> Unit raise {
  let t988 = @meson.asm_meson_tac(
    @list.List([
      nadd_add_lid(),
      nadd_add_welldef(),
      nadd_eq_trans(),
      nadd_add_sym(),
    ]),
  )
  let t987 = @meson.asm_meson_tac(
    @list.List([
      nadd_mul_welldef(),
      nadd_le_welldef(),
      nadd_ldistrib(),
      nadd_le_ladd(),
      nadd_eq_refl(),
    ]),
  )
  let t986 = @tactics.exists_tac(@term_syntax.parse_term("(z : Nadd)"))
  let t985 = @tactics.match_mp_tac(nadd_arch_zero())
  let t984 = @simp.rewrite_tac(@list.List([nadd_eq_refl()]))
  let t989 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(nadd_add_welldef()), t984),
          t985,
        ),
        t986,
      ),
      t987,
    ),
    t988,
  ])
  let t983 = @tactics.exists_tac(@term_syntax.parse_term("nadd_add((y : Nadd), nadd_of_num(0))"))
  let t982 = @tactics.match_mp_tac(nadd_eq_trans())
  let t981 = @simp.asm_rewrite_tac(@list.List([]))
  let t980 = @tactics.exists_tac(@term_syntax.parse_term("nadd_add((y : Nadd), (d : Nadd))"))
  let t979 = @tactics.match_mp_tac(nadd_eq_trans())
  let t978 = @tactics.match_mp_tac(nadd_eq_imp_le())
  let t975 = @drule.match_mp(nadd_le_exists())
  let t973 = @term_syntax.parse_term("(d : Nadd)")
  let t977 = @tactics.first_assum(fn(
    x976 : @kernel.Thm,
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
    ((x974 : @kernel.Thm) => @tactics.x_choose_tac(t973, x974))(t975(x976))
  })
  let t972 = @simp.asm_rewrite_tac(@list.List([]))
  let t970 = @term_syntax.parse_term("(y : Nadd)")
  let t971 = @tactics.disj_cases_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("(x : Nadd)"), t970]),
      nadd_le_total(),
    ),
  )
  let t990 = @tactics.thenl(
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
                        @tactics.repeat_tac(@tactics.strip_tac),
                        t971,
                      ),
                      t972,
                    ),
                    t977,
                  ),
                  t978,
                ),
                t979,
              ),
              t980,
            ),
            t981,
          ),
          t982,
        ),
        t983,
      ),
      @tactics.conj_tac,
    ),
    t989,
  )
  nadd_arch_lemma_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, ∀ z : Nadd, (∀ n : Num, nadd_le(nadd_mul(nadd_of_num(n), x), nadd_add(nadd_mul(nadd_of_num(n), y), z))) → nadd_le(x, y)"),
      t990,
    ),
  )
}

///|
let nadd_arch_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_ARCH_LEMMA",
)

///|
/// `NADD_ARCH_LEMMA`
pub fn nadd_arch_lemma() -> @kernel.Thm {
  nadd_arch_lemma_c.get()
}

///|
/// NADD_COMPLETE
fn step_111() -> Unit raise {
  let t1193 = @simp.asm_rewrite_tac(@list.List([]))
  let t1192 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1191 = @tactics.match_mp_tac(nadd_le_lmul())
  let t1190 = @simp.asm_rewrite_tac(@list.List([]))
  let t1189 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul(nadd_of_num((n : Num)), (x : Nadd))"))
  let t1188 = @tactics.match_mp_tac(nadd_le_trans())
  let t1187 = @tactics.disch_then(@tactics.strip_assume_tac)
  let t1182 = @term_syntax.parse_term("(n : Num)")
  let t1184 = @tactics.x_choose_then(@term_syntax.parse_term("(x : Nadd)"))(fn(
    x1179 : @kernel.Thm,
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
    let s1180 = @tactics.mp_tac(x1179)
    fn(
      x1181 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1180(x1181)
    }
  })
  let t1186 = @tactics.first_assum(fn(
    x1185 : @kernel.Thm,
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
    t1184(((x1183 : @kernel.Thm) => @bool.spec(t1182, x1183))(x1185))
  })
  let t1194 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.rewrite_tac(@list.List([nadd_le_radd()])),
                  t1186,
                ),
                t1187,
              ),
              t1188,
            ),
            t1189,
          ),
          t1190,
        ),
        t1191,
      ),
      t1192,
    ),
    t1193,
  )
  let t1178 = @simp.asm_rewrite_tac(@list.List([]))
  let t1177 = @simp.gen_rewrite_tac(
    fn(
      x1176 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1170 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1171 = @equal.rand_conv(x1170)
        fn(x1172 : @kernel.Term) -> @kernel.Thm raise { s1171(x1172) }
      })(
        (fn(
          x1173 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1174 = @equal.land_conv(x1173)
          fn(x1175 : @kernel.Term) -> @kernel.Thm raise { s1174(x1175) }
        })(x1176),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t1169 = @simp.rewrite_tac(
    @list.List([@arith.add_clauses(), @arith.mult_clauses()]),
  )
  let t1168 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t1195 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.asm_rewrite_tac(
                @list.List([
                  nadd_le(),
                  nadd_add_v1(),
                  nadd_mul_v1(),
                  nadd_of_num_v1(),
                ]),
              ),
              t1168,
            ),
            t1169,
          ),
          @tactics.gen_tac,
        ),
        t1177,
      ),
      t1178,
    ),
    t1194,
  ])
  let t1167 = @tactics.exists_tac(@term_syntax.parse_term("nadd_add(nadd_of_num((r : (Num) -> Num)((n : Num))), nadd_of_num(1))"))
  let t1166 = @tactics.match_mp_tac(nadd_le_trans())
  let t1165 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1164 = @tactics.exists_tac(@term_syntax.parse_term("nadd_of_num(1)"))
  let t1163 = @tactics.match_mp_tac(nadd_arch_lemma())
  let t1196 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.x_gen_tac(@term_syntax.parse_term("(z : Nadd)")),
                  @tactics.disch_tac,
                ),
                t1163,
              ),
              t1164,
            ),
            t1165,
          ),
          t1166,
        ),
        t1167,
      ),
      @tactics.conj_tac,
    ),
    t1195,
  )
  let t1160 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_add_lcancel(), @arith.add_clauses()]),
  )
  let t1159 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) * (r : (Num) -> Num)((i : Num)) + n"))
  let t1158 = @tactics.match_mp_tac(@arith.le_trans())
  let t1157 = @simp.gen_rewrite_tac(
    fn(
      x1154 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1155 = @equal.land_conv(x1154)
      fn(x1156 : @kernel.Term) -> @kernel.Thm raise { s1155(x1156) }
    },
    @list.List([@arith.mult_sym()]),
  )
  let t1153 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t1151 = @term_syntax.parse_term("(n : Num)")
  let t1152 = @tactics.map_every(
    fn(
      x1148 : @kernel.Term,
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
      let s1149 = @tactics.exists_tac(x1148)
      fn(
        x1150 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1149(x1150)
      }
    },
    @list.List([@term_syntax.parse_term("0"), t1151]),
  )
  let t1147 = @simp.once_rewrite_tac(@list.List([bounds_ignore()]))
  let t1146 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t1145 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add_assoc())]))
  let t1144 = @simp.rewrite_tac(
    @list.List([
      @arith.mult_2(),
      @arith.mult_clauses(),
      @arith.add_assoc(),
      @arith.le_add_rcancel(),
    ]),
  )
  let t1143 = @simp.rewrite_tac(
    @list.List([@arith.add1(), @arith.right_add_distrib()]),
  )
  let t1142 = @simp.once_rewrite_tac(@list.List([@arith.add_sym()]))
  let t1161 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @simp.asm_rewrite_tac(
                              @list.List([
                                nadd_le(),
                                nadd_add_v1(),
                                nadd_mul_v1(),
                                nadd_of_num_v1(),
                              ]),
                            ),
                            t1142,
                          ),
                          t1143,
                        ),
                        t1144,
                      ),
                      t1145,
                    ),
                    t1146,
                  ),
                  t1147,
                ),
                t1152,
              ),
              t1153,
            ),
            @tactics.disch_tac,
          ),
          t1157,
        ),
        t1158,
      ),
      t1159,
    ),
    t1160,
  )
  let t1141 = @simp.asm_rewrite_tac(@list.List([]))
  let t1162 = @list.List([
    @tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t1141),
    t1161,
  ])
  let t1140 = @tactics.exists_tac(@term_syntax.parse_term("nadd_of_num(SUC((r : (Num) -> Num)((n : Num))))"))
  let t1139 = @tactics.match_mp_tac(nadd_le_trans())
  let t1138 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1137 = @tactics.exists_tac(@term_syntax.parse_term("nadd_of_num(2)"))
  let t1136 = @tactics.match_mp_tac(nadd_arch_lemma())
  let t1197 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.x_gen_tac(@term_syntax.parse_term("(x : Nadd)")),
                    @tactics.disch_tac,
                  ),
                  t1136,
                ),
                t1137,
              ),
              t1138,
            ),
            t1139,
          ),
          t1140,
        ),
        @tactics.conj_tac,
      ),
      t1162,
    ),
    t1196,
  ])
  let t1134 = @simp.asm_rewrite_tac(
    @list.List([@arith.add_assoc(), @arith.le_add()]),
  )
  let t1133 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) * (r : (Num) -> Num)((i : Num)) + n"))
  let t1132 = @tactics.match_mp_tac(@arith.le_trans())
  let t1130 = @term_syntax.parse_term("(n : Num)")
  let t1131 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(i : Num)"), t1130]),
  )
  let t1129 = @simp.rewrite_tac(@list.List([]))
  let t1128 = @simp.gen_rewrite_tac(
    fn(
      x1127 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1122 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1115 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1116 = @equal.land_conv(x1115)
          fn(x1117 : @kernel.Term) -> @kernel.Thm raise { s1116(x1117) }
        })(
          ((x1121 : (@kernel.Term) -> @kernel.Thm raise) => {
            @lib.funpow(
              2,
              fn(
                x1118 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s1119 = @equal.binder_conv(x1118)
                fn(x1120 : @kernel.Term) -> @kernel.Thm raise { s1119(x1120) }
              },
              x1121,
            )
          })(x1122),
        )
      })(
        ((x1126 : (@kernel.Term) -> @kernel.Thm raise) => {
          @lib.funpow(
            2,
            fn(
              x1123 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s1124 = @equal.rand_conv(x1123)
              fn(x1125 : @kernel.Term) -> @kernel.Thm raise { s1124(x1125) }
            },
            x1126,
          )
        })(x1127),
      )
    },
    @list.List([@arith.add_sym()]),
  )
  let t1114 = @simp.gen_rewrite_tac(
    fn(
      x1111 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1112 = @equal.rand_conv(x1111)
      fn(x1113 : @kernel.Term) -> @kernel.Thm raise { s1112(x1113) }
    },
    @list.List([@theorems.swap_forall_thm()]),
  )
  let t1110 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t1109 = @simp.rewrite_tac(@list.List([@arith.mult_clauses()]))
  let t1108 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t1107 = @simp.rewrite_tac(@list.List([is_nadd(), dist_le_cases()]))
  let t1135 = @list.List([
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
                          @simp.rewrite_tac(
                            @list.List([@equal.gsym(nadd_rep())]),
                          ),
                          t1107,
                        ),
                        t1108,
                      ),
                      t1109,
                    ),
                    t1110,
                  ),
                  t1114,
                ),
                t1128,
              ),
              t1129,
            ),
            t1131,
          ),
          t1132,
        ),
        t1133,
      ),
      t1134,
    ),
    @tactics.all_tac,
  ])
  let t1106 = @tactics.subgoal_then(@term_syntax.parse_term("dest_nadd(mk_nadd((r : (Num) -> Num))) == r"), fn(
    x1103 : @kernel.Thm,
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
    let s1104 = @tactics.assume_tac(x1103)
    fn(
      x1105 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1104(x1105)
    }
  })
  let t1102 = @tactics.exists_tac(@term_syntax.parse_term("mk_nadd((r : (Num) -> Num))"))
  let t1096 = @simp.rewrite_tac(@list.List([nadd_of_num_mul()]))
  let t1095 = @tactics.match_mp_tac(nadd_eq_imp_le())
  let t1094 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_suc())]))
  let t1097 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([@arith.add_sym()])),
        t1094,
      ),
      t1095,
    ),
    t1096,
  )
  let t1091 = @simp.asm_rewrite_tac(@list.List([]))
  let t1090 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1092 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(nadd_le_lmul()), t1090),
    t1091,
  )
  let t1089 = @simp.rewrite_tac(@list.List([nadd_mul_sym(), nadd_eq_refl()]))
  let t1088 = @tactics.match_mp_tac(nadd_mul_welldef())
  let t1087 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([nadd_eq_sym()]))(nadd_mul_assoc()),
    ]),
  )
  let t1086 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul(nadd_mul(nadd_of_num((n : Num)), nadd_of_num((i : Num))), (x : Nadd))"))
  let t1085 = @tactics.match_mp_tac(nadd_eq_trans())
  let t1084 = @simp.rewrite_tac(@list.List([nadd_mul_assoc()]))
  let t1083 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul(nadd_mul(nadd_of_num((i : Num)), nadd_of_num((n : Num))), (x : Nadd))"))
  let t1082 = @tactics.match_mp_tac(nadd_eq_trans())
  let t1093 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.match_mp_tac(nadd_eq_imp_le()),
                    t1082,
                  ),
                  t1083,
                ),
                t1084,
              ),
              t1085,
            ),
            t1086,
          ),
          t1087,
        ),
        t1088,
      ),
      t1089,
    ),
    t1092,
  ])
  let t1081 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul(nadd_of_num((n : Num)), nadd_mul(nadd_of_num((i : Num)), (x : Nadd)))"))
  let t1098 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(nadd_le_trans()), t1081),
        @tactics.conj_tac,
      ),
      t1093,
    ),
    t1097,
  ])
  let t1080 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul(nadd_of_num((n : Num)), nadd_of_num(SUC((r : (Num) -> Num)((i : Num)))))"))
  let t1099 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(nadd_le_trans()), t1080),
      @tactics.conj_tac,
    ),
    t1098,
  )
  let t1077 = @simp.asm_rewrite_tac(@list.List([]))
  let t1078 = @tactics.then_tac(@tactics.match_mp_tac(nadd_le_lmul()), t1077)
  let t1076 = @tactics.match_accept_tac(nadd_of_num_mul())
  let t1075 = @simp.once_rewrite_tac(@list.List([nadd_eq_sym()]))
  let t1079 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(nadd_eq_imp_le()), t1075),
      t1076,
    ),
    t1078,
  ])
  let t1074 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul(nadd_of_num((i : Num)), nadd_of_num((r : (Num) -> Num)((n : Num))))"))
  let t1100 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(nadd_le_trans()), t1074),
        @tactics.conj_tac,
      ),
      t1079,
    ),
    t1099,
  ])
  let t1073 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul(nadd_of_num((i : Num)), nadd_mul(nadd_of_num((n : Num)), (x : Nadd)))"))
  let t1072 = @tactics.match_mp_tac(nadd_le_trans())
  let t1071 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(nadd_of_num_le())]),
  )
  let t1066 = @term_syntax.parse_term("(n : Num)")
  let t1068 = @tactics.x_choose_then(@term_syntax.parse_term("(x : Nadd)"))(
    @tactics.strip_assume_tac,
  )
  let t1070 = @tactics.first_assum(fn(
    x1069 : @kernel.Thm,
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
    t1068(((x1067 : @kernel.Thm) => @bool.spec(t1066, x1067))(x1069))
  })
  let t1101 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1070),
              t1071,
            ),
            t1072,
          ),
          t1073,
        ),
        @tactics.conj_tac,
      ),
      t1100,
    ),
    @tactics.all_tac,
  ])
  let t1065 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, ∀ i : Num, i * (r : (Num) -> Num)(n) <= n * r(i) + n"),
    fn(
      x1062 : @kernel.Thm,
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
      let s1063 = @tactics.assume_tac(x1062)
      fn(
        x1064 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1063(x1064)
      }
    },
  )
  let t1054 = @term_syntax.parse_term("nadd_of_num(SUC((r : (Num) -> Num)((n : Num))))")
  let t1055 = @bool.specl(
    @list.List([@term_syntax.parse_term("nadd_mul(nadd_of_num((n : Num)), (x : Nadd))"), t1054]),
    nadd_le_total(),
  )
  let t1052 = @drule.match_mp(
    @itab.itaut(@term_syntax.parse_term("((a : Bool) || (b : Bool)) && !((c : Bool) && b) → c → a")),
  )
  let t1048 = @term_syntax.parse_term("(x : Nadd)")
  let t1049 = @list.List([@term_syntax.parse_term("(n : Num)"), t1048])
  let t1059 = @tactics.disch_then(fn(
    x1058 : @kernel.Thm,
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
      x1057 : @kernel.Thm,
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
        x1053 : @kernel.Thm,
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
          x1051 : @kernel.Thm,
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
            x1045 : @kernel.Thm,
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
            let s1046 = @tactics.assume_tac(x1045)
            fn(
              x1047 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s1046(x1047)
            }
          })(((x1050 : @kernel.Thm) => @bool.genl(t1049, x1050))(x1051))
        })(t1052(x1053))
      })(((x1056 : @kernel.Thm) => @bool.conj(t1055, x1056))(x1057))
    })(@bool.spec_all(x1058))
  })
  let t1044 = @simp.rewrite_tac(
    @list.List([@arith.le_suc_lt(), @arith.lt_refl(), @class.not_exists_thm()]),
  )
  let t1039 = @term_syntax.parse_term("SUC((r : (Num) -> Num)((n : Num)))")
  let t1040 = @list.List([@term_syntax.parse_term("(n : Num)"), t1039])
  let t1036 = @term_syntax.parse_term("(n : Num)")
  let t1043 = @tactics.disch_then(fn(
    x1042 : @kernel.Thm,
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
      x1038 : @kernel.Thm,
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
        x1033 : @kernel.Thm,
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
        let s1034 = @tactics.mp_tac(x1033)
        fn(
          x1035 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1034(x1035)
        }
      })(((x1037 : @kernel.Thm) => @bool.gen(t1036, x1037))(x1038))
    })(((x1041 : @kernel.Thm) => @bool.specl(t1040, x1041))(x1042))
  })
  let t1032 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(r : (Num) -> Num)"))(fn(
      x1024 : @kernel.Thm,
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
      let th = x1024
      let (th1, th2) = @bool.conj_pair(
        @bool.spec(@term_syntax.parse_term("(n : Num)"), th),
      )
      let t1029 = @term_syntax.parse_term("(n : Num)")
      @tactics.map_every(
        fn(
          x1031 : @kernel.Thm,
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
            x1026 : @kernel.Thm,
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
            let s1027 = @tactics.mp_tac(x1026)
            fn(
              x1028 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
              s1027(x1028)
            }
          })(((x1030 : @kernel.Thm) => @bool.gen(t1029, x1030))(x1031))
        },
        @list.List([th1, th2]),
      )
    }),
  )
  let t1060 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @simp.once_rewrite_tac(@list.List([@class.skolem_thm()])),
            t1032,
          ),
          t1043,
        ),
        t1044,
      ),
      t1059,
    ),
    @tactics.disch_tac,
  )
  let t1019 = @tactics.match_accept_tac(nadd_of_num_mul())
  let t1020 = @tactics.then_tac(@tactics.match_mp_tac(nadd_eq_imp_le()), t1019)
  let t1018 = @simp.asm_rewrite_tac(@list.List([]))
  let t1017 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1016 = @simp.asm_rewrite_tac(@list.List([]))
  let t1015 = @tactics.exists_tac(@term_syntax.parse_term("(m : Nadd)"))
  let t1014 = @tactics.match_mp_tac(nadd_le_trans())
  let t1021 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(@tactics.match_mp_tac(nadd_le_lmul()), t1014),
            t1015,
          ),
          t1016,
        ),
        t1017,
      ),
      t1018,
    ),
    t1020,
  ])
  let t1013 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul(nadd_of_num((n : Num)), nadd_of_num((N : Num)))"))
  let t1012 = @tactics.match_mp_tac(nadd_le_trans())
  let t1011 = @simp.asm_rewrite_tac(@list.List([]))
  let t1010 = @tactics.exists_tac(@term_syntax.parse_term("nadd_mul(nadd_of_num((n : Num)), (w : Nadd))"))
  let t1009 = @tactics.match_mp_tac(nadd_le_trans())
  let t1008 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(nadd_of_num_le())]),
  )
  let t1007 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(w : Nadd)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t1006 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t1005 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) * (N : Num)"))
  let t1004 = @bool.spec(@term_syntax.parse_term("(m : Nadd)"), nadd_arch())
  let t1022 = @tactics.thenl(
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
                        @tactics.x_choose_tac(
                          @term_syntax.parse_term("(N : Num)"),
                          t1004,
                        ),
                        t1005,
                      ),
                      t1006,
                    ),
                    t1007,
                  ),
                  t1008,
                ),
                t1009,
              ),
              t1010,
            ),
            t1011,
          ),
          t1012,
        ),
        t1013,
      ),
      @tactics.conj_tac,
    ),
    t1021,
  )
  let t1003 = @simp.asm_rewrite_tac(@list.List([nadd_le_0()]))
  let t1002 = @term_syntax.parse_term("(a : Nadd)")
  let t1023 = @list.List([
    @tactics.then_tac(
      @tactics.map_every(
        fn(
          x999 : @kernel.Term,
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
          let s1000 = @tactics.exists_tac(x999)
          fn(
            x1001 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1000(x1001)
          }
        },
        @list.List([@term_syntax.parse_term("0"), t1002]),
      ),
      t1003,
    ),
    t1022,
  ])
  let t1061 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @simp.rewrite_tac(@list.List([@equal.gsym(@arith.num_max())])),
        ),
        @tactics.conj_tac,
      ),
      t1023,
    ),
    t1060,
  ])
  let t998 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ n : Num, ∃ r : Num, (∃ x : Nadd, (P : (Nadd) -> Bool)(x) && nadd_le(nadd_of_num(r), nadd_mul(nadd_of_num(n), x))) && (∀ r' : Num, (∃ x : Nadd, P(x) && nadd_le(nadd_of_num(r'), nadd_mul(nadd_of_num(n), x))) → r' <= r)"),
    fn(
      x995 : @kernel.Thm,
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
      let s996 = @tactics.mp_tac(x995)
      fn(
        x997 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s996(x997)
      }
    },
  )
  let t993 = @term_syntax.parse_term("(m : Nadd)")
  let t991 = @term_syntax.parse_term("(a : Nadd)")
  let t1198 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(
                @tactics.thenl(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.gen_tac,
                      @tactics.disch_then(
                        @tactics.conjuncts_then2(
                          (x992 : @kernel.Thm) => {
                            @tactics.x_choose_tac(t991, x992)
                          },
                          (x994 : @kernel.Thm) => {
                            @tactics.x_choose_tac(t993, x994)
                          },
                        ),
                      ),
                    ),
                    t998,
                  ),
                  t1061,
                ),
                t1065,
              ),
              t1101,
            ),
            t1102,
          ),
          t1106,
        ),
        t1135,
      ),
      @tactics.conj_tac,
    ),
    t1197,
  )
  nadd_complete_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Nadd) -> Bool, (∃ x : Nadd, P(x)) && (∃ M : Nadd, ∀ x : Nadd, P(x) → nadd_le(x, M)) → (∃ M : Nadd, (∀ x : Nadd, P(x) → nadd_le(x, M)) && (∀ M' : Nadd, (∀ x : Nadd, P(x) → nadd_le(x, M')) → nadd_le(M, M')))"),
      t1198,
    ),
  )
}

///|
let nadd_complete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_COMPLETE")

///|
/// `NADD_COMPLETE`
pub fn nadd_complete() -> @kernel.Thm {
  nadd_complete_c.get()
}

///|
/// NADD_UBOUND
fn step_112() -> Unit raise {
  let t1213 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t1212 = @simp.gen_rewrite_tac(
    fn(
      x1209 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1210 = @equal.land_conv(x1209)
      fn(x1211 : @kernel.Term) -> @kernel.Thm raise { s1210(x1211) }
    },
    @list.List([
      @equal.gsym(@lib.el(3, @bool.conjuncts_rule(@arith.mult_clauses()))),
    ]),
  )
  let t1208 = @simp.rewrite_tac(
    @list.List([@arith.right_add_distrib(), @arith.le_add_lcancel()]),
  )
  let t1207 = @simp.asm_rewrite_tac(@list.List([]))
  let t1206 = @tactics.exists_tac(@term_syntax.parse_term("(A1 : Num) * (n : Num) + (A2 : Num)"))
  let t1205 = @tactics.match_mp_tac(@arith.le_trans())
  let t1204 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1203 = @tactics.exists_tac(@term_syntax.parse_term("1"))
  let t1202 = @tactics.exists_tac(@term_syntax.parse_term("(A1 : Num) + (A2 : Num)"))
  let t1201 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_bound())
  let t1199 = @term_syntax.parse_term("(A2 : Num)")
  let t1214 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.gen_tac,
                      @tactics.x_choose_then(@term_syntax.parse_term("(A1 : Num)"))((
                        x1200 : @kernel.Thm,
                      ) => @tactics.x_choose_tac(t1199, x1200))(t1201),
                    ),
                    t1202,
                  ),
                  t1203,
                ),
                t1204,
              ),
              t1205,
            ),
            t1206,
          ),
          t1207,
        ),
        t1208,
      ),
      t1212,
    ),
    t1213,
  )
  nadd_ubound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∃ B : Num, ∃ N : Num, ∀ n : Num, N <= n → dest_nadd(x, n) <= B * n"),
      t1214,
    ),
  )
}

///|
let nadd_ubound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_UBOUND")

///|
/// `NADD_UBOUND`
pub fn nadd_ubound() -> @kernel.Thm {
  nadd_ubound_c.get()
}

///|
/// NADD_NONZERO
fn step_113() -> Unit raise {
  let t1245 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), @arith.add_clauses()]),
  )
  let t1244 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t1243 = @simp.rewrite_tac(
    @list.List([
      @class.not_forall_thm(),
      @arith.not_le(),
      @equal.gsym(@arith.le_suc_lt()),
      @arith.add1(),
    ]),
  )
  let t1242 = @tactics.first_assum(fn(
    x1241 : @kernel.Thm,
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
      x1239 : @kernel.Term,
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
        x1234 : @kernel.Term,
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
        let s1235 = @tactics.undisch_tac(x1234)
        fn(
          x1236 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1235(x1236)
        }
      })(
        ((x1238 : @kernel.Term) => {
          @lib.check(
            fn(x1237 : @kernel.Term) -> Bool raise { @basics.is_forall(x1237) },
            x1238,
          )
        })(x1239),
      )
    })(
      (fn(x1240 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x1240) })(
        x1241,
      ),
    )
  })
  let t1233 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1232 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t1231 = @tactics.exists_tac(@term_syntax.parse_term("(A2 : Num) + 1"))
  let t1228 = @term_syntax.parse_term("(A2 : Num)")
  let t1230 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(A1 : Num)"))((x1229 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1228, x1229)
    }),
  )
  let t1227 = @simp.rewrite_tac(
    @list.List([
      nadd_le(),
      nadd_mul_v1(),
      nadd_of_num_v1(),
      @arith.mult_clauses(),
    ]),
  )
  let t1223 = @term_syntax.parse_term("1")
  let t1226 = @tactics.disch_then(fn(
    x1225 : @kernel.Thm,
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
      x1220 : @kernel.Thm,
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
      let s1221 = @tactics.mp_tac(x1220)
      fn(
        x1222 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1221(x1222)
      }
    })(((x1224 : @kernel.Thm) => @bool.spec(t1223, x1224))(x1225))
  })
  let t1218 = @drule.match_mp(nadd_arch_mult())
  let t1246 = @tactics.then_tac(
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
                        @tactics.gen_tac,
                        @tactics.disch_then(fn(
                          x1219 : @kernel.Thm,
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
                          (fn(
                            x1215 : @kernel.Thm,
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
                            let s1216 = @tactics.mp_tac(x1215)
                            fn(
                              x1217 : (
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
                            ) raise {
                              s1216(x1217)
                            }
                          })(t1218(x1219))
                        }),
                      ),
                      t1226,
                    ),
                    t1227,
                  ),
                  t1230,
                ),
                t1231,
              ),
              t1232,
            ),
            t1233,
          ),
          t1242,
        ),
        t1243,
      ),
      t1244,
    ),
    t1245,
  )
  nadd_nonzero_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → (∃ N : Num, ∀ n : Num, N <= n → !(dest_nadd(x, n) == 0))"),
      t1246,
    ),
  )
}

///|
let nadd_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_NONZERO")

///|
/// `NADD_NONZERO`
pub fn nadd_nonzero() -> @kernel.Thm {
  nadd_nonzero_c.get()
}

///|
/// NADD_LBOUND
fn step_114() -> Unit raise {
  let t1285 = @simp.asm_rewrite_tac(
    @list.List([@equal.gsym(@arith.not_lt()), @arith.lt()]),
  )
  let t1283 = @term_syntax.parse_term("SUC(0)")
  let t1284 = @simp.rewrite_tac(
    @list.List([
      @equal.gsym(
        @simp.rewrite_conv(@list.List([@calc_num.arith_suc()]))(t1283),
      ),
    ]),
  )
  let t1282 = @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t1281 = @simp.gen_rewrite_tac(
    fn(
      x1278 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1279 = @equal.land_conv(x1278)
      fn(x1280 : @kernel.Term) -> @kernel.Thm raise { s1279(x1280) }
    },
    @list.List([
      @equal.gsym(@lib.el(3, @bool.conjuncts_rule(@arith.mult_clauses()))),
    ]),
  )
  let t1277 = @simp.asm_rewrite_tac(
    @list.List([@arith.right_add_distrib(), @arith.le_add_lcancel()]),
  )
  let t1276 = @tactics.exists_tac(@term_syntax.parse_term("(A1 : Num) * dest_nadd((x : Nadd), (n : Num)) + (A2 : Num)"))
  let t1275 = @tactics.match_mp_tac(@arith.le_trans())
  let t1274 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
      x1271 : @kernel.Thm,
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
      let s1272 = @tactics.assume_tac(x1271)
      fn(
        x1273 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1272(x1273)
      }
    }),
  )
  let t1270 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num)"))
  let t1269 = @tactics.exists_tac(@term_syntax.parse_term("(A1 : Num) + (A2 : Num)"))
  let t1266 = @term_syntax.parse_term("(A2 : Num)")
  let t1268 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(A1 : Num)"))((x1267 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1266, x1267)
    }),
  )
  let t1265 = @simp.rewrite_tac(
    @list.List([
      nadd_le(),
      nadd_mul_v1(),
      nadd_of_num_v1(),
      @arith.mult_clauses(),
    ]),
  )
  let t1261 = @term_syntax.parse_term("1")
  let t1264 = @tactics.disch_then(fn(
    x1263 : @kernel.Thm,
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
      x1258 : @kernel.Thm,
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
      let s1259 = @tactics.mp_tac(x1258)
      fn(
        x1260 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1259(x1260)
      }
    })(((x1262 : @kernel.Thm) => @bool.spec(t1261, x1262))(x1263))
  })
  let t1255 = @drule.match_mp(nadd_arch_mult())
  let t1257 = @tactics.first_assum(fn(
    x1256 : @kernel.Thm,
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
      x1252 : @kernel.Thm,
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
      let s1253 = @tactics.mp_tac(x1252)
      fn(
        x1254 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1253(x1254)
      }
    })(t1255(x1256))
  })
  let t1249 = @drule.match_mp(nadd_nonzero())
  let t1247 = @term_syntax.parse_term("(N : Num)")
  let t1251 = @tactics.first_assum(fn(
    x1250 : @kernel.Thm,
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
    ((x1248 : @kernel.Thm) => @tactics.x_choose_tac(t1247, x1248))(t1249(x1250))
  })
  let t1286 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.gen_tac, @tactics.disch_tac,
                                    ),
                                    t1251,
                                  ),
                                  t1257,
                                ),
                                t1264,
                              ),
                              t1265,
                            ),
                            t1268,
                          ),
                          t1269,
                        ),
                        t1270,
                      ),
                      @tactics.gen_tac,
                    ),
                    t1274,
                  ),
                  t1275,
                ),
                t1276,
              ),
              t1277,
            ),
            t1281,
          ),
          t1282,
        ),
        @tactics.disj2_tac,
      ),
      t1284,
    ),
    t1285,
  )
  nadd_lbound_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → (∃ A : Num, ∃ N : Num, ∀ n : Num, N <= n → n <= A * dest_nadd(x, n))"),
      t1286,
    ),
  )
}

///|
let nadd_lbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_LBOUND")

///|
/// `NADD_LBOUND`
pub fn nadd_lbound() -> @kernel.Thm {
  nadd_lbound_c.get()
}

///|
/// nadd_rinv
fn step_115() -> Unit raise {
  nadd_rinv_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(nadd_rinv : (Nadd, Num) -> Num)((x : Nadd)) == ((n : Num) => DIV(n * n, dest_nadd(x, n)))"),
    ),
  )
}

///|
let nadd_rinv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nadd_rinv")

///|
/// `nadd_rinv`
pub fn nadd_rinv() -> @kernel.Thm {
  nadd_rinv_c.get()
}

///|
/// NADD_MUL_LINV_LEMMA0
fn step_116() -> Unit raise {
  let t1343 = @simp.rewrite_tac(@list.List([@arith.le_add()]))
  let t1342 = @simp.gen_rewrite_tac(
    fn(
      x1339 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1340 = @equal.land_conv(x1339)
      fn(x1341 : @kernel.Term) -> @kernel.Thm raise { s1340(x1341) }
    },
    @list.List([@arith.mult_sym()]),
  )
  let t1338 = @tactics.disch_then(fn(
    x1333 : @kernel.Thm,
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
    let t = x1333
    @simp.gen_rewrite_tac(
      fn(
        x1335 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1336 = @equal.rand_conv(x1335)
        fn(x1337 : @kernel.Term) -> @kernel.Thm raise { s1336(x1337) }
      },
      @list.List([@bool.conjunct1(@bool.spec_all(t))]),
    )
  })
  let t1330 = @drule.match_mp(@arith.division())
  let t1332 = @tactics.first_assum(fn(
    x1331 : @kernel.Thm,
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
      x1327 : @kernel.Thm,
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
      let s1328 = @tactics.mp_tac(x1327)
      fn(
        x1329 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1328(x1329)
      }
    })(t1330(x1331))
  })
  let t1326 = @simp.asm_rewrite_tac(
    @list.List([@arith.mult_clauses(), @arith.le_0(), nadd_rinv()]),
  )
  let t1325 = @class.asm_cases_tac(@term_syntax.parse_term("dest_nadd((x : Nadd), (n : Num)) == 0"))
  let t1324 = @simp.rewrite_tac(
    @list.List([@equal.gsym(@arith.mult_assoc()), @arith.le_mult_lcancel()]),
  )
  let t1344 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.gen_rewrite_tac(
                    fn(
                      x1321 : (@kernel.Term) -> @kernel.Thm raise,
                    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                      let s1322 = @equal.land_conv(x1321)
                      fn(x1323 : @kernel.Term) -> @kernel.Thm raise {
                        s1322(x1323)
                      }
                    },
                    @list.List([@arith.mult_sym()]),
                  ),
                  t1324,
                ),
                @tactics.disj2_tac,
              ),
              t1325,
            ),
            t1326,
          ),
          t1332,
        ),
        t1338,
      ),
      t1342,
    ),
    t1343,
  )
  let t1320 = @simp.asm_rewrite_tac(@list.List([@arith.le(), @arith.le_refl()]))
  let t1319 = @tactics.exists_tac(@term_syntax.parse_term("SUC((N : Num))"))
  let t1318 = @tactics.match_mp_tac(@arith.le_trans())
  let t1345 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disj2_tac,
            @tactics.first_assum(@tactics.match_mp_tac),
          ),
          t1318,
        ),
        t1319,
      ),
      t1320,
    ),
    t1344,
  ])
  let t1317 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t1316 = @tactics.exists_tac(
    @term_syntax.parse_term("nadd_rinv((x : Nadd), (n : Num)) * ((A : Num) * dest_nadd(x, n))"),
  )
  let t1315 = @tactics.match_mp_tac(@arith.le_trans())
  let t1314 = @tactics.disch_then(fn(
    x1313 : @kernel.Thm,
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
      x1310 : @kernel.Thm,
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
      let s1311 = @tactics.subst1_tac(x1310)
      fn(
        x1312 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1311(x1312)
      }
    })(@equal.sym(x1313))
  })
  let t1309 = @simp.asm_rewrite_tac(@list.List([@arith.le(), @nums.not_suc()]))
  let t1308 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == 0"))
  let t1307 = @tactics.undisch_tac(@term_syntax.parse_term("SUC((N : Num)) <= (n : Num)"))
  let t1304 = @term_syntax.parse_term("(n : Num)")
  let t1305 = @term_syntax.parse_term("(A : Num) * (n : Num)")
  let t1306 = @tactics.mp_tac(
    @bool.specl(
      @list.List([@term_syntax.parse_term("nadd_rinv((x : Nadd), (n : Num))"), t1305, t1304]),
      @arith.le_mult_rcancel(),
    ),
  )
  let t1303 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t1300 = @term_syntax.parse_term("SUC((N : Num))")
  let t1301 = @term_syntax.parse_term("0")
  let t1302 = @tactics.map_every(
    fn(
      x1297 : @kernel.Term,
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
      let s1298 = @tactics.exists_tac(x1297)
      fn(
        x1299 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1298(x1299)
      }
    },
    @list.List([@term_syntax.parse_term("(A : Num)"), t1301, t1300]),
  )
  let t1294 = @term_syntax.parse_term("(N : Num)")
  let t1296 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(A : Num)"))((x1295 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1294, x1295)
    }),
  )
  let t1291 = @drule.match_mp(nadd_lbound())
  let t1293 = @tactics.first_assum(fn(
    x1292 : @kernel.Thm,
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
      x1288 : @kernel.Thm,
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
      let s1289 = @tactics.mp_tac(x1288)
      fn(
        x1290 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1289(x1290)
      }
    })(t1291(x1292))
  })
  let t1287 = @simp.once_rewrite_tac(@list.List([bounds_ignore()]))
  let t1346 = @tactics.thenl(
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.gen_tac, @tactics.disch_tac,
                                      ),
                                      t1287,
                                    ),
                                    t1293,
                                  ),
                                  t1296,
                                ),
                                t1302,
                              ),
                              @tactics.gen_tac,
                            ),
                            @tactics.disch_tac,
                          ),
                          t1303,
                        ),
                        t1306,
                      ),
                      t1307,
                    ),
                    t1308,
                  ),
                  t1309,
                ),
                @tactics.disch_tac,
              ),
              t1314,
            ),
            t1315,
          ),
          t1316,
        ),
        t1317,
      ),
      @tactics.conj_tac,
    ),
    t1345,
  )
  nadd_mul_linv_lemma0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → (∃ A : Num, ∃ B : Num, ∀ n : Num, nadd_rinv(x, n) <= A * n + B)"),
      t1346,
    ),
  )
}

///|
let nadd_mul_linv_lemma0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_LINV_LEMMA0",
)

///|
/// `NADD_MUL_LINV_LEMMA0`
pub fn nadd_mul_linv_lemma0() -> @kernel.Thm {
  nadd_mul_linv_lemma0_c.get()
}

///|
/// NADD_MUL_LINV_LEMMA1
fn step_117() -> Unit raise {
  let t1382 = @tactics.first_assum(fn(
    x1379 : @kernel.Thm,
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
    let s1380 = @tactics.match_accept_tac(x1379)
    fn(
      x1381 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1380(x1381)
    }
  })
  let t1378 = @tactics.match_mp_tac(@arith.lt_imp_le())
  let t1377 = @simp.rewrite_tac(@list.List([dist_radd_0()]))
  let t1376 = @simp.gen_rewrite_tac(
    fn(
      x1375 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1371 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1365 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1366 = @equal.land_conv(x1365)
          fn(x1367 : @kernel.Term) -> @kernel.Thm raise { s1366(x1367) }
        })(
          (fn(
            x1368 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1369 = @equal.rand_conv(x1368)
            fn(x1370 : @kernel.Term) -> @kernel.Thm raise { s1369(x1370) }
          })(x1371),
        )
      })(
        (fn(
          x1372 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1373 = @equal.land_conv(x1372)
          fn(x1374 : @kernel.Term) -> @kernel.Thm raise { s1373(x1374) }
        })(x1375),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t1364 = @simp.rewrite_tac(@list.List([nadd_rinv()]))
  let t1359 = @term_syntax.parse_term("(n : Num) * n")
  let t1361 = @tactics.conjuncts_then2(
    fn(
      x1353 : @kernel.Thm,
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
      let s1354 = @tactics.subst1_tac(x1353)
      fn(
        x1355 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1354(x1355)
      }
    },
    fn(
      x1356 : @kernel.Thm,
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
      let s1357 = @tactics.assume_tac(x1356)
      fn(
        x1358 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1357(x1358)
      }
    },
  )
  let t1363 = @tactics.disch_then(fn(
    x1362 : @kernel.Thm,
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
    t1361(((x1360 : @kernel.Thm) => @bool.spec(t1359, x1360))(x1362))
  })
  let t1350 = @drule.match_mp(@arith.division())
  let t1352 = @tactics.disch_then(fn(
    x1351 : @kernel.Thm,
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
      x1347 : @kernel.Thm,
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
      let s1348 = @tactics.mp_tac(x1347)
      fn(
        x1349 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1348(x1349)
      }
    })(t1350(x1351))
  })
  let t1383 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1352),
              t1363,
            ),
            t1364,
          ),
          t1376,
        ),
        t1377,
      ),
      t1378,
    ),
    t1382,
  )
  nadd_mul_linv_lemma1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ n : Num, !(dest_nadd(x, n) == 0) → dist((dest_nadd(x, n) * nadd_rinv(x, n), n * n)) <= dest_nadd(x, n)"),
      t1383,
    ),
  )
}

///|
let nadd_mul_linv_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_LINV_LEMMA1",
)

///|
/// `NADD_MUL_LINV_LEMMA1`
pub fn nadd_mul_linv_lemma1() -> @kernel.Thm {
  nadd_mul_linv_lemma1_c.get()
}

///|
/// NADD_MUL_LINV_LEMMA2
fn step_118() -> Unit raise {
  let t1396 = @simp.asm_rewrite_tac(@list.List([]))
  let t1395 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1394 = @tactics.match_mp_tac(nadd_mul_linv_lemma1())
  let t1393 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1392 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num)"))
  let t1389 = @term_syntax.parse_term("(N : Num)")
  let t1391 = @tactics.disch_then((x1390 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1389, x1390)
  })
  let t1387 = @drule.match_mp(nadd_nonzero())
  let t1397 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @tactics.disch_then(fn(
                  x1388 : @kernel.Thm,
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
                    x1384 : @kernel.Thm,
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
                    let s1385 = @tactics.mp_tac(x1384)
                    fn(
                      x1386 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s1385(x1386)
                    }
                  })(t1387(x1388))
                }),
              ),
              t1391,
            ),
            t1392,
          ),
          t1393,
        ),
        t1394,
      ),
      t1395,
    ),
    t1396,
  )
  nadd_mul_linv_lemma2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → (∃ N : Num, ∀ n : Num, N <= n → dist((dest_nadd(x, n) * nadd_rinv(x, n), n * n)) <= dest_nadd(x, n))"),
      t1397,
    ),
  )
}

///|
let nadd_mul_linv_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_LINV_LEMMA2",
)

///|
/// `NADD_MUL_LINV_LEMMA2`
pub fn nadd_mul_linv_lemma2() -> @kernel.Thm {
  nadd_mul_linv_lemma2_c.get()
}

///|
/// NADD_MUL_LINV_LEMMA3
fn step_119() -> Unit raise {
  let t1411 = @simp.asm_rewrite_tac(@list.List([]))
  let t1410 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1409 = @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t1408 = @simp.rewrite_tac(
    @list.List([@equal.gsym(dist_lmul()), @arith.mult_assoc()]),
  )
  let t1407 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1406 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num)"))
  let t1403 = @term_syntax.parse_term("(N : Num)")
  let t1405 = @tactics.disch_then((x1404 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1403, x1404)
  })
  let t1401 = @drule.match_mp(nadd_mul_linv_lemma2())
  let t1412 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.gen_tac,
                    @tactics.disch_then(fn(
                      x1402 : @kernel.Thm,
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
                        x1398 : @kernel.Thm,
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
                        let s1399 = @tactics.mp_tac(x1398)
                        fn(
                          x1400 : (
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
                          s1399(x1400)
                        }
                      })(t1401(x1402))
                    }),
                  ),
                  t1405,
                ),
                t1406,
              ),
              t1407,
            ),
            t1408,
          ),
          t1409,
        ),
        @tactics.disj2_tac,
      ),
      t1410,
    ),
    t1411,
  )
  nadd_mul_linv_lemma3_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → (∃ N : Num, ∀ m : Num, ∀ n : Num, N <= n → dist((m * (dest_nadd(x, m) * (dest_nadd(x, n) * nadd_rinv(x, n))), m * (dest_nadd(x, m) * (n * n)))) <= m * (dest_nadd(x, m) * dest_nadd(x, n)))"),
      t1412,
    ),
  )
}

///|
let nadd_mul_linv_lemma3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_LINV_LEMMA3",
)

///|
/// `NADD_MUL_LINV_LEMMA3`
pub fn nadd_mul_linv_lemma3() -> @kernel.Thm {
  nadd_mul_linv_lemma3_c.get()
}

///|
/// NADD_MUL_LINV_LEMMA4
fn step_120() -> Unit raise {
  let t1450 = @simp.rewrite_tac(@list.List([@arith.mult_ac()]))
  let t1449 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1446 = @kernel.assume_rule(@term_syntax.parse_term("(N : Num) <= (m : Num)"))
  let t1443 = @term_syntax.parse_term("(n : Num)")
  let t1447 = @tactics.ante_res_then(fn(
    x1445 : @kernel.Thm,
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
      x1440 : @kernel.Thm,
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
      let s1441 = @tactics.mp_tac(x1440)
      fn(
        x1442 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1441(x1442)
      }
    })(((x1444 : @kernel.Thm) => @bool.spec(t1443, x1444))(x1445))
  })(t1446)
  let t1439 = @kernel.assume_rule(@term_syntax.parse_term("(N : Num) <= (n : Num)"))
  let t1436 = @term_syntax.parse_term("(m : Num)")
  let t1448 = @list.List([
    @tactics.ante_res_then(fn(
      x1438 : @kernel.Thm,
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
        x1433 : @kernel.Thm,
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
        let s1434 = @tactics.mp_tac(x1433)
        fn(
          x1435 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1434(x1435)
        }
      })(((x1437 : @kernel.Thm) => @bool.spec(t1436, x1437))(x1438))
    })(t1439),
    t1447,
  ])
  let t1432 = @tactics.match_mp_tac(dist_triangles_le())
  let t1431 = @simp.gen_rewrite_tac(
    fn(
      x1430 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1424 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1425 = @equal.rand_conv(x1424)
        fn(x1426 : @kernel.Term) -> @kernel.Thm raise { s1425(x1426) }
      })(
        (fn(
          x1427 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1428 = @equal.land_conv(x1427)
          fn(x1429 : @kernel.Term) -> @kernel.Thm raise { s1428(x1429) }
        })(x1430),
      )
    },
    @list.List([dist_sym()]),
  )
  let t1423 = @simp.rewrite_tac(
    @list.List([dist_lmul(), @arith.left_add_distrib()]),
  )
  let t1422 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1421 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num)"))
  let t1418 = @term_syntax.parse_term("(N : Num)")
  let t1420 = @tactics.disch_then((x1419 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1418, x1419)
  })
  let t1416 = @drule.match_mp(nadd_mul_linv_lemma3())
  let t1451 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.gen_tac,
                        @tactics.disch_then(fn(
                          x1417 : @kernel.Thm,
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
                          (fn(
                            x1413 : @kernel.Thm,
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
                            let s1414 = @tactics.mp_tac(x1413)
                            fn(
                              x1415 : (
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
                            ) raise {
                              s1414(x1415)
                            }
                          })(t1416(x1417))
                        }),
                      ),
                      t1420,
                    ),
                    t1421,
                  ),
                  t1422,
                ),
                t1423,
              ),
              t1431,
            ),
            t1432,
          ),
          @tactics.conj_tac,
        ),
        t1448,
      ),
      t1449,
    ),
    t1450,
  )
  nadd_mul_linv_lemma4_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → (∃ N : Num, ∀ m : Num, ∀ n : Num, N <= m && N <= n → dest_nadd(x, m) * dest_nadd(x, n) * dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= m * n * dist((m * dest_nadd(x, n), n * dest_nadd(x, m))) + dest_nadd(x, m) * dest_nadd(x, n) * (m + n))"),
      t1451,
    ),
  )
}

///|
let nadd_mul_linv_lemma4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_LINV_LEMMA4",
)

///|
/// `NADD_MUL_LINV_LEMMA4`
pub fn nadd_mul_linv_lemma4() -> @kernel.Thm {
  nadd_mul_linv_lemma4_c.get()
}

///|
/// NADD_MUL_LINV_LEMMA5
fn step_121() -> Unit raise {
  let t1496 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_add(), @arith.le_addr()]),
  )
  let t1495 = @tactics.exists_tac(@term_syntax.parse_term("(N1 : Num) + (N2 : Num)"))
  let t1494 = @tactics.match_mp_tac(@arith.le_trans())
  let t1493 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1492 = @tactics.match_mp_tac(@arith.le_mult2())
  let t1491 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t1490 = @term_syntax.parse_term("(a : Num) * (b : Num) * ((c : Num) * (d : Num) * (e : Num)) == a * c * (b * d) * e")
  let t1497 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @simp.once_rewrite_tac(
                    @list.List([@theorems.ac(@arith.mult_ac())(t1490)]),
                  ),
                  t1491,
                ),
                @tactics.disj1_tac,
              ),
              t1492,
            ),
            @tactics.conj_tac,
          ),
          t1493,
        ),
        t1494,
      ),
      t1495,
    ),
    t1496,
  )
  let t1489 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t1488 = @simp.gen_rewrite_tac(
    (x1487 : (@kernel.Term) -> @kernel.Thm raise) => {
      @lib.funpow(
        2,
        fn(
          x1484 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1485 = @equal.rand_conv(x1484)
          fn(x1486 : @kernel.Term) -> @kernel.Thm raise { s1485(x1486) }
        },
        x1487,
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t1483 = @simp.gen_rewrite_tac(
    fn(
      x1480 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1481 = @equal.rand_conv(x1480)
      fn(x1482 : @kernel.Term) -> @kernel.Thm raise { s1481(x1482) }
    },
    @list.List([@equal.gsym(@arith.mult_assoc())]),
  )
  let t1498 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.gen_rewrite_tac(
            fn(
              x1477 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s1478 = @equal.rand_conv(x1477)
              fn(x1479 : @kernel.Term) -> @kernel.Thm raise { s1478(x1479) }
            },
            @list.List([@arith.mult_sym()]),
          ),
          t1483,
        ),
        t1488,
      ),
      t1489,
    ),
    t1497,
  ])
  let t1474 = @tactics.match_mp_tac(@arith.le_add2())
  let t1475 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@arith.right_add_distrib()])),
    t1474,
  )
  let t1473 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_add(), @arith.le_addr()]),
  )
  let t1472 = @tactics.exists_tac(@term_syntax.parse_term("(N1 : Num) + (N2 : Num)"))
  let t1471 = @tactics.match_mp_tac(@arith.le_trans())
  let t1476 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.first_assum(@tactics.match_mp_tac),
            @tactics.conj_tac,
          ),
          t1471,
        ),
        t1472,
      ),
      t1473,
    ),
    t1475,
  ])
  let t1470 = @tactics.exists_tac(
    @term_syntax.parse_term("(m : Num) * (n : Num) * dist((m * dest_nadd((x : Nadd), n), n * dest_nadd(x, m))) + dest_nadd(x, m) * dest_nadd(x, n) * (m + n)"),
  )
  let t1469 = @tactics.match_mp_tac(@arith.le_trans())
  let t1468 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1467 = @tactics.exists_tac(@term_syntax.parse_term("(N1 : Num) + (N2 : Num)"))
  let t1466 = @tactics.exists_tac(@term_syntax.parse_term("(B1 : Num) + (B2 : Num) * B2"))
  let t1464 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_ubound())
  let t1462 = @term_syntax.parse_term("(N2 : Num)")
  let t1465 = @tactics.x_choose_then(@term_syntax.parse_term("(B2 : Num)"))((
    x1463 : @kernel.Thm,
  ) => @tactics.x_choose_tac(t1462, x1463))(t1464)
  let t1460 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_cauchy())
  let t1461 = @tactics.x_choose_tac(@term_syntax.parse_term("(B1 : Num)"), t1460)
  let t1457 = @term_syntax.parse_term("(N1 : Num)")
  let t1459 = @tactics.disch_then((x1458 : @kernel.Thm) => {
    @tactics.x_choose_tac(t1457, x1458)
  })
  let t1455 = @drule.match_mp(nadd_mul_linv_lemma4())
  let t1499 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.thenl(
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
                            @tactics.gen_tac,
                            @tactics.disch_then(fn(
                              x1456 : @kernel.Thm,
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
                                x1452 : @kernel.Thm,
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
                                let s1453 = @tactics.mp_tac(x1452)
                                fn(
                                  x1454 : (
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
                                  s1453(x1454)
                                }
                              })(t1455(x1456))
                            }),
                          ),
                          t1459,
                        ),
                        t1461,
                      ),
                      t1465,
                    ),
                    t1466,
                  ),
                  t1467,
                ),
                t1468,
              ),
              t1469,
            ),
            t1470,
          ),
          @tactics.conj_tac,
        ),
        t1476,
      ),
      @tactics.conj_tac,
    ),
    t1498,
  )
  nadd_mul_linv_lemma5_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → (∃ B : Num, ∃ N : Num, ∀ m : Num, ∀ n : Num, N <= m && N <= n → dest_nadd(x, m) * dest_nadd(x, n) * dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= B * (m * n * (m + n)))"),
      t1499,
    ),
  )
}

///|
let nadd_mul_linv_lemma5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_LINV_LEMMA5",
)

///|
/// `NADD_MUL_LINV_LEMMA5`
pub fn nadd_mul_linv_lemma5() -> @kernel.Thm {
  nadd_mul_linv_lemma5_c.get()
}

///|
/// NADD_MUL_LINV_LEMMA6
fn step_122() -> Unit raise {
  let t1534 = @simp.asm_rewrite_tac(
    @list.List([@arith.le_add(), @arith.le_addr()]),
  )
  let t1533 = @tactics.exists_tac(@term_syntax.parse_term("(N1 : Num) + (N2 : Num)"))
  let t1532 = @tactics.match_mp_tac(@arith.le_trans())
  let t1529 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1528 = @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t1527 = @term_syntax.parse_term("(a : Num) * ((b : Num) * (c : Num)) * ((d : Num) * (e : Num) * (f : Num)) == b * c * (a * (d * e * f))")
  let t1530 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @simp.once_rewrite_tac(
            @list.List([@theorems.ac(@arith.mult_ac())(t1527)]),
          ),
          t1528,
        ),
        @tactics.disj2_tac,
      ),
      t1529,
    ),
    @tactics.conj_tac,
  )
  let t1526 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1525 = @tactics.match_mp_tac(@arith.le_mult2())
  let t1523 = @term_syntax.parse_term("(a : Num) * (b : Num) * (c : Num) * (d : Num) == a * c * (b * d)")
  let t1524 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@arith.mult_ac())(t1523)]),
  )
  let t1531 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(
                @list.List([@arith.mult_assoc(), @arith.le_mult_rcancel()]),
              ),
              @tactics.disj1_tac,
            ),
            t1524,
          ),
          t1525,
        ),
        @tactics.conj_tac,
      ),
      t1526,
    ),
    t1530,
  ])
  let t1522 = @tactics.exists_tac(
    @term_syntax.parse_term("(B2 : Num) * B2 * (dest_nadd((x : Nadd), (m : Num)) * dest_nadd(x, (n : Num)) * dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))))"),
  )
  let t1521 = @tactics.match_mp_tac(@arith.le_trans())
  let t1520 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1519 = @tactics.exists_tac(@term_syntax.parse_term("(N1 : Num) + (N2 : Num)"))
  let t1518 = @tactics.exists_tac(@term_syntax.parse_term("(B1 : Num) * ((B2 : Num) * B2)"))
  let t1515 = @term_syntax.parse_term("(N2 : Num)")
  let t1517 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(B2 : Num)"))((x1516 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1515, x1516)
    }),
  )
  let t1512 = @drule.match_mp(nadd_lbound())
  let t1514 = @tactics.first_assum(fn(
    x1513 : @kernel.Thm,
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
      x1509 : @kernel.Thm,
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
      let s1510 = @tactics.mp_tac(x1509)
      fn(
        x1511 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1510(x1511)
      }
    })(t1512(x1513))
  })
  let t1506 = @term_syntax.parse_term("(N1 : Num)")
  let t1508 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(B1 : Num)"))((x1507 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1506, x1507)
    }),
  )
  let t1503 = @drule.match_mp(nadd_mul_linv_lemma5())
  let t1505 = @tactics.first_assum(fn(
    x1504 : @kernel.Thm,
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
      x1500 : @kernel.Thm,
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
      let s1501 = @tactics.mp_tac(x1500)
      fn(
        x1502 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1501(x1502)
      }
    })(t1503(x1504))
  })
  let t1535 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
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
                                @tactics.gen_tac, @tactics.disch_tac,
                              ),
                              t1505,
                            ),
                            t1508,
                          ),
                          t1514,
                        ),
                        t1517,
                      ),
                      t1518,
                    ),
                    t1519,
                  ),
                  t1520,
                ),
                t1521,
              ),
              t1522,
            ),
            @tactics.conj_tac,
          ),
          t1531,
        ),
        t1532,
      ),
      t1533,
    ),
    t1534,
  )
  nadd_mul_linv_lemma6_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → (∃ B : Num, ∃ N : Num, ∀ m : Num, ∀ n : Num, N <= m && N <= n → m * n * dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= B * (m * n * (m + n)))"),
      t1535,
    ),
  )
}

///|
let nadd_mul_linv_lemma6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_LINV_LEMMA6",
)

///|
/// `NADD_MUL_LINV_LEMMA6`
pub fn nadd_mul_linv_lemma6() -> @kernel.Thm {
  nadd_mul_linv_lemma6_c.get()
}

///|
/// NADD_MUL_LINV_LEMMA7
fn step_123() -> Unit raise {
  let t1580 = @simp.asm_rewrite_tac(@list.List([@arith.le_addr()]))
  let t1579 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num) + 1"))
  let t1578 = @tactics.match_mp_tac(@arith.le_trans())
  let t1577 = @tactics.match_mp_tac(@arith.le_mult2())
  let t1575 = @term_syntax.parse_term("SUC(0) == 1 * 1")
  let t1576 = @simp.rewrite_tac(
    @list.List([
      @bool.eqt_elim(@simp.rewrite_conv(@list.List([@calc_num.arith()]))(t1575)),
    ]),
  )
  let t1574 = @simp.rewrite_tac(
    @list.List([@arith.not_le(), @equal.gsym(@arith.le_suc_lt())]),
  )
  let t1573 = @simp.once_rewrite_tac(
    @list.List([@equal.gsym(@bool.conjunct1(@arith.le()))]),
  )
  let t1572 = @tactics.disch_then(fn(
    x1571 : @kernel.Thm,
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
    @tactics.all_tac
  })
  let t1570 = @tactics.conv_tac(@class.contrapos_conv)
  let t1569 = @tactics.disch_then(
    @tactics.disj_cases_then2(
      fn(
        x1563 : @kernel.Thm,
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
        let s1564 = @tactics.mp_tac(x1563)
        fn(
          x1565 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1564(x1565)
        }
      },
      fn(
        x1566 : @kernel.Thm,
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
        let s1567 = @tactics.accept_tac(x1566)
        fn(
          x1568 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1567(x1568)
        }
      },
    ),
  )
  let t1562 = @simp.rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t1560 = @term_syntax.parse_term("(a : Num) * ((b : Num) * (c : Num)) == b * (a * c)")
  let t1561 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@arith.mult_ac())(t1560)]),
  )
  let t1581 = @tactics.then_tac(
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
                          @tactics.then_tac(
                            @tactics.disch_then(
                              @tactics.ante_res_then(fn(
                                x1557 : @kernel.Thm,
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
                                let s1558 = @tactics.mp_tac(x1557)
                                fn(
                                  x1559 : (
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
                                  s1558(x1559)
                                }
                              }),
                            ),
                            t1561,
                          ),
                          t1562,
                        ),
                        t1569,
                      ),
                      t1570,
                    ),
                    t1572,
                  ),
                  t1573,
                ),
                t1574,
              ),
              t1576,
            ),
            t1577,
          ),
          @tactics.conj_tac,
        ),
        t1578,
      ),
      t1579,
    ),
    t1580,
  )
  let t1556 = @simp.asm_rewrite_tac(@list.List([@arith.le_add()]))
  let t1555 = @tactics.exists_tac(@term_syntax.parse_term("(N : Num) + 1"))
  let t1582 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.conj_tac,
          @tactics.match_mp_tac(@arith.le_trans()),
        ),
        t1555,
      ),
      t1556,
    ),
    t1581,
  ])
  let t1554 = @tactics.subgoal_then(@term_syntax.parse_term("(N : Num) <= (m : Num) && N <= (n : Num)"), fn(
    x1551 : @kernel.Thm,
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
    let s1552 = @tactics.mp_tac(x1551)
    fn(
      x1553 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1552(x1553)
    }
  })
  let t1549 = @term_syntax.parse_term("(n : Num)")
  let t1550 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(m : Num)"), t1549]),
  )
  let t1547 = @term_syntax.parse_term("(N : Num) + 1")
  let t1548 = @tactics.map_every(
    fn(
      x1544 : @kernel.Term,
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
      let s1545 = @tactics.exists_tac(x1544)
      fn(
        x1546 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1545(x1546)
      }
    },
    @list.List([@term_syntax.parse_term("(B : Num)"), t1547]),
  )
  let t1541 = @term_syntax.parse_term("(N : Num)")
  let t1543 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(B : Num)"))((x1542 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1541, x1542)
    }),
  )
  let t1539 = @drule.match_mp(nadd_mul_linv_lemma6())
  let t1583 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.gen_tac,
                @tactics.disch_then(fn(
                  x1540 : @kernel.Thm,
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
                    x1536 : @kernel.Thm,
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
                    let s1537 = @tactics.mp_tac(x1536)
                    fn(
                      x1538 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s1537(x1538)
                    }
                  })(t1539(x1540))
                }),
              ),
              t1543,
            ),
            t1548,
          ),
          t1550,
        ),
        @tactics.strip_tac,
      ),
      t1554,
    ),
    t1582,
  )
  nadd_mul_linv_lemma7_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → (∃ B : Num, ∃ N : Num, ∀ m : Num, ∀ n : Num, N <= m && N <= n → dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= B * (m + n))"),
      t1583,
    ),
  )
}

///|
let nadd_mul_linv_lemma7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_LINV_LEMMA7",
)

///|
/// `NADD_MUL_LINV_LEMMA7`
pub fn nadd_mul_linv_lemma7() -> @kernel.Thm {
  nadd_mul_linv_lemma7_c.get()
}

///|
/// NADD_MUL_LINV_LEMMA7a
fn step_124() -> Unit raise {
  let t1637 = @simp.rewrite_tac(
    @list.List([
      @arith.right_add_distrib(),
      @equal.gsym(@arith.add_assoc()),
      @arith.le_add(),
    ]),
  )
  let t1638 = @tactics.then_tac(
    @simp.rewrite_tac(@list.List([@arith.add_assoc(), @arith.le_add_rcancel()])),
    t1637,
  )
  let t1636 = @simp.asm_rewrite_tac(@list.List([]))
  let t1639 = @list.List([
    @tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t1636),
    t1638,
  ])
  let t1635 = @tactics.exists_tac(@term_syntax.parse_term("(A : Num) * (n : Num) + (B : Num)"))
  let t1640 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t1635),
      @tactics.conj_tac,
    ),
    t1639,
  )
  let t1632 = @tactics.match_accept_tac(@arith.le_add())
  let t1633 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x1629 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1630 = @equal.land_conv(x1629)
        fn(x1631 : @kernel.Term) -> @kernel.Thm raise { s1630(x1631) }
      },
      @list.List([@arith.mult_sym()]),
    ),
    t1632,
  )
  let t1628 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_lcancel()]))
  let t1627 = @equal.gsym(@arith.left_add_distrib())
  let t1634 = @list.List([
    @tactics.then_tac(
      @simp.rewrite_tac(@list.List([@equal.gsym(@arith.mult_assoc()), t1627])),
      t1628,
    ),
    t1633,
  ])
  let t1626 = @tactics.match_mp_tac(@arith.le_add2())
  let t1624 = @term_syntax.parse_term("(a : Num) + ((b : Num) + (c : Num)) + ((d : Num) + (e : Num)) == c + d + (b + (a + e))")
  let t1625 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@arith.add_ac())(t1624)]),
  )
  let t1623 = @simp.rewrite_tac(@list.List([@arith.right_add_distrib()]))
  let t1622 = @simp.rewrite_tac(@list.List([dist_addbound()]))
  let t1621 = @tactics.exists_tac(
    @term_syntax.parse_term("SUC((N : Num)) * nadd_rinv((x : Nadd), (n : Num)) + n * nadd_rinv(x, SUC(N))"),
  )
  let t1641 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.match_mp_tac(@arith.le_trans()),
                  t1621,
                ),
                t1622,
              ),
              t1623,
            ),
            t1625,
          ),
          t1626,
        ),
        @tactics.conj_tac,
      ),
      t1634,
    ),
    t1640,
  ])
  let t1620 = @tactics.disch_then(
    @tactics.disj_cases_then2(
      fn(
        x1614 : @kernel.Thm,
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
        let s1615 = @tactics.subst1_tac(x1614)
        fn(
          x1616 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1615(x1616)
        }
      },
      fn(
        x1617 : @kernel.Thm,
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
        let s1618 = @tactics.assume_tac(x1617)
        fn(
          x1619 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1618(x1619)
        }
      },
    ),
  )
  let t1613 = @simp.rewrite_tac(@list.List([@arith.le()]))
  let t1612 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1611 = @tactics.exists_tac(@term_syntax.parse_term("SUC((N : Num)) * (B0 : Num) + (B : Num)"))
  let t1610 = @tactics.exists_tac(
    @term_syntax.parse_term("(A : Num) + (nadd_rinv((x : Nadd), SUC((N : Num))) + SUC(N) * (A0 : Num))"),
  )
  let t1608 = @term_syntax.parse_term("(B : Num)")
  let t1642 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.first_assum(
                @tactics.x_choose_then(@term_syntax.parse_term("(A : Num)"))((
                  x1609 : @kernel.Thm,
                ) => @tactics.x_choose_tac(t1608, x1609)),
              ),
              t1610,
            ),
            t1611,
          ),
          t1612,
        ),
        t1613,
      ),
      t1620,
    ),
    t1641,
  )
  let t1607 = @tactics.match_accept_tac(@arith.le_refl())
  let t1606 = @simp.gen_rewrite_tac(
    fn(
      x1603 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1604 = @equal.rand_conv(x1603)
      fn(x1605 : @kernel.Term) -> @kernel.Thm raise { s1604(x1605) }
    },
    @list.List([@arith.mult_sym()]),
  )
  let t1602 = @simp.rewrite_tac(
    @list.List([@arith.mult_clauses(), dist_lzero(), @arith.add_clauses()]),
  )
  let t1601 = @tactics.disch_then(fn(
    x1598 : @kernel.Thm,
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
    let s1599 = @tactics.subst1_tac(x1598)
    fn(
      x1600 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1599(x1600)
    }
  })
  let t1597 = @simp.rewrite_tac(@list.List([@arith.le()]))
  let t1596 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1595 = @term_syntax.parse_term("0")
  let t1643 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.map_every(
                  fn(
                    x1592 : @kernel.Term,
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
                    let s1593 = @tactics.exists_tac(x1592)
                    fn(
                      x1594 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                      s1593(x1594)
                    }
                  },
                  @list.List([@term_syntax.parse_term("nadd_rinv((x : Nadd), 0)"), t1595]),
                ),
                t1596,
              ),
              t1597,
            ),
            t1601,
          ),
          t1602,
        ),
        t1606,
      ),
      t1607,
    ),
    t1642,
  ])
  let t1589 = @term_syntax.parse_term("(B0 : Num)")
  let t1591 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(A0 : Num)"))((x1590 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1589, x1590)
    }),
  )
  let t1587 = @drule.match_mp(nadd_mul_linv_lemma0())
  let t1644 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.gen_tac,
          @tactics.disch_then(fn(
            x1588 : @kernel.Thm,
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
              x1584 : @kernel.Thm,
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
              let s1585 = @tactics.mp_tac(x1584)
              fn(
                x1586 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s1585(x1586)
              }
            })(t1587(x1588))
          }),
        ),
        t1591,
      ),
      @nums.induct_tac,
    ),
    t1643,
  )
  nadd_mul_linv_lemma7a_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → (∀ N : Num, ∃ A : Num, ∃ B : Num, ∀ m : Num, ∀ n : Num, m <= N → dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= A * n + B)"),
      t1644,
    ),
  )
}

///|
let nadd_mul_linv_lemma7a_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_LINV_LEMMA7a",
)

///|
/// `NADD_MUL_LINV_LEMMA7a`
pub fn nadd_mul_linv_lemma7a() -> @kernel.Thm {
  nadd_mul_linv_lemma7a_c.get()
}

///|
/// NADD_MUL_LINV_LEMMA8
fn step_125() -> Unit raise {
  let t1725 = @simp.rewrite_tac(
    @list.List([
      @arith.left_add_distrib(),
      @arith.right_add_distrib(),
      @equal.gsym(@arith.add_assoc()),
      @arith.le_add(),
    ]),
  )
  let t1724 = @simp.gen_rewrite_tac(
    fn(
      x1723 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1717 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1718 = @equal.rand_conv(x1717)
        fn(x1719 : @kernel.Term) -> @kernel.Thm raise { s1718(x1719) }
      })(
        (fn(
          x1720 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1721 = @equal.rand_conv(x1720)
          fn(x1722 : @kernel.Term) -> @kernel.Thm raise { s1721(x1722) }
        })(x1723),
      )
    },
    @list.List([@arith.add_sym()]),
  )
  let t1716 = @simp.asm_rewrite_tac(@list.List([@arith.le_add_rcancel()]))
  let t1715 = @tactics.exists_tac(@term_syntax.parse_term("(A : Num) * (n : Num) + (B : Num)"))
  let t1714 = @tactics.match_mp_tac(@arith.le_trans())
  let t1726 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(
              @tactics.ante_res_then(fn(
                x1711 : @kernel.Thm,
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
                let s1712 = @tactics.assume_tac(x1711)
                fn(
                  x1713 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  s1712(x1713)
                }
              }),
            ),
            t1714,
          ),
          t1715,
        ),
        t1716,
      ),
      t1724,
    ),
    t1725,
  )
  let t1708 = @simp.rewrite_tac(
    @list.List([
      @arith.left_add_distrib(),
      @arith.right_add_distrib(),
      @equal.gsym(@arith.add_assoc()),
      @arith.le_add(),
    ]),
  )
  let t1707 = @simp.asm_rewrite_tac(@list.List([@arith.le_add_rcancel()]))
  let t1706 = @simp.once_rewrite_tac(@list.List([dist_sym()]))
  let t1705 = @tactics.exists_tac(@term_syntax.parse_term("(A : Num) * (m : Num) + (B : Num)"))
  let t1704 = @tactics.match_mp_tac(@arith.le_trans())
  let t1709 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(
              @tactics.ante_res_then(fn(
                x1701 : @kernel.Thm,
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
                let s1702 = @tactics.assume_tac(x1701)
                fn(
                  x1703 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  s1702(x1703)
                }
              }),
            ),
            t1704,
          ),
          t1705,
        ),
        t1706,
      ),
      t1707,
    ),
    t1708,
  )
  let t1698 = @simp.rewrite_tac(
    @list.List([
      @arith.right_add_distrib(),
      @equal.gsym(@arith.add_assoc()),
      @arith.le_add(),
    ]),
  )
  let t1699 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x1697 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1690 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1691 = @equal.rand_conv(x1690)
          fn(x1692 : @kernel.Term) -> @kernel.Thm raise { s1691(x1692) }
        })(
          ((x1696 : (@kernel.Term) -> @kernel.Thm raise) => {
            @lib.funpow(
              2,
              fn(
                x1693 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s1694 = @equal.land_conv(x1693)
                fn(x1695 : @kernel.Term) -> @kernel.Thm raise { s1694(x1695) }
              },
              x1696,
            )
          })(x1697),
        )
      },
      @list.List([@arith.add_sym()]),
    ),
    t1698,
  )
  let t1689 = @simp.asm_rewrite_tac(@list.List([]))
  let t1700 = @list.List([
    @tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t1689),
    t1699,
  ])
  let t1688 = @tactics.exists_tac(@term_syntax.parse_term("(B0 : Num) * ((m : Num) + (n : Num))"))
  let t1710 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(@arith.le_trans()), t1688),
        @tactics.conj_tac,
      ),
      t1700,
    ),
    t1709,
  ])
  let t1686 = @term_syntax.parse_term("(n : Num)")
  let t1687 = @bool.specl(
    @list.List([@term_syntax.parse_term("(N : Num)"), t1686]),
    @arith.le_cases(),
  )
  let t1727 = @list.List([
    @tactics.thenl(
      @tactics.disj_cases_then2(
        fn(
          x1680 : @kernel.Thm,
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
          let s1681 = @tactics.assume_tac(x1680)
          fn(
            x1682 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1681(x1682)
          }
        },
        fn(
          x1683 : @kernel.Thm,
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
          let s1684 = @tactics.mp_tac(x1683)
          fn(
            x1685 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1684(x1685)
          }
        },
      )(t1687),
      t1710,
    ),
    t1726,
  ])
  let t1677 = @term_syntax.parse_term("(m : Num)")
  let t1678 = @bool.specl(
    @list.List([@term_syntax.parse_term("(N : Num)"), t1677]),
    @arith.le_cases(),
  )
  let t1679 = @tactics.disj_cases_then2(
    fn(
      x1671 : @kernel.Thm,
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
      let s1672 = @tactics.assume_tac(x1671)
      fn(
        x1673 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1672(x1673)
      }
    },
    fn(
      x1674 : @kernel.Thm,
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
      let s1675 = @tactics.mp_tac(x1674)
      fn(
        x1676 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1675(x1676)
      }
    },
  )(t1678)
  let t1670 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1669 = @tactics.exists_tac(@term_syntax.parse_term("(B : Num)"))
  let t1668 = @tactics.exists_tac(@term_syntax.parse_term("(A : Num) + (B0 : Num)"))
  let t1667 = @simp.rewrite_tac(@list.List([dist_refl()]))
  let t1666 = @tactics.match_mp_tac(bounds_notzero())
  let t1663 = @term_syntax.parse_term("(B : Num)")
  let t1665 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(A : Num)"))((x1664 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1663, x1664)
    }),
  )
  let t1660 = @drule.match_mp(nadd_mul_linv_lemma7a())
  let t1657 = @term_syntax.parse_term("(N : Num)")
  let t1662 = @tactics.first_assum(fn(
    x1661 : @kernel.Thm,
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
      x1659 : @kernel.Thm,
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
        x1654 : @kernel.Thm,
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
        let s1655 = @tactics.mp_tac(x1654)
        fn(
          x1656 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1655(x1656)
        }
      })(((x1658 : @kernel.Thm) => @bool.spec(t1657, x1658))(x1659))
    })(t1660(x1661))
  })
  let t1651 = @term_syntax.parse_term("(N : Num)")
  let t1653 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(B0 : Num)"))((x1652 : @kernel.Thm) => {
      @tactics.x_choose_tac(t1651, x1652)
    }),
  )
  let t1648 = @drule.match_mp(nadd_mul_linv_lemma7())
  let t1650 = @tactics.first_assum(fn(
    x1649 : @kernel.Thm,
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
      x1645 : @kernel.Thm,
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
      let s1646 = @tactics.mp_tac(x1645)
      fn(
        x1647 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1646(x1647)
      }
    })(t1648(x1649))
  })
  let t1728 = @tactics.thenl(
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
                        @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
                        t1650,
                      ),
                      t1653,
                    ),
                    t1662,
                  ),
                  t1665,
                ),
                t1666,
              ),
              t1667,
            ),
            t1668,
          ),
          t1669,
        ),
        t1670,
      ),
      t1679,
    ),
    t1727,
  )
  nadd_mul_linv_lemma8_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → (∃ B : Num, ∀ m : Num, ∀ n : Num, dist((m * nadd_rinv(x, n), n * nadd_rinv(x, m))) <= B * (m + n))"),
      t1728,
    ),
  )
}

///|
let nadd_mul_linv_lemma8_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_MUL_LINV_LEMMA8",
)

///|
/// `NADD_MUL_LINV_LEMMA8`
pub fn nadd_mul_linv_lemma8() -> @kernel.Thm {
  nadd_mul_linv_lemma8_c.get()
}

///|
/// nadd_inv
fn step_126() -> Unit raise {
  nadd_inv_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(nadd_inv : (Nadd) -> Nadd)((x : Nadd)) == (if nadd_eq(x, nadd_of_num(0)) { nadd_of_num(0) } else { mk_nadd(nadd_rinv(x)) })"),
    ),
  )
}

///|
let nadd_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("nadd_inv")

///|
/// `nadd_inv`
pub fn nadd_inv() -> @kernel.Thm {
  nadd_inv_c.get()
}

///|
/// realax.ml:1186
fn step_127() -> Unit raise {
  @preterm.override_interface("inv", @term_syntax.parse_term("nadd_inv"))
}

///|
/// NADD_INV
fn step_128() -> Unit raise {
  let t1736 = @tactics.pop_assum(fn(
    x1733 : @kernel.Thm,
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
    let s1734 = @tactics.accept_tac(x1733)
    fn(
      x1735 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1734(x1735)
    }
  })
  let t1732 = @tactics.match_mp_tac(nadd_mul_linv_lemma8())
  let t1731 = @simp.rewrite_tac(
    @list.List([@equal.gsym(nadd_rep()), is_nadd()]),
  )
  let t1730 = @simp.asm_rewrite_tac(
    @list.List([nadd_of_num_v1(), @arith.mult_clauses()]),
  )
  let t1729 = @class.asm_cases_tac(@term_syntax.parse_term("nadd_eq((x : Nadd), nadd_of_num(0))"))
  let t1737 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.gen_tac,
              @simp.rewrite_tac(@list.List([nadd_inv()])),
            ),
            t1729,
          ),
          t1730,
        ),
        t1731,
      ),
      t1732,
    ),
    t1736,
  )
  nadd_inv_v1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, dest_nadd(inv(x)) == (if nadd_eq(x, nadd_of_num(0)) { (n : Num) => 0 } else { nadd_rinv(x) })"),
      t1737,
    ),
  )
}

///|
let nadd_inv_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_INV")

///|
/// `NADD_INV`
pub fn nadd_inv_v1() -> @kernel.Thm {
  nadd_inv_v1_c.get()
}

///|
/// NADD_MUL_LINV
fn step_129() -> Unit raise {
  let t1791 = @simp.asm_rewrite_tac(@list.List([nadd_inv_v1()]))
  let t1790 = @simp.gen_rewrite_tac(
    fn(
      x1789 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1785 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x1779 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1780 = @equal.land_conv(x1779)
          fn(x1781 : @kernel.Term) -> @kernel.Thm raise { s1780(x1781) }
        })(
          (fn(
            x1782 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1783 = @equal.rand_conv(x1782)
            fn(x1784 : @kernel.Term) -> @kernel.Thm raise { s1783(x1784) }
          })(x1785),
        )
      })(
        (fn(
          x1786 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1787 = @equal.land_conv(x1786)
          fn(x1788 : @kernel.Term) -> @kernel.Thm raise { s1787(x1788) }
        })(x1789),
      )
    },
    @list.List([@arith.mult_sym()]),
  )
  let t1778 = @simp.asm_rewrite_tac(@list.List([]))
  let t1777 = @tactics.match_mp_tac(@arith.le_add2())
  let t1775 = @term_syntax.parse_term("(a : Num) + (b : Num) + ((c : Num) + (d : Num)) == a + c + (b + d)")
  let t1776 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(@arith.add_ac())(t1775)]),
  )
  let t1774 = @simp.rewrite_tac(@list.List([@arith.right_add_distrib()]))
  let t1773 = @tactics.exists_tac(@term_syntax.parse_term("dest_nadd(inv((x : Nadd)), (n : Num)) * dest_nadd(x, n)"))
  let t1772 = @tactics.match_mp_tac(dist_triangle_le())
  let t1771 = @term_syntax.parse_term("(B1 : Num) + (B2 : Num)")
  let t1792 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.map_every(
                      fn(
                        x1768 : @kernel.Term,
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
                        let s1769 = @tactics.exists_tac(x1768)
                        fn(
                          x1770 : (
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
                          s1769(x1770)
                        }
                      },
                      @list.List([@term_syntax.parse_term("(A1 : Num) + (A2 : Num)"), t1771]),
                    ),
                    @tactics.gen_tac,
                  ),
                  t1772,
                ),
                t1773,
              ),
              t1774,
            ),
            t1776,
          ),
          t1777,
        ),
        t1778,
      ),
      t1790,
    ),
    t1791,
  )
  let t1767 = @simp.asm_rewrite_tac(@list.List([]))
  let t1766 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1765 = @simp.asm_rewrite_tac(@list.List([]))
  let t1764 = @tactics.exists_tac(@term_syntax.parse_term("dest_nadd((x : Nadd), (n : Num))"))
  let t1763 = @tactics.match_mp_tac(@arith.le_trans())
  let t1762 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1760 = @term_syntax.parse_term("(N : Num)")
  let t1761 = @tactics.map_every(
    fn(
      x1757 : @kernel.Term,
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
      let s1758 = @tactics.exists_tac(x1757)
      fn(
        x1759 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1758(x1759)
      }
    },
    @list.List([@term_syntax.parse_term("(B' : Num)"), t1760]),
  )
  let t1756 = @simp.once_rewrite_tac(@list.List([bounds_ignore()]))
  let t1793 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.exists_tac(@term_syntax.parse_term("(A' : Num)")),
                    t1756,
                  ),
                  t1761,
                ),
                t1762,
              ),
              t1763,
            ),
            t1764,
          ),
          t1765,
        ),
        t1766,
      ),
      t1767,
    ),
    t1792,
  ])
  let t1755 = @tactics.subgoal_then(
    @term_syntax.parse_term("∃ A2 : Num, ∃ B2 : Num, ∀ n : Num, dist((dest_nadd((x : Nadd), n) * nadd_rinv(x, n), n * n)) <= A2 * n + B2"),
    @tactics.strip_assume_tac,
  )
  let t1753 = @bool.spec(@term_syntax.parse_term("(x : Nadd)"), nadd_bound())
  let t1751 = @term_syntax.parse_term("(B' : Num)")
  let t1754 = @tactics.x_choose_then(@term_syntax.parse_term("(A' : Num)"))((
    x1752 : @kernel.Thm,
  ) => @tactics.x_choose_tac(t1751, x1752))(t1753)
  let t1748 = @drule.match_mp(nadd_mul_linv_lemma2())
  let t1746 = @term_syntax.parse_term("(N : Num)")
  let t1750 = @tactics.first_assum(fn(
    x1749 : @kernel.Thm,
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
    ((x1747 : @kernel.Thm) => @tactics.x_choose_tac(t1746, x1747))(t1748(x1749))
  })
  let t1745 = @simp.rewrite_tac(
    @list.List([dist_lmul(), nadd_of_num_v1(), @arith.mult_clauses()]),
  )
  let t1742 = @term_syntax.parse_term("(x : Nadd)")
  let t1743 = @bool.specl(
    @list.List([@term_syntax.parse_term("inv((x : Nadd))"), t1742]),
    nadd_altmul(),
  )
  let t1740 = @term_syntax.parse_term("(B1 : Num)")
  let t1744 = @tactics.x_choose_then(@term_syntax.parse_term("(A1 : Num)"))((
    x1741 : @kernel.Thm,
  ) => @tactics.x_choose_tac(t1740, x1741))(t1743)
  let t1739 = @simp.once_rewrite_tac(@list.List([bounds_divided()]))
  let t1738 = @simp.rewrite_tac(@list.List([nadd_eq(), nadd_mul_v1()]))
  let t1794 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac),
                  t1738,
                ),
                t1739,
              ),
              t1744,
            ),
            t1745,
          ),
          t1750,
        ),
        t1754,
      ),
      t1755,
    ),
    t1793,
  )
  nadd_mul_linv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, !nadd_eq(x, nadd_of_num(0)) → nadd_eq(nadd_mul(inv(x), x), nadd_of_num(1))"),
      t1794,
    ),
  )
}

///|
let nadd_mul_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_MUL_LINV")

///|
/// `NADD_MUL_LINV`
pub fn nadd_mul_linv() -> @kernel.Thm {
  nadd_mul_linv_c.get()
}

///|
/// NADD_INV_0
fn step_130() -> Unit raise {
  let t1795 = @simp.rewrite_tac(@list.List([nadd_inv(), nadd_eq_refl()]))
  nadd_inv_0_c.set(@tactics.prove(@term_syntax.parse_term("nadd_eq(inv(nadd_of_num(0)), nadd_of_num(0))"), t1795))
}

///|
let nadd_inv_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NADD_INV_0")

///|
/// `NADD_INV_0`
pub fn nadd_inv_0() -> @kernel.Thm {
  nadd_inv_0_c.get()
}

///|
/// NADD_INV_WELLDEF
fn step_131() -> Unit raise {
  let tac : (@kernel.Term) -> ((@list.List[@kernel.Thm]) -> ((
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
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise) raise = fn(
    x1796 : @kernel.Term,
  ) -> ((@list.List[@kernel.Thm]) -> ((
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
    @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)],
    (
      (
        @list.List[(Int64, @kernel.Term)],
        @list.List[(@kernel.Term, @kernel.Term)],
        @list.List[(@kernel.HolType, @kernel.HolType)],
      ),
      @list.List[@kernel.Thm],
    ) -> @kernel.Thm raise,
  ) raise) raise) raise {
    let tm = x1796
    fn(
      x1797 : @list.List[@kernel.Thm],
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
      let ths = x1797
      let t1800 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(ths)])
      let t1799 = @tactics.exists_tac(tm)
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(nadd_eq_trans()), t1799),
          @tactics.conj_tac,
        ),
        t1800,
      )
    }
  }
  let t1817 = @meson.asm_meson_tac(
    @list.List([
      nadd_mul_linv(),
      nadd_mul_welldef(),
      nadd_eq_refl(),
      nadd_mul_lid(),
      nadd_eq_trans(),
      nadd_eq_sym(),
    ]),
  )
  let t1816 = tac(@term_syntax.parse_term("nadd_mul(nadd_mul(inv((y : Nadd)), y), inv((x : Nadd)))"))(
    @list.List([
      nadd_mul_assoc(),
      nadd_mul_sym(),
      nadd_eq_trans(),
      nadd_mul_welldef(),
      nadd_eq_refl(),
    ]),
  )
  let t1815 = tac(@term_syntax.parse_term("nadd_mul(inv((y : Nadd)), nadd_mul(inv((x : Nadd)), y))"))(
    @list.List([nadd_mul_welldef(), nadd_eq_refl(), nadd_eq_sym()]),
  )
  let t1814 = tac(@term_syntax.parse_term("nadd_mul(inv((y : Nadd)), nadd_mul(inv((x : Nadd)), x))"))(
    @list.List([nadd_mul_linv(), nadd_mul_welldef(), nadd_eq_refl()]),
  )
  let t1813 = tac(@term_syntax.parse_term("nadd_mul(inv((y : Nadd)), nadd_of_num(1))"))(
    @list.List([nadd_mul_sym(), nadd_mul_lid(), nadd_eq_trans()]),
  )
  let t1810 = @list.List([
    @meson.asm_meson_tac(@list.List([nadd_eq_trans(), nadd_eq_sym()])),
    @tactics.all_tac,
  ])
  let t1811 = @tactics.thenl(
    @tactics.subgoal_then(@term_syntax.parse_term("!nadd_eq((y : Nadd), nadd_of_num(0))"), fn(
      x1807 : @kernel.Thm,
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
      let s1808 = @tactics.assume_tac(x1807)
      fn(
        x1809 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1808(x1809)
      }
    }),
    t1810,
  )
  let t1805 = @simp.asm_rewrite_tac(@list.List([nadd_inv(), nadd_eq_refl()]))
  let t1806 = @list.List([
    @meson.asm_meson_tac(@list.List([nadd_eq_trans(), nadd_eq_sym()])),
    t1805,
  ])
  let t1812 = @list.List([
    @tactics.thenl(
      @tactics.subgoal_then(@term_syntax.parse_term("nadd_eq((y : Nadd), nadd_of_num(0))"), fn(
        x1802 : @kernel.Thm,
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
        let s1803 = @tactics.assume_tac(x1802)
        fn(
          x1804 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1803(x1804)
        }
      }),
      t1806,
    ),
    t1811,
  ])
  let t1801 = @class.asm_cases_tac(@term_syntax.parse_term("nadd_eq((x : Nadd), nadd_of_num(0))"))
  let t1818 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.thenl(
              @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1801),
              t1812,
            ),
            t1813,
          ),
          t1814,
        ),
        t1815,
      ),
      t1816,
    ),
    t1817,
  )
  nadd_inv_welldef_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : Nadd, ∀ y : Nadd, nadd_eq(x, y) → nadd_eq(inv(x), inv(y))"),
      t1818,
    ),
  )
}

///|
let nadd_inv_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "NADD_INV_WELLDEF",
)

///|
/// `NADD_INV_WELLDEF`
pub fn nadd_inv_welldef() -> @kernel.Thm {
  nadd_inv_welldef_c.get()
}

///|
/// hreal_tybij
fn step_132() -> Unit raise {
  hreal_tybij_c.set(
    @quot.define_quotient_type(
      "hreal",
      ("mk_hreal", "dest_hreal"),
      @term_syntax.parse_term("nadd_eq"),
    ),
  )
}

///|
let hreal_tybij_c : @lib.Cell[(@kernel.Thm, @kernel.Thm)] = @lib.Cell::new(
  "hreal_tybij",
)

///|
/// `hreal_tybij`
pub fn hreal_tybij() -> (@kernel.Thm, @kernel.Thm) {
  hreal_tybij_c.get()
}

///|
/// realax.ml:1260
fn step_133() -> Unit raise {
  let t1820 = ("<=", @term_syntax.parse_term("(hreal_le : (Hreal, Hreal) -> Bool)"))
  let t1821 = ("*", @term_syntax.parse_term("(hreal_mul : (Hreal, Hreal) -> Hreal)"))
  @lib.do_list(
    fn(x1819 : (String, @kernel.Term)) -> Unit raise {
      @preterm.overload_interface(x1819.0, x1819.1)
    },
    @list.List([
      ("+", @term_syntax.parse_term("(hreal_add : (Hreal, Hreal) -> Hreal)")),
      t1821,
      t1820,
    ]),
  )
}

///|
/// realax.ml:1265
fn step_134() -> Unit raise {
  let t1823 = ("inv", @term_syntax.parse_term("(hreal_inv : (Hreal) -> Hreal)"))
  @lib.do_list(
    fn(x1822 : (String, @kernel.Term)) -> Unit raise {
      @preterm.override_interface(x1822.0, x1822.1)
    },
    @list.List([("&", @term_syntax.parse_term("(hreal_of_num : (Num) -> Hreal)")), t1823]),
  )
}

///|
let hreal_of_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hreal_of_num")

///|
/// `hreal_of_num`
pub fn hreal_of_num() -> @kernel.Thm {
  hreal_of_num_c.get()
}

///|
let hreal_of_num_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "hreal_of_num_th",
)

///|
/// `hreal_of_num_th`
pub fn hreal_of_num_th() -> @kernel.Thm {
  hreal_of_num_th_c.get()
}

///|
/// hreal_of_num, hreal_of_num_th
fn step_135() -> Unit raise {
  let (hreal_of_num, hreal_of_num_th) = @quot.lift_function(hreal_tybij().1)(
    (nadd_eq_refl(), nadd_eq_trans()),
  )("hreal_of_num")(nadd_of_num_welldef())
  hreal_of_num_c.set(hreal_of_num)
  hreal_of_num_th_c.set(hreal_of_num_th)
}

///|
let hreal_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hreal_add")

///|
/// `hreal_add`
pub fn hreal_add() -> @kernel.Thm {
  hreal_add_c.get()
}

///|
let hreal_add_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hreal_add_th")

///|
/// `hreal_add_th`
pub fn hreal_add_th() -> @kernel.Thm {
  hreal_add_th_c.get()
}

///|
/// hreal_add, hreal_add_th
fn step_136() -> Unit raise {
  let (hreal_add, hreal_add_th) = @quot.lift_function(hreal_tybij().1)(
    (nadd_eq_refl(), nadd_eq_trans()),
  )("hreal_add")(nadd_add_welldef())
  hreal_add_c.set(hreal_add)
  hreal_add_th_c.set(hreal_add_th)
}

///|
let hreal_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hreal_mul")

///|
/// `hreal_mul`
pub fn hreal_mul() -> @kernel.Thm {
  hreal_mul_c.get()
}

///|
let hreal_mul_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hreal_mul_th")

///|
/// `hreal_mul_th`
pub fn hreal_mul_th() -> @kernel.Thm {
  hreal_mul_th_c.get()
}

///|
/// hreal_mul, hreal_mul_th
fn step_137() -> Unit raise {
  let (hreal_mul, hreal_mul_th) = @quot.lift_function(hreal_tybij().1)(
    (nadd_eq_refl(), nadd_eq_trans()),
  )("hreal_mul")(nadd_mul_welldef())
  hreal_mul_c.set(hreal_mul)
  hreal_mul_th_c.set(hreal_mul_th)
}

///|
let hreal_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hreal_le")

///|
/// `hreal_le`
pub fn hreal_le() -> @kernel.Thm {
  hreal_le_c.get()
}

///|
let hreal_le_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hreal_le_th")

///|
/// `hreal_le_th`
pub fn hreal_le_th() -> @kernel.Thm {
  hreal_le_th_c.get()
}

///|
/// hreal_le, hreal_le_th
fn step_138() -> Unit raise {
  let (hreal_le, hreal_le_th) = @quot.lift_function(hreal_tybij().1)(
    (nadd_eq_refl(), nadd_eq_trans()),
  )("hreal_le")(nadd_le_welldef())
  hreal_le_c.set(hreal_le)
  hreal_le_th_c.set(hreal_le_th)
}

///|
let hreal_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hreal_inv")

///|
/// `hreal_inv`
pub fn hreal_inv() -> @kernel.Thm {
  hreal_inv_c.get()
}

///|
let hreal_inv_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hreal_inv_th")

///|
/// `hreal_inv_th`
pub fn hreal_inv_th() -> @kernel.Thm {
  hreal_inv_th_c.get()
}

///|
/// hreal_inv, hreal_inv_th
fn step_139() -> Unit raise {
  let (hreal_inv, hreal_inv_th) = @quot.lift_function(hreal_tybij().1)(
    (nadd_eq_refl(), nadd_eq_trans()),
  )("hreal_inv")(nadd_inv_welldef())
  hreal_inv_c.set(hreal_inv)
  hreal_inv_th_c.set(hreal_inv_th)
}

///|
/// HREAL_COMPLETE
fn step_140() -> Unit raise {
  let th1 = @kernel.assume_rule(
    @term_syntax.parse_term("(P : (Nadd) -> Bool) == ((x : Nadd) => (Q : (Hreal) -> Bool)(mk_hreal(nadd_eq(x))))"),
  )
  let th2 = @equal.beta_rule(@equal.ap_thm(th1, @term_syntax.parse_term("(x : Nadd)")))
  let t1824 = @bool.spec_all(nadd_complete())
  let th3 = @quot.lift_theorem(hreal_tybij())(
    (nadd_eq_refl(), nadd_eq_sym(), nadd_eq_trans()),
  )(
    @list.List([
      hreal_of_num_th(),
      hreal_add_th(),
      hreal_mul_th(),
      hreal_le_th(),
      th2,
    ]),
  )(t1824)
  let t1825 = @kernel.refl(@term_syntax.parse_term("(x : Nadd) => (Q : (Hreal) -> Bool)(mk_hreal(nadd_eq(x)))"))
  let th4 = @drule.match_mp(@bool.disch_all(th3))(t1825)
  let t1826 = @bool.gen_all(th4)
  hreal_complete_c.set(
    @equal.conv_rule(
      @equal.gen_alpha_conv(@term_syntax.parse_term("(P : (Hreal) -> Bool)")),
      t1826,
    ),
  )
}

///|
let hreal_complete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_COMPLETE")

///|
/// `HREAL_COMPLETE`
pub fn hreal_complete() -> @kernel.Thm {
  hreal_complete_c.get()
}

///|
let hreal_of_num_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_OF_NUM_EQ",
)

///|
/// `HREAL_OF_NUM_EQ`
pub fn hreal_of_num_eq() -> @kernel.Thm {
  hreal_of_num_eq_c.get()
}

///|
let hreal_of_num_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_OF_NUM_LE",
)

///|
/// `HREAL_OF_NUM_LE`
pub fn hreal_of_num_le() -> @kernel.Thm {
  hreal_of_num_le_c.get()
}

///|
let hreal_of_num_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_OF_NUM_ADD",
)

///|
/// `HREAL_OF_NUM_ADD`
pub fn hreal_of_num_add() -> @kernel.Thm {
  hreal_of_num_add_c.get()
}

///|
let hreal_of_num_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_OF_NUM_MUL",
)

///|
/// `HREAL_OF_NUM_MUL`
pub fn hreal_of_num_mul() -> @kernel.Thm {
  hreal_of_num_mul_c.get()
}

///|
let hreal_le_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_LE_REFL")

///|
/// `HREAL_LE_REFL`
pub fn hreal_le_refl() -> @kernel.Thm {
  hreal_le_refl_c.get()
}

///|
let hreal_le_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_LE_TRANS")

///|
/// `HREAL_LE_TRANS`
pub fn hreal_le_trans() -> @kernel.Thm {
  hreal_le_trans_c.get()
}

///|
let hreal_le_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_LE_ANTISYM",
)

///|
/// `HREAL_LE_ANTISYM`
pub fn hreal_le_antisym() -> @kernel.Thm {
  hreal_le_antisym_c.get()
}

///|
let hreal_le_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_LE_TOTAL")

///|
/// `HREAL_LE_TOTAL`
pub fn hreal_le_total() -> @kernel.Thm {
  hreal_le_total_c.get()
}

///|
let hreal_le_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_LE_ADD")

///|
/// `HREAL_LE_ADD`
pub fn hreal_le_add() -> @kernel.Thm {
  hreal_le_add_c.get()
}

///|
let hreal_le_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_LE_EXISTS",
)

///|
/// `HREAL_LE_EXISTS`
pub fn hreal_le_exists() -> @kernel.Thm {
  hreal_le_exists_c.get()
}

///|
let hreal_arch_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_ARCH")

///|
/// `HREAL_ARCH`
pub fn hreal_arch() -> @kernel.Thm {
  hreal_arch_c.get()
}

///|
let hreal_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_ADD_SYM")

///|
/// `HREAL_ADD_SYM`
pub fn hreal_add_sym() -> @kernel.Thm {
  hreal_add_sym_c.get()
}

///|
let hreal_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_ADD_ASSOC",
)

///|
/// `HREAL_ADD_ASSOC`
pub fn hreal_add_assoc() -> @kernel.Thm {
  hreal_add_assoc_c.get()
}

///|
let hreal_add_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_ADD_LID")

///|
/// `HREAL_ADD_LID`
pub fn hreal_add_lid() -> @kernel.Thm {
  hreal_add_lid_c.get()
}

///|
let hreal_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_ADD_LCANCEL",
)

///|
/// `HREAL_ADD_LCANCEL`
pub fn hreal_add_lcancel() -> @kernel.Thm {
  hreal_add_lcancel_c.get()
}

///|
let hreal_mul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_MUL_SYM")

///|
/// `HREAL_MUL_SYM`
pub fn hreal_mul_sym() -> @kernel.Thm {
  hreal_mul_sym_c.get()
}

///|
let hreal_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_MUL_ASSOC",
)

///|
/// `HREAL_MUL_ASSOC`
pub fn hreal_mul_assoc() -> @kernel.Thm {
  hreal_mul_assoc_c.get()
}

///|
let hreal_mul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_MUL_LID")

///|
/// `HREAL_MUL_LID`
pub fn hreal_mul_lid() -> @kernel.Thm {
  hreal_mul_lid_c.get()
}

///|
let hreal_add_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_ADD_LDISTRIB",
)

///|
/// `HREAL_ADD_LDISTRIB`
pub fn hreal_add_ldistrib() -> @kernel.Thm {
  hreal_add_ldistrib_c.get()
}

///|
let hreal_mul_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_MUL_LINV")

///|
/// `HREAL_MUL_LINV`
pub fn hreal_mul_linv() -> @kernel.Thm {
  hreal_mul_linv_c.get()
}

///|
let hreal_inv_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_INV_0")

///|
/// `HREAL_INV_0`
pub fn hreal_inv_0() -> @kernel.Thm {
  hreal_inv_0_c.get()
}

///|
/// HREAL_OF_NUM_EQ, HREAL_OF_NUM_LE, HREAL_OF_NUM_ADD, HREAL_OF_NUM_MUL, HREAL_LE_REFL, HREAL_LE_TRANS, HREAL_LE_ANTISYM, HREAL_LE_TOTAL, HREAL_LE_ADD, HREAL_LE_EXISTS, HREAL_ARCH, HREAL_ADD_SYM, HREAL_ADD_ASSOC, HREAL_ADD_LID, HREAL_ADD_LCANCEL, HREAL_MUL_SYM, HREAL_MUL_ASSOC, HREAL_MUL_LID, HREAL_ADD_LDISTRIB, HREAL_MUL_LINV, HREAL_INV_0
fn step_141() -> Unit raise {
  match
    @lib.map(
      @quot.lift_theorem(hreal_tybij())(
        (nadd_eq_refl(), nadd_eq_sym(), nadd_eq_trans()),
      )(
        @list.List([
          hreal_of_num_th(),
          hreal_add_th(),
          hreal_mul_th(),
          hreal_le_th(),
          hreal_inv_th(),
        ]),
      ),
      @list.List([
        nadd_of_num_eq(),
        nadd_of_num_le(),
        nadd_of_num_add(),
        nadd_of_num_mul(),
        nadd_le_refl(),
        nadd_le_trans(),
        nadd_le_antisym(),
        nadd_le_total(),
        nadd_le_add(),
        nadd_le_exists(),
        nadd_arch(),
        nadd_add_sym(),
        nadd_add_assoc(),
        nadd_add_lid(),
        nadd_add_lcancel(),
        nadd_mul_sym(),
        nadd_mul_assoc(),
        nadd_mul_lid(),
        nadd_ldistrib(),
        nadd_mul_linv(),
        nadd_inv_0(),
      ]),
    ) {
    More(
      hreal_of_num_eq,
      tail=More(
        hreal_of_num_le,
        tail=More(
          hreal_of_num_add,
          tail=More(
            hreal_of_num_mul,
            tail=More(
              hreal_le_refl,
              tail=More(
                hreal_le_trans,
                tail=More(
                  hreal_le_antisym,
                  tail=More(
                    hreal_le_total,
                    tail=More(
                      hreal_le_add,
                      tail=More(
                        hreal_le_exists,
                        tail=More(
                          hreal_arch,
                          tail=More(
                            hreal_add_sym,
                            tail=More(
                              hreal_add_assoc,
                              tail=More(
                                hreal_add_lid,
                                tail=More(
                                  hreal_add_lcancel,
                                  tail=More(
                                    hreal_mul_sym,
                                    tail=More(
                                      hreal_mul_assoc,
                                      tail=More(
                                        hreal_mul_lid,
                                        tail=More(
                                          hreal_add_ldistrib,
                                          tail=More(
                                            hreal_mul_linv,
                                            tail=More(hreal_inv_0, tail=Empty)
                                          )
                                        )
                                      )
                                    )
                                  )
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    ) => {
      hreal_of_num_eq_c.set(hreal_of_num_eq)
      hreal_of_num_le_c.set(hreal_of_num_le)
      hreal_of_num_add_c.set(hreal_of_num_add)
      hreal_of_num_mul_c.set(hreal_of_num_mul)
      hreal_le_refl_c.set(hreal_le_refl)
      hreal_le_trans_c.set(hreal_le_trans)
      hreal_le_antisym_c.set(hreal_le_antisym)
      hreal_le_total_c.set(hreal_le_total)
      hreal_le_add_c.set(hreal_le_add)
      hreal_le_exists_c.set(hreal_le_exists)
      hreal_arch_c.set(hreal_arch)
      hreal_add_sym_c.set(hreal_add_sym)
      hreal_add_assoc_c.set(hreal_add_assoc)
      hreal_add_lid_c.set(hreal_add_lid)
      hreal_add_lcancel_c.set(hreal_add_lcancel)
      hreal_mul_sym_c.set(hreal_mul_sym)
      hreal_mul_assoc_c.set(hreal_mul_assoc)
      hreal_mul_lid_c.set(hreal_mul_lid)
      hreal_add_ldistrib_c.set(hreal_add_ldistrib)
      hreal_mul_linv_c.set(hreal_mul_linv)
      hreal_inv_0_c.set(hreal_inv_0)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:1299:4")
  }
}

///|
/// HREAL_LE_EXISTS_DEF
fn step_142() -> Unit raise {
  let t1832 = @simp.rewrite_tac(@list.List([hreal_le_add()]))
  let t1831 = @tactics.disch_then(
    @tactics.choose_then(fn(
      x1828 : @kernel.Thm,
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
      let s1829 = @tactics.subst1_tac(x1828)
      fn(
        x1830 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1829(x1830)
      }
    }),
  )
  let t1827 = @simp.rewrite_tac(@list.List([hreal_le_exists()]))
  let t1833 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.eq_tac,
        ),
        t1827,
      ),
      t1831,
    ),
    t1832,
  )
  hreal_le_exists_def_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Hreal, ∀ n : Hreal, (m <= n) == (∃ d : Hreal, n == m + d)"), t1833),
  )
}

///|
let hreal_le_exists_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_LE_EXISTS_DEF",
)

///|
/// `HREAL_LE_EXISTS_DEF`
pub fn hreal_le_exists_def() -> @kernel.Thm {
  hreal_le_exists_def_c.get()
}

///|
/// HREAL_EQ_ADD_LCANCEL
fn step_143() -> Unit raise {
  let t1838 = @tactics.disch_then(fn(
    x1835 : @kernel.Thm,
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
    let s1836 = @tactics.subst1_tac(x1835)
    fn(
      x1837 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1836(x1837)
    }
  })
  let t1834 = @simp.rewrite_tac(@list.List([hreal_add_lcancel()]))
  let t1839 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.repeat_tac(@tactics.gen_tac),
          @tactics.eq_tac,
        ),
        t1834,
      ),
      t1838,
    ),
    @tactics.refl_tac,
  )
  hreal_eq_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Hreal, ∀ n : Hreal, ∀ p : Hreal, (m + n == m + p) == (n == p)"),
      t1839,
    ),
  )
}

///|
let hreal_eq_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_EQ_ADD_LCANCEL",
)

///|
/// `HREAL_EQ_ADD_LCANCEL`
pub fn hreal_eq_add_lcancel() -> @kernel.Thm {
  hreal_eq_add_lcancel_c.get()
}

///|
/// HREAL_EQ_ADD_RCANCEL
fn step_144() -> Unit raise {
  let t1840 = @simp.rewrite_tac(@list.List([hreal_eq_add_lcancel()]))
  let t1841 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([hreal_add_sym()])),
    t1840,
  )
  hreal_eq_add_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Hreal, ∀ n : Hreal, ∀ p : Hreal, (m + p == n + p) == (m == n)"),
      t1841,
    ),
  )
}

///|
let hreal_eq_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_EQ_ADD_RCANCEL",
)

///|
/// `HREAL_EQ_ADD_RCANCEL`
pub fn hreal_eq_add_rcancel() -> @kernel.Thm {
  hreal_eq_add_rcancel_c.get()
}

///|
/// HREAL_LE_ADD_LCANCEL
fn step_145() -> Unit raise {
  let t1842 = @simp.rewrite_tac(
    @list.List([
      hreal_le_exists_def(),
      @equal.gsym(hreal_add_assoc()),
      hreal_eq_add_lcancel(),
    ]),
  )
  hreal_le_add_lcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Hreal, ∀ n : Hreal, ∀ p : Hreal, (m + n <= m + p) == (n <= p)"),
      t1842,
    ),
  )
}

///|
let hreal_le_add_lcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_LE_ADD_LCANCEL",
)

///|
/// `HREAL_LE_ADD_LCANCEL`
pub fn hreal_le_add_lcancel() -> @kernel.Thm {
  hreal_le_add_lcancel_c.get()
}

///|
/// HREAL_LE_ADD_RCANCEL
fn step_146() -> Unit raise {
  let t1843 = @tactics.match_accept_tac(hreal_le_add_lcancel())
  let t1844 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([hreal_add_sym()])),
    t1843,
  )
  hreal_le_add_rcancel_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Hreal, ∀ n : Hreal, ∀ p : Hreal, (m + p <= n + p) == (m <= n)"),
      t1844,
    ),
  )
}

///|
let hreal_le_add_rcancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_LE_ADD_RCANCEL",
)

///|
/// `HREAL_LE_ADD_RCANCEL`
pub fn hreal_le_add_rcancel() -> @kernel.Thm {
  hreal_le_add_rcancel_c.get()
}

///|
/// HREAL_ADD_RID
fn step_147() -> Unit raise {
  let t1845 = @tactics.match_accept_tac(hreal_add_lid())
  let t1846 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([hreal_add_sym()])),
    t1845,
  )
  hreal_add_rid_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ n : Hreal, n + hreal_of_num(0) == n"), t1846),
  )
}

///|
let hreal_add_rid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_ADD_RID")

///|
/// `HREAL_ADD_RID`
pub fn hreal_add_rid() -> @kernel.Thm {
  hreal_add_rid_c.get()
}

///|
/// HREAL_ADD_RDISTRIB
fn step_148() -> Unit raise {
  let t1847 = @tactics.match_accept_tac(hreal_add_ldistrib())
  let t1848 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([hreal_mul_sym()])),
    t1847,
  )
  hreal_add_rdistrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Hreal, ∀ n : Hreal, ∀ p : Hreal, (m + n) * p == m * p + n * p"),
      t1848,
    ),
  )
}

///|
let hreal_add_rdistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_ADD_RDISTRIB",
)

///|
/// `HREAL_ADD_RDISTRIB`
pub fn hreal_add_rdistrib() -> @kernel.Thm {
  hreal_add_rdistrib_c.get()
}

///|
/// HREAL_MUL_LZERO
fn step_149() -> Unit raise {
  let t1862 = @tactics.disch_then(fn(
    x1861 : @kernel.Thm,
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
      x1858 : @kernel.Thm,
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
      let s1859 = @tactics.accept_tac(x1858)
      fn(
        x1860 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1859(x1860)
      }
    })(@equal.sym(x1861))
  })
  let t1857 = @simp.rewrite_tac(@list.List([hreal_eq_add_rcancel()]))
  let t1856 = @simp.gen_rewrite_tac(
    (x1855 : (@kernel.Term) -> @kernel.Thm raise) => {
      @lib.funpow(
        2,
        fn(
          x1852 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1853 = @equal.land_conv(x1852)
          fn(x1854 : @kernel.Term) -> @kernel.Thm raise { s1853(x1854) }
        },
        x1855,
      )
    },
    @list.List([@equal.gsym(hreal_add_lid())]),
  )
  let t1851 = @simp.rewrite_tac(@list.List([hreal_add_lid()]))
  let t1849 = @term_syntax.parse_term("(m : Hreal)")
  let t1850 = @term_syntax.parse_term("hreal_of_num(1)")
  let t1863 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.gen_tac,
            @tactics.mp_tac(
              @bool.specl(
                @list.List([@term_syntax.parse_term("hreal_of_num(0)"), t1850, t1849]),
                hreal_add_rdistrib(),
              ),
            ),
          ),
          t1851,
        ),
        t1856,
      ),
      t1857,
    ),
    t1862,
  )
  hreal_mul_lzero_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Hreal, hreal_of_num(0) * m == hreal_of_num(0)"), t1863),
  )
}

///|
let hreal_mul_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_MUL_LZERO",
)

///|
/// `HREAL_MUL_LZERO`
pub fn hreal_mul_lzero() -> @kernel.Thm {
  hreal_mul_lzero_c.get()
}

///|
/// HREAL_MUL_RZERO
fn step_150() -> Unit raise {
  let t1864 = @tactics.match_accept_tac(hreal_mul_lzero())
  let t1865 = @tactics.then_tac(
    @simp.once_rewrite_tac(@list.List([hreal_mul_sym()])),
    t1864,
  )
  hreal_mul_rzero_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ m : Hreal, m * hreal_of_num(0) == hreal_of_num(0)"), t1865),
  )
}

///|
let hreal_mul_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_MUL_RZERO",
)

///|
/// `HREAL_MUL_RZERO`
pub fn hreal_mul_rzero() -> @kernel.Thm {
  hreal_mul_rzero_c.get()
}

///|
/// HREAL_ADD_AC
fn step_151() -> Unit raise {
  let t1866 = @tactics.match_accept_tac(hreal_add_sym())
  let t1867 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([
            hreal_add_assoc(),
            @bool.eqt_intro(@bool.spec_all(hreal_add_sym())),
          ]),
        ),
        @tactics.ap_thm_tac,
      ),
      @tactics.ap_term_tac,
    ),
    t1866,
  )
  hreal_add_ac_c.set(
    @tactics.prove(
      @term_syntax.parse_term("(m : Hreal) + (n : Hreal) == n + m && m + n + (p : Hreal) == m + (n + p) && m + (n + p) == n + (m + p)"),
      t1867,
    ),
  )
}

///|
let hreal_add_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_ADD_AC")

///|
/// `HREAL_ADD_AC`
pub fn hreal_add_ac() -> @kernel.Thm {
  hreal_add_ac_c.get()
}

///|
/// HREAL_LE_ADD2
fn step_152() -> Unit raise {
  let t1875 = @simp.asm_rewrite_tac(@list.List([hreal_add_ac()]))
  let t1874 = @tactics.exists_tac(@term_syntax.parse_term("(d1 : Hreal) + (d2 : Hreal)"))
  let t1871 = @term_syntax.parse_term("(d2 : Hreal)")
  let t1869 = @term_syntax.parse_term("(d1 : Hreal)")
  let t1873 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      (x1870 : @kernel.Thm) => @tactics.x_choose_tac(t1869, x1870),
      (x1872 : @kernel.Thm) => @tactics.x_choose_tac(t1871, x1872),
    ),
  )
  let t1868 = @simp.rewrite_tac(@list.List([hreal_le_exists_def()]))
  let t1876 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1868),
        t1873,
      ),
      t1874,
    ),
    t1875,
  )
  hreal_le_add2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Hreal, ∀ b : Hreal, ∀ c : Hreal, ∀ d : Hreal, a <= b && c <= d → a + c <= b + d"),
      t1876,
    ),
  )
}

///|
let hreal_le_add2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HREAL_LE_ADD2")

///|
/// `HREAL_LE_ADD2`
pub fn hreal_le_add2() -> @kernel.Thm {
  hreal_le_add2_c.get()
}

///|
/// HREAL_LE_MUL_RCANCEL_IMP
fn step_153() -> Unit raise {
  let t1883 = @simp.rewrite_tac(@list.List([hreal_add_rdistrib()]))
  let t1882 = @tactics.exists_tac(@term_syntax.parse_term("(d : Hreal) * (c : Hreal)"))
  let t1881 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(d : Hreal)"))(fn(
      x1878 : @kernel.Thm,
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
      let s1879 = @tactics.subst1_tac(x1878)
      fn(
        x1880 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1879(x1880)
      }
    }),
  )
  let t1877 = @simp.rewrite_tac(@list.List([hreal_le_exists_def()]))
  let t1884 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1877),
        t1881,
      ),
      t1882,
    ),
    t1883,
  )
  hreal_le_mul_rcancel_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ a : Hreal, ∀ b : Hreal, ∀ c : Hreal, a <= b → a * c <= b * c"),
      t1884,
    ),
  )
}

///|
let hreal_le_mul_rcancel_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "HREAL_LE_MUL_RCANCEL_IMP",
)

///|
/// `HREAL_LE_MUL_RCANCEL_IMP`
pub fn hreal_le_mul_rcancel_imp() -> @kernel.Thm {
  hreal_le_mul_rcancel_imp_c.get()
}

///|
/// treal_of_num
fn step_154() -> Unit raise {
  treal_of_num_c.set(
    @pair.new_definition(@term_syntax.parse_term("(treal_of_num : (Num) -> (Hreal, Hreal))((n : Num)) == (hreal_of_num(n), hreal_of_num(0))")),
  )
}

///|
let treal_of_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("treal_of_num")

///|
/// `treal_of_num`
pub fn treal_of_num() -> @kernel.Thm {
  treal_of_num_c.get()
}

///|
/// treal_neg
fn step_155() -> Unit raise {
  treal_neg_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(treal_neg : ((Hreal, Hreal)) -> (Hreal, Hreal))(((x : Hreal), (y : Hreal))) == (y, x)"),
    ),
  )
}

///|
let treal_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("treal_neg")

///|
/// `treal_neg`
pub fn treal_neg() -> @kernel.Thm {
  treal_neg_c.get()
}

///|
/// treal_add
fn step_156() -> Unit raise {
  treal_add_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(treal_add : ((Hreal, Hreal), (Hreal, Hreal)) -> (Hreal, Hreal))(((x1 : Hreal), (y1 : Hreal)), ((x2 : Hreal), (y2 : Hreal))) == (x1 + x2, y1 + y2)"),
    ),
  )
}

///|
let treal_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("treal_add")

///|
/// `treal_add`
pub fn treal_add() -> @kernel.Thm {
  treal_add_c.get()
}

///|
/// treal_mul
fn step_157() -> Unit raise {
  treal_mul_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(treal_mul : ((Hreal, Hreal), (Hreal, Hreal)) -> (Hreal, Hreal))(((x1 : Hreal), (y1 : Hreal)), ((x2 : Hreal), (y2 : Hreal))) == (x1 * x2 + y1 * y2, x1 * y2 + y1 * x2)"),
    ),
  )
}

///|
let treal_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("treal_mul")

///|
/// `treal_mul`
pub fn treal_mul() -> @kernel.Thm {
  treal_mul_c.get()
}

///|
/// treal_le
fn step_158() -> Unit raise {
  treal_le_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(treal_le : ((Hreal, Hreal), (Hreal, Hreal)) -> Bool)(((x1 : Hreal), (y1 : Hreal)), ((x2 : Hreal), (y2 : Hreal))) == (x1 + y2 <= x2 + y1)"),
    ),
  )
}

///|
let treal_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("treal_le")

///|
/// `treal_le`
pub fn treal_le() -> @kernel.Thm {
  treal_le_c.get()
}

///|
/// treal_inv
fn step_159() -> Unit raise {
  treal_inv_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(treal_inv : ((Hreal, Hreal)) -> (Hreal, Hreal))(((x : Hreal), (y : Hreal))) == (if x == y { (hreal_of_num(0), hreal_of_num(0)) } else { if y <= x { (inv(select((d : Hreal) => x == y + d)), hreal_of_num(0)) } else { (hreal_of_num(0), inv(select((d : Hreal) => y == x + d))) } })"),
    ),
  )
}

///|
let treal_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("treal_inv")

///|
/// `treal_inv`
pub fn treal_inv() -> @kernel.Thm {
  treal_inv_c.get()
}

///|
/// treal_eq
fn step_160() -> Unit raise {
  treal_eq_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(treal_eq : ((Hreal, Hreal), (Hreal, Hreal)) -> Bool)(((x1 : Hreal), (y1 : Hreal)), ((x2 : Hreal), (y2 : Hreal))) == (x1 + y2 == x2 + y1)"),
    ),
  )
}

///|
let treal_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("treal_eq")

///|
/// `treal_eq`
pub fn treal_eq() -> @kernel.Thm {
  treal_eq_c.get()
}

///|
/// TREAL_EQ_REFL
fn step_161() -> Unit raise {
  let t1885 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), treal_eq()]),
  )
  treal_eq_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : (Hreal, Hreal), treal_eq(x, x)"), t1885),
  )
}

///|
let treal_eq_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_EQ_REFL")

///|
/// `TREAL_EQ_REFL`
pub fn treal_eq_refl() -> @kernel.Thm {
  treal_eq_refl_c.get()
}

///|
/// TREAL_EQ_SYM
fn step_162() -> Unit raise {
  let t1886 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), treal_eq(), @theorems.eq_sym_eq()]),
  )
  treal_eq_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), treal_eq(x, y) == treal_eq(y, x)"),
      t1886,
    ),
  )
}

///|
let treal_eq_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_EQ_SYM")

///|
/// `TREAL_EQ_SYM`
pub fn treal_eq_sym() -> @kernel.Thm {
  treal_eq_sym_c.get()
}

///|
/// TREAL_EQ_TRANS
fn step_163() -> Unit raise {
  let t1914 = @simp.once_rewrite_rule(@list.List([hreal_add_sym()]))
  let t1916 = @tactics.disch_then(fn(
    x1915 : @kernel.Thm,
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
      x1911 : @kernel.Thm,
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
      let s1912 = @tactics.match_accept_tac(x1911)
      fn(
        x1913 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1912(x1913)
      }
    })(t1914(x1915))
  })
  let t1910 = @simp.rewrite_tac(
    @list.List([hreal_add_assoc(), hreal_eq_add_rcancel()]),
  )
  let t1909 = @simp.rewrite_tac(
    @list.List([@equal.gsym(hreal_add_assoc()), hreal_eq_add_lcancel()]),
  )
  let t1908 = @simp.gen_rewrite_tac(
    fn(
      x1907 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1901 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1902 = @equal.land_conv(x1901)
        fn(x1903 : @kernel.Term) -> @kernel.Thm raise { s1902(x1903) }
      })(
        (fn(
          x1904 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1905 = @equal.land_conv(x1904)
          fn(x1906 : @kernel.Term) -> @kernel.Thm raise { s1905(x1906) }
        })(x1907),
      )
    },
    @list.List([hreal_add_sym()]),
  )
  let t1893 = @term_syntax.parse_term("hreal_add")
  let t1900 = @tactics.disch_then(fn(
    x1899 : @kernel.Thm,
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
      x1898 : (@kernel.Thm, @kernel.Thm),
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
        x1892 : (@kernel.Thm, @kernel.Thm),
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
          x1888 : @kernel.Thm,
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
          let s1889 = @tactics.mp_tac(x1888)
          fn(
            x1890 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s1889(x1890)
          }
        })(
          (fn(x1891 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
            @kernel.mk_comb_rule(x1891.0, x1891.1)
          })(x1892),
        )
      })(
        (fn(
          x1896 : (@kernel.Thm, @kernel.Thm),
        ) -> (@kernel.Thm, @kernel.Thm) raise {
          let t1897 = (fn(x1895 : @kernel.Thm) -> @kernel.Thm raise { x1895 })(
            x1896.1,
          )
          (
            ((x1894 : @kernel.Thm) => @equal.ap_term(t1893, x1894))(x1896.0),
            t1897,
          )
        })(x1898),
      )
    })(@bool.conj_pair(x1899))
  })
  let t1887 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1917 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(
                @list.List([@pair.forall_pair_thm(), treal_eq()]),
              ),
              t1887,
            ),
            t1900,
          ),
          t1908,
        ),
        t1909,
      ),
      t1910,
    ),
    t1916,
  )
  treal_eq_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), ∀ z : (Hreal, Hreal), treal_eq(x, y) && treal_eq(y, z) → treal_eq(x, z)"),
      t1917,
    ),
  )
}

///|
let treal_eq_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_EQ_TRANS")

///|
/// `TREAL_EQ_TRANS`
pub fn treal_eq_trans() -> @kernel.Thm {
  treal_eq_trans_c.get()
}

///|
/// TREAL_EQ_AP
fn step_164() -> Unit raise {
  let t1918 = @simp.simp_tac(@list.List([treal_eq_refl()]))
  treal_eq_ap_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), x == y → treal_eq(x, y)"), t1918),
  )
}

///|
let treal_eq_ap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_EQ_AP")

///|
/// `TREAL_EQ_AP`
pub fn treal_eq_ap() -> @kernel.Thm {
  treal_eq_ap_c.get()
}

///|
/// TREAL_OF_NUM_EQ
fn step_165() -> Unit raise {
  let t1919 = @simp.rewrite_tac(
    @list.List([treal_of_num(), treal_eq(), hreal_of_num_eq(), hreal_add_rid()]),
  )
  treal_of_num_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, treal_eq(treal_of_num(m), treal_of_num(n)) == (m == n)"),
      t1919,
    ),
  )
}

///|
let treal_of_num_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_OF_NUM_EQ",
)

///|
/// `TREAL_OF_NUM_EQ`
pub fn treal_of_num_eq() -> @kernel.Thm {
  treal_of_num_eq_c.get()
}

///|
/// TREAL_OF_NUM_LE
fn step_166() -> Unit raise {
  let t1920 = @simp.rewrite_tac(
    @list.List([treal_of_num(), treal_le(), hreal_of_num_le(), hreal_add_rid()]),
  )
  treal_of_num_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, treal_le(treal_of_num(m), treal_of_num(n)) == (m <= n)"),
      t1920,
    ),
  )
}

///|
let treal_of_num_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_OF_NUM_LE",
)

///|
/// `TREAL_OF_NUM_LE`
pub fn treal_of_num_le() -> @kernel.Thm {
  treal_of_num_le_c.get()
}

///|
/// TREAL_OF_NUM_ADD
fn step_167() -> Unit raise {
  let t1921 = @simp.rewrite_tac(
    @list.List([
      treal_of_num(),
      treal_eq(),
      treal_add(),
      hreal_of_num_add(),
      hreal_add_rid(),
      @arith.add_clauses(),
    ]),
  )
  treal_of_num_add_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, treal_eq(treal_add(treal_of_num(m), treal_of_num(n)), treal_of_num(m + n))"),
      t1921,
    ),
  )
}

///|
let treal_of_num_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_OF_NUM_ADD",
)

///|
/// `TREAL_OF_NUM_ADD`
pub fn treal_of_num_add() -> @kernel.Thm {
  treal_of_num_add_c.get()
}

///|
/// TREAL_OF_NUM_MUL
fn step_168() -> Unit raise {
  let t1922 = @simp.rewrite_tac(
    @list.List([
      treal_of_num(),
      treal_eq(),
      treal_mul(),
      hreal_of_num_mul(),
      hreal_mul_rzero(),
      hreal_mul_lzero(),
      hreal_add_rid(),
      hreal_add_lid(),
      hreal_add_rid(),
      @arith.mult_clauses(),
    ]),
  )
  treal_of_num_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, treal_eq(treal_mul(treal_of_num(m), treal_of_num(n)), treal_of_num(m * n))"),
      t1922,
    ),
  )
}

///|
let treal_of_num_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_OF_NUM_MUL",
)

///|
/// `TREAL_OF_NUM_MUL`
pub fn treal_of_num_mul() -> @kernel.Thm {
  treal_of_num_mul_c.get()
}

///|
/// TREAL_ADD_SYM_EQ
fn step_169() -> Unit raise {
  let t1923 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      treal_add(),
      @pair.pair_eq(),
      hreal_add_sym(),
    ]),
  )
  treal_add_sym_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), treal_add(x, y) == treal_add(y, x)"),
      t1923,
    ),
  )
}

///|
let treal_add_sym_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_ADD_SYM_EQ",
)

///|
/// `TREAL_ADD_SYM_EQ`
pub fn treal_add_sym_eq() -> @kernel.Thm {
  treal_add_sym_eq_c.get()
}

///|
/// TREAL_MUL_SYM_EQ
fn step_170() -> Unit raise {
  let t1924 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      treal_mul(),
      hreal_mul_sym(),
      hreal_add_sym(),
    ]),
  )
  treal_mul_sym_eq_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), treal_mul(x, y) == treal_mul(y, x)"),
      t1924,
    ),
  )
}

///|
let treal_mul_sym_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_MUL_SYM_EQ",
)

///|
/// `TREAL_MUL_SYM_EQ`
pub fn treal_mul_sym_eq() -> @kernel.Thm {
  treal_mul_sym_eq_c.get()
}

///|
/// TREAL_ADD_SYM
fn step_171() -> Unit raise {
  let t1926 = @tactics.match_accept_tac(treal_add_sym_eq())
  let t1925 = @tactics.match_mp_tac(treal_eq_ap())
  let t1927 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1925),
    t1926,
  )
  treal_add_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), treal_eq(treal_add(x, y), treal_add(y, x))"),
      t1927,
    ),
  )
}

///|
let treal_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_ADD_SYM")

///|
/// `TREAL_ADD_SYM`
pub fn treal_add_sym() -> @kernel.Thm {
  treal_add_sym_c.get()
}

///|
/// TREAL_ADD_ASSOC
fn step_172() -> Unit raise {
  let t1928 = @simp.simp_tac(
    @list.List([
      @pair.forall_pair_thm(),
      treal_eq_ap(),
      treal_add(),
      hreal_add_assoc(),
    ]),
  )
  treal_add_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), ∀ z : (Hreal, Hreal), treal_eq(treal_add(x, treal_add(y, z)), treal_add(treal_add(x, y), z))"),
      t1928,
    ),
  )
}

///|
let treal_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_ADD_ASSOC",
)

///|
/// `TREAL_ADD_ASSOC`
pub fn treal_add_assoc() -> @kernel.Thm {
  treal_add_assoc_c.get()
}

///|
/// TREAL_ADD_LID
fn step_173() -> Unit raise {
  let t1929 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      treal_of_num(),
      treal_add(),
      treal_eq(),
      hreal_add_lid(),
    ]),
  )
  treal_add_lid_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), treal_eq(treal_add(treal_of_num(0), x), x)"),
      t1929,
    ),
  )
}

///|
let treal_add_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_ADD_LID")

///|
/// `TREAL_ADD_LID`
pub fn treal_add_lid() -> @kernel.Thm {
  treal_add_lid_c.get()
}

///|
/// TREAL_ADD_LINV
fn step_174() -> Unit raise {
  let t1930 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      treal_neg(),
      treal_add(),
      treal_eq(),
      treal_of_num(),
      hreal_add_lid(),
      hreal_add_rid(),
      hreal_add_sym(),
    ]),
  )
  treal_add_linv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), treal_eq(treal_add(treal_neg(x), x), treal_of_num(0))"),
      t1930,
    ),
  )
}

///|
let treal_add_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_ADD_LINV")

///|
/// `TREAL_ADD_LINV`
pub fn treal_add_linv() -> @kernel.Thm {
  treal_add_linv_c.get()
}

///|
/// TREAL_MUL_SYM
fn step_175() -> Unit raise {
  let t1931 = @simp.simp_tac(@list.List([treal_eq_ap(), treal_mul_sym_eq()]))
  treal_mul_sym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), treal_eq(treal_mul(x, y), treal_mul(y, x))"),
      t1931,
    ),
  )
}

///|
let treal_mul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_MUL_SYM")

///|
/// `TREAL_MUL_SYM`
pub fn treal_mul_sym() -> @kernel.Thm {
  treal_mul_sym_c.get()
}

///|
/// TREAL_MUL_ASSOC
fn step_176() -> Unit raise {
  let t1932 = @simp.simp_tac(
    @list.List([
      @pair.forall_pair_thm(),
      treal_eq_ap(),
      treal_mul(),
      hreal_add_ldistrib(),
      hreal_add_rdistrib(),
      @equal.gsym(hreal_mul_assoc()),
      hreal_add_ac(),
    ]),
  )
  treal_mul_assoc_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), ∀ z : (Hreal, Hreal), treal_eq(treal_mul(x, treal_mul(y, z)), treal_mul(treal_mul(x, y), z))"),
      t1932,
    ),
  )
}

///|
let treal_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_MUL_ASSOC",
)

///|
/// `TREAL_MUL_ASSOC`
pub fn treal_mul_assoc() -> @kernel.Thm {
  treal_mul_assoc_c.get()
}

///|
/// TREAL_MUL_LID
fn step_177() -> Unit raise {
  let t1933 = @simp.rewrite_tac(
    @list.List([
      hreal_mul_lzero(),
      hreal_mul_lid(),
      hreal_add_lid(),
      hreal_add_rid(),
    ]),
  )
  let t1934 = @tactics.then_tac(
    @simp.simp_tac(
      @list.List([
        @pair.forall_pair_thm(),
        treal_of_num(),
        treal_mul(),
        treal_eq(),
      ]),
    ),
    t1933,
  )
  treal_mul_lid_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), treal_eq(treal_mul(treal_of_num(1), x), x)"),
      t1934,
    ),
  )
}

///|
let treal_mul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_MUL_LID")

///|
/// `TREAL_MUL_LID`
pub fn treal_mul_lid() -> @kernel.Thm {
  treal_mul_lid_c.get()
}

///|
/// TREAL_ADD_LDISTRIB
fn step_178() -> Unit raise {
  let t1935 = @simp.simp_tac(
    @list.List([
      @pair.forall_pair_thm(),
      treal_eq_ap(),
      treal_mul(),
      treal_add(),
      hreal_add_ldistrib(),
      @pair.pair_eq(),
      hreal_add_ac(),
    ]),
  )
  treal_add_ldistrib_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), ∀ z : (Hreal, Hreal), treal_eq(treal_mul(x, treal_add(y, z)), treal_add(treal_mul(x, y), treal_mul(x, z)))"),
      t1935,
    ),
  )
}

///|
let treal_add_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_ADD_LDISTRIB",
)

///|
/// `TREAL_ADD_LDISTRIB`
pub fn treal_add_ldistrib() -> @kernel.Thm {
  treal_add_ldistrib_c.get()
}

///|
/// TREAL_LE_REFL
fn step_179() -> Unit raise {
  let t1936 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), treal_le(), hreal_le_refl()]),
  )
  treal_le_refl_c.set(
    @tactics.prove(@term_syntax.parse_term("∀ x : (Hreal, Hreal), treal_le(x, x)"), t1936),
  )
}

///|
let treal_le_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_LE_REFL")

///|
/// `TREAL_LE_REFL`
pub fn treal_le_refl() -> @kernel.Thm {
  treal_le_refl_c.get()
}

///|
/// TREAL_LE_ANTISYM
fn step_180() -> Unit raise {
  let t1937 = @simp.rewrite_tac(
    @list.List([
      @pair.forall_pair_thm(),
      treal_le(),
      treal_eq(),
      hreal_le_antisym(),
    ]),
  )
  treal_le_antisym_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), (treal_le(x, y) && treal_le(y, x)) == treal_eq(x, y)"),
      t1937,
    ),
  )
}

///|
let treal_le_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_LE_ANTISYM",
)

///|
/// `TREAL_LE_ANTISYM`
pub fn treal_le_antisym() -> @kernel.Thm {
  treal_le_antisym_c.get()
}

///|
/// TREAL_LE_TRANS
fn step_181() -> Unit raise {
  let t1958 = @simp.once_rewrite_rule(@list.List([hreal_add_sym()]))
  let t1960 = @tactics.disch_then(fn(
    x1959 : @kernel.Thm,
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
      x1955 : @kernel.Thm,
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
      let s1956 = @tactics.match_accept_tac(x1955)
      fn(
        x1957 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1956(x1957)
      }
    })(t1958(x1959))
  })
  let t1954 = @simp.rewrite_tac(
    @list.List([hreal_add_assoc(), hreal_le_add_rcancel()]),
  )
  let t1953 = @simp.rewrite_tac(
    @list.List([@equal.gsym(hreal_add_assoc()), hreal_le_add_lcancel()]),
  )
  let t1952 = @simp.gen_rewrite_tac(
    fn(
      x1951 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x1945 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1946 = @equal.land_conv(x1945)
        fn(x1947 : @kernel.Term) -> @kernel.Thm raise { s1946(x1947) }
      })(
        (fn(
          x1948 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1949 = @equal.land_conv(x1948)
          fn(x1950 : @kernel.Term) -> @kernel.Thm raise { s1949(x1950) }
        })(x1951),
      )
    },
    @list.List([hreal_add_sym()]),
  )
  let t1942 = @drule.match_mp(hreal_le_add2())
  let t1944 = @tactics.disch_then(fn(
    x1943 : @kernel.Thm,
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
      x1939 : @kernel.Thm,
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
      let s1940 = @tactics.mp_tac(x1939)
      fn(
        x1941 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s1940(x1941)
      }
    })(t1942(x1943))
  })
  let t1938 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1961 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @simp.rewrite_tac(
                @list.List([@pair.forall_pair_thm(), treal_le()]),
              ),
              t1938,
            ),
            t1944,
          ),
          t1952,
        ),
        t1953,
      ),
      t1954,
    ),
    t1960,
  )
  treal_le_trans_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), ∀ z : (Hreal, Hreal), treal_le(x, y) && treal_le(y, z) → treal_le(x, z)"),
      t1961,
    ),
  )
}

///|
let treal_le_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_LE_TRANS")

///|
/// `TREAL_LE_TRANS`
pub fn treal_le_trans() -> @kernel.Thm {
  treal_le_trans_c.get()
}

///|
/// TREAL_LE_TOTAL
fn step_182() -> Unit raise {
  let t1962 = @simp.rewrite_tac(
    @list.List([@pair.forall_pair_thm(), treal_le(), hreal_le_total()]),
  )
  treal_le_total_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), treal_le(x, y) || treal_le(y, x)"),
      t1962,
    ),
  )
}

///|
let treal_le_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_LE_TOTAL")

///|
/// `TREAL_LE_TOTAL`
pub fn treal_le_total() -> @kernel.Thm {
  treal_le_total_c.get()
}

///|
/// TREAL_LE_LADD_IMP
fn step_183() -> Unit raise {
  let t1965 = @simp.rewrite_tac(
    @list.List([@equal.gsym(hreal_add_assoc()), hreal_le_add_lcancel()]),
  )
  let t1964 = @simp.once_rewrite_tac(@list.List([hreal_add_sym()]))
  let t1963 = @simp.rewrite_tac(
    @list.List([@equal.gsym(hreal_add_assoc()), hreal_le_add_lcancel()]),
  )
  let t1966 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@pair.forall_pair_thm(), treal_le(), treal_add()]),
        ),
        t1963,
      ),
      t1964,
    ),
    t1965,
  )
  treal_le_ladd_imp_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), ∀ z : (Hreal, Hreal), treal_le(y, z) → treal_le(treal_add(x, y), treal_add(x, z))"),
      t1966,
    ),
  )
}

///|
let treal_le_ladd_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_LE_LADD_IMP",
)

///|
/// `TREAL_LE_LADD_IMP`
pub fn treal_le_ladd_imp() -> @kernel.Thm {
  treal_le_ladd_imp_c.get()
}

///|
/// TREAL_LE_MUL
fn step_184() -> Unit raise {
  let t1990 = @simp.asm_rewrite_tac(@list.List([]))
  let t1989 = @tactics.match_mp_tac(hreal_le_mul_rcancel_imp())
  let t1988 = @simp.asm_rewrite_tac(@list.List([hreal_le_add_lcancel()]))
  let t1987 = @simp.gen_rewrite_tac(
    fn(
      x1984 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1985 = @equal.rand_conv(x1984)
      fn(x1986 : @kernel.Term) -> @kernel.Thm raise { s1985(x1986) }
    },
    @list.List([hreal_add_sym()]),
  )
  let t1983 = @simp.rewrite_tac(
    @list.List([
      hreal_add_ldistrib(),
      hreal_le_add_lcancel(),
      @equal.gsym(hreal_add_assoc()),
    ]),
  )
  let t1979 = @drule.match_mp(hreal_le_exists())
  let t1980 = @tactics.choose_then(fn(
    x1976 : @kernel.Thm,
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
    let s1977 = @tactics.subst1_tac(x1976)
    fn(
      x1978 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s1977(x1978)
    }
  })
  let t1982 = @tactics.disch_then(fn(
    x1981 : @kernel.Thm,
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
    t1980(t1979(x1981))
  })
  let t1975 = @tactics.disch_then(
    @tactics.conjuncts_then2(
      fn(
        x1969 : @kernel.Thm,
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
        let s1970 = @tactics.assume_tac(x1969)
        fn(
          x1971 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1970(x1971)
        }
      },
      fn(
        x1972 : @kernel.Thm,
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
        let s1973 = @tactics.mp_tac(x1972)
        fn(
          x1974 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s1973(x1974)
        }
      },
    ),
  )
  let t1968 = @simp.rewrite_tac(@list.List([hreal_add_lid(), hreal_add_rid()]))
  let t1967 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1991 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(
                      @list.List([
                        @pair.forall_pair_thm(),
                        treal_of_num(),
                        treal_le(),
                        treal_mul(),
                      ]),
                    ),
                    t1967,
                  ),
                  t1968,
                ),
                t1975,
              ),
              t1982,
            ),
            t1983,
          ),
          t1987,
        ),
        t1988,
      ),
      t1989,
    ),
    t1990,
  )
  treal_le_mul_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), treal_le(treal_of_num(0), x) && treal_le(treal_of_num(0), y) → treal_le(treal_of_num(0), treal_mul(x, y))"),
      t1991,
    ),
  )
}

///|
let treal_le_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_LE_MUL")

///|
/// `TREAL_LE_MUL`
pub fn treal_le_mul() -> @kernel.Thm {
  treal_le_mul_c.get()
}

///|
/// TREAL_INV_0
fn step_185() -> Unit raise {
  let t1992 = @simp.rewrite_tac(
    @list.List([treal_inv(), treal_eq(), treal_of_num()]),
  )
  treal_inv_0_c.set(
    @tactics.prove(
      @term_syntax.parse_term("treal_eq(treal_inv(treal_of_num(0)), treal_of_num(0))"),
      t1992,
    ),
  )
}

///|
let treal_inv_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_INV_0")

///|
/// `TREAL_INV_0`
pub fn treal_inv_0() -> @kernel.Thm {
  treal_inv_0_c.get()
}

///|
/// TREAL_MUL_LINV
fn step_186() -> Unit raise {
  let t2050 = @simp.asm_rewrite_tac(@list.List([]))
  let t2049 = @simp.pure_once_rewrite_tac(@list.List([@theorems.eq_sym_eq()]))
  let t2048 = @simp.asm_rewrite_tac(@list.List([hreal_add_rid()]))
  let t2047 = @tactics.first_assum(fn(
    x2046 : @kernel.Thm,
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
      x2044 : @kernel.Term,
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
        x2039 : @kernel.Term,
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
        let s2040 = @tactics.undisch_tac(x2039)
        fn(
          x2041 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2040(x2041)
        }
      })(
        ((x2043 : @kernel.Term) => {
          @lib.check(
            fn(x2042 : @kernel.Term) -> Bool raise { @basics.is_eq(x2042) },
            x2043,
          )
        })(x2044),
      )
    })(
      (fn(x2045 : @kernel.Thm) -> @kernel.Term raise { @kernel.concl(x2045) })(
        x2046,
      ),
    )
  })
  let t2038 = @tactics.disch_then(fn(
    x2035 : @kernel.Thm,
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
    let s2036 = @tactics.subst_all_tac(x2035)
    fn(
      x2037 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2036(x2037)
    }
  })
  let t2034 = @tactics.match_mp_tac(hreal_mul_linv())
  let t2033 = @simp.gen_rewrite_tac(
    fn(
      x2030 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2031 = @equal.rand_conv(x2030)
      fn(x2032 : @kernel.Term) -> @kernel.Thm raise { s2031(x2032) }
    },
    @list.List([hreal_add_sym()]),
  )
  let t2029 = @simp.rewrite_tac(@list.List([hreal_add_ldistrib()]))
  let t2028 = @tactics.disch_then(fn(
    x2018 : @kernel.Thm,
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
    let th = x2018
    let t2027 = @simp.gen_rewrite_tac(
      fn(
        x2026 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x2020 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2021 = @equal.land_conv(x2020)
          fn(x2022 : @kernel.Term) -> @kernel.Thm raise { s2021(x2022) }
        })(
          (fn(
            x2023 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s2024 = @equal.rand_conv(x2023)
            fn(x2025 : @kernel.Term) -> @kernel.Thm raise { s2024(x2025) }
          })(x2026),
        )
      },
      @list.List([th]),
    )
    @tactics.then_tac(@tactics.assume_tac(@equal.sym(th)), t2027)
  })
  let t2017 = @tactics.disch_then(fn(
    x2016 : @kernel.Thm,
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
      x2013 : @kernel.Thm,
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
      let s2014 = @tactics.mp_tac(x2013)
      fn(
        x2015 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2014(x2015)
      }
    })(@class.select_rule(x2016))
  })
  let t2010 = @drule.match_mp(hreal_le_exists())
  let t2012 = @tactics.first_assum(fn(
    x2011 : @kernel.Thm,
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
      x2007 : @kernel.Thm,
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
      let s2008 = @tactics.mp_tac(x2007)
      fn(
        x2009 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2008(x2009)
      }
    })(t2010(x2011))
  })
  let t2005 = @simp.asm_rewrite_tac(@list.List([]))
  let t2003 = @term_syntax.parse_term("(y : Hreal)")
  let t2004 = @bool.specl(
    @list.List([@term_syntax.parse_term("(x : Hreal)"), t2003]),
    hreal_le_total(),
  )
  let t2006 = @list.List([
    @tactics.all_tac,
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disj_cases_then(fn(
          x2000 : @kernel.Thm,
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
          let s2001 = @tactics.mp_tac(x2000)
          fn(
            x2002 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2001(x2002)
          }
        })(t2004),
        t2005,
      ),
      @tactics.disch_tac,
    ),
  ])
  let t1999 = @simp.rewrite_tac(
    @list.List([
      hreal_add_lid(),
      hreal_add_rid(),
      hreal_mul_lzero(),
      hreal_mul_rzero(),
    ]),
  )
  let t1998 = @simp.pure_rewrite_tac(@list.List([treal_mul(), treal_eq()]))
  let t1997 = @simp.pure_asm_rewrite_tac(@list.List([@class.cond_clauses()]))
  let t1996 = @simp.pure_rewrite_tac(
    @list.List([hreal_add_lid(), hreal_add_rid()]),
  )
  let t1995 = @simp.pure_rewrite_tac(
    @list.List([treal_eq(), treal_of_num(), treal_mul(), treal_inv()]),
  )
  let t1993 = @term_syntax.parse_term("(y : Hreal)")
  let t1994 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x : Hreal)"), t1993]),
  )
  let t2051 = @tactics.then_tac(
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
                          @tactics.thenl(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.then_tac(
                                            @simp.rewrite_tac(
                                              @list.List([
                                                @pair.forall_pair_thm(),
                                              ]),
                                            ),
                                            t1994,
                                          ),
                                          t1995,
                                        ),
                                        t1996,
                                      ),
                                      @tactics.disch_tac,
                                    ),
                                    t1997,
                                  ),
                                  @class.cond_cases_tac,
                                ),
                                t1998,
                              ),
                              t1999,
                            ),
                            t2006,
                          ),
                          t2012,
                        ),
                        t2017,
                      ),
                      t2028,
                    ),
                    t2029,
                  ),
                  t2033,
                ),
                @tactics.ap_term_tac,
              ),
              t2034,
            ),
            t2038,
          ),
          t2047,
        ),
        t2048,
      ),
      t2049,
    ),
    t2050,
  )
  treal_mul_linv_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), !treal_eq(x, treal_of_num(0)) → treal_eq(treal_mul(treal_inv(x), x), treal_of_num(1))"),
      t2051,
    ),
  )
}

///|
let treal_mul_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TREAL_MUL_LINV")

///|
/// `TREAL_MUL_LINV`
pub fn treal_mul_linv() -> @kernel.Thm {
  treal_mul_linv_c.get()
}

///|
/// TREAL_OF_NUM_WELLDEF
fn step_187() -> Unit raise {
  let t2056 = @tactics.match_accept_tac(treal_eq_refl())
  let t2055 = @tactics.disch_then(fn(
    x2052 : @kernel.Thm,
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
    let s2053 = @tactics.subst1_tac(x2052)
    fn(
      x2054 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2053(x2054)
    }
  })
  let t2057 = @tactics.then_tac(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2055),
    t2056,
  )
  treal_of_num_welldef_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ m : Num, ∀ n : Num, m == n → treal_eq(treal_of_num(m), treal_of_num(n))"),
      t2057,
    ),
  )
}

///|
let treal_of_num_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_OF_NUM_WELLDEF",
)

///|
/// `TREAL_OF_NUM_WELLDEF`
pub fn treal_of_num_welldef() -> @kernel.Thm {
  treal_of_num_welldef_c.get()
}

///|
/// TREAL_NEG_WELLDEF
fn step_188() -> Unit raise {
  let t2060 = @simp.asm_rewrite_tac(@list.List([]))
  let t2059 = @simp.once_rewrite_tac(@list.List([hreal_add_sym()]))
  let t2058 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2061 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@pair.forall_pair_thm(), treal_neg(), treal_eq()]),
        ),
        t2058,
      ),
      t2059,
    ),
    t2060,
  )
  treal_neg_welldef_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x1 : (Hreal, Hreal), ∀ x2 : (Hreal, Hreal), treal_eq(x1, x2) → treal_eq(treal_neg(x1), treal_neg(x2))"),
      t2061,
    ),
  )
}

///|
let treal_neg_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_NEG_WELLDEF",
)

///|
/// `TREAL_NEG_WELLDEF`
pub fn treal_neg_welldef() -> @kernel.Thm {
  treal_neg_welldef_c.get()
}

///|
/// TREAL_ADD_WELLDEFR
fn step_189() -> Unit raise {
  let t2064 = @simp.rewrite_tac(
    @list.List([hreal_eq_add_rcancel(), hreal_add_assoc()]),
  )
  let t2063 = @simp.once_rewrite_tac(@list.List([hreal_add_sym()]))
  let t2062 = @simp.rewrite_tac(
    @list.List([hreal_eq_add_rcancel(), hreal_add_assoc()]),
  )
  let t2065 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.rewrite_tac(
          @list.List([@pair.forall_pair_thm(), treal_add(), treal_eq()]),
        ),
        t2062,
      ),
      t2063,
    ),
    t2064,
  )
  treal_add_welldefr_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x1 : (Hreal, Hreal), ∀ x2 : (Hreal, Hreal), ∀ y : (Hreal, Hreal), treal_eq(x1, x2) → treal_eq(treal_add(x1, y), treal_add(x2, y))"),
      t2065,
    ),
  )
}

///|
let treal_add_welldefr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_ADD_WELLDEFR",
)

///|
/// `TREAL_ADD_WELLDEFR`
pub fn treal_add_welldefr() -> @kernel.Thm {
  treal_add_welldefr_c.get()
}

///|
/// TREAL_ADD_WELLDEF
fn step_190() -> Unit raise {
  let t2070 = @simp.asm_rewrite_tac(@list.List([]))
  let t2069 = @tactics.match_mp_tac(treal_add_welldefr())
  let t2068 = @list.List([
    @simp.once_rewrite_tac(@list.List([treal_add_sym_eq()])),
    @tactics.all_tac,
  ])
  let t2067 = @tactics.exists_tac(@term_syntax.parse_term("treal_add((x1 : (Hreal, Hreal)), (y2 : (Hreal, Hreal)))"))
  let t2066 = @tactics.match_mp_tac(treal_eq_trans())
  let t2071 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.disch_tac,
              ),
              t2066,
            ),
            t2067,
          ),
          @tactics.conj_tac,
        ),
        t2068,
      ),
      t2069,
    ),
    t2070,
  )
  treal_add_welldef_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x1 : (Hreal, Hreal), ∀ x2 : (Hreal, Hreal), ∀ y1 : (Hreal, Hreal), ∀ y2 : (Hreal, Hreal), treal_eq(x1, x2) && treal_eq(y1, y2) → treal_eq(treal_add(x1, y1), treal_add(x2, y2))"),
      t2071,
    ),
  )
}

///|
let treal_add_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_ADD_WELLDEF",
)

///|
/// `TREAL_ADD_WELLDEF`
pub fn treal_add_welldef() -> @kernel.Thm {
  treal_add_welldef_c.get()
}

///|
/// TREAL_MUL_WELLDEFR
fn step_191() -> Unit raise {
  let t2081 = @tactics.pop_assum(fn(
    x2078 : @kernel.Thm,
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
    let s2079 = @tactics.subst1_tac(x2078)
    fn(
      x2080 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2079(x2080)
    }
  })
  let t2077 = @simp.once_rewrite_tac(@list.List([hreal_add_sym()]))
  let t2076 = @simp.asm_rewrite_tac(@list.List([]))
  let t2075 = @simp.rewrite_tac(@list.List([@equal.gsym(hreal_add_rdistrib())]))
  let t2073 = @term_syntax.parse_term("(a : Hreal) + (b : Hreal) + ((c : Hreal) + (d : Hreal)) == a + d + (b + c)")
  let t2074 = @simp.once_rewrite_tac(
    @list.List([@theorems.ac(hreal_add_ac())(t2073)]),
  )
  let t2072 = @tactics.repeat_tac(@tactics.gen_tac)
  let t2082 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @simp.rewrite_tac(
                      @list.List([
                        @pair.forall_pair_thm(),
                        treal_mul(),
                        treal_eq(),
                      ]),
                    ),
                    t2072,
                  ),
                  t2074,
                ),
                t2075,
              ),
              @tactics.disch_tac,
            ),
            t2076,
          ),
          @tactics.ap_term_tac,
        ),
        t2077,
      ),
      t2081,
    ),
    @tactics.refl_tac,
  )
  treal_mul_welldefr_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x1 : (Hreal, Hreal), ∀ x2 : (Hreal, Hreal), ∀ y : (Hreal, Hreal), treal_eq(x1, x2) → treal_eq(treal_mul(x1, y), treal_mul(x2, y))"),
      t2082,
    ),
  )
}

///|
let treal_mul_welldefr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_MUL_WELLDEFR",
)

///|
/// `TREAL_MUL_WELLDEFR`
pub fn treal_mul_welldefr() -> @kernel.Thm {
  treal_mul_welldefr_c.get()
}

///|
/// TREAL_MUL_WELLDEF
fn step_192() -> Unit raise {
  let t2087 = @simp.asm_rewrite_tac(@list.List([]))
  let t2086 = @tactics.match_mp_tac(treal_mul_welldefr())
  let t2085 = @list.List([
    @simp.once_rewrite_tac(@list.List([treal_mul_sym_eq()])),
    @tactics.all_tac,
  ])
  let t2084 = @tactics.exists_tac(@term_syntax.parse_term("treal_mul((x1 : (Hreal, Hreal)), (y2 : (Hreal, Hreal)))"))
  let t2083 = @tactics.match_mp_tac(treal_eq_trans())
  let t2088 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.repeat_tac(@tactics.gen_tac),
                @tactics.disch_tac,
              ),
              t2083,
            ),
            t2084,
          ),
          @tactics.conj_tac,
        ),
        t2085,
      ),
      t2086,
    ),
    t2087,
  )
  treal_mul_welldef_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x1 : (Hreal, Hreal), ∀ x2 : (Hreal, Hreal), ∀ y1 : (Hreal, Hreal), ∀ y2 : (Hreal, Hreal), treal_eq(x1, x2) && treal_eq(y1, y2) → treal_eq(treal_mul(x1, y1), treal_mul(x2, y2))"),
      t2088,
    ),
  )
}

///|
let treal_mul_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_MUL_WELLDEF",
)

///|
/// `TREAL_MUL_WELLDEF`
pub fn treal_mul_welldef() -> @kernel.Thm {
  treal_mul_welldef_c.get()
}

///|
/// TREAL_EQ_IMP_LE
fn step_193() -> Unit raise {
  let t2089 = @simp.simp_tac(
    @list.List([
      @pair.forall_pair_thm(),
      treal_eq(),
      treal_le(),
      hreal_le_refl(),
    ]),
  )
  treal_eq_imp_le_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), treal_eq(x, y) → treal_le(x, y)"),
      t2089,
    ),
  )
}

///|
let treal_eq_imp_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_EQ_IMP_LE",
)

///|
/// `TREAL_EQ_IMP_LE`
pub fn treal_eq_imp_le() -> @kernel.Thm {
  treal_eq_imp_le_c.get()
}

///|
/// TREAL_LE_WELLDEF
fn step_194() -> Unit raise {
  let t2106 = @simp.asm_rewrite_tac(@list.List([]))
  let t2101 = @simp.once_rewrite_tac(@list.List([treal_eq_sym()]))
  let t2102 = @tactics.then_tac(@tactics.match_mp_tac(treal_eq_imp_le()), t2101)
  let t2100 = @tactics.match_mp_tac(treal_eq_imp_le())
  let t2099 = @simp.asm_rewrite_tac(@list.List([]))
  let t2098 = @tactics.exists_tac(@term_syntax.parse_term("(x2 : (Hreal, Hreal))"))
  let t2103 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(treal_le_trans()), t2098),
        t2099,
      ),
      t2100,
    ),
    t2102,
  ])
  let t2097 = @tactics.exists_tac(@term_syntax.parse_term("(y2 : (Hreal, Hreal))"))
  let t2104 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(@tactics.match_mp_tac(treal_le_trans()), t2097),
      @tactics.conj_tac,
    ),
    t2103,
  )
  let t2095 = @tactics.match_mp_tac(treal_eq_imp_le())
  let t2094 = @simp.once_rewrite_tac(@list.List([treal_eq_sym()]))
  let t2093 = @tactics.match_mp_tac(treal_eq_imp_le())
  let t2092 = @simp.asm_rewrite_tac(@list.List([]))
  let t2091 = @tactics.exists_tac(@term_syntax.parse_term("(x1 : (Hreal, Hreal))"))
  let t2096 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.match_mp_tac(treal_le_trans()), t2091),
          t2092,
        ),
        t2093,
      ),
      t2094,
    ),
    t2095,
  ])
  let t2090 = @tactics.exists_tac(@term_syntax.parse_term("(y1 : (Hreal, Hreal))"))
  let t2105 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(@tactics.match_mp_tac(treal_le_trans()), t2090),
        @tactics.conj_tac,
      ),
      t2096,
    ),
    t2104,
  ])
  let t2107 = @tactics.then_tac(
    @tactics.thenl(
      @tactics.repeat_tac(
        @tactics.orelse_tac(@tactics.strip_tac, @tactics.eq_tac),
      ),
      t2105,
    ),
    t2106,
  )
  treal_le_welldef_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x1 : (Hreal, Hreal), ∀ x2 : (Hreal, Hreal), ∀ y1 : (Hreal, Hreal), ∀ y2 : (Hreal, Hreal), treal_eq(x1, x2) && treal_eq(y1, y2) → treal_le(x1, y1) == treal_le(x2, y2)"),
      t2107,
    ),
  )
}

///|
let treal_le_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_LE_WELLDEF",
)

///|
/// `TREAL_LE_WELLDEF`
pub fn treal_le_welldef() -> @kernel.Thm {
  treal_le_welldef_c.get()
}

///|
/// TREAL_INV_WELLDEF
fn step_195() -> Unit raise {
  let t2114 = @tactics.match_accept_tac(@theorems.eq_sym_eq())
  let t2113 = @simp.rewrite_tac(@list.List([hreal_eq_add_lcancel()]))
  let t2112 = @simp.gen_rewrite_tac(
    (x2111 : (@kernel.Term) -> @kernel.Thm raise) => {
      @lib.funpow(
        2,
        fn(
          x2108 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2109 = @equal.land_conv(x2108)
          fn(x2110 : @kernel.Term) -> @kernel.Thm raise { s2109(x2110) }
        },
        x2111,
      )
    },
    @list.List([@equal.gsym(hreal_add_rid())]),
  )
  let t2115 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.match_mp_tac(@class.select_unique()),
            @tactics.beta_tac,
          ),
          @tactics.gen_tac,
        ),
        t2112,
      ),
      t2113,
    ),
    t2114,
  )
  let lemma = @tactics.prove(@term_syntax.parse_term("select((d : Hreal) => (x : Hreal) == x + d) == hreal_of_num(0)"), t2115)
  let t2242 = @simp.rewrite_tac(
    @list.List([hreal_eq_add_lcancel(), treal_eq_refl()]),
  )
  let t2243 = @tactics.then_tac(
    @simp.gen_rewrite_tac(
      fn(
        x2241 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x2237 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          ((x2233 : (@kernel.Term) -> @kernel.Thm raise) => {
            @lib.funpow(
              3,
              fn(
                x2230 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s2231 = @equal.rand_conv(x2230)
                fn(x2232 : @kernel.Term) -> @kernel.Thm raise { s2231(x2232) }
              },
              x2233,
            )
          })(
            (fn(
              x2234 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s2235 = @equal.binder_conv(x2234)
              fn(x2236 : @kernel.Term) -> @kernel.Thm raise { s2235(x2236) }
            })(x2237),
          )
        })(
          (fn(
            x2238 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s2239 = @equal.land_conv(x2238)
            fn(x2240 : @kernel.Term) -> @kernel.Thm raise { s2239(x2240) }
          })(x2241),
        )
      },
      @list.List([hreal_add_sym()]),
    ),
    t2242,
  )
  let t2227 = @simp.asm_rewrite_tac(@list.List([hreal_add_rid()]))
  let t2226 = @tactics.undisch_tac(@term_syntax.parse_term("(x1 : Hreal) + hreal_of_num(0) == (x2 : Hreal)"))
  let t2228 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.disch_then(fn(
        x2223 : @kernel.Thm,
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
        let s2224 = @tactics.subst_all_tac(x2223)
        fn(
          x2225 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2224(x2225)
        }
      }),
      t2226,
    ),
    t2227,
  )
  let t2222 = @simp.rewrite_tac(@list.List([hreal_le_add()]))
  let t2221 = @simp.gen_rewrite_tac(
    fn(
      x2218 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2219 = @equal.rand_conv(x2218)
      fn(x2220 : @kernel.Term) -> @kernel.Thm raise { s2219(x2220) }
    },
    @list.List([@equal.gsym(hreal_add_lid())]),
  )
  let t2229 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.asm_rewrite_tac(@list.List([@equal.gsym(hreal_le_antisym())])),
        t2221,
      ),
      t2222,
    ),
    t2228,
  ])
  let t2217 = @tactics.subgoal_then(
    @term_syntax.parse_term("select((d : Hreal) => (x2 : Hreal) == (x1 : Hreal) + d) == hreal_of_num(0)"),
    fn(
      x2214 : @kernel.Thm,
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
      let s2215 = @tactics.mp_tac(x2214)
      fn(
        x2216 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2215(x2216)
      }
    },
  )
  let t2213 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([hreal_add_sym()]))(
        hreal_le_add_lcancel(),
      ),
    ]),
  )
  let t2212 = @simp.gen_rewrite_tac(
    fn(
      x2211 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x2205 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2206 = @equal.land_conv(x2205)
        fn(x2207 : @kernel.Term) -> @kernel.Thm raise { s2206(x2207) }
      })(
        (fn(
          x2208 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2209 = @equal.rand_conv(x2208)
          fn(x2210 : @kernel.Term) -> @kernel.Thm raise { s2209(x2210) }
        })(x2211),
      )
    },
    @list.List([@equal.gsym(hreal_add_lid())]),
  )
  let t2244 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.undisch_tac(
                @term_syntax.parse_term("select((d : Hreal) => (x2 : Hreal) == (x1 : Hreal) + d) + (y1 : Hreal) <= y1"),
              ),
              t2212,
            ),
            t2213,
          ),
          @tactics.disch_tac,
        ),
        t2217,
      ),
      t2229,
    ),
    t2243,
  ])
  let t2204 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([hreal_add_sym()]))(hreal_le_add()),
    ]),
  )
  let t2203 = @tactics.disch_then(fn(
    x2200 : @kernel.Thm,
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
    let s2201 = @tactics.subst1_tac(x2200)
    fn(
      x2202 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2201(x2202)
    }
  })
  let t2199 = @simp.rewrite_tac(
    @list.List([hreal_eq_add_lcancel(), @equal.gsym(hreal_add_assoc())]),
  )
  let t2198 = @tactics.first_assum(fn(
    x2197 : @kernel.Thm,
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
      x2194 : @kernel.Thm,
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
      let s2195 = @tactics.subst1_tac(x2194)
      fn(
        x2196 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2195(x2196)
      }
    })(@equal.sym(x2197))
  })
  let t2193 = @tactics.undisch_tac(@term_syntax.parse_term("(x1 : Hreal) + (y2 : Hreal) == (x2 : Hreal) + (y1 : Hreal)"))
  let t2190 = @drule.match_mp(hreal_le_exists())
  let t2192 = @tactics.first_assum(fn(
    x2191 : @kernel.Thm,
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
      x2189 : @kernel.Thm,
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
        x2188 : @kernel.Thm,
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
          x2185 : @kernel.Thm,
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
          let s2186 = @tactics.assume_tac(x2185)
          fn(
            x2187 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2186(x2187)
          }
        })(@equal.sym(x2188))
      })(@class.select_rule(x2189))
    })(t2190(x2191))
  })
  let t2184 = @simp.asm_rewrite_tac(@list.List([]))
  let t2182 = @term_syntax.parse_term("(x2 : Hreal)")
  let t2183 = @bool.specl(
    @list.List([@term_syntax.parse_term("(x1 : Hreal)"), t2182]),
    hreal_le_total(),
  )
  let t2245 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.disj_cases_then(fn(
                        x2179 : @kernel.Thm,
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
                        let s2180 = @tactics.mp_tac(x2179)
                        fn(
                          x2181 : (
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
                          s2180(x2181)
                        }
                      })(t2183),
                      t2184,
                    ),
                    @tactics.disch_tac,
                  ),
                  t2192,
                ),
                t2193,
              ),
              t2198,
            ),
            t2199,
          ),
          t2203,
        ),
        t2204,
      ),
      @class.cond_cases_tac,
    ),
    t2244,
  )
  let t2178 = @simp.rewrite_tac(
    @list.List([hreal_eq_add_lcancel(), treal_eq_refl()]),
  )
  let t2177 = @simp.gen_rewrite_tac(
    fn(
      x2176 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x2172 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(
          x2168 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x2164 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            (fn(
              x2158 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s2159 = @equal.rand_conv(x2158)
              fn(x2160 : @kernel.Term) -> @kernel.Thm raise { s2159(x2160) }
            })(
              (fn(
                x2161 : (@kernel.Term) -> @kernel.Thm raise,
              ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                let s2162 = @equal.land_conv(x2161)
                fn(x2163 : @kernel.Term) -> @kernel.Thm raise { s2162(x2163) }
              })(x2164),
            )
          })(
            (fn(
              x2165 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s2166 = @equal.rand_conv(x2165)
              fn(x2167 : @kernel.Term) -> @kernel.Thm raise { s2166(x2167) }
            })(x2168),
          )
        })(
          (fn(
            x2169 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s2170 = @equal.binder_conv(x2169)
            fn(x2171 : @kernel.Term) -> @kernel.Thm raise { s2170(x2171) }
          })(x2172),
        )
      })(
        (fn(
          x2173 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2174 = @equal.land_conv(x2173)
          fn(x2175 : @kernel.Term) -> @kernel.Thm raise { s2174(x2175) }
        })(x2176),
      )
    },
    @list.List([hreal_add_sym()]),
  )
  let t2157 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([hreal_add_sym()]))(hreal_le_add()),
    ]),
  )
  let t2156 = @tactics.disch_then(fn(
    x2155 : @kernel.Thm,
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
      x2152 : @kernel.Thm,
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
      let s2153 = @tactics.subst1_tac(x2152)
      fn(
        x2154 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2153(x2154)
      }
    })(@equal.sym(x2155))
  })
  let t2151 = @simp.rewrite_tac(
    @list.List([hreal_eq_add_lcancel(), @equal.gsym(hreal_add_assoc())]),
  )
  let t2150 = @tactics.first_assum(fn(
    x2149 : @kernel.Thm,
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
      x2146 : @kernel.Thm,
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
      let s2147 = @tactics.subst1_tac(x2146)
      fn(
        x2148 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2147(x2148)
      }
    })(@equal.sym(x2149))
  })
  let t2145 = @tactics.undisch_tac(@term_syntax.parse_term("(x1 : Hreal) + (y2 : Hreal) == (x2 : Hreal) + (y1 : Hreal)"))
  let t2143 = @drule.match_mp(hreal_le_exists())
  let t2246 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.first_assum(fn(
                    x2144 : @kernel.Thm,
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
                      x2142 : @kernel.Thm,
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
                        x2141 : @kernel.Thm,
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
                          x2138 : @kernel.Thm,
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
                          let s2139 = @tactics.assume_tac(x2138)
                          fn(
                            x2140 : (
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
                            s2139(x2140)
                          }
                        })(@equal.sym(x2141))
                      })(@class.select_rule(x2142))
                    })(t2143(x2144))
                  }),
                  t2145,
                ),
                t2150,
              ),
              t2151,
            ),
            t2156,
          ),
          t2157,
        ),
        t2177,
      ),
      t2178,
    ),
    t2245,
  ])
  let t2137 = @simp.asm_rewrite_tac(@list.List([]))
  let t2136 = @class.asm_cases_tac(@term_syntax.parse_term("(x2 : Hreal) <= (x1 : Hreal)"))
  let t2135 = @simp.asm_rewrite_tac(
    @list.List([hreal_le_refl(), lemma, hreal_inv_0(), treal_eq_refl()]),
  )
  let t2134 = @simp.rewrite_tac(
    @list.List([hreal_eq_add_lcancel(), hreal_eq_add_rcancel()]),
  )
  let t2131 = @simp.gen_rewrite_rule(
    fn(
      x2128 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2129 = @equal.rand_conv(x2128)
      fn(x2130 : @kernel.Term) -> @kernel.Thm raise { s2129(x2130) }
    },
    @list.List([hreal_add_sym()]),
  )
  let t2133 = @tactics.disch_then(fn(
    x2132 : @kernel.Thm,
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
      x2125 : @kernel.Thm,
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
      let s2126 = @tactics.mp_tac(x2125)
      fn(
        x2127 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2126(x2127)
      }
    })(t2131(x2132))
  })
  let t2124 = @simp.rewrite_tac(@list.List([treal_eq_refl()]))
  let t2123 = @simp.asm_rewrite_tac(@list.List([]))
  let t2122 = @class.asm_cases_tac(@term_syntax.parse_term("(y1 : Hreal) == (y2 : Hreal)"))
  let t2121 = @class.asm_cases_tac(@term_syntax.parse_term("(x1 : Hreal) == (x2 : Hreal)"))
  let t2120 = @simp.pure_rewrite_tac(@list.List([treal_eq(), treal_inv()]))
  let t2116 = @term_syntax.parse_term("(y2 : Hreal)")
  let t2117 = @term_syntax.parse_term("(y1 : Hreal)")
  let t2118 = @term_syntax.parse_term("(x2 : Hreal)")
  let t2119 = @tactics.map_every(
    @tactics.x_gen_tac,
    @list.List([@term_syntax.parse_term("(x1 : Hreal)"), t2118, t2117, t2116]),
  )
  let t2247 = @tactics.thenl(
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
                          @tactics.then_tac(
                            @simp.rewrite_tac(
                              @list.List([@pair.forall_pair_thm()]),
                            ),
                            t2119,
                          ),
                          t2120,
                        ),
                        t2121,
                      ),
                      t2122,
                    ),
                    t2123,
                  ),
                  t2124,
                ),
                t2133,
              ),
              t2134,
            ),
            @tactics.disch_tac,
          ),
          t2135,
        ),
        t2136,
      ),
      t2137,
    ),
    t2246,
  )
  treal_inv_welldef_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ x : (Hreal, Hreal), ∀ y : (Hreal, Hreal), treal_eq(x, y) → treal_eq(treal_inv(x), treal_inv(y))"),
      t2247,
    ),
  )
}

///|
let treal_inv_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "TREAL_INV_WELLDEF",
)

///|
/// `TREAL_INV_WELLDEF`
pub fn treal_inv_welldef() -> @kernel.Thm {
  treal_inv_welldef_c.get()
}

///|
/// real_tybij
fn step_196() -> Unit raise {
  real_tybij_c.set(
    @quot.define_quotient_type(
      "real",
      ("mk_real", "dest_real"),
      @term_syntax.parse_term("treal_eq"),
    ),
  )
}

///|
let real_tybij_c : @lib.Cell[(@kernel.Thm, @kernel.Thm)] = @lib.Cell::new(
  "real_tybij",
)

///|
/// `real_tybij`
pub fn real_tybij() -> (@kernel.Thm, @kernel.Thm) {
  real_tybij_c.get()
}

///|
let real_of_num_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_of_num")

///|
/// `real_of_num`
pub fn real_of_num() -> @kernel.Thm {
  real_of_num_c.get()
}

///|
let real_of_num_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_of_num_th")

///|
/// `real_of_num_th`
pub fn real_of_num_th() -> @kernel.Thm {
  real_of_num_th_c.get()
}

///|
/// real_of_num, real_of_num_th
fn step_197() -> Unit raise {
  let (real_of_num, real_of_num_th) = @quot.lift_function(real_tybij().1)(
    (treal_eq_refl(), treal_eq_trans()),
  )("real_of_num")(treal_of_num_welldef())
  real_of_num_c.set(real_of_num)
  real_of_num_th_c.set(real_of_num_th)
}

///|
let real_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_neg")

///|
/// `real_neg`
pub fn real_neg() -> @kernel.Thm {
  real_neg_c.get()
}

///|
let real_neg_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_neg_th")

///|
/// `real_neg_th`
pub fn real_neg_th() -> @kernel.Thm {
  real_neg_th_c.get()
}

///|
/// real_neg, real_neg_th
fn step_198() -> Unit raise {
  let (real_neg, real_neg_th) = @quot.lift_function(real_tybij().1)(
    (treal_eq_refl(), treal_eq_trans()),
  )("real_neg")(treal_neg_welldef())
  real_neg_c.set(real_neg)
  real_neg_th_c.set(real_neg_th)
}

///|
let real_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_add")

///|
/// `real_add`
pub fn real_add() -> @kernel.Thm {
  real_add_c.get()
}

///|
let real_add_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_add_th")

///|
/// `real_add_th`
pub fn real_add_th() -> @kernel.Thm {
  real_add_th_c.get()
}

///|
/// real_add, real_add_th
fn step_199() -> Unit raise {
  let (real_add, real_add_th) = @quot.lift_function(real_tybij().1)(
    (treal_eq_refl(), treal_eq_trans()),
  )("real_add")(treal_add_welldef())
  real_add_c.set(real_add)
  real_add_th_c.set(real_add_th)
}

///|
let real_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_mul")

///|
/// `real_mul`
pub fn real_mul() -> @kernel.Thm {
  real_mul_c.get()
}

///|
let real_mul_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_mul_th")

///|
/// `real_mul_th`
pub fn real_mul_th() -> @kernel.Thm {
  real_mul_th_c.get()
}

///|
/// real_mul, real_mul_th
fn step_200() -> Unit raise {
  let (real_mul, real_mul_th) = @quot.lift_function(real_tybij().1)(
    (treal_eq_refl(), treal_eq_trans()),
  )("real_mul")(treal_mul_welldef())
  real_mul_c.set(real_mul)
  real_mul_th_c.set(real_mul_th)
}

///|
let real_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_le")

///|
/// `real_le`
pub fn real_le() -> @kernel.Thm {
  real_le_c.get()
}

///|
let real_le_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_le_th")

///|
/// `real_le_th`
pub fn real_le_th() -> @kernel.Thm {
  real_le_th_c.get()
}

///|
/// real_le, real_le_th
fn step_201() -> Unit raise {
  let (real_le, real_le_th) = @quot.lift_function(real_tybij().1)(
    (treal_eq_refl(), treal_eq_trans()),
  )("real_le")(treal_le_welldef())
  real_le_c.set(real_le)
  real_le_th_c.set(real_le_th)
}

///|
let real_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_inv")

///|
/// `real_inv`
pub fn real_inv() -> @kernel.Thm {
  real_inv_c.get()
}

///|
let real_inv_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_inv_th")

///|
/// `real_inv_th`
pub fn real_inv_th() -> @kernel.Thm {
  real_inv_th_c.get()
}

///|
/// real_inv, real_inv_th
fn step_202() -> Unit raise {
  let (real_inv, real_inv_th) = @quot.lift_function(real_tybij().1)(
    (treal_eq_refl(), treal_eq_trans()),
  )("real_inv")(treal_inv_welldef())
  real_inv_c.set(real_inv)
  real_inv_th_c.set(real_inv_th)
}

///|
let real_add_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_SYM")

///|
/// `REAL_ADD_SYM`
pub fn real_add_sym() -> @kernel.Thm {
  real_add_sym_c.get()
}

///|
let real_add_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_ASSOC")

///|
/// `REAL_ADD_ASSOC`
pub fn real_add_assoc() -> @kernel.Thm {
  real_add_assoc_c.get()
}

///|
let real_add_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_LID")

///|
/// `REAL_ADD_LID`
pub fn real_add_lid() -> @kernel.Thm {
  real_add_lid_c.get()
}

///|
let real_add_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_ADD_LINV")

///|
/// `REAL_ADD_LINV`
pub fn real_add_linv() -> @kernel.Thm {
  real_add_linv_c.get()
}

///|
let real_mul_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_SYM")

///|
/// `REAL_MUL_SYM`
pub fn real_mul_sym() -> @kernel.Thm {
  real_mul_sym_c.get()
}

///|
let real_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_ASSOC")

///|
/// `REAL_MUL_ASSOC`
pub fn real_mul_assoc() -> @kernel.Thm {
  real_mul_assoc_c.get()
}

///|
let real_mul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_LID")

///|
/// `REAL_MUL_LID`
pub fn real_mul_lid() -> @kernel.Thm {
  real_mul_lid_c.get()
}

///|
let real_add_ldistrib_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_ADD_LDISTRIB",
)

///|
/// `REAL_ADD_LDISTRIB`
pub fn real_add_ldistrib() -> @kernel.Thm {
  real_add_ldistrib_c.get()
}

///|
let real_le_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_REFL")

///|
/// `REAL_LE_REFL`
pub fn real_le_refl() -> @kernel.Thm {
  real_le_refl_c.get()
}

///|
let real_le_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_ANTISYM",
)

///|
/// `REAL_LE_ANTISYM`
pub fn real_le_antisym() -> @kernel.Thm {
  real_le_antisym_c.get()
}

///|
let real_le_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_TRANS")

///|
/// `REAL_LE_TRANS`
pub fn real_le_trans() -> @kernel.Thm {
  real_le_trans_c.get()
}

///|
let real_le_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_TOTAL")

///|
/// `REAL_LE_TOTAL`
pub fn real_le_total() -> @kernel.Thm {
  real_le_total_c.get()
}

///|
let real_le_ladd_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_LE_LADD_IMP",
)

///|
/// `REAL_LE_LADD_IMP`
pub fn real_le_ladd_imp() -> @kernel.Thm {
  real_le_ladd_imp_c.get()
}

///|
let real_le_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_LE_MUL")

///|
/// `REAL_LE_MUL`
pub fn real_le_mul() -> @kernel.Thm {
  real_le_mul_c.get()
}

///|
let real_inv_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_INV_0")

///|
/// `REAL_INV_0`
pub fn real_inv_0() -> @kernel.Thm {
  real_inv_0_c.get()
}

///|
let real_mul_linv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_MUL_LINV")

///|
/// `REAL_MUL_LINV`
pub fn real_mul_linv() -> @kernel.Thm {
  real_mul_linv_c.get()
}

///|
let real_of_num_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_NUM_EQ")

///|
/// `REAL_OF_NUM_EQ`
pub fn real_of_num_eq() -> @kernel.Thm {
  real_of_num_eq_c.get()
}

///|
let real_of_num_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_OF_NUM_LE")

///|
/// `REAL_OF_NUM_LE`
pub fn real_of_num_le() -> @kernel.Thm {
  real_of_num_le_c.get()
}

///|
let real_of_num_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_ADD",
)

///|
/// `REAL_OF_NUM_ADD`
pub fn real_of_num_add() -> @kernel.Thm {
  real_of_num_add_c.get()
}

///|
let real_of_num_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_OF_NUM_MUL",
)

///|
/// `REAL_OF_NUM_MUL`
pub fn real_of_num_mul() -> @kernel.Thm {
  real_of_num_mul_c.get()
}

///|
/// REAL_ADD_SYM, REAL_ADD_ASSOC, REAL_ADD_LID, REAL_ADD_LINV, REAL_MUL_SYM, REAL_MUL_ASSOC, REAL_MUL_LID, REAL_ADD_LDISTRIB, REAL_LE_REFL, REAL_LE_ANTISYM, REAL_LE_TRANS, REAL_LE_TOTAL, REAL_LE_LADD_IMP, REAL_LE_MUL, REAL_INV_0, REAL_MUL_LINV, REAL_OF_NUM_EQ, REAL_OF_NUM_LE, REAL_OF_NUM_ADD, REAL_OF_NUM_MUL
fn step_203() -> Unit raise {
  match
    @lib.map(
      @quot.lift_theorem(real_tybij())(
        (treal_eq_refl(), treal_eq_sym(), treal_eq_trans()),
      )(
        @list.List([
          real_of_num_th(),
          real_neg_th(),
          real_add_th(),
          real_mul_th(),
          real_le_th(),
          real_inv_th(),
        ]),
      ),
      @list.List([
        treal_add_sym(),
        treal_add_assoc(),
        treal_add_lid(),
        treal_add_linv(),
        treal_mul_sym(),
        treal_mul_assoc(),
        treal_mul_lid(),
        treal_add_ldistrib(),
        treal_le_refl(),
        treal_le_antisym(),
        treal_le_trans(),
        treal_le_total(),
        treal_le_ladd_imp(),
        treal_le_mul(),
        treal_inv_0(),
        treal_mul_linv(),
        treal_of_num_eq(),
        treal_of_num_le(),
        treal_of_num_add(),
        treal_of_num_mul(),
      ]),
    ) {
    More(
      real_add_sym,
      tail=More(
        real_add_assoc,
        tail=More(
          real_add_lid,
          tail=More(
            real_add_linv,
            tail=More(
              real_mul_sym,
              tail=More(
                real_mul_assoc,
                tail=More(
                  real_mul_lid,
                  tail=More(
                    real_add_ldistrib,
                    tail=More(
                      real_le_refl,
                      tail=More(
                        real_le_antisym,
                        tail=More(
                          real_le_trans,
                          tail=More(
                            real_le_total,
                            tail=More(
                              real_le_ladd_imp,
                              tail=More(
                                real_le_mul,
                                tail=More(
                                  real_inv_0,
                                  tail=More(
                                    real_mul_linv,
                                    tail=More(
                                      real_of_num_eq,
                                      tail=More(
                                        real_of_num_le,
                                        tail=More(
                                          real_of_num_add,
                                          tail=More(real_of_num_mul, tail=Empty)
                                        )
                                      )
                                    )
                                  )
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    ) => {
      real_add_sym_c.set(real_add_sym)
      real_add_assoc_c.set(real_add_assoc)
      real_add_lid_c.set(real_add_lid)
      real_add_linv_c.set(real_add_linv)
      real_mul_sym_c.set(real_mul_sym)
      real_mul_assoc_c.set(real_mul_assoc)
      real_mul_lid_c.set(real_mul_lid)
      real_add_ldistrib_c.set(real_add_ldistrib)
      real_le_refl_c.set(real_le_refl)
      real_le_antisym_c.set(real_le_antisym)
      real_le_trans_c.set(real_le_trans)
      real_le_total_c.set(real_le_total)
      real_le_ladd_imp_c.set(real_le_ladd_imp)
      real_le_mul_c.set(real_le_mul)
      real_inv_0_c.set(real_inv_0)
      real_mul_linv_c.set(real_mul_linv)
      real_of_num_eq_c.set(real_of_num_eq)
      real_of_num_le_c.set(real_of_num_le)
      real_of_num_add_c.set(real_of_num_add)
      real_of_num_mul_c.set(real_of_num_mul)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:1739:4")
  }
}

///|
/// realax.ml:1762
fn step_204() -> Unit raise {
  @printer.parse_as_prefix("--")
}

///|
/// realax.ml:1763
fn step_205() -> Unit raise {
  @printer.parse_as_infix("/", (22L, "left"))
}

///|
/// realax.ml:1764
fn step_206() -> Unit raise {
  @printer.parse_as_infix("pow", (24L, "left"))
}

///|
/// realax.ml:1766
fn step_207() -> Unit raise {
  let t2249 = ("&", @term_syntax.parse_term("real_of_num"))
  let t2250 = ("min", @term_syntax.parse_term("(real_min : (Real, Real) -> Real)"))
  let t2251 = ("max", @term_syntax.parse_term("(real_max : (Real, Real) -> Real)"))
  let t2252 = ("abs", @term_syntax.parse_term("(real_abs : (Real) -> Real)"))
  let t2253 = ("inv", @term_syntax.parse_term("real_inv"))
  let t2254 = ("pow", @term_syntax.parse_term("(real_pow : (Real, Num) -> Real)"))
  let t2255 = ("--", @term_syntax.parse_term("real_neg"))
  let t2256 = (">=", @term_syntax.parse_term("(real_ge : (Real, Real) -> Bool)"))
  let t2257 = (">", @term_syntax.parse_term("(real_gt : (Real, Real) -> Bool)"))
  let t2258 = ("<=", @term_syntax.parse_term("real_le"))
  let t2259 = ("<", @term_syntax.parse_term("(real_lt : (Real, Real) -> Bool)"))
  let t2260 = ("/", @term_syntax.parse_term("(real_div : (Real, Real) -> Real)"))
  let t2261 = ("*", @term_syntax.parse_term("real_mul"))
  let t2262 = ("-", @term_syntax.parse_term("(real_sub : (Real, Real) -> Real)"))
  @lib.do_list(
    fn(x2248 : (String, @kernel.Term)) -> Unit raise {
      @preterm.overload_interface(x2248.0, x2248.1)
    },
    @list.List([
      ("+", @term_syntax.parse_term("real_add")),
      t2262,
      t2261,
      t2260,
      t2259,
      t2258,
      t2257,
      t2256,
      t2255,
      t2254,
      t2253,
      t2252,
      t2251,
      t2250,
      t2249,
    ]),
  )
}

///|
/// `prioritize_real`
pub fn prioritize_real(x2263 : Unit) -> Unit raise {
  let _ = x2263
  @preterm.prioritize_overload(@kernel.mk_type("real", @list.List([])))
}

///|
/// real_sub
fn step_208() -> Unit raise {
  real_sub_c.set(@pair.new_definition(@term_syntax.parse_term("(real_sub : (Real, Real) -> Real)((x : Real), (y : Real)) == x + -y")))
}

///|
let real_sub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_sub")

///|
/// `real_sub`
pub fn real_sub() -> @kernel.Thm {
  real_sub_c.get()
}

///|
/// real_lt
fn step_209() -> Unit raise {
  real_lt_c.set(@pair.new_definition(@term_syntax.parse_term("(real_lt : (Real, Real) -> Bool)((x : Real), (y : Real)) == !(y <= x)")))
}

///|
let real_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_lt")

///|
/// `real_lt`
pub fn real_lt() -> @kernel.Thm {
  real_lt_c.get()
}

///|
/// real_ge
fn step_210() -> Unit raise {
  real_ge_c.set(@pair.new_definition(@term_syntax.parse_term("(real_ge : (Real, Real) -> Bool)((x : Real), (y : Real)) == (y <= x)")))
}

///|
let real_ge_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_ge")

///|
/// `real_ge`
pub fn real_ge() -> @kernel.Thm {
  real_ge_c.get()
}

///|
/// real_gt
fn step_211() -> Unit raise {
  real_gt_c.set(@pair.new_definition(@term_syntax.parse_term("(real_gt : (Real, Real) -> Bool)((x : Real), (y : Real)) == real_lt(y, x)")))
}

///|
let real_gt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_gt")

///|
/// `real_gt`
pub fn real_gt() -> @kernel.Thm {
  real_gt_c.get()
}

///|
/// real_abs
fn step_212() -> Unit raise {
  real_abs_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(real_abs : (Real) -> Real)((x : Real)) == (if real_of_num(0) <= x { x } else { -x })"),
    ),
  )
}

///|
let real_abs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_abs")

///|
/// `real_abs`
pub fn real_abs() -> @kernel.Thm {
  real_abs_c.get()
}

///|
/// real_pow
fn step_213() -> Unit raise {
  let t2264 = @term_syntax.parse_term("(real_pow : (Real, Num) -> Real)((x : Real), 0) == real_of_num(1) && (∀ n : Num, real_pow(x, SUC(n)) == x * real_pow(x, n))")
  real_pow_c.set(
    @recursion.new_recursive_definition(@nums.num_recursion())(t2264),
  )
}

///|
let real_pow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_pow")

///|
/// `real_pow`
pub fn real_pow() -> @kernel.Thm {
  real_pow_c.get()
}

///|
/// real_div
fn step_214() -> Unit raise {
  real_div_c.set(@pair.new_definition(@term_syntax.parse_term("(real_div : (Real, Real) -> Real)((x : Real), (y : Real)) == x * inv(y)")))
}

///|
let real_div_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_div")

///|
/// `real_div`
pub fn real_div() -> @kernel.Thm {
  real_div_c.get()
}

///|
/// real_max
fn step_215() -> Unit raise {
  real_max_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(real_max : (Real, Real) -> Real)((m : Real), (n : Real)) == (if m <= n { n } else { m })"),
    ),
  )
}

///|
let real_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_max")

///|
/// `real_max`
pub fn real_max() -> @kernel.Thm {
  real_max_c.get()
}

///|
/// real_min
fn step_216() -> Unit raise {
  real_min_c.set(
    @pair.new_definition(
      @term_syntax.parse_term("(real_min : (Real, Real) -> Real)((m : Real), (n : Real)) == (if m <= n { m } else { n })"),
    ),
  )
}

///|
let real_min_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("real_min")

///|
/// `real_min`
pub fn real_min() -> @kernel.Thm {
  real_min_c.get()
}

///|
/// REAL_HREAL_LEMMA1
fn step_217() -> Unit raise {
  let t2323 = @simp.rewrite_tac(@list.List([hreal_le_add()]))
  let t2322 = @simp.gen_rewrite_tac(
    fn(
      x2319 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2320 = @equal.rand_conv(x2319)
      fn(x2321 : @kernel.Term) -> @kernel.Thm raise { s2320(x2321) }
    },
    @list.List([@equal.gsym(hreal_add_lid())]),
  )
  let t2318 = @simp.rewrite_tac(@list.List([hreal_add_lid(), hreal_add_rid()]))
  let t2317 = @simp.rewrite_tac(@list.List([treal_of_num(), treal_le()]))
  let t2315 = @equal.gsym(real_le_th())
  let t2316 = @simp.rewrite_tac(
    @list.List([@equal.gsym(real_of_num_th()), t2315]),
  )
  let t2324 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.disch_then(
              @tactics.choose_then(fn(
                x2312 : @kernel.Thm,
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
                let s2313 = @tactics.subst1_tac(x2312)
                fn(
                  x2314 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  s2313(x2314)
                }
              }),
            ),
            t2316,
          ),
          t2317,
        ),
        t2318,
      ),
      t2322,
    ),
    t2323,
  )
  let t2311 = @simp.rewrite_tac(@list.List([hreal_add_rid()]))
  let t2310 = @simp.rewrite_tac(
    @list.List([@equal.gsym(hreal_add_assoc()), hreal_eq_add_lcancel()]),
  )
  let t2309 = @simp.gen_rewrite_tac(
    fn(
      x2308 : (@kernel.Term) -> @kernel.Thm raise,
    ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(
        x2302 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2303 = @equal.land_conv(x2302)
        fn(x2304 : @kernel.Term) -> @kernel.Thm raise { s2303(x2304) }
      })(
        (fn(
          x2305 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2306 = @equal.rand_conv(x2305)
          fn(x2307 : @kernel.Term) -> @kernel.Thm raise { s2306(x2307) }
        })(x2308),
      )
    },
    @list.List([hreal_add_sym()]),
  )
  let t2301 = @simp.pure_rewrite_tac(@list.List([treal_eq()]))
  let t2300 = @tactics.subst1_tac(
    @equal.gsym(@bool.ispec(@term_syntax.parse_term("(q : (Hreal, Hreal))"), @pair.pair())),
  )
  let t2299 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : (Hreal, Hreal))"))
  let t2298 = @simp.once_rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t2297 = @tactics.exists_tac(@term_syntax.parse_term("(d : Hreal)"))
  let t2293 = @drule.match_mp(hreal_le_exists())
  let t2294 = @tactics.x_choose_then(@term_syntax.parse_term("(d : Hreal)"))(fn(
    x2290 : @kernel.Thm,
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
    let s2291 = @tactics.subst1_tac(x2290)
    fn(
      x2292 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2291(x2292)
    }
  })
  let t2296 = @tactics.disch_then(fn(
    x2295 : @kernel.Thm,
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
    t2294(t2293(x2295))
  })
  let t2289 = @simp.pure_rewrite_tac(
    @list.List([hreal_add_lid(), hreal_add_rid()]),
  )
  let t2288 = @simp.pure_rewrite_tac(@list.List([treal_of_num(), treal_le()]))
  let t2287 = @tactics.subst1_tac(
    @equal.gsym(@bool.ispec(@term_syntax.parse_term("(p : (Hreal, Hreal))"), @pair.pair())),
  )
  let t2285 = @equal.gsym(real_le_th())
  let t2286 = @simp.rewrite_tac(
    @list.List([@equal.gsym(real_of_num_th()), t2285]),
  )
  let t2284 = @tactics.disch_then(fn(
    x2281 : @kernel.Thm,
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
    let s2282 = @tactics.subst1_tac(x2281)
    fn(
      x2283 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2282(x2283)
    }
  })
  let t2280 = @simp.rewrite_tac(@list.List([real_tybij().0]))
  let t2276 = @term_syntax.parse_term("mk_real")
  let t2279 = @tactics.disch_then(fn(
    x2278 : @kernel.Thm,
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
      x2273 : @kernel.Thm,
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
      let s2274 = @tactics.mp_tac(x2273)
      fn(
        x2275 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2274(x2275)
      }
    })(((x2277 : @kernel.Thm) => @equal.ap_term(t2276, x2277))(x2278))
  })
  let t2272 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(p : (Hreal, Hreal))"))(fn(
      x2269 : @kernel.Thm,
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
      let s2270 = @tactics.mp_tac(x2269)
      fn(
        x2271 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2270(x2271)
      }
    }),
  )
  let t2268 = @simp.rewrite_tac(@list.List([real_tybij().0]))
  let t2267 = @term_syntax.parse_term("(r : ((Hreal, Hreal)) -> Bool)")
  let t2325 = @list.List([
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
                          @tactics.then_tac(
                            @tactics.then_tac(
                              @tactics.then_tac(
                                @tactics.then_tac(
                                  @tactics.then_tac(
                                    @tactics.then_tac(
                                      @tactics.then_tac(
                                        @tactics.then_tac(
                                          @tactics.mp_tac(
                                            @kernel.inst_rule(
                                              @list.List([
                                                (
                                                  @term_syntax.parse_term("dest_real((x : Real))"),
                                                  t2267,
                                                ),
                                              ]),
                                              real_tybij().1,
                                            ),
                                          ),
                                          t2268,
                                        ),
                                        t2272,
                                      ),
                                      t2279,
                                    ),
                                    t2280,
                                  ),
                                  t2284,
                                ),
                                t2286,
                              ),
                              t2287,
                            ),
                            t2288,
                          ),
                          t2289,
                        ),
                        t2296,
                      ),
                      t2297,
                    ),
                    @tactics.ap_term_tac,
                  ),
                  t2298,
                ),
                t2299,
              ),
              t2300,
            ),
            t2301,
          ),
          t2309,
        ),
        t2310,
      ),
      t2311,
    ),
    t2324,
  ])
  let t2266 = @simp.rewrite_tac(
    @list.List([treal_le(), hreal_add_lid(), hreal_add_rid()]),
  )
  let t2265 = @simp.rewrite_tac(@list.List([@equal.gsym(real_le_th())]))
  let t2326 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.exists_tac(
              @term_syntax.parse_term("(y : Hreal) => mk_real(treal_eq((y, hreal_of_num(0))))"),
            ),
            t2265,
          ),
          t2266,
        ),
        @tactics.gen_tac,
      ),
      @tactics.eq_tac,
    ),
    t2325,
  )
  real_hreal_lemma1_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∃ r : (Hreal) -> Real, (∀ x : Real, (real_of_num(0) <= x) == (∃ y : Hreal, x == r(y))) && (∀ y : Hreal, ∀ z : Hreal, (y <= z) == (r(y) <= r(z)))"),
      t2326,
    ),
  )
}

///|
let real_hreal_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_HREAL_LEMMA1",
)

///|
/// `REAL_HREAL_LEMMA1`
pub fn real_hreal_lemma1() -> @kernel.Thm {
  real_hreal_lemma1_c.get()
}

///|
/// REAL_HREAL_LEMMA2
fn step_218() -> Unit raise {
  let t2351 = @tactics.disch_then(fn(
    x2350 : @kernel.Thm,
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
      x2349 : @kernel.Thm,
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
        x2346 : @kernel.Thm,
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
        let s2347 = @tactics.accept_tac(x2346)
        fn(
          x2348 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2347(x2348)
        }
      })(@equal.sym(x2349))
    })(@class.select_rule(x2350))
  })
  let t2344 = @equal.gsym(@theorems.exists_refl())
  let t2343 = @bool.spec_all(@class.select_refl())
  let t2345 = @simp.asm_rewrite_tac(
    @list.List([
      @simp.gen_rewrite_rule(
        fn(
          x2342 : (@kernel.Term) -> @kernel.Thm raise,
        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(
            x2336 : (@kernel.Term) -> @kernel.Thm raise,
          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s2337 = @equal.land_conv(x2336)
            fn(x2338 : @kernel.Term) -> @kernel.Thm raise { s2337(x2338) }
          })(
            (fn(
              x2339 : (@kernel.Term) -> @kernel.Thm raise,
            ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
              let s2340 = @equal.binder_conv(x2339)
              fn(x2341 : @kernel.Term) -> @kernel.Thm raise { s2340(x2341) }
            })(x2342),
          )
        },
        @list.List([@theorems.eq_sym_eq()]),
      )(t2343),
      t2344,
    ]),
  )
  let t2334 = @equal.gsym(hreal_le_antisym())
  let t2335 = @list.List([
    @simp.asm_rewrite_tac(@list.List([@equal.gsym(real_le_antisym()), t2334])),
    @tactics.all_tac,
  ])
  let t2333 = @tactics.subgoal_then(
    @term_syntax.parse_term("∀ y : Hreal, ∀ z : Hreal, ((r : (Hreal) -> Real)(y) == r(z)) == (y == z)"),
    fn(
      x2330 : @kernel.Thm,
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
      let s2331 = @tactics.assume_tac(x2330)
      fn(
        x2332 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2331(x2332)
      }
    },
  )
  let t2329 = @simp.asm_rewrite_tac(@list.List([@theorems.beta_thm()]))
  let t2328 = @tactics.exists_tac(@term_syntax.parse_term("(r : (Hreal) -> Real)"))
  let t2327 = @tactics.exists_tac(
    @term_syntax.parse_term("(x : Real) => select((y : Hreal) => x == (r : (Hreal) -> Real)(y))"),
  )
  let t2352 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.strip_assume_tac(real_hreal_lemma1()),
                  t2327,
                ),
                t2328,
              ),
              t2329,
            ),
            t2333,
          ),
          t2335,
        ),
        t2345,
      ),
      @tactics.gen_tac,
    ),
    t2351,
  )
  real_hreal_lemma2_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∃ h : (Real) -> Hreal, ∃ r : (Hreal) -> Real, (∀ x : Hreal, h(r(x)) == x) && (∀ x : Real, real_of_num(0) <= x → r(h(x)) == x) && (∀ x : Hreal, real_of_num(0) <= r(x)) && (∀ x : Hreal, ∀ y : Hreal, (x <= y) == (r(x) <= r(y)))"),
      t2352,
    ),
  )
}

///|
let real_hreal_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_HREAL_LEMMA2",
)

///|
/// `REAL_HREAL_LEMMA2`
pub fn real_hreal_lemma2() -> @kernel.Thm {
  real_hreal_lemma2_c.get()
}

///|
/// REAL_COMPLETE_SOMEPOS
fn step_219() -> Unit raise {
  let t2428 = @simp.asm_rewrite_tac(@list.List([]))
  let t2427 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2426 = @simp.asm_rewrite_tac(@list.List([]))
  let t2425 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real)"))
  let t2424 = @tactics.match_mp_tac(real_le_trans())
  let t2423 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2420 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t2421 = @tactics.then_tac(
    @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2420),
    @tactics.ap_term_tac,
  )
  let t2419 = @tactics.subgoal_then(
    @term_syntax.parse_term("(r : (Hreal) -> Real)((h : (Real) -> Hreal)((C : Real))) == C"),
    fn(
      x2417 : @kernel.Thm,
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
      let th_1 = x2417
      @simp.asm_rewrite_tac(@list.List([th_1]))
    },
  )
  let t2416 = @simp.asm_rewrite_tac(@list.List([]))
  let t2422 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t2416),
      t2419,
    ),
    t2421,
  ])
  let t2415 = @tactics.subgoal_then(
    @term_syntax.parse_term("(B : Hreal) <= (h : (Real) -> Hreal)((C : Real))"),
    fn(
      x2412 : @kernel.Thm,
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
      let s2413 = @tactics.mp_tac(x2412)
      fn(
        x2414 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2413(x2414)
      }
    },
  )
  let t2429 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.thenl(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.x_gen_tac(@term_syntax.parse_term("(C : Real)")),
                    @tactics.disch_tac,
                  ),
                  t2415,
                ),
                t2422,
              ),
              t2423,
            ),
            t2424,
          ),
          t2425,
        ),
        t2426,
      ),
      t2427,
    ),
    t2428,
  )
  let t2409 = @simp.asm_rewrite_tac(@list.List([]))
  let t2408 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)"))
  let t2410 = @tactics.then_tac(
    @tactics.then_tac(@tactics.match_mp_tac(real_le_trans()), t2408),
    t2409,
  )
  let t2407 = @simp.asm_rewrite_tac(@list.List([]))
  let t2406 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2405 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(b : Bool) == (a : Bool) → a → b")),
  )
  let t2404 = @tactics.undisch_tac(@term_syntax.parse_term("(P : (Real) -> Bool)((z : Real))"))
  let t2403 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2402 = @tactics.first_assum(fn(
    x2399 : @kernel.Thm,
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
    let th = x2399
    @simp.gen_rewrite_tac(
      fn(
        x2401 : (@kernel.Term) -> @kernel.Thm raise,
      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        x2401
      },
      @list.List([@equal.gsym(th)]),
    )
  })
  let t2398 = @kernel.assume_rule(@term_syntax.parse_term("real_of_num(0) <= (z : Real)"))
  let t2411 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.ante_res_then(fn(
                    x2397 : @kernel.Thm,
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
                      x2394 : @kernel.Thm,
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
                      let s2395 = @tactics.subst1_tac(x2394)
                      fn(
                        x2396 : (
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
                        s2395(x2396)
                      }
                    })(@equal.sym(x2397))
                  })(t2398),
                  t2402,
                ),
                t2403,
              ),
              t2404,
            ),
            t2405,
          ),
          @tactics.ap_term_tac,
        ),
        t2406,
      ),
      t2407,
    ),
    t2410,
  ])
  let t2392 = @term_syntax.parse_term("(z : Real)")
  let t2393 = @tactics.disj_cases_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("real_of_num(0)"), t2392]), real_le_total()),
  )
  let t2430 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.x_gen_tac(@term_syntax.parse_term("(z : Real)")),
          @tactics.disch_tac,
        ),
        t2393,
      ),
      t2411,
    ),
    t2429,
  ])
  let t2391 = @tactics.exists_tac(@term_syntax.parse_term("(r : (Hreal) -> Real)((B : Hreal))"))
  let t2388 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(B : Hreal)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2389 = @tactics.then_tac(
    @tactics.match_mp_tac(
      @class.taut(@term_syntax.parse_term("((b : Bool) → (c : Bool)) → (a : Bool) → (a → b) → c")),
    ),
    t2388,
  )
  let t2386 = @simp.asm_rewrite_tac(@list.List([]))
  let t2385 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2384 = @simp.asm_rewrite_tac(@list.List([]))
  let t2383 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real)"))
  let t2382 = @tactics.match_mp_tac(real_le_trans())
  let t2381 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2380 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(b : Bool) == (a : Bool) → a → b")),
  )
  let t2379 = @simp.asm_rewrite_tac(@list.List([]))
  let t2378 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
      x2375 : @kernel.Thm,
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
      let s2376 = @tactics.mp_tac(x2375)
      fn(
        x2377 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2376(x2377)
      }
    }),
  )
  let t2374 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Hreal)"))
  let t2387 = @tactics.then_tac(
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
                        @tactics.exists_tac(
                          @term_syntax.parse_term("(h : (Real) -> Hreal)((M : Real))"),
                        ),
                        t2374,
                      ),
                      t2378,
                    ),
                    t2379,
                  ),
                  t2380,
                ),
                @tactics.ap_term_tac,
              ),
              t2381,
            ),
            t2382,
          ),
          t2383,
        ),
        t2384,
      ),
      t2385,
    ),
    t2386,
  )
  let t2373 = @simp.asm_rewrite_tac(@list.List([]))
  let t2372 = @tactics.first_assum(@tactics.match_mp_tac)
  let t2371 = @tactics.match_mp_tac(
    @class.taut(@term_syntax.parse_term("(b : Bool) == (a : Bool) → a → b")),
  )
  let t2370 = @tactics.undisch_tac(@term_syntax.parse_term("(P : (Real) -> Bool)((x : Real))"))
  let t2390 = @list.List([
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.exists_tac(@term_syntax.parse_term("(h : (Real) -> Hreal)((x : Real))")),
                  t2370,
                ),
                t2371,
              ),
              @tactics.ap_term_tac,
            ),
            t2372,
          ),
          t2373,
        ),
        t2387,
      ]),
    ),
    t2389,
  ])
  let t2354 = @tactics.mp_tac(
    @bool.spec(
      @term_syntax.parse_term("(y : Hreal) => (P : (Real) -> Bool)((r : (Hreal) -> Real)(y))"),
      hreal_complete(),
    ),
  )
  let t2353 = @tactics.strip_assume_tac(real_hreal_lemma2())
  let t2431 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.repeat_tac(@tactics.strip_tac),
                  t2353,
                ),
                t2354,
              ),
              @tactics.beta_tac,
            ),
            fn(
              x2369 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                x2368 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  x2366 : @kernel.Term,
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
                    x2362 : @kernel.Term,
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
                      x2355 : @kernel.Term,
                    ) -> ((
                      (@kernel.Thm) -> ((
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
                      ) raise) raise,
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
                    ) raise) raise) raise {
                      fn(
                        x2356 : (@kernel.Thm) -> ((
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
                        ) raise) raise,
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
                        let s2357 = @tactics.subgoal_then(x2355, x2356)
                        fn(
                          x2358 : (
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
                          s2357(x2358)
                        }
                      }
                    })(x2362)(fn(
                      x2359 : @kernel.Thm,
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
                      let s2360 = @tactics.mp_tac(x2359)
                      fn(
                        x2361 : (
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
                        s2360(x2361)
                      }
                    })
                  })(
                    ((x2365 : @kernel.Term) => {
                      @lib.funpow(
                        2,
                        fn(x2364 : @kernel.Term) -> @kernel.Term raise {
                          (fn(
                            x2363 : (@kernel.Term, @kernel.Term),
                          ) -> @kernel.Term raise {
                            x2363.0
                          })(@basics.dest_imp(x2364))
                        },
                        x2365,
                      )
                    })(x2366),
                  )
                })(
                  (fn(
                    x2367 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> @kernel.Term raise {
                    x2367.1
                  })(x2368),
                )
              })(x2369)(x2369)
            },
          ),
          t2390,
        ),
        t2391,
      ),
      @tactics.conj_tac,
    ),
    t2430,
  )
  real_complete_somepos_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, (∃ x : Real, P(x) && real_of_num(0) <= x) && (∃ M : Real, ∀ x : Real, P(x) → x <= M) → (∃ M : Real, (∀ x : Real, P(x) → x <= M) && (∀ M' : Real, (∀ x : Real, P(x) → x <= M') → M <= M'))"),
      t2431,
    ),
  )
}

///|
let real_complete_somepos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new(
  "REAL_COMPLETE_SOMEPOS",
)

///|
/// `REAL_COMPLETE_SOMEPOS`
pub fn real_complete_somepos() -> @kernel.Thm {
  real_complete_somepos_c.get()
}

///|
/// REAL_COMPLETE
fn step_220() -> Unit raise {
  let t2433 = @simp.rewrite_tac(@list.List([real_add_lid()]))
  let t2432 = @simp.once_rewrite_tac(@list.List([real_add_sym()]))
  let t2434 = @tactics.then_tac(
    @tactics.then_tac(
      @simp.rewrite_tac(
        @list.List([real_sub(), @equal.gsym(real_add_assoc()), real_add_linv()]),
      ),
      t2432,
    ),
    t2433,
  )
  let lemma = @tactics.prove(@term_syntax.parse_term("(y : Real) == real_sub(y, (x : Real)) + x"), t2434)
  let t2558 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([real_add_sym()]))(real_add_lid()),
    ]),
  )
  let t2557 = @simp.rewrite_tac(
    @list.List([@equal.gsym(real_add_assoc()), real_add_linv()]),
  )
  let t2556 = @simp.rewrite_tac(@list.List([real_sub()]))
  let t2559 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @simp.once_rewrite_tac(@list.List([real_add_sym()])),
        t2556,
      ),
      t2557,
    ),
    t2558,
  )
  let t2560 = @list.List([@tactics.match_accept_tac(real_add_sym()), t2559])
  let t2555 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t2553 = @drule.match_mp(real_le_ladd_imp())
  let t2550 = @term_syntax.parse_term("(x : Real)")
  let t2561 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.disch_then(fn(
          x2554 : @kernel.Thm,
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
            x2552 : @kernel.Thm,
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
              x2547 : @kernel.Thm,
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
              let s2548 = @tactics.mp_tac(x2547)
              fn(
                x2549 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                s2548(x2549)
              }
            })(((x2551 : @kernel.Thm) => @bool.spec(t2550, x2551))(x2552))
          })(t2553(x2554))
        }),
        t2555,
      ),
      @tactics.binop_tac,
    ),
    t2560,
  )
  let t2544 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([real_add_sym()]))(real_add_lid()),
    ]),
  )
  let t2543 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([real_add_sym()]))(real_add_linv()),
    ]),
  )
  let t2542 = @simp.rewrite_tac(@list.List([@equal.gsym(real_add_assoc())]))
  let t2541 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t2540 = @simp.rewrite_tac(@list.List([real_sub()]))
  let t2539 = @simp.once_rewrite_tac(@list.List([real_add_sym()]))
  let t2537 = @drule.match_mp(real_le_ladd_imp())
  let t2534 = @term_syntax.parse_term("-(x : Real)")
  let t2545 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.disch_then(fn(
                    x2538 : @kernel.Thm,
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
                      x2536 : @kernel.Thm,
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
                        x2531 : @kernel.Thm,
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
                        let s2532 = @tactics.mp_tac(x2531)
                        fn(
                          x2533 : (
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
                          s2532(x2533)
                        }
                      })(
                        ((x2535 : @kernel.Thm) => @bool.spec(t2534, x2535))(
                          x2536,
                        ),
                      )
                    })(t2537(x2538))
                  }),
                  t2539,
                ),
                t2540,
              ),
              t2541,
            ),
            @tactics.ap_thm_tac,
          ),
          @tactics.ap_term_tac,
        ),
        t2542,
      ),
      t2543,
    ),
    t2544,
  )
  let t2530 = @simp.asm_rewrite_tac(@list.List([]))
  let t2546 = @list.List([
    @tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t2530),
    t2545,
  ])
  let t2529 = @tactics.subgoal_then(@term_syntax.parse_term("(z : Real) + (x : Real) <= (M' : Real)"), fn(
    x2526 : @kernel.Thm,
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
    let s2527 = @tactics.mp_tac(x2526)
    fn(
      x2528 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2527(x2528)
    }
  })
  let t2525 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Real)"))
  let t2562 = @list.List([
    @tactics.thenl(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t2525),
          @tactics.disch_tac,
        ),
        t2529,
      ),
      t2546,
    ),
    t2561,
  ])
  let t2524 = @tactics.subgoal_then(@term_syntax.parse_term("(B : Real) <= real_sub((M' : Real), (x : Real))"), fn(
    x2521 : @kernel.Thm,
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
    let s2522 = @tactics.mp_tac(x2521)
    fn(
      x2523 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
      s2522(x2523)
    }
  })
  let t2563 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2524),
    t2562,
  )
  let t2520 = @simp.asm_rewrite_tac(@list.List([]))
  let t2519 = @simp.once_rewrite_tac(@list.List([real_add_sym()]))
  let t2518 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2517 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([real_add_sym()]))(real_add_lid()),
    ]),
  )
  let t2516 = @simp.rewrite_tac(
    @list.List([real_sub(), @equal.gsym(real_add_assoc()), real_add_linv()]),
  )
  let t2515 = @simp.once_rewrite_tac(@list.List([real_add_sym()]))
  let t2512 = @drule.match_mp(real_le_ladd_imp())
  let t2509 = @term_syntax.parse_term("(x : Real)")
  let t2514 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
      x2513 : @kernel.Thm,
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
        x2511 : @kernel.Thm,
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
          x2506 : @kernel.Thm,
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
          let s2507 = @tactics.mp_tac(x2506)
          fn(
            x2508 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
            s2507(x2508)
          }
        })(((x2510 : @kernel.Thm) => @bool.spec(t2509, x2510))(x2511))
      })(t2512(x2513))
    }),
  )
  let t2564 = @list.List([
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.gen_tac,
                    @simp.gen_rewrite_tac(
                      fn(
                        x2505 : (@kernel.Term) -> @kernel.Thm raise,
                      ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                        (fn(
                          x2499 : (@kernel.Term) -> @kernel.Thm raise,
                        ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                          let s2500 = @equal.land_conv(x2499)
                          fn(x2501 : @kernel.Term) -> @kernel.Thm raise {
                            s2500(x2501)
                          }
                        })(
                          (fn(
                            x2502 : (@kernel.Term) -> @kernel.Thm raise,
                          ) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
                            let s2503 = @equal.rand_conv(x2502)
                            fn(x2504 : @kernel.Term) -> @kernel.Thm raise {
                              s2503(x2504)
                            }
                          })(x2505),
                        )
                      },
                      @list.List([lemma]),
                    ),
                  ),
                  t2514,
                ),
                t2515,
              ),
              t2516,
            ),
            t2517,
          ),
          t2518,
        ),
        t2519,
      ),
      t2520,
    ),
    t2563,
  ])
  let t2498 = @tactics.exists_tac(@term_syntax.parse_term("(B : Real) + (x : Real)"))
  let t2495 = @tactics.disch_then(
    @tactics.x_choose_then(@term_syntax.parse_term("(B : Real)"))(
      @tactics.strip_assume_tac,
    ),
  )
  let t2496 = @tactics.then_tac(
    @tactics.match_mp_tac(
      @class.taut(@term_syntax.parse_term("((b : Bool) → (c : Bool)) → (a : Bool) → (a → b) → c")),
    ),
    t2495,
  )
  let t2493 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([real_add_sym()]))(real_add_lid()),
    ]),
  )
  let t2492 = @simp.rewrite_tac(
    @list.List([
      @simp.once_rewrite_rule(@list.List([real_add_sym()]))(real_add_linv()),
    ]),
  )
  let t2491 = @simp.rewrite_tac(@list.List([@equal.gsym(real_add_assoc())]))
  let t2488 = @simp.once_rewrite_rule(@list.List([real_add_sym()]))
  let t2490 = @tactics.disch_then(fn(
    x2489 : @kernel.Thm,
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
      x2485 : @kernel.Thm,
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
      let s2486 = @tactics.mp_tac(x2485)
      fn(
        x2487 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2486(x2487)
      }
    })(t2488(x2489))
  })
  let t2482 = @drule.match_mp(real_le_ladd_imp())
  let t2479 = @term_syntax.parse_term("-(x : Real)")
  let t2484 = @tactics.disch_then(fn(
    x2483 : @kernel.Thm,
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
      x2481 : @kernel.Thm,
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
        x2476 : @kernel.Thm,
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
        let s2477 = @tactics.mp_tac(x2476)
        fn(
          x2478 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
          s2477(x2478)
        }
      })(((x2480 : @kernel.Thm) => @bool.spec(t2479, x2480))(x2481))
    })(t2482(x2483))
  })
  let t2475 = @tactics.disch_then(
    @tactics.ante_res_then(fn(
      x2472 : @kernel.Thm,
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
      let s2473 = @tactics.mp_tac(x2472)
      fn(
        x2474 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2473(x2474)
      }
    }),
  )
  let t2494 = @tactics.then_tac(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.then_tac(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.exists_tac(@term_syntax.parse_term("(M : Real) + -(x : Real)")),
                @tactics.gen_tac,
              ),
              t2475,
            ),
            t2484,
          ),
          t2490,
        ),
        t2491,
      ),
      t2492,
    ),
    t2493,
  )
  let t2471 = @simp.asm_rewrite_tac(
    @list.List([real_le_refl(), real_add_lid()]),
  )
  let t2497 = @list.List([
    @tactics.thenl(
      @tactics.conj_tac,
      @list.List([
        @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)")), t2471),
        t2494,
      ]),
    ),
    t2496,
  ])
  let t2455 = @tactics.mp_tac(
    @bool.spec(
      @term_syntax.parse_term("(y : Real) => (P : (Real) -> Bool)(y + (x : Real))"),
      real_complete_somepos(),
    ),
  )
  let t2454 = @simp.rewrite_tac(@list.List([real_add_lid()]))
  let t2453 = @simp.once_rewrite_tac(@list.List([real_add_sym()]))
  let t2452 = @simp.rewrite_tac(@list.List([real_add_linv()]))
  let t2448 = @term_syntax.parse_term("-(x : Real)")
  let t2451 = @tactics.disch_then(fn(
    x2450 : @kernel.Thm,
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
      x2445 : @kernel.Thm,
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
      let s2446 = @tactics.mp_tac(x2445)
      fn(
        x2447 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
        s2446(x2447)
      }
    })(((x2449 : @kernel.Thm) => @bool.spec(t2448, x2449))(x2450))
  })
  let t2443 = @drule.match_mp(real_le_ladd_imp())
  let t2565 = @tactics.thenl(
    @tactics.then_tac(
      @tactics.then_tac(
        @tactics.thenl(
          @tactics.then_tac(
            @tactics.then_tac(
              @tactics.then_tac(
                @tactics.then_tac(
                  @tactics.then_tac(
                    @tactics.then_tac(
                      @tactics.then_tac(
                        @tactics.then_tac(
                          @tactics.first_assum(fn(
                            x2444 : @kernel.Thm,
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
                            (fn(
                              x2440 : @kernel.Thm,
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
                              let s2441 = @tactics.mp_tac(x2440)
                              fn(
                                x2442 : (
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
                                s2441(x2442)
                              }
                            })(t2443(x2444))
                          }),
                          t2451,
                        ),
                        t2452,
                      ),
                      t2453,
                    ),
                    t2454,
                  ),
                  @tactics.disch_tac,
                ),
                t2455,
              ),
              @tactics.beta_tac,
            ),
            fn(
              x2470 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                x2469 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
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
                  x2467 : @kernel.Term,
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
                    x2463 : @kernel.Term,
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
                      x2456 : @kernel.Term,
                    ) -> ((
                      (@kernel.Thm) -> ((
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
                      ) raise) raise,
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
                    ) raise) raise) raise {
                      fn(
                        x2457 : (@kernel.Thm) -> ((
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
                        ) raise) raise,
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
                        let s2458 = @tactics.subgoal_then(x2456, x2457)
                        fn(
                          x2459 : (
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
                          s2458(x2459)
                        }
                      }
                    })(x2463)(fn(
                      x2460 : @kernel.Thm,
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
                      let s2461 = @tactics.mp_tac(x2460)
                      fn(
                        x2462 : (
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
                        s2461(x2462)
                      }
                    })
                  })(
                    ((x2466 : @kernel.Term) => {
                      @lib.funpow(
                        2,
                        fn(x2465 : @kernel.Term) -> @kernel.Term raise {
                          (fn(
                            x2464 : (@kernel.Term, @kernel.Term),
                          ) -> @kernel.Term raise {
                            x2464.0
                          })(@basics.dest_imp(x2465))
                        },
                        x2466,
                      )
                    })(x2467),
                  )
                })(
                  (fn(
                    x2468 : (@list.List[(String, @kernel.Thm)], @kernel.Term),
                  ) -> @kernel.Term raise {
                    x2468.1
                  })(x2469),
                )
              })(x2470)(x2470)
            },
          ),
          t2497,
        ),
        t2498,
      ),
      @tactics.conj_tac,
    ),
    t2564,
  )
  let t2439 = @simp.asm_rewrite_tac(@list.List([]))
  let t2437 = @tactics.exists_tac(@term_syntax.parse_term("(M : Real)"))
  let t2438 = @list.List([
    @tactics.exists_tac(@term_syntax.parse_term("(x : Real)")),
    t2437,
  ])
  let t2566 = @list.List([
    @tactics.then_tac(
      @tactics.thenl(
        @tactics.then_tac(
          @tactics.match_mp_tac(real_complete_somepos()),
          @tactics.conj_tac,
        ),
        t2438,
      ),
      t2439,
    ),
    t2565,
  ])
  let t2435 = @term_syntax.parse_term("(x : Real)")
  let t2436 = @tactics.disj_cases_tac(
    @bool.specl(@list.List([@term_syntax.parse_term("real_of_num(0)"), t2435]), real_le_total()),
  )
  let t2567 = @tactics.thenl(
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2436),
    t2566,
  )
  real_complete_c.set(
    @tactics.prove(
      @term_syntax.parse_term("∀ P : (Real) -> Bool, (∃ x : Real, P(x)) && (∃ M : Real, ∀ x : Real, P(x) → x <= M) → (∃ M : Real, (∀ x : Real, P(x) → x <= M) && (∀ M' : Real, (∀ x : Real, P(x) → x <= M') → M <= M'))"),
      t2567,
    ),
  )
}

///|
let real_complete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_COMPLETE")

///|
/// `REAL_COMPLETE`
pub fn real_complete() -> @kernel.Thm {
  real_complete_c.get()
}

///|
/// realax.ml:1967
fn step_221() -> Unit raise {
  let t2569 = ("inv", @term_syntax.parse_term("hreal_inv"))
  let t2570 = ("<=", @term_syntax.parse_term("hreal_le"))
  let t2571 = ("*", @term_syntax.parse_term("hreal_mul"))
  @lib.do_list(
    fn(x2568 : (String, @kernel.Term)) -> Unit raise {
      @preterm.reduce_interface(x2568.0, x2568.1)
    },
    @list.List([
      ("+", @term_syntax.parse_term("hreal_add")),
      t2571,
      t2570,
      t2569,
    ]),
  )
}

///|
/// realax.ml:1973
fn step_222() -> Unit raise {
  @lib.do_list(
    fn(x2572 : String) -> Unit raise { @preterm.remove_interface(x2572) },
    @list.List(["**", "++", "<<=", "===", "fn", "afn"]),
  )
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
  step_156()
  step_157()
  step_158()
  step_159()
  step_160()
  step_161()
  step_162()
  step_163()
  step_164()
  step_165()
  step_166()
  step_167()
  step_168()
  step_169()
  step_170()
  step_171()
  step_172()
  step_173()
  step_174()
  step_175()
  step_176()
  step_177()
  step_178()
  step_179()
  step_180()
  step_181()
  step_182()
  step_183()
  step_184()
  step_185()
  step_186()
  step_187()
  step_188()
  step_189()
  step_190()
  step_191()
  step_192()
  step_193()
  step_194()
  step_195()
  step_196()
  step_197()
  step_198()
  step_199()
  step_200()
  step_201()
  step_202()
  step_203()
  step_204()
  step_205()
  step_206()
  step_207()
  step_208()
  step_209()
  step_210()
  step_211()
  step_212()
  step_213()
  step_214()
  step_215()
  step_216()
  step_217()
  step_218()
  step_219()
  step_220()
  step_221()
  step_222()
}
