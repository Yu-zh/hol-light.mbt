// Translated from upstream Tutorial/Semantics_of_programming_languages_deep.ml; edit this file directly.

///|
let string_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("string_INDUCT")

///|
/// `string_INDUCT`
pub fn string_induct() -> @kernel.Thm {
  string_induct_c.get()
}

///|
let string_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("string_RECURSION")

///|
/// `string_RECURSION`
pub fn string_recursion() -> @kernel.Thm {
  string_recursion_c.get()
}

///|
/// string_INDUCT, string_RECURSION
fn step_1() -> Unit raise {
  let (string_induct, string_recursion) = @ind_types.define_type("enum String { String(List[Int]) }")
  string_induct_c.set(string_induct)
  string_recursion_c.set(string_recursion)
}

///|
let expression_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("expression_INDUCT")

///|
/// `expression_INDUCT`
pub fn expression_induct() -> @kernel.Thm {
  expression_induct_c.get()
}

///|
let expression_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("expression_RECURSION")

///|
/// `expression_RECURSION`
pub fn expression_recursion() -> @kernel.Thm {
  expression_recursion_c.get()
}

///|
/// expression_INDUCT, expression_RECURSION
fn step_2() -> Unit raise {
  let (expression_induct, expression_recursion) = @ind_types.define_type("enum Expression { Literal(Num); Variable(String); Plus(Expression, Expression); Times(Expression, Expression) }")
  expression_induct_c.set(expression_induct)
  expression_recursion_c.set(expression_recursion)
}

///|
let command_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("command_INDUCT")

///|
/// `command_INDUCT`
pub fn command_induct() -> @kernel.Thm {
  command_induct_c.get()
}

///|
let command_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("command_RECURSION")

///|
/// `command_RECURSION`
pub fn command_recursion() -> @kernel.Thm {
  command_recursion_c.get()
}

///|
/// command_INDUCT, command_RECURSION
fn step_3() -> Unit raise {
  let (command_induct, command_recursion) = @ind_types.define_type("enum Command { Assign(String, Expression); Sequence(Command, Command); If(Expression, Command, Command); While(Expression, Command) }")
  command_induct_c.set(command_induct)
  command_recursion_c.set(command_recursion)
}

///|
/// Tutorial/Semantics_of_programming_languages_deep.ml:16
fn step_4() -> Unit raise {
  @printer.parse_as_infix(";;", (18L, "right"))
}

///|
/// Tutorial/Semantics_of_programming_languages_deep.ml:17
fn step_5() -> Unit raise {
  @printer.parse_as_infix(":=", (20L, "right"))
}

///|
/// Tutorial/Semantics_of_programming_languages_deep.ml:18
fn step_6() -> Unit raise {
  @preterm.override_interface(";;", @term_syntax.parse_term("Sequence"))
}

///|
/// Tutorial/Semantics_of_programming_languages_deep.ml:19
fn step_7() -> Unit raise {
  @preterm.override_interface(":=", @term_syntax.parse_term("Assign"))
}

///|
/// Tutorial/Semantics_of_programming_languages_deep.ml:20
fn step_8() -> Unit raise {
  @preterm.overload_interface("+", @term_syntax.parse_term("Plus"))
}

///|
/// Tutorial/Semantics_of_programming_languages_deep.ml:21
fn step_9() -> Unit raise {
  @preterm.overload_interface("*", @term_syntax.parse_term("Times"))
}

///|
/// value
fn step_10() -> Unit raise {
  value_c.set(@define.define_(@term_syntax.parse_term("(value : (Expression, (List[Char]) -> Num) -> Num)(Literal((n : Num)), (s : (List[Char]) -> Num)) == n && value(Variable((x : List[Char])), s) == s(x) && value((e1 : Expression) + (e2 : Expression), s) == value(e1, s) + value(e2, s) && value(e1 * e2, s) == value(e1, s) * value(e2, s)")))
}

///|
let value_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("value")

///|
/// `value`
pub fn value() -> @kernel.Thm {
  value_c.get()
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
fn step_11() -> Unit raise {
  let (sem_rules, sem_induct, sem_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ x : List[Char], ∀ e : Expression, ∀ s : (List[Char]) -> Num, ∀ s' : (List[Char]) -> Num, s'(x) == value(e, s) && (∀ y : List[Char], !(y == x) → s'(y) == s(y)) → (sem : (Command, (List[Char]) -> Num, (List[Char]) -> Num) -> Bool)(Assign(x, e), s, s')) && (∀ c1 : Command, ∀ c2 : Command, ∀ s : (List[Char]) -> Num, ∀ s' : (List[Char]) -> Num, ∀ s'' : (List[Char]) -> Num, sem(c1, s, s') && sem(c2, s', s'') → sem(Sequence(c1, c2), s, s'')) && (∀ e : Expression, ∀ c1 : Command, ∀ c2 : Command, ∀ s : (List[Char]) -> Num, ∀ s' : (List[Char]) -> Num, !(value(e, s) == 0) && sem(c1, s, s') → sem(If(e, c1, c2), s, s')) && (∀ e : Expression, ∀ c1 : Command, ∀ c2 : Command, ∀ s : (List[Char]) -> Num, ∀ s' : (List[Char]) -> Num, value(e, s) == 0 && sem(c2, s, s') → sem(If(e, c1, c2), s, s')) && (∀ e : Expression, ∀ c : Command, ∀ s : (List[Char]) -> Num, value(e, s) == 0 → sem(While(e, c), s, s)) && (∀ e : Expression, ∀ c : Command, ∀ s : (List[Char]) -> Num, ∀ s' : (List[Char]) -> Num, ∀ s'' : (List[Char]) -> Num, !(value(e, s) == 0) && sem(c, s, s') && sem(While(e, c), s', s'') → sem(While(e, c), s, s''))"))
  sem_rules_c.set(sem_rules)
  sem_induct_c.set(sem_induct)
  sem_cases_c.set(sem_cases)
}

///|
/// DETERMINISM
fn step_12() -> Unit raise {
  let t8 = @meson.asm_meson_tac(@list.List([]))
  let t7 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t5 = @ind_types.injectivity("command")
  let t6 = @simp.rewrite_tac(@list.List([@ind_types.distinctness("command"), t5]))
  let t4 = @simp.once_rewrite_tac(@list.List([sem_cases()]))
  let t3 = @tactics.repeat_tac(@tactics.gen_tac)
  let t2 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1 = @tactics.match_mp_tac(sem_induct())
  let t9 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), t1), t2), t3), @tactics.disch_tac), t4), t6), t7), t8)
  determinism_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Command, ∀ s : (List[Char]) -> Num, ∀ s' : (List[Char]) -> Num, ∀ s'' : (List[Char]) -> Num, sem(c, s, s') && sem(c, s, s'') → s' == s''"), t9))
}

///|
let determinism_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DETERMINISM")

///|
/// `DETERMINISM`
pub fn determinism() -> @kernel.Thm {
  determinism_c.get()
}

///|
/// wlp
fn step_13() -> Unit raise {
  wlp_c.set(@pair.new_definition(@term_syntax.parse_term("(wlp : (Command, ((List[Char]) -> Num) -> Bool, (List[Char]) -> Num) -> Bool)((c : Command), (q : ((List[Char]) -> Num) -> Bool), (s : (List[Char]) -> Num)) == (∀ s' : (List[Char]) -> Num, sem(c, s, s') → q(s'))")))
}

///|
let wlp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("wlp")

///|
/// `wlp`
pub fn wlp() -> @kernel.Thm {
  wlp_c.get()
}

///|
/// terminates
fn step_14() -> Unit raise {
  terminates_c.set(@pair.new_definition(@term_syntax.parse_term("(terminates : (Command, (List[Char]) -> Num) -> Bool)((c : Command), (s : (List[Char]) -> Num)) == (∃ s' : (List[Char]) -> Num, sem(c, s, s'))")))
}

///|
let terminates_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("terminates")

///|
/// `terminates`
pub fn terminates() -> @kernel.Thm {
  terminates_c.get()
}

///|
/// wp
fn step_15() -> Unit raise {
  wp_c.set(@pair.new_definition(@term_syntax.parse_term("(wp : (Command, ((List[Char]) -> Num) -> Bool, (List[Char]) -> Num) -> Bool)((c : Command), (q : ((List[Char]) -> Num) -> Bool), (s : (List[Char]) -> Num)) == (terminates(c, s) && wlp(c, q, s))")))
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
fn step_16() -> Unit raise {
  let t10 = @meson.meson_tac(@list.List([]))
  let t11 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), wp(), wlp(), terminates(), @sets.empty()])), t10)
  wp_total_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Command, wp(c, {}) == {}"), t11))
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
fn step_17() -> Unit raise {
  let t12 = @meson.meson_tac(@list.List([]))
  let t13 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_(), wp(), wlp(), terminates()])), t12)
  wp_monotonic_c.set(@tactics.prove(@term_syntax.parse_term("SUBSET((q : ((List[Char]) -> Num) -> Bool), (r : ((List[Char]) -> Num) -> Bool)) → SUBSET(wp((c : Command), q), wp(c, r))"), t13))
}

///|
let wp_monotonic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_MONOTONIC")

///|
/// `WP_MONOTONIC`
pub fn wp_monotonic() -> @kernel.Thm {
  wp_monotonic_c.get()
}

///|
/// WP_DISJUNCTIVE
fn step_18() -> Unit raise {
  let t14 = @meson.meson_tac(@list.List([determinism()]))
  let t15 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @sets.in_(), wp(), wlp(), @sets.in_elim_thm(), @sets.union(), terminates()])), t14)
  wp_disjunctive_c.set(@tactics.prove(@term_syntax.parse_term("UNION(wp((c : Command), (p : ((List[Char]) -> Num) -> Bool)), wp(c, (q : ((List[Char]) -> Num) -> Bool))) == wp(c, UNION(p, q))"), t15))
}

///|
let wp_disjunctive_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_DISJUNCTIVE")

///|
/// `WP_DISJUNCTIVE`
pub fn wp_disjunctive() -> @kernel.Thm {
  wp_disjunctive_c.get()
}

///|
/// WP_SEQ
fn step_19() -> Unit raise {
  let t27 = @meson.meson_tac(@list.List([determinism()]))
  let t25 = @ind_types.distinctness("command")
  let t26 = @simp.rewrite_tac(@list.List([@ind_types.injectivity("command"), t25]))
  let t24 = @simp.gen_rewrite_tac(fn(x23 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x17 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s18 = @equal.land_conv(x17)
      fn(x19 : @kernel.Term) -> @kernel.Thm raise {
        s18(x19)
      }
    })((fn(x20 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s21 = @equal.once_depth_conv(x20)
      fn(x22 : @kernel.Term) -> @kernel.Thm raise {
        s21(x22)
      }
    })(x23))
  }, @list.List([sem_cases()]))
  let t16 = @tactics.repeat_tac(@tactics.gen_tac)
  let t28 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([wp(), wlp(), terminates(), @class.fun_eq_thm(), @trivia.o_thm()])), t16), t24), t26), t27)
  wp_seq_c.set(@tactics.prove(@term_syntax.parse_term("∀ c1 : Command, ∀ c2 : Command, ∀ q : _, wp(Sequence(c1, c2)) == o(wp(c1), wp(c2))"), t28))
}

///|
let wp_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WP_SEQ")

///|
/// `WP_SEQ`
pub fn wp_seq() -> @kernel.Thm {
  wp_seq_c.get()
}

///|
/// correct
fn step_20() -> Unit raise {
  correct_c.set(@pair.new_definition(@term_syntax.parse_term("(correct : (((List[Char]) -> Num) -> Bool, Command, ((List[Char]) -> Num) -> Bool) -> Bool)((p : ((List[Char]) -> Num) -> Bool), (c : Command), (q : ((List[Char]) -> Num) -> Bool)) == SUBSET(p, wp(c, q))")))
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
fn step_21() -> Unit raise {
  let t29 = @simp.rewrite_tac(@list.List([correct(), @sets.subset_trans()]))
  correct_prestrength_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : ((List[Char]) -> Num) -> Bool, ∀ p' : ((List[Char]) -> Num) -> Bool, ∀ c : Command, ∀ q : ((List[Char]) -> Num) -> Bool, SUBSET(p, p') && correct(p', c, q) → correct(p, c, q)"), t29))
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
fn step_22() -> Unit raise {
  let t30 = @meson.meson_tac(@list.List([wp_monotonic(), @sets.subset_trans()]))
  let t31 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct()])), t30)
  correct_postweak_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : ((List[Char]) -> Num) -> Bool, ∀ c : Command, ∀ q : ((List[Char]) -> Num) -> Bool, ∀ q' : ((List[Char]) -> Num) -> Bool, correct(p, c, q') && SUBSET(q', q) → correct(p, c, q)"), t31))
}

///|
let correct_postweak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_POSTWEAK")

///|
/// `CORRECT_POSTWEAK`
pub fn correct_postweak() -> @kernel.Thm {
  correct_postweak_c.get()
}

///|
/// CORRECT_SEQ
fn step_23() -> Unit raise {
  let t32 = @meson.meson_tac(@list.List([wp_monotonic(), @sets.subset_trans()]))
  let t33 = @tactics.then_tac(@simp.rewrite_tac(@list.List([correct(), wp_seq(), @trivia.o_thm()])), t32)
  correct_seq_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : ((List[Char]) -> Num) -> Bool, ∀ q : ((List[Char]) -> Num) -> Bool, ∀ r : ((List[Char]) -> Num) -> Bool, ∀ c1 : Command, ∀ c2 : Command, correct(p, c1, r) && correct(r, c2, q) → correct(p, Sequence(c1, c2), q)"), t33))
}

///|
let correct_seq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CORRECT_SEQ")

///|
/// `CORRECT_SEQ`
pub fn correct_seq() -> @kernel.Thm {
  correct_seq_c.get()
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
}
