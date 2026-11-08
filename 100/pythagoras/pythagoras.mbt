// Translated from upstream 100/pythagoras.ml; edit this file directly.

///|
/// PYTHAGORAS
fn step_1() -> Unit raise {
  let t1 = @tactics.conv_tac(@calc_rat.real_ring)
  let t2 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_pow_2(), @vectors.orthogonal(), @vectors.dot_lsub(), @vectors.dot_rsub(), @vectors.dot_sym()])), t1)
  pythagoras_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], orthogonal(A - B, C - B) → pow(norm(C - A), 2) == pow(norm(B - A), 2) + pow(norm(C - B), 2)"), t2))
}

///|
let pythagoras_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PYTHAGORAS")

///|
/// `PYTHAGORAS`
pub fn pythagoras_v1() -> @kernel.Thm {
  pythagoras_v1_c.get()
}

///|
/// PYTHAGORAS
fn step_2() -> Unit raise {
  let t3 = @tactics.conv_tac(@calc_rat.real_ring)
  let t4 = @tactics.then_tac(@simp.simp_tac(@list.List([@vectors.norm_pow_2(), @vectors.orthogonal(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @vectors.vector_sub_component(), @calc_num.arith()])), t3)
  pythagoras_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], orthogonal(A - B, C - B) → pow(norm(C - A), 2) == pow(norm(B - A), 2) + pow(norm(C - B), 2)"), t4))
}

///|
let pythagoras_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PYTHAGORAS")

///|
/// `PYTHAGORAS`
pub fn pythagoras() -> @kernel.Thm {
  pythagoras_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
}
