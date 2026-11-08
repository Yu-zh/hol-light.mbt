// Translated from upstream Tutorial/Embedding_of_logics_deep.ml; edit this file directly.

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
  let (string_induct, string_recursion) = @ind_types.define_type("enum String { String(Num) }")
  string_induct_c.set(string_induct)
  string_recursion_c.set(string_recursion)
}

///|
/// Tutorial/Embedding_of_logics_deep.ml:4
fn step_2() -> Unit raise {
  @printer.parse_as_infix("&&", (16L, "right"))
}

///|
/// Tutorial/Embedding_of_logics_deep.ml:5
fn step_3() -> Unit raise {
  @printer.parse_as_infix("||", (15L, "right"))
}

///|
/// Tutorial/Embedding_of_logics_deep.ml:6
fn step_4() -> Unit raise {
  @printer.parse_as_infix("-->", (14L, "right"))
}

///|
/// Tutorial/Embedding_of_logics_deep.ml:7
fn step_5() -> Unit raise {
  @printer.parse_as_infix("<->", (13L, "right"))
}

///|
/// Tutorial/Embedding_of_logics_deep.ml:9
fn step_6() -> Unit raise {
  @printer.parse_as_prefix("Not")
}

///|
/// Tutorial/Embedding_of_logics_deep.ml:10
fn step_7() -> Unit raise {
  @printer.parse_as_prefix("Box")
}

///|
/// Tutorial/Embedding_of_logics_deep.ml:11
fn step_8() -> Unit raise {
  @printer.parse_as_prefix("Diamond")
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
fn step_9() -> Unit raise {
  let (form_induct, form_recursion) = @ind_types.define_type("enum Form { False; True; Atom(String); Not(Form); `&&`(Form, Form); `||`(Form, Form); `-->`(Form, Form); `<->`(Form, Form); Box(Form); Diamond(Form) }")
  form_induct_c.set(form_induct)
  form_recursion_c.set(form_recursion)
}

///|
/// holds
fn step_10() -> Unit raise {
  holds_c.set(@define.define_(@term_syntax.parse_term("(holds : (((_) -> Bool, (_, _) -> Bool), (List[Char], _) -> Bool, Form, _) -> Bool)(((W : (_) -> Bool), (R : (_, _) -> Bool)), (V : (List[Char], _) -> Bool), False, (w : _)) == false && holds((W, R), V, True, w) == true && holds((W, R), V, Atom((a : List[Char])), w) == V(a, w) && holds((W, R), V, Not((p : Form)), w) == !holds((W, R), V, p, w) && holds((W, R), V, op_amp_amp(p, (q : Form)), w) == (holds((W, R), V, p, w) && holds((W, R), V, q, w)) && holds((W, R), V, op_bar_bar(p, q), w) == (holds((W, R), V, p, w) || holds((W, R), V, q, w)) && holds((W, R), V, op_minus_minus_gt(p, q), w) == (holds((W, R), V, p, w) → holds((W, R), V, q, w)) && holds((W, R), V, op_lt_minus_gt(p, q), w) == (holds((W, R), V, p, w) == holds((W, R), V, q, w)) && holds((W, R), V, Box(p), w) == (∀ w' : _, IN(w', W) && R(w, w') → holds((W, R), V, p, w')) && holds((W, R), V, Diamond(p), w) == (∃ w' : _, IN(w', W) && R(w, w') && holds((W, R), V, p, w'))")))
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
fn step_11() -> Unit raise {
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
/// Tutorial/Embedding_of_logics_deep.ml:42
fn step_12() -> Unit raise {
  @printer.parse_as_infix("|=", (11L, "right"))
}

///|
/// valid
fn step_13() -> Unit raise {
  valid_c.set(@pair.new_definition(@term_syntax.parse_term("(op_bar_eq : ((((_) -> Bool, (_, _) -> Bool)) -> Bool, Form) -> Bool)((L : (((_) -> Bool, (_, _) -> Bool)) -> Bool), (p : Form)) == (∀ f : ((_) -> Bool, (_, _) -> Bool), L(f) → holds_in(f, p))")))
}

///|
let valid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("valid")

///|
/// `valid`
pub fn valid() -> @kernel.Thm {
  valid_c.get()
}

///|
/// S4
fn step_14() -> Unit raise {
  s4_c.set(@pair.new_definition(@term_syntax.parse_term("(S4 : (((_) -> Bool, (_, _) -> Bool)) -> Bool)(((W : (_) -> Bool), (R : (_, _) -> Bool))) == (!(W == {}) && (∀ x : _, ∀ y : _, R(x, y) → IN(x, W) && IN(y, W)) && (∀ x : _, IN(x, W) → R(x, x)) && (∀ x : _, ∀ y : _, ∀ z : _, R(x, y) && R(y, z) → R(x, z)))")))
}

///|
let s4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("S4")

///|
/// `S4`
pub fn s4() -> @kernel.Thm {
  s4_c.get()
}

///|
/// LTL
fn step_15() -> Unit raise {
  ltl_c.set(@pair.new_definition(@term_syntax.parse_term("(LTL : (((_) -> Bool, (Num, Num) -> Bool)) -> Bool)(((W : (_) -> Bool), (R : (Num, Num) -> Bool))) == (W == UNIV && (∀ x : Num, ∀ y : Num, R(x, y) == (x <= y)))")))
}

///|
let ltl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LTL")

///|
/// `LTL`
pub fn ltl() -> @kernel.Thm {
  ltl_c.get()
}

///|
/// GL
fn step_16() -> Unit raise {
  gl_c.set(@pair.new_definition(@term_syntax.parse_term("(GL : (((Num) -> Bool, (Num, Num) -> Bool)) -> Bool)(((W : (Num) -> Bool), (R : (Num, Num) -> Bool))) == (!(W == {}) && (∀ x : Num, ∀ y : Num, R(x, y) → IN(x, W) && IN(y, W)) && WF((x : Num) => (y : Num) => R(y, x)) && (∀ x : Num, ∀ y : Num, ∀ z : Num, R(x, y) && R(y, z) → R(x, z)))")))
}

///|
let gl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GL")

///|
/// `GL`
pub fn gl() -> @kernel.Thm {
  gl_c.get()
}

///|
/// MODAL_TAC
fn step_17() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([]))
  modal_tac_c.set(@tactics.then_tac(@simp.rewrite_tac(@list.List([valid(), @pair.forall_pair_thm(), holds_in(), holds()])), t1))
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
pub fn modal_rule(x2 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x2
  @tactics.prove(tm, modal_tac)
}

///|
/// TAUT_1
fn step_18() -> Unit raise {
  taut_1_c.set(modal_rule(@term_syntax.parse_term("op_bar_eq((L : (((_) -> Bool, (_, _) -> Bool)) -> Bool), Box(True))")))
}

///|
let taut_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAUT_1")

///|
/// `TAUT_1`
pub fn taut_1() -> @kernel.Thm {
  taut_1_c.get()
}

///|
/// TAUT_2
fn step_19() -> Unit raise {
  taut_2_c.set(modal_rule(@term_syntax.parse_term("op_bar_eq((L : (((_) -> Bool, (_, _) -> Bool)) -> Bool), op_minus_minus_gt(Box(op_minus_minus_gt((A : Form), (B : Form))), op_minus_minus_gt(Box(A), Box(B))))")))
}

///|
let taut_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAUT_2")

///|
/// `TAUT_2`
pub fn taut_2() -> @kernel.Thm {
  taut_2_c.get()
}

///|
/// TAUT_3
fn step_20() -> Unit raise {
  taut_3_c.set(modal_rule(@term_syntax.parse_term("op_bar_eq((L : (((_) -> Bool, (_, _) -> Bool)) -> Bool), op_minus_minus_gt(Diamond(op_minus_minus_gt((A : Form), (B : Form))), op_minus_minus_gt(Box(A), Diamond(B))))")))
}

///|
let taut_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAUT_3")

///|
/// `TAUT_3`
pub fn taut_3() -> @kernel.Thm {
  taut_3_c.get()
}

///|
/// TAUT_4
fn step_21() -> Unit raise {
  taut_4_c.set(modal_rule(@term_syntax.parse_term("op_bar_eq((L : (((_) -> Bool, (_, _) -> Bool)) -> Bool), op_minus_minus_gt(Box(op_minus_minus_gt((A : Form), (B : Form))), op_minus_minus_gt(Diamond(A), Diamond(B))))")))
}

///|
let taut_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAUT_4")

///|
/// `TAUT_4`
pub fn taut_4() -> @kernel.Thm {
  taut_4_c.get()
}

///|
/// TAUT_5
fn step_22() -> Unit raise {
  taut_5_c.set(modal_rule(@term_syntax.parse_term("op_bar_eq((L : (((_) -> Bool, (_, _) -> Bool)) -> Bool), op_minus_minus_gt(Box(op_amp_amp((A : Form), (B : Form))), op_amp_amp(Box(A), Box(B))))")))
}

///|
let taut_5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAUT_5")

///|
/// `TAUT_5`
pub fn taut_5() -> @kernel.Thm {
  taut_5_c.get()
}

///|
/// TAUT_6
fn step_23() -> Unit raise {
  taut_6_c.set(modal_rule(@term_syntax.parse_term("op_bar_eq((L : (((_) -> Bool, (_, _) -> Bool)) -> Bool), op_minus_minus_gt(Diamond(op_bar_bar((A : Form), (B : Form))), op_bar_bar(Diamond(A), Diamond(B))))")))
}

///|
let taut_6_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAUT_6")

///|
/// `TAUT_6`
pub fn taut_6() -> @kernel.Thm {
  taut_6_c.get()
}

///|
/// HOLDS_FORALL_LEMMA
fn step_24() -> Unit raise {
  let t22 = @simp.rewrite_tac(@list.List([@class.eta_ax()]))
  let t21 = @simp.rewrite_tac(@list.List([holds()]))
  let t20 = @simp.gen_rewrite_tac(fn(x19 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x13 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s14 = @equal.land_conv(x13)
      fn(x15 : @kernel.Term) -> @kernel.Thm raise {
        s14(x15)
      }
    })((fn(x16 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s17 = @equal.rand_conv(x16)
      fn(x18 : @kernel.Term) -> @kernel.Thm raise {
        s17(x18)
      }
    })(x19))
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t8 = @term_syntax.parse_term("(a : List[Char]) => (p : (W) -> Bool)")
  let t9 = @list.List([@term_syntax.parse_term("Atom((a : List[Char]))"), t8])
  let t12 = @tactics.pop_assum(fn(x11 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x5 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s6 = @tactics.mp_tac(x5)
      fn(x7 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s6(x7)
      }
    })(((x10 : @kernel.Thm) => @bool.specl(t9, x10))(x11))
  })
  let t3 = @simp.simp_tac(@list.List([]))
  let t4 = @list.List([@tactics.then_tac(@tactics.disch_tac, @tactics.gen_tac), t3])
  let t23 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t4), t12), t20), t21), t22)
  holds_forall_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, ∀ P : ((W) -> Bool) -> Bool, (∀ A : Form, ∀ V : (List[Char], W) -> Bool, P(holds((W, R), V, A))) == (∀ p : (W) -> Bool, P(p))"), t23))
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
fn step_25() -> Unit raise {
  let t28 = @tactics.disch_then(fn(x26 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x26
    @simp.rewrite_tac(@list.List([th]))
  })
  let t25 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t24 = @tactics.mp_tac(holds_forall_lemma())
  modal_schema_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([holds_in(), holds()])), t24), t25), t28))
}

///|
let modal_schema_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("MODAL_SCHEMA_TAC")

///|
/// `MODAL_SCHEMA_TAC`
pub fn modal_schema_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (modal_schema_tac_c.get())(x)
}

///|
/// MODAL_REFL
fn step_26() -> Unit raise {
  let t29 = @tactics.then_tac(modal_schema_tac, @meson.meson_tac(@list.List([])))
  modal_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, (∀ w : W, IN(w, W) → R(w, w)) == (∀ A : Form, holds_in((W, R), op_minus_minus_gt(Box(A), A)))"), t29))
}

///|
let modal_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MODAL_REFL")

///|
/// `MODAL_REFL`
pub fn modal_refl() -> @kernel.Thm {
  modal_refl_c.get()
}

///|
/// MODAL_TRANS
fn step_27() -> Unit raise {
  let t30 = @tactics.then_tac(modal_schema_tac, @meson.meson_tac(@list.List([])))
  modal_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, (∀ w : W, ∀ w' : W, ∀ w'' : W, IN(w, W) && IN(w', W) && IN(w'', W) && R(w, w') && R(w', w'') → R(w, w'')) == (∀ A : Form, holds_in((W, R), op_minus_minus_gt(Box(A), Box(Box(A)))))"), t30))
}

///|
let modal_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MODAL_TRANS")

///|
/// `MODAL_TRANS`
pub fn modal_trans() -> @kernel.Thm {
  modal_trans_c.get()
}

///|
/// MODAL_SERIAL
fn step_28() -> Unit raise {
  let t31 = @tactics.then_tac(modal_schema_tac, @meson.meson_tac(@list.List([])))
  modal_serial_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, (∀ w : W, IN(w, W) → (∃ w' : W, IN(w', W) && R(w, w'))) == (∀ A : Form, holds_in((W, R), op_minus_minus_gt(Box(A), Diamond(A))))"), t31))
}

///|
let modal_serial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MODAL_SERIAL")

///|
/// `MODAL_SERIAL`
pub fn modal_serial() -> @kernel.Thm {
  modal_serial_c.get()
}

///|
/// MODAL_SYM
fn step_29() -> Unit raise {
  let t42 = @meson.asm_meson_tac(@list.List([]))
  let t37 = @term_syntax.parse_term("(w : W)")
  let t38 = @list.List([@term_syntax.parse_term("(v : W) => v == (w : W)"), t37])
  let t41 = @tactics.first_x_assum(fn(x40 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x34 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s35 = @tactics.mp_tac(x34)
      fn(x36 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s35(x36)
      }
    })(((x39 : @kernel.Thm) => @bool.specl(t38, x39))(x40))
  })
  let t32 = @tactics.repeat_tac(@tactics.strip_tac)
  let t33 = @list.List([@meson.meson_tac(@list.List([])), t32])
  let t43 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(modal_schema_tac, @tactics.eq_tac), t33), t41), t42)
  modal_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, (∀ w : W, ∀ w' : W, IN(w, W) && IN(w', W) && R(w, w') → R(w', w)) == (∀ A : Form, holds_in((W, R), op_minus_minus_gt(A, Box(Diamond(A)))))"), t43))
}

///|
let modal_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MODAL_SYM")

///|
/// `MODAL_SYM`
pub fn modal_sym() -> @kernel.Thm {
  modal_sym_c.get()
}

///|
/// MODAL_WFTRANS
fn step_30() -> Unit raise {
  let t66 = @meson.asm_meson_tac(@list.List([]))
  let t62 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t58 = @term_syntax.parse_term("(x : W) => ∀ w : W, IN(x, (W : (W) -> Bool)) && (R : (W, W) -> Bool)(w, x) → (P : (W) -> Bool)(x)")
  let t61 = @tactics.first_x_assum(fn(x60 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x55 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s56 = @tactics.mp_tac(x55)
      fn(x57 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s56(x57)
      }
    })(((x59 : @kernel.Thm) => @bool.spec(t58, x59))(x60))
  })
  let t63 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(P : (W) -> Bool)")), @tactics.disch_tac), t61), t62)
  let t50 = @term_syntax.parse_term("(w : W)")
  let t51 = @list.List([@term_syntax.parse_term("(v : W) => IN(v, (W : (W) -> Bool)) && (R : (W, W) -> Bool)((w : W), v) && (∀ w'' : W, IN(w'', W) && R(v, w'') → R(w, w''))"), t50])
  let t54 = @tactics.first_x_assum(fn(x53 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x47 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s48 = @tactics.mp_tac(x47)
      fn(x49 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s48(x49)
      }
    })(((x52 : @kernel.Thm) => @bool.specl(t51, x52))(x53))
  })
  let t64 = @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : W)")), t54)
  let t46 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t45 = @tactics.repeat_tac(@tactics.disch_tac)
  let t65 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t45), t46), t64, t63])
  let t44 = @tactics.repeat_tac(@tactics.conj_tac)
  let t67 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(modal_schema_tac, @simp.rewrite_tac(@list.List([@wf.wf_ind()]))), @tactics.eq_tac), @tactics.strip_tac), t44), t65), t66)
  modal_wftrans_c.set(@tactics.prove(@term_syntax.parse_term("∀ W : (W) -> Bool, ∀ R : (W, W) -> Bool, ((∀ x : W, ∀ y : W, ∀ z : W, IN(x, W) && IN(y, W) && IN(z, W) && R(x, y) && R(y, z) → R(x, z)) && WF((x : W) => (y : W) => IN(x, W) && IN(y, W) && R(y, x))) == (∀ A : Form, holds_in((W, R), op_minus_minus_gt(Box(op_minus_minus_gt(Box(A), A)), Box(A))))"), t67))
}

///|
let modal_wftrans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MODAL_WFTRANS")

///|
/// `MODAL_WFTRANS`
pub fn modal_wftrans() -> @kernel.Thm {
  modal_wftrans_c.get()
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
