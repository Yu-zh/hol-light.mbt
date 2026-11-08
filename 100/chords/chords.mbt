// Translated from upstream 100/chords.ml; edit this file directly.

///|
/// 100/chords.ml:7
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
/// length
fn step_3() -> Unit raise {
  length_c.set(@pair.new_definition(@term_syntax.parse_term("(length : ((Cart[Real, 2], Cart[Real, 2])) -> Real)(((A : Cart[Real, 2]), (B : Cart[Real, 2]))) == norm(B - A)")))
}

///|
let length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("length")

///|
/// `length`
pub fn length() -> @kernel.Thm {
  length_c.get()
}

///|
/// lemma
fn step_4() -> Unit raise {
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
  lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, real_of_num(0) <= x && real_of_num(0) <= y → (pow(x, 2) == pow(y, 2)) == (x == y)"), t13))
}

///|
let lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("lemma")

///|
/// `lemma`
pub fn lemma() -> @kernel.Thm {
  lemma_c.get()
}

///|
/// NORM_CROSS
fn step_5() -> Unit raise {
  let t16 = @simp.simp_tac(@list.List([@vectors.norm_pos_le(), @realax.real_le_mul()]))
  let t15 = @tactics.match_mp_tac(@equal.gsym(lemma()))
  let t14 = @equal.gsym(@real.real_pow_mul())
  let t17 = @tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.gsym(@vectors.norm_pow_2()), t14])), t15), t16)
  norm_cross_c.set(@tactics.prove(@term_syntax.parse_term("(norm((a : Cart[Real, _])) * norm((b : Cart[Real, _])) == norm((c : Cart[Real, _])) * norm((d : Cart[Real, _]))) == (dot(a, a) * dot(b, b) == dot(c, c) * dot(d, d))"), t17))
}

///|
let norm_cross_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NORM_CROSS")

///|
/// `NORM_CROSS`
pub fn norm_cross() -> @kernel.Thm {
  norm_cross_c.get()
}

///|
/// SEGMENT_CHORDS
fn step_6() -> Unit raise {
  let t48 = @tactics.conv_tac(@calc_rat.real_ring)
  let t47 = @simp.simp_tac(@list.List([@vectors.dot(), @vectors.sum_2(), @vectors.vector_sub_component(), @cart.dimindex_2(), @vectors.vector_add_component(), @cart.cart_eq(), @vectors.forall_2(), @vectors.vector_mul_component(), @calc_num.arith()]))
  let t46 = @tactics.pop_assum_list(fn(x45 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t44 = @simp.abbrev_tac(@term_syntax.parse_term("(rad : Real) == pow((radius : Real), 2)"))
  let t43 = @simp.rewrite_tac(@list.List([@vectors.norm_pow_2()]))
  let t42 = @tactics.first_x_assum(fn(x41 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x38 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s39 = @tactics.mp_tac(x38)
      fn(x40 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s39(x40)
      }
    })(@equal.sym(x41))
  })
  let t34 = @term_syntax.parse_term("(x : Real) => pow(x, 2)")
  let t37 = @tactics.disch_then(@tactics.repeat_tcl(@tactics.conjuncts_then)(fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x31 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s32 = @tactics.mp_tac(x31)
      fn(x33 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s32(x33)
      }
    })(((x35 : @kernel.Thm) => @equal.ap_term(t34, x35))(x36))
  }))
  let t30 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(v : Real)"))(@tactics.strip_assume_tac), fn(x27 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s28 = @tactics.mp_tac(x27)
    fn(x29 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s28(x29)
    }
  }))
  let t26 = @tactics.first_x_assum(fn(x23 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s24 = @tactics.subst_all_tac(x23)
    fn(x25 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s24(x25)
    }
  })
  let t22 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(u : Real)"))(@tactics.strip_assume_tac), fn(x19 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s20 = @tactics.mp_tac(x19)
    fn(x21 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s20(x21)
    }
  }))
  let t18 = @simp.rewrite_tac(@list.List([length(), norm_cross(), between_thm()]))
  let t49 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t18), t22), t26), t30), t37), t42), t43), t44), t46), t47), t48)
  segment_chords_c.set(@tactics.prove(@term_syntax.parse_term("∀ centre : Cart[Real, 2], ∀ radius : Real, ∀ q : Cart[Real, 2], ∀ r : Cart[Real, 2], ∀ s : Cart[Real, 2], ∀ t : Cart[Real, 2], ∀ b : Cart[Real, 2], between(b, (q, r)) && between(b, (s, t)) && length((q, centre)) == radius && length((r, centre)) == radius && length((s, centre)) == radius && length((t, centre)) == radius → length((q, b)) * length((b, r)) == length((s, b)) * length((b, t))"), t49))
}

///|
let segment_chords_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SEGMENT_CHORDS")

///|
/// `SEGMENT_CHORDS`
pub fn segment_chords() -> @kernel.Thm {
  segment_chords_c.get()
}

///|
fn load_steps() -> Unit raise {
  step_1()
  step_2()
  step_3()
  step_4()
  step_5()
  step_6()
}
