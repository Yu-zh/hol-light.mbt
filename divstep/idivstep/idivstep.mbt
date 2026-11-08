// Translated from upstream Divstep/idivstep.ml; edit this file directly.

///|
/// FORALL_2
fn step_1() -> Unit raise {
  let t1 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(1 <= (i : Num) && i <= 2) == (i == 1 || i == 2)"))]))
  forall_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Num) -> Bool, (∀ i : Num, 1 <= i && i <= 2 → P(i)) == (P(1) && P(2))"), t1))
}

///|
let forall_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FORALL_2")

///|
/// `FORALL_2`
pub fn forall_2() -> @kernel.Thm {
  forall_2_c.get()
}

///|
/// VECTOR_2
fn step_2() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("1")), @lists.hd(), @lists.tl(), @lists.el()]))
  let t3 = @tactics.then_tac(@simp.simp_tac(@list.List([@cart.vector(), @cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith(), @lists.length(), @lists.el()])), t2)
  vector_2_c.set(@tactics.prove(@term_syntax.parse_term("(op_dollar : (Cart[A, 2], Num) -> A)((vector : (List[A]) -> Cart[A, 2])([(x : A), (y : A)]), 1) == x && (op_dollar : (Cart[A, 2], Num) -> A)((vector : (List[A]) -> Cart[A, 2])([x, y]), 2) == y"), t3))
}

///|
let vector_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("VECTOR_2")

///|
/// `VECTOR_2`
pub fn vector_2() -> @kernel.Thm {
  vector_2_c.get()
}

///|
/// ISUM_2
fn step_3() -> Unit raise {
  let t6 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t5 = @simp.simp_tac(@list.List([@iterate.isum_clauses(), @sets.finite_rules(), @sets.not_in_empty(), @sets.in_sing()]))
  let t4 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t7 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("2")), @iterate.numseg_clauses(), @iterate.numseg_sing()])), t4), t5), t6), @int.int_arith_tac)
  isum_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ t : (Num) -> Int, isum(op_dot_dot(1, 2), t) == t(1) + t(2)"), t7))
}

///|
let isum_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISUM_2")

///|
/// `ISUM_2`
pub fn isum_2() -> @kernel.Thm {
  isum_2_c.get()
}

///|
/// imat_I
fn step_4() -> Unit raise {
  imat_i_c.set(@define.define_(@term_syntax.parse_term("(imat_I : Cart[Cart[Int, 2], 2]) == lambda((i : Num) => lambda((j : Num) => if i == j { int_of_num(1) } else { int_of_num(0) }))")))
}

///|
let imat_i_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("imat_I")

///|
/// `imat_I`
pub fn imat_i() -> @kernel.Thm {
  imat_i_c.get()
}

///|
/// imat_mul
fn step_5() -> Unit raise {
  imat_mul_c.set(@define.define_(@term_syntax.parse_term("(imat_mul : (Cart[Cart[Int, 2], 2], Cart[Cart[Int, 2], 2]) -> Cart[Cart[Int, 2], 2])((m : Cart[Cart[Int, 2], 2]), (n : Cart[Cart[Int, 2], 2])) == lambda((i : Num) => lambda((j : Num) => isum(op_dot_dot(1, 2), (k : Num) => op_dollar(op_dollar(m, i), k) * op_dollar(op_dollar(n, k), j))))")))
}

///|
let imat_mul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("imat_mul")

///|
/// `imat_mul`
pub fn imat_mul() -> @kernel.Thm {
  imat_mul_c.get()
}

///|
/// imat_vmul
fn step_6() -> Unit raise {
  imat_vmul_c.set(@define.define_(@term_syntax.parse_term("(imat_vmul : (Cart[Cart[Int, 2], 2], Cart[Int, 2]) -> Cart[Int, 2])((m : Cart[Cart[Int, 2], 2]), (v : Cart[Int, 2])) == lambda((i : Num) => isum(op_dot_dot(1, 2), (j : Num) => op_dollar(op_dollar(m, i), j) * op_dollar(v, j)))")))
}

///|
let imat_vmul_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("imat_vmul")

///|
/// `imat_vmul`
pub fn imat_vmul() -> @kernel.Thm {
  imat_vmul_c.get()
}

///|
/// IMAT_I
fn step_7() -> Unit raise {
  let t8 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith(), forall_2(), isum_2()]))
  let t9 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.i_thm(), imat_vmul(), imat_i()])), t8), @int.int_arith_tac)
  imat_i_v1_c.set(@tactics.prove(@term_syntax.parse_term("imat_vmul(imat_I) == I"), t9))
}

///|
let imat_i_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMAT_I")

///|
/// `IMAT_I`
pub fn imat_i_v1() -> @kernel.Thm {
  imat_i_v1_c.get()
}

///|
/// IMAT_MUL
fn step_8() -> Unit raise {
  let t10 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith(), forall_2(), isum_2()]))
  let t11 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.fun_eq_thm(), @trivia.o_thm(), imat_vmul(), imat_mul()])), t10), @int.int_arith_tac)
  imat_mul_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ m1 : Cart[Cart[Int, 2], 2], ∀ m2 : Cart[Cart[Int, 2], 2], imat_vmul(imat_mul(m1, m2)) == o(imat_vmul(m1), imat_vmul(m2))"), t11))
}

///|
let imat_mul_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMAT_MUL")

///|
/// `IMAT_MUL`
pub fn imat_mul_v1() -> @kernel.Thm {
  imat_mul_v1_c.get()
}

///|
/// IMAT_MUL_LID
fn step_9() -> Unit raise {
  let t12 = @tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), forall_2(), imat_i(), @cart.lambda_beta(), imat_mul(), @calc_num.arith(), isum_2()])), @int.int_arith_tac)
  imat_mul_lid_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Cart[Cart[Int, 2], 2], imat_mul(imat_I, m) == m"), t12))
}

///|
let imat_mul_lid_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMAT_MUL_LID")

///|
/// `IMAT_MUL_LID`
pub fn imat_mul_lid() -> @kernel.Thm {
  imat_mul_lid_c.get()
}

///|
/// IMAT_MUL_ASSOC
fn step_10() -> Unit raise {
  let t13 = @tactics.then_tac(@simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), forall_2(), imat_i(), @cart.lambda_beta(), imat_mul(), @calc_num.arith(), isum_2()])), @int.int_arith_tac)
  imat_mul_assoc_c.set(@tactics.prove(@term_syntax.parse_term("∀ m1 : Cart[Cart[Int, 2], 2], ∀ m2 : Cart[Cart[Int, 2], 2], ∀ m3 : Cart[Cart[Int, 2], 2], imat_mul(m1, imat_mul(m2, m3)) == imat_mul(imat_mul(m1, m2), m3)"), t13))
}

///|
let imat_mul_assoc_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IMAT_MUL_ASSOC")

///|
/// `IMAT_MUL_ASSOC`
pub fn imat_mul_assoc() -> @kernel.Thm {
  imat_mul_assoc_c.get()
}

///|
/// idivstep
fn step_11() -> Unit raise {
  idivstep_c.set(@pair.new_definition(@term_syntax.parse_term("(idivstep : ((Int, Int, Int)) -> (Int, Int, Int))(((d : Int), (f : Int), (g : Int))) == (if d >= int_of_num(0) && rem(g, int_of_num(2)) == int_of_num(1) { (int_of_num(2) - d, g, div(g - f, int_of_num(2))) } else { (int_of_num(2) + d, f, div(g + rem(g, int_of_num(2)) * f, int_of_num(2))) })")))
}

///|
let idivstep_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("idivstep")

///|
/// `idivstep`
pub fn idivstep() -> @kernel.Thm {
  idivstep_c.get()
}

///|
/// IDIVSTEP_STAYS_ODD
fn step_12() -> Unit raise {
  let t29 = @tactics.conv_tac(@int.int_reduce_conv)
  let t28 = @simp.asm_rewrite_tac(@list.List([]))
  let t26 = @equal.gsym(@int.int_sub_rem())
  let t27 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@int.int_add_rem()), t26]))
  let t25 = @tactics.disch_then(fn(x23 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x23
    @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
  })
  let t22 = @simp.asm_rewrite_tac(@list.List([@pair.pair_eq()]))
  let t21 = @simp.rewrite_tac(@list.List([idivstep()]))
  let t20 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x14 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s15 = @tactics.assume_tac(x14)
    fn(x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s15(x16)
    }
  }, fn(x17 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s18 = @tactics.mp_tac(x17)
    fn(x19 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s18(x19)
    }
  }))
  let t30 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t20), t21), @class.cond_cases_tac), t22), t25), t27), t28), t29)
  idivstep_stays_odd_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ f : Int, ∀ g : Int, ∀ d' : Int, ∀ f' : Int, ∀ g' : Int, rem(d, int_of_num(2)) == int_of_num(1) && idivstep((d, f, g)) == (d', f', g') → rem(d', int_of_num(2)) == int_of_num(1)"), t30))
}

///|
let idivstep_stays_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IDIVSTEP_STAYS_ODD")

///|
/// `IDIVSTEP_STAYS_ODD`
pub fn idivstep_stays_odd() -> @kernel.Thm {
  idivstep_stays_odd_c.get()
}

///|
/// IDIVSTEP_STAYS_ZERO
fn step_13() -> Unit raise {
  let t40 = @simp.rewrite_tac(@list.List([@pair.pair_eq(), @int.int_mul_lzero()]))
  let t39 = @tactics.conv_tac(@int.int_reduce_conv)
  let t38 = @simp.asm_rewrite_tac(@list.List([idivstep()]))
  let t37 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x31 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s32 = @tactics.assume_tac(x31)
    fn(x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s32(x33)
    }
  }, fn(x34 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s35 = @tactics.mp_tac(x34)
    fn(x36 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s35(x36)
    }
  }))
  let t41 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t37), t38), t39), t40), @int.int_arith_tac)
  idivstep_stays_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ f : Int, ∀ g : Int, ∀ d' : Int, ∀ f' : Int, ∀ g' : Int, g == int_of_num(0) && idivstep((d, f, g)) == (d', f', g') → g' == int_of_num(0)"), t41))
}

///|
let idivstep_stays_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IDIVSTEP_STAYS_ZERO")

///|
/// `IDIVSTEP_STAYS_ZERO`
pub fn idivstep_stays_zero() -> @kernel.Thm {
  idivstep_stays_zero_c.get()
}

///|
/// divstep_d
fn step_14() -> Unit raise {
  divstep_d_c.set(@define.define_(@term_syntax.parse_term("(divstep_d : (Num, (Int, Int, Int)) -> Int)((n : Num), (t : (Int, Int, Int))) == FST(ITER(n, idivstep, t))")))
}

///|
let divstep_d_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("divstep_d")

///|
/// `divstep_d`
pub fn divstep_d() -> @kernel.Thm {
  divstep_d_c.get()
}

///|
/// divstep_f
fn step_15() -> Unit raise {
  divstep_f_c.set(@define.define_(@term_syntax.parse_term("(divstep_f : (Num, (Int, Int, Int)) -> Int)((n : Num), (t : (Int, Int, Int))) == FST(SND(ITER(n, idivstep, t)))")))
}

///|
let divstep_f_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("divstep_f")

///|
/// `divstep_f`
pub fn divstep_f() -> @kernel.Thm {
  divstep_f_c.get()
}

///|
/// divstep_g
fn step_16() -> Unit raise {
  divstep_g_c.set(@define.define_(@term_syntax.parse_term("(divstep_g : (Num, (Int, Int, Int)) -> Int)((n : Num), (t : (Int, Int, Int))) == SND(SND(ITER(n, idivstep, t)))")))
}

///|
let divstep_g_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("divstep_g")

///|
/// `divstep_g`
pub fn divstep_g() -> @kernel.Thm {
  divstep_g_c.get()
}

///|
/// DIVSTEP_DFG
fn step_17() -> Unit raise {
  let t42 = @simp.rewrite_tac(@list.List([divstep_d(), divstep_f(), divstep_g()]))
  divstep_dfg_c.set(@tactics.prove(@term_syntax.parse_term("(divstep_d((n : Num), (t : (Int, Int, Int))), divstep_f(n, t), divstep_g(n, t)) == ITER(n, idivstep, t)"), t42))
}

///|
let divstep_dfg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_DFG")

///|
/// `DIVSTEP_DFG`
pub fn divstep_dfg() -> @kernel.Thm {
  divstep_dfg_c.get()
}

///|
/// DIVSTEP_D
fn step_18() -> Unit raise {
  let t47 = @simp.asm_rewrite_tac(@list.List([]))
  let t46 = @tactics.repeat_tac(@tactics.gen_tac)
  let t45 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), idivstep()]))
  let t43 = @term_syntax.parse_term("(p : (Int, Int, Int))")
  let t44 = @tactics.spec_tac(@term_syntax.parse_term("ITER((n : Num), idivstep, (t : (Int, Int, Int)))"), t43)
  let t48 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iter.iter(), divstep_d(), divstep_g()])), t44), t45), t46), @class.cond_cases_tac), t47)
  divstep_d_v1_c.set(@tactics.prove(@term_syntax.parse_term("divstep_d(0, ((d : Int), (f : Int), (g : Int))) == d && divstep_d(SUC((n : Num)), (t : (Int, Int, Int))) == (if divstep_d(n, t) >= int_of_num(0) && rem(divstep_g(n, t), int_of_num(2)) == int_of_num(1) { int_of_num(2) - divstep_d(n, t) } else { int_of_num(2) + divstep_d(n, t) })"), t48))
}

///|
let divstep_d_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_D")

///|
/// `DIVSTEP_D`
pub fn divstep_d_v1() -> @kernel.Thm {
  divstep_d_v1_c.get()
}

///|
/// DIVSTEP_F
fn step_19() -> Unit raise {
  let t53 = @simp.asm_rewrite_tac(@list.List([]))
  let t52 = @tactics.repeat_tac(@tactics.gen_tac)
  let t51 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), idivstep()]))
  let t49 = @term_syntax.parse_term("(p : (Int, Int, Int))")
  let t50 = @tactics.spec_tac(@term_syntax.parse_term("ITER((n : Num), idivstep, (t : (Int, Int, Int)))"), t49)
  let t54 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iter.iter(), divstep_d(), divstep_f(), divstep_g()])), t50), t51), t52), @class.cond_cases_tac), t53)
  divstep_f_v1_c.set(@tactics.prove(@term_syntax.parse_term("divstep_f(0, ((d : Int), (f : Int), (g : Int))) == f && divstep_f(SUC((n : Num)), (t : (Int, Int, Int))) == (if divstep_d(n, t) >= int_of_num(0) && rem(divstep_g(n, t), int_of_num(2)) == int_of_num(1) { divstep_g(n, t) } else { divstep_f(n, t) })"), t54))
}

///|
let divstep_f_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_F")

///|
/// `DIVSTEP_F`
pub fn divstep_f_v1() -> @kernel.Thm {
  divstep_f_v1_c.get()
}

///|
/// DIVSTEP_G
fn step_20() -> Unit raise {
  let t59 = @simp.asm_rewrite_tac(@list.List([]))
  let t58 = @tactics.repeat_tac(@tactics.gen_tac)
  let t57 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm(), idivstep()]))
  let t55 = @term_syntax.parse_term("(p : (Int, Int, Int))")
  let t56 = @tactics.spec_tac(@term_syntax.parse_term("ITER((n : Num), idivstep, (t : (Int, Int, Int)))"), t55)
  let t60 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@iter.iter(), divstep_d(), divstep_f(), divstep_g()])), t56), t57), t58), @class.cond_cases_tac), t59)
  divstep_g_v1_c.set(@tactics.prove(@term_syntax.parse_term("divstep_g(0, ((d : Int), (f : Int), (g : Int))) == g && divstep_g(SUC((n : Num)), (t : (Int, Int, Int))) == (if divstep_d(n, t) >= int_of_num(0) && rem(divstep_g(n, t), int_of_num(2)) == int_of_num(1) { div(divstep_g(n, t) - divstep_f(n, t), int_of_num(2)) } else { div(divstep_g(n, t) + rem(divstep_g(n, t), int_of_num(2)) * divstep_f(n, t), int_of_num(2)) })"), t60))
}

///|
let divstep_g_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_G")

///|
/// `DIVSTEP_G`
pub fn divstep_g_v1() -> @kernel.Thm {
  divstep_g_v1_c.get()
}

///|
/// DIVSTEP_DFG_ADD
fn step_21() -> Unit raise {
  let t61 = @simp.rewrite_tac(@list.List([@equal.gsym(@pair.pair_eq()), @iter.iter_add()]))
  let t62 = @tactics.then_tac(@simp.rewrite_tac(@list.List([divstep_d(), divstep_f(), divstep_g()])), t61)
  divstep_dfg_add_c.set(@tactics.prove(@term_syntax.parse_term("divstep_d((m : Num) + (n : Num), (t : (Int, Int, Int))) == divstep_d(m, (divstep_d(n, t), divstep_f(n, t), divstep_g(n, t))) && divstep_f(m + n, t) == divstep_f(m, (divstep_d(n, t), divstep_f(n, t), divstep_g(n, t))) && divstep_g(m + n, t) == divstep_g(m, (divstep_d(n, t), divstep_f(n, t), divstep_g(n, t)))"), t62))
}

///|
let divstep_dfg_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_DFG_ADD")

///|
/// `DIVSTEP_DFG_ADD`
pub fn divstep_dfg_add() -> @kernel.Thm {
  divstep_dfg_add_c.get()
}

///|
/// DIVSTEP_D_PARITY
fn step_22() -> Unit raise {
  let t68 = @simp.asm_rewrite_tac(@list.List([]))
  let t67 = @simp.rewrite_tac(@list.List([@int.integer_rule(@term_syntax.parse_term("divides((p : Int), p - (x : Int)) == divides(p, x)"))]))
  let t66 = @simp.rewrite_tac(@list.List([@int.integer_rule(@term_syntax.parse_term("divides((p : Int), p + (x : Int)) == divides(p, x)"))]))
  let t65 = @tactics.repeat_tac(@tactics.gen_tac)
  let t64 = @simp.rewrite_tac(@list.List([divstep_d_v1()]))
  let t63 = @term_syntax.parse_term("(rem((x : Int), int_of_num(2)) == rem((y : Int), int_of_num(2))) == (divides(int_of_num(2), x) == divides(int_of_num(2), y))")
  let t69 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@meson.meson(@list.List([@int.int_rem_2_divides(), @int.int_reduce_conv(@term_syntax.parse_term("int_of_num(1) == int_of_num(0)"))]), t63)])), @nums.induct_tac), t64), t65), @class.cond_cases_tac), t66), t67), t68)
  divstep_d_parity_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, rem(divstep_d(n, (d, f, g)), int_of_num(2)) == rem(d, int_of_num(2))"), t69))
}

///|
let divstep_d_parity_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_D_PARITY")

///|
/// `DIVSTEP_D_PARITY`
pub fn divstep_d_parity() -> @kernel.Thm {
  divstep_d_parity_c.get()
}

///|
/// DIVSTEP_D_BOUND
fn step_23() -> Unit raise {
  let t71 = @simp.asm_rewrite_tac(@list.List([divstep_d_v1(), @equal.gsym(@int.int_of_num_suc())]))
  let t72 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.replicate_tac(3, @tactics.then_tac(@simp.gen_rewrite_tac(fn(x70 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x70
  }, @list.List([@theorems.swap_forall_thm()])), @tactics.gen_tac)), @nums.induct_tac), t71), @int.asm_int_arith_tac)
  divstep_d_bound_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, abs(abs(divstep_d(n, (d, f, g))) - abs(d)) <= int_of_num(2) * int_of_num(n)"), t72))
}

///|
let divstep_d_bound_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_D_BOUND")

///|
/// `DIVSTEP_D_BOUND`
pub fn divstep_d_bound() -> @kernel.Thm {
  divstep_d_bound_c.get()
}

///|
/// DIVSTEP_F_ODD
fn step_24() -> Unit raise {
  let t74 = @simp.asm_simp_tac(@list.List([]))
  let t73 = @tactics.repeat_tac(@tactics.strip_tac)
  let t75 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([divstep_f_v1()]))), t73), @class.cond_cases_tac), t74)
  divstep_f_odd_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, rem(f, int_of_num(2)) == int_of_num(1) → rem(divstep_f(n, (d, f, g)), int_of_num(2)) == int_of_num(1)"), t75))
}

///|
let divstep_f_odd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_F_ODD")

///|
/// `DIVSTEP_F_ODD`
pub fn divstep_f_odd() -> @kernel.Thm {
  divstep_f_odd_c.get()
}

///|
/// DIVSTEP_G_ZERO
fn step_25() -> Unit raise {
  let t80 = @tactics.conv_tac(@int.int_reduce_conv)
  let t79 = @simp.asm_simp_tac(@list.List([@int.int_mul_lzero(), @int.int_add_rid()]))
  let t78 = @tactics.conv_tac(@int.int_reduce_conv)
  let t77 = @simp.asm_simp_tac(@list.List([]))
  let t76 = @tactics.repeat_tac(@tactics.strip_tac)
  let t81 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@nums.induct_tac, @simp.rewrite_tac(@list.List([divstep_g_v1()]))), t76), t77), t78), t79), t80)
  divstep_g_zero_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, g == int_of_num(0) → divstep_g(n, (d, f, g)) == int_of_num(0)"), t81))
}

///|
let divstep_g_zero_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_G_ZERO")

///|
/// `DIVSTEP_G_ZERO`
pub fn divstep_g_zero() -> @kernel.Thm {
  divstep_g_zero_c.get()
}

///|
/// DIVSTEP_FG_GCD
fn step_26() -> Unit raise {
  let t104 = @tactics.conv_tac(@int.integer_rule)
  let t102 = @term_syntax.parse_term("(p : Int)")
  let t103 = @tactics.spec_tac(@term_syntax.parse_term("int_of_num(2)"), t102)
  let t101 = @simp.asm_rewrite_tac(@list.List([]))
  let t99 = @term_syntax.parse_term("int_of_num(2)")
  let t100 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(m : Int)"), t99]), @int.int_division_simp()))
  let t98 = @tactics.match_mp_tac(@int.integer_rule(@term_syntax.parse_term("coprime(((k : Int), (m : Int))) → (divides((d : Int), m) && divides(d, (p : Int))) == (divides(d, m) && divides(d, k * p))")))
  let t97 = @tactics.match_mp_tac(@integer.int_gcd_eq())
  let t96 = @tactics.disch_then(fn(x90 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x90
    @simp.gen_rewrite_tac((x95 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(3, fn(x92 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s93 = @equal.rand_conv(x92)
      fn(x94 : @kernel.Term) -> @kernel.Thm raise {
        s93(x94)
      }
    }, x95), @list.List([@equal.sym(th)]))
  })
  let t89 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(@int.int_mul_div_eq()))]))
  let t86 = @simp.gen_rewrite_rule(fn(x85 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x85
  }, @list.List([@int.int_rem_eq_0()]))
  let t88 = @tactics.first_x_assum(fn(x87 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x82 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s83 = @tactics.mp_tac(x82)
      fn(x84 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s83(x84)
      }
    })(t86(x87))
  })
  let t105 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t88), t89), t96), t97), @tactics.gen_tac), t98), t100), t101), t103), t104)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ m : Int, ∀ n : Int, rem(m, int_of_num(2)) == int_of_num(1) && rem(n, int_of_num(2)) == int_of_num(0) → gcd((m, div(n, int_of_num(2)))) == gcd((m, n))"), t105)
  let t138 = @tactics.conv_tac(@int.integer_rule)
  let t137 = @tactics.match_mp_tac(@integer.int_gcd_eq())
  let t136 = @tactics.first_x_assum(fn(x131 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x131
    @simp.gen_rewrite_tac(fn(x133 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s134 = @equal.rand_conv(x133)
      fn(x135 : @kernel.Term) -> @kernel.Thm raise {
        s134(x135)
      }
    }, @list.List([@equal.sym(th_1)]))
  })
  let t130 = @tactics.disch_then(fn(x127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s128 = @tactics.subst1_tac(x127)
    fn(x129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s128(x129)
    }
  })
  let t126 = @tactics.conv_tac(@int.int_reduce_conv)
  let t125 = @simp.asm_simp_tac(@list.List([divstep_f_odd(), @int.int_mul_lid(), @int.int_mul_lzero()]))
  let t123 = @equal.gsym(@int.int_add_rem())
  let t124 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@int.int_sub_rem()), t123]))
  let t117 = @drule.part_match(fn(x116 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x116))
  }, lemma)
  let t112 = @tactics.try_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([]))))
  let t111 = @tactics.conv_tac(@int.int_reduce_conv)
  let t110 = @simp.asm_rewrite_tac(@list.List([]))
  let t109 = @tactics.disj_cases_tac(@bool.spec(@term_syntax.parse_term("divstep_g((n : Num), ((d : Int), (f : Int), (g : Int)))"), @int.int_rem_2_cases()))
  let t108 = @simp.asm_rewrite_tac(@list.List([divstep_f_v1(), divstep_g_v1()]))
  let t107 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t139 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.replicate_tac(3, @tactics.then_tac(@simp.gen_rewrite_tac(fn(x106 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x106
  }, @list.List([@theorems.swap_forall_thm()])), @tactics.gen_tac)), t107), @tactics.disch_tac), @nums.induct_tac), t108), t109), t110), t111), t112), fn(x122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x119 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x118 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s114 = @tactics.mp_tac(x113)
            fn(x115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s114(x115)
            }
          })(t117(x118))
        })(@equal.lhand(x119))
      })((fn(x120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x120.1
      })(x121))
    })(x122)(x122)
  }), t124), t125), t126), t130), t136), t137), t138)
  divstep_fg_gcd_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, rem(f, int_of_num(2)) == int_of_num(1) → gcd((divstep_f(n, (d, f, g)), divstep_g(n, (d, f, g)))) == gcd((f, g))"), t139))
}

///|
let divstep_fg_gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_FG_GCD")

///|
/// `DIVSTEP_FG_GCD`
pub fn divstep_fg_gcd() -> @kernel.Thm {
  divstep_fg_gcd_c.get()
}

///|
let divstep_f_bounds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_F_BOUNDS")

///|
/// `DIVSTEP_F_BOUNDS`
pub fn divstep_f_bounds() -> @kernel.Thm {
  divstep_f_bounds_c.get()
}

///|
let divstep_g_bounds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_G_BOUNDS")

///|
/// `DIVSTEP_G_BOUNDS`
pub fn divstep_g_bounds() -> @kernel.Thm {
  divstep_g_bounds_c.get()
}

///|
/// DIVSTEP_F_BOUNDS, DIVSTEP_G_BOUNDS
fn step_27() -> Unit raise {
  let t149 = @bool.spec(@term_syntax.parse_term("divstep_g((n : Num), ((d : Int), (f : Int), (g : Int)))"), @int.int_rem_2_cases())
  let t150 = @tactics.disj_cases_then(fn(x146 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s147 = @tactics.subst1_tac(x146)
    fn(x148 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s147(x148)
    }
  })(t149)
  let t145 = @simp.asm_simp_tac(@list.List([@int.int_div_lt_eq(), @int.int_le_div_eq(), @int.int_arith(@term_syntax.parse_term("int_of_num(0) < int_of_num(2)"))]))
  let t144 = @simp.asm_rewrite_tac(@list.List([divstep_f_v1(), divstep_g_v1()]))
  let t143 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t142 = @tactics.replicate_tac(3, @tactics.then_tac(@simp.gen_rewrite_tac(fn(x141 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x141
  }, @list.List([@theorems.swap_forall_thm()])), @tactics.gen_tac))
  let t151 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.and_forall_thm(), @class.taut(@term_syntax.parse_term("(((p : Bool) → (q : Bool)) && (p → (r : Bool))) == (p → q && r)"))])), @tactics.gen_tac), t142), t143), @tactics.disch_tac), @nums.induct_tac), t144), @class.cond_cases_tac), t145), t150), @int.asm_int_arith_tac)
  let t152 = (@term_syntax.parse_term("(∀ B : Int, ∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, -B <= f && f < B && -B <= g && g < B → -B <= divstep_f(n, (d, f, g)) && divstep_f(n, (d, f, g)) < B) && (∀ B : Int, ∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, -B <= f && f < B && -B <= g && g < B → -B <= divstep_g(n, (d, f, g)) && divstep_g(n, (d, f, g)) < B)"), t151)
  let (divstep_f_bounds, divstep_g_bounds) = @bool.conj_pair((fn(x140 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x140.0, x140.1)
  })(t152))
  divstep_f_bounds_c.set(divstep_f_bounds)
  divstep_g_bounds_c.set(divstep_g_bounds)
}

///|
let divstep_f_bounds_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_F_BOUNDS_LT")

///|
/// `DIVSTEP_F_BOUNDS_LT`
pub fn divstep_f_bounds_lt() -> @kernel.Thm {
  divstep_f_bounds_lt_c.get()
}

///|
let divstep_g_bounds_lt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_G_BOUNDS_LT")

///|
/// `DIVSTEP_G_BOUNDS_LT`
pub fn divstep_g_bounds_lt() -> @kernel.Thm {
  divstep_g_bounds_lt_c.get()
}

///|
/// DIVSTEP_F_BOUNDS_LT, DIVSTEP_G_BOUNDS_LT
fn step_28() -> Unit raise {
  let t162 = @bool.spec(@term_syntax.parse_term("divstep_g((n : Num), ((d : Int), (f : Int), (g : Int)))"), @int.int_rem_2_cases())
  let t163 = @tactics.disj_cases_then(fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s160 = @tactics.subst1_tac(x159)
    fn(x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s160(x161)
    }
  })(t162)
  let t158 = @simp.asm_simp_tac(@list.List([@int.int_div_lt_eq(), @int.int_lt_div_eq(), @int.int_arith(@term_syntax.parse_term("int_of_num(0) < int_of_num(2)"))]))
  let t157 = @simp.asm_rewrite_tac(@list.List([divstep_f_v1(), divstep_g_v1()]))
  let t156 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t155 = @tactics.replicate_tac(3, @tactics.then_tac(@simp.gen_rewrite_tac(fn(x154 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x154
  }, @list.List([@theorems.swap_forall_thm()])), @tactics.gen_tac))
  let t164 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.and_forall_thm(), @class.taut(@term_syntax.parse_term("(((p : Bool) → (q : Bool)) && (p → (r : Bool))) == (p → q && r)"))])), @tactics.gen_tac), t155), t156), @tactics.disch_tac), @nums.induct_tac), t157), @class.cond_cases_tac), t158), t163), @int.asm_int_arith_tac)
  let t165 = (@term_syntax.parse_term("(∀ B : Int, ∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, -B < f && f < B && -B < g && g < B → -B < divstep_f(n, (d, f, g)) && divstep_f(n, (d, f, g)) < B) && (∀ B : Int, ∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, -B < f && f < B && -B < g && g < B → -B < divstep_g(n, (d, f, g)) && divstep_g(n, (d, f, g)) < B)"), t164)
  let (divstep_f_bounds_lt, divstep_g_bounds_lt) = @bool.conj_pair((fn(x153 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x153.0, x153.1)
  })(t165))
  divstep_f_bounds_lt_c.set(divstep_f_bounds_lt)
  divstep_g_bounds_lt_c.set(divstep_g_bounds_lt)
}

///|
/// ITER_DIVSTEP_INTEGER
fn step_29() -> Unit raise {
  let t182 = @simp.asm_rewrite_tac(@list.List([]))
  let t181 = @tactics.disch_then(fn(x180 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t179 = @tactics.conv_tac(@int.int_reduce_conv)
  let t178 = @simp.asm_rewrite_tac(@list.List([]))
  let t177 = @class.asm_cases_tac(@term_syntax.parse_term("divstep_d((n : Num), (int_of_num(1), (f : Int), (g : Int))) == int_of_num(0)"))
  let t173 = @term_syntax.parse_term("(g : Int)")
  let t174 = @term_syntax.parse_term("(f : Int)")
  let t175 = @term_syntax.parse_term("int_of_num(1)")
  let t176 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(n : Num)"), t175, t174, t173]), divstep_d_parity()))
  let t172 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("((x : Int) > int_of_num(0)) == (!(x == int_of_num(0)) && x >= int_of_num(0))"))]))
  let t171 = @simp.rewrite_tac(@list.List([@int.real_of_int_clauses()]))
  let t170 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) + (x : Real) / real_of_num(2) == (real_of_num(2) + x) / real_of_num(2)"))]))
  let t169 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(1) - (x : Real) / real_of_num(2) == (real_of_num(2) - x) / real_of_num(2)"))]))
  let t168 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) / real_of_num(2) > real_of_num(0)) == (x > real_of_num(0))"))]))
  let t167 = @simp.asm_rewrite_tac(@list.List([@int.int_of_num_th(), @divstep.divstep()]))
  let t166 = @simp.rewrite_tac(@list.List([@divstep.divstep(), @iter.iter(), divstep_d_v1(), divstep_f_v1(), divstep_g_v1()]))
  let t183 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t166), t167), t168), t169), t170), t171), t172), t176), t177), t178), t179), t181), @class.cond_cases_tac), t182)
  iter_divstep_integer_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : Int, ∀ g : Int, ∀ n : Num, ITER(n, divstep, (real_of_num(1) / real_of_num(2), f, g)) == (real_of_int(divstep_d(n, (int_of_num(1), f, g))) / real_of_num(2), divstep_f(n, (int_of_num(1), f, g)), divstep_g(n, (int_of_num(1), f, g)))"), t183))
}

///|
let iter_divstep_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ITER_DIVSTEP_INTEGER")

///|
/// `ITER_DIVSTEP_INTEGER`
pub fn iter_divstep_integer() -> @kernel.Thm {
  iter_divstep_integer_c.get()
}

///|
/// divstep_mat
fn step_30() -> Unit raise {
  divstep_mat_c.set(@define.define_(@term_syntax.parse_term("(divstep_mat : (Num, (Int, Int, Int)) -> Cart[Cart[Int, 2], 2])(0, (t : (Int, Int, Int))) == imat_I && divstep_mat(SUC((n : Num)), t) == imat_mul(if divstep_d(n, t) >= int_of_num(0) && rem(divstep_g(n, t), int_of_num(2)) == int_of_num(1) { vector([vector([int_of_num(0), int_of_num(2)]), vector([-int_of_num(1), int_of_num(1)])]) } else { vector([vector([int_of_num(2), int_of_num(0)]), vector([rem(divstep_g(n, t), int_of_num(2)), int_of_num(1)])]) }, divstep_mat(n, t))")))
}

///|
let divstep_mat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("divstep_mat")

///|
/// `divstep_mat`
pub fn divstep_mat() -> @kernel.Thm {
  divstep_mat_c.get()
}

///|
/// DIVSTEP_MAT
fn step_31() -> Unit raise {
  let t201 = @simp.asm_simp_tac(@list.List([divstep_f_odd(), @int.int_rem_rem()]))
  let t200 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(@int.int_rem_2_divides()))]))
  let t199 = @simp.rewrite_tac(@list.List([@int.int_2_divides_add(), @int.int_2_divides_sub(), @int.int_2_divides_mul()]))
  let t198 = @simp.rewrite_tac(@list.List([@int.int_mul_div_eq()]))
  let t197 = @tactics.conv_tac(@equal.sym_conv)
  let t196 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(x : Int) + int_of_num(1) * (y : Int) == y + x"))]))
  let t195 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("-int_of_num(1) * (x : Int) + int_of_num(1) * (y : Int) == y - x"))]))
  let t193 = @equal.gsym(@int.int_sub_ldistrib())
  let t194 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_add_ldistrib()), t193]))
  let t192 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(a : Int) * (pow((x : Int), (n : Num)) * (b : Int)) == pow(x, n) * (a * b)"))]))
  let t191 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(a : Int) * pow((x : Int), (n : Num)) == pow(x, n) * a"))]))
  let t190 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_mul_assoc())]))
  let t189 = @tactics.thenl(@tactics.conj_tac, @list.List([@int.int_arith_tac, @tactics.all_tac]))
  let t188 = @simp.simp_tac(@list.List([imat_vmul(), isum_2(), forall_2(), vector_2(), @cart.lambda_beta(), @cart.dimindex_2(), @cart.cart_eq()]))
  let t187 = @simp.asm_rewrite_tac(@list.List([imat_mul_v1(), @trivia.o_thm()]))
  let t186 = @tactics.repeat_tac(@tactics.gen_tac)
  let t185 = @simp.asm_rewrite_tac(@list.List([divstep_mat(), divstep_f_v1(), divstep_g_v1(), imat_i_v1(), @trivia.i_thm(), @int.int_pow_v1(), @int.int_mul_lid()]))
  let t184 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm()]))
  let t202 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.replicate_tac(3, @tactics.gen_tac), t184), @tactics.disch_tac), @nums.induct_tac), t185), t186), @class.cond_cases_tac), t187), t188), t189), t190), t191), t192), t194), @tactics.ap_term_tac), t195), t196), t197), t198), t199), t200), t201), @int.int_arith_tac)
  divstep_mat_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ f : Int, ∀ g : Int, ∀ n : Num, rem(f, int_of_num(2)) == int_of_num(1) → imat_vmul(divstep_mat(n, (d, f, g)), vector([f, g])) == vector([pow(int_of_num(2), n) * divstep_f(n, (d, f, g)), pow(int_of_num(2), n) * divstep_g(n, (d, f, g))])"), t202))
}

///|
let divstep_mat_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_MAT")

///|
/// `DIVSTEP_MAT`
pub fn divstep_mat_v1() -> @kernel.Thm {
  divstep_mat_v1_c.get()
}

///|
/// DIVSTEP_MAT_BOUNDS
fn step_32() -> Unit raise {
  let t213 = @simp.rewrite_tac(@list.List([@int.int_pow_v1()]))
  let t211 = @bool.spec(@term_syntax.parse_term("divstep_g((n : Num), (t : (Int, Int, Int)))"), @int.int_rem_2_cases())
  let t212 = @tactics.disj_cases_then(fn(x208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s209 = @tactics.subst1_tac(x208)
    fn(x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s209(x210)
    }
  })(t211)
  let t207 = @simp.asm_simp_tac(@list.List([imat_mul(), @cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith(), isum_2(), vector_2()]))
  let t206 = @tactics.conv_tac(@int.int_reduce_conv)
  let t205 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith()]))
  let t204 = @simp.asm_rewrite_tac(@list.List([divstep_mat(), imat_i()]))
  let t214 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x203 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x203
  }, @list.List([@theorems.swap_forall_thm()])), @tactics.gen_tac), @nums.induct_tac), t204), t205), t206), @class.cond_cases_tac), t207), t212), t213), @int.asm_int_arith_tac)
  divstep_mat_bounds_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ t : (Int, Int, Int), -pow(int_of_num(2), n) < op_dollar(op_dollar(divstep_mat(n, t), 1), 1) && op_dollar(op_dollar(divstep_mat(n, t), 1), 1) <= pow(int_of_num(2), n) && -pow(int_of_num(2), n) < op_dollar(op_dollar(divstep_mat(n, t), 1), 2) && op_dollar(op_dollar(divstep_mat(n, t), 1), 2) <= pow(int_of_num(2), n) && -pow(int_of_num(2), n) < op_dollar(op_dollar(divstep_mat(n, t), 2), 1) && op_dollar(op_dollar(divstep_mat(n, t), 2), 1) <= pow(int_of_num(2), n) && -pow(int_of_num(2), n) < op_dollar(op_dollar(divstep_mat(n, t), 2), 2) && op_dollar(op_dollar(divstep_mat(n, t), 2), 2) <= pow(int_of_num(2), n)"), t214))
}

///|
let divstep_mat_bounds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_MAT_BOUNDS")

///|
/// `DIVSTEP_MAT_BOUNDS`
pub fn divstep_mat_bounds() -> @kernel.Thm {
  divstep_mat_bounds_c.get()
}

///|
/// DIVSTEP_MAT_ABS_BOUNDS
fn step_33() -> Unit raise {
  let t225 = @simp.rewrite_tac(@list.List([@int.int_pow_v1()]))
  let t223 = @bool.spec(@term_syntax.parse_term("divstep_g((n : Num), (t : (Int, Int, Int)))"), @int.int_rem_2_cases())
  let t224 = @tactics.disj_cases_then(fn(x220 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s221 = @tactics.subst1_tac(x220)
    fn(x222 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s221(x222)
    }
  })(t223)
  let t219 = @simp.asm_simp_tac(@list.List([imat_mul(), @cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith(), isum_2(), vector_2()]))
  let t218 = @tactics.conv_tac(@int.int_reduce_conv)
  let t217 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith()]))
  let t216 = @simp.asm_rewrite_tac(@list.List([divstep_mat(), imat_i()]))
  let t226 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x215 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x215
  }, @list.List([@theorems.swap_forall_thm()])), @tactics.gen_tac), @nums.induct_tac), t216), t217), t218), @class.cond_cases_tac), t219), t224), t225), @int.asm_int_arith_tac)
  divstep_mat_abs_bounds_c.set(@tactics.prove(@term_syntax.parse_term("∀ n : Num, ∀ t : (Int, Int, Int), -pow(int_of_num(2), n) < op_dollar(op_dollar(divstep_mat(n, t), 1), 1) && op_dollar(op_dollar(divstep_mat(n, t), 1), 1) <= pow(int_of_num(2), n) && -pow(int_of_num(2), n) < op_dollar(op_dollar(divstep_mat(n, t), 1), 2) && op_dollar(op_dollar(divstep_mat(n, t), 1), 2) <= pow(int_of_num(2), n) && -pow(int_of_num(2), n) < op_dollar(op_dollar(divstep_mat(n, t), 2), 1) && op_dollar(op_dollar(divstep_mat(n, t), 2), 1) <= pow(int_of_num(2), n) && -pow(int_of_num(2), n) < op_dollar(op_dollar(divstep_mat(n, t), 2), 2) && op_dollar(op_dollar(divstep_mat(n, t), 2), 2) <= pow(int_of_num(2), n) && abs(op_dollar(op_dollar(divstep_mat(n, t), 1), 1)) + abs(op_dollar(op_dollar(divstep_mat(n, t), 1), 2)) <= pow(int_of_num(2), n) && abs(op_dollar(op_dollar(divstep_mat(n, t), 2), 1)) + abs(op_dollar(op_dollar(divstep_mat(n, t), 2), 2)) <= pow(int_of_num(2), n)"), t226))
}

///|
let divstep_mat_abs_bounds_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_MAT_ABS_BOUNDS")

///|
/// `DIVSTEP_MAT_ABS_BOUNDS`
pub fn divstep_mat_abs_bounds() -> @kernel.Thm {
  divstep_mat_abs_bounds_c.get()
}

///|
/// DIVSTEP_MAT_ADD
fn step_34() -> Unit raise {
  let t229 = @simp.asm_rewrite_tac(@list.List([imat_mul_lid(), imat_mul_assoc()]))
  let t228 = @simp.rewrite_tac(@list.List([@arith.add_clauses(), divstep_mat(), divstep_dfg_add(), imat_mul_lid()]))
  let t227 = @term_syntax.parse_term("(m : Num)")
  let t230 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.spec_tac(@term_syntax.parse_term("(m : Num)"), t227), @nums.induct_tac), t228), @class.cond_cases_tac), t229)
  divstep_mat_add_c.set(@tactics.prove(@term_syntax.parse_term("divstep_mat((m : Num) + (n : Num), (t : (Int, Int, Int))) == imat_mul(divstep_mat(m, (divstep_d(n, t), divstep_f(n, t), divstep_g(n, t))), divstep_mat(n, t))"), t230))
}

///|
let divstep_mat_add_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_MAT_ADD")

///|
/// `DIVSTEP_MAT_ADD`
pub fn divstep_mat_add() -> @kernel.Thm {
  divstep_mat_add_c.get()
}

///|
/// DIVSTEP_MAT_DIAGONAL
fn step_35() -> Unit raise {
  let t234 = @simp.asm_simp_tac(@list.List([imat_mul(), vector_2(), isum_2(), @cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith()]))
  let t233 = @tactics.conv_tac(@int.int_reduce_conv)
  let t232 = @simp.simp_tac(@list.List([divstep_g_zero()]))
  let t231 = @simp.asm_simp_tac(@list.List([divstep_mat(), imat_i(), @cart.lambda_beta(), @cart.dimindex_2(), @calc_num.arith()]))
  let t235 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.gen_tac), @nums.induct_tac), t231), t232), t233), t234), @int.int_arith_tac)
  divstep_mat_diagonal_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ f : Int, ∀ n : Num, op_dollar(op_dollar(divstep_mat(n, (d, f, int_of_num(0))), 1), 2) == int_of_num(0) && op_dollar(op_dollar(divstep_mat(n, (d, f, int_of_num(0))), 2), 1) == int_of_num(0)"), t235))
}

///|
let divstep_mat_diagonal_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_MAT_DIAGONAL")

///|
/// `DIVSTEP_MAT_DIAGONAL`
pub fn divstep_mat_diagonal() -> @kernel.Thm {
  divstep_mat_diagonal_c.get()
}

///|
/// DIVSTEP_MAT_DIAGONAL_1
fn step_36() -> Unit raise {
  let t236 = @meson.meson_tac(@list.List([divstep_mat_diagonal()]))
  divstep_mat_diagonal_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ f : Int, ∀ g : Int, ∀ n : Num, g == int_of_num(0) → op_dollar(op_dollar(divstep_mat(n, (d, f, g)), 1), 2) == int_of_num(0)"), t236))
}

///|
let divstep_mat_diagonal_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_MAT_DIAGONAL_1")

///|
/// `DIVSTEP_MAT_DIAGONAL_1`
pub fn divstep_mat_diagonal_1() -> @kernel.Thm {
  divstep_mat_diagonal_1_c.get()
}

///|
/// DIVSTEP_MAT_DIAGONAL_2
fn step_37() -> Unit raise {
  let t237 = @meson.meson_tac(@list.List([divstep_mat_diagonal()]))
  divstep_mat_diagonal_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ f : Int, ∀ g : Int, ∀ n : Num, g == int_of_num(0) → op_dollar(op_dollar(divstep_mat(n, (d, f, g)), 2), 1) == int_of_num(0)"), t237))
}

///|
let divstep_mat_diagonal_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_MAT_DIAGONAL_2")

///|
/// `DIVSTEP_MAT_DIAGONAL_2`
pub fn divstep_mat_diagonal_2() -> @kernel.Thm {
  divstep_mat_diagonal_2_c.get()
}

///|
/// DIVSTEP_CONGRUENCE
fn step_38() -> Unit raise {
  let t289 = @tactics.conv_tac(@int.integer_rule)
  let t288 = @tactics.pop_assum_list(fn(x287 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x285 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x281 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s282 = @tactics.mp_tac(x281)
        fn(x283 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s282(x283)
        }
      })(((x284 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x284))(x285))
    })((fn(x286 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
      @lib.rev(x286)
    })(x287))
  })
  let t280 = @tactics.try_tac(@tactics.match_mp_tac(@int.int_cong_div2()))
  let t279 = @tactics.repeat_tac(@tactics.conj_tac)
  let t278 = @simp.asm_rewrite_tac(@list.List([]))
  let t277 = @simp.asm_rewrite_tac(@list.List([]))
  let t274 = @drule.match_mp(@int.integer_rule(@term_syntax.parse_term("op_eq_eq((a : Int), (b : Int), mod((c : Int) * (d : Int))) → op_eq_eq(a, b, mod(c))")))
  let t272 = @simp.rewrite_rule(@list.List([@equal.gsym(@int.int_rem_eq())]))
  let t276 = @tactics.first_assum(@tactics.conjuncts_then(fn(x275 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x269 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s270 = @tactics.subst1_tac(x269)
        fn(x271 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s270(x271)
        }
      })(t272(x273))
    })(t274(x275))
  }))
  let t268 = @tactics.replicate_tac(2, @tactics.disch_then(@tactics.conjuncts_then2(fn(x262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s263 = @tactics.assume_tac(x262)
    fn(x264 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s263(x264)
    }
  }, fn(x265 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s266 = @tactics.mp_tac(x265)
    fn(x267 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s266(x267)
    }
  })))
  let t261 = @list.List([@int.asm_arith_tac, @simp.rewrite_tac(@list.List([@int.int_pow_v1()]))])
  let t260 = @tactics.subgoal_then(@term_syntax.parse_term("(m : Num) - (n : Num) == SUC(m - SUC(n))"), fn(x257 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s258 = @tactics.subst1_tac(x257)
    fn(x259 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s258(x259)
    }
  })
  let t256 = @simp.asm_rewrite_tac(@list.List([]))
  let t253 = @drule.match_mp(@int.arith_rule(@term_syntax.parse_term("SUC((n : Num)) <= (m : Num) → n <= m")))
  let t255 = @tactics.first_assum(fn(x254 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s251 = @tactics.assume_tac(x250)
      fn(x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s251(x252)
      }
    })(t253(x254))
  })
  let t249 = @tactics.first_x_assum(fn(x248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s242 = @tactics.mp_tac(x241)
      fn(x243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s242(x243)
      }
    })(((x247 : @kernel.Thm) => @lib.check(fn(x246 : @kernel.Thm) -> Bool raise {
      (fn(x244 : @kernel.Term) -> Bool raise {
        @basics.is_imp(x244)
      })((fn(x245 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x245)
      })(x246))
    }, x247))(x248))
  })
  let t240 = @simp.asm_rewrite_tac(@list.List([divstep_mat(), divstep_d_v1(), divstep_f_v1(), divstep_g_v1(), @arith.sub_0()]))
  let t239 = @tactics.repeat_tac(@tactics.disch_tac)
  let t238 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t290 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.replicate_tac(6, @tactics.gen_tac), t238), t239), @nums.induct_tac), t240), @tactics.disch_tac), t249), t255), t256), t260), t261), t268), @tactics.disch_tac), t276), t277), @class.cond_cases_tac), t278), t279), t280), t288), t289)
  divstep_congruence_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, ∀ f' : Int, ∀ g' : Int, ∀ n : Num, op_eq_eq(f, f', mod(pow(int_of_num(2), m))) && op_eq_eq(g, g', mod(pow(int_of_num(2), m))) && n <= m → divstep_d(n, (d, f, g)) == divstep_d(n, (d, f', g')) && divstep_mat(n, (d, f, g)) == divstep_mat(n, (d, f', g')) && op_eq_eq(divstep_f(n, (d, f, g)), divstep_f(n, (d, f', g')), mod(pow(int_of_num(2), m - n))) && op_eq_eq(divstep_g(n, (d, f, g)), divstep_g(n, (d, f', g')), mod(pow(int_of_num(2), m - n)))"), t290))
}

///|
let divstep_congruence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_CONGRUENCE")

///|
/// `DIVSTEP_CONGRUENCE`
pub fn divstep_congruence() -> @kernel.Thm {
  divstep_congruence_c.get()
}

///|
/// DIVSTEP_D_CONGRUENCE
fn step_39() -> Unit raise {
  let t291 = @meson.meson_tac(@list.List([divstep_congruence(), @arith.le_refl()]))
  divstep_d_congruence_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ f : Int, ∀ g : Int, ∀ f' : Int, ∀ g' : Int, ∀ n : Num, op_eq_eq(f, f', mod(pow(int_of_num(2), n))) && op_eq_eq(g, g', mod(pow(int_of_num(2), n))) → divstep_d(n, (d, f, g)) == divstep_d(n, (d, f', g'))"), t291))
}

///|
let divstep_d_congruence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_D_CONGRUENCE")

///|
/// `DIVSTEP_D_CONGRUENCE`
pub fn divstep_d_congruence() -> @kernel.Thm {
  divstep_d_congruence_c.get()
}

///|
/// DIVSTEP_D_CONGRUENCE_GEN
fn step_40() -> Unit raise {
  let t292 = @meson.meson_tac(@list.List([divstep_congruence(), @arith.le_refl()]))
  divstep_d_congruence_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ f : Int, ∀ g : Int, ∀ d' : Int, ∀ f' : Int, ∀ g' : Int, ∀ n : Num, d == d' && op_eq_eq(f, f', mod(pow(int_of_num(2), n))) && op_eq_eq(g, g', mod(pow(int_of_num(2), n))) → divstep_d(n, (d, f, g)) == divstep_d(n, (d', f', g'))"), t292))
}

///|
let divstep_d_congruence_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_D_CONGRUENCE_GEN")

///|
/// `DIVSTEP_D_CONGRUENCE_GEN`
pub fn divstep_d_congruence_gen() -> @kernel.Thm {
  divstep_d_congruence_gen_c.get()
}

///|
/// DIVSTEP_MAT_CONGRUENCE
fn step_41() -> Unit raise {
  let t293 = @meson.meson_tac(@list.List([divstep_congruence(), @arith.le_refl()]))
  divstep_mat_congruence_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ f : Int, ∀ g : Int, ∀ f' : Int, ∀ g' : Int, ∀ n : Num, op_eq_eq(f, f', mod(pow(int_of_num(2), n))) && op_eq_eq(g, g', mod(pow(int_of_num(2), n))) → divstep_mat(n, (d, f, g)) == divstep_mat(n, (d, f', g'))"), t293))
}

///|
let divstep_mat_congruence_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_MAT_CONGRUENCE")

///|
/// `DIVSTEP_MAT_CONGRUENCE`
pub fn divstep_mat_congruence() -> @kernel.Thm {
  divstep_mat_congruence_c.get()
}

///|
/// DIVSTEP_MAT_CONGRUENCE_GEN
fn step_42() -> Unit raise {
  let t294 = @meson.meson_tac(@list.List([divstep_congruence(), @arith.le_refl()]))
  divstep_mat_congruence_gen_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ f : Int, ∀ g : Int, ∀ d' : Int, ∀ f' : Int, ∀ g' : Int, ∀ n : Num, d == d' && op_eq_eq(f, f', mod(pow(int_of_num(2), n))) && op_eq_eq(g, g', mod(pow(int_of_num(2), n))) → divstep_mat(n, (d, f, g)) == divstep_mat(n, (d', f', g'))"), t294))
}

///|
let divstep_mat_congruence_gen_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_MAT_CONGRUENCE_GEN")

///|
/// `DIVSTEP_MAT_CONGRUENCE_GEN`
pub fn divstep_mat_congruence_gen() -> @kernel.Thm {
  divstep_mat_congruence_gen_c.get()
}

///|
/// DIVSTEP_D_MOD
fn step_43() -> Unit raise {
  let t299 = @simp.asm_simp_tac(@list.List([@integer.int_divides_pow_le_imp()]))
  let t298 = @simp.asm_rewrite_tac(@list.List([@int.int_cong_lrem(), @integer.int_cong_refl()]))
  let t297 = @tactics.exists_tac(@term_syntax.parse_term("pow(int_of_num(2), (n : Num))"))
  let t296 = @tactics.match_mp_tac(@int.integer_rule(@term_syntax.parse_term("∀ m : Int, op_eq_eq((x : Int), (y : Int), mod(m)) && divides((n : Int), m) → op_eq_eq(x, y, mod(n))")))
  let t295 = @tactics.match_mp_tac(divstep_d_congruence())
  let t300 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t295), @tactics.conj_tac), t296), t297), t298), t299)
  divstep_d_mod_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, m <= n → divstep_d(m, (d, rem(f, pow(int_of_num(2), n)), rem(g, pow(int_of_num(2), n)))) == divstep_d(m, (d, f, g))"), t300))
}

///|
let divstep_d_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_D_MOD")

///|
/// `DIVSTEP_D_MOD`
pub fn divstep_d_mod() -> @kernel.Thm {
  divstep_d_mod_c.get()
}

///|
/// DIVSTEP_MAT_MOD
fn step_44() -> Unit raise {
  let t305 = @simp.asm_simp_tac(@list.List([@integer.int_divides_pow_le_imp()]))
  let t304 = @simp.asm_rewrite_tac(@list.List([@int.int_cong_lrem(), @integer.int_cong_refl()]))
  let t303 = @tactics.exists_tac(@term_syntax.parse_term("pow(int_of_num(2), (n : Num))"))
  let t302 = @tactics.match_mp_tac(@int.integer_rule(@term_syntax.parse_term("∀ m : Int, op_eq_eq((x : Int), (y : Int), mod(m)) && divides((n : Int), m) → op_eq_eq(x, y, mod(n))")))
  let t301 = @tactics.match_mp_tac(divstep_mat_congruence())
  let t306 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t301), @tactics.conj_tac), t302), t303), t304), t305)
  divstep_mat_mod_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, m <= n → divstep_mat(m, (d, rem(f, pow(int_of_num(2), n)), rem(g, pow(int_of_num(2), n)))) == divstep_mat(m, (d, f, g))"), t306))
}

///|
let divstep_mat_mod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_MAT_MOD")

///|
/// `DIVSTEP_MAT_MOD`
pub fn divstep_mat_mod() -> @kernel.Thm {
  divstep_mat_mod_c.get()
}

///|
let divstep_d_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_D_NEG")

///|
/// `DIVSTEP_D_NEG`
pub fn divstep_d_neg() -> @kernel.Thm {
  divstep_d_neg_c.get()
}

///|
let divstep_mat_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_MAT_NEG")

///|
/// `DIVSTEP_MAT_NEG`
pub fn divstep_mat_neg() -> @kernel.Thm {
  divstep_mat_neg_c.get()
}

///|
let divstep_f_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_F_NEG")

///|
/// `DIVSTEP_F_NEG`
pub fn divstep_f_neg() -> @kernel.Thm {
  divstep_f_neg_c.get()
}

///|
let divstep_g_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_G_NEG")

///|
/// `DIVSTEP_G_NEG`
pub fn divstep_g_neg() -> @kernel.Thm {
  divstep_g_neg_c.get()
}

///|
/// DIVSTEP_D_NEG, DIVSTEP_MAT_NEG, DIVSTEP_F_NEG, DIVSTEP_G_NEG
fn step_45() -> Unit raise {
  let t322 = @tactics.conv_tac(@int.int_reduce_conv)
  let t321 = @simp.asm_simp_tac(@list.List([@int.int_rem_rem(), divstep_f_odd()]))
  let t320 = @simp.rewrite_tac(@list.List([@equal.gsym(@bool.conjunct1(@int.int_rem_2_divides()))]))
  let t319 = @simp.rewrite_tac(@list.List([@int.int_2_divides_add(), @int.int_2_divides_sub(), @int.int_2_divides_mul()]))
  let t318 = @simp.rewrite_tac(@list.List([@int.int_rem_2_divides()]))
  let t317 = @simp.asm_rewrite_tac(@list.List([@int.int_div_lneg()]))
  let t316 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("-(x : Int) + (y : Int) * -(z : Int) == -(x + y * z)"))]))
  let t315 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("-(x : Int) - -(y : Int) == -(x - y)"))]))
  let t314 = @simp.asm_rewrite_tac(@list.List([]))
  let t313 = @simp.rewrite_tac(@list.List([@int.int_rem_2_neg()]))
  let t312 = @simp.asm_rewrite_tac(@list.List([divstep_d_v1(), divstep_f_v1(), divstep_g_v1(), divstep_mat()]))
  let t311 = @simp.asm_rewrite_tac(@list.List([]))
  let t310 = @class.asm_cases_tac(@term_syntax.parse_term("rem((f : Int), int_of_num(2)) == int_of_num(1)"))
  let t309 = @tactics.replicate_tac(3, @tactics.then_tac(@simp.gen_rewrite_tac(fn(x308 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x308
  }, @list.List([@theorems.swap_forall_thm()])), @tactics.gen_tac))
  let t323 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.and_forall_thm()])), t309), t310), t311), @nums.induct_tac), t312), t313), @class.cond_cases_tac), t314), t315), t316), t317), t318), t319), t320), t321), t322)
  let t324 = (@term_syntax.parse_term("(∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, rem(f, int_of_num(2)) == int_of_num(1) → divstep_d(n, (d, -f, -g)) == divstep_d(n, (d, f, g))) && (∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, rem(f, int_of_num(2)) == int_of_num(1) → divstep_mat(n, (d, -f, -g)) == divstep_mat(n, (d, f, g))) && (∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, rem(f, int_of_num(2)) == int_of_num(1) → divstep_f(n, (d, -f, -g)) == -divstep_f(n, (d, f, g))) && (∀ n : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, rem(f, int_of_num(2)) == int_of_num(1) → divstep_g(n, (d, -f, -g)) == -divstep_g(n, (d, f, g)))"), t323)
  match @bool.conjuncts_rule((fn(x307 : (@kernel.Term, ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise)) -> @kernel.Thm raise {
    @tactics.prove(x307.0, x307.1)
  })(t324)) {
    More(divstep_d_neg, tail=More(divstep_mat_neg, tail=More(divstep_f_neg, tail=More(divstep_g_neg, tail=Empty)))) => {
      divstep_d_neg_c.set(divstep_d_neg)
      divstep_mat_neg_c.set(divstep_mat_neg)
      divstep_f_neg_c.set(divstep_f_neg)
      divstep_g_neg_c.set(divstep_g_neg)
      ()
    }
    _ => raise @lib.MatchFailure("tscript.ml:455:4")
  }
}

///|
/// DIVSTEP_CONGRUENCE_NEG
fn step_46() -> Unit raise {
  let t333 = @simp.asm_rewrite_tac(@list.List([@int.integer_rule(@term_syntax.parse_term("op_eq_eq(-(x : Int), (y : Int), mod((p : Int))) == op_eq_eq(x, -y, mod(p))"))]))
  let t332 = @simp.asm_simp_tac(@list.List([divstep_d_neg(), divstep_mat_neg(), divstep_f_neg(), divstep_g_neg()]))
  let t325 = @term_syntax.parse_term("(n : Num)")
  let t326 = @term_syntax.parse_term("(g' : Int)")
  let t327 = @term_syntax.parse_term("(f' : Int)")
  let t328 = @term_syntax.parse_term("-(g : Int)")
  let t329 = @term_syntax.parse_term("-(f : Int)")
  let t330 = @term_syntax.parse_term("(d : Int)")
  let t331 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(m : Num)"), t330, t329, t328, t327, t326, t325]), divstep_congruence()))
  let t334 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t331), t332), t333)
  divstep_congruence_neg_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Num, ∀ d : Int, ∀ f : Int, ∀ g : Int, ∀ f' : Int, ∀ g' : Int, ∀ n : Num, op_eq_eq(f, -f', mod(pow(int_of_num(2), m))) && op_eq_eq(g, -g', mod(pow(int_of_num(2), m))) && rem(f, int_of_num(2)) == int_of_num(1) && n <= m → divstep_d(n, (d, f, g)) == divstep_d(n, (d, f', g')) && divstep_mat(n, (d, f, g)) == divstep_mat(n, (d, f', g')) && op_eq_eq(divstep_f(n, (d, f, g)), -divstep_f(n, (d, f', g')), mod(pow(int_of_num(2), m - n))) && op_eq_eq(divstep_g(n, (d, f, g)), -divstep_g(n, (d, f', g')), mod(pow(int_of_num(2), m - n)))"), t334))
}

///|
let divstep_congruence_neg_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVSTEP_CONGRUENCE_NEG")

///|
/// `DIVSTEP_CONGRUENCE_NEG`
pub fn divstep_congruence_neg() -> @kernel.Thm {
  divstep_congruence_neg_c.get()
}

///|
/// hdivstep
fn step_47() -> Unit raise {
  hdivstep_c.set(@pair.new_definition(@term_syntax.parse_term("(hdivstep : ((Int, Int, Int)) -> (Int, Int, Int))(((d : Int), (f : Int), (g : Int))) == (if d > int_of_num(0) && rem(g, int_of_num(2)) == int_of_num(1) { (int_of_num(2) - d, g, div(g - f, int_of_num(2))) } else { (int_of_num(2) + d, f, div(g + rem(g, int_of_num(2)) * f, int_of_num(2))) })")))
}

///|
let hdivstep_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hdivstep")

///|
/// `hdivstep`
pub fn hdivstep() -> @kernel.Thm {
  hdivstep_c.get()
}

///|
/// HDIVSTEP_DIVSTEP
fn step_48() -> Unit raise {
  let t340 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.real_of_int_clauses())]))
  let t338 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) + (x : Real) / real_of_num(2) == (y : Real) / real_of_num(2)) == (real_of_num(2) + x == y)"))
  let t339 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) - (x : Real) / real_of_num(2) == (y : Real) / real_of_num(2)) == (real_of_num(2) - x == y)")), t338]))
  let t337 = @simp.asm_rewrite_tac(@list.List([@pair.pair_eq()]))
  let t336 = @simp.rewrite_tac(@list.List([@int.int_gt(), @int.int_of_num_th()]))
  let t335 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) / real_of_num(2) > real_of_num(0)) == (x > real_of_num(0))"))]))
  let t341 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([hdivstep(), @divstep.divstep()])), t335), t336), @class.cond_cases_tac), t337), @tactics.ap_thm_tac), @tactics.ap_term_tac), t339), t340)
  hdivstep_divstep_c.set(@tactics.prove(@term_syntax.parse_term("(hdivstep(((d : Int), (f : Int), (g : Int))) == ((d' : Int), (f' : Int), (g' : Int))) == (divstep((real_of_int(d) / real_of_num(2), f, g)) == (real_of_int(d') / real_of_num(2), f', g'))"), t341))
}

///|
let hdivstep_divstep_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HDIVSTEP_DIVSTEP")

///|
/// `HDIVSTEP_DIVSTEP`
pub fn hdivstep_divstep() -> @kernel.Thm {
  hdivstep_divstep_c.get()
}

///|
/// HDIVSTEP_IDIVSTEP
fn step_49() -> Unit raise {
  let t346 = @tactics.conv_tac(@int.int_reduce_conv)
  let t345 = @simp.asm_rewrite_tac(@list.List([]))
  let t344 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Int) == int_of_num(0)"))
  let t343 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("((d : Int) >= int_of_num(0)) == (d == int_of_num(0) || d > int_of_num(0))"))]))
  let t342 = @simp.rewrite_tac(@list.List([idivstep(), hdivstep()]))
  let t347 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t342), t343), t344), t345), t346)
  hdivstep_idivstep_c.set(@tactics.prove(@term_syntax.parse_term("∀ d : Int, ∀ f : Int, ∀ g : Int, rem(d, int_of_num(2)) == int_of_num(1) → hdivstep((d, f, g)) == idivstep((d, f, g))"), t347))
}

///|
let hdivstep_idivstep_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HDIVSTEP_IDIVSTEP")

///|
/// `HDIVSTEP_IDIVSTEP`
pub fn hdivstep_idivstep() -> @kernel.Thm {
  hdivstep_idivstep_c.get()
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
}
