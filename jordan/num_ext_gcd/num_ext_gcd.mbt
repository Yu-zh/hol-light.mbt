// Translated from upstream Jordan/num_ext_gcd.ml; edit this file directly.

///|
/// Jordan/num_ext_gcd.ml:13
fn step_1() -> Unit raise {
  @parse_ext_override_interface.prioritize_num(())
}

///|
/// DIVIDE
fn step_2() -> Unit raise {
  divide_c.set(@pair.new_definition(@term_syntax.parse_term("(DIVIDE : (Num, Num) -> Bool)((a : Num), (b : Num)) == (∃ m : Num, b == m * a)")))
}

///|
let divide_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDE")

///|
/// `DIVIDE`
pub fn divide() -> @kernel.Thm {
  divide_c.get()
}

///|
/// Jordan/num_ext_gcd.ml:17
fn step_3() -> Unit raise {
  @printer.parse_as_infix("||", (16L, "right"))
}

///|
/// Jordan/num_ext_gcd.ml:19
fn step_4() -> Unit raise {
  @preterm.override_interface("||", @term_syntax.parse_term("DIVIDE"))
}

///|
/// `DIV_TAC`
pub fn div_tac(x1 : @kernel.Term) -> @tactics.Tactic raise {
  let t = x1
  let t3 = @tactics.try_tac(@tactics.exists_tac(t))
  let t4 = @tactics.repeat_tac(@tactics.first_x_assum(@tactics.choose_tac))
  @tactics.every(@list.List([@tactics_ext.rep_gen_tac, @simp.rewrite_tac(@list.List([divide()])), @tactics_ext.disch_all_tac, t4, t3]))
}

///|
/// DIVIDE_DIVIDE
fn step_5() -> Unit raise {
  let t5 = @simp.asm_rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t6 = @list.List([div_tac(@term_syntax.parse_term("(m' : Num) * (m : Num)")), t5])
  divide_divide_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ c : Num, DIVIDE(a, b) && DIVIDE(b, c) → DIVIDE(a, c)"), t6))
}

///|
let divide_divide_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDE_DIVIDE")

///|
/// `DIVIDE_DIVIDE`
pub fn divide_divide() -> @kernel.Thm {
  divide_divide_c.get()
}

///|
/// DIVIDE_EQ
fn step_6() -> Unit raise {
  let t18 = @tactics.disch_then(fn(x16 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_2 = x16
    @tactics.then_tac(@simp.rewrite_tac(@list.List([@bool.conjunct2(th_2)])), @int.arith_tac)
  })
  let t19 = @tactics.disch_then(fn(x13 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th_1 = x13
    let t15 = @equal.gsym(th_1)
    @tactics.mp_tac(@simp.rewrite_rule(@list.List([@arith.mult_eq_1()]))(t15))
  })
  let t20 = @simp.asm_rewrite_tac(@list.List([@arith.mult_assoc(), @arith.eq_mult_rcancel()]))
  let t21 = @simp.rewrite_tac(@list.List([@int.arith_rule(@term_syntax.parse_term("((b : Num) == (m : Num) * ((m' : Num) * b)) == (1 * b == m * (m' * b))"))]))
  let t22 = @simp.asm_rewrite_tac(@list.List([]))
  let t23 = @class.asm_cases_tac(@term_syntax.parse_term("(b : Num) == 0"))
  let t24 = @tactics.first_x_assum(fn(x7 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x7
    let t12 = @simp.rewrite_tac(@list.List([th]))
    @tactics.then_tac(@tactics.pop_assum(fn(x9 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
      let s10 = @tactics.mp_tac(x9)
      fn(x11 : (@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise {
        s10(x11)
      }
    }), t12)
  })
  let t25 = @list.List([div_tac(@term_syntax.parse_term("1")), t24, t23, t22, @int.arith_tac, t21, t20, t19, t18])
  divide_eq_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, DIVIDE(a, b) && DIVIDE(b, a) → a == b"), t25))
}

///|
let divide_eq_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDE_EQ")

///|
/// `DIVIDE_EQ`
pub fn divide_eq() -> @kernel.Thm {
  divide_eq_c.get()
}

///|
/// DIVIDE_SUM
fn step_7() -> Unit raise {
  let t26 = @simp.asm_rewrite_tac(@list.List([@calc_num.arith(), @arith.right_add_distrib()]))
  let t27 = @list.List([div_tac(@term_syntax.parse_term("(m : Num) + (m' : Num)")), t26])
  divide_sum_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ h : Num, DIVIDE(h, a) && DIVIDE(h, b) → DIVIDE(h, a + b)"), t27))
}

///|
let divide_sum_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDE_SUM")

///|
/// `DIVIDE_SUM`
pub fn divide_sum() -> @kernel.Thm {
  divide_sum_c.get()
}

///|
/// DIVIDE_SUMMAND
fn step_8() -> Unit raise {
  let t30 = @tactics.repeat_tac(@tactics.first_x_assum(fn(x28 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let th = x28
    @simp.rewrite_tac(@list.List([@equal.gsym(th)]))
  }))
  let t31 = @simp.rewrite_tac(@list.List([@arith.right_sub_distrib()]))
  let t32 = @list.List([div_tac(@term_syntax.parse_term("(m' : Num) - (m : Num)")), t31, t30, @int.arith_tac])
  divide_summand_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ h : Num, DIVIDE(h, b) && DIVIDE(h, a + b) → DIVIDE(h, a)"), t32))
}

///|
let divide_summand_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDE_SUMMAND")

///|
/// `DIVIDE_SUMMAND`
pub fn divide_summand() -> @kernel.Thm {
  divide_summand_c.get()
}

///|
/// DIVIDE_PROD
fn step_9() -> Unit raise {
  let t33 = @simp.asm_rewrite_tac(@list.List([@arith.mult_assoc()]))
  let t34 = @list.List([div_tac(@term_syntax.parse_term("(b : Num) * (m : Num)")), t33])
  divide_prod_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ h : Num, DIVIDE(h, a) → DIVIDE(h, b * a)"), t34))
}

///|
let divide_prod_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDE_PROD")

///|
/// `DIVIDE_PROD`
pub fn divide_prod() -> @kernel.Thm {
  divide_prod_c.get()
}

///|
/// DIVIDE_PROD2
fn step_10() -> Unit raise {
  let t35 = @simp.asm_rewrite_tac(@list.List([@arith.mult_ac()]))
  let t36 = @list.List([div_tac(@term_syntax.parse_term("(b : Num) * (m : Num)")), t35])
  divide_prod2_c.set(@tactics_refine.prove_by_refinement(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ h : Num, DIVIDE(h, a) → DIVIDE(h, a * b)"), t36))
}

///|
let divide_prod2_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("DIVIDE_PROD2")

///|
/// `DIVIDE_PROD2`
pub fn divide_prod2() -> @kernel.Thm {
  divide_prod2_c.get()
}

///|
/// GCD
fn step_11() -> Unit raise {
  gcd_c.set(@pair.new_definition(@term_syntax.parse_term("(GCD : (Num, Num) -> Num)((a : Num), (b : Num)) == select((g : Num) => DIVIDE(g, a) && DIVIDE(g, b) && (∀ h : Num, DIVIDE(h, a) && DIVIDE(h, b) → DIVIDE(h, g)))")))
}

///|
let gcd_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("GCD")

///|
/// `GCD`
pub fn gcd() -> @kernel.Thm {
  gcd_c.get()
}

///|
/// gcd_certificate
fn step_12() -> Unit raise {
  let t39 = @tactics.match_mp_tac(@class.select_unique())
  let t38 = @simp.rewrite_tac(@list.List([gcd()]))
  let t37 = @tactics.repeat_tac(@tactics.pop_assum(@tactics.choose_tac))
  let tac1 : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.repeat_tac(@tactics.gen_tac), @tactics.disch_tac), t37), t38), t39), @tactics.beta_tac), @tactics.gen_tac), @tactics.eq_tac)
  let ygbranch : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.match_mp_tac(divide_eq())), @tactics.conj_tac)
  let t40 = @tactics.asm_tac(@meson.meson_tac)(@list.List([divide_summand()]))
  let t41 = @list.List([@tactics.asm_tac(@meson.meson_tac)(@list.List([divide_sum(), divide_prod()])), t40])
  let ydivg_branch : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.thenl(@tactics_ext.subgoal_tac(@term_syntax.parse_term("DIVIDE((y : Num), (r : Num) * (a : Num) + (s : Num) * (b : Num)) && DIVIDE(y, (r' : Num) * a + (s' : Num) * b)")), t41)
  let t45 = @tactics.asm_tac(@meson.meson_tac)(@list.List([]))
  let t44 = @simp.rewrite_tac(@list.List([divide()]))
  let t43 = @tactics.pop_assum(@tactics.match_mp_tac)
  let t42 = @tactics_ext.taut_tac(@term_syntax.parse_term("((A : Bool) → (B : Bool)) → (C : Bool) && (D : Bool) && A → B"))
  let gdivy_branch : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.undisch_tac(@term_syntax.parse_term("DIVIDE((y : Num), (a : Num)) && DIVIDE(y, (b : Num)) && (∀ h : Num, DIVIDE(h, a) && DIVIDE(h, b) → DIVIDE(h, y))")), t42), @tactics.disch_tac), t43), t44), @tactics.conj_tac), t45)
  let t51 = @tactics.asm_tac(@meson.meson_tac)(@list.List([divide_summand()]))
  let t52 = @list.List([@tactics.asm_tac(@meson.meson_tac)(@list.List([divide_sum(), divide_prod()])), t51])
  let t50 = @tactics_ext.subgoal_tac(@term_syntax.parse_term("DIVIDE((h : Num), (r : Num) * (a : Num) + (s : Num) * (b : Num)) && DIVIDE(h, (r' : Num) * a + (s' : Num) * b)"))
  let t49 = @list.List([@tactics.asm_tac(@meson.meson_tac)(@list.List([divide()])), @tactics.all_tac])
  let t48 = @list.List([@tactics.asm_tac(@meson.meson_tac)(@list.List([divide()])), @tactics.all_tac])
  let x : (@kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise = fn(x46 : @kernel.Thm) -> (((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise) raise {
    let t = x46
    @simp.rewrite_tac(@list.List([t]))
  }
  let yghyp_branch : ((@list.List[(String, @kernel.Thm)], @kernel.Term)) -> ((@list.List[@kernel.Term], (@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)])), @list.List[(@list.List[(String, @kernel.Thm)], @kernel.Term)], ((@list.List[(Int64, @kernel.Term)], @list.List[(@kernel.Term, @kernel.Term)], @list.List[(@kernel.HolType, @kernel.HolType)]), @list.List[@kernel.Thm]) -> @kernel.Thm raise) raise = @tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.thenl(@tactics.then_tac(@tactics.then_tac(@tactics.disch_tac, @tactics.pop_assum(x)), @tactics.conj_tac), t48), @tactics.conj_tac), t49), @tactics.gen_tac), @tactics.disch_tac), t50), t52)
  let t53 = @tactics.thenl(tac1, @list.List([@tactics.thenl(ygbranch, @list.List([ydivg_branch, gdivy_branch])), yghyp_branch]))
  gcd_certificate_c.set(@tactics_refine.prove(@term_syntax.parse_term("∀ a : Num, ∀ b : Num, ∀ g : Num, (∃ r : Num, ∃ s : Num, ∃ r' : Num, ∃ s' : Num, ∃ a' : Num, ∃ b' : Num, a == a' * g && b == b' * g && g + (r' * a + s' * b) == r * a + s * b) → GCD(a, b) == g"), t53))
}

///|
let gcd_certificate_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gcd_certificate")

///|
/// `gcd_certificate`
pub fn gcd_certificate() -> @kernel.Thm {
  gcd_certificate_c.get()
}

///|
/// `gcd_num`
pub fn gcd_num_v1(x54 : @num.Num, x55 : @num.Num) -> ((@num.Num, @num.Num, @num.Num)) raise {
  let x1 = x54
  let x2 = x55
  fn gcd_data(x56 : @num.Num, x57 : @num.Num, x58 : @num.Num, x59 : @num.Num, x60 : @num.Num, x61 : @num.Num) -> ((@num.Num, @num.Num, @num.Num)) raise {
    let (a1, b1, x1_1, a2, b2, x2_1) = (x56, x57, x58, x59, x60, x61)
    if (@lib.compare(x1_1, @num.num_of_int64(0L)) < 0) {
      let t62 = @num.minus_num(x1_1)
      let t63 = @num.minus_num(b1)
      gcd_data(@num.minus_num(a1), t63, t62, a2, b2, x2_1)
    } else {
      if (@lib.compare(x2_1, @num.num_of_int64(0L)) < 0) {
        let t64 = @num.minus_num(x2_1)
        let t65 = @num.minus_num(b2)
        gcd_data(a1, b1, x1_1, @num.minus_num(a2), t65, t64)
      } else {
        if (x1_1 == @num.num_of_int64(0L)) {
          (a2, b2, x2_1)
        } else {
          if (@lib.compare(x1_1, x2_1) > 0) {
            gcd_data(a2, b2, x2_1, a1, b1, x1_1)
          } else {
            let r = @num.quo_num(x2_1, x1_1)
            let t66 = @num.sub_num(x2_1, @num.mult_num(r, x1_1))
            let t67 = @num.sub_num(b2, @num.mult_num(r, b1))
            gcd_data(a1, b1, x1_1, @num.sub_num(a2, @num.mult_num(r, a1)), t67, t66)
          }
        }
      }
    }
  }
  let t68 = @num.num_of_int64(1L)
  let t69 = @num.num_of_int64(0L)
  let t70 = @num.num_of_int64(0L)
  gcd_data(@num.num_of_int64(1L), t70, x1, t69, t68, x2)
}

///|
/// `gcd_num`
pub fn gcd_num(x71 : @num.Num, x72 : @num.Num) -> ((@num.Num, @num.Num, @num.Num)) raise {
  let x1 = x71
  let x2 = x72
  fn gcd_data(x73 : @num.Num, x74 : @num.Num, x75 : @num.Num, x76 : @num.Num, x77 : @num.Num, x78 : @num.Num) -> ((@num.Num, @num.Num, @num.Num)) raise {
    let (a1, b1, x1_1, a2, b2, x2_1) = (x73, x74, x75, x76, x77, x78)
    if (@lib.compare(x1_1, @num.num_of_int64(0L)) < 0) {
      let t79 = @num.minus_num(x1_1)
      let t80 = @num.minus_num(b1)
      gcd_data(@num.minus_num(a1), t80, t79, a2, b2, x2_1)
    } else {
      if (@lib.compare(x2_1, @num.num_of_int64(0L)) < 0) {
        let t81 = @num.minus_num(x2_1)
        let t82 = @num.minus_num(b2)
        gcd_data(a1, b1, x1_1, @num.minus_num(a2), t82, t81)
      } else {
        if (x1_1 == @num.num_of_int64(0L)) {
          (a2, b2, x2_1)
        } else {
          if (@lib.compare(x1_1, x2_1) > 0) {
            gcd_data(a2, b2, x2_1, a1, b1, x1_1)
          } else {
            let r = @num.quo_num(x2_1, x1_1)
            let t83 = @num.sub_num(x2_1, @num.mult_num(r, x1_1))
            let t84 = @num.sub_num(b2, @num.mult_num(r, b1))
            gcd_data(a1, b1, x1_1, @num.sub_num(a2, @num.mult_num(r, a1)), t84, t83)
          }
        }
      }
    }
  }
  let t85 = @num.num_of_int64(1L)
  let t86 = @num.num_of_int64(0L)
  let t87 = @num.num_of_int64(0L)
  gcd_data(@num.num_of_int64(1L), t87, x1, t86, t85, x2)
}

///|
/// `gcd_numdata`
pub fn gcd_numdata(x88 : @num.Num, x89 : @num.Num) -> ((@num.Num, @num.Num, @num.Num, @num.Num, @num.Num, @num.Num, @num.Num, @num.Num, @num.Num)) raise {
  let a = x88
  let b = x89
  let a_1 = @num.abs_num(a)
  let b_1 = @num.abs_num(b)
  let z = @num.num_of_int64(0L)
  let (r, s, g) = gcd_num(a_1, b_1)
  let a_p = if (g == z) {
    z
  } else {
    @num.round_num(@num.div_num(a_1, g))
  }
  let b_p = if (g == z) {
    z
  } else {
    @num.round_num(@num.div_num(b_1, g))
  }
  let _ = if !((a_1 == @num.mult_num(a_p, g))) {
    raise Failure("GCD_CONV a")
  } else {
    0L
  }
  let _ = if !((b_1 == @num.mult_num(b_p, g))) {
    raise Failure("GCD_CONV b")
  } else {
    0L
  }
  let t90 = @num.mult_num(s, b_1)
  let _ = if !((g == @num.add_num(@num.mult_num(r, a_1), t90))) {
    raise Failure("GCD_CONV g")
  } else {
    0L
  }
  let (r1, r1_p) = if @num.gt_num(r, z) {
    (r, z)
  } else {
    (z, @num.minus_num(r))
  }
  let (s1, s1_p) = if @num.gt_num(s, z) {
    (s, z)
  } else {
    (z, @num.minus_num(s))
  }
  (g, a_1, b_1, a_p, b_p, r1_p, s1_p, r1, s1)
}

///|
/// `GCD_CONV`
pub fn gcd_conv(x91 : @kernel.Term, x92 : @kernel.Term) -> @kernel.Thm raise {
  let at = x91
  let bt = x92
  let a = @basics.dest_numeral(at)
  let b = @basics.dest_numeral(bt)
  let (g, a_1, b_1, a_p, b_p, r1_p, s1_p, r1, s1) = gcd_numdata(a, b)
  let t100 = @tactics.exists_tac(@nums.mk_numeral(b_p))
  let t99 = @tactics.exists_tac(@nums.mk_numeral(a_p))
  let t98 = @tactics.exists_tac(@nums.mk_numeral(s1_p))
  let t97 = @tactics.exists_tac(@nums.mk_numeral(r1_p))
  let t96 = @tactics.exists_tac(@nums.mk_numeral(s1))
  let t95 = @tactics.exists_tac(@nums.mk_numeral(r1))
  let t101 = @tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.then_tac(@tactics.match_mp_tac(gcd_certificate()), t95), t96), t97), t98), t99), t100), @int.arith_tac)
  let t94 = ", " + @num.string_of_num(b_1) + ") == " + @num.string_of_num(g)
  @tactics_refine.prove(@term_syntax.parse_term("GCD(" + @num.string_of_num(a_1) + t94), t101)
}

///|
/// `hol_gcd`
pub fn hol_gcd(x102 : Int64, x103 : Int64) -> @kernel.Thm raise {
  let a = x102
  let b = x103
  let t104 = @nums.mk_small_numeral(b)
  gcd_conv(@nums.mk_small_numeral(a), t104)
}

///|
/// Jordan/num_ext_gcd.ml:211
fn step_13() -> Unit raise {
  @preterm.remove_interface("||")
}

///|
/// Jordan/num_ext_gcd.ml:212
fn step_14() -> Unit raise {
  @parse_ext_override_interface.pop_priority(())
}

///|
/// `exception Test_suite_num_ext_gcd`
pub(all) suberror Test_suite_num_ext_gcd {
  Test_suite_num_ext_gcd(String)
}

///|
/// `test_num_ext_gcd`
pub fn test_num_ext_gcd(x105 : Int64, x106 : Int64) -> Unit raise {
  let (a, b) = (x105, x106)
  let a1 = Int64::to_string(@lib.abs63(a))
  let b1 = Int64::to_string(@lib.abs63(b))
  let c = @lib.gcd(a, b)
  let c1 = Int64::to_string(@lib.abs63(c))
  let t107 = @nums.mk_small_numeral(b)
  let th = gcd_conv(@nums.mk_small_numeral(a), t107)
  if !@list.List::is_empty(@kernel.hyp(th)) {
    raise Failure(("num_ext_gcd test suite failure " + (a1 + (" " + b1))))
  } else {
    let t108 = @term_syntax.parse_term("GCD(" + a1 + ", " + b1 + ") == " + c1)
    if !((@kernel.concl(th) == t108)) {
      raise Failure(("num_ext_gcd test suite failure " + (a1 + (" " + b1))))
    } else {
      ()
    }
  }
}

///|
/// test_suite_num_ext_gcd
fn step_15() -> Unit raise {
  let _ = @lib.map(fn(x109 : (Int64, Int64)) -> Unit raise {
    test_num_ext_gcd(x109.0, x109.1)
  }, @list.List([(0L, 0L), (0L, 1L), (1L, 0L), (0L, 0L), (2L, 3L), (4L, 6L), (0L, 2L), (2L, 0L), (10L, 100L), (100L, 10L), (17L, 100L), (100L, 17L)]))
  test_suite_num_ext_gcd_c.set(@pp.std_formatter.print_string("num_ext_gcd loaded\n"))
}

///|
let test_suite_num_ext_gcd_c : @lib.Cell[Unit] = @lib.Cell::new("test_suite_num_ext_gcd")

///|
/// `test_suite_num_ext_gcd`
pub fn test_suite_num_ext_gcd() -> Unit {
  test_suite_num_ext_gcd_c.get()
}

///|
/// divide
fn step_16() -> Unit raise {
  divide_v1_c.set(divide())
}

///|
let divide_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("divide")

///|
/// `divide`
pub fn divide_v1() -> @kernel.Thm {
  divide_v1_c.get()
}

///|
/// gcd
fn step_17() -> Unit raise {
  gcd_v1_c.set(gcd())
}

///|
let gcd_v1_c : @lib.Cell[@kernel.Thm] = @lib.Cell::new("gcd")

///|
/// `gcd`
pub fn gcd_v1() -> @kernel.Thm {
  gcd_v1_c.get()
}

///|
/// gcd_conv
fn step_18() -> Unit raise {
  gcd_conv_v1_c.set(fn(x110 : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
    fn(x111 : @kernel.Term) -> @kernel.Thm raise {
      gcd_conv(x110, x111)
    }
  })
}

///|
let gcd_conv_v1_c : @lib.Cell[(@kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise] = @lib.Cell::new("gcd_conv")

///|
/// `gcd_conv`
pub fn gcd_conv_v1(x : @kernel.Term) -> ((@kernel.Term) -> @kernel.Thm raise) raise {
  (gcd_conv_v1_c.get())(x)
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
}
