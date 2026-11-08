// Translated from upstream Tutorial/Inductive_datatypes.ml; edit this file directly.

///|
let line_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("line_INDUCT")

///|
/// `line_INDUCT`
pub fn line_induct() -> @kernel.Thm {
  line_induct_c.get()
}

///|
let line_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("line_RECURSION")

///|
/// `line_RECURSION`
pub fn line_recursion() -> @kernel.Thm {
  line_recursion_c.get()
}

///|
/// line_INDUCT, line_RECURSION
fn step_1() -> Unit raise {
  let (line_induct, line_recursion) = @ind_types.define_type("enum Line { Line_1; Line_2; Line_3; Line_4; Line_5; Line_6; Line_7 }")
  line_induct_c.set(line_induct)
  line_recursion_c.set(line_recursion)
}

///|
let point_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("point_INDUCT")

///|
/// `point_INDUCT`
pub fn point_induct() -> @kernel.Thm {
  point_induct_c.get()
}

///|
let point_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("point_RECURSION")

///|
/// `point_RECURSION`
pub fn point_recursion() -> @kernel.Thm {
  point_recursion_c.get()
}

///|
/// point_INDUCT, point_RECURSION
fn step_2() -> Unit raise {
  let (point_induct, point_recursion) = @ind_types.define_type("enum Point { Point_1; Point_2; Point_3; Point_4; Point_5; Point_6; Point_7 }")
  point_induct_c.set(point_induct)
  point_recursion_c.set(point_recursion)
}

///|
/// fano_incidence
fn step_3() -> Unit raise {
  fano_incidence_c.set(@list.List([(1L, 1L), (1L, 2L), (1L, 3L), (2L, 1L), (2L, 4L), (2L, 5L), (3L, 1L), (3L, 6L), (3L, 7L), (4L, 2L), (4L, 4L), (4L, 6L), (5L, 2L), (5L, 5L), (5L, 7L), (6L, 3L), (6L, 4L), (6L, 7L), (7L, 3L), (7L, 5L), (7L, 6L)]))
}

///|
let fano_incidence_c : @lib.Cell[@list.List[(Int64, Int64)]] = @lib.Cell::new("fano_incidence")

///|
/// `fano_incidence`
pub fn fano_incidence() -> @list.List[(Int64, Int64)] {
  fano_incidence_c.get()
}

///|
/// `fano_point`
pub fn fano_point(x1 : Int64) -> @kernel.Term raise {
  let i = x1
  @kernel.mk_const(("Point_" + Int64::to_string(i)), @list.List([]))
}

///|
/// `fano_line`
pub fn fano_line(x2 : Int64) -> @kernel.Term raise {
  let i = x2
  @kernel.mk_const(("Line_" + Int64::to_string(i)), @list.List([]))
}

///|
/// p
fn step_4() -> Unit raise {
  p_c.set(@term_syntax.parse_term("(p : Point)"))
}

///|
let p_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("p")

///|
/// `p`
pub fn p() -> @kernel.Term {
  p_c.get()
}

///|
/// l
fn step_5() -> Unit raise {
  l_c.set(@term_syntax.parse_term("(l : Line)"))
}

///|
let l_c : @lib.Cell[@kernel.Term] = @lib.Cell::new("l")

///|
/// `l`
pub fn l() -> @kernel.Term {
  l_c.get()
}

///|
/// `fano_clause`
pub fn fano_clause(x3 : Int64, x4 : Int64) -> @kernel.Term raise {
  let (i, j) = (x3, x4)
  let t5 = @basics.mk_eq(l(), fano_line(j))
  @bool.mk_conj(@basics.mk_eq(p(), fano_point(i)), t5)
}

///|
/// Tutorial/Inductive_datatypes.ml:19
fn step_6() -> Unit raise {
  @printer.parse_as_infix("ON", (11L, "right"))
}

///|
/// ON
fn step_7() -> Unit raise {
  let t7 = @bool.list_mk_disj(@lib.map(fn(x6 : (Int64, Int64)) -> @kernel.Term raise {
    fano_clause(x6.0, x6.1)
  }, fano_incidence()))
  on_c.set(@pair.new_definition(@basics.mk_eq(@term_syntax.parse_term("(ON : (Point, Line) -> Bool)((p : Point), (l : Line))"), t7)))
}

///|
let on_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ON")

///|
/// `ON`
pub fn on() -> @kernel.Thm {
  on_c.get()
}

///|
/// ON_CLAUSES
fn step_8() -> Unit raise {
  let t14 = @ind_types.distinctness("point")
  let t15 = @simp.rewrite_tac(@list.List([on(), @ind_types.distinctness("line"), t14]))
  let t13 = @lib.range(1L, 7L)
  on_clauses_c.set(@tactics.prove(@bool.list_mk_conj(@lib.allpairs(fn(x8 : Int64, x9 : Int64) -> @kernel.Term raise {
    let i = x8
    let j = x9
    let t12 = if @lib.mem((i, j), fano_incidence()) {
      @term_syntax.parse_term("true")
    } else {
      @term_syntax.parse_term("false")
    }
    let t11 = fano_line(j)
    let t10 = fano_point(i)
    @basics.mk_eq(@kernel.mk_comb(@kernel.mk_comb(@term_syntax.parse_term("ON"), t10), t11), t12)
  }, @lib.range(1L, 7L), t13)), t15))
}

///|
let on_clauses_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ON_CLAUSES")

///|
/// `ON_CLAUSES`
pub fn on_clauses() -> @kernel.Thm {
  on_clauses_c.get()
}

///|
/// FORALL_POINT
fn step_9() -> Unit raise {
  let t16 = @simp.rewrite_tac(@list.List([point_induct()]))
  let t17 = @tactics.thenl(@tactics.eq_tac, @list.List([@simp.simp_tac(@list.List([])), t16]))
  forall_point_c.set(@tactics.prove(@term_syntax.parse_term("(∀ p : Point, (P : (Point) -> Bool)(p)) == (P(Point_1) && P(Point_2) && P(Point_3) && P(Point_4) && P(Point_5) && P(Point_6) && P(Point_7))"), t17))
}

///|
let forall_point_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_POINT")

///|
/// `FORALL_POINT`
pub fn forall_point() -> @kernel.Thm {
  forall_point_c.get()
}

///|
/// FORALL_LINE
fn step_10() -> Unit raise {
  let t18 = @simp.rewrite_tac(@list.List([line_induct()]))
  let t19 = @tactics.thenl(@tactics.eq_tac, @list.List([@simp.simp_tac(@list.List([])), t18]))
  forall_line_c.set(@tactics.prove(@term_syntax.parse_term("(∀ p : Line, (P : (Line) -> Bool)(p)) == (P(Line_1) && P(Line_2) && P(Line_3) && P(Line_4) && P(Line_5) && P(Line_6) && P(Line_7))"), t19))
}

///|
let forall_line_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_LINE")

///|
/// `FORALL_LINE`
pub fn forall_line() -> @kernel.Thm {
  forall_line_c.get()
}

///|
/// EXISTS_POINT
fn step_11() -> Unit raise {
  let t20 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm(), @class.not_exists_thm(), forall_point()]))
  let t21 = @tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) == !(q : Bool) → p == q"))), t20)
  exists_point_c.set(@tactics.prove(@term_syntax.parse_term("(∃ p : Point, (P : (Point) -> Bool)(p)) == (P(Point_1) || P(Point_2) || P(Point_3) || P(Point_4) || P(Point_5) || P(Point_6) || P(Point_7))"), t21))
}

///|
let exists_point_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_POINT")

///|
/// `EXISTS_POINT`
pub fn exists_point() -> @kernel.Thm {
  exists_point_c.get()
}

///|
/// EXISTS_LINE
fn step_12() -> Unit raise {
  let t22 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm(), @class.not_exists_thm(), forall_line()]))
  let t23 = @tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) == !(q : Bool) → p == q"))), t22)
  exists_line_c.set(@tactics.prove(@term_syntax.parse_term("(∃ p : Line, (P : (Line) -> Bool)(p)) == (P(Line_1) || P(Line_2) || P(Line_3) || P(Line_4) || P(Line_5) || P(Line_6) || P(Line_7))"), t23))
}

///|
let exists_line_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EXISTS_LINE")

///|
/// `EXISTS_LINE`
pub fn exists_line() -> @kernel.Thm {
  exists_line_c.get()
}

///|
/// FANO_TAC
fn step_13() -> Unit raise {
  let t30 = @ind_types.distinctness("line")
  let t31 = @list.List([on_clauses(), @ind_types.distinctness("point"), t30])
  let t32 = @simp.gen_rewrite_tac(fn(x27 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s28 = @equal.depth_conv(x27)
    fn(x29 : @kernel.Term) -> @kernel.Thm raise {
      s28(x29)
    }
  }, @simp.basic_rewrites().concat(t31))
  fano_tac_c.set(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x24 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s25 = @equal.depth_conv(x24)
    fn(x26 : @kernel.Term) -> @kernel.Thm raise {
      s25(x26)
    }
  }, @list.List([forall_point(), exists_line(), exists_point(), forall_line()])), t32))
}

///|
let fano_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("FANO_TAC")

///|
/// `FANO_TAC`
pub fn fano_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (fano_tac_c.get())(x)
}

///|
/// `FANO_RULE`
pub fn fano_rule(x33 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x33
  @tactics.prove(tm, fano_tac)
}

///|
/// AXIOM_1
fn step_14() -> Unit raise {
  axiom_1_c.set(fano_rule(@term_syntax.parse_term("∀ p : Point, ∀ p' : Point, !(p == p') → (∃ l : Line, ON(p, l) && ON(p', l) && (∀ l' : Line, ON(p, l') && ON(p', l') → l' == l))")))
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
fn step_15() -> Unit raise {
  axiom_2_c.set(fano_rule(@term_syntax.parse_term("∀ l : Line, ∀ l' : Line, ∃ p : Point, ON(p, l) && ON(p, l')")))
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
fn step_16() -> Unit raise {
  axiom_3_c.set(fano_rule(@term_syntax.parse_term("∃ p : Point, ∃ p' : Point, ∃ p'' : Point, !(p == p') && !(p' == p'') && !(p == p'') && !(∃ l : Line, ON(p, l) && ON(p', l) && ON(p'', l))")))
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
fn step_17() -> Unit raise {
  axiom_4_c.set(fano_rule(@term_syntax.parse_term("∀ l : Line, ∃ p : Point, ∃ p' : Point, ∃ p'' : Point, !(p == p') && !(p' == p'') && !(p == p'') && ON(p, l) && ON(p', l) && ON(p'', l)")))
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
}
