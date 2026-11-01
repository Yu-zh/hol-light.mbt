// Translated from upstream Logic/unif.ml; edit this file directly.

///|
/// LEFT_AND_EX_THM
fn step_1() -> Unit raise {
  let t3 = @tactics.conv_tac(@class.taut)
  let t2 = @simp.asm_rewrite_tac(@list.List([@lists.ex()]))
  let t1 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t4 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t1), @lists.list_induct_tac), t2), t3)
  left_and_ex_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (_) -> Bool, ∀ Q : Bool, ∀ l : List[_], (EX(P, l) && Q) == EX((x : _) => P(x) && Q, l)"), t4))
}

///|
let left_and_ex_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LEFT_AND_EX_THM")

///|
/// `LEFT_AND_EX_THM`
pub fn left_and_ex_thm() -> @kernel.Thm {
  left_and_ex_thm_c.get()
}

///|
/// EX_ADHOC
fn step_2() -> Unit raise {
  let t6 = @meson.asm_meson_tac(@list.List([]))
  let t5 = @simp.rewrite_tac(@list.List([@lists.ex()]))
  let t7 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), @tactics.disch_tac), @lists.list_induct_tac), t5), t6)
  ex_adhoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : List[_], (∀ x : _, !(P : (_) -> Bool)(x) → (Q : (_) -> Bool)(x) == (R : (_) -> Bool)(x)) → !EX(P, l) → EX(Q, l) == EX(R, l)"), t7))
}

///|
let ex_adhoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EX_ADHOC")

///|
/// `EX_ADHOC`
pub fn ex_adhoc() -> @kernel.Thm {
  ex_adhoc_c.get()
}

///|
/// ALL_ADHOC
fn step_3() -> Unit raise {
  let t8 = @meson.asm_meson_tac(@list.List([]))
  let t9 = @tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([@lists.all(), @lists.ex()]))), t8)
  all_adhoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : List[_], ALL((x : _) => (f : (_) -> Bool)(x) == (g : (_) -> Bool)(x), l) → EX(f, l) == EX(g, l)"), t9))
}

///|
let all_adhoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_ADHOC")

///|
/// `ALL_ADHOC`
pub fn all_adhoc() -> @kernel.Thm {
  all_adhoc_c.get()
}

///|
/// WF_FINITE_LEMMA
fn step_4() -> Unit raise {
  let t42 = @meson.asm_meson_tac(@list.List([@rstc.tc_inc(), @rstc.tc_cases_r()]))
  let t43 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@rstc.rtc(), @rstc.rc_cases()])), t42)
  let t41 = @meson.asm_meson_tac(@list.List([@rstc.rtc_trans(), @rstc.rtc_inc()]))
  let t44 = @list.List([@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([@arith.add_clauses(), @rstc.rtc_refl()]))), t41), t43])
  let t40 = @tactics.subgoal_then(@term_syntax.parse_term("∀ d : Num, RTC((op_lt_lt : (A, A) -> Bool), (u : (Num) -> A)((n : Num) + d), u(n))"), fn(x37 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s38 = @tactics.mp_tac(x37)
    fn(x39 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s38(x39)
    }
  })
  let t36 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t35 = @tactics.disch_then(fn(x34 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t33 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t32 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t31 = @simp.simp_tac(@list.List([@arith.lt_exists(), @theorems.left_imp_exists_thm()]))
  let t30 = @tactics.subgoal_then(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, m < n → TC((op_lt_lt : (A, A) -> Bool), (u : (Num) -> A)(n), u(m))"), fn(x28 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x28
    @meson.asm_meson_tac(@list.List([th, @arith.lt_cases()]))
  })
  let t27 = @simp.rewrite_tac(@list.List([@sets.num_infinite(), @equal.gsym(@sets.infinite())]))
  let t26 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_univ()])), @tactics.all_tac])
  let t25 = @tactics.subgoal_then(@term_syntax.parse_term("{(n : Num) | IN((u : (Num) -> A)(n), (s : (A) -> Bool))} == UNIV"), fn(x22 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s23 = @tactics.subst1_tac(x22)
    fn(x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s23(x24)
    }
  })
  let t21 = @simp.rewrite_tac(@list.List([@kernel.assume_rule(@term_syntax.parse_term("FINITE((s : (A) -> Bool))")), @class.not_imp()]))
  let t19 = @term_syntax.parse_term("(s : (A) -> Bool)")
  let t20 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(u : (Num) -> A)"), t19]), @sets.finite_image_inj()))
  let t18 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t17 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, IN((u : (Num) -> A)(n), (s : (A) -> Bool))"), fn(x14 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s15 = @tactics.assume_tac(x14)
    fn(x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s15(x16)
    }
  })
  let t11 = @term_syntax.parse_term("(u : (Num) -> A)")
  let t13 = @tactics.disch_then((x12 : @kernel.Thm) => @tactics.x_choose_tac(t11, x12))
  let t10 = @simp.rewrite_tac(@list.List([@wf.wf_dchain()]))
  let t45 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t10), t13), t17), t18), t20), t21), t25), t26), t27), t30), t31), t32), @tactics.gen_tac), t33), t35), t36), t40), t44)
  wf_finite_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ `<<` : (A, A) -> Bool, ∀ s : (A) -> Bool, FINITE(s) && (∀ x : A, !TC(`<<`, x, x)) && (∀ x : A, ∀ y : A, `<<`(x, y) → IN(y, s)) → WF(`<<`)"), t45))
}

///|
let wf_finite_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_FINITE_LEMMA")

///|
/// `WF_FINITE_LEMMA`
pub fn wf_finite_lemma() -> @kernel.Thm {
  wf_finite_lemma_c.get()
}

///|
/// TC_REV
fn step_5() -> Unit raise {
  let t49 = @meson.meson_tac(@list.List([@rstc.tc_trans()]))
  let t48 = @simp.simp_tac(@list.List([@rstc.tc_inc()]))
  let t47 = @tactics.match_mp_tac(@rstc.tc_induct())
  let t46 = @list.List([@tactics.all_tac, @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))])
  let t50 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) == (b : Bool)) == ((a → b) && (b → a))")), @theorems.forall_and_thm()])), @tactics.conj_tac), t46), t47), t48), t49)
  tc_rev_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : A, ∀ y : A, TC((u : A) => (v : A) => (R : (A, A) -> Bool)(v, u), x, y) == TC(R, y, x)"), t50))
}

///|
let tc_rev_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_REV")

///|
/// `TC_REV`
pub fn tc_rev() -> @kernel.Thm {
  tc_rev_c.get()
}

///|
/// WF_DISJ
fn step_6() -> Unit raise {
  let t79 = @meson.asm_meson_tac(@list.List([@rstc.tc_inc(), @rstc.tc_trans()]))
  let t78 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@rstc.rtc(), @rstc.rc_cases()])))
  let t77 = @simp.rewrite_tac(@list.List([]))
  let t73 = @term_syntax.parse_term("(y : A) => (P : (A) -> Bool)(y) && TC((R : (A, A) -> Bool), y, (a : A))")
  let t76 = @tactics.disch_then(fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s71 = @tactics.mp_tac(x70)
      fn(x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s71(x72)
      }
    })(((x74 : @kernel.Thm) => @bool.spec(t73, x74))(x75))
  })
  let t69 = @simp.rewrite_tac(@list.List([@wf.wf()]))
  let t66 = @drule.match_mp(@bool.eq_imp_rule(@bool.spec_all(@rstc.wf_tc())).1)
  let t68 = @tactics.first_assum(fn(x67 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x63 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s64 = @tactics.mp_tac(x63)
      fn(x65 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s64(x65)
      }
    })(t66(x67))
  })
  let t62 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(@tactics.strip_assume_tac))
  let t61 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → (c : Bool)) → ((a : Bool) → b) → a → c")))
  let t60 = @tactics.x_gen_tac(@term_syntax.parse_term("(P : (A) -> Bool)"))
  let t59 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t58 = @simp.rewrite_tac(@list.List([@wf.wf()]))
  let t57 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x51 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s52 = @tactics.assume_tac(x51)
    fn(x53 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s52(x53)
    }
  }, fn(x54 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s55 = @tactics.mp_tac(x54)
    fn(x56 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s55(x56)
    }
  }))
  let t80 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t57), t58), t59), t60), t61), t62), t68), t69), t76), t77), t78), t79)
  wf_disj_c.set(@tactics.prove(@term_syntax.parse_term("WF((R : (A, A) -> Bool)) && WF((x : A) => (y : A) => ∃ z : A, (S : (A, A) -> Bool)(x, z) && RTC(R, z, y)) → WF((x : A) => (y : A) => R(x, y) || S(x, y))"), t80))
}

///|
let wf_disj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_DISJ")

///|
/// `WF_DISJ`
pub fn wf_disj() -> @kernel.Thm {
  wf_disj_c.get()
}

///|
/// WF_ALTERNATION
fn step_7() -> Unit raise {
  let t183 = @meson.asm_meson_tac(@list.List([]))
  let t182 = @simp.asm_rewrite_tac(@list.List([]))
  let t179 = @term_syntax.parse_term("(a : A)")
  let t180 = @tactics.map_every(fn(x176 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s177 = @tactics.exists_tac(x176)
    fn(x178 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s177(x178)
    }
  }, @list.List([@term_syntax.parse_term("(b : A)"), t179]))
  let t175 = @term_syntax.parse_term("(b : A)")
  let t181 = @list.List([@tactics.map_every(fn(x172 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s173 = @tactics.exists_tac(x172)
    fn(x174 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s173(x174)
    }
  }, @list.List([@term_syntax.parse_term("(a : A)"), t175])), t180])
  let t171 = @class.asm_cases_tac(@term_syntax.parse_term("(P : (A, A) -> Bool)((b : A), (a : A)) && (s : ((A, A)) -> Bool)((a, b))"))
  let t170 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : A)"))(@tactics.strip_assume_tac))
  let t169 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t168 = @simp.rewrite_tac(@list.List([]))
  let t164 = @term_syntax.parse_term("(y : A) => (s : ((A, A)) -> Bool)((y, (a : A)))")
  let t167 = @tactics.disch_then(fn(x166 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x161 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s162 = @tactics.mp_tac(x161)
      fn(x163 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s162(x163)
      }
    })(((x165 : @kernel.Thm) => @bool.spec(t164, x165))(x166))
  })
  let t159 = @simp.gen_rewrite_rule(fn(x158 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x158
  }, @list.List([@wf.wf()]))
  let t184 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x160 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x155 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s156 = @tactics.mp_tac(x155)
      fn(x157 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s156(x157)
      }
    })(t159(x160))
  }), t167), t168), @tactics.ants_tac), t169), t170), t171), t181), t182), t183)
  let t154 = @meson.asm_meson_tac(@list.List([]))
  let t152 = @term_syntax.parse_term("(a : A)")
  let t153 = @tactics.map_every(fn(x149 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s150 = @tactics.exists_tac(x149)
    fn(x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s150(x151)
    }
  }, @list.List([@term_syntax.parse_term("(b : A)"), t152]))
  let t148 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : A)"))(@tactics.strip_assume_tac))
  let t147 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t146 = @simp.rewrite_tac(@list.List([]))
  let t142 = @term_syntax.parse_term("(y : A) => (s : ((A, A)) -> Bool)((y, (a : A)))")
  let t145 = @tactics.disch_then(fn(x144 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s140 = @tactics.mp_tac(x139)
      fn(x141 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s140(x141)
      }
    })(((x143 : @kernel.Thm) => @bool.spec(t142, x143))(x144))
  })
  let t136 = @simp.gen_rewrite_rule(fn(x135 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x135
  }, @list.List([@wf.wf()]))
  let t138 = @tactics.first_assum(fn(x137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s133 = @tactics.mp_tac(x132)
      fn(x134 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s133(x134)
      }
    })(t136(x137))
  })
  let t130 = @meson.asm_meson_tac(@list.List([]))
  let t129 = @simp.asm_rewrite_tac(@list.List([]))
  let t128 = @term_syntax.parse_term("(a : A)")
  let t131 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x125 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s126 = @tactics.exists_tac(x125)
    fn(x127 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s126(x127)
    }
  }, @list.List([@term_syntax.parse_term("(b0 : A)"), t128])), t129), t130)])
  let t124 = @class.asm_cases_tac(@term_syntax.parse_term("∃ y : A, (R : (A, A) -> Bool)(y, (b0 : A)) && (s : ((A, A)) -> Bool)((y, (a : A)))"))
  let t122 = @meson.asm_meson_tac(@list.List([]))
  let t121 = @simp.asm_rewrite_tac(@list.List([]))
  let t120 = @term_syntax.parse_term("(b0 : A)")
  let t123 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x117 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s118 = @tactics.exists_tac(x117)
    fn(x119 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s118(x119)
    }
  }, @list.List([@term_syntax.parse_term("(a : A)"), t120])), t121), t122)])
  let t116 = @class.asm_cases_tac(@term_syntax.parse_term("(s : ((A, A)) -> Bool)(((b0 : A), (a : A)))"))
  let t115 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t185 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(P : (A, A) -> Bool)((a : A), (b0 : A))")), t115), t116), t123), t124), t131), t138), t145), t146), @tactics.ants_tac), t147), t148), t153), t154), t184])
  let t114 = @tactics.first_x_assum(@tactics.disj_cases_tac)
  let t113 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t112 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t111 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b0 : A)"))(fn(x108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s109 = @tactics.assume_tac(x108)
    fn(x110 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s109(x110)
    }
  }))
  let t106 = @tactics.conjuncts_then2(fn(x100 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s101 = @tactics.mp_tac(x100)
    fn(x102 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s101(x102)
    }
  }, fn(x103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s104 = @tactics.assume_tac(x103)
    fn(x105 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s104(x105)
    }
  })
  let t107 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(t106))
  let t99 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t98 = @simp.asm_rewrite_tac(@list.List([]))
  let t94 = @term_syntax.parse_term("(x : A) => ∃ y : A, (s : ((A, A)) -> Bool)((x, y)) || s((y, x))")
  let t97 = @tactics.disch_then(fn(x96 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x91 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s92 = @tactics.mp_tac(x91)
      fn(x93 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s92(x93)
      }
    })(((x95 : @kernel.Thm) => @bool.spec(t94, x95))(x96))
  })
  let t88 = @simp.gen_rewrite_rule(fn(x87 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x87
  }, @list.List([@wf.wf()]))
  let t90 = @tactics.first_assum(fn(x89 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x84 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s85 = @tactics.mp_tac(x84)
      fn(x86 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s85(x86)
      }
    })(t88(x89))
  })
  let t83 = @simp.rewrite_tac(@list.List([@pair.exists_pair_thm()]))
  let t82 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : ((A, A)) -> Bool)"))
  let t81 = @simp.rewrite_tac(@list.List([@wf.wf()]))
  let t186 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t81), t82), t83), @tactics.disch_tac), t90), t97), t98), @tactics.ants_tac), t99), t107), t111), t112), t113), t114), t185)
  wf_alternation_c.set(@tactics.prove(@term_syntax.parse_term("WF((x : A) => (y : A) => (R : (A, A) -> Bool)(x, y) || (S : (A, A) -> Bool)(x, y)) && (∀ x : A, ∀ y : A, ∀ z : A, !((P : (A, A) -> Bool)(x, y) && P(y, z))) → WF(GABS((f : ((A, A), (A, A)) -> Bool) => ∀ x1 : A, ∀ y1 : A, GEQ(f((x1, y1)), GABS((f : ((A, A)) -> Bool) => ∀ x2 : A, ∀ y2 : A, GEQ(f((x2, y2)), S(x1, x2) && S(y1, y2) || R(x1, x2) && y1 == y2 || P(x2, y2) && x1 == y2 && x2 == y1)))))"), t186))
}

///|
let wf_alternation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_ALTERNATION")

///|
/// `WF_ALTERNATION`
pub fn wf_alternation() -> @kernel.Thm {
  wf_alternation_c.get()
}

///|
/// MULTISET_FILTEREQ
fn step_8() -> Unit raise {
  let t205 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @lists.mem()]))
  let t204 = @simp.rewrite_tac(@list.List([@lists.filter(), @lists.length(), @lists.mem()]))
  let t202 = @term_syntax.parse_term("(l : List[A])")
  let t203 = @tactics.spec_tac(@term_syntax.parse_term("(l : List[A])"), t202)
  let t206 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm()])), t203), @lists.list_induct_tac), t204), @tactics.gen_tac), @class.cond_cases_tac), t205)
  let t199 = @simp.rewrite_tac(@list.List([@theorems.disj_aci()]))
  let t198 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_insert(), @lists.mem()]))
  let t200 = @tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("{(a : A) | MEM(a, CONS((h : A), (t : List[A])))} == INSERT(h, {(a : A) | MEM(a, t)})"), fn(x196 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x196
    @simp.asm_simp_tac(@list.List([th_1, @sets.finite_rules()]))
  }), t198), t199)
  let t195 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @lists.mem(), @sets.not_in_empty()]))
  let t201 = @list.List([@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("{(a : A) | MEM(a, NIL)} == {}"), fn(x193 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x193
    @simp.rewrite_tac(@list.List([th, @sets.finite_rules()]))
  }), t195), t200])
  let t192 = @term_syntax.parse_term("(l : List[A])")
  let t207 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(l : List[A])"), t192), @lists.list_induct_tac), t201), t206])
  let t191 = @tactics.exists_tac(@term_syntax.parse_term("{(a : A) | MEM(a, (l : List[A]))}"))
  let t190 = @tactics.match_mp_tac(@sets.finite_subset())
  let t189 = @simp.simp_tac(@list.List([]))
  let t188 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → (c : Bool)) && (a : Bool) → a == b → c")))
  let t187 = @bool.conjunct2(@multiwf.multiset_tybij())
  let t208 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(x : A) => LENGTH(FILTER(op_eq(x), (l : List[A])))"), t187)), t188), t189), t190), t191), @tactics.conj_tac), t207)
  multiset_filtereq_c.set(@tactics.prove(@term_syntax.parse_term("multiplicity(multiset((x : A) => LENGTH(FILTER(op_eq(x), (l : List[A])))), (a : A)) == LENGTH(FILTER(op_eq(a), l))"), t208))
}

///|
let multiset_filtereq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MULTISET_FILTEREQ")

///|
/// `MULTISET_FILTEREQ`
pub fn multiset_filtereq() -> @kernel.Thm {
  multiset_filtereq_c.get()
}

///|
/// WF_MULTIZIP
fn step_9() -> Unit raise {
  let t209 = @parser.parse_type("A")
  let lemma = @kernel.inst_type(@list.List([(@parser.parse_type("(A)list"), t209)]), @wf.wf_measure_gen())
  let t246 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @lists.mem()]))
  let t245 = @simp.rewrite_tac(@list.List([@lists.filter(), @lists.length(), @lists.mem()]))
  let t244 = @tactics.subgoal_then(@term_syntax.parse_term("∀ a : A, ∀ l : List[A], !(LENGTH(FILTER(op_eq(a), l)) == 0) → MEM(a, l)"), fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x242
    @meson.asm_meson_tac(@list.List([th]))
  })
  let t240 = @simp.rewrite_tac(@list.List([@lists.length(), @arith.add1(), @arith.add_ac(), @arith.add_clauses()]))
  let t241 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @class.cond_cases_tac), t240), @tactics.all_tac])
  let t239 = @simp.rewrite_tac(@list.List([@lists.filter_append(), @lists.length_append(), @lists.length(), @lists.filter(), @arith.add_ac()]))
  let t238 = @simp.rewrite_tac(@list.List([@multiwf.mmember(), @multiwf.mextension(), multiset_filtereq(), @multiwf.munion_v1(), @multiwf.msing_v1()]))
  let t237 = @tactics.exists_tac(@term_syntax.parse_term("multiset((x : A) => LENGTH(FILTER(op_eq(x), (m : List[A]))))"))
  let t236 = @tactics.exists_tac(@term_syntax.parse_term("(a : A)"))
  let t235 = @tactics.exists_tac(@term_syntax.parse_term("multiset((x : A) => LENGTH(FILTER(op_eq(x), (l : List[A]))))"))
  let t234 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x228 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s229 = @tactics.subst1_tac(x228)
    fn(x230 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s229(x230)
    }
  }, fn(x231 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s232 = @tactics.mp_tac(x231)
    fn(x233 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s232(x233)
    }
  })))
  let t225 = @term_syntax.parse_term("(m : List[A])")
  let t226 = @term_syntax.parse_term("(l : List[A])")
  let t227 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : A)"), t226, t225]))
  let t224 = @simp.rewrite_tac(@list.List([@multiwf.morder(), @theorems.left_imp_exists_thm()]))
  let t223 = @tactics.repeat_tac(@tactics.gen_tac)
  let t222 = @tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(@wf.wf_subset()))
  let t221 = @simp.rewrite_tac(@list.List([]))
  let t218 = @drule.match_mp(@multiwf.morder_wf())
  let t216 = @drule.match_mp(lemma)
  let t213 = @term_syntax.parse_term("(l : List[A]) => multiset((x : A) => LENGTH(FILTER(op_eq(x), l)))")
  let t220 = @tactics.first_assum(fn(x219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x217 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s211 = @tactics.mp_tac(x210)
          fn(x212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s211(x212)
          }
        })(((x214 : @kernel.Thm) => @bool.spec(t213, x214))(x215))
      })(t216(x217))
    })(t218(x219))
  })
  let t247 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t220), t221), t222), t223), t224), t227), t234), @tactics.disch_tac), t235), t236), t237), t238), t239), @tactics.conj_tac), t241), t244), @tactics.gen_tac), @lists.list_induct_tac), t245), @class.cond_cases_tac), t246)
  wf_multizip_c.set(@tactics.prove(@term_syntax.parse_term("WF((R : (A, A) -> Bool)) → WF((l1 : List[A]) => (l2 : List[A]) => ∃ h : A, ∃ t : List[A], ∃ l0 : List[A], l2 == CONS(h, t) && l1 == APPEND(l0, t) && (∀ k : A, MEM(k, l0) → R(k, h)))"), t247))
}

///|
let wf_multizip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_MULTIZIP")

///|
/// `WF_MULTIZIP`
pub fn wf_multizip() -> @kernel.Thm {
  wf_multizip_c.get()
}

///|
/// WF_MEASURE_OR_NONINC
fn step_10() -> Unit raise {
  let t290 = @simp.asm_rewrite_tac(@list.List([@arith.le_trans()]))
  let t289 = @tactics.match_mp_tac(@rstc.tc_induct())
  let t286 = @term_syntax.parse_term("(b : A)")
  let t287 = (@term_syntax.parse_term("(b : A)"), t286)
  let t285 = @term_syntax.parse_term("(a : A)")
  let t288 = @tactics.map_every(fn(x282 : (@kernel.Term, @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s283 = @tactics.spec_tac(x282.0, x282.1)
    fn(x284 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s283(x284)
    }
  }, @list.List([(@term_syntax.parse_term("(a : A)"), t285), t287]))
  let t281 = @tactics.undisch_tac(@term_syntax.parse_term("TC((R : (A, A) -> Bool), (b : A), (a : A))"))
  let t280 = @tactics.subgoal_then(@term_syntax.parse_term("(m : (A) -> Num)((b : A)) <= m((a : A))"), fn(x278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x278
    @meson.asm_meson_tac(@list.List([th, @rstc.tc_inc(), @rstc.tc_trans(), @arith.lte_trans()]))
  })
  let t277 = @simp.asm_rewrite_tac(@list.List([]))
  let t276 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : A)"))
  let t275 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t274 = @list.List([@meson.asm_meson_tac(@list.List([@rstc.tc_inc()])), @tactics.all_tac])
  let t273 = @simp.asm_rewrite_tac(@list.List([]))
  let t270 = @simp.gen_rewrite_rule(fn(x269 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x269
  }, @list.List([@wf.wf()]))
  let t266 = @term_syntax.parse_term("(y : A) => TC((R : (A, A) -> Bool), y, (a : A)) && (P : (A) -> Bool)(y)")
  let t272 = @tactics.first_assum(fn(x271 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x268 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x263 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s264 = @tactics.mp_tac(x263)
        fn(x265 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s264(x265)
        }
      })(((x267 : @kernel.Thm) => @bool.spec(t266, x267))(x268))
    })(t270(x271))
  })
  let t262 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t261 = @class.asm_cases_tac(@term_syntax.parse_term("∃ y : A, (R : (A, A) -> Bool)(y, (a : A)) && (P : (A) -> Bool)(y)"))
  let t260 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(a : A)"))(@tactics.strip_assume_tac))
  let t259 = @simp.asm_rewrite_tac(@list.List([]))
  let t255 = @term_syntax.parse_term("(P : (A) -> Bool)")
  let t258 = @tactics.disch_then(fn(x257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x252 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s253 = @tactics.mp_tac(x252)
      fn(x254 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s253(x254)
      }
    })(((x256 : @kernel.Thm) => @bool.spec(t255, x256))(x257))
  })
  let t251 = @simp.rewrite_tac(@list.List([@wf.wf(), @wf.measure()]))
  let t250 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(m : (A) -> Num)"), @wf.wf_measure()))
  let t249 = @tactics.x_gen_tac(@term_syntax.parse_term("(P : (A) -> Bool)"))
  let t248 = @simp.rewrite_tac(@list.List([@wf.wf()]))
  let t291 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t248), t249), @tactics.disch_tac), t250), t251), t258), t259), t260), t261), t262), t272), t273), @tactics.ants_tac), t274), t275), t276), @tactics.strip_tac), t277), t280), t281), t288), t289), t290)
  wf_measure_or_noninc_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (A, A) -> Bool, ∀ m : (A) -> Num, WF(R) && (∀ x : A, ∀ y : A, R(x, y) → m(x) <= m(y)) → WF((x : A) => (y : A) => MEASURE(m, x, y) || R(x, y))"), t291))
}

///|
let wf_measure_or_noninc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_MEASURE_OR_NONINC")

///|
/// `WF_MEASURE_OR_NONINC`
pub fn wf_measure_or_noninc() -> @kernel.Thm {
  wf_measure_or_noninc_c.get()
}

///|
/// WF_PROJ_EQ
fn step_11() -> Unit raise {
  let t340 = @simp.simp_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t339 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t338 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(s : (Num) -> (A, B))(SUC((n : Num)))"), @pair.pair())))
  let t337 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(s : (Num) -> (A, B))((n : Num))"), @pair.pair())))
  let t333 = @term_syntax.parse_term("(n : Num)")
  let t336 = @tactics.first_x_assum(fn(x335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x330 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s331 = @tactics.mp_tac(x330)
      fn(x332 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s331(x332)
      }
    })(((x334 : @kernel.Thm) => @bool.spec(t333, x334))(x335))
  })
  let t328 = @simp.asm_rewrite_tac(@list.List([]))
  let t327 = @tactics.exists_tac(@term_syntax.parse_term("FST((s : (Num) -> (A, B))((n : Num)))"))
  let t326 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t325 = @simp.rewrite_tac(@list.List([]))
  let t324 = @term_syntax.parse_term("(n : Num)")
  let t329 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(n : Num)"), t324), @nums.induct_tac), t325), t326), t327), t328), @tactics.all_tac])
  let t323 = @tactics.subgoal_then(@term_syntax.parse_term("FST((s : (Num) -> (A, B))(0)) == FST(s((n : Num)))"), fn(x320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s321 = @tactics.subst1_tac(x320)
    fn(x322 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s321(x322)
    }
  })
  let t319 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t318 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t317 = @tactics.exists_tac(@term_syntax.parse_term("o(SND, (s : (Num) -> (A, B)))"))
  let t316 = @simp.rewrite_tac(@list.List([@wf.wf_dchain()]))
  let t315 = @tactics.disch_then(fn(x313 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x313
    @simp.rewrite_tac(@list.List([@bool.conjunct1(th)]))
  })
  let t312 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t311 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(s : (Num) -> (A, B))(SUC(0))"), @pair.pair())))
  let t310 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(s : (Num) -> (A, B))(0)"), @pair.pair())))
  let t306 = @term_syntax.parse_term("0")
  let t309 = @tactics.first_assum(fn(x308 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x303 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s304 = @tactics.mp_tac(x303)
      fn(x305 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s304(x305)
      }
    })(((x307 : @kernel.Thm) => @bool.spec(t306, x307))(x308))
  })
  let t299 = @term_syntax.parse_term("FST((s : (Num) -> (A, B))(0))")
  let t302 = @tactics.first_x_assum(fn(x301 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s297 = @tactics.mp_tac(x296)
      fn(x298 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s297(x298)
      }
    })(((x300 : @kernel.Thm) => @bool.spec(t299, x300))(x301))
  })
  let t293 = @term_syntax.parse_term("(s : (Num) -> (A, B))")
  let t295 = @tactics.disch_then((x294 : @kernel.Thm) => @tactics.x_choose_tac(t293, x294))
  let t292 = @simp.rewrite_tac(@list.List([@wf.wf_dchain()]))
  let t341 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t292), t295), t302), t309), t310), t311), t312), t315), t316), t317), t318), t319), t323), t329), t336), t337), t338), t339), t340)
  wf_proj_eq_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : A, (P : (A) -> Bool)(x) → WF((R : (A, B, B) -> Bool)(x))) → WF(GABS((f : ((A, B), (A, B)) -> Bool) => ∀ x' : A, ∀ y' : B, GEQ(f((x', y')), GABS((f : ((A, B)) -> Bool) => ∀ x : A, ∀ y : B, GEQ(f((x, y)), P(x) && x' == x && R(x, y', y))))))"), t341))
}

///|
let wf_proj_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_PROJ_EQ")

///|
/// `WF_PROJ_EQ`
pub fn wf_proj_eq() -> @kernel.Thm {
  wf_proj_eq_c.get()
}

///|
/// OCC
fn step_12() -> Unit raise {
  occ_c.set(@pair.new_definition(@term_syntax.parse_term("(OCC : (List[(Num, Term)], Num, Num) -> Bool)((env : List[(Num, Term)]), (x : Num), (y : Num)) == (∃ t : Term, MEM((x, t), env) && IN(y, FVT(t)))")))
}

///|
let occ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OCC")

///|
/// `OCC`
pub fn occ() -> @kernel.Thm {
  occ_c.get()
}

///|
/// LOOPFREE
fn step_13() -> Unit raise {
  loopfree_c.set(@pair.new_definition(@term_syntax.parse_term("(LOOPFREE : (List[(Num, Term)]) -> Bool)((env : List[(Num, Term)])) == (∀ z : Num, !TC(OCC(env), z, z))")))
}

///|
let loopfree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOOPFREE")

///|
/// `LOOPFREE`
pub fn loopfree() -> @kernel.Thm {
  loopfree_c.get()
}

///|
/// LOOP_BREAK
fn step_14() -> Unit raise {
  let t380 = @meson.asm_meson_tac(@list.List([@rstc.rtc_cases_l(), occ()]))
  let t379 = @meson.asm_meson_tac(@list.List([]))
  let t381 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@rstc.rtc(), @rstc.rc_cases()])), t379), t380])
  let t378 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Term)"))(@tactics.strip_assume_tac))
  let t377 = @simp.rewrite_tac(@list.List([occ(), @lists.mem(), @pair.pair_eq()]))
  let t376 = @tactics.undisch_tac(@term_syntax.parse_term("OCC(CONS(((x : Num), (t : Term)), (env : List[(Num, Term)])), (v : Num), (z : Num))"))
  let t375 = @simp.asm_rewrite_tac(@list.List([]))
  let t374 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(y : Num)"))(@tactics.strip_assume_tac))
  let t373 = @simp.asm_rewrite_tac(@list.List([]))
  let t372 = @tactics.first_assum(fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x369 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x364 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s365 = @tactics.undisch_tac(x364)
        fn(x366 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s365(x366)
        }
      })(((x368 : @kernel.Term) => @lib.check(fn(x367 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x367)
      }, x368))(x369))
    })((fn(x370 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x370)
    })(x371))
  })
  let t362 = @meson.asm_meson_tac(@list.List([]))
  let t361 = @simp.rewrite_tac(@list.List([occ()]))
  let t360 = @simp.once_rewrite_tac(@list.List([@rstc.tc_cases_l()]))
  let t359 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) → !a → (b : Bool)")))
  let t358 = @tactics.undisch_tac(@term_syntax.parse_term("!TC(OCC((env : List[(Num, Term)])), (u : Num), (z : Num))"))
  let t356 = @meson.asm_meson_tac(@list.List([]))
  let t357 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@rstc.rtc(), @rstc.rc_cases()])), t356), @tactics.all_tac])
  let t355 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Term)"))(@tactics.strip_assume_tac))
  let t354 = @simp.rewrite_tac(@list.List([occ(), @lists.mem(), @pair.pair_eq()]))
  let t363 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("OCC(CONS(((x : Num), (t : Term)), (env : List[(Num, Term)])), (v : Num), (z : Num))")), t354), t355), t357), t358), t359), t360), @tactics.disj2_tac), t361), t362), @tactics.all_tac])
  let t353 = @class.asm_cases_tac(@term_syntax.parse_term("TC(OCC((env : List[(Num, Term)])), (u : Num), (v : Num))"))
  let t351 = @meson.asm_meson_tac(@list.List([]))
  let t350 = @simp.rewrite_tac(@list.List([occ()]))
  let t349 = @simp.once_rewrite_tac(@list.List([@rstc.tc_cases_l()]))
  let t348 = @tactics.undisch_tac(@term_syntax.parse_term("!TC(OCC((env : List[(Num, Term)])), (u : Num), (v : Num))"))
  let t347 = @list.List([@meson.asm_meson_tac(@list.List([@rstc.rtc_cases()])), @tactics.all_tac])
  let t346 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Term)"))(@tactics.strip_assume_tac))
  let t345 = @simp.rewrite_tac(@list.List([occ(), @lists.mem(), @pair.pair_eq()]))
  let t352 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("OCC(CONS(((x : Num), (t : Term)), (env : List[(Num, Term)])), (u : Num), (v : Num))")), t345), t346), t347), t348), t349), t350), t351), @tactics.all_tac])
  let t344 = @tactics.repeat_tac(@tactics.strip_tac)
  let t343 = @tactics.match_mp_tac(@rstc.tc_induct_l())
  let t342 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && !(b : Bool) → (c : Bool)) == (a → !b → c)"))]))
  let t382 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @tactics.gen_tac), t342), t343), t344), t352), t353), t363), t372), t373), t374), t375), t376), t377), t378), t381)
  loop_break_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ x : Num, ∀ t : Term, ∀ u : Num, ∀ v : Num, TC(OCC(CONS((x, t), env)), u, v) && !TC(OCC(env), u, v) → (∃ y : Num, RTC(OCC(env), u, x) && IN(y, FVT(t)) && RTC(OCC(env), y, v))"), t382))
}

///|
let loop_break_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOOP_BREAK")

///|
/// `LOOP_BREAK`
pub fn loop_break() -> @kernel.Thm {
  loop_break_c.get()
}

///|
/// LOOPFREE_PRESERVE
fn step_15() -> Unit raise {
  let t383 = @meson.meson_tac(@list.List([loopfree(), @rstc.rtc_cases(), loop_break()]))
  loopfree_preserve_c.set(@tactics.prove(@term_syntax.parse_term("LOOPFREE((env : List[(Num, Term)])) && !(∃ y : Num, IN(y, FVT((t : Term))) && RTC(OCC(env), y, (x : Num))) → LOOPFREE(CONS((x, t), env))"), t383))
}

///|
let loopfree_preserve_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOOPFREE_PRESERVE")

///|
/// `LOOPFREE_PRESERVE`
pub fn loopfree_preserve() -> @kernel.Thm {
  loopfree_preserve_c.get()
}

///|
/// LOOPFREE_PRESERVE_EQ
fn step_16() -> Unit raise {
  let t401 = @meson.meson_tac(@list.List([]))
  let t400 = @simp.simp_tac(@list.List([occ(), @lists.mem(), @pair.pair_eq()]))
  let t399 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.right_imp_forall_thm()]))(@rstc.rtc_mono()))
  let t402 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("RTC(OCC((env : List[(Num, Term)])), (y : Num), (x : Num))")), t399), t400), t401)
  let t398 = @simp.asm_rewrite_tac(@list.List([]))
  let t403 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(t : Term)")), t398), t402])
  let t397 = @simp.rewrite_tac(@list.List([occ(), @lists.mem(), @pair.pair_eq()]))
  let t396 = @tactics.exists_tac(@term_syntax.parse_term("(y : Num)"))
  let t395 = @simp.once_rewrite_tac(@list.List([@rstc.tc_rtc_cases_r()]))
  let t394 = @simp.rewrite_tac(@list.List([]))
  let t390 = @term_syntax.parse_term("(x : Num)")
  let t393 = @tactics.disch_then(fn(x392 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x387 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s388 = @tactics.mp_tac(x387)
      fn(x389 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s388(x389)
      }
    })(((x391 : @kernel.Thm) => @bool.spec(t390, x391))(x392))
  })
  let t386 = @simp.rewrite_tac(@list.List([loopfree()]))
  let t385 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(y : Num)"))(@tactics.strip_assume_tac))
  let t384 = @simp.rewrite_tac(@list.List([loopfree_preserve()]))
  let t404 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) && !(c : Bool) → (b : Bool)) && (c → !b) → a → b == !c"))), t384), t385), t386), t393), t394), t395), t396), t397), @tactics.conj_tac), t403)
  loopfree_preserve_eq_c.set(@tactics.prove(@term_syntax.parse_term("LOOPFREE((env : List[(Num, Term)])) → LOOPFREE(CONS(((x : Num), (t : Term)), env)) == !(∃ y : Num, IN(y, FVT(t)) && RTC(OCC(env), y, x))"), t404))
}

///|
let loopfree_preserve_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOOPFREE_PRESERVE_EQ")

///|
/// `LOOPFREE_PRESERVE_EQ`
pub fn loopfree_preserve_eq() -> @kernel.Thm {
  loopfree_preserve_eq_c.get()
}

///|
/// LOOPFREE_WF
fn step_17() -> Unit raise {
  let t415 = @meson.asm_meson_tac(@list.List([@pair.fst()]))
  let t414 = @simp.rewrite_tac(@list.List([@lists.map(), @sets.set_of_list(), @lists.mem(), @sets.in_insert()]))
  let t412 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t413 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t412)
  let t411 = @simp.asm_rewrite_tac(@list.List([occ()]))
  let t410 = @tactics.conv_tac(@equal.depth_conv(@class.eta_conv))
  let t409 = @simp.once_rewrite_tac(@list.List([tc_rev()]))
  let t408 = @simp.asm_rewrite_tac(@list.List([@sets.finite_set_of_list()]))
  let t407 = @tactics.exists_tac(@term_syntax.parse_term("set_of_list(MAP(FST, (env : List[(Num, Term)])))"))
  let t406 = @tactics.match_mp_tac(wf_finite_lemma())
  let t405 = @tactics.repeat_tac(@tactics.strip_tac)
  let t416 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([loopfree()])), t405), t406), t407), t408), t409), t410), t411), t413), @lists.list_induct_tac), t414), t415)
  loopfree_wf_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], LOOPFREE(env) → WF((x : Num) => (y : Num) => OCC(env, y, x))"), t416))
}

///|
let loopfree_wf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOOPFREE_WF")

///|
/// `LOOPFREE_WF`
pub fn loopfree_wf() -> @kernel.Thm {
  loopfree_wf_c.get()
}

///|
/// LOOPFREE_WF_TERM
fn step_18() -> Unit raise {
  let t431 = @simp.asm_rewrite_tac(@list.List([]))
  let t429 = @term_syntax.parse_term("(n : Num) => (s : (Num) -> Term)(SUC(n))")
  let t430 = @tactics.map_every(fn(x426 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s427 = @tactics.exists_tac(x426)
    fn(x428 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s427(x428)
    }
  }, @list.List([@term_syntax.parse_term("(x : (Num) -> Num)"), t429]))
  let t424 = @tactics.x_choose_then(@term_syntax.parse_term("(x : (Num) -> Num)"))(@tactics.strip_assume_tac)
  let t425 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : (Num) -> Term)"))(t424))
  let t423 = @simp.rewrite_tac(@list.List([@wf.wf_dchain(), occ(), @class.taut(@term_syntax.parse_term("(!(a : Bool) → !(b : Bool)) == (b → a)")), @class.skolem_thm()]))
  let t420 = @drule.match_mp(loopfree_wf())
  let t422 = @tactics.first_assum(fn(x421 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s418 = @tactics.mp_tac(x417)
      fn(x419 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s418(x419)
      }
    })(t420(x421))
  })
  let t432 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t422), t423), t425), t430), t431)
  loopfree_wf_term_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], LOOPFREE(env) → WF((s : Term) => (t : Term) => ∃ y : Num, IN(y, FVT(t)) && MEM((y, s), env))"), t432))
}

///|
let loopfree_wf_term_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOOPFREE_WF_TERM")

///|
/// `LOOPFREE_WF_TERM`
pub fn loopfree_wf_term() -> @kernel.Thm {
  loopfree_wf_term_c.get()
}

///|
/// LOOPCHECK_EXISTS
fn step_19() -> Unit raise {
  let t439 = @meson.meson_tac(@list.List([]))
  let t438 = @simp.rewrite_tac(@list.List([]))
  let t435 = @drule.match_mp(loopfree_wf_term())
  let t433 = @drule.match_mp(@wf.wf_rec())
  let t437 = @tactics.first_assum(fn(x436 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.match_mp_tac(t433(x434))
    })(t435(x436))
  })
  let t440 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t437), t438), t439)
  loopcheck_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ x : Num, LOOPFREE(env) → (∃ loopcheck : (Term) -> Bool, ∀ t : Term, loopcheck(t) == (∃ y : Num, IN(y, FVT(t)) && (y == x || (∃ s : Term, MEM((y, s), env) && loopcheck(s)))))"), t440))
}

///|
let loopcheck_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOOPCHECK_EXISTS")

///|
/// `LOOPCHECK_EXISTS`
pub fn loopcheck_exists() -> @kernel.Thm {
  loopcheck_exists_c.get()
}

///|
/// loopcheck_raw
fn step_20() -> Unit raise {
  let t441 = @simp.rewrite_rule(@list.List([@class.skolem_thm(), @class.right_imp_exists_thm()]))(loopcheck_exists())
  loopcheck_raw_c.set(@nums.new_specification(@list.List(["loopcheck"]))(t441))
}

///|
let loopcheck_raw_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("loopcheck_raw")

///|
/// `loopcheck_raw`
pub fn loopcheck_raw() -> @kernel.Thm {
  loopcheck_raw_c.get()
}

///|
/// loopcheck
fn step_21() -> Unit raise {
  let t453 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t452 = @tactics.first_assum(fn(x450 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x450
    @simp.rewrite_tac(@list.List([@equal.gsym(@drule.match_mp(loopcheck_raw())(th_1))]))
  })
  let t449 = @simp.rewrite_tac(@list.List([left_and_ex_thm(), @lists.exists_ex(), @lists.ex_map(), @trivia.o_thm()]))
  let t448 = @simp.rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty(), @theorems.unwind_thm2(), @fol.in_list_union()]))
  let t447 = @tactics.first_assum(fn(x442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x442
    @simp.gen_rewrite_tac(fn(x444 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s445 = @equal.land_conv(x444)
      fn(x446 : @kernel.Term) -> @kernel.Thm raise {
        s445(x446)
      }
    }, @list.List([@drule.match_mp(loopcheck_raw())(th)]))
  })
  let t454 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t447), t448), t449), t452), t453), @tactics.refl_tac)
  loopcheck_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ x : Num, LOOPFREE(env) → (∀ x : Num, ∀ y : Num, loopcheck(env, x, V(y)) == (y == x || (∃ s : Term, MEM((y, s), env) && loopcheck(env, x, s)))) && (∀ f : Num, ∀ args : List[Term], loopcheck(env, x, Fn(f, args)) == EX(loopcheck(env, x), args))"), t454))
}

///|
let loopcheck_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("loopcheck")

///|
/// `loopcheck`
pub fn loopcheck() -> @kernel.Thm {
  loopcheck_c.get()
}

///|
/// LOOPCHECK
fn step_22() -> Unit raise {
  let t482 = @simp.asm_rewrite_tac(@list.List([]))
  let t481 = @tactics.exists_tac(@term_syntax.parse_term("(y : Num)"))
  let t480 = @tactics.first_assum(@tactics.match_mp_tac)
  let t479 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a && b) == (a && c)")))
  let t478 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @theorems.right_exists_and_thm()]))
  let t477 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t476 = @simp.rewrite_tac(@list.List([occ(), @theorems.left_and_exists_thm()]))
  let t475 = @simp.asm_rewrite_tac(@list.List([]))
  let t474 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == (y : Num)"))
  let t473 = @simp.once_rewrite_tac(@list.List([@rstc.rtc_cases_r()]))
  let t472 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a && b) == (a && c)")))
  let t471 = @tactics.first_assum(fn(x469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x469
    @simp.once_rewrite_tac(@list.List([@drule.match_mp(loopcheck_raw())(th)]))
  })
  let t468 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Term)"))
  let t467 = @tactics.disch_then(@tactics.match_mp_tac)
  let t466 = @simp.rewrite_tac(@list.List([@wf.wf_ind()]))
  let t463 = @drule.match_mp(loopfree_wf_term())
  let t465 = @tactics.first_assum(fn(x464 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x460 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s461 = @tactics.mp_tac(x460)
      fn(x462 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s461(x462)
      }
    })(t463(x464))
  })
  let t458 = @term_syntax.parse_term("(t : Term)")
  let t459 = @tactics.spec_tac(@term_syntax.parse_term("(t : Term)"), t458)
  let t457 = @simp.asm_simp_tac(@list.List([loopfree_preserve_eq()]))
  let t456 = @tactics.exists_tac(@term_syntax.parse_term("∃ y : Num, IN(y, FVT((t : Term))) && RTC(OCC((env : List[(Num, Term)])), y, (x : Num))"))
  let t455 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t483 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t455), t456), t457), t459), t465), t466), t467), t468), @tactics.disch_tac), t471), @tactics.ap_term_tac), @tactics.abs_tac), t472), @tactics.disch_tac), t473), t474), t475), t476), t477), @tactics.ap_term_tac), @tactics.abs_tac), t478), t479), @tactics.disch_tac), t480), t481), t482)
  loopcheck_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ x : Num, ∀ t : Term, LOOPFREE(env) → loopcheck(env, x, t) == !LOOPFREE(CONS((x, t), env))"), t483))
}

///|
let loopcheck_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOOPCHECK")

///|
/// `LOOPCHECK`
pub fn loopcheck_v1() -> @kernel.Thm {
  loopcheck_v1_c.get()
}

///|
/// rightsubst
fn step_23() -> Unit raise {
  rightsubst_c.set(@pair.new_definition(@term_syntax.parse_term("(rightsubst : ((Num, Term), (Num, Term)) -> (Num, Term))(((x : Num), (t : Term)), ((y : Num), (s : Term))) == (y, termsubst((z : Num) => if z == x { t } else { V(z) }, s))")))
}

///|
let rightsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("rightsubst")

///|
/// `rightsubst`
pub fn rightsubst() -> @kernel.Thm {
  rightsubst_c.get()
}

///|
/// SOLVE_EXISTS
fn step_24() -> Unit raise {
  let t484 = @simp.rewrite_tac(@list.List([]))
  let t485 = @tactics.then_tac(@class.bool_cases_tac(@term_syntax.parse_term("(b : Bool)")), t484)
  let lemma = @tactics.prove(@term_syntax.parse_term("(if (b : Bool) { (x : _) } else { (y : _) }) == (if !b { y } else { x })"), t485)
  let t486 = @simp.rewrite_tac(@list.List([@wf.wf_rec_tail()]))
  let t487 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([lemma])), t486)
  solve_exists_c.set(@tactics.prove(@term_syntax.parse_term("∃ SOLVE : ((List[(Num, Term)], List[(Num, Term)])) -> List[(Num, Term)], ∀ pr : (List[(Num, Term)], List[(Num, Term)]), SOLVE(pr) == (if SND(pr) == NIL { FST(pr) } else { SOLVE((CONS(HD(SND(pr)), MAP(rightsubst(HD(SND(pr))), FST(pr))), MAP(rightsubst(HD(SND(pr))), TL(SND(pr))))) })"), t487))
}

///|
let solve_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVE_EXISTS")

///|
/// `SOLVE_EXISTS`
pub fn solve_exists() -> @kernel.Thm {
  solve_exists_c.get()
}

///|
/// SOLVEC_RAW
fn step_25() -> Unit raise {
  solvec_raw_c.set(@nums.new_specification(@list.List(["SOLVEC"]))(solve_exists()))
}

///|
let solvec_raw_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVEC_RAW")

///|
/// `SOLVEC_RAW`
pub fn solvec_raw() -> @kernel.Thm {
  solvec_raw_c.get()
}

///|
/// SOLVE
fn step_26() -> Unit raise {
  solve_v1_c.set(@pair.new_definition(@term_syntax.parse_term("(SOLVE : (List[(Num, Term)], List[(Num, Term)]) -> List[(Num, Term)])((sol : List[(Num, Term)]), (uns : List[(Num, Term)])) == SOLVEC((sol, uns))")))
}

///|
let solve_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVE")

///|
/// `SOLVE`
pub fn solve_v1() -> @kernel.Thm {
  solve_v1_c.get()
}

///|
/// SOLVE
fn step_27() -> Unit raise {
  let t493 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.hd(), @lists.tl()]))
  let t492 = @simp.gen_rewrite_tac(fn(x489 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s490 = @equal.land_conv(x489)
    fn(x491 : @kernel.Term) -> @kernel.Thm raise {
      s490(x491)
    }
  }, @list.List([solvec_raw()]))
  let t488 = @tactics.repeat_tac(@tactics.strip_tac)
  let t494 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([solve_v1()])), t488), t492), t493)
  solve_c.set(@tactics.prove(@term_syntax.parse_term("(∀ sol : List[(Num, Term)], SOLVE(sol, NIL) == sol) && (∀ sol : List[(Num, Term)], ∀ p : (Num, Term), ∀ oth : List[(Num, Term)], SOLVE(sol, CONS(p, oth)) == SOLVE(CONS(p, MAP(rightsubst(p), sol)), MAP(rightsubst(p), oth)))"), t494))
}

///|
let solve_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVE")

///|
/// `SOLVE`
pub fn solve() -> @kernel.Thm {
  solve_c.get()
}

///|
/// CONFLICTFREE
fn step_28() -> Unit raise {
  conflictfree_c.set(@pair.new_definition(@term_syntax.parse_term("(CONFLICTFREE : (List[(Num, Term)]) -> Bool)((l : List[(Num, Term)])) == (∀ x : Num, LENGTH(FILTER(GABS((f : ((Num, Term)) -> Bool) => ∀ y : Num, ∀ s : Term, GEQ(f((y, s)), y == x)), l)) <= 1)")))
}

///|
let conflictfree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONFLICTFREE")

///|
/// `CONFLICTFREE`
pub fn conflictfree() -> @kernel.Thm {
  conflictfree_c.get()
}

///|
/// SOLVE_PRESERVES_LOOPFREE_LEMMA
fn step_29() -> Unit raise {
  let t539 = @meson.asm_meson_tac(@list.List([@lists.mem()]))
  let t538 = @simp.rewrite_tac(@list.List([occ()]))
  let t537 = @tactics.match_mp_tac(@rstc.tc_inc())
  let t535 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s530 = @tactics.assume_tac(x529)
    fn(x531 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s530(x531)
    }
  }, fn(x532 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s533 = @tactics.subst1_tac(x532)
    fn(x534 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s533(x534)
    }
  }))
  let t528 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num)"))
  let t536 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.match_mp_tac(@rstc.tc_trans())), t528), @tactics.conj_tac), t535])
  let t527 = @simp.asm_rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty()]))
  let t526 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Num)"))(fn(x523 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s524 = @tactics.mp_tac(x523)
    fn(x525 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s524(x525)
    }
  }))
  let t522 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t521 = @simp.asm_rewrite_tac(@list.List([@fol.termsubst_fvt()]))
  let t520 = @tactics.undisch_tac(@term_syntax.parse_term("IN((v : Num), FVT((p : Term)))"))
  let t517 = @term_syntax.parse_term("(s : Term)")
  let t518 = @term_syntax.parse_term("(y : Num)")
  let t519 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Term)"), t518, t517]))
  let t516 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), @theorems.left_and_exists_thm()]))
  let t515 = @simp.rewrite_tac(@list.List([occ(), @lists.mem_map(), @pair.exists_pair_thm(), rightsubst(), @pair.pair_eq()]))
  let t513 = @term_syntax.parse_term("(v : Num)")
  let t514 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Num)"), t513]))
  let t512 = @tactics.match_mp_tac(@rstc.tc_mono())
  let t511 = @simp.gen_rewrite_tac(fn(x510 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x505 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      ((x501 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(2, fn(x498 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s499 = @equal.binder_conv(x498)
        fn(x500 : @kernel.Term) -> @kernel.Thm raise {
          s499(x500)
        }
      }, x501))((fn(x502 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s503 = @equal.rand_conv(x502)
        fn(x504 : @kernel.Term) -> @kernel.Thm raise {
          s503(x504)
        }
      })(x505))
    })(((x509 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(2, fn(x506 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s507 = @equal.rator_conv(x506)
      fn(x508 : @kernel.Term) -> @kernel.Thm raise {
        s507(x508)
      }
    }, x509))(x510))
  }, @list.List([@equal.gsym(@rstc.tc_idemp())]))
  let t495 = @term_syntax.parse_term("(oth : List[(Num, Term)])")
  let t496 = @term_syntax.parse_term("(t : Term)")
  let t497 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t496, t495]))
  let t540 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@pair.forall_pair_thm()])), t497), t511), t512), t514), t515), t516), t519), @tactics.strip_tac), t520), t521), t522), t526), @class.cond_cases_tac), t527), t536), t537), t538), t539)
  solve_preserves_loopfree_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Num, Term), ∀ oth : List[(Num, Term)], ∀ x : Num, ∀ y : Num, TC(OCC(MAP(rightsubst(p), oth)), x, y) → TC(OCC(CONS(p, oth)), x, y)"), t540))
}

///|
let solve_preserves_loopfree_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVE_PRESERVES_LOOPFREE_LEMMA")

///|
/// `SOLVE_PRESERVES_LOOPFREE_LEMMA`
pub fn solve_preserves_loopfree_lemma() -> @kernel.Thm {
  solve_preserves_loopfree_lemma_c.get()
}

///|
/// SOLVE_PRESERVES_LOOPFREE
fn step_30() -> Unit raise {
  let t541 = @meson.meson_tac(@list.List([solve_preserves_loopfree_lemma()]))
  let t542 = @tactics.then_tac(@simp.rewrite_tac(@list.List([loopfree()])), t541)
  solve_preserves_loopfree_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Num, Term), ∀ oth : List[(Num, Term)], LOOPFREE(CONS(p, oth)) → LOOPFREE(MAP(rightsubst(p), oth))"), t542))
}

///|
let solve_preserves_loopfree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVE_PRESERVES_LOOPFREE")

///|
/// `SOLVE_PRESERVES_LOOPFREE`
pub fn solve_preserves_loopfree() -> @kernel.Thm {
  solve_preserves_loopfree_c.get()
}

///|
/// SOLVE_PRESERVES_CONFLICTFREE_LEMMA
fn step_31() -> Unit raise {
  let t544 = @simp.rewrite_tac(@list.List([@theorems.eq_sym()]))
  let t543 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t545 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), @pair.forall_pair_thm(), rightsubst()])), t543), t544)
  solve_preserves_conflictfree_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Num, Term), ∀ x : Num, o(GABS((f : ((Num, Term)) -> Bool) => ∀ y : Num, ∀ s : Term, GEQ(f((y, s)), y == x)), rightsubst(p)) == GABS((f : ((Num, Term)) -> Bool) => ∀ y : Num, ∀ s : Term, GEQ(f((y, s)), y == x))"), t545))
}

///|
let solve_preserves_conflictfree_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVE_PRESERVES_CONFLICTFREE_LEMMA")

///|
/// `SOLVE_PRESERVES_CONFLICTFREE_LEMMA`
pub fn solve_preserves_conflictfree_lemma() -> @kernel.Thm {
  solve_preserves_conflictfree_lemma_c.get()
}

///|
/// SOLVE_PRESERVES_CONFLICTFREE
fn step_32() -> Unit raise {
  let t548 = @simp.rewrite_tac(@list.List([solve_preserves_conflictfree_lemma()]))
  let t547 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @lists.length_map()]))
  let t546 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t549 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([conflictfree(), @lists.filter_append(), @lists.filter(), @lists.length_append(), @lists.filter_map(), @lists.length_map()])), t546), @tactics.gen_tac), @class.cond_cases_tac), t547), t548), @int.arith_tac)
  solve_preserves_conflictfree_c.set(@tactics.prove(@term_syntax.parse_term("CONFLICTFREE(APPEND((sol : List[(Num, Term)]), CONS((p : (Num, Term)), (oth : List[(Num, Term)])))) → CONFLICTFREE(APPEND(CONS(p, MAP(rightsubst(p), sol)), MAP(rightsubst(p), oth)))"), t549))
}

///|
let solve_preserves_conflictfree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVE_PRESERVES_CONFLICTFREE")

///|
/// `SOLVE_PRESERVES_CONFLICTFREE`
pub fn solve_preserves_conflictfree() -> @kernel.Thm {
  solve_preserves_conflictfree_c.get()
}

///|
/// SOLVE_PRESERVES_DEFREE
fn step_33() -> Unit raise {
  let t656 = @meson.asm_meson_tac(@list.List([@lists.mem_append(), @lists.mem()]))
  let t655 = @list.List([@tactics.all_tac, @tactics.disch_then(@tactics.conjuncts_then2(fn(x648 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s649 = @tactics.mp_tac(x648)
    fn(x650 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s649(x650)
    }
  }, fn(x654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x651 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s652 = @tactics.subst_all_tac(x651)
      fn(x653 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s652(x653)
      }
    })(@equal.sym(x654))
  }))])
  let t647 = @simp.asm_rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty()]))
  let t646 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(w : Num)"))(fn(x643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s644 = @tactics.mp_tac(x643)
    fn(x645 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s644(x645)
    }
  }))
  let t642 = @simp.rewrite_tac(@list.List([@fol.termsubst_fvt(), @sets.in_elim_thm()]))
  let t641 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x637 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x634 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s635 = @tactics.subst_all_tac(x634)
      fn(x636 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s635(x636)
      }
    })(@equal.sym(x637))
  }, fn(x638 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s639 = @tactics.subst1_tac(x638)
    fn(x640 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s639(x640)
    }
  }))
  let t633 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x627 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s628 = @tactics.assume_tac(x627)
    fn(x629 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s628(x629)
    }
  }, fn(x630 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s631 = @tactics.mp_tac(x630)
    fn(x632 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s631(x632)
    }
  }))
  let t625 = @term_syntax.parse_term("(r : Term) == SND((p : (Num, Term)))")
  let t626 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(z : Num) == FST((p : (Num, Term)))"), t625]))
  let t624 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Term)"))
  let t623 = @simp.rewrite_tac(@list.List([rightsubst(), @pair.pair_eq()]))
  let t622 = @tactics.subst_all_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(p : (Num, Term))"), @pair.pair())))
  let t621 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.map_append()), @lists.mem_map(), @theorems.left_imp_exists_thm(), @pair.forall_pair_thm()]))
  let t619 = @meson.asm_meson_tac(@list.List([]))
  let t618 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.append(), @lists.mem_append()]))
  let t620 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t618), t619), @tactics.all_tac])
  let t617 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x613 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x610 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s611 = @tactics.subst_all_tac(x610)
      fn(x612 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s611(x612)
      }
    })(@equal.sym(x613))
  }, fn(x614 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s615 = @tactics.mp_tac(x614)
    fn(x616 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s615(x616)
    }
  }))
  let t609 = @simp.rewrite_tac(@list.List([@lists.append(), @lists.mem()]))
  let t608 = @tactics.undisch_tac(@term_syntax.parse_term("MEM(((y : Num), (s : Term)), APPEND(CONS((p : (Num, Term)), MAP(rightsubst(p), (sol : List[(Num, Term)]))), MAP(rightsubst(p), (oth : List[(Num, Term)]))))"))
  let t606 = @simp.asm_rewrite_tac(@list.List([@lists.mem()]))
  let t605 = @tactics.exists_tac(@term_syntax.parse_term("(t : Term)"))
  let t604 = @simp.rewrite_tac(@list.List([occ()]))
  let t603 = @tactics.match_mp_tac(@rstc.tc_inc())
  let t602 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) → !(b : Bool)) == (b → a)"))]))
  let t598 = @term_syntax.parse_term("(x : Num)")
  let t601 = @tactics.disch_then(fn(x600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s596 = @tactics.mp_tac(x595)
      fn(x597 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s596(x597)
      }
    })(((x599 : @kernel.Thm) => @bool.spec(t598, x599))(x600))
  })
  let t594 = @simp.rewrite_tac(@list.List([loopfree()]))
  let t593 = @tactics.undisch_tac(@term_syntax.parse_term("LOOPFREE(CONS(((x : Num), (t : Term)), (oth : List[(Num, Term)])))"))
  let t591 = @simp.asm_rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty()]))
  let t590 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Num)"))(fn(x589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x586 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s587 = @tactics.mp_tac(x586)
      fn(x588 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s587(x588)
      }
    })(@bool.conjunct2(x589))
  }))
  let t585 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t584 = @tactics.repeat_tac(@tactics.gen_tac)
  let t583 = @simp.simp_tac(@list.List([@pair.pair_eq(), rightsubst(), @fol.termsubst_fvt()]))
  let t592 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm(), @pair.forall_pair_thm()])), t583), t584), @tactics.strip_tac), t585), t590), @class.cond_cases_tac), t591)])
  let t582 = @tactics.disch_then(@tactics.disj_cases_then2(@tactics.conjuncts_then(fn(x576 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s577 = @tactics.subst1_tac(x576)
    fn(x578 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s577(x578)
    }
  }), fn(x579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s580 = @tactics.mp_tac(x579)
    fn(x581 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s580(x581)
    }
  }))
  let t575 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.mem_map(), @pair.pair_eq()]))
  let t574 = @simp.rewrite_tac(@list.List([@lists.append(), @equal.gsym(@lists.map_append())]))
  let t607 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("MEM(((y : Num), (s : Term)), APPEND(CONS(((x : Num), (t : Term)), MAP(rightsubst((x, t)), (sol : List[(Num, Term)]))), MAP(rightsubst((x, t)), (oth : List[(Num, Term)]))))")), t574), t575), t582), t592), t593), t594), t601), t602), @tactics.disch_tac), t603), t604), t605), t606), @tactics.all_tac])
  let t573 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x569 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s567 = @tactics.subst_all_tac(x566)
      fn(x568 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s567(x568)
      }
    })(@equal.sym(x569))
  }, fn(x570 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s571 = @tactics.assume_tac(x570)
    fn(x572 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s571(x572)
    }
  }))
  let t565 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x562 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s563 = @tactics.mp_tac(x562)
    fn(x564 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s563(x564)
    }
  }, @tactics.strip_assume_tac))
  let t561 = @simp.rewrite_tac(@list.List([@lists.mem()]))
  let t560 = @tactics.repeat_tac(@tactics.gen_tac)
  let t559 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t557 = @meson.meson_tac(@list.List([]))
  let t556 = @simp.pure_rewrite_tac(@list.List([rightsubst(), @pair.pair_eq()]))
  let t555 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(p : (Num, Term))"), @pair.pair())))
  let t554 = @simp.rewrite_tac(@list.List([@lists.mem_map(), @pair.exists_pair_thm()]))
  let t558 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@lists.mem(), @theorems.exists_or_thm()]))), @tactics.ap_term_tac), t554), t555), t556), t557), @tactics.all_tac])
  let t553 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Num, (∃ t : Term, MEM((x, t), CONS((p : (Num, Term)), MAP(rightsubst(p), (sol : List[(Num, Term)]))))) == (∃ t : Term, MEM((x, t), CONS(p, sol)))"), fn(x551 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x551
    @simp.rewrite_tac(@list.List([th]))
  })
  let t550 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.left_and_exists_thm())]))
  let t657 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@theorems.left_imp_exists_thm())])), t550), t553), t558), t559), @tactics.strip_tac), t560), t561), t565), t573), t607), t608), t609), t617), t620), t621), t622), t623), @tactics.gen_tac), t624), t626), t633), t641), t642), t646), @class.cond_cases_tac), t647), t655), t656)
  solve_preserves_defree_c.set(@tactics.prove(@term_syntax.parse_term("LOOPFREE(CONS((p : (Num, Term)), (oth : List[(Num, Term)]))) && (∀ x : Num, ∀ y : Num, ∀ s : Term, ∀ t : Term, MEM((x, t), (sol : List[(Num, Term)])) && MEM((y, s), APPEND(sol, CONS(p, oth))) → !IN(x, FVT(s))) → (∀ x : Num, ∀ y : Num, ∀ s : Term, ∀ t : Term, MEM((x, t), CONS(p, MAP(rightsubst(p), sol))) && MEM((y, s), APPEND(CONS(p, MAP(rightsubst(p), sol)), MAP(rightsubst(p), oth))) → !IN(x, FVT(s)))"), t657))
}

///|
let solve_preserves_defree_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVE_PRESERVES_DEFREE")

///|
/// `SOLVE_PRESERVES_DEFREE`
pub fn solve_preserves_defree() -> @kernel.Thm {
  solve_preserves_defree_c.get()
}

///|
/// SOLVE_PRESERVES_UNIFIERS
fn step_34() -> Unit raise {
  let t658 = @meson.meson_tac(@list.List([]))
  let lemma = @tactics.prove(@term_syntax.parse_term("(∀ x : _, ∀ t : _, ∀ y : _, ∀ s : _, (P : (_, _) -> Bool)(y, s) && x == y && t == (f : (_) -> _)(s) → (Q : (_, _) -> Bool)(x, t)) == (∀ x : _, ∀ t : _, ∀ s : _, P(x, s) → Q(x, f(s)))"), t658)
  let t689 = @simp.asm_rewrite_tac(@list.List([@fol.termsubst()]))
  let t688 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t687 = @tactics.subgoal_then(@term_syntax.parse_term("((x : Num) => termsubst((i : (Num) -> Term), if x == (y : Num) { (s : Term) } else { V(x) })) == i"), fn(x685 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x685
    @simp.rewrite_tac(@list.List([th]))
  })
  let t684 = @simp.rewrite_tac(@list.List([@fol.termsubst_termsubst(), @trivia.o_def()]))
  let t683 = @simp.rewrite_tac(@list.List([rightsubst(), @pair.pair_eq(), lemma]))
  let t682 = @simp.simp_tac(@list.List([@lists.mem_map(), @theorems.left_imp_exists_thm(), @pair.forall_pair_thm()]))
  let t681 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.left_exists_and_thm(), @theorems.exists_refl()]))
  let t680 = @simp.simp_tac(@list.List([@pair.pair_eq(), @equal.gsym(@theorems.left_imp_exists_thm())]))
  let t678 = @term_syntax.parse_term("(s : Term)")
  let t679 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : Num)"), t678]))
  let t677 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t675 = @term_syntax.parse_term("(p : (Num, Term))")
  let t676 = @tactics.spec_tac(@term_syntax.parse_term("(p : (Num, Term))"), t675)
  let t674 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a && b) == (a && c)")))
  let t673 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t672 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t670 = @term_syntax.parse_term("(l : List[(Num, Term)])")
  let t671 = @tactics.spec_tac(@term_syntax.parse_term("APPEND((sol : List[(Num, Term)]), (oth : List[(Num, Term)]))"), t670)
  let t667 = @equal.gsym(@lists.map_append())
  let t668 = @equal.gsym(@lists.mem_append())
  let t669 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.disj_assoc()), t668, t667]))
  let t666 = @simp.gen_rewrite_tac(fn(x665 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x659 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s660 = @equal.land_conv(x659)
      fn(x661 : @kernel.Term) -> @kernel.Thm raise {
        s660(x661)
      }
    })((fn(x662 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s663 = @equal.once_depth_conv(x662)
      fn(x664 : @kernel.Term) -> @kernel.Thm raise {
        s663(x664)
      }
    })(x665))
  }, @list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) || (c : Bool)) == (b || a || c)"))]))
  let t690 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.mem_append(), @lists.mem()])), t666), t669), t671), @tactics.gen_tac), t672), t673), t674), t676), t677), t679), t680), t681), @tactics.disch_tac), t682), t683), t684), t687), t688), @tactics.gen_tac), @class.cond_cases_tac), t689)
  solve_preserves_unifiers_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Num, ∀ t : Term, MEM((x, t), APPEND((sol : List[(Num, Term)]), CONS((p : (Num, Term)), (oth : List[(Num, Term)])))) → (i : (Num) -> Term)(x) == termsubst(i, t)) == (∀ x : Num, ∀ t : Term, MEM((x, t), APPEND(CONS(p, MAP(rightsubst(p), sol)), MAP(rightsubst(p), oth))) → i(x) == termsubst(i, t))"), t690))
}

///|
let solve_preserves_unifiers_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVE_PRESERVES_UNIFIERS")

///|
/// `SOLVE_PRESERVES_UNIFIERS`
pub fn solve_preserves_unifiers() -> @kernel.Thm {
  solve_preserves_unifiers_c.get()
}

///|
/// SOLVE_WORKS_GENERAL
fn step_35() -> Unit raise {
  let t710 = @simp.asm_rewrite_tac(@list.List([]))
  let t709 = @tactics.match_mp_tac(solve_preserves_defree())
  let t708 = @simp.asm_simp_tac(@list.List([@lists.length_map(), solve_preserves_loopfree(), solve_preserves_conflictfree()]))
  let t707 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t706 = @simp.rewrite_tac(@list.List([solve_preserves_unifiers()]))
  let t705 = @tactics.first_x_assum(fn(x704 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x702 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x701 : (@kernel.Term, @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x699 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x696 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            @tactics.all_tac
          })(((x698 : @kernel.Term) => @lib.check(fn(x697 : @kernel.Term) -> Bool raise {
            @basics.is_imp(x697)
          }, x698))(x699))
        })((fn(x700 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
          x700.1
        })(x701))
      })(@basics.dest_forall(x702))
    })((fn(x703 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x703)
    })(x704))
  })
  let t695 = @tactics.x_gen_tac(@term_syntax.parse_term("(sol : List[(Num, Term)])"))
  let t694 = @simp.rewrite_tac(@list.List([@nums.suc_inj(), solve()]))
  let t692 = @meson.meson_tac(@list.List([]))
  let t693 = @list.List([@tactics.then_tac(@simp.simp_tac(@list.List([solve(), @lists.append_nil()])), t692), @tactics.all_tac])
  let t691 = @simp.rewrite_tac(@list.List([@lists.length(), @nums.not_suc()]))
  let t711 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @lists.list_induct_tac), t691), t693), t694), t695), t705), t706), @tactics.strip_tac), t707), t708), t709), t710)
  solve_works_general_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ env : List[(Num, Term)], ∀ sol : List[(Num, Term)], LENGTH(env) == n && LOOPFREE(env) && CONFLICTFREE(APPEND(sol, env)) && (∀ x : Num, ∀ y : Num, ∀ s : Term, ∀ t : Term, MEM((x, t), sol) && MEM((y, s), APPEND(sol, env)) → !IN(x, FVT(s))) → CONFLICTFREE(SOLVE(sol, env)) && (∀ i : (Num) -> Term, (∀ x : Num, ∀ t : Term, MEM((x, t), APPEND(sol, env)) → i(x) == termsubst(i, t)) == (∀ x : Num, ∀ t : Term, MEM((x, t), SOLVE(sol, env)) → i(x) == termsubst(i, t))) && (∀ x : Num, ∀ y : Num, ∀ s : Term, ∀ t : Term, MEM((x, t), SOLVE(sol, env)) && MEM((y, s), SOLVE(sol, env)) → !IN(x, FVT(s)))"), t711))
}

///|
let solve_works_general_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVE_WORKS_GENERAL")

///|
/// `SOLVE_WORKS_GENERAL`
pub fn solve_works_general() -> @kernel.Thm {
  solve_works_general_c.get()
}

///|
/// SOLVE_WORKS
fn step_36() -> Unit raise {
  let t717 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @lists.append(), @equal.gsym(@theorems.exists_refl())]))
  let t716 = @tactics.match_mp_tac(solve_works_general())
  let t715 = @list.List([@simp.rewrite_tac(@list.List([@lists.append()])), @tactics.all_tac])
  let t714 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Num, ∀ t : Term, MEM((x, t), (env : List[(Num, Term)])) == MEM((x, t), APPEND(NIL, env))"), fn(x712 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x712
    @simp.rewrite_tac(@list.List([th]))
  })
  let t718 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t714), t715), t716), t717)
  solve_works_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], LOOPFREE(env) && CONFLICTFREE(env) → CONFLICTFREE(SOLVE(NIL, env)) && (∀ i : (Num) -> Term, (∀ x : Num, ∀ t : Term, MEM((x, t), env) → i(x) == termsubst(i, t)) == (∀ x : Num, ∀ t : Term, MEM((x, t), SOLVE(NIL, env)) → i(x) == termsubst(i, t))) && (∀ x : Num, ∀ y : Num, ∀ s : Term, ∀ t : Term, MEM((x, t), SOLVE(NIL, env)) && MEM((y, s), SOLVE(NIL, env)) → !IN(x, FVT(s)))"), t718))
}

///|
let solve_works_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLVE_WORKS")

///|
/// `SOLVE_WORKS`
pub fn solve_works() -> @kernel.Thm {
  solve_works_c.get()
}

///|
let retval_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("retval_INDUCT")

///|
/// `retval_INDUCT`
pub fn retval_induct() -> @kernel.Thm {
  retval_induct_c.get()
}

///|
let retval_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("retval_RECURSION")

///|
/// `retval_RECURSION`
pub fn retval_recursion() -> @kernel.Thm {
  retval_recursion_c.get()
}

///|
/// retval_INDUCT, retval_RECURSION
fn step_37() -> Unit raise {
  let (retval_induct, retval_recursion) = @ind_types.define_type("retval = TT | FF | Exception")
  retval_induct_c.set(retval_induct)
  retval_recursion_c.set(retval_recursion)
}

///|
/// retval_DISTINCT
fn step_38() -> Unit raise {
  retval_distinct_c.set(@ind_types.prove_constructors_distinct(retval_recursion()))
}

///|
let retval_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("retval_DISTINCT")

///|
/// `retval_DISTINCT`
pub fn retval_distinct() -> @kernel.Thm {
  retval_distinct_c.get()
}

///|
/// ISTRIV_EXISTS
fn step_39() -> Unit raise {
  let t763 = @meson.asm_meson_tac(@list.List([]))
  let t762 = @simp.asm_rewrite_tac(@list.List([]))
  let t761 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Num) == (z : Num)"))
  let t760 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t759 = @simp.rewrite_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t757 = @term_syntax.parse_term("(s : Term)")
  let t758 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : Num)"), t757]))
  let t756 = @simp.once_rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t754 = @term_syntax.parse_term("(h : (Num, Term))")
  let t755 = @tactics.spec_tac(@term_syntax.parse_term("(h : (Num, Term))"), t754)
  let t753 = @simp.rewrite_tac(@list.List([@lists.map(), @lists.mem(), @lists.assoc(), @lists.filter()]))
  let t751 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t752 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t751)
  let t747 = @term_syntax.parse_term("(z : Num)")
  let t750 = @tactics.disch_then(fn(x749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x744 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s745 = @tactics.mp_tac(x744)
      fn(x746 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s745(x746)
      }
    })(((x748 : @kernel.Thm) => @bool.spec(t747, x748))(x749))
  })
  let t743 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x : Num, LENGTH(FILTER(GABS((f : ((Num, Term)) -> Bool) => ∀ y : Num, ∀ s : Term, GEQ(f((y, s)), y == x)), (env : List[(Num, Term)]))) <= 1"))
  let t742 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((z : Num), MAP(FST, (env : List[(Num, Term)])))"))
  let t740 = @simp.asm_simp_tac(@list.List([]))
  let t739 = @simp.rewrite_tac(@list.List([]))
  let t738 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Num)"))
  let t741 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.select_unique()), t738), t739), @tactics.eq_tac), t740), @tactics.all_tac])
  let t737 = @tactics.subgoal_then(@term_syntax.parse_term("select((y : Num) => (z : Num) == y && MEM(y, MAP(FST, (env : List[(Num, Term)])))) == z"), fn(x734 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s735 = @tactics.subst1_tac(x734)
    fn(x736 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s735(x736)
    }
  })
  let t733 = @simp.asm_rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert(), @fol.term_inj()]))
  let t732 = @tactics.exists_tac(@term_syntax.parse_term("(z : Num)"))
  let t731 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(z : Num)"))(@tactics.strip_assume_tac))
  let t730 = @tactics.first_assum(@tactics.match_mp_tac)
  let t729 = @tactics.try_tac(@tactics.asm_tac((x728 : @list.List[@kernel.Thm]) => @meson.gen_meson_tac(0L, 10L, 1L, x728))(@list.List([])))
  let t727 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t726 = @tactics.repeat_tac(@tactics.strip_tac)
  let t725 = @simp.rewrite_tac(@list.List([]))
  let t722 = @drule.match_mp(loopfree_wf_term())
  let t720 = @drule.match_mp(@wf.wf_rec())
  let t724 = @tactics.first_assum(fn(x723 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x721 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.match_mp_tac(t720(x721))
    })(t722(x723))
  })
  let t719 = @tactics.repeat_tac(@tactics.strip_tac)
  let t764 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([conflictfree()])), t719), t724), t725), t726), t727), t729), t730), t731), t732), t733), t737), t741), t742), t743), t750), t752), @lists.list_induct_tac), t753), t755), t756), t758), t759), t760), t761), t762), t763)
  istriv_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ x : Num, LOOPFREE(env) && CONFLICTFREE(env) → (∃ istriv : (Term) -> Retval, ∀ t : Term, istriv(t) == (if t == V(x) { TT } else { if (∃ y : Num, t == V(y) && MEM(y, MAP(FST, env))) { istriv(ASSOC(select((y : Num) => t == V(y) && MEM(y, MAP(FST, env))), env)) } else { if IN(x, FVT(t)) { Exception } else { if (∃ y : Num, ∃ s : Term, IN(y, FVT(t)) && MEM((y, s), env) && !(istriv(s) == FF)) { Exception } else { FF } } } }))"), t764))
}

///|
let istriv_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISTRIV_EXISTS")

///|
/// `ISTRIV_EXISTS`
pub fn istriv_exists() -> @kernel.Thm {
  istriv_exists_c.get()
}

///|
/// istriv_raw
fn step_40() -> Unit raise {
  let t765 = @simp.rewrite_rule(@list.List([@class.skolem_thm(), @class.right_imp_exists_thm()]))(istriv_exists())
  istriv_raw_c.set(@nums.new_specification(@list.List(["istriv"]))(t765))
}

///|
let istriv_raw_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("istriv_raw")

///|
/// `istriv_raw`
pub fn istriv_raw() -> @kernel.Thm {
  istriv_raw_c.get()
}

///|
/// istriv
fn step_41() -> Unit raise {
  let t924 = @simp.rewrite_tac(@list.List([@lists.length()]))
  let t923 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t922 = @simp.asm_rewrite_tac(@list.List([]))
  let t921 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t920 = @simp.rewrite_tac(@list.List([conflictfree(), @lists.mem(), @lists.filter()]))
  let t917 = @simp.gen_rewrite_rule(fn(x916 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x916
  }, @list.List([conflictfree()]))
  let t919 = @tactics.first_x_assum(fn(x918 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x913 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s914 = @tactics.mp_tac(x913)
      fn(x915 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s914(x915)
      }
    })(t917(x918))
  })
  let t912 = @tactics.subgoal_then(@term_syntax.parse_term("CONFLICTFREE((t : List[(Num, Term)]))"), fn(x910 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x910
    @meson.asm_meson_tac(@list.List([th_4]))
  })
  let t908 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t907 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @lists.mem_filter()]))
  let t903 = @term_syntax.parse_term("MEM(((y : Num), (s : Term)))")
  let t906 = @tactics.disch_then(fn(x905 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x900 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s901 = @tactics.mp_tac(x900)
      fn(x902 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s901(x902)
      }
    })(((x904 : @kernel.Thm) => @equal.ap_term(t903, x904))(x905))
  })
  let t899 = @simp.rewrite_tac(@list.List([@lists.length_eq_nil()]))
  let t898 = @simp.rewrite_tac(@list.List([@lists.length(), @int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= 1) == !(n == 0)"))]))
  let t897 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t896 = @simp.rewrite_tac(@list.List([@lists.filter(), @lists.length()]))
  let t892 = @term_syntax.parse_term("(y : Num)")
  let t895 = @tactics.disch_then(fn(x894 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x889 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s890 = @tactics.mp_tac(x889)
      fn(x891 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s890(x891)
      }
    })(((x893 : @kernel.Thm) => @bool.spec(t892, x893))(x894))
  })
  let t888 = @simp.rewrite_tac(@list.List([conflictfree()]))
  let t909 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → !(a : Bool)) → a → ((c : Bool) || b) == c"))), @tactics.disch_tac), t888), t895), t896), t897), t898), t899), t906), t907), t908), @tactics.refl_tac), @tactics.all_tac])
  let t887 = @simp.asm_rewrite_tac(@list.List([]))
  let t886 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == (y : Num)"))
  let t885 = @simp.rewrite_tac(@list.List([@pair.fst(), @pair.snd(), @pair.pair_eq(), @lists.assoc()]))
  let t883 = @term_syntax.parse_term("(t : Term)")
  let t884 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t883]))
  let t882 = @simp.once_rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t880 = @term_syntax.parse_term("(h : (Num, Term))")
  let t881 = @tactics.spec_tac(@term_syntax.parse_term("(h : (Num, Term))"), t880)
  let t879 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.map()]))
  let t878 = @tactics.pop_assum_list(fn(x877 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t875 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t876 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t875)
  let t874 = @tactics.first_assum(fn(x873 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x870 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s871 = @tactics.mp_tac(x870)
      fn(x872 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s871(x872)
      }
    })(@bool.conjunct2(x873))
  })
  let t869 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((y : Num), MAP(FST, (env : List[(Num, Term)])))"))
  let t868 = @tactics.subgoal_then(@term_syntax.parse_term("∀ s : Term, MEM(((y : Num), s), (env : List[(Num, Term)])) == (s == ASSOC(y, env))"), fn(x866 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x866
    @meson.meson_tac(@list.List([th_3]))
  })
  let t864 = @simp.asm_simp_tac(@list.List([]))
  let t863 = @simp.rewrite_tac(@list.List([]))
  let t862 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Num)"))
  let t865 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.select_unique()), t862), t863), @tactics.eq_tac), t864), @tactics.all_tac])
  let t861 = @tactics.subgoal_then(@term_syntax.parse_term("select((z : Num) => (y : Num) == z && MEM(z, MAP(FST, (env : List[(Num, Term)])))) == y"), fn(x858 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s859 = @tactics.subst1_tac(x858)
    fn(x860 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s859(x860)
    }
  })
  let t857 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t856 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t855 = @simp.asm_rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty(), @fol.term_inj()]))
  let t854 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(y : Num)"))(@tactics.strip_assume_tac))
  let t853 = @list.List([@tactics.all_tac, @tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([retval_distinct()])))])
  let t852 = @simp.asm_rewrite_tac(@list.List([]))
  let t851 = @class.asm_cases_tac(@term_syntax.parse_term("∃ y : Num, (t : Term) == V(y) && MEM(y, MAP(FST, (env : List[(Num, Term)])))"))
  let t850 = @simp.asm_rewrite_tac(@list.List([]))
  let t848 = @simp.asm_rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty()]))
  let t849 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!IN((x : Num), FVT((t : Term)))")), t848), @tactics.all_tac])
  let t847 = @tactics.first_assum(fn(x834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x834
    @simp.gen_rewrite_tac(fn(x846 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x842 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x836 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s837 = @equal.rand_conv(x836)
          fn(x838 : @kernel.Term) -> @kernel.Thm raise {
            s837(x838)
          }
        })((fn(x839 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s840 = @equal.rand_conv(x839)
          fn(x841 : @kernel.Term) -> @kernel.Thm raise {
            s840(x841)
          }
        })(x842))
      })((fn(x843 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s844 = @equal.land_conv(x843)
        fn(x845 : @kernel.Term) -> @kernel.Thm raise {
          s844(x845)
        }
      })(x846))
    }, @list.List([@drule.match_mp(istriv_raw())(th_2)]))
  })
  let t833 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t832 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Term)"))
  let t831 = @tactics.match_mp_tac(ex_adhoc())
  let t830 = @simp.rewrite_tac(@list.List([@fol.fvt(), @fol.in_list_union(), @lists.ex_map()]))
  let t829 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((x : Num), FVT(Fn((f : Num), (args : List[Term]))))"))
  let t828 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t827 = @simp.rewrite_tac(@list.List([@lists.exists_ex()]))
  let t826 = @simp.rewrite_tac(@list.List([left_and_ex_thm()]))
  let t825 = @simp.rewrite_tac(@list.List([@fol.fvt(), @fol.in_list_union(), @lists.ex_map()]))
  let t822 = @simp.asm_rewrite_tac(@list.List([@fol.term_distinct(), retval_distinct()]))
  let t821 = @simp.asm_rewrite_tac(@list.List([retval_distinct()]))
  let t823 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty()]))), t821), t822])
  let t820 = @tactics.first_assum(fn(x818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x818
    @simp.once_rewrite_tac(@list.List([@drule.match_mp(istriv_raw())(th_1)]))
  })
  let t817 = @tactics.try_tac(@tactics.disch_then(@tactics.conjuncts_then(fn(x814 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s815 = @tactics.assume_tac(x814)
    fn(x816 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s815(x816)
    }
  })))
  let t813 = @tactics.repeat_tac(@tactics.gen_tac)
  let t812 = @tactics.match_mp_tac(@fol.term_induct())
  let t811 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t810 = @tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(@lists.ex_imp()))
  let t809 = @simp.rewrite_tac(@list.List([@fol.fvt(), @fol.in_list_union(), @lists.ex_map()]))
  let t808 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : Num), FVT(Fn((f : Num), (args : List[Term]))))"))
  let t807 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) → !a → (b : Bool)")))
  let t806 = @tactics.undisch_tac(@term_syntax.parse_term("!EX((a : Term) => !(istriv((env : List[(Num, Term)]), (x : Num), a) == FF), (args : List[Term]))"))
  let t824 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))), t806), t807), t808), t809), t810), t811), t812), @tactics.conj_tac), t813), @tactics.strip_tac), t817), t820), t823), @tactics.all_tac])
  let t805 = @simp.asm_rewrite_tac(@list.List([]))
  let t804 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : Num), FVT(Fn((f : Num), (args : List[Term]))))"))
  let t802 = @simp.asm_simp_tac(@list.List([@pair.fst()]))
  let t801 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x797 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x794 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s795 = @tactics.subst1_tac(x794)
      fn(x796 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s795(x796)
      }
    })(@equal.sym(x797))
  }, fn(x798 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s799 = @tactics.mp_tac(x798)
    fn(x800 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s799(x800)
    }
  }))
  let t793 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.map()]))
  let t791 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t792 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t791)
  let t790 = @tactics.first_assum(@tactics.choose_then(fn(x789 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x786 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s787 = @tactics.mp_tac(x786)
      fn(x788 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s787(x788)
      }
    })(@bool.conjunct1(x789))
  }))
  let t785 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) → !a → (b : Bool)")))
  let t784 = @tactics.undisch_tac(@term_syntax.parse_term("!MEM((y : Num), MAP(FST, (env : List[(Num, Term)])))"))
  let t783 = @simp.rewrite_tac(@list.List([]))
  let t781 = @simp.asm_simp_tac(@list.List([]))
  let t780 = @simp.rewrite_tac(@list.List([]))
  let t779 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Num)"))
  let t778 = @tactics.match_mp_tac(@class.select_unique())
  let t782 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.ap_thm_tac), @tactics.ap_term_tac), t778), t779), t780), @tactics.eq_tac), t781), @tactics.all_tac])
  let t777 = @simp.rewrite_tac(@list.List([]))
  let t776 = @simp.asm_rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty(), @theorems.unwind_thm2()]))
  let t775 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t774 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm1()]))
  let t803 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.rewrite_tac(@list.List([]))), t774), t775), t776), @class.cond_cases_tac), t777), t782), @class.cond_cases_tac), t783), t784), t785), t790), t792), @lists.list_induct_tac), t793), t801), t802), @tactics.all_tac])
  let t773 = @simp.rewrite_tac(@list.List([@fol.term_inj(), @fol.term_distinct()]))
  let t772 = @tactics.first_assum(fn(x767 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x767
    @simp.gen_rewrite_tac(fn(x769 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s770 = @equal.land_conv(x769)
      fn(x771 : @kernel.Term) -> @kernel.Thm raise {
        s770(x771)
      }
    }, @list.List([@drule.match_mp(istriv_raw())(th)]))
  })
  let t766 = @tactics.repeat_tac(@tactics.strip_tac)
  let t925 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t766), t772), t773), t803), t804), t805), t824), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t825), t826), t827), t828), t829), t830), t831), t832), t833), @tactics.disch_tac), t847), @class.cond_cases_tac), t849), t850), t851), t852), t853), t854), t855), t856), t857), t861), t865), t868), @tactics.gen_tac), t869), t874), t876), t878), @lists.list_induct_tac), t879), t881), t882), t884), t885), t886), t887), t909), @tactics.disch_tac), t912), t919), t920), t921), t922), t923), @tactics.gen_tac), @class.cond_cases_tac), t924), @int.arith_tac)
  istriv_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ x : Num, LOOPFREE(env) && CONFLICTFREE(env) → (∀ x : Num, ∀ y : Num, istriv(env, x, V(y)) == (if y == x { TT } else { if MEM(y, MAP(FST, env)) { istriv(env, x, ASSOC(y, env)) } else { FF } })) && (∀ f : Num, ∀ args : List[Term], istriv(env, x, Fn(f, args)) == (if EX((a : Term) => !(istriv(env, x, a) == FF), args) { Exception } else { FF }))"), t925))
}

///|
let istriv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("istriv")

///|
/// `istriv`
pub fn istriv() -> @kernel.Thm {
  istriv_c.get()
}

///|
/// EQV
fn step_42() -> Unit raise {
  eqv_c.set(@pair.new_definition(@term_syntax.parse_term("(EQV : (List[(_, Term)], _, Num) -> Bool)((env : List[(_, Term)]), (x : _), (y : Num)) == MEM((x, V(y)), env)")))
}

///|
let eqv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQV")

///|
/// `EQV`
pub fn eqv() -> @kernel.Thm {
  eqv_c.get()
}

///|
/// EQV_IMP_OCC
fn step_43() -> Unit raise {
  let t926 = @meson.meson_tac(@list.List([@sets.in_insert(), @fol.fvt()]))
  let t927 = @tactics.then_tac(@simp.rewrite_tac(@list.List([eqv(), occ()])), t926)
  eqv_imp_occ_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ x : Num, ∀ y : Num, EQV(env, x, y) → OCC(env, x, y)"), t927))
}

///|
let eqv_imp_occ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQV_IMP_OCC")

///|
/// `EQV_IMP_OCC`
pub fn eqv_imp_occ() -> @kernel.Thm {
  eqv_imp_occ_c.get()
}

///|
/// ISTRIV_WORKS
fn step_44() -> Unit raise {
  let t1144 = @simp.asm_rewrite_tac(@list.List([retval_distinct()]))
  let t1142 = @meson.asm_meson_tac(@list.List([@rstc.rtc_mono(), eqv_imp_occ()]))
  let t1141 = @simp.asm_rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert()]))
  let t1140 = @tactics.exists_tac(@term_syntax.parse_term("(z : Num)"))
  let t1143 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(z : Num)"))(@tactics.strip_assume_tac)), t1140), t1141), t1142), @tactics.all_tac])
  let t1139 = @simp.asm_rewrite_tac(@list.List([retval_distinct()]))
  let t1138 = @class.asm_cases_tac(@term_syntax.parse_term("∃ y : Num, (s : Term) == V(y) && RTC(EQV((env : List[(Num, Term)])), y, (x : Num))"))
  let t1137 = @tactics.disch_then(fn(x1134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1135 = @tactics.subst1_tac(x1134)
    fn(x1136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1135(x1136)
    }
  })
  let t1133 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1129 = @term_syntax.parse_term("(s : Term)")
  let t1132 = @tactics.first_x_assum(fn(x1131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1127 = @tactics.mp_tac(x1126)
      fn(x1128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1127(x1128)
      }
    })(((x1130 : @kernel.Thm) => @bool.spec(t1129, x1130))(x1131))
  })
  let t1125 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a && b) == (a && c)")))
  let t1124 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : Term)"))
  let t1123 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t1122 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @theorems.right_exists_and_thm()]))
  let t1121 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t1120 = @simp.asm_rewrite_tac(@list.List([occ(), @theorems.left_and_exists_thm()]))
  let t1119 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1118 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Num) == (x : Num)"))
  let t1117 = @simp.once_rewrite_tac(@list.List([@rstc.rtc_cases_r()]))
  let t1116 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a && b) == (a && c)")))
  let t1115 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm()]))
  let t1114 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Num)"))
  let t1113 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t1111 = @meson.asm_meson_tac(@list.List([@rstc.rtc_refl()]))
  let t1112 = @list.List([@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∃ y : Num, IN(y, FVT((t : Term))) && RTC(OCC((env : List[(Num, Term)])), y, (x : Num))"), fn(x1109 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x1109
    @simp.rewrite_tac(@list.List([th_3]))
  }), t1111), @tactics.all_tac])
  let t1108 = @simp.asm_rewrite_tac(@list.List([]))
  let t1107 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : Num), FVT((t : Term)))"))
  let t1106 = @simp.asm_rewrite_tac(@list.List([]))
  let t1104 = @meson.meson_tac(@list.List([@pair.fst()]))
  let t1103 = @simp.rewrite_tac(@list.List([@lists.mem_map()]))
  let t1102 = @simp.asm_rewrite_tac(@list.List([]))
  let t1101 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1100 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Num) == (x : Num)"))
  let t1099 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Num)"))
  let t1098 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1097 = @simp.rewrite_tac(@list.List([eqv()]))
  let t1096 = @simp.once_rewrite_tac(@list.List([@rstc.rtc_cases_r()]))
  let t1095 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) → !(b : Bool)) == (b → a)"))]))
  let t1105 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!(∃ y : Num, (t : Term) == V(y) && MEM(y, MAP(FST, (env : List[(Num, Term)]))))")), t1095), t1096), t1097), t1098), t1099), t1100), t1101), t1102), t1103), t1104), @tactics.all_tac])
  let t1094 = @tactics.subgoal_then(@term_syntax.parse_term("!(∃ y : Num, (t : Term) == V(y) && RTC(EQV((env : List[(Num, Term)])), y, (x : Num)))"), fn(x1091 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1092 = @tactics.assume_tac(x1091)
    fn(x1093 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1092(x1093)
    }
  })
  let t1089 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t1088 = @simp.asm_rewrite_tac(@list.List([]))
  let t1087 = @simp.gen_rewrite_tac(fn(x1086 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1082 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1078 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x1074 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          (fn(x1068 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1069 = @equal.land_conv(x1068)
            fn(x1070 : @kernel.Term) -> @kernel.Thm raise {
              s1069(x1070)
            }
          })((fn(x1071 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
            let s1072 = @equal.rator_conv(x1071)
            fn(x1073 : @kernel.Term) -> @kernel.Thm raise {
              s1072(x1073)
            }
          })(x1074))
        })((fn(x1075 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1076 = @equal.land_conv(x1075)
          fn(x1077 : @kernel.Term) -> @kernel.Thm raise {
            s1076(x1077)
          }
        })(x1078))
      })((fn(x1079 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1080 = @equal.binder_conv(x1079)
        fn(x1081 : @kernel.Term) -> @kernel.Thm raise {
          s1080(x1081)
        }
      })(x1082))
    })((fn(x1083 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1084 = @equal.land_conv(x1083)
      fn(x1085 : @kernel.Term) -> @kernel.Thm raise {
        s1084(x1085)
      }
    })(x1086))
  }, @list.List([@theorems.eq_sym_eq()]))
  let t1066 = @simp.rewrite_tac(@list.List([@lists.length()]))
  let t1065 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1064 = @simp.asm_rewrite_tac(@list.List([]))
  let t1063 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1062 = @simp.rewrite_tac(@list.List([conflictfree(), @lists.mem(), @lists.filter()]))
  let t1059 = @simp.gen_rewrite_rule(fn(x1058 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1058
  }, @list.List([conflictfree()]))
  let t1061 = @tactics.first_x_assum(fn(x1060 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1055 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1056 = @tactics.mp_tac(x1055)
      fn(x1057 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1056(x1057)
      }
    })(t1059(x1060))
  })
  let t1054 = @tactics.subgoal_then(@term_syntax.parse_term("CONFLICTFREE((t : List[(Num, Term)]))"), fn(x1052 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1052
    @meson.asm_meson_tac(@list.List([th_2]))
  })
  let t1050 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1049 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @lists.mem_filter()]))
  let t1045 = @term_syntax.parse_term("MEM(((z : Num), (s : Term)))")
  let t1048 = @tactics.disch_then(fn(x1047 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1042 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1043 = @tactics.mp_tac(x1042)
      fn(x1044 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1043(x1044)
      }
    })(((x1046 : @kernel.Thm) => @equal.ap_term(t1045, x1046))(x1047))
  })
  let t1041 = @simp.rewrite_tac(@list.List([@lists.length_eq_nil()]))
  let t1040 = @simp.rewrite_tac(@list.List([@lists.length(), @int.arith_rule(@term_syntax.parse_term("!(SUC((n : Num)) <= 1) == !(n == 0)"))]))
  let t1039 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1038 = @simp.rewrite_tac(@list.List([@lists.filter(), @lists.length()]))
  let t1034 = @term_syntax.parse_term("(z : Num)")
  let t1037 = @tactics.disch_then(fn(x1036 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1031 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1032 = @tactics.mp_tac(x1031)
      fn(x1033 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1032(x1033)
      }
    })(((x1035 : @kernel.Thm) => @bool.spec(t1034, x1035))(x1036))
  })
  let t1030 = @simp.rewrite_tac(@list.List([conflictfree()]))
  let t1051 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → !(a : Bool)) → a → ((c : Bool) || b) == c"))), @tactics.disch_tac), t1030), t1037), t1038), t1039), t1040), t1041), t1048), t1049), t1050), @tactics.refl_tac), @tactics.all_tac])
  let t1029 = @simp.asm_rewrite_tac(@list.List([]))
  let t1028 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == (z : Num)"))
  let t1027 = @simp.rewrite_tac(@list.List([@pair.fst(), @pair.snd(), @pair.pair_eq(), @lists.assoc()]))
  let t1025 = @term_syntax.parse_term("(t : Term)")
  let t1026 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t1025]))
  let t1024 = @simp.once_rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t1022 = @term_syntax.parse_term("(h : (Num, Term))")
  let t1023 = @tactics.spec_tac(@term_syntax.parse_term("(h : (Num, Term))"), t1022)
  let t1021 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.map()]))
  let t1020 = @tactics.pop_assum_list(fn(x1019 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1017 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t1018 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t1017)
  let t1016 = @tactics.first_assum(fn(x1015 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1012 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1013 = @tactics.mp_tac(x1012)
      fn(x1014 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1013(x1014)
      }
    })(@bool.conjunct2(x1015))
  })
  let t1067 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.undisch_tac(@term_syntax.parse_term("MEM((z : Num), MAP(FST, (env : List[(Num, Term)])))"))), t1016), t1018), t1020), @lists.list_induct_tac), t1021), t1023), t1024), t1026), t1027), t1028), t1029), t1051), @tactics.disch_tac), t1054), t1061), t1062), t1063), t1064), t1065), @tactics.gen_tac), @class.cond_cases_tac), t1066), @int.arith_tac), @tactics.all_tac])
  let t1011 = @tactics.subgoal_then(@term_syntax.parse_term("∀ s : Term, MEM(((z : Num), s), (env : List[(Num, Term)])) == (s == ASSOC(z, env))"), fn(x1009 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1009
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t1008 = @simp.rewrite_tac(@list.List([occ(), eqv()]))
  let t1007 = @simp.asm_rewrite_tac(@list.List([]))
  let t1006 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1005 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == (z : Num)"))
  let t1004 = @simp.gen_rewrite_tac(fn(x1003 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x997 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s998 = @equal.rand_conv(x997)
      fn(x999 : @kernel.Term) -> @kernel.Thm raise {
        s998(x999)
      }
    })((fn(x1000 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1001 = @equal.once_depth_conv(x1000)
      fn(x1002 : @kernel.Term) -> @kernel.Thm raise {
        s1001(x1002)
      }
    })(x1003))
  }, @list.List([@rstc.rtc_cases_r()]))
  let t996 = @simp.asm_rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty(), @theorems.unwind_thm2()]))
  let t995 = @tactics.disch_then(fn(x992 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s993 = @tactics.subst1_tac(x992)
    fn(x994 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s993(x994)
    }
  })
  let t990 = @meson.asm_meson_tac(@list.List([]))
  let t989 = @simp.asm_rewrite_tac(@list.List([]))
  let t988 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Num) == (z : Num)"))
  let t987 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t986 = @simp.rewrite_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t984 = @term_syntax.parse_term("(s : Term)")
  let t985 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : Num)"), t984]))
  let t983 = @simp.once_rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t981 = @term_syntax.parse_term("(h : (Num, Term))")
  let t982 = @tactics.spec_tac(@term_syntax.parse_term("(h : (Num, Term))"), t981)
  let t980 = @simp.rewrite_tac(@list.List([@lists.map(), @lists.mem(), @lists.assoc(), @lists.filter()]))
  let t978 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t979 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t978)
  let t974 = @term_syntax.parse_term("(z : Num)")
  let t977 = @tactics.disch_then(fn(x976 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x971 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s972 = @tactics.mp_tac(x971)
      fn(x973 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s972(x973)
      }
    })(((x975 : @kernel.Thm) => @bool.spec(t974, x975))(x976))
  })
  let t970 = @simp.rewrite_tac(@list.List([conflictfree()]))
  let t969 = @tactics.first_assum(fn(x968 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x965 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s966 = @tactics.mp_tac(x965)
      fn(x967 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s966(x967)
      }
    })(@bool.conjunct2(x968))
  })
  let t964 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((z : Num), MAP(FST, (env : List[(Num, Term)])))"))
  let t963 = @simp.asm_rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert()]))
  let t991 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(z : Num)")), t963), t964), t969), t970), t977), t979), @lists.list_induct_tac), t980), t982), t983), t985), t986), t987), t988), t989), t990), @tactics.all_tac])
  let t959 = @term_syntax.parse_term("ASSOC((z : Num), (env : List[(Num, Term)]))")
  let t962 = @tactics.first_x_assum(fn(x961 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x956 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s957 = @tactics.mp_tac(x956)
      fn(x958 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s957(x958)
      }
    })(((x960 : @kernel.Thm) => @bool.spec(t959, x960))(x961))
  })
  let t954 = @simp.asm_simp_tac(@list.List([]))
  let t953 = @simp.rewrite_tac(@list.List([]))
  let t952 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Num)"))
  let t955 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.select_unique()), t952), t953), @tactics.eq_tac), t954), @tactics.all_tac])
  let t951 = @tactics.subgoal_then(@term_syntax.parse_term("select((y : Num) => (z : Num) == y && MEM(y, MAP(FST, (env : List[(Num, Term)])))) == z"), fn(x948 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s949 = @tactics.subst1_tac(x948)
    fn(x950 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s949(x950)
    }
  })
  let t947 = @simp.asm_rewrite_tac(@list.List([@fol.term_inj(), @theorems.unwind_thm1()]))
  let t1090 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(z : Num)"))(@tactics.strip_assume_tac)), t947), t951), t955), t962), @tactics.ants_tac), t991), t995), t996), t1004), t1005), t1006), t1007), t1008), t1011), t1067), t1087), @class.cond_cases_tac), t1088), t1089), @tactics.all_tac])
  let t946 = @simp.asm_rewrite_tac(@list.List([]))
  let t945 = @class.asm_cases_tac(@term_syntax.parse_term("∃ y : Num, (t : Term) == V(y) && MEM(y, MAP(FST, (env : List[(Num, Term)])))"))
  let t943 = @meson.asm_meson_tac(@list.List([@fol.term_inj(), @rstc.rtc_refl()]))
  let t944 = @list.List([@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))), t943), @tactics.all_tac])
  let t942 = @simp.asm_rewrite_tac(@list.List([]))
  let t941 = @class.asm_cases_tac(@term_syntax.parse_term("(t : Term) == V((x : Num))"))
  let t940 = @tactics.first_assum(fn(x938 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x938
    @simp.once_rewrite_tac(@list.List([@drule.match_mp(istriv_raw())(th)]))
  })
  let t937 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Term)"))
  let t936 = @tactics.disch_then(@tactics.match_mp_tac)
  let t935 = @simp.rewrite_tac(@list.List([@wf.wf_ind()]))
  let t931 = @drule.match_mp(loopfree_wf_term())
  let t934 = @tactics.first_assum(fn(x933 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x932 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x928 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s929 = @tactics.mp_tac(x928)
        fn(x930 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s929(x930)
        }
      })(t931(x932))
    })(@bool.conjunct1(x933))
  })
  let t1145 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))), @tactics.disch_tac), @tactics.gen_tac), t934), t935), t936), t937), @tactics.disch_tac), t940), t941), t942), t944), t945), t946), t1090), t1094), t1105), t1106), t1107), t1108), t1112), @tactics.ap_thm_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t1113), t1114), t1115), t1116), @tactics.disch_tac), t1117), t1118), t1119), t1120), t1121), t1122), @tactics.ap_term_tac), t1123), t1124), t1125), @tactics.disch_tac), t1132), @tactics.ants_tac), t1133), t1137), t1138), t1139), t1143), @class.cond_cases_tac), t1144)
  istriv_works_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ x : Num, ∀ t : Term, LOOPFREE(env) && CONFLICTFREE(env) → istriv(env, x, t) == (if (∃ y : Num, t == V(y) && RTC(EQV(env), y, x)) { TT } else { if (∃ y : Num, IN(y, FVT(t)) && RTC(OCC(env), y, x)) { Exception } else { FF } })"), t1145))
}

///|
let istriv_works_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISTRIV_WORKS")

///|
/// `ISTRIV_WORKS`
pub fn istriv_works() -> @kernel.Thm {
  istriv_works_c.get()
}

///|
/// SUB1
fn step_45() -> Unit raise {
  sub1_c.set(@pair.new_definition(@term_syntax.parse_term("(SUB1 : (Term, Term) -> Bool)((s : Term), (t : Term)) == (∃ f : Num, ∃ args : List[Term], t == Fn(f, args) && MEM(s, args))")))
}

///|
let sub1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUB1")

///|
/// `SUB1`
pub fn sub1() -> @kernel.Thm {
  sub1_c.get()
}

///|
/// WF_SUB1
fn step_46() -> Unit raise {
  let t1152 = @meson.asm_meson_tac(@list.List([]))
  let t1151 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@lists.all_mem())])))
  let t1150 = @simp.rewrite_tac(@list.List([@fol.term_distinct(), @fol.term_inj()]))
  let t1149 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1148 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1147 = @tactics.match_mp_tac(@fol.term_induct())
  let t1146 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1153 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@wf.wf_ind(), sub1(), @theorems.left_imp_exists_thm()])), t1146), @tactics.disch_tac), t1147), t1148), t1149), t1150), t1151), t1152)
  wf_sub1_c.set(@tactics.prove(@term_syntax.parse_term("WF(SUB1)"), t1153))
}

///|
let wf_sub1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_SUB1")

///|
/// `WF_SUB1`
pub fn wf_sub1() -> @kernel.Thm {
  wf_sub1_c.get()
}

///|
/// RTC_SUB1
fn step_47() -> Unit raise {
  let t1169 = @simp.rewrite_tac(@list.List([@lists.ex_mem()]))
  let t1166 = @drule.match_mp(all_adhoc())
  let t1168 = @tactics.first_assum(fn(x1167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1165 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1162 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1163 = @tactics.subst1_tac(x1162)
        fn(x1164 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1163(x1164)
        }
      })(@equal.sym(x1165))
    })(t1166(x1167))
  })
  let t1161 = @simp.rewrite_tac(@list.List([@lists.ex_map(), @trivia.o_def()]))
  let t1160 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t1159 = @tactics.exists_tac(@term_syntax.parse_term("∃ y : Term, RTC(SUB1, V((x : Num)), y) && MEM(y, (l : List[Term]))"))
  let t1158 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1157 = @simp.rewrite_tac(@list.List([sub1(), @fol.term_inj(), @fol.term_distinct()]))
  let t1156 = @simp.once_rewrite_tac(@list.List([@rstc.rtc_cases_l()]))
  let t1155 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1154 = @simp.rewrite_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty(), @fol.in_list_union()]))
  let t1170 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@fol.term_induct())), t1154), @tactics.conj_tac), t1155), t1156), t1157), t1158), t1159), @tactics.conj_tac), t1160), t1161), t1168), t1169)
  rtc_sub1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Num, ∀ t : Term, RTC(SUB1, V(x), t) == IN(x, FVT(t))"), t1170))
}

///|
let rtc_sub1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTC_SUB1")

///|
/// `RTC_SUB1`
pub fn rtc_sub1() -> @kernel.Thm {
  rtc_sub1_c.get()
}

///|
/// WF_SUBCOMPONENT
fn step_48() -> Unit raise {
  let t1172 = @simp.rewrite_tac(@list.List([loopfree_wf_term()]))
  let t1171 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t1173 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([rtc_sub1()])), t1171), t1172)
  wf_subcomponent_c.set(@tactics.prove(@term_syntax.parse_term("LOOPFREE((env : List[(Num, Term)])) → WF((s : Term) => (t : Term) => ∃ x : Num, MEM((x, s), env) && RTC(SUB1, V(x), t))"), t1173))
}

///|
let wf_subcomponent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_SUBCOMPONENT")

///|
/// `WF_SUBCOMPONENT`
pub fn wf_subcomponent() -> @kernel.Thm {
  wf_subcomponent_c.get()
}

///|
/// WF_DESCENT
fn step_49() -> Unit raise {
  let t1182 = @simp.asm_simp_tac(@list.List([wf_subcomponent()]))
  let t1181 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @theorems.unwind_thm2()]))
  let t1180 = @simp.once_rewrite_tac(@list.List([@theorems.swap_exists_thm()]))
  let t1179 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t1178 = @simp.rewrite_tac(@list.List([wf_sub1()]))
  let t1177 = @tactics.conv_tac(@equal.top_depth_conv(@class.eta_conv))
  let t1176 = @simp.rewrite_tac(@list.List([@equal.gsym(sub1())]))
  let t1175 = @tactics.match_mp_tac(wf_disj())
  let t1174 = @simp.once_rewrite_tac(@list.List([@theorems.disj_sym()]))
  let t1183 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1174), t1175), t1176), t1177), t1178), t1179), t1180), t1181), t1182)
  wf_descent_c.set(@tactics.prove(@term_syntax.parse_term("LOOPFREE((env : List[(Num, Term)])) → WF((s : Term) => (t : Term) => (∃ x : Num, t == V(x) && MEM((x, s), env)) || (∃ f : Num, ∃ args : List[Term], t == Fn(f, args) && MEM(s, args)))"), t1183))
}

///|
let wf_descent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_DESCENT")

///|
/// `WF_DESCENT`
pub fn wf_descent() -> @kernel.Thm {
  wf_descent_c.get()
}

///|
/// termcases
fn step_50() -> Unit raise {
  let t1184 = @term_syntax.parse_term("(termcases : ((Num) -> _, (Num, List[Term]) -> _, Term) -> _)((cv : (Num) -> _), (cf : (Num, List[Term]) -> _), V((v : Num))) == cv(v) && termcases(cv, cf, Fn((f : Num), (args : List[Term]))) == cf(f, args)")
  termcases_c.set(@recursion.new_recursive_definition(@fol.term_recursion())(t1184))
}

///|
let termcases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("termcases")

///|
/// `termcases`
pub fn termcases() -> @kernel.Thm {
  termcases_c.get()
}

///|
/// tpcases_def
fn step_51() -> Unit raise {
  tpcases_def_c.set(@pair.new_definition(@term_syntax.parse_term("(tpcases : ((Num, List[Term], Num, List[Term]) -> _, (Num, Term) -> _, (Num, List[Term], Num) -> _, (Term, Term)) -> _)((c1 : (Num, List[Term], Num, List[Term]) -> _), (c2 : (Num, Term) -> _), (c3 : (Num, List[Term], Num) -> _), ((t1 : Term), (t2 : Term))) == termcases((v1 : Num) => termcases((v2 : Num) => c2(v1, V(v2)), (f2 : Num) => (args2 : List[Term]) => c2(v1, Fn(f2, args2)), t2), (f1 : Num) => (args1 : List[Term]) => termcases((v2 : Num) => c3(f1, args1, v2), (f2 : Num) => (args2 : List[Term]) => c1(f1, args1, f2, args2), t2), t1)")))
}

///|
let tpcases_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("tpcases_def")

///|
/// `tpcases_def`
pub fn tpcases_def() -> @kernel.Thm {
  tpcases_def_c.get()
}

///|
/// tpcases
fn step_52() -> Unit raise {
  let t1187 = @simp.rewrite_tac(@list.List([tpcases_def(), termcases()]))
  let t1186 = @tactics.match_mp_tac(@fol.term_induct())
  let t1185 = @term_syntax.parse_term("(t2 : Term)")
  let t1188 = @tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(t2 : Term)"), t1185), t1186), t1187)
  tpcases_c.set(@tactics.prove(@term_syntax.parse_term("tpcases((c1 : (Num, List[Term], Num, List[Term]) -> _), (c2 : (Num, Term) -> _), (c3 : (Num, List[Term], Num) -> _), (Fn((f1 : Num), (args1 : List[Term])), Fn((f2 : Num), (args2 : List[Term])))) == c1(f1, args1, f2, args2) && tpcases(c1, c2, c3, (V((v1 : Num)), (t2 : Term))) == c2(v1, t2) && tpcases(c1, c2, c3, (Fn(f1, args1), V((v2 : Num)))) == c3(f1, args1, v2)"), t1188))
}

///|
let tpcases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("tpcases")

///|
/// `tpcases`
pub fn tpcases() -> @kernel.Thm {
  tpcases_c.get()
}

///|
/// MLEFT
fn step_53() -> Unit raise {
  mleft_c.set(@pair.new_definition(@term_syntax.parse_term("(MLEFT : ((List[(Num, Term)], List[(Term, Term)])) -> Num)(((env : List[(Num, Term)]), (eqs : List[(Term, Term)]))) == CARD(UNION(FVT(Fn(0, MAP(FST, eqs))), UNION(FVT(Fn(0, MAP(SND, eqs))), UNION(FVT(Fn(0, MAP(SND, env))), FVT(Fn(0, MAP(o(V, FST), env))))))) - CARD(FVT(Fn(0, MAP(o(V, FST), env))))")))
}

///|
let mleft_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MLEFT")

///|
/// `MLEFT`
pub fn mleft() -> @kernel.Thm {
  mleft_c.get()
}

///|
/// CRIGHT
fn step_54() -> Unit raise {
  cright_c.set(@pair.new_definition(@term_syntax.parse_term("(CRIGHT : ((List[(Num, Term)], List[(Term, Term)]), (List[(Num, Term)], List[(Term, Term)])) -> Bool)(((env' : List[(Num, Term)]), (eqs' : List[(Term, Term)])), ((env : List[(Num, Term)]), (eqs : List[(Term, Term)]))) == (LOOPFREE(env) && env' == env && ((∃ f : Num, ∃ args1 : List[Term], ∃ args2 : List[Term], ∃ oth : List[(Term, Term)], LENGTH(args1) == LENGTH(args2) && eqs == CONS((Fn(f, args1), Fn(f, args2)), oth) && eqs' == APPEND(ZIP(args1, args2), oth)) || (∃ x : Num, ∃ t : Term, ∃ oth : List[(Term, Term)], eqs == CONS((V(x), t), oth) && (MEM(x, MAP(FST, env)) && eqs' == CONS((ASSOC(x, env), t), oth) || !MEM(x, MAP(FST, env)) && istriv(env, x, t) == TT && eqs' == oth)) || (∃ x : Num, ∃ f : Num, ∃ args : List[Term], ∃ oth : List[(Term, Term)], eqs == CONS((Fn(f, args), V(x)), oth) && eqs' == CONS((V(x), Fn(f, args)), oth))))")))
}

///|
let cright_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CRIGHT")

///|
/// `CRIGHT`
pub fn cright() -> @kernel.Thm {
  cright_c.get()
}

///|
/// CALLORDER
fn step_55() -> Unit raise {
  callorder_c.set(@pair.new_definition(@term_syntax.parse_term("(CALLORDER : ((List[(Num, Term)], List[(Term, Term)]), (List[(Num, Term)], List[(Term, Term)])) -> Bool)(((env' : List[(Num, Term)]), (eqs' : List[(Term, Term)])), ((env : List[(Num, Term)]), (eqs : List[(Term, Term)]))) == (MEASURE(MLEFT, (env', eqs'), (env, eqs)) || CRIGHT((env', eqs'), (env, eqs)))")))
}

///|
let callorder_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CALLORDER")

///|
/// `CALLORDER`
pub fn callorder() -> @kernel.Thm {
  callorder_c.get()
}

///|
/// PAIRED_ETA_THM
fn step_56() -> Unit raise {
  let t1190 = @simp.rewrite_tac(@list.List([]))
  let t1189 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1191 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @pair.forall_pair_thm()])), t1189), t1190)
  paired_eta_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : ((A, B)) -> C, GABS((f : ((A, B)) -> C) => ∀ p1 : A, ∀ p2 : B, GEQ(f((p1, p2)), g((p1, p2)))) == g"), t1191))
}

///|
let paired_eta_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIRED_ETA_THM")

///|
/// `PAIRED_ETA_THM`
pub fn paired_eta_thm() -> @kernel.Thm {
  paired_eta_thm_c.get()
}

///|
/// WF_CRIGHT
fn step_57() -> Unit raise {
  let t1312 = @meson.meson_tac(@list.List([]))
  let t1311 = @tactics.repeat_tac(@tactics.disj2_tac)
  let t1310 = @simp.rewrite_tac(@list.List([]))
  let t1309 = @tactics.disch_then(@tactics.conjuncts_then(fn(x1306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1307 = @tactics.subst_all_tac(x1306)
    fn(x1308 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1307(x1308)
    }
  }))
  let t1305 = @simp.rewrite_tac(@list.List([@lists.mem(), @pair.pair_eq()]))
  let t1304 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t1302 = @term_syntax.parse_term("(u : Term)")
  let t1303 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : Term)"), t1302]))
  let t1301 = @simp.gen_rewrite_tac(fn(x1300 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1300
  }, @list.List([@pair.forall_pair_thm()]))
  let t1299 = @simp.asm_rewrite_tac(@list.List([@lists.append()]))
  let t1297 = @term_syntax.parse_term("[(V((x : Num)), Fn((f : Num), (args : List[Term])))]")
  let t1298 = @term_syntax.parse_term("(oth : List[(Term, Term)])")
  let t1313 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x1294 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1295 = @tactics.exists_tac(x1294)
    fn(x1296 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1295(x1296)
    }
  }, @list.List([@term_syntax.parse_term("(Fn((f : Num), (args : List[Term])), V((x : Num)))"), t1298, t1297])), t1299), t1301), t1303), t1304), t1305), t1309), t1310), t1311), t1312)
  let t1293 = @simp.asm_rewrite_tac(@list.List([@lists.append(), @lists.mem()]))
  let t1291 = @term_syntax.parse_term("(NIL : List[(Term, Term)])")
  let t1292 = @term_syntax.parse_term("(oth : List[(Term, Term)])")
  let t1314 = @tactics.then_tac(@tactics.map_every(fn(x1288 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1289 = @tactics.exists_tac(x1288)
    fn(x1290 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1289(x1290)
    }
  }, @list.List([@term_syntax.parse_term("(V((x : Num)), (t : Term))"), t1292, t1291])), t1293)
  let t1287 = @simp.asm_rewrite_tac(@list.List([@lists.mem_assoc()]))
  let t1286 = @tactics.exists_tac(@term_syntax.parse_term("(x : Num)"))
  let t1285 = @simp.rewrite_tac(@list.List([]))
  let t1284 = @tactics.disch_then(@tactics.conjuncts_then(fn(x1281 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1282 = @tactics.subst_all_tac(x1281)
    fn(x1283 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1282(x1283)
    }
  }))
  let t1280 = @simp.rewrite_tac(@list.List([@lists.mem(), @pair.pair_eq()]))
  let t1279 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t1277 = @term_syntax.parse_term("(u : Term)")
  let t1278 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : Term)"), t1277]))
  let t1276 = @simp.gen_rewrite_tac(fn(x1275 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1275
  }, @list.List([@pair.forall_pair_thm()]))
  let t1274 = @simp.asm_rewrite_tac(@list.List([@lists.append()]))
  let t1272 = @term_syntax.parse_term("[(ASSOC((x : Num), (env : List[(Num, Term)])), (t : Term))]")
  let t1273 = @term_syntax.parse_term("(oth : List[(Term, Term)])")
  let t1315 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x1269 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1270 = @tactics.exists_tac(x1269)
    fn(x1271 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1270(x1271)
    }
  }, @list.List([@term_syntax.parse_term("(V((x : Num)), (t : Term))"), t1273, t1272])), t1274), t1276), t1278), t1279), t1280), t1284), @tactics.disj2_tac), @tactics.disj1_tac), t1285), t1286), t1287)
  let t1268 = @meson.asm_meson_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t1267 = @simp.rewrite_tac(@list.List([@lists.mem_map()]))
  let t1263 = @drule.match_mp(@lists.map_snd_zip())
  let t1265 = @tactics.first_assum(fn(x1264 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1259 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1260 = @tactics.subst1_tac(x1259)
        fn(x1261 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1260(x1261)
        }
      })(@equal.sym(x1262))
    })(t1263(x1264))
  })
  let t1257 = @drule.match_mp(@lists.map_fst_zip())
  let t1266 = @list.List([@tactics.first_assum(fn(x1258 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1256 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1254 = @tactics.subst1_tac(x1253)
        fn(x1255 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1254(x1255)
        }
      })(@equal.sym(x1256))
    })(t1257(x1258))
  }), t1265])
  let t1252 = @simp.asm_rewrite_tac(@list.List([]))
  let t1248 = @term_syntax.parse_term("(args2 : List[Term])")
  let t1249 = @term_syntax.parse_term("(f : Num)")
  let t1250 = @term_syntax.parse_term("(args1 : List[Term])")
  let t1251 = @tactics.map_every(fn(x1245 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1246 = @tactics.exists_tac(x1245)
    fn(x1247 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1246(x1247)
    }
  }, @list.List([@term_syntax.parse_term("(f : Num)"), t1250, t1249, t1248]))
  let t1244 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm(), @theorems.right_and_exists_thm()]))
  let t1243 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t1241 = @term_syntax.parse_term("(t : Term)")
  let t1242 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : Term)"), t1241]))
  let t1240 = @simp.gen_rewrite_tac(fn(x1239 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1239
  }, @list.List([@pair.forall_pair_thm()]))
  let t1238 = @simp.asm_rewrite_tac(@list.List([]))
  let t1236 = @term_syntax.parse_term("ZIP((args1 : List[Term]), (args2 : List[Term]))")
  let t1237 = @term_syntax.parse_term("(oth : List[(Term, Term)])")
  let t1316 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x1233 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1234 = @tactics.exists_tac(x1233)
    fn(x1235 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1234(x1235)
    }
  }, @list.List([@term_syntax.parse_term("(Fn((f : Num), (args1 : List[Term])), Fn(f, (args2 : List[Term])))"), t1237, t1236])), t1238), t1240), t1242), t1243), @tactics.disch_tac), @tactics.disj1_tac), t1244), t1251), t1252), @tactics.conj_tac), t1266), t1267), t1268), t1315, t1314, t1313])
  let t1232 = @simp.rewrite_tac(@list.List([]))
  let t1230 = @term_syntax.parse_term("(eqs1 : List[(Term, Term)])")
  let t1231 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(eqs2 : List[(Term, Term)])"), t1230]))
  let t1229 = @tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(@wf.wf_subset()))
  let t1226 = @drule.match_mp(wf_multizip())
  let t1228 = @tactics.disch_then(fn(x1227 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1223 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1224 = @tactics.mp_tac(x1223)
      fn(x1225 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1224(x1225)
      }
    })(t1226(x1227))
  })
  let t1222 = @list.List([@meson.meson_tac(@list.List([@fol.term_distinct()])), @tactics.all_tac])
  let t1221 = @simp.rewrite_tac(@list.List([]))
  let t1217 = @term_syntax.parse_term("(s : Term) => (t : Term) => (∃ f : Num, ∃ args : List[Term], s == Fn(f, args)) && (∃ x : Num, t == V(x))")
  let t1220 = @tactics.disch_then(fn(x1219 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1214 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1215 = @tactics.mp_tac(x1214)
      fn(x1216 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1215(x1216)
      }
    })(((x1218 : @kernel.Thm) => @bool.spec(t1217, x1218))(x1219))
  })
  let t1211 = @drule.match_mp(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(wf_alternation()))
  let t1213 = @tactics.disch_then(fn(x1212 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1207 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1208 = @tactics.mp_tac(x1207)
        fn(x1209 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1208(x1209)
        }
      })(@bool.gen_all(x1210))
    })(t1211(x1212))
  })
  let t1204 = @drule.match_mp(wf_descent())
  let t1206 = @tactics.first_assum(fn(x1205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1201 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1202 = @tactics.mp_tac(x1201)
      fn(x1203 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1202(x1203)
      }
    })(t1204(x1205))
  })
  let t1200 = @simp.rewrite_tac(@list.List([]))
  let t1199 = @tactics.x_gen_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"))
  let t1198 = @tactics.match_mp_tac(wf_proj_eq())
  let t1197 = @simp.rewrite_tac(@list.List([cright()]))
  let t1195 = @tactics.conv_tac(@equal.top_depth_conv(@class.eta_conv))
  let t1196 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([paired_eta_thm()])), t1195), @tactics.refl_tac), @tactics.all_tac])
  let t1317 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("CRIGHT == GABS((f : ((List[(Num, Term)], List[(Term, Term)]), (List[(Num, Term)], List[(Term, Term)])) -> Bool) => ∀ env' : List[(Num, Term)], ∀ eqs' : List[(Term, Term)], GEQ(f((env', eqs')), GABS((f : ((List[(Num, Term)], List[(Term, Term)])) -> Bool) => ∀ env : List[(Num, Term)], ∀ eqs : List[(Term, Term)], GEQ(f((env, eqs)), CRIGHT((env', eqs'), (env, eqs))))))"), fn(x1192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1193 = @tactics.subst1_tac(x1192)
    fn(x1194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1193(x1194)
    }
  }), t1196), t1197), t1198), t1199), @tactics.disch_tac), t1200), t1206), t1213), t1220), t1221), @tactics.ants_tac), t1222), t1228), t1229), t1231), t1232), @tactics.strip_tac), t1316)
  wf_cright_c.set(@tactics.prove(@term_syntax.parse_term("WF(CRIGHT)"), t1317))
}

///|
let wf_cright_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_CRIGHT")

///|
/// `WF_CRIGHT`
pub fn wf_cright() -> @kernel.Thm {
  wf_cright_c.get()
}

///|
/// WF_CALLORDER
fn step_58() -> Unit raise {
  let t1361 = @tactics.conv_tac(@class.taut)
  let t1362 = @tactics.conv_tac(@class.taut)
  let t1360 = @simp.asm_simp_tac(@list.List([@fol.list_union(), @sets.in_union()]))
  let t1359 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.map(), @lists.assoc()]))
  let t1357 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t1358 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t1357)
  let t1356 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((x' : Num), MAP(FST, (env : List[(Num, Term)])))"))
  let t1363 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (e : Bool)) → a || (b : Bool) || (c : Bool) || (d : Bool) || e || (f : Bool) → (a' : Bool) || b || c || d || e || f"))), t1356), t1358), @lists.list_induct_tac), t1359), @class.cond_cases_tac), t1360)
  let t1355 = @simp.asm_simp_tac(@list.List([@lists.map_fst_zip(), @lists.map_snd_zip()]))
  let t1364 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a' : Bool) == (a : Bool) && (c' : Bool) == (c : Bool) → a || (b : Bool) || c || (d : Bool) → a' || b || c' || d"))), t1355), t1363, t1362, t1361])
  let t1354 = @simp.rewrite_tac(@list.List([@sets.in_union(), @equal.gsym(@theorems.disj_assoc())]))
  let t1353 = @simp.rewrite_tac(@list.List([@lists.map(), @lists.map_append(), @fol.fvt(), @fol.list_union(), @fol.list_union_append()]))
  let t1352 = @simp.asm_rewrite_tac(@list.List([]))
  let t1351 = @tactics.first_x_assum(@tactics.disj_cases_then(@tactics.strip_assume_tac))
  let t1350 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t1349 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union()]))
  let t1348 = @simp.rewrite_tac(@list.List([@sets.finite_union(), @fol.fvt_finite()]))
  let t1347 = @tactics.match_mp_tac(@sets.card_subset())
  let t1346 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a : Num) <= (c : Num) → a - (b : Num) <= c - b")))
  let t1345 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1340 = @tactics.subst1_tac(x1339)
    fn(x1341 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1340(x1341)
    }
  }, fn(x1342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1343 = @tactics.assume_tac(x1342)
    fn(x1344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1343(x1344)
    }
  }))
  let t1338 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1333 = @tactics.assume_tac(x1332)
    fn(x1334 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1333(x1334)
    }
  }, fn(x1335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1336 = @tactics.mp_tac(x1335)
    fn(x1337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1336(x1337)
    }
  }))
  let t1331 = @simp.rewrite_tac(@list.List([cright(), mleft()]))
  let t1327 = @term_syntax.parse_term("(eqs : List[(Term, Term)])")
  let t1328 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t1329 = @term_syntax.parse_term("(eqs' : List[(Term, Term)])")
  let t1330 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(env' : List[(Num, Term)])"), t1329, t1328, t1327]))
  let t1326 = @simp.rewrite_tac(@list.List([wf_cright(), @pair.forall_pair_thm()]))
  let t1325 = @tactics.match_mp_tac(wf_measure_or_noninc())
  let t1324 = @simp.rewrite_tac(@list.List([paired_eta_thm()]))
  let t1323 = @simp.rewrite_tac(@list.List([callorder()]))
  let t1321 = @tactics.conv_tac(@equal.top_depth_conv(@class.eta_conv))
  let t1322 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([paired_eta_thm()])), t1321), @tactics.refl_tac), @tactics.all_tac])
  let t1365 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("CALLORDER == GABS((f : ((List[(Num, Term)], List[(Term, Term)]), (List[(Num, Term)], List[(Term, Term)])) -> Bool) => ∀ env' : List[(Num, Term)], ∀ eqs' : List[(Term, Term)], GEQ(f((env', eqs')), GABS((f : ((List[(Num, Term)], List[(Term, Term)])) -> Bool) => ∀ env : List[(Num, Term)], ∀ eqs : List[(Term, Term)], GEQ(f((env, eqs)), CALLORDER((env', eqs'), (env, eqs))))))"), fn(x1318 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1319 = @tactics.subst1_tac(x1318)
    fn(x1320 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1319(x1320)
    }
  }), t1322), t1323), t1324), t1325), t1326), t1330), t1331), t1338), t1345), t1346), t1347), t1348), t1349), t1350), t1351), t1352), t1353), t1354), t1364)
  wf_callorder_c.set(@tactics.prove(@term_syntax.parse_term("WF(CALLORDER)"), t1365))
}

///|
let wf_callorder_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WF_CALLORDER")

///|
/// `WF_CALLORDER`
pub fn wf_callorder() -> @kernel.Thm {
  wf_callorder_c.get()
}

///|
/// UNIFY_EXISTS_RAW
fn step_59() -> Unit raise {
  let t1490 = @simp.asm_rewrite_tac(@list.List([]))
  let t1489 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1488 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union(), @sets.in_insert()]))
  let t1487 = @simp.rewrite_tac(@list.List([@sets.finite_union(), @fol.fvt_finite(), @sets.finite_insert()]))
  let t1491 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.card_subset()), t1487), t1488), t1489), t1490)
  let t1486 = @simp.asm_simp_tac(@list.List([]))
  let t1485 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @fol.fvt(), @sets.in_union(), @sets.in_insert(), @sets.not_in_empty()]))
  let t1484 = @simp.rewrite_tac(@list.List([@fol.list_union(), @lists.mem(), @lists.map(), @sets.not_in_empty()]))
  let t1483 = @simp.rewrite_tac(@list.List([@fol.fvt()]))
  let t1481 = @term_syntax.parse_term("(env1 : List[(Num, Term)])")
  let t1482 = @tactics.spec_tac(@term_syntax.parse_term("(env1 : List[(Num, Term)])"), t1481)
  let t1480 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → (a : Bool)) → !a → b → (c : Bool)")))
  let t1479 = @tactics.undisch_tac(@term_syntax.parse_term("!MEM((x : Num), MAP(FST, (env1 : List[(Num, Term)])))"))
  let t1478 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : Num), FVT(Fn(0, MAP(o(V, FST), (env1 : List[(Num, Term)])))))"))
  let t1477 = @simp.rewrite_tac(@list.List([]))
  let t1492 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@sets.card_clauses(), @fol.fvt_finite(), @arith.add1()])), @class.cond_cases_tac), t1477), t1478), t1479), t1480), t1482), t1483), @lists.list_induct_tac), t1484), t1485), @tactics.strip_tac), t1486)
  let t1493 = @list.List([@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @theorems.disj_aci(), @sets.in_insert()]))), t1492, t1491])
  let t1476 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1475 = @list.List([@simp.rewrite_tac(@list.List([@fol.fvt(), @lists.map(), @fol.list_union(), @trivia.o_thm(), @pair.fst()])), @tactics.all_tac])
  let t1474 = @tactics.subgoal_then(@term_syntax.parse_term("FVT(Fn(0, CONS((t : Term), MAP(SND, (oth : List[(Term, Term)]))))) == UNION(FVT(t), FVT(Fn(0, MAP(SND, oth))))"), fn(x1471 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1472 = @tactics.subst1_tac(x1471)
    fn(x1473 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1472(x1473)
    }
  })
  let t1470 = @list.List([@simp.rewrite_tac(@list.List([@fol.fvt(), @lists.map(), @fol.list_union(), @trivia.o_thm(), @pair.fst()])), @tactics.all_tac])
  let t1469 = @tactics.subgoal_then(@term_syntax.parse_term("FVT(Fn(0, CONS((t : Term), MAP(SND, (env1 : List[(Num, Term)]))))) == UNION(FVT(t), FVT(Fn(0, MAP(SND, env1))))"), fn(x1466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1467 = @tactics.subst1_tac(x1466)
    fn(x1468 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1467(x1468)
    }
  })
  let t1464 = @sets.set_tac(@list.List([]))
  let t1465 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.fvt(), @lists.map(), @fol.list_union(), @trivia.o_thm(), @pair.fst()])), t1464), @tactics.all_tac])
  let t1463 = @tactics.subgoal_then(@term_syntax.parse_term("FVT(Fn(0, CONS(V((x : Num)), MAP(FST, (oth : List[(Term, Term)]))))) == INSERT(x, FVT(Fn(0, MAP(FST, oth))))"), fn(x1460 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1461 = @tactics.subst1_tac(x1460)
    fn(x1462 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1461(x1462)
    }
  })
  let t1458 = @sets.set_tac(@list.List([]))
  let t1459 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.fvt(), @lists.map(), @fol.list_union(), @trivia.o_thm(), @pair.fst()])), t1458), @tactics.all_tac])
  let t1457 = @tactics.subgoal_then(@term_syntax.parse_term("FVT(Fn(0, CONS(o(V, FST, ((x : Num), (t : Term))), MAP(o(V, FST), (env1 : List[(Num, Term)]))))) == INSERT(x, FVT(Fn(0, MAP(o(V, FST), env1))))"), fn(x1454 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1455 = @tactics.subst1_tac(x1454)
    fn(x1456 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1455(x1456)
    }
  })
  let t1453 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a' : Num) == (a : Num) && (b' : Num) == (b : Num) + 1 && b' <= a' → a' - b' < a - b")))
  let t1452 = @simp.rewrite_tac(@list.List([@lists.map(), @pair.fst(), @pair.snd(), @lists.length()]))
  let t1451 = @simp.rewrite_tac(@list.List([@wf.measure(), mleft()]))
  let t1450 = @simp.rewrite_tac(@list.List([callorder()]))
  let t1449 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1447 = @meson.asm_meson_tac(@list.List([]))
  let t1446 = @simp.asm_rewrite_tac(@list.List([cright()]))
  let t1445 = @simp.rewrite_tac(@list.List([callorder()]))
  let t1448 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t1445), @tactics.disj2_tac), t1446), @tactics.disj2_tac), @tactics.disj1_tac), t1447), @tactics.all_tac])
  let t1444 = @simp.asm_rewrite_tac(@list.List([]))
  let t1443 = @class.asm_cases_tac(@term_syntax.parse_term("istriv((env1 : List[(Num, Term)]), (x : Num), (t : Term)) == TT"))
  let t1442 = @simp.asm_rewrite_tac(@list.List([]))
  let t1441 = @class.asm_cases_tac(@term_syntax.parse_term("istriv((env1 : List[(Num, Term)]), (x : Num), (t : Term)) == Exception"))
  let t1439 = @meson.asm_meson_tac(@list.List([]))
  let t1438 = @simp.asm_rewrite_tac(@list.List([cright()]))
  let t1437 = @simp.rewrite_tac(@list.List([callorder()]))
  let t1440 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t1437), @tactics.disj2_tac), t1438), @tactics.disj2_tac), @tactics.disj1_tac), t1439), @tactics.all_tac])
  let t1436 = @simp.asm_rewrite_tac(@list.List([]))
  let t1435 = @class.asm_cases_tac(@term_syntax.parse_term("MEM((x : Num), MAP(FST, (env1 : List[(Num, Term)])))"))
  let t1432 = @meson.asm_meson_tac(@list.List([]))
  let t1431 = @simp.asm_rewrite_tac(@list.List([cright()]))
  let t1430 = @simp.rewrite_tac(@list.List([callorder()]))
  let t1429 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1433 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))), t1429), t1430), @tactics.disj2_tac), t1431), t1432)
  let t1428 = @meson.asm_meson_tac(@list.List([]))
  let t1427 = @tactics.repeat_tac(@tactics.disj2_tac)
  let t1426 = @simp.asm_rewrite_tac(@list.List([cright()]))
  let t1425 = @simp.rewrite_tac(@list.List([callorder()]))
  let t1434 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t1425), @tactics.disj2_tac), t1426), t1427), t1428), t1433])
  let t1424 = @simp.rewrite_tac(@list.List([tpcases()]))
  let t1419 = @tactics.x_choose_then(@term_syntax.parse_term("(gargs : List[Term])"))(fn(x1416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1417 = @tactics.subst_all_tac(x1416)
    fn(x1418 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1417(x1418)
    }
  })
  let t1420 = @tactics.x_choose_then(@term_syntax.parse_term("(g : Num)"))(t1419)
  let t1421 = @tactics.disch_then(@tactics.disj_cases_then2(@tactics.x_choose_then(@term_syntax.parse_term("(x : Num)"))(fn(x1413 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1414 = @tactics.subst_all_tac(x1413)
    fn(x1415 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1414(x1415)
    }
  }), t1420))
  let t1422 = @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("SND((hpr : (Term, Term)))"), @fol.term_cases())), t1421)
  let t1423 = @list.List([@simp.abbrev_tac(@term_syntax.parse_term("(t : Term) == SND((hpr : (Term, Term)))")), t1422])
  let t1410 = @tactics.x_choose_then(@term_syntax.parse_term("(fargs : List[Term])"))(fn(x1407 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1408 = @tactics.subst_all_tac(x1407)
    fn(x1409 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1408(x1409)
    }
  })
  let t1411 = @tactics.x_choose_then(@term_syntax.parse_term("(f : Num)"))(t1410)
  let t1412 = @tactics.disch_then(@tactics.disj_cases_then2(@tactics.x_choose_then(@term_syntax.parse_term("(x : Num)"))(fn(x1404 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1405 = @tactics.subst_all_tac(x1404)
    fn(x1406 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1405(x1406)
    }
  }), t1411))
  let t1403 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("FST((hpr : (Term, Term)))"), @fol.term_cases()))
  let t1402 = @tactics.subst_all_tac(@equal.gsym(@bool.ispec(@term_syntax.parse_term("(hpr : (Term, Term))"), @pair.pair())))
  let t1401 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.hd(), @lists.tl()]))
  let t1399 = @tactics.x_choose_then(@term_syntax.parse_term("(oth : List[(Term, Term)])"))(fn(x1396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1397 = @tactics.subst_all_tac(x1396)
    fn(x1398 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1397(x1398)
    }
  })
  let t1400 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(hpr : (Term, Term))"))(t1399))
  let t1395 = @simp.rewrite_tac(@list.List([]))
  let t1394 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x1388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1389 = @tactics.subst1_tac(x1388)
    fn(x1390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1389(x1390)
    }
  }, fn(x1391 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1392 = @tactics.mp_tac(x1391)
    fn(x1393 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1392(x1393)
    }
  }))
  let t1387 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(eqs1 : List[(Term, Term)])"), @lists.list_cases()))
  let t1386 = @simp.asm_rewrite_tac(@list.List([]))
  let t1385 = @class.asm_cases_tac(@term_syntax.parse_term("LOOPFREE((env1 : List[(Num, Term)]))"))
  let t1384 = @simp.rewrite_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t1383 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t1379 = @term_syntax.parse_term("((env2 : List[(Num, Term)]), (eqs2 : List[(Term, Term)]))")
  let t1375 = @term_syntax.parse_term("(eqs2 : List[(Term, Term)])")
  let t1376 = @list.List([@term_syntax.parse_term("(env2 : List[(Num, Term)])"), t1375])
  let t1382 = @tactics.disch_then(fn(x1381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1378 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1372 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1373 = @tactics.mp_tac(x1372)
        fn(x1374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1373(x1374)
        }
      })(((x1377 : @kernel.Thm) => @bool.genl(t1376, x1377))(x1378))
    })(((x1380 : @kernel.Thm) => @bool.spec(t1379, x1380))(x1381))
  })
  let t1370 = @term_syntax.parse_term("(eqs1 : List[(Term, Term)])")
  let t1371 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(env1 : List[(Num, Term)])"), t1370]))
  let t1369 = @simp.gen_rewrite_tac(fn(x1368 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1368
  }, @list.List([@pair.forall_pair_thm()]))
  let t1366 = @term_syntax.parse_term("(unify2 : ((List[(Num, Term)], List[(Term, Term)])) -> Option[List[(Num, Term)]])")
  let t1367 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(unify1 : ((List[(Num, Term)], List[(Term, Term)])) -> Option[List[(Num, Term)]])"), t1366]))
  let t1494 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@drule.match_mp(@wf.wf_rec())(wf_callorder())), t1367), t1369), t1371), t1382), t1383), t1384), @tactics.disch_tac), t1385), t1386), t1387), t1394), t1395), t1400), t1401), t1402), t1403), t1412), t1423), t1424), t1434), t1435), t1436), t1440), t1441), t1442), t1443), t1444), t1448), t1449), t1450), @tactics.disj1_tac), t1451), t1452), t1453), t1457), t1459), t1463), t1465), t1469), t1470), t1474), t1475), t1476), t1493)
  unify_exists_raw_c.set(@tactics.prove(@term_syntax.parse_term("∃ unify : ((List[(Num, Term)], List[(Term, Term)])) -> Option[List[(Num, Term)]], ∀ pr : (List[(Num, Term)], List[(Term, Term)]), unify(pr) == (if !LOOPFREE(FST(pr)) { NONE } else { if SND(pr) == NIL { SOME(FST(pr)) } else { tpcases((f : Num) => (fargs : List[Term]) => (g : Num) => (gargs : List[Term]) => if f == g && LENGTH(fargs) == LENGTH(gargs) { unify((FST(pr), APPEND(ZIP(fargs, gargs), TL(SND(pr))))) } else { NONE }, (x : Num) => (t : Term) => if MEM(x, MAP(FST, FST(pr))) { unify((FST(pr), CONS((ASSOC(x, FST(pr)), t), TL(SND(pr))))) } else { if istriv(FST(pr), x, t) == Exception { NONE } else { if istriv(FST(pr), x, t) == TT { unify((FST(pr), TL(SND(pr)))) } else { unify((CONS((x, t), FST(pr)), TL(SND(pr)))) } } }, (f : Num) => (args : List[Term]) => (x : Num) => unify((FST(pr), CONS((V(x), Fn(f, args)), TL(SND(pr))))), HD(SND(pr))) } })"), t1494))
}

///|
let unify_exists_raw_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFY_EXISTS_RAW")

///|
/// `UNIFY_EXISTS_RAW`
pub fn unify_exists_raw() -> @kernel.Thm {
  unify_exists_raw_c.get()
}

///|
/// unify_raw
fn step_60() -> Unit raise {
  unify_raw_c.set(@nums.new_specification(@list.List(["unify"]))(unify_exists_raw()))
}

///|
let unify_raw_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("unify_raw")

///|
/// `unify_raw`
pub fn unify_raw() -> @kernel.Thm {
  unify_raw_c.get()
}

///|
/// unify
fn step_61() -> Unit raise {
  let t1499 = @simp.asm_rewrite_tac(@list.List([@pair.fst(), @pair.snd(), @lists.hd(), @lists.tl(), @lists.not_cons_nil(), tpcases()]))
  let t1498 = @simp.gen_rewrite_tac(fn(x1495 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1496 = @equal.land_conv(x1495)
    fn(x1497 : @kernel.Term) -> @kernel.Thm raise {
      s1496(x1497)
    }
  }, @list.List([unify_raw()]))
  let t1500 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.repeat_tac(@tactics.conj_tac)), t1498), t1499)
  unify_c.set(@tactics.prove(@term_syntax.parse_term("LOOPFREE((env : List[(Num, Term)])) → unify((env, CONS((Fn((f : Num), (fargs : List[Term])), Fn((g : Num), (gargs : List[Term]))), (oth : List[(Term, Term)])))) == (if f == g && LENGTH(fargs) == LENGTH(gargs) { unify((env, APPEND(ZIP(fargs, gargs), oth))) } else { NONE }) && unify((env, CONS((V((x : Num)), (t : Term)), oth))) == (if MEM(x, MAP(FST, env)) { unify((env, CONS((ASSOC(x, env), t), oth))) } else { if istriv(env, x, t) == Exception { NONE } else { if istriv(env, x, t) == TT { unify((env, oth)) } else { unify((CONS((x, t), env), oth)) } } }) && unify((env, CONS((Fn(f, fargs), V(x)), oth))) == unify((env, CONS((V(x), Fn(f, fargs)), oth)))"), t1500))
}

///|
let unify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("unify")

///|
/// `unify`
pub fn unify() -> @kernel.Thm {
  unify_c.get()
}

///|
/// unifies
fn step_62() -> Unit raise {
  unifies_c.set(@pair.new_definition(@term_syntax.parse_term("(unifies : ((Num) -> Term, List[(Term, Term)]) -> Bool)((i : (Num) -> Term), (l : List[(Term, Term)])) == ALL(GABS((f : ((Term, Term)) -> Bool) => ∀ s : Term, ∀ t : Term, GEQ(f((s, t)), termsubst(i, s) == termsubst(i, t))), l)")))
}

///|
let unifies_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("unifies")

///|
/// `unifies`
pub fn unifies() -> @kernel.Thm {
  unifies_c.get()
}

///|
/// OPTION_DISTINCT
fn step_63() -> Unit raise {
  option_distinct_c.set(@ind_types.prove_constructors_distinct(@ind_types.option_recursion()))
}

///|
let option_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPTION_DISTINCT")

///|
/// `OPTION_DISTINCT`
pub fn option_distinct() -> @kernel.Thm {
  option_distinct_c.get()
}

///|
/// OPTION_INJ
fn step_64() -> Unit raise {
  option_inj_c.set(@ind_types.prove_constructors_injective(@ind_types.option_recursion()))
}

///|
let option_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OPTION_INJ")

///|
/// `OPTION_INJ`
pub fn option_inj() -> @kernel.Thm {
  option_inj_c.get()
}

///|
/// TC_SUB1_IRREFL
fn step_65() -> Unit raise {
  let t1508 = @simp.rewrite_tac(@list.List([@rstc.wf_tc(), wf_sub1()]))
  let t1507 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t1506 = @tactics.match_mp_tac(@wf.wf_refl())
  let t1505 = @tactics.disch_then(fn(x1502 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1503 = @tactics.subst1_tac(x1502)
    fn(x1504 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1503(x1504)
    }
  })
  let t1501 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → !(b : Bool)) == (b → !a)"))]))
  let t1509 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1501), t1505), t1506), t1507), t1508)
  tc_sub1_irrefl_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, TC(SUB1, s, t) → !(s == t)"), t1509))
}

///|
let tc_sub1_irrefl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TC_SUB1_IRREFL")

///|
/// `TC_SUB1_IRREFL`
pub fn tc_sub1_irrefl() -> @kernel.Thm {
  tc_sub1_irrefl_c.get()
}

///|
/// UNIFY_OCCURS
fn step_66() -> Unit raise {
  let t1553 = @meson.asm_meson_tac(@list.List([]))
  let t1552 = @simp.rewrite_tac(@list.List([@lists.mem_map()]))
  let t1551 = @tactics.exists_tac(@term_syntax.parse_term("MAP(termsubst((i : (Num) -> Term)), (args : List[Term]))"))
  let t1550 = @tactics.exists_tac(@term_syntax.parse_term("(f : Num)"))
  let t1554 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([sub1()])), t1550), t1551), t1552), t1553)
  let t1549 = @meson.asm_meson_tac(@list.List([]))
  let t1548 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t1555 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ALL((t : Term) => ∀ y : Num, IN(y, FVT(t)) → RTC(SUB1, (i : (Num) -> Term)(y), termsubst(i, t)), (args : List[Term]))")), t1548), t1549), t1554])
  let t1547 = @tactics.exists_tac(@term_syntax.parse_term("termsubst((i : (Num) -> Term), (s : Term))"))
  let t1546 = @tactics.match_mp_tac(@rstc.rtc_trans_l())
  let t1545 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Term)"))(@tactics.strip_assume_tac))
  let t1544 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.ex_mem())]))
  let t1543 = @simp.rewrite_tac(@list.List([@lists.ex_map(), @trivia.o_def()]))
  let t1542 = @simp.rewrite_tac(@list.List([@fol.in_list_union()]))
  let t1541 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t1539 = @term_syntax.parse_term("(args : List[Term])")
  let t1540 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : Num)"), t1539]))
  let t1538 = @simp.simp_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty(), @fol.termsubst(), @rstc.rtc_refl()]))
  let t1537 = @tactics.match_mp_tac(@fol.term_induct())
  let t1535 = @term_syntax.parse_term("(t : Term)")
  let t1536 = @tactics.spec_tac(@term_syntax.parse_term("(t : Term)"), t1535)
  let t1533 = @term_syntax.parse_term("(y : Num)")
  let t1534 = @tactics.spec_tac(@term_syntax.parse_term("(y : Num)"), t1533)
  let t1532 = @tactics.undisch_tac(@term_syntax.parse_term("IN((y : Num), FVT((t : Term)))"))
  let t1531 = @simp.asm_simp_tac(@list.List([]))
  let t1530 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1526 = @term_syntax.parse_term("((x : Num), (t : Term))")
  let t1529 = @tactics.disch_then(fn(x1528 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1523 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1524 = @tactics.mp_tac(x1523)
      fn(x1525 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1524(x1525)
      }
    })(((x1527 : @kernel.Thm) => @bool.spec(t1526, x1527))(x1528))
  })
  let t1520 = @simp.gen_rewrite_rule(fn(x1519 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1519
  }, @list.List([@equal.gsym(@lists.all_mem())]))
  let t1522 = @tactics.first_assum(fn(x1521 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1516 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1517 = @tactics.mp_tac(x1516)
      fn(x1518 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1517(x1518)
      }
    })(t1520(x1521))
  })
  let t1515 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : Term)"))(@tactics.strip_assume_tac))
  let t1514 = @simp.rewrite_tac(@list.List([occ()]))
  let t1513 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1512 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@rstc.rtc_trans()]))])
  let t1511 = @simp.rewrite_tac(@list.List([@rstc.rtc_refl()]))
  let t1510 = @tactics.match_mp_tac(@rstc.rtc_induct())
  let t1556 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1510), t1511), @tactics.conj_tac), t1512), t1513), t1514), t1515), t1522), t1529), t1530), t1531), @tactics.disch_tac), t1532), t1534), t1536), t1537), t1538), t1540), @tactics.disch_tac), t1541), t1542), t1543), t1544), t1545), t1546), t1547), @tactics.conj_tac), t1555)
  unify_occurs_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ i : (Num) -> Term, ALL(GABS((f : ((Num, Term)) -> Bool) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), i(x) == termsubst(i, t))), env) → (∀ x : Num, ∀ y : Num, RTC(OCC(env), x, y) → RTC(SUB1, i(y), i(x)))"), t1556))
}

///|
let unify_occurs_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFY_OCCURS")

///|
/// `UNIFY_OCCURS`
pub fn unify_occurs() -> @kernel.Thm {
  unify_occurs_c.get()
}

///|
/// UNIFY_OCCURS_PROPER
fn step_67() -> Unit raise {
  let t1643 = @meson.asm_meson_tac(@list.List([]))
  let t1644 = @tactics.then_tac(@simp.rewrite_tac(@list.List([sub1()])), t1643)
  let t1642 = @meson.asm_meson_tac(@list.List([]))
  let t1641 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t1645 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ALL((t : Term) => ∀ y : Num, IN(y, FVT(t)) → RTC(SUB1, V(y), t), (args : List[Term]))")), t1641), t1642), t1644])
  let t1640 = @tactics.exists_tac(@term_syntax.parse_term("(s : Term)"))
  let t1639 = @tactics.match_mp_tac(@rstc.rtc_trans_l())
  let t1638 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Term)"))(@tactics.strip_assume_tac))
  let t1637 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.ex_mem())]))
  let t1636 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t1635 = @simp.rewrite_tac(@list.List([@lists.ex_map(), @trivia.o_def()]))
  let t1634 = @simp.rewrite_tac(@list.List([@fol.in_list_union()]))
  let t1632 = @term_syntax.parse_term("(args : List[Term])")
  let t1633 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : Num)"), t1632]))
  let t1631 = @simp.simp_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty(), @rstc.rtc_refl()]))
  let t1630 = @tactics.match_mp_tac(@fol.term_induct())
  let t1628 = @meson.asm_meson_tac(@list.List([]))
  let t1627 = @simp.asm_rewrite_tac(@list.List([@fol.termsubst(), @lists.mem_map()]))
  let t1625 = @term_syntax.parse_term("MAP(termsubst((i : (Num) -> Term)), (args : List[Term]))")
  let t1626 = @tactics.map_every(fn(x1622 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1623 = @tactics.exists_tac(x1622)
    fn(x1624 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1623(x1624)
    }
  }, @list.List([@term_syntax.parse_term("(f : Num)"), t1625]))
  let t1620 = @tactics.x_choose_then(@term_syntax.parse_term("(args : List[Term])"))(@tactics.strip_assume_tac)
  let t1621 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : Num)"))(t1620))
  let t1619 = @simp.rewrite_tac(@list.List([sub1()]))
  let t1618 = @tactics.disch_then(fn(x1615 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1615
    let t1617 = @tactics.mp_tac(th_1)
    @tactics.then_tac(@tactics.match_mp_tac(@rstc.tc_inc()), t1617)
  })
  let t1613 = @term_syntax.parse_term("(u : Term)")
  let t1614 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : Term)"), t1613]))
  let t1612 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@rstc.tc_trans()]))])
  let t1611 = @tactics.match_mp_tac(@rstc.tc_induct())
  let t1610 = @tactics.subgoal_then(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, TC(SUB1, s, t) → TC(SUB1, termsubst((i : (Num) -> Term), s), termsubst(i, t))"), fn(x1608 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1608
    @meson.meson_tac(@list.List([th, @fol.termsubst()]))
  })
  let t1629 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@rstc.rtc(), @rstc.rc_cases()])), t1610), t1611), @tactics.conj_tac), t1612), t1614), t1618), t1619), t1621), t1626), t1627), t1628)])
  let t1607 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Term, ∀ y : Num, IN(y, FVT(t)) → RTC(SUB1, V(y), t)"), fn(x1604 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1605 = @tactics.mp_tac(x1604)
    fn(x1606 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1605(x1606)
    }
  })
  let t1603 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([eqv(), @rstc.rtc_inc()]))])
  let t1602 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Term, ∀ y : Num, IN(y, FVT(t)) → t == V(y) || TC(SUB1, (i : (Num) -> Term)(y), termsubst(i, t))"), fn(x1599 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1600 = @tactics.mp_tac(x1599)
    fn(x1601 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1600(x1601)
    }
  })
  let t1598 = @simp.asm_simp_tac(@list.List([]))
  let t1597 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1593 = @term_syntax.parse_term("((x : Num), (t : Term))")
  let t1596 = @tactics.disch_then(fn(x1595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1591 = @tactics.mp_tac(x1590)
      fn(x1592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1591(x1592)
      }
    })(((x1594 : @kernel.Thm) => @bool.spec(t1593, x1594))(x1595))
  })
  let t1587 = @simp.gen_rewrite_rule(fn(x1586 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1586
  }, @list.List([@equal.gsym(@lists.all_mem())]))
  let t1589 = @tactics.first_assum(fn(x1588 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1583 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1584 = @tactics.mp_tac(x1583)
      fn(x1585 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1584(x1585)
      }
    })(t1587(x1588))
  })
  let t1582 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1576 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1577 = @tactics.assume_tac(x1576)
    fn(x1578 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1577(x1578)
    }
  }, fn(x1579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1580 = @tactics.mp_tac(x1579)
    fn(x1581 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1580(x1581)
    }
  }))
  let t1575 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : Term)"))(fn(x1572 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1573 = @tactics.mp_tac(x1572)
    fn(x1574 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1573(x1574)
    }
  }))
  let t1571 = @simp.rewrite_tac(@list.List([occ()]))
  let t1570 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1568 = @meson.asm_meson_tac(@list.List([eqv_imp_occ(), @rstc.rtc_mono()]))
  let t1565 = @drule.match_mp(unify_occurs())
  let t1567 = @tactics.first_assum(fn(x1566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1565(x1566))
  })
  let t1564 = @simp.asm_rewrite_tac(@list.List([]))
  let t1563 = @tactics.exists_tac(@term_syntax.parse_term("(i : (Num) -> Term)((y : Num))"))
  let t1559 = @meson.asm_meson_tac(@list.List([@rstc.tc_trans()]))
  let t1560 = @tactics.then_tac(@tactics.disj2_tac, @simp.once_rewrite_tac(@list.List([@rstc.tc_rtc_tc_cases()])))
  let t1561 = @tactics.then_tac(@tactics.disj2_tac, @simp.once_rewrite_tac(@list.List([@rstc.tc_tc_rtc_cases()])))
  let t1562 = @list.List([@meson.asm_meson_tac(@list.List([@rstc.rtc_trans()])), t1561, t1560, t1559])
  let t1569 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.repeat_tac(@tactics.strip_tac), t1562), t1563), t1564), t1567), t1568)])
  let t1558 = @simp.rewrite_tac(@list.List([@rstc.rtc_refl()]))
  let t1557 = @tactics.match_mp_tac(@rstc.rtc_induct())
  let t1646 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t1557), t1558), @tactics.conj_tac), t1569), t1570), t1571), t1575), t1582), t1589), t1596), t1597), t1598), @tactics.disch_tac), t1602), t1603), t1607), t1629), t1630), t1631), t1633), @tactics.disch_tac), t1634), t1635), t1636), t1637), t1638), t1639), t1640), @tactics.conj_tac), t1645)
  unify_occurs_proper_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ i : (Num) -> Term, ALL(GABS((f : ((Num, Term)) -> Bool) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), i(x) == termsubst(i, t))), env) → (∀ x : Num, ∀ y : Num, RTC(OCC(env), x, y) → RTC(EQV(env), x, y) || TC(SUB1, i(y), i(x)))"), t1646))
}

///|
let unify_occurs_proper_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFY_OCCURS_PROPER")

///|
/// `UNIFY_OCCURS_PROPER`
pub fn unify_occurs_proper() -> @kernel.Thm {
  unify_occurs_proper_c.get()
}

///|
/// GOODLOOP_UNIFIABLE
fn step_68() -> Unit raise {
  let t1696 = @meson.asm_meson_tac(@list.List([@fol.termsubst()]))
  let t1695 = @simp.asm_simp_tac(@list.List([]))
  let t1694 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1693 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t1692 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1691 = @simp.gen_rewrite_tac(fn(x1690 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1690
  }, @list.List([@pair.forall_pair_thm()]))
  let t1689 = @simp.rewrite_tac(@list.List([@lists.all(), @lists.mem()]))
  let t1688 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1686 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t1687 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t1686)
  let t1685 = @tactics.undisch_tac(@term_syntax.parse_term("ALL(GABS((f : ((Num, Term)) -> Bool) => ∀ p1 : Num, ∀ p2 : Term, GEQ(f((p1, p2)), (i : (Num) -> Term)(p1) == termsubst(i, p2))), (env : List[(Num, Term)]))"))
  let t1684 = @simp.rewrite_tac(@list.List([eqv()]))
  let t1682 = @term_syntax.parse_term("(v : Num)")
  let t1683 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Num)"), t1682]))
  let t1681 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t1680 = @tactics.match_mp_tac(@rstc.rtc_induct())
  let t1679 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Num, ∀ y : Num, RTC(EQV((env : List[(Num, Term)])), x, y) → (i : (Num) -> Term)(x) == i(y)"), fn(x1677 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1677
    @meson.meson_tac(@list.List([th, @fol.termsubst()]))
  })
  let t1676 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj_alt()]))
  let t1675 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t1673 = @term_syntax.parse_term("(x : Num)")
  let t1674 = @tactics.spec_tac(@term_syntax.parse_term("(x : Num)"), t1673)
  let t1672 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1671 = @tactics.undisch_tac(@term_syntax.parse_term("∃ y : Num, (t : Term) == V(y) && RTC(EQV((env : List[(Num, Term)])), y, (x : Num))"))
  let t1670 = @simp.rewrite_tac(@list.List([@fol.termsubst()]))
  let t1669 = @tactics.conv_tac(@equal.redepth_conv(@pair.gen_beta_conv))
  let t1668 = @simp.rewrite_tac(@list.List([]))
  let t1667 = @simp.gen_rewrite_tac(fn(x1666 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1660 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1661 = @equal.land_conv(x1660)
      fn(x1662 : @kernel.Term) -> @kernel.Thm raise {
        s1661(x1662)
      }
    })((fn(x1663 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1664 = @equal.land_conv(x1663)
      fn(x1665 : @kernel.Term) -> @kernel.Thm raise {
        s1664(x1665)
      }
    })(x1666))
  }, @list.List([@equal.gsym(paired_eta_thm())]))
  let t1659 = @simp.rewrite_tac(@list.List([@lists.all_map(), @trivia.o_def()]))
  let t1658 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) && (b : Bool)) == b) == (b → a)"))]))
  let t1657 = @simp.rewrite_tac(@list.List([unifies(), @lists.all()]))
  let t1656 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : (Num) -> Term)"))
  let t1655 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.rewrite_tac(@list.List([retval_distinct()]))))
  let t1654 = @simp.asm_simp_tac(@list.List([istriv_works()]))
  let t1653 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x1647 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1648 = @tactics.assume_tac(x1647)
    fn(x1649 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1648(x1649)
    }
  }, fn(x1650 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1651 = @tactics.mp_tac(x1650)
    fn(x1652 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1651(x1652)
    }
  })))
  let t1697 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1653), t1654), t1655), t1656), t1657), t1658), t1659), t1667), t1668), t1669), t1670), @tactics.disch_tac), t1671), t1672), t1674), t1675), t1676), t1679), t1680), @tactics.conj_tac), t1681), t1683), t1684), t1685), t1687), t1688), t1689), t1691), t1692), t1693), t1694), t1695), t1696)
  goodloop_unifiable_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ x : Num, ∀ t : Term, LOOPFREE(env) && CONFLICTFREE(env) && istriv(env, x, t) == TT → (∀ i : (Num) -> Term, unifies(i, CONS((V(x), t), MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env))) == unifies(i, MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env)))"), t1697))
}

///|
let goodloop_unifiable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GOODLOOP_UNIFIABLE")

///|
/// `GOODLOOP_UNIFIABLE`
pub fn goodloop_unifiable() -> @kernel.Thm {
  goodloop_unifiable_c.get()
}

///|
/// BADLOOP_UNUNIFIABLE
fn step_69() -> Unit raise {
  let t1851 = @meson.asm_meson_tac(@list.List([]))
  let t1852 = @tactics.then_tac(@simp.rewrite_tac(@list.List([sub1()])), t1851)
  let t1850 = @meson.asm_meson_tac(@list.List([]))
  let t1849 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t1853 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ALL((t : Term) => ∀ y : Num, IN(y, FVT(t)) → RTC(SUB1, V(y), t), (args : List[Term]))")), t1849), t1850), t1852])
  let t1848 = @tactics.exists_tac(@term_syntax.parse_term("(s : Term)"))
  let t1847 = @tactics.match_mp_tac(@rstc.rtc_trans_l())
  let t1846 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Term)"))(@tactics.strip_assume_tac))
  let t1845 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.ex_mem())]))
  let t1844 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t1843 = @simp.rewrite_tac(@list.List([@lists.ex_map(), @trivia.o_def()]))
  let t1842 = @simp.rewrite_tac(@list.List([@fol.in_list_union()]))
  let t1840 = @term_syntax.parse_term("(args : List[Term])")
  let t1841 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : Num)"), t1840]))
  let t1839 = @simp.simp_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty(), @rstc.rtc_refl()]))
  let t1838 = @tactics.match_mp_tac(@fol.term_induct())
  let t1836 = @meson.asm_meson_tac(@list.List([]))
  let t1835 = @simp.asm_rewrite_tac(@list.List([@fol.termsubst(), @lists.mem_map()]))
  let t1833 = @term_syntax.parse_term("MAP(termsubst((i : (Num) -> Term)), (args : List[Term]))")
  let t1834 = @tactics.map_every(fn(x1830 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1831 = @tactics.exists_tac(x1830)
    fn(x1832 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1831(x1832)
    }
  }, @list.List([@term_syntax.parse_term("(f : Num)"), t1833]))
  let t1828 = @tactics.x_choose_then(@term_syntax.parse_term("(args : List[Term])"))(@tactics.strip_assume_tac)
  let t1829 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : Num)"))(t1828))
  let t1827 = @simp.rewrite_tac(@list.List([sub1()]))
  let t1826 = @tactics.disch_then(fn(x1823 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x1823
    let t1825 = @tactics.mp_tac(th_4)
    @tactics.then_tac(@tactics.match_mp_tac(@rstc.rtc_inc()), t1825)
  })
  let t1821 = @term_syntax.parse_term("(u : Term)")
  let t1822 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : Term)"), t1821]))
  let t1820 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@rstc.rtc_trans()]))])
  let t1819 = @simp.rewrite_tac(@list.List([@rstc.rtc_refl()]))
  let t1818 = @tactics.match_mp_tac(@rstc.rtc_induct())
  let t1837 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, RTC(SUB1, s, t) → RTC(SUB1, termsubst((i : (Num) -> Term), s), termsubst(i, t))"), fn(x1816 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x1816
    @meson.asm_meson_tac(@list.List([th_3, @fol.termsubst()]))
  }), t1818), t1819), @tactics.conj_tac), t1820), t1822), t1826), t1827), t1829), t1834), t1835), t1836)])
  let t1815 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Term, ∀ y : Num, IN(y, FVT(t)) → RTC(SUB1, V(y), t)"), fn(x1812 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1813 = @tactics.mp_tac(x1812)
    fn(x1814 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1813(x1814)
    }
  })
  let t1810 = @simp.asm_rewrite_tac(@list.List([]))
  let t1805 = @term_syntax.parse_term("(x : Num)")
  let t1806 = @list.List([@term_syntax.parse_term("(y : Num)"), t1805])
  let t1809 = @tactics.disch_then(fn(x1808 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1802 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1803 = @tactics.mp_tac(x1802)
      fn(x1804 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1803(x1804)
      }
    })(((x1807 : @kernel.Thm) => @bool.specl(t1806, x1807))(x1808))
  })
  let t1800 = @drule.match_mp(unify_occurs_proper())
  let t1811 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1801 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1797 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1798 = @tactics.mp_tac(x1797)
      fn(x1799 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1798(x1799)
      }
    })(t1800(x1801))
  }), t1809), t1810), @tactics.all_tac])
  let t1796 = @tactics.exists_tac(@term_syntax.parse_term("(i : (Num) -> Term)((y : Num))"))
  let t1795 = @simp.once_rewrite_tac(@list.List([@rstc.tc_tc_rtc_cases()]))
  let t1794 = @tactics.match_mp_tac(tc_sub1_irrefl())
  let t1790 = @meson.asm_meson_tac(@list.List([]))
  let t1791 = @tactics.then_tac(@simp.rewrite_tac(@list.List([sub1()])), t1790)
  let t1789 = @meson.asm_meson_tac(@list.List([]))
  let t1788 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t1792 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ALL((t : Term) => ∀ y : Num, IN(y, FVT(t)) → RTC(SUB1, V(y), t), (args : List[Term]))")), t1788), t1789), t1791])
  let t1787 = @tactics.exists_tac(@term_syntax.parse_term("(s : Term)"))
  let t1786 = @tactics.match_mp_tac(@rstc.rtc_trans_l())
  let t1785 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Term)"))(@tactics.strip_assume_tac))
  let t1784 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.ex_mem())]))
  let t1783 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t1782 = @simp.rewrite_tac(@list.List([@lists.ex_map(), @trivia.o_def()]))
  let t1781 = @simp.rewrite_tac(@list.List([@fol.in_list_union()]))
  let t1779 = @term_syntax.parse_term("(args : List[Term])")
  let t1780 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : Num)"), t1779]))
  let t1778 = @simp.simp_tac(@list.List([@fol.fvt(), @sets.in_insert(), @sets.not_in_empty(), @rstc.rtc_refl()]))
  let t1777 = @tactics.match_mp_tac(@fol.term_induct())
  let t1775 = @meson.asm_meson_tac(@list.List([]))
  let t1774 = @simp.asm_rewrite_tac(@list.List([@fol.termsubst(), @lists.mem_map()]))
  let t1772 = @term_syntax.parse_term("MAP(termsubst((i : (Num) -> Term)), (args : List[Term]))")
  let t1773 = @tactics.map_every(fn(x1769 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1770 = @tactics.exists_tac(x1769)
    fn(x1771 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1770(x1771)
    }
  }, @list.List([@term_syntax.parse_term("(f : Num)"), t1772]))
  let t1767 = @tactics.x_choose_then(@term_syntax.parse_term("(args : List[Term])"))(@tactics.strip_assume_tac)
  let t1768 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : Num)"))(t1767))
  let t1766 = @simp.rewrite_tac(@list.List([sub1()]))
  let t1765 = @tactics.disch_then(fn(x1762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1762
    let t1764 = @tactics.mp_tac(th_2)
    @tactics.then_tac(@tactics.match_mp_tac(@rstc.tc_inc()), t1764)
  })
  let t1760 = @term_syntax.parse_term("(u : Term)")
  let t1761 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : Term)"), t1760]))
  let t1759 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([@rstc.tc_trans()]))])
  let t1758 = @tactics.match_mp_tac(@rstc.tc_induct())
  let t1757 = @tactics.subgoal_then(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, TC(SUB1, s, t) → TC(SUB1, termsubst((i : (Num) -> Term), s), termsubst(i, t))"), fn(x1755 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1755
    @meson.meson_tac(@list.List([th_1, @fol.termsubst()]))
  })
  let t1776 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@rstc.rtc(), @rstc.rc_cases()])), t1757), t1758), @tactics.conj_tac), t1759), t1761), t1765), t1766), t1768), t1773), t1774), t1775)])
  let t1754 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Term, ∀ y : Num, IN(y, FVT(t)) → RTC(SUB1, V(y), t)"), fn(x1751 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1752 = @tactics.mp_tac(x1751)
    fn(x1753 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1752(x1753)
    }
  })
  let t1750 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Term, ∀ y : Num, IN(y, FVT(t)) → t == V(y) || TC(SUB1, (i : (Num) -> Term)(y), termsubst(i, t))"), fn(x1748 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1748
    @meson.asm_meson_tac(@list.List([th]))
  })
  let t1746 = @simp.asm_rewrite_tac(@list.List([]))
  let t1744 = @drule.match_mp(unify_occurs())
  let t1747 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x1745 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1744(x1745))
  }), t1746), @tactics.all_tac])
  let t1743 = @tactics.exists_tac(@term_syntax.parse_term("(i : (Num) -> Term)((y : Num))"))
  let t1742 = @simp.once_rewrite_tac(@list.List([@rstc.tc_rtc_tc_cases()]))
  let t1741 = @tactics.match_mp_tac(tc_sub1_irrefl())
  let t1793 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.strip_tac), t1741), t1742), t1743), @tactics.conj_tac), t1747), t1750), t1754), t1776), t1777), t1778), t1780), @tactics.disch_tac), t1781), t1782), t1783), t1784), t1785), t1786), t1787), @tactics.conj_tac), t1792), @tactics.all_tac])
  let t1740 = @simp.asm_rewrite_tac(@list.List([]))
  let t1739 = @class.asm_cases_tac(@term_syntax.parse_term("RTC(EQV((env : List[(Num, Term)])), (y : Num), (x : Num))"))
  let t1735 = @term_syntax.parse_term("(y : Num)")
  let t1738 = @tactics.disch_then(fn(x1737 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1732 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1733 = @tactics.mp_tac(x1732)
      fn(x1734 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1733(x1734)
      }
    })(((x1736 : @kernel.Thm) => @bool.spec(t1735, x1736))(x1737))
  })
  let t1729 = @simp.gen_rewrite_rule(fn(x1728 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1728
  }, @list.List([@class.not_exists_thm()]))
  let t1731 = @tactics.first_x_assum(fn(x1730 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1725 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1726 = @tactics.mp_tac(x1725)
      fn(x1727 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1726(x1727)
      }
    })(t1729(x1730))
  })
  let t1724 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Num)"))
  let t1723 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1722 = @tactics.undisch_tac(@term_syntax.parse_term("∃ y : Num, IN(y, FVT((t : Term))) && RTC(OCC((env : List[(Num, Term)])), y, (x : Num))"))
  let t1721 = @simp.rewrite_tac(@list.List([@fol.termsubst()]))
  let t1720 = @tactics.conv_tac(@equal.redepth_conv(@pair.gen_beta_conv))
  let t1719 = @simp.rewrite_tac(@list.List([]))
  let t1718 = @simp.gen_rewrite_tac(fn(x1717 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1711 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1712 = @equal.land_conv(x1711)
      fn(x1713 : @kernel.Term) -> @kernel.Thm raise {
        s1712(x1713)
      }
    })((fn(x1714 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1715 = @equal.land_conv(x1714)
      fn(x1716 : @kernel.Term) -> @kernel.Thm raise {
        s1715(x1716)
      }
    })(x1717))
  }, @list.List([@equal.gsym(paired_eta_thm())]))
  let t1710 = @simp.rewrite_tac(@list.List([@lists.all_map(), @trivia.o_def()]))
  let t1709 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → !(a : Bool)) → !(a && b)")))
  let t1708 = @simp.rewrite_tac(@list.List([unifies(), @lists.all()]))
  let t1707 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : (Num) -> Term)"))
  let t1706 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.rewrite_tac(@list.List([retval_distinct()]))))
  let t1705 = @simp.asm_simp_tac(@list.List([istriv_works()]))
  let t1704 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x1698 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1699 = @tactics.assume_tac(x1698)
    fn(x1700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1699(x1700)
    }
  }, fn(x1701 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1702 = @tactics.mp_tac(x1701)
    fn(x1703 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1702(x1703)
    }
  })))
  let t1854 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1704), t1705), t1706), t1707), t1708), t1709), t1710), t1718), t1719), t1720), t1721), @tactics.disch_tac), t1722), t1723), t1724), t1731), t1738), t1739), t1740), t1793), @tactics.strip_tac), t1794), t1795), t1796), @tactics.conj_tac), t1811), t1815), t1837), t1838), t1839), t1841), @tactics.disch_tac), t1842), t1843), t1844), t1845), t1846), t1847), t1848), @tactics.conj_tac), t1853)
  badloop_ununifiable_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ x : Num, ∀ t : Term, LOOPFREE(env) && CONFLICTFREE(env) && istriv(env, x, t) == Exception → (∀ i : (Num) -> Term, !unifies(i, CONS((V(x), t), MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env))))"), t1854))
}

///|
let badloop_ununifiable_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BADLOOP_UNUNIFIABLE")

///|
/// `BADLOOP_UNUNIFIABLE`
pub fn badloop_ununifiable() -> @kernel.Thm {
  badloop_ununifiable_c.get()
}

///|
/// UNIFY_WORKS_RAW
fn step_70() -> Unit raise {
  let t2126 = @simp.asm_simp_tac(@list.List([@nums.suc_inj(), @lists.cons_11()]))
  let t2125 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t2124 = @simp.asm_rewrite_tac(@list.List([@lists.length(), @lists.all(), @lists.map(), @nums.not_suc(), @lists.zip()]))
  let t2122 = @term_syntax.parse_term("(fargs : List[Term])")
  let t2123 = @tactics.spec_tac(@term_syntax.parse_term("(fargs : List[Term])"), t2122)
  let t2120 = @term_syntax.parse_term("(gargs : List[Term])")
  let t2121 = @tactics.spec_tac(@term_syntax.parse_term("(gargs : List[Term])"), t2120)
  let t2119 = @tactics.first_assum(fn(x2118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2115 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2116 = @tactics.mp_tac(x2115)
      fn(x2117 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2116(x2117)
      }
    })(@bool.conjunct2(x2118))
  })
  let t2114 = @simp.rewrite_tac(@list.List([@fol.termsubst(), @fol.term_inj()]))
  let t2113 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t2112 = @simp.rewrite_tac(@list.List([unifies(), @lists.all(), @lists.all_append()]))
  let t2111 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : (Num) -> Term)"))
  let t2110 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : (Num) -> Term, unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), (env : List[(Num, Term)])), APPEND(ZIP((fargs : List[Term]), (gargs : List[Term])), (oth : List[(Term, Term)])))) == unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env), CONS((Fn((g : Num), fargs), Fn(g, gargs)), oth)))"), fn(x2108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x2108
    @simp.rewrite_tac(@list.List([th_3]))
  })
  let t2106 = @meson.asm_meson_tac(@list.List([]))
  let t2107 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([callorder(), cright()])), @tactics.disj2_tac), @tactics.disj1_tac), t2106), @tactics.all_tac])
  let t2105 = @simp.asm_rewrite_tac(@list.List([]))
  let t2100 = @term_syntax.parse_term("APPEND(ZIP((fargs : List[Term]), (gargs : List[Term])), (oth : List[(Term, Term)]))")
  let t2101 = @list.List([@term_syntax.parse_term("(env : List[(Num, Term)])"), t2100])
  let t2104 = @tactics.first_x_assum(fn(x2103 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2097 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2098 = @tactics.mp_tac(x2097)
      fn(x2099 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2098(x2099)
      }
    })(((x2102 : @kernel.Thm) => @bool.specl(t2101, x2102))(x2103))
  })
  let t2095 = @meson.asm_meson_tac(@list.List([@lists.length_map()]))
  let t2094 = @simp.rewrite_tac(@list.List([@fol.termsubst(), @fol.term_inj()]))
  let t2093 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t2096 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([unifies(), @lists.all(), @lists.all_append()])), t2093), t2094), t2095)])
  let t2127 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([option_distinct()]))), t2096), t2104), t2105), @tactics.ants_tac), t2107), t2110), t2111), t2112), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2113), t2114), t2119), t2121), t2123), @lists.list_induct_tac), @lists.list_induct_tac), t2124), t2125), t2126)
  let t2092 = @simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()]))
  let t2091 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t2090 = @simp.rewrite_tac(@list.List([unifies(), @lists.all_append(), @lists.all()]))
  let t2088 = @meson.asm_meson_tac(@list.List([]))
  let t2087 = @tactics.repeat_tac(@tactics.disj2_tac)
  let t2089 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([callorder(), cright()])), t2087), t2088), @tactics.all_tac])
  let t2086 = @simp.asm_rewrite_tac(@list.List([]))
  let t2082 = @term_syntax.parse_term("CONS((V((x : Num)), Fn((f : Num), (fargs : List[Term]))), (oth : List[(Term, Term)]))")
  let t2083 = @list.List([@term_syntax.parse_term("(env : List[(Num, Term)])"), t2082])
  let t2128 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2085 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2079 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2080 = @tactics.mp_tac(x2079)
      fn(x2081 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2080(x2081)
      }
    })(((x2084 : @kernel.Thm) => @bool.specl(t2083, x2084))(x2085))
  }), t2086), @tactics.ants_tac), t2089), t2090), t2091), t2092)
  let t2078 = @tactics.conv_tac(@class.taut)
  let t2077 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t2076 = @simp.rewrite_tac(@list.List([unifies(), @lists.all_append(), @lists.all(), @lists.map()]))
  let t2075 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : (Num) -> Term, unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), CONS(((x : Num), (t : Term)), (env : List[(Num, Term)]))), (oth : List[(Term, Term)]))) == unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env), CONS((V(x), t), oth)))"), fn(x2073 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x2073
    @simp.rewrite_tac(@list.List([th_2]))
  })
  let t2071 = @simp.asm_rewrite_tac(@list.List([]))
  let t2070 = @simp.rewrite_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t2069 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t2068 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(h : (Num, Term))"), @pair.pair())))
  let t2067 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @lists.map(), @lists.filter(), @lists.not_cons_nil()]))
  let t2065 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t2066 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t2065)
  let t2064 = @tactics.undisch_tac(@term_syntax.parse_term("!MEM((x : Num), MAP(FST, (env : List[(Num, Term)])))"))
  let t2063 = @simp.rewrite_tac(@list.List([@lists.length_eq_nil()]))
  let t2062 = @tactics.undisch_then(@term_syntax.parse_term("(x : Num) == (y : Num)"), fn(x2061 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2058 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2059 = @tactics.subst_all_tac(x2058)
      fn(x2060 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2059(x2060)
      }
    })(@equal.sym(x2061))
  })
  let t2057 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) == 0 → (y : Num) <= (z : Num) → SUC(x) <= 1")))
  let t2056 = @simp.asm_rewrite_tac(@list.List([@lists.length()]))
  let t2055 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == (y : Num)"))
  let t2054 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Num)"))
  let t2053 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t2052 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t2051 = @simp.rewrite_tac(@list.List([conflictfree(), @lists.length(), @lists.filter()]))
  let t2050 = @tactics.undisch_tac(@term_syntax.parse_term("CONFLICTFREE((env : List[(Num, Term)]))"))
  let t2049 = @simp.asm_simp_tac(@list.List([loopfree_preserve_eq()]))
  let t2048 = @simp.asm_rewrite_tac(@list.List([]))
  let t2047 = @simp.asm_rewrite_tac(@list.List([]))
  let t2046 = @simp.asm_rewrite_tac(@list.List([]))
  let t2044 = @term_syntax.parse_term("(t : Term)")
  let t2045 = @term_syntax.parse_term("(x : Num)")
  let t2072 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(env : List[(Num, Term)])"), t2045, t2044]), istriv_works())), t2046), @class.cond_cases_tac), t2047), @class.cond_cases_tac), t2048), @tactics.disch_tac), t2049), t2050), t2051), t2052), t2053), t2054), t2055), t2056), t2057), t2062), t2063), t2064), t2066), @lists.list_induct_tac), t2067), t2068), t2069), t2070), @class.cond_cases_tac), t2071), @tactics.all_tac])
  let t2039 = @simp.asm_rewrite_tac(@list.List([]))
  let t2038 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2037 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_union(), @sets.in_insert()]))
  let t2036 = @simp.rewrite_tac(@list.List([@sets.finite_union(), @fol.fvt_finite(), @sets.finite_insert()]))
  let t2040 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.card_subset()), t2036), t2037), t2038), t2039)
  let t2035 = @simp.asm_simp_tac(@list.List([]))
  let t2034 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @fol.fvt(), @sets.in_union(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2033 = @simp.rewrite_tac(@list.List([@fol.list_union(), @lists.mem(), @lists.map(), @sets.not_in_empty()]))
  let t2032 = @simp.rewrite_tac(@list.List([@fol.fvt()]))
  let t2030 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t2031 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t2030)
  let t2029 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → (a : Bool)) → !a → b → (c : Bool)")))
  let t2028 = @tactics.undisch_tac(@term_syntax.parse_term("!MEM((x : Num), MAP(FST, (env : List[(Num, Term)])))"))
  let t2027 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : Num), FVT(Fn(0, MAP(o(V, FST), (env : List[(Num, Term)])))))"))
  let t2026 = @simp.rewrite_tac(@list.List([]))
  let t2041 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@sets.card_clauses(), @fol.fvt_finite(), @arith.add1()])), @class.cond_cases_tac), t2026), t2027), t2028), t2029), t2031), t2032), @lists.list_induct_tac), t2033), t2034), @tactics.strip_tac), t2035)
  let t2042 = @list.List([@tactics.then_tac(@tactics.ap_term_tac, @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_union(), @theorems.disj_aci(), @sets.in_insert()]))), t2041, t2040])
  let t2025 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2024 = @list.List([@simp.rewrite_tac(@list.List([@fol.fvt(), @lists.map(), @fol.list_union(), @trivia.o_thm(), @pair.fst()])), @tactics.all_tac])
  let t2023 = @tactics.subgoal_then(@term_syntax.parse_term("FVT(Fn(0, CONS((t : Term), MAP(SND, (oth : List[(Term, Term)]))))) == UNION(FVT(t), FVT(Fn(0, MAP(SND, oth))))"), fn(x2020 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2021 = @tactics.subst1_tac(x2020)
    fn(x2022 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2021(x2022)
    }
  })
  let t2019 = @list.List([@simp.rewrite_tac(@list.List([@fol.fvt(), @lists.map(), @fol.list_union(), @trivia.o_thm(), @pair.fst()])), @tactics.all_tac])
  let t2018 = @tactics.subgoal_then(@term_syntax.parse_term("FVT(Fn(0, CONS((t : Term), MAP(SND, (env : List[(Num, Term)]))))) == UNION(FVT(t), FVT(Fn(0, MAP(SND, env))))"), fn(x2015 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2016 = @tactics.subst1_tac(x2015)
    fn(x2017 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2016(x2017)
    }
  })
  let t2013 = @sets.set_tac(@list.List([]))
  let t2014 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.fvt(), @lists.map(), @fol.list_union(), @trivia.o_thm(), @pair.fst()])), t2013), @tactics.all_tac])
  let t2012 = @tactics.subgoal_then(@term_syntax.parse_term("FVT(Fn(0, CONS(V((x : Num)), MAP(FST, (oth : List[(Term, Term)]))))) == INSERT(x, FVT(Fn(0, MAP(FST, oth))))"), fn(x2009 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2010 = @tactics.subst1_tac(x2009)
    fn(x2011 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2010(x2011)
    }
  })
  let t2007 = @sets.set_tac(@list.List([]))
  let t2008 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.fvt(), @lists.map(), @fol.list_union(), @trivia.o_thm(), @pair.fst()])), t2007), @tactics.all_tac])
  let t2006 = @tactics.subgoal_then(@term_syntax.parse_term("FVT(Fn(0, CONS(o(V, FST, ((x : Num), (t : Term))), MAP(o(V, FST), (env : List[(Num, Term)]))))) == INSERT(x, FVT(Fn(0, MAP(o(V, FST), env))))"), fn(x2003 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2004 = @tactics.subst1_tac(x2003)
    fn(x2005 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2004(x2005)
    }
  })
  let t2002 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(a' : Num) == (a : Num) && (b' : Num) == (b : Num) + 1 && b' <= a' → a' - b' < a - b")))
  let t2001 = @simp.rewrite_tac(@list.List([@lists.map(), @pair.fst(), @pair.snd(), @lists.length()]))
  let t2000 = @simp.rewrite_tac(@list.List([@wf.measure(), mleft()]))
  let t2043 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([callorder()])), @tactics.disj1_tac), t2000), t2001), t2002), t2006), t2008), t2012), t2014), t2018), t2019), t2023), t2024), t2025), t2042), @tactics.all_tac])
  let t1999 = @simp.asm_rewrite_tac(@list.List([]))
  let t1994 = @term_syntax.parse_term("(oth : List[(Term, Term)])")
  let t1995 = @list.List([@term_syntax.parse_term("CONS(((x : Num), (t : Term)), (env : List[(Num, Term)]))"), t1994])
  let t1998 = @tactics.first_x_assum(fn(x1997 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1991 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1992 = @tactics.mp_tac(x1991)
      fn(x1993 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1992(x1993)
      }
    })(((x1996 : @kernel.Thm) => @bool.specl(t1995, x1996))(x1997))
  })
  let t1989 = @tactics.conv_tac(@class.taut)
  let t1988 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1987 = @simp.rewrite_tac(@list.List([unifies(), @lists.all_append(), @lists.all()]))
  let t1986 = @simp.asm_rewrite_tac(@list.List([]))
  let t1983 = @term_syntax.parse_term("(t : Term)")
  let t1984 = @term_syntax.parse_term("(x : Num)")
  let t1985 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(env : List[(Num, Term)])"), t1984, t1983]), goodloop_unifiable()))
  let t1982 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : (Num) -> Term, unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), (env : List[(Num, Term)])), CONS((V((x : Num)), (t : Term)), (oth : List[(Term, Term)])))) == unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env), oth))"), fn(x1980 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1980
    @simp.rewrite_tac(@list.List([th_1]))
  })
  let t1978 = @meson.asm_meson_tac(@list.List([]))
  let t1979 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([callorder(), cright()])), @tactics.disj2_tac), @tactics.disj2_tac), @tactics.disj1_tac), t1978), @tactics.all_tac])
  let t1977 = @simp.asm_rewrite_tac(@list.List([]))
  let t1973 = @term_syntax.parse_term("(oth : List[(Term, Term)])")
  let t1974 = @list.List([@term_syntax.parse_term("(env : List[(Num, Term)])"), t1973])
  let t1990 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1976 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1970 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1971 = @tactics.mp_tac(x1970)
      fn(x1972 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1971(x1972)
      }
    })(((x1975 : @kernel.Thm) => @bool.specl(t1974, x1975))(x1976))
  }), t1977), @tactics.ants_tac), t1979), t1982), t1985), t1986), t1987), t1988), @tactics.gen_tac), t1989), @tactics.all_tac])
  let t1969 = @simp.asm_rewrite_tac(@list.List([]))
  let t1968 = @class.asm_cases_tac(@term_syntax.parse_term("istriv((env : List[(Num, Term)]), (x : Num), (t : Term)) == TT"))
  let t1966 = @tactics.conv_tac(@class.taut)
  let t1965 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1964 = @simp.rewrite_tac(@list.List([unifies(), @lists.all_append(), @lists.all()]))
  let t1963 = @simp.asm_rewrite_tac(@list.List([]))
  let t1960 = @term_syntax.parse_term("(t : Term)")
  let t1961 = @term_syntax.parse_term("(x : Num)")
  let t1962 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(env : List[(Num, Term)])"), t1961, t1960]), badloop_ununifiable()))
  let t1967 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([option_distinct()])), t1962), t1963), t1964), t1965), @tactics.gen_tac), t1966), @tactics.all_tac])
  let t1959 = @simp.asm_rewrite_tac(@list.List([]))
  let t1958 = @class.asm_cases_tac(@term_syntax.parse_term("istriv((env : List[(Num, Term)]), (x : Num), (t : Term)) == Exception"))
  let t1956 = @meson.meson_tac(@list.List([]))
  let t1955 = @simp.asm_rewrite_tac(@list.List([@lists.assoc()]))
  let t1954 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Num) == (y : Num)"))
  let t1953 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t1952 = @simp.rewrite_tac(@list.List([@pair.fst(), @pair.snd(), @trivia.o_def()]))
  let t1949 = @term_syntax.parse_term("(eev : List[(Num, Term)])")
  let t1950 = @term_syntax.parse_term("(s : Term)")
  let t1951 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : Num)"), t1950, t1949]))
  let t1948 = @simp.gen_rewrite_tac(fn(x1947 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1947
  }, @list.List([@pair.forall_pair_thm()]))
  let t1946 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.all(), @lists.map()]))
  let t1945 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t1943 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t1944 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t1943)
  let t1942 = @tactics.undisch_tac(@term_syntax.parse_term("MEM((x : Num), MAP(FST, (env : List[(Num, Term)])))"))
  let t1941 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (b' : Bool)) → (a && b && (c : Bool)) == (a && b' && c)")))
  let t1940 = @simp.rewrite_tac(@list.List([@lists.all_map()]))
  let t1939 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1938 = @simp.rewrite_tac(@list.List([unifies(), @lists.all(), @lists.all_append()]))
  let t1937 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : (Num) -> Term)"))
  let t1936 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : (Num) -> Term, unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), (env : List[(Num, Term)])), CONS((ASSOC((x : Num), env), (t : Term)), (oth : List[(Term, Term)])))) == unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env), CONS((V(x), t), oth)))"), fn(x1934 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1934
    @simp.rewrite_tac(@list.List([th]))
  })
  let t1932 = @meson.asm_meson_tac(@list.List([]))
  let t1933 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([callorder(), cright()])), @tactics.disj2_tac), @tactics.disj2_tac), @tactics.disj1_tac), t1932), @tactics.all_tac])
  let t1931 = @simp.asm_rewrite_tac(@list.List([]))
  let t1927 = @term_syntax.parse_term("CONS((ASSOC((x : Num), (env : List[(Num, Term)])), (t : Term)), (oth : List[(Term, Term)]))")
  let t1928 = @list.List([@term_syntax.parse_term("(env : List[(Num, Term)])"), t1927])
  let t1957 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1930 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1924 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1925 = @tactics.mp_tac(x1924)
      fn(x1926 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1925(x1926)
      }
    })(((x1929 : @kernel.Thm) => @bool.specl(t1928, x1929))(x1930))
  }), t1931), @tactics.ants_tac), t1933), t1936), t1937), t1938), t1939), t1940), t1941), t1942), t1944), t1945), t1946), t1948), t1951), t1952), t1953), t1954), t1955), t1956), @tactics.all_tac])
  let t1923 = @simp.asm_rewrite_tac(@list.List([]))
  let t2129 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("MEM((x : Num), MAP(FST, (env : List[(Num, Term)])))")), t1923), t1957), t1958), t1959), t1967), t1968), t1969), t1990), t1998), t1999), @tactics.ants_tac), t2043), @tactics.ants_tac), t2072), t2075), t2076), @tactics.gen_tac), t2077), t2078), t2128, t2127])
  let t1922 = @simp.rewrite_tac(@list.List([tpcases()]))
  let t1918 = @tactics.x_choose_then(@term_syntax.parse_term("(gargs : List[Term])"))(fn(x1915 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1916 = @tactics.subst_all_tac(x1915)
    fn(x1917 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1916(x1917)
    }
  })
  let t1919 = @tactics.x_choose_then(@term_syntax.parse_term("(g : Num)"))(t1918)
  let t1920 = @tactics.disch_then(@tactics.disj_cases_then2(@tactics.x_choose_then(@term_syntax.parse_term("(x : Num)"))(fn(x1912 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1913 = @tactics.subst_all_tac(x1912)
    fn(x1914 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1913(x1914)
    }
  }), t1919))
  let t1921 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(t : Term)"), @fol.term_cases())), t1920)])
  let t1909 = @tactics.x_choose_then(@term_syntax.parse_term("(fargs : List[Term])"))(fn(x1906 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1907 = @tactics.subst_all_tac(x1906)
    fn(x1908 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1907(x1908)
    }
  })
  let t1910 = @tactics.x_choose_then(@term_syntax.parse_term("(f : Num)"))(t1909)
  let t1911 = @tactics.disch_then(@tactics.disj_cases_then2(@tactics.x_choose_then(@term_syntax.parse_term("(x : Num)"))(fn(x1903 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1904 = @tactics.subst_all_tac(x1903)
    fn(x1905 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1904(x1905)
    }
  }), t1910))
  let t1902 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : Term)"), @fol.term_cases()))
  let t1901 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @lists.hd(), @lists.tl()]))
  let t1898 = @tactics.x_choose_then(@term_syntax.parse_term("(oth : List[(Term, Term)])"))(fn(x1895 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1896 = @tactics.subst_all_tac(x1895)
    fn(x1897 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1896(x1897)
    }
  })
  let t1899 = @tactics.x_choose_then(@term_syntax.parse_term("(t : Term)"))(t1898)
  let t1900 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : Term)"))(t1899))
  let t1894 = @simp.gen_rewrite_tac(fn(x1891 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1892 = @equal.land_conv(x1891)
    fn(x1893 : @kernel.Term) -> @kernel.Thm raise {
      s1892(x1893)
    }
  }, @list.List([@pair.exists_pair_thm()]))
  let t1889 = @simp.asm_rewrite_tac(@list.List([]))
  let t1888 = @tactics.disch_then(fn(x1885 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1886 = @tactics.subst_all_tac(x1885)
    fn(x1887 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1886(x1887)
    }
  })
  let t1890 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@lists.append_nil(), option_inj(), option_distinct()])), @tactics.gen_tac), t1888), t1889), @tactics.all_tac])
  let t1884 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x1878 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1879 = @tactics.subst_all_tac(x1878)
    fn(x1880 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1879(x1880)
    }
  }, fn(x1881 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1882 = @tactics.mp_tac(x1881)
    fn(x1883 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1882(x1883)
    }
  }))
  let t1877 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(eqs : List[(Term, Term)])"), @lists.list_cases()))
  let t1876 = @simp.asm_rewrite_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t1875 = @simp.once_rewrite_tac(@list.List([unify_raw()]))
  let t1874 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x1871 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1872 = @tactics.assume_tac(x1871)
    fn(x1873 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1872(x1873)
    }
  }))
  let t1870 = @simp.rewrite_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t1866 = @term_syntax.parse_term("((env' : List[(Num, Term)]), (eqs' : List[(Term, Term)]))")
  let t1862 = @term_syntax.parse_term("(eqs' : List[(Term, Term)])")
  let t1863 = @list.List([@term_syntax.parse_term("(env' : List[(Num, Term)])"), t1862])
  let t1869 = @tactics.disch_then(fn(x1868 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1865 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1859 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1860 = @tactics.mp_tac(x1859)
        fn(x1861 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1860(x1861)
        }
      })(((x1864 : @kernel.Thm) => @bool.genl(t1863, x1864))(x1865))
    })(((x1867 : @kernel.Thm) => @bool.spec(t1866, x1867))(x1868))
  })
  let t1857 = @term_syntax.parse_term("(eqs : List[(Term, Term)])")
  let t1858 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(env : List[(Num, Term)])"), t1857]))
  let t1856 = @simp.gen_rewrite_tac(fn(x1855 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1855
  }, @list.List([@pair.forall_pair_thm()]))
  let t2130 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@wf.wf_ind()]))(wf_callorder())), t1856), t1858), t1869), t1870), @tactics.disch_tac), t1874), t1875), t1876), t1877), t1884), t1890), t1894), t1900), t1901), t1902), t1911), t1921), t1922), t2129)
  unify_works_raw_c.set(@tactics.prove(@term_syntax.parse_term("∀ pr : (List[(Num, Term)], List[(Term, Term)]), LOOPFREE(FST(pr)) && CONFLICTFREE(FST(pr)) → (unify(pr) == NONE → (∀ i : (Num) -> Term, !unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), FST(pr)), SND(pr))))) && (∀ ans : List[(Num, Term)], unify(pr) == SOME(ans) → LOOPFREE(ans) && CONFLICTFREE(ans) && (∀ i : (Num) -> Term, unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), FST(pr)), SND(pr))) == unifies(i, MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), ans))))"), t2130))
}

///|
let unify_works_raw_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFY_WORKS_RAW")

///|
/// `UNIFY_WORKS_RAW`
pub fn unify_works_raw() -> @kernel.Thm {
  unify_works_raw_c.get()
}

///|
/// THE
fn step_71() -> Unit raise {
  let t2131 = @term_syntax.parse_term("(THE : (Option[_]) -> _)(SOME((x : _))) == x")
  the_c.set(@recursion.new_recursive_definition(@ind_types.option_recursion())(t2131))
}

///|
let the_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THE")

///|
/// `THE`
pub fn the() -> @kernel.Thm {
  the_c.get()
}

///|
/// unifier
fn step_72() -> Unit raise {
  unifier_c.set(@pair.new_definition(@term_syntax.parse_term("(unifier : (List[(Num, Term)], Num) -> Term)((env : List[(Num, Term)])) == LET((sol : List[(Num, Term)]) => LET_END(ITLIST(valmod, sol, V)), SOLVE(NIL, env))")))
}

///|
let unifier_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("unifier")

///|
/// `unifier`
pub fn unifier() -> @kernel.Thm {
  unifier_c.get()
}

///|
/// ITLIST_VALMOD_LEMMA
fn step_73() -> Unit raise {
  let t2166 = @simp.rewrite_tac(@list.List([]))
  let t2165 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t2164 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.mem_filter()]))
  let t2160 = @term_syntax.parse_term("MEM(((x : Num), (t' : Term)))")
  let t2163 = @tactics.disch_then(fn(x2162 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2158 = @tactics.mp_tac(x2157)
      fn(x2159 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2158(x2159)
      }
    })(((x2161 : @kernel.Thm) => @equal.ap_term(t2160, x2161))(x2162))
  })
  let t2156 = @list.List([@tactics.all_tac, @simp.rewrite_tac(@list.List([@theorems.eq_sym_eq()]))])
  let t2155 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → !(c : Bool)) && (b : Bool) == (b' : Bool) → a → b == (b' || c)")))
  let t2154 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm()]))
  let t2153 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(SUC((n : Num)) <= 1) == (n == 0)")), @lists.length_eq_nil()]))
  let t2152 = @simp.asm_rewrite_tac(@list.List([@pair.pair_eq(), @lists.length(), @fol.valmod()]))
  let t2151 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Num) == (x : Num)"))
  let t2150 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t2148 = @term_syntax.parse_term("(s : Term)")
  let t2149 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(z : Num)"), t2148]))
  let t2147 = @simp.gen_rewrite_tac(fn(x2146 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2146
  }, @list.List([@pair.forall_pair_thm()]))
  let t2144 = @term_syntax.parse_term("(h : (Num, Term))")
  let t2145 = @tactics.spec_tac(@term_syntax.parse_term("(h : (Num, Term))"), t2144)
  let t2143 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t2142 = @simp.rewrite_tac(@list.List([@lists.filter(), @lists.length(), @lists.itlist(), @lists.map(), @lists.mem()]))
  let t2140 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t2141 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t2140)
  let t2136 = @term_syntax.parse_term("(x : Num)")
  let t2139 = @tactics.disch_then(fn(x2138 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2133 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2134 = @tactics.mp_tac(x2133)
      fn(x2135 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2134(x2135)
      }
    })(((x2137 : @kernel.Thm) => @bool.spec(t2136, x2137))(x2138))
  })
  let t2132 = @simp.rewrite_tac(@list.List([conflictfree()]))
  let t2167 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t2132), t2139), t2141), @lists.list_induct_tac), t2142), t2143), t2145), t2147), t2149), t2150), t2151), t2152), t2153), t2154), @tactics.gen_tac), t2155), @tactics.conj_tac), t2156), t2163), t2164), t2165), t2166)
  itlist_valmod_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ x : Num, CONFLICTFREE(env) → (∀ t : Term, (ITLIST(valmod, env, V, x) == t) == (MEM((x, t), env) || t == V(x) && !MEM(x, MAP(FST, env))))"), t2167))
}

///|
let itlist_valmod_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST_VALMOD_LEMMA")

///|
/// `ITLIST_VALMOD_LEMMA`
pub fn itlist_valmod_lemma() -> @kernel.Thm {
  itlist_valmod_lemma_c.get()
}

///|
/// UNIFIER_WORKS
fn step_74() -> Unit raise {
  let t2218 = @meson.asm_meson_tac(@list.List([@pair.fst()]))
  let t2217 = @simp.once_rewrite_tac(@list.List([@pair.exists_pair_thm()]))
  let t2216 = @simp.rewrite_tac(@list.List([@lists.mem_map()]))
  let t2215 = @simp.asm_simp_tac(@list.List([itlist_valmod_lemma()]))
  let t2214 = @fol.expand_tac("i")
  let t2213 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t2212 = @tactics.match_mp_tac(@fol.termsubst_valuation())
  let t2211 = @simp.gen_rewrite_tac(fn(x2208 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2209 = @equal.rand_conv(x2208)
    fn(x2210 : @kernel.Term) -> @kernel.Thm raise {
      s2209(x2210)
    }
  }, @list.List([@equal.gsym(@fol.termsubst_triv())]))
  let t2207 = @tactics.subgoal_then(@term_syntax.parse_term("termsubst((i : (Num) -> Term), (t : Term)) == t"), fn(x2205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2205
    @simp.asm_rewrite_tac(@list.List([th]))
  })
  let t2204 = @simp.asm_simp_tac(@list.List([itlist_valmod_lemma()]))
  let t2203 = @fol.expand_tac("i")
  let t2201 = @term_syntax.parse_term("(t : Term)")
  let t2202 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Num)"), t2201]))
  let t2200 = @simp.asm_rewrite_tac(@list.List([]))
  let t2199 = @tactics.conv_tac(@equal.redepth_conv(@pair.gen_beta_conv))
  let t2198 = @simp.gen_rewrite_tac(fn(x2197 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2197
  }, @list.List([@pair.forall_pair_thm()]))
  let t2196 = @simp.rewrite_tac(@list.List([@fol.termsubst(), @equal.gsym(@lists.all_mem())]))
  let t2195 = @tactics.conv_tac(@equal.redepth_conv(@pair.gen_beta_conv))
  let t2194 = @simp.rewrite_tac(@list.List([]))
  let t2193 = @simp.gen_rewrite_tac(fn(x2190 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2191 = @equal.land_conv(x2190)
    fn(x2192 : @kernel.Term) -> @kernel.Thm raise {
      s2191(x2192)
    }
  }, @list.List([@equal.gsym(paired_eta_thm())]))
  let t2189 = @simp.rewrite_tac(@list.List([unifies(), @lists.all_map(), @trivia.o_def()]))
  let t2182 = @term_syntax.parse_term("(i : (Num) -> Term)")
  let t2188 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2179 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2180 = @tactics.assume_tac(x2179)
      fn(x2181 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2180(x2181)
      }
    })(((x2183 : @kernel.Thm) => @bool.spec(t2182, x2183))(x2184))
  }, fn(x2185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2186 = @tactics.mp_tac(x2185)
    fn(x2187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2186(x2187)
    }
  }))
  let t2178 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2173 = @tactics.assume_tac(x2172)
    fn(x2174 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2173(x2174)
    }
  }, fn(x2175 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2176 = @tactics.mp_tac(x2175)
    fn(x2177 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2176(x2177)
    }
  }))
  let t2171 = @simp.abbrev_tac(@term_syntax.parse_term("(i : (Num) -> Term) == ITLIST(valmod, (sol : List[(Num, Term)]), V)"))
  let t2170 = @simp.asm_rewrite_tac(@list.List([]))
  let t2169 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(env : List[(Num, Term)])"), solve_works()))
  let t2168 = @simp.rewrite_tac(@list.List([unifier()]))
  let t2219 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2168), @pair.let_tac), t2169), t2170), t2171), t2178), t2188), @tactics.disch_tac), t2189), t2193), t2194), t2195), t2196), t2198), t2199), t2200), t2202), @tactics.disch_tac), t2203), t2204), t2207), t2211), t2212), t2213), @tactics.disch_tac), t2214), t2215), @tactics.disj2_tac), t2216), t2217), t2218)
  unifier_works_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], LOOPFREE(env) && CONFLICTFREE(env) → unifies(unifier(env), MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env))"), t2219))
}

///|
let unifier_works_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFIER_WORKS")

///|
/// `UNIFIER_WORKS`
pub fn unifier_works() -> @kernel.Thm {
  unifier_works_c.get()
}

///|
/// UNIFIER_MGU
fn step_75() -> Unit raise {
  let t2265 = @simp.asm_simp_tac(@list.List([]))
  let t2264 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2258 = @tactics.subst_all_tac(x2257)
      fn(x2259 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2258(x2259)
      }
    })(@equal.sym(x2260))
  }, fn(x2261 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2262 = @tactics.assume_tac(x2261)
    fn(x2263 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2262(x2263)
    }
  }))
  let t2256 = @tactics.undisch_then(@term_syntax.parse_term("(y : Num) == (z : Num)"), fn(x2255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2252 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2253 = @tactics.subst_all_tac(x2252)
      fn(x2254 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2253(x2254)
      }
    })(@equal.sym(x2255))
  })
  let t2251 = @simp.asm_simp_tac(@list.List([]))
  let t2250 = @simp.rewrite_tac(@list.List([@fol.valmod()]))
  let t2249 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t2248 = @simp.rewrite_tac(@list.List([unifies(), @lists.all(), @lists.map()]))
  let t2247 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t2245 = @term_syntax.parse_term("(s : Term)")
  let t2246 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(z : Num)"), t2245]))
  let t2244 = @simp.gen_rewrite_tac(fn(x2243 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2243
  }, @list.List([@pair.forall_pair_thm()]))
  let t2241 = @term_syntax.parse_term("(h : (Num, Term))")
  let t2242 = @tactics.spec_tac(@term_syntax.parse_term("(h : (Num, Term))"), t2241)
  let t2240 = @simp.rewrite_tac(@list.List([@lists.itlist(), @fol.termsubst_triv(), @fol.termsubst()]))
  let t2239 = @simp.rewrite_tac(@list.List([@fol.termsubst()]))
  let t2237 = @term_syntax.parse_term("(env : List[(Num, Term)])")
  let t2238 = @tactics.spec_tac(@term_syntax.parse_term("(env : List[(Num, Term)])"), t2237)
  let t2236 = @tactics.conv_tac(@equal.redepth_conv(@pair.gen_beta_conv))
  let t2235 = @simp.rewrite_tac(@list.List([]))
  let t2234 = @simp.gen_rewrite_tac((x2233 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(2, fn(x2230 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2231 = @equal.land_conv(x2230)
    fn(x2232 : @kernel.Term) -> @kernel.Thm raise {
      s2231(x2232)
    }
  }, x2233), @list.List([@equal.gsym(paired_eta_thm())]))
  let t2229 = @simp.rewrite_tac(@list.List([unifies(), @lists.all_map(), @trivia.o_def()]))
  let t2228 = @tactics.undisch_tac(@term_syntax.parse_term("unifies((i : (Num) -> Term), MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), (env : List[(Num, Term)])))"))
  let t2227 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t2226 = @tactics.disch_then(fn(x2225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2224 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Num)"))
  let t2223 = @tactics.match_mp_tac(@fol.termsubst_valuation())
  let t2222 = @simp.rewrite_tac(@list.List([@fol.termsubst_termsubst()]))
  let t2221 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : Term)"))
  let t2220 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm()]))
  let t2266 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2220), t2221), t2222), t2223), t2224), t2226), t2227), t2228), t2229), t2234), t2235), t2236), t2238), t2239), @lists.list_induct_tac), t2240), t2242), t2244), t2246), t2247), t2248), t2249), t2250), @class.cond_cases_tac), t2251), t2256), t2264), t2265)
  unifier_mgu_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], LOOPFREE(env) && CONFLICTFREE(env) → (∀ i : (Num) -> Term, unifies(i, MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env)) → termsubst(i) == o(termsubst(i), termsubst(ITLIST(valmod, env, V))))"), t2266))
}

///|
let unifier_mgu_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFIER_MGU")

///|
/// `UNIFIER_MGU`
pub fn unifier_mgu() -> @kernel.Thm {
  unifier_mgu_c.get()
}

///|
/// UNIFY_WORKS
fn step_76() -> Unit raise {
  let t2306 = @simp.asm_rewrite_tac(@list.List([]))
  let t2305 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t2304 = @simp.asm_rewrite_tac(@list.List([unifier()]))
  let t2302 = @simp.asm_rewrite_tac(@list.List([@fol.termsubst()]))
  let t2301 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t2300 = @simp.once_rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t2299 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t2303 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([unifies(), @lists.all_map(), @trivia.o_def()]))), t2299), t2300), t2301), t2302), @tactics.all_tac])
  let t2298 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : (Num) -> Term, unifies(i, MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), (ans : List[(Num, Term)]))) == unifies(i, MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), (sol : List[(Num, Term)])))"), fn(x2296 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2296
    @simp.simp_tac(@list.List([th]))
  })
  let t2295 = @simp.asm_rewrite_tac(@list.List([]))
  let t2293 = @meson.asm_meson_tac(@list.List([]))
  let t2292 = @simp.rewrite_tac(@list.List([occ()]))
  let t2291 = @simp.once_rewrite_tac(@list.List([@rstc.rtc_cases_r()]))
  let t2290 = @simp.once_rewrite_tac(@list.List([@rstc.tc_rtc_cases_r()]))
  let t2289 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Num)"))
  let t2294 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([loopfree()])), t2289), t2290), t2291), t2292), t2293), @tactics.all_tac])
  let t2288 = @tactics.subgoal_then(@term_syntax.parse_term("LOOPFREE((sol : List[(Num, Term)]))"), fn(x2285 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2286 = @tactics.assume_tac(x2285)
    fn(x2287 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2286(x2287)
    }
  })
  let t2284 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(sol : List[(Num, Term)])"), unifier_mgu()))
  let t2283 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(ans : List[(Num, Term)])"), unifier_works()))
  let t2282 = @simp.asm_rewrite_tac(@list.List([]))
  let t2281 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(ans : List[(Num, Term)])"), solve_works()))
  let t2280 = @tactics.conv_tac(@equal.top_depth_conv(@pair.let_conv))
  let t2279 = @simp.rewrite_tac(@list.List([unifier()]))
  let t2278 = @simp.asm_rewrite_tac(@list.List([]))
  let t2277 = @simp.asm_rewrite_tac(@list.List([]))
  let t2273 = @term_syntax.parse_term("(ans : List[(Num, Term)])")
  let t2276 = @tactics.first_x_assum(fn(x2275 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2271 = @tactics.mp_tac(x2270)
      fn(x2272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2271(x2272)
      }
    })(((x2274 : @kernel.Thm) => @bool.spec(t2273, x2274))(x2275))
  })
  let t2269 = @simp.asm_rewrite_tac(@list.List([]))
  let t2268 = @simp.asm_rewrite_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t2267 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("((env : List[(Num, Term)]), (eqs : List[(Term, Term)]))"), unify_works_raw()))
  let t2307 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t2267), t2268), @tactics.strip_tac), t2269), @tactics.disch_tac), t2276), t2277), @tactics.strip_tac), t2278), t2279), @pair.let_tac), t2280), t2281), t2282), @tactics.strip_tac), t2283), t2284), t2288), t2294), t2295), t2298), t2303), t2304), t2305), @tactics.strip_tac), t2306)
  unify_works_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Num, Term)], ∀ eqs : List[(Term, Term)], LOOPFREE(env) && CONFLICTFREE(env) → (unify((env, eqs)) == NONE → (∀ i : (Num) -> Term, !unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env), eqs)))) && (unify((env, eqs)) == SOME((ans : List[(Num, Term)])) → LOOPFREE(ans) && CONFLICTFREE(ans) && unifies(unifier(ans), APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env), eqs)) && (∀ i : (Num) -> Term, unifies(i, APPEND(MAP(GABS((f : ((Num, Term)) -> (Term, Term)) => ∀ x : Num, ∀ t : Term, GEQ(f((x, t)), (V(x), t))), env), eqs)) → termsubst(i) == o(termsubst(i), termsubst(unifier(ans)))))"), t2307))
}

///|
let unify_works_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFY_WORKS")

///|
/// `UNIFY_WORKS`
pub fn unify_works() -> @kernel.Thm {
  unify_works_c.get()
}

///|
/// UNIFY_WORKS_SIMPLE
fn step_77() -> Unit raise {
  let t2312 = @simp.rewrite_tac(@list.List([occ(), @lists.mem()]))
  let t2311 = @simp.once_rewrite_tac(@list.List([@rstc.tc_cases_l()]))
  let t2310 = @simp.rewrite_tac(@list.List([loopfree(), conflictfree(), @lists.length(), @lists.filter(), @calc_num.arith()]))
  let t2309 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2308 = @simp.rewrite_tac(@list.List([@lists.map(), @lists.append()]))
  let t2313 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(NIL : List[(Num, Term)])"), unify_works()))), t2308), t2309), t2310), t2311), t2312)
  unify_works_simple_c.set(@tactics.prove(@term_syntax.parse_term("∀ eqs : List[(Term, Term)], (unify((NIL, eqs)) == NONE → (∀ i : (Num) -> Term, !unifies(i, eqs))) && (unify((NIL, eqs)) == SOME((ans : List[(Num, Term)])) → LOOPFREE(ans) && CONFLICTFREE(ans) && unifies(unifier(ans), eqs) && (∀ i : (Num) -> Term, unifies(i, eqs) → termsubst(i) == o(termsubst(i), termsubst(unifier(ans)))))"), t2313))
}

///|
let unify_works_simple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFY_WORKS_SIMPLE")

///|
/// `UNIFY_WORKS_SIMPLE`
pub fn unify_works_simple() -> @kernel.Thm {
  unify_works_simple_c.get()
}

///|
/// Unifies_DEF
fn step_78() -> Unit raise {
  unifies_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Unifies : ((Num) -> Term, (Form) -> Bool) -> Bool)((i : (Num) -> Term), (s : (Form) -> Bool)) == (∀ p : Form, ∀ q : Form, IN(p, s) && IN(q, s) → formsubst(i, p) == formsubst(i, q))")))
}

///|
let unifies_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Unifies_DEF")

///|
/// `Unifies_DEF`
pub fn unifies_def() -> @kernel.Thm {
  unifies_def_c.get()
}

///|
/// UNIFIES
fn step_79() -> Unit raise {
  let t2314 = @meson.meson_tac(@list.List([unifies_def()]))
  unifies_v1_c.set(@tactics.prove(@term_syntax.parse_term("Unifies((i : (Num) -> Term), (s : (Form) -> Bool)) == (∃ q : Form, ∀ p : Form, IN(p, s) → formsubst(i, p) == q)"), t2314))
}

///|
let unifies_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFIES")

///|
/// `UNIFIES`
pub fn unifies_v1() -> @kernel.Thm {
  unifies_v1_c.get()
}

///|
/// UNIFIER_FORMPAIR_TERMLIST
fn step_80() -> Unit raise {
  let t2317 = @simp.rewrite_tac(@list.List([@fol.termsubst(), @fol.term_inj(), @calc_num.arith()]))
  let t2316 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t2315 = @simp.rewrite_tac(@list.List([@lists.all(), unifies()]))
  let t2318 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("[(Fn(0, NIL), Fn(1, NIL))]")), t2315), t2316), t2317)
  let lemma = @tactics.prove(@term_syntax.parse_term("∃ l : List[(Term, Term)], ∀ i : (Num) -> Term, !unifies(i, l)"), t2318)
  let t2381 = @simp.rewrite_tac(@list.List([unifies(), @lists.all_append()]))
  let t2380 = @tactics.exists_tac(@term_syntax.parse_term("APPEND((l1 : List[(Term, Term)]), (l2 : List[(Term, Term)]))"))
  let t2379 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(l2 : List[(Term, Term)])"))(fn(x2377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x2377
    @simp.rewrite_tac(@list.List([th_3]))
  }))
  let t2376 = @simp.asm_rewrite_tac(@list.List([]))
  let t2372 = @term_syntax.parse_term("(s : Form)")
  let t2375 = @tactics.first_x_assum(fn(x2374 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2369 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2370 = @tactics.mp_tac(x2369)
      fn(x2371 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2370(x2371)
      }
    })(((x2373 : @kernel.Thm) => @bool.spec(t2372, x2373))(x2374))
  })
  let t2368 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(l1 : List[(Term, Term)])"))(fn(x2366 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x2366
    @simp.rewrite_tac(@list.List([th_2]))
  }))
  let t2365 = @simp.asm_rewrite_tac(@list.List([]))
  let t2361 = @term_syntax.parse_term("(r : Form)")
  let t2364 = @tactics.disch_then(fn(x2363 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2359 = @tactics.mp_tac(x2358)
      fn(x2360 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2359(x2360)
      }
    })(((x2362 : @kernel.Thm) => @bool.spec(t2361, x2362))(x2363))
  })
  let t2357 = @tactics.undisch_tac(@term_syntax.parse_term("∀ q : Form, qfree(q) → (∃ l : List[(Term, Term)], ∀ i : (Num) -> Term, (formsubst(i, (p : Form)) == formsubst(i, q)) == unifies(i, l))"))
  let t2356 = @simp.asm_simp_tac(@list.List([@fol.form_inj()]))
  let t2355 = @simp.asm_rewrite_tac(@list.List([]))
  let t2354 = @tactics.disch_then(fn(x2352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2352
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th_1))
  })
  let t2351 = @term_syntax.parse_term("(s : Form)")
  let t2382 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(r : Form)"), t2351])), t2354), t2355), @tactics.strip_tac), t2356), t2357), t2364), t2365), t2368), t2375), t2376), t2379), t2380), t2381)
  let t2350 = @simp.asm_simp_tac(@list.List([@lists.cons_11()]))
  let t2349 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t2348 = @simp.rewrite_tac(@list.List([@lists.length(), @nums.not_suc(), @lists.map(), @lists.zip(), @lists.all(), @nums.suc_inj()]))
  let t2346 = @term_syntax.parse_term("(fargs : List[Term])")
  let t2347 = @tactics.spec_tac(@term_syntax.parse_term("(fargs : List[Term])"), t2346)
  let t2344 = @term_syntax.parse_term("(gargs : List[Term])")
  let t2345 = @tactics.spec_tac(@term_syntax.parse_term("(gargs : List[Term])"), t2344)
  let t2343 = @tactics.undisch_tac(@term_syntax.parse_term("LENGTH((fargs : List[Term])) == LENGTH((gargs : List[Term]))"))
  let t2342 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : (Num) -> Term)"))
  let t2341 = @simp.rewrite_tac(@list.List([unifies()]))
  let t2340 = @tactics.exists_tac(@term_syntax.parse_term("ZIP((fargs : List[Term]), (gargs : List[Term]))"))
  let t2339 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@lists.length_map(), lemma]))])
  let t2338 = @class.asm_cases_tac(@term_syntax.parse_term("LENGTH((fargs : List[Term])) == LENGTH((gargs : List[Term]))"))
  let t2337 = @simp.asm_rewrite_tac(@list.List([lemma]))
  let t2336 = @class.asm_cases_tac(@term_syntax.parse_term("(f : Num) == (g : Num)"))
  let t2335 = @simp.rewrite_tac(@list.List([@fol.form_inj()]))
  let t2334 = @term_syntax.parse_term("(gargs : List[Term])")
  let t2383 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(g : Num)"), t2334])), t2335), t2336), t2337), t2338), t2339), t2340), t2341), t2342), t2343), t2345), t2347), @lists.list_induct_tac), @lists.list_induct_tac), t2348), t2349), t2350)
  let t2333 = @simp.rewrite_tac(@list.List([unifies(), @lists.all()]))
  let t2384 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(NIL : List[(Term, Term)])")), t2333), t2383, t2382])
  let t2332 = @simp.rewrite_tac(@list.List([@fol.formsubst(), @fol.form_distinct(), lemma]))
  let t2331 = @simp.rewrite_tac(@list.List([@prenex.qfree()]))
  let t2330 = @tactics.match_mp_tac(@fol.form_induction())
  let t2327 = @simp.asm_rewrite_tac(@list.List([]))
  let t2326 = @tactics.disch_then(fn(x2324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2324
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t2323 = @term_syntax.parse_term("(q : Form)")
  let t2328 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Form)"), t2323])), t2326), t2327), @tactics.strip_tac)
  let t2322 = @term_syntax.parse_term("(fargs : List[Term])")
  let t2329 = @list.List([@tactics.all_tac, @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(f : Num)"), t2322])), t2328])
  let t2321 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2320 = @simp.rewrite_tac(@list.List([@prenex.qfree()]))
  let t2319 = @tactics.match_mp_tac(@fol.form_induction())
  let t2385 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), t2319), t2320), t2321), t2329), t2330), t2331), t2332), t2384)
  unifier_formpair_termlist_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, qfree(p) && qfree(q) → (∃ l : List[(Term, Term)], ∀ i : (Num) -> Term, (formsubst(i, p) == formsubst(i, q)) == unifies(i, l))"), t2385))
}

///|
let unifier_formpair_termlist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFIER_FORMPAIR_TERMLIST")

///|
/// `UNIFIER_FORMPAIR_TERMLIST`
pub fn unifier_formpair_termlist() -> @kernel.Thm {
  unifier_formpair_termlist_c.get()
}

///|
/// UNIFIER_SUBTERMS
fn step_81() -> Unit raise {
  let t2438 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t2437 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(unifies())]))
  let t2436 = @simp.rewrite_tac(@list.List([unifies(), @lists.all_append()]))
  let t2435 = @tactics.exists_tac(@term_syntax.parse_term("APPEND((l : List[(Term, Term)]), (m : List[(Term, Term)]))"))
  let t2432 = @term_syntax.parse_term("(m : List[(Term, Term)])")
  let t2434 = @tactics.disch_then((x2433 : @kernel.Thm) => @tactics.x_choose_tac(t2432, x2433))
  let t2431 = @simp.asm_rewrite_tac(@list.List([]))
  let t2429 = @term_syntax.parse_term("(q : Form)")
  let t2430 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Form)"), t2429]), unifier_formpair_termlist()))
  let t2426 = @term_syntax.parse_term("(l : List[(Term, Term)])")
  let t2428 = @tactics.disch_then((x2427 : @kernel.Thm) => @tactics.x_choose_tac(t2426, x2427))
  let t2425 = @simp.asm_rewrite_tac(@list.List([]))
  let t2424 = @tactics.disch_then(fn(x2422 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2422
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th_1))
  })
  let t2421 = @simp.simp_tac(@list.List([@theorems.forall_and_thm(), @theorems.left_forall_imp_thm(), @theorems.exists_refl(), @theorems.left_exists_and_thm(), @theorems.right_exists_and_thm()]))
  let t2420 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t2419 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @pair.pair_eq()]))
  let t2416 = @term_syntax.parse_term("(B : ((Form, Form)) -> Bool)")
  let t2417 = @term_syntax.parse_term("(q : Form)")
  let t2418 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Form)"), t2417, t2416]))
  let t2415 = @simp.gen_rewrite_tac(fn(x2414 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2414
  }, @list.List([@pair.forall_pair_thm()]))
  let t2412 = @simp.rewrite_tac(@list.List([@sets.not_in_empty(), @lists.all(), unifies()]))
  let t2413 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[(Term, Term)])"))), t2412), @tactics.all_tac])
  let t2411 = @tactics.match_mp_tac(@sets.finite_induct())
  let t2410 = @tactics.pop_assum_list(fn(x2409 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2407 = @term_syntax.parse_term("(B : ((Form, Form)) -> Bool)")
  let t2408 = @tactics.spec_tac(@term_syntax.parse_term("(B : ((Form, Form)) -> Bool)"), t2407)
  let t2405 = @simp.asm_rewrite_tac(@list.List([]))
  let t2404 = @tactics.match_mp_tac(@sets.finite_product())
  let t2406 = @list.List([@tactics.then_tac(@tactics.then_tac(@fol.expand_tac("B"), t2404), t2405), @tactics.all_tac])
  let t2403 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((B : ((Form, Form)) -> Bool))"), fn(x2400 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2401 = @tactics.mp_tac(x2400)
    fn(x2402 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2401(x2402)
    }
  })
  let t2398 = @meson.asm_meson_tac(@list.List([]))
  let t2397 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @pair.pair_eq()]))
  let t2399 = @list.List([@tactics.then_tac(@tactics.then_tac(@fol.expand_tac("B"), t2397), t2398), @tactics.all_tac])
  let t2396 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, IN((p, q), (B : ((Form, Form)) -> Bool)) → qfree(p) && qfree(q)"), fn(x2393 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2394 = @tactics.mp_tac(x2393)
    fn(x2395 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2394(x2395)
    }
  })
  let t2391 = @meson.meson_tac(@list.List([]))
  let t2390 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), unifies_def(), @pair.pair_eq()]))
  let t2392 = @list.List([@tactics.then_tac(@tactics.then_tac(@fol.expand_tac("B"), t2390), t2391), @tactics.all_tac])
  let t2389 = @tactics.subgoal_then(@term_syntax.parse_term("∀ i : (Num) -> Term, Unifies(i, (A : (Form) -> Bool)) == (∀ p : Form, ∀ q : Form, IN((p, q), (B : ((Form, Form)) -> Bool)) → formsubst(i, p) == formsubst(i, q))"), fn(x2387 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2387
    @simp.rewrite_tac(@list.List([th]))
  })
  let t2386 = @simp.abbrev_tac(@term_syntax.parse_term("(B : ((Form, Form)) -> Bool) == {((x : Form), (y : Form)) | IN(x, (A : (Form) -> Bool)) && IN(y, A)}"))
  let t2439 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2386), t2389), t2392), t2396), t2399), t2403), t2406), t2408), t2410), t2411), @tactics.conj_tac), t2413), t2415), t2418), t2419), t2420), t2421), t2424), t2425), t2428), t2430), t2431), t2434), t2435), t2436), t2437), t2438)
  unifier_subterms_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : (Form) -> Bool, FINITE(A) && (∀ p : Form, IN(p, A) → qfree(p)) → (∃ l : List[(Term, Term)], ∀ i : (Num) -> Term, Unifies(i, A) == unifies(i, l))"), t2439))
}

///|
let unifier_subterms_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIFIER_SUBTERMS")

///|
/// `UNIFIER_SUBTERMS`
pub fn unifier_subterms() -> @kernel.Thm {
  unifier_subterms_c.get()
}

///|
/// MGU_EXISTS
fn step_82() -> Unit raise {
  let t2490 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm(), @lists.all_t()]))
  let t2489 = @tactics.match_mp_tac(@lists.map_eq())
  let t2488 = @tactics.repeat_tac(@tactics.gen_tac)
  let t2487 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.map_o())]))
  let t2486 = @simp.simp_tac(@list.List([]))
  let t2485 = @simp.rewrite_tac(@list.List([@fol.formsubst(), @prenex.qfree()]))
  let t2484 = @tactics.match_mp_tac(@fol.form_induction())
  let t2483 = @tactics.disch_then(fn(x2482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2479 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2480 = @tactics.assume_tac(x2479)
      fn(x2481 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2480(x2481)
      }
    })(@equal.gsym(x2482))
  })
  let t2478 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm()]))
  let t2477 = @simp.rewrite_tac(@list.List([]))
  let t2476 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t2475 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : (Num) -> Term)"))
  let t2474 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t2473 = @simp.asm_rewrite_tac(@list.List([]))
  let t2472 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x2466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2467 = @tactics.assume_tac(x2466)
    fn(x2468 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2467(x2468)
    }
  }, fn(x2469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2470 = @tactics.mp_tac(x2469)
    fn(x2471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2470(x2471)
    }
  })))
  let t2465 = @simp.rewrite_tac(@list.List([the()]))
  let t2461 = @term_syntax.parse_term("(u : List[(Num, Term)])")
  let t2464 = @tactics.disch_then(fn(x2463 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2458 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2459 = @tactics.mp_tac(x2458)
      fn(x2460 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2459(x2460)
      }
    })(((x2462 : @kernel.Thm) => @bool.spec(t2461, x2462))(x2463))
  })
  let t2457 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : List[(Num, Term)])"))
  let t2456 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2454 = @ind_types.prove_constructors_injective(@ind_types.option_recursion())
  let t2455 = @simp.rewrite_tac(@list.List([@ind_types.prove_constructors_distinct(@ind_types.option_recursion()), t2454]))
  let t2453 = @tactics.match_mp_tac(@ind_types.option_induct())
  let t2451 = @term_syntax.parse_term("(u : Option[List[(Num, Term)]])")
  let t2452 = @tactics.spec_tac(@term_syntax.parse_term("unify((NIL, (l : List[(Term, Term)])))"), t2451)
  let t2449 = @bool.spec(@term_syntax.parse_term("(l : List[(Term, Term)])"), unify_works_simple())
  let t2450 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(ans : List[(Num, Term)])"), t2449))
  let t2448 = @tactics.exists_tac(@term_syntax.parse_term("unifier(THE(unify((NIL, (l : List[(Term, Term)])))))"))
  let t2447 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t2446 = @simp.asm_rewrite_tac(@list.List([]))
  let t2445 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(i : (Num) -> Term)"))(@tactics.strip_assume_tac))
  let t2442 = @drule.match_mp(unifier_subterms())
  let t2443 = @tactics.x_choose_then(@term_syntax.parse_term("(l : List[(Term, Term)])"))(fn(x2440 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2440
    @simp.rewrite_tac(@list.List([th]))
  })
  let t2491 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x2444 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t2443(t2442(x2444))
  }), @tactics.eq_tac), t2445), t2446), t2447), t2448), t2450), t2452), t2453), t2455), @tactics.conj_tac), t2456), t2457), t2464), t2465), t2472), t2473), t2474), t2475), t2476), t2477), t2478), t2483), t2484), t2485), t2486), t2487), t2488), @tactics.ap_term_tac), t2489), t2490)
  mgu_exists_c.set(@tactics.prove(@term_syntax.parse_term("FINITE((s : (Form) -> Bool)) && (∀ p : Form, IN(p, s) → qfree(p)) → (∃ i : (Num) -> Term, Unifies(i, s)) == (∃ i : (Num) -> Term, Unifies(i, s) && (∀ j : (Num) -> Term, Unifies(j, s) → (∀ p : Form, qfree(p) → formsubst(j, p) == formsubst(j, formsubst(i, p)))))"), t2491))
}

///|
let mgu_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MGU_EXISTS")

///|
/// `MGU_EXISTS`
pub fn mgu_exists() -> @kernel.Thm {
  mgu_exists_c.get()
}

///|
/// mgu
fn step_83() -> Unit raise {
  mgu_c.set(@pair.new_definition(@term_syntax.parse_term("(mgu : ((Form) -> Bool, Num) -> Term)((s : (Form) -> Bool)) == select((i : (Num) -> Term) => Unifies(i, s) && (∀ j : (Num) -> Term, Unifies(j, s) → (∀ p : Form, qfree(p) → formsubst(j, p) == formsubst(j, formsubst(i, p)))))")))
}

///|
let mgu_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("mgu")

///|
/// `mgu`
pub fn mgu() -> @kernel.Thm {
  mgu_c.get()
}

///|
/// MGU
fn step_84() -> Unit raise {
  let t2495 = @meson.asm_meson_tac(@list.List([]))
  let t2494 = @simp.asm_simp_tac(@list.List([@equal.gsym(mgu_exists())]))
  let t2493 = @tactics.conv_tac(@class.select_conv)
  let t2492 = @simp.rewrite_tac(@list.List([mgu()]))
  let t2496 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t2492), t2493), t2494), t2495)
  mgu_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Form) -> Bool, FINITE(s) && (∀ p : Form, IN(p, s) → qfree(p)) && (∃ i : (Num) -> Term, Unifies(i, s)) → Unifies(mgu(s), s) && (∀ i : (Num) -> Term, Unifies(i, s) → (∀ p : Form, qfree(p) → formsubst(i, p) == formsubst(i, formsubst(mgu(s), p))))"), t2496))
}

///|
let mgu_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MGU")

///|
/// `MGU`
pub fn mgu_v1() -> @kernel.Thm {
  mgu_v1_c.get()
}

///|
/// FORMSUBST_TERMSUBST_LEMMA
fn step_85() -> Unit raise {
  let t2509 = @simp.asm_rewrite_tac(@list.List([@trivia.o_thm(), @lists.all_t()]))
  let t2508 = @tactics.match_mp_tac(@lists.map_eq())
  let t2507 = @simp.rewrite_tac(@list.List([@fol.form_inj(), @equal.gsym(@lists.map_o())]))
  let t2506 = @simp.simp_tac(@list.List([@fol.formsubst()]))
  let t2505 = @simp.rewrite_tac(@list.List([@prenex.qfree()]))
  let t2510 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@fol.form_induction()), t2505), t2506), t2507), @tactics.gen_tac), t2508), t2509)
  let t2504 = @simp.rewrite_tac(@list.List([@prenex.qfree(), @fol.formsubst(), @lists.map(), @fol.form_inj(), @lists.cons_11()]))
  let t2500 = @term_syntax.parse_term("Atom((p : Num), [(t : Term)])")
  let t2503 = @tactics.first_x_assum(fn(x2502 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2498 = @tactics.mp_tac(x2497)
      fn(x2499 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2498(x2499)
      }
    })(((x2501 : @kernel.Thm) => @bool.spec(t2500, x2501))(x2502))
  })
  let t2511 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(t : Term)")), t2503), t2504), t2510])
  let t2512 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm()])), @tactics.eq_tac), @tactics.disch_tac), t2511)
  formsubst_termsubst_lemma_c.set(@tactics.prove(@term_syntax.parse_term("(∀ p : Form, qfree(p) → formsubst((i : (Num) -> Term), p) == formsubst((j : (Num) -> Term), formsubst((k : (Num) -> Term), p))) == (termsubst(i) == o(termsubst(j), termsubst(k)))"), t2512))
}

///|
let formsubst_termsubst_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORMSUBST_TERMSUBST_LEMMA")

///|
/// `FORMSUBST_TERMSUBST_LEMMA`
pub fn formsubst_termsubst_lemma() -> @kernel.Thm {
  formsubst_termsubst_lemma_c.get()
}

///|
/// ismgu
fn step_86() -> Unit raise {
  ismgu_c.set(@pair.new_definition(@term_syntax.parse_term("(ismgu : ((Form) -> Bool, (Num) -> Term) -> Bool)((s : (Form) -> Bool), (i : (Num) -> Term)) == (Unifies(i, s) && (∀ j : (Num) -> Term, Unifies(j, s) → (∃ k : (Num) -> Term, termsubst(j) == o(termsubst(k), termsubst(i)))))")))
}

///|
let ismgu_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ismgu")

///|
/// `ismgu`
pub fn ismgu() -> @kernel.Thm {
  ismgu_c.get()
}

///|
/// ISMGU
fn step_87() -> Unit raise {
  let t2513 = @simp.rewrite_tac(@list.List([ismgu(), formsubst_termsubst_lemma()]))
  ismgu_v1_c.set(@tactics.prove(@term_syntax.parse_term("ismgu((s : (Form) -> Bool), (i : (Num) -> Term)) == (Unifies(i, s) && (∀ j : (Num) -> Term, Unifies(j, s) → (∃ k : (Num) -> Term, ∀ p : Form, qfree(p) → formsubst(j, p) == formsubst(k, formsubst(i, p)))))"), t2513))
}

///|
let ismgu_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISMGU")

///|
/// `ISMGU`
pub fn ismgu_v1() -> @kernel.Thm {
  ismgu_v1_c.get()
}

///|
/// ISMGU_MGU
fn step_88() -> Unit raise {
  let t2517 = @meson.asm_meson_tac(@list.List([]))
  let t2516 = @simp.asm_rewrite_tac(@list.List([ismgu_v1()]))
  let t2514 = @drule.match_mp(mgu_v1())
  let t2518 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x2515 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t2514(x2515))
  })), t2516), t2517)
  ismgu_mgu_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Form) -> Bool, FINITE(s) && (∀ p : Form, IN(p, s) → qfree(p)) && (∃ i : (Num) -> Term, Unifies(i, s)) → ismgu(s, mgu(s))"), t2518))
}

///|
let ismgu_mgu_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISMGU_MGU")

///|
/// `ISMGU_MGU`
pub fn ismgu_mgu() -> @kernel.Thm {
  ismgu_mgu_c.get()
}

///|
/// renaming
fn step_89() -> Unit raise {
  renaming_c.set(@pair.new_definition(@term_syntax.parse_term("(renaming : ((Num) -> Term) -> Bool)((i : (Num) -> Term)) == (∃ j : (Num) -> Term, o(termsubst(j), termsubst(i)) == I && o(termsubst(i), termsubst(j)) == I)")))
}

///|
let renaming_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("renaming")

///|
/// `renaming`
pub fn renaming() -> @kernel.Thm {
  renaming_c.get()
}

///|
/// RENAMING
fn step_90() -> Unit raise {
  let t2539 = @meson.meson_tac(@list.List([@fol.term_inj()]))
  let t2538 = @simp.rewrite_tac(@list.List([@fol.termsubst()]))
  let t2537 = @tactics.first_x_assum(fn(x2534 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2534
    let t2536 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("V((x2 : Num))"), th))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("V((x1 : Num))"), th)), t2536)
  })
  let t2533 = @term_syntax.parse_term("(x2 : Num)")
  let t2540 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x1 : Num)"), t2533])), t2537), t2538), t2539)
  let t2532 = @meson.meson_tac(@list.List([@fol.term_cases(), @fol.termsubst(), @fol.term_distinct()]))
  let t2531 = @simp.rewrite_tac(@list.List([@fol.termsubst()]))
  let t2527 = @term_syntax.parse_term("V((x : Num))")
  let t2530 = @tactics.first_x_assum(fn(x2529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2524 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2525 = @tactics.mp_tac(x2524)
      fn(x2526 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2525(x2526)
      }
    })(((x2528 : @kernel.Thm) => @bool.spec(t2527, x2528))(x2529))
  })
  let t2541 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)")), t2530), t2531), t2532), t2540])
  let t2523 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(j : (Num) -> Term)"))(fn(x2522 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2519 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2520 = @tactics.assume_tac(x2519)
      fn(x2521 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2520(x2521)
      }
    })(@bool.conjunct1(x2522))
  }))
  let t2542 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([renaming(), @class.fun_eq_thm(), @trivia.o_thm(), @trivia.i_def()])), t2523), @tactics.conj_tac), t2541)
  renaming_v1_c.set(@tactics.prove(@term_syntax.parse_term("renaming((i : (Num) -> Term)) → (∀ x : Num, ∃ y : Num, i(x) == V(y)) && (∀ x : Num, ∀ x' : Num, i(x') == i(x) → x' == x)"), t2542))
}

///|
let renaming_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RENAMING")

///|
/// `RENAMING`
pub fn renaming_v1() -> @kernel.Thm {
  renaming_v1_c.get()
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
}
