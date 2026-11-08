// Translated from upstream 100/desargues.ml; edit this file directly.

///|
/// NORMAL_EXISTS
fn step_1() -> Unit raise {
  let t8 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_insert(), @sets.finite_empty()]))
  let t7 = @simp.simp_tac(@list.List([@vectors.dim_le_card(), @sets.finite_insert(), @sets.finite_empty()]))
  let t6 = @tactics.exists_tac(@term_syntax.parse_term("CARD(INSERT((u : Cart[Real, 3]), INSERT((v : Cart[Real, 3]), EMPTY)))"))
  let t5 = @tactics.match_mp_tac(@arith.let_trans())
  let t4 = @tactics.disch_then(@tactics.match_mp_tac)
  let t3 = @simp.rewrite_tac(@list.List([@sets.forall_in_insert(), @sets.not_in_empty(), @cart.dimindex_3()]))
  let t2 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("INSERT((u : Cart[Real, 3]), INSERT((v : Cart[Real, 3]), EMPTY))"), @vectors.orthogonal_to_subspace_exists()))
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
/// 100/desargues.ml:28
fn step_3() -> Unit raise {
  @printer.parse_as_infix("||", (11L, "right"))
}

///|
/// 100/desargues.ml:29
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
/// 100/desargues.ml:120
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
  collinear_singleton_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Point, COLLINEAR(INSERT(a, EMPTY))"), t150))
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
  collinear_pair_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Point, ∀ b : Point, COLLINEAR(INSERT(a, INSERT(b, EMPTY)))"), t155))
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
  collinear_triple_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Point, ∀ b : Point, ∀ c : Point, COLLINEAR(INSERT(a, INSERT(b, INSERT(c, EMPTY)))) == (∃ l : Line, on(a, l) && on(b, l) && on(c, l))"), t156))
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
  collinear_bracket_c.set(@tactics.prove(@term_syntax.parse_term("∀ p1 : Point, ∀ p2 : Point, ∀ p3 : Point, COLLINEAR(INSERT(p1, INSERT(p2, INSERT(p3, EMPTY)))) == (bracket([p1, p2, p3]) == real_of_num(0))"), t187))
}

///|
let collinear_bracket_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR_BRACKET")

///|
/// `COLLINEAR_BRACKET`
pub fn collinear_bracket() -> @kernel.Thm {
  collinear_bracket_c.get()
}

///|
let bracket_swap_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BRACKET_SWAP")

///|
/// `BRACKET_SWAP`
pub fn bracket_swap() -> @kernel.Thm {
  bracket_swap_c.get()
}

///|
let bracket_shuffle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BRACKET_SHUFFLE")

///|
/// `BRACKET_SHUFFLE`
pub fn bracket_shuffle() -> @kernel.Thm {
  bracket_shuffle_c.get()
}

///|
/// BRACKET_SWAP, BRACKET_SHUFFLE
fn step_52() -> Unit raise {
  let t189 = @tactics.conv_tac(@calc_rat.real_ring)
  let t190 = @tactics.then_tac(@simp.rewrite_tac(@list.List([bracket(), @determinants.det_3(), @vectors.vector_3()])), t189)
  let t191 = (@term_syntax.parse_term("bracket([(x : Point), (y : Point), (z : Point)]) == -bracket([x, z, y]) && bracket([x, y, z]) == bracket([y, z, x]) && bracket([x, y, z]) == bracket([z, x, y])"), t190)
  let (bracket_swap, bracket_shuffle) = @bool.conj_pair((fn(x188 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x188.0, x188.1)
  })(t191))
  bracket_swap_c.set(bracket_swap)
  bracket_shuffle_c.set(bracket_shuffle)
}

///|
/// BRACKET_SWAP_CONV
fn step_53() -> Unit raise {
  let conv : (@kernel.Term) -> @kernel.Thm raise = @simp.gen_rewrite_conv(fn(x192 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x192
  }, @list.List([bracket_swap()]))
  bracket_swap_conv_c.set(fn(x193 : @kernel.Term) -> @kernel.Thm raise {
    let tm = x193
    let th = conv(tm)
    let tm_p = @kernel.rand(@kernel.rand(@kernel.concl(th)))
    if @simp.term_order(tm, tm_p) {
      th
    } else {
      raise Failure("BRACKET_SWAP_CONV")
    }
  })
}

///|
let bracket_swap_conv_c : @lib.Cell[(@kernel.Term) -> @kernel.Thm raise] = @lib.Cell::new("BRACKET_SWAP_CONV")

///|
/// `BRACKET_SWAP_CONV`
pub fn bracket_swap_conv(x : @kernel.Term) -> @kernel.Thm raise {
  (bracket_swap_conv_c.get())(x)
}

///|
/// DESARGUES_DIRECT
fn step_54() -> Unit raise {
  let t238 = @tactics.conv_tac(@calc_rat.real_ring)
  let t237 = @simp.rewrite_tac(@list.List([bracket(), @determinants.det_3(), @vectors.vector_3()]))
  let t236 = @tactics.first_x_assum(fn(x235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s233 = @tactics.mp_tac(x232)
      fn(x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s233(x234)
      }
    })(@bool.conjunct1(x235))
  })
  let t230 = @tactics.conv_tac(@calc_rat.real_ring)
  let t231 = @list.List([@tactics.then_tac(@tactics.pop_assum(fn(x227 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s228 = @tactics.mp_tac(x227)
    fn(x229 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s228(x229)
    }
  }), t230), @tactics.all_tac])
  let t226 = @tactics.exists_tac(@term_syntax.parse_term("bracket([(B : Point), (Q : Point), (S : Point)]) * bracket([(A' : Point), (R : Point), S]) == bracket([B, R, S]) * bracket([A', Q, S])"))
  let t225 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("∀ b : Bool, ((a : Bool) → b) && (b → (c : Bool)) → a → c")))
  let t224 = @simp.rewrite_tac(@list.List([@calc_int.real_neg_neg(), @real.real_neg_eq_0()]))
  let t223 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc()), @calc_int.real_mul_lneg(), @calc_int.real_mul_rneg()]))
  let t222 = @tactics.conv_tac(@equal.once_depth_conv(bracket_swap_conv))
  let t221 = @simp.rewrite_tac(@list.List([bracket_shuffle()]))
  let t220 = @tactics.pop_assum(fn(x217 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s218 = @tactics.mp_tac(x217)
    fn(x219 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s218(x219)
    }
  })
  let t213 = @drule.match_mp(@calc_rat.real_ring(@term_syntax.parse_term("(a : Real) == (b : Real) && (x : Real) == (y : Real) → a * x == b * y")))
  let t215 = @tactics.disch_then(fn(x214 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s211 = @tactics.mp_tac(x210)
      fn(x212 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s211(x212)
      }
    })(t213(x214))
  })
  let t216 = @tactics.repeat_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.imp_imp()])), t215))
  let t209 = @tactics.disch_then(fn(x202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x202
    let t207 = @drule.match_mp(th)
    @tactics.disch_then(fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s205 = @tactics.mp_tac(x204)
        fn(x206 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s205(x206)
        }
      })(t207(x208))
    })
  })
  let t201 = @tactics.repeat_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((c : Bool) → (d : Bool) → (b : Bool) → (e : Bool)) → ((a : Bool) → b) && c → a && d → e"))))
  let t199 = @tactics.conv_tac(@calc_rat.real_ring)
  let t200 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([bracket(), @determinants.det_3(), @vectors.vector_3()])), t199), @tactics.all_tac])
  let t198 = @tactics.subgoal_then(@term_syntax.parse_term("(bracket([(P : Point), (A' : Point), (A : Point)]) == real_of_num(0) → bracket([P, A', (R : Point)]) * bracket([P, A, (C : Point)]) == bracket([P, A', C]) * bracket([P, A, R])) && (bracket([P, (B : Point), (B' : Point)]) == real_of_num(0) → bracket([P, B, (Q : Point)]) * bracket([P, B', (C' : Point)]) == bracket([P, B, C']) * bracket([P, B', Q])) && (bracket([P, C', C]) == real_of_num(0) → bracket([P, C', B]) * bracket([P, C, A']) == bracket([P, C', A']) * bracket([P, C, B])) && (bracket([B, C, Q]) == real_of_num(0) → bracket([B, C, P]) * bracket([B, Q, (S : Point)]) == bracket([B, C, S]) * bracket([B, Q, P])) && (bracket([B', C', Q]) == real_of_num(0) → bracket([B', C', A']) * bracket([B', Q, P]) == bracket([B', C', P]) * bracket([B', Q, A'])) && (bracket([A, R, C]) == real_of_num(0) → bracket([A, R, P]) * bracket([A, C, B]) == bracket([A, R, B]) * bracket([A, C, P])) && (bracket([A', C', R]) == real_of_num(0) → bracket([A', C', P]) * bracket([A', R, S]) == bracket([A', C', S]) * bracket([A', R, P])) && (bracket([B, S, A]) == real_of_num(0) → bracket([B, S, C]) * bracket([B, A, R]) == bracket([B, S, R]) * bracket([B, A, C])) && (bracket([A', S, B']) == real_of_num(0) → bracket([A', S, C']) * bracket([A', B', Q]) == bracket([A', S, Q]) * bracket([A', B', C']))"), fn(x195 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s196 = @tactics.mp_tac(x195)
    fn(x197 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s196(x197)
    }
  })
  let t194 = @simp.rewrite_tac(@list.List([collinear_bracket()]))
  let t239 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t194), @tactics.disch_tac), t198), t200), t201), t209), t216), t220), t221), t222), t223), t224), @tactics.disch_tac), t225), t226), @tactics.conj_tac), t231), t236), t237), t238)
  desargues_direct_c.set(@tactics.prove(@term_syntax.parse_term("!COLLINEAR(INSERT((A' : Point), INSERT((B : Point), INSERT((S : Point), EMPTY)))) && !COLLINEAR(INSERT((A : Point), INSERT((P : Point), INSERT((C : Point), EMPTY)))) && !COLLINEAR(INSERT(A, INSERT(P, INSERT((R : Point), EMPTY)))) && !COLLINEAR(INSERT(A, INSERT(C, INSERT(B, EMPTY)))) && !COLLINEAR(INSERT(A, INSERT(B, INSERT(R, EMPTY)))) && !COLLINEAR(INSERT((C' : Point), INSERT(P, INSERT(A', EMPTY)))) && !COLLINEAR(INSERT(C', INSERT(P, INSERT(B, EMPTY)))) && !COLLINEAR(INSERT(C', INSERT(P, INSERT((B' : Point), EMPTY)))) && !COLLINEAR(INSERT(C', INSERT(A', INSERT(S, EMPTY)))) && !COLLINEAR(INSERT(C', INSERT(A', INSERT(B', EMPTY)))) && !COLLINEAR(INSERT(P, INSERT(C, INSERT(A', EMPTY)))) && !COLLINEAR(INSERT(P, INSERT(C, INSERT(B, EMPTY)))) && !COLLINEAR(INSERT(P, INSERT(A', INSERT(R, EMPTY)))) && !COLLINEAR(INSERT(P, INSERT(B, INSERT((Q : Point), EMPTY)))) && !COLLINEAR(INSERT(P, INSERT(Q, INSERT(B', EMPTY)))) && !COLLINEAR(INSERT(C, INSERT(B, INSERT(S, EMPTY)))) && !COLLINEAR(INSERT(A', INSERT(Q, INSERT(B', EMPTY)))) → COLLINEAR(INSERT(P, INSERT(A', INSERT(A, EMPTY)))) && COLLINEAR(INSERT(P, INSERT(B, INSERT(B', EMPTY)))) && COLLINEAR(INSERT(P, INSERT(C', INSERT(C, EMPTY)))) && COLLINEAR(INSERT(B, INSERT(C, INSERT(Q, EMPTY)))) && COLLINEAR(INSERT(B', INSERT(C', INSERT(Q, EMPTY)))) && COLLINEAR(INSERT(A, INSERT(R, INSERT(C, EMPTY)))) && COLLINEAR(INSERT(A', INSERT(C', INSERT(R, EMPTY)))) && COLLINEAR(INSERT(B, INSERT(S, INSERT(A, EMPTY)))) && COLLINEAR(INSERT(A', INSERT(S, INSERT(B', EMPTY)))) → COLLINEAR(INSERT(Q, INSERT(S, INSERT(R, EMPTY))))"), t239))
}

///|
let desargues_direct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DESARGUES_DIRECT")

///|
/// `DESARGUES_DIRECT`
pub fn desargues_direct() -> @kernel.Thm {
  desargues_direct_c.get()
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
}
