// Translated from upstream Tutorial/Defining_new_types.ml; edit this file directly.

///|
/// direction_tybij
fn step_1() -> Unit raise {
  direction_tybij_c.set(@class.new_type_definition("direction", ("mk_dir", "dest_dir"), @meson.meson(@list.List([@Vectors.lemma_0()]), @term_syntax.parse_term("∃ x : Cart[Real, 3], !(x == vec(0))"))))
}

///|
let direction_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("direction_tybij")

///|
/// `direction_tybij`
pub fn direction_tybij() -> @kernel.Thm {
  direction_tybij_c.get()
}

///|
/// Tutorial/Defining_new_types.ml:6
fn step_2() -> Unit raise {
  @printer.parse_as_infix("||", (11L, "right"))
}

///|
/// Tutorial/Defining_new_types.ml:7
fn step_3() -> Unit raise {
  @printer.parse_as_infix("_|_", (11L, "right"))
}

///|
/// perpdir
fn step_4() -> Unit raise {
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
fn step_5() -> Unit raise {
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
fn step_6() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([direction_tybij()]))
  direction_clauses_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Direction, (P : (Cart[Real, 3]) -> Bool)(dest_dir(x))) == (∀ x : Cart[Real, 3], !(x == vec(0)) → P(x)) && (∃ x : Direction, P(dest_dir(x))) == (∃ x : Cart[Real, 3], !(x == vec(0)) && P(x))"), t1))
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
fn step_7() -> Unit raise {
  let t3 = @tactics.then_tac(@simp.rewrite_tac(@list.List([pardir(), direction_clauses()])), @Vectors.vec3_tac)
  let t4 = (@term_syntax.parse_term("(∀ x : Direction, op_bar_bar(x, x)) && (∀ x : Direction, ∀ y : Direction, op_bar_bar(x, y) == op_bar_bar(y, x)) && (∀ x : Direction, ∀ y : Direction, ∀ z : Direction, op_bar_bar(x, y) && op_bar_bar(y, z) → op_bar_bar(x, z))"), t3)
  match @bool.conjuncts_rule((fn(x2 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x2.0, x2.1)
  })(t4)) {
    More(pardir_refl, tail=More(pardir_sym, tail=More(pardir_trans, tail=Empty))) => {
      pardir_refl_c.set(pardir_refl)
      pardir_sym_c.set(pardir_sym)
      pardir_trans_c.set(pardir_trans)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:20:4")
  }
}

///|
/// DIRECTION_AXIOM_1
fn step_8() -> Unit raise {
  let t14 = @tactics.pop_assum_list(fn(x13 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s10 = @tactics.mp_tac(x9)
      fn(x11 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s10(x11)
      }
    })(((x12 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x12))(x13))
  })
  let t8 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t6 = @term_syntax.parse_term("(p' : Cart[Real, 3])")
  let t7 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Cart[Real, 3])"), t6]), @Vectors.normal_exists()))
  let t5 = @tactics.repeat_tac(@tactics.strip_tac)
  let t15 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([perpdir(), pardir(), direction_clauses()])), t5), t7), t8), t14), @Vectors.vec3_tac)
  direction_axiom_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Direction, ∀ p' : Direction, !op_bar_bar(p, p') → (∃ l : Direction, op_us_bar_us(p, l) && op_us_bar_us(p', l) && (∀ l' : Direction, op_us_bar_us(p, l') && op_us_bar_us(p', l') → op_bar_bar(l', l)))"), t15))
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
fn step_9() -> Unit raise {
  let t16 = @meson.meson_tac(@list.List([@Vectors.normal_exists(), @vectors.orthogonal_sym()]))
  let t17 = @tactics.then_tac(@simp.rewrite_tac(@list.List([perpdir(), direction_clauses()])), t16)
  direction_axiom_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Direction, ∀ l' : Direction, ∃ p : Direction, op_us_bar_us(p, l) && op_us_bar_us(p, l')"), t17))
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
fn step_10() -> Unit raise {
  let t21 = @term_syntax.parse_term("(basis : (Num) -> Cart[Real, 3])(3)")
  let t22 = @term_syntax.parse_term("(basis : (Num) -> Cart[Real, 3])(2)")
  let t23 = @tactics.map_every(fn(x18 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x18
    let t20 = @simp.rewrite_tac(@list.List([@Vectors.lemma_0()]))
    @tactics.then_tac(@rqe_tactics_ext.exists_tac(t), t20)
  }, @list.List([@term_syntax.parse_term("(basis : (Num) -> Cart[Real, 3])(1)"), t22, t21]))
  let t24 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([perpdir(), pardir(), direction_clauses()])), t23), @Vectors.vec3_tac)
  direction_axiom_3_c.set(@tactics.prove(@term_syntax.parse_term("∃ p : Direction, ∃ p' : Direction, ∃ p'' : Direction, !op_bar_bar(p, p') && !op_bar_bar(p', p'') && !op_bar_bar(p, p'') && !(∃ l : Direction, op_us_bar_us(p, l) && op_us_bar_us(p', l) && op_us_bar_us(p'', l))"), t24))
}

///|
let direction_axiom_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIRECTION_AXIOM_3")

///|
/// `DIRECTION_AXIOM_3`
pub fn direction_axiom_3() -> @kernel.Thm {
  direction_axiom_3_c.get()
}

///|
/// CROSS_0
fn step_11() -> Unit raise {
  cross_0_c.set(@Vectors.vec3_rule(@term_syntax.parse_term("cross((x : Cart[Real, 3]), vec(0)) == vec(0) && cross(vec(0), x) == vec(0)")))
}

///|
let cross_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_0")

///|
/// `CROSS_0`
pub fn cross_0() -> @kernel.Thm {
  cross_0_c.get()
}

///|
/// DIRECTION_AXIOM_4_WEAK
fn step_12() -> Unit raise {
  let t33 = @meson.meson_tac(@list.List([cross_0()]))
  let t34 = @list.List([@tactics.then_tac(@tactics.pop_assum(fn(x30 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s31 = @tactics.mp_tac(x30)
    fn(x32 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s31(x32)
    }
  }), @Vectors.vec3_tac), t33])
  let t29 = @tactics.subgoal_then(@term_syntax.parse_term("orthogonal(cross((l : Cart[Real, 3]), basis(1)), l) && orthogonal(cross(l, basis(2)), l) && !(cross(cross(l, basis(1)), cross(l, basis(2))) == vec(0)) || orthogonal(cross(l, basis(1)), l) && orthogonal(cross(l, basis(3)), l) && !(cross(cross(l, basis(1)), cross(l, basis(3))) == vec(0)) || orthogonal(cross(l, basis(2)), l) && orthogonal(cross(l, basis(3)), l) && !(cross(cross(l, basis(2)), cross(l, basis(3))) == vec(0))"), fn(x26 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s27 = @tactics.mp_tac(x26)
    fn(x28 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s27(x28)
    }
  })
  let t25 = @tactics.repeat_tac(@tactics.strip_tac)
  let t35 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([direction_clauses(), pardir(), perpdir()])), t25), t29), t34)
  direction_axiom_4_weak_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Direction, ∃ p : Direction, ∃ p' : Direction, !op_bar_bar(p, p') && op_us_bar_us(p, l) && op_us_bar_us(p', l)"), t35))
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
fn step_13() -> Unit raise {
  let t43 = @tactics.pop_assum_list(fn(x42 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x38 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s39 = @tactics.mp_tac(x38)
      fn(x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s39(x40)
      }
    })(((x41 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x41))(x42))
  })
  let t37 = @rqe_tactics_ext.exists_tac(@term_syntax.parse_term("(a : Cart[Real, 3]) + (b : Cart[Real, 3])"))
  let t36 = @tactics.repeat_tac(@tactics.strip_tac)
  let t44 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([direction_clauses(), pardir(), perpdir()])), t36), t37), t43), @Vectors.vec3_tac)
  orthogonal_combine_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Direction, ∀ a : Direction, ∀ b : Direction, op_us_bar_us(a, x) && op_us_bar_us(b, x) && !op_bar_bar(a, b) → (∃ c : Direction, op_us_bar_us(c, x) && !op_bar_bar(a, c) && !op_bar_bar(b, c))"), t44))
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
fn step_14() -> Unit raise {
  let t45 = @meson.meson_tac(@list.List([direction_axiom_4_weak(), orthogonal_combine()]))
  direction_axiom_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Direction, ∃ p : Direction, ∃ p' : Direction, ∃ p'' : Direction, !op_bar_bar(p, p') && !op_bar_bar(p', p'') && !op_bar_bar(p, p'') && op_us_bar_us(p, l) && op_us_bar_us(p', l) && op_us_bar_us(p'', l)"), t45))
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
fn step_15() -> Unit raise {
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
fn step_16() -> Unit raise {
  let t46 = @tactics.then_tac(@simp.rewrite_tac(@list.List([perpdir(), pardir(), direction_clauses()])), @Vectors.vec3_tac)
  perpdir_welldef_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Direction, ∀ y : Direction, ∀ x' : Direction, ∀ y' : Direction, op_bar_bar(x, x') && op_bar_bar(y, y') → op_us_bar_us(x, y) == op_us_bar_us(x', y')"), t46))
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
fn step_17() -> Unit raise {
  let (perpl, perpl_th) = @quot.lift_function(line_tybij().1)((pardir_refl(), pardir_trans()))("perpl")(perpdir_welldef())
  perpl_c.set(perpl)
  perpl_th_c.set(perpl_th)
}

///|
/// line_lift_thm
fn step_18() -> Unit raise {
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
fn step_19() -> Unit raise {
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
fn step_20() -> Unit raise {
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
fn step_21() -> Unit raise {
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
fn step_22() -> Unit raise {
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
fn step_23() -> Unit raise {
  let t47 = @simp.rewrite_tac(@list.List([]))
  point_tybij_c.set(@class.new_type_definition("point", ("mk_point", "dest_point"), @tactics.prove(@term_syntax.parse_term("∃ x : Line, true"), t47)))
}

///|
let point_tybij_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("point_tybij")

///|
/// `point_tybij`
pub fn point_tybij() -> @kernel.Thm {
  point_tybij_c.get()
}

///|
/// Tutorial/Defining_new_types.ml:95
fn step_24() -> Unit raise {
  @printer.parse_as_infix("on", (11L, "right"))
}

///|
/// on
fn step_25() -> Unit raise {
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
fn step_26() -> Unit raise {
  let t48 = @meson.meson_tac(@list.List([point_tybij()]))
  point_clauses_c.set(@tactics.prove(@term_syntax.parse_term("((p : Point) == (p' : Point)) == (dest_point(p) == dest_point(p')) && (∀ p : Point, (P : (Line) -> Bool)(dest_point(p))) == (∀ l : Line, P(l)) && (∃ p : Point, P(dest_point(p))) == (∃ l : Line, P(l))"), t48))
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
pub fn point_tac(x49 : @kernel.Thm) -> @tactics.Tactic raise {
  let th = x49
  let t51 = @tactics.accept_tac(th)
  @tactics.then_tac(@simp.rewrite_tac(@list.List([on(), point_clauses()])), t51)
}

///|
/// AXIOM_1
fn step_27() -> Unit raise {
  let t52 = point_tac(line_axiom_1())
  axiom_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Point, ∀ p' : Point, !(p == p') → (∃ l : Line, on(p, l) && on(p', l) && (∀ l' : Line, on(p, l') && on(p', l') → l' == l))"), t52))
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
fn step_28() -> Unit raise {
  let t53 = point_tac(line_axiom_2())
  axiom_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Line, ∀ l' : Line, ∃ p : Point, on(p, l) && on(p, l')"), t53))
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
fn step_29() -> Unit raise {
  let t54 = point_tac(line_axiom_3())
  axiom_3_c.set(@tactics.prove(@term_syntax.parse_term("∃ p : Point, ∃ p' : Point, ∃ p'' : Point, !(p == p') && !(p' == p'') && !(p == p'') && !(∃ l : Line, on(p, l) && on(p', l) && on(p'', l))"), t54))
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
fn step_30() -> Unit raise {
  let t55 = point_tac(line_axiom_4())
  axiom_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ l : Line, ∃ p : Point, ∃ p' : Point, ∃ p'' : Point, !(p == p') && !(p' == p'') && !(p == p'') && on(p, l) && on(p', l) && on(p'', l)"), t55))
}

///|
let axiom_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("AXIOM_4")

///|
/// `AXIOM_4`
pub fn axiom_4() -> @kernel.Thm {
  axiom_4_c.get()
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
