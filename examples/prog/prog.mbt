// Translated from upstream Examples/prog.ml; edit this file directly.

///|
/// Examples/prog.ml:5
fn step_1() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// Examples/prog.ml:7
fn step_2() -> Unit raise {
  @printer.parse_as_infix("refined", (12L, "right"))
}

///|
/// Examples/prog.ml:13
fn step_3() -> Unit raise {
  @printer.parse_as_infix("AND", (20L, "right"))
}

///|
/// Examples/prog.ml:14
fn step_4() -> Unit raise {
  @printer.parse_as_infix("OR", (16L, "right"))
}

///|
/// Examples/prog.ml:15
fn step_5() -> Unit raise {
  @printer.parse_as_infix("IMP", (13L, "right"))
}

///|
/// Examples/prog.ml:16
fn step_6() -> Unit raise {
  @printer.parse_as_infix("IMPLIES", (12L, "right"))
}

///|
/// FALSE
fn step_7() -> Unit raise {
  false__c.set(@pair.new_definition(@term_syntax.parse_term("(FALSE : (S) -> Bool) == ((x : S) => false)")))
}

///|
let false__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FALSE")

///|
/// `FALSE`
pub fn false_() -> @kernel.Thm {
  false__c.get()
}

///|
/// TRUE
fn step_8() -> Unit raise {
  true__c.set(@pair.new_definition(@term_syntax.parse_term("(TRUE : (S) -> Bool) == ((x : S) => true)")))
}

///|
let true__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRUE")

///|
/// `TRUE`
pub fn true_() -> @kernel.Thm {
  true__c.get()
}

///|
/// NOT
fn step_9() -> Unit raise {
  not__c.set(@pair.new_definition(@term_syntax.parse_term("(NOT : ((S) -> Bool, S) -> Bool)((p : (S) -> Bool)) == ((x : S) => !p(x))")))
}

///|
let not__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT")

///|
/// `NOT`
pub fn not_() -> @kernel.Thm {
  not__c.get()
}

///|
/// AND
fn step_10() -> Unit raise {
  and__c.set(@pair.new_definition(@term_syntax.parse_term("(AND : ((S) -> Bool, (S) -> Bool, S) -> Bool)((p : (S) -> Bool), (q : (S) -> Bool)) == ((x : S) => p(x) && q(x))")))
}

///|
let and__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AND")

///|
/// `AND`
pub fn and_() -> @kernel.Thm {
  and__c.get()
}

///|
/// OR
fn step_11() -> Unit raise {
  or_c.set(@pair.new_definition(@term_syntax.parse_term("(OR : ((S) -> Bool, (S) -> Bool, S) -> Bool)((p : (S) -> Bool), (q : (S) -> Bool)) == ((x : S) => p(x) || q(x))")))
}

///|
let or_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("OR")

///|
/// `OR`
pub fn or() -> @kernel.Thm {
  or_c.get()
}

///|
/// ANDS
fn step_12() -> Unit raise {
  ands_c.set(@pair.new_definition(@term_syntax.parse_term("(ANDS : (((S) -> Bool) -> Bool, S) -> Bool)((P : ((S) -> Bool) -> Bool)) == ((x : S) => ∀ p : (S) -> Bool, P(p) → p(x))")))
}

///|
let ands_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ANDS")

///|
/// `ANDS`
pub fn ands() -> @kernel.Thm {
  ands_c.get()
}

///|
/// ORS
fn step_13() -> Unit raise {
  ors_c.set(@pair.new_definition(@term_syntax.parse_term("(ORS : (((S) -> Bool) -> Bool, S) -> Bool)((P : ((S) -> Bool) -> Bool)) == ((x : S) => ∃ p : (S) -> Bool, P(p) && p(x))")))
}

///|
let ors_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORS")

///|
/// `ORS`
pub fn ors() -> @kernel.Thm {
  ors_c.get()
}

///|
/// IMP
fn step_14() -> Unit raise {
  imp_c.set(@pair.new_definition(@term_syntax.parse_term("(IMP : ((S) -> Bool, (S) -> Bool, S) -> Bool)((p : (S) -> Bool), (q : (S) -> Bool)) == ((x : S) => p(x) → q(x))")))
}

///|
let imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMP")

///|
/// `IMP`
pub fn imp() -> @kernel.Thm {
  imp_c.get()
}

///|
/// IMPLIES
fn step_15() -> Unit raise {
  implies_c.set(@pair.new_definition(@term_syntax.parse_term("(IMPLIES : ((S) -> Bool, (S) -> Bool) -> Bool)((p : (S) -> Bool), (q : (S) -> Bool)) == (∀ x : S, p(x) → q(x))")))
}

///|
let implies_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMPLIES")

///|
/// `IMPLIES`
pub fn implies() -> @kernel.Thm {
  implies_c.get()
}

///|
/// PRED_TAUT
fn step_16() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([]))
  let tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@simp.rewrite_tac(@list.List([false_(), true_(), not_(), and_(), or(), ands(), ors(), imp(), implies(), @class.fun_eq_thm()])), t1)
  pred_taut_c.set(fn(x2 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x2
    @tactics.prove(tm, tac)
  })
}

///|
let pred_taut_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("PRED_TAUT")

///|
/// `PRED_TAUT`
pub fn pred_taut(x : @kernel.Term) -> @kernel.Thm raise {
  (pred_taut_c.get())(x)
}

///|
/// IMPLIES_TRANS
fn step_17() -> Unit raise {
  implies_trans_c.set(pred_taut(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ q : (_) -> Bool, ∀ r : (_) -> Bool, IMPLIES(p, q) && IMPLIES(q, r) → IMPLIES(p, r)")))
}

///|
let implies_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMPLIES_TRANS")

///|
/// `IMPLIES_TRANS`
pub fn implies_trans() -> @kernel.Thm {
  implies_trans_c.get()
}

///|
/// Examples/prog.ml:70
fn step_18() -> Unit raise {
  @printer.parse_as_infix("Seq", (26L, "right"))
}

///|
let command_induction_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("command_INDUCTION")

///|
/// `command_INDUCTION`
pub fn command_induction() -> @kernel.Thm {
  command_induction_c.get()
}

///|
let command_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("command_RECURSION")

///|
/// `command_RECURSION`
pub fn command_recursion() -> @kernel.Thm {
  command_recursion_c.get()
}

///|
/// command_INDUCTION, command_RECURSION
fn step_19() -> Unit raise {
  let (command_induction, command_recursion) = @ind_types.define_type("enum Command { Assign((S) -> S); Seq(Command, Command); Ite((S) -> Bool, Command, Command); While((S) -> Bool, Command) }")
  command_induction_c.set(command_induction)
  command_recursion_c.set(command_recursion)
}

///|
/// SKIP
fn step_20() -> Unit raise {
  skip_c.set(@pair.new_definition(@term_syntax.parse_term("(SKIP : Command[_]) == Assign(I)")))
}

///|
let skip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SKIP")

///|
/// `SKIP`
pub fn skip() -> @kernel.Thm {
  skip_c.get()
}

///|
/// ABORT
fn step_21() -> Unit raise {
  abort__c.set(@pair.new_definition(@term_syntax.parse_term("(ABORT : Command[_]) == While(TRUE, SKIP)")))
}

///|
let abort__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABORT")

///|
/// `ABORT`
pub fn abort_() -> @kernel.Thm {
  abort__c.get()
}

///|
/// IF
fn step_22() -> Unit raise {
  if__c.set(@pair.new_definition(@term_syntax.parse_term("(IF : ((_) -> Bool, Command[_]) -> Command[_])((e : (_) -> Bool), (c : Command[_])) == Ite(e, c, SKIP)")))
}

///|
let if__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IF")

///|
/// `IF`
pub fn if_() -> @kernel.Thm {
  if__c.get()
}

///|
/// DO
fn step_23() -> Unit raise {
  do__c.set(@pair.new_definition(@term_syntax.parse_term("(DO : (Command[_], (_) -> Bool) -> Command[_])((c : Command[_]), (e : (_) -> Bool)) == Seq(c, While(e, c))")))
}

///|
let do__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DO")

///|
/// `DO`
pub fn do_() -> @kernel.Thm {
  do__c.get()
}

///|
/// ASSERT
fn step_24() -> Unit raise {
  assert_c.set(@pair.new_definition(@term_syntax.parse_term("(ASSERT : ((_) -> Bool) -> Command[_])((g : (_) -> Bool)) == Ite(g, SKIP, ABORT)")))
}

///|
let assert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ASSERT")

///|
/// `ASSERT`
pub fn assert_() -> @kernel.Thm {
  assert_c.get()
}

///|
/// AWHILE
fn step_25() -> Unit raise {
  awhile_c.set(@pair.new_definition(@term_syntax.parse_term("(AWHILE : ((S) -> Bool, (S, S) -> Bool, (S) -> Bool, Command[S]) -> Command[S])((i : (S) -> Bool), (v : (S, S) -> Bool), (e : (S) -> Bool), (c : Command[S])) == While(e, c)")))
}

///|
let awhile_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AWHILE")

///|
/// `AWHILE`
pub fn awhile() -> @kernel.Thm {
  awhile_c.get()
}

///|
/// ADO
fn step_26() -> Unit raise {
  ado_c.set(@pair.new_definition(@term_syntax.parse_term("(ADO : ((S) -> Bool, (S, S) -> Bool, Command[S], (S) -> Bool) -> Command[S])((i : (S) -> Bool), (v : (S, S) -> Bool), (c : Command[S]), (e : (S) -> Bool)) == DO(c, e)")))
}

///|
let ado_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ADO")

///|
/// `ADO`
pub fn ado() -> @kernel.Thm {
  ado_c.get()
}

///|
/// command_DISTINCT
fn step_27() -> Unit raise {
  command_distinct_c.set(@ind_types.distinctness("command"))
}

///|
let command_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("command_DISTINCT")

///|
/// `command_DISTINCT`
pub fn command_distinct() -> @kernel.Thm {
  command_distinct_c.get()
}

///|
/// command_INJECTIVE
fn step_28() -> Unit raise {
  command_injective_c.set(@ind_types.injectivity("command"))
}

///|
let command_injective_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("command_INJECTIVE")

///|
/// `command_INJECTIVE`
pub fn command_injective() -> @kernel.Thm {
  command_injective_c.get()
}

///|
let sem_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sem_RULES")

///|
/// `sem_RULES`
pub fn sem_rules() -> @kernel.Thm {
  sem_rules_c.get()
}

///|
let sem_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sem_INDUCT")

///|
/// `sem_INDUCT`
pub fn sem_induct() -> @kernel.Thm {
  sem_induct_c.get()
}

///|
let sem_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sem_CASES")

///|
/// `sem_CASES`
pub fn sem_cases() -> @kernel.Thm {
  sem_cases_c.get()
}

///|
/// sem_RULES, sem_INDUCT, sem_CASES
fn step_29() -> Unit raise {
  let (sem_rules, sem_induct, sem_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ f : (_) -> _, ∀ s : _, (sem : (Command[_], _, _) -> Bool)(Assign(f), s, f(s))) && (∀ c1 : Command[_], ∀ c2 : Command[_], ∀ s : _, ∀ s' : _, ∀ s'' : _, sem(c1, s, s') && sem(c2, s', s'') → sem(Seq(c1, c2), s, s'')) && (∀ e : (_) -> Bool, ∀ c1 : Command[_], ∀ c2 : Command[_], ∀ s : _, ∀ s' : _, e(s) && sem(c1, s, s') → sem(Ite(e, c1, c2), s, s')) && (∀ e : (_) -> Bool, ∀ c1 : Command[_], ∀ c2 : Command[_], ∀ s : _, ∀ s' : _, !e(s) && sem(c2, s, s') → sem(Ite(e, c1, c2), s, s')) && (∀ e : (_) -> Bool, ∀ c : Command[_], ∀ s : _, !e(s) → sem(While(e, c), s, s)) && (∀ e : (_) -> Bool, ∀ c : Command[_], ∀ s : _, ∀ s' : _, ∀ s'' : _, e(s) && sem(c, s, s') && sem(While(e, c), s', s'') → sem(While(e, c), s, s''))"))
  sem_rules_c.set(sem_rules)
  sem_induct_c.set(sem_induct)
  sem_cases_c.set(sem_cases)
}

///|
/// SEM_ASSIGN
fn step_30() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([]))
  let t6 = @simp.rewrite_tac(@list.List([command_distinct(), command_injective()]))
  let t8 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x3 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s4 = @equal.land_conv(x3)
    fn(x5 : @kernel.Term) -> @kernel.Thm raise {
      s4(x5)
    }
  }, @list.List([sem_cases()])), t6), t7)
  sem_assign_c.set(@tactics.prove(@term_syntax.parse_term("sem(Assign((f : (_) -> _)), (s : _), (s' : _)) == (s' == f(s))"), t8))
}

///|
let sem_assign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEM_ASSIGN")

///|
/// `SEM_ASSIGN`
pub fn sem_assign() -> @kernel.Thm {
  sem_assign_c.get()
}

///|
/// SEM_SEQ
fn step_31() -> Unit raise {
  let t13 = @meson.meson_tac(@list.List([]))
  let t12 = @simp.rewrite_tac(@list.List([command_distinct(), command_injective()]))
  let t14 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x9 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s10 = @equal.land_conv(x9)
    fn(x11 : @kernel.Term) -> @kernel.Thm raise {
      s10(x11)
    }
  }, @list.List([sem_cases()])), t12), t13)
  sem_seq_c.set(@tactics.prove(@term_syntax.parse_term("sem(Seq((c1 : Command[_]), (c2 : Command[_])), (s : _), (s' : _)) == (∃ s'' : _, sem(c1, s, s'') && sem(c2, s'', s'))"), t14))
}

///|
let sem_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEM_SEQ")

///|
/// `SEM_SEQ`
pub fn sem_seq() -> @kernel.Thm {
  sem_seq_c.get()
}

///|
/// SEM_ITE
fn step_32() -> Unit raise {
  let t19 = @meson.meson_tac(@list.List([]))
  let t18 = @simp.rewrite_tac(@list.List([command_distinct(), command_injective()]))
  let t20 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x15 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s16 = @equal.land_conv(x15)
    fn(x17 : @kernel.Term) -> @kernel.Thm raise {
      s16(x17)
    }
  }, @list.List([sem_cases()])), t18), t19)
  sem_ite_c.set(@tactics.prove(@term_syntax.parse_term("sem(Ite((e : (_) -> Bool), (c1 : Command[_]), (c2 : Command[_])), (s : _), (s' : _)) == (e(s) && sem(c1, s, s') || !e(s) && sem(c2, s, s'))"), t20))
}

///|
let sem_ite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEM_ITE")

///|
/// `SEM_ITE`
pub fn sem_ite() -> @kernel.Thm {
  sem_ite_c.get()
}

///|
/// SEM_SKIP
fn step_33() -> Unit raise {
  let t21 = @simp.rewrite_tac(@list.List([skip(), sem_assign(), @trivia.i_thm()]))
  sem_skip_c.set(@tactics.prove(@term_syntax.parse_term("sem(SKIP, (s : _), (s' : _)) == (s' == s)"), t21))
}

///|
let sem_skip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEM_SKIP")

///|
/// `SEM_SKIP`
pub fn sem_skip() -> @kernel.Thm {
  sem_skip_c.get()
}

///|
/// SEM_IF
fn step_34() -> Unit raise {
  let t22 = @simp.rewrite_tac(@list.List([if_(), sem_ite(), sem_skip(), @theorems.eq_sym_eq()]))
  sem_if_c.set(@tactics.prove(@term_syntax.parse_term("sem(IF((e : (_) -> Bool), (c : Command[_])), (s : _), (s' : _)) == (e(s) && sem(c, s, s') || !e(s) && s == s')"), t22))
}

///|
let sem_if_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEM_IF")

///|
/// `SEM_IF`
pub fn sem_if() -> @kernel.Thm {
  sem_if_c.get()
}

///|
/// SEM_WHILE
fn step_35() -> Unit raise {
  let t29 = @meson.meson_tac(@list.List([]))
  let t28 = @simp.rewrite_tac(@list.List([command_distinct(), command_injective()]))
  let t27 = @tactics.repeat_tac(@tactics.gen_tac)
  let t26 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), sem_if(), sem_seq()]))
  let t30 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x23 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s24 = @equal.land_conv(x23)
    fn(x25 : @kernel.Term) -> @kernel.Thm raise {
      s24(x25)
    }
  }, @list.List([sem_cases()])), t26), t27), t28), t29)
  sem_while_c.set(@tactics.prove(@term_syntax.parse_term("sem(While((e : (_) -> Bool), (c : Command[_])), (s : _), (s' : _)) == sem(IF(e, Seq(c, While(e, c))), s, s')"), t30))
}

///|
let sem_while_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEM_WHILE")

///|
/// `SEM_WHILE`
pub fn sem_while() -> @kernel.Thm {
  sem_while_c.get()
}

///|
/// SEM_ABORT
fn step_36() -> Unit raise {
  let t33 = @meson.meson_tac(@list.List([]))
  let t32 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), true_()]))
  let t31 = @simp.rewrite_tac(@list.List([command_distinct(), command_injective(), abort_()]))
  let t34 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(sem_induct()), t31), t32), t33)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ c : Command[_], ∀ s : _, ∀ s' : _, sem(c, s, s') → !(c == ABORT)"), t34)
  let t35 = @meson.meson_tac(@list.List([lemma]))
  sem_abort_c.set(@tactics.prove(@term_syntax.parse_term("sem(ABORT, (s : _), (s' : _)) == false"), t35))
}

///|
let sem_abort_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEM_ABORT")

///|
/// `SEM_ABORT`
pub fn sem_abort() -> @kernel.Thm {
  sem_abort_c.get()
}

///|
/// SEM_DO
fn step_37() -> Unit raise {
  let t36 = @simp.rewrite_tac(@list.List([do_(), sem_seq(), @equal.gsym(sem_while())]))
  sem_do_c.set(@tactics.prove(@term_syntax.parse_term("sem(DO((c : Command[_]), (e : (_) -> Bool)), (s : _), (s' : _)) == sem(Seq(c, IF(e, DO(c, e))), s, s')"), t36))
}

///|
let sem_do_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEM_DO")

///|
/// `SEM_DO`
pub fn sem_do() -> @kernel.Thm {
  sem_do_c.get()
}

///|
/// SEM_ASSERT
fn step_38() -> Unit raise {
  let t37 = @simp.rewrite_tac(@list.List([assert_(), sem_ite(), sem_skip(), sem_abort()]))
  sem_assert_c.set(@tactics.prove(@term_syntax.parse_term("sem(ASSERT((g : (_) -> Bool)), (s : _), (s' : _)) == (g(s) && s' == s)"), t37))
}

///|
let sem_assert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEM_ASSERT")

///|
/// `SEM_ASSERT`
pub fn sem_assert() -> @kernel.Thm {
  sem_assert_c.get()
}

///|
/// deterministic
fn step_39() -> Unit raise {
  deterministic_c.set(@pair.new_definition(@term_syntax.parse_term("(deterministic : ((_, _) -> Bool) -> Bool)((r : (_, _) -> Bool)) == (∀ s : _, ∀ s1 : _, ∀ s2 : _, r(s, s1) && r(s, s2) → s1 == s2)")))
}

///|
let deterministic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("deterministic")

///|
/// `deterministic`
pub fn deterministic() -> @kernel.Thm {
  deterministic_c.get()
}

///|
/// DETERMINISM
fn step_40() -> Unit raise {
  let t47 = @meson.asm_meson_tac(@list.List([]))
  let t46 = @simp.rewrite_tac(@list.List([command_distinct(), command_injective()]))
  let t45 = @simp.once_rewrite_tac(@list.List([sem_cases()]))
  let t44 = @tactics.repeat_tac(@tactics.gen_tac)
  let t42 = @tactics.repeat_tac(@tactics.gen_tac)
  let t43 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t42), @tactics.disch_tac)])
  let t41 = @tactics.match_mp_tac(sem_induct())
  let t40 = @tactics.subgoal_then(@term_syntax.parse_term("∀ c : Command[S], ∀ s : S, ∀ s1 : S, sem(c, s, s1) → (∀ s2 : S, sem(c, s, s2) → s1 == s2)"), fn(x38 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x38
    @meson.meson_tac(@list.List([th]))
  })
  let t48 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([deterministic()])), t40), t41), @tactics.conj_tac), t43), t44), t45), t46), t47)
  determinism_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Command[S], deterministic(sem(c))"), t48))
}

///|
let determinism_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DETERMINISM")

///|
/// `DETERMINISM`
pub fn determinism() -> @kernel.Thm {
  determinism_c.get()
}

///|
/// terminates
fn step_41() -> Unit raise {
  terminates_c.set(@pair.new_definition(@term_syntax.parse_term("(terminates : (Command[_], _) -> Bool)((c : Command[_]), (s : _)) == (∃ s' : _, sem(c, s, s'))")))
}

///|
let terminates_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("terminates")

///|
/// `terminates`
pub fn terminates() -> @kernel.Thm {
  terminates_c.get()
}

///|
/// wlp
fn step_42() -> Unit raise {
  wlp_c.set(@pair.new_definition(@term_syntax.parse_term("(wlp : (Command[_], (_) -> Bool, _) -> Bool)((c : Command[_]), (q : (_) -> Bool), (s : _)) == (∀ s' : _, sem(c, s, s') → q(s'))")))
}

///|
let wlp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("wlp")

///|
/// `wlp`
pub fn wlp() -> @kernel.Thm {
  wlp_c.get()
}

///|
/// wp
fn step_43() -> Unit raise {
  wp_c.set(@pair.new_definition(@term_syntax.parse_term("(wp : (Command[_], (_) -> Bool, _) -> Bool)((c : Command[_]), (q : (_) -> Bool), (s : _)) == (terminates(c, s) && wlp(c, q, s))")))
}

///|
let wp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("wp")

///|
/// `wp`
pub fn wp() -> @kernel.Thm {
  wp_c.get()
}

///|
/// WP_TOTAL
fn step_44() -> Unit raise {
  let t49 = @meson.meson_tac(@list.List([]))
  let t50 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), wp(), wlp(), terminates(), false_()])), t49)
  wp_total_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Command[_], wp(c, FALSE) == FALSE"), t50))
}

///|
let wp_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_TOTAL")

///|
/// `WP_TOTAL`
pub fn wp_total() -> @kernel.Thm {
  wp_total_c.get()
}

///|
/// WP_MONOTONIC
fn step_45() -> Unit raise {
  let t51 = @meson.meson_tac(@list.List([]))
  let t52 = @tactics.then_tac(@simp.rewrite_tac(@list.List([implies(), wp(), wlp(), terminates()])), t51)
  wp_monotonic_c.set(@tactics.prove(@term_syntax.parse_term("IMPLIES((q : (_) -> Bool), (r : (_) -> Bool)) → IMPLIES(wp((c : Command[_]), q), wp(c, r))"), t52))
}

///|
let wp_monotonic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_MONOTONIC")

///|
/// `WP_MONOTONIC`
pub fn wp_monotonic() -> @kernel.Thm {
  wp_monotonic_c.get()
}

///|
/// WP_CONJUNCTIVE
fn step_46() -> Unit raise {
  let t53 = @meson.meson_tac(@list.List([]))
  let t54 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), wp(), wlp(), terminates(), and_()])), t53)
  wp_conjunctive_c.set(@tactics.prove(@term_syntax.parse_term("AND(wp((c : Command[_]), (q : (_) -> Bool)), wp(c, (r : (_) -> Bool))) == wp(c, AND(q, r))"), t54))
}

///|
let wp_conjunctive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_CONJUNCTIVE")

///|
/// `WP_CONJUNCTIVE`
pub fn wp_conjunctive() -> @kernel.Thm {
  wp_conjunctive_c.get()
}

///|
/// WP_DISJUNCTIVE
fn step_47() -> Unit raise {
  let t55 = @meson.meson_tac(@list.List([@simp.rewrite_rule(@list.List([deterministic()]))(determinism())]))
  let t56 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), wp(), wlp(), or(), terminates()])), t55)
  wp_disjunctive_c.set(@tactics.prove(@term_syntax.parse_term("OR(wp((c : Command[_]), (p : (_) -> Bool)), wp(c, (q : (_) -> Bool))) == wp(c, OR(p, q))"), t56))
}

///|
let wp_disjunctive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_DISJUNCTIVE")

///|
/// `WP_DISJUNCTIVE`
pub fn wp_disjunctive() -> @kernel.Thm {
  wp_disjunctive_c.get()
}

///|
/// WP_ASSIGN
fn step_48() -> Unit raise {
  let t57 = @meson.meson_tac(@list.List([]))
  let t58 = @tactics.then_tac(@simp.rewrite_tac(@list.List([wp(), wlp(), terminates(), @trivia.o_thm(), @class.fun_eq_thm(), sem_assign()])), t57)
  wp_assign_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (_) -> _, ∀ q : (_) -> Bool, wp(Assign(f), q) == o(q, f)"), t58))
}

///|
let wp_assign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_ASSIGN")

///|
/// `WP_ASSIGN`
pub fn wp_assign() -> @kernel.Thm {
  wp_assign_c.get()
}

///|
/// WP_SEQ
fn step_49() -> Unit raise {
  let t59 = @meson.meson_tac(@list.List([@simp.rewrite_rule(@list.List([deterministic()]))(determinism())]))
  let t60 = @tactics.then_tac(@simp.rewrite_tac(@list.List([wp(), wlp(), terminates(), sem_seq(), @class.fun_eq_thm()])), t59)
  wp_seq_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : Command[_], ∀ c2 : Command[_], ∀ q : (_) -> Bool, wp(Seq(c1, c2), q) == wp(c1, wp(c2, q))"), t60))
}

///|
let wp_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_SEQ")

///|
/// `WP_SEQ`
pub fn wp_seq() -> @kernel.Thm {
  wp_seq_c.get()
}

///|
/// WP_ITE
fn step_50() -> Unit raise {
  let t61 = @meson.meson_tac(@list.List([]))
  let t62 = @tactics.then_tac(@simp.rewrite_tac(@list.List([wp(), wlp(), terminates(), sem_ite(), @class.fun_eq_thm(), and_(), or(), not_()])), t61)
  wp_ite_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : (_) -> Bool, ∀ c1 : Command[_], ∀ c2 : Command[_], ∀ q : (_) -> Bool, wp(Ite(e, c1, c2), q) == OR(AND(e, wp(c1, q)), AND(NOT(e), wp(c2, q)))"), t62))
}

///|
let wp_ite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_ITE")

///|
/// `WP_ITE`
pub fn wp_ite() -> @kernel.Thm {
  wp_ite_c.get()
}

///|
/// WP_WHILE
fn step_51() -> Unit raise {
  let t63 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), wp(), wlp(), terminates(), @equal.gsym(sem_while())]))
  wp_while_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : (_) -> Bool, ∀ c : Command[_], wp(IF(e, Seq(c, While(e, c))), (q : (_) -> Bool)) == wp(While(e, c), q)"), t63))
}

///|
let wp_while_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_WHILE")

///|
/// `WP_WHILE`
pub fn wp_while() -> @kernel.Thm {
  wp_while_c.get()
}

///|
/// WP_SKIP
fn step_52() -> Unit raise {
  let t64 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), skip(), wp_assign(), @trivia.i_thm(), @trivia.o_thm()]))
  wp_skip_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : (_) -> Bool, wp(SKIP, q) == q"), t64))
}

///|
let wp_skip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_SKIP")

///|
/// `WP_SKIP`
pub fn wp_skip() -> @kernel.Thm {
  wp_skip_c.get()
}

///|
/// WP_ABORT
fn step_53() -> Unit raise {
  let t65 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), wp(), wlp(), terminates(), sem_abort(), false_()]))
  wp_abort_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : (_) -> Bool, wp(ABORT, q) == FALSE"), t65))
}

///|
let wp_abort_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_ABORT")

///|
/// `WP_ABORT`
pub fn wp_abort() -> @kernel.Thm {
  wp_abort_c.get()
}

///|
/// WP_IF
fn step_54() -> Unit raise {
  let t66 = @simp.rewrite_tac(@list.List([if_(), wp_ite(), wp_skip()]))
  wp_if_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : (_) -> Bool, ∀ c : Command[_], ∀ q : (_) -> Bool, wp(IF(e, c), q) == OR(AND(e, wp(c, q)), AND(NOT(e), q))"), t66))
}

///|
let wp_if_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_IF")

///|
/// `WP_IF`
pub fn wp_if() -> @kernel.Thm {
  wp_if_c.get()
}

///|
/// WP_DO
fn step_55() -> Unit raise {
  let t67 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm(), wp(), wlp(), terminates(), @equal.gsym(sem_do())]))
  wp_do_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : (_) -> Bool, ∀ c : Command[_], wp(Seq(c, IF(e, DO(c, e))), (q : (_) -> Bool)) == wp(DO(c, e), q)"), t67))
}

///|
let wp_do_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_DO")

///|
/// `WP_DO`
pub fn wp_do() -> @kernel.Thm {
  wp_do_c.get()
}

///|
/// WP_ASSERT
fn step_56() -> Unit raise {
  let t68 = @meson.meson_tac(@list.List([]))
  let t69 = @tactics.then_tac(@simp.rewrite_tac(@list.List([wp(), wlp(), terminates(), sem_assert(), @class.fun_eq_thm(), and_()])), t68)
  wp_assert_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (_) -> Bool, ∀ q : (_) -> Bool, wp(ASSERT(g), q) == AND(g, q)"), t69))
}

///|
let wp_assert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_ASSERT")

///|
/// `WP_ASSERT`
pub fn wp_assert() -> @kernel.Thm {
  wp_assert_c.get()
}

///|
/// correct
fn step_57() -> Unit raise {
  correct_c.set(@pair.new_definition(@term_syntax.parse_term("(correct : ((_) -> Bool, Command[_], (_) -> Bool) -> Bool)((p : (_) -> Bool), (c : Command[_]), (q : (_) -> Bool)) == IMPLIES(p, wp(c, q))")))
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
fn step_58() -> Unit raise {
  let t70 = @simp.rewrite_tac(@list.List([correct(), implies_trans()]))
  correct_prestrength_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ p' : (_) -> Bool, ∀ c : Command[_], ∀ q : (_) -> Bool, IMPLIES(p, p') && correct(p', c, q) → correct(p, c, q)"), t70))
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
fn step_59() -> Unit raise {
  let t71 = @meson.meson_tac(@list.List([wp_monotonic(), implies_trans()]))
  let t72 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct()])), t71)
  correct_postweak_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ c : Command[_], ∀ q : (_) -> Bool, ∀ q' : (_) -> Bool, correct(p, c, q') && IMPLIES(q', q) → correct(p, c, q)"), t72))
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
fn step_60() -> Unit raise {
  let t73 = @simp.rewrite_tac(@list.List([correct(), wp_assign(), implies(), @trivia.o_thm()]))
  correct_assign_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ f : (_) -> _, ∀ q : (_) -> Bool, IMPLIES(p, (s : _) => q(f(s))) → correct(p, Assign(f), q)"), t73))
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
fn step_61() -> Unit raise {
  let t74 = @meson.meson_tac(@list.List([wp_monotonic(), implies_trans()]))
  let t75 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), wp_seq(), @trivia.o_thm()])), t74)
  correct_seq_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ q : (_) -> Bool, ∀ r : (_) -> Bool, ∀ c1 : Command[_], ∀ c2 : Command[_], correct(p, c1, r) && correct(r, c2, q) → correct(p, Seq(c1, c2), q)"), t75))
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
fn step_62() -> Unit raise {
  let t76 = @meson.meson_tac(@list.List([]))
  let t77 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), wp_ite(), and_(), not_(), implies(), or()])), t76)
  correct_ite_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ e : (_) -> Bool, ∀ c1 : Command[_], ∀ c2 : Command[_], ∀ q : (_) -> Bool, correct(AND(p, e), c1, q) && correct(AND(p, NOT(e)), c2, q) → correct(p, Ite(e, c1, c2), q)"), t77))
}

///|
let correct_ite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_ITE")

///|
/// `CORRECT_ITE`
pub fn correct_ite() -> @kernel.Thm {
  correct_ite_c.get()
}

///|
/// CORRECT_WHILE
fn step_63() -> Unit raise {
  let t106 = @meson.meson_tac(@list.List([wp_monotonic(), implies()]))
  let t104 = @meson.asm_meson_tac(@list.List([]))
  let t105 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([implies()])), t104), @tactics.all_tac])
  let t103 = @tactics.subgoal_then(@term_syntax.parse_term("IMPLIES((x : S) => (invariant : (S) -> Bool)(x) && (op_lt_lt : (S, S) -> Bool)(x, (s : S)), wp(While((e : (S) -> Bool), (c : Command[S])), (q : (S) -> Bool)))"), fn(x100 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s101 = @tactics.mp_tac(x100)
    fn(x102 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s101(x102)
    }
  })
  let t98 = @simp.asm_rewrite_tac(@list.List([]))
  let t99 = @list.List([@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t98), @tactics.all_tac])
  let t97 = @tactics.subgoal_then(@term_syntax.parse_term("wp((c : Command[S]), (x : S) => (invariant : (S) -> Bool)(x) && (op_lt_lt : (S, S) -> Bool)(x, (s : S)), s)"), fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s95 = @tactics.mp_tac(x94)
    fn(x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s95(x96)
    }
  })
  let t93 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t92 = @simp.asm_rewrite_tac(@list.List([]))
  let t91 = @class.asm_cases_tac(@term_syntax.parse_term("(e : (S) -> Bool)((s : S))"))
  let t90 = @simp.rewrite_tac(@list.List([wp_if(), wp_seq(), and_(), or(), not_(), @trivia.o_thm()]))
  let t89 = @simp.once_rewrite_tac(@list.List([@equal.gsym(wp_while())]))
  let t88 = @tactics.repeat_tac(@tactics.disch_tac)
  let t87 = @tactics.x_gen_tac(@term_syntax.parse_term("(s : S)"))
  let t84 = @simp.rewrite_rule(@list.List([@wf.wf_ind()]))
  let t86 = @tactics.first_assum(fn(x85 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t84(x85))
  })
  let t83 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t82 = @tactics.subgoal_then(@term_syntax.parse_term("∀ s : S, (invariant : (S) -> Bool)(s) → wp(While((e : (S) -> Bool), (c : Command[S])), (q : (S) -> Bool), s)"), fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s80 = @tactics.mp_tac(x79)
    fn(x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s80(x81)
    }
  })
  let t78 = @tactics.repeat_tac(@tactics.strip_tac)
  let t107 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), implies(), @sets.in_(), and_(), not_()])), t78), t82), t83), t86), t87), t88), t89), t90), t91), t92), t93), t97), t99), t103), t105), t106)
  correct_while_c.set(@tactics.prove(@term_syntax.parse_term("∀ `<<` : (S, S) -> Bool, ∀ p : (S) -> Bool, ∀ c : Command[S], ∀ q : (S) -> Bool, ∀ e : (S) -> Bool, ∀ invariant : (S) -> Bool, WF(`<<`) && IMPLIES(p, invariant) && IMPLIES(AND(NOT(e), invariant), q) && (∀ X : S, correct(AND(invariant, AND(e, (s : S) => X == s)), c, AND(invariant, (s : S) => `<<`(s, X)))) → correct(p, While(e, c), q)"), t107))
}

///|
let correct_while_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_WHILE")

///|
/// `CORRECT_WHILE`
pub fn correct_while() -> @kernel.Thm {
  correct_while_c.get()
}

///|
/// CORRECT_SKIP
fn step_64() -> Unit raise {
  let t108 = @simp.rewrite_tac(@list.List([correct(), wp_skip()]))
  correct_skip_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ q : (_) -> Bool, IMPLIES(p, q) → correct(p, SKIP, q)"), t108))
}

///|
let correct_skip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_SKIP")

///|
/// `CORRECT_SKIP`
pub fn correct_skip() -> @kernel.Thm {
  correct_skip_c.get()
}

///|
/// CORRECT_ABORT
fn step_65() -> Unit raise {
  let t109 = @simp.rewrite_tac(@list.List([]))
  correct_abort_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ q : (_) -> Bool, false → correct(p, ABORT, q)"), t109))
}

///|
let correct_abort_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_ABORT")

///|
/// `CORRECT_ABORT`
pub fn correct_abort() -> @kernel.Thm {
  correct_abort_c.get()
}

///|
/// CORRECT_IF
fn step_66() -> Unit raise {
  let t110 = @meson.meson_tac(@list.List([]))
  let t111 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), wp_if(), and_(), not_(), implies(), or()])), t110)
  correct_if_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ e : (_) -> Bool, ∀ c : Command[_], ∀ q : (_) -> Bool, correct(AND(p, e), c, q) && IMPLIES(AND(p, NOT(e)), q) → correct(p, IF(e, c), q)"), t111))
}

///|
let correct_if_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_IF")

///|
/// `CORRECT_IF`
pub fn correct_if() -> @kernel.Thm {
  correct_if_c.get()
}

///|
/// CORRECT_DO
fn step_67() -> Unit raise {
  let t136 = @meson.meson_tac(@list.List([]))
  let t135 = @simp.rewrite_tac(@list.List([and_(), implies()]))
  let t134 = @tactics.undisch_tac(@term_syntax.parse_term("IMPLIES(AND((e : (S) -> Bool), (invariant : (S) -> Bool)), (p : (S) -> Bool))"))
  let t133 = @simp.asm_rewrite_tac(@list.List([]))
  let t132 = @tactics.exists_tac(@term_syntax.parse_term("AND((p : (S) -> Bool), (s : S) => (X : S) == s)"))
  let t131 = @tactics.match_mp_tac(correct_prestrength())
  let t130 = @tactics.x_gen_tac(@term_syntax.parse_term("(X : S)"))
  let t129 = @simp.asm_rewrite_tac(@list.List([implies()]))
  let t127 = @term_syntax.parse_term("(invariant : (S) -> Bool)")
  let t128 = @tactics.map_every(fn(x124 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s125 = @tactics.exists_tac(x124)
    fn(x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s125(x126)
    }
  }, @list.List([@term_syntax.parse_term("(op_lt_lt : (S, S) -> Bool)"), t127]))
  let t137 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(correct_while()), t128), t129), t130), t131), t132), t133), t134), t135), t136)
  let t123 = @meson.meson_tac(@list.List([]))
  let t122 = @simp.rewrite_tac(@list.List([and_(), implies()]))
  let t121 = @simp.rewrite_tac(@list.List([correct(), @equal.gsym(wp_conjunctive())]))
  let t138 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum_list(fn(x120 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s117 = @tactics.mp_tac(x116)
      fn(x118 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s117(x118)
      }
    })(((x119 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x119))(x120))
  }), t121), t122), t123), t137])
  let t115 = @simp.asm_rewrite_tac(@list.List([]))
  let t114 = @tactics.exists_tac(@term_syntax.parse_term("(invariant : (S) -> Bool)"))
  let t113 = @tactics.match_mp_tac(correct_seq())
  let t112 = @simp.rewrite_tac(@list.List([do_()]))
  let t139 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t112), t113), t114), t115), @tactics.conj_tac), t138)
  correct_do_c.set(@tactics.prove(@term_syntax.parse_term("∀ `<<` : (S, S) -> Bool, ∀ p : (S) -> Bool, ∀ q : (S) -> Bool, ∀ c : Command[S], ∀ invariant : (S) -> Bool, WF(`<<`) && IMPLIES(AND((e : (S) -> Bool), invariant), p) && IMPLIES(AND(NOT(e), invariant), q) && (∀ X : S, correct(AND(p, (s : S) => X == s), c, AND(invariant, (s : S) => `<<`(s, X)))) → correct(p, DO(c, e), q)"), t139))
}

///|
let correct_do_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_DO")

///|
/// `CORRECT_DO`
pub fn correct_do() -> @kernel.Thm {
  correct_do_c.get()
}

///|
/// CORRECT_ASSERT
fn step_68() -> Unit raise {
  let t140 = @simp.rewrite_tac(@list.List([correct(), wp_assert()]))
  correct_assert_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (_) -> Bool, ∀ g : (_) -> Bool, ∀ q : (_) -> Bool, IMPLIES(p, AND(g, q)) → correct(p, ASSERT(g), q)"), t140))
}

///|
let correct_assert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_ASSERT")

///|
/// `CORRECT_ASSERT`
pub fn correct_assert() -> @kernel.Thm {
  correct_assert_c.get()
}

///|
/// VC_ASSIGN
fn step_69() -> Unit raise {
  let t141 = @simp.rewrite_tac(@list.List([@trivia.o_def(), correct_assign()]))
  vc_assign_c.set(@tactics.prove(@term_syntax.parse_term("IMPLIES((p : (_) -> Bool), o((q : (_) -> Bool), (f : (_) -> _))) → correct(p, Assign(f), q)"), t141))
}

///|
let vc_assign_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_ASSIGN")

///|
/// `VC_ASSIGN`
pub fn vc_assign() -> @kernel.Thm {
  vc_assign_c.get()
}

///|
/// VC_SKIP
fn step_70() -> Unit raise {
  let t142 = @simp.rewrite_tac(@list.List([correct_skip()]))
  vc_skip_c.set(@tactics.prove(@term_syntax.parse_term("IMPLIES((p : (_) -> Bool), (q : (_) -> Bool)) → correct(p, SKIP, q)"), t142))
}

///|
let vc_skip_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_SKIP")

///|
/// `VC_SKIP`
pub fn vc_skip() -> @kernel.Thm {
  vc_skip_c.get()
}

///|
/// VC_ABORT
fn step_71() -> Unit raise {
  let t143 = @tactics.match_accept_tac(correct_abort())
  vc_abort_c.set(@tactics.prove(@term_syntax.parse_term("false → correct((p : (_) -> Bool), ABORT, (q : (_) -> Bool))"), t143))
}

///|
let vc_abort_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_ABORT")

///|
/// `VC_ABORT`
pub fn vc_abort() -> @kernel.Thm {
  vc_abort_c.get()
}

///|
/// VC_ASSERT
fn step_72() -> Unit raise {
  let t144 = @simp.rewrite_tac(@list.List([correct_assert()]))
  vc_assert_c.set(@tactics.prove(@term_syntax.parse_term("IMPLIES((p : (_) -> Bool), AND((b : (_) -> Bool), (q : (_) -> Bool))) → correct(p, ASSERT(b), q)"), t144))
}

///|
let vc_assert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_ASSERT")

///|
/// `VC_ASSERT`
pub fn vc_assert() -> @kernel.Thm {
  vc_assert_c.get()
}

///|
/// VC_ITE
fn step_73() -> Unit raise {
  let t145 = @simp.rewrite_tac(@list.List([correct_ite()]))
  vc_ite_c.set(@tactics.prove(@term_syntax.parse_term("correct(AND((p : (_) -> Bool), (e : (_) -> Bool)), (c1 : Command[_]), (q : (_) -> Bool)) && correct(AND(p, NOT(e)), (c2 : Command[_]), q) → correct(p, Ite(e, c1, c2), q)"), t145))
}

///|
let vc_ite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_ITE")

///|
/// `VC_ITE`
pub fn vc_ite() -> @kernel.Thm {
  vc_ite_c.get()
}

///|
/// VC_IF
fn step_74() -> Unit raise {
  let t146 = @simp.rewrite_tac(@list.List([correct_if()]))
  vc_if_c.set(@tactics.prove(@term_syntax.parse_term("correct(AND((p : (_) -> Bool), (e : (_) -> Bool)), (c : Command[_]), (q : (_) -> Bool)) && IMPLIES(AND(p, NOT(e)), q) → correct(p, IF(e, c), q)"), t146))
}

///|
let vc_if_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_IF")

///|
/// `VC_IF`
pub fn vc_if() -> @kernel.Thm {
  vc_if_c.get()
}

///|
/// VC_AWHILE_VARIANT
fn step_75() -> Unit raise {
  let t147 = @simp.rewrite_tac(@list.List([awhile(), correct_while()]))
  vc_awhile_variant_c.set(@tactics.prove(@term_syntax.parse_term("WF((op_lt_lt : (_, _) -> Bool)) && IMPLIES((p : (_) -> Bool), (invariant : (_) -> Bool)) && IMPLIES(AND(NOT((e : (_) -> Bool)), invariant), (q : (_) -> Bool)) && (∀ X : _, correct(AND(invariant, AND(e, (s : _) => X == s)), (c : Command[_]), AND(invariant, (s : _) => op_lt_lt(s, X)))) → correct(p, AWHILE(invariant, op_lt_lt, e, c), q)"), t147))
}

///|
let vc_awhile_variant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_AWHILE_VARIANT")

///|
/// `VC_AWHILE_VARIANT`
pub fn vc_awhile_variant() -> @kernel.Thm {
  vc_awhile_variant_c.get()
}

///|
/// VC_AWHILE_MEASURE
fn step_76() -> Unit raise {
  let t158 = @meson.meson_tac(@list.List([]))
  let t157 = @simp.rewrite_tac(@list.List([correct(), and_(), implies(), @wf.measure()]))
  let t153 = @term_syntax.parse_term("(m : (S) -> Num)((X : S))")
  let t156 = @tactics.first_assum(fn(x155 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s151 = @tactics.mp_tac(x150)
      fn(x152 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s151(x152)
      }
    })(((x154 : @kernel.Thm) => @bool.spec(t153, x154))(x155))
  })
  let t149 = @tactics.x_gen_tac(@term_syntax.parse_term("(X : S)"))
  let t148 = @simp.asm_rewrite_tac(@list.List([@wf.wf_measure()]))
  let t159 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.match_mp_tac(vc_awhile_variant())), t148), t149), t156), t157), t158)
  vc_awhile_measure_c.set(@tactics.prove(@term_syntax.parse_term("IMPLIES((p : (S) -> Bool), (invariant : (S) -> Bool)) && IMPLIES(AND(NOT((e : (S) -> Bool)), invariant), (q : (S) -> Bool)) && (∀ X : Num, correct(AND(invariant, AND(e, (s : S) => X == (m : (S) -> Num)(s))), (c : Command[S]), AND(invariant, (s : S) => m(s) < X))) → correct(p, AWHILE(invariant, MEASURE(m), e, c), q)"), t159))
}

///|
let vc_awhile_measure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_AWHILE_MEASURE")

///|
/// `VC_AWHILE_MEASURE`
pub fn vc_awhile_measure() -> @kernel.Thm {
  vc_awhile_measure_c.get()
}

///|
/// VC_ADO_VARIANT
fn step_77() -> Unit raise {
  let t160 = @simp.rewrite_tac(@list.List([ado(), correct_do()]))
  vc_ado_variant_c.set(@tactics.prove(@term_syntax.parse_term("WF((op_lt_lt : (_, _) -> Bool)) && IMPLIES(AND((e : (_) -> Bool), (invariant : (_) -> Bool)), (p : (_) -> Bool)) && IMPLIES(AND(NOT(e), invariant), (q : (_) -> Bool)) && (∀ X : _, correct(AND(p, (s : _) => X == s), (c : Command[_]), AND(invariant, (s : _) => op_lt_lt(s, X)))) → correct(p, ADO(invariant, op_lt_lt, c, e), q)"), t160))
}

///|
let vc_ado_variant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_ADO_VARIANT")

///|
/// `VC_ADO_VARIANT`
pub fn vc_ado_variant() -> @kernel.Thm {
  vc_ado_variant_c.get()
}

///|
/// VC_ADO_MEASURE
fn step_78() -> Unit raise {
  let t171 = @meson.meson_tac(@list.List([]))
  let t170 = @simp.rewrite_tac(@list.List([correct(), and_(), implies(), @wf.measure()]))
  let t166 = @term_syntax.parse_term("(m : (S) -> Num)((X : S))")
  let t169 = @tactics.first_assum(fn(x168 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s164 = @tactics.mp_tac(x163)
      fn(x165 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s164(x165)
      }
    })(((x167 : @kernel.Thm) => @bool.spec(t166, x167))(x168))
  })
  let t162 = @tactics.x_gen_tac(@term_syntax.parse_term("(X : S)"))
  let t161 = @simp.asm_rewrite_tac(@list.List([@wf.wf_measure()]))
  let t172 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.match_mp_tac(vc_ado_variant())), t161), t162), t169), t170), t171)
  vc_ado_measure_c.set(@tactics.prove(@term_syntax.parse_term("IMPLIES(AND((e : (S) -> Bool), (invariant : (S) -> Bool)), (p : (S) -> Bool)) && IMPLIES(AND(NOT(e), invariant), (q : (S) -> Bool)) && (∀ X : Num, correct(AND(p, (s : S) => X == (m : (S) -> Num)(s)), (c : Command[S]), AND(invariant, (s : S) => m(s) < X))) → correct(p, ADO(invariant, MEASURE(m), c, e), q)"), t172))
}

///|
let vc_ado_measure_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_ADO_MEASURE")

///|
/// `VC_ADO_MEASURE`
pub fn vc_ado_measure() -> @kernel.Thm {
  vc_ado_measure_c.get()
}

///|
/// VC_SEQ_ASSERT_LEFT
fn step_79() -> Unit raise {
  let t173 = @meson.meson_tac(@list.List([correct_seq(), correct_assert(), correct_prestrength(), pred_taut(@term_syntax.parse_term("IMPLIES((p : (_) -> Bool), (b : (_) -> Bool)) → IMPLIES(p, AND(b, p))"))]))
  vc_seq_assert_left_c.set(@tactics.prove(@term_syntax.parse_term("IMPLIES((p : (_) -> Bool), (b : (_) -> Bool)) && correct(b, (c : Command[_]), (q : (_) -> Bool)) → correct(p, Seq(ASSERT(b), c), q)"), t173))
}

///|
let vc_seq_assert_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_SEQ_ASSERT_LEFT")

///|
/// `VC_SEQ_ASSERT_LEFT`
pub fn vc_seq_assert_left() -> @kernel.Thm {
  vc_seq_assert_left_c.get()
}

///|
/// VC_SEQ_ASSERT_RIGHT
fn step_80() -> Unit raise {
  let t174 = @meson.meson_tac(@list.List([correct_seq(), correct_assert(), pred_taut(@term_syntax.parse_term("IMPLIES((p : (_) -> Bool), (b : (_) -> Bool)) → IMPLIES(p, AND(p, b))"))]))
  vc_seq_assert_right_c.set(@tactics.prove(@term_syntax.parse_term("correct((p : (_) -> Bool), (c : Command[_]), (b : (_) -> Bool)) && IMPLIES(b, (q : (_) -> Bool)) → correct(p, Seq(c, ASSERT(b)), q)"), t174))
}

///|
let vc_seq_assert_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_SEQ_ASSERT_RIGHT")

///|
/// `VC_SEQ_ASSERT_RIGHT`
pub fn vc_seq_assert_right() -> @kernel.Thm {
  vc_seq_assert_right_c.get()
}

///|
/// VC_SEQ_ASSERT_MIDDLE
fn step_81() -> Unit raise {
  let t175 = @meson.meson_tac(@list.List([correct_seq(), correct_assert(), pred_taut(@term_syntax.parse_term("IMPLIES((b : (_) -> Bool), AND(b, b))"))]))
  vc_seq_assert_middle_c.set(@tactics.prove(@term_syntax.parse_term("correct((p : (_) -> Bool), (c : Command[_]), (b : (_) -> Bool)) && correct(b, (c' : Command[_]), (q : (_) -> Bool)) → correct(p, Seq(c, Seq(ASSERT(b), c')), q)"), t175))
}

///|
let vc_seq_assert_middle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_SEQ_ASSERT_MIDDLE")

///|
/// `VC_SEQ_ASSERT_MIDDLE`
pub fn vc_seq_assert_middle() -> @kernel.Thm {
  vc_seq_assert_middle_c.get()
}

///|
/// VC_SEQ_ASSIGN_LEFT
fn step_82() -> Unit raise {
  let t180 = @simp.asm_rewrite_tac(@list.List([implies(), and_(), @trivia.o_thm()]))
  let t179 = @tactics.match_mp_tac(vc_assign())
  let t178 = @simp.asm_rewrite_tac(@list.List([]))
  let t177 = @tactics.exists_tac(@term_syntax.parse_term("AND((p : (S) -> Bool), (s : S) => s == (f : (S) -> S)(s))"))
  let t176 = @tactics.match_mp_tac(correct_seq())
  let t181 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm()])), @tactics.strip_tac), t176), t177), t178), t179), t180)
  vc_seq_assign_left_c.set(@tactics.prove(@term_syntax.parse_term("o((p : (S) -> Bool), (f : (S) -> S)) == p && o(f, f) == f && correct(AND(p, (s : S) => s == f(s)), (c : Command[S]), (q : (S) -> Bool)) → correct(p, Seq(Assign(f), c), q)"), t181))
}

///|
let vc_seq_assign_left_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_SEQ_ASSIGN_LEFT")

///|
/// `VC_SEQ_ASSIGN_LEFT`
pub fn vc_seq_assign_left() -> @kernel.Thm {
  vc_seq_assign_left_c.get()
}

///|
/// VC_SEQ_ASSIGN_RIGHT
fn step_83() -> Unit raise {
  let t182 = @meson.meson_tac(@list.List([correct_seq(), vc_assign(), pred_taut(@term_syntax.parse_term("IMPLIES((p : (S) -> Bool), p)"))]))
  vc_seq_assign_right_c.set(@tactics.prove(@term_syntax.parse_term("correct((p : (_) -> Bool), (c : Command[_]), o((q : (_) -> Bool), (f : (_) -> _))) → correct(p, Seq(c, Assign(f)), q)"), t182))
}

///|
let vc_seq_assign_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VC_SEQ_ASSIGN_RIGHT")

///|
/// `VC_SEQ_ASSIGN_RIGHT`
pub fn vc_seq_assign_right() -> @kernel.Thm {
  vc_seq_assign_right_c.get()
}

///|
/// STATE_GEN_TAC
fn step_87() -> Unit raise {
  let pair_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@equal.gsym(@pair.pair()))
  fn repair(x292 : @kernel.Term, x293 : @kernel.Term, x294 : @list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)])) raise {
    let vs = x292
    let v = x293
    let acc = x294
    try {
      let (l, r) = @pair.dest_pair(vs)
      let th = pair_conv(v)
      let tm = @kernel.rand(@kernel.concl(th))
      let rtm = @kernel.rator(tm)
      let (lth, acc1) = repair(l, @kernel.rand(rtm), acc)
      let (rth, acc2) = repair(r, @kernel.rand(tm), acc1)
      (@kernel.trans(th, @kernel.mk_comb_rule(@equal.ap_term(@kernel.rator(rtm), lth), rth)), acc2)
    } catch {
      Failure(_) => (@kernel.refl(v), acc.prepend((v, vs)))
      e => raise e
    }
  }
  state_gen_tac_c.set(fn(x295 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl, w) = x295
    let abstm = @basics.find_term(fn(x296 : @kernel.Term) -> Bool raise {
      let t = x296
      (!@kernel.is_abs(t) && @basics.is_gabs(t))
    }, w)
    let vs_1 = @basics.dest_gabs(abstm).0
    let v_1 = @basics.genvar(@kernel.type_of(@basics.dest_forall(w).0))
    let (th_1, gens) = repair(vs_1, v_1, @list.List([]))
    let t302 = @tactics.repeat_tac(@tactics.gen_tac)
    let t301 = @tactics.map_every(fn(x298 : (@kernel.Term, @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s299 = @tactics.spec_tac(x298.0, x298.1)
      fn(x300 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s299(x300)
      }
    }, gens)
    let t297 = @tactics.subst1_tac(th_1)
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(v_1), t297), t301), t302)((asl, w))
  })
}

///|
let state_gen_tac_c : @lib.Cell[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise] = @lib.Cell::new("STATE_GEN_TAC")

///|
/// `STATE_GEN_TAC`
pub fn state_gen_tac(x : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  (state_gen_tac_c.get())(x)
}

///|
/// STATE_GEN_TAC'
fn step_88() -> Unit raise {
  let pair_conv : (@kernel.Term) -> @kernel.Thm raise = @simp.rewr_conv(@equal.gsym(@pair.pair()))
  fn repair(x303 : @kernel.Term, x304 : @kernel.Term, x305 : @list.List[(@kernel.Term, @kernel.Term)]) -> ((@kernel.Thm, @list.List[(@kernel.Term, @kernel.Term)])) raise {
    let vs = x303
    let v = x304
    let acc = x305
    try {
      let (l, r) = @pair.dest_pair(vs)
      let th = pair_conv(v)
      let tm = @kernel.rand(@kernel.concl(th))
      let rtm = @kernel.rator(tm)
      let (lth, acc1) = repair(l, @kernel.rand(rtm), acc)
      let (rth, acc2) = repair(r, @kernel.rand(tm), acc1)
      (@kernel.trans(th, @kernel.mk_comb_rule(@equal.ap_term(@kernel.rator(rtm), lth), rth)), acc2)
    } catch {
      Failure(_) => (@kernel.refl(v), acc.prepend((v, vs)))
      e => raise e
    }
  }
  state_gen_tac_p_c.set(fn(x306 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl, w) = x306
    let abstm = @basics.find_term(fn(x307 : @kernel.Term) -> Bool raise {
      let t = x307
      (!@kernel.is_abs(t) && @basics.is_gabs(t))
    }, w)
    let vs0 = @basics.dest_gabs(abstm).0
    let vl0 = @lib.striplist(@pair.dest_pair, vs0)
    let t311 = @basics.variables(@bool.list_mk_conj(@lib.map(fn(x310 : (String, @kernel.Thm)) -> @kernel.Term raise {
      (fn(x308 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x308)
      })((fn(x309 : (String, @kernel.Thm)) -> @kernel.Thm raise {
        x309.1
      })(x310))
    }, asl).prepend(w)))
    let vl = @lib.map((x312 : @kernel.Term) => @kernel.variant(t311, x312), vl0)
    let vs_1 = @lib.end_itlist((x313 : @kernel.Term, x314 : @kernel.Term) => @lib.curry(@pair.mk_pair, x313, x314), vl)
    let v_1 = @basics.genvar(@kernel.type_of(@basics.dest_forall(w).0))
    let (th_1, gens) = repair(vs_1, v_1, @list.List([]))
    let t320 = @tactics.repeat_tac(@tactics.gen_tac)
    let t319 = @tactics.map_every(fn(x316 : (@kernel.Term, @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s317 = @tactics.spec_tac(x316.0, x316.1)
      fn(x318 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s317(x318)
      }
    }, gens)
    let t315 = @tactics.subst1_tac(th_1)
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(v_1), t315), t319), t320)((asl, w))
  })
}

///|
let state_gen_tac_p_c : @lib.Cell[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise] = @lib.Cell::new("STATE_GEN_TAC'")

///|
/// `STATE_GEN_TAC'`
pub fn state_gen_tac_p(x : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  (state_gen_tac_p_c.get())(x)
}

///|
/// VC_UNPACK_TAC
fn step_89() -> Unit raise {
  let t322 = @simp.rewrite_tac(@list.List([@pair.pair_eq(), @equal.gsym(@theorems.conj_assoc())]))
  let t321 = @tactics.conv_tac(@equal.redepth_conv(@pair.gen_beta_conv))
  vc_unpack_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([implies(), @trivia.o_thm(), false_(), true_(), and_(), or(), not_(), imp()])), state_gen_tac), t321), t322))
}

///|
let vc_unpack_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("VC_UNPACK_TAC")

///|
/// `VC_UNPACK_TAC`
pub fn vc_unpack_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (vc_unpack_tac_c.get())(x)
}

///|
/// find_pwp
fn step_90() -> Unit raise {
  let t328 = @term_syntax.parse_term("wp(ADO((i : (_) -> Bool), (v : (_, _) -> Bool), (c : Command[_]), (e : (_) -> Bool)), (q : (_) -> Bool)) == i")
  let t329 = @list.List([@term_syntax.parse_term("wp(AWHILE((i : (_) -> Bool), (v : (_, _) -> Bool), (e : (_) -> Bool), (c : Command[_])), (q : (_) -> Bool)) == i"), t328])
  let wptms = @lib.map(fn(x327 : @kernel.Thm) -> @kernel.Term raise {
    (fn(x325 : @kernel.Term) -> @kernel.Term raise {
      (fn(x323 : (@list.List[@kernel.Term], @kernel.Term)) -> @kernel.Term raise {
        x323.1
      })((fn(x324 : @kernel.Term) -> (@list.List[@kernel.Term], @kernel.Term) raise {
        @basics.strip_forall(x324)
      })(x325))
    })((fn(x326 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x326)
    })(x327))
  }, @list.List([wp_assign(), wp_ite(), wp_skip(), wp_abort(), wp_if(), wp_assert()])).concat(t329)
  let conv : (@kernel.Term) -> @kernel.Term raise = fn(x330 : @kernel.Term) -> @kernel.Term raise {
    let tm = x330
    @lib.tryfind(fn(x331 : @kernel.Term) -> @kernel.Term raise {
      let t = x331
      @kernel.rand(@drule.instantiate(@drule.term_match(@list.List([]), @equal.lhand(t), tm), t))
    }, wptms)
  }
  find_pwp_c.set(fn(x332 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
    let tm_1 = x332
    fn(x333 : @kernel.Term) -> @kernel.Term raise {
      let q = x333
      conv(@kernel.mk_comb(@basics.list_mk_icomb("wp", @list.List([tm_1])), q))
    }
  })
}

///|
let find_pwp_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise] = @lib.Cell::new("find_pwp")

///|
/// `find_pwp`
pub fn find_pwp(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Term raise) raise {
  (find_pwp_c.get())(x)
}

///|
/// VC_SEQ_TAC
fn step_91() -> Unit raise {
  let is_seq : (@kernel.Term) -> Bool raise = fn(x335 : @kernel.Term) -> Bool raise {
    ((x334 : @kernel.Term) => @basics.is_binary("Seq", x334))(x335)
  }
  let strip_seq : (@kernel.Term) -> @list.List[@kernel.Term] raise = (x337 : @kernel.Term) => @lib.striplist((x336 : @kernel.Term) => @basics.dest_binary("Seq", x336), x337)
  let is_assert : (@kernel.Term) -> Bool raise = fn(x338 : @kernel.Term) -> Bool raise {
    let tm = x338
    try {
      (@kernel.dest_const(@kernel.rator(tm)).0 == "ASSERT")
    } catch {
      Failure(_) => false
      e => raise e
    }
  }
  let is_assign : (@kernel.Term) -> Bool raise = fn(x339 : @kernel.Term) -> Bool raise {
    let tm_1 = x339
    try {
      (@kernel.dest_const(@kernel.rator(tm_1)).0 == "Assign")
    } catch {
      Failure(_) => false
      e => raise e
    }
  }
  let t343 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t342 = @tactics.conv_tac(@equal.redepth_conv(@pair.gen_beta_conv))
  let t341 = @simp.pure_rewrite_tac(@list.List([implies(), @trivia.o_thm(), false_(), true_(), and_(), or(), not_(), imp()]))
  let side_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x340 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x340
  }, @list.List([@class.fun_eq_thm()])), state_gen_tac), t341), t342), t343), @tactics.no_tac)
  let adjust_tac : (@kernel.Term) -> ((@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise = fn(x344 : @kernel.Term) -> ((@kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise) raise {
    let ptm = x344
    fn(x345 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let ptm_p = x345
      fn(x346 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        let (_, w) as gl = x346
        let w_p = @basics.subst(@list.List([(ptm_p, ptm)]), w)
        let t347 = @basics.mk_eq(w, w_p)
        let th = @bool.eqt_elim(@simp.rewrite_conv(@list.List([correct(), wp_seq()]))(t347))
        @simp.gen_rewrite_tac(fn(x348 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          x348
        }, @list.List([th]))(gl)
      }
    }
  }
  vc_seq_tac_c.set(fn(x349 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl, w_1) = x349
    let (cptm, q) = @kernel.dest_comb(w_1)
    let (cpt, ptm_1) = @kernel.dest_comb(cptm)
    let (ctm, p) = @kernel.dest_comb(cpt)
    let ptms = strip_seq(ptm_1)
    let seq = @kernel.rator(@kernel.rator(ptm_1))
    try {
      let atm = @lib.find(is_assert, ptms)
      let i = Int::to_int64(@lib.index(atm, ptms))
      if (i == 0L) {
        let t350 = @basics.list_mk_binop(seq, @lib.tl(ptms))
        let ptm_p_1 = @basics.mk_binop(seq, @lib.hd(ptms), t350)
        let t351 = @tactics.match_mp_tac(vc_seq_assert_left())
        @tactics.thenl(@tactics.then_tac(@tactics.then_tac(adjust_tac(ptm_1)(ptm_p_1), t351), @tactics.conj_tac), @list.List([vc_unpack_tac, @tactics.all_tac]))((asl, w_1))
      } else {
        if (i == @lib.sub63(Int::to_int64(@lib.length(ptms)), 1L)) {
          let t352 = @lib.last(ptms)
          let ptm_p_2 = @basics.mk_binop(seq, @basics.list_mk_binop(seq, @lib.butlast(ptms)), t352)
          let t353 = @tactics.match_mp_tac(vc_seq_assert_right())
          @tactics.thenl(@tactics.then_tac(@tactics.then_tac(adjust_tac(ptm_1)(ptm_p_2), t353), @tactics.conj_tac), @list.List([@tactics.all_tac, vc_unpack_tac]))((asl, w_1))
        } else {
          let (l, mr) = @lib.chop_list(@lib.index(atm, ptms), ptms)
          let t354 = @basics.list_mk_binop(seq, @lib.tl(mr))
          let t355 = @basics.mk_binop(seq, @lib.hd(mr), t354)
          let ptm_p_3 = @basics.mk_binop(seq, @basics.list_mk_binop(seq, l), t355)
          let t356 = @tactics.match_mp_tac(vc_seq_assert_middle())
          @tactics.then_tac(@tactics.then_tac(adjust_tac(ptm_1)(ptm_p_3), t356), @tactics.conj_tac)((asl, w_1))
        }
      }
    } catch {
      Failure("find") => {
        try {
          if is_assign(@lib.hd(ptms)) {
            let t357 = @basics.list_mk_binop(seq, @lib.tl(ptms))
            let ptm_p_4 = @basics.mk_binop(seq, @lib.hd(ptms), t357)
            let t359 = @tactics.repeat_tac(@tactics.conj_tac)
            let t358 = @tactics.match_mp_tac(vc_seq_assign_left())
            @tactics.thenl(@tactics.then_tac(@tactics.then_tac(adjust_tac(ptm_1)(ptm_p_4), t358), t359), @list.List([side_tac, side_tac, @tactics.all_tac]))((asl, w_1))
          } else {
            @lib.failure()
          }
        } catch {
          Failure(_) => {
            let t360 = @lib.last(ptms)
            let ptm_p_5 = @basics.mk_binop(seq, @basics.list_mk_binop(seq, @lib.butlast(ptms)), t360)
            let pwp = find_pwp(@kernel.rand(ptm_p_5))(q)
            let t362 = @tactics.exists_tac(pwp)
            let t361 = @tactics.match_mp_tac(correct_seq())
            @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(adjust_tac(ptm_1)(ptm_p_5), t361), t362), @tactics.conj_tac)((asl, w_1))
          }
          e => raise e
        }
      }
      e => raise e
    }
  })
}

///|
let vc_seq_tac_c : @lib.Cell[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise] = @lib.Cell::new("VC_SEQ_TAC")

///|
/// `VC_SEQ_TAC`
pub fn vc_seq_tac(x : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  (vc_seq_tac_c.get())(x)
}

///|
/// VC_STEP_TAC
fn step_92() -> Unit raise {
  let t381 = (@term_syntax.parse_term("correct((p : (_) -> Bool), Seq((c1 : Command[_]), (c2 : Command[_])), (q : (_) -> Bool))"), vc_seq_tac)
  let t379 = @tactics.repeat_tac(@tactics.conj_tac)
  let t380 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(vc_ado_variant()), t379), @list.List([@tactics.all_tac, vc_unpack_tac, vc_unpack_tac, state_gen_tac_p]))
  let t382 = (@term_syntax.parse_term("correct((p : (_) -> Bool), ADO((i : (_) -> Bool), (v : (_, _) -> Bool), (c : Command[_]), (e : (_) -> Bool)), (q : (_) -> Bool))"), t380)
  let t377 = @tactics.repeat_tac(@tactics.conj_tac)
  let t378 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(vc_ado_measure()), t377), @list.List([vc_unpack_tac, vc_unpack_tac, state_gen_tac_p]))
  let t383 = (@term_syntax.parse_term("correct((p : (_) -> Bool), ADO((i : (_) -> Bool), MEASURE((m : (_) -> Num)), (c : Command[_]), (e : (_) -> Bool)), (q : (_) -> Bool))"), t378)
  let t375 = @tactics.repeat_tac(@tactics.conj_tac)
  let t376 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(vc_awhile_variant()), t375), @list.List([@tactics.all_tac, vc_unpack_tac, vc_unpack_tac, state_gen_tac_p]))
  let t384 = (@term_syntax.parse_term("correct((p : (_) -> Bool), AWHILE((i : (_) -> Bool), (v : (_, _) -> Bool), (e : (_) -> Bool), (c : Command[_])), (q : (_) -> Bool))"), t376)
  let t373 = @tactics.repeat_tac(@tactics.conj_tac)
  let t374 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(vc_awhile_measure()), t373), @list.List([vc_unpack_tac, vc_unpack_tac, @tactics.gen_tac]))
  let t385 = (@term_syntax.parse_term("correct((p : (_) -> Bool), AWHILE((i : (_) -> Bool), MEASURE((m : (_) -> Num)), (e : (_) -> Bool), (c : Command[_])), (q : (_) -> Bool))"), t374)
  let t372 = @tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(vc_if()), @tactics.conj_tac), @list.List([@tactics.all_tac, vc_unpack_tac]))
  let t386 = (@term_syntax.parse_term("correct((p : (_) -> Bool), IF((e : (_) -> Bool), (c : Command[_])), (q : (_) -> Bool))"), t372)
  let t371 = @tactics.then_tac(@tactics.match_mp_tac(vc_ite()), @tactics.conj_tac)
  let t387 = (@term_syntax.parse_term("correct((p : (_) -> Bool), Ite((e : (_) -> Bool), (c1 : Command[_]), (c2 : Command[_])), (q : (_) -> Bool))"), t371)
  let t370 = @tactics.then_tac(@tactics.match_mp_tac(vc_assign()), vc_unpack_tac)
  let t388 = (@term_syntax.parse_term("correct((p : (_) -> Bool), Assign((f : (_) -> _)), (q : (_) -> Bool))"), t370)
  let t369 = @tactics.then_tac(@tactics.match_mp_tac(vc_assert()), vc_unpack_tac)
  let t389 = (@term_syntax.parse_term("correct((p : (_) -> Bool), ASSERT((b : (_) -> Bool)), (q : (_) -> Bool))"), t369)
  let t368 = @tactics.then_tac(@tactics.match_mp_tac(vc_skip()), vc_unpack_tac)
  let tacnet = @lib.itlist(fn(x366 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise), x367 : @nets.Net[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise]) -> @nets.Net[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise] raise {
    ((x363 : @kernel.Term, x364, x365) => @nets.enter_fn(@list.List([]), x363, x364, x365))(x366.0, x366.1, x367)
  }, @list.List([(@term_syntax.parse_term("correct((p : (_) -> Bool), SKIP, (q : (_) -> Bool))"), t368), t389, t388, t387, t386, t385, t384, t383, t382, t381]), @nets.empty_net())
  vc_step_tac_c.set(fn(x390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl, w) = x390
    @tactics.first(@nets.lookup(w, tacnet))((asl, w))
  })
}

///|
let vc_step_tac_c : @lib.Cell[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise] = @lib.Cell::new("VC_STEP_TAC")

///|
/// `VC_STEP_TAC`
pub fn vc_step_tac(x : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  (vc_step_tac_c.get())(x)
}

///|
/// VC_TAC
fn step_93() -> Unit raise {
  vc_tac_c.set(@tactics.repeat_tac(vc_step_tac))
}

///|
let vc_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("VC_TAC")

///|
/// `VC_TAC`
pub fn vc_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (vc_tac_c.get())(x)
}

///|
/// EXAMPLE_FACTORIAL
fn step_95() -> Unit raise {
  let t393 = @tactics.undisch_tac(@term_syntax.parse_term("(x : Num) < (n : Num)"))
  let t392 = @simp.asm_rewrite_tac(@list.List([@arith.mult_ac()]))
  let t394 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), @arith.fact()])), @tactics.strip_tac), t392), t393), @int.arith_tac)
  let t391 = @meson.meson_tac(@list.List([]))
  let t395 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.conj_assoc(), @arith.not_lt(), @arith.le_antisym()])), t391)
  let t396 = @tactics.thenl(vc_tac, @list.List([@tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([@arith.fact(), @arith.le_0()]))), t395, t394]))
  example_factorial_c.set(@tactics.prove(@term_syntax.parse_term("correct(fn { (x, y, n) => true }, Seq(Assign(fn { (x, y, n) => (0, y, n) }), Seq(Assign(fn { (x, y, n) => (x, 1, n) }), AWHILE(fn { (x, y, n) => x <= n && y == FACT(x) }, MEASURE(fn { (x, y, n) => n - x }), fn { (x, y, n) => x < n }, Seq(Assign(fn { (x, y, n) => (x + 1, y, n) }), Assign(fn { (x, y, n) => (x, y * x, n) }))))), fn { (x, y, n) => y == FACT(n) })"), t396))
}

///|
let example_factorial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXAMPLE_FACTORIAL")

///|
/// `EXAMPLE_FACTORIAL`
pub fn example_factorial() -> @kernel.Thm {
  example_factorial_c.get()
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
  step_87()
  step_88()
  step_89()
  step_90()
  step_91()
  step_92()
  step_93()
  step_95()
}
