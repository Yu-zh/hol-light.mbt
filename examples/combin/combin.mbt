// Translated from upstream Examples/combin.ml; edit this file directly.

///|
/// confluent
fn step_1() -> Unit raise {
  confluent_c.set(@define.define_(@term_syntax.parse_term("(confluent : ((_, _) -> Bool) -> Bool)((R : (_, _) -> Bool)) == (∀ x : _, ∀ y : _, ∀ z : _, RTC(R, x, y) && RTC(R, x, z) → (∃ u : _, RTC(R, y, u) && RTC(R, z, u)))")))
}

///|
let confluent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("confluent")

///|
/// `confluent`
pub fn confluent() -> @kernel.Thm {
  confluent_c.get()
}

///|
/// confluent_diamond_RTC
fn step_2() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([confluent(), @reduct.cr()]))
  confluent_diamond_rtc_c.set(@tactics.prove(@term_syntax.parse_term("∀ R : (_, _) -> Bool, confluent(R) == CR(RTC(R))"), t1))
}

///|
let confluent_diamond_rtc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("confluent_diamond_RTC")

///|
/// `confluent_diamond_RTC`
pub fn confluent_diamond_rtc() -> @kernel.Thm {
  confluent_diamond_rtc_c.get()
}

///|
/// Examples/combin.ml:29
fn step_3() -> Unit raise {
  @printer.parse_as_infix("%", (20L, "left"))
}

///|
let cl_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cl_INDUCT")

///|
/// `cl_INDUCT`
pub fn cl_induct() -> @kernel.Thm {
  cl_induct_c.get()
}

///|
let cl_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cl_RECURSION")

///|
/// `cl_RECURSION`
pub fn cl_recursion() -> @kernel.Thm {
  cl_recursion_c.get()
}

///|
/// cl_INDUCT, cl_RECURSION
fn step_4() -> Unit raise {
  let (cl_induct, cl_recursion) = @ind_types.define_type("enum Cl { S; K; `%`(Cl, Cl) }")
  cl_induct_c.set(cl_induct)
  cl_recursion_c.set(cl_recursion)
}

///|
/// Examples/combin.ml:37
fn step_5() -> Unit raise {
  @printer.parse_as_infix("-->", (12L, "right"))
}

///|
let redn_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("redn_rules")

///|
/// `redn_rules`
pub fn redn_rules() -> @kernel.Thm {
  redn_rules_c.get()
}

///|
let redn_ind_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("redn_ind")

///|
/// `redn_ind`
pub fn redn_ind() -> @kernel.Thm {
  redn_ind_c.get()
}

///|
let redn_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("redn_cases")

///|
/// `redn_cases`
pub fn redn_cases() -> @kernel.Thm {
  redn_cases_c.get()
}

///|
/// redn_rules, redn_ind, redn_cases
fn step_6() -> Unit raise {
  let (redn_rules, redn_ind, redn_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ x : Cl, ∀ y : Cl, ∀ f : Cl, (op_minus_minus_gt : (Cl, Cl) -> Bool)(x, y) → op_minus_minus_gt(op_pct(f, x), op_pct(f, y))) && (∀ f : Cl, ∀ g : Cl, ∀ x : Cl, op_minus_minus_gt(f, g) → op_minus_minus_gt(op_pct(f, x), op_pct(g, x))) && (∀ x : Cl, ∀ y : Cl, op_minus_minus_gt(op_pct(op_pct(K, x), y), x)) && (∀ f : Cl, ∀ g : Cl, ∀ x : Cl, op_minus_minus_gt(op_pct(op_pct(op_pct(S, f), g), x), op_pct(op_pct(f, x), op_pct(g, x))))"))
  redn_rules_c.set(redn_rules)
  redn_ind_c.set(redn_ind)
  redn_cases_c.set(redn_cases)
}

///|
/// Examples/combin.ml:49
fn step_7() -> Unit raise {
  @printer.parse_as_infix("-||->", (12L, "right"))
}

///|
let predn_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predn_rules")

///|
/// `predn_rules`
pub fn predn_rules() -> @kernel.Thm {
  predn_rules_c.get()
}

///|
let predn_ind_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predn_ind")

///|
/// `predn_ind`
pub fn predn_ind() -> @kernel.Thm {
  predn_ind_c.get()
}

///|
let predn_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predn_cases")

///|
/// `predn_cases`
pub fn predn_cases() -> @kernel.Thm {
  predn_cases_c.get()
}

///|
/// predn_rules, predn_ind, predn_cases
fn step_8() -> Unit raise {
  let (predn_rules, predn_ind, predn_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ x : Cl, (op_minus_bar_bar_minus_gt : (Cl, Cl) -> Bool)(x, x)) && (∀ x : Cl, ∀ y : Cl, ∀ u : Cl, ∀ v : Cl, op_minus_bar_bar_minus_gt(x, y) && op_minus_bar_bar_minus_gt(u, v) → op_minus_bar_bar_minus_gt(op_pct(x, u), op_pct(y, v))) && (∀ x : Cl, ∀ y : Cl, op_minus_bar_bar_minus_gt(op_pct(op_pct(K, x), y), x)) && (∀ f : Cl, ∀ g : Cl, ∀ x : Cl, op_minus_bar_bar_minus_gt(op_pct(op_pct(op_pct(S, f), g), x), op_pct(op_pct(f, x), op_pct(g, x))))"))
  predn_rules_c.set(predn_rules)
  predn_ind_c.set(predn_ind)
  predn_cases_c.set(predn_cases)
}

///|
/// Examples/combin.ml:61
fn step_9() -> Unit raise {
  @printer.parse_as_infix("-->*", (12L, "right"))
}

///|
/// Examples/combin.ml:62
fn step_10() -> Unit raise {
  @printer.parse_as_infix("-||->*", (12L, "right"))
}

///|
/// RTCredn
fn step_11() -> Unit raise {
  rtcredn_c.set(@define.define_(@term_syntax.parse_term("(op_minus_minus_gt_star : (Cl, Cl) -> Bool) == RTC(op_minus_minus_gt)")))
}

///|
let rtcredn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCredn")

///|
/// `RTCredn`
pub fn rtcredn() -> @kernel.Thm {
  rtcredn_c.get()
}

///|
/// RTCpredn
fn step_12() -> Unit raise {
  rtcpredn_c.set(@define.define_(@term_syntax.parse_term("(op_minus_bar_bar_minus_gt_star : (Cl, Cl) -> Bool) == RTC(op_minus_bar_bar_minus_gt)")))
}

///|
let rtcpredn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCpredn")

///|
/// `RTCpredn`
pub fn rtcpredn() -> @kernel.Thm {
  rtcpredn_c.get()
}

///|
/// RTCredn_rules
fn step_13() -> Unit raise {
  let t2 = @bool.ispec(@term_syntax.parse_term("op_minus_minus_gt"), @rstc.rtc_rules())
  rtcredn_rules_c.set(@simp.rewrite_rule(@list.List([@equal.sym(rtcredn())]))(t2))
}

///|
let rtcredn_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCredn_rules")

///|
/// `RTCredn_rules`
pub fn rtcredn_rules() -> @kernel.Thm {
  rtcredn_rules_c.get()
}

///|
/// RTCredn_ind
fn step_14() -> Unit raise {
  let t3 = @bool.ispec(@term_syntax.parse_term("op_minus_minus_gt"), @rstc.rtc_induct())
  rtcredn_ind_c.set(@simp.rewrite_rule(@list.List([@equal.sym(rtcredn())]))(t3))
}

///|
let rtcredn_ind_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCredn_ind")

///|
/// `RTCredn_ind`
pub fn rtcredn_ind() -> @kernel.Thm {
  rtcredn_ind_c.get()
}

///|
/// RTCpredn_rules
fn step_15() -> Unit raise {
  let t4 = @bool.ispec(@term_syntax.parse_term("op_minus_bar_bar_minus_gt"), @rstc.rtc_rules())
  rtcpredn_rules_c.set(@simp.rewrite_rule(@list.List([@equal.sym(rtcpredn())]))(t4))
}

///|
let rtcpredn_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCpredn_rules")

///|
/// `RTCpredn_rules`
pub fn rtcpredn_rules() -> @kernel.Thm {
  rtcpredn_rules_c.get()
}

///|
/// RTCpredn_ind
fn step_16() -> Unit raise {
  let t5 = @bool.ispec(@term_syntax.parse_term("op_minus_bar_bar_minus_gt"), @rstc.rtc_induct())
  rtcpredn_ind_c.set(@simp.rewrite_rule(@list.List([@equal.sym(rtcpredn())]))(t5))
}

///|
let rtcpredn_ind_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCpredn_ind")

///|
/// `RTCpredn_ind`
pub fn rtcpredn_ind() -> @kernel.Thm {
  rtcpredn_ind_c.get()
}

///|
/// RTCredn_RTCpredn
fn step_17() -> Unit raise {
  let t8 = @meson.meson_tac(@list.List([predn_rules()]))
  let t7 = @tactics.match_mp_tac(redn_ind())
  let t6 = @tactics.match_mp_tac(@rstc.rtc_mono())
  let t9 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([rtcredn(), rtcpredn()])), t6), t7), t8)
  rtcredn_rtcpredn_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cl, ∀ y : Cl, op_minus_minus_gt_star(x, y) → op_minus_bar_bar_minus_gt_star(x, y)"), t9))
}

///|
let rtcredn_rtcpredn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCredn_RTCpredn")

///|
/// `RTCredn_RTCpredn`
pub fn rtcredn_rtcpredn() -> @kernel.Thm {
  rtcredn_rtcpredn_c.get()
}

///|
/// RTCredn_ap_monotonic
fn step_18() -> Unit raise {
  let t10 = @meson.meson_tac(@list.List([rtcredn_rules(), redn_rules()]))
  let t11 = @tactics.then_tac(@tactics.match_mp_tac(rtcredn_ind()), t10)
  rtcredn_ap_monotonic_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cl, ∀ y : Cl, op_minus_minus_gt_star(x, y) → (∀ z : Cl, op_minus_minus_gt_star(op_pct(x, z), op_pct(y, z)) && op_minus_minus_gt_star(op_pct(z, x), op_pct(z, y)))"), t11))
}

///|
let rtcredn_ap_monotonic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCredn_ap_monotonic")

///|
/// `RTCredn_ap_monotonic`
pub fn rtcredn_ap_monotonic() -> @kernel.Thm {
  rtcredn_ap_monotonic_c.get()
}

///|
/// predn_RTCredn
fn step_19() -> Unit raise {
  let t12 = @meson.meson_tac(@list.List([rtcredn_rules(), redn_rules(), rtcredn_ap_monotonic()]))
  let t13 = @tactics.then_tac(@tactics.match_mp_tac(predn_ind()), t12)
  predn_rtcredn_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cl, ∀ y : Cl, op_minus_bar_bar_minus_gt(x, y) → op_minus_minus_gt_star(x, y)"), t13))
}

///|
let predn_rtcredn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predn_RTCredn")

///|
/// `predn_RTCredn`
pub fn predn_rtcredn() -> @kernel.Thm {
  predn_rtcredn_c.get()
}

///|
/// RTCpredn_RTCredn
fn step_20() -> Unit raise {
  let t14 = @meson.meson_tac(@list.List([predn_rtcredn(), rtcredn_rules()]))
  let t15 = @tactics.then_tac(@tactics.match_mp_tac(rtcpredn_ind()), t14)
  rtcpredn_rtcredn_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cl, ∀ y : Cl, op_minus_bar_bar_minus_gt_star(x, y) → op_minus_minus_gt_star(x, y)"), t15))
}

///|
let rtcpredn_rtcredn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCpredn_RTCredn")

///|
/// `RTCpredn_RTCredn`
pub fn rtcpredn_rtcredn() -> @kernel.Thm {
  rtcpredn_rtcredn_c.get()
}

///|
/// RTCpredn_EQ_RTCredn
fn step_21() -> Unit raise {
  let t16 = @meson.meson_tac(@list.List([rtcpredn_rtcredn(), rtcredn_rtcpredn()]))
  let t17 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t16)
  rtcpredn_eq_rtcredn_c.set(@tactics.prove(@term_syntax.parse_term("op_minus_bar_bar_minus_gt_star == op_minus_minus_gt_star"), t17))
}

///|
let rtcpredn_eq_rtcredn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RTCpredn_EQ_RTCredn")

///|
/// `RTCpredn_EQ_RTCredn`
pub fn rtcpredn_eq_rtcredn() -> @kernel.Thm {
  rtcpredn_eq_rtcredn_c.get()
}

///|
/// `characterise`
pub fn characterise(x18 : @kernel.Term) -> @kernel.Thm raise {
  let t = x18
  let t22 = @bool.spec(t, predn_cases())
  let t19 = @equal.gsym(@theorems.conj_assoc())
  let t20 = @equal.gsym(@theorems.exists_refl())
  let t21 = @ind_types.injectivity("cl")
  @simp.simp_rule(@list.List([@ind_types.distinctness("cl"), t21, t20, @theorems.right_exists_and_thm(), t19, @theorems.unwind_thm1()]))(t22)
}

///|
/// Sx_PREDN
fn step_22() -> Unit raise {
  let t23 = @meson.meson_tac(@list.List([predn_rules(), characterise(@term_syntax.parse_term("S"))]))
  let t24 = @tactics.then_tac(@simp.rewrite_tac(@list.List([characterise(@term_syntax.parse_term("op_pct(S, (x : Cl))"))])), t23)
  sx_predn_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cl, ∀ y : Cl, op_minus_bar_bar_minus_gt(op_pct(S, x), y) == (∃ z : Cl, y == op_pct(S, z) && op_minus_bar_bar_minus_gt(x, z))"), t24))
}

///|
let sx_predn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Sx_PREDN")

///|
/// `Sx_PREDN`
pub fn sx_predn() -> @kernel.Thm {
  sx_predn_c.get()
}

///|
/// Kx_PREDN
fn step_23() -> Unit raise {
  let t25 = @meson.meson_tac(@list.List([predn_rules(), characterise(@term_syntax.parse_term("K"))]))
  let t26 = @tactics.then_tac(@simp.rewrite_tac(@list.List([characterise(@term_syntax.parse_term("op_pct(K, (x : Cl))"))])), t25)
  kx_predn_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cl, ∀ y : Cl, op_minus_bar_bar_minus_gt(op_pct(K, x), y) == (∃ z : Cl, y == op_pct(K, z) && op_minus_bar_bar_minus_gt(x, z))"), t26))
}

///|
let kx_predn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Kx_PREDN")

///|
/// `Kx_PREDN`
pub fn kx_predn() -> @kernel.Thm {
  kx_predn_c.get()
}

///|
/// Kxy_PREDN
fn step_24() -> Unit raise {
  let t27 = @meson.meson_tac(@list.List([predn_rules(), kx_predn()]))
  let t28 = @tactics.then_tac(@simp.rewrite_tac(@list.List([characterise(@term_syntax.parse_term("op_pct(op_pct(K, (x : Cl)), (y : Cl))"))])), t27)
  kxy_predn_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cl, ∀ y : Cl, ∀ z : Cl, op_minus_bar_bar_minus_gt(op_pct(op_pct(K, x), y), z) == ((∃ u : Cl, ∃ v : Cl, z == op_pct(op_pct(K, u), v) && op_minus_bar_bar_minus_gt(x, u) && op_minus_bar_bar_minus_gt(y, v)) || z == x)"), t28))
}

///|
let kxy_predn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Kxy_PREDN")

///|
/// `Kxy_PREDN`
pub fn kxy_predn() -> @kernel.Thm {
  kxy_predn_c.get()
}

///|
/// Sxy_PREDN
fn step_25() -> Unit raise {
  let t29 = @meson.meson_tac(@list.List([predn_rules(), characterise(@term_syntax.parse_term("S")), sx_predn()]))
  let t30 = @tactics.then_tac(@simp.rewrite_tac(@list.List([characterise(@term_syntax.parse_term("op_pct(op_pct(S, (x : Cl)), (y : Cl))"))])), t29)
  sxy_predn_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cl, ∀ y : Cl, ∀ z : Cl, op_minus_bar_bar_minus_gt(op_pct(op_pct(S, x), y), z) == (∃ u : Cl, ∃ v : Cl, z == op_pct(op_pct(S, u), v) && op_minus_bar_bar_minus_gt(x, u) && op_minus_bar_bar_minus_gt(y, v))"), t30))
}

///|
let sxy_predn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Sxy_PREDN")

///|
/// `Sxy_PREDN`
pub fn sxy_predn() -> @kernel.Thm {
  sxy_predn_c.get()
}

///|
/// Sxyz_PREDN
fn step_26() -> Unit raise {
  let t31 = @meson.meson_tac(@list.List([predn_rules(), sxy_predn()]))
  let t32 = @tactics.then_tac(@simp.rewrite_tac(@list.List([characterise(@term_syntax.parse_term("op_pct(op_pct(op_pct(S, (w : Cl)), (x : Cl)), (y : Cl))"))])), t31)
  sxyz_predn_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cl, ∀ x : Cl, ∀ y : Cl, ∀ z : Cl, op_minus_bar_bar_minus_gt(op_pct(op_pct(op_pct(S, w), x), y), z) == ((∃ p : Cl, ∃ q : Cl, ∃ r : Cl, z == op_pct(op_pct(op_pct(S, p), q), r) && op_minus_bar_bar_minus_gt(w, p) && op_minus_bar_bar_minus_gt(x, q) && op_minus_bar_bar_minus_gt(y, r)) || z == op_pct(op_pct(w, y), op_pct(x, y)))"), t32))
}

///|
let sxyz_predn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("Sxyz_PREDN")

///|
/// `Sxyz_PREDN`
pub fn sxyz_predn() -> @kernel.Thm {
  sxyz_predn_c.get()
}

///|
/// predn_diamond_lemma
fn step_27() -> Unit raise {
  let t51 = @meson.meson_tac(@list.List([predn_rules()]))
  let t52 = @tactics.then_tac(@simp.rewrite_tac(@list.List([sxyz_predn()])), t51)
  let t50 = @meson.meson_tac(@list.List([predn_rules()]))
  let t53 = @tactics.then_tac(@simp.rewrite_tac(@list.List([kxy_predn()])), t50)
  let t49 = @meson.asm_meson_tac(@list.List([kx_predn(), sxy_predn(), predn_rules()]))
  let t45 = @tactics.subgoal_then(@term_syntax.parse_term("∃ p : Cl, ∃ q : Cl, (y : Cl) == op_pct(op_pct(S, p), q) && op_minus_bar_bar_minus_gt((f : Cl), p) && op_minus_bar_bar_minus_gt((g : Cl), q)"), fn(x42 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s43 = @tactics.mp_tac(x42)
    fn(x44 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s43(x44)
    }
  })
  let t46 = @tactics.subgoal_then(@term_syntax.parse_term("∃ w : Cl, (y : Cl) == op_pct(K, w) && op_minus_bar_bar_minus_gt((z : Cl), w)"), fn(x39 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s40 = @tactics.mp_tac(x39)
    fn(x41 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s40(x41)
    }
  })
  let t47 = @meson.asm_meson_tac(@list.List([predn_rules()]))
  let t48 = @list.List([@meson.asm_meson_tac(@list.List([predn_rules()])), t47, t46, t45])
  let t36 = @simp.simp_rule(@list.List([characterise(@term_syntax.parse_term("op_pct((x : Cl), (y : Cl))"))]))
  let t38 = @tactics.undisch_then(@term_syntax.parse_term("op_minus_bar_bar_minus_gt(op_pct((x : Cl), (u : Cl)), (z : Cl))"), fn(x37 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(t36(x37))
  })
  let t54 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t38), t48), t49)
  let t55 = @list.List([@meson.meson_tac(@list.List([predn_rules()])), t54, t53, t52])
  let t35 = @tactics.repeat_tac(@tactics.conj_tac)
  let t34 = @simp.simp_tac(@list.List([predn_rules()]))
  let t33 = @tactics.match_mp_tac(predn_ind())
  let t56 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (a → a && b)"))])), t33), t34), t35), t55)
  predn_diamond_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cl, ∀ y : Cl, op_minus_bar_bar_minus_gt(x, y) → (∀ z : Cl, op_minus_bar_bar_minus_gt(x, z) → (∃ u : Cl, op_minus_bar_bar_minus_gt(y, u) && op_minus_bar_bar_minus_gt(z, u)))"), t56))
}

///|
let predn_diamond_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predn_diamond_lemma")

///|
/// `predn_diamond_lemma`
pub fn predn_diamond_lemma() -> @kernel.Thm {
  predn_diamond_lemma_c.get()
}

///|
/// predn_diamond
fn step_28() -> Unit raise {
  let t57 = @meson.meson_tac(@list.List([@reduct.cr(), predn_diamond_lemma()]))
  predn_diamond_c.set(@tactics.prove(@term_syntax.parse_term("CR(op_minus_bar_bar_minus_gt)"), t57))
}

///|
let predn_diamond_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("predn_diamond")

///|
/// `predn_diamond`
pub fn predn_diamond() -> @kernel.Thm {
  predn_diamond_c.get()
}

///|
/// confluent_redn
fn step_29() -> Unit raise {
  let t58 = @meson.meson_tac(@list.List([confluent_diamond_rtc(), rtcpredn_eq_rtcredn(), rtcredn(), rtcpredn(), @reduct.rtc_cr(), predn_diamond()]))
  confluent_redn_c.set(@tactics.prove(@term_syntax.parse_term("confluent(op_minus_minus_gt)"), t58))
}

///|
let confluent_redn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("confluent_redn")

///|
/// `confluent_redn`
pub fn confluent_redn() -> @kernel.Thm {
  confluent_redn_c.get()
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
}
