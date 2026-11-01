// Translated from upstream Tutorial/Semantics_of_programming_languages_shallow.ml; edit this file directly.

///|
/// assign
fn step_1() -> Unit raise {
  assign_c.set(@pair.new_definition(@term_syntax.parse_term("(Assign : ((S) -> S, (S) -> Bool, S) -> Bool)((f : (S) -> S), (q : (S) -> Bool)) == o(q, f)")))
}

///|
let assign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("assign")

///|
/// `assign`
pub fn assign() -> @kernel.Thm {
  assign_c.get()
}

///|
/// Tutorial/Semantics_of_programming_languages_shallow.ml:4
fn step_2() -> Unit raise {
  @printer.parse_as_infix(";;", (18L, "right"))
}

///|
/// sequence
fn step_3() -> Unit raise {
  sequence_c.set(@pair.new_definition(@term_syntax.parse_term("(op_semi_semi : (((S) -> Bool, S) -> Bool, ((S) -> Bool, S) -> Bool, (S) -> Bool, S) -> Bool)((c1 : ((S) -> Bool, S) -> Bool), (c2 : ((S) -> Bool, S) -> Bool)) == o(c1, c2)")))
}

///|
let sequence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sequence")

///|
/// `sequence`
pub fn sequence() -> @kernel.Thm {
  sequence_c.get()
}

///|
/// if_def
fn step_4() -> Unit raise {
  if_def_c.set(@pair.new_definition(@term_syntax.parse_term("(If : ((S) -> Bool, ((S) -> Bool, S) -> Bool, (S) -> Bool, S) -> Bool)((e : (S) -> Bool), (c : ((S) -> Bool, S) -> Bool), (q : (S) -> Bool)) == {(s : S) | if e(s) { c(q, s) } else { q(s) }}")))
}

///|
let if_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("if_def")

///|
/// `if_def`
pub fn if_def() -> @kernel.Thm {
  if_def_c.get()
}

///|
/// ite_def
fn step_5() -> Unit raise {
  ite_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Ite : ((S) -> Bool, ((S) -> Bool, S) -> Bool, ((S) -> Bool, S) -> Bool, (S) -> Bool, S) -> Bool)((e : (S) -> Bool), (c1 : ((S) -> Bool, S) -> Bool), (c2 : ((S) -> Bool, S) -> Bool), (q : (S) -> Bool)) == {(s : S) | if e(s) { c1(q, s) } else { c2(q, s) }}")))
}

///|
let ite_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ite_def")

///|
/// `ite_def`
pub fn ite_def() -> @kernel.Thm {
  ite_def_c.get()
}

///|
let while_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("while_RULES")

///|
/// `while_RULES`
pub fn while_rules() -> @kernel.Thm {
  while_rules_c.get()
}

///|
let while_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("while_INDUCT")

///|
/// `while_INDUCT`
pub fn while_induct() -> @kernel.Thm {
  while_induct_c.get()
}

///|
let while_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("while_CASES")

///|
/// `while_CASES`
pub fn while_cases() -> @kernel.Thm {
  while_cases_c.get()
}

///|
/// while_RULES, while_INDUCT, while_CASES
fn step_6() -> Unit raise {
  let (while_rules, while_induct, while_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("∀ q : (_) -> Bool, ∀ s : _, If((e : (_) -> Bool), op_semi_semi((c : ((_) -> Bool, _) -> Bool), (while_ : ((_) -> Bool, ((_) -> Bool, _) -> Bool, (_) -> Bool, _) -> Bool)(e, c)), q, s) → while_(e, c, q, s)"))
  while_rules_c.set(while_rules)
  while_induct_c.set(while_induct)
  while_cases_c.set(while_cases)
}

///|
/// while_def
fn step_7() -> Unit raise {
  while_def_c.set(@pair.new_definition(@term_syntax.parse_term("(While : ((S) -> Bool, ((S) -> Bool, S) -> Bool, (S) -> Bool, S) -> Bool)((e : (S) -> Bool), (c : ((S) -> Bool, S) -> Bool), (q : (S) -> Bool)) == {(s : S) | ∀ w : (S) -> Bool, (∀ s : S, (if e(s) { c(w, s) } else { q(s) }) → w(s)) → w(s)}")))
}

///|
let while_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("while_def")

///|
/// `while_def`
pub fn while_def() -> @kernel.Thm {
  while_def_c.get()
}

///|
/// monotonic
fn step_8() -> Unit raise {
  monotonic_c.set(@pair.new_definition(@term_syntax.parse_term("(monotonic : (((_) -> Bool, _) -> Bool) -> Bool)((c : ((_) -> Bool, _) -> Bool)) == (∀ q : (_) -> Bool, ∀ q' : (_) -> Bool, SUBSET(q, q') → SUBSET(c(q), c(q')))")))
}

///|
let monotonic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("monotonic")

///|
/// `monotonic`
pub fn monotonic() -> @kernel.Thm {
  monotonic_c.get()
}

///|
/// MONOTONIC_ASSIGN
fn step_9() -> Unit raise {
  let t1 = @simp.simp_tac(@list.List([monotonic(), assign(), @sets.subset(), @trivia.o_thm(), @sets.in_()]))
  monotonic_assign_c.set(@tactics.prove(@term_syntax.parse_term("monotonic(Assign((f : (_) -> _)))"), t1))
}

///|
let monotonic_assign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOTONIC_ASSIGN")

///|
/// `MONOTONIC_ASSIGN`
pub fn monotonic_assign() -> @kernel.Thm {
  monotonic_assign_c.get()
}

///|
/// MONOTONIC_IF
fn step_10() -> Unit raise {
  let t2 = @sets.set_tac(@list.List([]))
  let t3 = @tactics.then_tac(@simp.rewrite_tac(@list.List([monotonic(), if_def()])), t2)
  monotonic_if_c.set(@tactics.prove(@term_syntax.parse_term("monotonic((c : ((_) -> Bool, _) -> Bool)) → monotonic(If((e : (_) -> Bool), c))"), t3))
}

///|
let monotonic_if_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOTONIC_IF")

///|
/// `MONOTONIC_IF`
pub fn monotonic_if() -> @kernel.Thm {
  monotonic_if_c.get()
}

///|
/// MONOTONIC_ITE
fn step_11() -> Unit raise {
  let t4 = @sets.set_tac(@list.List([]))
  let t5 = @tactics.then_tac(@simp.rewrite_tac(@list.List([monotonic(), ite_def()])), t4)
  monotonic_ite_c.set(@tactics.prove(@term_syntax.parse_term("monotonic((c1 : ((_) -> Bool, _) -> Bool)) && monotonic((c2 : ((_) -> Bool, _) -> Bool)) → monotonic(Ite((e : (_) -> Bool), c1, c2))"), t5))
}

///|
let monotonic_ite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOTONIC_ITE")

///|
/// `MONOTONIC_ITE`
pub fn monotonic_ite() -> @kernel.Thm {
  monotonic_ite_c.get()
}

///|
/// MONOTONIC_SEQ
fn step_12() -> Unit raise {
  let t6 = @sets.set_tac(@list.List([]))
  let t7 = @tactics.then_tac(@simp.rewrite_tac(@list.List([monotonic(), sequence(), @trivia.o_thm()])), t6)
  monotonic_seq_c.set(@tactics.prove(@term_syntax.parse_term("monotonic((c1 : ((_) -> Bool, _) -> Bool)) && monotonic((c2 : ((_) -> Bool, _) -> Bool)) → monotonic(op_semi_semi(c1, c2))"), t7))
}

///|
let monotonic_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOTONIC_SEQ")

///|
/// `MONOTONIC_SEQ`
pub fn monotonic_seq() -> @kernel.Thm {
  monotonic_seq_c.get()
}

///|
/// MONOTONIC_WHILE
fn step_13() -> Unit raise {
  let t8 = @sets.set_tac(@list.List([]))
  let t9 = @tactics.then_tac(@simp.rewrite_tac(@list.List([monotonic(), while_def()])), t8)
  monotonic_while_c.set(@tactics.prove(@term_syntax.parse_term("monotonic((c : ((_) -> Bool, _) -> Bool)) → monotonic(While((e : (_) -> Bool), c))"), t9))
}

///|
let monotonic_while_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOTONIC_WHILE")

///|
/// `MONOTONIC_WHILE`
pub fn monotonic_while() -> @kernel.Thm {
  monotonic_while_c.get()
}

///|
/// WHILE_THM
fn step_14() -> Unit raise {
  let t25 = @sets.set_tac(@list.List([]))
  let t24 = @simp.rewrite_tac(@list.List([monotonic()]))
  let t23 = @tactics.pop_assum(fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s21 = @tactics.mp_tac(x20)
    fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s21(x22)
    }
  })
  let t19 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), while_def(), @sets.in_elim_thm()]))
  let t18 = @tactics.disch_then(@tactics.match_mp_tac)
  let t17 = @simp.rewrite_tac(@list.List([if_def(), sequence(), @trivia.o_thm(), @sets.in_elim_thm(), @theorems.imp_imp()]))
  let t15 = @term_syntax.parse_term("∀ s : S, (if (e : (S) -> Bool)(s) { (c : ((S) -> Bool, S) -> Bool)((w : (S) -> Bool), s) } else { (q : (S) -> Bool)(s) }) → w(s)")
  let t16 = (fn(x14 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x10 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s11 = @tactics.mp_tac(x10)
        fn(x12 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s11(x12)
        }
      })(@bool.gen_all(x13))
    })(@bool.disch_all(x14))
  })(@ind_defs.derive_nonschematic_inductive_relations(t15))
  let t26 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t16), t17), t18), t19), t23), t24), t25)
  while_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : (S) -> Bool, ∀ c : ((S) -> Bool, S) -> Bool, ∀ q : (S) -> Bool, monotonic(c) → (∀ s : S, If(e, op_semi_semi(c, While(e, c)), q, s) → While(e, c, q, s)) && (∀ w' : (S) -> Bool, (∀ s : S, If(e, op_semi_semi(c, (q : (S) -> Bool) => w'), q, s) → w'(s)) → (∀ a : S, While(e, c, q, a) → w'(a))) && (∀ s : S, While(e, c, q, s) == If(e, op_semi_semi(c, While(e, c)), q, s))"), t26))
}

///|
let while_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WHILE_THM")

///|
/// `WHILE_THM`
pub fn while_thm() -> @kernel.Thm {
  while_thm_c.get()
}

///|
/// WHILE_FIX
fn step_15() -> Unit raise {
  let t27 = @meson.meson_tac(@list.List([while_thm()]))
  let t28 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t27)
  while_fix_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : (_) -> Bool, ∀ c : ((_) -> Bool, _) -> Bool, monotonic(c) → While(e, c) == If(e, op_semi_semi(c, While(e, c)))"), t28))
}

///|
let while_fix_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WHILE_FIX")

///|
/// `WHILE_FIX`
pub fn while_fix() -> @kernel.Thm {
  while_fix_c.get()
}

///|
/// correct
fn step_16() -> Unit raise {
  correct_c.set(@pair.new_definition(@term_syntax.parse_term("(correct : ((_) -> Bool, (_, _) -> Bool, _) -> Bool)((p : (_) -> Bool), (c : (_, _) -> Bool), (q : _)) == SUBSET(p, c(q))")))
}

///|
let correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("correct")

///|
/// `correct`
pub fn correct() -> @kernel.Thm {
  correct_c.get()
}

///|
/// CORRECT_PRESTRENGTH
fn step_17() -> Unit raise {
  let t29 = @simp.rewrite_tac(@list.List([correct(), @sets.subset_trans()]))
  correct_prestrength_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ p' : (_) -> Bool, ∀ c : (_, _) -> Bool, ∀ q : _, SUBSET(p, p') && correct(p', c, q) → correct(p, c, q)"), t29))
}

///|
let correct_prestrength_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_PRESTRENGTH")

///|
/// `CORRECT_PRESTRENGTH`
pub fn correct_prestrength() -> @kernel.Thm {
  correct_prestrength_c.get()
}

///|
/// CORRECT_POSTWEAK
fn step_18() -> Unit raise {
  let t30 = @sets.set_tac(@list.List([]))
  let t31 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), monotonic()])), t30)
  correct_postweak_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ c : ((_) -> Bool, _) -> Bool, ∀ q : (_) -> Bool, ∀ q' : (_) -> Bool, monotonic(c) && correct(p, c, q') && SUBSET(q', q) → correct(p, c, q)"), t31))
}

///|
let correct_postweak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_POSTWEAK")

///|
/// `CORRECT_POSTWEAK`
pub fn correct_postweak() -> @kernel.Thm {
  correct_postweak_c.get()
}

///|
/// CORRECT_ASSIGN
fn step_19() -> Unit raise {
  let t32 = @simp.rewrite_tac(@list.List([correct(), assign()]))
  correct_assign_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ f : (_) -> _, ∀ q : (_) -> Bool, SUBSET(p, o(q, f)) → correct(p, Assign(f), q)"), t32))
}

///|
let correct_assign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_ASSIGN")

///|
/// `CORRECT_ASSIGN`
pub fn correct_assign() -> @kernel.Thm {
  correct_assign_c.get()
}

///|
/// CORRECT_SEQ
fn step_20() -> Unit raise {
  let t33 = @sets.set_tac(@list.List([]))
  let t34 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), sequence(), monotonic(), @trivia.o_thm()])), t33)
  correct_seq_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ q : (_) -> Bool, ∀ r : (_) -> Bool, ∀ c1 : ((_) -> Bool, _) -> Bool, ∀ c2 : ((_) -> Bool, _) -> Bool, monotonic(c1) && correct(p, c1, r) && correct(r, c2, q) → correct(p, op_semi_semi(c1, c2), q)"), t34))
}

///|
let correct_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_SEQ")

///|
/// `CORRECT_SEQ`
pub fn correct_seq() -> @kernel.Thm {
  correct_seq_c.get()
}

///|
/// CORRECT_ITE
fn step_21() -> Unit raise {
  let t35 = @sets.set_tac(@list.List([]))
  let t36 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), ite_def()])), t35)
  correct_ite_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ e : (_) -> Bool, ∀ c1 : ((_) -> Bool, _) -> Bool, ∀ c2 : ((_) -> Bool, _) -> Bool, ∀ q : (_) -> Bool, correct(INTER(p, e), c1, q) && correct(INTER(p, DIFF(UNIV, e)), c2, q) → correct(p, Ite(e, c1, c2), q)"), t36))
}

///|
let correct_ite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_ITE")

///|
/// `CORRECT_ITE`
pub fn correct_ite() -> @kernel.Thm {
  correct_ite_c.get()
}

///|
/// CORRECT_IF
fn step_22() -> Unit raise {
  let t37 = @sets.set_tac(@list.List([]))
  let t38 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), if_def()])), t37)
  correct_if_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ e : (_) -> Bool, ∀ c : ((_) -> Bool, _) -> Bool, ∀ q : (_) -> Bool, correct(INTER(p, e), c, q) && SUBSET(INTER(p, DIFF(UNIV, e)), q) → correct(p, If(e, c), q)"), t38))
}

///|
let correct_if_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_IF")

///|
/// `CORRECT_IF`
pub fn correct_if() -> @kernel.Thm {
  correct_if_c.get()
}

///|
/// CORRECT_WHILE
fn step_23() -> Unit raise {
  let t73 = @simp.asm_simp_tac(@list.List([@sets.inter(), @sets.in_elim_thm(), @sets.in_()]))
  let t72 = @tactics.disch_then(@tactics.match_mp_tac)
  let t71 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_(), @theorems.right_imp_forall_thm()]))
  let t68 = @simp.gen_rewrite_rule(fn(x67 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x67
  }, @list.List([monotonic()]))
  let t70 = @tactics.first_x_assum(fn(x69 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s65 = @tactics.mp_tac(x64)
      fn(x66 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s65(x66)
      }
    })(t68(x69))
  })
  let t63 = @simp.asm_rewrite_tac(@list.List([]))
  let t58 = @term_syntax.parse_term("(s : S)")
  let t59 = @list.List([@term_syntax.parse_term("(s : S)"), t58])
  let t62 = @tactics.first_x_assum(fn(x61 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x55 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s56 = @tactics.mp_tac(x55)
      fn(x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s56(x57)
      }
    })(((x60 : @kernel.Thm) => @bool.specl(t59, x60))(x61))
  })
  let t54 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t53 = @simp.rewrite_tac(@list.List([if_def(), sequence(), @trivia.o_thm(), @sets.in_elim_thm()]))
  let t52 = @tactics.first_assum(fn(x50 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x50
    @simp.once_rewrite_tac(@list.List([@drule.match_mp(while_fix())(th)]))
  })
  let t49 = @tactics.repeat_tac(@tactics.disch_tac)
  let t48 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : S)"))
  let t45 = @simp.rewrite_rule(@list.List([@wf.wf_ind()]))
  let t47 = @tactics.first_assum(fn(x46 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t45(x46))
  })
  let t44 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t43 = @tactics.subgoal_then(@term_syntax.parse_term("∀ s : S, (invariant : (S) -> Bool)(s) → While((e : (S) -> Bool), (c : ((S) -> Bool, S) -> Bool), (q : (S) -> Bool), s)"), fn(x40 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s41 = @tactics.mp_tac(x40)
    fn(x42 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s41(x42)
    }
  })
  let t39 = @tactics.repeat_tac(@tactics.gen_tac)
  let t74 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), @sets.subset(), @sets.in_inter(), @sets.in_univ(), @sets.in_diff(), @sets.in_()])), t39), @tactics.strip_tac), t43), t44), t47), t48), t49), t52), t53), @class.cond_cases_tac), t54), t62), t63), t70), t71), t72), t73)
  correct_while_c.set(@tactics.prove(@term_syntax.parse_term("∀ `<<` : (S, S) -> Bool, ∀ p : (S) -> Bool, ∀ c : ((S) -> Bool, S) -> Bool, ∀ q : (S) -> Bool, ∀ e : (S) -> Bool, ∀ invariant : (S) -> Bool, monotonic(c) && WF(`<<`) && SUBSET(p, invariant) && SUBSET(INTER(DIFF(UNIV, e), invariant), q) && (∀ X : S, correct(INTER(invariant, INTER(e, (s : S) => X == s)), c, INTER(invariant, (s : S) => `<<`(s, X)))) → correct(p, While(e, c), q)"), t74))
}

///|
let correct_while_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_WHILE")

///|
/// `CORRECT_WHILE`
pub fn correct_while() -> @kernel.Thm {
  correct_while_c.get()
}

///|
/// assert_def
fn step_24() -> Unit raise {
  assert_def_c.set(@pair.new_definition(@term_syntax.parse_term("(assert_ : ((S) -> Bool, (S) -> Bool, S) -> Bool)((p : (S) -> Bool), (q : (S) -> Bool)) == q")))
}

///|
let assert_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("assert_def")

///|
/// `assert_def`
pub fn assert_def() -> @kernel.Thm {
  assert_def_c.get()
}

///|
/// variant_def
fn step_25() -> Unit raise {
  variant_def_c.set(@pair.new_definition(@term_syntax.parse_term("(variant : ((S, S) -> Bool, (S) -> Bool, S) -> Bool)((op_lt_lt : (S, S) -> Bool), (q : (S) -> Bool)) == q")))
}

///|
let variant_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("variant_def")

///|
/// `variant_def`
pub fn variant_def() -> @kernel.Thm {
  variant_def_c.get()
}

///|
/// CORRECT_SEQ_VC
fn step_26() -> Unit raise {
  let t75 = @sets.set_tac(@list.List([]))
  let t76 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), sequence(), monotonic(), assert_def(), @trivia.o_thm()])), t75)
  correct_seq_vc_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ q : (_) -> Bool, ∀ r : (_) -> Bool, ∀ c1 : ((_) -> Bool, _) -> Bool, ∀ c2 : ((_) -> Bool, _) -> Bool, monotonic(c1) && correct(p, c1, r) && correct(r, c2, q) → correct(p, op_semi_semi(c1, op_semi_semi(assert_(r), c2)), q)"), t76))
}

///|
let correct_seq_vc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_SEQ_VC")

///|
/// `CORRECT_SEQ_VC`
pub fn correct_seq_vc() -> @kernel.Thm {
  correct_seq_vc_c.get()
}

///|
/// CORRECT_WHILE_VC
fn step_27() -> Unit raise {
  let t78 = @meson.asm_meson_tac(@list.List([correct_while()]))
  let t77 = @simp.rewrite_tac(@list.List([sequence(), variant_def(), assert_def(), @trivia.o_def(), @class.eta_ax()]))
  let t79 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t77), t78)
  correct_while_vc_c.set(@tactics.prove(@term_syntax.parse_term("∀ `<<` : (S, S) -> Bool, ∀ p : (S) -> Bool, ∀ c : ((S) -> Bool, S) -> Bool, ∀ q : (S) -> Bool, ∀ e : (S) -> Bool, ∀ invariant : (S) -> Bool, monotonic(c) && WF(`<<`) && SUBSET(p, invariant) && SUBSET(INTER(DIFF(UNIV, e), invariant), q) && (∀ X : S, correct(INTER(invariant, INTER(e, (s : S) => X == s)), c, INTER(invariant, (s : S) => `<<`(s, X)))) → correct(p, While(e, op_semi_semi(assert_(invariant), op_semi_semi(variant(`<<`), c))), q)"), t79))
}

///|
let correct_while_vc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_WHILE_VC")

///|
/// `CORRECT_WHILE_VC`
pub fn correct_while_vc() -> @kernel.Thm {
  correct_while_vc_c.get()
}

///|
/// MONOTONIC_ASSERT
fn step_28() -> Unit raise {
  let t80 = @simp.rewrite_tac(@list.List([assert_def(), monotonic()]))
  monotonic_assert_c.set(@tactics.prove(@term_syntax.parse_term("monotonic(assert_((p : (_) -> Bool)))"), t80))
}

///|
let monotonic_assert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOTONIC_ASSERT")

///|
/// `MONOTONIC_ASSERT`
pub fn monotonic_assert() -> @kernel.Thm {
  monotonic_assert_c.get()
}

///|
/// MONOTONIC_VARIANT
fn step_29() -> Unit raise {
  let t81 = @simp.rewrite_tac(@list.List([variant_def(), monotonic()]))
  monotonic_variant_c.set(@tactics.prove(@term_syntax.parse_term("monotonic(variant((p : (_, _) -> Bool)))"), t81))
}

///|
let monotonic_variant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MONOTONIC_VARIANT")

///|
/// `MONOTONIC_VARIANT`
pub fn monotonic_variant() -> @kernel.Thm {
  monotonic_variant_c.get()
}

///|
/// MONO_TAC
fn step_30() -> Unit raise {
  let t86 = @tactics.map_first(fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s84 = @tactics.match_accept_tac(x83)
    fn(x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s84(x85)
    }
  }, @list.List([monotonic_assign(), monotonic_assert(), monotonic_variant()]))
  let t82 = @tactics.then_tac(@tactics.map_first(@tactics.match_mp_tac, @list.List([monotonic_seq(), monotonic_if(), monotonic_ite()])), @tactics.conj_tac)
  mono_tac_c.set(@tactics.then_tac(@tactics.repeat_tac(@tactics.orelse_tac(@tactics.match_mp_tac(monotonic_while()), t82)), t86))
}

///|
let mono_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("MONO_TAC")

///|
/// `MONO_TAC`
pub fn mono_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (mono_tac_c.get())(x)
}

///|
/// VC_TAC
fn step_31() -> Unit raise {
  let t91 = @tactics.match_mp_tac(correct_assign())
  let t88 = @tactics.repeat_tac(@tactics.gen_tac)
  let t89 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @wf.measure()])), t88)
  let t90 = @list.List([mono_tac, @tactics.try_tac(@tactics.match_accept_tac(@wf.wf_measure())), @tactics.all_tac, @tactics.all_tac, t89])
  let t87 = @tactics.repeat_tac(@tactics.conj_tac)
  let t92 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(correct_while_vc()), t87), t90)
  let t93 = @tactics.then_tac(@tactics.match_mp_tac(correct_if()), @tactics.conj_tac)
  let t94 = @tactics.then_tac(@tactics.match_mp_tac(correct_ite()), @tactics.conj_tac)
  vc_tac_c.set(@tactics.first(@list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(correct_seq_vc()), @tactics.conj_tac), @list.List([mono_tac, @tactics.conj_tac])), t94, t93, t92, t91])))
}

///|
let vc_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("VC_TAC")

///|
/// `VC_TAC`
pub fn vc_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (vc_tac_c.get())(x)
}

///|
/// Tutorial/Semantics_of_programming_languages_shallow.ml:182
fn step_32() -> Unit raise {
  ignore(@tactics.g(@term_syntax.parse_term("correct(fn { (m, n, x, y) => true }, op_semi_semi(Assign(fn { (m, n, x, y) => (m, n, m, n) }), op_semi_semi(assert_(fn { (m, n, x, y) => x == m && y == n }), op_semi_semi(While(fn { (m, n, x, y) => !(x == 0 || y == 0) }, op_semi_semi(assert_(fn { (m, n, x, y) => gcd((x, y)) == gcd((m, n)) }), op_semi_semi(variant(MEASURE(fn { (m, n, x, y) => x + y })), Ite(fn { (m, n, x, y) => x < y }, Assign(fn { (m, n, x, y) => (m, n, x, y - x) }), Assign(fn { (m, n, x, y) => (m, n, x - y, y) }))))), op_semi_semi(assert_(fn { (m, n, x, y) => (x == 0 || y == 0) && gcd((x, y)) == gcd((m, n)) }), If(fn { (m, n, x, y) => x == 0 }, Assign(fn { (m, n, x, y) => (m, n, y, y) })))))), fn { (m, n, x, y) => gcd((m, n)) == x })")))
}

///|
/// Tutorial/Semantics_of_programming_languages_shallow.ml:196
fn step_33() -> Unit raise {
  ignore(@tactics.e(@tactics.repeat_tac(vc_tac)))
}

///|
/// Tutorial/Semantics_of_programming_languages_shallow.ml:198
fn step_34() -> Unit raise {
  ignore(@tactics.b())
}

///|
/// Tutorial/Semantics_of_programming_languages_shallow.ml:199
fn step_35() -> Unit raise {
  let t102 = @simp.simp_tac(@list.List([]))
  let t101 = @tactics.conv_tac(@equal.top_depth_conv(@pair.gen_beta_conv))
  let t100 = @simp.rewrite_tac(@list.List([@sets.in_(), @sets.inter(), @sets.univ(), @sets.diff(), @trivia.o_def(), @sets.in_elim_thm(), @pair.pair_eq()]))
  let t96 = @term_syntax.parse_term("(y : Num)")
  let t97 = @term_syntax.parse_term("(x : Num)")
  let t98 = @term_syntax.parse_term("(n : Num)")
  let t99 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(m : Num)"), t98, t97, t96]))
  let t95 = @simp.rewrite_tac(@list.List([@sets.subset(), @pair.forall_pair_thm()]))
  ignore(@tactics.e(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(vc_tac), t95), t99), t100), t101), t102)))
}

///|
/// Tutorial/Semantics_of_programming_languages_shallow.ml:204
fn step_36() -> Unit raise {
  ignore(@tactics.e(@simp.simp_tac(@list.List([@prime.gcd_sub(), @arith.lt_imp_le()]))))
}

///|
/// Tutorial/Semantics_of_programming_languages_shallow.ml:205
fn step_37() -> Unit raise {
  ignore(@tactics.e(@int.arith_tac))
}

///|
/// Tutorial/Semantics_of_programming_languages_shallow.ml:207
fn step_38() -> Unit raise {
  ignore(@tactics.e(@tactics.then_tac(@simp.simp_tac(@list.List([@prime.gcd_sub(), @arith.not_lt()])), @int.arith_tac)))
}

///|
/// Tutorial/Semantics_of_programming_languages_shallow.ml:209
fn step_39() -> Unit raise {
  ignore(@tactics.e(@meson.meson_tac(@list.List([@prime.gcd_0()]))))
}

///|
/// Tutorial/Semantics_of_programming_languages_shallow.ml:211
fn step_40() -> Unit raise {
  ignore(@tactics.e(@meson.meson_tac(@list.List([@prime.gcd_0(), @prime.gcd_sym()]))))
}

///|
/// Tutorial/Semantics_of_programming_languages_shallow.ml:213
fn step_41() -> Unit raise {
  @printer.parse_as_infix("refines", (12L, "right"))
}

///|
/// refines
fn step_42() -> Unit raise {
  refines_c.set(@pair.new_definition(@term_syntax.parse_term("(refines : ((_, _) -> Bool, (_, _) -> Bool) -> Bool)((c2 : (_, _) -> Bool), (c1 : (_, _) -> Bool)) == (∀ q : _, SUBSET(c1(q), c2(q)))")))
}

///|
let refines_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("refines")

///|
/// `refines`
pub fn refines() -> @kernel.Thm {
  refines_c.get()
}

///|
/// REFINES_REFL
fn step_43() -> Unit raise {
  let t103 = @simp.rewrite_tac(@list.List([refines(), @sets.subset_refl()]))
  refines_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : (_, _) -> Bool, refines(c, c)"), t103))
}

///|
let refines_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFINES_REFL")

///|
/// `REFINES_REFL`
pub fn refines_refl() -> @kernel.Thm {
  refines_refl_c.get()
}

///|
/// REFINES_TRANS
fn step_44() -> Unit raise {
  let t104 = @meson.meson_tac(@list.List([@sets.subset_trans()]))
  let t105 = @tactics.then_tac(@simp.rewrite_tac(@list.List([refines()])), t104)
  refines_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : (_, _) -> Bool, ∀ c2 : (_, _) -> Bool, ∀ c3 : (_, _) -> Bool, refines(c3, c2) && refines(c2, c1) → refines(c3, c1)"), t105))
}

///|
let refines_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFINES_TRANS")

///|
/// `REFINES_TRANS`
pub fn refines_trans() -> @kernel.Thm {
  refines_trans_c.get()
}

///|
/// REFINES_CORRECT
fn step_45() -> Unit raise {
  let t106 = @meson.meson_tac(@list.List([@sets.subset_trans()]))
  let t107 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), refines()])), t106)
  refines_correct_c.set(@tactics.prove(@term_syntax.parse_term("correct((p : (_) -> Bool), (c1 : (_, _) -> Bool), (q : _)) && refines((c2 : (_, _) -> Bool), c1) → correct(p, c2, q)"), t107))
}

///|
let refines_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFINES_CORRECT")

///|
/// `REFINES_CORRECT`
pub fn refines_correct() -> @kernel.Thm {
  refines_correct_c.get()
}

///|
/// REFINES_WHILE
fn step_46() -> Unit raise {
  let t108 = @meson.meson_tac(@list.List([]))
  let t109 = @tactics.then_tac(@simp.rewrite_tac(@list.List([refines(), while_def(), @sets.subset(), @sets.in_elim_thm(), @sets.in_()])), t108)
  refines_while_c.set(@tactics.prove(@term_syntax.parse_term("refines((c' : ((_) -> Bool, _) -> Bool), (c : ((_) -> Bool, _) -> Bool)) → refines(While((e : (_) -> Bool), c'), While(e, c))"), t109))
}

///|
let refines_while_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFINES_WHILE")

///|
/// `REFINES_WHILE`
pub fn refines_while() -> @kernel.Thm {
  refines_while_c.get()
}

///|
/// specification
fn step_47() -> Unit raise {
  specification_c.set(@pair.new_definition(@term_syntax.parse_term("(specification : (((_) -> Bool, (_) -> Bool), (_) -> Bool, _) -> Bool)(((p : (_) -> Bool), (q : (_) -> Bool)), (r : (_) -> Bool)) == (if SUBSET(q, r) { p } else { {} })")))
}

///|
let specification_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("specification")

///|
/// `specification`
pub fn specification() -> @kernel.Thm {
  specification_c.get()
}

///|
/// REFINES_SPECIFICATION
fn step_48() -> Unit raise {
  let t110 = @meson.meson_tac(@list.List([@sets.subset_refl(), @sets.subset_empty()]))
  let t111 = @tactics.then_tac(@simp.rewrite_tac(@list.List([specification(), correct(), refines()])), t110)
  refines_specification_c.set(@tactics.prove(@term_syntax.parse_term("refines((c : ((_) -> Bool, _) -> Bool), specification(((p : (_) -> Bool), (q : (_) -> Bool)))) → correct(p, c, q)"), t111))
}

///|
let refines_specification_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFINES_SPECIFICATION")

///|
/// `REFINES_SPECIFICATION`
pub fn refines_specification() -> @kernel.Thm {
  refines_specification_c.get()
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
}
