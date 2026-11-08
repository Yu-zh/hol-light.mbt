// Translated from upstream 100/polyhedron.ml; edit this file directly.

///|
/// 100/polyhedron.ml:10
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// hyperplane_side
fn step_2() -> Unit raise {
  hyperplane_side_c.set(@pair.new_definition(@term_syntax.parse_term("(hyperplane_side : ((Cart[Real, N], Real), Cart[Real, N]) -> Real)(((a : Cart[Real, N]), (b : Real)), (x : Cart[Real, N])) == real_sgn(dot(a, x) - b)")))
}

///|
let hyperplane_side_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hyperplane_side")

///|
/// `hyperplane_side`
pub fn hyperplane_side() -> @kernel.Thm {
  hyperplane_side_c.get()
}

///|
/// hyperplane_equiv
fn step_3() -> Unit raise {
  hyperplane_equiv_c.set(@pair.new_definition(@term_syntax.parse_term("(hyperplane_equiv : (((Cart[Real, _], Real)) -> Bool, Cart[Real, _], Cart[Real, _]) -> Bool)((A : ((Cart[Real, _], Real)) -> Bool), (x : Cart[Real, _]), (y : Cart[Real, _])) == (∀ h : (Cart[Real, _], Real), IN(h, A) → hyperplane_side(h, x) == hyperplane_side(h, y))")))
}

///|
let hyperplane_equiv_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hyperplane_equiv")

///|
/// `hyperplane_equiv`
pub fn hyperplane_equiv() -> @kernel.Thm {
  hyperplane_equiv_c.get()
}

///|
/// HYPERPLANE_EQUIV_REFL
fn step_4() -> Unit raise {
  let t1 = @simp.rewrite_tac(@list.List([hyperplane_equiv()]))
  hyperplane_equiv_refl_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ x : Cart[Real, _], hyperplane_equiv(A, x, x)"), t1))
}

///|
let hyperplane_equiv_refl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_EQUIV_REFL")

///|
/// `HYPERPLANE_EQUIV_REFL`
pub fn hyperplane_equiv_refl() -> @kernel.Thm {
  hyperplane_equiv_refl_c.get()
}

///|
/// HYPERPLANE_EQUIV_SYM
fn step_5() -> Unit raise {
  let t2 = @simp.rewrite_tac(@list.List([hyperplane_equiv(), @theorems.eq_sym_eq()]))
  hyperplane_equiv_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ x : Cart[Real, _], ∀ y : Cart[Real, _], hyperplane_equiv(A, x, y) == hyperplane_equiv(A, y, x)"), t2))
}

///|
let hyperplane_equiv_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_EQUIV_SYM")

///|
/// `HYPERPLANE_EQUIV_SYM`
pub fn hyperplane_equiv_sym() -> @kernel.Thm {
  hyperplane_equiv_sym_c.get()
}

///|
/// HYPERPLANE_EQUIV_TRANS
fn step_6() -> Unit raise {
  let t3 = @meson.meson_tac(@list.List([]))
  let t4 = @tactics.then_tac(@simp.rewrite_tac(@list.List([hyperplane_equiv()])), t3)
  hyperplane_equiv_trans_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ x : Cart[Real, _], ∀ y : Cart[Real, _], ∀ z : Cart[Real, _], hyperplane_equiv(A, x, y) && hyperplane_equiv(A, y, z) → hyperplane_equiv(A, x, z)"), t4))
}

///|
let hyperplane_equiv_trans_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_EQUIV_TRANS")

///|
/// `HYPERPLANE_EQUIV_TRANS`
pub fn hyperplane_equiv_trans() -> @kernel.Thm {
  hyperplane_equiv_trans_c.get()
}

///|
/// HYPERPLANE_EQUIV_UNION
fn step_7() -> Unit raise {
  let t5 = @meson.meson_tac(@list.List([]))
  let t6 = @tactics.then_tac(@simp.rewrite_tac(@list.List([hyperplane_equiv(), @sets.in_union()])), t5)
  hyperplane_equiv_union_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ B : ((Cart[Real, _], Real)) -> Bool, ∀ x : Cart[Real, _], ∀ y : Cart[Real, _], hyperplane_equiv(UNION(A, B), x, y) == (hyperplane_equiv(A, x, y) && hyperplane_equiv(B, x, y))"), t6))
}

///|
let hyperplane_equiv_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_EQUIV_UNION")

///|
/// `HYPERPLANE_EQUIV_UNION`
pub fn hyperplane_equiv_union() -> @kernel.Thm {
  hyperplane_equiv_union_c.get()
}

///|
/// hyperplane_cell
fn step_8() -> Unit raise {
  hyperplane_cell_c.set(@pair.new_definition(@term_syntax.parse_term("(hyperplane_cell : (((Cart[Real, _], Real)) -> Bool, (Cart[Real, _]) -> Bool) -> Bool)((A : ((Cart[Real, _], Real)) -> Bool), (c : (Cart[Real, _]) -> Bool)) == (∃ x : Cart[Real, _], c == hyperplane_equiv(A, x))")))
}

///|
let hyperplane_cell_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hyperplane_cell")

///|
/// `hyperplane_cell`
pub fn hyperplane_cell() -> @kernel.Thm {
  hyperplane_cell_c.get()
}

///|
/// HYPERPLANE_CELL
fn step_9() -> Unit raise {
  let t7 = @meson.meson_tac(@list.List([]))
  let t8 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), hyperplane_cell(), @sets.in_elim_thm(), @sets.in_()])), t7)
  hyperplane_cell_v1_c.set(@tactics.prove(@term_syntax.parse_term("hyperplane_cell((A : ((Cart[Real, _], Real)) -> Bool), (c : (Cart[Real, _]) -> Bool)) == (∃ x : Cart[Real, _], c == {(y : Cart[Real, _]) | hyperplane_equiv(A, x, y)})"), t8))
}

///|
let hyperplane_cell_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL")

///|
/// `HYPERPLANE_CELL`
pub fn hyperplane_cell_v1() -> @kernel.Thm {
  hyperplane_cell_v1_c.get()
}

///|
/// NOT_HYPERPLANE_CELL_EMPTY
fn step_10() -> Unit raise {
  let t9 = @meson.meson_tac(@list.List([hyperplane_equiv_refl(), @sets.in_()]))
  let t10 = @tactics.then_tac(@simp.rewrite_tac(@list.List([hyperplane_cell(), @sets.extension(), @sets.not_in_empty()])), t9)
  not_hyperplane_cell_empty_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, !hyperplane_cell(A, {})"), t10))
}

///|
let not_hyperplane_cell_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_HYPERPLANE_CELL_EMPTY")

///|
/// `NOT_HYPERPLANE_CELL_EMPTY`
pub fn not_hyperplane_cell_empty() -> @kernel.Thm {
  not_hyperplane_cell_empty_c.get()
}

///|
/// NONEMPTY_HYPERPLANE_CELL
fn step_11() -> Unit raise {
  let t11 = @meson.meson_tac(@list.List([not_hyperplane_cell_empty()]))
  nonempty_hyperplane_cell_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ c : (Cart[Real, _]) -> Bool, hyperplane_cell(A, c) → !(c == {})"), t11))
}

///|
let nonempty_hyperplane_cell_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NONEMPTY_HYPERPLANE_CELL")

///|
/// `NONEMPTY_HYPERPLANE_CELL`
pub fn nonempty_hyperplane_cell() -> @kernel.Thm {
  nonempty_hyperplane_cell_c.get()
}

///|
/// UNIONS_HYPERPLANE_CELLS
fn step_12() -> Unit raise {
  let t13 = @meson.meson_tac(@list.List([hyperplane_equiv_refl(), @sets.in_()]))
  let t12 = @simp.rewrite_tac(@list.List([hyperplane_cell()]))
  let t14 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_unions(), @sets.in_univ(), @sets.in_elim_thm()])), t12), t13)
  unions_hyperplane_cells_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, UNIONS({(c : (Cart[Real, N]) -> Bool) | hyperplane_cell(A, c)}) == UNIV"), t14))
}

///|
let unions_hyperplane_cells_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("UNIONS_HYPERPLANE_CELLS")

///|
/// `UNIONS_HYPERPLANE_CELLS`
pub fn unions_hyperplane_cells() -> @kernel.Thm {
  unions_hyperplane_cells_c.get()
}

///|
/// DISJOINT_HYPERPLANE_CELLS
fn step_13() -> Unit raise {
  let t26 = @meson.asm_meson_tac(@list.List([hyperplane_equiv_trans(), hyperplane_equiv_sym()]))
  let t25 = @simp.asm_rewrite_tac(@list.List([@sets.in_disjoint(), @sets.in_(), @sets.extension()]))
  let t24 = @tactics.first_x_assum(fn(x23 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x16 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s17 = @tactics.mp_tac(x16)
      fn(x18 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s17(x18)
      }
    })(((x22 : @kernel.Thm) => @lib.check(fn(x21 : @kernel.Thm) -> Bool raise {
      (fn(x19 : @kernel.Term) -> Bool raise {
        @basics.is_neg(x19)
      })((fn(x20 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x20)
      })(x21))
    }, x22))(x23))
  })
  let t15 = @tactics.repeat_tac(@tactics.strip_tac)
  let t27 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([hyperplane_cell()])), t15), t24), t25), t26)
  disjoint_hyperplane_cells_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ c1 : (Cart[Real, _]) -> Bool, ∀ c2 : (Cart[Real, _]) -> Bool, hyperplane_cell(A, c1) && hyperplane_cell(A, c2) && !(c1 == c2) → DISJOINT(c1, c2)"), t27))
}

///|
let disjoint_hyperplane_cells_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISJOINT_HYPERPLANE_CELLS")

///|
/// `DISJOINT_HYPERPLANE_CELLS`
pub fn disjoint_hyperplane_cells() -> @kernel.Thm {
  disjoint_hyperplane_cells_c.get()
}

///|
/// DISJOINT_HYPERPLANE_CELLS_EQ
fn step_14() -> Unit raise {
  let t28 = @meson.meson_tac(@list.List([nonempty_hyperplane_cell(), disjoint_hyperplane_cells(), @sets.set_rule(@term_syntax.parse_term("DISJOINT((s : (_) -> Bool), s) == (s == {})"))]))
  disjoint_hyperplane_cells_eq_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ c1 : (Cart[Real, _]) -> Bool, ∀ c2 : (Cart[Real, _]) -> Bool, hyperplane_cell(A, c1) && hyperplane_cell(A, c2) → DISJOINT(c1, c2) == !(c1 == c2)"), t28))
}

///|
let disjoint_hyperplane_cells_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DISJOINT_HYPERPLANE_CELLS_EQ")

///|
/// `DISJOINT_HYPERPLANE_CELLS_EQ`
pub fn disjoint_hyperplane_cells_eq() -> @kernel.Thm {
  disjoint_hyperplane_cells_eq_c.get()
}

///|
/// HYPERPLANE_CELL_EMPTY
fn step_15() -> Unit raise {
  let t29 = @sets.set_tac(@list.List([]))
  let t30 = @tactics.then_tac(@simp.rewrite_tac(@list.List([hyperplane_cell_v1(), @sets.not_in_empty(), hyperplane_equiv()])), t29)
  hyperplane_cell_empty_c.set(@tactics.prove(@term_syntax.parse_term("hyperplane_cell({}, (c : (Cart[Real, N]) -> Bool)) == (c == UNIV)"), t30))
}

///|
let hyperplane_cell_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL_EMPTY")

///|
/// `HYPERPLANE_CELL_EMPTY`
pub fn hyperplane_cell_empty() -> @kernel.Thm {
  hyperplane_cell_empty_c.get()
}

///|
/// HYPERPLANE_CELL_SING_CASES
fn step_16() -> Unit raise {
  let t55 = @simp.simp_tac(@list.List([@realarith.real_sub_0(), @realarith.real_sub_lt(), @realax.real_gt(), @calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (y : Real) < real_of_num(0)) == (x < y)"))]))
  let t54 = @simp.asm_rewrite_tac(@list.List([@real.real_sgn_eq()]))
  let t52 = @bool.spec(@term_syntax.parse_term("dot((a : Cart[Real, N]), (y : Cart[Real, N])) - (b : Real)"), @real.real_sgn_cases())
  let t53 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s50 = @tactics.subst1_tac(x49)
    fn(x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s50(x51)
    }
  })(t52)
  let t48 = @simp.gen_rewrite_tac(fn(x47 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x43 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x37 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s38 = @equal.land_conv(x37)
        fn(x39 : @kernel.Term) -> @kernel.Thm raise {
          s38(x39)
        }
      })((fn(x40 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s41 = @equal.rand_conv(x40)
        fn(x42 : @kernel.Term) -> @kernel.Thm raise {
          s41(x42)
        }
      })(x43))
    })((fn(x44 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s45 = @equal.once_depth_conv(x44)
      fn(x46 : @kernel.Term) -> @kernel.Thm raise {
        s45(x46)
      }
    })(x47))
  }, @list.List([@theorems.eq_sym_eq()]))
  let t36 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(y : Cart[Real, N])"))(fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s34 = @tactics.mp_tac(x33)
    fn(x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s34(x35)
    }
  }))
  let t32 = @tactics.repeat_tac(@tactics.gen_tac)
  let t31 = @simp.rewrite_tac(@list.List([@theorems.forall_unwind_thm2(), @sets.in_sing(), hyperplane_side()]))
  let t56 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([hyperplane_cell_v1(), hyperplane_equiv()])), t31), t32), t36), t48), t53), t54), t55)
  hyperplane_cell_sing_cases_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Real, ∀ c : (Cart[Real, N]) -> Bool, hyperplane_cell({(a, b)}, c) → c == {(x : Cart[Real, N]) | dot(a, x) == b} || c == {(x : Cart[Real, N]) | dot(a, x) < b} || c == {(x : Cart[Real, N]) | dot(a, x) > b}"), t56))
}

///|
let hyperplane_cell_sing_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL_SING_CASES")

///|
/// `HYPERPLANE_CELL_SING_CASES`
pub fn hyperplane_cell_sing_cases() -> @kernel.Thm {
  hyperplane_cell_sing_cases_c.get()
}

///|
/// HYPERPLANE_CELL_SING
fn step_17() -> Unit raise {
  let t76 = @simp.asm_simp_tac(@list.List([@vectors.dot_rmul(), @real.real_div_rmul(), @vectors.dot_eq_0()]))
  let t73 = @tactics.exists_tac(@term_syntax.parse_term("op_pct(((b : Real) + real_of_num(1)) / dot((a : Cart[Real, N]), a), a)"))
  let t74 = @tactics.exists_tac(@term_syntax.parse_term("op_pct(((b : Real) - real_of_num(1)) / dot((a : Cart[Real, N]), a), a)"))
  let t75 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("op_pct((b : Real) / dot((a : Cart[Real, N]), a), a)")), t74, t73])
  let t72 = @simp.rewrite_tac(@list.List([@real.real_sgn_eq()]))
  let t71 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ x : _, (f : (_) -> _)(x) == (a : _)) → (∃ x : _, ∀ y : _, (f(y) == a) == (f(x) == f(y)))")))
  let t70 = @simp.rewrite_tac(@list.List([@realarith.real_sub_0()]))
  let t69 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_sgn_eq())]))
  let t66 = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) < (b : Real)) == (a - b < real_of_num(0))"))
  let t67 = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) > (b : Real)) == (a - b > real_of_num(0))"))
  let t68 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(dot((a : Cart[Real, _]), (x : Cart[Real, _])) == (b : Real)) == (dot(a, x) - b == real_of_num(0))")), t67, t66]))
  let t65 = @simp.rewrite_tac(@list.List([hyperplane_side()]))
  let t64 = @simp.asm_simp_tac(@list.List([@sets.in_sing(), @theorems.forall_unwind_thm2()]))
  let t63 = @simp.rewrite_tac(@list.List([hyperplane_equiv()]))
  let t62 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t61 = @simp.asm_rewrite_tac(@list.List([hyperplane_cell(), @sets.extension(), @sets.in_elim_thm()]))
  let t77 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.eq_tac, @simp.rewrite_tac(@list.List([hyperplane_cell_sing_cases()]))), @tactics.strip_tac), t61), t62), t63), t64), t65), t68), t69), t70), t71), t72), t75), t76), @calc_rat.real_arith_tac)
  let t60 = @simp.rewrite_tac(@list.List([hyperplane_side(), @vectors.dot_lzero()]))
  let t59 = @simp.asm_simp_tac(@list.List([@sets.in_sing(), @theorems.forall_unwind_thm2()]))
  let t58 = @simp.rewrite_tac(@list.List([hyperplane_equiv()]))
  let t57 = @simp.rewrite_tac(@list.List([@sets.in_()]))
  let t78 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([hyperplane_cell(), hyperplane_equiv(), @sets.extension(), @sets.in_univ()])), t57), t58), t59), t60), t77])
  let t79 = @tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @class.cond_cases_tac), t78)
  hyperplane_cell_sing_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, N], ∀ b : Real, ∀ c : (Cart[Real, N]) -> Bool, hyperplane_cell({(a, b)}, c) == (if a == vec(0) { c == UNIV } else { c == {(x : Cart[Real, N]) | dot(a, x) == b} || c == {(x : Cart[Real, N]) | dot(a, x) < b} || c == {(x : Cart[Real, N]) | dot(a, x) > b} })"), t79))
}

///|
let hyperplane_cell_sing_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL_SING")

///|
/// `HYPERPLANE_CELL_SING`
pub fn hyperplane_cell_sing() -> @kernel.Thm {
  hyperplane_cell_sing_c.get()
}

///|
/// HYPERPLANE_CELL_UNION
fn step_18() -> Unit raise {
  let t102 = @meson.meson_tac(@list.List([hyperplane_equiv_trans(), hyperplane_equiv_sym()]))
  let t101 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.in_elim_thm()]))
  let t100 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t99 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t98 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty())]))
  let t97 = @tactics.pop_assum(fn(x94 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s95 = @tactics.mp_tac(x94)
    fn(x96 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s95(x96)
    }
  })
  let t93 = @tactics.disch_then(fn(x90 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s91 = @tactics.subst_all_tac(x90)
    fn(x92 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s91(x92)
    }
  })
  let t88 = @term_syntax.parse_term("(b : Cart[Real, N])")
  let t89 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t88]))
  let t86 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t87 = @list.List([@meson.meson_tac(@list.List([])), t86])
  let t85 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ c1 : _, ∃ c2 : _, (∃ x : _, c1 == (f : (_) -> _)(x)) && (∃ y : _, c2 == (g : (_) -> _)(y)) && (P : (_, _) -> Bool)(c1, c2)) == (∃ x : _, ∃ y : _, P(f(x), g(y)))"))]))
  let t84 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(x : _) | (P : (_) -> Bool)(x) && (Q : (_) -> Bool)(x)} == INTER({(x : _) | P(x)}, {(x : _) | Q(x)})"))]))
  let t83 = @simp.rewrite_tac(@list.List([hyperplane_cell_v1(), hyperplane_equiv_union()]))
  let t81 = @simp.asm_rewrite_tac(@list.List([]))
  let t82 = @list.List([@meson.asm_meson_tac(@list.List([nonempty_hyperplane_cell()])), t81])
  let t80 = @class.asm_cases_tac(@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool) == {}"))
  let t103 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t80), t82), t83), t84), t85), @tactics.eq_tac), t87), t89), t93), t97), t98), t99), t100), t101), t102)
  hyperplane_cell_union_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ B : ((Cart[Real, N], Real)) -> Bool, ∀ c : (Cart[Real, N]) -> Bool, hyperplane_cell(UNION(A, B), c) == (!(c == {}) && (∃ c1 : (Cart[Real, N]) -> Bool, ∃ c2 : (Cart[Real, N]) -> Bool, hyperplane_cell(A, c1) && hyperplane_cell(B, c2) && c == INTER(c1, c2)))"), t103))
}

///|
let hyperplane_cell_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL_UNION")

///|
/// `HYPERPLANE_CELL_UNION`
pub fn hyperplane_cell_union() -> @kernel.Thm {
  hyperplane_cell_union_c.get()
}

///|
/// FINITE_HYPERPLANE_CELLS
fn step_19() -> Unit raise {
  let t118 = @meson.meson_tac(@list.List([@sets.inter_comm()]))
  let t119 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.subset()])), t118)
  let t117 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_sing(), hyperplane_cell_sing_cases(), @sets.in_elim_thm(), @sets.in_insert(), @sets.not_in_empty(), @sets.finite_insert(), @sets.finite_empty()]))
  let t116 = @tactics.exists_tac(@term_syntax.parse_term("{{(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) == (b : Real)}, {(x : Cart[Real, N]) | dot(a, x) < b}, {(x : Cart[Real, N]) | dot(a, x) > b}}"))
  let t115 = @tactics.match_mp_tac(@sets.finite_subset())
  let t114 = @tactics.repeat_tac(@tactics.strip_tac)
  let t113 = @simp.asm_rewrite_tac(@list.List([]))
  let t120 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_product_dependent()), t113), t114), t115), t116), t117), t119])
  let t112 = @tactics.exists_tac(@term_syntax.parse_term("{INTER((c1 : (Cart[Real, N]) -> Bool), (c2 : (Cart[Real, N]) -> Bool)) | IN(c1, {(c : (Cart[Real, N]) -> Bool) | hyperplane_cell((A : ((Cart[Real, N], Real)) -> Bool), c)}) && IN(c2, {(c : (Cart[Real, N]) -> Bool) | hyperplane_cell({((a : Cart[Real, N]), (b : Real))}, c)})}"))
  let t111 = @tactics.match_mp_tac(@sets.finite_subset())
  let t110 = @simp.rewrite_tac(@list.List([hyperplane_cell_union()]))
  let t109 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INSERT((a : _), (s : (_) -> Bool)) == UNION({a}, s)"))]))
  let t106 = @term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool)")
  let t107 = @term_syntax.parse_term("(b : Real)")
  let t108 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t107, t106]))
  let t105 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t104 = @simp.rewrite_tac(@list.List([hyperplane_cell_empty(), @sets.sing_gspec(), @sets.finite_sing()]))
  let t121 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_induct_strong()), t104), t105), t108), @tactics.strip_tac), t109), t110), t111), t112), @tactics.conj_tac), t120)
  finite_hyperplane_cells_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, FINITE(A) → FINITE({(c : (Cart[Real, N]) -> Bool) | hyperplane_cell(A, c)})"), t121))
}

///|
let finite_hyperplane_cells_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_HYPERPLANE_CELLS")

///|
/// `FINITE_HYPERPLANE_CELLS`
pub fn finite_hyperplane_cells() -> @kernel.Thm {
  finite_hyperplane_cells_c.get()
}

///|
/// FINITE_RESTRICT_HYPERPLANE_CELLS
fn step_20() -> Unit raise {
  let t125 = @sets.set_tac(@list.List([]))
  let t124 = @simp.asm_simp_tac(@list.List([finite_hyperplane_cells()]))
  let t123 = @tactics.exists_tac(@term_syntax.parse_term("{(c : (Cart[Real, N]) -> Bool) | hyperplane_cell((A : ((Cart[Real, N], Real)) -> Bool), c)}"))
  let t122 = @tactics.match_mp_tac(@sets.finite_subset())
  let t126 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t122), t123), t124), t125)
  finite_restrict_hyperplane_cells_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : ((Cart[Real, N]) -> Bool) -> Bool, ∀ A : ((Cart[Real, N], Real)) -> Bool, FINITE(A) → FINITE({(c : (Cart[Real, N]) -> Bool) | hyperplane_cell(A, c) && P(c)})"), t126))
}

///|
let finite_restrict_hyperplane_cells_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_RESTRICT_HYPERPLANE_CELLS")

///|
/// `FINITE_RESTRICT_HYPERPLANE_CELLS`
pub fn finite_restrict_hyperplane_cells() -> @kernel.Thm {
  finite_restrict_hyperplane_cells_c.get()
}

///|
/// FINITE_SET_OF_HYPERPLANE_CELLS
fn step_21() -> Unit raise {
  let t130 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t129 = @simp.asm_simp_tac(@list.List([finite_hyperplane_cells()]))
  let t128 = @tactics.exists_tac(@term_syntax.parse_term("{(c : (Cart[Real, N]) -> Bool) | hyperplane_cell((A : ((Cart[Real, N], Real)) -> Bool), c)}"))
  let t127 = @tactics.match_mp_tac(@sets.finite_subset())
  let t131 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t127), t128), t129), t130)
  finite_set_of_hyperplane_cells_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ C : ((Cart[Real, N]) -> Bool) -> Bool, FINITE(A) && (∀ c : (Cart[Real, N]) -> Bool, IN(c, C) → hyperplane_cell(A, c)) → FINITE(C)"), t131))
}

///|
let finite_set_of_hyperplane_cells_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SET_OF_HYPERPLANE_CELLS")

///|
/// `FINITE_SET_OF_HYPERPLANE_CELLS`
pub fn finite_set_of_hyperplane_cells_v1() -> @kernel.Thm {
  finite_set_of_hyperplane_cells_v1_c.get()
}

///|
/// PAIRWISE_DISJOINT_HYPERPLANE_CELLS
fn step_22() -> Unit raise {
  let t132 = @meson.meson_tac(@list.List([disjoint_hyperplane_cells()]))
  let t133 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.pairwise()])), t132)
  pairwise_disjoint_hyperplane_cells_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ C : ((Cart[Real, _]) -> Bool) -> Bool, (∀ c : (Cart[Real, _]) -> Bool, IN(c, C) → hyperplane_cell(A, c)) → pairwise(DISJOINT, C)"), t133))
}

///|
let pairwise_disjoint_hyperplane_cells_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("PAIRWISE_DISJOINT_HYPERPLANE_CELLS")

///|
/// `PAIRWISE_DISJOINT_HYPERPLANE_CELLS`
pub fn pairwise_disjoint_hyperplane_cells() -> @kernel.Thm {
  pairwise_disjoint_hyperplane_cells_c.get()
}

///|
/// HYPERPLANE_CELL_INTER_OPEN_AFFINE
fn step_23() -> Unit raise {
  let t207 = @simp.asm_rewrite_tac(@list.List([@topology.open_halfspace_gt()]))
  let t206 = @tactics.match_mp_tac(@topology.open_inter())
  let t205 = @simp.asm_rewrite_tac(@list.List([@sets.inter_aci()]))
  let t204 = @term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)")
  let t208 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x201 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s202 = @tactics.exists_tac(x201)
    fn(x203 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s202(x203)
    }
  }, @list.List([@term_syntax.parse_term("INTER({(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) > (b : Real)}, (s : (Cart[Real, N]) -> Bool))"), t204])), t205), t206), t207)
  let t200 = @simp.asm_rewrite_tac(@list.List([@topology.open_halfspace_lt()]))
  let t199 = @tactics.match_mp_tac(@topology.open_inter())
  let t198 = @simp.asm_rewrite_tac(@list.List([@sets.inter_aci()]))
  let t197 = @term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)")
  let t209 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x194 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s195 = @tactics.exists_tac(x194)
    fn(x196 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s195(x196)
    }
  }, @list.List([@term_syntax.parse_term("INTER({(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) < (b : Real)}, (s : (Cart[Real, N]) -> Bool))"), t197])), t198), t199), t200)
  let t193 = @simp.asm_rewrite_tac(@list.List([@convex.affine_hyperplane()]))
  let t192 = @tactics.match_mp_tac(@convex.affine_inter())
  let t191 = @simp.asm_rewrite_tac(@list.List([@sets.inter_aci()]))
  let t190 = @term_syntax.parse_term("INTER({(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) == (b : Real)}, (t : (Cart[Real, N]) -> Bool))")
  let t210 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x187 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s188 = @tactics.exists_tac(x187)
    fn(x189 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s188(x189)
    }
  }, @list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t190])), t191), t192), t193)
  let t186 = @simp.asm_rewrite_tac(@list.List([@sets.inter_univ()]))
  let t185 = @term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)")
  let t211 = @list.List([@tactics.then_tac(@tactics.map_every(fn(x182 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s183 = @tactics.exists_tac(x182)
    fn(x184 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s183(x184)
    }
  }, @list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t185])), t186), t210, t209, t208])
  let t181 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x178 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s179 = @tactics.subst_all_tac(x178)
    fn(x180 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s179(x180)
    }
  }))
  let t177 = @simp.asm_rewrite_tac(@list.List([]))
  let t176 = @simp.rewrite_tac(@list.List([hyperplane_cell_sing()]))
  let t174 = @term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)")
  let t175 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t174]))
  let t173 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t169 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)")
  let t172 = @tactics.first_x_assum(fn(x171 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x166 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s167 = @tactics.mp_tac(x166)
      fn(x168 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s167(x168)
      }
    })(((x170 : @kernel.Thm) => @bool.spec(t169, x170))(x171))
  })
  let t165 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x156 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s157 = @tactics.mp_tac(x156)
    fn(x158 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s157(x158)
    }
  }, @tactics.conjuncts_then2(fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s160 = @tactics.assume_tac(x159)
    fn(x161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s160(x161)
    }
  }, fn(x162 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s163 = @tactics.subst_all_tac(x162)
    fn(x164 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s163(x164)
    }
  })))
  let t154 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)")
  let t155 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c1 : (Cart[Real, N]) -> Bool)"), t154]))
  let t153 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t152 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x146 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s147 = @tactics.assume_tac(x146)
    fn(x148 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s147(x148)
    }
  }, fn(x149 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s150 = @tactics.mp_tac(x149)
    fn(x151 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s150(x151)
    }
  }))
  let t145 = @tactics.x_gen_tac(@term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool)"))
  let t144 = @simp.rewrite_tac(@list.List([hyperplane_cell_union()]))
  let t143 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INSERT((a : _), (s : (_) -> Bool)) == UNION({a}, s)"))]))
  let t140 = @term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool)")
  let t141 = @term_syntax.parse_term("(b : Real)")
  let t142 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t141, t140]))
  let t139 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t137 = @simp.asm_rewrite_tac(@list.List([@convex.affine_univ(), @topology.open_univ(), @sets.inter_univ()]))
  let t136 = @tactics.repeat_tac(@tactics.exists_tac(@term_syntax.parse_term("(UNIV : (Cart[Real, N]) -> Bool)")))
  let t135 = @tactics.repeat_tac(@tactics.strip_tac)
  let t138 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([hyperplane_cell_empty()])), t135), t136), t137), @tactics.all_tac])
  let t134 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t212 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()])), t134), @tactics.conj_tac), t138), t139), t142), @tactics.strip_tac), t143), t144), t145), t152), t153), t155), t165), t172), t173), t175), @tactics.strip_tac), t176), @class.cond_cases_tac), t177), @tactics.strip_tac), t181), t211)
  hyperplane_cell_inter_open_affine_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ c : (Cart[Real, N]) -> Bool, FINITE(A) && hyperplane_cell(A, c) → (∃ s : (Cart[Real, N]) -> Bool, ∃ t : (Cart[Real, N]) -> Bool, open(s) && affine(t) && c == INTER(s, t))"), t212))
}

///|
let hyperplane_cell_inter_open_affine_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL_INTER_OPEN_AFFINE")

///|
/// `HYPERPLANE_CELL_INTER_OPEN_AFFINE`
pub fn hyperplane_cell_inter_open_affine() -> @kernel.Thm {
  hyperplane_cell_inter_open_affine_c.get()
}

///|
/// HYPERPLANE_CELL_RELATIVELY_OPEN
fn step_24() -> Unit raise {
  let t236 = @simp.asm_simp_tac(@list.List([@topology.open_in_open_inter()]))
  let t237 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.inter_comm()])), t236)
  let t235 = @simp.asm_simp_tac(@list.List([@convex.affine_imp_convex()]))
  let t234 = @tactics.match_mp_tac(@simp.once_rewrite_rule(@list.List([@sets.inter_comm()]))(@convex.affine_hull_convex_inter_open()))
  let t233 = @simp.asm_rewrite_tac(@list.List([@convex.affine_hull_eq()]))
  let t232 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, (t : (Cart[Real, N]) -> Bool))"))
  let t238 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t232), t233), t234), t235), t237])
  let t231 = @tactics.subgoal_then(@term_syntax.parse_term("hull(affine, INTER((s : (Cart[Real, N]) -> Bool), (t : (Cart[Real, N]) -> Bool))) == t"), fn(x228 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s229 = @tactics.subst1_tac(x228)
    fn(x230 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s229(x230)
    }
  })
  let t227 = @simp.asm_rewrite_tac(@list.List([@metric.open_in_empty()]))
  let t226 = @class.asm_cases_tac(@term_syntax.parse_term("INTER((s : (Cart[Real, N]) -> Bool), (t : (Cart[Real, N]) -> Bool)) == {}"))
  let t225 = @tactics.first_x_assum(fn(x222 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s223 = @tactics.subst_all_tac(x222)
    fn(x224 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s223(x224)
    }
  })
  let t220 = @term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)")
  let t221 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t220]))
  let t219 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t216 = @drule.match_mp(hyperplane_cell_inter_open_affine())
  let t218 = @tactics.first_assum(fn(x217 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s214 = @tactics.mp_tac(x213)
      fn(x215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s214(x215)
      }
    })(t216(x217))
  })
  let t239 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t218), t219), t221), @tactics.strip_tac), t225), t226), t227), t231), t238)
  hyperplane_cell_relatively_open_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ c : (Cart[Real, N]) -> Bool, FINITE(A) && hyperplane_cell(A, c) → open_in(subtopology(euclidean, hull(affine, c)), c)"), t239))
}

///|
let hyperplane_cell_relatively_open_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL_RELATIVELY_OPEN")

///|
/// `HYPERPLANE_CELL_RELATIVELY_OPEN`
pub fn hyperplane_cell_relatively_open() -> @kernel.Thm {
  hyperplane_cell_relatively_open_c.get()
}

///|
/// HYPERPLANE_CELL_RELATIVE_INTERIOR
fn step_25() -> Unit raise {
  let t240 = @meson.meson_tac(@list.List([@convex.relative_interior_open_in(), hyperplane_cell_relatively_open()]))
  hyperplane_cell_relative_interior_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ c : (Cart[Real, N]) -> Bool, FINITE(A) && hyperplane_cell(A, c) → relative_interior(c) == c"), t240))
}

///|
let hyperplane_cell_relative_interior_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL_RELATIVE_INTERIOR")

///|
/// `HYPERPLANE_CELL_RELATIVE_INTERIOR`
pub fn hyperplane_cell_relative_interior() -> @kernel.Thm {
  hyperplane_cell_relative_interior_c.get()
}

///|
/// HYPERPLANE_CELL_CONVEX
fn step_26() -> Unit raise {
  let t264 = @simp.rewrite_tac(@list.List([@convex.convex_halfspace_lt(), @convex.convex_halfspace_gt(), @convex.convex_hyperplane()]))
  let t262 = @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real) < real_of_num(0)) == (a < b)"))
  let t263 = @simp.simp_tac(@list.List([@realarith.real_sub_0(), @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real) > real_of_num(0)) == (a > b)")), t262]))
  let t261 = @simp.asm_rewrite_tac(@list.List([@real.real_sgn_eq()]))
  let t259 = @bool.spec(@term_syntax.parse_term("dot((a : Cart[Real, N]), (c : Cart[Real, N])) - (b : Real)"), @real.real_sgn_cases())
  let t260 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x256 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s257 = @tactics.subst1_tac(x256)
    fn(x258 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s257(x258)
    }
  })(t259)
  let t255 = @simp.rewrite_tac(@list.List([hyperplane_side()]))
  let t254 = @tactics.conv_tac(@equal.once_depth_conv(@equal.sym_conv))
  let t252 = @term_syntax.parse_term("(b : Real)")
  let t253 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t252]))
  let t251 = @simp.rewrite_tac(@list.List([@pair.forall_pair_thm()]))
  let t250 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t249 = @tactics.match_mp_tac(@convex.convex_inters())
  let t248 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.inters_image())]))
  let t247 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("((f : (_) -> _)((x : _)) == f((y : _))) == IN(y, {(y : _) | f(x) == f(y)})"))]))
  let t246 = @simp.rewrite_tac(@list.List([hyperplane_equiv()]))
  let t245 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c : Cart[Real, N])"))(fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s243 = @tactics.subst1_tac(x242)
    fn(x244 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s243(x244)
    }
  }))
  let t241 = @simp.rewrite_tac(@list.List([hyperplane_cell_v1()]))
  let t265 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t241), t245), t246), t247), t248), t249), t250), t251), t253), @tactics.disch_tac), t254), t255), t260), t261), t263), t264)
  hyperplane_cell_convex_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ c : (Cart[Real, N]) -> Bool, hyperplane_cell(A, c) → convex(c)"), t265))
}

///|
let hyperplane_cell_convex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL_CONVEX")

///|
/// `HYPERPLANE_CELL_CONVEX`
pub fn hyperplane_cell_convex() -> @kernel.Thm {
  hyperplane_cell_convex_c.get()
}

///|
/// HYPERPLANE_CELL_INTERS
fn step_27() -> Unit raise {
  let t300 = @meson.asm_meson_tac(@list.List([hyperplane_equiv_sym(), hyperplane_equiv_trans()]))
  let t299 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t298 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@sets.in_elim_thm()])))
  let t297 = @tactics.first_x_assum(@tactics.choose_then(fn(x294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s295 = @tactics.subst_all_tac(x294)
    fn(x296 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s295(x296)
    }
  }))
  let t293 = @tactics.repeat_tac(@tactics.disch_tac)
  let t292 = @simp.asm_rewrite_tac(@list.List([]))
  let t288 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)")
  let t291 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x290 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x285 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s286 = @tactics.mp_tac(x285)
      fn(x287 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s286(x287)
      }
    })(((x289 : @kernel.Thm) => @bool.spec(t288, x289))(x290))
  }))
  let t283 = @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)")), @tactics.disch_tac)
  let t281 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)")
  let t284 = @list.List([@tactics.first_x_assum((x282 : @kernel.Thm) => @tactics.x_choose_tac(t281, x282)), t283])
  let t280 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t279 = @simp.rewrite_tac(@list.List([@sets.in_inters(), @sets.in_elim_thm()]))
  let t278 = @simp.gen_rewrite_tac(fn(x277 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x277
  }, @list.List([@sets.extension()]))
  let t276 = @simp.rewrite_tac(@list.List([@sets.in_inters()]))
  let t275 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, N])"))
  let t274 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t273 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x267 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s268 = @tactics.assume_tac(x267)
    fn(x269 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s268(x269)
    }
  }, fn(x270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s271 = @tactics.mp_tac(x270)
    fn(x272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s271(x272)
    }
  })))
  let t266 = @simp.rewrite_tac(@list.List([hyperplane_cell_v1(), @equal.gsym(@sets.member_not_empty())]))
  let t301 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t266), t273), t274), t275), t276), @tactics.disch_tac), t278), t279), t280), @tactics.eq_tac), @tactics.disch_tac), t284), t291), t292), t293), t297), t298), t299), t300)
  hyperplane_cell_inters_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ C : ((Cart[Real, N]) -> Bool) -> Bool, (∀ c : (Cart[Real, N]) -> Bool, IN(c, C) → hyperplane_cell(A, c)) && !(C == {}) && !(INTERS(C) == {}) → hyperplane_cell(A, INTERS(C))"), t301))
}

///|
let hyperplane_cell_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL_INTERS")

///|
/// `HYPERPLANE_CELL_INTERS`
pub fn hyperplane_cell_inters() -> @kernel.Thm {
  hyperplane_cell_inters_c.get()
}

///|
/// HYPERPLANE_CELL_INTER
fn step_28() -> Unit raise {
  let t304 = @simp.asm_rewrite_tac(@list.List([@sets.forall_in_insert(), @sets.not_in_empty(), @sets.not_insert_empty()]))
  let t303 = @tactics.match_mp_tac(hyperplane_cell_inters())
  let t302 = @tactics.repeat_tac(@tactics.strip_tac)
  let t305 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.inters_2())])), t302), t303), t304)
  hyperplane_cell_inter_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, hyperplane_cell(A, s) && hyperplane_cell(A, t) && !(INTER(s, t) == {}) → hyperplane_cell(A, INTER(s, t))"), t305))
}

///|
let hyperplane_cell_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL_INTER")

///|
/// `HYPERPLANE_CELL_INTER`
pub fn hyperplane_cell_inter() -> @kernel.Thm {
  hyperplane_cell_inter_c.get()
}

///|
/// hyperplane_cellcomplex
fn step_29() -> Unit raise {
  hyperplane_cellcomplex_c.set(@pair.new_definition(@term_syntax.parse_term("(hyperplane_cellcomplex : (((Cart[Real, _], Real)) -> Bool, (Cart[Real, _]) -> Bool) -> Bool)((A : ((Cart[Real, _], Real)) -> Bool), (s : (Cart[Real, _]) -> Bool)) == (∃ t : ((Cart[Real, _]) -> Bool) -> Bool, (∀ c : (Cart[Real, _]) -> Bool, IN(c, t) → hyperplane_cell(A, c)) && s == UNIONS(t))")))
}

///|
let hyperplane_cellcomplex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("hyperplane_cellcomplex")

///|
/// `hyperplane_cellcomplex`
pub fn hyperplane_cellcomplex() -> @kernel.Thm {
  hyperplane_cellcomplex_c.get()
}

///|
/// HYPERPLANE_CELLCOMPLEX_EMPTY
fn step_30() -> Unit raise {
  let t307 = @simp.rewrite_tac(@list.List([@sets.not_in_empty(), @sets.unions_0()]))
  let t306 = @tactics.exists_tac(@term_syntax.parse_term("({} : ((Cart[Real, N]) -> Bool) -> Bool)"))
  let t308 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([hyperplane_cellcomplex()]))), t306), t307)
  hyperplane_cellcomplex_empty_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, hyperplane_cellcomplex(A, {})"), t308))
}

///|
let hyperplane_cellcomplex_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELLCOMPLEX_EMPTY")

///|
/// `HYPERPLANE_CELLCOMPLEX_EMPTY`
pub fn hyperplane_cellcomplex_empty() -> @kernel.Thm {
  hyperplane_cellcomplex_empty_c.get()
}

///|
/// HYPERPLANE_CELL_CELLCOMPLEX
fn step_31() -> Unit raise {
  let t311 = @simp.asm_simp_tac(@list.List([@sets.in_sing(), @sets.unions_1()]))
  let t310 = @tactics.exists_tac(@term_syntax.parse_term("{(c : (Cart[Real, N]) -> Bool)}"))
  let t309 = @simp.rewrite_tac(@list.List([hyperplane_cellcomplex()]))
  let t312 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t309), t310), t311)
  hyperplane_cell_cellcomplex_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ c : (Cart[Real, N]) -> Bool, hyperplane_cell(A, c) → hyperplane_cellcomplex(A, c)"), t312))
}

///|
let hyperplane_cell_cellcomplex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELL_CELLCOMPLEX")

///|
/// `HYPERPLANE_CELL_CELLCOMPLEX`
pub fn hyperplane_cell_cellcomplex() -> @kernel.Thm {
  hyperplane_cell_cellcomplex_c.get()
}

///|
/// HYPERPLANE_CELLCOMPLEX_UNIONS
fn step_32() -> Unit raise {
  let t332 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t331 = @simp.rewrite_tac(@list.List([@sets.in_unions(), @sets.in_elim_thm()]))
  let t330 = @simp.gen_rewrite_tac(fn(x329 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x329
  }, @list.List([@sets.extension()]))
  let t327 = @simp.rewrite_tac(@list.List([@sets.unions_image()]))
  let t328 = @list.List([@meson.asm_meson_tac(@list.List([])), t327])
  let t326 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t325 = @simp.rewrite_tac(@list.List([@sets.forall_in_unions(), @theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t324 = @tactics.exists_tac(@term_syntax.parse_term("UNIONS(IMAGE((f : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool), (C : ((Cart[Real, N]) -> Bool) -> Bool)))"))
  let t323 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)"))
  let t322 = @simp.rewrite_tac(@list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]))
  let t321 = @simp.gen_rewrite_tac(fn(x320 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x314 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s315 = @equal.land_conv(x314)
      fn(x316 : @kernel.Term) -> @kernel.Thm raise {
        s315(x316)
      }
    })((fn(x317 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s318 = @equal.once_depth_conv(x317)
      fn(x319 : @kernel.Term) -> @kernel.Thm raise {
        s318(x319)
      }
    })(x320))
  }, @list.List([@class.right_imp_exists_thm()]))
  let t313 = @simp.rewrite_tac(@list.List([hyperplane_cellcomplex()]))
  let t333 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t313), t321), t322), t323), @tactics.disch_tac), t324), t325), t326), @tactics.conj_tac), t328), t330), t331), t332)
  hyperplane_cellcomplex_unions_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ C : ((Cart[Real, N]) -> Bool) -> Bool, (∀ s : (Cart[Real, N]) -> Bool, IN(s, C) → hyperplane_cellcomplex(A, s)) → hyperplane_cellcomplex(A, UNIONS(C))"), t333))
}

///|
let hyperplane_cellcomplex_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELLCOMPLEX_UNIONS")

///|
/// `HYPERPLANE_CELLCOMPLEX_UNIONS`
pub fn hyperplane_cellcomplex_unions() -> @kernel.Thm {
  hyperplane_cellcomplex_unions_c.get()
}

///|
/// HYPERPLANE_CELLCOMPLEX_UNION
fn step_33() -> Unit raise {
  let t336 = @simp.asm_rewrite_tac(@list.List([@sets.forall_in_insert(), @sets.not_in_empty()]))
  let t335 = @tactics.match_mp_tac(hyperplane_cellcomplex_unions())
  let t334 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.unions_2())]))
  let t337 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t334), t335), t336)
  hyperplane_cellcomplex_union_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, hyperplane_cellcomplex(A, s) && hyperplane_cellcomplex(A, t) → hyperplane_cellcomplex(A, UNION(s, t))"), t337))
}

///|
let hyperplane_cellcomplex_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELLCOMPLEX_UNION")

///|
/// `HYPERPLANE_CELLCOMPLEX_UNION`
pub fn hyperplane_cellcomplex_union() -> @kernel.Thm {
  hyperplane_cellcomplex_union_c.get()
}

///|
/// HYPERPLANE_CELLCOMPLEX_UNIV
fn step_34() -> Unit raise {
  let t340 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), hyperplane_cell_cellcomplex()]))
  let t339 = @tactics.match_mp_tac(hyperplane_cellcomplex_unions())
  let t338 = @simp.rewrite_tac(@list.List([@equal.gsym(unions_hyperplane_cells())]))
  let t341 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t338), t339), t340)
  hyperplane_cellcomplex_univ_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, hyperplane_cellcomplex(A, UNIV)"), t341))
}

///|
let hyperplane_cellcomplex_univ_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELLCOMPLEX_UNIV")

///|
/// `HYPERPLANE_CELLCOMPLEX_UNIV`
pub fn hyperplane_cellcomplex_univ() -> @kernel.Thm {
  hyperplane_cellcomplex_univ_c.get()
}

///|
/// HYPERPLANE_CELLCOMPLEX_INTERS
fn step_35() -> Unit raise {
  let t345 = @meson.meson_tac(@list.List([@sets.not_in_empty()]))
  let t344 = @simp.rewrite_tac(@list.List([@sets.in_unions(), @sets.in_elim_thm()]))
  let t343 = @simp.gen_rewrite_tac(fn(x342 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x342
  }, @list.List([@sets.extension()]))
  let t346 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.unions_gspec()])), t343), t344), t345)
  let lemma = @tactics.prove(@term_syntax.parse_term("UNIONS((s : ((_) -> Bool) -> Bool)) == UNIONS({(t : (_) -> Bool) | IN(t, s) && !(t == {})})"), t346)
  let t375 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t376 = @list.List([@meson.asm_meson_tac(@list.List([])), t375])
  let t374 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t373 = @tactics.match_mp_tac(hyperplane_cell_inters())
  let t372 = @tactics.match_mp_tac(hyperplane_cell_cellcomplex())
  let t371 = @tactics.repeat_tac(@tactics.strip_tac)
  let t370 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec(), @theorems.imp_conj()]))
  let t369 = @tactics.match_mp_tac(hyperplane_cellcomplex_unions())
  let t368 = @simp.once_rewrite_tac(@list.List([lemma]))
  let t367 = @simp.rewrite_tac(@list.List([@sets.inters_over_unions()]))
  let t365 = @meson.asm_meson_tac(@list.List([]))
  let t364 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t366 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x363 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x363
  }, @list.List([@sets.extension()])), t364), t365), @tactics.all_tac])
  let t362 = @tactics.subgoal_then(@term_syntax.parse_term("(C : ((Cart[Real, N]) -> Bool) -> Bool) == {UNIONS((f : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)((s : (Cart[Real, N]) -> Bool))) | IN(s, C)}"), fn(x359 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s360 = @tactics.subst1_tac(x359)
    fn(x361 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s360(x361)
    }
  })
  let t358 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)"))
  let t357 = @simp.rewrite_tac(@list.List([@class.right_imp_exists_thm(), @class.skolem_thm(), @theorems.left_imp_exists_thm()]))
  let t356 = @simp.gen_rewrite_tac(fn(x355 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x349 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s350 = @equal.land_conv(x349)
      fn(x351 : @kernel.Term) -> @kernel.Thm raise {
        s350(x351)
      }
    })((fn(x352 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s353 = @equal.once_depth_conv(x352)
      fn(x354 : @kernel.Term) -> @kernel.Thm raise {
        s353(x354)
      }
    })(x355))
  }, @list.List([hyperplane_cellcomplex()]))
  let t348 = @simp.asm_rewrite_tac(@list.List([@sets.inters_0(), hyperplane_cellcomplex_univ()]))
  let t347 = @class.asm_cases_tac(@term_syntax.parse_term("(C : ((Cart[Real, N]) -> Bool) -> Bool) == {}"))
  let t377 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t347), t348), t356), t357), t358), @tactics.disch_tac), t362), t366), t367), t368), t369), t370), t371), t372), t373), t374), @tactics.conj_tac), t376)
  hyperplane_cellcomplex_inters_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ C : ((Cart[Real, N]) -> Bool) -> Bool, (∀ s : (Cart[Real, N]) -> Bool, IN(s, C) → hyperplane_cellcomplex(A, s)) → hyperplane_cellcomplex(A, INTERS(C))"), t377))
}

///|
let hyperplane_cellcomplex_inters_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELLCOMPLEX_INTERS")

///|
/// `HYPERPLANE_CELLCOMPLEX_INTERS`
pub fn hyperplane_cellcomplex_inters() -> @kernel.Thm {
  hyperplane_cellcomplex_inters_c.get()
}

///|
/// HYPERPLANE_CELLCOMPLEX_INTER
fn step_36() -> Unit raise {
  let t380 = @simp.asm_rewrite_tac(@list.List([@sets.forall_in_insert(), @sets.not_in_empty()]))
  let t379 = @tactics.match_mp_tac(hyperplane_cellcomplex_inters())
  let t378 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.inters_2())]))
  let t381 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t378), t379), t380)
  hyperplane_cellcomplex_inter_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, hyperplane_cellcomplex(A, s) && hyperplane_cellcomplex(A, t) → hyperplane_cellcomplex(A, INTER(s, t))"), t381))
}

///|
let hyperplane_cellcomplex_inter_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELLCOMPLEX_INTER")

///|
/// `HYPERPLANE_CELLCOMPLEX_INTER`
pub fn hyperplane_cellcomplex_inter() -> @kernel.Thm {
  hyperplane_cellcomplex_inter_c.get()
}

///|
/// HYPERPLANE_CELLCOMPLEX_COMPL
fn step_37() -> Unit raise {
  let t414 = @simp.asm_simp_tac(@list.List([hyperplane_cell_cellcomplex(), @sets.in_elim_thm()]))
  let t415 = @tactics.then_tac(@tactics.match_mp_tac(hyperplane_cellcomplex_unions()), t414)
  let t413 = @sets.set_tac(@list.List([]))
  let t412 = @simp.asm_simp_tac(@list.List([]))
  let t409 = @term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool)")
  let t410 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)")
  let t411 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool)"), t410, t409]), disjoint_hyperplane_cells_eq()))
  let t408 = @simp.rewrite_tac(@list.List([]))
  let t407 = @tactics.x_gen_tac(@term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool)"))
  let t406 = @simp.gen_rewrite_tac(fn(x405 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x405
  }, @list.List([@class.fun_eq_thm()]))
  let t404 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t403 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t402 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.unions_gspec(), @sets.in_elim_thm()]))
  let t401 = @simp.gen_rewrite_tac(fn(x400 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x400
  }, @list.List([@sets.extension()]))
  let t416 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool)"), unions_hyperplane_cells()))), t401), t402), t403), t404), @tactics.ap_term_tac), t406), t407), t408), t411), t412), t413), t415])
  let t399 = @tactics.subgoal_then(@term_syntax.parse_term("DIFF(UNIV, (c : (Cart[Real, N]) -> Bool)) == UNIONS({(c' : (Cart[Real, N]) -> Bool) | hyperplane_cell((A : ((Cart[Real, N], Real)) -> Bool), c') && !(c' == c)})"), fn(x396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s397 = @tactics.subst1_tac(x396)
    fn(x398 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s397(x398)
    }
  })
  let t395 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)"))
  let t394 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t393 = @tactics.match_mp_tac(hyperplane_cellcomplex_inters())
  let t392 = @simp.asm_rewrite_tac(@list.List([@sets.unions_inters(), @sets.compl_compl()]))
  let t391 = @tactics.x_gen_tac(@term_syntax.parse_term("(C : ((Cart[Real, N]) -> Bool) -> Bool)"))
  let t390 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t389 = @simp.gen_rewrite_tac(fn(x388 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x382 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s383 = @equal.land_conv(x382)
      fn(x384 : @kernel.Term) -> @kernel.Thm raise {
        s383(x384)
      }
    })((fn(x385 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s386 = @equal.once_depth_conv(x385)
      fn(x387 : @kernel.Term) -> @kernel.Thm raise {
        s386(x387)
      }
    })(x388))
  }, @list.List([hyperplane_cellcomplex()]))
  let t417 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t389), t390), t391), @tactics.strip_tac), t392), t393), t394), t395), @tactics.disch_tac), t399), t416)
  hyperplane_cellcomplex_compl_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ s : (Cart[Real, N]) -> Bool, hyperplane_cellcomplex(A, s) → hyperplane_cellcomplex(A, DIFF(UNIV, s))"), t417))
}

///|
let hyperplane_cellcomplex_compl_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELLCOMPLEX_COMPL")

///|
/// `HYPERPLANE_CELLCOMPLEX_COMPL`
pub fn hyperplane_cellcomplex_compl() -> @kernel.Thm {
  hyperplane_cellcomplex_compl_c.get()
}

///|
/// HYPERPLANE_CELLCOMPLEX_DIFF
fn step_38() -> Unit raise {
  let t418 = @simp.simp_tac(@list.List([hyperplane_cellcomplex_compl(), hyperplane_cellcomplex_inter()]))
  let t419 = @tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("DIFF((s : (_) -> Bool), (t : (_) -> Bool)) == INTER(s, DIFF(UNIV, t))"))])), t418)
  hyperplane_cellcomplex_diff_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ s : (Cart[Real, _]) -> Bool, ∀ t : (Cart[Real, _]) -> Bool, hyperplane_cellcomplex(A, s) && hyperplane_cellcomplex(A, t) → hyperplane_cellcomplex(A, DIFF(s, t))"), t419))
}

///|
let hyperplane_cellcomplex_diff_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELLCOMPLEX_DIFF")

///|
/// `HYPERPLANE_CELLCOMPLEX_DIFF`
pub fn hyperplane_cellcomplex_diff() -> @kernel.Thm {
  hyperplane_cellcomplex_diff_c.get()
}

///|
/// HYPERPLANE_CELLCOMPLEX_MONO
fn step_39() -> Unit raise {
  let t467 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t466 = @simp.rewrite_tac(@list.List([@sets.in_unions(), @sets.in_elim_thm(), @sets.in_univ()]))
  let t465 = @simp.gen_rewrite_tac(fn(x462 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s463 = @equal.land_conv(x462)
    fn(x464 : @kernel.Term) -> @kernel.Thm raise {
      s463(x464)
    }
  }, @list.List([@sets.extension()]))
  let t461 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("DIFF((B : ((Cart[Real, N], Real)) -> Bool), (A : ((Cart[Real, N], Real)) -> Bool))"), unions_hyperplane_cells()))
  let t460 = @list.List([@tactics.disch_tac, @meson.meson_tac(@list.List([]))])
  let t459 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t458 = @simp.rewrite_tac(@list.List([@sets.unions_gspec(), @sets.in_elim_thm(), @sets.in_inter()]))
  let t468 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x457 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x457
  }, @list.List([@sets.extension()])), t458), t459), @tactics.eq_tac), t460), t461), t465), t466), t467)
  let t456 = @simp.asm_rewrite_tac(@list.List([@sets.inter_comm()]))
  let t454 = @term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool)")
  let t455 = @tactics.map_every(fn(x451 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s452 = @tactics.exists_tac(x451)
    fn(x453 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s452(x453)
    }
  }, @list.List([@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)"), t454]))
  let t450 = @simp.asm_rewrite_tac(@list.List([]))
  let t469 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool)")), @tactics.strip_tac), t450), t455), t456), t468])
  let t449 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t448 = @tactics.exists_tac(@term_syntax.parse_term("{INTER(c', (c : (Cart[Real, N]) -> Bool)) | c' : (Cart[Real, N]) -> Bool | hyperplane_cell(DIFF((B : ((Cart[Real, N], Real)) -> Bool), (A : ((Cart[Real, N], Real)) -> Bool)), c') && !(INTER(c', c) == {})}"))
  let t447 = @simp.rewrite_tac(@list.List([hyperplane_cellcomplex(), hyperplane_cell_union()]))
  let t446 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t445 = @tactics.subgoal_then(@term_syntax.parse_term("(B : ((Cart[Real, N], Real)) -> Bool) == UNION((A : ((Cart[Real, N], Real)) -> Bool), DIFF(B, A))"), fn(x442 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s443 = @tactics.subst1_tac(x442)
    fn(x444 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s443(x444)
    }
  })
  let t441 = @simp.asm_rewrite_tac(@list.List([]))
  let t437 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)")
  let t440 = @tactics.first_x_assum(fn(x439 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x434 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s435 = @tactics.mp_tac(x434)
      fn(x436 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s435(x436)
      }
    })(((x438 : @kernel.Thm) => @bool.spec(t437, x438))(x439))
  })
  let t433 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)"))
  let t432 = @tactics.match_mp_tac(hyperplane_cellcomplex_unions())
  let t431 = @tactics.first_x_assum(fn(x428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s429 = @tactics.subst_all_tac(x428)
    fn(x430 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s429(x430)
    }
  })
  let t427 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(C : ((Cart[Real, N]) -> Bool) -> Bool)"))(@tactics.strip_assume_tac))
  let t424 = @simp.gen_rewrite_rule(fn(x423 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x423
  }, @list.List([hyperplane_cellcomplex()]))
  let t426 = @tactics.first_assum(fn(x425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s421 = @tactics.mp_tac(x420)
      fn(x422 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s421(x422)
      }
    })(t424(x425))
  })
  let t470 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t426), t427), t431), t432), t433), @tactics.disch_tac), t440), t441), @tactics.disch_tac), t445), t446), t447), t448), t449), @tactics.conj_tac), t469)
  hyperplane_cellcomplex_mono_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ B : ((Cart[Real, N], Real)) -> Bool, ∀ s : (Cart[Real, N]) -> Bool, hyperplane_cellcomplex(A, s) && SUBSET(A, B) → hyperplane_cellcomplex(B, s)"), t470))
}

///|
let hyperplane_cellcomplex_mono_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELLCOMPLEX_MONO")

///|
/// `HYPERPLANE_CELLCOMPLEX_MONO`
pub fn hyperplane_cellcomplex_mono() -> @kernel.Thm {
  hyperplane_cellcomplex_mono_c.get()
}

///|
/// FINITE_HYPERPLANE_CELLCOMPLEXES
fn step_40() -> Unit raise {
  let t475 = @meson.meson_tac(@list.List([]))
  let t474 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_image(), @sets.in_elim_thm(), hyperplane_cellcomplex()]))
  let t473 = @simp.asm_simp_tac(@list.List([@sets.finite_image(), @sets.finite_powerset(), finite_hyperplane_cells()]))
  let t472 = @tactics.exists_tac(@term_syntax.parse_term("IMAGE(UNIONS, {(t : ((Cart[Real, N]) -> Bool) -> Bool) | SUBSET(t, {(c : (Cart[Real, N]) -> Bool) | hyperplane_cell((A : ((Cart[Real, N], Real)) -> Bool), c)})})"))
  let t471 = @tactics.match_mp_tac(@sets.finite_subset())
  let t476 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t471), t472), t473), t474), t475)
  finite_hyperplane_cellcomplexes_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, FINITE(A) → FINITE({(c : (Cart[Real, N]) -> Bool) | hyperplane_cellcomplex(A, c)})"), t476))
}

///|
let finite_hyperplane_cellcomplexes_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_HYPERPLANE_CELLCOMPLEXES")

///|
/// `FINITE_HYPERPLANE_CELLCOMPLEXES`
pub fn finite_hyperplane_cellcomplexes() -> @kernel.Thm {
  finite_hyperplane_cellcomplexes_c.get()
}

///|
/// FINITE_RESTRICT_HYPERPLANE_CELLCOMPLEXES
fn step_41() -> Unit raise {
  let t480 = @sets.set_tac(@list.List([]))
  let t479 = @simp.asm_simp_tac(@list.List([finite_hyperplane_cellcomplexes()]))
  let t478 = @tactics.exists_tac(@term_syntax.parse_term("{(c : (Cart[Real, N]) -> Bool) | hyperplane_cellcomplex((A : ((Cart[Real, N], Real)) -> Bool), c)}"))
  let t477 = @tactics.match_mp_tac(@sets.finite_subset())
  let t481 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t477), t478), t479), t480)
  finite_restrict_hyperplane_cellcomplexes_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : ((Cart[Real, N]) -> Bool) -> Bool, ∀ A : ((Cart[Real, N], Real)) -> Bool, FINITE(A) → FINITE({(c : (Cart[Real, N]) -> Bool) | hyperplane_cellcomplex(A, c) && P(c)})"), t481))
}

///|
let finite_restrict_hyperplane_cellcomplexes_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_RESTRICT_HYPERPLANE_CELLCOMPLEXES")

///|
/// `FINITE_RESTRICT_HYPERPLANE_CELLCOMPLEXES`
pub fn finite_restrict_hyperplane_cellcomplexes() -> @kernel.Thm {
  finite_restrict_hyperplane_cellcomplexes_c.get()
}

///|
/// FINITE_SET_OF_HYPERPLANE_CELLS
fn step_42() -> Unit raise {
  let t485 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t484 = @simp.asm_simp_tac(@list.List([finite_hyperplane_cellcomplexes()]))
  let t483 = @tactics.exists_tac(@term_syntax.parse_term("{(c : (Cart[Real, N]) -> Bool) | hyperplane_cellcomplex((A : ((Cart[Real, N], Real)) -> Bool), c)}"))
  let t482 = @tactics.match_mp_tac(@sets.finite_subset())
  let t486 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t482), t483), t484), t485)
  finite_set_of_hyperplane_cells_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ C : ((Cart[Real, N]) -> Bool) -> Bool, FINITE(A) && (∀ c : (Cart[Real, N]) -> Bool, IN(c, C) → hyperplane_cellcomplex(A, c)) → FINITE(C)"), t486))
}

///|
let finite_set_of_hyperplane_cells_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_SET_OF_HYPERPLANE_CELLS")

///|
/// `FINITE_SET_OF_HYPERPLANE_CELLS`
pub fn finite_set_of_hyperplane_cells() -> @kernel.Thm {
  finite_set_of_hyperplane_cells_c.get()
}

///|
/// CELL_SUBSET_CELLCOMPLEX
fn step_43() -> Unit raise {
  let t514 = @meson.asm_meson_tac(@list.List([]))
  let t513 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((c : (_) -> Bool), (C : ((_) -> Bool) -> Bool)) → SUBSET(c, UNIONS(C))")))
  let t511 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t512 = @list.List([@tactics.disch_then(fn(x510 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t511])
  let t509 = @class.asm_cases_tac(@term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool) == (c : (Cart[Real, N]) -> Bool)"))
  let t508 = @simp.asm_simp_tac(@list.List([]))
  let t505 = @term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool)")
  let t506 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)")
  let t507 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool)"), t506, t505]), disjoint_hyperplane_cells_eq()))
  let t504 = @simp.rewrite_tac(@list.List([@sets.in_inter()]))
  let t502 = @term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool)")
  let t503 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Cart[Real, N])"), t502]))
  let t501 = @simp.rewrite_tac(@list.List([@sets.unions_gspec(), @sets.in_elim_thm(), @theorems.left_imp_exists_thm()]))
  let t515 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.disjoint(), @sets.inter_unions(), @equal.gsym(@sets.member_not_empty())])), t501), t503), t504), @tactics.strip_tac), t507), t508), t509), t512), t513), t514)
  let t499 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t500 = @list.List([@meson.asm_meson_tac(@list.List([nonempty_hyperplane_cell()])), t499])
  let t516 = @list.List([@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool) == {}")), t500), t515])
  let t498 = @tactics.first_x_assum(fn(x495 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s496 = @tactics.subst_all_tac(x495)
    fn(x497 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s496(x497)
    }
  })
  let t494 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(C : ((Cart[Real, N]) -> Bool) -> Bool)"))(@tactics.strip_assume_tac))
  let t491 = @simp.gen_rewrite_rule(fn(x490 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x490
  }, @list.List([hyperplane_cellcomplex()]))
  let t493 = @tactics.first_assum(fn(x492 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x487 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s488 = @tactics.mp_tac(x487)
      fn(x489 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s488(x489)
      }
    })(t491(x492))
  })
  let t517 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t493), t494), t498), @tactics.eq_tac), t516)
  cell_subset_cellcomplex_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ s : (Cart[Real, N]) -> Bool, ∀ c : (Cart[Real, N]) -> Bool, hyperplane_cell(A, c) && hyperplane_cellcomplex(A, s) → SUBSET(c, s) == !DISJOINT(c, s)"), t517))
}

///|
let cell_subset_cellcomplex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CELL_SUBSET_CELLCOMPLEX")

///|
/// `CELL_SUBSET_CELLCOMPLEX`
pub fn cell_subset_cellcomplex() -> @kernel.Thm {
  cell_subset_cellcomplex_c.get()
}

///|
/// euler_characteristic
fn step_44() -> Unit raise {
  euler_characteristic_c.set(@pair.new_definition(@term_syntax.parse_term("(euler_characteristic : (((Cart[Real, N], Real)) -> Bool, (Cart[Real, N]) -> Bool) -> Real)((A : ((Cart[Real, N], Real)) -> Bool), (s : (Cart[Real, N]) -> Bool)) == sum({(c : (Cart[Real, N]) -> Bool) | hyperplane_cell(A, c) && SUBSET(c, s)}, (c : (Cart[Real, N]) -> Bool) => pow(-real_of_num(1), num_of_int(aff_dim(c))))")))
}

///|
let euler_characteristic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("euler_characteristic")

///|
/// `euler_characteristic`
pub fn euler_characteristic() -> @kernel.Thm {
  euler_characteristic_c.get()
}

///|
/// EULER_CHARACTERISTIC_EMPTY
fn step_45() -> Unit raise {
  let t521 = @meson.meson_tac(@list.List([nonempty_hyperplane_cell()]))
  let t520 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t519 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("!(∃ x : _, IN(x, (s : (_) -> Bool))) → (∀ x : _, IN(x, s) → (P : (_) -> Bool)(x))")))
  let t518 = @tactics.match_mp_tac(@iterate.sum_eq_0())
  let t522 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([euler_characteristic(), @sets.subset_empty()])), t518), t519), t520), t521)
  euler_characteristic_empty_c.set(@tactics.prove(@term_syntax.parse_term("euler_characteristic((A : ((Cart[Real, _], Real)) -> Bool), {}) == real_of_num(0)"), t522))
}

///|
let euler_characteristic_empty_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_CHARACTERISTIC_EMPTY")

///|
/// `EULER_CHARACTERISTIC_EMPTY`
pub fn euler_characteristic_empty() -> @kernel.Thm {
  euler_characteristic_empty_c.get()
}

///|
/// EULER_CHARACTERISTIC_CELL_UNIONS
fn step_46() -> Unit raise {
  let t556 = @meson.asm_meson_tac(@list.List([disjoint_hyperplane_cells_eq()]))
  let t557 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t556])
  let t555 = @tactics.subgoal_then(@term_syntax.parse_term("!DISJOINT((c : (Cart[Real, N]) -> Bool), (c' : (Cart[Real, N]) -> Bool))"), fn(x552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s553 = @tactics.mp_tac(x552)
    fn(x554 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s553(x554)
    }
  })
  let t551 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool)"))(@tactics.strip_assume_tac))
  let t550 = @simp.asm_rewrite_tac(@list.List([]))
  let t546 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t549 = @tactics.disch_then(fn(x548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x543 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s544 = @tactics.mp_tac(x543)
      fn(x545 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s544(x545)
      }
    })(((x547 : @kernel.Thm) => @bool.spec(t546, x547))(x548))
  })
  let t542 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t541 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @theorems.left_imp_exists_thm()]))
  let t540 = @simp.rewrite_tac(@list.List([@sets.member_not_empty(), @sets.subset(), @sets.in_unions()]))
  let t539 = @list.List([@meson.asm_meson_tac(@list.List([nonempty_hyperplane_cell()])), @tactics.all_tac])
  let t538 = @tactics.subgoal_then(@term_syntax.parse_term("!((c : (Cart[Real, N]) -> Bool) == {})"), fn(x535 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s536 = @tactics.mp_tac(x535)
    fn(x537 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s536(x537)
    }
  })
  let t534 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x528 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s529 = @tactics.assume_tac(x528)
    fn(x530 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s529(x530)
    }
  }, fn(x531 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s532 = @tactics.mp_tac(x531)
    fn(x533 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s532(x533)
    }
  }))
  let t527 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t526 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)"))
  let t525 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_elim_thm()]))
  let t524 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → sum(s, (f : (_) -> Real)) == sum(t, f)")))
  let t523 = @simp.rewrite_tac(@list.List([euler_characteristic()]))
  let t558 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t523), t524), t525), t526), @tactics.eq_tac), t527), t534), t538), t539), t540), t541), t542), @tactics.disch_tac), t549), t550), t551), t555), t557)
  euler_characteristic_cell_unions_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ C : ((Cart[Real, N]) -> Bool) -> Bool, (∀ c : (Cart[Real, N]) -> Bool, IN(c, C) → hyperplane_cell(A, c)) → euler_characteristic(A, UNIONS(C)) == sum(C, (c : (Cart[Real, N]) -> Bool) => pow(-real_of_num(1), num_of_int(aff_dim(c))))"), t558))
}

///|
let euler_characteristic_cell_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_CHARACTERISTIC_CELL_UNIONS")

///|
/// `EULER_CHARACTERISTIC_CELL_UNIONS`
pub fn euler_characteristic_cell_unions() -> @kernel.Thm {
  euler_characteristic_cell_unions_c.get()
}

///|
/// EULER_CHARACTERISTIC_CELL
fn step_47() -> Unit raise {
  let t567 = @simp.asm_simp_tac(@list.List([euler_characteristic_cell_unions(), @sets.in_sing(), @iterate.sum_sing()]))
  let t566 = @simp.gen_rewrite_tac(fn(x565 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x559 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s560 = @equal.land_conv(x559)
      fn(x561 : @kernel.Term) -> @kernel.Thm raise {
        s560(x561)
      }
    })((fn(x562 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s563 = @equal.rand_conv(x562)
      fn(x564 : @kernel.Term) -> @kernel.Thm raise {
        s563(x564)
      }
    })(x565))
  }, @list.List([@equal.gsym(@sets.unions_1())]))
  let t568 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t566), t567)
  euler_characteristic_cell_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, _], Real)) -> Bool, ∀ c : (Cart[Real, _]) -> Bool, hyperplane_cell(A, c) → euler_characteristic(A, c) == pow(-real_of_num(1), num_of_int(aff_dim(c)))"), t568))
}

///|
let euler_characteristic_cell_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_CHARACTERISTIC_CELL")

///|
/// `EULER_CHARACTERISTIC_CELL`
pub fn euler_characteristic_cell() -> @kernel.Thm {
  euler_characteristic_cell_c.get()
}

///|
/// EULER_CHARACTERISTIC_CELLCOMPLEX_UNION
fn step_48() -> Unit raise {
  let t580 = @sets.set_tac(@list.List([]))
  let t579 = @simp.asm_simp_tac(@list.List([hyperplane_cellcomplex_union()]))
  let t578 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool)"), cell_subset_cellcomplex()))
  let t577 = @simp.asm_rewrite_tac(@list.List([]))
  let t581 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.asm_cases_tac(@term_syntax.parse_term("hyperplane_cell((A : ((Cart[Real, N], Real)) -> Bool), (c : (Cart[Real, N]) -> Bool))")), t577), t578), t579), t580)
  let t575 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t576 = @list.List([@meson.asm_meson_tac(@list.List([nonempty_hyperplane_cell()])), t575])
  let t582 = @list.List([@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool) == {}")), t576), t581])
  let t574 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)"))
  let t573 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.in_elim_thm(), @sets.not_in_empty(), @sets.in_union()]))
  let t572 = @simp.asm_simp_tac(@list.List([finite_restrict_hyperplane_cells()]))
  let t571 = @tactics.match_mp_tac(@iterate.sum_union_eq())
  let t570 = @tactics.conv_tac(@equal.sym_conv)
  let t569 = @simp.rewrite_tac(@list.List([euler_characteristic()]))
  let t583 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t569), t570), t571), t572), t573), @tactics.conj_tac), t574), t582)
  euler_characteristic_cellcomplex_union_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ s : (Cart[Real, N]) -> Bool, ∀ t : (Cart[Real, N]) -> Bool, FINITE(A) && hyperplane_cellcomplex(A, s) && hyperplane_cellcomplex(A, t) && DISJOINT(s, t) → euler_characteristic(A, UNION(s, t)) == euler_characteristic(A, s) + euler_characteristic(A, t)"), t583))
}

///|
let euler_characteristic_cellcomplex_union_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_CHARACTERISTIC_CELLCOMPLEX_UNION")

///|
/// `EULER_CHARACTERISTIC_CELLCOMPLEX_UNION`
pub fn euler_characteristic_cellcomplex_union() -> @kernel.Thm {
  euler_characteristic_cellcomplex_union_c.get()
}

///|
/// EULER_CHARACTERISTIC_CELLCOMPLEX_UNIONS
fn step_49() -> Unit raise {
  let t635 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t634 = @simp.asm_rewrite_tac(@list.List([@sets.pairwise()]))
  let t631 = @simp.gen_rewrite_rule(fn(x630 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x630
  }, @list.List([@sets.pairwise()]))
  let t633 = @tactics.first_x_assum(fn(x632 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x627 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s628 = @tactics.mp_tac(x627)
      fn(x629 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s628(x629)
      }
    })(t631(x632))
  })
  let t626 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t636 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x623 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s624 = @tactics.subst1_tac(x623)
    fn(x625 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s624(x625)
    }
  }), @tactics.ap_term_tac), t626), t633), t634), t635)
  let t619 = @meson.asm_meson_tac(@list.List([@sets.inter_comm()]))
  let t618 = @simp.rewrite_tac(@list.List([@sets.disjoint(), @sets.inter_unions(), @theorems.imp_conj(), @theorems.right_forall_imp_thm(), @sets.forall_in_insert(), @sets.empty_unions(), @sets.forall_in_gspec()]))
  let t616 = @simp.gen_rewrite_rule(fn(x615 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x615
  }, @list.List([@sets.pairwise()]))
  let t620 = @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x617 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x612 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s613 = @tactics.mp_tac(x612)
      fn(x614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s613(x614)
      }
    })(t616(x617))
  }), t618), t619)
  let t611 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t621 = @tactics.then_tac(@tactics.match_mp_tac(hyperplane_cellcomplex_unions()), t611)
  let t622 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t621, t620])
  let t610 = @tactics.repeat_tac(@tactics.conj_tac)
  let t637 = @list.List([@tactics.thenl(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t610), t622), t636])
  let t604 = @drule.part_match(fn(x603 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x603))
  }, euler_characteristic_cellcomplex_union())
  let t599 = @simp.rewrite_tac(@list.List([@sets.unions_insert()]))
  let t598 = @tactics.repeat_tac(@tactics.strip_tac)
  let t597 = @simp.simp_tac(@list.List([euler_characteristic_empty(), @iterate.sum_clauses(), @sets.unions_0()]))
  let t596 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t594 = @term_syntax.parse_term("(C : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t595 = @tactics.spec_tac(@term_syntax.parse_term("(C : ((Cart[Real, N]) -> Bool) -> Bool)"), t594)
  let t592 = @meson.asm_meson_tac(@list.List([finite_set_of_hyperplane_cells()]))
  let t593 = @list.List([@tactics.undisch_tac(@term_syntax.parse_term("FINITE((C : ((Cart[Real, N]) -> Bool) -> Bool))")), t592])
  let t591 = @class.asm_cases_tac(@term_syntax.parse_term("FINITE((C : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t590 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x584 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s585 = @tactics.assume_tac(x584)
    fn(x586 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s585(x586)
    }
  }, fn(x587 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s588 = @tactics.mp_tac(x587)
    fn(x589 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s588(x589)
    }
  }))
  let t638 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t590), t591), t593), t595), t596), t597), t598), t599), fn(x609 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x608 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x606 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x605 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x600 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s601 = @tactics.mp_tac(x600)
            fn(x602 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s601(x602)
            }
          })(t604(x605))
        })(@equal.lhs(x606))
      })((fn(x607 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x607.1
      })(x608))
    })(x609)(x609)
  }), @tactics.ants_tac), t637)
  euler_characteristic_cellcomplex_unions_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ C : ((Cart[Real, N]) -> Bool) -> Bool, FINITE(A) && (∀ c : (Cart[Real, N]) -> Bool, IN(c, C) → hyperplane_cellcomplex(A, c)) && pairwise(DISJOINT, C) → euler_characteristic(A, UNIONS(C)) == sum(C, (c : (Cart[Real, N]) -> Bool) => euler_characteristic(A, c))"), t638))
}

///|
let euler_characteristic_cellcomplex_unions_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_CHARACTERISTIC_CELLCOMPLEX_UNIONS")

///|
/// `EULER_CHARACTERISTIC_CELLCOMPLEX_UNIONS`
pub fn euler_characteristic_cellcomplex_unions() -> @kernel.Thm {
  euler_characteristic_cellcomplex_unions_c.get()
}

///|
/// EULER_CHARACTERISTIC
fn step_50() -> Unit raise {
  let t660 = @simp.rewrite_tac(@list.List([@real.real_mul_ac()]))
  let t659 = @simp.asm_simp_tac(@list.List([@iterate.sum_const(), finite_restrict_hyperplane_cells()]))
  let t658 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @equal.gsym(@theorems.conj_assoc())]))
  let t661 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x657 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s655 = @tactics.subst1_tac(x654)
      fn(x656 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s655(x656)
      }
    })(@equal.sym(x657))
  }), t658), t659), t660)
  let t653 = @meson.asm_meson_tac(@list.List([nonempty_hyperplane_cell()]))
  let t652 = @simp.rewrite_tac(@list.List([@convex.aff_dim_le_univ(), @convex.aff_dim_pos_le()]))
  let t651 = @tactics.exists_tac(@term_syntax.parse_term("aff_dim((c : (Cart[Real, N]) -> Bool))"))
  let t650 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_of_num_le()), @int.int_exists_pos()]))
  let t649 = @simp.rewrite_tac(@list.List([@sets.in_image(), @iterate.in_numseg(), @arith.le_0()]))
  let t648 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)"))
  let t647 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), @sets.in_elim_thm()]))
  let t646 = @simp.gen_rewrite_tac(fn(x645 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x645
  }, @list.List([@sets.subset()]))
  let t662 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([finite_restrict_hyperplane_cells()])), t646), t647), t648), @tactics.strip_tac), t649), t650), t651), t652), t653), t661])
  let t644 = @simp.simp_tac(@list.List([@iterate.sum_image(), @int.int_of_num_eq(), @trivia.o_def(), @int.num_of_int_of_num()]))
  let t640 = @term_syntax.parse_term("IMAGE(int_of_num, op_dot_dot(0, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))")
  let t641 = @term_syntax.parse_term("{(c : (Cart[Real, N]) -> Bool) | hyperplane_cell((A : ((Cart[Real, N], Real)) -> Bool), c) && SUBSET(c, (s : (Cart[Real, N]) -> Bool))}")
  let t642 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool) => pow(-real_of_num(1), num_of_int(aff_dim(c)))")
  let t643 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool) => aff_dim(c)"), t642, t641, t640]), @iterate.sum_group()))
  let t639 = @simp.rewrite_tac(@list.List([euler_characteristic()]))
  let t663 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t639), t643), t644), @tactics.ants_tac), t662)
  euler_characteristic_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ s : (Cart[Real, N]) -> Bool, (FINITE : (((Cart[Real, N], Real)) -> Bool) -> Bool)(A) → (euler_characteristic : (((Cart[Real, N], Real)) -> Bool, (Cart[Real, N]) -> Bool) -> Real)(A, s) == (sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(0, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))), (d : Num) => pow(-real_of_num(1), d) * real_of_num((CARD : (((Cart[Real, N]) -> Bool) -> Bool) -> Num)({(c : (Cart[Real, N]) -> Bool) | (hyperplane_cell : (((Cart[Real, N], Real)) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(A, c) && (SUBSET : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(c, s) && (aff_dim : ((Cart[Real, N]) -> Bool) -> Int)(c) == int_of_num(d)})))"), t663))
}

///|
let euler_characteristic_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_CHARACTERISTIC")

///|
/// `EULER_CHARACTERISTIC`
pub fn euler_characteristic_v1() -> @kernel.Thm {
  euler_characteristic_v1_c.get()
}

///|
/// HYPERPLANE_CELLS_DISTINCT_LEMMA
fn step_51() -> Unit raise {
  let t664 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.in_elim_thm(), @sets.not_in_empty()])), @calc_rat.real_arith_tac)
  hyperplane_cells_distinct_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, _], ∀ b : Real, INTER({(x : Cart[Real, _]) | dot(a, x) == b}, {(x : Cart[Real, _]) | dot(a, x) < b}) == {} && INTER({(x : Cart[Real, _]) | dot(a, x) == b}, {(x : Cart[Real, _]) | dot(a, x) > b}) == {} && INTER({(x : Cart[Real, _]) | dot(a, x) < b}, {(x : Cart[Real, _]) | dot(a, x) == b}) == {} && INTER({(x : Cart[Real, _]) | dot(a, x) < b}, {(x : Cart[Real, _]) | dot(a, x) > b}) == {} && INTER({(x : Cart[Real, _]) | dot(a, x) > b}, {(x : Cart[Real, _]) | dot(a, x) == b}) == {} && INTER({(x : Cart[Real, _]) | dot(a, x) > b}, {(x : Cart[Real, _]) | dot(a, x) < b}) == {}"), t664))
}

///|
let hyperplane_cells_distinct_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("HYPERPLANE_CELLS_DISTINCT_LEMMA")

///|
/// `HYPERPLANE_CELLS_DISTINCT_LEMMA`
pub fn hyperplane_cells_distinct_lemma() -> @kernel.Thm {
  hyperplane_cells_distinct_lemma_c.get()
}

///|
/// EULER_CHARACTERSTIC_LEMMA
fn step_52() -> Unit raise {
  let t944 = @simp.rewrite_tac(@list.List([@real.real_pow_add()]))
  let t943 = @simp.rewrite_tac(@list.List([@int.num_of_int_of_num(), @int.int_of_num_add()]))
  let t942 = @simp.rewrite_tac(@list.List([@equal.gsym(@int.int_forall_pos())]))
  let t940 = @term_syntax.parse_term("(i : Int)")
  let t941 = @tactics.spec_tac(@term_syntax.parse_term("aff_dim(INTER((c : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) == (b : Real)}))"), t940)
  let t938 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t939 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.aff_dim_pos_le()])), t938), @tactics.all_tac])
  let t945 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("int_of_num(0) <= aff_dim(INTER((c : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) == (b : Real)}))"), fn(x935 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s936 = @tactics.mp_tac(x935)
    fn(x937 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s936(x937)
    }
  }), t939), t941), t942), t943), t944), @calc_rat.real_arith_tac)
  let t932 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t931 = @tactics.repeat_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([@int.int_sub_add()]))))
  let t930 = @simp.asm_simp_tac(@list.List([@convex.aff_dim_affine_inter_hyperplane()]))
  let t933 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.aff_dim_affine_hull()])), t930), t931), t932)
  let t929 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t928 = @simp.asm_simp_tac(@list.List([@convex.convex_inter(), @convex.convex_hyperplane(), @convex.affine_imp_convex()]))
  let t927 = @tactics.match_mp_tac(@convex.affine_hull_convex_inter_open())
  let t926 = @simp.gen_rewrite_tac(fn(x925 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x919 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s920 = @equal.land_conv(x919)
      fn(x921 : @kernel.Term) -> @kernel.Thm raise {
        s920(x921)
      }
    })((fn(x922 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s923 = @equal.once_depth_conv(x922)
      fn(x924 : @kernel.Term) -> @kernel.Thm raise {
        s923(x924)
      }
    })(x925))
  }, @list.List([@sets.inter_comm()]))
  let t934 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.inter_assoc()])), @tactics.conj_tac), t926), t927), t928), t929), t933])
  let t917 = @tactics.conjuncts_then(fn(x914 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s915 = @tactics.subst1_tac(x914)
    fn(x916 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s915(x916)
    }
  })
  let t918 = @tactics.subgoal_then(@term_syntax.parse_term("hull(affine, INTER((s : (Cart[Real, N]) -> Bool), (t : (Cart[Real, N]) -> Bool))) == hull(affine, t) && hull(affine, INTER(INTER(s, t), {(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) == (b : Real)})) == hull(affine, INTER(t, {(x : Cart[Real, N]) | dot(a, x) == b}))"), t917)
  let t913 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@convex.aff_dim_affine_hull())]))
  let t912 = @tactics.first_x_assum(fn(x909 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s910 = @tactics.subst_all_tac(x909)
    fn(x911 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s910(x911)
    }
  })
  let t907 = @term_syntax.parse_term("(t : (Cart[Real, N]) -> Bool)")
  let t908 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t907]))
  let t906 = @simp.asm_simp_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t905 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)")
  let t946 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool)"), t905]), hyperplane_cell_inter_open_affine())), t906), t908), @tactics.strip_tac), t912), t913), t918), t934), t945])
  let t904 = @tactics.subgoal_then(@term_syntax.parse_term("aff_dim((c : (Cart[Real, N]) -> Bool)) == aff_dim(INTER(c, {(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) == (b : Real)})) + int_of_num(1)"), fn(x901 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s902 = @tactics.subst1_tac(x901)
    fn(x903 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s902(x903)
    }
  })
  let t899 = @meson.asm_meson_tac(@list.List([hyperplane_cell_convex()]))
  let t898 = @simp.asm_rewrite_tac(@list.List([@topology.open_halfspace_lt(), @topology.open_halfspace_gt()]))
  let t897 = @tactics.match_mp_tac(@convex.affine_hull_convex_inter_open())
  let t900 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@convex.aff_dim_affine_hull())])), @tactics.conj_tac), @tactics.ap_term_tac), t897), t898), t899), @tactics.all_tac])
  let t895 = @tactics.conjuncts_then(fn(x892 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s893 = @tactics.subst1_tac(x892)
    fn(x894 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s893(x894)
    }
  })
  let t896 = @tactics.subgoal_then(@term_syntax.parse_term("aff_dim(INTER((c : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) < (b : Real)})) == aff_dim(c) && aff_dim(INTER(c, {(x : Cart[Real, N]) | dot(a, x) > b})) == aff_dim(c)"), t895)
  let t891 = @simp.asm_simp_tac(@list.List([hyperplane_cells_distinct_lemma(), @calc_int.real_add_rid(), @sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (t : (_) -> Bool)) == {} && !(INTER((c : (_) -> Bool), s) == {}) → !(INTER(c, s) == INTER(c, t))"))]))
  let t890 = @simp.once_rewrite_tac(@list.List([@sets.inter_comm()]))
  let t889 = @simp.simp_tac(@list.List([@iterate.sum_clauses(), @sets.finite_insert(), @sets.finite_empty(), @sets.in_insert(), @sets.not_in_empty()]))
  let t887 = @tactics.conv_tac(@class.taut)
  let t886 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t885 = @simp.asm_rewrite_tac(@list.List([]))
  let t884 = @simp.once_rewrite_tac(@list.List([@sets.inter_comm()]))
  let t883 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @theorems.unwind_thm2(), @equal.gsym(@theorems.conj_assoc())]))
  let t882 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)"))]))
  let t881 = @tactics.x_gen_tac(@term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool)"))
  let t880 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t879 = @simp.gen_rewrite_tac(fn(x878 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x878
  }, @list.List([@sets.extension()]))
  let t888 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → sum(s, (f : (_) -> Real)) == sum(t, f)"))), t879), t880), t881), t882), t883), t884), t885), t886), t887), @tactics.all_tac])
  let t877 = @tactics.exists_tac(@term_syntax.parse_term("sum({INTER({(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) == (b : Real)}, (c : (Cart[Real, N]) -> Bool)), INTER({(x : Cart[Real, N]) | dot(a, x) > b}, c), INTER({(x : Cart[Real, N]) | dot(a, x) < b}, c)}, (c : (Cart[Real, N]) -> Bool) => pow(-real_of_num(1), num_of_int(aff_dim(c))))"))
  let t876 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t874 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @misc.real_half(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t873 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t871 = @calc_rat.real_arith(@term_syntax.parse_term("((b : Real) - (x : Real) < b) == (real_of_num(0) < x)"))
  let t872 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((b : Real) - (x : Real) * (y : Real) > b) == (real_of_num(0) < x * -y)")), t871]))
  let t870 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_rsub(), @vectors.dot_rmul()]))
  let t869 = @tactics.exists_tac(@term_syntax.parse_term("(u : Cart[Real, N]) - op_pct((e : Real) / real_of_num(2) / norm((v : Cart[Real, N]) - u), v - u)"))
  let t867 = @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.all_tac, @meson.asm_meson_tac(@list.List([]))]))
  let t866 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @misc.real_half(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t865 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t864 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((b : Real) - (x : Real) * (y : Real) > b) == (real_of_num(0) < x * -y)"))]))
  let t863 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_rsub(), @vectors.dot_rmul()]))
  let t862 = @tactics.exists_tac(@term_syntax.parse_term("(u : Cart[Real, N]) - op_pct((e : Real) / real_of_num(2) / norm((v : Cart[Real, N]) - u), v - u)"))
  let t868 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])), t862), t863), t864), t865), t866), @calc_rat.asm_real_arith_tac), t867])
  let t861 = @tactics.subgoal_then(@term_syntax.parse_term("dot((a : Cart[Real, N]), (v : Cart[Real, N])) < (b : Real) || dot(a, v) > b"), @tactics.strip_assume_tac)
  let t860 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_inter(), @sets.in_elim_thm()]))
  let t858 = @simp.asm_simp_tac(@list.List([@convex.affine_affine_hull(), @misc.hull_inc()]))
  let t857 = @tactics.match_mp_tac(@convex.in_affine_add_mul_diff())
  let t856 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((e : Real)) / real_of_num(2) < e) == (real_of_num(0) < e)"))]))
  let t855 = @simp.asm_simp_tac(@list.List([@real.real_div_rmul(), @vectors.norm_eq_0(), @vectors.vector_sub_eq()]))
  let t854 = @simp.rewrite_tac(@list.List([@vectors.norm_mul(), @real.real_abs_div(), @calc_int.real_abs_num(), @vectors.real_abs_norm()]))
  let t853 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(x : Cart[Real, N]) - op_pct((a : Real), (y : Cart[Real, N]) - (z : Cart[Real, N])) == x + op_pct(a, z - y)"))]))
  let t859 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("distance(((u : Cart[Real, N]) - (a : Cart[Real, N]), u)) == norm(a)"))])), t853), t854), t855), t856), t857), t858), @tactics.disch_tac])
  let t849 = @term_syntax.parse_term("(u : Cart[Real, N]) - op_pct((e : Real) / real_of_num(2) / norm((v : Cart[Real, N]) - u), v - u)")
  let t852 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s844 = @tactics.assume_tac(x843)
    fn(x845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s844(x845)
    }
  }, fn(x851 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s847 = @tactics.mp_tac(x846)
      fn(x848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s847(x848)
      }
    })(((x850 : @kernel.Thm) => @bool.spec(t849, x850))(x851))
  }))
  let t842 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t841 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t837 = @term_syntax.parse_term("(u : Cart[Real, N])")
  let t840 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x831 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s832 = @tactics.assume_tac(x831)
    fn(x833 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s832(x833)
    }
  }, fn(x839 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x834 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s835 = @tactics.mp_tac(x834)
      fn(x836 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s835(x836)
      }
    })(((x838 : @kernel.Thm) => @bool.spec(t837, x838))(x839))
  }))
  let t830 = @simp.rewrite_tac(@list.List([@topology.open_in_v1()]))
  let t829 = @list.List([@meson.asm_meson_tac(@list.List([hyperplane_cell_relatively_open()])), @tactics.all_tac])
  let t828 = @tactics.subgoal_then(@term_syntax.parse_term("open_in(subtopology(euclidean, hull(affine, (c : (Cart[Real, N]) -> Bool))), c)"), fn(x825 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s826 = @tactics.mp_tac(x825)
    fn(x827 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s826(x827)
    }
  })
  let t824 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t875 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ u : Cart[Real, N], ∃ v : Cart[Real, N], IN(u, (c : (Cart[Real, N]) -> Bool)) && dot((a : Cart[Real, N]), u) == (b : Real) && IN(v, c) && !(dot(a, v) == b) && !(u == v)"), @tactics.strip_assume_tac), t824), t828), t829), t830), t840), t841), t842), t852), @tactics.ants_tac), t859), t860), t861), t868), t869), t870), t872), t873), t874), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t823 = @tactics.subgoal_then(@term_syntax.parse_term("!(INTER((c : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) < (b : Real)}) == {}) && !(INTER(c, {(x : Cart[Real, N]) | dot(a, x) > b}) == {})"), @tactics.strip_assume_tac)
  let t821 = @meson.asm_meson_tac(@list.List([hyperplane_cell_convex()]))
  let t820 = @simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @real.real_le_ldiv_eq(), @realarith.real_sub_lt()]))
  let t819 = @tactics.match_mp_tac(@convex.in_convex_set())
  let t818 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(v : Cart[Real, N]) + op_pct((a : Real), (u : Cart[Real, N]) - v) == op_pct(real_of_num(1) - a, v) + op_pct(a, u)"))]))
  let t817 = @simp.asm_simp_tac(@list.List([@vectors.dot_radd(), @vectors.dot_rmul(), @vectors.dot_rsub(), @real.real_div_rmul(), @realarith.real_sub_lt(), @real.real_lt_imp_nz(), @real.real_sub_add2()]))
  let t816 = @tactics.subgoal_then(@term_syntax.parse_term("dot((a : Cart[Real, N]), (v : Cart[Real, N])) < dot(a, (u : Cart[Real, N]))"), fn(x813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s814 = @tactics.assume_tac(x813)
    fn(x815 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s814(x815)
    }
  })
  let t812 = @tactics.exists_tac(@term_syntax.parse_term("(v : Cart[Real, N]) + op_pct(((b : Real) - dot((a : Cart[Real, N]), v)) / (dot(a, (u : Cart[Real, N])) - dot(a, v)), u - v)"))
  let t811 = @simp.asm_rewrite_tac(@list.List([]))
  let t810 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t809 = @class.asm_cases_tac(@term_syntax.parse_term("dot((a : Cart[Real, N]), (v : Cart[Real, N])) == (b : Real)"))
  let t808 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t807 = @class.asm_cases_tac(@term_syntax.parse_term("dot((a : Cart[Real, N]), (u : Cart[Real, N])) == (b : Real)"))
  let t806 = @simp.simp_tac(@list.List([@realarith.real_le_lt()]))
  let t804 = @term_syntax.parse_term("(v : Cart[Real, N])")
  let t805 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Cart[Real, N])"), t804]))
  let t803 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @sets.in_elim_thm(), @theorems.left_imp_exists_thm()]))
  let t802 = @simp.rewrite_tac(@list.List([@realax.real_gt(), @realarith.real_not_lt(), @equal.gsym(@sets.member_not_empty())]))
  let t801 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t822 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ u : Cart[Real, N], ∃ v : Cart[Real, N], IN(u, (c : (Cart[Real, N]) -> Bool)) && !(dot((a : Cart[Real, N]), u) < (b : Real)) && IN(v, c) && !(dot(a, v) > b)"), fn(x798 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s799 = @tactics.mp_tac(x798)
    fn(x800 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s799(x800)
    }
  }), t801), t802), t803), t805), t806), t807), t808), t809), t810), t811), @tactics.strip_tac), t812), t816), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t817), t818), t819), t820), @tactics.conj_tac), @list.List([@tactics.all_tac, @calc_rat.asm_real_arith_tac])), t821), @tactics.all_tac])
  let t797 = @tactics.subgoal_then(@term_syntax.parse_term("!(INTER((c : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) == (b : Real)}) == {})"), fn(x794 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s795 = @tactics.assume_tac(x794)
    fn(x796 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s795(x796)
    }
  })
  let t791 = @term_syntax.parse_term("SUBSET((c : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) == (b : Real)})")
  let t792 = @term_syntax.parse_term("SUBSET((c : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) > (b : Real)})")
  let t793 = @tactics.map_every(fn(x772 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x772
    let t789 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
    let t787 = @term_syntax.parse_term("(b : Real)")
    let t788 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t787]), hyperplane_cells_distinct_lemma()))
    let t786 = @tactics.first_x_assum(fn(x783 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s784 = @tactics.subst1_tac(x783)
      fn(x785 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s784(x785)
      }
    })
    let t782 = @simp.rewrite_tac(@list.List([@theorems.exists_or_thm(), @theorems.unwind_thm2(), @equal.gsym(@theorems.conj_assoc())]))
    let t781 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(((a : Bool) || (b : Bool)) && (c : Bool)) == (a && c || b && c)"))]))
    let t780 = @simp.rewrite_tac(@list.List([@sets.in_sing(), @sets.in_elim_thm()]))
    let t779 = @tactics.x_gen_tac(@term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool)"))
    let t778 = @simp.gen_rewrite_tac(fn(x777 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      x777
    }, @list.List([@sets.extension()]))
    let t776 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → sum(s, (f : (_) -> Real)) == sum(t, f)")))
    let t775 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([@iterate.sum_sing()]))])
    let t774 = @tactics.exists_tac(@term_syntax.parse_term("sum({(c : (Cart[Real, N]) -> Bool)}, (c : (Cart[Real, N]) -> Bool) => pow(-real_of_num(1), num_of_int(aff_dim(c))))"))
    let t790 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t774), @tactics.conj_tac), t775), t776), t778), t779), t780), t781), t782), @tactics.eq_tac), @tactics.strip_tac), t786), t788), t789), @tactics.all_tac])
    @tactics.thenl(@class.asm_cases_tac(t), t790)
  }, @list.List([@term_syntax.parse_term("SUBSET((c : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | dot((a : Cart[Real, N]), x) < (b : Real)})"), t792, t791]))
  let t771 = @list.List([@meson.asm_meson_tac(@list.List([nonempty_hyperplane_cell()])), @tactics.all_tac])
  let t770 = @tactics.subgoal_then(@term_syntax.parse_term("!((c : (Cart[Real, N]) -> Bool) == {})"), fn(x767 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s768 = @tactics.assume_tac(x767)
    fn(x769 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s768(x769)
    }
  })
  let t766 = @simp.asm_rewrite_tac(@list.List([hyperplane_cell_sing()]))
  let t762 = @simp.asm_simp_tac(@list.List([]))
  let t760 = @term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)")
  let t761 = @tactics.map_every(fn(x757 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s758 = @tactics.exists_tac(x757)
    fn(x759 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s758(x759)
    }
  }, @list.List([@term_syntax.parse_term("(c1 : (Cart[Real, N]) -> Bool)"), t760]))
  let t756 = @simp.asm_rewrite_tac(@list.List([@sets.inter_subset()]))
  let t763 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c1 : (Cart[Real, N]) -> Bool)"))(@tactics.strip_assume_tac)), t756), t761), t762)
  let t754 = @meson.asm_meson_tac(@list.List([disjoint_hyperplane_cells_eq()]))
  let t755 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t754])
  let t753 = @tactics.subgoal_then(@term_syntax.parse_term("!DISJOINT((c2 : (Cart[Real, N]) -> Bool), (c : (Cart[Real, N]) -> Bool))"), fn(x750 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s751 = @tactics.assume_tac(x750)
    fn(x752 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s751(x752)
    }
  })
  let t749 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(c2 : (Cart[Real, N]) -> Bool)"))(@tactics.strip_assume_tac))
  let t748 = @tactics.x_gen_tac(@term_syntax.parse_term("(c1 : (Cart[Real, N]) -> Bool)"))
  let t747 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t746 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x740 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s741 = @tactics.assume_tac(x740)
    fn(x742 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s741(x742)
    }
  }, fn(x743 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s744 = @tactics.mp_tac(x743)
    fn(x745 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s744(x745)
    }
  }))
  let t764 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x734 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s735 = @tactics.mp_tac(x734)
    fn(x736 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s735(x736)
    }
  }, fn(x737 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s738 = @tactics.assume_tac(x737)
    fn(x739 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s738(x739)
    }
  })), t746), t747), t748), t749), t753), t755), t763])
  let t733 = @tactics.x_gen_tac(@term_syntax.parse_term("(c' : (Cart[Real, N]) -> Bool)"))
  let t732 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t731 = @simp.gen_rewrite_tac(fn(x730 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x730
  }, @list.List([@sets.extension()]))
  let t765 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → sum(s, (f : (_) -> Real)) == sum(t, f)"))), t731), t732), t733), @tactics.eq_tac), t764), @tactics.all_tac])
  let t729 = @tactics.exists_tac(@term_syntax.parse_term("sum({INTER(c', (c : (Cart[Real, N]) -> Bool)) | c' : (Cart[Real, N]) -> Bool | hyperplane_cell({((a : Cart[Real, N]), (b : Real))}, c') && !(INTER(c', c) == {})}, (c : (Cart[Real, N]) -> Bool) => pow(-real_of_num(1), num_of_int(aff_dim(c))))"))
  let t728 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t727 = @simp.rewrite_tac(@list.List([hyperplane_cell_union()]))
  let t726 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INSERT((x : _), (s : (_) -> Bool)) == UNION({x}, s)"))]))
  let t725 = @simp.rewrite_tac(@list.List([euler_characteristic()]))
  let t723 = @simp.asm_simp_tac(@list.List([]))
  let t722 = @simp.rewrite_tac(@list.List([@sets.inter_univ(), @theorems.unwind_thm1()]))
  let t721 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t720 = @list.List([@meson.asm_meson_tac(@list.List([nonempty_hyperplane_cell()])), @tactics.all_tac])
  let t719 = @simp.rewrite_tac(@list.List([hyperplane_cell_sing(), @theorems.right_exists_and_thm(), @theorems.unwind_thm2()]))
  let t718 = @simp.rewrite_tac(@list.List([hyperplane_cell_union()]))
  let t717 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INSERT((x : _), (s : (_) -> Bool)) == UNION({x}, s)"))]))
  let t716 = @tactics.disch_then(fn(x715 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t714 = @simp.simp_tac(@list.List([@class.contrapos_thm()]))
  let t724 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x713 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x706 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s707 = @tactics.mp_tac(x706)
      fn(x708 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s707(x708)
      }
    })(((x712 : @kernel.Thm) => @lib.check(fn(x711 : @kernel.Thm) -> Bool raise {
      (fn(x709 : @kernel.Term) -> Bool raise {
        @basics.is_neg(x709)
      })((fn(x710 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x710)
      })(x711))
    }, x712))(x713))
  }), t714), t716), t717), t718), t719), @tactics.conj_tac), t720), t721), t722), t723), @tactics.all_tac])
  let t705 = @tactics.subgoal_then(@term_syntax.parse_term("!((a : Cart[Real, N]) == vec(0))"), fn(x702 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s703 = @tactics.assume_tac(x702)
    fn(x704 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s703(x704)
    }
  })
  let t701 = @simp.asm_simp_tac(@list.List([euler_characteristic_cell()]))
  let t700 = @class.asm_cases_tac(@term_syntax.parse_term("hyperplane_cell(INSERT(((a : Cart[Real, N]), (b : Real)), (A : ((Cart[Real, N], Real)) -> Bool)), (c : (Cart[Real, N]) -> Bool))"))
  let t699 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)"))
  let t698 = @tactics.match_mp_tac(@iterate.sum_eq())
  let t697 = @simp.asm_simp_tac(@list.List([euler_characteristic_cellcomplex_unions(), @sets.finite_insert()]))
  let t696 = @list.List([@meson.asm_meson_tac(@list.List([pairwise_disjoint_hyperplane_cells()])), @tactics.all_tac])
  let t695 = @tactics.subgoal_then(@term_syntax.parse_term("pairwise(DISJOINT, (C : ((Cart[Real, N]) -> Bool) -> Bool))"), fn(x692 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s693 = @tactics.assume_tac(x692)
    fn(x694 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s693(x694)
    }
  })
  let t690 = @sets.set_tac(@list.List([]))
  let t689 = @simp.asm_simp_tac(@list.List([hyperplane_cell_cellcomplex()]))
  let t688 = @tactics.exists_tac(@term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool)"))
  let t687 = @tactics.match_mp_tac(hyperplane_cellcomplex_mono())
  let t686 = @simp.asm_simp_tac(@list.List([hyperplane_cell_cellcomplex()]))
  let t691 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t686), t687), t688), t689), t690), @tactics.all_tac])
  let t685 = @tactics.subgoal_then(@term_syntax.parse_term("∀ c : (Cart[Real, N]) -> Bool, IN(c, (C : ((Cart[Real, N]) -> Bool) -> Bool)) → hyperplane_cellcomplex((A : ((Cart[Real, N], Real)) -> Bool), c) && hyperplane_cellcomplex(INSERT(((a : Cart[Real, N]), (b : Real)), A), c)"), fn(x682 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s683 = @tactics.assume_tac(x682)
    fn(x684 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s683(x684)
    }
  })
  let t681 = @tactics.first_x_assum(fn(x678 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s679 = @tactics.subst_all_tac(x678)
    fn(x680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s679(x680)
    }
  })
  let t677 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(C : ((Cart[Real, N]) -> Bool) -> Bool)"))(@tactics.strip_assume_tac))
  let t676 = @simp.rewrite_tac(@list.List([hyperplane_cellcomplex()]))
  let t675 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x669 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s670 = @tactics.assume_tac(x669)
    fn(x671 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s670(x671)
    }
  }, fn(x672 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s673 = @tactics.mp_tac(x672)
    fn(x674 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s673(x674)
    }
  }))
  let t665 = @term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)")
  let t666 = @term_syntax.parse_term("(b : Real)")
  let t667 = @term_syntax.parse_term("(a : Cart[Real, N])")
  let t668 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool)"), t667, t666, t665]))
  let t947 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@pair.forall_pair_thm()])), t668), t675), t676), t677), t681), t685), t691), t695), t696), t697), t698), t699), @tactics.disch_tac), t700), t701), t705), t724), t725), t726), t727), t728), t729), @tactics.conj_tac), t765), t766), t770), t771), t793), t797), t822), t823), t875), t876), t877), @tactics.conj_tac), t888), t889), t890), t891), t896), t900), t904), t946)
  euler_characterstic_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ h : (Cart[Real, N], Real), ∀ s : (Cart[Real, N]) -> Bool, FINITE(A) && hyperplane_cellcomplex(A, s) → euler_characteristic(INSERT(h, A), s) == euler_characteristic(A, s)"), t947))
}

///|
let euler_characterstic_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_CHARACTERSTIC_LEMMA")

///|
/// `EULER_CHARACTERSTIC_LEMMA`
pub fn euler_characterstic_lemma() -> @kernel.Thm {
  euler_characterstic_lemma_c.get()
}

///|
/// EULER_CHARACTERSTIC_INVARIANT
fn step_53() -> Unit raise {
  let t970 = @meson.asm_meson_tac(@list.List([@sets.union_comm()]))
  let t969 = @tactics.exists_tac(@term_syntax.parse_term("euler_characteristic(UNION((A : ((Cart[Real, N], Real)) -> Bool), (B : ((Cart[Real, N], Real)) -> Bool)), (s : (Cart[Real, N]) -> Bool))"))
  let t968 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t967 = @tactics.repeat_tac(@tactics.strip_tac)
  let t971 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@theorems.right_imp_forall_thm(), @theorems.imp_imp()]))), t967), t968), t969), t970)
  let t966 = @sets.set_tac(@list.List([]))
  let t965 = @simp.asm_rewrite_tac(@list.List([]))
  let t964 = @tactics.exists_tac(@term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool)"))
  let t963 = @tactics.match_mp_tac(hyperplane_cellcomplex_mono())
  let t962 = @simp.asm_rewrite_tac(@list.List([@sets.finite_union()]))
  let t961 = @tactics.match_mp_tac(euler_characterstic_lemma())
  let t960 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("UNION((s : (_) -> Bool), INSERT((x : _), (t : (_) -> Bool))) == INSERT(x, UNION(s, t))"))]))
  let t959 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x958 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x955 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s956 = @tactics.subst1_tac(x955)
      fn(x957 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s956(x957)
      }
    })(@equal.sym(x958))
  }, @tactics.strip_assume_tac))
  let t953 = @term_syntax.parse_term("(B : ((Cart[Real, N], Real)) -> Bool)")
  let t954 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(h : (Cart[Real, N], Real))"), t953]))
  let t952 = @simp.asm_rewrite_tac(@list.List([@sets.union_empty()]))
  let t951 = @tactics.match_mp_tac(@sets.finite_induct_strong())
  let t972 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t951), t952), t954), t959), t960), t961), t962), t963), t964), t965), t966), t971])
  let t973 = @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ s : (Cart[Real, N]) -> Bool, FINITE(A) && hyperplane_cellcomplex(A, s) → (∀ B : ((Cart[Real, N], Real)) -> Bool, FINITE(B) → euler_characteristic(UNION(A, B), s) == euler_characteristic(A, s))"), fn(x948 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s949 = @tactics.assume_tac(x948)
    fn(x950 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s949(x950)
    }
  }), t972)
  euler_characterstic_invariant_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ B : ((Cart[Real, N], Real)) -> Bool, ∀ h : _, ∀ s : (Cart[Real, N]) -> Bool, FINITE(A) && FINITE(B) && hyperplane_cellcomplex(A, s) && hyperplane_cellcomplex(B, s) → euler_characteristic(A, s) == euler_characteristic(B, s)"), t973))
}

///|
let euler_characterstic_invariant_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_CHARACTERSTIC_INVARIANT")

///|
/// `EULER_CHARACTERSTIC_INVARIANT`
pub fn euler_characterstic_invariant() -> @kernel.Thm {
  euler_characterstic_invariant_c.get()
}

///|
/// EULER_CHARACTERISTIC_INCLUSION_EXCLUSION
fn step_54() -> Unit raise {
  let t978 = @simp.simp_tac(@list.List([hyperplane_cellcomplex_empty(), hyperplane_cellcomplex_inter(), hyperplane_cellcomplex_union(), hyperplane_cellcomplex_diff()]))
  let t977 = @simp.asm_simp_tac(@list.List([euler_characteristic_cellcomplex_union()]))
  let t974 = @term_syntax.parse_term("(s : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t975 = @term_syntax.parse_term("euler_characteristic((A : ((Cart[Real, N], Real)) -> Bool))")
  let t976 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("hyperplane_cellcomplex((A : ((Cart[Real, N], Real)) -> Bool))"), t975, t974]), @inclusion_exclusion.inclusion_exclusion_real_restricted()))
  let t979 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t976), t977), t978)
  euler_characteristic_inclusion_exclusion_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : ((Cart[Real, N], Real)) -> Bool, ∀ s : ((Cart[Real, N]) -> Bool) -> Bool, FINITE(A) && FINITE(s) && (∀ k : (Cart[Real, N]) -> Bool, IN(k, s) → hyperplane_cellcomplex(A, k)) → euler_characteristic(A, UNIONS(s)) == sum({(t : ((Cart[Real, N]) -> Bool) -> Bool) | SUBSET(t, s) && !(t == {})}, (t : ((Cart[Real, N]) -> Bool) -> Bool) => pow(-real_of_num(1), CARD(t) + 1) * euler_characteristic(A, INTERS(t)))"), t979))
}

///|
let euler_characteristic_inclusion_exclusion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_CHARACTERISTIC_INCLUSION_EXCLUSION")

///|
/// `EULER_CHARACTERISTIC_INCLUSION_EXCLUSION`
pub fn euler_characteristic_inclusion_exclusion() -> @kernel.Thm {
  euler_characteristic_inclusion_exclusion_c.get()
}

///|
/// EULER_POLYHEDRAL_CONE
fn step_55() -> Unit raise {
  let t2318 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2317 = @tactics.disch_then(fn(x2314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2315 = @tactics.subst_all_tac(x2314)
    fn(x2316 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2315(x2316)
    }
  })
  let t2313 = @simp.asm_simp_tac(@list.List([@sets.card_eq_0()]))
  let t2312 = @tactics.undisch_tac(@term_syntax.parse_term("CARD((H : ((Cart[Real, N]) -> Bool) -> Bool)) == 0"))
  let t2311 = @simp.asm_rewrite_tac(@list.List([]))
  let t2310 = @simp.rewrite_tac(@list.List([@real.real_pow_zero()]))
  let t2309 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == real_of_num(0) → x == real_of_num(1) + (y : Real) → -y == real_of_num(1)")))
  let t2308 = @simp.rewrite_tac(@list.List([@binomial.binom()]))
  let t2307 = @simp.rewrite_tac(@list.List([@realax.real_pow(), @iterate.sum_neg(), @arith.add_clauses(), @realarith.real_mul_rid()]))
  let t2306 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * pow(-real_of_num(1), 1) * (y : Real) == -(y * x)"))]))
  let t2305 = @simp.simp_tac(@list.List([@iterate.sum_clauses_left(), @real.real_pow_add(), @real.real_pow_one(), @arith.le_0()]))
  let t2304 = @simp.rewrite_tac(@list.List([@real.real_pow_one(), @realarith.real_mul_rid(), @realax.real_add_linv()]))
  let t2301 = @term_syntax.parse_term("real_of_num(1)")
  let t2302 = @term_syntax.parse_term("-real_of_num(1)")
  let t2303 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("CARD((H : ((Cart[Real, N]) -> Bool) -> Bool))"), t2302, t2301]), @binomial.real_binomial_theorem()))
  let t2299 = @sets.set_tac(@list.List([]))
  let t2298 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.finite_has_size())]))
  let t2297 = @tactics.match_mp_tac(@sets.has_size_image_inj())
  let t2296 = @simp.rewrite_tac(@list.List([@sets.simple_image()]))
  let t2295 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([@sets.has_size()]))])
  let t2292 = @term_syntax.parse_term("{DIFF(UNIV, (t : (Cart[Real, N]) -> Bool)) | IN(t, (H : ((Cart[Real, N]) -> Bool) -> Bool))}")
  let t2293 = @term_syntax.parse_term("(n : Num)")
  let t2294 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("CARD((H : ((Cart[Real, N]) -> Bool) -> Bool))"), t2293, t2292]), @combinations.number_of_combinations()))
  let t2290 = @meson.asm_meson_tac(@list.List([@sets.finite_image(), @sets.finite_subset()]))
  let t2289 = @simp.rewrite_tac(@list.List([@sets.simple_image(), @sets.forall_subset_image()]))
  let t2287 = @term_syntax.parse_term("(u : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t2288 = @tactics.spec_tac(@term_syntax.parse_term("(t : ((Cart[Real, N]) -> Bool) -> Bool)"), t2287)
  let t2286 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((p : Bool) → (r : Bool)) → (p && (q : Bool)) == (p && r && q)")))
  let t2285 = @simp.asm_rewrite_tac(@list.List([@sets.has_size(), @sets.card_clauses(), @sets.finite_empty()]))
  let t2284 = @class.asm_cases_tac(@term_syntax.parse_term("(t : ((Cart[Real, N]) -> Bool) -> Bool) == {}"))
  let t2283 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2282 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : ((Cart[Real, N]) -> Bool) -> Bool)"))
  let t2291 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @simp.gen_rewrite_tac(fn(x2281 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2281
  }, @list.List([@sets.extension()]))), t2282), t2283), t2284), t2285), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t2286), t2288), t2289), t2290), @tactics.all_tac])
  let t2280 = @tactics.exists_tac(@term_syntax.parse_term("CARD({(t : ((Cart[Real, N]) -> Bool) -> Bool) | SUBSET(t, {DIFF(UNIV, (t : (Cart[Real, N]) -> Bool)) | IN(t, (H : ((Cart[Real, N]) -> Bool) -> Bool))}) && HAS_SIZE(t, (n : Num))})"))
  let t2279 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2278 = @simp.gen_rewrite_tac(fn(x2275 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2276 = @equal.land_conv(x2275)
    fn(x2277 : @kernel.Term) -> @kernel.Thm raise {
      s2276(x2277)
    }
  }, @list.List([@realax.real_mul_sym()]))
  let t2273 = @tactics.disch_then(fn(x2270 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2271 = @tactics.subst1_tac(x2270)
    fn(x2272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2271(x2272)
    }
  })
  let t2269 = @simp.asm_simp_tac(@list.List([@sets.finite_image()]))
  let t2268 = @simp.rewrite_tac(@list.List([@sets.simple_image()]))
  let t2267 = @tactics.match_mp_tac(@sets.finite_powerset())
  let t2266 = @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))])
  let t2265 = @tactics.exists_tac(@term_syntax.parse_term("{(t : ((Cart[Real, N]) -> Bool) -> Bool) | SUBSET(t, {DIFF(UNIV, (t : (Cart[Real, N]) -> Bool)) | IN(t, (H : ((Cart[Real, N]) -> Bool) -> Bool))})}"))
  let t2274 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t2265), @tactics.conj_tac), t2266), t2267), t2268), t2269), t2273])
  let t2259 = @drule.part_match(fn(x2258 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x2258))
  }, @iterate.sum_const())
  let t2254 = @simp.simp_tac(@list.List([@sets.in_elim_thm()]))
  let t2253 = @simp.rewrite_tac(@list.List([@iterate.in_numseg()]))
  let t2252 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t2300 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq()), t2252), t2253), @tactics.disch_tac), t2254), fn(x2264 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2263 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2261 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2260 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x2255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s2256 = @tactics.mp_tac(x2255)
            fn(x2257 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s2256(x2257)
            }
          })(t2259(x2260))
        })(@equal.lhand(x2261))
      })((fn(x2262 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2262.1
      })(x2263))
    })(x2264)(x2264)
  }), @tactics.ants_tac), t2274), t2278), @tactics.ap_term_tac), @tactics.ap_term_tac), t2279), t2280), @tactics.conj_tac), t2291), t2294), @tactics.ants_tac), t2295), t2296), t2297), t2298), t2299), @tactics.all_tac])
  let t2251 = @tactics.exists_tac(@term_syntax.parse_term("sum(op_dot_dot(1, CARD((H : ((Cart[Real, N]) -> Bool) -> Bool))), (n : Num) => pow(-real_of_num(1), n + 1) * real_of_num(binom((CARD(H), n))))"))
  let t2250 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2247 = @tactics.disch_then(fn(x2246 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2244 = @tactics.subst1_tac(x2243)
      fn(x2245 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2244(x2245)
      }
    })(@equal.sym(x2246))
  })
  let t2248 = @tactics.then_tac(@simp.rewrite_tac(@list.List([])), t2247)
  let t2241 = @simp.asm_simp_tac(@list.List([@sets.card_subset(), @sets.card_image_le()]))
  let t2240 = @tactics.exists_tac(@term_syntax.parse_term("CARD((J : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t2239 = @tactics.match_mp_tac(@arith.le_trans())
  let t2238 = @simp.asm_simp_tac(@list.List([@sets.card_eq_0(), @sets.finite_image(), @int.arith_rule(@term_syntax.parse_term("(1 <= (n : Num)) == !(n == 0)")), @sets.image_eq_empty()]))
  let t2237 = @list.List([@meson.asm_meson_tac(@list.List([@sets.finite_subset()])), @tactics.all_tac])
  let t2236 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((J : ((Cart[Real, N]) -> Bool) -> Bool))"), fn(x2233 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2234 = @tactics.assume_tac(x2233)
    fn(x2235 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2234(x2235)
    }
  })
  let t2232 = @simp.rewrite_tac(@list.List([@sets.image_eq_empty()]))
  let t2231 = @tactics.x_gen_tac(@term_syntax.parse_term("(J : ((Cart[Real, N]) -> Bool) -> Bool)"))
  let t2230 = @simp.rewrite_tac(@list.List([@sets.simple_image(), @sets.forall_subset_image(), @theorems.imp_conj()]))
  let t2229 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec(), @iterate.in_numseg()]))
  let t2228 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t2242 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x2227 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2227
  }, @list.List([@sets.subset()])), t2228), t2229), t2230), t2231), @tactics.disch_tac), t2232), @tactics.disch_tac), t2236), t2237), t2238), t2239), t2240), t2241)
  let t2226 = @simp.asm_simp_tac(@list.List([@sets.finite_image()]))
  let t2225 = @simp.rewrite_tac(@list.List([@sets.simple_image()]))
  let t2224 = @tactics.match_mp_tac(@sets.finite_powerset())
  let t2223 = @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))])
  let t2222 = @tactics.exists_tac(@term_syntax.parse_term("{(t : ((Cart[Real, N]) -> Bool) -> Bool) | SUBSET(t, {DIFF(UNIV, (t : (Cart[Real, N]) -> Bool)) | IN(t, (H : ((Cart[Real, N]) -> Bool) -> Bool))})}"))
  let t2249 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t2222), @tactics.conj_tac), t2223), t2224), t2225), t2226), t2242])), t2248])
  let t2218 = @term_syntax.parse_term("op_dot_dot(1, CARD((H : ((Cart[Real, N]) -> Bool) -> Bool)))")
  let t2219 = @term_syntax.parse_term("{(t : ((Cart[Real, N]) -> Bool) -> Bool) | SUBSET(t, {DIFF(UNIV, (t : (Cart[Real, N]) -> Bool)) | IN(t, (H : ((Cart[Real, N]) -> Bool) -> Bool))}) && !(t == {})}")
  let t2220 = @term_syntax.parse_term("(t : ((Cart[Real, N]) -> Bool) -> Bool) => pow(-real_of_num(1), CARD(t) + 1)")
  let t2221 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(t : ((Cart[Real, N]) -> Bool) -> Bool) => CARD(t)"), t2220, t2219, t2218]), @iterate.sum_group()))
  let t2217 = @tactics.match_mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("(s : Real) == real_of_num(1) → s * (t : Real) == t")))
  let t2216 = @simp.rewrite_tac(@list.List([@iterate.sum_rmul()]))
  let t2214 = @simp.asm_simp_tac(@list.List([@sets.image_eq_empty(), @topology.open_negations(), @topology.open_interior()]))
  let t2213 = @simp.asm_rewrite_tac(@list.List([]))
  let t2212 = @tactics.match_mp_tac(@convex.affine_hull_open())
  let t2210 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2211 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_mono()), t2210), @tactics.all_tac])
  let t2209 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, INTERS(IMAGE((t : (Cart[Real, N]) -> Bool) => DIFF(UNIV, t), (H : ((Cart[Real, N]) -> Bool) -> Bool))))"))
  let t2208 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ t : (_) -> Bool, SUBSET(t, (s : (_) -> Bool)) && t == UNIV → s == UNIV")))
  let t2207 = @simp.rewrite_tac(@list.List([@convex.aff_dim_eq_full()]))
  let t2206 = @tactics.match_mp_tac(@meson.meson(@list.List([@int.num_of_int_of_num()]), @term_syntax.parse_term("(i : Int) == int_of_num((n : Num)) → num_of_int(i) == n")))
  let t2205 = @simp.asm_simp_tac(@list.List([euler_characteristic_cell()]))
  let t2203 = @simp.asm_simp_tac(@list.List([hyperplane_cell_cellcomplex()]))
  let t2202 = @tactics.exists_tac(@term_syntax.parse_term("(B : ((Cart[Real, N], Real)) -> Bool)"))
  let t2201 = @tactics.match_mp_tac(hyperplane_cellcomplex_mono())
  let t2200 = @list.List([@meson.asm_meson_tac(@list.List([@sets.finite_subset()])), @tactics.all_tac])
  let t2199 = @simp.asm_simp_tac(@list.List([hyperplane_cell_cellcomplex()]))
  let t2204 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(euler_characterstic_invariant()), t2199), @tactics.conj_tac), t2200), t2201), t2202), t2203), @tactics.all_tac])
  let t2198 = @tactics.exists_tac(@term_syntax.parse_term("euler_characteristic((B : ((Cart[Real, N], Real)) -> Bool), INTERS(IMAGE((t : (Cart[Real, N]) -> Bool) => DIFF(UNIV, t), (J : ((Cart[Real, N]) -> Bool) -> Bool))))"))
  let t2197 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2195 = @meson.meson_tac(@list.List([@real.real_sgn_eq(), @realax.real_gt()]))
  let t2194 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @real.real_sub_rzero(), @real.real_not_le()]))
  let t2193 = @tactics.disch_then(fn(x2172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_18 = x2172
    let t2192 = @simp.gen_rewrite_tac(fn(x2191 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2185 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2186 = @equal.land_conv(x2185)
        fn(x2187 : @kernel.Term) -> @kernel.Thm raise {
          s2186(x2187)
        }
      })((fn(x2188 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2189 = @equal.once_depth_conv(x2188)
        fn(x2190 : @kernel.Term) -> @kernel.Thm raise {
          s2189(x2190)
        }
      })(x2191))
    }, @list.List([@equal.sym(th_18)]))
    @tactics.then_tac(@simp.gen_rewrite_tac(fn(x2184 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2180 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x2174 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2175 = @equal.rand_conv(x2174)
          fn(x2176 : @kernel.Term) -> @kernel.Thm raise {
            s2175(x2176)
          }
        })((fn(x2177 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2178 = @equal.land_conv(x2177)
          fn(x2179 : @kernel.Term) -> @kernel.Thm raise {
            s2178(x2179)
          }
        })(x2180))
      })((fn(x2181 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2182 = @equal.once_depth_conv(x2181)
        fn(x2183 : @kernel.Term) -> @kernel.Thm raise {
          s2182(x2183)
        }
      })(x2184))
    }, @list.List([@equal.sym(th_18)])), t2192)
  })
  let t2168 = @kernel.assume_rule(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (H : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t2171 = @tactics.first_x_assum(fn(x2170 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2167 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2164 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2165 = @tactics.mp_tac(x2164)
        fn(x2166 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2165(x2166)
        }
      })(@bool.conjunct2(x2167))
    })((fn(x2169 : @kernel.Thm) -> @kernel.Thm raise {
      @drule.match_mp(x2169)(t2168)
    })(x2170))
  })
  let t2163 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2162 = @tactics.subgoal_then(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (H : ((Cart[Real, N]) -> Bool) -> Bool))"), fn(x2159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2160 = @tactics.assume_tac(x2159)
    fn(x2161 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2160(x2161)
    }
  })
  let t2158 = @simp.asm_rewrite_tac(@list.List([]))
  let t2157 = @class.asm_cases_tac(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (J : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t2156 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t2155 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ h : _, (P : (_) -> Bool)(h) → (Q : (_) -> Bool)(h) == (R : (_) -> Bool)(h)) → (∀ h : _, P(h)) → (∀ h : _, Q(h)) == (∀ h : _, R(h))")))
  let t2154 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), hyperplane_side()]))
  let t2153 = @simp.expand_tac("B")
  let t2152 = @simp.rewrite_tac(@list.List([hyperplane_equiv()]))
  let t2151 = @simp.gen_rewrite_tac(fn(x2150 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x2144 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2145 = @equal.rand_conv(x2144)
      fn(x2146 : @kernel.Term) -> @kernel.Thm raise {
        s2145(x2146)
      }
    })((fn(x2147 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2148 = @equal.rand_conv(x2147)
      fn(x2149 : @kernel.Term) -> @kernel.Thm raise {
        s2148(x2149)
      }
    })(x2150))
  }, @list.List([@sets.in_()]))
  let t2143 = @simp.rewrite_tac(@list.List([@sets.in_inters(), @sets.forall_in_image(), @sets.in_diff(), @sets.in_univ()]))
  let t2142 = @tactics.disch_then(fn(x2139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_17 = x2139
    let t2141 = @tactics.mp_tac(th_17)
    @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])")), t2141)
  })
  let t2138 = @simp.gen_rewrite_tac(fn(x2135 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2136 = @equal.rand_conv(x2135)
    fn(x2137 : @kernel.Term) -> @kernel.Thm raise {
      s2136(x2137)
    }
  }, @list.List([@sets.extension()]))
  let t2134 = @simp.rewrite_tac(@list.List([@sets.in_univ(), @sets.in_diff()]))
  let t2133 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, N])"))
  let t2132 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t2131 = @simp.rewrite_tac(@list.List([@sets.forall_in_image()]))
  let t2130 = @simp.rewrite_tac(@list.List([hyperplane_cell(), @equal.gsym(@sets.member_not_empty()), @sets.in_inters()]))
  let t2129 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2196 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!(INTERS(IMAGE((t : (Cart[Real, N]) -> Bool) => DIFF(UNIV, t), (J : ((Cart[Real, N]) -> Bool) -> Bool))) == {})"), fn(x2126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2127 = @tactics.mp_tac(x2126)
    fn(x2128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2127(x2128)
    }
  }), t2129), t2130), t2131), t2132), t2133), t2134), t2138), t2142), t2143), t2151), t2152), t2153), t2154), t2155), t2156), t2157), t2158), t2162), t2163), t2171), t2193), t2194), t2195), @tactics.all_tac])
  let t2125 = @tactics.subgoal_then(@term_syntax.parse_term("hyperplane_cell((B : ((Cart[Real, N], Real)) -> Bool), INTERS(IMAGE((t : (Cart[Real, N]) -> Bool) => DIFF(UNIV, t), (J : ((Cart[Real, N]) -> Bool) -> Bool))))"), fn(x2122 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2123 = @tactics.assume_tac(x2122)
    fn(x2124 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2123(x2124)
    }
  })
  let t2118 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.dot_rneg()]))
  let t2117 = @tactics.first_x_assum(fn(x2107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_16 = x2107
    let t2116 = @kernel.assume_rule(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (H : ((Cart[Real, N]) -> Bool) -> Bool))"))
    @simp.gen_rewrite_tac(fn(x2115 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2109 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2110 = @equal.land_conv(x2109)
        fn(x2111 : @kernel.Term) -> @kernel.Thm raise {
          s2110(x2111)
        }
      })((fn(x2112 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2113 = @equal.once_depth_conv(x2112)
        fn(x2114 : @kernel.Term) -> @kernel.Thm raise {
          s2113(x2114)
        }
      })(x2115))
    }, @list.List([@equal.sym(@bool.conjunct2(@drule.match_mp(th_16)(t2116)))]))
  })
  let t2106 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t2119 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ h : _, (P : (_) -> Bool)(h) → (Q : (_) -> Bool)(h) == (R : (_) -> Bool)(h)) → (∀ h : _, P(h) → Q(h)) == (∀ h : _, P(h) → R(h))"))), t2106), @tactics.disch_tac), t2117), t2118), @calc_rat.real_arith_tac)
  let t2105 = @tactics.asm_tac(@sets.set_tac)(@list.List([@realarith.real_lt_imp_le()]))
  let t2104 = @simp.asm_rewrite_tac(@list.List([]))
  let t2103 = @class.asm_cases_tac(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (H : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t2102 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t2101 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t2100 = @simp.rewrite_tac(@list.List([@sets.in_inters()]))
  let t2120 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("s"), t2100), t2101), t2102), t2103), t2104), t2105), t2119])
  let t2099 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((c : Bool) → (b : Bool)) && (a : Bool) == c → a == (b && c)")))
  let t2098 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), @sets.in_diff(), @sets.in_univ()]))
  let t2097 = @simp.rewrite_tac(@list.List([@sets.in_inters(), @sets.in_elim_thm()]))
  let t2096 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t2095 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(-(x : Cart[Real, N]) == (y : Cart[Real, N])) == (x == -y)")), @theorems.exists_refl()]))
  let t2094 = @tactics.match_mp_tac(@sets.surjective_image_eq())
  let t2093 = @tactics.conv_tac(@equal.sym_conv)
  let t2092 = @tactics.disch_then(fn(x2091 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2090 = @simp.asm_simp_tac(@list.List([@convex.relative_interior_interior()]))
  let t2089 = @simp.asm_simp_tac(@list.List([@sets.inter_univ()]))
  let t2086 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool) => real_of_num(0)")
  let t2087 = @term_syntax.parse_term("(fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])")
  let t2088 = @term_syntax.parse_term("(H : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t2121 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t2088, t2087, t2086]), @polytope.relative_interior_polyhedron_explicit())), t2089), t2090), t2092), t2093), t2094), t2095), t2096), t2097), t2098), t2099), @tactics.conj_tac), t2120), @tactics.all_tac])
  let t2085 = @tactics.subgoal_then(@term_syntax.parse_term("INTERS(IMAGE((t : (Cart[Real, N]) -> Bool) => DIFF(UNIV, t), (H : ((Cart[Real, N]) -> Bool) -> Bool))) == IMAGE(op_minus_minus, interior((s : (Cart[Real, N]) -> Bool)))"), fn(x2082 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2083 = @tactics.assume_tac(x2082)
    fn(x2084 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2083(x2084)
    }
  })
  let t2081 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2080 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((B : ((Cart[Real, N], Real)) -> Bool), (A : ((Cart[Real, N], Real)) -> Bool))"), fn(x2077 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2078 = @tactics.assume_tac(x2077)
    fn(x2079 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2078(x2079)
    }
  })
  let t2076 = @simp.abbrev_tac(@term_syntax.parse_term("(B : ((Cart[Real, N], Real)) -> Bool) == IMAGE((h : (Cart[Real, N]) -> Bool) => ((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])(h), real_of_num(0)), (J : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t2075 = @simp.rewrite_tac(@list.List([@sets.image_eq_empty()]))
  let t2074 = @tactics.x_gen_tac(@term_syntax.parse_term("(J : ((Cart[Real, N]) -> Bool) -> Bool)"))
  let t2073 = @simp.rewrite_tac(@list.List([@sets.simple_image(), @theorems.imp_conj(), @sets.forall_subset_image()]))
  let t2072 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t2215 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@iterate.sum_eq()), t2072), t2073), t2074), @tactics.disch_tac), t2075), @tactics.disch_tac), @tactics.ap_term_tac), t2076), t2080), t2081), t2085), t2121), t2125), t2196), t2197), t2198), @tactics.conj_tac), t2204), t2205), @tactics.ap_term_tac), t2206), t2207), t2208), t2209), @tactics.conj_tac), t2211), t2212), t2213), t2214), @tactics.all_tac])
  let t2071 = @tactics.exists_tac(@term_syntax.parse_term("(sum : ((((Cart[Real, N]) -> Bool) -> Bool) -> Bool, (((Cart[Real, N]) -> Bool) -> Bool) -> Real) -> Real)({(t : ((Cart[Real, N]) -> Bool) -> Bool) | (SUBSET : (((Cart[Real, N]) -> Bool) -> Bool, ((Cart[Real, N]) -> Bool) -> Bool) -> Bool)(t, {(DIFF : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)((UNIV : (Cart[Real, N]) -> Bool), (t : (Cart[Real, N]) -> Bool)) | (IN : ((Cart[Real, N]) -> Bool, ((Cart[Real, N]) -> Bool) -> Bool) -> Bool)(t, (H : ((Cart[Real, N]) -> Bool) -> Bool))}) && !(t == ({} : ((Cart[Real, N]) -> Bool) -> Bool))}, (t : ((Cart[Real, N]) -> Bool) -> Bool) => pow(-real_of_num(1), (CARD : (((Cart[Real, N]) -> Bool) -> Bool) -> Num)(t) + 1) * pow(-real_of_num(1), (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))))"))
  let t2070 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t2068 = @tactics.disch_then(fn(x2065 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2066 = @tactics.subst1_tac(x2065)
    fn(x2067 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2066(x2067)
    }
  })
  let t2064 = @simp.asm_simp_tac(@list.List([@sets.finite_image()]))
  let t2063 = @simp.once_rewrite_tac(@list.List([@sets.simple_image()]))
  let t2069 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.forall_in_gspec()])), t2063), t2064), t2068])
  let t2057 = @drule.part_match(fn(x2056 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x2056))
  }, euler_characteristic_inclusion_exclusion())
  let t2049 = @simp.rewrite_tac(@list.List([@convex.aff_dim_univ(), @int.num_of_int_of_num()]))
  let t2050 = @tactics.then_tac(@simp.simp_tac(@list.List([euler_characteristic_cell(), hyperplane_cell_empty()])), t2049)
  let t2048 = @simp.rewrite_tac(@list.List([hyperplane_cell_empty()]))
  let t2047 = @tactics.match_mp_tac(hyperplane_cell_cellcomplex())
  let t2045 = @simp.rewrite_tac(@list.List([@sets.empty_subset()]))
  let t2044 = @tactics.exists_tac(@term_syntax.parse_term("({} : ((Cart[Real, N], Real)) -> Bool)"))
  let t2046 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(hyperplane_cellcomplex_mono()), t2044), t2045), @tactics.all_tac])
  let t2043 = @simp.asm_rewrite_tac(@list.List([@sets.finite_empty()]))
  let t2051 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(euler_characterstic_invariant()), t2043), @tactics.conj_tac), t2046), t2047), t2048), t2050])
  let t2042 = @tactics.exists_tac(@term_syntax.parse_term("(euler_characteristic : (((Cart[Real, N], Real)) -> Bool, (Cart[Real, N]) -> Bool) -> Real)(({} : ((Cart[Real, N], Real)) -> Bool), (UNIV : (Cart[Real, N]) -> Bool))"))
  let t2052 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t2042), @tactics.conj_tac), t2051), @tactics.all_tac])
  let t2041 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) == pow(-real_of_num(1), (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))) && (y : Real) == pow(-real_of_num(1), (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))) → x == (s : Real) + y → s == real_of_num(0)")))
  let t2040 = @simp.asm_rewrite_tac(@list.List([]))
  let t2039 = @simp.rewrite_tac(@list.List([@sets.diff_inters()]))
  let t2037 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("UNION((s : (_) -> Bool), DIFF(UNIV, s)) == UNIV"))]))
  let t2038 = @list.List([@simp.asm_simp_tac(@list.List([hyperplane_cellcomplex_diff(), hyperplane_cellcomplex_univ()])), t2037])
  let t2036 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("DISJOINT((s : (_) -> Bool), DIFF(UNIV, s))"))]))
  let t2033 = @term_syntax.parse_term("DIFF(UNIV, INTERS((H : ((Cart[Real, N]) -> Bool) -> Bool)))")
  let t2034 = @term_syntax.parse_term("INTERS((H : ((Cart[Real, N]) -> Bool) -> Bool))")
  let t2035 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool)"), t2034, t2033]), euler_characteristic_cellcomplex_union()))
  let t2031 = @simp.asm_rewrite_tac(@list.List([]))
  let t2030 = @tactics.match_mp_tac(hyperplane_cellcomplex_inters())
  let t2032 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("s"), t2030), t2031), @tactics.all_tac])
  let t2029 = @tactics.subgoal_then(@term_syntax.parse_term("hyperplane_cellcomplex((A : ((Cart[Real, N], Real)) -> Bool), (s : (Cart[Real, N]) -> Bool))"), fn(x2026 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2027 = @tactics.assume_tac(x2026)
    fn(x2028 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2027(x2028)
    }
  })
  let t2025 = @list.List([@meson.asm_meson_tac(@list.List([hyperplane_cellcomplex_compl(), @sets.compl_compl()])), @tactics.all_tac])
  let t2024 = @tactics.subgoal_then(@term_syntax.parse_term("∀ h : (Cart[Real, N]) -> Bool, IN(h, (H : ((Cart[Real, N]) -> Bool) -> Bool)) → hyperplane_cellcomplex((A : ((Cart[Real, N], Real)) -> Bool), h)"), fn(x2021 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2022 = @tactics.assume_tac(x2021)
    fn(x2023 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2022(x2023)
    }
  })
  let t2017 = @meson.asm_meson_tac(@list.List([]))
  let t2016 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.subset(), @theorems.forall_unwind_thm2(), @sets.in_sing()]))
  let t2018 = @tactics.then_tac(@tactics.then_tac(@simp.expand_tac("A"), t2016), t2017)
  let t2015 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_diff(), @sets.in_elim_thm(), @sets.in_univ()]))
  let t2014 = @tactics.disch_then(fn(x2005 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_15 = x2005
    @simp.gen_rewrite_tac(fn(x2013 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2007 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2008 = @equal.land_conv(x2007)
        fn(x2009 : @kernel.Term) -> @kernel.Thm raise {
          s2008(x2009)
        }
      })((fn(x2010 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2011 = @equal.once_depth_conv(x2010)
        fn(x2012 : @kernel.Term) -> @kernel.Thm raise {
          s2011(x2012)
        }
      })(x2013))
    }, @list.List([@equal.sym(@bool.conjunct2(th_15))]))
  })
  let t2004 = @simp.asm_rewrite_tac(@list.List([]))
  let t2000 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t2003 = @tactics.first_x_assum(fn(x2002 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1997 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1998 = @tactics.mp_tac(x1997)
      fn(x1999 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1998(x1999)
      }
    })(((x2001 : @kernel.Thm) => @bool.spec(t2000, x2001))(x2002))
  })
  let t1996 = @tactics.repeat_tac(@tactics.disj2_tac)
  let t1995 = @simp.asm_simp_tac(@list.List([hyperplane_cell_sing()]))
  let t2019 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(hyperplane_cell_cellcomplex()), t1995), t1996), t2003), t2004), t2014), t2015), @calc_rat.real_arith_tac), t2018])
  let t1994 = @tactics.exists_tac(@term_syntax.parse_term("{((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])((h : (Cart[Real, N]) -> Bool)), real_of_num(0))}"))
  let t1993 = @tactics.match_mp_tac(hyperplane_cellcomplex_mono())
  let t2020 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1993), t1994), @tactics.conj_tac), t2019), @tactics.all_tac])
  let t1992 = @tactics.subgoal_then(@term_syntax.parse_term("∀ h : (Cart[Real, N]) -> Bool, IN(h, (H : ((Cart[Real, N]) -> Bool) -> Bool)) → hyperplane_cellcomplex((A : ((Cart[Real, N], Real)) -> Bool), DIFF(UNIV, h))"), fn(x1989 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1990 = @tactics.assume_tac(x1989)
    fn(x1991 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1990(x1991)
    }
  })
  let t1985 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1984 = @tactics.disch_then(fn(x1975 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_14 = x1975
    @simp.gen_rewrite_tac(fn(x1983 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1977 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1978 = @equal.land_conv(x1977)
        fn(x1979 : @kernel.Term) -> @kernel.Thm raise {
          s1978(x1979)
        }
      })((fn(x1980 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1981 = @equal.rand_conv(x1980)
        fn(x1982 : @kernel.Term) -> @kernel.Thm raise {
          s1981(x1982)
        }
      })(x1983))
    }, @list.List([@equal.gsym(@bool.conjunct2(th_14))]))
  })
  let t1974 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1970 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1973 = @tactics.first_x_assum(fn(x1972 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1967 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1968 = @tactics.mp_tac(x1967)
      fn(x1969 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1968(x1969)
      }
    })(((x1971 : @kernel.Thm) => @bool.spec(t1970, x1971))(x1972))
  })
  let t1966 = @simp.asm_rewrite_tac(@list.List([]))
  let t1962 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1965 = @tactics.disch_then(fn(x1964 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1959 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1960 = @tactics.mp_tac(x1959)
      fn(x1961 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1960(x1961)
      }
    })(((x1963 : @kernel.Thm) => @bool.spec(t1962, x1963))(x1964))
  })
  let t1958 = @simp.rewrite_tac(@list.List([@sets.in_inters()]))
  let t1957 = @simp.expand_tac("s")
  let t1956 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t1955 = @simp.asm_simp_tac(@list.List([@polytope.polyhedron_imp_convex()]))
  let t1954 = @tactics.match_mp_tac(@polytope.face_of_inter_supporting_hyperplane_le())
  let t1953 = @simp.rewrite_tac(@list.List([@sets.in_diff()]))
  let t1952 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t1951 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t1950 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1949 = @tactics.match_mp_tac(@polytope.face_of_inters())
  let t1945 = @simp.asm_simp_tac(@list.List([@realax.real_le_refl()]))
  let t1944 = @class.asm_cases_tac(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (J : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t1943 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff(), @sets.in_elim_thm()]))
  let t1942 = @tactics.disch_then(fn(x1933 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_13 = x1933
    @simp.gen_rewrite_tac(fn(x1941 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1935 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1936 = @equal.rand_conv(x1935)
        fn(x1937 : @kernel.Term) -> @kernel.Thm raise {
          s1936(x1937)
        }
      })((fn(x1938 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1939 = @equal.rand_conv(x1938)
        fn(x1940 : @kernel.Term) -> @kernel.Thm raise {
          s1939(x1940)
        }
      })(x1941))
    }, @list.List([@equal.gsym(@bool.conjunct2(th_13))]))
  })
  let t1932 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1928 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1931 = @tactics.first_x_assum(fn(x1930 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1925 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1926 = @tactics.mp_tac(x1925)
      fn(x1927 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1926(x1927)
      }
    })(((x1929 : @kernel.Thm) => @bool.spec(t1928, x1929))(x1930))
  })
  let t1924 = @tactics.disch_then(fn(x1922 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_12 = x1922
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th_12))
  })
  let t1921 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t1920 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1919 = @simp.rewrite_tac(@list.List([@sets.in_inters(), @theorems.and_forall_thm()]))
  let t1918 = @simp.expand_tac("s")
  let t1917 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1916 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(q : Bool) && ((p : Bool) → (r : Bool)) → !r → p == q")))
  let t1946 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!IN((y : Cart[Real, N]), (s : (Cart[Real, N]) -> Bool))")), t1916), @tactics.conj_tac), t1917), t1918), t1919), t1920), t1921), t1924), t1931), @tactics.ants_tac), t1932), t1942), t1943), t1944), t1945)
  let t1914 = @sets.set_tac(@list.List([]))
  let t1915 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t1914])
  let t1910 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1913 = @tactics.first_x_assum(fn(x1912 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1907 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1908 = @tactics.mp_tac(x1907)
      fn(x1909 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1908(x1909)
      }
    })(((x1911 : @kernel.Thm) => @bool.spec(t1910, x1911))(x1912))
  })
  let t1906 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1905 = @tactics.disch_then(fn(x1903 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_11 = x1903
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th_11))
  })
  let t1902 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t1901 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1900 = @simp.rewrite_tac(@list.List([@sets.in_inters()]))
  let t1899 = @simp.expand_tac("s")
  let t1898 = @tactics.undisch_tac(@term_syntax.parse_term("IN((y : Cart[Real, N]), (s : (Cart[Real, N]) -> Bool))"))
  let t1947 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) → (a && (b : Bool)) == b"))), t1898), t1899), t1900), t1901), t1902), t1905), @tactics.ants_tac), t1906), t1913), @tactics.ants_tac), t1915), t1946])
  let t1897 = @simp.asm_rewrite_tac(@list.List([]))
  let t1896 = @class.asm_cases_tac(@term_syntax.parse_term("IN((y : Cart[Real, N]), (s : (Cart[Real, N]) -> Bool))"))
  let t1895 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @sets.in_elim_thm()]))
  let t1894 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t1893 = @simp.gen_rewrite_tac(fn(x1892 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1892
  }, @list.List([@sets.extension()]))
  let t1891 = @simp.rewrite_tac(@list.List([@sets.inters_image()]))
  let t1948 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.simple_image()])), t1891), t1893), t1894), t1895), t1896), t1897), t1947), @tactics.all_tac])
  let t1890 = @tactics.subgoal_then(@term_syntax.parse_term("INTER(INTERS({{(x : Cart[Real, N]) | dot((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])((h : (Cart[Real, N]) -> Bool)), x) <= real_of_num(0)} | IN(h, (J : ((Cart[Real, N]) -> Bool) -> Bool))}), INTERS({{(x : Cart[Real, N]) | dot(fa((h : (Cart[Real, N]) -> Bool)), x) == real_of_num(0)} | IN(h, DIFF((H : ((Cart[Real, N]) -> Bool) -> Bool), J))})) == INTERS({INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | dot(fa((h : (Cart[Real, N]) -> Bool)), x) == real_of_num(0)}) | IN(h, DIFF(H, J))})"), fn(x1887 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1888 = @tactics.subst1_tac(x1887)
    fn(x1889 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1888(x1889)
    }
  })
  let t1885 = @simp.asm_simp_tac(@list.List([]))
  let t1884 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (f : (_) -> _)(x) == x) → s == {f((x : _)) | IN(x, s)}")))
  let t1883 = @simp.expand_tac("s")
  let t1882 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1879 = @drule.match_mp(@polytope.polyhedron_imp_convex())
  let t1877 = @drule.match_mp(@polytope.face_of_refl())
  let t1881 = @tactics.first_assum(fn(x1880 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1878 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1874 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1875 = @tactics.mp_tac(x1874)
        fn(x1876 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1875(x1876)
        }
      })(t1877(x1878))
    })(t1879(x1880))
  })
  let t1886 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.diff_eq_empty(), @sets.inter_univ(), @sets.not_in_empty(), @sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | false} == {}")), @sets.inters_0()])), t1881), t1882), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1883), @tactics.ap_term_tac), t1884), t1885), @tactics.all_tac])
  let t1873 = @class.asm_cases_tac(@term_syntax.parse_term("(J : ((Cart[Real, N]) -> Bool) -> Bool) == (H : ((Cart[Real, N]) -> Bool) -> Bool)"))
  let t1871 = @simp.simp_tac(@list.List([@topology.closed_inters(), @sets.forall_in_gspec(), @topology.closed_hyperplane()]))
  let t1872 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.closure_eq()])), t1871), @tactics.all_tac])
  let t1870 = @tactics.subgoal_then(@term_syntax.parse_term("closure(INTERS({{(x : Cart[Real, N]) | dot((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])((h : (Cart[Real, N]) -> Bool)), x) == real_of_num(0)} | IN(h, DIFF((H : ((Cart[Real, N]) -> Bool) -> Bool), (J : ((Cart[Real, N]) -> Bool) -> Bool)))})) == INTERS({{(x : Cart[Real, N]) | dot(fa((h : (Cart[Real, N]) -> Bool)), x) == real_of_num(0)} | IN(h, DIFF(H, J))})"), fn(x1867 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1868 = @tactics.subst1_tac(x1867)
    fn(x1869 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1868(x1869)
    }
  })
  let t1865 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1864 = @tactics.match_mp_tac(@topology.closure_halfspace_lt())
  let t1863 = @simp.rewrite_tac(@list.List([]))
  let t1862 = @tactics.match_mp_tac(@sets.image_eq())
  let t1861 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o()), @trivia.o_def()]))
  let t1866 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.simple_image()])), t1861), t1862), @tactics.gen_tac), @tactics.disch_tac), t1863), t1864), t1865), @tactics.all_tac])
  let t1860 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE(closure, {{(x : Cart[Real, N]) | dot((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])((h : (Cart[Real, N]) -> Bool)), x) < real_of_num(0)} | IN(h, (J : ((Cart[Real, N]) -> Bool) -> Bool))}) == {{(x : Cart[Real, N]) | dot(fa((h : (Cart[Real, N]) -> Bool)), x) <= real_of_num(0)} | IN(h, J)}"), fn(x1857 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1858 = @tactics.subst1_tac(x1857)
    fn(x1859 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1858(x1859)
    }
  })
  let t1856 = @simp.asm_rewrite_tac(@list.List([@polytope.empty_face_of(), @sets.inter_empty()]))
  let t1855 = @simp.simp_tac(@list.List([@convex.closure_inters_convex_open(), @sets.forall_in_gspec(), @convex.convex_halfspace_lt(), @topology.open_halfspace_lt()]))
  let t1854 = @tactics.disch_then(fn(x1851 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1852 = @tactics.subst1_tac(x1851)
    fn(x1853 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1852(x1853)
    }
  })
  let t1847 = @meson.asm_meson_tac(@list.List([nonempty_hyperplane_cell()]))
  let t1846 = @simp.asm_rewrite_tac(@list.List([]))
  let t1848 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1844 = @tactics.subst1_tac(x1843)
    fn(x1845 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1844(x1845)
    }
  }), t1846), t1847)
  let t1842 = @simp.simp_tac(@list.List([@convex.affine_inters(), @convex.affine_hyperplane(), @sets.forall_in_gspec()]))
  let t1841 = @simp.rewrite_tac(@list.List([@convex.affine_hull_eq()]))
  let t1840 = @simp.rewrite_tac(@list.List([@sets.subset_univ(), @topology.topspace_euclidean()]))
  let t1849 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([@metric.open_in_subtopology_refl()]), @term_syntax.parse_term("SUBSET((s : (_) -> Bool), topspace((tp : Topology[_]))) && (t : (_) -> Bool) == s → open_in(subtopology(tp, t), s)"))), t1840), t1841), t1842), t1848])
  let t1832 = @drule.part_match(fn(x1831 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1831))
  }, @convex.relative_interior_open_in())
  let t1826 = @tactics.disch_then(fn(x1823 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1824 = @tactics.subst1_tac(x1823)
    fn(x1825 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1824(x1825)
    }
  })
  let t1822 = @meson.asm_meson_tac(@list.List([@sets.finite_subset()]))
  let t1821 = @tactics.match_mp_tac(@sets.finite_image())
  let t1820 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), @topology.open_halfspace_lt()]))
  let t1819 = @simp.once_rewrite_tac(@list.List([@sets.simple_image()]))
  let t1827 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.open_inters()), t1819), t1820), t1821), t1822), t1826])
  let t1811 = @drule.part_match(fn(x1810 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1810))
  }, @convex.relative_interior_open())
  let t1850 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@convex.convex_inters(), @sets.forall_in_gspec(), @convex.convex_halfspace_lt(), @convex.convex_hyperplane()])), fn(x1818 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1817 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1815 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1814 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1813 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x1812 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              (fn(x1807 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
                let s1808 = @tactics.mp_tac(x1807)
                fn(x1809 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                  s1808(x1809)
                }
              })(t1811(x1812))
            })(@equal.lhand(x1813))
          })(@equal.lhand(x1814))
        })(@kernel.rand(x1815))
      })((fn(x1816 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1816.1
      })(x1817))
    })(x1818)(x1818)
  }), @tactics.ants_tac), t1827), fn(x1839 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1838 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1836 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1835 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1834 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x1833 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              (fn(x1828 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
                let s1829 = @tactics.mp_tac(x1828)
                fn(x1830 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                  s1829(x1830)
                }
              })(t1832(x1833))
            })(@kernel.rand(x1834))
          })(@equal.lhand(x1835))
        })(@kernel.rand(x1836))
      })((fn(x1837 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1837.1
      })(x1838))
    })(x1839)(x1839)
  }), @tactics.ants_tac), t1849), @tactics.all_tac])
  let t1801 = @drule.part_match(fn(x1800 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1800))
  }, @convex.closure_inter_convex())
  let t1796 = @simp.expand_tac("c")
  let t1794 = @tactics.disch_then(fn(x1793 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x1793))
  })
  let t1792 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1791 = @tactics.disch_then(fn(x1790 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1789 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1786 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1787 = @tactics.subst1_tac(x1786)
        fn(x1788 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1787(x1788)
        }
      })(@equal.sym(x1789))
    })(@bool.conjunct2(x1790))
  })
  let t1785 = @simp.asm_rewrite_tac(@list.List([]))
  let t1781 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1784 = @tactics.first_x_assum(fn(x1783 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1778 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1779 = @tactics.mp_tac(x1778)
      fn(x1780 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1779(x1780)
      }
    })(((x1782 : @kernel.Thm) => @bool.spec(t1781, x1782))(x1783))
  })
  let t1777 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1771 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1772 = @tactics.assume_tac(x1771)
    fn(x1773 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1772(x1773)
    }
  }, fn(x1774 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1775 = @tactics.mp_tac(x1774)
    fn(x1776 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1775(x1776)
    }
  }))
  let t1770 = @simp.asm_rewrite_tac(@list.List([@real.real_sgn_eq()]))
  let t1766 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1769 = @tactics.disch_then(fn(x1768 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1763 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1764 = @tactics.mp_tac(x1763)
      fn(x1765 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1764(x1765)
      }
    })(((x1767 : @kernel.Thm) => @bool.spec(t1766, x1767))(x1768))
  })
  let t1762 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t1761 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t1760 = @simp.rewrite_tac(@list.List([@sets.in_inters(), @sets.in_elim_thm(), @class.not_exists_thm()]))
  let t1759 = @tactics.map_every(fn(x1756 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1757 = @simp.expand_tac(x1756)
    fn(x1758 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1757(x1758)
    }
  }, @list.List(["s", "c"]))
  let t1754 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → (q : Bool)")))
  let t1755 = @list.List([@meson.asm_meson_tac(@list.List([@sets.member_not_empty(), @sets.subset(), nonempty_hyperplane_cell()])), t1754])
  let t1753 = @tactics.subgoal_then(@term_syntax.parse_term("∃ x : Cart[Real, N], IN(x, (c : (Cart[Real, N]) -> Bool)) && IN(x, (s : (Cart[Real, N]) -> Bool))"), fn(x1750 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1751 = @tactics.mp_tac(x1750)
    fn(x1752 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1751(x1752)
    }
  })
  let t1749 = @simp.rewrite_tac(@list.List([@real.real_sgn_eq()]))
  let t1748 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1747 = @simp.asm_rewrite_tac(@list.List([]))
  let t1745 = @bool.spec(@term_syntax.parse_term("dot((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])((h : (Cart[Real, N]) -> Bool)), (z : Cart[Real, N]))"), @real.real_sgn_cases())
  let t1746 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x1742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1743 = @tactics.assume_tac(x1742)
    fn(x1744 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1743(x1744)
    }
  })(t1745)
  let t1741 = @simp.asm_rewrite_tac(@list.List([]))
  let t1740 = @class.asm_cases_tac(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (H : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t1739 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t1738 = @simp.rewrite_tac(@list.List([@class.fun_eq_thm()]))
  let t1737 = @simp.rewrite_tac(@list.List([@theorems.and_forall_thm()]))
  let t1736 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) && !(a && (b : Bool))) == (a && !b)"))]))
  let t1735 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_elim_thm()]))
  let t1734 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t1733 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))")), @theorems.forall_and_thm()]))
  let t1732 = @simp.rewrite_tac(@list.List([@sets.in_union()]))
  let t1731 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_inters()]))
  let t1730 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t1729 = @simp.gen_rewrite_tac(fn(x1728 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1728
  }, @list.List([@sets.extension()]))
  let t1727 = @simp.expand_tac("c")
  let t1726 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.inters_union())]))
  let t1725 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("SUBSET({(x : _) | IN(x, (s : (_) -> Bool)) && (P : (_) -> Bool)(x)}, s)"))]))
  let t1724 = @tactics.exists_tac(@term_syntax.parse_term("{(h : (Cart[Real, N]) -> Bool) | IN(h, (H : ((Cart[Real, N]) -> Bool) -> Bool)) && real_sgn(dot((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])(h), (z : Cart[Real, N]))) == -real_of_num(1)}"))
  let t1723 = @tactics.disch_then(fn(x1722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1719 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1720 = @tactics.assume_tac(x1719)
      fn(x1721 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1720(x1721)
      }
    })(@equal.sym(x1722))
  })
  let t1718 = @simp.gen_rewrite_tac(fn(x1717 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1713 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1707 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1708 = @equal.land_conv(x1707)
        fn(x1709 : @kernel.Term) -> @kernel.Thm raise {
          s1708(x1709)
        }
      })((fn(x1710 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1711 = @equal.rand_conv(x1710)
        fn(x1712 : @kernel.Term) -> @kernel.Thm raise {
          s1711(x1712)
        }
      })(x1713))
    })((fn(x1714 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1715 = @equal.once_depth_conv(x1714)
      fn(x1716 : @kernel.Term) -> @kernel.Thm raise {
        s1715(x1716)
      }
    })(x1717))
  }, @list.List([@theorems.eq_sym_eq()]))
  let t1706 = @simp.rewrite_tac(@list.List([hyperplane_side(), @real.real_sub_rzero()]))
  let t1705 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(z : Cart[Real, N])"))(fn(x1702 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1703 = @tactics.mp_tac(x1702)
    fn(x1704 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1703(x1704)
    }
  }))
  let t1701 = @simp.rewrite_tac(@list.List([hyperplane_equiv(), @sets.forall_in_image()]))
  let t1700 = @simp.expand_tac("A")
  let t1698 = @simp.gen_rewrite_rule(fn(x1697 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1697
  }, @list.List([hyperplane_cell_v1()]))
  let t1795 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1699 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1694 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1695 = @tactics.mp_tac(x1694)
      fn(x1696 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1695(x1696)
      }
    })(t1698(x1699))
  }), t1700), t1701), t1705), t1706), t1718), t1723), t1724), t1725), t1726), t1727), t1729), t1730), t1731), t1732), t1733), t1734), t1735), t1736), t1737), @tactics.ap_term_tac), t1738), t1739), t1740), t1741), t1746), t1747), t1748), t1749), t1753), t1755), t1759), t1760), t1761), t1762), t1769), t1770), t1777), t1784), t1785), t1791), t1792), @calc_rat.asm_real_arith_tac), t1794])
  let t1693 = @tactics.subgoal_then(@term_syntax.parse_term("∃ J : ((Cart[Real, N]) -> Bool) -> Bool, SUBSET(J, (H : ((Cart[Real, N]) -> Bool) -> Bool)) && (c : (Cart[Real, N]) -> Bool) == INTER(INTERS({{(x : Cart[Real, N]) | dot((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])((h : (Cart[Real, N]) -> Bool)), x) < real_of_num(0)} | IN(h, J)}), INTERS({{(x : Cart[Real, N]) | dot(fa((h : (Cart[Real, N]) -> Bool)), x) == real_of_num(0)} | IN(h, DIFF(H, J))}))"), fn(x1690 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1691 = @tactics.mp_tac(x1690)
    fn(x1692 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1691(x1692)
    }
  })
  let t1687 = @meson.asm_meson_tac(@list.List([hyperplane_cell_relative_interior()]))
  let t1686 = @meson.asm_meson_tac(@list.List([hyperplane_cell_convex()]))
  let t1688 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@convex.convex_relative_interior_closure()), t1686), t1687])
  let t1685 = @tactics.exists_tac(@term_syntax.parse_term("relative_interior((c : (Cart[Real, N]) -> Bool))"))
  let t1689 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t1685), @tactics.conj_tac), t1688)])
  let t1684 = @simp.asm_rewrite_tac(@list.List([@convex.aff_dim_affine_hull()]))
  let t1683 = @simp.rewrite_tac(@list.List([@convex.affine_hull_closure()]))
  let t1682 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@convex.aff_dim_affine_hull())]))
  let t1986 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(c : (Cart[Real, N]) -> Bool)")), @tactics.strip_tac), t1682), t1683), t1684), @tactics.conj_tac), t1689), t1693), t1795), t1796), fn(x1806 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1805 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1803 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1802 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1797 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1798 = @tactics.mp_tac(x1797)
            fn(x1799 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1798(x1799)
            }
          })(t1801(x1802))
        })(@equal.lhand(x1803))
      })((fn(x1804 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1804.1
      })(x1805))
    })(x1806)(x1806)
  }), @tactics.ants_tac), t1850), t1854), t1855), @class.cond_cases_tac), t1856), t1860), t1866), t1870), t1872), t1873), t1886), t1890), t1948), t1949), @tactics.conj_tac), t1950), t1951), t1952), t1953), @tactics.strip_tac), t1954), t1955), t1956), t1957), t1958), t1965), t1966), t1973), @tactics.ants_tac), t1974), t1984), t1985)
  let t1681 = @meson.meson_tac(@list.List([@real.real_sgn_eq()]))
  let t1679 = @list.List([@meson.meson_tac(@list.List([@real.real_sgn_eq()])), @tactics.all_tac])
  let t1680 = @tactics.repeat_tac(@tactics.thenl(@tactics.then_tac(@class.cond_cases_tac, @simp.simp_tac(@list.List([@sets.in_elim_thm()]))), t1679))
  let t1678 = @simp.rewrite_tac(@list.List([hyperplane_side(), @real.real_sub_rzero()]))
  let t1677 = @simp.asm_rewrite_tac(@list.List([]))
  let t1676 = @class.asm_cases_tac(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (H : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t1675 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t1674 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ h : _, (P : (_) -> Bool)(h) → (Q : (_) -> Bool)(h) == (R : (_) -> Bool)(h)) → (∀ h : _, P(h)) → (∀ h : _, Q(h)) == (∀ h : _, R(h))")))
  let t1673 = @simp.rewrite_tac(@list.List([hyperplane_equiv(), @sets.forall_in_image()]))
  let t1672 = @simp.gen_rewrite_tac(fn(x1671 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1665 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1666 = @equal.rand_conv(x1665)
      fn(x1667 : @kernel.Term) -> @kernel.Thm raise {
        s1666(x1667)
      }
    })((fn(x1668 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1669 = @equal.rand_conv(x1668)
      fn(x1670 : @kernel.Term) -> @kernel.Thm raise {
        s1669(x1670)
      }
    })(x1671))
  }, @list.List([@sets.in_()]))
  let t1664 = @tactics.disch_then(fn(x1661 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_10 = x1661
    let t1663 = @tactics.mp_tac(th_10)
    @tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])")), t1663)
  })
  let t1660 = @simp.rewrite_tac(@list.List([@sets.in_inters(), @sets.forall_in_gspec()]))
  let t1659 = @simp.expand_tac("A")
  let t1658 = @simp.once_asm_rewrite_tac(@list.List([]))
  let t1657 = @simp.gen_rewrite_tac(fn(x1654 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1655 = @equal.rand_conv(x1654)
    fn(x1656 : @kernel.Term) -> @kernel.Thm raise {
      s1655(x1656)
    }
  }, @list.List([@sets.extension()]))
  let t1653 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, N])"))
  let t1652 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1651 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), hyperplane_cell()]))
  let t1650 = @tactics.undisch_tac(@term_syntax.parse_term("!(relative_interior((f : (Cart[Real, N]) -> Bool)) == {})"))
  let t1648 = @simp.asm_simp_tac(@list.List([@real.real_lt_div(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t1647 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t1646 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_rsub(), @real.real_sub_lzero(), @real.real_not_le()]))
  let t1645 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.dot_radd(), @realax.real_add_lid(), @vectors.dot_rmul()]))
  let t1644 = @tactics.first_assum(fn(x1634 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_9 = x1634
    let t1643 = @kernel.assume_rule(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (H : ((Cart[Real, N]) -> Bool) -> Bool))"))
    @simp.gen_rewrite_tac(fn(x1642 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1636 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1637 = @equal.rand_conv(x1636)
        fn(x1638 : @kernel.Term) -> @kernel.Thm raise {
          s1637(x1638)
        }
      })((fn(x1639 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1640 = @equal.rand_conv(x1639)
        fn(x1641 : @kernel.Term) -> @kernel.Thm raise {
          s1640(x1641)
        }
      })(x1642))
    }, @list.List([@equal.sym(@bool.conjunct2(@drule.match_mp(th_9)(t1643)))]))
  })
  let t1633 = @simp.asm_rewrite_tac(@list.List([]))
  let t1629 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1632 = @tactics.disch_then(fn(x1631 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1626 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1627 = @tactics.mp_tac(x1626)
      fn(x1628 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1627(x1628)
      }
    })(((x1630 : @kernel.Thm) => @bool.spec(t1629, x1630))(x1631))
  })
  let t1625 = @simp.rewrite_tac(@list.List([@sets.in_inters()]))
  let t1624 = @simp.expand_tac("s")
  let t1623 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset(), @polytope.face_of_imp_subset()])), @tactics.all_tac])
  let t1622 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, N]) + op_pct((e : Real) / norm((y : Cart[Real, N]) - x), x - y), (s : (Cart[Real, N]) -> Bool))"), fn(x1619 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1620 = @tactics.mp_tac(x1619)
    fn(x1621 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1620(x1621)
    }
  })
  let t1618 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@vectors.norm_mul(), @real.real_abs_div(), @vectors.real_abs_norm(), @vectors.norm_sub(), @real.real_div_rmul(), @vectors.norm_eq_0(), @vectors.vector_sub_eq()])), @calc_rat.asm_real_arith_tac), @tactics.disch_tac])
  let t1617 = @simp.rewrite_tac(@list.List([@class.not_imp()]))
  let t1616 = @simp.rewrite_tac(@list.List([@vectors.norm_arith(@term_syntax.parse_term("distance(((x : Cart[Real, N]), x + (r : Cart[Real, N]))) == norm(r)"))]))
  let t1614 = @simp.asm_simp_tac(@list.List([@convex.in_affine_add_mul_diff(), @convex.affine_affine_hull()]))
  let t1615 = @list.List([@meson.asm_meson_tac(@list.List([@convex.relative_interior_subset(), @sets.subset(), @misc.hull_subset()])), t1614])
  let t1613 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, N]), hull(affine, (f : (Cart[Real, N]) -> Bool))) && IN((y : Cart[Real, N]), hull(affine, f))"), @tactics.strip_assume_tac)
  let t1609 = @term_syntax.parse_term("(x : Cart[Real, N]) + op_pct((e : Real) / norm((y : Cart[Real, N]) - x), x - y)")
  let t1612 = @tactics.disch_then(fn(x1611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1606 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1607 = @tactics.mp_tac(x1606)
      fn(x1608 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1607(x1608)
      }
    })(((x1610 : @kernel.Thm) => @bool.spec(t1609, x1610))(x1611))
  })
  let t1605 = @list.List([@meson.asm_meson_tac(@list.List([@realarith.real_lt_refl()])), @tactics.all_tac])
  let t1604 = @tactics.subgoal_then(@term_syntax.parse_term("!((y : Cart[Real, N]) == (x : Cart[Real, N]))"), fn(x1601 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1602 = @tactics.assume_tac(x1601)
    fn(x1603 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1602(x1603)
    }
  })
  let t1600 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_inter(), @topology.in_cball()]))
  let t1599 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1593 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1594 = @tactics.assume_tac(x1593)
    fn(x1595 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1594(x1595)
    }
  }, fn(x1596 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1597 = @tactics.mp_tac(x1596)
    fn(x1598 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1597(x1598)
    }
  }))
  let t1592 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t1591 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t1590 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1584 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1585 = @tactics.assume_tac(x1584)
    fn(x1586 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1585(x1586)
    }
  }, fn(x1587 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1588 = @tactics.mp_tac(x1587)
    fn(x1589 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1588(x1589)
    }
  }))
  let t1583 = @simp.rewrite_tac(@list.List([@convex.in_relative_interior_cball()]))
  let t1582 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("IN((x : Cart[Real, N]), relative_interior((f : (Cart[Real, N]) -> Bool)))")))
  let t1581 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1578 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("!((x : Real) == real_of_num(0)) → !(x <= real_of_num(0)) || x < real_of_num(0)")))
  let t1580 = @tactics.first_x_assum(fn(x1579 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.disj_cases_tac(t1578(x1579))
  })
  let t1577 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t1576 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @class.not_exists_thm()]))
  let t1573 = @simp.gen_rewrite_rule(fn(x1572 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1572
  }, @list.List([@sets.set_rule(@term_syntax.parse_term("!SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) == (∃ y : _, IN(y, s) && !IN(y, t))"))]))
  let t1575 = @tactics.first_x_assum(fn(x1574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1569 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1570 = @tactics.mp_tac(x1569)
      fn(x1571 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1570(x1571)
      }
    })(t1573(x1574))
  })
  let t1568 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.disch_tac])
  let t1567 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @realarith.real_lt_le()]))
  let t1566 = @tactics.repeat_tac(@tactics.thenl(@class.cond_cases_tac, @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])))
  let t1565 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t1564 = @simp.rewrite_tac(@list.List([@sets.in_inters(), @sets.forall_in_gspec()]))
  let t1563 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t1562 = @simp.gen_rewrite_tac(fn(x1561 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1561
  }, @list.List([@sets.subset()]))
  let t1559 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1558 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @realax.real_le_refl()]))
  let t1557 = @class.asm_cases_tac(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (K : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t1556 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1555 = @simp.asm_simp_tac(@list.List([@sets.in_elim_thm(), @realarith.real_lt_imp_le()]))
  let t1554 = @class.asm_cases_tac(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (J : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t1553 = @simp.asm_rewrite_tac(@list.List([]))
  let t1551 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1552 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.disch_then(fn(x1550 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t1551)])
  let t1549 = @class.asm_cases_tac(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (H : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t1548 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t1547 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1546 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1545 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t1544 = @simp.rewrite_tac(@list.List([@sets.in_inters(), @sets.forall_in_gspec(), @theorems.and_forall_thm()]))
  let t1543 = @simp.gen_rewrite_tac(fn(x1542 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1542
  }, @list.List([@sets.subset()]))
  let t1560 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x1537 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_8 = x1537
    @simp.gen_rewrite_tac(fn(x1539 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1540 = @equal.rand_conv(x1539)
      fn(x1541 : @kernel.Term) -> @kernel.Thm raise {
        s1540(x1541)
      }
    }, @list.List([@equal.sym(th_8)]))
  }), t1543), t1544), t1545), t1546), t1547), t1548), t1549), t1552), t1553), t1554), t1555), t1556), t1557), t1558), @class.cond_cases_tac), t1559), @calc_rat.real_arith_tac)])
  let t1649 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_antisym()), @tactics.conj_tac), t1560), t1562), t1563), @tactics.disch_tac), t1564), t1565), @tactics.disch_tac), t1566), t1567), @tactics.conj_tac), t1568), t1575), t1576), t1577), @tactics.strip_tac), t1580), t1581), t1582), t1583), t1590), t1591), t1592), t1599), t1600), t1604), t1605), t1612), t1613), t1615), t1616), t1617), @tactics.conj_tac), t1618), t1622), t1623), t1624), t1625), t1632), t1633), t1644), t1645), t1646), t1647), t1648), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1536 = @tactics.subgoal_then(@term_syntax.parse_term("relative_interior((f : (Cart[Real, N]) -> Bool)) == INTERS({if IN((h : (Cart[Real, N]) -> Bool), (J : ((Cart[Real, N]) -> Bool) -> Bool)) { {(x : Cart[Real, N]) | dot((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])(h), x) < real_of_num(0)} } else { if IN(h, (K : ((Cart[Real, N]) -> Bool) -> Bool)) { {(x : Cart[Real, N]) | dot(fa(h), x) == real_of_num(0)} } else { if SUBSET(relative_interior(f), {(x : Cart[Real, N]) | dot(fa(h), x) == real_of_num(0)}) { {(x : Cart[Real, N]) | dot(fa(h), x) == real_of_num(0)} } else { {(x : Cart[Real, N]) | dot(fa(h), x) < real_of_num(0)} } } } | IN(h, (H : ((Cart[Real, N]) -> Bool) -> Bool))})"), fn(x1533 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1534 = @tactics.assume_tac(x1533)
    fn(x1535 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1534(x1535)
    }
  })
  let t1531 = @meson.asm_meson_tac(@list.List([@realarith.real_lt_refl()]))
  let t1530 = @simp.rewrite_tac(@list.List([@sets.in_disjoint(), @equal.gsym(@sets.member_not_empty()), @sets.in_elim_thm()]))
  let t1529 = @tactics.first_x_assum(fn(x1516 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_7 = x1516
    @simp.gen_rewrite_tac(fn(x1528 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1524 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x1518 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1519 = @equal.land_conv(x1518)
          fn(x1520 : @kernel.Term) -> @kernel.Thm raise {
            s1519(x1520)
          }
        })((fn(x1521 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1522 = @equal.rand_conv(x1521)
          fn(x1523 : @kernel.Term) -> @kernel.Thm raise {
            s1522(x1523)
          }
        })(x1524))
      })((fn(x1525 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1526 = @equal.land_conv(x1525)
        fn(x1527 : @kernel.Term) -> @kernel.Thm raise {
          s1526(x1527)
        }
      })(x1528))
    }, @list.List([@equal.sym(th_7)]))
  })
  let t1532 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!(relative_interior((f : (Cart[Real, N]) -> Bool)) == {})")), t1529), t1530), t1531), @tactics.all_tac])
  let t1515 = @tactics.subgoal_then(@term_syntax.parse_term("DISJOINT((J : ((Cart[Real, N]) -> Bool) -> Bool), (K : ((Cart[Real, N]) -> Bool) -> Bool))"), fn(x1512 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1513 = @tactics.assume_tac(x1512)
    fn(x1514 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1513(x1514)
    }
  })
  let t1511 = @list.List([@meson.asm_meson_tac(@list.List([@convex.relative_interior_eq_empty(), @polytope.face_of_imp_convex()])), @tactics.all_tac])
  let t1510 = @tactics.subgoal_then(@term_syntax.parse_term("!(relative_interior((f : (Cart[Real, N]) -> Bool)) == {})"), fn(x1507 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1508 = @tactics.assume_tac(x1507)
    fn(x1509 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1508(x1509)
    }
  })
  let t1506 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1505 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @sets.in_inters(), @sets.forall_in_gspec(), @equal.gsym(@theorems.conj_assoc())]))
  let t1504 = @tactics.disch_then(fn(x1490 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_6 = x1490
    let t1503 = @simp.gen_rewrite_tac(fn(x1502 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1498 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x1492 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1493 = @equal.land_conv(x1492)
          fn(x1494 : @kernel.Term) -> @kernel.Thm raise {
            s1493(x1494)
          }
        })((fn(x1495 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s1496 = @equal.land_conv(x1495)
          fn(x1497 : @kernel.Term) -> @kernel.Thm raise {
            s1496(x1497)
          }
        })(x1498))
      })((fn(x1499 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1500 = @equal.once_depth_conv(x1499)
        fn(x1501 : @kernel.Term) -> @kernel.Thm raise {
          s1500(x1501)
        }
      })(x1502))
    }, @list.List([th_6]))
    @tactics.then_tac(@tactics.assume_tac(@equal.sym(th_6)), t1503)
  })
  let t1489 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1483 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1484 = @tactics.assume_tac(x1483)
    fn(x1485 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1484(x1485)
    }
  }, fn(x1486 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1487 = @tactics.mp_tac(x1486)
    fn(x1488 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1487(x1488)
    }
  }))
  let t1482 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(K : ((Cart[Real, N]) -> Bool) -> Bool)"))(fn(x1479 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1480 = @tactics.mp_tac(x1479)
    fn(x1481 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1480(x1481)
    }
  }))
  let t1478 = @tactics.first_x_assum(fn(x1472 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x1472
    let t1477 = @tactics.mp_tac(@equal.sym(th_5))
    @tactics.then_tac(@simp.gen_rewrite_tac(fn(x1474 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1475 = @equal.rand_conv(x1474)
      fn(x1476 : @kernel.Term) -> @kernel.Thm raise {
        s1475(x1476)
      }
    }, @list.List([@equal.sym(th_5)])), t1477)
  })
  let t1470 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1469 = @tactics.disch_then(fn(x1460 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x1460
    @simp.gen_rewrite_tac(fn(x1468 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1462 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1463 = @equal.land_conv(x1462)
        fn(x1464 : @kernel.Term) -> @kernel.Thm raise {
          s1463(x1464)
        }
      })((fn(x1465 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1466 = @equal.rand_conv(x1465)
        fn(x1467 : @kernel.Term) -> @kernel.Thm raise {
          s1466(x1467)
        }
      })(x1468))
    }, @list.List([@equal.sym(@bool.conjunct2(th_4))]))
  })
  let t1459 = @simp.asm_rewrite_tac(@list.List([]))
  let t1455 = @term_syntax.parse_term("(h' : (Cart[Real, N]) -> Bool)")
  let t1458 = @tactics.first_x_assum(fn(x1457 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1452 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1453 = @tactics.mp_tac(x1452)
      fn(x1454 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1453(x1454)
      }
    })(((x1456 : @kernel.Thm) => @bool.spec(t1455, x1456))(x1457))
  })
  let t1451 = @simp.asm_rewrite_tac(@list.List([]))
  let t1447 = @term_syntax.parse_term("(h' : (Cart[Real, N]) -> Bool)")
  let t1450 = @tactics.disch_then(fn(x1449 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1444 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1445 = @tactics.mp_tac(x1444)
      fn(x1446 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1445(x1446)
      }
    })(((x1448 : @kernel.Thm) => @bool.spec(t1447, x1448))(x1449))
  })
  let t1443 = @simp.rewrite_tac(@list.List([@sets.in_inters()]))
  let t1442 = @simp.expand_tac("s")
  let t1441 = @tactics.undisch_tac(@term_syntax.parse_term("IN((z : Cart[Real, N]), (s : (Cart[Real, N]) -> Bool))"))
  let t1440 = @simp.asm_rewrite_tac(@list.List([@vectors.dot_lneg()]))
  let t1436 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1439 = @tactics.disch_then(fn(x1438 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1433 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1434 = @tactics.mp_tac(x1433)
      fn(x1435 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1434(x1435)
      }
    })(((x1437 : @kernel.Thm) => @bool.spec(t1436, x1437))(x1438))
  })
  let t1432 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1431 = @tactics.undisch_tac(@term_syntax.parse_term("IN((z : Cart[Real, N]), relative_interior((f : (Cart[Real, N]) -> Bool)))"))
  let t1430 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(h' : (Cart[Real, N]) -> Bool)"))(@tactics.strip_assume_tac))
  let t1429 = @simp.rewrite_tac(@list.List([]))
  let t1428 = @tactics.disch_then(@tactics.disj_cases_then(fn(x1425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1426 = @tactics.mp_tac(x1425)
    fn(x1427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1426(x1427)
    }
  }))
  let t1424 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1418 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1419 = @tactics.assume_tac(x1418)
    fn(x1420 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1419(x1420)
    }
  }, fn(x1421 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1422 = @tactics.mp_tac(x1421)
    fn(x1423 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1422(x1423)
    }
  }))
  let t1417 = @simp.asm_rewrite_tac(@list.List([]))
  let t1413 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1416 = @tactics.first_x_assum(fn(x1415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1410 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1411 = @tactics.mp_tac(x1410)
      fn(x1412 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1411(x1412)
      }
    })(((x1414 : @kernel.Thm) => @bool.spec(t1413, x1414))(x1415))
  })
  let t1409 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t1408 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset(), @polytope.face_of_imp_subset(), @convex.relative_interior_subset()])), @tactics.all_tac])
  let t1407 = @tactics.subgoal_then(@term_syntax.parse_term("IN((z : Cart[Real, N]), (f : (Cart[Real, N]) -> Bool)) && IN(z, (s : (Cart[Real, N]) -> Bool))"), @tactics.strip_assume_tac)
  let t1404 = @term_syntax.parse_term("(z : Cart[Real, N])")
  let t1406 = @tactics.disch_then((x1405 : @kernel.Thm) => @tactics.x_choose_tac(t1404, x1405))
  let t1402 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty())]))
  let t1403 = @list.List([@meson.asm_meson_tac(@list.List([@convex.relative_interior_eq_empty(), @polytope.face_of_imp_convex()])), t1402])
  let t1471 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("!(relative_interior((f : (Cart[Real, N]) -> Bool)) == {})"), fn(x1399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1400 = @tactics.mp_tac(x1399)
    fn(x1401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1400(x1401)
    }
  }), t1403), t1406), t1407), t1408), t1409), @tactics.disch_tac), t1416), t1417), t1424), t1428), t1429), t1430), t1431), t1432), t1439), t1440), t1441), t1442), t1443), t1450), t1451), t1458), t1459), t1469), t1470), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1398 = @tactics.subgoal_then(@term_syntax.parse_term("∀ h : (Cart[Real, N]) -> Bool, IN(h, (J : ((Cart[Real, N]) -> Bool) -> Bool)) → IN(h, (H : ((Cart[Real, N]) -> Bool) -> Bool)) && (ga : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])(h) == (fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])(h)"), fn(x1395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1396 = @tactics.assume_tac(x1395)
    fn(x1397 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1396(x1397)
    }
  })
  let t1393 = @tactics.then_tac(@tactics.disch_tac, @simp.asm_rewrite_tac(@list.List([])))
  let t1389 = @meson.asm_meson_tac(@list.List([@vectors.vector_neg_eq_0(), @sets.subset()]))
  let t1390 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([])), t1389)
  let t1391 = @meson.asm_meson_tac(@list.List([]))
  let t1392 = @list.List([@meson.asm_meson_tac(@list.List([@sets.has_size()])), t1391, t1390])
  let t1394 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t1392), t1393])
  let t1388 = @simp.asm_rewrite_tac(@list.List([]))
  let t1384 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool) => real_of_num(0)")
  let t1385 = @term_syntax.parse_term("(ga : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])")
  let t1386 = @term_syntax.parse_term("(J : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t1387 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool)"), t1386, t1385, t1384]), @polytope.relative_interior_polyhedron_explicit()))
  let t1383 = @tactics.x_gen_tac(@term_syntax.parse_term("(ga : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])"))
  let t1382 = @simp.rewrite_tac(@list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]))
  let t1381 = @simp.gen_rewrite_tac(fn(x1380 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1374 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1375 = @equal.land_conv(x1374)
      fn(x1376 : @kernel.Term) -> @kernel.Thm raise {
        s1375(x1376)
      }
    })((fn(x1377 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1378 = @equal.once_depth_conv(x1377)
      fn(x1379 : @kernel.Term) -> @kernel.Thm raise {
        s1378(x1379)
      }
    })(x1380))
  }, @list.List([@class.right_imp_exists_thm()]))
  let t1370 = @meson.asm_meson_tac(@list.List([]))
  let t1369 = @simp.rewrite_tac(@list.List([]))
  let t1371 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("-(fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])((h : (Cart[Real, N]) -> Bool))")), t1369), @tactics.disj2_tac), t1370)
  let t1368 = @simp.asm_simp_tac(@list.List([]))
  let t1372 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])((h : (Cart[Real, N]) -> Bool))")), t1368), t1371])
  let t1367 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"))
  let t1366 = @simp.rewrite_tac(@list.List([@sets.in_union(), @class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))")), @theorems.forall_and_thm(), @sets.forall_in_image()]))
  let t1364 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1365 = @tactics.spec_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)"), t1364)
  let t1363 = @tactics.undisch_then(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), (J : ((Cart[Real, N]) -> Bool) -> Bool))"), fn(x1362 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1360 = @simp.expand_tac("H'")
  let t1361 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t1360])
  let t1359 = @tactics.subgoal_then(@term_syntax.parse_term("IN((h : (Cart[Real, N]) -> Bool), UNION((H : ((Cart[Real, N]) -> Bool) -> Bool), (H' : ((Cart[Real, N]) -> Bool) -> Bool)))"), fn(x1356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1357 = @tactics.mp_tac(x1356)
    fn(x1358 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1357(x1358)
    }
  })
  let t1373 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")), @tactics.disch_tac), t1359), t1361), t1363), t1365), t1366), @tactics.conj_tac), t1367), @tactics.disch_tac), t1372), @tactics.all_tac])
  let t1355 = @tactics.subgoal_then(@term_syntax.parse_term("∀ h : (Cart[Real, N]) -> Bool, IN(h, (J : ((Cart[Real, N]) -> Bool) -> Bool)) → (∃ a : Cart[Real, N], {(x : Cart[Real, N]) | dot(a, x) <= real_of_num(0)} == h && (IN(h, (H : ((Cart[Real, N]) -> Bool) -> Bool)) && a == (fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])(h) || (∃ h' : (Cart[Real, N]) -> Bool, IN(h', H) && a == -fa(h'))))"), fn(x1352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1353 = @tactics.mp_tac(x1352)
    fn(x1354 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1353(x1354)
    }
  })
  let t1350 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1349 = @tactics.first_x_assum(fn(x1344 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x1344
    @simp.gen_rewrite_tac(fn(x1346 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1347 = @equal.land_conv(x1346)
      fn(x1348 : @kernel.Term) -> @kernel.Thm raise {
        s1347(x1348)
      }
    }, @list.List([th_3]))
  })
  let t1343 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → !(s == t) → PSUBSET(s, t)")))
  let t1342 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1341 = @list.List([@meson.asm_meson_tac(@list.List([@sets.psubset(), @sets.finite_subset(), @sets.has_size()])), @tactics.all_tac])
  let t1340 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(a : Bool) && (b : Bool) && (!(c : Bool) → (d : Bool)) → !(a && b && c) → d")))
  let t1336 = @term_syntax.parse_term("(J' : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t1339 = @tactics.disch_then(fn(x1338 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1333 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1334 = @tactics.mp_tac(x1333)
      fn(x1335 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1334(x1335)
      }
    })(((x1337 : @kernel.Thm) => @bool.spec(t1336, x1337))(x1338))
  })
  let t1332 = @simp.rewrite_tac(@list.List([@class.not_exists_thm(), @sets.has_size()]))
  let t1331 = @list.List([@meson.asm_meson_tac(@list.List([@sets.card_psubset(), @sets.has_size()])), @tactics.all_tac])
  let t1327 = @term_syntax.parse_term("CARD((J' : ((Cart[Real, N]) -> Bool) -> Bool))")
  let t1330 = @tactics.first_x_assum(fn(x1329 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1325 = @tactics.mp_tac(x1324)
      fn(x1326 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1325(x1326)
      }
    })(((x1328 : @kernel.Thm) => @bool.spec(t1327, x1328))(x1329))
  })
  let t1351 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1330), @tactics.ants_tac), t1331), t1332), t1339), t1340), @tactics.conj_tac), t1341), @tactics.conj_tac), t1342), t1343), t1349), t1350), @tactics.all_tac])
  let t1323 = @tactics.subgoal_then(@term_syntax.parse_term("∀ J' : ((Cart[Real, N]) -> Bool) -> Bool, PSUBSET(J', (J : ((Cart[Real, N]) -> Bool) -> Bool)) → PSUBSET((f : (Cart[Real, N]) -> Bool), INTER(hull(affine, f), INTERS(J')))"), fn(x1320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1321 = @tactics.assume_tac(x1320)
    fn(x1322 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1321(x1322)
    }
  })
  let t1319 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(J : ((Cart[Real, N]) -> Bool) -> Bool)"))(@tactics.strip_assume_tac))
  let t1317 = @tactics.conjuncts_then2(fn(x1311 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1312 = @tactics.mp_tac(x1311)
    fn(x1313 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1312(x1313)
    }
  }, fn(x1314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1315 = @tactics.assume_tac(x1314)
    fn(x1316 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1315(x1316)
    }
  })
  let t1318 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(nn : Num)"))(t1317))
  let t1310 = @simp.gen_rewrite_tac(fn(x1307 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1308 = @equal.land_conv(x1307)
    fn(x1309 : @kernel.Term) -> @kernel.Thm raise {
      s1308(x1309)
    }
  }, @list.List([@arith.num_wop()]))
  let t1306 = @simp.gen_rewrite_tac(fn(x1303 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1304 = @equal.land_conv(x1303)
    fn(x1305 : @kernel.Term) -> @kernel.Thm raise {
      s1304(x1305)
    }
  }, @list.List([@meson.meson(@list.List([@sets.has_size()]), @term_syntax.parse_term("(∃ f : (_) -> Bool, FINITE(f) && (P : ((_) -> Bool) -> Bool)(f)) == (∃ n : Num, ∃ f : (_) -> Bool, HAS_SIZE(f, n) && P(f))"))]))
  let t1298 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1297 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(-(x : Real) <= real_of_num(0)) == (real_of_num(0) <= x)"))]))
  let t1296 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.dot_lneg()]))
  let t1295 = @simp.rewrite_tac(@list.List([@sets.forall_in_image(), @sets.forall_in_gspec()]))
  let t1294 = @simp.rewrite_tac(@list.List([@sets.in_inters()]))
  let t1293 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t1291 = @simp.asm_simp_tac(@list.List([]))
  let t1292 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.ap_term_tac, @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (f : (_) -> _)(x) == x) → {f((x : _)) | IN(x, s)} == s")))), t1291), @tactics.all_tac])
  let t1290 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == (s' : (_) -> Bool) && (∀ x : _, IN(x, s) → IN(x, (t : (_) -> Bool)) == IN(x, (t' : (_) -> Bool))) → INTER(s, t) == INTER(s', t')")))
  let t1289 = @simp.rewrite_tac(@list.List([@sets.inters_union()]))
  let t1288 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_le_antisym())]))
  let t1287 = @tactics.first_x_assum(fn(x1282 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1282
    @simp.gen_rewrite_tac(fn(x1284 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1285 = @equal.land_conv(x1284)
      fn(x1286 : @kernel.Term) -> @kernel.Thm raise {
        s1285(x1286)
      }
    }, @list.List([th_2]))
  })
  let t1281 = @simp.rewrite_tac(@list.List([@misc.hull_subset()]))
  let t1299 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (f : (_) -> Bool)) && s == (t : (_) -> Bool) → s == INTER(f, t)"))), t1281), t1287), t1288), t1289), t1290), @tactics.conj_tac), t1292), t1293), t1294), t1295), t1296), t1297), t1298)
  let t1280 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1300 = @tactics.then_tac(@simp.expand_tac("H'"), t1280)
  let t1279 = @meson.asm_meson_tac(@list.List([@sets.finite_subset()]))
  let t1278 = @tactics.match_mp_tac(@sets.finite_image())
  let t1301 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.finite_union()])), t1278), t1279), t1300, t1299])
  let t1277 = @tactics.repeat_tac(@tactics.conj_tac)
  let t1276 = @tactics.exists_tac(@term_syntax.parse_term("UNION((H : ((Cart[Real, N]) -> Bool) -> Bool), IMAGE((h : (Cart[Real, N]) -> Bool) => {(x : Cart[Real, N]) | dot(-(fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])(h), x) <= real_of_num(0)}, (J : ((Cart[Real, N]) -> Bool) -> Bool)))"))
  let t1302 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(J : ((Cart[Real, N]) -> Bool) -> Bool)"))(@tactics.strip_assume_tac)), t1276), t1277), t1301), @tactics.all_tac])
  let t1275 = @tactics.subgoal_then(@term_syntax.parse_term("∃ J : ((Cart[Real, N]) -> Bool) -> Bool, FINITE(J) && SUBSET(J, UNION((H : ((Cart[Real, N]) -> Bool) -> Bool), (H' : ((Cart[Real, N]) -> Bool) -> Bool))) && (f : (Cart[Real, N]) -> Bool) == INTER(hull(affine, f), INTERS(J))"), fn(x1272 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1273 = @tactics.mp_tac(x1272)
    fn(x1274 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1273(x1274)
    }
  })
  let t1271 = @simp.abbrev_tac(@term_syntax.parse_term("(H' : ((Cart[Real, N]) -> Bool) -> Bool) == IMAGE((h : (Cart[Real, N]) -> Bool) => {(x : Cart[Real, N]) | dot(-(fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])(h), x) <= real_of_num(0)}, (H : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t1269 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1268 = @simp.asm_rewrite_tac(@list.List([]))
  let t1267 = @class.asm_cases_tac(@term_syntax.parse_term("IN((y : Cart[Real, N]), (s : (Cart[Real, N]) -> Bool))"))
  let t1266 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec(), @sets.in_inter()]))
  let t1265 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @sets.in_inters()]))
  let t1264 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, N])"))
  let t1263 = @simp.gen_rewrite_tac(fn(x1262 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1262
  }, @list.List([@sets.extension()]))
  let t1261 = @simp.asm_rewrite_tac(@list.List([]))
  let t1260 = @tactics.disch_then(fn(x1255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1255
    @simp.gen_rewrite_tac(fn(x1257 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1258 = @equal.land_conv(x1257)
      fn(x1259 : @kernel.Term) -> @kernel.Thm raise {
        s1258(x1259)
      }
    }, @list.List([th_1]))
  })
  let t1253 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t1250 = @drule.match_mp(@polytope.face_of_imp_subset())
  let t1252 = @tactics.first_assum(fn(x1251 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1247 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1248 = @tactics.mp_tac(x1247)
      fn(x1249 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1248(x1249)
      }
    })(t1250(x1251))
  })
  let t1246 = @simp.asm_rewrite_tac(@list.List([@sets.image_clauses(), @sets.inters_0()]))
  let t1254 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@sets.simple_image_gen()])), t1246), t1252), t1253), @tactics.all_tac])
  let t1245 = @class.asm_cases_tac(@term_syntax.parse_term("{(h : (Cart[Real, N]) -> Bool) | IN(h, (H : ((Cart[Real, N]) -> Bool) -> Bool)) && SUBSET((f : (Cart[Real, N]) -> Bool), INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | dot((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])(h), x) == real_of_num(0)}))} == {}"))
  let t1243 = @simp.asm_simp_tac(@list.List([]))
  let t1242 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (f : (_) -> _)(x) == x) → {f((x : _)) | IN(x, s)} == s")))
  let t1244 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("s"), @tactics.ap_term_tac), t1242), t1243), @tactics.all_tac])
  let t1241 = @tactics.subgoal_then(@term_syntax.parse_term("INTERS({{(x : Cart[Real, N]) | dot((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])((h : (Cart[Real, N]) -> Bool)), x) <= real_of_num(0)} | IN(h, (H : ((Cart[Real, N]) -> Bool) -> Bool))}) == (s : (Cart[Real, N]) -> Bool)"), fn(x1238 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1239 = @tactics.assume_tac(x1238)
    fn(x1240 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1239(x1240)
    }
  })
  let t1237 = @simp.asm_rewrite_tac(@list.List([]))
  let t1233 = @term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool)")
  let t1236 = @tactics.disch_then(fn(x1235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1230 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1231 = @tactics.mp_tac(x1230)
      fn(x1232 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1231(x1232)
      }
    })(((x1234 : @kernel.Thm) => @bool.spec(t1233, x1234))(x1235))
  })
  let t1229 = @simp.asm_simp_tac(@list.List([@sets.inter_univ()]))
  let t1225 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool) => real_of_num(0)")
  let t1226 = @term_syntax.parse_term("(fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])")
  let t1227 = @term_syntax.parse_term("(H : ((Cart[Real, N]) -> Bool) -> Bool)")
  let t1228 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t1227, t1226, t1225]), @polytope.face_of_polyhedron_explicit()))
  let t1224 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t1223 = @tactics.exists_tac(@term_syntax.parse_term("{(h : (Cart[Real, N]) -> Bool) | IN(h, (H : ((Cart[Real, N]) -> Bool) -> Bool)) && SUBSET((f : (Cart[Real, N]) -> Bool), INTER((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | dot((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])(h), x) == real_of_num(0)}))}"))
  let t1221 = @simp.asm_simp_tac(@list.List([]))
  let t1220 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (f : (_) -> _)(x) == x) → s == {f((x : _)) | IN(x, s)}")))
  let t1219 = @simp.rewrite_tac(@list.List([@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("INTERS((H : ((Cart[Real, N]) -> Bool) -> Bool)) == (s : (Cart[Real, N]) -> Bool)")))]))
  let t1218 = @simp.asm_rewrite_tac(@list.List([]))
  let t1217 = @simp.rewrite_tac(@list.List([@sets.empty_subset(), @sets.not_in_empty(), @sets.inters_0(), @sets.inter_univ(), @sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)(x) | x : _ | false} == {}"))]))
  let t1222 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("({} : ((Cart[Real, N]) -> Bool) -> Bool)")), t1217), t1218), t1219), @tactics.ap_term_tac), t1220), t1221), @tactics.all_tac])
  let t1270 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@class.asm_cases_tac(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool) == (s : (Cart[Real, N]) -> Bool)")), t1222), t1223), @tactics.conj_tac), t1224), t1228), t1229), t1236), t1237), t1241), t1244), t1245), t1254), t1260), t1261), t1263), t1264), t1265), t1266), t1267), t1268), t1269), @tactics.all_tac])
  let t1216 = @tactics.subgoal_then(@term_syntax.parse_term("∃ J : ((Cart[Real, N]) -> Bool) -> Bool, SUBSET(J, (H : ((Cart[Real, N]) -> Bool) -> Bool)) && (f : (Cart[Real, N]) -> Bool) == INTER(INTERS({{(x : Cart[Real, N]) | dot((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])((h : (Cart[Real, N]) -> Bool)), x) <= real_of_num(0)} | IN(h, H)}), INTERS({{(x : Cart[Real, N]) | dot(fa((h : (Cart[Real, N]) -> Bool)), x) == real_of_num(0)} | IN(h, J)}))"), fn(x1213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1214 = @tactics.assume_tac(x1213)
    fn(x1215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1214(x1215)
    }
  })
  let t1212 = @list.List([@simp.asm_rewrite_tac(@list.List([@equal.gsym(@convex.aff_dim_pos_le()), @int.int_pos()])), @tactics.all_tac])
  let t1211 = @tactics.subgoal_then(@term_syntax.parse_term("!((f : (Cart[Real, N]) -> Bool) == {})"), fn(x1208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1209 = @tactics.assume_tac(x1208)
    fn(x1210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1209(x1210)
    }
  })
  let t1206 = @meson.asm_meson_tac(@list.List([@convex.relative_interior_subset(), @sets.subset_trans(), @polytope.face_of_imp_subset()]))
  let t1205 = @simp.asm_rewrite_tac(@list.List([@convex.aff_dim_affine_hull()]))
  let t1204 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@convex.affine_hull_closure())]))
  let t1207 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@convex.aff_dim_affine_hull())])), t1204), t1205), t1206)])
  let t1203 = @simp.asm_rewrite_tac(@list.List([]))
  let t1199 = @meson.asm_meson_tac(@list.List([@polytope.polyhedron_imp_closed(), @polytope.polyhedron_imp_convex()]))
  let t1198 = @tactics.match_mp_tac(@polytope.face_of_imp_closed())
  let t1200 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.closure_eq()])), t1198), t1199)
  let t1197 = @meson.asm_meson_tac(@list.List([@polytope.face_of_imp_convex()]))
  let t1201 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@convex.convex_closure_relative_interior()), t1197), t1200])
  let t1196 = @tactics.exists_tac(@term_syntax.parse_term("closure((f : (Cart[Real, N]) -> Bool))"))
  let t1202 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t1196), @tactics.conj_tac), t1201), @tactics.all_tac])
  let t1195 = @tactics.subgoal_then(@term_syntax.parse_term("closure(relative_interior((f : (Cart[Real, N]) -> Bool))) == f"), fn(x1192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1193 = @tactics.assume_tac(x1192)
    fn(x1194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1193(x1194)
    }
  })
  let t1987 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool)")), @tactics.strip_tac), t1195), t1202), t1203), @tactics.conj_tac), t1207), t1211), t1212), t1216), t1270), t1271), t1275), t1302), t1306), t1310), t1318), t1319), t1323), t1351), t1355), t1373), t1381), t1382), t1383), @tactics.disch_tac), t1387), t1388), @tactics.ants_tac), t1394), t1398), t1471), t1478), t1482), t1489), t1504), t1505), t1506), @tactics.disch_tac), t1510), t1511), t1515), t1532), t1536), t1649), t1650), t1651), t1652), t1653), t1657), t1658), t1659), t1660), t1664), t1672), t1673), t1674), t1675), t1676), t1677), t1678), t1680), t1681), t1986])
  let t1191 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1190 = @tactics.exists_tac(@term_syntax.parse_term("(closure : ((Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)"))
  let t1189 = @tactics.exists_tac(@term_syntax.parse_term("(relative_interior : ((Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)"))
  let t1188 = @simp.asm_simp_tac(@list.List([finite_restrict_hyperplane_cells()]))
  let t1187 = @tactics.match_mp_tac(@sets.bijections_card_eq())
  let t1186 = @simp.rewrite_tac(@list.List([]))
  let t1185 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t1184 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t1988 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([euler_characteristic_v1()])), t1184), t1185), @tactics.strip_tac), t1186), @tactics.ap_term_tac), @tactics.ap_term_tac), t1187), t1188), t1189), t1190), t1191), @tactics.conj_tac), t1987), @tactics.all_tac])
  let t1183 = @tactics.exists_tac(@term_syntax.parse_term("euler_characteristic((A : ((Cart[Real, N], Real)) -> Bool), (s : (Cart[Real, N]) -> Bool))"))
  let t1182 = @tactics.match_mp_tac(@theorems.eq_trans())
  let t1180 = @simp.asm_simp_tac(@list.List([]))
  let t1179 = @tactics.match_mp_tac(@sets.finite_image())
  let t1181 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("A"), t1179), t1180), @tactics.all_tac])
  let t1178 = @tactics.subgoal_then(@term_syntax.parse_term("FINITE((A : ((Cart[Real, N], Real)) -> Bool))"), fn(x1175 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1176 = @tactics.assume_tac(x1175)
    fn(x1177 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1176(x1177)
    }
  })
  let t1174 = @simp.abbrev_tac(@term_syntax.parse_term("(A : ((Cart[Real, N], Real)) -> Bool) == IMAGE((h : (Cart[Real, N]) -> Bool) => ((fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])(h), real_of_num(0)), (H : ((Cart[Real, N]) -> Bool) -> Bool))"))
  let t1173 = @simp.gen_rewrite_tac(fn(x1172 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1167 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x1161 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1162 = @equal.land_conv(x1161)
        fn(x1163 : @kernel.Term) -> @kernel.Thm raise {
          s1162(x1163)
        }
      })((fn(x1164 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s1165 = @equal.binder_conv(x1164)
        fn(x1166 : @kernel.Term) -> @kernel.Thm raise {
          s1165(x1166)
        }
      })(x1167))
    })(((x1171 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(2, fn(x1168 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1169 = @equal.rand_conv(x1168)
      fn(x1170 : @kernel.Term) -> @kernel.Thm raise {
        s1169(x1170)
      }
    }, x1171))(x1172))
  }, @list.List([@theorems.eq_sym_eq()]))
  let t1160 = @tactics.x_gen_tac(@term_syntax.parse_term("(fa : ((Cart[Real, N]) -> Bool) -> Cart[Real, N])"))
  let t1159 = @simp.rewrite_tac(@list.List([@class.skolem_thm(), @theorems.left_imp_exists_thm()]))
  let t1158 = @simp.gen_rewrite_tac(fn(x1157 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1151 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1152 = @equal.land_conv(x1151)
      fn(x1153 : @kernel.Term) -> @kernel.Thm raise {
        s1152(x1153)
      }
    })((fn(x1154 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1155 = @equal.once_depth_conv(x1154)
      fn(x1156 : @kernel.Term) -> @kernel.Thm raise {
        s1155(x1156)
      }
    })(x1157))
  }, @list.List([@class.right_imp_exists_thm()]))
  let t1146 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1149 = @tactics.first_x_assum(fn(x1148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x1147 : @kernel.Thm) => @bool.spec(t1146, x1147))(x1148))
  })
  let t1140 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.dot_rzero()]))
  let t1139 = @simp.asm_rewrite_tac(@list.List([]))
  let t1135 = @term_syntax.parse_term("(k : (Cart[Real, N]) -> Bool)")
  let t1138 = @tactics.disch_then(fn(x1137 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1132 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1133 = @tactics.mp_tac(x1132)
      fn(x1134 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1133(x1134)
      }
    })(((x1136 : @kernel.Thm) => @bool.spec(t1135, x1136))(x1137))
  })
  let t1130 = @simp.rewrite_tac(@list.List([@sets.in_inters()]))
  let t1131 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t1130])
  let t1129 = @tactics.subgoal_then(@term_syntax.parse_term("IN(vec(0), INTERS((H : ((Cart[Real, N]) -> Bool) -> Bool)))"), fn(x1126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1127 = @tactics.mp_tac(x1126)
    fn(x1128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1127(x1128)
    }
  })
  let t1125 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_lt_imp_le(), @realarith.real_sub_le()]))
  let t1124 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((e : Real) * (x : Real) <= x) == (real_of_num(0) <= x * (real_of_num(1) - e))"))]))
  let t1123 = @simp.rewrite_tac(@list.List([@vectors.dot_rmul(), @equal.gsym(@calc_int.real_mul_rneg())]))
  let t1122 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (x : Real) → (y : Real) <= x) && (real_of_num(0) <= -x → real_of_num(0) <= -y) && real_of_num(0) <= (b : Real) → x <= b → y <= b")))
  let t1121 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1119 = @term_syntax.parse_term("(b' : Real)")
  let t1120 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a' : Cart[Real, N])"), t1119]))
  let t1118 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t1114 = @term_syntax.parse_term("(k : (Cart[Real, N]) -> Bool)")
  let t1117 = @tactics.first_x_assum(fn(x1116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1112 = @tactics.mp_tac(x1111)
      fn(x1113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1112(x1113)
      }
    })(((x1115 : @kernel.Thm) => @bool.spec(t1114, x1115))(x1116))
  })
  let t1110 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t1109 = @tactics.disch_then(fn(x1107 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1107
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t1106 = @simp.rewrite_tac(@list.List([@sets.in_delete()]))
  let t1105 = @tactics.x_gen_tac(@term_syntax.parse_term("(k : (Cart[Real, N]) -> Bool)"))
  let t1104 = @tactics.match_mp_tac(@theorems.mono_forall())
  let t1103 = @simp.rewrite_tac(@list.List([@sets.in_inters()]))
  let t1102 = @tactics.undisch_tac(@term_syntax.parse_term("IN((x : Cart[Real, N]), INTERS(DELETE((H : ((Cart[Real, N]) -> Bool) -> Bool), (h : (Cart[Real, N]) -> Bool))))"))
  let t1101 = @list.List([@simp.asm_rewrite_tac(@list.List([])), @tactics.all_tac])
  let t1100 = @simp.rewrite_tac(@list.List([@sets.inters_insert(), @sets.in_inter()]))
  let t1099 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1098 = @tactics.subgoal_then(@term_syntax.parse_term("(H : ((Cart[Real, N]) -> Bool) -> Bool) == INSERT((h : (Cart[Real, N]) -> Bool), DELETE(H, h))"), fn(x1095 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1096 = @tactics.subst1_tac(x1095)
    fn(x1097 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1096(x1097)
    }
  })
  let t1094 = @simp.expand_tac("s")
  let t1093 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @real.real_le_inv_eq()]))
  let t1092 = @tactics.first_assum(@tactics.match_mp_tac)
  let t1091 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@convex.conic()])))
  let t1090 = @list.List([@simp.asm_simp_tac(@list.List([@vectors.vector_mul_assoc(), @realax.real_mul_linv(), @real.real_lt_imp_nz(), @vectors.vector_mul_lid()])), @tactics.all_tac])
  let t1089 = @tactics.subgoal_then(@term_syntax.parse_term("(x : Cart[Real, N]) == op_pct(inv((e : Real)), op_pct(e, x))"), fn(x1086 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1087 = @tactics.subst1_tac(x1086)
    fn(x1088 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1087(x1088)
    }
  })
  let t1085 = @simp.rewrite_tac(@list.List([]))
  let t1141 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!IN((x : Cart[Real, N]), (s : (Cart[Real, N]) -> Bool))")), t1085), t1089), t1090), t1091), t1092), t1093), t1094), t1098), t1099), t1100), @tactics.conj_tac), t1101), t1102), t1103), t1104), t1105), t1106), t1109), @tactics.ants_tac), t1110), t1117), t1118), t1120), @tactics.strip_tac), t1121), t1122), t1123), t1124), t1125), t1129), t1131), t1138), t1139), t1140)
  let t1082 = @simp.asm_simp_tac(@list.List([@equal.gsym(@real.real_le_rdiv_eq())]))
  let t1081 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1083 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_lt_min(), @real.real_lt_div(), @real.real_min_lt()])), t1081), t1082), @calc_rat.real_arith_tac)
  let t1080 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t1079 = @simp.rewrite_tac(@list.List([@sets.inters_insert(), @sets.in_inter()]))
  let t1078 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t1077 = @tactics.subgoal_then(@term_syntax.parse_term("(H : ((Cart[Real, N]) -> Bool) -> Bool) == INSERT((h : (Cart[Real, N]) -> Bool), DELETE(H, h))"), fn(x1074 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1075 = @tactics.subst1_tac(x1074)
    fn(x1076 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1075(x1076)
    }
  })
  let t1073 = @simp.rewrite_tac(@list.List([@realarith.real_not_lt()]))
  let t1072 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t1071 = @simp.expand_tac("s")
  let t1070 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((x : Cart[Real, N]), (s : (Cart[Real, N]) -> Bool))"))
  let t1069 = @simp.asm_rewrite_tac(@list.List([]))
  let t1068 = @tactics.exists_tac(@term_syntax.parse_term("(b : Real)"))
  let t1084 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realarith.real_lt_trans()), t1068), t1069), t1070), t1071), t1072), t1073), @tactics.disch_tac), t1077), t1078), t1079), t1080), t1083])
  let t1067 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < dot((a : Cart[Real, N]), (x : Cart[Real, N]))"), fn(x1064 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1065 = @tactics.assume_tac(x1064)
    fn(x1066 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1065(x1066)
    }
  })
  let t1063 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.dot_rmul()]))
  let t1142 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("min(real_of_num(1) / real_of_num(2), (b : Real) / dot((a : Cart[Real, N]), (x : Cart[Real, N])))")), t1063), t1067), t1084), t1141])
  let t1062 = @tactics.subgoal_then(@term_syntax.parse_term("∃ e : Real, real_of_num(0) < e && e < real_of_num(1) && IN(op_pct(e, (x : Cart[Real, N])), (h : (Cart[Real, N]) -> Bool))"), @tactics.strip_assume_tac)
  let t1059 = @tactics.x_choose_then(@term_syntax.parse_term("(x : Cart[Real, N])"))(@tactics.strip_assume_tac)
  let t1061 = @tactics.disch_then(fn(x1060 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t1059(@bool.conjunct2(x1060))
  })
  let t1057 = @simp.rewrite_tac(@list.List([@sets.psubset_alt()]))
  let t1058 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t1057])
  let t1054 = @term_syntax.parse_term("DELETE((H : ((Cart[Real, N]) -> Bool) -> Bool), (h : (Cart[Real, N]) -> Bool))")
  let t1143 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.first_x_assum(fn(x1056 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1051 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1052 = @tactics.mp_tac(x1051)
      fn(x1053 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1052(x1053)
      }
    })(((x1055 : @kernel.Thm) => @bool.spec(t1054, x1055))(x1056))
  })), @tactics.ants_tac), t1058), t1061), t1062), t1142)
  let t1050 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.dot_rzero()]))
  let t1049 = @simp.asm_rewrite_tac(@list.List([]))
  let t1045 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1048 = @tactics.disch_then(fn(x1047 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1042 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1043 = @tactics.mp_tac(x1042)
      fn(x1044 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1043(x1044)
      }
    })(((x1046 : @kernel.Thm) => @bool.spec(t1045, x1046))(x1047))
  })
  let t1040 = @simp.rewrite_tac(@list.List([@sets.in_inters()]))
  let t1041 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), t1040])
  let t1144 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("IN(vec(0), INTERS((H : ((Cart[Real, N]) -> Bool) -> Bool)))"), fn(x1037 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1038 = @tactics.mp_tac(x1037)
    fn(x1039 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1038(x1039)
    }
  }), t1041), t1048), t1049), t1050), t1143])
  let t1036 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (b : Real) && !(real_of_num(0) < b) → b == real_of_num(0)")))
  let t1035 = @list.List([@tactics.all_tac, @simp.asm_rewrite_tac(@list.List([]))])
  let t1034 = @tactics.subgoal_then(@term_syntax.parse_term("(b : Real) == real_of_num(0)"), fn(x1031 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1032 = @tactics.subst_all_tac(x1031)
    fn(x1033 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1032(x1033)
    }
  })
  let t1030 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(b : Real)"))(@tactics.strip_assume_tac))
  let t1029 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, N])"))
  let t1027 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1028 = @list.List([@simp.asm_rewrite_tac(@list.List([])), t1027])
  let t1023 = @term_syntax.parse_term("(h : (Cart[Real, N]) -> Bool)")
  let t1026 = @tactics.first_assum(fn(x1025 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1020 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1021 = @tactics.mp_tac(x1020)
      fn(x1022 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1021(x1022)
      }
    })(((x1024 : @kernel.Thm) => @bool.spec(t1023, x1024))(x1025))
  })
  let t1150 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1026), @tactics.ants_tac), t1028), t1029), t1030), t1034), t1035), t1036), @tactics.conj_tac), t1144), t1149])
  let t1019 = @tactics.subgoal_then(@term_syntax.parse_term("∀ h : (Cart[Real, N]) -> Bool, IN(h, (H : ((Cart[Real, N]) -> Bool) -> Bool)) → (∃ a : Cart[Real, N], !(a == vec(0)) && h == {(x : Cart[Real, N]) | dot(a, x) <= real_of_num(0)})"), fn(x1016 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1017 = @tactics.mp_tac(x1016)
    fn(x1018 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1017(x1018)
    }
  })
  let t1014 = @meson.asm_meson_tac(@list.List([@sets.subset_empty(), @topology.interior_subset()]))
  let t1015 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@convex.conic_contains_0()])), t1014), @tactics.all_tac])
  let t1013 = @tactics.subgoal_then(@term_syntax.parse_term("IN(vec(0), (s : (Cart[Real, N]) -> Bool))"), fn(x1010 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1011 = @tactics.assume_tac(x1010)
    fn(x1012 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1011(x1012)
    }
  })
  let t1009 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1008 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1005 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1006 = @tactics.assume_tac(x1005)
      fn(x1007 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1006(x1007)
      }
    })(@equal.sym(x1008))
  }, @tactics.strip_assume_tac))
  let t1004 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x998 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s999 = @tactics.assume_tac(x998)
    fn(x1000 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s999(x1000)
    }
  }, fn(x1001 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1002 = @tactics.mp_tac(x1001)
    fn(x1003 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1002(x1003)
    }
  }))
  let t997 = @tactics.x_gen_tac(@term_syntax.parse_term("(H : ((Cart[Real, N]) -> Bool) -> Bool)"))
  let t996 = @simp.asm_rewrite_tac(@list.List([@sets.inter_univ(), @theorems.left_imp_exists_thm()]))
  let t993 = @simp.gen_rewrite_rule(fn(x992 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x992
  }, @list.List([@polytope.polyhedron_inter_affine_minimal()]))
  let t995 = @tactics.first_assum(fn(x994 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x989 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s990 = @tactics.mp_tac(x989)
      fn(x991 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s990(x991)
      }
    })(t993(x994))
  })
  let t987 = @simp.asm_rewrite_tac(@list.List([@topology.open_interior()]))
  let t986 = @tactics.match_mp_tac(@convex.affine_hull_open())
  let t985 = @simp.simp_tac(@list.List([@topology.interior_subset(), @misc.hull_mono()]))
  let t984 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, interior((s : (Cart[Real, N]) -> Bool)))"))
  let t988 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ s : (_) -> Bool, s == UNIV && SUBSET(s, (t : (_) -> Bool)) → t == UNIV"))), t984), t985), t986), t987), @tactics.all_tac])
  let t983 = @tactics.subgoal_then(@term_syntax.parse_term("hull(affine, (s : (Cart[Real, N]) -> Bool)) == UNIV"), fn(x980 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s981 = @tactics.assume_tac(x980)
    fn(x982 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s981(x982)
    }
  })
  let t2319 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t983), t988), t995), t996), t997), t1004), t1009), t1013), t1015), t1019), t1150), t1158), t1159), t1160), t1173), @tactics.disch_tac), t1174), t1178), t1181), t1182), t1183), @tactics.conj_tac), t1988), t1992), t2020), t2024), t2025), t2029), t2032), t2035), t2036), @tactics.ants_tac), t2038), t2039), t2040), t2041), @tactics.conj_tac), t2052), fn(x2062 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2061 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2059 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2058 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x2053 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s2054 = @tactics.mp_tac(x2053)
            fn(x2055 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s2054(x2055)
            }
          })(t2057(x2058))
        })(@equal.lhand(x2059))
      })((fn(x2060 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2060.1
      })(x2061))
    })(x2062)(x2062)
  }), @tactics.ants_tac), t2069), t2070), t2071), @tactics.conj_tac), t2215), t2216), t2217), t2221), @tactics.ants_tac), t2249), t2250), t2251), @tactics.conj_tac), t2300), t2303), t2304), t2305), t2306), t2307), t2308), t2309), t2310), @class.cond_cases_tac), t2311), t2312), t2313), t2317), t2318)
  euler_polyhedral_cone_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Cart[Real, N]) -> Bool, (polyhedron : ((Cart[Real, N]) -> Bool) -> Bool)(s) && (conic : ((Cart[Real, N]) -> Bool) -> Bool)(s) && !((interior : ((Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)(s) == ({} : (Cart[Real, N]) -> Bool)) && !(s == (UNIV : (Cart[Real, N]) -> Bool)) → (sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(0, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))), (d : Num) => pow(-real_of_num(1), d) * real_of_num((CARD : (((Cart[Real, N]) -> Bool) -> Bool) -> Num)({(f : (Cart[Real, N]) -> Bool) | (face_of : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(f, s) && (aff_dim : ((Cart[Real, N]) -> Bool) -> Int)(f) == int_of_num(d)}))) == real_of_num(0)"), t2319))
}

///|
let euler_polyhedral_cone_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_POLYHEDRAL_CONE")

///|
/// `EULER_POLYHEDRAL_CONE`
pub fn euler_polyhedral_cone() -> @kernel.Thm {
  euler_polyhedral_cone_c.get()
}

///|
/// EULER_POINCARE_LEMMA
fn step_56() -> Unit raise {
  let t3069 = @simp.asm_simp_tac(@list.List([@convex.affine_affine_hull(), @misc.hull_inc(), @sets.in_insert()]))
  let t3068 = @tactics.match_mp_tac(@convex.in_affine_add_mul_diff())
  let t3067 = @simp.once_rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((c : Real), (x : Cart[Real, N])) == vec(0) + op_pct(c, x - vec(0))"))]))
  let t3065 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t3066 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c : Real)"), t3065]))
  let t3064 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t3063 = @simp.rewrite_tac(@list.List([@convex.affine_affine_hull(), @sets.subset(), @convex.conic_hull_explicit()]))
  let t3062 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t3061 = @tactics.match_mp_tac(@convex.aff_dim_subset())
  let t3060 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@convex.aff_dim_affine_hull())]))
  let t3059 = @list.List([@tactics.all_tac, @tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.aff_dim_insert(), @convex.aff_dim_affine_hull()])), @int.int_arith_tac)])
  let t3058 = @tactics.exists_tac(@term_syntax.parse_term("aff_dim(INSERT(vec(0), hull(affine, (f : (Cart[Real, N]) -> Bool))))"))
  let t3070 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@int.int_le_trans()), t3058), @tactics.conj_tac), t3059), t3060), t3061), t3062), t3063), t3064), t3066), @tactics.strip_tac), t3067), t3068), t3069)
  let t3055 = @simp.asm_rewrite_tac(@list.List([@convex.conic_hull_eq_empty()]))
  let t3054 = @simp.asm_simp_tac(@list.List([@convex.conic_contains_0(), @misc.hull_subset(), @convex.conic_conic_hull()]))
  let t3056 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((x : _), (s : (_) -> Bool)) && SUBSET(s, hull((P : ((_) -> Bool) -> Bool), s)) → IN(x, hull(P, s))"))), t3054), t3055)
  let t3051 = @meson.asm_meson_tac(@list.List([@polytope.face_of_imp_subset()]))
  let t3052 = @tactics.then_tac(@tactics.match_mp_tac(@misc.hull_mono()), t3051)
  let t3053 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.vec_component()])), @calc_rat.real_arith_tac), t3052])
  let t3050 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, (p : (Cart[Real, N]) -> Bool))"))
  let t3057 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("∀ t : (_) -> Bool, !IN((x : _), t) && SUBSET((s : (_) -> Bool), t) → !IN(x, s)"))), t3050), @tactics.conj_tac), t3053), t3056])
  let t3049 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("!(p : Bool) && (q : Bool) → !(p == q)")))
  let t3048 = @tactics.exists_tac(@term_syntax.parse_term("(vec : (Num) -> Cart[Real, N])(0)"))
  let t3047 = @simp.rewrite_tac(@list.List([@sets.extension(), @class.not_forall_thm()]))
  let t3046 = @simp.simp_tac(@list.List([@sets.psubset(), @misc.hull_mono(), @misc.hull_subset()]))
  let t3071 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@convex.aff_dim_psubset()), t3046), t3047), t3048), t3049), @tactics.conj_tac), t3057), t3070])
  let t3045 = @tactics.match_mp_tac(@int.int_arith(@term_syntax.parse_term("(f : Int) < (a : Int) && a <= f + int_of_num(1) → a == f + int_of_num(1)")))
  let t3044 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool)"))
  let t3040 = @simp.asm_rewrite_tac(@list.List([@convex.aff_dim_empty()]))
  let t3039 = @tactics.undisch_tac(@term_syntax.parse_term("aff_dim((f : (Cart[Real, N]) -> Bool)) == int_of_num((d : Num))"))
  let t3038 = @tactics.disch_then(@tactics.match_mp_tac)
  let t3037 = @simp.asm_rewrite_tac(@list.List([]))
  let t3034 = @term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool)")
  let t3041 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("*", fn(x3036 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3031 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3032 = @tactics.mp_tac(x3031)
      fn(x3033 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3032(x3033)
      }
    })(((x3035 : @kernel.Thm) => @bool.spec(t3034, x3035))(x3036))
  }), t3037), t3038), @tactics.disch_tac), t3039), t3040), @int.int_arith_tac)
  let t3028 = @simp.asm_simp_tac(@list.List([@real.real_le_inv_eq(), @realarith.real_lt_imp_le()]))
  let t3027 = @tactics.disch_then(@tactics.match_mp_tac)
  let t3026 = @simp.rewrite_tac(@list.List([@convex.conic()]))
  let t3025 = @simp.asm_simp_tac(@list.List([@convex.conic_contains_0()]))
  let t3023 = @term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool)")
  let t3024 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t3023]), @polytope.face_of_conic()))
  let t3022 = @simp.asm_simp_tac(@list.List([@vectors.vector_mul_component(), @realax.real_mul_linv(), @real.real_lt_imp_nz()]))
  let t3021 = @tactics.exists_tac(@term_syntax.parse_term("op_pct(inv(op_dollar((y : Cart[Real, N]), 1)), y)"))
  let t3020 = @list.List([@meson.asm_meson_tac(@list.List([@polytope.face_of_imp_subset(), @sets.subset()])), @tactics.all_tac])
  let t3019 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < op_dollar((y : Cart[Real, N]), 1)"), fn(x3016 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3017 = @tactics.assume_tac(x3016)
    fn(x3018 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3017(x3018)
    }
  })
  let t3029 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_inter(), @sets.in_elim_thm()])), t3019), t3020), t3021), t3022), t3024), t3025), t3026), t3027), t3028)
  let t3015 = @simp.asm_rewrite_tac(@list.List([@convex.aff_dim_sing(), @convex.aff_dim_empty()]))
  let t3014 = @tactics.undisch_tac(@term_syntax.parse_term("aff_dim((f : (Cart[Real, N]) -> Bool)) == int_of_num((d : Num)) + int_of_num(1)"))
  let t3012 = @tactics.repeat_tac(@tactics.disch_tac)
  let t3011 = @simp.asm_simp_tac(@list.List([@convex.conic_contains_0()]))
  let t3010 = @term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool)")
  let t3013 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), t3010]), @polytope.face_of_conic())), t3011), t3012), @tactics.disch_tac])
  let t3030 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((a : _), (s : (_) -> Bool)) && !(s == {a}) → (∃ y : _, IN(y, s) && !(y == a))"))), @tactics.conj_tac), t3013), t3014), t3015), @int.int_arith_tac), t3029])
  let t3009 = @tactics.subgoal_then(@term_syntax.parse_term("∃ y : Cart[Real, N], IN(y, (f : (Cart[Real, N]) -> Bool)) && !(y == vec(0))"), @tactics.strip_assume_tac)
  let t3008 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([]))])
  let t3007 = @simp.asm_simp_tac(@list.List([@int.int_arith(@term_syntax.parse_term("int_of_num(0) < int_of_num((d : Num)) + int_of_num(1)")), @int.int_eq_add_rcancel()]))
  let t3004 = @term_syntax.parse_term("INTER((f : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, 1) == real_of_num(1)})")
  let t3042 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("*", fn(x3006 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3001 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3002 = @tactics.mp_tac(x3001)
      fn(x3003 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3002(x3003)
      }
    })(((x3005 : @kernel.Thm) => @bool.spec(t3004, x3005))(x3006))
  }), t3007), @tactics.ants_tac), t3008), t3009), t3030), t3041])
  let t3043 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.x_gen_tac(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool)"))), @tactics.strip_tac), t3042)])
  let t3000 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Bool, face_of(f, (p : (Cart[Real, N]) -> Bool)) && !(f == {}) → aff_dim(hull(conic, f)) == aff_dim(f) + int_of_num(1)"), fn(x2997 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2998 = ((x2996 : @kernel.Thm) => @tactics.label_tac("*", x2996))(x2997)
    fn(x2999 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2998(x2999)
    }
  })
  let t2994 = @simp.asm_simp_tac(@list.List([]))
  let t2991 = @meson.asm_meson_tac(@list.List([]))
  let t2990 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2984 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t2985 = @term_syntax.parse_term("(b : Cart[Real, N])")
  let t2986 = @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t2985, t2984])
  let t2989 = @tactics.disch_then(fn(x2988 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2981 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2982 = @tactics.mp_tac(x2981)
      fn(x2983 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2982(x2983)
      }
    })(((x2987 : @kernel.Thm) => @bool.specl(t2986, x2987))(x2988))
  })
  let t2980 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x2974 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2975 = @tactics.assume_tac(x2974)
    fn(x2976 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2975(x2976)
    }
  }, fn(x2977 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2978 = @tactics.mp_tac(x2977)
    fn(x2979 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2978(x2979)
    }
  })))
  let t2972 = @simp.gen_rewrite_rule(fn(x2971 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2971
  }, @list.List([@polytope.face_of()]))
  let t2992 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2973 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2968 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2969 = @tactics.mp_tac(x2968)
      fn(x2970 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2969(x2970)
      }
    })(t2972(x2973))
  }), t2980), t2989), t2990), t2991)
  let t2964 = @tactics.conv_tac(@calc_rat.real_field)
  let t2962 = @term_syntax.parse_term("!((cx : Real) == real_of_num(0))")
  let t2963 = @tactics.map_every(fn(x2959 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2960 = @tactics.undisch_tac(x2959)
    fn(x2961 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2960(x2961)
    }
  }, @list.List([@term_syntax.parse_term("(real_of_num(1) - (u : Real)) * (ca : Real) + u * (cb : Real) == (cx : Real)"), t2962]))
  let t2965 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc(), @vectors.vector_add_ldistrib()])), @tactics.binop_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2963), t2964)
  let t2958 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2956 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) + (b : Real) == (cx : Real) → real_of_num(0) <= a → b <= real_of_num(1) * cx")))
  let t2966 = @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2957 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2956(x2957))
  }), t2958), @calc_rat.asm_real_arith_tac)
  let t2955 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2967 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero()])), t2955), @calc_rat.asm_real_arith_tac), t2966, t2965])
  let t2954 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2953 = @simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @real.real_le_ldiv_eq(), @realarith.real_lt_le()]))
  let t2952 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("inv((cx : Real)) * (x : Real) == x / cx"))]))
  let t2951 = @tactics.exists_tac(@term_syntax.parse_term("inv((cx : Real)) * ((u : Real) * (cb : Real))"))
  let t2950 = @tactics.disch_then(fn(x2949 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t2948 = @simp.asm_simp_tac(@list.List([@vectors.vector_mul_assoc(), @realax.real_mul_linv(), @vectors.vector_mul_lid()]))
  let t2944 = @term_syntax.parse_term("(op_pct : (Real, Cart[Real, N]) -> Cart[Real, N])(inv((cx : Real)))")
  let t2947 = @tactics.disch_then(fn(x2946 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2941 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2942 = @tactics.mp_tac(x2941)
      fn(x2943 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2942(x2943)
      }
    })(((x2945 : @kernel.Thm) => @equal.ap_term(t2944, x2945))(x2946))
  })
  let t2940 = @tactics.disch_then(fn(x2939 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2936 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2937 = @tactics.assume_tac(x2936)
      fn(x2938 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2937(x2938)
      }
    })(@equal.sym(x2939))
  })
  let t2935 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid()]))
  let t2934 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x2931 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2932 = @tactics.subst1_tac(x2931)
    fn(x2933 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2932(x2933)
    }
  }))
  let t2930 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2929 = @list.List([@meson.asm_meson_tac(@list.List([@polytope.face_of_imp_subset(), @misc.hull_subset(), @sets.subset()])), @tactics.all_tac])
  let t2928 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, N]), hull(affine, (p : (Cart[Real, N]) -> Bool))) && IN((a : Cart[Real, N]), hull(affine, p)) && IN((b : Cart[Real, N]), hull(affine, p))"), fn(x2925 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2926 = @tactics.mp_tac(x2925)
    fn(x2927 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2926(x2927)
    }
  })
  let t2924 = @simp.rewrite_tac(@list.List([@arith.le_refl(), @cart.dimindex_ge_1(), @vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t2920 = @term_syntax.parse_term("1")
  let t2923 = @tactics.disch_then(fn(x2922 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2917 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2918 = @tactics.mp_tac(x2917)
      fn(x2919 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2918(x2919)
      }
    })(((x2921 : @kernel.Thm) => @bool.spec(t2920, x2921))(x2922))
  })
  let t2916 = @simp.gen_rewrite_tac(fn(x2913 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2914 = @equal.land_conv(x2913)
    fn(x2915 : @kernel.Term) -> @kernel.Thm raise {
      s2914(x2915)
    }
  }, @list.List([@cart.cart_eq()]))
  let t2912 = @tactics.disch_then(fn(x2909 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_7 = x2909
    let t2911 = @tactics.mp_tac(th_7)
    @tactics.then_tac(@tactics.mp_tac(th_7), t2911)
  })
  let t2908 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x2902 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2903 = @tactics.assume_tac(x2902)
    fn(x2904 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2903(x2904)
    }
  }, fn(x2905 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2906 = @tactics.mp_tac(x2905)
    fn(x2907 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2906(x2907)
    }
  })))
  let t2901 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Real)"))(fn(x2898 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2899 = @tactics.mp_tac(x2898)
    fn(x2900 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2899(x2900)
    }
  }))
  let t2897 = @simp.rewrite_tac(@list.List([@topology.in_segment()]))
  let t2896 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2893 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2894 = @tactics.mp_tac(x2893)
    fn(x2895 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2894(x2895)
    }
  }, @tactics.strip_assume_tac))
  let t2892 = @simp.asm_rewrite_tac(@list.List([@topology.in_open_segment()]))
  let t2890 = @simp.gen_rewrite_rule(fn(x2889 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2889
  }, @list.List([@topology.in_open_segment()]))
  let t2993 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2891 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2886 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2887 = @tactics.mp_tac(x2886)
      fn(x2888 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2887(x2888)
      }
    })(t2890(x2891))
  }), t2892), t2896), t2897), t2901), t2908), t2912), t2916), t2923), t2924), t2928), t2929), t2930), t2934), t2935), t2940), t2947), t2948), t2950), t2951), t2952), t2953), t2954), t2967), t2992])
  let t2885 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, N]), segment(((a : Cart[Real, N]), (b : Cart[Real, N]))))"), fn(x2882 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2883 = @tactics.assume_tac(x2882)
    fn(x2884 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2883(x2884)
    }
  })
  let t2878 = @simp.asm_rewrite_tac(@list.List([]))
  let t2877 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t2876 = @tactics.exists_tac(@term_syntax.parse_term("(cb : Real)"))
  let t2879 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.exists_tac(@term_syntax.parse_term("(ca : Real)")), t2876])), t2877), t2878)
  let t2874 = @meson.asm_meson_tac(@list.List([]))
  let t2873 = @simp.asm_rewrite_tac(@list.List([]))
  let t2872 = @term_syntax.parse_term("(b : Cart[Real, N])")
  let t2875 = @tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x2869 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2870 = @tactics.exists_tac(x2869)
    fn(x2871 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2870(x2871)
    }
  }, @list.List([@term_syntax.parse_term("(cb : Real)"), t2872])), t2873), t2874)
  let t2868 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @realax.real_le_refl()]))
  let t2867 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t2880 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.map_every(fn(x2864 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2865 = @tactics.exists_tac(x2864)
    fn(x2866 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2865(x2866)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(0)"), t2867])), t2868), t2875])), t2879])
  let t2863 = @simp.asm_rewrite_tac(@list.List([]))
  let t2862 = @simp.asm_simp_tac(@list.List([@vectors.vector_mul_lcancel(), @realarith.real_entire(), @real.real_lt_imp_ne(), @realarith.real_sub_0()]))
  let t2861 = @tactics.disch_then(fn(x2858 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2859 = @tactics.subst1_tac(x2858)
    fn(x2860 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2859(x2860)
    }
  })
  let t2857 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid()]))
  let t2856 = @tactics.disch_then(@tactics.conjuncts_then(fn(x2853 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2854 = @tactics.subst1_tac(x2853)
    fn(x2855 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2854(x2855)
    }
  }))
  let t2852 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2851 = @list.List([@meson.asm_meson_tac(@list.List([@polytope.face_of_imp_subset(), @misc.hull_subset(), @sets.subset()])), @tactics.all_tac])
  let t2850 = @tactics.subgoal_then(@term_syntax.parse_term("IN((a : Cart[Real, N]), hull(affine, (p : (Cart[Real, N]) -> Bool))) && IN((b : Cart[Real, N]), hull(affine, p))"), fn(x2847 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2848 = @tactics.mp_tac(x2847)
    fn(x2849 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2848(x2849)
    }
  })
  let t2846 = @simp.rewrite_tac(@list.List([@arith.le_refl(), @cart.dimindex_ge_1(), @vectors.vector_mul_component()]))
  let t2842 = @term_syntax.parse_term("1")
  let t2845 = @tactics.disch_then(fn(x2844 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2839 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2840 = @tactics.mp_tac(x2839)
      fn(x2841 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2840(x2841)
      }
    })(((x2843 : @kernel.Thm) => @bool.spec(t2842, x2843))(x2844))
  })
  let t2838 = @simp.gen_rewrite_tac(fn(x2835 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2836 = @equal.land_conv(x2835)
    fn(x2837 : @kernel.Term) -> @kernel.Thm raise {
      s2836(x2837)
    }
  }, @list.List([@cart.cart_eq()]))
  let t2834 = @tactics.disch_then(fn(x2831 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_6 = x2831
    let t2833 = @tactics.mp_tac(th_6)
    @tactics.then_tac(@tactics.mp_tac(th_6), t2833)
  })
  let t2830 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_assoc(), @vectors.vector_arith(@term_syntax.parse_term("(op_pct((x : Real), (b : Cart[Real, N])) == op_pct((y : Real), (a : Cart[Real, N])) + op_pct((z : Real), b)) == (op_pct(x - z, b) == op_pct(y, a))"))]))
  let t2829 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x2823 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2824 = @tactics.assume_tac(x2823)
    fn(x2825 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2824(x2825)
    }
  }, fn(x2826 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2827 = @tactics.mp_tac(x2826)
    fn(x2828 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2827(x2828)
    }
  })))
  let t2822 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2816 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2817 = @tactics.assume_tac(x2816)
    fn(x2818 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2817(x2818)
    }
  }, @tactics.x_choose_then(@term_syntax.parse_term("(u : Real)"))(fn(x2819 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2820 = @tactics.mp_tac(x2819)
    fn(x2821 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2820(x2821)
    }
  })))
  let t2881 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_segment()])), t2822), t2829), t2830), t2834), t2838), t2845), t2846), t2850), t2851), t2852), t2856), t2857), t2861), t2862), @tactics.strip_tac), t2863), t2880), @tactics.all_tac])
  let t2815 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, N]) == (b : Cart[Real, N])"))
  let t2811 = @simp.asm_rewrite_tac(@list.List([]))
  let t2810 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t2809 = @tactics.exists_tac(@term_syntax.parse_term("(cb : Real)"))
  let t2812 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.exists_tac(@term_syntax.parse_term("(ca : Real)")), t2809])), t2810), t2811)
  let t2807 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_lzero(), @realax.real_le_refl()]))
  let t2806 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t2808 = @tactics.then_tac(@tactics.map_every(fn(x2803 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2804 = @tactics.exists_tac(x2803)
    fn(x2805 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2804(x2805)
    }
  }, @list.List([@term_syntax.parse_term("real_of_num(0)"), t2806])), t2807)
  let t2802 = @meson.asm_meson_tac(@list.List([]))
  let t2801 = @simp.asm_rewrite_tac(@list.List([]))
  let t2800 = @term_syntax.parse_term("(a : Cart[Real, N])")
  let t2813 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.map_every(fn(x2797 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2798 = @tactics.exists_tac(x2797)
    fn(x2799 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2798(x2799)
    }
  }, @list.List([@term_syntax.parse_term("(ca : Real)"), t2800])), t2801), t2802), t2808])), t2812])
  let t2796 = @simp.asm_rewrite_tac(@list.List([]))
  let t2795 = @simp.asm_simp_tac(@list.List([@vectors.vector_mul_lcancel(), @realarith.real_entire(), @real.real_lt_imp_nz()]))
  let t2794 = @tactics.disch_then(fn(x2791 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2792 = @tactics.subst1_tac(x2791)
    fn(x2793 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2792(x2793)
    }
  })
  let t2790 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid()]))
  let t2789 = @tactics.disch_then(@tactics.conjuncts_then(fn(x2786 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2787 = @tactics.subst1_tac(x2786)
    fn(x2788 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2787(x2788)
    }
  }))
  let t2785 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2784 = @list.List([@meson.asm_meson_tac(@list.List([@polytope.face_of_imp_subset(), @misc.hull_subset(), @sets.subset()])), @tactics.all_tac])
  let t2783 = @tactics.subgoal_then(@term_syntax.parse_term("IN((a : Cart[Real, N]), hull(affine, (p : (Cart[Real, N]) -> Bool))) && IN((b : Cart[Real, N]), hull(affine, p))"), fn(x2780 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2781 = @tactics.mp_tac(x2780)
    fn(x2782 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2781(x2782)
    }
  })
  let t2779 = @simp.rewrite_tac(@list.List([@arith.le_refl(), @cart.dimindex_ge_1(), @vectors.vector_mul_component()]))
  let t2775 = @term_syntax.parse_term("1")
  let t2778 = @tactics.disch_then(fn(x2777 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2772 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2773 = @tactics.mp_tac(x2772)
      fn(x2774 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2773(x2774)
      }
    })(((x2776 : @kernel.Thm) => @bool.spec(t2775, x2776))(x2777))
  })
  let t2771 = @simp.gen_rewrite_tac(fn(x2768 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2769 = @equal.land_conv(x2768)
    fn(x2770 : @kernel.Term) -> @kernel.Thm raise {
      s2769(x2770)
    }
  }, @list.List([@cart.cart_eq()]))
  let t2767 = @tactics.disch_then(fn(x2764 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x2764
    let t2766 = @tactics.mp_tac(th_5)
    @tactics.then_tac(@tactics.mp_tac(th_5), t2766)
  })
  let t2763 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_assoc(), @vectors.vector_arith(@term_syntax.parse_term("(op_pct((x : Real), (a : Cart[Real, N])) == op_pct((y : Real), a) + op_pct((z : Real), (b : Cart[Real, N]))) == (op_pct(x - y, a) == op_pct(z, b))"))]))
  let t2762 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x2756 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2757 = @tactics.assume_tac(x2756)
    fn(x2758 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2757(x2758)
    }
  }, fn(x2759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2760 = @tactics.mp_tac(x2759)
    fn(x2761 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2760(x2761)
    }
  })))
  let t2755 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2749 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2750 = @tactics.assume_tac(x2749)
    fn(x2751 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2750(x2751)
    }
  }, @tactics.x_choose_then(@term_syntax.parse_term("(u : Real)"))(fn(x2752 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2753 = @tactics.mp_tac(x2752)
    fn(x2754 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2753(x2754)
    }
  })))
  let t2814 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_segment()])), t2755), t2762), t2763), t2767), t2771), t2778), t2779), t2783), t2784), t2785), t2789), t2790), t2794), t2795), @tactics.strip_tac), t2796), t2813), @tactics.all_tac])
  let t2748 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, N]) == (a : Cart[Real, N])"))
  let t2747 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_eq_0(), @class.de_morgan_thm()]))
  let t2746 = @tactics.undisch_tac(@term_syntax.parse_term("!(op_pct((cx : Real), (x : Cart[Real, N])) == vec(0))"))
  let t2744 = @meson.asm_meson_tac(@list.List([@convex.conic(), @misc.hull_subset(), @sets.subset()]))
  let t2743 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2742 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @realarith.real_sub_lt()]))
  let t2741 = @tactics.match_mp_tac(@realax.real_le_mul())
  let t2740 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_lt_imp_le(), @real.real_lt_mul(), @realarith.real_sub_lt()]))
  let t2737 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (b : Real) && real_of_num(0) <= (a : Real) → !(real_of_num(0) == a + b)")))
  let t2738 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (a : Real) && real_of_num(0) <= (b : Real) → !(real_of_num(0) == a + b)")))
  let t2736 = @meson.asm_meson_tac(@list.List([@convex.conic(), @misc.hull_subset(), @sets.subset()]))
  let t2739 = @list.List([@tactics.then_tac(@tactics.subgoal_then(@term_syntax.parse_term("IN(op_pct((ca : Real), (a : Cart[Real, N])), (s : (Cart[Real, N]) -> Bool)) && IN(op_pct((cb : Real), (b : Cart[Real, N])), s)"), fn(x2734 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x2734
    @meson.asm_meson_tac(@list.List([th_4]))
  }), t2736), t2738, t2737])
  let t2733 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < op_dollar(op_pct((ca : Real), (a : Cart[Real, N])), 1) || real_of_num(0) < op_dollar(op_pct((cb : Real), (b : Cart[Real, N])), 1)"), @tactics.disj_cases_tac)
  let t2732 = @simp.once_rewrite_tac(@list.List([@vectors.vector_mul_component()]))
  let t2731 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component()]))
  let t2730 = @simp.rewrite_tac(@list.List([@arith.le_refl(), @cart.dimindex_ge_1(), @vectors.vec_component()]))
  let t2726 = @term_syntax.parse_term("1")
  let t2729 = @tactics.disch_then(fn(x2728 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2723 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2724 = @tactics.mp_tac(x2723)
      fn(x2725 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2724(x2725)
      }
    })(((x2727 : @kernel.Thm) => @bool.spec(t2726, x2727))(x2728))
  })
  let t2722 = @simp.rewrite_tac(@list.List([@cart.cart_eq()]))
  let t2721 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x2715 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2716 = @tactics.assume_tac(x2715)
    fn(x2717 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2716(x2717)
    }
  }, fn(x2718 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2719 = @tactics.mp_tac(x2718)
    fn(x2720 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2719(x2720)
    }
  })))
  let t2714 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(u : Real)"))(fn(x2711 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2712 = @tactics.mp_tac(x2711)
    fn(x2713 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2712(x2713)
    }
  }))
  let t2710 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → !(b : Bool)) → a && b → (c : Bool)")))
  let t2745 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@topology.in_segment()])), t2710), @tactics.disch_tac), t2714), t2721), t2722), t2729), t2730), t2731), t2732), t2733), t2739), t2740), t2741), t2742), t2743), t2744), @tactics.all_tac])
  let t2709 = @class.asm_cases_tac(@term_syntax.parse_term("op_pct((cx : Real), (x : Cart[Real, N])) == vec(0)"))
  let t2707 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t2708 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(cx : Real)"), t2707]))
  let t2705 = @term_syntax.parse_term("(b : Cart[Real, N])")
  let t2706 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(cb : Real)"), t2705]))
  let t2703 = @term_syntax.parse_term("(a : Cart[Real, N])")
  let t2704 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(ca : Real)"), t2703]))
  let t2702 = @simp.rewrite_tac(@list.List([@theorems.right_forall_imp_thm(), @sets.forall_in_gspec()]))
  let t2701 = @simp.rewrite_tac(@list.List([@convex.conic_hull_explicit(), @theorems.imp_conj()]))
  let t2700 = @simp.expand_tac("s")
  let t2698 = @meson.asm_meson_tac(@list.List([@convex.convex_conic_hull(), @polytope.face_of_imp_convex()]))
  let t2697 = @meson.asm_meson_tac(@list.List([@polytope.face_of_imp_subset()]))
  let t2696 = @tactics.match_mp_tac(@misc.hull_mono())
  let t2699 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("s"), t2696), t2697), t2698, @tactics.all_tac])
  let t2695 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2694 = @simp.rewrite_tac(@list.List([@polytope.face_of()]))
  let t2693 = @simp.asm_rewrite_tac(@list.List([@convex.conic_hull_empty(), @polytope.empty_face_of()]))
  let t2692 = @class.asm_cases_tac(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool) == {}"))
  let t2995 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2692), t2693), t2694), t2695), t2699), t2700), t2701), t2702), t2704), @tactics.strip_tac), t2706), @tactics.strip_tac), t2708), @tactics.strip_tac), t2709), t2745), t2746), t2747), @tactics.strip_tac), t2748), t2814), t2815), t2881), @tactics.disch_tac), t2885), t2993), t2994])
  let t2691 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Bool, face_of(f, (p : (Cart[Real, N]) -> Bool)) → face_of(hull(conic, f), (s : (Cart[Real, N]) -> Bool))"), fn(x2688 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2689 = @tactics.assume_tac(x2688)
    fn(x2690 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2689(x2690)
    }
  })
  let t2686 = @simp.asm_simp_tac(@list.List([@int.int_arith(@term_syntax.parse_term("int_of_num(0) < int_of_num((d : Num)) + int_of_num(1)"))]))
  let t2681 = @meson.asm_meson_tac(@list.List([@polytope.face_of_conic(), @convex.conic(), @real.real_le_inv_eq(), @realarith.real_lt_imp_le()]))
  let t2680 = @simp.asm_simp_tac(@list.List([@vectors.vector_mul_component(), @realax.real_mul_linv(), @realarith.real_lt_imp_le(), @real.real_lt_imp_nz(), @vectors.vector_mul_assoc(), @real.real_mul_rinv(), @vectors.vector_mul_lid()]))
  let t2679 = @tactics.exists_tac(@term_syntax.parse_term("op_pct(inv(op_dollar((x : Cart[Real, N]), 1)), x)"))
  let t2678 = @tactics.exists_tac(@term_syntax.parse_term("op_dollar((x : Cart[Real, N]), 1)"))
  let t2677 = @list.List([@meson.asm_meson_tac(@list.List([@polytope.face_of_imp_subset(), @sets.subset()])), @tactics.all_tac])
  let t2682 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < op_dollar((x : Cart[Real, N]), 1)"), fn(x2674 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2675 = @tactics.assume_tac(x2674)
    fn(x2676 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2675(x2676)
    }
  }), t2677), t2678), t2679), t2680), t2681)
  let t2671 = @meson.asm_meson_tac(@list.List([@polytope.face_of_conic(), @convex.conic(), @real.real_le_inv_eq(), @realarith.real_lt_imp_le()]))
  let t2670 = @simp.asm_simp_tac(@list.List([@vectors.vector_mul_component(), @realax.real_mul_linv(), @real.real_lt_imp_nz()]))
  let t2669 = @tactics.exists_tac(@term_syntax.parse_term("op_pct(inv(op_dollar((y : Cart[Real, N]), 1)), y)"))
  let t2668 = @simp.asm_rewrite_tac(@list.List([@realarith.real_pos(), @vectors.vector_mul_lzero()]))
  let t2667 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)"))
  let t2666 = @list.List([@meson.asm_meson_tac(@list.List([@polytope.face_of_imp_subset(), @sets.subset()])), @tactics.all_tac])
  let t2672 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < op_dollar((y : Cart[Real, N]), 1)"), fn(x2663 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2664 = @tactics.assume_tac(x2663)
    fn(x2665 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2664(x2665)
    }
  }), t2666), t2667), t2668), t2669), t2670), t2671)
  let t2662 = @meson.asm_meson_tac(@list.List([@convex.aff_dim_eq_0(), @int.int_lt_refl()]))
  let t2673 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("IN((a : _), (s : (_) -> Bool)) && !(s == {a}) → (∃ y : _, IN(y, s) && !(y == a))"))), t2662), t2672])
  let t2683 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∃ y : Cart[Real, N], IN(y, (f : (Cart[Real, N]) -> Bool)) && !(y == vec(0))"), @tactics.strip_assume_tac), t2673), t2682])
  let t2661 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, N]) == vec(0)"))
  let t2660 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_inter()]))
  let t2659 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])"))
  let t2684 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @convex.conic_hull_explicit()])), t2659), @tactics.disch_tac), t2660), t2661), t2683)
  let t2658 = @meson.asm_meson_tac(@list.List([@polytope.face_of_conic(), @convex.conic()]))
  let t2657 = @simp.rewrite_tac(@list.List([@sets.in_inter(), @sets.in_elim_thm()]))
  let t2685 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @convex.conic_hull_explicit(), @sets.forall_in_gspec()])), t2657), t2658), t2684])
  let t2656 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t2687 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2656), @tactics.conj_tac), t2685), t2686])
  let t2655 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Bool, face_of(f, (s : (Cart[Real, N]) -> Bool)) && int_of_num(0) < aff_dim(f) → hull(conic, INTER(f, {(x : Cart[Real, N]) | op_dollar(x, 1) == real_of_num(1)})) == f"), fn(x2652 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2653 = @tactics.assume_tac(x2652)
    fn(x2654 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2653(x2654)
    }
  })
  let t2650 = @simp.asm_simp_tac(@list.List([]))
  let t2649 = @simp.asm_rewrite_tac(@list.List([@convex.convex_standard_hyperplane()]))
  let t2648 = @tactics.match_mp_tac(@polytope.face_of_slice())
  let t2647 = @list.List([@meson.asm_meson_tac(@list.List([@polytope.face_of_refl(), @polytope.polytope_imp_convex()])), @tactics.all_tac])
  let t2646 = @tactics.subgoal_then(@term_syntax.parse_term("(p : (Cart[Real, N]) -> Bool) == INTER(hull(conic, p), {(x : Cart[Real, N]) | op_dollar(x, 1) == real_of_num(1)})"), fn(x2643 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2644 = @tactics.subst1_tac(x2643)
    fn(x2645 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2644(x2645)
    }
  })
  let t2651 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2646), t2647), t2648), t2649), t2650])
  let t2642 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Bool, face_of(f, (s : (Cart[Real, N]) -> Bool)) → face_of(INTER(f, {(x : Cart[Real, N]) | op_dollar(x, 1) == real_of_num(1)}), (p : (Cart[Real, N]) -> Bool))"), fn(x2639 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2640 = @tactics.assume_tac(x2639)
    fn(x2641 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2640(x2641)
    }
  })
  let t2637 = @simp.asm_simp_tac(@list.List([]))
  let t2635 = @simp.asm_rewrite_tac(@list.List([@sets.subset_refl()]))
  let t2636 = @list.List([@meson.asm_meson_tac(@list.List([@polytope.face_of_imp_subset(), @misc.hull_subset(), @sets.subset_trans()])), t2635])
  let t2634 = @tactics.exists_tac(@term_syntax.parse_term("hull(affine, (p : (Cart[Real, N]) -> Bool))"))
  let t2633 = @tactics.match_mp_tac(@sets.subset_trans())
  let t2632 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2638 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t2632), t2633), t2634), @tactics.conj_tac), t2636), t2637])
  let t2631 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Bool, face_of(f, (p : (Cart[Real, N]) -> Bool)) → INTER(hull(conic, f), {(x : Cart[Real, N]) | op_dollar(x, 1) == real_of_num(1)}) == f"), fn(x2628 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2629 = @tactics.assume_tac(x2628)
    fn(x2630 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2629(x2630)
    }
  })
  let t2626 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @equal.gsym(@int.int_of_num_add())]))
  let t2625 = @sets.set_tac(@list.List([]))
  let t2624 = @simp.asm_simp_tac(@list.List([@polytope.finite_polyhedron_faces()]))
  let t2623 = @tactics.exists_tac(@term_syntax.parse_term("{(f : (Cart[Real, N]) -> Bool) | face_of(f, (s : (Cart[Real, N]) -> Bool))}"))
  let t2627 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disj1_tac, @tactics.match_mp_tac(@sets.finite_subset())), t2623), t2624), t2625), t2626])
  let t2622 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t2621 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool) => hull(conic, f)"))
  let t2620 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool) => INTER(f, {(x : Cart[Real, N]) | op_dollar(x, 1) == real_of_num(1)})"))
  let t2619 = @tactics.match_mp_tac(@sets.bijections_card_eq())
  let t2618 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid()]))
  let t2617 = @simp.rewrite_tac(@list.List([@real.real_pow_add(), @real.real_pow_1(), @calc_int.real_mul_rneg(), @calc_int.real_mul_lneg()]))
  let t2616 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t2615 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t2614 = @simp.rewrite_tac(@list.List([@iterate.sum_offset(), @equal.gsym(@iterate.sum_neg())]))
  let t2613 = @tactics.subgoal_then(@term_syntax.parse_term("(dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) == (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) - 1 + 1"), fn(x2604 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x2604
    @simp.gen_rewrite_tac(fn(x2612 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2606 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2607 = @equal.land_conv(x2606)
        fn(x2608 : @kernel.Term) -> @kernel.Thm raise {
          s2607(x2608)
        }
      })((fn(x2609 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s2610 = @equal.once_depth_conv(x2609)
        fn(x2611 : @kernel.Term) -> @kernel.Thm raise {
          s2610(x2611)
        }
      })(x2612))
    }, @list.List([th_3]))
  })
  let t2603 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(s : Real) == -(t : Real) → real_of_num(0) + real_of_num(1) + s == real_of_num(0) → t == real_of_num(1)")))
  let t2602 = @simp.simp_tac(@list.List([@sets.card_clauses(), @sets.finite_empty(), @sets.not_in_empty(), @equal.gsym(@real.real_of_num_suc())]))
  let t2598 = @simp.asm_simp_tac(@list.List([@realax.real_le_mul(), @realarith.real_lt_imp_le(), @real.real_lt_mul(), @realarith.real_sub_lt()]))
  let t2595 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (b : Real) && real_of_num(0) <= (a : Real) → !(real_of_num(0) == a + b)")))
  let t2596 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (a : Real) && real_of_num(0) <= (b : Real) → !(real_of_num(0) == a + b)")))
  let t2597 = @list.List([@meson.asm_meson_tac(@list.List([])), t2596, t2595])
  let t2594 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < op_dollar((a : Cart[Real, N]), 1) || real_of_num(0) < op_dollar((b : Cart[Real, N]), 1)"), @tactics.disj_cases_tac)
  let t2593 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t2592 = @simp.rewrite_tac(@list.List([@arith.le_refl(), @cart.dimindex_ge_1(), @vectors.vec_component()]))
  let t2588 = @term_syntax.parse_term("1")
  let t2591 = @tactics.disch_then(fn(x2590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2586 = @tactics.mp_tac(x2585)
      fn(x2587 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2586(x2587)
      }
    })(((x2589 : @kernel.Thm) => @bool.spec(t2588, x2589))(x2590))
  })
  let t2584 = @simp.rewrite_tac(@list.List([@cart.cart_eq()]))
  let t2583 = @tactics.repeat_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x2577 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2578 = @tactics.assume_tac(x2577)
    fn(x2579 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2578(x2579)
    }
  }, fn(x2580 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2581 = @tactics.mp_tac(x2580)
    fn(x2582 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2581(x2582)
    }
  })))
  let t2576 = @tactics.x_gen_tac(@term_syntax.parse_term("(u : Real)"))
  let t2575 = @simp.rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t2574 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2568 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2569 = @tactics.assume_tac(x2568)
    fn(x2570 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2569(x2570)
    }
  }, fn(x2571 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2572 = @tactics.mp_tac(x2571)
    fn(x2573 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2572(x2573)
    }
  }))
  let t2566 = @term_syntax.parse_term("(b : Cart[Real, N])")
  let t2567 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t2566]))
  let t2565 = @simp.asm_rewrite_tac(@list.List([@polytope.face_of_sing(), @polytope.extreme_point_of(), @topology.in_segment()]))
  let t2564 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t2599 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.disch_then(fn(x2561 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2562 = @tactics.subst1_tac(x2561)
    fn(x2563 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2562(x2563)
    }
  }), @tactics.conj_tac), t2564), t2565), t2567), @tactics.strip_tac), t2574), t2575), t2576), t2583), t2584), t2591), t2592), t2593), t2594), t2597), t2598)
  let t2560 = @meson.asm_meson_tac(@list.List([@polytope.extreme_point_of_conic()]))
  let t2559 = @simp.asm_rewrite_tac(@list.List([@polytope.face_of_sing()]))
  let t2557 = @term_syntax.parse_term("(a : Cart[Real, N])")
  let t2600 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x2554 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2555 = @tactics.mp_tac(x2554)
    fn(x2556 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2555(x2556)
    }
  }, (x2558 : @kernel.Thm) => @tactics.x_choose_tac(t2557, x2558))), t2559), t2560), t2599])
  let t2553 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Bool)"))
  let t2552 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_sing()]))
  let t2601 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x2551 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2551
  }, @list.List([@sets.extension()])), t2552), t2553), @tactics.eq_tac), t2600), @tactics.all_tac])
  let t2550 = @tactics.subgoal_then(@term_syntax.parse_term("{(f : (Cart[Real, N]) -> Bool) | face_of(f, (s : (Cart[Real, N]) -> Bool)) && (∃ a : Cart[Real, N], f == {a})} == {{vec(0)}}"), fn(x2548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x2548
    @simp.rewrite_tac(@list.List([th_2]))
  })
  let t2547 = @simp.rewrite_tac(@list.List([@convex.aff_dim_eq_0(), @realax.real_pow(), @realax.real_mul_lid()]))
  let t2546 = @tactics.disch_then(fn(x2543 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2544 = @tactics.subst1_tac(x2543)
    fn(x2545 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2544(x2545)
    }
  })
  let t2542 = @simp.rewrite_tac(@list.List([@arith.le_0()]))
  let t2535 = @drule.part_match(fn(x2534 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhs(@kernel.rand(x2534))
  }, @iterate.sum_clauses_left())
  let t2529 = @simp.asm_simp_tac(@list.List([@vectors.vec_component(), @realarith.real_pos(), @realarith.real_lt_imp_le()]))
  let t2528 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Cart[Real, N]) == vec(0)"))
  let t2530 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, N])")), @tactics.disch_tac), t2528), t2529), @tactics.all_tac])
  let t2527 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, N], IN(x, (s : (Cart[Real, N]) -> Bool)) → real_of_num(0) <= op_dollar(x, 1)"), fn(x2524 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2525 = @tactics.assume_tac(x2524)
    fn(x2526 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2525(x2526)
    }
  })
  let t2522 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @real.real_lt_01()]))
  let t2520 = @simp.asm_rewrite_tac(@list.List([]))
  let t2521 = @list.List([@meson.asm_meson_tac(@list.List([@misc.hull_subset(), @sets.subset()])), t2520])
  let t2519 = @tactics.subgoal_then(@term_syntax.parse_term("IN((x : Cart[Real, N]), hull(affine, (p : (Cart[Real, N]) -> Bool)))"), fn(x2516 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2517 = @tactics.mp_tac(x2516)
    fn(x2518 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2517(x2518)
    }
  })
  let t2515 = @tactics.match_mp_tac(@real.real_lt_mul())
  let t2514 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_component()]))
  let t2513 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2511 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t2512 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c : Real)"), t2511]))
  let t2510 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec(), @vectors.vector_mul_eq_0(), @class.de_morgan_thm()]))
  let t2509 = @simp.rewrite_tac(@list.List([@convex.conic_hull_explicit(), @theorems.imp_conj()]))
  let t2523 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("s"), t2509), t2510), t2512), t2513), t2514), t2515), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t2519), t2521), t2522), @tactics.all_tac])
  let t2508 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, N], IN(x, (s : (Cart[Real, N]) -> Bool)) && !(x == vec(0)) → real_of_num(0) < op_dollar(x, 1)"), fn(x2505 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2506 = @tactics.assume_tac(x2505)
    fn(x2507 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2506(x2507)
    }
  })
  let t2504 = @simp.asm_rewrite_tac(@list.List([]))
  let t2500 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm(), @vectors.vec_component()]))
  let t2499 = @tactics.exists_tac(@term_syntax.parse_term("(vec : (Num) -> Cart[Real, N])(0)"))
  let t2501 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @class.not_forall_thm(), @class.not_imp()])), t2499), t2500), @calc_rat.real_arith_tac)
  let t2496 = @simp.simp_tac(@list.List([@vectors.basis_nonzero(), @vectors.dot_basis(), @cart.dimindex_ge_1(), @arith.le_refl()]))
  let t2494 = @term_syntax.parse_term("real_of_num(1)")
  let t2495 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(basis : (Num) -> Cart[Real, N])(1)"), t2494]), @convex.affine_hyperplane()))
  let t2493 = @simp.rewrite_tac(@list.List([@convex.affine_hull_eq(), @convex.affine_hyperplane()]))
  let t2490 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("PSUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → (s' : (_) -> Bool) == s && (t' : (_) -> Bool) == t → PSUBSET(s', t')")))
  let t2492 = @tactics.first_x_assum(fn(x2491 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2490(x2491))
  })
  let t2489 = @tactics.match_mp_tac(@convex.aff_dim_psubset())
  let t2488 = @tactics.match_mp_tac(@int.int_arith(@term_syntax.parse_term("(a : Int) < (b : Int) → a == (n : Int) → !(b == n)")))
  let t2487 = @simp.asm_simp_tac(@list.List([@vectors.basis_nonzero(), @vectors.dot_basis(), @cart.dimindex_ge_1(), @arith.le_refl()]))
  let t2485 = @term_syntax.parse_term("real_of_num(1)")
  let t2486 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(basis : (Num) -> Cart[Real, N])(1)"), t2485]), @convex.aff_dim_hyperplane()))
  let t2484 = @term_syntax.parse_term("(b : Real)")
  let t2497 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t2484]), @convex.aff_dim_hyperplane()))), t2486), t2487), t2488), t2489), t2492), t2493), t2495), t2496)
  let t2483 = @meson.asm_meson_tac(@list.List([@misc.hull_subset()]))
  let t2482 = @simp.asm_rewrite_tac(@list.List([]))
  let t2481 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"))
  let t2480 = @tactics.match_mp_tac(@sets.subset_trans())
  let t2479 = @simp.rewrite_tac(@list.List([@convex.affine_hyperplane()]))
  let t2478 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t2498 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2473 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2473
    @simp.gen_rewrite_tac(fn(x2475 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s2476 = @equal.land_conv(x2475)
      fn(x2477 : @kernel.Term) -> @kernel.Thm raise {
        s2476(x2477)
      }
    }, @list.List([@equal.sym(th_1)]))
  }), t2478), t2479), t2480), t2481), t2482), t2483), t2497])
  let t2471 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (h' : (_) -> Bool)) → SUBSET((h : (_) -> Bool), h') && !PSUBSET(h, h') → SUBSET(s, h)")))
  let t2502 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.first_assum(fn(x2472 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2471(x2472))
  }), @tactics.conj_tac), t2498), t2501])
  let t2470 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET((s : (Cart[Real, N]) -> Bool), {(x : Cart[Real, N]) | op_dollar(x, 1) == real_of_num(1)})"), fn(x2467 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2468 = @tactics.mp_tac(x2467)
    fn(x2469 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2468(x2469)
    }
  })
  let t2465 = @term_syntax.parse_term("(b : Real)")
  let t2466 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, N])"), t2465]))
  let t2464 = @simp.asm_rewrite_tac(@list.List([@class.not_exists_thm()]))
  let t2503 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), @convex.empty_interior_subset_hyperplane()))), t2464), t2466), @tactics.strip_tac), t2470), t2502), @tactics.all_tac])
  let t2463 = @tactics.subgoal_then(@term_syntax.parse_term("!(interior((s : (Cart[Real, N]) -> Bool)) == {})"), fn(x2460 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2461 = @tactics.assume_tac(x2460)
    fn(x2462 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2461(x2462)
    }
  })
  let t2459 = @simp.asm_rewrite_tac(@list.List([]))
  let t2458 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), @convex.conic_contains_0()))
  let t2457 = @list.List([@meson.asm_meson_tac(@list.List([@convex.conic_hull_eq_empty()])), @tactics.all_tac])
  let t2456 = @tactics.subgoal_then(@term_syntax.parse_term("!((s : (Cart[Real, N]) -> Bool) == {})"), fn(x2453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2454 = @tactics.assume_tac(x2453)
    fn(x2455 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2454(x2455)
    }
  })
  let t2451 = @simp.asm_simp_tac(@list.List([@calc_num.arith(), @cart.lambda_beta(), @cart.dimindex_ge_1(), @arith.le_refl()]))
  let t2449 = @term_syntax.parse_term("2")
  let t2450 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(lambda : ((Num) -> Real) -> Cart[Real, N])((i : Num) => if i == 1 { real_of_num(1) } else { (B : Real) + real_of_num(1) })"), t2449]), @vectors.component_le_norm()))
  let t2448 = @simp.rewrite_tac(@list.List([@real.real_not_le()]))
  let t2447 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @cart.dimindex_ge_1(), @arith.le_refl(), @sets.in_elim_thm()]))
  let t2443 = @term_syntax.parse_term("(lambda : ((Num) -> Real) -> Cart[Real, N])((i : Num) => if i == 1 { real_of_num(1) } else { (B : Real) + real_of_num(1) })")
  let t2446 = @tactics.disch_then(fn(x2445 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2440 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2441 = @tactics.mp_tac(x2440)
      fn(x2442 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2441(x2442)
      }
    })(((x2444 : @kernel.Thm) => @bool.spec(t2443, x2444))(x2445))
  })
  let t2439 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2433 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2434 = @tactics.assume_tac(x2433)
    fn(x2435 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2434(x2435)
    }
  }, fn(x2436 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2437 = @tactics.mp_tac(x2436)
    fn(x2438 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2437(x2438)
    }
  }))
  let t2432 = @tactics.x_gen_tac(@term_syntax.parse_term("(B : Real)"))
  let t2431 = @simp.rewrite_tac(@list.List([@topology.bounded_pos(), @class.not_exists_thm()]))
  let t2428 = @drule.match_mp(@polytope.polytope_imp_bounded())
  let t2430 = @tactics.disch_then(fn(x2429 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2426 = @tactics.mp_tac(x2425)
      fn(x2427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2426(x2427)
      }
    })(t2428(x2429))
  })
  let t2424 = @simp.asm_rewrite_tac(@list.List([]))
  let t2423 = @tactics.undisch_tac(@term_syntax.parse_term("polytope((p : (Cart[Real, N]) -> Bool))"))
  let t2422 = @tactics.disch_then(fn(x2421 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2418 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2419 = @tactics.assume_tac(x2418)
      fn(x2420 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2419(x2420)
      }
    })(@equal.sym(x2421))
  })
  let t2417 = @simp.asm_rewrite_tac(@list.List([@sets.inter_univ()]))
  let t2416 = @list.List([@meson.asm_meson_tac(@list.List([@misc.hull_subset()])), @tactics.all_tac])
  let t2413 = @term_syntax.parse_term("(p : (Cart[Real, N]) -> Bool)")
  let t2452 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.first_x_assum(fn(x2415 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2410 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2411 = @tactics.mp_tac(x2410)
      fn(x2412 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2411(x2412)
      }
    })(((x2414 : @kernel.Thm) => @bool.spec(t2413, x2414))(x2415))
  })), @tactics.ants_tac), t2416), t2417), t2422), t2423), t2424), t2430), t2431), t2432), t2439), t2446), t2447), t2448), t2450), t2451), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2409 = @tactics.subgoal_then(@term_syntax.parse_term("!((s : (Cart[Real, N]) -> Bool) == UNIV)"), fn(x2406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2407 = @tactics.assume_tac(x2406)
    fn(x2408 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2407(x2408)
    }
  })
  let t2405 = @list.List([@meson.asm_meson_tac(@list.List([@convex.conic_conic_hull()])), @tactics.all_tac])
  let t2404 = @tactics.subgoal_then(@term_syntax.parse_term("conic((s : (Cart[Real, N]) -> Bool))"), fn(x2401 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2402 = @tactics.assume_tac(x2401)
    fn(x2403 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2402(x2403)
    }
  })
  let t2398 = @drule.match_mp(@polytope.polyhedron_imp_convex())
  let t2400 = @tactics.first_assum(fn(x2399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2395 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2396 = @tactics.assume_tac(x2395)
      fn(x2397 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2396(x2397)
      }
    })(t2398(x2399))
  })
  let t2393 = @simp.asm_rewrite_tac(@list.List([]))
  let t2392 = @tactics.match_mp_tac(@polytope.polyhedron_convex_cone_hull())
  let t2391 = @tactics.disch_then(fn(x2390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2387 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2388 = @tactics.subst1_tac(x2387)
      fn(x2389 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2388(x2389)
      }
    })(@equal.sym(x2390))
  })
  let t2386 = @list.List([@meson.asm_meson_tac(@list.List([@convex.convex_hull_eq_empty()])), @tactics.all_tac])
  let t2385 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(k : (Cart[Real, N]) -> Bool)"), @convex.convex_cone_hull_separate_nonempty()))
  let t2384 = @tactics.disch_then(fn(x2381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2381
    let t2383 = @tactics.assume_tac(th)
    @tactics.then_tac(@tactics.subst1_tac(th), t2383)
  })
  let t2380 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2374 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2375 = @tactics.assume_tac(x2374)
    fn(x2376 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2375(x2376)
    }
  }, fn(x2377 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2378 = @tactics.mp_tac(x2377)
    fn(x2379 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2378(x2379)
    }
  }))
  let t2370 = @simp.gen_rewrite_rule(fn(x2369 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2369
  }, @list.List([@polytope.polytope()]))
  let t2371 = @tactics.x_choose_then(@term_syntax.parse_term("(k : (Cart[Real, N]) -> Bool)"))(fn(x2366 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2367 = @tactics.mp_tac(x2366)
    fn(x2368 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2367(x2368)
    }
  })
  let t2373 = @tactics.first_x_assum(fn(x2372 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t2371(t2370(x2372))
  })
  let t2394 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("s"), t2373), t2380), t2384), t2385), @tactics.ants_tac), t2386), t2391), t2392), t2393), @tactics.all_tac])
  let t2365 = @tactics.subgoal_then(@term_syntax.parse_term("polyhedron((s : (Cart[Real, N]) -> Bool))"), fn(x2362 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2363 = @tactics.assume_tac(x2362)
    fn(x2364 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2363(x2364)
    }
  })
  let t2360 = @simp.asm_simp_tac(@list.List([@vectors.vector_mul_component(), @realarith.real_mul_rid(), @vectors.vector_mul_lid()]))
  let t2359 = @simp.asm_rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t2355 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t2358 = @tactics.disch_then(fn(x2357 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2353 = @tactics.mp_tac(x2352)
      fn(x2354 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2353(x2354)
      }
    })(((x2356 : @kernel.Thm) => @bool.spec(t2355, x2356))(x2357))
  })
  let t2349 = @simp.gen_rewrite_rule(fn(x2348 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2348
  }, @list.List([@sets.subset()]))
  let t2351 = @tactics.first_x_assum(fn(x2350 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2345 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2346 = @tactics.mp_tac(x2345)
      fn(x2347 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2346(x2347)
      }
    })(t2349(x2350))
  })
  let t2343 = @term_syntax.parse_term("(x : Cart[Real, N])")
  let t2344 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(c : Real)"), t2343]))
  let t2342 = @simp.rewrite_tac(@list.List([@sets.forall_in_gspec()]))
  let t2341 = @simp.rewrite_tac(@list.List([@sets.subset(), @convex.conic_hull_explicit(), @sets.in_inter(), @theorems.imp_conj()]))
  let t2340 = @simp.asm_simp_tac(@list.List([@misc.hull_subset(), @sets.subset_inter()]))
  let t2339 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t2361 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t2339), t2340), t2341), t2342), t2344), @tactics.disch_tac), t2351), t2358), t2359), t2360), @tactics.all_tac])
  let t2338 = @tactics.subgoal_then(@term_syntax.parse_term("∀ f : (Cart[Real, N]) -> Bool, SUBSET(f, {(x : Cart[Real, N]) | op_dollar(x, 1) == real_of_num(1)}) → INTER(hull(conic, f), {(x : Cart[Real, N]) | op_dollar(x, 1) == real_of_num(1)}) == f"), fn(x2335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2336 = @tactics.assume_tac(x2335)
    fn(x2337 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2336(x2337)
    }
  })
  let t2334 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool)"), euler_polyhedral_cone()))
  let t2333 = @simp.abbrev_tac(@term_syntax.parse_term("(s : (Cart[Real, N]) -> Bool) == hull(conic, (p : (Cart[Real, N]) -> Bool))"))
  let t2331 = @simp.simp_tac(@list.List([@int.int_of_num_eq(), @arith.le_1(), @cart.dimindex_ge_1()]))
  let t2330 = @simp.rewrite_tac(@list.List([@int.int_arith(@term_syntax.parse_term("(-int_of_num(1) == (x : Int) - int_of_num(1)) == (x == int_of_num(0))"))]))
  let t2332 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@convex.aff_dim_empty()])), t2330), t2331), @tactics.disch_tac])
  let t2329 = @class.asm_cases_tac(@term_syntax.parse_term("(p : (Cart[Real, N]) -> Bool) == {}"))
  let t2328 = @simp.rewrite_tac(@list.List([@convex.aff_dim_affine_hull()]))
  let t2327 = @tactics.first_assum(fn(x2326 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2323 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2324 = @tactics.subst1_tac(x2323)
      fn(x2325 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2324(x2325)
      }
    })(@equal.sym(x2326))
  })
  let t2322 = @simp.simp_tac(@list.List([@vectors.basis_nonzero(), @vectors.dot_basis(), @cart.dimindex_ge_1(), @arith.le_refl()]))
  let t2320 = @term_syntax.parse_term("real_of_num(1)")
  let t2321 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(basis : (Num) -> Cart[Real, N])(1)"), t2320]), @convex.aff_dim_hyperplane()))
  let t3072 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2321), t2322), t2327), t2328), t2329), t2332), t2333), t2334), t2338), t2361), t2365), t2394), t2400), t2404), t2405), t2409), t2452), t2456), t2457), t2458), t2459), @tactics.disch_tac), t2463), t2503), t2504), t2508), t2523), t2527), t2530), fn(x2541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2540 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2538 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2537 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x2536 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x2531 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s2532 = @tactics.mp_tac(x2531)
              fn(x2533 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s2532(x2533)
              }
            })(t2535(x2536))
          })(@equal.lhand(x2537))
        })(@equal.lhand(x2538))
      })((fn(x2539 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2539.1
      })(x2540))
    })(x2541)(x2541)
  }), t2542), t2546), t2547), t2550), t2601), t2602), t2603), t2613), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t2614), t2615), t2616), @tactics.strip_tac), t2617), @tactics.ap_term_tac), t2618), @tactics.ap_term_tac), @tactics.ap_term_tac), t2619), t2620), t2621), t2622), @tactics.conj_tac), t2627), t2631), t2638), t2642), t2651), t2655), t2687), t2691), t2995), t3000), t3043), t3044), @tactics.strip_tac), t3045), @tactics.conj_tac), t3071)
  euler_poincare_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, N]) -> Bool, 2 <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (polytope : ((Cart[Real, N]) -> Bool) -> Bool)(p) && (hull : (((Cart[Real, N]) -> Bool) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)((affine : ((Cart[Real, N]) -> Bool) -> Bool), p) == {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, 1) == real_of_num(1)} → (sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(0, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) - 1), (d : Num) => pow(-real_of_num(1), d) * real_of_num((CARD : (((Cart[Real, N]) -> Bool) -> Bool) -> Num)({(f : (Cart[Real, N]) -> Bool) | (face_of : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(f, p) && (aff_dim : ((Cart[Real, N]) -> Bool) -> Int)(f) == int_of_num(d)}))) == real_of_num(1)"), t3072))
}

///|
let euler_poincare_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_POINCARE_LEMMA")

///|
/// `EULER_POINCARE_LEMMA`
pub fn euler_poincare_lemma() -> @kernel.Thm {
  euler_poincare_lemma_c.get()
}

///|
/// EULER_POINCARE_SPECIAL
fn step_57() -> Unit raise {
  let t3103 = @sets.set_tac(@list.List([]))
  let t3102 = @simp.asm_simp_tac(@list.List([@polytope.finite_polytope_faces()]))
  let t3101 = @tactics.exists_tac(@term_syntax.parse_term("{(f : (Cart[Real, N]) -> Bool) | face_of(f, (p : (Cart[Real, N]) -> Bool))}"))
  let t3104 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t3101), t3102), t3103)
  let t3100 = @simp.rewrite_tac(@list.List([@sets.injective_image()]))
  let t3099 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, (Q : (_, _) -> Bool)(x, y) → x == y) → (∀ x : _, ∀ y : _, (P : (_) -> Bool)(x) && P(y) && Q(x, y) → x == y)")))
  let t3105 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([])), t3099), t3100), @vectors.vector_arith_tac), t3104])
  let t3098 = @tactics.match_mp_tac(@sets.card_image_inj())
  let t3097 = @tactics.conv_tac(@equal.sym_conv)
  let t3096 = @simp.gen_rewrite_tac(fn(x3095 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3089 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3090 = @equal.rand_conv(x3089)
      fn(x3091 : @kernel.Term) -> @kernel.Thm raise {
        s3090(x3091)
      }
    })((fn(x3092 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3093 = @equal.rand_conv(x3092)
      fn(x3094 : @kernel.Term) -> @kernel.Thm raise {
        s3093(x3094)
      }
    })(x3095))
  }, @list.List([@sets.simple_image_gen()]))
  let t3088 = @simp.rewrite_tac(@list.List([]))
  let t3087 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t3086 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t3085 = @tactics.disch_then(fn(x3080 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3080
    @simp.gen_rewrite_tac(fn(x3082 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3083 = @equal.rand_conv(x3082)
      fn(x3084 : @kernel.Term) -> @kernel.Thm raise {
        s3083(x3084)
      }
    }, @list.List([@equal.sym(th)]))
  })
  let t3079 = @simp.rewrite_tac(@list.List([@convex.aff_dim_translation_eq(), @sets.in_elim_thm()]))
  let t3078 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(y : _) | IN(y, IMAGE((f : (_) -> _), (s : (_) -> Bool))) && (P : (_) -> Bool)(y)} == {f(x) | x : _ | IN(x, s) && P(f(x))}"))]))
  let t3077 = @simp.rewrite_tac(@list.List([@polytope.faces_of_translation()]))
  let t3106 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (Cart[Real, _]) -> Bool) | face_of(f, (s : (Cart[Real, _]) -> Bool)) && (P : ((Cart[Real, _]) -> Bool) -> Bool)(f)} == {(f : (Cart[Real, _]) -> Bool) | IN(f, {(f : (Cart[Real, _]) -> Bool) | face_of(f, s)}) && P(f)}"))])), t3077), t3078), t3079), t3085), t3086), t3087), @tactics.strip_tac), t3088), @tactics.ap_term_tac), @tactics.ap_term_tac), t3096), t3097), t3098), @tactics.conj_tac), t3105)
  let t3076 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @vectors.vector_add_component(), @vectors.basis_component(), @cart.dimindex_ge_1(), @arith.le_refl()]))
  let t3075 = @simp.rewrite_tac(@list.List([@theorems.exists_refl(), @vectors.vector_arith(@term_syntax.parse_term("((a : Cart[Real, N]) + (x : Cart[Real, N]) == (y : Cart[Real, N])) == (x == y - a)"))]))
  let t3107 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.surjective_image_eq()), t3075), t3076), @calc_rat.real_arith_tac), t3106])
  let t3074 = @simp.asm_rewrite_tac(@list.List([@polytope.polytope_translation_eq(), @convex.affine_hull_translation()]))
  let t3073 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("IMAGE((x : Cart[Real, N]) => basis(1) + x, (p : (Cart[Real, N]) -> Bool))"), euler_poincare_lemma()))
  let t3108 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3073), t3074), @tactics.ants_tac), t3107)
  euler_poincare_special_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, N]) -> Bool, 2 <= (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) && (polytope : ((Cart[Real, N]) -> Bool) -> Bool)(p) && (hull : (((Cart[Real, N]) -> Bool) -> Bool, (Cart[Real, N]) -> Bool, Cart[Real, N]) -> Bool)((affine : ((Cart[Real, N]) -> Bool) -> Bool), p) == {(x : Cart[Real, N]) | (op_dollar : (Cart[Real, N], Num) -> Real)(x, 1) == real_of_num(0)} → (sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(0, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool)) - 1), (d : Num) => pow(-real_of_num(1), d) * real_of_num((CARD : (((Cart[Real, N]) -> Bool) -> Bool) -> Num)({(f : (Cart[Real, N]) -> Bool) | (face_of : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(f, p) && (aff_dim : ((Cart[Real, N]) -> Bool) -> Int)(f) == int_of_num(d)}))) == real_of_num(1)"), t3108))
}

///|
let euler_poincare_special_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_POINCARE_SPECIAL")

///|
/// `EULER_POINCARE_SPECIAL`
pub fn euler_poincare_special() -> @kernel.Thm {
  euler_poincare_special_c.get()
}

///|
/// EULER_POINCARE_FULL
fn step_58() -> Unit raise {
  let t3191 = @sets.set_tac(@list.List([]))
  let t3190 = @simp.asm_simp_tac(@list.List([@polytope.finite_polytope_faces()]))
  let t3189 = @tactics.exists_tac(@term_syntax.parse_term("{(f : (Cart[Real, N]) -> Bool) | face_of(f, (p : (Cart[Real, N]) -> Bool))}"))
  let t3192 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_subset()), t3189), t3190), t3191)
  let t3188 = @simp.asm_rewrite_tac(@list.List([@sets.injective_image()]))
  let t3187 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, ∀ y : _, (Q : (_, _) -> Bool)(x, y) → x == y) → (∀ x : _, ∀ y : _, (P : (_) -> Bool)(x) && P(y) && Q(x, y) → x == y)")))
  let t3193 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([])), t3187), t3188), t3192])
  let t3186 = @tactics.match_mp_tac(@sets.card_image_inj())
  let t3185 = @tactics.conv_tac(@equal.sym_conv)
  let t3184 = @simp.gen_rewrite_tac(fn(x3183 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3177 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3178 = @equal.rand_conv(x3177)
      fn(x3179 : @kernel.Term) -> @kernel.Thm raise {
        s3178(x3179)
      }
    })((fn(x3180 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3181 = @equal.rand_conv(x3180)
      fn(x3182 : @kernel.Term) -> @kernel.Thm raise {
        s3181(x3182)
      }
    })(x3183))
  }, @list.List([@sets.simple_image_gen()]))
  let t3176 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm()]))
  let t3175 = @simp.asm_simp_tac(@list.List([@convex.aff_dim_injective_linear_image()]))
  let t3174 = @simp.asm_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(y : _) | IN(y, IMAGE((f : (_) -> _), (s : (_) -> Bool))) && (P : (_) -> Bool)(y)} == {f(x) | x : _ | IN(x, s) && P(f(x))}"))]))
  let t3173 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("{(f : (Cart[Real, _]) -> Bool) | face_of(f, (s : (Cart[Real, _]) -> Bool)) && (P : ((Cart[Real, _]) -> Bool) -> Bool)(f)} == {(f : (Cart[Real, _]) -> Bool) | IN(f, {(f : (Cart[Real, _]) -> Bool) | face_of(f, s)}) && P(f)}"))]))
  let t3172 = @simp.asm_rewrite_tac(@list.List([]))
  let t3170 = @term_syntax.parse_term("(p : (Cart[Real, N]) -> Bool)")
  let t3171 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, N]) -> Cart[Real, Finite_sum[N, Unit]])"), t3170]), @polytope.faces_of_linear_image()))
  let t3169 = @simp.expand_tac("s")
  let t3165 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3164 = @simp.asm_rewrite_tac(@list.List([]))
  let t3166 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @class.cond_cases_tac), t3164), t3165), @int.asm_arith_tac)
  let t3163 = @simp.asm_rewrite_tac(@list.List([]))
  let t3162 = @simp.rewrite_tac(@list.List([@arith.add_sub()]))
  let t3158 = @term_syntax.parse_term("(i : Num) + 1")
  let t3161 = @tactics.first_x_assum(fn(x3160 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3155 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3156 = @tactics.mp_tac(x3155)
      fn(x3157 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3156(x3157)
      }
    })(((x3159 : @kernel.Thm) => @bool.spec(t3158, x3159))(x3160))
  })
  let t3167 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3161), @tactics.ants_tac), @list.List([@int.asm_arith_tac, @tactics.all_tac])), t3162), @class.cond_cases_tac), t3163), @int.asm_arith_tac), t3166])
  let t3154 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t3153 = @tactics.repeat_tac(@tactics.gen_tac)
  let t3151 = @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) && (i : Num) <= n + 1 → i - 1 <= n"))
  let t3152 = @simp.asm_simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), @cart.dimindex_finite_sum(), @cart.dimindex_1(), @cart.dimindex_ge_1(), @int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) && !(i == 1) → 1 <= i - 1")), t3151]))
  let t3168 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("f"), t3152), t3153), @tactics.eq_tac), @tactics.disch_tac), t3154), t3167), @tactics.all_tac])
  let t3150 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, N], ∀ y : Cart[Real, N], ((f : (Cart[Real, N]) -> Cart[Real, Finite_sum[N, Unit]])(x) == f(y)) == (x == y)"), fn(x3147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3148 = @tactics.assume_tac(x3147)
    fn(x3149 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3148(x3149)
    }
  })
  let t3146 = @simp.rewrite_tac(@list.List([]))
  let t3145 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Num)"))
  let t3144 = @tactics.match_mp_tac(@iterate.sum_eq_numseg())
  let t3194 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x3139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3139
    @simp.gen_rewrite_tac(fn(x3141 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3142 = @equal.rand_conv(x3141)
      fn(x3143 : @kernel.Term) -> @kernel.Thm raise {
        s3142(x3143)
      }
    }, @list.List([@equal.sym(th)]))
  }), t3144), t3145), @tactics.strip_tac), t3146), @tactics.ap_term_tac), @tactics.ap_term_tac), t3150), t3168), t3169), t3171), t3172), @tactics.disch_tac), t3173), t3174), t3175), t3176), t3184), t3185), t3186), @tactics.conj_tac), t3193)
  let t3136 = @simp.asm_rewrite_tac(@list.List([]))
  let t3134 = @int.arith_rule(@term_syntax.parse_term("1 <= (n : Num) && (i : Num) <= n + 1 → i - 1 <= n"))
  let t3135 = @simp.asm_simp_tac(@list.List([@cart.cart_eq(), @cart.lambda_beta(), @cart.dimindex_finite_sum(), @cart.dimindex_1(), @cart.dimindex_ge_1(), @int.arith_rule(@term_syntax.parse_term("1 <= (i : Num) && !(i == 1) → 1 <= i - 1")), t3134]))
  let t3133 = @tactics.x_gen_tac(@term_syntax.parse_term("(i : Num)"))
  let t3132 = @simp.rewrite_tac(@list.List([@cart.cart_eq(), @cart.dimindex_finite_sum(), @cart.dimindex_1()]))
  let t3131 = @simp.expand_tac("f")
  let t3137 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.exists_tac(@term_syntax.parse_term("(lambda : ((Num) -> Real) -> Cart[Real, N])((i : Num) => (op_dollar : (Cart[Real, Finite_sum[N, Unit]], Num) -> Real)((y : Cart[Real, Finite_sum[N, Unit]]), i + 1))"))), t3131), t3132), t3133), @tactics.strip_tac), t3135), @class.cond_cases_tac), t3136), @tactics.ap_term_tac), @int.asm_arith_tac)
  let t3130 = @simp.simp_tac(@list.List([@cart.lambda_beta(), @arith.le_refl(), @cart.dimindex_ge_1()]))
  let t3129 = @simp.expand_tac("f")
  let t3138 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Cart[Real, N])"))(fn(x3126 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3127 = @tactics.subst1_tac(x3126)
    fn(x3128 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3127(x3128)
    }
  })), t3129), t3130), t3137])
  let t3125 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, Finite_sum[N, Unit]])"))
  let t3195 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_image(), @sets.in_elim_thm(), @sets.in_univ()])), t3125), @tactics.eq_tac), t3138), t3194])
  let t3124 = @simp.asm_rewrite_tac(@list.List([]))
  let t3123 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@convex.aff_dim_eq_full()])))
  let t3122 = @simp.asm_simp_tac(@list.List([@polytope.polytope_linear_image(), @convex.affine_hull_linear_image()]))
  let t3121 = @simp.expand_tac("s")
  let t3119 = @simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.vector_add_component(), @vectors.vector_mul_component(), @cart.lambda_beta()]))
  let t3118 = @simp.rewrite_tac(@list.List([@vectors.linear()]))
  let t3120 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("f"), t3118), t3119), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t3117 = @tactics.subgoal_then(@term_syntax.parse_term("linear((f : (Cart[Real, N]) -> Cart[Real, Finite_sum[N, Unit]]))"), fn(x3114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3115 = @tactics.assume_tac(x3114)
    fn(x3116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3115(x3116)
    }
  })
  let t3113 = @simp.rewrite_tac(@list.List([@cart.dimindex_ge_1(), @int.arith_rule(@term_syntax.parse_term("(2 <= (n : Num) + 1) == (1 <= n)"))]))
  let t3112 = @simp.rewrite_tac(@list.List([@cart.dimindex_finite_sum(), @cart.dimindex_1(), @arith.add_sub()]))
  let t3111 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(s : (Cart[Real, Finite_sum[N, Unit]]) -> Bool)"), euler_poincare_special()))
  let t3110 = @simp.abbrev_tac(@term_syntax.parse_term("(s : (Cart[Real, Finite_sum[N, Unit]]) -> Bool) == IMAGE((f : (Cart[Real, N]) -> Cart[Real, Finite_sum[N, Unit]]), (p : (Cart[Real, N]) -> Bool))"))
  let t3109 = @simp.abbrev_tac(@term_syntax.parse_term("(f : (Cart[Real, N]) -> Cart[Real, Finite_sum[N, Unit]]) == ((x : Cart[Real, N]) => lambda((i : Num) => if i == 1 { real_of_num(0) } else { op_dollar(x, i - 1) }))"))
  let t3196 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3109), t3110), t3111), t3112), t3113), t3117), t3120), t3121), t3122), t3123), t3124), @tactics.ants_tac), t3195)
  euler_poincare_full_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, N]) -> Bool, (polytope : ((Cart[Real, N]) -> Bool) -> Bool)(p) && (aff_dim : ((Cart[Real, N]) -> Bool) -> Int)(p) == int_of_num((dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))) → (sum : ((Num) -> Bool, (Num) -> Real) -> Real)(op_dot_dot(0, (dimindex : ((N) -> Bool) -> Num)((UNIV : (N) -> Bool))), (d : Num) => pow(-real_of_num(1), d) * real_of_num((CARD : (((Cart[Real, N]) -> Bool) -> Bool) -> Num)({(f : (Cart[Real, N]) -> Bool) | (face_of : ((Cart[Real, N]) -> Bool, (Cart[Real, N]) -> Bool) -> Bool)(f, p) && (aff_dim : ((Cart[Real, N]) -> Bool) -> Int)(f) == int_of_num(d)}))) == real_of_num(1)"), t3196))
}

///|
let euler_poincare_full_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_POINCARE_FULL")

///|
/// `EULER_POINCARE_FULL`
pub fn euler_poincare_full() -> @kernel.Thm {
  euler_poincare_full_c.get()
}

///|
/// EULER_RELATION
fn step_59() -> Unit raise {
  let t3218 = @simp.rewrite_tac(@list.List([@arith.add_sub2()]))
  let t3217 = @tactics.disch_then(fn(x3214 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3215 = @tactics.subst1_tac(x3214)
    fn(x3216 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3215(x3216)
    }
  })
  let t3213 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_eq()]))
  let t3212 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) + -(y : Real) + (z : Real) + -real_of_num(1) == real_of_num(1)) == (x + z == y + real_of_num(2))"))]))
  let t3219 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_of_num_suc()), @realax.real_add_lid()])), t3212), t3213), t3217), t3218)
  let t3211 = @simp.asm_simp_tac(@list.List([@polytope.polytope_imp_convex(), @int.int_lt_refl()]))
  let t3209 = @term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)")
  let t3210 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, 3]) -> Bool)"), t3209]), @polytope.face_of_aff_dim_lt()))
  let t3208 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (Cart[Real, 3]) -> Bool)"))
  let t3207 = @simp.asm_simp_tac(@list.List([@polytope.face_of_refl(), @polytope.polytope_imp_convex()]))
  let t3220 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(P : (_) -> Bool)((a : _)) && (∀ x : _, P(x) → x == a) → {(x : _) | P(x)} == {a}"))), t3207), t3208), @tactics.strip_tac), t3210), t3211), t3219])
  let t3206 = @tactics.subgoal_then(@term_syntax.parse_term("{(f : (Cart[Real, 3]) -> Bool) | face_of(f, (p : (Cart[Real, 3]) -> Bool)) && aff_dim(f) == int_of_num(3)} == {p}"), fn(x3204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3204
    @simp.simp_tac(@list.List([th, @sets.not_in_empty(), @sets.finite_empty(), @sets.card_clauses()]))
  })
  let t3203 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid(), @calc_int.real_mul_lneg()]))
  let t3202 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t3201 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t3199 = @term_syntax.parse_term("3")
  let t3200 = @simp.rewrite_tac(@list.List([@equal.top_depth_conv(@calc_num.num_conv)(t3199), @iterate.sum_clauses_numseg()]))
  let t3198 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_3()]))
  let t3197 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(p : (Cart[Real, 3]) -> Bool)"), euler_poincare_full()))
  let t3221 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3197), t3198), t3200), t3201), t3202), t3203), t3206), t3220)
  euler_relation_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : (Cart[Real, 3]) -> Bool, polytope(p) && aff_dim(p) == int_of_num(3) → CARD({(v : (Cart[Real, 3]) -> Bool) | face_of(v, p) && aff_dim(v) == int_of_num(0)}) + CARD({(f : (Cart[Real, 3]) -> Bool) | face_of(f, p) && aff_dim(f) == int_of_num(2)}) - CARD({(e : (Cart[Real, 3]) -> Bool) | face_of(e, p) && aff_dim(e) == int_of_num(1)}) == 2"), t3221))
}

///|
let euler_relation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("EULER_RELATION")

///|
/// `EULER_RELATION`
pub fn euler_relation() -> @kernel.Thm {
  euler_relation_c.get()
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
}
