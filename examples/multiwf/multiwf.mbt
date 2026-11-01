// Translated from upstream Examples/multiwf.ml; edit this file directly.

///|
/// EMPTY_IS_FINITE
fn step_1() -> Unit raise {
  let t1 = @simp.simp_tac(@list.List([@sets.finite_rules()]))
  empty_is_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, s == {} → FINITE(s)"), t1))
}

///|
let empty_is_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EMPTY_IS_FINITE")

///|
/// `EMPTY_IS_FINITE`
pub fn empty_is_finite() -> @kernel.Thm {
  empty_is_finite_c.get()
}

///|
/// SING_IS_FINITE
fn step_2() -> Unit raise {
  let t2 = @simp.simp_tac(@list.List([@sets.finite_insert(), @sets.finite_rules()]))
  sing_is_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (_) -> Bool, ∀ a : _, s == {a} → FINITE(s)"), t2))
}

///|
let sing_is_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SING_IS_FINITE")

///|
/// `SING_IS_FINITE`
pub fn sing_is_finite() -> @kernel.Thm {
  sing_is_finite_c.get()
}

///|
/// UNION_NONZERO
fn step_3() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @sets.extension(), @sets.in_union(), @sets.in_elim_thm(), @class.de_morgan_thm()]))
  union_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("{(a : _) | !((f : (_) -> Num)(a) + (g : (_) -> Num)(a) == 0)} == UNION({(a : _) | !(f(a) == 0)}, {(a : _) | !(g(a) == 0)})"), t3))
}

///|
let union_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNION_NONZERO")

///|
/// `UNION_NONZERO`
pub fn union_nonzero() -> @kernel.Thm {
  union_nonzero_c.get()
}

///|
/// Examples/multiwf.ml:21
fn step_4() -> Unit raise {
  @printer.parse_as_infix("mmember", (11L, "right"))
}

///|
/// Examples/multiwf.ml:22
fn step_5() -> Unit raise {
  @printer.parse_as_infix("munion", (16L, "right"))
}

///|
/// Examples/multiwf.ml:23
fn step_6() -> Unit raise {
  @printer.parse_as_infix("mdiff", (18L, "left"))
}

///|
/// multiset_tybij_th
fn step_7() -> Unit raise {
  let t4 = @simp.simp_tac(@list.List([empty_is_finite(), @sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty()]))
  let t5 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(a : A) => 0")), t4)
  multiset_tybij_th_c.set(@tactics.prove(@term_syntax.parse_term("∃ f : (A) -> Num, FINITE({(a : A) | !(f(a) == 0)})"), t5))
}

///|
let multiset_tybij_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("multiset_tybij_th")

///|
/// `multiset_tybij_th`
pub fn multiset_tybij_th() -> @kernel.Thm {
  multiset_tybij_th_c.get()
}

///|
/// multiset_tybij
fn step_8() -> Unit raise {
  multiset_tybij_c.set(@class.new_type_definition("multiset", ("multiset", "multiplicity"), multiset_tybij_th()))
}

///|
let multiset_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("multiset_tybij")

///|
/// `multiset_tybij`
pub fn multiset_tybij() -> @kernel.Thm {
  multiset_tybij_c.get()
}

///|
/// mempty
fn step_9() -> Unit raise {
  mempty_c.set(@pair.new_definition(@term_syntax.parse_term("(mempty : Multiset[_]) == multiset((b : _) => 0)")))
}

///|
let mempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mempty")

///|
/// `mempty`
pub fn mempty() -> @kernel.Thm {
  mempty_c.get()
}

///|
/// mmember
fn step_10() -> Unit raise {
  mmember_c.set(@pair.new_definition(@term_syntax.parse_term("(mmember : (_, Multiset[_]) -> Bool)((a : _), (M : Multiset[_])) == !(multiplicity(M, a) == 0)")))
}

///|
let mmember_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mmember")

///|
/// `mmember`
pub fn mmember() -> @kernel.Thm {
  mmember_c.get()
}

///|
/// msing
fn step_11() -> Unit raise {
  msing_c.set(@pair.new_definition(@term_syntax.parse_term("(msing : (_) -> Multiset[_])((a : _)) == multiset((b : _) => if b == a { 1 } else { 0 })")))
}

///|
let msing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("msing")

///|
/// `msing`
pub fn msing() -> @kernel.Thm {
  msing_c.get()
}

///|
/// munion
fn step_12() -> Unit raise {
  munion_c.set(@pair.new_definition(@term_syntax.parse_term("(munion : (Multiset[_], Multiset[_]) -> Multiset[_])((M : Multiset[_]), (N : Multiset[_])) == multiset((b : _) => multiplicity(M, b) + multiplicity(N, b))")))
}

///|
let munion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("munion")

///|
/// `munion`
pub fn munion() -> @kernel.Thm {
  munion_c.get()
}

///|
/// mdiff
fn step_13() -> Unit raise {
  mdiff_c.set(@pair.new_definition(@term_syntax.parse_term("(mdiff : (Multiset[_], Multiset[_]) -> Multiset[_])((M : Multiset[_]), (N : Multiset[_])) == multiset((b : _) => multiplicity(M, b) - multiplicity(N, b))")))
}

///|
let mdiff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mdiff")

///|
/// `mdiff`
pub fn mdiff() -> @kernel.Thm {
  mdiff_c.get()
}

///|
/// MEXTENSION
fn step_14() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([multiset_tybij()]))
  let t6 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t8 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@class.fun_eq_thm())])), t6), t7)
  mextension_c.set(@tactics.prove(@term_syntax.parse_term("((M : Multiset[_]) == (N : Multiset[_])) == (∀ a : _, multiplicity(M, a) == multiplicity(N, a))"), t8))
}

///|
let mextension_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEXTENSION")

///|
/// `MEXTENSION`
pub fn mextension() -> @kernel.Thm {
  mextension_c.get()
}

///|
/// MULTIPLICITY_MULTISET
fn step_15() -> Unit raise {
  let t9 = @simp.simp_tac(@list.List([multiset_tybij()]))
  multiplicity_multiset_c.set(@tactics.prove(@term_syntax.parse_term("FINITE({(a : _) | !((f : (_) -> Num)(a) == 0)}) && f((a : _)) == (y : Num) → multiplicity(multiset(f), a) == y"), t9))
}

///|
let multiplicity_multiset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTIPLICITY_MULTISET")

///|
/// `MULTIPLICITY_MULTISET`
pub fn multiplicity_multiset() -> @kernel.Thm {
  multiplicity_multiset_c.get()
}

///|
/// MEMPTY
fn step_16() -> Unit raise {
  let t11 = @simp.simp_tac(@list.List([empty_is_finite(), @sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty()]))
  let t10 = @tactics.match_mp_tac(multiplicity_multiset())
  let t12 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([mempty()])), t10), t11)
  mempty_v1_c.set(@tactics.prove(@term_syntax.parse_term("multiplicity(mempty, (a : _)) == 0"), t12))
}

///|
let mempty_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MEMPTY")

///|
/// `MEMPTY`
pub fn mempty_v1() -> @kernel.Thm {
  mempty_v1_c.get()
}

///|
/// MSING
fn step_17() -> Unit raise {
  let t18 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t17 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_insert(), @sets.not_in_empty()]))
  let t16 = @tactics.exists_tac(@term_syntax.parse_term("(a : A)"))
  let t15 = @tactics.match_mp_tac(sing_is_finite())
  let t14 = @simp.rewrite_tac(@list.List([]))
  let t13 = @tactics.match_mp_tac(multiplicity_multiset())
  let t19 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([msing()])), t13), t14), t15), t16), t17), @tactics.gen_tac), @class.cond_cases_tac), t18)
  msing_v1_c.set(@tactics.prove(@term_syntax.parse_term("multiplicity(msing((a : A)), (b : A)) == (if b == a { 1 } else { 0 })"), t19))
}

///|
let msing_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MSING")

///|
/// `MSING`
pub fn msing_v1() -> @kernel.Thm {
  msing_v1_c.get()
}

///|
/// MUNION
fn step_18() -> Unit raise {
  let t24 = @simp.rewrite_tac(@list.List([multiset_tybij()]))
  let t23 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t22 = @simp.simp_tac(@list.List([multiset_tybij()]))
  let t21 = @simp.rewrite_tac(@list.List([union_nonzero(), @sets.finite_union()]))
  let t20 = @tactics.match_mp_tac(multiplicity_multiset())
  let t25 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([munion()])), t20), t21), t22), t23), t24)
  munion_v1_c.set(@tactics.prove(@term_syntax.parse_term("multiplicity(munion((M : Multiset[_]), (N : Multiset[_])), (a : _)) == multiplicity(M, a) + multiplicity(N, a)"), t25))
}

///|
let munion_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUNION")

///|
/// `MUNION`
pub fn munion_v1() -> @kernel.Thm {
  munion_v1_c.get()
}

///|
/// MDIFF
fn step_19() -> Unit raise {
  let t32 = @simp.rewrite_tac(@list.List([multiset_tybij()]))
  let t31 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t30 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), multiset_tybij()]))
  let t29 = @tactics.exists_tac(@term_syntax.parse_term("{(a : A) | !(multiplicity((M : Multiset[A]), a) == 0)}"))
  let t28 = @tactics.match_mp_tac(@sets.finite_subset())
  let t27 = @simp.rewrite_tac(@list.List([]))
  let t26 = @tactics.match_mp_tac(multiplicity_multiset())
  let t33 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([mdiff()])), t26), t27), t28), t29), t30), t31), t32), @int.arith_tac)
  mdiff_v1_c.set(@tactics.prove(@term_syntax.parse_term("multiplicity(mdiff((M : Multiset[A]), (N : Multiset[A])), (a : A)) == multiplicity(M, a) - multiplicity(N, a)"), t33))
}

///|
let mdiff_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MDIFF")

///|
/// `MDIFF`
pub fn mdiff_v1() -> @kernel.Thm {
  mdiff_v1_c.get()
}

///|
/// MUNION_MEMPTY
fn step_20() -> Unit raise {
  let t41 = @simp.rewrite_tac(@list.List([@arith.add_eq_0(), @calc_num.arith_eq()]))
  let t37 = @term_syntax.parse_term("(a : A)")
  let t40 = @tactics.disch_then(fn(x39 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x34 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s35 = @tactics.mp_tac(x34)
      fn(x36 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s35(x36)
      }
    })(((x38 : @kernel.Thm) => @bool.spec(t37, x38))(x39))
  })
  let t42 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([mextension(), mempty_v1(), msing_v1(), munion_v1()])), t40), t41)
  munion_mempty_c.set(@tactics.prove(@term_syntax.parse_term("!(munion((M : Multiset[A]), msing((a : A))) == mempty)"), t42))
}

///|
let munion_mempty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUNION_MEMPTY")

///|
/// `MUNION_MEMPTY`
pub fn munion_mempty() -> @kernel.Thm {
  munion_mempty_c.get()
}

///|
/// MMEMBER_MUNION
fn step_21() -> Unit raise {
  let t43 = @simp.rewrite_tac(@list.List([mmember(), munion_v1(), @arith.add_eq_0(), @class.de_morgan_thm()]))
  mmember_munion_c.set(@tactics.prove(@term_syntax.parse_term("mmember((x : _), munion((M : Multiset[_]), (N : Multiset[_]))) == (mmember(x, M) || mmember(x, N))"), t43))
}

///|
let mmember_munion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MMEMBER_MUNION")

///|
/// `MMEMBER_MUNION`
pub fn mmember_munion() -> @kernel.Thm {
  mmember_munion_c.get()
}

///|
/// MMEMBER_MSING
fn step_22() -> Unit raise {
  let t44 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t45 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([mmember(), msing_v1()])), @class.cond_cases_tac), t44)
  mmember_msing_c.set(@tactics.prove(@term_syntax.parse_term("mmember((x : _), msing((a : _))) == (x == a)"), t45))
}

///|
let mmember_msing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MMEMBER_MSING")

///|
/// `MMEMBER_MSING`
pub fn mmember_msing() -> @kernel.Thm {
  mmember_msing_c.get()
}

///|
/// MUNION_EMPTY
fn step_23() -> Unit raise {
  let t46 = @simp.rewrite_tac(@list.List([mextension(), munion_v1(), mempty_v1(), @arith.add_clauses()]))
  munion_empty_c.set(@tactics.prove(@term_syntax.parse_term("munion((M : Multiset[_]), mempty) == M"), t46))
}

///|
let munion_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUNION_EMPTY")

///|
/// `MUNION_EMPTY`
pub fn munion_empty() -> @kernel.Thm {
  munion_empty_c.get()
}

///|
/// MUNION_ASSOC
fn step_24() -> Unit raise {
  let t47 = @simp.rewrite_tac(@list.List([mextension(), munion_v1(), @arith.add_assoc()]))
  munion_assoc_c.set(@tactics.prove(@term_syntax.parse_term("munion((M1 : Multiset[_]), munion((M2 : Multiset[_]), (M3 : Multiset[_]))) == munion(munion(M1, M2), M3)"), t47))
}

///|
let munion_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUNION_ASSOC")

///|
/// `MUNION_ASSOC`
pub fn munion_assoc() -> @kernel.Thm {
  munion_assoc_c.get()
}

///|
/// MUNION_AC
fn step_25() -> Unit raise {
  let t48 = @simp.rewrite_tac(@list.List([mextension(), munion_v1(), @arith.add_ac()]))
  munion_ac_c.set(@tactics.prove(@term_syntax.parse_term("munion((M1 : Multiset[_]), (M2 : Multiset[_])) == munion(M2, M1) && munion(munion(M1, M2), (M3 : Multiset[_])) == munion(M1, munion(M2, M3)) && munion(M1, munion(M2, M3)) == munion(M2, munion(M1, M3))"), t48))
}

///|
let munion_ac_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUNION_AC")

///|
/// `MUNION_AC`
pub fn munion_ac() -> @kernel.Thm {
  munion_ac_c.get()
}

///|
/// MUNION_11
fn step_26() -> Unit raise {
  let t49 = @simp.rewrite_tac(@list.List([mextension(), munion_v1(), @arith.eq_add_rcancel()]))
  munion_11_c.set(@tactics.prove(@term_syntax.parse_term("(munion((M1 : Multiset[_]), (N : Multiset[_])) == munion((M2 : Multiset[_]), N)) == (M1 == M2)"), t49))
}

///|
let munion_11_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUNION_11")

///|
/// `MUNION_11`
pub fn munion_11() -> @kernel.Thm {
  munion_11_c.get()
}

///|
/// MUNION_INUNION
fn step_27() -> Unit raise {
  let t50 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t51 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([mmember(), munion_v1(), msing_v1(), @arith.add_eq_0()])), @class.cond_cases_tac), t50)
  munion_inunion_c.set(@tactics.prove(@term_syntax.parse_term("mmember((a : _), munion((M : Multiset[_]), msing((b : _)))) && !(b == a) → mmember(a, M)"), t51))
}

///|
let munion_inunion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MUNION_INUNION")

///|
/// `MUNION_INUNION`
pub fn munion_inunion() -> @kernel.Thm {
  munion_inunion_c.get()
}

///|
/// MMEMBER_MDIFF
fn step_28() -> Unit raise {
  let t54 = @tactics.undisch_tac(@term_syntax.parse_term("!(multiplicity((M : Multiset[A]), (a : A)) == 0)"))
  let t53 = @simp.asm_rewrite_tac(@list.List([]))
  let t52 = @tactics.repeat_tac(@tactics.strip_tac)
  let t55 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([mmember(), mextension(), munion_v1(), mdiff_v1(), msing_v1()])), t52), @class.cond_cases_tac), t53), t54), @int.arith_tac)
  mmember_mdiff_c.set(@tactics.prove(@term_syntax.parse_term("mmember((a : A), (M : Multiset[A])) → M == munion(mdiff(M, msing(a)), msing(a))"), t55))
}

///|
let mmember_mdiff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MMEMBER_MDIFF")

///|
/// `MMEMBER_MDIFF`
pub fn mmember_mdiff() -> @kernel.Thm {
  mmember_mdiff_c.get()
}

///|
/// MULTISET_INDUCT_LEMMA1
fn step_29() -> Unit raise {
  let t71 = @simp.asm_simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @class.contrapos_thm(), @arith.sub_0()]))
  let t70 = @tactics.exists_tac(@term_syntax.parse_term("{(a : A) | !(multiplicity((M : Multiset[A]), a) == 0)}"))
  let t69 = @tactics.match_mp_tac(@sets.subset_trans())
  let t68 = @simp.asm_rewrite_tac(@list.List([mdiff_v1(), msing_v1(), @int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) - 1 == n"))]))
  let t66 = @term_syntax.parse_term("∀ M : Multiset[A], multiplicity(M, (a : A)) == (n : Num) && SUBSET({(a : A) | !(multiplicity(M, a) == 0)}, INSERT(a, (s : (A) -> Bool))) → (P : (Multiset[A]) -> Bool)(M)")
  let t67 = @tactics.map_every(fn(x65 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(@kernel.assume_rule(x65))
  }, @list.List([@term_syntax.parse_term("∀ a : A, ∀ M : Multiset[A], (P : (Multiset[A]) -> Bool)(M) → P(munion(M, msing(a)))"), t66]))
  let t63 = @simp.asm_rewrite_tac(@list.List([mmember(), @nums.not_suc()]))
  let t64 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(mmember_mdiff()), t63), @tactics.all_tac])
  let t72 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("(M : Multiset[A]) == munion(mdiff(M, msing((a : A))), msing(a))"), fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s61 = @tactics.subst1_tac(x60)
    fn(x62 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s61(x62)
    }
  }), t64), t67), t68), t69), t70), t71)
  let t59 = @meson.asm_meson_tac(@list.List([]))
  let t58 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @sets.in_insert()]))
  let t57 = @tactics.undisch_tac(@term_syntax.parse_term("SUBSET({(a : A) | !(multiplicity((M : Multiset[A]), a) == 0)}, INSERT((a : A), (s : (A) -> Bool)))"))
  let t73 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t57), t58), t59), t72])
  let t56 = @tactics.repeat_tac(@tactics.strip_tac)
  let t74 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @nums.induct_tac), t56), t73)
  multiset_induct_lemma1_c.set(@tactics.prove(@term_syntax.parse_term("(∀ M : Multiset[A], SUBSET({(a : A) | !(multiplicity(M, a) == 0)}, (s : (A) -> Bool)) → (P : (Multiset[A]) -> Bool)(M)) && (∀ a : A, ∀ M : Multiset[A], P(M) → P(munion(M, msing(a)))) → (∀ n : Num, ∀ M : Multiset[A], multiplicity(M, (a : A)) == n && SUBSET({(a : A) | !(multiplicity(M, a) == 0)}, INSERT(a, s)) → P(M))"), t74))
}

///|
let multiset_induct_lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTISET_INDUCT_LEMMA1")

///|
/// `MULTISET_INDUCT_LEMMA1`
pub fn multiset_induct_lemma1() -> @kernel.Thm {
  multiset_induct_lemma1_c.get()
}

///|
/// MULTISET_INDUCT_LEMMA2
fn step_30() -> Unit raise {
  let t86 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@theorems.exists_refl())]))
  let t85 = @tactics.disch_then(@tactics.match_mp_tac)
  let t84 = @simp.asm_rewrite_tac(@list.List([]))
  let t83 = @tactics.mp_tac(multiset_induct_lemma1())
  let t82 = @tactics.repeat_tac(@tactics.strip_tac)
  let t80 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t79 = @simp.asm_rewrite_tac(@list.List([mextension(), mempty_v1()]))
  let t78 = @tactics.subgoal_then(@term_syntax.parse_term("(M : Multiset[A]) == mempty"), fn(x76 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x76
    @simp.asm_rewrite_tac(@list.List([th]))
  })
  let t75 = @tactics.repeat_tac(@tactics.strip_tac)
  let t81 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @sets.not_in_empty()])), t75), t78), t79), t80])
  let t87 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.match_mp_tac(@sets.finite_induct())), @tactics.conj_tac), t81), t82), t83), t84), t85), t86)
  multiset_induct_lemma2_c.set(@tactics.prove(@term_syntax.parse_term("(P : (Multiset[A]) -> Bool)(mempty) && (∀ a : A, ∀ M : Multiset[A], P(M) → P(munion(M, msing(a)))) → (∀ s : (A) -> Bool, FINITE(s) → (∀ M : Multiset[A], SUBSET({(a : A) | !(multiplicity(M, a) == 0)}, s) → P(M)))"), t87))
}

///|
let multiset_induct_lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTISET_INDUCT_LEMMA2")

///|
/// `MULTISET_INDUCT_LEMMA2`
pub fn multiset_induct_lemma2() -> @kernel.Thm {
  multiset_induct_lemma2_c.get()
}

///|
/// MULTISET_INDUCT
fn step_31() -> Unit raise {
  let t99 = @simp.rewrite_tac(@list.List([multiset_tybij()]))
  let t98 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t97 = @simp.rewrite_tac(@list.List([@sets.subset_refl(), multiset_tybij()]))
  let t96 = @tactics.exists_tac(@term_syntax.parse_term("{(a : A) | !(multiplicity((M : Multiset[A]), a) == 0)}"))
  let t95 = @tactics.disch_then(@tactics.match_mp_tac)
  let t94 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t93 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm()]))
  let t91 = @drule.match_mp(multiset_induct_lemma2())
  let t100 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x92 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x88 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s89 = @tactics.mp_tac(x88)
      fn(x90 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s89(x90)
      }
    })(t91(x92))
  }), t93), t94), @tactics.gen_tac), t95), t96), t97), t98), t99)
  multiset_induct_c.set(@tactics.prove(@term_syntax.parse_term("(P : (Multiset[A]) -> Bool)(mempty) && (∀ a : A, ∀ M : Multiset[A], P(M) → P(munion(M, msing(a)))) → (∀ M : Multiset[A], P(M))"), t100))
}

///|
let multiset_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTISET_INDUCT")

///|
/// `MULTISET_INDUCT`
pub fn multiset_induct() -> @kernel.Thm {
  multiset_induct_c.get()
}

///|
/// Examples/multiwf.ml:195
fn step_32() -> Unit raise {
  @printer.parse_as_infix("<<", (12L, "right"))
}

///|
let wfp_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WFP_RULES")

///|
/// `WFP_RULES`
pub fn wfp_rules() -> @kernel.Thm {
  wfp_rules_c.get()
}

///|
let wfp_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WFP_INDUCT")

///|
/// `WFP_INDUCT`
pub fn wfp_induct() -> @kernel.Thm {
  wfp_induct_c.get()
}

///|
let wfp_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WFP_CASES")

///|
/// `WFP_CASES`
pub fn wfp_cases() -> @kernel.Thm {
  wfp_cases_c.get()
}

///|
/// WFP_RULES, WFP_INDUCT, WFP_CASES
fn step_33() -> Unit raise {
  let (wfp_rules, wfp_induct, wfp_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("∀ x : _, (∀ y : _, (op_lt_lt : (_, _) -> Bool)(y, x) → (WFP : ((_, _) -> Bool, _) -> Bool)(op_lt_lt, y)) → WFP(op_lt_lt, x)"))
  wfp_rules_c.set(wfp_rules)
  wfp_induct_c.set(wfp_induct)
  wfp_cases_c.set(wfp_cases)
}

///|
/// WFP_PART_INDUCT
fn step_34() -> Unit raise {
  let t103 = @meson.asm_meson_tac(@list.List([wfp_rules()]))
  let t102 = @tactics.match_mp_tac(wfp_induct())
  let t101 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (a → a && b)"))]))
  let t104 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@sets.in_()]))), @tactics.strip_tac), t101), t102), t103)
  wfp_part_induct_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (A) -> Bool, (∀ x : A, IN(x, WFP((op_lt_lt : (A, A) -> Bool))) && (∀ y : A, op_lt_lt(y, x) → P(y)) → P(x)) → (∀ x : A, IN(x, WFP(op_lt_lt)) → P(x))"), t104))
}

///|
let wfp_part_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WFP_PART_INDUCT")

///|
/// `WFP_PART_INDUCT`
pub fn wfp_part_induct() -> @kernel.Thm {
  wfp_part_induct_c.get()
}

///|
/// WFP_WF
fn step_35() -> Unit raise {
  let t106 = @simp.asm_rewrite_tac(@list.List([@sets.in_(), @sets.univ(), @wf.wf_ind()]))
  let t107 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(wfp_part_induct())), t106)
  let t105 = @meson.meson_tac(@list.List([wfp_rules()]))
  let t108 = @tactics.thenl(@tactics.eq_tac, @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@wf.wf_ind(), @sets.extension(), @sets.in_(), @sets.univ()])), t105), t107]))
  wfp_wf_c.set(@tactics.prove(@term_syntax.parse_term("WF((op_lt_lt : (A, A) -> Bool)) == (WFP(op_lt_lt) == UNIV)"), t108))
}

///|
let wfp_wf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WFP_WF")

///|
/// `WFP_WF`
pub fn wfp_wf() -> @kernel.Thm {
  wfp_wf_c.get()
}

///|
/// WFP_DCHAIN
fn step_36() -> Unit raise {
  let t145 = @meson.meson_tac(@list.List([]))
  let t144 = @simp.gen_rewrite_tac(fn(x143 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x137 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s138 = @equal.land_conv(x137)
      fn(x139 : @kernel.Term) -> @kernel.Thm raise {
        s138(x139)
      }
    })((fn(x140 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s141 = @equal.rand_conv(x140)
      fn(x142 : @kernel.Term) -> @kernel.Thm raise {
        s141(x142)
      }
    })(x143))
  }, @list.List([wfp_cases()]))
  let t136 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t135 = @simp.asm_rewrite_tac(@list.List([]))
  let t132 = @term_syntax.parse_term("(a : A)")
  let t133 = @term_syntax.parse_term("(n : Num) => (x : A) => (y : A) => (op_lt_lt : (A, A) -> Bool)(y, x)")
  let t134 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(n : Num) => (x : A) => !WFP((op_lt_lt : (A, A) -> Bool), x)"), t133, t132]), @arith.dependent_choice_fixed()))
  let t131 = @simp.gen_rewrite_tac(fn(x130 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x130
  }, @list.List([@equal.gsym(@class.contrapos_thm())]))
  let t146 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(a : A)")), t131), @tactics.disch_tac), t134), t135), @tactics.ants_tac), t136), @tactics.gen_tac), t144), t145)
  let t129 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm()]))
  let t125 = @term_syntax.parse_term("o((x : (Num) -> A), SUC)")
  let t128 = @tactics.disch_then(fn(x127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s123 = @tactics.mp_tac(x122)
      fn(x124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s123(x124)
      }
    })(((x126 : @kernel.Thm) => @bool.spec(t125, x126))(x127))
  })
  let t121 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t120 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t116 = @term_syntax.parse_term("(x : (Num) -> A)(SUC(0))")
  let t119 = @tactics.first_x_assum(fn(x118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s114 = @tactics.mp_tac(x113)
      fn(x115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s114(x115)
      }
    })(((x117 : @kernel.Thm) => @bool.spec(t116, x117))(x118))
  })
  let t112 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : (Num) -> A)"))
  let t111 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : A)"))
  let t147 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(wfp_induct()), t111), @tactics.disch_tac), t112), @tactics.disch_tac), @tactics.disch_tac), t119), t120), @tactics.conj_tac), t121), t128), t129), t146])
  let t110 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t109 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t148 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@sets.subset_antisym())), t109), t110), @tactics.conj_tac), t147)
  wfp_dchain_c.set(@tactics.prove(@term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, WFP(`<<`) == {(a : A) | ∀ x : (Num) -> A, (∀ n : Num, `<<`(x(SUC(n)), x(n))) → !(x(0) == a)}"), t148))
}

///|
let wfp_dchain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WFP_DCHAIN")

///|
/// `WFP_DCHAIN`
pub fn wfp_dchain() -> @kernel.Thm {
  wfp_dchain_c.get()
}

///|
/// morder
fn step_37() -> Unit raise {
  morder_c.set(@pair.new_definition(@term_syntax.parse_term("(morder : ((_, _) -> Bool, Multiset[_], Multiset[_]) -> Bool)((op_lt_lt : (_, _) -> Bool), (N : Multiset[_]), (M : Multiset[_])) == (∃ M0 : Multiset[_], ∃ a : _, ∃ K : Multiset[_], M == munion(M0, msing(a)) && N == munion(M0, K) && (∀ b : _, mmember(b, K) → op_lt_lt(b, a)))")))
}

///|
let morder_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("morder")

///|
/// `morder`
pub fn morder() -> @kernel.Thm {
  morder_c.get()
}

///|
/// LEMMA_2_0
fn step_38() -> Unit raise {
  let t193 = @meson.meson_tac(@list.List([munion_ac(), munion_11()]))
  let t192 = @simp.asm_rewrite_tac(@list.List([munion_ac()]))
  let t191 = @tactics.undisch_tac(@term_syntax.parse_term("munion((M0 : Multiset[A]), msing((a : A))) == munion((M1 : Multiset[A]), msing((b : A)))"))
  let t188 = @term_syntax.parse_term("(K : Multiset[A])")
  let t189 = @term_syntax.parse_term("(b : A)")
  let t190 = @tactics.map_every(fn(x185 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s186 = @tactics.exists_tac(x185)
    fn(x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s186(x187)
    }
  }, @list.List([@term_syntax.parse_term("(M2 : Multiset[A])"), t189, t188]))
  let t184 = @simp.rewrite_tac(@list.List([morder()]))
  let t183 = @simp.asm_rewrite_tac(@list.List([munion_ac()]))
  let t182 = @tactics.exists_tac(@term_syntax.parse_term("munion((M2 : Multiset[A]), (K : Multiset[A]))"))
  let t180 = @simp.asm_rewrite_tac(@list.List([]))
  let t176 = @term_syntax.parse_term("(a : A)")
  let t179 = @tactics.disch_then(fn(x178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s174 = @tactics.mp_tac(x173)
      fn(x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s174(x175)
      }
    })(((x177 : @kernel.Thm) => @bool.spec(t176, x177))(x178))
  })
  let t172 = @simp.asm_rewrite_tac(@list.List([mextension(), munion_v1(), msing_v1(), mmember()]))
  let t171 = @tactics.undisch_tac(@term_syntax.parse_term("munion((M0 : Multiset[A]), msing((a : A))) == munion((M1 : Multiset[A]), msing((b : A)))"))
  let t170 = @tactics.map_every(@tactics.match_mp_tac, @list.List([mmember_mdiff(), munion_inunion()]))
  let t181 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("mdiff((M1 : Multiset[A]), msing((a : A)))")), t170), t171), t172), t179), t180), @int.arith_tac), @tactics.all_tac])
  let t169 = @tactics.subgoal_then(@term_syntax.parse_term("∃ M2 : Multiset[A], (M1 : Multiset[A]) == munion(M2, msing((a : A)))"), @tactics.strip_assume_tac)
  let t167 = @meson.asm_meson_tac(@list.List([munion_11()]))
  let t166 = @tactics.exists_tac(@term_syntax.parse_term("(K : Multiset[A])"))
  let t168 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj2_tac, @tactics.undisch_then(@term_syntax.parse_term("(b : A) == (a : A)"), fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s164 = @tactics.subst_all_tac(x163)
    fn(x165 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s164(x165)
    }
  })), t166), t167), @tactics.disj1_tac])
  let t162 = @class.asm_cases_tac(@term_syntax.parse_term("(b : A) == (a : A)"))
  let t159 = @term_syntax.parse_term("(K : Multiset[A])")
  let t160 = @term_syntax.parse_term("(b : A)")
  let t161 = @tactics.disch_then(@tactics.every_tcl(@lib.map(fn(x152 : @kernel.Term) -> (((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise) raise {
    let s153 = @tactics.x_choose_then(x152)
    fn(x154 : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) -> ((@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
      let s155 = s153(x154)
      fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s157 = s155(x156)
        fn(x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s157(x158)
        }
      }
    }
  }, @list.List([@term_syntax.parse_term("(M1 : Multiset[A])"), t160, t159])))(@tactics.strip_assume_tac))
  let t194 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x149 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s150 = @equal.land_conv(x149)
    fn(x151 : @kernel.Term) -> @kernel.Thm raise {
      s150(x151)
    }
  }, @list.List([morder()])), t161), t162), t168), t169), t181), t182), t183), t184), t190), t191), t192), t193)
  lemma_2_0_c.set(@tactics.prove(@term_syntax.parse_term("morder((op_lt_lt : (A, A) -> Bool), (N : Multiset[A]), munion((M0 : Multiset[A]), msing((a : A)))) → (∃ M : Multiset[A], morder(op_lt_lt, M, M0) && N == munion(M, msing(a))) || (∃ K : Multiset[A], N == munion(M0, K) && (∀ b : A, mmember(b, K) → op_lt_lt(b, a)))"), t194))
}

///|
let lemma_2_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_2_0")

///|
/// `LEMMA_2_0`
pub fn lemma_2_0() -> @kernel.Thm {
  lemma_2_0_c.get()
}

///|
/// LEMMA_2_1
fn step_39() -> Unit raise {
  let t212 = @meson.asm_meson_tac(@list.List([@sets.in_(), munion_empty()]))
  let t211 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([munion_assoc(), mmember_munion(), mmember_msing()])))
  let t210 = @tactics.repeat_tac(@tactics.strip_tac)
  let t209 = @tactics.match_mp_tac(multiset_induct())
  let t208 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t206 = @term_syntax.parse_term("(N : Multiset[A])")
  let t207 = @tactics.spec_tac(@term_syntax.parse_term("(N : Multiset[A])"), t206)
  let t204 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t205 = @list.List([@meson.asm_meson_tac(@list.List([@sets.in_()])), t204])
  let t200 = @drule.match_mp(lemma_2_0())
  let t201 = @tactics.disj_cases_then(fn(x197 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s198 = @tactics.mp_tac(x197)
    fn(x199 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s198(x199)
    }
  })
  let t203 = @tactics.disch_then(fn(x202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t201(t200(x202))
  })
  let t196 = @tactics.x_gen_tac(@term_syntax.parse_term("(N : Multiset[A])"))
  let t195 = @tactics.match_mp_tac(wfp_rules())
  let t213 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.rewrite_tac(@list.List([@sets.in_()]))), t195), t196), t203), t205), t207), t208), t209), t210), t211), t212)
  lemma_2_1_c.set(@tactics.prove(@term_syntax.parse_term("(∀ M : Multiset[A], ∀ b : A, (op_lt_lt : (A, A) -> Bool)(b, (a : A)) && IN(M, WFP(morder(op_lt_lt))) → IN(munion(M, msing(b)), WFP(morder(op_lt_lt)))) && IN((M0 : Multiset[A]), WFP(morder(op_lt_lt))) && (∀ M : Multiset[A], morder(op_lt_lt, M, M0) → IN(munion(M, msing(a)), WFP(morder(op_lt_lt)))) → IN(munion(M0, msing(a)), WFP(morder(op_lt_lt)))"), t213))
}

///|
let lemma_2_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_2_1")

///|
/// `LEMMA_2_1`
pub fn lemma_2_1() -> @kernel.Thm {
  lemma_2_1_c.get()
}

///|
/// LEMMA_2_2
fn step_40() -> Unit raise {
  let t216 = @simp.asm_rewrite_tac(@list.List([]))
  let t215 = @tactics.match_mp_tac(lemma_2_1())
  let t214 = @tactics.repeat_tac(@tactics.strip_tac)
  let t217 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.match_mp_tac(wfp_part_induct())), t214), t215), t216)
  lemma_2_2_c.set(@tactics.prove(@term_syntax.parse_term("(∀ M : Multiset[_], ∀ b : _, (op_lt_lt : (_, _) -> Bool)(b, (a : _)) && IN(M, WFP(morder(op_lt_lt))) → IN(munion(M, msing(b)), WFP(morder(op_lt_lt)))) → (∀ M : Multiset[_], IN(M, WFP(morder(op_lt_lt))) → IN(munion(M, msing(a)), WFP(morder(op_lt_lt))))"), t217))
}

///|
let lemma_2_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_2_2")

///|
/// `LEMMA_2_2`
pub fn lemma_2_2() -> @kernel.Thm {
  lemma_2_2_c.get()
}

///|
/// LEMMA_2_3
fn step_41() -> Unit raise {
  let t219 = @meson.meson_tac(@list.List([lemma_2_2()]))
  let t218 = @tactics.disch_then(@tactics.match_mp_tac)
  let t220 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@wf.wf_ind()])), t218), t219)
  lemma_2_3_c.set(@tactics.prove(@term_syntax.parse_term("WF((op_lt_lt : (_, _) -> Bool)) → (∀ a : _, ∀ M : Multiset[_], IN(M, WFP(morder(op_lt_lt))) → IN(munion(M, msing(a)), WFP(morder(op_lt_lt))))"), t220))
}

///|
let lemma_2_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_2_3")

///|
/// `LEMMA_2_3`
pub fn lemma_2_3() -> @kernel.Thm {
  lemma_2_3_c.get()
}

///|
/// LEMMA_2_4
fn step_42() -> Unit raise {
  let t223 = @simp.asm_simp_tac(@list.List([lemma_2_3()]))
  let t222 = @simp.rewrite_tac(@list.List([morder(), munion_mempty()]))
  let t221 = @tactics.match_mp_tac(wfp_rules())
  let t224 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_()])), t221), t222), t223])
  let t225 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.match_mp_tac(multiset_induct())), @tactics.conj_tac), t224)
  lemma_2_4_c.set(@tactics.prove(@term_syntax.parse_term("WF((op_lt_lt : (_, _) -> Bool)) → (∀ M : Multiset[_], IN(M, WFP(morder(op_lt_lt))))"), t225))
}

///|
let lemma_2_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEMMA_2_4")

///|
/// `LEMMA_2_4`
pub fn lemma_2_4() -> @kernel.Thm {
  lemma_2_4_c.get()
}

///|
/// MORDER_WF
fn step_43() -> Unit raise {
  let t226 = @simp.simp_tac(@list.List([wfp_wf(), @sets.extension(), @sets.in_univ(), lemma_2_4()]))
  morder_wf_c.set(@tactics.prove(@term_syntax.parse_term("WF((op_lt_lt : (_, _) -> Bool)) → WF(morder(op_lt_lt))"), t226))
}

///|
let morder_wf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MORDER_WF")

///|
/// `MORDER_WF`
pub fn morder_wf() -> @kernel.Thm {
  morder_wf_c.get()
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
}
