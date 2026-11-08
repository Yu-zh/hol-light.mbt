// Translated from upstream Quaternions/misc.hl; edit this file directly.

///|
/// INDUCT_TAC
fn step_1() -> Unit raise {
  let ind_tac : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@tactics.match_mp_tac(@nums.num_induction()), @tactics.conj_tac)
  induct_tac_c.set(fn(x1 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    let (asl, w) as gl = x1
    let s = @kernel.dest_var(@basics.dest_forall(w).0).0
    let t2 = ("ind_" + s)
    @tactics.thenl(ind_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x4 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s5 = ((x3 : @kernel.Thm) => @tactics.label_tac(t2, x3))(x4)
      fn(x6 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s5(x6)
      }
    }))]))(gl)
  })
}

///|
let induct_tac_c : @lib.Cell[((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise] = @lib.Cell::new("INDUCT_TAC")

///|
/// `INDUCT_TAC`
pub fn induct_tac(x : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @tactics.Goalstate raise {
  (induct_tac_c.get())(x)
}

///|
/// `CASES_TAC`
pub fn cases_tac(x7 : String, x8 : @kernel.Term) -> @tactics.Tactic raise {
  let s = x7
  let tm = x8
  let th = @bool.spec(tm, @class.excluded_middle())
  let t14 = ("not_" + s)
  @tactics.disj_cases_then2(fn(x11 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s12 = ((x10 : @kernel.Thm) => @tactics.label_tac(s, x10))(x11)
    fn(x13 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s12(x13)
    }
  }, fn(x16 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s17 = ((x15 : @kernel.Thm) => @tactics.label_tac(t14, x15))(x16)
    fn(x18 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s17(x18)
    }
  })(th)
}

///|
/// MP_LIST_TAC
fn step_2() -> Unit raise {
  mp_list_tac_c.set(fn(x23 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x19 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s20 = @tactics.mp_tac(x19)
      fn(x21 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s20(x21)
      }
    })(((x22 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x22))(x23))
  })
}

///|
let mp_list_tac_c : @lib.Cell[(@list.List[@kernel.Thm]) -> @tactics.Tactic raise] = @lib.Cell::new("MP_LIST_TAC")

///|
/// `MP_LIST_TAC`
pub fn mp_list_tac(x : @list.List[@kernel.Thm]) -> @tactics.Tactic raise {
  (mp_list_tac_c.get())(x)
}

///|
/// VECTOR_EQ_1
fn step_3() -> Unit raise {
  let t24 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_1(), @vectors.forall_1()]))
  vector_eq_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, Unit], ∀ v : Cart[Real, Unit], (u == v) == (op_dollar(u, 1) == op_dollar(v, 1))"), t24))
}

///|
let vector_eq_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_EQ_1")

///|
/// `VECTOR_EQ_1`
pub fn vector_eq_1() -> @kernel.Thm {
  vector_eq_1_c.get()
}

///|
/// VECTOR_EQ_2
fn step_4() -> Unit raise {
  let t25 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2()]))
  vector_eq_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, 2], ∀ v : Cart[Real, 2], (u == v) == (op_dollar(u, 1) == op_dollar(v, 1) && op_dollar(u, 2) == op_dollar(v, 2))"), t25))
}

///|
let vector_eq_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_EQ_2")

///|
/// `VECTOR_EQ_2`
pub fn vector_eq_2() -> @kernel.Thm {
  vector_eq_2_c.get()
}

///|
/// VECTOR_EQ_3
fn step_5() -> Unit raise {
  let t26 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_3(), @vectors.forall_3()]))
  vector_eq_3_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, 3], ∀ v : Cart[Real, 3], (u == v) == (op_dollar(u, 1) == op_dollar(v, 1) && op_dollar(u, 2) == op_dollar(v, 2) && op_dollar(u, 3) == op_dollar(v, 3))"), t26))
}

///|
let vector_eq_3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_EQ_3")

///|
/// `VECTOR_EQ_3`
pub fn vector_eq_3() -> @kernel.Thm {
  vector_eq_3_c.get()
}

///|
/// VECTOR_EQ_4
fn step_6() -> Unit raise {
  let t27 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_4(), @vectors.forall_4()]))
  vector_eq_4_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, 4], ∀ v : Cart[Real, 4], (u == v) == (op_dollar(u, 1) == op_dollar(v, 1) && op_dollar(u, 2) == op_dollar(v, 2) && op_dollar(u, 3) == op_dollar(v, 3) && op_dollar(u, 4) == op_dollar(v, 4))"), t27))
}

///|
let vector_eq_4_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_EQ_4")

///|
/// `VECTOR_EQ_4`
pub fn vector_eq_4() -> @kernel.Thm {
  vector_eq_4_c.get()
}

///|
/// DOT_LBASIS
fn step_7() -> Unit raise {
  let t37 = @simp.asm_simp_tac(@list.List([@vectors.basis_component(), @calc_int.real_mul_lzero()]))
  let t36 = @theorems.intro_tac("jhp neq")
  let t35 = @simp.rewrite_tac(@list.List([@sets.in_sing()]))
  let t34 = @tactics.x_gen_tac(@term_syntax.parse_term("(j : Num)"))
  let t33 = @simp.asm_rewrite_tac(@list.List([@sets.sing_subset(), @iterate.in_numseg()]))
  let t32 = @tactics.match_mp_tac(@iterate.sum_superset())
  let t31 = @list.List([@tactics.all_tac, @simp.asm_simp_tac(@list.List([@iterate.sum_sing(), @vectors.basis_component(), @realax.real_mul_lid()]))])
  let t29 = @term_syntax.parse_term("(sum : ((Num) -> Bool, (Num) -> Real) -> Real)({(i : Num)}, (j : Num) => (op_dollar : (Cart[Real, N], Num) -> Real)((basis : (Num) -> Cart[Real, N])(i), j) * (op_dollar : (Cart[Real, N], Num) -> Real)((x : Cart[Real, N]), j))")
  let t30 = @tactics.trans_tac(@theorems.eq_trans())(t29)
  let t28 = @simp.rewrite_tac(@list.List([@vectors.dot()]))
  let t38 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@theorems.intro_tac("forall i x; ihp"), t28), t30), @tactics.conj_tac), t31), t32), t33), t34), t35), t36), t37)
  dot_lbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ i : Num, ∀ x : Cart[Real, N], 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (dot : (Cart[Real, N], Cart[Real, N]) -> Real)((basis : (Num) -> Cart[Real, N])(i), x) == (op_dollar : (Cart[Real, N], Num) -> Real)(x, i)"), t38))
}

///|
let dot_lbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_LBASIS")

///|
/// `DOT_LBASIS`
pub fn dot_lbasis() -> @kernel.Thm {
  dot_lbasis_c.get()
}

///|
/// DOT_RBASIS
fn step_8() -> Unit raise {
  let t39 = @meson.meson_tac(@list.List([@vectors.dot_sym(), dot_lbasis()]))
  dot_rbasis_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ i : Num, 1 <= i && i <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) → (dot : (Cart[Real, N], Cart[Real, N]) -> Real)(x, (basis : (Num) -> Cart[Real, N])(i)) == (op_dollar : (Cart[Real, N], Num) -> Real)(x, i)"), t39))
}

///|
let dot_rbasis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_RBASIS")

///|
/// `DOT_RBASIS`
pub fn dot_rbasis() -> @kernel.Thm {
  dot_rbasis_c.get()
}

///|
/// VECTOR_NORM_SQNORM_UNIT
fn step_9() -> Unit raise {
  let t42 = @tactics.conv_tac(@vectors.norm_arith)
  let t41 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(pow((a : Real), 2) == real_of_num(1)) == ((a - real_of_num(1)) * (a + real_of_num(1)) == real_of_num(0))")), @realarith.real_entire()]))
  let t40 = @simp.simp_tac(@list.List([@real.real_pow_one()]))
  let t43 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac), t40), t41), t42)
  vector_norm_sqnorm_unit_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, N], (pow(norm(x), 2) == real_of_num(1)) == (norm(x) == real_of_num(1))"), t43))
}

///|
let vector_norm_sqnorm_unit_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_NORM_SQNORM_UNIT")

///|
/// `VECTOR_NORM_SQNORM_UNIT`
pub fn vector_norm_sqnorm_unit() -> @kernel.Thm {
  vector_norm_sqnorm_unit_c.get()
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
}
