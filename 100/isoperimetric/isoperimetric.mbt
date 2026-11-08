// Translated from upstream 100/isoperimetric.ml; edit this file directly.

///|
/// lemma1
fn step_1() -> Unit raise {
  let t8 = @simp.asm_simp_tac(@list.List([@convex.compact_convex_hull(), @paths.compact_path_image(), @paths.simple_path_imp_path()]))
  let t7 = @tactics.match_mp_tac(@topology.compact_imp_closed())
  let t6 = @simp.rewrite_tac(@list.List([@paths.inside_subset_convex_hull()]))
  let t9 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.closure_minimal()), t6), t7), t8)
  let t5 = @sets.set_tac(@list.List([]))
  let t4 = @simp.asm_simp_tac(@list.List([@paths.jordan_inside_outside()]))
  let t3 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.frontier_union_interior())]))
  let t2 = @simp.asm_simp_tac(@list.List([@convex.convex_closure()]))
  let t10 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_minimal()), t2), t3), t4), t5), t9])
  let t1 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t11 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1), @tactics.conj_tac), t10)
  lemma1_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], simple_path(g) && pathfinish(g) == pathstart(g) && convex(inside(path_image(g))) → hull(convex, path_image(g)) == closure(inside(path_image(g)))"), t11))
}

///|
let lemma1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lemma1")

///|
/// `lemma1`
pub fn lemma1() -> @kernel.Thm {
  lemma1_c.get()
}

///|
/// lemma2
fn step_2() -> Unit raise {
  let t13 = @simp.asm_simp_tac(@list.List([@paths.jordan_inside_outside()]))
  let t12 = @simp.asm_simp_tac(@list.List([lemma1(), @convex.frontier_closure_convex()]))
  let t14 = @tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t12), t13)
  lemma2_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], simple_path(g) && pathfinish(g) == pathstart(g) && convex(inside(path_image(g))) → frontier(hull(convex, path_image(g))) == path_image(g)"), t14))
}

///|
let lemma2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lemma2")

///|
/// `lemma2`
pub fn lemma2() -> @kernel.Thm {
  lemma2_c.get()
}

///|
/// lemma3
fn step_3() -> Unit raise {
  let t23 = @meson.asm_meson_tac(@list.List([@convex.convex_convex_hull()]))
  let t22 = @tactics.match_mp_tac(@paths.empty_inside_psubset_convex_frontier())
  let t20 = @simp.rewrite_tac(@list.List([]))
  let t21 = @list.List([@meson.asm_meson_tac(@list.List([@paths.jordan_inside_outside()])), t20])
  let t19 = @tactics.subgoal_then(@term_syntax.parse_term("!(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))) == {})"), fn(x16 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s17 = @tactics.mp_tac(x16)
    fn(x18 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s17(x18)
    }
  })
  let t15 = @simp.asm_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("((t : (_) -> Bool) == (s : (_) -> Bool)) == (SUBSET(s, t) && !PSUBSET(s, t))"))]))
  let t24 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t15), @tactics.disch_tac), t19), t21), t22), t23)
  lemma3_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], simple_path(g) && pathfinish(g) == pathstart(g) && SUBSET(path_image(g), frontier(hull(convex, path_image(g)))) → frontier(hull(convex, path_image(g))) == path_image(g)"), t24))
}

///|
let lemma3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lemma3")

///|
/// `lemma3`
pub fn lemma3() -> @kernel.Thm {
  lemma3_c.get()
}

///|
/// REAL_HOELDER_BOUND_2
fn step_4() -> Unit raise {
  let t56 = @simp.asm_rewrite_tac(@list.List([@vectors.lift_drop(), @real.real_le_pow_2()]))
  let t55 = @tactics.match_mp_tac(@integration.integral_drop_pos())
  let t54 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(abs((x : Real)) <= x) == (real_of_num(0) <= x)"))]))
  let t53 = @simp.asm_simp_tac(@list.List([@realanalysis.real_measure_pos_le()]))
  let t52 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t51 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realax.real_le_trans()))
  let t50 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_measure_measure())]))
  let t49 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_v1(), @realanalysis.real_integrable_on_v1(), @trivia.o_def()]))
  let t48 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_v1(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t47 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s42 = @tactics.assume_tac(x41)
    fn(x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s42(x43)
    }
  }, fn(x44 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s45 = @tactics.mp_tac(x44)
    fn(x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s45(x46)
    }
  }))
  let t40 = @simp.simp_tac(@list.List([@trivia.o_def(), @vectors.norm_1(), @vectors.lift_drop(), @real.real_pow2_abs()]))
  let t37 = @simp.gen_rewrite_rule(fn(x36 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x36
  }, @list.List([@realanalysis.real_integrable_on_v1()]))
  let t39 = @tactics.first_x_assum(fn(x38 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s34 = @tactics.mp_tac(x33)
      fn(x35 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s34(x35)
      }
    })(t37(x38))
  })
  let t30 = @equal.gsym(@realanalysis.absolutely_real_integrable_on_v1())
  let t31 = @equal.gsym(@realanalysis.real_measurable_measurable())
  let t32 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_measurable_on()), t31, t30]))
  let t29 = @simp.asm_rewrite_tac(@list.List([@lpspaces.lspace(), @sets.in_elim_thm(), @transcendentals.rpow_pow(), @real.real_pow_1()]))
  let t28 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t25 = @term_syntax.parse_term("real_of_num(2)")
  let t26 = @term_syntax.parse_term("IMAGE(lift, (s : (Real) -> Bool))")
  let t27 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("o(lift, o((f : (Real) -> Real), drop))"), t26, t25]), @lpspaces.hoelder_bound()))
  let t57 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t27), t28), t29), t32), t39), t40), @tactics.disch_tac), t47), t48), t49), t50), t51), t52), t53), t54), t55), t56)
  real_hoelder_bound_2_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ s : (Real) -> Bool, real_measurable(s) && real_measurable_on(f, s) && real_integrable_on((x : Real) => pow(f(x), 2), s) → pow(real_integral(s, f), 2) <= real_measure(s) * real_integral(s, (x : Real) => pow(f(x), 2))"), t57))
}

///|
let real_hoelder_bound_2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("REAL_HOELDER_BOUND_2")

///|
/// `REAL_HOELDER_BOUND_2`
pub fn real_hoelder_bound_2() -> @kernel.Thm {
  real_hoelder_bound_2_c.get()
}

///|
/// WIRTINGER_INEQUALITY
fn step_5() -> Unit raise {
  let t1175 = @term_syntax.parse_term("(x : Real)")
  let t1178 = @tactics.replicate_tac(3, @tactics.first_x_assum(fn(x1177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1172 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1173 = @tactics.mp_tac(x1172)
      fn(x1174 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1173(x1174)
      }
    })(((x1176 : @kernel.Thm) => @bool.spec(t1175, x1176))(x1177))
  }))
  let t1171 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1169 = @term_syntax.parse_term("(a : Real)")
  let t1170 = @tactics.map_every(fn(x1166 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1167 = @tactics.exists_tac(x1166)
    fn(x1168 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1167(x1168)
    }
  }, @list.List([@term_syntax.parse_term("(c1 : Real)"), t1169]))
  let t1164 = @tactics.conv_tac(@calc_rat.real_ring)
  let t1163 = @simp.rewrite_tac(@list.List([@transcendentals.cos_periodic(), @transcendentals.cos_neg()]))
  let t1162 = @simp.rewrite_tac(@list.List([@real.real_sub_lzero(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * pi - (a : Real) == -a + real_of_num(2) * pi"))]))
  let t1161 = @simp.rewrite_tac(@list.List([@real.real_add_sub(), @transcendentals.cos_pi(), @real.real_sub_refl(), @transcendentals.cos_0()]))
  let t1160 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x1157 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1158 = @tactics.subst1_tac(x1157)
    fn(x1159 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1158(x1159)
    }
  }))
  let t1156 = @tactics.replicate_tac(3, @tactics.thenl(@tactics.ants_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(fn(x1153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1154 = @tactics.subst1_tac(x1153)
    fn(x1155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1154(x1155)
    }
  })])))
  let t1152 = @tactics.first_x_assum(fn(x1142 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x1142
    let t1149 = @term_syntax.parse_term("(c1 : Real)")
    let t1150 = @term_syntax.parse_term("(a : Real)")
    let t1151 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(0)"), t1150, t1149]), th_5))
    let t1146 = @term_syntax.parse_term("(c2 : Real)")
    let t1147 = @term_syntax.parse_term("(a : Real) + pi")
    let t1148 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Real)"), t1147, t1146]), th_5))
    let t1144 = @term_syntax.parse_term("(c1 : Real)")
    let t1145 = @term_syntax.parse_term("real_of_num(2) * pi")
    @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Real) + pi"), t1145, t1144]), th_5)), t1148), t1151)
  })
  let t1140 = @simp.asm_simp_tac(@list.List([]))
  let t1139 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t1138 = @tactics.match_mp_tac(@realanalysis.real_integral_eq())
  let t1141 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t1138), t1139), t1140), @tactics.all_tac])
  let t1137 = @tactics.subgoal_then(@term_syntax.parse_term("real_integral(real_interval([(real_of_num(0), (a : Real))]), (f : (Real) -> Real)) == real_integral(real_interval([(real_of_num(0), a)]), (x : Real) => (c1 : Real) * sin(x - a)) && real_integral(real_interval([(a, a + pi)]), f) == real_integral(real_interval([(a, a + pi)]), (x : Real) => (c2 : Real) * sin(x - a)) && real_integral(real_interval([(a + pi, real_of_num(2) * pi)]), f) == real_integral(real_interval([(a + pi, real_of_num(2) * pi)]), (x : Real) => c1 * sin(x - a))"), fn(x1134 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1135 = @tactics.mp_tac(x1134)
    fn(x1136 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1135(x1136)
    }
  })
  let t1132 = @simp.asm_rewrite_tac(@list.List([]))
  let t1130 = @tactics.disch_then(fn(x1127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1128 = @tactics.subst1_tac(x1127)
    fn(x1129 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1128(x1129)
    }
  })
  let t1126 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t1123 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_integrable_on_subinterval()))
  let t1125 = @tactics.first_x_assum(fn(x1124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1123(x1124))
  })
  let t1131 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))), t1125), t1126), @calc_rat.asm_real_arith_tac), t1130])
  let t1117 = @drule.part_match(fn(x1116 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1116))
  }, @realanalysis.real_integral_combine())
  let t1111 = @tactics.disch_then(fn(x1108 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1109 = @tactics.subst1_tac(x1108)
    fn(x1110 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1109(x1110)
    }
  })
  let t1107 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t1104 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_integrable_on_subinterval()))
  let t1106 = @tactics.first_x_assum(fn(x1105 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1104(x1105))
  })
  let t1112 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))), t1106), t1107), @calc_rat.asm_real_arith_tac), t1111])
  let t1097 = @drule.part_match(fn(x1096 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1096))
  }, @realanalysis.real_integral_combine())
  let t1092 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t1133 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("has_real_integral((f : (Real) -> Real), real_of_num(0), real_interval([(real_of_num(0), real_of_num(2) * pi)]))")), t1092), @tactics.strip_tac), fn(x1103 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1102 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1100 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1099 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1098 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            (fn(x1093 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
              let s1094 = @tactics.mp_tac(x1093)
              fn(x1095 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
                s1094(x1095)
              }
            })(t1097(x1098))
          })(@kernel.rand(x1099))
        })(@equal.lhand(x1100))
      })((fn(x1101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1101.1
      })(x1102))
    })(x1103)(x1103)
  }), @tactics.ants_tac), t1112), fn(x1122 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1121 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1119 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1118 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1113 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1114 = @tactics.mp_tac(x1113)
            fn(x1115 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1114(x1115)
            }
          })(t1117(x1118))
        })(@equal.lhand(x1119))
      })((fn(x1120 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1120.1
      })(x1121))
    })(x1122)(x1122)
  }), @tactics.ants_tac), t1131), t1132), @tactics.all_tac])
  let t1165 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_integral(real_interval([(real_of_num(0), (a : Real))]), (f : (Real) -> Real)) + (real_integral(real_interval([(a, a + pi)]), f) + real_integral(real_interval([(a + pi, real_of_num(2) * pi)]), f)) == real_of_num(0)"), fn(x1089 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1090 = @tactics.mp_tac(x1089)
    fn(x1091 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1090(x1091)
    }
  }), t1133), t1137), t1141), t1152), t1156), t1160), t1161), t1162), t1163), t1164), @tactics.all_tac])
  let t1088 = @tactics.subgoal_then(@term_syntax.parse_term("(c2 : Real) == (c1 : Real)"), fn(x1085 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1086 = @tactics.subst_all_tac(x1085)
    fn(x1087 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1086(x1087)
    }
  })
  let t1083 = @tactics.disch_then(fn(x1080 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1081 = @tactics.subst_all_tac(x1080)
    fn(x1082 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1081(x1082)
    }
  })
  let t1074 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi())
  let t1073 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t1072 = @simp.rewrite_tac(@list.List([@transcendentals.sin_neg(), @real.real_neg_eq_0()]))
  let t1075 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_neg_sub())])), t1072), t1073), t1074), @calc_rat.asm_real_arith_tac)
  let t1071 = @simp.rewrite_tac(@list.List([@transcendentals.sin_periodic(), @calc_int.real_add_rid()]))
  let t1076 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) - (b : Real) == -b + a"))])), t1071)
  let t1077 = @tactics.first_x_assum(fn(x1068 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1069 = @tactics.accept_tac(x1068)
    fn(x1070 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1069(x1070)
    }
  })
  let t1078 = @tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), @calc_rat.asm_real_arith_tac)
  let t1079 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), @calc_rat.asm_real_arith_tac), t1078, t1077, t1076, t1075])
  let t1084 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t1079), t1083])
  let t1067 = @tactics.mp_tac(@calc_rat.real_ring(@term_syntax.parse_term("(f : (Real) -> Real)(real_of_num(2) * pi) == (c3 : Real) * sin(real_of_num(2) * pi - (a : Real)) && f(real_of_num(0)) == (c1 : Real) * sin(real_of_num(0) - a) && f(real_of_num(2) * pi) == f(real_of_num(0)) && sin(real_of_num(2) * pi - a) == sin(real_of_num(0) - a) && !(sin(real_of_num(0) - a) == real_of_num(0)) → c3 == c1")))
  let t1064 = @term_syntax.parse_term("(c3 : Real)")
  let t1066 = @tactics.disch_then((x1065 : @kernel.Thm) => @tactics.x_choose_tac(t1064, x1065))
  let t1058 = @term_syntax.parse_term("(c2 : Real)")
  let t1063 = @tactics.disch_then(@tactics.conjuncts_then2((x1059 : @kernel.Thm) => @tactics.x_choose_tac(t1058, x1059), fn(x1060 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1061 = @tactics.mp_tac(x1060)
    fn(x1062 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1061(x1062)
    }
  }))
  let t1052 = @term_syntax.parse_term("(c1 : Real)")
  let t1057 = @tactics.disch_then(@tactics.conjuncts_then2((x1053 : @kernel.Thm) => @tactics.x_choose_tac(t1052, x1053), fn(x1054 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1055 = @tactics.mp_tac(x1054)
    fn(x1056 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1055(x1056)
    }
  }))
  let t1050 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi())
  let t1049 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t1048 = @simp.rewrite_tac(@list.List([@transcendentals.sin_periodic_pi(), @real.real_neg_eq_0()]))
  let t1047 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - (a : Real) == x - (a + pi) + pi"))]))
  let t1051 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))), @tactics.gen_tac), @tactics.strip_tac), t1047), t1048), t1049), t1050), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1045 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi())
  let t1044 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t1046 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))), @tactics.gen_tac), @tactics.strip_tac), t1044), t1045), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1042 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi())
  let t1041 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t1040 = @simp.rewrite_tac(@list.List([@transcendentals.sin_neg(), @real.real_neg_eq_0()]))
  let t1039 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_neg_sub())]))
  let t1043 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))), @tactics.gen_tac), @tactics.strip_tac), t1039), t1040), t1041), t1042), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1038 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval(), @misc.in_real_interval()]))
  let t1037 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p1 : Bool) && (p2 : Bool) && (p3 : Bool) && ((q1 : Bool) && (q2 : Bool) && (q3 : Bool) → (r : Bool)) → (p1 → q1) → (p2 → q2) → (p3 → q3) → r")))
  let t1036 = @tactics.disch_then(fn(x1029 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x1029
    let t1034 = @term_syntax.parse_term("(a : Real)")
    let t1035 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(0)"), t1034]), th_4))
    let t1032 = @term_syntax.parse_term("(a : Real) + pi")
    let t1033 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Real)"), t1032]), th_4))
    let t1031 = @term_syntax.parse_term("real_of_num(2) * pi")
    @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Real) + pi"), t1031]), th_4)), t1033), t1035)
  })
  let t1027 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t1023 = @term_syntax.parse_term("(x : Real)")
  let t1026 = @tactics.replicate_tac(2, @tactics.first_x_assum(fn(x1025 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1020 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1021 = @tactics.mp_tac(x1020)
      fn(x1022 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1021(x1022)
      }
    })(((x1024 : @kernel.Thm) => @bool.spec(t1023, x1024))(x1025))
  }))
  let t1019 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t1017 = @term_syntax.parse_term("real_of_num(0)")
  let t1018 = @tactics.map_every(fn(x1014 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1015 = @tactics.exists_tac(x1014)
    fn(x1016 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1015(x1016)
    }
  }, @list.List([@term_syntax.parse_term("(c1 : Real)"), t1017]))
  let t1012 = @tactics.conv_tac(@calc_rat.real_ring)
  let t1011 = @simp.rewrite_tac(@list.List([@transcendentals.cos_0(), @transcendentals.cos_pi(), @transcendentals.cos_npi()]))
  let t1010 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x1007 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1008 = @tactics.subst1_tac(x1007)
    fn(x1009 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1008(x1009)
    }
  }))
  let t1006 = @tactics.replicate_tac(2, @tactics.thenl(@tactics.ants_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(fn(x1003 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1004 = @tactics.subst1_tac(x1003)
    fn(x1005 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1004(x1005)
    }
  })])))
  let t1002 = @tactics.first_x_assum(fn(x995 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x995
    let t999 = @term_syntax.parse_term("(c1 : Real)")
    let t1000 = @term_syntax.parse_term("pi")
    let t1001 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(0)"), t1000, t999]), th_3))
    let t997 = @term_syntax.parse_term("(c2 : Real)")
    let t998 = @term_syntax.parse_term("real_of_num(2) * pi")
    @tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("pi"), t998, t997]), th_3)), t1001)
  })
  let t993 = @simp.asm_simp_tac(@list.List([]))
  let t992 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t991 = @tactics.match_mp_tac(@realanalysis.real_integral_eq())
  let t994 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.conj_tac), t991), t992), t993), @tactics.all_tac])
  let t990 = @tactics.subgoal_then(@term_syntax.parse_term("real_integral(real_interval([(real_of_num(0), pi)]), (f : (Real) -> Real)) == real_integral(real_interval([(real_of_num(0), pi)]), (x : Real) => (c1 : Real) * sin(x)) && real_integral(real_interval([(pi, real_of_num(2) * pi)]), f) == real_integral(real_interval([(pi, real_of_num(2) * pi)]), (x : Real) => (c2 : Real) * sin(x))"), fn(x987 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s988 = @tactics.mp_tac(x987)
    fn(x989 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s988(x989)
    }
  })
  let t985 = @simp.asm_rewrite_tac(@list.List([]))
  let t983 = @tactics.disch_then(fn(x980 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s981 = @tactics.subst1_tac(x980)
    fn(x982 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s981(x982)
    }
  })
  let t979 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t976 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_integrable_on_subinterval()))
  let t978 = @tactics.first_x_assum(fn(x977 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t976(x977))
  })
  let t984 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))), t978), t979), @calc_rat.asm_real_arith_tac), t983])
  let t970 = @drule.part_match(fn(x969 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x969))
  }, @realanalysis.real_integral_combine())
  let t965 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t986 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("has_real_integral((f : (Real) -> Real), real_of_num(0), real_interval([(real_of_num(0), real_of_num(2) * pi)]))")), t965), @tactics.strip_tac), fn(x975 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x974 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x972 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x971 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x966 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s967 = @tactics.mp_tac(x966)
            fn(x968 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s967(x968)
            }
          })(t970(x971))
        })(@equal.lhand(x972))
      })((fn(x973 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x973.1
      })(x974))
    })(x975)(x975)
  }), @tactics.ants_tac), t984), t985), @tactics.all_tac])
  let t1013 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_integral(real_interval([(real_of_num(0), pi)]), (f : (Real) -> Real)) + real_integral(real_interval([(pi, real_of_num(2) * pi)]), f) == real_of_num(0)"), fn(x962 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s963 = @tactics.mp_tac(x962)
    fn(x964 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s963(x964)
    }
  }), t986), t990), t994), t1002), t1006), t1010), t1011), t1012), @tactics.all_tac])
  let t961 = @tactics.subgoal_then(@term_syntax.parse_term("(c2 : Real) == (c1 : Real)"), fn(x958 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s959 = @tactics.subst_all_tac(x958)
    fn(x960 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s959(x960)
    }
  })
  let t955 = @term_syntax.parse_term("(c2 : Real)")
  let t957 = @tactics.disch_then((x956 : @kernel.Thm) => @tactics.x_choose_tac(t955, x956))
  let t949 = @term_syntax.parse_term("(c1 : Real)")
  let t954 = @tactics.disch_then(@tactics.conjuncts_then2((x950 : @kernel.Thm) => @tactics.x_choose_tac(t949, x950), fn(x951 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s952 = @tactics.mp_tac(x951)
    fn(x953 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s952(x953)
    }
  }))
  let t947 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi())
  let t946 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t945 = @simp.rewrite_tac(@list.List([@real.real_neg_eq_0()]))
  let t944 = @tactics.disch_then(fn(x941 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s942 = @tactics.subst1_tac(x941)
    fn(x943 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s942(x943)
    }
  })
  let t940 = @simp.rewrite_tac(@list.List([@real.real_sub_add(), @real.real_sub_rzero()]))
  let t939 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real) - pi"), @transcendentals.sin_periodic_pi()))
  let t938 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t948 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))), t938), @tactics.strip_tac), t939), t940), t944), t945), t946), t947), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t936 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi())
  let t935 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t937 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))), @tactics.gen_tac), @tactics.strip_tac), t935), t936), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t934 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval(), @misc.in_real_interval()]))
  let t933 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p1 : Bool) && (p2 : Bool) && ((q1 : Bool) && (q2 : Bool) → (r : Bool)) → (p1 → q1) → (p2 → q2) → r")))
  let t932 = @tactics.disch_then(fn(x927 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x927
    let t930 = @term_syntax.parse_term("pi")
    let t931 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(0)"), t930]), th_2))
    let t929 = @term_syntax.parse_term("real_of_num(2) * pi")
    @tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("pi"), t929]), th_2)), t931)
  })
  let t926 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t925 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@realax.real_add_lid(), @calc_int.real_add_rid(), @real.real_sub_rzero()])))
  let t1028 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x922 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s923 = @tactics.subst_all_tac(x922)
    fn(x924 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s923(x924)
    }
  }), t925), t926), t932), t933), t934), @tactics.conj_tac), t937), @tactics.conj_tac), t948), t954), t957), t961), t1013), t1018), t1019), t1026), t1027), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t921 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Real) == real_of_num(0)"))
  let t917 = @tactics.disch_then(fn(x916 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x913 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s914 = @tactics.subst1_tac(x913)
      fn(x915 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s914(x915)
      }
    })(@bool.conjunct2(x916))
  })
  let t918 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()])), t917), @calc_rat.real_arith_tac)
  let t912 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t911 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Real)"))
  let t919 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t911), t912), @tactics.strip_tac), @realanalysis.real_diff_tac), @calc_rat.real_arith_tac), t918])
  let t910 = @simp.asm_rewrite_tac(@list.List([]))
  let t906 = @term_syntax.parse_term("(v : Real)")
  let t907 = @term_syntax.parse_term("(u : Real)")
  let t908 = @term_syntax.parse_term("(x : Real) => (c : Real) * sin(x - (a : Real))")
  let t909 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real) => -((c : Real) * cos(x - (a : Real)))"), t908, t907, t906]), @realanalysis.real_fundamental_theorem_of_calculus()))
  let t920 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t909), t910), @tactics.ants_tac), t919), @tactics.all_tac])
  let t905 = @tactics.subgoal_then(@term_syntax.parse_term("∀ u : Real, ∀ v : Real, ∀ c : Real, u <= v → real_integral(real_interval([(u, v)]), (x : Real) => c * sin(x - (a : Real))) == c * (cos(u - a) - cos(v - a))"), fn(x902 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s903 = @tactics.assume_tac(x902)
    fn(x904 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s903(x904)
    }
  })
  let t900 = @simp.rewrite_tac(@list.List([@realax.real_div(), @transcendentals.tan(), @real.real_inv_mul(), @real.real_inv_inv(), @real.real_inv_pow()]))
  let t899 = @list.List([@calc_rat.asm_real_arith_tac, @simp.asm_rewrite_tac(@list.List([]))])
  let t898 = @simp.rewrite_tac(@list.List([]))
  let t897 = @simp.once_rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t896 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_elim_thm(), @misc.in_real_interval()]))
  let t895 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Real)"))
  let t892 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.has_real_integral_negligible()))
  let t894 = @tactics.first_x_assum(fn(x893 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t892(x893))
  })
  let t891 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.has_real_integral_unique()))
  let t890 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) / (x' : Real) == (y : Real) / (y' : Real)) == (real_of_num(0) == y * inv(y') - x * inv(x'))"))]))
  let t889 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t884 = @term_syntax.parse_term("(y : Real)")
  let t887 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x878 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s879 = @tactics.assume_tac(x878)
    fn(x880 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s879(x880)
    }
  }, fn(x886 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x881 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s882 = @tactics.mp_tac(x881)
      fn(x883 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s882(x883)
      }
    })(((x885 : @kernel.Thm) => @bool.spec(t884, x885))(x886))
  }))
  let t873 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), @calc_rat.asm_real_arith_tac), @calc_rat.real_arith_tac])
  let t872 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t871 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Real)"))
  let t870 = @simp.asm_rewrite_tac(@list.List([]))
  let t869 = @tactics.match_mp_tac(@realanalysis.real_fundamental_theorem_of_calculus())
  let t868 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t874 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Real)")), t868), @tactics.strip_tac), t869), t870), t871), t872), @tactics.strip_tac), @realanalysis.real_diff_tac), @tactics.conj_tac), t873)
  let t867 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t866 = @simp.rewrite_tac(@list.List([@real.real_pow_eq_0(), @calc_num.arith_eq()]))
  let t865 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_withinreal())
  let t864 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t863 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Real)"))
  let t862 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t875 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_continuous()), t862), t863), t864), @tactics.strip_tac), t865), @realanalysis.real_differentiable_tac), t866), t867), @calc_rat.asm_real_arith_tac)
  let t859 = @simp.asm_rewrite_tac(@list.List([]))
  let t856 = @term_syntax.parse_term("(x : Real)")
  let t857 = @term_syntax.parse_term("(z : Real)")
  let t858 = @term_syntax.parse_term("real_of_num(0)")
  let t860 = @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f' : (Real) -> Real)"), t858, t857, t856]), @realanalysis.real_integral_combine())), t859), @calc_rat.asm_real_arith_tac)
  let t855 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t853 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_integrable_on_subinterval()))
  let t861 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x854 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t853(x854))
  }), t855), @calc_rat.asm_real_arith_tac), t860])
  let t851 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()])), @tactics.strip_tac)
  let t850 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t852 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.first_x_assum(@tactics.match_mp_tac)), t850), @calc_rat.asm_real_arith_tac), t851])
  let t849 = @tactics.subgoal_then(@term_syntax.parse_term("has_real_integral((f' : (Real) -> Real), (f : (Real) -> Real)((x : Real)) - f(real_of_num(0)), real_interval([(real_of_num(0), x)])) && has_real_integral(f', f((z : Real)) - f(real_of_num(0)), real_interval([(real_of_num(0), z)]))"), fn(x846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s847 = @tactics.mp_tac(x846)
    fn(x848 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s847(x848)
    }
  })
  let t845 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t876 = @tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Real)")), t845), @tactics.strip_tac), t849), t852), @tactics.conj_tac), t861)
  let t844 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t842 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.absolutely_real_integrable_on_subinterval()))
  let t877 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x843 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t842(x843))
  }), t844), @calc_rat.asm_real_arith_tac), t876, t875, t874])
  let t888 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t877), t887])
  let t841 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t835 = @term_syntax.parse_term("(y : Real)")
  let t836 = @term_syntax.parse_term("(x : Real)")
  let t837 = @term_syntax.parse_term("(x : Real) => -(cos(x - (a : Real)) / pow(sin(x - a), 2))")
  let t838 = @term_syntax.parse_term("(f' : (Real) -> Real)")
  let t839 = @term_syntax.parse_term("(x : Real) => inv(sin(x - (a : Real)))")
  let t840 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f : (Real) -> Real)"), t839, t838, t837, t836, t835]), @realanalysis.absolute_real_integration_by_parts_sum()))
  let t834 = @tactics.repeat_tac(@tactics.strip_tac)
  let t832 = @term_syntax.parse_term("(y : Real)")
  let t833 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Real)"), t832]))
  let t831 = @list.List([@meson.meson_tac(@list.List([])), @tactics.all_tac])
  let t830 = @simp.rewrite_tac(@list.List([]))
  let t829 = @tactics.match_mp_tac(@real.real_wlog_lt())
  let t828 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([]), @term_syntax.parse_term("(∃ c : _, ∀ u : _, (P : (_) -> Bool)(u) → (f : (_) -> _)(u) == c) == (∀ u : _, ∀ v : _, P(u) && P(v) → f(u) == f(v))"))]))
  let t827 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((y : Real) == real_of_num(0)) → ((x : Real) == (c : Real) * y) == (x / y == c)"))]))
  let t823 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_withinreal())
  let t822 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t821 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Real)"))
  let t824 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()])), t821), t822), @tactics.strip_tac), t823), @realanalysis.real_differentiable_tac)
  let t820 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t818 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_continuous_on_subset()))
  let t825 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x819 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t818(x819))
  }), t820), @calc_rat.asm_real_arith_tac), t824])
  let t817 = @simp.asm_rewrite_tac(@list.List([]))
  let t816 = @tactics.match_mp_tac(@realanalysis.real_continuous_agree_on_closure_interval())
  let t815 = @simp.rewrite_tac(@list.List([@equal.gsym(@misc.in_real_interval())]))
  let t826 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t815), @tactics.gen_tac), @tactics.disch_tac), t816), t817), @tactics.conj_tac), t825)])
  let t814 = @tactics.subgoal_then(@term_syntax.parse_term("∃ c : Real, ∀ x : Real, (u : Real) < x && x < (v : Real) → (f : (Real) -> Real)(x) == c * sin(x - (a : Real))"), fn(x811 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s812 = @tactics.mp_tac(x811)
    fn(x813 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s812(x813)
    }
  })
  let t810 = @term_syntax.parse_term("(v : Real)")
  let t901 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Real)"), t810])), @tactics.strip_tac), t814), t826), t827), t828), t829), t830), @tactics.conj_tac), t831), t833), t834), t840), t841), @tactics.ants_tac), t888), t889), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t890), t891), t894), t895), t896), t897), t898), @tactics.strip_tac), t899), t900), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t809 = @tactics.subgoal_then(@term_syntax.parse_term("∀ u : Real, ∀ v : Real, real_of_num(0) <= u && u < v && v <= real_of_num(2) * pi && (∀ x : Real, u < x && x < v → !(sin(x - (a : Real)) == real_of_num(0))) → (∃ c : Real, ∀ x : Real, u <= x && x <= v → (f : (Real) -> Real)(x) == c * sin(x - a))"), fn(x806 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s807 = @tactics.mp_tac(x806)
    fn(x808 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s807(x808)
    }
  })
  let t803 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t802 = @simp.rewrite_tac(@list.List([@misc.real_interval_eq_empty()]))
  let t804 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.in_gspec(), @realanalysis.real_negligible_real_interval()])), t802), t803), @calc_rat.real_arith_tac)
  let t801 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero(), @realarith.real_sub_0()]))
  let t805 = @list.List([@tactics.then_tac(@tactics.pop_assum(fn(x798 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s799 = @tactics.subst_all_tac(x798)
    fn(x800 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s799(x800)
    }
  }), t801), t804])
  let t797 = @simp.asm_rewrite_tac(@list.List([]))
  let t796 = @class.asm_cases_tac(@term_syntax.parse_term("(f : (Real) -> Real)((a : Real)) == real_of_num(0)"))
  let t795 = @simp.rewrite_tac(@list.List([@real.real_sos_eq_0()]))
  let t794 = @tactics.disch_then(fn(x791 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s792 = @tactics.subst1_tac(x791)
    fn(x793 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s792(x793)
    }
  })
  let t790 = @simp.simp_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t784 = @drule.part_match(fn(x783 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x783))
  }, @realanalysis.has_real_integral_negligible_eq())
  let t779 = @simp.asm_rewrite_tac(@list.List([@real.real_sub_refl()]))
  let t778 = @class.asm_cases_tac(@term_syntax.parse_term("(i' : Real) == (i : Real)"))
  let t776 = @simp.simp_tac(@list.List([@realarith.real_le_add(), @real.real_le_pow_2()]))
  let t775 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@realanalysis.has_real_integral_pos()))
  let t777 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x772 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s773 = @equal.rand_conv(x772)
    fn(x774 : @kernel.Term) -> @kernel.Thm raise {
      s773(x774)
    }
  }, @list.List([@equal.gsym(@realarith.real_sub_le())])), t775), t776), @tactics.all_tac])
  let t771 = @tactics.disch_then(fn(x769 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x769
    @tactics.then_tac(@tactics.conj_tac, @tactics.mp_tac(th_1))
  })
  let t768 = @simp.rewrite_tac(@list.List([@real.real_sub_add(), @calc_int.real_mul_rzero()]))
  let t765 = @drule.match_mp(@realanalysis.has_real_integral_add())
  let t767 = @tactics.disch_then(fn(x766 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x762 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s763 = @tactics.mp_tac(x762)
      fn(x764 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s763(x764)
      }
    })(t765(x766))
  })
  let t761 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.imp_conj_alt())]))
  let t758 = @drule.match_mp(@realanalysis.has_real_integral_lmul())
  let t755 = @term_syntax.parse_term("real_of_num(2) * (f : (Real) -> Real)((a : Real))")
  let t760 = @tactics.disch_then(fn(x759 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x757 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x752 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s753 = @tactics.mp_tac(x752)
        fn(x754 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s753(x754)
        }
      })(((x756 : @kernel.Thm) => @bool.spec(t755, x756))(x757))
    })(t758(x759))
  })
  let t751 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("has_real_integral((f : (Real) -> Real), real_of_num(0), real_interval([(real_of_num(0), real_of_num(2) * pi)]))")))
  let t750 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pow((x' : Real), 2) - pow((x : Real), 2) - (pow(x', 2) - pow(x - (a : Real), 2) - (b : Real)) == pow(a, 2) + b - real_of_num(2) * a * x"))]))
  let t749 = @simp.expand_tac("g'")
  let t746 = @drule.match_mp(@realanalysis.has_real_integral_sub())
  let t748 = @tactics.disch_then(fn(x747 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x743 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s744 = @tactics.mp_tac(x743)
      fn(x745 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s744(x745)
      }
    })(t746(x747))
  })
  let t742 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t739 = @drule.match_mp(@realanalysis.has_real_integral_sub())
  let t741 = @tactics.disch_then(fn(x740 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x736 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s737 = @tactics.mp_tac(x736)
      fn(x738 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s737(x738)
      }
    })(t739(x740))
  })
  let t735 = @simp.asm_rewrite_tac(@list.List([]))
  let t734 = @simp.gen_rewrite_tac(fn(x733 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x727 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s728 = @equal.land_conv(x727)
      fn(x729 : @kernel.Term) -> @kernel.Thm raise {
        s728(x729)
      }
    })((fn(x730 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s731 = @equal.once_depth_conv(x730)
      fn(x732 : @kernel.Term) -> @kernel.Thm raise {
        s731(x732)
      }
    })(x733))
  }, @list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t726 = @simp.gen_rewrite_tac(fn(x725 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x725
  }, @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) → (r : Bool)) == (p && q → p && q → r)"))]))
  let t723 = @term_syntax.parse_term("(i : Real)")
  let t724 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(i' : Real)"), t723]))
  let t722 = @simp.rewrite_tac(@list.List([@theorems.right_imp_forall_thm()]))
  let t721 = @simp.rewrite_tac(@list.List([@realanalysis.real_integrable_on(), @theorems.left_imp_exists_thm()]))
  let t719 = @term_syntax.parse_term("real_integrable_on((x : Real) => pow((f' : (Real) -> Real)(x), 2), real_interval([(real_of_num(0), real_of_num(2) * pi)]))")
  let t720 = @tactics.map_every(fn(x716 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s717 = @tactics.undisch_tac(x716)
    fn(x718 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s717(x718)
    }
  }, @list.List([@term_syntax.parse_term("real_integrable_on((x : Real) => pow((f : (Real) -> Real)(x), 2), real_interval([(real_of_num(0), real_of_num(2) * pi)]))"), t719]))
  let t715 = @simp.rewrite_tac(@list.List([@transcendentals.tan_periodic_npi(), @real.real_sub_refl()]))
  let t714 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * pi - (a : Real) == real_of_num(0) - a + real_of_num(2) * pi"))]))
  let t713 = @simp.rewrite_tac(@list.List([]))
  let t712 = @simp.expand_tac("g")
  let t711 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a1 : Real) - (a0 : Real) + ((a2 : Real) - a1 + ((a3 : Real) - a2)) == a3 - a0"))]))
  let t708 = @drule.match_mp(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool) && (s : Bool) → (t : Bool)) == (r && s → p && q → t)"))]))(@realanalysis.has_real_integral_combine()))
  let t710 = @tactics.disch_then(fn(x709 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x705 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s706 = @tactics.mp_tac(x705)
      fn(x707 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s706(x707)
      }
    })(t708(x709))
  })
  let t704 = @list.List([@calc_rat.asm_real_arith_tac, @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.imp_conj_alt())]))])
  let t701 = @drule.match_mp(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool) && (s : Bool) → (t : Bool)) == (r && s → p && q → t)"))]))(@realanalysis.has_real_integral_combine()))
  let t703 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x695 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s696 = @tactics.mp_tac(x695)
    fn(x697 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s696(x697)
    }
  }, fn(x702 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x698 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s699 = @tactics.mp_tac(x698)
      fn(x700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s699(x700)
      }
    })(t701(x702))
  }))
  let t693 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi())
  let t692 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t691 = @simp.rewrite_tac(@list.List([@transcendentals.sin_periodic_pi(), @real.real_neg_eq_0()]))
  let t690 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - (a : Real) == x - (a + pi) + pi"))]))
  let t694 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))), @tactics.gen_tac), @tactics.strip_tac), t690), t691), t692), t693), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t688 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi())
  let t687 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t689 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))), @tactics.gen_tac), @tactics.strip_tac), t687), t688), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t685 = @tactics.match_mp_tac(@transcendentals.sin_pos_pi())
  let t684 = @tactics.match_mp_tac(@real.real_lt_imp_nz())
  let t683 = @simp.rewrite_tac(@list.List([@transcendentals.sin_neg(), @real.real_neg_eq_0()]))
  let t682 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_neg_sub())]))
  let t686 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac]))), @tactics.gen_tac), @tactics.strip_tac), t682), t683), t684), t685), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t681 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval(), @misc.in_real_interval()]))
  let t680 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p1 : Bool) && (p2 : Bool) && (p3 : Bool) && ((q1 : Bool) && (q2 : Bool) && (q3 : Bool) → (r : Bool)) → (p1 → q1) → (p2 → q2) → (p3 → q3) → r")))
  let t679 = @tactics.disch_then(fn(x672 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x672
    let t677 = @term_syntax.parse_term("(a : Real)")
    let t678 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(0)"), t677]), th))
    let t675 = @term_syntax.parse_term("(a : Real) + pi")
    let t676 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Real)"), t675]), th))
    let t674 = @term_syntax.parse_term("real_of_num(2) * pi")
    @tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Real) + pi"), t674]), th)), t676), t678)
  })
  let t666 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t665 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])))
  let t664 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval(), @misc.in_real_interval()]))
  let t663 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([@real.real_sub_refl()]))])
  let t662 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t657 = @term_syntax.parse_term("(x : Real)")
  let t658 = @list.List([@term_syntax.parse_term("((c : Real) + (d : Real)) / real_of_num(2)"), t657])
  let t661 = @tactics.first_x_assum(fn(x660 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s655 = @tactics.mp_tac(x654)
      fn(x656 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s655(x656)
      }
    })(((x659 : @kernel.Thm) => @bool.specl(t658, x659))(x660))
  })
  let t653 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t652 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t651 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t650 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t649 = @simp.rewrite_tac(@list.List([@realanalysis.eventually_withinreal()]))
  let t667 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_eventually()), t649), t650), t651), t652), t653), @tactics.strip_tac), t661), t662), @tactics.ants_tac), t663), t664), t665), @tactics.gen_tac), @tactics.strip_tac), t666), @calc_rat.asm_real_arith_tac)
  let t648 = @simp.rewrite_tac(@list.List([@sets.in_sing(), @misc.in_real_interval()]))
  let t644 = @term_syntax.parse_term("IN(((c : Real) + (d : Real)) / real_of_num(2))")
  let t647 = @tactics.disch_then(fn(x646 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x641 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s642 = @tactics.mp_tac(x641)
      fn(x643 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s642(x643)
      }
    })(((x645 : @kernel.Thm) => @equal.ap_term(t644, x645))(x646))
  })
  let t640 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(fn(x637 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s638 = @tactics.subst1_tac(x637)
    fn(x639 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s638(x639)
    }
  })])
  let t636 = @simp.rewrite_tac(@list.List([@misc.is_realinterval_interval(), @misc.in_real_interval()]))
  let t630 = @drule.part_match(fn(x629 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x629))
  }, @realanalysis.trivial_limit_within_realinterval())
  let t668 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(fn(x635 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x634 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x632 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x631 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x626 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s627 = @tactics.mp_tac(x626)
            fn(x628 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s627(x628)
            }
          })(t630(x631))
        })(@kernel.rand(x632))
      })((fn(x633 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x633.1
      })(x634))
    })(x635)(x635)
  }, t636), @tactics.ants_tac), t640), t647), t648), @calc_rat.asm_real_arith_tac), t667])
  let t623 = @drule.match_mp(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool) → (s : Bool)) == (q → p && r → s)"))]))(@realanalysis.reallim_unique()))
  let t625 = @tactics.disch_then(fn(x624 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t623(x624))
  })
  let t622 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_withinreal()]))
  let t621 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t617 = @term_syntax.parse_term("(d : Real)")
  let t620 = @tactics.disch_then(fn(x619 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x614 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s615 = @tactics.mp_tac(x614)
      fn(x616 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s615(x616)
      }
    })(((x618 : @kernel.Thm) => @bool.spec(t617, x618))(x619))
  })
  let t612 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t609 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t607 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_continuous_on_subset()))
  let t610 = @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x608 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t607(x608))
  }), t609), @calc_rat.asm_real_arith_tac)
  let t606 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t603 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.absolutely_real_integrable_on_subinterval()))
  let t605 = @tactics.first_x_assum(fn(x604 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t603(x604))
  })
  let t602 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable())
  let t611 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_indefinite_integral_continuous_right()), t602), t605), t606), @calc_rat.asm_real_arith_tac), t610])
  let t601 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_const()]))
  let t613 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_on_sub()), @tactics.conj_tac)), t601), t611), t612])
  let t669 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_continuous_on((x : Real) => real_integral(real_interval([(((c : Real) + (d : Real)) / real_of_num(2), x)]), (g' : (Real) -> Real)) - ((g : (Real) -> Real)(x) - g((c + d) / real_of_num(2))), real_interval([((c + d) / real_of_num(2), d)]))"), fn(x598 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s599 = @tactics.mp_tac(x598)
    fn(x600 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s599(x600)
    }
  }), t613), t620), t621), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t622), t625), @tactics.conj_tac), t668)
  let t595 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t594 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])))
  let t593 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval(), @misc.in_real_interval()]))
  let t592 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([@real.real_sub_refl()]))])
  let t591 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t586 = @term_syntax.parse_term("((c : Real) + (d : Real)) / real_of_num(2)")
  let t587 = @list.List([@term_syntax.parse_term("(x : Real)"), t586])
  let t590 = @tactics.first_x_assum(fn(x589 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x583 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s584 = @tactics.mp_tac(x583)
      fn(x585 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s584(x585)
      }
    })(((x588 : @kernel.Thm) => @bool.specl(t587, x588))(x589))
  })
  let t582 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t581 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t580 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t579 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t578 = @simp.rewrite_tac(@list.List([@realanalysis.eventually_withinreal()]))
  let t596 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_eventually()), t578), t579), t580), t581), t582), @tactics.strip_tac), t590), t591), @tactics.ants_tac), t592), t593), t594), @tactics.gen_tac), @tactics.strip_tac), t595), @calc_rat.asm_real_arith_tac)
  let t577 = @simp.rewrite_tac(@list.List([@sets.in_sing(), @misc.in_real_interval()]))
  let t573 = @term_syntax.parse_term("IN(((c : Real) + (d : Real)) / real_of_num(2))")
  let t576 = @tactics.disch_then(fn(x575 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x570 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s571 = @tactics.mp_tac(x570)
      fn(x572 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s571(x572)
      }
    })(((x574 : @kernel.Thm) => @equal.ap_term(t573, x574))(x575))
  })
  let t569 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(fn(x566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s567 = @tactics.subst1_tac(x566)
    fn(x568 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s567(x568)
    }
  })])
  let t565 = @simp.rewrite_tac(@list.List([@misc.is_realinterval_interval(), @misc.in_real_interval()]))
  let t559 = @drule.part_match(fn(x558 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x558))
  }, @realanalysis.trivial_limit_within_realinterval())
  let t597 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(fn(x564 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x563 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x561 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x560 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x555 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s556 = @tactics.mp_tac(x555)
            fn(x557 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s556(x557)
            }
          })(t559(x560))
        })(@kernel.rand(x561))
      })((fn(x562 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x562.1
      })(x563))
    })(x564)(x564)
  }, t565), @tactics.ants_tac), t569), t576), t577), @calc_rat.asm_real_arith_tac), t596])
  let t552 = @drule.match_mp(@simp.rewrite_rule(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool) && (r : Bool) → (s : Bool)) == (q → p && r → s)"))]))(@realanalysis.reallim_unique()))
  let t554 = @tactics.disch_then(fn(x553 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t552(x553))
  })
  let t551 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_withinreal()]))
  let t550 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t546 = @term_syntax.parse_term("(c : Real)")
  let t549 = @tactics.disch_then(fn(x548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x543 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s544 = @tactics.mp_tac(x543)
      fn(x545 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s544(x545)
      }
    })(((x547 : @kernel.Thm) => @bool.spec(t546, x547))(x548))
  })
  let t541 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t538 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t536 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_continuous_on_subset()))
  let t539 = @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x537 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t536(x537))
  }), t538), @calc_rat.asm_real_arith_tac)
  let t535 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t532 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.absolutely_real_integrable_on_subinterval()))
  let t534 = @tactics.first_x_assum(fn(x533 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t532(x533))
  })
  let t531 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable())
  let t540 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_indefinite_integral_continuous_left()), t531), t534), t535), @calc_rat.asm_real_arith_tac), t539])
  let t530 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_const()]))
  let t542 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_on_sub()), @tactics.conj_tac)), t530), t540), t541])
  let t670 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("real_continuous_on((x : Real) => real_integral(real_interval([(x, ((c : Real) + (d : Real)) / real_of_num(2))]), (g' : (Real) -> Real)) - ((g : (Real) -> Real)((c + d) / real_of_num(2)) - g(x)), real_interval([(c, (c + d) / real_of_num(2))]))"), fn(x527 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s528 = @tactics.mp_tac(x527)
    fn(x529 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s528(x529)
    }
  }), t542), t549), t550), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t551), t554), @tactics.conj_tac), t597), t669])
  let t526 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_0())]))
  let t525 = @tactics.subst1_tac(@calc_rat.real_arith(@term_syntax.parse_term("(g : (Real) -> Real)((d : Real)) - g((c : Real)) == g((c + d) / real_of_num(2)) - g(c) + (g(d) - g((c + d) / real_of_num(2)))")))
  let t523 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t522 = @tactics.match_mp_tac(@realanalysis.real_integral_combine())
  let t524 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t522), t523), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t520 = @term_syntax.parse_term("real_integral(real_interval([((c : Real), (c + (d : Real)) / real_of_num(2))]), (g' : (Real) -> Real)) + real_integral(real_interval([((c + d) / real_of_num(2), d)]), g')")
  let t521 = @tactics.trans_tac(@theorems.eq_trans())(t520)
  let t519 = @list.List([@simp.asm_rewrite_tac(@list.List([@realarith.real_lt_le()])), @tactics.all_tac])
  let t518 = @tactics.subgoal_then(@term_syntax.parse_term("(c : Real) < (d : Real)"), fn(x515 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s516 = @tactics.assume_tac(x515)
    fn(x517 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s516(x517)
    }
  })
  let t514 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_null(), @realax.real_le_refl(), @real.real_sub_refl()]))
  let t513 = @class.asm_cases_tac(@term_syntax.parse_term("(c : Real) == (d : Real)"))
  let t510 = @simp.asm_simp_tac(@list.List([@realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t511 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()])), t510)
  let t509 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t508 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t507 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) <= (a : Real) && abs((y : Real)) <= a → abs(x - y) <= real_of_num(2) * a")))
  let t504 = @simp.asm_rewrite_tac(@list.List([]))
  let t505 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()])), @tactics.strip_tac), t504)
  let t503 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t502 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t501 = @simp.asm_rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t506 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t501), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @tactics.gen_tac), t502), @tactics.strip_tac), t503), @calc_rat.asm_real_arith_tac), t505])
  let t500 = @tactics.subgoal_then(@term_syntax.parse_term("has_real_integral((g' : (Real) -> Real), (g : (Real) -> Real)((v : Real)) - g((u : Real)), real_interval([(u, v)]))"), fn(x497 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s498 = @tactics.mp_tac(x497)
    fn(x499 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s498(x499)
    }
  })
  let t495 = @simp.asm_simp_tac(@list.List([@misc.subset_real_interval(), @real.real_le_pow_2(), @realanalysis.absolutely_real_integrable_imp_integrable()]))
  let t496 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integral_subset_le()), t495), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t494 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= (x' : Real) && abs((g : Real)) <= real_of_num(2) * abs((b : Real)) → real_of_num(2) * x - g <= real_of_num(2) * abs(abs(b) + x')")))
  let t493 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_sub(), @realanalysis.real_integral_lmul(), @realanalysis.absolutely_real_integrable_imp_integrable(), @realanalysis.absolutely_real_integrable_sub(), @realanalysis.absolutely_real_integrable_lmul()]))
  let t491 = @simp.rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t490 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) && real_of_num(0) <= (z : Real) → abs(x - y - z) <= real_of_num(2) * x - (x - y - z)")))
  let t489 = @tactics.repeat_tac(@tactics.strip_tac)
  let t488 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t487 = @simp.expand_tac("g'")
  let t486 = @simp.asm_simp_tac(@list.List([@real.real_abs_pos(), @realanalysis.absolutely_real_integrable_abs(), @realanalysis.absolutely_real_integrable_imp_integrable(), @realanalysis.absolutely_real_integrable_sub(), @realanalysis.absolutely_real_integrable_lmul()]))
  let t492 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integral_le()), t486), t487), t488), t489), t490), t491), @tactics.all_tac])
  let t484 = @term_syntax.parse_term("real_integral(real_interval([((u : Real), (v : Real))]), (x : Real) => real_of_num(2) * pow((f' : (Real) -> Real)(x), 2) - (g' : (Real) -> Real)(x))")
  let t485 = @tactics.trans_tac(@realax.real_le_trans())(t484)
  let t483 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integral_pos(), @real.real_abs_pos(), @realanalysis.absolutely_real_integrable_imp_integrable(), @realanalysis.absolutely_real_integrable_abs()]))
  let t482 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (y : Real) → abs(x) <= y")))
  let t480 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t477 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.absolutely_real_integrable_on_subinterval()))
  let t479 = @tactics.first_x_assum(fn(x478 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t477(x478))
  })
  let t481 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@misc.subset_real_interval()])), @tactics.conj_tac), t479), t480), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t476 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_real_integrable_on((x : Real) => pow((f' : (Real) -> Real)(x), 2), real_interval([((u : Real), (v : Real))])) && absolutely_real_integrable_on((x : Real) => pow((f : (Real) -> Real)(x) - f((a : Real)), 2), real_interval([(u, v)])) && absolutely_real_integrable_on((g' : (Real) -> Real), real_interval([(u, v)]))"), @tactics.strip_assume_tac)
  let t475 = @list.List([@meson.asm_meson_tac(@list.List([@misc.real_interval_eq_empty(), @realanalysis.real_integral_empty(), @calc_rat.real_arith(@term_syntax.parse_term("abs(real_of_num(0)) <= real_of_num(2) * abs((x : Real))"))])), @tactics.all_tac])
  let t474 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t472 = @term_syntax.parse_term("(v : Real)")
  let t473 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Real)"), t472]))
  let t471 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * abs(abs((g : (Real) -> Real)((w : Real))) + real_integral(real_interval([(real_of_num(0), real_of_num(2) * pi)]), (x : Real) => pow((f' : (Real) -> Real)(x), 2)))"))
  let t470 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(w : Real)"))(@tactics.strip_assume_tac))
  let t469 = @simp.asm_simp_tac(@list.List([@realanalysis.real_continuous_on_abs()]))
  let t468 = @simp.asm_rewrite_tac(@list.List([@metric.real_compact_interval(), @misc.real_interval_eq_empty()]))
  let t466 = @term_syntax.parse_term("real_interval([(real_of_num(0), real_of_num(2) * pi)])")
  let t467 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real) => abs((g : (Real) -> Real)(x))"), t466]), @realanalysis.real_continuous_attains_sup()))
  let t465 = @simp.rewrite_tac(@list.List([@metric.real_bounded(), @sets.forall_in_gspec()]))
  let t461 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t458 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.absolutely_real_integrable_on_subinterval()))
  let t460 = @tactics.first_x_assum(fn(x459 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t458(x459))
  })
  let t457 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_imp_integrable())
  let t456 = @simp.asm_simp_tac(@list.List([@misc.subset_real_interval()]))
  let t462 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_sub()), @tactics.conj_tac)), t456), t457), t460), t461), @calc_rat.asm_real_arith_tac)
  let t455 = @simp.rewrite_tac(@list.List([]))
  let t463 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("g'"), t455), @calc_rat.real_arith_tac), t462])
  let t454 = @simp.rewrite_tac(@list.List([]))
  let t453 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => pow((f' : (Real) -> Real)(x), 2) - pow((f : (Real) -> Real)(x) - f((a : Real)), 2) - (g' : (Real) -> Real)(x)"))
  let t452 = @tactics.match_mp_tac(@realanalysis.real_integrable_eq())
  let t449 = @simp.asm_rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t450 = @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.nonnegative_absolutely_real_integrable()), t449)
  let t448 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t445 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.absolutely_real_integrable_on_subinterval()))
  let t447 = @tactics.first_x_assum(fn(x446 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t445(x446))
  })
  let t451 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_sub()), @tactics.conj_tac), t447), t448), @calc_rat.asm_real_arith_tac), t450])
  let t444 = @tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_sub())
  let t443 = @simp.rewrite_tac(@list.List([]))
  let t442 = @simp.expand_tac("g'")
  let t441 = @list.List([@meson.asm_meson_tac(@list.List([@misc.real_interval_eq_empty(), @realanalysis.absolutely_real_integrable_on_empty()])), @tactics.all_tac])
  let t440 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t439 = @term_syntax.parse_term("(v : Real)")
  let t464 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Real)"), t439])), t440), @tactics.strip_tac), t441), t442), t443), t444), @tactics.conj_tac), t451), t452), t453), t454), @tactics.conj_tac), t463), @tactics.disch_tac])
  let t438 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t436 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t435 = @list.List([@tactics.all_tac, @simp.simp_tac(@list.List([]))])
  let t434 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t433 = @simp.asm_rewrite_tac(@list.List([@misc.in_real_interval(), @misc.subset_real_interval()]))
  let t428 = @term_syntax.parse_term("(v : Real)")
  let t429 = @list.List([@term_syntax.parse_term("(u : Real)"), t428])
  let t432 = @tactics.first_x_assum(fn(x431 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s426 = @tactics.mp_tac(x425)
      fn(x427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s426(x427)
      }
    })(((x430 : @kernel.Thm) => @bool.specl(t429, x430))(x431))
  })
  let t424 = @list.List([@meson.asm_meson_tac(@list.List([@misc.real_interval_eq_empty(), @realanalysis.real_integrable_on_empty()])), @tactics.all_tac])
  let t423 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t422 = @term_syntax.parse_term("(v : Real)")
  let t437 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(u : Real)"), t422])), t423), @tactics.strip_tac), t424), t432), t433), t434), @tactics.ants_tac), t435), @tactics.conj_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), @tactics.gen_tac), @tactics.strip_tac), t436), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t421 = @tactics.subgoal_then(@term_syntax.parse_term("∀ u : Real, ∀ v : Real, SUBSET(real_interval([(u, v)]), real_interval(((c : Real), (d : Real)))) → real_integrable_on((g' : (Real) -> Real), real_interval([(u, v)]))"), fn(x418 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s419 = @tactics.assume_tac(x418)
    fn(x420 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s419(x420)
    }
  })
  let t416 = @simp.asm_rewrite_tac(@list.List([@realanalysis.real_continuous_on_const()]))
  let t415 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_sub())
  let t414 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_pow())
  let t413 = @tactics.match_mp_tac(@realanalysis.real_integrable_continuous())
  let t412 = @simp.asm_rewrite_tac(@list.List([@real.real_le_pow_2()]))
  let t417 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@realanalysis.nonnegative_absolutely_real_integrable())), t412), t413), t414), t415), t416), @tactics.all_tac])
  let t411 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_real_integrable_on((x : Real) => pow((f' : (Real) -> Real)(x), 2), real_interval([(real_of_num(0), real_of_num(2) * pi)])) && absolutely_real_integrable_on((x : Real) => pow((f : (Real) -> Real)(x) - f((a : Real)), 2), real_interval([(real_of_num(0), real_of_num(2) * pi)]))"), @tactics.strip_assume_tac)
  let t512 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_improper_simple()), t411), t417), t421), t437), t438), @tactics.conj_tac), t464), t465), t467), t468), t469), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t470), t471), t473), t474), @tactics.strip_tac), t475), t476), t481), t482), t483), t485), @tactics.conj_tac), t492), t493), t494), @tactics.conj_tac), t496), t500), t506), t507), @tactics.conj_tac), t508), t509), @calc_rat.asm_real_arith_tac), t511])
  let t410 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_real_integrable_on((g' : (Real) -> Real), real_interval([((c : Real), (d : Real))]))"), fn(x407 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s408 = @tactics.assume_tac(x407)
    fn(x409 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s408(x409)
    }
  })
  let t406 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.real_not_le())]))
  let t405 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x399 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s400 = @tactics.assume_tac(x399)
    fn(x401 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s400(x401)
    }
  }, fn(x402 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s403 = @tactics.mp_tac(x402)
    fn(x404 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s403(x404)
    }
  }))
  let t398 = @tactics.repeat_tac(@tactics.gen_tac)
  let t671 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.subset_real_interval(), @misc.in_real_interval()])), t398), t405), t406), @tactics.strip_tac), t410), t512), t513), t514), t518), t519), t521), @tactics.conj_tac), t524), t525), @tactics.binop_tac), t526), t670), @tactics.all_tac])
  let t397 = @tactics.subgoal_then(@term_syntax.parse_term("∀ c : Real, ∀ d : Real, c <= d && SUBSET(real_interval([(c, d)]), real_interval([(real_of_num(0), real_of_num(2) * pi)])) && (∀ x : Real, IN(x, real_interval((c, d))) → !(sin(x - (a : Real)) == real_of_num(0))) → has_real_integral((g' : (Real) -> Real), (g : (Real) -> Real)(d) - g(c), real_interval([(c, d)]))"), fn(x394 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s395 = @tactics.mp_tac(x394)
    fn(x396 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s395(x396)
    }
  })
  let t390 = @meson.meson_tac(@list.List([]))
  let t389 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_atreal(), @real.real_sub_rzero()]))
  let t388 = @tactics.mp_tac(@realanalysis.reallim_sin_over_x())
  let t387 = @tactics.match_mp_tac(@realanalysis.reallim_atreal_withinreal())
  let t386 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t385 = @tactics.match_mp_tac(@realanalysis.reallim_inv())
  let t384 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_inv_div())]))
  let t391 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.reallim_abs()), t384), t385), t386), t387), t388), t389), t390)
  let t383 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @realanalysis.real_integral_null(), @realax.real_le_refl(), @real.real_sub_refl(), @real.real_abs_0(), @real.real_sub_rzero()]))
  let t377 = @term_syntax.parse_term("(c : Real)")
  let t378 = @list.List([@term_syntax.parse_term("(x : Real)"), t377])
  let t381 = @tactics.first_x_assum(fn(x380 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x374 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s375 = @tactics.mp_tac(x374)
      fn(x376 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s375(x376)
      }
    })(((x379 : @kernel.Thm) => @bool.specl(t378, x379))(x380))
  })
  let t370 = @term_syntax.parse_term("(x : Real)")
  let t371 = @list.List([@term_syntax.parse_term("(c : Real)"), t370])
  let t382 = @list.List([@tactics.first_x_assum(fn(x373 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x367 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s368 = @tactics.mp_tac(x367)
      fn(x369 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s368(x369)
      }
    })(((x372 : @kernel.Thm) => @bool.specl(t371, x372))(x373))
  }), t381])
  let t366 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero(), @realanalysis.real_segment_interval()]))
  let t365 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t364 = @simp.asm_rewrite_tac(@list.List([]))
  let t363 = @tactics.x_gen_tac(@term_syntax.parse_term("(d : Real)"))
  let t362 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t361 = @simp.asm_rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t355 = @term_syntax.parse_term("(e : Real)")
  let t356 = @term_syntax.parse_term("(c : Real)")
  let t357 = @term_syntax.parse_term("(c : Real)")
  let t358 = @term_syntax.parse_term("real_of_num(2) * pi")
  let t359 = @term_syntax.parse_term("real_of_num(0)")
  let t360 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => pow((f' : (Real) -> Real)(x), 2)"), t359, t358, t357, t356, t355]), @realanalysis.real_indefinite_integral_continuous()))
  let t354 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Real)"))
  let t392 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.reallim_withinreal()])), t354), @tactics.disch_tac), t360), t361), t362), t363), @tactics.strip_tac), t364), t365), @tactics.strip_tac), t366), @class.cond_cases_tac), t382), t383), t391])
  let t353 = @tactics.match_mp_tac(@realanalysis.reallim_mul())
  let t352 = @simp.gen_rewrite_tac(fn(x349 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s350 = @equal.land_conv(x349)
    fn(x351 : @kernel.Term) -> @kernel.Thm raise {
      s350(x351)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) == real_of_num(0) * abs(inv(real_of_num(1)))"))]))
  let t347 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t344 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_integrable_subinterval()))
  let t346 = @tactics.first_x_assum(fn(x345 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t344(x345))
  })
  let t343 = @simp.rewrite_tac(@list.List([@realanalysis.real_segment_interval()]))
  let t342 = @list.List([@tactics.match_mp_tac(@realanalysis.integrable_imp_real_measurable()), @tactics.all_tac])
  let t341 = @tactics.disch_then(@tactics.match_mp_tac)
  let t340 = @simp.rewrite_tac(@list.List([@realanalysis.real_measure_real_segment()]))
  let t339 = @simp.rewrite_tac(@list.List([@realanalysis.real_measurable_real_segment()]))
  let t337 = @term_syntax.parse_term("real_segment([((c : Real), (x : Real))])")
  let t338 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(f' : (Real) -> Real)"), t337]), real_hoelder_bound_2()))
  let t336 = @simp.gen_rewrite_tac(fn(x333 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s334 = @equal.rand_conv(x333)
    fn(x335 : @kernel.Term) -> @kernel.Thm raise {
      s334(x335)
    }
  }, @list.List([@realax.real_mul_sym()]))
  let t331 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t328 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_integrable_subinterval()))
  let t330 = @tactics.first_x_assum(fn(x329 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t328(x329))
  })
  let t327 = @tactics.repeat_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])))
  let t326 = @tactics.match_mp_tac(@realanalysis.real_integral_combine())
  let t324 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) + (z : Real) == (y : Real) → abs(x - y) <= abs(z)")))
  let t325 = @list.List([@tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(y : Real) + (z : Real) == (x : Real) → abs(x - y) <= abs(z)"))), t324])
  let t323 = @simp.rewrite_tac(@list.List([@realanalysis.real_segment_interval()]))
  let t332 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@real.real_le_square_abs())])), t323), @class.cond_cases_tac), t325), t326), t327), t330), t331), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t322 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_integral(real_segment([((c : Real), (x : Real))]), (f' : (Real) -> Real)), 2)"))
  let t321 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t318 = @tactics.then_tac(@simp.simp_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()])), @calc_rat.asm_real_arith_tac)
  let t317 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t319 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.first_x_assum(@tactics.match_mp_tac)), t317), @calc_rat.asm_real_arith_tac), t318])
  let t320 = @list.List([@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("has_real_integral((f' : (Real) -> Real), (f : (Real) -> Real)((c : Real)) - f(real_of_num(0)), real_interval([(real_of_num(0), c)])) && has_real_integral(f', f((x : Real)) - f(real_of_num(0)), real_interval([(real_of_num(0), x)]))"), fn(x314 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s315 = @tactics.mp_tac(x314)
    fn(x316 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s315(x316)
    }
  }), t319), @tactics.all_tac])
  let t313 = @tactics.exists_tac(@term_syntax.parse_term("pow(real_integral(real_interval([(real_of_num(0), (x : Real))]), (f' : (Real) -> Real)) - real_integral(real_interval([(real_of_num(0), (c : Real))]), f'), 2)"))
  let t312 = @tactics.match_mp_tac(@realax.real_le_trans())
  let t311 = @simp.rewrite_tac(@list.List([@real.real_abs_pow(), @real.real_pow2_abs()]))
  let t310 = @simp.rewrite_tac(@list.List([@real.real_abs_pos()]))
  let t309 = @tactics.match_mp_tac(@real.real_le_rmul())
  let t308 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc()]))
  let t307 = @simp.rewrite_tac(@list.List([@misc.in_real_interval(), @real.real_abs_mul(), @realax.real_div()]))
  let t306 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t305 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t304 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t348 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.eventually_withinreal()])), t304), t305), t306), t307), @tactics.strip_tac), t308), t309), t310), t311), t312), t313), @tactics.conj_tac), t320), t321), t322), @tactics.conj_tac), t332), t336), t338), t339), t340), t341), @tactics.conj_tac), t342), t343), @class.cond_cases_tac), t346), t347), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t303 = @simp.rewrite_tac(@list.List([]))
  let t302 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => real_integral(real_segment([((c : Real), x)]), (x : Real) => pow((f' : (Real) -> Real)(x), 2)) * abs((x - c) / sin(x - c))"))
  let t301 = @tactics.match_mp_tac(@realanalysis.reallim_null_comparison())
  let t300 = @simp.rewrite_tac(@list.List([@realanalysis.reallim_null_abs()]))
  let t296 = @tactics.conv_tac(@calc_rat.real_ring)
  let t295 = @simp.asm_rewrite_tac(@list.List([]))
  let t294 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(c : Real) - (a : Real)"), @transcendentals.sin_circle()))
  let t293 = @simp.rewrite_tac(@list.List([@real.real_eq_square_abs()]))
  let t292 = @simp.asm_rewrite_tac(@list.List([@transcendentals.sin_add(), @calc_int.real_mul_rzero(), @calc_int.real_add_rid()]))
  let t291 = @tactics.subst1_tac(@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - (a : Real) == x - (c : Real) + (c - a)")))
  let t297 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_abs_inv()])), @tactics.ap_term_tac), t291), t292), t293), t294), t295), t296)
  let t290 = @simp.asm_rewrite_tac(@list.List([@transcendentals.sin_neg(), @calc_int.real_neg_0(), @transcendentals.sin_periodic_pi(), @realarith.real_lt_refl()]))
  let t289 = @simp.rewrite_tac(@list.List([@realax.real_abs()]))
  let t286 = @drule.match_mp(@transcendentals.sin_pos_pi())
  let t288 = @tactics.disch_then(@tactics.disj_cases_then(fn(x287 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x283 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s284 = @tactics.mp_tac(x283)
      fn(x285 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s284(x285)
      }
    })(t286(x287))
  }))
  let t282 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t281 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) < abs((c : Real) - (a : Real)) && abs(c - a) < pi || real_of_num(0) < abs(-(c - a) + pi) && abs(-(c - a) + pi) < pi"), fn(x278 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s279 = @tactics.mp_tac(x278)
    fn(x280 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s279(x280)
    }
  })
  let t277 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(!(p : Bool) → false) → p")))
  let t276 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([])))])
  let t298 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.ap_term_tac, @tactics.subgoal_then(@term_syntax.parse_term("(c : Real) == (a : Real) || c == a + pi || a == real_of_num(0) && c == real_of_num(2) * pi"), fn(x273 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s274 = @tactics.mp_tac(x273)
    fn(x275 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s274(x275)
    }
  })), t276), t277), @tactics.disch_tac), t281), t282), t288), t289), @class.cond_cases_tac), t290), t297])
  let t272 = @simp.rewrite_tac(@list.List([@misc.in_real_interval(), @real.real_abs_mul()]))
  let t271 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t270 = @simp.rewrite_tac(@list.List([@real.real_lt_01()]))
  let t269 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)"))
  let t299 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.eventually_withinreal()])), t269), t270), t271), t272), @tactics.strip_tac), @tactics.binop_tac), t298), @tactics.all_tac])
  let t268 = @simp.rewrite_tac(@list.List([]))
  let t267 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => abs(pow((f : (Real) -> Real)(x) - f((c : Real)), 2) * inv(sin(x - c)))"))
  let t266 = @tactics.match_mp_tac(@realanalysis.reallim_transform_eventually())
  let t265 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.reallim_null_abs())]))
  let t264 = @simp.asm_rewrite_tac(@list.List([@realax.real_inv_0(), @calc_int.real_mul_lzero(), @calc_int.real_mul_rzero()]))
  let t261 = @tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_withinreal())
  let t260 = @simp.asm_rewrite_tac(@list.List([]))
  let t259 = @tactics.match_mp_tac(@realanalysis.real_continuous_inv_withinreal())
  let t257 = @simp.asm_rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t254 = @simp.gen_rewrite_rule(fn(x253 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x253
  }, @list.List([@realanalysis.real_continuous_on_eq_continuous_within()]))
  let t256 = @tactics.first_x_assum(fn(x255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t254(x255))
  })
  let t252 = @simp.rewrite_tac(@list.List([@realanalysis.real_continuous_const()]))
  let t251 = @tactics.match_mp_tac(@realanalysis.real_continuous_sub())
  let t258 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_pow()), t251), t252), t256), t257), @tactics.all_tac])
  let t262 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_mul()), @tactics.conj_tac), t258), t259), t260), t261), @realanalysis.real_differentiable_tac)
  let t263 = @list.List([@simp.rewrite_tac(@list.List([@realanalysis.real_continuous_withinreal()])), t262])
  let t250 = @class.asm_cases_tac(@term_syntax.parse_term("sin((c : Real) - (a : Real)) == real_of_num(0)"))
  let t249 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_differentiable_imp_continuous_withinreal()), @realanalysis.real_differentiable_tac)])
  let t248 = @tactics.match_mp_tac(@realanalysis.real_continuous_mul())
  let t247 = @simp.rewrite_tac(@list.List([@transcendentals.tan(), @realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv(), @realax.real_mul_assoc()]))
  let t246 = @simp.expand_tac("g")
  let t245 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t244 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Real)"))
  let t393 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.real_continuous_on_eq_continuous_within()])), t244), t245), @tactics.strip_tac), t246), t247), t248), @tactics.conj_tac), t249), t250), t263), t264), t265), t266), t267), t268), @tactics.conj_tac), t299), t300), t301), t302), t303), @tactics.conj_tac), t348), t352), t353), @tactics.conj_tac), t392), @tactics.all_tac])
  let t243 = @tactics.subgoal_then(@term_syntax.parse_term("real_continuous_on((g : (Real) -> Real), real_interval([(real_of_num(0), real_of_num(2) * pi)]))"), fn(x240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s241 = @tactics.assume_tac(x240)
    fn(x242 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s241(x242)
    }
  })
  let t236 = @tactics.conv_tac(@calc_rat.real_field)
  let t235 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real) - (a : Real)"), @transcendentals.sin_circle()))
  let t234 = @simp.rewrite_tac(@list.List([@transcendentals.tan(), @realax.real_div(), @real.real_inv_mul(), @real.real_inv_inv()]))
  let t233 = @simp.asm_rewrite_tac(@list.List([]))
  let t229 = @term_syntax.parse_term("(x : Real)")
  let t232 = @tactics.first_x_assum(fn(x231 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x226 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s227 = @tactics.mp_tac(x226)
      fn(x228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s227(x228)
      }
    })(((x230 : @kernel.Thm) => @bool.spec(t229, x230))(x231))
  })
  let t225 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t224 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t223 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.has_real_integral_eq()))
  let t222 = @simp.asm_rewrite_tac(@list.List([@misc.in_real_interval(), @realax.real_le_refl()]))
  let t218 = @term_syntax.parse_term("(d : Real)")
  let t237 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x221 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x220 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x215 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s216 = @tactics.mp_tac(x215)
        fn(x217 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s216(x217)
        }
      })(((x219 : @kernel.Thm) => @bool.spec(t218, x219))(x220))
    })(@bool.conjunct2(x221))
  }), t222), t223), t224), t225), @tactics.strip_tac), t232), t233), t234), t235), t236)
  let t211 = @tactics.conv_tac(@calc_rat.real_field)
  let t212 = @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(y : Real) - (a : Real)"), @transcendentals.sin_circle())), t211)
  let t213 = @list.List([@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), @calc_rat.asm_real_arith_tac), t212])
  let t210 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t209 = @simp.rewrite_tac(@list.List([@transcendentals.tan(), @real.real_inv_div(), @real.real_inv_inv()]))
  let t208 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Real)"))
  let t207 = @simp.asm_rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t206 = @tactics.match_mp_tac(@realanalysis.real_fundamental_theorem_of_calculus())
  let t205 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t204 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t202 = @simp.simp_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t201 = @simp.asm_rewrite_tac(@list.List([@misc.in_real_interval(), @realax.real_le_refl()]))
  let t198 = @term_syntax.parse_term("(d : Real)")
  let t203 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x200 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x195 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s196 = @tactics.mp_tac(x195)
      fn(x197 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s196(x197)
      }
    })(((x199 : @kernel.Thm) => @bool.spec(t198, x199))(x200))
  }), t201), t202), @tactics.all_tac])
  let t194 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((q : Bool) → (p : Bool)) && q → p && q")))
  let t193 = @simp.rewrite_tac(@list.List([]))
  let t192 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_integrable_neg_eq())]))
  let t191 = @simp.rewrite_tac(@list.List([@realanalysis.real_integrable_neg_eq(), @theorems.conj_assoc()]))
  let t190 = @simp.rewrite_tac(@list.List([@real.real_abs_inv(), @real.real_abs_pow(), @real.real_pow2_abs()]))
  let t214 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.absolutely_real_integrable_on(), @calc_int.real_abs_neg()])), t190), t191), t192), t193), t194), @tactics.conj_tac), t203), t204), t205), @tactics.strip_tac), t206), t207), t208), @tactics.strip_tac), t209), @realanalysis.real_diff_tac), t210), @tactics.conj_tac), t213)
  let t188 = @tactics.then_tac(@simp.simp_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()])), @calc_rat.asm_real_arith_tac)
  let t187 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t189 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.first_x_assum(@tactics.match_mp_tac)), t187), @calc_rat.asm_real_arith_tac), t188])
  let t186 = @tactics.subgoal_then(@term_syntax.parse_term("has_real_integral((f' : (Real) -> Real), (f : (Real) -> Real)((c : Real)) - f(real_of_num(0)), real_interval([(real_of_num(0), c)])) && has_real_integral(f', f((x : Real)) - f(real_of_num(0)), real_interval([(real_of_num(0), x)]))"), fn(x183 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s184 = @tactics.mp_tac(x183)
    fn(x185 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s184(x185)
    }
  })
  let t179 = @term_syntax.parse_term("(c : Real)")
  let t180 = @term_syntax.parse_term("(x : Real)")
  let t181 = @term_syntax.parse_term("real_of_num(0)")
  let t182 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(f' : (Real) -> Real)"), t181, t180, t179]), @realanalysis.real_integral_combine()))
  let t177 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t175 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_integrable_on_subinterval()))
  let t178 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x176 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t175(x176))
  }), t177), @calc_rat.asm_real_arith_tac), @tactics.disch_tac])
  let t174 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t173 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral()]))
  let t170 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t171 = @tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t170), @tactics.strip_tac)
  let t169 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t167 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.absolutely_real_integrable_on_subinterval()))
  let t172 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x168 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t167(x168))
  }), t169), @calc_rat.asm_real_arith_tac), t171])
  let t166 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) - (a : Real) - ((c : Real) - a) == x - c"))]))
  let t165 = @tactics.match_mp_tac(@realanalysis.absolute_real_integration_by_parts_sum())
  let t238 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(2) * ((a : Real) * (b : Real)) == a * b + b * a"))])), t165), t166), @tactics.conj_tac), t172), t173), t174), @tactics.conj_tac), t178), t182), t186), t189), t214])), t237])
  let t164 = @simp.asm_rewrite_tac(@list.List([]))
  let t158 = @term_syntax.parse_term("(d : Real)")
  let t159 = @term_syntax.parse_term("(c : Real)")
  let t160 = @term_syntax.parse_term("(x : Real) => -inv(pow(sin(x - (a : Real)), 2))")
  let t161 = @term_syntax.parse_term("(x : Real) => real_of_num(2) * (((f : (Real) -> Real)(x) - f((a : Real))) * (f' : (Real) -> Real)(x))")
  let t162 = @term_syntax.parse_term("(x : Real) => inv(tan(x - (a : Real)))")
  let t163 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => pow((f : (Real) -> Real)(x) - f((a : Real)), 2)"), t162, t161, t160, t159, t158]), @realanalysis.absolute_real_integration_by_parts_sum()))
  let t157 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t156 = @tactics.map_every(fn(x153 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s154 = @simp.expand_tac(x153)
    fn(x155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s154(x155)
    }
  }, @list.List(["g", "g'"]))
  let t152 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.real_not_le())]))
  let t151 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x145 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s146 = @tactics.assume_tac(x145)
    fn(x147 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s146(x147)
    }
  }, fn(x148 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s149 = @tactics.mp_tac(x148)
    fn(x150 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s149(x150)
    }
  }))
  let t144 = @tactics.repeat_tac(@tactics.gen_tac)
  let t239 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@misc.subset_real_interval(), @misc.in_real_interval()])), t144), t151), t152), @tactics.strip_tac), t156), t157), t163), t164), @tactics.ants_tac), t238), @tactics.all_tac])
  let t143 = @tactics.subgoal_then(@term_syntax.parse_term("∀ c : Real, ∀ d : Real, c <= d && SUBSET(real_interval([(c, d)]), real_interval([(real_of_num(0), real_of_num(2) * pi)])) && (∀ x : Real, IN(x, real_interval([(c, d)])) → !(sin(x - (a : Real)) == real_of_num(0))) → has_real_integral((g' : (Real) -> Real), (g : (Real) -> Real)(d) - g(c), real_interval([(c, d)]))"), fn(x140 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s141 = @tactics.assume_tac(x140)
    fn(x142 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s141(x142)
    }
  })
  let t138 = @term_syntax.parse_term("(g' : (Real) -> Real) == ((x : Real) => pow((f' : (Real) -> Real)(x), 2) - pow((f : (Real) -> Real)(x) - f((a : Real)), 2) - pow(f'(x) - (f(x) - f(a)) / tan(x - a), 2))")
  let t139 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(g : (Real) -> Real) == ((x : Real) => pow((f : (Real) -> Real)(x) - f((a : Real)), 2) / tan(x - a))"), t138]))
  let t134 = @meson.asm_meson_tac(@list.List([]))
  let t135 = @tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) < pi) == (a <= pi && !(a == pi))"))])), t134)
  let t133 = @simp.rewrite_tac(@list.List([@realax.real_le_refl(), @transcendentals.pi_pos()]))
  let t132 = @simp.asm_rewrite_tac(@list.List([@realax.real_add_lid()]))
  let t131 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)"))
  let t130 = @tactics.disch_then(fn(x129 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x128 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x127 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s125 = @tactics.assume_tac(x124)
          fn(x126 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s125(x126)
          }
        })(@equal.sym(x127))
      })(@lib.last(x128))
    })(@bool.conjuncts_rule(x129))
  })
  let t136 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@equal.gsym(@real.real_mul_2())])), t130), t131), t132), t133), t135])
  let t123 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Real) == pi"))
  let t122 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Real)"))
  let t120 = @simp.rewrite_tac(@list.List([@misc.in_real_interval(), @theorems.left_imp_exists_thm(), @realarith.real_sub_0()]))
  let t119 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t118 = @simp.rewrite_tac(@list.List([@misc.subset_real_interval()]))
  let t115 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_continuous_on_subset()))
  let t117 = @tactics.first_x_assum(fn(x116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t115(x116))
  })
  let t113 = @simp.rewrite_tac(@list.List([@equal.gsym(@realanalysis.real_interval_translation())]))
  let t112 = @simp.once_rewrite_tac(@list.List([@realax.real_add_sym()]))
  let t111 = @simp.simp_tac(@list.List([@realanalysis.real_continuous_on_add(), @realanalysis.real_continuous_on_id(), @realanalysis.real_continuous_on_const()]))
  let t110 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_compose())
  let t114 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x107 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s108 = @equal.land_conv(x107)
    fn(x109 : @kernel.Term) -> @kernel.Thm raise {
      s108(x109)
    }
  }, @list.List([@equal.gsym(@trivia.o_def())])), t110), t111), t112), t113), @tactics.all_tac])
  let t121 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_on_sub()), @tactics.conj_tac), t114), t117), t118), t119), @calc_rat.real_arith_tac), t120])
  let t106 = @simp.rewrite_tac(@list.List([@realax.real_le_total()]))
  let t105 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((q1 : Bool) || (q2 : Bool)) && (p : Bool) && ((r : Bool) → (s : Bool)) → (p && q1 → r) → (p && q2 → r) → s")))
  let t104 = @simp.rewrite_tac(@list.List([@realarith.real_sub_le(), @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - (b : Real) <= real_of_num(0)) == (a <= b)"))]))
  let t103 = @simp.asm_simp_tac(@list.List([@transcendentals.pi_pos_le(), @realax.real_add_lid(), @equal.gsym(@real.real_mul_2())]))
  let t99 = @term_syntax.parse_term("real_of_num(0)")
  let t100 = @term_syntax.parse_term("pi")
  let t101 = @term_syntax.parse_term("real_of_num(0)")
  let t102 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => (f : (Real) -> Real)(x + pi) - f(x)"), t101, t100, t99]), @realanalysis.real_ivt_decreasing()))
  let t96 = @term_syntax.parse_term("real_of_num(0)")
  let t97 = @term_syntax.parse_term("pi")
  let t98 = @term_syntax.parse_term("real_of_num(0)")
  let t137 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Real) => (f : (Real) -> Real)(x + pi) - f(x)"), t98, t97, t96]), @realanalysis.real_ivt_increasing())), t102), t103), t104), t105), t106), @tactics.conj_tac), t121), t122), t123), t136), @tactics.all_tac])
  let t95 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : Real, real_of_num(0) <= a && a < pi && (f : (Real) -> Real)(a + pi) == f(a)"), @tactics.strip_assume_tac)
  let t93 = @simp.asm_rewrite_tac(@list.List([]))
  let t92 = @tactics.match_mp_tac(@realanalysis.real_continuous_on_pow())
  let t94 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_integrable_continuous()), t92), t93), @tactics.disch_tac])
  let t91 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t89 = @simp.asm_simp_tac(@list.List([@real.real_sub_add()]))
  let t88 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@realanalysis.has_real_integral_integrable_integral()])))
  let t87 = @simp.asm_simp_tac(@list.List([@realanalysis.real_indefinite_integral_continuous_right(), @realanalysis.real_continuous_on_add(), @realanalysis.real_continuous_on_const()]))
  let t86 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => real_integral(real_interval([(real_of_num(0), x)]), (f' : (Real) -> Real)) + (f : (Real) -> Real)(real_of_num(0))"))
  let t90 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_continuous_on_eq()), t86), t87), t88), t89), @tactics.all_tac])
  let t85 = @tactics.subgoal_then(@term_syntax.parse_term("real_continuous_on((f : (Real) -> Real), real_interval([(real_of_num(0), real_of_num(2) * pi)]))"), fn(x82 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s83 = @tactics.assume_tac(x82)
    fn(x84 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s83(x84)
    }
  })
  let t80 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(1) + (f' : (Real) -> Real)((x : Real))"), @real.real_le_pow_2()))
  let t79 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(1) - (f' : (Real) -> Real)((x : Real))"), @real.real_le_pow_2()))
  let t78 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)"))
  let t77 = @simp.asm_simp_tac(@list.List([@realanalysis.real_integrable_add(), @realanalysis.real_integrable_const()]))
  let t76 = @tactics.exists_tac(@term_syntax.parse_term("(x : Real) => real_of_num(1) + pow((f' : (Real) -> Real)(x), 2)"))
  let t81 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.absolutely_real_integrable_integrable_bound()), t76), t77), t78), @tactics.strip_tac), t79), t80), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t75 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_real_integrable_on((f' : (Real) -> Real), real_interval([(real_of_num(0), real_of_num(2) * pi)]))"), fn(x72 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s73 = @tactics.assume_tac(x72)
    fn(x74 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s73(x74)
    }
  })
  let t69 = @simp.simp_tac(@list.List([]))
  let t70 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.real_arith_tac), t69])
  let t68 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral_integrable_integral(), @misc.in_real_interval()]))
  let t65 = @term_syntax.parse_term("real_of_num(2) * pi")
  let t71 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x67 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x62 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s63 = @tactics.mp_tac(x62)
      fn(x64 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s63(x64)
      }
    })(((x66 : @kernel.Thm) => @bool.spec(t65, x66))(x67))
  }), t68), @tactics.ants_tac), t70), @tactics.all_tac])
  let t61 = @tactics.subgoal_then(@term_syntax.parse_term("real_integrable_on((f' : (Real) -> Real), real_interval([(real_of_num(0), real_of_num(2) * pi)]))"), fn(x58 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s59 = @tactics.assume_tac(x58)
    fn(x60 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s59(x60)
    }
  })
  let t1179 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t61), t71), t75), t81), t85), t90), t91), @tactics.conj_tac), t94), t95), t137), t139), t143), t239), t243), t393), t397), t671), t679), t680), t681), @tactics.conj_tac), t686), @tactics.conj_tac), t689), @tactics.conj_tac), t694), t703), @tactics.ants_tac), t704), t710), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t711), t712), t713), t714), t715), t720), t721), t722), t724), t726), t734), @tactics.strip_tac), t735), t741), t742), t748), t749), t750), t751), t760), t761), t767), t768), t771), t777), t778), t779), fn(x789 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x788 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x786 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x785 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x780 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s781 = @tactics.mp_tac(x780)
            fn(x782 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s781(x782)
            }
          })(t784(x785))
        })(@equal.lhand(x786))
      })((fn(x787 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x787.1
      })(x788))
    })(x789)(x789)
  }), t790), t794), t795), t796), t797), t805), @tactics.strip_tac), t809), t901), t905), t920), t921), t1028), t1036), t1037), t1038), @tactics.conj_tac), t1043), @tactics.conj_tac), t1046), @tactics.conj_tac), t1051), t1057), t1063), t1066), t1067), @tactics.ants_tac), t1084), t1088), t1165), t1170), t1171), t1178), @calc_rat.real_arith_tac)
  wirtinger_inequality_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ f' : (Real) -> Real, (∀ x : Real, IN(x, real_interval([(real_of_num(0), real_of_num(2) * pi)])) → has_real_integral(f', f(x) - f(real_of_num(0)), real_interval([(real_of_num(0), x)]))) && f(real_of_num(2) * pi) == f(real_of_num(0)) && has_real_integral(f, real_of_num(0), real_interval([(real_of_num(0), real_of_num(2) * pi)])) && real_integrable_on((x : Real) => pow(f'(x), 2), real_interval([(real_of_num(0), real_of_num(2) * pi)])) → real_integrable_on((x : Real) => pow(f(x), 2), real_interval([(real_of_num(0), real_of_num(2) * pi)])) && real_integral(real_interval([(real_of_num(0), real_of_num(2) * pi)]), (x : Real) => pow(f(x), 2)) <= real_integral(real_interval([(real_of_num(0), real_of_num(2) * pi)]), (x : Real) => pow(f'(x), 2)) && (real_integral(real_interval([(real_of_num(0), real_of_num(2) * pi)]), (x : Real) => pow(f(x), 2)) == real_integral(real_interval([(real_of_num(0), real_of_num(2) * pi)]), (x : Real) => pow(f'(x), 2)) → (∃ c : Real, ∃ a : Real, ∀ x : Real, IN(x, real_interval([(real_of_num(0), real_of_num(2) * pi)])) → f(x) == c * sin(x - a)))"), t1179))
}

///|
let wirtinger_inequality_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WIRTINGER_INEQUALITY")

///|
/// `WIRTINGER_INEQUALITY`
pub fn wirtinger_inequality() -> @kernel.Thm {
  wirtinger_inequality_c.get()
}

///|
/// SCALED_WIRTINGER_INEQUALITY
fn step_6() -> Unit raise {
  let t1319 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t1318 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t1317 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(2) * (pi * (x : Real)) <= real_of_num(2) * pi) == (pi * x <= pi * real_of_num(1))"))]))
  let t1316 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1315 = @simp.asm_simp_tac(@list.List([@transcendentals.pi_pos(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < pi → inv(real_of_num(2) * pi) * (real_of_num(2) * (pi * (x : Real))) == x")), @realax.real_le_mul(), @realarith.real_pos(), @realarith.real_lt_imp_le()]))
  let t1314 = @tactics.disch_then(fn(x1311 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1311
    let t1313 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(2) * (pi * (x : Real))"), th_2))
    @tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), @tactics.strip_tac), t1313)
  })
  let t1310 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t1309 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Real)"))
  let t1308 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1307 = @tactics.x_gen_tac(@term_syntax.parse_term("(c : Real)"))
  let t1306 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t1305 = @simp.rewrite_tac(@list.List([]))
  let t1304 = @tactics.match_mp_tac(@theorems.mono_imp())
  let t1302 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (z : Real) → ((x : Real) / z == (y : Real) / z) == (x == y)"))
  let t1303 = @simp.simp_tac(@list.List([@real.real_le_div2_eq(), @transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (x : Real)) == (real_of_num(0) < x)")), t1302]))
  let t1301 = @tactics.match_mp_tac(@theorems.mono_and())
  let t1299 = @tactics.conv_tac(@calc_rat.real_field)
  let t1298 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t1297 = @simp.simp_tac(@list.List([@realanalysis.has_real_integral_integrable_integral(), @realanalysis.real_integral_lmul()]))
  let t1296 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @realarith.real_mul_rid()]))
  let t1295 = @simp.rewrite_tac(@list.List([@real.real_inv_inv(), @real.real_abs_inv(), @calc_int.real_abs_num(), @real.real_abs_mul(), @transcendentals.real_abs_pi()]))
  let t1294 = @tactics.thenl(@class.cond_cases_tac, @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.asm_real_arith_tac)]))
  let t1293 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1292 = @simp.rewrite_tac(@list.List([@misc.real_interval_eq_empty()]))
  let t1290 = @tactics.conv_tac(@calc_rat.real_field)
  let t1291 = @tactics.thenl(@tactics.ants_tac, @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), t1290), @tactics.all_tac]))
  let t1289 = @simp.rewrite_tac(@list.List([@realanalysis.image_stretch_real_interval(), @real.real_le_inv_eq()]))
  let t1288 = @tactics.disch_then(fn(x1284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1284
    let t1286 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.has_real_integral_stretch()))(th_1)
    let t1287 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("inv(real_of_num(2) * pi)"), t1286))
    @tactics.then_tac(@tactics.subst1_tac(@drule.match_mp(@realanalysis.real_integral_unique())(th_1)), t1287)
  })
  let t1283 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(y : Real)"))(fn(x1280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1281 = @tactics.mp_tac(x1280)
    fn(x1282 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1281(x1282)
    }
  }))
  let t1279 = @simp.rewrite_tac(@list.List([@realanalysis.real_integrable_on()]))
  let t1277 = @tactics.undisch_tac(@term_syntax.parse_term("real_integrable_on((x : Real) => pow((f' : (Real) -> Real)(x), 2), real_interval([(real_of_num(0), real_of_num(1))]))"))
  let t1278 = @list.List([@tactics.undisch_tac(@term_syntax.parse_term("real_integrable_on((x : Real) => pow((f : (Real) -> Real)(x), 2), real_interval([(real_of_num(0), real_of_num(1))]))")), t1277])
  let t1300 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@real.real_pow_mul(), @realax.real_mul_assoc(), @realanalysis.real_integral_lmul()])), @tactics.conj_tac), t1278), t1279), t1283), t1288), t1289), t1291), t1292), t1293), t1294), t1295), t1296), t1297), @tactics.strip_tac), t1298), t1299), @tactics.all_tac])
  let t1275 = @tactics.conjuncts_then(fn(x1272 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1273 = @tactics.subst1_tac(x1272)
    fn(x1274 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1273(x1274)
    }
  })
  let t1276 = @tactics.subgoal_then(@term_syntax.parse_term("real_integral(real_interval([(real_of_num(0), real_of_num(2) * pi)]), (x : Real) => pow((f : (Real) -> Real)(inv(real_of_num(2) * pi) * x), 2)) == real_integral(real_interval([(real_of_num(0), real_of_num(1))]), (x : Real) => pow(real_of_num(2) * (pi * f(x)), 2)) / (real_of_num(2) * pi) && real_integral(real_interval([(real_of_num(0), real_of_num(2) * pi)]), (x : Real) => pow(inv(real_of_num(2) * pi) * (f' : (Real) -> Real)(inv(real_of_num(2) * pi) * x), 2)) == real_integral(real_interval([(real_of_num(0), real_of_num(1))]), (x : Real) => pow(f'(x), 2)) / (real_of_num(2) * pi)"), t1275)
  let t1269 = @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (x : Real)) == (real_of_num(0) < x)"))
  let t1270 = @simp.simp_tac(@list.List([@transcendentals.pi_pos(), @real.real_lt_imp_nz(), @realax.real_mul_linv(), @calc_int.real_mul_rzero(), @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (t : Real) → inv(t) * (t * (x : Real)) == x")), t1269]))
  let t1268 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), @calc_rat.asm_real_arith_tac)])
  let t1267 = @simp.asm_rewrite_tac(@list.List([]))
  let t1266 = @simp.rewrite_tac(@list.List([@misc.real_interval_eq_empty(), @equal.gsym(@real.real_not_le()), @class.cond_swap()]))
  let t1264 = @tactics.conv_tac(@calc_rat.real_field)
  let t1265 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), t1264), @tactics.all_tac])
  let t1263 = @simp.rewrite_tac(@list.List([@realanalysis.image_stretch_real_interval(), @real.real_le_inv_eq()]))
  let t1261 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_integrable_stretch()))
  let t1258 = @term_syntax.parse_term("real_of_num(2) * pi")
  let t1271 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1262 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1260 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1255 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1256 = @tactics.mp_tac(x1255)
        fn(x1257 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1256(x1257)
        }
      })(((x1259 : @kernel.Thm) => @bool.spec(t1258, x1259))(x1260))
    })(t1261(x1262))
  }), t1263), @tactics.ants_tac), t1265), t1266), @class.cond_cases_tac), t1267), t1268), t1270), @tactics.disch_tac])
  let t1254 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((p : Bool) → (p' : Bool)) && (p' → (q : Bool) → (q' : Bool)) → p && q → p' && q'")))
  let t1251 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t1250 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid()]))
  let t1249 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1248 = @simp.rewrite_tac(@list.List([@real.real_inv_inv(), @calc_int.real_mul_rzero(), @misc.real_interval_eq_empty()]))
  let t1247 = @simp.rewrite_tac(@list.List([@realanalysis.image_stretch_real_interval(), @real.real_sub_rzero()]))
  let t1246 = @tactics.conv_tac(@calc_rat.real_field)
  let t1252 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), t1246), @tactics.all_tac])), t1247), t1248), t1249), @class.cond_cases_tac), t1250), t1251), @calc_rat.asm_real_arith_tac)
  let t1239 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.real_integrable_stretch()))
  let t1236 = @term_syntax.parse_term("inv(real_of_num(2) * pi)")
  let t1241 = @tactics.first_x_assum(fn(x1240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1238 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1233 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1234 = @tactics.mp_tac(x1233)
        fn(x1235 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1234(x1235)
        }
      })(((x1237 : @kernel.Thm) => @bool.spec(t1236, x1237))(x1238))
    })(t1239(x1240))
  })
  let t1232 = @tactics.match_mp_tac(@realanalysis.real_integrable_lmul())
  let t1242 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@real.real_pow_mul()])), t1232), t1241)
  let t1230 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.has_real_integral_stretch()))
  let t1227 = @term_syntax.parse_term("inv(real_of_num(2) * pi)")
  let t1243 = @tactics.first_x_assum(fn(x1231 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1229 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1224 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1225 = @tactics.mp_tac(x1224)
        fn(x1226 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1225(x1226)
        }
      })(((x1228 : @kernel.Thm) => @bool.spec(t1227, x1228))(x1229))
    })(t1230(x1231))
  })
  let t1223 = @tactics.conv_tac(@calc_rat.real_field)
  let t1222 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t1221 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t1244 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(f : (Real) -> Real)(real_of_num(1)) == f(real_of_num(0))")), t1221), @tactics.binop_tac), @tactics.ap_term_tac), t1222), t1223)
  let t1220 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_mul_assoc())]))
  let t1219 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("inv((x : Real)) * (y : Real) == y / x"))]))
  let t1218 = @simp.asm_simp_tac(@list.List([@real.real_lt_ldiv_eq(), @realarith.real_lt_imp_le(), @real.real_div_lmul(), @transcendentals.pi_pos(), @real.real_lt_imp_nz(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (x : Real)) == (real_of_num(0) < x)"))]))
  let t1217 = @simp.rewrite_tac(@list.List([@misc.real_interval_eq_empty(), @calc_int.real_mul_rzero(), @calc_int.real_add_rid(), @real.real_abs_inv(), @real.real_inv_inv(), @real.real_abs_mul(), @calc_int.real_abs_num(), @transcendentals.real_abs_pi()]))
  let t1216 = @simp.rewrite_tac(@list.List([@realanalysis.image_stretch_real_interval(), @real.real_sub_rzero()]))
  let t1214 = @tactics.conv_tac(@calc_rat.real_field)
  let t1215 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), t1214), @tactics.all_tac])
  let t1211 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@realanalysis.has_real_integral_stretch()))
  let t1208 = @term_syntax.parse_term("inv(real_of_num(2) * pi)")
  let t1213 = @tactics.disch_then(fn(x1212 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1210 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1205 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1206 = @tactics.mp_tac(x1205)
        fn(x1207 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1206(x1207)
        }
      })(((x1209 : @kernel.Thm) => @bool.spec(t1208, x1209))(x1210))
    })(t1211(x1212))
  })
  let t1204 = @simp.simp_tac(@list.List([@misc.in_real_interval(), @real.real_le_ldiv_eq(), @real.real_le_rdiv_eq(), @transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(2) * (x : Real)) == (real_of_num(0) < x)"))]))
  let t1200 = @term_syntax.parse_term("(x : Real) / (real_of_num(2) * pi)")
  let t1203 = @tactics.first_x_assum(fn(x1202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1197 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1198 = @tactics.mp_tac(x1197)
      fn(x1199 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1198(x1199)
      }
    })(((x1201 : @kernel.Thm) => @bool.spec(t1200, x1201))(x1202))
  })
  let t1196 = @tactics.match_mp_tac(@realanalysis.has_real_integral_lmul())
  let t1195 = @tactics.disch_then(fn(x1190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1190
    @simp.gen_rewrite_tac(fn(x1192 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1193 = @equal.land_conv(x1192)
      fn(x1194 : @kernel.Term) -> @kernel.Thm raise {
        s1193(x1194)
      }
    }, @list.List([th]))
  })
  let t1188 = @tactics.conv_tac(@calc_rat.real_field)
  let t1189 = @list.List([@tactics.then_tac(@tactics.mp_tac(@transcendentals.pi_pos()), t1188), @tactics.all_tac])
  let t1187 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Real, x == inv(real_of_num(2) * pi) * (real_of_num(2) * (pi * x))"), fn(x1184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1185 = @tactics.mp_tac(x1184)
    fn(x1186 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1185(x1186)
    }
  })
  let t1183 = @simp.rewrite_tac(@list.List([@misc.in_real_interval()]))
  let t1245 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t1183), @tactics.strip_tac), t1187), t1189), t1195), t1196), t1203), t1204), @tactics.ants_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1213), @tactics.ants_tac), t1215), t1216), t1217), t1218), @class.cond_cases_tac), @list.List([@calc_rat.asm_real_arith_tac, @tactics.all_tac])), t1219), t1220), t1244, t1243, t1242])
  let t1253 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t1245), t1252), @tactics.all_tac])
  let t1182 = @simp.rewrite_tac(@list.List([]))
  let t1180 = @term_syntax.parse_term("(x : Real) => inv(real_of_num(2) * pi) * (f' : (Real) -> Real)(inv(real_of_num(2) * pi) * x)")
  let t1181 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real) => (f : (Real) -> Real)(inv(real_of_num(2) * pi) * x)"), t1180]), wirtinger_inequality()))
  let t1320 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1181), t1182), @tactics.ants_tac), t1253), t1254), @tactics.conj_tac), t1271), t1276), t1300), t1301), t1303), t1304), t1305), t1306), t1307), t1308), t1309), t1310), t1314), t1315), t1316), t1317), t1318), t1319), @calc_rat.asm_real_arith_tac)
  scaled_wirtinger_inequality_c.set(@tactics.prove(@term_syntax.parse_term("∀ f : (Real) -> Real, ∀ f' : (Real) -> Real, (∀ x : Real, IN(x, real_interval([(real_of_num(0), real_of_num(1))])) → has_real_integral(f', f(x) - f(real_of_num(0)), real_interval([(real_of_num(0), x)]))) && f(real_of_num(1)) == f(real_of_num(0)) && has_real_integral(f, real_of_num(0), real_interval([(real_of_num(0), real_of_num(1))])) && real_integrable_on((x : Real) => pow(f'(x), 2), real_interval([(real_of_num(0), real_of_num(1))])) → real_integrable_on((x : Real) => pow(f(x), 2), real_interval([(real_of_num(0), real_of_num(1))])) && real_integral(real_interval([(real_of_num(0), real_of_num(1))]), (x : Real) => pow(real_of_num(2) * (pi * f(x)), 2)) <= real_integral(real_interval([(real_of_num(0), real_of_num(1))]), (x : Real) => pow(f'(x), 2)) && (real_integral(real_interval([(real_of_num(0), real_of_num(1))]), (x : Real) => pow(real_of_num(2) * (pi * f(x)), 2)) == real_integral(real_interval([(real_of_num(0), real_of_num(1))]), (x : Real) => pow(f'(x), 2)) → (∃ c : Real, ∃ a : Real, ∀ x : Real, IN(x, real_interval([(real_of_num(0), real_of_num(1))])) → f(x) == c * sin(real_of_num(2) * (pi * x) - a)))"), t1320))
}

///|
let scaled_wirtinger_inequality_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SCALED_WIRTINGER_INEQUALITY")

///|
/// `SCALED_WIRTINGER_INEQUALITY`
pub fn scaled_wirtinger_inequality() -> @kernel.Thm {
  scaled_wirtinger_inequality_c.get()
}

///|
/// GREEN_AREA_THEOREM
fn step_7() -> Unit raise {
  let t1343 = @meson.asm_meson_tac(@list.List([]))
  let t1342 = @simp.rewrite_tac(@list.List([@equal.gsym(@derivatives.vector_derivative_works()), @derivatives.vector_differentiable()]))
  let t1341 = @simp.asm_simp_tac(@list.List([]))
  let t1339 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t1340 = @tactics.map_every(fn(x1336 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1337 = @tactics.exists_tac(x1336)
    fn(x1338 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1337(x1338)
    }
  }, @list.List([@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), t1339]))
  let t1335 = @tactics.match_mp_tac(@derivatives.vector_derivative_unique_at())
  let t1334 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@vectors.lift_eq())]))
  let t1333 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t1332 = @simp.asm_rewrite_tac(@list.List([]))
  let t1331 = @tactics.exists_tac(@term_syntax.parse_term("(u : (Cart[Real, Unit]) -> Bool)"))
  let t1328 = @tactics.match_mp_tac(@integration.integral_spike())
  let t1329 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x1327 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1325 = @tactics.subst1_tac(x1324)
      fn(x1326 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1325(x1326)
      }
    })(@equal.sym(x1327))
  }), @tactics.ap_term_tac), t1328)
  let t1330 = @list.List([@tactics.match_mp_tac(@integration.integrable_spike()), t1329])
  let t1323 = @tactics.match_mp_tac(@theorems.mono_and())
  let t1322 = @simp.asm_rewrite_tac(@list.List([]))
  let t1321 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), @green.green_area_abs_alt()))
  let t1344 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1321), t1322), t1323), @tactics.conj_tac), t1330), t1331), t1332), t1333), @tactics.disch_tac), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_thm_tac), @tactics.ap_term_tac), t1334), t1335), t1340), t1341), t1342), t1343)
  green_area_theorem_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ g' : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ u : (Cart[Real, Unit]) -> Bool, ∀ a : Cart[Real, 2], simple_path(g) && pathstart(g) == a && pathfinish(g) == a && absolutely_continuous_on(g, interval([(vec(0), vec(1))])) && negligible(u) && (∀ t : Cart[Real, Unit], IN(t, DIFF(interval([(vec(0), vec(1))]), u)) → has_vector_derivative(g, g'(t), at(t))) → integrable_on((t : Cart[Real, Unit]) => lift(op_dollar(g'(t), 1) * op_dollar(g(t), 2)), interval([(vec(0), vec(1))])) && norm(integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => lift(op_dollar(g'(t), 1) * op_dollar(g(t), 2)))) == measure(inside(path_image(g)))"), t1344))
}

///|
let green_area_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GREEN_AREA_THEOREM")

///|
/// `GREEN_AREA_THEOREM`
pub fn green_area_theorem() -> @kernel.Thm {
  green_area_theorem_c.get()
}

///|
/// ISOPERIMETRIC_THEOREM_CONVEX
fn step_8() -> Unit raise {
  let t2149 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith(), @topology.homeomorphic_refl()]))
  let t2146 = @term_syntax.parse_term("abs((C : Real))")
  let t2147 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t2148 = @tactics.map_every(fn(x2143 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2144 = @tactics.exists_tac(x2143)
    fn(x2145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2144(x2145)
    }
  }, @list.List([@term_syntax.parse_term("sphere(((z : Cart[Real, 2]), abs((C : Real))))"), t2147, t2146]))
  let t2142 = @tactics.match_mp_tac(@paths.jordan_brouwer_nonseparation())
  let t2141 = @simp.asm_simp_tac(@list.List([@paths.bounded_path_image(), @paths.simple_path_imp_path()]))
  let t2140 = @tactics.match_mp_tac(@paths.inside_bounded_complement_connected_empty())
  let t2139 = @simp.rewrite_tac(@list.List([]))
  let t2138 = @tactics.undisch_tac(@term_syntax.parse_term("!(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))) == {})"))
  let t2137 = @simp.abbrev_tac(@term_syntax.parse_term("(z : Cart[Real, 2]) == vector([(sgn : Real) * ((C : Real) * cos((A : Real))), real_of_num(0)])"))
  let t2135 = @tactics.conv_tac(@calc_rat.real_ring)
  let t2134 = @tactics.undisch_tac(@term_syntax.parse_term("pow((sgn : Real), 2) == real_of_num(1)"))
  let t2133 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("real_of_num(2) * (pi * drop((x : Cart[Real, Unit]))) - (A : Real)"), @transcendentals.sin_circle()))
  let t2132 = @simp.asm_simp_tac(@list.List([]))
  let t2131 = @simp.rewrite_tac(@list.List([@vectors.dot_2(), @vectors.vector_sub_component(), @vectors.vector_2()]))
  let t2130 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t2129 = @simp.rewrite_tac(@list.List([@vectors.dist(), @vectors.norm_eq_square(), @real.real_abs_pos(), @real.real_pow2_abs()]))
  let t2136 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.path_image(), @sets.subset(), @sets.forall_in_image(), @topology.in_sphere()])), t2129), t2130), @tactics.disch_tac), t2131), t2132), t2133), t2134), t2135), @tactics.all_tac])
  let t2128 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) && !PSUBSET(s, t) → s == t")))
  let t2126 = @term_syntax.parse_term("abs((C : Real))")
  let t2127 = @tactics.map_every(fn(x2123 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2124 = @tactics.exists_tac(x2123)
    fn(x2125 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2124(x2125)
    }
  }, @list.List([@term_syntax.parse_term("(vector : (List[Real]) -> Cart[Real, 2])([(sgn : Real) * ((C : Real) * cos((A : Real))), real_of_num(0)])"), t2126]))
  let t2121 = @tactics.match_mp_tac(@theorems.eq_imp())
  let t2120 = @simp.rewrite_tac(@list.List([@vectors.lift_num(), @vectors.lift_drop()]))
  let t2117 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_rzero(), @real.real_sub_lzero(), @transcendentals.cos_neg()]))
  let t2118 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@realanalysis.has_real_integral(), @trivia.o_def(), @topology.image_lift_real_interval()])), t2117)
  let t2116 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2115 = @simp.asm_rewrite_tac(@list.List([]))
  let t2119 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@realanalysis.real_fundamental_theorem_of_calculus()), t2115), t2116), @realanalysis.real_diff_tac), @calc_rat.real_arith_tac), t2118])
  let t2114 = @tactics.subgoal_then(@term_syntax.parse_term("has_real_integral((x : Real) => real_of_num(2) * (pi * ((sgn : Real) * ((C : Real) * sin(real_of_num(2) * (pi * x) - (A : Real))))), -sgn * (C * cos(real_of_num(2) * (pi * drop((x : Cart[Real, Unit]))) - A)) - -sgn * (C * cos(real_of_num(2) * (pi * real_of_num(0)) - A)), real_interval([(real_of_num(0), drop(x))]))"), fn(x2111 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2112 = @tactics.mp_tac(x2111)
    fn(x2113 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2112(x2113)
    }
  })
  let t2109 = @simp.rewrite_tac(@list.List([@real.real_sub_rzero()]))
  let t2108 = @simp.asm_rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith(), @vectors.vector_sub_component()]))
  let t2104 = @term_syntax.parse_term("1")
  let t2107 = @tactics.disch_then(fn(x2106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2101 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2102 = @tactics.mp_tac(x2101)
      fn(x2103 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2102(x2103)
      }
    })(((x2105 : @kernel.Thm) => @bool.spec(t2104, x2105))(x2106))
  })
  let t2100 = @simp.gen_rewrite_tac(fn(x2097 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2098 = @equal.land_conv(x2097)
    fn(x2099 : @kernel.Term) -> @kernel.Thm raise {
      s2098(x2099)
    }
  }, @list.List([@integration.has_integral_componentwise()]))
  let t2095 = @equal.gsym(@theorems.imp_conj_alt())
  let t2096 = @simp.rewrite_tac(@list.List([@equal.gsym(@integration.has_integral_integrable_integral()), t2095]))
  let t2089 = @drule.match_mp(@integration.absolutely_integrable_imp_integrable())
  let t2094 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2090 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2086 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2087 = @tactics.mp_tac(x2086)
      fn(x2088 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2087(x2088)
      }
    })(t2089(x2090))
  }, fn(x2091 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2092 = @tactics.mp_tac(x2091)
    fn(x2093 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2092(x2093)
    }
  }))
  let t2084 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()]))
  let t2085 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t2084), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2110 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("absolutely_integrable_on((g' : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([(vec(0), (x : Cart[Real, Unit]))])) && integral(interval([(vec(0), x)]), g') == (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x) - (a : Cart[Real, 2])"), fn(x2081 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2082 = @tactics.mp_tac(x2081)
    fn(x2083 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2082(x2083)
    }
  }), t2085), t2094), t2096), t2100), t2107), t2108), t2109), @tactics.all_tac])
  let t2080 = @tactics.match_mp_tac(@integration.has_integral_sub())
  let t2079 = @simp.rewrite_tac(@list.List([@vectors.lift_sub()]))
  let t2077 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.drop_eq()), @vectors.drop_vec(), @vectors.lift_drop()]))
  let t2076 = @simp.gen_rewrite_tac(fn(x2075 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2075
  }, @list.List([@equal.gsym(@class.contrapos_thm())]))
  let t2074 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x2071 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2072 = @tactics.mp_tac(x2071)
    fn(x2073 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2072(x2073)
    }
  }))
  let t2070 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, Unit])"))
  let t2069 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_elim_thm(), @topology.in_interval_1(), @vectors.drop_vec()]))
  let t2066 = @drule.match_mp(@meson.meson(@list.List([]), @term_syntax.parse_term("negligible((t : (Cart[Real, _]) -> Bool)) → (P : ((Cart[Real, _]) -> Bool) -> Bool)(t) → (∃ s : (Cart[Real, _]) -> Bool, negligible(s) && P(s))")))
  let t2068 = @tactics.first_x_assum(fn(x2067 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2066(x2067))
  })
  let t2078 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.has_integral_negligible()), t2068), t2069), t2070), t2074), t2076), t2077), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2065 = @tactics.disch_then(@tactics.match_mp_tac)
  let t2064 = @simp.rewrite_tac(@list.List([]))
  let t2062 = @term_syntax.parse_term("interval([(vec(0), (x : Cart[Real, Unit]))])")
  let t2063 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Cart[Real, Unit]) => lift(op_dollar((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x), 1) - real_of_num(2) * (pi * ((sgn : Real) * ((C : Real) * sin(real_of_num(2) * (pi * drop(x)) - (A : Real))))))"), t2062]), @integration.has_integral_unique()))
  let t2061 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_eq()), @vectors.lift_num()]))
  let t2060 = @tactics.conv_tac(@equal.sym_conv)
  let t2059 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_0())]))
  let t2058 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()]))
  let t2122 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])")), t2058), @tactics.strip_tac), t2059), t2060), t2061), t2063), t2064), t2065), @tactics.conj_tac), t2078), t2079), t2080), @tactics.conj_tac), t2110), t2114), t2119), t2120), t2121), @tactics.ap_thm_tac), @tactics.ap_term_tac), @tactics.ap_term_tac), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t2057 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Unit], IN(x, interval([(vec(0), vec(1))])) → op_dollar((g : (Cart[Real, Unit]) -> Cart[Real, 2])(x), 1) == -(sgn : Real) * ((C : Real) * (cos(real_of_num(2) * (pi * drop(x)) - (A : Real)) - cos(A)))"), fn(x2054 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2055 = @tactics.assume_tac(x2054)
    fn(x2056 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2055(x2056)
    }
  })
  let t2053 = @simp.rewrite_tac(@list.List([@vectors.drop_vec(), @class.not_imp()]))
  let t2051 = @equal.gsym(@topology.in_interval_1())
  let t2052 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_vec()), t2051]))
  let t2050 = @simp.simp_tac(@list.List([@topology.in_interval_1(), @misc.in_real_interval(), @vectors.lift_drop(), @vectors.drop_vec()]))
  let t2049 = @simp.gen_rewrite_tac(fn(x2046 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2047 = @equal.land_conv(x2046)
    fn(x2048 : @kernel.Term) -> @kernel.Thm raise {
      s2047(x2048)
    }
  }, @list.List([@vectors.forall_drop()]))
  let t2044 = @tactics.x_choose_then(@term_syntax.parse_term("(A : Real)"))(fn(x2041 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2042 = @tactics.mp_tac(x2041)
    fn(x2043 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2042(x2043)
    }
  })
  let t2045 = @tactics.first_x_assum(@tactics.x_choose_then(@term_syntax.parse_term("(C : Real)"))(t2044))
  let t2040 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((p : Bool) && !(q : Bool)) == !(p → q)"))]))
  let t2039 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t2038 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_eq()), @vectors.drop_vec(), @vectors.lift_drop(), @real.real_pow_eq_0()]))
  let t2037 = @tactics.disch_then(fn(x2034 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2035 = @tactics.subst1_tac(x2034)
    fn(x2036 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2035(x2036)
    }
  })
  let t2033 = @simp.gen_rewrite_tac(fn(x2032 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x2032
  }, @list.List([@theorems.imp_conj()]))
  let t2031 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_()), @vectors.lift_drop(), @real.real_le_pow_2()]))
  let t2030 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @cart.dimindex_1(), @vectors.forall_1()]))
  let t2029 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t2023 = @drule.part_match(fn(x2022 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x2022))
  }, @integration.has_integral_negligible_eq())
  let t2018 = @simp.rewrite_tac(@list.List([@vectors.vector_sub_refl()]))
  let t2017 = @tactics.disch_then(fn(x2014 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2015 = @tactics.subst1_tac(x2014)
    fn(x2016 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2015(x2016)
    }
  })
  let t2013 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_eq()), @vectors.lift_drop()]))
  let t2012 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("drop((w : Cart[Real, Unit])) == real_of_num(0)")))
  let t2011 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_add_rid()]))
  let t2003 = @term_syntax.parse_term("has_integral((f : (Cart[Real, _]) -> Cart[Real, _]), (y : Cart[Real, _]), (s : (Cart[Real, _]) -> Bool))")
  let t2010 = @tactics.first_x_assum(fn(x2009 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2000 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2001 = @tactics.mp_tac(x2000)
      fn(x2002 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2001(x2002)
      }
    })(((x2008 : @kernel.Thm) => @lib.check(fn(x2007 : @kernel.Thm) -> Bool raise {
      ((x2005 : @kernel.Term) => @lib.can((x2004 : @kernel.Term) => @drule.term_match(@list.List([]), t2003, x2004), x2005))((fn(x2006 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x2006)
      })(x2007))
    }, x2008))(x2009))
  })
  let t1999 = @simp.asm_rewrite_tac(@list.List([]))
  let t1998 = @class.asm_cases_tac(@term_syntax.parse_term("drop((w : Cart[Real, Unit])) == real_of_num(0)"))
  let t1997 = @simp.asm_rewrite_tac(@list.List([]))
  let t1996 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Real) == real_of_num(0)"))
  let t1995 = @simp.asm_simp_tac(@list.List([@realarith.real_le_add(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && real_of_num(0) <= (y : Real) → (x + y == real_of_num(0)) == (x == real_of_num(0) && y == real_of_num(0))"))]))
  let t1994 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1988 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1989 = @tactics.assume_tac(x1988)
    fn(x1990 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1989(x1990)
    }
  }, fn(x1991 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1992 = @tactics.mp_tac(x1991)
    fn(x1993 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1992(x1993)
    }
  }))
  let t1987 = @list.List([@tactics.then_tac(@simp.expand_tac("d"), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1986 = @tactics.subgoal_then(@term_syntax.parse_term("pow((L : Real), 2) - measure(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))) * (real_of_num(4) * pi) == (d : Real) + drop((w : Cart[Real, Unit]))"), fn(x1983 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1984 = @tactics.subst_all_tac(x1983)
    fn(x1985 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1984(x1985)
    }
  })
  let t1982 = @simp.abbrev_tac(@term_syntax.parse_term("(d : Real) == pow((L : Real), 2) - measure(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))) * (real_of_num(4) * pi) - drop((w : Cart[Real, Unit]))"))
  let t1981 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @real.real_le_pow_2(), @vectors.drop_sub()]))
  let t1980 = @tactics.disch_then(fn(x1977 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x1977
    let t1979 = @tactics.mp_tac(@drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.has_integral_drop_pos()))(th_4))
    @tactics.then_tac(@tactics.assume_tac(th_4), t1979)
  })
  let t1976 = @simp.rewrite_tac(@list.List([@vectors.lift_add(), @vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, N]) + (b : Cart[Real, N]) - b == a"))]))
  let t1973 = @drule.match_mp(@integration.has_integral_sub())
  let t1975 = @tactics.disch_then(fn(x1974 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1970 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1971 = @tactics.mp_tac(x1970)
      fn(x1972 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1971(x1972)
      }
    })(t1973(x1974))
  })
  let t1969 = @simp.gen_rewrite_tac(fn(x1968 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1968
  }, @list.List([@theorems.imp_imp()]))
  let t1960 = @term_syntax.parse_term("has_integral((f : (Cart[Real, _]) -> Cart[Real, _]), (y : Cart[Real, _]), (s : (Cart[Real, _]) -> Bool))")
  let t1967 = @tactics.first_x_assum(fn(x1966 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1957 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1958 = @tactics.mp_tac(x1957)
      fn(x1959 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1958(x1959)
      }
    })(((x1965 : @kernel.Thm) => @lib.check(fn(x1964 : @kernel.Thm) -> Bool raise {
      ((x1962 : @kernel.Term) => @lib.can((x1961 : @kernel.Term) => @drule.term_match(@list.List([]), t1960, x1961), x1962))((fn(x1963 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x1963)
      })(x1964))
    }, x1965))(x1966))
  })
  let t1956 = @tactics.disch_then(fn(x1953 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x1953
    let t1955 = @tactics.mp_tac(th_3)
    @tactics.then_tac(@tactics.subst1_tac(@drule.match_mp(@integration.integral_unique())(th_3)), t1955)
  })
  let t1952 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(w : Cart[Real, Unit])"))(fn(x1949 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1950 = @tactics.mp_tac(x1949)
    fn(x1951 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1950(x1951)
    }
  }))
  let t1947 = @simp.gen_rewrite_tac(fn(x1944 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1945 = @equal.land_conv(x1944)
    fn(x1946 : @kernel.Term) -> @kernel.Thm raise {
      s1945(x1946)
    }
  }, @list.List([@integration.integrable_on()]))
  let t1943 = @simp.asm_simp_tac(@list.List([@integration.integrable_sub(), @integration.integrable_cmul()]))
  let t1942 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul()]))
  let t1941 = @simp.once_rewrite_tac(@list.List([@real.real_pow_mul()]))
  let t1948 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_mul_assoc(), @vectors.lift_sub()])), t1941), t1942), t1943), t1947])
  let t1940 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((x : Cart[Real, Unit]) => lift(pow(op_dollar((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x), 2), 2) - pow(real_of_num(2) * (pi * op_dollar((g : (Cart[Real, Unit]) -> Cart[Real, 2])(x), 2)), 2)), interval([(vec(0), vec(1))]))"), fn(x1937 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1938 = @tactics.mp_tac(x1937)
    fn(x1939 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1938(x1939)
    }
  })
  let t1935 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t1934 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1933 = @simp.gen_rewrite_tac(fn(x1930 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1931 = @equal.land_conv(x1930)
    fn(x1932 : @kernel.Term) -> @kernel.Thm raise {
      s1931(x1932)
    }
  }, @list.List([@measure.measurable_on_componentwise()]))
  let t1927 = @drule.match_mp(@measure.integrable_imp_measurable())
  let t1929 = @tactics.disch_then(fn(x1928 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1924 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1925 = @tactics.mp_tac(x1924)
      fn(x1926 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1925(x1926)
      }
    })(t1927(x1928))
  })
  let t1921 = @drule.match_mp(@integration.absolutely_integrable_imp_integrable())
  let t1923 = @tactics.disch_then(fn(x1922 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1918 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1919 = @tactics.mp_tac(x1918)
      fn(x1920 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1919(x1920)
      }
    })(t1921(x1922))
  })
  let t1917 = @list.List([@meson.asm_meson_tac(@list.List([@vectors.ends_in_unit_interval()])), @tactics.all_tac])
  let t1916 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_integrable_on((g' : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([(vec(0), vec(1))]))"), fn(x1913 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1914 = @tactics.mp_tac(x1913)
    fn(x1915 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1914(x1915)
    }
  })
  let t1912 = @simp.rewrite_tac(@list.List([@calc_num.arith_eq()]))
  let t1911 = @tactics.match_mp_tac(@measure.measurable_on_lift_pow())
  let t1910 = @simp.rewrite_tac(@list.List([@real.real_abs_abs(), @vectors.real_abs_norm(), @vectors.component_le_norm()]))
  let t1909 = @simp.rewrite_tac(@list.List([@vectors.norm_1(), @vectors.lift_drop(), @real.real_abs_pow(), @equal.gsym(@real.real_le_square_abs())]))
  let t1908 = @simp.asm_simp_tac(@list.List([@integration.absolutely_integrable_imp_integrable()]))
  let t1907 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, Unit]) => lift(pow(norm((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x)), 2))"))
  let t1906 = @tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_absolutely_integrable())
  let t1936 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.absolutely_integrable_imp_integrable()), t1906), t1907), t1908), t1909), t1910), t1911), t1912), t1916), t1917), t1923), t1929), t1933), t1934), t1935), @tactics.strip_tac])
  let t1905 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p && (q : Bool) → (r : Bool) → (s : Bool)) → (p → q && (q → r)) → s")))
  let t1901 = @simp.asm_rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()]))
  let t1900 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1899 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t1898 = @tactics.match_mp_tac(@derivatives.has_vector_derivative_lift_component_at())
  let t1897 = @tactics.match_mp_tac(@derivatives.has_vector_derivative_at_within())
  let t1896 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec(), @sets.in_diff()]))
  let t1902 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, Unit])")), t1896), @tactics.strip_tac), t1897), t1898), t1899), t1900), t1901), @calc_rat.asm_real_arith_tac)
  let t1895 = @simp.asm_rewrite_tac(@list.List([@topology.subset_interval_1(), @vectors.drop_vec(), @realax.real_le_refl()]))
  let t1894 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@integration.absolutely_continuous_on_subset()))
  let t1893 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @calc_num.arith()]))
  let t1891 = @simp.gen_rewrite_rule(fn(x1890 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1890
  }, @list.List([@integration.absolutely_continuous_on_componentwise()]))
  let t1887 = @term_syntax.parse_term("2")
  let t1903 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1892 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1889 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1884 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1885 = @tactics.mp_tac(x1884)
        fn(x1886 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1885(x1886)
        }
      })(((x1888 : @kernel.Thm) => @bool.spec(t1887, x1888))(x1889))
    })(t1891(x1892))
  }), t1893), t1894), t1895), t1902])
  let t1883 = @tactics.disch_then(@tactics.match_mp_tac)
  let t1882 = @simp.asm_rewrite_tac(@list.List([@vectors.lift_sub()]))
  let t1881 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), @paths.pathstart())))
  let t1880 = @simp.asm_rewrite_tac(@list.List([@vectors.drop_vec()]))
  let t1875 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t1876 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t1877 = @term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool)")
  let t1878 = @term_syntax.parse_term("(x : Cart[Real, Unit]) => lift(op_dollar((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x), 2))")
  let t1879 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(x : Cart[Real, Unit]) => lift(op_dollar((g : (Cart[Real, Unit]) -> Cart[Real, 2])(x), 2))"), t1878, t1877, t1876, t1875]), @measure.fundamental_theorem_of_calculus_absolutely_continuous()))
  let t1874 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t1904 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.forall_drop(), @misc.in_real_interval(), @vectors.lift_drop()])), t1874), @tactics.strip_tac), t1879), t1880), t1881), t1882), t1883), @tactics.conj_tac), t1903), @tactics.all_tac])
  let t1873 = @simp.gen_rewrite_tac(fn(x1870 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1871 = @equal.land_conv(x1870)
    fn(x1872 : @kernel.Term) -> @kernel.Thm raise {
      s1871(x1872)
    }
  }, @list.List([@theorems.imp_conj()]))
  let t1869 = @simp.asm_rewrite_tac(@list.List([]))
  let t1868 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), @paths.pathfinish())))
  let t1867 = @tactics.subst1_tac(@equal.sym(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), @paths.pathstart())))
  let t1864 = @equal.gsym(@vectors.lift_sub())
  let t1865 = @equal.gsym(@vectors.lift_cmul())
  let t1866 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_pow_mul()), t1865, t1864]))
  let t1862 = @equal.gsym(@integration.integral_sub())
  let t1863 = @simp.simp_tac(@list.List([@equal.gsym(@vectors.drop_sub()), t1862, @vectors.lift_cmul(), @integration.integrable_cmul()]))
  let t1861 = @simp.rewrite_tac(@list.List([@meson.meson(@list.List([@vectors.drop_eq(), @realarith.real_sub_0()]), @term_syntax.parse_term("(drop((x : Cart[Real, Unit])) == drop((y : Cart[Real, Unit]))) == (drop(y) - drop(x) == real_of_num(0))"))]))
  let t1860 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(drop((x : Cart[Real, Unit])) <= drop((y : Cart[Real, Unit]))) == (real_of_num(0) <= drop(y) - drop(x))"))]))
  let t1859 = @simp.rewrite_tac(@list.List([@realanalysis.has_real_integral(), @realanalysis.real_integrable_on_v1(), @trivia.o_def(), @vectors.lift_drop(), @topology.image_lift_real_interval(), @vectors.lift_num()]))
  let t1858 = @simp.rewrite_tac(@list.List([@topology.image_lift_real_interval(), @vectors.lift_num()]))
  let t1857 = @simp.simp_tac(@list.List([@realanalysis.real_integral_v1(), @real.real_pow_mul(), @realanalysis.real_integral_lmul(), @realanalysis.real_integrable_lmul()]))
  let t1856 = @simp.gen_rewrite_tac(fn(x1853 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1854 = @equal.land_conv(x1853)
    fn(x1855 : @kernel.Term) -> @kernel.Thm raise {
      s1854(x1855)
    }
  }, @list.List([@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) && (r : Bool)) == (p → q && (q → r))"))]))
  let t1852 = @simp.asm_rewrite_tac(@list.List([@vectors.lift_num()]))
  let t1850 = @term_syntax.parse_term("(x : Real) => op_dollar((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(lift(x)), 2)")
  let t1851 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(x : Real) => op_dollar((g : (Cart[Real, Unit]) -> Cart[Real, 2])(lift(x)), 2)"), t1850]), scaled_wirtinger_inequality()))
  let t1848 = @simp.asm_simp_tac(@list.List([@real.real_le_pow_2(), @real.real_pow_eq_0(), @calc_num.arith_eq(), @real.real_lt_imp_nz()]))
  let t1849 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@measure.measure_empty(), @calc_int.real_mul_lzero(), @real.real_sub_rzero()])), t1848), @tactics.all_tac])
  let t1847 = @class.asm_cases_tac(@term_syntax.parse_term("inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))) == {}"))
  let t1843 = @simp.asm_rewrite_tac(@list.List([]))
  let t1842 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@vectors.lift_cmul()])))
  let t1841 = @tactics.replicate_tac(3, @tactics.match_mp_tac(@integration.has_integral_cmul()))
  let t1840 = @simp.rewrite_tac(@list.List([@vectors.lift_cmul()]))
  let t1839 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(x : Real) * (real_of_num(4) * pi) == real_of_num(4) * (pi * x)"))]))
  let t1844 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1837 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x1837
    @simp.rewrite_tac(@list.List([@drule.match_mp(@calc_rat.real_ring(@term_syntax.parse_term("pow((s : Real), 2) == real_of_num(1) → (x : Real) * (real_of_num(4) * pi) == real_of_num(4) * (pi * (s * (s * x)))")))(th_2)]))
  }), t1839), t1840), t1841), t1842), t1843)
  let t1836 = @simp.asm_simp_tac(@list.List([@integration.has_integral_integrable_integral(), @integration.absolutely_integrable_imp_integrable()]))
  let t1834 = @equal.gsym(@vectors.norm_pow_2())
  let t1835 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), t1834]))
  let t1845 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dot_2()), @realarith.real_pow_2()])), t1835), t1836), t1844])
  let t1833 = @tactics.match_mp_tac(@integration.has_integral_sub())
  let t1832 = @simp.rewrite_tac(@list.List([@vectors.lift_sub()]))
  let t1846 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("pow((s : Real), 2) == real_of_num(1) → pow((x' : Real) - real_of_num(2) * (pi * (s * (y : Real))), 2) + (pow((y' : Real), 2) - pow(real_of_num(2) * (pi * y), 2)) == pow(x', 2) + pow(y', 2) - real_of_num(4) * (pi * (s * (x' * y)))"))])), t1832), t1833), @tactics.conj_tac), t1845), @tactics.all_tac])
  let t1831 = @tactics.subgoal_then(@term_syntax.parse_term("has_integral((x : Cart[Real, Unit]) => lift(pow(op_dollar((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x), 1) - real_of_num(2) * (pi * ((sgn : Real) * op_dollar((g : (Cart[Real, Unit]) -> Cart[Real, 2])(x), 2))), 2) + (pow(op_dollar(g'(x), 2), 2) - pow(real_of_num(2) * (pi * op_dollar(g(x), 2)), 2))), lift(pow((L : Real), 2) - measure(inside(path_image(g))) * (real_of_num(4) * pi)), interval([(vec(0), vec(1))]))"), fn(x1828 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1829 = @tactics.assume_tac(x1828)
    fn(x1830 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1829(x1830)
    }
  })
  let t1827 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_le())]))
  let t1825 = @calc_rat.real_field(@term_syntax.parse_term("real_of_num(0) < (z : Real) → ((x : Real) == (y : Real) / (real_of_num(4) * z)) == (y - x * (real_of_num(4) * z) == real_of_num(0))"))
  let t1826 = @simp.simp_tac(@list.List([@transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(4) * (x : Real)) == (real_of_num(0) < x)")), @real.real_le_rdiv_eq(), t1825]))
  let t1823 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lid()]))
  let t1822 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t1821 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_lneg(), @vectors.vector_mul_rneg(), @vectors.vector_neg_neg()]))
  let t1820 = @simp.asm_rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.lift_neg()]))
  let t1818 = @tactics.exists_tac(@term_syntax.parse_term("-real_of_num(1)"))
  let t1819 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("real_of_num(1)")), t1818])
  let t1817 = @tactics.disch_then(fn(x1816 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1814 = @tactics.subst1_tac(x1813)
      fn(x1815 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1814(x1815)
      }
    })(@equal.sym(x1816))
  })
  let t1812 = @simp.rewrite_tac(@list.List([@realax.real_abs()]))
  let t1809 = @simp.gen_rewrite_rule(fn(x1806 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1807 = @equal.land_conv(x1806)
    fn(x1808 : @kernel.Term) -> @kernel.Thm raise {
      s1807(x1808)
    }
  }, @list.List([@vectors.norm_1()]))
  let t1811 = @tactics.first_x_assum(fn(x1810 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1803 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1804 = @tactics.mp_tac(x1803)
      fn(x1805 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1804(x1805)
      }
    })(t1809(x1810))
  })
  let t1824 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@integration.has_integral_integrable_integral()])), t1811), t1812), @class.cond_cases_tac), t1817), t1819), t1820), t1821), t1822), t1823), @tactics.all_tac])
  let t1802 = @tactics.subgoal_then(@term_syntax.parse_term("∃ sgn : Real, pow(sgn, 2) == real_of_num(1) && has_integral((x : Cart[Real, Unit]) => lift(op_dollar((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x), 1) * op_dollar((g : (Cart[Real, Unit]) -> Cart[Real, 2])(x), 2)), op_pct(sgn, lift(measure(inside(path_image(g))))), interval([(vec(0), vec(1))]))"), @tactics.strip_assume_tac)
  let t1800 = @simp.simp_tac(@list.List([@vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t1799 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vector_mul_component()]))
  let t1796 = @drule.match_mp(@vectors.vector_arith(@term_syntax.parse_term("(b : Cart[Real, N]) - (a : Cart[Real, N]) == (c : Cart[Real, N]) → b == a + c")))
  let t1798 = @tactics.first_x_assum(fn(x1797 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1793 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1794 = @tactics.subst1_tac(x1793)
      fn(x1795 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1794(x1795)
      }
    })(t1796(x1797))
  })
  let t1792 = @simp.asm_simp_tac(@list.List([@sets.in_diff(), @vectors.dist()]))
  let t1790 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t1791 = @tactics.map_every(fn(x1787 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1788 = @tactics.exists_tac(x1787)
    fn(x1789 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1788(x1789)
    }
  }, @list.List([@term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool)"), t1790]))
  let t1801 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(green_area_theorem()), t1791), t1792), t1798), t1799), t1800), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t1786 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((t : Cart[Real, Unit]) => lift(op_dollar((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(t), 1) * op_dollar((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t), 2)), interval([(vec(0), vec(1))])) && norm(integral(interval([(vec(0), vec(1))]), (t : Cart[Real, Unit]) => lift(op_dollar(g'(t), 1) * op_dollar(g(t), 2)))) == measure(inside(path_image(g)))"), @tactics.strip_assume_tac)
  let t1784 = @meson.meson_tac(@list.List([@realax.real_le_refl()]))
  let t1783 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_elim_thm()]))
  let t1782 = @simp.asm_rewrite_tac(@list.List([@integration.negligible_union_eq()]))
  let t1781 = @tactics.exists_tac(@term_syntax.parse_term("UNION((s : (Cart[Real, Unit]) -> Bool), {(x : Cart[Real, Unit]) | (IN(x, interval([(vec(0), vec(1))])) && !IN(x, s)) && !(norm((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x)) == (L : Real))})"))
  let t1780 = @simp.rewrite_tac(@list.List([@vectors.lift_num()]))
  let t1779 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((x : Real) - (y : Real) == real_of_num(0)) == (y == x)"))]))
  let t1778 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_num()), @vectors.lift_eq()]))
  let t1777 = @tactics.disch_then(fn(x1774 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1775 = @tactics.subst1_tac(x1774)
    fn(x1776 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1775(x1776)
    }
  })
  let t1773 = @simp.gen_rewrite_tac(fn(x1772 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1772
  }, @list.List([@theorems.imp_conj()]))
  let t1771 = @simp.asm_simp_tac(@list.List([@realarith.real_sub_le()]))
  let t1770 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @equal.gsym(@vectors.drop_()), @sets.in_diff()]))
  let t1769 = @simp.rewrite_tac(@list.List([@theorems.imp_imp(), @vectors.forall_1(), @cart.dimindex_1()]))
  let t1768 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t1762 = @drule.part_match(fn(x1761 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1761))
  }, @integration.has_integral_negligible_eq())
  let t1756 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_eq_cmul())]))
  let t1755 = @simp.asm_simp_tac(@list.List([@integration.has_integral_integrable_integral(), @vectors.ends_in_unit_interval(), @integration.absolutely_integrable_imp_integrable()]))
  let t1754 = @simp.rewrite_tac(@list.List([@integration.has_integral_const()]))
  let t1753 = @tactics.match_mp_tac(@integration.has_integral_sub())
  let t1751 = @tactics.disch_then(fn(x1746 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x1746
    @simp.gen_rewrite_tac(fn(x1748 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1749 = @equal.land_conv(x1748)
      fn(x1750 : @kernel.Term) -> @kernel.Thm raise {
        s1749(x1750)
      }
    }, @list.List([th_1]))
  })
  let t1745 = @tactics.conv_tac(@vectors.vector_arith)
  let t1752 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@integration.content_unit_1(), @vectors.lift_cmul()])), t1745), t1751])
  let t1744 = @tactics.subgoal_then(@term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0) == (op_pct : (Real, Cart[Real, Unit]) -> Cart[Real, Unit])((content : ((Cart[Real, Unit]) -> Bool) -> Real)((interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])), lift((L : Real))) - lift(L)"), fn(x1741 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1742 = @tactics.mp_tac(x1741)
    fn(x1743 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1742(x1743)
    }
  })
  let t1739 = @simp.rewrite_tac(@list.List([@vectors.lift_sub()]))
  let t1738 = @sets.set_tac(@list.List([]))
  let t1737 = @simp.asm_rewrite_tac(@list.List([]))
  let t1736 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool)"))
  let t1740 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.negligible_subset()), t1736), t1737), t1738), t1739])
  let t1735 = @tactics.exists_tac(@term_syntax.parse_term("(interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])"))
  let t1757 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.has_integral_spike_set()), t1735), @tactics.conj_tac), t1740), t1744), t1752), t1753), t1754), t1755), t1756), @tactics.all_tac])
  let t1734 = @tactics.subgoal_then(@term_syntax.parse_term("has_integral((x : Cart[Real, Unit]) => lift((L : Real) - norm((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x))), vec(0), DIFF(interval([(vec(0), vec(1))]), (s : (Cart[Real, Unit]) -> Bool)))"), fn(x1731 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1732 = @tactics.mp_tac(x1731)
    fn(x1733 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1732(x1733)
    }
  })
  let t1730 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t1729 = @simp.asm_simp_tac(@list.List([@sets.in_diff(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (l : Real) → abs(l) == l"))]))
  let t1728 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @equal.gsym(@real.real_le_square_abs()), @vectors.real_abs_norm()]))
  let t1727 = @simp.asm_simp_tac(@list.List([@integration.integrable_const(), @integration.absolutely_integrable_imp_integrable()]))
  let t1726 = @tactics.match_mp_tac(@integration.integral_drop_le_ae())
  let t1725 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_le_antisym())]))
  let t1722 = @simp.rewrite_tac(@list.List([@realax.real_mul_lid()]))
  let t1723 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@integration.integral_const(), @integration.content_unit_1(), @equal.gsym(@vectors.lift_cmul())])), t1722)
  let t1724 = @list.List([@simp.gen_rewrite_tac(fn(x1721 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1721
  }, @list.List([@equal.gsym(@vectors.drop_eq())])), t1723])
  let t1720 = @tactics.exists_tac(@term_syntax.parse_term("integral(interval([(vec(0), vec(1))]), (x : Cart[Real, Unit]) => lift(pow((L : Real), 2)))"))
  let t1785 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.eq_trans()), t1720), @tactics.conj_tac), t1724), t1725), @tactics.conj_tac), t1726), t1727), t1728), t1729), t1730), t1734), t1757), fn(x1767 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1766 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1764 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1763 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x1758 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s1759 = @tactics.mp_tac(x1758)
            fn(x1760 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s1759(x1760)
            }
          })(t1762(x1763))
        })(@equal.lhand(x1764))
      })((fn(x1765 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1765.1
      })(x1766))
    })(x1767)(x1767)
  }), t1768), t1769), t1770), t1771), t1773), t1777), t1778), t1779), t1780), @tactics.strip_tac), t1781), t1782), t1783), t1784), @tactics.all_tac])
  let t1719 = @tactics.subgoal_then(@term_syntax.parse_term("integral(interval([(vec(0), vec(1))]), (x : Cart[Real, Unit]) => lift(pow(norm((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x)), 2))) == lift(pow((L : Real), 2))"), fn(x1716 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1717 = @tactics.assume_tac(x1716)
    fn(x1718 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1717(x1718)
    }
  })
  let t1714 = @meson.asm_meson_tac(@list.List([@vectors.ends_in_unit_interval(), @measure.absolutely_integrable_measurable()]))
  let t1713 = @tactics.match_mp_tac(@measure.measurable_on_norm())
  let t1712 = @tactics.conv_tac(@calc_num.num_reduce_conv)
  let t1711 = @tactics.match_mp_tac(@measure.measurable_on_lift_pow())
  let t1710 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (l : Real) → abs(l) == l"))]))
  let t1709 = @simp.rewrite_tac(@list.List([@integration.integrable_const(), @vectors.norm_lift(), @vectors.real_abs_norm(), @vectors.lift_drop(), @real.real_abs_pow(), @sets.in_diff(), @equal.gsym(@real.real_le_square_abs())]))
  let t1708 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool)"))
  let t1707 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, Unit]) => lift(pow((L : Real), 2))"))
  let t1715 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@measure.measurable_bounded_by_integrable_imp_absolutely_integrable_ae()), t1707), t1708), t1709), t1710), t1711), t1712), t1713), t1714), @tactics.all_tac])
  let t1706 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_integrable_on((x : Cart[Real, Unit]) => lift(pow(norm((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x)), 2)), interval([(vec(0), vec(1))]))"), fn(x1703 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1704 = @tactics.assume_tac(x1703)
    fn(x1705 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1704(x1705)
    }
  })
  let t1699 = @meson.meson_tac(@list.List([@real.real_lt_01()]))
  let t1697 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (l : Real) → abs(l) == l"))
  let t1698 = @simp.asm_simp_tac(@list.List([@equal.gsym(@vectors.dist()), t1697]))
  let t1696 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.vector_sub_ldistrib()), @vectors.norm_mul()]))
  let t1700 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.eventually_within()])), t1696), t1698), t1699)
  let t1695 = @simp.rewrite_tac(@list.List([@topology.interval_ne_empty_1(), @vectors.drop_vec(), @real.real_lt_01()]))
  let t1694 = @simp.rewrite_tac(@list.List([@vectors.interval_sing(), @topology.interior_interval()]))
  let t1690 = @term_syntax.parse_term("(interior : ((Cart[Real, Unit]) -> Bool, Cart[Real, Unit]) -> Bool)")
  let t1693 = @tactics.disch_then(fn(x1692 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1687 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1688 = @tactics.mp_tac(x1687)
      fn(x1689 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1688(x1689)
      }
    })(((x1691 : @kernel.Thm) => @equal.ap_term(t1690, x1691))(x1692))
  })
  let t1686 = @tactics.disch_then(fn(x1683 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1684 = @tactics.subst1_tac(x1683)
    fn(x1685 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1684(x1685)
    }
  })
  let t1682 = @simp.asm_rewrite_tac(@list.List([@convex.convex_interval(), @equal.gsym(@vectors.interval_sing())]))
  let t1677 = @drule.part_match(fn(x1676 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x1676))
  }, @convex.limpt_of_convex())
  let t1701 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(fn(x1681 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x1680 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1678 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x1673 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s1674 = @tactics.mp_tac(x1673)
          fn(x1675 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s1674(x1675)
          }
        })(t1677(x1678))
      })((fn(x1679 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x1679.1
      })(x1680))
    })(x1681)(x1681)
  }, t1682), t1686), t1693), t1694), t1695), t1700])
  let t1672 = @simp.simp_tac(@list.List([@derivatives.has_vector_derivative_id(), @derivatives.has_vector_derivative_cmul()]))
  let t1671 = @simp.rewrite_tac(@list.List([@vectors.lift_eq_cmul()]))
  let t1670 = @simp.asm_simp_tac(@list.List([@derivatives.has_vector_derivative_at_within()]))
  let t1666 = @term_syntax.parse_term("(interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])")
  let t1667 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t1668 = @term_syntax.parse_term("(x : Cart[Real, Unit]) => op_pct((L : Real), x)")
  let t1669 = @tactics.map_every(fn(x1663 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1664 = @tactics.exists_tac(x1663)
    fn(x1665 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1664(x1665)
    }
  }, @list.List([@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), t1668, t1667, t1666]))
  let t1661 = @tactics.match_mp_tac(@derivatives.norm_vector_derivatives_le_within())
  let t1662 = @list.List([@simp.asm_simp_tac(@list.List([@vectors.norm_lift(), @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) < (l : Real) → abs(l) == l"))])), t1661])
  let t1660 = @tactics.subgoal_then(@term_syntax.parse_term("(L : Real) == norm(lift(L))"), fn(x1657 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1658 = @tactics.subst1_tac(x1657)
    fn(x1659 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1658(x1659)
    }
  })
  let t1702 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t1660), t1662), t1669), t1670), t1671), t1672), @tactics.conj_tac), t1701), @tactics.all_tac])
  let t1656 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Unit], IN(x, interval([(vec(0), vec(1))])) && !IN(x, (s : (Cart[Real, Unit]) -> Bool)) → norm((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x)) <= (L : Real)"), fn(x1653 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1654 = @tactics.assume_tac(x1653)
    fn(x1655 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1654(x1655)
    }
  })
  let t1650 = @simp.simp_tac(@list.List([@integration.absolutely_integrable_norm(), @vectors.lift_drop()]))
  let t1648 = @simp.asm_rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.lift_drop(), @vectors.drop_vec(), @sets.in_diff()]))
  let t1647 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t1646 = @tactics.match_mp_tac(@derivatives.has_vector_derivative_at_within())
  let t1645 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1649 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.lift_drop(), @vectors.drop_vec(), @sets.in_diff()])), t1645), t1646), t1647), t1648), @calc_rat.asm_real_arith_tac)
  let t1644 = @simp.rewrite_tac(@list.List([@topology.subset_interval_1(), @vectors.drop_vec(), @vectors.lift_drop()]))
  let t1641 = @simp.gen_rewrite_rule(fn(x1640 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1640
  }, @list.List([@topology.in_interval_1()]))
  let t1643 = @tactics.first_x_assum(fn(x1642 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1637 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1638 = @tactics.mp_tac(x1637)
      fn(x1639 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1638(x1639)
      }
    })(t1641(x1642))
  })
  let t1635 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.absolutely_continuous_on_subset()))
  let t1651 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1636 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t1635(x1636))
  }), t1643), t1644), @calc_rat.real_arith_tac), t1649])), t1650])
  let t1634 = @simp.asm_rewrite_tac(@list.List([]))
  let t1629 = @term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool)")
  let t1630 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t1631 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t1632 = @term_syntax.parse_term("(g' : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t1633 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), t1632, t1631, t1630, t1629]), @measure.vector_variation_integral_norm_derivative_gen()))
  let t1628 = @tactics.disch_then(fn(x1625 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1626 = @tactics.subst1_tac(x1625)
    fn(x1627 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1626(x1627)
    }
  })
  let t1624 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.lift_eq()), @vectors.lift_cmul(), @vectors.lift_drop()]))
  let t1623 = @simp.asm_simp_tac(@list.List([@topology.segment_1(), @vectors.drop_vec()]))
  let t1620 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t1621 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t1622 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), t1621, t1620]), @integration.path_length_subpath()))
  let t1619 = @simp.rewrite_tac(@list.List([@vectors.drop_vec()]))
  let t1616 = @simp.gen_rewrite_rule(fn(x1615 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1615
  }, @list.List([@topology.in_interval_1()]))
  let t1618 = @tactics.first_assum(fn(x1617 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1612 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1613 = @tactics.mp_tac(x1612)
      fn(x1614 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1613(x1614)
      }
    })(t1616(x1617))
  })
  let t1652 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])")), @tactics.disch_tac), t1618), t1619), @tactics.strip_tac), t1622), t1623), t1624), t1628), t1633), t1634), @tactics.ants_tac), t1651), @tactics.all_tac])
  let t1611 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Unit], IN(x, interval([(vec(0), vec(1))])) → absolutely_integrable_on((x : Cart[Real, Unit]) => lift(norm((g' : (Cart[Real, Unit]) -> Cart[Real, 2])(x))), interval([(vec(0), x)])) && integral(interval([(vec(0), x)]), (x : Cart[Real, Unit]) => lift(norm(g'(x)))) == op_pct((L : Real), x)"), fn(x1608 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1609 = @tactics.assume_tac(x1608)
    fn(x1610 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1609(x1610)
    }
  })
  let t1606 = @simp.rewrite_tac(@list.List([@topology.subset_interval_1(), @vectors.drop_vec(), @vectors.lift_drop()]))
  let t1603 = @simp.gen_rewrite_rule(fn(x1602 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x1602
  }, @list.List([@topology.in_interval_1()]))
  let t1605 = @tactics.first_x_assum(fn(x1604 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1599 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1600 = @tactics.mp_tac(x1599)
      fn(x1601 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1600(x1601)
      }
    })(t1603(x1604))
  })
  let t1598 = @tactics.match_mp_tac(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@integration.absolutely_integrable_on_subinterval()))
  let t1597 = @tactics.disch_then(fn(x1596 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1593 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1594 = @tactics.mp_tac(x1593)
      fn(x1595 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1594(x1595)
      }
    })(@bool.conjunct1(x1596))
  })
  let t1592 = @simp.asm_simp_tac(@list.List([]))
  let t1591 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@paths.pathstart()])))
  let t1589 = @simp.rewrite_tac(@list.List([@integration.has_integral_integrable_integral()]))
  let t1590 = @list.List([@meson.asm_meson_tac(@list.List([@sets.in_diff(), @derivatives.has_vector_derivative_at_within()])), t1589])
  let t1588 = @tactics.disch_then(fn(x1587 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1586 : (@kernel.Thm, @kernel.Thm)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1582 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1583 = @tactics.mp_tac(x1582)
        fn(x1584 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1583(x1584)
        }
      })((fn(x1585 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
        x1585.1
      })(x1586))
    })(@bool.eq_imp_rule(x1587))
  })
  let t1581 = @simp.asm_rewrite_tac(@list.List([]))
  let t1577 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(1)")
  let t1578 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t1579 = @term_syntax.parse_term("(g' : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t1580 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), t1579, t1578, t1577]), @measure.absolute_integral_absolutely_continuous_derivative_eq()))
  let t1607 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t1580), t1581), t1588), @tactics.ants_tac), t1590), t1591), t1592), t1597), t1598), t1605), t1606), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t1576 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], IN(t, interval([(vec(0), vec(1))])) → absolutely_integrable_on((g' : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([(vec(0), t)])) && integral(interval([(vec(0), t)]), g') == (g : (Cart[Real, Unit]) -> Cart[Real, 2])(t) - (a : Cart[Real, 2])"), fn(x1573 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1574 = @tactics.assume_tac(x1573)
    fn(x1575 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1574(x1575)
    }
  })
  let t1571 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @theorems.imp_conj()]))
  let t1570 = @simp.expand_tac("s")
  let t1569 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@derivatives.vector_derivative_works())]))
  let t1572 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, Unit]) => vector_derivative((g : (Cart[Real, Unit]) -> Cart[Real, 2]), at(x))")), t1569), t1570), t1571), @tactics.all_tac])
  let t1568 = @tactics.subgoal_then(@term_syntax.parse_term("∃ g' : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ x : Cart[Real, Unit], IN(x, interval([(vec(0), vec(1))])) && !IN(x, (s : (Cart[Real, Unit]) -> Bool)) → has_vector_derivative((g : (Cart[Real, Unit]) -> Cart[Real, 2]), g'(x), at(x))"), @tactics.strip_assume_tac)
  let t1567 = @simp.abbrev_tac(@term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool) == {(x : Cart[Real, Unit]) | IN(x, interval([(vec(0), vec(1))])) && !differentiable((g : (Cart[Real, Unit]) -> Cart[Real, 2]), at(x))}"))
  let t1564 = @drule.match_mp(@measure.lebesgue_differentiation_theorem_compact())
  let t1566 = @tactics.first_assum(fn(x1565 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1561 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1562 = @tactics.mp_tac(x1561)
      fn(x1563 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1562(x1563)
      }
    })(t1564(x1565))
  })
  let t1560 = @simp.rewrite_tac(@list.List([@topology.bounded_interval()]))
  let t1557 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.absolutely_continuous_on_imp_has_bounded_variation_on()))
  let t1559 = @tactics.first_assum(fn(x1558 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1554 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1555 = @tactics.mp_tac(x1554)
      fn(x1556 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1555(x1556)
      }
    })(t1557(x1558))
  })
  let t1552 = @meson.asm_meson_tac(@list.List([]))
  let t1551 = @simp.rewrite_tac(@list.List([@topology.bounded_interval(), @equal.gsym(@vectors.dist())]))
  let t1553 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.lipschitz_imp_absolutely_continuous()), t1551), t1552), @tactics.all_tac])
  let t1550 = @tactics.subgoal_then(@term_syntax.parse_term("absolutely_continuous_on((g : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([(vec(0), vec(1))]))"), fn(x1547 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1548 = @tactics.assume_tac(x1547)
    fn(x1549 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1548(x1549)
    }
  })
  let t1546 = @simp.rewrite_tac(@list.List([@vectors.vector_add_assoc(), @vectors.lift_add(), @vectors.vector_add_linv(), @vectors.vector_add_lid(), @vectors.vector_mul_lid()]))
  let t1543 = @drule.match_mp(@integration.has_integral_add())
  let t1545 = @tactics.disch_then(fn(x1544 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1540 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1541 = @tactics.mp_tac(x1540)
      fn(x1542 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1541(x1542)
      }
    })(t1543(x1544))
  })
  let t1539 = @simp.rewrite_tac(@list.List([@integration.content_unit_1(), @theorems.imp_imp()]))
  let t1536 = @term_syntax.parse_term("-lift((av : Real))")
  let t1537 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(1)")
  let t1538 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)"), t1537, t1536]), @integration.has_integral_const()))
  let t1535 = @tactics.disch_then(fn(x1528 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x1528
    let t1534 = @tactics.assume_tac(th)
    let t1533 = @tactics.subst_all_tac(th)
    @tactics.then_tac(@tactics.then_tac(@tactics.pop_assum(fn(x1530 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1531 = @tactics.mp_tac(x1530)
      fn(x1532 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1531(x1532)
      }
    }), t1533), t1534)
  })
  let t1527 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1523 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1520 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1521 = @tactics.mp_tac(x1520)
      fn(x1522 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1521(x1522)
      }
    })(@equal.sym(x1523))
  }, fn(x1524 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1525 = @tactics.subst_all_tac(x1524)
    fn(x1526 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1525(x1526)
    }
  }))
  let t1513 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t1514 = @term_syntax.parse_term("(L : Real)")
  let t1515 = @term_syntax.parse_term("(av : Real)")
  let t1516 = @term_syntax.parse_term("(a : Cart[Real, 2])")
  let t1517 = @term_syntax.parse_term("(baseline : Real)")
  let t1518 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t1519 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(origin : Cart[Real, 2])"), t1518, t1517, t1516, t1515, t1514, t1513]))
  let t1512 = @simp.rewrite_tac(@list.List([@real.real_le_ladd(), @calc_int.real_add_rid()]))
  let t1511 = @simp.rewrite_tac(@list.List([@vectors.vector_add_component(), @vectors.vec_component(), @calc_int.real_eq_add_lcancel()]))
  let t1510 = @determinants.geom_origin_tac(@term_syntax.parse_term("(origin : Cart[Real, 2])"))
  let t1509 = @tactics.pop_assum_list(fn(x1508 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1506 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x1502 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s1503 = @tactics.mp_tac(x1502)
        fn(x1504 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s1503(x1504)
        }
      })(((x1505 : @list.List[@kernel.Thm]) => @lib.end_itlist(@bool.conj, x1505))(x1506))
    })((fn(x1507 : @list.List[@kernel.Thm]) -> @list.List[@kernel.Thm] raise {
      @lib.rev(x1507)
    })(x1508))
  })
  let t1500 = @tactics.pop_assum(fn(x1499 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1498 = @simp.rewrite_tac(@list.List([@vectors.vector_2()]))
  let t1501 = @list.List([@tactics.then_tac(@simp.expand_tac("origin"), t1498), t1500])
  let t1497 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((origin : Cart[Real, 2]), 1) == op_dollar((a : Cart[Real, 2]), 1) && op_dollar(origin, 2) == (av : Real)"), fn(x1494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1495 = @tactics.mp_tac(x1494)
    fn(x1496 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1495(x1496)
    }
  })
  let t1493 = @simp.abbrev_tac(@term_syntax.parse_term("(origin : Cart[Real, 2]) == vector([op_dollar((a : Cart[Real, 2]), 1), (av : Real)])"))
  let t1492 = @tactics.x_gen_tac(@term_syntax.parse_term("(av : Real)"))
  let t1491 = @simp.rewrite_tac(@list.List([@vectors.forall_lift()]))
  let t1489 = @simp.rewrite_tac(@list.List([@integration.integrable_on(), @theorems.left_imp_exists_thm()]))
  let t1488 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.dist())]))
  let t1487 = @tactics.exists_tac(@term_syntax.parse_term("(L : Real)"))
  let t1486 = @tactics.match_mp_tac(@topology.lipschitz_imp_continuous_on())
  let t1485 = @tactics.match_mp_tac(@topology.continuous_on_lift_component_compose())
  let t1490 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.integrable_continuous()), t1485), t1486), t1487), t1488), t1489])
  let t1484 = @tactics.subgoal_then(@term_syntax.parse_term("integrable_on((t : Cart[Real, Unit]) => lift(op_dollar((g2 : (Cart[Real, Unit]) -> Cart[Real, 2])(t), 2)), interval([(vec(0), vec(1))]))"), fn(x1481 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1482 = @tactics.mp_tac(x1481)
    fn(x1483 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1482(x1483)
    }
  })
  let t1473 = @term_syntax.parse_term("(g1 : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t1480 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x1479 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1472 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x1478 : @kernel.Thm) => @lib.check(fn(x1477 : @kernel.Thm) -> Bool raise {
      (fn(x1475 : @kernel.Term) -> Bool raise {
        ((x1474 : @kernel.Term) => @basics.free_in(t1473, x1474))(x1475)
      })((fn(x1476 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x1476)
      })(x1477))
    }, x1478))(x1479))
  }))
  let t1471 = @simp.asm_rewrite_tac(@list.List([]))
  let t1470 = @tactics.replicate_tac(3, @tactics.disch_then(@tactics.conjuncts_then2(fn(x1466 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1463 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1464 = @tactics.subst_all_tac(x1463)
      fn(x1465 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1464(x1465)
      }
    })(@equal.sym(x1466))
  }, fn(x1467 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1468 = @tactics.mp_tac(x1467)
    fn(x1469 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1468(x1469)
    }
  })))
  let t1462 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x1456 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1457 = @tactics.assume_tac(x1456)
    fn(x1458 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1457(x1458)
    }
  }, fn(x1459 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1460 = @tactics.mp_tac(x1459)
    fn(x1461 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1460(x1461)
    }
  }))
  let t1455 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g2 : (Cart[Real, Unit]) -> Cart[Real, 2])"))(fn(x1452 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1453 = @tactics.mp_tac(x1452)
    fn(x1454 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1453(x1454)
    }
  }))
  let t1451 = @list.List([@tactics.first_x_assum(fn(x1448 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1449 = @tactics.accept_tac(x1448)
    fn(x1450 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1449(x1450)
    }
  }), @tactics.all_tac])
  let t1447 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g1 : (Cart[Real, Unit]) -> Cart[Real, 2])"), @integration.arc_length_reparametrization()))
  let t1442 = @drule.match_mp(@paths.simple_path_imp_path())
  let t1444 = @tactics.first_assum(fn(x1443 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1439 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1440 = @tactics.assume_tac(x1439)
      fn(x1441 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1440(x1441)
      }
    })(t1442(x1443))
  })
  let t1438 = @tactics.undisch_then(@term_syntax.parse_term("IN((t : Cart[Real, Unit]), interval([(vec(0), vec(1))]))"), fn(x1437 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t1429 = @term_syntax.parse_term("(g0 : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t1436 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x1435 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1428 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      @tactics.all_tac
    })(((x1434 : @kernel.Thm) => @lib.check(fn(x1433 : @kernel.Thm) -> Bool raise {
      (fn(x1431 : @kernel.Term) -> Bool raise {
        ((x1430 : @kernel.Term) => @basics.free_in(t1429, x1430))(x1431)
      })((fn(x1432 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x1432)
      })(x1433))
    }, x1434))(x1435))
  }))
  let t1445 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x1425 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1426 = @tactics.subst_all_tac(x1425)
    fn(x1427 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1426(x1427)
    }
  }, @tactics.strip_assume_tac)), t1436), t1438), t1444)
  let t1424 = @meson.asm_meson_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()]))
  let t1423 = @tactics.match_mp_tac(@paths.pathstart_shiftpath())
  let t1422 = @simp.expand_tac("a")
  let t1421 = @simp.asm_simp_tac(@list.List([@integration.rectifiable_path_shiftpath(), @paths.simple_path_shiftpath(), @paths.closed_shiftpath(), @paths.path_image_shiftpath(), @integration.path_length_shiftpath()]))
  let t1446 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1420 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1418 = @tactics.subst1_tac(x1417)
      fn(x1419 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1418(x1419)
      }
    })(@equal.sym(x1420))
  }), t1421), t1422), t1423), t1424), t1445])
  let t1416 = @tactics.subgoal_then(@term_syntax.parse_term("path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2])) == path_image((g1 : (Cart[Real, Unit]) -> Cart[Real, 2])) && rectifiable_path(g1) && simple_path(g1) && pathstart(g1) == (a : Cart[Real, 2]) && pathfinish(g1) == a && convex(inside(path_image(g1))) && path_length(g1) == (L : Real)"), fn(x1413 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1414 = @tactics.mp_tac(x1413)
    fn(x1415 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1414(x1415)
    }
  })
  let t1412 = @simp.abbrev_tac(@term_syntax.parse_term("(g1 : (Cart[Real, Unit]) -> Cart[Real, 2]) == shiftpath((t : Cart[Real, Unit]), (g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t1411 = @tactics.disch_then(fn(x1410 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x1410))
  })
  let t1409 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t1408 = @simp.rewrite_tac(@list.List([@sets.in_image(), @theorems.left_imp_exists_thm()]))
  let t1407 = @simp.gen_rewrite_tac(fn(x1406 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x1400 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1401 = @equal.land_conv(x1400)
      fn(x1402 : @kernel.Term) -> @kernel.Thm raise {
        s1401(x1402)
      }
    })((fn(x1403 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s1404 = @equal.rand_conv(x1403)
      fn(x1405 : @kernel.Term) -> @kernel.Thm raise {
        s1404(x1405)
      }
    })(x1406))
  }, @list.List([@paths.path_image()]))
  let t1399 = @tactics.mp_tac(@kernel.assume_rule(@term_syntax.parse_term("IN((a : Cart[Real, 2]), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2])))")))
  let t1397 = @tactics.repeat_tac(@tactics.disch_tac)
  let t1396 = @simp.rewrite_tac(@list.List([@sets.infinite(), @sets.finite_empty(), @sets.finite_sing()]))
  let t1395 = @simp.asm_simp_tac(@list.List([@paths.infinite_simple_path_image()]))
  let t1391 = @term_syntax.parse_term("(INFINITE : ((Cart[Real, 2]) -> Bool) -> Bool)")
  let t1394 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.strip_thm_then)(fn(x1393 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1388 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1389 = @tactics.mp_tac(x1388)
      fn(x1390 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1389(x1390)
      }
    })(((x1392 : @kernel.Thm) => @equal.ap_term(t1391, x1392))(x1393))
  }))
  let t1387 = @simp.asm_simp_tac(@list.List([@topology.diameter_eq_0(), @paths.bounded_path_image()]))
  let t1384 = @drule.match_mp(@vectors.norm_arith(@term_syntax.parse_term("norm((a : Cart[Real, 2]) - a) == (d : Real) → d == real_of_num(0)")))
  let t1386 = @tactics.first_x_assum(fn(x1385 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1382 = @tactics.mp_tac(x1381)
      fn(x1383 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1382(x1383)
      }
    })(t1384(x1385))
  })
  let t1378 = @drule.match_mp(@vectors.vector_arith(@term_syntax.parse_term("(b : Cart[Real, 2]) - (a : Cart[Real, 2]) == op_pct(real_of_num(0), (c : Cart[Real, 2])) → b == a")))
  let t1380 = @tactics.first_x_assum(fn(x1379 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1375 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1376 = @tactics.subst_all_tac(x1375)
      fn(x1377 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1376(x1377)
      }
    })(t1378(x1379))
  })
  let t1374 = @tactics.repeat_tac(@tactics.strip_tac)
  let t1398 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x1371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1372 = @tactics.subst_all_tac(x1371)
    fn(x1373 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1372(x1373)
    }
  }), t1374), t1380), t1386), t1387), t1394), t1395), t1396), t1397])
  let t1370 = @tactics.repeat_tac(@tactics.gen_tac)
  let t1369 = @simp.gen_rewrite_tac(fn(x1366 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s1367 = @equal.land_conv(x1366)
    fn(x1368 : @kernel.Term) -> @kernel.Thm raise {
      s1367(x1368)
    }
  }, @list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= (b : Real)) == (b == real_of_num(0) || real_of_num(0) < b)"))]))
  let t1365 = @tactics.x_gen_tac(@term_syntax.parse_term("(baseline : Real)"))
  let t1363 = @term_syntax.parse_term("(baseline : Cart[Real, 2])")
  let t1362 = @tactics.repeat_tac(@tactics.pop_assum(fn(x1359 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s1360 = @tactics.mp_tac(x1359)
    fn(x1361 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s1360(x1361)
    }
  }))
  let t1358 = @simp.abbrev_tac(@term_syntax.parse_term("(baseline : Cart[Real, 2]) == (b : Cart[Real, 2]) - (a : Cart[Real, 2])"))
  let t1356 = @term_syntax.parse_term("(b : Cart[Real, 2])")
  let t1357 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t1356]))
  let t1355 = @simp.asm_simp_tac(@list.List([@theorems.left_imp_exists_thm(), @paths.path_image_nonempty(), @paths.compact_path_image()]))
  let t1354 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))"), @topology.diameter_compact_attained()))
  let t1351 = @drule.match_mp(@paths.simple_path_imp_path())
  let t1353 = @tactics.first_assum(fn(x1352 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x1348 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s1349 = @tactics.assume_tac(x1348)
      fn(x1350 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s1349(x1350)
      }
    })(t1351(x1352))
  })
  let t1347 = @simp.asm_rewrite_tac(@list.List([]))
  let t1346 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g0 : (Cart[Real, Unit]) -> Cart[Real, 2])"), @integration.simple_path_length_pos_lt()))
  let t1345 = @term_syntax.parse_term("(g0 : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t2150 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(L : Real)"), t1345])), @tactics.strip_tac), t1346), t1347), @tactics.disch_tac), t1353), t1354), t1355), t1357), @tactics.strip_tac), t1358), t1362), (x1364 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @determinants.geom_basis_multiple_tac(1L, t1363, x1364)), t1365), t1369), @tactics.strip_tac), t1370), t1398), t1399), t1407), t1408), t1409), t1411), t1412), t1416), t1446), t1447), @tactics.ants_tac), t1451), t1455), t1462), t1470), t1471), @tactics.strip_tac), t1480), t1484), t1490), t1491), t1492), @tactics.disch_tac), t1493), t1497), t1501), t1509), t1510), t1511), t1512), t1519), @tactics.strip_tac), t1527), t1535), t1538), t1539), t1545), t1546), @tactics.strip_tac), t1550), t1553), t1559), t1560), @tactics.disch_tac), t1566), t1567), @tactics.disch_tac), t1568), t1572), t1576), t1607), t1611), t1652), t1656), t1702), t1706), t1715), t1719), t1785), t1786), t1801), t1802), t1824), t1826), t1827), t1831), t1846), t1847), t1849), t1851), t1852), t1856), t1857), t1858), t1859), t1860), t1861), t1863), t1866), t1867), t1868), t1869), t1873), @tactics.ants_tac), t1904), t1905), @tactics.conj_tac), t1936), t1940), t1948), t1952), t1956), t1967), t1969), t1975), t1976), t1980), t1981), t1982), t1986), t1987), @tactics.disch_tac), t1994), t1995), t1996), t1997), t1998), t1999), @tactics.disch_tac), t2010), t2011), t2012), t2013), t2017), t2018), fn(x2028 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2027 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2025 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2024 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x2019 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s2020 = @tactics.mp_tac(x2019)
            fn(x2021 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s2020(x2021)
            }
          })(t2023(x2024))
        })(@equal.lhand(x2025))
      })((fn(x2026 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2026.1
      })(x2027))
    })(x2028)(x2028)
  }), t2029), t2030), t2031), t2033), t2037), t2038), t2039), t2040), t2045), t2049), t2050), t2052), t2053), @tactics.disch_tac), @tactics.disch_tac), t2057), t2122), t2127), t2128), @tactics.conj_tac), t2136), t2137), @tactics.disch_tac), t2138), t2139), t2140), t2141), t2142), t2148), t2149)
  isoperimetric_theorem_convex_c.set(@tactics.prove(@term_syntax.parse_term("∀ L : Real, ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], rectifiable_path(g) && simple_path(g) && pathfinish(g) == pathstart(g) && convex(inside(path_image(g))) && path_length(g) == L → measure(inside(path_image(g))) <= pow(L, 2) / (real_of_num(4) * pi) && (measure(inside(path_image(g))) == pow(L, 2) / (real_of_num(4) * pi) → (∃ a : Cart[Real, 2], ∃ r : Real, path_image(g) == sphere((a, r))))"), t2150))
}

///|
let isoperimetric_theorem_convex_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOPERIMETRIC_THEOREM_CONVEX")

///|
/// `ISOPERIMETRIC_THEOREM_CONVEX`
pub fn isoperimetric_theorem_convex() -> @kernel.Thm {
  isoperimetric_theorem_convex_c.get()
}

///|
/// STEP_LEMMA
fn step_9() -> Unit raise {
  let t2981 = @sets.set_tac(@list.List([]))
  let t2980 = @simp.rewrite_tac(@list.List([@paths.path_image()]))
  let t2979 = @simp.expand_tac("h")
  let t2978 = @tactics.match_mp_tac(@misc.hull_mono())
  let t2977 = @list.List([@simp.asm_rewrite_tac(@list.List([@sets.subset_refl()])), @tactics.all_tac])
  let t2976 = @term_syntax.parse_term("hull(convex, IMAGE((g : (Cart[Real, Unit]) -> Cart[Real, 2]), DIFF(interval([(vec(0), vec(1))]), interval(((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))))))")
  let t2982 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.trans_tac(@sets.subset_trans())(t2976), @tactics.conj_tac), t2977), t2978), t2979), t2980), t2981)
  let t2975 = @simp.asm_simp_tac(@list.List([@paths.simple_path_imp_path()]))
  let t2974 = @tactics.match_mp_tac(@paths.compact_path_image())
  let t2973 = @tactics.match_mp_tac(@convex.compact_convex_hull())
  let t2972 = @tactics.match_mp_tac(@topology.compact_imp_closed())
  let t2971 = @simp.rewrite_tac(@list.List([@topology.frontier_subset_eq()]))
  let t2968 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@sets.subset_trans()))
  let t2970 = @tactics.first_x_assum(fn(x2969 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2968(x2969))
  })
  let t2967 = @simp.rewrite_tac(@list.List([@topology.segment_open_subset_closed()]))
  let t2965 = @term_syntax.parse_term("segment([((g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])), g((b : Cart[Real, Unit])))])")
  let t2966 = @tactics.trans_tac(@sets.subset_trans())(t2965)
  let t2964 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset(), @misc.hull_subset()])), @tactics.all_tac])
  let t2961 = @simp.asm_rewrite_tac(@list.List([]))
  let t2962 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.union_subset()])), t2961)
  let t2960 = @sets.set_tac(@list.List([]))
  let t2959 = @simp.rewrite_tac(@list.List([@paths.path_image()]))
  let t2963 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t2959), t2960), t2962])
  let t2958 = @tactics.exists_tac(@term_syntax.parse_term("UNION(IMAGE((g : (Cart[Real, Unit]) -> Cart[Real, 2]), DIFF(interval([(vec(0), vec(1))]), interval(((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))))), IMAGE((h : (Cart[Real, Unit]) -> Cart[Real, 2]), interval((a, b))))"))
  let t2957 = @tactics.match_mp_tac(@sets.subset_trans())
  let t2956 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t2983 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_minimal()), t2956), t2957), t2958), @tactics.conj_tac), t2963), @tactics.conj_tac), t2964), t2966), t2967), t2970), t2971), t2972), t2973), t2974), t2975), t2982])
  let t2955 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t2953 = @simp.asm_rewrite_tac(@list.List([@topology.in_interval_1()]))
  let t2950 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET(IMAGE((g : (_) -> _), (i : (_) -> Bool)), (j : (_) -> Bool)) → IN((c : _), i) → IN(g(c), j)")))
  let t2952 = @tactics.first_x_assum(fn(x2951 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2950(x2951))
  })
  let t2949 = @simp.rewrite_tac(@list.List([]))
  let t2948 = @tactics.disch_then(fn(x2947 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2944 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2945 = @tactics.mp_tac(x2944)
      fn(x2946 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2945(x2946)
      }
    })(@bool.conjunct2(x2947))
  })
  let t2943 = @simp.rewrite_tac(@list.List([@topology.frontier(), @sets.in_diff()]))
  let t2940 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → !IN((x : _), t) → !IN(x, s)")))
  let t2942 = @tactics.first_x_assum(fn(x2941 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2940(x2941))
  })
  let t2938 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.between()), @topology.between_in_segment()]))
  let t2937 = @simp.rewrite_tac(@list.List([@topology.subset_interval_1()]))
  let t2934 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj()]))(@integration.has_bounded_variation_on_subset()))
  let t2936 = @tactics.first_x_assum(fn(x2935 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2934(x2935))
  })
  let t2933 = @simp.asm_simp_tac(@list.List([@topology.segment_1(), @realarith.real_lt_imp_le(), @sets.subset_refl()]))
  let t2939 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@integration.vector_variation_ge_norm_function())), t2933), t2936), t2937), @calc_rat.asm_real_arith_tac), t2938])
  let t2932 = @tactics.exists_tac(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((c : Cart[Real, Unit]))"))
  let t2931 = @tactics.match_mp_tac(@vectors.norm_arith(@term_syntax.parse_term("∀ c : Cart[Real, N], (norm(c - (a : Cart[Real, N])) <= (v : Real) && norm((b : Cart[Real, N]) - c) <= (w : Real)) && !(distance((a, b)) == distance((a, c)) + distance((c, b))) → !(norm(b - a) == v + w)")))
  let t2928 = @tactics.disch_then(fn(x2927 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2924 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2925 = @tactics.subst1_tac(x2924)
      fn(x2926 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2925(x2926)
      }
    })(@equal.sym(x2927))
  })
  let t2929 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()])), t2928)
  let t2923 = @simp.rewrite_tac(@list.List([@vectors.midpoint(), @vectors.drop_cmul(), @vectors.drop_add()]))
  let t2930 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("c"), t2923), @calc_rat.asm_real_arith_tac), t2929])
  let t2922 = @tactics.subgoal_then(@term_syntax.parse_term("drop((a : Cart[Real, Unit])) < drop((c : Cart[Real, Unit])) && drop(c) < drop((b : Cart[Real, Unit]))"), @tactics.strip_assume_tac)
  let t2918 = @term_syntax.parse_term("(c : Cart[Real, Unit])")
  let t2919 = @term_syntax.parse_term("(b : Cart[Real, Unit])")
  let t2920 = @term_syntax.parse_term("(a : Cart[Real, Unit])")
  let t2921 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), t2920, t2919, t2918]), @integration.vector_variation_combine()))
  let t2917 = @simp.abbrev_tac(@term_syntax.parse_term("(c : Cart[Real, Unit]) == midpoint(((a : Cart[Real, Unit]), (b : Cart[Real, Unit])))"))
  let t2915 = @simp.asm_simp_tac(@list.List([@topology.segment_1(), @realarith.real_lt_imp_le(), @sets.subset_refl()]))
  let t2916 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(@integration.vector_variation_ge_norm_function()), t2915), @tactics.all_tac])
  let t2911 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.in_interval_1(), @vectors.drop_vec()])))
  let t2912 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.subset_interval_1(), @vectors.drop_vec()])), t2911), @calc_rat.asm_real_arith_tac)
  let t2910 = @meson.asm_meson_tac(@list.List([]))
  let t2909 = @simp.rewrite_tac(@list.List([@topology.bounded_interval(), @equal.gsym(@vectors.dist())]))
  let t2913 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.lipschitz_imp_has_bounded_variation()), t2909), t2910), t2912])
  let t2908 = @tactics.exists_tac(@term_syntax.parse_term("(interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])"))
  let t2914 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.has_bounded_variation_on_subset()), t2908), @tactics.conj_tac), t2913), @tactics.all_tac])
  let t2907 = @tactics.subgoal_then(@term_syntax.parse_term("has_bounded_variation_on((g : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))]))"), fn(x2904 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2905 = @tactics.assume_tac(x2904)
    fn(x2906 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2905(x2906)
    }
  })
  let t2903 = @simp.rewrite_tac(@list.List([@realarith.real_lt_le()]))
  let t2902 = @simp.rewrite_tac(@list.List([@realarith.real_mul_rid()]))
  let t2901 = @simp.asm_simp_tac(@list.List([@real.real_abs_inv(), @realax.real_abs(), @realarith.real_sub_le(), @realarith.real_lt_imp_le(), @calc_rat.real_field(@term_syntax.parse_term("(a : Real) < (b : Real) → inv(b - a) * (b - a) == real_of_num(1)"))]))
  let t2900 = @simp.asm_simp_tac(@list.List([@topology.interval_eq_empty_1(), @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) < (b : Real) → !(b < a)"))]))
  let t2899 = @simp.rewrite_tac(@list.List([@integration.vector_variation_id()]))
  let t2898 = @simp.simp_tac(@list.List([@integration.vector_variation_translation(), @integration.has_bounded_variation_on_translation(), @integration.has_bounded_variation_on_cmul_eq(), @integration.vector_variation_cmul(), @integration.has_bounded_variation_on_id(), @topology.bounded_interval()]))
  let t2897 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((c : Real), (x : Cart[Real, N]) - (a : Cart[Real, N])) == -op_pct(c, a) + op_pct(c, x)"))]))
  let t2896 = @simp.rewrite_tac(@list.List([@vectors.lift_drop(), @vectors.lift_sub()]))
  let t2895 = @simp.rewrite_tac(@list.List([@simp.once_rewrite_rule(@list.List([@realax.real_mul_sym()]))(@realax.real_div()), @vectors.lift_cmul()]))
  let t2894 = @list.List([@tactics.all_tac, @tactics.disch_then(fn(x2891 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2892 = @tactics.subst1_tac(x2891)
    fn(x2893 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2892(x2893)
    }
  })])
  let t2885 = @drule.part_match(fn(x2884 : @kernel.Term) -> @kernel.Term raise {
    @equal.lhand(@kernel.rand(x2884))
  }, @integration.vector_variation_vmul())
  let t2880 = @simp.rewrite_tac(@list.List([@integration.vector_variation_translation()]))
  let t2878 = @tactics.conv_tac(@vectors.vector_arith)
  let t2877 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("(a : Real) < (b : Real) → (b - a) / (b - a) == real_of_num(1)"))]))
  let t2876 = @simp.rewrite_tac(@list.List([@vectors.vector_add_rid()]))
  let t2875 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - a) / (b : Real) == real_of_num(0)")), @vectors.vector_mul_lzero()]))
  let t2874 = @simp.asm_rewrite_tac(@list.List([@vectors.ends_in_interval()]))
  let t2873 = @simp.rewrite_tac(@list.List([]))
  let t2872 = @simp.expand_tac("h")
  let t2871 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2870 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2869 = @simp.asm_simp_tac(@list.List([@topology.closed_open_interval_1(), @realarith.real_lt_imp_le()]))
  let t2868 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t2867 = @tactics.match_mp_tac(@integration.vector_variation_eq())
  let t2879 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@real.real_eq_imp_le()), t2867), t2868), t2869), t2870), t2871), t2872), t2873), t2874), t2875), t2876), t2877), t2878), @tactics.all_tac])
  let t2865 = @term_syntax.parse_term("vector_variation(interval([((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))]), (t : Cart[Real, Unit]) => (g : (Cart[Real, Unit]) -> Cart[Real, 2])(a) + op_pct((drop(t) - drop(a)) / (drop(b) - drop(a)), g(b) - g(a)))")
  let t2866 = @tactics.trans_tac(@realarith.real_let_trans())(t2865)
  let t2863 = @simp.simp_tac(@list.List([@topology.in_interval_1(), @equal.gsym(@real.real_not_le())]))
  let t2862 = @simp.expand_tac("h")
  let t2864 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.vector_variation_eq()), t2862), t2863), @tactics.all_tac])
  let t2861 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) == (b : Real) && (c : Real) < (d : Real) → c + a < d + b")))
  let t2859 = @tactics.disch_then(fn(x2858 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2855 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2856 = @tactics.subst1_tac(x2855)
      fn(x2857 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2856(x2857)
      }
    })(@equal.sym(x2858))
  })
  let t2852 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.in_interval_1(), @vectors.drop_vec()])))
  let t2853 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.subset_interval_1(), @vectors.drop_vec()])), t2852), @calc_rat.asm_real_arith_tac)
  let t2851 = @meson.asm_meson_tac(@list.List([]))
  let t2850 = @simp.rewrite_tac(@list.List([@topology.bounded_interval(), @equal.gsym(@vectors.dist())]))
  let t2854 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.lipschitz_imp_has_bounded_variation()), t2850), t2851), t2853])
  let t2849 = @tactics.exists_tac(@term_syntax.parse_term("(interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])"))
  let t2860 = @tactics.repeat_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.has_bounded_variation_on_subset()), t2849), @tactics.conj_tac), t2854), t2859])))
  let t2848 = @tactics.disch_then(fn(x2845 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x2845
    let t2847 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), th_5))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])"), th_5)), t2847)
  })
  let t2844 = @list.List([@meson.asm_meson_tac(@list.List([@topology.in_interval_1()])), @tactics.all_tac])
  let t2843 = @simp.asm_simp_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm(), @realarith.real_lt_imp_le()]))
  let t2838 = @term_syntax.parse_term("(b : Cart[Real, Unit])")
  let t2839 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(1)")
  let t2840 = @term_syntax.parse_term("(a : Cart[Real, Unit])")
  let t2841 = @bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, Unit]) -> Cart[Real, 2])"), t2840, t2839, t2838]), @integration.vector_variation_combine())
  let t2842 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(f : (Cart[Real, Unit]) -> Cart[Real, 2])"), t2841))
  let t2836 = @simp.simp_tac(@list.List([@topology.in_interval_1(), @equal.gsym(@real.real_not_le())]))
  let t2835 = @simp.expand_tac("h")
  let t2837 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.vector_variation_eq()), t2835), t2836), @tactics.all_tac])
  let t2834 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) == (b : Real) && (c : Real) < (d : Real) → a + c < b + d")))
  let t2832 = @tactics.disch_then(fn(x2831 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2828 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2829 = @tactics.subst1_tac(x2828)
      fn(x2830 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2829(x2830)
      }
    })(@equal.sym(x2831))
  })
  let t2827 = @meson.asm_meson_tac(@list.List([]))
  let t2826 = @simp.rewrite_tac(@list.List([@topology.bounded_interval(), @equal.gsym(@vectors.dist())]))
  let t2833 = @tactics.repeat_tac(@tactics.thenl(@tactics.ants_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.lipschitz_imp_has_bounded_variation()), t2826), t2827), t2832])))
  let t2825 = @tactics.disch_then(fn(x2822 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x2822
    let t2824 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), th_4))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])"), th_4)), t2824)
  })
  let t2821 = @simp.asm_rewrite_tac(@list.List([@theorems.conj_assoc(), @equal.gsym(@topology.in_interval_1())]))
  let t2816 = @term_syntax.parse_term("(a : Cart[Real, Unit])")
  let t2817 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(1)")
  let t2818 = @term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)")
  let t2819 = @bool.ispecl(@list.List([@term_syntax.parse_term("(f : (Cart[Real, Unit]) -> Cart[Real, 2])"), t2818, t2817, t2816]), @integration.vector_variation_combine())
  let t2820 = @tactics.mp_tac(@bool.gen(@term_syntax.parse_term("(f : (Cart[Real, Unit]) -> Cart[Real, 2])"), t2819))
  let t2954 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@integration.path_length()])), t2820), t2821), t2825), t2833), t2834), @tactics.conj_tac), t2837), t2842), t2843), @tactics.ants_tac), t2844), t2848), t2860), t2861), @tactics.conj_tac), t2864), t2866), @tactics.conj_tac), t2879), t2880), fn(x2890 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x2889 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2887 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2886 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x2881 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s2882 = @tactics.mp_tac(x2881)
            fn(x2883 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s2882(x2883)
            }
          })(t2885(x2886))
        })(@equal.lhand(x2887))
      })((fn(x2888 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x2888.1
      })(x2889))
    })(x2890)(x2890)
  }), @tactics.ants_tac), t2894), t2895), t2896), t2897), t2898), t2899), t2900), t2901), t2902), t2903), t2907), t2914), @tactics.conj_tac), t2916), t2917), t2921), t2922), t2930), t2931), t2932), @tactics.conj_tac), t2939), t2942), t2943), t2948), t2949), t2952), t2953), @tactics.all_tac])
  let t2814 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.in_interval_1(), @vectors.drop_vec()])))
  let t2813 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()]))
  let t2812 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2811 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist())]))
  let t2810 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le()]))
  let t2809 = @tactics.match_mp_tac(@real.real_le_lmul())
  let t2808 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2807 = @simp.rewrite_tac(@list.List([@topology.in_interval_1()]))
  let t2806 = @simp.once_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (b : Real) * (c : Real) == b * (a * c)"))]))
  let t2805 = @simp.asm_simp_tac(@list.List([@real.real_le_ldiv_eq(), @vectors.norm_pos_lt(), @vectors.vector_sub_eq()]))
  let t2803 = @calc_rat.real_arith(@term_syntax.parse_term("(a : Real) / (b : Real) * (c : Real) == a * c / b"))
  let t2804 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.drop_sub()), @vectors.abs_drop(), t2803]))
  let t2802 = @simp.asm_simp_tac(@list.List([@vectors.norm_mul(), @real.real_abs_div(), @calc_rat.real_field(@term_syntax.parse_term("(a : Real) < (b : Real) → ((x : Real) - a) / (b - a) - ((y : Real) - a) / (b - a) == (x - y) / (b - a)"))]))
  let t2801 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(a : Cart[Real, N]) + op_pct((x : Real), (c : Cart[Real, N])) - (a + op_pct((y : Real), c)) == op_pct(x - y, c)"))]))
  let t2799 = @tactics.conv_tac(@vectors.vector_arith)
  let t2798 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("(a : Real) < (b : Real) → (b - a) / (b - a) == real_of_num(1)"))]))
  let t2797 = @simp.rewrite_tac(@list.List([@vectors.vector_add_rid()]))
  let t2796 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("((a : Real) - a) / (b : Real) == real_of_num(0)")), @vectors.vector_mul_lzero()]))
  let t2795 = @simp.asm_rewrite_tac(@list.List([@vectors.ends_in_interval()]))
  let t2794 = @simp.rewrite_tac(@list.List([]))
  let t2793 = @simp.expand_tac("h")
  let t2792 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2791 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2800 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@topology.closed_open_interval_1(), @realarith.real_lt_imp_le()])), t2791), t2792), t2793), t2794), t2795), t2796), t2797), t2798), t2799), @tactics.all_tac])
  let t2790 = @tactics.subgoal_then(@term_syntax.parse_term("∀ t : Cart[Real, Unit], IN(t, interval([((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))])) → (h : (Cart[Real, Unit]) -> Cart[Real, 2])(t) == (g : (Cart[Real, Unit]) -> Cart[Real, 2])(a) + op_pct((drop(t) - drop(a)) / (drop(b) - drop(a)), g(b) - g(a))"), fn(x2788 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x2788
    @simp.simp_tac(@list.List([th_3]))
  })
  let t2786 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.in_interval_1(), @vectors.drop_vec()])))
  let t2785 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()]))
  let t2784 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2783 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist())]))
  let t2782 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2781 = @simp.simp_tac(@list.List([@topology.in_interval_1(), @equal.gsym(@real.real_not_le()), @vectors.drop_vec()]))
  let t2787 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t2781), t2782), t2783), t2784), t2785), t2786), @calc_rat.asm_real_arith_tac)])
  let t2780 = @tactics.exists_tac(@term_syntax.parse_term("(b : Cart[Real, Unit])"))
  let t2779 = @tactics.match_mp_tac(@paths.lipschitz_on_combine())
  let t2777 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.in_interval_1(), @vectors.drop_vec()])))
  let t2776 = @simp.rewrite_tac(@list.List([@topology.in_interval_1(), @vectors.drop_vec()]))
  let t2775 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t2774 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist())]))
  let t2773 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2772 = @simp.simp_tac(@list.List([@topology.in_interval_1(), @equal.gsym(@real.real_not_le()), @vectors.drop_vec()]))
  let t2778 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t2772), t2773), t2774), t2775), t2776), t2777), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2771 = @tactics.exists_tac(@term_syntax.parse_term("(a : Cart[Real, Unit])"))
  let t2770 = @tactics.match_mp_tac(@paths.lipschitz_on_combine())
  let t2815 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.dist()])), t2770), t2771), @tactics.conj_tac), t2778), t2779), t2780), @tactics.conj_tac), t2787), t2790), t2800), t2801), t2802), t2804), t2805), t2806), t2807), t2808), t2809), t2810), t2811), t2812), t2813), t2814), @calc_rat.asm_real_arith_tac), @tactics.disch_tac])
  let t2769 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t2768 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2767 = @tactics.subgoal_then(@term_syntax.parse_term("!((a : Cart[Real, Unit]) == (b : Cart[Real, Unit]))"), fn(x2764 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2765 = @tactics.assume_tac(x2764)
    fn(x2766 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2765(x2766)
    }
  })
  let t2759 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2758 = @simp.rewrite_tac(@list.List([@topology.ends_not_in_segment()]))
  let t2755 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("!(!IN((x : _), {(b : _), (a : _)}) && IN(x, UNION((t : (_) -> Bool), {a, b}))) → !IN(a, t) && !IN(b, t) → !IN(x, t)")))
  let t2757 = @tactics.disch_then(fn(x2756 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2752 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2753 = @tactics.mp_tac(x2752)
      fn(x2754 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2753(x2754)
      }
    })(t2755(x2756))
  })
  let t2750 = @simp.asm_rewrite_tac(@list.List([]))
  let t2749 = @simp.rewrite_tac(@list.List([]))
  let t2751 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t2749), t2750), @tactics.all_tac])
  let t2748 = @tactics.subgoal_then(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((x : Cart[Real, Unit])) == (h : (Cart[Real, Unit]) -> Cart[Real, 2])(x)"), fn(x2745 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2746 = @tactics.subst1_tac(x2745)
    fn(x2747 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2746(x2747)
    }
  })
  let t2744 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_diff(), @sets.in_inter()]))
  let t2740 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((x : Cart[Real, Unit]))")
  let t2743 = @tactics.disch_then(fn(x2742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2737 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2738 = @tactics.mp_tac(x2737)
      fn(x2739 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2738(x2739)
      }
    })(((x2741 : @kernel.Thm) => @bool.spec(t2740, x2741))(x2742))
  })
  let t2736 = @simp.asm_rewrite_tac(@list.List([@sets.extension(), @sets.not_in_empty(), @class.not_exists_thm()]))
  let t2735 = @tactics.undisch_tac(@term_syntax.parse_term("INTER(DIFF(path_image((g1 : (Cart[Real, Unit]) -> Cart[Real, 2])), {(g : (Cart[Real, Unit]) -> Cart[Real, 2])((b : Cart[Real, Unit])), g((a : Cart[Real, Unit]))}), path_image((d0 : (Cart[Real, Unit]) -> Cart[Real, 2]))) == {}"))
  let t2734 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff()]))
  let t2731 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IMAGE((f : (_) -> _), (s : (_) -> Bool)) == (t : (_) -> Bool) → (∀ x : _, IN(x, s) → IN(f(x), t))")))
  let t2728 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t2733 = @tactics.disch_then(fn(x2732 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2730 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2725 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2726 = @tactics.mp_tac(x2725)
        fn(x2727 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2726(x2727)
        }
      })(((x2729 : @kernel.Thm) => @bool.spec(t2728, x2729))(x2730))
    })(t2731(x2732))
  })
  let t2724 = @tactics.undisch_tac(@term_syntax.parse_term("IMAGE((g : (Cart[Real, Unit]) -> Cart[Real, 2]), DIFF(interval([(vec(0), vec(1))]), interval(((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))))) == path_image((g1 : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t2723 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2722 = @term_syntax.parse_term("(y : Cart[Real, Unit])")
  let t2760 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Cart[Real, Unit])"), t2722])), t2723), t2724), t2733), t2734), @tactics.disch_tac), t2735), t2736), t2743), t2744), t2748), t2751), t2757), t2758), t2759)
  let t2721 = @simp.asm_simp_tac(@list.List([@vectors.drop_eq(), @vectors.vector_sub_eq()]))
  let t2720 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("(a : Real) < (b : Real) → (((x : Real) - a) / (b - a) == ((y : Real) - a) / (b - a)) == (x == y)"))]))
  let t2719 = @simp.asm_rewrite_tac(@list.List([@vectors.vector_mul_rcancel(), @vectors.vector_sub_eq()]))
  let t2718 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("((a : Cart[Real, N]) + (x : Cart[Real, N]) == a + (y : Cart[Real, N])) == (x == y)"))]))
  let t2717 = @simp.simp_tac(@list.List([]))
  let t2761 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t2717), t2718), t2719), t2720), t2721)
  let t2716 = @meson.meson_tac(@list.List([]))
  let t2715 = @simp.rewrite_tac(@list.List([@paths.simple_path()]))
  let t2714 = @tactics.undisch_tac(@term_syntax.parse_term("simple_path((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t2713 = @simp.simp_tac(@list.List([]))
  let t2762 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t2713), t2714), t2715), t2716), t2761, t2760])
  let t2712 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2710 = @simp.rewrite_tac(@list.List([]))
  let t2711 = @list.List([@meson.meson_tac(@list.List([])), t2710])
  let t2709 = @tactics.exists_tac(@term_syntax.parse_term("(x : Cart[Real, Unit]) => IN(x, interval(((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))))"))
  let t2763 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("∀ Q : (_) -> Bool, (∀ x : _, ∀ y : _, (P : (_, _) -> Bool)(x, y) == P(y, x)) && (∀ x : _, ∀ y : _, !Q(x) && !Q(y) → P(x, y)) && (∀ x : _, ∀ y : _, Q(x) && Q(y) → P(x, y)) && (∀ x : _, ∀ y : _, !Q(x) && Q(y) → P(x, y)) → (∀ x : _, ∀ y : _, P(x, y))"))), t2709), @tactics.conj_tac), t2711), t2712), t2762), @tactics.all_tac])
  let t2707 = @meson.meson_tac(@list.List([@topology.lipschitz_imp_continuous_on()]))
  let t2708 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@vectors.dist(), @paths.path()])), t2707), @tactics.all_tac])
  let t2706 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t2705 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((r : Bool) → (p : Bool)) && (q : Bool) && r && (s : Bool) → p && q && r && s")))
  let t2704 = @simp.rewrite_tac(@list.List([@paths.simple_path(), @equal.gsym(@theorems.conj_assoc())]))
  let t2702 = @simp.simp_tac(@list.List([]))
  let t2703 = @list.List([@tactics.then_tac(@simp.expand_tac("h"), t2702), @tactics.all_tac])
  let t2701 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t2700 = @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))
  let t2699 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t2697 = @simp.asm_rewrite_tac(@list.List([]))
  let t2696 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2695 = @simp.rewrite_tac(@list.List([@topology.segment_closed_open()]))
  let t2698 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@topology.closed_open_interval_1(), @realarith.real_lt_imp_le()])), t2695), t2696), t2697])
  let t2694 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE((h : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))])) == segment([((g : (Cart[Real, Unit]) -> Cart[Real, 2])(a), g(b))])"), fn(x2691 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2692 = @tactics.assume_tac(x2691)
    fn(x2693 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2692(x2693)
    }
  })
  let t2689 = @simp.rewrite_tac(@list.List([@vectors.ends_in_interval()]))
  let t2690 = @list.List([@tactics.then_tac(@simp.expand_tac("h"), t2689), @tactics.all_tac])
  let t2688 = @tactics.subgoal_then(@term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])) == (g : (Cart[Real, Unit]) -> Cart[Real, 2])(a) && h((b : Cart[Real, Unit])) == g(b)"), @tactics.strip_assume_tac)
  let t2686 = @tactics.conv_tac(@calc_rat.real_field)
  let t2685 = @tactics.undisch_tac(@term_syntax.parse_term("drop((a : Cart[Real, Unit])) < drop((b : Cart[Real, Unit]))"))
  let t2684 = @simp.rewrite_tac(@list.List([@vectors.drop_add(), @vectors.drop_sub(), @vectors.drop_cmul()]))
  let t2683 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc()]))
  let t2682 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct(real_of_num(1) - (a : Real), (x : Cart[Real, N])) + op_pct(a, (y : Cart[Real, N])) == x + op_pct(a, y - x)"))]))
  let t2681 = @tactics.x_gen_tac(@term_syntax.parse_term("(t : Cart[Real, Unit])"))
  let t2680 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, (f : (_) -> _)(x) == (g : (_) -> _)(x)) → IMAGE(f, (s : (_) -> Bool)) == IMAGE(g, s)")))
  let t2679 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.image_o()), @trivia.o_def()]))
  let t2678 = @tactics.disch_then(fn(x2675 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2676 = @tactics.subst1_tac(x2675)
    fn(x2677 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2676(x2677)
    }
  })
  let t2674 = @simp.asm_simp_tac(@list.List([@equal.gsym(@vectors.drop_eq()), @realarith.real_lt_imp_le(), @real.real_lt_imp_ne(), @topology.segment_1()]))
  let t2672 = @bool.conjunct2(@convex.segment_image_interval())
  let t2671 = @term_syntax.parse_term("(b : Cart[Real, Unit])")
  let t2673 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, Unit])"), t2671]), t2672))
  let t2668 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("((x : _) => if IN(x, (s : (_) -> Bool)) { (f : (_) -> _)(x) } else { (g : (_) -> _)(x) }) == (h : (_) -> _) → IMAGE(f, s) == (t : (_) -> Bool) → IMAGE(h, s) == t")))
  let t2670 = @tactics.first_x_assum(fn(x2669 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2668(x2669))
  })
  let t2687 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@convex.segment_image_interval()])), t2670), t2673), t2674), t2678), t2679), t2680), t2681), t2682), @tactics.ap_term_tac), t2683), @tactics.ap_thm_tac), @tactics.ap_term_tac), t2684), t2685), t2686), @tactics.all_tac])
  let t2667 = @tactics.subgoal_then(@term_syntax.parse_term("IMAGE((h : (Cart[Real, Unit]) -> Cart[Real, 2]), interval(((a : Cart[Real, Unit]), (b : Cart[Real, Unit])))) == segment(((g : (Cart[Real, Unit]) -> Cart[Real, 2])(a), g(b)))"), fn(x2664 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2665 = @tactics.assume_tac(x2664)
    fn(x2666 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2665(x2666)
    }
  })
  let t2661 = @simp.asm_rewrite_tac(@list.List([]))
  let t2662 = @tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.strip_tac), t2661)
  let t2660 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.in_interval_1(), @vectors.drop_vec()])))
  let t2659 = @simp.asm_rewrite_tac(@list.List([]))
  let t2658 = @simp.rewrite_tac(@list.List([@paths.pathstart(), @paths.pathfinish()]))
  let t2663 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("h"), t2658), @tactics.conj_tac), @class.cond_cases_tac), t2659), t2660), @calc_rat.asm_real_arith_tac), t2662])
  let t2657 = @tactics.subgoal_then(@term_syntax.parse_term("pathstart((h : (Cart[Real, Unit]) -> Cart[Real, 2])) == pathstart((g : (Cart[Real, Unit]) -> Cart[Real, 2])) && pathfinish(h) == pathfinish(g)"), fn(x2654 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2655 = @tactics.mp_tac(x2654)
    fn(x2656 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2655(x2656)
    }
  })
  let t2653 = @tactics.exists_tac(@term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])"))
  let t2652 = @simp.abbrev_tac(@term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2]) == ((t : Cart[Real, Unit]) => if IN(t, interval(((a : Cart[Real, Unit]), (b : Cart[Real, Unit])))) { (g : (Cart[Real, Unit]) -> Cart[Real, 2])(a) + op_pct((drop(t) - drop(a)) / (drop(b) - drop(a)), g(b) - g(a)) } else { g(t) })"))
  let t2650 = @meson.asm_meson_tac(@list.List([@paths.pathstart_in_path_image(), @paths.pathfinish_in_path_image(), @paths.arc_imp_path()]))
  let t2649 = @simp.asm_simp_tac(@list.List([@paths.connected_path_image(), @paths.arc_imp_path()]))
  let t2651 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@paths.connected_subset_segment()), t2649), t2650), @tactics.all_tac])
  let t2648 = @tactics.subgoal_then(@term_syntax.parse_term("path_image((d0 : (Cart[Real, Unit]) -> Cart[Real, 2])) == segment([((g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])), g((b : Cart[Real, Unit])))])"), fn(x2645 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2646 = @tactics.assume_tac(x2645)
    fn(x2647 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2646(x2647)
    }
  })
  let t2641 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2640 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @arith.le_refl()]))
  let t2642 = @tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@misc.hull_p(), @convex.convex_segment(), @convex.interior_segment()])), t2640), t2641)
  let t2643 = @list.List([@simp.asm_simp_tac(@list.List([@topology.subset_interior(), @misc.hull_mono()])), t2642])
  let t2644 = @list.List([@tactics.all_tac, @tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("SUBSET(interior(hull(convex, path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])))), interior(hull(convex, segment([((g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])), g((b : Cart[Real, Unit])))]))))"), fn(x2637 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2638 = @tactics.mp_tac(x2637)
    fn(x2639 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2638(x2639)
    }
  }), t2643)])
  let t2635 = @simp.rewrite_tac(@list.List([@paths.path_image_reversepath()]))
  let t2634 = @simp.rewrite_tac(@list.List([@topology.ends_in_segment(), @topology.connected_segment()]))
  let t2633 = @simp.asm_simp_tac(@list.List([@paths.arc_reversepath_eq(), @paths.pathstart_reversepath(), @paths.pathfinish_reversepath(), @paths.path_image_reversepath()]))
  let t2636 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@paths.connected_subset_arc_pair()), t2633), t2634), t2635])
  let t2632 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(path_image((d0 : (Cart[Real, Unit]) -> Cart[Real, 2])), segment([((g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])), g((b : Cart[Real, Unit])))])) || SUBSET(path_image(reversepath((d1 : (Cart[Real, Unit]) -> Cart[Real, 2]))), segment([(g(a), g(b))]))"), fn(x2629 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2630 = @tactics.mp_tac(x2629)
    fn(x2631 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2630(x2631)
    }
  })
  let t2625 = @tactics.thenl(@tactics.conj_tac, @list.List([@meson.asm_meson_tac(@list.List([@realarith.real_lt_refl()])), @calc_rat.real_arith_tac]))
  let t2624 = @simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_univ(), @sets.not_in_empty(), @sets.in_elim_thm(), @sets.in_inter(), @sets.in_insert(), @sets.in_union()]))
  let t2623 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (h' : (_) -> Bool)) == {} && UNION((h : (_) -> Bool), h') == UNIV → !SUBSET((d : (_) -> Bool), h) → !(INTER(h', DIFF(d, s)) == {})")))
  let t2621 = @tactics.undisch_tac(@term_syntax.parse_term("!SUBSET(path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), {(x : Cart[Real, 2]) | real_of_num(0) <= op_dollar(x, 2)})"))
  let t2622 = @list.List([@tactics.undisch_tac(@term_syntax.parse_term("!SUBSET(path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), {(x : Cart[Real, 2]) | op_dollar(x, 2) <= real_of_num(0)})")), t2621])
  let t2626 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.extension(), @sets.in_inter(), @sets.in_elim_thm(), @sets.not_in_empty()])), @calc_rat.real_arith_tac), @tactics.all_tac])), @tactics.conj_tac), t2622), t2623), t2624), t2625)
  let t2617 = @sets.set_tac(@list.List([]))
  let t2616 = @tactics.match_mp_tac(@misc.hull_mono())
  let t2615 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull()]))
  let t2614 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (t : (_) -> Bool)) → SUBSET(DIFF(s, (f : (_) -> Bool)), t)")))
  let t2613 = @simp.rewrite_tac(@list.List([@topology.open_segment()]))
  let t2610 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((z : _), (s : (_) -> Bool)) → SUBSET(s, (t : (_) -> Bool)) → IN(z, t)")))
  let t2612 = @tactics.first_x_assum(fn(x2611 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2610(x2611))
  })
  let t2607 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("IN((z : _), (i : (_) -> Bool)) → IN(z, (c : (_) -> Bool)) → !SUBSET(c, DIFF((a : (_) -> Bool), i))")))
  let t2609 = @tactics.first_x_assum(fn(x2608 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2607(x2608))
  })
  let t2606 = @simp.rewrite_tac(@list.List([@topology.frontier()]))
  let t2618 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@convex.relative_frontier_nonempty_interior()])), t2606), t2609), t2612), t2613), t2614), t2615), t2616), t2617)
  let t2605 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2619 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@convex.relative_frontier_nonempty_interior()])), t2605)
  let t2620 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.collinear_3_2d()])), @calc_rat.real_arith_tac), t2619, t2618])
  let t2604 = @tactics.repeat_tac(@tactics.conj_tac)
  let t2603 = @simp.asm_rewrite_tac(@list.List([@class.not_imp(), @convex.convex_convex_hull()]))
  let t2599 = @term_syntax.parse_term("(w : Cart[Real, 2])")
  let t2600 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((b : Cart[Real, Unit]))")
  let t2601 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit]))")
  let t2602 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("hull(convex, path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))"), t2601, t2600, t2599]), @convex.segment_subset_relative_frontier_convex_gen()))
  let t2598 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < (x : Real) || x < real_of_num(0)) == !(x == real_of_num(0))"))]))
  let t2597 = @simp.rewrite_tac(@list.List([@sets.in_elim_thm(), @sets.in_union()]))
  let t2596 = @simp.rewrite_tac(@list.List([@class.de_morgan_thm()]))
  let t2595 = @tactics.x_gen_tac(@term_syntax.parse_term("(w : Cart[Real, 2])"))
  let t2627 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_diff(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty()])), t2595), t2596), @tactics.strip_tac), t2597), t2598), @tactics.disch_tac), t2602), t2603), t2604), t2620), t2626])
  let t2594 = @simp.rewrite_tac(@list.List([@topology.open_halfspace_component_lt(), @simp.rewrite_rule(@list.List([@realax.real_gt()]))(@topology.open_halfspace_component_gt())]))
  let t2592 = @term_syntax.parse_term("{(x : Cart[Real, 2]) | op_dollar(x, 2) < real_of_num(0)}")
  let t2593 = @tactics.map_every(fn(x2589 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2590 = @tactics.exists_tac(x2589)
    fn(x2591 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2590(x2591)
    }
  }, @list.List([@term_syntax.parse_term("{(x : Cart[Real, 2]) | real_of_num(0) < op_dollar(x, 2)}"), t2592]))
  let t2588 = @simp.asm_simp_tac(@list.List([@paths.arc_imp_simple_path(), @topology.connected()]))
  let t2587 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(d1 : (Cart[Real, Unit]) -> Cart[Real, 2])"), @paths.connected_simple_path_endless()))
  let t2585 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2584 = @simp.rewrite_tac(@list.List([@realax.real_gt(), @realarith.real_lt_le()]))
  let t2583 = @simp.rewrite_tac(@list.List([@topology.interior_halfspace_component_le(), @simp.rewrite_rule(@list.List([@realax.real_ge()]))(@topology.interior_halfspace_component_ge())]))
  let t2580 = @drule.match_mp(@topology.subset_interior())
  let t2582 = @tactics.disch_then(fn(x2581 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2577 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2578 = @tactics.mp_tac(x2577)
      fn(x2579 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2578(x2579)
      }
    })(t2580(x2581))
  })
  let t2576 = @simp.simp_tac(@list.List([@misc.hull_p(), @convex.convex_halfspace_component_le(), @simp.rewrite_rule(@list.List([@realax.real_ge()]))(@convex.convex_halfspace_component_ge())]))
  let t2575 = @simp.asm_rewrite_tac(@list.List([]))
  let t2573 = @drule.match_mp(@misc.hull_mono())
  let t2570 = @term_syntax.parse_term("(convex : ((Cart[Real, 2]) -> Bool) -> Bool)")
  let t2586 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.disch_then(fn(x2574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2572 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2567 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s2568 = @tactics.mp_tac(x2567)
        fn(x2569 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s2568(x2569)
        }
      })(((x2571 : @kernel.Thm) => @bool.spec(t2570, x2571))(x2572))
    })(t2573(x2574))
  })), t2575), t2576), t2582), t2583), t2584), t2585), @tactics.all_tac])
  let t2566 = @tactics.subgoal_then(@term_syntax.parse_term("!SUBSET(path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), {(x : Cart[Real, 2]) | real_of_num(0) <= op_dollar(x, 2)}) && !SUBSET(path_image(d1), {(x : Cart[Real, 2]) | op_dollar(x, 2) <= real_of_num(0)})"), @tactics.strip_assume_tac)
  let t2565 = @tactics.disch_then(fn(x2564 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2561 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2562 = @tactics.assume_tac(x2561)
      fn(x2563 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2562(x2563)
      }
    })(@bool.conjunct1(x2564))
  })
  let t2560 = @simp.asm_rewrite_tac(@list.List([@topology.segment_closed_open(), @sets.in_union()]))
  let t2557 = @term_syntax.parse_term("(z : Cart[Real, 2])")
  let t2558 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((b : Cart[Real, Unit]))")
  let t2559 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit]))"), t2558, t2557]), @degree.segment_horizontal()))
  let t2556 = @simp.rewrite_tac(@list.List([@sets.subset(), @topology.frontier(), @sets.in_diff()]))
  let t2553 = @tactics.undisch_then(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((b : Cart[Real, Unit])) == op_pct((gb : Real), basis(1))"), fn(x2552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2549 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2550 = @tactics.subst_all_tac(x2549)
      fn(x2551 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2550(x2551)
      }
    })(@equal.sym(x2552))
  })
  let t2554 = @tactics.then_tac(@tactics.undisch_then(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])) == vec(0)"), fn(x2548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2546 = @tactics.subst_all_tac(x2545)
      fn(x2547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2546(x2547)
      }
    })(@equal.sym(x2548))
  }), t2553)
  let t2544 = @simp.simp_tac(@list.List([@vectors.basis_component(), @cart.dimindex_2(), @calc_num.arith(), @calc_int.real_mul_rzero()]))
  let t2555 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@vectors.vec_component(), @vectors.vector_mul_component()])), t2544), t2554])
  let t2543 = @tactics.subgoal_then(@term_syntax.parse_term("op_dollar((g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])), 2) == real_of_num(0) && op_dollar(g((b : Cart[Real, Unit])), 2) == real_of_num(0)"), @tactics.strip_assume_tac)
  let t2542 = @tactics.repeat_tac(@tactics.strip_tac)
  let t2540 = @term_syntax.parse_term("(gb : Cart[Real, 2])")
  let t2539 = @determinants.geom_origin_tac(@term_syntax.parse_term("(ga : Cart[Real, 2])"))
  let t2538 = @tactics.repeat_tac(@tactics.pop_assum(fn(x2535 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2536 = @tactics.mp_tac(x2535)
    fn(x2537 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2536(x2537)
    }
  }))
  let t2534 = @simp.abbrev_tac(@term_syntax.parse_term("(gb : Cart[Real, 2]) == (g : (Cart[Real, Unit]) -> Cart[Real, 2])((b : Cart[Real, Unit]))"))
  let t2533 = @simp.abbrev_tac(@term_syntax.parse_term("(ga : Cart[Real, 2]) == (g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit]))"))
  let t2531 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2532 = @list.List([@tactics.disch_tac, @tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.frontier(), @sets.in_diff()]))), t2531)])
  let t2530 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t2529 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2528 = @simp.asm_simp_tac(@list.List([@topology.segment_closed_open(), @sets.in_union(), @sets.in_insert(), @sets.not_in_empty()]))
  let t2526 = @simp.asm_simp_tac(@list.List([@convex.convex_contains_segment_imp(), @convex.convex_closure(), @convex.convex_convex_hull()]))
  let t2527 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.frontier(), @sets.in_diff()]))), t2526), @tactics.all_tac])
  let t2525 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → IN(x, (t : (_) -> Bool)) && !(P : (_) -> Bool)(x)) == (SUBSET(s, t) && (∀ x : _, IN(x, s) → !P(x)))"))]))
  let t2628 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.subset(), @topology.frontier(), @sets.in_diff()])), t2525), @tactics.conj_tac), t2527), t2528), t2529), t2530), t2532), t2533), t2534), t2538), t2539), (x2541 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) => @determinants.geom_basis_multiple_tac(1L, t2540, x2541)), t2542), t2543), t2555), t2556), t2559), t2560), t2565), t2566), t2586), t2587), t2588), t2593), t2594), @tactics.conj_tac), t2627), @tactics.all_tac])
  let t2524 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(segment([((g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])), g((b : Cart[Real, Unit])))]), frontier(hull(convex, path_image(g))))"), fn(x2521 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2522 = @tactics.assume_tac(x2521)
    fn(x2523 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2522(x2523)
    }
  })
  let t2515 = @meson.asm_meson_tac(@list.List([@paths.arc_imp_path(), @paths.pathstart_in_path_image(), @paths.pathfinish_in_path_image()]))
  let t2516 = @tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()])), t2515)
  let t2514 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2513 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.open_closed_interval_1()])))
  let t2512 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("IMAGE((g : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))])) == path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))"))))
  let t2509 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("UNION((d : (_) -> Bool), (d' : (_) -> Bool)) == (g : (_) -> Bool) → SUBSET(INTER(g, (s : (_) -> Bool)), (a : (_) -> Bool)) → SUBSET(INTER(d, s), a)")))
  let t2511 = @tactics.first_x_assum(fn(x2510 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2509(x2510))
  })
  let t2508 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2517 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET(INTER((s : (_) -> Bool), (t : (_) -> Bool)), (a : (_) -> Bool)) && SUBSET(INTER(s, (u : (_) -> Bool)), a) → SUBSET(INTER(UNION(u, t), s), a)"))), @tactics.conj_tac), t2508), t2511), t2512), t2513), t2514), t2516])
  let t2506 = @term_syntax.parse_term("{(g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])), g((b : Cart[Real, Unit]))}")
  let t2507 = @tactics.trans_tac(@sets.subset_trans())(t2506)
  let t2505 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET(INTER((s : (_) -> Bool), (t : (_) -> Bool)), (u : (_) -> Bool)) → SUBSET(INTER(s, UNION(t, u)), u)")))
  let t2518 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_mono()), t2505), t2507), @tactics.conj_tac), t2517)
  let t2504 = @meson.meson_tac(@list.List([@sets.subset_trans(), @topology.closure_subset(), @misc.hull_subset()]))
  let t2503 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (c : (_) -> Bool)) → SUBSET(DIFF(s, INTER(s, DIFF(c, (i : (_) -> Bool)))), i)")))
  let t2502 = @simp.rewrite_tac(@list.List([@topology.frontier()]))
  let t2501 = @simp.asm_simp_tac(@list.List([@paths.compact_path_image(), @paths.simple_path_imp_path(), @sets.inter_subset()]))
  let t2500 = @tactics.match_mp_tac(@polytope.convex_hull_redundant_subset())
  let t2499 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → SUBSET(s, t)")))
  let t2519 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t2499), t2500), t2501), t2502), t2503), t2504), t2518])
  let t2497 = @term_syntax.parse_term("hull(convex, INTER(UNION(path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g1 : (Cart[Real, Unit]) -> Cart[Real, 2]))), UNION(path_image((d0 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])))))")
  let t2498 = @tactics.trans_tac(@sets.subset_trans())(t2497)
  let t2495 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2491 = @simp.basic_ss(@list.List([]))
  let t2494 = @tactics.asm_tac(fn(x2493 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2488 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2489 = @tactics.conv_tac(x2488)
      fn(x2490 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2489(x2490)
      }
    })(((x2492 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t2491, 5, x2492))(x2493))
  })(@list.List([@topology.frontier(), @topology.closure_closed(), @topology.compact_imp_closed(), @paths.compact_path_image(), @convex.compact_convex_hull(), @paths.simple_path_imp_path()]))
  let t2487 = @tactics.undisch_tac(@term_syntax.parse_term("path_image((d : (Cart[Real, Unit]) -> Cart[Real, 2])) == frontier(hull(convex, path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))"))
  let t2486 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t2496 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_minimal()), t2486), t2487), t2494), t2495), @tactics.all_tac])
  let t2520 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@sets.subset_antisym_eq())])), @tactics.conj_tac), t2496), t2498), @tactics.conj_tac), t2519), @tactics.all_tac])
  let t2485 = @tactics.subgoal_then(@term_syntax.parse_term("hull(convex, path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2]))) == hull(convex, path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))"), fn(x2482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2483 = @tactics.assume_tac(x2482)
    fn(x2484 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2483(x2484)
    }
  })
  let t2480 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2479 = @simp.asm_rewrite_tac(@list.List([@paths.arc_reversepath_eq(), @paths.pathstart_reversepath(), @paths.pathfinish_reversepath(), @paths.path_image_reversepath()]))
  let t2478 = @simp.asm_rewrite_tac(@list.List([]))
  let t2475 = @term_syntax.parse_term("reversepath((d0 : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t2476 = @tactics.map_every(fn(x2472 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2473 = @tactics.exists_tac(x2472)
    fn(x2474 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2473(x2474)
    }
  }, @list.List([@term_syntax.parse_term("reversepath((d1 : (Cart[Real, Unit]) -> Cart[Real, 2]))"), t2475]))
  let t2471 = @term_syntax.parse_term("(d1 : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t2477 = @list.List([@tactics.map_every(fn(x2468 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2469 = @tactics.exists_tac(x2468)
    fn(x2470 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2469(x2470)
    }
  }, @list.List([@term_syntax.parse_term("(d0 : (Cart[Real, Unit]) -> Cart[Real, 2])"), t2471])), t2476])
  let t2467 = @tactics.disch_then(@tactics.disj_cases_tac)
  let t2464 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(!(INTER((s : (_) -> Bool), UNION((t : (_) -> Bool), (u : (_) -> Bool))) == {}) → INTER(s, UNION((v : (_) -> Bool), (w : (_) -> Bool))) == {}) → INTER(s, t) == {} || INTER(s, v) == {}")))
  let t2466 = @tactics.disch_then(fn(x2465 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2461 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2462 = @tactics.mp_tac(x2461)
      fn(x2463 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2462(x2463)
      }
    })(t2464(x2465))
  })
  let t2459 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2458 = @simp.rewrite_tac(@list.List([@topology.frontier()]))
  let t2457 = @tactics.thenl(@tactics.ants_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(fn(x2454 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2455 = @tactics.subst1_tac(x2454)
    fn(x2456 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2455(x2456)
    }
  })]))
  let t2452 = @term_syntax.parse_term("(b : Cart[Real, Unit])")
  let t2453 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, Unit])"), t2452]), @topology.closed_open_interval_1()))
  let t2451 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("IMAGE((g : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))])) == path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))"))))
  let t2450 = @simp.asm_rewrite_tac(@list.List([]))
  let t2446 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("UNION((f : (_) -> Bool), (e : (_) -> Bool)) == (d : (_) -> Bool) → SUBSET(INTER(d, (g : (_) -> Bool)), (s : (_) -> Bool)) → SUBSET(INTER(e, g), s)")))
  let t2448 = @tactics.first_x_assum(fn(x2447 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2446(x2447))
  })
  let t2444 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("UNION((e : (_) -> Bool), (f : (_) -> Bool)) == (d : (_) -> Bool) → SUBSET(INTER(d, (g : (_) -> Bool)), (s : (_) -> Bool)) → SUBSET(INTER(e, g), s)")))
  let t2449 = @tactics.first(@list.List([@tactics.first_x_assum(fn(x2445 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2444(x2445))
  }), t2448]))
  let t2443 = @simp.asm_rewrite_tac(@list.List([@paths.arc_reversepath_eq(), @paths.path_image_reversepath()]))
  let t2442 = @simp.asm_rewrite_tac(@list.List([@paths.pathstart_reversepath(), @paths.pathfinish_reversepath()]))
  let t2441 = @tactics.match_mp_tac(@paths.simple_path_join_loop())
  let t2440 = @simp.asm_rewrite_tac(@list.List([@paths.pathfinish_join(), @paths.pathstart_join(), @paths.pathstart_reversepath(), @paths.pathfinish_reversepath()]))
  let t2439 = @tactics.thenl(@tactics.ants_tac, @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))]))
  let t2438 = @simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.path_image_reversepath(), @paths.pathstart_reversepath(), @paths.pathfinish_reversepath()]))
  let t2436 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("op_plus_plus(reversepath((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), reversepath((g0 : (Cart[Real, Unit]) -> Cart[Real, 2])))"), @paths.jordan_inside_outside()))
  let t2437 = @list.List([@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("op_plus_plus((d0 : (Cart[Real, Unit]) -> Cart[Real, 2]), reversepath((g0 : (Cart[Real, Unit]) -> Cart[Real, 2])))"), @paths.jordan_inside_outside())), t2436])
  let t2435 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (f : (_) -> Bool)) → SUBSET(s, UNION((t : (_) -> Bool), f))")))
  let t2434 = @simp.rewrite_tac(@list.List([@topology.closure_union_frontier()]))
  let t2433 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((p : (_) -> Bool), (c : (_) -> Bool)) → INTER(c, (i : (_) -> Bool)) == {} → !IN((z : _), INTER(i, p))")))
  let t2432 = @simp.asm_rewrite_tac(@list.List([]))
  let t2431 = @simp.once_rewrite_tac(@list.List([@sets.inter_comm()]))
  let t2427 = @simp.basic_ss(@list.List([]))
  let t2430 = @tactics.asm_tac(fn(x2429 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2424 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2425 = @tactics.conv_tac(x2424)
      fn(x2426 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2425(x2426)
      }
    })(((x2428 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t2427, 4, x2428))(x2429))
  })(@list.List([@paths.open_inside(), @topology.closed_union(), @paths.closed_path_image(), @paths.arc_imp_path()]))
  let t2421 = @term_syntax.parse_term("inside(UNION(path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))))")
  let t2422 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("inside(UNION(path_image((d0 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))))"), t2421]), @topology.open_inter_closure_eq_empty()))
  let t2420 = @term_syntax.parse_term("inside(UNION(path_image((d0 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))))")
  let t2423 = @list.List([@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("inside(UNION(path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))))"), t2420]), @topology.open_inter_closure_eq_empty())), t2422])
  let t2419 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t2416 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("INTER((i : (_) -> Bool), (j : (_) -> Bool)) == {} → !IN((z : _), INTER((s : (_) -> Bool), (t : (_) -> Bool))) && !IN(z, INTER(s, j)) && !IN(z, INTER(t, i)) → !(IN(z, UNION(s, i)) && IN(z, UNION(t, j)))")))
  let t2418 = @tactics.first_assum(fn(x2417 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2416(x2417))
  })
  let t2415 = @simp.rewrite_tac(@list.List([@sets.in_inter()]))
  let t2414 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2413 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm()]))
  let t2460 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INTER(INTER((s : (_) -> Bool), (t : (_) -> Bool)), INTER(s, (u : (_) -> Bool))) == {}) == (∀ x : _, IN(x, s) → !IN(x, INTER(t, u)))"))])), t2413), t2414), @tactics.strip_tac), t2415), t2418), t2419), @tactics.conj_tac), t2423), t2430), t2431), t2432), t2433), t2434), t2435), t2437), t2438), t2439), t2440), t2441), t2442), t2443), t2449), t2450), t2451), t2453), t2457), t2458), t2459), @tactics.all_tac])
  let t2411 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2410 = @tactics.match_mp_tac(@misc.hull_inc())
  let t2409 = @tactics.match_mp_tac(@topology.closure_inc())
  let t2408 = @simp.rewrite_tac(@list.List([@topology.frontier_union_interior()]))
  let t2407 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2404 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("UNION((i : (_) -> Bool), UNION((j : (_) -> Bool), (p : (_) -> Bool))) == (k : (_) -> Bool) → !IN((z : _), p) && IN(z, UNION((f : (_) -> Bool), k)) → IN(z, UNION(f, UNION(i, j)))")))
  let t2406 = @tactics.first_x_assum(fn(x2405 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2404(x2405))
  })
  let t2403 = @simp.asm_rewrite_tac(@list.List([]))
  let t2402 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("UNION(UNION((s : (_) -> Bool), (t : (_) -> Bool)), UNION((u : (_) -> Bool), (v : (_) -> Bool))) == UNION(UNION(s, u), UNION(t, v))"))]))
  let t2401 = @tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])"))
  let t2400 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.in_diff(), @sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm()]))
  let t2412 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), UNION((t : (_) -> Bool), (u : (_) -> Bool))) → SUBSET(s, UNION(INTER(s, t), INTER(s, u)))"))), t2400), t2401), @tactics.strip_tac), t2402), t2403), t2406), @tactics.conj_tac), t2407), t2408), t2409), t2410), t2411), @tactics.all_tac])
  let t2395 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2394 = @simp.rewrite_tac(@list.List([@topology.frontier()]))
  let t2393 = @tactics.thenl(@tactics.ants_tac, @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(fn(x2390 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2391 = @tactics.subst1_tac(x2390)
    fn(x2392 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2391(x2392)
    }
  })]))
  let t2388 = @term_syntax.parse_term("(b : Cart[Real, Unit])")
  let t2389 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, Unit])"), t2388]), @topology.closed_open_interval_1()))
  let t2387 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("IMAGE((g : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))])) == path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))"))))
  let t2386 = @simp.asm_rewrite_tac(@list.List([]))
  let t2382 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("UNION((f : (_) -> Bool), (e : (_) -> Bool)) == (d : (_) -> Bool) → SUBSET(INTER(d, (g : (_) -> Bool)), (s : (_) -> Bool)) → SUBSET(INTER(e, g), s)")))
  let t2384 = @tactics.first_x_assum(fn(x2383 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2382(x2383))
  })
  let t2380 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("UNION((e : (_) -> Bool), (f : (_) -> Bool)) == (d : (_) -> Bool) → SUBSET(INTER(d, (g : (_) -> Bool)), (s : (_) -> Bool)) → SUBSET(INTER(e, g), s)")))
  let t2385 = @tactics.first(@list.List([@tactics.first_x_assum(fn(x2381 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2380(x2381))
  }), t2384]))
  let t2379 = @simp.asm_rewrite_tac(@list.List([@paths.arc_reversepath_eq(), @paths.path_image_reversepath()]))
  let t2378 = @simp.asm_rewrite_tac(@list.List([@paths.pathstart_reversepath(), @paths.pathfinish_reversepath()]))
  let t2377 = @tactics.match_mp_tac(@paths.simple_path_join_loop())
  let t2376 = @simp.asm_rewrite_tac(@list.List([@paths.pathfinish_join(), @paths.pathstart_join(), @paths.pathstart_reversepath(), @paths.pathfinish_reversepath()]))
  let t2375 = @tactics.thenl(@tactics.ants_tac, @list.List([@tactics.all_tac, @sets.set_tac(@list.List([]))]))
  let t2374 = @simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.path_image_reversepath(), @paths.pathstart_reversepath(), @paths.pathfinish_reversepath()]))
  let t2372 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("op_plus_plus(reversepath((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), reversepath((g0 : (Cart[Real, Unit]) -> Cart[Real, 2])))"), @paths.jordan_inside_outside()))
  let t2373 = @list.List([@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("op_plus_plus((d0 : (Cart[Real, Unit]) -> Cart[Real, 2]), reversepath((g0 : (Cart[Real, Unit]) -> Cart[Real, 2])))"), @paths.jordan_inside_outside())), t2372])
  let t2371 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (_) -> Bool), (f : (_) -> Bool)) → SUBSET(s, UNION((t : (_) -> Bool), f))")))
  let t2370 = @simp.rewrite_tac(@list.List([@topology.closure_union_frontier()]))
  let t2369 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((p : (_) -> Bool), (c : (_) -> Bool)) → INTER(c, (i : (_) -> Bool)) == {} → !IN((z : _), INTER(i, p))")))
  let t2368 = @simp.asm_rewrite_tac(@list.List([]))
  let t2367 = @simp.once_rewrite_tac(@list.List([@sets.inter_comm()]))
  let t2363 = @simp.basic_ss(@list.List([]))
  let t2366 = @tactics.asm_tac(fn(x2365 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2360 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2361 = @tactics.conv_tac(x2360)
      fn(x2362 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2361(x2362)
      }
    })(((x2364 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t2363, 4, x2364))(x2365))
  })(@list.List([@paths.open_inside(), @topology.closed_union(), @paths.closed_path_image(), @paths.arc_imp_path()]))
  let t2357 = @term_syntax.parse_term("inside(UNION(path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))))")
  let t2358 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("inside(UNION(path_image((d0 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))))"), t2357]), @topology.open_inter_closure_eq_empty()))
  let t2356 = @term_syntax.parse_term("inside(UNION(path_image((d0 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))))")
  let t2359 = @list.List([@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("inside(UNION(path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))))"), t2356]), @topology.open_inter_closure_eq_empty())), t2358])
  let t2355 = @simp.asm_rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t2353 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("INTER((i : (_) -> Bool), (j : (_) -> Bool)) == {} → !IN((z : _), INTER((s : (_) -> Bool), (t : (_) -> Bool))) && !IN(z, INTER(s, j)) && !IN(z, INTER(t, i)) → !(IN(z, UNION(s, i)) && IN(z, UNION(t, j)))")))
  let t2396 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x2354 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2353(x2354))
  }), t2355), @tactics.conj_tac), t2359), t2366), t2367), t2368), t2369), t2370), t2371), t2373), t2374), t2375), t2376), t2377), t2378), t2379), t2385), t2386), t2387), t2389), t2393), t2394), t2395)
  let t2352 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2351 = @tactics.match_mp_tac(@misc.hull_inc())
  let t2350 = @tactics.match_mp_tac(@topology.closure_inc())
  let t2349 = @simp.rewrite_tac(@list.List([@topology.frontier_union_interior()]))
  let t2348 = @list.List([@tactics.asm_tac(@sets.set_tac)(@list.List([])), @tactics.all_tac])
  let t2345 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("UNION((i : (_) -> Bool), UNION((j : (_) -> Bool), (p : (_) -> Bool))) == (k : (_) -> Bool) → !IN((z : _), p) && IN(z, UNION((f : (_) -> Bool), k)) → IN(z, UNION(f, UNION(i, j)))")))
  let t2347 = @tactics.first_x_assum(fn(x2346 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2345(x2346))
  })
  let t2397 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(IN((z : _), UNION((s : (_) -> Bool), (t : (_) -> Bool))) || IN(z, UNION((u : (_) -> Bool), (v : (_) -> Bool)))) == IN(z, UNION(UNION(s, u), UNION(t, v)))"))])), t2347), @tactics.conj_tac), t2348), t2349), t2350), t2351), t2352), t2396])
  let t2344 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(p : Bool) == (q : Bool)) == ((p || q) && !(p && q))"))]))
  let t2343 = @simp.rewrite_tac(@list.List([@sets.in_diff(), @sets.in_insert(), @sets.not_in_empty(), @class.de_morgan_thm()]))
  let t2398 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(z : Cart[Real, 2])")), t2343), @tactics.strip_tac), t2344), @tactics.conj_tac), t2397)
  let t2342 = @list.List([@simp.once_rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("(!(p : Bool) == (q : Bool)) == (!q == p)"))])), @tactics.all_tac])
  let t2341 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → !IN(x, (u : (_) -> Bool)) == IN(x, (t : (_) -> Bool))) → DIFF(s, u) == INTER(s, t)")))
  let t2340 = @simp.asm_simp_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INTER((g0 : (_) -> Bool), (g1 : (_) -> Bool)) == {(a : _), (b : _)} → DIFF(DIFF(g1, {b, a}), UNION((i : (_) -> Bool), UNION((d1 : (_) -> Bool), g0))) == DIFF(DIFF(g1, {b, a}), UNION(d1, i))"))]))
  let t2337 = @tactics.disch_then(fn(x2335 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x2335
    @simp.rewrite_tac(@list.List([th_2]))
  })
  let t2338 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@paths.path_image_join(), @paths.path_image_reversepath(), @paths.pathstart_reversepath(), @paths.pathfinish_reversepath()])), t2337)
  let t2334 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2333 = @simp.rewrite_tac(@list.List([@topology.frontier()]))
  let t2332 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(fn(x2329 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2330 = @tactics.subst1_tac(x2329)
    fn(x2331 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2330(x2331)
    }
  })])
  let t2327 = @term_syntax.parse_term("(b : Cart[Real, Unit])")
  let t2328 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, Unit])"), t2327]), @topology.closed_open_interval_1()))
  let t2326 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("IMAGE((g : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))])) == path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))"))))
  let t2325 = @simp.asm_rewrite_tac(@list.List([]))
  let t2321 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("UNION((f : (_) -> Bool), (e : (_) -> Bool)) == (d : (_) -> Bool) → SUBSET(INTER(d, (g : (_) -> Bool)), (s : (_) -> Bool)) → SUBSET(INTER(e, g), s)")))
  let t2323 = @tactics.first_x_assum(fn(x2322 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2321(x2322))
  })
  let t2319 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("UNION((e : (_) -> Bool), (f : (_) -> Bool)) == (d : (_) -> Bool) → SUBSET(INTER(d, (g : (_) -> Bool)), (s : (_) -> Bool)) → SUBSET(INTER(e, g), s)")))
  let t2324 = @tactics.first(@list.List([@tactics.first_x_assum(fn(x2320 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2319(x2320))
  }), t2323]))
  let t2318 = @simp.asm_rewrite_tac(@list.List([@paths.arc_reversepath_eq(), @paths.path_image_reversepath()]))
  let t2317 = @simp.asm_rewrite_tac(@list.List([@paths.pathstart_reversepath(), @paths.pathfinish_reversepath()]))
  let t2316 = @tactics.match_mp_tac(@paths.simple_path_join_loop())
  let t2339 = @tactics.thenl(@tactics.ants_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@paths.pathfinish_join(), @paths.pathstart_join(), @paths.pathstart_reversepath(), @paths.pathfinish_reversepath()])), t2316), t2317), t2318), t2324), t2325), t2326), t2328), @tactics.ants_tac), t2332), t2333), t2334), t2338]))
  let t2314 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("op_plus_plus((d0 : (Cart[Real, Unit]) -> Cart[Real, 2]), reversepath((g0 : (Cart[Real, Unit]) -> Cart[Real, 2])))"), @paths.jordan_inside_outside()))
  let t2315 = @list.List([@tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("op_plus_plus(reversepath((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), reversepath((g0 : (Cart[Real, Unit]) -> Cart[Real, 2])))"), @paths.jordan_inside_outside())), t2314])
  let t2399 = @list.List([@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.closure_union_frontier()])), @tactics.conj_tac), t2315), t2339), t2340), t2341), t2342), t2398), @tactics.all_tac])
  let t2312 = @tactics.conjuncts_then(fn(x2309 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2310 = @tactics.subst1_tac(x2309)
    fn(x2311 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2310(x2311)
    }
  })
  let t2313 = @tactics.subgoal_then(@term_syntax.parse_term("DIFF(DIFF(path_image((g1 : (Cart[Real, Unit]) -> Cart[Real, 2])), {(g : (Cart[Real, Unit]) -> Cart[Real, 2])((b : Cart[Real, Unit])), g((a : Cart[Real, Unit]))}), closure(inside(UNION(path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2])))))) == INTER(DIFF(path_image(g1), {g(b), g(a)}), UNION(path_image((d0 : (Cart[Real, Unit]) -> Cart[Real, 2])), inside(UNION(path_image(d0), path_image(g0))))) && DIFF(DIFF(path_image(g1), {g(b), g(a)}), closure(inside(UNION(path_image(d0), path_image(g0))))) == INTER(DIFF(path_image(g1), {g(b), g(a)}), UNION(path_image(d1), inside(UNION(path_image(d1), path_image(g0)))))"), t2312)
  let t2307 = @simp.rewrite_tac(@list.List([@topology.closed_closure()]))
  let t2308 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.match_mp_tac(@topology.open_in_diff_closed())), t2307), @tactics.all_tac])
  let t2306 = @simp.gen_rewrite_tac(fn(x2303 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s2304 = @equal.land_conv(x2303)
    fn(x2305 : @kernel.Term) -> @kernel.Thm raise {
      s2304(x2305)
    }
  }, @list.List([@theorems.imp_imp()]))
  let t2302 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool)) == (p → !q)"))]))
  let t2297 = @term_syntax.parse_term("DIFF(DIFF(path_image((g1 : (Cart[Real, Unit]) -> Cart[Real, 2])), {(g : (Cart[Real, Unit]) -> Cart[Real, 2])((b : Cart[Real, Unit])), g((a : Cart[Real, Unit]))}), closure(inside(UNION(path_image((d0 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))))))")
  let t2298 = @list.List([@term_syntax.parse_term("DIFF(DIFF(path_image((g1 : (Cart[Real, Unit]) -> Cart[Real, 2])), {(g : (Cart[Real, Unit]) -> Cart[Real, 2])((b : Cart[Real, Unit])), g((a : Cart[Real, Unit]))}), closure(inside(UNION(path_image((d1 : (Cart[Real, Unit]) -> Cart[Real, 2])), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))))))"), t2297])
  let t2301 = @tactics.disch_then(fn(x2300 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2295 = @tactics.mp_tac(x2294)
      fn(x2296 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2295(x2296)
      }
    })(((x2299 : @kernel.Thm) => @bool.specl(t2298, x2299))(x2300))
  })
  let t2293 = @simp.rewrite_tac(@list.List([@topology.connected_open_in(), @class.not_exists_thm()]))
  let t2292 = @simp.asm_simp_tac(@list.List([@paths.arc_imp_simple_path()]))
  let t2291 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g1 : (Cart[Real, Unit]) -> Cart[Real, 2])"), @paths.connected_simple_path_endless()))
  let t2289 = @meson.asm_meson_tac(@list.List([@paths.pathstart_in_path_image(), @paths.pathfinish_in_path_image()]))
  let t2288 = @simp.rewrite_tac(@list.List([@topology.frontier(), @sets.set_rule(@term_syntax.parse_term("INTER(DIFF((s : (_) -> Bool), (t : (_) -> Bool)), t) == {}"))]))
  let t2287 = @simp.asm_rewrite_tac(@list.List([@topology.interval_ne_empty_1()]))
  let t2284 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET(IMAGE((g : (_) -> _), (i : (_) -> Bool)), (n : (_) -> Bool)) → IN(g((a : _)), (d0 : (_) -> Bool)) && IN(g((b : _)), d0) && IN(g(a), (d1 : (_) -> Bool)) && IN(g(b), d1) && !(i == {}) && INTER(UNION(d0, d1), n) == {} → INTER(d0, IMAGE(g, UNION(i, {a, b}))) == {g(a), g(b)} && INTER(d1, IMAGE(g, UNION(i, {a, b}))) == {g(a), g(b)} && !(INTER(IMAGE(g, UNION(i, {a, b})), n) == {})")))
  let t2286 = @tactics.first_x_assum(fn(x2285 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2284(x2285))
  })
  let t2283 = @list.List([@calc_rat.asm_real_arith_tac, @tactics.disch_then(fn(x2280 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2281 = @tactics.subst1_tac(x2280)
    fn(x2282 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2281(x2282)
    }
  })])
  let t2278 = @term_syntax.parse_term("(b : Cart[Real, Unit])")
  let t2279 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(a : Cart[Real, Unit])"), t2278]), @topology.closed_open_interval_1()))
  let t2277 = @tactics.subst1_tac(@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("IMAGE((g : (Cart[Real, Unit]) -> Cart[Real, 2]), interval([((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))])) == path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2]))"))))
  let t2290 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@paths.arc_imp_simple_path()])), t2277), t2279), @tactics.ants_tac), t2283), t2286), t2287), t2288), t2289), @tactics.strip_tac])
  let t2273 = @simp.basic_ss(@list.List([]))
  let t2276 = @tactics.asm_tac(fn(x2275 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2270 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2271 = @tactics.conv_tac(x2270)
      fn(x2272 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2271(x2272)
      }
    })(((x2274 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t2273, 4, x2274))(x2275))
  })(@list.List([@paths.inside_frontier_eq_interior(), @convex.convex_convex_hull(), @convex.bounded_convex_hull(), @paths.bounded_path_image(), @paths.simple_path_imp_path()]))
  let t2269 = @simp.asm_rewrite_tac(@list.List([@paths.path_image_reversepath(), @paths.simple_path_reversepath_eq(), @paths.pathstart_reversepath(), @paths.pathfinish_reversepath()]))
  let t2264 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((b : Cart[Real, Unit]))")
  let t2265 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit]))")
  let t2266 = @term_syntax.parse_term("(g0 : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t2267 = @term_syntax.parse_term("reversepath((d1 : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t2268 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(d0 : (Cart[Real, Unit]) -> Cart[Real, 2])"), t2267, t2266, t2265, t2264]), @moretop.split_inside_simple_closed_curve()))
  let t2262 = @term_syntax.parse_term("(d1 : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t2263 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(d0 : (Cart[Real, Unit]) -> Cart[Real, 2])"), t2262]))
  let t2261 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t2260 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t2258 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((b : Cart[Real, Unit]))")
  let t2259 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit]))")
  let t2481 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(d : (Cart[Real, Unit]) -> Cart[Real, 2])"), t2259, t2258]), @paths.exists_double_arc())), @tactics.ants_tac), t2260), t2261), t2263), @tactics.strip_tac), t2268), t2269), t2276), @tactics.ants_tac), t2290), t2291), t2292), t2293), t2301), t2302), t2306), @tactics.ants_tac), t2308), t2313), t2399), @tactics.ants_tac), t2412), @tactics.ants_tac), t2460), t2466), t2467), t2477), t2478), t2479), t2480), @tactics.all_tac])
  let t2257 = @tactics.subgoal_then(@term_syntax.parse_term("∃ d0 : (Cart[Real, Unit]) -> Cart[Real, 2], ∃ d1 : (Cart[Real, Unit]) -> Cart[Real, 2], arc(d0) && arc(d1) && pathstart(d0) == (g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])) && pathfinish(d0) == g((b : Cart[Real, Unit])) && pathstart(d1) == g(b) && pathfinish(d1) == g(a) && INTER(path_image(d0), path_image(d1)) == {g(a), g(b)} && UNION(path_image(d0), path_image(d1)) == path_image((d : (Cart[Real, Unit]) -> Cart[Real, 2])) && INTER(inside(UNION(path_image(d0), path_image((g0 : (Cart[Real, Unit]) -> Cart[Real, 2])))), inside(UNION(path_image(d1), path_image(g0)))) == {} && UNION(inside(UNION(path_image(d0), path_image(g0))), UNION(inside(UNION(path_image(d1), path_image(g0))), DIFF(path_image(g0), {g(a), g(b)}))) == interior(hull(convex, path_image(g))) && INTER(DIFF(path_image((g1 : (Cart[Real, Unit]) -> Cart[Real, 2])), {g(b), g(a)}), path_image(d0)) == {}"), @tactics.strip_assume_tac)
  let t2255 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : (Cart[Real, Unit]) -> Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t2254 = @meson.asm_meson_tac(@list.List([@convex.aff_dim_nonempty_interior(), @cart.dimindex_2()]))
  let t2256 = @list.List([@tactics.then_tac(@simp.asm_simp_tac(@list.List([@convex.convex_convex_hull(), @convex.bounded_convex_hull(), @paths.bounded_path_image(), @paths.simple_path_imp_path()])), t2254), t2255])
  let t2253 = @simp.asm_simp_tac(@list.List([@convex.relative_frontier_nonempty_interior()]))
  let t2252 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("hull(convex, path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))"), @cauchy.rectifiable_loop_relative_frontier_convex()))
  let t2251 = @tactics.disch_then(fn(x2248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x2248
    let t2250 = @tactics.assume_tac(th_1)
    @tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([th_1]))), t2250)
  })
  let t2247 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2246 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2243 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2244 = @tactics.mp_tac(x2243)
      fn(x2245 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2244(x2245)
      }
    })(@equal.sym(x2246))
  }, @tactics.strip_assume_tac))
  let t2242 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x2238 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2235 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s2236 = @tactics.assume_tac(x2235)
      fn(x2237 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s2236(x2237)
      }
    })(@equal.sym(x2238))
  }, fn(x2239 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2240 = @tactics.mp_tac(x2239)
    fn(x2241 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2240(x2241)
    }
  }))
  let t2234 = @tactics.replicate_tac(6, @tactics.disch_then(@tactics.conjuncts_then2(fn(x2228 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2229 = @tactics.assume_tac(x2228)
    fn(x2230 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2229(x2230)
    }
  }, fn(x2231 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2232 = @tactics.mp_tac(x2231)
    fn(x2233 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2232(x2233)
    }
  })))
  let t2226 = @term_syntax.parse_term("(g1 : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t2227 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(g0 : (Cart[Real, Unit]) -> Cart[Real, 2])"), t2226]))
  let t2225 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le(), @theorems.left_imp_exists_thm()]))
  let t2222 = @term_syntax.parse_term("(b : Cart[Real, Unit])")
  let t2223 = @term_syntax.parse_term("(a : Cart[Real, Unit])")
  let t2224 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), t2223, t2222]), @paths.exists_double_arc_explicit()))
  let t2218 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@paths.path_image())]))
  let t2217 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET(IMAGE((f : (_) -> _), (t : (_) -> Bool)), (u : (_) -> Bool)) → SUBSET(DIFF(IMAGE(f, (s : (_) -> Bool)), IMAGE(f, DIFF(s, t))), u)")))
  let t2216 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t2215 = @simp.rewrite_tac(@list.List([@paths.path_image()]))
  let t2214 = @simp.asm_simp_tac(@list.List([@paths.compact_path_image(), @paths.simple_path_imp_path()]))
  let t2213 = @tactics.match_mp_tac(@polytope.convex_hull_redundant_subset())
  let t2219 = @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conv_tac(@equal.sym_conv), t2213), t2214), t2215), @tactics.conj_tac), t2216), t2217), t2218)
  let t2212 = @simp.asm_rewrite_tac(@list.List([@sets.in_diff(), @vectors.ends_in_interval()]))
  let t2211 = @tactics.match_mp_tac(@sets.fun_in_image())
  let t2210 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @sets.empty_subset()]))
  let t2209 = @tactics.match_mp_tac(@misc.hull_mono())
  let t2208 = @simp.rewrite_tac(@list.List([@convex.segment_convex_hull()]))
  let t2207 = @simp.rewrite_tac(@list.List([@sets.union_subset(), @misc.hull_subset()]))
  let t2206 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t2205 = @tactics.match_mp_tac(@misc.hull_minimal())
  let t2204 = @simp.simp_tac(@list.List([@misc.hull_mono(), @sets.subset_union()]))
  let t2220 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.subset_antisym()), t2204), t2205), t2206), t2207), t2208), t2209), t2210), @tactics.conj_tac), t2211), t2212), t2219])
  let t2221 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(c : _) == (b : _) && b == (a : _) → b == a && c == a"))), @tactics.conj_tac), t2220), @tactics.all_tac])
  let t2203 = @tactics.subgoal_then(@term_syntax.parse_term("hull(convex, IMAGE((g : (Cart[Real, Unit]) -> Cart[Real, 2]), DIFF(interval([(vec(0), vec(1))]), interval(((a : Cart[Real, Unit]), (b : Cart[Real, Unit])))))) == hull(convex, path_image(g)) && hull(convex, UNION(segment([(g(a), g(b))]), IMAGE(g, DIFF(interval([(vec(0), vec(1))]), interval((a, b)))))) == hull(convex, path_image(g))"), @tactics.strip_assume_tac)
  let t2201 = @sets.set_tac(@list.List([]))
  let t2200 = @simp.asm_rewrite_tac(@list.List([@paths.path_image(), @topology.open_closed_interval_1()]))
  let t2197 = @drule.match_mp(@simp.rewrite_rule(@list.List([@theorems.imp_conj_alt()]))(@sets.subset_trans()))
  let t2199 = @tactics.first_x_assum(fn(x2198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2197(x2198))
  })
  let t2195 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2196 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@paths.path_image()])), t2195), @tactics.all_tac])
  let t2194 = @simp.asm_simp_tac(@list.List([@paths.compact_path_image(), @paths.simple_path_imp_path()]))
  let t2193 = @tactics.match_mp_tac(@polytope.convex_hull_redundant_subset())
  let t2192 = @tactics.subgoal_then(@term_syntax.parse_term("hull(convex, path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))) == hull(convex, IMAGE(g, {(a : Cart[Real, Unit]), (b : Cart[Real, Unit])}))"), fn(x2190 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x2190
    @simp.rewrite_tac(@list.List([th, @sets.image_clauses(), @equal.gsym(@convex.segment_convex_hull()), @convex.interior_segment(), @cart.dimindex_2(), @arith.le_refl()]))
  })
  let t2189 = @tactics.undisch_tac(@term_syntax.parse_term("!(interior(hull(convex, path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))) == {})"))
  let t2188 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t2187 = @simp.asm_rewrite_tac(@list.List([@vectors.drop_vec(), @realarith.real_lt_refl()]))
  let t2186 = @tactics.undisch_tac(@term_syntax.parse_term("drop((a : Cart[Real, Unit])) < drop((b : Cart[Real, Unit]))"))
  let t2185 = @simp.asm_rewrite_tac(@list.List([]))
  let t2183 = @simp.rewrite_rule(@list.List([@paths.simple_path()]))
  let t2178 = @term_syntax.parse_term("(b : Cart[Real, Unit])")
  let t2179 = @list.List([@term_syntax.parse_term("(a : Cart[Real, Unit])"), t2178])
  let t2202 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_assum(fn(x2184 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x2182 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x2181 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x2175 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          let s2176 = @tactics.mp_tac(x2175)
          fn(x2177 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
            s2176(x2177)
          }
        })(((x2180 : @kernel.Thm) => @bool.specl(t2179, x2180))(x2181))
      })(@bool.conjunct2(x2182))
    })(t2183(x2184))
  }), t2185), @tactics.strip_tac), t2186), t2187), t2188), t2189), t2192), t2193), t2194), @tactics.conj_tac), t2196), t2199), t2200), t2201), @tactics.all_tac])
  let t2174 = @class.asm_cases_tac(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((a : Cart[Real, Unit])) == g((b : Cart[Real, Unit]))"))
  let t2172 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t2173 = @list.List([@tactics.then_tac(@tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@equal.gsym(@topology.interval_ne_empty_1())]))), t2172), @tactics.all_tac])
  let t2171 = @tactics.subgoal_then(@term_syntax.parse_term("!(interior(hull(convex, path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])))) == {})"), fn(x2168 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2169 = @tactics.assume_tac(x2168)
    fn(x2170 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2169(x2170)
    }
  })
  let t2166 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.in_interval_1(), @vectors.drop_vec()])))
  let t2165 = @simp.rewrite_tac(@list.List([@topology.subset_interval_1(), @vectors.drop_vec()]))
  let t2164 = @tactics.match_mp_tac(@sets.image_subset())
  let t2163 = @simp.rewrite_tac(@list.List([@misc.hull_subset()]))
  let t2162 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (Cart[Real, _]) -> Bool), hull(convex, s)) && SUBSET((t : (Cart[Real, _]) -> Bool), s) → SUBSET(t, hull(convex, s))")))
  let t2161 = @simp.rewrite_tac(@list.List([@topology.closure_subset(), @paths.path_image()]))
  let t2160 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((s : (Cart[Real, _]) -> Bool), closure(s)) && SUBSET((u : (Cart[Real, _]) -> Bool), s) → SUBSET(u, UNION(DIFF(closure(s), interior(s)), interior(s)))")))
  let t2159 = @simp.rewrite_tac(@list.List([@topology.frontier(), @equal.gsym(@paths.path_image())]))
  let t2157 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("INTER((s : (_) -> Bool), (f : (_) -> Bool)) == {} → SUBSET(s, UNION(f, (i : (_) -> Bool))) → SUBSET(s, i)")))
  let t2167 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x2158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t2157(x2158))
  }), t2159), t2160), t2161), t2162), t2163), t2164), t2165), t2166), @calc_rat.asm_real_arith_tac), @tactics.all_tac])
  let t2156 = @tactics.subgoal_then(@term_syntax.parse_term("SUBSET(IMAGE((g : (Cart[Real, Unit]) -> Cart[Real, 2]), interval(((a : Cart[Real, Unit]), (b : Cart[Real, Unit])))), interior(hull(convex, path_image(g))))"), fn(x2153 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2154 = @tactics.assume_tac(x2153)
    fn(x2155 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2154(x2155)
    }
  })
  let t2152 = @list.List([@meson.asm_meson_tac(@list.List([@topology.interval_ne_empty_1()])), @tactics.all_tac])
  let t2151 = @class.asm_cases_tac(@term_syntax.parse_term("interval(((a : Cart[Real, Unit]), (b : Cart[Real, Unit]))) == {}"))
  let t2984 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2151), t2152), t2156), t2167), t2171), t2173), t2174), t2202), t2203), t2221), t2224), t2225), t2227), t2234), t2242), t2247), t2251), t2252), t2253), @tactics.ants_tac), t2256), t2257), t2481), t2485), t2520), t2524), t2628), t2632), t2636), @tactics.strip_tac), t2644), t2648), t2651), t2652), t2653), t2657), t2663), t2667), t2687), t2688), t2690), t2694), t2698), t2699), t2700), t2701), @tactics.conj_tac), t2703), t2704), t2705), t2706), @tactics.conj_tac), t2708), @tactics.conj_tac), t2763), t2767), t2768), t2769), @tactics.conj_tac), t2815), @tactics.conj_tac), t2954), t2955), @tactics.conj_tac), t2983)
  step_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], ∀ a : Cart[Real, Unit], ∀ b : Cart[Real, Unit], ∀ L : Real, simple_path(g) && pathfinish(g) == pathstart(g) && (∀ x : Cart[Real, Unit], ∀ y : Cart[Real, Unit], IN(x, interval([(vec(0), vec(1))])) && IN(y, interval([(vec(0), vec(1))])) → distance((g(x), g(y))) <= L * distance((x, y))) && drop(a) < drop(b) && IN(a, interval([(vec(0), vec(1))])) && IN(b, interval([(vec(0), vec(1))])) && IN(g(a), frontier(hull(convex, path_image(g)))) && IN(g(b), frontier(hull(convex, path_image(g)))) && INTER(IMAGE(g, interval((a, b))), frontier(hull(convex, path_image(g)))) == {} → (∃ h : (Cart[Real, Unit]) -> Cart[Real, 2], simple_path(h) && pathstart(h) == pathstart(g) && pathfinish(h) == pathstart(g) && (∀ x : Cart[Real, Unit], ∀ y : Cart[Real, Unit], IN(x, interval([(vec(0), vec(1))])) && IN(y, interval([(vec(0), vec(1))])) → distance((h(x), h(y))) <= L * distance((x, y))) && path_length(h) < path_length(g) && hull(convex, path_image(h)) == hull(convex, path_image(g)) && (∀ x : Cart[Real, Unit], !IN(x, interval((a, b))) → h(x) == g(x)) && SUBSET(IMAGE(h, interval([(a, b)])), frontier(hull(convex, path_image(g)))))"), t2984))
}

///|
let step_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_LEMMA")

///|
/// `STEP_LEMMA`
pub fn step_lemma() -> @kernel.Thm {
  step_lemma_c.get()
}

///|
/// ISOPERIMETRIC_CONVEXIFICATION
fn step_10() -> Unit raise {
  let t3689 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3688 = @simp.rewrite_tac(@list.List([@sets.unions_gspec()]))
  let t3687 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3686 = @tactics.disch_then(fn(x3685 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3682 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3683 = @tactics.subst1_tac(x3682)
      fn(x3684 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3683(x3684)
      }
    })(@equal.sym(x3685))
  })
  let t3681 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t3677 = @term_syntax.parse_term("(n : Num)")
  let t3680 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x3679 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3674 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3675 = @tactics.mp_tac(x3674)
      fn(x3676 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3675(x3676)
      }
    })(((x3678 : @kernel.Thm) => @bool.spec(t3677, x3678))(x3679))
  }))
  let t3673 = @simp.asm_rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3669 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t3672 = @tactics.remove_then("*", fn(x3671 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3666 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3667 = @tactics.mp_tac(x3666)
      fn(x3668 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3667(x3668)
      }
    })(((x3670 : @kernel.Thm) => @bool.spec(t3669, x3670))(x3671))
  })
  let t3665 = @simp.simp_tac(@list.List([@sets.unions_gspec(), @sets.in_diff(), @class.not_exists_thm(), @sets.in_elim_thm(), @sets.in_univ()]))
  let t3664 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t3663 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, DIFF((k : (_) -> Bool), (j : (_) -> Bool))) → (h : (_) -> _)(x) == (g : (_) -> _)(x)) → SUBSET(IMAGE(g, DIFF(k, j)), IMAGE(h, k))")))
  let t3662 = @simp.rewrite_tac(@list.List([@paths.path_image()]))
  let t3690 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_mono()), t3662), t3663), t3664), t3665), @tactics.strip_tac), t3672), t3673), t3680), t3681), t3686), t3687), t3688), t3689)
  let t3661 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3659 = @equal.gsym(@paths.path_image())
  let t3660 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.unions_components()), t3659]))
  let t3658 = @tactics.first_assum(fn(x3645 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_11 = x3645
    @simp.gen_rewrite_tac(fn(x3657 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x3653 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x3647 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s3648 = @equal.land_conv(x3647)
          fn(x3649 : @kernel.Term) -> @kernel.Thm raise {
            s3648(x3649)
          }
        })((fn(x3650 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s3651 = @equal.rand_conv(x3650)
          fn(x3652 : @kernel.Term) -> @kernel.Thm raise {
            s3651(x3652)
          }
        })(x3653))
      })((fn(x3654 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s3655 = @equal.rand_conv(x3654)
        fn(x3656 : @kernel.Term) -> @kernel.Thm raise {
          s3655(x3656)
        }
      })(x3657))
    }, @list.List([@equal.sym(th_11)]))
  })
  let t3644 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x3638 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3639 = @tactics.assume_tac(x3638)
    fn(x3640 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3639(x3640)
    }
  }, fn(x3641 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3642 = @tactics.mp_tac(x3641)
    fn(x3643 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3642(x3643)
    }
  }))
  let t3637 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t3636 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (k : (_) -> Bool)) && IN(x, (j : (_) -> Bool)) → !IN((g : (_) -> _)(x), (t : (_) -> Bool))) → DISJOINT(DIFF(IMAGE(g, k), IMAGE(g, DIFF(k, j))), t)")))
  let t3635 = @simp.rewrite_tac(@list.List([@misc.hull_subset()]))
  let t3634 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((p : (_) -> Bool), (c : (_) -> Bool)) && DISJOINT(DIFF(p, (q : (_) -> Bool)), (f : (_) -> Bool)) → SUBSET(DIFF(p, q), DIFF(c, f))")))
  let t3633 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.set_diff_frontier())]))
  let t3632 = @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac])
  let t3631 = @simp.rewrite_tac(@list.List([@paths.path_image()]))
  let t3630 = @simp.asm_simp_tac(@list.List([@paths.compact_path_image(), @paths.simple_path_imp_path()]))
  let t3629 = @tactics.match_mp_tac(@polytope.convex_hull_redundant_subset())
  let t3691 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(s : (_) -> Bool) == (t : (_) -> Bool) → SUBSET(s, t)"))), t3629), t3630), t3631), @tactics.conj_tac), t3632), t3633), t3634), t3635), t3636), t3637), t3644), t3658), t3660), t3661), t3690])
  let t3627 = @term_syntax.parse_term("hull(convex, IMAGE((g : (Cart[Real, Unit]) -> Cart[Real, 2]), DIFF(interval([(vec(0), vec(1))]), UNIONS({interval(((a : (Num) -> Cart[Real, Unit])((n : Num)), (b : (Num) -> Cart[Real, Unit])(n))) | IN(n, UNIV)}))))")
  let t3628 = @tactics.trans_tac(@sets.subset_trans())(t3627)
  let t3625 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3624 = @simp.rewrite_tac(@list.List([@paths.path_image()]))
  let t3623 = @tactics.match_mp_tac(@misc.hull_inc())
  let t3622 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t3621 = @tactics.subgoal_then(@term_syntax.parse_term("hull(convex, path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))) == hull(convex, path_image((f : (Num, Cart[Real, Unit]) -> Cart[Real, 2])((n : Num))))"), fn(x3618 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3619 = @tactics.subst1_tac(x3618)
    fn(x3620 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3619(x3620)
    }
  })
  let t3617 = @tactics.disch_then(fn(x3616 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3613 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3614 = @tactics.subst1_tac(x3613)
      fn(x3615 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3614(x3615)
      }
    })(@equal.sym(x3616))
  })
  let t3612 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t3608 = @term_syntax.parse_term("(n : Num)")
  let t3611 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x3610 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3605 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3606 = @tactics.mp_tac(x3605)
      fn(x3607 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3606(x3607)
      }
    })(((x3609 : @kernel.Thm) => @bool.spec(t3608, x3609))(x3610))
  }))
  let t3604 = @simp.asm_rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3600 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t3603 = @tactics.remove_then("*", fn(x3602 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3597 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3598 = @tactics.mp_tac(x3597)
      fn(x3599 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3598(x3599)
      }
    })(((x3601 : @kernel.Thm) => @bool.spec(t3600, x3601))(x3602))
  })
  let t3596 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t3595 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image()]))
  let t3594 = @simp.gen_rewrite_tac(fn(x3591 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3592 = @equal.land_conv(x3591)
    fn(x3593 : @kernel.Term) -> @kernel.Thm raise {
      s3592(x3593)
    }
  }, @list.List([@paths.path_image()]))
  let t3590 = @simp.rewrite_tac(@list.List([@convex.convex_convex_hull()]))
  let t3626 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@misc.hull_minimal()), t3590), t3594), t3595), t3596), @tactics.disch_tac), t3603), t3604), t3611), t3612), t3617), t3621), t3622), t3623), t3624), t3625), @tactics.all_tac])
  let t3589 = @tactics.match_mp_tac(@sets.subset_antisym())
  let t3583 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3582 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@topology.unions_components())]))
  let t3580 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(c : ((_) -> Bool) -> Bool) == {(k : (Num, _) -> Bool)((n : Num)) | IN(n, UNIV)} → !(∃ n : Num, IN((x : _), k(n))) && (!IN((g : (_) -> _)(x), (t : (_) -> Bool)) → IN(x, UNIONS(c))) → IN(g(x), t)")))
  let t3584 = @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x3581 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3580(x3581))
  }), t3582), t3583)
  let t3579 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3578 = @simp.rewrite_tac(@list.List([@sets.unions_gspec()]))
  let t3585 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(@tactics.match_mp_tac), t3578), t3579), t3584])
  let t3577 = @tactics.subgoal_then(@term_syntax.parse_term("(f : (Num, Cart[Real, Unit]) -> Cart[Real, 2])((n : Num), (x : Cart[Real, Unit])) == (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x)"), fn(x3574 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3575 = @tactics.subst1_tac(x3574)
    fn(x3576 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3575(x3576)
    }
  })
  let t3573 = @tactics.disch_then(fn(x3572 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3569 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3570 = @tactics.subst1_tac(x3569)
      fn(x3571 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3570(x3571)
      }
    })(@equal.sym(x3572))
  })
  let t3568 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t3564 = @term_syntax.parse_term("(n : Num)")
  let t3567 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x3566 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3561 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3562 = @tactics.mp_tac(x3561)
      fn(x3563 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3562(x3563)
      }
    })(((x3565 : @kernel.Thm) => @bool.spec(t3564, x3565))(x3566))
  }))
  let t3560 = @simp.asm_rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3557 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t3586 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("*", fn(x3559 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3554 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3555 = @tactics.mp_tac(x3554)
      fn(x3556 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3555(x3556)
      }
    })(((x3558 : @kernel.Thm) => @bool.spec(t3557, x3558))(x3559))
  }), t3560), t3567), t3568), t3573), t3577), t3585)
  let t3553 = @simp.asm_rewrite_tac(@list.List([]))
  let t3552 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num)"))
  let t3551 = @simp.rewrite_tac(@list.List([@sets.unions_gspec(), @sets.in_elim_thm()]))
  let t3550 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3549 = @tactics.disch_then(fn(x3548 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3545 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3546 = @tactics.subst1_tac(x3545)
      fn(x3547 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3546(x3547)
      }
    })(@equal.sym(x3548))
  })
  let t3544 = @simp.rewrite_tac(@list.List([@arith.le_add()]))
  let t3540 = @term_syntax.parse_term("(N : Num) + SUC((n : Num))")
  let t3543 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(N : Num)"))(fn(x3542 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3537 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3538 = @tactics.mp_tac(x3537)
      fn(x3539 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3538(x3539)
      }
    })(((x3541 : @kernel.Thm) => @bool.spec(t3540, x3541))(x3542))
  }))
  let t3536 = @simp.asm_rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3532 = @term_syntax.parse_term("(x : Cart[Real, Unit])")
  let t3535 = @tactics.remove_then("*", fn(x3534 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3530 = @tactics.mp_tac(x3529)
      fn(x3531 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3530(x3531)
      }
    })(((x3533 : @kernel.Thm) => @bool.spec(t3532, x3533))(x3534))
  })
  let t3527 = @term_syntax.parse_term("(n : Num)")
  let t3587 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum((x3528 : @kernel.Thm) => @tactics.x_choose_tac(t3527, x3528)), t3535), t3536), t3543), t3544), t3549), t3550), t3551), t3552), t3553), @int.arith_tac), t3586])
  let t3526 = @class.asm_cases_tac(@term_syntax.parse_term("∃ n : Num, IN((x : Cart[Real, Unit]), interval(((a : (Num) -> Cart[Real, Unit])(n), (b : (Num) -> Cart[Real, Unit])(n))))"))
  let t3525 = @tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])"))
  let t3524 = @simp.rewrite_tac(@list.List([@sets.subset(), @sets.forall_in_image()]))
  let t3523 = @simp.gen_rewrite_tac(fn(x3520 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3521 = @equal.land_conv(x3520)
    fn(x3522 : @kernel.Term) -> @kernel.Thm raise {
      s3521(x3522)
    }
  }, @list.List([@paths.path_image()]))
  let t3519 = @simp.asm_rewrite_tac(@list.List([]))
  let t3518 = @tactics.match_mp_tac(lemma3())
  let t3517 = @tactics.conv_tac(@equal.sym_conv)
  let t3588 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x3514 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_10 = x3514
    let t3516 = @tactics.assume_tac(th_10)
    @tactics.then_tac(@tactics.subst1_tac(@equal.sym(th_10)), t3516)
  }), t3517), t3518), t3519), t3523), t3524), t3525), @tactics.disch_tac), t3526), t3587), @tactics.all_tac])
  let t3513 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool)) && p → p && q")))
  let t3511 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@vectors.dist())]))
  let t3510 = @tactics.match_mp_tac(@integration.path_length_lipschitz())
  let t3512 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t3510), t3511), @tactics.disch_tac])
  let t3509 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t3507 = @meson.asm_meson_tac(@list.List([@paths.pathstart(), @paths.pathfinish()]))
  let t3506 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t3502 = @term_syntax.parse_term("(n : Num)")
  let t3505 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x3504 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3499 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3500 = @tactics.mp_tac(x3499)
      fn(x3501 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3500(x3501)
      }
    })(((x3503 : @kernel.Thm) => @bool.spec(t3502, x3503))(x3504))
  }))
  let t3498 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3497 = @simp.rewrite_tac(@list.List([@vectors.ends_in_unit_interval(), @theorems.imp_imp(), @equal.gsym(@metric.eventually_and())]))
  let t3508 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.remove_then("*", fn(x3494 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_9 = x3494
    let t3496 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(1)"), th_9))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(vec : (Num) -> Cart[Real, Unit])(0)"), th_9)), t3496)
  }), t3497), t3498), t3505), t3506), t3507), @tactics.disch_tac])
  let t3493 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t3491 = @meson.asm_meson_tac(@list.List([]))
  let t3490 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@paths.simple_path()])))
  let t3489 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t3485 = @term_syntax.parse_term("(n : Num)")
  let t3488 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x3487 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3482 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3483 = @tactics.mp_tac(x3482)
      fn(x3484 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3483(x3484)
      }
    })(((x3486 : @kernel.Thm) => @bool.spec(t3485, x3486))(x3487))
  }))
  let t3481 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3480 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@metric.eventually_and())]))
  let t3479 = @tactics.remove_then("*", fn(x3476 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_8 = x3476
    let t3478 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Cart[Real, Unit])"), th_8))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(y : Cart[Real, Unit])"), th_8)), t3478)
  })
  let t3474 = @term_syntax.parse_term("(y : Cart[Real, Unit])")
  let t3475 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Cart[Real, Unit])"), t3474]))
  let t3492 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_simp_tac(@list.List([@paths.simple_path(), @integration.rectifiable_path_imp_path()])), t3475), @tactics.strip_tac), t3479), t3480), t3481), t3488), t3489), t3490), t3491), @tactics.disch_tac])
  let t3473 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t3471 = @meson.asm_meson_tac(@list.List([]))
  let t3470 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist())]))
  let t3472 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.lipschitz_imp_rectifiable_path()), t3470), t3471), @tactics.disch_tac])
  let t3469 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(p : Bool) && (p → (q : Bool)) → p && q")))
  let t3467 = @meson.asm_meson_tac(@list.List([]))
  let t3466 = @simp.rewrite_tac(@list.List([@arith.le_refl()]))
  let t3462 = @term_syntax.parse_term("(n : Num)")
  let t3465 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(fn(x3464 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3459 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3460 = @tactics.mp_tac(x3459)
      fn(x3461 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3460(x3461)
      }
    })(((x3463 : @kernel.Thm) => @bool.spec(t3462, x3463))(x3464))
  }))
  let t3458 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3457 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp(), @equal.gsym(@metric.eventually_and())]))
  let t3456 = @tactics.remove_then("*", fn(x3453 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_7 = x3453
    let t3455 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Cart[Real, Unit])"), th_7))
    @tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(y : Cart[Real, Unit])"), th_7)), t3455)
  })
  let t3468 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t3456), t3457), t3458), t3465), t3466), t3467), @tactics.all_tac])
  let t3452 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Unit], ∀ y : Cart[Real, Unit], IN(x, interval([(vec(0), vec(1))])) && IN(y, interval([(vec(0), vec(1))])) → distance(((h : (Cart[Real, Unit]) -> Cart[Real, 2])(x), h(y))) <= (L : Real) * distance((x, y))"), fn(x3449 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3450 = @tactics.assume_tac(x3449)
    fn(x3451 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3450(x3451)
    }
  })
  let t3448 = @tactics.disch_then(fn(x3445 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3446 = ((x3444 : @kernel.Thm) => @tactics.label_tac("*", x3444))(x3445)
    fn(x3447 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3446(x3447)
    }
  })
  let t3443 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])"))
  let t3442 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3441 = @simp.rewrite_tac(@list.List([@class.skolem_thm()]))
  let t3439 = @simp.asm_rewrite_tac(@list.List([]))
  let t3434 = @term_syntax.parse_term("(n : Num)")
  let t3438 = @tactics.disch_then(fn(x3437 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3436 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3431 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3432 = @tactics.mp_tac(x3431)
        fn(x3433 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3432(x3433)
        }
      })(((x3435 : @kernel.Thm) => @bool.spec(t3434, x3435))(x3436))
    })(@bool.conjunct2(x3437))
  })
  let t3430 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3429 = @tactics.first_x_assum(fn(x3424 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_6 = x3424
    @simp.gen_rewrite_tac(fn(x3426 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3427 = @equal.rand_conv(x3426)
      fn(x3428 : @kernel.Term) -> @kernel.Thm raise {
        s3427(x3428)
      }
    }, @list.List([@equal.sym(th_6)]))
  })
  let t3423 = @simp.rewrite_tac(@list.List([@arith.add_clauses()]))
  let t3422 = @tactics.match_mp_tac(@meson.meson(@list.List([@arith.le_exists()]), @term_syntax.parse_term("(∀ d : Num, (P : (Num) -> Bool)((n : Num) + d)) → (∀ m : Num, n <= m → P(m))")))
  let t3421 = @tactics.exists_tac(@term_syntax.parse_term("(n : Num) + 1"))
  let t3420 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3419 = @tactics.exists_tac(@term_syntax.parse_term("(f : (Num, Cart[Real, Unit]) -> Cart[Real, 2])((n : Num) + 1, (x : Cart[Real, Unit]))"))
  let t3418 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(n : Num)"))(@tactics.strip_assume_tac))
  let t3417 = @simp.gen_rewrite_tac(fn(x3414 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3415 = @equal.land_conv(x3414)
    fn(x3416 : @kernel.Term) -> @kernel.Thm raise {
      s3415(x3416)
    }
  }, @list.List([@arith.num_wop()]))
  let t3413 = @simp.rewrite_tac(@list.List([@sets.exists_in_gspec(), @sets.in_univ()]))
  let t3410 = @simp.gen_rewrite_rule(fn(x3409 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3409
  }, @list.List([@sets.in_unions()]))
  let t3412 = @tactics.first_x_assum(fn(x3411 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3406 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3407 = @tactics.mp_tac(x3406)
      fn(x3408 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3407(x3408)
      }
    })(t3410(x3411))
  })
  let t3404 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3403 = @simp.rewrite_tac(@list.List([@metric.eventually_sequentially()]))
  let t3405 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])((x : Cart[Real, Unit]))")), t3403), t3404)])
  let t3402 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : Cart[Real, Unit]), UNIONS({interval(((a : (Num) -> Cart[Real, Unit])((n : Num)), (b : (Num) -> Cart[Real, Unit])(n))) | IN(n, UNIV)}))"))
  let t3401 = @simp.asm_rewrite_tac(@list.List([]))
  let t3400 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : Cart[Real, Unit]), interval([(vec(0), vec(1))]))"))
  let t3440 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])")), t3400), t3401), t3402), t3405), t3412), t3413), t3417), t3418), t3419), t3420), t3421), t3422), @nums.induct_tac), t3423), t3429), t3430), t3438), t3439), @int.arith_tac), @tactics.all_tac])
  let t3399 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Unit], ∃ y : Cart[Real, 2], IN(x, interval([(vec(0), vec(1))])) → eventually((n : Num) => (f : (Num, Cart[Real, Unit]) -> Cart[Real, 2])(n, x) == y, sequentially)"), fn(x3396 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3397 = @tactics.mp_tac(x3396)
    fn(x3398 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3397(x3398)
    }
  })
  let t3395 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(f : (Num, Cart[Real, Unit]) -> Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t3393 = @simp.rewrite_tac(@list.List([@class.skolem_thm(), @theorems.forall_and_thm()]))
  let t3389 = @simp.rewrite_tac(@list.List([@topology.pairwise_disjoint_components()]))
  let t3388 = @simp.rewrite_tac(@list.List([@sets.pairwise_insert(), @sets.disjoint_empty()]))
  let t3387 = @tactics.first_x_assum(fn(x3382 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x3382
    @simp.gen_rewrite_tac(fn(x3384 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3385 = @equal.rand_conv(x3384)
      fn(x3386 : @kernel.Term) -> @kernel.Thm raise {
        s3385(x3386)
      }
    }, @list.List([@equal.sym(th_5)]))
  })
  let t3381 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.pairwise())]))
  let t3378 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(∀ m : Num, m < (n : Num) → !SUBSET((k : (Num, _) -> Bool)(n), k(m))) → IN((x : _), k(n)) && (∀ s : (_) -> Bool, ∀ t : (_) -> Bool, IN(s, {k((n : Num)) | IN(n, UNIV)}) && IN(t, {k((n : Num)) | IN(n, UNIV)}) && !(s == t) → DISJOINT(s, t)) → !(∀ m : Num, m < n → !IN(x, k(m))) → (p : Bool)")))
  let t3380 = @tactics.first_x_assum(fn(x3379 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3378(x3379))
  })
  let t3377 = @simp.asm_simp_tac(@list.List([]))
  let t3376 = @class.asm_cases_tac(@term_syntax.parse_term("IN((x : Cart[Real, Unit]), interval(((a : (Num) -> Cart[Real, Unit])((n : Num)), (b : (Num) -> Cart[Real, Unit])(n))))"))
  let t3390 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])")), t3376), t3377), t3380), t3381), t3387), t3388), t3389)
  let t3375 = @simp.rewrite_tac(@list.List([@topology.pairwise_disjoint_components()]))
  let t3374 = @simp.rewrite_tac(@list.List([@sets.pairwise_insert(), @sets.disjoint_empty()]))
  let t3373 = @tactics.first_x_assum(fn(x3368 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x3368
    @simp.gen_rewrite_tac(fn(x3370 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3371 = @equal.rand_conv(x3370)
      fn(x3372 : @kernel.Term) -> @kernel.Thm raise {
        s3371(x3372)
      }
    }, @list.List([@equal.sym(th_4)]))
  })
  let t3367 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.pairwise())]))
  let t3364 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(∀ m : Num, m < (n : Num) → !SUBSET((k : (Num, _) -> Bool)(n), k(m))) → IN((x : _), UNIONS({k((m : Num)) | m < n})) && (∀ s : (_) -> Bool, ∀ t : (_) -> Bool, IN(s, {k((n : Num)) | IN(n, UNIV)}) && IN(t, {k((n : Num)) | IN(n, UNIV)}) && !(s == t) → DISJOINT(s, t)) → !IN(x, k(n))")))
  let t3366 = @tactics.first_x_assum(fn(x3365 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3364(x3365))
  })
  let t3363 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3362 = @tactics.subgoal_then(@term_syntax.parse_term("(f : (Cart[Real, Unit]) -> Cart[Real, 2])((x : Cart[Real, Unit])) == (h : (Cart[Real, Unit]) -> Cart[Real, 2])(x)"), fn(x3360 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x3360
    @simp.asm_simp_tac(@list.List([th_3]))
  })
  let t3391 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Cart[Real, Unit])")), @tactics.disch_tac), t3362), t3363), t3366), t3367), t3373), t3374), t3375)
  let t3359 = @simp.rewrite_tac(@list.List([@vectors.interval_open_subset_closed()]))
  let t3357 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET(IMAGE((f : (_) -> _), (c : (_) -> Bool)), (t : (_) -> Bool)) → SUBSET((i : (_) -> Bool), c) → (∀ x : _, IN(x, i) → IN(f(x), t))")))
  let t3392 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x3358 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3357(x3358))
  }), t3359), t3391, t3390])
  let t3356 = @tactics.repeat_tac(@tactics.conj_tac)
  let t3355 = @simp.rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t3354 = @simp.asm_simp_tac(@list.List([]))
  let t3353 = @simp.rewrite_tac(@list.List([@sets.in_union(), @class.de_morgan_thm()]))
  let t3352 = @simp.asm_rewrite_tac(@list.List([@sets.unions_insert(), @sets.forall_in_union()]))
  let t3351 = @simp.rewrite_tac(@list.List([@arith.lt(), @sets.set_rule(@term_syntax.parse_term("{(f : (_) -> _)((x : _)) | x == (a : _) || (P : (_) -> Bool)(x)} == INSERT(f(a), {f((x : _)) | P(x)})"))]))
  let t3349 = @meson.asm_meson_tac(@list.List([]))
  let t3348 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist())]))
  let t3350 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@integration.lipschitz_imp_rectifiable_path()), t3348), t3349), @tactics.all_tac])
  let t3347 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@theorems.conj_assoc())]))
  let t3346 = @tactics.x_gen_tac(@term_syntax.parse_term("(f : (Cart[Real, Unit]) -> Cart[Real, 2])"))
  let t3344 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3343 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3342 = @simp.rewrite_tac(@list.List([@sets.unions_insert(), @sets.union_empty(), @equal.gsym(@topology.unions_components())]))
  let t3339 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(s : ((_) -> Bool) -> Bool) == {(k : (Num, _) -> Bool)((n : Num)) | IN(n, UNIV)} → INTER(IMAGE((g : (_) -> _), UNIONS(s)), (f : (_) -> Bool)) == {} → INTER(IMAGE(g, k((n : Num))), f) == {}")))
  let t3341 = @tactics.first_x_assum(fn(x3340 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3339(x3340))
  })
  let t3336 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(∀ x : _, IN(x, (s : (_) -> Bool)) → (h : (_) -> _)(x) == (g : (_) -> _)(x)) → INTER(IMAGE(g, s), (k : (_) -> Bool)) == (j : (_) -> Bool) → INTER(IMAGE(h, s), k) == j")))
  let t3338 = @tactics.first_x_assum(fn(x3337 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3336(x3337))
  })
  let t3345 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t3338), t3341), t3342), t3343), t3344])
  let t3334 = @simp.rewrite_tac(@list.List([@topology.pairwise_disjoint_components()]))
  let t3333 = @simp.rewrite_tac(@list.List([@sets.pairwise_insert(), @sets.disjoint_empty()]))
  let t3332 = @tactics.first_x_assum(fn(x3327 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x3327
    @simp.gen_rewrite_tac(fn(x3329 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3330 = @equal.rand_conv(x3329)
      fn(x3331 : @kernel.Term) -> @kernel.Thm raise {
        s3330(x3331)
      }
    }, @list.List([@equal.sym(th_2)]))
  })
  let t3326 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@sets.pairwise())]))
  let t3323 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(∀ m : Num, m < (n : Num) → !SUBSET((k : (Num, _) -> Bool)(n), k(m))) → IN((x : _), k(n)) && (∀ s : (_) -> Bool, ∀ t : (_) -> Bool, IN(s, {k((n : Num)) | IN(n, UNIV)}) && IN(t, {k((n : Num)) | IN(n, UNIV)}) && !(s == t) → DISJOINT(s, t)) → !(∃ m : Num, m < n && IN(x, k(m)))")))
  let t3325 = @tactics.first_x_assum(fn(x3324 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3323(x3324))
  })
  let t3322 = @simp.rewrite_tac(@list.List([@sets.unions_gspec(), @sets.in_elim_thm()]))
  let t3321 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t3335 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3321), t3322), t3325), t3326), t3332), t3333), t3334), @tactics.all_tac])
  let t3320 = @tactics.subgoal_then(@term_syntax.parse_term("∀ x : Cart[Real, Unit], IN(x, interval(((a : (Num) -> Cart[Real, Unit])((n : Num)), (b : (Num) -> Cart[Real, Unit])(n)))) → (h : (Cart[Real, Unit]) -> Cart[Real, 2])(x) == (g : (Cart[Real, Unit]) -> Cart[Real, 2])(x)"), fn(x3317 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3318 = @tactics.assume_tac(x3317)
    fn(x3319 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3318(x3319)
    }
  })
  let t3315 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3314 = @simp.rewrite_tac(@list.List([@sets.unions_insert(), @sets.union_empty(), @equal.gsym(@topology.unions_components())]))
  let t3311 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(s : ((_) -> Bool) -> Bool) == {(i : (Num, _) -> Bool)((n : Num)) | IN(n, UNIV)} → !IN((x : _), UNIONS(s)) → !IN(x, UNIONS({i((n : Num)) | (P : (Num) -> Bool)(n)}))")))
  let t3313 = @tactics.first_x_assum(fn(x3312 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3311(x3312))
  })
  let t3316 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.first_x_assum(@tactics.match_mp_tac)), t3313), t3314), t3315), @tactics.all_tac])
  let t3310 = @tactics.subgoal_then(@term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])((a : (Num) -> Cart[Real, Unit])((n : Num))) == (g : (Cart[Real, Unit]) -> Cart[Real, 2])(a(n)) && h((b : (Num) -> Cart[Real, Unit])(n)) == g(b(n))"), @tactics.strip_assume_tac)
  let t3309 = @simp.asm_rewrite_tac(@list.List([]))
  let t3305 = @term_syntax.parse_term("(L : Real)")
  let t3306 = @term_syntax.parse_term("(b : (Num) -> Cart[Real, Unit])((n : Num))")
  let t3307 = @term_syntax.parse_term("(a : (Num) -> Cart[Real, Unit])((n : Num))")
  let t3308 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])"), t3307, t3306, t3305]), step_lemma()))
  let t3302 = @simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("!((p : Bool) && (q : Bool)) == (p → !q)"))]))
  let t3301 = @simp.rewrite_tac(@list.List([@topology.interval_ne_empty_1(), @class.not_exists_thm()]))
  let t3299 = @simp.gen_rewrite_rule(fn(x3298 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3298
  }, @list.List([@class.de_morgan_thm()]))
  let t3303 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x3300 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3295 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3296 = @tactics.mp_tac(x3295)
      fn(x3297 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3296(x3297)
      }
    })(t3299(x3300))
  }), t3301), t3302), @tactics.strip_tac)
  let t3294 = @simp.asm_rewrite_tac(@list.List([]))
  let t3293 = @tactics.exists_tac(@term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])"))
  let t3291 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3292 = @list.List([@tactics.then_tac(@simp.rewrite_tac(@list.List([@arith.lt(), @sets.unions_gspec()])), t3291), @tactics.all_tac])
  let t3304 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("UNIONS({interval(((a : (Num) -> Cart[Real, Unit])((m : Num)), (b : (Num) -> Cart[Real, Unit])(m))) | m < SUC((n : Num))}) == UNIONS({interval((a((m : Num)), b(m))) | m < n})"), fn(x3288 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3289 = @tactics.subst1_tac(x3288)
    fn(x3290 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3289(x3290)
    }
  }), t3292), t3293), t3294), t3303])
  let t3287 = @class.asm_cases_tac(@term_syntax.parse_term("interval(((a : (Num) -> Cart[Real, Unit])((n : Num)), (b : (Num) -> Cart[Real, Unit])(n))) == {} || (∃ m : Num, m < n && SUBSET(interval((a(n), b(n))), interval((a(m), b(m)))))"))
  let t3285 = @term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t3286 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(n : Num)"), t3285]))
  let t3283 = @sets.set_tac(@list.List([]))
  let t3282 = @simp.rewrite_tac(@list.List([@arith.lt()]))
  let t3281 = @simp.asm_rewrite_tac(@list.List([]))
  let t3284 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])")), t3281), t3282), t3283), @tactics.all_tac])
  let t3394 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@arith.dependent_choice()), @tactics.conj_tac), t3284), t3286), @tactics.strip_tac), t3287), t3304), t3308), t3309), t3310), t3316), t3320), t3335), @tactics.ants_tac), t3345), t3346), @tactics.strip_tac), t3347), @tactics.conj_tac), t3350), t3351), t3352), t3353), t3354), t3355), t3356), t3392), t3393])
  let t3280 = @tactics.subgoal_then(@term_syntax.parse_term("∃ h : (Num, Cart[Real, Unit]) -> Cart[Real, 2], (∀ n : Num, simple_path(h(n)) && rectifiable_path(h(n)) && pathstart(h(n)) == pathstart((g : (Cart[Real, Unit]) -> Cart[Real, 2])) && pathfinish(h(n)) == pathfinish(g) && hull(convex, path_image(h(n))) == hull(convex, path_image(g)) && (∀ x : Cart[Real, Unit], ∀ y : Cart[Real, Unit], IN(x, interval([(vec(0), vec(1))])) && IN(y, interval([(vec(0), vec(1))])) → distance((h(n, x), h(n, y))) <= (L : Real) * distance((x, y))) && (∀ x : Cart[Real, Unit], IN(x, UNIONS({interval(((a : (Num) -> Cart[Real, Unit])((m : Num)), (b : (Num) -> Cart[Real, Unit])(m))) | m < n})) → IN(h(n, x), frontier(hull(convex, path_image(g))))) && (∀ x : Cart[Real, Unit], !IN(x, UNIONS({interval((a((m : Num)), b(m))) | m < n})) → h(n, x) == g(x))) && (∀ n : Num, ∀ x : Cart[Real, Unit], !(IN(x, interval((a(n), b(n)))) && (∀ m : Num, m < n → !IN(x, interval((a(m), b(m)))))) → h(SUC(n), x) == h(n, x))"), fn(x3277 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3278 = @tactics.mp_tac(x3277)
    fn(x3279 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3278(x3279)
    }
  })
  let t3273 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3272 = @simp.rewrite_tac(@list.List([@sets.in_image(), @sets.in_elim_thm(), @sets.in_univ()]))
  let t3274 = @tactics.then_tac(@tactics.then_tac(@simp.gen_rewrite_tac(fn(x3271 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x3271
  }, @list.List([@sets.extension()])), t3272), t3273)
  let t3270 = @sets.set_tac(@list.List([]))
  let t3269 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t3268 = @simp.rewrite_tac(@list.List([@vectors.interval_open_subset_closed(), @topology.interval_ne_empty_1()]))
  let t3267 = @simp.rewrite_tac(@list.List([@sets.insert_subset(), @vectors.ends_in_interval()]))
  let t3266 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@realarith.real_not_lt()), @convex.connected_interval()]))
  let t3265 = @simp.asm_simp_tac(@list.List([@topology.closure_interval(), @topology.interval_eq_empty_1()]))
  let t3264 = @tactics.exists_tac(@term_syntax.parse_term("interval(((a : (Num) -> Cart[Real, Unit])((n : Num)), (b : (Num) -> Cart[Real, Unit])(n)))"))
  let t3263 = @tactics.match_mp_tac(@topology.connected_intermediate_closure())
  let t3262 = @simp.asm_rewrite_tac(@list.List([]))
  let t3261 = @simp.simp_tac(@list.List([@sets.in_elim_thm(), @sets.in_diff(), @sets.in_univ()]))
  let t3260 = @simp.expand_tac("s")
  let t3259 = @simp.asm_rewrite_tac(@list.List([]))
  let t3258 = @simp.rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("(INSERT((x : _), (s : (_) -> Bool)) == s) == IN(x, s)")), @vectors.ends_in_interval()]))
  let t3257 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("(q : Bool) && !(s : Bool) && (r : Bool) && (!(t : Bool) → (p : Bool)) → (p → q → r → s) → t")))
  let t3256 = @tactics.thenl(@tactics.ants_tac, @list.List([@sets.set_tac(@list.List([])), @tactics.all_tac]))
  let t3255 = @simp.rewrite_tac(@list.List([@sets.not_insert_empty(), @sets.insert_subset(), @theorems.imp_conj()]))
  let t3250 = @term_syntax.parse_term("INSERT((b : (Num) -> Cart[Real, Unit])((n : Num)), interval(((a : (Num) -> Cart[Real, Unit])(n), b(n))))")
  let t3253 = @tactics.disch_then(fn(x3252 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3247 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3248 = @tactics.mp_tac(x3247)
      fn(x3249 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3248(x3249)
      }
    })(((x3251 : @kernel.Thm) => @bool.spec(t3250, x3251))(x3252))
  })
  let t3244 = @term_syntax.parse_term("INSERT((a : (Num) -> Cart[Real, Unit])((n : Num)), interval((a(n), (b : (Num) -> Cart[Real, Unit])(n))))")
  let t3254 = @list.List([@tactics.disch_then(fn(x3246 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3241 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3242 = @tactics.mp_tac(x3241)
      fn(x3243 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3242(x3243)
      }
    })(((x3245 : @kernel.Thm) => @bool.spec(t3244, x3245))(x3246))
  }), t3253])
  let t3238 = @tactics.disch_then(fn(x3237 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3236 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3233 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3234 = @tactics.mp_tac(x3233)
        fn(x3235 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3234(x3235)
        }
      })(@lib.last(x3236))
    })(@bool.conjuncts_rule(x3237))
  })
  let t3232 = @meson.meson_tac(@list.List([]))
  let t3239 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@sets.in_image(), @sets.in_univ()])), t3232), t3238])
  let t3240 = @tactics.thenl(@tactics.then_tac(@tactics.disch_then(fn(x3231 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3230 : (@kernel.Thm, @kernel.Thm)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3226 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3227 = @tactics.mp_tac(x3226)
        fn(x3228 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3227(x3228)
        }
      })((fn(x3229 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
        x3229.0
      })(x3230))
    })(@bool.eq_imp_rule(x3231))
  }), @tactics.ants_tac), t3239)
  let t3224 = @term_syntax.parse_term("interval(((a : (Num) -> Cart[Real, Unit])((n : Num)), (b : (Num) -> Cart[Real, Unit])(n)))")
  let t3225 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool)"), t3224]), @topology.in_components_maximal()))
  let t3275 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))), t3225), t3240), t3254), t3255), t3256), t3257), t3258), t3259), t3260), t3261), t3262), t3263), t3264), t3265), t3266), t3267), t3268), t3269), t3270), t3274])
  let t3223 = @simp.once_rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t3222 = @list.List([@meson.asm_meson_tac(@list.List([@sets.subset(), @vectors.ends_in_interval(), @topology.interval_ne_empty_1(), @realarith.real_lt_imp_le()])), @tactics.strip_tac])
  let t3221 = @tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((p : Bool) && (q : Bool)) && (p && q → (r : Bool)) → p && q && r")))
  let t3220 = @simp.asm_simp_tac(@list.List([@realarith.real_lt_imp_le()]))
  let t3218 = @tactics.then_tac(@simp.asm_simp_tac(@list.List([@topology.closure_open_interval(), @topology.interval_ne_empty_1()])), @tactics.disch_tac)
  let t3217 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3216 = @simp.rewrite_tac(@list.List([@topology.closed_interval()]))
  let t3219 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.match_mp_tac(@topology.closure_minimal())), t3216), t3217), t3218])
  let t3215 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, SUBSET(closure(interval(((a : (Num) -> Cart[Real, Unit])(n), (b : (Num) -> Cart[Real, Unit])(n)))), interval([(vec(0), vec(1))]))"), fn(x3212 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3213 = @tactics.mp_tac(x3212)
    fn(x3214 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3213(x3214)
    }
  })
  let t3210 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3207 = @drule.match_mp(@topology.in_components_subset())
  let t3209 = @tactics.disch_then(fn(x3208 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3205 = @tactics.mp_tac(x3204)
      fn(x3206 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3205(x3206)
      }
    })(t3207(x3208))
  })
  let t3201 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(s : ((_) -> Bool) -> Bool) == IMAGE((q : (_, _) -> Bool), UNIV) → (∀ c : (_) -> Bool, IN(c, s) → SUBSET(c, (t : (_) -> Bool))) → SUBSET(q((n : _)), t)")))
  let t3203 = @tactics.first_x_assum(fn(x3202 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3201(x3202))
  })
  let t3211 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.first_x_assum(fn(x3196 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x3196
    @simp.gen_rewrite_tac(fn(x3198 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3199 = @equal.land_conv(x3198)
      fn(x3200 : @kernel.Term) -> @kernel.Thm raise {
        s3199(x3200)
      }
    }, @list.List([@equal.gsym(th_1)]))
  })), t3203), @tactics.gen_tac), t3209), t3210), @tactics.all_tac])
  let t3195 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, SUBSET(interval(((a : (Num) -> Cart[Real, Unit])(n), (b : (Num) -> Cart[Real, Unit])(n))), (s : (Cart[Real, Unit]) -> Bool))"), fn(x3192 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3193 = @tactics.assume_tac(x3192)
    fn(x3194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3193(x3194)
    }
  })
  let t3190 = @simp.rewrite_tac(@list.List([@topology.in_components_nonempty()]))
  let t3187 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(s : ((_) -> Bool) -> Bool) == IMAGE((q : (_, _) -> Bool), UNIV) → (∀ c : (_) -> Bool, IN(c, s) → !(c == {})) → (∀ n : _, !(q(n) == {}))")))
  let t3189 = @tactics.first_x_assum(fn(x3188 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3187(x3188))
  })
  let t3186 = @tactics.first_x_assum(fn(x3173 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x3173
    @simp.gen_rewrite_tac(fn(x3185 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x3181 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x3175 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s3176 = @equal.binder_conv(x3175)
          fn(x3177 : @kernel.Term) -> @kernel.Thm raise {
            s3176(x3177)
          }
        })((fn(x3178 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s3179 = @equal.rand_conv(x3178)
          fn(x3180 : @kernel.Term) -> @kernel.Thm raise {
            s3179(x3180)
          }
        })(x3181))
      })((fn(x3182 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s3183 = @equal.land_conv(x3182)
        fn(x3184 : @kernel.Term) -> @kernel.Thm raise {
          s3183(x3184)
        }
      })(x3185))
    }, @list.List([@equal.gsym(th)]))
  })
  let t3191 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@topology.interval_ne_empty_1())])), t3186), t3189), t3190), @tactics.all_tac])
  let t3172 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, drop((a : (Num) -> Cart[Real, Unit])(n)) < drop((b : (Num) -> Cart[Real, Unit])(n))"), fn(x3169 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3170 = @tactics.assume_tac(x3169)
    fn(x3171 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3170(x3171)
    }
  })
  let t3168 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : (Num) -> Cart[Real, Unit])"))
  let t3167 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3166 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : (Num) -> Cart[Real, Unit])"))
  let t3165 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3163 = @simp.rewrite_tac(@list.List([@class.skolem_thm()]))
  let t3162 = @simp.rewrite_tac(@list.List([@sets.subset_restrict()]))
  let t3161 = @simp.expand_tac("s")
  let t3160 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.unions_components())]))
  let t3157 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(s : ((_) -> Bool) -> Bool) == IMAGE((q : (_, _) -> Bool), UNIV) → SUBSET(UNIONS(s), (t : (_) -> Bool)) → SUBSET(q((n : _)), t)")))
  let t3159 = @tactics.first_x_assum(fn(x3158 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3157(x3158))
  })
  let t3151 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t3150 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@paths.pathstart(), @paths.pathfinish()])))
  let t3149 = @simp.expand_tac("s")
  let t3148 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.unions_components())]))
  let t3146 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(s : ((_) -> Bool) -> Bool) == IMAGE((q : (_, _) -> Bool), UNIV) → !IN((a : _), UNIONS(s)) → !IN(a, q((n : _)))")))
  let t3152 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.conj_tac, @tactics.first_x_assum(fn(x3147 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3146(x3147))
  })), t3148), t3149), t3150), t3151), @tactics.all_tac])
  let t3145 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("(!IN((a : _), (t : (_) -> Bool)) && !IN((b : _), t)) && SUBSET(t, (s : (_) -> Bool)) → SUBSET(t, DIFF(s, {a, b}))")))
  let t3153 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.open_closed_interval_1()])), t3145), @tactics.conj_tac), t3152)
  let t3144 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.closed()), @topology.frontier_closed()]))
  let t3143 = @simp.asm_simp_tac(@list.List([@equal.gsym(@paths.path()), @integration.rectifiable_path_imp_path()]))
  let t3142 = @tactics.match_mp_tac(@topology.continuous_open_in_preimage())
  let t3141 = @simp.expand_tac("s")
  let t3139 = @simp.simp_tac(@list.List([@paths.convex_imp_locally_connected(), @convex.convex_interval()]))
  let t3138 = @tactics.exists_tac(@term_syntax.parse_term("(interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])"))
  let t3137 = @tactics.match_mp_tac(@topology.locally_open_subset())
  let t3136 = @list.List([@tactics.all_tac, @tactics.asm_tac(@sets.set_tac)(@list.List([]))])
  let t3140 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@paths.open_in_components_locally_connected()), @tactics.conj_tac), t3136), t3137), t3138), t3139), @tactics.all_tac])
  let t3135 = @tactics.exists_tac(@term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool)"))
  let t3154 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@metric.open_in_trans()), t3135), @tactics.conj_tac), t3140), t3141), t3142), t3143), t3144), t3153])
  let t3134 = @simp.rewrite_tac(@list.List([@vectors.interval_open_subset_closed()]))
  let t3133 = @tactics.exists_tac(@term_syntax.parse_term("(interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])"))
  let t3132 = @tactics.match_mp_tac(@metric.open_in_subset_trans())
  let t3131 = @simp.rewrite_tac(@list.List([@topology.open_interval()]))
  let t3130 = @tactics.exists_tac(@term_syntax.parse_term("(interval : ((Cart[Real, Unit], Cart[Real, Unit]), Cart[Real, Unit]) -> Bool)(((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1)))"))
  let t3129 = @tactics.match_mp_tac(@topology.open_in_open_trans())
  let t3128 = @tactics.match_mp_tac(@topology.interior_open())
  let t3126 = @simp.rewrite_tac(@list.List([@topology.in_components_connected()]))
  let t3123 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(s : ((Cart[Real, _]) -> Bool) -> Bool) == IMAGE((q : (_, Cart[Real, _]) -> Bool), UNIV) → (∀ x : (Cart[Real, _]) -> Bool, IN(x, s) → connected(x)) → connected(q((n : _)))")))
  let t3125 = @tactics.first_x_assum(fn(x3124 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3123(x3124))
  })
  let t3122 = @simp.rewrite_tac(@list.List([@convex.convex_connected_1()]))
  let t3127 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@convex.convex_interior_closure()), t3122), t3125), t3126), @tactics.all_tac])
  let t3120 = @term_syntax.parse_term("interior((q : (Num, Cart[Real, Unit]) -> Bool)((n : Num)))")
  let t3121 = @tactics.trans_tac(@theorems.eq_trans())(t3120)
  let t3119 = @tactics.conv_tac(@equal.sym_conv)
  let t3118 = @tactics.disch_then(fn(x3117 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3114 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3115 = @tactics.subst1_tac(x3114)
      fn(x3116 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3115(x3116)
      }
    })(@equal.sym(x3117))
  })
  let t3113 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.interior_interval())]))
  let t3112 = @tactics.x_gen_tac(@term_syntax.parse_term("(b : Cart[Real, Unit])"))
  let t3111 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3110 = @tactics.x_gen_tac(@term_syntax.parse_term("(a : Cart[Real, Unit])"))
  let t3155 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), t3110), t3111), t3112), t3113), t3118), t3119), t3121), @tactics.conj_tac), t3127), t3128), t3129), t3130), t3131), t3132), t3133), t3134), @tactics.conj_tac), t3154)
  let t3108 = @simp.rewrite_tac(@list.List([@topology.closed_interval()]))
  let t3107 = @tactics.match_mp_tac(@topology.closure_minimal())
  let t3106 = @simp.rewrite_tac(@list.List([@topology.bounded_interval()]))
  let t3105 = @tactics.exists_tac(@term_syntax.parse_term("(interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])"))
  let t3104 = @tactics.match_mp_tac(@topology.bounded_subset())
  let t3109 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@topology.compact_eq_bounded_closed(), @topology.closed_closure()])), t3104), t3105), t3106), t3107), t3108)
  let t3103 = @simp.rewrite_tac(@list.List([@topology.in_components_connected()]))
  let t3100 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("(s : ((Cart[Real, _]) -> Bool) -> Bool) == IMAGE((q : (_, Cart[Real, _]) -> Bool), UNIV) → (∀ x : (Cart[Real, _]) -> Bool, IN(x, s) → connected(x)) → connected(q((n : _)))")))
  let t3102 = @tactics.first_x_assum(fn(x3101 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3100(x3101))
  })
  let t3156 = @list.List([@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.connected_closure()), t3102), t3103), t3109])), t3155])
  let t3099 = @tactics.disch_then(fn(x3098 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3097 : (@kernel.Thm, @kernel.Thm)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3093 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3094 = @tactics.mp_tac(x3093)
        fn(x3095 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3094(x3095)
        }
      })((fn(x3096 : (@kernel.Thm, @kernel.Thm)) -> @kernel.Thm raise {
        x3096.0
      })(x3097))
    })(@bool.eq_imp_rule(x3098))
  })
  let t3092 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("closure((q : (Num, Cart[Real, Unit]) -> Bool)((n : Num)))"), @convex.connected_compact_interval_1()))
  let t3164 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t3092), t3099), @tactics.ants_tac), t3156), t3159), t3160), t3161), t3162), t3163])
  let t3091 = @tactics.subgoal_then(@term_syntax.parse_term("∀ n : Num, ∃ a : Cart[Real, Unit], ∃ b : Cart[Real, Unit], (q : (Num, Cart[Real, Unit]) -> Bool)(n) == interval((a, b))"), fn(x3088 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3089 = @tactics.mp_tac(x3088)
    fn(x3090 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3089(x3090)
    }
  })
  let t3085 = @term_syntax.parse_term("(q : (Num, Cart[Real, Unit]) -> Bool)")
  let t3087 = @tactics.disch_then((x3086 : @kernel.Thm) => @tactics.x_choose_tac(t3085, x3086))
  let t3084 = @simp.asm_rewrite_tac(@list.List([@topology.components_eq_empty()]))
  let t3083 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("components((s : (Cart[Real, Unit]) -> Bool))"), @card.countable_as_image()))
  let t3081 = @simp.asm_simp_tac(@list.List([@paths.convex_imp_locally_connected(), @convex.convex_interval()]))
  let t3080 = @tactics.exists_tac(@term_syntax.parse_term("(interval : (List[(Cart[Real, Unit], Cart[Real, Unit])], Cart[Real, Unit]) -> Bool)([((vec : (Num) -> Cart[Real, Unit])(0), (vec : (Num) -> Cart[Real, Unit])(1))])"))
  let t3079 = @tactics.match_mp_tac(@topology.locally_open_subset())
  let t3078 = @tactics.match_mp_tac(@paths.countable_components())
  let t3082 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.expand_tac("s"), t3078), t3079), t3080), t3081), @tactics.all_tac])
  let t3077 = @tactics.subgoal_then(@term_syntax.parse_term("COUNTABLE(components((s : (Cart[Real, Unit]) -> Bool)))"), fn(x3074 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3075 = @tactics.assume_tac(x3074)
    fn(x3076 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3075(x3076)
    }
  })
  let t3072 = @simp.asm_rewrite_tac(@list.List([@equal.gsym(@paths.path_image())]))
  let t3069 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("{(t : _) | IN(t, (k : (_) -> Bool)) && IN((g : (_) -> _)(t), DIFF(UNIV, (f : (_) -> Bool)))} == {} → SUBSET(IMAGE(g, k), f)")))
  let t3071 = @tactics.disch_then(fn(x3070 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3066 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3067 = @tactics.mp_tac(x3066)
      fn(x3068 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3067(x3068)
      }
    })(t3069(x3070))
  })
  let t3065 = @simp.expand_tac("s")
  let t3073 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool) == {}")), t3065), t3071), t3072), @tactics.all_tac])
  let t3064 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool) == {}"))
  let t3063 = @simp.abbrev_tac(@term_syntax.parse_term("(s : (Cart[Real, Unit]) -> Bool) == {(t : Cart[Real, Unit]) | IN(t, interval([(vec(0), vec(1))])) && IN((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t), DIFF(UNIV, frontier(hull(convex, path_image(g)))))}"))
  let t3061 = @meson.asm_meson_tac(@list.List([]))
  let t3060 = @simp.rewrite_tac(@list.List([@equal.gsym(@vectors.dist())]))
  let t3059 = @tactics.match_mp_tac(@topology.lipschitz_imp_continuous_on())
  let t3058 = @simp.rewrite_tac(@list.List([@equal.gsym(@topology.closed()), @topology.frontier_closed()]))
  let t3062 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.continuous_open_in_preimage()), t3058), t3059), t3060), t3061), @tactics.all_tac])
  let t3276 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("open_in(subtopology(euclidean, interval([(vec(0), vec(1))])), {(t : Cart[Real, Unit]) | IN(t, interval([(vec(0), vec(1))])) && IN((g : (Cart[Real, Unit]) -> Cart[Real, 2])(t), DIFF(UNIV, frontier(hull(convex, path_image(g)))))})"), fn(x3055 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3056 = @tactics.assume_tac(x3055)
    fn(x3057 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3056(x3057)
    }
  }), t3062), t3063), t3064), t3073), t3077), t3082), t3083), t3084), t3087), t3091), t3164), t3165), t3166), t3167), t3168), @tactics.disch_tac), t3172), t3191), t3195), t3211), t3215), t3219), t3220), t3221), @tactics.conj_tac), t3222), t3223), @tactics.conj_tac), t3275), @tactics.all_tac])
  let t3054 = @tactics.subgoal_then(@term_syntax.parse_term("∃ a : (Num) -> Cart[Real, Unit], ∃ b : (Num) -> Cart[Real, Unit], (∀ n : Num, IN(a(n), interval([(vec(0), vec(1))]))) && (∀ n : Num, IN(b(n), interval([(vec(0), vec(1))]))) && (∀ n : Num, drop(a(n)) <= drop(b(n))) && (∀ n : Num, IN((g : (Cart[Real, Unit]) -> Cart[Real, 2])(a(n)), frontier(hull(convex, path_image(g))))) && (∀ n : Num, IN(g(b(n)), frontier(hull(convex, path_image(g))))) && components({(t : Cart[Real, Unit]) | IN(t, interval([(vec(0), vec(1))])) && IN(g(t), DIFF(UNIV, frontier(hull(convex, path_image(g)))))}) == {interval((a((n : Num)), b(n))) | IN(n, UNIV)}"), @tactics.strip_assume_tac)
  let t3052 = @simp.asm_rewrite_tac(@list.List([]))
  let t3051 = @tactics.match_mp_tac(lemma3())
  let t3050 = @tactics.conv_tac(@equal.sym_conv)
  let t3049 = @simp.asm_rewrite_tac(@list.List([@realax.real_le_refl()]))
  let t3053 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])")), t3049), t3050), t3051), t3052), @tactics.all_tac])
  let t3048 = @class.asm_cases_tac(@term_syntax.parse_term("SUBSET(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])), frontier(hull(convex, path_image(g))))"))
  let t3047 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3043 = @term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t3044 = @tactics.spec_tac(@term_syntax.parse_term("(g' : (Cart[Real, Unit]) -> Cart[Real, 2])"), t3043)
  let t3045 = @tactics.then_tac(@tactics.pop_assum_list(fn(x3042 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }), t3044)
  let t3041 = @meson.asm_meson_tac(@list.List([@integration.path_length_pos_le(), @paths.simple_path_imp_path()]))
  let t3046 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), t3041), t3045])
  let t3040 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= (L : Real) && path_length((g' : (Cart[Real, Unit]) -> Cart[Real, 2])) == L && simple_path(g') && rectifiable_path(g') && pathfinish(g') == pathstart(g') && IN(pathstart(g'), frontier(hull(convex, path_image(g')))) && (∀ x : Cart[Real, Unit], ∀ y : Cart[Real, Unit], IN(x, interval([(vec(0), vec(1))])) && IN(y, interval([(vec(0), vec(1))])) → distance((g'(x), g'(y))) <= L * distance((x, y)))"), fn(x3037 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3038 = @tactics.mp_tac(x3037)
    fn(x3039 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3038(x3039)
    }
  })
  let t3036 = @simp.asm_rewrite_tac(@list.List([]))
  let t3035 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(g' : (Cart[Real, Unit]) -> Cart[Real, 2])"))(fn(x3034 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x3034))
  }))
  let t3033 = @simp.asm_rewrite_tac(@list.List([]))
  let t3032 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), @integration.arc_length_reparametrization()))
  let t3031 = @simp.abbrev_tac(@term_syntax.parse_term("(L : Real) == path_length((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"))
  let t3030 = @tactics.repeat_tac(@tactics.strip_tac)
  let t3028 = @meson.asm_meson_tac(@list.List([]))
  let t3027 = @simp.rewrite_tac(@list.List([@paths.path_image(), @topology.in_interval_1(), @vectors.drop_vec(), @sets.in_image()]))
  let t3026 = @tactics.match_mp_tac(@misc.hull_inc())
  let t3025 = @tactics.match_mp_tac(@topology.closure_inc())
  let t3024 = @simp.asm_rewrite_tac(@list.List([@topology.frontier(), @sets.in_diff()]))
  let t3023 = @tactics.disch_then(@tactics.match_mp_tac)
  let t3022 = @simp.asm_simp_tac(@list.List([@paths.pathstart_shiftpath(), @paths.pathfinish_shiftpath()]))
  let t3021 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@topology.in_interval_1(), @vectors.drop_vec()])))
  let t3020 = @simp.asm_simp_tac(@list.List([@integration.path_length_shiftpath(), @paths.path_image_shiftpath()]))
  let t3019 = @simp.asm_simp_tac(@list.List([@integration.rectifiable_path_shiftpath(), @paths.simple_path_shiftpath()]))
  let t3015 = @term_syntax.parse_term("shiftpath((t : Cart[Real, Unit]), (g : (Cart[Real, Unit]) -> Cart[Real, 2]))")
  let t3018 = @tactics.first_x_assum(fn(x3017 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3012 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3013 = @tactics.mp_tac(x3012)
      fn(x3014 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3013(x3014)
      }
    })(((x3016 : @kernel.Thm) => @bool.spec(t3015, x3016))(x3017))
  })
  let t3011 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(t : Cart[Real, Unit])"))(@tactics.strip_assume_tac))
  let t3010 = @simp.rewrite_tac(@list.List([@sets.exists_in_image()]))
  let t3009 = @simp.gen_rewrite_tac(fn(x3008 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    (fn(x3004 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      (fn(x3000 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        (fn(x2994 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2995 = @equal.land_conv(x2994)
          fn(x2996 : @kernel.Term) -> @kernel.Thm raise {
            s2995(x2996)
          }
        })((fn(x2997 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
          let s2998 = @equal.binder_conv(x2997)
          fn(x2999 : @kernel.Term) -> @kernel.Thm raise {
            s2998(x2999)
          }
        })(x3000))
      })((fn(x3001 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
        let s3002 = @equal.land_conv(x3001)
        fn(x3003 : @kernel.Term) -> @kernel.Thm raise {
          s3002(x3003)
        }
      })(x3004))
    })((fn(x3005 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
      let s3006 = @equal.rand_conv(x3005)
      fn(x3007 : @kernel.Term) -> @kernel.Thm raise {
        s3006(x3007)
      }
    })(x3008))
  }, @list.List([@paths.path_image()]))
  let t2993 = @simp.rewrite_tac(@list.List([@sets.subset(), @class.not_forall_thm(), @class.not_imp()]))
  let t2992 = @simp.asm_simp_tac(@list.List([@paths.compact_path_image(), @paths.simple_path_imp_path()]))
  let t2991 = @simp.rewrite_tac(@list.List([@convex.convex_hull_eq_empty(), @paths.path_image_nonempty()]))
  let t2990 = @simp.rewrite_tac(@list.List([@sets.empty_subset(), @sets.diff_empty(), @convex.convex_hull_empty()]))
  let t2988 = @term_syntax.parse_term("({} : (Cart[Real, 2]) -> Bool)")
  let t2989 = @tactics.mp_tac(@bool.ispecl(@list.List([@term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"), t2988]), @polytope.convex_hull_redundant_subset()))
  let t3029 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t2989), t2990), t2991), t2992), t2993), t3009), t3010), t3011), t3018), t3019), t3020), t3021), t3022), t3023), t3024), t3025), t3026), t3027), t3028)])
  let t3692 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.subgoal_then(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], rectifiable_path(g) && simple_path(g) && pathfinish(g) == pathstart(g) && IN(pathstart(g), frontier(hull(convex, path_image(g)))) → (∃ h : (Cart[Real, Unit]) -> Cart[Real, 2], rectifiable_path(h) && simple_path(h) && pathfinish(h) == pathstart(h) && path_length(h) <= path_length(g) && hull(convex, path_image(h)) == hull(convex, path_image(g)) && path_image(h) == frontier(hull(convex, path_image(g))))"), fn(x2985 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s2986 = @tactics.mp_tac(x2985)
    fn(x2987 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s2986(x2987)
    }
  }), t3029), t3030), t3031), t3032), t3033), t3035), t3036), t3040), t3046), t3047), t3048), t3053), t3054), t3276), t3280), t3394), t3395), t3399), t3440), t3441), t3442), t3443), t3448), t3452), t3468), t3469), @tactics.conj_tac), t3472), t3473), @tactics.conj_tac), t3492), t3493), @tactics.conj_tac), t3508), t3509), @tactics.conj_tac), t3512), t3513), @tactics.conj_tac), t3588), t3589), @tactics.conj_tac), t3626), t3628), @tactics.conj_tac), t3691)
  isoperimetric_convexification_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], rectifiable_path(g) && simple_path(g) && pathfinish(g) == pathstart(g) → (∃ h : (Cart[Real, Unit]) -> Cart[Real, 2], rectifiable_path(h) && simple_path(h) && pathfinish(h) == pathstart(h) && path_length(h) <= path_length(g) && hull(convex, path_image(h)) == hull(convex, path_image(g)) && path_image(h) == frontier(hull(convex, path_image(g))))"), t3692))
}

///|
let isoperimetric_convexification_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOPERIMETRIC_CONVEXIFICATION")

///|
/// `ISOPERIMETRIC_CONVEXIFICATION`
pub fn isoperimetric_convexification() -> @kernel.Thm {
  isoperimetric_convexification_c.get()
}

///|
/// ISOPERIMETRIC_CONVEXIFICATION_1
fn step_11() -> Unit raise {
  let t3821 = @tactics.conv_tac(@vectors.norm_arith)
  let t3820 = @simp.rewrite_tac(@list.List([@sets.subset(), @topology.in_ball()]))
  let t3819 = @tactics.undisch_tac(@term_syntax.parse_term("distance(((x : Cart[Real, 2]), (y : Cart[Real, 2]))) < (e : Real) / real_of_num(2)"))
  let t3818 = @simp.asm_rewrite_tac(@list.List([]))
  let t3816 = @term_syntax.parse_term("ball(((x : Cart[Real, 2]), (e : Real)))")
  let t3817 = @tactics.trans_tac(@sets.subset_trans())(t3816)
  let t3815 = @simp.rewrite_tac(@list.List([@topology.open_ball()]))
  let t3822 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@topology.interior_maximal()), t3815), t3817), t3818), t3819), t3820), t3821)
  let t3814 = @simp.rewrite_tac(@list.List([@paths.inside_inter_outside()]))
  let t3812 = @drule.match_mp(@sets.set_rule(@term_syntax.parse_term("SUBSET((b : (_) -> Bool), (t : (_) -> Bool)) → INTER((s : (_) -> Bool), t) == {} → DISJOINT(b, s)")))
  let t3823 = @list.List([@tactics.then_tac(@tactics.first_x_assum(fn(x3813 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3812(x3813))
  }), t3814), t3822])
  let t3811 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("DISJOINT((s : (_) -> Bool), (v : (_) -> Bool)) && SUBSET((t : (_) -> Bool), (u : (_) -> Bool)) → SUBSET(INTER(s, t), DIFF(u, v))")))
  let t3810 = @simp.asm_rewrite_tac(@list.List([@real.real_lt_min(), @topology.ball_min_inter(), @misc.real_half()]))
  let t3809 = @tactics.exists_tac(@term_syntax.parse_term("min((d : Real), (e : Real) / real_of_num(2))"))
  let t3808 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Real)"))(@tactics.strip_assume_tac))
  let t3807 = @simp.asm_rewrite_tac(@list.List([]))
  let t3803 = @term_syntax.parse_term("(y : Cart[Real, 2])")
  let t3806 = @tactics.disch_then(fn(x3805 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3800 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3801 = @tactics.mp_tac(x3800)
      fn(x3802 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3801(x3802)
      }
    })(((x3804 : @kernel.Thm) => @bool.spec(t3803, x3804))(x3805))
  })
  let t3799 = @simp.rewrite_tac(@list.List([@topology.open_contains_ball()]))
  let t3798 = @simp.asm_simp_tac(@list.List([@paths.closed_path_image(), @paths.simple_path_imp_path()]))
  let t3797 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))"), @paths.open_outside()))
  let t3796 = @tactics.x_gen_tac(@term_syntax.parse_term("(y : Cart[Real, 2])"))
  let t3795 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3794 = @tactics.disch_then(fn(x3793 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3790 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3791 = @tactics.mp_tac(x3790)
      fn(x3792 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3791(x3792)
      }
    })(@bool.conjunct1(x3793))
  })
  let t3789 = @simp.asm_rewrite_tac(@list.List([@misc.real_half()]))
  let t3785 = @term_syntax.parse_term("(e : Real) / real_of_num(2)")
  let t3788 = @tactics.disch_then(fn(x3787 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3782 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3783 = @tactics.mp_tac(x3782)
      fn(x3784 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3783(x3784)
      }
    })(((x3786 : @kernel.Thm) => @bool.spec(t3785, x3786))(x3787))
  })
  let t3781 = @simp.asm_rewrite_tac(@list.List([@topology.frontier_straddle()]))
  let t3777 = @term_syntax.parse_term("(x : Cart[Real, 2])")
  let t3780 = @tactics.disch_then(fn(x3779 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3774 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3775 = @tactics.mp_tac(x3774)
      fn(x3776 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3775(x3776)
      }
    })(((x3778 : @kernel.Thm) => @bool.spec(t3777, x3778))(x3779))
  })
  let t3773 = @simp.gen_rewrite_tac(fn(x3770 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s3771 = @equal.land_conv(x3770)
    fn(x3772 : @kernel.Term) -> @kernel.Thm raise {
      s3771(x3772)
    }
  }, @list.List([@sets.extension()]))
  let t3769 = @tactics.disch_then(fn(x3768 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3767 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3764 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s3765 = @tactics.mp_tac(x3764)
        fn(x3766 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s3765(x3766)
        }
      })(@lib.last(x3767))
    })(@bool.conjuncts_rule(x3768))
  })
  let t3763 = @simp.asm_rewrite_tac(@list.List([]))
  let t3762 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), @paths.jordan_inside_outside()))
  let t3761 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(e : Real)"))(@tactics.strip_assume_tac))
  let t3759 = @tactics.conjuncts_then2(fn(x3753 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3754 = @tactics.assume_tac(x3753)
    fn(x3755 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3754(x3755)
    }
  }, fn(x3756 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3757 = @tactics.mp_tac(x3756)
    fn(x3758 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3757(x3758)
    }
  })
  let t3760 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(x : Cart[Real, 2])"))(t3759))
  let t3752 = @simp.rewrite_tac(@list.List([@equal.gsym(@sets.member_not_empty()), @sets.in_inter(), @topology.in_interior()]))
  let t3747 = @simp.basic_ss(@list.List([]))
  let t3750 = @tactics.asm_tac(fn(x3749 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3744 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3745 = @tactics.conv_tac(x3744)
      fn(x3746 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3745(x3746)
      }
    })(((x3748 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t3747, 4, x3748))(x3749))
  })(@list.List([@paths.inside_frontier_eq_interior(), @convex.convex_convex_hull(), @convex.bounded_convex_hull(), @paths.bounded_path_image(), @paths.simple_path_imp_path(), @convex.convex_interior()]))
  let t3741 = @drule.match_mp(@class.taut(@term_syntax.parse_term("!(p : Bool) → p → false")))
  let t3743 = @tactics.first_x_assum(fn(x3742 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.match_mp_tac(t3741(x3742))
  })
  let t3740 = @tactics.disch_then(fn(x3739 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3736 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3737 = @tactics.subst_all_tac(x3736)
      fn(x3738 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3737(x3738)
      }
    })(@equal.sym(x3739))
  })
  let t3735 = @simp.asm_rewrite_tac(@list.List([]))
  let t3734 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), lemma3()))
  let t3733 = @simp.rewrite_tac(@list.List([@misc.hull_subset()]))
  let t3732 = @tactics.match_mp_tac(@sets.set_rule(@term_syntax.parse_term("SUBSET((p : (_) -> Bool), (c : (_) -> Bool)) && !SUBSET(p, (f : (_) -> Bool)) → !(INTER(p, DIFF(c, f)) == {})")))
  let t3751 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@topology.set_diff_frontier())])), t3732), t3733), @tactics.disch_tac), t3734), t3735), t3740), t3743), t3750), @tactics.all_tac])
  let t3731 = @tactics.subgoal_then(@term_syntax.parse_term("!(INTER(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2])), interior(hull(convex, path_image(g)))) == {})"), fn(x3728 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s3729 = @tactics.mp_tac(x3728)
    fn(x3730 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s3729(x3730)
    }
  })
  let t3725 = @drule.match_mp(@measure.negligible_empty_interior())
  let t3727 = @tactics.disch_then(fn(x3726 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3722 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3723 = @tactics.mp_tac(x3722)
      fn(x3724 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3723(x3724)
      }
    })(t3725(x3726))
  })
  let t3721 = @simp.rewrite_tac(@list.List([@paths.inside_subset_interior_convex_hull()]))
  let t3717 = @simp.basic_ss(@list.List([]))
  let t3720 = @tactics.asm_tac(fn(x3719 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3714 : (@kernel.Term) -> @kernel.Thm raise) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3715 = @tactics.conv_tac(x3714)
      fn(x3716 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3715(x3716)
      }
    })(((x3718 : @list.List[@kernel.Thm]) => @simp.gen_simplify_conv(@simp.top_depth_sqconv, t3717, 6, x3718))(x3719))
  })(@list.List([@measure.measurable_inside(), @paths.compact_path_image(), @paths.simple_path_imp_path(), @topology.compact_frontier(), @convex.compact_convex_hull(), @paths.inside_frontier_eq_interior(), @convex.convex_convex_hull(), @convex.bounded_convex_hull(), @paths.bounded_path_image(), @paths.simple_path_imp_path(), @measure.measurable_measure_pos_lt(), @measure.measurable_diff(), @measure.measurable_interior()]))
  let t3713 = @list.List([@tactics.all_tac, @tactics.disch_then(fn(x3712 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3709 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3710 = @tactics.subst1_tac(x3709)
      fn(x3711 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3710(x3711)
      }
    })(@equal.sym(x3712))
  })])
  let t3703 = @drule.part_match(fn(x3702 : @kernel.Term) -> @kernel.Term raise {
    @kernel.rand(@kernel.rand(x3702))
  }, @measure.measure_diff_subset())
  let t3698 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@realarith.real_sub_lt())]))
  let t3697 = @simp.asm_rewrite_tac(@list.List([]))
  let t3696 = @tactics.x_gen_tac(@term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])"))
  let t3695 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t3694 = @simp.asm_rewrite_tac(@list.List([]))
  let t3693 = @tactics.mp_tac(@bool.ispec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), isoperimetric_convexification()))
  let t3824 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t3693), t3694), t3695), t3696), @tactics.strip_tac), t3697), t3698), fn(x3708 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x3707 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x3705 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        (fn(x3704 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
          (fn(x3699 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
            let s3700 = @tactics.mp_tac(x3699)
            fn(x3701 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
              s3700(x3701)
            }
          })(t3703(x3704))
        })(@kernel.rand(x3705))
      })((fn(x3706 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> @kernel.Term raise {
        x3706.1
      })(x3707))
    })(x3708)(x3708)
  }), @tactics.ants_tac), t3713), t3720), t3721), t3727), t3731), t3751), t3752), t3760), t3761), t3762), t3763), t3769), t3773), t3780), t3781), t3788), t3789), t3794), t3795), t3796), @tactics.strip_tac), t3797), t3798), t3799), t3806), t3807), t3808), t3809), t3810), t3811), @tactics.conj_tac), t3823)
  isoperimetric_convexification_1_c.set(@tactics.prove(@term_syntax.parse_term("∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], rectifiable_path(g) && simple_path(g) && pathfinish(g) == pathstart(g) && !convex(inside(path_image(g))) → (∃ h : (Cart[Real, Unit]) -> Cart[Real, 2], rectifiable_path(h) && simple_path(h) && pathfinish(h) == pathstart(h) && path_length(h) <= path_length(g) && hull(convex, path_image(h)) == hull(convex, path_image(g)) && path_image(h) == frontier(hull(convex, path_image(g))) && measure(inside(path_image(g))) < measure(inside(path_image(h))))"), t3824))
}

///|
let isoperimetric_convexification_1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOPERIMETRIC_CONVEXIFICATION_1")

///|
/// `ISOPERIMETRIC_CONVEXIFICATION_1`
pub fn isoperimetric_convexification_1() -> @kernel.Thm {
  isoperimetric_convexification_1_c.get()
}

///|
/// ISOPERIMETRIC_THEOREM
fn step_12() -> Unit raise {
  let t3843 = @simp.asm_simp_tac(@list.List([@integration.path_length_pos_le()]))
  let t3842 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (x : Real) && x <= (y : Real) → abs(x) <= abs(y)")))
  let t3841 = @simp.rewrite_tac(@list.List([@equal.gsym(@real.real_le_square_abs())]))
  let t3840 = @simp.asm_simp_tac(@list.List([@real.real_le_div2_eq(), @transcendentals.pi_pos(), @calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) < real_of_num(4) * (x : Real)) == (real_of_num(0) < x)"))]))
  let t3839 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(g : Real) < (h : Real) && (m : Real) <= (l : Real) → h <= m → g < l")))
  let t3838 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_lt_le())]))
  let t3844 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((p : Bool) → (q : Bool) && !(r : Bool)) → p && (s : Bool) → q && (r → (t : Bool))"))), t3838), t3839), t3840), t3841), t3842), t3843)
  let t3845 = @list.List([@simp.asm_simp_tac(@list.List([@paths.inside_frontier_eq_interior(), @convex.convex_convex_hull(), @convex.bounded_convex_hull(), @paths.bounded_path_image(), @convex.convex_interior()])), t3844])
  let t3836 = @term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])")
  let t3837 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("path_length((h : (Cart[Real, Unit]) -> Cart[Real, 2]))"), t3836]), isoperimetric_theorem_convex()))
  let t3835 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(h : (Cart[Real, Unit]) -> Cart[Real, 2])"))(@tactics.strip_assume_tac))
  let t3834 = @simp.asm_rewrite_tac(@list.List([]))
  let t3833 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(g : (Cart[Real, Unit]) -> Cart[Real, 2])"), isoperimetric_convexification_1()))
  let t3832 = @list.List([@meson.asm_meson_tac(@list.List([isoperimetric_theorem_convex()])), @tactics.all_tac])
  let t3831 = @class.asm_cases_tac(@term_syntax.parse_term("convex(inside(path_image((g : (Cart[Real, Unit]) -> Cart[Real, 2]))))"))
  let t3828 = @drule.match_mp(@paths.simple_path_imp_path())
  let t3830 = @tactics.first_assum(fn(x3829 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x3825 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s3826 = @tactics.assume_tac(x3825)
      fn(x3827 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s3826(x3827)
      }
    })(t3828(x3829))
  })
  let t3846 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t3830), t3831), t3832), t3833), t3834), t3835), t3837), @tactics.ants_tac), t3845)
  isoperimetric_theorem_c.set(@tactics.prove(@term_syntax.parse_term("∀ L : Real, ∀ g : (Cart[Real, Unit]) -> Cart[Real, 2], rectifiable_path(g) && simple_path(g) && pathfinish(g) == pathstart(g) && path_length(g) == L → measure(inside(path_image(g))) <= pow(L, 2) / (real_of_num(4) * pi) && (measure(inside(path_image(g))) == pow(L, 2) / (real_of_num(4) * pi) → (∃ a : Cart[Real, 2], ∃ r : Real, path_image(g) == sphere((a, r))))"), t3846))
}

///|
let isoperimetric_theorem_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("ISOPERIMETRIC_THEOREM")

///|
/// `ISOPERIMETRIC_THEOREM`
pub fn isoperimetric_theorem() -> @kernel.Thm {
  isoperimetric_theorem_c.get()
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
}
