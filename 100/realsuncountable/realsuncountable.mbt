// Translated from upstream 100/realsuncountable.ml; edit this file directly.

///|
/// 100/realsuncountable.ml:7
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// countable
fn step_2() -> Unit raise {
  countable_c.set(@pair.new_definition(@term_syntax.parse_term("(countable : ((_) -> Bool) -> Bool)((s : (_) -> Bool)) == (op_lt_eq_us_c : ((_) -> Bool, (Num) -> Bool) -> Bool)(s, UNIV)")))
}

///|
let countable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("countable")

///|
/// `countable`
pub fn countable() -> @kernel.Thm {
  countable_c.get()
}

///|
/// repeating
fn step_3() -> Unit raise {
  repeating_c.set(@pair.new_definition(@term_syntax.parse_term("(repeating : ((Num) -> Bool) -> Bool) == {(s : (Num) -> Bool) | ∃ n : Num, ∀ m : Num, m >= n → s(m)}")))
}

///|
let repeating_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("repeating")

///|
/// `repeating`
pub fn repeating() -> @kernel.Thm {
  repeating_c.get()
}

///|
/// BINARY_BOUND
fn step_4() -> Unit raise {
  let t6 = @simp.rewrite_tac(@list.List([@arith.le_0(), @arith.exp_add(), @arith.exp_1(), @arith.exp()]))
  let t5 = @tactics.pop_assum(fn(x2 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3 = @tactics.mp_tac(x2)
    fn(x4 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3(x4)
    }
  })
  let t1 = @list.List([@tactics.then_tac(@class.cond_cases_tac, @simp.rewrite_tac(@list.List([@calc_num.arith()]))), @tactics.all_tac])
  let t7 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@iterate.nsum_clauses_numseg()]))), t1), t5), t6), @int.arith_tac)
  binary_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, nsum(op_dot_dot(0, n), (i : Num) => if (b : (Num) -> Bool)(i) { EXP(2, i) } else { 0 }) < EXP(2, n + 1)"), t7))
}

///|
let binary_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINARY_BOUND")

///|
/// `BINARY_BOUND`
pub fn binary_bound() -> @kernel.Thm {
  binary_bound_c.get()
}

///|
/// BINARY_DIV_POW2
fn step_5() -> Unit raise {
  let t8 = @simp.simp_tac(@list.List([@arith.add1(), @arith.div_lt(), binary_bound()]))
  binary_div_pow2_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, DIV(nsum(op_dot_dot(0, n), (i : Num) => if (b : (Num) -> Bool)(i) { EXP(2, i) } else { 0 }), EXP(2, SUC(n))) == 0"), t8))
}

///|
let binary_div_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINARY_DIV_POW2")

///|
/// `BINARY_DIV_POW2`
pub fn binary_div_pow2() -> @kernel.Thm {
  binary_div_pow2_c.get()
}

///|
/// PLUS_MOD_REFL
fn step_6() -> Unit raise {
  let t10 = @meson.meson_tac(@list.List([@arith.mult_clauses()]))
  let t9 = @tactics.match_mp_tac(@arith.mod_eq())
  let t11 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t9), t10)
  plus_mod_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, !(b == 0) → MOD(a + b, b) == MOD(a, b)"), t11))
}

///|
let plus_mod_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PLUS_MOD_REFL")

///|
/// `PLUS_MOD_REFL`
pub fn plus_mod_refl() -> @kernel.Thm {
  plus_mod_refl_c.get()
}

///|
/// BINARY_PLUS_DIV_POW2
fn step_7() -> Unit raise {
  let t14 = @simp.rewrite_tac(@list.List([@arith.add_ac(), @arith.mult_clauses()]))
  let t13 = @simp.asm_rewrite_tac(@list.List([binary_bound(), @arith.add1()]))
  let t12 = @tactics.exists_tac(@term_syntax.parse_term("nsum(op_dot_dot(0, (n : Num)), (i : Num) => if (b : (Num) -> Bool)(i) { EXP(2, i) } else { 0 })"))
  let t15 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@arith.div_uniq())), t12), t13), t14)
  binary_plus_div_pow2_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, DIV(nsum(op_dot_dot(0, n), (i : Num) => if (b : (Num) -> Bool)(i) { EXP(2, i) } else { 0 }) + EXP(2, SUC(n)), EXP(2, SUC(n))) == 1"), t15))
}

///|
let binary_plus_div_pow2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINARY_PLUS_DIV_POW2")

///|
/// `BINARY_PLUS_DIV_POW2`
pub fn binary_plus_div_pow2() -> @kernel.Thm {
  binary_plus_div_pow2_c.get()
}

///|
/// BINARY_UNIQUE_LEMMA
fn step_8() -> Unit raise {
  let t42 = @meson.asm_meson_tac(@list.List([@arith.le_refl()]))
  let t41 = @simp.simp_tac(@list.List([@arith.add_clauses(), binary_bound(), @arith.mod_lt(), plus_mod_refl(), @arith.exp_eq_0(), @calc_num.arith(), @arith.add1()]))
  let t40 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t37 = @term_syntax.parse_term("(x : Num) => MOD(x, EXP(2, SUC((n : Num))))")
  let t43 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x39 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x34 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s35 = @tactics.mp_tac(x34)
      fn(x36 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s35(x36)
      }
    })(((x38 : @kernel.Thm) => @equal.ap_term(t37, x38))(x39))
  }), t40), t41), t42)
  let t33 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t32 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), binary_div_pow2(), binary_plus_div_pow2()]))
  let t31 = @tactics.repeat_tac(@class.cond_cases_tac)
  let t27 = @term_syntax.parse_term("(x : Num) => DIV(x, EXP(2, SUC((n : Num))))")
  let t30 = @tactics.first_x_assum(fn(x29 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x24 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s25 = @tactics.mp_tac(x24)
      fn(x26 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s25(x26)
      }
    })(((x28 : @kernel.Thm) => @equal.ap_term(t27, x28))(x29))
  })
  let t44 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("(i : Num) == SUC((n : Num))"), fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s22 = @tactics.subst_all_tac(x21)
    fn(x23 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s22(x23)
    }
  }), t30), t31), t32), t33), t43])
  let t20 = @tactics.repeat_tac(@tactics.strip_tac)
  let t19 = @simp.rewrite_tac(@list.List([@arith.le()]))
  let t17 = @simp.rewrite_tac(@list.List([@arith.le_0()]))
  let t16 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([@calc_num.arith()]))))
  let t18 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([@arith.le()])), t16), t17])
  let t45 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@iterate.nsum_clauses_numseg()]))), t18), t19), t20), t44)
  binary_unique_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, nsum(op_dot_dot(0, n), (i : Num) => if (b : (Num) -> Bool)(i) { EXP(2, i) } else { 0 }) == nsum(op_dot_dot(0, n), (i : Num) => if (c : (Num) -> Bool)(i) { EXP(2, i) } else { 0 }) → (∀ i : Num, i <= n → b(i) == c(i))"), t45))
}

///|
let binary_unique_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINARY_UNIQUE_LEMMA")

///|
/// `BINARY_UNIQUE_LEMMA`
pub fn binary_unique_lemma() -> @kernel.Thm {
  binary_unique_lemma_c.get()
}

///|
/// COUNTABLE_REPEATING
fn step_9() -> Unit raise {
  let t77 = @meson.asm_meson_tac(@list.List([@arith.le_cases()]))
  let t74 = @drule.match_mp(binary_unique_lemma())
  let t76 = @tactics.first_x_assum(fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x71 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s72 = @tactics.mp_tac(x71)
      fn(x73 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s72(x73)
      }
    })(t74(x75))
  })
  let t70 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @arith.ge()]))
  let t69 = @tactics.first_x_assum(fn(x66 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s67 = @tactics.subst_all_tac(x66)
    fn(x68 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s67(x68)
    }
  })
  let t65 = @simp.asm_rewrite_tac(@list.List([]))
  let t64 = @class.asm_cases_tac(@term_syntax.parse_term("(l : Num) == (k : Num)"))
  let t63 = @tactics.repeat_tac(@tactics.pop_assum(fn(x62 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t61 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @pair.pair_eq()]))
  let t60 = @simp.abbrev_tac(@term_syntax.parse_term("(l : Num) == minimal((n : Num) => ∀ m : Num, m >= n → (t : (Num) -> Bool)(m))"))
  let t59 = @simp.abbrev_tac(@term_syntax.parse_term("(k : Num) == minimal((n : Num) => ∀ m : Num, m >= n → (s : (Num) -> Bool)(m))"))
  let t58 = @simp.once_rewrite_tac(@list.List([@arith.minimal_v1()]))
  let t56 = @term_syntax.parse_term("(t : (Num) -> Bool)")
  let t57 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : (Num) -> Bool)"), t56]))
  let t54 = @meson.meson_tac(@list.List([]))
  let t53 = @simp.rewrite_tac(@list.List([@card.mul_c(), @sets.in_elim_thm(), @sets.in_univ()]))
  let t55 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @pair.let_tac), t53), t54), @tactics.all_tac])
  let t52 = @simp.rewrite_tac(@list.List([repeating(), @sets.in_elim_thm()]))
  let t51 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Num) -> Bool) => LET((n : Num) => LET_END((n, nsum(op_dot_dot(0, n), (i : Num) => if s(i) { EXP(2, i) } else { 0 }))), minimal((n : Num) => ∀ m : Num, m >= n → s(m)))"))
  let t50 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t48 = @simp.rewrite_tac(@list.List([@card.card_square_num()]))
  let t49 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(@card.card_eq_imp_le()), t48)])
  let t46 = @term_syntax.parse_term("(op_star_us_c : ((Num) -> Bool, (Num) -> Bool, (Num, Num)) -> Bool)((UNIV : (Num) -> Bool), (UNIV : (Num) -> Bool))")
  let t47 = @tactics.trans_tac(@card.card_le_trans())(t46)
  let t78 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([countable()])), t47), @tactics.conj_tac), t49), t50), t51), t52), @tactics.conj_tac), t55), t57), t58), t59), t60), t61), t63), t64), t65), t69), t70), @tactics.strip_tac), t76), t77)
  countable_repeating_c.set(@tactics.prove(@term_syntax.parse_term("countable(repeating)"), t78))
}

///|
let countable_repeating_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_REPEATING")

///|
/// `COUNTABLE_REPEATING`
pub fn countable_repeating() -> @kernel.Thm {
  countable_repeating_c.get()
}

///|
/// canonical
fn step_10() -> Unit raise {
  canonical_c.set(@pair.new_definition(@term_syntax.parse_term("(canonical : ((Num) -> Bool) -> Bool) == {(s : (Num) -> Bool) | ∀ n : Num, ∃ m : Num, m >= n && !s(m)}")))
}

///|
let canonical_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("canonical")

///|
/// `canonical`
pub fn canonical() -> @kernel.Thm {
  canonical_c.get()
}

///|
/// UNCOUNTABLE_CANONICAL
fn step_11() -> Unit raise {
  let t97 = @simp.rewrite_tac(@list.List([@sets.num_infinite(), @card.card_le_refl()]))
  let t98 = @tactics.then_tac(@tactics.match_mp_tac(@card.card_add_absorb_le()), t97)
  let t99 = @list.List([@meson.asm_meson_tac(@list.List([countable(), countable_repeating(), @card.card_le_add()])), t98])
  let t95 = @term_syntax.parse_term("(op_plus_us_c : ((Num) -> Bool, (Num) -> Bool, Sum[Num, Num]) -> Bool)((UNIV : (Num) -> Bool), (UNIV : (Num) -> Bool))")
  let t96 = @tactics.trans_tac(@card.card_le_trans())(t95)
  let t94 = @simp.asm_simp_tac(@list.List([@card.card_eq_imp_le()]))
  let t92 = @term_syntax.parse_term("op_plus_us_c(canonical, repeating)")
  let t93 = @tactics.trans_tac(@card.card_le_trans())(t92)
  let t90 = @meson.meson_tac(@list.List([]))
  let t91 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @sets.in_elim_thm(), canonical(), repeating(), @arith.ge(), @sets.in_univ()])), t90), @tactics.all_tac])
  let t89 = @tactics.subgoal_then(@term_syntax.parse_term("UNION(canonical, repeating) == UNIV"), fn(x86 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s87 = @tactics.subst1_tac(x86)
    fn(x88 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s87(x88)
    }
  })
  let t84 = @meson.meson_tac(@list.List([]))
  let t85 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.not_in_empty(), @sets.in_elim_thm(), canonical(), repeating(), @arith.ge()])), t84), @tactics.all_tac])
  let t82 = @term_syntax.parse_term("repeating")
  let t83 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("canonical"), t82]), @card.card_disjoint_union()))
  let t81 = @simp.rewrite_tac(@list.List([@card.card_not_lt()]))
  let t79 = @term_syntax.parse_type("A")
  let t80 = @tactics.mp_tac(@kernel.inst_type(@list.List([(@term_syntax.parse_type("Num"), t79)]), @card.cantor_thm_univ()))
  let t100 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([countable()])), @tactics.strip_tac), t80), t81), t83), @tactics.ants_tac), t85), t89), t91), @tactics.disch_tac), t93), t94), t96), @tactics.conj_tac), t99)
  uncountable_canonical_c.set(@tactics.prove(@term_syntax.parse_term("!countable(canonical)"), t100))
}

///|
let uncountable_canonical_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNCOUNTABLE_CANONICAL")

///|
/// `UNCOUNTABLE_CANONICAL`
pub fn uncountable_canonical() -> @kernel.Thm {
  uncountable_canonical_c.get()
}

///|
/// 100/realsuncountable.ml:127
fn step_12() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// SUM_BINSEQUENCE_LBOUND
fn step_13() -> Unit raise {
  let t103 = @simp.simp_tac(@list.List([@real.real_pow_le(), @analysis.real_pos()]))
  let t102 = @simp.rewrite_tac(@list.List([@analysis.real_le_refl(), @real.real_le_inv_eq()]))
  let t101 = @simp.rewrite_tac(@list.List([]))
  let t104 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@analysis.sum_pos()), @tactics.gen_tac), t101), @class.cond_cases_tac), t102), t103)
  sum_binsequence_lbound_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, real_of_num(0) <= sum((m, n), (i : Num) => if (s : (Num) -> Bool)(i) { inv(pow(real_of_num(2), i)) } else { real_of_num(0) })"), t104))
}

///|
let sum_binsequence_lbound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_BINSEQUENCE_LBOUND")

///|
/// `SUM_BINSEQUENCE_LBOUND`
pub fn sum_binsequence_lbound() -> @kernel.Thm {
  sum_binsequence_lbound_c.get()
}

///|
/// SUM_BINSEQUENCE_UBOUND_SHARP
fn step_14() -> Unit raise {
  let t112 = @simp.rewrite_tac(@list.List([@realax.real_pow(), @realax.real_div(), @real.real_inv_mul()]))
  let t109 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (a : Real) → a + (y : Real) <= (b : Real) → x + y <= b")))
  let t111 = @tactics.first_x_assum(fn(x110 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t109(x110))
  })
  let t108 = @simp.simp_tac(@list.List([@real.real_le_inv_eq(), @real.real_pow_le(), @analysis.real_pos()]))
  let t107 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (y : Real) && (x : Real) + y <= (a : Real) → x + (if (b : Bool) { y } else { real_of_num(0) }) <= a")))
  let t106 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @analysis.real_sub_refl(), @analysis.real_le_refl()]))
  let t105 = @simp.rewrite_tac(@list.List([@analysis.sum()]))
  let t113 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t105), t106), t107), t108), t111), t112), @calc_rat.real_arith_tac)
  sum_binsequence_ubound_sharp_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ m : Num, ∀ n : Num, sum((m, n), (i : Num) => if s(i) { inv(pow(real_of_num(2), i)) } else { real_of_num(0) }) <= real_of_num(2) / pow(real_of_num(2), m) - real_of_num(2) / pow(real_of_num(2), m + n)"), t113))
}

///|
let sum_binsequence_ubound_sharp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_BINSEQUENCE_UBOUND_SHARP")

///|
/// `SUM_BINSEQUENCE_UBOUND_SHARP`
pub fn sum_binsequence_ubound_sharp() -> @kernel.Thm {
  sum_binsequence_ubound_sharp_c.get()
}

///|
/// SUMMABLE_BINSEQUENCE
fn step_15() -> Unit raise {
  let t136 = @simp.rewrite_tac(@list.List([sum_binsequence_lbound()]))
  let t135 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) → (a : Real) + x >= a")))
  let t134 = @simp.rewrite_tac(@list.List([@equal.gsym(@analysis.sum_split())]))
  let t133 = @tactics.disch_then(@tactics.choose_then(fn(x130 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s131 = @tactics.subst1_tac(x130)
    fn(x132 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s131(x132)
    }
  }))
  let t129 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_exists()]))
  let t137 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))), t129), t133), t134), t135), t136)
  let t128 = @simp.simp_tac(@list.List([@real.real_lt_div(), @real.real_pow_lt(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t127 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (x : Real) < a) == (real_of_num(0) < x)"))]))
  let t126 = @simp.rewrite_tac(@list.List([sum_binsequence_lbound(), @realax.real_pow(), @real.real_div_1(), @arith.add_clauses()]))
  let t125 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && (a : Real) < (b : Real) → x <= a → abs(x) < b")))
  let t122 = @term_syntax.parse_term("(n : Num)")
  let t123 = @term_syntax.parse_term("0")
  let t124 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(s : (Num) -> Bool)"), t123, t122]), sum_binsequence_ubound_sharp()))
  let t121 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t120 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_0(), @arith.le_refl()]))
  let t119 = @term_syntax.parse_term("0")
  let t138 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x116 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s117 = @tactics.exists_tac(x116)
    fn(x118 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s117(x118)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(2)"), t119])), t120), t121), t124), t125), t126), t127), t128), t137])
  let t115 = @simp.rewrite_tac(@list.List([@analysis.mr1_bounded()]))
  let t114 = @tactics.match_mp_tac(@analysis.seq_iconv())
  let t139 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@analysis.summable(), @analysis.sums(), @equal.gsym(@analysis.convergent())]))), t114), t115), @tactics.conj_tac), t138)
  summable_binsequence_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, summable((i : Num) => if s(i) { inv(pow(real_of_num(2), i)) } else { real_of_num(0) })"), t139))
}

///|
let summable_binsequence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMMABLE_BINSEQUENCE")

///|
/// `SUMMABLE_BINSEQUENCE`
pub fn summable_binsequence() -> @kernel.Thm {
  summable_binsequence_c.get()
}

///|
/// SUMS_BINSEQUENCE
fn step_16() -> Unit raise {
  let t140 = @simp.simp_tac(@list.List([@analysis.summable_sum(), summable_binsequence()]))
  sums_binsequence_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, sums((i : Num) => if s(i) { inv(pow(real_of_num(2), i)) } else { real_of_num(0) }, suminf((i : Num) => if s(i) { inv(pow(real_of_num(2), i)) } else { real_of_num(0) }))"), t140))
}

///|
let sums_binsequence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMS_BINSEQUENCE")

///|
/// `SUMS_BINSEQUENCE`
pub fn sums_binsequence() -> @kernel.Thm {
  sums_binsequence_c.get()
}

///|
/// SUM_BINSEQUENCE_UBOUND_LE
fn step_17() -> Unit raise {
  let t143 = @simp.simp_tac(@list.List([@real.real_le_div(), @real.real_pow_le(), @analysis.real_pos()]))
  let t142 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (b : Real) → (x : Real) <= (a : Real) - b → x <= a")))
  let t141 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t144 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(sum_binsequence_ubound_sharp()), t141), t142), t143)
  sum_binsequence_ubound_le_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ m : Num, ∀ n : Num, sum((m, n), (i : Num) => if s(i) { inv(pow(real_of_num(2), i)) } else { real_of_num(0) }) <= real_of_num(2) / pow(real_of_num(2), m)"), t144))
}

///|
let sum_binsequence_ubound_le_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUM_BINSEQUENCE_UBOUND_LE")

///|
/// `SUM_BINSEQUENCE_UBOUND_LE`
pub fn sum_binsequence_ubound_le() -> @kernel.Thm {
  sum_binsequence_ubound_le_c.get()
}

///|
/// SUMINF_INJ_LEMMA
fn step_18() -> Unit raise {
  let t225 = @simp.simp_tac(@list.List([@real.real_lt_inv_eq(), @real.real_pow_lt(), @real.real_of_num_lt(), @calc_num.arith()]))
  let t226 = @tactics.then_tac(@tactics.match_mp_tac(@calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < inv((x : Real)) → inv(x) < real_of_num(2) / x"))), t225)
  let t224 = @tactics.conv_tac(@calc_rat.real_field)
  let t227 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_pow_add(), @real.real_pow_1()])), t224), t226])
  let t223 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) == (b : Real) && (d : Real) < (c : Real) → a - c < b - d")))
  let t222 = @simp.rewrite_tac(@list.List([sum_binsequence_ubound_sharp()]))
  let t221 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) / pow(real_of_num(2), (n : Num) + 1) - real_of_num(2) / pow(real_of_num(2), n + 1 + (r : Num))"))
  let t220 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t218 = @simp.asm_simp_tac(@list.List([@arith.le_0(), @arith.add_clauses()]))
  let t219 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@analysis.sum_eq()), t218), @tactics.all_tac])
  let t217 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) == (b : Real) && (c : Real) < (e : Real) - (d : Real) → a + c + d < b + e")))
  let t216 = @simp.asm_rewrite_tac(@list.List([@arith.add_clauses(), @analysis.sum_1(), @calc_int.real_add_rid()]))
  let t215 = @simp.rewrite_tac(@list.List([@equal.gsym(@analysis.sum_split())]))
  let t214 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Num)"))(fn(x211 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s212 = @tactics.subst_all_tac(x211)
    fn(x213 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s212(x213)
    }
  }))
  let t208 = @simp.gen_rewrite_rule(fn(x207 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x207
  }, @list.List([@arith.le_exists()]))
  let t210 = @tactics.first_x_assum(fn(x209 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s205 = @tactics.mp_tac(x204)
      fn(x206 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s205(x206)
      }
    })(t208(x209))
  })
  let t202 = @tactics.conv_tac(@calc_rat.real_field)
  let t201 = @simp.rewrite_tac(@list.List([@real.real_pow_add(), @real.real_pow_1()]))
  let t200 = @simp.rewrite_tac(@list.List([sum_binsequence_ubound_le()]))
  let t199 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) / pow(real_of_num(2), (m : Num) + 1)"))
  let t198 = @tactics.match_mp_tac(@analysis.real_le_trans())
  let t197 = @simp.asm_rewrite_tac(@list.List([@analysis.sum_1(), @realax.real_add_lid()]))
  let t196 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@analysis.sum_split())]))
  let t195 = @simp.simp_tac(@list.List([@analysis.sum(), @real.real_le_inv_eq(), @real.real_pow_le(), @analysis.real_pos()]))
  let t193 = @int.arith_rule(@term_syntax.parse_term("(p : Num) == 0 || p == 1 + PRE(p)"))
  let t194 = @tactics.disj_cases_then(fn(x190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s191 = @tactics.subst_all_tac(x190)
    fn(x192 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s191(x192)
    }
  })(t193)
  let t189 = @simp.rewrite_tac(@list.List([@equal.gsym(@analysis.sum_split()), @analysis.real_le_ladd(), @arith.add_clauses()]))
  let t188 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Num)"))(fn(x185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s186 = @tactics.subst_all_tac(x185)
    fn(x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s186(x187)
    }
  }))
  let t184 = @simp.rewrite_tac(@list.List([@arith.le_exists()]))
  let t183 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Num)"))
  let t182 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_refl()]))
  let t181 = @tactics.exists_tac(@term_syntax.parse_term("(m : Num)"))
  let t180 = @simp.rewrite_tac(@list.List([@analysis.seq_const(), @equal.gsym(@analysis.sums()), sums_binsequence()]))
  let t178 = @term_syntax.parse_term("(k : Num) => sum((0, (m : Num)), (n : Num) => if (s : (Num) -> Bool)(n) { inv(pow(real_of_num(2), n)) } else { real_of_num(0) }) + inv(pow(real_of_num(2), m))")
  let t179 = @tactics.map_every(fn(x175 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s176 = @tactics.exists_tac(x175)
    fn(x177 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s176(x177)
    }
  }, @list.List([@term_syntax.parse_term("(n : Num) => sum((0, n), (n : Num) => if (s : (Num) -> Bool)(n) { inv(pow(real_of_num(2), n)) } else { real_of_num(0) })"), t178]))
  let t203 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@analysis.seq_le()), t179), t180), t181), t182), t183), t184), t188), t189), t194), t195), t196), t197), t198), t199), t200), t201), t202), @tactics.all_tac])
  let t174 = @tactics.exists_tac(@term_syntax.parse_term("sum((0, (m : Num)), (n : Num) => if (s : (Num) -> Bool)(n) { inv(pow(real_of_num(2), n)) } else { real_of_num(0) }) + inv(pow(real_of_num(2), m))"))
  let t173 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t172 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(m : Num)"))(@tactics.strip_assume_tac))
  let t171 = @simp.rewrite_tac(@list.List([@arith.ge()]))
  let t167 = @term_syntax.parse_term("(n : Num) + 1")
  let t170 = @tactics.undisch_then(@term_syntax.parse_term("∀ n : Num, ∃ m : Num, m >= n && !(s : (Num) -> Bool)(m)"), fn(x169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x164 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s165 = @tactics.mp_tac(x164)
      fn(x166 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s165(x166)
      }
    })(((x168 : @kernel.Thm) => @bool.spec(t167, x168))(x169))
  })
  let t163 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@analysis.sum_split()), @analysis.sum_1(), @arith.add_clauses()]))
  let t161 = @simp.rewrite_tac(@list.List([@equal.gsym(@analysis.sum_split()), @real.real_le_addr(), sum_binsequence_lbound()]))
  let t160 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1())]))
  let t159 = @tactics.disch_then(@tactics.choose_then(fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s157 = @tactics.subst1_tac(x156)
    fn(x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s157(x158)
    }
  }))
  let t155 = @simp.rewrite_tac(@list.List([@arith.ge(), @arith.le_exists()]))
  let t154 = @tactics.x_gen_tac(@term_syntax.parse_term("(m : Num)"))
  let t153 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) + 1"))
  let t152 = @simp.rewrite_tac(@list.List([@analysis.seq_const(), @equal.gsym(@analysis.sums()), sums_binsequence()]))
  let t150 = @term_syntax.parse_term("(n : Num) => sum((0, n), (n : Num) => if (t : (Num) -> Bool)(n) { inv(pow(real_of_num(2), n)) } else { real_of_num(0) })")
  let t151 = @tactics.map_every(fn(x147 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s148 = @tactics.exists_tac(x147)
    fn(x149 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s148(x149)
    }
  }, @list.List([@term_syntax.parse_term("(k : Num) => sum((0, (n : Num) + 1), (n : Num) => if (t : (Num) -> Bool)(n) { inv(pow(real_of_num(2), n)) } else { real_of_num(0) })"), t150]))
  let t162 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@analysis.seq_le()), t151), t152), t153), t154), t155), t159), t160), t161)])
  let t146 = @tactics.exists_tac(@term_syntax.parse_term("sum((0, (n : Num) + 1), (n : Num) => if (t : (Num) -> Bool)(n) { inv(pow(real_of_num(2), n)) } else { real_of_num(0) })"))
  let t145 = @tactics.match_mp_tac(@analysis.real_lte_trans())
  let t228 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t145), t146), @tactics.conj_tac), t162), t163), t170), t171), t172), t173), t174), @tactics.conj_tac), t203), t210), t214), t215), t216), t217), @tactics.conj_tac), t219), t220), t221), t222), t223), @tactics.conj_tac), t227)
  suminf_inj_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, ∀ t : (Num) -> Bool, ∀ n : Num, !s(n) && t(n) && (∀ m : Num, m < n → s(m) == t(m)) && (∀ n : Num, ∃ m : Num, m >= n && !s(m)) → suminf((n : Num) => if s(n) { inv(pow(real_of_num(2), n)) } else { real_of_num(0) }) < suminf((n : Num) => if t(n) { inv(pow(real_of_num(2), n)) } else { real_of_num(0) })"), t228))
}

///|
let suminf_inj_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUMINF_INJ_LEMMA")

///|
/// `SUMINF_INJ_LEMMA`
pub fn suminf_inj_lemma() -> @kernel.Thm {
  suminf_inj_lemma_c.get()
}

///|
/// UNCOUNTABLE_REALS
fn step_19() -> Unit raise {
  let t265 = @meson.asm_meson_tac(@list.List([]))
  let t264 = @tactics.match_mp_tac(suminf_inj_lemma())
  let t262 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (b : Real) → a == b → false")))
  let t263 = @list.List([@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(b : Real) < (a : Real) → a == b → false"))), t262])
  let t261 = @tactics.first_x_assum(fn(x260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s258 = @tactics.mp_tac(x257)
      fn(x259 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s258(x259)
      }
    })(@equal.sym(x260))
  })
  let t256 = @simp.asm_rewrite_tac(@list.List([]))
  let t255 = @class.asm_cases_tac(@term_syntax.parse_term("(t : (Num) -> Bool)((n : Num))"))
  let t254 = @tactics.first_x_assum(fn(x253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x247 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x252 : @kernel.Thm) => @lib.check(fn(x251 : @kernel.Thm) -> Bool raise {
      (fn(x249 : @kernel.Term) -> Bool raise {
        (fn(x248 : @kernel.Term) -> Bool raise {
          @kernel.is_var(x248)
        })(@equal.rhs(x249))
      })((fn(x250 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x250)
      })(x251))
    }, x252))(x253))
  })
  let t246 = @simp.abbrev_tac(@term_syntax.parse_term("(n : Num) == minimal((x : Num) => !((s : (Num) -> Bool)(x) == (t : (Num) -> Bool)(x)))"))
  let t245 = @simp.once_rewrite_tac(@list.List([@arith.minimal_v1()]))
  let t244 = @simp.gen_rewrite_tac(fn(x243 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x243
  }, @list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, (P : (_) -> Bool)(x)) == !(∃ x : _, !P(x))"))]))
  let t242 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t241 = @simp.rewrite_tac(@list.List([canonical(), @sets.in_elim_thm()]))
  let t239 = @term_syntax.parse_term("(t : (Num) -> Bool)")
  let t240 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : (Num) -> Bool)"), t239]))
  let t238 = @simp.rewrite_tac(@list.List([@sets.in_univ()]))
  let t237 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Num) -> Bool) => suminf((n : Num) => if s(n) { inv(pow(real_of_num(2), n)) } else { real_of_num(0) })"))
  let t236 = @simp.rewrite_tac(@list.List([@sets.le_c()]))
  let t235 = @tactics.pop_assum(fn(x234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t233 = @simp.asm_rewrite_tac(@list.List([]))
  let t231 = @term_syntax.parse_term("(UNIV : (Real) -> Bool)")
  let t232 = @tactics.trans_tac(@card.card_le_trans())(t231)
  let t230 = @simp.rewrite_tac(@list.List([countable()]))
  let t229 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t266 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(uncountable_canonical()), t229), t230), @tactics.disch_tac), t232), t233), t235), t236), t237), t238), t240), t241), @tactics.strip_tac), t242), t244), t245), t246), t254), t255), t256), @tactics.strip_tac), t261), t263), t264), t265)
  uncountable_reals_c.set(@tactics.prove(@term_syntax.parse_term("!(countable : ((Real) -> Bool) -> Bool)((UNIV : (Real) -> Bool))"), t266))
}

///|
let uncountable_reals_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNCOUNTABLE_REALS")

///|
/// `UNCOUNTABLE_REALS`
pub fn uncountable_reals() -> @kernel.Thm {
  uncountable_reals_c.get()
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
}
