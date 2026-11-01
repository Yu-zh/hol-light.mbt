// Translated from upstream Arithmetic/definability.ml; edit this file directly.

///|
/// Arithmetic/definability.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// NPAIR
fn step_2() -> Unit raise {
  npair_c.set(@pair.new_definition(@term_syntax.parse_term("(NPAIR : (Num, Num) -> Num)((x : Num), (y : Num)) == EXP(x + y, 2) + (x + 1)")))
}

///|
let npair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPAIR")

///|
/// `NPAIR`
pub fn npair() -> @kernel.Thm {
  npair_c.get()
}

///|
/// NPAIR_NONZERO
fn step_3() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([npair(), @arith.add_eq_0(), @calc_num.arith()]))
  npair_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, !(NPAIR(x, y) == 0)"), t1))
}

///|
let npair_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPAIR_NONZERO")

///|
/// `NPAIR_NONZERO`
pub fn npair_nonzero() -> @kernel.Thm {
  npair_nonzero_c.get()
}

///|
/// NPAIR_INJ_LEMMA
fn step_4() -> Unit raise {
  let t5 = @list.List([@int.arith_tac, @meson.asm_meson_tac(@list.List([@arith.le_trans(), @arith.le_add(), @arith.le_mult2(), @arith.le_suc_lt()]))])
  let t4 = @tactics.exists_tac(@term_syntax.parse_term("SUC((x1 : Num) + (y1 : Num)) * SUC(x1 + y1)"))
  let t3 = @tactics.match_mp_tac(@arith.lte_trans())
  let t2 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((x : Num) + ((y : Num) + 1) < (u : Num) + ((v : Num) + 1)) == (x + y < u + v)"))]))
  let t6 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.rewrite_tac(@list.List([npair(), @arith.exp_2()]))), t2), t3), t4), @tactics.conj_tac), t5)
  npair_inj_lemma_c.set(@tactics.prove(@term_syntax.parse_term("(x1 : Num) + (y1 : Num) < (x2 : Num) + (y2 : Num) → NPAIR(x1, y1) < NPAIR(x2, y2)"), t6))
}

///|
let npair_inj_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPAIR_INJ_LEMMA")

///|
/// `NPAIR_INJ_LEMMA`
pub fn npair_inj_lemma() -> @kernel.Thm {
  npair_inj_lemma_c.get()
}

///|
/// NPAIR_INJ
fn step_5() -> Unit raise {
  let t13 = @simp.simp_tac(@list.List([npair(), @arith.exp_2()]))
  let t12 = @tactics.undisch_tac(@term_syntax.parse_term("(x' : Num) + (y' : Num) == (x : Num) + (y : Num)"))
  let t14 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("NPAIR((x : Num), (y : Num)) == NPAIR((x' : Num), (y' : Num))")), t12), t13), @int.arith_tac)
  let t15 = @list.List([@meson.asm_meson_tac(@list.List([@arith.lt_cases(), npair_inj_lemma(), @arith.lt_refl()])), t14])
  let t11 = @tactics.subgoal_then(@term_syntax.parse_term("(x' : Num) + (y' : Num) == (x : Num) + (y : Num)"), fn(x8 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s9 = @tactics.assume_tac(x8)
    fn(x10 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s9(x10)
    }
  })
  let t7 = @simp.asm_rewrite_tac(@list.List([]))
  let t16 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.eq_tac, @tactics.strip_tac), t7), t11), t15)
  npair_inj_c.set(@tactics.prove(@term_syntax.parse_term("(NPAIR((x : Num), (y : Num)) == NPAIR((x' : Num), (y' : Num))) == (x == x' && y == y')"), t16))
}

///|
let npair_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPAIR_INJ")

///|
/// `NPAIR_INJ`
pub fn npair_inj() -> @kernel.Thm {
  npair_inj_c.get()
}

///|
/// NPAIR_LT
fn step_6() -> Unit raise {
  let t21 = @simp.rewrite_tac(@list.List([@arith.le_add_rcancel(), @arith.exp_2(), @arith.le_square_refl()]))
  let t20 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num) + (y : Num) + (x + 1)"))
  let t19 = @tactics.match_mp_tac(@arith.lte_trans())
  let t18 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(x : Num) < (a : Num) + (x + 1)"))]))
  let t17 = @simp.rewrite_tac(@list.List([npair()]))
  let t22 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t17), t18), t19), t20), t21), @int.arith_tac)
  npair_lt_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, x < NPAIR(x, y) && y < NPAIR(x, y)"), t22))
}

///|
let npair_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NPAIR_LT")

///|
/// `NPAIR_LT`
pub fn npair_lt() -> @kernel.Thm {
  npair_lt_c.get()
}

///|
/// primepow
fn step_7() -> Unit raise {
  primepow_c.set(@pair.new_definition(@term_syntax.parse_term("(primepow : (Num, Num) -> Bool)((p : Num), (x : Num)) == (prime(p) && (∃ n : Num, x == EXP(p, n)))")))
}

///|
let primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("primepow")

///|
/// `primepow`
pub fn primepow() -> @kernel.Thm {
  primepow_c.get()
}

///|
/// divides_DELTA
fn step_8() -> Unit raise {
  let t34 = @meson.meson_tac(@list.List([]))
  let t33 = @simp.simp_tac(@list.List([@arith.le_exists(), @theorems.left_imp_exists_thm(), @arith.right_add_distrib(), @arith.mult_clauses()]))
  let t30 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("!((m : Num) == 0) → 1 <= m")))
  let t32 = @tactics.first_assum(fn(x31 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s28 = @tactics.mp_tac(x27)
      fn(x29 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s28(x29)
      }
    })(t30(x31))
  })
  let t26 = @simp.simp_tac(@list.List([]))
  let t24 = @meson.meson_tac(@list.List([@arith.le_refl()]))
  let t25 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@arith.mult_clauses()])), t24), @tactics.all_tac])
  let t23 = @class.asm_cases_tac(@term_syntax.parse_term("(m : Num) == 0"))
  let t35 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@int.divides()])), t23), t25), @tactics.ap_term_tac), @tactics.abs_tac), @tactics.eq_tac), t26), t32), t33), t34)
  divides_delta_c.set(@tactics.prove(@term_syntax.parse_term("divides((m : Num), (n : Num)) == (∃ x : Num, x <= n && n == m * x)"), t35))
}

///|
let divides_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("divides_DELTA")

///|
/// `divides_DELTA`
pub fn divides_delta() -> @kernel.Thm {
  divides_delta_c.get()
}

///|
/// prime_DELTA
fn step_9() -> Unit raise {
  let t39 = @meson.asm_meson_tac(@list.List([@int.prime(), @int.divides_le(), @arith.le_lt()]))
  let t40 = @list.List([@meson.asm_meson_tac(@list.List([@int.prime(), @arith.lt_refl(), @prime.prime_ge_2()])), t39])
  let t38 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith(), @prime.prime_1()]))
  let t37 = @class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 1"))
  let t36 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith(), @prime.prime_0()]))
  let t41 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0")), t36), t37), t38), @tactics.eq_tac), t40)
  prime_delta_c.set(@tactics.prove(@term_syntax.parse_term("prime((p : Num)) == (2 <= p && (∀ n : Num, n < p → divides(n, p) → n == 1))"), t41))
}

///|
let prime_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prime_DELTA")

///|
/// `prime_DELTA`
pub fn prime_delta() -> @kernel.Thm {
  prime_delta_c.get()
}

///|
/// primepow_DELTA
fn step_10() -> Unit raise {
  let t46 = @meson.asm_meson_tac(@list.List([@int.divides_le()]))
  let t47 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@prime.prime_power_exists_alt()])), t46)
  let t48 = @list.List([@meson.asm_meson_tac(@list.List([@arith.exp_eq_0(), @prime.prime_0()])), t47])
  let t45 = @simp.asm_rewrite_tac(@list.List([]))
  let t44 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == 0"))
  let t43 = @simp.asm_rewrite_tac(@list.List([]))
  let t42 = @class.asm_cases_tac(@term_syntax.parse_term("prime((p : Num))"))
  let t49 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([primepow()])), t42), t43), t44), t45), t48)
  primepow_delta_c.set(@tactics.prove(@term_syntax.parse_term("primepow((p : Num), (x : Num)) == (prime(p) && !(x == 0) && (∀ z : Num, z <= x → divides(z, x) → z == 1 || divides(p, z)))"), t49))
}

///|
let primepow_delta_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("primepow_DELTA")

///|
/// `primepow_DELTA`
pub fn primepow_delta() -> @kernel.Thm {
  primepow_delta_c.get()
}

///|
/// PSEQ
fn step_11() -> Unit raise {
  let t50 = @term_syntax.parse_term("(PSEQ : (Num, (Num) -> Num, Num, Num) -> Num)((p : Num), (f : (Num) -> Num), (m : Num), 0) == 0 && PSEQ(p, f, m, SUC((n : Num))) == f(m) + p * PSEQ(p, f, SUC(m), n)")
  pseq_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t50))
}

///|
let pseq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PSEQ")

///|
/// `PSEQ`
pub fn pseq() -> @kernel.Thm {
  pseq_c.get()
}

///|
/// PSEQ_SPLIT
fn step_12() -> Unit raise {
  let t53 = @simp.rewrite_tac(@list.List([@arith.left_add_distrib(), @arith.mult_ac(), @arith.add_clauses()]))
  let t52 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.add_assoc()), @arith.eq_add_lcancel()]))
  let t51 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.exp(), @arith.mult_clauses(), pseq()]))
  let t54 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t51), t52), t53)
  pseq_split_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Num) -> Num, ∀ p : Num, ∀ n : Num, ∀ m : Num, ∀ r : Num, PSEQ(p, f, m, n + r) == PSEQ(p, f, m, n) + EXP(p, n) * PSEQ(p, f, m + n, r)"), t54))
}

///|
let pseq_split_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PSEQ_SPLIT")

///|
/// `PSEQ_SPLIT`
pub fn pseq_split() -> @kernel.Thm {
  pseq_split_c.get()
}

///|
/// PSEQ_1
fn step_13() -> Unit raise {
  let t55 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1")), @arith.add_clauses(), @arith.mult_clauses(), pseq()]))
  pseq_1_c.set(@tactics.prove(@term_syntax.parse_term("PSEQ((p : Num), (f : (Num) -> Num), (m : Num), 1) == f(m)"), t55))
}

///|
let pseq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PSEQ_1")

///|
/// `PSEQ_1`
pub fn pseq_1() -> @kernel.Thm {
  pseq_1_c.get()
}

///|
/// PSEQ_BOUND
fn step_14() -> Unit raise {
  let t71 = @simp.asm_simp_tac(@list.List([@arith.exp_1(), pseq_1(), @arith.lt()]))
  let t70 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) < (p : Num) → x + 1 <= p")))
  let t69 = @simp.asm_rewrite_tac(@list.List([@arith.exp_add(), @arith.le_mult_lcancel(), @arith.exp_eq_0()]))
  let t68 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(p : Num) + p * (q : Num) == p * (q + 1)"))]))
  let t67 = @simp.asm_simp_tac(@list.List([@arith.lt_add_rcancel(), @int.arith_rule(@term_syntax.parse_term("(i : Num) < (n : Num) → i < SUC(n)"))]))
  let t66 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (n : Num)) + EXP(p, n) * PSEQ(p, (f : (Num) -> Num), n, 1)"))
  let t65 = @tactics.match_mp_tac(@arith.lte_trans())
  let t64 = @tactics.repeat_tac(@tactics.strip_tac)
  let t63 = @simp.simp_tac(@list.List([@arith.add1(), @arith.add_clauses()]))
  let t58 = @term_syntax.parse_term("1")
  let t59 = @term_syntax.parse_term("0")
  let t60 = @term_syntax.parse_term("(n : Num)")
  let t61 = @term_syntax.parse_term("(p : Num)")
  let t62 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Num) -> Num)"), t61, t60, t59, t58]), pseq_split()))
  let t57 = @list.List([@simp.rewrite_tac(@list.List([pseq(), @arith.exp(), @calc_num.arith()])), @tactics.all_tac])
  let t56 = @simp.asm_rewrite_tac(@list.List([]))
  let t72 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("(p : Num) == 0")), t56), @nums.induct_tac), t57), @tactics.disch_tac), t62), t63), t64), t65), t66), t67), t68), t69), t70), t71)
  pseq_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, !((p : Num) == 0) && (∀ i : Num, i < n → (f : (Num) -> Num)(i) < p) → PSEQ(p, f, 0, n) < EXP(p, n)"), t72))
}

///|
let pseq_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PSEQ_BOUND")

///|
/// `PSEQ_BOUND`
pub fn pseq_bound() -> @kernel.Thm {
  pseq_bound_c.get()
}

///|
/// RELPOW_LEMMA_1
fn step_15() -> Unit raise {
  let t182 = @simp.asm_rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (x : Num)) == !(x == 0)")), @arith.mult_eq_0(), @arith.exp_eq_0()]))
  let t181 = @simp.rewrite_tac(@list.List([@arith.le_mult_rcancel()]))
  let t180 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("1 * (a : Num) <= (c : Num) → a <= (b : Num) + c")))
  let t179 = @simp.rewrite_tac(@list.List([@arith.left_add_distrib(), @arith.mult_assoc(), @arith.add_assoc()]))
  let t178 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm1()]))
  let t177 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t176 = @simp.rewrite_tac(@list.List([@arith.add1()]))
  let t175 = @simp.asm_simp_tac(@list.List([@equal.gsym(@arith.add1())]))
  let t174 = @simp.asm_simp_tac(@list.List([pseq_1(), @int.arith_rule(@term_syntax.parse_term("(i : Num) < (n : Num) → i + 1 <= n"))]))
  let t173 = @simp.asm_rewrite_tac(@list.List([@arith.eq_add_lcancel(), @arith.eq_mult_lcancel(), @arith.exp_1()]))
  let t172 = @tactics.exists_tac(@term_syntax.parse_term("PSEQ((p : Num), (f : (Num) -> Num), (i : Num) + 1, 1)"))
  let t171 = @tactics.disch_then(fn(x170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t169 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) < (n : Num) → 1 + (n - i - 1) == n - i"))]))
  let t164 = @term_syntax.parse_term("(n : Num) - (i : Num) - 1")
  let t165 = @term_syntax.parse_term("(i : Num) + 1")
  let t166 = @term_syntax.parse_term("1")
  let t167 = @term_syntax.parse_term("(p : Num)")
  let t168 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Num) -> Num)"), t167, t166, t165, t164]), pseq_split()))
  let t163 = @simp.asm_simp_tac(@list.List([pseq_1(), @arith.lt_imp_le()]))
  let t162 = @simp.asm_rewrite_tac(@list.List([@arith.eq_add_lcancel(), @arith.eq_mult_lcancel(), @arith.exp_1()]))
  let t161 = @tactics.exists_tac(@term_syntax.parse_term("PSEQ((p : Num), (f : (Num) -> Num), (i : Num), 1)"))
  let t160 = @tactics.disch_then(fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t158 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) < (n : Num) → 1 + (n - i) == SUC(n) - i"))]))
  let t153 = @term_syntax.parse_term("(n : Num) - (i : Num)")
  let t154 = @term_syntax.parse_term("(i : Num)")
  let t155 = @term_syntax.parse_term("1")
  let t156 = @term_syntax.parse_term("(p : Num)")
  let t157 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Num) -> Num)"), t156, t155, t154, t153]), pseq_split()))
  let t152 = @list.List([@meson.asm_meson_tac(@list.List([pseq_bound(), @arith.lt_trans(), @arith.lt_imp_le()])), @tactics.all_tac])
  let t151 = @simp.asm_rewrite_tac(@list.List([@arith.eq_mult_lcancel(), @arith.exp_eq_0(), @arith.add_clauses()]))
  let t150 = @simp.rewrite_tac(@list.List([@arith.eq_add_lcancel()]))
  let t149 = @tactics.exists_tac(@term_syntax.parse_term("PSEQ((p : Num), (f : (Num) -> Num), 0, (i : Num))"))
  let t148 = @tactics.disch_then(fn(x147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t146 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) < (n : Num) → i + (SUC(n) - i) == SUC(n)"))]))
  let t141 = @term_syntax.parse_term("SUC((n : Num)) - (i : Num)")
  let t142 = @term_syntax.parse_term("0")
  let t143 = @term_syntax.parse_term("(i : Num)")
  let t144 = @term_syntax.parse_term("(p : Num)")
  let t145 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Num) -> Num)"), t144, t143, t142, t141]), pseq_split()))
  let t140 = @simp.asm_rewrite_tac(@list.List([@arith.lt_exp()]))
  let t139 = @tactics.disch_then(fn(x138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t137 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t136 = @simp.asm_simp_tac(@list.List([primepow(), @theorems.left_imp_exists_thm()]))
  let t135 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) → (c : Bool)) == (b → a → c)"))]))
  let t132 = @simp.asm_simp_tac(@list.List([pseq_bound(), pseq_1(), @arith.lt_imp_le()]))
  let t131 = @tactics.exists_tac(@term_syntax.parse_term("PSEQ((p : Num), (f : (Num) -> Num), 0, (n : Num))"))
  let t130 = @tactics.disch_then(fn(x129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t128 = @simp.asm_simp_tac(@list.List([@arith.add1(), @arith.add_clauses()]))
  let t124 = @term_syntax.parse_term("1")
  let t125 = @term_syntax.parse_term("0")
  let t126 = @term_syntax.parse_term("(n : Num)")
  let t127 = @term_syntax.parse_term("(p : Num)")
  let t133 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Num) -> Num)"), t127, t126, t125, t124]), pseq_split())), t128), t130), t131), t132)
  let t123 = @meson.meson_tac(@list.List([]))
  let t134 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([pseq()])), t123), t133, @tactics.all_tac])
  let t122 = @tactics.repeat_tac(@tactics.conj_tac)
  let t121 = @list.List([@meson.asm_meson_tac(@list.List([@arith.le_refl()])), @tactics.all_tac])
  let t120 = @list.List([@meson.asm_meson_tac(@list.List([@arith.le_0()])), @tactics.all_tac])
  let t118 = @simp.asm_simp_tac(@list.List([@arith.lt_suc_le()]))
  let t119 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(pseq_bound()), t118), @tactics.all_tac])
  let t117 = @tactics.exists_tac(@term_syntax.parse_term("PSEQ((p : Num), (f : (Num) -> Num), 0, SUC((n : Num)))"))
  let t116 = @list.List([@meson.asm_meson_tac(@list.List([@arith.let_trans()])), @tactics.all_tac])
  let t115 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : Num, i <= (n : Num) → (f : (Num) -> Num)(i) < (p : Num)"), fn(x112 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s113 = @tactics.assume_tac(x112)
    fn(x114 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s113(x114)
    }
  })
  let t111 = @list.List([@tactics.first_assum(fn(x108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s109 = @tactics.accept_tac(x108)
    fn(x110 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s109(x110)
    }
  }), @tactics.all_tac])
  let t107 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_0()])), @tactics.all_tac])
  let t106 = @tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) == 0)"), fn(x103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s104 = @tactics.assume_tac(x103)
    fn(x105 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s104(x105)
    }
  })
  let t101 = @simp.asm_rewrite_tac(@list.List([]))
  let t102 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(ibig : Num)")), t101), @tactics.all_tac])
  let t100 = @tactics.exists_tac(@term_syntax.parse_term("(p : Num)"))
  let t99 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(@tactics.strip_assume_tac))
  let t98 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(f : (Num) -> Num)((ibig : Num))"), @prime.euclid_bound()))
  let t97 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(ibig : Num)"))(@tactics.strip_assume_tac))
  let t93 = @meson.asm_meson_tac(@list.List([@arith.le_trans()]))
  let t92 = @simp.asm_simp_tac(@list.List([@arith.le_refl()]))
  let t91 = @tactics.repeat_tac(@tactics.strip_tac)
  let t90 = @simp.rewrite_tac(@list.List([@arith.le()]))
  let t89 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t94 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("SUC((n : Num))")), t89), t90), t91), t92), t93)
  let t88 = @meson.asm_meson_tac(@list.List([]))
  let t87 = @simp.asm_simp_tac(@list.List([]))
  let t86 = @tactics.repeat_tac(@tactics.strip_tac)
  let t85 = @simp.rewrite_tac(@list.List([@arith.le()]))
  let t84 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(j : Num) <= (n : Num) → j <= SUC(n)"))]))
  let t95 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(j : Num)")), t84), t85), t86), t87), t88), t94])
  let t83 = @tactics.disj_cases_tac(@int.arith_rule(@term_syntax.parse_term("(f : (Num) -> Num)(SUC((n : Num))) <= f((j : Num)) || f(j) <= f(SUC(n))")))
  let t82 = @tactics.first_assum(@tactics.x_choose_then(@term_syntax.parse_term("(j : Num)"))(@tactics.strip_assume_tac))
  let t80 = @meson.meson_tac(@list.List([@arith.le_refl()]))
  let t81 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@arith.le()])), t80), @tactics.all_tac])
  let t79 = @tactics.pop_assum_list(fn(x78 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t77 = @term_syntax.parse_term("(n : Num)")
  let t96 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t77), t79), @nums.induct_tac), t81), t82), t83), t95), @tactics.all_tac])
  let t76 = @tactics.subgoal_then(@term_syntax.parse_term("∃ j : Num, j <= (n : Num) && (∀ i : Num, i <= n → (f : (Num) -> Num)(i) <= f(j))"), fn(x73 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s74 = @tactics.mp_tac(x73)
    fn(x75 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s74(x75)
    }
  })
  let t183 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t76), t96), t97), t98), t99), t100), @tactics.conj_tac), t102), t106), t107), @tactics.conj_tac), t111), t115), t116), t117), @tactics.conj_tac), t119), @tactics.conj_tac), t120), @tactics.conj_tac), t121), t122), t134), t135), t136), @tactics.gen_tac), t137), t139), t140), @tactics.strip_tac), t145), t146), t148), t149), t150), t151), @tactics.conj_tac), t152), t157), t158), t160), t161), t162), t163), t168), t169), t171), t172), t173), t174), t175), t176), t177), t178), t179), t180), t181), @tactics.disj1_tac), t182)
  relpow_lemma_1_c.set(@tactics.prove(@term_syntax.parse_term("(f : (Num) -> Num)(0) == (x : Num) && f((n : Num)) == (y : Num) && (∀ i : Num, i < n → (R : (Num, Num) -> Bool)(f(i), f(SUC(i)))) → (∃ p : Num, (∃ i : Num, i <= n && p <= SUC(FACT(f(i)))) && prime(p) && (∃ m : Num, m < EXP(p, SUC(n)) && x < p && y < p && (∃ qx : Num, m == x + p * qx) && (∃ ry : Num, ry < EXP(p, n) && m == ry + EXP(p, n) * y) && (∀ q : Num, q < EXP(p, n) → primepow(p, q) → (∃ r : Num, r < q && (∃ a : Num, a < p && (∃ b : Num, b < p && R(a, b) && (∃ s : Num, s <= m && m == r + q * (a + p * (b + p * s)))))))))"), t183))
}

///|
let relpow_lemma_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RELPOW_LEMMA_1")

///|
/// `RELPOW_LEMMA_1`
pub fn relpow_lemma_1() -> @kernel.Thm {
  relpow_lemma_1_c.get()
}

///|
/// RELPOW_LEMMA_2
fn step_16() -> Unit raise {
  let t252 = @tactics.undisch_tac(@term_syntax.parse_term("(a : Num) < (p : Num)"))
  let t251 = @simp.asm_rewrite_tac(@list.List([@arith.le_mult_rcancel(), @arith.exp_eq_0()]))
  let t250 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(p : Num) + (q : Num) * p == (q + 1) * p"))]))
  let t249 = @simp.asm_rewrite_tac(@list.List([@arith.lt_add_rcancel()]))
  let t248 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (i : Num)) + (a : Num) * EXP(p, i)"))
  let t247 = @tactics.match_mp_tac(@arith.lte_trans())
  let t245 = @simp.rewrite_tac(@list.List([@arith.add_ac(), @arith.mult_ac()]))
  let t246 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.left_add_distrib(), @arith.right_add_distrib()])), t245), @tactics.all_tac])
  let t244 = @tactics.exists_tac(@term_syntax.parse_term("(r : Num) + (a : Num) * EXP((p : Num), (i : Num))"))
  let t243 = @tactics.match_mp_tac(@arith.div_uniq())
  let t242 = @simp.asm_rewrite_tac(@list.List([]))
  let t241 = @tactics.exists_tac(@term_syntax.parse_term("(s : Num)"))
  let t253 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.mod_uniq()), t241), t242), t243), t244), @tactics.conj_tac), t246), t247), t248), t249), t250), t251), t252), @int.arith_tac)
  let t240 = @simp.rewrite_tac(@list.List([@arith.add_ac(), @arith.mult_ac()]))
  let t239 = @simp.asm_rewrite_tac(@list.List([]))
  let t238 = @tactics.exists_tac(@term_syntax.parse_term("(r : Num)"))
  let t237 = @tactics.match_mp_tac(@arith.div_uniq())
  let t236 = @simp.asm_rewrite_tac(@list.List([]))
  let t235 = @tactics.exists_tac(@term_syntax.parse_term("(b : Num) + (p : Num) * (s : Num)"))
  let t254 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.mod_uniq()), t235), t236), t237), t238), t239), t240), t253])
  let t234 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) == (a : Bool) → a → b")))
  let t233 = @tactics.undisch_tac(@term_syntax.parse_term("(R : (Num, Num) -> Bool)((a : Num), (b : Num))"))
  let t232 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s230 = @tactics.subst1_tac(x229)
    fn(x231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s230(x231)
    }
  }, @tactics.strip_assume_tac))
  let t228 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.choose_then)(fn(x225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s226 = @tactics.mp_tac(x225)
    fn(x227 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s226(x227)
    }
  }))
  let t224 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t211 = @simp.asm_rewrite_tac(@list.List([primepow()]))
  let t210 = @simp.asm_simp_tac(@list.List([@arith.lt_exp(), @prime.prime_ge_2()]))
  let t206 = @term_syntax.parse_term("EXP((p : Num), (i : Num))")
  let t209 = @tactics.first_x_assum(fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x203 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s204 = @tactics.mp_tac(x203)
      fn(x205 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s204(x205)
      }
    })(((x207 : @kernel.Thm) => @bool.spec(t206, x207))(x208))
  })
  let t202 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t199 = @simp.asm_rewrite_tac(@list.List([@arith.add_ac(), @arith.mult_ac()]))
  let t198 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(m : Num) == (ry : Num) + EXP((p : Num), (n : Num)) * (y : Num)"))]))
  let t197 = @tactics.exists_tac(@term_syntax.parse_term("(ry : Num)"))
  let t196 = @tactics.match_mp_tac(@arith.div_uniq())
  let t195 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("(y : Num) < (p : Num)")), @arith.mult_clauses(), @arith.add_clauses()]))
  let t194 = @tactics.exists_tac(@term_syntax.parse_term("0"))
  let t200 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.mod_uniq()), t194), t195), t196), t197), t198), t199)
  let t193 = @simp.asm_rewrite_tac(@list.List([@arith.add_ac(), @arith.mult_ac()]))
  let t192 = @tactics.exists_tac(@term_syntax.parse_term("(qx : Num)"))
  let t201 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.mod_uniq()), t192), t193), t200, @tactics.all_tac])
  let t191 = @tactics.repeat_tac(@tactics.conj_tac)
  let t190 = @simp.rewrite_tac(@list.List([@arith.exp(), @arith.div_1()]))
  let t189 = @list.List([@meson.asm_meson_tac(@list.List([@prime.prime_0()])), @tactics.all_tac])
  let t188 = @tactics.subgoal_then(@term_syntax.parse_term("!((p : Num) == 0)"), fn(x185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s186 = @tactics.assume_tac(x185)
    fn(x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s186(x187)
    }
  })
  let t184 = @tactics.exists_tac(@term_syntax.parse_term("(i : Num) => MOD(DIV((m : Num), EXP((p : Num), i)), p)"))
  let t255 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.rewrite_tac(@list.List([@rstc.relpow_sequence()]))), t184), t188), t189), t190), t191), t201), t202), @tactics.disch_tac), t209), t210), t211), fn(x223 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x222 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x220 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x218 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x212 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
            fn(x213 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s214 = @tactics.subgoal_then(x212, x213)
              fn(x215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s214(x215)
              }
            }
          })(x218)(fn(x216 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let th = x216
            @simp.rewrite_tac(@list.List([th]))
          })
        })(((x219 : @kernel.Term) => @lib.funpow(2, @equal.lhand, x219))(x220))
      })((fn(x221 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x221.1
      })(x222))
    })(x223)(x223)
  }), t224), t228), t232), t233), t234), @tactics.binop_tac), t254)
  relpow_lemma_2_c.set(@tactics.prove(@term_syntax.parse_term("prime((p : Num)) && (x : Num) < p && (y : Num) < p && (∃ qx : Num, (m : Num) == x + p * qx) && (∃ ry : Num, ry < EXP(p, (n : Num)) && m == ry + EXP(p, n) * y) && (∀ q : Num, q < EXP(p, n) → primepow(p, q) → (∃ r : Num, ∃ a : Num, ∃ b : Num, ∃ s : Num, m == r + q * (a + p * (b + p * s)) && r < q && a < p && b < p && (R : (Num, Num) -> Bool)(a, b))) → RELPOW(n, R, x, y)"), t255))
}

///|
let relpow_lemma_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RELPOW_LEMMA_2")

///|
/// `RELPOW_LEMMA_2`
pub fn relpow_lemma_2() -> @kernel.Thm {
  relpow_lemma_2_c.get()
}

///|
/// RELPOW_LEMMA
fn step_17() -> Unit raise {
  let t272 = @meson.meson_tac(@list.List([]))
  let t271 = @simp.simp_tac(@list.List([]))
  let t270 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t269 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t268 = @simp.gen_rewrite_tac(fn(x265 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s266 = @equal.rand_conv(x265)
    fn(x267 : @kernel.Term) -> @kernel.Thm raise {
      s266(x267)
    }
  }, @list.List([@theorems.swap_exists_thm()]))
  let t264 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t261 = @drule.match_mp(relpow_lemma_1())
  let t263 = @tactics.disch_then(@tactics.choose_then(fn(x262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s258 = @tactics.mp_tac(x257)
        fn(x259 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s258(x259)
        }
      })(@bool.gen_all(x260))
    })(t261(x262))
  }))
  let t256 = @simp.rewrite_tac(@list.List([@rstc.relpow_sequence()]))
  let t273 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.eq_tac, @list.List([@tactics.all_tac, @simp.rewrite_tac(@list.List([relpow_lemma_2(), @theorems.left_imp_exists_thm()]))])), t256), t263), t264), t268), t269), @tactics.gen_tac), t270), t271), t272)
  relpow_lemma_c.set(@tactics.prove(@term_syntax.parse_term("RELPOW((n : Num), (R : (Num, Num) -> Bool), (x : Num), (y : Num)) == (∃ m : Num, ∃ p : Num, prime(p) && x < p && y < p && (∃ qx : Num, m == x + p * qx) && (∃ ry : Num, ry < EXP(p, n) && m == ry + EXP(p, n) * y) && (∀ q : Num, q < EXP(p, n) → primepow(p, q) → (∃ r : Num, ∃ a : Num, ∃ b : Num, ∃ s : Num, m == r + q * (a + p * (b + p * s)) && r < q && a < p && b < p && R(a, b))))"), t273))
}

///|
let relpow_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RELPOW_LEMMA")

///|
/// `RELPOW_LEMMA`
pub fn relpow_lemma() -> @kernel.Thm {
  relpow_lemma_c.get()
}

///|
/// RTC_SIGMA
fn step_18() -> Unit raise {
  let t319 = @simp.rewrite_tac(@list.List([@equal.gsym(relpow_lemma())]))
  let t318 = @simp.gen_rewrite_tac(fn(x315 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s316 = @equal.land_conv(x315)
    fn(x317 : @kernel.Term) -> @kernel.Thm raise {
      s316(x317)
    }
  }, @list.List([@theorems.swap_exists_thm()]))
  let t314 = @simp.gen_rewrite_tac(fn(x313 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x307 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s308 = @equal.land_conv(x307)
      fn(x309 : @kernel.Term) -> @kernel.Thm raise {
        s308(x309)
      }
    })((fn(x310 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s311 = @equal.binder_conv(x310)
      fn(x312 : @kernel.Term) -> @kernel.Thm raise {
        s311(x312)
      }
    })(x313))
  }, @list.List([@theorems.swap_exists_thm()]))
  let t306 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t305 = @simp.gen_rewrite_tac(fn(x304 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x300 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x294 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s295 = @equal.land_conv(x294)
        fn(x296 : @kernel.Term) -> @kernel.Thm raise {
          s295(x296)
        }
      })((fn(x297 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s298 = @equal.binder_conv(x297)
        fn(x299 : @kernel.Term) -> @kernel.Thm raise {
          s298(x299)
        }
      })(x300))
    })((fn(x301 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s302 = @equal.binder_conv(x301)
      fn(x303 : @kernel.Term) -> @kernel.Thm raise {
        s302(x303)
      }
    })(x304))
  }, @list.List([@theorems.swap_exists_thm()]))
  let t293 = @simp.gen_rewrite_tac(fn(x292 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x285 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s286 = @equal.land_conv(x285)
      fn(x287 : @kernel.Term) -> @kernel.Thm raise {
        s286(x287)
      }
    })(((x291 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(3, fn(x288 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s289 = @equal.binder_conv(x288)
      fn(x290 : @kernel.Term) -> @kernel.Thm raise {
        s289(x290)
      }
    }, x291))(x292))
  }, @list.List([@theorems.left_and_exists_thm()]))
  let t284 = @simp.rewrite_tac(@list.List([@equal.gsym(primepow())]))
  let t283 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) && (b : Bool)) && (c : Bool)) == (b && a && c)"))]))
  let t320 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([primepow()])), t283), t284), t293), t305), t306), t314), t318), t319)
  let t282 = @meson.meson_tac(@list.List([]))
  let t281 = @simp.asm_rewrite_tac(@list.List([primepow()]))
  let t280 = @tactics.exists_tac(@term_syntax.parse_term("EXP((p : Num), (n : Num))"))
  let t279 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t278 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t277 = @simp.rewrite_tac(@list.List([relpow_lemma()]))
  let t321 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s275 = @tactics.mp_tac(x274)
    fn(x276 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s275(x276)
    }
  })), t277), t278), @tactics.gen_tac), t279), @tactics.gen_tac), @tactics.disch_tac), t280), t281), t282), t320])
  let t322 = @tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@rstc.rtc_relpow()])), @tactics.eq_tac), t321)
  rtc_sigma_c.set(@tactics.prove(@term_syntax.parse_term("RTC((R : (Num, Num) -> Bool), (x : Num), (y : Num)) == (∃ m : Num, ∃ p : Num, ∃ Q : Num, primepow(p, Q) && x < p && y < p && (∃ s : Num, m == x + p * s) && (∃ r : Num, r < Q && m == r + Q * y) && (∀ q : Num, q < Q → primepow(p, q) → (∃ r : Num, ∃ a : Num, ∃ b : Num, ∃ s : Num, m == r + q * (a + p * (b + p * s)) && r < q && a < p && b < p && R(a, b))))"), t322))
}

///|
let rtc_sigma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_SIGMA")

///|
/// `RTC_SIGMA`
pub fn rtc_sigma() -> @kernel.Thm {
  rtc_sigma_c.get()
}

///|
/// arith_pair
fn step_19() -> Unit raise {
  arith_pair_c.set(@pair.new_definition(@term_syntax.parse_term("(arith_pair : (Term, Term) -> Term)((s : Term), (t : Term)) == op_plus_plus(op_star_star(op_plus_plus(s, t), op_plus_plus(s, t)), op_plus_plus(s, Suc(Z)))")))
}

///|
let arith_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_pair")

///|
/// `arith_pair`
pub fn arith_pair() -> @kernel.Thm {
  arith_pair_c.get()
}

///|
/// ARITH_PAIR
fn step_20() -> Unit raise {
  let t323 = @simp.rewrite_tac(@list.List([@fol.termval(), arith_pair(), npair(), @arith.exp_2(), @calc_num.arith_suc()]))
  arith_pair_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, ∀ v : (Num) -> Num, termval(v, arith_pair(s, t)) == NPAIR(termval(v, s), termval(v, t))"), t323))
}

///|
let arith_pair_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_PAIR")

///|
/// `ARITH_PAIR`
pub fn arith_pair_v1() -> @kernel.Thm {
  arith_pair_v1_c.get()
}

///|
/// FVT_PAIR
fn step_21() -> Unit raise {
  let t324 = @sets.set_tac(@list.List([]))
  let t325 = @tactics.then_tac(@simp.rewrite_tac(@list.List([arith_pair(), @fol.fvt()])), t324)
  fvt_pair_c.set(@tactics.prove(@term_syntax.parse_term("FVT(arith_pair((s : Term), (t : Term))) == UNION(FVT(s), FVT(t))"), t325))
}

///|
let fvt_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FVT_PAIR")

///|
/// `FVT_PAIR`
pub fn fvt_pair() -> @kernel.Thm {
  fvt_pair_c.get()
}

///|
/// OBJECTIFY
fn step_22() -> Unit raise {
  let t326 = @term_syntax.parse_term("op_plus")
  let is_add : (@kernel.Term) -> Bool raise = fn(x328 : @kernel.Term) -> Bool raise {
    ((x327 : @kernel.Term) => @basics.is_binop(t326, x327))(x328)
  }
  let t329 = @term_syntax.parse_term("op_star")
  let is_mul : (@kernel.Term) -> Bool raise = fn(x331 : @kernel.Term) -> Bool raise {
    ((x330 : @kernel.Term) => @basics.is_binop(t329, x330))(x331)
  }
  let t332 = @term_syntax.parse_term("op_lt_eq")
  let is_le : (@kernel.Term) -> Bool raise = fn(x334 : @kernel.Term) -> Bool raise {
    ((x333 : @kernel.Term) => @basics.is_binop(t332, x333))(x334)
  }
  let t335 = @term_syntax.parse_term("op_lt")
  let is_lt : (@kernel.Term) -> Bool raise = fn(x337 : @kernel.Term) -> Bool raise {
    ((x336 : @kernel.Term) => @basics.is_binop(t335, x336))(x337)
  }
  let zero_tm = @term_syntax.parse_term("0")
  let suc_tm = @term_syntax.parse_term("SUC")
  let osuc_tm = @term_syntax.parse_term("Suc")
  let oz_tm = @term_syntax.parse_term("Z")
  let ov_tm = @term_syntax.parse_term("V")
  let oadd_tm = @term_syntax.parse_term("op_plus_plus")
  let omul_tm = @term_syntax.parse_term("op_star_star")
  let oeq_tm = @term_syntax.parse_term("op_eq_eq_eq")
  let ole_tm = @term_syntax.parse_term("op_lt_lt_eq")
  let olt_tm = @term_syntax.parse_term("op_lt_lt")
  let oiff_tm = @term_syntax.parse_term("op_lt_minus_gt")
  let oimp_tm = @term_syntax.parse_term("op_minus_minus_gt")
  let oand_tm = @term_syntax.parse_term("op_amp_amp")
  let oor_tm = @term_syntax.parse_term("op_bar_bar")
  let onot_tm = @term_syntax.parse_term("Not")
  let oall_tm = @term_syntax.parse_term("op_bang_bang")
  let oex_tm = @term_syntax.parse_term("op_q_q")
  let numeral_tm = @term_syntax.parse_term("numeral")
  let assign_tm = @term_syntax.parse_term("(op_bar_minus_gt : (Num, Term, (Num) -> Term, Num) -> Term)")
  let term_ty = @parser.parse_type("term")
  let form_ty = @parser.parse_type("form")
  let num_ty = @parser.parse_type("num")
  let formsubst_tm = @term_syntax.parse_term("formsubst")
  let holdsv_tm = @term_syntax.parse_term("holds((v : (Num) -> Num))")
  let v_tm = @term_syntax.parse_term("(v : (Num) -> Num)")
  objectify_c.set(fn(x350 : @list.List[@kernel.Thm]) -> ((String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise {
    let defs = x350
    let defs_p = (@list.List([@fol.termval_numeral(), arith_pair_v1()])).concat(defs)
    fn objectify_term(x352 : @lib.Func[@kernel.Term, @kernel.Term], x353 : @kernel.Term) -> @kernel.Term raise {
      let env_2 = x352
      let tm_2 = x353
      if @kernel.is_var(tm_2) {
        @kernel.mk_comb(ov_tm, @lib.apply(env_2, tm_2))
      } else {
        if (tm_2 == zero_tm) {
          oz_tm
        } else {
          if @nums.is_numeral(tm_2) {
            @kernel.mk_comb(numeral_tm, tm_2)
          } else {
            if is_add(tm_2) {
              objectify2_l(fn(x354 : @lib.Func[@kernel.Term, @kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
                fn(x355 : @kernel.Term) -> @kernel.Term raise {
                  objectify_term(x354, x355)
                }
              }, oadd_tm, env_2, tm_2)
            } else {
              if is_mul(tm_2) {
                objectify2_l(fn(x356 : @lib.Func[@kernel.Term, @kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
                  fn(x357 : @kernel.Term) -> @kernel.Term raise {
                    objectify_term(x356, x357)
                  }
                }, omul_tm, env_2, tm_2)
              } else {
                if (@kernel.is_comb(tm_2) && (@kernel.rator(tm_2) == suc_tm)) {
                  objectify1_l(fn(x358 : @lib.Func[@kernel.Term, @kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
                    fn(x359 : @kernel.Term) -> @kernel.Term raise {
                      objectify_term(x358, x359)
                    }
                  }, osuc_tm, env_2, tm_2)
                } else {
                  let (f, args) = @basics.strip_comb(tm_2)
                  let args_p = @lib.map((x360 : @kernel.Term) => objectify_term(env_2, x360), args)
                  try {
                    let dth = @lib.find(fn(x361 : @kernel.Thm) -> Bool raise {
                      let th = x361
                      (@basics.strip_comb(@kernel.rand(@basics.strip_forall(@kernel.concl(th)).1)).0 == f)
                    }, defs_p)
                    let (l, r) = @kernel.dest_eq(@basics.strip_forall(@kernel.concl(dth)).1)
                    @basics.list_mk_comb(@basics.strip_comb(@kernel.rand(l)).0, args_p)
                  } catch {
                    Failure(_) => {
                      let ty = @lib.itlist(fn(x365 : @kernel.Term, x366 : @kernel.HolType) -> @kernel.HolType raise {
                        (fn(x362 : @kernel.HolType) -> ((@kernel.HolType) -> @kernel.HolType raise) raise {
                          fn(x363 : @kernel.HolType) -> @kernel.HolType raise {
                            @basics.mk_fun_ty(x362, x363)
                          }
                        })((fn(x364 : @kernel.Term) -> @kernel.HolType raise {
                          @kernel.type_of(x364)
                        })(x365))(x366)
                      }, args_p, form_ty)
                      let v = @kernel.mk_var(@kernel.dest_var(f).0, ty)
                      @basics.list_mk_comb(v, args_p)
                    }
                    e => raise e
                  }
                }
              }
            }
          }
        }
      }
    }
    fn objectify_formula(x367 : @lib.Func[@kernel.Term, @kernel.Term], x368 : @kernel.Term) -> @kernel.Term raise {
      let env_3 = x367
      let fm = x368
      if @basics.is_forall(fm) {
        let (x, bod) = @basics.dest_forall(fm)
        let n = @nums.mk_small_numeral(@lib.add63(@lib.itlist(fn(x371 : @kernel.Term, x372 : Int64) -> Int64 raise {
          (fn(x369 : Int64) -> ((Int64) -> Int64 raise) raise {
            fn(x370 : Int64) -> Int64 raise {
              if (x369 >= x370) {
                x369
              } else {
                x370
              }
            }
          })(@nums.dest_small_numeral(x371))(x372)
        }, @lib.ran(env_3), 0L), 1L))
        let t373 = objectify_formula(@lib.update(x, n, env_3), bod)
        @kernel.mk_comb(@kernel.mk_comb(oall_tm, n), t373)
      } else {
        if @basics.is_exists(fm) {
          let (x_1, bod_1) = @basics.dest_exists(fm)
          let n_1 = @nums.mk_small_numeral(@lib.add63(@lib.itlist(fn(x376 : @kernel.Term, x377 : Int64) -> Int64 raise {
            (fn(x374 : Int64) -> ((Int64) -> Int64 raise) raise {
              fn(x375 : Int64) -> Int64 raise {
                if (x374 >= x375) {
                  x374
                } else {
                  x375
                }
              }
            })(@nums.dest_small_numeral(x376))(x377)
          }, @lib.ran(env_3), 0L), 1L))
          let t378 = objectify_formula(@lib.update(x_1, n_1, env_3), bod_1)
          @kernel.mk_comb(@kernel.mk_comb(oex_tm, n_1), t378)
        } else {
          if @bool.is_iff(fm) {
            objectify2_l(fn(x379 : @lib.Func[@kernel.Term, @kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
              fn(x380 : @kernel.Term) -> @kernel.Term raise {
                objectify_formula(x379, x380)
              }
            }, oiff_tm, env_3, fm)
          } else {
            if @basics.is_imp(fm) {
              objectify2_l(fn(x381 : @lib.Func[@kernel.Term, @kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
                fn(x382 : @kernel.Term) -> @kernel.Term raise {
                  objectify_formula(x381, x382)
                }
              }, oimp_tm, env_3, fm)
            } else {
              if @basics.is_conj(fm) {
                objectify2_l(fn(x383 : @lib.Func[@kernel.Term, @kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
                  fn(x384 : @kernel.Term) -> @kernel.Term raise {
                    objectify_formula(x383, x384)
                  }
                }, oand_tm, env_3, fm)
              } else {
                if @basics.is_disj(fm) {
                  objectify2_l(fn(x385 : @lib.Func[@kernel.Term, @kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
                    fn(x386 : @kernel.Term) -> @kernel.Term raise {
                      objectify_formula(x385, x386)
                    }
                  }, oor_tm, env_3, fm)
                } else {
                  if @basics.is_neg(fm) {
                    objectify1_l(fn(x387 : @lib.Func[@kernel.Term, @kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
                      fn(x388 : @kernel.Term) -> @kernel.Term raise {
                        objectify_formula(x387, x388)
                      }
                    }, onot_tm, env_3, fm)
                  } else {
                    if is_le(fm) {
                      objectify2_l(fn(x389 : @lib.Func[@kernel.Term, @kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
                        fn(x390 : @kernel.Term) -> @kernel.Term raise {
                          objectify_term(x389, x390)
                        }
                      }, ole_tm, env_3, fm)
                    } else {
                      if is_lt(fm) {
                        objectify2_l(fn(x391 : @lib.Func[@kernel.Term, @kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
                          fn(x392 : @kernel.Term) -> @kernel.Term raise {
                            objectify_term(x391, x392)
                          }
                        }, olt_tm, env_3, fm)
                      } else {
                        if @basics.is_eq(fm) {
                          objectify2_l(fn(x393 : @lib.Func[@kernel.Term, @kernel.Term]) -> ((@kernel.Term) -> @kernel.Term raise) raise {
                            fn(x394 : @kernel.Term) -> @kernel.Term raise {
                              objectify_term(x393, x394)
                            }
                          }, oeq_tm, env_3, fm)
                        } else {
                          objectify_term(env_3, fm)
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    fn(x395 : String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise {
      let nam = x395
      fn(x396 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
        let th_1 = x396
        let (ptm, tm_3) = @kernel.dest_eq(@basics.strip_forall(@kernel.concl(th_1)).1)
        let vs = @lib.filter(fn(x397 : @kernel.Term) -> Bool raise {
          let v_1 = x397
          (@kernel.type_of(v_1) == num_ty)
        }, @basics.strip_comb(ptm).1)
        let ns = @lib.range(1L, Int::to_int64(@lib.length(vs)))
        let env_4 = @lib.itlist2(fn(x398 : @kernel.Term, x399 : Int64, x400 : @lib.Func[@kernel.Term, @kernel.Term]) -> @lib.Func[@kernel.Term, @kernel.Term] raise {
          let v_2 = x398
          let n_2 = x399
          let t401 = @nums.mk_small_numeral(n_2)
          (fn(x403 : @lib.Func[@kernel.Term, @kernel.Term]) -> @lib.Func[@kernel.Term, @kernel.Term] raise {
            ((x402 : @lib.Func[@kernel.Term, @kernel.Term]) => @lib.update(v_2, t401, x402))(x403)
          })(x400)
        }, vs, ns, @lib.undefined())
        let otm = objectify_formula(env_4, tm_3)
        let vs_p = @lib.map(fn(x404 : @kernel.Term) -> @kernel.Term raise {
          let v_3 = x404
          @kernel.mk_var(@kernel.dest_var(v_3).0, term_ty)
        }, vs)
        let stm = @lib.itlist2(fn(x405 : @kernel.Term, x406 : Int64, x407 : @kernel.Term) -> @kernel.Term raise {
          let v_4 = x405
          let n_3 = x406
          let a = x407
          @kernel.mk_comb(@kernel.mk_comb(@kernel.mk_comb(assign_tm, @nums.mk_small_numeral(n_3)), v_4), a)
        }, vs_p, ns, ov_tm)
        let rside = @kernel.mk_comb(@kernel.mk_comb(formsubst_tm, stm), otm)
        let vs_p_p = @lib.subtract(@kernel.frees(rside), vs_p).concat(vs_p)
        let lty = @lib.itlist(fn(x411 : @kernel.Term, x412 : @kernel.HolType) -> @kernel.HolType raise {
          (fn(x408 : @kernel.HolType) -> ((@kernel.HolType) -> @kernel.HolType raise) raise {
            fn(x409 : @kernel.HolType) -> @kernel.HolType raise {
              @basics.mk_fun_ty(x408, x409)
            }
          })((fn(x410 : @kernel.Term) -> @kernel.HolType raise {
            @kernel.type_of(x410)
          })(x411))(x412)
        }, vs_p_p, @kernel.type_of(rside))
        let lside = @basics.list_mk_comb(@kernel.mk_var(nam, lty), vs_p_p)
        let def = @basics.mk_eq(lside, rside)
        let dth_1 = @pair.new_definition(def)
        let clside = @equal.lhs(@basics.strip_forall(@kernel.concl(dth_1)).1)
        let etm = @kernel.mk_comb(holdsv_tm, clside)
        let t415 = @simp.gen_rewrite_conv(fn(x414 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x414
        }, @list.List([@equal.gsym(th_1)]))
        let t413 = @simp.rewrite_conv(@list.List([@fol.termval(), @calc_num.arith_eq(), @trivia.o_thm(), @fol.valmod()]))
        let thm = @equal.thenc(@equal.thenc(@simp.rewrite_conv((@list.List([dth_1, @fol.holds(), @fol.holds_formsubst()])).concat(defs_p)), t413), t415)(etm)
        (dth_1, @bool.disch_all(@bool.genl(vs_p.prepend(v_tm), thm)))
      }
    }
  })
}

///|
let objectify_c : @lib.Cell[(@list.List[@kernel.Thm]) -> ((String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise] = @lib.Cell::new("OBJECTIFY")

///|
/// `OBJECTIFY`
pub fn objectify(x : @list.List[@kernel.Thm]) -> ((String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise {
  (objectify_c.get())(x)
}

///|
fn[TA] objectify1_l(x338 : (TA) -> ((@kernel.Term) -> @kernel.Term raise) raise, x339 : @kernel.Term, x340 : TA, x341 : @kernel.Term) -> @kernel.Term raise {
  let fn_ = x338
  let op = x339
  let env = x340
  let tm = x341
  let t342 = @kernel.rand(tm)
  @kernel.mk_comb(op, fn_(env)(t342))
}

///|
fn[TB] objectify2_l(x343 : (TB) -> ((@kernel.Term) -> @kernel.Term raise) raise, x344 : @kernel.Term, x345 : TB, x346 : @kernel.Term) -> @kernel.Term raise {
  let fn__1 = x343
  let op_1 = x344
  let env_1 = x345
  let tm_1 = x346
  let t348 = @kernel.rand(tm_1)
  let t349 = fn__1(env_1)(t348)
  let t347 = @equal.lhand(tm_1)
  @kernel.mk_comb(@kernel.mk_comb(op_1, fn__1(env_1)(t347)), t349)
}

///|
/// `FV_TAC`
pub fn fv_tac(x416 : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  let ths = x416
  let ths_p = ths.concat(@list.List([@fol.fv(), @fol.formsubst_fv(), @fol.fvt(), @fol.termsubst_fvt(), @sets.in_elim_thm(), @sets.not_in_empty(), @sets.in_union(), @sets.in_delete(), @sets.in_sing()]))
  let t420 = @simp.rewrite_tac(@list.List([@theorems.disj_aci()]))
  let t419 = @simp.rewrite_tac(@list.List([@fol.valmod(), @calc_num.arith_eq(), @fol.fvt()]))
  let t418 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @equal.gsym(@theorems.conj_assoc()), @theorems.unwind_thm2(), @calc_num.arith_eq()]))
  let tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.disj_aci(), @class.taut(@term_syntax.parse_term("(((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)"))])), t418), t419), t420)
  let t424 = @simp.asm_simp_tac(ths_p)
  let t423 = @simp.asm_rewrite_tac(ths_p)
  let t422 = @simp.gen_rewrite_tac(fn(x421 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x421
  }, @list.List([@sets.extension()]))
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t422), t423), tac), t424), tac)
}

///|
let arith_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_divides")

///|
/// `arith_divides`
pub fn arith_divides() -> @kernel.Thm {
  arith_divides_c.get()
}

///|
let arith_divides_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_DIVIDES")

///|
/// `ARITH_DIVIDES`
pub fn arith_divides_v1() -> @kernel.Thm {
  arith_divides_v1_c.get()
}

///|
/// arith_divides, ARITH_DIVIDES
fn step_23() -> Unit raise {
  let (arith_divides, arith_divides_1) = objectify(@list.List([]))("arith_divides")(divides_delta())
  arith_divides_c.set(arith_divides)
  arith_divides_v1_c.set(arith_divides_1)
}

///|
/// FV_DIVIDES
fn step_24() -> Unit raise {
  let t425 = fv_tac(@list.List([arith_divides()]))
  fv_divides_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, FV(arith_divides(s, t)) == UNION(FVT(s), FVT(t))"), t425))
}

///|
let fv_divides_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_DIVIDES")

///|
/// `FV_DIVIDES`
pub fn fv_divides() -> @kernel.Thm {
  fv_divides_c.get()
}

///|
let arith_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_prime")

///|
/// `arith_prime`
pub fn arith_prime() -> @kernel.Thm {
  arith_prime_c.get()
}

///|
let arith_prime_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_PRIME")

///|
/// `ARITH_PRIME`
pub fn arith_prime_v1() -> @kernel.Thm {
  arith_prime_v1_c.get()
}

///|
/// arith_prime, ARITH_PRIME
fn step_25() -> Unit raise {
  let (arith_prime, arith_prime_1) = objectify(@list.List([arith_divides_v1()]))("arith_prime")(prime_delta())
  arith_prime_c.set(arith_prime)
  arith_prime_v1_c.set(arith_prime_1)
}

///|
/// FV_PRIME
fn step_26() -> Unit raise {
  let t426 = fv_tac(@list.List([arith_prime(), @fol.fvt_numeral(), fv_divides()]))
  fv_prime_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, FV(arith_prime(t)) == FVT(t)"), t426))
}

///|
let fv_prime_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_PRIME")

///|
/// `FV_PRIME`
pub fn fv_prime() -> @kernel.Thm {
  fv_prime_c.get()
}

///|
let arith_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_primepow")

///|
/// `arith_primepow`
pub fn arith_primepow() -> @kernel.Thm {
  arith_primepow_c.get()
}

///|
let arith_primepow_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_PRIMEPOW")

///|
/// `ARITH_PRIMEPOW`
pub fn arith_primepow_v1() -> @kernel.Thm {
  arith_primepow_v1_c.get()
}

///|
/// arith_primepow, ARITH_PRIMEPOW
fn step_27() -> Unit raise {
  let (arith_primepow, arith_primepow_1) = objectify(@list.List([arith_prime_v1(), arith_divides_v1()]))("arith_primepow")(primepow_delta())
  arith_primepow_c.set(arith_primepow)
  arith_primepow_v1_c.set(arith_primepow_1)
}

///|
/// FV_PRIMEPOW
fn step_28() -> Unit raise {
  let t427 = fv_tac(@list.List([arith_primepow(), @fol.fvt_numeral(), fv_divides(), fv_prime()]))
  fv_primepow_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, FV(arith_primepow(s, t)) == UNION(FVT(s), FVT(t))"), t427))
}

///|
let fv_primepow_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_PRIMEPOW")

///|
/// `FV_PRIMEPOW`
pub fn fv_primepow() -> @kernel.Thm {
  fv_primepow_c.get()
}

///|
let arith_rtc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_rtc")

///|
/// `arith_rtc`
pub fn arith_rtc() -> @kernel.Thm {
  arith_rtc_c.get()
}

///|
let arith_rtc_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_RTC")

///|
/// `ARITH_RTC`
pub fn arith_rtc_v1() -> @kernel.Thm {
  arith_rtc_v1_c.get()
}

///|
/// arith_rtc, ARITH_RTC
fn step_29() -> Unit raise {
  let (arith_rtc, arith_rtc_1) = objectify(@list.List([arith_primepow_v1(), @kernel.assume_rule(@term_syntax.parse_term("∀ v : (Num) -> Num, ∀ s : Term, ∀ t : Term, holds(v, (R : (Term, Term) -> Form)(s, t)) == (r : (Num, Num) -> Bool)(termval(v, s), termval(v, t))"))]))("arith_rtc")(rtc_sigma())
  arith_rtc_c.set(arith_rtc)
  arith_rtc_v1_c.set(arith_rtc_1)
}

///|
/// FV_RTC
fn step_30() -> Unit raise {
  let t428 = fv_tac(@list.List([arith_rtc(), fv_primepow()]))
  fv_rtc_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (Term, Term) -> Form, (∀ s : Term, ∀ t : Term, FV(R(s, t)) == UNION(FVT(s), FVT(t))) → (∀ s : Term, ∀ t : Term, FV(arith_rtc(R, s, t)) == UNION(FVT(s), FVT(t)))"), t428))
}

///|
let fv_rtc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_RTC")

///|
/// `FV_RTC`
pub fn fv_rtc() -> @kernel.Thm {
  fv_rtc_c.get()
}

///|
/// OBJECTIFY_RTC
fn step_31() -> Unit raise {
  let t435 = @simp.rewrite_tac(@list.List([@fol.termval(), @trivia.o_def(), @calc_num.arith_eq(), @fol.valmod(), arith_pair_v1(), @fol.termval_numeral()]))
  let t434 = @simp.simp_tac(@list.List([@fol.holds_formsubst()]))
  let t432 = @drule.match_mp(arith_rtc_v1())
  let t436 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x433 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x429 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s430 = @tactics.mp_tac(x429)
      fn(x431 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s430(x431)
      }
    })(t432(x433))
  }), t434), t435)
  let pth = @tactics.prove(@term_syntax.parse_term("(∀ v : (Num) -> Num, ∀ x : Term, ∀ y : Term, holds(v, (f : (Term, Term) -> Form)(x, y)) == (f' : (Num, Num) -> Bool)(termval(v, x), termval(v, y))) → (∀ g : (Term) -> Form, (∀ n : Term, g(n) == formsubst(op_bar_minus_gt(0, n, V), arith_rtc(f, numeral(0), arith_pair(V(0), numeral(0))))) → (∀ v : (Num) -> Num, ∀ n : Term, holds(v, g(n)) == RTC(f', 0, NPAIR(termval(v, n), 0))))"), t436)
  objectify_rtc_c.set(fn(x437 : @kernel.Thm) -> ((String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise {
    let def = x437
    fn(x438 : String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise {
      let nam = x438
      fn(x439 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
        let th = x439
        let th1 = @drule.match_mp(pth)(def)
        let v = @basics.dest_forall(@kernel.concl(th1)).0
        let th2 = @bool.spec(@kernel.mk_var(nam, @kernel.type_of(v)), th1)
        let dth = @pair.new_definition(@basics.dest_imp(@kernel.concl(th2)).0)
        let t440 = @drule.match_mp(th2)(dth)
        (dth, @simp.once_rewrite_rule(@list.List([@equal.gsym(th)]))(t440))
      }
    }
  })
}

///|
let objectify_rtc_c : @lib.Cell[(@kernel.Thm) -> ((String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise] = @lib.Cell::new("OBJECTIFY_RTC")

///|
/// `OBJECTIFY_RTC`
pub fn objectify_rtc(x : @kernel.Thm) -> ((String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise {
  (objectify_rtc_c.get())(x)
}

///|
/// RTCP
fn step_32() -> Unit raise {
  rtcp_c.set(@pair.new_definition(@term_syntax.parse_term("(RTCP : ((_, _, _) -> Bool, _, _, _) -> Bool)((R : (_, _, _) -> Bool), (m : _), (x : _), (y : _)) == RTC(R(m), x, y)")))
}

///|
let rtcp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCP")

///|
/// `RTCP`
pub fn rtcp() -> @kernel.Thm {
  rtcp_c.get()
}

///|
/// RTCP_SIGMA
fn step_33() -> Unit raise {
  let t441 = @term_syntax.parse_term("(R : (Num, Num) -> Bool)")
  let t442 = @kernel.inst_rule(@list.List([(@term_syntax.parse_term("(R : (Num, Num, Num) -> Bool)((m : Num))"), t441)]), rtc_sigma())
  rtcp_sigma_c.set(@simp.rewrite_rule(@list.List([@equal.gsym(rtcp())]))(t442))
}

///|
let rtcp_sigma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCP_SIGMA")

///|
/// `RTCP_SIGMA`
pub fn rtcp_sigma() -> @kernel.Thm {
  rtcp_sigma_c.get()
}

///|
let arith_rtcp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_rtcp")

///|
/// `arith_rtcp`
pub fn arith_rtcp() -> @kernel.Thm {
  arith_rtcp_c.get()
}

///|
let arith_rtcp_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_RTCP")

///|
/// `ARITH_RTCP`
pub fn arith_rtcp_v1() -> @kernel.Thm {
  arith_rtcp_v1_c.get()
}

///|
/// arith_rtcp, ARITH_RTCP
fn step_34() -> Unit raise {
  let (arith_rtcp, arith_rtcp_1) = objectify(@list.List([arith_primepow_v1(), @kernel.assume_rule(@term_syntax.parse_term("∀ v : (Num) -> Num, ∀ m : Term, ∀ s : Term, ∀ t : Term, holds(v, (R : (Term, Term, Term) -> Form)(m, s, t)) == (r : (Num, Num, Num) -> Bool)(termval(v, m), termval(v, s), termval(v, t))"))]))("arith_rtcp")(rtcp_sigma())
  arith_rtcp_c.set(arith_rtcp)
  arith_rtcp_v1_c.set(arith_rtcp_1)
}

///|
/// ARITH_RTC_PARAMETRIZED
fn step_35() -> Unit raise {
  arith_rtc_parametrized_c.set(@simp.rewrite_rule(@list.List([rtcp()]))(arith_rtcp_v1()))
}

///|
let arith_rtc_parametrized_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_RTC_PARAMETRIZED")

///|
/// `ARITH_RTC_PARAMETRIZED`
pub fn arith_rtc_parametrized() -> @kernel.Thm {
  arith_rtc_parametrized_c.get()
}

///|
/// FV_RTCP
fn step_36() -> Unit raise {
  let t443 = fv_tac(@list.List([arith_rtcp(), fv_primepow()]))
  fv_rtcp_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (Term, Term, Term) -> Form, (∀ s : Term, ∀ t : Term, ∀ u : Term, FV(R(s, t, u)) == UNION(FVT(s), UNION(FVT(t), FVT(u)))) → (∀ s : Term, ∀ t : Term, ∀ u : Term, FV(arith_rtcp(R, s, t, u)) == UNION(FVT(s), UNION(FVT(t), FVT(u))))"), t443))
}

///|
let fv_rtcp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_RTCP")

///|
/// `FV_RTCP`
pub fn fv_rtcp() -> @kernel.Thm {
  fv_rtcp_c.get()
}

///|
/// OBJECTIFY_RTCP
fn step_37() -> Unit raise {
  let t450 = @simp.rewrite_tac(@list.List([@fol.termval(), @trivia.o_def(), @calc_num.arith_eq(), @fol.valmod(), arith_pair_v1(), @fol.termval_numeral()]))
  let t449 = @simp.simp_tac(@list.List([@fol.holds_formsubst()]))
  let t447 = @drule.match_mp(arith_rtc_parametrized())
  let t451 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x448 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x444 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s445 = @tactics.mp_tac(x444)
      fn(x446 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s445(x446)
      }
    })(t447(x448))
  }), t449), t450)
  let pth = @tactics.prove(@term_syntax.parse_term("(∀ v : (Num) -> Num, ∀ m : Term, ∀ x : Term, ∀ y : Term, holds(v, (f : (Term, Term, Term) -> Form)(m, x, y)) == (f' : (Num, Num, Num) -> Bool)(termval(v, m), termval(v, x), termval(v, y))) → (∀ g : (Term, Term) -> Form, (∀ m : Term, ∀ n : Term, g(m, n) == formsubst(op_bar_minus_gt(1, m, op_bar_minus_gt(0, n, V)), arith_rtcp(f, V(1), numeral(0), arith_pair(V(0), numeral(0))))) → (∀ v : (Num) -> Num, ∀ m : Term, ∀ n : Term, holds(v, g(m, n)) == RTC(f'(termval(v, m)), 0, NPAIR(termval(v, n), 0))))"), t451)
  objectify_rtcp_c.set(fn(x452 : @kernel.Thm) -> ((String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise {
    let def = x452
    fn(x453 : String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise {
      let nam = x453
      fn(x454 : @kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise {
        let th = x454
        let th1 = @drule.match_mp(pth)(def)
        let v = @basics.dest_forall(@kernel.concl(th1)).0
        let th2 = @bool.spec(@kernel.mk_var(nam, @kernel.type_of(v)), th1)
        let dth = @pair.new_definition(@basics.dest_imp(@kernel.concl(th2)).0)
        let t455 = @drule.match_mp(th2)(dth)
        (dth, @simp.once_rewrite_rule(@list.List([@equal.gsym(th)]))(t455))
      }
    }
  })
}

///|
let objectify_rtcp_c : @lib.Cell[(@kernel.Thm) -> ((String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise] = @lib.Cell::new("OBJECTIFY_RTCP")

///|
/// `OBJECTIFY_RTCP`
pub fn objectify_rtcp(x : @kernel.Thm) -> ((String) -> ((@kernel.Thm) -> (@kernel.Thm, @kernel.Thm) raise) raise) raise {
  (objectify_rtcp_c.get())(x)
}

///|
/// PRIMREC_SIGMA
fn step_38() -> Unit raise {
  let t470 = @meson.asm_meson_tac(@list.List([]))
  let t469 = @simp.asm_rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t468 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool)) == (b && a && c)"))]))
  let t467 = @simp.gen_rewrite_tac(fn(x466 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x460 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s461 = @equal.land_conv(x460)
      fn(x462 : @kernel.Term) -> @kernel.Thm raise {
        s461(x462)
      }
    })((fn(x463 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s464 = @equal.binder_conv(x463)
      fn(x465 : @kernel.Term) -> @kernel.Thm raise {
        s464(x465)
      }
    })(x466))
  }, @list.List([@theorems.swap_exists_thm()]))
  let t459 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t458 = @simp.rewrite_tac(@list.List([@nums.suc_inj(), @theorems.right_and_exists_thm()]))
  let t457 = @simp.asm_rewrite_tac(@list.List([npair_inj(), @nums.not_suc()]))
  let t456 = @simp.once_rewrite_tac(@list.List([@rstc.rtc_cases_l()]))
  let t471 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @nums.induct_tac), t456), t457), t458), @tactics.gen_tac), t459), t467), t468), t469), t470)
  primrec_sigma_c.set(@tactics.prove(@term_syntax.parse_term("(fn_ : (Num) -> Num)(0) == (e : Num) && (∀ n : Num, fn_(SUC(n)) == (f : (Num, Num) -> Num)(fn_(n), n)) → (∀ x : Num, ∀ y : Num, RTC((x : Num) => (y : Num) => ∃ n : Num, ∃ r : Num, x == NPAIR(n, r) && y == NPAIR(SUC(n), f(r, n)), NPAIR(0, e), NPAIR(x, y)) == (fn_(x) == y))"), t471))
}

///|
let primrec_sigma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PRIMREC_SIGMA")

///|
/// `PRIMREC_SIGMA`
pub fn primrec_sigma() -> @kernel.Thm {
  primrec_sigma_c.get()
}

///|
/// arith_primrecstep
fn step_39() -> Unit raise {
  arith_primrecstep_c.set(@pair.new_definition(@term_syntax.parse_term("(arith_primrecstep : ((Term, Term, Term) -> Form, Term, Term) -> Form)((R : (Term, Term, Term) -> Form), (s : Term), (t : Term)) == formsubst(op_bar_minus_gt(0, s, op_bar_minus_gt(1, t, V)), op_q_q(2, op_q_q(3, op_q_q(4, op_amp_amp(op_eq_eq_eq(V(0), arith_pair(V(2), V(3))), op_amp_amp(op_eq_eq_eq(V(1), arith_pair(Suc(V(2)), V(4))), R(V(3), V(2), V(4))))))))")))
}

///|
let arith_primrecstep_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_primrecstep")

///|
/// `arith_primrecstep`
pub fn arith_primrecstep() -> @kernel.Thm {
  arith_primrecstep_c.get()
}

///|
/// ARITH_PRIMRECSTEP
fn step_40() -> Unit raise {
  let t473 = @meson.meson_tac(@list.List([]))
  let t472 = @simp.asm_rewrite_tac(@list.List([@fol.termval(), @fol.valmod(), @trivia.o_def(), @calc_num.arith_eq(), arith_pair_v1()]))
  let t474 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([arith_primrecstep(), @fol.holds(), @fol.holds_formsubst()]))), t472), t473)
  arith_primrecstep_v1_c.set(@tactics.prove(@term_syntax.parse_term("(∀ v : (Num) -> Num, ∀ x : Term, ∀ y : Term, ∀ z : Term, holds(v, (R : (Term, Term, Term) -> Form)(x, y, z)) == ((f : (Num, Num) -> Num)(termval(v, x), termval(v, y)) == termval(v, z))) → (∀ v : (Num) -> Num, ∀ s : Term, ∀ t : Term, holds(v, arith_primrecstep(R, s, t)) == (∃ n : Num, ∃ r : Num, termval(v, s) == NPAIR(n, r) && termval(v, t) == NPAIR(SUC(n), f(r, n))))"), t474))
}

///|
let arith_primrecstep_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_PRIMRECSTEP")

///|
/// `ARITH_PRIMRECSTEP`
pub fn arith_primrecstep_v1() -> @kernel.Thm {
  arith_primrecstep_v1_c.get()
}

///|
/// FV_PRIMRECSTEP
fn step_41() -> Unit raise {
  let t484 = @simp.asm_rewrite_tac(@list.List([@fol.fvt(), @sets.in_sing()]))
  let t483 = @tactics.disch_then(@tactics.choose_then(@tactics.conjuncts_then2(@tactics.ante_res_then(fn(x477 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s478 = @tactics.mp_tac(x477)
    fn(x479 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s478(x479)
    }
  }), fn(x480 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s481 = @tactics.assume_tac(x480)
    fn(x482 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s481(x482)
    }
  })))
  let t476 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → (a || (b : Bool)) == b")))
  let t475 = fv_tac(@list.List([arith_primrecstep(), fvt_pair()]))
  let t485 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union()])), t475), @tactics.gen_tac), t476), t483), t484)
  fv_primrecstep_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (Term, Term, Term) -> Form, (∀ s : Term, ∀ t : Term, ∀ u : Term, SUBSET(FV(R(s, t, u)), UNION(FVT(s), UNION(FVT(t), FVT(u))))) → (∀ s : Term, ∀ t : Term, FV(arith_primrecstep(R, s, t)) == UNION(FVT(s), FVT(t)))"), t485))
}

///|
let fv_primrecstep_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_PRIMRECSTEP")

///|
/// `FV_PRIMRECSTEP`
pub fn fv_primrecstep() -> @kernel.Thm {
  fv_primrecstep_c.get()
}

///|
/// arith_primrec
fn step_42() -> Unit raise {
  arith_primrec_c.set(@pair.new_definition(@term_syntax.parse_term("(arith_primrec : ((Term, Term, Term) -> Form, Term, Term, Term) -> Form)((R : (Term, Term, Term) -> Form), (c : Term), (s : Term), (t : Term)) == arith_rtc(arith_primrecstep(R), arith_pair(Z, c), arith_pair(s, t))")))
}

///|
let arith_primrec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("arith_primrec")

///|
/// `arith_primrec`
pub fn arith_primrec() -> @kernel.Thm {
  arith_primrec_c.get()
}

///|
/// ARITH_PRIMREC
fn step_43() -> Unit raise {
  let t500 = @simp.asm_simp_tac(@list.List([primrec_sigma()]))
  let t499 = @simp.simp_tac(@list.List([arith_primrec(), arith_pair_v1(), @fol.termval()]))
  let t498 = @tactics.conv_tac(@equal.top_depth_conv(@class.eta_conv))
  let t495 = @drule.match_mp(arith_rtc_v1())
  let t497 = @tactics.disch_then(fn(x496 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x492 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s493 = @tactics.mp_tac(x492)
      fn(x494 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s493(x494)
      }
    })(t495(x496))
  })
  let t489 = @drule.match_mp(arith_primrecstep_v1())
  let t491 = @tactics.first_assum(fn(x490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s487 = @tactics.mp_tac(x486)
      fn(x488 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s487(x488)
      }
    })(t489(x490))
  })
  let t501 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t491), t497), t498), t499), t500)
  arith_primrec_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ fn_ : (Num) -> Num, ∀ e : Num, ∀ f : (Num, Num) -> Num, ∀ R : (Term, Term, Term) -> Form, ∀ c : Term, fn_(0) == e && (∀ n : Num, fn_(SUC(n)) == f(fn_(n), n)) && (∀ v : (Num) -> Num, termval(v, c) == e) && (∀ v : (Num) -> Num, ∀ x : Term, ∀ y : Term, ∀ z : Term, holds(v, R(x, y, z)) == (f(termval(v, x), termval(v, y)) == termval(v, z))) → (∀ v : (Num) -> Num, ∀ s : Term, ∀ t : Term, holds(v, arith_primrec(R, c, s, t)) == (fn_(termval(v, s)) == termval(v, t)))"), t501))
}

///|
let arith_primrec_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ARITH_PRIMREC")

///|
/// `ARITH_PRIMREC`
pub fn arith_primrec_v1() -> @kernel.Thm {
  arith_primrec_v1_c.get()
}

///|
/// FV_PRIMREC
fn step_44() -> Unit raise {
  let t503 = @simp.asm_simp_tac(@list.List([fv_rtc(), fvt_pair(), fv_primrecstep(), @sets.union_empty(), @sets.union_aci(), @fol.fvt()]))
  let t502 = @simp.rewrite_tac(@list.List([arith_primrec()]))
  let t504 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t502), t503)
  fv_primrec_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (Term, Term, Term) -> Form, ∀ c : Term, FVT(c) == {} && (∀ s : Term, ∀ t : Term, ∀ u : Term, SUBSET(FV(R(s, t, u)), UNION(FVT(s), UNION(FVT(t), FVT(u))))) → (∀ s : Term, ∀ t : Term, FV(arith_primrec(R, c, s, t)) == UNION(FVT(s), FVT(t)))"), t504))
}

///|
let fv_primrec_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FV_PRIMREC")

///|
/// `FV_PRIMREC`
pub fn fv_primrec() -> @kernel.Thm {
  fv_primrec_c.get()
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
}
