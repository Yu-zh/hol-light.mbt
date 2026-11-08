// Translated from upstream GL/modal.ml; edit this file directly.

///|
/// GL/modal.ml:14
fn step_1() -> Unit raise {
  @printer.parse_as_infix("&&", (16L, "right"))
}

///|
/// GL/modal.ml:15
fn step_2() -> Unit raise {
  @printer.parse_as_infix("||", (15L, "right"))
}

///|
/// GL/modal.ml:16
fn step_3() -> Unit raise {
  @printer.parse_as_infix("-->", (14L, "right"))
}

///|
/// GL/modal.ml:17
fn step_4() -> Unit raise {
  @printer.parse_as_infix("<->", (13L, "right"))
}

///|
/// GL/modal.ml:18
fn step_5() -> Unit raise {
  @printer.parse_as_prefix("Not")
}

///|
/// GL/modal.ml:19
fn step_6() -> Unit raise {
  @printer.parse_as_prefix("Box")
}

///|
let form_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_INDUCT")

///|
/// `form_INDUCT`
pub fn form_induct() -> @kernel.Thm {
  form_induct_c.get()
}

///|
let form_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_RECURSION")

///|
/// `form_RECURSION`
pub fn form_recursion() -> @kernel.Thm {
  form_recursion_c.get()
}

///|
/// form_INDUCT, form_RECURSION
fn step_7() -> Unit raise {
  let (form_induct, form_recursion) = @ind_types.define_type("enum Form { False; True; Atom(String); Not(Form); `&&`(Form, Form); `||`(Form, Form); `-->`(Form, Form); `<->`(Form, Form); Box(Form) }")
  form_induct_c.set(form_induct)
  form_recursion_c.set(form_recursion)
}

///|
/// form_CASES
fn step_8() -> Unit raise {
  form_cases_c.set(@ind_types.prove_cases_thm(form_induct()))
}

///|
let form_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_CASES")

///|
/// `form_CASES`
pub fn form_cases() -> @kernel.Thm {
  form_cases_c.get()
}

///|
/// form_DISTINCT
fn step_9() -> Unit raise {
  form_distinct_c.set(@ind_types.distinctness("form"))
}

///|
let form_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_DISTINCT")

///|
/// `form_DISTINCT`
pub fn form_distinct() -> @kernel.Thm {
  form_distinct_c.get()
}

///|
/// form_INJ
fn step_10() -> Unit raise {
  form_inj_c.set(@ind_types.injectivity("form"))
}

///|
let form_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("form_INJ")

///|
/// `form_INJ`
pub fn form_inj() -> @kernel.Thm {
  form_inj_c.get()
}

///|
/// holds
fn step_11() -> Unit raise {
  let t1 = @tactics.match_accept_tac(@pair.forall_pair_thm())
  let pth = @tactics.prove(@term_syntax.parse_term("(∀ WP : (_, _), (P : ((_, _)) -> Bool)(WP)) == (∀ W : _, ∀ R : _, P((W, R)))"), t1)
  let t8 = @term_syntax.parse_term("(holds : (((W) -> Bool, (W, W) -> Bool), (List[Char], W) -> Bool, Form, W) -> Bool)((WR : ((W) -> Bool, (W, W) -> Bool)), (V : (List[Char], W) -> Bool), False, (w : W)) == false && holds(WR, V, True, w) == true && holds(WR, V, Atom((s : List[Char])), w) == V(s, w) && holds(WR, V, Not((p : Form)), w) == !holds(WR, V, p, w) && holds(WR, V, op_amp_amp(p, (q : Form)), w) == (holds(WR, V, p, w) && holds(WR, V, q, w)) && holds(WR, V, op_bar_bar(p, q), w) == (holds(WR, V, p, w) || holds(WR, V, q, w)) && holds(WR, V, op_minus_minus_gt(p, q), w) == (holds(WR, V, p, w) → holds(WR, V, q, w)) && holds(WR, V, op_lt_minus_gt(p, q), w) == (holds(WR, V, p, w) == holds(WR, V, q, w)) && holds(WR, V, Box(p), w) == (∀ w' : W, IN(w', FST(WR)) && SND(WR, w, w') → holds(WR, V, p, w'))")
  let t9 = @recursion.new_recursive_definition(form_recursion())
  let t3 = @simp.rewrite_rule(@list.List([pth]))
  holds_c.set((fn(x7 : @kernel.Thm) -> @kernel.Thm raise {
    (fn(x6 : @list.List[@kernel.Thm]) -> @kernel.Thm raise {
      ((x2 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x2))(((x5 : @list.List[@kernel.Thm]) => @lib.map(fn(x4 : @kernel.Thm) -> @kernel.Thm raise {
        t3(@bool.gen_all(x4))
      }, x5))(x6))
    })(@bool.conjuncts_rule(x7))
  })(t9(t8)))
}

///|
let holds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("holds")

///|
/// `holds`
pub fn holds() -> @kernel.Thm {
  holds_c.get()
}

///|
/// holds_in
fn step_12() -> Unit raise {
  holds_in_c.set(@pair.new_definition(@term_syntax.parse_term("(holds_in : (((_) -> Bool, (_, _) -> Bool), Form) -> Bool)(((W : (_) -> Bool), (R : (_, _) -> Bool)), (p : Form)) == (∀ V : (List[Char], _) -> Bool, ∀ w : _, IN(w, W) → holds((W, R), V, p, w))")))
}

///|
let holds_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("holds_in")

///|
/// `holds_in`
pub fn holds_in() -> @kernel.Thm {
  holds_in_c.get()
}

///|
/// GL/modal.ml:60
fn step_13() -> Unit raise {
  @printer.parse_as_infix("|=", (11L, "right"))
}

///|
/// valid
fn step_14() -> Unit raise {
  valid_c.set(@pair.new_definition(@term_syntax.parse_term("(op_bar_eq : ((((W) -> Bool, (W, W) -> Bool)) -> Bool, Form) -> Bool)((L : (((W) -> Bool, (W, W) -> Bool)) -> Bool), (p : Form)) == (∀ f : ((W) -> Bool, (W, W) -> Bool), L(f) → holds_in(f, p))")))
}

///|
let valid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("valid")

///|
/// `valid`
pub fn valid() -> @kernel.Thm {
  valid_c.get()
}

///|
/// MODAL_TAC
fn step_15() -> Unit raise {
  let t10 = @meson.meson_tac(@list.List([]))
  modal_tac_c.set(@tactics.then_tac(@simp.rewrite_tac(@list.List([valid(), @pair.forall_pair_thm(), holds_in(), holds()])), t10))
}

///|
let modal_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("MODAL_TAC")

///|
/// `MODAL_TAC`
pub fn modal_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (modal_tac_c.get())(x)
}

///|
/// `MODAL_RULE`
pub fn modal_rule(x11 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x11
  @tactics.prove(tm, modal_tac)
}

///|
/// HOLDS_FORALL_LEMMA
fn step_16() -> Unit raise {
  let t19 = @simp.asm_rewrite_tac(@list.List([@class.eta_ax()]))
  let t16 = @simp.rewrite_rule(@list.List([holds()]))
  let t18 = @tactics.subgoal_then(@term_syntax.parse_term("(P : ((W) -> Bool) -> Bool)((w : W) => holds(((W : (W) -> Bool), (R : (W, W) -> Bool)), (a : List[Char]) => (p : (W) -> Bool), Atom((a : List[Char])), w))"), fn(x17 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s14 = @tactics.mp_tac(x13)
      fn(x15 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s14(x15)
      }
    })(t16(x17))
  })
  let t12 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([]))])
  let t20 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t12), @tactics.disch_tac), @tactics.gen_tac), t18), t19)
  holds_forall_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, ∀ P : ((W) -> Bool) -> Bool, (∀ p : Form, ∀ V : (List[Char], W) -> Bool, P(holds((W, R), V, p))) == (∀ p : (W) -> Bool, P(p))"), t20))
}

///|
let holds_forall_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_FORALL_LEMMA")

///|
/// `HOLDS_FORALL_LEMMA`
pub fn holds_forall_lemma() -> @kernel.Thm {
  holds_forall_lemma_c.get()
}

///|
/// MODAL_SCHEMA_TAC
fn step_17() -> Unit raise {
  let t25 = @tactics.disch_then(fn(x23 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x23
    @simp.rewrite_tac(@list.List([th]))
  })
  let t22 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t21 = @tactics.mp_tac(holds_forall_lemma())
  modal_schema_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([holds_in(), holds()])), t21), t22), t25))
}

///|
let modal_schema_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("MODAL_SCHEMA_TAC")

///|
/// `MODAL_SCHEMA_TAC`
pub fn modal_schema_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (modal_schema_tac_c.get())(x)
}

///|
/// MODAL_TRANS
fn step_18() -> Unit raise {
  let t26 = @tactics.then_tac(modal_schema_tac, @meson.meson_tac(@list.List([])))
  modal_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, (∀ w : W, ∀ w' : W, ∀ w'' : W, IN(w, W) && IN(w', W) && IN(w'', W) && R(w, w') && R(w', w'') → R(w, w'')) == (∀ p : Form, holds_in((W, R), op_minus_minus_gt(Box(p), Box(Box(p)))))"), t26))
}

///|
let modal_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MODAL_TRANS")

///|
/// `MODAL_TRANS`
pub fn modal_trans() -> @kernel.Thm {
  modal_trans_c.get()
}

///|
/// TRANSNT
fn step_19() -> Unit raise {
  transnt_c.set(@pair.new_definition(@term_syntax.parse_term("(TRANSNT : (((W) -> Bool, (W, W) -> Bool)) -> Bool)(((W : (W) -> Bool), (R : (W, W) -> Bool))) == (!(W == {}) && (∀ x : W, ∀ y : W, R(x, y) → IN(x, W) && IN(y, W)) && (∀ x : W, ∀ y : W, ∀ z : W, IN(x, W) && IN(y, W) && IN(z, W) && R(x, y) && R(y, z) → R(x, z)) && WF((x : W) => (y : W) => R(y, x)))")))
}

///|
let transnt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRANSNT")

///|
/// `TRANSNT`
pub fn transnt() -> @kernel.Thm {
  transnt_c.get()
}

///|
let in_minor_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_MINOR_RULES")

///|
/// `IN_MINOR_RULES`
pub fn in_minor_rules() -> @kernel.Thm {
  in_minor_rules_c.get()
}

///|
let in_minor_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_MINOR_INDUCT")

///|
/// `IN_MINOR_INDUCT`
pub fn in_minor_induct() -> @kernel.Thm {
  in_minor_induct_c.get()
}

///|
let in_minor_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_MINOR_CASES")

///|
/// `IN_MINOR_CASES`
pub fn in_minor_cases() -> @kernel.Thm {
  in_minor_cases_c.get()
}

///|
/// IN_MINOR_RULES, IN_MINOR_INDUCT, IN_MINOR_CASES
fn step_20() -> Unit raise {
  let (in_minor_rules, in_minor_induct, in_minor_cases) = @sets.new_inductive_set(@term_syntax.parse_term("(∀ p : Form, IN(p, (MINOR : (Form, Form) -> Bool)(Not(p)))) && (∀ p : Form, ∀ q : Form, IN(p, MINOR(op_amp_amp(p, q)))) && (∀ p : Form, ∀ q : Form, IN(q, MINOR(op_amp_amp(p, q)))) && (∀ p : Form, ∀ q : Form, IN(p, MINOR(op_bar_bar(p, q)))) && (∀ p : Form, ∀ q : Form, IN(q, MINOR(op_bar_bar(p, q)))) && (∀ p : Form, ∀ q : Form, IN(p, MINOR(op_minus_minus_gt(p, q)))) && (∀ p : Form, ∀ q : Form, IN(q, MINOR(op_minus_minus_gt(p, q)))) && (∀ p : Form, ∀ q : Form, IN(p, MINOR(op_lt_minus_gt(p, q)))) && (∀ p : Form, ∀ q : Form, IN(q, MINOR(op_lt_minus_gt(p, q)))) && (∀ p : Form, IN(p, MINOR(Box(p))))"))
  in_minor_rules_c.set(in_minor_rules)
  in_minor_induct_c.set(in_minor_induct)
  in_minor_cases_c.set(in_minor_cases)
}

///|
/// MINOR_CLAUSES
fn step_21() -> Unit raise {
  let t28 = @meson.meson_tac(@list.List([]))
  let t27 = @ind_types.injectivity("form")
  let t29 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_insert(), @sets.not_in_empty(), in_minor_cases(), @ind_types.distinctness("form"), t27])), t28)
  minor_clauses_c.set(@tactics.prove(@term_syntax.parse_term("MINOR(False) == {} && MINOR(True) == {} && MINOR(Atom((s : List[Char]))) == {} && (∀ p : Form, MINOR(Not(p)) == {p}) && (∀ p : Form, ∀ q : Form, MINOR(op_amp_amp(p, q)) == {p, q}) && (∀ p : Form, ∀ q : Form, MINOR(op_bar_bar(p, q)) == {p, q}) && (∀ p : Form, ∀ q : Form, MINOR(op_minus_minus_gt(p, q)) == {p, q}) && (∀ p : Form, ∀ q : Form, MINOR(op_lt_minus_gt(p, q)) == {p, q}) && (∀ p : Form, MINOR(Box(p)) == {p})"), t29))
}

///|
let minor_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINOR_CLAUSES")

///|
/// `MINOR_CLAUSES`
pub fn minor_clauses() -> @kernel.Thm {
  minor_clauses_c.get()
}

///|
/// GL/modal.ml:136
fn step_22() -> Unit raise {
  @printer.parse_as_infix("SUBFORMULA", @printer.get_infix_status("SUBSET"))
}

///|
/// SUBFORMULA
fn step_23() -> Unit raise {
  subformula_c.set(@pair.new_definition(@term_syntax.parse_term("(SUBFORMULA : (Form, Form) -> Bool) == RTC((p : Form) => (q : Form) => IN(p, MINOR(q)))")))
}

///|
let subformula_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBFORMULA")

///|
/// `SUBFORMULA`
pub fn subformula() -> @kernel.Thm {
  subformula_c.get()
}

///|
/// SUBFORMULA_REFL
fn step_24() -> Unit raise {
  let t30 = @simp.rewrite_tac(@list.List([subformula(), @rstc.rtc_refl()]))
  subformula_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, SUBFORMULA(p, p)"), t30))
}

///|
let subformula_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBFORMULA_REFL")

///|
/// `SUBFORMULA_REFL`
pub fn subformula_refl() -> @kernel.Thm {
  subformula_refl_c.get()
}

///|
/// SUBFORMULA_TRANS
fn step_25() -> Unit raise {
  let t31 = @simp.rewrite_tac(@list.List([subformula(), @rstc.rtc_trans()]))
  subformula_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, SUBFORMULA(p, q) && SUBFORMULA(q, r) → SUBFORMULA(p, r)"), t31))
}

///|
let subformula_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBFORMULA_TRANS")

///|
/// `SUBFORMULA_TRANS`
pub fn subformula_trans() -> @kernel.Thm {
  subformula_trans_c.get()
}

///|
/// SUBFORMULA_CASES_L
fn step_26() -> Unit raise {
  let t32 = @meson.meson_tac(@list.List([@rstc.rtc_cases_l()]))
  let t33 = @tactics.then_tac(@simp.rewrite_tac(@list.List([subformula()])), t32)
  subformula_cases_l_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, SUBFORMULA(p, q) == (p == q || (∃ r : Form, SUBFORMULA(p, r) && IN(r, MINOR(q))))"), t33))
}

///|
let subformula_cases_l_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBFORMULA_CASES_L")

///|
/// `SUBFORMULA_CASES_L`
pub fn subformula_cases_l() -> @kernel.Thm {
  subformula_cases_l_c.get()
}

///|
/// FINITE_SUBFORMULA
fn step_27() -> Unit raise {
  let t36 = @sets.set_rule(@term_syntax.parse_term("{(q : Form) | ∃ r : Form, SUBFORMULA(q, r) && (r == (a0 : Form) || r == (a1 : Form))} == UNION({(q : Form) | SUBFORMULA(q, a0)}, {(q : Form) | SUBFORMULA(q, a1)})"))
  let t37 = @sets.set_rule(@term_syntax.parse_term("{(q : Form) | ∃ r : Form, SUBFORMULA(q, r) && r == (a : Form)} == {(q : Form) | SUBFORMULA(q, a)}"))
  let t38 = @sets.set_rule(@term_syntax.parse_term("{(q : _) | q == (a : _) || (P : (_) -> Bool)(q)} == INSERT(a, {(q : _) | P(q)})"))
  let t39 = @simp.asm_rewrite_tac(@list.List([minor_clauses(), @sets.in_insert(), @sets.not_in_empty(), @sets.set_rule(@term_syntax.parse_term("{(x : _) | x == (a : _)} == {a}")), t38, t37, t36, @sets.empty_gspec(), @sets.finite_union(), @sets.finite_insert(), @sets.finite_empty()]))
  let t35 = @simp.once_rewrite_tac(@list.List([subformula_cases_l()]))
  let t34 = @tactics.repeat_tac(@tactics.strip_tac)
  let t40 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(form_induct()), t34), t35), t39)
  finite_subformula_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, FINITE({(q : Form) | SUBFORMULA(q, p)})"), t40))
}

///|
let finite_subformula_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUBFORMULA")

///|
/// `FINITE_SUBFORMULA`
pub fn finite_subformula() -> @kernel.Thm {
  finite_subformula_c.get()
}

///|
/// FINITE_SUBSET_SUBFORMULAS_LEMMA
fn step_28() -> Unit raise {
  let t43 = @simp.rewrite_tac(@list.List([finite_subformula()]))
  let t42 = @tactics.match_mp_tac(@sets.finite_image())
  let t41 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{Not((q : Form)) | SUBFORMULA(q, (p : Form))} == IMAGE(Not, {(q : Form) | SUBFORMULA(q, p)})"))]))
  let t44 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.finite_powerset_eq(), @sets.finite_union(), finite_subformula()])), t41), @tactics.gen_tac), t42), t43)
  finite_subset_subformulas_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, FINITE({(A : (Form) -> Bool) | SUBSET(A, UNION({(q : Form) | SUBFORMULA(q, p)}, {Not((q : Form)) | SUBFORMULA(q, p)}))})"), t44))
}

///|
let finite_subset_subformulas_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SUBSET_SUBFORMULAS_LEMMA")

///|
/// `FINITE_SUBSET_SUBFORMULAS_LEMMA`
pub fn finite_subset_subformulas_lemma() -> @kernel.Thm {
  finite_subset_subformulas_lemma_c.get()
}

///|
/// SUBFORMULA_INVERSION
fn step_29() -> Unit raise {
  let t51 = @meson.meson_tac(@list.List([subformula_refl()]))
  let t50 = @simp.rewrite_tac(@list.List([minor_clauses(), @sets.in_insert(), @sets.not_in_empty()]))
  let t49 = @simp.gen_rewrite_tac(fn(x46 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s47 = @equal.land_conv(x46)
    fn(x48 : @kernel.Term) -> @kernel.Thm raise {
      s47(x48)
    }
  }, @list.List([subformula_cases_l()]))
  let t45 = @tactics.repeat_tac(@tactics.gen_tac)
  let t52 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t45), t49), t50), t51)
  subformula_inversion_c.set(@tactics.prove(@term_syntax.parse_term("(∀ p : Form, SUBFORMULA(p, False) == (p == False)) && (∀ p : Form, SUBFORMULA(p, True) == (p == True)) && (∀ p : Form, ∀ s : List[Char], SUBFORMULA(p, Atom(s)) == (p == Atom(s))) && (∀ p : Form, ∀ q : Form, SUBFORMULA(p, Not(q)) == (p == Not(q) || SUBFORMULA(p, q))) && (∀ p : Form, ∀ q : Form, ∀ r : Form, SUBFORMULA(p, op_amp_amp(q, r)) == (p == op_amp_amp(q, r) || SUBFORMULA(p, q) || SUBFORMULA(p, r))) && (∀ p : Form, ∀ q : Form, ∀ r : Form, SUBFORMULA(p, op_bar_bar(q, r)) == (p == op_bar_bar(q, r) || SUBFORMULA(p, q) || SUBFORMULA(p, r))) && (∀ p : Form, ∀ q : Form, ∀ r : Form, SUBFORMULA(p, op_minus_minus_gt(q, r)) == (p == op_minus_minus_gt(q, r) || SUBFORMULA(p, q) || SUBFORMULA(p, r))) && (∀ p : Form, ∀ q : Form, ∀ r : Form, SUBFORMULA(p, op_lt_minus_gt(q, r)) == (p == op_lt_minus_gt(q, r) || SUBFORMULA(p, q) || SUBFORMULA(p, r))) && (∀ p : Form, ∀ q : Form, SUBFORMULA(p, Box(q)) == (p == Box(q) || SUBFORMULA(p, q)))"), t52))
}

///|
let subformula_inversion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBFORMULA_INVERSION")

///|
/// `SUBFORMULA_INVERSION`
pub fn subformula_inversion() -> @kernel.Thm {
  subformula_inversion_c.get()
}

///|
/// SUBFORMULA_LIST
fn step_30() -> Unit raise {
  let t54 = @simp.simp_tac(@list.List([@misc.norepetition_list_of_set(), finite_subformula()]))
  let t53 = @simp.simp_tac(@list.List([finite_subformula(), @sets.mem_list_of_set(), @sets.in_elim_thm()]))
  let t55 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.exists_tac(@term_syntax.parse_term("list_of_set({(q : Form) | SUBFORMULA(q, (p : Form))})"))), t53), t54)
  subformula_list_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∃ X : List[Form], NOREPETITION(X) && (∀ q : Form, MEM(q, X) == SUBFORMULA(q, p))"), t55))
}

///|
let subformula_list_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBFORMULA_LIST")

///|
/// `SUBFORMULA_LIST`
pub fn subformula_list() -> @kernel.Thm {
  subformula_list_c.get()
}

///|
/// GL/modal.ml:198
fn step_31() -> Unit raise {
  ignore(@tactics.match_mp_tac(@misc.norepetition_list_of_set()))
}

///|
/// COUNTABLE_FORM
fn step_32() -> Unit raise {
  let t124 = @meson.meson_tac(@list.List([]))
  let t122 = @ind_types.injectivity("form")
  let t123 = @simp.rewrite_tac(@list.List([@sets.in_image(), @pair.exists_pair_thm(), @sets.in_cross(), @sets.in_insert(), @sets.not_in_empty(), @ind_types.distinctness("form"), t122]))
  let t121 = @simp.asm_simp_tac(@list.List([@sets.fun_in_image(), @sets.in_univ()]))
  let t120 = @tactics.hyp_tac(@simp.rewrite_tac, "u_alt max")(@list.List([]))
  let t117 = @equal.gsym(@arith.add1())
  let t118 = @list.List([@arith.lt_0(), @sets.in_union(), @sets.in_insert(), @sets.not_in_empty(), @ind_types.distinctness("form"), t117, @arith.lt_suc()])
  let t119 = @tactics.hyp_tac(@simp.rewrite_tac, "size")(t118)
  let t115 = @ind_types.cases("form")
  let t116 = @tactics.struct_cases_tac(@bool.spec(@term_syntax.parse_term("(p : Form)"), t115))
  let t113 = @sets.set_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("∀ p : Num, ∀ q : Num, ∀ n : Num, (MAX(p, q) < n) == (p < n && q < n)"))]))
  let t114 = @list.List([@tactics.then_tac(@tactics.use_then("u", fn(x111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x111
    @simp.rewrite_tac(@list.List([@equal.gsym(th_3)]))
  }), t113), @tactics.all_tac])
  let t110 = @theorems.claim_tac("max", @term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ n : Num, (MAX((size : (Form) -> Num)(p), size(q)) < n) == (IN(p, (u : (Num, Form) -> Bool)(n)) && IN(q, u(n)))"))
  let t108 = @sets.set_tac(@list.List([]))
  let t109 = @list.List([@tactics.then_tac(@tactics.use_then("u", fn(x106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x106
    @simp.rewrite_tac(@list.List([@equal.gsym(th_2)]))
  }), t108), @tactics.all_tac])
  let t105 = @theorems.claim_tac("u_alt", @term_syntax.parse_term("∀ p : Form, ∀ n : Num, ((size : (Form) -> Num)(p) < n) == IN(p, (u : (Num, Form) -> Bool)(n))"))
  let t104 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_gspec()]))
  let t100 = @term_syntax.parse_term("SUC((n : Num))")
  let t103 = @tactics.use_then("u", fn(x102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x99 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x96 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s97 = @tactics.subst1_tac(x96)
        fn(x98 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s97(x98)
        }
      })(@equal.gsym(x99))
    })(((x101 : @kernel.Thm) => @bool.spec(t100, x101))(x102))
  })
  let t94 = @simp.asm_simp_tac(@list.List([@card.countable_image(), @misc.countable_string(), @card.countable_cross(), @card.countable_insert(), @card.countable_empty()]))
  let t95 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@card.countable_union(), @card.countable_insert(), @card.countable_empty()])), t94), @tactics.all_tac])
  let t93 = @tactics.exists_tac(@term_syntax.parse_term("UNION((u : (Num, Form) -> Bool)((n : Num)), UNION({True, False}, UNION(IMAGE(Atom, UNIV), UNION(IMAGE(Not, u(n)), UNION(IMAGE(GABS((f : (((Form, Form) -> Form, Form, Form)) -> Form) => ∀ op : (Form, Form) -> Form, ∀ p : Form, ∀ q : Form, GEQ(f((op, p, q)), op(p, q))), CROSS({op_amp_amp, op_bar_bar, op_minus_minus_gt, op_lt_minus_gt}, CROSS(u(n), u(n)))), IMAGE(Box, u(n)))))))"))
  let t92 = @tactics.match_mp_tac(@card.countable_subset())
  let t90 = @tactics.pop_assum(fn(x87 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s88 = ((x86 : @kernel.Thm) => @tactics.label_tac("ind", x86))(x87)
    fn(x89 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s88(x89)
    }
  })
  let t85 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("∀ n : Num, !(n < 0)")), @sets.empty_gspec(), @card.countable_empty()]))
  let t91 = @list.List([@tactics.then_tac(@tactics.remove_then("u", fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x83
    @simp.rewrite_tac(@list.List([@equal.gsym(th_1)]))
  }), t85), t90])
  let t82 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec(), @sets.in_univ()]))
  let t80 = @meson.meson_tac(@list.List([]))
  let t79 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_gspec(), @sets.in_image(), @sets.in_univ()]))
  let t78 = @simp.simp_tac(@list.List([@card.num_countable(), @card.countable_image()]))
  let t77 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE((u : (Num, Form) -> Bool), UNIV)"))
  let t81 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@card.countable_subset()), t77), t78), t79), t80), @tactics.all_tac])
  let t76 = @tactics.match_mp_tac(@card.countable_unions())
  let t74 = @meson.meson_tac(@list.List([]))
  let t73 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @int.arith_rule(@term_syntax.parse_term("(m : Num) < m + 1"))]))
  let t72 = @tactics.remove_then("u", fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x70
    @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
  })
  let t69 = @tactics.exists_tac(@term_syntax.parse_term("(u : (Num, Form) -> Bool)((size : (Form) -> Num)((p : Form)) + 1)"))
  let t68 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)"))
  let t75 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_univ(), @sets.in_unions(), @sets.in_elim_thm()])), t68), t69), t72), t73), t74), @tactics.all_tac])
  let t67 = @tactics.subgoal_then(@term_syntax.parse_term("UNIV == UNIONS({(u : (Num, Form) -> Bool)((n : Num)) | IN(n, UNIV)})"), fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s65 = @tactics.subst1_tac(x64)
    fn(x66 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s65(x66)
    }
  })
  let t63 = @tactics.pop_assum(fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s61 = ((x59 : @kernel.Thm) => @tactics.label_tac("u", x59))(x60)
    fn(x62 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s61(x62)
    }
  })
  let t58 = @simp.abbrev_tac(@term_syntax.parse_term("(u : (Num, Form) -> Bool)((n : Num)) == {(p : Form) | (size : (Form) -> Num)(p) < n}"))
  let t56 = @term_syntax.parse_term("∃ depth : (Form) -> Num, depth(False) == 0 && depth(True) == 0 && (∀ a : List[Char], depth(Atom(a)) == 0) && (∀ p : Form, depth(Not(p)) == depth(p) + 1) && (∀ p : Form, ∀ q : Form, depth(op_amp_amp(p, q)) == MAX(depth(p), depth(q)) + 1) && (∀ p : Form, ∀ q : Form, depth(op_bar_bar(p, q)) == MAX(depth(p), depth(q)) + 1) && (∀ p : Form, ∀ q : Form, depth(op_minus_minus_gt(p, q)) == MAX(depth(p), depth(q)) + 1) && (∀ p : Form, ∀ q : Form, depth(op_lt_minus_gt(p, q)) == MAX(depth(p), depth(q)) + 1) && (∀ p : Form, depth(Box(p)) == depth(p) + 1)")
  let t57 = @theorems.destruct_tac("@size. size")
  let t125 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(t57(@define.prove_general_recursive_function_exists(t56)), t58), t63), t67), t75), t76), @tactics.conj_tac), t81), t82), @nums.induct_tac), t91), t92), t93), @tactics.conj_tac), t95), t103), t104), t105), t109), t110), t114), @tactics.gen_tac), t116), t119), t120), t121), t123), t124)
  countable_form_c.set(@tactics.prove(@term_syntax.parse_term("(COUNTABLE : ((Form) -> Bool) -> Bool)((UNIV : (Form) -> Bool))"), t125))
}

///|
let countable_form_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COUNTABLE_FORM")

///|
/// `COUNTABLE_FORM`
pub fn countable_form() -> @kernel.Thm {
  countable_form_c.get()
}

///|
/// BISIMIMULATION
fn step_33() -> Unit raise {
  bisimimulation_c.set(@pair.new_definition(@term_syntax.parse_term("(BISIMIMULATION : (((A) -> Bool, (A, A) -> Bool, (List[Char], A) -> Bool), ((B) -> Bool, (B, B) -> Bool, (List[Char], B) -> Bool), (A, B) -> Bool) -> Bool)(((W1 : (A) -> Bool), (R1 : (A, A) -> Bool), (V1 : (List[Char], A) -> Bool)), ((W2 : (B) -> Bool), (R2 : (B, B) -> Bool), (V2 : (List[Char], B) -> Bool)), (Z : (A, B) -> Bool)) == (∀ w1 : A, ∀ w2 : B, Z(w1, w2) → IN(w1, W1) && IN(w2, W2) && (∀ a : List[Char], V1(a, w1) == V2(a, w2)) && (∀ w1' : A, R1(w1, w1') → (∃ w2' : B, IN(w2', W2) && Z(w1', w2') && R2(w2, w2'))) && (∀ w2' : B, R2(w2, w2') → (∃ w1' : A, IN(w1', W1) && Z(w1', w2') && R1(w1, w1'))))")))
}

///|
let bisimimulation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BISIMIMULATION")

///|
/// `BISIMIMULATION`
pub fn bisimimulation() -> @kernel.Thm {
  bisimimulation_c.get()
}

///|
/// BISIMIMULATION_HOLDS
fn step_34() -> Unit raise {
  let t132 = @meson.asm_meson_tac(@list.List([]))
  let t131 = @simp.rewrite_tac(@list.List([holds()]))
  let t130 = @tactics.match_mp_tac(form_induct())
  let t129 = @simp.rewrite_tac(@list.List([bisimimulation()]))
  let t128 = @tactics.repeat_tac(@tactics.gen_tac)
  let t133 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ W1 : (A) -> Bool, ∀ R1 : (A, A) -> Bool, ∀ V1 : (List[Char], A) -> Bool, ∀ W2 : (B) -> Bool, ∀ R2 : (B, B) -> Bool, ∀ V2 : (List[Char], B) -> Bool, ∀ Z : (A, B) -> Bool, BISIMIMULATION((W1, R1, V1), (W2, R2, V2), Z) → (∀ p : Form, ∀ w1 : A, ∀ w2 : B, Z(w1, w2) → holds((W1, R1), V1, p, w1) == holds((W2, R2), V2, p, w2))"), fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x126
    @meson.meson_tac(@list.List([th]))
  }), t128), t129), @tactics.disch_tac), t130), t131), t132)
  bisimimulation_holds_c.set(@tactics.prove(@term_syntax.parse_term("∀ W1 : (A) -> Bool, ∀ R1 : (A, A) -> Bool, ∀ V1 : (List[Char], A) -> Bool, ∀ W2 : (B) -> Bool, ∀ R2 : (B, B) -> Bool, ∀ V2 : (List[Char], B) -> Bool, ∀ Z : (A, B) -> Bool, ∀ p : Form, ∀ w1 : A, ∀ w2 : B, BISIMIMULATION((W1, R1, V1), (W2, R2, V2), Z) && Z(w1, w2) → holds((W1, R1), V1, p, w1) == holds((W2, R2), V2, p, w2)"), t133))
}

///|
let bisimimulation_holds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BISIMIMULATION_HOLDS")

///|
/// `BISIMIMULATION_HOLDS`
pub fn bisimimulation_holds() -> @kernel.Thm {
  bisimimulation_holds_c.get()
}

///|
/// BISIMILAR
fn step_35() -> Unit raise {
  bisimilar_c.set(@pair.new_definition(@term_syntax.parse_term("(BISIMILAR : (((A) -> Bool, (A, A) -> Bool, (List[Char], A) -> Bool), ((B) -> Bool, (B, B) -> Bool, (List[Char], B) -> Bool), A, B) -> Bool)(((W1 : (A) -> Bool), (R1 : (A, A) -> Bool), (V1 : (List[Char], A) -> Bool)), ((W2 : (B) -> Bool), (R2 : (B, B) -> Bool), (V2 : (List[Char], B) -> Bool)), (w1 : A), (w2 : B)) == (∃ Z : (A, B) -> Bool, BISIMIMULATION((W1, R1, V1), (W2, R2, V2), Z) && Z(w1, w2))")))
}

///|
let bisimilar_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BISIMILAR")

///|
/// `BISIMILAR`
pub fn bisimilar() -> @kernel.Thm {
  bisimilar_c.get()
}

///|
/// BISIMILAR_IN
fn step_36() -> Unit raise {
  let t134 = @meson.meson_tac(@list.List([]))
  let t135 = @tactics.then_tac(@simp.rewrite_tac(@list.List([bisimilar(), bisimimulation()])), t134)
  bisimilar_in_c.set(@tactics.prove(@term_syntax.parse_term("∀ W1 : (A) -> Bool, ∀ R1 : (A, A) -> Bool, ∀ V1 : (List[Char], A) -> Bool, ∀ W2 : (B) -> Bool, ∀ R2 : (B, B) -> Bool, ∀ V2 : (List[Char], B) -> Bool, ∀ w1 : A, ∀ w2 : B, BISIMILAR((W1, R1, V1), (W2, R2, V2), w1, w2) → IN(w1, W1) && IN(w2, W2)"), t135))
}

///|
let bisimilar_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BISIMILAR_IN")

///|
/// `BISIMILAR_IN`
pub fn bisimilar_in() -> @kernel.Thm {
  bisimilar_in_c.get()
}

///|
/// BISIMILAR_HOLDS
fn step_37() -> Unit raise {
  let t136 = @meson.meson_tac(@list.List([bisimimulation_holds()]))
  let t137 = @tactics.then_tac(@simp.rewrite_tac(@list.List([bisimilar()])), t136)
  bisimilar_holds_c.set(@tactics.prove(@term_syntax.parse_term("∀ W1 : (A) -> Bool, ∀ R1 : (A, A) -> Bool, ∀ V1 : (List[Char], A) -> Bool, ∀ W2 : (B) -> Bool, ∀ R2 : (B, B) -> Bool, ∀ V2 : (List[Char], B) -> Bool, ∀ w1 : A, ∀ w2 : B, BISIMILAR((W1, R1, V1), (W2, R2, V2), w1, w2) → (∀ p : Form, holds((W1, R1), V1, p, w1) == holds((W2, R2), V2, p, w2))"), t137))
}

///|
let bisimilar_holds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BISIMILAR_HOLDS")

///|
/// `BISIMILAR_HOLDS`
pub fn bisimilar_holds() -> @kernel.Thm {
  bisimilar_holds_c.get()
}

///|
/// BISIMILAR_HOLDS_IN
fn step_38() -> Unit raise {
  let t138 = @meson.meson_tac(@list.List([bisimilar_holds(), bisimilar_in()]))
  let t139 = @tactics.then_tac(@simp.rewrite_tac(@list.List([holds_in()])), t138)
  bisimilar_holds_in_c.set(@tactics.prove(@term_syntax.parse_term("∀ W1 : (A) -> Bool, ∀ R1 : (A, A) -> Bool, ∀ W2 : (B) -> Bool, ∀ R2 : (B, B) -> Bool, (∀ V1 : (List[Char], A) -> Bool, ∀ w1 : A, ∃ V2 : (List[Char], B) -> Bool, ∃ w2 : B, BISIMILAR((W1, R1, V1), (W2, R2, V2), w1, w2)) → (∀ p : Form, holds_in((W2, R2), p) → holds_in((W1, R1), p))"), t139))
}

///|
let bisimilar_holds_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BISIMILAR_HOLDS_IN")

///|
/// `BISIMILAR_HOLDS_IN`
pub fn bisimilar_holds_in() -> @kernel.Thm {
  bisimilar_holds_in_c.get()
}

///|
/// BISIMILAR_VALID
fn step_39() -> Unit raise {
  let t140 = @meson.meson_tac(@list.List([bisimilar_holds(), bisimilar_in()]))
  let t141 = @tactics.then_tac(@simp.rewrite_tac(@list.List([valid(), holds_in(), @pair.forall_pair_thm()])), t140)
  bisimilar_valid_c.set(@tactics.prove(@term_syntax.parse_term("∀ L1 : (((A) -> Bool, (A, A) -> Bool)) -> Bool, ∀ L2 : (((B) -> Bool, (B, B) -> Bool)) -> Bool, (∀ W1 : (A) -> Bool, ∀ R1 : (A, A) -> Bool, ∀ V1 : (List[Char], A) -> Bool, ∀ w1 : A, L1((W1, R1)) && IN(w1, W1) → (∃ W2 : (B) -> Bool, ∃ R2 : (B, B) -> Bool, ∃ V2 : (List[Char], B) -> Bool, ∃ w2 : B, L2((W2, R2)) && BISIMILAR((W1, R1, V1), (W2, R2, V2), w1, w2))) → (∀ p : Form, op_bar_eq(L2, p) → op_bar_eq(L1, p))"), t141))
}

///|
let bisimilar_valid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BISIMILAR_VALID")

///|
/// `BISIMILAR_VALID`
pub fn bisimilar_valid() -> @kernel.Thm {
  bisimilar_valid_c.get()
}

///|
/// GL/modal.ml:338
fn step_40() -> Unit raise {
  @printer.parse_as_prefix("Diam")
}

///|
/// GL/modal.ml:339
fn step_41() -> Unit raise {
  @printer.parse_as_prefix("Dotbox")
}

///|
/// diam_DEF
fn step_42() -> Unit raise {
  diam_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Diam : (Form) -> Form)((p : Form)) == Not(Box(Not(p)))")))
}

///|
let diam_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("diam_DEF")

///|
/// `diam_DEF`
pub fn diam_def() -> @kernel.Thm {
  diam_def_c.get()
}

///|
/// dotbox_DEF
fn step_43() -> Unit raise {
  dotbox_def_c.set(@pair.new_definition(@term_syntax.parse_term("(Dotbox : (Form) -> Form)((p : Form)) == op_amp_amp(Box(p), p)")))
}

///|
let dotbox_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("dotbox_DEF")

///|
/// `dotbox_DEF`
pub fn dotbox_def() -> @kernel.Thm {
  dotbox_def_c.get()
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
