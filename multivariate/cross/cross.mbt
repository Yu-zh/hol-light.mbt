// Translated from upstream Multivariate/cross.ml; edit this file directly.

///|
/// Multivariate/cross.ml:7
fn step_1() -> Unit raise {
  @vectors.prioritize_vector(())
}

///|
/// Multivariate/cross.ml:13
fn step_2() -> Unit raise {
  @printer.parse_as_infix("cross", (20L, "right"))
}

///|
/// cross
fn step_3() -> Unit raise {
  cross_c.set(@pair.new_definition(@term_syntax.parse_term("(cross : (Cart[Real, 3], Cart[Real, 3]) -> Cart[Real, 3])((a : Cart[Real, 3]), (b : Cart[Real, 3])) == vector([op_dollar(a, 2) * op_dollar(b, 3) - op_dollar(a, 3) * op_dollar(b, 2), op_dollar(a, 3) * op_dollar(b, 1) - op_dollar(a, 1) * op_dollar(b, 3), op_dollar(a, 1) * op_dollar(b, 2) - op_dollar(a, 2) * op_dollar(b, 1)])")))
}

///|
let cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("cross")

///|
/// `cross`
pub fn cross() -> @kernel.Thm {
  cross_c.get()
}

///|
/// VEC3_TAC
fn step_4() -> Unit raise {
  let t1 = @tactics.conv_tac(@calc_rat.real_ring)
  vec3_tac_c.set(@tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), @vectors.forall_3(), @vectors.sum_3(), @cart.dimindex_3(), @vectors.vector_3(), @vectors.vector_add(), @vectors.vec(), @vectors.dot(), cross(), @vectors.orthogonal(), @vectors.basis(), @determinants.det_3(), @vectors.vector_neg(), @vectors.vector_sub(), @vectors.vector_mul(), @calc_num.arith()])), t1))
}

///|
let vec3_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("VEC3_TAC")

///|
/// `VEC3_TAC`
pub fn vec3_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (vec3_tac_c.get())(x)
}

///|
/// `VEC3_RULE`
pub fn vec3_rule(x2 : @kernel.Term) -> @kernel.Thm raise {
  let tm = x2
  @tactics.prove(tm, vec3_tac)
}

///|
/// ORTHOGONAL_CROSS
fn step_5() -> Unit raise {
  orthogonal_cross_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], orthogonal(cross(x, y), x) && orthogonal(cross(x, y), y) && orthogonal(x, cross(x, y)) && orthogonal(y, cross(x, y))"), vec3_tac))
}

///|
let orthogonal_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ORTHOGONAL_CROSS")

///|
/// `ORTHOGONAL_CROSS`
pub fn orthogonal_cross() -> @kernel.Thm {
  orthogonal_cross_c.get()
}

///|
/// CROSS_LZERO
fn step_6() -> Unit raise {
  cross_lzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], cross(vec(0), x) == vec(0)"), vec3_tac))
}

///|
let cross_lzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_LZERO")

///|
/// `CROSS_LZERO`
pub fn cross_lzero() -> @kernel.Thm {
  cross_lzero_c.get()
}

///|
/// CROSS_RZERO
fn step_7() -> Unit raise {
  cross_rzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], cross(x, vec(0)) == vec(0)"), vec3_tac))
}

///|
let cross_rzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_RZERO")

///|
/// `CROSS_RZERO`
pub fn cross_rzero() -> @kernel.Thm {
  cross_rzero_c.get()
}

///|
/// CROSS_SKEW
fn step_8() -> Unit raise {
  cross_skew_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], cross(x, y) == -cross(y, x)"), vec3_tac))
}

///|
let cross_skew_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_SKEW")

///|
/// `CROSS_SKEW`
pub fn cross_skew() -> @kernel.Thm {
  cross_skew_c.get()
}

///|
/// CROSS_REFL
fn step_9() -> Unit raise {
  cross_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], cross(x, x) == vec(0)"), vec3_tac))
}

///|
let cross_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_REFL")

///|
/// `CROSS_REFL`
pub fn cross_refl() -> @kernel.Thm {
  cross_refl_c.get()
}

///|
/// CROSS_LADD
fn step_10() -> Unit raise {
  cross_ladd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], cross(x + y, z) == cross(x, z) + cross(y, z)"), vec3_tac))
}

///|
let cross_ladd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_LADD")

///|
/// `CROSS_LADD`
pub fn cross_ladd() -> @kernel.Thm {
  cross_ladd_c.get()
}

///|
/// CROSS_RADD
fn step_11() -> Unit raise {
  cross_radd_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], cross(x, y + z) == cross(x, y) + cross(x, z)"), vec3_tac))
}

///|
let cross_radd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_RADD")

///|
/// `CROSS_RADD`
pub fn cross_radd() -> @kernel.Thm {
  cross_radd_c.get()
}

///|
/// CROSS_LMUL
fn step_12() -> Unit raise {
  cross_lmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], cross(op_pct(c, x), y) == op_pct(c, cross(x, y))"), vec3_tac))
}

///|
let cross_lmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_LMUL")

///|
/// `CROSS_LMUL`
pub fn cross_lmul() -> @kernel.Thm {
  cross_lmul_c.get()
}

///|
/// CROSS_RMUL
fn step_13() -> Unit raise {
  cross_rmul_c.set(@tactics.prove(@term_syntax.parse_term("∀ c : Real, ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], cross(x, op_pct(c, y)) == op_pct(c, cross(x, y))"), vec3_tac))
}

///|
let cross_rmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_RMUL")

///|
/// `CROSS_RMUL`
pub fn cross_rmul() -> @kernel.Thm {
  cross_rmul_c.get()
}

///|
/// CROSS_LNEG
fn step_14() -> Unit raise {
  cross_lneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], cross(-x, y) == -cross(x, y)"), vec3_tac))
}

///|
let cross_lneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_LNEG")

///|
/// `CROSS_LNEG`
pub fn cross_lneg() -> @kernel.Thm {
  cross_lneg_c.get()
}

///|
/// CROSS_RNEG
fn step_15() -> Unit raise {
  cross_rneg_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], cross(x, -y) == -cross(x, y)"), vec3_tac))
}

///|
let cross_rneg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_RNEG")

///|
/// `CROSS_RNEG`
pub fn cross_rneg() -> @kernel.Thm {
  cross_rneg_c.get()
}

///|
/// CROSS_LSUB
fn step_16() -> Unit raise {
  cross_lsub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], cross(x - y, z) == cross(x, z) - cross(y, z)"), vec3_tac))
}

///|
let cross_lsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_LSUB")

///|
/// `CROSS_LSUB`
pub fn cross_lsub() -> @kernel.Thm {
  cross_lsub_c.get()
}

///|
/// CROSS_RSUB
fn step_17() -> Unit raise {
  cross_rsub_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], cross(x, y - z) == cross(x, y) - cross(x, z)"), vec3_tac))
}

///|
let cross_rsub_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_RSUB")

///|
/// `CROSS_RSUB`
pub fn cross_rsub() -> @kernel.Thm {
  cross_rsub_c.get()
}

///|
/// CROSS_JACOBI
fn step_18() -> Unit raise {
  cross_jacobi_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], cross(x, cross(y, z)) + (cross(y, cross(z, x)) + cross(z, cross(x, y))) == vec(0)"), vec3_tac))
}

///|
let cross_jacobi_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_JACOBI")

///|
/// `CROSS_JACOBI`
pub fn cross_jacobi() -> @kernel.Thm {
  cross_jacobi_c.get()
}

///|
/// CROSS_LAGRANGE
fn step_19() -> Unit raise {
  cross_lagrange_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], cross(x, cross(y, z)) == op_pct(dot(x, z), y) - op_pct(dot(x, y), z)"), vec3_tac))
}

///|
let cross_lagrange_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_LAGRANGE")

///|
/// `CROSS_LAGRANGE`
pub fn cross_lagrange() -> @kernel.Thm {
  cross_lagrange_c.get()
}

///|
/// CROSS_TRIPLE
fn step_20() -> Unit raise {
  cross_triple_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], dot(cross(x, y), z) == dot(cross(y, z), x)"), vec3_tac))
}

///|
let cross_triple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_TRIPLE")

///|
/// `CROSS_TRIPLE`
pub fn cross_triple() -> @kernel.Thm {
  cross_triple_c.get()
}

///|
/// DOT_CROSS_SELF
fn step_21() -> Unit raise {
  dot_cross_self_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], dot(x, cross(x, y)) == real_of_num(0)) && (∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], dot(x, cross(y, x)) == real_of_num(0)) && (∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], dot(cross(x, y), y) == real_of_num(0)) && (∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], dot(cross(y, x), y) == real_of_num(0))"), vec3_tac))
}

///|
let dot_cross_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_CROSS_SELF")

///|
/// `DOT_CROSS_SELF`
pub fn dot_cross_self() -> @kernel.Thm {
  dot_cross_self_c.get()
}

///|
/// CROSS_COMPONENTS
fn step_22() -> Unit raise {
  cross_components_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], op_dollar(cross(x, y), 1) == op_dollar(x, 2) * op_dollar(y, 3) - op_dollar(y, 2) * op_dollar(x, 3) && op_dollar(cross(x, y), 2) == op_dollar(x, 3) * op_dollar(y, 1) - op_dollar(y, 3) * op_dollar(x, 1) && op_dollar(cross(x, y), 3) == op_dollar(x, 1) * op_dollar(y, 2) - op_dollar(y, 1) * op_dollar(x, 2)"), vec3_tac))
}

///|
let cross_components_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_COMPONENTS")

///|
/// `CROSS_COMPONENTS`
pub fn cross_components() -> @kernel.Thm {
  cross_components_c.get()
}

///|
/// CROSS_BASIS
fn step_23() -> Unit raise {
  cross_basis_c.set(@tactics.prove(@term_syntax.parse_term("cross(basis(1), basis(2)) == basis(3) && cross(basis(2), basis(1)) == -basis(3) && cross(basis(2), basis(3)) == basis(1) && cross(basis(3), basis(2)) == -basis(1) && cross(basis(3), basis(1)) == basis(2) && cross(basis(1), basis(3)) == -basis(2)"), vec3_tac))
}

///|
let cross_basis_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_BASIS")

///|
/// `CROSS_BASIS`
pub fn cross_basis() -> @kernel.Thm {
  cross_basis_c.get()
}

///|
/// CROSS_BASIS_NONZERO
fn step_24() -> Unit raise {
  cross_basis_nonzero_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, 3], !(u == vec(0)) → !(cross(u, basis(1)) == vec(0)) || !(cross(u, basis(2)) == vec(0)) || !(cross(u, basis(3)) == vec(0))"), vec3_tac))
}

///|
let cross_basis_nonzero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_BASIS_NONZERO")

///|
/// `CROSS_BASIS_NONZERO`
pub fn cross_basis_nonzero() -> @kernel.Thm {
  cross_basis_nonzero_c.get()
}

///|
/// CROSS_DOT_CANCEL
fn step_25() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dot_eq_0())]))
  let t4 = @tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.vector_sub_eq())])), t3), vec3_tac)
  cross_dot_cancel_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], dot(x, y) == dot(x, z) && cross(x, y) == cross(x, z) && !(x == vec(0)) → y == z"), t4))
}

///|
let cross_dot_cancel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_DOT_CANCEL")

///|
/// `CROSS_DOT_CANCEL`
pub fn cross_dot_cancel() -> @kernel.Thm {
  cross_dot_cancel_c.get()
}

///|
/// NORM_CROSS_DOT
fn step_26() -> Unit raise {
  let t5 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_pow_mul(), @vectors.norm_pow_2()])), vec3_tac)
  norm_cross_dot_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], pow(norm(cross(x, y)), 2) + pow(dot(x, y), 2) == pow(norm(x) * norm(y), 2)"), t5))
}

///|
let norm_cross_dot_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_CROSS_DOT")

///|
/// `NORM_CROSS_DOT`
pub fn norm_cross_dot() -> @kernel.Thm {
  norm_cross_dot_c.get()
}

///|
/// DOT_CROSS_DET
fn step_27() -> Unit raise {
  dot_cross_det_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], dot(x, cross(y, z)) == det(vector([x, y, z]))"), vec3_tac))
}

///|
let dot_cross_det_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_CROSS_DET")

///|
/// `DOT_CROSS_DET`
pub fn dot_cross_det() -> @kernel.Thm {
  dot_cross_det_c.get()
}

///|
/// CROSS_CROSS_DET
fn step_28() -> Unit raise {
  cross_cross_det_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], cross(cross(w, x), cross(y, z)) == op_pct(det(vector([w, x, z])), y) - op_pct(det(vector([w, x, y])), z)"), vec3_tac))
}

///|
let cross_cross_det_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_CROSS_DET")

///|
/// `CROSS_CROSS_DET`
pub fn cross_cross_det() -> @kernel.Thm {
  cross_cross_det_c.get()
}

///|
/// DOT_CROSS
fn step_29() -> Unit raise {
  dot_cross_c.set(@tactics.prove(@term_syntax.parse_term("∀ w : Cart[Real, 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], ∀ z : Cart[Real, 3], dot(cross(w, x), cross(y, z)) == dot(w, y) * dot(x, z) - dot(w, z) * dot(x, y)"), vec3_tac))
}

///|
let dot_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOT_CROSS")

///|
/// `DOT_CROSS`
pub fn dot_cross() -> @kernel.Thm {
  dot_cross_c.get()
}

///|
/// NORM_CROSS
fn step_30() -> Unit raise {
  let t6 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_pow_2()])), vec3_tac)
  norm_cross_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], pow(norm(cross(x, y)), 2) == pow(norm(x), 2) * pow(norm(y), 2) - pow(dot(x, y), 2)"), t6))
}

///|
let norm_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_CROSS")

///|
/// `NORM_CROSS`
pub fn norm_cross() -> @kernel.Thm {
  norm_cross_c.get()
}

///|
/// CROSS_EQ_0
fn step_31() -> Unit raise {
  let t12 = @simp.simp_tac(@list.List([@realax.real_abs(), @realax.real_le_mul(), @vectors.norm_pos_le(), @theorems.eq_sym_eq()]))
  let t10 = @equal.gsym(@vectors.norm_cauchy_schwarz_equal())
  let t11 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_eq_square_abs()), t10]))
  let t9 = @simp.rewrite_tac(@list.List([norm_cross(), @realarith.real_sub_0(), @equal.gsym(@real.real_pow_mul())]))
  let t8 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("((x : Real) == real_of_num(0)) == (pow(x, 2) == real_of_num(0))"))]))
  let t7 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.norm_eq_0())]))
  let t13 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t7), t8), t9), t11), t12)
  cross_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], (cross(x, y) == vec(0)) == collinear({vec(0), x, y})"), t13))
}

///|
let cross_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_EQ_0")

///|
/// `CROSS_EQ_0`
pub fn cross_eq_0() -> @kernel.Thm {
  cross_eq_0_c.get()
}

///|
/// CROSS_0
fn step_32() -> Unit raise {
  cross_0_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 3], cross(vec(0), x) == vec(0)) && (∀ x : Cart[Real, 3], cross(x, vec(0)) == vec(0))"), vec3_tac))
}

///|
let cross_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_0")

///|
/// `CROSS_0`
pub fn cross_0() -> @kernel.Thm {
  cross_0_c.get()
}

///|
/// CROSS_EQ_SELF
fn step_33() -> Unit raise {
  let t14 = @meson.meson_tac(@list.List([orthogonal_cross(), cross_0(), @vectors.orthogonal_refl()]))
  cross_eq_self_c.set(@tactics.prove(@term_syntax.parse_term("(∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], (cross(x, y) == x) == (x == vec(0))) && (∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], (cross(x, y) == y) == (y == vec(0)))"), t14))
}

///|
let cross_eq_self_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_EQ_SELF")

///|
/// `CROSS_EQ_SELF`
pub fn cross_eq_self() -> @kernel.Thm {
  cross_eq_self_c.get()
}

///|
/// NORM_AND_CROSS_EQ_0
fn step_34() -> Unit raise {
  let t27 = @simp.asm_rewrite_tac(@list.List([@real.real_sub_rzero(), @realarith.real_entire(), @vectors.dot_eq_0()]))
  let t26 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.dot_eq_0()), dot_cross(), @calc_int.real_mul_lzero()]))
  let t25 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x19 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s20 = @tactics.assume_tac(x19)
    fn(x21 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s20(x21)
    }
  }, fn(x22 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s23 = @tactics.mp_tac(x22)
    fn(x24 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s23(x24)
    }
  }))
  let t18 = @simp.asm_rewrite_tac(@list.List([cross_0(), @vectors.dot_rzero()]))
  let t17 = @class.asm_cases_tac(@term_syntax.parse_term("(y : Cart[Real, 3]) == vec(0)"))
  let t16 = @simp.asm_rewrite_tac(@list.List([cross_0(), @vectors.dot_lzero()]))
  let t15 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, 3]) == vec(0)"))
  let t28 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t15), t16), t17), t18), t25), t26), t27)
  norm_and_cross_eq_0_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], (dot(x, y) == real_of_num(0) && cross(x, y) == vec(0)) == (x == vec(0) || y == vec(0))"), t28))
}

///|
let norm_and_cross_eq_0_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_AND_CROSS_EQ_0")

///|
/// `NORM_AND_CROSS_EQ_0`
pub fn norm_and_cross_eq_0() -> @kernel.Thm {
  norm_and_cross_eq_0_c.get()
}

///|
/// BILINEAR_CROSS
fn step_35() -> Unit raise {
  let t29 = @simp.rewrite_tac(@list.List([@vectors.linear(), @vectors.bilinear(), cross_ladd(), cross_radd(), cross_lmul(), cross_rmul()]))
  bilinear_cross_c.set(@tactics.prove(@term_syntax.parse_term("bilinear(cross)"), t29))
}

///|
let bilinear_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BILINEAR_CROSS")

///|
/// `BILINEAR_CROSS`
pub fn bilinear_cross() -> @kernel.Thm {
  bilinear_cross_c.get()
}

///|
/// CROSS_MATRIX_MUL
fn step_36() -> Unit raise {
  let t30 = @tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.sum_3(), @vectors.matrix_vector_mul(), cross_components(), @cart.lambda_beta(), @calc_num.arith(), @vectors.transp(), @determinants.det_3(), @vectors.vector_mul_component()])), @calc_rat.real_arith_tac)
  cross_matrix_mul_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Cart[Real, 3], 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], matrix_vector_mul(transp(A), cross(matrix_vector_mul(A, x), matrix_vector_mul(A, y))) == op_pct(det(A), cross(x, y))"), t30))
}

///|
let cross_matrix_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_MATRIX_MUL")

///|
/// `CROSS_MATRIX_MUL`
pub fn cross_matrix_mul() -> @kernel.Thm {
  cross_matrix_mul_c.get()
}

///|
/// CROSS_ORTHOGONAL_MATRIX
fn step_37() -> Unit raise {
  let t48 = @simp.rewrite_tac(@list.List([@vectors.matrix_vector_mul_rmul()]))
  let t47 = @tactics.disch_then(fn(x44 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s45 = @tactics.subst1_tac(x44)
    fn(x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s45(x46)
    }
  })
  let t43 = @simp.asm_rewrite_tac(@list.List([@vectors.matrix_vector_mul_assoc(), @vectors.matrix_vector_mul_lid()]))
  let t39 = @term_syntax.parse_term("matrix_vector_mul((A : Cart[Cart[Real, 3], 3]))")
  let t42 = @tactics.disch_then(fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s37 = @tactics.mp_tac(x36)
      fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s37(x38)
      }
    })(((x40 : @kernel.Thm) => @equal.ap_term(t39, x40))(x41))
  })
  let t35 = @tactics.disch_then(fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x33
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t32 = @simp.rewrite_tac(@list.List([@determinants.orthogonal_matrix()]))
  let t31 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t49 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(cross_matrix_mul()), t31), t32), t35), t42), t43), t47), t48)
  cross_orthogonal_matrix_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Cart[Real, 3], 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], orthogonal_matrix(A) → cross(matrix_vector_mul(A, x), matrix_vector_mul(A, y)) == op_pct(det(A), matrix_vector_mul(A, cross(x, y)))"), t49))
}

///|
let cross_orthogonal_matrix_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_ORTHOGONAL_MATRIX")

///|
/// `CROSS_ORTHOGONAL_MATRIX`
pub fn cross_orthogonal_matrix() -> @kernel.Thm {
  cross_orthogonal_matrix_c.get()
}

///|
/// CROSS_ROTATION_MATRIX
fn step_38() -> Unit raise {
  let t50 = @simp.simp_tac(@list.List([@determinants.rotation_matrix(), cross_orthogonal_matrix(), @vectors.vector_mul_lid()]))
  cross_rotation_matrix_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Cart[Real, 3], 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], rotation_matrix(A) → cross(matrix_vector_mul(A, x), matrix_vector_mul(A, y)) == matrix_vector_mul(A, cross(x, y))"), t50))
}

///|
let cross_rotation_matrix_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_ROTATION_MATRIX")

///|
/// `CROSS_ROTATION_MATRIX`
pub fn cross_rotation_matrix() -> @kernel.Thm {
  cross_rotation_matrix_c.get()
}

///|
/// CROSS_ROTOINVERSION_MATRIX
fn step_39() -> Unit raise {
  let t51 = @simp.simp_tac(@list.List([@determinants.rotoinversion_matrix(), cross_orthogonal_matrix(), @vectors.vector_mul_lid(), @vectors.vector_mul_lneg()]))
  cross_rotoinversion_matrix_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Cart[Real, 3], 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], rotoinversion_matrix(A) → cross(matrix_vector_mul(A, x), matrix_vector_mul(A, y)) == -matrix_vector_mul(A, cross(x, y))"), t51))
}

///|
let cross_rotoinversion_matrix_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_ROTOINVERSION_MATRIX")

///|
/// `CROSS_ROTOINVERSION_MATRIX`
pub fn cross_rotoinversion_matrix() -> @kernel.Thm {
  cross_rotoinversion_matrix_c.get()
}

///|
/// CROSS_ORTHOGONAL_TRANSFORMATION
fn step_40() -> Unit raise {
  let t56 = @simp.asm_simp_tac(@list.List([@vectors.matrix_works(), @determinants.orthogonal_transformation_linear()]))
  let t57 = @list.List([@meson.asm_meson_tac(@list.List([@determinants.orthogonal_transformation_matrix(), @determinants.orthogonal_transformation_linear()])), t56])
  let t55 = @tactics.disch_then(fn(x53 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x53
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  })
  let t52 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_forall()), @tactics.gen_tac))
  let t58 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("matrix((f : (Cart[Real, 3]) -> Cart[Real, 3]))"), cross_orthogonal_matrix()))), t52), t55), @tactics.ants_tac), t57)
  cross_orthogonal_transformation_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Cart[Real, 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], orthogonal_transformation(f) → cross(f(x), f(y)) == op_pct(det(matrix(f)), f(cross(x, y)))"), t58))
}

///|
let cross_orthogonal_transformation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_ORTHOGONAL_TRANSFORMATION")

///|
/// `CROSS_ORTHOGONAL_TRANSFORMATION`
pub fn cross_orthogonal_transformation() -> @kernel.Thm {
  cross_orthogonal_transformation_c.get()
}

///|
/// CROSS_LINEAR_IMAGE
fn step_41() -> Unit raise {
  let t59 = @simp.simp_tac(@list.List([@determinants.orthogonal_transformation_v1(), @theorems.conj_assoc(), @vectors.vector_mul_lid(), cross_orthogonal_transformation()]))
  cross_linear_image_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Cart[Real, 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], linear(f) && (∀ x : Cart[Real, 3], norm(f(x)) == norm(x)) && det(matrix(f)) == real_of_num(1) → cross(f(x), f(y)) == f(cross(x, y))"), t59))
}

///|
let cross_linear_image_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_LINEAR_IMAGE")

///|
/// `CROSS_LINEAR_IMAGE`
pub fn cross_linear_image() -> @kernel.Thm {
  cross_linear_image_c.get()
}

///|
/// CONTINUOUS_CROSS
fn step_42() -> Unit raise {
  let t66 = @simp.asm_simp_tac(@list.List([@trivia.o_def(), @topology.continuous_lift_component_compose()]))
  let t65 = @tactics.match_mp_tac(@topology.continuous_mul())
  let t64 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul()]))
  let t63 = @tactics.match_mp_tac(@topology.continuous_sub())
  let t62 = @tactics.repeat_tac(@tactics.conj_tac)
  let t61 = @simp.rewrite_tac(@list.List([cross(), @vectors.vector_3(), @cart.dimindex_3(), @vectors.forall_3(), @vectors.lift_sub()]))
  let t60 = @simp.once_rewrite_tac(@list.List([@topology.continuous_componentwise_lift()]))
  let t67 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t60), t61), t62), t63), t64), @tactics.conj_tac), t65), t66)
  continuous_cross_c.set(@tactics.prove(@term_syntax.parse_term("∀ net : Net[A], ∀ f : (A) -> Cart[Real, 3], ∀ g : (A) -> Cart[Real, 3], continuous(f, net) && continuous(g, net) → continuous((x : A) => cross(f(x), g(x)), net)"), t67))
}

///|
let continuous_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_CROSS")

///|
/// `CONTINUOUS_CROSS`
pub fn continuous_cross() -> @kernel.Thm {
  continuous_cross_c.get()
}

///|
/// CONTINUOUS_ON_CROSS
fn step_43() -> Unit raise {
  let t68 = @simp.simp_tac(@list.List([@topology.continuous_on_eq_continuous_within(), continuous_cross()]))
  continuous_on_cross_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Cart[Real, 3], ∀ g : (Cart[Real, N]) -> Cart[Real, 3], ∀ s : (Cart[Real, N]) -> Bool, continuous_on(f, s) && continuous_on(g, s) → continuous_on((x : Cart[Real, N]) => cross(f(x), g(x)), s)"), t68))
}

///|
let continuous_on_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONTINUOUS_ON_CROSS")

///|
/// `CONTINUOUS_ON_CROSS`
pub fn continuous_on_cross() -> @kernel.Thm {
  continuous_on_cross_c.get()
}

///|
/// CROSS_LINEAR_IMAGE_WEAK
fn step_44() -> Unit raise {
  let t69 = @simp.simp_tac(@list.List([@determinants.orthogonal_transformation_v1(), @theorems.conj_assoc(), @vectors.vector_mul_lid(), cross_orthogonal_transformation()]))
  let t70 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.dimindex_3(), @calc_num.arith()])), t69)
  cross_linear_image_weak_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Cart[Real, 3]) -> Cart[Real, 3], ∀ x : Cart[Real, 3], ∀ y : Cart[Real, 3], (linear : ((Cart[Real, 3]) -> Cart[Real, 3]) -> Bool)(f) && (∀ x : Cart[Real, 3], (norm : (Cart[Real, 3]) -> Real)(f(x)) == (norm : (Cart[Real, 3]) -> Real)(x)) && (2 <= (dimindex : ((3) -> Bool) -> Num)((UNIV : (3) -> Bool)) → (det : (Cart[Cart[Real, 3], 3]) -> Real)((matrix : ((Cart[Real, 3]) -> Cart[Real, 3]) -> Cart[Cart[Real, 3], 3])(f)) == real_of_num(1)) → cross(f(x), f(y)) == f(cross(x, y))"), t70))
}

///|
let cross_linear_image_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CROSS_LINEAR_IMAGE_WEAK")

///|
/// `CROSS_LINEAR_IMAGE_WEAK`
pub fn cross_linear_image_weak() -> @kernel.Thm {
  cross_linear_image_weak_c.get()
}

///|
/// Multivariate/cross.ml:279
fn step_45() -> Unit raise {
  @vectors.add_linear_invariants(@list.List([cross_linear_image_weak()]))
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
}
