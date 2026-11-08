// Translated from upstream Examples/ste.ml; edit this file directly.

///|
/// Examples/ste.ml:8
fn step_1() -> Unit raise {
  @printer.parse_as_infix("&&", (16L, "right"))
}

///|
/// Examples/ste.ml:9
fn step_2() -> Unit raise {
  @printer.parse_as_infix("<<=", (14L, "right"))
}

///|
/// Examples/ste.ml:10
fn step_3() -> Unit raise {
  @printer.parse_as_infix(">->", (13L, "right"))
}

///|
/// Examples/ste.ml:11
fn step_4() -> Unit raise {
  @printer.parse_as_infix(">~~>", (6L, "right"))
}

///|
let node_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("node_INDUCT")

///|
/// `node_INDUCT`
pub fn node_induct() -> @kernel.Thm {
  node_induct_c.get()
}

///|
let node_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("node_RECURSION")

///|
/// `node_RECURSION`
pub fn node_recursion() -> @kernel.Thm {
  node_recursion_c.get()
}

///|
/// node_INDUCT, node_RECURSION
fn step_5() -> Unit raise {
  let (node_induct, node_recursion) = @ind_types.define_type("enum Node { Node(Num) }")
  node_induct_c.set(node_induct)
  node_recursion_c.set(node_recursion)
}

///|
let propform_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("propform_INDUCT")

///|
/// `propform_INDUCT`
pub fn propform_induct() -> @kernel.Thm {
  propform_induct_c.get()
}

///|
let propform_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("propform_RECURSION")

///|
/// `propform_RECURSION`
pub fn propform_recursion() -> @kernel.Thm {
  propform_recursion_c.get()
}

///|
/// propform_INDUCT, propform_RECURSION
fn step_6() -> Unit raise {
  let (propform_induct, propform_recursion) = @ind_types.define_type("enum Propform { Propform(((Num) -> Bool) -> Bool) }")
  propform_induct_c.set(propform_induct)
  propform_recursion_c.set(propform_recursion)
}

///|
/// eval
fn step_7() -> Unit raise {
  let t1 = @term_syntax.parse_term("(eval : (Propform, (Num) -> Bool) -> Bool)(Propform((p : ((Num) -> Bool) -> Bool)), (v : (Num) -> Bool)) == p(v)")
  eval_c.set(@recursion.new_recursive_definition(propform_recursion())(t1))
}

///|
let eval_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("eval")

///|
/// `eval`
pub fn eval() -> @kernel.Thm {
  eval_c.get()
}

///|
let quat_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_INDUCT")

///|
/// `quat_INDUCT`
pub fn quat_induct() -> @kernel.Thm {
  quat_induct_c.get()
}

///|
let quat_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_RECURSION")

///|
/// `quat_RECURSION`
pub fn quat_recursion() -> @kernel.Thm {
  quat_recursion_c.get()
}

///|
/// quat_INDUCT, quat_RECURSION
fn step_8() -> Unit raise {
  let (quat_induct, quat_recursion) = @ind_types.define_type("enum Quat { X; ZERO; ONE; TOP }")
  quat_induct_c.set(quat_induct)
  quat_recursion_c.set(quat_recursion)
}

///|
/// quat_DISTINCT
fn step_9() -> Unit raise {
  quat_distinct_c.set(@ind_types.prove_constructors_distinct(quat_recursion()))
}

///|
let quat_distinct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("quat_DISTINCT")

///|
/// `quat_DISTINCT`
pub fn quat_distinct() -> @kernel.Thm {
  quat_distinct_c.get()
}

///|
/// qle
fn step_10() -> Unit raise {
  qle_c.set(@pair.new_definition(@term_syntax.parse_term("(op_lt_lt_eq : (Quat, Quat) -> Bool)((x : Quat), (y : Quat)) == (x == X || y == TOP || x == y)")))
}

///|
let qle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("qle")

///|
/// `qle`
pub fn qle() -> @kernel.Thm {
  qle_c.get()
}

///|
/// qjoin
fn step_11() -> Unit raise {
  qjoin_c.set(@pair.new_definition(@term_syntax.parse_term("(op_amp_amp : (Quat, Quat) -> Quat)((x : Quat), (y : Quat)) == (if op_lt_lt_eq(x, y) { y } else { if op_lt_lt_eq(y, x) { x } else { TOP } })")))
}

///|
let qjoin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("qjoin")

///|
/// `qjoin`
pub fn qjoin() -> @kernel.Thm {
  qjoin_c.get()
}

///|
/// QLE_REFL
fn step_12() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([qle()]))
  qle_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Quat, op_lt_lt_eq(x, x)"), t2))
}

///|
let qle_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QLE_REFL")

///|
/// `QLE_REFL`
pub fn qle_refl() -> @kernel.Thm {
  qle_refl_c.get()
}

///|
/// QLE_TRANS
fn step_13() -> Unit raise {
  let t4 = @simp.rewrite_tac(@list.List([qle(), quat_distinct()]))
  let t3 = @tactics.repeat_tac(@tactics.conj_tac)
  let t5 = @tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(quat_induct()), t3)), t4)
  qle_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Quat, ∀ y : Quat, ∀ z : Quat, op_lt_lt_eq(x, y) && op_lt_lt_eq(y, z) → op_lt_lt_eq(x, z)"), t5))
}

///|
let qle_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QLE_TRANS")

///|
/// `QLE_TRANS`
pub fn qle_trans() -> @kernel.Thm {
  qle_trans_c.get()
}

///|
/// QLE_LJOIN
fn step_14() -> Unit raise {
  let t7 = @simp.rewrite_tac(@list.List([qjoin(), qle(), quat_distinct()]))
  let t6 = @tactics.repeat_tac(@tactics.conj_tac)
  let t8 = @tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(quat_induct()), t6)), t7)
  qle_ljoin_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Quat, ∀ y : Quat, ∀ z : Quat, op_lt_lt_eq(op_amp_amp(x, y), z) == (op_lt_lt_eq(x, z) && op_lt_lt_eq(y, z))"), t8))
}

///|
let qle_ljoin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QLE_LJOIN")

///|
/// `QLE_LJOIN`
pub fn qle_ljoin() -> @kernel.Thm {
  qle_ljoin_c.get()
}

///|
/// QLE_RJOIN
fn step_15() -> Unit raise {
  let t10 = @simp.rewrite_tac(@list.List([qjoin(), qle(), quat_distinct()]))
  let t9 = @tactics.repeat_tac(@tactics.conj_tac)
  let t11 = @tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(quat_induct()), t9)), t10)
  qle_rjoin_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Quat, ∀ y : Quat, op_lt_lt_eq(x, op_amp_amp(x, y)) && op_lt_lt_eq(y, op_amp_amp(x, y))"), t11))
}

///|
let qle_rjoin_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QLE_RJOIN")

///|
/// `QLE_RJOIN`
pub fn qle_rjoin() -> @kernel.Thm {
  qle_rjoin_c.get()
}

///|
/// choice
fn step_16() -> Unit raise {
  choice_c.set(@pair.new_definition(@term_syntax.parse_term("(op_gt_minus_gt : (Bool, Quat) -> Quat)((b : Bool), (x : Quat)) == (if b { x } else { X })")))
}

///|
let choice_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("choice")

///|
/// `choice`
pub fn choice() -> @kernel.Thm {
  choice_c.get()
}

///|
/// QLE_CHOICE
fn step_17() -> Unit raise {
  let t14 = @simp.rewrite_tac(@list.List([qle()]))
  let t13 = @simp.rewrite_tac(@list.List([]))
  let t12 = @simp.rewrite_tac(@list.List([choice()]))
  let t15 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t12), @class.cond_cases_tac), t13), t14)
  qle_choice_c.set(@tactics.prove(@term_syntax.parse_term("op_lt_lt_eq(op_gt_minus_gt((b : Bool), (x : Quat)), (y : Quat)) == (b → op_lt_lt_eq(x, y))"), t15))
}

///|
let qle_choice_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QLE_CHOICE")

///|
/// `QLE_CHOICE`
pub fn qle_choice() -> @kernel.Thm {
  qle_choice_c.get()
}

///|
let trajform_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("trajform_INDUCT")

///|
/// `trajform_INDUCT`
pub fn trajform_induct() -> @kernel.Thm {
  trajform_induct_c.get()
}

///|
let trajform_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("trajform_RECURSION")

///|
/// `trajform_RECURSION`
pub fn trajform_recursion() -> @kernel.Thm {
  trajform_recursion_c.get()
}

///|
/// trajform_INDUCT, trajform_RECURSION
fn step_18() -> Unit raise {
  let (trajform_induct, trajform_recursion) = @ind_types.define_type("enum Trajform { Is_0(Node); Is_1(Node); Andj(Trajform, Trajform); When(Trajform, Propform); Next(Trajform) }")
  trajform_induct_c.set(trajform_induct)
  trajform_recursion_c.set(trajform_recursion)
}

///|
/// tholds
fn step_19() -> Unit raise {
  let t16 = @term_syntax.parse_term("(tholds : (Trajform, (Num, Node, (Num) -> Bool) -> Quat, (Num) -> Bool) -> Bool)(Is_0((nd : Node)), (seq : (Num, Node, (Num) -> Bool) -> Quat), (v : (Num) -> Bool)) == op_lt_lt_eq(ZERO, seq(0, nd, v)) && tholds(Is_1(nd), seq, v) == op_lt_lt_eq(ONE, seq(0, nd, v)) && tholds(Andj((tf1 : Trajform), (tf2 : Trajform)), seq, v) == (tholds(tf1, seq, v) && tholds(tf2, seq, v)) && tholds(When(tf1, (p : Propform)), seq, v) == (eval(p, v) → tholds(tf1, seq, v)) && tholds(Next(tf1), seq, v) == tholds(tf1, (t : Num) => seq(t + 1), v)")
  tholds_c.set(@recursion.new_recursive_definition(trajform_recursion())(t16))
}

///|
let tholds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("tholds")

///|
/// `tholds`
pub fn tholds() -> @kernel.Thm {
  tholds_c.get()
}

///|
/// defseq
fn step_20() -> Unit raise {
  let t17 = @term_syntax.parse_term("(defseq : (Trajform, Num, Node, (Num) -> Bool) -> Quat)(Is_0((n : Node)), (t : Num), (nd : Node), (v : (Num) -> Bool)) == op_gt_minus_gt(n == nd && t == 0, ZERO) && defseq(Is_1(n), t, nd, v) == op_gt_minus_gt(n == nd && t == 0, ONE) && defseq(Andj((tf1 : Trajform), (tf2 : Trajform)), t, nd, v) == op_amp_amp(defseq(tf1, t, nd, v), defseq(tf2, t, nd, v)) && defseq(When(tf1, (p : Propform)), t, nd, v) == op_gt_minus_gt(eval(p, v), defseq(tf1, t, nd, v)) && defseq(Next(tf1), t, nd, v) == op_gt_minus_gt(!(t == 0), defseq(tf1, t - 1, nd, v))")
  defseq_c.set(@recursion.new_recursive_definition(trajform_recursion())(t17))
}

///|
let defseq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("defseq")

///|
/// `defseq`
pub fn defseq() -> @kernel.Thm {
  defseq_c.get()
}

///|
/// DEFSEQ_MINIMAL
fn step_21() -> Unit raise {
  let t18 = @meson.meson_tac(@list.List([@nums.num_cases()]))
  let cases_lemma = @tactics.prove(@term_syntax.parse_term("(∀ t : Num, (P : (Num) -> Bool)(t)) == (P(0) && (∀ t : Num, P(SUC(t))))"), t18)
  let t27 = @simp.asm_rewrite_tac(@list.List([qle_choice(), @nums.not_suc(), @arith.add1(), @arith.add_sub()]))
  let t26 = @simp.once_rewrite_tac(@list.List([cases_lemma]))
  let t28 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t26), t27)
  let t25 = @meson.meson_tac(@list.List([]))
  let t29 = @tactics.then_tac(@simp.rewrite_tac(@list.List([qle_choice()])), t25)
  let t30 = @simp.simp_tac(@list.List([qle_ljoin(), @theorems.forall_and_thm()]))
  let t24 = @meson.meson_tac(@list.List([]))
  let t23 = @simp.rewrite_tac(@list.List([qle_choice()]))
  let t31 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t23), t24)
  let t22 = @meson.meson_tac(@list.List([]))
  let t21 = @simp.rewrite_tac(@list.List([qle_choice()]))
  let t32 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t21), t22), t31, t30, t29, t28])
  let t20 = @tactics.repeat_tac(@tactics.conj_tac)
  let t19 = @simp.rewrite_tac(@list.List([defseq(), tholds()]))
  let t33 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(trajform_induct()), t19), t20), t32)
  defseq_minimal_c.set(@tactics.prove(@term_syntax.parse_term("∀ tf : Trajform, ∀ seq : (Num, Node, (Num) -> Bool) -> Quat, ∀ v : (Num) -> Bool, tholds(tf, seq, v) == (∀ t : Num, ∀ nd : Node, op_lt_lt_eq(defseq(tf, t, nd, v), seq(t, nd, v)))"), t33))
}

///|
let defseq_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEFSEQ_MINIMAL")

///|
/// `DEFSEQ_MINIMAL`
pub fn defseq_minimal() -> @kernel.Thm {
  defseq_minimal_c.get()
}

///|
/// trajectory
fn step_22() -> Unit raise {
  trajectory_c.set(@pair.new_definition(@term_syntax.parse_term("(trajectory : (((_, _) -> Quat, _, _) -> Quat, (Num, _, _) -> Quat, _) -> Bool)((next : ((_, _) -> Quat, _, _) -> Quat), (seq : (Num, _, _) -> Quat), (v : _)) == (∀ t : Num, ∀ nd : _, op_lt_lt_eq(next(seq(t), nd, v), seq(t + 1, nd, v)))")))
}

///|
let trajectory_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("trajectory")

///|
/// `trajectory`
pub fn trajectory() -> @kernel.Thm {
  trajectory_c.get()
}

///|
/// deftraj
fn step_23() -> Unit raise {
  let t34 = @term_syntax.parse_term("(deftraj : (((Node, (Num) -> Bool) -> Quat, Node, (Num) -> Bool) -> Quat, Trajform, Num, Node, (Num) -> Bool) -> Quat)((step : ((Node, (Num) -> Bool) -> Quat, Node, (Num) -> Bool) -> Quat), (tf : Trajform), 0, (nd : Node), (v : (Num) -> Bool)) == defseq(tf, 0, nd, v) && deftraj(step, tf, SUC((t : Num)), nd, v) == op_amp_amp(defseq(tf, SUC(t), nd, v), step(deftraj(step, tf, t), nd, v))")
  deftraj_c.set(@recursion.new_recursive_definition(@nums.num_recursion())(t34))
}

///|
let deftraj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("deftraj")

///|
/// `deftraj`
pub fn deftraj() -> @kernel.Thm {
  deftraj_c.get()
}

///|
/// DEFTRAJ_DEFSEQ
fn step_24() -> Unit raise {
  let t35 = @simp.rewrite_tac(@list.List([deftraj(), qle_refl(), qle_rjoin()]))
  let t36 = @tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @nums.induct_tac), t35)
  deftraj_defseq_c.set(@tactics.prove(@term_syntax.parse_term("∀ tf : Trajform, ∀ t : Num, ∀ nd : Node, ∀ v : (Num) -> Bool, op_lt_lt_eq(defseq(tf, t, nd, v), deftraj((step : ((Node, (Num) -> Bool) -> Quat, Node, (Num) -> Bool) -> Quat), tf, t, nd, v))"), t36))
}

///|
let deftraj_defseq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEFTRAJ_DEFSEQ")

///|
/// `DEFTRAJ_DEFSEQ`
pub fn deftraj_defseq() -> @kernel.Thm {
  deftraj_defseq_c.get()
}

///|
/// TRAJECTORY_DEFTRAJ
fn step_25() -> Unit raise {
  let t38 = @simp.rewrite_tac(@list.List([@equal.gsym(@arith.add1()), deftraj(), qle_rjoin()]))
  let t37 = @simp.rewrite_tac(@list.List([trajectory()]))
  let t39 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t37), t38)
  trajectory_deftraj_c.set(@tactics.prove(@term_syntax.parse_term("∀ step : ((Node, (Num) -> Bool) -> Quat, Node, (Num) -> Bool) -> Quat, ∀ tf : Trajform, ∀ v : (Num) -> Bool, trajectory(step, deftraj(step, tf), v)"), t39))
}

///|
let trajectory_deftraj_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRAJECTORY_DEFTRAJ")

///|
/// `TRAJECTORY_DEFTRAJ`
pub fn trajectory_deftraj() -> @kernel.Thm {
  trajectory_deftraj_c.get()
}

///|
/// monotonic
fn step_26() -> Unit raise {
  monotonic_c.set(@pair.new_definition(@term_syntax.parse_term("(monotonic : (((_, _) -> Quat, _, _) -> Quat, _) -> Bool)((next : ((_, _) -> Quat, _, _) -> Quat), (v : _)) == (∀ s1 : (_, _) -> Quat, ∀ s2 : (_, _) -> Quat, (∀ nd : _, op_lt_lt_eq(s1(nd, v), s2(nd, v))) → (∀ nd : _, op_lt_lt_eq(next(s1, nd, v), next(s2, nd, v))))")))
}

///|
let monotonic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("monotonic")

///|
/// `monotonic`
pub fn monotonic() -> @kernel.Thm {
  monotonic_c.get()
}

///|
/// DEFTRAJ_MINIMAL
fn step_27() -> Unit raise {
  let t43 = @meson.asm_meson_tac(@list.List([defseq_minimal(), qle_trans(), @arith.add1()]))
  let t42 = @simp.rewrite_tac(@list.List([deftraj(), qle_ljoin()]))
  let t41 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([defseq_minimal(), deftraj_defseq(), qle_trans()]))])
  let t40 = @tactics.repeat_tac(@tactics.strip_tac)
  let t44 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([monotonic(), trajectory(), @theorems.right_imp_forall_thm()])), t40), @tactics.eq_tac), t41), @tactics.disch_tac), @nums.induct_tac), t42), t43)
  deftraj_minimal_c.set(@tactics.prove(@term_syntax.parse_term("∀ step : ((Node, (Num) -> Bool) -> Quat, Node, (Num) -> Bool) -> Quat, ∀ v : (Num) -> Bool, monotonic(step, v) → (∀ tf : Trajform, ∀ seq : (Num, Node, (Num) -> Bool) -> Quat, trajectory(step, seq, v) → tholds(tf, seq, v) == (∀ t : Num, ∀ nd : Node, op_lt_lt_eq(deftraj(step, tf, t, nd, v), seq(t, nd, v))))"), t44))
}

///|
let deftraj_minimal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DEFTRAJ_MINIMAL")

///|
/// `DEFTRAJ_MINIMAL`
pub fn deftraj_minimal() -> @kernel.Thm {
  deftraj_minimal_c.get()
}

///|
/// ste
fn step_28() -> Unit raise {
  ste_c.set(@pair.new_definition(@term_syntax.parse_term("(op_gt_tilde_tilde_gt : (Trajform, Trajform, ((Node, (Num) -> Bool) -> Quat, Node, (Num) -> Bool) -> Quat, (Num) -> Bool) -> Bool)((A : Trajform), (C : Trajform), (ckt : ((Node, (Num) -> Bool) -> Quat, Node, (Num) -> Bool) -> Quat), (v : (Num) -> Bool)) == (∀ seq : (Num, Node, (Num) -> Bool) -> Quat, trajectory(ckt, seq, v) && tholds(A, seq, v) → tholds(C, seq, v))")))
}

///|
let ste_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ste")

///|
/// `ste`
pub fn ste() -> @kernel.Thm {
  ste_c.get()
}

///|
/// STE_THM
fn step_29() -> Unit raise {
  let t45 = @meson.meson_tac(@list.List([ste(), deftraj_minimal(), defseq_minimal(), deftraj_defseq(), trajectory_deftraj(), qle_trans()]))
  ste_thm_c.set(@tactics.prove(@term_syntax.parse_term("monotonic((ckt : ((Node, (Num) -> Bool) -> Quat, Node, (Num) -> Bool) -> Quat), (v : (Num) -> Bool)) → op_gt_tilde_tilde_gt((A : Trajform), (C : Trajform), ckt, v) == (∀ t : Num, ∀ nd : Node, op_lt_lt_eq(defseq(C, t, nd, v), deftraj(ckt, A, t, nd, v)))"), t45))
}

///|
let ste_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STE_THM")

///|
/// `STE_THM`
pub fn ste_thm() -> @kernel.Thm {
  ste_thm_c.get()
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
