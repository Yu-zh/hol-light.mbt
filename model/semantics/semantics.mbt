// Translated from upstream Model/semantics.ml; edit this file directly.

///|
/// typeset
fn step_1() -> Unit raise {
  let t1 = @term_syntax.parse_term("(typeset : ((List[Char]) -> V, Type) -> V)((tau : (List[Char]) -> V), Tyvar((s : List[Char]))) == tau(s) && typeset(tau, Bool) == boolset && typeset(tau, Ind) == indset && typeset(tau, Fun((a : Type), (b : Type))) == funspace(typeset(tau, a), typeset(tau, b))")
  typeset_c.set(@recursion.new_recursive_definition(@syntax.type_recursion())(t1))
}

///|
let typeset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("typeset")

///|
/// `typeset`
pub fn typeset() -> @kernel.Thm {
  typeset_c.get()
}

///|
/// semantics
fn step_2() -> Unit raise {
  let t2 = @term_syntax.parse_term("(semantics : (((List[Char], Type)) -> V, (List[Char]) -> V, Term) -> V)((sigma : ((List[Char], Type)) -> V), (tau : (List[Char]) -> V), Var((n : List[Char]), (ty : Type))) == sigma((n, ty)) && semantics(sigma, tau, Equal(ty)) == abstract_(typeset(tau, ty), typeset(tau, Fun(ty, Bool)), (x : V) => abstract_(typeset(tau, ty), typeset(tau, Bool), (y : V) => boolean(x == y))) && semantics(sigma, tau, Select(ty)) == abstract_(typeset(tau, Fun(ty, Bool)), typeset(tau, ty), (s : V) => if (∃ x : V, op_lt_colon(x, suchthat(typeset(tau, ty), holds(s)))) { ch(suchthat(typeset(tau, ty), holds(s))) } else { ch(typeset(tau, ty)) }) && semantics(sigma, tau, Comb((s : Term), (t : Term))) == apply(semantics(sigma, tau, s), semantics(sigma, tau, t)) && semantics(sigma, tau, Abs(n, ty, t)) == abstract_(typeset(tau, ty), typeset(tau, typeof_(t)), (x : V) => semantics(op_bar_minus_gt((n, ty), x, sigma), tau, t))")
  semantics_c.set(@recursion.new_recursive_definition(@syntax.term_recursion())(t2))
}

///|
let semantics_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("semantics")

///|
/// `semantics`
pub fn semantics() -> @kernel.Thm {
  semantics_c.get()
}

///|
/// type_valuation
fn step_3() -> Unit raise {
  type_valuation_c.set(@pair.new_definition(@term_syntax.parse_term("(type_valuation : ((_) -> V) -> Bool)((tau : (_) -> V)) == (∀ x : _, ∃ y : V, op_lt_colon(y, tau(x)))")))
}

///|
let type_valuation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("type_valuation")

///|
/// `type_valuation`
pub fn type_valuation() -> @kernel.Thm {
  type_valuation_c.get()
}

///|
/// term_valuation
fn step_4() -> Unit raise {
  term_valuation_c.set(@pair.new_definition(@term_syntax.parse_term("(term_valuation : ((List[Char]) -> V, ((_, Type)) -> V) -> Bool)((tau : (List[Char]) -> V), (sigma : ((_, Type)) -> V)) == (∀ n : _, ∀ ty : Type, op_lt_colon(sigma((n, ty)), typeset(tau, ty)))")))
}

///|
let term_valuation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_valuation")

///|
/// `term_valuation`
pub fn term_valuation() -> @kernel.Thm {
  term_valuation_c.get()
}

///|
/// TERM_VALUATION_VALMOD
fn step_5() -> Unit raise {
  let t3 = @meson.meson_tac(@list.List([]))
  let t4 = @tactics.then_tac(@simp.rewrite_tac(@list.List([term_valuation(), @modelset.valmod(), @pair.pair_eq()])), t3)
  term_valuation_valmod_c.set(@tactics.prove(@term_syntax.parse_term("∀ sigma : ((_, Type)) -> V, ∀ taut : _, ∀ n : _, ∀ ty : Type, ∀ x : V, term_valuation((tau : (List[Char]) -> V), sigma) && op_lt_colon(x, typeset(tau, ty)) → term_valuation(tau, op_bar_minus_gt((n, ty), x, sigma))"), t4))
}

///|
let term_valuation_valmod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERM_VALUATION_VALMOD")

///|
/// `TERM_VALUATION_VALMOD`
pub fn term_valuation_valmod() -> @kernel.Thm {
  term_valuation_valmod_c.get()
}

///|
/// TYPESET_INHABITED
fn step_6() -> Unit raise {
  let t7 = @meson.asm_meson_tac(@list.List([@modelset.boolean_in_boolset(), @modelset.indset_inhabited(), @modelset.funspace_inhabited()]))
  let t8 = @list.List([@meson.asm_meson_tac(@list.List([type_valuation()])), t7])
  let t6 = @simp.rewrite_tac(@list.List([typeset()]))
  let t5 = @tactics.match_mp_tac(@syntax.type_induct())
  let t9 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()])), @tactics.gen_tac), @tactics.disch_tac), t5), t6), @tactics.conj_tac), t8)
  typeset_inhabited_c.set(@tactics.prove(@term_syntax.parse_term("∀ tau : (List[Char]) -> V, ∀ ty : Type, type_valuation(tau) → (∃ x : V, op_lt_colon(x, typeset(tau, ty)))"), t9))
}

///|
let typeset_inhabited_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TYPESET_INHABITED")

///|
/// `TYPESET_INHABITED`
pub fn typeset_inhabited() -> @kernel.Thm {
  typeset_inhabited_c.get()
}

///|
/// SEMANTICS_TYPESET_INDUCT
fn step_7() -> Unit raise {
  let t28 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t27 = @simp.rewrite_tac(@list.List([]))
  let t26 = @tactics.repeat_tac(@tactics.strip_tac)
  let t25 = @tactics.match_mp_tac(@modelset.abstract_in_funspace())
  let t23 = @drule.match_mp(@syntax.welltyped_lemma())
  let t29 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x24 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s21 = @tactics.subst1_tac(x20)
      fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s21(x22)
      }
    })(t23(x24))
  }), t25), t26), t27), t28)
  let t19 = @meson.asm_meson_tac(@list.List([]))
  let t30 = @tactics.then_tac(@tactics.match_mp_tac(@modelset.apply_in_ranspace()), t19)
  let t31 = @meson.asm_meson_tac(@list.List([@syntax.has_type_rules()]))
  let t18 = @meson.asm_meson_tac(@list.List([@modelset.ch(), @modelset.suchthat(), typeset_inhabited()]))
  let t32 = @tactics.then_tac(@tactics.match_mp_tac(@modelset.abstract_in_funspace()), t18)
  let t17 = @simp.rewrite_tac(@list.List([@modelset.boolean_in_boolset()]))
  let t16 = @tactics.match_mp_tac(@modelset.abstract_in_funspace())
  let t15 = @tactics.repeat_tac(@tactics.strip_tac)
  let t14 = @simp.rewrite_tac(@list.List([]))
  let t33 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@modelset.abstract_in_funspace()), t14), t15), t16), t17), t32, t31, t30, t29])
  let t13 = @simp.asm_rewrite_tac(@list.List([]))
  let t12 = @tactics.repeat_tac(@tactics.strip_tac)
  let t11 = @list.List([@meson.meson_tac(@list.List([term_valuation()])), @tactics.all_tac])
  let t10 = @simp.asm_simp_tac(@list.List([semantics(), typeset(), @syntax.has_type_rules()]))
  let t34 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@syntax.has_type_induct()), t10), @tactics.conj_tac), t11), t12), t13), t33)
  semantics_typeset_induct_c.set(@tactics.prove(@term_syntax.parse_term("∀ tm : Term, ∀ ty : Type, has_type(tm, ty) → has_type(tm, ty) && (∀ sigma : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, type_valuation(tau) && term_valuation(tau, sigma) → op_lt_colon(semantics(sigma, tau, tm), typeset(tau, ty)))"), t34))
}

///|
let semantics_typeset_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEMANTICS_TYPESET_INDUCT")

///|
/// `SEMANTICS_TYPESET_INDUCT`
pub fn semantics_typeset_induct() -> @kernel.Thm {
  semantics_typeset_induct_c.get()
}

///|
/// SEMANTICS_TYPESET
fn step_8() -> Unit raise {
  let t35 = @meson.meson_tac(@list.List([semantics_typeset_induct()]))
  semantics_typeset_c.set(@tactics.prove(@term_syntax.parse_term("∀ sigma : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, ∀ tm : Term, ∀ ty : Type, type_valuation(tau) && term_valuation(tau, sigma) && has_type(tm, ty) → op_lt_colon(semantics(sigma, tau, tm), typeset(tau, ty))"), t35))
}

///|
let semantics_typeset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEMANTICS_TYPESET")

///|
/// `SEMANTICS_TYPESET`
pub fn semantics_typeset() -> @kernel.Thm {
  semantics_typeset_c.get()
}

///|
/// SEMANTICS_EQUATION
fn step_9() -> Unit raise {
  let t37 = @simp.asm_simp_tac(@list.List([@modelset.apply_abstract(), typeset(), semantics_typeset(), @modelset.abstract_in_funspace(), @modelset.boolean_in_boolset()]))
  let t36 = @simp.rewrite_tac(@list.List([@syntax.equation(), semantics()]))
  let t38 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t36), t37)
  semantics_equation_c.set(@tactics.prove(@term_syntax.parse_term("∀ sigma : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, ∀ s : Term, ∀ t : Term, has_type(s, typeof_(s)) && has_type(t, typeof_(s)) && type_valuation(tau) && term_valuation(tau, sigma) → semantics(sigma, tau, op_eq_eq_eq(s, t)) == boolean(semantics(sigma, tau, s) == semantics(sigma, tau, t))"), t38))
}

///|
let semantics_equation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEMANTICS_EQUATION")

///|
/// `SEMANTICS_EQUATION`
pub fn semantics_equation() -> @kernel.Thm {
  semantics_equation_c.get()
}

///|
/// SEMANTICS_EQUATION_ALT
fn step_10() -> Unit raise {
  let t47 = @meson.meson_tac(@list.List([@syntax.welltyped(), @syntax.type_inj(), @syntax.welltyped_v1(), @syntax.welltyped_clauses()]))
  let t46 = @simp.rewrite_tac(@list.List([@syntax.equation(), @syntax.welltyped_clauses(), @syntax.typeof_(), @syntax.codomain()]))
  let t45 = @list.List([@meson.asm_meson_tac(@list.List([@syntax.welltyped()])), @tactics.all_tac])
  let t44 = @tactics.subgoal_then(@term_syntax.parse_term("welltyped(op_eq_eq_eq((s : Term), (t : Term)))"), fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s42 = @tactics.mp_tac(x41)
    fn(x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s42(x43)
    }
  })
  let t40 = @simp.asm_rewrite_tac(@list.List([]))
  let t39 = @tactics.match_mp_tac(semantics_equation())
  let t48 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t39), t40), t44), t45), t46), t47)
  semantics_equation_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ sigma : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, ∀ s : Term, ∀ t : Term, has_type(op_eq_eq_eq(s, t), Bool) && type_valuation(tau) && term_valuation(tau, sigma) → semantics(sigma, tau, op_eq_eq_eq(s, t)) == boolean(semantics(sigma, tau, s) == semantics(sigma, tau, t))"), t48))
}

///|
let semantics_equation_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEMANTICS_EQUATION_ALT")

///|
/// `SEMANTICS_EQUATION_ALT`
pub fn semantics_equation_alt() -> @kernel.Thm {
  semantics_equation_alt_c.get()
}

///|
/// SEMANTICS_SELECT
fn step_11() -> Unit raise {
  let t63 = @simp.rewrite_tac(@list.List([]))
  let t62 = @tactics.disch_then(fn(x59 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s60 = @tactics.subst1_tac(x59)
    fn(x61 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s60(x61)
    }
  })
  let t56 = @meson.asm_meson_tac(@list.List([@modelset.ch(), @modelset.suchthat(), typeset_inhabited()]))
  let t57 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@modelset.suchthat()])), t56)
  let t58 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([semantics_typeset(), typeset()])), t57])), @tactics.all_tac])
  let t49 = @simp.rewrite_tac(@list.List([semantics()]))
  let t64 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t49), fn(x55 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x50 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x50
      let t_1 = @basics.find_term(fn(x52 : @kernel.Term) -> Bool raise {
        let t = x52
        @lib.can(@drule.part_match(fn(x53 : @kernel.Term) -> @kernel.Term raise {
          @equal.lhs(@kernel.rand(x53))
        }, @modelset.apply_abstract()), t)
      }, w)
      @tactics.mp_tac(@drule.part_match(fn(x54 : @kernel.Term) -> @kernel.Term raise {
        @equal.lhs(@kernel.rand(x54))
      }, @modelset.apply_abstract())(t_1))
    })(x55)(x55)
  }), @tactics.ants_tac), t58), t62), t63)
  semantics_select_c.set(@tactics.prove(@term_syntax.parse_term("has_type((p : Term), Fun((ty : Type), Bool)) && type_valuation((tau : (List[Char]) -> V)) && term_valuation(tau, (sigma : ((List[Char], Type)) -> V)) → semantics(sigma, tau, Comb(Select(ty), p)) == (if (∃ x : V, op_lt_colon(x, suchthat(typeset(tau, ty), holds(semantics(sigma, tau, p))))) { ch(suchthat(typeset(tau, ty), holds(semantics(sigma, tau, p)))) } else { ch(typeset(tau, ty)) })"), t64))
}

///|
let semantics_select_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEMANTICS_SELECT")

///|
/// `SEMANTICS_SELECT`
pub fn semantics_select() -> @kernel.Thm {
  semantics_select_c.get()
}

///|
/// Model/semantics.ml:150
fn step_12() -> Unit raise {
  @printer.parse_as_infix("|=", (11L, "right"))
}

///|
/// sequent
fn step_13() -> Unit raise {
  sequent_c.set(@pair.new_definition(@term_syntax.parse_term("(op_bar_eq : (List[Term], Term) -> Bool)((asms : List[Term]), (p : Term)) == (ALL((a : Term) => has_type(a, Bool), CONS(p, asms)) && (∀ sigma : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, type_valuation(tau) && term_valuation(tau, sigma) && ALL((a : Term) => semantics(sigma, tau, a) == True, asms) → semantics(sigma, tau, p) == True))")))
}

///|
let sequent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sequent")

///|
/// `sequent`
pub fn sequent() -> @kernel.Thm {
  sequent_c.get()
}

///|
/// SEMANTICS_RACONV
fn step_14() -> Unit raise {
  let t90 = @meson.asm_meson_tac(@list.List([]))
  let t89 = @simp.asm_simp_tac(@list.List([@modelset.valmod_v1(), @pair.pair_eq()]))
  let t88 = @tactics.repeat_tac(@tactics.strip_tac)
  let t87 = @simp.rewrite_tac(@list.List([@syntax.alphavars(), @pair.pair_eq(), @syntax.term_inj()]))
  let t86 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t85 = @tactics.first_x_assum(fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x83
    @tactics.then_tac(@tactics.match_mp_tac(th), @tactics.conj_tac)
  })
  let t82 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp()])))
  let t79 = @simp.asm_simp_tac(@list.List([term_valuation_valmod(), @equal.gsym(@syntax.welltyped_v1())]))
  let t80 = @tactics.then_tac(@tactics.match_mp_tac(semantics_typeset()), t79)
  let t78 = @simp.asm_simp_tac(@list.List([term_valuation_valmod(), @equal.gsym(@syntax.welltyped_v1())]))
  let t81 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(semantics_typeset()), t78), t80, @tactics.all_tac])
  let t77 = @tactics.repeat_tac(@tactics.conj_tac)
  let t76 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : V)"))
  let t75 = @simp.asm_simp_tac(@list.List([typeset_inhabited()]))
  let t74 = @tactics.match_mp_tac(@modelset.abstract_eq())
  let t73 = @tactics.first_x_assum(fn(x70 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s71 = @tactics.subst_all_tac(x70)
    fn(x72 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s71(x72)
    }
  })
  let t68 = @tactics.then_tac(@tactics.binop_tac, @meson.asm_meson_tac(@list.List([])))
  let t69 = @list.List([@meson.asm_meson_tac(@list.List([])), t68, @tactics.all_tac])
  let t67 = @tactics.repeat_tac(@tactics.strip_tac)
  let t66 = @simp.rewrite_tac(@list.List([semantics(), @syntax.welltyped_clauses()]))
  let t65 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t91 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@syntax.raconv_induct()), t65), t66), t67), t69), t73), t74), t75), t76), @tactics.disch_tac), t77), t81), t82), t85), t86), t87), t88), t89), t90)
  semantics_raconv_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Term, Term)], ∀ tp : (Term, Term), RACONV(env, tp) → (∀ sigma1 : ((List[Char], Type)) -> V, ∀ sigma2 : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, type_valuation(tau) && term_valuation(tau, sigma1) && term_valuation(tau, sigma2) && (∀ x1 : List[Char], ∀ ty1 : Type, ∀ x2 : List[Char], ∀ ty2 : Type, ALPHAVARS(env, (Var(x1, ty1), Var(x2, ty2))) → semantics(sigma1, tau, Var(x1, ty1)) == semantics(sigma2, tau, Var(x2, ty2))) → welltyped(FST(tp)) && welltyped(SND(tp)) → semantics(sigma1, tau, FST(tp)) == semantics(sigma2, tau, SND(tp)))"), t91))
}

///|
let semantics_raconv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEMANTICS_RACONV")

///|
/// `SEMANTICS_RACONV`
pub fn semantics_raconv() -> @kernel.Thm {
  semantics_raconv_c.get()
}

///|
/// SEMANTICS_ACONV
fn step_15() -> Unit raise {
  let t95 = @simp.asm_simp_tac(@list.List([@syntax.alphavars(), @syntax.term_inj(), @pair.pair_eq()]))
  let t94 = @tactics.exists_tac(@term_syntax.parse_term("(NIL : List[(Term, Term)])"))
  let t93 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_imp(), @theorems.right_imp_forall_thm(), @pair.forall_pair_thm()]))(semantics_raconv()))
  let t92 = @tactics.repeat_tac(@tactics.strip_tac)
  let t96 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@syntax.aconv()])), t92), t93), t94), t95)
  semantics_aconv_c.set(@tactics.prove(@term_syntax.parse_term("∀ sigma : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, ∀ s : Term, ∀ t : Term, type_valuation(tau) && term_valuation(tau, sigma) && welltyped(s) && welltyped(t) && ACONV(s, t) → semantics(sigma, tau, s) == semantics(sigma, tau, t)"), t96))
}

///|
let semantics_aconv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEMANTICS_ACONV")

///|
/// `SEMANTICS_ACONV`
pub fn semantics_aconv() -> @kernel.Thm {
  semantics_aconv_c.get()
}

///|
/// BINARY_INFERENCE_RULE
fn step_16() -> Unit raise {
  let t145 = @meson.asm_meson_tac(@list.List([semantics_aconv(), @syntax.welltyped(), @syntax.term_union_nonew()]))
  let t144 = @simp.asm_rewrite_tac(@list.List([]))
  let t140 = @term_syntax.parse_term("(s : Term)")
  let t143 = @tactics.disch_then(fn(x142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s138 = @tactics.mp_tac(x137)
      fn(x139 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s138(x139)
      }
    })(((x141 : @kernel.Thm) => @bool.spec(t140, x141))(x142))
  })
  let t134 = @term_syntax.parse_term("(s : Term)")
  let t136 = @tactics.disch_then((x135 : @kernel.Thm) => @tactics.x_choose_tac(t134, x135))
  let t133 = @simp.asm_rewrite_tac(@list.List([]))
  let t130 = @term_syntax.parse_term("(r : Term)")
  let t131 = @term_syntax.parse_term("(asl2 : List[Term])")
  let t132 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(asl1 : List[Term])"), t131, t130]), @syntax.term_union_thm()))
  let t129 = @tactics.disch_then(fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x126
    let t128 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(r : Term)")), @tactics.disch_tac), t128)
  })
  let t125 = @simp.rewrite_tac(@list.List([]))
  let t122 = @simp.gen_rewrite_rule(fn(x121 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x121
  }, @list.List([@equal.gsym(@lists.all_mem())]))
  let t124 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s119 = @tactics.mp_tac(x118)
      fn(x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s119(x120)
      }
    })(t122(x123))
  }))
  let t117 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t116 = @tactics.undisch_tac(@term_syntax.parse_term("ALL((a : Term) => semantics((sigma : ((List[Char], Type)) -> V), (tau : (List[Char]) -> V), a) == True, TERM_UNION((asl1 : List[Term]), (asl2 : List[Term])))"))
  let t115 = @simp.asm_rewrite_tac(@list.List([]))
  let t114 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t113 = @simp.asm_rewrite_tac(@list.List([]))
  let t112 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x109 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s110 = @tactics.assume_tac(x109)
    fn(x111 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s110(x111)
    }
  }, @tactics.match_mp_tac))
  let t108 = @simp.asm_rewrite_tac(@list.List([]))
  let t107 = @tactics.first_x_assum(fn(x106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x99 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s100 = @tactics.mp_tac(x99)
      fn(x101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s100(x101)
      }
    })(((x105 : @kernel.Thm) => @lib.check(fn(x104 : @kernel.Thm) -> Bool raise {
      (fn(x102 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x102)
      })((fn(x103 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x103)
      })(x104))
    }, x105))(x106))
  })
  let t98 = @tactics.repeat_tac(@tactics.strip_tac)
  let t97 = @simp.asm_simp_tac(@list.List([@syntax.all_bool_term_union()]))
  let t146 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([sequent(), @lists.all()])), @tactics.strip_tac), @tactics.strip_tac), t97), t98), t107), t108), t112), t113), @tactics.conj_tac), t114), t115), t116), t117), t124), t125), @tactics.strip_tac), @tactics.strip_tac), t129), t132), t133), t136), t143), t144), t145)
  binary_inference_rule_c.set(@tactics.prove(@term_syntax.parse_term("(has_type((p1 : Term), Bool) && has_type((p2 : Term), Bool) → has_type((q : Term), Bool) && (∀ sigma : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, type_valuation(tau) && term_valuation(tau, sigma) && semantics(sigma, tau, p1) == True && semantics(sigma, tau, p2) == True → semantics(sigma, tau, q) == True)) → op_bar_eq((asl1 : List[Term]), p1) && op_bar_eq((asl2 : List[Term]), p2) → op_bar_eq(TERM_UNION(asl1, asl2), q)"), t146))
}

///|
let binary_inference_rule_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BINARY_INFERENCE_RULE")

///|
/// `BINARY_INFERENCE_RULE`
pub fn binary_inference_rule() -> @kernel.Thm {
  binary_inference_rule_c.get()
}

///|
/// TERM_VALUATION_VFREE_IN
fn step_17() -> Unit raise {
  let t167 = @meson.asm_meson_tac(@list.List([]))
  let t166 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1(), @pair.pair_eq()]))
  let t164 = @term_syntax.parse_term("(ty : Type)")
  let t165 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : List[Char])"), t164]))
  let t163 = @list.List([@meson.asm_meson_tac(@list.List([@syntax.welltyped_clauses()])), @tactics.all_tac])
  let t162 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t161 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t160 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([term_valuation_valmod(), @syntax.welltyped_v1(), @syntax.welltyped_clauses(), semantics_typeset()])), @tactics.all_tac])))
  let t159 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : V)"))
  let t158 = @simp.asm_simp_tac(@list.List([typeset_inhabited()]))
  let t157 = @tactics.match_mp_tac(@modelset.abstract_eq())
  let t155 = @tactics.then_tac(@tactics.binop_tac, @meson.asm_meson_tac(@list.List([@syntax.welltyped_clauses()])))
  let t156 = @list.List([@meson.asm_meson_tac(@list.List([])), t155, @tactics.all_tac])
  let t154 = @tactics.repeat_tac(@tactics.strip_tac)
  let t153 = @simp.rewrite_tac(@list.List([semantics(), @syntax.vfree_in(), @syntax.term_distinct(), @syntax.term_inj()]))
  let t152 = @tactics.match_mp_tac(@syntax.term_induct())
  let t151 = @simp.gen_rewrite_tac(fn(x150 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x150
  }, @list.List([@theorems.swap_forall_thm()]))
  let t168 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.gen_rewrite_tac(fn(x147 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s148 = @equal.binder_conv(x147)
    fn(x149 : @kernel.Term) -> @kernel.Thm raise {
      s148(x149)
    }
  }, @list.List([@theorems.swap_forall_thm()]))), t151), t152), t153), t154), t156), t157), t158), t159), @tactics.disch_tac), t160), t161), t162), @tactics.conj_tac), t163), t165), @tactics.disch_tac), t166), t167)
  term_valuation_vfree_in_c.set(@tactics.prove(@term_syntax.parse_term("∀ tau : (List[Char]) -> V, ∀ sigma1 : ((List[Char], Type)) -> V, ∀ sigma2 : ((List[Char], Type)) -> V, ∀ t : Term, type_valuation(tau) && term_valuation(tau, sigma1) && term_valuation(tau, sigma2) && welltyped(t) && (∀ x : List[Char], ∀ ty : Type, VFREE_IN(Var(x, ty), t) → sigma1((x, ty)) == sigma2((x, ty))) → semantics(sigma1, tau, t) == semantics(sigma2, tau, t)"), t168))
}

///|
let term_valuation_vfree_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERM_VALUATION_VFREE_IN")

///|
/// `TERM_VALUATION_VFREE_IN`
pub fn term_valuation_vfree_in() -> @kernel.Thm {
  term_valuation_vfree_in_c.get()
}

///|
/// ASSUME_correct
fn step_18() -> Unit raise {
  let t169 = @simp.simp_tac(@list.List([sequent(), @lists.all()]))
  assume_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Term, has_type(p, Bool) → op_bar_eq([p], p)"), t169))
}

///|
let assume_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ASSUME_correct")

///|
/// `ASSUME_correct`
pub fn assume_correct() -> @kernel.Thm {
  assume_correct_c.get()
}

///|
/// REFL_correct
fn step_19() -> Unit raise {
  let t171 = @meson.meson_tac(@list.List([@syntax.has_type_rules()]))
  let t170 = @simp.rewrite_tac(@list.List([@modelset.boolean(), @syntax.equation()]))
  let t172 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([sequent(), semantics_equation(), @lists.all(), @syntax.welltyped_v1()])), t170), t171)
  refl_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, welltyped(t) → op_bar_eq(NIL, op_eq_eq_eq(t, t))"), t172))
}

///|
let refl_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REFL_correct")

///|
/// `REFL_correct`
pub fn refl_correct() -> @kernel.Thm {
  refl_correct_c.get()
}

///|
/// TRANS_correct
fn step_20() -> Unit raise {
  let t183 = @meson.asm_meson_tac(@list.List([semantics_aconv(), @modelset.true_ne_false(), @syntax.equation_has_type_bool()]))
  let t184 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([semantics_equation_alt(), @theorems.imp_conj(), @modelset.boolean()])), t183)
  let t185 = @list.List([@meson.asm_meson_tac(@list.List([@syntax.equation_has_type_bool(), @syntax.aconv_type()])), t184])
  let t182 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t181 = @tactics.match_mp_tac(binary_inference_rule())
  let t180 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x174 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s175 = @tactics.mp_tac(x174)
    fn(x176 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s175(x176)
    }
  }, fn(x177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s178 = @tactics.assume_tac(x177)
    fn(x179 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s178(x179)
    }
  }))
  let t173 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t186 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t173), t180), t181), @tactics.strip_tac), t182), @tactics.conj_tac), t185)
  trans_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ asl1 : List[Term], ∀ asl2 : List[Term], ∀ l : Term, ∀ m1 : Term, ∀ m2 : Term, ∀ r : Term, op_bar_eq(asl1, op_eq_eq_eq(l, m1)) && op_bar_eq(asl2, op_eq_eq_eq(m2, r)) && ACONV(m1, m2) → op_bar_eq(TERM_UNION(asl1, asl2), op_eq_eq_eq(l, r))"), t186))
}

///|
let trans_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRANS_correct")

///|
/// `TRANS_correct`
pub fn trans_correct() -> @kernel.Thm {
  trans_correct_c.get()
}

///|
/// MK_COMB_correct
fn step_21() -> Unit raise {
  let t205 = @meson.asm_meson_tac(@list.List([semantics_aconv(), @modelset.true_ne_false(), @syntax.equation_has_type_bool()]))
  let t204 = @simp.rewrite_tac(@list.List([semantics()]))
  let t206 = @tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([semantics_equation_alt(), @theorems.imp_conj(), @modelset.boolean()])), t204), t205)
  let t203 = @meson.meson_tac(@list.List([@syntax.codomain()]))
  let t202 = @simp.rewrite_tac(@list.List([@syntax.equation_has_type_bool(), @syntax.welltyped_clauses(), @syntax.typeof_()]))
  let t207 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum_list(fn(x201 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x197 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s198 = @tactics.mp_tac(x197)
      fn(x199 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s198(x199)
      }
    })(((x200 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x200))(x201))
  }), t202), t203), t206])
  let t196 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t195 = @tactics.match_mp_tac(binary_inference_rule())
  let t194 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s189 = @tactics.mp_tac(x188)
    fn(x190 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s189(x190)
    }
  }, fn(x191 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s192 = @tactics.assume_tac(x191)
    fn(x193 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s192(x193)
    }
  }))
  let t187 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t208 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t187), t194), t195), @tactics.strip_tac), t196), @tactics.conj_tac), t207)
  mk_comb_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ asl1 : List[Term], ∀ l1 : Term, ∀ r1 : Term, ∀ asl2 : List[Term], ∀ l2 : Term, ∀ r2 : Term, op_bar_eq(asl1, op_eq_eq_eq(l1, r1)) && op_bar_eq(asl2, op_eq_eq_eq(l2, r2)) && (∃ rty : Type, typeof_(l1) == Fun(typeof_(l2), rty)) → op_bar_eq(TERM_UNION(asl1, asl2), op_eq_eq_eq(Comb(l1, l2), Comb(r1, r2)))"), t208))
}

///|
let mk_comb_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MK_COMB_correct")

///|
/// `MK_COMB_correct`
pub fn mk_comb_correct() -> @kernel.Thm {
  mk_comb_correct_c.get()
}

///|
/// EQ_MP_correct
fn step_22() -> Unit raise {
  let t219 = @meson.asm_meson_tac(@list.List([@syntax.equation_has_type_bool(), @modelset.true_ne_false(), semantics_aconv(), @syntax.welltyped()]))
  let t220 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([semantics_equation_alt(), @theorems.imp_conj(), @modelset.boolean()])), t219)
  let t221 = @list.List([@meson.asm_meson_tac(@list.List([@syntax.equation_has_type_bool(), @syntax.welltyped_lemma(), @syntax.welltyped_v1(), @syntax.aconv_type()])), t220])
  let t218 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t217 = @tactics.match_mp_tac(binary_inference_rule())
  let t216 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s211 = @tactics.mp_tac(x210)
    fn(x212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s211(x212)
    }
  }, fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s214 = @tactics.assume_tac(x213)
    fn(x215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s214(x215)
    }
  }))
  let t209 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t222 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t209), t216), t217), @tactics.strip_tac), t218), @tactics.conj_tac), t221)
  eq_mp_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ asl1 : List[Term], ∀ asl2 : List[Term], ∀ p : Term, ∀ q : Term, ∀ p' : Term, op_bar_eq(asl1, op_eq_eq_eq(p, q)) && op_bar_eq(asl2, p') && ACONV(p, p') → op_bar_eq(TERM_UNION(asl1, asl2), q)"), t222))
}

///|
let eq_mp_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_MP_correct")

///|
/// `EQ_MP_correct`
pub fn eq_mp_correct() -> @kernel.Thm {
  eq_mp_correct_c.get()
}

///|
/// BETA_correct
fn step_23() -> Unit raise {
  let t235 = @meson.asm_meson_tac(@list.List([term_valuation(), semantics_typeset(), @syntax.welltyped_v1()]))
  let t234 = @simp.rewrite_tac(@list.List([@modelset.valmod_repeat()]))
  let t233 = @list.List([@tactics.match_mp_tac(@modelset.apply_abstract()), @tactics.all_tac])
  let t232 = @tactics.exists_tac(@term_syntax.parse_term("semantics(op_bar_minus_gt(((x : List[Char]), (ty : Type)), (sigma : ((List[Char], Type)) -> V)((x, ty)), sigma), (tau : (List[Char]) -> V), (t : Term))"))
  let t231 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t230 = @simp.rewrite_tac(@list.List([@modelset.boolean_eq_true(), semantics()]))
  let t229 = @tactics.repeat_tac(@tactics.gen_tac)
  let t228 = @simp.simp_tac(@list.List([semantics_equation_alt()]))
  let t226 = @meson.asm_meson_tac(@list.List([]))
  let t225 = @simp.rewrite_tac(@list.List([@syntax.codomain(), @syntax.type_inj()]))
  let t227 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@syntax.equation_has_type_bool(), @syntax.typeof_(), @syntax.welltyped_clauses()])), t225), t226), @tactics.all_tac])
  let t224 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t223 = @simp.rewrite_tac(@list.List([sequent(), @lists.all()]))
  let t236 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t223), t224), @tactics.conj_tac), t227), t228), @tactics.disch_tac), t229), @tactics.strip_tac), t230), t231), t232), @tactics.conj_tac), t233), t234), t235)
  beta_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : List[Char], ∀ ty : Type, ∀ t : Term, welltyped(t) → op_bar_eq(NIL, op_eq_eq_eq(Comb(Abs(x, ty, t), Var(x, ty)), t))"), t236))
}

///|
let beta_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BETA_correct")

///|
/// `BETA_correct`
pub fn beta_correct() -> @kernel.Thm {
  beta_correct_c.get()
}

///|
/// ABS_correct
fn step_24() -> Unit raise {
  let t295 = @meson.asm_meson_tac(@list.List([]))
  let t294 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1(), @pair.pair_eq()]))
  let t293 = @tactics.repeat_tac(@tactics.strip_tac)
  let t292 = @list.List([@meson.asm_meson_tac(@list.List([@syntax.welltyped()])), @tactics.all_tac])
  let t291 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t290 = @tactics.match_mp_tac(term_valuation_vfree_in())
  let t289 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x282 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s283 = @tactics.assume_tac(x282)
    fn(x284 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s283(x284)
    }
  }, fn(x288 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x285 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s286 = @tactics.subst1_tac(x285)
      fn(x287 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s286(x287)
      }
    })(@equal.sym(x288))
  }))
  let t281 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x275 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s276 = @tactics.assume_tac(x275)
    fn(x277 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s276(x277)
    }
  }, fn(x278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s279 = @tactics.mp_tac(x278)
    fn(x280 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s279(x280)
    }
  }))
  let t274 = @simp.rewrite_tac(@list.List([]))
  let t273 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Term)"))
  let t272 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@lists.all_imp()))
  let t271 = @simp.rewrite_tac(@list.List([@lists.and_all()]))
  let t270 = @list.List([@simp.asm_rewrite_tac(@list.List([@equal.gsym(@lists.not_ex()), @class.eta_ax()])), @tactics.all_tac])
  let t269 = @tactics.subgoal_then(@term_syntax.parse_term("ALL((a : Term) => has_type(a, Bool), (asl : List[Term])) && ALL((a : Term) => !VFREE_IN(Var((x : List[Char]), (ty : Type)), a), asl) && ALL((a : Term) => semantics((sigma : ((List[Char], Type)) -> V), (tau : (List[Char]) -> V), a) == True, asl)"), fn(x266 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s267 = @tactics.mp_tac(x266)
    fn(x268 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s267(x268)
    }
  })
  let t265 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t264 = @tactics.disch_then(@tactics.match_mp_tac)
  let t263 = @simp.asm_simp_tac(@list.List([semantics_equation_alt(), @modelset.boolean_eq_true()]))
  let t262 = @tactics.first_x_assum(fn(x261 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s255 = @tactics.mp_tac(x254)
      fn(x256 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s255(x256)
      }
    })(((x260 : @kernel.Thm) => @lib.check(fn(x259 : @kernel.Thm) -> Bool raise {
      (fn(x257 : @kernel.Term) -> Bool raise {
        @basics.is_forall(x257)
      })((fn(x258 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x258)
      })(x259))
    }, x260))(x261))
  })
  let t253 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([semantics_typeset(), term_valuation_valmod(), @syntax.welltyped_v1(), @syntax.equation_has_type_bool()])), @tactics.all_tac])))
  let t252 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : V)"))
  let t251 = @simp.asm_simp_tac(@list.List([typeset_inhabited()]))
  let t250 = @tactics.match_mp_tac(@modelset.abstract_eq())
  let t249 = @list.List([@meson.asm_meson_tac(@list.List([@syntax.equation_has_type_bool()])), @tactics.all_tac])
  let t248 = @tactics.subgoal_then(@term_syntax.parse_term("typeof_((r : Term)) == typeof_((l : Term))"), fn(x245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s246 = @tactics.subst1_tac(x245)
    fn(x247 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s246(x247)
    }
  })
  let t244 = @simp.rewrite_tac(@list.List([semantics()]))
  let t243 = @tactics.repeat_tac(@tactics.strip_tac)
  let t242 = @simp.asm_simp_tac(@list.List([semantics_equation_alt(), @modelset.boolean_eq_true()]))
  let t240 = @simp.simp_tac(@list.List([@syntax.equation_has_type_bool(), @syntax.welltyped_clauses(), @syntax.typeof_()]))
  let t241 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("has_type(op_eq_eq_eq((l : Term), (r : Term)), Bool)")), t240), @tactics.all_tac])
  let t239 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t238 = @simp.asm_rewrite_tac(@list.List([]))
  let t237 = @simp.rewrite_tac(@list.List([sequent(), @lists.all()]))
  let t296 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t237), @tactics.strip_tac), t238), t239), @tactics.conj_tac), t241), @tactics.disch_tac), t242), t243), t244), t248), t249), t250), t251), t252), @tactics.disch_tac), t253), t262), t263), t264), t265), t269), t270), t271), t272), t273), @tactics.disch_tac), t274), t281), t289), t290), t291), @tactics.conj_tac), t292), t293), t294), t295)
  abs_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ asl : List[Term], ∀ x : List[Char], ∀ ty : Type, ∀ l : Term, ∀ r : Term, !EX(VFREE_IN(Var(x, ty)), asl) && op_bar_eq(asl, op_eq_eq_eq(l, r)) → op_bar_eq(asl, op_eq_eq_eq(Abs(x, ty, l), Abs(x, ty, r)))"), t296))
}

///|
let abs_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ABS_correct")

///|
/// `ABS_correct`
pub fn abs_correct() -> @kernel.Thm {
  abs_correct_c.get()
}

///|
/// DEDUCT_ANTISYM_RULE_correct
fn step_25() -> Unit raise {
  let t330 = @meson.asm_meson_tac(@list.List([semantics_aconv(), @syntax.welltyped()]))
  let t327 = @drule.match_mp(@syntax.term_union_thm())
  let t329 = @tactics.disch_then(fn(x328 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s325 = @tactics.mp_tac(x324)
      fn(x326 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s325(x326)
      }
    })(t327(x328))
  })
  let t322 = @simp.asm_rewrite_tac(@list.List([]))
  let t323 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.mem_filter()])), t322), @tactics.all_tac])
  let t331 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("MEM((a : Term), FILTER((x : Term) => !ACONV((c2 : Term), x), (asl1 : List[Term]))) || MEM(a, FILTER((x : Term) => !ACONV((c1 : Term), x), (asl2 : List[Term])))"), fn(x319 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s320 = @tactics.mp_tac(x319)
    fn(x321 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s320(x321)
    }
  }), t323), t329), t330)
  let t316 = @list.List([@meson.asm_meson_tac(@list.List([semantics_aconv(), @syntax.welltyped()])), @tactics.all_tac])
  let t317 = @tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("ACONV((c2 : Term), (a : Term))")), t316)
  let t315 = @list.List([@meson.asm_meson_tac(@list.List([semantics_aconv(), @syntax.welltyped()])), @tactics.all_tac])
  let t318 = @list.List([@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("ACONV((c1 : Term), (a : Term))")), t315), t317])
  let t314 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Term)"))
  let t313 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t312 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([typeset(), semantics_typeset()])), @tactics.all_tac])))
  let t311 = @tactics.match_mp_tac(@modelset.boolean_eq())
  let t310 = @tactics.repeat_tac(@tactics.strip_tac)
  let t309 = @simp.asm_simp_tac(@list.List([semantics_equation_alt(), @modelset.boolean_eq_true()]))
  let t308 = @tactics.disch_then(fn(x306 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x306
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t305 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t304 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t303 = @simp.rewrite_tac(@list.List([@lists.all(), @theorems.and_forall_thm()]))
  let t301 = @meson.asm_meson_tac(@list.List([@lists.mem_filter(), @syntax.term_union_nonew(), @syntax.welltyped(), @syntax.welltyped_lemma()]))
  let t300 = @simp.asm_rewrite_tac(@list.List([@syntax.equation_has_type_bool()]))
  let t299 = @tactics.repeat_tac(@tactics.strip_tac)
  let t302 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem()), @lists.mem()])), t299), t300), t301), @tactics.all_tac])
  let t298 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a1 : Bool) && (b1 : Bool) → (c1 : Bool)) && (a1 && b1 && c1 → (a2 : Bool) && (b2 : Bool) → (c2 : Bool)) → a1 && a2 && b1 && b2 → c1 && c2")))
  let t297 = @simp.rewrite_tac(@list.List([sequent(), @trivia.o_def(), @pair.let_def(), @pair.let_end_def(), @equal.gsym(@theorems.conj_assoc())]))
  let t332 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t297), t298), @tactics.conj_tac), t302), t303), t304), @tactics.strip_tac), t305), t308), t309), t310), t311), t312), @tactics.eq_tac), @tactics.disch_tac), t313), t314), @tactics.disch_tac), t318), t331)
  deduct_antisym_rule_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ asl1 : List[Term], ∀ asl2 : List[Term], ∀ p : _, ∀ q : _, op_bar_eq(asl1, (c1 : Term)) && op_bar_eq(asl2, (c2 : Term)) → LET((asl1' : List[Term]) => (asl2' : List[Term]) => LET_END(op_bar_eq(TERM_UNION(asl1', asl2'), op_eq_eq_eq(c1, c2))), FILTER(o(op_tilde, ACONV(c2)), asl1), FILTER(o(op_tilde, ACONV(c1)), asl2))"), t332))
}

///|
let deduct_antisym_rule_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEDUCT_ANTISYM_RULE_correct")

///|
/// `DEDUCT_ANTISYM_RULE_correct`
pub fn deduct_antisym_rule_correct() -> @kernel.Thm {
  deduct_antisym_rule_correct_c.get()
}

///|
/// DEST_VAR
fn step_26() -> Unit raise {
  let t333 = @term_syntax.parse_term("(DEST_VAR : (Term) -> (List[Char], Type))(Var((x : List[Char]), (ty : Type))) == (x, ty)")
  dest_var_c.set(@recursion.new_recursive_definition(@syntax.term_recursion())(t333))
}

///|
let dest_var_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEST_VAR")

///|
/// `DEST_VAR`
pub fn dest_var() -> @kernel.Thm {
  dest_var_c.get()
}

///|
/// TERM_VALUATION_ITLIST
fn step_27() -> Unit raise {
  let t342 = @simp.asm_simp_tac(@list.List([term_valuation_valmod(), semantics_typeset()]))
  let t341 = @simp.asm_rewrite_tac(@list.List([dest_var()]))
  let t340 = @tactics.repeat_tac(@tactics.strip_tac)
  let t339 = @simp.rewrite_tac(@list.List([@theorems.left_exists_and_thm(), @theorems.exists_refl()]))
  let t338 = @simp.simp_tac(@list.List([@theorems.left_forall_imp_thm(), @theorems.forall_and_thm()]))
  let t337 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t336 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t335 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), @lists.mem(), @pair.pair_eq()]))
  let t334 = @simp.simp_tac(@list.List([@lists.itlist()]))
  let t343 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t334), t335), t336), t337), t338), t339), t340), t341), t342)
  term_valuation_itlist_c.set(@tactics.prove(@term_syntax.parse_term("∀ ilist : List[(Term, Term)], ∀ sigma : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, type_valuation(tau) && term_valuation(tau, sigma) && (∀ s : Term, ∀ s' : Term, MEM((s', s), ilist) → (∃ x : List[Char], ∃ ty : Type, s == Var(x, ty) && has_type(s', ty))) → term_valuation(tau, ITLIST(GABS((f : ((Term, Term), ((List[Char], Type)) -> V, (List[Char], Type)) -> V) => ∀ t : Term, ∀ x : Term, GEQ(f((t, x)), op_bar_minus_gt(DEST_VAR(x), semantics(sigma, tau, t)))), ilist, sigma))"), t343))
}

///|
let term_valuation_itlist_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERM_VALUATION_ITLIST")

///|
/// `TERM_VALUATION_ITLIST`
pub fn term_valuation_itlist() -> @kernel.Thm {
  term_valuation_itlist_c.get()
}

///|
/// ITLIST_VALMOD_FILTER
fn step_28() -> Unit raise {
  let t407 = @simp.asm_rewrite_tac(@list.List([]))
  let t406 = @simp.asm_simp_tac(@list.List([@pair.pair_eq()]))
  let t405 = @class.asm_cases_tac(@term_syntax.parse_term("(s : List[Char]) == (x : List[Char]) && (sty : Type) == (ty : Type)"))
  let t404 = @simp.rewrite_tac(@list.List([@syntax.term_inj()]))
  let t403 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1()]))
  let t402 = @simp.gen_rewrite_tac(fn(x401 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x395 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s396 = @equal.land_conv(x395)
      fn(x397 : @kernel.Term) -> @kernel.Thm raise {
        s396(x397)
      }
    })((fn(x398 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s399 = @equal.once_depth_conv(x398)
      fn(x400 : @kernel.Term) -> @kernel.Thm raise {
        s399(x400)
      }
    })(x401))
  }, @list.List([@class.cond_rator()]))
  let t394 = @simp.rewrite_tac(@list.List([dest_var()]))
  let t393 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t392 = @simp.asm_rewrite_tac(@list.List([@lists.itlist()]))
  let t391 = @simp.gen_rewrite_tac(fn(x390 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x384 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s385 = @equal.land_conv(x384)
      fn(x386 : @kernel.Term) -> @kernel.Thm raise {
        s385(x386)
      }
    })((fn(x387 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s388 = @equal.once_depth_conv(x387)
      fn(x389 : @kernel.Term) -> @kernel.Thm raise {
        s388(x389)
      }
    })(x390))
  }, @list.List([@class.cond_rator()]))
  let t383 = @simp.gen_rewrite_tac(fn(x382 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x376 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s377 = @equal.land_conv(x376)
      fn(x378 : @kernel.Term) -> @kernel.Thm raise {
        s377(x378)
      }
    })((fn(x379 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s380 = @equal.once_depth_conv(x379)
      fn(x381 : @kernel.Term) -> @kernel.Thm raise {
        s380(x381)
      }
    })(x382))
  }, @list.List([@class.cond_rand()]))
  let t375 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x369 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s370 = @tactics.subst_all_tac(x369)
    fn(x371 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s370(x371)
    }
  }, fn(x372 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s373 = @tactics.assume_tac(x372)
    fn(x374 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s373(x374)
    }
  }))
  let t368 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(sty : Type)"))(fn(x365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s366 = @tactics.mp_tac(x365)
    fn(x367 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s366(x367)
    }
  }))
  let t364 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s : List[Char])"))(fn(x361 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s362 = @tactics.mp_tac(x361)
    fn(x363 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s362(x363)
    }
  }))
  let t360 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x354 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s355 = @tactics.mp_tac(x354)
    fn(x356 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s355(x356)
    }
  }, fn(x357 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s358 = @tactics.assume_tac(x357)
    fn(x359 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s358(x359)
    }
  }))
  let t353 = @tactics.repeat_tac(@tactics.gen_tac)
  let t350 = @term_syntax.parse_term("(ilist : List[(Term, Term)])")
  let t351 = @term_syntax.parse_term("(pp : Term)")
  let t352 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(t : Term)"), t351, t350]))
  let t349 = @simp.rewrite_tac(@list.List([@syntax.welltyped_clauses(), @theorems.left_exists_and_thm(), @theorems.exists_refl()]))
  let t348 = @simp.simp_tac(@list.List([@theorems.forall_and_thm(), @theorems.left_forall_imp_thm(), @pair.pair_eq()]))
  let t347 = @simp.rewrite_tac(@list.List([@lists.mem(), @class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t346 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t345 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t344 = @simp.rewrite_tac(@list.List([@lists.filter(), @lists.itlist(), @class.cond_id()]))
  let t408 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t344), t345), t346), t347), t348), t349), t352), @tactics.disch_tac), t353), t360), t364), t368), t375), t383), t391), t392), t393), t394), t402), t403), t404), t405), t406), @class.cond_cases_tac), t407)
  itlist_valmod_filter_c.set(@tactics.prove(@term_syntax.parse_term("∀ ilist : List[(Term, Term)], ∀ sigma : ((List[Char], Type)) -> _, ∀ sem : (Term, Term) -> _, ∀ x : List[Char], ∀ ty : Type, ∀ y : List[Char], ∀ yty : Type, (∀ s : Term, ∀ s' : Term, MEM((s', s), ilist) → (∃ x : List[Char], ∃ ty : Type, s == Var(x, ty) && has_type(s', ty))) → ITLIST(GABS((f : ((Term, Term), ((List[Char], Type)) -> _, (List[Char], Type)) -> _) => ∀ t : Term, ∀ x : Term, GEQ(f((t, x)), op_bar_minus_gt(DEST_VAR(x), sem(x, t)))), FILTER(GABS((f : ((Term, Term)) -> Bool) => ∀ s' : Term, ∀ s : Term, GEQ(f((s', s)), !(s == Var(x, ty)))), ilist), sigma, (y, yty)) == (if y == x && yty == ty { sigma((y, yty)) } else { ITLIST(GABS((f : ((Term, Term), ((List[Char], Type)) -> _, (List[Char], Type)) -> _) => ∀ t : Term, ∀ x : Term, GEQ(f((t, x)), op_bar_minus_gt(DEST_VAR(x), sem(x, t)))), ilist, sigma, (y, yty)) })"), t408))
}

///|
let itlist_valmod_filter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST_VALMOD_FILTER")

///|
/// `ITLIST_VALMOD_FILTER`
pub fn itlist_valmod_filter() -> @kernel.Thm {
  itlist_valmod_filter_c.get()
}

///|
/// ITLIST_VALMOD_EQ
fn step_29() -> Unit raise {
  let t412 = @meson.meson_tac(@list.List([]))
  let t411 = @simp.rewrite_tac(@list.List([@pair.pair_eq(), @modelset.valmod_v1()]))
  let t410 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t409 = @simp.simp_tac(@list.List([@lists.mem(), @lists.itlist(), @pair.forall_pair_thm()]))
  let t413 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t409), t410), t411), t412)
  itlist_valmod_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : List[(_, _)], (∀ t : _, ∀ x : _, MEM((t, x), l) && (f : (_) -> _)(x) == (a : _) → (g : (_, _) -> _)(x, t) == (h : (_, _) -> _)(x, t)) && (i : (_) -> _)(a) == (j : (_) -> _)(a) → ITLIST(fn { (t, x) => op_bar_minus_gt(f(x), g(x, t)) }, l, i, a) == ITLIST(fn { (t, x) => op_bar_minus_gt(f(x), h(x, t)) }, l, j, a)"), t413))
}

///|
let itlist_valmod_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST_VALMOD_EQ")

///|
/// `ITLIST_VALMOD_EQ`
pub fn itlist_valmod_eq() -> @kernel.Thm {
  itlist_valmod_eq_c.get()
}

///|
/// SEMANTICS_VSUBST
fn step_30() -> Unit raise {
  let t634 = @meson.asm_meson_tac(@list.List([@syntax.welltyped(), @syntax.term_inj()]))
  let t633 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t632 = @simp.asm_simp_tac(@list.List([term_valuation_valmod(), @modelset.valmod_v1()]))
  let t631 = @tactics.match_mp_tac(term_valuation_vfree_in())
  let t630 = @tactics.repeat_tac(@tactics.strip_tac)
  let t629 = @simp.asm_rewrite_tac(@list.List([]))
  let t628 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t627 = @tactics.subgoal_then(@term_syntax.parse_term("((v : List[Char]) == (u : List[Char]) && (vty : Type) == (uty : Type)) == (u == v && uty == vty)"), fn(x624 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s625 = @tactics.subst1_tac(x624)
    fn(x626 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s625(x626)
    }
  })
  let t623 = @simp.asm_rewrite_tac(@list.List([dest_var(), @syntax.term_inj(), @pair.pair_eq()]))
  let t622 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x616 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s617 = @tactics.subst_all_tac(x616)
    fn(x618 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s617(x618)
    }
  }, fn(x619 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s620 = @tactics.assume_tac(x619)
    fn(x621 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s620(x621)
    }
  }))
  let t615 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(vty : Type)"))(fn(x612 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s613 = @tactics.mp_tac(x612)
    fn(x614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s613(x614)
    }
  }))
  let t611 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(v : List[Char])"))(fn(x608 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s609 = @tactics.mp_tac(x608)
    fn(x610 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s609(x610)
    }
  }))
  let t607 = @tactics.disch_then(fn(x601 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x601
    let t606 = @tactics.mp_tac(th_1)
    @tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then(fn(x603 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s604 = @tactics.assume_tac(x603)
      fn(x605 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s604(x605)
      }
    })), t606)
  })
  let t598 = @term_syntax.parse_term("(i : List[(Term, Term)])")
  let t599 = @term_syntax.parse_term("(t2 : Term)")
  let t600 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(t1 : Term)"), t599, t598]))
  let t597 = @simp.rewrite_tac(@list.List([@syntax.welltyped_clauses(), @theorems.left_exists_and_thm(), @theorems.exists_refl()]))
  let t596 = @simp.simp_tac(@list.List([@theorems.forall_and_thm(), @theorems.left_forall_imp_thm(), @pair.pair_eq()]))
  let t595 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t594 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1(), @syntax.rev_assocd(), @lists.mem()]))
  let t593 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t592 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t591 = @simp.simp_tac(@list.List([@pair.pair_eq()]))
  let t590 = @simp.rewrite_tac(@list.List([@syntax.rev_assocd(), @lists.itlist(), @syntax.vfree_in(), @modelset.valmod_v1(), @syntax.term_inj()]))
  let t589 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t587 = @term_syntax.parse_term("(l : List[(Term, Term)])")
  let t588 = @tactics.spec_tac(@term_syntax.parse_term("(ilist : List[(Term, Term)])"), t587)
  let t586 = @tactics.undisch_tac(@term_syntax.parse_term("∀ s : Term, ∀ s' : Term, MEM((s', s), (ilist : List[(Term, Term)])) → (∃ x : List[Char], ∃ ty : Type, s == Var(x, ty) && has_type(s', ty))"))
  let t584 = @simp.asm_rewrite_tac(@list.List([@syntax.term_inj()]))
  let t583 = @simp.rewrite_tac(@list.List([@syntax.rev_assocd_filter()]))
  let t585 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("ilist'"), t583), t584), @tactics.all_tac])
  let t582 = @tactics.subgoal_then(@term_syntax.parse_term("REV_ASSOCD(Var((u : List[Char]), (uty : Type)), (ilist' : List[(Term, Term)]), Var(u, uty)) == REV_ASSOCD(Var(u, uty), (ilist : List[(Term, Term)]), Var(u, uty))"), fn(x579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s580 = @tactics.subst1_tac(x579)
    fn(x581 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s580(x581)
    }
  })
  let t578 = @simp.asm_rewrite_tac(@list.List([]))
  let t573 = @term_syntax.parse_term("(uty : Type)")
  let t574 = @list.List([@term_syntax.parse_term("(u : List[Char])"), t573])
  let t577 = @tactics.disch_then(fn(x576 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x570 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s571 = @tactics.mp_tac(x570)
      fn(x572 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s571(x572)
      }
    })(((x575 : @kernel.Thm) => @bool.specl(t574, x575))(x576))
  })
  let t569 = @simp.rewrite_tac(@list.List([@class.not_exists_thm(), @class.taut(@term_syntax.parse_term("!((a : Bool) && (b : Bool)) == b → !a"))]))
  let t568 = @simp.rewrite_tac(@list.List([@syntax.vfree_in_vsubst()]))
  let t567 = @simp.expand_tac("t'")
  let t566 = @simp.asm_rewrite_tac(@list.List([]))
  let t563 = @term_syntax.parse_term("(ty : Type)")
  let t564 = @term_syntax.parse_term("(x : List[Char])")
  let t565 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(t' : Term)"), t564, t563]), @syntax.variant()))
  let t561 = @simp.asm_rewrite_tac(@list.List([@syntax.term_inj()]))
  let t560 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t559 = @simp.rewrite_tac(@list.List([@lists.mem_filter()]))
  let t558 = @simp.expand_tac("ilist'")
  let t557 = @simp.asm_rewrite_tac(@list.List([]))
  let t556 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t555 = @simp.asm_rewrite_tac(@list.List([]))
  let t551 = @term_syntax.parse_term("((s' : Term), Var((u : List[Char]), (uty : Type)))")
  let t554 = @tactics.disch_then(fn(x553 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s549 = @tactics.mp_tac(x548)
      fn(x550 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s549(x550)
      }
    })(((x552 : @kernel.Thm) => @bool.spec(t551, x552))(x553))
  })
  let t547 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t544 = @simp.gen_rewrite_rule(fn(x543 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x543
  }, @list.List([@lists.not_ex()]))
  let t546 = @tactics.first_x_assum(fn(x545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x540 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s541 = @tactics.mp_tac(x540)
      fn(x542 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s541(x542)
      }
    })(t544(x545))
  })
  let t539 = @tactics.first_x_assum(@tactics.conjuncts_then(fn(x536 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s537 = @tactics.subst_all_tac(x536)
    fn(x538 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s537(x538)
    }
  }))
  let t535 = @simp.asm_rewrite_tac(@list.List([]))
  let t534 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1(), @pair.pair_eq()]))
  let t532 = @term_syntax.parse_term("(vty : Type)")
  let t533 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(v : List[Char])"), t532]))
  let t531 = @list.List([@meson.asm_meson_tac(@list.List([@syntax.welltyped()])), @tactics.all_tac])
  let t530 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t529 = @tactics.match_mp_tac(term_valuation_vfree_in())
  let t528 = @tactics.disch_then(@tactics.conjuncts_then(fn(x525 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s526 = @tactics.subst_all_tac(x525)
    fn(x527 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s526(x527)
    }
  }))
  let t524 = @simp.rewrite_tac(@list.List([dest_var(), @pair.pair_eq()]))
  let t523 = @tactics.undisch_tac(@term_syntax.parse_term("DEST_VAR(Var((w : List[Char]), (wty : Type))) == ((u : List[Char]), (uty : Type))"))
  let t522 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x516 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s517 = @tactics.subst_all_tac(x516)
    fn(x518 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s517(x518)
    }
  }, fn(x519 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s520 = @tactics.assume_tac(x519)
    fn(x521 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s520(x521)
    }
  }))
  let t515 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(wty : Type)"))(fn(x512 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s513 = @tactics.mp_tac(x512)
    fn(x514 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s513(x514)
    }
  }))
  let t511 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(w : List[Char])"))(fn(x508 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s509 = @tactics.mp_tac(x508)
    fn(x510 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s509(x510)
    }
  }))
  let t504 = @kernel.assume_rule(@term_syntax.parse_term("MEM(((s' : Term), (s : Term)), (ilist : List[(Term, Term)]))"))
  let t507 = @tactics.first_x_assum(fn(x506 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x501 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s502 = @tactics.mp_tac(x501)
      fn(x503 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s502(x503)
      }
    })((fn(x505 : @kernel.Thm) -> @kernel.Thm raise {
      @drule.match_mp(x505)(t504)
    })(x506))
  })
  let t499 = @term_syntax.parse_term("(s : Term)")
  let t500 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s' : Term)"), t499]))
  let t498 = @simp.asm_rewrite_tac(@list.List([@modelset.valmod_v1(), @pair.pair_eq()]))
  let t497 = @tactics.match_mp_tac(itlist_valmod_eq())
  let t496 = @simp.asm_rewrite_tac(@list.List([]))
  let t562 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.pair_eq()])), @class.cond_cases_tac), t496), t497), t498), t500), @tactics.strip_tac), t507), t511), t515), t522), t523), t524), t528), t529), t530), @tactics.conj_tac), t531), t533), @tactics.disch_tac), t534), @class.cond_cases_tac), t535), t539), t546), t547), t554), t555), t556), t557), t558), t559), t560), t561)])
  let t495 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1()]))
  let t494 = @simp.asm_simp_tac(@list.List([itlist_valmod_filter()]))
  let t493 = @simp.expand_tac("ilist'")
  let t491 = @simp.asm_rewrite_tac(@list.List([semantics(), @modelset.valmod_v1()]))
  let t490 = @simp.rewrite_tac(@list.List([dest_var(), @modelset.valmod_v1(), @pair.pair_eq()]))
  let t489 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t488 = @simp.rewrite_tac(@list.List([@lists.itlist()]))
  let t492 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("ilist''"), t488), t489), t490), @class.cond_cases_tac), t491), @tactics.all_tac])
  let t486 = @term_syntax.parse_term("(uty : Type)")
  let t487 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : List[Char])"), t486]))
  let t485 = @simp.asm_simp_tac(@list.List([term_valuation_valmod(), term_valuation_itlist()]))
  let t484 = @tactics.match_mp_tac(term_valuation_vfree_in())
  let t483 = @simp.asm_simp_tac(@list.List([@syntax.vsubst_welltyped(), @equal.gsym(@syntax.welltyped_v1()), term_valuation_valmod()]))
  let t482 = @simp.expand_tac("t'")
  let t481 = @simp.asm_simp_tac(@list.List([term_valuation_valmod(), term_valuation_itlist()]))
  let t480 = @tactics.try_tac(@tactics.match_mp_tac(semantics_typeset()))
  let t479 = @tactics.repeat_tac(@tactics.conj_tac)
  let t478 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : V)"))
  let t477 = @simp.asm_simp_tac(@list.List([typeset_inhabited()]))
  let t476 = @tactics.match_mp_tac(@modelset.abstract_eq())
  let t475 = @simp.rewrite_tac(@list.List([semantics()]))
  let t472 = @meson.asm_meson_tac(@list.List([@syntax.has_type_rules()]))
  let t471 = @simp.rewrite_tac(@list.List([@lists.mem(), @pair.pair_eq()]))
  let t473 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("ilist''"), t471), t472), @tactics.all_tac])
  let t470 = @tactics.subgoal_then(@term_syntax.parse_term("∀ s : Term, ∀ s' : Term, MEM((s', s), (ilist'' : List[(Term, Term)])) → (∃ x : List[Char], ∃ ty : Type, s == Var(x, ty) && has_type(s', ty))"), fn(x467 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s468 = @tactics.assume_tac(x467)
    fn(x469 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s468(x469)
    }
  })
  let t474 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@pair.let_tac), t470), t473), @tactics.all_tac])
  let t465 = @simp.asm_simp_tac(@list.List([@lists.mem_filter()]))
  let t466 = @list.List([@tactics.then_tac(@simp.expand_tac("ilist'"), t465), @tactics.all_tac])
  let t464 = @tactics.subgoal_then(@term_syntax.parse_term("∀ s : Term, ∀ s' : Term, MEM((s', s), (ilist' : List[(Term, Term)])) → (∃ x : List[Char], ∃ ty : Type, s == Var(x, ty) && has_type(s', ty))"), fn(x461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s462 = @tactics.assume_tac(x461)
    fn(x463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s462(x463)
    }
  })
  let t460 = @tactics.repeat_tac(@tactics.strip_tac)
  let t459 = @simp.asm_rewrite_tac(@list.List([]))
  let t458 = @class.asm_cases_tac(@term_syntax.parse_term("welltyped((t : Term))"))
  let t457 = @simp.rewrite_tac(@list.List([@syntax.welltyped_clauses()]))
  let t454 = @term_syntax.parse_term("(t : Term)")
  let t455 = @term_syntax.parse_term("(ty : Type)")
  let t456 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : List[Char])"), t455, t454]))
  let t452 = @meson.asm_meson_tac(@list.List([]))
  let t451 = @tactics.repeat_tac(@tactics.strip_tac)
  let t453 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@syntax.welltyped_clauses()])), t451), @tactics.binop_tac), t452), @tactics.all_tac])
  let t449 = @meson.asm_meson_tac(@list.List([]))
  let t448 = @simp.rewrite_tac(@list.List([dest_var(), @modelset.valmod_v1(), @syntax.term_inj(), @pair.pair_eq()]))
  let t447 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t446 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x440 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s441 = @tactics.subst_all_tac(x440)
    fn(x442 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s441(x442)
    }
  }, fn(x443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s444 = @tactics.assume_tac(x443)
    fn(x445 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s444(x445)
    }
  }))
  let t439 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(tty : Type)"))(fn(x436 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s437 = @tactics.mp_tac(x436)
    fn(x438 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s437(x438)
    }
  }))
  let t435 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(y : List[Char])"))(fn(x432 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s433 = @tactics.mp_tac(x432)
    fn(x434 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s433(x434)
    }
  }))
  let t431 = @simp.asm_rewrite_tac(@list.List([]))
  let t430 = @tactics.disch_then(fn(x424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x424
    let t429 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then(fn(x426 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s427 = @tactics.assume_tac(x426)
      fn(x428 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s427(x428)
      }
    })), t429)
  })
  let t423 = @simp.rewrite_tac(@list.List([@syntax.welltyped_clauses(), @theorems.left_exists_and_thm(), @theorems.exists_refl()]))
  let t422 = @simp.simp_tac(@list.List([@theorems.forall_and_thm(), @theorems.left_forall_imp_thm(), @pair.pair_eq()]))
  let t421 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t418 = @term_syntax.parse_term("(ilist : List[(Term, Term)])")
  let t419 = @term_syntax.parse_term("(s : Term)")
  let t420 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(t : Term)"), t419, t418]))
  let t417 = @simp.rewrite_tac(@list.List([@lists.mem(), @syntax.rev_assocd(), @lists.itlist(), semantics(), @pair.forall_pair_thm()]))
  let t416 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t415 = @term_syntax.parse_term("(ty : Type)")
  let t450 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : List[Char])"), t415])), t416), t417), t420), t421), t422), t423), t430), t431), t435), t439), t446), t447), t448), t449), @tactics.all_tac])
  let t414 = @simp.rewrite_tac(@list.List([@syntax.vsubst(), semantics()]))
  let t635 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@syntax.term_induct()), t414), @tactics.conj_tac), t450), @tactics.conj_tac), t453), t456), t457), t458), t459), t460), @pair.let_tac), @pair.let_tac), t464), t466), @class.cond_cases_tac), t474), t475), t476), t477), t478), @tactics.disch_tac), t479), t480), t481), t482), t483), t484), t485), t487), @tactics.disch_tac), t492), t493), t494), t495), t562), t565), t566), t567), t568), t569), t577), t578), t582), t585), t586), t588), t589), t590), t591), t592), t593), t594), t595), t596), t597), t600), t607), t611), t615), t622), t623), t627), t628), @class.cond_cases_tac), t629), t630), t631), t632), t633), t634)
  semantics_vsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ tm : Term, ∀ sigma : _, ∀ tau : _, ∀ ilist : List[(Term, Term)], welltyped(tm) && (∀ s : Term, ∀ s' : Term, MEM((s', s), ilist) → (∃ x : List[Char], ∃ ty : Type, s == Var(x, ty) && has_type(s', ty))) → (∀ sigma : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, type_valuation(tau) && term_valuation(tau, sigma) → semantics(sigma, tau, VSUBST(ilist, tm)) == semantics(ITLIST(GABS((f : ((Term, Term), ((List[Char], Type)) -> V, (List[Char], Type)) -> V) => ∀ t : Term, ∀ x : Term, GEQ(f((t, x)), op_bar_minus_gt(DEST_VAR(x), semantics(sigma, tau, t)))), ilist, sigma), tau, tm))"), t635))
}

///|
let semantics_vsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEMANTICS_VSUBST")

///|
/// `SEMANTICS_VSUBST`
pub fn semantics_vsubst() -> @kernel.Thm {
  semantics_vsubst_c.get()
}

///|
/// INST_correct
fn step_31() -> Unit raise {
  let t666 = @simp.asm_simp_tac(@list.List([semantics_vsubst(), @trivia.o_thm()]))
  let t665 = @list.List([@meson.asm_meson_tac(@list.List([@lists.all_mem(), @lists.mem(), @syntax.welltyped()])), @tactics.all_tac])
  let t664 = @tactics.subgoal_then(@term_syntax.parse_term("welltyped((a : Term))"), fn(x661 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s662 = @tactics.mp_tac(x661)
    fn(x663 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s662(x663)
    }
  })
  let t660 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Term)"))
  let t659 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@lists.all_imp()))
  let t656 = @simp.gen_rewrite_rule(fn(x655 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x655
  }, @list.List([@lists.all_map()]))
  let t658 = @tactics.first_x_assum(fn(x657 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x652 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s653 = @tactics.mp_tac(x652)
      fn(x654 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s653(x654)
      }
    })(t656(x657))
  })
  let t651 = @simp.asm_simp_tac(@list.List([term_valuation_itlist()]))
  let t650 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t649 = @simp.asm_simp_tac(@list.List([semantics_vsubst()]))
  let t648 = @list.List([@meson.asm_meson_tac(@list.List([@syntax.welltyped(), @lists.all()])), @tactics.all_tac])
  let t647 = @tactics.subgoal_then(@term_syntax.parse_term("welltyped((p : Term))"), fn(x644 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s645 = @tactics.assume_tac(x644)
    fn(x646 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s645(x646)
    }
  })
  let t642 = @simp.asm_rewrite_tac(@list.List([]))
  let t641 = @tactics.match_mp_tac(@syntax.vsubst_has_type())
  let t639 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t640 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@lists.all_imp())), @tactics.gen_tac), @tactics.disch_tac), t639)])
  let t638 = @tactics.match_mp_tac(@theorems.mono_and())
  let t637 = @simp.rewrite_tac(@list.List([@lists.all(), @lists.all_map()]))
  let t643 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ALL((a : Term) => has_type(a, Bool), CONS((p : Term), (asl : List[Term])))")), t637), t638), @tactics.conj_tac), t640), @tactics.disch_tac), t641), t642), @tactics.all_tac])
  let t636 = @tactics.repeat_tac(@tactics.strip_tac)
  let t667 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([sequent()])), t636), t643), t647), t648), t649), t650), t651), t658), t659), t660), @tactics.disch_tac), t664), t665), t666)
  inst_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ ilist : List[(Term, Term)], ∀ asl : List[Term], ∀ p : Term, (∀ s : Term, ∀ s' : Term, MEM((s', s), ilist) → (∃ x : List[Char], ∃ ty : Type, s == Var(x, ty) && has_type(s', ty))) → op_bar_eq(asl, p) → op_bar_eq(MAP(VSUBST(ilist), asl), VSUBST(ilist, p))"), t667))
}

///|
let inst_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INST_correct")

///|
/// `INST_correct`
pub fn inst_correct() -> @kernel.Thm {
  inst_correct_c.get()
}

///|
/// TYPESET_LEMMA
fn step_32() -> Unit raise {
  let t668 = @simp.simp_tac(@list.List([typeset(), @syntax.type_subst()]))
  let t669 = @tactics.then_tac(@tactics.match_mp_tac(@syntax.type_induct()), t668)
  typeset_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ ty : Type, ∀ tau : (List[Char]) -> V, ∀ tyin : List[(Type, Type)], typeset((s : List[Char]) => typeset(tau, REV_ASSOCD(Tyvar(s), tyin, Tyvar(s))), ty) == typeset(tau, TYPE_SUBST(tyin, ty))"), t669))
}

///|
let typeset_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TYPESET_LEMMA")

///|
/// `TYPESET_LEMMA`
pub fn typeset_lemma() -> @kernel.Thm {
  typeset_lemma_c.get()
}

///|
/// SEMANTICS_INST_CORE
fn step_33() -> Unit raise {
  let t1274 = @meson.asm_meson_tac(@list.List([]))
  let t1273 = @simp.asm_rewrite_tac(@list.List([]))
  let t1272 = @simp.simp_tac(@list.List([@pair.pair_eq()]))
  let t1271 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1270 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1(), semantics()]))
  let t1268 = @term_syntax.parse_term("(kty : Type)")
  let t1269 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : List[Char])"), t1268]))
  let t1266 = @meson.asm_meson_tac(@list.List([term_valuation()]))
  let t1265 = @simp.asm_rewrite_tac(@list.List([]))
  let t1264 = @simp.asm_rewrite_tac(@list.List([]))
  let t1263 = @simp.simp_tac(@list.List([@pair.pair_eq()]))
  let t1262 = @simp.rewrite_tac(@list.List([typeset_lemma(), @syntax.type_subst()]))
  let t1261 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1260 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1()]))
  let t1258 = @term_syntax.parse_term("(kty : Type)")
  let t1259 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : List[Char])"), t1258]))
  let t1257 = @simp.rewrite_tac(@list.List([term_valuation(), semantics()]))
  let t1267 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.conj_tac), t1257), t1259), t1260), t1261), t1262), t1263), t1264), @class.cond_cases_tac), t1265), t1266), @tactics.all_tac])
  let t1256 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t1255 = @simp.rewrite_tac(@list.List([dest_var()]))
  let t1254 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1253 = @simp.rewrite_tac(@list.List([@lists.itlist()]))
  let t1251 = @simp.asm_simp_tac(@list.List([typeset_inhabited()]))
  let t1252 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([type_valuation()])), t1251), @tactics.all_tac])
  let t1250 = @tactics.match_mp_tac(term_valuation_vfree_in())
  let t1249 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(@syntax.type_subst()))]))
  let t1248 = @tactics.disch_then(fn(x1245 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1246 = @tactics.subst1_tac(x1245)
    fn(x1247 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1246(x1247)
    }
  })
  let t1243 = @meson.asm_meson_tac(@list.List([term_valuation()]))
  let t1242 = @simp.asm_rewrite_tac(@list.List([@syntax.type_subst(), typeset_lemma()]))
  let t1241 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1(), @pair.pair_eq()]))
  let t1240 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t1239 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1()]))
  let t1237 = @term_syntax.parse_term("(yty : Type)")
  let t1238 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : List[Char])"), t1237]))
  let t1236 = @simp.rewrite_tac(@list.List([term_valuation()]))
  let t1234 = @simp.asm_simp_tac(@list.List([typeset_inhabited()]))
  let t1235 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([type_valuation()])), t1234), @tactics.all_tac])
  let t1233 = @list.List([@meson.meson_tac(@list.List([@syntax.has_type_rules()])), @tactics.all_tac])
  let t1244 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@lists.mem(), @pair.pair_eq()])), @tactics.conj_tac), t1233), @tactics.conj_tac), t1235), t1236), t1238), t1239), t1240), t1241), @class.cond_cases_tac), t1242), t1243), @tactics.all_tac])
  let t1232 = @tactics.disch_then(fn(x1225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_14 = x1225
    fn(x1231 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      (fn(x1227 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let (asl_1, w_1) = x1227
        let t1230 = @equal.lhand(w_1)
        @tactics.mp_tac(@drule.part_match(fn(x1229 : @kernel.Term) -> @kernel.Term raise {
          @equal.lhand(@kernel.rand(x1229))
        }, th_14)(t1230))
      })(x1231)(x1231)
    }
  })
  let t1224 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()]))
  let t1223 = @tactics.mp_tac(semantics_vsubst())
  let t1222 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(@syntax.type_subst()))]))
  let t1221 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t1212 = @meson.meson_tac(@list.List([@syntax.has_type_rules()]))
  let t1211 = @simp.rewrite_tac(@list.List([@lists.mem(), @pair.pair_eq()]))
  let t1210 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@syntax.welltyped_v1())]))
  let t1209 = @tactics.match_mp_tac(@syntax.vsubst_has_type())
  let t1208 = @tactics.subgoal_then(@term_syntax.parse_term("has_type(VSUBST([(Var((x' : List[Char]), (ty : Type)), Var((x : List[Char]), ty))], (t : Term)), typeof_(t))"), fn(x1206 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_12 = x1206
    @meson.asm_meson_tac(@list.List([th_12, @syntax.welltyped_lemma()]))
  })
  let t1205 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t1204 = @tactics.match_mp_tac(semantics_typeset())
  let t1213 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1203 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1200 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1201 = @tactics.subst1_tac(x1200)
      fn(x1202 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1201(x1202)
      }
    })(@equal.sym(x1203))
  }), t1204), t1205), t1208), t1209), t1210), t1211), t1212), @tactics.all_tac])
  let t1199 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → (a : Bool)) && b → a && b")))
  let t1197 = @meson.asm_meson_tac(@list.List([@syntax.welltyped(), @syntax.welltyped_v1()]))
  let t1196 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t1198 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(semantics_typeset()), t1196), t1197), @tactics.all_tac])
  let t1195 = @simp.rewrite_tac(@list.List([]))
  let t1194 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : V)"))
  let t1193 = @list.List([@simp.asm_simp_tac(@list.List([typeset_inhabited()])), @tactics.all_tac])
  let t1192 = @tactics.match_mp_tac(@modelset.abstract_eq())
  let t1191 = @simp.asm_rewrite_tac(@list.List([]))
  let t1190 = @simp.rewrite_tac(@list.List([@syntax.type_subst(), typeset_lemma()]))
  let t1189 = @simp.rewrite_tac(@list.List([semantics()]))
  let t1188 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1186 = @meson.asm_meson_tac(@list.List([]))
  let t1185 = @simp.rewrite_tac(@list.List([@syntax.rev_assocd()]))
  let t1184 = @simp.expand_tac("env''")
  let t1183 = @simp.asm_rewrite_tac(@list.List([]))
  let t1182 = @simp.rewrite_tac(@list.List([@syntax.term_inj()]))
  let t1181 = @tactics.undisch_tac(@term_syntax.parse_term("!(Var((x : List[Char]), (ty : Type)) == Var((k : List[Char]), (kty : Type)))"))
  let t1180 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @theorems.unwind_thm1(), @theorems.unwind_thm2()]))
  let t1179 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((x : Bool) && (if (p : Bool) && (q : Bool) { (a : Bool) } else { (b : Bool) })) == (p && q && a && x || b && !(p && q) && x)"))]))
  let t1178 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t1177 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((x : Bool) && (if (p : Bool) { (a : Bool) && (b : Bool) } else { (c : Bool) && b })) == (b && x && (if p { a } else { c }))"))]))
  let t1176 = @simp.simp_tac(@list.List([]))
  let t1175 = @simp.rewrite_tac(@list.List([@syntax.vfree_in(), @syntax.term_inj()]))
  let t1174 = @simp.rewrite_tac(@list.List([@syntax.vfree_in()]))
  let t1173 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t1172 = @simp.rewrite_tac(@list.List([@syntax.vfree_in_vsubst(), @syntax.rev_assocd()]))
  let t1167 = @term_syntax.parse_term("(kty : Type)")
  let t1168 = @list.List([@term_syntax.parse_term("(k : List[Char])"), t1167])
  let t1171 = @tactics.disch_then(fn(x1170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1164 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1165 = @tactics.mp_tac(x1164)
      fn(x1166 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1165(x1166)
      }
    })(((x1169 : @kernel.Thm) => @bool.specl(t1168, x1169))(x1170))
  })
  let t1163 = @tactics.undisch_tac(@term_syntax.parse_term("∀ x'' : List[Char], ∀ ty' : Type, VFREE_IN(Var(x'', ty'), VSUBST([(Var((x' : List[Char]), (ty : Type)), Var((x : List[Char]), ty))], (t : Term))) → REV_ASSOCD(Var(x'', TYPE_SUBST((tyin : List[(Type, Type)]), ty')), (env'' : List[(Term, Term)]), Var(x'', ty')) == Var(x'', ty')"))
  let t1162 = @simp.rewrite_tac(@list.List([@syntax.vfree_in()]))
  let t1161 = @term_syntax.parse_term("(kty : Type)")
  let t1187 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : List[Char])"), t1161])), t1162), @tactics.strip_tac), t1163), t1171), t1172), t1173), t1174), t1175), t1176), t1177), t1178), t1179), t1180), t1181), t1182), @tactics.disch_tac), t1183), t1184), t1185), t1186), @tactics.all_tac])
  let t1159 = @meson.asm_meson_tac(@list.List([]))
  let t1158 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @theorems.unwind_thm1(), @theorems.unwind_thm2()]))
  let t1157 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((x : Bool) && (if (p : Bool) && (q : Bool) { (a : Bool) } else { (b : Bool) })) == (p && q && a && x || b && !(p && q) && x)"))]))
  let t1156 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t1155 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((x : Bool) && (if (p : Bool) { (a : Bool) && (b : Bool) } else { (c : Bool) && b })) == (b && x && (if p { a } else { c }))"))]))
  let t1154 = @simp.simp_tac(@list.List([]))
  let t1153 = @simp.rewrite_tac(@list.List([@syntax.vfree_in(), @syntax.term_inj()]))
  let t1152 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t1151 = @simp.asm_rewrite_tac(@list.List([@syntax.vfree_in_vsubst(), @syntax.rev_assocd()]))
  let t1149 = @term_syntax.parse_term("(kty : Type)")
  let t1150 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : List[Char])"), t1149]))
  let t1160 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@syntax.vfree_in()])), t1150), t1151), t1152), t1153), t1154), t1155), t1156), t1157), t1158), t1159), @tactics.all_tac])
  let t1148 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (a → (b : Bool)) → a && b")))
  let t1146 = @meson.meson_tac(@list.List([@syntax.has_type_rules()]))
  let t1145 = @simp.rewrite_tac(@list.List([@lists.mem(), @pair.pair_eq()]))
  let t1144 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@syntax.welltyped_v1())]))
  let t1143 = @tactics.match_mp_tac(@syntax.vsubst_has_type())
  let t1142 = @tactics.subgoal_then(@term_syntax.parse_term("has_type(VSUBST([(Var((x' : List[Char]), (ty : Type)), Var((x : List[Char]), ty))], (t : Term)), typeof_(t))"), fn(x1140 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_11 = x1140
    @meson.asm_meson_tac(@list.List([th_11, @syntax.welltyped_lemma()]))
  })
  let t1139 = @tactics.match_mp_tac(@lib.last(@bool.conjuncts_rule(@syntax.has_type_rules())))
  let t1147 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@syntax.typeof_(), @syntax.type_subst()])), t1139), t1142), t1143), t1144), t1145), t1146), @tactics.all_tac])
  let t1138 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) && (b → (c : Bool) && (a : Bool) && (d : Bool)) → a && b && c && d")))
  let t1137 = @simp.rewrite_tac(@list.List([@syntax.result()]))
  let t1136 = @simp.asm_rewrite_tac(@list.List([@syntax.is_result(), @syntax.result_inj(), @theorems.unwind_thm1(), @syntax.result_distinct()]))
  let t1135 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t'' : Term)"))(@tactics.strip_assume_tac))
  let t1134 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1129 = @tactics.assume_tac(x1128)
    fn(x1130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1129(x1130)
    }
  }, fn(x1131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1132 = @tactics.mp_tac(x1131)
    fn(x1133 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1132(x1133)
    }
  }))
  let t1127 = @simp.asm_rewrite_tac(@list.List([]))
  let t1125 = @meson.asm_meson_tac(@list.List([]))
  let t1124 = @simp.asm_rewrite_tac(@list.List([]))
  let t1121 = @term_syntax.parse_term("(ty' : Type)")
  let t1122 = @term_syntax.parse_term("(x : List[Char])")
  let t1123 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(t' : Term)"), t1122, t1121]), @syntax.variant()))
  let t1119 = @term_syntax.parse_term("(kty : Type)")
  let t1120 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(k : List[Char])"), t1119]))
  let t1118 = @simp.rewrite_tac(@list.List([@syntax.vfree_in(), @syntax.term_inj()]))
  let t1117 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t1116 = @simp.rewrite_tac(@list.List([@syntax.vfree_in_vsubst(), @class.not_exists_thm(), @syntax.rev_assocd()]))
  let t1115 = @tactics.disch_then(fn(x1114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1112 = @tactics.mp_tac(x1111)
      fn(x1113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1112(x1113)
      }
    })(@bool.conjunct1(x1114))
  })
  let t1110 = @simp.asm_rewrite_tac(@list.List([]))
  let t1109 = @class.asm_cases_tac(@term_syntax.parse_term("(vty : Type) == (ty : Type)"))
  let t1108 = @simp.rewrite_tac(@list.List([@syntax.rev_assocd()]))
  let t1107 = @simp.expand_tac("env''")
  let t1106 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")))
  let t1105 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1099 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1100 = @tactics.subst_all_tac(x1099)
    fn(x1101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1100(x1101)
    }
  }, fn(x1102 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1103 = @tactics.assume_tac(x1102)
    fn(x1104 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1103(x1104)
    }
  }))
  let t1096 = @simp.gen_rewrite_rule(fn(x1095 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1095
  }, @list.List([@syntax.term_inj()]))
  let t1098 = @tactics.first_x_assum(fn(x1097 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1092 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1093 = @tactics.mp_tac(x1092)
      fn(x1094 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1093(x1094)
      }
    })(t1096(x1097))
  })
  let t1090 = @meson.asm_meson_tac(@list.List([]))
  let t1089 = @simp.asm_rewrite_tac(@list.List([@syntax.vfree_in(), @syntax.term_inj()]))
  let t1088 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.choose_then)(fn(x1085 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1086 = @tactics.mp_tac(x1085)
    fn(x1087 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1086(x1087)
    }
  }))
  let t1084 = @simp.rewrite_tac(@list.List([@syntax.term_inj()]))
  let t1083 = @simp.asm_rewrite_tac(@list.List([]))
  let t1082 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1076 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1077 = @tactics.mp_tac(x1076)
    fn(x1078 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1077(x1078)
    }
  }, fn(x1079 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1080 = @tactics.assume_tac(x1079)
    fn(x1081 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1080(x1081)
    }
  }))
  let t1075 = @simp.asm_rewrite_tac(@list.List([]))
  let t1074 = @simp.rewrite_tac(@list.List([@syntax.rev_assocd()]))
  let t1073 = @simp.expand_tac("env''")
  let t1091 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@syntax.vfree_in_vsubst()])), t1073), t1074), t1075), t1082), t1083), t1084), t1088), @class.cond_cases_tac), t1089), t1090), @tactics.all_tac])
  let t1072 = @simp.asm_rewrite_tac(@list.List([]))
  let t1071 = @simp.once_rewrite_tac(@list.List([@syntax.letlemma()]))
  let t1070 = @simp.asm_rewrite_tac(@list.List([@syntax.is_result(), @syntax.clash()]))
  let t1069 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1063 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1064 = @tactics.subst_all_tac(x1063)
    fn(x1065 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1064(x1065)
    }
  }, fn(x1066 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1067 = @tactics.mp_tac(x1066)
    fn(x1068 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1067(x1068)
    }
  }))
  let t1062 = @simp.asm_rewrite_tac(@list.List([]))
  let t1061 = @tactics.x_gen_tac(@term_syntax.parse_term("(vty : Type)"))
  let t1060 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1059 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : List[Char])"))
  let t1058 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1126 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1056 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_10 = x1056
    @tactics.then_tac(@tactics.disj1_tac, @tactics.mp_tac(th_10))
  }), t1058), t1059), t1060), t1061), t1062), t1069), t1070), t1071), @class.cond_cases_tac), t1072), t1091), t1098), t1105), t1106), t1107), t1108), t1109), t1110), t1115), t1116), t1117), t1118), t1120), t1123), t1124), t1125), @tactics.all_tac])
  let t1055 = @tactics.disch_then(@tactics.disj_cases_then(fn(x1052 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1053 = @tactics.mp_tac(x1052)
    fn(x1054 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1053(x1054)
    }
  }))
  let t1050 = @meson.asm_meson_tac(@list.List([]))
  let t1049 = @simp.rewrite_tac(@list.List([@lists.mem(), @pair.pair_eq()]))
  let t1048 = @simp.expand_tac("env''")
  let t1046 = @meson.asm_meson_tac(@list.List([@syntax.has_type_rules()]))
  let t1045 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @pair.pair_eq()]))
  let t1047 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@syntax.sizeof_vsubst()), t1045), t1046), @tactics.all_tac])
  let t1043 = @meson.asm_meson_tac(@list.List([@syntax.has_type_rules()]))
  let t1042 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @pair.pair_eq()]))
  let t1044 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@syntax.vsubst_welltyped()), t1042), t1043), @tactics.all_tac])
  let t1051 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.conj_tac), t1044), @tactics.conj_tac), t1047), t1048), t1049), t1050), @tactics.all_tac])
  let t1041 = @simp.gen_rewrite_tac(fn(x1040 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1034 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1035 = @equal.land_conv(x1034)
      fn(x1036 : @kernel.Term) -> @kernel.Thm raise {
        s1035(x1036)
      }
    })((fn(x1037 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1038 = @equal.top_depth_conv(x1037)
      fn(x1039 : @kernel.Term) -> @kernel.Thm raise {
        s1038(x1039)
      }
    })(x1040))
  }, @list.List([@class.not_exists_thm(), @class.taut(@term_syntax.parse_term("!((a : Bool) && (b : Bool)) == (a → !b)"))]))
  let t1033 = @simp.asm_rewrite_tac(@list.List([]))
  let t1030 = @term_syntax.parse_term("(ty' : Type)")
  let t1031 = @term_syntax.parse_term("(x : List[Char])")
  let t1032 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(t' : Term)"), t1031, t1030]), @syntax.variant()))
  let t1029 = @simp.asm_rewrite_tac(@list.List([@syntax.result()]))
  let t1028 = @tactics.undisch_tac(@term_syntax.parse_term("VARIANT(RESULT(INST_CORE(NIL, (tyin : List[(Type, Type)]), (t : Term))), (x : List[Char]), (ty' : Type)) == (x' : List[Char])"))
  let t1027 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t' : Term)"))(fn(x1024 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1025 = @tactics.mp_tac(x1024)
    fn(x1026 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1025(x1026)
    }
  }))
  let t1023 = @simp.asm_rewrite_tac(@list.List([]))
  let t1022 = @simp.rewrite_tac(@list.List([@lists.mem(), @syntax.rev_assocd()]))
  let t1021 = @tactics.disch_then(fn(x1014 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_9 = x1014
    let t1018 = @term_syntax.parse_term("(tyin : List[(Type, Type)])")
    let t1019 = @term_syntax.parse_term("(NIL : List[(Term, Term)])")
    let t1020 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(t : Term)"), t1019, t1018]), th_9))
    let t1016 = @term_syntax.parse_term("(tyin : List[(Type, Type)])")
    let t1017 = @term_syntax.parse_term("(env'' : List[(Term, Term)])")
    @tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("VSUBST([(Var((x' : List[Char]), (ty : Type)), Var((x : List[Char]), ty))], (t : Term))"), t1017, t1016]), th_9)), t1020)
  })
  let t1013 = @simp.rewrite_tac(@list.List([@syntax.sizeof_(), @int.arith_rule(@term_syntax.parse_term("(t : Num) < 2 + t"))]))
  let t1009 = @term_syntax.parse_term("sizeof((t : Term))")
  let t1012 = @tactics.first_x_assum(fn(x1011 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1006 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1007 = @tactics.mp_tac(x1006)
      fn(x1008 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1007(x1008)
      }
    })(((x1010 : @kernel.Thm) => @bool.spec(t1009, x1010))(x1011))
  })
  let t1005 = @simp.once_rewrite_tac(@list.List([@syntax.letlemma()]))
  let t1004 = @simp.abbrev_tac(@term_syntax.parse_term("(ures : Result) == INST_CORE((env'' : List[(Term, Term)]), (tyin : List[(Type, Type)]), VSUBST([(Var((x' : List[Char]), (ty : Type)), Var((x : List[Char]), ty))], (t : Term)))"))
  let t1003 = @simp.once_rewrite_tac(@list.List([@syntax.letlemma()]))
  let t1002 = @simp.abbrev_tac(@term_syntax.parse_term("(env'' : List[(Term, Term)]) == CONS((Var((x' : List[Char]), (ty : Type)), Var(x', (ty' : Type))), (env : List[(Term, Term)]))"))
  let t1001 = @simp.once_rewrite_tac(@list.List([@syntax.letlemma()]))
  let t1000 = @simp.asm_rewrite_tac(@list.List([]))
  let t999 = @simp.once_rewrite_tac(@list.List([@syntax.inst_core()]))
  let t998 = @tactics.first_x_assum(@tactics.conjuncts_then2(fn(x992 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s993 = @tactics.subst_all_tac(x992)
    fn(x994 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s993(x994)
    }
  }, fn(x995 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s996 = @tactics.assume_tac(x995)
    fn(x997 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s996(x997)
    }
  }))
  let t990 = @meson.asm_meson_tac(@list.List([]))
  let t989 = @simp.asm_rewrite_tac(@list.List([@syntax.rev_assocd(), @syntax.term_inj()]))
  let t988 = @simp.expand_tac("env'")
  let t987 = @simp.asm_rewrite_tac(@list.List([@syntax.vfree_in(), @syntax.term_inj()]))
  let t986 = @tactics.disch_then(fn(x978 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_8 = x978
    let t985 = @tactics.mp_tac(th_8)
    let t983 = @term_syntax.parse_term("(zty : Type)")
    let t984 = @tactics.map_every(fn(x980 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s981 = @tactics.exists_tac(x980)
      fn(x982 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s981(x982)
      }
    }, @list.List([@term_syntax.parse_term("(z : List[Char])"), t983]))
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @simp.rewrite_tac(@list.List([@syntax.result_inj()]))), t984), t985)
  })
  let t975 = @term_syntax.parse_term("0")
  let t991 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x977 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x974 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x976 : @kernel.Thm) => @bool.spec(t975, x976))(x977))
  }), t986), t987), t988), t989), t990), @tactics.all_tac])
  let t973 = @simp.asm_rewrite_tac(@list.List([]))
  let t972 = @simp.rewrite_tac(@list.List([@syntax.clash(), @syntax.is_result(), @syntax.term_inj()]))
  let t971 = @simp.expand_tac("w")
  let t968 = @tactics.conjuncts_then2(fn(x962 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s963 = @tactics.subst_all_tac(x962)
    fn(x964 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s963(x964)
    }
  }, fn(x965 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s966 = @tactics.mp_tac(x965)
    fn(x967 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s966(x967)
    }
  })
  let t969 = @tactics.x_choose_then(@term_syntax.parse_term("(zty : Type)"))(t968)
  let t970 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : List[Char])"))(t969))
  let t960 = @simp.asm_rewrite_tac(@list.List([@syntax.rev_assocd(), @syntax.term_inj()]))
  let t959 = @simp.expand_tac("env'")
  let t958 = @simp.asm_rewrite_tac(@list.List([]))
  let t953 = @term_syntax.parse_term("(yty : Type)")
  let t954 = @list.List([@term_syntax.parse_term("(x : List[Char])"), t953])
  let t957 = @tactics.first_x_assum(fn(x956 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x950 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s951 = @tactics.mp_tac(x950)
      fn(x952 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s951(x952)
      }
    })(((x955 : @kernel.Thm) => @bool.specl(t954, x955))(x956))
  })
  let t949 = @simp.asm_rewrite_tac(@list.List([]))
  let t948 = @tactics.undisch_then(@term_syntax.parse_term("(y : List[Char]) == (x : List[Char])"), fn(x945 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s946 = @tactics.subst_all_tac(x945)
    fn(x947 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s946(x947)
    }
  })
  let t944 = @simp.asm_rewrite_tac(@list.List([]))
  let t943 = @class.asm_cases_tac(@term_syntax.parse_term("(yty : Type) == (ty : Type)"))
  let t942 = @simp.asm_rewrite_tac(@list.List([@pair.pair_eq()]))
  let t941 = @class.asm_cases_tac(@term_syntax.parse_term("(y : List[Char]) == (x : List[Char])"))
  let t940 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t939 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1()]))
  let t938 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t936 = @term_syntax.parse_term("(yty : Type)")
  let t937 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : List[Char])"), t936]))
  let t935 = @simp.asm_rewrite_tac(@list.List([]))
  let t934 = @tactics.undisch_then(@term_syntax.parse_term("∀ u : List[Char], ∀ uty : Type, VFREE_IN(Var(u, uty), (t' : Term)) == (∃ oty : Type, VFREE_IN(Var(u, oty), (t : Term)) && uty == TYPE_SUBST((tyin : List[(Type, Type)]), oty))"), fn(x933 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t931 = @meson.asm_meson_tac(@list.List([term_valuation()]))
  let t930 = @simp.asm_rewrite_tac(@list.List([@syntax.type_subst(), typeset_lemma()]))
  let t929 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1(), @pair.pair_eq()]))
  let t928 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t927 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1()]))
  let t925 = @term_syntax.parse_term("(yty : Type)")
  let t926 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : List[Char])"), t925]))
  let t932 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([term_valuation()])), t926), t927), t928), t929), @class.cond_cases_tac), t930), t931), @tactics.all_tac])
  let t923 = @meson.asm_meson_tac(@list.List([term_valuation()]))
  let t922 = @simp.asm_rewrite_tac(@list.List([@syntax.type_subst(), typeset_lemma()]))
  let t921 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1(), @pair.pair_eq()]))
  let t920 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t918 = @term_syntax.parse_term("(yty : Type)")
  let t919 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : List[Char])"), t918]))
  let t924 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([term_valuation()])), t919), t920), t921), @class.cond_cases_tac), t922), t923), @tactics.all_tac])
  let t916 = @simp.asm_simp_tac(@list.List([typeset_inhabited()]))
  let t917 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([type_valuation()])), t916), @tactics.all_tac])
  let t915 = @tactics.match_mp_tac(term_valuation_vfree_in())
  let t914 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(@syntax.type_subst()))]))
  let t913 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t908 = @term_syntax.parse_term("(tau : (List[Char]) -> V)")
  let t909 = @list.List([@term_syntax.parse_term("op_bar_minus_gt(((x : List[Char]), (ty' : Type)), (a : V), (sigma : ((List[Char], Type)) -> V))"), t908])
  let t912 = @tactics.first_x_assum(fn(x911 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x905 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s906 = @tactics.mp_tac(x905)
      fn(x907 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s906(x907)
      }
    })(((x910 : @kernel.Thm) => @bool.specl(t909, x910))(x911))
  })
  let t903 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t902 = @tactics.match_mp_tac(semantics_typeset())
  let t904 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x901 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x898 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s899 = @tactics.subst1_tac(x898)
      fn(x900 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s899(x900)
      }
    })(@equal.sym(x901))
  }), t902), t903), @tactics.all_tac])
  let t897 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((b : Bool) → (a : Bool)) && b → a && b")))
  let t895 = @meson.asm_meson_tac(@list.List([@syntax.welltyped(), @syntax.welltyped_v1()]))
  let t894 = @simp.asm_simp_tac(@list.List([term_valuation_valmod()]))
  let t896 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(semantics_typeset()), t894), t895), @tactics.all_tac])
  let t893 = @simp.rewrite_tac(@list.List([]))
  let t892 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : V)"))
  let t891 = @list.List([@simp.asm_simp_tac(@list.List([typeset_inhabited()])), @tactics.all_tac])
  let t890 = @tactics.match_mp_tac(@modelset.abstract_eq())
  let t889 = @simp.asm_rewrite_tac(@list.List([@syntax.type_subst(), typeset_lemma()]))
  let t888 = @simp.rewrite_tac(@list.List([semantics()]))
  let t887 = @tactics.repeat_tac(@tactics.gen_tac)
  let t885 = @meson.asm_meson_tac(@list.List([@syntax.has_type_rules()]))
  let t884 = @simp.asm_rewrite_tac(@list.List([]))
  let t886 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@syntax.typeof_(), @syntax.type_subst()])), t884), t885), @tactics.all_tac])
  let t882 = @meson.asm_meson_tac(@list.List([@syntax.term_inj()]))
  let t881 = @simp.rewrite_tac(@list.List([@syntax.rev_assocd()]))
  let t880 = @simp.expand_tac("env'")
  let t879 = @tactics.first_x_assum(fn(x875 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_7 = x875
    let t878 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.no_tac), @tactics.all_tac])
    let t877 = @term_syntax.parse_term("(oty : Type)")
    @tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : List[Char])"), t877]), th_7)), @tactics.ants_tac), t878)
  })
  let t874 = @tactics.disch_then(fn(x873 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x870 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s871 = @tactics.assume_tac(x870)
      fn(x872 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s871(x872)
      }
    })(@equal.sym(x873))
  })
  let t869 = @simp.rewrite_tac(@list.List([@class.contrapos_thm()]))
  let t868 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t867 = @simp.asm_rewrite_tac(@list.List([]))
  let t866 = @class.asm_cases_tac(@term_syntax.parse_term("VFREE_IN(Var((x : List[Char]), (oty : Type)), (t : Term))"))
  let t865 = @simp.asm_rewrite_tac(@list.List([]))
  let t864 = @class.asm_cases_tac(@term_syntax.parse_term("(uty : Type) == TYPE_SUBST((tyin : List[(Type, Type)]), (oty : Type))"))
  let t863 = @simp.rewrite_tac(@list.List([]))
  let t862 = @tactics.x_gen_tac(@term_syntax.parse_term("(oty : Type)"))
  let t861 = @simp.gen_rewrite_tac(fn(x860 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x860
  }, @list.List([@class.fun_eq_thm()]))
  let t859 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm()]))
  let t858 = @tactics.undisch_then(@term_syntax.parse_term("(u : List[Char]) == (x : List[Char])"), fn(x855 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s856 = @tactics.subst_all_tac(x855)
    fn(x857 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s856(x857)
    }
  })
  let t854 = @simp.asm_rewrite_tac(@list.List([]))
  let t853 = @class.asm_cases_tac(@term_syntax.parse_term("(u : List[Char]) == (x : List[Char])"))
  let t851 = @term_syntax.parse_term("(uty : Type)")
  let t852 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : List[Char])"), t851]))
  let t883 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@syntax.vfree_in(), @syntax.term_inj()])), t852), t853), t854), t858), t859), @tactics.ap_term_tac), t861), t862), t863), t864), t865), t866), t867), @tactics.eq_tac), t868), t869), t874), t879), t880), t881), t882), @tactics.all_tac])
  let t850 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (b : Bool) && (b → (c : Bool)) → b && a && c")))
  let t849 = @simp.rewrite_tac(@list.List([@syntax.result_inj(), @theorems.unwind_thm1(), @syntax.result()]))
  let t847 = @meson.meson_tac(@list.List([]))
  let t846 = @simp.asm_rewrite_tac(@list.List([@syntax.term_inj()]))
  let t845 = @simp.rewrite_tac(@list.List([@syntax.vfree_in(), @syntax.rev_assocd(), @syntax.term_inj()]))
  let t844 = @simp.expand_tac("env'")
  let t848 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x831 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_6 = x831
    let t843 = @tactics.disch_then(fn(x842 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x835 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s836 = @tactics.mp_tac(x835)
        fn(x837 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s836(x837)
        }
      })(((x841 : @kernel.Thm) => @lib.check(fn(x840 : @kernel.Thm) -> Bool raise {
        (fn(x838 : @kernel.Term) -> Bool raise {
          @basics.is_imp(x838)
        })((fn(x839 : @kernel.Thm) -> @kernel.Term raise {
          @kernel.concl(x839)
        })(x840))
      }, x841))(x842))
    })
    let t834 = @tactics.match_mp_tac(@theorems.mono_forall())
    let t833 = @tactics.match_mp_tac(@theorems.mono_forall())
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(th_6), t833), @tactics.gen_tac), t834), @tactics.gen_tac), t843)
  }), t844), t845), @class.cond_cases_tac), t846), t847), @tactics.all_tac])
  let t830 = @simp.asm_rewrite_tac(@list.List([@syntax.is_result()]))
  let t829 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t' : Term)"))(@tactics.strip_assume_tac))
  let t828 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x822 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s823 = @tactics.assume_tac(x822)
    fn(x824 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s823(x824)
    }
  }, fn(x825 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s826 = @tactics.mp_tac(x825)
    fn(x827 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s826(x827)
    }
  }))
  let t819 = @term_syntax.parse_term("0")
  let t961 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x821 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x818 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x820 : @kernel.Thm) => @bool.spec(t819, x820))(x821))
  }), t828), t829), @tactics.disj2_tac), t830), @tactics.conj_tac), t848), t849), t850), @tactics.conj_tac), t883), @tactics.conj_tac), t886), @tactics.disch_tac), t887), @tactics.strip_tac), t888), t889), t890), @tactics.conj_tac), t891), t892), t893), @tactics.disch_tac), @tactics.conj_tac), t896), t897), @tactics.conj_tac), t904), t912), t913), @tactics.disch_tac), t914), t915), @tactics.conj_tac), t917), @tactics.conj_tac), t924), @tactics.conj_tac), t932), t934), t935), t937), t938), t939), t940), t941), t942), t943), t944), t948), @class.cond_cases_tac), t949), @tactics.disch_tac), t957), t958), t959), t960)])
  let t817 = @tactics.disch_then(@tactics.disj_cases_then(fn(x814 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s815 = @tactics.mp_tac(x814)
    fn(x816 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s815(x816)
    }
  }))
  let t812 = @meson.asm_meson_tac(@list.List([]))
  let t811 = @simp.rewrite_tac(@list.List([@lists.mem(), @pair.pair_eq()]))
  let t813 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("env'"), t811), t812), @tactics.all_tac])
  let t810 = @simp.asm_rewrite_tac(@list.List([]))
  let t804 = @term_syntax.parse_term("(tyin : List[(Type, Type)])")
  let t805 = @term_syntax.parse_term("(env' : List[(Term, Term)])")
  let t806 = @list.List([@term_syntax.parse_term("(t : Term)"), t805, t804])
  let t809 = @tactics.disch_then(fn(x808 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x801 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s802 = @tactics.mp_tac(x801)
      fn(x803 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s802(x803)
      }
    })(((x807 : @kernel.Thm) => @bool.specl(t806, x807))(x808))
  })
  let t800 = @simp.rewrite_tac(@list.List([@syntax.sizeof_(), @int.arith_rule(@term_syntax.parse_term("(t : Num) < 2 + t"))]))
  let t796 = @term_syntax.parse_term("sizeof((t : Term))")
  let t799 = @tactics.first_assum(fn(x798 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x793 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s794 = @tactics.mp_tac(x793)
      fn(x795 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s794(x795)
      }
    })(((x797 : @kernel.Thm) => @bool.spec(t796, x797))(x798))
  })
  let t792 = @tactics.repeat_tac(@pair.let_tac)
  let t791 = @simp.rewrite_tac(@list.List([@syntax.welltyped_clauses()]))
  let t790 = @tactics.repeat_tac(@tactics.gen_tac)
  let t789 = @tactics.pop_assum(fn(x788 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t787 = @simp.asm_rewrite_tac(@list.List([]))
  let t786 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == sizeof(Abs((x : List[Char]), (ty : Type), (t : Term)))"))
  let t785 = @tactics.pop_assum(fn(x782 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s783 = @tactics.mp_tac(x782)
    fn(x784 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s783(x784)
    }
  })
  let t781 = @tactics.disch_then(fn(x780 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t777 = @term_syntax.parse_term("(t : Term)")
  let t778 = @term_syntax.parse_term("(ty : Type)")
  let t779 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : List[Char])"), t778, t777]))
  let t772 = @meson.asm_meson_tac(@list.List([]))
  let t771 = @simp.rewrite_tac(@list.List([@syntax.term_distinct(), @syntax.term_inj(), @syntax.codomain()]))
  let t770 = @simp.once_rewrite_tac(@list.List([@syntax.has_type_cases()]))
  let t769 = @simp.asm_rewrite_tac(@list.List([@syntax.typeof_()]))
  let t768 = @simp.asm_rewrite_tac(@list.List([@syntax.vfree_in()]))
  let t767 = @simp.asm_simp_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @syntax.is_clash(), semantics(), @syntax.result()]))
  let t766 = @tactics.exists_tac(@term_syntax.parse_term("Comb((s' : Term), (t' : Term))"))
  let t764 = @meson.asm_meson_tac(@list.List([]))
  let t765 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@syntax.vfree_in()])), t764), @tactics.all_tac])
  let t763 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t' : Term)"))(@tactics.strip_assume_tac))
  let t762 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x756 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s757 = @tactics.assume_tac(x756)
    fn(x758 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s757(x758)
    }
  }, fn(x759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s760 = @tactics.mp_tac(x759)
    fn(x761 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s760(x761)
    }
  }))
  let t754 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @syntax.is_clash(), @syntax.vfree_in()]))
  let t753 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), @tactics.gen_tac))
  let t755 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x751 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x751
    @tactics.then_tac(@tactics.disj1_tac, @tactics.mp_tac(th_5))
  }), t753), @tactics.strip_tac), t754), @tactics.all_tac])
  let t750 = @tactics.disch_then(@tactics.disj_cases_then(fn(x747 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s748 = @tactics.mp_tac(x747)
    fn(x749 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s748(x749)
    }
  }))
  let t746 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(s' : Term)"))(@tactics.strip_assume_tac))
  let t745 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x739 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s740 = @tactics.assume_tac(x739)
    fn(x741 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s740(x741)
    }
  }, fn(x742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s743 = @tactics.mp_tac(x742)
    fn(x744 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s743(x744)
    }
  }))
  let t738 = @simp.rewrite_tac(@list.List([@syntax.type_subst()]))
  let t736 = @simp.asm_rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def(), @syntax.is_clash(), @syntax.vfree_in()]))
  let t735 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), @tactics.gen_tac))
  let t734 = @tactics.disch_then(fn(x732 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x732
    @tactics.then_tac(@tactics.disj1_tac, @tactics.mp_tac(th_4))
  })
  let t737 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x728 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x728
    let t731 = @tactics.mp_tac(th_3)
    @tactics.then_tac(@tactics.disch_then(fn(x730 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    }), t731)
  }), t734), t735), @tactics.strip_tac), t736), @tactics.all_tac])
  let t727 = @tactics.disch_then(@tactics.disj_cases_then(fn(x724 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s725 = @tactics.mp_tac(x724)
    fn(x726 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s725(x726)
    }
  }))
  let t723 = @simp.gen_rewrite_tac(fn(x722 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x722
  }, @list.List([@theorems.imp_conj()]))
  let t721 = @simp.asm_rewrite_tac(@list.List([]))
  let t720 = @tactics.disch_then(fn(x718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x718
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th_2))
  })
  let t717 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t716 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @theorems.and_forall_thm(), @syntax.welltyped_clauses()]))
  let t715 = @tactics.disch_then(fn(x706 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x706
    let t714 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(s : Term)"), th_1))
    let t711 = @term_syntax.parse_term("(t : Term)")
    @tactics.then_tac(@tactics.disch_then(fn(x713 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x708 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s709 = @tactics.mp_tac(x708)
        fn(x710 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s709(x710)
        }
      })(((x712 : @kernel.Thm) => @bool.spec(t711, x712))(x713))
    }), t714)
  })
  let t705 = @simp.rewrite_tac(@list.List([@syntax.sizeof_(), @int.arith_rule(@term_syntax.parse_term("(s : Num) < 1 + (s + (t : Num)) && t < 1 + (s + t)"))]))
  let t704 = @tactics.disch_then(fn(x701 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x701
    let t703 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("sizeof((s : Term))"), th))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("sizeof((t : Term))"), th)), t703)
  })
  let t700 = @simp.asm_rewrite_tac(@list.List([]))
  let t699 = @class.asm_cases_tac(@term_syntax.parse_term("(n : Num) == sizeof(Comb((s : Term), (t : Term)))"))
  let t698 = @tactics.pop_assum(fn(x695 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s696 = @tactics.mp_tac(x695)
    fn(x697 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s696(x697)
    }
  })
  let t694 = @tactics.disch_then(fn(x693 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t692 = @term_syntax.parse_term("(t : Term)")
  let t773 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : Term)"), t692])), t694), t698), t699), t700), t704), t705), t715), t716), t717), t720), t721), t723), t727), t737), t738), t745), t746), t750), t755), t762), t763), @tactics.disj2_tac), @tactics.conj_tac), t765), t766), t767), t768), t769), t770), t771), t772)
  let t691 = @simp.rewrite_tac(@list.List([semantics(), typeset(), typeset_lemma(), @syntax.type_subst(), @syntax.term_distinct()]))
  let t690 = @simp.rewrite_tac(@list.List([@syntax.typeof_(), @syntax.has_type_rules(), @syntax.type_subst(), @syntax.vfree_in()]))
  let t689 = @simp.asm_rewrite_tac(@list.List([@syntax.result_distinct(), @syntax.result_inj(), @theorems.unwind_thm1()]))
  let t688 = @simp.rewrite_tac(@list.List([@syntax.type_subst(), @syntax.result(), @syntax.vfree_in(), @syntax.term_distinct()]))
  let t774 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x687 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t688), t689), t690), t691)
  let t686 = @simp.rewrite_tac(@list.List([semantics(), typeset(), typeset_lemma(), @syntax.type_subst(), @syntax.term_distinct()]))
  let t685 = @simp.rewrite_tac(@list.List([@syntax.typeof_(), @syntax.has_type_rules(), @syntax.type_subst(), @syntax.vfree_in()]))
  let t684 = @simp.asm_rewrite_tac(@list.List([@syntax.result_distinct(), @syntax.result_inj(), @theorems.unwind_thm1()]))
  let t683 = @simp.rewrite_tac(@list.List([@syntax.type_subst(), @syntax.result(), @syntax.vfree_in(), @syntax.term_distinct()]))
  let t775 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x682 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t683), t684), t685), t686)
  let t681 = @meson.asm_meson_tac(@list.List([]))
  let t680 = @simp.rewrite_tac(@list.List([@syntax.result(), semantics(), @syntax.vfree_in(), @syntax.term_inj()]))
  let t679 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t678 = @simp.rewrite_tac(@list.List([@syntax.typeof_(), @syntax.has_type_rules()]))
  let t677 = @simp.asm_rewrite_tac(@list.List([@syntax.result_distinct(), @syntax.result_inj(), @theorems.unwind_thm1()]))
  let t676 = @tactics.repeat_tac(@tactics.gen_tac)
  let t675 = @simp.rewrite_tac(@list.List([@syntax.rev_assocd(), @pair.let_def(), @pair.let_end_def()]))
  let t776 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x674 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t675), t676), @class.cond_cases_tac), t677), t678), t679), t680), t681), t775, t774, t773, @tactics.all_tac])
  let t673 = @tactics.repeat_tac(@tactics.conj_tac)
  let t672 = @simp.rewrite_tac(@list.List([semantics()]))
  let t671 = @simp.once_rewrite_tac(@list.List([@syntax.inst_core()]))
  let t670 = @tactics.match_mp_tac(@syntax.term_induct())
  let t1275 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@arith.num_wf()), @tactics.gen_tac), @tactics.disch_tac), t670), t671), t672), t673), t776), t779), t781), t785), t786), t787), t789), @tactics.disch_tac), t790), t791), @tactics.strip_tac), t792), t799), t800), t809), t810), @tactics.ants_tac), t813), t817), t961), t970), t971), t972), @class.cond_cases_tac), t973), t991), t998), @tactics.strip_tac), t999), t1000), t1001), t1002), t1003), t1004), t1005), t1012), t1013), t1021), t1022), t1023), t1027), @tactics.strip_tac), t1028), t1029), @tactics.disch_tac), t1032), t1033), t1041), @tactics.disch_tac), @tactics.ants_tac), t1051), t1055), t1126), t1127), t1134), t1135), t1136), t1137), t1138), @tactics.conj_tac), t1147), @tactics.disch_tac), t1148), @tactics.conj_tac), t1160), @tactics.disch_tac), @tactics.conj_tac), t1187), t1188), t1189), t1190), t1191), t1192), @tactics.conj_tac), t1193), t1194), t1195), @tactics.disch_tac), @tactics.conj_tac), t1198), t1199), @tactics.conj_tac), t1213), fn(x1220 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1214 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x1214
      @tactics.first_x_assum(fn(x1216 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let th_13 = x1216
        let t1219 = @equal.lhand(w)
        @tactics.mp_tac(@drule.part_match(fn(x1218 : @kernel.Term) -> @kernel.Term raise {
          @equal.lhand(@kernel.rand(x1218))
        }, th_13)(t1219))
      })
    })(x1220)(x1220)
  }), t1221), @tactics.disch_tac), t1222), t1223), t1224), t1232), @tactics.ants_tac), t1244), t1248), t1249), t1250), @tactics.conj_tac), t1252), t1253), t1254), t1255), t1256), @tactics.conj_tac), t1267), t1269), @tactics.disch_tac), t1270), t1271), t1272), t1273), t1274)
  semantics_inst_core_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ tm : Term, ∀ env : List[(Term, Term)], ∀ tyin : List[(Type, Type)], welltyped(tm) && sizeof(tm) == n && (∀ s : Term, ∀ s' : Term, MEM((s, s'), env) → (∃ x : List[Char], ∃ ty : Type, s == Var(x, ty) && s' == Var(x, TYPE_SUBST(tyin, ty)))) → (∃ x : List[Char], ∃ ty : Type, INST_CORE(env, tyin, tm) == Clash(Var(x, TYPE_SUBST(tyin, ty))) && VFREE_IN(Var(x, ty), tm) && !(REV_ASSOCD(Var(x, TYPE_SUBST(tyin, ty)), env, Var(x, ty)) == Var(x, ty))) || (∀ x : List[Char], ∀ ty : Type, VFREE_IN(Var(x, ty), tm) → REV_ASSOCD(Var(x, TYPE_SUBST(tyin, ty)), env, Var(x, ty)) == Var(x, ty)) && (∃ tm' : Term, INST_CORE(env, tyin, tm) == Result(tm') && has_type(tm', TYPE_SUBST(tyin, typeof_(tm))) && (∀ u : List[Char], ∀ uty : Type, VFREE_IN(Var(u, uty), tm') == (∃ oty : Type, VFREE_IN(Var(u, oty), tm) && uty == TYPE_SUBST(tyin, oty))) && (∀ sigma : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, type_valuation(tau) && term_valuation(tau, sigma) → semantics(sigma, tau, tm') == semantics(GABS((f : ((List[Char], Type)) -> V) => ∀ x : List[Char], ∀ ty : Type, GEQ(f((x, ty)), sigma((x, TYPE_SUBST(tyin, ty))))), (s : List[Char]) => typeset(tau, TYPE_SUBST(tyin, Tyvar(s))), tm)))"), t1275))
}

///|
let semantics_inst_core_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEMANTICS_INST_CORE")

///|
/// `SEMANTICS_INST_CORE`
pub fn semantics_inst_core() -> @kernel.Thm {
  semantics_inst_core_c.get()
}

///|
/// SEMANTICS_INST
fn step_34() -> Unit raise {
  let t1281 = @meson.meson_tac(@list.List([@syntax.result()]))
  let t1280 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @syntax.inst_def(), @syntax.rev_assocd()]))
  let t1276 = @term_syntax.parse_term("(tyin : List[(Type, Type)])")
  let t1277 = @term_syntax.parse_term("(NIL : List[(Term, Term)])")
  let t1278 = @term_syntax.parse_term("(tm : Term)")
  let t1279 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("sizeof((tm : Term))"), t1278, t1277, t1276]), semantics_inst_core()))
  let t1282 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1279), t1280), t1281)
  semantics_inst_c.set(@tactics.prove(@term_syntax.parse_term("∀ tyin : List[(Type, Type)], ∀ tm : Term, welltyped(tm) → has_type(INST(tyin, tm), TYPE_SUBST(tyin, typeof_(tm))) && (∀ u : List[Char], ∀ uty : Type, VFREE_IN(Var(u, uty), INST(tyin, tm)) == (∃ oty : Type, VFREE_IN(Var(u, oty), tm) && uty == TYPE_SUBST(tyin, oty))) && (∀ sigma : ((List[Char], Type)) -> V, ∀ tau : (List[Char]) -> V, type_valuation(tau) && term_valuation(tau, sigma) → semantics(sigma, tau, INST(tyin, tm)) == semantics(GABS((f : ((List[Char], Type)) -> V) => ∀ x : List[Char], ∀ ty : Type, GEQ(f((x, ty)), sigma((x, TYPE_SUBST(tyin, ty))))), (s : List[Char]) => typeset(tau, TYPE_SUBST(tyin, Tyvar(s))), tm))"), t1282))
}

///|
let semantics_inst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEMANTICS_INST")

///|
/// `SEMANTICS_INST`
pub fn semantics_inst() -> @kernel.Thm {
  semantics_inst_c.get()
}

///|
/// INST_TYPE_correct
fn step_35() -> Unit raise {
  let t1316 = @simp.asm_simp_tac(@list.List([semantics_inst(), @trivia.o_thm()]))
  let t1315 = @list.List([@meson.asm_meson_tac(@list.List([@lists.all_mem(), @lists.mem(), @syntax.welltyped()])), @tactics.all_tac])
  let t1314 = @tactics.subgoal_then(@term_syntax.parse_term("welltyped((a : Term))"), fn(x1311 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1312 = @tactics.mp_tac(x1311)
    fn(x1313 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1312(x1313)
    }
  })
  let t1310 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Term)"))
  let t1309 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@lists.all_imp()))
  let t1306 = @simp.gen_rewrite_rule(fn(x1305 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1305
  }, @list.List([@lists.all_map()]))
  let t1308 = @tactics.first_x_assum(fn(x1307 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1302 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1303 = @tactics.mp_tac(x1302)
      fn(x1304 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1303(x1304)
      }
    })(t1306(x1307))
  })
  let t1300 = @meson.asm_meson_tac(@list.List([term_valuation()]))
  let t1299 = @simp.rewrite_tac(@list.List([@syntax.type_subst(), typeset_lemma()]))
  let t1301 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([term_valuation()])), t1299), t1300), @tactics.all_tac])
  let t1297 = @meson.asm_meson_tac(@list.List([typeset_inhabited()]))
  let t1298 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([type_valuation()])), t1297), @tactics.all_tac])
  let t1296 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1295 = @simp.asm_simp_tac(@list.List([semantics_inst()]))
  let t1294 = @list.List([@meson.asm_meson_tac(@list.List([@syntax.welltyped(), @lists.all()])), @tactics.all_tac])
  let t1293 = @tactics.subgoal_then(@term_syntax.parse_term("welltyped((p : Term))"), fn(x1290 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1291 = @tactics.assume_tac(x1290)
    fn(x1292 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1291(x1292)
    }
  })
  let t1288 = @meson.asm_meson_tac(@list.List([semantics_inst(), @syntax.type_subst(), @syntax.welltyped(), @syntax.welltyped_v1(), @syntax.welltyped_lemma()]))
  let t1286 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t1287 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@lists.all_imp())), @tactics.gen_tac), @tactics.disch_tac), t1286)])
  let t1285 = @tactics.match_mp_tac(@theorems.mono_and())
  let t1284 = @simp.rewrite_tac(@list.List([@lists.all(), @lists.all_map()]))
  let t1289 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ALL((a : Term) => has_type(a, Bool), CONS((p : Term), (asl : List[Term])))")), t1284), t1285), @tactics.conj_tac), t1287), t1288), @tactics.all_tac])
  let t1283 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1317 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([sequent()])), t1283), t1289), t1293), t1294), t1295), t1296), @tactics.conj_tac), t1298), @tactics.conj_tac), t1301), t1308), t1309), t1310), @tactics.disch_tac), t1314), t1315), t1316)
  inst_type_correct_c.set(@tactics.prove(@term_syntax.parse_term("∀ tyin : List[(Type, Type)], ∀ asl : List[Term], ∀ p : Term, op_bar_eq(asl, p) → op_bar_eq(MAP(INST(tyin), asl), INST(tyin, p))"), t1317))
}

///|
let inst_type_correct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INST_TYPE_correct")

///|
/// `INST_TYPE_correct`
pub fn inst_type_correct() -> @kernel.Thm {
  inst_type_correct_c.get()
}

///|
/// HOL_IS_SOUND
fn step_36() -> Unit raise {
  let t1322 = @meson.asm_meson_tac(@list.List([@syntax.welltyped_clauses(), mk_comb_correct()]))
  let t1321 = @tactics.match_mp_tac(mk_comb_correct())
  let t1320 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1318 = @simp.rewrite_rule(@list.List([@theorems.imp_imp()]))(inst_correct())
  let t1319 = @simp.rewrite_tac(@list.List([refl_correct(), trans_correct(), abs_correct(), beta_correct(), assume_correct(), eq_mp_correct(), inst_type_correct(), @simp.rewrite_rule(@list.List([@pair.let_def(), @pair.let_end_def()]))(deduct_antisym_rule_correct()), t1318]))
  let t1323 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@syntax.proves_induct()), t1319), t1320), t1321), t1322)
  hol_is_sound_c.set(@tactics.prove(@term_syntax.parse_term("∀ asl : List[Term], ∀ p : Term, op_bar_minus(asl, p) → op_bar_eq(asl, p)"), t1323))
}

///|
let hol_is_sound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOL_IS_SOUND")

///|
/// `HOL_IS_SOUND`
pub fn hol_is_sound() -> @kernel.Thm {
  hol_is_sound_c.get()
}

///|
/// HOL_IS_CONSISTENT
fn step_37() -> Unit raise {
  let t1344 = @meson.meson_tac(@list.List([@modelset.in_bool()]))
  let t1343 = @simp.rewrite_tac(@list.List([type_valuation()]))
  let t1342 = @tactics.match_mp_tac(typeset_inhabited())
  let t1341 = @tactics.conv_tac(@class.select_conv)
  let t1340 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([typeset(), @modelset.in_bool()]))))
  let t1339 = @simp.rewrite_tac(@list.List([@modelset.valmod_v1(), @pair.pair_eq()]))
  let t1338 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1337 = @simp.rewrite_tac(@list.List([term_valuation()]))
  let t1336 = @list.List([@meson.meson_tac(@list.List([@modelset.in_bool()])), @tactics.all_tac])
  let t1335 = @simp.asm_rewrite_tac(@list.List([type_valuation(), @modelset.valmod_v1(), @pair.pair_eq(), @modelset.true_ne_false()]))
  let t1334 = @tactics.exists_tac(@term_syntax.parse_term("(x : List[Char]) => boolset"))
  let t1333 = @tactics.exists_tac(@term_syntax.parse_term("op_bar_minus_gt(((x : List[Char]), Bool), False, op_bar_minus_gt(((y : List[Char]), Bool), True, GABS((f : ((List[Char], Type)) -> V) => ∀ x : List[Char], ∀ ty : Type, GEQ(f((x, ty)), select((a : V) => op_lt_colon(a, typeset((x : List[Char]) => boolset, ty)))))))"))
  let t1332 = @simp.rewrite_tac(@list.List([@syntax.vfree_in(), @syntax.term_inj(), @class.not_forall_thm()]))
  let t1331 = @simp.abbrev_tac(@term_syntax.parse_term("(y : List[Char]) == VARIANT(Var((x : List[Char]), Bool), x, Bool)"))
  let t1328 = @term_syntax.parse_term("Bool")
  let t1329 = @term_syntax.parse_term("(x : List[Char])")
  let t1330 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("Var((x : List[Char]), Bool)"), t1329, t1328]), @syntax.variant()))
  let t1327 = @simp.simp_tac(@list.List([@syntax.equation_has_type_bool(), @syntax.welltyped_clauses(), @syntax.typeof_(), sequent(), @lists.all(), semantics_equation(), @syntax.has_type_rules(), semantics(), @modelset.boolean_eq_true()]))
  let t1326 = @tactics.exists_tac(@term_syntax.parse_term("op_eq_eq_eq(Var((x : List[Char]), Bool), Var(VARIANT(Var(x, Bool), x, Bool), Bool))"))
  let t1345 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("∃ p : Term, has_type(p, Bool) && !op_bar_eq(NIL, p)"), fn(x1324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1324
    @meson.meson_tac(@list.List([th, hol_is_sound()]))
  }), t1326), t1327), t1330), t1331), t1332), @tactics.disch_tac), t1333), t1334), t1335), @tactics.conj_tac), t1336), t1337), t1338), t1339), t1340), t1341), t1342), t1343), t1344)
  hol_is_consistent_c.set(@tactics.prove(@term_syntax.parse_term("∃ p : Term, has_type(p, Bool) && !op_bar_minus(NIL, p)"), t1345))
}

///|
let hol_is_consistent_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOL_IS_CONSISTENT")

///|
/// `HOL_IS_CONSISTENT`
pub fn hol_is_consistent() -> @kernel.Thm {
  hol_is_consistent_c.get()
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
}
