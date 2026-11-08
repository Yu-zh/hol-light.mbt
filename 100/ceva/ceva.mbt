// Translated from upstream 100/ceva.ml; edit this file directly.

///|
/// 100/ceva.ml:8
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
/// NORM_CROSS
fn step_3() -> Unit raise {
  let t12 = @meson.asm_meson_tac(@list.List([@real.real_lt_mul2(), @realarith.real_lt_refl()]))
  let t9 = @term_syntax.parse_term("(y : Real)")
  let t10 = @bool.specl(@list.List([@term_syntax.parse_term("(x : Real)"), t9]), @real.real_lt_total())
  let t11 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x6 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s7 = @tactics.assume_tac(x6)
    fn(x8 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s7(x8)
    }
  })(t10)
  let t5 = @simp.simp_tac(@list.List([@realarith.real_pow_2()]))
  let t13 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), @tactics.eq_tac), t5), t11), t12)
  let lemma = @tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && real_of_num(0) <= y → (pow(x, 2) == pow(y, 2)) == (x == y)"), t13)
  let t16 = @simp.simp_tac(@list.List([@vectors.norm_pos_le(), @realax.real_le_mul()]))
  let t15 = @tactics.match_mp_tac(@equal.gsym(lemma))
  let t14 = @equal.gsym(@real.real_pow_mul())
  let t17 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@vectors.norm_pow_2()), t14])), t15), t16)
  norm_cross_c.set(@tactics.prove(@term_syntax.parse_term("(norm((a : Cart[Real, _])) * (norm((b : Cart[Real, _])) * norm((c : Cart[Real, _]))) == norm((d : Cart[Real, _])) * (norm((e : Cart[Real, _])) * norm((f : Cart[Real, _])))) == (dot(a, a) * (dot(b, b) * dot(c, c)) == dot(d, d) * (dot(e, e) * dot(f, f)))"), t17))
}

///|
let norm_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_CROSS")

///|
/// `NORM_CROSS`
pub fn norm_cross() -> @kernel.Thm {
  norm_cross_c.get()
}

///|
/// COLLINEAR
fn step_4() -> Unit raise {
  let t22 = @tactics.conv_tac(@calc_rat.real_field)
  let t21 = @tactics.repeat_tac(@tactics.pop_assum(fn(x18 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s19 = @tactics.mp_tac(x18)
    fn(x20 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s19(x20)
    }
  }))
  let t23 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.exists_tac(@term_syntax.parse_term("(x1 : Real) / (y1 : Real)"))), t21), t22)
  let lemma = @tactics.prove(@term_syntax.parse_term("!((y1 : Real) == real_of_num(0)) && (x2 : Real) * y1 == (x1 : Real) * (y2 : Real) → (∃ c : Real, x1 == c * y1 && x2 == c * y2)"), t23)
  let t62 = @tactics.conv_tac(@calc_rat.real_field)
  let t61 = @tactics.repeat_tac(@tactics.pop_assum(fn(x58 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s59 = @tactics.mp_tac(x58)
    fn(x60 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s59(x60)
    }
  }))
  let t57 = @tactics.match_mp_tac(lemma)
  let t56 = @tactics.first_x_assum(@tactics.conjuncts_then(@tactics.repeat_tcl(@tactics.strip_thm_then)(fn(x53 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s54 = @tactics.subst1_tac(x53)
    fn(x55 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s54(x55)
    }
  })))
  let t52 = @list.List([@tactics.all_tac, @simp.once_rewrite_tac(@list.List([@theorems.conj_sym()]))])
  let t51 = @simp.simp_tac(@list.List([@cart.cart_eq(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_mul_component(), @vectors.vector_sub_component(), @calc_num.arith()]))
  let t50 = @simp.rewrite_tac(@list.List([@cart.dimindex_2(), @vectors.forall_2(), @calc_num.arith(), @class.de_morgan_thm()]))
  let t47 = @simp.gen_rewrite_rule(fn(x44 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s45 = @equal.rand_conv(x44)
    fn(x46 : @kernel.Term) -> @kernel.Thm raise {
      s45(x46)
    }
  }, @list.List([@cart.cart_eq()]))
  let t49 = @tactics.first_x_assum(fn(x48 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s42 = @tactics.mp_tac(x41)
      fn(x43 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s42(x43)
      }
    })(t47(x48))
  })
  let t40 = @tactics.repeat_tac(@tactics.gen_tac)
  let t39 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t38 = @tactics.exists_tac(@term_syntax.parse_term("(a : Cart[Real, 2]) - (b : Cart[Real, 2])"))
  let t36 = @simp.simp_tac(@list.List([@vectors.vector_mul_component(), @cart.dimindex_2(), @calc_num.arith()]))
  let t35 = @simp.asm_simp_tac(@list.List([@equal.gsym(@vectors.vector_sub_component()), @cart.dimindex_2(), @calc_num.arith()]))
  let t34 = @tactics.repeat_tac(@tactics.strip_tac)
  let t33 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.not_in_empty()]))
  let t37 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.choose_then(fn(x28 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x28
    let t31 = @term_syntax.parse_term("(c : Cart[Real, 2])")
    let t32 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(b : Cart[Real, 2])"), t31]), th))
    let t30 = @term_syntax.parse_term("(b : Cart[Real, 2])")
    @tactics.then_tac(@tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Cart[Real, 2])"), t30]), th)), t32)
  })), t33), t34), t35), t36), @calc_rat.real_arith_tac), @tactics.all_tac])
  let t27 = @simp.rewrite_tac(@list.List([@vectors.collinear()]))
  let t25 = @simp.rewrite_tac(@list.List([@vectors.collinear_sing(), @vectors.collinear_2(), @sets.insert_ac()]))
  let t26 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@real.real_sub_refl(), @calc_int.real_mul_rzero(), @calc_int.real_mul_lzero()])), t25), @tactics.all_tac])
  let t24 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Cart[Real, 2]) == (b : Cart[Real, 2])"))
  let t63 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t24), t26), t27), @tactics.eq_tac), t37), @tactics.disch_tac), t38), t39), t40), @tactics.disch_tac), t49), t50), @tactics.strip_tac), t51), t52), t56), t57), t61), t62)
  collinear_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], collinear(INSERT(a, INSERT(b, INSERT(c, EMPTY)))) == ((op_dollar(a, 1) - op_dollar(b, 1)) * (op_dollar(b, 2) - op_dollar(c, 2)) == (op_dollar(a, 2) - op_dollar(b, 2)) * (op_dollar(b, 1) - op_dollar(c, 1)))"), t63))
}

///|
let collinear_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COLLINEAR")

///|
/// `COLLINEAR`
pub fn collinear() -> @kernel.Thm {
  collinear_c.get()
}

///|
/// CEVA_WEAK
fn step_5() -> Unit raise {
  let t90 = @tactics.conv_tac(@calc_rat.real_ring)
  let t89 = @tactics.first_x_assum(fn(x88 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x81 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s82 = @tactics.mp_tac(x81)
      fn(x83 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s82(x83)
      }
    })(((x87 : @kernel.Thm) => @lib.check(fn(x86 : @kernel.Thm) -> Bool raise {
      (fn(x84 : @kernel.Term) -> Bool raise {
        @basics.is_neg(x84)
      })((fn(x85 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x85)
      })(x86))
    }, x87))(x88))
  })
  let t80 = @simp.simp_tac(@list.List([@vectors.dot(), @vectors.sum_2(), @vectors.vector_sub_component(), @cart.dimindex_2(), @vectors.vector_add_component(), @cart.cart_eq(), @vectors.forall_2(), @vectors.vector_mul_component(), @calc_num.arith()]))
  let t79 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x78 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s76 = @tactics.mp_tac(x75)
      fn(x77 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s76(x77)
      }
    })(@equal.sym(x78))
  }))
  let t74 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x73 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x65 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s66 = @tactics.subst_all_tac(x65)
      fn(x67 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s66(x67)
      }
    })(((x72 : @kernel.Thm) => @lib.check(fn(x71 : @kernel.Thm) -> Bool raise {
      (fn(x69 : @kernel.Term) -> Bool raise {
        (fn(x68 : @kernel.Term) -> Bool raise {
          @kernel.is_var(x68)
        })(@equal.lhs(x69))
      })((fn(x70 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x70)
      })(x71))
    }, x72))(x73))
  }))
  let t64 = @simp.rewrite_tac(@list.List([@vectors.dist(), norm_cross(), collinear(), between_thm()]))
  let t91 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t64), @tactics.strip_tac), t74), t79), t80), t89), t90)
  ceva_weak_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ X : Cart[Real, 2], ∀ Y : Cart[Real, 2], ∀ Z : Cart[Real, 2], ∀ P : Cart[Real, 2], !collinear({A, B, C}) && between(X, (B, C)) && between(Y, (A, C)) && between(Z, (A, B)) && between(P, (A, X)) && between(P, (B, Y)) && between(P, (C, Z)) → distance((B, X)) * (distance((C, Y)) * distance((A, Z))) == distance((X, C)) * (distance((Y, A)) * distance((Z, B)))"), t91))
}

///|
let ceva_weak_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CEVA_WEAK")

///|
/// `CEVA_WEAK`
pub fn ceva_weak() -> @kernel.Thm {
  ceva_weak_c.get()
}

///|
/// CEVA
fn step_6() -> Unit raise {
  let t203 = @simp.asm_simp_tac(@list.List([@real.real_le_rmul(), @calc_rat.real_arith(@term_syntax.parse_term("(x : Real) <= real_of_num(1) → real_of_num(0) <= real_of_num(1) - x"))]))
  let t202 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) * (real_of_num(1) - (x : Real))"))
  let t201 = @tactics.match_mp_tac(@realarith.real_let_trans())
  let t200 = @simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @real.real_lt_01()]))
  let t199 = @class.asm_cases_tac(@term_syntax.parse_term("(z : Real) == real_of_num(0)"))
  let t198 = @tactics.match_mp_tac(@calc_rat.real_arith(@term_syntax.parse_term("(z : Real) * (real_of_num(1) - (x : Real)) < real_of_num(1) → !(x + (real_of_num(1) - x) * (real_of_num(1) - z) == real_of_num(0))")))
  let t196 = @tactics.conv_tac(@calc_rat.real_field)
  let t197 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.repeat_tac(@tactics.first_x_assum(fn(x195 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x186 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s187 = @tactics.mp_tac(x186)
      fn(x188 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s187(x188)
      }
    })(((x194 : @kernel.Thm) => @lib.check(fn(x193 : @kernel.Thm) -> Bool raise {
      (fn(x191 : @kernel.Term) -> Bool raise {
        (fn(x189 : Bool) -> Bool raise {
          !x189
        })((fn(x190 : @kernel.Term) -> Bool raise {
          @basics.is_neg(x190)
        })(x191))
      })((fn(x192 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x192)
      })(x193))
    }, x194))(x195))
  })), t196)])
  let t185 = @tactics.subgoal_then(@term_syntax.parse_term("!((x : Real) + (real_of_num(1) - x) * (real_of_num(1) - (z : Real)) == real_of_num(0))"), fn(x182 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s183 = @tactics.mp_tac(x182)
    fn(x184 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s183(x184)
    }
  })
  let t181 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) - (real_of_num(1) - (z : Real)) / ((x : Real) + (real_of_num(1) - x) * (real_of_num(1) - z))"))
  let t179 = @tactics.conv_tac(@calc_rat.real_field)
  let t178 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x177 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x168 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s169 = @tactics.mp_tac(x168)
      fn(x170 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s169(x170)
      }
    })(((x176 : @kernel.Thm) => @lib.check(fn(x175 : @kernel.Thm) -> Bool raise {
      (fn(x173 : @kernel.Term) -> Bool raise {
        (fn(x171 : Bool) -> Bool raise {
          !x171
        })((fn(x172 : @kernel.Term) -> Bool raise {
          @basics.is_neg(x172)
        })(x173))
      })((fn(x174 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x174)
      })(x175))
    }, x176))(x177))
  }))
  let t180 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) - (y : Real) / (real_of_num(1) - (x : Real) + x * y)")), t178), t179), @tactics.all_tac])
  let t167 = @class.asm_cases_tac(@term_syntax.parse_term("(x : Real) == real_of_num(0)"))
  let t166 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([collinear()])))
  let t164 = @tactics.conv_tac(@sos.real_sos)
  let t161 = @tactics.conv_tac(@sos.real_sos)
  let t162 = @list.List([@tactics.orelse_tac(@tactics.conv_tac(@calc_rat.real_ring), t161), @tactics.all_tac])
  let t163 = @tactics.repeat_tac(@tactics.thenl(@tactics.then_tac(@tactics.match_mp_tac(@class.taut(@term_syntax.parse_term("((a : Bool) → (b : Bool) && (c : Bool)) && (a && b && c → (d : Bool)) → a → b && c && d"))), @tactics.conj_tac), t162))
  let t160 = @simp.rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t165 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.repeat_tac(@tactics.first_x_assum(fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x150 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s151 = @tactics.mp_tac(x150)
      fn(x152 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s151(x152)
      }
    })(((x158 : @kernel.Thm) => @lib.check(fn(x157 : @kernel.Thm) -> Bool raise {
      (fn(x155 : @kernel.Term) -> Bool raise {
        (fn(x153 : Bool) -> Bool raise {
          !x153
        })((fn(x154 : @kernel.Term) -> Bool raise {
          @basics.is_neg(x154)
        })(x155))
      })((fn(x156 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x156)
      })(x157))
    }, x158))(x159))
  }))), t160), t163), t164), @tactics.all_tac])
  let t149 = @tactics.match_mp_tac(@meson.meson(@list.List([]), @term_syntax.parse_term("(∀ x : _, (p : (_) -> Bool)(x) && (q : (_) -> Bool)(x) → (r : (_) -> Bool)(x)) && (∃ x : _, p(x) && q(x)) → (∃ x : _, p(x) && q(x) && r(x))")))
  let t148 = @simp.rewrite_tac(@list.List([@theorems.unwind_thm2()]))
  let t146 = @simp.asm_rewrite_tac(@list.List([]))
  let t143 = @tactics.exists_tac(@term_syntax.parse_term("(w : Real)"))
  let t144 = @tactics.exists_tac(@term_syntax.parse_term("(v : Real)"))
  let t145 = @list.List([@tactics.exists_tac(@term_syntax.parse_term("(u : Real)")), t144, t143])
  let t142 = @tactics.repeat_tac(@tactics.conj_tac)
  let t147 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("op_pct((u : Real), (A : Cart[Real, 2])) + (op_pct((v : Real), (B : Cart[Real, 2])) + op_pct((w : Real), (C : Cart[Real, 2])))")), t142), t145), t146), @vectors.vector_arith_tac)])
  let t141 = @tactics.subgoal_then(@term_syntax.parse_term("∃ u : Real, ∃ v : Real, ∃ w : Real, w == (real_of_num(1) - u) * (real_of_num(1) - (x : Real)) && v == (real_of_num(1) - u) * x && u == (real_of_num(1) - v) * (real_of_num(1) - (y : Real)) && u == (real_of_num(1) - w) * (z : Real) && v == (real_of_num(1) - w) * (real_of_num(1) - z) && w == (real_of_num(1) - v) * y && real_of_num(0) <= u && u <= real_of_num(1) && real_of_num(0) <= v && v <= real_of_num(1) && real_of_num(0) <= w && w <= real_of_num(1)"), fn(x140 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.strip_assume_tac(@equal.gsym(x140))
  })
  let t139 = @simp.rewrite_tac(@list.List([@vectors.vector_add_ldistrib(), @vectors.vector_mul_assoc()]))
  let t137 = @tactics.conv_tac(@calc_rat.real_ring)
  let t136 = @simp.simp_tac(@list.List([@vectors.dot(), @vectors.sum_2(), @vectors.vector_sub_component(), @cart.dimindex_2(), @vectors.forall_2(), @vectors.vector_add_component(), @cart.cart_eq(), @vectors.vector_mul_component(), @calc_num.arith()]))
  let t134 = @simp.gen_rewrite_rule(fn(x131 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s132 = @equal.rand_conv(x131)
    fn(x133 : @kernel.Term) -> @kernel.Thm raise {
      s132(x133)
    }
  }, @list.List([collinear()]))
  let t138 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x135 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x128 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s129 = @tactics.mp_tac(x128)
      fn(x130 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s129(x130)
      }
    })(t134(x135))
  }), t136), t137)])
  let t127 = @simp.asm_rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(0) <= real_of_num(1) - (x : Real)) == (x <= real_of_num(1))")), @realax.real_abs()]))
  let t126 = @simp.asm_rewrite_tac(@list.List([@vectors.norm_eq_0(), @vectors.vector_sub_eq()]))
  let t125 = @simp.rewrite_tac(@list.List([@realax.real_mul_assoc(), @real.real_eq_mul_rcancel(), @realarith.real_entire()]))
  let t124 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(a : Real) * (a' : Real) * ((b : Real) * (b' : Real) * ((c : Real) * (c' : Real))) == a * (b * c) * (a' * (b' * c'))"))]))
  let t123 = @simp.rewrite_tac(@list.List([@vectors.norm_mul()]))
  let t121 = @vectors.vector_arith(@term_syntax.parse_term("op_pct((x : Real), (B : Cart[Real, _])) + op_pct(real_of_num(1) - x, (C : Cart[Real, _])) - C == op_pct(x, B - C)"))
  let t122 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(B : Cart[Real, _]) - (op_pct((x : Real), B) + op_pct(real_of_num(1) - x, (C : Cart[Real, _]))) == op_pct(real_of_num(1) - x, B - C)")), t121]))
  let t120 = @simp.rewrite_tac(@list.List([@vectors.dist()]))
  let t119 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x116 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s117 = @tactics.subst_all_tac(x116)
    fn(x118 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s117(x118)
    }
  }))
  let t115 = @tactics.repeat_tac(@tactics.first_x_assum(@tactics.conjuncts_then(@tactics.strip_assume_tac)))
  let t112 = @term_syntax.parse_term("(z : Real)")
  let t110 = @term_syntax.parse_term("(y : Real)")
  let t114 = @tactics.disch_then(@tactics.conjuncts_then2((x111 : @kernel.Thm) => @tactics.x_choose_tac(t110, x111), (x113 : @kernel.Thm) => @tactics.x_choose_tac(t112, x113)))
  let t104 = @term_syntax.parse_term("(x : Real)")
  let t109 = @tactics.disch_then(@tactics.conjuncts_then2((x105 : @kernel.Thm) => @tactics.x_choose_tac(t104, x105), fn(x106 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s107 = @tactics.mp_tac(x106)
    fn(x108 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s107(x108)
    }
  }))
  let t103 = @simp.rewrite_tac(@list.List([between_thm()]))
  let t102 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x96 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s97 = @tactics.assume_tac(x96)
    fn(x98 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s97(x98)
    }
  }, fn(x99 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s100 = @tactics.mp_tac(x99)
    fn(x101 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s100(x101)
    }
  }))
  let t95 = @simp.asm_rewrite_tac(@list.List([@sets.insert_ac(), @vectors.collinear_sing(), @vectors.collinear_2()]))
  let t92 = @term_syntax.parse_term("(B : Cart[Real, 2]) == (C : Cart[Real, 2])")
  let t93 = @term_syntax.parse_term("(A : Cart[Real, 2]) == (C : Cart[Real, 2])")
  let t94 = @tactics.map_every(@class.asm_cases_tac, @list.List([@term_syntax.parse_term("(A : Cart[Real, 2]) == (B : Cart[Real, 2])"), t93, t92]))
  let t204 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t94), t95), t102), t103), t109), t114), t115), t119), t120), t122), t123), t124), t125), t126), t127), @tactics.eq_tac), t138), @tactics.disch_tac), t139), t141), t147), t148), t149), @tactics.conj_tac), t165), t166), t167), t180), t181), t185), t197), t198), t199), t200), t201), t202), t203), @calc_rat.asm_real_arith_tac)
  ceva_c.set(@tactics.prove(@term_syntax.parse_term("∀ A : Cart[Real, 2], ∀ B : Cart[Real, 2], ∀ C : Cart[Real, 2], ∀ X : Cart[Real, 2], ∀ Y : Cart[Real, 2], ∀ Z : Cart[Real, 2], !collinear({A, B, C}) && between(X, (B, C)) && between(Y, (C, A)) && between(Z, (A, B)) → (distance((B, X)) * (distance((C, Y)) * distance((A, Z))) == distance((X, C)) * (distance((Y, A)) * distance((Z, B)))) == (∃ P : Cart[Real, 2], between(P, (A, X)) && between(P, (B, Y)) && between(P, (C, Z)))"), t204))
}

///|
let ceva_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CEVA")

///|
/// `CEVA`
pub fn ceva() -> @kernel.Thm {
  ceva_c.get()
}

///|
/// BETWEEN_SYM
fn step_7() -> Unit raise {
  let t216 = @tactics.pop_assum(fn(x213 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s214 = @tactics.mp_tac(x213)
    fn(x215 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s214(x215)
    }
  })
  let t212 = @tactics.try_tac(@vectors.vector_arith_tac)
  let t211 = @tactics.repeat_tac(@tactics.conj_tac)
  let t210 = @simp.asm_rewrite_tac(@list.List([]))
  let t209 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(1) - (u : Real)"))
  let t206 = @term_syntax.parse_term("(u : Real)")
  let t208 = @tactics.disch_then((x207 : @kernel.Thm) => @tactics.x_choose_tac(t206, x207))
  let t205 = @simp.rewrite_tac(@list.List([between_thm()]))
  let t217 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t205), @tactics.eq_tac), t208), t209), t210), t211), t212), t216), @calc_rat.real_arith_tac)
  between_sym_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, _], ∀ v : Cart[Real, _], ∀ w : Cart[Real, _], between(v, (u, w)) == between(v, (w, u))"), t217))
}

///|
let between_sym_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BETWEEN_SYM")

///|
/// `BETWEEN_SYM`
pub fn between_sym() -> @kernel.Thm {
  between_sym_c.get()
}

///|
/// BETWEEN_METRICAL
fn step_8() -> Unit raise {
  let t254 = @tactics.first_x_assum(fn(x253 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x250 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s251 = @tactics.mp_tac(x250)
      fn(x252 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s251(x252)
      }
    })(@equal.sym(x253))
  })
  let t249 = @simp.asm_simp_tac(@list.List([@real.real_lt_imp_nz(), @real.real_div_lmul()]))
  let t248 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((x : Real), (y : Cart[Real, _]) + op_pct((z : Real), (v : Cart[Real, _]))) == op_pct(x, y) + op_pct(x * z, v)"))]))
  let t247 = @simp.asm_simp_tac(@list.List([@real.real_lt_imp_nz()]))
  let t246 = @tactics.exists_tac(@term_syntax.parse_term("norm((u : Cart[Real, N]) - (v : Cart[Real, N])) + norm(v - (w : Cart[Real, N]))"))
  let t245 = @tactics.match_mp_tac(@vectors.vector_mul_lcancel_imp())
  let t244 = @simp.asm_simp_tac(@list.List([@real.real_le_rdiv_eq(), @real.real_le_ldiv_eq(), @calc_int.real_mul_lzero(), @realax.real_mul_lid(), @real.real_le_addr(), @vectors.norm_pos_le()]))
  let t243 = @tactics.exists_tac(@term_syntax.parse_term("norm((u : Cart[Real, N]) - (v : Cart[Real, N])) / (norm(u - v) + norm(v - (w : Cart[Real, N])))"))
  let t241 = @simp.asm_rewrite_tac(@list.List([@realarith.real_pos()]))
  let t240 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(0)"))
  let t239 = @simp.rewrite_tac(@list.List([@vectors.norm_pos_le(), @vectors.norm_eq_0(), @vectors.vector_sub_eq()]))
  let t237 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("!(real_of_num(0) < (x : Real) + (y : Real)) → real_of_num(0) <= x && real_of_num(0) <= y → x == real_of_num(0) && y == real_of_num(0)")))
  let t242 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.first_x_assum(fn(x238 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x234 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s235 = @tactics.mp_tac(x234)
      fn(x236 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s235(x236)
      }
    })(t237(x238))
  }), t239), @tactics.strip_tac), t240), t241), @vectors.vector_arith_tac)])
  let t233 = @class.asm_cases_tac(@term_syntax.parse_term("real_of_num(0) < norm((u : Cart[Real, N]) - (v : Cart[Real, N])) + norm(v - (w : Cart[Real, N]))"))
  let t231 = @simp.rewrite_tac(@list.List([@vectors.norm_sub(), @real.real_mul_ac()]))
  let t229 = @calc_rat.real_arith(@term_syntax.parse_term("real_of_num(0) <= (c : Real) → abs(c) == c"))
  let t230 = @simp.asm_simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(c : Real) <= real_of_num(1) → abs(real_of_num(1) - c) == real_of_num(1) - c")), t229]))
  let t228 = @simp.rewrite_tac(@list.List([@vectors.vector_mul_assoc(), @vectors.norm_mul()]))
  let t227 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((a : Real), -op_pct((c : Real), (x : Cart[Real, _]) - (y : Cart[Real, _]))) == op_pct(a * c, y - x)"))]))
  let t225 = @vectors.vector_arith(@term_syntax.parse_term("(u : Cart[Real, _]) + op_pct((c : Real), (w : Cart[Real, _]) - u) - w == op_pct(real_of_num(1) - c, u - w)"))
  let t226 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("(u : Cart[Real, N]) - (u + (x : Cart[Real, N])) == -x")), @vectors.norm_neg(), t225]))
  let t232 = @list.List([@tactics.all_tac, @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @simp.asm_rewrite_tac(@list.List([]))), t226), t227), t228), t230), t231)])
  let t224 = @simp.rewrite_tac(@list.List([@vectors.norm_triangle_eq()]))
  let t223 = @tactics.conv_tac(@equal.land_conv(@equal.sym_conv))
  let t222 = @tactics.subst1_tac(@vectors.vector_arith(@term_syntax.parse_term("(u : Cart[Real, N]) - (w : Cart[Real, N]) == u - (v : Cart[Real, N]) + (v - w)")))
  let t221 = @simp.rewrite_tac(@list.List([@vectors.vector_arith(@term_syntax.parse_term("op_pct((x : Real), (u : Cart[Real, _])) + op_pct(real_of_num(1) - x, (v : Cart[Real, _])) == v + op_pct(x, u - v)"))]))
  let t220 = @simp.rewrite_tac(@list.List([between_thm(), @vectors.dist()]))
  let t219 = @simp.once_rewrite_tac(@list.List([between_sym()]))
  let t218 = @tactics.conv_tac(@equal.sym_conv)
  let t255 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t218), t219), t220), t221), t222), t223), t224), @tactics.eq_tac), t232), @tactics.disch_tac), t233), t242), t243), t244), t245), t246), t247), t248), t249), t254), @vectors.vector_arith_tac)
  between_metrical_c.set(@tactics.prove(@term_syntax.parse_term("∀ u : Cart[Real, N], ∀ v : Cart[Real, N], ∀ w : Cart[Real, N], between(v, (u, w)) == (distance((u, v)) + distance((v, w)) == distance((u, w)))"), t255))
}

///|
let between_metrical_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("BETWEEN_METRICAL")

///|
/// `BETWEEN_METRICAL`
pub fn between_metrical() -> @kernel.Thm {
  between_metrical_c.get()
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
}
