// Translated from upstream 100/pascal.ml; edit this file directly.

///|
/// NORMAL_EXISTS
fn step_1() -> Unit raise {
  let t8 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty()]))
  let t7 = @simp.simp_tac(@list.List([@vectors.dim_le_card(), @sets.finite_insert(), @sets.finite_empty()]))
  let t6 = @tactics.exists_tac(@term_syntax.parse_term("CARD({(u : Cart[Real, 3]), (v : Cart[Real, 3])})"))
  let t5 = @tactics.match_mp_tac(@arith.let_trans())
  let t4 = @tactics.disch_then(@tactics.match_mp_tac)
  let t3 = @simp.rewrite_tac(@list.List([@sets.forall_in_insert(), @sets.not_in_empty(), @cart.dimindex_3()]))
  let t2 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("{(u : Cart[Real, 3]), (v : Cart[Real, 3])}"), @vectors.orthogonal_to_subspace_exists()))
  let t1 = @simp.once_rewrite_tac(@list.List([@vectors.orthogonal_sym()]))
  let t9 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t1), t2), t3), t4), t5), t6), @tactics.conj_tac), t7), t8), @int.arith_tac)
  normal_exists_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, 3], ∀ v : Cart[Real, 3], ∃ w : Cart[Real, 3], !(w == vec(0)) && orthogonal(u, w) && orthogonal(v, w)"), t9))
}

///|
let normal_exists_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORMAL_EXISTS")

///|
/// `NORMAL_EXISTS`
pub fn normal_exists() -> @kernel.Thm {
  normal_exists_c.get()
}

///|
/// direction_tybij
fn step_2() -> Unit raise {
  direction_tybij_c.set(@class.new_type_definition("direction", ("mk_dir", "dest_dir"), @meson.meson(@list.List([@vectors.basis_nonzero(), @arith.le_refl(), @cart.dimindex_ge_1()]), @term_syntax.parse_term("∃ x : Cart[Real, 3], !(x == vec(0))"))))
}

///|
let direction_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("direction_tybij")

///|
/// `direction_tybij`
pub fn direction_tybij() -> @kernel.Thm {
  direction_tybij_c.get()
}

///|
/// 100/pascal.ml:28
fn step_3() -> Unit raise {
  @printer.parse_as_infix("||", (11L, "right"))
}

///|
/// 100/pascal.ml:29
fn step_4() -> Unit raise {
  @printer.parse_as_infix("_|_", (11L, "right"))
}

///|
/// perpdir
fn step_5() -> Unit raise {
  perpdir_c.set(@pair.new_definition(@term_syntax.parse_term("(op_us_bar_us : (Direction, Direction) -> Bool)((x : Direction), (y : Direction)) == orthogonal(dest_dir(x), dest_dir(y))")))
}

///|
let perpdir_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("perpdir")

///|
/// `perpdir`
pub fn perpdir() -> @kernel.Thm {
  perpdir_c.get()
}

///|
/// pardir
fn step_6() -> Unit raise {
  pardir_c.set(@pair.new_definition(@term_syntax.parse_term("(op_bar_bar : (Direction, Direction) -> Bool)((x : Direction), (y : Direction)) == (cross(dest_dir(x), dest_dir(y)) == vec(0))")))
}

///|
let pardir_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("pardir")

///|
/// `pardir`
pub fn pardir() -> @kernel.Thm {
  pardir_c.get()
}

///|
/// DIRECTION_CLAUSES
fn step_7() -> Unit raise {
  let t10 = @meson.meson_tac(@list.List([direction_tybij()]))
  direction_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Direction, (P : (Cart[Real, 3]) -> Bool)(dest_dir(x))) == (∀ x : Cart[Real, 3], !(x == vec(0)) → P(x)) && (∃ x : Direction, P(dest_dir(x))) == (∃ x : Cart[Real, 3], !(x == vec(0)) && P(x))"), t10))
}

///|
let direction_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRECTION_CLAUSES")

///|
/// `DIRECTION_CLAUSES`
pub fn direction_clauses() -> @kernel.Thm {
  direction_clauses_c.get()
}

///|
let pardir_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PARDIR_REFL")

///|
/// `PARDIR_REFL`
pub fn pardir_refl() -> @kernel.Thm {
  pardir_refl_c.get()
}

///|
let pardir_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PARDIR_SYM")

///|
/// `PARDIR_SYM`
pub fn pardir_sym() -> @kernel.Thm {
  pardir_sym_c.get()
}

///|
let pardir_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PARDIR_TRANS")

///|
/// `PARDIR_TRANS`
pub fn pardir_trans() -> @kernel.Thm {
  pardir_trans_c.get()
}

///|
/// PARDIR_REFL, PARDIR_SYM, PARDIR_TRANS
fn step_8() -> Unit raise {
  let t12 = @tactics.then_tac(@simp.rewrite_tac(@list.List([pardir(), direction_clauses()])), @cross.vec3_tac)
  let t13 = (@term_syntax.parse_term("(∀ x : Direction, op_bar_bar(x, x)) && (∀ x : Direction, ∀ y : Direction, op_bar_bar(x, y) == op_bar_bar(y, x)) && (∀ x : Direction, ∀ y : Direction, ∀ z : Direction, op_bar_bar(x, y) && op_bar_bar(y, z) → op_bar_bar(x, z))"), t12)
  match @bool.conjuncts_rule((fn(x11 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x11.0, x11.1)
  })(t13)) {
    More(pardir_refl, tail=More(pardir_sym, tail=More(pardir_trans, tail=Empty))) => {
      pardir_refl_c.set(pardir_refl)
      pardir_sym_c.set(pardir_sym)
      pardir_trans_c.set(pardir_trans)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:42:4")
  }
}

///|
/// PARDIR_EQUIV
fn step_9() -> Unit raise {
  let t14 = @meson.meson_tac(@list.List([pardir_refl(), pardir_sym(), pardir_trans()]))
  let t15 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm()])), t14)
  pardir_equiv_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Direction, ∀ y : Direction, (op_bar_bar(x) == op_bar_bar(y)) == op_bar_bar(x, y)"), t15))
}

///|
let pardir_equiv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PARDIR_EQUIV")

///|
/// `PARDIR_EQUIV`
pub fn pardir_equiv() -> @kernel.Thm {
  pardir_equiv_c.get()
}

///|
/// DIRECTION_AXIOM_1
fn step_10() -> Unit raise {
  let t25 = @tactics.pop_assum_list(fn(x24 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x20 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s21 = @tactics.mp_tac(x20)
      fn(x22 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s21(x22)
      }
    })(((x23 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x23))(x24))
  })
  let t19 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t17 = @term_syntax.parse_term("(p' : Cart[Real, 3])")
  let t18 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Cart[Real, 3])"), t17]), normal_exists()))
  let t16 = @tactics.repeat_tac(@tactics.strip_tac)
  let t26 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([perpdir(), pardir(), direction_clauses()])), t16), t18), t19), t25), @cross.vec3_tac)
  direction_axiom_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Direction, ∀ p' : Direction, !op_bar_bar(p, p') → (∃ l : Direction, op_us_bar_us(p, l) && op_us_bar_us(p', l) && (∀ l' : Direction, op_us_bar_us(p, l') && op_us_bar_us(p', l') → op_bar_bar(l', l)))"), t26))
}

///|
let direction_axiom_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRECTION_AXIOM_1")

///|
/// `DIRECTION_AXIOM_1`
pub fn direction_axiom_1() -> @kernel.Thm {
  direction_axiom_1_c.get()
}

///|
/// DIRECTION_AXIOM_2
fn step_11() -> Unit raise {
  let t27 = @meson.meson_tac(@list.List([normal_exists(), @vectors.orthogonal_sym()]))
  let t28 = @tactics.then_tac(@simp.rewrite_tac(@list.List([perpdir(), direction_clauses()])), t27)
  direction_axiom_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Direction, ∀ l' : Direction, ∃ p : Direction, op_us_bar_us(p, l) && op_us_bar_us(p, l')"), t28))
}

///|
let direction_axiom_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRECTION_AXIOM_2")

///|
/// `DIRECTION_AXIOM_2`
pub fn direction_axiom_2() -> @kernel.Thm {
  direction_axiom_2_c.get()
}

///|
/// DIRECTION_AXIOM_3
fn step_12() -> Unit raise {
  let t32 = @term_syntax.parse_term("(basis : (Num) -> Cart[Real, 3])(3)")
  let t33 = @term_syntax.parse_term("(basis : (Num) -> Cart[Real, 3])(2)")
  let t34 = @tactics.map_every(fn(x29 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x29
    let t31 = @simp.simp_tac(@list.List([@vectors.basis_nonzero(), @cart.dimindex_3(), @calc_num.arith()]))
    @tactics.then_tac(@tactics.exists_tac(t), t31)
  }, @list.List([@term_syntax.parse_term("(basis : (Num) -> Cart[Real, 3])(1)"), t33, t32]))
  let t35 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([perpdir(), pardir(), direction_clauses()])), t34), @cross.vec3_tac)
  direction_axiom_3_c.set(@tactics.prove(@term_syntax.parse_term("∃ p : Direction, ∃ p' : Direction, ∃ p'' : Direction, !op_bar_bar(p, p') && !op_bar_bar(p', p'') && !op_bar_bar(p, p'') && !(∃ l : Direction, op_us_bar_us(p, l) && op_us_bar_us(p', l) && op_us_bar_us(p'', l))"), t35))
}

///|
let direction_axiom_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRECTION_AXIOM_3")

///|
/// `DIRECTION_AXIOM_3`
pub fn direction_axiom_3() -> @kernel.Thm {
  direction_axiom_3_c.get()
}

///|
/// DIRECTION_AXIOM_4_WEAK
fn step_13() -> Unit raise {
  let t44 = @meson.meson_tac(@list.List([@cross.cross_0()]))
  let t45 = @list.List([@tactics.then_tac(@tactics.pop_assum(fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s42 = @tactics.mp_tac(x41)
    fn(x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s42(x43)
    }
  }), @cross.vec3_tac), t44])
  let t40 = @tactics.subgoal_then(@term_syntax.parse_term("orthogonal(cross((l : Cart[Real, 3]), basis(1)), l) && orthogonal(cross(l, basis(2)), l) && !(cross(cross(l, basis(1)), cross(l, basis(2))) == vec(0)) || orthogonal(cross(l, basis(1)), l) && orthogonal(cross(l, basis(3)), l) && !(cross(cross(l, basis(1)), cross(l, basis(3))) == vec(0)) || orthogonal(cross(l, basis(2)), l) && orthogonal(cross(l, basis(3)), l) && !(cross(cross(l, basis(2)), cross(l, basis(3))) == vec(0))"), fn(x37 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s38 = @tactics.mp_tac(x37)
    fn(x39 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s38(x39)
    }
  })
  let t36 = @tactics.repeat_tac(@tactics.strip_tac)
  let t46 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([direction_clauses(), pardir(), perpdir()])), t36), t40), t45)
  direction_axiom_4_weak_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Direction, ∃ p : Direction, ∃ p' : Direction, !op_bar_bar(p, p') && op_us_bar_us(p, l) && op_us_bar_us(p', l)"), t46))
}

///|
let direction_axiom_4_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRECTION_AXIOM_4_WEAK")

///|
/// `DIRECTION_AXIOM_4_WEAK`
pub fn direction_axiom_4_weak() -> @kernel.Thm {
  direction_axiom_4_weak_c.get()
}

///|
/// ORTHOGONAL_COMBINE
fn step_14() -> Unit raise {
  let t54 = @tactics.pop_assum_list(fn(x53 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s50 = @tactics.mp_tac(x49)
      fn(x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s50(x51)
      }
    })(((x52 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x52))(x53))
  })
  let t48 = @tactics.exists_tac(@term_syntax.parse_term("(a : Cart[Real, 3]) + (b : Cart[Real, 3])"))
  let t47 = @tactics.repeat_tac(@tactics.strip_tac)
  let t55 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([direction_clauses(), pardir(), perpdir()])), t47), t48), t54), @cross.vec3_tac)
  orthogonal_combine_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Direction, ∀ a : Direction, ∀ b : Direction, op_us_bar_us(a, x) && op_us_bar_us(b, x) && !op_bar_bar(a, b) → (∃ c : Direction, op_us_bar_us(c, x) && !op_bar_bar(a, c) && !op_bar_bar(b, c))"), t55))
}

///|
let orthogonal_combine_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_COMBINE")

///|
/// `ORTHOGONAL_COMBINE`
pub fn orthogonal_combine() -> @kernel.Thm {
  orthogonal_combine_c.get()
}

///|
/// DIRECTION_AXIOM_4
fn step_15() -> Unit raise {
  let t56 = @meson.meson_tac(@list.List([direction_axiom_4_weak(), orthogonal_combine()]))
  direction_axiom_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Direction, ∃ p : Direction, ∃ p' : Direction, ∃ p'' : Direction, !op_bar_bar(p, p') && !op_bar_bar(p', p'') && !op_bar_bar(p, p'') && op_us_bar_us(p, l) && op_us_bar_us(p', l) && op_us_bar_us(p'', l)"), t56))
}

///|
let direction_axiom_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRECTION_AXIOM_4")

///|
/// `DIRECTION_AXIOM_4`
pub fn direction_axiom_4() -> @kernel.Thm {
  direction_axiom_4_c.get()
}

///|
/// line_tybij
fn step_16() -> Unit raise {
  line_tybij_c.set(@quot.define_quotient_type("line", ("mk_line", "dest_line"), @term_syntax.parse_term("op_bar_bar")))
}

///|
let line_tybij_c : @lib.Cell[(@kernel.Thm, @kernel.Thm)] = @lib.Cell::new("line_tybij")

///|
/// `line_tybij`
pub fn line_tybij() -> (@kernel.Thm, @kernel.Thm) {
  line_tybij_c.get()
}

///|
/// PERPDIR_WELLDEF
fn step_17() -> Unit raise {
  let t57 = @tactics.then_tac(@simp.rewrite_tac(@list.List([perpdir(), pardir(), direction_clauses()])), @cross.vec3_tac)
  perpdir_welldef_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Direction, ∀ y : Direction, ∀ x' : Direction, ∀ y' : Direction, op_bar_bar(x, x') && op_bar_bar(y, y') → op_us_bar_us(x, y) == op_us_bar_us(x', y')"), t57))
}

///|
let perpdir_welldef_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PERPDIR_WELLDEF")

///|
/// `PERPDIR_WELLDEF`
pub fn perpdir_welldef() -> @kernel.Thm {
  perpdir_welldef_c.get()
}

///|
let perpl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("perpl")

///|
/// `perpl`
pub fn perpl() -> @kernel.Thm {
  perpl_c.get()
}

///|
let perpl_th_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("perpl_th")

///|
/// `perpl_th`
pub fn perpl_th() -> @kernel.Thm {
  perpl_th_c.get()
}

///|
/// perpl, perpl_th
fn step_18() -> Unit raise {
  let (perpl, perpl_th) = @quot.lift_function(line_tybij().1)((pardir_refl(), pardir_trans()))("perpl")(perpdir_welldef())
  perpl_c.set(perpl)
  perpl_th_c.set(perpl_th)
}

///|
/// line_lift_thm
fn step_19() -> Unit raise {
  line_lift_thm_c.set(@quot.lift_theorem(line_tybij())((pardir_refl(), pardir_sym(), pardir_trans()))(@list.List([perpl_th()])))
}

///|
let line_lift_thm_c : @lib.Cell[(@kernel.Thm) -> @kernel.Thm raise] = @lib.Cell::new("line_lift_thm")

///|
/// `line_lift_thm`
pub fn line_lift_thm(x : @kernel.Thm) -> @kernel.Thm raise {
  (line_lift_thm_c.get())(x)
}

///|
/// LINE_AXIOM_1
fn step_20() -> Unit raise {
  line_axiom_1_c.set(line_lift_thm(direction_axiom_1()))
}

///|
let line_axiom_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINE_AXIOM_1")

///|
/// `LINE_AXIOM_1`
pub fn line_axiom_1() -> @kernel.Thm {
  line_axiom_1_c.get()
}

///|
/// LINE_AXIOM_2
fn step_21() -> Unit raise {
  line_axiom_2_c.set(line_lift_thm(direction_axiom_2()))
}

///|
let line_axiom_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINE_AXIOM_2")

///|
/// `LINE_AXIOM_2`
pub fn line_axiom_2() -> @kernel.Thm {
  line_axiom_2_c.get()
}

///|
/// LINE_AXIOM_3
fn step_22() -> Unit raise {
  line_axiom_3_c.set(line_lift_thm(direction_axiom_3()))
}

///|
let line_axiom_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINE_AXIOM_3")

///|
/// `LINE_AXIOM_3`
pub fn line_axiom_3() -> @kernel.Thm {
  line_axiom_3_c.get()
}

///|
/// LINE_AXIOM_4
fn step_23() -> Unit raise {
  line_axiom_4_c.set(line_lift_thm(direction_axiom_4()))
}

///|
let line_axiom_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LINE_AXIOM_4")

///|
/// `LINE_AXIOM_4`
pub fn line_axiom_4() -> @kernel.Thm {
  line_axiom_4_c.get()
}

///|
/// point_tybij
fn step_24() -> Unit raise {
  let t58 = @simp.rewrite_tac(@list.List([]))
  point_tybij_c.set(@class.new_type_definition("point", ("mk_point", "dest_point"), @tactics.prove(@term_syntax.parse_term("∃ x : Line, true"), t58)))
}

///|
let point_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("point_tybij")

///|
/// `point_tybij`
pub fn point_tybij() -> @kernel.Thm {
  point_tybij_c.get()
}

///|
/// 100/pascal.ml:120
fn step_25() -> Unit raise {
  @printer.parse_as_infix("on", (11L, "right"))
}

///|
/// on
fn step_26() -> Unit raise {
  on_c.set(@pair.new_definition(@term_syntax.parse_term("(on : (Point, Line) -> Bool)((p : Point), (l : Line)) == perpl(dest_point(p), l)")))
}

///|
let on_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("on")

///|
/// `on`
pub fn on() -> @kernel.Thm {
  on_c.get()
}

///|
/// POINT_CLAUSES
fn step_27() -> Unit raise {
  let t59 = @meson.meson_tac(@list.List([point_tybij()]))
  point_clauses_c.set(@tactics.prove(@term_syntax.parse_term("((p : Point) == (p' : Point)) == (dest_point(p) == dest_point(p')) && (∀ p : Point, (P : (Line) -> Bool)(dest_point(p))) == (∀ l : Line, P(l)) && (∃ p : Point, P(dest_point(p))) == (∃ l : Line, P(l))"), t59))
}

///|
let point_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("POINT_CLAUSES")

///|
/// `POINT_CLAUSES`
pub fn point_clauses() -> @kernel.Thm {
  point_clauses_c.get()
}

///|
/// `POINT_TAC`
pub fn point_tac(x60 : @kernel.Thm) -> @tactics.Tactic raise {
  let th = x60
  let t62 = @tactics.accept_tac(th)
  @tactics.then_tac(@simp.rewrite_tac(@list.List([on(), point_clauses()])), t62)
}

///|
/// AXIOM_1
fn step_28() -> Unit raise {
  let t63 = point_tac(line_axiom_1())
  axiom_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Point, ∀ p' : Point, !(p == p') → (∃ l : Line, on(p, l) && on(p', l) && (∀ l' : Line, on(p, l') && on(p', l') → l' == l))"), t63))
}

///|
let axiom_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AXIOM_1")

///|
/// `AXIOM_1`
pub fn axiom_1() -> @kernel.Thm {
  axiom_1_c.get()
}

///|
/// AXIOM_2
fn step_29() -> Unit raise {
  let t64 = point_tac(line_axiom_2())
  axiom_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Line, ∀ l' : Line, ∃ p : Point, on(p, l) && on(p, l')"), t64))
}

///|
let axiom_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AXIOM_2")

///|
/// `AXIOM_2`
pub fn axiom_2() -> @kernel.Thm {
  axiom_2_c.get()
}

///|
/// AXIOM_3
fn step_30() -> Unit raise {
  let t65 = point_tac(line_axiom_3())
  axiom_3_c.set(@tactics.prove(@term_syntax.parse_term("∃ p : Point, ∃ p' : Point, ∃ p'' : Point, !(p == p') && !(p' == p'') && !(p == p'') && !(∃ l : Line, on(p, l) && on(p', l) && on(p'', l))"), t65))
}

///|
let axiom_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AXIOM_3")

///|
/// `AXIOM_3`
pub fn axiom_3() -> @kernel.Thm {
  axiom_3_c.get()
}

///|
/// AXIOM_4
fn step_31() -> Unit raise {
  let t66 = point_tac(line_axiom_4())
  axiom_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Line, ∃ p : Point, ∃ p' : Point, ∃ p'' : Point, !(p == p') && !(p' == p'') && !(p == p'') && on(p, l) && on(p', l) && on(p'', l)"), t66))
}

///|
let axiom_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AXIOM_4")

///|
/// `AXIOM_4`
pub fn axiom_4() -> @kernel.Thm {
  axiom_4_c.get()
}

///|
/// projl
fn step_32() -> Unit raise {
  projl_c.set(@pair.new_definition(@term_syntax.parse_term("(projl : (Cart[Real, 3]) -> Line)((x : Cart[Real, 3])) == mk_line(op_bar_bar(mk_dir(x)))")))
}

///|
let projl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("projl")

///|
/// `projl`
pub fn projl() -> @kernel.Thm {
  projl_c.get()
}

///|
/// projp
fn step_33() -> Unit raise {
  projp_c.set(@pair.new_definition(@term_syntax.parse_term("(projp : (Cart[Real, 3]) -> Point)((x : Cart[Real, 3])) == mk_point(projl(x))")))
}

///|
let projp_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("projp")

///|
/// `projp`
pub fn projp() -> @kernel.Thm {
  projp_c.get()
}

///|
/// PROJL_TOTAL
fn step_34() -> Unit raise {
  let t72 = @meson.meson_tac(@list.List([direction_tybij()]))
  let t71 = @tactics.exists_tac(@term_syntax.parse_term("dest_dir((d : Direction))"))
  let t73 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([projl()])), t71), t72)
  let t74 = @list.List([@meson.meson_tac(@list.List([line_tybij().0, line_tybij().1])), t73])
  let t70 = @tactics.choose_then(fn(x67 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s68 = @tactics.subst1_tac(x67)
    fn(x69 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s68(x69)
    }
  })
  let t75 = @tactics.thenl(@tactics.then_tac(@tactics.gen_tac, @tactics.subgoal_then(@term_syntax.parse_term("∃ d : Direction, (l : Line) == mk_line(op_bar_bar(d))"), t70)), t74)
  projl_total_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Line, ∃ x : Cart[Real, 3], !(x == vec(0)) && l == projl(x)"), t75))
}

///|
let projl_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROJL_TOTAL")

///|
/// `PROJL_TOTAL`
pub fn projl_total() -> @kernel.Thm {
  projl_total_c.get()
}

///|
/// homol
fn step_35() -> Unit raise {
  let t76 = @simp.rewrite_rule(@list.List([@class.skolem_thm()]))(projl_total())
  homol_c.set(@nums.new_specification(@list.List(["homol"]))(t76))
}

///|
let homol_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("homol")

///|
/// `homol`
pub fn homol() -> @kernel.Thm {
  homol_c.get()
}

///|
/// PROJP_TOTAL
fn step_36() -> Unit raise {
  let t77 = @meson.meson_tac(@list.List([projl_total(), point_tybij()]))
  let t78 = @tactics.then_tac(@simp.rewrite_tac(@list.List([projp()])), t77)
  projp_total_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Point, ∃ x : Cart[Real, 3], !(x == vec(0)) && p == projp(x)"), t78))
}

///|
let projp_total_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROJP_TOTAL")

///|
/// `PROJP_TOTAL`
pub fn projp_total() -> @kernel.Thm {
  projp_total_c.get()
}

///|
/// homop_def
fn step_37() -> Unit raise {
  homop_def_c.set(@pair.new_definition(@term_syntax.parse_term("(homop : (Point) -> Cart[Real, 3])((p : Point)) == homol(dest_point(p))")))
}

///|
let homop_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("homop_def")

///|
/// `homop_def`
pub fn homop_def() -> @kernel.Thm {
  homop_def_c.get()
}

///|
/// homop
fn step_38() -> Unit raise {
  let t79 = @tactics.match_accept_tac(homol())
  let t80 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([homop_def(), projp(), @meson.meson(@list.List([point_tybij()]), @term_syntax.parse_term("((p : Point) == mk_point((l : Line))) == (dest_point(p) == l)"))]))), t79)
  homop_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Point, !(homop(p) == vec(0)) && p == projp(homop(p))"), t80))
}

///|
let homop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("homop")

///|
/// `homop`
pub fn homop() -> @kernel.Thm {
  homop_c.get()
}

///|
/// parallel
fn step_39() -> Unit raise {
  parallel_c.set(@pair.new_definition(@term_syntax.parse_term("(parallel : (Cart[Real, 3], Cart[Real, 3]) -> Bool)((x : Cart[Real, 3]), (y : Cart[Real, 3])) == (cross(x, y) == vec(0))")))
}

///|
let parallel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("parallel")

///|
/// `parallel`
pub fn parallel() -> @kernel.Thm {
  parallel_c.get()
}

///|
/// ON_HOMOL
fn step_40() -> Unit raise {
  let t91 = @meson.meson_tac(@list.List([homol(), homop(), direction_tybij()]))
  let t90 = @simp.rewrite_tac(@list.List([@equal.gsym(perpl_th()), perpdir()]))
  let t89 = @simp.rewrite_tac(@list.List([on(), projp(), projl(), @simp.rewrite_rule(@list.List([]))(point_tybij())]))
  let t88 = @simp.gen_rewrite_tac(fn(x87 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x81 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s82 = @equal.land_conv(x81)
      fn(x83 : @kernel.Term) -> @kernel.Thm raise {
        s82(x83)
      }
    })((fn(x84 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s85 = @equal.once_depth_conv(x84)
      fn(x86 : @kernel.Term) -> @kernel.Thm raise {
        s85(x86)
      }
    })(x87))
  }, @list.List([homop(), homol()]))
  let t92 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t88), t89), t90), @tactics.binop_tac), t91)
  on_homol_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Point, ∀ l : Line, on(p, l) == orthogonal(homop(p), homol(l))"), t92))
}

///|
let on_homol_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ON_HOMOL")

///|
/// `ON_HOMOL`
pub fn on_homol() -> @kernel.Thm {
  on_homol_c.get()
}

///|
/// EQ_HOMOL
fn step_41() -> Unit raise {
  let t104 = @meson.meson_tac(@list.List([homol(), direction_tybij()]))
  let t103 = @simp.rewrite_tac(@list.List([pardir(), parallel()]))
  let t102 = @simp.rewrite_tac(@list.List([pardir_equiv()]))
  let t101 = @simp.rewrite_tac(@list.List([projl(), @meson.meson(@list.List([line_tybij().0, line_tybij().1]), @term_syntax.parse_term("(mk_line(op_bar_bar((l : Direction))) == mk_line(op_bar_bar((l' : Direction)))) == (op_bar_bar(l) == op_bar_bar(l'))"))]))
  let t100 = @simp.gen_rewrite_tac(fn(x99 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x93 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s94 = @equal.land_conv(x93)
      fn(x95 : @kernel.Term) -> @kernel.Thm raise {
        s94(x95)
      }
    })((fn(x96 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s97 = @equal.binop_conv(x96)
      fn(x98 : @kernel.Term) -> @kernel.Thm raise {
        s97(x98)
      }
    })(x99))
  }, @list.List([homol()]))
  let t105 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t100), t101), t102), t103), t104)
  eq_homol_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Line, ∀ l' : Line, (l == l') == parallel(homol(l), homol(l'))"), t105))
}

///|
let eq_homol_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_HOMOL")

///|
/// `EQ_HOMOL`
pub fn eq_homol() -> @kernel.Thm {
  eq_homol_c.get()
}

///|
/// EQ_HOMOP
fn step_42() -> Unit raise {
  let t106 = @meson.meson_tac(@list.List([point_tybij()]))
  let t107 = @tactics.then_tac(@simp.rewrite_tac(@list.List([homop_def(), @equal.gsym(eq_homol())])), t106)
  eq_homop_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Point, ∀ p' : Point, (p == p') == parallel(homop(p), homop(p'))"), t107))
}

///|
let eq_homop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EQ_HOMOP")

///|
/// `EQ_HOMOP`
pub fn eq_homop() -> @kernel.Thm {
  eq_homop_c.get()
}

///|
/// PARALLEL_PROJL_HOMOL
fn step_43() -> Unit raise {
  let t136 = @meson.asm_meson_tac(@list.List([direction_tybij()]))
  let t135 = @simp.rewrite_tac(@list.List([pardir()]))
  let t134 = @simp.rewrite_tac(@list.List([pardir_equiv()]))
  let t133 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([line_tybij().0, line_tybij().1]), @term_syntax.parse_term("dest_line(mk_line(op_bar_bar((l : Direction)))) == op_bar_bar(l)"))]))
  let t129 = @term_syntax.parse_term("dest_line")
  let t132 = @tactics.disch_then(fn(x131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s127 = @tactics.mp_tac(x126)
      fn(x128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s127(x128)
      }
    })(((x130 : @kernel.Thm) => @equal.ap_term(t129, x130))(x131))
  })
  let t125 = @simp.gen_rewrite_tac(fn(x124 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x118 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s119 = @equal.land_conv(x118)
      fn(x120 : @kernel.Term) -> @kernel.Thm raise {
        s119(x120)
      }
    })((fn(x121 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s122 = @equal.once_depth_conv(x121)
      fn(x123 : @kernel.Term) -> @kernel.Thm raise {
        s122(x123)
      }
    })(x124))
  }, @list.List([projl()]))
  let t117 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s112 = @tactics.assume_tac(x111)
    fn(x113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s112(x113)
    }
  }, fn(x114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s115 = @tactics.mp_tac(x114)
    fn(x116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s115(x116)
    }
  }))
  let t110 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("projl((x : Cart[Real, 3]))"), homol()))
  let t109 = @simp.asm_rewrite_tac(@list.List([@cross.cross_0()]))
  let t108 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 3]) == vec(0)"))
  let t137 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([parallel()]))), t108), t109), t110), t117), t125), t132), t133), t134), t135), t136)
  parallel_projl_homol_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], parallel(x, homol(projl(x)))"), t137))
}

///|
let parallel_projl_homol_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PARALLEL_PROJL_HOMOL")

///|
/// `PARALLEL_PROJL_HOMOL`
pub fn parallel_projl_homol() -> @kernel.Thm {
  parallel_projl_homol_c.get()
}

///|
/// PARALLEL_PROJP_HOMOP
fn step_44() -> Unit raise {
  let t138 = @simp.rewrite_tac(@list.List([parallel_projl_homol()]))
  let t139 = @tactics.then_tac(@simp.rewrite_tac(@list.List([homop_def(), projp(), @simp.rewrite_rule(@list.List([]))(point_tybij())])), t138)
  parallel_projp_homop_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], parallel(x, homop(projp(x)))"), t139))
}

///|
let parallel_projp_homop_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PARALLEL_PROJP_HOMOP")

///|
/// `PARALLEL_PROJP_HOMOP`
pub fn parallel_projp_homop() -> @kernel.Thm {
  parallel_projp_homop_c.get()
}

///|
/// PARALLEL_PROJP_HOMOP_EXPLICIT
fn step_45() -> Unit raise {
  let t147 = @simp.asm_rewrite_tac(@list.List([homop(), @vectors.vector_mul_lzero()]))
  let t146 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Real) == real_of_num(0)"))
  let t145 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Real)"))
  let t144 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t143 = @simp.asm_rewrite_tac(@list.List([homop()]))
  let t142 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 3]) == vec(0)"))
  let t141 = @simp.rewrite_tac(@list.List([parallel(), @cross.cross_eq_0(), @vectors.collinear_lemma()]))
  let t140 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t148 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(parallel_projp_homop()), t140), t141), @tactics.gen_tac), t142), t143), t144), t145), t146), t147)
  parallel_projp_homop_explicit_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], !(x == vec(0)) → (∃ a : Real, !(a == real_of_num(0)) && homop(projp(x)) == op_pct(a, x))"), t148))
}

///|
let parallel_projp_homop_explicit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PARALLEL_PROJP_HOMOP_EXPLICIT")

///|
/// `PARALLEL_PROJP_HOMOP_EXPLICIT`
pub fn parallel_projp_homop_explicit() -> @kernel.Thm {
  parallel_projp_homop_explicit_c.get()
}

///|
/// bracket
fn step_46() -> Unit raise {
  bracket_c.set(@define.define_(@term_syntax.parse_term("(bracket : (List[Point]) -> Real)([(a : Point), (b : Point), (c : Point)]) == det(vector([homop(a), homop(b), homop(c)]))")))
}

///|
let bracket_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("bracket")

///|
/// `bracket`
pub fn bracket() -> @kernel.Thm {
  bracket_c.get()
}

///|
/// COLLINEAR
fn step_47() -> Unit raise {
  collinear_c.set(@pair.new_definition(@term_syntax.parse_term("(COLLINEAR : ((Point) -> Bool) -> Bool)((s : (Point) -> Bool)) == (∃ l : Line, ∀ p : Point, IN(p, s) → on(p, l))")))
}

///|
let collinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR")

///|
/// `COLLINEAR`
pub fn collinear() -> @kernel.Thm {
  collinear_c.get()
}

///|
/// COLLINEAR_SINGLETON
fn step_48() -> Unit raise {
  let t149 = @meson.meson_tac(@list.List([axiom_1(), axiom_3()]))
  let t150 = @tactics.then_tac(@simp.rewrite_tac(@list.List([collinear(), @sets.forall_in_insert(), @sets.not_in_empty()])), t149)
  collinear_singleton_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Point, COLLINEAR({a})"), t150))
}

///|
let collinear_singleton_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_SINGLETON")

///|
/// `COLLINEAR_SINGLETON`
pub fn collinear_singleton() -> @kernel.Thm {
  collinear_singleton_c.get()
}

///|
/// COLLINEAR_PAIR
fn step_49() -> Unit raise {
  let t154 = @meson.asm_meson_tac(@list.List([axiom_1()]))
  let t153 = @simp.rewrite_tac(@list.List([collinear(), @sets.forall_in_insert(), @sets.not_in_empty()]))
  let t152 = @simp.asm_rewrite_tac(@list.List([@sets.insert_ac(), collinear_singleton()]))
  let t151 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Point) == (b : Point)"))
  let t155 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t151), t152), t153), t154)
  collinear_pair_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Point, ∀ b : Point, COLLINEAR({a, b})"), t155))
}

///|
let collinear_pair_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_PAIR")

///|
/// `COLLINEAR_PAIR`
pub fn collinear_pair() -> @kernel.Thm {
  collinear_pair_c.get()
}

///|
/// COLLINEAR_TRIPLE
fn step_50() -> Unit raise {
  let t156 = @simp.rewrite_tac(@list.List([collinear(), @sets.forall_in_insert(), @sets.not_in_empty()]))
  collinear_triple_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Point, ∀ b : Point, ∀ c : Point, COLLINEAR({a, b, c}) == (∃ l : Line, on(a, l) && on(b, l) && on(c, l))"), t156))
}

///|
let collinear_triple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_TRIPLE")

///|
/// `COLLINEAR_TRIPLE`
pub fn collinear_triple() -> @kernel.Thm {
  collinear_triple_c.get()
}

///|
/// COLLINEAR_BRACKET
fn step_51() -> Unit raise {
  let t157 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.orthogonal()])), @cross.vec3_tac)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 3], ∀ b : Cart[Real, 3], ∀ c : Cart[Real, 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], cross(x, y) == vec(0) && !(x == vec(0)) && orthogonal(a, x) && orthogonal(b, x) && orthogonal(c, x) → orthogonal(a, y) && orthogonal(b, y) && orthogonal(c, y)"), t157)
  let t183 = @equal.gsym(parallel())
  let t184 = @simp.rewrite_tac(@list.List([@equal.gsym(projl()), t183, parallel_projl_homol()]))
  let t182 = @simp.asm_rewrite_tac(@list.List([@cross.dot_cross_det()]))
  let t181 = @simp.once_rewrite_tac(@list.List([@vectors.dot_sym()]))
  let t180 = @simp.once_rewrite_tac(@list.List([@cross.cross_triple()]))
  let t179 = @simp.once_rewrite_tac(@list.List([@vectors.dot_sym()]))
  let t178 = @simp.rewrite_tac(@list.List([@vectors.orthogonal()]))
  let t177 = @simp.asm_rewrite_tac(@list.List([@cross.orthogonal_cross()]))
  let t176 = @tactics.exists_tac(@term_syntax.parse_term("cross(homop((p1 : Point)), homop((p2 : Point)))"))
  let t175 = @tactics.match_mp_tac(lemma)
  let t174 = @tactics.exists_tac(@term_syntax.parse_term("mk_line(op_bar_bar(mk_dir(cross(homop((p1 : Point)), homop((p2 : Point))))))"))
  let t173 = @tactics.repeat_tac(@tactics.strip_tac)
  let t172 = @simp.rewrite_tac(@list.List([parallel(), collinear_triple(), bracket(), eq_homop(), on_homol()]))
  let t171 = @tactics.pop_assum(fn(x168 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s169 = @tactics.mp_tac(x168)
    fn(x170 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s169(x170)
    }
  })
  let t167 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.insert_ac(), collinear_pair()])), @tactics.all_tac])
  let t185 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(p1 : Point) == (p2 : Point)")), t167), t171), t172), t173), t174), t175), t176), t177), t178), t179), t180), t181), t182), t184)
  let t166 = @tactics.conv_tac(@calc_rat.real_ring)
  let t165 = @simp.rewrite_tac(@list.List([@determinants.det_3(), @vectors.orthogonal(), @vectors.dot_3(), @vectors.vector_3(), @cart.cart_eq(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vec_component()]))
  let t164 = @tactics.disch_then(fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x160 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s161 = @tactics.mp_tac(x160)
      fn(x162 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s161(x162)
      }
    })(@bool.conjunct1(x163))
  })
  let t159 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t158 = @tactics.mp_tac(homol())
  let t186 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([collinear_triple(), bracket(), on_homol(), @theorems.left_imp_exists_thm()])), t158), t159), @tactics.gen_tac), t164), t165), t166), t185])
  let t187 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.eq_tac), t186)
  collinear_bracket_c.set(@tactics.prove(@term_syntax.parse_term("∀ p1 : Point, ∀ p2 : Point, ∀ p3 : Point, COLLINEAR({p1, p2, p3}) == (bracket([p1, p2, p3]) == real_of_num(0))"), t187))
}

///|
let collinear_bracket_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_BRACKET")

///|
/// `COLLINEAR_BRACKET`
pub fn collinear_bracket() -> @kernel.Thm {
  collinear_bracket_c.get()
}

///|
/// homogeneous_conic
fn step_52() -> Unit raise {
  homogeneous_conic_c.set(@pair.new_definition(@term_syntax.parse_term("(homogeneous_conic : ((Cart[Real, 3]) -> Bool) -> Bool)((con : (Cart[Real, 3]) -> Bool)) == (∃ a : Real, ∃ b : Real, ∃ c : Real, ∃ d : Real, ∃ e : Real, ∃ f : Real, !(a == real_of_num(0) && b == real_of_num(0) && c == real_of_num(0) && d == real_of_num(0) && e == real_of_num(0) && f == real_of_num(0)) && con == {(x : Cart[Real, 3]) | a * pow(op_dollar(x, 1), 2) + (b * pow(op_dollar(x, 2), 2) + (c * pow(op_dollar(x, 3), 2) + (d * (op_dollar(x, 1) * op_dollar(x, 2)) + (e * (op_dollar(x, 1) * op_dollar(x, 3)) + f * (op_dollar(x, 2) * op_dollar(x, 3)))))) == real_of_num(0)})")))
}

///|
let homogeneous_conic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("homogeneous_conic")

///|
/// `homogeneous_conic`
pub fn homogeneous_conic() -> @kernel.Thm {
  homogeneous_conic_c.get()
}

///|
/// projective_conic
fn step_53() -> Unit raise {
  projective_conic_c.set(@pair.new_definition(@term_syntax.parse_term("(projective_conic : ((Point) -> Bool) -> Bool)((con : (Point) -> Bool)) == (∃ c : (Cart[Real, 3]) -> Bool, homogeneous_conic(c) && con == {(p : Point) | IN(homop(p), c)})")))
}

///|
let projective_conic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("projective_conic")

///|
/// `projective_conic`
pub fn projective_conic() -> @kernel.Thm {
  projective_conic_c.get()
}

///|
/// HOMOGENEOUS_CONIC_BRACKET
fn step_54() -> Unit raise {
  let t200 = @tactics.conv_tac(@calc_rat.real_ring)
  let t199 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @determinants.det_3(), @vectors.vector_3()]))
  let t198 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s193 = @tactics.mp_tac(x192)
    fn(x194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s193(x194)
    }
  }, fn(x195 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s196 = @tactics.assume_tac(x195)
    fn(x197 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s196(x197)
    }
  }))
  let t191 = @tactics.repeat_tac(@tactics.gen_tac)
  let t190 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t189 = @simp.once_rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t188 = @simp.rewrite_tac(@list.List([homogeneous_conic(), @sets.extension()]))
  let t201 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t188), t189), t190), t191), t198), t199), t200)
  homogeneous_conic_bracket_c.set(@tactics.prove(@term_syntax.parse_term("∀ con : (Cart[Real, 3]) -> Bool, ∀ x1 : Cart[Real, 3], ∀ x2 : Cart[Real, 3], ∀ x3 : Cart[Real, 3], ∀ x4 : Cart[Real, 3], ∀ x5 : Cart[Real, 3], ∀ x6 : Cart[Real, 3], homogeneous_conic(con) && IN(x1, con) && IN(x2, con) && IN(x3, con) && IN(x4, con) && IN(x5, con) && IN(x6, con) → det(vector([x6, x1, x4])) * (det(vector([x6, x2, x3])) * (det(vector([x5, x1, x3])) * det(vector([x5, x2, x4])))) == det(vector([x6, x1, x3])) * (det(vector([x6, x2, x4])) * (det(vector([x5, x1, x4])) * det(vector([x5, x2, x3]))))"), t201))
}

///|
let homogeneous_conic_bracket_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOMOGENEOUS_CONIC_BRACKET")

///|
/// `HOMOGENEOUS_CONIC_BRACKET`
pub fn homogeneous_conic_bracket() -> @kernel.Thm {
  homogeneous_conic_bracket_c.get()
}

///|
/// PROJECTIVE_CONIC_BRACKET
fn step_55() -> Unit raise {
  let t209 = @meson.asm_meson_tac(@list.List([]))
  let t208 = @tactics.match_mp_tac(homogeneous_conic_bracket())
  let t207 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t206 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x203 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s204 = @tactics.mp_tac(x203)
    fn(x205 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s204(x205)
    }
  }))
  let t202 = @simp.rewrite_tac(@list.List([bracket(), projective_conic()]))
  let t210 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t202), t206), t207), @tactics.strip_tac), t208), t209)
  projective_conic_bracket_c.set(@tactics.prove(@term_syntax.parse_term("∀ con : (Point) -> Bool, ∀ p1 : Point, ∀ p2 : Point, ∀ p3 : Point, ∀ p4 : Point, ∀ p5 : Point, ∀ p6 : Point, projective_conic(con) && IN(p1, con) && IN(p2, con) && IN(p3, con) && IN(p4, con) && IN(p5, con) && IN(p6, con) → bracket([p6, p1, p4]) * (bracket([p6, p2, p3]) * (bracket([p5, p1, p3]) * bracket([p5, p2, p4]))) == bracket([p6, p1, p3]) * (bracket([p6, p2, p4]) * (bracket([p5, p1, p4]) * bracket([p5, p2, p3])))"), t210))
}

///|
let projective_conic_bracket_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PROJECTIVE_CONIC_BRACKET")

///|
/// `PROJECTIVE_CONIC_BRACKET`
pub fn projective_conic_bracket() -> @kernel.Thm {
  projective_conic_bracket_c.get()
}

///|
/// PASCAL_DIRECT
fn step_56() -> Unit raise {
  let t246 = @tactics.conv_tac(@calc_rat.real_ring)
  let t245 = @simp.rewrite_tac(@list.List([bracket(), @determinants.det_3(), @vectors.vector_3()]))
  let t244 = @tactics.first_x_assum(fn(x243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s241 = @tactics.mp_tac(x240)
      fn(x242 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s241(x242)
      }
    })(@bool.conjunct1(x243))
  })
  let t239 = @simp.asm_rewrite_tac(@list.List([@real.real_eq_mul_lcancel()]))
  let t238 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t237 = @simp.once_rewrite_tac(@list.List([@realax.real_mul_sym()]))
  let t236 = @simp.asm_rewrite_tac(@list.List([@real.real_eq_mul_lcancel()]))
  let t235 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t234 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([collinear_bracket()])))
  let t233 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_neg()]))
  let t232 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg()]))
  let t228 = @drule.match_mp(@calc_rat.real_ring(@term_syntax.parse_term("(a : Real) == (b : Real) && (x : Real) == (y : Real) → a * x == b * y")))
  let t230 = @tactics.disch_then(fn(x229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x225 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s226 = @tactics.mp_tac(x225)
      fn(x227 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s226(x227)
      }
    })(t228(x229))
  })
  let t231 = @tactics.repeat_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.imp_imp()])), t230))
  let t224 = @simp.rewrite_tac(@list.List([@theorems.imp_conj()]))
  let t222 = @tactics.conv_tac(@calc_rat.real_ring)
  let t221 = @simp.rewrite_tac(@list.List([bracket(), @determinants.det_3(), @vectors.vector_3()]))
  let t223 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_and()), @tactics.conj_tac)), t221), t222), @tactics.all_tac])
  let t220 = @tactics.exists_tac(@term_syntax.parse_term("bracket([(x1 : Point), (x2 : Point), (x5 : Point)]) * (bracket([x1, (x3 : Point), (x6 : Point)]) * (bracket([x2, (x4 : Point), x6]) * bracket([x3, x4, x5]))) == bracket([x1, x2, x6]) * (bracket([x1, x3, x5]) * (bracket([x2, x4, x5]) * bracket([x3, x4, x6]))) && bracket([x1, x5, (x7 : Point)]) * bracket([x2, x5, (x9 : Point)]) == -bracket([x1, x2, x5]) * bracket([x5, x9, x7]) && bracket([x1, x2, x6]) * bracket([x3, x6, (x8 : Point)]) == bracket([x1, x3, x6]) * bracket([x2, x6, x8]) && bracket([x2, x4, x5]) * bracket([x2, x9, x7]) == -bracket([x2, x4, x7]) * bracket([x2, x5, x9]) && bracket([x2, x4, x7]) * bracket([x2, x6, x8]) == -bracket([x2, x4, x6]) * bracket([x2, x8, x7]) && bracket([x3, x4, x6]) * bracket([x3, x5, x8]) == bracket([x3, x4, x5]) * bracket([x3, x6, x8]) && bracket([x1, x3, x5]) * bracket([x5, x8, x7]) == -bracket([x1, x5, x7]) * bracket([x3, x5, x8])"))
  let t219 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("∀ q : Bool, ((p : Bool) → q) && (q → (r : Bool)) → p → r")))
  let t218 = @simp.rewrite_tac(@list.List([collinear_bracket(), @theorems.imp_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t215 = @drule.match_mp(projective_conic_bracket())
  let t217 = @tactics.disch_then(fn(x216 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x212 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s213 = @tactics.mp_tac(x212)
      fn(x214 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s213(x214)
      }
    })(t215(x216))
  })
  let t211 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && (b : Bool) && (c : Bool) && (d : Bool) && (e : Bool) && (f : Bool) && (g : Bool) && (h : Bool) → (p : Bool)) == (a && b && c && d && e && f && g → h → p)"))]))
  let t247 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t211), t217), t218), t219), t220), @tactics.conj_tac), t223), t224), t231), t232), t233), t234), t235), t236), t237), t238), t239), t244), t245), t246)
  pascal_direct_c.set(@tactics.prove(@term_syntax.parse_term("∀ con : (Point) -> Bool, ∀ x1 : Point, ∀ x2 : Point, ∀ x3 : Point, ∀ x4 : Point, ∀ x5 : Point, ∀ x6 : _, ∀ x6 : Point, ∀ x8 : Point, ∀ x9 : Point, !COLLINEAR({x2, x5, (x7 : Point)}) && !COLLINEAR({x1, x2, x5}) && !COLLINEAR({x1, x3, x6}) && !COLLINEAR({x2, x4, x6}) && !COLLINEAR({x3, x4, x5}) && !COLLINEAR({x1, x5, x7}) && !COLLINEAR({x2, x5, x9}) && !COLLINEAR({x1, x2, x6}) && !COLLINEAR({x3, x6, x8}) && !COLLINEAR({x2, x4, x5}) && !COLLINEAR({x2, x4, x7}) && !COLLINEAR({x2, x6, x8}) && !COLLINEAR({x3, x4, x6}) && !COLLINEAR({x3, x5, x8}) && !COLLINEAR({x1, x3, x5}) → projective_conic(con) && IN(x1, con) && IN(x2, con) && IN(x3, con) && IN(x4, con) && IN(x5, con) && IN(x6, con) && COLLINEAR({x1, x9, x5}) && COLLINEAR({x1, x8, x6}) && COLLINEAR({x2, x9, x4}) && COLLINEAR({x2, x7, x6}) && COLLINEAR({x3, x8, x4}) && COLLINEAR({x3, x7, x5}) → COLLINEAR({x7, x8, x9})"), t247))
}

///|
let pascal_direct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASCAL_DIRECT")

///|
/// `PASCAL_DIRECT`
pub fn pascal_direct() -> @kernel.Thm {
  pascal_direct_c.get()
}

///|
/// PASCAL
fn step_57() -> Unit raise {
  let t260 = @tactics.conv_tac(@calc_rat.real_ring)
  let t259 = @simp.rewrite_tac(@list.List([collinear_bracket(), bracket(), @determinants.det_3(), @vectors.vector_3()]))
  let t258 = @tactics.repeat_tac(@tactics.pop_assum(fn(x255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s256 = @tactics.mp_tac(x255)
    fn(x257 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s256(x257)
    }
  }))
  let t254 = @tactics.repeat_tac(@tactics.conj_tac)
  let t253 = @tactics.disch_then(fn(x248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x248
    let t252 = @tactics.assume_tac(@lib.funpow(7, @bool.conjunct2, th))
    let t251 = @tactics.match_mp_tac(pascal_direct())
    let t250 = @tactics.mp_tac(th)
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(p : Bool) → p) → p"))), @tactics.disch_tac), t250), t251), t252)
  })
  let t261 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t253), t254), t258), t259), t260)
  pascal_c.set(@tactics.prove(@term_syntax.parse_term("∀ con : (Point) -> Bool, ∀ x1 : Point, ∀ x2 : Point, ∀ x3 : Point, ∀ x4 : Point, ∀ x5 : Point, ∀ x6 : _, ∀ x6 : Point, ∀ x8 : Point, ∀ x9 : Point, !COLLINEAR({x1, x2, x4}) && !COLLINEAR({x1, x2, x5}) && !COLLINEAR({x1, x2, x6}) && !COLLINEAR({x1, x3, x4}) && !COLLINEAR({x1, x3, x5}) && !COLLINEAR({x1, x3, x6}) && !COLLINEAR({x2, x3, x4}) && !COLLINEAR({x2, x3, x5}) && !COLLINEAR({x2, x3, x6}) && !COLLINEAR({x4, x5, x1}) && !COLLINEAR({x4, x5, x2}) && !COLLINEAR({x4, x5, x3}) && !COLLINEAR({x4, x6, x1}) && !COLLINEAR({x4, x6, x2}) && !COLLINEAR({x4, x6, x3}) && !COLLINEAR({x5, x6, x1}) && !COLLINEAR({x5, x6, x2}) && !COLLINEAR({x5, x6, x3}) → projective_conic(con) && IN(x1, con) && IN(x2, con) && IN(x3, con) && IN(x4, con) && IN(x5, con) && IN(x6, con) && COLLINEAR({x1, x9, x5}) && COLLINEAR({x1, x8, x6}) && COLLINEAR({x2, x9, x4}) && COLLINEAR({x2, (x7 : Point), x6}) && COLLINEAR({x3, x8, x4}) && COLLINEAR({x3, x7, x5}) → COLLINEAR({x7, x8, x9})"), t261))
}

///|
let pascal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASCAL")

///|
/// `PASCAL`
pub fn pascal() -> @kernel.Thm {
  pascal_c.get()
}

///|
/// homogenize
fn step_58() -> Unit raise {
  homogenize_c.set(@pair.new_definition(@term_syntax.parse_term("(homogenize : (Cart[Real, 2]) -> Cart[Real, 3])((x : Cart[Real, 2])) == vector([op_dollar(x, 1), op_dollar(x, 2), real_of_num(1)])")))
}

///|
let homogenize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("homogenize")

///|
/// `homogenize`
pub fn homogenize() -> @kernel.Thm {
  homogenize_c.get()
}

///|
/// projectivize
fn step_59() -> Unit raise {
  projectivize_c.set(@pair.new_definition(@term_syntax.parse_term("(projectivize : (Cart[Real, 2]) -> Point) == o(projp, homogenize)")))
}

///|
let projectivize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("projectivize")

///|
/// `projectivize`
pub fn projectivize() -> @kernel.Thm {
  projectivize_c.get()
}

///|
/// HOMOGENIZE_NONZERO
fn step_60() -> Unit raise {
  let t262 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vec_component(), @vectors.vector_3(), homogenize()])), @calc_rat.real_arith_tac)
  homogenize_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], !(homogenize(x) == vec(0))"), t262))
}

///|
let homogenize_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HOMOGENIZE_NONZERO")

///|
/// `HOMOGENIZE_NONZERO`
pub fn homogenize_nonzero() -> @kernel.Thm {
  homogenize_nonzero_c.get()
}

///|
/// affine_conic
fn step_61() -> Unit raise {
  affine_conic_c.set(@pair.new_definition(@term_syntax.parse_term("(affine_conic : ((Cart[Real, 2]) -> Bool) -> Bool)((con : (Cart[Real, 2]) -> Bool)) == (∃ a : Real, ∃ b : Real, ∃ c : Real, ∃ d : Real, ∃ e : Real, ∃ f : Real, !(a == real_of_num(0) && b == real_of_num(0) && c == real_of_num(0) && d == real_of_num(0) && e == real_of_num(0) && f == real_of_num(0)) && con == {(x : Cart[Real, 2]) | a * pow(op_dollar(x, 1), 2) + (b * pow(op_dollar(x, 2), 2) + (c * (op_dollar(x, 1) * op_dollar(x, 2)) + (d * op_dollar(x, 1) + (e * op_dollar(x, 2) + f)))) == real_of_num(0)})")))
}

///|
let affine_conic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("affine_conic")

///|
/// `affine_conic`
pub fn affine_conic() -> @kernel.Thm {
  affine_conic_c.get()
}

///|
/// COLLINEAR_PROJECTIVIZE
fn step_62() -> Unit raise {
  let t300 = @tactics.conv_tac(@calc_rat.real_ring)
  let t299 = @simp.rewrite_tac(@list.List([parallel(), @cross.cross(), @cart.cart_eq(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.vector_3(), @determinants.det_3(), @vectors.vec_component()]))
  let t296 = @term_syntax.parse_term("projp(homogenize((c : Cart[Real, 2])))")
  let t297 = @term_syntax.parse_term("projp(homogenize((b : Cart[Real, 2])))")
  let t298 = @tactics.map_every(fn(x295 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x291 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x288 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s289 = @tactics.mp_tac(x288)
        fn(x290 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s289(x290)
        }
      })(@bool.conjunct1(x291))
    })((fn(x294 : @kernel.Term) -> @kernel.Thm raise {
      (fn(x292 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x293 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.spec(x292, x293)
        }
      })(x294)(homop())
    })(x295))
  }, @list.List([@term_syntax.parse_term("projp(homogenize((a : Cart[Real, 2])))"), t297, t296]))
  let t285 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t286 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t287 = @tactics.map_every(fn(x284 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s279 = @tactics.mp_tac(x278)
      fn(x280 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s279(x280)
      }
    })((fn(x283 : @kernel.Term) -> @kernel.Thm raise {
      (fn(x281 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x282 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.spec(x281, x282)
        }
      })(x283)(homogenize_nonzero())
    })(x284))
  }, @list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t286, t285]))
  let t276 = @term_syntax.parse_term("homogenize((c : Cart[Real, 2]))")
  let t277 = @term_syntax.parse_term("homogenize((b : Cart[Real, 2]))")
  let t301 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x275 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x269 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s270 = @tactics.mp_tac(x269)
      fn(x271 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s270(x271)
      }
    })((fn(x274 : @kernel.Term) -> @kernel.Thm raise {
      (fn(x272 : @kernel.Term) -> ((@kernel.Thm) -> @kernel.Thm raise) raise {
        fn(x273 : @kernel.Thm) -> @kernel.Thm raise {
          @bool.spec(x272, x273)
        }
      })(x274)(parallel_projp_homop())
    })(x275))
  }, @list.List([@term_syntax.parse_term("homogenize((a : Cart[Real, 2]))"), t277, t276])), t287), t298), t299), t300)
  let t268 = @tactics.conv_tac(@calc_rat.real_ring)
  let t302 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([homogenize(), @vectors.dot_2(), @vectors.vector_sub_component(), @determinants.det_3(), @vectors.vector_3()])), t268), t301])
  let t267 = @tactics.exists_tac(@term_syntax.parse_term("det(vector([homogenize((a : Cart[Real, 2])), homogenize((b : Cart[Real, 2])), homogenize((c : Cart[Real, 2]))])) == real_of_num(0)"))
  let t266 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t265 = @simp.rewrite_tac(@list.List([collinear_bracket(), projectivize(), @trivia.o_thm(), bracket()]))
  let t264 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dot_cauchy_schwarz_equal())]))
  let t263 = @simp.once_rewrite_tac(@list.List([@vectors.collinear_3()]))
  let t303 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t263), t264), t265), t266), t267), @tactics.conj_tac), t302)
  collinear_projectivize_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], collinear({a, b, c}) == COLLINEAR({projectivize(a), projectivize(b), projectivize(c)})"), t303))
}

///|
let collinear_projectivize_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_PROJECTIVIZE")

///|
/// `COLLINEAR_PROJECTIVIZE`
pub fn collinear_projectivize() -> @kernel.Thm {
  collinear_projectivize_c.get()
}

///|
/// AFFINE_PROJECTIVE_CONIC
fn step_63() -> Unit raise {
  let t328 = @tactics.conv_tac(@calc_rat.real_ring)
  let t327 = @tactics.undisch_tac(@term_syntax.parse_term("!((k : Real) == real_of_num(0))"))
  let t326 = @simp.rewrite_tac(@list.List([homogenize(), @vectors.vector_3()]))
  let t325 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.vector_mul_component()]))
  let t324 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(k : Real)"))(@tactics.strip_assume_tac))
  let t321 = @drule.match_mp(parallel_projp_homop_explicit())
  let t323 = @tactics.disch_then(fn(x322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x318 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s319 = @tactics.mp_tac(x318)
      fn(x320 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s319(x320)
      }
    })(t321(x322))
  })
  let t317 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Cart[Real, 2])"), homogenize_nonzero()))
  let t316 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, 2])"))
  let t315 = @simp.rewrite_tac(@list.List([@sets.extension()]))
  let t314 = @list.List([@tactics.conv_tac(@class.taut), @tactics.ap_term_tac])
  let t313 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), projectivize(), @trivia.o_thm()]))
  let t312 = @simp.rewrite_tac(@list.List([@theorems.right_exists_and_thm(), @theorems.unwind_thm2(), @equal.gsym(@theorems.conj_assoc())]))
  let t311 = @tactics.map_every(fn(x306 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s = x306
    let t310 = @simp.rewrite_tac(@list.List([]))
    let t309 = @tactics.x_gen_tac(@kernel.mk_var(s, @parser.parse_type("real")))
    @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.gen_rewrite_tac(fn(x308 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x308
    }, @list.List([@class.fun_eq_thm()]))), t309), t310)
  }, @list.List(["a", "b", "c", "d", "e", "f"]))
  let t305 = @simp.once_rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ con' : _, ∃ con : _, ∃ a : _, ∃ b : _, ∃ c : _, ∃ d : _, ∃ e : _, ∃ f : _, (P : (_, _, _, _, _, _, _, _) -> Bool)(con', con, a, b, c, d, e, f)) == (∃ a : _, ∃ b : _, ∃ d : _, ∃ e : _, ∃ f : _, ∃ c : _, ∃ con' : _, ∃ con : _, P(con', con, a, b, c, d, e, f))"))]))
  let t304 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t329 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([affine_conic(), projective_conic(), homogeneous_conic()])), @tactics.gen_tac), t304), t305), t311), t312), t313), @tactics.binop_tac), t314), t315), t316), t317), t323), t324), t325), t326), t327), t328)
  affine_projective_conic_c.set(@tactics.prove(@term_syntax.parse_term("∀ con : (Cart[Real, 2]) -> Bool, affine_conic(con) == (∃ con' : (Point) -> Bool, projective_conic(con') && con == {(x : Cart[Real, 2]) | IN(projectivize(x), con')})"), t329))
}

///|
let affine_projective_conic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AFFINE_PROJECTIVE_CONIC")

///|
/// `AFFINE_PROJECTIVE_CONIC`
pub fn affine_projective_conic() -> @kernel.Thm {
  affine_projective_conic_c.get()
}

///|
/// PASCAL_AFFINE
fn step_64() -> Unit raise {
  let t343 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t342 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t341 = @tactics.first_x_assum(@tactics.conjuncts_then2(fn(x335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s336 = @tactics.mp_tac(x335)
    fn(x337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s336(x337)
    }
  }, fn(x338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s339 = @tactics.assume_tac(x338)
    fn(x340 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s339(x340)
    }
  }))
  let t334 = @simp.asm_rewrite_tac(@list.List([]))
  let t331 = @drule.match_mp(pascal())
  let t333 = @tactics.first_x_assum(fn(x332 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t331(x332))
  })
  let t330 = @tactics.repeat_tac(@tactics.orelse_tac(@tactics.gen_tac, @tactics.disch_tac))
  let t344 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([collinear_projectivize(), affine_projective_conic()])), t330), t333), t334), t341), t342), t343)
  pascal_affine_c.set(@tactics.prove(@term_syntax.parse_term("∀ con : (Cart[Real, 2]) -> Bool, ∀ x1 : Cart[Real, 2], ∀ x2 : Cart[Real, 2], ∀ x3 : Cart[Real, 2], ∀ x4 : Cart[Real, 2], ∀ x5 : Cart[Real, 2], ∀ x6 : Cart[Real, 2], ∀ x7 : Cart[Real, 2], ∀ x8 : Cart[Real, 2], ∀ x9 : Cart[Real, 2], !collinear({x1, x2, x4}) && !collinear({x1, x2, x5}) && !collinear({x1, x2, x6}) && !collinear({x1, x3, x4}) && !collinear({x1, x3, x5}) && !collinear({x1, x3, x6}) && !collinear({x2, x3, x4}) && !collinear({x2, x3, x5}) && !collinear({x2, x3, x6}) && !collinear({x4, x5, x1}) && !collinear({x4, x5, x2}) && !collinear({x4, x5, x3}) && !collinear({x4, x6, x1}) && !collinear({x4, x6, x2}) && !collinear({x4, x6, x3}) && !collinear({x5, x6, x1}) && !collinear({x5, x6, x2}) && !collinear({x5, x6, x3}) → affine_conic(con) && IN(x1, con) && IN(x2, con) && IN(x3, con) && IN(x4, con) && IN(x5, con) && IN(x6, con) && collinear({x1, x9, x5}) && collinear({x1, x8, x6}) && collinear({x2, x9, x4}) && collinear({x2, x7, x6}) && collinear({x3, x8, x4}) && collinear({x3, x7, x5}) → collinear({x7, x8, x9})"), t344))
}

///|
let pascal_affine_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASCAL_AFFINE")

///|
/// `PASCAL_AFFINE`
pub fn pascal_affine() -> @kernel.Thm {
  pascal_affine_c.get()
}

///|
/// COLLINEAR_NOT_COCIRCULAR
fn step_65() -> Unit raise {
  let t349 = @tactics.conv_tac(@calc_rat.real_ring)
  let t348 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.norm_eq_square(), @cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.dot_2(), @vectors.vector_sub_component()]))
  let t347 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dot_cauchy_schwarz_equal()), @vectors.dot_2()]))
  let t346 = @simp.once_rewrite_tac(@list.List([@vectors.collinear_3()]))
  let t345 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dot_eq_0())]))
  let t350 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.vector_sub_eq())])), t345), t346), t347), t348), t349)
  collinear_not_cocircular_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Real, ∀ c : Cart[Real, 2], ∀ x : Cart[Real, 2], ∀ y : Cart[Real, 2], ∀ z : Cart[Real, 2], distance((c, x)) == r && distance((c, y)) == r && distance((c, z)) == r && !(x == y) && !(x == z) && !(y == z) → !collinear({x, y, z})"), t350))
}

///|
let collinear_not_cocircular_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_NOT_COCIRCULAR")

///|
/// `COLLINEAR_NOT_COCIRCULAR`
pub fn collinear_not_cocircular() -> @kernel.Thm {
  collinear_not_cocircular_c.get()
}

///|
/// PASCAL_AFFINE_CIRCLE
fn step_66() -> Unit raise {
  let t380 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()]))
  let t379 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t381 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.replicate_tac(5, @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)"))), t379), t380), @calc_rat.real_arith_tac)
  let t378 = @simp.rewrite_tac(@list.List([@vectors.dot_2(), @vectors.vector_sub_component()]))
  let t377 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()]))
  let t372 = @term_syntax.parse_term("pow(op_dollar((c : Cart[Real, 2]), 1), 2) + (pow(op_dollar(c, 2), 2) - pow((r : Real), 2))")
  let t373 = @term_syntax.parse_term("-real_of_num(2) * op_dollar((c : Cart[Real, 2]), 2)")
  let t374 = @term_syntax.parse_term("-real_of_num(2) * op_dollar((c : Cart[Real, 2]), 1)")
  let t375 = @term_syntax.parse_term("real_of_num(0)")
  let t376 = @term_syntax.parse_term("real_of_num(1)")
  let t382 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x369 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s370 = @tactics.exists_tac(x369)
    fn(x371 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s370(x371)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(1)"), t376, t375, t374, t373, t372])), t377), t378), @calc_rat.real_arith_tac), t381])
  let t368 = @simp.asm_rewrite_tac(@list.List([]))
  let t367 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) <= (r : Real)"))
  let t383 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([affine_conic(), @vectors.dist(), @vectors.norm_eq_square()])), t367), t368), t382)
  let t366 = @simp.asm_rewrite_tac(@list.List([]))
  let t364 = @term_syntax.parse_term("(c : Cart[Real, 2])")
  let t365 = @tactics.map_every(fn(x361 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s362 = @tactics.exists_tac(x361)
    fn(x363 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s362(x363)
    }
  }, @list.List([@term_syntax.parse_term("(r : Real)"), t364]))
  let t360 = @tactics.match_mp_tac(collinear_not_cocircular())
  let t384 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t360), t365), t366), t383])
  let t359 = @simp.asm_rewrite_tac(@list.List([]))
  let t358 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t357 = @simp.gen_rewrite_tac(fn(x354 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s355 = @equal.land_conv(x354)
    fn(x356 : @kernel.Term) -> @kernel.Thm raise {
      s355(x356)
    }
  }, @list.List([@theorems.imp_imp()]))
  let t353 = @simp.rewrite_tac(@list.List([@lists.pairwise(), @lists.all(), @sets.in_elim_thm()]))
  let t352 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t351 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("{(x : Cart[Real, 2]) | distance(((c : Cart[Real, 2]), x)) == (r : Real)}"), pascal_affine()))
  let t385 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), t351), t352), t353), t357), @tactics.disch_tac), @tactics.strip_tac), t358), t359), @tactics.conj_tac), t384)
  pascal_affine_circle_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Cart[Real, 2], ∀ r : Real, ∀ x1 : Cart[Real, 2], ∀ x2 : Cart[Real, 2], ∀ x3 : Cart[Real, 2], ∀ x4 : Cart[Real, 2], ∀ x5 : Cart[Real, 2], ∀ x6 : Cart[Real, 2], ∀ x7 : Cart[Real, 2], ∀ x8 : Cart[Real, 2], ∀ x9 : Cart[Real, 2], PAIRWISE((x : Cart[Real, 2]) => (y : Cart[Real, 2]) => !(x == y), [x1, x2, x3, x4, x5, x6]) && distance((c, x1)) == r && distance((c, x2)) == r && distance((c, x3)) == r && distance((c, x4)) == r && distance((c, x5)) == r && distance((c, x6)) == r && collinear({x1, x9, x5}) && collinear({x1, x8, x6}) && collinear({x2, x9, x4}) && collinear({x2, x7, x6}) && collinear({x3, x8, x4}) && collinear({x3, x7, x5}) → collinear({x7, x8, x9})"), t385))
}

///|
let pascal_affine_circle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PASCAL_AFFINE_CIRCLE")

///|
/// `PASCAL_AFFINE_CIRCLE`
pub fn pascal_affine_circle() -> @kernel.Thm {
  pascal_affine_circle_c.get()
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
}
