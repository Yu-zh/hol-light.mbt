// Translated from upstream Model/syntax.ml; edit this file directly.

///|
let type_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("type_INDUCT")

///|
/// `type_INDUCT`
pub fn type_induct() -> @kernel.Thm {
  type_induct_c.get()
}

///|
let type_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("type_RECURSION")

///|
/// `type_RECURSION`
pub fn type_recursion() -> @kernel.Thm {
  type_recursion_c.get()
}

///|
/// type_INDUCT, type_RECURSION
fn step_1() -> Unit raise {
  let (type_induct, type_recursion) = @ind_types.define_type("type = Tyvar string\n            | Bool\n            | Ind\n            | Fun type type")
  type_induct_c.set(type_induct)
  type_recursion_c.set(type_recursion)
}

///|
/// type_DISTINCT
fn step_2() -> Unit raise {
  type_distinct_c.set(@ind_types.distinctness("type"))
}

///|
let type_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("type_DISTINCT")

///|
/// `type_DISTINCT`
pub fn type_distinct() -> @kernel.Thm {
  type_distinct_c.get()
}

///|
/// type_INJ
fn step_3() -> Unit raise {
  type_inj_c.set(@ind_types.injectivity("type"))
}

///|
let type_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("type_INJ")

///|
/// `type_INJ`
pub fn type_inj() -> @kernel.Thm {
  type_inj_c.get()
}

///|
/// domain
fn step_4() -> Unit raise {
  domain_c.set(@define.define_(@term_syntax.parse_term("(domain : (Type) -> Type)(Fun((s : Type), (t : Type))) == s")))
}

///|
let domain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("domain")

///|
/// `domain`
pub fn domain() -> @kernel.Thm {
  domain_c.get()
}

///|
/// codomain
fn step_5() -> Unit raise {
  codomain_c.set(@define.define_(@term_syntax.parse_term("(codomain : (Type) -> Type)(Fun((s : Type), (t : Type))) == t")))
}

///|
let codomain_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("codomain")

///|
/// `codomain`
pub fn codomain() -> @kernel.Thm {
  codomain_c.get()
}

///|
let term_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_INDUCT")

///|
/// `term_INDUCT`
pub fn term_induct() -> @kernel.Thm {
  term_induct_c.get()
}

///|
let term_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_RECURSION")

///|
/// `term_RECURSION`
pub fn term_recursion() -> @kernel.Thm {
  term_recursion_c.get()
}

///|
/// term_INDUCT, term_RECURSION
fn step_6() -> Unit raise {
  let (term_induct, term_recursion) = @ind_types.define_type("term = Var string type\n       | Equal type | Select type\n       | Comb term term\n       | Abs string type term")
  term_induct_c.set(term_induct)
  term_recursion_c.set(term_recursion)
}

///|
/// term_DISTINCT
fn step_7() -> Unit raise {
  term_distinct_c.set(@ind_types.distinctness("term"))
}

///|
let term_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_DISTINCT")

///|
/// `term_DISTINCT`
pub fn term_distinct() -> @kernel.Thm {
  term_distinct_c.get()
}

///|
/// term_INJ
fn step_8() -> Unit raise {
  term_inj_c.set(@ind_types.injectivity("term"))
}

///|
let term_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("term_INJ")

///|
/// `term_INJ`
pub fn term_inj() -> @kernel.Thm {
  term_inj_c.get()
}

///|
/// Model/syntax.ml:44
fn step_9() -> Unit raise {
  @printer.parse_as_infix("has_type", (12L, "right"))
}

///|
let has_type_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("has_type_RULES")

///|
/// `has_type_RULES`
pub fn has_type_rules() -> @kernel.Thm {
  has_type_rules_c.get()
}

///|
let has_type_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("has_type_INDUCT")

///|
/// `has_type_INDUCT`
pub fn has_type_induct() -> @kernel.Thm {
  has_type_induct_c.get()
}

///|
let has_type_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("has_type_CASES")

///|
/// `has_type_CASES`
pub fn has_type_cases() -> @kernel.Thm {
  has_type_cases_c.get()
}

///|
/// has_type_RULES, has_type_INDUCT, has_type_CASES
fn step_10() -> Unit raise {
  let (has_type_rules, has_type_induct, has_type_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ n : List[Char], ∀ ty : Type, (has_type : (Term, Type) -> Bool)(Var(n, ty), ty)) && (∀ ty : Type, has_type(Equal(ty), Fun(ty, Fun(ty, Bool)))) && (∀ ty : Type, has_type(Select(ty), Fun(Fun(ty, Bool), ty))) && (∀ s : Term, ∀ t : Term, ∀ dty : Type, ∀ rty : Type, has_type(s, Fun(dty, rty)) && has_type(t, dty) → has_type(Comb(s, t), rty)) && (∀ n : List[Char], ∀ dty : Type, ∀ t : Term, ∀ rty : Type, has_type(t, rty) → has_type(Abs(n, dty, t), Fun(dty, rty)))"))
  has_type_rules_c.set(has_type_rules)
  has_type_induct_c.set(has_type_induct)
  has_type_cases_c.set(has_type_cases)
}

///|
/// welltyped
fn step_11() -> Unit raise {
  welltyped_c.set(@pair.new_definition(@term_syntax.parse_term("(welltyped : (Term) -> Bool)((tm : Term)) == (∃ ty : Type, has_type(tm, ty))")))
}

///|
let welltyped_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("welltyped")

///|
/// `welltyped`
pub fn welltyped() -> @kernel.Thm {
  welltyped_c.get()
}

///|
/// typeof
fn step_12() -> Unit raise {
  typeof_c.set(@define.define_(@parser.parse_term("(typeof_ (Var n ty) = ty) /\\\n  (typeof_ (Equal ty) = Fun ty (Fun ty Bool)) /\\\n  (typeof_ (Select ty) = Fun (Fun ty Bool) ty) /\\\n  (typeof_ (Comb s t) = codomain (typeof_ s)) /\\\n  (typeof_ (Abs n ty t) = Fun ty (typeof_ t))")))
}

///|
let typeof_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("typeof")

///|
/// `typeof`
pub fn typeof_() -> @kernel.Thm {
  typeof_c.get()
}

///|
/// WELLTYPED_LEMMA
fn step_13() -> Unit raise {
  let t1 = @simp.simp_tac(@list.List([typeof_(), has_type_rules(), codomain()]))
  let t2 = @tactics.then_tac(@tactics.match_mp_tac(has_type_induct()), t1)
  welltyped_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ tm : Term, ∀ ty : Type, has_type(tm, ty) → typeof_(tm) == ty"), t2))
}

///|
let welltyped_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WELLTYPED_LEMMA")

///|
/// `WELLTYPED_LEMMA`
pub fn welltyped_lemma() -> @kernel.Thm {
  welltyped_lemma_c.get()
}

///|
/// WELLTYPED
fn step_14() -> Unit raise {
  let t3 = @meson.meson_tac(@list.List([welltyped_lemma()]))
  let t4 = @tactics.then_tac(@simp.rewrite_tac(@list.List([welltyped()])), t3)
  welltyped_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ tm : Term, welltyped(tm) == has_type(tm, typeof_(tm))"), t4))
}

///|
let welltyped_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WELLTYPED")

///|
/// `WELLTYPED`
pub fn welltyped_v1() -> @kernel.Thm {
  welltyped_v1_c.get()
}

///|
/// WELLTYPED_CLAUSES
fn step_15() -> Unit raise {
  let t19 = @meson.meson_tac(@list.List([welltyped_v1(), welltyped_lemma()]))
  let t18 = @simp.rewrite_tac(@list.List([term_inj(), term_distinct()]))
  let t16 = @simp.gen_rewrite_tac(fn(x15 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x9 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s10 = @equal.land_conv(x9)
      fn(x11 : @kernel.Term) -> @kernel.Thm raise {
        s10(x11)
      }
    })((fn(x12 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s13 = @equal.binder_conv(x12)
      fn(x14 : @kernel.Term) -> @kernel.Thm raise {
        s13(x14)
      }
    })(x15))
  }, @list.List([has_type_cases()]))
  let t17 = @tactics.orelse_tac(@simp.gen_rewrite_tac(fn(x6 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s7 = @equal.binder_conv(x6)
    fn(x8 : @kernel.Term) -> @kernel.Thm raise {
      s7(x8)
    }
  }, @list.List([has_type_cases()])), t16)
  let t5 = @simp.rewrite_tac(@list.List([welltyped()]))
  let t20 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t5), t17), t18), t19)
  welltyped_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ n : List[Char], ∀ ty : Type, welltyped(Var(n, ty))) && (∀ ty : Type, welltyped(Equal(ty))) && (∀ ty : Type, welltyped(Select(ty))) && (∀ s : Term, ∀ t : Term, welltyped(Comb(s, t)) == (welltyped(s) && welltyped(t) && (∃ rty : Type, typeof_(s) == Fun(typeof_(t), rty)))) && (∀ n : List[Char], ∀ ty : Type, ∀ t : Term, welltyped(Abs(n, ty, t)) == welltyped(t))"), t20))
}

///|
let welltyped_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WELLTYPED_CLAUSES")

///|
/// `WELLTYPED_CLAUSES`
pub fn welltyped_clauses() -> @kernel.Thm {
  welltyped_clauses_c.get()
}

///|
/// Model/syntax.ml:91
fn step_16() -> Unit raise {
  @printer.parse_as_infix("===", (18L, "right"))
}

///|
/// equation
fn step_17() -> Unit raise {
  equation_c.set(@pair.new_definition(@term_syntax.parse_term("(op_eq_eq_eq : (Term, Term) -> Term)((s : Term), (t : Term)) == Comb(Comb(Equal(typeof_(s)), s), t)")))
}

///|
let equation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("equation")

///|
/// `equation`
pub fn equation() -> @kernel.Thm {
  equation_c.get()
}

///|
/// EQUATION_HAS_TYPE_BOOL
fn step_18() -> Unit raise {
  let t55 = @meson.meson_tac(@list.List([welltyped_v1(), welltyped_lemma()]))
  let t54 = @simp.rewrite_tac(@list.List([term_distinct(), term_inj(), type_inj()]))
  let t53 = @simp.gen_rewrite_tac(fn(x52 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x41 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s42 = @equal.land_conv(x41)
      fn(x43 : @kernel.Term) -> @kernel.Thm raise {
        s42(x43)
      }
    })(((x51 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(2, fn(x50 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x44 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s45 = @equal.binder_conv(x44)
        fn(x46 : @kernel.Term) -> @kernel.Thm raise {
          s45(x46)
        }
      })((fn(x47 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s48 = @equal.land_conv(x47)
        fn(x49 : @kernel.Term) -> @kernel.Thm raise {
          s48(x49)
        }
      })(x50))
    }, x51))(x52))
  }, @list.List([has_type_cases()]))
  let t40 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm1()]))
  let t39 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @theorems.right_exists_and_thm()]))
  let t38 = @simp.rewrite_tac(@list.List([term_distinct(), term_inj()]))
  let t37 = @simp.gen_rewrite_tac(fn(x36 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x32 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x26 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s27 = @equal.land_conv(x26)
        fn(x28 : @kernel.Term) -> @kernel.Thm raise {
          s27(x28)
        }
      })((fn(x29 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s30 = @equal.binder_conv(x29)
        fn(x31 : @kernel.Term) -> @kernel.Thm raise {
          s30(x31)
        }
      })(x32))
    })((fn(x33 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s34 = @equal.land_conv(x33)
      fn(x35 : @kernel.Term) -> @kernel.Thm raise {
        s34(x35)
      }
    })(x36))
  }, @list.List([has_type_cases()]))
  let t25 = @tactics.repeat_tac(@tactics.gen_tac)
  let t24 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm1()]))
  let t23 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc()), @theorems.right_exists_and_thm()]))
  let t22 = @simp.rewrite_tac(@list.List([term_distinct(), term_inj()]))
  let t21 = @simp.once_rewrite_tac(@list.List([has_type_cases()]))
  let t56 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([equation()])), t21), t22), t23), t24), t25), t37), t38), t39), t40), t53), t54), t55)
  equation_has_type_bool_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, has_type(op_eq_eq_eq(s, t), Bool) == (welltyped(s) && welltyped(t) && typeof_(s) == typeof_(t))"), t56))
}

///|
let equation_has_type_bool_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQUATION_HAS_TYPE_BOOL")

///|
/// `EQUATION_HAS_TYPE_BOOL`
pub fn equation_has_type_bool() -> @kernel.Thm {
  equation_has_type_bool_c.get()
}

///|
/// ALPHAVARS
fn step_19() -> Unit raise {
  alphavars_c.set(@define.define_(@term_syntax.parse_term("(ALPHAVARS : (List[(_, _)], (_, _)) -> Bool)(NIL, (tmp : (_, _))) == (FST(tmp) == SND(tmp)) && ALPHAVARS(CONS((tp : (_, _)), (oenv : List[(_, _)])), tmp) == (tmp == tp || !(FST(tp) == FST(tmp)) && !(SND(tp) == SND(tmp)) && ALPHAVARS(oenv, tmp))")))
}

///|
let alphavars_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALPHAVARS")

///|
/// `ALPHAVARS`
pub fn alphavars() -> @kernel.Thm {
  alphavars_c.get()
}

///|
let raconv_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RACONV_RULES")

///|
/// `RACONV_RULES`
pub fn raconv_rules() -> @kernel.Thm {
  raconv_rules_c.get()
}

///|
let raconv_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RACONV_INDUCT")

///|
/// `RACONV_INDUCT`
pub fn raconv_induct() -> @kernel.Thm {
  raconv_induct_c.get()
}

///|
let raconv_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RACONV_CASES")

///|
/// `RACONV_CASES`
pub fn raconv_cases() -> @kernel.Thm {
  raconv_cases_c.get()
}

///|
/// RACONV_RULES, RACONV_INDUCT, RACONV_CASES
fn step_20() -> Unit raise {
  let (raconv_rules, raconv_induct, raconv_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ env : List[(Term, Term)], ∀ x1 : List[Char], ∀ ty1 : Type, ∀ x2 : List[Char], ∀ ty2 : Type, ALPHAVARS(env, (Var(x1, ty1), Var(x2, ty2))) → (RACONV : (List[(Term, Term)], (Term, Term)) -> Bool)(env, (Var(x1, ty1), Var(x2, ty2)))) && (∀ env : List[(Term, Term)], ∀ ty : Type, RACONV(env, (Equal(ty), Equal(ty)))) && (∀ env : List[(Term, Term)], ∀ ty : Type, RACONV(env, (Select(ty), Select(ty)))) && (∀ env : List[(Term, Term)], ∀ s1 : Term, ∀ t1 : Term, ∀ s2 : Term, ∀ t2 : Term, RACONV(env, (s1, s2)) && RACONV(env, (t1, t2)) → RACONV(env, (Comb(s1, t1), Comb(s2, t2)))) && (∀ env : List[(Term, Term)], ∀ x1 : List[Char], ∀ ty1 : Type, ∀ t1 : Term, ∀ x2 : List[Char], ∀ ty2 : Type, ∀ t2 : Term, ty1 == ty2 && RACONV(CONS((Var(x1, ty1), Var(x2, ty2)), env), (t1, t2)) → RACONV(env, (Abs(x1, ty1, t1), Abs(x2, ty2, t2))))"))
  raconv_rules_c.set(raconv_rules)
  raconv_induct_c.set(raconv_induct)
  raconv_cases_c.set(raconv_cases)
}

///|
/// RACONV
fn step_21() -> Unit raise {
  let t62 = @meson.meson_tac(@list.List([]))
  let t61 = @simp.rewrite_tac(@list.List([term_inj(), term_distinct(), @pair.pair_eq()]))
  let t60 = @simp.gen_rewrite_tac(fn(x57 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s58 = @equal.land_conv(x57)
    fn(x59 : @kernel.Term) -> @kernel.Thm raise {
      s58(x59)
    }
  }, @list.List([raconv_cases()]))
  let t63 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t60), t61), t62)
  raconv_c.set(@tactics.prove(@term_syntax.parse_term("RACONV((env : List[(Term, Term)]), (Var((x1 : List[Char]), (ty1 : Type)), Var((x2 : List[Char]), (ty2 : Type)))) == ALPHAVARS(env, (Var(x1, ty1), Var(x2, ty2))) && RACONV(env, (Var(x1, ty1), Equal(ty2))) == false && RACONV(env, (Var(x1, ty1), Select(ty2))) == false && RACONV(env, (Var(x1, ty1), Comb((l2 : Term), (r2 : Term)))) == false && RACONV(env, (Var(x1, ty1), Abs(x2, ty2, (t2 : Term)))) == false && RACONV(env, (Equal(ty1), Var(x2, ty2))) == false && RACONV(env, (Equal(ty1), Equal(ty2))) == (ty1 == ty2) && RACONV(env, (Equal(ty1), Select(ty2))) == false && RACONV(env, (Equal(ty1), Comb(l2, r2))) == false && RACONV(env, (Equal(ty1), Abs(x2, ty2, t2))) == false && RACONV(env, (Select(ty1), Var(x2, ty2))) == false && RACONV(env, (Select(ty1), Equal(ty2))) == false && RACONV(env, (Select(ty1), Select(ty2))) == (ty1 == ty2) && RACONV(env, (Select(ty1), Comb(l2, r2))) == false && RACONV(env, (Select(ty1), Abs(x2, ty2, t2))) == false && RACONV(env, (Comb((l1 : Term), (r1 : Term)), Var(x2, ty2))) == false && RACONV(env, (Comb(l1, r1), Equal(ty2))) == false && RACONV(env, (Comb(l1, r1), Select(ty2))) == false && RACONV(env, (Comb(l1, r1), Comb(l2, r2))) == (RACONV(env, (l1, l2)) && RACONV(env, (r1, r2))) && RACONV(env, (Comb(l1, r1), Abs(x2, ty2, t2))) == false && RACONV(env, (Abs(x1, ty1, (t1 : Term)), Var(x2, ty2))) == false && RACONV(env, (Abs(x1, ty1, t1), Equal(ty2))) == false && RACONV(env, (Abs(x1, ty1, t1), Select(ty2))) == false && RACONV(env, (Abs(x1, ty1, t1), Comb(l2, r2))) == false && RACONV(env, (Abs(x1, ty1, t1), Abs(x2, ty2, t2))) == (ty1 == ty2 && RACONV(CONS((Var(x1, ty1), Var(x2, ty2)), env), (t1, t2)))"), t63))
}

///|
let raconv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RACONV")

///|
/// `RACONV`
pub fn raconv() -> @kernel.Thm {
  raconv_c.get()
}

///|
/// ACONV
fn step_22() -> Unit raise {
  aconv_c.set(@pair.new_definition(@term_syntax.parse_term("(ACONV : (Term, Term) -> Bool)((t1 : Term), (t2 : Term)) == RACONV(NIL, (t1, t2))")))
}

///|
let aconv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ACONV")

///|
/// `ACONV`
pub fn aconv() -> @kernel.Thm {
  aconv_c.get()
}

///|
/// ALPHAVARS_REFL
fn step_23() -> Unit raise {
  let t67 = @meson.meson_tac(@list.List([@pair.pair_eq()]))
  let t66 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t65 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t64 = @simp.rewrite_tac(@list.List([@lists.all(), alphavars()]))
  let t68 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t64), t65), t66), t67)
  alphavars_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(_, _)], ∀ t : _, ALL(GABS((f : ((_, _)) -> Bool) => ∀ s : _, ∀ t : _, GEQ(f((s, t)), s == t)), env) → ALPHAVARS(env, (t, t))"), t68))
}

///|
let alphavars_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALPHAVARS_REFL")

///|
/// `ALPHAVARS_REFL`
pub fn alphavars_refl() -> @kernel.Thm {
  alphavars_refl_c.get()
}

///|
/// RACONV_REFL
fn step_24() -> Unit raise {
  let t73 = @simp.asm_rewrite_tac(@list.List([]))
  let t72 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t71 = @simp.asm_rewrite_tac(@list.List([@lists.all()]))
  let t74 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t71), t72), t73)
  let t75 = @meson.asm_meson_tac(@list.List([]))
  let t76 = @meson.asm_meson_tac(@list.List([]))
  let t77 = @list.List([@simp.asm_simp_tac(@list.List([alphavars_refl()])), t76, t75, t74])
  let t70 = @tactics.repeat_tac(@tactics.strip_tac)
  let t69 = @simp.rewrite_tac(@list.List([raconv()]))
  let t78 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t69), t70), t77)
  raconv_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ∀ env : List[(Term, Term)], ALL(GABS((f : ((Term, Term)) -> Bool) => ∀ s : Term, ∀ t : Term, GEQ(f((s, t)), s == t)), env) → RACONV(env, (t, t))"), t78))
}

///|
let raconv_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RACONV_REFL")

///|
/// `RACONV_REFL`
pub fn raconv_refl() -> @kernel.Thm {
  raconv_refl_c.get()
}

///|
/// ACONV_REFL
fn step_25() -> Unit raise {
  let t79 = @simp.simp_tac(@list.List([raconv_refl(), @lists.all()]))
  let t80 = @tactics.then_tac(@simp.rewrite_tac(@list.List([aconv()])), t79)
  aconv_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ACONV(t, t)"), t80))
}

///|
let aconv_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ACONV_REFL")

///|
/// `ACONV_REFL`
pub fn aconv_refl() -> @kernel.Thm {
  aconv_refl_c.get()
}

///|
/// ALPHAVARS_TYPE
fn step_26() -> Unit raise {
  let t85 = @meson.asm_meson_tac(@list.List([]))
  let t84 = @tactics.repeat_tac(@tactics.strip_tac)
  let t83 = @list.List([@simp.simp_tac(@list.List([])), @tactics.all_tac])
  let t82 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t81 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), alphavars(), @lists.all(), @pair.pair_eq()]))
  let t86 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t81), t82), @tactics.conj_tac), t83), t84), t85)
  alphavars_type_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Term, Term)], ∀ s : Term, ∀ t : Term, ALPHAVARS(env, (s, t)) && ALL(GABS((f : ((Term, Term)) -> Bool) => ∀ x : Term, ∀ y : Term, GEQ(f((x, y)), welltyped(x) && welltyped(y) && typeof_(x) == typeof_(y))), env) && welltyped(s) && welltyped(t) → typeof_(s) == typeof_(t)"), t86))
}

///|
let alphavars_type_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALPHAVARS_TYPE")

///|
/// `ALPHAVARS_TYPE`
pub fn alphavars_type() -> @kernel.Thm {
  alphavars_type_c.get()
}

///|
/// RACONV_TYPE
fn step_27() -> Unit raise {
  let t95 = @meson.asm_meson_tac(@list.List([welltyped_clauses()]))
  let t94 = @simp.rewrite_tac(@list.List([typeof_()]))
  let t93 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t92 = @simp.asm_rewrite_tac(@list.List([@lists.all()]))
  let t91 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t96 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.ap_term_tac), t91), t92), t93), t94), t95)
  let t90 = @meson.asm_meson_tac(@list.List([welltyped_clauses()]))
  let t89 = @simp.asm_rewrite_tac(@list.List([]))
  let t97 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.first_x_assum(@tactics.match_mp_tac)), t89), t90)
  let t98 = @list.List([@meson.asm_meson_tac(@list.List([typeof_(), alphavars_type()])), t97, t96])
  let t88 = @tactics.repeat_tac(@tactics.strip_tac)
  let t87 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), typeof_()]))
  let t99 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(raconv_induct()), t87), t88), t98)
  raconv_type_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Term, Term)], ∀ p : (Term, Term), RACONV(env, p) → ALL(GABS((f : ((Term, Term)) -> Bool) => ∀ x : Term, ∀ y : Term, GEQ(f((x, y)), welltyped(x) && welltyped(y) && typeof_(x) == typeof_(y))), env) && welltyped(FST(p)) && welltyped(SND(p)) → typeof_(FST(p)) == typeof_(SND(p))"), t99))
}

///|
let raconv_type_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RACONV_TYPE")

///|
/// `RACONV_TYPE`
pub fn raconv_type() -> @kernel.Thm {
  raconv_type_c.get()
}

///|
/// ACONV_TYPE
fn step_28() -> Unit raise {
  let t103 = @meson.meson_tac(@list.List([]))
  let t102 = @simp.rewrite_tac(@list.List([aconv(), @lists.all()]))
  let t100 = @term_syntax.parse_term("((s : Term), (t : Term))")
  let t101 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(NIL : List[(Term, Term)])"), t100]), raconv_type()))
  let t104 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t101), t102), t103)
  aconv_type_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : Term, ACONV(s, t) → welltyped(s) && welltyped(t) → typeof_(s) == typeof_(t)"), t104))
}

///|
let aconv_type_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ACONV_TYPE")

///|
/// `ACONV_TYPE`
pub fn aconv_type() -> @kernel.Thm {
  aconv_type_c.get()
}

///|
/// TERM_UNION
fn step_29() -> Unit raise {
  term_union_c.set(@define.define_(@term_syntax.parse_term("(TERM_UNION : (List[Term], List[Term]) -> List[Term])(NIL, (l2 : List[Term])) == l2 && TERM_UNION(CONS((h : Term), (t : List[Term])), l2) == LET((subun : List[Term]) => LET_END(if EX(ACONV(h), subun) { subun } else { CONS(h, subun) }), TERM_UNION(t, l2))")))
}

///|
let term_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERM_UNION")

///|
/// `TERM_UNION`
pub fn term_union() -> @kernel.Thm {
  term_union_c.get()
}

///|
/// TERM_UNION_NONEW
fn step_30() -> Unit raise {
  let t107 = @meson.asm_meson_tac(@list.List([aconv_refl()]))
  let t106 = @simp.rewrite_tac(@list.List([@lists.mem()]))
  let t105 = @tactics.repeat_tac(@tactics.gen_tac)
  let t108 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([term_union(), @lists.mem()]))), @pair.let_tac), t105), @class.cond_cases_tac), t106), t107)
  term_union_nonew_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[Term], ∀ l2 : List[Term], ∀ x : Term, MEM(x, TERM_UNION(l1, l2)) → MEM(x, l1) || MEM(x, l2)"), t108))
}

///|
let term_union_nonew_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERM_UNION_NONEW")

///|
/// `TERM_UNION_NONEW`
pub fn term_union_nonew() -> @kernel.Thm {
  term_union_nonew_c.get()
}

///|
/// TERM_UNION_THM
fn step_31() -> Unit raise {
  let t112 = @meson.asm_meson_tac(@list.List([aconv_refl()]))
  let t111 = @simp.asm_rewrite_tac(@list.List([@lists.mem()]))
  let t110 = @tactics.repeat_tac(@tactics.gen_tac)
  let t109 = @list.List([@meson.meson_tac(@list.List([aconv_refl()])), @tactics.all_tac])
  let t113 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@lists.list_induct_tac, @simp.rewrite_tac(@list.List([term_union(), @lists.mem(), @equal.gsym(@lists.ex_mem())]))), t109), t110), @pair.let_tac), @class.cond_cases_tac), @tactics.strip_tac), t111), t112)
  term_union_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[Term], ∀ l2 : List[Term], ∀ x : Term, MEM(x, l1) || MEM(x, l2) → (∃ y : Term, MEM(y, TERM_UNION(l1, l2)) && ACONV(x, y))"), t113))
}

///|
let term_union_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TERM_UNION_THM")

///|
/// `TERM_UNION_THM`
pub fn term_union_thm() -> @kernel.Thm {
  term_union_thm_c.get()
}

///|
/// ALL_BOOL_TERM_UNION
fn step_32() -> Unit raise {
  let t114 = @meson.meson_tac(@list.List([term_union_nonew()]))
  let t115 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())])), t114)
  all_bool_term_union_c.set(@tactics.prove(@term_syntax.parse_term("ALL((a : Term) => has_type(a, Bool), (l1 : List[Term])) && ALL((a : Term) => has_type(a, Bool), (l2 : List[Term])) → ALL((a : Term) => has_type(a, Bool), TERM_UNION(l1, l2))"), t115))
}

///|
let all_bool_term_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL_BOOL_TERM_UNION")

///|
/// `ALL_BOOL_TERM_UNION`
pub fn all_bool_term_union() -> @kernel.Thm {
  all_bool_term_union_c.get()
}

///|
/// VFREE_IN
fn step_33() -> Unit raise {
  vfree_in_c.set(@define.define_(@term_syntax.parse_term("(VFREE_IN : (Term, Term) -> Bool)((v : Term), Var((x : List[Char]), (ty : Type))) == (Var(x, ty) == v) && VFREE_IN(v, Equal(ty)) == (Equal(ty) == v) && VFREE_IN(v, Select(ty)) == (Select(ty) == v) && VFREE_IN(v, Comb((s : Term), (t : Term))) == (VFREE_IN(v, s) || VFREE_IN(v, t)) && VFREE_IN(v, Abs(x, ty, t)) == (!(Var(x, ty) == v) && VFREE_IN(v, t))")))
}

///|
let vfree_in_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VFREE_IN")

///|
/// `VFREE_IN`
pub fn vfree_in() -> @kernel.Thm {
  vfree_in_c.get()
}

///|
/// VFREE_IN_RACONV
fn step_34() -> Unit raise {
  let t125 = @meson.meson_tac(@list.List([]))
  let t124 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t123 = @tactics.repeat_tac(@tactics.gen_tac)
  let t122 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t121 = @simp.rewrite_tac(@list.List([@lists.mem(), @pair.forall_pair_thm(), term_inj(), @pair.pair_eq()]))
  let t120 = @simp.rewrite_tac(@list.List([alphavars()]))
  let t119 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t118 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t117 = @simp.rewrite_tac(@list.List([@pair.pair_eq(), term_inj(), @lists.mem()]))
  let t116 = @simp.rewrite_tac(@list.List([vfree_in(), term_distinct()]))
  let t126 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(raconv_induct()), t116), t117), @tactics.conj_tac), t118), t119), t120), t121), @tactics.conj_tac), t122), t123), t124), t125)
  vfree_in_raconv_c.set(@tactics.prove(@term_syntax.parse_term("∀ env : List[(Term, Term)], ∀ p : (Term, Term), RACONV(env, p) → (∀ x : List[Char], ∀ ty : Type, (VFREE_IN(Var(x, ty), FST(p)) && !(∃ y : Term, MEM((Var(x, ty), y), env))) == (VFREE_IN(Var(x, ty), SND(p)) && !(∃ y : Term, MEM((y, Var(x, ty)), env))))"), t126))
}

///|
let vfree_in_raconv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VFREE_IN_RACONV")

///|
/// `VFREE_IN_RACONV`
pub fn vfree_in_raconv() -> @kernel.Thm {
  vfree_in_raconv_c.get()
}

///|
/// VFREE_IN_ACONV
fn step_35() -> Unit raise {
  let t134 = @simp.simp_tac(@list.List([@lists.mem(), @pair.fst(), @pair.snd()]))
  let t131 = @drule.match_mp(vfree_in_raconv())
  let t133 = @tactics.disch_then(fn(x132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s129 = @tactics.mp_tac(x128)
      fn(x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s129(x130)
      }
    })(t131(x132))
  })
  let t127 = @simp.rewrite_tac(@list.List([aconv()]))
  let t135 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t127), t133), t134)
  vfree_in_aconv_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : Term, ∀ t : _, ∀ x : List[Char], ∀ t : Term, ACONV(s, t) → VFREE_IN(Var(x, (ty : Type)), s) == VFREE_IN(Var(x, ty), t)"), t135))
}

///|
let vfree_in_aconv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VFREE_IN_ACONV")

///|
/// `VFREE_IN_ACONV`
pub fn vfree_in_aconv() -> @kernel.Thm {
  vfree_in_aconv_c.get()
}

///|
/// REV_ASSOCD
fn step_36() -> Unit raise {
  rev_assocd_c.set(@define.define_(@term_syntax.parse_term("(REV_ASSOCD : (_, List[(_, _)], _) -> _)((a : _), NIL, (d : _)) == d && REV_ASSOCD(a, CONS(((x : _), (y : _)), (t : List[(_, _)])), d) == (if y == a { x } else { REV_ASSOCD(a, t, d) })")))
}

///|
let rev_assocd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REV_ASSOCD")

///|
/// `REV_ASSOCD`
pub fn rev_assocd() -> @kernel.Thm {
  rev_assocd_c.get()
}

///|
/// TYPE_SUBST
fn step_37() -> Unit raise {
  type_subst_c.set(@define.define_(@term_syntax.parse_term("(TYPE_SUBST : (List[(Type, Type)], Type) -> Type)((i : List[(Type, Type)]), Tyvar((v : List[Char]))) == REV_ASSOCD(Tyvar(v), i, Tyvar(v)) && TYPE_SUBST(i, Bool) == Bool && TYPE_SUBST(i, Ind) == Ind && TYPE_SUBST(i, Fun((ty1 : Type), (ty2 : Type))) == Fun(TYPE_SUBST(i, ty1), TYPE_SUBST(i, ty2))")))
}

///|
let type_subst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TYPE_SUBST")

///|
/// `TYPE_SUBST`
pub fn type_subst() -> @kernel.Thm {
  type_subst_c.get()
}

///|
/// VFREE_IN_FINITE
fn step_38() -> Unit raise {
  let t140 = @simp.simp_tac(@list.List([@sets.finite_insert(), @sets.finite_rules(), @sets.finite_union(), @sets.finite_inter()]))
  let t137 = @sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})"))
  let t138 = @sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) || (Q : (_) -> Bool)(x)} == UNION({(x : _) | P(x)}, {(x : _) | Q(x)})"))
  let t139 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (a : _) == x} == {a}")), t138, t137]))
  let t136 = @simp.rewrite_tac(@list.List([vfree_in()]))
  let t141 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t136), t139), t140)
  vfree_in_finite_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, FINITE({(x : Term) | VFREE_IN(x, t)})"), t141))
}

///|
let vfree_in_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VFREE_IN_FINITE")

///|
/// `VFREE_IN_FINITE`
pub fn vfree_in_finite() -> @kernel.Thm {
  vfree_in_finite_c.get()
}

///|
/// VFREE_IN_FINITE_ALT
fn step_39() -> Unit raise {
  let t149 = @simp.asm_rewrite_tac(@list.List([]))
  let t148 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t147 = @tactics.exists_tac(@term_syntax.parse_term("Var((x : List[Char]), (ty : Type))"))
  let t146 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : List[Char])"))
  let t145 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image(), @sets.in_elim_thm()]))
  let t144 = @simp.simp_tac(@list.List([vfree_in_finite(), @sets.finite_image()]))
  let t143 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE(GABS((f : (Term) -> List[Char]) => ∀ x : List[Char], ∀ ty : Type, GEQ(f(Var(x, ty)), x)), {(x : Term) | VFREE_IN(x, (t : Term))})"))
  let t142 = @tactics.match_mp_tac(@sets.finite_subset())
  let t150 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t142), t143), t144), t145), t146), @tactics.disch_tac), t147), t148), t149)
  vfree_in_finite_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ∀ ty : Type, FINITE({(x : List[Char]) | VFREE_IN(Var(x, ty), t)})"), t150))
}

///|
let vfree_in_finite_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VFREE_IN_FINITE_ALT")

///|
/// `VFREE_IN_FINITE_ALT`
pub fn vfree_in_finite_alt() -> @kernel.Thm {
  vfree_in_finite_alt_c.get()
}

///|
/// VARIANT_EXISTS
fn step_40() -> Unit raise {
  let t171 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_diff(), @sets.in_elim_thm(), @sets.in_univ()]))
  let t168 = @drule.match_mp(@sets.infinite_nonempty())
  let t170 = @tactics.disch_then(fn(x169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x165 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s166 = @tactics.mp_tac(x165)
      fn(x167 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s166(x167)
      }
    })(t168(x169))
  })
  let t162 = @drule.match_mp(@sets.infinite_diff_finite())
  let t164 = @tactics.disch_then(fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s160 = @tactics.mp_tac(x159)
      fn(x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s160(x161)
      }
    })(t162(x163))
  })
  let t158 = @tactics.disch_then(fn(x157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s154 = @tactics.mp_tac(x153)
      fn(x155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s154(x155)
      }
    })(((x156 : @kernel.Thm) => @bool.conj(@sets.string_infinite(), x156))(x157))
  })
  let t151 = @term_syntax.parse_term("(ty : Type)")
  let t152 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(t : Term)"), t151]), vfree_in_finite_alt()))
  let t172 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t152), t158), t164), t170), t171)
  variant_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ∀ x : List[Char], ∀ ty : Type, ∃ x' : List[Char], !VFREE_IN(Var(x', ty), t)"), t172))
}

///|
let variant_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VARIANT_EXISTS")

///|
/// `VARIANT_EXISTS`
pub fn variant_exists() -> @kernel.Thm {
  variant_exists_c.get()
}

///|
/// VARIANT
fn step_41() -> Unit raise {
  let t173 = @simp.pure_rewrite_rule(@list.List([@class.skolem_thm()]))(variant_exists())
  variant_c.set(@nums.new_specification(@list.List(["VARIANT"]))(t173))
}

///|
let variant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VARIANT")

///|
/// `VARIANT`
pub fn variant() -> @kernel.Thm {
  variant_c.get()
}

///|
/// VSUBST
fn step_42() -> Unit raise {
  vsubst_c.set(@define.define_(@term_syntax.parse_term("(VSUBST : (List[(Term, Term)], Term) -> Term)((ilist : List[(Term, Term)]), Var((x : List[Char]), (ty : Type))) == REV_ASSOCD(Var(x, ty), ilist, Var(x, ty)) && VSUBST(ilist, Equal(ty)) == Equal(ty) && VSUBST(ilist, Select(ty)) == Select(ty) && VSUBST(ilist, Comb((s : Term), (t : Term))) == Comb(VSUBST(ilist, s), VSUBST(ilist, t)) && VSUBST(ilist, Abs(x, ty, t)) == LET((ilist' : List[(Term, Term)]) => LET_END(LET((t' : Term) => LET_END(if EX(GABS((f : ((Term, Term)) -> Bool) => ∀ s' : Term, ∀ s : Term, GEQ(f((s', s)), VFREE_IN(Var(x, ty), s') && VFREE_IN(s, t))), ilist') { LET((z : List[Char]) => LET_END(LET((ilist'' : List[(Term, Term)]) => LET_END(Abs(z, ty, VSUBST(ilist'', t))), CONS((Var(z, ty), Var(x, ty)), ilist'))), VARIANT(t', x, ty)) } else { Abs(x, ty, t') }), VSUBST(ilist', t))), FILTER(GABS((f : ((Term, Term)) -> Bool) => ∀ s' : Term, ∀ s : Term, GEQ(f((s', s)), !(s == Var(x, ty)))), ilist))")))
}

///|
let vsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUBST")

///|
/// `VSUBST`
pub fn vsubst() -> @kernel.Thm {
  vsubst_c.get()
}

///|
/// VSUBST_HAS_TYPE
fn step_43() -> Unit raise {
  let t280 = @meson.asm_meson_tac(@list.List([has_type_rules()]))
  let t279 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t278 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t277 = @simp.rewrite_tac(@list.List([@lists.mem(), @lists.mem_filter()]))
  let t275 = @simp.expand_tac("ilist'")
  let t276 = @list.List([@tactics.map_every(fn(x272 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s273 = @simp.expand_tac(x272)
    fn(x274 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s273(x274)
    }
  }, @list.List(["ilist''", "ilist'"])), t275])
  let t271 = @simp.asm_rewrite_tac(@list.List([]))
  let t270 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t269 = @simp.expand_tac("t'")
  let t268 = @tactics.match_mp_tac(@lib.el(4, @bool.conjuncts_rule(has_type_rules())))
  let t267 = @tactics.repeat_tac(@pair.let_tac)
  let t266 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s261 = @tactics.subst_all_tac(x260)
    fn(x262 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s261(x262)
    }
  }, fn(x263 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s264 = @tactics.mp_tac(x263)
    fn(x265 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s264(x265)
    }
  }))
  let t259 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(rty : Type)"))(fn(x256 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s257 = @tactics.mp_tac(x256)
    fn(x258 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s257(x258)
    }
  }))
  let t255 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.unwind_thm1()]))
  let t254 = @simp.rewrite_tac(@list.List([term_distinct(), term_inj(), @equal.gsym(@theorems.conj_assoc())]))
  let t251 = @simp.gen_rewrite_rule(fn(x250 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x250
  }, @list.List([has_type_cases()]))
  let t253 = @tactics.first_x_assum(fn(x252 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x247 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s248 = @tactics.mp_tac(x247)
      fn(x249 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s248(x249)
      }
    })(t251(x252))
  })
  let t245 = @term_syntax.parse_term("(ilist : List[(Term, Term)])")
  let t246 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(fty : Type)"), t245]))
  let t242 = @term_syntax.parse_term("(t : Term)")
  let t243 = @term_syntax.parse_term("(ty : Type)")
  let t244 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : List[Char])"), t243, t242]))
  let t237 = @simp.asm_rewrite_tac(@list.List([]))
  let t236 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t235 = @tactics.exists_tac(@term_syntax.parse_term("(dty : Type)"))
  let t234 = @tactics.match_mp_tac(@lib.el(3, @bool.conjuncts_rule(has_type_rules())))
  let t233 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(dty : Type)"))(@tactics.strip_assume_tac))
  let t232 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.unwind_thm1()]))
  let t231 = @simp.rewrite_tac(@list.List([term_distinct(), term_inj(), @equal.gsym(@theorems.conj_assoc())]))
  let t228 = @simp.gen_rewrite_rule(fn(x227 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x227
  }, @list.List([has_type_cases()]))
  let t230 = @tactics.first_assum(fn(x229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s225 = @tactics.mp_tac(x224)
      fn(x226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s225(x226)
      }
    })(t228(x229))
  })
  let t223 = @tactics.repeat_tac(@tactics.strip_tac)
  let t222 = @term_syntax.parse_term("(t : Term)")
  let t238 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : Term)"), t222])), t223), t230), t231), t232), t233), t234), t235), @tactics.conj_tac), t236), t237)
  let t239 = @simp.simp_tac(@list.List([]))
  let t240 = @simp.simp_tac(@list.List([]))
  let t221 = @meson.asm_meson_tac(@list.List([term_inj()]))
  let t220 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x214 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s215 = @tactics.subst_all_tac(x214)
    fn(x216 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s215(x216)
    }
  }, fn(x217 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s218 = @tactics.assume_tac(x217)
    fn(x219 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s218(x219)
    }
  }))
  let t213 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(aty : Type)"))(fn(x210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s211 = @tactics.mp_tac(x210)
    fn(x212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s211(x212)
    }
  }))
  let t209 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(y : List[Char])"))(fn(x206 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s207 = @tactics.mp_tac(x206)
    fn(x208 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s207(x208)
    }
  }))
  let t205 = @tactics.disch_then(@tactics.conjuncts_then(fn(x202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s203 = @tactics.assume_tac(x202)
    fn(x204 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s203(x204)
    }
  }))
  let t199 = @term_syntax.parse_term("(ilist : List[(Term, Term)])")
  let t200 = @term_syntax.parse_term("(u : Term)")
  let t201 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : Term)"), t200, t199]))
  let t198 = @tactics.disch_then(fn(x197 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x194 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s195 = @tactics.subst_all_tac(x194)
      fn(x196 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s195(x196)
      }
    })(@equal.sym(x197))
  })
  let t193 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.exists_refl())]))
  let t192 = @simp.rewrite_tac(@list.List([term_distinct(), term_inj(), @theorems.left_exists_and_thm()]))
  let t189 = @simp.gen_rewrite_rule(fn(x188 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x188
  }, @list.List([has_type_cases()]))
  let t191 = @tactics.first_x_assum(fn(x190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x185 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s186 = @tactics.mp_tac(x185)
      fn(x187 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s186(x187)
      }
    })(t189(x190))
  })
  let t184 = @simp.asm_rewrite_tac(@list.List([]))
  let t183 = @class.asm_cases_tac(@term_syntax.parse_term("has_type(Var((x : List[Char]), (ty : Type)), (tty : Type))"))
  let t182 = @simp.rewrite_tac(@list.List([@theorems.left_exists_and_thm(), @theorems.exists_refl()]))
  let t181 = @simp.simp_tac(@list.List([@theorems.forall_and_thm(), @theorems.left_forall_imp_thm(), @pair.pair_eq()]))
  let t180 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))]))
  let t179 = @simp.simp_tac(@list.List([rev_assocd(), @lists.mem(), @pair.forall_pair_thm()]))
  let t178 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t176 = @term_syntax.parse_term("(tty : Type)")
  let t177 = @term_syntax.parse_term("(ty : Type)")
  let t241 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : List[Char])"), t177, t176])), t178), t179), t180), t181), t182), t183), t184), t191), t192), t193), t198), t201), @tactics.disch_tac), t205), t209), t213), t220), t221), t240, t239, t238, @tactics.all_tac])
  let t175 = @tactics.repeat_tac(@tactics.conj_tac)
  let t174 = @simp.rewrite_tac(@list.List([vsubst()]))
  let t281 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t174), t175), t241), t244), @tactics.disch_tac), t246), @tactics.strip_tac), @pair.let_tac), @pair.let_tac), t253), t254), t255), t259), t266), @tactics.disch_tac), @class.cond_cases_tac), t267), t268), t269), t270), t271), t276), t277), t278), t279), t280)
  vsubst_has_type_c.set(@tactics.prove(@term_syntax.parse_term("∀ tm : Term, ∀ ty : Type, ∀ ilist : List[(Term, Term)], has_type(tm, ty) && (∀ s : Term, ∀ s' : Term, MEM((s', s), ilist) → (∃ x : List[Char], ∃ ty : Type, s == Var(x, ty) && has_type(s', ty))) → has_type(VSUBST(ilist, tm), ty)"), t281))
}

///|
let vsubst_has_type_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUBST_HAS_TYPE")

///|
/// `VSUBST_HAS_TYPE`
pub fn vsubst_has_type() -> @kernel.Thm {
  vsubst_has_type_c.get()
}

///|
/// VSUBST_WELLTYPED
fn step_44() -> Unit raise {
  let t282 = @meson.meson_tac(@list.List([vsubst_has_type(), welltyped()]))
  vsubst_welltyped_c.set(@tactics.prove(@term_syntax.parse_term("∀ tm : Term, ∀ ty : _, ∀ ilist : List[(Term, Term)], welltyped(tm) && (∀ s : Term, ∀ s' : Term, MEM((s', s), ilist) → (∃ x : List[Char], ∃ ty : Type, s == Var(x, ty) && has_type(s', ty))) → welltyped(VSUBST(ilist, tm))"), t282))
}

///|
let vsubst_welltyped_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VSUBST_WELLTYPED")

///|
/// `VSUBST_WELLTYPED`
pub fn vsubst_welltyped() -> @kernel.Thm {
  vsubst_welltyped_c.get()
}

///|
/// REV_ASSOCD_FILTER
fn step_45() -> Unit raise {
  let t293 = @meson.asm_meson_tac(@list.List([]))
  let t292 = @simp.asm_rewrite_tac(@list.List([rev_assocd()]))
  let t291 = @class.asm_cases_tac(@term_syntax.parse_term("(P : (A) -> Bool)((x : A))"))
  let t290 = @simp.asm_rewrite_tac(@list.List([rev_assocd()]))
  let t289 = @tactics.repeat_tac(@tactics.strip_tac)
  let t286 = @term_syntax.parse_term("(l : List[(B, A)])")
  let t287 = @term_syntax.parse_term("(x : A)")
  let t288 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(y : B)"), t287, t286]))
  let t285 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t284 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t283 = @simp.rewrite_tac(@list.List([rev_assocd(), @lists.filter(), @class.cond_id()]))
  let t294 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@ind_types.list_induct()), t283), t284), t285), t288), t289), t290), t291), t292), t293)
  rev_assocd_filter_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : List[(B, A)], ∀ a : A, ∀ b : B, ∀ d : _, REV_ASSOCD(a, FILTER(GABS((f : ((B, A)) -> Bool) => ∀ y : B, ∀ x : A, GEQ(f((y, x)), (P : (A) -> Bool)(x))), l), b) == (if P(a) { REV_ASSOCD(a, l, b) } else { b })"), t294))
}

///|
let rev_assocd_filter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REV_ASSOCD_FILTER")

///|
/// `REV_ASSOCD_FILTER`
pub fn rev_assocd_filter() -> @kernel.Thm {
  rev_assocd_filter_c.get()
}

///|
/// VFREE_IN_VSUBST
fn step_46() -> Unit raise {
  let t355 = @meson.meson_tac(@list.List([]))
  let t354 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t353 = @simp.rewrite_tac(@list.List([@lists.all()]))
  let t352 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t351 = @simp.rewrite_tac(@list.List([rev_assocd(), @lists.filter(), @pair.forall_pair_thm()]))
  let t350 = @simp.rewrite_tac(@list.List([@lists.all(), rev_assocd(), vfree_in()]))
  let t349 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t347 = @term_syntax.parse_term("(l : List[(Term, Term)])")
  let t348 = @tactics.spec_tac(@term_syntax.parse_term("(ilist : List[(Term, Term)])"), t347)
  let t346 = @simp.expand_tac("ilist'")
  let t343 = @simp.gen_rewrite_rule(fn(x342 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x342
  }, @list.List([@lists.not_ex()]))
  let t345 = @tactics.first_x_assum(fn(x344 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x339 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s340 = @tactics.mp_tac(x339)
      fn(x341 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s340(x341)
      }
    })(t343(x344))
  })
  let t337 = @meson.meson_tac(@list.List([]))
  let t336 = @simp.asm_rewrite_tac(@list.List([rev_assocd_filter()]))
  let t335 = @simp.expand_tac("ilist'")
  let t334 = @simp.asm_rewrite_tac(@list.List([]))
  let t332 = @term_syntax.parse_term("(ty : Type)")
  let t333 = @term_syntax.parse_term("(x : List[Char])")
  let t338 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("VSUBST((ilist' : List[(Term, Term)]), (t : Term))"), t333, t332]), variant())), t334), t335), t336), t337), @tactics.all_tac])
  let t331 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t330 = @tactics.disch_then(@tactics.conjuncts_then(fn(x329 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x326 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s327 = @tactics.subst_all_tac(x326)
      fn(x328 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s327(x328)
      }
    })(@equal.sym(x329))
  }))
  let t325 = @simp.gen_rewrite_tac(fn(x322 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s323 = @equal.land_conv(x322)
    fn(x324 : @kernel.Term) -> @kernel.Thm raise {
      s323(x324)
    }
  }, @list.List([term_inj()]))
  let t321 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))]))
  let t320 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → !(c : Bool)) && (!a → (b : Bool) == c) → !(!a → !b) == c")))
  let t319 = @simp.simp_tac(@list.List([@class.taut(@term_syntax.parse_term("(if (b : Bool) { false } else { (c : Bool) }) == (!b && c)"))]))
  let t318 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) && (b : Bool)) == !(!a → !b)"))]))
  let t317 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(if !(b : Bool) { (x : Bool) } else { (y : Bool) }) == (if b { y } else { x })"))]))
  let t316 = @simp.rewrite_tac(@list.List([vfree_in()]))
  let t315 = @simp.once_rewrite_tac(@list.List([@class.cond_rand()]))
  let t314 = @simp.simp_tac(@list.List([rev_assocd(), rev_assocd_filter()]))
  let t311 = @simp.expand_tac("ilist'")
  let t310 = @simp.asm_rewrite_tac(@list.List([]))
  let t312 = @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("t'"), t310), t311)
  let t313 = @list.List([@tactics.map_every(fn(x307 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s308 = @simp.expand_tac(x307)
    fn(x309 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s308(x309)
    }
  }, @list.List(["ilist''", "ilist'"])), t312])
  let t306 = @simp.asm_rewrite_tac(@list.List([vfree_in()]))
  let t305 = @tactics.repeat_tac(@pair.let_tac)
  let t304 = @tactics.repeat_tac(@tactics.gen_tac)
  let t301 = @term_syntax.parse_term("(t : Term)")
  let t302 = @term_syntax.parse_term("(ty : Type)")
  let t303 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : List[Char])"), t302, t301]))
  let t298 = @meson.meson_tac(@list.List([]))
  let t297 = @simp.asm_rewrite_tac(@list.List([]))
  let t299 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t297), t298)
  let t300 = @list.List([@meson.meson_tac(@list.List([term_inj()])), t299, @tactics.all_tac])
  let t296 = @tactics.repeat_tac(@tactics.conj_tac)
  let t295 = @simp.rewrite_tac(@list.List([vfree_in(), vsubst(), term_distinct()]))
  let t356 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t295), t296), t300), t303), @tactics.disch_tac), t304), @pair.let_tac), @pair.let_tac), @class.cond_cases_tac), t305), t306), t313), t314), t315), t316), t317), t318), t319), t320), t321), t325), t330), t331), t338), t345), t346), t348), t349), t350), t351), t352), t353), t354), t355)
  vfree_in_vsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ tm : Term, ∀ u : List[Char], ∀ uty : Type, ∀ ilist : List[(Term, Term)], VFREE_IN(Var(u, uty), VSUBST(ilist, tm)) == (∃ y : List[Char], ∃ ty : Type, VFREE_IN(Var(y, ty), tm) && VFREE_IN(Var(u, uty), REV_ASSOCD(Var(y, ty), ilist, Var(y, ty))))"), t356))
}

///|
let vfree_in_vsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VFREE_IN_VSUBST")

///|
/// `VFREE_IN_VSUBST`
pub fn vfree_in_vsubst() -> @kernel.Thm {
  vfree_in_vsubst_c.get()
}

///|
let result_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("result_INDUCT")

///|
/// `result_INDUCT`
pub fn result_induct() -> @kernel.Thm {
  result_induct_c.get()
}

///|
let result_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("result_RECURSION")

///|
/// `result_RECURSION`
pub fn result_recursion() -> @kernel.Thm {
  result_recursion_c.get()
}

///|
/// result_INDUCT, result_RECURSION
fn step_47() -> Unit raise {
  let (result_induct, result_recursion) = @ind_types.define_type("result = Clash term | Result term")
  result_induct_c.set(result_induct)
  result_recursion_c.set(result_recursion)
}

///|
/// result_INJ
fn step_48() -> Unit raise {
  result_inj_c.set(@ind_types.injectivity("result"))
}

///|
let result_inj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("result_INJ")

///|
/// `result_INJ`
pub fn result_inj() -> @kernel.Thm {
  result_inj_c.get()
}

///|
/// result_DISTINCT
fn step_49() -> Unit raise {
  result_distinct_c.set(@ind_types.distinctness("result"))
}

///|
let result_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("result_DISTINCT")

///|
/// `result_DISTINCT`
pub fn result_distinct() -> @kernel.Thm {
  result_distinct_c.get()
}

///|
/// IS_RESULT
fn step_50() -> Unit raise {
  is_result_c.set(@define.define_(@term_syntax.parse_term("(IS_RESULT : (Result) -> Bool)(Clash((t : Term))) == false && IS_RESULT(Result(t)) == true")))
}

///|
let is_result_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_RESULT")

///|
/// `IS_RESULT`
pub fn is_result() -> @kernel.Thm {
  is_result_c.get()
}

///|
/// IS_CLASH
fn step_51() -> Unit raise {
  is_clash_c.set(@define.define_(@term_syntax.parse_term("(IS_CLASH : (Result) -> Bool)(Clash((t : Term))) == true && IS_CLASH(Result(t)) == false")))
}

///|
let is_clash_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IS_CLASH")

///|
/// `IS_CLASH`
pub fn is_clash() -> @kernel.Thm {
  is_clash_c.get()
}

///|
/// RESULT
fn step_52() -> Unit raise {
  result_c.set(@define.define_(@term_syntax.parse_term("(RESULT : (Result) -> Term)(Result((t : Term))) == t")))
}

///|
let result_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RESULT")

///|
/// `RESULT`
pub fn result() -> @kernel.Thm {
  result_c.get()
}

///|
/// CLASH
fn step_53() -> Unit raise {
  clash_c.set(@define.define_(@term_syntax.parse_term("(CLASH : (Result) -> Term)(Clash((t : Term))) == t")))
}

///|
let clash_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CLASH")

///|
/// `CLASH`
pub fn clash() -> @kernel.Thm {
  clash_c.get()
}

///|
let sizeof__c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("sizeof")

///|
/// `sizeof`
pub fn sizeof_() -> @kernel.Thm {
  sizeof__c.get()
}

///|
/// sizeof
fn step_54() -> Unit raise {
  let sizeof_ = @define.define_(@term_syntax.parse_term("(sizeof : (Term) -> Num)(Var((x : List[Char]), (ty : Type))) == 1 && sizeof(Equal(ty)) == 1 && sizeof(Select(ty)) == 1 && sizeof(Comb((s : Term), (t : Term))) == 1 + (sizeof(s) + sizeof(t)) && sizeof(Abs(x, ty, t)) == 2 + sizeof(t)"))
  sizeof__c.set(sizeof_)
}

///|
/// SIZEOF_VSUBST
fn step_55() -> Unit raise {
  let t380 = @meson.asm_meson_tac(@list.List([@lists.mem_filter()]))
  let t379 = @simp.rewrite_tac(@list.List([@lists.mem(), @pair.pair_eq()]))
  let t378 = @simp.expand_tac("ilist''")
  let t377 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t376 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@lists.mem_filter()]))])
  let t375 = @simp.rewrite_tac(@list.List([sizeof_(), @arith.eq_add_lcancel()]))
  let t374 = @tactics.repeat_tac(@pair.let_tac)
  let t373 = @tactics.x_gen_tac(@term_syntax.parse_term("(ilist : List[(Term, Term)])"))
  let t370 = @term_syntax.parse_term("(t : Term)")
  let t371 = @term_syntax.parse_term("(ty : Type)")
  let t372 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : List[Char])"), t371, t370]))
  let t369 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t367 = @meson.asm_meson_tac(@list.List([sizeof_()]))
  let t366 = @simp.asm_simp_tac(@list.List([]))
  let t365 = @tactics.repeat_tac(@tactics.strip_tac)
  let t364 = @simp.rewrite_tac(@list.List([@pair.pair_eq()]))
  let t361 = @term_syntax.parse_term("(l : List[(Term, Term)])")
  let t362 = @term_syntax.parse_term("(s : Term)")
  let t363 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s' : Term)"), t362, t361]))
  let t360 = @simp.rewrite_tac(@list.List([@lists.mem(), rev_assocd(), sizeof_(), @pair.forall_pair_thm()]))
  let t359 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t358 = @term_syntax.parse_term("(ty : Type)")
  let t368 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : List[Char])"), t358])), t359), t360), t363), t364), t365), @class.cond_cases_tac), t366), t367), @tactics.all_tac])
  let t357 = @simp.rewrite_tac(@list.List([vsubst(), sizeof_()]))
  let t381 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(term_induct()), t357), @tactics.conj_tac), t368), @tactics.conj_tac), t369), t372), @tactics.disch_tac), t373), @tactics.disch_tac), @pair.let_tac), @pair.let_tac), @class.cond_cases_tac), t374), t375), t376), t377), t378), t379), t380)
  sizeof_vsubst_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : Term, ∀ ilist : List[(Term, Term)], (∀ s' : Term, ∀ s : Term, MEM((s', s), ilist) → (∃ x : List[Char], ∃ ty : Type, s' == Var(x, ty))) → sizeof(VSUBST(ilist, t)) == sizeof(t)"), t381))
}

///|
let sizeof_vsubst_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SIZEOF_VSUBST")

///|
/// `SIZEOF_VSUBST`
pub fn sizeof_vsubst() -> @kernel.Thm {
  sizeof_vsubst_c.get()
}

///|
/// INST_CORE_EXISTS
fn step_56() -> Unit raise {
  let t388 = @tactics.repeat_tac(@tactics.strip_tac)
  let t387 = @simp.simp_tac(@list.List([@lists.mem(), @pair.pair_eq(), term_inj(), @theorems.right_exists_and_thm(), @theorems.left_exists_and_thm(), @equal.gsym(@theorems.exists_refl()), sizeof_vsubst(), @arith.le_refl(), sizeof_()]))
  let t386 = @tactics.conv_tac(@equal.once_depth_conv(@pair.gen_beta_conv))
  let t385 = @simp.rewrite_tac(@list.List([@wf.wf_measure(), @wf.measure_le(), @wf.measure()]))
  let t389 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(fn(x384 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x382 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x382
      @tactics.match_mp_tac(@bool.disch_all(@define.pure_prove_recursive_function_exists(w)))
    })(x384)(x384)
  }, @tactics.exists_tac(@term_syntax.parse_term("MEASURE(GABS((f : ((List[(Term, Term)], List[(Type, Type)], Term)) -> Num) => ∀ env : List[(Term, Term)], ∀ tyin : List[(Type, Type)], ∀ t : Term, GEQ(f((env, tyin, t)), sizeof(t))))"))), t385), t386), t387), t388), @int.arith_tac)
  inst_core_exists_c.set(@tactics.prove(@term_syntax.parse_term("∃ INST_CORE : (List[(Term, Term)], List[(Type, Type)], Term) -> Result, (∀ env : List[(Term, Term)], ∀ tyin : List[(Type, Type)], ∀ x : List[Char], ∀ ty : Type, INST_CORE(env, tyin, Var(x, ty)) == LET((tm : Term) => (tm' : Term) => LET_END(if REV_ASSOCD(tm', env, tm) == tm { Result(tm') } else { Clash(tm') }), Var(x, ty), Var(x, TYPE_SUBST(tyin, ty)))) && (∀ env : List[(Term, Term)], ∀ tyin : List[(Type, Type)], ∀ ty : Type, INST_CORE(env, tyin, Equal(ty)) == Result(Equal(TYPE_SUBST(tyin, ty)))) && (∀ env : List[(Term, Term)], ∀ tyin : List[(Type, Type)], ∀ ty : Type, INST_CORE(env, tyin, Select(ty)) == Result(Select(TYPE_SUBST(tyin, ty)))) && (∀ env : List[(Term, Term)], ∀ tyin : List[(Type, Type)], ∀ s : Term, ∀ t : Term, INST_CORE(env, tyin, Comb(s, t)) == LET((sres : Result) => LET_END(if IS_CLASH(sres) { sres } else { LET((tres : Result) => LET_END(if IS_CLASH(tres) { tres } else { LET((s' : Term) => (t' : Term) => LET_END(Result(Comb(s', t'))), RESULT(sres), RESULT(tres)) }), INST_CORE(env, tyin, t)) }), INST_CORE(env, tyin, s))) && (∀ env : List[(Term, Term)], ∀ tyin : List[(Type, Type)], ∀ x : List[Char], ∀ ty : Type, ∀ t : Term, INST_CORE(env, tyin, Abs(x, ty, t)) == LET((ty' : Type) => LET_END(LET((env' : List[(Term, Term)]) => LET_END(LET((tres : Result) => LET_END(if IS_RESULT(tres) { Result(Abs(x, ty', RESULT(tres))) } else { LET((w : Term) => LET_END(if !(w == Var(x, ty')) { tres } else { LET((x' : List[Char]) => LET_END(INST_CORE(env, tyin, Abs(x', ty, VSUBST([(Var(x', ty), Var(x, ty))], t)))), VARIANT(RESULT(INST_CORE(NIL, tyin, t)), x, ty')) }), CLASH(tres)) }), INST_CORE(env', tyin, t))), CONS((Var(x, ty), Var(x, ty')), env))), TYPE_SUBST(tyin, ty)))"), t389))
}

///|
let inst_core_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INST_CORE_EXISTS")

///|
/// `INST_CORE_EXISTS`
pub fn inst_core_exists() -> @kernel.Thm {
  inst_core_exists_c.get()
}

///|
/// INST_CORE
fn step_57() -> Unit raise {
  inst_core_c.set(@nums.new_specification(@list.List(["INST_CORE"]))(inst_core_exists()))
}

///|
let inst_core_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INST_CORE")

///|
/// `INST_CORE`
pub fn inst_core() -> @kernel.Thm {
  inst_core_c.get()
}

///|
/// INST_DEF
fn step_58() -> Unit raise {
  inst_def_c.set(@pair.new_definition(@term_syntax.parse_term("(INST : (List[(Type, Type)], Term) -> Term)((tyin : List[(Type, Type)]), (tm : Term)) == RESULT(INST_CORE(NIL, tyin, tm))")))
}

///|
let inst_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("INST_DEF")

///|
/// `INST_DEF`
pub fn inst_def() -> @kernel.Thm {
  inst_def_c.get()
}

///|
/// NOT_IS_RESULT
fn step_59() -> Unit raise {
  let t390 = @simp.rewrite_tac(@list.List([is_result(), is_clash()]))
  let t391 = @tactics.then_tac(@tactics.match_mp_tac(result_induct()), t390)
  not_is_result_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Result, !IS_RESULT(r) == IS_CLASH(r)"), t391))
}

///|
let not_is_result_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_IS_RESULT")

///|
/// `NOT_IS_RESULT`
pub fn not_is_result() -> @kernel.Thm {
  not_is_result_c.get()
}

///|
/// letlemma
fn step_60() -> Unit raise {
  let t392 = @simp.rewrite_tac(@list.List([@pair.let_def(), @pair.let_end_def()]))
  letlemma_c.set(@tactics.prove(@term_syntax.parse_term("LET((x : _) => LET_END((P : (_) -> _)(x)), (t : _)) == P(t)"), t392))
}

///|
let letlemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("letlemma")

///|
/// `letlemma`
pub fn letlemma() -> @kernel.Thm {
  letlemma_c.get()
}

///|
/// Model/syntax.ml:622
fn step_61() -> Unit raise {
  @printer.parse_as_infix("|-", (11L, "right"))
}

///|
let prove_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("prove_RULES")

///|
/// `prove_RULES`
pub fn prove_rules() -> @kernel.Thm {
  prove_rules_c.get()
}

///|
let proves_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("proves_INDUCT")

///|
/// `proves_INDUCT`
pub fn proves_induct() -> @kernel.Thm {
  proves_induct_c.get()
}

///|
let proves_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("proves_CASES")

///|
/// `proves_CASES`
pub fn proves_cases() -> @kernel.Thm {
  proves_cases_c.get()
}

///|
/// prove_RULES, proves_INDUCT, proves_CASES
fn step_62() -> Unit raise {
  let (prove_rules, proves_induct, proves_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ t : Term, welltyped(t) → (op_bar_minus : (List[Term], Term) -> Bool)(NIL, op_eq_eq_eq(t, t))) && (∀ asl1 : List[Term], ∀ asl2 : List[Term], ∀ l : Term, ∀ m1 : Term, ∀ m2 : Term, ∀ r : Term, op_bar_minus(asl1, op_eq_eq_eq(l, m1)) && op_bar_minus(asl2, op_eq_eq_eq(m2, r)) && ACONV(m1, m2) → op_bar_minus(TERM_UNION(asl1, asl2), op_eq_eq_eq(l, r))) && (∀ asl1 : List[Term], ∀ l1 : Term, ∀ r1 : Term, ∀ asl2 : List[Term], ∀ l2 : Term, ∀ r2 : Term, op_bar_minus(asl1, op_eq_eq_eq(l1, r1)) && op_bar_minus(asl2, op_eq_eq_eq(l2, r2)) && welltyped(Comb(l1, l2)) → op_bar_minus(TERM_UNION(asl1, asl2), op_eq_eq_eq(Comb(l1, l2), Comb(r1, r2)))) && (∀ asl : List[Term], ∀ x : List[Char], ∀ ty : Type, ∀ l : Term, ∀ r : Term, !EX(VFREE_IN(Var(x, ty)), asl) && op_bar_minus(asl, op_eq_eq_eq(l, r)) → op_bar_minus(asl, op_eq_eq_eq(Abs(x, ty, l), Abs(x, ty, r)))) && (∀ x : List[Char], ∀ ty : Type, ∀ t : Term, welltyped(t) → op_bar_minus(NIL, op_eq_eq_eq(Comb(Abs(x, ty, t), Var(x, ty)), t))) && (∀ p : Term, has_type(p, Bool) → op_bar_minus([p], p)) && (∀ asl1 : List[Term], ∀ asl2 : List[Term], ∀ p : Term, ∀ q : Term, ∀ p' : Term, op_bar_minus(asl1, op_eq_eq_eq(p, q)) && op_bar_minus(asl2, p') && ACONV(p, p') → op_bar_minus(TERM_UNION(asl1, asl2), q)) && (∀ asl1 : List[Term], ∀ asl2 : List[Term], ∀ c1 : Term, ∀ c2 : Term, op_bar_minus(asl1, c1) && op_bar_minus(asl2, c2) → op_bar_minus(TERM_UNION(FILTER(o(op_tilde, ACONV(c2)), asl1), FILTER(o(op_tilde, ACONV(c1)), asl2)), op_eq_eq_eq(c1, c2))) && (∀ tyin : List[(Type, Type)], ∀ asl : List[Term], ∀ p : Term, op_bar_minus(asl, p) → op_bar_minus(MAP(INST(tyin), asl), INST(tyin, p))) && (∀ ilist : List[(Term, Term)], ∀ asl : List[Term], ∀ p : Term, (∀ s : Term, ∀ s' : Term, MEM((s', s), ilist) → (∃ x : List[Char], ∃ ty : Type, s == Var(x, ty) && has_type(s', ty))) && op_bar_minus(asl, p) → op_bar_minus(MAP(VSUBST(ilist), asl), VSUBST(ilist, p)))"))
  prove_rules_c.set(prove_rules)
  proves_induct_c.set(proves_induct)
  proves_cases_c.set(proves_cases)
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
}
