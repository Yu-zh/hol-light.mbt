// Translated from upstream Examples/solovay.ml; edit this file directly.

///|
/// VECTOR_SUB_ELIM_THM
fn step_1() -> Unit raise {
  vector_sub_elim_thm_c.set(@tactics.prove(@term_syntax.parse_term("-(x : Cart[Real, _]) == op_pct(-real_of_num(1), x) && x - (y : Cart[Real, _]) == x + op_pct(-real_of_num(1), y)"), @vectors.vector_arith_tac))
}

///|
let vector_sub_elim_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_SUB_ELIM_THM")

///|
/// `VECTOR_SUB_ELIM_THM`
pub fn vector_sub_elim_thm() -> @kernel.Thm {
  vector_sub_elim_thm_c.get()
}

///|
/// NORM_ELIM_THM
fn step_2() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([@vectors.dot_pos_le(), @real.sqrt_pow2(), @real.sqrt_unique(), @realarith.real_pow_2(), @real.real_pow2_abs(), @real.real_abs_pos()]))
  let t2 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@vectors.vector_norm()]))), t1)
  norm_elim_thm_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Real) -> Bool, ∀ t : Cart[Real, N], P(norm(t)) == (∀ x : Real, real_of_num(0) <= x && pow(x, 2) == dot(t, t) → P(x))"), t2))
}

///|
let norm_elim_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_ELIM_THM")

///|
/// `NORM_ELIM_THM`
pub fn norm_elim_thm() -> @kernel.Thm {
  norm_elim_thm_c.get()
}

///|
/// NORM_ELIM_CONV
fn step_3() -> Unit raise {
  let dest_norm : (@kernel.Term) -> @kernel.Term raise = fn(x3 : @kernel.Term) -> @kernel.Term raise {
    let tm = x3
    let (nm, v) = @kernel.dest_comb(tm)
    if (@kernel.dest_const(nm).0 != "vector_norm") {
      raise Failure("dest_norm")
    } else {
      v
    }
  }
  let is_norm : (@kernel.Term) -> Bool raise = (x4 : @kernel.Term) => @lib.can(dest_norm, x4)
  norm_elim_conv_c.set(fn(x5 : @kernel.Term) -> @kernel.Thm raise {
    let tm_1 = x5
    let t_1 = @basics.find_term(fn(x6 : @kernel.Term) -> Bool raise {
      let t = x6
      (is_norm(t) && @basics.free_in(t, tm_1))
    }, tm_1)
    let v_1 = dest_norm(t_1)
    let w = @basics.genvar(@kernel.type_of(t_1))
    let th1 = @bool.ispecl(@list.List([@kernel.mk_abs(w, @basics.subst(@list.List([(w, t_1)]), tm_1)), v_1]), norm_elim_thm())
    let t7 = @equal.binder_conv(@equal.rand_conv(@equal.beta_conv))
    @equal.conv_rule(@equal.comb2_conv(@equal.rand_conv(@equal.beta_conv), t7), th1)
  })
}

///|
let norm_elim_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("NORM_ELIM_CONV")

///|
/// `NORM_ELIM_CONV`
pub fn norm_elim_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (norm_elim_conv_c.get())(x)
}

///|
/// NORM_ELIM_TAC
fn step_4() -> Unit raise {
  norm_elim_tac_c.set(@tactics.then_tac(@tactics.conv_tac(norm_elim_conv), @tactics.gen_tac))
}

///|
let norm_elim_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("NORM_ELIM_TAC")

///|
/// `NORM_ELIM_TAC`
pub fn norm_elim_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (norm_elim_tac_c.get())(x)
}

///|
/// SOLOVAY_TAC
fn step_5() -> Unit raise {
  let t12 = @simp.rewrite_tac(@list.List([@vectors.dot_ladd(), @vectors.dot_radd(), @vectors.dot_lmul(), @vectors.dot_rmul()]))
  let t11 = @tactics.repeat_tac(norm_elim_tac)
  let t10 = @simp.rewrite_tac(@list.List([@vectors.norm_eq(), @vectors.norm_le(), @vectors.norm_lt(), @realax.real_gt(), @realax.real_ge()]))
  let t9 = @simp.rewrite_tac(@list.List([vector_sub_elim_thm()]))
  let t8 = @simp.rewrite_tac(@list.List([@vectors.vector_eq()]))
  solovay_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.orthogonal(), @equal.gsym(@vectors.dot_eq_0())])), t8), t9), t10), t11), t12))
}

///|
let solovay_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("SOLOVAY_TAC")

///|
/// `SOLOVAY_TAC`
pub fn solovay_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (solovay_tac_c.get())(x)
}

///|
/// component
fn step_6() -> Unit raise {
  component_c.set(@pair.new_definition(@term_syntax.parse_term("(component : (Cart[Real, N], Cart[Real, N]) -> Real)((b : Cart[Real, N]), (x : Cart[Real, N])) == dot(b, x) / dot(b, b)")))
}

///|
let component_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("component")

///|
/// `component`
pub fn component() -> @kernel.Thm {
  component_c.get()
}

///|
/// COMPONENT_ORTHOGONAL
fn step_7() -> Unit raise {
  let t17 = @simp.asm_simp_tac(@list.List([@analysis.real_sub_refl(), @real.real_div_rmul(), @vectors.dot_eq_0()]))
  let t16 = @simp.rewrite_tac(@list.List([@vectors.dot_rsub(), @vectors.dot_rmul()]))
  let t15 = @simp.asm_simp_tac(@list.List([@vectors.orthogonal(), component()]))
  let t14 = @list.List([@simp.asm_rewrite_tac(@list.List([@vectors.orthogonal(), @vectors.dot_lzero()])), @tactics.all_tac])
  let t13 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Cart[Real, N]) == vec(0)"))
  let t18 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t13), t14), t15), t16), t17)
  component_orthogonal_c.set(@tactics.prove(@term_syntax.parse_term("∀ b : Cart[Real, N], ∀ x : Cart[Real, N], orthogonal(b, x - op_pct(component(b, x), b))"), t18))
}

///|
let component_orthogonal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPONENT_ORTHOGONAL")

///|
/// `COMPONENT_ORTHOGONAL`
pub fn component_orthogonal() -> @kernel.Thm {
  component_orthogonal_c.get()
}

///|
/// ORTHOGONAL_SUM_LEMMA
fn step_8() -> Unit raise {
  let t20 = @simp.asm_simp_tac(@list.List([@vectors.orthogonal_clauses(), @nums.suc_inj()]))
  let t19 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @nums.not_suc(), @lists.itlist2(), @lists.length(), @lists.all()]))
  let t21 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@lists.list_induct_tac, @lists.list_induct_tac), t19), t20)
  orthogonal_sum_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ cs : List[Real], ∀ vs : List[Cart[Real, _]], ALL(orthogonal((x : Cart[Real, _])), vs) && orthogonal(x, (z : Cart[Real, _])) && LENGTH(cs) == LENGTH(vs) → orthogonal(x, ITLIST2((a : Real) => (v : Cart[Real, _]) => (s : Cart[Real, _]) => op_pct(a, v) + s, cs, vs, z))"), t21))
}

///|
let orthogonal_sum_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_SUM_LEMMA")

///|
/// `ORTHOGONAL_SUM_LEMMA`
pub fn orthogonal_sum_lemma() -> @kernel.Thm {
  orthogonal_sum_lemma_c.get()
}

///|
/// GRAM_SCHMIDT_LEMMA
fn step_9() -> Unit raise {
  let t84 = @tactics.repeat_tac(@tactics.disch_tac)
  let t83 = @simp.asm_simp_tac(@list.List([]))
  let t82 = @simp.rewrite_tac(@list.List([@lists.not_cons_nil(), @nums.not_suc(), @lists.itlist2(), @lists.length(), @lists.all(), @nums.suc_inj(), @lists.map2()]))
  let t81 = @tactics.pop_assum_list(fn(x80 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t77 = @term_syntax.parse_term("(as_ : List[Real])")
  let t78 = @term_syntax.parse_term("(cs : List[Real])")
  let t79 = @tactics.map_every(fn(x75 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let v = x75
    @tactics.spec_tac(v, v)
  }, @list.List([@term_syntax.parse_term("(vs : List[Cart[Real, N]])"), t78, t77]))
  let t74 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t73 = @tactics.undisch_tac(@term_syntax.parse_term("LENGTH((vs : List[Cart[Real, N]])) == LENGTH((as_ : List[Real]))"))
  let t72 = @tactics.undisch_tac(@term_syntax.parse_term("LENGTH((vs : List[Cart[Real, N]])) == LENGTH((cs : List[Real]))"))
  let t71 = @tactics.map_every(@analysis.expand_tac, @list.List(["v", "w", "x"]))
  let t70 = @simp.rewrite_tac(@list.List([@lists.itlist2(), @vectors.vector_arith(@term_syntax.parse_term("((a : Cart[Real, N]) == (b : Cart[Real, N]) + (c : Cart[Real, N])) == (c == a - b)"))]))
  let t67 = @meson.asm_meson_tac(@list.List([@lists.length_map2()]))
  let t68 = @tactics.first_assum(fn(x64 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s65 = @tactics.accept_tac(x64)
    fn(x66 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s65(x66)
    }
  })
  let t63 = @meson.asm_meson_tac(@list.List([@vectors.orthogonal_sym()]))
  let t62 = @simp.asm_rewrite_tac(@list.List([]))
  let t61 = @tactics.match_mp_tac(orthogonal_sum_lemma())
  let t69 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@analysis.expand_tac("v"), t61), t62), t63), t68, t67, @tactics.all_tac])
  let t60 = @tactics.repeat_tac(@tactics.conj_tac)
  let t58 = @simp.simp_tac(@list.List([@vectors.orthogonal_clauses()]))
  let t57 = @analysis.expand_tac("x")
  let t56 = @simp.rewrite_tac(@list.List([]))
  let t55 = @tactics.match_mp_tac(@lists.mono_all())
  let t54 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @lists.and_all()]))
  let t53 = @tactics.undisch_tac(@term_syntax.parse_term("ALL(orthogonal((u : Cart[Real, N])), (vs : List[Cart[Real, N]]))"))
  let t59 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("ALL(orthogonal((z : Cart[Real, N])), (vs : List[Cart[Real, N]]))")), t53), t54), t55), t56), t57), t58), @tactics.all_tac])
  let t52 = @tactics.subgoal_then(@term_syntax.parse_term("ALL(orthogonal((x : Cart[Real, N])), (vs : List[Cart[Real, N]]))"), fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s50 = @tactics.assume_tac(x49)
    fn(x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s50(x51)
    }
  })
  let t48 = @simp.rewrite_tac(@list.List([@lists.cons_11(), @theorems.right_exists_and_thm(), @equal.gsym(@theorems.conj_assoc()), @theorems.unwind_thm1()]))
  let t46 = @term_syntax.parse_term("CONS((k : Real), MAP2((a : Real) => (c : Real) => a - k * c, (as_ : List[Real]), (cs : List[Real])))")
  let t47 = @tactics.map_every(@rqe_tactics_ext.exists_tac, @list.List([@term_syntax.parse_term("(x : Cart[Real, N])"), t46]))
  let t45 = @simp.abbrev_tac(@term_syntax.parse_term("(x : Cart[Real, N]) == (u : Cart[Real, N]) - op_pct((k : Real), (z : Cart[Real, N]))"))
  let t44 = @simp.abbrev_tac(@term_syntax.parse_term("(k : Real) == component((z : Cart[Real, N]), (u : Cart[Real, N]))"))
  let t42 = @term_syntax.parse_term("(u : Cart[Real, N])")
  let t43 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(z : Cart[Real, N])"), t42]), component_orthogonal()))
  let t40 = @tactics.x_choose_then(@term_syntax.parse_term("(as_ : List[Real])"))(fn(x39 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x39))
  })
  let t41 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Cart[Real, N])"))(t40))
  let t37 = @tactics.x_choose_then(@term_syntax.parse_term("(cs : List[Real])"))(fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x36))
  })
  let t38 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Cart[Real, N])"))(t37))
  let t35 = @tactics.first_x_assum(fn(x32 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x32
    let t34 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(v : Cart[Real, N])"), th))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(w : Cart[Real, N])"), th)), t34)
  })
  let t31 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, N])"))
  let t30 = @simp.rewrite_tac(@list.List([@lists.length_eq_cons()]))
  let t28 = @term_syntax.parse_term("(vs : List[Cart[Real, N]])")
  let t29 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(v : Cart[Real, N])"), t28]))
  let t26 = @simp.rewrite_tac(@list.List([@lists.itlist2()]))
  let t25 = @rqe_tactics_ext.exists_tac(@term_syntax.parse_term("(NIL : List[Real])"))
  let t24 = @rqe_tactics_ext.exists_tac(@term_syntax.parse_term("(w : Cart[Real, N])"))
  let t27 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, N])")), t24), t25), t26), @tactics.all_tac])
  let t23 = @simp.simp_tac(@list.List([@lists.all(), @lists.length(), @lists.itlist2(), @lists.length_eq_nil()]))
  let t22 = @tactics.match_mp_tac(@ind_types.list_induct())
  let t85 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()])), t22), t23), @tactics.conj_tac), t27), t29), t30), @tactics.disch_tac), t31), t35), t38), t41), t43), t44), t45), @tactics.disch_tac), t47), t48), t52), t59), t60), t69), t70), t71), t72), t73), t74), t79), t81), @lists.list_induct_tac), @lists.list_induct_tac), @lists.list_induct_tac), t82), t83), t84), @vectors.vector_arith_tac)
  gram_schmidt_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, N], ∀ vs : List[Cart[Real, N]], ∃ u : Cart[Real, N], ∃ as_ : List[Real], ALL(orthogonal(u), vs) && LENGTH(as_) == LENGTH(vs) && w == ITLIST2((a : Real) => (v : Cart[Real, N]) => (s : Cart[Real, N]) => op_pct(a, v) + s, as_, vs, u)"), t85))
}

///|
let gram_schmidt_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GRAM_SCHMIDT_LEMMA")

///|
/// `GRAM_SCHMIDT_LEMMA`
pub fn gram_schmidt_lemma() -> @kernel.Thm {
  gram_schmidt_lemma_c.get()
}

///|
/// SOLOVAY_LEMMA
fn step_10() -> Unit raise {
  let t90 = @meson.asm_meson_tac(@list.List([]))
  let t88 = @term_syntax.parse_term("(vs : List[Cart[Real, N]])")
  let t89 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(w : Cart[Real, N])"), t88]), gram_schmidt_lemma()))
  let t87 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, N])"))
  let t86 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t91 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t86), @tactics.disch_tac), t87), t89), t90)
  solovay_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Cart[Real, N], List[Cart[Real, N]]) -> Bool, ∀ vs : List[Cart[Real, N]], (∀ w : Cart[Real, N], P(w, vs)) == (∀ as_ : List[Real], ∀ u : Cart[Real, N], ALL(orthogonal(u), vs) && LENGTH(as_) == LENGTH(vs) → P(ITLIST2((a : Real) => (v : Cart[Real, N]) => (s : Cart[Real, N]) => op_pct(a, v) + s, as_, vs, u), vs))"), t91))
}

///|
let solovay_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLOVAY_LEMMA")

///|
/// `SOLOVAY_LEMMA`
pub fn solovay_lemma() -> @kernel.Thm {
  solovay_lemma_c.get()
}

///|
/// FORALL_LENGTH_CLAUSES
fn step_11() -> Unit raise {
  let t92 = @meson.meson_tac(@list.List([@lists.length(), @lists.length_eq_nil(), @nums.not_suc(), @lists.length_eq_cons()]))
  forall_length_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ l : List[_], LENGTH(l) == 0 → (P : (List[_]) -> Bool)(l)) == P(NIL) && (∀ l : List[_], LENGTH(l) == SUC((n : Num)) → P(l)) == (∀ h : _, ∀ t : List[_], LENGTH(t) == n → P(CONS(h, t)))"), t92))
}

///|
let forall_length_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_LENGTH_CLAUSES")

///|
/// `FORALL_LENGTH_CLAUSES`
pub fn forall_length_clauses() -> @kernel.Thm {
  forall_length_clauses_c.get()
}

///|
/// ORTHOGONAL_SIMP_CLAUSES
fn step_12() -> Unit raise {
  let t101 = @simp.simp_tac(@list.List([@analysis.real_mul_lzero(), @analysis.real_mul_rzero(), @realax.real_add_lid(), @calc_int.real_add_rid()]))
  let t100 = @simp.gen_rewrite_tac(fn(x99 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x93 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s94 = @equal.land_conv(x93)
      fn(x95 : @kernel.Term) -> @kernel.Thm raise {
        s94(x95)
      }
    })((fn(x96 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s97 = @equal.land_conv(x96)
      fn(x98 : @kernel.Term) -> @kernel.Thm raise {
        s97(x98)
      }
    })(x99))
  }, @list.List([@vectors.dot_sym()]))
  let t102 = @tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@vectors.orthogonal(), @vectors.dot_ladd(), @vectors.dot_radd(), @vectors.dot_lmul(), @vectors.dot_rmul()])), t100), t101)
  orthogonal_simp_clauses_c.set(@tactics.prove(@term_syntax.parse_term("orthogonal((u : Cart[Real, _]), (x : Cart[Real, _])) → dot(u, x) == real_of_num(0) && dot(x, u) == real_of_num(0) && dot(u, op_pct((a : Real), x)) == real_of_num(0) && dot(op_pct(a, x), u) == real_of_num(0) && dot(u, op_pct(a, x) + (y : Cart[Real, _])) == dot(u, y) && dot(op_pct(a, x) + y, u) == dot(y, u) && dot(u, y + op_pct(a, x)) == dot(u, y) && dot(y + op_pct(a, x), u) == dot(y, u)"), t102))
}

///|
let orthogonal_simp_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_SIMP_CLAUSES")

///|
/// `ORTHOGONAL_SIMP_CLAUSES`
pub fn orthogonal_simp_clauses() -> @kernel.Thm {
  orthogonal_simp_clauses_c.get()
}

///|
/// ITLIST2_0_LEMMA
fn step_13() -> Unit raise {
  let t104 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_assoc()]))
  let t103 = @simp.rewrite_tac(@list.List([@lists.itlist2_def(), @vectors.vector_add_lid()]))
  let t105 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @lists.list_induct_tac), t103), t104)
  itlist2_0_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, _], ∀ as_ : List[Real], ∀ vs : List[Cart[Real, _]], ITLIST2((a : Real) => (v : Cart[Real, _]) => (s : Cart[Real, _]) => op_pct(a, v) + s, as_, vs, u) == ITLIST2((a : Real) => (v : Cart[Real, _]) => (s : Cart[Real, _]) => op_pct(a, v) + s, as_, vs, vec(0)) + u"), t105))
}

///|
let itlist2_0_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITLIST2_0_LEMMA")

///|
/// `ITLIST2_0_LEMMA`
pub fn itlist2_0_lemma() -> @kernel.Thm {
  itlist2_0_lemma_c.get()
}

///|
/// SOLOVAY_PROFORMA_EQ
fn step_14() -> Unit raise {
  let t170 = @simp.simp_tac(@list.List([@vectors.orthogonal()]))
  let t169 = @simp.asm_rewrite_tac(@list.List([]))
  let t168 = @rqe_tactics_ext.exists_tac(@term_syntax.parse_term("orthogonal((u : Cart[Real, N]))"))
  let t167 = @tactics.match_mp_tac(@lists.all_imp())
  let t166 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (b : Real) == a) == (b == real_of_num(0))"))]))
  let t171 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@lists.map_eq()), t166), t167), t168), t169), t170)
  let t165 = @simp.rewrite_tac(@list.List([@analysis.real_mul_rzero()]))
  let t164 = @simp.simp_tac(@list.List([@vectors.orthogonal()]))
  let t163 = @simp.rewrite_tac(@list.List([@calc_int.real_add_rid(), @vectors.dot_rmul()]))
  let t162 = @simp.asm_simp_tac(@list.List([@vectors.dot_radd()]))
  let t161 = @simp.rewrite_tac(@list.List([@lists.all(), @lists.itlist2(), @vectors.dot_rzero(), @nums.suc_inj()]))
  let t160 = @simp.rewrite_tac(@list.List([@lists.length(), @nums.not_suc()]))
  let t159 = @tactics.repeat_tac(@lists.list_induct_tac)
  let t157 = @term_syntax.parse_term("(as_ : List[Real])")
  let t158 = @tactics.spec_tac(@term_syntax.parse_term("(as_ : List[Real])"), t157)
  let t155 = @term_syntax.parse_term("(vs : List[Cart[Real, N]])")
  let t156 = @tactics.spec_tac(@term_syntax.parse_term("(vs : List[Cart[Real, N]])"), t155)
  let t172 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum_list(fn(x154 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s151 = @tactics.mp_tac(x150)
      fn(x152 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s151(x152)
      }
    })(((x153 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x153))(x154))
  }), t156), t158), t159), t160), t161), t162), t163), t164), t165), t171])
  let t149 = @simp.rewrite_tac(@list.List([@vectors.dot_ladd()]))
  let t148 = @simp.gen_rewrite_tac(fn(x147 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x143 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x137 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s138 = @equal.rand_conv(x137)
        fn(x139 : @kernel.Term) -> @kernel.Thm raise {
          s138(x139)
        }
      })((fn(x140 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s141 = @equal.binop_conv(x140)
        fn(x142 : @kernel.Term) -> @kernel.Thm raise {
          s141(x142)
        }
      })(x143))
    })((fn(x144 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s145 = @equal.land_conv(x144)
      fn(x146 : @kernel.Term) -> @kernel.Thm raise {
        s145(x146)
      }
    })(x147))
  }, @list.List([@equal.gsym(@class.eta_ax())]))
  let t136 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + (real_of_num(2) * (b : Real) + (c : Real)) == a + c) == (b == real_of_num(0))"))]))
  let t135 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("dot((a : Cart[Real, _]) + (u : Cart[Real, _]), a + u) == dot(a, a) + (real_of_num(2) * dot(u, a) + dot(u, u))"))]))
  let t134 = @simp.rewrite_tac(@list.List([@vectors.vector_add_rid()]))
  let t133 = @simp.once_rewrite_tac(@list.List([itlist2_0_lemma()]))
  let t132 = @simp.rewrite_tac(@list.List([@lists.cons_11()]))
  let t131 = @simp.rewrite_tac(@list.List([@lists.map()]))
  let t130 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) == (c : Bool)) → (a → b) == (a → c)")))
  let t129 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t128 = @tactics.x_gen_tac(@term_syntax.parse_term("(as_ : List[Real])"))
  let t127 = @simp.gen_rewrite_tac(fn(x126 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x126
  }, @list.List([@class.fun_eq_thm()]))
  let t125 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm()]))
  let t124 = @simp.rewrite_tac(@list.List([]))
  let t123 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Cart[Real, N])"))
  let t122 = @simp.gen_rewrite_tac(fn(x121 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x121
  }, @list.List([@class.fun_eq_thm()]))
  let t120 = @simp.gen_rewrite_tac(fn(x117 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s118 = @equal.land_conv(x117)
    fn(x119 : @kernel.Term) -> @kernel.Thm raise {
      s118(x119)
    }
  }, @list.List([@theorems.swap_forall_thm()]))
  let t116 = @tactics.disch_then(fn(x107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x107
    @simp.gen_rewrite_tac(fn(x115 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x109 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s110 = @equal.land_conv(x109)
        fn(x111 : @kernel.Term) -> @kernel.Thm raise {
          s110(x111)
        }
      })((fn(x112 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s113 = @equal.once_depth_conv(x112)
        fn(x114 : @kernel.Term) -> @kernel.Thm raise {
          s113(x114)
        }
      })(x115))
    }, @list.List([th]))
  })
  let t106 = @simp.rewrite_tac(@list.List([]))
  let t173 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(w : Cart[Real, N]) => (vs : List[Cart[Real, N]]) => (P : (List[Real], List[Cart[Real, N]]) -> Bool)(MAP(dot(w), CONS(w, vs)), vs)"), solovay_lemma())), t106), t116), t120), @tactics.ap_term_tac), t122), t123), t124), t125), @tactics.ap_term_tac), t127), t128), t129), t130), @tactics.strip_tac), t131), @tactics.binop_tac), t132), t133), t134), t135), t136), t148), t149), @tactics.conj_tac), t172)
  solovay_proforma_eq_c.set(@tactics.prove(@term_syntax.parse_term("(∀ w : Cart[Real, N], (P : (List[Real], List[Cart[Real, N]]) -> Bool)(MAP(dot(w), CONS(w, (vs : List[Cart[Real, N]]))), vs)) == (∀ u : Cart[Real, N], ALL(orthogonal(u), vs) → (∀ as_ : List[Real], LENGTH(as_) == LENGTH(vs) → P(CONS(dot(ITLIST2((a : Real) => (v : Cart[Real, N]) => (s : Cart[Real, N]) => op_pct(a, v) + s, as_, vs, vec(0)), ITLIST2((a : Real) => (v : Cart[Real, N]) => (s : Cart[Real, N]) => op_pct(a, v) + s, as_, vs, vec(0))) + dot(u, u), MAP(dot(ITLIST2((a : Real) => (v : Cart[Real, N]) => (s : Cart[Real, N]) => op_pct(a, v) + s, as_, vs, vec(0))), vs)), vs)))"), t173))
}

///|
let solovay_proforma_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLOVAY_PROFORMA_EQ")

///|
/// `SOLOVAY_PROFORMA_EQ`
pub fn solovay_proforma_eq() -> @kernel.Thm {
  solovay_proforma_eq_c.get()
}

///|
/// SOLOVAY_PROFORMA
fn step_15() -> Unit raise {
  let t181 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_pos_le()]))
  let t180 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t179 = @tactics.repeat_tac(@tactics.strip_tac)
  let t178 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()]))
  let t177 = @simp.gen_rewrite_tac(fn(x174 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s175 = @equal.rand_conv(x174)
    fn(x176 : @kernel.Term) -> @kernel.Thm raise {
      s175(x176)
    }
  }, @list.List([solovay_proforma_eq()]))
  let t182 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t177), t178), t179), t180), t181)
  solovay_proforma_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (List[Real], List[Cart[Real, N]]) -> Bool, ∀ vs : List[Cart[Real, N]], (∀ c : Real, real_of_num(0) <= c → (∀ as_ : List[Real], LENGTH(as_) == LENGTH(vs) → P(CONS(dot(ITLIST2((a : Real) => (v : Cart[Real, N]) => (s : Cart[Real, N]) => op_pct(a, v) + s, as_, vs, vec(0)), ITLIST2((a : Real) => (v : Cart[Real, N]) => (s : Cart[Real, N]) => op_pct(a, v) + s, as_, vs, vec(0))) + c, MAP(dot(ITLIST2((a : Real) => (v : Cart[Real, N]) => (s : Cart[Real, N]) => op_pct(a, v) + s, as_, vs, vec(0))), vs)), vs))) → (∀ w : Cart[Real, N], P(MAP(dot(w), CONS(w, vs)), vs))"), t182))
}

///|
let solovay_proforma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SOLOVAY_PROFORMA")

///|
/// `SOLOVAY_PROFORMA`
pub fn solovay_proforma() -> @kernel.Thm {
  solovay_proforma_c.get()
}

///|
/// SOLOVAY_RULE
fn step_16() -> Unit raise {
  let v_tm = @term_syntax.parse_term("(v : List[Cart[Real, N]])")
  let d_tm = @term_syntax.parse_term("(d : List[Real])")
  let elv_tm = @term_syntax.parse_term("(EL : (Num, List[Cart[Real, N]]) -> Cart[Real, N])")
  let eld_tm = @term_syntax.parse_term("(EL : (Num, List[Real]) -> Real)")
  let rn_ty = @term_syntax.parse_type("Cart[Real, N]")
  let rewr_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.rewrite_rule(@list.List([@lists.map(), @lists.el(), @lists.hd(), @lists.tl(), @lists.length(), forall_length_clauses(), @lists.itlist2(), @vectors.vector_add_rid(), @vectors.vector_add_lid(), @vectors.dot_lzero()]))
  let sewr_rule : (@kernel.Thm) -> @kernel.Thm raise = @simp.pure_once_rewrite_rule(@list.List([@vectors.dot_sym()]))
  solovay_rule_c.set(fn(x183 : Int64) -> @kernel.Thm raise {
    let n = x183
    let t186 = @list.List([@kernel.mk_comb(@kernel.mk_comb(eld_tm, @nums.mk_small_numeral(0L)), d_tm)])
    let t187 = @lib.map(fn(x185 : Int64) -> @kernel.Term raise {
      let i_1 = x185
      @kernel.mk_comb(@kernel.mk_comb(eld_tm, @nums.mk_small_numeral(i_1)), d_tm)
    }, @lib.range(1L, n)).concat(t186)
    let args = @lib.map(fn(x184 : Int64) -> @kernel.Term raise {
      let i = x184
      @kernel.mk_comb(@kernel.mk_comb(elv_tm, @nums.mk_small_numeral(i)), v_tm)
    }, @lib.range(0L, @lib.sub63(n, 1L))).concat(t187)
    let pty = @lib.itlist(fn(x191 : @kernel.Term, x192 : @kernel.HolType) -> @kernel.HolType raise {
      (fn(x188 : @kernel.HolType) -> ((@kernel.HolType) -> @kernel.HolType raise) raise {
        fn(x189 : @kernel.HolType) -> @kernel.HolType raise {
          @basics.mk_fun_ty(x188, x189)
        }
      })((fn(x190 : @kernel.Term) -> @kernel.HolType raise {
        @kernel.type_of(x190)
      })(x191))(x192)
    }, args, @kernel.bool_ty)
    let p_tm = @basics.list_mk_abs(@list.List([d_tm, v_tm]), @basics.list_mk_comb(@kernel.mk_var("P", pty), args))
    let vs = @basics.make_args("v", @list.List([]), @lib.replicate(rn_ty, @lib.int63_to_int(n)))
    let th1 = @bool.ispecl(@list.List([p_tm, @lists.mk_list(vs, rn_ty)]), solovay_proforma())
    let th2 = rewr_rule(@equal.conv_rule(@equal.top_depth_conv(@calc_num.num_conv), th1))
    let th3 = sewr_rule(th2)
    @lib.itlist(fn(x193 : @kernel.Term, x194 : @kernel.Thm) -> @kernel.Thm raise {
      let v = x193
      let t196 = @drule.match_mp(@theorems.mono_forall())
      (fn(x197 : @kernel.Thm) -> @kernel.Thm raise {
        t196(((x195 : @kernel.Thm) => @bool.gen(v, x195))(x197))
      })(x194)
    }, vs, th3)
  })
}

///|
let solovay_rule_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("SOLOVAY_RULE")

///|
/// `SOLOVAY_RULE`
pub fn solovay_rule(x : Int64) -> @kernel.Thm raise {
  (solovay_rule_c.get())(x)
}

///|
/// MK_SOLOVAY_PROFORMA
fn step_17() -> Unit raise {
  let preths = @lib.map(solovay_rule, @lib.range(0L, 9L))
  mk_solovay_proforma_c.set(fn(x198 : Int64) -> @kernel.Thm raise {
    let n = x198
    if (n < 10L) {
      @lib.el(@lib.int63_to_int(n), preths)
    } else {
      solovay_rule(n)
    }
  })
}

///|
let mk_solovay_proforma_c : @lib.Cell[(Int64) -> @kernel.Thm raise] = @lib.Cell::new("MK_SOLOVAY_PROFORMA")

///|
/// `MK_SOLOVAY_PROFORMA`
pub fn mk_solovay_proforma(x : Int64) -> @kernel.Thm raise {
  (mk_solovay_proforma_c.get())(x)
}

///|
/// `is_vector_ty`
pub fn is_vector_ty(x199 : @kernel.HolType) -> Bool raise {
  let ty = x199
  match ty {
    @kernel.HolType::Tyapp("cart", More(@kernel.HolType::Tyapp("real", Empty), tail=More(_, tail=Empty))) => true
    _ => false
  }
}

///|
/// `SOLOVAY_REDUCE_TAC`
pub fn solovay_reduce_tac(x200 : @list.List[(String, @kernel.Thm)], x201 : @kernel.Term) -> @tactics.Goalstate raise {
  let (asl, w) = (x200, x201)
  let avs = @lib.sort(fn(x204 : @kernel.Term, x205 : @kernel.Term) -> Bool raise {
    let s206 = (fn(x202 : @kernel.Term) -> ((@kernel.Term) -> Bool raise) raise {
      fn(x203 : @kernel.Term) -> Bool raise {
        (@lib.compare(x202, x203) < 0)
      }
    })(x204)
    s206(x205)
  }, @lib.filter(fn(x208 : @kernel.Term) -> Bool raise {
    is_vector_ty((fn(x207 : @kernel.Term) -> @kernel.HolType raise {
      @kernel.type_of(x207)
    })(x208))
  }, @kernel.frees(w)))
  let t214 = @tactics.repeat_tac(@tactics.gen_tac)
  let t213 = @simp.rewrite_tac(@list.List([@vectors.dot_ladd(), @vectors.dot_lmul(), @vectors.dot_radd(), @vectors.dot_rmul(), @vectors.dot_lzero(), @vectors.dot_rzero()]))
  let t212 = @tactics.match_mp_tac(mk_solovay_proforma(@lib.sub63(Int::to_int64(@lib.length(avs)), 1L)))
  let t211 = @tactics.map_every(fn(x209 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let v = x209
    @tactics.spec_tac(v, v)
  }, @lib.rev(avs))
  @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.dot_sym()])), t211), t212), t213), t214)((asl, w))
}

///|
/// SOLOVAY_VECTOR_TAC
fn step_18() -> Unit raise {
  let t222 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lneg(), @calc_int.real_mul_rneg(), @analysis.real_neg_neg(), @realax.real_mul_lid(), @analysis.real_mul_rid(), @equal.gsym(@realax.real_sub())]))
  let t221 = @tactics.repeat_tac(@tactics.gen_tac)
  let t220 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @theorems.right_imp_forall_thm(), @equal.gsym(@theorems.conj_assoc())]))
  let t219 = @simp.rewrite_tac(@list.List([@analysis.real_mul_lzero(), @analysis.real_mul_rzero(), @realax.real_mul_lid(), @analysis.real_mul_rid(), @realax.real_add_lid(), @calc_int.real_add_rid()]))
  let t218 = @tactics.repeat_tac(fn(x217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    solovay_reduce_tac(x217.0, x217.1)
  })
  let t216 = @simp.rewrite_tac(@list.List([@vectors.dot_lzero(), @vectors.dot_rzero()]))
  let t215 = @tactics.repeat_tac(@tactics.gen_tac)
  solovay_vector_tac_c.set(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.dist(), @realax.real_gt(), @realax.real_ge(), @vectors.norm_lt(), @vectors.norm_le(), @equal.gsym(@vectors.dot_pos_lt())])), t215), solovay_tac), t216), t218), t219), t220), t221), t222))
}

///|
let solovay_vector_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("SOLOVAY_VECTOR_TAC")

///|
/// `SOLOVAY_VECTOR_TAC`
pub fn solovay_vector_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (solovay_vector_tac_c.get())(x)
}

///|
/// PYTHAGORAS
fn step_19() -> Unit raise {
  let t223 = @tactics.then_tac(solovay_vector_tac, @tactics.conv_tac(@calc_rat.real_ring))
  pythagoras_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, N], ∀ B : Cart[Real, N], ∀ C : Cart[Real, N], orthogonal(A - B, C - B) → pow(norm(C - A), 2) == pow(norm(B - A), 2) + pow(norm(C - B), 2)"), t223))
}

///|
let pythagoras_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PYTHAGORAS")

///|
/// `PYTHAGORAS`
pub fn pythagoras() -> @kernel.Thm {
  pythagoras_c.get()
}

///|
/// EXAMPLE_1
fn step_20() -> Unit raise {
  let t224 = @tactics.then_tac(solovay_vector_tac, @tactics.conv_tac(@sos.real_sos))
  example_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], dot(x, y) <= norm(x) * norm(y)"), t224))
}

///|
let example_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXAMPLE_1")

///|
/// `EXAMPLE_1`
pub fn example_1() -> @kernel.Thm {
  example_1_c.get()
}

///|
/// EXAMPLE_2
fn step_21() -> Unit raise {
  let t225 = @tactics.then_tac(solovay_vector_tac, @tactics.conv_tac(@sos.real_sos))
  example_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], op_pct((a : Real), x + y) == op_pct(a, x) + op_pct(a, y)"), t225))
}

///|
let example_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXAMPLE_2")

///|
/// `EXAMPLE_2`
pub fn example_2() -> @kernel.Thm {
  example_2_c.get()
}

///|
/// EXAMPLE_4
fn step_22() -> Unit raise {
  let t226 = @tactics.then_tac(solovay_vector_tac, @tactics.conv_tac(@sos.real_sos))
  example_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], ∀ z : Cart[Real, _], dot(x, y + z) == dot(x, y) + dot(x, z)"), t226))
}

///|
let example_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXAMPLE_4")

///|
/// `EXAMPLE_4`
pub fn example_4() -> @kernel.Thm {
  example_4_c.get()
}

///|
/// EXAMPLE_5
fn step_23() -> Unit raise {
  let t227 = @tactics.then_tac(solovay_vector_tac, @tactics.conv_tac(@sos.real_sos))
  example_5_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], ∀ y : Cart[Real, _], dot(x, x) == real_of_num(0) → dot(x, y) == real_of_num(0)"), t227))
}

///|
let example_5_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXAMPLE_5")

///|
/// `EXAMPLE_5`
pub fn example_5() -> @kernel.Thm {
  example_5_c.get()
}

///|
/// Examples/solovay.ml:354
fn step_24() -> Unit raise {
  ignore(@tactics.g(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ d : Cart[Real, N], !(d == vec(0)) → norm(a + d) > norm(a) || norm(a - d) > norm(a)")))
}

///|
/// Examples/solovay.ml:357
fn step_25() -> Unit raise {
  ignore(@lib.time(@rqe_tactics_ext.e, solovay_vector_tac))
}

///|
/// Examples/solovay.ml:359
fn step_26() -> Unit raise {
  ignore(@lib.time(@rqe_tactics_ext.e, @tactics.conv_tac(@sos.real_sos)))
}

///|
/// Examples/solovay.ml:365
fn step_27() -> Unit raise {
  ignore(@tactics.g(@term_syntax.parse_term("∀ b : Cart[Real, N], ∀ a : Cart[Real, N], ∀ d : Cart[Real, N], !(d == vec(0)) → distance((a, b + d)) > distance((a, b)) || distance((a, b - d)) > distance((a, b))")))
}

///|
/// Examples/solovay.ml:368
fn step_28() -> Unit raise {
  ignore(@lib.time(@rqe_tactics_ext.e, solovay_vector_tac))
}

///|
/// Examples/solovay.ml:370
fn step_29() -> Unit raise {
  ignore(@lib.time(@rqe_tactics_ext.e, @tactics.conv_tac(@sos.real_sos)))
}

///|
/// EXAMPLE_7
fn step_30() -> Unit raise {
  let t228 = @tactics.then_tac(solovay_vector_tac, @tactics.conv_tac(@sos.real_sos))
  example_7_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, _], abs(norm(x)) == norm(x)"), t228))
}

///|
let example_7_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXAMPLE_7")

///|
/// `EXAMPLE_7`
pub fn example_7() -> @kernel.Thm {
  example_7_c.get()
}

///|
/// EXAMPLE_9
fn step_31() -> Unit raise {
  let t234 = @tactics.conv_tac(@rqe_main.real_qelim_conv)
  let t235 = @tactics.then_tac(@tactics.then_tac(solovay_vector_tac, fn(x233 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x229 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x229
      @tactics.map_every(fn(x231 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let v = x231
        @tactics.spec_tac(v, v)
      }, @kernel.frees(w))
    })(x233)(x233)
  }), t234)
  example_9_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], dot(x, y) > real_of_num(0) → (∃ u : Real, real_of_num(0) < u && norm(op_pct(u, y) - x) < norm(x))"), t235))
}

///|
let example_9_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXAMPLE_9")

///|
/// `EXAMPLE_9`
pub fn example_9() -> @kernel.Thm {
  example_9_c.get()
}

///|
/// EXAMPLE_10
fn step_32() -> Unit raise {
  let t241 = @tactics.conv_tac(@rqe_main.real_qelim_conv)
  let t242 = @tactics.then_tac(@tactics.then_tac(solovay_vector_tac, fn(x240 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x236 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x236
      @tactics.map_every(fn(x238 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let v = x238
        @tactics.spec_tac(v, v)
      }, @kernel.frees(w))
    })(x240)(x240)
  }), t241)
  example_10_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], dot(x, y) > real_of_num(0) → (∃ u : Real, real_of_num(0) < u && (∀ v : Real, real_of_num(0) < v && v <= u → norm(op_pct(v, y) - x) < norm(x)))"), t242))
}

///|
let example_10_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXAMPLE_10")

///|
/// `EXAMPLE_10`
pub fn example_10() -> @kernel.Thm {
  example_10_c.get()
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
}
