// Translated from upstream GL/gl.ml; edit this file directly.

///|
let glaxiom_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GLaxiom_RULES")

///|
/// `GLaxiom_RULES`
pub fn glaxiom_rules() -> @kernel.Thm {
  glaxiom_rules_c.get()
}

///|
let glaxiom_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GLaxiom_INDUCT")

///|
/// `GLaxiom_INDUCT`
pub fn glaxiom_induct() -> @kernel.Thm {
  glaxiom_induct_c.get()
}

///|
let glaxiom_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GLaxiom_CASES")

///|
/// `GLaxiom_CASES`
pub fn glaxiom_cases() -> @kernel.Thm {
  glaxiom_cases_c.get()
}

///|
/// GLaxiom_RULES, GLaxiom_INDUCT, GLaxiom_CASES
fn step_1() -> Unit raise {
  let (glaxiom_rules, glaxiom_induct, glaxiom_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ p : Form, ∀ q : Form, (GLaxiom : (Form) -> Bool)(op_minus_minus_gt(p, op_minus_minus_gt(q, p)))) && (∀ p : Form, ∀ q : Form, ∀ r : Form, GLaxiom(op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, r)), op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p, r))))) && (∀ p : Form, GLaxiom(op_minus_minus_gt(op_minus_minus_gt(op_minus_minus_gt(p, False), False), p))) && (∀ p : Form, ∀ q : Form, GLaxiom(op_minus_minus_gt(op_lt_minus_gt(p, q), op_minus_minus_gt(p, q)))) && (∀ p : Form, ∀ q : Form, GLaxiom(op_minus_minus_gt(op_lt_minus_gt(p, q), op_minus_minus_gt(q, p)))) && (∀ p : Form, ∀ q : Form, GLaxiom(op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(op_minus_minus_gt(q, p), op_lt_minus_gt(p, q))))) && GLaxiom(op_lt_minus_gt(True, op_minus_minus_gt(False, False))) && (∀ p : Form, GLaxiom(op_lt_minus_gt(Not(p), op_minus_minus_gt(p, False)))) && (∀ p : Form, ∀ q : Form, GLaxiom(op_lt_minus_gt(op_amp_amp(p, q), op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, False)), False)))) && (∀ p : Form, ∀ q : Form, GLaxiom(op_lt_minus_gt(op_bar_bar(p, q), Not(op_amp_amp(Not(p), Not(q)))))) && (∀ p : Form, ∀ q : Form, GLaxiom(op_minus_minus_gt(Box(op_minus_minus_gt(p, q)), op_minus_minus_gt(Box(p), Box(q))))) && (∀ p : Form, GLaxiom(op_minus_minus_gt(Box(op_minus_minus_gt(Box(p), p)), Box(p))))"))
  glaxiom_rules_c.set(glaxiom_rules)
  glaxiom_induct_c.set(glaxiom_induct)
  glaxiom_cases_c.set(glaxiom_cases)
}

///|
let glproves_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GLproves_RULES")

///|
/// `GLproves_RULES`
pub fn glproves_rules() -> @kernel.Thm {
  glproves_rules_c.get()
}

///|
let glproves_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GLproves_INDUCT")

///|
/// `GLproves_INDUCT`
pub fn glproves_induct() -> @kernel.Thm {
  glproves_induct_c.get()
}

///|
let glproves_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GLproves_CASES")

///|
/// `GLproves_CASES`
pub fn glproves_cases() -> @kernel.Thm {
  glproves_cases_c.get()
}

///|
/// GLproves_RULES, GLproves_INDUCT, GLproves_CASES
fn step_2() -> Unit raise {
  let (glproves_rules, glproves_induct, glproves_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ p : Form, GLaxiom(p) → (op_bar_minus_minus : (Form) -> Bool)(p)) && (∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(p, q)) && op_bar_minus_minus(p) → op_bar_minus_minus(q)) && (∀ p : Form, op_bar_minus_minus(p) → op_bar_minus_minus(Box(p)))"))
  glproves_rules_c.set(glproves_rules)
  glproves_induct_c.set(glproves_induct)
  glproves_cases_c.set(glproves_cases)
}

///|
/// GL_axiom_addimp
fn step_3() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_addimp_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(p, op_minus_minus_gt(q, p)))"), t1))
}

///|
let gl_axiom_addimp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_addimp")

///|
/// `GL_axiom_addimp`
pub fn gl_axiom_addimp() -> @kernel.Thm {
  gl_axiom_addimp_c.get()
}

///|
/// GL_axiom_distribimp
fn step_4() -> Unit raise {
  let t2 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_distribimp_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, r)), op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p, r))))"), t2))
}

///|
let gl_axiom_distribimp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_distribimp")

///|
/// `GL_axiom_distribimp`
pub fn gl_axiom_distribimp() -> @kernel.Thm {
  gl_axiom_distribimp_c.get()
}

///|
/// GL_axiom_doubleneg
fn step_5() -> Unit raise {
  let t3 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_doubleneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(op_minus_minus_gt(p, False), False), p))"), t3))
}

///|
let gl_axiom_doubleneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_doubleneg")

///|
/// `GL_axiom_doubleneg`
pub fn gl_axiom_doubleneg() -> @kernel.Thm {
  gl_axiom_doubleneg_c.get()
}

///|
/// GL_axiom_iffimp1
fn step_6() -> Unit raise {
  let t4 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_iffimp1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_lt_minus_gt(p, q), op_minus_minus_gt(p, q)))"), t4))
}

///|
let gl_axiom_iffimp1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_iffimp1")

///|
/// `GL_axiom_iffimp1`
pub fn gl_axiom_iffimp1() -> @kernel.Thm {
  gl_axiom_iffimp1_c.get()
}

///|
/// GL_axiom_iffimp2
fn step_7() -> Unit raise {
  let t5 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_iffimp2_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_lt_minus_gt(p, q), op_minus_minus_gt(q, p)))"), t5))
}

///|
let gl_axiom_iffimp2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_iffimp2")

///|
/// `GL_axiom_iffimp2`
pub fn gl_axiom_iffimp2() -> @kernel.Thm {
  gl_axiom_iffimp2_c.get()
}

///|
/// GL_axiom_impiff
fn step_8() -> Unit raise {
  let t6 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_impiff_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(op_minus_minus_gt(q, p), op_lt_minus_gt(p, q))))"), t6))
}

///|
let gl_axiom_impiff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_impiff")

///|
/// `GL_axiom_impiff`
pub fn gl_axiom_impiff() -> @kernel.Thm {
  gl_axiom_impiff_c.get()
}

///|
/// GL_axiom_true
fn step_9() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_true_c.set(@tactics.prove(@term_syntax.parse_term("op_bar_minus_minus(op_lt_minus_gt(True, op_minus_minus_gt(False, False)))"), t7))
}

///|
let gl_axiom_true_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_true")

///|
/// `GL_axiom_true`
pub fn gl_axiom_true() -> @kernel.Thm {
  gl_axiom_true_c.get()
}

///|
/// GL_axiom_not
fn step_10() -> Unit raise {
  let t8 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_not_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(Not(p), op_minus_minus_gt(p, False)))"), t8))
}

///|
let gl_axiom_not_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_not")

///|
/// `GL_axiom_not`
pub fn gl_axiom_not() -> @kernel.Thm {
  gl_axiom_not_c.get()
}

///|
/// GL_axiom_and
fn step_11() -> Unit raise {
  let t9 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_and_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(op_amp_amp(p, q), op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, False)), False)))"), t9))
}

///|
let gl_axiom_and_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_and")

///|
/// `GL_axiom_and`
pub fn gl_axiom_and() -> @kernel.Thm {
  gl_axiom_and_c.get()
}

///|
/// GL_axiom_or
fn step_12() -> Unit raise {
  let t10 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_or_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(op_bar_bar(p, q), Not(op_amp_amp(Not(p), Not(q)))))"), t10))
}

///|
let gl_axiom_or_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_or")

///|
/// `GL_axiom_or`
pub fn gl_axiom_or() -> @kernel.Thm {
  gl_axiom_or_c.get()
}

///|
/// GL_axiom_boximp
fn step_13() -> Unit raise {
  let t11 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_boximp_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(Box(op_minus_minus_gt(p, q)), op_minus_minus_gt(Box(p), Box(q))))"), t11))
}

///|
let gl_axiom_boximp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_boximp")

///|
/// `GL_axiom_boximp`
pub fn gl_axiom_boximp() -> @kernel.Thm {
  gl_axiom_boximp_c.get()
}

///|
/// GL_axiom_lob
fn step_14() -> Unit raise {
  let t12 = @meson.meson_tac(@list.List([glproves_rules(), glaxiom_rules()]))
  gl_axiom_lob_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(Box(op_minus_minus_gt(Box(p), p)), Box(p)))"), t12))
}

///|
let gl_axiom_lob_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_axiom_lob")

///|
/// `GL_axiom_lob`
pub fn gl_axiom_lob() -> @kernel.Thm {
  gl_axiom_lob_c.get()
}

///|
/// GL_modusponens
fn step_15() -> Unit raise {
  let t13 = @meson.meson_tac(@list.List([glproves_rules()]))
  gl_modusponens_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(p, (q : Form))) && op_bar_minus_minus(p) → op_bar_minus_minus(q)"), t13))
}

///|
let gl_modusponens_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_modusponens")

///|
/// `GL_modusponens`
pub fn gl_modusponens() -> @kernel.Thm {
  gl_modusponens_c.get()
}

///|
/// GL_necessitation
fn step_16() -> Unit raise {
  let t14 = @meson.meson_tac(@list.List([glproves_rules()]))
  gl_necessitation_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(p) → op_bar_minus_minus(Box(p))"), t14))
}

///|
let gl_necessitation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_necessitation")

///|
/// `GL_necessitation`
pub fn gl_necessitation() -> @kernel.Thm {
  gl_necessitation_c.get()
}

///|
/// LOB_IMP_TRANSNT
fn step_17() -> Unit raise {
  let t33 = @meson.asm_meson_tac(@list.List([]))
  let t32 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t28 = @term_syntax.parse_term("(x : W) => ∀ w : W, IN(x, (W : (W) -> Bool)) && (R : (W, W) -> Bool)(w, x) → (P : (W) -> Bool)(x)")
  let t31 = @tactics.first_x_assum(fn(x30 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x25 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s26 = @tactics.mp_tac(x25)
      fn(x27 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s26(x27)
      }
    })(((x29 : @kernel.Thm) => @bool.spec(t28, x29))(x30))
  })
  let t24 = @tactics.x_gen_tac(@term_syntax.parse_term("(P : (W) -> Bool)"))
  let t34 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@wf.wf_ind()])), t24), @tactics.disch_tac), t31), t32), t33)
  let t23 = @meson.meson_tac(@list.List([]))
  let t18 = @term_syntax.parse_term("(w : W)")
  let t19 = @list.List([@term_syntax.parse_term("(v : W) => IN(v, (W : (W) -> Bool)) && (R : (W, W) -> Bool)((w : W), v) && (∀ w'' : W, IN(w'', W) && R(v, w'') → R(w, w''))"), t18])
  let t22 = @tactics.first_x_assum(fn(x21 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x15 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s16 = @tactics.mp_tac(x15)
      fn(x17 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s16(x17)
      }
    })(((x20 : @kernel.Thm) => @bool.specl(t19, x20))(x21))
  })
  let t35 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : W)")), t22), t23), t34])
  let t36 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@modal.modal_schema_tac, @tactics.strip_tac), @tactics.conj_tac), t35)
  lob_imp_transnt_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, (∀ x : W, ∀ y : W, R(x, y) → IN(x, W) && IN(y, W)) && (∀ p : Form, holds_in((W, R), op_minus_minus_gt(Box(op_minus_minus_gt(Box(p), p)), Box(p)))) → (∀ x : W, ∀ y : W, ∀ z : W, IN(x, W) && IN(y, W) && IN(z, W) && R(x, y) && R(y, z) → R(x, z)) && WF((x : W) => (y : W) => R(y, x))"), t36))
}

///|
let lob_imp_transnt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LOB_IMP_TRANSNT")

///|
/// `LOB_IMP_TRANSNT`
pub fn lob_imp_transnt() -> @kernel.Thm {
  lob_imp_transnt_c.get()
}

///|
/// TRANSNT_IMP_LOB
fn step_18() -> Unit raise {
  let t40 = @meson.asm_meson_tac(@list.List([]))
  let t39 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t38 = @tactics.repeat_tac(@tactics.disch_tac)
  let t37 = @tactics.repeat_tac(@tactics.gen_tac)
  let t41 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@modal.modal_schema_tac, @simp.rewrite_tac(@list.List([@wf.wf_ind()]))), @tactics.strip_tac), t37), t38), t39), t40)
  transnt_imp_lob_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, (∀ x : W, ∀ y : W, R(x, y) → IN(x, W) && IN(y, W)) && (∀ x : W, ∀ y : W, ∀ z : W, IN(x, W) && IN(y, W) && IN(z, W) && R(x, y) && R(y, z) → R(x, z)) && WF((x : W) => (y : W) => R(y, x)) → (∀ p : Form, holds_in((W, R), op_minus_minus_gt(Box(op_minus_minus_gt(Box(p), p)), Box(p))))"), t41))
}

///|
let transnt_imp_lob_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRANSNT_IMP_LOB")

///|
/// `TRANSNT_IMP_LOB`
pub fn transnt_imp_lob() -> @kernel.Thm {
  transnt_imp_lob_c.get()
}

///|
/// TRANSNT_EQ_LOB
fn step_19() -> Unit raise {
  let t43 = @simp.asm_rewrite_tac(@list.List([]))
  let t44 = @tactics.then_tac(@tactics.match_mp_tac(lob_imp_transnt()), t43)
  let t42 = @simp.asm_rewrite_tac(@list.List([]))
  let t45 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(transnt_imp_lob()), t42), t44])
  let t46 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), @tactics.strip_tac), t45)
  transnt_eq_lob_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, (∀ x : W, ∀ y : W, R(x, y) → IN(x, W) && IN(y, W)) → ((∀ x : W, ∀ y : W, ∀ z : W, IN(x, W) && IN(y, W) && IN(z, W) && R(x, y) && R(y, z) → R(x, z)) && WF((x : W) => (y : W) => R(y, x))) == (∀ p : Form, holds_in((W, R), op_minus_minus_gt(Box(op_minus_minus_gt(Box(p), p)), Box(p))))"), t46))
}

///|
let transnt_eq_lob_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRANSNT_EQ_LOB")

///|
/// `TRANSNT_EQ_LOB`
pub fn transnt_eq_lob() -> @kernel.Thm {
  transnt_eq_lob_c.get()
}

///|
/// GLAXIOMS_TRANSNT_VALID
fn step_20() -> Unit raise {
  let t56 = @simp.asm_rewrite_tac(@list.List([]))
  let t57 = @tactics.try_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.match_mp_tac(transnt_imp_lob())), t56), @tactics.no_tac))
  let t55 = @tactics.repeat_tac(@tactics.conj_tac)
  let t54 = @tactics.repeat_tac(@tactics.gen_tac)
  let t53 = @simp.rewrite_tac(@list.List([@modal.transnt()]))
  let t52 = @tactics.match_mp_tac(@meson.meson(@list.List([@pair.pair_surjective()]), @term_syntax.parse_term("(∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, (P : (((W) -> Bool, (W, W) -> Bool)) -> Bool)((W, R))) → (∀ f : ((W) -> Bool, (W, W) -> Bool), P(f))")))
  let t50 = @term_syntax.parse_term("(f : ((W) -> Bool, (W, W) -> Bool))")
  let t51 = @tactics.spec_tac(@term_syntax.parse_term("(f : ((W) -> Bool, (W, W) -> Bool))"), t50)
  let t49 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t48 = @theorems.fix_tac("f")
  let t47 = @simp.rewrite_tac(@list.List([@modal.valid()]))
  let t58 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(glaxiom_induct()), t47), t48), t49), t51), t52), t53), t54), t55), t57), @modal.modal_tac)
  glaxioms_transnt_valid_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, GLaxiom(p) → (op_bar_eq : ((((W) -> Bool, (W, W) -> Bool)) -> Bool, Form) -> Bool)((TRANSNT : (((W) -> Bool, (W, W) -> Bool)) -> Bool), p)"), t58))
}

///|
let glaxioms_transnt_valid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GLAXIOMS_TRANSNT_VALID")

///|
/// `GLAXIOMS_TRANSNT_VALID`
pub fn glaxioms_transnt_valid() -> @kernel.Thm {
  glaxioms_transnt_valid_c.get()
}

///|
/// GL_TRANSNT_VALID
fn step_21() -> Unit raise {
  let t59 = @simp.rewrite_tac(@list.List([glaxioms_transnt_valid()]))
  let t60 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(glproves_induct()), t59), @modal.modal_tac)
  gl_transnt_valid_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(p) → (op_bar_eq : ((((W) -> Bool, (W, W) -> Bool)) -> Bool, Form) -> Bool)((TRANSNT : (((W) -> Bool, (W, W) -> Bool)) -> Bool), p)"), t60))
}

///|
let gl_transnt_valid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_TRANSNT_VALID")

///|
/// `GL_TRANSNT_VALID`
pub fn gl_transnt_valid() -> @kernel.Thm {
  gl_transnt_valid_c.get()
}

///|
/// ITF
fn step_22() -> Unit raise {
  itf_c.set(@pair.new_definition(@term_syntax.parse_term("(ITF : (((W) -> Bool, (W, W) -> Bool)) -> Bool)(((W : (W) -> Bool), (R : (W, W) -> Bool))) == (!(W == {}) && (∀ x : W, ∀ y : W, R(x, y) → IN(x, W) && IN(y, W)) && FINITE(W) && (∀ x : W, IN(x, W) → !R(x, x)) && (∀ x : W, ∀ y : W, ∀ z : W, IN(x, W) && IN(y, W) && IN(z, W) && R(x, y) && R(y, z) → R(x, z)))")))
}

///|
let itf_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITF")

///|
/// `ITF`
pub fn itf() -> @kernel.Thm {
  itf_c.get()
}

///|
/// ITF_NT
fn step_23() -> Unit raise {
  let t69 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t68 = @simp.asm_rewrite_tac(@list.List([]))
  let t67 = @tactics.exists_tac(@term_syntax.parse_term("(W : (W) -> Bool)"))
  let t66 = @tactics.match_mp_tac(@sets.finite_subset())
  let t65 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t64 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t63 = @tactics.match_mp_tac(@sets.wf_finite())
  let t62 = @simp.asm_rewrite_tac(@list.List([@modal.transnt()]))
  let t61 = @simp.rewrite_tac(@list.List([itf()]))
  let t70 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t61), @tactics.strip_tac), t62), t63), @tactics.conj_tac), t64), @tactics.conj_tac), t65), @tactics.gen_tac), t66), t67), t68), t69)
  itf_nt_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, ITF((W, R)) → TRANSNT((W, R))"), t70))
}

///|
let itf_nt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITF_NT")

///|
/// `ITF_NT`
pub fn itf_nt() -> @kernel.Thm {
  itf_nt_c.get()
}

///|
/// GL_ITF_VALID
fn step_24() -> Unit raise {
  let t75 = @meson.meson_tac(@list.List([itf_nt()]))
  let t76 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@modal.valid(), @pair.forall_pair_thm()])), t75)
  let t77 = @list.List([@simp.asm_simp_tac(@list.List([gl_transnt_valid()])), t76])
  let t74 = @tactics.subgoal_then(@term_syntax.parse_term("(op_bar_eq : ((((W) -> Bool, (W, W) -> Bool)) -> Bool, Form) -> Bool)((TRANSNT : (((W) -> Bool, (W, W) -> Bool)) -> Bool), (p : Form))"), fn(x71 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s72 = @tactics.mp_tac(x71)
    fn(x73 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s72(x73)
    }
  })
  let t78 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t74), t77)
  gl_itf_valid_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(p) → (op_bar_eq : ((((W) -> Bool, (W, W) -> Bool)) -> Bool, Form) -> Bool)((ITF : (((W) -> Bool, (W, W) -> Bool)) -> Bool), p)"), t78))
}

///|
let gl_itf_valid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_ITF_VALID")

///|
/// `GL_ITF_VALID`
pub fn gl_itf_valid() -> @kernel.Thm {
  gl_itf_valid_c.get()
}

///|
/// GL_consistent
fn step_25() -> Unit raise {
  let t92 = @meson.meson_tac(@list.List([]))
  let t91 = @simp.rewrite_tac(@list.List([@sets.not_insert_empty(), @sets.finite_sing(), @sets.in_sing()]))
  let t89 = @term_syntax.parse_term("(x : Num) => (y : Num) => false")
  let t90 = @tactics.map_every(fn(x86 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s87 = @tactics.exists_tac(x86)
    fn(x88 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s87(x88)
    }
  }, @list.List([@term_syntax.parse_term("{0}"), t89]))
  let t85 = @simp.rewrite_tac(@list.List([@modal.valid(), @modal.holds(), @modal.holds_in(), @pair.forall_pair_thm(), itf(), @class.not_forall_thm()]))
  let t82 = @term_syntax.parse_type("W")
  let t83 = @drule.match_mp(@kernel.inst_type(@list.List([(@term_syntax.parse_type("Num"), t82)]), gl_itf_valid()))
  let t93 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.refute_then(fn(x84 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s80 = @tactics.mp_tac(x79)
      fn(x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s80(x81)
      }
    })(t83(x84))
  }), t85), t90), t91), t92)
  gl_consistent_c.set(@tactics.prove(@term_syntax.parse_term("!op_bar_minus_minus(False)"), t93))
}

///|
let gl_consistent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_consistent")

///|
/// `GL_consistent`
pub fn gl_consistent() -> @kernel.Thm {
  gl_consistent_c.get()
}

///|
/// GL_iff_imp1
fn step_26() -> Unit raise {
  let t94 = @meson.meson_tac(@list.List([gl_modusponens(), gl_axiom_iffimp1()]))
  gl_iff_imp1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(p, q)) → op_bar_minus_minus(op_minus_minus_gt(p, q))"), t94))
}

///|
let gl_iff_imp1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_imp1")

///|
/// `GL_iff_imp1`
pub fn gl_iff_imp1() -> @kernel.Thm {
  gl_iff_imp1_c.get()
}

///|
/// GL_iff_imp2
fn step_27() -> Unit raise {
  let t95 = @meson.meson_tac(@list.List([gl_modusponens(), gl_axiom_iffimp2()]))
  gl_iff_imp2_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(p, q)) → op_bar_minus_minus(op_minus_minus_gt(q, p))"), t95))
}

///|
let gl_iff_imp2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_imp2")

///|
/// `GL_iff_imp2`
pub fn gl_iff_imp2() -> @kernel.Thm {
  gl_iff_imp2_c.get()
}

///|
/// GL_imp_antisym
fn step_28() -> Unit raise {
  let t96 = @meson.meson_tac(@list.List([gl_modusponens(), gl_axiom_impiff()]))
  gl_imp_antisym_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(p, q)) && op_bar_minus_minus(op_minus_minus_gt(q, p)) → op_bar_minus_minus(op_lt_minus_gt(p, q))"), t96))
}

///|
let gl_imp_antisym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_antisym")

///|
/// `GL_imp_antisym`
pub fn gl_imp_antisym() -> @kernel.Thm {
  gl_imp_antisym_c.get()
}

///|
/// GL_add_assum
fn step_29() -> Unit raise {
  let t97 = @meson.meson_tac(@list.List([gl_modusponens(), gl_axiom_addimp()]))
  gl_add_assum_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(q) → op_bar_minus_minus(op_minus_minus_gt(p, q))"), t97))
}

///|
let gl_add_assum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_add_assum")

///|
/// `GL_add_assum`
pub fn gl_add_assum() -> @kernel.Thm {
  gl_add_assum_c.get()
}

///|
/// GL_imp_refl_th
fn step_30() -> Unit raise {
  let t98 = @meson.meson_tac(@list.List([gl_modusponens(), gl_axiom_distribimp(), gl_axiom_addimp()]))
  gl_imp_refl_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(p, p))"), t98))
}

///|
let gl_imp_refl_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_refl_th")

///|
/// `GL_imp_refl_th`
pub fn gl_imp_refl_th() -> @kernel.Thm {
  gl_imp_refl_th_c.get()
}

///|
/// GL_imp_add_assum
fn step_31() -> Unit raise {
  let t99 = @meson.meson_tac(@list.List([gl_modusponens(), gl_axiom_distribimp(), gl_add_assum()]))
  gl_imp_add_assum_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(q, r)) → op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p, r)))"), t99))
}

///|
let gl_imp_add_assum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_add_assum")

///|
/// `GL_imp_add_assum`
pub fn gl_imp_add_assum() -> @kernel.Thm {
  gl_imp_add_assum_c.get()
}

///|
/// GL_imp_unduplicate
fn step_32() -> Unit raise {
  let t100 = @meson.meson_tac(@list.List([gl_modusponens(), gl_axiom_distribimp(), gl_imp_refl_th()]))
  gl_imp_unduplicate_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(p, op_minus_minus_gt(p, q))) → op_bar_minus_minus(op_minus_minus_gt(p, q))"), t100))
}

///|
let gl_imp_unduplicate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_unduplicate")

///|
/// `GL_imp_unduplicate`
pub fn gl_imp_unduplicate() -> @kernel.Thm {
  gl_imp_unduplicate_c.get()
}

///|
/// GL_imp_trans
fn step_33() -> Unit raise {
  let t101 = @meson.meson_tac(@list.List([gl_modusponens(), gl_imp_add_assum()]))
  gl_imp_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(p, q)) && op_bar_minus_minus(op_minus_minus_gt(q, (r : Form))) → op_bar_minus_minus(op_minus_minus_gt(p, r))"), t101))
}

///|
let gl_imp_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_trans")

///|
/// `GL_imp_trans`
pub fn gl_imp_trans() -> @kernel.Thm {
  gl_imp_trans_c.get()
}

///|
/// GL_imp_swap
fn step_34() -> Unit raise {
  let t102 = @meson.meson_tac(@list.List([gl_imp_trans(), gl_axiom_addimp(), gl_modusponens(), gl_axiom_distribimp()]))
  gl_imp_swap_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(p, op_minus_minus_gt(q, r))) → op_bar_minus_minus(op_minus_minus_gt(q, op_minus_minus_gt(p, r)))"), t102))
}

///|
let gl_imp_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_swap")

///|
/// `GL_imp_swap`
pub fn gl_imp_swap() -> @kernel.Thm {
  gl_imp_swap_c.get()
}

///|
/// GL_imp_trans_chain_2
fn step_35() -> Unit raise {
  let t103 = @meson.asm_meson_tac(@list.List([gl_imp_trans(), gl_imp_swap(), gl_imp_unduplicate()]))
  gl_imp_trans_chain_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q1 : Form, ∀ q2 : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(p, q1)) && op_bar_minus_minus(op_minus_minus_gt(p, q2)) && op_bar_minus_minus(op_minus_minus_gt(q1, op_minus_minus_gt(q2, r))) → op_bar_minus_minus(op_minus_minus_gt(p, r))"), t103))
}

///|
let gl_imp_trans_chain_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_trans_chain_2")

///|
/// `GL_imp_trans_chain_2`
pub fn gl_imp_trans_chain_2() -> @kernel.Thm {
  gl_imp_trans_chain_2_c.get()
}

///|
/// GL_imp_trans_th
fn step_36() -> Unit raise {
  let t104 = @meson.meson_tac(@list.List([gl_imp_trans(), gl_axiom_addimp(), gl_axiom_distribimp()]))
  gl_imp_trans_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(q, r), op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p, r))))"), t104))
}

///|
let gl_imp_trans_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_trans_th")

///|
/// `GL_imp_trans_th`
pub fn gl_imp_trans_th() -> @kernel.Thm {
  gl_imp_trans_th_c.get()
}

///|
/// GLimp_add_concl
fn step_37() -> Unit raise {
  let t105 = @meson.meson_tac(@list.List([gl_modusponens(), gl_imp_swap(), gl_imp_trans_th()]))
  glimp_add_concl_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(p, q)) → op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(q, r), op_minus_minus_gt(p, r)))"), t105))
}

///|
let glimp_add_concl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GLimp_add_concl")

///|
/// `GLimp_add_concl`
pub fn glimp_add_concl() -> @kernel.Thm {
  glimp_add_concl_c.get()
}

///|
/// GL_imp_trans2
fn step_38() -> Unit raise {
  let t106 = @meson.meson_tac(@list.List([gl_imp_add_assum(), gl_modusponens(), gl_imp_trans_th()]))
  gl_imp_trans2_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, ∀ s : Form, op_bar_minus_minus(op_minus_minus_gt(p, op_minus_minus_gt(q, r))) && op_bar_minus_minus(op_minus_minus_gt(r, s)) → op_bar_minus_minus(op_minus_minus_gt(p, op_minus_minus_gt(q, s)))"), t106))
}

///|
let gl_imp_trans2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_trans2")

///|
/// `GL_imp_trans2`
pub fn gl_imp_trans2() -> @kernel.Thm {
  gl_imp_trans2_c.get()
}

///|
/// GL_imp_swap_th
fn step_39() -> Unit raise {
  let t107 = @meson.meson_tac(@list.List([gl_imp_trans(), gl_axiom_distribimp(), glimp_add_concl(), gl_axiom_addimp()]))
  gl_imp_swap_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, op_minus_minus_gt(q, r)), op_minus_minus_gt(q, op_minus_minus_gt(p, r))))"), t107))
}

///|
let gl_imp_swap_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_swap_th")

///|
/// `GL_imp_swap_th`
pub fn gl_imp_swap_th() -> @kernel.Thm {
  gl_imp_swap_th_c.get()
}

///|
/// GL_contrapos
fn step_40() -> Unit raise {
  let t108 = @meson.meson_tac(@list.List([gl_imp_trans(), gl_iff_imp1(), gl_axiom_not(), glimp_add_concl(), gl_iff_imp2()]))
  gl_contrapos_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(p, q)) → op_bar_minus_minus(op_minus_minus_gt(Not(q), Not(p)))"), t108))
}

///|
let gl_contrapos_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_contrapos")

///|
/// `GL_contrapos`
pub fn gl_contrapos() -> @kernel.Thm {
  gl_contrapos_c.get()
}

///|
/// GL_imp_truefalse_th
fn step_41() -> Unit raise {
  let t109 = @meson.meson_tac(@list.List([gl_imp_trans(), gl_imp_trans_th(), gl_imp_swap_th()]))
  gl_imp_truefalse_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(q, False), op_minus_minus_gt(p, op_minus_minus_gt(op_minus_minus_gt(p, q), False))))"), t109))
}

///|
let gl_imp_truefalse_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_truefalse_th")

///|
/// `GL_imp_truefalse_th`
pub fn gl_imp_truefalse_th() -> @kernel.Thm {
  gl_imp_truefalse_th_c.get()
}

///|
/// GL_imp_insert
fn step_42() -> Unit raise {
  let t110 = @meson.meson_tac(@list.List([gl_imp_trans(), gl_axiom_addimp()]))
  gl_imp_insert_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(p, r)) → op_bar_minus_minus(op_minus_minus_gt(p, op_minus_minus_gt(q, r)))"), t110))
}

///|
let gl_imp_insert_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_insert")

///|
/// `GL_imp_insert`
pub fn gl_imp_insert() -> @kernel.Thm {
  gl_imp_insert_c.get()
}

///|
/// GL_imp_mono_th
fn step_43() -> Unit raise {
  let t111 = @meson.meson_tac(@list.List([gl_imp_trans(), gl_imp_swap(), gl_imp_trans_th()]))
  gl_imp_mono_th_v1_c.set(@tactics.prove(@term_syntax.parse_term("op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt((p' : Form), (p : Form)), op_minus_minus_gt(op_minus_minus_gt((q : Form), (q' : Form)), op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p', q')))))"), t111))
}

///|
let gl_imp_mono_th_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_mono_th")

///|
/// `GL_imp_mono_th`
pub fn gl_imp_mono_th_v1() -> @kernel.Thm {
  gl_imp_mono_th_v1_c.get()
}

///|
/// GL_ex_falso_th
fn step_44() -> Unit raise {
  let t112 = @meson.meson_tac(@list.List([gl_imp_trans(), gl_axiom_addimp(), gl_axiom_doubleneg()]))
  gl_ex_falso_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(False, p))"), t112))
}

///|
let gl_ex_falso_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_ex_falso_th")

///|
/// `GL_ex_falso_th`
pub fn gl_ex_falso_th() -> @kernel.Thm {
  gl_ex_falso_th_c.get()
}

///|
/// GL_ex_falso
fn step_45() -> Unit raise {
  let t113 = @meson.meson_tac(@list.List([gl_ex_falso_th(), gl_modusponens()]))
  gl_ex_falso_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(False) → op_bar_minus_minus(p)"), t113))
}

///|
let gl_ex_falso_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_ex_falso")

///|
/// `GL_ex_falso`
pub fn gl_ex_falso() -> @kernel.Thm {
  gl_ex_falso_c.get()
}

///|
/// GL_imp_contr_th
fn step_46() -> Unit raise {
  let t114 = @meson.meson_tac(@list.List([gl_imp_add_assum(), gl_ex_falso_th()]))
  gl_imp_contr_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, False), op_minus_minus_gt(p, q)))"), t114))
}

///|
let gl_imp_contr_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_contr_th")

///|
/// `GL_imp_contr_th`
pub fn gl_imp_contr_th() -> @kernel.Thm {
  gl_imp_contr_th_c.get()
}

///|
/// GL_contrad
fn step_47() -> Unit raise {
  let t115 = @meson.meson_tac(@list.List([gl_modusponens(), gl_axiom_distribimp(), gl_imp_refl_th(), gl_axiom_doubleneg()]))
  gl_contrad_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, False), p)) → op_bar_minus_minus(p)"), t115))
}

///|
let gl_contrad_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_contrad")

///|
/// `GL_contrad`
pub fn gl_contrad() -> @kernel.Thm {
  gl_contrad_c.get()
}

///|
/// GL_bool_cases
fn step_48() -> Unit raise {
  let t116 = @meson.meson_tac(@list.List([gl_contrad(), gl_imp_trans(), glimp_add_concl()]))
  gl_bool_cases_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(p, q)) && op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, False), q)) → op_bar_minus_minus(q)"), t116))
}

///|
let gl_bool_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_bool_cases")

///|
/// `GL_bool_cases`
pub fn gl_bool_cases() -> @kernel.Thm {
  gl_bool_cases_c.get()
}

///|
/// GL_imp_false_rule
fn step_49() -> Unit raise {
  let t117 = @meson.meson_tac(@list.List([glimp_add_concl(), gl_imp_add_assum(), gl_ex_falso_th(), gl_axiom_addimp(), gl_imp_swap(), gl_imp_trans(), gl_axiom_doubleneg(), gl_imp_unduplicate()]))
  gl_imp_false_rule_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(q, False), op_minus_minus_gt(p, r))) → op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(op_minus_minus_gt(p, q), False), r))"), t117))
}

///|
let gl_imp_false_rule_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_false_rule")

///|
/// `GL_imp_false_rule`
pub fn gl_imp_false_rule() -> @kernel.Thm {
  gl_imp_false_rule_c.get()
}

///|
/// GL_imp_true_rule
fn step_50() -> Unit raise {
  let t118 = @meson.meson_tac(@list.List([gl_imp_insert(), gl_imp_swap(), gl_modusponens(), gl_imp_trans_th(), gl_bool_cases()]))
  gl_imp_true_rule_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, False), r)) && op_bar_minus_minus(op_minus_minus_gt(q, r)) → op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, q), r))"), t118))
}

///|
let gl_imp_true_rule_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_true_rule")

///|
/// `GL_imp_true_rule`
pub fn gl_imp_true_rule() -> @kernel.Thm {
  gl_imp_true_rule_c.get()
}

///|
/// GL_truth_th
fn step_51() -> Unit raise {
  let t119 = @meson.meson_tac(@list.List([gl_modusponens(), gl_axiom_true(), gl_imp_refl_th(), gl_iff_imp2()]))
  gl_truth_th_c.set(@tactics.prove(@term_syntax.parse_term("op_bar_minus_minus(True)"), t119))
}

///|
let gl_truth_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_truth_th")

///|
/// `GL_truth_th`
pub fn gl_truth_th() -> @kernel.Thm {
  gl_truth_th_c.get()
}

///|
/// GL_and_left_th
fn step_52() -> Unit raise {
  let t120 = @meson.meson_tac(@list.List([gl_imp_add_assum(), gl_axiom_addimp(), gl_imp_trans(), glimp_add_concl(), gl_axiom_doubleneg(), gl_imp_trans(), gl_iff_imp1(), gl_axiom_and()]))
  gl_and_left_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_amp_amp(p, q), p))"), t120))
}

///|
let gl_and_left_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_left_th")

///|
/// `GL_and_left_th`
pub fn gl_and_left_th() -> @kernel.Thm {
  gl_and_left_th_c.get()
}

///|
/// GL_and_right_th
fn step_53() -> Unit raise {
  let t121 = @meson.meson_tac(@list.List([gl_axiom_addimp(), gl_imp_trans(), glimp_add_concl(), gl_axiom_doubleneg(), gl_iff_imp1(), gl_axiom_and()]))
  gl_and_right_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_amp_amp(p, q), q))"), t121))
}

///|
let gl_and_right_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_right_th")

///|
/// `GL_and_right_th`
pub fn gl_and_right_th() -> @kernel.Thm {
  gl_and_right_th_c.get()
}

///|
/// GL_and_pair_th
fn step_54() -> Unit raise {
  let t122 = @meson.meson_tac(@list.List([gl_iff_imp2(), gl_axiom_and(), gl_imp_swap_th(), gl_imp_add_assum(), gl_imp_trans2(), gl_modusponens(), gl_imp_swap(), gl_imp_refl_th()]))
  gl_and_pair_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(p, op_minus_minus_gt(q, op_amp_amp(p, q))))"), t122))
}

///|
let gl_and_pair_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_pair_th")

///|
/// `GL_and_pair_th`
pub fn gl_and_pair_th() -> @kernel.Thm {
  gl_and_pair_th_c.get()
}

///|
/// GL_and
fn step_55() -> Unit raise {
  let t123 = @meson.meson_tac(@list.List([gl_and_left_th(), gl_and_right_th(), gl_and_pair_th(), gl_modusponens()]))
  gl_and_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_amp_amp(p, q)) == (op_bar_minus_minus(p) && op_bar_minus_minus(q))"), t123))
}

///|
let gl_and_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and")

///|
/// `GL_and`
pub fn gl_and() -> @kernel.Thm {
  gl_and_c.get()
}

///|
/// GL_and_elim
fn step_56() -> Unit raise {
  let t124 = @meson.meson_tac(@list.List([gl_and_left_th(), gl_and_right_th(), gl_imp_trans()]))
  gl_and_elim_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(r, op_amp_amp(p, q))) → op_bar_minus_minus(op_minus_minus_gt(r, q)) && op_bar_minus_minus(op_minus_minus_gt(r, p))"), t124))
}

///|
let gl_and_elim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_elim")

///|
/// `GL_and_elim`
pub fn gl_and_elim() -> @kernel.Thm {
  gl_and_elim_c.get()
}

///|
/// GL_shunt
fn step_57() -> Unit raise {
  let t125 = @meson.meson_tac(@list.List([gl_modusponens(), gl_imp_add_assum(), gl_and_pair_th()]))
  gl_shunt_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(op_amp_amp(p, q), r)) → op_bar_minus_minus(op_minus_minus_gt(p, op_minus_minus_gt(q, r)))"), t125))
}

///|
let gl_shunt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_shunt")

///|
/// `GL_shunt`
pub fn gl_shunt() -> @kernel.Thm {
  gl_shunt_c.get()
}

///|
/// GL_ante_conj
fn step_58() -> Unit raise {
  let t126 = @meson.meson_tac(@list.List([gl_imp_trans_chain_2(), gl_and_left_th(), gl_and_right_th()]))
  gl_ante_conj_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(p, op_minus_minus_gt(q, r))) → op_bar_minus_minus(op_minus_minus_gt(op_amp_amp(p, q), r))"), t126))
}

///|
let gl_ante_conj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_ante_conj")

///|
/// `GL_ante_conj`
pub fn gl_ante_conj() -> @kernel.Thm {
  gl_ante_conj_c.get()
}

///|
/// GL_modusponens_th
fn step_59() -> Unit raise {
  let t127 = @meson.meson_tac(@list.List([gl_imp_refl_th(), gl_ante_conj()]))
  gl_modusponens_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_amp_amp(op_minus_minus_gt(p, q), p), q))"), t127))
}

///|
let gl_modusponens_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_modusponens_th")

///|
/// `GL_modusponens_th`
pub fn gl_modusponens_th() -> @kernel.Thm {
  gl_modusponens_th_c.get()
}

///|
/// GL_not_not_false_th
fn step_60() -> Unit raise {
  let t128 = @meson.meson_tac(@list.List([gl_imp_antisym(), gl_axiom_doubleneg(), gl_imp_swap(), gl_imp_refl_th()]))
  gl_not_not_false_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(op_minus_minus_gt(op_minus_minus_gt(p, False), False), p))"), t128))
}

///|
let gl_not_not_false_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_not_not_false_th")

///|
/// `GL_not_not_false_th`
pub fn gl_not_not_false_th() -> @kernel.Thm {
  gl_not_not_false_th_c.get()
}

///|
/// GL_iff_sym
fn step_61() -> Unit raise {
  let t129 = @meson.meson_tac(@list.List([gl_iff_imp1(), gl_iff_imp2(), gl_imp_antisym()]))
  gl_iff_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(p, q)) == op_bar_minus_minus(op_lt_minus_gt(q, p))"), t129))
}

///|
let gl_iff_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_sym")

///|
/// `GL_iff_sym`
pub fn gl_iff_sym() -> @kernel.Thm {
  gl_iff_sym_c.get()
}

///|
/// GL_iff_trans
fn step_62() -> Unit raise {
  let t130 = @meson.meson_tac(@list.List([gl_iff_imp1(), gl_iff_imp2(), gl_imp_trans(), gl_imp_antisym()]))
  gl_iff_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_lt_minus_gt(p, q)) && op_bar_minus_minus(op_lt_minus_gt(q, r)) → op_bar_minus_minus(op_lt_minus_gt(p, r))"), t130))
}

///|
let gl_iff_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_trans")

///|
/// `GL_iff_trans`
pub fn gl_iff_trans() -> @kernel.Thm {
  gl_iff_trans_c.get()
}

///|
/// GL_not_not_th
fn step_63() -> Unit raise {
  let t131 = @meson.meson_tac(@list.List([gl_iff_trans(), gl_not_not_false_th(), gl_axiom_not(), gl_imp_antisym(), glimp_add_concl(), gl_iff_imp1(), gl_iff_imp2()]))
  gl_not_not_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(Not(Not(p)), p))"), t131))
}

///|
let gl_not_not_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_not_not_th")

///|
/// `GL_not_not_th`
pub fn gl_not_not_th() -> @kernel.Thm {
  gl_not_not_th_c.get()
}

///|
/// GL_contrapos_eq
fn step_64() -> Unit raise {
  let t132 = @meson.meson_tac(@list.List([gl_contrapos(), gl_not_not_th(), gl_iff_imp1(), gl_iff_imp2(), gl_imp_trans()]))
  gl_contrapos_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(Not(p), Not(q))) == op_bar_minus_minus(op_minus_minus_gt(q, p))"), t132))
}

///|
let gl_contrapos_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_contrapos_eq")

///|
/// `GL_contrapos_eq`
pub fn gl_contrapos_eq() -> @kernel.Thm {
  gl_contrapos_eq_c.get()
}

///|
/// GL_or_left_th
fn step_65() -> Unit raise {
  let t133 = @meson.meson_tac(@list.List([gl_imp_trans(), gl_not_not_th(), gl_iff_imp2(), gl_and_right_th(), gl_contrapos(), gl_axiom_or()]))
  gl_or_left_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(q, op_bar_bar(p, q)))"), t133))
}

///|
let gl_or_left_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_left_th")

///|
/// `GL_or_left_th`
pub fn gl_or_left_th() -> @kernel.Thm {
  gl_or_left_th_c.get()
}

///|
/// GL_or_right_th
fn step_66() -> Unit raise {
  let t134 = @meson.meson_tac(@list.List([gl_imp_trans(), gl_not_not_th(), gl_iff_imp2(), gl_and_left_th(), gl_contrapos(), gl_axiom_or()]))
  gl_or_right_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(p, op_bar_bar(p, q)))"), t134))
}

///|
let gl_or_right_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_right_th")

///|
/// `GL_or_right_th`
pub fn gl_or_right_th() -> @kernel.Thm {
  gl_or_right_th_c.get()
}

///|
/// GL_ante_disj
fn step_67() -> Unit raise {
  let t136 = @meson.meson_tac(@list.List([gl_imp_trans(), gl_imp_trans_chain_2(), gl_and_pair_th(), gl_contrapos_eq(), gl_not_not_th(), gl_axiom_or(), gl_iff_imp1(), gl_iff_imp2(), gl_imp_trans()]))
  let t135 = @simp.once_rewrite_tac(@list.List([@equal.gsym(gl_contrapos_eq())]))
  let t137 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t135), t136)
  gl_ante_disj_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(p, r)) && op_bar_minus_minus(op_minus_minus_gt(q, r)) → op_bar_minus_minus(op_minus_minus_gt(op_bar_bar(p, q), r))"), t137))
}

///|
let gl_ante_disj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_ante_disj")

///|
/// `GL_ante_disj`
pub fn gl_ante_disj() -> @kernel.Thm {
  gl_ante_disj_c.get()
}

///|
/// GL_iff_def_th
fn step_68() -> Unit raise {
  let t138 = @meson.meson_tac(@list.List([gl_imp_antisym(), gl_imp_trans_chain_2(), gl_axiom_iffimp1(), gl_axiom_iffimp2(), gl_and_pair_th(), gl_axiom_impiff(), gl_imp_trans_chain_2(), gl_and_left_th(), gl_and_right_th()]))
  gl_iff_def_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(op_lt_minus_gt(p, q), op_amp_amp(op_minus_minus_gt(p, q), op_minus_minus_gt(q, p))))"), t138))
}

///|
let gl_iff_def_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_def_th")

///|
/// `GL_iff_def_th`
pub fn gl_iff_def_th() -> @kernel.Thm {
  gl_iff_def_th_c.get()
}

///|
/// GL_iff_refl_th
fn step_69() -> Unit raise {
  let t139 = @meson.meson_tac(@list.List([gl_imp_antisym(), gl_imp_refl_th()]))
  gl_iff_refl_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(p, p))"), t139))
}

///|
let gl_iff_refl_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_refl_th")

///|
/// `GL_iff_refl_th`
pub fn gl_iff_refl_th() -> @kernel.Thm {
  gl_iff_refl_th_c.get()
}

///|
/// GL_imp_box
fn step_70() -> Unit raise {
  let t140 = @meson.meson_tac(@list.List([gl_modusponens(), gl_necessitation(), gl_axiom_boximp()]))
  gl_imp_box_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(p, q)) → op_bar_minus_minus(op_minus_minus_gt(Box(p), Box(q)))"), t140))
}

///|
let gl_imp_box_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_box")

///|
/// `GL_imp_box`
pub fn gl_imp_box() -> @kernel.Thm {
  gl_imp_box_c.get()
}

///|
/// GL_box_moduspones
fn step_71() -> Unit raise {
  let t141 = @meson.meson_tac(@list.List([gl_imp_box(), gl_modusponens()]))
  gl_box_moduspones_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(p, q)) && op_bar_minus_minus(Box(p)) → op_bar_minus_minus(Box(q))"), t141))
}

///|
let gl_box_moduspones_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_box_moduspones")

///|
/// `GL_box_moduspones`
pub fn gl_box_moduspones() -> @kernel.Thm {
  gl_box_moduspones_c.get()
}

///|
/// GL_box_and
fn step_72() -> Unit raise {
  let t142 = @meson.meson_tac(@list.List([gl_and_left_th(), gl_and_right_th(), gl_imp_box(), gl_box_moduspones(), gl_and()]))
  gl_box_and_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(Box(op_amp_amp(p, q))) → op_bar_minus_minus(op_amp_amp(Box(p), Box(q)))"), t142))
}

///|
let gl_box_and_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_box_and")

///|
/// `GL_box_and`
pub fn gl_box_and() -> @kernel.Thm {
  gl_box_and_c.get()
}

///|
/// GL_box_and_inv
fn step_73() -> Unit raise {
  let t143 = @meson.meson_tac(@list.List([gl_and_pair_th(), gl_imp_box(), gl_axiom_boximp(), gl_imp_trans(), gl_ante_conj(), gl_modusponens()]))
  gl_box_and_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_amp_amp(Box(p), Box(q))) → op_bar_minus_minus(Box(op_amp_amp(p, q)))"), t143))
}

///|
let gl_box_and_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_box_and_inv")

///|
/// `GL_box_and_inv`
pub fn gl_box_and_inv() -> @kernel.Thm {
  gl_box_and_inv_c.get()
}

///|
/// GL_and_comm
fn step_74() -> Unit raise {
  let t144 = @meson.meson_tac(@list.List([gl_and()]))
  gl_and_comm_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_amp_amp(p, q)) == op_bar_minus_minus(op_amp_amp(q, p))"), t144))
}

///|
let gl_and_comm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_comm")

///|
/// `GL_and_comm`
pub fn gl_and_comm() -> @kernel.Thm {
  gl_and_comm_c.get()
}

///|
/// GL_and_assoc
fn step_75() -> Unit raise {
  let t145 = @meson.meson_tac(@list.List([gl_and()]))
  gl_and_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_amp_amp(op_amp_amp(p, q), r)) == op_bar_minus_minus(op_amp_amp(p, op_amp_amp(q, r)))"), t145))
}

///|
let gl_and_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_assoc")

///|
/// `GL_and_assoc`
pub fn gl_and_assoc() -> @kernel.Thm {
  gl_and_assoc_c.get()
}

///|
/// GL_disj_imp
fn step_76() -> Unit raise {
  let t146 = @meson.meson_tac(@list.List([gl_ante_disj(), gl_or_right_th(), gl_or_left_th(), gl_imp_trans()]))
  gl_disj_imp_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(op_bar_bar(p, q), r)) == (op_bar_minus_minus(op_minus_minus_gt(p, r)) && op_bar_minus_minus(op_minus_minus_gt(q, r)))"), t146))
}

///|
let gl_disj_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_disj_imp")

///|
/// `GL_disj_imp`
pub fn gl_disj_imp() -> @kernel.Thm {
  gl_disj_imp_c.get()
}

///|
/// GL_or_elim
fn step_77() -> Unit raise {
  let t147 = @meson.meson_tac(@list.List([gl_disj_imp(), gl_modusponens()]))
  gl_or_elim_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_bar_bar(p, q)) && op_bar_minus_minus(op_minus_minus_gt(p, r)) && op_bar_minus_minus(op_minus_minus_gt(q, r)) → op_bar_minus_minus(r)"), t147))
}

///|
let gl_or_elim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_elim")

///|
/// `GL_or_elim`
pub fn gl_or_elim() -> @kernel.Thm {
  gl_or_elim_c.get()
}

///|
/// GL_or_comm
fn step_78() -> Unit raise {
  let t148 = @meson.meson_tac(@list.List([gl_or_right_th(), gl_or_left_th(), gl_modusponens(), gl_disj_imp()]))
  gl_or_comm_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_bar_bar(p, q)) == op_bar_minus_minus(op_bar_bar(q, p))"), t148))
}

///|
let gl_or_comm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_comm")

///|
/// `GL_or_comm`
pub fn gl_or_comm() -> @kernel.Thm {
  gl_or_comm_c.get()
}

///|
/// GL_or_assoc
fn step_79() -> Unit raise {
  let t149 = @meson.meson_tac(@list.List([gl_or_right_th(), gl_or_left_th(), gl_modusponens(), gl_disj_imp()]))
  gl_or_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_bar_bar(op_bar_bar(p, q), r)) == op_bar_minus_minus(op_bar_bar(p, op_bar_bar(q, r)))"), t149))
}

///|
let gl_or_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_assoc")

///|
/// `GL_or_assoc`
pub fn gl_or_assoc() -> @kernel.Thm {
  gl_or_assoc_c.get()
}

///|
/// GL_or_intror
fn step_80() -> Unit raise {
  let t150 = @meson.meson_tac(@list.List([gl_or_left_th(), gl_modusponens()]))
  gl_or_intror_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(q) → op_bar_minus_minus(op_bar_bar(p, q))"), t150))
}

///|
let gl_or_intror_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_intror")

///|
/// `GL_or_intror`
pub fn gl_or_intror() -> @kernel.Thm {
  gl_or_intror_c.get()
}

///|
/// GL_or_introl
fn step_81() -> Unit raise {
  let t151 = @meson.meson_tac(@list.List([gl_or_right_th(), gl_modusponens()]))
  gl_or_introl_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(p) → op_bar_minus_minus(op_bar_bar(p, q))"), t151))
}

///|
let gl_or_introl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_introl")

///|
/// `GL_or_introl`
pub fn gl_or_introl() -> @kernel.Thm {
  gl_or_introl_c.get()
}

///|
/// GL_or_transl
fn step_82() -> Unit raise {
  let t152 = @meson.meson_tac(@list.List([gl_or_right_th(), gl_imp_trans()]))
  gl_or_transl_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(p, q)) → op_bar_minus_minus(op_minus_minus_gt(p, op_bar_bar(q, r)))"), t152))
}

///|
let gl_or_transl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_transl")

///|
/// `GL_or_transl`
pub fn gl_or_transl() -> @kernel.Thm {
  gl_or_transl_c.get()
}

///|
/// GL_or_transr
fn step_83() -> Unit raise {
  let t153 = @meson.meson_tac(@list.List([gl_or_left_th(), gl_imp_trans()]))
  gl_or_transr_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(p, r)) → op_bar_minus_minus(op_minus_minus_gt(p, op_bar_bar(q, r)))"), t153))
}

///|
let gl_or_transr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_transr")

///|
/// `GL_or_transr`
pub fn gl_or_transr() -> @kernel.Thm {
  gl_or_transr_c.get()
}

///|
/// GL_frege
fn step_84() -> Unit raise {
  let t154 = @meson.meson_tac(@list.List([gl_axiom_distribimp(), gl_modusponens(), gl_shunt(), gl_ante_conj()]))
  gl_frege_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(p, op_minus_minus_gt(q, r))) && op_bar_minus_minus(op_minus_minus_gt(p, q)) → op_bar_minus_minus(op_minus_minus_gt(p, r))"), t154))
}

///|
let gl_frege_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_frege")

///|
/// `GL_frege`
pub fn gl_frege() -> @kernel.Thm {
  gl_frege_c.get()
}

///|
/// GL_and_intro
fn step_85() -> Unit raise {
  let t155 = @meson.meson_tac(@list.List([gl_and_pair_th(), gl_imp_trans_chain_2()]))
  gl_and_intro_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(p, q)) && op_bar_minus_minus(op_minus_minus_gt(p, r)) → op_bar_minus_minus(op_minus_minus_gt(p, op_amp_amp(q, r)))"), t155))
}

///|
let gl_and_intro_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_intro")

///|
/// `GL_and_intro`
pub fn gl_and_intro() -> @kernel.Thm {
  gl_and_intro_c.get()
}

///|
/// GL_not_def
fn step_86() -> Unit raise {
  let t156 = @meson.meson_tac(@list.List([gl_axiom_not(), gl_modusponens(), gl_iff_imp1(), gl_iff_imp2()]))
  gl_not_def_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(Not(p)) == op_bar_minus_minus(op_minus_minus_gt(p, False))"), t156))
}

///|
let gl_not_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_not_def")

///|
/// `GL_not_def`
pub fn gl_not_def() -> @kernel.Thm {
  gl_not_def_c.get()
}

///|
/// GL_NC
fn step_87() -> Unit raise {
  let t157 = @meson.meson_tac(@list.List([gl_not_def(), gl_modusponens(), gl_and(), gl_ex_falso()]))
  gl_nc_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_amp_amp(p, Not(p))) == op_bar_minus_minus(False)"), t157))
}

///|
let gl_nc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_NC")

///|
/// `GL_NC`
pub fn gl_nc() -> @kernel.Thm {
  gl_nc_c.get()
}

///|
/// GL_nc_th
fn step_88() -> Unit raise {
  let t158 = @meson.meson_tac(@list.List([gl_ante_conj(), gl_imp_swap(), gl_axiom_not(), gl_axiom_iffimp1(), gl_modusponens()]))
  gl_nc_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(op_amp_amp(p, Not(p)), False))"), t158))
}

///|
let gl_nc_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_nc_th")

///|
/// `GL_nc_th`
pub fn gl_nc_th() -> @kernel.Thm {
  gl_nc_th_c.get()
}

///|
/// GL_imp_clauses
fn step_89() -> Unit raise {
  let t159 = @meson.meson_tac(@list.List([gl_add_assum()]))
  let t160 = @list.List([@meson.meson_tac(@list.List([gl_modusponens(), gl_truth_th()])), t159])
  let t161 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([gl_truth_th(), gl_add_assum(), gl_not_def(), gl_ex_falso_th()])), @tactics.gen_tac), @tactics.eq_tac), t160)
  gl_imp_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(p, True))) && (∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(p, False)) == op_bar_minus_minus(Not(p))) && (∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(True, p)) == op_bar_minus_minus(p)) && (∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(False, p)))"), t161))
}

///|
let gl_imp_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_clauses")

///|
/// `GL_imp_clauses`
pub fn gl_imp_clauses() -> @kernel.Thm {
  gl_imp_clauses_c.get()
}

///|
/// GL_and_left_true_th
fn step_90() -> Unit raise {
  let t164 = @simp.rewrite_tac(@list.List([gl_imp_refl_th(), gl_imp_clauses()]))
  let t163 = @tactics.match_mp_tac(gl_and_intro())
  let t162 = @list.List([@tactics.match_accept_tac(gl_and_right_th()), @tactics.all_tac])
  let t165 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(gl_imp_antisym())), @tactics.conj_tac), t162), t163), t164)
  gl_and_left_true_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(op_amp_amp(True, p), p))"), t165))
}

///|
let gl_and_left_true_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_left_true_th")

///|
/// `GL_and_left_true_th`
pub fn gl_and_left_true_th() -> @kernel.Thm {
  gl_and_left_true_th_c.get()
}

///|
/// GL_or_and_distr
fn step_91() -> Unit raise {
  let t176 = @simp.asm_simp_tac(@list.List([gl_add_assum()]))
  let t175 = @simp.rewrite_tac(@list.List([gl_imp_refl_th()]))
  let t174 = @tactics.match_mp_tac(gl_and_intro())
  let t177 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_or_transr()), t174), t175), t176)
  let t173 = @simp.asm_simp_tac(@list.List([gl_add_assum()]))
  let t172 = @simp.rewrite_tac(@list.List([gl_imp_refl_th()]))
  let t171 = @tactics.match_mp_tac(gl_and_intro())
  let t178 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_or_transl()), t171), t172), t173), t177])
  let t170 = @simp.asm_rewrite_tac(@list.List([]))
  let t169 = @tactics.exists_tac(@term_syntax.parse_term("(q : Form)"))
  let t168 = @tactics.exists_tac(@term_syntax.parse_term("(p : Form)"))
  let t167 = @tactics.match_mp_tac(gl_or_elim())
  let t166 = @simp.once_rewrite_tac(@list.List([gl_and()]))
  let t179 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t166), @tactics.strip_tac), t167), t168), t169), t170), @tactics.conj_tac), t178)
  gl_or_and_distr_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_amp_amp(op_bar_bar(p, q), r)) → op_bar_minus_minus(op_bar_bar(op_amp_amp(p, r), op_amp_amp(q, r)))"), t179))
}

///|
let gl_or_and_distr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_and_distr")

///|
/// `GL_or_and_distr`
pub fn gl_or_and_distr() -> @kernel.Thm {
  gl_or_and_distr_c.get()
}

///|
/// GL_and_or_distr
fn step_92() -> Unit raise {
  let t189 = @simp.asm_rewrite_tac(@list.List([gl_and_left_th(), gl_and_right_th()]))
  let t188 = @tactics.match_mp_tac(gl_or_transl())
  let t187 = @simp.asm_rewrite_tac(@list.List([gl_or_left_th()]))
  let t185 = @term_syntax.parse_term("(r : Form)")
  let t186 = @tactics.map_every(fn(x182 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s183 = @tactics.exists_tac(x182)
    fn(x184 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s183(x184)
    }
  }, @list.List([@term_syntax.parse_term("op_amp_amp((p : Form), (q : Form))"), t185]))
  let t181 = @tactics.match_mp_tac(gl_or_elim())
  let t180 = @simp.once_rewrite_tac(@list.List([gl_and()]))
  let t190 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t180), @tactics.disch_tac), @tactics.conj_tac), t181), t186), t187), t188), t189)
  gl_and_or_distr_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_bar_bar(op_amp_amp(p, q), r)) → op_bar_minus_minus(op_amp_amp(op_bar_bar(p, r), op_bar_bar(q, r)))"), t190))
}

///|
let gl_and_or_distr_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_or_distr")

///|
/// `GL_and_or_distr`
pub fn gl_and_or_distr() -> @kernel.Thm {
  gl_and_or_distr_c.get()
}

///|
/// GL_or_and_distr_inv
fn step_93() -> Unit raise {
  let t203 = @tactics.match_accept_tac(gl_and_left_th())
  let t204 = @tactics.then_tac(@tactics.match_mp_tac(gl_or_transr()), t203)
  let t202 = @tactics.match_accept_tac(gl_and_left_th())
  let t205 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(gl_or_transl()), t202), t204])
  let t201 = @simp.rewrite_tac(@list.List([gl_and_left_th(), gl_and_right_th()]))
  let t200 = @tactics.match_mp_tac(gl_and_intro())
  let t199 = @tactics.pop_assum(fn(x198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t197 = @simp.asm_rewrite_tac(@list.List([]))
  let t195 = @term_syntax.parse_term("op_amp_amp((q : Form), (r : Form))")
  let t196 = @tactics.map_every(fn(x192 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s193 = @tactics.exists_tac(x192)
    fn(x194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s193(x194)
    }
  }, @list.List([@term_syntax.parse_term("op_amp_amp((p : Form), (r : Form))"), t195]))
  let t191 = @tactics.match_mp_tac(gl_or_elim())
  let t206 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t191), t196), t197), t199), @tactics.conj_tac), t200), @tactics.conj_tac), t201), t205)
  gl_or_and_distr_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_bar_bar(op_amp_amp(p, r), op_amp_amp(q, r))) → op_bar_minus_minus(op_amp_amp(op_bar_bar(p, q), r))"), t206))
}

///|
let gl_or_and_distr_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_and_distr_inv")

///|
/// `GL_or_and_distr_inv`
pub fn gl_or_and_distr_inv() -> @kernel.Thm {
  gl_or_and_distr_inv_c.get()
}

///|
/// GL_or_and_distr_equiv
fn step_94() -> Unit raise {
  let t207 = @meson.meson_tac(@list.List([gl_or_and_distr(), gl_or_and_distr_inv()]))
  gl_or_and_distr_equiv_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_amp_amp(op_bar_bar(p, q), r)) == op_bar_minus_minus(op_bar_bar(op_amp_amp(p, r), op_amp_amp(q, r)))"), t207))
}

///|
let gl_or_and_distr_equiv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_and_distr_equiv")

///|
/// `GL_or_and_distr_equiv`
pub fn gl_or_and_distr_equiv() -> @kernel.Thm {
  gl_or_and_distr_equiv_c.get()
}

///|
/// GL_and_or_distr_inv_prelim
fn step_95() -> Unit raise {
  let t218 = @tactics.match_accept_tac(gl_or_left_th())
  let t217 = @tactics.match_mp_tac(gl_imp_insert())
  let t215 = @tactics.match_accept_tac(gl_or_right_th())
  let t216 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(gl_shunt()), t215), @tactics.all_tac])
  let t214 = @tactics.remove_then("pr", fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t212 = @simp.asm_rewrite_tac(@list.List([]))
  let t210 = @term_syntax.parse_term("(r : Form)")
  let t211 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Form)"), t210]), gl_or_elim()))
  let t209 = @theorems.intro_tac("pr qr")
  let t208 = @simp.rewrite_tac(@list.List([gl_and()]))
  let t219 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t208), t209), t211), t212), t214), @tactics.conj_tac), t216), t217), t218)
  gl_and_or_distr_inv_prelim_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_amp_amp(op_bar_bar(p, r), op_bar_bar(q, r))) → op_bar_minus_minus(op_minus_minus_gt(q, op_bar_bar(op_amp_amp(p, q), r)))"), t219))
}

///|
let gl_and_or_distr_inv_prelim_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_or_distr_inv_prelim")

///|
/// `GL_and_or_distr_inv_prelim`
pub fn gl_and_or_distr_inv_prelim() -> @kernel.Thm {
  gl_and_or_distr_inv_prelim_c.get()
}

///|
/// GL_and_or_distr_inv
fn step_96() -> Unit raise {
  let t235 = @tactics.match_accept_tac(gl_or_left_th())
  let t236 = @tactics.then_tac(@tactics.match_mp_tac(gl_imp_insert()), t235)
  let t234 = @tactics.match_accept_tac(gl_or_right_th())
  let t233 = @tactics.match_mp_tac(gl_shunt())
  let t237 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_imp_swap()), t233), t234), t236])
  let t232 = @tactics.remove_then("qr", fn(x231 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t230 = @simp.asm_rewrite_tac(@list.List([]))
  let t228 = @term_syntax.parse_term("(r : Form)")
  let t229 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(q : Form)"), t228]), gl_or_elim()))
  let t227 = @simp.rewrite_tac(@list.List([gl_or_left_th()]))
  let t226 = @tactics.remove_then("pr", fn(x225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t224 = @simp.asm_rewrite_tac(@list.List([]))
  let t222 = @term_syntax.parse_term("(r : Form)")
  let t223 = @tactics.match_mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Form)"), t222]), gl_or_elim()))
  let t221 = @theorems.intro_tac("pr qr")
  let t220 = @simp.rewrite_tac(@list.List([gl_and()]))
  let t238 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t220), t221), t223), t224), t226), t227), t229), t230), t232), @tactics.conj_tac), t237)
  gl_and_or_distr_inv_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_amp_amp(op_bar_bar(p, r), op_bar_bar(q, r))) → op_bar_minus_minus(op_bar_bar(op_amp_amp(p, q), r))"), t238))
}

///|
let gl_and_or_distr_inv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_or_distr_inv")

///|
/// `GL_and_or_distr_inv`
pub fn gl_and_or_distr_inv() -> @kernel.Thm {
  gl_and_or_distr_inv_c.get()
}

///|
/// GL_and_or_distr_equiv
fn step_97() -> Unit raise {
  let t239 = @meson.meson_tac(@list.List([gl_and_or_distr(), gl_and_or_distr_inv()]))
  gl_and_or_distr_equiv_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_bar_bar(op_amp_amp(p, q), r)) == op_bar_minus_minus(op_amp_amp(op_bar_bar(p, r), op_bar_bar(q, r)))"), t239))
}

///|
let gl_and_or_distr_equiv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_or_distr_equiv")

///|
/// `GL_and_or_distr_equiv`
pub fn gl_and_or_distr_equiv() -> @kernel.Thm {
  gl_and_or_distr_equiv_c.get()
}

///|
/// GL_DOUBLENEG_CL
fn step_98() -> Unit raise {
  let t240 = @meson.meson_tac(@list.List([gl_not_not_th(), gl_modusponens(), gl_iff_imp1(), gl_iff_imp2()]))
  gl_doubleneg_cl_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(Not(Not(p))) → op_bar_minus_minus(p)"), t240))
}

///|
let gl_doubleneg_cl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_DOUBLENEG_CL")

///|
/// `GL_DOUBLENEG_CL`
pub fn gl_doubleneg_cl() -> @kernel.Thm {
  gl_doubleneg_cl_c.get()
}

///|
/// GL_DOUBLENEG
fn step_99() -> Unit raise {
  let t241 = @meson.meson_tac(@list.List([gl_not_not_th(), gl_modusponens(), gl_iff_imp1(), gl_iff_imp2()]))
  gl_doubleneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(p) → op_bar_minus_minus(Not(Not(p)))"), t241))
}

///|
let gl_doubleneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_DOUBLENEG")

///|
/// `GL_DOUBLENEG`
pub fn gl_doubleneg() -> @kernel.Thm {
  gl_doubleneg_c.get()
}

///|
/// GL_and_eq_or
fn step_100() -> Unit raise {
  let t242 = @meson.meson_tac(@list.List([gl_modusponens(), gl_axiom_or(), gl_iff_imp1(), gl_iff_imp2()]))
  gl_and_eq_or_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_bar_bar(p, q)) == op_bar_minus_minus(Not(op_amp_amp(Not(p), Not(q))))"), t242))
}

///|
let gl_and_eq_or_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_eq_or")

///|
/// `GL_and_eq_or`
pub fn gl_and_eq_or() -> @kernel.Thm {
  gl_and_eq_or_c.get()
}

///|
/// GL_tnd_th
fn step_101() -> Unit raise {
  let t244 = @meson.meson_tac(@list.List([gl_nc_th()]))
  let t243 = @simp.rewrite_tac(@list.List([gl_not_def()]))
  let t245 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([gl_and_eq_or()]))), t243), t244)
  gl_tnd_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_bar_bar(p, Not(p)))"), t245))
}

///|
let gl_tnd_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_tnd_th")

///|
/// `GL_tnd_th`
pub fn gl_tnd_th() -> @kernel.Thm {
  gl_tnd_th_c.get()
}

///|
/// GL_iff_mp
fn step_102() -> Unit raise {
  let t246 = @meson.meson_tac(@list.List([gl_iff_imp1(), gl_modusponens()]))
  gl_iff_mp_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(p, q)) && op_bar_minus_minus(p) → op_bar_minus_minus(q)"), t246))
}

///|
let gl_iff_mp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_mp")

///|
/// `GL_iff_mp`
pub fn gl_iff_mp() -> @kernel.Thm {
  gl_iff_mp_c.get()
}

///|
/// GL_and_subst
fn step_103() -> Unit raise {
  let t248 = @meson.asm_meson_tac(@list.List([gl_iff_mp(), gl_iff_sym()]))
  let t247 = @simp.rewrite_tac(@list.List([gl_and()]))
  let t249 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t247), t248)
  gl_and_subst_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ p' : Form, ∀ q : Form, ∀ q' : Form, op_bar_minus_minus(op_lt_minus_gt(p, p')) && op_bar_minus_minus(op_lt_minus_gt(q, q')) → op_bar_minus_minus(op_amp_amp(p, q)) == op_bar_minus_minus(op_amp_amp(p', q'))"), t249))
}

///|
let gl_and_subst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_subst")

///|
/// `GL_and_subst`
pub fn gl_and_subst() -> @kernel.Thm {
  gl_and_subst_c.get()
}

///|
/// GL_imp_mono_th
fn step_104() -> Unit raise {
  let t251 = @tactics.match_accept_tac(gl_imp_mono_th_v1())
  let t250 = @tactics.match_mp_tac(gl_ante_conj())
  let t252 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t250), t251)
  gl_imp_mono_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ p' : Form, ∀ q : Form, ∀ q' : Form, op_bar_minus_minus(op_minus_minus_gt(op_amp_amp(op_minus_minus_gt(p', p), op_minus_minus_gt(q, q')), op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p', q'))))"), t252))
}

///|
let gl_imp_mono_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_mono_th")

///|
/// `GL_imp_mono_th`
pub fn gl_imp_mono_th() -> @kernel.Thm {
  gl_imp_mono_th_c.get()
}

///|
/// GL_imp_mono
fn step_105() -> Unit raise {
  let t253 = @meson.meson_tac(@list.List([gl_modusponens(), gl_imp_mono_th()]))
  let t254 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(gl_and())])), t253)
  gl_imp_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ p' : Form, ∀ q : Form, ∀ q' : Form, op_bar_minus_minus(op_minus_minus_gt(p', p)) && op_bar_minus_minus(op_minus_minus_gt(q, q')) → op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p', q')))"), t254))
}

///|
let gl_imp_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_mono")

///|
/// `GL_imp_mono`
pub fn gl_imp_mono() -> @kernel.Thm {
  gl_imp_mono_c.get()
}

///|
/// GL_iff
fn step_106() -> Unit raise {
  let t255 = @meson.meson_tac(@list.List([gl_iff_imp1(), gl_iff_imp2(), gl_modusponens()]))
  gl_iff_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(p, q)) → op_bar_minus_minus(p) == op_bar_minus_minus(q)"), t255))
}

///|
let gl_iff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff")

///|
/// `GL_iff`
pub fn gl_iff() -> @kernel.Thm {
  gl_iff_c.get()
}

///|
/// GL_iff_def
fn step_107() -> Unit raise {
  let t256 = @tactics.match_accept_tac(gl_imp_antisym())
  let t257 = @list.List([@meson.meson_tac(@list.List([gl_iff_imp1(), gl_iff_imp2()])), t256])
  let t258 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t257)
  gl_iff_def_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(p, q)) == (op_bar_minus_minus(op_minus_minus_gt(p, q)) && op_bar_minus_minus(op_minus_minus_gt(q, p)))"), t258))
}

///|
let gl_iff_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_def")

///|
/// `GL_iff_def`
pub fn gl_iff_def() -> @kernel.Thm {
  gl_iff_def_c.get()
}

///|
/// GL_not_subst
fn step_108() -> Unit raise {
  let t259 = @meson.meson_tac(@list.List([gl_iff_def(), gl_iff_imp2(), gl_contrapos()]))
  gl_not_subst_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(p, q)) → op_bar_minus_minus(op_lt_minus_gt(Not(p), Not(q)))"), t259))
}

///|
let gl_not_subst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_not_subst")

///|
/// `GL_not_subst`
pub fn gl_not_subst() -> @kernel.Thm {
  gl_not_subst_c.get()
}

///|
/// GL_and_rigth_true_th
fn step_109() -> Unit raise {
  let t264 = @tactics.match_accept_tac(gl_truth_th())
  let t263 = @tactics.match_mp_tac(gl_add_assum())
  let t262 = @simp.rewrite_tac(@list.List([gl_imp_refl_th()]))
  let t261 = @tactics.match_mp_tac(gl_and_intro())
  let t260 = @list.List([@tactics.match_accept_tac(gl_and_left_th()), @tactics.all_tac])
  let t265 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([gl_iff_def()]))), @tactics.conj_tac), t260), t261), t262), t263), t264)
  gl_and_rigth_true_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(op_amp_amp(p, True), p))"), t265))
}

///|
let gl_and_rigth_true_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_rigth_true_th")

///|
/// `GL_and_rigth_true_th`
pub fn gl_and_rigth_true_th() -> @kernel.Thm {
  gl_and_rigth_true_th_c.get()
}

///|
/// GL_and_comm_th
fn step_110() -> Unit raise {
  let t268 = @meson.meson_tac(@list.List([gl_and_intro(), gl_and_left_th(), gl_and_right_th()]))
  let t269 = @tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_amp_amp(p, q), op_amp_amp(q, p)))"), fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x266
    @meson.meson_tac(@list.List([th, gl_iff_def()]))
  }), t268)
  gl_and_comm_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(op_amp_amp(p, q), op_amp_amp(q, p)))"), t269))
}

///|
let gl_and_comm_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_comm_th")

///|
/// `GL_and_comm_th`
pub fn gl_and_comm_th() -> @kernel.Thm {
  gl_and_comm_th_c.get()
}

///|
/// GL_and_assoc_th
fn step_111() -> Unit raise {
  let t272 = @meson.meson_tac(@list.List([gl_and_left_th(), gl_and_right_th(), gl_imp_trans(), gl_and_intro()]))
  let t271 = @tactics.match_mp_tac(gl_and_intro())
  let t270 = @tactics.match_mp_tac(gl_imp_antisym())
  let t273 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t270), @tactics.conj_tac), t271), t272)
  gl_and_assoc_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_lt_minus_gt(op_amp_amp(op_amp_amp(p, q), r), op_amp_amp(p, op_amp_amp(q, r))))"), t273))
}

///|
let gl_and_assoc_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_assoc_th")

///|
/// `GL_and_assoc_th`
pub fn gl_and_assoc_th() -> @kernel.Thm {
  gl_and_assoc_th_c.get()
}

///|
/// GL_and_subst_th
fn step_112() -> Unit raise {
  let t283 = @simp.asm_simp_tac(@list.List([gl_iff_imp1()]))
  let t282 = @simp.rewrite_tac(@list.List([gl_and_right_th()]))
  let t281 = @tactics.exists_tac(@term_syntax.parse_term("(q : Form)"))
  let t284 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_imp_trans()), t281), t282), t283)
  let t280 = @simp.asm_simp_tac(@list.List([gl_iff_imp1()]))
  let t279 = @simp.rewrite_tac(@list.List([gl_and_left_th()]))
  let t278 = @tactics.exists_tac(@term_syntax.parse_term("(p : Form)"))
  let t285 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_imp_trans()), t278), t279), t280), t284])
  let t277 = @tactics.match_mp_tac(gl_and_intro())
  let t276 = @tactics.repeat_tac(@tactics.strip_tac)
  let t286 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, ∀ p' : Form, ∀ q : Form, ∀ q' : Form, op_bar_minus_minus(op_lt_minus_gt(p, p')) && op_bar_minus_minus(op_lt_minus_gt(q, q')) → op_bar_minus_minus(op_minus_minus_gt(op_amp_amp(p, q), op_amp_amp(p', q')))"), fn(x274 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x274
    @meson.meson_tac(@list.List([th, gl_iff_def()]))
  }), t276), t277), @tactics.conj_tac), t285)
  gl_and_subst_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ p' : Form, ∀ q : Form, ∀ q' : Form, op_bar_minus_minus(op_lt_minus_gt(p, p')) && op_bar_minus_minus(op_lt_minus_gt(q, q')) → op_bar_minus_minus(op_lt_minus_gt(op_amp_amp(p, q), op_amp_amp(p', q')))"), t286))
}

///|
let gl_and_subst_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_subst_th")

///|
/// `GL_and_subst_th`
pub fn gl_and_subst_th() -> @kernel.Thm {
  gl_and_subst_th_c.get()
}

///|
/// GL_imp_subst
fn step_113() -> Unit raise {
  let t299 = @meson.asm_meson_tac(@list.List([gl_iff_imp1(), gl_iff_sym()]))
  let t298 = @tactics.match_mp_tac(gl_imp_mono())
  let t297 = @tactics.repeat_tac(@tactics.gen_tac)
  let t296 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ p' : Form, ∀ q' : Form, op_bar_minus_minus(op_lt_minus_gt(p, p')) && op_bar_minus_minus(op_lt_minus_gt(q, q')) → op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p', q')))"), fn(x294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x294
    @meson.meson_tac(@list.List([th, gl_iff_sym()]))
  })
  let t293 = @tactics.pop_assum_list(fn(x292 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x288 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s289 = @tactics.mp_tac(x288)
      fn(x290 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s289(x290)
      }
    })(((x291 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x291))(x292))
  })
  let t287 = @simp.rewrite_tac(@list.List([gl_iff_def()]))
  let t300 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t287), t293), t296), t297), @tactics.strip_tac), t298), t299)
  gl_imp_subst_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ p' : Form, ∀ q : Form, ∀ q' : Form, op_bar_minus_minus(op_lt_minus_gt(p, p')) && op_bar_minus_minus(op_lt_minus_gt(q, q')) → op_bar_minus_minus(op_lt_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(p', q')))"), t300))
}

///|
let gl_imp_subst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_imp_subst")

///|
/// `GL_imp_subst`
pub fn gl_imp_subst() -> @kernel.Thm {
  gl_imp_subst_c.get()
}

///|
/// GL_de_morgan_and_th
fn step_114() -> Unit raise {
  let t306 = @tactics.match_accept_tac(gl_axiom_or())
  let t307 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([gl_iff_sym()])), t306)
  let t305 = @tactics.match_accept_tac(gl_not_not_th())
  let t304 = @tactics.match_mp_tac(gl_and_subst_th())
  let t303 = @simp.once_rewrite_tac(@list.List([gl_iff_sym()]))
  let t308 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_not_subst()), t303), t304), @tactics.conj_tac), t305), t307])
  let t302 = @tactics.exists_tac(@term_syntax.parse_term("Not(op_amp_amp(Not(Not((p : Form))), Not(Not((q : Form)))))"))
  let t301 = @tactics.match_mp_tac(gl_iff_trans())
  let t309 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t301), t302), @tactics.conj_tac), t308)
  gl_de_morgan_and_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(Not(op_amp_amp(p, q)), op_bar_bar(Not(p), Not(q))))"), t309))
}

///|
let gl_de_morgan_and_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_de_morgan_and_th")

///|
/// `GL_de_morgan_and_th`
pub fn gl_de_morgan_and_th() -> @kernel.Thm {
  gl_de_morgan_and_th_c.get()
}

///|
/// GL_iff_sym_th
fn step_115() -> Unit raise {
  let t316 = @simp.rewrite_tac(@list.List([gl_iff_def_th(), gl_and_comm_th()]))
  let t315 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt((q : Form), (p : Form)), op_minus_minus_gt(p, q))"))
  let t314 = @tactics.match_mp_tac(gl_iff_trans())
  let t313 = @simp.once_rewrite_tac(@list.List([gl_iff_sym()]))
  let t312 = @simp.asm_rewrite_tac(@list.List([gl_iff_def_th()]))
  let t311 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt((p : Form), (q : Form)), op_minus_minus_gt(q, p))"))
  let t310 = @tactics.match_mp_tac(gl_iff_trans())
  let t317 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t310), t311), t312), t313), t314), t315), t316)
  gl_iff_sym_th_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(op_lt_minus_gt(p, q), op_lt_minus_gt(q, p)))"), t317))
}

///|
let gl_iff_sym_th_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_sym_th")

///|
/// `GL_iff_sym_th`
pub fn gl_iff_sym_th_v1() -> @kernel.Thm {
  gl_iff_sym_th_v1_c.get()
}

///|
/// GL_iff_true_th
fn step_116() -> Unit raise {
  let t338 = @simp.asm_rewrite_tac(@list.List([gl_iff_sym_th_v1()]))
  let t337 = @tactics.exists_tac(@term_syntax.parse_term("op_lt_minus_gt((p : Form), True)"))
  let t336 = @tactics.match_mp_tac(gl_iff_trans())
  let t335 = @simp.asm_rewrite_tac(@list.List([]))
  let t333 = @simp.simp_tac(@list.List([gl_add_assum(), gl_truth_th()]))
  let t332 = @simp.rewrite_tac(@list.List([gl_axiom_addimp()]))
  let t331 = @tactics.match_mp_tac(gl_and_intro())
  let t330 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([gl_iff_def_th(), gl_iff_imp2()]))])
  let t329 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt((p : Form), True), op_minus_minus_gt(True, p))"))
  let t328 = @tactics.match_mp_tac(gl_imp_trans())
  let t326 = @tactics.match_accept_tac(gl_truth_th())
  let t325 = @tactics.match_mp_tac(gl_add_assum())
  let t324 = @simp.rewrite_tac(@list.List([gl_imp_refl_th()]))
  let t323 = @tactics.match_mp_tac(gl_and_intro())
  let t322 = @simp.rewrite_tac(@list.List([gl_modusponens_th()]))
  let t321 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt(True, (p : Form)), True)"))
  let t320 = @tactics.match_mp_tac(gl_imp_trans())
  let t319 = @list.List([@tactics.match_accept_tac(gl_axiom_iffimp2()), @tactics.all_tac])
  let t318 = @tactics.exists_tac(@term_syntax.parse_term("op_minus_minus_gt(True, (p : Form))"))
  let t327 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_imp_trans()), t318), @tactics.conj_tac), t319), t320), t321), t322), t323), t324), t325), t326), @tactics.all_tac])
  let t334 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(gl_imp_antisym())), @tactics.conj_tac), t327), t328), t329), @tactics.conj_tac), t330), t331), t332), t333), @tactics.all_tac])
  let t339 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@theorems.claim_tac("1", @term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(op_lt_minus_gt(p, True), p))")), t334), t335), @tactics.gen_tac), t336), t337), t338)
  gl_iff_true_th_c.set(@tactics.prove(@term_syntax.parse_term("(∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(op_lt_minus_gt(p, True), p))) && (∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(op_lt_minus_gt(True, p), p)))"), t339))
}

///|
let gl_iff_true_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_true_th")

///|
/// `GL_iff_true_th`
pub fn gl_iff_true_th() -> @kernel.Thm {
  gl_iff_true_th_c.get()
}

///|
/// GL_or_subst_th
fn step_117() -> Unit raise {
  let t349 = @simp.asm_simp_tac(@list.List([gl_iff_imp1()]))
  let t348 = @tactics.match_accept_tac(gl_or_left_th())
  let t350 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(gl_add_assum()), t348), t349])
  let t351 = @tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(q' : Form)")), @tactics.conj_tac), t350)
  let t346 = @simp.asm_simp_tac(@list.List([gl_iff_imp1()]))
  let t345 = @tactics.match_accept_tac(gl_or_right_th())
  let t347 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(gl_add_assum()), t345), t346])
  let t352 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(p' : Form)")), @tactics.conj_tac), t347), t351])
  let t344 = @tactics.match_mp_tac(gl_frege())
  let t343 = @simp.rewrite_tac(@list.List([gl_disj_imp()]))
  let t342 = @tactics.repeat_tac(@tactics.strip_tac)
  let t353 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, ∀ p' : Form, ∀ q : Form, ∀ q' : Form, op_bar_minus_minus(op_lt_minus_gt(p, p')) && op_bar_minus_minus(op_lt_minus_gt(q, q')) → op_bar_minus_minus(op_minus_minus_gt(op_bar_bar(p, q), op_bar_bar(p', q')))"), fn(x340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x340
    @meson.meson_tac(@list.List([th, gl_iff_sym(), gl_iff_def()]))
  }), t342), t343), @tactics.conj_tac), t344), t352)
  gl_or_subst_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ p' : Form, ∀ q : Form, ∀ q' : Form, op_bar_minus_minus(op_lt_minus_gt(p, p')) && op_bar_minus_minus(op_lt_minus_gt(q, q')) → op_bar_minus_minus(op_lt_minus_gt(op_bar_bar(p, q), op_bar_bar(p', q')))"), t353))
}

///|
let gl_or_subst_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_subst_th")

///|
/// `GL_or_subst_th`
pub fn gl_or_subst_th() -> @kernel.Thm {
  gl_or_subst_th_c.get()
}

///|
/// GL_or_subst_right
fn step_118() -> Unit raise {
  let t355 = @simp.asm_rewrite_tac(@list.List([gl_iff_refl_th()]))
  let t354 = @tactics.match_mp_tac(gl_or_subst_th())
  let t356 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t354), t355)
  gl_or_subst_right_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q1 : Form, ∀ q2 : Form, op_bar_minus_minus(op_lt_minus_gt(q1, q2)) → op_bar_minus_minus(op_lt_minus_gt(op_bar_bar(p, q1), op_bar_bar(p, q2)))"), t356))
}

///|
let gl_or_subst_right_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_subst_right")

///|
/// `GL_or_subst_right`
pub fn gl_or_subst_right() -> @kernel.Thm {
  gl_or_subst_right_c.get()
}

///|
/// GL_or_rid_th
fn step_119() -> Unit raise {
  let t357 = @tactics.match_accept_tac(gl_or_right_th())
  let t358 = @list.List([@simp.rewrite_tac(@list.List([gl_disj_imp(), gl_imp_refl_th(), gl_ex_falso_th()])), t357])
  let t359 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([gl_iff_def()]))), @tactics.conj_tac), t358)
  gl_or_rid_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(op_bar_bar(p, False), p))"), t359))
}

///|
let gl_or_rid_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_rid_th")

///|
/// `GL_or_rid_th`
pub fn gl_or_rid_th() -> @kernel.Thm {
  gl_or_rid_th_c.get()
}

///|
/// GL_or_lid_th
fn step_120() -> Unit raise {
  let t360 = @tactics.match_accept_tac(gl_or_left_th())
  let t361 = @list.List([@simp.rewrite_tac(@list.List([gl_disj_imp(), gl_imp_refl_th(), gl_ex_falso_th()])), t360])
  let t362 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([gl_iff_def()]))), @tactics.conj_tac), t361)
  gl_or_lid_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_lt_minus_gt(op_bar_bar(False, p), p))"), t362))
}

///|
let gl_or_lid_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_lid_th")

///|
/// `GL_or_lid_th`
pub fn gl_or_lid_th() -> @kernel.Thm {
  gl_or_lid_th_c.get()
}

///|
/// GL_or_assoc_left_th
fn step_121() -> Unit raise {
  let t364 = @meson.meson_tac(@list.List([gl_or_left_th(), gl_or_right_th(), gl_imp_trans()]))
  let t363 = @simp.rewrite_tac(@list.List([gl_disj_imp()]))
  let t365 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t363), t364)
  gl_or_assoc_left_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(op_bar_bar(p, op_bar_bar(q, r)), op_bar_bar(op_bar_bar(p, q), r)))"), t365))
}

///|
let gl_or_assoc_left_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_assoc_left_th")

///|
/// `GL_or_assoc_left_th`
pub fn gl_or_assoc_left_th() -> @kernel.Thm {
  gl_or_assoc_left_th_c.get()
}

///|
/// GL_or_assoc_right_th
fn step_122() -> Unit raise {
  let t367 = @meson.meson_tac(@list.List([gl_or_left_th(), gl_or_right_th(), gl_imp_trans()]))
  let t366 = @simp.rewrite_tac(@list.List([gl_disj_imp()]))
  let t368 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t366), t367)
  gl_or_assoc_right_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_minus_minus_gt(op_bar_bar(op_bar_bar(p, q), r), op_bar_bar(p, op_bar_bar(q, r))))"), t368))
}

///|
let gl_or_assoc_right_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_assoc_right_th")

///|
/// `GL_or_assoc_right_th`
pub fn gl_or_assoc_right_th() -> @kernel.Thm {
  gl_or_assoc_right_th_c.get()
}

///|
/// GL_or_assoc_th
fn step_123() -> Unit raise {
  let t369 = @simp.rewrite_tac(@list.List([gl_iff_def(), gl_or_assoc_left_th(), gl_or_assoc_right_th()]))
  gl_or_assoc_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_lt_minus_gt(op_bar_bar(p, op_bar_bar(q, r)), op_bar_bar(op_bar_bar(p, q), r)))"), t369))
}

///|
let gl_or_assoc_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_or_assoc_th")

///|
/// `GL_or_assoc_th`
pub fn gl_or_assoc_th() -> @kernel.Thm {
  gl_or_assoc_th_c.get()
}

///|
/// GL_and_or_ldistrib_th
fn step_124() -> Unit raise {
  let t381 = @tactics.match_accept_tac(gl_or_left_th())
  let t382 = @tactics.then_tac(@tactics.match_mp_tac(gl_add_assum()), t381)
  let t383 = @tactics.match_accept_tac(gl_axiom_addimp())
  let t380 = @tactics.match_accept_tac(gl_or_right_th())
  let t384 = @tactics.then_tac(@tactics.match_mp_tac(gl_add_assum()), t380)
  let t385 = @tactics.match_accept_tac(gl_axiom_addimp())
  let t378 = @tactics.match_accept_tac(gl_or_left_th())
  let t379 = @list.List([@tactics.match_accept_tac(gl_or_right_th()), t378])
  let t377 = @tactics.match_mp_tac(gl_shunt())
  let t376 = @tactics.match_mp_tac(gl_imp_swap())
  let t375 = @simp.rewrite_tac(@list.List([gl_disj_imp()]))
  let t386 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_imp_swap()), t375), @tactics.conj_tac), t376), t377), t379), t385, t384, t383, t382])
  let t374 = @tactics.match_mp_tac(gl_ante_conj())
  let t373 = @tactics.repeat_tac(@tactics.conj_tac)
  let t372 = @tactics.try_tac(@tactics.match_mp_tac(gl_and_intro()))
  let t371 = @tactics.repeat_tac(@tactics.conj_tac)
  let t370 = @simp.rewrite_tac(@list.List([gl_iff_def(), gl_disj_imp()]))
  let t387 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t370), t371), t372), t373), t374), t386)
  gl_and_or_ldistrib_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ r : Form, op_bar_minus_minus(op_lt_minus_gt(op_amp_amp(p, op_bar_bar(q, r)), op_bar_bar(op_amp_amp(p, q), op_amp_amp(p, r))))"), t387))
}

///|
let gl_and_or_ldistrib_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_or_ldistrib_th")

///|
/// `GL_and_or_ldistrib_th`
pub fn gl_and_or_ldistrib_th() -> @kernel.Thm {
  gl_and_or_ldistrib_th_c.get()
}

///|
/// GL_not_true_th
fn step_125() -> Unit raise {
  let t392 = @tactics.match_accept_tac(gl_not_not_th())
  let t391 = @simp.once_rewrite_tac(@list.List([gl_iff_sym()]))
  let t390 = @simp.rewrite_tac(@list.List([gl_truth_th()]))
  let t389 = @tactics.exists_tac(@term_syntax.parse_term("True"))
  let t388 = @tactics.match_mp_tac(gl_iff_mp())
  let t393 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([gl_iff_def(), gl_ex_falso_th(), @equal.gsym(gl_not_def())])), t388), t389), t390), t391), t392)
  gl_not_true_th_c.set(@tactics.prove(@term_syntax.parse_term("op_bar_minus_minus(op_lt_minus_gt(Not(True), False))"), t393))
}

///|
let gl_not_true_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_not_true_th")

///|
/// `GL_not_true_th`
pub fn gl_not_true_th() -> @kernel.Thm {
  gl_not_true_th_c.get()
}

///|
/// GL_and_subst_right_th
fn step_126() -> Unit raise {
  let t421 = @tactics.match_accept_tac(gl_iff_def_th())
  let t420 = @tactics.match_mp_tac(gl_iff_imp1())
  let t419 = @simp.rewrite_tac(@list.List([gl_and_left_th()]))
  let t418 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt((q1 : Form), (q2 : Form)), op_minus_minus_gt(q2, q1))"))
  let t417 = @tactics.match_mp_tac(gl_imp_trans())
  let t416 = @simp.rewrite_tac(@list.List([gl_and_left_th()]))
  let t415 = @tactics.exists_tac(@term_syntax.parse_term("op_lt_minus_gt((q1 : Form), (q2 : Form))"))
  let t414 = @tactics.match_mp_tac(gl_imp_trans())
  let t413 = @simp.rewrite_tac(@list.List([gl_and_right_th()]))
  let t412 = @tactics.match_mp_tac(gl_and_intro())
  let t411 = @simp.rewrite_tac(@list.List([gl_modusponens_th()]))
  let t410 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt((q1 : Form), (q2 : Form)), q1)"))
  let t422 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_imp_trans()), t410), t411), t412), t413), t414), t415), t416), t417), t418), t419), t420), t421)
  let t409 = @meson.meson_tac(@list.List([gl_and_right_th(), gl_imp_trans()]))
  let t408 = @simp.rewrite_tac(@list.List([gl_and_left_th()]))
  let t423 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_and_intro()), t408), t409), t422])
  let t407 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_lt_minus_gt((q1 : Form), (q2 : Form)), q1)"))
  let t406 = @tactics.match_mp_tac(gl_imp_trans())
  let t405 = @list.List([@meson.meson_tac(@list.List([gl_and_left_th(), gl_and_right_th(), gl_imp_trans()])), @tactics.all_tac])
  let t404 = @tactics.match_mp_tac(gl_and_intro())
  let t403 = @tactics.match_mp_tac(gl_shunt())
  let t402 = @tactics.repeat_tac(@tactics.gen_tac)
  let t401 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, ∀ q1 : Form, ∀ q2 : Form, op_bar_minus_minus(op_minus_minus_gt(op_lt_minus_gt(q1, q2), op_minus_minus_gt(op_amp_amp(p, q1), op_amp_amp(p, q2))))"), fn(x398 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x398
    let t400 = @meson.meson_tac(@list.List([th, gl_and_comm_th(), gl_imp_trans(), gl_iff_def_th(), gl_iff_imp1(), gl_iff_imp2()]))
    @tactics.then_tac(@tactics.match_mp_tac(gl_and_intro()), t400)
  })
  let t396 = @tactics.match_accept_tac(gl_iff_def_th())
  let t397 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(gl_iff_imp2()), t396)])
  let t395 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt(op_amp_amp((p : Form), (q1 : Form)), op_amp_amp(p, (q2 : Form))), op_minus_minus_gt(op_amp_amp(p, q2), op_amp_amp(p, q1)))"))
  let t394 = @tactics.match_mp_tac(gl_imp_trans())
  let t424 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t394), t395), @tactics.conj_tac), t397), t401), t402), t403), t404), @tactics.conj_tac), t405), t406), t407), @tactics.conj_tac), t423)
  gl_and_subst_right_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q1 : Form, ∀ q2 : Form, op_bar_minus_minus(op_minus_minus_gt(op_lt_minus_gt(q1, q2), op_lt_minus_gt(op_amp_amp(p, q1), op_amp_amp(p, q2))))"), t424))
}

///|
let gl_and_subst_right_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_subst_right_th")

///|
/// `GL_and_subst_right_th`
pub fn gl_and_subst_right_th() -> @kernel.Thm {
  gl_and_subst_right_th_c.get()
}

///|
/// GL_and_subst_left_th
fn step_127() -> Unit raise {
  let t452 = @tactics.match_accept_tac(gl_iff_def_th())
  let t451 = @tactics.match_mp_tac(gl_iff_imp1())
  let t450 = @simp.rewrite_tac(@list.List([gl_and_left_th()]))
  let t449 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt((p1 : Form), (p2 : Form)), op_minus_minus_gt(p2, p1))"))
  let t448 = @tactics.match_mp_tac(gl_imp_trans())
  let t447 = @simp.rewrite_tac(@list.List([gl_and_left_th()]))
  let t446 = @tactics.exists_tac(@term_syntax.parse_term("op_lt_minus_gt((p1 : Form), (p2 : Form))"))
  let t445 = @tactics.match_mp_tac(gl_imp_trans())
  let t444 = @simp.rewrite_tac(@list.List([gl_and_right_th()]))
  let t443 = @tactics.match_mp_tac(gl_and_intro())
  let t442 = @simp.rewrite_tac(@list.List([gl_modusponens_th()]))
  let t441 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt((p1 : Form), (p2 : Form)), p1)"))
  let t453 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_imp_trans()), t441), t442), t443), t444), t445), t446), t447), t448), t449), t450), t451), t452)
  let t440 = @meson.meson_tac(@list.List([gl_and_right_th(), gl_and_left_th(), gl_imp_trans()]))
  let t439 = @simp.rewrite_tac(@list.List([gl_and_left_th()]))
  let t454 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_and_intro()), t439), t440), t453])
  let t438 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_lt_minus_gt((p1 : Form), (p2 : Form)), p1)"))
  let t437 = @tactics.match_mp_tac(gl_imp_trans())
  let t436 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([gl_and_left_th(), gl_and_right_th(), gl_imp_trans()]))])
  let t435 = @tactics.match_mp_tac(gl_and_intro())
  let t434 = @tactics.match_mp_tac(gl_shunt())
  let t433 = @tactics.repeat_tac(@tactics.gen_tac)
  let t432 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p1 : Form, ∀ p2 : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_lt_minus_gt(p1, p2), op_minus_minus_gt(op_amp_amp(p1, q), op_amp_amp(p2, q))))"), fn(x429 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x429
    let t431 = @meson.meson_tac(@list.List([th, gl_and_comm_th(), gl_imp_trans(), gl_iff_def_th(), gl_iff_imp1(), gl_iff_imp2()]))
    @tactics.then_tac(@tactics.match_mp_tac(gl_and_intro()), t431)
  })
  let t427 = @tactics.match_accept_tac(gl_iff_def_th())
  let t428 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(gl_iff_imp2()), t427)])
  let t426 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt(op_amp_amp((p1 : Form), (q : Form)), op_amp_amp((p2 : Form), q)), op_minus_minus_gt(op_amp_amp(p2, q), op_amp_amp(p1, q)))"))
  let t425 = @tactics.match_mp_tac(gl_imp_trans())
  let t455 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t425), t426), @tactics.conj_tac), t428), t432), t433), t434), t435), @tactics.conj_tac), t436), t437), t438), @tactics.conj_tac), t454)
  gl_and_subst_left_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p1 : Form, ∀ p2 : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_lt_minus_gt(p1, p2), op_lt_minus_gt(op_amp_amp(p1, q), op_amp_amp(p2, q))))"), t455))
}

///|
let gl_and_subst_left_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_and_subst_left_th")

///|
/// `GL_and_subst_left_th`
pub fn gl_and_subst_left_th() -> @kernel.Thm {
  gl_and_subst_left_th_c.get()
}

///|
/// GL_contrapos_th
fn step_128() -> Unit raise {
  let t462 = @meson.meson_tac(@list.List([gl_axiom_not(), gl_iff_imp2()]))
  let t463 = @list.List([@meson.meson_tac(@list.List([gl_ante_conj(), gl_imp_trans_th()])), t462])
  let t461 = @tactics.exists_tac(@term_syntax.parse_term("op_minus_minus_gt((p : Form), False)"))
  let t460 = @tactics.match_mp_tac(gl_imp_trans())
  let t464 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_shunt()), t460), t461), @tactics.conj_tac), t463)
  let t459 = @tactics.match_accept_tac(gl_axiom_not())
  let t465 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(gl_iff_imp1()), t459), t464])
  let t458 = @tactics.exists_tac(@term_syntax.parse_term("op_minus_minus_gt((q : Form), False)"))
  let t457 = @tactics.match_mp_tac(gl_imp_trans())
  let t456 = @tactics.match_mp_tac(gl_imp_swap())
  let t466 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t456), t457), t458), @tactics.conj_tac), t465)
  gl_contrapos_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(Not(q), Not(p))))"), t466))
}

///|
let gl_contrapos_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_contrapos_th")

///|
/// `GL_contrapos_th`
pub fn gl_contrapos_th() -> @kernel.Thm {
  gl_contrapos_th_c.get()
}

///|
/// GL_contrapos_eq_th
fn step_129() -> Unit raise {
  let t474 = @meson.meson_tac(@list.List([gl_not_not_th()]))
  let t473 = @tactics.match_mp_tac(gl_imp_subst())
  let t472 = @tactics.match_mp_tac(gl_iff_imp1())
  let t471 = @list.List([@tactics.match_accept_tac(gl_contrapos_th()), @tactics.all_tac])
  let t470 = @tactics.exists_tac(@term_syntax.parse_term("op_minus_minus_gt(Not(Not((p : Form))), Not(Not((q : Form))))"))
  let t469 = @tactics.match_mp_tac(gl_imp_trans())
  let t475 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_minus_minus_gt(Not(q), Not(p)), op_minus_minus_gt(p, q)))"), fn(x467 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x467
    @meson.meson_tac(@list.List([th, gl_iff_def(), gl_contrapos_th()]))
  }), @tactics.gen_tac), @tactics.gen_tac), t469), t470), @tactics.conj_tac), t471), t472), t473), t474)
  gl_contrapos_eq_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(op_minus_minus_gt(p, q), op_minus_minus_gt(Not(q), Not(p))))"), t475))
}

///|
let gl_contrapos_eq_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_contrapos_eq_th")

///|
/// `GL_contrapos_eq_th`
pub fn gl_contrapos_eq_th() -> @kernel.Thm {
  gl_contrapos_eq_th_c.get()
}

///|
/// GL_iff_sym_th
fn step_130() -> Unit raise {
  let t481 = @meson.meson_tac(@list.List([gl_iff_def_th(), gl_iff_imp2()]))
  let t482 = @list.List([@meson.meson_tac(@list.List([gl_and_comm_th(), gl_iff_imp1()])), t481])
  let t480 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt((q : Form), (p : Form)), op_minus_minus_gt(p, q))"))
  let t479 = @tactics.match_mp_tac(gl_imp_trans())
  let t478 = @list.List([@meson.meson_tac(@list.List([gl_iff_def_th(), gl_iff_imp1()])), @tactics.all_tac])
  let t477 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt((p : Form), (q : Form)), op_minus_minus_gt(q, p))"))
  let t476 = @tactics.match_mp_tac(gl_imp_trans())
  let t483 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t476), t477), @tactics.conj_tac), t478), t479), t480), @tactics.conj_tac), t482)
  gl_iff_sym_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_lt_minus_gt(p, q), op_lt_minus_gt(q, p)))"), t483))
}

///|
let gl_iff_sym_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_sym_th")

///|
/// `GL_iff_sym_th`
pub fn gl_iff_sym_th() -> @kernel.Thm {
  gl_iff_sym_th_c.get()
}

///|
/// GL_de_morgan_or_th
fn step_131() -> Unit raise {
  let t487 = @tactics.match_accept_tac(gl_not_not_th())
  let t486 = @tactics.match_accept_tac(gl_axiom_or())
  let t488 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(gl_not_subst()), t486), t487])
  let t485 = @tactics.exists_tac(@term_syntax.parse_term("Not(Not(op_amp_amp(Not((p : Form)), Not((q : Form)))))"))
  let t484 = @tactics.match_mp_tac(gl_iff_trans())
  let t489 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t484), t485), @tactics.conj_tac), t488)
  gl_de_morgan_or_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(Not(op_bar_bar(p, q)), op_amp_amp(Not(p), Not(q))))"), t489))
}

///|
let gl_de_morgan_or_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_de_morgan_or_th")

///|
/// `GL_de_morgan_or_th`
pub fn gl_de_morgan_or_th() -> @kernel.Thm {
  gl_de_morgan_or_th_c.get()
}

///|
/// GL_crysippus_th
fn step_132() -> Unit raise {
  let t501 = @tactics.match_accept_tac(gl_axiom_not())
  let t502 = @list.List([@meson.meson_tac(@list.List([gl_not_not_th(), gl_iff_sym()])), t501])
  let t500 = @tactics.exists_tac(@term_syntax.parse_term("Not(Not((q : Form)))"))
  let t499 = @tactics.match_mp_tac(gl_iff_trans())
  let t498 = @list.List([@tactics.match_accept_tac(gl_iff_refl_th()), @tactics.all_tac])
  let t497 = @tactics.match_mp_tac(gl_imp_subst())
  let t496 = @tactics.match_mp_tac(gl_not_subst())
  let t495 = @list.List([@tactics.all_tac, @tactics.match_accept_tac(gl_axiom_not())])
  let t494 = @tactics.exists_tac(@term_syntax.parse_term("Not(op_minus_minus_gt((p : Form), op_minus_minus_gt(Not((q : Form)), False)))"))
  let t493 = @tactics.match_mp_tac(gl_iff_trans())
  let t492 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([gl_axiom_and(), gl_iff_sym()]))])
  let t491 = @tactics.exists_tac(@term_syntax.parse_term("op_minus_minus_gt(op_minus_minus_gt((p : Form), op_minus_minus_gt(Not((q : Form)), False)), False)"))
  let t490 = @tactics.match_mp_tac(gl_iff_trans())
  let t503 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t490), t491), @tactics.conj_tac), t492), t493), t494), @tactics.conj_tac), t495), t496), t497), @tactics.conj_tac), t498), t499), t500), @tactics.conj_tac), t502)
  gl_crysippus_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(Not(op_minus_minus_gt(p, q)), op_amp_amp(p, Not(q))))"), t503))
}

///|
let gl_crysippus_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_crysippus_th")

///|
/// `GL_crysippus_th`
pub fn gl_crysippus_th() -> @kernel.Thm {
  gl_crysippus_th_c.get()
}

///|
/// SUBST
fn step_133() -> Unit raise {
  let t504 = @term_syntax.parse_term("(∀ f : (List[Char]) -> Form, (SUBST : ((List[Char]) -> Form, Form) -> Form)(f, True) == True) && (∀ f : (List[Char]) -> Form, SUBST(f, False) == False) && (∀ f : (List[Char]) -> Form, ∀ a : List[Char], SUBST(f, Atom(a)) == f(a)) && (∀ f : (List[Char]) -> Form, ∀ p : Form, SUBST(f, Not(p)) == Not(SUBST(f, p))) && (∀ f : (List[Char]) -> Form, ∀ p : Form, ∀ q : Form, SUBST(f, op_amp_amp(p, q)) == op_amp_amp(SUBST(f, p), SUBST(f, q))) && (∀ f : (List[Char]) -> Form, ∀ p : Form, ∀ q : Form, SUBST(f, op_bar_bar(p, q)) == op_bar_bar(SUBST(f, p), SUBST(f, q))) && (∀ f : (List[Char]) -> Form, ∀ p : Form, ∀ q : Form, SUBST(f, op_minus_minus_gt(p, q)) == op_minus_minus_gt(SUBST(f, p), SUBST(f, q))) && (∀ f : (List[Char]) -> Form, ∀ p : Form, ∀ q : Form, SUBST(f, op_lt_minus_gt(p, q)) == op_lt_minus_gt(SUBST(f, p), SUBST(f, q))) && (∀ f : (List[Char]) -> Form, ∀ p : Form, SUBST(f, Box(p)) == Box(SUBST(f, p)))")
  subst_c.set(@recursion.new_recursive_definition(@modal.form_recursion())(t504))
}

///|
let subst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBST")

///|
/// `SUBST`
pub fn subst() -> @kernel.Thm {
  subst_c.get()
}

///|
/// SUBST_IMP
fn step_134() -> Unit raise {
  let t510 = @simp.rewrite_tac(@list.List([subst(), glproves_rules()]))
  let t508 = @simp.rewrite_tac(@list.List([glaxiom_rules(), subst()]))
  let t507 = @tactics.match_mp_tac(@bool.conjunct1(glproves_rules()))
  let t506 = @tactics.repeat_tac(@tactics.strip_tac)
  let t509 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(glaxiom_induct()), t506), t507), t508), @tactics.all_tac])
  let t505 = @simp.rewrite_tac(@list.List([subst()]))
  let t511 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(glproves_induct())), t505), @tactics.conj_tac), t509), t510)
  subst_imp_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (List[Char]) -> Form, ∀ p : Form, op_bar_minus_minus(p) → op_bar_minus_minus(SUBST(f, p))"), t511))
}

///|
let subst_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBST_IMP")

///|
/// `SUBST_IMP`
pub fn subst_imp() -> @kernel.Thm {
  subst_imp_c.get()
}

///|
/// SUBSTITUTION_LEMMA
fn step_135() -> Unit raise {
  let t512 = @simp.rewrite_tac(@list.List([@equal.gsym(subst()), subst_imp()]))
  substitution_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (List[Char]) -> Form, ∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(p, q)) → op_bar_minus_minus(op_lt_minus_gt(SUBST(f, p), SUBST(f, q)))"), t512))
}

///|
let substitution_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBSTITUTION_LEMMA")

///|
/// `SUBSTITUTION_LEMMA`
pub fn substitution_lemma() -> @kernel.Thm {
  substitution_lemma_c.get()
}

///|
/// GL_iff_subst
fn step_136() -> Unit raise {
  let t545 = @meson.asm_meson_tac(@list.List([gl_iff_imp1()]))
  let t544 = @tactics.match_mp_tac(gl_imp_add_assum())
  let t543 = @tactics.match_mp_tac(gl_imp_swap())
  let t542 = @list.List([@meson.asm_meson_tac(@list.List([gl_iff_imp2()])), @tactics.all_tac])
  let t541 = @tactics.exists_tac(@term_syntax.parse_term("(q : Form)"))
  let t540 = @tactics.match_mp_tac(gl_imp_trans())
  let t539 = @tactics.match_mp_tac(gl_imp_swap())
  let t538 = @tactics.match_mp_tac(gl_add_assum())
  let t536 = @tactics.match_accept_tac(gl_imp_refl_th())
  let t535 = @tactics.match_mp_tac(gl_imp_swap())
  let t534 = @tactics.match_mp_tac(gl_ante_conj())
  let t533 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([gl_iff_imp1()]))])
  let t532 = @tactics.exists_tac(@term_syntax.parse_term("(q : Form)"))
  let t531 = @tactics.match_mp_tac(gl_imp_trans())
  let t530 = @tactics.match_mp_tac(gl_shunt())
  let t529 = @list.List([@meson.asm_meson_tac(@list.List([gl_iff_imp2()])), @tactics.all_tac])
  let t528 = @tactics.exists_tac(@term_syntax.parse_term("(p : Form)"))
  let t527 = @tactics.match_mp_tac(gl_imp_trans())
  let t526 = @tactics.match_mp_tac(gl_imp_swap())
  let t537 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_imp_insert()), t526), t527), t528), @tactics.conj_tac), t529), t530), t531), t532), @tactics.conj_tac), t533), t534), t535), t536), @tactics.all_tac])
  let t525 = @tactics.match_mp_tac(gl_ante_conj())
  let t524 = @tactics.match_mp_tac(gl_and_intro())
  let t523 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([gl_iff_def_th(), gl_iff_imp2()]))])
  let t522 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt((p' : Form), (q' : Form)), op_minus_minus_gt(q', p'))"))
  let t521 = @tactics.match_mp_tac(gl_imp_trans())
  let t520 = @list.List([@meson.meson_tac(@list.List([gl_iff_def_th(), gl_iff_imp1()])), @tactics.all_tac])
  let t519 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt((p : Form), (q : Form)), op_minus_minus_gt(q, p))"))
  let t518 = @tactics.match_mp_tac(gl_imp_trans())
  let t517 = @tactics.repeat_tac(@tactics.strip_tac)
  let t546 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, ∀ p' : Form, ∀ q' : Form, op_bar_minus_minus(op_lt_minus_gt(p, p')) && op_bar_minus_minus(op_lt_minus_gt(q, q')) → op_bar_minus_minus(op_minus_minus_gt(op_lt_minus_gt(p, q), op_lt_minus_gt(p', q')))"), fn(x513 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x513
    let t516 = @meson.asm_meson_tac(@list.List([th, gl_iff_sym()]))
    let t515 = @simp.rewrite_tac(@list.List([gl_iff_def()]))
    @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t515), t516)
  }), t517), t518), t519), @tactics.conj_tac), t520), t521), t522), @tactics.conj_tac), t523), t524), @tactics.conj_tac), t525), t537), t538), t539), t540), t541), @tactics.conj_tac), t542), t543), t544), t545)
  gl_iff_subst_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ p' : Form, ∀ q : Form, ∀ q' : Form, op_bar_minus_minus(op_lt_minus_gt(p, p')) && op_bar_minus_minus(op_lt_minus_gt(q, q')) → op_bar_minus_minus(op_lt_minus_gt(op_lt_minus_gt(p, q), op_lt_minus_gt(p', q')))"), t546))
}

///|
let gl_iff_subst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_iff_subst")

///|
/// `GL_iff_subst`
pub fn gl_iff_subst() -> @kernel.Thm {
  gl_iff_subst_c.get()
}

///|
/// GL_box_iff_th
fn step_137() -> Unit raise {
  let t559 = @tactics.match_accept_tac(gl_axiom_iffimp2())
  let t558 = @tactics.match_mp_tac(gl_imp_box())
  let t557 = @simp.rewrite_tac(@list.List([gl_axiom_boximp()]))
  let t556 = @tactics.exists_tac(@term_syntax.parse_term("Box(op_minus_minus_gt((q : Form), (p : Form)))"))
  let t560 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_imp_trans()), t556), t557), t558), t559)
  let t555 = @tactics.match_accept_tac(gl_axiom_iffimp1())
  let t554 = @tactics.match_mp_tac(gl_imp_box())
  let t553 = @simp.rewrite_tac(@list.List([gl_axiom_boximp()]))
  let t552 = @tactics.exists_tac(@term_syntax.parse_term("Box(op_minus_minus_gt((p : Form), (q : Form)))"))
  let t561 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_imp_trans()), t552), t553), t554), t555), t560])
  let t551 = @tactics.match_mp_tac(gl_and_intro())
  let t549 = @tactics.match_accept_tac(gl_iff_def_th())
  let t550 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(gl_iff_imp2()), t549)])
  let t548 = @tactics.exists_tac(@term_syntax.parse_term("op_amp_amp(op_minus_minus_gt(Box((p : Form)), Box((q : Form))), op_minus_minus_gt(Box(q), Box(p)))"))
  let t547 = @tactics.match_mp_tac(gl_imp_trans())
  let t562 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t547), t548), @tactics.conj_tac), t550), t551), @tactics.conj_tac), t561)
  gl_box_iff_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(Box(op_lt_minus_gt(p, q)), op_lt_minus_gt(Box(p), Box(q))))"), t562))
}

///|
let gl_box_iff_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_box_iff_th")

///|
/// `GL_box_iff_th`
pub fn gl_box_iff_th() -> @kernel.Thm {
  gl_box_iff_th_c.get()
}

///|
/// GL_box_iff
fn step_138() -> Unit raise {
  let t573 = @simp.asm_rewrite_tac(@list.List([gl_axiom_iffimp2()]))
  let t572 = @tactics.exists_tac(@term_syntax.parse_term("op_lt_minus_gt((p : Form), (q : Form))"))
  let t571 = @tactics.match_mp_tac(gl_box_moduspones())
  let t570 = @simp.rewrite_tac(@list.List([gl_axiom_boximp()]))
  let t569 = @tactics.exists_tac(@term_syntax.parse_term("Box(op_minus_minus_gt((q : Form), (p : Form)))"))
  let t574 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_modusponens()), t569), t570), t571), t572), t573)
  let t568 = @simp.asm_rewrite_tac(@list.List([gl_axiom_iffimp1()]))
  let t567 = @tactics.exists_tac(@term_syntax.parse_term("op_lt_minus_gt((p : Form), (q : Form))"))
  let t566 = @tactics.match_mp_tac(gl_box_moduspones())
  let t565 = @simp.rewrite_tac(@list.List([gl_axiom_boximp()]))
  let t564 = @tactics.exists_tac(@term_syntax.parse_term("Box(op_minus_minus_gt((p : Form), (q : Form)))"))
  let t575 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gl_modusponens()), t564), t565), t566), t567), t568), t574])
  let t563 = @tactics.match_mp_tac(gl_imp_antisym())
  let t576 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t563), @tactics.conj_tac), t575)
  gl_box_iff_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(Box(op_lt_minus_gt(p, q))) → op_bar_minus_minus(op_lt_minus_gt(Box(p), Box(q)))"), t576))
}

///|
let gl_box_iff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_box_iff")

///|
/// `GL_box_iff`
pub fn gl_box_iff() -> @kernel.Thm {
  gl_box_iff_c.get()
}

///|
/// GL_box_subst
fn step_139() -> Unit raise {
  let t577 = @simp.simp_tac(@list.List([gl_box_iff(), gl_necessitation()]))
  gl_box_subst_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_lt_minus_gt(p, q)) → op_bar_minus_minus(op_lt_minus_gt(Box(p), Box(q)))"), t577))
}

///|
let gl_box_subst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_box_subst")

///|
/// `GL_box_subst`
pub fn gl_box_subst() -> @kernel.Thm {
  gl_box_subst_c.get()
}

///|
/// SUBST_IFF
fn step_140() -> Unit raise {
  let t593 = @tactics.pop_assum(fn(x590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s591 = @tactics.match_accept_tac(x590)
    fn(x592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s591(x592)
    }
  })
  let t594 = @tactics.then_tac(@tactics.match_mp_tac(gl_box_subst()), t593)
  let t589 = @simp.asm_rewrite_tac(@list.List([]))
  let t595 = @tactics.then_tac(@tactics.match_mp_tac(gl_iff_subst()), t589)
  let t588 = @simp.asm_rewrite_tac(@list.List([]))
  let t596 = @tactics.then_tac(@tactics.match_mp_tac(gl_imp_subst()), t588)
  let t587 = @simp.asm_rewrite_tac(@list.List([]))
  let t597 = @tactics.then_tac(@tactics.match_mp_tac(gl_or_subst_th()), t587)
  let t586 = @simp.asm_rewrite_tac(@list.List([]))
  let t598 = @tactics.then_tac(@tactics.match_mp_tac(gl_and_subst_th()), t586)
  let t585 = @tactics.pop_assum(fn(x582 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s583 = @tactics.match_accept_tac(x582)
    fn(x584 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s583(x584)
    }
  })
  let t599 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(gl_not_subst()), t585), t598, t597, t596, t595, t594])
  let t581 = @tactics.repeat_tac(@tactics.strip_tac)
  let t580 = @simp.asm_rewrite_tac(@list.List([subst(), gl_iff_refl_th()]))
  let t579 = @tactics.match_mp_tac(@modal.form_induct())
  let t578 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t600 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t578), @tactics.disch_tac), t579), t580), t581), t599)
  subst_iff_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (List[Char]) -> Form, ∀ g : (List[Char]) -> Form, ∀ p : Form, (∀ a : List[Char], op_bar_minus_minus(op_lt_minus_gt(f(a), g(a)))) → op_bar_minus_minus(op_lt_minus_gt(SUBST(f, p), SUBST(g, p)))"), t600))
}

///|
let subst_iff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SUBST_IFF")

///|
/// `SUBST_IFF`
pub fn subst_iff() -> @kernel.Thm {
  subst_iff_c.get()
}

///|
/// GL_box_and_th
fn step_141() -> Unit raise {
  let t601 = @meson.meson_tac(@list.List([gl_and_intro(), gl_imp_box(), gl_and_left_th(), gl_and_right_th()]))
  gl_box_and_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(Box(op_amp_amp(p, q)), op_amp_amp(Box(p), Box(q))))"), t601))
}

///|
let gl_box_and_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_box_and_th")

///|
/// `GL_box_and_th`
pub fn gl_box_and_th() -> @kernel.Thm {
  gl_box_and_th_c.get()
}

///|
/// GL_box_and_inv_th
fn step_142() -> Unit raise {
  let t602 = @meson.meson_tac(@list.List([gl_ante_conj(), gl_imp_trans(), gl_imp_box(), gl_and_pair_th(), gl_axiom_boximp(), gl_shunt()]))
  gl_box_and_inv_th_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ q : Form, op_bar_minus_minus(op_minus_minus_gt(op_amp_amp(Box(p), Box(q)), Box(op_amp_amp(p, q))))"), t602))
}

///|
let gl_box_and_inv_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_box_and_inv_th")

///|
/// `GL_box_and_inv_th`
pub fn gl_box_and_inv_th() -> @kernel.Thm {
  gl_box_and_inv_th_c.get()
}

///|
/// GL_schema_4
fn step_143() -> Unit raise {
  let t603 = @meson.meson_tac(@list.List([gl_axiom_lob(), gl_imp_box(), gl_and_pair_th(), gl_and_intro(), gl_shunt(), gl_imp_trans(), gl_and_right_th(), gl_and_left_th(), gl_box_and_th()]))
  gl_schema_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(Box(p), Box(Box(p))))"), t603))
}

///|
let gl_schema_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_schema_4")

///|
/// `GL_schema_4`
pub fn gl_schema_4() -> @kernel.Thm {
  gl_schema_4_c.get()
}

///|
/// GL_dot_box
fn step_144() -> Unit raise {
  let t604 = @meson.meson_tac(@list.List([gl_imp_refl_th(), gl_schema_4(), gl_and_intro()]))
  gl_dot_box_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, op_bar_minus_minus(op_minus_minus_gt(Box(p), op_amp_amp(Box(p), Box(Box(p)))))"), t604))
}

///|
let gl_dot_box_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL_dot_box")

///|
/// `GL_dot_box`
pub fn gl_dot_box() -> @kernel.Thm {
  gl_dot_box_c.get()
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
}
