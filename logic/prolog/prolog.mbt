// Translated from upstream Logic/prolog.ml; edit this file directly.

///|
/// SATISFIES_IMAGE
fn step_1() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([]))
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.satisfies(), @sets.in_image()])), t1)
  satisfies_image_c.set(@tactics.prove(@term_syntax.parse_term("satisfies((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), IMAGE((f : (_) -> Form), (s : (_) -> Bool))) == (∀ x : _, ∀ v : (Num) -> _, valuation(M, v) && IN(x, s) → holds(M, v, f(x)))"), t2))
}

///|
let satisfies_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SATISFIES_IMAGE")

///|
/// `SATISFIES_IMAGE`
pub fn satisfies_image() -> @kernel.Thm {
  satisfies_image_c.get()
}

///|
/// definite
fn step_2() -> Unit raise {
  definite_c.set(@pair.new_definition(@term_syntax.parse_term("(definite : ((Form) -> Bool) -> Bool)((cl : (Form) -> Bool)) == (clause(cl) && CARD({(p : Form) | IN(p, cl) && positive(p)}) == 1)")))
}

///|
let definite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("definite")

///|
/// `definite`
pub fn definite() -> @kernel.Thm {
  definite_c.get()
}

///|
/// horn
fn step_3() -> Unit raise {
  horn_c.set(@pair.new_definition(@term_syntax.parse_term("(horn : ((Form) -> Bool) -> Bool)((cl : (Form) -> Bool)) == (clause(cl) && CARD({(p : Form) | IN(p, cl) && positive(p)}) <= 1)")))
}

///|
let horn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("horn")

///|
/// `horn`
pub fn horn() -> @kernel.Thm {
  horn_c.get()
}

///|
/// DEFINITE_IMP_HORN
fn step_4() -> Unit raise {
  let t3 = @simp.simp_tac(@list.List([definite(), horn(), @arith.le_refl()]))
  definite_imp_horn_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl : (Form) -> Bool, definite(cl) → horn(cl)"), t3))
}

///|
let definite_imp_horn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEFINITE_IMP_HORN")

///|
/// `DEFINITE_IMP_HORN`
pub fn definite_imp_horn() -> @kernel.Thm {
  definite_imp_horn_c.get()
}

///|
/// falsify
fn step_5() -> Unit raise {
  falsify_c.set(@pair.new_definition(@term_syntax.parse_term("(falsify : (Form, (Form) -> Bool, Form) -> Bool)((ff : Form), (cl : (Form) -> Bool)) == (if definite(cl) { cl } else { INSERT(ff, cl) })")))
}

///|
let falsify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("falsify")

///|
/// `falsify`
pub fn falsify() -> @kernel.Thm {
  falsify_c.get()
}

///|
/// FALSIFY_FINITE
fn step_6() -> Unit raise {
  let t5 = @simp.asm_simp_tac(@list.List([@sets.finite_rules()]))
  let t4 = @simp.rewrite_tac(@list.List([falsify()]))
  let t6 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t4), @class.cond_cases_tac), t5)
  falsify_finite_c.set(@tactics.prove(@term_syntax.parse_term("FINITE((cl : (Form) -> Bool)) → FINITE(falsify((ff : Form), cl))"), t6))
}

///|
let falsify_finite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FALSIFY_FINITE")

///|
/// `FALSIFY_FINITE`
pub fn falsify_finite() -> @kernel.Thm {
  falsify_finite_c.get()
}

///|
/// FALSIFY_DEFINITE
fn step_7() -> Unit raise {
  let t44 = @simp.asm_rewrite_tac(@list.List([]))
  let t43 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) <= 1 && !(x == 1) → x == 0")))
  let t42 = @simp.asm_rewrite_tac(@list.List([@sets.has_size()]))
  let t41 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@sets.has_size_0())]))
  let t40 = @tactics.subgoal_then(@term_syntax.parse_term("{(p : Form) | IN(p, (cl : (Form) -> Bool)) && positive(p)} == {}"), fn(x38 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x38
    @simp.rewrite_tac(@list.List([th_1, @sets.not_in_empty()]))
  })
  let t37 = @tactics.undisch_tac(@term_syntax.parse_term("IN(Atom((P : Num), (args : List[Term])), {(p : Form) | IN(p, (cl : (Form) -> Bool)) && positive(p)})"))
  let t35 = @simp.asm_rewrite_tac(@list.List([]))
  let t36 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("(x : Num) <= 1 && !(x == 1) → SUC(x) == 1"))), t35)])
  let t34 = @simp.asm_simp_tac(@list.List([@sets.card_clauses()]))
  let t32 = @meson.asm_meson_tac(@list.List([@resolution.clause()]))
  let t31 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t30 = @tactics.exists_tac(@term_syntax.parse_term("(cl : (Form) -> Bool)"))
  let t33 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t30), t31), t32), @tactics.all_tac])
  let t29 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(p : Form) | IN(p, (cl : (Form) -> Bool)) && positive(p)})"), fn(x26 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s27 = @tactics.assume_tac(x26)
    fn(x28 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s27(x28)
    }
  })
  let t24 = @meson.asm_meson_tac(@list.List([@resolution.clause(), @resolution.literal(), @resolution.atom_v1()]))
  let t25 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@resolution.clause(), @sets.in_insert(), @sets.finite_insert()])), t24), @tactics.all_tac])
  let t22 = @simp.rewrite_tac(@list.List([@fol.not_def(), @fol.form_distinct()]))
  let t21 = @simp.rewrite_tac(@list.List([@resolution.positive(), @resolution.negative(), @resolution.atom_v1()]))
  let t20 = @tactics.subgoal_then(@term_syntax.parse_term("positive(Atom((P : Num), (args : List[Term])))"), fn(x18 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x18
    @meson.meson_tac(@list.List([th]))
  })
  let t23 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_insert()])), t20), t21), t22), @tactics.all_tac])
  let t17 = @tactics.subgoal_then(@term_syntax.parse_term("{(p : Form) | IN(p, INSERT(Atom((P : Num), (args : List[Term])), (cl : (Form) -> Bool))) && positive(p)} == INSERT(Atom(P, args), {(p : Form) | IN(p, cl) && positive(p)})"), fn(x14 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s15 = @tactics.subst1_tac(x14)
    fn(x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s15(x16)
    }
  })
  let t13 = @simp.asm_rewrite_tac(@list.List([]))
  let t12 = @simp.asm_rewrite_tac(@list.List([]))
  let t11 = @class.asm_cases_tac(@term_syntax.parse_term("clause((cl : (Form) -> Bool))"))
  let t10 = @simp.rewrite_tac(@list.List([horn(), definite()]))
  let t9 = @tactics.undisch_tac(@term_syntax.parse_term("!definite((cl : (Form) -> Bool))"))
  let t8 = @simp.asm_rewrite_tac(@list.List([]))
  let t7 = @simp.rewrite_tac(@list.List([falsify()]))
  let t45 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t7), @class.cond_cases_tac), t8), t9), t10), t11), t12), @tactics.strip_tac), t13), t17), t23), @tactics.disch_tac), @tactics.conj_tac), t25), t29), t33), t34), @class.cond_cases_tac), t36), t37), t40), t41), t42), t43), t44)
  falsify_definite_c.set(@tactics.prove(@term_syntax.parse_term("horn((cl : (Form) -> Bool)) → definite(falsify(Atom((P : Num), (args : List[Term])), cl))"), t45))
}

///|
let falsify_definite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FALSIFY_DEFINITE")

///|
/// `FALSIFY_DEFINITE`
pub fn falsify_definite() -> @kernel.Thm {
  falsify_definite_c.get()
}

///|
/// HOLDS_FALSIFY
fn step_8() -> Unit raise {
  let t56 = @meson.meson_tac(@list.List([]))
  let t55 = @simp.simp_tac(@list.List([@sets.in_insert()]))
  let t54 = @simp.rewrite_tac(@list.List([falsify()]))
  let t53 = @simp.asm_simp_tac(@list.List([falsify_finite(), @resolution.holds_interp()]))
  let t52 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x46 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s47 = @tactics.assume_tac(x46)
    fn(x48 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s47(x48)
    }
  }, fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s50 = @tactics.mp_tac(x49)
    fn(x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s50(x51)
    }
  }))
  let t57 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t52), t53), t54), @class.cond_cases_tac), t55), t56)
  holds_falsify_c.set(@tactics.prove(@term_syntax.parse_term("FINITE((cl : (Form) -> Bool)) && holds((M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool)), (v : (Num) -> _), interp(cl)) → holds(M, v, interp(falsify((ff : Form), cl)))"), t57))
}

///|
let holds_falsify_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_FALSIFY")

///|
/// `HOLDS_FALSIFY`
pub fn holds_falsify() -> @kernel.Thm {
  holds_falsify_c.get()
}

///|
/// REDUCE_HORN_DEFINITE
fn step_9() -> Unit raise {
  let t173 = @meson.meson_tac(@list.List([@lists.length_eq_nil()]))
  let t172 = @simp.asm_rewrite_tac(@list.List([@fol.predicates_form(), @sets.in_insert(), @sets.not_in_empty(), @pair.pair_eq(), @fol.not_def(), @sets.in_union(), @sets.not_in_empty()]))
  let t171 = @tactics.undisch_tac(@term_syntax.parse_term("IN((p : Form), (cl : (Form) -> Bool))"))
  let t170 = @simp.rewrite_tac(@list.List([@resolution.literal(), @resolution.atom_v1()]))
  let t169 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.clause()])), @tactics.all_tac])
  let t168 = @tactics.subgoal_then(@term_syntax.parse_term("literal((p : Form))"), fn(x165 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s166 = @tactics.mp_tac(x165)
    fn(x167 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s166(x167)
    }
  })
  let t164 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(a : Bool) && !(b : Bool) → !(c : Bool)) == (c → a || b)"))]))
  let t162 = @meson.asm_meson_tac(@list.List([]))
  let t161 = @simp.rewrite_tac(@list.List([@sets.in_unions()]))
  let t160 = @tactics.undisch_tac(@term_syntax.parse_term("!IN(Not(Atom((ff : Num), NIL)), UNIONS((s : ((Form) -> Bool) -> Bool)))"))
  let t163 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!IN(Atom((ff : Num), NIL), UNIONS((s : ((Form) -> Bool) -> Bool)))")), t160), t161), t162), @tactics.all_tac])
  let t159 = @tactics.subgoal_then(@term_syntax.parse_term("!IN(Atom((ff : Num), NIL), (cl : (Form) -> Bool)) && !IN(Not(Atom(ff, NIL)), cl)"), fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s157 = @tactics.mp_tac(x156)
    fn(x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s157(x158)
    }
  })
  let t155 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(a : Bool) → a → (b : Bool)")))
  let t154 = @simp.asm_rewrite_tac(@list.List([@lists.length()]))
  let t152 = @term_syntax.parse_term("(zs : List[A])")
  let t153 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(r : Num)"), t152]))
  let t151 = @simp.rewrite_tac(@list.List([@fol.fun_def(), @fol.dom_def(), @fol.pred_def()]))
  let t150 = @tactics.match_mp_tac(@fol.holds_predicates())
  let t148 = @term_syntax.parse_term("(v : (Num) -> A)")
  let t149 = @tactics.spec_tac(@term_syntax.parse_term("(v : (Num) -> A)"), t148)
  let t147 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t146 = @tactics.undisch_tac(@term_syntax.parse_term("holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A), (p : Form))"))
  let t145 = @simp.asm_rewrite_tac(@list.List([]))
  let t144 = @tactics.exists_tac(@term_syntax.parse_term("(p : Form)"))
  let t143 = @simp.asm_simp_tac(@list.List([@resolution.holds_interp()]))
  let t142 = @simp.asm_rewrite_tac(@list.List([]))
  let t141 = @tactics.match_mp_tac(holds_falsify())
  let t140 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(p : Form)"))(@tactics.strip_assume_tac))
  let t139 = @simp.asm_simp_tac(@list.List([@trivia.o_thm(), @resolution.holds_interp(), @sets.finite_insert(), @sets.in_insert()]))
  let t138 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.clause()])), @tactics.all_tac])
  let t137 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((cl : (Form) -> Bool))"), fn(x134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s135 = @tactics.assume_tac(x134)
    fn(x136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s135(x136)
    }
  })
  let t129 = @term_syntax.parse_term("(v : (Num) -> A)")
  let t130 = @list.List([@term_syntax.parse_term("(cl : (Form) -> Bool)"), t129])
  let t133 = @tactics.first_x_assum(@tactics.conjuncts_then2(fn(x123 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s124 = @tactics.assume_tac(x123)
    fn(x125 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s124(x125)
    }
  }, fn(x132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s127 = @tactics.mp_tac(x126)
      fn(x128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s127(x128)
      }
    })(((x131 : @kernel.Thm) => @bool.specl(t130, x131))(x132))
  }))
  let t122 = @list.List([@simp.rewrite_tac(@list.List([@fol.valuation(), @fol.dom_def()])), @tactics.all_tac])
  let t121 = @tactics.subgoal_then(@term_syntax.parse_term("valuation((Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))), Fun(M), (p : Num) => (args : List[A]) => if p == (ff : Num) && args == NIL { false } else { Pred(M, p, args) }), (v : (Num) -> A)) == valuation(M, v)"), fn(x118 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s119 = @tactics.subst1_tac(x118)
    fn(x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s119(x120)
    }
  })
  let t116 = @term_syntax.parse_term("(v : (Num) -> A)")
  let t117 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(cl : (Form) -> Bool)"), t116]))
  let t115 = @simp.asm_rewrite_tac(@list.List([@fol.dom_def()]))
  let t113 = @simp.asm_rewrite_tac(@list.List([@fol.dom_def()]))
  let t112 = @tactics.match_mp_tac(@logic_canon.valuation_exists())
  let t114 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.holds(), @fol.pred_def(), @lists.map(), @class.not_forall_thm()])), t112), t113)])
  let t111 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t107 = @term_syntax.parse_term("(Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))), Fun(M), (p : Num) => (args : List[A]) => if p == (ff : Num) && args == NIL { false } else { Pred(M, p, args) })")
  let t110 = @tactics.disch_then(fn(x109 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s105 = @tactics.mp_tac(x104)
      fn(x106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s105(x106)
      }
    })(((x108 : @kernel.Thm) => @bool.spec(t107, x108))(x109))
  })
  let t103 = @tactics.disch_then(fn(x100 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x100
    let t102 = @tactics.mp_tac(th_1)
    @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t102)
  })
  let t98 = @simp.rewrite_tac(@list.List([@fol.fv(), @sets.not_in_empty(), @lists.map(), @fol.list_union()]))
  let t97 = @tactics.match_mp_tac(@fol.holds_valuation())
  let t96 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t95 = @tactics.disch_then(fn(x92 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x92
    let t94 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t94)
  })
  let t91 = @simp.asm_rewrite_tac(@list.List([]))
  let t89 = @meson.asm_meson_tac(@list.List([]))
  let t88 = @simp.asm_simp_tac(@list.List([@resolution.holds_interp(), @sets.finite_insert(), @sets.in_insert()]))
  let t87 = @tactics.undisch_tac(@term_syntax.parse_term("!holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A), interp((cl : (Form) -> Bool)))"))
  let t86 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.clause()])), @tactics.all_tac])
  let t90 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("FINITE((cl : (Form) -> Bool))"), fn(x83 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s84 = @tactics.assume_tac(x83)
    fn(x85 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s84(x85)
    }
  }), t86), t87), t88), t89), @tactics.all_tac])
  let t82 = @tactics.subgoal_then(@term_syntax.parse_term("holds((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool)), (v : (Num) -> A), interp(INSERT(Atom((ff : Num), NIL), (cl : (Form) -> Bool)))) == (holds(M, v, Atom(ff, NIL)) || holds(M, v, interp(cl)))"), fn(x79 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s80 = @tactics.subst1_tac(x79)
    fn(x81 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s80(x81)
    }
  })
  let t78 = @simp.asm_rewrite_tac(@list.List([]))
  let t77 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), falsify()]))
  let t76 = @simp.asm_rewrite_tac(@list.List([]))
  let t71 = @term_syntax.parse_term("(v : (Num) -> A)")
  let t72 = @list.List([@term_syntax.parse_term("(cl : (Form) -> Bool)"), t71])
  let t75 = @tactics.disch_then(fn(x74 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x68 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s69 = @tactics.mp_tac(x68)
      fn(x70 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s69(x70)
      }
    })(((x73 : @kernel.Thm) => @bool.specl(t72, x73))(x74))
  })
  let t67 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t65 = @term_syntax.parse_term("(v : (Num) -> A)")
  let t66 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(cl : (Form) -> Bool)"), t65]))
  let t64 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t63 = @simp.rewrite_tac(@list.List([@class.not_forall_thm()]))
  let t62 = @simp.asm_rewrite_tac(@list.List([]))
  let t61 = @class.asm_cases_tac(@term_syntax.parse_term("Dom((M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool))) == {}"))
  let t99 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac), t61), t62), t63), t64), t66), t67), @tactics.strip_tac), t75), t76), t77), @class.cond_cases_tac), t78), t82), t90), t91), t95), t96), t97), t98), @tactics.all_tac])
  let t60 = @simp.rewrite_tac(@list.List([satisfies_image()]))
  let t59 = @simp.rewrite_tac(@list.List([@class.not_exists_thm(), @equal.gsym(@sets.image_o())]))
  let t58 = @tactics.repeat_tac(@tactics.strip_tac)
  let t174 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@fol.satisfiable()])), t58), t59), t60), @tactics.eq_tac), t99), t103), t110), t111), @tactics.conj_tac), t114), t115), t117), t121), t122), @tactics.strip_tac), t133), t137), t138), t139), t140), t141), t142), t143), t144), t145), t146), t147), t149), t150), t151), t153), @class.cond_cases_tac), t154), t155), t159), t163), t164), t168), t169), t170), @tactics.strip_tac), t171), t172), t173)
  reduce_horn_definite_c.set(@tactics.prove(@term_syntax.parse_term("(∀ c : (Form) -> Bool, IN(c, (s : ((Form) -> Bool) -> Bool)) → clause(c)) && !IN(Atom((ff : Num), NIL), UNIONS(s)) && !IN(Not(Atom(ff, NIL)), UNIONS(s)) → !satisfiable((U : (A) -> Bool), IMAGE(interp, s)) == (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), !(Dom(M) == {}) && satisfies(M, IMAGE(interp, IMAGE(falsify(Atom(ff, NIL)), s))) → (∀ v : (Num) -> A, valuation(M, v) → holds(M, v, Atom(ff, NIL))))"), t174))
}

///|
let reduce_horn_definite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REDUCE_HORN_DEFINITE")

///|
/// `REDUCE_HORN_DEFINITE`
pub fn reduce_horn_definite() -> @kernel.Thm {
  reduce_horn_definite_c.get()
}

///|
/// minmodel
fn step_10() -> Unit raise {
  minmodel_c.set(@pair.new_definition(@term_syntax.parse_term("(minmodel : ((Form) -> Bool) -> ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool))((s : (Form) -> Bool)) == (herbase(functions(s)), Fn, (p : Num) => (zs : List[Term]) => ∀ H : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Dom(H) == herbase(functions(s)) && Fun(H) == Fn && satisfies(H, s) → Pred(H, p, zs))")))
}

///|
let minmodel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("minmodel")

///|
/// `minmodel`
pub fn minmodel() -> @kernel.Thm {
  minmodel_c.get()
}

///|
/// MINMODEL_MINIMAL
fn step_11() -> Unit raise {
  let t200 = @simp.asm_rewrite_tac(@list.List([@fol.fun_def()]))
  let t199 = @tactics.match_mp_tac(@fol.termval_functions())
  let t197 = @term_syntax.parse_term("(v : (Num) -> Term)")
  let t198 = @tactics.spec_tac(@term_syntax.parse_term("(v : (Num) -> Term)"), t197)
  let t196 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Term)"))
  let t195 = @simp.gen_rewrite_tac(fn(x194 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x194
  }, @list.List([@class.fun_eq_thm()]))
  let t193 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (Num) -> Term)"))
  let t192 = @simp.gen_rewrite_tac(fn(x191 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x191
  }, @list.List([@class.fun_eq_thm()]))
  let t190 = @tactics.subgoal_then(@term_syntax.parse_term("termval((herbase(functions((s : (Form) -> Bool))), Fn, (p : Num) => (zs : List[Term]) => ∀ H : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Dom(H) == herbase(functions(s)) && Fun(H) == Fn && satisfies(H, s) → Pred(H, p, zs))) == termval((H : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)))"), fn(x188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x188
    @simp.rewrite_tac(@list.List([th]))
  })
  let t187 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a → b) == (a → c)")))
  let t186 = @simp.rewrite_tac(@list.List([]))
  let t185 = @tactics.x_gen_tac(@term_syntax.parse_term("(H : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool))"))
  let t184 = @simp.gen_rewrite_tac(fn(x183 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x183
  }, @list.List([@class.fun_eq_thm()]))
  let t182 = @simp.rewrite_tac(@list.List([@fol.holds(), minmodel(), @fol.pred_def(), @fol.fun_def()]))
  let t181 = @tactics.disch_then(fn(x178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s179 = @tactics.subst_all_tac(x178)
    fn(x180 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s179(x180)
    }
  })
  let t176 = @term_syntax.parse_term("(args : List[Term])")
  let t177 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Num)"), t176]))
  let t175 = @simp.rewrite_tac(@list.List([@resolution.atom_v1(), @theorems.left_imp_exists_thm()]))
  let t201 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t175), t177), t181), t182), @tactics.ap_term_tac), t184), t185), t186), t187), @tactics.strip_tac), t190), t192), t193), t195), t196), t198), t199), t200)
  minmodel_minimal_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ v : (Num) -> Term, ∀ s : (Form) -> Bool, atom(p) → holds(minmodel(s), v, p) == (∀ H : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Dom(H) == herbase(functions(s)) && Fun(H) == Fn && satisfies(H, s) → holds(H, v, p))"), t201))
}

///|
let minmodel_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINMODEL_MINIMAL")

///|
/// `MINMODEL_MINIMAL`
pub fn minmodel_minimal() -> @kernel.Thm {
  minmodel_minimal_c.get()
}

///|
/// HOLDS_ITLIST_IMP
fn step_12() -> Unit raise {
  let t204 = @meson.meson_tac(@list.List([]))
  let t203 = @simp.asm_rewrite_tac(@list.List([@lists.mem(), @lists.itlist(), @fol.holds_v1()]))
  let t202 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t205 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t202), @tactics.gen_tac), @lists.list_induct_tac), t203), t204)
  holds_itlist_imp_c.set(@tactics.prove(@term_syntax.parse_term("∀ M : ((_) -> Bool, (Num, List[_]) -> _, (Num, List[_]) -> Bool), ∀ v : (Num) -> _, ∀ asm : List[Form], ∀ c : Form, holds(M, v, ITLIST(op_minus_minus_gt, asm, c)) == ((∃ p : Form, MEM(p, asm) && !holds(M, v, p)) || holds(M, v, c))"), t205))
}

///|
let holds_itlist_imp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_ITLIST_IMP")

///|
/// `HOLDS_ITLIST_IMP`
pub fn holds_itlist_imp() -> @kernel.Thm {
  holds_itlist_imp_c.get()
}

///|
/// breakhorn
fn step_13() -> Unit raise {
  breakhorn_c.set(@pair.new_definition(@term_syntax.parse_term("(breakhorn : ((Form) -> Bool) -> (List[Form], Form))((cl : (Form) -> Bool)) == (if definite(cl) { LET((p : Form) => LET_END((MAP(op_tilde_tilde, list_of_set(DELETE(cl, p))), p)), select((p : Form) => IN(p, cl) && positive(p))) } else { (MAP(op_tilde_tilde, list_of_set(cl)), False) })")))
}

///|
let breakhorn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("breakhorn")

///|
/// `breakhorn`
pub fn breakhorn() -> @kernel.Thm {
  breakhorn_c.get()
}

///|
/// hypotheses
fn step_14() -> Unit raise {
  hypotheses_c.set(@pair.new_definition(@term_syntax.parse_term("(hypotheses : ((Form) -> Bool) -> List[Form])((cl : (Form) -> Bool)) == FST(breakhorn(cl))")))
}

///|
let hypotheses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hypotheses")

///|
/// `hypotheses`
pub fn hypotheses() -> @kernel.Thm {
  hypotheses_c.get()
}

///|
/// conclusion
fn step_15() -> Unit raise {
  conclusion_c.set(@pair.new_definition(@term_syntax.parse_term("(conclusion : ((Form) -> Bool) -> Form)((cl : (Form) -> Bool)) == SND(breakhorn(cl))")))
}

///|
let conclusion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("conclusion")

///|
/// `conclusion`
pub fn conclusion() -> @kernel.Thm {
  conclusion_c.get()
}

///|
/// HOLDS_HORN
fn step_16() -> Unit raise {
  let t325 = @meson.asm_meson_tac(@list.List([@resolution.holds_negate()]))
  let t324 = @simp.rewrite_tac(@list.List([@sets.in_delete()]))
  let t323 = @simp.asm_simp_tac(@list.List([@sets.mem_list_of_set(), @sets.finite_delete()]))
  let t322 = @simp.rewrite_tac(@list.List([holds_itlist_imp(), @lists.mem_map()]))
  let t321 = @simp.asm_simp_tac(@list.List([@resolution.holds_interp()]))
  let t320 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@resolution.clause()])))
  let t319 = @tactics.repeat_tac(@tactics.gen_tac)
  let t317 = @simp.rewrite_tac(@list.List([@fol.not_def(), @fol.form_inj(), @equal.gsym(@theorems.exists_refl())]))
  let t316 = @simp.asm_rewrite_tac(@list.List([@resolution.positive(), @resolution.negative()]))
  let t315 = @tactics.undisch_tac(@term_syntax.parse_term("positive((p : Form))"))
  let t314 = @simp.rewrite_tac(@list.List([@resolution.literal()]))
  let t313 = @list.List([@meson.asm_meson_tac(@list.List([@resolution.clause()])), @tactics.all_tac])
  let t318 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("literal((p : Form))"), fn(x310 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s311 = @tactics.mp_tac(x310)
    fn(x312 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s311(x312)
    }
  }), t313), t314), @tactics.strip_tac), t315), t316), t317), @tactics.all_tac])
  let t308 = @meson.meson_tac(@list.List([]))
  let t307 = @simp.simp_tac(@list.List([@resolution.literal(), @resolution.atom_v1(), @fol.not_def(), @fol.form_distinct(), @fol.form_inj()]))
  let t306 = @tactics.undisch_tac(@term_syntax.parse_term("literal(Not((q : Form)))"))
  let t305 = @simp.rewrite_tac(@list.List([@fol.not_def(), @fol.form_inj()]))
  let t301 = @simp.gen_rewrite_rule(fn(x300 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x300
  }, @list.List([@resolution.negative()]))
  let t302 = @tactics.x_choose_then(@term_syntax.parse_term("(q : Form)"))(fn(x297 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s298 = @tactics.subst_all_tac(x297)
    fn(x299 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s298(x299)
    }
  })
  let t304 = @tactics.first_x_assum(fn(x303 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t302(t301(x303))
  })
  let t296 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Form)"))
  let t295 = @simp.simp_tac(@list.List([@trivia.o_thm(), @resolution.negate()]))
  let t294 = @tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(@lists.all_imp()))
  let t293 = @simp.rewrite_tac(@list.List([@lists.all_map()]))
  let t291 = @meson.asm_meson_tac(@list.List([]))
  let t290 = @simp.rewrite_tac(@list.List([@sets.in_delete()]))
  let t289 = @tactics.subgoal_then(@term_syntax.parse_term("∀ q : Form, IN(q, DELETE((cl : (Form) -> Bool), (p : Form))) → literal(q) && !positive(q)"), fn(x287 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x287
    @meson.meson_tac(@list.List([th, @resolution.positive()]))
  })
  let t286 = @simp.asm_simp_tac(@list.List([@equal.gsym(@lists.all_mem()), @sets.mem_list_of_set(), @sets.finite_delete()]))
  let t292 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@resolution.clause()]))), t286), t289), t290), t291), @tactics.all_tac])
  let t309 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("ALL((p : Form) => literal(p) && negative(p), list_of_set(DELETE((cl : (Form) -> Bool), (p : Form))))"), fn(x283 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s284 = @tactics.mp_tac(x283)
    fn(x285 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s284(x285)
    }
  }), t292), t293), t294), t295), t296), @tactics.strip_tac), t304), t305), t306), t307), t308), @tactics.all_tac])
  let t282 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_delete(), @sets.in_elim_thm(), @sets.not_in_empty()]))
  let t281 = @simp.rewrite_tac(@list.List([@sets.has_size_0()]))
  let t280 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()])), @tactics.all_tac])
  let t276 = @term_syntax.parse_term("(p : Form)")
  let t279 = @tactics.first_x_assum(fn(x278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s274 = @tactics.mp_tac(x273)
      fn(x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s274(x275)
      }
    })(((x277 : @kernel.Thm) => @bool.spec(t276, x277))(x278))
  })
  let t272 = @simp.rewrite_tac(@list.List([]))
  let t270 = @meson.meson_tac(@list.List([]))
  let t269 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty()]))
  let t268 = @tactics.undisch_tac(@term_syntax.parse_term("!({(p : Form) | IN(p, (cl : (Form) -> Bool)) && positive(p)} == {})"))
  let t267 = @tactics.conv_tac(@class.select_conv)
  let t271 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@fol.expand_tac("p"), t267), t268), t269), t270), @tactics.all_tac])
  let t266 = @tactics.subgoal_then(@term_syntax.parse_term("IN((p : Form), (cl : (Form) -> Bool)) && positive(p)"), @tactics.strip_assume_tac)
  let t265 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t264 = @simp.rewrite_tac(@list.List([@sets.has_size_suc()]))
  let t263 = @list.List([@simp.asm_rewrite_tac(@list.List([@calc_num.arith(), @sets.has_size()])), @tactics.all_tac])
  let t262 = @tactics.subgoal_then(@term_syntax.parse_term("HAS_SIZE({(p : Form) | IN(p, (cl : (Form) -> Bool)) && positive(p)}, SUC(0))"), fn(x259 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s260 = @tactics.mp_tac(x259)
    fn(x261 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s260(x261)
    }
  })
  let t257 = @meson.asm_meson_tac(@list.List([@resolution.clause()]))
  let t256 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t255 = @tactics.exists_tac(@term_syntax.parse_term("(cl : (Form) -> Bool)"))
  let t258 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t255), t256), t257), @tactics.all_tac])
  let t254 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE({(p : Form) | IN(p, (cl : (Form) -> Bool)) && positive(p)})"), fn(x251 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s252 = @tactics.assume_tac(x251)
    fn(x253 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s252(x253)
    }
  })
  let t248 = @tactics.conv_tac(@class.taut)
  let t247 = @simp.asm_rewrite_tac(@list.List([@lists.itlist(), @fol.holds_v1(), @lists.map(), @resolution.holds_negate()]))
  let t245 = @term_syntax.parse_term("(l : List[Form])")
  let t246 = @tactics.spec_tac(@term_syntax.parse_term("list_of_set((cl : (Form) -> Bool))"), t245)
  let t244 = @simp.rewrite_tac(@list.List([@resolution.interp()]))
  let t249 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t244), t246), @lists.list_induct_tac), t247), t248)
  let t241 = @meson.meson_tac(@list.List([]))
  let t240 = @simp.simp_tac(@list.List([@resolution.literal(), @resolution.atom_v1(), @fol.not_def(), @fol.form_distinct(), @fol.form_inj()]))
  let t239 = @tactics.undisch_tac(@term_syntax.parse_term("literal(Not((q : Form)))"))
  let t238 = @simp.rewrite_tac(@list.List([@fol.not_def(), @fol.form_inj()]))
  let t234 = @simp.gen_rewrite_rule(fn(x233 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x233
  }, @list.List([@resolution.negative()]))
  let t235 = @tactics.x_choose_then(@term_syntax.parse_term("(q : Form)"))(fn(x230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s231 = @tactics.subst_all_tac(x230)
    fn(x232 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s231(x232)
    }
  })
  let t237 = @tactics.first_x_assum(fn(x236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t235(t234(x236))
  })
  let t229 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)"))
  let t228 = @simp.simp_tac(@list.List([@trivia.o_thm(), @resolution.negate()]))
  let t227 = @tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@theorems.imp_conj()]))(@lists.all_imp()))
  let t242 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@lists.all_map()])), t227), t228), t229), @tactics.strip_tac), t237), t238), t239), t240), t241)
  let t224 = @meson.meson_tac(@list.List([@resolution.positive()]))
  let t225 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.not_in_empty()])), t224)
  let t223 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t222 = @simp.asm_rewrite_tac(@list.List([]))
  let t221 = @tactics.exists_tac(@term_syntax.parse_term("(cl : (Form) -> Bool)"))
  let t220 = @tactics.match_mp_tac(@sets.finite_subset())
  let t219 = @simp.asm_rewrite_tac(@list.List([@sets.has_size()]))
  let t226 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@sets.has_size_0())])), t219), t220), t221), t222), t223), t225])
  let t218 = @tactics.subgoal_then(@term_syntax.parse_term("{(p : Form) | IN(p, (cl : (Form) -> Bool)) && positive(p)} == {}"), fn(x215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s216 = @tactics.mp_tac(x215)
    fn(x217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s216(x217)
    }
  })
  let t214 = @simp.asm_simp_tac(@list.List([@equal.gsym(@lists.all_mem()), @sets.mem_list_of_set()]))
  let t243 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@resolution.clause()]))), t214), t218), t226), t242])
  let t250 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("ALL((p : Form) => literal(p) && negative(p), list_of_set((cl : (Form) -> Bool)))"), fn(x211 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s212 = @tactics.mp_tac(x211)
    fn(x213 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s212(x213)
    }
  }), t243), t249])), @tactics.all_tac])
  let t210 = @simp.asm_rewrite_tac(@list.List([definite(), @calc_num.arith(), conclusion(), hypotheses(), breakhorn()]))
  let t207 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("(x : Num) <= 1 → x == 0 || x == 1")))
  let t209 = @tactics.first_x_assum(fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t207(x208))
  })
  let t206 = @simp.rewrite_tac(@list.List([horn()]))
  let t326 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t206), @tactics.strip_tac), t209), t210), t250), t254), t258), t262), t263), t264), @tactics.strip_tac), @pair.let_tac), t265), t266), t271), t272), t279), @tactics.ants_tac), t280), t281), t282), @tactics.disch_tac), @tactics.conj_tac), t309), @tactics.conj_tac), t318), t319), t320), t321), t322), t323), t324), t325)
  holds_horn_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl : (Form) -> Bool, horn(cl) → ALL(atom, hypotheses(cl)) && (if definite(cl) { atom(conclusion(cl)) } else { conclusion(cl) == False }) && (∀ M : ((A) -> Bool, (Num, List[A]) -> A, (Num, List[A]) -> Bool), ∀ v : (Num) -> A, holds(M, v, interp(cl)) == holds(M, v, ITLIST(op_minus_minus_gt, hypotheses(cl), conclusion(cl))))"), t326))
}

///|
let holds_horn_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOLDS_HORN")

///|
/// `HOLDS_HORN`
pub fn holds_horn() -> @kernel.Thm {
  holds_horn_c.get()
}

///|
/// MINMODEL_MODEL
fn step_17() -> Unit raise {
  let t405 = @meson.meson_tac(@list.List([]))
  let t404 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t403 = @simp.rewrite_tac(@list.List([holds_itlist_imp()]))
  let t401 = @simp.asm_rewrite_tac(@list.List([@fol.valuation(), @fol.dom_def(), minmodel()]))
  let t400 = @tactics.undisch_tac(@term_syntax.parse_term("valuation(minmodel(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))), (v : (Num) -> Term))"))
  let t399 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))])
  let t398 = @tactics.first_assum(@tactics.match_mp_tac)
  let t397 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@fol.satisfies(), @sets.in_image()])))
  let t402 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x394
    @simp.gen_rewrite_tac(fn(x396 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x396
    }, @list.List([@equal.gsym(th_1)]))
  }), t397), t398), @tactics.conj_tac), t399), t400), t401), @tactics.all_tac])
  let t393 = @tactics.subgoal_then(@term_syntax.parse_term("holds((H : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)), (v : (Num) -> Term), ITLIST(op_minus_minus_gt, (asm : List[Form]), (c : Form)))"), fn(x390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s391 = @tactics.mp_tac(x390)
    fn(x392 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s391(x392)
    }
  })
  let t389 = @simp.asm_rewrite_tac(@list.List([]))
  let t388 = @tactics.disch_then(fn(x386 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x386
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t385 = @tactics.x_gen_tac(@term_syntax.parse_term("(H : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool))"))
  let t384 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t383 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.forall_all())]))
  let t381 = @meson.asm_meson_tac(@list.List([@lists.all_mem(), minmodel_minimal()]))
  let t380 = @simp.asm_rewrite_tac(@list.List([]))
  let t379 = @tactics.exists_tac(@term_syntax.parse_term("holds(minmodel(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))), (v : (Num) -> Term))"))
  let t382 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@lists.all_imp()), t379), t380), t381), @tactics.all_tac])
  let t378 = @tactics.subgoal_then(@term_syntax.parse_term("ALL((c : Form) => ∀ H : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Dom(H) == herbase(functions(IMAGE(interp, (s : ((Form) -> Bool) -> Bool)))) && Fun(H) == Fn && satisfies(H, IMAGE(interp, s)) → holds(H, (v : (Num) -> Term), c), (asm : List[Form]))"), fn(x375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s376 = @tactics.mp_tac(x375)
    fn(x377 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s376(x377)
    }
  })
  let t374 = @simp.asm_simp_tac(@list.List([minmodel_minimal()]))
  let t373 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t372 = @simp.rewrite_tac(@list.List([@lists.all_mem()]))
  let t371 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) && !(b : Bool)) == (a → b)"))]))
  let t370 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t369 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool)) == (!a → b)"))]))
  let t368 = @simp.rewrite_tac(@list.List([holds_itlist_imp()]))
  let t367 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (Num) -> Term)"))
  let t366 = @simp.asm_rewrite_tac(@list.List([]))
  let t365 = @simp.asm_rewrite_tac(@list.List([]))
  let t363 = @term_syntax.parse_term("(c : Form) == conclusion((cl : (Form) -> Bool))")
  let t364 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(asm : List[Form]) == hypotheses((cl : (Form) -> Bool))"), t363]))
  let t360 = @drule.match_mp(holds_horn())
  let t355 = @term_syntax.parse_type("A")
  let t356 = @list.List([(@term_syntax.parse_type("Term"), t355)])
  let t362 = @tactics.first_assum(fn(x361 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x359 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s353 = @tactics.mp_tac(x352)
        fn(x354 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s353(x354)
        }
      })((fn(x358 : @kernel.Thm) -> @kernel.Thm raise {
        ((x357 : @kernel.Thm) => @kernel.inst_type(t356, x357))(x358)
      })(x359))
    })(t360(x361))
  })
  let t351 = @list.List([@meson.asm_meson_tac(@list.List([definite_imp_horn()])), @tactics.all_tac])
  let t350 = @tactics.subgoal_then(@term_syntax.parse_term("horn((cl : (Form) -> Bool))"), fn(x347 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s348 = @tactics.assume_tac(x347)
    fn(x349 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s348(x349)
    }
  })
  let t346 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t345 = @tactics.subgoal_then(@term_syntax.parse_term("definite((cl : (Form) -> Bool))"), fn(x342 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s343 = @tactics.assume_tac(x342)
    fn(x344 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s343(x344)
    }
  })
  let t341 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s336 = @tactics.subst1_tac(x335)
    fn(x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s336(x337)
    }
  }, fn(x338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s339 = @tactics.assume_tac(x338)
    fn(x340 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s339(x340)
    }
  }))
  let t334 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(cl : (Form) -> Bool)"))(fn(x331 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s332 = @tactics.mp_tac(x331)
    fn(x333 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s332(x333)
    }
  }))
  let t330 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t329 = @simp.rewrite_tac(@list.List([@theorems.imp_conj_alt(), @theorems.right_forall_imp_thm()]))
  let t328 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t327 = @simp.rewrite_tac(@list.List([@fol.satisfies()]))
  let t406 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t327), t328), t329), @tactics.gen_tac), t330), t334), t341), t345), t346), t350), t351), t362), t364), t365), @tactics.strip_tac), t366), t367), @tactics.disch_tac), t368), t369), t370), t371), t372), t373), t374), @tactics.disch_tac), t378), t382), t383), t384), t385), t388), t389), t393), t402), t403), t404), t405)
  minmodel_model_c.set(@tactics.prove(@term_syntax.parse_term("(∀ cl : (Form) -> Bool, IN(cl, (s : ((Form) -> Bool) -> Bool)) → definite(cl)) → satisfies(minmodel(IMAGE(interp, s)), IMAGE(interp, s))"), t406))
}

///|
let minmodel_model_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MINMODEL_MODEL")

///|
/// `MINMODEL_MODEL`
pub fn minmodel_model() -> @kernel.Thm {
  minmodel_model_c.get()
}

///|
/// CONCLUSION_DEFINITE
fn step_18() -> Unit raise {
  let t434 = @meson.asm_meson_tac(@list.List([@resolution.clause()]))
  let t433 = @simp.simp_tac(@list.List([@sets.subset(), @sets.in_elim_thm()]))
  let t432 = @tactics.exists_tac(@term_syntax.parse_term("(cl : (Form) -> Bool)"))
  let t431 = @tactics.match_mp_tac(@sets.finite_subset())
  let t429 = @meson.asm_meson_tac(@list.List([]))
  let t430 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_elim_thm(), @sets.in_insert(), @sets.not_in_empty()])), t429), @tactics.all_tac])
  let t428 = @tactics.match_mp_tac(@sets.card_subset())
  let t427 = @list.List([@simp.asm_simp_tac(@list.List([@sets.card_clauses(), @sets.finite_rules(), @sets.in_sing(), @sets.not_in_empty(), @calc_num.arith()])), @tactics.all_tac])
  let t426 = @tactics.exists_tac(@term_syntax.parse_term("CARD({(p : Form), (q : Form)})"))
  let t425 = @tactics.match_mp_tac(@arith.le_trans())
  let t424 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("2 <= (a : Num) → !(a == 1)")))
  let t423 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool)) == (!b → !a)"))]))
  let t422 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x416 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s417 = @tactics.assume_tac(x416)
    fn(x418 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s417(x418)
    }
  }, fn(x419 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s420 = @tactics.mp_tac(x419)
    fn(x421 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s420(x421)
    }
  }))
  let t415 = @simp.rewrite_tac(@list.List([definite()]))
  let t414 = @tactics.undisch_tac(@term_syntax.parse_term("definite((cl : (Form) -> Bool))"))
  let t413 = @simp.asm_simp_tac(@list.List([]))
  let t412 = @simp.rewrite_tac(@list.List([]))
  let t411 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Form)"))
  let t410 = @tactics.match_mp_tac(@class.select_unique())
  let t409 = @simp.rewrite_tac(@list.List([@pair.snd()]))
  let t408 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t407 = @simp.asm_simp_tac(@list.List([conclusion(), breakhorn()]))
  let t435 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t407), t408), t409), t410), t411), t412), @tactics.eq_tac), t413), @tactics.strip_tac), t414), t415), t422), t423), @tactics.disch_tac), t424), t425), t426), @tactics.conj_tac), t427), t428), @tactics.conj_tac), t430), t431), t432), t433), t434)
  conclusion_definite_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl : (Form) -> Bool, ∀ p : Form, definite(cl) && IN(p, cl) && positive(p) → conclusion(cl) == p"), t435))
}

///|
let conclusion_definite_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONCLUSION_DEFINITE")

///|
/// `CONCLUSION_DEFINITE`
pub fn conclusion_definite() -> @kernel.Thm {
  conclusion_definite_c.get()
}

///|
/// CONCLUSION_DEFINITE_ALT
fn step_19() -> Unit raise {
  let t443 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.not_in_empty(), @sets.finite_rules(), @calc_num.arith()]))
  let t442 = @meson.asm_meson_tac(@list.List([@resolution.positive()]))
  let t444 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm(), @sets.in_sing()])), t442), t443])
  let t441 = @tactics.subgoal_then(@term_syntax.parse_term("{(p : Form) | IN(p, (cl : (Form) -> Bool)) && positive(p)} == {(p : Form)}"), fn(x438 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s439 = @tactics.subst1_tac(x438)
    fn(x440 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s439(x440)
    }
  })
  let t437 = @simp.asm_rewrite_tac(@list.List([definite()]))
  let t436 = @tactics.match_mp_tac(conclusion_definite())
  let t445 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t436), t437), t441), t444)
  conclusion_definite_alt_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl : (Form) -> Bool, ∀ p : Form, clause(cl) && IN(p, cl) && positive(p) && (∀ q : Form, IN(q, cl) && !(q == p) → negative(q)) → conclusion(cl) == p"), t445))
}

///|
let conclusion_definite_alt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONCLUSION_DEFINITE_ALT")

///|
/// `CONCLUSION_DEFINITE_ALT`
pub fn conclusion_definite_alt() -> @kernel.Thm {
  conclusion_definite_alt_c.get()
}

///|
/// HYPOTHESES_CONCLUSION
fn step_20() -> Unit raise {
  let t454 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t453 = @simp.rewrite_tac(@list.List([@sets.in_delete()]))
  let t452 = @simp.asm_simp_tac(@list.List([@sets.mem_list_of_set(), @sets.finite_delete()]))
  let t451 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([definite(), @resolution.clause()])))
  let t450 = @simp.rewrite_tac(@list.List([@lists.mem_map()]))
  let t449 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.extension(), @sets.in_set_of_list(), @sets.in_delete()]))
  let t448 = @simp.rewrite_tac(@list.List([@pair.fst(), @pair.snd()]))
  let t447 = @tactics.conv_tac(@equal.once_depth_conv(@pair.let_conv))
  let t446 = @simp.asm_simp_tac(@list.List([hypotheses(), breakhorn(), conclusion()]))
  let t455 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t446), t447), t448), t449), t450), t451), t452), t453), t454)
  hypotheses_conclusion_c.set(@tactics.prove(@term_syntax.parse_term("∀ cl : (Form) -> Bool, definite(cl) → set_of_list(hypotheses(cl)) == IMAGE(op_tilde_tilde, DELETE(cl, conclusion(cl)))"), t455))
}

///|
let hypotheses_conclusion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPOTHESES_CONCLUSION")

///|
/// `HYPOTHESES_CONCLUSION`
pub fn hypotheses_conclusion() -> @kernel.Thm {
  hypotheses_conclusion_c.get()
}

///|
let gbackchain_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gbackchain_RULES")

///|
/// `gbackchain_RULES`
pub fn gbackchain_rules() -> @kernel.Thm {
  gbackchain_rules_c.get()
}

///|
let gbackchain_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gbackchain_INDUCT")

///|
/// `gbackchain_INDUCT`
pub fn gbackchain_induct() -> @kernel.Thm {
  gbackchain_induct_c.get()
}

///|
let gbackchain_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gbackchain_CASES")

///|
/// `gbackchain_CASES`
pub fn gbackchain_cases() -> @kernel.Thm {
  gbackchain_cases_c.get()
}

///|
/// gbackchain_RULES, gbackchain_INDUCT, gbackchain_CASES
fn step_21() -> Unit raise {
  let (gbackchain_rules, gbackchain_induct, gbackchain_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("∀ cl : (Form) -> Bool, ∀ i : (Num) -> Term, ∀ ns : List[Num], IN(cl, (s : ((Form) -> Bool) -> Bool)) && (∀ x : Num, IN(i(x), herbase(functions(IMAGE(interp, s))))) && ALL2((gbackchain : (((Form) -> Bool) -> Bool, Num, Form) -> Bool)(s), ns, MAP(formsubst(i), hypotheses(cl))) → gbackchain(s, ITLIST(op_plus, ns, 1), formsubst(i, conclusion(cl)))"))
  gbackchain_rules_c.set(gbackchain_rules)
  gbackchain_induct_c.set(gbackchain_induct)
  gbackchain_cases_c.set(gbackchain_cases)
}

///|
/// ALL2_TRIV
fn step_22() -> Unit raise {
  let t457 = @simp.rewrite_tac(@list.List([@theorems.conj_aci()]))
  let t456 = @simp.asm_rewrite_tac(@list.List([@lists.all2(), @lists.all(), @lists.length(), @nums.not_suc(), @nums.suc_inj()]))
  let t458 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @lists.list_induct_tac), t456), t457)
  all2_triv_c.set(@tactics.prove(@term_syntax.parse_term("∀ l1 : List[_], ∀ l2 : List[_], ALL2((n : _) => (P : (_) -> Bool), l1, l2) == (LENGTH(l1) == LENGTH(l2) && ALL(P, l2))"), t458))
}

///|
let all2_triv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ALL2_TRIV")

///|
/// `ALL2_TRIV`
pub fn all2_triv() -> @kernel.Thm {
  all2_triv_c.get()
}

///|
/// GBACKCHAIN_SOUND
fn step_23() -> Unit raise {
  let t540 = @simp.asm_simp_tac(@list.List([@herbrand.herbase_functions()]))
  let t539 = @tactics.match_mp_tac(@fol.interpretation_sublanguage())
  let t537 = @simp.rewrite_tac(@list.List([@herbrand.herbrand(), minmodel(), @fol.dom_def(), @fol.fun_def()]))
  let t538 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@herbrand.herbrand_interpretation()), t537), @tactics.all_tac])
  let t536 = @tactics.subgoal_then(@term_syntax.parse_term("interpretation((functions(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))), predicates(IMAGE(interp, s))), minmodel(IMAGE(interp, s)))"), fn(x533 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s534 = @tactics.mp_tac(x533)
    fn(x535 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s534(x535)
    }
  })
  let t532 = @simp.asm_rewrite_tac(@list.List([]))
  let t522 = @tactics.match_mp_tac(@fol.interpretation_termval())
  let t520 = @term_syntax.parse_term("(t : Term)")
  let t521 = @tactics.spec_tac(@term_syntax.parse_term("(i : (Num) -> Term)((x : Num))"), t520)
  let t519 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t518 = @tactics.subgoal_then(@term_syntax.parse_term("IN((i : (Num) -> Term)((x : Num)), herbase(functions(IMAGE(interp, (s : ((Form) -> Bool) -> Bool)))))"), fn(x515 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s516 = @tactics.mp_tac(x515)
    fn(x517 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s516(x517)
    }
  })
  let t514 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)"))
  let t513 = @simp.rewrite_tac(@list.List([@fol.valuation(), @trivia.o_thm()]))
  let t512 = @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([@sets.in_image()]))])
  let t510 = @meson.meson_tac(@list.List([]))
  let t509 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t508 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t507 = @simp.rewrite_tac(@list.List([@lists.all_map()]))
  let t506 = @tactics.undisch_tac(@term_syntax.parse_term("ALL(holds(minmodel(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))), (v : (Num) -> Term)), MAP(formsubst((i : (Num) -> Term)), hypotheses((cl : (Form) -> Bool))))"))
  let t505 = @simp.rewrite_tac(@list.List([@equal.gsym(@fol.holds_formsubst())]))
  let t504 = @simp.rewrite_tac(@list.List([holds_itlist_imp()]))
  let t503 = @simp.asm_rewrite_tac(@list.List([]))
  let t502 = @simp.asm_rewrite_tac(@list.List([]))
  let t499 = @drule.match_mp(holds_horn())
  let t494 = @term_syntax.parse_type("A")
  let t495 = @list.List([(@term_syntax.parse_type("Term"), t494)])
  let t501 = @tactics.disch_then(fn(x500 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x498 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x491 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s492 = @tactics.mp_tac(x491)
        fn(x493 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s492(x493)
        }
      })((fn(x497 : @kernel.Thm) -> @kernel.Thm raise {
        ((x496 : @kernel.Thm) => @kernel.inst_type(t495, x496))(x497)
      })(x498))
    })(t499(x500))
  })
  let t490 = @list.List([@meson.asm_meson_tac(@list.List([definite_imp_horn()])), @tactics.all_tac])
  let t511 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("horn((cl : (Form) -> Bool))"), fn(x487 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s488 = @tactics.mp_tac(x487)
    fn(x489 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s488(x489)
    }
  }), t490), t501), t502), @tactics.strip_tac), t503), t504), t505), t506), t507), t508), t509), t510)])
  let t483 = @term_syntax.parse_term("interp((cl : (Form) -> Bool))")
  let t486 = @tactics.disch_then(fn(x485 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x480 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s481 = @tactics.mp_tac(x480)
      fn(x482 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s481(x482)
      }
    })(((x484 : @kernel.Thm) => @bool.spec(t483, x484))(x485))
  })
  let t479 = @simp.asm_rewrite_tac(@list.List([]))
  let t475 = @term_syntax.parse_term("o(termval(minmodel(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))), (v : (Num) -> Term)), (i : (Num) -> Term))")
  let t478 = @tactics.disch_then(fn(x477 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x472 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s473 = @tactics.mp_tac(x472)
      fn(x474 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s473(x474)
      }
    })(((x476 : @kernel.Thm) => @bool.spec(t475, x476))(x477))
  })
  let t471 = @simp.rewrite_tac(@list.List([@fol.satisfies()]))
  let t468 = @drule.match_mp(minmodel_model())
  let t470 = @tactics.first_assum(fn(x469 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s466 = @tactics.mp_tac(x465)
      fn(x467 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s466(x467)
      }
    })(t468(x469))
  })
  let t464 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t463 = @simp.rewrite_tac(@list.List([]))
  let t460 = @term_syntax.parse_term("(ns : List[Num])")
  let t461 = @term_syntax.parse_term("(i : (Num) -> Term)")
  let t462 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(cl : (Form) -> Bool)"), t461, t460]))
  let t459 = @simp.rewrite_tac(@list.List([all2_triv()]))
  let t541 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.match_mp_tac(gbackchain_induct())), t459), t462), t463), t464), @tactics.strip_tac), t470), t471), t478), t479), t486), @tactics.ants_tac), t511), @tactics.conj_tac), t512), t513), t514), t518), t519), t521), @tactics.gen_tac), @tactics.disch_tac), t522), fn(x531 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x530 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x528 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x527 : (@kernel.Term, @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x523 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s524 = @tactics.exists_tac(x523)
            fn(x525 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s524(x525)
            }
          })((fn(x526 : (@kernel.Term, @kernel.Term)) -> @kernel.Term raise {
            x526.0
          })(x527))
        })(@basics.dest_exists(x528))
      })((fn(x529 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x529.1
      })(x530))
    })(x531)(x531)
  }), t532), t536), t538), t539), t540)
  gbackchain_sound_c.set(@tactics.prove(@term_syntax.parse_term("(∀ cl : (Form) -> Bool, IN(cl, (s : ((Form) -> Bool) -> Bool)) → definite(cl)) && valuation(minmodel(IMAGE(interp, s)), (v : (Num) -> Term)) → (∀ n : Num, ∀ p : Form, gbackchain(s, n, p) → holds(minmodel(IMAGE(interp, s)), v, p))"), t541))
}

///|
let gbackchain_sound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GBACKCHAIN_SOUND")

///|
/// `GBACKCHAIN_SOUND`
pub fn gbackchain_sound() -> @kernel.Thm {
  gbackchain_sound_c.get()
}

///|
/// GBACKCHAIN_COMPLETE
fn step_24() -> Unit raise {
  let t731 = @simp.asm_rewrite_tac(@list.List([]))
  let t730 = @tactics.match_mp_tac(gbackchain_rules())
  let t729 = @tactics.exists_tac(@term_syntax.parse_term("ITLIST(op_plus, (ns : List[Num]), 1)"))
  let t726 = @term_syntax.parse_term("(ns : List[Num])")
  let t728 = @tactics.disch_then((x727 : @kernel.Thm) => @tactics.x_choose_tac(t726, x727))
  let t724 = @simp.asm_rewrite_tac(@list.List([@lists.all2()]))
  let t723 = @tactics.exists_tac(@term_syntax.parse_term("CONS((n : Num), (ns : List[Num]))"))
  let t720 = @term_syntax.parse_term("(ns : List[Num])")
  let t722 = @tactics.disch_then((x721 : @kernel.Thm) => @tactics.x_choose_tac(t720, x721))
  let t719 = @simp.asm_rewrite_tac(@list.List([]))
  let t718 = @tactics.first_assum(fn(x717 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x715 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x710 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s711 = @tactics.undisch_tac(x710)
        fn(x712 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s711(x712)
        }
      })(((x714 : @kernel.Term) => @lib.check(fn(x713 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x713)
      }, x714))(x715))
    })((fn(x716 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x716)
    })(x717))
  })
  let t704 = @term_syntax.parse_term("(n : Num)")
  let t709 = @tactics.disch_then(@tactics.conjuncts_then2((x705 : @kernel.Thm) => @tactics.x_choose_tac(t704, x705), fn(x706 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s707 = @tactics.assume_tac(x706)
    fn(x708 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s707(x708)
    }
  }))
  let t702 = @simp.rewrite_tac(@list.List([@lists.all2()]))
  let t703 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Num])")), t702), @tactics.all_tac])
  let t701 = @simp.rewrite_tac(@list.List([@lists.all(), @lists.map()]))
  let t700 = @tactics.pop_assum_list(fn(x699 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t698 = @term_syntax.parse_term("(l : List[Form])")
  let t725 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("hypotheses((cl : (Form) -> Bool))"), t698), t700), @lists.list_induct_tac), t701), t703), t709), t718), t719), t722), t723), t724), @tactics.all_tac])
  let t697 = @tactics.exists_tac(@term_syntax.parse_term("∃ ns : List[Num], ALL2(gbackchain((s : ((Form) -> Bool) -> Bool)), ns, MAP(formsubst((v : (Num) -> Term)), hypotheses((cl : (Form) -> Bool))))"))
  let t696 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("∀ b : Bool, ((a : Bool) → b) && (b → (c : Bool)) → a → c")))
  let t694 = @meson.asm_meson_tac(@list.List([]))
  let t693 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t695 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ALL(atom, hypotheses((cl : (Form) -> Bool)))")), t693), t694), @tactics.all_tac])
  let t692 = @tactics.subgoal_then(@term_syntax.parse_term("ALL(holds((gbmod : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)), (v : (Num) -> Term)), hypotheses((cl : (Form) -> Bool))) == ALL((p : Form) => ∃ n : Num, gbackchain((s : ((Form) -> Bool) -> Bool), n, formsubst(v, p)), hypotheses(cl))"), fn(x689 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s690 = @tactics.subst1_tac(x689)
    fn(x691 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s690(x691)
    }
  })
  let t687 = @meson.asm_meson_tac(@list.List([]))
  let t686 = @simp.rewrite_tac(@list.List([]))
  let t685 = @tactics.first_x_assum(fn(x684 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x678 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s679 = @tactics.mp_tac(x678)
      fn(x680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s679(x680)
      }
    })(((x683 : @kernel.Thm) => @lib.check(fn(x682 : @kernel.Thm) -> Bool raise {
      @class.is_cond((fn(x681 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x681)
      })(x682))
    }, x683))(x684))
  })
  let t688 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t685), @class.cond_cases_tac), t686), t687), @tactics.all_tac])
  let t677 = @tactics.subgoal_then(@term_syntax.parse_term("holds((gbmod : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)), (v : (Num) -> Term), conclusion((cl : (Form) -> Bool))) == (∃ n : Num, gbackchain((s : ((Form) -> Bool) -> Bool), n, formsubst(v, conclusion(cl))))"), fn(x674 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s675 = @tactics.subst1_tac(x674)
    fn(x676 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s675(x676)
    }
  })
  let t672 = @simp.rewrite_tac(@list.List([@fol.fun_def()]))
  let t671 = @tactics.match_mp_tac(@fol.termsubst_termval())
  let t669 = @term_syntax.parse_term("(v : (Num) -> Term)")
  let t670 = @tactics.spec_tac(@term_syntax.parse_term("(v : (Num) -> Term)"), t669)
  let t667 = @term_syntax.parse_term("(t : Term)")
  let t668 = @tactics.spec_tac(@term_syntax.parse_term("(t : Term)"), t667)
  let t666 = @tactics.conv_tac(@equal.sym_conv)
  let t665 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Term)"))
  let t664 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t663 = @tactics.match_mp_tac(@lists.map_eq())
  let t662 = @tactics.repeat_tac(@tactics.gen_tac)
  let t661 = @simp.rewrite_tac(@list.List([@fol.pred_def(), @fol.formsubst()]))
  let t660 = @simp.rewrite_tac(@list.List([@fol.holds_v1()]))
  let t659 = @fol.expand_tac("gbmod")
  let t673 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@resolution.atom_v1(), @theorems.left_imp_exists_thm()])), t659), t660), t661), t662), @tactics.disch_tac), @tactics.ap_term_tac), @tactics.abs_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t663), t664), t665), @tactics.disch_tac), t666), t668), t670), t671), t672), @tactics.all_tac])
  let t658 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, atom(p) → holds((gbmod : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)), (v : (Num) -> Term), p) == (∃ n : Num, gbackchain((s : ((Form) -> Bool) -> Bool), n, formsubst(v, p)))"), fn(x655 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s656 = @tactics.assume_tac(x655)
    fn(x657 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s656(x657)
    }
  })
  let t654 = @simp.abbrev_tac(@term_syntax.parse_term("(gbmod : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)) == (herbase(functions(IMAGE(interp, (s : ((Form) -> Bool) -> Bool)))), Fn, (p : Num) => (tms : List[Term]) => ∃ n : Num, gbackchain(s, n, Atom(p, tms)))"))
  let t653 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t652 = @simp.rewrite_tac(@list.List([@lists.all_mem()]))
  let t651 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) && !(b : Bool)) == (a → b)"))]))
  let t650 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool)) == (!a → b)")), @class.not_exists_thm()]))
  let t649 = @simp.rewrite_tac(@list.List([holds_itlist_imp()]))
  let t648 = @simp.asm_rewrite_tac(@list.List([]))
  let t647 = @simp.asm_rewrite_tac(@list.List([]))
  let t644 = @drule.match_mp(holds_horn())
  let t639 = @term_syntax.parse_type("A")
  let t640 = @list.List([(@term_syntax.parse_type("Term"), t639)])
  let t646 = @tactics.disch_then(fn(x645 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x636 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s637 = @tactics.mp_tac(x636)
        fn(x638 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s637(x638)
        }
      })((fn(x642 : @kernel.Thm) -> @kernel.Thm raise {
        ((x641 : @kernel.Thm) => @kernel.inst_type(t640, x641))(x642)
      })(x643))
    })(t644(x645))
  })
  let t635 = @list.List([@meson.asm_meson_tac(@list.List([definite_imp_horn()])), @tactics.all_tac])
  let t634 = @tactics.subgoal_then(@term_syntax.parse_term("horn((cl : (Form) -> Bool))"), fn(x631 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s632 = @tactics.mp_tac(x631)
    fn(x633 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s632(x633)
    }
  })
  let t629 = @tactics.conjuncts_then2(fn(x623 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s624 = @tactics.subst_all_tac(x623)
    fn(x625 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s624(x625)
    }
  }, fn(x626 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s627 = @tactics.assume_tac(x626)
    fn(x628 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s627(x628)
    }
  })
  let t630 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(cl : (Form) -> Bool)"))(t629))
  let t622 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t621 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x615 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s616 = @tactics.assume_tac(x615)
    fn(x617 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s616(x617)
    }
  }, fn(x618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s619 = @tactics.mp_tac(x618)
    fn(x620 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s619(x620)
    }
  }))
  let t614 = @simp.rewrite_tac(@list.List([@fol.valuation(), @fol.dom_def()]))
  let t613 = @tactics.repeat_tac(@tactics.gen_tac)
  let t612 = @simp.rewrite_tac(@list.List([@fol.satisfies()]))
  let t610 = @simp.rewrite_tac(@list.List([@fol.fun_def()]))
  let t609 = @tactics.match_mp_tac(@fol.termval_triv())
  let t607 = @term_syntax.parse_term("(t : Term)")
  let t608 = @tactics.spec_tac(@term_syntax.parse_term("(t : Term)"), t607)
  let t605 = @meson.asm_meson_tac(@list.List([]))
  let t606 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@fol.termval_valuation()), t605), @tactics.all_tac])
  let t604 = @tactics.exists_tac(@term_syntax.parse_term("termval((herbase(functions(IMAGE(interp, (s : ((Form) -> Bool) -> Bool)))), Fn, (p : Num) => (tms : List[Term]) => ∃ n : Num, gbackchain(s, n, Atom(p, tms))), V, (t : Term))"))
  let t603 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t602 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Term)"))
  let t601 = @simp.rewrite_tac(@list.List([@trivia.o_thm(), @class.not_exists_thm()]))
  let t599 = @equal.gsym(@lists.ex_mem())
  let t600 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem()), t599]))
  let t598 = @simp.rewrite_tac(@list.List([@lists.ex_map()]))
  let t597 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @fol.fv(), @fol.in_list_union()]))
  let t596 = @tactics.undisch_tac(@term_syntax.parse_term("FV(Atom((P : Num), (tms : List[Term]))) == {}"))
  let t595 = @tactics.match_mp_tac(@lists.map_eq_degen())
  let t611 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t595), t596), t597), t598), t600), t601), @tactics.disch_tac), t602), @tactics.disch_tac), t603), t604), @tactics.conj_tac), t606), t608), t609), t610), @tactics.all_tac])
  let t594 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) == (c : Bool) && (a : Bool) → (a → b) → c")))
  let t593 = @simp.rewrite_tac(@list.List([@fol.holds(), @fol.pred_def()]))
  let t592 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(tms : List[Term])"))(fn(x589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s590 = @tactics.subst_all_tac(x589)
    fn(x591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s590(x591)
    }
  }))
  let t585 = @simp.gen_rewrite_rule(fn(x584 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x584
  }, @list.List([@resolution.atom_v1()]))
  let t586 = @tactics.x_choose_then(@term_syntax.parse_term("(P : Num)"))(fn(x581 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s582 = @tactics.mp_tac(x581)
    fn(x583 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s582(x583)
    }
  })
  let t588 = @tactics.first_assum(fn(x587 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t586(t585(x587))
  })
  let t580 = @simp.rewrite_tac(@list.List([@fol.dom_def(), @fol.fun_def()]))
  let t576 = @term_syntax.parse_term("(herbase(functions(IMAGE(interp, (s : ((Form) -> Bool) -> Bool)))), Fn, (p : Num) => (tms : List[Term]) => ∃ n : Num, gbackchain(s, n, Atom(p, tms)))")
  let t579 = @tactics.disch_then(fn(x578 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x573 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s574 = @tactics.mp_tac(x573)
      fn(x575 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s574(x575)
      }
    })(((x577 : @kernel.Thm) => @bool.spec(t576, x577))(x578))
  })
  let t569 = @term_syntax.parse_term("(v : (Num) -> Term)")
  let t572 = @tactics.disch_then(fn(x571 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s567 = @tactics.mp_tac(x566)
      fn(x568 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s567(x568)
      }
    })(((x570 : @kernel.Thm) => @bool.spec(t569, x570))(x571))
  })
  let t565 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x559 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s560 = @tactics.assume_tac(x559)
    fn(x561 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s560(x561)
    }
  }, fn(x562 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s563 = @tactics.mp_tac(x562)
    fn(x564 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s563(x564)
    }
  }))
  let t558 = @tactics.first_assum(fn(x556 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x556
    @simp.rewrite_tac(@list.List([@drule.match_mp(minmodel_minimal())(th)]))
  })
  let t555 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x549 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s550 = @tactics.assume_tac(x549)
    fn(x551 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s550(x551)
    }
  }, fn(x552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s553 = @tactics.mp_tac(x552)
    fn(x554 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s553(x554)
    }
  }))
  let t548 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s543 = @tactics.assume_tac(x542)
    fn(x544 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s543(x544)
    }
  }, fn(x545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s546 = @tactics.mp_tac(x545)
    fn(x547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s546(x547)
    }
  }))
  let t732 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t548), t555), t558), t565), t572), t579), t580), t588), t592), t593), t594), @tactics.conj_tac), t611), t612), t613), t614), t621), t622), t630), t634), t635), t646), t647), @tactics.strip_tac), t648), t649), t650), t651), t652), t653), t654), t658), t673), t677), t688), t692), t695), t696), t697), @tactics.conj_tac), t725), t728), t729), t730), t731)
  gbackchain_complete_c.set(@tactics.prove(@term_syntax.parse_term("(∀ cl : (Form) -> Bool, IN(cl, (s : ((Form) -> Bool) -> Bool)) → definite(cl)) && atom((p : Form)) && FV(p) == {} && (∀ v : (Num) -> Term, holds(minmodel(IMAGE(interp, s)), v, p)) → (∃ n : Num, gbackchain(s, n, p))"), t732))
}

///|
let gbackchain_complete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GBACKCHAIN_COMPLETE")

///|
/// `GBACKCHAIN_COMPLETE`
pub fn gbackchain_complete() -> @kernel.Thm {
  gbackchain_complete_c.get()
}

///|
/// GBACKCHAIN_MINIMAL
fn step_25() -> Unit raise {
  let t753 = @simp.asm_simp_tac(@list.List([@fol.holds_valuation(), @sets.not_in_empty()]))
  let t751 = @simp.asm_rewrite_tac(@list.List([]))
  let t750 = @tactics.match_mp_tac(gbackchain_sound())
  let t749 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t747 = @term_syntax.parse_term("(p : Form)")
  let t748 = @tactics.spec_tac(@term_syntax.parse_term("(p : Form)"), t747)
  let t746 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t752 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("∃ n : Num, gbackchain((s : ((Form) -> Bool) -> Bool), n, (p : Form))")), t746), t748), t749), t750), t751), @tactics.all_tac])
  let t745 = @tactics.subgoal_then(@term_syntax.parse_term("holds(minmodel(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))), (w : (Num) -> Term), (p : Form))"), fn(x742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s743 = @tactics.mp_tac(x742)
    fn(x744 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s743(x744)
    }
  })
  let t740 = @simp.rewrite_tac(@list.List([@pair.fst()]))
  let t739 = @tactics.exists_tac(@term_syntax.parse_term("(functions(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))), predicates((summat : (Form) -> Bool)))"))
  let t738 = @simp.rewrite_tac(@list.List([@herbrand.herbrand(), minmodel(), @fol.dom_def(), @fol.fun_def()]))
  let t737 = @tactics.match_mp_tac(@herbrand.herbrand_nonempty())
  let t741 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@logic_canon.valuation_exists()), t737), t738), t739), t740), @tactics.all_tac])
  let t735 = @term_syntax.parse_term("(w : (Num) -> Term)")
  let t754 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_tac, @tactics.subgoal_then(@term_syntax.parse_term("∃ w : (Num) -> Term, valuation(minmodel(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))), w)"), (x736 : @kernel.Thm) => @tactics.x_choose_tac(t735, x736))), t741), t745), t752), t753)
  let t734 = @simp.asm_simp_tac(@list.List([@fol.holds_valuation(), @sets.not_in_empty()]))
  let t733 = @simp.asm_rewrite_tac(@list.List([]))
  let t755 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.match_mp_tac(gbackchain_complete())), t733), @tactics.gen_tac), t734), t754])
  let t756 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t755)
  gbackchain_minimal_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((Form) -> Bool) -> Bool, ∀ p : Form, (∀ cl : (Form) -> Bool, IN(cl, s) → definite(cl)) && atom(p) && FV(p) == {} → (∀ v : (Num) -> Term, holds(minmodel(IMAGE(interp, s)), v, p) == (∃ n : Num, gbackchain(s, n, p)))"), t756))
}

///|
let gbackchain_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GBACKCHAIN_MINIMAL")

///|
/// `GBACKCHAIN_MINIMAL`
pub fn gbackchain_minimal() -> @kernel.Thm {
  gbackchain_minimal_c.get()
}

///|
/// iminmodel
fn step_26() -> Unit raise {
  iminmodel_c.set(@pair.new_definition(@term_syntax.parse_term("(iminmodel : ((Form) -> Bool) -> ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool))((s : (Form) -> Bool)) == (terms(functions(s)), Fn, (p : Num) => (zs : List[Term]) => ∀ C : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Dom(C) == terms(functions(s)) && Fun(C) == Fn && (∀ v : (Num) -> Term, ∀ p : Form, IN(p, s) && valuation(C, v) → holds(C, v, p)) → Pred(C, p, zs))")))
}

///|
let iminmodel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("iminmodel")

///|
/// `iminmodel`
pub fn iminmodel() -> @kernel.Thm {
  iminmodel_c.get()
}

///|
/// IMINMODEL_MINIMAL
fn step_27() -> Unit raise {
  let t782 = @simp.asm_rewrite_tac(@list.List([@fol.fun_def()]))
  let t781 = @tactics.match_mp_tac(@fol.termval_functions())
  let t779 = @term_syntax.parse_term("(w : (Num) -> Term)")
  let t780 = @tactics.spec_tac(@term_syntax.parse_term("(w : (Num) -> Term)"), t779)
  let t778 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Term)"))
  let t777 = @simp.gen_rewrite_tac(fn(x776 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x776
  }, @list.List([@class.fun_eq_thm()]))
  let t775 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : (Num) -> Term)"))
  let t774 = @simp.gen_rewrite_tac(fn(x773 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x773
  }, @list.List([@class.fun_eq_thm()]))
  let t772 = @tactics.subgoal_then(@term_syntax.parse_term("termval((terms(functions((s : (Form) -> Bool))), Fn, (p : Num) => (zs : List[Term]) => ∀ C : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Dom(C) == terms(functions(s)) && Fun(C) == Fn && (∀ v : (Num) -> Term, ∀ p : Form, IN(p, s) && valuation(C, v) → holds(C, v, p)) → Pred(C, p, zs))) == termval((C : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)))"), fn(x770 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x770
    @simp.rewrite_tac(@list.List([th]))
  })
  let t769 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a → b) == (a → c)")))
  let t768 = @simp.rewrite_tac(@list.List([]))
  let t767 = @tactics.x_gen_tac(@term_syntax.parse_term("(C : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool))"))
  let t766 = @simp.gen_rewrite_tac(fn(x765 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x765
  }, @list.List([@class.fun_eq_thm()]))
  let t764 = @simp.rewrite_tac(@list.List([@fol.holds(), iminmodel(), @fol.pred_def(), @fol.fun_def()]))
  let t763 = @tactics.disch_then(fn(x760 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s761 = @tactics.subst_all_tac(x760)
    fn(x762 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s761(x762)
    }
  })
  let t758 = @term_syntax.parse_term("(args : List[Term])")
  let t759 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(p : Num)"), t758]))
  let t757 = @simp.rewrite_tac(@list.List([@resolution.atom_v1(), @theorems.left_imp_exists_thm()]))
  let t783 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t757), t759), t763), t764), @tactics.ap_term_tac), t766), t767), t768), t769), @tactics.strip_tac), t772), t774), t775), t777), t778), t780), t781), t782)
  iminmodel_minimal_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Form, ∀ v : (Num) -> Term, ∀ s : (Form) -> Bool, atom(p) → holds(iminmodel(s), v, p) == (∀ C : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Dom(C) == terms(functions(s)) && Fun(C) == Fn && (∀ v : (Num) -> Term, ∀ q : Form, IN(q, s) && valuation(C, v) → holds(C, v, q)) → holds(C, v, p))"), t783))
}

///|
let iminmodel_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMINMODEL_MINIMAL")

///|
/// `IMINMODEL_MINIMAL`
pub fn iminmodel_minimal() -> @kernel.Thm {
  iminmodel_minimal_c.get()
}

///|
/// IMINMODEL_MODEL
fn step_28() -> Unit raise {
  let t859 = @meson.meson_tac(@list.List([]))
  let t858 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t857 = @simp.rewrite_tac(@list.List([holds_itlist_imp()]))
  let t855 = @meson.asm_meson_tac(@list.List([@sets.in_image()]))
  let t854 = @simp.asm_rewrite_tac(@list.List([@fol.valuation(), @fol.dom_def()]))
  let t853 = @tactics.first_assum(@tactics.match_mp_tac)
  let t856 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x850 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x850
    @simp.gen_rewrite_tac(fn(x852 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x852
    }, @list.List([@equal.gsym(th_2)]))
  }), t853), t854), t855), @tactics.all_tac])
  let t849 = @tactics.subgoal_then(@term_syntax.parse_term("holds((C : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)), (v : (Num) -> Term), ITLIST(op_minus_minus_gt, (asm : List[Form]), (c : Form)))"), fn(x846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s847 = @tactics.mp_tac(x846)
    fn(x848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s847(x848)
    }
  })
  let t845 = @simp.asm_rewrite_tac(@list.List([]))
  let t844 = @tactics.disch_then(fn(x842 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x842
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th_1))
  })
  let t841 = @tactics.x_gen_tac(@term_syntax.parse_term("(C : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool))"))
  let t840 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t839 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.forall_all())]))
  let t837 = @meson.asm_meson_tac(@list.List([@lists.all_mem()]))
  let t836 = @tactics.subgoal_then(@term_syntax.parse_term("atom((p : Form))"), fn(x834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x834
    @simp.rewrite_tac(@list.List([@drule.match_mp(iminmodel_minimal())(th)]))
  })
  let t833 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x827 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s828 = @tactics.assume_tac(x827)
    fn(x829 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s828(x829)
    }
  }, fn(x830 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s831 = @tactics.mp_tac(x830)
    fn(x832 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s831(x832)
    }
  }))
  let t826 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Form)"))
  let t825 = @simp.asm_rewrite_tac(@list.List([]))
  let t824 = @tactics.exists_tac(@term_syntax.parse_term("holds(iminmodel(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))), (v : (Num) -> Term))"))
  let t838 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@lists.all_imp()), t824), t825), t826), t833), t836), t837), @tactics.all_tac])
  let t823 = @tactics.subgoal_then(@term_syntax.parse_term("ALL((c : Form) => ∀ C : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool), Dom(C) == terms(functions(IMAGE(interp, (s : ((Form) -> Bool) -> Bool)))) && Fun(C) == Fn && (∀ v : (Num) -> Term, ∀ p : Form, IN(p, IMAGE(interp, s)) && valuation(C, v) → holds(C, v, p)) → holds(C, (v : (Num) -> Term), c), (asm : List[Form]))"), fn(x820 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s821 = @tactics.mp_tac(x820)
    fn(x822 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s821(x822)
    }
  })
  let t819 = @simp.asm_simp_tac(@list.List([iminmodel_minimal()]))
  let t818 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t817 = @simp.rewrite_tac(@list.List([@lists.all_mem()]))
  let t816 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) && !(b : Bool)) == (a → b)"))]))
  let t815 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t814 = @simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool)) == (!a → b)"))]))
  let t813 = @simp.rewrite_tac(@list.List([holds_itlist_imp()]))
  let t812 = @tactics.x_gen_tac(@term_syntax.parse_term("(v : (Num) -> Term)"))
  let t811 = @simp.asm_rewrite_tac(@list.List([]))
  let t810 = @simp.asm_rewrite_tac(@list.List([]))
  let t808 = @term_syntax.parse_term("(c : Form) == conclusion((cl : (Form) -> Bool))")
  let t809 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(asm : List[Form]) == hypotheses((cl : (Form) -> Bool))"), t808]))
  let t805 = @drule.match_mp(holds_horn())
  let t800 = @term_syntax.parse_type("A")
  let t801 = @list.List([(@term_syntax.parse_type("Term"), t800)])
  let t807 = @tactics.first_assum(fn(x806 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x804 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x797 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s798 = @tactics.mp_tac(x797)
        fn(x799 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s798(x799)
        }
      })((fn(x803 : @kernel.Thm) -> @kernel.Thm raise {
        ((x802 : @kernel.Thm) => @kernel.inst_type(t801, x802))(x803)
      })(x804))
    })(t805(x806))
  })
  let t796 = @list.List([@meson.asm_meson_tac(@list.List([definite_imp_horn()])), @tactics.all_tac])
  let t795 = @tactics.subgoal_then(@term_syntax.parse_term("horn((cl : (Form) -> Bool))"), fn(x792 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s793 = @tactics.assume_tac(x792)
    fn(x794 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s793(x794)
    }
  })
  let t791 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t790 = @tactics.subgoal_then(@term_syntax.parse_term("definite((cl : (Form) -> Bool))"), fn(x787 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s788 = @tactics.assume_tac(x787)
    fn(x789 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s788(x789)
    }
  })
  let t786 = @tactics.x_gen_tac(@term_syntax.parse_term("(cl : (Form) -> Bool)"))
  let t785 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t784 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t860 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t784), t785), t786), @tactics.disch_tac), t790), t791), t795), t796), t807), t809), t810), @tactics.strip_tac), t811), t812), @tactics.disch_tac), t813), t814), t815), t816), t817), t818), t819), @tactics.disch_tac), t823), t838), t839), t840), t841), t844), t845), t849), t856), t857), t858), t859)
  iminmodel_model_c.set(@tactics.prove(@term_syntax.parse_term("(∀ cl : (Form) -> Bool, IN(cl, (s : ((Form) -> Bool) -> Bool)) → definite(cl)) → (∀ v : (Num) -> Term, ∀ p : (Form) -> Bool, IN(p, s) && (∀ x : Num, IN(v(x), terms(functions(IMAGE(interp, s))))) → holds(iminmodel(IMAGE(interp, s)), v, interp(p)))"), t860))
}

///|
let iminmodel_model_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMINMODEL_MODEL")

///|
/// `IMINMODEL_MODEL`
pub fn iminmodel_model() -> @kernel.Thm {
  iminmodel_model_c.get()
}

///|
/// IMINMODEL_INTERPRETATION
fn step_29() -> Unit raise {
  let t871 = @simp.asm_simp_tac(@list.List([@logic_canon.terms_rules()]))
  let t870 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t869 = @simp.rewrite_tac(@list.List([@fol.fun_def(), @sets.in_()]))
  let t868 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x862 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s863 = @tactics.assume_tac(x862)
    fn(x864 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s863(x864)
    }
  }, fn(x865 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s866 = @tactics.mp_tac(x865)
    fn(x867 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s866(x867)
    }
  }))
  let t861 = @tactics.repeat_tac(@tactics.gen_tac)
  let t872 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@fol.interpretation(), iminmodel(), @fol.language(), @fol.dom_def()]))), t861), t868), t869), t870), t871)
  iminmodel_interpretation_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Form) -> Bool, interpretation(language(s), iminmodel(s))"), t872))
}

///|
let iminmodel_interpretation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMINMODEL_INTERPRETATION")

///|
/// `IMINMODEL_INTERPRETATION`
pub fn iminmodel_interpretation() -> @kernel.Thm {
  iminmodel_interpretation_c.get()
}

///|
let ibackchain_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ibackchain_RULES")

///|
/// `ibackchain_RULES`
pub fn ibackchain_rules() -> @kernel.Thm {
  ibackchain_rules_c.get()
}

///|
let ibackchain_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ibackchain_INDUCT")

///|
/// `ibackchain_INDUCT`
pub fn ibackchain_induct() -> @kernel.Thm {
  ibackchain_induct_c.get()
}

///|
let ibackchain_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ibackchain_CASES")

///|
/// `ibackchain_CASES`
pub fn ibackchain_cases() -> @kernel.Thm {
  ibackchain_cases_c.get()
}

///|
/// ibackchain_RULES, ibackchain_INDUCT, ibackchain_CASES
fn step_30() -> Unit raise {
  let (ibackchain_rules, ibackchain_induct, ibackchain_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("∀ cl : (Form) -> Bool, ∀ i : (Num) -> Term, ∀ ns : List[Num], IN(cl, (s : ((Form) -> Bool) -> Bool)) && (∀ x : Num, IN(i(x), terms(functions(IMAGE(interp, s))))) && ALL2((ibackchain : (((Form) -> Bool) -> Bool, Num, Form) -> Bool)(s), ns, MAP(formsubst(i), hypotheses(cl))) → ibackchain(s, ITLIST(op_plus, ns, 1), formsubst(i, conclusion(cl)))"))
  ibackchain_rules_c.set(ibackchain_rules)
  ibackchain_induct_c.set(ibackchain_induct)
  ibackchain_cases_c.set(ibackchain_cases)
}

///|
/// IBACKCHAIN_SOUND
fn step_31() -> Unit raise {
  let t954 = @meson.meson_tac(@list.List([]))
  let t953 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t952 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t951 = @simp.rewrite_tac(@list.List([@lists.all_map()]))
  let t950 = @simp.asm_rewrite_tac(@list.List([]))
  let t949 = @tactics.undisch_tac(@term_syntax.parse_term("ALL((p : Form) => (∀ x : Num, IN((v : (Num) -> Term)(x), terms(functions(IMAGE(interp, (s : ((Form) -> Bool) -> Bool)))))) → holds(iminmodel(IMAGE(interp, s)), v, p), MAP(formsubst((i : (Num) -> Term)), hypotheses((cl : (Form) -> Bool))))"))
  let t946 = @simp.asm_rewrite_tac(@list.List([@fol.valuation(), iminmodel(), @fol.dom_def()]))
  let t945 = @simp.rewrite_tac(@list.List([@fol.language(), @pair.fst()]))
  let t942 = @drule.match_mp(@logic_canon.stupid_canondom_lemma())
  let t944 = @tactics.disch_then(fn(x943 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x939 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s940 = @tactics.mp_tac(x939)
      fn(x941 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s940(x941)
      }
    })(t942(x943))
  })
  let t938 = @list.List([@simp.asm_rewrite_tac(@list.List([@fol.language(), @pair.fst()])), @tactics.all_tac])
  let t937 = @tactics.subgoal_then(@term_syntax.parse_term("IN((i : (Num) -> Term)((x : Num)), terms(FST(language(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))))))"), fn(x934 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s935 = @tactics.mp_tac(x934)
    fn(x936 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s935(x936)
    }
  })
  let t933 = @tactics.match_mp_tac(@fol.interpretation_sublanguage())
  let t932 = @simp.rewrite_tac(@list.List([@fol.language()]))
  let t947 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("IMAGE(interp, (s : ((Form) -> Bool) -> Bool))"), iminmodel_interpretation())), t932), t933), t937), t938), t944), t945), t946])
  let t931 = @tactics.exists_tac(@term_syntax.parse_term("({} : ((Num, Num)) -> Bool)"))
  let t930 = @tactics.match_mp_tac(@fol.interpretation_termval())
  let t929 = @list.List([@tactics.all_tac, @simp.rewrite_tac(@list.List([iminmodel(), @fol.dom_def()]))])
  let t928 = @tactics.subgoal_then(@term_syntax.parse_term("IN(termval(iminmodel(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))), (v : (Num) -> Term), (i : (Num) -> Term)((x : Num))), Dom(iminmodel(IMAGE(interp, s))))"), fn(x925 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s926 = @tactics.mp_tac(x925)
    fn(x927 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s926(x927)
    }
  })
  let t924 = @simp.rewrite_tac(@list.List([@trivia.o_thm()]))
  let t948 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Num)")), t924), t928), t929), t930), t931), @tactics.conj_tac), t947), @tactics.all_tac])
  let t923 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && !(b : Bool) → (a → b || (c : Bool)) → c")))
  let t922 = @simp.rewrite_tac(@list.List([@equal.gsym(@fol.holds_formsubst())]))
  let t921 = @simp.rewrite_tac(@list.List([holds_itlist_imp()]))
  let t920 = @simp.asm_rewrite_tac(@list.List([]))
  let t919 = @simp.asm_rewrite_tac(@list.List([]))
  let t916 = @drule.match_mp(holds_horn())
  let t911 = @term_syntax.parse_type("A")
  let t912 = @list.List([(@term_syntax.parse_type("Term"), t911)])
  let t918 = @tactics.disch_then(fn(x917 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x915 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x908 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s909 = @tactics.mp_tac(x908)
        fn(x910 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s909(x910)
        }
      })((fn(x914 : @kernel.Thm) -> @kernel.Thm raise {
        ((x913 : @kernel.Thm) => @kernel.inst_type(t912, x913))(x914)
      })(x915))
    })(t916(x917))
  })
  let t907 = @list.List([@meson.asm_meson_tac(@list.List([definite_imp_horn()])), @tactics.all_tac])
  let t906 = @tactics.subgoal_then(@term_syntax.parse_term("horn((cl : (Form) -> Bool))"), fn(x903 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s904 = @tactics.mp_tac(x903)
    fn(x905 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s904(x905)
    }
  })
  let t902 = @simp.asm_rewrite_tac(@list.List([]))
  let t898 = @term_syntax.parse_term("(cl : (Form) -> Bool)")
  let t901 = @tactics.disch_then(fn(x900 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x895 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s896 = @tactics.mp_tac(x895)
      fn(x897 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s896(x897)
      }
    })(((x899 : @kernel.Thm) => @bool.spec(t898, x899))(x900))
  })
  let t894 = @simp.asm_rewrite_tac(@list.List([]))
  let t890 = @term_syntax.parse_term("o(termval(iminmodel(IMAGE(interp, (s : ((Form) -> Bool) -> Bool))), (v : (Num) -> Term)), (i : (Num) -> Term))")
  let t893 = @tactics.disch_then(fn(x892 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x887 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s888 = @tactics.mp_tac(x887)
      fn(x889 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s888(x889)
      }
    })(((x891 : @kernel.Thm) => @bool.spec(t890, x891))(x892))
  })
  let t884 = @drule.match_mp(iminmodel_model())
  let t886 = @tactics.first_assum(fn(x885 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x881 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s882 = @tactics.mp_tac(x881)
      fn(x883 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s882(x883)
      }
    })(t884(x885))
  })
  let t880 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t879 = @simp.rewrite_tac(@list.List([]))
  let t876 = @term_syntax.parse_term("(ns : List[Num])")
  let t877 = @term_syntax.parse_term("(i : (Num) -> Term)")
  let t878 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(cl : (Form) -> Bool)"), t877, t876]))
  let t875 = @simp.rewrite_tac(@list.List([all2_triv()]))
  let t874 = @tactics.match_mp_tac(ibackchain_induct())
  let t873 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t955 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), @tactics.gen_tac), t873), t874), t875), t878), t879), t880), @tactics.strip_tac), @tactics.disch_tac), t886), t893), t894), t901), t902), t906), t907), t918), t919), @tactics.strip_tac), t920), t921), t922), t923), @tactics.conj_tac), t948), t949), t950), t951), t952), t953), t954)
  ibackchain_sound_c.set(@tactics.prove(@term_syntax.parse_term("(∀ cl : (Form) -> Bool, IN(cl, (s : ((Form) -> Bool) -> Bool)) → definite(cl)) → (∀ v : (Num) -> Term, ∀ n : Num, ∀ p : Form, ibackchain(s, n, p) && (∀ x : Num, IN(v(x), terms(functions(IMAGE(interp, s))))) → holds(iminmodel(IMAGE(interp, s)), v, p))"), t955))
}

///|
let ibackchain_sound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IBACKCHAIN_SOUND")

///|
/// `IBACKCHAIN_SOUND`
pub fn ibackchain_sound() -> @kernel.Thm {
  ibackchain_sound_c.get()
}

///|
/// IBACKCHAIN_COMPLETE
fn step_32() -> Unit raise {
  let t1132 = @simp.rewrite_tac(@list.List([@fol.valuation(), @fol.dom_def()]))
  let t1131 = @fol.expand_tac("gbmod")
  let t1130 = @tactics.undisch_tac(@term_syntax.parse_term("valuation((gbmod : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)), (v : (Num) -> Term))"))
  let t1129 = @simp.asm_rewrite_tac(@list.List([]))
  let t1128 = @tactics.match_mp_tac(ibackchain_rules())
  let t1127 = @tactics.exists_tac(@term_syntax.parse_term("ITLIST(op_plus, (ns : List[Num]), 1)"))
  let t1124 = @term_syntax.parse_term("(ns : List[Num])")
  let t1126 = @tactics.disch_then((x1125 : @kernel.Thm) => @tactics.x_choose_tac(t1124, x1125))
  let t1122 = @simp.asm_rewrite_tac(@list.List([@lists.all2()]))
  let t1121 = @tactics.exists_tac(@term_syntax.parse_term("CONS((n : Num), (ns : List[Num]))"))
  let t1118 = @term_syntax.parse_term("(ns : List[Num])")
  let t1120 = @tactics.disch_then((x1119 : @kernel.Thm) => @tactics.x_choose_tac(t1118, x1119))
  let t1117 = @simp.asm_rewrite_tac(@list.List([]))
  let t1116 = @tactics.first_assum(fn(x1115 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1113 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1108 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1109 = @tactics.undisch_tac(x1108)
        fn(x1110 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1109(x1110)
        }
      })(((x1112 : @kernel.Term) => @lib.check(fn(x1111 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x1111)
      }, x1112))(x1113))
    })((fn(x1114 : @kernel.Thm) -> @kernel.Term raise {
      @kernel.concl(x1114)
    })(x1115))
  })
  let t1102 = @term_syntax.parse_term("(n : Num)")
  let t1107 = @tactics.disch_then(@tactics.conjuncts_then2((x1103 : @kernel.Thm) => @tactics.x_choose_tac(t1102, x1103), fn(x1104 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1105 = @tactics.assume_tac(x1104)
    fn(x1106 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1105(x1106)
    }
  }))
  let t1100 = @simp.rewrite_tac(@list.List([@lists.all2()]))
  let t1101 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(NIL : List[Num])")), t1100), @tactics.all_tac])
  let t1099 = @simp.rewrite_tac(@list.List([@lists.all(), @lists.map()]))
  let t1098 = @tactics.pop_assum_list(fn(x1097 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1096 = @term_syntax.parse_term("(l : List[Form])")
  let t1123 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("hypotheses((cl : (Form) -> Bool))"), t1096), t1098), @lists.list_induct_tac), t1099), t1101), t1107), t1116), t1117), t1120), t1121), t1122), @tactics.all_tac])
  let t1095 = @tactics.exists_tac(@term_syntax.parse_term("∃ ns : List[Num], ALL2(ibackchain((s : ((Form) -> Bool) -> Bool)), ns, MAP(formsubst((v : (Num) -> Term)), hypotheses((cl : (Form) -> Bool))))"))
  let t1094 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("∀ b : Bool, ((a : Bool) → b) && (b → (c : Bool)) → a → c")))
  let t1092 = @meson.asm_meson_tac(@list.List([]))
  let t1091 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t1093 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ALL(atom, hypotheses((cl : (Form) -> Bool)))")), t1091), t1092), @tactics.all_tac])
  let t1090 = @tactics.subgoal_then(@term_syntax.parse_term("ALL(holds((gbmod : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)), (v : (Num) -> Term)), hypotheses((cl : (Form) -> Bool))) == ALL((p : Form) => ∃ n : Num, ibackchain((s : ((Form) -> Bool) -> Bool), n, formsubst(v, p)), hypotheses(cl))"), fn(x1087 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1088 = @tactics.subst1_tac(x1087)
    fn(x1089 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1088(x1089)
    }
  })
  let t1085 = @meson.asm_meson_tac(@list.List([]))
  let t1084 = @simp.rewrite_tac(@list.List([]))
  let t1083 = @tactics.first_x_assum(fn(x1082 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1076 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1077 = @tactics.mp_tac(x1076)
      fn(x1078 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1077(x1078)
      }
    })(((x1081 : @kernel.Thm) => @lib.check(fn(x1080 : @kernel.Thm) -> Bool raise {
      @class.is_cond((fn(x1079 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x1079)
      })(x1080))
    }, x1081))(x1082))
  })
  let t1086 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t1083), @class.cond_cases_tac), t1084), t1085), @tactics.all_tac])
  let t1075 = @tactics.subgoal_then(@term_syntax.parse_term("holds((gbmod : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)), (v : (Num) -> Term), conclusion((cl : (Form) -> Bool))) == (∃ n : Num, ibackchain((s : ((Form) -> Bool) -> Bool), n, formsubst(v, conclusion(cl))))"), fn(x1072 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1073 = @tactics.subst1_tac(x1072)
    fn(x1074 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1073(x1074)
    }
  })
  let t1070 = @simp.rewrite_tac(@list.List([@fol.fun_def()]))
  let t1069 = @tactics.match_mp_tac(@fol.termsubst_termval())
  let t1067 = @term_syntax.parse_term("(v : (Num) -> Term)")
  let t1068 = @tactics.spec_tac(@term_syntax.parse_term("(v : (Num) -> Term)"), t1067)
  let t1065 = @term_syntax.parse_term("(t : Term)")
  let t1066 = @tactics.spec_tac(@term_syntax.parse_term("(t : Term)"), t1065)
  let t1064 = @tactics.conv_tac(@equal.sym_conv)
  let t1063 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Term)"))
  let t1062 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem())]))
  let t1061 = @tactics.match_mp_tac(@lists.map_eq())
  let t1060 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1059 = @simp.rewrite_tac(@list.List([@fol.pred_def(), @fol.formsubst()]))
  let t1058 = @simp.rewrite_tac(@list.List([@fol.holds_v1()]))
  let t1057 = @fol.expand_tac("gbmod")
  let t1071 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@resolution.atom_v1(), @theorems.left_imp_exists_thm()])), t1057), t1058), t1059), t1060), @tactics.disch_tac), @tactics.ap_term_tac), @tactics.abs_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t1061), t1062), t1063), @tactics.disch_tac), t1064), t1066), t1068), t1069), t1070), @tactics.all_tac])
  let t1056 = @tactics.subgoal_then(@term_syntax.parse_term("∀ p : Form, atom(p) → holds((gbmod : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)), (v : (Num) -> Term), p) == (∃ n : Num, ibackchain((s : ((Form) -> Bool) -> Bool), n, formsubst(v, p)))"), fn(x1053 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1054 = @tactics.assume_tac(x1053)
    fn(x1055 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1054(x1055)
    }
  })
  let t1052 = @simp.abbrev_tac(@term_syntax.parse_term("(gbmod : ((Term) -> Bool, (Num, List[Term]) -> Term, (Num, List[Term]) -> Bool)) == (terms(functions(IMAGE(interp, (s : ((Form) -> Bool) -> Bool)))), Fn, (p : Num) => (tms : List[Term]) => ∃ n : Num, ibackchain(s, n, Atom(p, tms)))"))
  let t1051 = @tactics.conv_tac(@equal.once_depth_conv(@class.eta_conv))
  let t1050 = @simp.rewrite_tac(@list.List([@lists.all_mem()]))
  let t1049 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((a : Bool) && !(b : Bool)) == (a → b)"))]))
  let t1048 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool)) == (!a → b)")), @class.not_exists_thm()]))
  let t1047 = @simp.rewrite_tac(@list.List([holds_itlist_imp()]))
  let t1046 = @simp.asm_rewrite_tac(@list.List([]))
  let t1045 = @simp.asm_rewrite_tac(@list.List([]))
  let t1042 = @drule.match_mp(holds_horn())
  let t1037 = @term_syntax.parse_type("A")
  let t1038 = @list.List([(@term_syntax.parse_type("Term"), t1037)])
  let t1044 = @tactics.disch_then(fn(x1043 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1041 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1034 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1035 = @tactics.mp_tac(x1034)
        fn(x1036 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1035(x1036)
        }
      })((fn(x1040 : @kernel.Thm) -> @kernel.Thm raise {
        ((x1039 : @kernel.Thm) => @kernel.inst_type(t1038, x1039))(x1040)
      })(x1041))
    })(t1042(x1043))
  })
  let t1033 = @list.List([@meson.asm_meson_tac(@list.List([definite_imp_horn()])), @tactics.all_tac])
  let t1032 = @tactics.subgoal_then(@term_syntax.parse_term("horn((cl : (Form) -> Bool))"), fn(x1029 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1030 = @tactics.mp_tac(x1029)
    fn(x1031 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1030(x1031)
    }
  })
  let t1027 = @tactics.conjuncts_then2(fn(x1021 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1022 = @tactics.subst_all_tac(x1021)
    fn(x1023 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1022(x1023)
    }
  }, fn(x1024 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1025 = @tactics.assume_tac(x1024)
    fn(x1026 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1025(x1026)
    }
  })
  let t1028 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(cl : (Form) -> Bool)"))(t1027))
  let t1020 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1014 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1015 = @tactics.mp_tac(x1014)
    fn(x1016 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1015(x1016)
    }
  }, fn(x1017 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1018 = @tactics.assume_tac(x1017)
    fn(x1019 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1018(x1019)
    }
  }))
  let t1013 = @simp.rewrite_tac(@list.List([@sets.in_image()]))
  let t1012 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1010 = @simp.rewrite_tac(@list.List([@fol.fun_def()]))
  let t1009 = @tactics.match_mp_tac(@fol.termval_triv())
  let t1007 = @term_syntax.parse_term("(t : Term)")
  let t1008 = @tactics.spec_tac(@term_syntax.parse_term("(t : Term)"), t1007)
  let t1006 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Term)"))
  let t1004 = @equal.gsym(@lists.ex_mem())
  let t1005 = @simp.rewrite_tac(@list.List([@equal.gsym(@lists.all_mem()), t1004]))
  let t1003 = @tactics.match_mp_tac(@lists.map_eq_degen())
  let t1011 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.abs_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), t1003), t1005), t1006), @tactics.disch_tac), t1008), t1009), t1010), @tactics.all_tac])
  let t1002 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(b : Bool) == (c : Bool) && (a : Bool) → (a → b) → c")))
  let t1001 = @simp.rewrite_tac(@list.List([@fol.holds(), @fol.pred_def()]))
  let t1000 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(tms : List[Term])"))(fn(x997 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s998 = @tactics.subst_all_tac(x997)
    fn(x999 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s998(x999)
    }
  }))
  let t993 = @simp.gen_rewrite_rule(fn(x992 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x992
  }, @list.List([@resolution.atom_v1()]))
  let t994 = @tactics.x_choose_then(@term_syntax.parse_term("(P : Num)"))(fn(x989 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s990 = @tactics.mp_tac(x989)
    fn(x991 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s990(x991)
    }
  })
  let t996 = @tactics.first_assum(fn(x995 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t994(t993(x995))
  })
  let t988 = @simp.rewrite_tac(@list.List([@fol.dom_def(), @fol.fun_def()]))
  let t984 = @term_syntax.parse_term("(terms(functions(IMAGE(interp, (s : ((Form) -> Bool) -> Bool)))), Fn, (p : Num) => (tms : List[Term]) => ∃ n : Num, ibackchain(s, n, Atom(p, tms)))")
  let t987 = @tactics.disch_then(fn(x986 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x981 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s982 = @tactics.mp_tac(x981)
      fn(x983 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s982(x983)
      }
    })(((x985 : @kernel.Thm) => @bool.spec(t984, x985))(x986))
  })
  let t980 = @list.List([@simp.rewrite_tac(@list.List([@logic_canon.terms_rules(), @sets.in_()])), @tactics.all_tac])
  let t976 = @term_syntax.parse_term("V")
  let t979 = @tactics.disch_then(fn(x978 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x973 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s974 = @tactics.mp_tac(x973)
      fn(x975 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s974(x975)
      }
    })(((x977 : @kernel.Thm) => @bool.spec(t976, x977))(x978))
  })
  let t972 = @tactics.first_assum(fn(x970 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x970
    @simp.rewrite_tac(@list.List([@drule.match_mp(iminmodel_minimal())(th)]))
  })
  let t969 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x963 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s964 = @tactics.assume_tac(x963)
    fn(x965 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s964(x965)
    }
  }, fn(x966 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s967 = @tactics.mp_tac(x966)
    fn(x968 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s967(x968)
    }
  }))
  let t962 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x956 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s957 = @tactics.assume_tac(x956)
    fn(x958 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s957(x958)
    }
  }, fn(x959 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s960 = @tactics.mp_tac(x959)
    fn(x961 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s960(x961)
    }
  }))
  let t1133 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t962), t969), t972), t979), @tactics.ants_tac), t980), t987), t988), t996), t1000), t1001), t1002), @tactics.conj_tac), t1011), t1012), t1013), t1020), t1028), t1032), t1033), t1044), t1045), @tactics.strip_tac), t1046), t1047), t1048), t1049), t1050), t1051), t1052), t1056), t1071), t1075), t1086), t1090), t1093), t1094), t1095), @tactics.conj_tac), t1123), t1126), t1127), t1128), t1129), t1130), t1131), t1132)
  ibackchain_complete_c.set(@tactics.prove(@term_syntax.parse_term("(∀ cl : (Form) -> Bool, IN(cl, (s : ((Form) -> Bool) -> Bool)) → definite(cl)) && atom((p : Form)) && (∀ v : (Num) -> Term, (∀ x : Num, IN(v(x), terms(functions(IMAGE(interp, s))))) → holds(iminmodel(IMAGE(interp, s)), v, p)) → (∃ n : Num, ibackchain(s, n, p))"), t1133))
}

///|
let ibackchain_complete_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IBACKCHAIN_COMPLETE")

///|
/// `IBACKCHAIN_COMPLETE`
pub fn ibackchain_complete() -> @kernel.Thm {
  ibackchain_complete_c.get()
}

///|
/// IBACKCHAIN_MINIMAL
fn step_33() -> Unit raise {
  let t1134 = @meson.meson_tac(@list.List([ibackchain_sound(), ibackchain_complete()]))
  ibackchain_minimal_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : ((Form) -> Bool) -> Bool, ∀ p : Form, (∀ cl : (Form) -> Bool, IN(cl, s) → definite(cl)) && atom(p) → (∀ v : (Num) -> Term, (∀ x : Num, IN(v(x), terms(functions(IMAGE(interp, s))))) → holds(iminmodel(IMAGE(interp, s)), v, p)) == (∃ n : Num, ibackchain(s, n, p))"), t1134))
}

///|
let ibackchain_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IBACKCHAIN_MINIMAL")

///|
/// `IBACKCHAIN_MINIMAL`
pub fn ibackchain_minimal() -> @kernel.Thm {
  ibackchain_minimal_c.get()
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
}
