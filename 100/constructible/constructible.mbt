// Translated from upstream 100/constructible.ml; edit this file directly.

///|
/// 100/constructible.ml:15
fn step_1() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// STEP_LEMMA
fn step_2() -> Unit raise {
  let t69 = @tactics.conv_tac(@calc_rat.real_ring)
  let t68 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x67 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x58 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s59 = @tactics.mp_tac(x58)
      fn(x60 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s59(x60)
      }
    })(((x66 : @kernel.Thm) => @lib.check(fn(x65 : @kernel.Thm) -> Bool raise {
      (fn(x63 : @kernel.Term) -> Bool raise {
        (fn(x61 : Bool) -> Bool raise {
          !x61
        })((fn(x62 : @kernel.Term) -> Bool raise {
          @basics.is_forall(x62)
        })(x63))
      })((fn(x64 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x64)
      })(x65))
    }, x66))(x67))
  }))
  let t57 = @simp.asm_simp_tac(@list.List([]))
  let t56 = @tactics.exists_tac(@term_syntax.parse_term("-((a : Real) + real_of_num(2) * (u : Real))"))
  let t52 = @tactics.repeat_tac(@tactics.conj_tac)
  let t53 = @tactics.then_tac(@tactics.first_assum(@tactics.match_mp_tac), t52)
  let t54 = @tactics.repeat_tac(@tactics.orelse_tac(@tactics.first_assum(fn(x49 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s50 = @tactics.match_accept_tac(x49)
    fn(x51 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s50(x51)
    }
  }), t53))
  let t48 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pow((x : Real), 3) == x * (x * x)")), @realarith.real_pow_2()]))
  let t47 = @tactics.map_every(fn(x44 : String) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s45 = @simp.expand_tac(x44)
    fn(x46 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s45(x46)
    }
  }, @list.List(["A", "B"]))
  let t43 = @simp.asm_rewrite_tac(@list.List([]))
  let t42 = @tactics.first_assum(@tactics.match_mp_tac)
  let t41 = @tactics.first_assum(@tactics.match_mp_tac)
  let t40 = @simp.rewrite_tac(@list.List([@realax.real_div()]))
  let t39 = @tactics.disch_then(fn(x36 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s37 = @tactics.subst1_tac(x36)
    fn(x38 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s37(x38)
    }
  })
  let t35 = @simp.asm_rewrite_tac(@list.List([]))
  let t32 = @drule.match_mp(@calc_rat.real_field(@term_syntax.parse_term("(A : Real) + (B : Real) * (s : Real) == real_of_num(0) → !(B == real_of_num(0)) → s == -A / B")))
  let t34 = @tactics.first_x_assum(fn(x33 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x29 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s30 = @tactics.mp_tac(x29)
      fn(x31 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s30(x31)
      }
    })(t32(x33))
  })
  let t28 = @simp.rewrite_tac(@list.List([]))
  let t27 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@class.contrapos_thm())]))
  let t55 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!(P : (Real) -> Bool)((s : Real))")), t27), @tactics.disch_tac), t28), t34), t35), t39), t40), t41), @tactics.conj_tac), t42), t43), t47), t48), t54), @tactics.all_tac])
  let t26 = @tactics.subgoal_then(@term_syntax.parse_term("(B : Real) == real_of_num(0)"), fn(x23 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s24 = @tactics.assume_tac(x23)
    fn(x25 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s24(x25)
    }
  })
  let t22 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t21 = @class.asm_cases_tac(@term_syntax.parse_term("(P : (Real) -> Bool)((s : Real))"))
  let t19 = @tactics.conv_tac(@calc_rat.real_ring)
  let t20 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.first_x_assum(fn(x18 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x15 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s16 = @tactics.mp_tac(x15)
      fn(x17 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s16(x17)
      }
    })(@equal.sym(x18))
  })), t19), @tactics.all_tac])
  let t14 = @tactics.subgoal_then(@term_syntax.parse_term("(A : Real) + (B : Real) * (s : Real) == real_of_num(0)"), fn(x11 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s12 = @tactics.assume_tac(x11)
    fn(x13 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s12(x13)
    }
  })
  let t9 = @term_syntax.parse_term("(B : Real) == pow((s : Real), 2) * pow((v : Real), 3) + (real_of_num(2) * ((a : Real) * ((u : Real) * v)) + (real_of_num(3) * (pow(u, 2) * v) + (b : Real) * v))")
  let t10 = @tactics.map_every(@simp.abbrev_tac, @list.List([@term_syntax.parse_term("(A : Real) == (a : Real) * (pow((s : Real), 2) * pow((v : Real), 2)) + (real_of_num(3) * (pow(s, 2) * ((u : Real) * pow(v, 2))) + (a * pow(u, 2) + (pow(u, 3) + ((b : Real) * u + (c : Real)))))"), t9]))
  let t8 = @tactics.first_x_assum(fn(x5 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s6 = @tactics.subst_all_tac(x5)
    fn(x7 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s6(x7)
    }
  })
  let t3 = @meson.meson_tac(@list.List([]))
  let t4 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@calc_int.real_add_rid()])), t3), @tactics.all_tac])
  let t2 = @class.asm_cases_tac(@term_syntax.parse_term("(v : Real) * (s : Real) == real_of_num(0)"))
  let t1 = @tactics.repeat_tac(@tactics.gen_tac)
  let t70 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t1), t2), t4), @tactics.strip_tac), t8), t10), t14), t20), t21), t22), t26), t55), t56), t57), t68), t69)
  step_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Real) -> Bool, (∀ n : Num, P(real_of_num(n))) && (∀ x : Real, P(x) → P(-x)) && (∀ x : Real, P(x) && !(x == real_of_num(0)) → P(inv(x))) && (∀ x : Real, ∀ y : Real, P(x) && P(y) → P(x + y)) && (∀ x : Real, ∀ y : Real, P(x) && P(y) → P(x * y)) → (∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ z : Real, ∀ u : Real, ∀ v : Real, ∀ s : Real, P(a) && P(b) && P(c) && pow(z, 3) + (a * pow(z, 2) + (b * z + c)) == real_of_num(0) && P(u) && P(v) && P(s * s) && z == u + v * s → (∃ w : Real, P(w) && pow(w, 3) + (a * pow(w, 2) + (b * w + c)) == real_of_num(0)))"), t70))
}

///|
let step_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_LEMMA")

///|
/// `STEP_LEMMA`
pub fn step_lemma() -> @kernel.Thm {
  step_lemma_c.get()
}

///|
/// STEP_LEMMA_SQRT
fn step_3() -> Unit raise {
  let t78 = @meson.asm_meson_tac(@list.List([@real.sqrt_pow_2(), @realarith.real_pow_2()]))
  let t77 = @tactics.first_x_assum(@tactics.match_mp_tac)
  let t76 = @tactics.repeat_tac(@tactics.strip_tac)
  let t74 = @drule.match_mp(step_lemma())
  let t79 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x75 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x71 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s72 = @tactics.assume_tac(x71)
      fn(x73 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s72(x73)
      }
    })(t74(x75))
  })), t76), t77), t78)
  step_lemma_sqrt_c.set(@tactics.prove(@term_syntax.parse_term("∀ P : (Real) -> Bool, (∀ n : Num, P(real_of_num(n))) && (∀ x : Real, P(x) → P(-x)) && (∀ x : Real, P(x) && !(x == real_of_num(0)) → P(inv(x))) && (∀ x : Real, ∀ y : Real, P(x) && P(y) → P(x + y)) && (∀ x : Real, ∀ y : Real, P(x) && P(y) → P(x * y)) → (∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ z : Real, ∀ u : Real, ∀ v : Real, ∀ s : Real, P(a) && P(b) && P(c) && pow(z, 3) + (a * pow(z, 2) + (b * z + c)) == real_of_num(0) && P(u) && P(v) && P(s) && real_of_num(0) <= s && z == u + v * sqrt(s) → (∃ w : Real, P(w) && pow(w, 3) + (a * pow(w, 2) + (b * w + c)) == real_of_num(0)))"), t79))
}

///|
let step_lemma_sqrt_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("STEP_LEMMA_SQRT")

///|
/// `STEP_LEMMA_SQRT`
pub fn step_lemma_sqrt() -> @kernel.Thm {
  step_lemma_sqrt_c.get()
}

///|
let radical_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("radical_RULES")

///|
/// `radical_RULES`
pub fn radical_rules() -> @kernel.Thm {
  radical_rules_c.get()
}

///|
let radical_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("radical_INDUCT")

///|
/// `radical_INDUCT`
pub fn radical_induct() -> @kernel.Thm {
  radical_induct_c.get()
}

///|
let radical_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("radical_CASES")

///|
/// `radical_CASES`
pub fn radical_cases() -> @kernel.Thm {
  radical_cases_c.get()
}

///|
/// radical_RULES, radical_INDUCT, radical_CASES
fn step_4() -> Unit raise {
  let (radical_rules, radical_induct, radical_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ x : Real, rational(x) → (radical : (Real) -> Bool)(x)) && (∀ x : Real, radical(x) → radical(-x)) && (∀ x : Real, radical(x) && !(x == real_of_num(0)) → radical(inv(x))) && (∀ x : Real, ∀ y : Real, radical(x) && radical(y) → radical(x + y)) && (∀ x : Real, ∀ y : Real, radical(x) && radical(y) → radical(x * y)) && (∀ x : Real, radical(x) && real_of_num(0) <= x → radical(sqrt(x)))"))
  radical_rules_c.set(radical_rules)
  radical_induct_c.set(radical_induct)
  radical_cases_c.set(radical_cases)
}

///|
/// RADICAL_RULES
fn step_5() -> Unit raise {
  let t80 = @simp.asm_simp_tac(@list.List([radical_rules(), @realax.real_pow(), @floor.rational_num()]))
  let t81 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@realax.real_div(), @realax.real_sub(), radical_rules(), @floor.rational_num()])), @tactics.gen_tac), @nums.induct_tac), t80)
  radical_rules_v1_c.set(@tactics.prove(@term_syntax.parse_term("(∀ n : Num, radical(real_of_num(n))) && (∀ x : Real, rational(x) → radical(x)) && (∀ x : Real, radical(x) → radical(-x)) && (∀ x : Real, radical(x) && !(x == real_of_num(0)) → radical(inv(x))) && (∀ x : Real, ∀ y : Real, radical(x) && radical(y) → radical(x + y)) && (∀ x : Real, ∀ y : Real, radical(x) && radical(y) → radical(x - y)) && (∀ x : Real, ∀ y : Real, radical(x) && radical(y) → radical(x * y)) && (∀ x : Real, ∀ y : Real, radical(x) && radical(y) && !(y == real_of_num(0)) → radical(x / y)) && (∀ x : Real, ∀ n : Num, radical(x) → radical(pow(x, n))) && (∀ x : Real, radical(x) && real_of_num(0) <= x → radical(sqrt(x)))"), t81))
}

///|
let radical_rules_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_RULES")

///|
/// `RADICAL_RULES`
pub fn radical_rules_v1() -> @kernel.Thm {
  radical_rules_v1_c.get()
}

///|
/// RADICAL_TAC
fn step_6() -> Unit raise {
  let t82 = @tactics.repeat_tac(@tactics.conj_tac)
  let t83 = @tactics.then_tac(@tactics.map_first(@tactics.match_mp_tac, @lib.tl(@lib.tl(@bool.conjuncts_rule(radical_rules_v1())))), t82)
  radical_tac_c.set(@tactics.repeat_tac(@tactics.orelse_tac(@tactics.match_accept_tac(@bool.conjunct1(radical_rules_v1())), t83)))
}

///|
let radical_tac_c : @lib.Cell[@tactics.Tactic] = @lib.Cell::new("RADICAL_TAC")

///|
/// `RADICAL_TAC`
pub fn radical_tac(x : @tactics.Goal) -> @tactics.Goalstate raise {
  (radical_tac_c.get())(x)
}

///|
let expression_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("expression_INDUCT")

///|
/// `expression_INDUCT`
pub fn expression_induct() -> @kernel.Thm {
  expression_induct_c.get()
}

///|
let expression_recursion_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("expression_RECURSION")

///|
/// `expression_RECURSION`
pub fn expression_recursion() -> @kernel.Thm {
  expression_recursion_c.get()
}

///|
/// expression_INDUCT, expression_RECURSION
fn step_7() -> Unit raise {
  let (expression_induct, expression_recursion) = @ind_types.define_type("enum Expression { Constant(Real); Negation(Expression); Inverse(Expression); Addition(Expression, Expression); Multiplication(Expression, Expression); Sqrt(Expression) }")
  expression_induct_c.set(expression_induct)
  expression_recursion_c.set(expression_recursion)
}

///|
/// value
fn step_8() -> Unit raise {
  value_c.set(@define.define_(@term_syntax.parse_term("(value : (Expression) -> Real)(Constant((x : Real))) == x && value(Negation((e : Expression))) == -value(e) && value(Inverse(e)) == inv(value(e)) && value(Addition((e1 : Expression), (e2 : Expression))) == value(e1) + value(e2) && value(Multiplication(e1, e2)) == value(e1) * value(e2) && value(Sqrt(e)) == sqrt(value(e))")))
}

///|
let value_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("value")

///|
/// `value`
pub fn value() -> @kernel.Thm {
  value_c.get()
}

///|
/// wellformed
fn step_9() -> Unit raise {
  wellformed_c.set(@define.define_(@term_syntax.parse_term("(wellformed : (Expression) -> Bool)(Constant((x : Real))) == rational(x) && wellformed(Negation((e : Expression))) == wellformed(e) && wellformed(Inverse(e)) == (!(value(e) == real_of_num(0)) && wellformed(e)) && wellformed(Addition((e1 : Expression), (e2 : Expression))) == (wellformed(e1) && wellformed(e2)) && wellformed(Multiplication(e1, e2)) == (wellformed(e1) && wellformed(e2)) && wellformed(Sqrt(e)) == (real_of_num(0) <= value(e) && wellformed(e))")))
}

///|
let wellformed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("wellformed")

///|
/// `wellformed`
pub fn wellformed() -> @kernel.Thm {
  wellformed_c.get()
}

///|
/// radicals
fn step_10() -> Unit raise {
  radicals_c.set(@define.define_(@term_syntax.parse_term("(radicals : (Expression, Expression) -> Bool)(Constant((x : Real))) == {} && radicals(Negation((e : Expression))) == radicals(e) && radicals(Inverse(e)) == radicals(e) && radicals(Addition((e1 : Expression), (e2 : Expression))) == UNION(radicals(e1), radicals(e2)) && radicals(Multiplication(e1, e2)) == UNION(radicals(e1), radicals(e2)) && radicals(Sqrt(e)) == INSERT(e, radicals(e))")))
}

///|
let radicals_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("radicals")

///|
/// `radicals`
pub fn radicals() -> @kernel.Thm {
  radicals_c.get()
}

///|
/// FINITE_RADICALS
fn step_11() -> Unit raise {
  let t84 = @simp.simp_tac(@list.List([radicals(), @sets.finite_rules(), @sets.finite_union()]))
  let t85 = @tactics.then_tac(@tactics.match_mp_tac(expression_induct()), t84)
  finite_radicals_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Expression, FINITE(radicals(e))"), t85))
}

///|
let finite_radicals_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_RADICALS")

///|
/// `FINITE_RADICALS`
pub fn finite_radicals() -> @kernel.Thm {
  finite_radicals_c.get()
}

///|
/// WELLFORMED_RADICALS
fn step_12() -> Unit raise {
  let t87 = @meson.meson_tac(@list.List([]))
  let t86 = @simp.rewrite_tac(@list.List([radicals(), wellformed(), @sets.not_in_empty(), @sets.in_union(), @sets.in_insert()]))
  let t88 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(expression_induct()), t86), t87)
  wellformed_radicals_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Expression, wellformed(e) → (∀ r : Expression, IN(r, radicals(e)) → real_of_num(0) <= value(r))"), t88))
}

///|
let wellformed_radicals_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("WELLFORMED_RADICALS")

///|
/// `WELLFORMED_RADICALS`
pub fn wellformed_radicals() -> @kernel.Thm {
  wellformed_radicals_c.get()
}

///|
/// RADICALS_WELLFORMED
fn step_13() -> Unit raise {
  let t90 = @meson.meson_tac(@list.List([]))
  let t89 = @simp.rewrite_tac(@list.List([radicals(), wellformed(), @sets.not_in_empty(), @sets.in_union(), @sets.in_insert()]))
  let t91 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(expression_induct()), t89), t90)
  radicals_wellformed_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Expression, wellformed(e) → (∀ r : Expression, IN(r, radicals(e)) → wellformed(r))"), t91))
}

///|
let radicals_wellformed_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICALS_WELLFORMED")

///|
/// `RADICALS_WELLFORMED`
pub fn radicals_wellformed() -> @kernel.Thm {
  radicals_wellformed_c.get()
}

///|
/// RADICALS_SUBSET
fn step_14() -> Unit raise {
  let t93 = @meson.meson_tac(@list.List([]))
  let t92 = @simp.rewrite_tac(@list.List([radicals(), @sets.in_union(), @sets.not_in_empty(), @sets.in_insert(), @sets.subset()]))
  let t94 = @tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(expression_induct()), t92), t93)
  radicals_subset_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Expression, ∀ r : Expression, IN(r, radicals(e)) → SUBSET(radicals(r), radicals(e))"), t94))
}

///|
let radicals_subset_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICALS_SUBSET")

///|
/// `RADICALS_SUBSET`
pub fn radicals_subset() -> @kernel.Thm {
  radicals_subset_c.get()
}

///|
/// RADICAL_EXPRESSION
fn step_15() -> Unit raise {
  let t108 = @simp.simp_tac(@list.List([radical_rules()]))
  let t107 = @simp.rewrite_tac(@list.List([value(), wellformed()]))
  let t106 = @tactics.match_mp_tac(expression_induct())
  let t105 = @simp.rewrite_tac(@list.List([@theorems.left_forall_imp_thm(), @theorems.exists_refl()]))
  let t104 = @simp.rewrite_tac(@list.List([@theorems.imp_conj(), @theorems.right_forall_imp_thm()]))
  let t103 = @simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()]))
  let t109 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.simp_tac(@list.List([@theorems.left_imp_exists_thm()])), t103), t104), t105), t106), t107), t108)
  let t102 = @meson.asm_meson_tac(@list.List([value(), wellformed()]))
  let t101 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x98 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s99 = @tactics.subst_all_tac(x98)
    fn(x100 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s99(x100)
    }
  }))
  let t97 = @tactics.repeat_tac(@tactics.strip_tac)
  let t110 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(radical_induct()), t97), t101), t102), t109])
  let t95 = @term_syntax.parse_term("(x : Real)")
  let t96 = @tactics.spec_tac(@term_syntax.parse_term("(x : Real)"), t95)
  let t111 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.eq_tac), t96), t110)
  radical_expression_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, radical(x) == (∃ e : Expression, wellformed(e) && x == value(e))"), t111))
}

///|
let radical_expression_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_EXPRESSION")

///|
/// `RADICAL_EXPRESSION`
pub fn radical_expression() -> @kernel.Thm {
  radical_expression_c.get()
}

///|
/// LT_MAX
fn step_16() -> Unit raise {
  lt_max_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, (a < MAX(b, c)) == (a < b || a < c)"), @int.arith_tac))
}

///|
let lt_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("LT_MAX")

///|
/// `LT_MAX`
pub fn lt_max() -> @kernel.Thm {
  lt_max_c.get()
}

///|
/// depth
fn step_17() -> Unit raise {
  depth_c.set(@define.define_(@term_syntax.parse_term("(depth : (Expression) -> Num)(Constant((x : Real))) == 0 && depth(Negation((e : Expression))) == depth(e) && depth(Inverse(e)) == depth(e) && depth(Addition((e1 : Expression), (e2 : Expression))) == MAX(depth(e1), depth(e2)) && depth(Multiplication(e1, e2)) == MAX(depth(e1), depth(e2)) && depth(Sqrt(e)) == 1 + depth(e)")))
}

///|
let depth_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("depth")

///|
/// `depth`
pub fn depth() -> @kernel.Thm {
  depth_c.get()
}

///|
/// IN_RADICALS_SMALLER
fn step_18() -> Unit raise {
  let t114 = @meson.meson_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("(s : Num) == (a : Num) || s < a → s < 1 + a"))]))
  let t113 = @simp.rewrite_tac(@list.List([@sets.in_union(), @sets.not_in_empty(), @sets.in_insert(), lt_max()]))
  let t112 = @simp.rewrite_tac(@list.List([radicals(), depth()]))
  let t115 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(expression_induct()), t112), t113), t114)
  in_radicals_smaller_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Expression, ∀ s : Expression, IN(s, radicals(r)) → depth(s) < depth(r)"), t115))
}

///|
let in_radicals_smaller_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("IN_RADICALS_SMALLER")

///|
/// `IN_RADICALS_SMALLER`
pub fn in_radicals_smaller() -> @kernel.Thm {
  in_radicals_smaller_c.get()
}

///|
/// NOT_IN_OWN_RADICALS
fn step_19() -> Unit raise {
  let t116 = @meson.meson_tac(@list.List([in_radicals_smaller(), @arith.lt_refl()]))
  not_in_own_radicals_c.set(@tactics.prove(@term_syntax.parse_term("∀ r : Expression, !IN(r, radicals(r))"), t116))
}

///|
let not_in_own_radicals_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("NOT_IN_OWN_RADICALS")

///|
/// `NOT_IN_OWN_RADICALS`
pub fn not_in_own_radicals() -> @kernel.Thm {
  not_in_own_radicals_c.get()
}

///|
/// RADICALS_EMPTY_RATIONAL
fn step_20() -> Unit raise {
  let t123 = @simp.asm_simp_tac(@list.List([@floor.rational_closed()]))
  let t122 = @tactics.disch_then(fn(x120 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x120
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  })
  let t119 = @tactics.repeat_tac(@tactics.gen_tac)
  let t118 = @tactics.repeat_tac(@tactics.conj_tac)
  let t117 = @simp.rewrite_tac(@list.List([wellformed(), value(), radicals(), @sets.empty_union(), @sets.not_insert_empty()]))
  let t124 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(expression_induct()), t117), t118), t119), t122), t123)
  radicals_empty_rational_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Expression, wellformed(e) && radicals(e) == {} → rational(value(e))"), t124))
}

///|
let radicals_empty_rational_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICALS_EMPTY_RATIONAL")

///|
/// `RADICALS_EMPTY_RATIONAL`
pub fn radicals_empty_rational() -> @kernel.Thm {
  radicals_empty_rational_c.get()
}

///|
/// FINITE_MAX
fn step_21() -> Unit raise {
  let t130 = @meson.meson_tac(@list.List([@arith.le_cases(), @arith.le_refl(), @arith.le_trans()]))
  let t129 = @simp.rewrite_tac(@list.List([@theorems.right_or_distrib(), @theorems.exists_or_thm(), @theorems.unwind_thm2()]))
  let t128 = @simp.asm_simp_tac(@list.List([@sets.not_in_empty(), @theorems.unwind_thm2(), @arith.le_refl()]))
  let t127 = @class.asm_cases_tac(@term_syntax.parse_term("(s : (Num) -> Bool) == {}"))
  let t126 = @tactics.repeat_tac(@tactics.gen_tac)
  let t125 = @simp.rewrite_tac(@list.List([@sets.not_insert_empty(), @sets.in_insert()]))
  let t131 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(@sets.finite_induct_strong()), t125), t126), t127), t128), t129), t130)
  finite_max_c.set(@tactics.prove(@term_syntax.parse_term("∀ s : (Num) -> Bool, FINITE(s) → !(s == {}) → (∃ b : Num, IN(b, s) && (∀ a : Num, IN(a, s) → a <= b))"), t131))
}

///|
let finite_max_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("FINITE_MAX")

///|
/// `FINITE_MAX`
pub fn finite_max() -> @kernel.Thm {
  finite_max_c.get()
}

///|
/// RADICAL_TOP
fn step_22() -> Unit raise {
  let t135 = @meson.meson_tac(@list.List([in_radicals_smaller(), @arith.not_lt()]))
  let t134 = @simp.rewrite_tac(@list.List([@sets.exists_in_image(), @sets.forall_in_image()]))
  let t133 = @simp.asm_simp_tac(@list.List([@sets.image_eq_empty(), @sets.finite_image(), finite_radicals()]))
  let t132 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("IMAGE(depth, radicals((e : Expression)))"), finite_max()))
  let t136 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t132), t133), t134), t135)
  radical_top_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Expression, !(radicals(e) == {}) → (∃ r : Expression, IN(r, radicals(e)) && (∀ s : Expression, IN(s, radicals(e)) → !IN(r, radicals(s))))"), t136))
}

///|
let radical_top_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_TOP")

///|
/// `RADICAL_TOP`
pub fn radical_top() -> @kernel.Thm {
  radical_top_c.get()
}

///|
/// RADICAL_CANONICAL_TRIVIAL
fn step_23() -> Unit raise {
  let t151 = @sets.set_tac(@list.List([]))
  let t150 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(r : Expression)"), not_in_own_radicals()))
  let t149 = @tactics.undisch_tac(@term_syntax.parse_term("!IN((r : Expression), radicals((e : Expression)))"))
  let t148 = @simp.rewrite_tac(@list.List([@floor.rational_num(), @calc_int.real_mul_lzero(), @calc_int.real_add_rid()]))
  let t147 = @simp.asm_rewrite_tac(@list.List([wellformed(), value(), radicals()]))
  let t146 = @term_syntax.parse_term("Constant(real_of_num(0))")
  let t152 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.map_every(fn(x143 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s144 = @tactics.exists_tac(x143)
    fn(x145 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s144(x145)
    }
  }, @list.List([@term_syntax.parse_term("(e : Expression)"), t146]))), t147), t148), t149), t150), t151)
  let t142 = @sets.set_tac(@list.List([]))
  let t141 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), @tactics.gen_tac))
  let t153 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x139 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x139
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th))
  }), t141), t142), t152])
  let t138 = @simp.asm_simp_tac(@list.List([]))
  let t137 = @class.asm_cases_tac(@term_syntax.parse_term("IN((r : Expression), radicals((e : Expression)))"))
  let t154 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t137), t138), t153)
  radical_canonical_trivial_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Expression, ∀ r : Expression, (IN(r, radicals(e)) → (∃ a : Expression, ∃ b : Expression, wellformed(a) && wellformed(b) && value(e) == value(a) + value(b) * sqrt(value(r)) && SUBSET(radicals(a), DELETE(radicals(e), r)) && SUBSET(radicals(b), DELETE(radicals(e), r)) && SUBSET(radicals(r), DELETE(radicals(e), r)))) → wellformed(e) → (∃ a : Expression, ∃ b : Expression, wellformed(a) && wellformed(b) && value(e) == value(a) + value(b) * sqrt(value(r)) && SUBSET(radicals(a), DELETE(UNION(radicals(e), radicals(r)), r)) && SUBSET(radicals(b), DELETE(UNION(radicals(e), radicals(r)), r)) && SUBSET(radicals(r), DELETE(UNION(radicals(e), radicals(r)), r)))"), t154))
}

///|
let radical_canonical_trivial_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_CANONICAL_TRIVIAL")

///|
/// `RADICAL_CANONICAL_TRIVIAL`
pub fn radical_canonical_trivial() -> @kernel.Thm {
  radical_canonical_trivial_c.get()
}

///|
/// RADICAL_CANONICAL
fn step_24() -> Unit raise {
  let t344 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t343 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(r : Expression)"), not_in_own_radicals()))
  let t342 = @simp.rewrite_tac(@list.List([radicals(), @floor.rational_num()]))
  let t341 = @simp.rewrite_tac(@list.List([wellformed(), value(), @realax.real_add_lid(), @realax.real_mul_lid()]))
  let t339 = @term_syntax.parse_term("Constant(real_of_num(1))")
  let t340 = @tactics.map_every(fn(x336 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s337 = @tactics.exists_tac(x336)
    fn(x338 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s337(x338)
    }
  }, @list.List([@term_syntax.parse_term("Constant(real_of_num(0))"), t339]))
  let t335 = @tactics.repeat_tac(@tactics.disch_then(fn(x334 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  }))
  let t333 = @tactics.disch_then(fn(x331 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_6 = x331
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th_6))
  })
  let t330 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t345 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))])), t330), t333), t335), t340), t341), t342), t343), t344)
  let t329 = @sets.set_tac(@list.List([]))
  let t328 = @tactics.repeat_tac(@tactics.pop_assum(fn(x325 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s326 = @tactics.mp_tac(x325)
    fn(x327 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s326(x327)
    }
  }))
  let t323 = @term_syntax.parse_term("(r : Expression)")
  let t324 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(e2 : Expression)"), t323]), radicals_subset()))
  let t321 = @term_syntax.parse_term("(r : Expression)")
  let t322 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(e1 : Expression)"), t321]), radicals_subset()))
  let t320 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(r : Expression)"), not_in_own_radicals()))
  let t318 = @tactics.conv_tac(@calc_rat.real_ring)
  let t316 = @drule.match_mp(@real.sqrt_pow_2())
  let t319 = @list.List([@tactics.then_tac(@tactics.first_assum(fn(x317 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x313 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s314 = @tactics.mp_tac(x313)
      fn(x315 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s314(x315)
      }
    })(t316(x317))
  }), t318), @tactics.all_tac])
  let t312 = @simp.asm_rewrite_tac(@list.List([value(), wellformed(), radicals()]))
  let t310 = @term_syntax.parse_term("Addition(Multiplication((a1 : Expression), (b2 : Expression)), Multiplication((a2 : Expression), (b1 : Expression)))")
  let t311 = @tactics.map_every(fn(x307 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s308 = @tactics.exists_tac(x307)
    fn(x309 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s308(x309)
    }
  }, @list.List([@term_syntax.parse_term("Addition(Multiplication((a1 : Expression), (a2 : Expression)), Multiplication(Multiplication((b1 : Expression), (b2 : Expression)), (r : Expression)))"), t310]))
  let t303 = @term_syntax.parse_term("(b2 : Expression)")
  let t304 = @term_syntax.parse_term("(a2 : Expression)")
  let t305 = @term_syntax.parse_term("(b1 : Expression)")
  let t306 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a1 : Expression)"), t305, t304, t303]))
  let t302 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t301 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t300 = @tactics.disch_then(fn(x298 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_5 = x298
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th_5))
  })
  let t297 = @simp.once_rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t296 = @simp.asm_rewrite_tac(@list.List([]))
  let t293 = @drule.match_mp(radical_canonical_trivial())
  let t295 = @tactics.disch_then(@tactics.conjuncts_then(fn(x294 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x290 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s291 = @tactics.mp_tac(x290)
      fn(x292 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s291(x292)
      }
    })(t293(x294))
  }))
  let t289 = @simp.asm_rewrite_tac(@list.List([]))
  let t288 = @tactics.disch_then(fn(x282 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_4 = x282
    let t287 = @tactics.mp_tac(th_4)
    @tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x284 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s285 = @tactics.mp_tac(x284)
      fn(x286 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s285(x286)
      }
    }, @tactics.strip_assume_tac)), t287)
  })
  let t281 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t346 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))])), t281), t288), t289), t295), t296), t297), t300), t301), t302), t306), @tactics.strip_tac), t311), t312), @tactics.conj_tac), t319), t320), t322), t324), t328), t329)
  let t280 = @sets.set_tac(@list.List([]))
  let t279 = @tactics.repeat_tac(@tactics.pop_assum(fn(x276 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s277 = @tactics.mp_tac(x276)
    fn(x278 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s277(x278)
    }
  }))
  let t274 = @term_syntax.parse_term("(r : Expression)")
  let t275 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(e2 : Expression)"), t274]), radicals_subset()))
  let t272 = @term_syntax.parse_term("(r : Expression)")
  let t273 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(e1 : Expression)"), t272]), radicals_subset()))
  let t271 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(r : Expression)"), not_in_own_radicals()))
  let t270 = @simp.asm_rewrite_tac(@list.List([value(), wellformed(), radicals()]))
  let t268 = @term_syntax.parse_term("Addition((b1 : Expression), (b2 : Expression))")
  let t269 = @tactics.map_every(fn(x265 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s266 = @tactics.exists_tac(x265)
    fn(x267 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s266(x267)
    }
  }, @list.List([@term_syntax.parse_term("Addition((a1 : Expression), (a2 : Expression))"), t268]))
  let t261 = @term_syntax.parse_term("(b2 : Expression)")
  let t262 = @term_syntax.parse_term("(a2 : Expression)")
  let t263 = @term_syntax.parse_term("(b1 : Expression)")
  let t264 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a1 : Expression)"), t263, t262, t261]))
  let t260 = @simp.rewrite_tac(@list.List([@theorems.right_and_exists_thm(), @theorems.left_imp_exists_thm()]))
  let t259 = @simp.rewrite_tac(@list.List([@theorems.left_and_exists_thm()]))
  let t258 = @tactics.disch_then(fn(x256 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_3 = x256
    @tactics.then_tac(@tactics.disch_tac, @tactics.mp_tac(th_3))
  })
  let t255 = @simp.once_rewrite_tac(@list.List([@theorems.imp_imp()]))
  let t254 = @simp.asm_rewrite_tac(@list.List([]))
  let t251 = @drule.match_mp(radical_canonical_trivial())
  let t253 = @tactics.disch_then(@tactics.conjuncts_then(fn(x252 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x248 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s249 = @tactics.mp_tac(x248)
      fn(x250 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s249(x250)
      }
    })(t251(x252))
  }))
  let t247 = @simp.asm_rewrite_tac(@list.List([]))
  let t246 = @tactics.disch_then(fn(x240 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x240
    let t245 = @tactics.mp_tac(th_2)
    @tactics.then_tac(@tactics.disch_then(@tactics.conjuncts_then2(fn(x242 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s243 = @tactics.mp_tac(x242)
      fn(x244 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s243(x244)
      }
    }, @tactics.strip_assume_tac)), t245)
  })
  let t239 = @simp.rewrite_tac(@list.List([@theorems.forall_and_thm()]))
  let t347 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@class.taut(@term_syntax.parse_term("((a : Bool) || (b : Bool) → (c : Bool)) == ((a → c) && (b → c))"))])), t239), t246), t247), t253), t254), t255), t258), t259), t260), t264), @tactics.strip_tac), t269), t270), @tactics.conj_tac), @list.List([@calc_rat.real_arith_tac, @tactics.all_tac])), t271), t273), t275), t279), t280)
  let t238 = @tactics.conv_tac(@calc_rat.real_field)
  let t235 = @drule.match_mp(@real.sqrt_pow_2())
  let t237 = @tactics.first_assum(fn(x236 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x232 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s233 = @tactics.mp_tac(x232)
      fn(x234 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s233(x234)
      }
    })(t235(x236))
  })
  let t231 = @simp.asm_rewrite_tac(@list.List([]))
  let t230 = @tactics.undisch_tac(@term_syntax.parse_term("!(value((e1 : Expression)) == real_of_num(0))"))
  let t229 = @tactics.undisch_tac(@term_syntax.parse_term("!(value((b : Expression)) * sqrt(value((r : Expression))) == value((a : Expression)))"))
  let t228 = @simp.asm_rewrite_tac(@list.List([value(), wellformed(), radicals(), @sets.union_subset()]))
  let t226 = @term_syntax.parse_term("Multiplication(Negation((b : Expression)), Inverse(Addition(Multiplication((a : Expression), a), Multiplication(Multiplication(b, b), Negation((r : Expression))))))")
  let t227 = @tactics.map_every(fn(x223 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s224 = @tactics.exists_tac(x223)
    fn(x225 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s224(x225)
    }
  }, @list.List([@term_syntax.parse_term("Multiplication((a : Expression), Inverse(Addition(Multiplication(a, a), Multiplication(Multiplication((b : Expression), b), Negation((r : Expression))))))"), t226]))
  let t219 = @sets.set_tac(@list.List([]))
  let t220 = @tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x216 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s217 = @tactics.mp_tac(x216)
    fn(x218 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s217(x218)
    }
  })), t219)
  let t215 = @tactics.conv_tac(@calc_rat.real_field)
  let t221 = @list.List([@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("!(value((a : Expression)) + value(a) == real_of_num(0))")), t215), t220])
  let t214 = @simp.rewrite_tac(@list.List([@floor.rational_num(), @sets.empty_subset(), @theorems.conj_assoc()]))
  let t213 = @simp.asm_rewrite_tac(@list.List([value(), radicals(), wellformed()]))
  let t211 = @term_syntax.parse_term("Constant(real_of_num(0))")
  let t212 = @tactics.map_every(fn(x208 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s209 = @tactics.exists_tac(x208)
    fn(x210 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s209(x210)
    }
  }, @list.List([@term_syntax.parse_term("Inverse(Multiplication(Constant(real_of_num(2)), (a : Expression)))"), t211]))
  let t207 = @tactics.first_x_assum(fn(x204 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s205 = @tactics.subst_all_tac(x204)
    fn(x206 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s205(x206)
    }
  })
  let t222 = @list.List([@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([])), @tactics.strip_tac), t207), t212), t213), t214), @tactics.conj_tac), t221), @tactics.all_tac])
  let t203 = @class.asm_cases_tac(@term_syntax.parse_term("value((b : Expression)) * sqrt(value((r : Expression))) == value((a : Expression))"))
  let t201 = @term_syntax.parse_term("(b : Expression)")
  let t202 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Expression)"), t201]))
  let t200 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t348 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x198 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x198
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th_1))
  }), t200), t202), t203), t222), @tactics.strip_tac), t227), t228), t229), t230), t231), t237), t238)
  let t197 = @simp.asm_rewrite_tac(@list.List([value(), wellformed(), radicals()]))
  let t195 = @term_syntax.parse_term("Negation((b : Expression))")
  let t196 = @tactics.map_every(fn(x192 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s193 = @tactics.exists_tac(x192)
    fn(x194 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s193(x194)
    }
  }, @list.List([@term_syntax.parse_term("Negation((a : Expression))"), t195]))
  let t190 = @term_syntax.parse_term("(b : Expression)")
  let t191 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(a : Expression)"), t190]))
  let t189 = @simp.asm_rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t349 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.disch_then(fn(x187 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x187
    @tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(th))
  }), t189), t191), @tactics.strip_tac), t196), t197), @calc_rat.real_arith_tac), t348, t347, t346, t345])
  let t186 = @tactics.try_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(e2 : Expression)")))
  let t185 = @tactics.x_gen_tac(@term_syntax.parse_term("(e1 : Expression)"))
  let t184 = @tactics.repeat_tac(@tactics.conj_tac)
  let t183 = @simp.rewrite_tac(@list.List([@sets.in_insert(), @sets.in_union()]))
  let t182 = @simp.rewrite_tac(@list.List([wellformed(), radicals(), value(), @sets.not_in_empty()]))
  let t181 = @tactics.match_mp_tac(expression_induct())
  let t179 = @term_syntax.parse_term("(e : Expression)")
  let t180 = @tactics.spec_tac(@term_syntax.parse_term("(e : Expression)"), t179)
  let t178 = @simp.asm_rewrite_tac(@list.List([@theorems.imp_imp(), wellformed(), value(), @equal.gsym(@theorems.conj_assoc())]))
  let t176 = @term_syntax.parse_term("IN((r : Expression), radicals((e : Expression)))")
  let t177 = @tactics.map_every(fn(x173 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s174 = @tactics.undisch_tac(x173)
    fn(x175 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s174(x175)
    }
  }, @list.List([@term_syntax.parse_term("wellformed((e : Expression))"), t176]))
  let t172 = @list.List([@meson.asm_meson_tac(@list.List([wellformed_radicals(), radicals_wellformed()])), @tactics.all_tac])
  let t171 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= value((r : Expression)) && wellformed(r)"), @tactics.strip_assume_tac)
  let t170 = @simp.asm_rewrite_tac(@list.List([]))
  let t169 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x163 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s164 = @tactics.assume_tac(x163)
    fn(x165 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s164(x165)
    }
  }, fn(x166 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s167 = @tactics.mp_tac(x166)
    fn(x168 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s167(x168)
    }
  }))
  let t162 = @tactics.x_gen_tac(@term_syntax.parse_term("(r : Expression)"))
  let t161 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t158 = @drule.match_mp(radical_top())
  let t160 = @tactics.first_x_assum(fn(x159 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x155 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s156 = @tactics.mp_tac(x155)
      fn(x157 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s156(x157)
      }
    })(t158(x159))
  })
  let t350 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t160), t161), t162), t169), t170), t171), t172), t177), t178), t180), t181), t182), t183), t184), t185), t186), t349)
  radical_canonical_c.set(@tactics.prove(@term_syntax.parse_term("∀ e : Expression, wellformed(e) && !(radicals(e) == {}) → (∃ r : Expression, IN(r, radicals(e)) && (∃ a : Expression, ∃ b : Expression, wellformed(Addition(a, Multiplication(b, Sqrt(r)))) && value(e) == value(Addition(a, Multiplication(b, Sqrt(r)))) && SUBSET(radicals(a), DELETE(radicals(e), r)) && SUBSET(radicals(b), DELETE(radicals(e), r)) && SUBSET(radicals(r), DELETE(radicals(e), r))))"), t350))
}

///|
let radical_canonical_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_CANONICAL")

///|
/// `RADICAL_CANONICAL`
pub fn radical_canonical() -> @kernel.Thm {
  radical_canonical_c.get()
}

///|
/// CUBIC_ROOT_STEP
fn step_25() -> Unit raise {
  let t429 = @tactics.asm_tac(@sets.set_tac)(@list.List([]))
  let t428 = @simp.asm_simp_tac(@list.List([]))
  let t427 = @tactics.x_gen_tac(@term_syntax.parse_term("(e' : Expression)"))
  let t426 = @tactics.match_mp_tac(@theorems.mono_exists())
  let t425 = @tactics.disch_then(@tactics.choose_then(@tactics.conjuncts_then2(fn(x419 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s420 = @tactics.mp_tac(x419)
    fn(x421 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s420(x421)
    }
  }, fn(x422 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s423 = @tactics.assume_tac(x422)
    fn(x424 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s423(x424)
    }
  })))
  let t417 = @meson.asm_meson_tac(@list.List([]))
  let t416 = @simp.asm_rewrite_tac(@list.List([value()]))
  let t415 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([wellformed()])))
  let t413 = @simp.asm_rewrite_tac(@list.List([wellformed(), radicals(), @sets.empty_subset(), value()]))
  let t414 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("Constant((c : Real))")), t413), @tactics.all_tac])
  let t411 = @simp.asm_rewrite_tac(@list.List([wellformed(), radicals(), @sets.empty_subset(), value()]))
  let t412 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("Constant((b : Real))")), t411), @tactics.all_tac])
  let t410 = @simp.asm_rewrite_tac(@list.List([wellformed(), radicals(), @sets.empty_subset(), value()]))
  let t418 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("Constant((a : Real))")), t410), @tactics.all_tac])), @tactics.conj_tac), t412), @tactics.conj_tac), t414), t415), t416), t417), @tactics.all_tac])
  let t400 = @term_syntax.parse_term("value((r : Expression))")
  let t401 = @term_syntax.parse_term("value((ev : Expression))")
  let t402 = @term_syntax.parse_term("value((eu : Expression))")
  let t403 = @term_syntax.parse_term("value((e : Expression))")
  let t404 = @term_syntax.parse_term("(c : Real)")
  let t405 = @term_syntax.parse_term("(b : Real)")
  let t406 = @list.List([@term_syntax.parse_term("(a : Real)"), t405, t404, t403, t402, t401, t400])
  let t409 = @tactics.disch_then(fn(x408 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x397 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s398 = @tactics.mp_tac(x397)
      fn(x399 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s398(x399)
      }
    })(((x407 : @kernel.Thm) => @bool.specl(t406, x407))(x408))
  })
  let t390 = @simp.asm_rewrite_tac(@list.List([wellformed(), radicals(), value(), @sets.union_subset()]))
  let t389 = @tactics.exists_tac(@term_syntax.parse_term("Multiplication((ex : Expression), (ey : Expression))"))
  let t387 = @tactics.x_choose_then(@term_syntax.parse_term("(ey : Expression)"))(@tactics.strip_assume_tac)
  let t388 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(ex : Expression)"))(@tactics.strip_assume_tac), t387))
  let t386 = @term_syntax.parse_term("(y : Real)")
  let t391 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Real)"), t386])), t388), t389), t390)
  let t385 = @simp.asm_rewrite_tac(@list.List([wellformed(), radicals(), value(), @sets.union_subset()]))
  let t384 = @tactics.exists_tac(@term_syntax.parse_term("Addition((ex : Expression), (ey : Expression))"))
  let t382 = @tactics.x_choose_then(@term_syntax.parse_term("(ey : Expression)"))(@tactics.strip_assume_tac)
  let t383 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(ex : Expression)"))(@tactics.strip_assume_tac), t382))
  let t381 = @term_syntax.parse_term("(y : Real)")
  let t392 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(x : Real)"), t381])), t383), t384), t385)
  let t380 = @simp.asm_rewrite_tac(@list.List([wellformed(), radicals(), value()]))
  let t379 = @tactics.exists_tac(@term_syntax.parse_term("Inverse((ex : Expression))"))
  let t378 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(ex : Expression)"))(@tactics.strip_assume_tac))
  let t377 = @tactics.disch_then(@tactics.conjuncts_then2(fn(x371 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s372 = @tactics.mp_tac(x371)
    fn(x373 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s372(x373)
    }
  }, fn(x374 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s375 = @tactics.assume_tac(x374)
    fn(x376 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s375(x376)
    }
  }))
  let t393 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t377), t378), t379), t380)
  let t370 = @simp.asm_rewrite_tac(@list.List([wellformed(), radicals(), value()]))
  let t369 = @tactics.exists_tac(@term_syntax.parse_term("Negation((ex : Expression))"))
  let t368 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(ex : Expression)"))(@tactics.strip_assume_tac))
  let t394 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(x : Real)")), t368), t369), t370)
  let t367 = @simp.rewrite_tac(@list.List([wellformed(), radicals(), @floor.rational_num(), value(), @sets.empty_subset()]))
  let t366 = @tactics.exists_tac(@term_syntax.parse_term("Constant(real_of_num((n : Num)))"))
  let t395 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)")), t366), t367), t394, t393, t392, t391])
  let t396 = @list.List([@tactics.thenl(@tactics.repeat_tac(@tactics.conj_tac), t395), @tactics.all_tac])
  let t365 = @simp.rewrite_tac(@list.List([]))
  let t364 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real) => ∃ ex : Expression, wellformed(ex) && SUBSET(radicals(ex), DELETE(radicals((e : Expression)), (r : Expression))) && value(ex) == x"), step_lemma_sqrt()))
  let t362 = @term_syntax.parse_term("(ev : Expression)")
  let t363 = @tactics.map_every(@tactics.x_gen_tac, @list.List([@term_syntax.parse_term("(eu : Expression)"), t362]))
  let t361 = @simp.rewrite_tac(@list.List([@theorems.left_imp_exists_thm()]))
  let t359 = @tactics.conjuncts_then2(fn(x353 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s354 = @tactics.assume_tac(x353)
    fn(x355 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s354(x355)
    }
  }, fn(x356 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s357 = @tactics.mp_tac(x356)
    fn(x358 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s357(x358)
    }
  })
  let t360 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(r : Expression)"))(t359))
  let t352 = @simp.asm_rewrite_tac(@list.List([]))
  let t351 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(e : Expression)"), radical_canonical()))
  let t430 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t351), t352), t360), t361), t363), @tactics.strip_tac), t364), t365), @tactics.ants_tac), t396), t409), @tactics.ants_tac), t418), t425), t426), t427), t428), t429)
  cubic_root_step_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, rational(a) && rational(b) && rational(c) → (∀ e : Expression, wellformed(e) && !(radicals(e) == {}) && pow(value(e), 3) + (a * pow(value(e), 2) + (b * value(e) + c)) == real_of_num(0) → (∃ e' : Expression, wellformed(e') && PSUBSET(radicals(e'), radicals(e)) && pow(value(e'), 3) + (a * pow(value(e'), 2) + (b * value(e') + c)) == real_of_num(0)))"), t430))
}

///|
let cubic_root_step_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBIC_ROOT_STEP")

///|
/// `CUBIC_ROOT_STEP`
pub fn cubic_root_step() -> @kernel.Thm {
  cubic_root_step_c.get()
}

///|
/// CUBIC_ROOT_RADICAL_INDUCT
fn step_26() -> Unit raise {
  let t459 = @simp.asm_rewrite_tac(@list.List([]))
  let t458 = @tactics.exists_tac(@term_syntax.parse_term("(e' : Expression)"))
  let t460 = @tactics.then_tac(@tactics.then_tac(@tactics.disch_then(@tactics.match_mp_tac), t458), t459)
  let t457 = @simp.asm_rewrite_tac(@list.List([finite_radicals()]))
  let t456 = @tactics.match_mp_tac(@sets.card_psubset())
  let t461 = @list.List([@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@equal.sym(@kernel.assume_rule(@term_syntax.parse_term("CARD(radicals((e : Expression))) == (n : Num)")))])), t456), t457), t460])
  let t452 = @term_syntax.parse_term("CARD(radicals((e' : Expression)))")
  let t455 = @tactics.first_x_assum(fn(x454 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x449 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s450 = @tactics.mp_tac(x449)
      fn(x451 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s450(x451)
      }
    })(((x453 : @kernel.Thm) => @bool.spec(t452, x453))(x454))
  })
  let t448 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(e' : Expression)"))(@tactics.strip_assume_tac))
  let t447 = @simp.asm_rewrite_tac(@list.List([]))
  let t443 = @term_syntax.parse_term("(e : Expression)")
  let t446 = @tactics.disch_then(fn(x445 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x440 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s441 = @tactics.mp_tac(x440)
      fn(x442 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s441(x442)
      }
    })(((x444 : @kernel.Thm) => @bool.spec(t443, x444))(x445))
  })
  let t439 = @simp.asm_rewrite_tac(@list.List([]))
  let t436 = @term_syntax.parse_term("(c : Real)")
  let t437 = @term_syntax.parse_term("(b : Real)")
  let t438 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Real)"), t437, t436]), cubic_root_step()))
  let t435 = @list.List([@meson.asm_meson_tac(@list.List([radicals_empty_rational()])), @tactics.all_tac])
  let t434 = @class.asm_cases_tac(@term_syntax.parse_term("radicals((e : Expression)) == {}"))
  let t433 = @tactics.x_gen_tac(@term_syntax.parse_term("(e : Expression)"))
  let t432 = @tactics.x_gen_tac(@term_syntax.parse_term("(n : Num)"))
  let t431 = @tactics.match_mp_tac(@arith.num_wf())
  let t462 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t431), t432), @tactics.disch_tac), t433), @tactics.strip_tac), t434), t435), t438), t439), t446), t447), t448), t455), @tactics.ants_tac), t461)
  cubic_root_radical_induct_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, rational(a) && rational(b) && rational(c) → (∀ n : Num, ∀ e : Expression, wellformed(e) && CARD(radicals(e)) == n && pow(value(e), 3) + (a * pow(value(e), 2) + (b * value(e) + c)) == real_of_num(0) → (∃ x : Real, rational(x) && pow(x, 3) + (a * pow(x, 2) + (b * x + c)) == real_of_num(0)))"), t462))
}

///|
let cubic_root_radical_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBIC_ROOT_RADICAL_INDUCT")

///|
/// `CUBIC_ROOT_RADICAL_INDUCT`
pub fn cubic_root_radical_induct() -> @kernel.Thm {
  cubic_root_radical_induct_c.get()
}

///|
/// CUBIC_ROOT_RATIONAL
fn step_27() -> Unit raise {
  let t474 = @meson.asm_meson_tac(@list.List([]))
  let t472 = @term_syntax.parse_term("(e : Expression)")
  let t473 = @tactics.map_every(fn(x469 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s470 = @tactics.exists_tac(x469)
    fn(x471 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s470(x471)
    }
  }, @list.List([@term_syntax.parse_term("CARD(radicals((e : Expression)))"), t472]))
  let t468 = @tactics.disch_then(@tactics.match_mp_tac)
  let t467 = @simp.asm_rewrite_tac(@list.List([]))
  let t464 = @term_syntax.parse_term("(c : Real)")
  let t465 = @term_syntax.parse_term("(b : Real)")
  let t466 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Real)"), t465, t464]), cubic_root_radical_induct()))
  let t463 = @tactics.repeat_tac(@tactics.strip_tac)
  let t475 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([radical_expression()])), t463), t466), t467), t468), t473), t474)
  cubic_root_rational_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, rational(a) && rational(b) && rational(c) && (∃ x : Real, radical(x) && pow(x, 3) + (a * pow(x, 2) + (b * x + c)) == real_of_num(0)) → (∃ x : Real, rational(x) && pow(x, 3) + (a * pow(x, 2) + (b * x + c)) == real_of_num(0))"), t475))
}

///|
let cubic_root_rational_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBIC_ROOT_RATIONAL")

///|
/// `CUBIC_ROOT_RATIONAL`
pub fn cubic_root_rational() -> @kernel.Thm {
  cubic_root_rational_c.get()
}

///|
/// 100/constructible.ml:503
fn step_28() -> Unit raise {
  @realax.prioritize_num(())
}

///|
/// RATIONAL_LOWEST_LEMMA
fn step_29() -> Unit raise {
  let t533 = @tactics.conv_tac(@grobner.num_ring)
  let t532 = @simp.simp_tac(@list.List([]))
  let t531 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), @tactics.gen_tac))
  let t527 = @term_syntax.parse_term("(p' : Num)")
  let t530 = @tactics.disch_then(fn(x529 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x524 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s525 = @tactics.mp_tac(x524)
      fn(x526 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s525(x526)
      }
    })(((x528 : @kernel.Thm) => @bool.spec(t527, x528))(x529))
  })
  let t523 = @simp.asm_simp_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("!((d : Num) == 0) && !(d == 1) → 1 < d"))]))
  let t522 = @simp.asm_rewrite_tac(@list.List([@arith.lt_mult_rcancel()]))
  let t521 = @simp.gen_rewrite_tac((x520 : (@kernel.Term) -> @kernel.Thm raise) => @lib.funpow(2, fn(x517 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s518 = @equal.land_conv(x517)
    fn(x519 : @kernel.Term) -> @kernel.Thm raise {
      s518(x519)
    }
  }, x520), @list.List([@int.arith_rule(@term_syntax.parse_term("((a : Num) < (b : Num)) == (1 * a < b)"))]))
  let t516 = @tactics.rule_assum_tac(@simp.rewrite_rule(@list.List([@arith.mult_eq_0(), @class.de_morgan_thm()])))
  let t512 = @term_syntax.parse_term("(q' : Num)")
  let t515 = @tactics.first_x_assum(fn(x514 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x509 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s510 = @tactics.mp_tac(x509)
      fn(x511 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s510(x511)
      }
    })(((x513 : @kernel.Thm) => @bool.spec(t512, x513))(x514))
  })
  let t507 = @tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(q' : Num)"))(fn(x501 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s502 = @tactics.subst_all_tac(x501)
    fn(x503 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s502(x503)
    }
  }), fn(x504 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s505 = @tactics.assume_tac(x504)
    fn(x506 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s505(x506)
    }
  })
  let t508 = @tactics.disch_then(@tactics.conjuncts_then2(@tactics.x_choose_then(@term_syntax.parse_term("(p' : Num)"))(fn(x498 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s499 = @tactics.subst_all_tac(x498)
    fn(x500 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s499(x500)
    }
  }), t507))
  let t497 = @simp.rewrite_tac(@list.List([@int.divides()]))
  let t496 = @simp.asm_rewrite_tac(@list.List([@prime.divides_zero()]))
  let t495 = @class.asm_cases_tac(@term_syntax.parse_term("(d : Num) == 0"))
  let t494 = @tactics.disch_then(@tactics.x_choose_then(@term_syntax.parse_term("(d : Num)"))(fn(x491 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s492 = @tactics.mp_tac(x491)
    fn(x493 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s492(x493)
    }
  }))
  let t490 = @simp.rewrite_tac(@list.List([@class.not_forall_thm(), @class.not_imp(), @equal.gsym(@theorems.conj_assoc())]))
  let t487 = @simp.gen_rewrite_rule(fn(x484 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    let s485 = @equal.rand_conv(x484)
    fn(x486 : @kernel.Term) -> @kernel.Thm raise {
      s485(x486)
    }
  }, @list.List([@int.coprime()]))
  let t489 = @tactics.first_x_assum(fn(x488 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x481 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s482 = @tactics.mp_tac(x481)
      fn(x483 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s482(x483)
      }
    })(t487(x488))
  })
  let t480 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t479 = @class.asm_cases_tac(@term_syntax.parse_term("coprime(((p : Num), (q : Num)))"))
  let t478 = @tactics.x_gen_tac(@term_syntax.parse_term("(p : Num)"))
  let t477 = @tactics.x_gen_tac(@term_syntax.parse_term("(q : Num)"))
  let t476 = @tactics.match_mp_tac(@arith.num_wf())
  let t534 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.once_rewrite_tac(@list.List([@theorems.swap_forall_thm()])), t476), t477), @tactics.disch_tac), t478), @tactics.disch_tac), t479), t480), t489), t490), t494), t495), t496), t497), t508), t515), t516), t521), t522), t523), t530), t531), t532), t533)
  rational_lowest_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ p : Num, ∀ q : Num, !(q == 0) → (∃ p' : Num, ∃ q' : Num, !(q' == 0) && coprime((p', q')) && p * q' == p' * q)"), t534))
}

///|
let rational_lowest_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_LOWEST_LEMMA")

///|
/// `RATIONAL_LOWEST_LEMMA`
pub fn rational_lowest_lemma() -> @kernel.Thm {
  rational_lowest_lemma_c.get()
}

///|
/// 100/constructible.ml:526
fn step_30() -> Unit raise {
  @realax.prioritize_real(())
}

///|
/// RATIONAL_LOWEST
fn step_31() -> Unit raise {
  let t543 = @tactics.conv_tac(@calc_rat.real_field)
  let t542 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_mul())]))
  let t541 = @simp.simp_tac(@list.List([@equal.gsym(@realax.real_of_num_eq())]))
  let t540 = @tactics.undisch_tac(@term_syntax.parse_term("!((q : Num) == 0)"))
  let t539 = @tactics.repeat_tac(@tactics.then_tac(@tactics.match_mp_tac(@theorems.mono_exists()), @tactics.gen_tac))
  let t538 = @simp.asm_rewrite_tac(@list.List([]))
  let t536 = @term_syntax.parse_term("(q : Num)")
  let t537 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(p : Num)"), t536]), rational_lowest_lemma()))
  let t535 = @list.List([@tactics.all_tac, @meson.meson_tac(@list.List([]))])
  let t544 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@floor.rational_alt()]))), @tactics.eq_tac), t535), @tactics.strip_tac), t537), t538), t539), t540), t541), t542), t543)
  rational_lowest_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, rational(x) == (∃ p : Num, ∃ q : Num, !(q == 0) && coprime((p, q)) && abs(x) == real_of_num(p) / real_of_num(q))"), t544))
}

///|
let rational_lowest_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_LOWEST")

///|
/// `RATIONAL_LOWEST`
pub fn rational_lowest() -> @kernel.Thm {
  rational_lowest_c.get()
}

///|
/// RATIONAL_ROOT_INTEGER
fn step_32() -> Unit raise {
  let t616 = @meson.meson_tac(@list.List([@int.divides(), @prime.divides_refl()]))
  let t615 = @simp.asm_simp_tac(@list.List([@real.real_div_1(), @calc_int.real_abs_num(), @realax.real_of_num_eq(), @equal.gsym(@theorems.exists_refl())]))
  let t614 = @class.asm_cases_tac(@term_syntax.parse_term("(q : Num) == 1"))
  let t610 = @term_syntax.parse_term("(q : Num)")
  let t613 = @tactics.disch_then(fn(x612 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x607 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s608 = @tactics.mp_tac(x607)
      fn(x609 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s608(x609)
      }
    })(((x611 : @kernel.Thm) => @bool.spec(t610, x611))(x612))
  })
  let t606 = @simp.rewrite_tac(@list.List([@int.coprime()]))
  let t603 = @drule.match_mp(@prime.coprime_exp())
  let t600 = @term_syntax.parse_term("3")
  let t605 = @tactics.disch_then(fn(x604 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x602 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      (fn(x597 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s598 = @tactics.mp_tac(x597)
        fn(x599 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s598(x599)
        }
      })(((x601 : @kernel.Thm) => @bool.spec(t600, x601))(x602))
    })(t603(x604))
  })
  let t594 = @simp.gen_rewrite_rule(fn(x593 : (@kernel.Term) -> @kernel.Thm raise) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    x593
  }, @list.List([@prime.coprime_sym()]))
  let t596 = @tactics.first_assum(fn(x595 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x590 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s591 = @tactics.mp_tac(x590)
      fn(x592 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s591(x592)
      }
    })(t594(x595))
  })
  let t589 = @simp.rewrite_tac(@list.List([@calc_int.real_of_num_pow(), @realax.real_of_num_eq()]))
  let t588 = @simp.rewrite_tac(@list.List([@real.real_abs_pow(), @calc_int.real_abs_num(), @realax.real_of_num_mul()]))
  let t587 = @simp.asm_rewrite_tac(@list.List([@real.real_abs_mul(), @calc_int.real_abs_neg()]))
  let t583 = @term_syntax.parse_term("real_abs")
  let t586 = @tactics.disch_then(fn(x585 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x580 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s581 = @tactics.mp_tac(x580)
      fn(x582 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s581(x582)
      }
    })(((x584 : @kernel.Thm) => @equal.ap_term(t583, x584))(x585))
  })
  let t577 = @term_syntax.parse_term("(i : Num)")
  let t579 = @tactics.disch_then((x578 : @kernel.Thm) => @tactics.x_choose_tac(t577, x578))
  let t576 = @simp.rewrite_tac(@list.List([@int.integer()]))
  let t565 = @simp.asm_simp_tac(@list.List([@calc_rat.real_field(@term_syntax.parse_term("!((q : Real) == real_of_num(0)) → (pow((p : Real) / q, 3) + ((a : Real) * pow(p / q, 2) + ((b : Real) * (p / q) + (c : Real))) == real_of_num(0)) == (pow(p, 3) == q * -(a * pow(p, 2) + (b * (p * q) + c * pow(q, 2)))) && (pow(-(p / q), 3) + (a * pow(-(p / q), 2) + (b * -(p / q) + c)) == real_of_num(0)) == (pow(p, 3) == q * (a * pow(p, 2) - b * (p * q) + c * pow(q, 2)))"))]))
  let t564 = @tactics.first_x_assum(fn(x563 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x556 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s557 = @tactics.mp_tac(x556)
      fn(x558 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s557(x558)
      }
    })(((x562 : @kernel.Thm) => @lib.check(fn(x561 : @kernel.Thm) -> Bool raise {
      (fn(x559 : @kernel.Term) -> Bool raise {
        @basics.is_eq(x559)
      })((fn(x560 : @kernel.Thm) -> @kernel.Term raise {
        @kernel.concl(x560)
      })(x561))
    }, x562))(x563))
  })
  let t555 = @tactics.disch_then(@tactics.disj_cases_then(fn(x552 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s553 = @tactics.subst_all_tac(x552)
    fn(x554 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s553(x554)
    }
  }))
  let t549 = @drule.match_mp(@calc_rat.real_arith(@term_syntax.parse_term("abs((x : Real)) == (a : Real) → x == a || x == -a")))
  let t551 = @tactics.first_x_assum(fn(x550 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x546 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s547 = @tactics.mp_tac(x546)
      fn(x548 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s547(x548)
      }
    })(t549(x550))
  })
  let t545 = @tactics.repeat_tac(@tactics.strip_tac)
  let t617 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([rational_lowest(), @equal.gsym(@realax.real_of_num_eq())])), t545), t551), t555), t564), t565), fn(x575 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
    (fn(x566 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let (asl, w) = x566
      let t573 = @simp.asm_rewrite_tac(@list.List([@floor.integer_closed()]))
      let t572 = @tactics.repeat_tac(@tactics.conj_tac)
      let t574 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.then_tac(@tactics.map_first(@tactics.match_mp_tac, @lib.tl(@bool.conjuncts_rule(@floor.integer_closed()))), t572)), t573), @tactics.all_tac])
      let t568 = @kernel.rand(@kernel.rand(@equal.lhand(w)))
      @tactics.thenl(@tactics.subgoal_then(@kernel.mk_comb(@term_syntax.parse_term("integer"), t568), fn(x569 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
        let s570 = @tactics.mp_tac(x569)
        fn(x571 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
          s570(x571)
        }
      }), t574)
    })(x575)(x575)
  }), t576), t579), t586), t587), t588), t589), t596), t605), t606), t613), t614), t615), t616)
  rational_root_integer_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ x : Real, integer(a) && integer(b) && integer(c) && rational(x) && pow(x, 3) + (a * pow(x, 2) + (b * x + c)) == real_of_num(0) → integer(x)"), t617))
}

///|
let rational_root_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RATIONAL_ROOT_INTEGER")

///|
/// `RATIONAL_ROOT_INTEGER`
pub fn rational_root_integer() -> @kernel.Thm {
  rational_root_integer_c.get()
}

///|
/// CUBIC_ROOT_INTEGER
fn step_33() -> Unit raise {
  let t622 = @meson.asm_meson_tac(@list.List([rational_root_integer()]))
  let t621 = @simp.asm_simp_tac(@list.List([@floor.rational_integer()]))
  let t618 = @term_syntax.parse_term("(c : Real)")
  let t619 = @term_syntax.parse_term("(b : Real)")
  let t620 = @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("(a : Real)"), t619, t618]), cubic_root_rational()))
  let t623 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t620), t621), t622)
  cubic_root_integer_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, integer(a) && integer(b) && integer(c) && (∃ x : Real, radical(x) && pow(x, 3) + (a * pow(x, 2) + (b * x + c)) == real_of_num(0)) → (∃ x : Real, integer(x) && pow(x, 3) + (a * pow(x, 2) + (b * x + c)) == real_of_num(0))"), t623))
}

///|
let cubic_root_integer_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CUBIC_ROOT_INTEGER")

///|
/// `CUBIC_ROOT_INTEGER`
pub fn cubic_root_integer() -> @kernel.Thm {
  cubic_root_integer_c.get()
}

///|
/// length
fn step_34() -> Unit raise {
  length_c.set(@pair.new_definition(@term_syntax.parse_term("(length : ((Cart[Real, 2], Cart[Real, 2])) -> Real)(((a : Cart[Real, 2]), (b : Cart[Real, 2]))) == norm(b - a)")))
}

///|
let length_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("length")

///|
/// `length`
pub fn length() -> @kernel.Thm {
  length_c.get()
}

///|
/// parallel
fn step_35() -> Unit raise {
  parallel_c.set(@pair.new_definition(@term_syntax.parse_term("(parallel : ((Cart[Real, 2], Cart[Real, 2]), (Cart[Real, 2], Cart[Real, 2])) -> Bool)(((a : Cart[Real, 2]), (b : Cart[Real, 2])), ((c : Cart[Real, 2]), (d : Cart[Real, 2]))) == ((op_dollar(a, 1) - op_dollar(b, 1)) * (op_dollar(c, 2) - op_dollar(d, 2)) == (op_dollar(a, 2) - op_dollar(b, 2)) * (op_dollar(c, 1) - op_dollar(d, 1)))")))
}

///|
let parallel_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("parallel")

///|
/// `parallel`
pub fn parallel() -> @kernel.Thm {
  parallel_c.get()
}

///|
/// collinear3
fn step_36() -> Unit raise {
  collinear3_c.set(@pair.new_definition(@term_syntax.parse_term("(collinear3 : (Cart[Real, 2], Cart[Real, 2], Cart[Real, 2]) -> Bool)((a : Cart[Real, 2]), (b : Cart[Real, 2]), (c : Cart[Real, 2])) == parallel((a, b), (a, c))")))
}

///|
let collinear3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("collinear3")

///|
/// `collinear3`
pub fn collinear3() -> @kernel.Thm {
  collinear3_c.get()
}

///|
/// is_intersection
fn step_37() -> Unit raise {
  is_intersection_c.set(@pair.new_definition(@term_syntax.parse_term("(is_intersection : (Cart[Real, 2], (Cart[Real, 2], Cart[Real, 2]), (Cart[Real, 2], Cart[Real, 2])) -> Bool)((p : Cart[Real, 2]), ((a : Cart[Real, 2]), (b : Cart[Real, 2])), ((c : Cart[Real, 2]), (d : Cart[Real, 2]))) == (collinear3(a, p, b) && collinear3(c, p, d))")))
}

///|
let is_intersection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("is_intersection")

///|
/// `is_intersection`
pub fn is_intersection() -> @kernel.Thm {
  is_intersection_c.get()
}

///|
/// on_circle
fn step_38() -> Unit raise {
  on_circle_c.set(@pair.new_definition(@term_syntax.parse_term("(on_circle : (Cart[Real, 2], (Cart[Real, 2], Cart[Real, 2])) -> Bool)((x : Cart[Real, 2]), ((centre : Cart[Real, 2]), (pt : Cart[Real, 2]))) == (length((centre, x)) == length((centre, pt)))")))
}

///|
let on_circle_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("on_circle")

///|
/// `on_circle`
pub fn on_circle() -> @kernel.Thm {
  on_circle_c.get()
}

///|
/// SQRT_CASES_LEMMA
fn step_39() -> Unit raise {
  let t634 = @simp.rewrite_tac(@list.List([@equal.gsym(@realarith.real_pow_2()), @calc_int.real_pow_neg(), @calc_num.arith()]))
  let t632 = @bool.gen_all(@real.pow_2_sqrt())
  let t633 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("-(y : Real)"), t632))
  let t630 = @bool.gen_all(@real.pow_2_sqrt())
  let t631 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(y : Real)"), t630))
  let t629 = @simp.rewrite_tac(@list.List([@realarith.real_pow_2(), @realarith.real_le_square()]))
  let t628 = @tactics.disch_then(fn(x627 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x624 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s625 = @tactics.subst1_tac(x624)
      fn(x626 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s625(x626)
      }
    })(@equal.sym(x627))
  })
  let t635 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t628), t629), t631), t633), t634), @calc_rat.real_arith_tac)
  sqrt_cases_lemma_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, ∀ y : Real, pow(y, 2) == x → real_of_num(0) <= x && (sqrt(x) == y || sqrt(x) == -y)"), t635))
}

///|
let sqrt_cases_lemma_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("SQRT_CASES_LEMMA")

///|
/// `SQRT_CASES_LEMMA`
pub fn sqrt_cases_lemma() -> @kernel.Thm {
  sqrt_cases_lemma_c.get()
}

///|
/// RADICAL_LINEAR_EQUATION
fn step_40() -> Unit raise {
  let t643 = @tactics.conv_tac(@calc_rat.real_field)
  let t642 = @tactics.repeat_tac(@tactics.pop_assum(fn(x639 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s640 = @tactics.mp_tac(x639)
    fn(x641 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s640(x641)
    }
  }))
  let t638 = @tactics.subgoal_then(@term_syntax.parse_term("!((a : Real) == real_of_num(0)) && (x : Real) == -(b : Real) / a"), fn(x636 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x636
    @simp.asm_simp_tac(@list.List([th, radical_rules_v1()]))
  })
  let t644 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t638), t642), t643)
  radical_linear_equation_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ x : Real, radical(a) && radical(b) && !(a == real_of_num(0) && b == real_of_num(0)) && a * x + b == real_of_num(0) → radical(x)"), t644))
}

///|
let radical_linear_equation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_LINEAR_EQUATION")

///|
/// `RADICAL_LINEAR_EQUATION`
pub fn radical_linear_equation() -> @kernel.Thm {
  radical_linear_equation_c.get()
}

///|
/// RADICAL_SIMULTANEOUS_LINEAR_EQUATION
fn step_41() -> Unit raise {
  let t650 = @simp.asm_simp_tac(@list.List([radical_rules_v1()]))
  let t649 = @tactics.conv_tac(@calc_rat.real_field)
  let t651 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x646 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s647 = @tactics.mp_tac(x646)
    fn(x648 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s647(x648)
    }
  })), t649), t650])
  let t645 = @tactics.subgoal_then(@term_syntax.parse_term("!((a : Real) * (e : Real) - (b : Real) * (d : Real) == real_of_num(0)) && (x : Real) == (e * (c : Real) - b * (f : Real)) / (a * e - b * d) && (y : Real) == (a * f - d * c) / (a * e - b * d)"), @tactics.strip_assume_tac)
  let t652 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t645), t651)
  radical_simultaneous_linear_equation_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, ∀ e : Real, ∀ f : Real, ∀ x : Real, radical(a) && radical(b) && radical(c) && radical(d) && radical(e) && radical(f) && !(a * e == b * d && a * f == c * d && e * c == b * f) && a * x + b * (y : Real) == c && d * x + e * y == f → radical(x) && radical(y)"), t652))
}

///|
let radical_simultaneous_linear_equation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_SIMULTANEOUS_LINEAR_EQUATION")

///|
/// `RADICAL_SIMULTANEOUS_LINEAR_EQUATION`
pub fn radical_simultaneous_linear_equation() -> @kernel.Thm {
  radical_simultaneous_linear_equation_c.get()
}

///|
/// RADICAL_QUADRATIC_EQUATION
fn step_42() -> Unit raise {
  let t674 = @simp.asm_rewrite_tac(@list.List([]))
  let t673 = @simp.asm_rewrite_tac(@list.List([]))
  let t672 = @tactics.exists_tac(@term_syntax.parse_term("(b : Real) + sqrt(pow(b, 2) - real_of_num(4) * ((a : Real) * (c : Real)))"))
  let t675 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.strip_tac, @list.List([@tactics.exists_tac(@term_syntax.parse_term("(b : Real) - sqrt(pow(b, 2) - real_of_num(4) * ((a : Real) * (c : Real)))")), t672])), t673), radical_tac), t674)
  let t671 = @tactics.conv_tac(@calc_rat.real_ring)
  let t670 = @tactics.first_x_assum(fn(x669 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x666 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s667 = @tactics.mp_tac(x666)
      fn(x668 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s667(x668)
      }
    })(@equal.sym(x669))
  })
  let t665 = @tactics.match_mp_tac(sqrt_cases_lemma())
  let t664 = @simp.rewrite_tac(@list.List([@real.real_eq_neg2()]))
  let t676 = @list.List([@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@simp.rewrite_tac(@list.List([@realax.real_sub(), @calc_rat.real_arith(@term_syntax.parse_term("((a : Real) + ((b : Real) + (c : Real)) == real_of_num(0)) == (c == -(a + b))"))])), t664), t665), t670), t671), t675])
  let t663 = @tactics.subgoal_then(@term_syntax.parse_term("real_of_num(0) <= pow((b : Real), 2) - real_of_num(4) * ((a : Real) * (c : Real)) && (real_of_num(2) * a * (x : Real) + (b - sqrt(pow(b, 2) - real_of_num(4) * (a * c))) == real_of_num(0) || real_of_num(2) * a * x + (b + sqrt(pow(b, 2) - real_of_num(4) * (a * c))) == real_of_num(0))"), fn(x660 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s661 = @tactics.mp_tac(x660)
    fn(x662 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s661(x662)
    }
  })
  let t659 = @simp.asm_simp_tac(@list.List([radical_rules_v1(), @realarith.real_entire(), @realax.real_of_num_eq(), @calc_num.arith_eq()]))
  let t658 = @tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * (a : Real)"))
  let t657 = @tactics.match_mp_tac(radical_linear_equation())
  let t655 = @meson.meson_tac(@list.List([radical_linear_equation()]))
  let t656 = @list.List([@tactics.then_tac(@simp.asm_rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @realax.real_add_lid()])), t655), @tactics.all_tac])
  let t654 = @simp.asm_rewrite_tac(@list.List([]))
  let t653 = @class.asm_cases_tac(@term_syntax.parse_term("(a : Real) == real_of_num(0)"))
  let t677 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t653), t654), t656), @tactics.strip_tac), t657), t658), t659), t663), t676)
  radical_quadratic_equation_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ x : Real, radical(a) && radical(b) && radical(c) && a * pow(x, 2) + (b * x + c) == real_of_num(0) && !(a == real_of_num(0) && b == real_of_num(0) && c == real_of_num(0)) → radical(x)"), t677))
}

///|
let radical_quadratic_equation_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_QUADRATIC_EQUATION")

///|
/// `RADICAL_QUADRATIC_EQUATION`
pub fn radical_quadratic_equation() -> @kernel.Thm {
  radical_quadratic_equation_c.get()
}

///|
/// RADICAL_SIMULTANEOUS_LINEAR_QUADRATIC
fn step_43() -> Unit raise {
  let t694 = @tactics.conv_tac(@calc_rat.real_ring)
  let t693 = @tactics.repeat_tac(@tactics.pop_assum(fn(x690 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s691 = @tactics.mp_tac(x690)
    fn(x692 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s691(x692)
    }
  }))
  let t689 = @simp.rewrite_tac(@list.List([@real.real_sos_eq_0()]))
  let t687 = @tactics.conv_tac(@calc_rat.real_ring)
  let t688 = @list.List([@tactics.then_tac(@tactics.repeat_tac(@tactics.pop_assum(fn(x684 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s685 = @tactics.mp_tac(x684)
    fn(x686 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s685(x686)
    }
  })), t687), @tactics.all_tac])
  let t695 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.replicate_tac(3, @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(radical_tac, @simp.asm_rewrite_tac(@list.List([]))), @tactics.all_tac]))), @tactics.conj_tac), t688), t689), t693), t694)
  let t681 = @tactics.exists_tac(@term_syntax.parse_term("pow((a : Real), 2) * pow((d : Real), 2) + (pow((b : Real), 2) * pow(d, 2) + (pow((f : Real), 2) - (c : Real) * pow(d, 2) - real_of_num(2) * (a * (d * f))))"))
  let t682 = @tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * ((a : Real) * ((d : Real) * (e : Real))) - real_of_num(2) * ((b : Real) * pow(d, 2)) - real_of_num(2) * ((f : Real) * e)")), t681)
  let t680 = @tactics.exists_tac(@term_syntax.parse_term("pow((b : Real), 2) * pow((e : Real), 2) + (pow((a : Real), 2) * pow(e, 2) + (pow((f : Real), 2) - (c : Real) * pow(e, 2) - real_of_num(2) * (b * (e * f))))"))
  let t683 = @list.List([@tactics.then_tac(@tactics.exists_tac(@term_syntax.parse_term("real_of_num(2) * ((b : Real) * ((d : Real) * (e : Real))) - real_of_num(2) * ((a : Real) * pow(e, 2)) - real_of_num(2) * (d * (f : Real))")), t680), t682])
  let t679 = @tactics.disch_then(@tactics.match_mp_tac)
  let t678 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("pow((d : Real), 2) + pow((e : Real), 2)"), radical_quadratic_equation()))
  let t696 = @tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.strip_tac), t678), t679), t683), t695)
  radical_simultaneous_linear_quadratic_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, ∀ e : Real, ∀ f : Real, ∀ x : Real, radical(a) && radical(b) && radical(c) && radical(d) && radical(e) && radical(f) && !(d == real_of_num(0) && e == real_of_num(0) && f == real_of_num(0)) && pow(x - a, 2) + pow((y : Real) - b, 2) == c && d * x + e * y == f → radical(x) && radical(y)"), t696))
}

///|
let radical_simultaneous_linear_quadratic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_SIMULTANEOUS_LINEAR_QUADRATIC")

///|
/// `RADICAL_SIMULTANEOUS_LINEAR_QUADRATIC`
pub fn radical_simultaneous_linear_quadratic() -> @kernel.Thm {
  radical_simultaneous_linear_quadratic_c.get()
}

///|
/// RADICAL_SIMULTANEOUS_QUADRATIC_QUADRATIC
fn step_44() -> Unit raise {
  let t713 = @tactics.conv_tac(@calc_rat.real_ring)
  let t712 = @tactics.repeat_tac(@tactics.pop_assum(fn(x709 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s710 = @tactics.mp_tac(x709)
    fn(x711 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s710(x711)
    }
  }))
  let t708 = @tactics.replicate_tac(3, @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(radical_tac, @simp.asm_rewrite_tac(@list.List([]))), @tactics.all_tac])))
  let t707 = @simp.asm_rewrite_tac(@list.List([]))
  let t701 = @term_syntax.parse_term("pow((d : Real), 2) - pow((a : Real), 2) + (pow((e : Real), 2) - pow((b : Real), 2) + ((c : Real) - (f : Real)))")
  let t702 = @term_syntax.parse_term("real_of_num(2) * ((e : Real) - (b : Real))")
  let t703 = @term_syntax.parse_term("real_of_num(2) * ((d : Real) - (a : Real))")
  let t704 = @term_syntax.parse_term("(c : Real)")
  let t705 = @term_syntax.parse_term("(b : Real)")
  let t706 = @tactics.map_every(fn(x698 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s699 = @tactics.exists_tac(x698)
    fn(x700 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s699(x700)
    }
  }, @list.List([@term_syntax.parse_term("(a : Real)"), t705, t704, t703, t702, t701]))
  let t697 = @tactics.match_mp_tac(radical_simultaneous_linear_quadratic())
  let t714 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.strip_tac), t697), t706), t707), t708), t712), t713)
  radical_simultaneous_quadratic_quadratic_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Real, ∀ b : Real, ∀ c : Real, ∀ d : Real, ∀ e : Real, ∀ f : Real, ∀ x : Real, radical(a) && radical(b) && radical(c) && radical(d) && radical(e) && radical(f) && !(a == d && b == e && c == f) && pow(x - a, 2) + pow((y : Real) - b, 2) == c && pow(x - d, 2) + pow(y - e, 2) == f → radical(x) && radical(y)"), t714))
}

///|
let radical_simultaneous_quadratic_quadratic_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_SIMULTANEOUS_QUADRATIC_QUADRATIC")

///|
/// `RADICAL_SIMULTANEOUS_QUADRATIC_QUADRATIC`
pub fn radical_simultaneous_quadratic_quadratic() -> @kernel.Thm {
  radical_simultaneous_quadratic_quadratic_c.get()
}

///|
let constructible_rules_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("constructible_RULES")

///|
/// `constructible_RULES`
pub fn constructible_rules() -> @kernel.Thm {
  constructible_rules_c.get()
}

///|
let constructible_induct_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("constructible_INDUCT")

///|
/// `constructible_INDUCT`
pub fn constructible_induct() -> @kernel.Thm {
  constructible_induct_c.get()
}

///|
let constructible_cases_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("constructible_CASES")

///|
/// `constructible_CASES`
pub fn constructible_cases() -> @kernel.Thm {
  constructible_cases_c.get()
}

///|
/// constructible_RULES, constructible_INDUCT, constructible_CASES
fn step_45() -> Unit raise {
  let (constructible_rules, constructible_induct, constructible_cases) = @ind_defs.new_inductive_definition(@term_syntax.parse_term("(∀ x : Cart[Real, 2], rational(op_dollar(x, 1)) && rational(op_dollar(x, 2)) → (constructible : (Cart[Real, 2]) -> Bool)(x)) && (∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ d : Cart[Real, 2], ∀ x : Cart[Real, 2], constructible(a) && constructible(b) && constructible(c) && constructible(d) && !parallel((a, b), (c, d)) && is_intersection(x, (a, b), (c, d)) → constructible(x)) && (∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ d : Cart[Real, 2], ∀ e : Cart[Real, 2], ∀ x : Cart[Real, 2], constructible(a) && constructible(b) && constructible(c) && constructible(d) && constructible(e) && !(a == b) && collinear3(a, x, b) && length((c, x)) == length((d, e)) → constructible(x)) && (∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ d : Cart[Real, 2], ∀ e : Cart[Real, 2], ∀ f : Cart[Real, 2], ∀ x : Cart[Real, 2], constructible(a) && constructible(b) && constructible(c) && constructible(d) && constructible(e) && constructible(f) && !(a == d && length((b, c)) == length((e, f))) && length((a, x)) == length((b, c)) && length((d, x)) == length((e, f)) → constructible(x))"))
  constructible_rules_c.set(constructible_rules)
  constructible_induct_c.set(constructible_induct)
  constructible_cases_c.set(constructible_cases)
}

///|
/// RADICAL_LINE_LINE_INTERSECTION
fn step_46() -> Unit raise {
  let t731 = @tactics.conv_tac(@calc_rat.real_ring)
  let t730 = @tactics.repeat_tac(@tactics.pop_assum(fn(x727 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s728 = @tactics.mp_tac(x727)
    fn(x729 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s728(x729)
    }
  }))
  let t726 = @tactics.replicate_tac(6, @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(radical_tac, @simp.asm_rewrite_tac(@list.List([]))), @tactics.all_tac])))
  let t720 = @term_syntax.parse_term("op_dollar((c : Cart[Real, 2]), 2) * (op_dollar(c, 1) - op_dollar((d : Cart[Real, 2]), 1)) - op_dollar(c, 1) * (op_dollar(c, 2) - op_dollar(d, 2))")
  let t721 = @term_syntax.parse_term("op_dollar((c : Cart[Real, 2]), 1) - op_dollar((d : Cart[Real, 2]), 1)")
  let t722 = @term_syntax.parse_term("op_dollar((d : Cart[Real, 2]), 2) - op_dollar((c : Cart[Real, 2]), 2)")
  let t723 = @term_syntax.parse_term("op_dollar((a : Cart[Real, 2]), 2) * (op_dollar(a, 1) - op_dollar((b : Cart[Real, 2]), 1)) - op_dollar(a, 1) * (op_dollar(a, 2) - op_dollar(b, 2))")
  let t724 = @term_syntax.parse_term("op_dollar((a : Cart[Real, 2]), 1) - op_dollar((b : Cart[Real, 2]), 1)")
  let t725 = @tactics.map_every(fn(x717 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s718 = @tactics.exists_tac(x717)
    fn(x719 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s718(x719)
    }
  }, @list.List([@term_syntax.parse_term("op_dollar((b : Cart[Real, 2]), 2) - op_dollar((a : Cart[Real, 2]), 2)"), t724, t723, t722, t721, t720]))
  let t716 = @tactics.match_mp_tac(radical_simultaneous_linear_equation())
  let t715 = @simp.rewrite_tac(@list.List([parallel(), collinear3(), is_intersection()]))
  let t732 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t715), @tactics.strip_tac), t716), t725), t726), t730), t731)
  radical_line_line_intersection_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ d : Cart[Real, 2], ∀ x : Cart[Real, 2], radical(op_dollar(a, 1)) && radical(op_dollar(a, 2)) && radical(op_dollar(b, 1)) && radical(op_dollar(b, 2)) && radical(op_dollar(c, 1)) && radical(op_dollar(c, 2)) && radical(op_dollar(d, 1)) && radical(op_dollar(d, 2)) && !parallel((a, b), (c, d)) && is_intersection(x, (a, b), (c, d)) → radical(op_dollar(x, 1)) && radical(op_dollar(x, 2))"), t732))
}

///|
let radical_line_line_intersection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_LINE_LINE_INTERSECTION")

///|
/// `RADICAL_LINE_LINE_INTERSECTION`
pub fn radical_line_line_intersection() -> @kernel.Thm {
  radical_line_line_intersection_c.get()
}

///|
/// RADICAL_LINE_CIRCLE_INTERSECTION
fn step_47() -> Unit raise {
  let t750 = @tactics.conv_tac(@calc_rat.real_ring)
  let t749 = @tactics.repeat_tac(@tactics.pop_assum(fn(x746 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s747 = @tactics.mp_tac(x746)
    fn(x748 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s747(x748)
    }
  }))
  let t745 = @tactics.replicate_tac(6, @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(radical_tac, @simp.asm_rewrite_tac(@list.List([]))), @tactics.all_tac])))
  let t739 = @term_syntax.parse_term("op_dollar((a : Cart[Real, 2]), 2) * (op_dollar(a, 1) - op_dollar((b : Cart[Real, 2]), 1)) - op_dollar(a, 1) * (op_dollar(a, 2) - op_dollar(b, 2))")
  let t740 = @term_syntax.parse_term("op_dollar((a : Cart[Real, 2]), 1) - op_dollar((b : Cart[Real, 2]), 1)")
  let t741 = @term_syntax.parse_term("op_dollar((b : Cart[Real, 2]), 2) - op_dollar((a : Cart[Real, 2]), 2)")
  let t742 = @term_syntax.parse_term("pow(op_dollar((e : Cart[Real, 2]), 1) - op_dollar((d : Cart[Real, 2]), 1), 2) + pow(op_dollar(e, 2) - op_dollar(d, 2), 2)")
  let t743 = @term_syntax.parse_term("op_dollar((c : Cart[Real, 2]), 2)")
  let t744 = @tactics.map_every(fn(x736 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s737 = @tactics.exists_tac(x736)
    fn(x738 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s737(x738)
    }
  }, @list.List([@term_syntax.parse_term("op_dollar((c : Cart[Real, 2]), 1)"), t743, t742, t741, t740, t739]))
  let t735 = @tactics.match_mp_tac(radical_simultaneous_linear_quadratic())
  let t734 = @simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.forall_2(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @vectors.vector_sub_component(), @equal.gsym(@realarith.real_pow_2())]))
  let t733 = @simp.rewrite_tac(@list.List([length(), @vectors.norm_eq(), collinear3(), parallel()]))
  let t751 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t733), t734), @tactics.strip_tac), t735), t744), t745), t749), t750)
  radical_line_circle_intersection_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ d : Cart[Real, 2], ∀ e : Cart[Real, 2], ∀ x : Cart[Real, 2], radical(op_dollar(a, 1)) && radical(op_dollar(a, 2)) && radical(op_dollar(b, 1)) && radical(op_dollar(b, 2)) && radical(op_dollar(c, 1)) && radical(op_dollar(c, 2)) && radical(op_dollar(d, 1)) && radical(op_dollar(d, 2)) && radical(op_dollar(e, 1)) && radical(op_dollar(e, 2)) && !(a == b) && collinear3(a, x, b) && length((c, x)) == length((d, e)) → radical(op_dollar(x, 1)) && radical(op_dollar(x, 2))"), t751))
}

///|
let radical_line_circle_intersection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_LINE_CIRCLE_INTERSECTION")

///|
/// `RADICAL_LINE_CIRCLE_INTERSECTION`
pub fn radical_line_circle_intersection() -> @kernel.Thm {
  radical_line_circle_intersection_c.get()
}

///|
/// RADICAL_CIRCLE_CIRCLE_INTERSECTION
fn step_48() -> Unit raise {
  let t769 = @tactics.conv_tac(@calc_rat.real_ring)
  let t768 = @tactics.repeat_tac(@tactics.pop_assum(fn(x765 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s766 = @tactics.mp_tac(x765)
    fn(x767 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s766(x767)
    }
  }))
  let t764 = @tactics.replicate_tac(6, @tactics.thenl(@tactics.conj_tac, @list.List([@tactics.then_tac(radical_tac, @simp.asm_rewrite_tac(@list.List([]))), @tactics.all_tac])))
  let t758 = @term_syntax.parse_term("pow(op_dollar((f : Cart[Real, 2]), 1) - op_dollar((e : Cart[Real, 2]), 1), 2) + pow(op_dollar(f, 2) - op_dollar(e, 2), 2)")
  let t759 = @term_syntax.parse_term("op_dollar((d : Cart[Real, 2]), 2)")
  let t760 = @term_syntax.parse_term("op_dollar((d : Cart[Real, 2]), 1)")
  let t761 = @term_syntax.parse_term("pow(op_dollar((c : Cart[Real, 2]), 1) - op_dollar((b : Cart[Real, 2]), 1), 2) + pow(op_dollar(c, 2) - op_dollar(b, 2), 2)")
  let t762 = @term_syntax.parse_term("op_dollar((a : Cart[Real, 2]), 2)")
  let t763 = @tactics.map_every(fn(x755 : @kernel.Term) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s756 = @tactics.exists_tac(x755)
    fn(x757 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s756(x757)
    }
  }, @list.List([@term_syntax.parse_term("op_dollar((a : Cart[Real, 2]), 1)"), t762, t761, t760, t759, t758]))
  let t754 = @tactics.match_mp_tac(radical_simultaneous_quadratic_quadratic())
  let t753 = @simp.simp_tac(@list.List([@cart.cart_eq(), @vectors.forall_2(), @vectors.dot(), @vectors.sum_2(), @cart.dimindex_2(), @vectors.vector_sub_component(), @equal.gsym(@realarith.real_pow_2())]))
  let t752 = @simp.rewrite_tac(@list.List([length(), @vectors.norm_eq(), collinear3(), parallel()]))
  let t770 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), t752), t753), @tactics.strip_tac), t754), t763), t764), t768), t769)
  radical_circle_circle_intersection_c.set(@tactics.prove(@term_syntax.parse_term("∀ a : Cart[Real, 2], ∀ b : Cart[Real, 2], ∀ c : Cart[Real, 2], ∀ d : Cart[Real, 2], ∀ e : Cart[Real, 2], ∀ f : Cart[Real, 2], ∀ x : Cart[Real, 2], radical(op_dollar(a, 1)) && radical(op_dollar(a, 2)) && radical(op_dollar(b, 1)) && radical(op_dollar(b, 2)) && radical(op_dollar(c, 1)) && radical(op_dollar(c, 2)) && radical(op_dollar(d, 1)) && radical(op_dollar(d, 2)) && radical(op_dollar(e, 1)) && radical(op_dollar(e, 2)) && radical(op_dollar(f, 1)) && radical(op_dollar(f, 2)) && length((a, x)) == length((b, c)) && length((d, x)) == length((e, f)) && !(a == d && length((b, c)) == length((e, f))) → radical(op_dollar(x, 1)) && radical(op_dollar(x, 2))"), t770))
}

///|
let radical_circle_circle_intersection_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("RADICAL_CIRCLE_CIRCLE_INTERSECTION")

///|
/// `RADICAL_CIRCLE_CIRCLE_INTERSECTION`
pub fn radical_circle_circle_intersection() -> @kernel.Thm {
  radical_circle_circle_intersection_c.get()
}

///|
/// CONSTRUCTIBLE_RADICAL
fn step_49() -> Unit raise {
  let t775 = @meson.asm_meson_tac(@list.List([]))
  let t776 = @tactics.then_tac(@tactics.match_mp_tac(radical_circle_circle_intersection()), t775)
  let t774 = @meson.asm_meson_tac(@list.List([]))
  let t777 = @tactics.then_tac(@tactics.match_mp_tac(radical_line_circle_intersection()), t774)
  let t773 = @meson.asm_meson_tac(@list.List([]))
  let t778 = @tactics.then_tac(@tactics.match_mp_tac(radical_line_line_intersection()), t773)
  let t779 = @list.List([@simp.asm_simp_tac(@list.List([radical_rules_v1()])), t778, t777, t776])
  let t772 = @tactics.repeat_tac(@tactics.gen_tac)
  let t771 = @tactics.repeat_tac(@tactics.conj_tac)
  let t780 = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(constructible_induct()), t771), t772), @tactics.strip_tac), t779)
  constructible_radical_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Cart[Real, 2], constructible(x) → radical(op_dollar(x, 1)) && radical(op_dollar(x, 2))"), t780))
}

///|
let constructible_radical_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("CONSTRUCTIBLE_RADICAL")

///|
/// `CONSTRUCTIBLE_RADICAL`
pub fn constructible_radical() -> @kernel.Thm {
  constructible_radical_c.get()
}

///|
/// DOUBLE_THE_CUBE_ALGEBRA
fn step_50() -> Unit raise {
  let t806 = @simp.rewrite_tac(@list.List([@calc_num.num_conv(@term_syntax.parse_term("3")), @arith.exp_mono_le(), @nums.not_suc()]))
  let t805 = @tactics.match_mp_tac(@int.arith_rule(@term_syntax.parse_term("EXP((n : Num), 3) <= EXP(1, 3) || EXP(2, 3) <= EXP(n, 3) → !(EXP(n, 3) == 2)")))
  let t804 = @simp.rewrite_tac(@list.List([@calc_int.real_abs_num(), @calc_int.real_of_num_pow(), @realax.real_of_num_eq()]))
  let t800 = @simp.rewrite_rule(@list.List([@int.integer()]))
  let t801 = @tactics.choose_then(fn(x797 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s798 = @tactics.subst1_tac(x797)
    fn(x799 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s798(x799)
    }
  })
  let t803 = @tactics.first_x_assum(fn(x802 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t801(t800(x802))
  })
  let t796 = @simp.rewrite_tac(@list.List([@real.real_abs_pow()]))
  let t792 = @term_syntax.parse_term("real_abs")
  let t795 = @tactics.first_x_assum(fn(x794 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x789 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s790 = @tactics.mp_tac(x789)
      fn(x791 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s790(x791)
      }
    })(((x793 : @kernel.Thm) => @equal.ap_term(t792, x793))(x794))
  })
  let t788 = @tactics.pop_assum_list(fn(x787 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t786 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t785 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_sub()), @realarith.real_sub_0()]))
  let t784 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @realax.real_add_lid()]))
  let t783 = @simp.simp_tac(@list.List([@floor.integer_closed(), @class.not_imp()]))
  let t781 = @term_syntax.parse_term("-real_of_num(2)")
  let t782 = @term_syntax.parse_term("real_of_num(0)")
  let t807 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(0)"), t782, t781]), cubic_root_integer()))), t783), t784), t785), @tactics.conj_tac), t786), t788), @tactics.strip_tac), t795), t796), t803), t804), t805), t806), @int.arith_tac)
  double_the_cube_algebra_c.set(@tactics.prove(@term_syntax.parse_term("!(∃ x : Real, radical(x) && pow(x, 3) == real_of_num(2))"), t807))
}

///|
let double_the_cube_algebra_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOUBLE_THE_CUBE_ALGEBRA")

///|
/// `DOUBLE_THE_CUBE_ALGEBRA`
pub fn double_the_cube_algebra() -> @kernel.Thm {
  double_the_cube_algebra_c.get()
}

///|
/// DOUBLE_THE_CUBE
fn step_51() -> Unit raise {
  let t815 = @meson.asm_meson_tac(@list.List([double_the_cube_algebra()]))
  let t814 = @simp.rewrite_tac(@list.List([@vectors.vector_2(), radical_rules_v1()]))
  let t811 = @drule.match_mp(constructible_radical())
  let t813 = @tactics.disch_then(fn(x812 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x808 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s809 = @tactics.mp_tac(x808)
      fn(x810 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s809(x810)
      }
    })(t811(x812))
  })
  let t816 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_tac), t813), t814), t815)
  double_the_cube_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, pow(x, 3) == real_of_num(2) → !constructible(vector([x, real_of_num(0)]))"), t816))
}

///|
let double_the_cube_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DOUBLE_THE_CUBE")

///|
/// `DOUBLE_THE_CUBE`
pub fn double_the_cube() -> @kernel.Thm {
  double_the_cube_c.get()
}

///|
/// COS_TRIPLE
fn step_52() -> Unit raise {
  let t818 = @tactics.conv_tac(@calc_rat.real_ring)
  let t817 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("(x : Real)"), @transcendentals.sin_circle()))
  let t819 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(3) * (x : Real) == x + (x + x)")), @transcendentals.sin_add(), @transcendentals.cos_add()]))), t817), t818)
  cos_triple_c.set(@tactics.prove(@term_syntax.parse_term("∀ x : Real, cos(real_of_num(3) * x) == real_of_num(4) * pow(cos(x), 3) - real_of_num(3) * cos(x)"), t819))
}

///|
let cos_triple_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COS_TRIPLE")

///|
/// `COS_TRIPLE`
pub fn cos_triple() -> @kernel.Thm {
  cos_triple_c.get()
}

///|
/// COS_PI3
fn step_53() -> Unit raise {
  let t830 = @tactics.mp_tac(@transcendentals.pi_pos())
  let t829 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("pi / real_of_num(3)"), @transcendentals.cos_pos_pi()))
  let t828 = @tactics.disch_then(@tactics.disj_cases_then2(fn(x822 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s823 = @tactics.accept_tac(x822)
    fn(x824 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s823(x824)
    }
  }, fn(x825 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s826 = @tactics.mp_tac(x825)
    fn(x827 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s826(x827)
    }
  }))
  let t821 = @simp.rewrite_tac(@list.List([@calc_rat.real_ring(@term_syntax.parse_term("(-real_of_num(1) == real_of_num(4) * pow((c : Real), 3) - real_of_num(3) * c) == (c == real_of_num(1) / real_of_num(2) || c == -real_of_num(1))"))]))
  let t820 = @simp.simp_tac(@list.List([@real.real_div_lmul(), @realax.real_of_num_eq(), @calc_num.arith(), @transcendentals.cos_pi()]))
  let t831 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.mp_tac(@bool.spec(@term_syntax.parse_term("pi / real_of_num(3)"), cos_triple())), t820), t821), t828), t829), t830), @calc_rat.real_arith_tac)
  cos_pi3_c.set(@tactics.prove(@term_syntax.parse_term("cos(pi / real_of_num(3)) == real_of_num(1) / real_of_num(2)"), t831))
}

///|
let cos_pi3_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("COS_PI3")

///|
/// `COS_PI3`
pub fn cos_pi3() -> @kernel.Thm {
  cos_pi3_c.get()
}

///|
/// TRISECT_60_DEGREES_ALGEBRA
fn step_54() -> Unit raise {
  let t865 = @simp.rewrite_tac(@list.List([@realax.real_of_num_add(), @realax.real_of_num_mul(), @calc_int.real_of_num_pow(), @calc_int.real_abs_num(), @realax.real_of_num_eq(), @arith.mult_eq_1()]))
  let t864 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("pow(real_of_num(2) + (m : Real), 2) - real_of_num(3) == pow(m, 2) + (real_of_num(4) * m + real_of_num(1))"))]))
  let t863 = @simp.rewrite_tac(@list.List([@equal.gsym(@realax.real_of_num_add())]))
  let t862 = @tactics.conv_tac(@calc_rat.real_rat_reduce_conv)
  let t860 = @int.arith_rule(@term_syntax.parse_term("(n : Num) == 0 || n == 1 || n == 2 + (n - 2)"))
  let t861 = @tactics.repeat_tcl(@tactics.disj_cases_then)(fn(x857 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s858 = @tactics.subst1_tac(x857)
    fn(x859 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s858(x859)
    }
  })(t860)
  let t853 = @simp.rewrite_rule(@list.List([@int.integer()]))
  let t854 = @tactics.choose_then(fn(x850 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let s851 = @tactics.subst1_tac(x850)
    fn(x852 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
      s851(x852)
    }
  })
  let t856 = @tactics.first_x_assum(fn(x855 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    t854(t853(x855))
  })
  let t849 = @simp.once_rewrite_tac(@list.List([@equal.gsym(@real.real_pow2_abs())]))
  let t848 = @simp.rewrite_tac(@list.List([@real.real_abs_mul(), @calc_int.real_abs_num()]))
  let t844 = @term_syntax.parse_term("real_abs")
  let t847 = @tactics.first_x_assum(fn(x846 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x841 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s842 = @tactics.mp_tac(x841)
      fn(x843 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s842(x843)
      }
    })(((x845 : @kernel.Thm) => @equal.ap_term(t844, x845))(x846))
  })
  let t840 = @tactics.pop_assum_list(fn(x839 : @list.List[@kernel.Thm]) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    @tactics.all_tac
  })
  let t838 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(pow((x : Real), 3) - real_of_num(3) * x - real_of_num(1) == real_of_num(0)) == (x * (pow(x, 2) - real_of_num(3)) == real_of_num(1))"))]))
  let t837 = @list.List([@meson.asm_meson_tac(@list.List([])), @tactics.all_tac])
  let t836 = @simp.rewrite_tac(@list.List([@calc_int.real_mul_lzero(), @calc_int.real_add_rid(), @calc_int.real_mul_lneg(), @equal.gsym(@realax.real_sub())]))
  let t835 = @simp.rewrite_tac(@list.List([@realax.real_add_assoc()]))
  let t834 = @simp.simp_tac(@list.List([@floor.integer_closed(), @class.not_imp()]))
  let t832 = @term_syntax.parse_term("-real_of_num(1)")
  let t833 = @term_syntax.parse_term("-real_of_num(3)")
  let t866 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.strip_tac, @tactics.mp_tac(@bool.specl(@list.List([@term_syntax.parse_term("real_of_num(0)"), t833, t832]), cubic_root_integer()))), t834), t835), t836), @tactics.conj_tac), t837), t838), t840), @tactics.strip_tac), t847), t848), t849), t856), t861), t862), t863), t864), t865), @int.arith_tac)
  trisect_60_degrees_algebra_c.set(@tactics.prove(@term_syntax.parse_term("!(∃ x : Real, radical(x) && pow(x, 3) - real_of_num(3) * x - real_of_num(1) == real_of_num(0))"), t866))
}

///|
let trisect_60_degrees_algebra_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRISECT_60_DEGREES_ALGEBRA")

///|
/// `TRISECT_60_DEGREES_ALGEBRA`
pub fn trisect_60_degrees_algebra() -> @kernel.Thm {
  trisect_60_degrees_algebra_c.get()
}

///|
/// TRISECT_60_DEGREES
fn step_55() -> Unit raise {
  let t881 = @meson.asm_meson_tac(@list.List([trisect_60_degrees_algebra(), radical_rules_v1()]))
  let t880 = @simp.rewrite_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("(real_of_num(1) / real_of_num(2) == real_of_num(4) * pow((c : Real), 3) - real_of_num(3) * c) == (pow(real_of_num(2) * c, 3) - real_of_num(3) * (real_of_num(2) * c) - real_of_num(1) == real_of_num(0))"))]))
  let t879 = @simp.simp_tac(@list.List([@calc_rat.real_arith(@term_syntax.parse_term("real_of_num(3) * ((x : Real) / real_of_num(9)) == x / real_of_num(3)")), cos_pi3()]))
  let t878 = @tactics.mp_tac(@bool.spec(@term_syntax.parse_term("pi / real_of_num(9)"), cos_triple()))
  let t877 = @simp.rewrite_tac(@list.List([@vectors.vector_2()]))
  let t876 = @tactics.disch_then(fn(x875 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x872 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s873 = @tactics.mp_tac(x872)
      fn(x874 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s873(x874)
      }
    })(@bool.conjunct1(x875))
  })
  let t870 = @drule.match_mp(constructible_radical())
  let t882 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.gen_tac, @tactics.disch_then(fn(x871 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    (fn(x867 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s868 = @tactics.mp_tac(x867)
      fn(x869 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s868(x869)
      }
    })(t870(x871))
  })), t876), t877), @tactics.disch_tac), t878), t879), t880), t881)
  trisect_60_degrees_c.set(@tactics.prove(@term_syntax.parse_term("∀ y : Real, !constructible(vector([cos(pi / real_of_num(9)), y]))"), t882))
}

///|
let trisect_60_degrees_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("TRISECT_60_DEGREES")

///|
/// `TRISECT_60_DEGREES`
pub fn trisect_60_degrees() -> @kernel.Thm {
  trisect_60_degrees_c.get()
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
}
