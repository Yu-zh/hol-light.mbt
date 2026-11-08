// Translated from upstream 100/thales.ml; edit this file directly.

///|
/// 100/thales.ml:7
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// BETWEEN_THM
fn step_2() -> Unit raise {
  let t3 = @simp.rewrite_tac(@list.List([@theorems.conj_assoc()]))
  let t2 = @simp.rewrite_tac(@list.List([@convex.convex_hull_2_alt(), @sets.in_elim_thm()]))
  let t1 = @simp.once_rewrite_tac(@list.List([@sets.set_rule(@term_syntax.parse_term("INSERT((a : _), INSERT((b : _), EMPTY)) == INSERT(b, INSERT(a, EMPTY))"))]))
  let t4 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@convex.between_in_convex_hull()])), t1), t2), @tactics.ap_term_tac), @tactics.abs_tac), t3), @tactics.ap_term_tac), @vectors.vector_arith_tac)
  between_thm_c.set(@tactics.prove(@term_syntax.parse_term("between((x : Cart[Real, _]), ((a : Cart[Real, _]), (b : Cart[Real, _]))) == (∃ u : Real, real_of_num(0) <= u && u <= real_of_num(1) && x == op_pct(u, a) + op_pct(real_of_num(1) - u, b))"), t4))
}

///|
let between_thm_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BETWEEN_THM")

///|
/// `BETWEEN_THM`
pub fn between_thm() -> @kernel.Thm {
  between_thm_c.get()
}

///|
/// length_def
fn step_3() -> Unit raise {
  length_def_c.set(@pair.new_definition(@term_syntax.parse_term("(length : ((Cart[Real, 2], Cart[Real, 2])) -> Real)(((A : Cart[Real, 2]), (B : Cart[Real, 2]))) == norm(B - A)")))
}

///|
let length_def_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("length_def")

///|
/// `length_def`
pub fn length_def() -> @kernel.Thm {
  length_def_c.get()
}

///|
/// is_midpoint
fn step_4() -> Unit raise {
  is_midpoint_c.set(@pair.new_definition(@term_syntax.parse_term("(is_midpoint : (Cart[Real, 2], (Cart[Real, 2], Cart[Real, 2])) -> Bool)((m : Cart[Real, 2]), ((a : Cart[Real, 2]), (b : Cart[Real, 2]))) == (m == op_pct(real_of_num(1) / real_of_num(2), a + b))")))
}

///|
let is_midpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_midpoint")

///|
/// `is_midpoint`
pub fn is_midpoint() -> @kernel.Thm {
  is_midpoint_c.get()
}

///|
/// THALES
fn step_5() -> Unit raise {
  let t23 = @tactics.conv_tac(@calc_rat.real_ring)
  let t22 = @simp.simp_tac(@list.List([@vectors.dot(), @vectors.sum_2(), @vectors.vector_sub_component(), @cart.dimindex_2(), @vectors.vector_add_component(), @vectors.orthogonal(), @cart.cart_eq(), @vectors.forall_2(), @vectors.vector_mul_component(), @calc_num.arith()]))
  let t21 = @tactics.pop_assum_list(fn(x20 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t19 = @simp.abbrev_tac(@term_syntax.parse_term("(rad : Real) == pow((radius : Real), 2)"))
  let t18 = @tactics.first_assum(fn(x17 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x14 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s15 = @tactics.mp_tac(x14)
      fn(x16 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s15(x16)
      }
    })(@equal.sym(x17))
  })
  let t13 = @simp.rewrite_tac(@list.List([@vectors.norm_pow_2()]))
  let t9 = @term_syntax.parse_term("(x : Real) => pow(x, 2)")
  let t12 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x11 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x6 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s7 = @tactics.mp_tac(x6)
      fn(x8 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s7(x8)
      }
    })(((x10 : @kernel.Thm) => @equal.ap_term(t9, x10))(x11))
  }))
  let t5 = @simp.rewrite_tac(@list.List([length_def(), between_thm(), is_midpoint()]))
  let t24 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t5), @tactics.strip_tac), t12), t13), t18), t19), t21), t22), t23)
  thales_v1_c.set(@tactics.prove(@term_syntax.parse_term("∀ centre : Cart[Real, 2], ∀ radius : Real, ∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], length((a, centre)) == radius && length((b, centre)) == radius && length((c, centre)) == radius && is_midpoint(centre, (a, b)) → orthogonal(c - a, c - b)"), t24))
}

///|
let thales_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THALES")

///|
/// `THALES`
pub fn thales_v1() -> @kernel.Thm {
  thales_v1_c.get()
}

///|
/// MIDPOINT
fn step_6() -> Unit raise {
  let t39 = @tactics.conv_tac(@sos.real_sos)
  let t38 = @tactics.repeat_tac(@tactics.pop_assum(fn(x35 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s36 = @tactics.mp_tac(x35)
    fn(x37 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s36(x37)
    }
  }))
  let t34 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x31 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s32 = @tactics.subst_all_tac(x31)
    fn(x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s32(x33)
    }
  }))
  let t30 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.strip_assume_tac, fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s28 = @tactics.mp_tac(x27)
    fn(x29 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s28(x29)
    }
  }))
  let t26 = @simp.simp_tac(@list.List([@vectors.dot(), @vectors.sum_2(), @vectors.vector_sub_component(), @cart.dimindex_2(), @vectors.vector_add_component(), @vectors.orthogonal(), @cart.cart_eq(), @vectors.forall_2(), @vectors.vector_mul_component(), @calc_num.arith()]))
  let t25 = @simp.rewrite_tac(@list.List([length_def(), between_thm(), is_midpoint(), @vectors.norm_eq()]))
  let t40 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t25), t26), t30), t34), t38), t39)
  midpoint_c.set(@tactics.prove(@term_syntax.parse_term("∀ m : Cart[Real, 2], ∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], between(m, (a, b)) && length((a, m)) == length((b, m)) → is_midpoint(m, (a, b))"), t40))
}

///|
let midpoint_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("MIDPOINT")

///|
/// `MIDPOINT`
pub fn midpoint() -> @kernel.Thm {
  midpoint_c.get()
}

///|
/// THALES
fn step_7() -> Unit raise {
  let t61 = @tactics.conv_tac(@calc_rat.real_ring)
  let t60 = @simp.simp_tac(@list.List([@vectors.dot(), @vectors.sum_2(), @vectors.vector_sub_component(), @cart.dimindex_2(), @vectors.vector_add_component(), @vectors.orthogonal(), @cart.cart_eq(), @vectors.forall_2(), @vectors.vector_mul_component(), @calc_num.arith()]))
  let t59 = @tactics.pop_assum_list(fn(x58 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t57 = @simp.abbrev_tac(@term_syntax.parse_term("(rad : Real) == pow((radius : Real), 2)"))
  let t56 = @simp.rewrite_tac(@list.List([length_def(), is_midpoint(), @vectors.orthogonal(), @vectors.norm_pow_2()]))
  let t52 = @term_syntax.parse_term("(x : Real) => pow(x, 2)")
  let t55 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x54 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s50 = @tactics.mp_tac(x49)
      fn(x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s50(x51)
      }
    })(((x53 : @kernel.Thm) => @equal.ap_term(t52, x53))(x54))
  }))
  let t48 = @tactics.undisch_then(@term_syntax.parse_term("between((centre : Cart[Real, 2]), ((a : Cart[Real, 2]), (b : Cart[Real, 2])))"), fn(x47 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t45 = @simp.asm_rewrite_tac(@list.List([]))
  let t46 = @list.List([@tactics.then_tac(@tactics.match_mp_tac(midpoint()), t45), @tactics.all_tac])
  let t44 = @tactics.subgoal_then(@term_syntax.parse_term("is_midpoint((centre : Cart[Real, 2]), ((a : Cart[Real, 2]), (b : Cart[Real, 2])))"), fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s42 = @tactics.mp_tac(x41)
    fn(x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s42(x43)
    }
  })
  let t62 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t44), t46), t48), t55), t56), t57), t59), t60), t61)
  thales_c.set(@tactics.prove(@term_syntax.parse_term("∀ centre : Cart[Real, 2], ∀ radius : Real, ∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], length((a, centre)) == radius && length((b, centre)) == radius && length((c, centre)) == radius && between(centre, (a, b)) → orthogonal(c - a, c - b)"), t62))
}

///|
let thales_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("THALES")

///|
/// `THALES`
pub fn thales() -> @kernel.Thm {
  thales_c.get()
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
}
