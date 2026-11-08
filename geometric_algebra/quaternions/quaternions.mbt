// Translated from upstream Geometric_Algebra/quaternions.ml; edit this file directly.

///|
/// DIMINDEX_GA010
fn step_1() -> Unit raise {
  let t1 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.dimindex_2(), @geometricalgebra.dimindex_geomalg(), @geometricalgebra.pdimindex_0(), @geometricalgebra.pdimindex_1()])), @int.arith_tac)
  dimindex_ga010_c.set(@tactics.prove(@term_syntax.parse_term("(dimindex : ((Geomalg[Zero, One, Zero]) -> Bool) -> Num)((UNIV : (Geomalg[Zero, One, Zero]) -> Bool)) == (dimindex : ((2) -> Bool) -> Num)((UNIV : (2) -> Bool))"), t1))
}

///|
let dimindex_ga010_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_GA010")

///|
/// `DIMINDEX_GA010`
pub fn dimindex_ga010() -> @kernel.Thm {
  dimindex_ga010_c.get()
}

///|
/// COMPLEX_PRODUCT_GA010
fn step_2() -> Unit raise {
  let t31 = @tactics.conv_tac(@geometricalgebra.geom_arith)
  let t30 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), @sets.finite_insert(), @sets.finite_sing(), @sets.in_insert(), @sets.in_sing(), @sets.not_empty_insert(), @vectors.vsum_sing()]))
  let t27 = @sets.set_tac(@list.List([]))
  let t28 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.powerset_clauses()])), t27)
  let t29 = @simp.rewrite_tac(@list.List([@tactics.prove(@term_syntax.parse_term("{(s : (Num) -> Bool) | SUBSET(s, {1})} == {{}, {1}}"), t28)]))
  let t26 = @simp.rewrite_tac(@list.List([@geometricalgebra.pdimindex_0(), @geometricalgebra.pdimindex_1(), @arith.add_0(), @arith.add_sym(), @iterate.numseg_sing()]))
  let t25 = @simp.gen_rewrite_tac(fn(x24 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x20 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x14 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s15 = @equal.land_conv(x14)
        fn(x16 : @kernel.Term) -> @kernel.Thm raise {
          s15(x16)
        }
      })((fn(x17 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s18 = @equal.rand_conv(x17)
        fn(x19 : @kernel.Term) -> @kernel.Thm raise {
          s18(x19)
        }
      })(x20))
    })((fn(x21 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s22 = @equal.once_depth_conv(x21)
      fn(x23 : @kernel.Term) -> @kernel.Thm raise {
        s22(x23)
      }
    })(x24))
  }, @list.List([@equal.gsym(@geometricalgebra.mvbasis_expansion())]))
  let t13 = @simp.gen_rewrite_tac(fn(x12 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x8 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x2 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s3 = @equal.land_conv(x2)
        fn(x4 : @kernel.Term) -> @kernel.Thm raise {
          s3(x4)
        }
      })((fn(x5 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s6 = @equal.land_conv(x5)
        fn(x7 : @kernel.Term) -> @kernel.Thm raise {
          s6(x7)
        }
      })(x8))
    })((fn(x9 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s10 = @equal.once_depth_conv(x9)
      fn(x11 : @kernel.Term) -> @kernel.Thm raise {
        s10(x11)
      }
    })(x12))
  }, @list.List([@equal.gsym(@geometricalgebra.mvbasis_expansion())]))
  let t32 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t13), t25), t26), t29), t30), t31)
  complex_product_ga010_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[Zero, One, Zero]], ∀ y : Cart[Real, Geomalg[Zero, One, Zero]], x * y == op_pct(setindex(x, {}) * setindex(y, {}) - setindex(x, {1}) * setindex(y, {1}), mbasis({})) + op_pct(setindex(x, {}) * setindex(y, {1}) + setindex(x, {1}) * setindex(y, {}), mbasis({1}))"), t32))
}

///|
let complex_product_ga010_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COMPLEX_PRODUCT_GA010")

///|
/// `COMPLEX_PRODUCT_GA010`
pub fn complex_product_ga010() -> @kernel.Thm {
  complex_product_ga010_c.get()
}

///|
/// Geometric_Algebra/quaternions.ml:31
fn step_3() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, One, Zero]])({1}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, One, Zero]])({1}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, One, Zero]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:32
fn step_4() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Two, Zero, Zero]])({1, 2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Two, Zero, Zero]])({1, 2}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Two, Zero, Zero]])(({} : (Num) -> Bool))")))
}

///|
/// DIMINDEX_GA020
fn step_5() -> Unit raise {
  let t33 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@cart.dimindex_4(), @geometricalgebra.dimindex_geomalg(), @geometricalgebra.pdimindex_0(), @geometricalgebra.pdimindex_2()])), @int.arith_tac)
  dimindex_ga020_c.set(@tactics.prove(@term_syntax.parse_term("(dimindex : ((Geomalg[Zero, Two, Zero]) -> Bool) -> Num)((UNIV : (Geomalg[Zero, Two, Zero]) -> Bool)) == (dimindex : ((4) -> Bool) -> Num)((UNIV : (4) -> Bool))"), t33))
}

///|
let dimindex_ga020_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIMINDEX_GA020")

///|
/// `DIMINDEX_GA020`
pub fn dimindex_ga020() -> @kernel.Thm {
  dimindex_ga020_c.get()
}

///|
/// QUAT_PRODUCT_GA020
fn step_6() -> Unit raise {
  let t92 = @tactics.conv_tac(@geometricalgebra.geom_arith)
  let t89 = @meson.meson_tac(@list.List([]))
  let t90 = @tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, (∀ x : Num, (x == a) == (x == a || x == b)) == (a == b)"), t89)
  let t88 = @meson.meson_tac(@list.List([]))
  let t91 = @simp.rewrite_tac(@list.List([@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, (∀ x : Num, (x == a) == (x == b)) == (a == b)"), t88), t90, @theorems.disj_sym(), @calc_num.arith_eq()]))
  let t87 = @simp.simp_tac(@list.List([@sets.extension(), @sets.in_insert(), @sets.not_in_empty()]))
  let t86 = @simp.simp_tac(@list.List([@vectors.vsum_clauses(), @sets.finite_insert(), @sets.finite_sing(), @sets.in_insert(), @sets.in_sing(), @sets.not_empty_insert(), @vectors.vsum_sing()]))
  let t83 = @simp.asm_rewrite_tac(@list.List([]))
  let t82 = @tactics.exists_tac(@term_syntax.parse_term("({} : (Num) -> Bool)"))
  let t81 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t80 = @simp.asm_rewrite_tac(@list.List([]))
  let t77 = @tactics.exists_tac(@term_syntax.parse_term("{1}"))
  let t78 = @tactics.exists_tac(@term_syntax.parse_term("({} : (Num) -> Bool)"))
  let t79 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("({} : (Num) -> Bool)")), t78, t77])
  let t75 = @sets.set_tac(@list.List([]))
  let t76 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac, t75, @tactics.all_tac])
  let t74 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p1 : Bool) == (q1 : Bool) && (p2 : Bool) == (q2 : Bool) → (p1 || p2) == (q1 || q2)")))
  let t73 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t72 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p1 : Bool) == (q1 : Bool) && (p2 : Bool) == (q2 : Bool) → (p1 || p2) == (q1 || q2)")))
  let t71 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.disj_assoc())]))
  let t70 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_image(), @sets.in_insert(), @sets.not_in_empty()]))
  let t69 = @simp.rewrite_tac(@list.List([@sets.extension()]))
  let t84 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.powerset_clauses()])), t69), @tactics.gen_tac), t70), t71), t72), @tactics.conj_tac), t73), t74), @tactics.conj_tac), @tactics.eq_tac), t76), @tactics.strip_tac), t79), t80), @tactics.conj_tac), t81), @tactics.disj2_tac), t82), t83)
  let t85 = @simp.rewrite_tac(@list.List([@tactics.prove(@term_syntax.parse_term("{(s : (Num) -> Bool) | SUBSET(s, {2, 1})} == {{}, {1}, {2}, {1, 2}}"), t84)]))
  let t68 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @iterate.numseg_sing()]))
  let t67 = @simp.rewrite_tac(@list.List([@iterate.numseg_clauses()]))
  let t66 = @simp.gen_rewrite_tac(fn(x65 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x59 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s60 = @equal.land_conv(x59)
      fn(x61 : @kernel.Term) -> @kernel.Thm raise {
        s60(x61)
      }
    })((fn(x62 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s63 = @equal.once_depth_conv(x62)
      fn(x64 : @kernel.Term) -> @kernel.Thm raise {
        s63(x64)
      }
    })(x65))
  }, @list.List([@arith.two()]))
  let t58 = @simp.rewrite_tac(@list.List([@geometricalgebra.pdimindex_0(), @geometricalgebra.pdimindex_2(), @arith.add_0(), @arith.add_sym()]))
  let t57 = @simp.gen_rewrite_tac(fn(x56 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x52 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x46 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s47 = @equal.land_conv(x46)
        fn(x48 : @kernel.Term) -> @kernel.Thm raise {
          s47(x48)
        }
      })((fn(x49 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s50 = @equal.rand_conv(x49)
        fn(x51 : @kernel.Term) -> @kernel.Thm raise {
          s50(x51)
        }
      })(x52))
    })((fn(x53 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s54 = @equal.once_depth_conv(x53)
      fn(x55 : @kernel.Term) -> @kernel.Thm raise {
        s54(x55)
      }
    })(x56))
  }, @list.List([@equal.gsym(@geometricalgebra.mvbasis_expansion())]))
  let t45 = @simp.gen_rewrite_tac(fn(x44 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x40 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x34 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s35 = @equal.land_conv(x34)
        fn(x36 : @kernel.Term) -> @kernel.Thm raise {
          s35(x36)
        }
      })((fn(x37 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s38 = @equal.land_conv(x37)
        fn(x39 : @kernel.Term) -> @kernel.Thm raise {
          s38(x39)
        }
      })(x40))
    })((fn(x41 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s42 = @equal.once_depth_conv(x41)
      fn(x43 : @kernel.Term) -> @kernel.Thm raise {
        s42(x43)
      }
    })(x44))
  }, @list.List([@equal.gsym(@geometricalgebra.mvbasis_expansion())]))
  let t93 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t45), t57), t58), t66), t67), t68), t85), t86), t87), t91), t92)
  quat_product_ga020_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, Geomalg[Zero, Two, Zero]], ∀ y : Cart[Real, Geomalg[Zero, Two, Zero]], x * y == op_pct(setindex(x, {}) * setindex(y, {}) - setindex(x, {1}) * setindex(y, {1}) - setindex(x, {2}) * setindex(y, {2}) - setindex(x, {1, 2}) * setindex(y, {1, 2}), mbasis({})) + (op_pct(setindex(x, {}) * setindex(y, {1}) + (setindex(x, {1}) * setindex(y, {}) + (setindex(x, {2}) * setindex(y, {1, 2}) - setindex(x, {1, 2}) * setindex(y, {2}))), mbasis({1})) + (op_pct(setindex(x, {}) * setindex(y, {2}) - setindex(x, {1}) * setindex(y, {1, 2}) + (setindex(x, {2}) * setindex(y, {}) + setindex(x, {1, 2}) * setindex(y, {1})), mbasis({2})) + op_pct(setindex(x, {}) * setindex(y, {1, 2}) + (setindex(x, {1}) * setindex(y, {2}) - setindex(x, {2}) * setindex(y, {1}) + setindex(x, {1, 2}) * setindex(y, {})), mbasis({1, 2}))))"), t93))
}

///|
let quat_product_ga020_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("QUAT_PRODUCT_GA020")

///|
/// `QUAT_PRODUCT_GA020`
pub fn quat_product_ga020() -> @kernel.Thm {
  quat_product_ga020_c.get()
}

///|
/// Geometric_Algebra/quaternions.ml:68
fn step_7() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:69
fn step_8() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({2}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:70
fn step_9() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1, 2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1, 2}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:71
fn step_10() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({2}) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1, 2})")))
}

///|
/// Geometric_Algebra/quaternions.ml:72
fn step_11() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1, 2}) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1})")))
}

///|
/// Geometric_Algebra/quaternions.ml:73
fn step_12() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1, 2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1}) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({2})")))
}

///|
/// Geometric_Algebra/quaternions.ml:74
fn step_13() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({2}) == -((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1}))")))
}

///|
/// Geometric_Algebra/quaternions.ml:75
fn step_14() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1, 2}) == -((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1, 2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({2}))")))
}

///|
/// Geometric_Algebra/quaternions.ml:76
fn step_15() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1, 2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1}) == -((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1, 2}))")))
}

///|
/// Geometric_Algebra/quaternions.ml:77
fn step_16() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1}) * ((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])({1, 2})) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Zero, Two, Zero]])(({} : (Num) -> Bool))")))
}

///|
/// geomalg_300_quat
fn step_17() -> Unit raise {
  geomalg_300_quat_c.set(@pair.new_definition(@term_syntax.parse_term("(geomalg_300_quat : (Cart[Real, 4]) -> Cart[Real, Geomalg[Three, Zero, Zero]])((q : Cart[Real, 4])) == op_pct(Re(q), mbasis({})) + (op_pct(Im1(q), mbasis({2, 3})) + (op_pct(Im2(q), mbasis({1, 2})) + op_pct(Im3(q), -mbasis({1, 3}))))")))
}

///|
let geomalg_300_quat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("geomalg_300_quat")

///|
/// `geomalg_300_quat`
pub fn geomalg_300_quat() -> @kernel.Thm {
  geomalg_300_quat_c.get()
}

///|
/// CNJ_QUAT
fn step_18() -> Unit raise {
  let t110 = @tactics.conv_tac(@geometricalgebra.reversion_conv)
  let t109 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @iterate.numseg_conv(@term_syntax.parse_term("op_dot_dot(4, 3)")), @sets.inter_empty()]))
  let t108 = @simp.asm_rewrite_tac(@list.List([@geometricalgebra.pdimindex_3(), @geometricalgebra.pdimindex_0()]))
  let t106 = @tactics.conv_tac(@geometricalgebra.reversion_conv)
  let t105 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @iterate.numseg_conv(@term_syntax.parse_term("op_dot_dot(4, 3)")), @sets.inter_empty()]))
  let t107 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([@geometricalgebra.pdimindex_3(), @geometricalgebra.pdimindex_0()]))), t105), t106), @calc_rat.real_arith_tac), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t103 = @tactics.conv_tac(@geometricalgebra.reversion_conv)
  let t102 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @iterate.numseg_conv(@term_syntax.parse_term("op_dot_dot(4, 3)")), @sets.inter_empty()]))
  let t104 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([@geometricalgebra.pdimindex_3(), @geometricalgebra.pdimindex_0()]))), t102), t103), @calc_rat.real_arith_tac), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t100 = @tactics.conv_tac(@geometricalgebra.reversion_conv)
  let t99 = @simp.rewrite_tac(@list.List([@calc_num.arith(), @iterate.numseg_conv(@term_syntax.parse_term("op_dot_dot(4, 3)")), @sets.inter_empty()]))
  let t101 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@class.cond_cases_tac, @simp.asm_rewrite_tac(@list.List([@geometricalgebra.pdimindex_3(), @geometricalgebra.pdimindex_0()]))), t99), t100), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t98 = @simp.asm_simp_tac(@list.List([@geometricalgebra.mvbasis_component()]))
  let t97 = @simp.rewrite_tac(@list.List([@realax.real_add_ldistrib()]))
  let t96 = @simp.asm_simp_tac(@list.List([@vectors.vector_neg_minus1(), @geometricalgebra.geomalg_add_component(), @geometricalgebra.geomalg_mul_component(), @geometricalgebra.mvbasis_component()]))
  let t95 = @tactics.repeat_tac(@tactics.strip_tac)
  let t94 = @simp.simp_tac(@list.List([@geometricalgebra.geomalg_beta(), @geometricalgebra.geomalg_eq()]))
  let t111 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@geometricalgebra.conjugation(), geomalg_300_quat(), @quaternion.quat_cnj(), @quaternion.quat_components()]))), t94), t95), t96), t97), t98), @tactics.binop_tac), t101), @tactics.binop_tac), t104), @tactics.binop_tac), t107), @class.cond_cases_tac), t108), t109), t110), @calc_rat.real_arith_tac), @calc_rat.real_arith_tac)
  cnj_quat_c.set(@tactics.prove(@term_syntax.parse_term("∀ q : Cart[Real, 4], conjugation(geomalg_300_quat(q)) == geomalg_300_quat(cnj(q))"), t111))
}

///|
let cnj_quat_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CNJ_QUAT")

///|
/// `CNJ_QUAT`
pub fn cnj_quat() -> @kernel.Thm {
  cnj_quat_c.get()
}

///|
/// Geometric_Algebra/quaternions.ml:110
fn step_19() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({2, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({2, 3}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:111
fn step_20() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 2}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:112
fn step_21() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("-(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 3}) * -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 3}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:113
fn step_22() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({2, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 2}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 3})")))
}

///|
/// Geometric_Algebra/quaternions.ml:114
fn step_23() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 2}) * -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 3}) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({2, 3})")))
}

///|
/// Geometric_Algebra/quaternions.ml:115
fn step_24() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("-(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({2, 3}) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 2})")))
}

///|
/// Geometric_Algebra/quaternions.ml:116
fn step_25() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({2, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 2}) == -((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({2, 3}))")))
}

///|
/// Geometric_Algebra/quaternions.ml:117
fn step_26() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 2}) * -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 3}) == -(-(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 2}))")))
}

///|
/// Geometric_Algebra/quaternions.ml:118
fn step_27() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("-(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({2, 3}) == -((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({2, 3}) * -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 3}))")))
}

///|
/// Geometric_Algebra/quaternions.ml:119
fn step_28() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({2, 3}) * ((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 2}) * -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])({1, 3})) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, Zero]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:125
fn step_29() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:126
fn step_30() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:127
fn step_31() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("-(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3}) * -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:128
fn step_32() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2}) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3})")))
}

///|
/// Geometric_Algebra/quaternions.ml:129
fn step_33() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2}) * -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3}) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3})")))
}

///|
/// Geometric_Algebra/quaternions.ml:130
fn step_34() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("-(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3}) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2})")))
}

///|
/// Geometric_Algebra/quaternions.ml:131
fn step_35() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2}) == -((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3}))")))
}

///|
/// Geometric_Algebra/quaternions.ml:132
fn step_36() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2}) * -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3}) == -(-(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2}))")))
}

///|
/// Geometric_Algebra/quaternions.ml:133
fn step_37() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("-(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3}) == -((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3}) * -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3}))")))
}

///|
/// Geometric_Algebra/quaternions.ml:134
fn step_38() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3}) * ((mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2}) * -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3})) == -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])(({} : (Num) -> Bool))")))
}

///|
/// Geometric_Algebra/quaternions.ml:135
fn step_39() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2, 3, 4}) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2, 3, 4}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({2, 3})")))
}

///|
/// Geometric_Algebra/quaternions.ml:136
fn step_40() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2, 3, 4}) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2, 3, 4}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2})")))
}

///|
/// Geometric_Algebra/quaternions.ml:137
fn step_41() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("-(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2, 3, 4}) == (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2, 3, 4}) * -(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 3})")))
}

///|
/// Geometric_Algebra/quaternions.ml:138
fn step_42() -> Unit raise {
  ignore(@geometricalgebra.geom_arith(@term_syntax.parse_term("(mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2, 3, 4}) * (mbasis : ((Num) -> Bool) -> Cart[Real, Geomalg[Three, Zero, One]])({1, 2, 3, 4}) == (vec : (Num) -> Cart[Real, Geomalg[Three, Zero, One]])(0)")))
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
}
