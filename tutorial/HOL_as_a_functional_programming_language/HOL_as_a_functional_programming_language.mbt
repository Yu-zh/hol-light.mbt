// Translated from upstream Tutorial/HOL_as_a_functional_programming_language.ml; edit this file directly.

///|
/// `ite`
pub(all) enum Ite {
  False
  True
  Atomic(Int64)
  Ite(Ite, Ite, Ite)
} derive(Eq, Debug)

///|
pub extend Ite with Eq::{not_equal, equal}

///|
pub extend Ite with Debug::{to_repr}

///|
pub extend Ite with @lib.OCompare::{ocompare}

///|
pub extend Ite with @lib.OHash::{ohash_visit}

///|
fn ocaml_rank_Ite(x : Ite) -> Int {
  match x {
    False => 0
    True => 1
    Atomic(_) => 1000000
    Ite(_, _, _) => 1000001
  }
}

///|
pub impl @lib.OCompare for Ite with fn ocompare(self, other) {
  match (self, other) {
    (Atomic(a0), Atomic(b0)) => {
      
      @lib.compare(a0, b0)
    }
    (Ite(a0, a1, a2), Ite(b0, b1, b2)) => {
      let c = @lib.compare(a0, b0)
      if c != 0 {
        return c
      }
      let c = @lib.compare(a1, b1)
      if c != 0 {
        return c
      }
      @lib.compare(a2, b2)
    }
    _ => ocaml_rank_Ite(self).compare(ocaml_rank_Ite(other))
  }
}

///|
pub impl @lib.OHash for Ite with fn ohash_visit(self, h) {
  match self {
    False => h.int(0L)
    True => h.int(1L)
    Atomic(a0) => {
      h.block(0, 1)
      h.field(a0)
    }
    Ite(a0, a1, a2) => {
      h.block(1, 3)
      h.field(a0)
      h.field(a1)
      h.field(a2)
    }
  }
}

///|
/// `norm`
pub fn norm_v1(x1 : Ite) -> Ite raise {
  let e = x1
  match e {
    Ite::Ite(Ite::False, y, z) => norm_v1(z)
    Ite::Ite(Ite::True, y_1, z_1) => norm_v1(y_1)
    Ite::Ite(Ite::Atomic(i), y_2, z_2) => {
      let t2 = norm_v1(z_2)
      let t3 = norm_v1(y_2)
      Ite::Ite(Ite::Atomic(i), t3, t2)
    }
    Ite::Ite(Ite::Ite(u, v, w), y_3, z_3) => {
      let t4 = Ite::Ite(w, y_3, z_3)
      norm_v1(Ite::Ite(u, Ite::Ite(v, y_3, z_3), t4))
    }
    _ => e
  }
}

///|
let ite_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ite_INDUCT")

///|
/// `ite_INDUCT`
pub fn ite_induct() -> @kernel.Thm {
  ite_induct_c.get()
}

///|
let ite_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ite_RECURSION")

///|
/// `ite_RECURSION`
pub fn ite_recursion() -> @kernel.Thm {
  ite_recursion_c.get()
}

///|
/// ite_INDUCT, ite_RECURSION
fn step_1() -> Unit raise {
  let (ite_induct, ite_recursion) = @ind_types.define_type("enum Ite { False; True; Atomic(Num); Ite(Ite, Ite, Ite) }")
  ite_induct_c.set(ite_induct)
  ite_recursion_c.set(ite_recursion)
}

///|
/// eth
fn step_2() -> Unit raise {
  eth_c.set(@define.prove_general_recursive_function_exists(@term_syntax.parse_term("∃ norm : (Ite) -> Ite, norm(False) == False && norm(True) == True && (∀ i : Num, norm(Atomic(i)) == Atomic(i)) && (∀ y : Ite, ∀ z : Ite, norm(Ite(False, y, z)) == norm(z)) && (∀ y : Ite, ∀ z : Ite, norm(Ite(True, y, z)) == norm(y)) && (∀ i : Num, ∀ y : Ite, ∀ z : Ite, norm(Ite(Atomic(i), y, z)) == Ite(Atomic(i), norm(y), norm(z))) && (∀ u : Ite, ∀ v : Ite, ∀ w : Ite, ∀ y : Ite, ∀ z : Ite, norm(Ite(Ite(u, v, w), y, z)) == norm(Ite(u, Ite(v, y, z), Ite(w, y, z))))")))
}

///|
let eth_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eth")

///|
/// `eth`
pub fn eth() -> @kernel.Thm {
  eth_c.get()
}

///|
/// sizeof
fn step_3() -> Unit raise {
  sizeof__c.set(@define.define_(@term_syntax.parse_term("(sizeof : (Ite) -> Num)(False) == 1 && sizeof(True) == 1 && sizeof(Atomic((i : Num))) == 1 && sizeof(Ite((x : Ite), (y : Ite), (z : Ite))) == sizeof(x) * (1 + (sizeof(y) + sizeof(z)))")))
}

///|
let sizeof__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sizeof")

///|
/// `sizeof`
pub fn sizeof_() -> @kernel.Thm {
  sizeof__c.get()
}

///|
/// eth'
fn step_4() -> Unit raise {
  let t5 = @simp.rewrite_tac(@list.List([@wf.wf_measure(), @wf.measure_le(), @wf.measure(), sizeof_()]))
  let t6 = @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("MEASURE(sizeof)")), t5), @int.arith_tac)
  let th = @tactics.prove(@lib.hd(@kernel.hyp(eth())), t6)
  eth_p_c.set(@bool.prove_hyp(th, eth()))
}

///|
let eth_p_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eth'")

///|
/// `eth'`
pub fn eth_p() -> @kernel.Thm {
  eth_p_c.get()
}

///|
/// norm
fn step_5() -> Unit raise {
  norm_c.set(@nums.new_specification(@list.List(["norm"]))(eth_p()))
}

///|
let norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("norm")

///|
/// `norm`
pub fn norm() -> @kernel.Thm {
  norm_c.get()
}

///|
/// SIZEOF_INDUCT
fn step_6() -> Unit raise {
  let t7 = @bool.ispec(@term_syntax.parse_term("sizeof"), @wf.wf_measure())
  sizeof_induct_c.set(@simp.rewrite_rule(@list.List([@wf.wf_ind(), @wf.measure()]))(t7))
}

///|
let sizeof_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZEOF_INDUCT")

///|
/// `SIZEOF_INDUCT`
pub fn sizeof_induct() -> @kernel.Thm {
  sizeof_induct_c.get()
}

///|
/// SIZEOF_NZ
fn step_7() -> Unit raise {
  let t8 = @simp.simp_tac(@list.List([sizeof_(), @arith.add_eq_0(), @arith.mult_eq_0(), @calc_num.arith()]))
  let t9 = @tactics.then_tac(@tactics.match_mp_tac(ite_induct()), t8)
  sizeof_nz_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Ite, !(sizeof(e) == 0)"), t9))
}

///|
let sizeof_nz_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZEOF_NZ")

///|
/// `SIZEOF_NZ`
pub fn sizeof_nz() -> @kernel.Thm {
  sizeof_nz_c.get()
}

///|
/// ITE_INDUCT
fn step_8() -> Unit raise {
  let t28 = @simp.rewrite_tac(@list.List([@arith.mult_eq_0(), sizeof_nz()]))
  let t27 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("!((b : Num) == 0) && !((c : Num) == 0) → (a : Num) < b + a + c")))
  let t26 = @simp.rewrite_tac(@list.List([@arith.add_assoc(), @arith.lt_add_rcancel()]))
  let t25 = @simp.rewrite_tac(@list.List([@arith.mult_ac(), @arith.add_ac(), @arith.lt_add_lcancel()]))
  let t24 = @simp.rewrite_tac(@list.List([@arith.left_add_distrib(), @arith.right_add_distrib(), @arith.mult_clauses()]))
  let t23 = @tactics.try_tac(@int.arith_tac)
  let t22 = @simp.rewrite_tac(@list.List([sizeof_()]))
  let t21 = @tactics.pop_assum_list(fn(x20 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t19 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t18 = @tactics.repeat_tac(@tactics.conj_tac)
  let t17 = @tactics.pop_assum_list(fn(x14 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let ths = x14
    let t16 = @tactics.first(@lib.mapfilter(@tactics.match_mp_tac, ths))
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t16)
  })
  let t13 = @tactics.match_mp_tac(ite_induct())
  let t12 = @simp.asm_rewrite_tac(@list.List([]))
  let t11 = @tactics.match_mp_tac(ite_induct())
  let t10 = @tactics.match_mp_tac(sizeof_induct())
  let t29 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.strip_tac), t10), t11), t12), t13), t17), t18), t19), t21), t22), t23), t24), t25), t26), t27), t28)
  ite_induct_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Ite) -> Bool, P(False) && P(True) && (∀ i : Num, P(Atomic(i))) && (∀ y : Ite, ∀ z : Ite, P(z) → P(Ite(False, y, z))) && (∀ y : Ite, ∀ z : Ite, P(y) → P(Ite(True, y, z))) && (∀ i : Num, ∀ y : Ite, ∀ z : Ite, P(y) && P(z) → P(Ite(Atomic(i), y, z))) && (∀ u : Ite, ∀ v : Ite, ∀ w : Ite, ∀ x : _, ∀ y : Ite, ∀ z : Ite, P(Ite(u, Ite(v, y, z), Ite(w, y, z))) → P(Ite(Ite(u, v, w), y, z))) → (∀ e : Ite, P(e))"), t29))
}

///|
let ite_induct_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITE_INDUCT")

///|
/// `ITE_INDUCT`
pub fn ite_induct_v1() -> @kernel.Thm {
  ite_induct_v1_c.get()
}

///|
/// normalized
fn step_9() -> Unit raise {
  normalized_c.set(@define.define_(@term_syntax.parse_term("(normalized : (Ite) -> Bool)(False) == true && normalized(True) == true && normalized(Atomic((a : Num))) == true && normalized(Ite(False, (x : Ite), (y : Ite))) == false && normalized(Ite(True, x, y)) == false && normalized(Ite(Atomic(a), x, y)) == (normalized(x) && normalized(y)) && normalized(Ite(Ite((u : Ite), (v : Ite), (w : Ite)), x, y)) == false")))
}

///|
let normalized_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("normalized")

///|
/// `normalized`
pub fn normalized() -> @kernel.Thm {
  normalized_c.get()
}

///|
/// NORMALIZED_NORM
fn step_10() -> Unit raise {
  let t30 = @simp.rewrite_tac(@list.List([norm(), normalized()]))
  let t31 = @tactics.then_tac(@tactics.match_mp_tac(ite_induct_v1()), t30)
  normalized_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Ite, normalized(norm(e))"), t31))
}

///|
let normalized_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORMALIZED_NORM")

///|
/// `NORMALIZED_NORM`
pub fn normalized_norm() -> @kernel.Thm {
  normalized_norm_c.get()
}

///|
/// NORMALIZED_INDUCT
fn step_11() -> Unit raise {
  let t34 = @meson.asm_meson_tac(@list.List([normalized()]))
  let t33 = @tactics.match_mp_tac(ite_induct())
  let t32 = @simp.asm_rewrite_tac(@list.List([normalized()]))
  let t35 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.match_mp_tac(ite_induct())), t32), t33), t34)
  normalized_induct_c.set(@tactics.prove(@term_syntax.parse_term("(P : (Ite) -> Bool)(False) && P(True) && (∀ i : Num, P(Atomic(i))) && (∀ i : Num, ∀ x : Ite, ∀ y : Ite, P(x) && P(y) → P(Ite(Atomic(i), x, y))) → (∀ e : Ite, normalized(e) → P(e))"), t35))
}

///|
let normalized_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORMALIZED_INDUCT")

///|
/// `NORMALIZED_INDUCT`
pub fn normalized_induct() -> @kernel.Thm {
  normalized_induct_c.get()
}

///|
/// holds
fn step_12() -> Unit raise {
  holds_c.set(@define.define_(@term_syntax.parse_term("(holds : ((Num) -> Bool, Ite) -> Bool)((v : (Num) -> Bool), False) == false && holds(v, True) == true && holds(v, Atomic((i : Num))) == v(i) && holds(v, Ite((b : Ite), (x : Ite), (y : Ite))) == (if holds(v, b) { holds(v, x) } else { holds(v, y) })")))
}

///|
let holds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("holds")

///|
/// `holds`
pub fn holds() -> @kernel.Thm {
  holds_c.get()
}

///|
/// HOLDS_NORM
fn step_13() -> Unit raise {
  let t38 = @tactics.conv_tac(@class.taut)
  let t37 = @tactics.repeat_tac(@tactics.strip_tac)
  let t36 = @simp.simp_tac(@list.List([holds(), norm()]))
  let t39 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(ite_induct_v1()), t36), t37), t38)
  holds_norm_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Ite, ∀ v : (Num) -> Bool, holds(v, norm(e)) == holds(v, e)"), t39))
}

///|
let holds_norm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_NORM")

///|
/// `HOLDS_NORM`
pub fn holds_norm() -> @kernel.Thm {
  holds_norm_c.get()
}

///|
/// taut
fn step_14() -> Unit raise {
  taut_c.set(@define.define_(@term_syntax.parse_term("(taut : ((List[Num], List[Num]), Ite) -> Bool)(((t : List[Num]), (f : List[Num])), False) == false && taut((t, f), True) == true && taut((t, f), Atomic((i : Num))) == MEM(i, t) && taut((t, f), Ite(Atomic(i), (x : Ite), (y : Ite))) == (if MEM(i, t) { taut((t, f), x) } else { if MEM(i, f) { taut((t, f), y) } else { taut((CONS(i, t), f), x) && taut((t, CONS(i, f)), y) } })")))
}

///|
let taut_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("taut")

///|
/// `taut`
pub fn taut() -> @kernel.Thm {
  taut_c.get()
}

///|
/// tautology
fn step_15() -> Unit raise {
  tautology_c.set(@define.define_(@term_syntax.parse_term("(tautology : (Ite) -> Bool)((e : Ite)) == taut((NIL, NIL), norm(e))")))
}

///|
let tautology_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("tautology")

///|
/// `tautology`
pub fn tautology() -> @kernel.Thm {
  tautology_c.get()
}

///|
/// NORMALIZED_TAUT
fn step_16() -> Unit raise {
  let t54 = @meson.meson_tac(@list.List([]))
  let t53 = @simp.asm_rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t51 = @meson.meson(@list.List([]), @term_syntax.parse_term("(∀ a : _, !(a == (i : _) && MEM(a, (f : List[_])))) == !MEM(i, f)"))
  let t52 = @simp.asm_simp_tac(@list.List([@lists.mem(), @theorems.right_or_distrib(), @theorems.left_or_distrib(), @meson.meson(@list.List([]), @term_syntax.parse_term("(∀ a : _, !(MEM(a, (t : List[_])) && a == (i : _))) == !MEM(i, t)")), t51]))
  let t47 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_simp_tac(@list.List([]))))
  let t48 = @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t47)
  let t46 = @meson.asm_meson_tac(@list.List([]))
  let t45 = @list.List([@tactics.all_tac, @tactics.disch_then(@tactics.match_mp_tac)])
  let t49 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t45), t46)
  let t44 = @meson.asm_meson_tac(@list.List([]))
  let t43 = @tactics.exists_tac(@term_syntax.parse_term("(a : Num) => MEM(a, (t : List[Num]))"))
  let t50 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t43), t44), t49, t48])
  let t42 = @tactics.repeat_tac(@tactics.conj_tac)
  let t41 = @simp.rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t40 = @simp.rewrite_tac(@list.List([holds(), taut()]))
  let t55 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(normalized_induct()), t40), t41), t42), t50), t52), t53), @tactics.ap_term_tac), @tactics.abs_tac), t54)
  normalized_taut_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Ite, normalized(e) → (∀ f : List[Num], ∀ t : List[Num], (∀ a : Num, !(MEM(a, t) && MEM(a, f))) → taut((t, f), e) == (∀ v : (Num) -> Bool, (∀ a : Num, MEM(a, t) → v(a)) && (∀ a : Num, MEM(a, f) → !v(a)) → holds(v, e)))"), t55))
}

///|
let normalized_taut_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORMALIZED_TAUT")

///|
/// `NORMALIZED_TAUT`
pub fn normalized_taut() -> @kernel.Thm {
  normalized_taut_c.get()
}

///|
/// TAUTOLOGY
fn step_17() -> Unit raise {
  let t56 = @meson.meson_tac(@list.List([tautology(), holds_norm(), normalized_taut(), @lists.mem(), normalized_norm()]))
  tautology_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Ite, tautology(e) == (∀ v : (Num) -> Bool, holds(v, e))"), t56))
}

///|
let tautology_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TAUTOLOGY")

///|
/// `TAUTOLOGY`
pub fn tautology_v1() -> @kernel.Thm {
  tautology_v1_c.get()
}

///|
/// HOLDS_BACK
fn step_18() -> Unit raise {
  let t57 = @tactics.conv_tac(@class.taut)
  let t58 = @tactics.then_tac(@simp.rewrite_tac(@list.List([holds()])), t57)
  holds_back_c.set(@tactics.prove(@term_syntax.parse_term("∀ v : (Num) -> Bool, false == holds(v, False) && true == holds(v, True) && (∀ i : Num, v(i) == holds(v, Atomic(i))) && (∀ p : Ite, !holds(v, p) == holds(v, Ite(p, False, True))) && (∀ p : Ite, ∀ q : Ite, (holds(v, p) && holds(v, q)) == holds(v, Ite(p, q, False))) && (∀ p : Ite, ∀ q : Ite, (holds(v, p) || holds(v, q)) == holds(v, Ite(p, True, q))) && (∀ p : Ite, ∀ q : Ite, (holds(v, p) == holds(v, q)) == holds(v, Ite(p, q, Ite(q, False, True)))) && (∀ p : Ite, ∀ q : Ite, (holds(v, p) → holds(v, q)) == holds(v, Ite(p, q, True)))"), t58))
}

///|
let holds_back_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_BACK")

///|
/// `HOLDS_BACK`
pub fn holds_back() -> @kernel.Thm {
  holds_back_c.get()
}

///|
/// COND_CONV
fn step_19() -> Unit raise {
  cond_conv_c.set(@simp.gen_rewrite_conv(fn(x59 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x59
  }, @list.List([@class.cond_clauses()])))
}

///|
let cond_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("COND_CONV")

///|
/// `COND_CONV`
pub fn cond_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (cond_conv_c.get())(x)
}

///|
/// AND_CONV
fn step_20() -> Unit raise {
  and_conv_c.set(@simp.gen_rewrite_conv(fn(x60 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x60
  }, @list.List([@class.taut(@term_syntax.parse_term("(false && (a : Bool)) == false && (true && a) == a"))])))
}

///|
let and_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("AND_CONV")

///|
/// `AND_CONV`
pub fn and_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (and_conv_c.get())(x)
}

///|
/// OR_CONV
fn step_21() -> Unit raise {
  or_conv_c.set(@simp.gen_rewrite_conv(fn(x61 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x61
  }, @list.List([@class.taut(@term_syntax.parse_term("(false || (a : Bool)) == a && (true || a) == true"))])))
}

///|
let or_conv_c : @lib.Cell[@equal.Conv] = @lib.Cell::new("OR_CONV")

///|
/// `OR_CONV`
pub fn or_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (or_conv_c.get())(x)
}

///|
/// `COMPUTE_DEPTH_CONV`
pub fn compute_depth_conv(x62 : (@kernel.Term) -> @kernel.Thm raise, x63 : @kernel.Term) -> @kernel.Thm raise {
  let conv = x62
  let tm = x63
  if @class.is_cond(tm) {
    @equal.thenc(@equal.thenc(@equal.rator_conv(@equal.land_conv((x64 : @kernel.Term) => compute_depth_conv(conv, x64))), cond_conv), (x65 : @kernel.Term) => compute_depth_conv(conv, x65))(tm)
  } else {
    if @basics.is_conj(tm) {
      @equal.thenc(@equal.thenc(@equal.land_conv((x66 : @kernel.Term) => compute_depth_conv(conv, x66)), and_conv), (x67 : @kernel.Term) => compute_depth_conv(conv, x67))(tm)
    } else {
      if @basics.is_disj(tm) {
        @equal.thenc(@equal.thenc(@equal.land_conv((x68 : @kernel.Term) => compute_depth_conv(conv, x68)), or_conv), (x69 : @kernel.Term) => compute_depth_conv(conv, x69))(tm)
      } else {
        let t72 = @equal.try_conv(@equal.thenc(conv, (x71 : @kernel.Term) => compute_depth_conv(conv, x71)))
        @equal.thenc(@equal.sub_conv((x70 : @kernel.Term) => compute_depth_conv(conv, x70)), t72)(tm)
      }
    }
  }
}

///|
/// Tutorial/HOL_as_a_functional_programming_language.ml:168
fn step_22() -> Unit raise {
  ignore(@tactics.g(@term_syntax.parse_term("∀ v : (Num) -> Bool, v(1) || v(2) || v(3) || v(4) || v(5) || v(6) || !v(1) || !v(2) || !v(3) || !v(4) || !v(5) || !v(6)")))
}

///|
/// Tutorial/HOL_as_a_functional_programming_language.ml:171
fn step_23() -> Unit raise {
  let t79 = @simp.rewrite_tac(@list.List([@equal.gsym(tautology_v1()), tautology()]))
  let t77 = @term_syntax.parse_term("(v : (Num) -> Bool)")
  let t78 = @tactics.spec_tac(@term_syntax.parse_term("(v : (Num) -> Bool)"), t77)
  let t76 = @tactics.disch_then(fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x74
    @simp.rewrite_tac(@list.List([th]))
  })
  let t73 = @tactics.match_mp_tac(@theorems.mono_forall())
  ignore(@tactics.e(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(holds_back()), t73), @tactics.gen_tac), t76), t78), t79)))
}

///|
/// Tutorial/HOL_as_a_functional_programming_language.ml:176
fn step_24() -> Unit raise {
  ignore(@lib.time(@tactics.e, @simp.gen_rewrite_tac(fn(x80 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x81 : @kernel.Term) -> @kernel.Thm raise {
      compute_depth_conv(x80, x81)
    }
  }, @list.List([norm(), taut(), @lists.mem(), @calc_num.arith_eq()]))))
}

///|
/// Tutorial/HOL_as_a_functional_programming_language.ml:178
fn step_25() -> Unit raise {
  ignore(@tactics.b())
  ignore(@lib.time(@tactics.e, @simp.rewrite_tac(@list.List([norm(), taut(), @lists.mem(), @calc_num.arith_eq()]))))
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
}
