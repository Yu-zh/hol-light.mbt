// Translated from upstream 100/ballot.ml; edit this file directly.

///|
/// 100/ballot.ml:7
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// 100/ballot.ml:13
fn step_2() -> Unit raise {
  @printer.parse_as_infix("-->", (13L, "right"))
}

///|
/// funspace
fn step_3() -> Unit raise {
  funspace_c.set(@pair.new_definition(@term_syntax.parse_term("(op_minus_minus_gt : ((A) -> Bool, (B) -> Bool, (A) -> B) -> Bool)((s : (A) -> Bool), (t : (B) -> Bool)) == {(f : (A) -> B) | (∀ x : A, IN(x, s) → IN(f(x), t)) && (∀ x : A, !IN(x, s) → f(x) == select((y : B) => true))}")))
}

///|
let funspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("funspace")

///|
/// `funspace`
pub fn funspace() -> @kernel.Thm {
  funspace_c.get()
}

///|
/// FUNSPACE_EMPTY
fn step_4() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_sing(), funspace(), @sets.in_elim_thm(), @sets.not_in_empty()])), t1)
  funspace_empty_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_minus_gt({}, (t : (_) -> Bool)) == {(x : _) => select((y : _) => true)}"), t2))
}

///|
let funspace_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUNSPACE_EMPTY")

///|
/// `FUNSPACE_EMPTY`
pub fn funspace_empty() -> @kernel.Thm {
  funspace_empty_c.get()
}

///|
/// HAS_SIZE_FUNSPACE
fn step_5() -> Unit raise {
  let t57 = @meson.asm_meson_tac(@list.List([]))
  let t56 = @tactics.match_mp_tac(@sets.has_size_product())
  let t55 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @arith.exp()]))
  let t54 = @tactics.first_x_assum(fn(x53 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x50 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s51 = @tactics.subst_all_tac(x50)
      fn(x52 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s51(x52)
      }
    })(@equal.sym(x53))
  })
  let t48 = @meson.asm_meson_tac(@list.List([]))
  let t47 = @class.asm_cases_tac(@term_syntax.parse_term("(u : A) == (x : A)"))
  let t46 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : A)"))
  let t45 = @list.List([@meson.asm_meson_tac(@list.List([@sets.in_insert()])), @tactics.all_tac])
  let t44 = @tactics.repeat_tac(@tactics.gen_tac)
  let t43 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), funspace(), @sets.in_elim_thm()]))
  let t42 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.unwind_thm1()]))
  let t41 = @simp.rewrite_tac(@list.List([@pair.pair_eq(), @pair.exists_pair_thm(), @equal.gsym(@theorems.conj_assoc())]))
  let t40 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) && (b : Bool)) && (d : Bool)) == (d && a && b)"))]))
  let t39 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t49 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @sets.in_elim_thm()])), t39), t40), t41), t42), t43), t44), @tactics.strip_tac), @tactics.conj_tac), t45), t46), t47), t48), @tactics.all_tac])
  let t38 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t34 = @meson.asm_meson_tac(@list.List([@sets.in_insert()]))
  let t33 = @tactics.first_x_assum(fn(x30 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s31 = @tactics.subst_all_tac(x30)
    fn(x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s31(x32)
    }
  })
  let t28 = @term_syntax.parse_term("(g : (A) -> B)")
  let t29 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : B)"), t28]))
  let t35 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()])), t29), @tactics.strip_tac), t33), t34)
  let t27 = @meson.asm_meson_tac(@list.List([@sets.in_insert()]))
  let t26 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t25 = @term_syntax.parse_term("(u : A) => if u == (x : A) { select((y : B) => true) } else { (f : (A) -> B)(u) }")
  let t36 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.map_every(fn(x22 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s23 = @tactics.exists_tac(x22)
    fn(x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s23(x24)
    }
  }, @list.List([@term_syntax.parse_term("(f : (A) -> B)((x : A))"), t25]))), t26), t27), t35])
  let t21 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (A) -> B)"))
  let t20 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t19 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.unwind_thm1()]))
  let t18 = @simp.rewrite_tac(@list.List([@pair.pair_eq(), @pair.exists_pair_thm(), @equal.gsym(@theorems.conj_assoc())]))
  let t17 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) && (b : Bool) && (c : Bool)) && (d : Bool)) == (d && a && b && c)"))]))
  let t37 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), funspace(), @sets.in_elim_thm()])), t17), t18), t19), t20), t21), @tactics.eq_tac), t36), @tactics.all_tac])
  let t16 = @tactics.subgoal_then(@term_syntax.parse_term("op_minus_minus_gt(INSERT((x : A), (s : (A) -> Bool)), (t : (B) -> Bool)) == IMAGE(GABS((f : ((B, (A) -> B), A) -> B) => ∀ y : B, ∀ g : (A) -> B, GEQ(f((y, g)), (u : A) => if u == x { y } else { g(u) })), {((y : B), (g : (A) -> B)) | IN(y, t) && IN(g, op_minus_minus_gt(s, t))})"), fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s14 = @tactics.subst1_tac(x13)
    fn(x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s14(x15)
    }
  })
  let t12 = @tactics.repeat_tac(@tactics.strip_tac)
  let t11 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.has_size())]))
  let t9 = @simp.asm_rewrite_tac(@list.List([@arith.exp(), @calc_num.arith()]))
  let t8 = @tactics.disch_then(fn(x7 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x7))
  })
  let t6 = @tactics.repeat_tac(@tactics.gen_tac)
  let t10 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_rules(), funspace_empty(), @sets.not_in_empty()])), t6), t8), t9), @tactics.all_tac])
  let t5 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t4 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t3 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t58 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.has_size(), @equal.gsym(@theorems.conj_assoc())])), t3), t4), t5), @tactics.conj_tac), t10), t11), t12), t16), t37), t38), @tactics.conj_tac), t49), t54), t55), t56), t57)
  has_size_funspace_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (A) -> Bool, ∀ t : (B) -> Bool, ∀ m : Num, ∀ n : Num, HAS_SIZE(s, m) && HAS_SIZE(t, n) → HAS_SIZE(op_minus_minus_gt(s, t), EXP(n, m))"), t58))
}

///|
let has_size_funspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HAS_SIZE_FUNSPACE")

///|
/// `HAS_SIZE_FUNSPACE`
pub fn has_size_funspace() -> @kernel.Thm {
  has_size_funspace_c.get()
}

///|
/// FINITE_FUNSPACE
fn step_6() -> Unit raise {
  let t59 = @meson.meson_tac(@list.List([has_size_funspace(), @sets.has_size()]))
  finite_funspace_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, ∀ t : (_) -> Bool, FINITE(s) && FINITE(t) → FINITE(op_minus_minus_gt(s, t))"), t59))
}

///|
let finite_funspace_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_FUNSPACE")

///|
/// `FINITE_FUNSPACE`
pub fn finite_funspace() -> @kernel.Thm {
  finite_funspace_c.get()
}

///|
let vote_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vote_INDUCT")

///|
/// `vote_INDUCT`
pub fn vote_induct() -> @kernel.Thm {
  vote_induct_c.get()
}

///|
let vote_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vote_RECURSION")

///|
/// `vote_RECURSION`
pub fn vote_recursion() -> @kernel.Thm {
  vote_recursion_c.get()
}

///|
/// vote_INDUCT, vote_RECURSION
fn step_7() -> Unit raise {
  let (vote_induct, vote_recursion) = @ind_types.define_type("enum Vote { A; B }")
  vote_induct_c.set(vote_induct)
  vote_recursion_c.set(vote_recursion)
}

///|
/// all_countings
fn step_8() -> Unit raise {
  all_countings_c.set(@pair.new_definition(@term_syntax.parse_term("(all_countings : (Num, Num) -> Num)((a : Num), (b : Num)) == LET((n : Num) => LET_END(CARD({(f : (Num) -> Vote) | IN(f, op_minus_minus_gt(op_dot_dot(1, n), {A, B})) && CARD({(i : Num) | IN(i, op_dot_dot(1, n)) && f(i) == A}) == a && CARD({(i : Num) | IN(i, op_dot_dot(1, n)) && f(i) == B}) == b})), a + b)")))
}

///|
let all_countings_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("all_countings")

///|
/// `all_countings`
pub fn all_countings() -> @kernel.Thm {
  all_countings_c.get()
}

///|
/// valid_countings
fn step_9() -> Unit raise {
  valid_countings_c.set(@pair.new_definition(@term_syntax.parse_term("(valid_countings : (Num, Num) -> Num)((a : Num), (b : Num)) == LET((n : Num) => LET_END(CARD({(f : (Num) -> Vote) | IN(f, op_minus_minus_gt(op_dot_dot(1, n), {A, B})) && CARD({(i : Num) | IN(i, op_dot_dot(1, n)) && f(i) == A}) == a && CARD({(i : Num) | IN(i, op_dot_dot(1, n)) && f(i) == B}) == b && (∀ m : Num, 1 <= m && m <= n → CARD({(i : Num) | IN(i, op_dot_dot(1, m)) && f(i) == A}) > CARD({(i : Num) | IN(i, op_dot_dot(1, m)) && f(i) == B}))})), a + b)")))
}

///|
let valid_countings_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("valid_countings")

///|
/// `valid_countings`
pub fn valid_countings() -> @kernel.Thm {
  valid_countings_c.get()
}

///|
/// vote_CASES
fn step_10() -> Unit raise {
  vote_cases_c.set(@ind_types.cases("vote"))
}

///|
let vote_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vote_CASES")

///|
/// `vote_CASES`
pub fn vote_cases() -> @kernel.Thm {
  vote_cases_c.get()
}

///|
/// vote_DISTINCT
fn step_11() -> Unit raise {
  vote_distinct_c.set(@ind_types.distinctness("vote"))
}

///|
let vote_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("vote_DISTINCT")

///|
/// `vote_DISTINCT`
pub fn vote_distinct() -> @kernel.Thm {
  vote_distinct_c.get()
}

///|
/// FINITE_COUNTINGS
fn step_12() -> Unit raise {
  let t61 = @simp.rewrite_tac(@list.List([@iterate.finite_numseg(), @sets.finite_insert(), @sets.finite_rules()]))
  let t60 = @tactics.match_mp_tac(finite_funspace())
  let t62 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_restrict()), t60), t61)
  finite_countings_c.set(@tactics.prove(@term_syntax.parse_term("FINITE({(f : (Num) -> Vote) | IN(f, op_minus_minus_gt(op_dot_dot(1, (n : Num)), {A, B})) && (P : ((Num) -> Vote) -> Bool)(f)})"), t62))
}

///|
let finite_countings_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_COUNTINGS")

///|
/// `FINITE_COUNTINGS`
pub fn finite_countings() -> @kernel.Thm {
  finite_countings_c.get()
}

///|
/// UNIV_VOTE
fn step_13() -> Unit raise {
  let t63 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_univ(), @sets.in_insert(), @sets.not_in_empty(), vote_cases()]))
  univ_vote_c.set(@tactics.prove(@term_syntax.parse_term("UNIV == {A, B}"), t63))
}

///|
let univ_vote_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIV_VOTE")

///|
/// `UNIV_VOTE`
pub fn univ_vote() -> @kernel.Thm {
  univ_vote_c.get()
}

///|
/// ADD1_NOT_IN_NUMSEG
fn step_14() -> Unit raise {
  let t64 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.in_numseg()])), @int.arith_tac)
  add1_not_in_numseg_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, !IN(n + 1, op_dot_dot(m, n))"), t64))
}

///|
let add1_not_in_numseg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADD1_NOT_IN_NUMSEG")

///|
/// `ADD1_NOT_IN_NUMSEG`
pub fn add1_not_in_numseg() -> @kernel.Thm {
  add1_not_in_numseg_c.get()
}

///|
/// NUMSEG_1_CLAUSES
fn step_15() -> Unit raise {
  let t65 = @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))
  let t66 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @iterate.numseg_clauses(), t65]))
  numseg_1_clauses_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, op_dot_dot(1, n + 1) == INSERT(n + 1, op_dot_dot(1, n))"), t66))
}

///|
let numseg_1_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_1_CLAUSES")

///|
/// `NUMSEG_1_CLAUSES`
pub fn numseg_1_clauses() -> @kernel.Thm {
  numseg_1_clauses_c.get()
}

///|
/// NUMSEG_RESTRICT_SUC
fn step_16() -> Unit raise {
  let t68 = @meson.asm_meson_tac(@list.List([add1_not_in_numseg()]))
  let t67 = @simp.asm_rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), numseg_1_clauses(), @sets.in_insert()]))
  let t69 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @class.cond_cases_tac), t67), t68)
  numseg_restrict_suc_c.set(@tactics.prove(@term_syntax.parse_term("{(i : Num) | IN(i, op_dot_dot(1, (n : Num) + 1)) && (P : (Num) -> Bool)(i)} == (if P(n + 1) { INSERT(n + 1, {(i : Num) | IN(i, op_dot_dot(1, n)) && P(i)}) } else { {(i : Num) | IN(i, op_dot_dot(1, n)) && P(i)} })"), t69))
}

///|
let numseg_restrict_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NUMSEG_RESTRICT_SUC")

///|
/// `NUMSEG_RESTRICT_SUC`
pub fn numseg_restrict_suc() -> @kernel.Thm {
  numseg_restrict_suc_c.get()
}

///|
/// CARD_NUMSEG_RESTRICT_SUC
fn step_17() -> Unit raise {
  let t72 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), add1_not_in_numseg(), @arith.add1()]))
  let t71 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.finite_restrict(), @iterate.finite_numseg()]))
  let t70 = @simp.rewrite_tac(@list.List([numseg_restrict_suc()]))
  let t73 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t70), @class.cond_cases_tac), t71), t72)
  card_numseg_restrict_suc_c.set(@tactics.prove(@term_syntax.parse_term("CARD({(i : Num) | IN(i, op_dot_dot(1, (n : Num) + 1)) && (P : (Num) -> Bool)(i)}) == (if P(n + 1) { CARD({(i : Num) | IN(i, op_dot_dot(1, n)) && P(i)}) + 1 } else { CARD({(i : Num) | IN(i, op_dot_dot(1, n)) && P(i)}) })"), t73))
}

///|
let card_numseg_restrict_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_NUMSEG_RESTRICT_SUC")

///|
/// `CARD_NUMSEG_RESTRICT_SUC`
pub fn card_numseg_restrict_suc() -> @kernel.Thm {
  card_numseg_restrict_suc_c.get()
}

///|
/// FORALL_RANGE_SUC
fn step_18() -> Unit raise {
  let t74 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) + 1"))]))
  let t75 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((i : Num) <= (n : Num) + 1) == (i <= n || i == n + 1)"))])), t74)
  forall_range_suc_c.set(@tactics.prove(@term_syntax.parse_term("(∀ i : Num, 1 <= i && i <= (n : Num) + 1 → (P : (Num) -> Bool)(i)) == (P(n + 1) && (∀ i : Num, 1 <= i && i <= n → P(i)))"), t75))
}

///|
let forall_range_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_RANGE_SUC")

///|
/// `FORALL_RANGE_SUC`
pub fn forall_range_suc() -> @kernel.Thm {
  forall_range_suc_c.get()
}

///|
/// IN_NUMSEG_RESTRICT_FALSE
fn step_19() -> Unit raise {
  let t76 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(i : Num) <= (m : Num) && m <= (n : Num) → !(i == n + 1)"))]))
  let t77 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@iterate.in_numseg()])), t76)
  in_numseg_restrict_false_c.set(@tactics.prove(@term_syntax.parse_term("(m : Num) <= (n : Num) → (IN((i : Num), op_dot_dot(1, m)) && (if i == n + 1 { (p : (Num) -> Bool)(i) } else { (q : (Num) -> Bool)(i) })) == (IN(i, op_dot_dot(1, m)) && q(i))"), t77))
}

///|
let in_numseg_restrict_false_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_NUMSEG_RESTRICT_FALSE")

///|
/// `IN_NUMSEG_RESTRICT_FALSE`
pub fn in_numseg_restrict_false() -> @kernel.Thm {
  in_numseg_restrict_false_c.get()
}

///|
/// CARD_NUMSEG_RESTRICT_EXTREMA
fn step_20() -> Unit raise {
  let t84 = @meson.meson_tac(@list.List([]))
  let t83 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @iterate.in_numseg(), @sets.in_elim_thm()]))
  let t82 = @tactics.disch_then(fn(x81 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t80 = @simp.simp_tac(@list.List([@iterate.finite_numseg(), @sets.subset(), @sets.in_elim_thm(), @iterate.card_numseg_1()]))
  let t78 = @term_syntax.parse_term("op_dot_dot(1, (n : Num))")
  let t79 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("{(i : Num) | IN(i, op_dot_dot(1, (n : Num))) && (P : (Num) -> Bool)(i)}"), t78]), @sets.subset_card_eq()))
  let t85 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@sets.card_eq_0(), @sets.finite_restrict(), @iterate.finite_numseg()])), t79), t80), t82), t83), t84)
  card_numseg_restrict_extrema_c.set(@tactics.prove(@term_syntax.parse_term("(CARD({(i : Num) | IN(i, op_dot_dot(1, (n : Num))) && (P : (Num) -> Bool)(i)}) == n) == (∀ i : Num, 1 <= i && i <= n → P(i)) && (CARD({(i : Num) | IN(i, op_dot_dot(1, n)) && P(i)}) == 0) == (∀ i : Num, 1 <= i && i <= n → !P(i))"), t85))
}

///|
let card_numseg_restrict_extrema_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CARD_NUMSEG_RESTRICT_EXTREMA")

///|
/// `CARD_NUMSEG_RESTRICT_EXTREMA`
pub fn card_numseg_restrict_extrema() -> @kernel.Thm {
  card_numseg_restrict_extrema_c.get()
}

///|
/// VOTE_NOT_EQ
fn step_21() -> Unit raise {
  let t86 = @meson.meson_tac(@list.List([vote_cases(), vote_distinct()]))
  vote_not_eq_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Vote, !(x == A) == (x == B)) && (∀ x : Vote, !(x == B) == (x == A))"), t86))
}

///|
let vote_not_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VOTE_NOT_EQ")

///|
/// `VOTE_NOT_EQ`
pub fn vote_not_eq() -> @kernel.Thm {
  vote_not_eq_c.get()
}

///|
/// FUNSPACE_FIXED
fn step_22() -> Unit raise {
  let t89 = @meson.asm_meson_tac(@list.List([]))
  let t88 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t87 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), funspace(), @sets.not_in_empty(), @sets.in_sing()]))
  let t90 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty()])), @tactics.gen_tac), @class.cond_cases_tac), t87), t88), t89)
  funspace_fixed_c.set(@tactics.prove(@term_syntax.parse_term("{(f : (_) -> _) | IN(f, op_minus_minus_gt((s : (_) -> Bool), (t : (_) -> Bool))) && (∀ i : _, IN(i, s) → f(i) == (a : _))} == (if s == {} || IN(a, t) { {(i : _) => if IN(i, s) { a } else { select((x : _) => true) }} } else { {} })"), t90))
}

///|
let funspace_fixed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FUNSPACE_FIXED")

///|
/// `FUNSPACE_FIXED`
pub fn funspace_fixed() -> @kernel.Thm {
  funspace_fixed_c.get()
}

///|
/// COUNTING_LEMMA
fn step_23() -> Unit raise {
  let t110 = @meson.asm_meson_tac(@list.List([add1_not_in_numseg()]))
  let t109 = @tactics.try_tac(@simp.gen_rewrite_tac(fn(x108 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x108
  }, @list.List([@class.fun_eq_thm()])))
  let t105 = @drule.match_mp(@meson.meson(@list.List([]), @term_syntax.parse_term("(P : (_) -> Bool)((x : _)) → x == (y : _) → P(y)")))
  let t107 = @tactics.try_tac(@tactics.first_x_assum(fn(x106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t105(x106))
  }))
  let t104 = @tactics.repeat_tac(@tactics.strip_tac)
  let t103 = @simp.rewrite_tac(@list.List([numseg_1_clauses(), @sets.in_insert()]))
  let t102 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), funspace(), @equal.gsym(univ_vote()), @sets.in_univ()]))
  let t101 = @simp.rewrite_tac(@list.List([finite_countings()]))
  let t99 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Num) -> Vote) => (i : Num) => if i == (n : Num) + 1 { B } else { f(i) }"))
  let t100 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(f : (Num) -> Vote) => (i : Num) => if i == (n : Num) + 1 { A } else { f(i) }")), t99])
  let t98 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Num) -> Vote) => (i : Num) => if i == (n : Num) + 1 { select((x : Vote) => true) } else { f(i) }"))
  let t97 = @tactics.match_mp_tac(@sets.bijections_card_eq())
  let t95 = @meson.meson_tac(@list.List([vote_cases(), vote_distinct()]))
  let t94 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.not_in_empty()]))
  let t93 = @simp.rewrite_tac(@list.List([finite_countings(), @sets.extension(), @sets.in_inter(), @sets.in_union()]))
  let t92 = @tactics.match_mp_tac(@sets.card_union_eq())
  let t96 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t92), t93), t94), t95), @tactics.all_tac])
  let t91 = @tactics.exists_tac(@term_syntax.parse_term("CARD({(f : (Num) -> Vote) | IN(f, op_minus_minus_gt(op_dot_dot(1, (n : Num) + 1), {A, B})) && f(n + 1) == A && (P : ((Num) -> Vote) -> Bool)(f)}) + CARD({(f : (Num) -> Vote) | IN(f, op_minus_minus_gt(op_dot_dot(1, n + 1), {A, B})) && f(n + 1) == B && P(f)})"))
  let t111 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t91), @tactics.conj_tac), t96), @tactics.binop_tac), t97), t98), t100), t101), t102), t103), t104), t107), t109), t110)
  counting_lemma_c.set(@tactics.prove(@term_syntax.parse_term("CARD({(f : (Num) -> Vote) | IN(f, op_minus_minus_gt(op_dot_dot(1, (n : Num) + 1), {A, B})) && (P : ((Num) -> Vote) -> Bool)(f)}) == CARD({(f : (Num) -> Vote) | IN(f, op_minus_minus_gt(op_dot_dot(1, n), {A, B})) && P((i : Num) => if i == n + 1 { A } else { f(i) })}) + CARD({(f : (Num) -> Vote) | IN(f, op_minus_minus_gt(op_dot_dot(1, n), {A, B})) && P((i : Num) => if i == n + 1 { B } else { f(i) })})"), t111))
}

///|
let counting_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTING_LEMMA")

///|
/// `COUNTING_LEMMA`
pub fn counting_lemma() -> @kernel.Thm {
  counting_lemma_c.get()
}

///|
/// ALL_COUNTINGS_0
fn step_24() -> Unit raise {
  let t113 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_rules(), @sets.not_in_empty(), @calc_num.arith_suc()]))
  let t112 = @simp.rewrite_tac(@list.List([funspace_fixed(), @sets.in_insert()]))
  let t114 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([all_countings(), card_numseg_restrict_extrema(), @equal.gsym(@iterate.in_numseg()), @pair.let_def(), @pair.let_end_def(), @arith.add_clauses(), vote_not_eq()])), t112), t113)
  all_countings_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, all_countings(a, 0) == 1 && all_countings(0, a) == 1"), t114))
}

///|
let all_countings_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_COUNTINGS_0")

///|
/// `ALL_COUNTINGS_0`
pub fn all_countings_0() -> @kernel.Thm {
  all_countings_0_c.get()
}

///|
/// VALID_COUNTINGS_0
fn step_25() -> Unit raise {
  let t115 = @tactics.then_tac(@class.cond_cases_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([])))
  let lemma = @tactics.prove(@term_syntax.parse_term("INTER({(x : _)}, (s : (_) -> Bool)) == (if IN(x, s) { {x} } else { {} })"), t115)
  let t162 = @simp.simp_tac(@list.List([vote_distinct(), @sets.set_rule(@term_syntax.parse_term("{(x : _) | false} == {} && {(x : _) | x == (a : _)} == {a}")), @sets.card_clauses(), @sets.finite_rules(), @sets.not_in_empty(), @calc_num.arith()]))
  let t161 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @arith.le_refl(), @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))]))
  let t160 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _) && (P : (_) -> Bool)(x)} == {(x : _) | x == a && P(a)}"))]))
  let t159 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(b : Num) == 0 && !((a : Num) == 0) → !(b > a)")))
  let t158 = @simp.rewrite_tac(@list.List([@iterate.in_numseg(), @arith.le_refl(), @int.arith_rule(@term_syntax.parse_term("1 <= SUC((n : Num))"))]))
  let t157 = @simp.rewrite_tac(@list.List([@iterate.numseg_sing(), @sets.in_sing()]))
  let t163 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("1")), t157), t158), t159), t160), t161), t162)
  let t156 = @tactics.pop_assum(fn(x153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s154 = @tactics.mp_tac(x153)
    fn(x155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s154(x155)
    }
  })
  let t149 = @term_syntax.parse_term("1")
  let t152 = @tactics.disch_then(fn(x151 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x146 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s147 = @tactics.mp_tac(x146)
      fn(x148 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s147(x148)
      }
    })(((x150 : @kernel.Thm) => @bool.spec(t149, x150))(x151))
  })
  let t145 = @simp.asm_simp_tac(@list.List([@iterate.in_numseg(), vote_distinct()]))
  let t142 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("1 <= (k : Num) && k <= (a : Num) → 1 <= k && (∀ i : Num, i <= k → i <= a)")))
  let t144 = @tactics.disch_then(fn(x143 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s140 = @tactics.assume_tac(x139)
      fn(x141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s140(x141)
      }
    })(t142(x143))
  })
  let t136 = @simp.gen_rewrite_rule(fn(x135 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x135
  }, @list.List([@iterate.in_numseg()]))
  let t138 = @tactics.first_x_assum(fn(x137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s133 = @tactics.mp_tac(x132)
      fn(x134 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s133(x134)
      }
    })(t136(x137))
  })
  let t131 = @simp.asm_simp_tac(@list.List([card_numseg_restrict_extrema()]))
  let t130 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(b : Num) == 0 && !((a : Num) == 0) → a > b")))
  let t164 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(k : Num)")), @tactics.disch_tac), t130), t131), t138), t144), t145), t152), t156), @int.arith_tac), t163])
  let t129 = @simp.rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t128 = @tactics.pop_assum(fn(x125 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s126 = @tactics.mp_tac(x125)
    fn(x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s126(x127)
    }
  })
  let t124 = @simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.finite_rules(), @sets.not_in_empty(), @calc_num.arith()]))
  let t123 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t122 = @simp.rewrite_tac(@list.List([funspace_fixed(), @sets.in_insert(), lemma]))
  let t121 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x) && (R : (_) -> Bool)(x)} == INTER({(x : _) | P(x) && Q(x)}, {(x : _) | R(x)})"))]))
  let t119 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_rules(), @sets.not_in_empty(), @calc_num.arith()]))
  let t118 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}"))]))
  let t120 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([funspace(), @sets.in_elim_thm(), @sets.not_in_empty(), @equal.gsym(@class.fun_eq_thm())])), t118), t119), @tactics.all_tac])
  let t117 = @simp.rewrite_tac(@list.List([@bool.conjunct1(@iterate.numseg_clauses()), @calc_num.arith_eq(), @sets.not_in_empty()]))
  let t116 = @class.taut(@term_syntax.parse_term("((a : Bool) && a && (b : Bool)) == (a && b)"))
  let t165 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([valid_countings(), card_numseg_restrict_extrema(), @equal.gsym(@iterate.in_numseg()), @pair.let_def(), @pair.let_end_def(), @arith.add_clauses(), vote_not_eq(), t116])), t117), @tactics.conj_tac), t120), t121), t122), t123), @tactics.gen_tac), @tactics.conj_tac), @class.cond_cases_tac), t124), t128), t129), t164)
  valid_countings_0_c.set(@tactics.prove(@term_syntax.parse_term("valid_countings(0, 0) == 1 && (∀ a : Num, valid_countings(SUC(a), 0) == 1 && valid_countings(0, SUC(a)) == 0)"), t165))
}

///|
let valid_countings_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALID_COUNTINGS_0")

///|
/// `VALID_COUNTINGS_0`
pub fn valid_countings_0() -> @kernel.Thm {
  valid_countings_0_c.get()
}

///|
/// ALL_COUNTINGS_SUC
fn step_26() -> Unit raise {
  let t180 = @simp.simp_tac(@list.List([in_numseg_restrict_false(), @arith.le_refl(), @arith.eq_add_rcancel()]))
  let t179 = @simp.rewrite_tac(@list.List([card_numseg_restrict_suc()]))
  let t178 = @simp.rewrite_tac(@list.List([vote_distinct()]))
  let t177 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t176 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t175 = @simp.rewrite_tac(@list.List([]))
  let t174 = @simp.gen_rewrite_tac(fn(x171 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s172 = @equal.land_conv(x171)
    fn(x173 : @kernel.Term) -> @kernel.Thm raise {
      s172(x173)
    }
  }, @list.List([counting_lemma()]))
  let t170 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t169 = @simp.abbrev_tac(@term_syntax.parse_term("(n : Num) == (a : Num) + ((b : Num) + 1)"))
  let t168 = @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) + 1 + (b : Num) == a + (b + 1)")))
  let t167 = @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) + 1 + ((b : Num) + 1) == a + (b + 1) + 1")))
  let t166 = @simp.rewrite_tac(@list.List([all_countings()]))
  let t181 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t166), t167), t168), t169), t170), t174), t175), @tactics.binop_tac), t176), t177), t178), t179), t180)
  all_countings_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, all_countings(a + 1, b + 1) == all_countings(a, b + 1) + all_countings(a + 1, b)"), t181))
}

///|
let all_countings_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_COUNTINGS_SUC")

///|
/// `ALL_COUNTINGS_SUC`
pub fn all_countings_suc() -> @kernel.Thm {
  all_countings_suc_c.get()
}

///|
/// VALID_COUNTINGS_SUC
fn step_27() -> Unit raise {
  let t202 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | false} == {}")), @sets.card_clauses(), @arith.add_clauses()]))
  let t201 = @simp.asm_rewrite_tac(@list.List([@arith.gt(), @arith.lt_add_rcancel()]))
  let t200 = @simp.simp_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("((x : _) == (a : _) && (y : _) == (b : _) && (P : (_, _) -> Bool)(x, y)) == (x == a && y == b && P(a, b))"))]))
  let t199 = @simp.simp_tac(@list.List([in_numseg_restrict_false(), @arith.le_refl(), @arith.eq_add_rcancel()]))
  let t198 = @simp.rewrite_tac(@list.List([card_numseg_restrict_suc()]))
  let t197 = @simp.rewrite_tac(@list.List([forall_range_suc()]))
  let t196 = @simp.rewrite_tac(@list.List([vote_distinct()]))
  let t195 = @simp.once_rewrite_tac(@list.List([@class.cond_rator()]))
  let t194 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t193 = @simp.rewrite_tac(@list.List([]))
  let t192 = @simp.gen_rewrite_tac(fn(x189 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s190 = @equal.land_conv(x189)
    fn(x191 : @kernel.Term) -> @kernel.Thm raise {
      s190(x191)
    }
  }, @list.List([counting_lemma()]))
  let t188 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t187 = @simp.abbrev_tac(@term_syntax.parse_term("(n : Num) == (a : Num) + ((b : Num) + 1)"))
  let t186 = @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) + 1 + (b : Num) == a + (b + 1)")))
  let t185 = @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) + 1 + ((b : Num) + 1) == a + (b + 1) + 1")))
  let t184 = @simp.rewrite_tac(@list.List([valid_countings()]))
  let t183 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@arith.not_lt())]))
  let t182 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Num) < (a : Num)"))
  let t203 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t182), t183), t184), t185), t186), t187), t188), t192), t193), t194), t195), t196), t197), t198), t199), t200), t201), t202)
  valid_countings_suc_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, valid_countings(a + 1, b + 1) == (if a <= b { 0 } else { valid_countings(a, b + 1) + valid_countings(a + 1, b) })"), t203))
}

///|
let valid_countings_suc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALID_COUNTINGS_SUC")

///|
/// `VALID_COUNTINGS_SUC`
pub fn valid_countings_suc() -> @kernel.Thm {
  valid_countings_suc_c.get()
}

///|
/// ALL_COUNTINGS
fn step_28() -> Unit raise {
  let t209 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.add_ac()]))
  let t208 = @simp.asm_rewrite_tac(@list.List([@binomial.binom(), @equal.gsym(@arith.add1())]))
  let t207 = @simp.rewrite_tac(@list.List([all_countings_suc(), @arith.add1()]))
  let t205 = @int.arith_rule(@term_syntax.parse_term("(a : Num) < SUC(a)"))
  let t206 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 == (a : Num) + 1) == (a == 0)")), @binomial.binom_eq_0(), t205]))
  let t204 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @binomial.binom_refl(), @binomial.binom(), all_countings_0()]))
  let t210 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@arith.add_clauses(), @binomial.binom_refl(), @binomial.binom(), all_countings_0()]))), @nums.induct_tac), t204), t206), t207), t208), t209)
  all_countings_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, all_countings(a, b) == binom((a + b, a))"), t210))
}

///|
let all_countings_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_COUNTINGS")

///|
/// `ALL_COUNTINGS`
pub fn all_countings_v1() -> @kernel.Thm {
  all_countings_v1_c.get()
}

///|
/// VALID_COUNTINGS
fn step_29() -> Unit raise {
  let t237 = @tactics.conv_tac(@calc_rat.real_ring)
  let t231 = @int.arith_rule(@term_syntax.parse_term("!((a : Num) <= (b : Num)) → b <= SUC(a) && SUC(b) <= a && SUC(b) <= SUC(a)"))
  let t232 = @equal.gsym(@real.real_of_num_sub())
  let t233 = @equal.gsym(@real.real_of_num_suc())
  let t234 = @equal.gsym(@realax.real_of_num_add())
  let t235 = @equal.gsym(@realax.real_of_num_mul())
  let t236 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_of_num_eq()), t235, t234, t233, t232, @realax.real_of_num_le(), @arith.lt_nz(), t231]))
  let t228 = @term_syntax.parse_term("(a : Num) + (b : Num)")
  let t229 = @term_syntax.parse_term("(b : Num)")
  let t230 = @tactics.map_every(fn(x226 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x226
    @tactics.mp_tac(@bool.spec(t, @arith.fact_lt()))
  }, @list.List([@term_syntax.parse_term("(a : Num)"), t229, t228]))
  let t225 = @tactics.subst1_tac(@int.arith_rule(@term_syntax.parse_term("(b : Num) + (a : Num) == a + b")))
  let t224 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), @arith.fact()]))
  let t222 = @term_syntax.parse_term("SUC((a : Num))")
  let t223 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("SUC((b : Num))"), t222]), @binomial.binom_fact()))
  let t220 = @term_syntax.parse_term("SUC((a : Num))")
  let t221 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(b : Num)"), t220]), @binomial.binom_fact()))
  let t218 = @term_syntax.parse_term("(a : Num)")
  let t219 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("SUC((b : Num))"), t218]), @binomial.binom_fact()))
  let t217 = @simp.asm_rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith()]))
  let t216 = @tactics.match_mp_tac(@grobner.num_ring(@term_syntax.parse_term("!((a : Num) + ((b : Num) + 1) == 0) && (SUC(a) + SUC(b)) * ((SUC(a) + b) * ((a + SUC(b)) * (y : Num)) + (a + SUC(b)) * ((SUC(a) + b) * (z : Num))) == (SUC(a) + b) * ((a + SUC(b)) * (w : Num)) → (SUC(a) + SUC(b)) * (y + z) == w")))
  let t215 = @simp.asm_simp_tac(@list.List([@arith.mult_clauses(), @int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) → SUC(a) - SUC(b) == 0"))]))
  let t214 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1())]))
  let t213 = @simp.rewrite_tac(@list.List([@arith.add1(), valid_countings_suc()]))
  let t212 = @list.List([@simp.rewrite_tac(@list.List([valid_countings_0(), @arith.add_clauses(), @binomial.binom_refl(), @arith.sub_0()])), @tactics.all_tac])
  let t211 = @simp.asm_rewrite_tac(@list.List([valid_countings_0(), @arith.mult_clauses(), @arith.add_clauses()]))
  let t238 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@nums.induct_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([valid_countings_0(), @arith.sub_0(), @arith.mult_clauses()])), @nums.induct_tac), t211), @tactics.all_tac])), @nums.induct_tac), t212), t213), t214), @class.cond_cases_tac), t215), t216), t217), t219), t221), t223), t224), t225), t230), t236), t237)
  valid_countings_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, (a + b) * valid_countings(a, b) == (a - b) * binom((a + b, a))"), t238))
}

///|
let valid_countings_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VALID_COUNTINGS")

///|
/// `VALID_COUNTINGS`
pub fn valid_countings_v1() -> @kernel.Thm {
  valid_countings_v1_c.get()
}

///|
/// BALLOT
fn step_30() -> Unit raise {
  let t253 = @tactics.conv_tac(@calc_rat.real_field)
  let t247 = @int.arith_rule(@term_syntax.parse_term("!((a : Num) <= (b : Num)) → SUC(b) <= SUC(a)"))
  let t248 = @equal.gsym(@real.real_of_num_sub())
  let t249 = @equal.gsym(@real.real_of_num_suc())
  let t250 = @equal.gsym(@realax.real_of_num_add())
  let t251 = @equal.gsym(@realax.real_of_num_mul())
  let t252 = @simp.asm_simp_tac(@list.List([@equal.gsym(@realax.real_of_num_eq()), t251, t250, t249, t248, t247]))
  let t246 = @simp.rewrite_tac(@list.List([@arith.mult_eq_0(), @arith.mult_clauses(), @arith.add_eq_0(), @nums.not_suc(), @realax.real_of_num_eq()]))
  let t245 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (b : Num) → SUC(a) - SUC(b) == 0"))]))
  let t244 = @simp.rewrite_tac(@list.List([@equal.gsym(all_countings_v1()), @arith.le_suc()]))
  let t242 = @term_syntax.parse_term("SUC((b : Num))")
  let t243 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("SUC((a : Num))"), t242]), valid_countings_v1()))
  let t241 = @simp.simp_tac(@list.List([@calc_int.real_add_rid(), @real.real_sub_rzero(), @real.real_div_refl(), @realax.real_of_num_eq(), @nums.not_suc(), @realax.real_mul_lid()]))
  let t240 = @simp.rewrite_tac(@list.List([@arith.le_refl(), @realax.real_mul_lid(), @arith.le_0(), @nums.not_suc(), @bool.conjunct1(@arith.le())]))
  let t239 = @simp.rewrite_tac(@list.List([all_countings_0(), valid_countings_0()]))
  let t254 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@nums.induct_tac), t239), t240), t241), t243), t244), @class.cond_cases_tac), t245), t246), t252), t253)
  ballot_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, real_of_num(valid_countings(a, b)) == (if a <= b { if b == 0 { real_of_num(1) } else { real_of_num(0) } } else { (real_of_num(a) - real_of_num(b)) / (real_of_num(a) + real_of_num(b)) * real_of_num(all_countings(a, b)) })"), t254))
}

///|
let ballot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BALLOT")

///|
/// `BALLOT`
pub fn ballot() -> @kernel.Thm {
  ballot_c.get()
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
}
